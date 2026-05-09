--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("bind_indicators"))
slot_0_1_0 = gui.make_control("{k3k} Bind Indicators", slot_0_0_0)
slot_0_2_0 = gui.ctx:find("lua>elements a")

slot_0_2_0:add(slot_0_1_0)
slot_0_2_0:reset()

slot_0_3_0 = gui.checkbox(gui.control_id("manual_indicators"))
slot_0_4_0 = gui.make_control("{k3k} Manual AA Indicators", slot_0_3_0)
slot_0_5_0 = gui.ctx:find("lua>elements a")

slot_0_5_0:add(slot_0_4_0)
slot_0_5_0:reset()

slot_0_6_0 = gui.checkbox(gui.control_id("killsay"))
slot_0_7_0 = gui.make_control("{k3k} Killsay", slot_0_6_0)
slot_0_8_0 = gui.ctx:find("lua>elements a")

slot_0_8_0:add(slot_0_7_0)

slot_0_6_0.tooltip = "Only RU killsay is available now"

slot_0_8_0:reset()

slot_0_9_0 = gui.checkbox(gui.control_id("watermark"))
slot_0_10_0 = gui.make_control("{k3k} Watermark", slot_0_9_0)
slot_0_11_0 = gui.ctx:find("lua>elements a")
slot_0_9_0.tooltip = "Tested only on 1920x1080, 100% DPI scale"

slot_0_11_0:add(slot_0_10_0)
slot_0_11_0:reset()

slot_0_12_0 = gui.checkbox(gui.control_id("avoid_backstab"))
slot_0_13_0 = gui.make_control("{k3k} No AA on knife(Avoid Backstab)", slot_0_12_0)

gui.ctx:find("lua>elements a"):add(slot_0_13_0)

slot_0_15_0 = 0
slot_0_16_0 = {
        "Впитай",
        "iq?",
        "Знатно ты жидкого дал",
        "1"
}
slot_0_17_0 = 0
slot_0_18_0 = 150
slot_0_19_0 = gui.checkbox(gui.control_id("head_counter"))
slot_0_20_0 = gui.checkbox(gui.control_id("en_killsay"))
slot_0_21_0 = gui.make_control("{k3k}.Killsay Additional", slot_0_19_0)

slot_0_21_0:add(slot_0_20_0)

slot_0_22_0 = gui.ctx:find("lua>elements b")
slot_0_19_0.tooltip = "Draw HeadShot kills counter"

slot_0_22_0:add(slot_0_21_0)

slot_0_20_0.inactive = true
slot_0_20_0.inactive_text = "(EN KILLSAY) Will added soon"
path_to_states = {
        "legit>general>penetration",
        "rage>aimbot>general>aimbot",
        "rage>aimbot>general>knife bot",
        "misc>aimbot>general>duck peek assist",
        "misc>movement>peek assist",
        "misc>movement>slowwalk",
        "rage>anti-aim>angles>spin",
        "misc>movement>edge jump"
}
names_x = {
        "AWALL",
        "RAGE",
        "KNIFE",
        "FD",
        "PEEK",
        "SLOW",
        "SPIN",
        "EDGE JUMP"
}
w, h = game.engine:get_screen_size()
slot_0_23_0 = gui.ctx:find("rage>anti-aim>angles>override left")
slot_0_24_0 = gui.ctx:find("rage>anti-aim>angles>override right")
slot_0_25_0 = gui.ctx:find("rage>anti-aim>angles>override forward")
slot_0_26_0 = gui.ctx:find("rage>anti-aim>angles>override back")
slot_0_27_0 = gui.checkbox(gui.control_id("back_active"))
slot_0_28_0 = gui.make_control("{k3k}.Manual AA Indicators Additional", slot_0_27_0)
slot_0_27_0.tooltip = "If manual AA disabled backward arrow will show"

gui.ctx:find("lua>elements b"):add(slot_0_28_0)

slot_0_30_0 = gui.notification("k3k.lua by seidk3k/sof1ik/logopek", "Injected! Good Luck!")

gui.notify:add(slot_0_30_0)
print("k3k.lua injected...")
events.present_queue:add(function()
        slot_0_21_0:set_visible(false)
        slot_0_19_0:set_visible(false)
        slot_0_20_0:set_visible(false)
        slot_0_28_0:set_visible(false)
        slot_0_27_0:set_visible(false)

        if slot_0_0_0:get_value():get() then
                check_states()
        end

        if slot_0_3_0:get_value():get() then
                slot_0_28_0:set_visible(true)
                slot_0_27_0:set_visible(true)
                check_manual_states()
        end

        if slot_0_6_0:get_value():get() then
                slot_0_21_0:set_visible(true)
                slot_0_19_0:set_visible(true)
                slot_0_20_0:set_visible(true)

                if slot_0_19_0:get_value():get() then
                        killsay()
                end
        end

        if slot_0_9_0:get_value():get() then
                renderWatermark()
        end

        if slot_0_12_0:get_value():get() then
                avoid_backstab()
        end
end)
mods.events:add_listener("player_death")
events.event:add(function(arg_2_0)
        if not slot_0_6_0:get_value():get() then
                return
        end

        if arg_2_0:get_name() ~= "player_death" then
                return
        end

        local var_2_0 = arg_2_0:get_pawn_from_id("attacker")

        if var_2_0 == entities.get_local_pawn() and arg_2_0:get_bool("headshot") then
                slot_0_17_0 = slot_0_17_0 + 1

                game.engine:client_cmd(slot_0_17_0 >= 3 and string.format("say [FATALITY.WIN]: %s убил %d-х лохов в голову, обнуляем счетчик :)", gui.ctx.user.username, slot_0_17_0) or not gui.ctx:find("rage>aimbot>general>nospread>settings>force"):get_value():get() and string.format("say Хаха а как это так, я случайно снес тебе е**ло !%d!", slot_0_17_0))

                if slot_0_17_0 >= 3 then
                        slot_0_17_0 = 0
                end
        end

        if var_2_0 and var_2_0 == entities.get_local_pawn() then
                game.engine:client_cmd(string.format("say %s", gui.ctx:find("rage>aimbot>general>nospread>settings>force"):get_value():get() and "Уяяя" or slot_0_16_0[math.random(#slot_0_16_0)]))
        end
end)

function list_length(arg_3_0)
        local var_3_0 = 0

        for iter_3_0, iter_3_1 in pairs(arg_3_0) do
                var_3_0 = var_3_0 + 1
        end

        return var_3_0
end

ll_z = list_length(names_x)

function check_states()
        if not game.engine:in_game() then
                return
        end

        for iter_4_0 = 1, ll_z do
                if gui.ctx:find(path_to_states[iter_4_0]):get_value():get() then
                        local var_4_0 = draw.surface

                        var_4_0.font = draw.fonts.gui_title

                        var_4_0:add_text(draw.vec2(w / 1.05, h / 1.85 - 20 * iter_4_0), names_x[iter_4_0], draw.color(255, 255, 255))
                end
        end
end

function check_manual_states()
        if not game.engine:in_game() then
                return
        end

        left_val = slot_0_23_0:get_value():get()
        right_val = slot_0_24_0:get_value():get()
        forward_val = slot_0_25_0:get_value():get()
        back_val = slot_0_26_0:get_value():get()
        color = draw.color(255, 255, 255)
        slot_5_0_0 = draw.surface

        if not left_val and not right_val and not forward_val and not back_val and slot_0_27_0:get_value():get() then
                slot_5_0_0:add_triangle_filled(draw.vec2(w / 2 + 6, h / 2 + 15 + 18), draw.vec2(w / 2 - 6, h / 2 + 15 + 18), draw.vec2(w / 2, h / 2 + 15 + 30), color, 1, draw.outline_mode.inset)
        elseif left_val then
                slot_5_0_0:add_triangle_filled(draw.vec2(w / 2 - 20 - 18, h / 2 + 6 + 5), draw.vec2(w / 2 - 20 - 18, h / 2 - 6 + 5), draw.vec2(w / 2 - 20 - 30, h / 2 + 5), color, 1, draw.outline_mode.inset)
        elseif right_val then
                slot_5_0_0:add_triangle_filled(draw.vec2(w / 2 + 20 + 18, h / 2 + 5 + 6), draw.vec2(w / 2 + 20 + 18, h / 2 + 5 - 6), draw.vec2(w / 2 + 20 + 30, h / 2 + 5), color, 1, draw.outline_mode.inset)
        elseif back_val then
                slot_5_0_0:add_triangle_filled(draw.vec2(w / 2 + 6, h / 2 + 15 + 18), draw.vec2(w / 2 - 6, h / 2 + 15 + 18), draw.vec2(w / 2, h / 2 + 15 + 30), color, 1, draw.outline_mode.inset)
        elseif forward_val then
                slot_5_0_0:add_triangle_filled(draw.vec2(w / 2 + 6, h / 2 - 15 - 18), draw.vec2(w / 2 - 6, h / 2 - 15 - 18), draw.vec2(w / 2, h / 2 - 15 - 30), color, 1, draw.outline_mode.inset)
        end
end

function killsay()
        if not game.engine:in_game() then
                slot_0_17_0 = 0
        end

        if game.engine:in_game() then
                draw.surface.font = draw.fonts.gui_main

                draw.surface:add_text(draw.vec2(slot_0_18_0, slot_0_18_0 * 3), string.format("Total Head Kill: %d", slot_0_17_0), draw.color.white())
        end
end

function get_abs_fps()
        slot_0_15_0 = 0.9 * slot_0_15_0 + 0.09999999999999998 * game.global_vars.frame_time

        return math.floor(1 / slot_0_15_0 + 0.5)
end

function renderWatermark()
        local var_8_0 = draw.surface

        var_8_0.font = draw.fonts.gui_main

        local var_8_1 = gui.ctx.user.username
        local var_8_2 = get_abs_fps()
        local var_8_3 = game.global_vars.map_name
        local var_8_4 = draw.vec2(w / 2.25, h / 1.015)
        local var_8_5 = draw.color(255, 255, 255)
        local var_8_6 = "FATALITY | none | FPS: 0 | none"

        if game.engine:in_game() then
                var_8_6 = string.format("FATALITY | %s | FPS: %d | %s", var_8_1, var_8_2 >= 400 and 400 or var_8_2, var_8_3)
        else
                var_8_6 = string.format("FATALITY | %s | FPS: %d", var_8_1, var_8_2 >= 400 and 400 or var_8_2)
        end

        var_8_0:add_text(var_8_4, var_8_6, var_8_5)
end

function avoid_backstab()
        if not slot_0_12_0:get_value():get() then
                return
        end

        if game.engine:in_game() then
                local var_9_0 = entities.get_local_pawn():get_active_weapon()

                if var_9_0 ~= nil then
                        if var_9_0:get_type() == 0 then
                                gui.ctx:find("rage>anti-aim>angles>anti-aim"):set_value(false)
                        else
                                gui.ctx:find("rage>anti-aim>angles>anti-aim"):set_value(true)
                        end
                end
        end
end
