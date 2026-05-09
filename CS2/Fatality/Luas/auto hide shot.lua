--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("rage>anti-aim>angles>hide shot")
slot_0_1_0 = 40

print("code by 3884016108")

slot_0_2_0 = gui.ctx:find("lua>elements a")
slot_0_3_0 = gui.checkbox(gui.control_id("hs_manager_enable"))
slot_0_4_0 = gui.make_control("Hide shot manager", slot_0_3_0)

if slot_0_2_0 then
        slot_0_2_0:add(slot_0_4_0)
        slot_0_2_0:reset()
end

slot_0_5_0 = gui.slider(gui.control_id("hs_manager_angle"), 0, 90, {
        "%.0f°"
}, 1)

slot_0_5_0:get_value():set(slot_0_1_0)

if slot_0_2_0 then
        slot_0_2_0:add(gui.make_control("Hide shot angle", slot_0_5_0))
        slot_0_2_0:reset()
end

events.present_queue:add(function()
        local var_1_0 = entities.get_local_pawn()

        if not var_1_0 or not var_1_0:is_alive() then
                return
        end

        if not slot_0_3_0:get_value():get() then
                return
        end

        local var_1_1 = var_1_0:get_abs_origin()
        local var_1_2 = var_1_0:get_abs_angles()
        local var_1_3 = math.angle_normalize(var_1_2.y)
        local var_1_4 = slot_0_5_0:get_value():get() or slot_0_1_0
        local var_1_5

        entities.players:for_each(function(arg_2_0)
                local var_2_0 = arg_2_0.entity

                if not var_2_0 then
                        return
                end

                if var_2_0 == var_1_0 or not var_2_0:is_alive() or not var_2_0:is_enemy() then
                        return
                end

                local var_2_1 = var_2_0:get_abs_origin()

                var_2_1.z = var_1_1.z

                local var_2_2 = math.calc_angle(var_1_1, var_2_1)
                local var_2_3 = math.angle_normalize(var_2_2.y)
                local var_2_4 = math.angle_normalize(var_2_3 - var_1_3)
                local var_2_5 = math.abs(var_2_4)

                if var_1_5 == nil or var_2_5 < var_1_5 then
                        var_1_5 = var_2_5
                end
        end)

        local var_1_6 = var_1_5 ~= nil and var_1_5 <= var_1_4

        slot_0_0_0:set_value(not var_1_6)
end)
