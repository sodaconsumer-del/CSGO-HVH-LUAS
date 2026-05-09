--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = "rage>aimbot>general>maximum fov"
slot_0_1_0 = "rage>aimbot>general>aimbot"
slot_0_2_0 = "legit>weapon>general>trigger>triggerbot"
slot_0_3_0 = 0.0001
slot_0_4_0 = nil
slot_0_5_0 = nil
slot_0_6_0 = nil
slot_0_7_0 = 0
slot_0_8_0 = nil
slot_0_9_0 = gui.checkbox(gui.control_id("f_script_master_enable"))
slot_0_10_0 = gui.checkbox(gui.control_id("f_master_rage_enable"))
slot_0_11_0 = gui.checkbox(gui.control_id("f_fov_enable"))
slot_0_12_0 = gui.slider(gui.control_id("f_fov_value"), 0, 180, {
        "%.2f"
}, 0.01)
slot_0_13_0 = gui.checkbox(gui.control_id("f_fov_reader_enable"))
slot_0_14_0 = gui.slider(gui.control_id("f_fov_pos_x"), 0, 4096, {
        "%.0f"
}, 1)
slot_0_15_0 = gui.slider(gui.control_id("f_fov_pos_y"), 0, 4096, {
        "%.0f"
}, 1)
slot_0_16_0 = gui.slider(gui.control_id("f_mode_pos_x"), 0, 4096, {
        "%.0f"
}, 1)
slot_0_17_0 = gui.slider(gui.control_id("f_mode_pos_y"), 0, 4096, {
        "%.0f"
}, 1)
slot_0_18_0 = gui.checkbox(gui.control_id("f_mode_text_enable"))
slot_0_19_12 = gui.ctx:find("lua>elements a") or gui.ctx:find("lua>elements") or gui.ctx

if slot_0_19_12 and slot_0_19_12.add then
        slot_0_19_12:add(gui.make_control("Master Switch", slot_0_9_0))
        slot_0_19_12:add(gui.make_control("RageBot", slot_0_10_0))
        slot_0_19_12:add(gui.make_control("Enable Force FOV", slot_0_11_0))
        slot_0_19_12:add(gui.make_control("Forced FOV (deg)", slot_0_12_0))
        slot_0_19_12:add(gui.make_control("FOV Reader", slot_0_13_0))
        slot_0_19_12:add(gui.make_control("FOV Text X", slot_0_14_0))
        slot_0_19_12:add(gui.make_control("FOV Text Y", slot_0_15_0))
        slot_0_19_12:add(gui.make_control("Show Mode Text", slot_0_18_0))
        slot_0_19_12:add(gui.make_control("Mode Text X", slot_0_16_0))
        slot_0_19_12:add(gui.make_control("Mode Text Y", slot_0_17_0))

        if slot_0_19_12.reset then
                slot_0_19_12:reset()
        end
end

slot_0_19_11 = nil
slot_0_19_10 = slot_0_9_0 and slot_0_9_0:get_value()

if slot_0_19_10 and slot_0_19_10.set then
        slot_0_19_10:set(true)
end

slot_0_19_9 = slot_0_10_0 and slot_0_10_0:get_value()

if slot_0_19_9 and slot_0_19_9.set then
        slot_0_19_9:set(false)
end

slot_0_19_8 = slot_0_11_0 and slot_0_11_0:get_value()

if slot_0_19_8 and slot_0_19_8.set then
        slot_0_19_8:set(true)
end

slot_0_19_7 = slot_0_12_0 and slot_0_12_0:get_value()

if slot_0_19_7 and slot_0_19_7.set then
        slot_0_19_7:set(0.45)
end

slot_0_19_6 = slot_0_13_0 and slot_0_13_0:get_value()

if slot_0_19_6 and slot_0_19_6.set then
        slot_0_19_6:set(true)
end

slot_0_19_5 = slot_0_14_0 and slot_0_14_0:get_value()

if slot_0_19_5 and slot_0_19_5.set then
        slot_0_19_5:set(50)
end

slot_0_19_4 = slot_0_15_0 and slot_0_15_0:get_value()

if slot_0_19_4 and slot_0_19_4.set then
        slot_0_19_4:set(50)
end

slot_0_19_3 = slot_0_18_0 and slot_0_18_0:get_value()

if slot_0_19_3 and slot_0_19_3.set then
        slot_0_19_3:set(true)
end

slot_0_19_2 = slot_0_16_0 and slot_0_16_0:get_value()

if slot_0_19_2 and slot_0_19_2.set then
        slot_0_19_2:set(50)
end

slot_0_19_1 = slot_0_17_0 and slot_0_17_0:get_value()

if slot_0_19_1 and slot_0_19_1.set then
        slot_0_19_1:set(70)
end

function slot_0_19_0(arg_1_0)
        if arg_1_0 and arg_1_0.get_hotkey_state and arg_1_0.disable_hotkeys and arg_1_0:get_hotkey_state() then
                arg_1_0:disable_hotkeys()
        end
end

function slot_0_20_0(arg_2_0, arg_2_1)
        if not arg_2_0 or not arg_2_0.get_value then
                return
        end

        local var_2_0 = arg_2_0:get_value()

        if not var_2_0 then
                return
        end

        slot_0_19_0(var_2_0)

        if var_2_0.get and var_2_0.set and var_2_0:get() ~= arg_2_1 then
                var_2_0:set(arg_2_1)
        end
end

function slot_0_21_0(arg_3_0)
        if not arg_3_0 or not arg_3_0.get_value then
                return nil
        end

        local var_3_0 = arg_3_0:get_value()

        if not var_3_0 or not var_3_0.get then
                return nil
        end

        return var_3_0:get()
end

function slot_0_22_0(arg_4_0)
        if not slot_0_6_0 or not slot_0_6_0.get_value then
                return
        end

        local var_4_0 = slot_0_6_0:get_value()

        if not var_4_0 then
                return
        end

        slot_0_19_0(var_4_0)

        if var_4_0.set then
                var_4_0:set(arg_4_0)
        end
end

events.present_queue:add(function()
        if not slot_0_4_0 then
                slot_0_4_0 = gui.ctx:find(slot_0_1_0)
        end

        if not slot_0_5_0 then
                slot_0_5_0 = gui.ctx:find(slot_0_2_0)
        end

        if not slot_0_6_0 then
                slot_0_6_0 = gui.ctx:find(slot_0_0_0)
        end

        slot_5_0_0 = slot_0_9_0 and slot_0_9_0:get_value()

        if not (slot_5_0_0 and slot_5_0_0.get and slot_5_0_0:get()) then
                slot_0_20_0(slot_0_4_0, false)
                slot_0_20_0(slot_0_5_0, false)

                return
        end

        slot_5_2_0 = slot_0_10_0 and slot_0_10_0:get_value()

        if slot_5_2_0 and slot_5_2_0.get then
                slot_5_3_1 = slot_5_2_0:get()

                slot_0_20_0(slot_0_4_0, slot_5_3_1)
                slot_0_20_0(slot_0_5_0, not slot_5_3_1)
        end

        slot_5_3_0 = slot_0_11_0 and slot_0_11_0:get_value()
        slot_5_4_0 = slot_0_12_0 and slot_0_12_0:get_value()

        if slot_5_3_0 and slot_5_4_0 and slot_5_3_0.get and slot_5_4_0.get and slot_5_3_0:get() then
                slot_0_22_0(slot_5_4_0:get())
        end

        slot_5_5_0 = slot_0_13_0 and slot_0_13_0:get_value() and slot_0_13_0:get_value():get()

        if slot_5_5_0 and slot_0_6_0 and slot_0_6_0.get_value then
                slot_5_6_1 = slot_0_6_0:get_value()

                if slot_5_6_1 and slot_5_6_1.get then
                        slot_5_7_1 = slot_5_6_1:get()

                        if slot_0_8_0 == nil or math.abs(slot_5_7_1 - slot_0_8_0) > slot_0_3_0 then
                                slot_0_7_0 = slot_5_7_1
                                slot_0_8_0 = slot_5_7_1

                                print(string.format("[fovmon] Rage FOV changed -> %.3f", slot_0_7_0))
                        end
                end
        end

        slot_5_6_0 = draw.surface

        if draw.fonts and draw.fonts.gui_main then
                slot_5_6_0.font = draw.fonts.gui_main
        end

        slot_5_7_0 = nil

        if draw.color and draw.color.white then
                slot_5_7_0 = draw.color.white()
        elseif type(draw.color) == "function" then
                slot_5_7_0 = draw.color(255, 255, 255, 255)
        end

        slot_5_8_0 = slot_0_21_0(slot_0_14_0) or 50
        slot_5_9_0 = slot_0_21_0(slot_0_15_0) or 50
        slot_5_10_0 = slot_0_21_0(slot_0_16_0) or 50
        slot_5_11_0 = slot_0_21_0(slot_0_17_0) or 70
        slot_5_12_0 = slot_0_18_0 and slot_0_18_0:get_value() and slot_0_18_0:get_value():get()
        slot_5_13_0 = slot_5_2_0 and slot_5_2_0.get and slot_5_2_0:get() and "Mode: Rage" or "Mode: Trigger"

        if slot_5_7_0 then
                if slot_5_5_0 then
                        slot_5_6_0:add_text(draw.vec2(slot_5_8_0, slot_5_9_0), string.format("Ragebot FOV:%.3f", slot_0_7_0), slot_5_7_0)
                end

                if slot_5_12_0 then
                        slot_5_6_0:add_text(draw.vec2(slot_5_10_0, slot_5_11_0), slot_5_13_0, slot_5_7_0)
                end
        else
                if slot_5_5_0 then
                        slot_5_6_0:add_text(draw.vec2(slot_5_8_0, slot_5_9_0), string.format("Ragebot FOV: %.3f", slot_0_7_0))
                end

                if slot_5_12_0 then
                        slot_5_6_0:add_text(draw.vec2(slot_5_10_0, slot_5_11_0), slot_5_13_0)
                end
        end
end)
