--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements a")
slot_0_1_0 = false

function slot_0_2_0()
        local var_1_0 = gui.checkbox(gui.control_id("[HvHmaster]vote_info"))

        if not var_1_0 then
                print("创建 '[HvHmaster]vote_info' 复选框失败！")

                return
        end

        local var_1_1 = gui.make_control("[HvHmaster]Vote Info", var_1_0)

        slot_0_0_0:add(var_1_1)
        var_1_0:set_value(slot_0_1_0)
        var_1_0:add_callback(function()
                slot_0_1_0 = var_1_0:get_value():get()
        end)

        return var_1_0
end

slot_0_3_0 = gui.checkbox(gui.control_id("lua>elements a>hitlog_chat"))
slot_0_4_0 = gui.make_control("[HvHmaster]Hitlog", slot_0_3_0)

slot_0_0_0:add(slot_0_4_0)
slot_0_3_0:set_value(false)

slot_0_5_0 = gui.checkbox(gui.control_id("lua>elements a>incoming_chat"))
slot_0_6_0 = gui.make_control("[HvHmaster]HurtReport", slot_0_5_0)

slot_0_0_0:add(slot_0_6_0)
slot_0_5_0:set_value(false)

slot_0_7_0 = gui.checkbox(gui.control_id("Hit_Log"))
slot_0_8_0 = gui.checkbox(gui.control_id("Hurt_Log"))
slot_0_9_0 = gui.make_control("[HvHmaster]Hurt | Hit Log", slot_0_7_0)

slot_0_9_0:add(slot_0_8_0)
gui.ctx:find("lua>elements a"):add(slot_0_9_0)
slot_0_7_0:set_value(false)
slot_0_8_0:set_value(false)

slot_0_11_0 = gui.checkbox(gui.control_id("lua>elements a>hitmarkers"))
slot_0_12_0 = gui.make_control("[HvHmaster]Hitmarkers", slot_0_11_0)

slot_0_0_0:add(slot_0_12_0)
slot_0_11_0:set_value(false)

slot_0_13_0 = gui.checkbox(gui.control_id("lua>elements a>indicator"))
slot_0_14_0 = gui.make_control("[HvHmaster]Watermark", slot_0_13_0)

slot_0_0_0:add(slot_0_14_0)
slot_0_13_0:set_value(false)

slot_0_15_0 = gui.checkbox(gui.control_id("lua>elements a>weapon_circle"))
slot_0_16_0 = gui.make_control("[HvHmaster]WeaponCircle", slot_0_15_0)

slot_0_0_0:add(slot_0_16_0)
slot_0_15_0:set_value(false)

slot_0_17_0 = gui.ctx:find("lua>elements a")
slot_0_18_0 = gui.ctx.user.username
slot_0_19_0 = {
        "【HVHmaster】",
        "【HVHmaster】"
}
slot_0_20_0 = {
        "【HVHmaster】简单击杀",
        "【HVHmaster】枪枪爆头好运连连"
}

function slot_0_21_0()
        frame_rate = 0.9 * frame_rate + 0.09999999999999998 * game.global_vars.frame_time

        return math.floor(1 / frame_rate + 0.5)
end

function slot_0_22_0(arg_4_0, arg_4_1)
        local var_4_0 = arg_4_1.x - arg_4_0.x
        local var_4_1 = arg_4_1.y - arg_4_0.y
        local var_4_2 = arg_4_1.z - arg_4_0.z

        return math.sqrt(var_4_0 * var_4_0 + var_4_1 * var_4_1 + var_4_2 * var_4_2)
end

function slot_0_23_0(arg_5_0)
        local var_5_0 = false

        if arg_5_0:get_name() == "player_hurt" and game.engine:in_game() then
                local var_5_1
                local var_5_2
                local var_5_3 = entities.get_local_pawn()
                local var_5_4 = arg_5_0:get_pawn_from_id("userid")
                local var_5_5 = arg_5_0:get_pawn_from_id("attacker")

                if not var_5_5 and var_5_4 then
                        var_5_1 = "yourself"
                        var_5_2 = var_5_4:get_abs_origin()
                else
                        var_5_1 = var_5_5:get_name()
                        var_5_2 = var_5_5:get_abs_origin()
                end

                local var_5_6 = arg_5_0:get_controller("userid")

                if not var_5_6 then
                        return
                end

                local var_5_7 = var_5_6:get_name()
                local var_5_8 = arg_5_0:get_string("weapon")
                local var_5_9 = arg_5_0:get_pawn_from_id("userid"):get_name()
                local var_5_10 = arg_5_0:get_int("dmg_health")
                local var_5_11 = arg_5_0:get_int("health")
                local var_5_12 = arg_5_0:get_int("hitgroup")
                local var_5_13 = ({
                        [0] = "unknown",
                        "Head",
                        "neck",
                        "Spine",
                        "Left Hand",
                        "Right Hand",
                        "Left Leg",
                        "Right Leg"
                })[var_5_12] or "unknown"
                local var_5_14 = var_5_4:get_abs_origin()
                local var_5_15 = slot_0_22_0(var_5_2, var_5_14) * 0.1
                local var_5_16 = math.floor(var_5_15)

                if var_5_4 == var_5_3 and slot_0_8_0:get_value():get() then
                        local var_5_17 = string.format("Hurt by: %s | Damage: %d HP | Hit site: %s | Remaining: %d ", var_5_1, var_5_10, var_5_13, var_5_11)
                        local var_5_18 = gui.notification("Hurt Message", var_5_17, draw.textures.icon_close)

                        gui.notify:add(var_5_18)
                end

                if var_5_4:is_enemy() then
                        local var_5_19 = string.format("Damage: %d HP | Hit site: %s | Distance: %dm ", var_5_10, var_5_13, var_5_16)
                        local var_5_20 = gui.notification("Hit Message", var_5_19, draw.textures.icon_rage)

                        if slot_0_7_0:get_value():get() then
                                gui.notify:add(var_5_20)
                        end
                end
        end
end

events.event:add(slot_0_23_0)

function slot_0_24_0(arg_6_0)
        if not slot_0_3_0:get_value():get() then
                return
        end

        local var_6_0 = arg_6_0:get_controller("attacker")

        if not var_6_0 then
                return
        end

        local var_6_1 = entities.get_local_controller()

        if not var_6_1 then
                return
        end

        if var_6_0 ~= var_6_1 then
                return
        end

        local var_6_2 = arg_6_0:get_controller("userid")

        if not var_6_2 then
                return
        end

        local var_6_3 = var_6_2:get_name()
        local var_6_4 = arg_6_0:get_int("dmg_health")
        local var_6_5 = arg_6_0:get_int("hitgroup")
        local var_6_6 = "unknown"
        local var_6_7 = var_6_0:get_pawn():get_active_weapon()

        if var_6_7 then
                local var_6_8 = var_6_7:get_data()

                if var_6_8 then
                        var_6_6 = var_6_8.name or "unknown"

                        if string.sub(var_6_6, 1, 7) == "weapon_" then
                                var_6_6 = string.sub(var_6_6, 8)
                        end
                end
        end

        local var_6_9 = "body"

        if var_6_5 == 1 then
                var_6_9 = "头部"
        elseif var_6_5 == 2 then
                var_6_9 = "身体"
        elseif var_6_5 == 3 then
                var_6_9 = "屁股"
        elseif var_6_5 == 4 then
                var_6_9 = "左手"
        elseif var_6_5 == 5 then
                var_6_9 = "右手"
        elseif var_6_5 == 6 then
                var_6_9 = "左腿"
        elseif var_6_5 == 7 then
                var_6_9 = "右腿"
        end

        local var_6_10 = string.format("🎯 \x01我正在使用HvHMaster.lua 这使我轻松的用 \x04%s\x01 击中 \x03%s\x01 的 \a%s\x01 输出了 \x02%d\x01 点伤害", var_6_6, var_6_3, var_6_9, var_6_4)

        game.engine:client_cmd("say " .. var_6_10)
end

function slot_0_25_0(arg_7_0)
        if not slot_0_5_0:get_value():get() then
                return
        end

        local var_7_0 = arg_7_0:get_controller("userid")

        if not var_7_0 then
                return
        end

        local var_7_1 = entities.get_local_controller()

        if not var_7_1 then
                return
        end

        if var_7_0 ~= var_7_1 then
                return
        end

        local var_7_2 = arg_7_0:get_controller("attacker")
        local var_7_3 = var_7_2 and var_7_2:get_name() or "未知"
        local var_7_4 = arg_7_0:get_int("dmg_health")
        local var_7_5 = arg_7_0:get_int("hitgroup")
        local var_7_6 = "身体"

        if var_7_5 == 1 then
                var_7_6 = "头部"
        elseif var_7_5 == 2 then
                var_7_6 = "身体"
        elseif var_7_5 == 3 then
                var_7_6 = "屁股"
        elseif var_7_5 == 4 then
                var_7_6 = "左手"
        elseif var_7_5 == 5 then
                var_7_6 = "右手"
        elseif var_7_5 == 6 then
                var_7_6 = "左腿"
        elseif var_7_5 == 7 then
                var_7_6 = "右腿"
        end

        local var_7_7 = "未知武器"

        if var_7_2 then
                local var_7_8 = var_7_2:get_pawn()

                if var_7_8 then
                        local var_7_9 = var_7_8:get_active_weapon()

                        if var_7_9 then
                                local var_7_10 = var_7_9:get_data()

                                if var_7_10 then
                                        var_7_7 = var_7_10.name or "未知武器"

                                        if string.sub(var_7_7, 1, 7) == "weapon_" then
                                                var_7_7 = string.sub(var_7_7, 8)
                                        end
                                end
                        end
                end
        end

        local var_7_11 = string.format("[被击中] 我被 \x04%s\x01 用 \x03%s\x01 击中 \a%s\x01，受到 \x02%d\x01 点伤害！", var_7_3, var_7_7, var_7_6, var_7_4)

        game.engine:client_cmd("say " .. var_7_11)
end

slot_0_26_0 = {}
slot_0_27_0 = {}
slot_0_28_0 = draw.color(0, 0, 0)
slot_0_29_0 = draw.color(255, 36, 131)
slot_0_30_0 = draw.color(255, 255, 255)
slot_0_31_0 = 1
slot_0_32_0 = 10
slot_0_33_0 = 4
slot_0_34_0 = {
        {
                -slot_0_32_0,
                -slot_0_32_0
        },
        {
                slot_0_32_0,
                -slot_0_32_0
        },
        {
                -slot_0_32_0,
                slot_0_32_0
        },
        {
                slot_0_32_0,
                slot_0_32_0
        }
}

events.present_queue:add(function()
        if not slot_0_11_0:get_value():get() then
                return
        end

        local var_8_0 = draw.surface

        var_8_0.font = draw.fonts.gui_debug
        var_8_0.g.anti_alias = true

        for iter_8_0 = #slot_0_26_0, 1, -1 do
                local var_8_1 = slot_0_26_0[iter_8_0]

                if var_8_1 then
                        var_8_1.time = var_8_1.time - game.global_vars.frame_time

                        if var_8_1.time <= 0 then
                                table.remove(slot_0_26_0, iter_8_0)
                        end
                end
        end

        for iter_8_1 = #slot_0_27_0, 1, -1 do
                local var_8_2 = slot_0_27_0[iter_8_1]

                if var_8_2 then
                        var_8_2.progress = math.clamp(var_8_2.progress + game.global_vars.frame_time, 0, 1)

                        if var_8_2.progress >= 1 then
                                var_8_2.opacity = var_8_2.opacity - game.global_vars.frame_time * 2

                                if var_8_2.opacity <= 0 then
                                        table.remove(slot_0_27_0, iter_8_1)

                                        goto label_8_0
                                end
                        end

                        local var_8_3 = math.world_to_screen(var_8_2.position)

                        if var_8_3 then
                                local var_8_4 = string.format("%.0f", var_8_2.damage * var_8_2.progress)
                                local var_8_5 = 25
                                local var_8_6 = draw.text_params.with_h(draw.text_alignment.center)
                                local var_8_7 = slot_0_28_0:a(var_8_2.opacity)

                                var_8_0:add_text(math.vec2(var_8_3.x + 1, var_8_3.y - var_8_5 + 1), var_8_4, var_8_7, var_8_6)

                                local var_8_8 = slot_0_29_0:a(var_8_2.opacity)

                                var_8_0:add_text(math.vec2(var_8_3.x, var_8_3.y - var_8_5), var_8_4, var_8_8, var_8_6)

                                local var_8_9 = slot_0_30_0:a(var_8_2.opacity)

                                for iter_8_2, iter_8_3 in ipairs(slot_0_34_0) do
                                        local var_8_10 = math.vec2(var_8_3.x + iter_8_3[1], var_8_3.y + iter_8_3[2])
                                        local var_8_11 = math.vec2(var_8_3.x + iter_8_3[1] + (iter_8_3[1] > 0 and -slot_0_33_0 or slot_0_33_0), var_8_3.y + iter_8_3[2] + (iter_8_3[2] > 0 and -slot_0_33_0 or slot_0_33_0))

                                        var_8_0:add_line(var_8_10, var_8_11, var_8_9, slot_0_31_0)
                                end
                        end
                end

                ::label_8_0::
        end
end)

slot_0_35_0 = 1
slot_0_36_0 = 0.01
slot_0_37_0 = 1
slot_0_38_0 = 5
slot_0_39_0 = 10
slot_0_40_0 = 77
slot_0_41_0 = 2
slot_0_42_0 = 5
slot_0_43_0 = 0
slot_0_44_0 = 0
slot_0_45_0 = 0
slot_0_46_0 = {
        v = 1,
        h = 0,
        s = 1
}
slot_0_47_0 = draw.color(255, 0, 0, 180)

events.present_queue:add(function()
        if not slot_0_13_0:get_value():get() then
                return
        end

        if not game.engine:in_game() then
                return
        end

        local var_9_0 = draw.surface

        var_9_0.font = draw.fonts.gui_bold

        local var_9_1 = game.global_vars.real_time

        if var_9_1 - slot_0_43_0 >= slot_0_37_0 then
                slot_0_44_0 = math.floor(1 / game.global_vars.frame_time)

                if slot_0_44_0 < 10 then
                        slot_0_44_0 = 10
                end

                slot_0_43_0 = var_9_1
        end

        local var_9_2 = game.global_vars.map_name or "unknown_map"
        local var_9_3 = 15

        if var_9_3 < #var_9_2 then
                var_9_2 = var_9_2:sub(1, var_9_3) .. "..."
        end

        local var_9_4 = 0
        local var_9_5 = game.engine:get_netchan()

        if var_9_5 and not var_9_5:is_null() then
                var_9_4 = math.floor(var_9_5:get_latency() * 1000)
        end

        local var_9_6 = var_9_4 == 0 and "N/A" or tostring(var_9_4) .. " ms"
        local var_9_7 = string.format("Fatality.win | %s | %d fps | %s | %s", slot_0_18_0, slot_0_44_0, var_9_2, var_9_6)
        local var_9_8 = var_9_0.font:get_text_size(var_9_7)
        local var_9_9, var_9_10 = game.engine:get_screen_size()
        local var_9_11 = draw.vec2(var_9_9 - var_9_8.x - slot_0_39_0 - slot_0_40_0 - slot_0_41_0, slot_0_39_0)
        local var_9_12 = draw.rect(var_9_11.x - slot_0_41_0 - slot_0_42_0, slot_0_39_0 - 2, var_9_11.x + var_9_8.x + slot_0_40_0 + slot_0_42_0, slot_0_39_0 + var_9_8.y + 4)

        if var_9_1 - slot_0_45_0 >= slot_0_36_0 then
                slot_0_45_0 = var_9_1
                slot_0_46_0.h = (slot_0_46_0.h + 1) % 360
                slot_0_47_0 = draw.color():hsv(slot_0_46_0.h, slot_0_46_0.s, slot_0_46_0.v, 0.7)
        end

        local var_9_13 = draw.rect(var_9_12.mins.x - slot_0_35_0, var_9_12.mins.y - slot_0_35_0, var_9_12.maxs.x + slot_0_35_0, var_9_12.maxs.y + slot_0_35_0)

        var_9_0:add_rect_filled_rounded(var_9_13, slot_0_47_0, slot_0_38_0, draw.rounding.all)
        var_9_0:add_rect_filled_rounded(var_9_12, draw.color(30, 30, 30, 200), slot_0_38_0, draw.rounding.all)
        var_9_0:add_text(var_9_11, var_9_7, draw.color(255, 255, 255))
end)

slot_0_48_0 = {}
slot_0_49_0 = {}
slot_0_50_0 = 2
slot_0_51_0 = 2
slot_0_52_0 = 30
slot_0_53_0 = draw.color(255, 0, 150)
slot_0_54_0 = draw.color(0, 0, 0)

function slot_0_55_0(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
        local var_10_0 = arg_10_3:a(arg_10_4)
        local var_10_1 = arg_10_2
        local var_10_2 = arg_10_1.x
        local var_10_3 = arg_10_1.y
        local var_10_4 = draw.vec2(var_10_2, var_10_3 - var_10_1)
        local var_10_5 = draw.vec2(var_10_2 - var_10_1, var_10_3 - var_10_1 / 2)
        local var_10_6 = draw.vec2(var_10_2 - var_10_1 / 2, var_10_3)
        local var_10_7 = draw.vec2(var_10_2, var_10_3 + var_10_1 / 2)
        local var_10_8 = draw.vec2(var_10_2 + var_10_1 / 2, var_10_3)
        local var_10_9 = draw.vec2(var_10_2 + var_10_1, var_10_3 - var_10_1 / 2)

        arg_10_0:add_triangle_filled(var_10_4, var_10_5, var_10_6, var_10_0)
        arg_10_0:add_triangle_filled(var_10_4, var_10_6, var_10_7, var_10_0)
        arg_10_0:add_triangle_filled(var_10_4, var_10_7, var_10_8, var_10_0)
        arg_10_0:add_triangle_filled(var_10_4, var_10_8, var_10_9, var_10_0)
end

events.present_queue:add(function()
        if not game.engine:in_game() then
                return
        end

        local var_11_0 = draw.surface

        var_11_0.font = draw.fonts.gui_main
        var_11_0.g.anti_alias = true

        for iter_11_0 = #slot_0_48_0, 1, -1 do
                local var_11_1 = slot_0_48_0[iter_11_0]

                if var_11_1 then
                        var_11_1.time = var_11_1.time - game.global_vars.frame_time

                        if var_11_1.time <= 0 then
                                table.remove(slot_0_48_0, iter_11_0)
                        end
                end
        end

        for iter_11_1 = #slot_0_49_0, 1, -1 do
                local var_11_2 = slot_0_49_0[iter_11_1]

                if var_11_2 then
                        var_11_2.lifetime = var_11_2.lifetime - game.global_vars.frame_time
                        var_11_2.opacity = var_11_2.opacity - slot_0_51_0 * game.global_vars.frame_time
                        var_11_2.vertical_offset = var_11_2.vertical_offset + slot_0_52_0 * game.global_vars.frame_time

                        if var_11_2.lifetime <= 0 or var_11_2.opacity <= 0 then
                                table.remove(slot_0_49_0, iter_11_1)
                        else
                                local var_11_3 = math.world_to_screen(var_11_2.position)

                                if var_11_3 then
                                        local var_11_4 = draw.vec2(var_11_3.x, var_11_3.y - var_11_2.vertical_offset)

                                        slot_0_55_0(var_11_0, var_11_4, var_11_2.size, var_11_2.color, var_11_2.opacity)
                                end
                        end
                end
        end
end)
mods.events:add_listener("bullet_impact")
events.event:add(function(arg_12_0)
        if arg_12_0:get_name() == "bullet_impact" then
                local var_12_0 = entities.get_local_pawn()
                local var_12_1 = arg_12_0:get_pawn_from_id("userid")

                if var_12_0 and var_12_1 == var_12_0 then
                        table.insert(slot_0_48_0, {
                                time = 1.5,
                                position = math.vec3(arg_12_0:get_float("x"), arg_12_0:get_float("y"), arg_12_0:get_float("z"))
                        })
                end
        end
end)
mods.events:add_listener("player_hurt")
events.event:add(function(arg_13_0)
        if arg_13_0:get_name() == "player_hurt" then
                local var_13_0 = entities.get_local_pawn()
                local var_13_1 = arg_13_0:get_pawn_from_id("userid")
                local var_13_2 = arg_13_0:get_pawn_from_id("attacker")

                if not var_13_0 or not var_13_1 or not var_13_2 then
                        return
                end

                if var_13_1 ~= var_13_0 and var_13_2 == var_13_0 then
                        local var_13_3 = var_13_1:get_abs_origin()
                        local var_13_4 = math.huge
                        local var_13_5

                        for iter_13_0, iter_13_1 in ipairs(slot_0_48_0) do
                                local var_13_6 = iter_13_1.position:dist_sqr(var_13_3)

                                if var_13_6 < var_13_4 then
                                        var_13_4 = var_13_6
                                        var_13_5 = iter_13_1
                                end
                        end

                        if var_13_5 then
                                table.insert(slot_0_49_0, {
                                        lifetime = 2,
                                        opacity = 255,
                                        size = 8,
                                        vertical_offset = 0,
                                        position = var_13_5.position,
                                        color = slot_0_53_0
                                })

                                slot_0_48_0 = {}
                        end
                end
        end
end)

slot_0_56_0 = 10
slot_0_57_0 = 5
slot_0_58_0 = 300
slot_0_59_0 = -300
slot_0_60_0, slot_0_61_0 = game.engine:get_screen_size()

events.present_queue:add(function()
        if not slot_0_15_0:get_value():get() then
                return
        end

        if not game.engine:in_game() then
                return
        end

        slot_14_0_0 = draw.surface
        slot_14_0_0.g.anti_alias = true
        slot_14_0_0.font = draw.fonts.gui_main
        slot_14_2_0 = entities.get_local_pawn()

        if not slot_14_2_0 then
                return
        end

        slot_14_3_0 = slot_14_2_0:get_active_weapon()

        if not slot_14_3_0 then
                return
        end

        slot_14_4_0 = slot_14_3_0.m_iClip1
        slot_14_5_0 = 0

        if slot_14_4_0 and slot_14_4_0.get then
                slot_14_5_0 = slot_14_4_0:get() or 0
        end

        slot_14_6_0 = slot_14_3_0:get_data()
        slot_14_7_0 = 150

        if slot_14_6_0 and slot_14_6_0.max_clip1 then
                if type(slot_14_6_0.max_clip1) == "number" then
                        slot_14_7_0 = slot_14_6_0.max_clip1
                elseif slot_14_6_0.max_clip1.get then
                        slot_14_7_0 = slot_14_6_0.max_clip1:get()
                end
        end

        slot_14_8_0 = math.ceil(slot_14_5_0 / slot_14_7_0 * slot_0_56_0)
        slot_14_9_0, slot_14_10_0 = game.engine:get_screen_size()
        slot_14_11_0 = draw.vec2(slot_14_9_0 / 2 + slot_0_58_0, slot_14_10_0 / 2 + slot_0_59_0)
        slot_14_12_0 = slot_14_0_0.font:get_text_size("M")
        slot_14_13_0 = slot_14_12_0.x * 4
        slot_14_14_0 = slot_14_13_0 - slot_0_57_0
        slot_14_15_0 = draw.color(0, 255, 0, 220)
        slot_14_16_0 = draw.color(80, 80, 80, 150)
        slot_14_17_0 = math.pi * 2 / slot_0_56_0

        for iter_14_0 = 0, slot_0_56_0 - 1 do
                slot_14_22_1 = iter_14_0 * slot_14_17_0
                slot_14_23_2 = (iter_14_0 + 1) * slot_14_17_0
                slot_14_24_1 = draw.vec2(slot_14_11_0.x + slot_14_13_0 * math.cos(slot_14_22_1), slot_14_11_0.y + slot_14_13_0 * math.sin(slot_14_22_1))
                slot_14_25_1 = draw.vec2(slot_14_11_0.x + slot_14_13_0 * math.cos(slot_14_23_2), slot_14_11_0.y + slot_14_13_0 * math.sin(slot_14_23_2))
                slot_14_26_1 = draw.vec2(slot_14_11_0.x + slot_14_14_0 * math.cos(slot_14_23_2), slot_14_11_0.y + slot_14_14_0 * math.sin(slot_14_23_2))
                slot_14_27_1 = draw.vec2(slot_14_11_0.x + slot_14_14_0 * math.cos(slot_14_22_1), slot_14_11_0.y + slot_14_14_0 * math.sin(slot_14_22_1))

                if iter_14_0 < slot_14_8_0 then
                        slot_14_0_0:add_quad_filled(slot_14_24_1, slot_14_25_1, slot_14_26_1, slot_14_27_1, slot_14_15_0)
                else
                        slot_14_0_0:add_quad_filled(slot_14_24_1, slot_14_25_1, slot_14_26_1, slot_14_27_1, slot_14_16_0)
                end
        end

        slot_14_18_0 = slot_14_6_0 and slot_14_6_0.name or "Unknown"

        if string.sub(slot_14_18_0, 1, 7) == "weapon_" then
                slot_14_18_0 = string.sub(slot_14_18_0, 8)
        end

        slot_14_19_0 = draw.text_params.with_h(draw.text_alignment.center)
        slot_14_20_0 = slot_14_0_0.font:get_text_size(slot_14_18_0)
        slot_14_21_0 = nil
        slot_14_22_0 = gui.ctx:find("rbot.antiaim.base.doubletap")

        if slot_14_22_0 then
                slot_14_23_1 = slot_14_22_0:get_value()

                if slot_14_23_1 and slot_14_23_1:get() then
                        slot_14_21_0 = (slot_14_22_0.get_charge and slot_14_22_0:get_charge() or 1) < 0.5 and " | DT-ONE" or " | DT-TWO"
                end
        end

        slot_14_23_0 = slot_14_21_0 and slot_14_0_0.font:get_text_size(slot_14_21_0) or nil
        slot_14_24_0 = tostring(slot_14_5_0)
        slot_14_25_0 = slot_14_0_0.font:get_text_size(slot_14_24_0)
        slot_14_26_0 = 0

        if slot_14_21_0 and slot_14_23_0 then
                slot_14_26_0 = -(slot_14_23_0.y / 2)
        end

        slot_14_27_0 = draw.vec2(slot_14_11_0.x, slot_14_11_0.y - slot_14_20_0.y / 2 + slot_14_26_0)
        slot_14_28_0 = draw.vec2(slot_14_27_0.x + 1, slot_14_27_0.y + 1)

        slot_14_0_0:add_text(slot_14_28_0, slot_14_18_0, draw.color(0, 0, 0, 200), slot_14_19_0)
        slot_14_0_0:add_text(slot_14_27_0, slot_14_18_0, draw.color(255, 255, 255), slot_14_19_0)

        if slot_14_21_0 then
                slot_14_29_1 = draw.vec2(slot_14_11_0.x, slot_14_11_0.y + slot_14_20_0.y / 2 + slot_14_26_0)
                slot_14_30_1 = draw.vec2(slot_14_29_1.x + 1, slot_14_29_1.y + 1)

                slot_14_0_0:add_text(slot_14_30_1, slot_14_21_0, draw.color(0, 0, 0, 200), slot_14_19_0)
                slot_14_0_0:add_text(slot_14_29_1, slot_14_21_0, slot_14_15_0, slot_14_19_0)
        end

        slot_14_29_0 = draw.vec2(slot_14_11_0.x, slot_14_11_0.y + slot_14_13_0 + slot_14_12_0.y / 2)
        slot_14_30_0 = draw.vec2(slot_14_29_0.x + 1, slot_14_29_0.y + 1)

        slot_14_0_0:add_text(slot_14_30_0, slot_14_24_0, draw.color(0, 0, 0, 200), slot_14_19_0)
        slot_14_0_0:add_text(slot_14_29_0, slot_14_24_0, slot_14_15_0, slot_14_19_0)
end)
mods.events:add_listener("player_hurt")
mods.events:add_listener("bullet_impact")
events.event:add(function(arg_15_0)
        local var_15_0 = arg_15_0:get_name()

        if var_15_0 == "player_hurt" then
                slot_0_24_0(arg_15_0)
                slot_0_25_0(arg_15_0)
        end

        if not slot_0_11_0:get_value():get() then
                return
        end

        if var_15_0 == "bullet_impact" then
                local var_15_1 = entities.get_local_pawn()

                if arg_15_0:get_pawn_from_id("userid") == var_15_1 then
                        table.insert(slot_0_26_0, {
                                time = 1.5,
                                position = math.vec3(arg_15_0:get_float("x"), arg_15_0:get_float("y"), arg_15_0:get_float("z"))
                        })
                end
        end

        if var_15_0 == "player_hurt" then
                local var_15_2 = entities.get_local_pawn()
                local var_15_3 = arg_15_0:get_pawn_from_id("userid")
                local var_15_4 = arg_15_0:get_pawn_from_id("attacker")

                if var_15_3 ~= var_15_2 and var_15_4 == var_15_2 then
                        local var_15_5 = var_15_3:get_abs_origin()
                        local var_15_6 = math.huge
                        local var_15_7

                        for iter_15_0, iter_15_1 in ipairs(slot_0_26_0) do
                                local var_15_8 = iter_15_1.position:dist_sqr(var_15_5)

                                if var_15_8 < var_15_6 then
                                        var_15_6 = var_15_8
                                        var_15_7 = iter_15_1
                                end
                        end

                        if var_15_7 then
                                table.insert(slot_0_27_0, {
                                        opacity = 1,
                                        progress = 0,
                                        position = var_15_7.position,
                                        damage = arg_15_0:get_int("dmg_health")
                                })

                                slot_0_26_0 = {}
                        end
                end
        end
end)

function slot_0_62_0(arg_16_0)
        if not slot_0_1_0 then
                return
        end

        if arg_16_0:get_name() ~= "vote_cast" then
                return
        end

        local var_16_0 = arg_16_0:get_int("vote_option")
        local var_16_1 = arg_16_0:get_int("team")
        local var_16_2 = arg_16_0:get_pawn_from_id("userid")

        if not var_16_2 or var_16_2:is_null() then
                print("无法获取投票玩家的信息 (user_pawn)")

                return
        end

        local var_16_3 = var_16_2:get_name() or "Unknown"
        local var_16_4 = var_16_0 == 0 and "Yes" or "No"
        local var_16_5 = var_16_1 == 2 and "T" or var_16_1 == 3 and "CT" or "Unknown"
        local var_16_6 = string.format("Team: %s | Vote: %s | Player: %s", var_16_5, var_16_4, var_16_3)

        print(var_16_6)
        game.engine:client_cmd("say " .. var_16_6)
end

;(function()
        slot_0_2_0()
        events.event:add(slot_0_62_0)
end)()
print("✅ [HvHmaster脚本] 击中播报、被击中播报、击中显示伤害值 & 水印 全部加载成功！")
print("🕵️‍♂️ 作者:Emomo 交流群:799279486!")
print("✅ 版本V1")
