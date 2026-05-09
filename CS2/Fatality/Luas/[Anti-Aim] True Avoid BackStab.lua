--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        avoidBackStab = gui.checkbox(gui.control_id("rage>anti-aim>lua>avoid-backstab")),
        antiaim = gui.ctx:find("rage>anti-aim>angles>anti-aim"),
        antiaimPitch = gui.ctx:find("rage>anti-aim>angles>pitch"),
        antiaimYaw = gui.ctx:find("rage>anti-aim>angles>yaw"),
        antiaimYawBase = gui.ctx:find("rage>anti-aim>angles>yaw base"),
        antiaimYawAngle = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")
}
slot_0_1_0 = {
        avoidBackStab = gui.make_control("Avoid BackStab", slot_0_0_0.avoidBackStab)
}
slot_0_2_0 = {
        saved = false,
        pitch = slot_0_0_0.antiaimPitch:get_value():get():get_raw(),
        yaw = slot_0_0_0.antiaimYaw:get_value():get():get_raw(),
        base = slot_0_0_0.antiaimYawBase:get_value():get():get_raw(),
        angle = slot_0_0_0.antiaimYawAngle:get_value():get()
}
slot_0_3_0 = gui.ctx:find("rage>anti-aim>angles")

slot_0_3_0:add(slot_0_1_0.avoidBackStab)
slot_0_3_0:reset()

function slot_0_4_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
        local var_1_0 = arg_1_2 - arg_1_0
        local var_1_1 = arg_1_3 - arg_1_1

        return math.sqrt(var_1_0 * var_1_0 + var_1_1 * var_1_1)
end

function slot_0_5_0(arg_2_0)
        return math.sqrt(arg_2_0.x^2 + arg_2_0.y^2)
end

events.create_move:add(function(arg_3_0)
        if not slot_0_0_0.avoidBackStab:get_value():get() then
                return
        end

        if not game.engine:in_game() then
                return
        end

        slot_3_1_0 = {
                entity = entities.get_local_pawn()
        }
        slot_3_1_0.eyes = slot_3_1_0.entity:get_eye_pos()

        if not slot_3_1_0.entity:is_alive() then
                return
        end

        slot_3_1_0.origin = slot_3_1_0.entity:get_abs_origin()
        slot_3_2_0 = false
        slot_3_3_0 = 0
        slot_3_4_0 = game.engine:get_netchan()

        if slot_3_4_0 and not slot_3_4_0:is_null() then
                slot_3_3_0 = math.floor(slot_3_4_0:get_latency() * 1000) * 0.8
        end

        slot_3_5_0 = 10000000
        slot_3_6_0 = nil

        entities.players:for_each(function(arg_4_0)
                local var_4_0 = {
                        entity = arg_4_0.entity
                }

                if var_4_0.entity ~= slot_3_1_0.entity then
                        local var_4_1 = var_4_0.entity:get_active_weapon()

                        if var_4_0.entity:is_alive() and var_4_0.entity:is_enemy() and var_4_1 ~= nil and var_4_1:get_type() == 0 then
                                var_4_0.origin = var_4_0.entity:get_abs_origin()
                                var_4_0.distance = slot_0_4_0(slot_3_1_0.origin.x, slot_3_1_0.origin.y, var_4_0.origin.x, var_4_0.origin.y)
                                var_4_0.speed = slot_0_5_0(var_4_0.entity:get_abs_velocity())
                                var_4_0.eyes = var_4_0.entity:get_eye_pos()

                                if var_4_0.distance - slot_3_3_0 - var_4_0.speed / 2 <= 175 and var_4_0.distance < slot_3_5_0 then
                                        slot_3_2_0 = true
                                        slot_3_5_0 = var_4_0.distance
                                        slot_3_6_0 = var_4_0
                                end
                        end
                end
        end)

        slot_3_7_0 = slot_0_0_0.antiaimPitch:get_value():get()
        slot_3_8_0 = slot_0_0_0.antiaimYaw:get_value():get()
        slot_3_9_0 = slot_0_0_0.antiaimYawBase:get_value():get()

        if slot_3_2_0 then
                slot_3_10_0 = arg_3_0:get_viewangles()
                slot_3_11_0 = arg_3_0:get_forwardmove()
                slot_3_12_0 = arg_3_0:get_leftmove()
                slot_3_13_0 = math.calc_angle(slot_3_1_0.eyes, math.vec3(slot_3_6_0.eyes.x, slot_3_6_0.eyes.y, slot_3_6_0.eyes.z))

                arg_3_0:set_viewangles(slot_3_13_0)
                arg_3_0:set_forwardmove(slot_3_11_0)
                arg_3_0:set_leftmove(-slot_3_12_0)
                arg_3_0:rotate_movement(slot_3_10_0.y)

                slot_3_14_0 = arg_3_0:get_viewangles()
                slot_3_16_0 = (math.calc_angle(slot_3_1_0.eyes, slot_3_6_0.eyes).y - slot_3_14_0.y + 180) % 360 - 180

                if not slot_0_2_0.saved then
                        slot_0_2_0.pitch = slot_3_7_0:get_raw()
                        slot_0_2_0.yaw = slot_3_8_0:get_raw()
                        slot_0_2_0.base = slot_3_9_0:get_raw()
                        slot_0_2_0.angle = slot_0_0_0.antiaimYawAngle:get_value():get()
                        slot_0_2_0.saved = true

                        slot_3_7_0:set_raw(8)
                        slot_3_8_0:set_raw(4)
                        slot_3_9_0:set_raw(1)
                        slot_0_0_0.antiaimYawAngle:get_value():set(0)
                        slot_0_0_0.antiaimPitch:get_value():set(slot_3_7_0)
                        slot_0_0_0.antiaimYaw:get_value():set(slot_3_8_0)
                        slot_0_0_0.antiaimYawBase:get_value():set(slot_3_9_0)
                end
        elseif slot_0_2_0.saved then
                slot_0_2_0.saved = false

                slot_3_7_0:set_raw(slot_0_2_0.pitch)
                slot_0_0_0.antiaimPitch:get_value():set(slot_3_7_0)
                slot_3_8_0:set_raw(slot_0_2_0.yaw)
                slot_0_0_0.antiaimYaw:get_value():set(slot_3_8_0)
                slot_0_0_0.antiaimYawAngle:get_value():set(slot_0_2_0.angle)
                slot_3_9_0:set_raw(slot_0_2_0.base)
                slot_0_0_0.antiaimYawBase:get_value():set(slot_3_9_0)
        end
end)
