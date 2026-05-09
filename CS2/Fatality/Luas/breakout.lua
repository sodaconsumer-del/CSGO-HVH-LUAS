--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = draw
slot_0_1_0 = game
slot_0_2_0 = gui
slot_0_3_0 = events
slot_0_4_0 = ffi
slot_0_5_0 = utils
slot_0_6_0 = bit

function slot_0_7_0()
        local var_1_0 = slot_0_0_0 and slot_0_0_0.time or 0

        if slot_0_1_0 and slot_0_1_0.global_vars and slot_0_1_0.global_vars.realtime then
                var_1_0 = slot_0_1_0.global_vars.realtime
        end

        return tonumber(var_1_0) or 0
end

slot_0_8_0 = slot_0_7_0

if slot_0_4_0 and slot_0_4_0.cdef and slot_0_4_0.cast and slot_0_4_0.new and slot_0_5_0 and slot_0_5_0.find_export then
        slot_0_9_1 = slot_0_5_0.find_export("kernel32.dll", "QueryPerformanceCounter")
        slot_0_10_1 = slot_0_5_0.find_export("kernel32.dll", "QueryPerformanceFrequency")

        if slot_0_9_1 and slot_0_10_1 and slot_0_9_1 ~= 0 and slot_0_10_1 ~= 0 then
                slot_0_4_0.cdef("typedef struct { int64_t QuadPart; } LI; int QueryPerformanceCounter(LI* lpPC); int QueryPerformanceFrequency(LI* lpF);")

                slot_0_11_1 = slot_0_4_0.cast("int(__stdcall*)(void*)", slot_0_9_1)
                slot_0_12_1 = slot_0_4_0.cast("int(__stdcall*)(void*)", slot_0_10_1)
                slot_0_13_1 = slot_0_4_0.new("LI")
                slot_0_14_1 = slot_0_4_0.new("LI")

                if slot_0_12_1(slot_0_13_1) ~= 0 then
                        slot_0_15_1 = tonumber(slot_0_13_1.QuadPart)

                        function slot_0_8_0()
                                if slot_0_11_1(slot_0_14_1) ~= 0 then
                                        return tonumber(slot_0_14_1.QuadPart) / slot_0_15_1
                                end

                                return slot_0_7_0()
                        end
                end
        end
end

slot_0_9_0 = slot_0_8_0()
slot_0_10_0 = 0
slot_0_11_0 = 0.008333333333333333
slot_0_12_0 = 1
slot_0_13_0 = {
        bold = slot_0_0_0.fonts.gui_bold,
        main = slot_0_0_0.fonts.gui_main
}

function slot_0_14_0(arg_3_0, arg_3_1, arg_3_2)
        return math.max(arg_3_1, math.min(arg_3_2, arg_3_0))
end

function slot_0_15_0(arg_4_0, arg_4_1, arg_4_2)
        return arg_4_0 + (arg_4_1 - arg_4_0) * arg_4_2
end

function slot_0_16_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
        return arg_5_2 <= arg_5_0 and arg_5_0 <= arg_5_2 + arg_5_4 and arg_5_3 <= arg_5_1 and arg_5_1 <= arg_5_3 + arg_5_5
end

function slot_0_17_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
        if not arg_6_6 or arg_6_6 == "" or not arg_6_1 then
                return
        end

        local var_6_0 = arg_6_1:get_text_size(tostring(arg_6_6))

        arg_6_0.font = arg_6_1

        arg_6_0:add_text(slot_0_0_0.vec2(math.floor(arg_6_2 + (arg_6_4 - var_6_0.x * 1.12) / 2), math.floor(arg_6_3 + (arg_6_5 - var_6_0.y) / 2)), tostring(arg_6_6), arg_6_7)
end

slot_0_18_0 = {
        w = slot_0_0_0.color(255, 255, 255, 255),
        o = slot_0_0_0.color(255, 180, 50, 255),
        g = slot_0_0_0.color(80, 255, 100, 255),
        b = slot_0_0_0.color(80, 150, 255, 255),
        r = slot_0_0_0.color(255, 80, 80, 255),
        y = slot_0_0_0.color(255, 255, 0, 255),
        bg = slot_0_0_0.color(18, 20, 28, 245),
        brd = slot_0_0_0.color(60, 70, 120, 150),
        hdr = slot_0_0_0.color(80, 110, 255, 180),
        shd = slot_0_0_0.color(0, 0, 0, 80),
        gbg = slot_0_0_0.color(12, 14, 22, 255)
}
slot_0_19_0 = {}

for iter_0_0, iter_0_1 in ipairs({
        {
                255,
                80,
                80
        },
        {
                255,
                140,
                60
        },
        {
                255,
                220,
                60
        },
        {
                80,
                255,
                100
        },
        {
                80,
                180,
                255
        },
        {
                180,
                100,
                255
        },
        {
                255,
                100,
                200
        },
        {
                100,
                255,
                220
        }
}) do
        slot_0_19_0[iter_0_0] = iter_0_1
end

slot_0_20_0 = 400
slot_0_21_0 = 560
slot_0_22_0 = 20
slot_0_23_0 = 75
slot_0_24_0 = 360
slot_0_25_0 = 400
slot_0_26_0 = 6
slot_0_27_0 = 10
slot_0_28_0 = math.floor((slot_0_24_0 - 4) / slot_0_27_0) - 2
slot_0_29_0 = 16
slot_0_30_0 = 2
slot_0_31_0 = {
        msg = "Click START to play!",
        go = false,
        ps = false,
        st = false,
        mt = 0,
        hs = 0,
        score = 0,
        cmb = 0,
        shk = 0,
        lives = 3,
        ct = 0,
        ba = true,
        hl = 1,
        bricks = {},
        balls = {},
        paddle = {
                w = 80,
                x = 0
        },
        pt = {}
}
slot_0_32_0 = {
        is = false,
        cx = 0,
        cy = 0,
        x = 100,
        y = 80,
        oy = 0,
        ox = 0
}
slot_0_33_0 = {
        "random",
        "symmetric",
        "wave",
        "diamond",
        "checkerboard",
        "fortress",
        "stripes",
        "invader",
        "spiral",
        "cross"
}

function slot_0_34_0(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
        for iter_7_0 = 1, arg_7_2 do
                local var_7_0 = arg_7_3

                if arg_7_3 == "multi" then
                        local var_7_1 = math.random(6)
                        local var_7_2 = {
                                {
                                        255,
                                        80,
                                        80
                                },
                                {
                                        80,
                                        255,
                                        100
                                },
                                {
                                        80,
                                        180,
                                        255
                                },
                                {
                                        255,
                                        220,
                                        60
                                },
                                {
                                        255,
                                        100,
                                        220
                                },
                                {
                                        100,
                                        255,
                                        220
                                }
                        }

                        var_7_0 = {
                                r = var_7_2[var_7_1][1],
                                g = var_7_2[var_7_1][2],
                                b = var_7_2[var_7_1][3]
                        }
                end

                local var_7_3 = {
                        life = 1,
                        x = arg_7_0,
                        y = arg_7_1,
                        c = var_7_0,
                        type = arg_7_4 or "glitter"
                }

                if var_7_3.type == "firework" then
                        var_7_3.vx, var_7_3.vy, var_7_3.s, var_7_3.dec, var_7_3.f, var_7_3.gr = (math.random() - 0.5) * 18, (math.random() - 1.2) * 20, 2 + math.random(3), 0.012, 0.97, 0.6
                elseif var_7_3.type == "glitter" then
                        var_7_3.vx, var_7_3.vy, var_7_3.s, var_7_3.dec, var_7_3.f, var_7_3.gr = (math.random() - 0.5) * 10, (math.random() - 0.8) * 12, 2 + math.random(2), 0.025, 0.94, 0.35
                else
                        var_7_3.vx, var_7_3.vy, var_7_3.s, var_7_3.dec, var_7_3.f, var_7_3.gr = (math.random() - 0.5) * 6, (math.random() - 0.5) * 6, 1 + math.random(2), 0.04, 0.9, 0.1
                end

                table.insert(slot_0_31_0.pt, var_7_3)
        end
end

function slot_0_35_0(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
        return {
                x = arg_8_0 or 0,
                y = arg_8_1 or 0,
                dx = arg_8_2 or 0.7,
                dy = arg_8_3 or -0.7,
                s = arg_8_4 or 320,
                a = arg_8_5 or false,
                tr = {}
        }
end

function slot_0_36_0()
        slot_0_31_0.balls = {}

        local var_9_0 = slot_0_35_0(slot_0_31_0.paddle.x + slot_0_31_0.paddle.w / 2, slot_0_25_0 - 10 - 5 - 5, 0.7 * (math.random() > 0.5 and 1 or -1), -0.7, 320 + slot_0_31_0.hl * 15, true)
        local var_9_1 = math.sqrt(var_9_0.dx^2 + var_9_0.dy^2)

        var_9_0.dx, var_9_0.dy = var_9_0.dx / var_9_1, var_9_0.dy / var_9_1

        table.insert(slot_0_31_0.balls, var_9_0)

        slot_0_31_0.ba = true
end

function slot_0_37_0(arg_10_0)
        math.randomseed(math.floor(slot_0_8_0() * 100000))
        math.randomseed(arg_10_0 * 12345 + 789)

        for iter_10_0 = 1, 5 do
                math.random()
        end

        slot_10_1_0 = slot_0_33_0[(arg_10_0 - 1) % #slot_0_33_0 + 1]
        slot_10_2_0 = slot_0_14_0(0.4 + arg_10_0 * 0.04, 0.4, 0.95)
        slot_10_3_0 = {}
        slot_10_4_0 = (slot_0_27_0 + 1) / 2
        slot_10_5_0 = (slot_0_26_0 + 1) / 2

        for iter_10_1 = 1, slot_0_26_0 do
                for iter_10_2 = 1, slot_0_27_0 do
                        slot_10_14_0 = false

                        if slot_10_1_0 == "random" then
                                slot_10_14_0 = slot_10_2_0 > math.random()
                        elseif slot_10_1_0 == "symmetric" then
                                if iter_10_2 <= math.ceil(slot_0_27_0 / 2) then
                                        slot_10_14_0 = slot_10_2_0 > math.random()
                                else
                                        for iter_10_3, iter_10_4 in ipairs(slot_10_3_0) do
                                                if iter_10_4.r == iter_10_1 and iter_10_4.c == slot_0_27_0 - iter_10_2 + 1 then
                                                        slot_10_14_0 = true

                                                        break
                                                end
                                        end
                                end
                        elseif slot_10_1_0 == "wave" then
                                slot_10_14_0 = iter_10_1 <= slot_0_26_0 / 2 + math.sin((iter_10_2 - 1) * 0.8 + arg_10_0) * 1.5 + 1
                        elseif slot_10_1_0 == "diamond" then
                                slot_10_14_0 = math.abs(iter_10_2 - slot_10_4_0) + math.abs(iter_10_1 - slot_10_5_0) < slot_0_27_0 / 2 + 1 and slot_10_2_0 > math.random()
                        elseif slot_10_1_0 == "checkerboard" then
                                slot_10_14_0 = (iter_10_1 + iter_10_2) % 2 == 0
                        elseif slot_10_1_0 == "fortress" then
                                slot_10_14_0 = iter_10_2 == 1 or iter_10_2 == slot_0_27_0 or iter_10_1 == 1 or math.random() < slot_10_2_0 * 0.6
                        elseif slot_10_1_0 == "stripes" then
                                slot_10_14_0 = iter_10_2 % 3 ~= 0 and slot_10_2_0 > math.random()
                        elseif slot_10_1_0 == "invader" then
                                slot_10_15_1 = math.abs(iter_10_2 - slot_10_4_0)

                                if iter_10_1 <= 2 then
                                        slot_10_14_0 = slot_10_15_1 <= 2
                                elseif iter_10_1 <= 4 then
                                        slot_10_14_0 = slot_10_15_1 <= 3 and slot_10_15_1 >= 1
                                else
                                        slot_10_14_0 = slot_10_15_1 <= 4 and (slot_10_15_1 == 1 or slot_10_15_1 == 4)
                                end
                        elseif slot_10_1_0 == "spiral" then
                                slot_10_14_0 = math.sin(math.atan2(iter_10_1 - slot_10_5_0, iter_10_2 - slot_10_4_0) * 3 + math.sqrt((iter_10_1 - slot_10_5_0)^2 + (iter_10_2 - slot_10_4_0)^2) * 0.5) > 0 and slot_10_2_0 > math.random()
                        elseif slot_10_1_0 == "cross" then
                                slot_10_14_0 = (math.abs(iter_10_2 - slot_10_4_0) < 2 or math.abs(iter_10_1 - slot_10_5_0) < 2) and slot_10_2_0 > math.random()
                        end

                        if slot_10_14_0 then
                                slot_10_15_0 = 1

                                if arg_10_0 > 2 and math.random() < 0.15 + arg_10_0 * 0.02 then
                                        slot_10_15_0 = 2
                                end

                                if arg_10_0 > 5 and math.random() < 0.08 + arg_10_0 * 0.01 then
                                        slot_10_15_0 = 3
                                end

                                if arg_10_0 > 8 and math.random() < 0.05 then
                                        slot_10_15_0 = 4
                                end

                                table.insert(slot_10_3_0, {
                                        f = 0,
                                        r = iter_10_1,
                                        c = iter_10_2,
                                        h = slot_10_15_0,
                                        mh = slot_10_15_0
                                })
                        end
                end
        end

        if #slot_10_3_0 < 5 then
                for iter_10_5 = 1, slot_0_26_0 do
                        for iter_10_6 = 1, slot_0_27_0 do
                                if math.random() < 0.5 then
                                        table.insert(slot_10_3_0, {
                                                h = 1,
                                                mh = 1,
                                                f = 0,
                                                r = iter_10_5,
                                                c = iter_10_6
                                        })
                                end
                        end
                end
        end

        return slot_10_3_0
end

function slot_0_38_0(arg_11_0, arg_11_1, arg_11_2)
        local var_11_0 = slot_0_27_0 * slot_0_28_0 + (slot_0_27_0 - 1) * slot_0_30_0
        local var_11_1 = arg_11_1 + (slot_0_24_0 - var_11_0) / 2 + (arg_11_0.c - 1) * (slot_0_28_0 + slot_0_30_0)
        local var_11_2 = arg_11_2 + (arg_11_0.r - 1) * (slot_0_29_0 + slot_0_30_0) + slot_0_30_0

        return var_11_1, var_11_2, var_11_1 + slot_0_28_0, var_11_2 + slot_0_29_0
end

function slot_0_39_0()
        slot_0_31_0.bricks, slot_0_31_0.paddle.x, slot_0_31_0.paddle.w, slot_0_31_0.st, slot_0_31_0.ps, slot_0_31_0.go, slot_0_31_0.msg = slot_0_37_0(slot_0_31_0.hl), slot_0_24_0 / 2 - 40, 80, true, false, false, ""

        slot_0_36_0()
end

function slot_0_40_0()
        slot_0_31_0.hl = slot_0_31_0.hl + 1
        slot_0_31_0.bricks = slot_0_37_0(slot_0_31_0.hl)

        slot_0_36_0()

        slot_0_31_0.msg, slot_0_31_0.mt = "LEVEL " .. slot_0_31_0.hl, 2

        slot_0_34_0(slot_0_24_0 / 2, slot_0_25_0 / 2, 30, "multi", "firework")
end

function slot_0_41_0()
        slot_0_31_0.lives = slot_0_31_0.lives - 1
        slot_0_31_0.shk, slot_0_31_0.cmb = 0.4, 0

        if slot_0_31_0.lives <= 0 then
                slot_0_31_0.go, slot_0_31_0.msg = true, "GAME OVER"

                if slot_0_31_0.score > slot_0_31_0.hs then
                        slot_0_31_0.hs, slot_0_31_0.msg = slot_0_31_0.score, "NEW HIGH SCORE!"
                end
        else
                slot_0_36_0()

                slot_0_31_0.msg, slot_0_31_0.mt = "Lives: " .. slot_0_31_0.lives, 1.5
        end
end

function slot_0_42_0(arg_15_0, arg_15_1, arg_15_2)
        if slot_0_31_0.ct > 0 then
                slot_0_31_0.ct = slot_0_31_0.ct - arg_15_0

                if slot_0_31_0.ct <= 0 then
                        slot_0_31_0.cmb = 0
                end
        end

        if slot_0_31_0.mt > 0 then
                slot_0_31_0.mt = slot_0_31_0.mt - arg_15_0

                if slot_0_31_0.mt <= 0 then
                        slot_0_31_0.msg = ""
                end
        end

        if slot_0_31_0.shk > 0 then
                slot_0_31_0.shk = slot_0_15_0(slot_0_31_0.shk, 0, 0.12)
        end

        for iter_15_0 = #slot_0_31_0.pt, 1, -1 do
                slot_15_7_2 = slot_0_31_0.pt[iter_15_0]
                slot_15_7_2.vx, slot_15_7_2.vy = slot_15_7_2.vx * slot_15_7_2.f, slot_15_7_2.vy * slot_15_7_2.f + slot_15_7_2.gr
                slot_15_7_2.x, slot_15_7_2.y, slot_15_7_2.life = slot_15_7_2.x + slot_15_7_2.vx, slot_15_7_2.y + slot_15_7_2.vy, slot_15_7_2.life - slot_15_7_2.dec

                if slot_15_7_2.life <= 0 or slot_15_7_2.y > 1000 then
                        table.remove(slot_0_31_0.pt, iter_15_0)
                end
        end

        for iter_15_1, iter_15_2 in ipairs(slot_0_31_0.bricks) do
                if iter_15_2.f > 0 then
                        iter_15_2.f = slot_0_15_0(iter_15_2.f, 0, 0.15)
                end
        end

        if not slot_0_31_0.st or slot_0_31_0.ps or slot_0_31_0.go then
                return
        end

        for iter_15_3 = #slot_0_31_0.balls, 1, -1 do
                slot_15_7_0 = slot_0_31_0.balls[iter_15_3]

                if slot_0_31_0.ba and #slot_0_31_0.balls == 1 then
                        slot_15_7_0.x, slot_15_7_0.y = slot_0_31_0.paddle.x + slot_0_31_0.paddle.w / 2, slot_0_25_0 - 10 - 5 - 5
                else
                        table.insert(slot_15_7_0.tr, 1, {
                                l = 1,
                                x = slot_15_7_0.x,
                                y = slot_15_7_0.y
                        })

                        if #slot_15_7_0.tr > 12 then
                                table.remove(slot_15_7_0.tr)
                        end

                        for iter_15_4, iter_15_5 in ipairs(slot_15_7_0.tr) do
                                iter_15_5.l = iter_15_5.l - 0.08
                        end

                        slot_15_7_0.x, slot_15_7_0.y = slot_15_7_0.x + slot_15_7_0.dx * slot_15_7_0.s * arg_15_0, slot_15_7_0.y + slot_15_7_0.dy * slot_15_7_0.s * arg_15_0

                        if slot_15_7_0.x - 5 <= 0 then
                                slot_15_7_0.x, slot_15_7_0.dx = 5, math.abs(slot_15_7_0.dx)
                        elseif slot_15_7_0.x + 5 >= slot_0_24_0 then
                                slot_15_7_0.x, slot_15_7_0.dx = slot_0_24_0 - 5, -math.abs(slot_15_7_0.dx)
                        end

                        if slot_15_7_0.y - 5 <= 0 then
                                slot_15_7_0.y, slot_15_7_0.dy = 5, math.abs(slot_15_7_0.dy)
                        elseif slot_15_7_0.y > slot_0_25_0 + 5 then
                                table.remove(slot_0_31_0.balls, iter_15_3)

                                if #slot_0_31_0.balls == 0 then
                                        slot_0_41_0()

                                        return
                                end
                        end

                        slot_15_8_0 = arg_15_1 + slot_0_31_0.paddle.x
                        slot_15_9_0 = arg_15_2 + slot_0_25_0 - 12

                        if slot_0_16_0(arg_15_1 + slot_15_7_0.x, arg_15_2 + slot_15_7_0.y, slot_15_8_0 - 5, slot_15_9_0 - 2, slot_0_31_0.paddle.w + 10, 12) then
                                slot_15_10_0 = slot_0_14_0((slot_15_7_0.x - slot_0_31_0.paddle.x) / slot_0_31_0.paddle.w, 0, 1)
                                slot_15_11_0 = math.rad(-150 + slot_15_10_0 * 120)
                                slot_15_7_0.dx, slot_15_7_0.dy, slot_15_7_0.y = math.cos(slot_15_11_0), math.min(-0.2, math.sin(slot_15_11_0)), slot_0_25_0 - 10 - 5 - 6
                                slot_15_12_0 = math.sqrt(slot_15_7_0.dx^2 + slot_15_7_0.dy^2)
                                slot_15_7_0.dx, slot_15_7_0.dy = slot_15_7_0.dx / slot_15_12_0, slot_15_7_0.dy / slot_15_12_0

                                slot_0_34_0(arg_15_1 + slot_15_7_0.x, arg_15_2 + slot_15_7_0.y, 3, {
                                        r = 150,
                                        g = 180,
                                        b = 255
                                }, "spark")
                        end

                        for iter_15_6 = #slot_0_31_0.bricks, 1, -1 do
                                slot_15_14_0 = slot_0_31_0.bricks[iter_15_6]
                                slot_15_15_0, slot_15_16_0, slot_15_17_0, slot_15_18_0 = slot_0_38_0(slot_15_14_0, 0, 0)
                                slot_15_19_0 = slot_15_7_0.x - slot_0_14_0(slot_15_7_0.x, slot_15_15_0, slot_15_17_0)
                                slot_15_20_0 = slot_15_7_0.y - slot_0_14_0(slot_15_7_0.y, slot_15_16_0, slot_15_18_0)

                                if slot_15_19_0 * slot_15_19_0 + slot_15_20_0 * slot_15_20_0 < 25 then
                                        slot_15_14_0.h, slot_15_14_0.f = slot_15_14_0.h - 1, 1
                                        slot_15_21_0 = (slot_15_15_0 + slot_15_17_0) / 2
                                        slot_15_22_0 = (slot_15_16_0 + slot_15_18_0) / 2

                                        if slot_15_14_0.h <= 0 then
                                                slot_15_23_0 = slot_0_19_0[(slot_15_14_0.r - 1) % #slot_0_19_0 + 1]

                                                slot_0_34_0(arg_15_1 + slot_15_21_0, arg_15_2 + slot_15_22_0, 8, {
                                                        r = slot_15_23_0[1],
                                                        g = slot_15_23_0[2],
                                                        b = slot_15_23_0[3]
                                                }, "glitter")
                                                table.remove(slot_0_31_0.bricks, iter_15_6)

                                                slot_0_31_0.cmb, slot_0_31_0.ct = slot_0_31_0.cmb + 1, 1.5
                                                slot_0_31_0.score = slot_0_31_0.score + math.floor((10 + slot_15_14_0.mh * 5) * slot_0_31_0.hl * (1 + math.min(slot_0_31_0.cmb - 1, 10) * 0.1))

                                                if slot_0_31_0.cmb >= 5 then
                                                        slot_0_31_0.msg, slot_0_31_0.mt = slot_0_31_0.cmb .. "x COMBO!", 1
                                                end
                                        else
                                                slot_0_34_0(arg_15_1 + slot_15_21_0, arg_15_2 + slot_15_22_0, 3, {
                                                        r = 255,
                                                        g = 255,
                                                        b = 255
                                                }, "spark")
                                        end

                                        if math.abs(slot_15_19_0) < math.abs(slot_15_20_0) then
                                                slot_15_7_0.dy, slot_15_7_0.y = -slot_15_7_0.dy, slot_15_7_0.y + (slot_15_20_0 > 0 and 5 - math.abs(slot_15_20_0) or -(5 - math.abs(slot_15_20_0)))

                                                break
                                        end

                                        slot_15_7_0.dx, slot_15_7_0.x = -slot_15_7_0.dx, slot_15_7_0.x + (slot_15_19_0 > 0 and 5 - math.abs(slot_15_19_0) or -(5 - math.abs(slot_15_19_0)))

                                        break
                                end
                        end
                end
        end

        if #slot_0_31_0.bricks == 0 then
                slot_0_40_0()
        end
end

slot_0_43_0 = slot_0_2_0.checkbox(slot_0_2_0.control_id("breakout_enable"))

slot_0_2_0.ctx:find("lua>elements a"):add(slot_0_2_0.make_control("Enable Breakout", slot_0_43_0))

slot_0_44_0 = {
        p = 0,
        s = 0
}
slot_0_45_0 = {
        p = 0,
        s = 0
}

slot_0_3_0.present_queue:add(function()
        if not slot_0_43_0:get_value():get() then
                slot_0_9_0 = 0

                return
        end

        slot_16_0_0 = slot_0_0_0.surface
        slot_16_1_0 = slot_0_8_0()

        if slot_0_9_0 == 0 then
                slot_0_9_0 = slot_16_1_0
        end

        slot_16_2_0 = slot_16_1_0 > slot_0_9_0 and slot_0_14_0(slot_16_1_0 - slot_0_9_0, 0.001, 0.1) or 0.016
        slot_0_9_0 = slot_16_1_0
        slot_16_3_0 = (math.random() - 0.5) * 12 * slot_0_31_0.shk
        slot_16_4_0 = (math.random() - 0.5) * 12 * slot_0_31_0.shk
        slot_16_5_0 = slot_0_32_0.x + slot_16_3_0
        slot_16_6_0 = slot_0_32_0.y + slot_16_4_0
        slot_16_7_0 = slot_16_5_0 + slot_0_22_0
        slot_16_8_0 = slot_16_6_0 + slot_0_23_0
        slot_0_10_0 = slot_0_10_0 + slot_16_2_0

        while slot_0_10_0 >= slot_0_11_0 do
                slot_0_42_0(slot_0_11_0, slot_16_7_0, slot_16_8_0)

                slot_0_10_0 = slot_0_10_0 - slot_0_11_0
        end

        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_5_0 - 3, slot_16_6_0 - 3, slot_16_5_0 + slot_0_20_0 + 3, slot_16_6_0 + slot_0_21_0 + 3), slot_0_18_0.shd, 14)
        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_5_0, slot_16_6_0, slot_16_5_0 + slot_0_20_0, slot_16_6_0 + slot_0_21_0), slot_0_18_0.bg, 12)
        slot_16_0_0:add_rect(slot_0_0_0.rect(slot_16_5_0, slot_16_6_0, slot_16_5_0 + slot_0_20_0, slot_16_6_0 + slot_0_21_0), slot_0_18_0.brd, 12, 1)

        slot_16_9_0 = slot_0_32_0.is and slot_0_0_0.color(45, 50, 70, 255) or slot_0_16_0(slot_0_32_0.cx, slot_0_32_0.cy, slot_16_5_0, slot_16_6_0, slot_0_20_0, 32) and slot_0_0_0.color(35, 40, 55, 255) or slot_0_0_0.color(25, 28, 40, 255)

        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_5_0, slot_16_6_0, slot_16_5_0 + slot_0_20_0, slot_16_6_0 + 32), slot_16_9_0, 12)
        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_5_0, slot_16_6_0, slot_16_5_0 + slot_0_20_0, slot_16_6_0 + 3), slot_0_18_0.hdr, 12)
        slot_0_17_0(slot_16_0_0, slot_0_13_0.bold, slot_16_5_0, slot_16_6_0, slot_0_20_0, 32, "BREAKOUT", slot_0_18_0.w)

        function slot_16_10_0(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
                slot_0_17_0(slot_16_0_0, slot_0_13_0.main, arg_17_0, arg_17_1, 120, 14, arg_17_2, slot_0_0_0.color(150, 150, 170, 255))
                slot_0_17_0(slot_16_0_0, slot_0_13_0.bold, arg_17_0, arg_17_1 + 12, 120, 16, tostring(arg_17_3), arg_17_4)
        end

        slot_16_10_0(slot_16_5_0 + 10, slot_16_6_0 + 38, "SCORE", slot_0_31_0.score, slot_0_18_0.w)
        slot_16_10_0(slot_16_5_0 + 140, slot_16_6_0 + 38, "LEVEL", slot_0_31_0.hl, slot_0_18_0.g)
        slot_0_17_0(slot_16_0_0, slot_0_13_0.main, slot_16_5_0 + 270, slot_16_6_0 + 38, 120, 14, "LIVES", slot_0_0_0.color(150, 150, 170, 255))

        for iter_16_0 = 1, 3 do
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_5_0 + 306 + (iter_16_0 - 1) * 16, slot_16_6_0 + 54, slot_16_5_0 + 316 + (iter_16_0 - 1) * 16, slot_16_6_0 + 64), iter_16_0 <= slot_0_31_0.lives and slot_0_18_0.r or slot_0_0_0.color(40, 40, 50, 255), 3)
        end

        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_7_0 - 3, slot_16_8_0 - 3, slot_16_7_0 + slot_0_24_0 + 3, slot_16_8_0 + slot_0_25_0 + 3), slot_0_18_0.gbg, 6)
        slot_16_0_0:add_rect(slot_0_0_0.rect(slot_16_7_0 - 3, slot_16_8_0 - 3, slot_16_7_0 + slot_0_24_0 + 3, slot_16_8_0 + slot_0_25_0 + 3), slot_0_0_0.color(50, 60, 100, 150), 6, 2)

        for iter_16_1, iter_16_2 in ipairs(slot_0_31_0.bricks) do
                slot_16_16_2, slot_16_17_2, slot_16_18_0, slot_16_19_1 = slot_0_38_0(iter_16_2, slot_16_7_0, slot_16_8_0)
                slot_16_20_1 = slot_0_19_0[(iter_16_2.r - 1) % #slot_0_19_0 + 1]
                slot_16_21_1 = math.floor(iter_16_2.f * 150)
                slot_16_22_0 = slot_0_14_0(slot_16_20_1[1] + slot_16_21_1, 0, 255)
                slot_16_23_0 = slot_0_14_0(slot_16_20_1[2] + slot_16_21_1, 0, 255)
                slot_16_24_0 = slot_0_14_0(slot_16_20_1[3] + slot_16_21_1, 0, 255)

                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_16_2, slot_16_17_2, slot_16_18_0, slot_16_19_1), slot_0_0_0.color(slot_16_22_0, slot_16_23_0, slot_16_24_0, 255), 3)

                slot_16_25_0 = slot_0_0_0.color(slot_0_14_0(slot_16_22_0 + 40, 0, 255), slot_0_14_0(slot_16_23_0 + 40, 0, 255), slot_0_14_0(slot_16_24_0 + 40, 0, 255), 180)
                slot_16_26_0 = slot_0_0_0.color(slot_16_22_0 * 0.6, slot_16_23_0 * 0.6, slot_16_24_0 * 0.6, 180)

                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_16_2, slot_16_17_2, slot_16_18_0, slot_16_17_2 + 2), slot_16_25_0, 2)
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_16_2, slot_16_17_2, slot_16_16_2 + 2, slot_16_19_1), slot_16_25_0, 2)
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_16_2, slot_16_19_1 - 2, slot_16_18_0, slot_16_19_1), slot_16_26_0, 2)
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_18_0 - 2, slot_16_17_2, slot_16_18_0, slot_16_19_1), slot_16_26_0, 2)

                if iter_16_2.mh > 1 then
                        slot_0_17_0(slot_16_0_0, slot_0_13_0.main, slot_16_16_2, slot_16_17_2, slot_0_28_0, slot_0_29_0, tostring(iter_16_2.h), slot_0_0_0.color(255, 255, 255, 200))
                end
        end

        if slot_0_31_0.st and not slot_0_31_0.go then
                for iter_16_3, iter_16_4 in ipairs(slot_0_31_0.balls) do
                        for iter_16_5, iter_16_6 in ipairs(iter_16_4.tr) do
                                slot_16_21_0 = math.floor(5 * iter_16_6.l * 0.8)

                                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_7_0 + iter_16_6.x - slot_16_21_0, slot_16_8_0 + iter_16_6.y - slot_16_21_0, slot_16_7_0 + iter_16_6.x + slot_16_21_0, slot_16_8_0 + iter_16_6.y + slot_16_21_0), slot_0_0_0.color(150, 200, 255, math.floor(iter_16_6.l * 120)), slot_16_21_0)
                        end

                        slot_16_16_1 = slot_16_7_0 + iter_16_4.x
                        slot_16_17_1 = slot_16_8_0 + iter_16_4.y

                        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_16_1 - 7, slot_16_17_1 - 7, slot_16_16_1 + 7, slot_16_17_1 + 7), slot_0_0_0.color(100, 180, 255, 60), 7)
                        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_16_1 - 5, slot_16_17_1 - 5, slot_16_16_1 + 5, slot_16_17_1 + 5), slot_0_0_0.color(220, 240, 255, 255), 5)
                        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_16_1 - 4, slot_16_17_1 - 4, slot_16_16_1, slot_16_17_1), slot_0_0_0.color(255, 255, 255, 180), 4)
                end

                slot_16_11_3 = slot_16_7_0 + slot_0_31_0.paddle.x
                slot_16_12_2 = slot_16_8_0 + slot_0_25_0 - 12
                slot_16_13_1 = slot_0_31_0.paddle.w

                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_11_3 - 2, slot_16_12_2 - 2, slot_16_11_3 + slot_16_13_1 + 2, slot_16_12_2 + 12), slot_0_0_0.color(60, 100, 180, 80), 6)
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_11_3, slot_16_12_2, slot_16_11_3 + slot_16_13_1, slot_16_12_2 + 10), slot_0_0_0.color(80, 140, 220, 255), 5)
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_11_3, slot_16_12_2, slot_16_11_3 + slot_16_13_1, slot_16_12_2 + 3), slot_0_0_0.color(140, 190, 255, 200), 5)
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_11_3 + slot_16_13_1 / 2 - 15, slot_16_12_2 + 2, slot_16_11_3 + slot_16_13_1 / 2 + 15, slot_16_12_2 + 8), slot_0_0_0.color(255, 255, 255, 40), 3)
        end

        for iter_16_7, iter_16_8 in ipairs(slot_0_31_0.pt) do
                if iter_16_8.y >= 0 then
                        slot_16_16_0 = math.floor(iter_16_8.x)
                        slot_16_17_0 = math.floor(iter_16_8.y)

                        if slot_16_7_0 < slot_16_16_0 and slot_16_16_0 < slot_16_7_0 + slot_0_24_0 and slot_16_8_0 < slot_16_17_0 and slot_16_17_0 < slot_16_8_0 + slot_0_25_0 then
                                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(iter_16_8.x - iter_16_8.s / 2, iter_16_8.y - iter_16_8.s / 2, iter_16_8.x + iter_16_8.s / 2, iter_16_8.y + iter_16_8.s / 2), slot_0_0_0.color(iter_16_8.c.r, iter_16_8.c.g, iter_16_8.c.b, math.floor(iter_16_8.life * 255)), math.floor(iter_16_8.s / 2))
                        end
                end
        end

        if slot_0_31_0.msg ~= "" and not slot_0_31_0.go then
                slot_16_11_2 = slot_16_7_0 + (slot_0_24_0 - 240) / 2
                slot_16_12_1 = slot_16_8_0 + slot_0_25_0 / 2 - 20

                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_11_2, slot_16_12_1, slot_16_11_2 + 240, slot_16_12_1 + 40), slot_0_0_0.color(0, 0, 0, 200), 10)

                slot_16_13_0 = slot_0_31_0.msg:find("COMBO") and slot_0_18_0.o or slot_0_31_0.msg:find("LEVEL") and slot_0_18_0.g or slot_0_18_0.w

                slot_0_17_0(slot_16_0_0, slot_0_13_0.bold, slot_16_11_2, slot_16_12_1, 240, 40, slot_0_31_0.msg, slot_16_13_0)
        end

        if slot_0_31_0.ps and not slot_0_31_0.go then
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_7_0, slot_16_8_0, slot_16_7_0 + slot_0_24_0, slot_16_8_0 + slot_0_25_0), slot_0_0_0.color(0, 0, 0, 180), 6)
                slot_0_17_0(slot_16_0_0, slot_0_13_0.bold, slot_16_7_0, slot_16_8_0, slot_0_24_0, slot_0_25_0, "PAUSED", slot_0_18_0.w)
        end

        if slot_0_31_0.go then
                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_7_0, slot_16_8_0, slot_16_7_0 + slot_0_24_0, slot_16_8_0 + slot_0_25_0), slot_0_0_0.color(0, 0, 0, 200), 6)

                slot_16_11_1 = slot_16_8_0 + slot_0_25_0 / 2 - 60

                slot_0_17_0(slot_16_0_0, slot_0_13_0.bold, slot_16_7_0, slot_16_11_1, slot_0_24_0, 40, "GAME OVER", slot_0_0_0.color(255, 80, 80, 255))

                if slot_0_31_0.score >= slot_0_31_0.hs and slot_0_31_0.score > 0 then
                        slot_0_17_0(slot_16_0_0, slot_0_13_0.bold, slot_16_7_0, slot_16_11_1 + 25, slot_0_24_0, 20, "NEW HIGH SCORE!", slot_0_18_0.o)
                end

                slot_0_17_0(slot_16_0_0, slot_0_13_0.main, slot_16_7_0, slot_16_11_1 + 50, slot_0_24_0, 20, "Final Score: " .. slot_0_31_0.score, slot_0_18_0.w)
                slot_0_17_0(slot_16_0_0, slot_0_13_0.main, slot_16_7_0, slot_16_11_1 + 70, slot_0_24_0, 20, "Level Reached: " .. slot_0_31_0.hl, slot_0_18_0.g)
                slot_0_17_0(slot_16_0_0, slot_0_13_0.main, slot_16_7_0, slot_16_11_1 + 100, slot_0_24_0, 20, "Press START to Restart", slot_0_0_0.color(180, 180, 180, 255))
        end

        slot_16_11_0 = slot_16_6_0 + slot_0_21_0 - 50
        slot_16_0_0.font = slot_0_13_0.main

        slot_16_0_0:add_text(slot_0_0_0.vec2(slot_16_5_0 + 20, slot_16_6_0 + slot_0_21_0 - 80 + 5), "Mouse: Move Paddle  |  Click/Space: Launch  |  P: Pause", slot_0_0_0.color(90, 95, 110, 255))

        function slot_16_12_0(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
                slot_0_45_0[arg_18_0] = slot_0_15_0(slot_0_45_0[arg_18_0], 0, 0.2)
                slot_0_44_0[arg_18_0] = slot_0_15_0(slot_0_44_0[arg_18_0], slot_0_16_0(slot_0_32_0.cx, slot_0_32_0.cy, slot_16_5_0 + arg_18_1, slot_16_11_0, 80, 28) and 1 or 0, 0.2)

                local var_18_0 = 1 - slot_0_45_0[arg_18_0] * 0.05
                local var_18_1 = 80 * var_18_0
                local var_18_2 = 28 * var_18_0
                local var_18_3 = slot_16_5_0 + arg_18_1 + (80 - var_18_1) / 2
                local var_18_4 = slot_16_11_0 + (28 - var_18_2) / 2
                local var_18_5 = slot_0_15_0(40, 60, slot_0_44_0[arg_18_0])
                local var_18_6 = slot_0_15_0(45, 70, slot_0_44_0[arg_18_0])
                local var_18_7 = slot_0_15_0(60, 110, slot_0_44_0[arg_18_0])

                if arg_18_0 == "s" and not arg_18_3 then
                        var_18_5, var_18_6, var_18_7 = slot_0_15_0(30, 50, slot_0_44_0[arg_18_0]), slot_0_15_0(70, 110, slot_0_44_0[arg_18_0]), slot_0_15_0(45, 70, slot_0_44_0[arg_18_0])
                end

                if arg_18_0 == "p" then
                        arg_18_2 = slot_0_31_0.ps and "RESUME" or "PAUSE"
                end

                if arg_18_0 == "s" and slot_0_31_0.st and slot_0_31_0.ps then
                        arg_18_2, var_18_5, var_18_6, var_18_7 = "RESTART", slot_0_15_0(80, 120, slot_0_44_0[arg_18_0]), slot_0_15_0(35, 55, slot_0_44_0[arg_18_0]), slot_0_15_0(35, 55, slot_0_44_0[arg_18_0])
                end

                slot_16_0_0:add_rect_filled(slot_0_0_0.rect(var_18_3, var_18_4, var_18_3 + var_18_1, var_18_4 + var_18_2), arg_18_3 and slot_0_0_0.color(25, 26, 30, 255) or slot_0_0_0.color(var_18_5, var_18_6, var_18_7, 255), 5)
                slot_16_0_0:add_rect(slot_0_0_0.rect(var_18_3, var_18_4, var_18_3 + var_18_1, var_18_4 + var_18_2), arg_18_3 and slot_0_0_0.color(40, 40, 40, 255) or slot_0_0_0.color(80, 95, 140, 255), 5, 1)
                slot_0_17_0(slot_16_0_0, slot_0_13_0.main, var_18_3, var_18_4, var_18_1, var_18_2, arg_18_2, arg_18_3 and slot_0_0_0.color(70, 75, 85, 255) or slot_0_0_0.color(245, 250, 255, 255))
        end

        slot_16_12_0("s", 20, "START", slot_0_31_0.st and not slot_0_31_0.go and not slot_0_31_0.ps)
        slot_16_12_0("p", 110, "PAUSE", not slot_0_31_0.st or slot_0_31_0.go)
        slot_16_0_0:add_rect_filled(slot_0_0_0.rect(slot_16_5_0 + 200, slot_16_11_0, slot_16_5_0 + 380, slot_16_11_0 + 28), slot_0_0_0.color(30, 35, 50, 200), 5)
        slot_16_0_0:add_rect(slot_0_0_0.rect(slot_16_5_0 + 200, slot_16_11_0, slot_16_5_0 + 380, slot_16_11_0 + 28), slot_0_0_0.color(50, 60, 80, 255), 5, 1)
        slot_0_17_0(slot_16_0_0, slot_0_13_0.main, slot_16_5_0 + 200, slot_16_11_0, 180, 14, "HI-SCORE", slot_0_0_0.color(150, 150, 170, 255))
        slot_0_17_0(slot_16_0_0, slot_0_13_0.bold, slot_16_5_0 + 200, slot_16_11_0 + 12, 180, 16, tostring(slot_0_31_0.hs), slot_0_18_0.o)
end)

function slot_0_46_0(arg_19_0)
        if arg_19_0 == "s" then
                if slot_0_31_0.go or not slot_0_31_0.st or slot_0_31_0.ps then
                        slot_0_31_0.score, slot_0_31_0.hl, slot_0_31_0.lives, slot_0_31_0.cmb, slot_0_31_0.pt, slot_0_31_0.msg, slot_0_31_0.mt = 0, 1, 3, 0, {}, "", 0

                        slot_0_39_0()
                end
        elseif arg_19_0 == "p" then
                if slot_0_31_0.st and not slot_0_31_0.go then
                        slot_0_31_0.ps = not slot_0_31_0.ps
                end
        elseif arg_19_0 == "l" and slot_0_31_0.st and not slot_0_31_0.ps and not slot_0_31_0.go and slot_0_31_0.ba then
                slot_0_31_0.ba = false
        end
end

slot_0_3_0.input:add(function(arg_20_0, arg_20_1, arg_20_2)
        local var_20_0 = slot_0_6_0.band(arg_20_2, 65535)
        local var_20_1 = slot_0_6_0.rshift(arg_20_2, 16)

        if arg_20_0 >= 512 and arg_20_0 <= 514 then
                slot_0_32_0.cx, slot_0_32_0.cy = var_20_0, var_20_1
        end

        if arg_20_0 == 512 then
                if slot_0_32_0.is then
                        slot_0_32_0.x, slot_0_32_0.y = var_20_0 - slot_0_32_0.ox, var_20_1 - slot_0_32_0.oy
                end

                if slot_0_31_0.st and not slot_0_31_0.ps and not slot_0_31_0.go then
                        slot_0_31_0.paddle.x = slot_0_14_0(var_20_0 - (slot_0_32_0.x + slot_0_22_0) - slot_0_31_0.paddle.w / 2, 0, slot_0_24_0 - slot_0_31_0.paddle.w)
                end
        elseif arg_20_0 == 513 then
                local var_20_2 = false
                local var_20_3 = slot_0_32_0.y + slot_0_21_0 - 50

                if slot_0_16_0(var_20_0, var_20_1, slot_0_32_0.x + 20, var_20_3, 80, 28) then
                        slot_0_45_0.s = 1

                        slot_0_46_0("s")

                        local var_20_4 = true
                elseif slot_0_16_0(var_20_0, var_20_1, slot_0_32_0.x + 110, var_20_3, 80, 28) then
                        slot_0_45_0.p = 1

                        slot_0_46_0("p")

                        local var_20_5 = true
                elseif slot_0_16_0(var_20_0, var_20_1, slot_0_32_0.x + slot_0_22_0, slot_0_32_0.y + slot_0_23_0, slot_0_24_0, slot_0_25_0) then
                        slot_0_46_0("l")

                        local var_20_6 = true
                elseif slot_0_16_0(var_20_0, var_20_1, slot_0_32_0.x, slot_0_32_0.y, slot_0_20_0, 32) then
                        slot_0_32_0.is, slot_0_32_0.ox, slot_0_32_0.oy = true, var_20_0 - slot_0_32_0.x, var_20_1 - slot_0_32_0.y
                end
        elseif arg_20_0 == 514 then
                slot_0_32_0.is = false
        elseif arg_20_0 == 256 then
                if arg_20_1 == 32 then
                        slot_0_46_0("l")
                elseif arg_20_1 == 80 or arg_20_1 == 27 then
                        slot_0_46_0("p")
                elseif (arg_20_1 == 37 or arg_20_1 == 39) and slot_0_31_0.st and not slot_0_31_0.ps and not slot_0_31_0.go then
                        slot_0_31_0.paddle.x = slot_0_14_0(slot_0_31_0.paddle.x + (arg_20_1 == 37 and -20 or 20), 0, slot_0_24_0 - slot_0_31_0.paddle.w)
                end
        end
end)
