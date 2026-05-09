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
slot_0_11_0 = math.lerp
slot_0_12_0 = draw.surface
slot_0_13_0 = draw.color
slot_0_14_0 = {
        third_person_distance = 100,
        return_speed = 0.2,
        fov_threshold = 15,
        transition_speed = 0.15,
        third_person_height = 20
}
slot_0_15_0 = {
        THIRD_PERSON = 2,
        FREECAM = 4,
        FIRST_PERSON = 1
}
slot_0_16_0 = {
        INDICATOR = 8,
        FREE_LOOK = 4,
        TEAM_CHECK = 1,
        BLOCK_INPUT = 2
}
slot_0_17_0 = 4
slot_0_18_0 = 4
slot_0_19_0 = 0.25
slot_0_20_0 = {
        orbit_angles = nil,
        freecam_origin = nil,
        transition_progress = 0,
        target_name = "Unknown",
        is_transitioning = false,
        enabled = false,
        locked_angles = nil,
        view_mode = slot_0_15_0.FIRST_PERSON
}
slot_0_21_0 = nil
slot_0_22_0 = nil
slot_0_23_0 = nil

function slot_0_24_0(arg_1_0)
        return slot_0_7_0(arg_1_0 + 0.5)
end

function slot_0_25_0(arg_2_0)
        while arg_2_0 > 180 do
                arg_2_0 = arg_2_0 - 360
        end

        while arg_2_0 < -180 do
                arg_2_0 = arg_2_0 + 360
        end

        return arg_2_0
end

function slot_0_26_0(arg_3_0)
        if arg_3_0 > 89 then
                arg_3_0 = 89
        end

        if arg_3_0 < -89 then
                arg_3_0 = -89
        end

        return arg_3_0
end

function slot_0_27_0(arg_4_0, arg_4_1, arg_4_2)
        local var_4_0 = slot_0_25_0(arg_4_1 - arg_4_0)

        return slot_0_25_0(arg_4_0 + var_4_0 * arg_4_2)
end

function slot_0_28_0(arg_5_0, arg_5_1, arg_5_2)
        if not arg_5_0 or not arg_5_1 then
                return arg_5_1 or arg_5_0
        end

        return slot_0_0_0(slot_0_11_0(arg_5_0.x, arg_5_1.x, arg_5_2), slot_0_11_0(arg_5_0.y, arg_5_1.y, arg_5_2), slot_0_11_0(arg_5_0.z, arg_5_1.z, arg_5_2))
end

function slot_0_29_0(arg_6_0, arg_6_1, arg_6_2)
        if not arg_6_0 or not arg_6_1 then
                return arg_6_1 or arg_6_0
        end

        return slot_0_0_0(slot_0_27_0(arg_6_0.x, arg_6_1.x, arg_6_2), slot_0_27_0(arg_6_0.y, arg_6_1.y, arg_6_2), slot_0_27_0(arg_6_0.z, arg_6_1.z, arg_6_2))
end

function slot_0_30_0()
        if not game.input then
                return slot_0_0_0(0, 0, 0)
        end

        return game.input:get_view_angles() or slot_0_0_0(0, 0, 0)
end

function slot_0_31_0(arg_8_0)
        if not slot_0_23_0 then
                return false
        end

        local var_8_0 = slot_0_23_0:get_value():get()
        local var_8_1 = var_8_0 and var_8_0.get_raw and var_8_0:get_raw() or 0

        return bit.band(var_8_1, arg_8_0) ~= 0
end

function slot_0_32_0(arg_9_0, arg_9_1)
        local var_9_0
        local var_9_1 = math.huge
        local var_9_2 = arg_9_1.y
        local var_9_3 = arg_9_1.x
        local var_9_4 = entities.get_local_controller()
        local var_9_5 = slot_0_31_0(slot_0_16_0.TEAM_CHECK)

        entities.controllers:for_each(function(arg_10_0)
                local var_10_0 = arg_10_0.entity

                if not var_10_0 or var_10_0 == var_9_4 then
                        return
                end

                if var_9_5 and not var_10_0:is_enemy() then
                        return
                end

                local var_10_1 = var_10_0.get_pawn and var_10_0:get_pawn()

                if not var_10_1 or not var_10_1:is_alive() then
                        return
                end

                local var_10_2 = var_10_1:get_eye_pos()

                if not var_10_2 then
                        return
                end

                local var_10_3 = var_10_2.x - arg_9_0.x
                local var_10_4 = var_10_2.y - arg_9_0.y
                local var_10_5 = var_10_2.z - arg_9_0.z
                local var_10_6 = slot_0_6_0(var_10_3 * var_10_3 + var_10_4 * var_10_4)

                if var_10_6 < 1 then
                        return
                end

                local var_10_7 = slot_0_6_0(var_10_6 * var_10_6 + var_10_5 * var_10_5)
                local var_10_8 = slot_0_4_0(slot_0_10_0(var_10_4, var_10_3))
                local var_10_9 = -slot_0_4_0(slot_0_10_0(var_10_5, var_10_6))
                local var_10_10 = slot_0_5_0(slot_0_25_0(var_10_8 - var_9_2))
                local var_10_11 = slot_0_5_0(slot_0_25_0(var_10_9 - var_9_3))
                local var_10_12 = slot_0_6_0(var_10_10 * var_10_10 + var_10_11 * var_10_11)

                if var_10_12 <= slot_0_14_0.fov_threshold then
                        local var_10_13 = var_10_12 + var_10_7 / 1000

                        if var_10_13 < var_9_1 then
                                var_9_1 = var_10_13
                                var_9_0 = {
                                        pawn = var_10_1,
                                        controller = var_10_0,
                                        name = var_10_0.get_name and var_10_0:get_name() or "Player"
                                }
                        end
                end
        end)

        return var_9_0
end

function slot_0_33_0(arg_11_0, arg_11_1)
        if not arg_11_0 then
                return nil, nil
        end

        local var_11_0 = arg_11_0:get_abs_origin()
        local var_11_1 = arg_11_0:get_abs_angles()

        if not var_11_0 or not var_11_1 then
                return nil, nil
        end

        local var_11_2 = slot_0_31_0(slot_0_16_0.FREE_LOOK)
        local var_11_3
        local var_11_4

        if var_11_2 and arg_11_1 then
                var_11_3 = slot_0_3_0(arg_11_1.y + 180)
                var_11_4 = slot_0_3_0(arg_11_1.x)
        else
                var_11_3 = slot_0_3_0(var_11_1.y + 180)
                var_11_4 = 0
        end

        local var_11_5 = slot_0_2_0(var_11_3)
        local var_11_6 = slot_0_1_0(var_11_3)
        local var_11_7 = slot_0_2_0(var_11_4)
        local var_11_8 = slot_0_1_0(var_11_4)
        local var_11_9 = var_11_0.z + 64
        local var_11_10 = slot_0_14_0.third_person_distance
        local var_11_11 = slot_0_14_0.third_person_height

        if var_11_2 then
                var_11_10 = slot_0_14_0.third_person_distance * var_11_7
                var_11_11 = slot_0_14_0.third_person_distance * var_11_8 + slot_0_14_0.third_person_height
        end

        local var_11_12 = slot_0_0_0(var_11_0.x + var_11_5 * var_11_10, var_11_0.y + var_11_6 * var_11_10, var_11_9 + var_11_11)
        local var_11_13

        if var_11_2 and arg_11_1 then
                var_11_13 = arg_11_1
        else
                local var_11_14 = var_11_0.x - var_11_12.x
                local var_11_15 = var_11_0.y - var_11_12.y
                local var_11_16 = var_11_9 - var_11_12.z
                local var_11_17 = slot_0_6_0(var_11_14 * var_11_14 + var_11_15 * var_11_15)

                var_11_13 = slot_0_0_0(-slot_0_4_0(slot_0_10_0(var_11_16, var_11_17)), slot_0_4_0(slot_0_10_0(var_11_15, var_11_14)), 0)
        end

        return var_11_12, var_11_13
end

function slot_0_34_0(arg_12_0)
        if not arg_12_0 then
                return nil, nil
        end

        local var_12_0 = arg_12_0:get_eye_pos()
        local var_12_1 = arg_12_0:get_abs_angles()

        if not var_12_0 or not var_12_1 then
                return nil, nil
        end

        return var_12_0, var_12_1
end

function slot_0_35_0()
        if not slot_0_20_0.enabled then
                slot_0_20_0.target_pawn = nil
                slot_0_20_0.target_controller = nil
                slot_0_20_0.target_name = "Unknown"

                return
        end

        local var_13_0 = entities.get_local_pawn()

        if not var_13_0 or not var_13_0:is_alive() then
                slot_0_20_0.target_pawn = nil
                slot_0_20_0.target_controller = nil

                return
        end

        local var_13_1 = var_13_0:get_eye_pos()
        local var_13_2 = slot_0_30_0()

        if not var_13_1 then
                return
        end

        if slot_0_20_0.target_pawn and slot_0_20_0.target_pawn:is_alive() then
                return
        end

        slot_0_20_0.target_pawn = nil
        slot_0_20_0.target_controller = nil
        slot_0_20_0.target_name = "Unknown"

        local var_13_3 = slot_0_32_0(var_13_1, var_13_2)

        if var_13_3 then
                slot_0_20_0.target_pawn = var_13_3.pawn
                slot_0_20_0.target_controller = var_13_3.controller
                slot_0_20_0.target_name = var_13_3.name or "Unknown"
        end
end

function slot_0_36_0(arg_14_0, arg_14_1)
        arg_14_0:set_forwardmove(0)
        arg_14_0:set_leftmove(0)

        local var_14_0 = bit.bor(input_bit_mask.in_jump, input_bit_mask.in_duck, input_bit_mask.in_forward, input_bit_mask.in_back, input_bit_mask.in_moveleft, input_bit_mask.in_moveright)

        arg_14_0:remove_button(var_14_0)

        if not arg_14_1 and slot_0_20_0.locked_angles then
                arg_14_0:set_viewangles(slot_0_20_0.locked_angles)

                if arg_14_0.lock_angles then
                        arg_14_0:lock_angles()
                end
        end
end

function slot_0_37_0(arg_15_0)
        if not slot_0_20_0.enabled then
                slot_0_20_0.current_origin = nil
                slot_0_20_0.current_angles = nil
                slot_0_20_0.is_transitioning = false
                slot_0_20_0.transition_progress = 0
                slot_0_20_0.locked_angles = nil
                slot_0_20_0.freecam_origin = nil
                slot_0_20_0.orbit_angles = nil

                return
        end

        if bit.band(slot_0_20_0.view_mode, slot_0_15_0.FREECAM) ~= 0 then
                if not slot_0_20_0.freecam_origin then
                        slot_0_20_0.freecam_origin = slot_0_0_0(arg_15_0.origin.x, arg_15_0.origin.y, arg_15_0.origin.z)
                end

                if not slot_0_20_0.orbit_angles then
                        slot_0_20_0.orbit_angles = slot_0_0_0(arg_15_0.view.x, arg_15_0.view.y, arg_15_0.view.z)
                end

                slot_15_2_1 = slot_0_20_0.orbit_angles
                slot_15_3_0 = slot_0_17_0

                if gui.input:is_key_down(16) then
                        slot_15_3_0 = slot_15_3_0 * slot_0_18_0
                elseif gui.input:is_key_down(17) then
                        slot_15_3_0 = slot_15_3_0 * slot_0_19_0
                end

                slot_15_4_1 = slot_0_3_0(slot_15_2_1.x)
                slot_15_5_1 = slot_0_3_0(slot_15_2_1.y)
                slot_15_6_1 = slot_0_1_0(slot_15_5_1)
                slot_15_7_0 = slot_0_2_0(slot_15_5_1)
                slot_15_8_0 = slot_0_1_0(slot_15_4_1)
                slot_15_9_0 = slot_0_2_0(slot_15_4_1)
                slot_15_10_0 = slot_0_0_0(slot_15_9_0 * slot_15_7_0, slot_15_9_0 * slot_15_6_1, -slot_15_8_0)
                slot_15_11_0 = slot_0_0_0(slot_15_6_1, -slot_15_7_0, 0)
                slot_15_12_0 = slot_0_0_0(0, 0, 0)

                if gui.input:is_key_down(87) then
                        slot_15_12_0.x = slot_15_12_0.x + slot_15_10_0.x
                        slot_15_12_0.y = slot_15_12_0.y + slot_15_10_0.y
                        slot_15_12_0.z = slot_15_12_0.z + slot_15_10_0.z
                end

                if gui.input:is_key_down(83) then
                        slot_15_12_0.x = slot_15_12_0.x - slot_15_10_0.x
                        slot_15_12_0.y = slot_15_12_0.y - slot_15_10_0.y
                        slot_15_12_0.z = slot_15_12_0.z - slot_15_10_0.z
                end

                if gui.input:is_key_down(65) then
                        slot_15_12_0.x = slot_15_12_0.x - slot_15_11_0.x
                        slot_15_12_0.y = slot_15_12_0.y - slot_15_11_0.y
                        slot_15_12_0.z = slot_15_12_0.z - slot_15_11_0.z
                end

                if gui.input:is_key_down(68) then
                        slot_15_12_0.x = slot_15_12_0.x + slot_15_11_0.x
                        slot_15_12_0.y = slot_15_12_0.y + slot_15_11_0.y
                        slot_15_12_0.z = slot_15_12_0.z + slot_15_11_0.z
                end

                slot_0_20_0.freecam_origin.x = slot_0_20_0.freecam_origin.x + slot_15_12_0.x * slot_15_3_0
                slot_0_20_0.freecam_origin.y = slot_0_20_0.freecam_origin.y + slot_15_12_0.y * slot_15_3_0
                slot_0_20_0.freecam_origin.z = slot_0_20_0.freecam_origin.z + slot_15_12_0.z * slot_15_3_0
                arg_15_0.origin = slot_0_20_0.freecam_origin
                arg_15_0.view = slot_15_2_1
                slot_0_20_0.target_pawn = nil
                slot_0_20_0.target_controller = nil
                slot_15_13_0 = entities.get_local_controller()
                slot_0_20_0.target_name = slot_15_13_0 and slot_15_13_0.get_name and slot_15_13_0:get_name() or "Local Player"
                slot_0_20_0.is_transitioning = false
                slot_0_20_0.current_origin = slot_0_20_0.freecam_origin
                slot_0_20_0.current_angles = slot_15_2_1

                return
        end

        slot_0_20_0.freecam_origin = nil

        slot_0_35_0()

        if not slot_0_20_0.locked_angles then
                slot_0_20_0.locked_angles = game.input:get_view_angles()
        end

        slot_15_2_0 = slot_0_20_0.target_pawn

        if not (slot_15_2_0 and slot_15_2_0:is_alive()) then
                if slot_0_20_0.is_transitioning and slot_0_20_0.original_origin and slot_0_20_0.original_angles then
                        slot_0_20_0.transition_progress = slot_0_8_0(0, slot_0_20_0.transition_progress - slot_0_14_0.return_speed)

                        if slot_0_20_0.transition_progress > 0.01 then
                                slot_0_20_0.current_origin = slot_0_28_0(slot_0_20_0.original_origin, slot_0_20_0.current_origin, slot_0_20_0.transition_progress)
                                slot_0_20_0.current_angles = slot_0_29_0(slot_0_20_0.original_angles, slot_0_20_0.current_angles, slot_0_20_0.transition_progress)
                                arg_15_0.origin = slot_0_20_0.current_origin
                                arg_15_0.view = slot_0_20_0.current_angles
                        else
                                slot_0_20_0.is_transitioning = false
                                slot_0_20_0.current_origin = nil
                                slot_0_20_0.current_angles = nil
                                slot_0_20_0.locked_angles = nil
                                slot_0_20_0.orbit_angles = nil
                        end
                else
                        slot_0_20_0.locked_angles = nil
                        slot_0_20_0.orbit_angles = nil
                end

                slot_0_20_0.target_pawn = nil
                slot_0_20_0.target_controller = nil
                slot_0_20_0.target_name = "Unknown"

                return
        end

        if not slot_0_20_0.orbit_angles then
                slot_0_20_0.orbit_angles = game.input:get_view_angles()
        end

        slot_15_4_0 = nil
        slot_15_5_0 = nil
        slot_15_6_0 = slot_0_20_0.orbit_angles

        if bit.band(slot_0_20_0.view_mode, slot_0_15_0.THIRD_PERSON) ~= 0 then
                slot_15_4_0, slot_15_5_0 = slot_0_33_0(slot_15_2_0, slot_15_6_0)
        else
                slot_15_4_0, slot_15_5_0 = slot_0_34_0(slot_15_2_0)
        end

        if not slot_15_4_0 or not slot_15_5_0 then
                return
        end

        if not slot_0_20_0.is_transitioning then
                slot_0_20_0.original_origin = slot_0_0_0(arg_15_0.origin.x, arg_15_0.origin.y, arg_15_0.origin.z)
                slot_0_20_0.original_angles = slot_0_0_0(arg_15_0.view.x, arg_15_0.view.y, arg_15_0.view.z)
                slot_0_20_0.current_origin = slot_0_20_0.original_origin
                slot_0_20_0.current_angles = slot_0_20_0.original_angles
                slot_0_20_0.is_transitioning = true
                slot_0_20_0.transition_progress = 0
        end

        slot_0_20_0.transition_progress = slot_0_9_0(1, slot_0_20_0.transition_progress + slot_0_14_0.transition_speed)
        slot_0_20_0.current_origin = slot_0_28_0(slot_0_20_0.current_origin, slot_15_4_0, slot_0_14_0.transition_speed)
        slot_0_20_0.current_angles = slot_0_29_0(slot_0_20_0.current_angles, slot_15_5_0, slot_0_14_0.transition_speed)
        arg_15_0.origin = slot_0_20_0.current_origin
        arg_15_0.view = slot_0_20_0.current_angles
end

function slot_0_38_0(arg_16_0)
        if not slot_0_20_0.enabled then
                return
        end

        local var_16_0 = bit.band(slot_0_20_0.view_mode, slot_0_15_0.FREECAM) ~= 0
        local var_16_1 = slot_0_31_0(slot_0_16_0.BLOCK_INPUT)

        if var_16_0 or slot_0_20_0.target_pawn and var_16_1 then
                if slot_0_20_0.locked_angles then
                        local var_16_2 = arg_16_0:get_viewangles()
                        local var_16_3 = slot_0_25_0(var_16_2.x - slot_0_20_0.locked_angles.x)
                        local var_16_4 = slot_0_25_0(var_16_2.y - slot_0_20_0.locked_angles.y)

                        if not slot_0_20_0.orbit_angles then
                                slot_0_20_0.orbit_angles = slot_0_0_0(slot_0_20_0.locked_angles.x, slot_0_20_0.locked_angles.y, 0)
                        end

                        slot_0_20_0.orbit_angles.x = slot_0_26_0(slot_0_20_0.orbit_angles.x + var_16_3)
                        slot_0_20_0.orbit_angles.y = slot_0_25_0(slot_0_20_0.orbit_angles.y + var_16_4)
                end

                slot_0_36_0(arg_16_0, false)

                return
        end

        slot_0_20_0.orbit_angles = arg_16_0:get_viewangles()

        if not slot_0_20_0.target_pawn then
                return
        end
end

function slot_0_39_0()
        if slot_0_21_0 then
                slot_17_0_2 = slot_0_21_0:get_value():get()

                if slot_0_20_0.enabled ~= slot_17_0_2 then
                        slot_0_20_0.enabled = slot_17_0_2

                        if not slot_17_0_2 then
                                slot_0_20_0.target_pawn = nil
                                slot_0_20_0.target_controller = nil
                                slot_0_20_0.target_name = "Unknown"
                                slot_0_20_0.locked_angles = nil
                                slot_0_20_0.freecam_origin = nil
                                slot_0_20_0.orbit_angles = nil
                        end
                end
        end

        if slot_0_22_0 then
                slot_17_0_1 = slot_0_22_0:get_value():get()

                if slot_17_0_1 and slot_17_0_1.get_raw then
                        slot_0_20_0.view_mode = slot_17_0_1:get_raw()
                end
        end

        if not slot_0_20_0.enabled then
                return
        end

        slot_17_0_0 = bit.band(slot_0_20_0.view_mode, slot_0_15_0.FREECAM) ~= 0

        if not slot_0_20_0.target_pawn and not slot_17_0_0 then
                return
        end

        if not slot_0_31_0(slot_0_16_0.INDICATOR) then
                return
        end

        slot_17_1_0, slot_17_2_0 = game.engine:get_screen_size()
        slot_17_3_0 = slot_0_24_0(slot_17_1_0 / 2)
        slot_17_4_0 = bit.band(slot_0_20_0.view_mode, slot_0_15_0.THIRD_PERSON) ~= 0
        slot_17_5_0 = "SPYCAM"
        slot_17_6_0 = slot_0_20_0.target_name or "Unknown"
        slot_17_7_0 = slot_17_4_0 and "3RD PERSON" or "1ST PERSON"

        if slot_17_0_0 then
                slot_17_7_0 = "FREECAM"
        end

        slot_17_8_0 = draw.surface
        slot_17_9_0 = (slot_17_4_0 or slot_17_0_0) and slot_0_13_0(255, 140, 50, 255) or slot_0_13_0(50, 170, 255, 255)
        slot_17_10_0 = draw.text_params.with_h(draw.text_alignment.center)
        slot_17_8_0.font = draw.fonts.gui_bold
        slot_17_11_0 = slot_17_8_0.font:get_text_size(slot_17_5_0)
        slot_17_8_0.font = draw.fonts.gui_main
        slot_17_12_0 = slot_17_8_0.font:get_text_size(slot_17_6_0)
        slot_17_13_0 = slot_17_8_0.font:get_text_size(slot_17_7_0)
        slot_17_14_0 = slot_0_8_0(slot_17_11_0.x, slot_0_8_0(slot_17_12_0.x, slot_17_13_0.x))
        slot_17_15_0 = 15
        slot_17_16_0 = 5
        slot_17_17_0 = slot_0_24_0(slot_17_14_0 + slot_17_15_0 * 2)
        slot_17_18_0 = slot_0_24_0(slot_17_11_0.y + slot_17_12_0.y + slot_17_13_0.y + slot_17_16_0 * 2 + slot_17_15_0 * 2 + 3)
        slot_17_19_0 = slot_0_24_0(slot_17_3_0 - slot_17_17_0 / 2)
        slot_17_20_0 = 80

        slot_17_8_0:add_rect_filled(draw.rect(slot_17_19_0, slot_17_20_0, slot_17_19_0 + slot_17_17_0, slot_17_20_0 + slot_17_18_0), slot_0_13_0(15, 15, 20, 240))
        slot_17_8_0:add_rect(draw.rect(slot_17_19_0, slot_17_20_0, slot_17_19_0 + slot_17_17_0, slot_17_20_0 + slot_17_18_0), slot_0_13_0(130, 130, 130, 255), 1)
        slot_17_8_0:add_rect_filled(draw.rect(slot_17_19_0, slot_17_20_0, slot_17_19_0 + slot_17_17_0, slot_17_20_0 + 3), slot_17_9_0)

        slot_17_21_2 = slot_17_20_0 + slot_17_15_0 + 3
        slot_17_8_0.font = draw.fonts.gui_bold

        slot_17_8_0:add_text(draw.vec2(slot_17_3_0, slot_17_21_2), slot_17_5_0, slot_17_9_0, slot_17_10_0)

        slot_17_21_1 = slot_17_21_2 + slot_0_24_0(slot_17_11_0.y) + slot_17_16_0
        slot_17_8_0.font = draw.fonts.gui_main

        slot_17_8_0:add_text(draw.vec2(slot_17_3_0, slot_17_21_1), slot_17_6_0, slot_0_13_0(255, 255, 255, 255), slot_17_10_0)

        slot_17_21_0 = slot_17_21_1 + slot_0_24_0(slot_17_12_0.y) + slot_17_16_0

        slot_17_8_0:add_text(draw.vec2(slot_17_3_0, slot_17_21_0), slot_17_7_0, slot_0_13_0(100, 100, 110, 180), slot_17_10_0)
end

;(function()
        slot_0_21_0 = gui.checkbox(gui.control_id("spycam_enabled"))
        slot_0_23_0 = gui.combo_box(gui.control_id("spycam_filters"))
        slot_0_23_0.allow_multiple = true

        slot_0_23_0:add(gui.selectable(gui.control_id("spycam_f_team"), "Team check"))
        slot_0_23_0:add(gui.selectable(gui.control_id("spycam_f_block"), "Block input"))
        slot_0_23_0:add(gui.selectable(gui.control_id("spycam_f_free"), "Free look"))
        slot_0_23_0:add(gui.selectable(gui.control_id("spycam_f_indicator"), "Indicator"))

        local var_18_0 = slot_0_23_0:get_value()

        if var_18_0 and var_18_0.set_raw then
                var_18_0:set_raw(11)
        end

        slot_0_22_0 = gui.combo_box(gui.control_id("spycam_view_mode"))

        slot_0_22_0:add(gui.selectable(gui.control_id("spycam_first_person"), "First person"))
        slot_0_22_0:add(gui.selectable(gui.control_id("spycam_third_person"), "Third person"))
        slot_0_22_0:add(gui.selectable(gui.control_id("spycam_freecam"), "Freecam"))

        local var_18_1 = gui.ctx:find("lua>elements a")

        if var_18_1 then
                var_18_1:reset()
                var_18_1:add(gui.make_control("Spycam", slot_0_21_0))
                var_18_1:add(gui.make_control("Filters", slot_0_23_0))
                var_18_1:add(gui.make_control("View mode", slot_0_22_0))
        end
end)()
events.create_move:add(slot_0_38_0)
events.override_view:add(slot_0_37_0)
events.present_queue:add(slot_0_39_0)
