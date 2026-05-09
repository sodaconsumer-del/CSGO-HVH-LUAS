--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0, slot_0_1_0 = game.engine:get_screen_size()
slot_0_2_0, slot_0_3_0 = game.engine:get_screen_size()
slot_0_4_0 = draw.vec2(slot_0_2_0 / 2, slot_0_3_0 / 2)
slot_0_5_0 = gui.checkbox(gui.control_id("killsay_enabled"))
slot_0_6_0 = gui.make_control("Enable Kill Say", slot_0_5_0)
slot_0_7_0 = gui.ctx:find("lua>elements a")

assert(slot_0_7_0, "[Kill Say] Failed to locate 'lua>elements a' group.")
slot_0_7_0:add(slot_0_6_0)
slot_0_5_0:get_value():set(false)

slot_0_8_0 = gui.combo_box(gui.control_id("killsay_mode"))
slot_0_9_0 = gui.make_control("Kill Say Language", slot_0_8_0)
slot_0_10_0 = gui.ctx:find("lua>elements b")

assert(slot_0_10_0, "[Kill Say] Failed to locate 'lua>elements b' group.")
slot_0_10_0:add(slot_0_9_0)
slot_0_10_0:reset()
slot_0_8_0:add(gui.selectable(gui.control_id("ks_English"), "English"))
slot_0_8_0:add(gui.selectable(gui.control_id("ks_Russian"), "Russian"))

slot_0_11_0 = gui.checkbox(gui.control_id("Spam_enabled"))
slot_0_12_0 = gui.make_control("Enable Spam", slot_0_11_0)
slot_0_13_0 = gui.ctx:find("lua>elements a")

assert(slot_0_13_0, "[Spam] Failed to locate 'lua>elements a' group.")
slot_0_13_0:add(slot_0_12_0)
slot_0_11_0:get_value():set(false)

slot_0_14_0 = gui.combo_box(gui.control_id("test_combo"))
slot_0_15_0 = gui.make_control("Zeus Range Type", slot_0_14_0)
slot_0_16_0 = gui.ctx:find("lua>elements b")

slot_0_16_0:add(slot_0_15_0)
slot_0_16_0:reset()

slot_0_17_0 = gui.checkbox(gui.control_id("Tsub_Row_B_Zeus_range"))

slot_0_17_0:set_value(false)

slot_0_18_0 = gui.make_control("Enable Zeus Range", slot_0_17_0)

gui.ctx:find("lua>elements a"):add(slot_0_18_0)

slot_0_20_0 = gui.selectable(gui.control_id("Normal_cb_Zeus"), "Normal")
slot_0_21_0 = gui.selectable(gui.control_id("Advanced_cb_Zeus"), "Advanced")

slot_0_14_0:add(slot_0_20_0)
slot_0_14_0:add(slot_0_21_0)

slot_0_22_0 = gui.checkbox(gui.control_id("Tsub_Row_A_DVD"))

slot_0_22_0:set_value(false)

slot_0_23_0 = gui.ctx:find("lua>elements a")
slot_0_24_0 = gui.make_control("Enable DVD Logo", slot_0_22_0)

slot_0_23_0:add(slot_0_24_0)
slot_0_23_0:reset()

slot_0_25_0 = gui.checkbox(gui.control_id("checkbox_AA_arrows"))
slot_0_26_0 = gui.color_picker(gui.control_id("AA_arrows_color"), 0, 32, 170, 255)

slot_0_25_0:get_value():set(false)

slot_0_27_0 = gui.make_control("Anti-Aim Manual Arrows", slot_0_25_0)

slot_0_27_0:add(slot_0_26_0)
gui.ctx:find("lua>elements a"):add(slot_0_27_0)
slot_0_26_0:get_value():set(draw.color(0, 32, 170, 255))

slot_0_29_0 = gui.checkbox(gui.control_id("Trail_Circle_1"))

slot_0_29_0:get_value():set(false)

groupAtrail = gui.ctx:find("lua>elements a")
slot_0_30_0 = gui.make_control("Enable Trail", slot_0_29_0)

groupAtrail:add(slot_0_30_0)
groupAtrail:reset()

angleyawslider = gui.ctx:find("lua>elements b")
slot_0_31_0 = gui.slider(gui.control_id("trail_length_1"), 10, 1000)
slot_0_32_0 = gui.make_control("Trail Length", slot_0_31_0)

angleyawslider:add(slot_0_32_0)
angleyawslider:reset()

function slot_0_33_0()
        local var_1_0 = slot_0_29_0:get_value():get()

        slot_0_32_0:set_visible(var_1_0)
end

slot_0_34_0 = gui.checkbox(gui.control_id("AntiAFKAHSI"))

slot_0_34_0:set_value(false)

slot_0_35_0 = gui.ctx:find("lua>elements a")
slot_0_36_0 = gui.make_control("Enable Anti-AFK", slot_0_34_0)

slot_0_35_0:add(slot_0_36_0)
slot_0_35_0:reset()

slot_0_37_0 = gui.checkbox(gui.control_id("Nade_Radius_visualize"))
slot_0_38_0 = gui.color_picker(gui.control_id("color_picker_smoke_radius"), draw.color(0, 31, 170, 255))
slot_0_39_0 = gui.slider(gui.control_id("line_thickness_slider_radius"), 1, 10, 2)

slot_0_37_0:get_value():set(false)

slot_0_40_0 = gui.make_control("Enable Smoke Radius", slot_0_37_0)

slot_0_40_0:add(slot_0_38_0)
gui.ctx:find("lua>elements a"):add(slot_0_40_0)

groupB = gui.ctx:find("lua>elements b")
slot_0_42_0 = gui.make_control("Outline Thickness", slot_0_39_0)

groupB:add(slot_0_42_0)
groupB:reset()
slot_0_42_0:set_visible(false)
slot_0_38_0:get_value():set(draw.color(0, 32, 170, 255))
slot_0_39_0:get_value():set(1)

slot_0_43_0 = 0
slot_0_44_0 = 1
slot_0_45_0 = draw.surface
slot_0_46_0 = 120
slot_0_47_0 = draw.color(255, 0, 0, 255)
slot_0_48_0 = 32
slot_0_49_0 = 16
DVD_ypos = 1
DVD_xpos = 1
DVD_X_speed = 4
DVD_Y_speed = 4
slot_0_50_0 = draw.svg_texture("<svg width=\"100%\" height=\"100%\" viewBox=\"0 0 1058.4 465.84\" xmlns=\"http://www.w3.org/2000/svg\"><g><path d=\"m91.053 0-13.719 57.707 102.28 0.039063h24c65.747 0 105.91 26.44 94.746 73.4-12.147 51.133-69.613 73.4-130.67 73.4h-22.947l29.787-125.45h-102.27l-43.521 183.2h145.05c109.07 0 212.76-57.573 231.01-131.15 3.3467-13.507 2.8806-47.253-5.3594-67.359-0.21299-0.787-0.42594-1.4-1.1855-3-0.293-0.653-0.56012-3.6412 1.1465-4.2812 0.947-0.36 2.7069 1.4944 2.9336 2.041 0.853 2.24 1.5059 3.9062 1.5059 3.9062l92.293 260.6 234.97-265.21 99.535-0.089844h24c65.76 0 106.25 26.44 95.092 73.4-12.147 51.133-69.947 73.4-131 73.4h-22.959l29.799-125.47h-102.27l-43.533 183.21h145.07c109.05 0 213.48-57.4 231-131.15 17.52-73.75-59.107-131.15-168.69-131.15h-216.4s-57.319 67.88-67.959 80.693c-57.12 68.787-67.241 87.226-68.961 91.986 0.24-4.8-1.8138-23.412-26.174-92.959-6.48-18.52-27.359-79.721-27.359-79.721h-389.25zm408.77 324.16c-276.04 0-499.83 31.72-499.83 70.84s223.79 70.84 499.83 70.84c276.04 0 499.83-31.72 499.83-70.84s-223.79-70.84-499.83-70.84zm-18.094 48.627c63.04 0 114.13 10.573 114.13 23.613s-51.095 23.613-114.13 23.613c-63.027 0-114.13-10.573-114.13-23.613s51.106-23.613 114.13-23.613z\"/><path d=\"m963.6 445.05-0.73242 5.1738h13.08l-5.1074 36.32h5.7207l5.1055-36.32h11.68l0.72071-5.1738h-30.467zm41.215 0-13.693 41.494h5.4785l10.215-31.76h0.1328l7.1718 31.76 16.668-31.453h0.1191v31.453h5.4805v-41.494h-5.4805l-14.906 28.107-6.4395-28.107h-4.746z\" display=\"none\"/></g></svg>")

slot_0_50_0:create()

slot_0_51_0 = 230
slot_0_52_0 = 100
slot_0_53_0 = {}
slot_0_54_0 = 10
slot_0_55_0 = 228
slot_0_56_0 = 48
slot_0_57_0 = 21
slot_0_58_0 = {
        "I love how you drip pre-cum while i fuck your ass %s",
        "Come and jump on daddy's cock %s",
        "%s takes dick like the good boy he is",
        "%s moans so cutely when i fuck his ass",
        "%s is the best cumdumpster there is!",
        "%s is always horny and ready for his daddy's dick",
        "Milk daddy's dick with your tight boypussy %s",
        "Cum dumpster %s, fucked stupid on my meat",
        "Boytoy %s, gagging for a deep throat fucking",
        "%s takes my cock like a champion",
        "%s gargles my cum for breakfast",
        "I can't get enough of watching %s squirm on my fat cock",
        "There's nothing sexier than watching my cum ooze out of %s's well-used ass",
        "I can't get enough of how your boypussy squeezes my cock, %s",
        "You're just a set of fuck holes for me to ruin, aren't you %s?",
        "Your ass is so sloppy, it's like a one-way street for my dick %s",
        "You're just a hot piece of ass with a bad habit of getting fucked raw %s",
        "I love how you can't even say no to my cock %s",
        "Your ass is so smooth, it's like silk for my dick %s"
}
slot_0_59_0 = {
        "%s так мило стонет, когда я трахаю его попку",
        "%s всегда возбуждён и готов к отцовскому члену",
        "%s сосёт мой хуй как чемпион",
        "Не перестать смотреть, как %s извивается на моем толстом члене",
        "Нет ничего сексуальнее, чем смотреть, как моя сперма вытекает из твоей попки, %s",
        "Ты просто мясо для ебли, не так ли, %s? ",
        "Давай, прыгай на папин член, %s",
        "Люблю, как ты не можешь отказаться от моего члена, %s",
        "Твоя гладкая попка как шёлк для моего члена %s",
        "Ты просто грязная шлюшка с плохой привычкой жёстко трахаться, %s",
        "Люблю, как твой анус сжимает мой член, %s",
        "%s — лучший спермоприёмник",
        "Шлюшка %s жёстко выебана на моем члене",
        "Люблю, как ты течёшь, пока я трахаю твою попку, %s",
        "%s берёт член как хороший мальчик",
        "%s глотает мою сперму на завтрак"
}

function slot_0_60_0(arg_2_0)
        if not slot_0_5_0:get_value():get() then
                return
        end

        if arg_2_0:get_name() ~= "player_death" then
                return
        end

        local var_2_0 = arg_2_0:get_pawn_from_id("attacker")
        local var_2_1 = arg_2_0:get_pawn_from_id("userid")

        if not var_2_0 or var_2_0 ~= entities.get_local_pawn() then
                return
        end

        slot_0_43_0 = slot_0_43_0 + 1

        local var_2_2 = var_2_1:get_name()
        local var_2_3 = slot_0_8_0:get_value()
        local var_2_4 = (var_2_3 and var_2_3:get():get_raw() or 1) == 2 and slot_0_59_0 or slot_0_58_0

        if var_2_2 == "Tsubject308" then
                return
        end

        local var_2_5 = string.format(var_2_4[slot_0_44_0], var_2_2)

        game.engine:client_cmd("say " .. var_2_5)

        slot_0_44_0 = slot_0_44_0 + 1

        if slot_0_44_0 > #var_2_4 then
                slot_0_44_0 = 1
        end
end

events.present_queue:add(function()
        slot_0_9_0:set_visible(slot_0_5_0:get_value():get())
end)

if slot_0_11_0:get_value():get() then
        return
end

slot_0_61_0 = gui.text_input(gui.control_id("item_name"))
slot_0_62_0 = gui.make_control("Spam Phrase: ", slot_0_61_0)
slot_0_63_0 = gui.ctx:find("lua>elements b")

slot_0_63_0:add(slot_0_62_0)
slot_0_63_0:reset()

function slot_0_64_0()
        if not slot_0_11_0:get_value():get() then
                return
        end

        local var_4_0 = string.format(slot_0_61_0.value)

        game.engine:client_cmd("say " .. var_4_0)
end

function slot_0_65_0()
        local var_5_0 = slot_0_17_0:get_value():get()

        slot_0_15_0:set_visible(var_5_0)

        if not var_5_0 then
                return
        end

        local var_5_1 = slot_0_14_0:get_value()
        local var_5_2 = var_5_1 and var_5_1:get():get_raw() or nil

        if not var_5_2 then
                return
        end

        local var_5_3 = entities.get_local_pawn()

        if not var_5_3 or not var_5_3:is_alive() then
                return
        end

        local var_5_4 = var_5_3:get_active_weapon()

        if not var_5_4 or var_5_4:get_id() ~= 31 then
                return
        end

        local var_5_5 = var_5_3:get_abs_origin()
        local var_5_6 = math.vec3(var_5_5.x, var_5_5.y, var_5_5.z + 50)
        local var_5_7 = draw.surface

        if var_5_2 == 1 then
                local var_5_8 = math.vec3(var_5_5.x, var_5_5.y, var_5_5.z + 50)
                local var_5_9

                for iter_5_0 = 0, slot_0_48_0 do
                        local var_5_10 = iter_5_0 / slot_0_48_0 * 2 * math.pi
                        local var_5_11 = var_5_8.x + slot_0_46_0 * math.cos(var_5_10)
                        local var_5_12 = var_5_8.y + slot_0_46_0 * math.sin(var_5_10)
                        local var_5_13 = var_5_8.z
                        local var_5_14 = math.world_to_screen(math.vec3(var_5_11, var_5_12, var_5_13))

                        if var_5_14 then
                                if var_5_9 then
                                        var_5_7:add_line(draw.vec2(var_5_9.x, var_5_9.y), draw.vec2(var_5_14.x, var_5_14.y), slot_0_47_0)
                                end

                                var_5_9 = var_5_14
                        else
                                var_5_9 = nil
                        end
                end
        elseif var_5_2 == 2 then
                for iter_5_1 = 0, slot_0_49_0 do
                        local var_5_15 = iter_5_1 / slot_0_49_0 * math.pi
                        local var_5_16 = slot_0_46_0 * math.sin(var_5_15)
                        local var_5_17 = slot_0_46_0 * math.cos(var_5_15)
                        local var_5_18

                        for iter_5_2 = 0, slot_0_48_0 do
                                local var_5_19 = iter_5_2 / slot_0_48_0 * 2 * math.pi
                                local var_5_20 = var_5_6.x + var_5_16 * math.cos(var_5_19)
                                local var_5_21 = var_5_6.y + var_5_16 * math.sin(var_5_19)
                                local var_5_22 = var_5_6.z + var_5_17
                                local var_5_23 = math.world_to_screen(math.vec3(var_5_20, var_5_21, var_5_22))

                                if var_5_23 then
                                        if var_5_18 then
                                                var_5_7:add_line(draw.vec2(var_5_18.x, var_5_18.y), draw.vec2(var_5_23.x, var_5_23.y), slot_0_47_0)
                                        end

                                        var_5_18 = var_5_23
                                else
                                        var_5_18 = nil
                                end
                        end
                end
        end
end

function slot_0_66_0()
        if not slot_0_22_0:get_value():get() then
                return
        end

        if DVD_xpos >= slot_0_0_0 - slot_0_51_0 then
                DVD_X_speed = -4
        elseif DVD_xpos <= 0 then
                DVD_X_speed = 4
        end

        if DVD_ypos >= slot_0_1_0 - slot_0_52_0 then
                DVD_Y_speed = -4
        elseif DVD_ypos <= 0 then
                DVD_Y_speed = 4
        end

        DVD_xpos = DVD_xpos + DVD_X_speed
        DVD_ypos = DVD_ypos + DVD_Y_speed

        slot_0_45_0.g:set_texture(slot_0_50_0)
        slot_0_45_0:add_rect_filled(draw.rect(DVD_xpos, DVD_ypos, DVD_xpos + slot_0_51_0, DVD_ypos + slot_0_52_0), draw.color.white())
        slot_0_45_0.g:set_texture(nil)
end

function slot_0_67_0()
        if not slot_0_25_0:get_value():get() then
                return
        end

        left = gui.ctx:find("rage>anti-aim>angles>manual override>override left")
        right = gui.ctx:find("rage>anti-aim>angles>manual override>override right")

        local var_7_0 = slot_0_26_0:get_value():get()

        if right:get_value():get() then
                slot_0_45_0:add_triangle_filled_multicolor(draw.vec2(slot_0_4_0.x + 59, slot_0_4_0.y), draw.vec2(slot_0_4_0.x + 37, slot_0_4_0.y + 8), draw.vec2(slot_0_4_0.x + 37, slot_0_4_0.y - 8), {
                        var_7_0,
                        var_7_0,
                        var_7_0
                })
        elseif left:get_value():get() then
                slot_0_45_0:add_triangle_filled_multicolor(draw.vec2(slot_0_4_0.x - 59, slot_0_4_0.y), draw.vec2(slot_0_4_0.x - 37, slot_0_4_0.y + 8), draw.vec2(slot_0_4_0.x - 37, slot_0_4_0.y - 8), {
                        var_7_0,
                        var_7_0,
                        var_7_0
                })
        end
end

function slot_0_68_0()
        local var_8_0 = draw.surface
        local var_8_1 = slot_0_29_0:get_value():get()
        local var_8_2 = slot_0_31_0:get_value():get()

        if not var_8_1 then
                slot_0_53_0 = {}

                return
        end

        local var_8_3 = entities.get_local_pawn()

        if not var_8_3 then
                return
        end

        local var_8_4 = var_8_3:get_abs_origin()

        table.insert(slot_0_53_0, 1, var_8_4)

        while var_8_2 < #slot_0_53_0 do
                table.remove(slot_0_53_0)
        end

        local var_8_5 = 255 / var_8_2
        local var_8_6 = game.global_vars.real_time * slot_0_54_0
        local var_8_7

        for iter_8_0 = 1, #slot_0_53_0 do
                local var_8_8 = slot_0_53_0[iter_8_0]
                local var_8_9 = math.world_to_screen(math.vec3(var_8_8.x, var_8_8.y, var_8_8.z))

                if var_8_9 then
                        local var_8_10 = math.floor(127 * math.sin(var_8_6 + iter_8_0 * 0.1) + 128)
                        local var_8_11 = math.floor(127 * math.sin(var_8_6 + iter_8_0 * 0.1 + 2) + 128)
                        local var_8_12 = math.floor(127 * math.sin(var_8_6 + iter_8_0 * 0.1 + 4) + 128)
                        local var_8_13 = math.floor(255 - (iter_8_0 - 1) * var_8_5)

                        if var_8_7 and var_8_0.add_line then
                                var_8_0:add_line(draw.vec2(var_8_7.x, var_8_7.y), draw.vec2(var_8_9.x, var_8_9.y), draw.color(var_8_10, var_8_11, var_8_12, var_8_13))
                        end

                        var_8_7 = var_8_9
                else
                        var_8_7 = nil
                end
        end
end

slot_0_69_0 = 20
slot_0_70_0 = 0
slot_0_71_0 = true

function slot_0_72_0(arg_9_0)
        if not slot_0_34_0:get_value():get() then
                return
        end

        slot_0_70_0 = slot_0_70_0 + 1

        local var_9_0 = entities.get_local_pawn()

        if not var_9_0 or not var_9_0:is_alive() then
                return
        end

        if slot_0_70_0 % slot_0_69_0 == 0 then
                slot_0_71_0 = not slot_0_71_0
        end

        if slot_0_71_0 then
                arg_9_0:set_leftmove(-1)
        else
                arg_9_0:set_leftmove(1)
        end
end

if not active_smokes then
        active_smokes = {}
end

function slot_0_73_0(arg_10_0)
        local var_10_0 = arg_10_0:get_name()

        if var_10_0 == "smokegrenade_detonate" then
                local var_10_1 = arg_10_0:get_int("entityid")
                local var_10_2 = arg_10_0:get_float("x")
                local var_10_3 = arg_10_0:get_float("y")
                local var_10_4 = arg_10_0:get_float("z")
                local var_10_5 = game.global_vars.real_time

                table.insert(active_smokes, {
                        id = var_10_1,
                        position = {
                                x = var_10_2,
                                y = var_10_3,
                                z = var_10_4
                        },
                        start_time = var_10_5
                })
        elseif var_10_0 == "round_start" then
                active_smokes = {}
        end
end

mods.events:add_listener("smokegrenade_detonate")
mods.events:add_listener("round_start")
events.event:add(slot_0_73_0)
events.present_queue:add(function()
        local var_11_0 = draw.surface
        local var_11_1 = slot_0_37_0:get_value():get()

        slot_0_42_0:set_visible(var_11_1)

        if not var_11_1 then
                return
        end

        local var_11_2 = game.global_vars.real_time
        local var_11_3 = slot_0_38_0:get_value():get()
        local var_11_4 = slot_0_39_0:get_value():get()
        local var_11_5 = {}

        for iter_11_0 = #active_smokes, 1, -1 do
                local var_11_6 = active_smokes[iter_11_0]

                if not var_11_6 or not var_11_6.start_time or not var_11_6.position then
                        table.remove(active_smokes, iter_11_0)
                elseif var_11_2 - var_11_6.start_time > slot_0_57_0 then
                        table.remove(active_smokes, iter_11_0)
                else
                        var_11_5[var_11_6.id] = true
                end
        end

        for iter_11_1, iter_11_2 in ipairs(active_smokes) do
                if not iter_11_2.position or not iter_11_2.position.x or not iter_11_2.position.y or not iter_11_2.position.z then
                        -- block empty
                else
                        local var_11_7 = iter_11_2.position
                        local var_11_8

                        for iter_11_3 = 0, slot_0_56_0 do
                                local var_11_9 = iter_11_3 / slot_0_56_0 * (2 * math.pi)
                                local var_11_10 = var_11_7.x + slot_0_55_0 * math.cos(var_11_9)
                                local var_11_11 = var_11_7.y + slot_0_55_0 * math.sin(var_11_9)
                                local var_11_12 = var_11_7.z
                                local var_11_13 = math.world_to_screen(math.vec3(var_11_10, var_11_11, var_11_12))

                                if var_11_13 then
                                        if var_11_8 then
                                                var_11_0:add_line(draw.vec2(var_11_8.x, var_11_8.y), draw.vec2(var_11_13.x, var_11_13.y), var_11_3, var_11_4)
                                        end

                                        var_11_8 = var_11_13
                                else
                                        var_11_8 = nil
                                end
                        end
                end
        end
end)
mods.events:add_listener("player_death")
mods.events:add_listener("smokegrenade_expired")
mods.events:add_listener("smokegrenade_expired")
events.event:add(slot_0_60_0)
events.present_queue:add(slot_0_64_0)
events.present_queue:add(slot_0_65_0)
events.present_queue:add(slot_0_66_0)
events.present_queue:add(slot_0_67_0)
events.present_queue:add(slot_0_68_0)
events.create_move:add(slot_0_72_0)
events.present_queue:add(slot_0_33_0)

slot_0_74_0 = gui.checkbox(gui.control_id("HUD_GUI_RGB_CB"))
slot_0_75_0 = gui.make_control("Enable Rainbow GUI", slot_0_74_0)
slot_0_76_0 = gui.ctx:find("lua>elements a")

assert(slot_0_76_0, "[Rainbow HUD] Failed to locate 'lua>elements a' group.")
slot_0_76_0:add(slot_0_75_0)
slot_0_74_0:get_value():set(false)

slot_0_77_0 = nil
slot_0_78_0 = nil

function slot_0_79_0(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
        local var_12_0 = gui.ctx:find(arg_12_0)
        local var_12_1 = gui.slider(gui.control_id(arg_12_0 .. ">slider_hud_rgb_speed"), arg_12_2, arg_12_3)
        local var_12_2 = gui.make_control(arg_12_1, var_12_1)

        var_12_0:add(var_12_2)
        var_12_0:reset()

        return var_12_1, var_12_2
end

function slot_0_80_0()
        local var_13_0 = gui.ctx:find("lua>elements b")

        if slot_0_74_0:get_value():get() then
                if not slot_0_77_0 then
                        slot_0_77_0, slot_0_78_0 = slot_0_79_0("lua>elements b", "HUD RGB Speed", 1, 10)
                end
        elseif slot_0_78_0 then
                var_13_0:remove(slot_0_78_0)
                var_13_0:reset()

                slot_0_77_0 = nil
                slot_0_78_0 = nil
        end
end

slot_0_80_0()
events.present_queue:add(slot_0_80_0)

slot_0_81_0 = 3
slot_0_82_0 = 0
slot_0_83_0 = 60

function slot_0_84_0()
        if not slot_0_74_0:get_value():get() then
                return
        end

        if slot_0_77_0 then
                slot_0_83_0 = 60 - slot_0_77_0:get_value():get() * 5
        end

        slot_0_82_0 = slot_0_82_0 + 1

        if slot_0_82_0 >= slot_0_83_0 then
                game.engine:client_cmd("cl_hud_color " .. slot_0_81_0)

                slot_0_81_0 = slot_0_81_0 + 1

                if slot_0_81_0 > 10 then
                        slot_0_81_0 = 3
                end

                slot_0_82_0 = 0
        end
end

slot_0_85_0 = gui.checkbox(gui.control_id("healthshot_enabled"))
slot_0_86_0 = gui.make_control("Enable Healthshot/RS detector", slot_0_85_0)
slot_0_87_0 = gui.ctx:find("lua>elements a")

assert(slot_0_87_0, "[Healthshot Announcer] Failed to locate 'lua>elements a' group.")
slot_0_87_0:add(slot_0_86_0)
slot_0_85_0:get_value():set(false)

slot_0_88_0 = 64
slot_0_89_0 = 0
slot_0_90_0 = {
        " had to pop a healthshot!",
        " couldn't survive without a healthshot!",
        " is addicted to healthshots!",
        " couldnt handle the heat and used a healthshot!",
        " needed some medicine to keep going",
        " is a fag who needs healthshots to win",
        " needed to pop a mini pot"
}
slot_0_91_0 = 1

mods.events:add_listener("weapon_fire")
events.event:add(function(arg_15_0)
        if arg_15_0:get_name() ~= "weapon_fire" then
                return
        end

        local var_15_0 = arg_15_0:get_pawn_from_id("userid")

        if not var_15_0 then
                return
        end

        local var_15_1 = arg_15_0:get_string("weapon") or "unknown"

        if not arg_15_0:get_bool("silenced") then
                local var_15_2 = false
        end

        if not slot_0_85_0:get_value():get() then
                return
        end

        if not var_15_1:lower():find("healthshot") then
                return
        end

        if slot_0_89_0 > 0 then
                slot_0_89_0 = slot_0_89_0 - 1

                return
        end

        local var_15_3 = var_15_0:get_name() .. slot_0_90_0[slot_0_91_0]

        game.engine:client_cmd("say " .. var_15_3 .. " [HsDetect™]")

        slot_0_91_0 = slot_0_91_0 + 1

        if slot_0_91_0 > #slot_0_90_0 then
                slot_0_91_0 = 1
        end

        slot_0_89_0 = slot_0_88_0
end)

slot_0_92_0 = {}

mods.events:add_listener("player_chat")
events.event:add(function(arg_16_0)
        if arg_16_0:get_name() ~= "player_chat" then
                return
        end

        if not slot_0_85_0:get_value():get() then
                return
        end

        local var_16_0 = arg_16_0:get_pawn_from_id("userid")

        if not var_16_0 then
                return
        end

        if (arg_16_0:get_string("text") or ""):lower():gsub("%s+", ""):find("!rs") then
                local var_16_1 = var_16_0:get_name() .. " had to reset their stats [RsDetect™]"

                table.insert(slot_0_92_0, var_16_1)
        end
end)
events.present_queue:add(function()
        if #slot_0_92_0 == 0 then
                return
        end

        for iter_17_0, iter_17_1 in ipairs(slot_0_92_0) do
                game.engine:client_cmd("say " .. iter_17_1)
        end

        slot_0_92_0 = {}
end)

slot_0_93_0 = gui.checkbox(gui.control_id("damage_popup_enabled"))
slot_0_94_0 = gui.make_control("Enable Damage Popups", slot_0_93_0)
slot_0_95_0 = gui.ctx:find("lua>elements a")

assert(slot_0_95_0, "[Damage Popups] Failed to locate 'lua>elements a' group.")
slot_0_95_0:add(slot_0_94_0)

slot_0_96_0 = gui.color_picker(gui.control_id("damage_popup_color"), 255, 50, 50, 255)

slot_0_94_0:add(slot_0_96_0)

slot_0_97_0 = draw.surface

slot_0_93_0:get_value():set(false)

slot_0_98_0 = 200
slot_0_99_0 = 30
slot_0_100_0 = {}

mods.events:add_listener("player_hurt")
events.event:add(function(arg_18_0)
        if not slot_0_93_0:get_value():get() then
                return
        end

        if arg_18_0:get_name() ~= "player_hurt" then
                return
        end

        local var_18_0 = arg_18_0:get_pawn_from_id("attacker")
        local var_18_1 = arg_18_0:get_pawn_from_id("userid")
        local var_18_2 = entities.get_local_pawn()

        if not var_18_0 or not var_18_1 or not var_18_2 then
                return
        end

        if var_18_0 ~= var_18_2 then
                return
        end

        local var_18_3 = arg_18_0:get_int("dmg_health") or 0

        if var_18_3 <= 0 then
                return
        end

        local var_18_4 = var_18_1:get_abs_origin()

        if not var_18_4 then
                return
        end

        table.insert(slot_0_100_0, {
                pos = var_18_4,
                damage = var_18_3,
                ticks_remaining = slot_0_98_0,
                total_ticks = slot_0_98_0,
                offset = math.random(-50, 50)
        })
end)

function slot_0_101_0()
        if not slot_0_93_0:get_value():get() then
                return
        end

        if #slot_0_100_0 == 0 then
                return
        end

        slot_0_97_0.font = draw.fonts.gui_title

        local var_19_0 = 1

        while var_19_0 <= #slot_0_100_0 do
                local var_19_1 = slot_0_100_0[var_19_0]

                var_19_1.ticks_remaining = var_19_1.ticks_remaining - 1

                if var_19_1.ticks_remaining <= 0 then
                        table.remove(slot_0_100_0, var_19_0)
                else
                        local var_19_2 = 1 - var_19_1.ticks_remaining / var_19_1.total_ticks
                        local var_19_3 = math.vec3(var_19_1.pos.x, var_19_1.pos.y, var_19_1.pos.z + 80)
                        local var_19_4 = math.world_to_screen(var_19_3)

                        if var_19_4 then
                                local var_19_5

                                var_19_5.a, var_19_5 = math.floor(255 * (var_19_1.ticks_remaining / var_19_1.total_ticks)), slot_0_96_0:get_value():get()

                                slot_0_97_0:add_text(draw.vec2(var_19_4.x + var_19_1.offset, var_19_4.y - var_19_2 * 15), tostring(var_19_1.damage), var_19_5)
                        end

                        var_19_0 = var_19_0 + 1
                end
        end
end

events.present_queue:add(slot_0_101_0)
events.present_queue:add(slot_0_84_0)
