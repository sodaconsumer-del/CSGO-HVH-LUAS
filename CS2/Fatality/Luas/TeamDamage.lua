--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        en = {
                chat_msg = "iq issue",
                damage = "Damage: %d/300",
                cooldown = "Cooldown: %.1fs",
                kills = "Kills: %d/3",
                title = "Team Damage"
        },
        ru = {
                chat_msg = "найс iq",
                damage = "Урон: %d/300",
                cooldown = "Кулдаун: %.1fs",
                kills = "Убийства: %d/3",
                title = "Урон по тиме"
        }
}
slot_0_1_0 = gui.checkbox(gui.control_id("td_show_settings"))
slot_0_2_0 = gui.slider(gui.control_id("td_opacity"), 0, 100, {
        "%.0f%%"
}, 5)
slot_0_3_0 = gui.slider(gui.control_id("td_pos"), 0, 2560, {
        "%.0fpx"
}, 1)
slot_0_4_0 = gui.checkbox(gui.control_id("td_first_launch_marker"))
slot_0_5_0 = gui.combo_box(gui.control_id("td_anchor_combo"))

slot_0_5_0:add(gui.selectable(gui.control_id("td_anch_left"), "Left"))
slot_0_5_0:add(gui.selectable(gui.control_id("td_anch_right"), "Right"))
slot_0_5_0:add(gui.selectable(gui.control_id("td_anch_top"), "Top"))
slot_0_5_0:add(gui.selectable(gui.control_id("td_anch_bottom"), "Bottom"))

slot_0_6_0 = gui.checkbox(gui.control_id("td_chat"))
slot_0_7_0 = gui.combo_box(gui.control_id("td_lang_combo"))

slot_0_7_0:add(gui.selectable(gui.control_id("td_lang_en"), "English"))
slot_0_7_0:add(gui.selectable(gui.control_id("td_lang_ru"), "Russian"))

slot_0_8_0 = gui.combo_box(gui.control_id("td_layout_combo"))

slot_0_8_0:add(gui.selectable(gui.control_id("td_layout_h"), "Horizontal"))
slot_0_8_0:add(gui.selectable(gui.control_id("td_layout_v"), "Vertical"))

slot_0_9_0 = gui.checkbox(gui.control_id("td_custom_colors"))
slot_0_10_0 = gui.color_picker(gui.control_id("td_color_title"))
slot_0_11_0 = gui.color_picker(gui.control_id("td_color_green"))
slot_0_12_0 = gui.color_picker(gui.control_id("td_color_yellow"))
slot_0_13_0 = gui.color_picker(gui.control_id("td_color_red"))
slot_0_14_0 = gui.color_picker(gui.control_id("td_color_cooldown"))

function slot_0_15_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
        if arg_1_0:get_value():get().a == 0 then
                arg_1_0:get_value():set(draw.color(arg_1_1, arg_1_2, arg_1_3, arg_1_4 or 255))
        end
end

slot_0_15_0(slot_0_10_0, 255, 255, 255)
slot_0_15_0(slot_0_11_0, 100, 255, 100)
slot_0_15_0(slot_0_12_0, 255, 255, 100)
slot_0_15_0(slot_0_13_0, 255, 100, 100)
slot_0_15_0(slot_0_14_0, 150, 200, 255)

slot_0_16_0 = slot_0_5_0:get_value():get()

if slot_0_16_0:get_raw() == 0 then
        slot_0_16_0:set_raw(1)
end

slot_0_17_0 = slot_0_7_0:get_value():get()

if slot_0_17_0:get_raw() == 0 then
        slot_0_17_0:set_raw(2)
end

slot_0_18_0 = slot_0_8_0:get_value():get()

if slot_0_18_0:get_raw() == 0 then
        slot_0_18_0:set_raw(2)
end

if not slot_0_4_0:get_value():get() then
        slot_0_2_0:get_value():set(30)
        slot_0_3_0:get_value():set(432)
        slot_0_6_0:get_value():set(true)
        slot_0_9_0:get_value():set(false)
        slot_0_4_0:get_value():set(true)
end

slot_0_20_0 = nil
slot_0_21_0 = nil
slot_0_22_0 = nil
slot_0_23_0 = nil
slot_0_24_0 = nil
slot_0_25_0 = nil
slot_0_26_0 = nil
slot_0_27_0 = nil
slot_0_28_0 = nil
slot_0_29_0 = nil
slot_0_30_0 = nil
slot_0_31_0 = nil
slot_0_32_1 = nil
slot_0_33_0 = gui.ctx:find("lua>elements b")

if slot_0_33_0 then
        slot_0_33_0:reset()

        slot_0_32_0 = gui.make_control("- Show Team Damage Settings", slot_0_1_0)
        slot_0_20_0 = gui.make_control("Background Opacity", slot_0_2_0)
        slot_0_21_0 = gui.make_control("Layout", slot_0_8_0)
        slot_0_22_0 = gui.make_control("Position Offset", slot_0_3_0)
        slot_0_23_0 = gui.make_control("Anchor Side", slot_0_5_0)
        slot_0_24_0 = gui.make_control("Language", slot_0_7_0)
        slot_0_25_0 = gui.make_control("\"iq issue\" on team kill", slot_0_6_0)
        slot_0_26_0 = gui.make_control("Custom colors", slot_0_9_0)
        slot_0_27_0 = gui.make_control("Title Color", slot_0_10_0)
        slot_0_28_0 = gui.make_control("Green Color", slot_0_11_0)
        slot_0_29_0 = gui.make_control("Yellow Color", slot_0_12_0)
        slot_0_30_0 = gui.make_control("Red Color", slot_0_13_0)
        slot_0_31_0 = gui.make_control("Cooldown Color", slot_0_14_0)

        slot_0_33_0:add(slot_0_32_0)
        slot_0_33_0:add(slot_0_20_0)
        slot_0_33_0:add(slot_0_21_0)
        slot_0_33_0:add(slot_0_22_0)
        slot_0_33_0:add(slot_0_23_0)
        slot_0_33_0:add(slot_0_24_0)
        slot_0_33_0:add(slot_0_25_0)
        slot_0_33_0:add(slot_0_26_0)
        slot_0_33_0:add(slot_0_27_0)
        slot_0_33_0:add(slot_0_28_0)
        slot_0_33_0:add(slot_0_29_0)
        slot_0_33_0:add(slot_0_30_0)
        slot_0_33_0:add(slot_0_31_0)
end

function slot_0_34_0()
        local var_2_0 = slot_0_7_0:get_value():get():get_raw()

        if math.floor(var_2_0 / 2) % 2 >= 1 then
                return slot_0_0_0.ru
        end

        return slot_0_0_0.en
end

slot_0_35_0 = 0
slot_0_36_0 = 0
slot_0_37_0 = {}
slot_0_38_0 = 0
slot_0_39_0 = false
slot_0_40_0 = 8
slot_0_41_0 = false
slot_0_42_0 = draw.color(100, 255, 100)
slot_0_43_0 = draw.color(255, 255, 100)
slot_0_44_0 = draw.color(255, 100, 100)
slot_0_45_0 = draw.color(255, 255, 255)
slot_0_46_0 = draw.color(150, 200, 255)
slot_0_47_0 = draw.color(0, 0, 0, 180)

mods.events:add_listener("player_hurt")
mods.events:add_listener("player_death")
mods.events:add_listener("round_start")
mods.events:add_listener("round_freeze_end")

function slot_0_48_0(arg_3_0)
        local var_3_0 = arg_3_0:get_name()
        local var_3_1 = entities.get_local_controller()

        if not var_3_1 then
                return
        end

        local var_3_2 = var_3_1:get_name()

        if var_3_0 == "round_start" then
                slot_0_39_0 = true
                slot_0_38_0 = 0
                slot_0_37_0 = {}

                return
        end

        if var_3_0 == "round_freeze_end" then
                slot_0_38_0 = game.global_vars.real_time

                return
        end

        if var_3_0 == "player_hurt" then
                local var_3_3 = arg_3_0:get_controller("userid")
                local var_3_4 = arg_3_0:get_controller("attacker")

                if not var_3_3 or not var_3_4 then
                        return
                end

                local var_3_5 = var_3_4:get_name()
                local var_3_6 = var_3_3:get_name()

                if var_3_5 ~= var_3_2 then
                        return
                end

                if var_3_3:is_enemy() then
                        return
                end

                if var_3_6 == var_3_2 then
                        return
                end

                local var_3_7 = arg_3_0:get_int("health")
                local var_3_8 = arg_3_0:get_int("dmg_health")
                local var_3_9 = slot_0_37_0[var_3_6]
                local var_3_10 = var_3_8

                if var_3_9 and var_3_9 > 0 then
                        local var_3_11 = var_3_9 - var_3_7

                        if var_3_11 > 0 then
                                var_3_10 = var_3_11
                        end
                else
                        var_3_10 = math.min(var_3_8, 100)
                end

                slot_0_35_0 = slot_0_35_0 + var_3_10
                slot_0_37_0[var_3_6] = var_3_7
        elseif var_3_0 == "player_death" then
                local var_3_12 = arg_3_0:get_controller("attacker")
                local var_3_13 = arg_3_0:get_controller("userid")

                if not var_3_12 or not var_3_13 then
                        return
                end

                local var_3_14 = var_3_12:get_name()
                local var_3_15 = var_3_13:get_name()

                if var_3_14 ~= var_3_2 then
                        return
                end

                if var_3_13:is_enemy() then
                        return
                end

                if var_3_15 == var_3_2 then
                        return
                end

                slot_0_36_0 = slot_0_36_0 + 1
                slot_0_37_0[var_3_15] = 0

                if slot_0_1_0:get_value():get() and slot_0_41_0 then
                        local var_3_16 = slot_0_34_0()

                        game.engine:client_cmd("say_team " .. var_3_16.chat_msg)
                end
        end
end

function slot_0_49_0()
        local var_4_0 = slot_0_9_0:get_value():get()

        if slot_0_35_0 > 250 or slot_0_36_0 >= 2 then
                if var_4_0 then
                        return slot_0_13_0:get_value():get()
                end

                return slot_0_44_0
        end

        if slot_0_35_0 > 150 or slot_0_36_0 >= 1 then
                if var_4_0 then
                        return slot_0_12_0:get_value():get()
                end

                return slot_0_43_0
        end

        if var_4_0 then
                return slot_0_11_0:get_value():get()
        end

        return slot_0_42_0
end

function slot_0_50_0()
        if slot_0_9_0:get_value():get() then
                return slot_0_10_0:get_value():get()
        end

        return slot_0_45_0
end

function slot_0_51_0()
        if slot_0_9_0:get_value():get() then
                return slot_0_14_0:get_value():get()
        end

        return slot_0_46_0
end

function slot_0_52_0(arg_7_0, arg_7_1, arg_7_2)
        local var_7_0 = draw.vec2(1, 1)

        draw.surface:add_text(draw.vec2(arg_7_0.x + var_7_0.x, arg_7_0.y + var_7_0.y), arg_7_1, slot_0_47_0)
        draw.surface:add_text(arg_7_0, arg_7_1, arg_7_2)
end

function slot_0_53_0()
        slot_0_41_0 = slot_0_6_0:get_value():get()
        slot_8_0_0 = slot_0_1_0:get_value():get()

        if slot_0_20_0 then
                slot_0_20_0:set_visible(slot_8_0_0)
                slot_0_21_0:set_visible(slot_8_0_0)
                slot_0_22_0:set_visible(slot_8_0_0)
                slot_0_23_0:set_visible(slot_8_0_0)
                slot_0_24_0:set_visible(slot_8_0_0)
                slot_0_25_0:set_visible(slot_8_0_0)
                slot_0_26_0:set_visible(slot_8_0_0)

                slot_8_1_1 = slot_8_0_0 and slot_0_9_0:get_value():get()

                if slot_0_27_0 then
                        slot_0_27_0:set_visible(slot_8_1_1)
                end

                if slot_0_28_0 then
                        slot_0_28_0:set_visible(slot_8_1_1)
                end

                if slot_0_29_0 then
                        slot_0_29_0:set_visible(slot_8_1_1)
                end

                if slot_0_30_0 then
                        slot_0_30_0:set_visible(slot_8_1_1)
                end

                if slot_0_31_0 then
                        slot_0_31_0:set_visible(slot_8_1_1)
                end
        end

        if not game.engine:in_game() then
                slot_0_35_0 = 0
                slot_0_36_0 = 0
                slot_0_37_0 = {}
                slot_0_38_0 = 0
                slot_0_39_0 = false

                return
        end

        slot_8_1_0 = entities.get_local_controller()

        if not slot_8_1_0 then
                return
        end

        slot_8_2_0 = slot_8_1_0:get_name()
        slot_8_3_0 = draw.fonts.gui_bold or draw.fonts.gui_main

        if not slot_8_3_0 then
                return
        end

        draw.surface.font = slot_8_3_0

        entities.controllers:for_each(function(arg_9_0)
                local var_9_0 = arg_9_0.entity

                if not var_9_0 then
                        return
                end

                local var_9_1 = var_9_0:get_pawn()

                if not var_9_1 or not var_9_1:is_alive() then
                        return
                end

                if var_9_0:is_enemy() then
                        return
                end

                local var_9_2 = var_9_0:get_name()

                if var_9_2 == slot_8_2_0 then
                        return
                end

                if var_9_1.m_iHealth then
                        local var_9_3 = var_9_1.m_iHealth:get()
                        local var_9_4 = slot_0_37_0[var_9_2]

                        if not var_9_4 or var_9_4 < var_9_3 then
                                slot_0_37_0[var_9_2] = var_9_3
                        end
                end
        end)

        slot_8_4_0 = slot_0_2_0:get_value():get() / 100
        slot_8_5_0 = 0
        slot_8_6_0 = false

        if slot_0_38_0 > 0 then
                slot_8_8_1 = game.global_vars.real_time - slot_0_38_0
                slot_8_5_0 = math.max(0, slot_0_40_0 - slot_8_8_1)
                slot_8_6_0 = slot_8_5_0 > 0
        elseif slot_0_39_0 then
                slot_8_5_0 = slot_0_40_0
                slot_8_6_0 = true
        end

        slot_8_7_0 = slot_0_34_0()
        slot_8_8_0 = 12
        slot_8_9_0 = 10
        slot_8_10_0 = 4
        slot_8_11_0 = 18
        slot_8_12_0 = 12
        slot_8_13_0 = slot_8_7_0.title
        slot_8_14_0 = string.format(slot_8_7_0.damage, slot_0_35_0)
        slot_8_15_0 = string.format(slot_8_7_0.kills, slot_0_36_0)
        slot_8_16_0 = string.format(slot_8_7_0.cooldown, slot_8_5_0)
        slot_8_17_0 = slot_8_3_0:get_text_size(slot_8_13_0)
        slot_8_18_0 = slot_8_3_0:get_text_size(slot_8_14_0)
        slot_8_19_0 = slot_8_3_0:get_text_size(slot_8_15_0)
        slot_8_20_0 = slot_8_3_0:get_text_size(slot_8_16_0)
        slot_8_21_0 = slot_0_8_0:get_value():get():get_raw()
        slot_8_22_0 = math.floor(slot_8_21_0 / 2) % 2 >= 1
        slot_8_23_0 = 16
        slot_8_24_0 = slot_8_6_0 and 4 or 3
        slot_8_25_0 = nil
        slot_8_26_0 = nil

        if slot_8_22_0 then
                slot_8_27_1 = math.max(slot_8_17_0.x, slot_8_18_0.x, slot_8_19_0.x)

                if slot_8_6_0 then
                        slot_8_27_1 = math.max(slot_8_27_1, slot_8_20_0.x)
                end

                slot_8_25_0 = slot_8_27_1 + slot_8_8_0 * 2
                slot_8_26_0 = slot_8_9_0 + slot_8_11_0 * slot_8_24_0 + slot_8_10_0
        else
                slot_8_25_0 = slot_8_17_0.x + slot_8_23_0 + slot_8_18_0.x + slot_8_23_0 + slot_8_19_0.x

                if slot_8_6_0 then
                        slot_8_25_0 = slot_8_25_0 + slot_8_23_0 + slot_8_20_0.x
                end

                slot_8_25_0 = slot_8_25_0 + slot_8_8_0 * 2
                slot_8_26_0 = slot_8_11_0 + slot_8_9_0 + slot_8_10_0
        end

        slot_8_27_0, slot_8_28_0 = game.engine:get_screen_size()
        slot_8_29_0 = slot_0_5_0:get_value():get():get_raw()
        slot_8_30_0 = slot_8_29_0 % 2 >= 1
        slot_8_31_0 = math.floor(slot_8_29_0 / 2) % 2 >= 1
        slot_8_32_0 = math.floor(slot_8_29_0 / 4) % 2 >= 1
        slot_8_33_0 = math.floor(slot_8_29_0 / 8) % 2 >= 1

        if not slot_8_30_0 and not slot_8_31_0 and not slot_8_32_0 and not slot_8_33_0 then
                slot_8_30_0 = true
        end

        slot_8_34_0 = 1

        if slot_8_30_0 then
                slot_8_34_0 = 1
        elseif slot_8_31_0 then
                slot_8_34_0 = 2
        elseif slot_8_32_0 then
                slot_8_34_0 = 3
        elseif slot_8_33_0 then
                slot_8_34_0 = 4
        end

        slot_8_35_0 = slot_0_3_0:get_value():get()
        slot_8_36_0 = nil
        slot_8_37_0 = nil
        slot_8_38_0 = nil

        if slot_8_34_0 == 1 then
                slot_8_36_0 = 0
                slot_8_37_0 = slot_8_35_0
                slot_8_38_0 = draw.rect(slot_8_36_0 - slot_8_12_0, slot_8_37_0, slot_8_36_0 + slot_8_25_0, slot_8_37_0 + slot_8_26_0)
        elseif slot_8_34_0 == 2 then
                slot_8_36_0 = slot_8_27_0 - slot_8_25_0
                slot_8_37_0 = slot_8_35_0
                slot_8_38_0 = draw.rect(slot_8_36_0, slot_8_37_0, slot_8_36_0 + slot_8_25_0 + slot_8_12_0, slot_8_37_0 + slot_8_26_0)
        elseif slot_8_34_0 == 3 then
                slot_8_36_0 = slot_8_35_0
                slot_8_37_0 = 0
                slot_8_38_0 = draw.rect(slot_8_36_0, slot_8_37_0 - slot_8_12_0, slot_8_36_0 + slot_8_25_0, slot_8_37_0 + slot_8_26_0)
        elseif slot_8_34_0 == 4 then
                slot_8_36_0 = slot_8_35_0
                slot_8_37_0 = slot_8_28_0 - slot_8_26_0
                slot_8_38_0 = draw.rect(slot_8_36_0, slot_8_37_0, slot_8_36_0 + slot_8_25_0, slot_8_37_0 + slot_8_26_0 + slot_8_12_0)
        end

        slot_8_39_0 = math.floor(slot_8_4_0 * 255)

        if slot_8_39_0 > 0 then
                draw.surface:add_rect_filled_rounded(slot_8_38_0, draw.color(0, 0, 0, slot_8_39_0), slot_8_12_0)
        end

        slot_8_40_0 = slot_0_49_0()

        if slot_8_22_0 then
                slot_8_41_4 = slot_8_36_0 + (slot_8_25_0 - slot_8_17_0.x) / 2

                slot_0_52_0(draw.vec2(slot_8_41_4, slot_8_37_0 + slot_8_9_0), slot_8_13_0, slot_0_50_0())

                slot_8_42_1 = slot_8_36_0 + (slot_8_25_0 - slot_8_18_0.x) / 2

                slot_0_52_0(draw.vec2(slot_8_42_1, slot_8_37_0 + slot_8_9_0 + slot_8_11_0), slot_8_14_0, slot_8_40_0)

                slot_8_43_0 = slot_8_36_0 + (slot_8_25_0 - slot_8_19_0.x) / 2

                slot_0_52_0(draw.vec2(slot_8_43_0, slot_8_37_0 + slot_8_9_0 + slot_8_11_0 * 2), slot_8_15_0, slot_8_40_0)

                if slot_8_6_0 then
                        slot_8_44_0 = slot_8_36_0 + (slot_8_25_0 - slot_8_20_0.x) / 2

                        slot_0_52_0(draw.vec2(slot_8_44_0, slot_8_37_0 + slot_8_9_0 + slot_8_11_0 * 3), slot_8_16_0, slot_0_51_0())
                end
        else
                slot_8_41_3 = slot_8_36_0 + slot_8_8_0
                slot_8_42_0 = slot_8_37_0 + slot_8_9_0

                slot_0_52_0(draw.vec2(slot_8_41_3, slot_8_42_0), slot_8_13_0, slot_0_50_0())

                slot_8_41_2 = slot_8_41_3 + slot_8_17_0.x + slot_8_23_0

                slot_0_52_0(draw.vec2(slot_8_41_2, slot_8_42_0), slot_8_14_0, slot_8_40_0)

                slot_8_41_1 = slot_8_41_2 + slot_8_18_0.x + slot_8_23_0

                slot_0_52_0(draw.vec2(slot_8_41_1, slot_8_42_0), slot_8_15_0, slot_8_40_0)

                slot_8_41_0 = slot_8_41_1 + slot_8_19_0.x + slot_8_23_0

                if slot_8_6_0 then
                        slot_0_52_0(draw.vec2(slot_8_41_0, slot_8_42_0), slot_8_16_0, slot_0_51_0())
                end
        end
end

events.event:add(slot_0_48_0)
events.present_queue:add(slot_0_53_0)
