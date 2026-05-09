--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = "Advanched Anti-AFK"
slot_0_1_0 = "v1"
slot_0_2_0 = gui.ctx:find("lua>elements a")
slot_0_3_0 = gui.checkbox(gui.control_id("afk_enable"))
slot_0_4_0 = gui.checkbox(gui.control_id("afk_mouse"))
slot_0_5_0 = gui.checkbox(gui.control_id("afk_move"))
slot_0_6_0 = gui.checkbox(gui.control_id("afk_view"))
slot_0_7_0 = gui.checkbox(gui.control_id("afk_smooth"))
slot_0_8_0 = gui.slider(gui.control_id("afk_view_int"), 1, 1000, {
        "%.0f"
}, 1)
slot_0_9_0 = gui.slider(gui.control_id("afk_interval"), 5, 300, {
        "%.0f"
}, 1)
slot_0_10_0 = gui.slider(gui.control_id("afk_move_int"), 0, 100, {
        "%.0f%%"
}, 1)
slot_0_11_0 = gui.checkbox(gui.control_id("afk_norm"))
slot_0_12_0 = gui.checkbox(gui.control_id("afk_walk"))
slot_0_13_0 = gui.checkbox(gui.control_id("afk_micro"))
slot_0_14_0 = gui.checkbox(gui.control_id("afk_circle"))
slot_0_15_0 = gui.slider(gui.control_id("afk_crouch"), 0, 100, {
        "%.0f%%"
}, 1)
slot_0_16_0 = gui.slider(gui.control_id("afk_jump"), 0, 100, {
        "%.0f%%"
}, 1)
slot_0_17_0 = gui.make_control("Enable Anti-AFK", slot_0_3_0)
slot_0_18_0 = gui.make_control("Mouse movement", slot_0_4_0)
slot_0_19_0 = gui.make_control("Interval (ticks)", slot_0_9_0)
slot_0_20_0 = gui.make_control("View rotation", slot_0_6_0)
slot_0_21_0 = gui.make_control("Smooth rotation", slot_0_7_0)
slot_0_22_0 = gui.make_control("Rotation intensity", slot_0_8_0)
slot_0_23_0 = gui.make_control("Movement", slot_0_5_0)
slot_0_24_0 = gui.make_control("Movement intensity", slot_0_10_0)
slot_0_25_0 = gui.make_control("Normal WASD", slot_0_11_0)
slot_0_26_0 = gui.make_control("Walk (Shift)", slot_0_12_0)
slot_0_27_0 = gui.make_control("Micro movement", slot_0_13_0)
slot_0_28_0 = gui.make_control("Circle strafe", slot_0_14_0)
slot_0_29_0 = gui.make_control("Crouch chance", slot_0_15_0)
slot_0_30_0 = gui.make_control("Jump chance", slot_0_16_0)

slot_0_2_0:add(slot_0_17_0)
slot_0_2_0:add(slot_0_18_0)
slot_0_2_0:add(slot_0_19_0)
slot_0_2_0:add(slot_0_20_0)
slot_0_2_0:add(slot_0_21_0)
slot_0_2_0:add(slot_0_22_0)
slot_0_2_0:add(slot_0_23_0)
slot_0_2_0:add(slot_0_24_0)
slot_0_2_0:add(slot_0_25_0)
slot_0_2_0:add(slot_0_26_0)
slot_0_2_0:add(slot_0_27_0)
slot_0_2_0:add(slot_0_28_0)
slot_0_2_0:add(slot_0_29_0)
slot_0_2_0:add(slot_0_30_0)
slot_0_2_0:reset()

function slot_0_31_0()
        local var_1_0 = slot_0_3_0:get_value():get()
        local var_1_1 = var_1_0 and slot_0_4_0:get_value():get()
        local var_1_2 = var_1_0 and slot_0_5_0:get_value():get()
        local var_1_3 = var_1_1 and slot_0_6_0:get_value():get()

        slot_0_18_0:set_visible(var_1_0)
        slot_0_19_0:set_visible(var_1_1)
        slot_0_20_0:set_visible(var_1_1)
        slot_0_21_0:set_visible(var_1_3)
        slot_0_22_0:set_visible(var_1_3)
        slot_0_23_0:set_visible(var_1_0)
        slot_0_24_0:set_visible(var_1_2)
        slot_0_25_0:set_visible(var_1_2)
        slot_0_26_0:set_visible(var_1_2)
        slot_0_27_0:set_visible(var_1_2)
        slot_0_28_0:set_visible(var_1_2)
        slot_0_29_0:set_visible(var_1_2)
        slot_0_30_0:set_visible(var_1_2)
end

slot_0_3_0:add_callback(slot_0_31_0)
slot_0_4_0:add_callback(slot_0_31_0)
slot_0_6_0:add_callback(slot_0_31_0)
slot_0_5_0:add_callback(slot_0_31_0)
slot_0_31_0()

function slot_0_32_0(arg_2_0, arg_2_1)
        math.randomseed(game.global_vars.tick_count + game.global_vars.frame_count)

        return math.random(arg_2_0, arg_2_1)
end

function slot_0_33_0(arg_3_0)
        return arg_3_0 >= slot_0_32_0(1, 100)
end

function slot_0_34_0(arg_4_0)
        return (1 - math.cos(arg_4_0 * math.pi)) * 0.5
end

slot_0_35_0 = {
        input_bit_mask.in_forward,
        input_bit_mask.in_back,
        input_bit_mask.in_moveleft,
        input_bit_mask.in_moveright
}
slot_0_36_0 = 0
slot_0_37_0 = {
        cp = 0,
        cy = 0,
        p = 0,
        d = 0,
        pitch = 0,
        yaw = 0,
        active = false
}
slot_0_38_0 = {
        crouch = false,
        sdir = 1,
        ang = 0,
        p = 0,
        d = 0,
        dir = 0,
        jump = false,
        active = false
}

events.frame_stage_notify:add(function(arg_5_0)
        if arg_5_0 ~= 5 then
                return
        end

        if not slot_0_3_0:get_value():get() then
                return
        end

        slot_5_1_0 = game.global_vars.tick_count

        if slot_0_9_0:get_value():get() > slot_5_1_0 - slot_0_36_0 then
                return
        end

        slot_0_36_0 = slot_5_1_0

        if slot_0_4_0:get_value():get() and slot_0_6_0:get_value():get() and not slot_0_37_0.active then
                slot_5_3_1 = slot_0_8_0:get_value():get()
                slot_0_37_0.yaw = slot_0_32_0(-slot_5_3_1, slot_5_3_1)
                slot_0_37_0.pitch = slot_0_32_0(-slot_5_3_1 / 2, slot_5_3_1 / 2)
                slot_0_37_0.d = slot_0_32_0(30, 60)
                slot_0_37_0.p = 0
                slot_0_37_0.cy = 0
                slot_0_37_0.cp = 0
                slot_0_37_0.active = true
        end

        if not slot_0_5_0:get_value():get() then
                return
        end

        if slot_0_38_0.active then
                return
        end

        if not slot_0_33_0(slot_0_10_0:get_value():get()) then
                return
        end

        slot_5_3_0 = {}

        if slot_0_11_0:get_value():get() then
                table.insert(slot_5_3_0, "norm")
        end

        if slot_0_12_0:get_value():get() then
                table.insert(slot_5_3_0, "walk")
        end

        if slot_0_13_0:get_value():get() then
                table.insert(slot_5_3_0, "micro")
        end

        if slot_0_14_0:get_value():get() then
                table.insert(slot_5_3_0, "circle")
        end

        if #slot_5_3_0 == 0 then
                return
        end

        slot_0_38_0.type = slot_5_3_0[slot_0_32_0(1, #slot_5_3_0)]
        slot_0_38_0.dir = slot_0_32_0(1, 4)
        slot_0_38_0.crouch = slot_0_33_0(slot_0_15_0:get_value():get())
        slot_0_38_0.jump = slot_0_33_0(slot_0_16_0:get_value():get())
        slot_0_38_0.ang = 0
        slot_0_38_0.sdir = slot_0_32_0(0, 1) == 1 and 1 or -1

        if slot_0_38_0.type == "norm" then
                slot_0_38_0.d = slot_0_32_0(15, 30)
        elseif slot_0_38_0.type == "walk" then
                slot_0_38_0.d = slot_0_32_0(30, 60)
        elseif slot_0_38_0.type == "micro" then
                slot_0_38_0.d = slot_0_32_0(4, 10)
        elseif slot_0_38_0.type == "circle" then
                slot_0_38_0.d = slot_0_32_0(30, 60)
        end

        slot_0_38_0.p = 0
        slot_0_38_0.active = true
end)
events.override_view:add(function(arg_6_0)
        if not slot_0_3_0:get_value():get() or not slot_0_4_0:get_value():get() or not slot_0_37_0.active then
                return
        end

        local var_6_0 = slot_0_37_0.p / slot_0_37_0.d
        local var_6_1 = slot_0_7_0:get_value():get() and slot_0_34_0(var_6_0) or var_6_0
        local var_6_2 = slot_0_37_0.yaw * var_6_1
        local var_6_3 = slot_0_37_0.pitch * var_6_1

        arg_6_0.view.y = arg_6_0.view.y + (var_6_2 - slot_0_37_0.cy)
        arg_6_0.view.x = arg_6_0.view.x + (var_6_3 - slot_0_37_0.cp)
        slot_0_37_0.cy = var_6_2
        slot_0_37_0.cp = var_6_3
        slot_0_37_0.p = slot_0_37_0.p + 1

        if slot_0_37_0.p >= slot_0_37_0.d then
                slot_0_37_0.active = false
        end
end)
events.create_move:add(function(arg_7_0)
        if not slot_0_38_0.active then
                return
        end

        arg_7_0:set_forwardmove(0)
        arg_7_0:set_leftmove(0)

        if slot_0_38_0.type == "circle" then
                slot_0_38_0.ang = slot_0_38_0.ang + 5 * slot_0_38_0.sdir

                arg_7_0:set_forwardmove(1)
                arg_7_0:set_button(input_bit_mask.in_forward)
                arg_7_0:rotate_movement(arg_7_0:get_viewangles().y + slot_0_38_0.ang)
        else
                local var_7_0 = slot_0_35_0[slot_0_38_0.dir]

                arg_7_0:set_button(var_7_0)

                if var_7_0 == input_bit_mask.in_forward then
                        arg_7_0:set_forwardmove(1)
                elseif var_7_0 == input_bit_mask.in_back then
                        arg_7_0:set_forwardmove(-1)
                elseif var_7_0 == input_bit_mask.in_moveleft then
                        arg_7_0:set_leftmove(-1)
                elseif var_7_0 == input_bit_mask.in_moveright then
                        arg_7_0:set_leftmove(1)
                end
        end

        if slot_0_38_0.type == "walk" then
                arg_7_0:set_button(input_bit_mask.in_speed)
        end

        if slot_0_38_0.crouch then
                arg_7_0:set_button(input_bit_mask.in_duck)
        end

        if slot_0_38_0.jump and slot_0_38_0.p < 2 then
                arg_7_0:set_button(input_bit_mask.in_jump)
        end

        slot_0_38_0.p = slot_0_38_0.p + 1

        if slot_0_38_0.p >= slot_0_38_0.d then
                slot_0_38_0.active = false
                slot_0_38_0.type = nil
        end
end)
gui.notify:add(gui.notification(slot_0_0_0, slot_0_1_0 .. " loaded"))
print("[" .. slot_0_0_0 .. "] " .. slot_0_1_0)
