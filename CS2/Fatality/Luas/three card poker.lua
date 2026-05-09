--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = 0
slot_0_1_0 = {
        bold = draw.fonts.gui_bold,
        main = draw.fonts.gui_main
}
slot_0_2_0 = {
        white = {
                r = 255,
                g = 255,
                b = 255
        },
        orange = {
                r = 255,
                g = 180,
                b = 50
        },
        green = {
                r = 80,
                g = 255,
                b = 100
        },
        blue = {
                r = 80,
                g = 150,
                b = 255
        },
        card_v = {
                r = 180,
                g = 180,
                b = 190
        },
        card_bg = {
                r = 250,
                g = 250,
                b = 255
        },
        panel_bg = {
                r = 18,
                g = 20,
                b = 28,
                a = 245
        },
        border = {
                r = 60,
                g = 70,
                b = 120,
                a = 150
        },
        header = {
                r = 80,
                g = 110,
                b = 255,
                a = 180
        },
        shadow = {
                r = 0,
                g = 0,
                b = 0,
                a = 80
        }
}
slot_0_3_0 = {
        "S",
        "H",
        "D",
        "C"
}
slot_0_4_0 = {
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "J",
        "Q",
        "K",
        "A"
}
slot_0_5_0 = {
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "Jack",
        "Queen",
        "King",
        "Ace"
}
slot_0_6_0 = 0
slot_0_7_0 = 1
slot_0_8_0 = 2
slot_0_9_0 = 3
slot_0_10_0 = 4
slot_0_11_0 = 5

function slot_0_12_0(arg_1_0, arg_1_1)
        return draw.color(arg_1_0.r, arg_1_0.g, arg_1_0.b, arg_1_1 or arg_1_0.a or 255)
end

function slot_0_13_0(arg_2_0, arg_2_1, arg_2_2)
        return arg_2_0 + (arg_2_1 - arg_2_0) * arg_2_2
end

function slot_0_14_0(arg_3_0, arg_3_1, arg_3_2)
        return math.max(arg_3_1, math.min(arg_3_2, arg_3_0))
end

function slot_0_15_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
        return arg_4_2 <= arg_4_0 and arg_4_0 <= arg_4_2 + arg_4_4 and arg_4_3 <= arg_4_1 and arg_4_1 <= arg_4_3 + arg_4_5
end

function slot_0_16_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5, arg_5_6, arg_5_7)
        if not arg_5_6 or arg_5_6 == "" or not arg_5_1 then
                return
        end

        local var_5_0 = arg_5_1:get_text_size(tostring(arg_5_6))
        local var_5_1 = var_5_0.x * 1.12
        local var_5_2 = var_5_0.y

        arg_5_0.font = arg_5_1

        arg_5_0:add_text(draw.vec2(math.floor(arg_5_2 + (arg_5_4 - var_5_1) / 2), math.floor(arg_5_3 + (arg_5_5 - var_5_2) / 2)), tostring(arg_5_6), arg_5_7)
end

slot_0_17_0 = {
        play_bet = 0,
        ante_bet = 10,
        last_chips = 1000,
        chip_pulse = 0,
        shake_timer = 0,
        message = "Place bets and press DEAL!",
        chips = 1000,
        pair_plus_bet = 0,
        player_decision = false,
        game_active = false,
        banner_anim = 0,
        lost_game = false,
        bet_unit_index = 2,
        bet_units = {
                5,
                10,
                25,
                50,
                100,
                500,
                1000
        },
        player_hand = {},
        dealer_hand = {},
        particles = {}
}
slot_0_18_0 = {
        off_x = 0,
        off_y = 0,
        cur_y = 0,
        cur_x = 0,
        is_dragging = false,
        panel_y = 100,
        panel_x = 100
}

function slot_0_19_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
        for iter_6_0 = 1, arg_6_2 do
                local var_6_0 = {
                        r = 255,
                        g = 215,
                        b = 0
                }
                local var_6_1 = math.random(6)

                if var_6_1 == 1 then
                        var_6_0 = {
                                r = 255,
                                g = 50,
                                b = 50
                        }
                elseif var_6_1 == 2 then
                        var_6_0 = {
                                r = 50,
                                g = 255,
                                b = 50
                        }
                elseif var_6_1 == 3 then
                        var_6_0 = {
                                r = 50,
                                g = 150,
                                b = 255
                        }
                elseif var_6_1 == 4 then
                        var_6_0 = {
                                r = 255,
                                g = 215,
                                b = 0
                        }
                elseif var_6_1 == 5 then
                        var_6_0 = {
                                r = 255,
                                g = 50,
                                b = 255
                        }
                else
                        var_6_0 = {
                                r = 50,
                                g = 255,
                                b = 255
                        }
                end

                local var_6_2 = arg_6_3 or "firework"
                local var_6_3 = {
                        life = 1,
                        x = arg_6_0,
                        y = arg_6_1,
                        color = var_6_0,
                        type = var_6_2
                }

                if var_6_2 == "firework" then
                        var_6_3.vx, var_6_3.vy, var_6_3.size, var_6_3.decay, var_6_3.fric, var_6_3.grav = (math.random() - 0.5) * 15, (math.random() - 1.2) * 18, 2 + math.random(3), 0.015, 0.98, 0.5
                elseif var_6_2 == "smoke" then
                        var_6_3.vx, var_6_3.vy, var_6_3.size, var_6_3.decay, var_6_3.fric, var_6_3.grav = (math.random() - 0.5) * 4, (math.random() - 0.8) * 6, 4 + math.random(6), 0.03, 0.95, -0.1
                elseif var_6_2 == "glitter" then
                        var_6_3.vx, var_6_3.vy, var_6_3.size, var_6_3.decay, var_6_3.fric, var_6_3.grav = (math.random() - 0.5) * 8, (math.random() - 1) * 10, 1 + math.random(2), 0.02, 0.92, 0.3
                end

                table.insert(slot_0_17_0.particles, var_6_3)
        end
end

slot_0_20_0 = {}

function slot_0_21_0()
        slot_0_20_0 = {}

        for iter_7_0, iter_7_1 in ipairs(slot_0_3_0) do
                for iter_7_2, iter_7_3 in ipairs(slot_0_4_0) do
                        table.insert(slot_0_20_0, {
                                suit = iter_7_1,
                                rank = iter_7_3,
                                value = iter_7_2 + 1
                        })
                end
        end

        math.randomseed(math.floor((draw.time or 0) * 10000) + math.floor(slot_0_0_0 * 1000) % 10000)

        for iter_7_4 = #slot_0_20_0, 2, -1 do
                local var_7_0 = math.random(iter_7_4)

                slot_0_20_0[iter_7_4], slot_0_20_0[var_7_0] = slot_0_20_0[var_7_0], slot_0_20_0[iter_7_4]
        end
end

function slot_0_22_0(arg_8_0)
        if #slot_0_20_0 == 0 then
                slot_0_21_0()
        end

        local var_8_0 = table.remove(slot_0_20_0)

        var_8_0.deal_time = (draw.time and draw.time > 0 and draw.time or slot_0_0_0) + (arg_8_0 or 0)

        return var_8_0
end

function slot_0_23_0(arg_9_0)
        if not arg_9_0 or #arg_9_0 < 3 then
                return slot_0_6_0, {
                        0,
                        0,
                        0
                }
        end

        local var_9_0 = {
                arg_9_0[1].value,
                arg_9_0[2].value,
                arg_9_0[3].value
        }

        table.sort(var_9_0, function(arg_10_0, arg_10_1)
                return arg_10_1 < arg_10_0
        end)

        local var_9_1 = arg_9_0[1].suit == arg_9_0[2].suit and arg_9_0[2].suit == arg_9_0[3].suit
        local var_9_2 = var_9_0[1] == var_9_0[2] + 1 and var_9_0[2] == var_9_0[3] + 1

        if not var_9_2 and var_9_0[1] == 14 and var_9_0[2] == 3 and var_9_0[3] == 2 then
                var_9_2, var_9_0 = true, {
                        3,
                        2,
                        1
                }
        end

        if var_9_2 and var_9_1 then
                return slot_0_11_0, var_9_0
        end

        if var_9_0[1] == var_9_0[2] and var_9_0[2] == var_9_0[3] then
                return slot_0_10_0, var_9_0
        end

        if var_9_2 then
                return slot_0_9_0, var_9_0
        end

        if var_9_1 then
                return slot_0_8_0, var_9_0
        end

        if var_9_0[1] == var_9_0[2] or var_9_0[2] == var_9_0[3] or var_9_0[1] == var_9_0[3] then
                local var_9_3 = var_9_0[1]
                local var_9_4 = var_9_0[3]

                if var_9_0[2] == var_9_0[3] then
                        var_9_3, var_9_4 = var_9_0[2], var_9_0[1]
                elseif var_9_0[1] == var_9_0[3] then
                        var_9_3, var_9_4 = var_9_0[1], var_9_0[2]
                end

                return slot_0_7_0, {
                        var_9_3,
                        var_9_4
                }
        end

        return slot_0_6_0, var_9_0
end

function slot_0_24_0(arg_11_0, arg_11_1)
        local var_11_0, var_11_1 = slot_0_23_0(arg_11_0)
        local var_11_2, var_11_3 = slot_0_23_0(arg_11_1)

        if var_11_0 ~= var_11_2 then
                return var_11_2 < var_11_0 and 1 or -1
        end

        for iter_11_0 = 1, #var_11_1 do
                if var_11_1[iter_11_0] ~= var_11_3[iter_11_0] then
                        return var_11_1[iter_11_0] > var_11_3[iter_11_0] and 1 or -1
                end
        end

        return 0
end

function slot_0_25_0(arg_12_0)
        local var_12_0, var_12_1 = slot_0_23_0(arg_12_0)

        return var_12_0 > slot_0_6_0 or var_12_1[1] >= 12
end

function slot_0_26_0(arg_13_0, arg_13_1)
        local function var_13_0(arg_14_0)
                return slot_0_5_0[arg_14_0 - 1] or tostring(arg_14_0)
        end

        if arg_13_0 == slot_0_11_0 then
                return var_13_0(arg_13_1[1]) .. "-High Str Flush"
        elseif arg_13_0 == slot_0_10_0 then
                return "3 of a Kind (" .. var_13_0(arg_13_1[1]) .. "s)"
        elseif arg_13_0 == slot_0_9_0 then
                return var_13_0(arg_13_1[1]) .. "-High Straight"
        elseif arg_13_0 == slot_0_8_0 then
                return var_13_0(arg_13_1[1]) .. "-High Flush"
        elseif arg_13_0 == slot_0_7_0 then
                return "Pair of " .. var_13_0(arg_13_1[1]) .. "s"
        else
                return var_13_0(arg_13_1[1]) .. " High"
        end
end

function slot_0_27_0(arg_15_0)
        slot_0_17_0.game_active, slot_0_17_0.player_decision = false, false

        local var_15_0, var_15_1 = slot_0_23_0(slot_0_17_0.player_hand)
        local var_15_2, var_15_3 = slot_0_23_0(slot_0_17_0.dealer_hand)
        local var_15_4 = slot_0_25_0(slot_0_17_0.dealer_hand)
        local var_15_5 = 0
        local var_15_6 = ""

        if slot_0_17_0.pair_plus_bet > 0 then
                local var_15_7 = 0

                if var_15_0 == slot_0_11_0 then
                        var_15_7 = 40
                elseif var_15_0 == slot_0_10_0 then
                        var_15_7 = 30
                elseif var_15_0 == slot_0_9_0 then
                        var_15_7 = 6
                elseif var_15_0 == slot_0_8_0 then
                        var_15_7 = 3
                elseif var_15_0 == slot_0_7_0 then
                        var_15_7 = 1
                end

                if var_15_7 > 0 then
                        var_15_5, var_15_6 = var_15_5 + slot_0_17_0.pair_plus_bet * (var_15_7 + 1), "PP Win! "

                        slot_0_19_0(slot_0_18_0.panel_x + 200, slot_0_18_0.panel_y + 200, 20, "glitter")
                end
        end

        if arg_15_0 then
                slot_0_17_0.chips, slot_0_17_0.message, slot_0_17_0.game_result, slot_0_17_0.shake_timer = slot_0_17_0.chips + var_15_5, "Folded. Lost Ante. " .. var_15_6, "lose", 0.2

                return
        end

        local var_15_8 = 0

        if var_15_0 == slot_0_11_0 then
                var_15_8 = 5
        elseif var_15_0 == slot_0_10_0 then
                var_15_8 = 4
        elseif var_15_0 == slot_0_9_0 then
                var_15_8 = 1
        end

        if var_15_8 > 0 then
                var_15_5 = var_15_5 + slot_0_17_0.ante_bet * var_15_8
                var_15_6 = var_15_6 .. "Ante Bonus! "
        end

        local var_15_9 = slot_0_24_0(slot_0_17_0.player_hand, slot_0_17_0.dealer_hand)

        if not var_15_4 then
                var_15_5, var_15_6, slot_0_17_0.game_result = var_15_5 + slot_0_17_0.ante_bet * 2 + slot_0_17_0.play_bet, var_15_6 .. "Dealer DNQ. ", "win"
        elseif var_15_9 > 0 then
                var_15_5, var_15_6, slot_0_17_0.game_result = var_15_5 + slot_0_17_0.ante_bet * 2 + slot_0_17_0.play_bet * 2, var_15_6 .. "You won! ", "win"

                slot_0_19_0(slot_0_18_0.panel_x + 200, slot_0_18_0.panel_y + 200, 40, "firework")
        elseif var_15_9 < 0 then
                var_15_6, slot_0_17_0.game_result = var_15_6 .. "Dealer wins. ", "lose"
        else
                var_15_5, var_15_6, slot_0_17_0.game_result = var_15_5 + slot_0_17_0.ante_bet + slot_0_17_0.play_bet, var_15_6 .. "Push. ", "push"
        end

        slot_0_17_0.chips, slot_0_17_0.message, slot_0_17_0.shake_timer = slot_0_17_0.chips + var_15_5, var_15_6 .. "(" .. slot_0_26_0(var_15_0, var_15_1) .. " vs " .. (var_15_4 and slot_0_26_0(var_15_2, var_15_3) or "DNQ") .. ")", 0.3

        if slot_0_17_0.chips <= 0 and not slot_0_17_0.game_active then
                slot_0_17_0.lost_game, slot_0_17_0.message = true, "YOU'RE BROKE!"
        end
end

function slot_0_28_0(arg_16_0)
        if arg_16_0 == "deal" and not slot_0_17_0.game_active then
                if slot_0_17_0.lost_game then
                        slot_0_17_0.chips, slot_0_17_0.lost_game = 1000, false
                end

                if slot_0_17_0.ante_bet <= 0 and slot_0_17_0.pair_plus_bet <= 0 then
                        slot_0_17_0.message = "Place a bet first!"

                        return
                end

                if slot_0_17_0.ante_bet * 2 + slot_0_17_0.pair_plus_bet > slot_0_17_0.chips then
                        slot_0_17_0.message = "Not enough chips!"

                        return
                end

                slot_0_17_0.chips = slot_0_17_0.chips - (slot_0_17_0.ante_bet + slot_0_17_0.pair_plus_bet)

                slot_0_21_0()

                slot_0_17_0.player_hand, slot_0_17_0.dealer_hand = {
                        slot_0_22_0(0.1),
                        slot_0_22_0(0.3),
                        slot_0_22_0(0.5)
                }, {
                        slot_0_22_0(0.2),
                        slot_0_22_0(0.4),
                        slot_0_22_0(0.6)
                }
                slot_0_17_0.game_active, slot_0_17_0.player_decision, slot_0_17_0.game_result, slot_0_17_0.message = true, true, nil, "Play or Fold?"
        elseif arg_16_0 == "play" and slot_0_17_0.player_decision then
                slot_0_17_0.chips = slot_0_17_0.chips - slot_0_17_0.ante_bet
                slot_0_17_0.play_bet = slot_0_17_0.ante_bet

                slot_0_27_0(false)
        elseif arg_16_0 == "fold" and slot_0_17_0.player_decision then
                slot_0_27_0(true)
        elseif arg_16_0 == "ante_up" and not slot_0_17_0.game_active then
                slot_16_1_1 = slot_0_17_0.bet_units[slot_0_17_0.bet_unit_index]

                if (slot_0_17_0.ante_bet + slot_16_1_1) * 2 + slot_0_17_0.pair_plus_bet <= slot_0_17_0.chips then
                        slot_0_17_0.ante_bet = slot_0_17_0.ante_bet + slot_16_1_1
                else
                        slot_0_17_0.ante_bet = math.max(0, math.floor((slot_0_17_0.chips - slot_0_17_0.pair_plus_bet) / 2))
                end
        elseif arg_16_0 == "ante_down" and not slot_0_17_0.game_active then
                slot_0_17_0.ante_bet = math.max(0, slot_0_17_0.ante_bet - slot_0_17_0.bet_units[slot_0_17_0.bet_unit_index])
        elseif arg_16_0 == "pp_up" and not slot_0_17_0.game_active then
                slot_16_1_0 = slot_0_17_0.bet_units[slot_0_17_0.bet_unit_index]

                if slot_0_17_0.ante_bet * 2 + slot_0_17_0.pair_plus_bet + slot_16_1_0 <= slot_0_17_0.chips then
                        slot_0_17_0.pair_plus_bet = slot_0_17_0.pair_plus_bet + slot_16_1_0
                else
                        slot_0_17_0.pair_plus_bet = math.max(0, slot_0_17_0.chips - slot_0_17_0.ante_bet * 2)
                end
        elseif arg_16_0 == "pp_down" and not slot_0_17_0.game_active then
                slot_0_17_0.pair_plus_bet = math.max(0, slot_0_17_0.pair_plus_bet - slot_0_17_0.bet_units[slot_0_17_0.bet_unit_index])
        elseif arg_16_0 == "unit_up" and not slot_0_17_0.game_active then
                slot_0_17_0.bet_unit_index = math.min(#slot_0_17_0.bet_units, slot_0_17_0.bet_unit_index + 1)
        elseif arg_16_0 == "unit_down" and not slot_0_17_0.game_active then
                slot_0_17_0.bet_unit_index = math.max(1, slot_0_17_0.bet_unit_index - 1)
        elseif arg_16_0 == "reset" then
                slot_0_17_0.chips, slot_0_17_0.ante_bet, slot_0_17_0.pair_plus_bet = 1000, 10, 0
                slot_0_17_0.player_hand, slot_0_17_0.dealer_hand, slot_0_17_0.game_active, slot_0_17_0.player_decision = {}, {}, false, false
                slot_0_17_0.game_result, slot_0_17_0.banner_anim, slot_0_17_0.message, slot_0_17_0.lost_game = nil, 0, "Place bets and press DEAL!", false
        end
end

slot_0_29_0 = {
        ante_up = {
                w = 82,
                h = 30,
                x = 20,
                y = 395,
                l = "ANTE +"
        },
        ante_down = {
                w = 82,
                h = 30,
                x = 119,
                y = 395,
                l = "ANTE -"
        },
        pp_up = {
                w = 82,
                h = 30,
                x = 218,
                y = 395,
                l = "PP +"
        },
        pp_down = {
                w = 82,
                h = 30,
                x = 317,
                y = 395,
                l = "PP -"
        },
        deal = {
                w = 110,
                h = 35,
                x = 20,
                y = 440,
                l = "DEAL"
        },
        play = {
                w = 110,
                h = 35,
                x = 155,
                y = 440,
                l = "PLAY"
        },
        fold = {
                w = 110,
                h = 35,
                x = 290,
                y = 440,
                l = "FOLD"
        },
        reset = {
                w = 100,
                h = 35,
                x = 20,
                y = 495,
                l = "RESET"
        },
        unit_down = {
                w = 65,
                h = 35,
                x = 260,
                y = 495,
                l = "UNIT -"
        },
        unit_up = {
                w = 65,
                h = 35,
                x = 335,
                y = 495,
                l = "UNIT +"
        }
}
slot_0_30_0 = {}
slot_0_31_0 = {}

for iter_0_0 in pairs(slot_0_29_0) do
        slot_0_30_0[iter_0_0], slot_0_31_0[iter_0_0] = 0, 0
end

function slot_0_32_0(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5)
        slot_17_6_0 = arg_17_3 / 2

        if arg_17_4 == "D" then
                arg_17_0:add_triangle_filled_multicolor(draw.vec2(math.floor(arg_17_1), math.floor(arg_17_2 - slot_17_6_0)), draw.vec2(math.floor(arg_17_1 + slot_17_6_0), math.floor(arg_17_2)), draw.vec2(math.floor(arg_17_1 - slot_17_6_0), math.floor(arg_17_2)), {
                        arg_17_5,
                        arg_17_5,
                        arg_17_5
                })
                arg_17_0:add_triangle_filled_multicolor(draw.vec2(math.floor(arg_17_1), math.floor(arg_17_2 + slot_17_6_0)), draw.vec2(math.floor(arg_17_1 + slot_17_6_0), math.floor(arg_17_2)), draw.vec2(math.floor(arg_17_1 - slot_17_6_0), math.floor(arg_17_2)), {
                        arg_17_5,
                        arg_17_5,
                        arg_17_5
                })
        elseif arg_17_4 == "H" then
                slot_17_7_2 = arg_17_3 / 4

                arg_17_0:add_circle_filled(draw.vec2(math.floor(arg_17_1 - slot_17_7_2), math.floor(arg_17_2 - slot_17_7_2 / 2)), slot_17_7_2, arg_17_5, 12)
                arg_17_0:add_circle_filled(draw.vec2(math.floor(arg_17_1 + slot_17_7_2), math.floor(arg_17_2 - slot_17_7_2 / 2)), slot_17_7_2, arg_17_5, 12)
                arg_17_0:add_triangle_filled_multicolor(draw.vec2(math.floor(arg_17_1), math.floor(arg_17_2 + slot_17_6_0)), draw.vec2(math.floor(arg_17_1 - slot_17_6_0), math.floor(arg_17_2 - slot_17_7_2 / 2)), draw.vec2(math.floor(arg_17_1 + slot_17_6_0), math.floor(arg_17_2 - slot_17_7_2 / 2)), {
                        arg_17_5,
                        arg_17_5,
                        arg_17_5
                })
        elseif arg_17_4 == "S" then
                slot_17_7_1 = arg_17_3 / 4
                slot_17_8_1 = arg_17_3 / 6

                arg_17_0:add_circle_filled(draw.vec2(math.floor(arg_17_1 - slot_17_7_1), math.floor(arg_17_2 + slot_17_7_1 / 2)), slot_17_7_1, arg_17_5, 12)
                arg_17_0:add_circle_filled(draw.vec2(math.floor(arg_17_1 + slot_17_7_1), math.floor(arg_17_2 + slot_17_7_1 / 2)), slot_17_7_1, arg_17_5, 12)
                arg_17_0:add_triangle_filled_multicolor(draw.vec2(math.floor(arg_17_1), math.floor(arg_17_2 - slot_17_6_0)), draw.vec2(math.floor(arg_17_1 - slot_17_6_0), math.floor(arg_17_2 + slot_17_7_1 / 2)), draw.vec2(math.floor(arg_17_1 + slot_17_6_0), math.floor(arg_17_2 + slot_17_7_1 / 2)), {
                        arg_17_5,
                        arg_17_5,
                        arg_17_5
                })
                arg_17_0:add_triangle_filled_multicolor(draw.vec2(math.floor(arg_17_1), math.floor(arg_17_2 + slot_17_7_1)), draw.vec2(math.floor(arg_17_1 - slot_17_8_1), math.floor(arg_17_2 + slot_17_6_0)), draw.vec2(math.floor(arg_17_1 + slot_17_8_1), math.floor(arg_17_2 + slot_17_6_0)), {
                        arg_17_5,
                        arg_17_5,
                        arg_17_5
                })
        elseif arg_17_4 == "C" then
                slot_17_7_0 = arg_17_3 / 3.5
                slot_17_8_0 = arg_17_3 / 6

                arg_17_0:add_circle_filled(draw.vec2(math.floor(arg_17_1), math.floor(arg_17_2 - slot_17_7_0)), slot_17_7_0, arg_17_5, 12)
                arg_17_0:add_circle_filled(draw.vec2(math.floor(arg_17_1 - slot_17_7_0), math.floor(arg_17_2 + slot_17_7_0 / 2)), slot_17_7_0, arg_17_5, 12)
                arg_17_0:add_circle_filled(draw.vec2(math.floor(arg_17_1 + slot_17_7_0), math.floor(arg_17_2 + slot_17_7_0 / 2)), slot_17_7_0, arg_17_5, 12)
                arg_17_0:add_triangle_filled_multicolor(draw.vec2(math.floor(arg_17_1), math.floor(arg_17_2)), draw.vec2(math.floor(arg_17_1 - slot_17_8_0), math.floor(arg_17_2 + slot_17_6_0)), draw.vec2(math.floor(arg_17_1 + slot_17_8_0), math.floor(arg_17_2 + slot_17_6_0)), {
                        arg_17_5,
                        arg_17_5,
                        arg_17_5
                })
        end
end

function slot_0_33_0(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5, arg_18_6)
        slot_18_7_1 = slot_0_14_0(((draw.time and draw.time > 0 and draw.time or slot_0_0_0) - (arg_18_3.deal_time or 0)) / 0.4, 0, 1)
        slot_18_7_0 = 1 - math.pow(1 - slot_18_7_1, 4)
        slot_18_8_0 = slot_0_13_0(arg_18_5 + 340, arg_18_1, slot_18_7_0)
        slot_18_9_0 = slot_0_13_0(arg_18_6 + 10, arg_18_2, slot_18_7_0)
        slot_18_10_0 = math.floor(slot_18_7_0 * 255)

        if slot_18_7_0 <= 0 then
                return
        end

        if arg_18_4 then
                arg_18_0:add_rect_filled(draw.rect(math.floor(slot_18_8_0), math.floor(slot_18_9_0), math.floor(slot_18_8_0 + 55), math.floor(slot_18_9_0 + 78)), draw.color(25, 27, 35, slot_18_10_0), 6)
                arg_18_0:add_rect_filled(draw.rect(math.floor(slot_18_8_0 + 3), math.floor(slot_18_9_0 + 3), math.floor(slot_18_8_0 + 52), math.floor(slot_18_9_0 + 75)), draw.color(45, 50, 80, slot_18_10_0), 4)
                arg_18_0:add_rect(draw.rect(math.floor(slot_18_8_0), math.floor(slot_18_9_0), math.floor(slot_18_8_0 + 55), math.floor(slot_18_9_0 + 78)), draw.color(100, 110, 180, slot_18_10_0), 6, 2)
        else
                arg_18_0:add_rect_filled(draw.rect(math.floor(slot_18_8_0), math.floor(slot_18_9_0), math.floor(slot_18_8_0 + 55), math.floor(slot_18_9_0 + 78)), slot_0_12_0(slot_0_2_0.card_bg), 6)
                arg_18_0:add_rect(draw.rect(math.floor(slot_18_8_0), math.floor(slot_18_9_0), math.floor(slot_18_8_0 + 55), math.floor(slot_18_9_0 + 78)), slot_0_12_0(slot_0_2_0.card_v), 6, 1)

                slot_18_11_0 = arg_18_3.suit == "H" or arg_18_3.suit == "D"
                slot_18_12_0 = draw.color(slot_18_11_0 and 255 or 40, slot_18_11_0 and 70 or 42, slot_18_11_0 and 85 or 50, slot_18_10_0)
                arg_18_0.font = slot_0_1_0.bold

                arg_18_0:add_text(draw.vec2(math.floor(slot_18_8_0 + 6), math.floor(slot_18_9_0 + 4)), arg_18_3.rank, slot_18_12_0)
                slot_0_32_0(arg_18_0, math.floor(slot_18_8_0 + 10), math.floor(slot_18_9_0 + 23), 10, arg_18_3.suit, slot_18_12_0)
                slot_0_32_0(arg_18_0, math.floor(slot_18_8_0 + 27.5), math.floor(slot_18_9_0 + 44), 24, arg_18_3.suit, slot_18_12_0)
        end
end

slot_0_34_0 = gui.checkbox(gui.control_id("poker_enable_3C"))

gui.ctx:find("lua>elements a"):add(gui.make_control("Enable 3-Card Poker", slot_0_34_0))

slot_0_35_0 = {
        win = {
                r = 30,
                g = 70,
                b = 45
        },
        push = {
                r = 65,
                g = 60,
                b = 35
        },
        lose = {
                r = 70,
                g = 30,
                b = 35
        }
}

events.present_queue:add(function()
        if not slot_0_34_0:get_value():get() then
                return
        end

        slot_19_0_0 = draw.surface
        slot_0_0_0 = slot_0_0_0 + 0.01
        slot_19_1_0 = slot_0_18_0.panel_x
        slot_19_2_0 = slot_0_18_0.panel_y
        slot_19_3_0 = slot_19_1_0 + 20
        slot_19_4_0 = slot_19_2_0 + 45
        slot_0_17_0.banner_anim = slot_0_13_0(slot_0_17_0.banner_anim, slot_0_17_0.game_result and not slot_0_17_0.game_active and 1 or 0, 0.15)

        for iter_19_0 = #slot_0_17_0.particles, 1, -1 do
                slot_19_9_1 = slot_0_17_0.particles[iter_19_0]
                slot_19_9_1.vx, slot_19_9_1.vy = slot_19_9_1.vx * slot_19_9_1.fric, slot_19_9_1.vy * slot_19_9_1.fric + slot_19_9_1.grav
                slot_19_9_1.x, slot_19_9_1.y, slot_19_9_1.life = slot_19_9_1.x + slot_19_9_1.vx, slot_19_9_1.y + slot_19_9_1.vy, slot_19_9_1.life - slot_19_9_1.decay

                if slot_19_9_1.life <= 0 or slot_19_9_1.y > 1000 then
                        table.remove(slot_0_17_0.particles, iter_19_0)
                end
        end

        slot_0_17_0.chip_pulse = slot_0_13_0(slot_0_17_0.chip_pulse, 0, 0.1)

        if slot_0_17_0.chips ~= slot_0_17_0.last_chips then
                slot_0_17_0.chip_pulse, slot_0_17_0.last_chips = 1, slot_0_17_0.chips
        end

        slot_19_5_0 = 0
        slot_19_6_0 = 0

        if slot_0_17_0.shake_timer > 0 then
                slot_19_5_0, slot_19_6_0 = (math.random() - 0.5) * 15 * slot_0_17_0.shake_timer, (math.random() - 0.5) * 15 * slot_0_17_0.shake_timer
                slot_0_17_0.shake_timer = slot_0_13_0(slot_0_17_0.shake_timer, 0, 0.2)
        end

        slot_19_7_0 = slot_19_1_0 + slot_19_5_0
        slot_19_8_0 = slot_19_2_0 + slot_19_6_0
        slot_19_9_0 = 420

        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_7_0 - 2), math.floor(slot_19_8_0 - 2), math.floor(slot_19_7_0 + slot_19_9_0 + 2), math.floor(slot_19_8_0 + 602)), slot_0_12_0(slot_0_2_0.shadow), 12)
        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_7_0), math.floor(slot_19_8_0), math.floor(slot_19_7_0 + slot_19_9_0), math.floor(slot_19_8_0 + 600)), slot_0_12_0(slot_0_2_0.panel_bg), 12)
        slot_19_0_0:add_rect(draw.rect(math.floor(slot_19_7_0), math.floor(slot_19_8_0), math.floor(slot_19_7_0 + slot_19_9_0), math.floor(slot_19_8_0 + 600)), slot_0_12_0(slot_0_2_0.border), 12, 1)
        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_7_0), math.floor(slot_19_8_0), math.floor(slot_19_7_0 + slot_19_9_0), math.floor(slot_19_8_0 + 3)), slot_0_12_0(slot_0_2_0.header), 12)

        slot_19_10_0 = slot_0_15_0(slot_0_18_0.cur_x, slot_0_18_0.cur_y, slot_19_7_0, slot_19_8_0, slot_19_9_0, 30)

        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_7_0), math.floor(slot_19_8_0), math.floor(slot_19_7_0 + slot_19_9_0), math.floor(slot_19_8_0 + 30)), slot_0_18_0.is_dragging and draw.color(45, 50, 70, 255) or slot_19_10_0 and draw.color(35, 40, 55, 255) or draw.color(25, 28, 40, 255), 12)
        slot_0_16_0(slot_19_0_0, slot_0_1_0.bold, slot_19_7_0, slot_19_8_0, slot_19_9_0, 30, "THREE CARD POKER", slot_0_12_0(slot_0_2_0.white))

        slot_19_11_0 = slot_19_4_0 + 5
        slot_19_12_0 = slot_0_17_0.chip_pulse

        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0), math.floor(slot_19_11_0), math.floor(slot_19_3_0 + 100), math.floor(slot_19_11_0 + 25)), draw.color(40, 45, 60, 200), 5)
        slot_0_16_0(slot_19_0_0, slot_0_1_0.bold, slot_19_3_0, slot_19_11_0, 100, 25, tostring(slot_0_17_0.chips), draw.color(math.floor(slot_0_13_0(255, 100, slot_19_12_0)), 255, math.floor(slot_0_13_0(255, 100, slot_19_12_0)), 255))
        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0 + 140), math.floor(slot_19_11_0), math.floor(slot_19_3_0 + 240), math.floor(slot_19_11_0 + 25)), draw.color(40, 45, 60, 200), 5)
        slot_0_16_0(slot_19_0_0, slot_0_1_0.bold, slot_19_3_0 + 140, slot_19_11_0, 100, 25, "ANTE: " .. slot_0_17_0.ante_bet, slot_0_12_0(slot_0_2_0.orange))
        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0 + 280), math.floor(slot_19_11_0), math.floor(slot_19_3_0 + 380), math.floor(slot_19_11_0 + 25)), draw.color(40, 45, 60, 200), 5)
        slot_0_16_0(slot_19_0_0, slot_0_1_0.bold, slot_19_3_0 + 280, slot_19_11_0, 100, 25, "PP: " .. slot_0_17_0.pair_plus_bet, slot_0_12_0(slot_0_2_0.blue))

        slot_19_13_0 = slot_19_4_0 + 45

        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0), math.floor(slot_19_13_0), math.floor(slot_19_3_0 + 80), math.floor(slot_19_13_0 + 22)), draw.color(40, 35, 55, 200), 4)
        slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_3_0, slot_19_13_0, 80, 22, "DEALER", draw.color(180, 150, 255, 255))

        if not slot_0_17_0.player_decision and #slot_0_17_0.dealer_hand > 0 then
                slot_19_14_1, slot_19_15_2 = slot_0_23_0(slot_0_17_0.dealer_hand)
                slot_19_16_2 = slot_0_25_0(slot_0_17_0.dealer_hand)

                slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0 + 85), math.floor(slot_19_13_0), math.floor(slot_19_3_0 + 240), math.floor(slot_19_13_0 + 22)), draw.color(50, 50, 60, 200), 4)
                slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_3_0 + 85, slot_19_13_0, 155, 22, slot_0_26_0(slot_19_14_1, slot_19_15_2) .. (slot_19_16_2 and "" or " (DNQ)"), slot_0_12_0(slot_0_2_0.white))
        end

        for iter_19_1, iter_19_2 in ipairs(slot_0_17_0.dealer_hand) do
                slot_0_33_0(slot_19_0_0, slot_19_3_0 + (iter_19_1 - 1) * 65, slot_19_13_0 + 32, iter_19_2, slot_0_17_0.player_decision, slot_19_7_0, slot_19_8_0)
        end

        slot_19_14_0 = slot_19_4_0 + 170

        slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0), math.floor(slot_19_14_0), math.floor(slot_19_3_0 + 80), math.floor(slot_19_14_0 + 22)), slot_0_17_0.player_decision and draw.color(35, 65, 45, 200) or draw.color(35, 38, 45, 150), 4)
        slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_3_0, slot_19_14_0, 80, 22, "PLAYER", slot_0_12_0(slot_0_2_0.green))

        if #slot_0_17_0.player_hand > 0 then
                slot_19_15_1, slot_19_16_1 = slot_0_23_0(slot_0_17_0.player_hand)

                slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0 + 85), math.floor(slot_19_14_0), math.floor(slot_19_3_0 + 220), math.floor(slot_19_14_0 + 22)), draw.color(50, 60, 50, 200), 4)
                slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_3_0 + 85, slot_19_14_0, 135, 22, slot_0_26_0(slot_19_15_1, slot_19_16_1), slot_0_12_0(slot_0_2_0.white))
        end

        for iter_19_3, iter_19_4 in ipairs(slot_0_17_0.player_hand) do
                slot_0_33_0(slot_19_0_0, slot_19_3_0 + (iter_19_3 - 1) * 65, slot_19_14_0 + 32, iter_19_4, false, slot_19_7_0, slot_19_8_0)
        end

        if slot_0_17_0.banner_anim > 0.01 and slot_0_17_0.game_result then
                slot_19_15_0 = slot_19_8_0 + 345 + (1 - slot_0_17_0.banner_anim) * 5
                slot_19_16_0 = math.floor(slot_0_17_0.banner_anim * 250)
                slot_19_17_0 = slot_0_35_0[slot_0_17_0.game_result]

                slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_3_0), math.floor(slot_19_15_0), math.floor(slot_19_3_0 + 380), math.floor(slot_19_15_0 + 35)), slot_0_12_0(slot_19_17_0, slot_19_16_0), 8)
                slot_0_16_0(slot_19_0_0, slot_0_1_0.bold, slot_19_3_0, slot_19_15_0, 380, 35, slot_0_17_0.game_result:upper(), draw.color(255, 255, 255, math.floor(slot_0_17_0.banner_anim * 255)))
        end

        for iter_19_5, iter_19_6 in pairs(slot_0_29_0) do
                slot_19_20_0 = slot_19_3_0 + iter_19_6.x - 20
                slot_19_21_0 = slot_19_8_0 + iter_19_6.y
                slot_19_22_0 = slot_0_31_0[iter_19_5]
                slot_19_23_0 = slot_0_30_0[iter_19_5]
                slot_0_31_0[iter_19_5], slot_0_30_0[iter_19_5] = slot_0_13_0(slot_19_22_0, 0, 0.2), slot_0_13_0(slot_19_23_0, slot_0_15_0(slot_0_18_0.cur_x, slot_0_18_0.cur_y, slot_19_20_0, slot_19_21_0, iter_19_6.w, iter_19_6.h) and 1 or 0, 0.2)
                slot_19_24_0 = iter_19_5 == "deal" and slot_0_17_0.game_active or (iter_19_5 == "play" or iter_19_5 == "fold") and not slot_0_17_0.player_decision or iter_19_5 ~= "reset" and iter_19_5 ~= "play" and iter_19_5 ~= "fold" and iter_19_5 ~= "deal" and slot_0_17_0.game_active
                slot_19_25_0 = 1 - slot_19_22_0 * 0.05
                slot_19_26_0 = iter_19_6.w * slot_19_25_0
                slot_19_27_0 = iter_19_6.h * slot_19_25_0
                slot_19_28_0 = slot_19_20_0 + (iter_19_6.w - slot_19_26_0) / 2
                slot_19_29_0 = slot_19_21_0 + (iter_19_6.h - slot_19_27_0) / 2
                slot_19_30_0 = slot_0_13_0(40, 60, slot_0_30_0[iter_19_5])
                slot_19_31_0 = slot_0_13_0(45, 70, slot_0_30_0[iter_19_5])
                slot_19_32_0 = slot_0_13_0(60, 110, slot_0_30_0[iter_19_5])

                if (iter_19_5 == "deal" or iter_19_5 == "play") and not slot_19_24_0 then
                        slot_19_30_0, slot_19_31_0, slot_19_32_0 = slot_0_13_0(30, 45, slot_0_30_0[iter_19_5]), slot_0_13_0(70, 100, slot_0_30_0[iter_19_5]), slot_0_13_0(45, 65, slot_0_30_0[iter_19_5])
                elseif (iter_19_5 == "fold" or iter_19_5 == "reset") and not slot_19_24_0 then
                        slot_19_30_0, slot_19_31_0, slot_19_32_0 = slot_0_13_0(70, 100, slot_0_30_0[iter_19_5]), slot_0_13_0(35, 45, slot_0_30_0[iter_19_5]), slot_0_13_0(35, 45, slot_0_30_0[iter_19_5])
                end

                slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_28_0), math.floor(slot_19_29_0), math.floor(slot_19_28_0 + slot_19_26_0), math.floor(slot_19_29_0 + slot_19_27_0)), slot_19_24_0 and draw.color(25, 26, 30, 255) or draw.color(math.floor(slot_19_30_0 * (1 - slot_19_22_0 * 0.3)), math.floor(slot_19_31_0 * (1 - slot_19_22_0 * 0.3)), math.floor(slot_19_32_0 * (1 - slot_19_22_0 * 0.3)), 255), 6)
                slot_19_0_0:add_rect(draw.rect(math.floor(slot_19_28_0), math.floor(slot_19_29_0), math.floor(slot_19_28_0 + slot_19_26_0), math.floor(slot_19_29_0 + slot_19_27_0)), slot_19_24_0 and draw.color(40, 40, 40, 255) or draw.color(80, 90, 130, 255), 6, 1)
                slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_28_0, slot_19_29_0, slot_19_26_0, slot_19_27_0, iter_19_6.l, slot_19_24_0 and draw.color(70, 75, 85, 255) or draw.color(240, 245, 255, 255))
        end

        slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_3_0 + 125, slot_19_8_0 + 495, 130, 35, "UNIT: " .. slot_0_17_0.bet_units[slot_0_17_0.bet_unit_index], slot_0_12_0(slot_0_2_0.white))
        slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_7_0, slot_19_8_0 + 570, slot_19_9_0, 20, slot_0_17_0.message, draw.color(150, 150, 170, 255))

        if slot_0_17_0.lost_game then
                slot_19_0_0:add_rect_filled(draw.rect(math.floor(slot_19_7_0), math.floor(slot_19_8_0), math.floor(slot_19_7_0 + slot_19_9_0), math.floor(slot_19_8_0 + 600)), draw.color(0, 0, 0, 200), 12)
                slot_0_16_0(slot_19_0_0, slot_0_1_0.bold, slot_19_7_0, slot_19_8_0 + 200, slot_19_9_0, 50, "GAME OVER", slot_0_12_0(slot_0_2_0.white))
                slot_0_16_0(slot_19_0_0, slot_0_1_0.main, slot_19_7_0, slot_19_8_0 + 250, slot_19_9_0, 50, "You're broke! Press RESET.", slot_0_12_0(slot_0_2_0.white))
        end

        for iter_19_7, iter_19_8 in ipairs(slot_0_17_0.particles) do
                slot_19_0_0:add_rect_filled(draw.rect(math.floor(iter_19_8.x), math.floor(iter_19_8.y), math.floor(iter_19_8.x + iter_19_8.size), math.floor(iter_19_8.y + iter_19_8.size)), draw.color(iter_19_8.color.r, iter_19_8.color.g, iter_19_8.color.b, math.floor(iter_19_8.life * 255)), 1)
        end
end)
events.input:add(function(arg_20_0, arg_20_1, arg_20_2)
        local var_20_0 = bit.band(arg_20_2, 65535)
        local var_20_1 = bit.rshift(arg_20_2, 16)

        if arg_20_0 >= 512 and arg_20_0 <= 514 then
                slot_0_18_0.cur_x, slot_0_18_0.cur_y = var_20_0, var_20_1
        end

        if arg_20_0 == 512 then
                if slot_0_18_0.is_dragging then
                        slot_0_18_0.panel_x, slot_0_18_0.panel_y = var_20_0 - slot_0_18_0.off_x, var_20_1 - slot_0_18_0.off_y
                end
        elseif arg_20_0 == 513 then
                local var_20_2 = false

                for iter_20_0, iter_20_1 in pairs(slot_0_29_0) do
                        local var_20_3 = slot_0_18_0.panel_x + iter_20_1.x
                        local var_20_4 = slot_0_18_0.panel_y + iter_20_1.y

                        if slot_0_15_0(var_20_0, var_20_1, var_20_3, var_20_4, iter_20_1.w, iter_20_1.h) then
                                slot_0_31_0[iter_20_0], var_20_2 = 1, true

                                slot_0_28_0(iter_20_0)

                                break
                        end
                end

                if not var_20_2 and slot_0_15_0(var_20_0, var_20_1, slot_0_18_0.panel_x, slot_0_18_0.panel_y, 420, 30) then
                        slot_0_18_0.is_dragging, slot_0_18_0.off_x, slot_0_18_0.off_y = true, var_20_0 - slot_0_18_0.panel_x, var_20_1 - slot_0_18_0.panel_y
                end
        elseif arg_20_0 == 514 then
                slot_0_18_0.is_dragging = false
        end
end)
