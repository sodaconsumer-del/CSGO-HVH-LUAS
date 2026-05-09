--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements a")
slot_0_1_0 = gui.color_picker(gui.control_id("circles_color"))

slot_0_0_0:add(gui.make_control("Circle color", slot_0_1_0))

slot_0_2_0 = gui.slider(gui.control_id("circles_radius"), 6, 30)
slot_0_3_0 = gui.slider(gui.control_id("circles_offset"), 20, 120)
slot_0_4_0 = gui.slider(gui.control_id("circles_speed"), 4, 24)

slot_0_0_0:add(gui.make_control("Circle radius", slot_0_2_0))
slot_0_0_0:add(gui.make_control("Circle offset", slot_0_3_0))
slot_0_0_0:add(gui.make_control("Circle anim speed", slot_0_4_0))
slot_0_0_0:reset()

function slot_0_5_0(arg_1_0, arg_1_1, arg_1_2)
        return math.max(math.min(arg_1_0, arg_1_2), arg_1_1)
end

function slot_0_6_0(arg_2_0, arg_2_1, arg_2_2)
        return math.lerp(arg_2_0, arg_2_1, slot_0_5_0(arg_2_2, 0, 1))
end

function slot_0_7_0(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
        local var_3_0 = slot_0_5_0(arg_3_2 * arg_3_3, 0, 1)

        return slot_0_6_0(arg_3_0, arg_3_1, var_3_0)
end

slot_0_8_0 = 0
slot_0_9_0 = 0
slot_0_10_0 = 0
slot_0_11_0 = 0

function slot_0_12_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
        local var_4_0 = math.floor(arg_4_4:get_a() * arg_4_5)
        local var_4_1 = 20

        for iter_4_0 = 1, var_4_1 do
                local var_4_2 = iter_4_0 / var_4_1
                local var_4_3 = arg_4_3 * (1 - (iter_4_0 - 1) / var_4_1)
                local var_4_4 = math.floor(var_4_0 * (var_4_2 * var_4_2))
                local var_4_5 = draw.color(arg_4_4:get_r(), arg_4_4:get_g(), arg_4_4:get_b(), var_4_4)

                arg_4_0:add_circle_filled(draw.vec2(arg_4_1, arg_4_2), var_4_3, var_4_5, 0, 1)
        end
end

function slot_0_13_0()
        if not game.engine:in_game() then
                return
        end

        local var_5_0 = draw.surface
        local var_5_1, var_5_2 = game.engine:get_screen_size()
        local var_5_3 = var_5_1 * 0.5
        local var_5_4 = var_5_2 * 0.5
        local var_5_5 = game.global_vars.frame_time

        if not var_5_5 or var_5_5 <= 0 then
                var_5_5 = 0.016666666666666666
        end

        local var_5_6 = slot_0_2_0:get_value():get()
        local var_5_7 = slot_0_3_0:get_value():get()
        local var_5_8 = slot_0_4_0:get_value():get()
        local var_5_9 = slot_0_1_0:get_value():get()
        local var_5_10 = gui.ctx:find("rage>anti-aim>angles>manual override>override left"):get_value():get() and 1 or 0
        local var_5_11 = gui.ctx:find("rage>anti-aim>angles>manual override>override right"):get_value():get() and 1 or 0
        local var_5_12 = gui.ctx:find("rage>anti-aim>angles>manual override>override back"):get_value():get() and 1 or 0
        local var_5_13 = gui.ctx:find("rage>anti-aim>angles>manual override>override forward"):get_value():get() and 1 or 0

        slot_0_8_0 = slot_0_7_0(slot_0_8_0, var_5_10, var_5_8, var_5_5)
        slot_0_9_0 = slot_0_7_0(slot_0_9_0, var_5_11, var_5_8, var_5_5)
        anim_back = slot_0_7_0(anim_back, var_5_12, var_5_8, var_5_5)
        anim_forward = slot_0_7_0(anim_forward, var_5_13, var_5_8, var_5_5)

        local var_5_14 = 0.02

        if var_5_14 < slot_0_8_0 then
                slot_0_12_0(var_5_0, var_5_3 - var_5_7, var_5_4, var_5_6, var_5_9, slot_0_8_0)
        end

        if var_5_14 < slot_0_9_0 then
                slot_0_12_0(var_5_0, var_5_3 + var_5_7, var_5_4, var_5_6, var_5_9, slot_0_9_0)
        end

        if var_5_14 < anim_back then
                slot_0_12_0(var_5_0, var_5_3, var_5_4 + var_5_7, var_5_6, var_5_9, anim_back)
        end

        if var_5_14 < anim_forward then
                slot_0_12_0(var_5_0, var_5_3, var_5_4 - var_5_7, var_5_6, var_5_9, anim_forward)
        end
end

events.present_queue:add(slot_0_13_0)
