--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = math.vec3
slot_0_1_0 = draw.vec2
slot_0_2_0 = draw.color
slot_0_3_0 = math.sin
slot_0_4_0 = math.cos
slot_0_5_0 = math.rad
slot_0_6_0 = math.floor
slot_0_7_0 = math.abs
slot_0_8_0 = bit.band
slot_0_9_0 = 140
slot_0_10_0 = 80
slot_0_11_0 = 2
slot_0_12_0 = 0.3
slot_0_13_0 = ray_t and ray_t()
slot_0_14_0 = {
        [weapon_id.knife] = 1,
        [weapon_id.knife_t] = 1,
        [weapon_id.knife_bayonet] = 1,
        [weapon_id.knife_css] = 1,
        [weapon_id.knife_flip] = 1,
        [weapon_id.knife_gut] = 1,
        [weapon_id.knife_karambit] = 1,
        [weapon_id.knife_m9bayonet] = 1,
        [weapon_id.knife_tactical] = 1,
        [weapon_id.knife_falchion] = 1,
        [weapon_id.knife_survival_bowie] = 1,
        [weapon_id.knife_butterfly] = 1,
        [weapon_id.knife_push] = 1,
        [weapon_id.knife_cord] = 1,
        [weapon_id.knife_canis] = 1,
        [weapon_id.knife_ursus] = 1,
        [weapon_id.knife_gypsy_jackknife] = 1,
        [weapon_id.knife_outdoor] = 1,
        [weapon_id.knife_stiletto] = 1,
        [weapon_id.knife_widowmaker] = 1,
        [weapon_id.knife_skeleton] = 1
}
slot_0_15_0 = {
        wep = gui.combo_box(gui.control_id("rv_w"))
}
slot_0_15_0.wep.allow_multiple = true

slot_0_15_0.wep:add(gui.selectable(gui.control_id("rv_z"), "Zeus"))
slot_0_15_0.wep:add(gui.selectable(gui.control_id("rv_k"), "Knife"))
slot_0_15_0.wep:get_value():get():set_raw(1)

slot_0_15_0.style = gui.combo_box(gui.control_id("rv_s"))

for iter_0_0, iter_0_1 in ipairs({
        "Rainbow Ring",
        "Minimal Corners",
        "Orbital Dots",
        "Static"
}) do
        slot_0_15_0.style:add(gui.selectable(gui.control_id("rv_" .. iter_0_1), iter_0_1))
end

slot_0_15_0.col = gui.color_picker(gui.control_id("rv_c"))

slot_0_15_0.col:get_value():set(slot_0_2_0(100, 200, 255, 255))

slot_0_15_0.height = gui.slider(gui.control_id("rv_h"), 0, 68, {
        "%.0f"
})

slot_0_15_0.height:get_value():set(1)

slot_0_16_1 = gui.ctx:find("lua>elements a")

if slot_0_16_1 then
        slot_0_16_1:reset()
        slot_0_16_1:add(gui.make_control("Range Visualizer", slot_0_15_0.wep))
        slot_0_16_1:add(gui.make_control("Style", slot_0_15_0.style))
        slot_0_16_1:add(gui.make_control("Color", slot_0_15_0.col))
        slot_0_16_1:add(gui.make_control("Height", slot_0_15_0.height))
end

function slot_0_16_0(arg_1_0)
        local var_1_0 = slot_0_6_0(arg_1_0 * 6) % 6
        local var_1_1 = arg_1_0 * 6 % 1
        local var_1_2 = slot_0_6_0((1 - var_1_1) * 255)
        local var_1_3 = slot_0_6_0(var_1_1 * 255)

        if var_1_0 == 0 then
                return 255, var_1_3, 0
        elseif var_1_0 == 1 then
                return var_1_2, 255, 0
        elseif var_1_0 == 2 then
                return 0, 255, var_1_3
        elseif var_1_0 == 3 then
                return 0, var_1_2, 255
        elseif var_1_0 == 4 then
                return var_1_3, 0, 255
        else
                return 255, 0, var_1_2
        end
end

function slot_0_17_0(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
        local var_2_0 = arg_2_0 + arg_2_3 * slot_0_4_0(arg_2_4)
        local var_2_1 = arg_2_1 + arg_2_3 * slot_0_3_0(arg_2_4)
        local var_2_2 = 1

        if slot_0_13_0 and game.physics_query_interface then
                local var_2_3 = game.physics_query_interface:trace_ray(slot_0_13_0, slot_0_0_0(arg_2_0, arg_2_1, arg_2_2), slot_0_0_0(var_2_0, var_2_1, arg_2_2))

                if var_2_3 then
                        var_2_2 = var_2_3.fraction
                end
        end

        return arg_2_0 + (var_2_0 - arg_2_0) * var_2_2, arg_2_1 + (var_2_1 - arg_2_1) * var_2_2, var_2_2
end

slot_0_18_0 = 1

function slot_0_19_0(arg_3_0, arg_3_1, arg_3_2)
        return math.world_to_screen(slot_0_0_0(arg_3_0, arg_3_1, arg_3_2 + slot_0_18_0))
end

function slot_0_20_0()
        return slot_0_15_0.wep:get_value():get():get_raw()
end

function slot_0_21_0()
        local var_5_0 = slot_0_15_0.style:get_value():get()
        local var_5_1 = type(var_5_0) == "userdata" and var_5_0.get_raw and var_5_0:get_raw() or 0

        for iter_5_0 = 0, 3 do
                if slot_0_8_0(var_5_1, 2^iter_5_0) ~= 0 then
                        return iter_5_0
                end
        end

        return 0
end

function slot_0_22_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7, arg_6_8)
        local var_6_0
        local var_6_1

        for iter_6_0 = 0, 360, arg_6_8 or slot_0_11_0 do
                local var_6_2, var_6_3, var_6_4 = slot_0_17_0(arg_6_1, arg_6_2, arg_6_4, arg_6_5, slot_0_5_0(iter_6_0))
                local var_6_5 = slot_0_19_0(var_6_2, var_6_3, arg_6_3)

                if var_6_5 then
                        if var_6_0 then
                                arg_6_0:add_line(slot_0_1_0(var_6_0, var_6_1), slot_0_1_0(var_6_5.x, var_6_5.y), arg_6_7(iter_6_0, var_6_4, arg_6_6), 2)
                        end

                        var_6_0, var_6_1 = var_6_5.x, var_6_5.y
                else
                        var_6_0, var_6_1 = nil
                end
        end
end

function slot_0_23_0(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6, arg_7_7)
        local var_7_0 = arg_7_7 % 6 / 6

        slot_0_22_0(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5, arg_7_6, function(arg_8_0, arg_8_1, arg_8_2)
                local var_8_0, var_8_1, var_8_2 = slot_0_16_0((arg_8_0 / 360 + var_7_0) % 1)

                return slot_0_2_0(var_8_0, var_8_1, var_8_2, slot_0_6_0((arg_8_1 < 0.95 and 150 or 255) * arg_8_2))
        end)
end

function slot_0_24_0(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6, arg_9_7)
        for iter_9_0, iter_9_1 in ipairs({
                0,
                90,
                180,
                270
        }) do
                local var_9_0
                local var_9_1

                for iter_9_2 = -15, 15, 2 do
                        local var_9_2, var_9_3 = slot_0_17_0(arg_9_1, arg_9_2, arg_9_4, arg_9_5, slot_0_5_0(iter_9_1 + iter_9_2))
                        local var_9_4 = slot_0_19_0(var_9_2, var_9_3, arg_9_3)

                        if var_9_4 then
                                if var_9_0 then
                                        local var_9_5 = slot_0_6_0(255 * arg_9_6 * (1 - slot_0_7_0(iter_9_2) / 15) * (0.8 + 0.2 * slot_0_3_0(arg_9_7 * 2 + iter_9_1 * 0.02)))

                                        arg_9_0:add_line(slot_0_1_0(var_9_0, var_9_1), slot_0_1_0(var_9_4.x, var_9_4.y), slot_0_2_0(255, 255, 255, var_9_5), 2.5)
                                end

                                var_9_0, var_9_1 = var_9_4.x, var_9_4.y
                        else
                                var_9_0, var_9_1 = nil
                        end
                end

                local var_9_6, var_9_7 = slot_0_17_0(arg_9_1, arg_9_2, arg_9_4, arg_9_5, slot_0_5_0(iter_9_1))
                local var_9_8 = slot_0_19_0(var_9_6, var_9_7, arg_9_3)

                if var_9_8 then
                        arg_9_0:add_circle_filled(slot_0_1_0(var_9_8.x, var_9_8.y), 4, slot_0_2_0(255, 255, 255, slot_0_6_0(200 * arg_9_6)))
                end
        end
end

function slot_0_25_0(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6, arg_10_7)
        for iter_10_0 = 0, 11 do
                local var_10_0 = slot_0_5_0(iter_10_0 * 30 + arg_10_7 * 48)
                local var_10_1, var_10_2, var_10_3 = slot_0_17_0(arg_10_1, arg_10_2, arg_10_4, arg_10_5, var_10_0)
                local var_10_4 = slot_0_19_0(var_10_1, var_10_2, arg_10_3)

                if var_10_4 then
                        local var_10_5, var_10_6, var_10_7 = slot_0_16_0((iter_10_0 / 12 + arg_10_7 * 0.1) % 1)
                        local var_10_8 = slot_0_6_0((var_10_3 < 0.95 and 150 or 255) * arg_10_6)

                        arg_10_0:add_circle_filled(slot_0_1_0(var_10_4.x, var_10_4.y), 5, slot_0_2_0(var_10_5, var_10_6, var_10_7, var_10_8))
                        arg_10_0:add_circle_filled(slot_0_1_0(var_10_4.x, var_10_4.y), 8, slot_0_2_0(var_10_5, var_10_6, var_10_7, slot_0_6_0(var_10_8 * 0.3)))

                        for iter_10_1 = 1, 3 do
                                local var_10_9, var_10_10 = slot_0_17_0(arg_10_1, arg_10_2, arg_10_4, arg_10_5, var_10_0 - slot_0_5_0(iter_10_1 * 8))
                                local var_10_11 = slot_0_19_0(var_10_9, var_10_10, arg_10_3)

                                if var_10_11 then
                                        arg_10_0:add_circle_filled(slot_0_1_0(var_10_11.x, var_10_11.y), 5 * (1 - iter_10_1 * 0.2), slot_0_2_0(var_10_5, var_10_6, var_10_7, slot_0_6_0(var_10_8 * (1 - iter_10_1 * 0.25))))
                                end
                        end
                end
        end

        slot_0_22_0(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6, function()
                return slot_0_2_0(255, 255, 255, slot_0_6_0(30 * arg_10_6))
        end, 15)
end

function slot_0_26_0(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6, arg_12_7)
        local var_12_0 = slot_0_15_0.col:get_value():get()
        local var_12_1 = var_12_0:get_r()
        local var_12_2 = var_12_0:get_g()
        local var_12_3 = var_12_0:get_b()

        slot_0_22_0(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6, function(arg_13_0, arg_13_1, arg_13_2)
                return slot_0_2_0(var_12_1, var_12_2, var_12_3, slot_0_6_0((arg_13_1 < 0.95 and 150 or 255) * arg_13_2))
        end)
end

slot_0_27_0 = {
        slot_0_23_0,
        slot_0_24_0,
        slot_0_25_0,
        slot_0_26_0
}
slot_0_28_0 = {
        fade_rng = 0,
        t = 0,
        fading_out = false
}

events.present_queue:add(function()
        local var_14_0 = slot_0_20_0()

        if var_14_0 == 0 or not game.engine:in_game() then
                return
        end

        local var_14_1 = entities.get_local_pawn()

        if not var_14_1 or not var_14_1:is_alive() then
                return
        end

        local var_14_2 = var_14_1.get_active_weapon and var_14_1:get_active_weapon()

        if not var_14_2 then
                local var_14_3 = var_14_1.m_pWeaponServices
                local var_14_4 = var_14_3 and var_14_3.m_hActiveWeapon

                if var_14_4 and type(var_14_4) ~= "number" and var_14_4.get then
                        var_14_4 = var_14_4:get()
                end

                if var_14_4 and var_14_4 ~= 0 and var_14_4 ~= 4294967295 then
                        var_14_2 = entities.get_by_handle(var_14_4)
                end
        end

        if not var_14_2 then
                return
        end

        local var_14_5 = var_14_2.get_id and var_14_2:get_id()
        local var_14_6 = game.global_vars.cur_time
        local var_14_7
        local var_14_8

        if var_14_5 == weapon_id.taser and slot_0_8_0(var_14_0, 1) ~= 0 then
                var_14_7, var_14_8 = "z", slot_0_9_0
        elseif slot_0_14_0[var_14_5] and slot_0_8_0(var_14_0, 2) ~= 0 then
                var_14_7, var_14_8 = "k", slot_0_10_0
        end

        if var_14_7 ~= slot_0_28_0.last then
                if var_14_7 == nil and slot_0_28_0.last ~= nil then
                        slot_0_28_0.fading_out = true
                        slot_0_28_0.fade_rng = slot_0_28_0.last == "z" and slot_0_9_0 or slot_0_10_0
                else
                        slot_0_28_0.fading_out = false
                end

                slot_0_28_0.t = var_14_6
                slot_0_28_0.last = var_14_7
        end

        if not var_14_8 and not slot_0_28_0.fading_out then
                return
        end

        if not var_14_8 and slot_0_28_0.fading_out then
                var_14_8 = slot_0_28_0.fade_rng
        end

        if not var_14_8 then
                return
        end

        local var_14_9 = var_14_1:get_abs_origin()

        if not var_14_9 then
                return
        end

        local var_14_10 = var_14_9.x
        local var_14_11 = var_14_9.y
        local var_14_12 = var_14_9.z
        local var_14_13 = (var_14_1:get_eye_pos() or {
                z = var_14_12 + 64
        }).z
        local var_14_14 = var_14_6 - slot_0_28_0.t
        local var_14_15 = var_14_14 < slot_0_12_0 and var_14_14 / slot_0_12_0 or 1

        if slot_0_28_0.fading_out then
                var_14_15 = 1 - var_14_15

                if var_14_15 <= 0.01 then
                        slot_0_28_0.fading_out = false

                        return
                end
        end

        slot_0_18_0 = slot_0_15_0.height:get_value():get()

        slot_0_27_0[slot_0_21_0() + 1](draw.surface, var_14_10, var_14_11, var_14_12, var_14_13, var_14_8, var_14_15, game.global_vars.real_time)
end)
