--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = math.vec3
slot_0_1_0 = math.sin
slot_0_2_0 = math.cos
slot_0_3_0 = math.rad
slot_0_4_0 = math.deg
slot_0_5_0 = math.abs
slot_0_6_0 = math.sqrt
slot_0_7_0 = math.floor
slot_0_8_0 = math.max
slot_0_9_0 = math.min
slot_0_10_0 = math.atan2
slot_0_11_0 = math.world_to_screen
slot_0_12_0 = draw.surface
slot_0_13_0 = draw.color
slot_0_14_0 = {
        anim_speed = 0.12,
        arrow_size = 20,
        arrow_radius = 50,
        line_length = 50,
        update_rate = 0.02,
        yaw_smoothing = 0.08,
        trace_distances = {
                22,
                45,
                65
        }
}
slot_0_15_0 = {
        AA_LINES = 2,
        DIRECTION_ARROW = 1,
        TARGET_INDICATOR = 4
}
slot_0_16_0 = {
        arrow_left = slot_0_13_0(100, 255, 100, 220),
        arrow_right = slot_0_13_0(100, 150, 255, 220),
        arrow_back = slot_0_13_0(255, 200, 100, 220),
        line_active = slot_0_13_0(0, 255, 180, 255),
        line_inactive = slot_0_13_0(200, 200, 200, 80),
        line_head = slot_0_13_0(0, 255, 255, 220),
        glow = slot_0_13_0(0, 255, 255, 40),
        target_ring = slot_0_13_0(255, 100, 100, 200),
        target_ring_active = slot_0_13_0(255, 50, 50, 255)
}
slot_0_17_0 = {
        was_enabled = false,
        enabled = false,
        target_priority = 1,
        back_yaw = 0,
        safety_score = 1,
        chosen_direction = "BACK",
        right_yaw = 0,
        left_yaw = 0,
        visual_options = 0,
        last_change_time = 0,
        last_best_yaw = 0,
        current_yaw = 0,
        angle_to_enemy = 0,
        last_update_time = 0,
        mode = 0,
        weights = {
                LEFT = 0,
                RIGHT = 0,
                BACK = 1
        }
}
slot_0_18_0 = nil
slot_0_19_0 = nil
slot_0_20_0 = nil
slot_0_21_0 = nil
slot_0_22_0 = nil

function slot_0_23_0()
        return game.global_vars and game.global_vars.real_time or 0
end

function slot_0_24_0(arg_2_0)
        while arg_2_0 > 180 do
                arg_2_0 = arg_2_0 - 360
        end

        while arg_2_0 < -180 do
                arg_2_0 = arg_2_0 + 360
        end

        return arg_2_0
end

function slot_0_25_0(arg_3_0, arg_3_1, arg_3_2)
        return slot_0_24_0(arg_3_0 + slot_0_24_0(arg_3_1 - arg_3_0) * arg_3_2)
end

function slot_0_26_0(arg_4_0, arg_4_1, arg_4_2)
        local var_4_0 = slot_0_3_0(arg_4_1)

        return slot_0_0_0(arg_4_0.x + slot_0_2_0(var_4_0) * arg_4_2, arg_4_0.y + slot_0_1_0(var_4_0) * arg_4_2, arg_4_0.z)
end

function slot_0_27_0(arg_5_0, arg_5_1)
        if not game.physics_query_interface or not ray_t then
                return arg_5_1
        end

        local var_5_0 = ray_t()
        local var_5_1 = game.physics_query_interface:trace_ray(var_5_0, arg_5_0, arg_5_1)

        if not var_5_1 or var_5_1.fraction >= 1 then
                return arg_5_1
        end

        local var_5_2 = var_5_1.plane.normal

        return slot_0_0_0(var_5_1.endpos.x + var_5_2.x * 2, var_5_1.endpos.y + var_5_2.y * 2, var_5_1.endpos.z + var_5_2.z * 2)
end

function slot_0_28_0(arg_6_0, arg_6_1)
        if not game.physics_query_interface or not ray_t then
                return 1
        end

        local var_6_0 = ray_t()
        local var_6_1 = game.physics_query_interface:trace_ray(var_6_0, arg_6_0, arg_6_1)

        if not var_6_1 then
                return 1
        end

        if var_6_1.startsolid or var_6_1.allsolid then
                return 0
        end

        return var_6_1.fraction
end

function slot_0_29_0()
        return game.input and game.input:get_view_angles() or slot_0_0_0(0, 0, 0)
end

function slot_0_30_0(arg_8_0)
        local var_8_0 = slot_0_29_0()
        local var_8_1 = var_8_0.y
        local var_8_2 = var_8_0.x
        local var_8_3
        local var_8_4 = math.huge

        entities.players:for_each(function(arg_9_0)
                local var_9_0 = arg_9_0.entity

                if not var_9_0 or not var_9_0:is_enemy() or not var_9_0:is_alive() then
                        return
                end

                local var_9_1 = var_9_0:get_eye_pos()

                if not var_9_1 then
                        return
                end

                local var_9_2 = var_9_1.x - arg_8_0.x
                local var_9_3 = var_9_1.y - arg_8_0.y
                local var_9_4 = var_9_1.z - arg_8_0.z
                local var_9_5 = slot_0_6_0(var_9_2 * var_9_2 + var_9_3 * var_9_3)
                local var_9_6 = slot_0_6_0(var_9_5 * var_9_5 + var_9_4 * var_9_4)
                local var_9_7 = 0

                if slot_0_17_0.target_priority == 0 then
                        var_9_7 = var_9_6
                else
                        local var_9_8 = slot_0_4_0(slot_0_10_0(var_9_3, var_9_2))
                        local var_9_9 = slot_0_5_0(slot_0_24_0(var_9_8 - var_8_1))
                        local var_9_10 = -slot_0_4_0(slot_0_10_0(var_9_4, var_9_5))
                        local var_9_11 = slot_0_5_0(slot_0_24_0(var_9_10 - var_8_2))

                        var_9_7 = slot_0_6_0(var_9_9 * var_9_9 + var_9_11 * var_9_11) + var_9_6 / 100
                end

                if var_9_7 < var_8_4 then
                        var_8_4 = var_9_7
                        var_8_3 = {
                                eye = var_9_1,
                                chest = slot_0_0_0(var_9_1.x, var_9_1.y, var_9_1.z - 20),
                                pelvis = slot_0_0_0(var_9_1.x, var_9_1.y, var_9_1.z - 50),
                                entity = var_9_0
                        }
                end
        end)

        return var_8_3
end

function slot_0_31_0(arg_10_0, arg_10_1)
        local var_10_0 = slot_0_28_0(arg_10_0, arg_10_1.eye) or 0
        local var_10_1 = slot_0_28_0(arg_10_0, arg_10_1.chest) or 0
        local var_10_2 = slot_0_28_0(arg_10_0, arg_10_1.pelvis) or 0

        return var_10_0 * 0.5 + var_10_1 * 0.3 + var_10_2 * 0.2
end

function slot_0_32_0(arg_11_0, arg_11_1)
        local var_11_0 = 0
        local var_11_1 = 0

        for iter_11_0, iter_11_1 in ipairs(slot_0_14_0.trace_distances) do
                local var_11_2 = slot_0_26_0(arg_11_0, slot_0_17_0.left_yaw, iter_11_1)
                local var_11_3 = slot_0_26_0(arg_11_0, slot_0_17_0.right_yaw, iter_11_1)

                for iter_11_2, iter_11_3 in ipairs({
                        0,
                        -30,
                        -60
                }) do
                        local var_11_4 = slot_0_27_0(arg_11_0, slot_0_0_0(var_11_2.x, var_11_2.y, var_11_2.z + iter_11_3))
                        local var_11_5 = slot_0_27_0(arg_11_0, slot_0_0_0(var_11_3.x, var_11_3.y, var_11_3.z + iter_11_3))

                        var_11_0 = var_11_0 + slot_0_28_0(var_11_4, arg_11_1.eye) + slot_0_28_0(var_11_4, arg_11_1.chest)
                        var_11_1 = var_11_1 + slot_0_28_0(var_11_5, arg_11_1.eye) + slot_0_28_0(var_11_5, arg_11_1.chest)
                end
        end

        local var_11_6 = #slot_0_14_0.trace_distances * 6 * 0.4

        if var_11_0 < var_11_1 - 1.2 and var_11_0 < var_11_6 then
                slot_0_17_0.chosen_direction, slot_0_17_0.safety_score = "LEFT", 1 - var_11_0 / (#slot_0_14_0.trace_distances * 6)

                return slot_0_17_0.left_yaw
        elseif var_11_1 < var_11_0 - 1.2 and var_11_1 < var_11_6 then
                slot_0_17_0.chosen_direction, slot_0_17_0.safety_score = "RIGHT", 1 - var_11_1 / (#slot_0_14_0.trace_distances * 6)

                return slot_0_17_0.right_yaw
        end

        slot_0_17_0.chosen_direction, slot_0_17_0.safety_score = "BACK", 1

        return slot_0_17_0.back_yaw
end

function slot_0_33_0(arg_12_0, arg_12_1)
        for iter_12_0 = 20, 200, 20 do
                local var_12_0 = slot_0_26_0(arg_12_0, slot_0_17_0.left_yaw, iter_12_0)
                local var_12_1 = slot_0_26_0(arg_12_0, slot_0_17_0.right_yaw, iter_12_0)
                local var_12_2 = slot_0_27_0(arg_12_0, var_12_0)
                local var_12_3 = slot_0_27_0(arg_12_0, slot_0_0_0(var_12_0.x, var_12_0.y, var_12_0.z - 30))
                local var_12_4 = slot_0_27_0(arg_12_0, var_12_1)
                local var_12_5 = slot_0_27_0(arg_12_0, slot_0_0_0(var_12_1.x, var_12_1.y, var_12_1.z - 30))
                local var_12_6 = (slot_0_28_0(var_12_2, arg_12_1.eye) + slot_0_28_0(var_12_3, arg_12_1.chest)) / 2
                local var_12_7 = (slot_0_28_0(var_12_4, arg_12_1.eye) + slot_0_28_0(var_12_5, arg_12_1.chest)) / 2

                if slot_0_5_0(var_12_6 - var_12_7) > 0.4 then
                        if var_12_6 < var_12_7 then
                                slot_0_17_0.chosen_direction, slot_0_17_0.safety_score = "LEFT", 1 - var_12_6

                                return slot_0_17_0.left_yaw
                        else
                                slot_0_17_0.chosen_direction, slot_0_17_0.safety_score = "RIGHT", 1 - var_12_7

                                return slot_0_17_0.right_yaw
                        end
                end
        end

        slot_0_17_0.chosen_direction, slot_0_17_0.safety_score = "BACK", 1

        return slot_0_17_0.back_yaw
end

function slot_0_34_0(arg_13_0, arg_13_1)
        local var_13_0 = {
                {
                        name = "LEFT",
                        yaw = slot_0_24_0(slot_0_17_0.angle_to_enemy + 90)
                },
                {
                        name = "RIGHT",
                        yaw = slot_0_24_0(slot_0_17_0.angle_to_enemy - 90)
                },
                {
                        name = "BACK",
                        yaw = slot_0_24_0(slot_0_17_0.angle_to_enemy + 180)
                }
        }
        local var_13_1 = {
                25,
                50,
                75,
                100
        }
        local var_13_2 = {
                0,
                -20,
                -40
        }
        local var_13_3 = var_13_0[3]
        local var_13_4 = math.huge

        for iter_13_0, iter_13_1 in ipairs(var_13_0) do
                local var_13_5 = 0

                for iter_13_2, iter_13_3 in ipairs(var_13_1) do
                        local var_13_6 = slot_0_26_0(arg_13_0, iter_13_1.yaw, iter_13_3)

                        for iter_13_4, iter_13_5 in ipairs(var_13_2) do
                                local var_13_7 = slot_0_0_0(var_13_6.x, var_13_6.y, var_13_6.z + iter_13_5)
                                local var_13_8 = slot_0_27_0(arg_13_0, var_13_7)

                                var_13_5 = var_13_5 + slot_0_31_0(var_13_8, arg_13_1)
                        end
                end

                iter_13_1.score = var_13_5

                if iter_13_1.name == "BACK" then
                        iter_13_1.score = iter_13_1.score * 0.95
                end

                if var_13_4 > iter_13_1.score then
                        var_13_4 = iter_13_1.score
                        var_13_3 = iter_13_1
                end
        end

        local var_13_9 = var_13_3.yaw - 30
        local var_13_10 = var_13_3.yaw + 30
        local var_13_11 = var_13_3.yaw
        local var_13_12 = math.huge

        for iter_13_6 = var_13_9, var_13_10, 5 do
                local var_13_13 = slot_0_24_0(iter_13_6)
                local var_13_14 = slot_0_26_0(arg_13_0, var_13_13, 25)
                local var_13_15 = slot_0_31_0(slot_0_27_0(arg_13_0, slot_0_0_0(var_13_14.x, var_13_14.y, var_13_14.z)), arg_13_1) + slot_0_31_0(slot_0_27_0(arg_13_0, slot_0_0_0(var_13_14.x, var_13_14.y, var_13_14.z - 30)), arg_13_1) + slot_0_5_0(slot_0_24_0(var_13_13 - var_13_3.yaw)) / 1000

                if var_13_15 < var_13_12 then
                        var_13_12 = var_13_15
                        var_13_11 = var_13_13
                end
        end

        local var_13_16 = 1 - var_13_12 / 2
        local var_13_17 = slot_0_23_0()
        local var_13_18 = slot_0_17_0.last_best_yaw

        if var_13_18 ~= 0 then
                local var_13_19 = slot_0_26_0(arg_13_0, var_13_18, 25)
                local var_13_20 = slot_0_31_0(slot_0_27_0(arg_13_0, var_13_19), arg_13_1) + slot_0_31_0(slot_0_27_0(arg_13_0, slot_0_0_0(var_13_19.x, var_13_19.y, var_13_19.z - 30)), arg_13_1)
                local var_13_21 = var_13_17 - slot_0_17_0.last_change_time
                local var_13_22 = var_13_20 - var_13_12

                if var_13_21 < 0.1 or var_13_20 < 0.2 and var_13_22 < 0.2 then
                        var_13_11 = var_13_18
                        var_13_16 = 1 - var_13_20 / 2
                else
                        slot_0_17_0.last_change_time = var_13_17
                        slot_0_17_0.last_best_yaw = var_13_11
                end
        else
                slot_0_17_0.last_change_time = var_13_17
                slot_0_17_0.last_best_yaw = var_13_11
        end

        slot_0_17_0.safety_score = slot_0_8_0(0, slot_0_9_0(1, var_13_16))
        slot_0_17_0.chosen_direction = var_13_3.name

        return var_13_11
end

function slot_0_35_0(arg_14_0, arg_14_1)
        slot_0_17_0.angle_to_enemy = slot_0_4_0(slot_0_10_0(arg_14_1.eye.y - arg_14_0.y, arg_14_1.eye.x - arg_14_0.x))
        slot_0_17_0.left_yaw, slot_0_17_0.right_yaw = slot_0_24_0(slot_0_17_0.angle_to_enemy + 90), slot_0_24_0(slot_0_17_0.angle_to_enemy - 90)
        slot_0_17_0.back_yaw = slot_0_24_0(slot_0_17_0.angle_to_enemy + 180)

        local var_14_0 = slot_0_17_0.mode

        if bit.band(var_14_0, 4) ~= 0 then
                return slot_0_34_0(arg_14_0, arg_14_1)
        elseif bit.band(var_14_0, 2) ~= 0 then
                return slot_0_33_0(arg_14_0, arg_14_1)
        else
                return slot_0_32_0(arg_14_0, arg_14_1)
        end
end

function slot_0_36_0(arg_15_0)
        if not slot_0_22_0 then
                slot_0_22_0 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount") or gui.ctx:find("rage>anti-aim>angles>yaw>amount")
        end

        if slot_0_22_0 then
                local var_15_0 = slot_0_29_0()
                local var_15_1 = slot_0_22_0:get_value()

                if var_15_1 and var_15_1.set then
                        var_15_1:set(slot_0_8_0(-180, slot_0_9_0(180, slot_0_7_0(slot_0_24_0(arg_15_0 - var_15_0.y)))))
                end
        end
end

function slot_0_37_0(arg_16_0, arg_16_1)
        local var_16_0 = gui.ctx:find(arg_16_0)

        if not var_16_0 then
                return
        end

        local var_16_1 = var_16_0:get_value()
        local var_16_2 = var_16_1:get()

        if var_16_2 and var_16_2.set_raw and var_16_2:get_raw() ~= arg_16_1 then
                var_16_2:set_raw(arg_16_1)
                var_16_1:set(var_16_2)
        end
end

function slot_0_38_0(arg_17_0)
        local var_17_0 = gui.ctx:find(arg_17_0)

        if not var_17_0 then
                return nil
        end

        local var_17_1 = var_17_0:get_value():get()

        return var_17_1 and var_17_1.get_raw and var_17_1:get_raw() or nil
end

function slot_0_39_0(arg_18_0)
        local var_18_0 = gui.ctx:find(arg_18_0)

        if not var_18_0 then
                return nil
        end

        local var_18_1 = var_18_0:get_value()

        return var_18_1 and var_18_1.get and var_18_1:get() or nil
end

function slot_0_40_0(arg_19_0, arg_19_1)
        local var_19_0 = gui.ctx:find(arg_19_0)

        if not var_19_0 then
                return
        end

        local var_19_1 = var_19_0:get_value()

        if var_19_1 then
                if var_19_0.set_value then
                        var_19_0:set_value(arg_19_1)
                elseif var_19_1.set then
                        var_19_1:set(arg_19_1)
                end
        end
end

function slot_0_41_0()
        if slot_0_17_0.original_settings then
                return
        end

        slot_0_17_0.original_settings = {
                yaw_amount = nil,
                yaw = slot_0_38_0("rage>anti-aim>angles>yaw"),
                yaw_jitter = slot_0_38_0("rage>anti-aim>angles>yaw jitter"),
                spin = slot_0_39_0("rage>anti-aim>angles>spin"),
                yaw_base = slot_0_38_0("rage>anti-aim>angles>yaw base")
        }

        local var_20_0 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount") or gui.ctx:find("rage>anti-aim>angles>yaw>amount")

        if var_20_0 then
                local var_20_1 = var_20_0:get_value()

                if var_20_1 and var_20_1.get then
                        slot_0_17_0.original_settings.yaw_amount = var_20_1:get()
                end
        end
end

function slot_0_42_0()
        if not slot_0_17_0.original_settings then
                return
        end

        local var_21_0 = slot_0_17_0.original_settings

        if var_21_0.yaw ~= nil then
                slot_0_37_0("rage>anti-aim>angles>yaw", var_21_0.yaw)
        end

        if var_21_0.yaw_jitter ~= nil then
                slot_0_37_0("rage>anti-aim>angles>yaw jitter", var_21_0.yaw_jitter)
        end

        if var_21_0.spin ~= nil then
                slot_0_40_0("rage>anti-aim>angles>spin", var_21_0.spin)
        end

        if var_21_0.yaw_base ~= nil then
                slot_0_37_0("rage>anti-aim>angles>yaw base", var_21_0.yaw_base)
        end

        if var_21_0.yaw_amount ~= nil then
                local var_21_1 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount") or gui.ctx:find("rage>anti-aim>angles>yaw>amount")

                if var_21_1 then
                        local var_21_2 = var_21_1:get_value()

                        if var_21_2 and var_21_2.set then
                                var_21_2:set(var_21_0.yaw_amount)
                        end
                end
        end

        slot_0_17_0.original_settings = nil
end

function slot_0_43_0()
        if not slot_0_17_0.enabled then
                if slot_0_17_0.was_enabled then
                        slot_0_42_0()

                        slot_0_17_0.was_enabled = false
                end

                return
        end

        local var_22_0 = entities.get_local_pawn()

        if not var_22_0 or not var_22_0:is_alive() then
                return
        end

        local var_22_1 = var_22_0:get_eye_pos()

        if not var_22_1 then
                return
        end

        local var_22_2 = slot_0_23_0()

        if var_22_2 - slot_0_17_0.last_update_time >= slot_0_14_0.update_rate then
                slot_0_17_0.last_update_time = var_22_2

                local var_22_3 = slot_0_30_0(var_22_1)

                if var_22_3 then
                        slot_0_17_0.target_entity = var_22_3.entity

                        if not slot_0_17_0.was_enabled then
                                slot_0_41_0()

                                slot_0_17_0.was_enabled = true
                        end

                        slot_0_37_0("rage>anti-aim>angles>yaw", 4)
                        slot_0_37_0("rage>anti-aim>angles>yaw jitter", 1)
                        slot_0_40_0("rage>anti-aim>angles>spin", false)
                        slot_0_37_0("rage>anti-aim>angles>yaw base", 1)

                        local var_22_4 = slot_0_35_0(var_22_1, var_22_3)

                        slot_0_17_0.current_yaw = slot_0_25_0(slot_0_17_0.current_yaw, var_22_4, 1 - slot_0_14_0.yaw_smoothing)

                        slot_0_36_0(slot_0_17_0.current_yaw)
                elseif slot_0_17_0.was_enabled then
                        slot_0_17_0.target_entity = nil

                        slot_0_42_0()

                        slot_0_17_0.was_enabled = false
                else
                        slot_0_17_0.target_entity = nil
                end
        end

        for iter_22_0, iter_22_1 in pairs(slot_0_17_0.weights) do
                local var_22_5 = slot_0_17_0.chosen_direction == iter_22_0 and 1 or 0

                slot_0_17_0.weights[iter_22_0] = iter_22_1 + (var_22_5 - iter_22_1) * slot_0_14_0.anim_speed
        end
end

function slot_0_44_0(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
        local var_23_0 = slot_0_3_0(arg_23_1 - 90)
        local var_23_1 = arg_23_0.x + slot_0_2_0(var_23_0) * arg_23_2
        local var_23_2 = arg_23_0.y + slot_0_1_0(var_23_0) * arg_23_2
        local var_23_3 = arg_23_2 * 0.5
        local var_23_4 = var_23_0 + slot_0_3_0(140)
        local var_23_5 = var_23_0 - slot_0_3_0(140)
        local var_23_6 = var_23_1 + slot_0_2_0(var_23_4) * var_23_3
        local var_23_7 = var_23_2 + slot_0_1_0(var_23_4) * var_23_3
        local var_23_8 = var_23_1 + slot_0_2_0(var_23_5) * var_23_3
        local var_23_9 = var_23_2 + slot_0_1_0(var_23_5) * var_23_3

        slot_0_12_0:add_line(draw.vec2(var_23_1, var_23_2), draw.vec2(var_23_6, var_23_7), arg_23_3, 2)
        slot_0_12_0:add_line(draw.vec2(var_23_1, var_23_2), draw.vec2(var_23_8, var_23_9), arg_23_3, 2)
        slot_0_12_0:add_line(draw.vec2(var_23_6, var_23_7), draw.vec2(var_23_8, var_23_9), arg_23_3, 2)
end

function slot_0_45_0()
        if not slot_0_17_0.was_enabled or slot_0_17_0.visual_options == 0 then
                return
        end

        slot_24_0_0 = entities.get_local_pawn()

        if not slot_24_0_0 or not slot_24_0_0:is_alive() then
                return
        end

        slot_24_1_0 = slot_24_0_0:get_abs_origin()

        if not slot_24_1_0 then
                return
        end

        if bit.band(slot_0_17_0.visual_options, slot_0_15_0.DIRECTION_ARROW) ~= 0 then
                slot_24_2_2, slot_24_3_1 = game.engine:get_screen_size()
                slot_24_4_2 = slot_0_29_0()
                slot_24_5_1 = -slot_0_24_0(slot_0_17_0.current_yaw - slot_24_4_2.y)
                slot_24_6_2 = slot_0_3_0(slot_24_5_1 - 90)
                slot_24_7_2 = slot_0_17_0.chosen_direction == "LEFT" and slot_0_16_0.arrow_left or slot_0_17_0.chosen_direction == "RIGHT" and slot_0_16_0.arrow_right or slot_0_16_0.arrow_back

                slot_0_44_0(draw.vec2(slot_24_2_2 / 2 + slot_0_2_0(slot_24_6_2) * slot_0_14_0.arrow_radius, slot_24_3_1 / 2 + slot_0_1_0(slot_24_6_2) * slot_0_14_0.arrow_radius), slot_24_5_1, slot_0_14_0.arrow_size, slot_24_7_2)
        end

        if bit.band(slot_0_17_0.visual_options, slot_0_15_0.AA_LINES) ~= 0 then
                slot_24_2_1 = slot_0_0_0(slot_24_1_0.x, slot_24_1_0.y, slot_24_1_0.z)
                slot_24_3_0 = slot_0_11_0(slot_24_2_1)

                if slot_24_3_0 then
                        slot_24_4_1 = slot_0_17_0.current_yaw
                        slot_24_5_0 = slot_0_11_0(slot_0_26_0(slot_24_2_1, slot_24_4_1, slot_0_14_0.line_length))

                        function slot_24_6_1(arg_25_0, arg_25_1, arg_25_2)
                                local var_25_0 = slot_0_17_0.weights[arg_25_1] or 0
                                local var_25_1 = slot_0_14_0.line_length * (0.8 + 0.2 * var_25_0)
                                local var_25_2 = slot_0_11_0(slot_0_26_0(slot_24_2_1, arg_25_0, var_25_1))

                                if not var_25_2 then
                                        return
                                end

                                local var_25_3 = slot_0_7_0(80 + 175 * var_25_0)
                                local var_25_4 = slot_0_13_0(slot_0_16_0.line_active:get_r(), slot_0_16_0.line_active:get_g(), slot_0_16_0.line_active:get_b(), var_25_3)

                                if var_25_0 < 0.1 then
                                        var_25_4 = slot_0_13_0(slot_0_16_0.line_inactive:get_r(), slot_0_16_0.line_inactive:get_g(), slot_0_16_0.line_inactive:get_b(), slot_0_7_0(slot_0_16_0.line_inactive:get_a() * (1 - var_25_0)))
                                end

                                if var_25_0 > 0.5 then
                                        slot_0_12_0:add_line(slot_24_3_0, var_25_2, slot_0_13_0(slot_0_16_0.glow:get_r(), slot_0_16_0.glow:get_g(), slot_0_16_0.glow:get_b(), slot_0_7_0(slot_0_16_0.glow:get_a() * var_25_0)), 6)
                                end

                                slot_0_12_0:add_line(slot_24_3_0, var_25_2, var_25_4, 1 + 2 * var_25_0)
                                slot_0_12_0:add_text(draw.vec2(var_25_2.x + 5, var_25_2.y), arg_25_2, var_25_4)
                        end

                        if bit.band(slot_0_17_0.mode, 4) ~= 0 then
                                slot_24_7_1 = slot_0_11_0(slot_0_26_0(slot_24_2_1, slot_0_17_0.back_yaw, slot_0_14_0.line_length))

                                if slot_24_7_1 then
                                        slot_0_12_0:add_line(slot_24_3_0, slot_24_7_1, slot_0_16_0.line_inactive, 1)
                                        slot_0_12_0:add_text(draw.vec2(slot_24_7_1.x + 5, slot_24_7_1.y), "BACK", slot_0_16_0.line_inactive)
                                end

                                if slot_24_5_0 then
                                        slot_24_8_1 = slot_0_17_0.safety_score
                                        slot_24_9_0 = slot_0_7_0(255 * (1 - slot_24_8_1))
                                        slot_24_10_0 = slot_0_7_0(255 * slot_24_8_1)
                                        slot_24_11_0 = slot_0_13_0(slot_24_9_0, slot_24_10_0, 50, 220)

                                        slot_0_12_0:add_line(slot_24_3_0, slot_24_5_0, slot_0_13_0(slot_24_9_0, slot_24_10_0, 50, 40), 8)
                                        slot_0_12_0:add_line(slot_24_3_0, slot_24_5_0, slot_24_11_0, 3)
                                end
                        else
                                slot_24_6_1(slot_0_17_0.left_yaw, "LEFT", "L")
                                slot_24_6_1(slot_0_17_0.right_yaw, "RIGHT", "R")
                                slot_24_6_1(slot_0_17_0.back_yaw, "BACK", "B")

                                if slot_24_5_0 then
                                        slot_0_12_0:add_line(slot_24_3_0, slot_24_5_0, slot_0_16_0.line_head, 3)
                                end
                        end
                end
        end

        if bit.band(slot_0_17_0.visual_options, slot_0_15_0.TARGET_INDICATOR) ~= 0 and slot_0_17_0.target_entity and slot_0_17_0.target_entity:is_alive() then
                slot_24_2_0 = slot_0_17_0.target_entity:get_abs_origin()

                if slot_24_2_0 then
                        slot_24_4_0 = 25 + (slot_0_1_0(slot_0_23_0() * 5) + 1) * 0.5 * 5

                        if slot_0_11_0(slot_24_2_0) then
                                slot_24_6_0 = 32
                                slot_24_7_0 = 360 / slot_24_6_0
                                slot_24_8_0 = slot_0_23_0() * 50

                                for iter_24_0 = 0, slot_24_6_0 - 1 do
                                        slot_24_13_0 = slot_0_3_0(iter_24_0 * slot_24_7_0 + slot_24_8_0)
                                        slot_24_14_0 = slot_0_3_0((iter_24_0 + 1) * slot_24_7_0 + slot_24_8_0)
                                        slot_24_15_0 = slot_0_0_0(slot_24_2_0.x + slot_0_2_0(slot_24_13_0) * slot_24_4_0, slot_24_2_0.y + slot_0_1_0(slot_24_13_0) * slot_24_4_0, slot_24_2_0.z)
                                        slot_24_16_0 = slot_0_0_0(slot_24_2_0.x + slot_0_2_0(slot_24_14_0) * slot_24_4_0, slot_24_2_0.y + slot_0_1_0(slot_24_14_0) * slot_24_4_0, slot_24_2_0.z)
                                        slot_24_17_0 = slot_0_11_0(slot_24_15_0)
                                        slot_24_18_0 = slot_0_11_0(slot_24_16_0)

                                        if slot_24_17_0 and slot_24_18_0 then
                                                slot_24_19_0 = (slot_0_1_0(iter_24_0 * 0.5 + slot_0_23_0() * 3) + 1) * 0.5
                                                slot_24_20_0 = slot_0_13_0(slot_0_16_0.target_ring:get_r(), slot_0_16_0.target_ring:get_g(), slot_0_16_0.target_ring:get_b(), slot_0_7_0(100 + 155 * slot_24_19_0))

                                                slot_0_12_0:add_line(slot_24_17_0, slot_24_18_0, slot_24_20_0, 2)
                                        end
                                end
                        end
                end
        end
end

function slot_0_46_0()
        slot_0_18_0 = gui.checkbox(gui.control_id("freestanding_enabled"))
        slot_0_19_0 = gui.combo_box(gui.control_id("freestanding_mode"))

        slot_0_19_0:add(gui.selectable(gui.control_id("freestanding_mode_std"), "Simple"))
        slot_0_19_0:add(gui.selectable(gui.control_id("freestanding_mode_v3"), "Adaptive"))
        slot_0_19_0:add(gui.selectable(gui.control_id("freestanding_mode_crt"), "Experimental"))

        slot_0_20_0 = gui.combo_box(gui.control_id("freestanding_target"))

        slot_0_20_0:add(gui.selectable(gui.control_id("freestanding_fov"), "FOV"))
        slot_0_20_0:add(gui.selectable(gui.control_id("freestanding_distance"), "Distance"))

        slot_0_21_0 = gui.combo_box(gui.control_id("freestanding_visuals"))
        slot_0_21_0.allow_multiple = true

        slot_0_21_0:add(gui.selectable(gui.control_id("freestanding_vis_arrow"), "Direction Arrow"))
        slot_0_21_0:add(gui.selectable(gui.control_id("freestanding_vis_lines"), "AA Lines"))
        slot_0_21_0:add(gui.selectable(gui.control_id("freestanding_vis_dind"), "Target Indicator"))

        local var_26_0 = gui.ctx:find("rage>anti-aim>angles")

        if var_26_0 then
                var_26_0:reset()
                var_26_0:add(gui.make_control("Freestanding", slot_0_18_0))
                var_26_0:add(gui.make_control("Method", slot_0_19_0))
                var_26_0:add(gui.make_control("Target Priority", slot_0_20_0))
                var_26_0:add(gui.make_control("Visualize", slot_0_21_0))
        end
end

events.present_queue:add(function()
        if slot_0_18_0 then
                slot_0_17_0.enabled = slot_0_18_0:get_value():get()
        end

        if slot_0_19_0 then
                slot_0_17_0.mode = slot_0_19_0:get_value():get():get_raw()
        end

        if slot_0_20_0 then
                slot_0_17_0.target_priority = bit.band(slot_0_20_0:get_value():get():get_raw(), 1) ~= 0 and 1 or 0
        end

        if slot_0_21_0 then
                slot_0_17_0.visual_options = slot_0_21_0:get_value():get():get_raw()
        end

        slot_0_43_0()
        slot_0_45_0()
end)
slot_0_46_0()
