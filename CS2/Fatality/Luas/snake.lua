--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = draw
slot_0_1_0 = game
slot_0_2_0 = gui
slot_0_3_0 = events
slot_0_4_0 = ffi
slot_0_5_0 = utils

function slot_0_6_0()
        local var_1_0 = slot_0_0_0 and slot_0_0_0.time or 0

        if slot_0_1_0 and slot_0_1_0.global_vars and slot_0_1_0.global_vars.realtime then
                var_1_0 = slot_0_1_0.global_vars.realtime
        end

        return tonumber(var_1_0) or 0
end

slot_0_7_0 = slot_0_6_0

if slot_0_4_0 and slot_0_4_0.cdef and slot_0_4_0.cast and slot_0_4_0.new and slot_0_5_0 and slot_0_5_0.find_export then
        slot_0_8_1 = slot_0_5_0.find_export("kernel32.dll", "QueryPerformanceCounter")
        slot_0_9_1 = slot_0_5_0.find_export("kernel32.dll", "QueryPerformanceFrequency")

        if slot_0_8_1 and slot_0_9_1 and slot_0_8_1 ~= 0 and slot_0_9_1 ~= 0 then
                slot_0_4_0.cdef("typedef struct { int64_t QuadPart; } LI; int QueryPerformanceCounter(LI* lpPC); int QueryPerformanceFrequency(LI* lpF);")

                slot_0_10_1 = slot_0_4_0.cast("int(__stdcall*)(void*)", slot_0_8_1)
                slot_0_11_1 = slot_0_4_0.cast("int(__stdcall*)(void*)", slot_0_9_1)
                slot_0_12_1 = slot_0_4_0.new("LI")
                slot_0_13_1 = slot_0_4_0.new("LI")

                if slot_0_11_1(slot_0_12_1) ~= 0 then
                        slot_0_14_1 = tonumber(slot_0_12_1.QuadPart)

                        function slot_0_7_0()
                                if slot_0_10_1(slot_0_13_1) ~= 0 then
                                        return tonumber(slot_0_13_1.QuadPart) / slot_0_14_1
                                end

                                return slot_0_6_0()
                        end
                end
        end
end

slot_0_8_0 = slot_0_7_0()
slot_0_9_0 = 0
slot_0_10_0 = 0.015625
slot_0_11_0 = 0
slot_0_12_0 = {
        bold = slot_0_0_0.fonts.gui_bold,
        main = slot_0_0_0.fonts.gui_main
}
slot_0_13_0 = {
        white = slot_0_0_0.color(240, 245, 255, 255),
        head = slot_0_0_0.color(0, 255, 150, 255),
        head_g = slot_0_0_0.color(0, 255, 150, 40),
        body = slot_0_0_0.color(0, 200, 120, 255),
        food = slot_0_0_0.color(255, 50, 80, 255),
        food_g = slot_0_0_0.color(255, 50, 80, 60),
        p_bg = slot_0_0_0.color(12, 14, 20, 250),
        p_in = slot_0_0_0.color(20, 22, 30, 255),
        bord = slot_0_0_0.color(80, 100, 255, 120),
        head_b = slot_0_0_0.color(80, 110, 255, 200),
        shad = slot_0_0_0.color(0, 0, 0, 120),
        g_bg = slot_0_0_0.color(15, 17, 25, 255),
        g_ln = slot_0_0_0.color(40, 45, 65, 80)
}
slot_0_14_0 = 20
slot_0_15_0 = 22
slot_0_16_0 = 480
slot_0_17_0 = 670
slot_0_18_0 = {
        best = 0,
        m_int = 0.15,
        shake = 0,
        started = false,
        paused = false,
        over = false,
        score = 0,
        m_timer = 0,
        snake = {
                {
                        x = 10,
                        y = 10
                },
                {
                        x = 10,
                        y = 11
                },
                {
                        x = 10,
                        y = 12
                }
        },
        d_snake = {},
        dir = {
                x = 0,
                y = -1
        },
        next_dir = {
                x = 0,
                y = -1
        },
        food = {
                x = 5,
                y = 5
        },
        particles = {}
}
slot_0_19_0 = {
        x = 100,
        oy = 0,
        ox = 0,
        active = false,
        cy = 0,
        cx = 0,
        y = 100
}

function slot_0_20_0(arg_3_0, arg_3_1)
        return slot_0_0_0.color(arg_3_0:get_r(), arg_3_0:get_g(), arg_3_0:get_b(), math.floor(arg_3_1))
end

function slot_0_21_0(arg_4_0, arg_4_1, arg_4_2)
        return arg_4_0 + (arg_4_1 - arg_4_0) * arg_4_2
end

function slot_0_22_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
        return arg_5_2 <= arg_5_0 and arg_5_0 <= arg_5_2 + arg_5_4 and arg_5_3 <= arg_5_1 and arg_5_1 <= arg_5_3 + arg_5_5
end

function slot_0_23_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
        if not arg_6_6 or arg_6_6 == "" or not arg_6_1 then
                return
        end

        local var_6_0 = arg_6_1:get_text_size(tostring(arg_6_6))
        local var_6_1 = var_6_0.x * 1.25

        arg_6_0.font = arg_6_1

        arg_6_0:add_text(slot_0_0_0.vec2(math.floor(arg_6_2 + (arg_6_4 - var_6_1) / 2), math.floor(arg_6_3 + (arg_6_5 - var_6_0.y) / 2)), tostring(arg_6_6), arg_6_7)
end

function slot_0_24_0()
        for iter_7_0 = 1, 400 do
                local var_7_0 = math.random(1, slot_0_14_0)
                local var_7_1 = math.random(1, slot_0_14_0)
                local var_7_2 = false

                for iter_7_1, iter_7_2 in ipairs(slot_0_18_0.snake) do
                        if iter_7_2.x == var_7_0 and iter_7_2.y == var_7_1 then
                                var_7_2 = true

                                break
                        end
                end

                if not var_7_2 then
                        slot_0_18_0.food = {
                                x = var_7_0,
                                y = var_7_1
                        }

                        return
                end
        end
end

function slot_0_25_0()
        slot_0_18_0.snake = {
                {
                        x = 10,
                        y = 10
                },
                {
                        x = 10,
                        y = 11
                },
                {
                        x = 10,
                        y = 12
                }
        }
        slot_0_18_0.d_snake = {}

        for iter_8_0, iter_8_1 in ipairs(slot_0_18_0.snake) do
                slot_0_18_0.d_snake[iter_8_0] = {
                        x = iter_8_1.x,
                        y = iter_8_1.y
                }
        end

        slot_0_18_0.dir, slot_0_18_0.next_dir = {
                x = 0,
                y = -1
        }, {
                x = 0,
                y = -1
        }
        slot_0_18_0.score, slot_0_18_0.over, slot_0_18_0.paused, slot_0_18_0.started, slot_0_18_0.m_timer, slot_0_18_0.m_int = 0, false, false, true, 0, 0.15

        slot_0_24_0()
end

function slot_0_26_0()
        if not slot_0_18_0.started or slot_0_18_0.paused or slot_0_18_0.over then
                return
        end

        slot_0_18_0.m_timer = slot_0_18_0.m_timer + slot_0_10_0

        if slot_0_18_0.m_timer >= slot_0_18_0.m_int then
                slot_0_18_0.m_timer, slot_0_18_0.dir = 0, slot_0_18_0.next_dir

                local var_9_0 = slot_0_18_0.snake[1]
                local var_9_1 = {
                        x = var_9_0.x + slot_0_18_0.dir.x,
                        y = var_9_0.y + slot_0_18_0.dir.y
                }

                if var_9_1.x < 1 or var_9_1.x > slot_0_14_0 or var_9_1.y < 1 or var_9_1.y > slot_0_14_0 then
                        slot_0_18_0.over, slot_0_18_0.shake = true, 0.5

                        slot_0_1_0.engine:client_cmd("play sounds/ui/menu_invalid.vsnd_c")

                        return
                end

                for iter_9_0, iter_9_1 in ipairs(slot_0_18_0.snake) do
                        if var_9_1.x == iter_9_1.x and var_9_1.y == iter_9_1.y then
                                slot_0_18_0.over, slot_0_18_0.shake = true, 0.5

                                slot_0_1_0.engine:client_cmd("play sounds/ui/menu_invalid.vsnd_c")

                                return
                        end
                end

                table.insert(slot_0_18_0.snake, 1, var_9_1)

                if var_9_1.x == slot_0_18_0.food.x and var_9_1.y == slot_0_18_0.food.y then
                        slot_0_18_0.score = slot_0_18_0.score + 10

                        if slot_0_18_0.score > slot_0_18_0.best then
                                slot_0_18_0.best = slot_0_18_0.score
                        end

                        slot_0_18_0.m_int = math.max(0.06, 0.15 - slot_0_18_0.score / 1000 * 0.1)

                        local var_9_2 = slot_0_19_0.x + 20
                        local var_9_3 = slot_0_19_0.y + 60

                        for iter_9_2 = 1, 20 do
                                table.insert(slot_0_18_0.particles, {
                                        decay = 0.03,
                                        life = 1,
                                        x = var_9_2 + (slot_0_18_0.food.x - 0.5) * slot_0_15_0,
                                        y = var_9_3 + (slot_0_18_0.food.y - 0.5) * slot_0_15_0,
                                        vx = (math.random() - 0.5) * 8,
                                        vy = (math.random() - 0.5) * 8,
                                        color = slot_0_13_0.food,
                                        size = 1 + math.random() * 3
                                })
                        end

                        slot_0_1_0.engine:client_cmd("play sounds/ui/beepclear.vsnd_c")
                        slot_0_24_0()
                else
                        table.remove(slot_0_18_0.snake)
                end
        end
end

slot_0_27_0 = slot_0_2_0.checkbox(slot_0_2_0.control_id("snake_premium_enable"))

slot_0_2_0.ctx:find("lua>elements a"):add(slot_0_2_0.make_control("Snake", slot_0_27_0))
slot_0_3_0.present_queue:add(function()
        if not slot_0_27_0:get_value():get() then
                slot_0_8_0 = 0

                return
        end

        slot_10_0_0 = slot_0_0_0.surface
        slot_10_1_0 = slot_0_7_0()

        if slot_0_8_0 == 0 then
                slot_0_8_0 = slot_10_1_0
        end

        slot_10_2_0 = slot_10_1_0 > slot_0_8_0 and math.min(0.1, slot_10_1_0 - slot_0_8_0) or 0.016
        slot_0_8_0 = slot_10_1_0
        slot_0_9_0 = slot_0_9_0 + slot_10_2_0

        while slot_0_9_0 >= slot_0_10_0 do
                slot_0_26_0()

                slot_0_9_0 = slot_0_9_0 - slot_0_10_0
        end

        slot_0_11_0 = slot_0_11_0 + slot_10_2_0
        slot_10_3_0 = slot_10_2_0 * 60
        slot_10_4_0 = math.min(1, 1 - math.exp(-18 * slot_10_2_0))

        for iter_10_0 = 1, #slot_0_18_0.snake do
                if not slot_0_18_0.d_snake[iter_10_0] then
                        slot_0_18_0.d_snake[iter_10_0] = {
                                x = slot_0_18_0.snake[iter_10_0].x,
                                y = slot_0_18_0.snake[iter_10_0].y
                        }
                end

                slot_0_18_0.d_snake[iter_10_0].x = slot_0_21_0(slot_0_18_0.d_snake[iter_10_0].x, slot_0_18_0.snake[iter_10_0].x, slot_10_4_0)
                slot_0_18_0.d_snake[iter_10_0].y = slot_0_21_0(slot_0_18_0.d_snake[iter_10_0].y, slot_0_18_0.snake[iter_10_0].y, slot_10_4_0)
        end

        if #slot_0_18_0.d_snake > #slot_0_18_0.snake then
                table.remove(slot_0_18_0.d_snake)
        end

        if slot_0_18_0.shake > 0 then
                slot_0_18_0.shake = math.max(0, slot_0_18_0.shake - slot_10_2_0 * 3)
        end

        slot_10_5_0 = 0
        slot_10_6_0 = 0

        if slot_0_18_0.shake > 0 then
                slot_10_5_0, slot_10_6_0 = (math.random() - 0.5) * 15 * slot_0_18_0.shake, (math.random() - 0.5) * 15 * slot_0_18_0.shake
        end

        slot_10_7_0 = slot_0_19_0.x + slot_10_5_0
        slot_10_8_0 = slot_0_19_0.y + slot_10_6_0

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_7_0 - 4, slot_10_8_0 - 4, slot_10_7_0 + slot_0_16_0 + 4, slot_10_8_0 + slot_0_17_0 + 4), slot_0_13_0.shad, 16)
        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_7_0, slot_10_8_0, slot_10_7_0 + slot_0_16_0, slot_10_8_0 + slot_0_17_0), slot_0_13_0.p_bg, 16)
        slot_10_0_0:add_rect(slot_0_0_0.rect(slot_10_7_0, slot_10_8_0, slot_10_7_0 + slot_0_16_0, slot_10_8_0 + slot_0_17_0), slot_0_13_0.bord, 16, 1)

        slot_10_9_0 = slot_0_22_0(slot_0_19_0.cx, slot_0_19_0.cy, slot_10_7_0, slot_10_8_0, slot_0_16_0, 40)

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_7_0, slot_10_8_0, slot_10_7_0 + slot_0_16_0, slot_10_8_0 + 40), slot_0_19_0.active and slot_0_0_0.color(50, 60, 100, 255) or slot_10_9_0 and slot_0_0_0.color(40, 45, 75, 255) or slot_0_0_0.color(25, 30, 50, 255), 16)
        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_7_0, slot_10_8_0 + 37, slot_10_7_0 + slot_0_16_0, slot_10_8_0 + 40), slot_0_13_0.head_b, 0)
        slot_0_23_0(slot_10_0_0, slot_0_12_0.bold, slot_10_7_0, slot_10_8_0, slot_0_16_0, 40, "S N A K E", slot_0_13_0.white)

        slot_10_10_0 = math.floor(slot_10_7_0 + 20)
        slot_10_11_0 = math.floor(slot_10_8_0 + 60)
        slot_10_12_0 = math.floor(slot_0_14_0 * slot_0_15_0)

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_11_0, slot_10_10_0 + slot_10_12_0, slot_10_11_0 + slot_10_12_0), slot_0_13_0.g_bg, 8)
        slot_10_0_0:add_rect(slot_0_0_0.rect(slot_10_10_0, slot_10_11_0, slot_10_10_0 + slot_10_12_0, slot_10_11_0 + slot_10_12_0), slot_0_13_0.g_ln, 8, 1)

        for iter_10_1 = 1, slot_0_14_0 - 1 do
                slot_10_17_1 = iter_10_1 * slot_0_15_0

                slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0 + slot_10_17_1, slot_10_11_0, slot_10_10_0 + slot_10_17_1 + 1, slot_10_11_0 + slot_10_12_0), slot_0_13_0.g_ln, 0)
                slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_11_0 + slot_10_17_1, slot_10_10_0 + slot_10_12_0, slot_10_11_0 + slot_10_17_1 + 1), slot_0_13_0.g_ln, 0)
        end

        slot_10_13_0 = (math.sin(slot_0_11_0 * 8) + 1) * 0.5
        slot_10_14_0 = math.floor(slot_10_10_0 + (slot_0_18_0.food.x - 1) * slot_0_15_0)
        slot_10_15_0 = math.floor(slot_10_11_0 + (slot_0_18_0.food.y - 1) * slot_0_15_0)
        slot_10_16_0 = math.floor(6 + slot_10_13_0 * 4)

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_14_0 + slot_0_15_0 / 2 - 12 - slot_10_13_0 * 4, slot_10_15_0 + slot_0_15_0 / 2 - 12 - slot_10_13_0 * 4, slot_10_14_0 + slot_0_15_0 / 2 + 12 + slot_10_13_0 * 4, slot_10_15_0 + slot_0_15_0 / 2 + 12 + slot_10_13_0 * 4), slot_0_13_0.food_g, 15)
        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_14_0 + (slot_0_15_0 - slot_10_16_0) / 2, slot_10_15_0 + (slot_0_15_0 - slot_10_16_0) / 2, slot_10_14_0 + (slot_0_15_0 + slot_10_16_0) / 2, slot_10_15_0 + (slot_0_15_0 + slot_10_16_0) / 2), slot_0_13_0.food, 4)

        for iter_10_2 = #slot_0_18_0.d_snake, 1, -1 do
                slot_10_21_1 = slot_0_18_0.d_snake[iter_10_2]
                slot_10_22_1 = slot_10_10_0 + (slot_10_21_1.x - 1) * slot_0_15_0
                slot_10_23_1 = slot_10_11_0 + (slot_10_21_1.y - 1) * slot_0_15_0
                slot_10_24_1 = iter_10_2 == 1
                slot_10_25_1 = iter_10_2 == 1 and slot_0_13_0.head or slot_0_13_0.body

                if not slot_10_24_1 then
                        slot_10_26_1 = 1 - iter_10_2 / #slot_0_18_0.snake * 0.3
                        slot_10_25_1 = slot_0_0_0.color(math.floor(slot_10_25_1:get_r() * slot_10_26_1), math.floor(slot_10_25_1:get_g() * slot_10_26_1), math.floor(slot_10_25_1:get_b() * slot_10_26_1), 255)
                end

                if slot_10_24_1 then
                        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_22_1 - 4, slot_10_23_1 - 4, slot_10_22_1 + slot_0_15_0 + 4, slot_10_23_1 + slot_0_15_0 + 4), slot_0_13_0.head_g, 10)
                end

                slot_10_26_0 = slot_10_24_1 and 2 or 3

                slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_22_1 + slot_10_26_0, slot_10_23_1 + slot_10_26_0, slot_10_22_1 + slot_0_15_0 - slot_10_26_0, slot_10_23_1 + slot_0_15_0 - slot_10_26_0), slot_10_25_1, 6)

                if iter_10_2 > 1 then
                        slot_10_27_0 = slot_0_18_0.d_snake[iter_10_2 - 1]
                        slot_10_28_0 = (slot_10_22_1 + slot_10_10_0 + (slot_10_27_0.x - 1) * slot_0_15_0) / 2
                        slot_10_29_1 = (slot_10_23_1 + slot_10_11_0 + (slot_10_27_0.y - 1) * slot_0_15_0) / 2

                        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_28_0 + 4, slot_10_29_1 + 4, slot_10_28_0 + slot_0_15_0 - 4, slot_10_29_1 + slot_0_15_0 - 4), slot_10_25_1, 2)
                end
        end

        slot_10_17_0 = math.floor(slot_10_11_0 + slot_10_12_0 + 15)
        slot_10_18_0 = slot_10_12_0

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_17_0, slot_10_10_0 + slot_10_18_0, slot_10_17_0 + 50), slot_0_13_0.p_in, 8)
        slot_10_0_0:add_rect(slot_0_0_0.rect(slot_10_10_0, slot_10_17_0, slot_10_10_0 + slot_10_18_0, slot_10_17_0 + 50), slot_0_13_0.g_ln, 8, 1)

        slot_10_19_0 = math.floor(slot_10_18_0 / 2)

        slot_0_23_0(slot_10_0_0, slot_0_12_0.main, slot_10_10_0, slot_10_17_0 + 2, slot_10_19_0, 24, "SCORE", slot_0_0_0.color(150, 160, 200, 255))
        slot_0_23_0(slot_10_0_0, slot_0_12_0.bold, slot_10_10_0, slot_10_17_0 + 22, slot_10_19_0, 24, tostring(slot_0_18_0.score), slot_0_13_0.white)
        slot_0_23_0(slot_10_0_0, slot_0_12_0.main, slot_10_10_0 + slot_10_19_0, slot_10_17_0 + 2, slot_10_19_0, 24, "BEST", slot_0_0_0.color(150, 160, 200, 255))
        slot_0_23_0(slot_10_0_0, slot_0_12_0.bold, slot_10_10_0 + slot_10_19_0, slot_10_17_0 + 22, slot_10_19_0, 24, tostring(slot_0_18_0.best), slot_0_13_0.white)

        if not slot_0_18_0.started then
                slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_11_0, slot_10_10_0 + slot_10_12_0, slot_10_11_0 + slot_10_12_0), slot_0_0_0.color(0, 0, 0, 180), 8)
                slot_0_23_0(slot_10_0_0, slot_0_12_0.bold, slot_10_10_0, slot_10_11_0, slot_10_12_0, slot_10_12_0, "READY TO PLAY?", slot_0_13_0.white)
        elseif slot_0_18_0.over then
                slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_11_0, slot_10_10_0 + slot_10_12_0, slot_10_11_0 + slot_10_12_0), slot_0_0_0.color(0, 0, 0, 200), 8)
                slot_0_23_0(slot_10_0_0, slot_0_12_0.bold, slot_10_10_0, slot_10_11_0 - 20, slot_10_12_0, slot_10_12_0, "CRASHED!", slot_0_13_0.food)
                slot_0_23_0(slot_10_0_0, slot_0_12_0.main, slot_10_10_0, slot_10_11_0 + 30, slot_10_12_0, slot_10_12_0, "Final Score: " .. slot_0_18_0.score, slot_0_13_0.white)
        elseif slot_0_18_0.paused then
                slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_11_0, slot_10_10_0 + slot_10_12_0, slot_10_11_0 + slot_10_12_0), slot_0_0_0.color(0, 0, 0, 150), 8)
                slot_0_23_0(slot_10_0_0, slot_0_12_0.bold, slot_10_10_0, slot_10_11_0, slot_10_12_0, slot_10_12_0, "P A U S E D", slot_0_13_0.white)
        end

        slot_10_20_0 = math.floor(slot_10_17_0 + 65)
        slot_10_21_0 = math.floor((slot_10_18_0 - 10) / 2)
        slot_10_22_0 = slot_0_22_0(slot_0_19_0.cx, slot_0_19_0.cy, slot_10_10_0, slot_10_20_0, slot_10_21_0, 35)

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_20_0, slot_10_10_0 + slot_10_21_0, slot_10_20_0 + 35), slot_10_22_0 and slot_0_0_0.color(60, 200, 100, 255) or slot_0_0_0.color(40, 150, 80, 255), 8)
        slot_0_23_0(slot_10_0_0, slot_0_12_0.main, slot_10_10_0, slot_10_20_0, slot_10_21_0, 35, slot_0_18_0.over and "RESTART" or "START GAME", slot_0_13_0.white)

        slot_10_23_0 = slot_10_10_0 + slot_10_21_0 + 10
        slot_10_24_0 = slot_0_22_0(slot_0_19_0.cx, slot_0_19_0.cy, slot_10_10_0 + slot_10_21_0 + 10, slot_10_20_0, slot_10_21_0, 35)

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_23_0, slot_10_20_0, slot_10_23_0 + slot_10_21_0, slot_10_20_0 + 35), slot_10_24_0 and slot_0_0_0.color(200, 180, 60, 255) or slot_0_0_0.color(150, 130, 40, 255), 8)
        slot_0_23_0(slot_10_0_0, slot_0_12_0.main, slot_10_23_0, slot_10_20_0, slot_10_21_0, 35, slot_0_18_0.paused and "RESUME" or "PAUSE", slot_0_13_0.white)

        slot_10_25_0 = slot_10_20_0 + 50

        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_10_0, slot_10_25_0, slot_10_10_0 + slot_10_18_0, slot_10_25_0 + 24), slot_0_13_0.p_in, 6)
        slot_10_0_0:add_rect(slot_0_0_0.rect(slot_10_10_0, slot_10_25_0, slot_10_10_0 + slot_10_18_0, slot_10_25_0 + 24), slot_0_13_0.g_ln, 6, 1)
        slot_0_23_0(slot_10_0_0, slot_0_12_0.main, slot_10_10_0, slot_10_25_0, slot_10_18_0, 24, "WASD / ARROWS: MOVE  |  P / ESC: PAUSE  |  SPACE: " .. (slot_0_18_0.over and "RESTART" or "START"), slot_0_0_0.color(160, 170, 210, 180))

        for iter_10_3 = #slot_0_18_0.particles, 1, -1 do
                slot_10_30_0 = slot_0_18_0.particles[iter_10_3]
                slot_10_30_0.x, slot_10_30_0.y = slot_10_30_0.x + slot_10_30_0.vx * slot_10_3_0, slot_10_30_0.y + slot_10_30_0.vy * slot_10_3_0
                slot_10_30_0.life = slot_10_30_0.life - slot_10_30_0.decay * slot_10_3_0
                slot_10_30_0.vx, slot_10_30_0.vy = slot_10_30_0.vx * (1 - 0.05 * slot_10_3_0), slot_10_30_0.vy * (1 - 0.05 * slot_10_3_0)

                if slot_10_30_0.life <= 0 then
                        table.remove(slot_0_18_0.particles, iter_10_3)
                else
                        slot_10_0_0:add_rect_filled(slot_0_0_0.rect(slot_10_30_0.x, slot_10_30_0.y, slot_10_30_0.x + slot_10_30_0.size, slot_10_30_0.y + slot_10_30_0.size), slot_0_20_0(slot_10_30_0.color, slot_10_30_0.life * 255), 2)
                end
        end
end)
slot_0_3_0.input:add(function(arg_11_0, arg_11_1, arg_11_2)
        local var_11_0 = bit.band(arg_11_2, 65535)
        local var_11_1 = bit.rshift(arg_11_2, 16)

        if arg_11_0 >= 512 and arg_11_0 <= 514 then
                slot_0_19_0.cx, slot_0_19_0.cy = var_11_0, var_11_1
        end

        if arg_11_0 == 512 and slot_0_19_0.active then
                slot_0_19_0.x, slot_0_19_0.y = var_11_0 - slot_0_19_0.ox, var_11_1 - slot_0_19_0.oy
        elseif arg_11_0 == 513 then
                if slot_0_22_0(var_11_0, var_11_1, slot_0_19_0.x, slot_0_19_0.y, slot_0_16_0, 40) then
                        slot_0_19_0.active, slot_0_19_0.ox, slot_0_19_0.oy = true, var_11_0 - slot_0_19_0.x, var_11_1 - slot_0_19_0.y
                else
                        local var_11_2 = math.floor(slot_0_19_0.y + 60 + slot_0_14_0 * slot_0_15_0 + 15 + 65)
                        local var_11_3 = math.floor((slot_0_14_0 * slot_0_15_0 - 10) / 2)
                        local var_11_4 = math.floor(slot_0_19_0.x + 20)

                        if slot_0_22_0(var_11_0, var_11_1, var_11_4, var_11_2, var_11_3, 35) then
                                slot_0_25_0()
                        elseif slot_0_22_0(var_11_0, var_11_1, var_11_4 + var_11_3 + 10, var_11_2, var_11_3, 35) and slot_0_18_0.started and not slot_0_18_0.over then
                                slot_0_18_0.paused = not slot_0_18_0.paused
                        end
                end
        elseif arg_11_0 == 514 then
                slot_0_19_0.active = false
        elseif arg_11_0 == 256 then
                if (arg_11_1 == 38 or arg_11_1 == 87) and slot_0_18_0.dir.y == 0 then
                        slot_0_18_0.next_dir = {
                                x = 0,
                                y = -1
                        }
                elseif (arg_11_1 == 40 or arg_11_1 == 83) and slot_0_18_0.dir.y == 0 then
                        slot_0_18_0.next_dir = {
                                x = 0,
                                y = 1
                        }
                elseif (arg_11_1 == 37 or arg_11_1 == 65) and slot_0_18_0.dir.x == 0 then
                        slot_0_18_0.next_dir = {
                                x = -1,
                                y = 0
                        }
                elseif (arg_11_1 == 39 or arg_11_1 == 68) and slot_0_18_0.dir.x == 0 then
                        slot_0_18_0.next_dir = {
                                x = 1,
                                y = 0
                        }
                elseif (arg_11_1 == 80 or arg_11_1 == 27) and slot_0_18_0.started and not slot_0_18_0.over then
                        slot_0_18_0.paused = not slot_0_18_0.paused
                elseif arg_11_1 == 32 then
                        if slot_0_18_0.over or not slot_0_18_0.started then
                                slot_0_25_0()
                        elseif slot_0_18_0.started then
                                slot_0_18_0.paused = not slot_0_18_0.paused
                        end
                end
        end
end)
