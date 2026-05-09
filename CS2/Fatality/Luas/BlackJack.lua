--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = draw
slot_0_1_0 = game
slot_0_2_0 = gui
slot_0_3_0 = events
slot_0_4_0 = ffi
slot_0_5_0 = utils
slot_0_6_0 = bit

if not slot_0_4_0 then
        print("enable ffi")

        return
end

slot_0_4_0.cdef("typedef struct { int64_t q; } LI; int QueryPerformanceCounter(LI*); int QueryPerformanceFrequency(LI*);")

slot_0_7_0 = slot_0_5_0.find_export("kernel32.dll", "QueryPerformanceCounter")
slot_0_8_0 = slot_0_5_0.find_export("kernel32.dll", "QueryPerformanceFrequency")

if slot_0_7_0 == 0 or slot_0_8_0 == 0 then
        error("export failed")
end

slot_0_9_0 = slot_0_4_0.cast("int(__stdcall*)(LI*)", slot_0_7_0)
slot_0_10_0 = slot_0_4_0.cast("int(__stdcall*)(LI*)", slot_0_8_0)
slot_0_11_0 = slot_0_4_0.new("LI")
slot_0_12_0 = slot_0_4_0.new("LI")

if slot_0_10_0(slot_0_11_0) == 0 or tonumber(slot_0_11_0.q) == 0 then
        error("qpf failed.")
end

function slot_0_13_0()
        return slot_0_9_0(slot_0_12_0) ~= 0 and tonumber(slot_0_12_0.q) / tonumber(slot_0_11_0.q) or 0
end

math.randomseed(math.floor(slot_0_13_0() * 100) % 2147483647)

function slot_0_14_0()
        return math.random()
end

function slot_0_15_0(arg_3_0, arg_3_1, arg_3_2)
        return math.max(arg_3_1, math.min(arg_3_2, arg_3_0))
end

function slot_0_16_0(arg_4_0, arg_4_1, arg_4_2)
        return arg_4_0 + (arg_4_1 - arg_4_0) * arg_4_2
end

function slot_0_17_0(arg_5_0)
        arg_5_0 = slot_0_15_0(arg_5_0, 0, 1)

        return 1 - (1 - arg_5_0)^4
end

function slot_0_18_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
        return arg_6_2 <= arg_6_0 and arg_6_0 <= arg_6_2 + arg_6_4 and arg_6_3 <= arg_6_1 and arg_6_1 <= arg_6_3 + arg_6_5
end

slot_0_19_0 = 512
slot_0_20_0 = 513
slot_0_21_0 = 514

function slot_0_22_0()
        local var_7_0
        local var_7_1

        if slot_0_0_0 and slot_0_0_0.get_screen_size then
                var_7_0, var_7_1 = slot_0_0_0.get_screen_size()
        elseif slot_0_1_0 and slot_0_1_0.engine and slot_0_1_0.engine.get_screen_size then
                var_7_0, var_7_1 = slot_0_1_0.engine:get_screen_size()
        end

        return tonumber(var_7_0) or 1920, tonumber(var_7_1) or 1080
end

slot_0_23_0 = {
        bold = slot_0_0_0 and slot_0_0_0.fonts and slot_0_0_0.fonts.gui_bold,
        main = slot_0_0_0 and slot_0_0_0.fonts and slot_0_0_0.fonts.gui_main
}

function slot_0_24_0(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
        if type(arg_8_0) == "table" then
                return slot_0_0_0.color(arg_8_0[1], arg_8_0[2], arg_8_0[3], arg_8_1 or arg_8_0[4] or 255)
        end

        return slot_0_0_0.color(arg_8_0, arg_8_1, arg_8_2, arg_8_3 or 255)
end

slot_0_25_0 = {
        white = {
                255,
                255,
                255
        },
        soft = {
                235,
                240,
                255
        },
        dim = {
                155,
                160,
                175
        },
        bg = {
                12,
                14,
                18,
                245
        },
        edge = {
                70,
                85,
                125,
                120
        },
        shadow = {
                0,
                0,
                0,
                90
        },
        h_a = {
                26,
                32,
                44
        },
        h_b = {
                18,
                22,
                32
        },
        h_line = {
                90,
                140,
                255,
                170
        },
        f_a = {
                10,
                68,
                44,
                235
        },
        f_b = {
                8,
                52,
                36,
                235
        },
        f_edge = {
                40,
                120,
                90,
                85
        },
        gold = {
                255,
                215,
                0
        },
        green = {
                85,
                255,
                140
        },
        red = {
                255,
                95,
                95
        },
        blue = {
                95,
                170,
                255
        },
        c_bg = {
                250,
                250,
                255
        },
        c_edge = {
                180,
                180,
                195
        },
        s_red = {
                255,
                70,
                85
        },
        s_black = {
                40,
                42,
                50
        },
        b_id = {
                30,
                34,
                44
        },
        b_hv = {
                46,
                54,
                74
        },
        b_ds = {
                22,
                24,
                30
        },
        b_eg = {
                95,
                110,
                150,
                170
        }
}

function slot_0_26_0(arg_9_0, arg_9_1)
        return slot_0_24_0(arg_9_0, slot_0_15_0(math.floor(arg_9_1 * (arg_9_0[4] or 255)), 0, 255))
end

slot_0_27_0 = type(slot_0_0_0) == "table" and type(slot_0_0_0.rounding) == "table" and slot_0_0_0.rounding.all or 0
slot_0_28_0 = type(slot_0_0_0) == "table" and type(slot_0_0_0.outline_mode) == "table" and slot_0_0_0.outline_mode.inset or 0

function slot_0_29_0(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
        return slot_0_0_0.rect(math.floor(arg_10_0), math.floor(arg_10_1), math.floor(arg_10_0 + arg_10_2), math.floor(arg_10_1 + arg_10_3))
end

function slot_0_30_0(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6, arg_11_7)
        if not arg_11_5 then
                return
        end

        if type(arg_11_5) == "table" and (type(arg_11_5[1]) == "table" or type(arg_11_5[1]) == "userdata") then
                local var_11_0 = {}

                for iter_11_0, iter_11_1 in ipairs(arg_11_5) do
                        var_11_0[iter_11_0] = type(iter_11_1) == "table" and slot_0_24_0(iter_11_1) or iter_11_1
                end

                if arg_11_0.add_rect_filled_rounded_multicolor then
                        arg_11_0:add_rect_filled_rounded_multicolor(slot_0_29_0(arg_11_1, arg_11_2, arg_11_3, arg_11_4), var_11_0, arg_11_6 or 0, slot_0_27_0)
                else
                        arg_11_0:add_rect_filled_multicolor(slot_0_29_0(arg_11_1, arg_11_2, arg_11_3, arg_11_4), var_11_0)
                end
        else
                local var_11_1 = type(arg_11_5) == "table" and slot_0_24_0(arg_11_5) or arg_11_5

                arg_11_0:add_rect_filled_rounded(slot_0_29_0(arg_11_1, arg_11_2, arg_11_3, arg_11_4), var_11_1, arg_11_6 or 0, slot_0_27_0)
        end

        if arg_11_7 then
                local var_11_2 = type(arg_11_7.c) == "table" and slot_0_24_0(arg_11_7.c) or arg_11_7.c

                arg_11_0:add_rect_rounded(slot_0_29_0(arg_11_1, arg_11_2, arg_11_3, arg_11_4), var_11_2, arg_11_6 or 0, slot_0_27_0, arg_11_7.w or 1, slot_0_28_0)
        end
end

function slot_0_31_0(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6, arg_12_7)
        if not arg_12_0 or not arg_12_1 or not arg_12_6 or arg_12_6 == "" then
                return
        end

        arg_12_0.font = arg_12_1

        local var_12_0 = arg_12_1:get_text_size(tostring(arg_12_6), true)
        local var_12_1 = type(arg_12_7) == "table" and slot_0_24_0(arg_12_7) or arg_12_7

        arg_12_0:add_text(slot_0_0_0.vec2(math.floor(arg_12_2 + (arg_12_4 - var_12_0.x) * 0.5), math.floor(arg_12_3 + (arg_12_5 - var_12_0.y) * 0.5)), tostring(arg_12_6), var_12_1)
end

function slot_0_32_0(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5)
        for iter_13_0, iter_13_1 in ipairs({
                2,
                4,
                6
        }) do
                local var_13_0 = math.floor((arg_13_5 or 0.25) * 255 * (iter_13_0 == 1 and 0.22 or iter_13_0 == 2 and 0.14 or 0.08))

                slot_0_30_0(arg_13_0, arg_13_1 - iter_13_1, arg_13_2 - iter_13_1, arg_13_3 + iter_13_1 * 2, arg_13_4 + iter_13_1 * 2, {
                        0,
                        0,
                        0,
                        var_13_0
                }, 18 + iter_13_1)
        end
end

slot_0_33_0 = {
        decks = 6,
        surr = true,
        ins = true,
        h17 = false,
        pen = 0.25,
        s_aces_1 = true,
        bj = 1.5,
        das = true,
        max_h = 4,
        split_10 = false,
        r_aces = false
}
slot_0_34_0 = {
        btn_h = 36,
        highlight_pad = 12,
        inner_pad = 16,
        header_h = 44,
        hand_gap = 24,
        stat_h = 30,
        card_w = 56,
        card_h = 80,
        card_step = 62,
        min_step = 16,
        hand_h = 108,
        msg_h = 22
}
slot_0_35_0 = {
        particle_bounds = 100,
        max_particles = 500,
        max_dealer_cards = 12
}
slot_0_36_0 = {
        label_fade_duration = 0.5,
        label_fade_delay = 0.1,
        card_deal_duration = 0.32
}

function slot_0_37_0(arg_14_0)
        if arg_14_0 then
                return slot_0_23_0.bold or slot_0_23_0.main
        end

        return slot_0_23_0.main or slot_0_23_0.bold
end

slot_0_38_0 = {
        my = 0,
        sy = 0,
        sx = 0,
        ins_dec = false,
        ins_off = false,
        peek = false,
        active_idx = 1,
        shuffle_pending = false,
        banner = 0,
        last_t = 0,
        drag = false,
        dy = 0,
        dx = 0,
        unit_idx = 2,
        chips = 100,
        pw = 520,
        px = 70,
        py = 90,
        ph = 600,
        mx = 0,
        bet = 10,
        t = 0,
        lost = false,
        msg = "Press DEAL!",
        ins_bet = 0,
        shake = 0,
        p_turn = true,
        res_t = 0,
        active = false,
        units = {
                10,
                20,
                50,
                100,
                500,
                1000
        },
        shoe = {},
        p_hands = {},
        d_hand = {},
        pts = {},
        b_anim = {},
        b_clk = {}
}
slot_0_39_0 = {
        btns = {},
        stats = {},
        d = {},
        hands = {},
        inr = {},
        pnl = {},
        msg = {}
}
slot_0_40_0 = nil

function slot_0_41_0(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
        local var_15_0 = slot_0_35_0.max_particles - #slot_0_38_0.pts

        if var_15_0 <= 0 then
                return
        end

        arg_15_2 = math.min(arg_15_2, var_15_0)

        for iter_15_0 = 1, arg_15_2 do
                local var_15_1 = arg_15_3 == "multi" and ({
                        {
                                255,
                                70,
                                85
                        },
                        {
                                80,
                                255,
                                120
                        },
                        {
                                85,
                                160,
                                255
                        },
                        {
                                255,
                                215,
                                0
                        },
                        {
                                255,
                                90,
                                255
                        },
                        {
                                90,
                                255,
                                255
                        }
                })[math.floor(slot_0_14_0() * 6) + 1] or arg_15_3 or {
                        255,
                        215,
                        0
                }

                table.insert(slot_0_38_0.pts, {
                        life = 1,
                        x = arg_15_0,
                        y = arg_15_1,
                        vx = (slot_0_14_0() - 0.5) * (arg_15_4 == "smoke" and 4 or 12),
                        vy = (slot_0_14_0() - 1.2) * (arg_15_4 == "smoke" and 6 or 16),
                        life_dec = (arg_15_4 == "smoke" and 0.03 or 0.018) + slot_0_14_0() * 0.01,
                        size = (arg_15_4 == "smoke" and 6 or 2) + math.floor(slot_0_14_0() * 3) + 1,
                        grav = arg_15_4 == "smoke" and -0.08 or 0.45,
                        fric = arg_15_4 == "smoke" and 0.95 or 0.98,
                        color = {
                                r = var_15_1[1],
                                g = var_15_1[2],
                                b = var_15_1[3]
                        }
                })
        end
end

function slot_0_42_0(arg_16_0)
        return arg_16_0 == "10" or arg_16_0 == "J" or arg_16_0 == "Q" or arg_16_0 == "K"
end

function slot_0_43_0(arg_17_0)
        if not arg_17_0 then
                return 0
        end

        local var_17_0 = 0
        local var_17_1 = 0

        for iter_17_0 = 1, #arg_17_0 do
                local var_17_2 = arg_17_0[iter_17_0]

                if var_17_2 then
                        local var_17_3 = var_17_2.rank

                        var_17_0 = var_17_0 + (tonumber(var_17_3) or var_17_3 == "A" and 11 or 10)

                        if var_17_3 == "A" then
                                var_17_1 = var_17_1 + 1
                        end
                end
        end

        while var_17_0 > 21 and var_17_1 > 0 do
                var_17_0 = var_17_0 - 10
                var_17_1 = var_17_1 - 1
        end

        return var_17_0
end

function slot_0_44_0(arg_18_0)
        if not arg_18_0 then
                return 0, false
        end

        local var_18_0 = slot_0_43_0(arg_18_0)
        local var_18_1 = 0
        local var_18_2 = 0

        for iter_18_0 = 1, #arg_18_0 do
                local var_18_3 = arg_18_0[iter_18_0]

                if var_18_3 then
                        local var_18_4 = var_18_3.rank

                        var_18_1 = var_18_1 + (var_18_4 == "A" and 1 or tonumber(var_18_4) or 10)

                        if var_18_4 == "A" then
                                var_18_2 = var_18_2 + 1
                        end
                end
        end

        local var_18_5 = var_18_0 == 17 and var_18_2 > 0 and var_18_1 == 7

        return var_18_0, var_18_5
end

function slot_0_45_0()
        slot_0_38_0.shoe = {}

        for iter_19_0 = 1, slot_0_33_0.decks do
                for iter_19_1, iter_19_2 in ipairs({
                        "S",
                        "H",
                        "D",
                        "C"
                }) do
                        for iter_19_3, iter_19_4 in ipairs({
                                "A",
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
                                "K"
                        }) do
                                table.insert(slot_0_38_0.shoe, {
                                        suit = iter_19_2,
                                        rank = iter_19_4
                                })
                        end
                end
        end

        for iter_19_5 = #slot_0_38_0.shoe, 2, -1 do
                local var_19_0 = math.random(iter_19_5)

                slot_0_38_0.shoe[iter_19_5], slot_0_38_0.shoe[var_19_0] = slot_0_38_0.shoe[var_19_0], slot_0_38_0.shoe[iter_19_5]
        end

        assert(#slot_0_38_0.shoe > 0, "Blackjack: shoe_build failed (check RULES.decks)")
end

slot_0_45_0()

function slot_0_46_0(arg_20_0)
        if #slot_0_38_0.shoe < slot_0_33_0.decks * 52 * slot_0_33_0.pen then
                slot_0_38_0.shuffle_pending = true
        end

        local var_20_0 = table.remove(slot_0_38_0.shoe)

        if not var_20_0 then
                slot_0_45_0()

                var_20_0 = table.remove(slot_0_38_0.shoe)

                if not var_20_0 then
                        return nil
                end
        end

        var_20_0.deal_t = slot_0_38_0.t + (arg_20_0 or 0)

        return var_20_0
end

function slot_0_47_0(arg_21_0)
        slot_21_1_0 = slot_0_38_0.sx
        slot_21_2_0 = slot_0_38_0.sy
        slot_0_38_0.sx, slot_0_38_0.sy = 0, 0

        slot_0_40_0(0)

        slot_0_38_0.sx, slot_0_38_0.sy = slot_21_1_0, slot_21_2_0

        if #slot_0_38_0.p_hands == 0 then
                slot_0_38_0.active = false

                return
        end

        slot_0_38_0.res_t, slot_0_38_0.active, slot_0_38_0.p_turn, slot_0_38_0.shake = slot_0_38_0.t + (arg_21_0 or 0), false, true, 0.25
        slot_21_3_0 = slot_0_43_0(slot_0_38_0.d_hand)
        slot_21_4_0 = #slot_0_38_0.d_hand == 2 and slot_21_3_0 == 21
        slot_21_5_0 = 0
        slot_21_6_0 = 0
        slot_21_7_0 = {}
        slot_21_8_0 = false

        if slot_0_38_0.ins_bet > 0 then
                slot_21_9_1 = slot_21_4_0
                slot_21_6_0 = slot_21_6_0 + (slot_21_9_1 and slot_0_38_0.ins_bet * 3 or 0)

                table.insert(slot_21_7_0, "INS:" .. (slot_21_9_1 and "WIN" or "LOSE"))
        end

        for iter_21_0, iter_21_1 in ipairs(slot_0_38_0.p_hands) do
                if iter_21_1 and iter_21_1.cards then
                        slot_21_5_0 = slot_21_5_0 + iter_21_1.bet
                        slot_21_14_0 = slot_0_43_0(iter_21_1.cards)
                        slot_21_15_0 = #iter_21_1.cards == 2 and slot_21_14_0 == 21 and iter_21_0 == 1 and not iter_21_1.split
                        slot_21_16_0 = "LOSE"
                        slot_21_17_0 = 0

                        if iter_21_1.surr then
                                slot_21_16_0, slot_21_17_0 = "SURR", math.floor(iter_21_1.bet * 0.5)
                        elseif slot_21_14_0 > 21 then
                                slot_21_16_0, slot_21_17_0 = "BUST", 0
                        elseif slot_21_4_0 then
                                if slot_21_15_0 then
                                        slot_21_16_0, slot_21_17_0 = "PUSH", iter_21_1.bet
                                else
                                        slot_21_16_0, slot_21_17_0 = "LOSE", 0
                                end
                        elseif slot_21_15_0 then
                                slot_21_16_0, slot_21_17_0 = "BJ", math.floor(iter_21_1.bet * (1 + slot_0_33_0.bj) + 0.5)
                                slot_21_8_0 = true
                        elseif slot_21_3_0 > 21 or slot_21_3_0 < slot_21_14_0 then
                                slot_21_16_0, slot_21_17_0 = "WIN", iter_21_1.bet * 2
                        elseif slot_21_14_0 == slot_21_3_0 then
                                slot_21_16_0, slot_21_17_0 = "PUSH", iter_21_1.bet
                        end

                        slot_21_6_0 = slot_21_6_0 + slot_21_17_0

                        table.insert(slot_21_7_0, "HAND" .. iter_21_0 .. ":" .. slot_21_16_0)

                        slot_21_18_0 = slot_0_39_0.hands and slot_0_39_0.hands[iter_21_0] and slot_0_39_0.hands[iter_21_0].y or slot_0_39_0.inr.y + slot_0_34_0.stat_h + slot_0_34_0.hand_gap + slot_0_34_0.hand_h + slot_0_34_0.hand_gap + (iter_21_0 - 1) * (slot_0_34_0.hand_h + slot_0_34_0.hand_gap)
                        slot_21_19_0 = slot_0_38_0.px + slot_0_38_0.pw * 0.5 + (slot_0_14_0() - 0.5) * 40
                        slot_21_20_0 = slot_21_18_0 + 38

                        if slot_21_16_0 == "WIN" or slot_21_16_0 == "BJ" then
                                slot_0_41_0(slot_21_19_0, slot_21_20_0, slot_21_16_0 == "BJ" and 28 or 16, "multi", "spark")
                        elseif slot_21_16_0 == "BUST" or slot_21_16_0 == "LOSE" then
                                slot_0_41_0(slot_21_19_0, slot_21_20_0, 10, {
                                        150,
                                        45,
                                        45
                                }, "smoke")
                        end
                end
        end

        slot_0_38_0.chips = math.floor(slot_0_38_0.chips + slot_21_6_0 + 0.5)

        while slot_0_38_0.unit_idx > 1 and slot_0_38_0.units[slot_0_38_0.unit_idx] > slot_0_38_0.chips do
                slot_0_38_0.unit_idx = slot_0_38_0.unit_idx - 1
        end

        slot_0_38_0.bet = math.floor(slot_0_38_0.bet + 0.5)
        slot_21_9_0 = slot_21_5_0 + (slot_0_38_0.ins_bet or 0)
        slot_21_10_0 = slot_21_6_0 - slot_21_9_0

        function slot_21_11_0(arg_22_0)
                if arg_22_0 == math.floor(arg_22_0) then
                        return tostring(arg_22_0)
                end

                return string.format("%.1f", arg_22_0)
        end

        slot_21_12_0 = #slot_0_38_0.p_hands == 1 and slot_0_38_0.p_hands[1].surr
        slot_0_38_0.res = slot_21_12_0 and "surr" or slot_21_10_0 > 0 and (slot_21_8_0 and "bj" or "win") or slot_21_10_0 == 0 and slot_21_9_0 > 0 and "push" or "lose"
        slot_0_38_0.msg = table.concat(slot_21_7_0, " | ") .. " (" .. (slot_21_10_0 >= 0 and "+" or "") .. slot_21_11_0(slot_21_10_0) .. ")"

        if not slot_0_38_0.active and not slot_0_38_0.lost then
                slot_0_38_0.bet = math.min(slot_0_38_0.bet, slot_0_38_0.chips)
        end

        if slot_0_38_0.chips <= 0 then
                slot_0_38_0.lost, slot_0_38_0.msg = true, "GAME OVER! BROKE!"
        end

        if slot_0_38_0.shuffle_pending then
                slot_0_45_0()

                slot_0_38_0.shuffle_pending = false
        end
end

function slot_0_48_0()
        local var_23_0 = slot_0_38_0.p_hands[1]
        local var_23_1 = #slot_0_38_0.p_hands == 1 and var_23_0 and not var_23_0.split and #var_23_0.cards == 2 and slot_0_43_0(var_23_0.cards) == 21

        if not slot_0_38_0.peek then
                if var_23_1 then
                        slot_0_47_0()

                        return true
                end

                return false
        end

        if slot_0_38_0.ins_off and not slot_0_38_0.ins_dec then
                return false
        end

        slot_0_38_0.peek = false

        if #slot_0_38_0.d_hand == 2 and slot_0_43_0(slot_0_38_0.d_hand) == 21 then
                slot_0_47_0()

                return true
        end

        if var_23_1 then
                slot_0_47_0()

                return true
        end

        return false
end

function slot_0_49_0()
        slot_0_38_0.p_turn = false

        local var_24_0 = false

        for iter_24_0, iter_24_1 in ipairs(slot_0_38_0.p_hands) do
                if not iter_24_1.surr and slot_0_43_0(iter_24_1.cards) <= 21 then
                        var_24_0 = true

                        break
                end
        end

        if not var_24_0 then
                slot_0_47_0(0.2)

                return
        end

        local var_24_1 = 0.1
        local var_24_2 = 0

        while var_24_2 < slot_0_35_0.max_dealer_cards do
                var_24_2 = var_24_2 + 1

                local var_24_3, var_24_4 = slot_0_44_0(slot_0_38_0.d_hand)

                if var_24_3 < 17 or var_24_3 == 17 and slot_0_33_0.h17 and var_24_4 then
                        var_24_1 = var_24_1 + 0.28

                        local var_24_5 = slot_0_46_0(var_24_1)

                        if not var_24_5 then
                                break
                        end

                        table.insert(slot_0_38_0.d_hand, var_24_5)
                else
                        break
                end
        end

        slot_0_47_0(var_24_1 + 0.1)
end

function slot_0_50_0()
        while slot_0_38_0.active_idx <= #slot_0_38_0.p_hands do
                local var_25_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                if var_25_0 and not var_25_0.done then
                        if slot_0_43_0(var_25_0.cards) >= 21 then
                                var_25_0.done, slot_0_38_0.active_idx = true, slot_0_38_0.active_idx + 1
                        else
                                return
                        end
                else
                        slot_0_38_0.active_idx = slot_0_38_0.active_idx + 1
                end
        end

        slot_0_49_0()
end

slot_0_51_0 = {
        hit = {
                label = "HIT",
                enabled = function()
                        local var_26_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                        return slot_0_38_0.active and slot_0_38_0.p_turn and var_26_0 and var_26_0.cards and not var_26_0.done and slot_0_43_0(var_26_0.cards) < 21 and (not var_26_0.s_aces or not slot_0_33_0.s_aces_1) and (not slot_0_38_0.ins_off or slot_0_38_0.ins_dec)
                end,
                action = function()
                        local var_27_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]
                        local var_27_1 = slot_0_46_0(0.08)

                        if not var_27_1 then
                                return
                        end

                        table.insert(var_27_0.cards, var_27_1)

                        if slot_0_43_0(var_27_0.cards) >= 21 then
                                var_27_0.done = true

                                slot_0_50_0()
                        end
                end
        },
        stand = {
                label = "STAND",
                enabled = function()
                        local var_28_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                        return slot_0_38_0.active and slot_0_38_0.p_turn and var_28_0 and var_28_0.cards and not var_28_0.done and (not slot_0_38_0.ins_off or slot_0_38_0.ins_dec)
                end,
                action = function()
                        slot_0_38_0.p_hands[slot_0_38_0.active_idx].done = true

                        slot_0_50_0()
                end
        },
        double = {
                label = "DOUBLE",
                color = slot_0_25_0.gold,
                enabled = function()
                        local var_30_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                        return slot_0_38_0.active and slot_0_38_0.p_turn and var_30_0 and var_30_0.cards and not var_30_0.done and slot_0_43_0(var_30_0.cards) < 21 and #var_30_0.cards == 2 and (not var_30_0.s_aces or not slot_0_33_0.s_aces_1) and (not var_30_0.split or slot_0_33_0.das) and slot_0_38_0.chips >= var_30_0.bet and (not slot_0_38_0.ins_off or slot_0_38_0.ins_dec)
                end,
                action = function()
                        local var_31_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]
                        local var_31_1 = slot_0_46_0(0.1)

                        if not var_31_1 then
                                return
                        end

                        slot_0_38_0.chips, var_31_0.bet, var_31_0.done = slot_0_38_0.chips - var_31_0.bet, var_31_0.bet * 2, true

                        table.insert(var_31_0.cards, var_31_1)
                        slot_0_50_0()
                end
        },
        split = {
                label = "SPLIT",
                color = slot_0_25_0.blue,
                enabled = function()
                        local var_32_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                        if not var_32_0 or not var_32_0.cards or #var_32_0.cards ~= 2 or var_32_0.done then
                                return false
                        end

                        local var_32_1 = var_32_0.cards[1].rank
                        local var_32_2 = var_32_0.cards[2].rank
                        local var_32_3 = var_32_1 == var_32_2 or slot_0_33_0.split_10 and slot_0_42_0(var_32_1) and slot_0_42_0(var_32_2)

                        return slot_0_38_0.active and slot_0_38_0.p_turn and #slot_0_38_0.p_hands < slot_0_33_0.max_h and var_32_3 and slot_0_38_0.chips >= var_32_0.bet and (not slot_0_38_0.ins_off or slot_0_38_0.ins_dec)
                end,
                action = function()
                        local var_33_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                        if not var_33_0.cards[2] then
                                return
                        end

                        local var_33_1 = slot_0_38_0.shuffle_pending
                        local var_33_2 = table.remove(var_33_0.cards, 2)
                        local var_33_3 = slot_0_46_0(0.12)
                        local var_33_4 = slot_0_46_0(0.18)

                        if not var_33_3 or not var_33_4 then
                                if var_33_4 then
                                        table.insert(slot_0_38_0.shoe, var_33_4)
                                end

                                if var_33_3 then
                                        table.insert(slot_0_38_0.shoe, var_33_3)
                                end

                                table.insert(var_33_0.cards, 2, var_33_2)

                                slot_0_38_0.shuffle_pending = var_33_1

                                slot_0_45_0()

                                return
                        end

                        slot_0_38_0.chips = slot_0_38_0.chips - var_33_0.bet
                        var_33_0.split, var_33_0.s_aces = true, var_33_0.cards[1].rank == "A"
                        var_33_2.deal_t = slot_0_38_0.t + 0.06

                        table.insert(var_33_0.cards, var_33_3)

                        local var_33_5 = {
                                done = false,
                                split = true,
                                cards = {
                                        var_33_2,
                                        var_33_4
                                },
                                bet = var_33_0.bet,
                                s_aces = var_33_0.s_aces
                        }

                        table.insert(slot_0_38_0.p_hands, slot_0_38_0.active_idx + 1, var_33_5)

                        var_33_0.done = slot_0_43_0(var_33_0.cards) >= 21
                        var_33_5.done = slot_0_43_0(var_33_5.cards) >= 21

                        if var_33_0.s_aces and slot_0_33_0.s_aces_1 then
                                local var_33_6 = slot_0_33_0.r_aces and var_33_0.cards[2] and var_33_0.cards[2].rank == "A" and #slot_0_38_0.p_hands < slot_0_33_0.max_h and slot_0_38_0.chips >= var_33_0.bet
                                local var_33_7 = slot_0_33_0.r_aces and var_33_5.cards[2] and var_33_5.cards[2].rank == "A" and #slot_0_38_0.p_hands + (var_33_6 and 1 or 0) < slot_0_33_0.max_h and slot_0_38_0.chips >= var_33_5.bet

                                var_33_0.done = not var_33_6
                                var_33_5.done = not var_33_7
                        end

                        slot_0_50_0()
                end
        },
        insure = {
                label = "INSURE",
                color = slot_0_25_0.gold,
                enabled = function()
                        return slot_0_38_0.active and slot_0_38_0.p_turn and slot_0_38_0.ins_off and not slot_0_38_0.ins_dec and slot_0_38_0.chips >= math.floor(slot_0_38_0.p_hands[1].bet * 0.5)
                end,
                action = function()
                        local var_35_0 = math.floor(slot_0_38_0.p_hands[1].bet * 0.5)

                        slot_0_38_0.chips, slot_0_38_0.ins_bet, slot_0_38_0.ins_dec = slot_0_38_0.chips - var_35_0, var_35_0, true

                        if not slot_0_48_0() then
                                slot_0_38_0.msg = "Insurance taken. Your turn!"
                        end
                end
        },
        noins = {
                label = "NO INS",
                enabled = function()
                        return slot_0_38_0.active and slot_0_38_0.p_turn and slot_0_38_0.ins_off and not slot_0_38_0.ins_dec
                end,
                action = function()
                        slot_0_38_0.ins_dec, slot_0_38_0.msg = true, "No insurance."

                        if not slot_0_48_0() then
                                slot_0_38_0.msg = "Your turn!"
                        end
                end
        },
        surr = {
                label = "SURRENDER",
                enabled = function()
                        local var_38_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                        return slot_0_33_0.surr and slot_0_38_0.active and slot_0_38_0.p_turn and var_38_0 and var_38_0.cards and #var_38_0.cards == 2 and not var_38_0.split and (not slot_0_38_0.ins_off or slot_0_38_0.ins_dec)
                end,
                action = function()
                        local var_39_0 = slot_0_38_0.p_hands[slot_0_38_0.active_idx]

                        var_39_0.surr, var_39_0.done = true, true

                        slot_0_49_0()
                end
        },
        deal = {
                label = "DEAL",
                color = slot_0_25_0.green,
                enabled = function()
                        return not slot_0_38_0.active and not slot_0_38_0.lost and slot_0_38_0.t >= (slot_0_38_0.res_t or 0) and slot_0_38_0.chips >= slot_0_38_0.bet and slot_0_38_0.bet > 0
                end,
                action = function()
                        slot_0_38_0.res, slot_0_38_0.banner, slot_0_38_0.shake, slot_0_38_0.ins_bet, slot_0_38_0.ins_off, slot_0_38_0.ins_dec, slot_0_38_0.peek = nil, 0, 0, 0, false, false, false

                        if slot_0_33_0.max_h * 8 + slot_0_35_0.max_dealer_cards > #slot_0_38_0.shoe then
                                slot_0_45_0()

                                slot_0_38_0.shuffle_pending = false
                        end

                        local var_41_0 = slot_0_38_0.shuffle_pending
                        local var_41_1 = slot_0_46_0(0.05)
                        local var_41_2 = slot_0_46_0(0.25)
                        local var_41_3 = slot_0_46_0(0.15)
                        local var_41_4 = slot_0_46_0(0.35)

                        if not var_41_1 or not var_41_2 or not var_41_3 or not var_41_4 then
                                local function var_41_5(arg_42_0)
                                        if arg_42_0 then
                                                table.insert(slot_0_38_0.shoe, arg_42_0)
                                        end
                                end

                                var_41_5(var_41_4)
                                var_41_5(var_41_3)
                                var_41_5(var_41_2)
                                var_41_5(var_41_1)

                                slot_0_38_0.shuffle_pending = var_41_0

                                slot_0_45_0()

                                slot_0_38_0.msg = "Deal failed: Shoe error"

                                return
                        end

                        slot_0_38_0.p_hands = {
                                {
                                        done = false,
                                        s_aces = false,
                                        split = false,
                                        surr = false,
                                        cards = {
                                                var_41_1,
                                                var_41_2
                                        },
                                        bet = slot_0_38_0.bet
                                }
                        }
                        slot_0_38_0.active_idx, slot_0_38_0.active, slot_0_38_0.p_turn = 1, true, true
                        slot_0_38_0.d_hand, slot_0_38_0.chips = {
                                var_41_3,
                                var_41_4
                        }, slot_0_38_0.chips - slot_0_38_0.bet

                        local var_41_6 = slot_0_38_0.d_hand[1]

                        slot_0_38_0.peek, slot_0_38_0.b_clk = var_41_6.rank == "A" or slot_0_42_0(var_41_6.rank), {}

                        if var_41_6.rank == "A" and slot_0_33_0.ins then
                                slot_0_38_0.ins_off, slot_0_38_0.msg = true, "Insurance?"
                        else
                                slot_0_38_0.ins_dec, slot_0_38_0.msg = true, "Your turn!"

                                slot_0_48_0()
                        end
                end
        },
        bet_up = {
                label = "BET +",
                enabled = function()
                        return not slot_0_38_0.active and not slot_0_38_0.lost and slot_0_38_0.t >= (slot_0_38_0.res_t or 0)
                end,
                action = function()
                        slot_0_38_0.unit_idx = math.min(#slot_0_38_0.units, slot_0_38_0.unit_idx + 1)
                        slot_0_38_0.bet = math.max(slot_0_38_0.units[1], math.min(slot_0_38_0.chips, slot_0_38_0.units[slot_0_38_0.unit_idx] or slot_0_38_0.bet))
                end
        },
        bet_down = {
                label = "BET -",
                enabled = function()
                        return not slot_0_38_0.active and not slot_0_38_0.lost and slot_0_38_0.t >= (slot_0_38_0.res_t or 0)
                end,
                action = function()
                        slot_0_38_0.unit_idx = math.max(1, slot_0_38_0.unit_idx - 1)
                        slot_0_38_0.bet = math.max(slot_0_38_0.units[1], math.min(slot_0_38_0.chips, slot_0_38_0.units[slot_0_38_0.unit_idx] or slot_0_38_0.bet))
                end
        },
        reset = {
                label = "RESET",
                color = slot_0_25_0.red,
                enabled = function()
                        return true
                end,
                action = function()
                        slot_0_38_0.chips, slot_0_38_0.bet, slot_0_38_0.unit_idx = 100, 10, 2
                        slot_0_38_0.p_hands, slot_0_38_0.d_hand, slot_0_38_0.active, slot_0_38_0.p_turn = {}, {}, false, true
                        slot_0_38_0.res, slot_0_38_0.msg, slot_0_38_0.lost = nil, "Press DEAL!", false
                        slot_0_38_0.res_t, slot_0_38_0.banner, slot_0_38_0.shake = 0, 0, 0
                        slot_0_38_0.ins_bet, slot_0_38_0.ins_off, slot_0_38_0.ins_dec, slot_0_38_0.peek = 0, false, false, false
                        slot_0_38_0.drag, slot_0_38_0.shuffle_pending = false, false
                        slot_0_38_0.b_anim, slot_0_38_0.b_clk, slot_0_38_0.pts = {}, {}, {}
                        slot_0_38_0.t, slot_0_38_0.last_t = 0, 0

                        slot_0_45_0()
                end
        }
}

function slot_0_40_0(arg_49_0)
        slot_49_1_0 = 1 - math.exp(-12 * (arg_49_0 or 0.016))
        slot_49_2_0 = #slot_0_38_0.d_hand

        for iter_49_0, iter_49_1 in ipairs(slot_0_38_0.p_hands) do
                slot_49_2_0 = math.max(slot_49_2_0, #iter_49_1.cards)
        end

        slot_49_3_0 = slot_0_15_0(math.max(520, 72 + (math.max(2, slot_49_2_0) - 1) * slot_0_34_0.card_step), 520, slot_0_22_0() - 28)
        slot_49_4_0 = math.max(1, #slot_0_38_0.p_hands)
        slot_49_5_0 = slot_0_34_0.header_h + slot_0_34_0.inner_pad + slot_0_34_0.stat_h + slot_0_34_0.hand_gap + slot_0_34_0.hand_h + slot_0_34_0.hand_gap + (slot_49_4_0 * slot_0_34_0.hand_h + (slot_49_4_0 - 1) * slot_0_34_0.hand_gap) + slot_0_34_0.hand_gap + slot_0_34_0.msg_h + slot_0_34_0.hand_gap + (slot_0_34_0.btn_h * 2 + 10) + slot_0_34_0.inner_pad
        slot_0_38_0.pw, slot_0_38_0.ph = slot_0_16_0(slot_0_38_0.pw, slot_49_3_0, slot_49_1_0), slot_0_16_0(slot_0_38_0.ph, slot_49_5_0, slot_49_1_0)
        slot_49_6_0, slot_49_7_0 = slot_0_22_0()
        slot_0_38_0.px, slot_0_38_0.py = slot_0_15_0(slot_0_38_0.px, 6, slot_49_6_0 - slot_0_38_0.pw - 6), slot_0_15_0(slot_0_38_0.py, 6, slot_49_7_0 - slot_0_38_0.ph - 6)
        slot_49_8_0 = slot_0_38_0.px + (slot_0_38_0.sx or 0)
        slot_49_9_0 = slot_0_38_0.py + (slot_0_38_0.sy or 0)
        slot_0_39_0.pnl = {
                x = slot_49_8_0,
                y = slot_49_9_0,
                w = slot_0_38_0.pw,
                h = slot_0_38_0.ph
        }
        slot_0_39_0.inr = {
                x = slot_49_8_0 + slot_0_34_0.inner_pad,
                y = slot_49_9_0 + slot_0_34_0.header_h + slot_0_34_0.inner_pad,
                w = slot_0_38_0.pw - slot_0_34_0.inner_pad * 2,
                h = slot_0_38_0.ph - slot_0_34_0.header_h - slot_0_34_0.inner_pad * 2
        }
        slot_49_10_0 = (slot_0_39_0.inr.w - 20) / 3
        slot_0_39_0.stats = {
                chips = {
                        h = 30,
                        label = "CHIPS",
                        x = slot_0_39_0.inr.x,
                        y = slot_0_39_0.inr.y,
                        w = slot_49_10_0,
                        value = slot_0_38_0.chips,
                        color = slot_0_25_0.green
                },
                bet = {
                        h = 30,
                        label = "BET",
                        x = slot_0_39_0.inr.x + slot_49_10_0 + 10,
                        y = slot_0_39_0.inr.y,
                        w = slot_49_10_0,
                        value = slot_0_38_0.bet,
                        color = slot_0_25_0.gold
                },
                shoe = {
                        h = 30,
                        label = "SHOE",
                        x = slot_0_39_0.inr.x + (slot_49_10_0 + 10) * 2,
                        y = slot_0_39_0.inr.y,
                        w = slot_49_10_0,
                        value = #slot_0_38_0.shoe,
                        color = slot_0_25_0.blue
                }
        }
        slot_49_11_1 = slot_0_39_0.inr.y + slot_0_34_0.stat_h + slot_0_34_0.hand_gap
        slot_0_39_0.d = {
                x = slot_0_39_0.inr.x,
                y = slot_49_11_1,
                step = slot_0_15_0((slot_0_39_0.inr.w - slot_0_34_0.card_w) / math.max(1, #slot_0_38_0.d_hand - 1), slot_0_34_0.min_step, slot_0_34_0.card_step)
        }
        slot_49_11_0 = slot_49_11_1 + slot_0_34_0.hand_h + slot_0_34_0.hand_gap
        slot_0_39_0.hands = {}

        for iter_49_2 = 1, slot_49_4_0 do
                slot_49_16_1 = slot_0_38_0.p_hands[iter_49_2] or {
                        cards = {}
                }
                slot_0_39_0.hands[iter_49_2] = {
                        x = slot_0_39_0.inr.x,
                        y = slot_49_11_0,
                        step = slot_0_15_0((slot_0_39_0.inr.w - slot_0_34_0.card_w) / math.max(1, #slot_49_16_1.cards - 1), slot_0_34_0.min_step, slot_0_34_0.card_step)
                }
                slot_49_11_0 = slot_49_11_0 + slot_0_34_0.hand_h + (iter_49_2 < slot_49_4_0 and slot_0_34_0.hand_gap or 0)
        end

        slot_49_12_0 = slot_0_39_0.pnl.y + slot_0_39_0.pnl.h - slot_0_34_0.inner_pad - (slot_0_34_0.btn_h * 2 + 10)
        slot_49_13_0 = slot_0_39_0.d.y - slot_0_34_0.highlight_pad
        slot_49_14_0 = slot_0_39_0.hands[slot_49_4_0].y + slot_0_34_0.hand_h + slot_0_34_0.highlight_pad
        slot_0_39_0.felt_h = slot_49_14_0 - slot_49_13_0
        slot_49_15_0 = slot_0_39_0.d.y - 7 + slot_0_39_0.felt_h
        slot_0_39_0.msg = {
                x = slot_0_39_0.inr.x - 4,
                y = slot_49_14_0 + (slot_49_12_0 - slot_49_14_0 - slot_0_34_0.msg_h) * 0.5,
                w = slot_0_39_0.inr.w + 8,
                h = slot_0_34_0.msg_h
        }
        slot_49_16_0 = (slot_0_39_0.inr.w - 30) / 4
        slot_49_17_0 = slot_0_38_0.active and slot_0_38_0.p_turn and slot_0_38_0.ins_off and not slot_0_38_0.ins_dec and {
                "insure",
                "noins",
                "hit",
                "stand"
        } or {
                "hit",
                "stand",
                "double",
                "split"
        }
        slot_49_18_0 = {
                "deal",
                slot_0_38_0.active and slot_0_38_0.p_turn and slot_0_33_0.surr and "surr" or "bet_down",
                "bet_up",
                "reset"
        }
        slot_0_39_0.btns = {}

        for iter_49_3, iter_49_4 in ipairs(slot_49_17_0) do
                slot_0_39_0.btns[iter_49_4] = {
                        h = 36,
                        x = slot_0_39_0.inr.x + (iter_49_3 - 1) * (slot_49_16_0 + 10),
                        y = slot_49_12_0,
                        w = slot_49_16_0
                }
        end

        for iter_49_5, iter_49_6 in ipairs(slot_49_18_0) do
                slot_0_39_0.btns[iter_49_6] = {
                        h = 36,
                        x = slot_0_39_0.inr.x + (iter_49_5 - 1) * (slot_49_16_0 + 10),
                        y = slot_49_12_0 + 46,
                        w = slot_49_16_0
                }
        end
end

function slot_0_52_0(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4, arg_50_5)
        slot_50_6_0 = arg_50_3 * 0.5
        slot_50_7_0 = arg_50_3 < 16 and 24 or 64

        function slot_50_8_0(arg_51_0, arg_51_1, arg_51_2)
                if arg_50_0.add_triangle_filled then
                        arg_50_0:add_triangle_filled(arg_51_0, arg_51_1, arg_51_2, arg_50_5)
                else
                        arg_50_0:add_triangle_filled_multicolor(arg_51_0, arg_51_1, arg_51_2, {
                                arg_50_5,
                                arg_50_5,
                                arg_50_5
                        })
                end
        end

        if arg_50_4 == "D" then
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 - slot_50_6_0), slot_0_0_0.vec2(arg_50_1 + arg_50_3 * 0.375, arg_50_2), slot_0_0_0.vec2(arg_50_1 - arg_50_3 * 0.375, arg_50_2))
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 + arg_50_3 * 0.375, arg_50_2), slot_0_0_0.vec2(arg_50_1 - arg_50_3 * 0.375, arg_50_2))
        elseif arg_50_4 == "H" then
                slot_50_9_2 = arg_50_3 * 0.275
                slot_50_10_1 = arg_50_3 * 0.25

                arg_50_0:add_circle_filled(slot_0_0_0.vec2(arg_50_1 - slot_50_10_1, arg_50_2 - slot_50_9_2 * 0.35), slot_50_9_2, arg_50_5, slot_50_7_0)
                arg_50_0:add_circle_filled(slot_0_0_0.vec2(arg_50_1 + slot_50_10_1, arg_50_2 - slot_50_9_2 * 0.35), slot_50_9_2, arg_50_5, slot_50_7_0)
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 - slot_50_6_0 * 1.15, arg_50_2 - slot_50_9_2 * 0.1), slot_0_0_0.vec2(arg_50_1 + slot_50_6_0 * 1.15, arg_50_2 - slot_50_9_2 * 0.1))
        elseif arg_50_4 == "S" then
                slot_50_9_1 = arg_50_3 * 0.275
                slot_50_10_0 = arg_50_3 * 0.25

                arg_50_0:add_circle_filled(slot_0_0_0.vec2(arg_50_1 - slot_50_10_0, arg_50_2 + slot_50_9_1 * 0.35), slot_50_9_1, arg_50_5, slot_50_7_0)
                arg_50_0:add_circle_filled(slot_0_0_0.vec2(arg_50_1 + slot_50_10_0, arg_50_2 + slot_50_9_1 * 0.35), slot_50_9_1, arg_50_5, slot_50_7_0)
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 - slot_50_6_0), slot_0_0_0.vec2(arg_50_1 - slot_50_6_0 * 1.15, arg_50_2 + slot_50_9_1 * 0.1), slot_0_0_0.vec2(arg_50_1 + slot_50_6_0 * 1.15, arg_50_2 + slot_50_9_1 * 0.1))
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 + slot_50_6_0 * 0.3), slot_0_0_0.vec2(arg_50_1 - arg_50_3 * 0.08, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 + arg_50_3 * 0.08, arg_50_2 + slot_50_6_0))
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 - arg_50_3 * 0.2, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 + arg_50_3 * 0.2, arg_50_2 + slot_50_6_0))
        elseif arg_50_4 == "C" then
                slot_50_9_0 = arg_50_3 * 0.24

                arg_50_0:add_circle_filled(slot_0_0_0.vec2(arg_50_1, arg_50_2 - slot_50_9_0 * 1.2), slot_50_9_0, arg_50_5, slot_50_7_0)
                arg_50_0:add_circle_filled(slot_0_0_0.vec2(arg_50_1 - arg_50_3 * 0.23, arg_50_2 - slot_50_9_0 * 0.2), slot_50_9_0, arg_50_5, slot_50_7_0)
                arg_50_0:add_circle_filled(slot_0_0_0.vec2(arg_50_1 + arg_50_3 * 0.23, arg_50_2 - slot_50_9_0 * 0.2), slot_50_9_0, arg_50_5, slot_50_7_0)
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 - slot_50_9_0 * 0.2), slot_0_0_0.vec2(arg_50_1 - arg_50_3 * 0.08, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 + arg_50_3 * 0.08, arg_50_2 + slot_50_6_0))
                slot_50_8_0(slot_0_0_0.vec2(arg_50_1, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 - arg_50_3 * 0.2, arg_50_2 + slot_50_6_0), slot_0_0_0.vec2(arg_50_1 + arg_50_3 * 0.2, arg_50_2 + slot_50_6_0))
        end
end

function slot_0_53_0(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4)
        local var_52_0 = slot_0_17_0((slot_0_38_0.t - (arg_52_3.deal_t or 0)) / slot_0_36_0.card_deal_duration)

        if var_52_0 <= 0 then
                return
        end

        local var_52_1 = slot_0_16_0(arg_52_1 + 150, arg_52_1, var_52_0)
        local var_52_2 = slot_0_16_0(arg_52_2 - 100, arg_52_2, var_52_0)
        local var_52_3 = math.floor(slot_0_15_0(var_52_0, 0, 1) * 255)

        slot_0_32_0(arg_52_0, var_52_1, var_52_2, 56, 80, 0.2)

        if arg_52_4 then
                slot_0_30_0(arg_52_0, var_52_1, var_52_2, 56, 80, {
                        18,
                        26,
                        48,
                        var_52_3
                }, 0, {
                        w = 1,
                        c = {
                                120,
                                150,
                                255,
                                math.floor(var_52_3 * 0.7)
                        }
                })

                return
        end

        slot_0_30_0(arg_52_0, var_52_1, var_52_2, 56, 80, {
                250,
                250,
                255,
                var_52_3
        }, 0, {
                w = 1,
                c = {
                        180,
                        180,
                        195,
                        var_52_3
                }
        })

        local var_52_4 = (arg_52_3.suit == "H" or arg_52_3.suit == "D") and slot_0_26_0(slot_0_25_0.s_red, var_52_0) or slot_0_26_0(slot_0_25_0.s_black, var_52_0)

        if slot_0_23_0.bold then
                slot_0_31_0(arg_52_0, slot_0_23_0.bold, var_52_1 + 6, var_52_2 + 4, 18, 18, arg_52_3.rank, var_52_4)
                slot_0_31_0(arg_52_0, slot_0_23_0.bold, var_52_1 + 32, var_52_2 + 58, 18, 18, arg_52_3.rank, var_52_4)
        end

        slot_0_52_0(arg_52_0, var_52_1 + 12, var_52_2 + 26, 10, arg_52_3.suit, var_52_4)
        slot_0_52_0(arg_52_0, var_52_1 + 44, var_52_2 + 54, 10, arg_52_3.suit, var_52_4)
        slot_0_52_0(arg_52_0, var_52_1 + 28, var_52_2 + 43, 26, arg_52_3.suit, var_52_4)
end

function slot_0_54_0(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4, arg_53_5, arg_53_6, arg_53_7, arg_53_8)
        local var_53_0 = slot_0_37_0(false)

        if not var_53_0 then
                return
        end

        local var_53_1 = arg_53_6[1] and arg_53_6[1].deal_t and slot_0_15_0((slot_0_38_0.t - arg_53_6[1].deal_t - slot_0_36_0.label_fade_delay) / slot_0_36_0.label_fade_duration, 0, 1) or 1
        local var_53_2 = var_53_1 * var_53_1 * (3 - 2 * var_53_1)

        slot_0_31_0(arg_53_0, slot_0_37_0(true), arg_53_1, arg_53_2, 100, 20, arg_53_3, slot_0_26_0(arg_53_8 and slot_0_25_0.green or slot_0_25_0.soft, var_53_2))

        local var_53_3 = arg_53_1 + slot_0_39_0.inr.w
        local var_53_4 = {
                {
                        arg_53_4,
                        false
                },
                {
                        arg_53_5,
                        true
                }
        }

        for iter_53_0, iter_53_1 in ipairs(var_53_4) do
                if iter_53_1[1] then
                        local var_53_5 = var_53_0:get_text_size(tostring(iter_53_1[1])).x + 18

                        var_53_3 = var_53_3 - var_53_5

                        local var_53_6 = iter_53_1[2] and slot_0_26_0(slot_0_25_0.gold, var_53_2 * 0.1) or {
                                20,
                                22,
                                28,
                                math.floor(var_53_2 * 180)
                        }
                        local var_53_7 = iter_53_1[2] and slot_0_26_0(slot_0_25_0.gold, var_53_2 * 0.2) or {
                                255,
                                255,
                                255,
                                math.floor(var_53_2 * 40)
                        }

                        slot_0_30_0(arg_53_0, var_53_3, arg_53_2 + 1, var_53_5, 18, var_53_6, 0, {
                                w = 1,
                                c = var_53_7
                        })
                        slot_0_31_0(arg_53_0, var_53_0, var_53_3, arg_53_2 + 1, var_53_5, 18, iter_53_1[1], slot_0_26_0(iter_53_1[2] and slot_0_25_0.gold or slot_0_25_0.soft, var_53_2))

                        var_53_3 = var_53_3 - 6
                end
        end

        local var_53_8 = slot_0_15_0((slot_0_39_0.inr.w - 56) / math.max(1, #arg_53_6 - 1), 16, 62)
        local var_53_9 = arg_53_1 + (slot_0_39_0.inr.w - (56 + (#arg_53_6 - 1) * var_53_8)) * 0.5

        for iter_53_2, iter_53_3 in ipairs(arg_53_6) do
                slot_0_53_0(arg_53_0, var_53_9 + (iter_53_2 - 1) * var_53_8, arg_53_2 + 28, iter_53_3, arg_53_7 and iter_53_2 == 2)
        end
end

slot_0_55_0 = slot_0_2_0.checkbox(slot_0_2_0.control_id("blackjack_enable_8F3A2B1C"))

if slot_0_2_0 and slot_0_2_0.ctx and slot_0_2_0.ctx.find then
        slot_0_56_0 = slot_0_2_0.ctx:find("lua>elements a")

        if slot_0_56_0 then
                slot_0_56_0:add(slot_0_2_0.make_control("Enable Blackjack", slot_0_55_0))
        end
end

slot_0_3_0.present_queue:add(function()
        if not slot_0_55_0:get_value():get() then
                slot_0_38_0.last_t = slot_0_13_0()
                slot_0_38_0.pts = {}
                slot_0_38_0.drag = false

                return
        end

        slot_54_0_0 = slot_0_13_0()

        if slot_0_38_0.last_t == 0 then
                slot_0_38_0.last_t = slot_54_0_0
        end

        slot_54_1_0 = math.min(0.1, slot_54_0_0 - slot_0_38_0.last_t)
        slot_0_38_0.last_t, slot_0_38_0.t = slot_54_0_0, slot_0_38_0.t + slot_54_1_0

        if slot_54_1_0 <= 0 then
                return
        end

        slot_54_2_0, slot_54_3_0 = slot_0_22_0()

        for iter_54_0 = #slot_0_38_0.pts, 1, -1 do
                slot_54_8_1 = slot_0_38_0.pts[iter_54_0]
                slot_54_8_1.vx, slot_54_8_1.vy, slot_54_8_1.life = slot_54_8_1.vx * slot_54_8_1.fric, slot_54_8_1.vy * slot_54_8_1.fric + slot_54_8_1.grav, slot_54_8_1.life - slot_54_8_1.life_dec
                slot_54_8_1.x, slot_54_8_1.y = slot_54_8_1.x + slot_54_8_1.vx, slot_54_8_1.y + slot_54_8_1.vy

                if slot_54_8_1.life <= 0 or slot_54_8_1.x < -slot_0_35_0.particle_bounds or slot_54_8_1.x > slot_54_2_0 + slot_0_35_0.particle_bounds or slot_54_8_1.y < -slot_0_35_0.particle_bounds or slot_54_8_1.y > slot_54_3_0 + slot_0_35_0.particle_bounds then
                        table.remove(slot_0_38_0.pts, iter_54_0)
                end
        end

        slot_0_38_0.sx, slot_0_38_0.sy = 0, 0

        if slot_0_38_0.shake > 0 then
                slot_0_38_0.sx = (slot_0_14_0() - 0.5) * 14 * slot_0_38_0.shake
                slot_0_38_0.sy = (slot_0_14_0() - 0.5) * 14 * slot_0_38_0.shake
                slot_0_38_0.shake = slot_0_16_0(slot_0_38_0.shake, 0, 0.15)
        end

        slot_0_40_0(slot_54_1_0)

        slot_54_4_0 = slot_0_0_0.surface
        slot_54_5_0 = slot_0_39_0.pnl.x
        slot_54_6_0 = slot_0_39_0.pnl.y

        slot_0_32_0(slot_54_4_0, slot_54_5_0, slot_54_6_0, slot_0_39_0.pnl.w, slot_0_39_0.pnl.h, 0.24)
        slot_0_30_0(slot_54_4_0, slot_54_5_0, slot_54_6_0, slot_0_39_0.pnl.w, slot_0_39_0.pnl.h, slot_0_25_0.bg, 0, {
                w = 1,
                c = slot_0_25_0.edge
        })
        slot_0_30_0(slot_54_4_0, slot_54_5_0, slot_54_6_0, slot_0_39_0.pnl.w, 44, {
                slot_0_25_0.h_a,
                slot_0_25_0.h_a,
                slot_0_25_0.h_b,
                slot_0_25_0.h_b
        })
        slot_0_30_0(slot_54_4_0, slot_54_5_0, slot_54_6_0 + 43, slot_0_39_0.pnl.w, 1, slot_0_26_0(slot_0_25_0.blue, 0.4))
        slot_0_31_0(slot_54_4_0, slot_0_23_0.bold, slot_54_5_0, slot_54_6_0, slot_0_39_0.pnl.w, 44, "BLACKJACK", slot_0_25_0.white)

        for iter_54_1, iter_54_2 in pairs(slot_0_39_0.stats) do
                slot_0_30_0(slot_54_4_0, iter_54_2.x, iter_54_2.y, iter_54_2.w, iter_54_2.h, {
                        {
                                30,
                                34,
                                44,
                                210
                        },
                        {
                                30,
                                34,
                                44,
                                210
                        },
                        {
                                18,
                                20,
                                26,
                                210
                        },
                        {
                                18,
                                20,
                                26,
                                210
                        }
                }, 0, {
                        w = 1,
                        c = {
                                255,
                                255,
                                255,
                                18
                        }
                })
                slot_0_30_0(slot_54_4_0, iter_54_2.x + 8, iter_54_2.y + 7, 3, iter_54_2.h - 14, iter_54_2.color)
                slot_0_31_0(slot_54_4_0, slot_0_23_0.main, iter_54_2.x + 16, iter_54_2.y, iter_54_2.w * 0.5, iter_54_2.h, iter_54_2.label, slot_0_25_0.dim)
                slot_0_31_0(slot_54_4_0, slot_0_23_0.bold, iter_54_2.x + iter_54_2.w * 0.5, iter_54_2.y, iter_54_2.w * 0.5 - 16, iter_54_2.h, iter_54_2.value, iter_54_2.color)
        end

        slot_0_30_0(slot_54_4_0, slot_0_39_0.inr.x - 4, slot_0_39_0.d.y - slot_0_34_0.highlight_pad, slot_0_39_0.inr.w + 8, slot_0_39_0.felt_h, {
                slot_0_25_0.f_a,
                slot_0_25_0.f_a,
                slot_0_25_0.f_b,
                slot_0_25_0.f_b
        }, 0, {
                w = 1,
                c = slot_0_25_0.f_edge
        })

        slot_54_7_0 = slot_0_38_0.active and slot_0_38_0.p_turn
        slot_54_8_0 = 0

        if slot_54_7_0 and slot_0_38_0.d_hand[1] then
                slot_54_8_0 = slot_0_43_0({
                        slot_0_38_0.d_hand[1]
                })
        elseif #slot_0_38_0.d_hand > 0 then
                slot_54_8_0 = slot_0_43_0(slot_0_38_0.d_hand)
        end

        slot_0_54_0(slot_54_4_0, slot_0_39_0.inr.x, slot_0_39_0.d.y, "DEALER", tostring(slot_54_8_0), nil, slot_0_38_0.d_hand, slot_54_7_0, false)

        slot_54_9_0 = slot_0_39_0.d.y + slot_0_34_0.hand_h + slot_0_34_0.highlight_pad

        slot_54_4_0:add_line(slot_0_0_0.vec2(slot_0_39_0.inr.x - 4, slot_54_9_0), slot_0_0_0.vec2(slot_0_39_0.inr.x + slot_0_39_0.inr.w + 4, slot_54_9_0), slot_0_24_0({
                255,
                255,
                255,
                45
        }), 1)

        for iter_54_3, iter_54_4 in ipairs(slot_0_39_0.hands) do
                slot_54_15_1 = slot_0_38_0.p_hands[iter_54_3]
                slot_54_16_1 = slot_0_38_0.active and slot_0_38_0.p_turn and iter_54_3 == slot_0_38_0.active_idx and not (slot_54_15_1 or {}).done

                if slot_54_16_1 then
                        slot_54_17_2 = iter_54_4.y - slot_0_34_0.highlight_pad
                        slot_54_18_2 = slot_0_34_0.hand_h + slot_0_34_0.highlight_pad * 2

                        slot_0_30_0(slot_54_4_0, slot_0_39_0.inr.x - 2, slot_54_17_2, slot_0_39_0.inr.w + 4, slot_54_18_2, {
                                85,
                                255,
                                140,
                                20
                        })
                end

                slot_0_54_0(slot_54_4_0, slot_0_39_0.inr.x, iter_54_4.y, #slot_0_38_0.p_hands > 1 and "HAND " .. iter_54_3 or "PLAYER", slot_54_15_1 and tostring(slot_0_43_0(slot_54_15_1.cards)), slot_54_15_1 and "$" .. slot_54_15_1.bet, slot_54_15_1 and slot_54_15_1.cards or {}, false, slot_54_16_1)

                if iter_54_3 < #slot_0_39_0.hands then
                        slot_54_17_1 = slot_0_24_0({
                                255,
                                255,
                                255,
                                45
                        })
                        slot_54_18_1 = iter_54_4.y + slot_0_34_0.hand_h + slot_0_34_0.highlight_pad

                        slot_54_4_0:add_line(slot_0_0_0.vec2(slot_0_39_0.inr.x - 4, slot_54_18_1), slot_0_0_0.vec2(slot_0_39_0.inr.x + slot_0_39_0.inr.w + 4, slot_54_18_1), slot_54_17_1, 1)
                end
        end

        if (slot_0_38_0.res or slot_0_38_0.lost) and not slot_0_38_0.active and slot_0_38_0.t >= (slot_0_38_0.res_t or 0) then
                if slot_0_38_0.banner < 0.05 then
                        slot_54_10_1 = slot_0_39_0.inr.x + slot_0_39_0.inr.w * 0.5
                        slot_54_11_1 = slot_0_39_0.d.y + 108
                        slot_54_12_1 = slot_0_38_0.res == "win" or slot_0_38_0.res == "bj"

                        slot_0_41_0(slot_54_10_1, slot_54_11_1, slot_0_38_0.res == "bj" and 44 or 26, slot_54_12_1 and "multi" or {
                                120,
                                35,
                                35
                        }, slot_54_12_1 and "spark" or "smoke")
                end

                slot_0_38_0.banner = slot_0_16_0(slot_0_38_0.banner, 1, 0.12)
                slot_54_10_0 = slot_0_38_0.lost and "GAME OVER" or slot_0_38_0.res == "surr" and "SURRENDERED" or slot_0_38_0.res == "bj" and "BLACKJACK!" or slot_0_38_0.res and slot_0_38_0.res:upper() or "RESULT"
                slot_54_11_0 = math.floor(slot_0_38_0.banner * 255)
                slot_54_12_0 = 255
                slot_54_13_2 = 255
                slot_54_14_2 = 255

                if slot_54_10_0 == "BLACKJACK!" then
                        slot_54_12_0, slot_54_13_2, slot_54_14_2 = 255, 215, 0
                elseif slot_54_10_0 == "WIN" then
                        slot_54_12_0, slot_54_13_2, slot_54_14_2 = 85, 255, 140
                elseif slot_54_10_0 == "PUSH" then
                        slot_54_12_0, slot_54_13_2, slot_54_14_2 = 95, 170, 255
                elseif slot_54_10_0 == "SURRENDERED" then
                        slot_54_12_0, slot_54_13_2, slot_54_14_2 = 180, 180, 200
                else
                        slot_54_12_0, slot_54_13_2, slot_54_14_2 = 255, 95, 95
                end

                slot_0_30_0(slot_54_4_0, slot_0_39_0.inr.x - 4, slot_0_39_0.d.y + 86, slot_0_39_0.inr.w + 8, 44, {
                        10,
                        12,
                        16,
                        math.floor(slot_54_11_0 * 0.85)
                })
                slot_0_30_0(slot_54_4_0, slot_0_39_0.inr.x - 4, slot_0_39_0.d.y + 86, slot_0_39_0.inr.w + 8, 1, {
                        slot_54_12_0,
                        slot_54_13_2,
                        slot_54_14_2,
                        math.floor(slot_54_11_0 * 0.6)
                })
                slot_0_30_0(slot_54_4_0, slot_0_39_0.inr.x - 4, slot_0_39_0.d.y + 129, slot_0_39_0.inr.w + 8, 1, {
                        slot_54_12_0,
                        slot_54_13_2,
                        slot_54_14_2,
                        math.floor(slot_54_11_0 * 0.6)
                })
                slot_0_31_0(slot_54_4_0, slot_0_23_0.bold or slot_0_23_0.main, slot_0_39_0.inr.x, slot_0_39_0.d.y + 86, slot_0_39_0.inr.w, 44, slot_54_10_0, {
                        255,
                        255,
                        255,
                        slot_54_11_0
                })
        else
                slot_0_38_0.banner = slot_0_16_0(slot_0_38_0.banner, 0, 0.25)
        end

        slot_0_30_0(slot_54_4_0, slot_0_39_0.msg.x, slot_0_39_0.msg.y, slot_0_39_0.msg.w, slot_0_39_0.msg.h, {
                18,
                20,
                26,
                220
        }, 0, {
                w = 1,
                c = {
                        255,
                        255,
                        255,
                        22
                }
        })
        slot_0_31_0(slot_54_4_0, slot_0_23_0.main, slot_0_39_0.msg.x, slot_0_39_0.msg.y, slot_0_39_0.msg.w, slot_0_39_0.msg.h, slot_0_38_0.msg, slot_0_25_0.dim)

        for iter_54_5, iter_54_6 in pairs(slot_0_39_0.btns) do
                slot_54_15_0 = slot_0_51_0[iter_54_5]
                slot_54_16_0 = slot_54_15_0.enabled()
                slot_54_17_0 = slot_0_18_0(slot_0_38_0.mx, slot_0_38_0.my, iter_54_6.x, iter_54_6.y, iter_54_6.w, iter_54_6.h)
                slot_0_38_0.b_anim[iter_54_5] = slot_0_16_0(slot_0_38_0.b_anim[iter_54_5] or 0, slot_54_17_0 and 1 or 0, 0.18)
                slot_0_38_0.b_clk[iter_54_5] = slot_0_16_0(slot_0_38_0.b_clk[iter_54_5] or 0, 0, 0.25)
                slot_54_18_0 = 1 - (slot_0_38_0.b_clk[iter_54_5] or 0) * 0.03
                slot_54_19_0 = iter_54_6.w * slot_54_18_0
                slot_54_20_0 = iter_54_6.h * slot_54_18_0
                slot_54_21_0 = iter_54_6.x + (iter_54_6.w - slot_54_19_0) * 0.5
                slot_54_22_0 = iter_54_6.y + (iter_54_6.h - slot_54_20_0) * 0.5
                slot_54_23_0 = slot_0_38_0.b_anim[iter_54_5] or 0
                slot_54_24_0 = slot_0_16_0(30, 46, slot_54_23_0)
                slot_54_25_0 = slot_0_16_0(34, 54, slot_54_23_0)
                slot_54_26_0 = slot_0_16_0(44, 74, slot_54_23_0)

                if not slot_54_16_0 then
                        slot_54_24_0, slot_54_25_0, slot_54_26_0 = 22, 24, 30
                end

                slot_54_27_0 = slot_54_15_0.color

                if slot_54_27_0 and slot_54_16_0 then
                        slot_54_28_0 = 0.45 + 0.15 * slot_54_23_0
                        slot_54_24_0, slot_54_25_0, slot_54_26_0 = slot_0_16_0(slot_54_24_0, slot_54_27_0[1], slot_54_28_0), slot_0_16_0(slot_54_25_0, slot_54_27_0[2], slot_54_28_0), slot_0_16_0(slot_54_26_0, slot_54_27_0[3], slot_54_28_0)
                end

                slot_0_30_0(slot_54_4_0, slot_54_21_0, slot_54_22_0, slot_54_19_0, slot_54_20_0, {
                        slot_54_24_0,
                        slot_54_25_0,
                        slot_54_26_0,
                        slot_54_16_0 and 255 or 200
                }, 0, {
                        w = 1,
                        c = slot_54_16_0 and slot_0_25_0.b_eg or {
                                55,
                                60,
                                72,
                                160
                        }
                })
                slot_0_31_0(slot_54_4_0, slot_0_23_0.main, iter_54_6.x, iter_54_6.y, iter_54_6.w, iter_54_6.h, slot_54_15_0.label, slot_54_16_0 and slot_0_25_0.soft or {
                        120,
                        125,
                        140,
                        255
                })
        end

        for iter_54_7, iter_54_8 in ipairs(slot_0_38_0.pts) do
                slot_0_30_0(slot_54_4_0, iter_54_8.x + (slot_0_38_0.sx or 0), iter_54_8.y + (slot_0_38_0.sy or 0), iter_54_8.size, iter_54_8.size, {
                        iter_54_8.color.r,
                        iter_54_8.color.g,
                        iter_54_8.color.b,
                        math.floor(iter_54_8.life * 255)
                })
        end
end)
slot_0_3_0.input:add(function(arg_55_0, arg_55_1, arg_55_2)
        local function var_55_0(arg_56_0)
                return arg_56_0 >= 32768 and arg_56_0 - 65536 or arg_56_0
        end

        local var_55_1 = var_55_0(slot_0_6_0.band(arg_55_2, 65535))
        local var_55_2 = var_55_0(slot_0_6_0.band(slot_0_6_0.rshift(arg_55_2, 16), 65535))

        if arg_55_0 >= slot_0_19_0 and arg_55_0 <= slot_0_21_0 then
                slot_0_38_0.mx, slot_0_38_0.my = var_55_1, var_55_2
        end

        if arg_55_0 == slot_0_21_0 then
                slot_0_38_0.drag = false
        end

        if not slot_0_55_0:get_value():get() then
                return
        end

        if arg_55_0 == slot_0_19_0 and slot_0_38_0.drag then
                slot_0_38_0.px, slot_0_38_0.py = var_55_1 - slot_0_38_0.dx - (slot_0_38_0.sx or 0), var_55_2 - slot_0_38_0.dy - (slot_0_38_0.sy or 0)

                slot_0_40_0(0)

                return
        end

        if arg_55_0 == slot_0_20_0 then
                for iter_55_0, iter_55_1 in pairs(slot_0_39_0.btns) do
                        if slot_0_18_0(var_55_1, var_55_2, iter_55_1.x, iter_55_1.y, iter_55_1.w, iter_55_1.h) and slot_0_51_0[iter_55_0].enabled() then
                                slot_0_38_0.b_clk[iter_55_0] = 1

                                slot_0_51_0[iter_55_0].action()

                                return
                        end
                end

                if slot_0_18_0(var_55_1, var_55_2, slot_0_39_0.pnl.x, slot_0_39_0.pnl.y, slot_0_39_0.pnl.w, 44) then
                        slot_0_38_0.shake = 0
                        slot_0_38_0.drag, slot_0_38_0.dx, slot_0_38_0.dy = true, var_55_1 - slot_0_39_0.pnl.x, var_55_2 - slot_0_39_0.pnl.y
                end
        end
end)
