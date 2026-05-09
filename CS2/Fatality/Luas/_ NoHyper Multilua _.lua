--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements b")
slot_0_1_0 = gui.checkbox(gui.control_id("resolver"))
slot_0_2_0 = gui.make_control("{NH} Custom Resolver", slot_0_1_0)

slot_0_0_0:add(slot_0_2_0)
slot_0_0_0:reset()

slot_0_3_0 = gui.ctx:find("lua>elements a")
slot_0_4_0 = gui.checkbox(gui.control_id("killsay"))
slot_0_5_0 = gui.make_control("{NH} Killsay", slot_0_4_0)

slot_0_3_0:add(slot_0_5_0)

slot_0_6_0 = gui.checkbox(gui.control_id("antiafk"))
slot_0_7_0 = gui.make_control("{NH} Anti-AFK", slot_0_6_0)

slot_0_3_0:add(slot_0_7_0)

slot_0_8_0 = gui.checkbox(gui.control_id("owind"))
slot_0_9_0 = gui.make_control("{NH} Wallbang Helper (MIRAGE ONLY)", slot_0_8_0)

slot_0_3_0:add(slot_0_9_0)

slot_0_10_0 = {
        "1 $$$",
        "You don't need to turn off ragebot for my hvh highlights video bro..",
        "♿",
        "Respectfully you just got shit on",
        "Erm I think you forgot to turn on your ragebot",
        "cfg issue",
        "You're the reason cheat devs put 'No Refunds' in their TOS",
        "sit nn dog",
        "Dying with rage cheats to a full legit is wild",
        "ez",
        "skill issue",
        "kd higher than your iq",
        "user issue",
        "​​𝕚 𝕒𝕞 𝕟𝕠𝕨 𝕠𝕟 𝕕𝕖𝕞𝕠𝕟 𝕞𝕠𝕕𝕖 (◣_◢)",
        "I thought I put the bots on hard mode",
        "𝙼𝚈 𝙱𝙾𝚃𝙽𝙴𝚃 𝙳𝙾𝙴𝚂𝙽𝚃 𝙲𝙰𝚁𝙴 𝙰𝙱𝙾𝚄𝚃 𝚈𝙾𝚄𝚁 𝙵𝙴𝙴𝙻𝙸𝙽𝙶𝚂",
        "I am a proud ezfrags beta user",
        "You're proof they let anyone play this game.",
        "𝔾𝕆𝔻 𝕊𝔼ℕ𝕋 𝕄𝔼 𝕋𝕆 ℍ𝕊",
        "bot_kick",
        "(◣_◢)",
        "Potato ping killed you",
        "God I wish I had moneybot",
        "Brett delivered by Obi"
}

function slot_0_11_0(arg_1_0)
        if arg_1_0:get_name() == "player_death" and slot_0_4_0:get_value():get() then
                local var_1_0 = arg_1_0:get_pawn_from_id("attacker")

                if var_1_0 and var_1_0 == entities.get_local_pawn() then
                        game.engine:client_cmd("say " .. slot_0_10_0[math.random(1, #slot_0_10_0)])
                end
        end
end

mods.events:add_listener("player_death")
events.event:add(slot_0_11_0)

slot_0_12_0 = gui.checkbox(gui.control_id("lua>elements a>3ddamhitmarkers"))
slot_0_13_0 = gui.checkbox(gui.control_id("lua>elements a>3dhitmarker"))
slot_0_14_0 = gui.make_control("{NH} 3D Hitmarker", slot_0_13_0)
slot_0_13_0.tooltip = "Crosshair"
slot_0_12_0.tooltip = "Damage"

slot_0_14_0:add(slot_0_12_0)
slot_0_3_0:add(slot_0_14_0)

slot_0_15_0 = {}
slot_0_16_0 = {}
slot_0_17_0 = draw.color(0, 0, 0)
slot_0_18_0 = draw.color(255, 150, 150)
slot_0_19_0 = draw.color(255, 255, 255)
slot_0_20_0 = 0
slot_0_21_0 = 0
slot_0_22_0 = 0
slot_0_23_0 = {
        {
                -slot_0_21_0,
                -slot_0_21_0
        },
        {
                slot_0_21_0,
                -slot_0_21_0
        },
        {
                -slot_0_21_0,
                slot_0_21_0
        },
        {
                slot_0_21_0,
                slot_0_21_0
        }
}
slot_0_24_0 = 255
slot_0_25_1 = 0
slot_0_26_0 = 0
slot_0_25_0 = game.global_vars.cur_time
slot_0_27_0 = 0
slot_0_28_0 = false
slot_0_29_0 = false

function slot_0_30_0()
        if slot_0_27_0 == 0 then
                game.engine:client_cmd(slot_0_28_0 and "-left" or "-right")

                slot_0_27_0 = 1
                slot_0_25_0 = game.global_vars.cur_time
        elseif slot_0_27_0 == 1 then
                slot_0_27_0 = 2
                slot_0_25_0 = game.global_vars.cur_time
        elseif slot_0_27_0 == 2 then
                game.engine:client_cmd(slot_0_28_0 and "+left" or "+right")

                slot_0_27_0 = 0
                slot_0_25_0 = game.global_vars.cur_time
        end

        slot_0_28_0 = not slot_0_28_0
end

events.present_queue:add(function()
        slot_3_0_0 = draw.surface
        slot_3_0_0.font = draw.fonts.gui_debug
        slot_3_0_0.g.anti_alias = true

        if slot_0_6_0:get_value():get() then
                if game.global_vars.cur_time >= slot_0_25_0 + 0.35 then
                        slot_0_30_0()

                        slot_0_29_0 = false
                end
        elseif slot_0_29_0 == false then
                slot_0_29_0 = true

                game.engine:client_cmd("-right")
                game.engine:client_cmd("-left")
        end

        for iter_3_0 = 1, #slot_0_16_0 do
                slot_3_6_0 = slot_0_16_0[iter_3_0]

                if slot_3_6_0 ~= nil then
                        slot_3_6_0.progress = math.clamp(slot_3_6_0.progress + game.global_vars.frame_time, 0, 1)
                        slot_3_6_0.float_offset_y = slot_3_6_0.float_offset_y - math.sin(slot_3_6_0.float_angle) * slot_3_6_0.float_speed * game.global_vars.frame_time
                        slot_3_6_0.oscillation_angle = slot_3_6_0.oscillation_angle + slot_3_6_0.oscillation_speed * game.global_vars.frame_time
                        slot_3_6_0.float_offset_x = slot_3_6_0.float_offset_x

                        if slot_3_6_0.progress >= 1 then
                                slot_3_6_0.opacity = slot_3_6_0.opacity - game.global_vars.frame_time * 1

                                if slot_3_6_0.opacity <= 0 then
                                        table.remove(slot_0_16_0, iter_3_0)

                                        goto label_3_0
                                end
                        end

                        slot_3_7_0 = math.world_to_screen(slot_3_6_0.position)

                        if not slot_3_7_0 then
                                -- block empty
                        else
                                slot_3_8_0 = slot_3_7_0.x
                                slot_3_9_0 = slot_3_7_0.y
                                slot_3_10_0 = draw.surface
                                slot_3_11_0 = draw.vec2(slot_3_8_0 - 5, slot_3_9_0 - 5)
                                slot_3_12_0 = draw.vec2(slot_3_8_0 - 10, slot_3_9_0 - 10)
                                slot_3_13_0 = draw.vec2(slot_3_8_0 - 5, slot_3_9_0 + 5)
                                slot_3_14_0 = draw.vec2(slot_3_8_0 - 10, slot_3_9_0 + 10)
                                slot_3_15_0 = draw.vec2(slot_3_8_0 + 5, slot_3_9_0 - 5)
                                slot_3_16_0 = draw.vec2(slot_3_8_0 + 10, slot_3_9_0 - 10)
                                slot_3_17_0 = draw.vec2(slot_3_8_0 + 5, slot_3_9_0 + 5)
                                slot_3_18_0 = draw.vec2(slot_3_8_0 + 10, slot_3_9_0 + 10)

                                if slot_0_13_0:get_value():get() then
                                        slot_3_19_1 = draw.color(255, 150, 150):a(slot_3_6_0.opacity)
                                        slot_3_20_1 = draw.color(150, 0, 0):a(slot_3_6_0.opacity)

                                        slot_3_10_0:add_line_multicolor(slot_3_11_0, slot_3_12_0, slot_3_19_1, slot_3_20_1)
                                        slot_3_10_0:add_line_multicolor(slot_3_13_0, slot_3_14_0, slot_3_19_1, slot_3_20_1)
                                        slot_3_10_0:add_line_multicolor(slot_3_15_0, slot_3_16_0, slot_3_19_1, slot_3_20_1)
                                        slot_3_10_0:add_line_multicolor(slot_3_17_0, slot_3_18_0, slot_3_19_1, slot_3_20_1)
                                end

                                slot_3_7_0.x = slot_3_7_0.x + slot_3_6_0.float_offset_x
                                slot_3_7_0.y = slot_3_7_0.y + slot_3_6_0.float_offset_y

                                if slot_0_12_0:get_value():get() then
                                        slot_3_19_0 = slot_0_17_0:a(slot_3_6_0.opacity)

                                        slot_3_0_0:add_text(math.vec2(slot_3_7_0.x + 1, slot_3_7_0.y - 20 + 1), string.format("%.0f", slot_3_6_0.damage), slot_3_19_0)

                                        slot_3_20_0 = slot_0_18_0:a(slot_3_6_0.opacity)

                                        slot_3_0_0:add_text(math.vec2(slot_3_7_0.x, slot_3_7_0.y - 20), string.format("%.0f", slot_3_6_0.damage), slot_3_20_0)
                                end
                        end
                end

                ::label_3_0::
        end
end)
events.event:add(function(arg_4_0)
        if not (slot_0_12_0:get_value():get() or slot_0_13_0:get_value():get()) then
                return
        end

        local var_4_0 = arg_4_0:get_name()

        if var_4_0 == "player_hurt" then
                local var_4_1 = entities.get_local_pawn()
                local var_4_2 = arg_4_0:get_pawn_from_id("userid")
                local var_4_3 = arg_4_0:get_pawn_from_id("attacker")

                if var_4_2 == var_4_1 or var_4_3 ~= var_4_1 then
                        return
                end

                local var_4_4 = var_4_2:get_abs_origin()
                local var_4_5 = math.huge
                local var_4_6

                for iter_4_0 = 1, #slot_0_15_0 do
                        local var_4_7 = slot_0_15_0[iter_4_0]
                        local var_4_8 = var_4_7.position:dist_sqr(var_4_4)

                        if var_4_8 < var_4_5 then
                                var_4_5 = var_4_8
                                var_4_6 = var_4_7
                        end
                end

                if var_4_6 == nil then
                        return
                end

                table.insert(slot_0_16_0, {
                        oscillation_speed = 0,
                        oscillation_angle = 0,
                        float_offset_y = 10,
                        progress = 0,
                        oscillation_amplitude = 0,
                        opacity = 1,
                        float_offset_x = 0,
                        float_angle = math.rad(math.random(45, 45)),
                        float_speed = math.random(15, 30),
                        position = var_4_6.position,
                        damage = arg_4_0:get_int("dmg_health")
                })

                slot_0_15_0 = {}
        end

        if var_4_0 == "bullet_impact" then
                local var_4_9 = entities.get_local_pawn()

                if arg_4_0:get_pawn_from_id("userid") ~= var_4_9 then
                        return
                end

                table.insert(slot_0_15_0, {
                        time = 8.5,
                        position = math.vec3(arg_4_0:get_float("x"), arg_4_0:get_float("y"), arg_4_0:get_float("z"))
                })
        end
end)

slot_0_31_0 = gui.checkbox(gui.control_id("crossdamhit"))
slot_0_32_0 = gui.checkbox(gui.control_id("crosshit"))
slot_0_33_0 = gui.make_control("{NH} 2D Hitmarker", slot_0_32_0)
slot_0_31_0.tooltip = "Damage"
slot_0_32_0.tooltip = "Crosshair"

slot_0_33_0:add(slot_0_31_0)
slot_0_3_0:add(slot_0_33_0)

slot_0_34_0 = 0

function slot_0_35_0()
        if slot_0_26_0 == 1 then
                if game.global_vars.cur_time >= slot_0_25_0 + 0.125 then
                        slot_0_24_0 = slot_0_24_0 - 1
                end

                slot_5_0_0, slot_5_1_0 = game.engine:get_screen_size()
                slot_5_2_0 = draw.surface
                slot_5_3_0 = draw.vec2(slot_5_0_0 / 2 - 5, slot_5_1_0 / 2 - 5)
                slot_5_4_0 = draw.vec2(slot_5_0_0 / 2 - 15, slot_5_1_0 / 2 - 15)
                slot_5_5_0 = draw.vec2(slot_5_0_0 / 2 - 5, slot_5_1_0 / 2 + 5)
                slot_5_6_0 = draw.vec2(slot_5_0_0 / 2 - 15, slot_5_1_0 / 2 + 15)
                slot_5_7_0 = draw.vec2(slot_5_0_0 / 2 + 5, slot_5_1_0 / 2 - 5)
                slot_5_8_0 = draw.vec2(slot_5_0_0 / 2 + 15, slot_5_1_0 / 2 - 15)
                slot_5_9_0 = draw.vec2(slot_5_0_0 / 2 + 5, slot_5_1_0 / 2 + 5)
                slot_5_10_0 = draw.vec2(slot_5_0_0 / 2 + 15, slot_5_1_0 / 2 + 15)

                if slot_0_32_0:get_value():get() then
                        slot_5_2_0:add_line_multicolor(slot_5_3_0, slot_5_4_0, draw.color(255, 150, 150, slot_0_24_0), draw.color(150, 0, 0, slot_0_24_0))
                        slot_5_2_0:add_line_multicolor(slot_5_5_0, slot_5_6_0, draw.color(255, 150, 150, slot_0_24_0), draw.color(150, 0, 0, slot_0_24_0))
                        slot_5_2_0:add_line_multicolor(slot_5_7_0, slot_5_8_0, draw.color(255, 150, 150, slot_0_24_0), draw.color(150, 0, 0, slot_0_24_0))
                        slot_5_2_0:add_line_multicolor(slot_5_9_0, slot_5_10_0, draw.color(255, 150, 150, slot_0_24_0), draw.color(150, 0, 0, slot_0_24_0))
                end

                if slot_0_31_0:get_value():get() then
                        slot_5_11_0 = string.format("%i", slot_0_34_0)

                        slot_5_2_0:add_text(draw.vec2(slot_5_0_0 / 2 + 11, slot_5_1_0 / 2 + 7), slot_5_11_0, draw.color(0, 0, 0, slot_0_24_0))
                        slot_5_2_0:add_text(draw.vec2(slot_5_0_0 / 2 + 10, slot_5_1_0 / 2 + 6), slot_5_11_0, draw.color(255, 150, 150, slot_0_24_0))
                end

                if slot_0_24_0 <= 0 then
                        slot_0_26_0 = 0
                        slot_0_34_0 = 0
                end
        end
end

events.present_queue:add(slot_0_35_0)

function slot_0_36_0(arg_6_0)
        if arg_6_0:get_name() == "player_hurt" then
                local var_6_0 = arg_6_0:get_pawn_from_id("attacker")

                if var_6_0 and var_6_0 == entities.get_local_pawn() then
                        slot_0_26_0 = 1
                        slot_0_24_0 = 255
                        slot_0_25_0 = game.global_vars.cur_time
                        slot_0_34_0 = arg_6_0:get_int("dmg_health")
                end
        end
end

events.event:add(slot_0_36_0)

slot_0_37_0 = gui.checkbox(gui.control_id("watermark_1"))
slot_0_38_0 = gui.make_control("{NH} Watermark", slot_0_37_0)

slot_0_3_0:add(slot_0_38_0)
slot_0_3_0:reset()

function slot_0_39_0()
        if slot_0_37_0:get_value():get() then
                slot_7_0_0, slot_7_1_0 = game.engine:get_screen_size()
                slot_7_2_0 = draw.surface
                slot_7_2_0.font = draw.fonts.gui_main
                slot_7_3_0 = game.engine:get_netchan()
                slot_7_4_0 = 0

                if slot_7_3_0 and not slot_7_3_0:is_null() then
                        slot_7_4_0 = math.floor(slot_7_3_0:get_latency() * 1000 + 0.5)
                end

                slot_7_5_0 = string.format("NH Multilua v1.2 | %s | %i Ping", gui.ctx.user.username, slot_7_4_0)
                slot_7_6_0 = slot_7_2_0.font:get_text_size(slot_7_5_0)
                slot_7_7_0 = draw.rect(slot_7_0_0 - slot_7_6_0.x - 8, 2, slot_7_0_0 - 1, 20)
                slot_7_8_0 = draw.rect(slot_7_0_0 - slot_7_6_0.x - 8, 2, slot_7_0_0 - slot_7_6_0.x / 2 - 1, 20)
                slot_7_9_0 = draw.rect(slot_7_0_0 - slot_7_6_0.x / 2 - 8, 2, slot_7_0_0 - 1, 20)
                slot_7_10_0 = draw.vec2(slot_7_0_0 - slot_7_6_0.x - 8, 2)
                slot_7_11_0 = draw.vec2(slot_7_0_0 - slot_7_6_0.x / 2 - 1, 2)
                slot_7_12_0 = draw.vec2(slot_7_0_0 - 1, 2)
                slot_7_13_0 = draw.vec2(slot_7_0_0 - slot_7_6_0.x - 8, 20)
                slot_7_14_0 = draw.vec2(slot_7_0_0 - slot_7_6_0.x / 2 - 1, 20)
                slot_7_15_0 = draw.vec2(slot_7_0_0 - 1, 20)

                slot_7_2_0:add_rect_filled_multicolor(slot_7_8_0, {
                        draw.color(5, 5, 5, 80),
                        draw.color(5, 5, 5, 255),
                        draw.color(5, 5, 5, 255),
                        draw.color(5, 5, 5, 80)
                })
                slot_7_2_0:add_rect_filled_multicolor(slot_7_9_0, {
                        draw.color(5, 5, 5, 255),
                        draw.color(5, 5, 5, 80),
                        draw.color(5, 5, 5, 80),
                        draw.color(5, 5, 5, 255)
                })
                slot_7_2_0:add_line_multicolor(slot_7_10_0, slot_7_11_0, draw.color(255, 0, 0, 150), draw.color(255, 200, 200, 150))
                slot_7_2_0:add_line_multicolor(slot_7_12_0, slot_7_11_0, draw.color(255, 0, 0, 150), draw.color(255, 200, 200, 150))
                slot_7_2_0:add_line_multicolor(slot_7_13_0, slot_7_14_0, draw.color(255, 0, 0, 150), draw.color(255, 200, 200, 150))
                slot_7_2_0:add_line_multicolor(slot_7_15_0, slot_7_14_0, draw.color(255, 0, 0, 150), draw.color(255, 200, 200, 150))
                slot_7_2_0:add_line(slot_7_12_0, slot_7_15_0, draw.color(255, 0, 0, 150))
                slot_7_2_0:add_line(slot_7_10_0, slot_7_13_0, draw.color(255, 0, 0, 150))
                slot_7_2_0:add_text(draw.vec2(slot_7_0_0 - slot_7_6_0.x - 5, 5), slot_7_5_0, draw.color(255, 255, 255, 255))
        end
end

events.present_queue:add(slot_0_39_0)

slot_0_40_0 = {}
slot_0_41_0 = draw.font("verdana.ttf", 12, draw.font_flags.outline)
slot_0_42_0 = gui.checkbox(gui.control_id("lua>elements b>add_waypoint"))
slot_0_43_0 = gui.checkbox(gui.control_id("lua>elements b>clear_waypoint"))
slot_0_44_0 = gui.make_control("Add Waypoint [Click]", slot_0_42_0)
slot_0_45_0 = gui.make_control("Clear Last Waypoint", slot_0_43_0)
slot_0_46_0 = {
        clear = false,
        add = false
}
slot_0_47_0 = {
        {
                label = "Waypoint 1",
                map = "de_mirage",
                pos = vector(703.59, -1603.12, -262.88)
        },
        {
                label = "Waypoint 2",
                map = "de_mirage",
                pos = vector(-1039.57, -327.51, -367.97)
        },
        {
                label = "Waypoint 3",
                map = "de_mirage",
                pos = vector(605.47, -1718.96, -258.09)
        },
        {
                label = "Waypoint 4",
                map = "de_mirage",
                pos = vector(-1005.98, -2480.6, -167.97)
        },
        {
                label = "Waypoint 5",
                map = "de_mirage",
                pos = vector(576.92, -1717.41, -259.04)
        },
        {
                label = "Waypoint 6",
                map = "de_mirage",
                pos = vector(12.23, -2093.41, -39.97)
        },
        {
                label = "Waypoint 7",
                map = "de_mirage",
                pos = vector(509.55, -1665.9, -263.97)
        },
        {
                label = "Waypoint 8",
                map = "de_mirage",
                pos = vector(459.3, -2343.78, -39.97)
        },
        {
                label = "Waypoint 9",
                map = "de_mirage",
                pos = vector(444.76, -1710.55, -234.35)
        },
        {
                label = "Waypoint 10",
                map = "de_mirage",
                pos = vector(1039.96, -1909.43, -71.97)
        },
        {
                label = "Waypoint 11",
                map = "de_mirage",
                pos = vector(430.87, -1523.46, -227.4)
        },
        {
                label = "Waypoint 12",
                map = "de_mirage",
                pos = vector(-675.45, -780.14, -262.05)
        },
        {
                label = "Waypoint 13",
                map = "de_mirage",
                pos = vector(487.58, -1601.25, -255.76)
        },
        {
                label = "Waypoint 14",
                map = "de_mirage",
                pos = vector(527.97, -534.74, -155.97)
        },
        {
                label = "Waypoint 15",
                map = "de_mirage",
                pos = vector(-647.06, -778.04, -261.97)
        },
        {
                label = "Waypoint 16",
                map = "de_mirage",
                pos = vector(419.38, -1522.17, -221.65)
        },
        {
                label = "Waypoint 17",
                map = "de_mirage",
                pos = vector(-628.49, -778.79, -261.97)
        },
        {
                label = "Waypoint 18",
                map = "de_mirage",
                pos = vector(-142.97, -1418.03, -72.18)
        },
        {
                label = "Waypoint 19",
                map = "de_mirage",
                pos = vector(-611.44, -767.45, -261.97)
        },
        {
                label = "Waypoint 20",
                map = "de_mirage",
                pos = vector(-297.2, -1529.68, -167.97)
        },
        {
                label = "Waypoint 21",
                map = "de_mirage",
                pos = vector(-600.88, -739.22, -262.38)
        },
        {
                label = "Waypoint 22",
                map = "de_mirage",
                pos = vector(-391.37, -2031.91, -179.97)
        },
        {
                label = "Waypoint 23",
                map = "de_mirage",
                pos = vector(-152.51, -934.7, -167.55)
        },
        {
                label = "Waypoint 24",
                map = "de_mirage",
                pos = vector(-704.82, -814.35, -263.97)
        },
        {
                label = "Waypoint 25",
                map = "de_mirage",
                pos = vector(-710.23, -812.21, -263.97)
        },
        {
                label = "Waypoint 26",
                map = "de_mirage",
                pos = vector(-1374.63, -987.34, -167.97)
        },
        {
                label = "Waypoint 27",
                map = "de_mirage",
                pos = vector(-999.98, -307.89, -367.97)
        },
        {
                label = "Waypoint 28",
                map = "de_mirage",
                pos = vector(684.14, -1625.9, -262.55)
        },
        {
                label = "Waypoint 29",
                map = "de_mirage",
                pos = vector(-1070.3, -2468.48, -167.97)
        },
        {
                label = "Waypoint 30",
                map = "de_mirage",
                pos = vector(691.76, -1642.52, -258.56)
        },
        {
                label = "Waypoint 31",
                map = "de_mirage",
                pos = vector(-1711.97, -1023.42, -203.92)
        },
        {
                label = "Waypoint 32",
                map = "de_mirage",
                pos = vector(11.61, -607.98, -189.97)
        },
        {
                label = "Waypoint 33",
                map = "de_mirage",
                pos = vector(-1671.04, 564.31, -167.97)
        },
        {
                label = "Waypoint 34",
                map = "de_mirage",
                pos = vector(-1133.83, -786.66, -167.97)
        },
        {
                label = "Waypoint 35",
                map = "de_mirage",
                pos = vector(-1567.95, 526.26, -167.97)
        },
        {
                label = "Waypoint 36",
                map = "de_mirage",
                pos = vector(-1567.95, 526.26, -167.97)
        },
        {
                label = "Waypoint 37",
                map = "de_mirage",
                pos = vector(-1054.21, 731.78, -79.97)
        },
        {
                label = "Waypoint 38",
                map = "de_mirage",
                pos = vector(-1571.11, 525.77, -167.97)
        },
        {
                label = "Waypoint 39",
                map = "de_mirage",
                pos = vector(-1449.3, 252.92, -166.97)
        },
        {
                label = "Waypoint 40",
                map = "de_mirage",
                pos = vector(-1504.24, 750.58, -47.97)
        },
        {
                label = "Waypoint 41",
                map = "de_mirage",
                pos = vector(-1633.51, 115.84, -168.39)
        },
        {
                label = "Waypoint 42",
                map = "de_mirage",
                pos = vector(-752.04, -61.73, -161.07)
        },
        {
                label = "Waypoint 43",
                map = "de_mirage",
                pos = vector(20.35, -2122.48, -39.97)
        },
        {
                label = "Waypoint 44",
                map = "de_mirage",
                pos = vector(667.86, -1601.04, -263.97)
        },
        {
                label = "Waypoint 45",
                map = "de_mirage",
                pos = vector(151.97, -2071.96, -39.97)
        },
        {
                label = "Waypoint 46",
                map = "de_mirage",
                pos = vector(208.15, -1437.61, -175.97)
        },
        {
                label = "Waypoint 47",
                map = "de_mirage",
                pos = vector(15.97, -1740.47, -167.97)
        },
        {
                label = "Waypoint 48",
                map = "de_mirage",
                pos = vector(947.48, -2273.43, -39.97)
        },
        {
                label = "Waypoint 49",
                map = "de_mirage",
                pos = vector(-129.66, -2412.97, -163.97)
        },
        {
                label = "Waypoint 50",
                map = "de_mirage",
                pos = vector(468.79, -2337.59, -39.97)
        },
        {
                label = "Waypoint 51",
                map = "de_mirage",
                pos = vector(735.97, -2390.94, 10.63)
        },
        {
                label = "Waypoint 52",
                map = "de_mirage",
                pos = vector(-282.84, -2399.04, -163.97)
        },
        {
                label = "Waypoint 53",
                map = "de_mirage",
                pos = vector(1179.1, -1479.96, -167.97)
        },
        {
                label = "Waypoint 54",
                map = "de_mirage",
                pos = vector(878.89, -2009.5, -71.97)
        },
        {
                label = "Waypoint 55",
                map = "de_mirage",
                pos = vector(-552.23, -1310.53, -163.97)
        },
        {
                label = "Waypoint 56",
                map = "de_mirage",
                pos = vector(-453.46, -1798.52, -175.77)
        },
        {
                label = "Waypoint 57",
                map = "de_mirage",
                pos = vector(-1504.52, -1420.02, -259.97)
        },
        {
                label = "Waypoint 58",
                map = "de_mirage",
                pos = vector(-327.19, -2037.79, -175.18)
        },
        {
                label = "Waypoint 59",
                map = "de_mirage",
                pos = vector(-1525.03, -1474.21, -259.97)
        },
        {
                label = "Waypoint 60",
                map = "de_mirage",
                pos = vector(-494.8, -702.3, -267.72)
        },
        {
                label = "Waypoint 61",
                map = "de_mirage",
                pos = vector(-1504.39, -1440.34, -259.97)
        },
        {
                label = "Waypoint 62",
                map = "de_mirage",
                pos = vector(-1156.04, -1248.18, -167.97)
        },
        {
                label = "Waypoint 63",
                map = "de_mirage",
                pos = vector(-1556.84, -950.87, -191.93)
        },
        {
                label = "Waypoint 64",
                map = "de_mirage",
                pos = vector(-1041.4, -300.32, -367.97)
        },
        {
                label = "Waypoint 65",
                map = "de_mirage",
                pos = vector(-1041.4, -300.32, -367.97)
        },
        {
                label = "Waypoint 66",
                map = "de_mirage",
                pos = vector(-1572.53, -1607.21, -263.62)
        },
        {
                label = "Waypoint 67",
                map = "de_mirage",
                pos = vector(-1961.6, -472.47, -167.97)
        },
        {
                label = "Waypoint 68",
                map = "de_mirage",
                pos = vector(-1006.52, -321.76, -367.97)
        },
        {
                label = "Waypoint 69",
                map = "de_mirage",
                pos = vector(-1128.4, 295.97, -159.97)
        },
        {
                label = "Waypoint 70",
                map = "de_mirage",
                pos = vector(-436.49, 662.3, -79.64)
        },
        {
                label = "Waypoint 71",
                map = "de_mirage",
                pos = vector(-1073.82, 297.22, -159.97)
        },
        {
                label = "Waypoint 72",
                map = "de_mirage",
                pos = vector(-1012.98, 546.72, -79.97)
        },
        {
                label = "Waypoint 73",
                map = "de_mirage",
                pos = vector(-1839.26, 241.86, -162.15)
        },
        {
                label = "Waypoint 74",
                map = "de_mirage",
                pos = vector(-982.12, 327.82, -367.97)
        },
        {
                label = "Waypoint 75",
                map = "de_mirage",
                pos = vector(-913.93, 112.04, -170.46)
        },
        {
                label = "Waypoint 76",
                map = "de_mirage",
                pos = vector(-1011.93, -163.11, -348.3)
        },
        {
                label = "Waypoint 77",
                map = "de_mirage",
                pos = vector(-2004.44, 682.37, -46.56)
        },
        {
                label = "Waypoint 78",
                map = "de_mirage",
                pos = vector(-1044, -333.05, -357.7)
        },
        {
                label = "Waypoint 79",
                map = "de_mirage",
                pos = vector(-1038.34, 360.31, -367.97)
        },
        {
                label = "Waypoint 80",
                map = "de_mirage",
                pos = vector(-1932.83, -356.13, -167.97)
        },
        {
                label = "Waypoint 81",
                map = "de_mirage",
                pos = vector(-969.88, -378.17, -346.88)
        },
        {
                label = "Waypoint 82",
                map = "de_mirage",
                pos = vector(187.1, 841.37, -135.97)
        },
        {
                label = "Waypoint 83",
                map = "de_mirage",
                pos = vector(-1017.47, -456.4, -307.77)
        },
        {
                label = "Waypoint 84",
                map = "de_mirage",
                pos = vector(-969.66, 240.66, -171.39)
        },
        {
                label = "Waypoint 85",
                map = "de_mirage",
                pos = vector(-710.95, -821.33, -263.97)
        },
        {
                label = "Waypoint 86",
                map = "de_mirage",
                pos = vector(-1255.57, -1440.03, -158.01)
        }
}

;(function()
        for iter_8_0, iter_8_1 in ipairs(slot_0_47_0) do
                table.insert(slot_0_40_0, iter_8_1)
        end
end)()

function slot_0_49_0()
        return (entities.get_local_pawn())
end

function slot_0_50_0()
        return game.global_vars.map_name
end

function slot_0_51_0(arg_11_0)
        return string.format("%.2f, %.2f, %.2f", arg_11_0.x, arg_11_0.y, arg_11_0.z)
end

function slot_0_52_0()
        print("Current Waypoints:")

        for iter_12_0, iter_12_1 in ipairs(slot_0_40_0) do
                print(string.format("Waypoint %d at %s on map %s", iter_12_0, slot_0_51_0(iter_12_1.pos), iter_12_1.map))
        end
end

function slot_0_53_0()
        local var_13_0 = slot_0_49_0()

        if not var_13_0 then
                return
        end

        local var_13_1 = var_13_0:get_abs_origin()
        local var_13_2 = slot_0_50_0()
        local var_13_3 = "Event Name"

        table.insert(slot_0_40_0, {
                pos = var_13_1,
                label = var_13_3,
                map = var_13_2
        })
        print("Added waypoint: " .. var_13_3 .. " at " .. slot_0_51_0(var_13_1) .. " on map " .. var_13_2)
        slot_0_52_0()
        slot_0_42_0:set_value(false)
end

function slot_0_54_0()
        if #slot_0_40_0 > 0 then
                local var_14_0 = table.remove(slot_0_40_0)

                print("Removed last waypoint: " .. var_14_0.label .. " at " .. slot_0_51_0(var_14_0.pos))
        else
                print("No waypoints to remove")
        end

        slot_0_43_0:set_value(false)
end

function slot_0_55_0()
        local var_15_0 = slot_0_42_0:get_value():get()

        if var_15_0 and not slot_0_46_0.add then
                slot_0_53_0()
        end

        slot_0_46_0.add = var_15_0

        local var_15_1 = slot_0_43_0:get_value():get()

        if var_15_1 and not slot_0_46_0.clear then
                slot_0_54_0()
        end

        slot_0_46_0.clear = var_15_1
end

function slot_0_56_0(arg_16_0)
        local var_16_0 = false

        entities.players:for_each(function(arg_17_0)
                if arg_17_0.entity and arg_17_0.entity:is_enemy() and arg_17_0.entity:get_abs_origin():dist(arg_16_0.pos) < 50 then
                        var_16_0 = true
                end
        end)

        return var_16_0
end

function slot_0_57_0()
        if slot_0_8_0:get_value():get() == false then
                return
        end

        if #slot_0_40_0 == 0 then
                return
        end

        slot_18_0_0 = draw.surface
        slot_18_0_0.font = slot_0_41_0
        slot_18_1_0 = slot_0_49_0()
        slot_18_2_0 = slot_0_50_0()
        slot_18_3_0 = 15
        slot_18_4_0 = 350
        slot_18_5_0 = {}
        slot_18_6_0 = {}

        for iter_18_0 = 1, #slot_0_40_0 do
                slot_18_11_2 = slot_0_40_0[iter_18_0]

                if slot_18_11_2.map == slot_18_2_0 then
                        slot_18_12_2 = slot_18_11_2.pos:dist(slot_18_1_0:get_abs_origin())

                        if slot_18_12_2 < slot_18_4_0 then
                                -- block empty
                        end

                        if slot_18_1_0 and (slot_18_12_2 < slot_18_3_0 or slot_0_56_0(slot_18_11_2)) then
                                slot_18_5_0[iter_18_0] = true
                                slot_18_13_2 = iter_18_0 % 2 == 1 and iter_18_0 + 1 or iter_18_0 - 1

                                if slot_18_13_2 >= 1 and slot_18_13_2 <= #slot_0_40_0 then
                                        slot_18_6_0[slot_18_13_2] = true
                                end
                        end

                        if slot_18_12_2 < slot_18_4_0 or slot_18_5_0[iter_18_0] or iter_18_0 % 2 == 1 and slot_18_5_0[iter_18_0 + 1] or iter_18_0 % 2 == 0 and slot_18_5_0[iter_18_0 - 1] then
                                slot_18_6_0[iter_18_0] = true
                        end
                end
        end

        for iter_18_1 = 1, #slot_0_40_0 do
                if slot_18_5_0[iter_18_1] then
                        slot_18_11_1 = slot_0_40_0[iter_18_1]
                        slot_18_12_1 = math.world_to_screen(slot_18_11_1.pos)

                        if slot_18_11_1.map == slot_18_2_0 then
                                slot_18_13_1 = iter_18_1 % 2 == 1 and iter_18_1 + 1 or iter_18_1 - 1

                                if slot_18_13_1 >= 1 and slot_18_13_1 <= #slot_0_40_0 then
                                        slot_18_14_1 = slot_0_40_0[slot_18_13_1]
                                        slot_18_15_1 = math.world_to_screen(slot_18_14_1.pos)

                                        if slot_18_12_1 and slot_18_15_1 then
                                                slot_18_0_0:add_line(slot_18_12_1, slot_18_15_1, draw.color(255, 255, 255, 200), 1)
                                        end
                                end
                        end
                end
        end

        for iter_18_2 = 1, #slot_0_40_0 do
                if not slot_18_6_0[iter_18_2] then
                        -- block empty
                else
                        slot_18_11_0 = slot_0_40_0[iter_18_2]
                        slot_18_12_0 = math.world_to_screen(slot_18_11_0.pos)

                        if slot_18_12_0 and slot_18_11_0.map == slot_18_2_0 then
                                slot_18_13_0 = draw.rect(slot_18_12_0.x - 10, slot_18_12_0.y - 10, slot_18_12_0.x + 10, slot_18_12_0.y + 10)
                                slot_18_14_0 = draw.rect(slot_18_12_0.x - 11, slot_18_12_0.y - 11, slot_18_12_0.x + 11, slot_18_12_0.y + 11)
                                slot_18_15_0 = draw.rect(slot_18_12_0.x - 8, slot_18_12_0.y - 8, slot_18_12_0.x + 8, slot_18_12_0.y + 8)
                                slot_18_16_0 = slot_18_5_0[iter_18_2]
                                slot_18_17_0 = draw.color(255, 0, 0, 150)

                                if iter_18_2 % 2 == 1 then
                                        slot_18_18_1 = iter_18_2 + 1
                                        slot_18_19_1 = slot_18_18_1 <= #slot_0_40_0 and slot_18_5_0[slot_18_18_1]

                                        if slot_18_16_0 then
                                                slot_18_17_0 = draw.color(225, 176, 176, 70)
                                        elseif slot_18_19_1 then
                                                slot_18_17_0 = draw.color(200, 100, 100, 150)
                                        end

                                        slot_18_0_0:add_rect_filled_rounded(slot_18_13_0, slot_18_17_0, 7)
                                        slot_18_0_0:add_rect_rounded(slot_18_14_0, draw.color(255, 180, 180, 150), 7, {
                                                2,
                                                2,
                                                2,
                                                2
                                        })
                                else
                                        slot_18_18_0 = iter_18_2 - 1
                                        slot_18_19_0 = slot_18_18_0 >= 1 and slot_18_5_0[slot_18_18_0]

                                        if slot_18_16_0 and slot_18_19_0 then
                                                slot_18_17_0 = draw.color(225, 176, 176, 70)
                                        elseif slot_18_16_0 then
                                                slot_18_17_0 = draw.color(225, 176, 176, 70)
                                        elseif slot_18_19_0 then
                                                slot_18_17_0 = draw.color(200, 100, 100, 150)
                                        else
                                                slot_18_17_0 = draw.color(255, 180, 180, 255)
                                        end

                                        slot_18_0_0:add_rect_rounded(slot_18_15_0, slot_18_17_0, 5, {
                                                2,
                                                2,
                                                2,
                                                2
                                        })
                                end
                        end
                end
        end
end

events.present_queue:add(function()
        slot_0_55_0()
        slot_0_57_0()
end)

slot_0_58_0 = gui.notification("NH Multilua v1.2", "Lua loaded, I hope you enjoy!")

gui.notify:add(slot_0_58_0)
