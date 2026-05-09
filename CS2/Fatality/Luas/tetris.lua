--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function slot_0_0_0()
        local var_1_0 = draw and draw.time or 0

        if game and game.global_vars and game.global_vars.realtime then
                var_1_0 = game.global_vars.realtime
        end

        return tonumber(var_1_0) or 0
end

slot_0_1_0 = slot_0_0_0

if ffi and ffi.cdef and ffi.cast and ffi.new and utils and utils.find_export then
        slot_0_2_1 = utils.find_export("kernel32.dll", "QueryPerformanceCounter")
        slot_0_3_1 = utils.find_export("kernel32.dll", "QueryPerformanceFrequency")

        if slot_0_2_1 and slot_0_3_1 and slot_0_2_1 ~= 0 and slot_0_3_1 ~= 0 then
                ffi.cdef("typedef struct { int64_t QuadPart; } LI; int QueryPerformanceCounter(LI* lpPC); int QueryPerformanceFrequency(LI* lpF);")

                slot_0_4_1 = ffi.cast("int(__stdcall*)(void*)", slot_0_2_1)
                slot_0_5_1 = ffi.cast("int(__stdcall*)(void*)", slot_0_3_1)
                slot_0_6_1 = ffi.new("LI")
                slot_0_7_1 = ffi.new("LI")

                if slot_0_5_1(slot_0_6_1) ~= 0 then
                        slot_0_8_1 = tonumber(slot_0_6_1.QuadPart)

                        function slot_0_1_0()
                                if slot_0_4_1(slot_0_7_1) ~= 0 then
                                        return tonumber(slot_0_7_1.QuadPart) / slot_0_8_1
                                end

                                return slot_0_0_0()
                        end
                end
        end
end

slot_0_2_0 = 0
slot_0_3_0 = slot_0_1_0()
slot_0_4_0 = {
        bold = draw.fonts.gui_bold,
        main = draw.fonts.gui_main
}

function slot_0_5_0(arg_3_0, arg_3_1)
        return draw.color(arg_3_0.r, arg_3_0.g, arg_3_0.b, math.floor(arg_3_1))
end

function slot_0_6_0(arg_4_0, arg_4_1, arg_4_2)
        return arg_4_0 + (arg_4_1 - arg_4_0) * arg_4_2
end

function slot_0_7_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
        return arg_5_2 <= arg_5_0 and arg_5_0 <= arg_5_2 + arg_5_4 and arg_5_3 <= arg_5_1 and arg_5_1 <= arg_5_3 + arg_5_5
end

function slot_0_8_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6, arg_6_7)
        if not arg_6_6 or arg_6_6 == "" or not arg_6_1 then
                return
        end

        local var_6_0 = arg_6_1:get_text_size(tostring(arg_6_6))
        local var_6_1 = var_6_0.x * 1.12
        local var_6_2 = var_6_0.y

        arg_6_0.font = arg_6_1

        arg_6_0:add_text(draw.vec2(math.floor(arg_6_2 + (arg_6_4 - var_6_1) / 2), math.floor(arg_6_3 + (arg_6_5 - var_6_2) / 2)), tostring(arg_6_6), arg_6_7)
end

slot_0_9_0 = {
        white = draw.color(255, 255, 255, 255),
        orange = draw.color(255, 180, 50, 255),
        green = draw.color(80, 255, 100, 255),
        blue = draw.color(80, 150, 255, 255),
        red = draw.color(255, 80, 80, 255),
        cyan = draw.color(0, 255, 255, 255),
        yellow = draw.color(255, 255, 0, 255),
        purple = draw.color(180, 80, 220, 255),
        panel_bg = draw.color(18, 20, 28, 245),
        border = draw.color(60, 70, 120, 150),
        header = draw.color(80, 110, 255, 180),
        shadow = draw.color(0, 0, 0, 80),
        grid_bg = draw.color(25, 27, 35, 255),
        grid_line = draw.color(35, 40, 55, 200)
}
slot_0_10_0 = {
        I = {
                b = 240,
                r = 0,
                g = 240
        },
        O = {
                b = 0,
                r = 240,
                g = 240
        },
        T = {
                b = 240,
                r = 160,
                g = 0
        },
        S = {
                b = 0,
                r = 0,
                g = 240
        },
        Z = {
                b = 0,
                r = 240,
                g = 0
        },
        J = {
                b = 240,
                r = 0,
                g = 0
        },
        L = {
                b = 0,
                r = 240,
                g = 160
        }
}
slot_0_11_0 = {
        I = {
                {
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                3,
                                1
                        }
                },
                {
                        {
                                2,
                                0
                        },
                        {
                                2,
                                1
                        },
                        {
                                2,
                                2
                        },
                        {
                                2,
                                3
                        }
                },
                {
                        {
                                0,
                                2
                        },
                        {
                                1,
                                2
                        },
                        {
                                2,
                                2
                        },
                        {
                                3,
                                2
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                2
                        },
                        {
                                1,
                                3
                        }
                }
        },
        O = {
                {
                        {
                                1,
                                0
                        },
                        {
                                2,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                2,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                2,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                2,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                }
        },
        T = {
                {
                        {
                                1,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                1,
                                2
                        }
                },
                {
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                1,
                                2
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                2
                        }
                }
        },
        S = {
                {
                        {
                                1,
                                0
                        },
                        {
                                2,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                2,
                                2
                        }
                },
                {
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                0,
                                2
                        },
                        {
                                1,
                                2
                        }
                },
                {
                        {
                                0,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                2
                        }
                }
        },
        Z = {
                {
                        {
                                0,
                                0
                        },
                        {
                                1,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                },
                {
                        {
                                2,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                1,
                                2
                        }
                },
                {
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                2
                        },
                        {
                                2,
                                2
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                0,
                                2
                        }
                }
        },
        J = {
                {
                        {
                                0,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                2,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                2
                        }
                },
                {
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                2,
                                2
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                0,
                                2
                        },
                        {
                                1,
                                2
                        }
                }
        },
        L = {
                {
                        {
                                2,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        }
                },
                {
                        {
                                1,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                2
                        },
                        {
                                2,
                                2
                        }
                },
                {
                        {
                                0,
                                1
                        },
                        {
                                1,
                                1
                        },
                        {
                                2,
                                1
                        },
                        {
                                0,
                                2
                        }
                },
                {
                        {
                                0,
                                0
                        },
                        {
                                1,
                                0
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                2
                        }
                }
        }
}
slot_0_12_0 = 10
slot_0_13_0 = 20
slot_0_14_0 = 22
slot_0_15_0 = 12
slot_0_16_0 = {
        drop_timer = 0,
        paused = false,
        started = false,
        drop_interval = 1,
        shake_timer = 0,
        score = 0,
        message_timer = 0,
        can_hold = true,
        high_score = 0,
        level = 1,
        combo = 0,
        message = "Press START to play!",
        game_over = false,
        lock_delay = 0,
        line_clear_flash = 0,
        current_y = 0,
        current_x = 3,
        current_rotation = 1,
        soft_drop = false,
        lines_cleared = 0,
        lock_delay_max = 0.5,
        last_clear_was_tetris = false,
        grid = {},
        next_pieces = {},
        particles = {}
}
slot_0_17_0 = {
        right_charged = false,
        right_timer = 0,
        left = false,
        right = false,
        left_charged = false,
        left_timer = 0,
        das_delay = 0.17,
        das_rate = 0.05
}
slot_0_18_0 = {
        off_y = 0,
        off_x = 0,
        is_dragging = false,
        cur_y = 0,
        cur_x = 0,
        panel_y = 50,
        panel_x = 50
}
slot_0_19_0 = {}
slot_0_20_0 = false

function slot_0_21_0()
        slot_0_16_0.grid = {}

        for iter_7_0 = 1, slot_0_13_0 do
                slot_0_16_0.grid[iter_7_0] = {}

                for iter_7_1 = 1, slot_0_12_0 do
                        slot_0_16_0.grid[iter_7_0][iter_7_1] = nil
                end
        end
end

function slot_0_22_0()
        slot_0_19_0 = {
                "I",
                "O",
                "T",
                "S",
                "Z",
                "J",
                "L"
        }

        for iter_8_0 = #slot_0_19_0, 2, -1 do
                local var_8_0 = math.random(iter_8_0)

                slot_0_19_0[iter_8_0], slot_0_19_0[var_8_0] = slot_0_19_0[var_8_0], slot_0_19_0[iter_8_0]
        end
end

function slot_0_23_0()
        if not slot_0_20_0 then
                local var_9_0 = math.floor(slot_0_1_0() * 1000000) + math.floor((draw.time or 0) * 100000) + math.floor(slot_0_2_0 * 10000)

                math.randomseed(var_9_0)

                for iter_9_0 = 1, 10 do
                        math.random()
                end

                slot_0_20_0 = true
        end

        if #slot_0_19_0 == 0 then
                slot_0_22_0()
        end

        return table.remove(slot_0_19_0)
end

function slot_0_24_0()
        while #slot_0_16_0.next_pieces < 3 do
                table.insert(slot_0_16_0.next_pieces, slot_0_23_0())
        end
end

slot_0_25_0 = nil
slot_0_26_0 = nil
slot_0_27_1 = nil

function slot_0_28_0()
        if #slot_0_16_0.next_pieces == 0 then
                slot_0_24_0()
        end

        slot_0_16_0.current_type = table.remove(slot_0_16_0.next_pieces, 1)
        slot_0_16_0.current_piece = slot_0_11_0[slot_0_16_0.current_type]
        slot_0_16_0.current_rotation = 1
        slot_0_16_0.current_x = 3
        slot_0_16_0.current_y = 0
        slot_0_16_0.can_hold = true
        slot_0_16_0.lock_delay = 0

        slot_0_24_0()

        if not slot_0_25_0(slot_0_16_0.current_x, slot_0_16_0.current_y, slot_0_16_0.current_rotation) then
                slot_0_16_0.game_over = true
                slot_0_16_0.message = "GAME OVER!"

                if slot_0_16_0.score > slot_0_16_0.high_score then
                        slot_0_16_0.high_score = slot_0_16_0.score
                        slot_0_16_0.message = "NEW HIGH SCORE!"
                end
        end
end

function slot_0_25_0(arg_12_0, arg_12_1, arg_12_2)
        local var_12_0 = slot_0_16_0.current_piece[arg_12_2]

        for iter_12_0, iter_12_1 in ipairs(var_12_0) do
                local var_12_1 = arg_12_0 + iter_12_1[1] + 1
                local var_12_2 = arg_12_1 + iter_12_1[2] + 1

                if var_12_1 < 1 or var_12_1 > slot_0_12_0 or var_12_2 > slot_0_13_0 then
                        return false
                end

                if var_12_2 >= 1 and slot_0_16_0.grid[var_12_2] and slot_0_16_0.grid[var_12_2][var_12_1] then
                        return false
                end
        end

        return true
end

function slot_0_29_0()
        local var_13_0 = slot_0_16_0.current_piece[slot_0_16_0.current_rotation]

        for iter_13_0, iter_13_1 in ipairs(var_13_0) do
                local var_13_1 = slot_0_16_0.current_x + iter_13_1[1] + 1
                local var_13_2 = slot_0_16_0.current_y + iter_13_1[2] + 1

                if var_13_2 >= 1 and var_13_2 <= slot_0_13_0 and var_13_1 >= 1 and var_13_1 <= slot_0_12_0 then
                        slot_0_16_0.grid[var_13_2][var_13_1] = slot_0_16_0.current_type
                end
        end

        slot_0_26_0()
        slot_0_28_0()
end

function slot_0_27_0(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
        for iter_14_0 = 1, arg_14_2 do
                local var_14_0 = arg_14_3

                if arg_14_3 == "multi" then
                        local var_14_1 = math.random(6)

                        if var_14_1 == 1 then
                                var_14_0 = {
                                        b = 50,
                                        r = 255,
                                        g = 50
                                }
                        elseif var_14_1 == 2 then
                                var_14_0 = {
                                        b = 50,
                                        r = 50,
                                        g = 255
                                }
                        elseif var_14_1 == 3 then
                                var_14_0 = {
                                        b = 255,
                                        r = 50,
                                        g = 150
                                }
                        elseif var_14_1 == 4 then
                                var_14_0 = {
                                        b = 0,
                                        r = 255,
                                        g = 215
                                }
                        elseif var_14_1 == 5 then
                                var_14_0 = {
                                        b = 255,
                                        r = 255,
                                        g = 50
                                }
                        else
                                var_14_0 = {
                                        b = 255,
                                        r = 50,
                                        g = 255
                                }
                        end
                end

                local var_14_2 = arg_14_4 or "glitter"
                local var_14_3 = {
                        life = 1,
                        x = arg_14_0,
                        y = arg_14_1,
                        color = var_14_0,
                        type = var_14_2
                }

                if var_14_2 == "firework" then
                        var_14_3.vx, var_14_3.vy = (math.random() - 0.5) * 15, (math.random() - 1.2) * 18
                        var_14_3.size, var_14_3.decay, var_14_3.fric, var_14_3.grav = 2 + math.random(3), 0.015, 0.98, 0.5
                elseif var_14_2 == "glitter" then
                        var_14_3.vx, var_14_3.vy = (math.random() - 0.5) * 8, (math.random() - 1) * 10
                        var_14_3.size, var_14_3.decay, var_14_3.fric, var_14_3.grav = 1 + math.random(2), 0.02, 0.92, 0.3
                end

                table.insert(slot_0_16_0.particles, var_14_3)
        end
end

function slot_0_26_0()
        slot_15_0_0 = {}

        for iter_15_0 = 1, slot_0_13_0 do
                slot_15_5_5 = true

                for iter_15_1 = 1, slot_0_12_0 do
                        if not slot_0_16_0.grid[iter_15_0][iter_15_1] then
                                slot_15_5_5 = false

                                break
                        end
                end

                if slot_15_5_5 then
                        table.insert(slot_15_0_0, iter_15_0)
                end
        end

        if #slot_15_0_0 > 0 then
                slot_0_16_0.line_clear_flash = 1

                for iter_15_2, iter_15_3 in ipairs(slot_15_0_0) do
                        for iter_15_4 = 1, slot_0_12_0 do
                                slot_0_27_0(slot_0_18_0.panel_x + 20 + (iter_15_4 - 1) * slot_0_14_0 + slot_0_14_0 / 2, slot_0_18_0.panel_y + 45 + (iter_15_3 - 1) * slot_0_14_0 + slot_0_14_0 / 2, 3, "multi", "glitter")
                        end
                end

                table.sort(slot_15_0_0, function(arg_16_0, arg_16_1)
                        return arg_16_1 < arg_16_0
                end)

                for iter_15_5, iter_15_6 in ipairs(slot_15_0_0) do
                        table.remove(slot_0_16_0.grid, iter_15_6)
                end

                for iter_15_7 = 1, #slot_15_0_0 do
                        slot_15_5_2 = {}

                        for iter_15_8 = 1, slot_0_12_0 do
                                slot_15_5_2[iter_15_8] = nil
                        end

                        table.insert(slot_0_16_0.grid, 1, slot_15_5_2)
                end

                slot_15_1_0 = #slot_15_0_0
                slot_0_16_0.lines_cleared = slot_0_16_0.lines_cleared + slot_15_1_0
                slot_0_16_0.combo = slot_0_16_0.combo + 1
                slot_15_2_0 = slot_0_16_0.combo * 50 * slot_0_16_0.level
                slot_15_4_0 = (({
                        100,
                        300,
                        500,
                        800
                })[slot_15_1_0] or 800) * slot_0_16_0.level

                if slot_15_1_0 == 4 then
                        if slot_0_16_0.last_clear_was_tetris then
                                slot_15_4_0 = math.floor(slot_15_4_0 * 1.5)
                                slot_0_16_0.message = "BACK-TO-BACK TETRIS!"
                        else
                                slot_0_16_0.message = "TETRIS!"
                        end

                        slot_0_16_0.message_timer = 2
                        slot_0_16_0.last_clear_was_tetris = true

                        slot_0_27_0(slot_0_18_0.panel_x + 120, slot_0_18_0.panel_y + 250, 40, "multi", "firework")
                else
                        slot_0_16_0.last_clear_was_tetris = false

                        if slot_15_1_0 >= 2 then
                                slot_15_5_1 = {
                                        "",
                                        "DOUBLE!",
                                        "TRIPLE!"
                                }
                                slot_0_16_0.message = slot_15_5_1[slot_15_1_0] or "NICE!"
                                slot_0_16_0.message_timer = 1.5
                        end
                end

                slot_0_16_0.score = slot_0_16_0.score + math.floor(slot_15_4_0) + math.floor(slot_15_2_0)
                slot_0_16_0.shake_timer = 0.2
                slot_15_5_0 = math.floor(slot_0_16_0.lines_cleared / 10) + 1

                if slot_15_5_0 > slot_0_16_0.level then
                        slot_0_16_0.level = slot_15_5_0
                        slot_0_16_0.drop_interval = math.max(0.1, 1 - (slot_0_16_0.level - 1) * 0.08)
                        slot_0_16_0.message = "LEVEL " .. slot_0_16_0.level .. "!"
                        slot_0_16_0.message_timer = 2

                        slot_0_27_0(slot_0_18_0.panel_x + 120, slot_0_18_0.panel_y + 250, 25, "multi", "firework")
                end
        else
                slot_0_16_0.combo = 0
        end
end

function slot_0_30_0(arg_17_0, arg_17_1)
        if slot_0_25_0(slot_0_16_0.current_x + arg_17_0, slot_0_16_0.current_y + arg_17_1, slot_0_16_0.current_rotation) then
                slot_0_16_0.current_x = slot_0_16_0.current_x + arg_17_0
                slot_0_16_0.current_y = slot_0_16_0.current_y + arg_17_1

                if arg_17_1 == 0 then
                        slot_0_16_0.lock_delay = 0
                end

                return true
        end

        return false
end

function slot_0_31_0(arg_18_0)
        local var_18_0 = slot_0_16_0.current_rotation + arg_18_0

        if var_18_0 > 4 then
                var_18_0 = 1
        end

        if var_18_0 < 1 then
                var_18_0 = 4
        end

        if slot_0_25_0(slot_0_16_0.current_x, slot_0_16_0.current_y, var_18_0) then
                slot_0_16_0.current_rotation = var_18_0
                slot_0_16_0.lock_delay = 0

                return true
        end

        local var_18_1 = {
                {
                        -1,
                        0
                },
                {
                        1,
                        0
                },
                {
                        0,
                        -1
                },
                {
                        -2,
                        0
                },
                {
                        2,
                        0
                }
        }

        for iter_18_0, iter_18_1 in ipairs(var_18_1) do
                if slot_0_25_0(slot_0_16_0.current_x + iter_18_1[1], slot_0_16_0.current_y + iter_18_1[2], var_18_0) then
                        slot_0_16_0.current_x = slot_0_16_0.current_x + iter_18_1[1]
                        slot_0_16_0.current_y = slot_0_16_0.current_y + iter_18_1[2]
                        slot_0_16_0.current_rotation = var_18_0
                        slot_0_16_0.lock_delay = 0

                        return true
                end
        end

        return false
end

function slot_0_32_0()
        local var_19_0 = 0

        while slot_0_30_0(0, 1) do
                var_19_0 = var_19_0 + 1
        end

        slot_0_16_0.score = slot_0_16_0.score + var_19_0 * 2

        slot_0_29_0()
end

function slot_0_33_0()
        if not slot_0_16_0.can_hold then
                return
        end

        slot_0_16_0.can_hold = false

        local var_20_0 = slot_0_16_0.hold_piece

        slot_0_16_0.hold_piece = slot_0_16_0.current_type

        if var_20_0 then
                slot_0_16_0.current_type = var_20_0
                slot_0_16_0.current_piece = slot_0_11_0[var_20_0]
                slot_0_16_0.current_rotation = 1
                slot_0_16_0.current_x = 3
                slot_0_16_0.current_y = 0

                if not slot_0_25_0(slot_0_16_0.current_x, slot_0_16_0.current_y, slot_0_16_0.current_rotation) then
                        slot_0_16_0.game_over = true
                        slot_0_16_0.message = "GAME OVER!"

                        if slot_0_16_0.score > slot_0_16_0.high_score then
                                slot_0_16_0.high_score = slot_0_16_0.score
                                slot_0_16_0.message = "NEW HIGH SCORE!"
                        end
                end
        else
                slot_0_28_0()
        end
end

function slot_0_34_0()
        local var_21_0 = slot_0_16_0.current_y

        while slot_0_25_0(slot_0_16_0.current_x, var_21_0 + 1, slot_0_16_0.current_rotation) do
                var_21_0 = var_21_0 + 1
        end

        return var_21_0
end

function slot_0_35_0(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5)
        arg_22_5 = arg_22_5 or 255

        local var_22_0 = draw.color(arg_22_4.r, arg_22_4.g, arg_22_4.b, math.floor(arg_22_5))
        local var_22_1 = draw.color(math.floor(arg_22_4.r * 0.6), math.floor(arg_22_4.g * 0.6), math.floor(arg_22_4.b * 0.6), math.floor(arg_22_5))
        local var_22_2 = draw.color(math.min(255, math.floor(arg_22_4.r * 1.3)), math.min(255, math.floor(arg_22_4.g * 1.3)), math.min(255, math.floor(arg_22_4.b * 1.3)), math.floor(arg_22_5))

        arg_22_0:add_rect_filled(draw.rect(math.floor(arg_22_1), math.floor(arg_22_2), math.floor(arg_22_1 + arg_22_3), math.floor(arg_22_2 + arg_22_3)), var_22_0, 2)
        arg_22_0:add_rect_filled(draw.rect(math.floor(arg_22_1), math.floor(arg_22_2), math.floor(arg_22_1 + arg_22_3), math.floor(arg_22_2 + 2)), var_22_2, 1)
        arg_22_0:add_rect_filled(draw.rect(math.floor(arg_22_1), math.floor(arg_22_2), math.floor(arg_22_1 + 2), math.floor(arg_22_2 + arg_22_3)), var_22_2, 1)
        arg_22_0:add_rect_filled(draw.rect(math.floor(arg_22_1 + arg_22_3 - 2), math.floor(arg_22_2), math.floor(arg_22_1 + arg_22_3), math.floor(arg_22_2 + arg_22_3)), var_22_1, 1)
        arg_22_0:add_rect_filled(draw.rect(math.floor(arg_22_1), math.floor(arg_22_2 + arg_22_3 - 2), math.floor(arg_22_1 + arg_22_3), math.floor(arg_22_2 + arg_22_3)), var_22_1, 1)
end

function slot_0_36_0(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
        if not arg_23_1 then
                return
        end

        local var_23_0 = slot_0_11_0[arg_23_1][1]
        local var_23_1 = slot_0_10_0[arg_23_1]
        local var_23_2 = 10
        local var_23_3 = 0
        local var_23_4 = 10
        local var_23_5 = 0

        for iter_23_0, iter_23_1 in ipairs(var_23_0) do
                var_23_2 = math.min(var_23_2, iter_23_1[1])
                var_23_3 = math.max(var_23_3, iter_23_1[1])
                var_23_4 = math.min(var_23_4, iter_23_1[2])
                var_23_5 = math.max(var_23_5, iter_23_1[2])
        end

        local var_23_6 = var_23_3 - var_23_2 + 1
        local var_23_7 = var_23_5 - var_23_4 + 1
        local var_23_8 = (4 - var_23_6) * arg_23_4 / 2
        local var_23_9 = (2 - var_23_7) * arg_23_4 / 2

        for iter_23_2, iter_23_3 in ipairs(var_23_0) do
                slot_0_35_0(arg_23_0, arg_23_2 + var_23_8 + (iter_23_3[1] - var_23_2) * arg_23_4, arg_23_3 + var_23_9 + (iter_23_3[2] - var_23_4) * arg_23_4, arg_23_4 - 1, var_23_1, 255)
        end
end

function slot_0_37_0(arg_24_0)
        if arg_24_0 == "start" then
                if slot_0_16_0.game_over or not slot_0_16_0.started or slot_0_16_0.paused then
                        slot_0_21_0()

                        slot_0_16_0.score, slot_0_16_0.level, slot_0_16_0.lines_cleared = 0, 1, 0
                        slot_0_16_0.game_over, slot_0_16_0.paused, slot_0_16_0.started = false, false, true
                        slot_0_16_0.drop_interval, slot_0_16_0.drop_timer, slot_0_16_0.lock_delay = 1, 0, 0
                        slot_0_16_0.hold_piece, slot_0_16_0.next_pieces = nil, {}
                        slot_0_16_0.combo, slot_0_16_0.last_clear_was_tetris = 0, false
                        slot_0_16_0.message, slot_0_16_0.message_timer, slot_0_16_0.shake_timer = "", 0, 0
                        slot_0_16_0.particles, slot_0_16_0.line_clear_flash = {}, 0
                        slot_0_19_0 = {}

                        slot_0_24_0()
                        slot_0_28_0()
                end
        elseif arg_24_0 == "pause" then
                if slot_0_16_0.started and not slot_0_16_0.game_over then
                        slot_0_16_0.paused = not slot_0_16_0.paused
                        slot_0_16_0.message = slot_0_16_0.paused and "PAUSED" or ""
                end
        elseif arg_24_0 == "left" then
                if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                        slot_0_30_0(-1, 0)
                end
        elseif arg_24_0 == "right" then
                if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                        slot_0_30_0(1, 0)
                end
        elseif arg_24_0 == "rotate_cw" then
                if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                        slot_0_31_0(1)
                end
        elseif arg_24_0 == "rotate_ccw" then
                if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                        slot_0_31_0(-1)
                end
        elseif arg_24_0 == "soft_drop" then
                if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over and slot_0_30_0(0, 1) then
                        slot_0_16_0.score = slot_0_16_0.score + 1
                end
        elseif arg_24_0 == "hard_drop" then
                if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                        slot_0_32_0()
                end
        elseif arg_24_0 == "hold" and slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                slot_0_33_0()
        end
end

slot_0_38_0 = {
        start = {
                h = 26,
                x = 0,
                y = 0,
                w = 66,
                l = "START"
        },
        pause = {
                h = 26,
                x = 77,
                y = 0,
                w = 66,
                l = "PAUSE"
        },
        hold = {
                h = 26,
                x = 154,
                y = 0,
                w = 66,
                l = "HOLD"
        },
        left = {
                h = 26,
                x = 0,
                y = 38,
                w = 47,
                l = "<"
        },
        rotate_ccw = {
                h = 26,
                x = 58,
                y = 38,
                w = 47,
                l = "CCW"
        },
        rotate_cw = {
                h = 26,
                x = 116,
                y = 38,
                w = 47,
                l = "CW"
        },
        right = {
                h = 26,
                x = 174,
                y = 38,
                w = 46,
                l = ">"
        },
        soft_drop = {
                h = 26,
                x = 0,
                y = 76,
                w = 100,
                l = "DOWN"
        },
        hard_drop = {
                h = 26,
                x = 120,
                y = 76,
                w = 100,
                l = "DROP"
        }
}
slot_0_39_0 = {}
slot_0_40_0 = {}

for iter_0_0 in pairs(slot_0_38_0) do
        slot_0_39_0[iter_0_0], slot_0_40_0[iter_0_0] = 0, 0
end

slot_0_41_0 = 390
slot_0_42_0 = 625
slot_0_43_0 = gui.checkbox(gui.control_id("tetris_enable_7E4B9A2D"))

gui.ctx:find("lua>elements a"):add(gui.make_control("Enable Tetris", slot_0_43_0))
events.present_queue:add(function()
        if not slot_0_43_0:get_value():get() then
                slot_0_3_0 = 0

                return
        end

        slot_25_0_0 = draw.surface
        slot_25_1_0 = slot_0_1_0()

        if slot_0_3_0 == 0 then
                slot_0_3_0 = slot_25_1_0
        end

        slot_25_2_0 = slot_25_1_0 > slot_0_3_0 and math.min(0.1, slot_25_1_0 - slot_0_3_0) or 0.016
        slot_0_3_0 = slot_25_1_0
        slot_0_2_0 = slot_0_2_0 + slot_25_2_0
        slot_25_3_0 = slot_0_18_0.panel_x
        slot_25_4_0 = slot_0_18_0.panel_y

        if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                slot_25_5_1 = not slot_0_25_0(slot_0_16_0.current_x, slot_0_16_0.current_y + 1, slot_0_16_0.current_rotation)
                slot_0_16_0.drop_timer = slot_0_16_0.drop_timer + slot_25_2_0

                if slot_0_16_0.drop_timer >= slot_0_16_0.drop_interval then
                        slot_0_16_0.drop_timer = slot_0_16_0.drop_timer - slot_0_16_0.drop_interval

                        if not slot_25_5_1 then
                                slot_0_30_0(0, 1)

                                slot_0_16_0.lock_delay = 0
                                slot_25_5_1 = not slot_0_25_0(slot_0_16_0.current_x, slot_0_16_0.current_y + 1, slot_0_16_0.current_rotation)
                        end
                end

                if slot_0_16_0.soft_drop and not slot_25_5_1 then
                        slot_0_16_0.soft_drop_timer = (slot_0_16_0.soft_drop_timer or 0) + slot_25_2_0
                        slot_25_6_1 = 0.03

                        while slot_25_6_1 <= slot_0_16_0.soft_drop_timer do
                                slot_0_16_0.soft_drop_timer = slot_0_16_0.soft_drop_timer - slot_25_6_1

                                if slot_0_30_0(0, 1) then
                                        slot_0_16_0.score = slot_0_16_0.score + 1
                                        slot_0_16_0.lock_delay = 0
                                        slot_25_5_1 = not slot_0_25_0(slot_0_16_0.current_x, slot_0_16_0.current_y + 1, slot_0_16_0.current_rotation)

                                        if slot_25_5_1 then
                                                break
                                        end
                                else
                                        break
                                end
                        end
                else
                        slot_0_16_0.soft_drop_timer = 0
                end

                if slot_25_5_1 then
                        slot_0_16_0.lock_delay = slot_0_16_0.lock_delay + slot_25_2_0

                        if slot_0_16_0.lock_delay >= slot_0_16_0.lock_delay_max then
                                slot_0_29_0()
                        end
                else
                        slot_0_16_0.lock_delay = 0
                end
        end

        slot_25_5_0 = slot_25_2_0 * 60

        for iter_25_0 = #slot_0_16_0.particles, 1, -1 do
                slot_25_10_1 = slot_0_16_0.particles[iter_25_0]
                slot_25_10_1.vx, slot_25_10_1.vy = slot_25_10_1.vx * (1 - (1 - slot_25_10_1.fric) * slot_25_5_0), slot_25_10_1.vy * (1 - (1 - slot_25_10_1.fric) * slot_25_5_0) + slot_25_10_1.grav * slot_25_5_0
                slot_25_10_1.x, slot_25_10_1.y, slot_25_10_1.life = slot_25_10_1.x + slot_25_10_1.vx * slot_25_5_0, slot_25_10_1.y + slot_25_10_1.vy * slot_25_5_0, slot_25_10_1.life - slot_25_10_1.decay * slot_25_5_0

                if slot_25_10_1.life <= 0 or slot_25_10_1.y > 1000 then
                        table.remove(slot_0_16_0.particles, iter_25_0)
                end
        end

        if slot_0_16_0.line_clear_flash > 0 then
                slot_0_16_0.line_clear_flash = slot_0_16_0.line_clear_flash - slot_25_2_0 * 4

                if slot_0_16_0.line_clear_flash < 0 then
                        slot_0_16_0.line_clear_flash = 0
                end
        end

        if slot_0_16_0.started and not slot_0_16_0.paused and not slot_0_16_0.game_over then
                if slot_0_17_0.left then
                        slot_0_17_0.left_timer = slot_0_17_0.left_timer + slot_25_2_0

                        if not slot_0_17_0.left_charged then
                                if slot_0_17_0.left_timer >= slot_0_17_0.das_delay then
                                        slot_0_17_0.left_charged = true
                                        slot_0_17_0.left_timer = 0

                                        slot_0_30_0(-1, 0)
                                end
                        else
                                while slot_0_17_0.left_timer >= slot_0_17_0.das_rate do
                                        slot_0_17_0.left_timer = slot_0_17_0.left_timer - slot_0_17_0.das_rate

                                        slot_0_30_0(-1, 0)
                                end
                        end
                end

                if slot_0_17_0.right then
                        slot_0_17_0.right_timer = slot_0_17_0.right_timer + slot_25_2_0

                        if not slot_0_17_0.right_charged then
                                if slot_0_17_0.right_timer >= slot_0_17_0.das_delay then
                                        slot_0_17_0.right_charged = true
                                        slot_0_17_0.right_timer = 0

                                        slot_0_30_0(1, 0)
                                end
                        else
                                while slot_0_17_0.right_timer >= slot_0_17_0.das_rate do
                                        slot_0_17_0.right_timer = slot_0_17_0.right_timer - slot_0_17_0.das_rate

                                        slot_0_30_0(1, 0)
                                end
                        end
                end
        end

        if slot_0_16_0.message_timer > 0 then
                slot_0_16_0.message_timer = slot_0_16_0.message_timer - slot_25_2_0

                if slot_0_16_0.message_timer <= 0 then
                        slot_0_16_0.message = ""
                end
        end

        slot_25_6_0 = 0
        slot_25_7_0 = 0

        if slot_0_16_0.shake_timer > 0 then
                slot_25_6_0 = (math.random() - 0.5) * 10 * slot_0_16_0.shake_timer
                slot_25_7_0 = (math.random() - 0.5) * 10 * slot_0_16_0.shake_timer
                slot_0_16_0.shake_timer = slot_0_6_0(slot_0_16_0.shake_timer, 0, 0.15 * slot_25_5_0)
        end

        slot_25_8_0 = slot_25_3_0 + slot_25_6_0
        slot_25_9_0 = slot_25_4_0 + slot_25_7_0

        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_8_0 - 2), math.floor(slot_25_9_0 - 2), math.floor(slot_25_8_0 + slot_0_41_0 + 2), math.floor(slot_25_9_0 + slot_0_42_0 + 2)), slot_0_9_0.shadow, 12)
        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_8_0), math.floor(slot_25_9_0), math.floor(slot_25_8_0 + slot_0_41_0), math.floor(slot_25_9_0 + slot_0_42_0)), slot_0_9_0.panel_bg, 12)
        slot_25_0_0:add_rect(draw.rect(math.floor(slot_25_8_0), math.floor(slot_25_9_0), math.floor(slot_25_8_0 + slot_0_41_0), math.floor(slot_25_9_0 + slot_0_42_0)), slot_0_9_0.border, 12, 1)
        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_8_0), math.floor(slot_25_9_0), math.floor(slot_25_8_0 + slot_0_41_0), math.floor(slot_25_9_0 + 3)), slot_0_9_0.header, 12)

        slot_25_10_0 = slot_0_7_0(slot_0_18_0.cur_x, slot_0_18_0.cur_y, slot_25_8_0, slot_25_9_0, slot_0_41_0, 30)

        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_8_0), math.floor(slot_25_9_0), math.floor(slot_25_8_0 + slot_0_41_0), math.floor(slot_25_9_0 + 30)), slot_0_18_0.is_dragging and draw.color(45, 50, 70, 255) or slot_25_10_0 and draw.color(35, 40, 55, 255) or draw.color(25, 28, 40, 255), 12)
        slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_8_0, slot_25_9_0, slot_0_41_0, 30, "TETRIS", slot_0_9_0.white)

        slot_25_11_0 = slot_25_8_0 + 20
        slot_25_12_0 = slot_25_9_0 + 45
        slot_25_13_0 = slot_0_12_0 * slot_0_14_0
        slot_25_14_0 = slot_0_13_0 * slot_0_14_0

        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0), math.floor(slot_25_12_0), math.floor(slot_25_11_0 + slot_25_13_0), math.floor(slot_25_12_0 + slot_25_14_0)), slot_0_9_0.grid_bg, 4)

        for iter_25_1 = 0, slot_0_12_0 do
                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0 + iter_25_1 * slot_0_14_0), math.floor(slot_25_12_0), math.floor(slot_25_11_0 + iter_25_1 * slot_0_14_0 + 1), math.floor(slot_25_12_0 + slot_25_14_0)), slot_0_9_0.grid_line, 0)
        end

        for iter_25_2 = 0, slot_0_13_0 do
                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0), math.floor(slot_25_12_0 + iter_25_2 * slot_0_14_0), math.floor(slot_25_11_0 + slot_25_13_0), math.floor(slot_25_12_0 + iter_25_2 * slot_0_14_0 + 1)), slot_0_9_0.grid_line, 0)
        end

        for iter_25_3 = 1, slot_0_13_0 do
                for iter_25_4 = 1, slot_0_12_0 do
                        slot_25_23_2 = slot_0_16_0.grid[iter_25_3] and slot_0_16_0.grid[iter_25_3][iter_25_4]

                        if slot_25_23_2 then
                                slot_25_24_3 = slot_0_10_0[slot_25_23_2]

                                slot_0_35_0(slot_25_0_0, slot_25_11_0 + (iter_25_4 - 1) * slot_0_14_0 + 2, slot_25_12_0 + (iter_25_3 - 1) * slot_0_14_0 + 2, slot_0_14_0 - 4, slot_25_24_3, 255)
                        end
                end
        end

        if slot_0_16_0.line_clear_flash > 0 then
                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0), math.floor(slot_25_12_0), math.floor(slot_25_11_0 + slot_25_13_0), math.floor(slot_25_12_0 + slot_25_14_0)), draw.color(255, 255, 255, math.floor(slot_0_16_0.line_clear_flash * 150)), 4)
        end

        if slot_0_16_0.started and not slot_0_16_0.game_over and slot_0_16_0.current_piece then
                slot_25_15_2 = slot_0_34_0()

                if slot_25_15_2 ~= slot_0_16_0.current_y then
                        slot_25_16_2 = slot_0_16_0.current_piece[slot_0_16_0.current_rotation]
                        slot_25_17_1 = slot_0_10_0[slot_0_16_0.current_type]

                        for iter_25_5, iter_25_6 in ipairs(slot_25_16_2) do
                                slot_25_23_1 = slot_0_16_0.current_x + iter_25_6[1]
                                slot_25_24_2 = slot_25_15_2 + iter_25_6[2]

                                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0 + slot_25_23_1 * slot_0_14_0 + 2), math.floor(slot_25_12_0 + slot_25_24_2 * slot_0_14_0 + 2), math.floor(slot_25_11_0 + (slot_25_23_1 + 1) * slot_0_14_0 - 3), math.floor(slot_25_12_0 + (slot_25_24_2 + 1) * slot_0_14_0 - 3)), draw.color(slot_25_17_1.r, slot_25_17_1.g, slot_25_17_1.b, 60), 2)
                        end
                end
        end

        if slot_0_16_0.started and not slot_0_16_0.game_over and slot_0_16_0.current_piece then
                slot_25_15_1 = slot_0_16_0.current_piece[slot_0_16_0.current_rotation]
                slot_25_16_1 = slot_0_10_0[slot_0_16_0.current_type]

                for iter_25_7, iter_25_8 in ipairs(slot_25_15_1) do
                        slot_25_22_1 = slot_0_16_0.current_x + iter_25_8[1]
                        slot_25_23_0 = slot_0_16_0.current_y + iter_25_8[2]

                        if slot_25_23_0 >= 0 then
                                slot_0_35_0(slot_25_0_0, slot_25_11_0 + slot_25_22_1 * slot_0_14_0 + 2, slot_25_12_0 + slot_25_23_0 * slot_0_14_0 + 2, slot_0_14_0 - 4, slot_25_16_1, 255)
                        end
                end
        end

        slot_25_15_0 = slot_25_11_0 + slot_25_13_0 + 20
        slot_25_16_0 = slot_25_12_0

        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_15_0), math.floor(slot_25_16_0), math.floor(slot_25_15_0 + 110), math.floor(slot_25_16_0 + 45)), draw.color(35, 38, 50, 220), 6)
        slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_15_0, slot_25_16_0, 110, 20, "SCORE", draw.color(150, 150, 170, 255))
        slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_15_0, slot_25_16_0 + 18, 110, 25, tostring(slot_0_16_0.score), slot_0_9_0.white)
        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_15_0), math.floor(slot_25_16_0 + 55), math.floor(slot_25_15_0 + 110), math.floor(slot_25_16_0 + 100)), draw.color(35, 38, 50, 220), 6)
        slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_15_0, slot_25_16_0 + 55, 110, 20, "LEVEL", draw.color(150, 150, 170, 255))
        slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_15_0, slot_25_16_0 + 73, 110, 25, tostring(slot_0_16_0.level), slot_0_9_0.green)
        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_15_0), math.floor(slot_25_16_0 + 110), math.floor(slot_25_15_0 + 110), math.floor(slot_25_16_0 + 155)), draw.color(35, 38, 50, 220), 6)
        slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_15_0, slot_25_16_0 + 110, 110, 20, "LINES", draw.color(150, 150, 170, 255))
        slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_15_0, slot_25_16_0 + 128, 110, 25, tostring(slot_0_16_0.lines_cleared), slot_0_9_0.blue)
        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_15_0), math.floor(slot_25_16_0 + 165), math.floor(slot_25_15_0 + 110), math.floor(slot_25_16_0 + 210)), draw.color(35, 38, 50, 220), 6)
        slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_15_0, slot_25_16_0 + 165, 110, 20, "HI-SCORE", draw.color(150, 150, 170, 255))
        slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_15_0, slot_25_16_0 + 183, 110, 25, tostring(slot_0_16_0.high_score), slot_0_9_0.orange)
        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_15_0), math.floor(slot_25_16_0 + 220), math.floor(slot_25_15_0 + 110), math.floor(slot_25_16_0 + 345)), draw.color(35, 38, 50, 220), 6)
        slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_15_0, slot_25_16_0 + 220, 110, 20, "NEXT", draw.color(150, 150, 170, 255))

        for iter_25_9, iter_25_10 in ipairs(slot_0_16_0.next_pieces) do
                slot_0_36_0(slot_25_0_0, iter_25_10, slot_25_15_0 + 25, slot_25_16_0 + 245 + (iter_25_9 - 1) * 38, slot_0_15_0)
        end

        slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_15_0), math.floor(slot_25_16_0 + 355), math.floor(slot_25_15_0 + 110), math.floor(slot_25_16_0 + 420)), draw.color(35, 38, 50, 220), 6)
        slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_15_0, slot_25_16_0 + 355, 110, 20, "HOLD", draw.color(150, 150, 170, 255))

        if slot_0_16_0.hold_piece then
                slot_0_36_0(slot_25_0_0, slot_0_16_0.hold_piece, slot_25_15_0 + 25, slot_25_16_0 + 375, slot_0_15_0)
        end

        slot_25_17_0 = slot_25_16_0 + 430
        slot_25_0_0.font = slot_0_4_0.main
        slot_25_18_0 = draw.color(100, 105, 120, 255)

        slot_25_0_0:add_text(draw.vec2(math.floor(slot_25_15_0), math.floor(slot_25_17_0)), "CONTROLS:", draw.color(150, 150, 170, 255))
        slot_25_0_0:add_text(draw.vec2(math.floor(slot_25_15_0), math.floor(slot_25_17_0 + 16)), "< > Move", slot_25_18_0)
        slot_25_0_0:add_text(draw.vec2(math.floor(slot_25_15_0), math.floor(slot_25_17_0 + 30)), "Up  Rotate", slot_25_18_0)
        slot_25_0_0:add_text(draw.vec2(math.floor(slot_25_15_0), math.floor(slot_25_17_0 + 44)), "Dn  Soft Drop", slot_25_18_0)
        slot_25_0_0:add_text(draw.vec2(math.floor(slot_25_15_0), math.floor(slot_25_17_0 + 58)), "Spc Hard Drop", slot_25_18_0)
        slot_25_0_0:add_text(draw.vec2(math.floor(slot_25_15_0), math.floor(slot_25_17_0 + 72)), "C   Hold", slot_25_18_0)
        slot_25_0_0:add_text(draw.vec2(math.floor(slot_25_15_0), math.floor(slot_25_17_0 + 86)), "P   Pause", slot_25_18_0)

        slot_25_19_0 = slot_25_8_0 + 20
        slot_25_20_0 = slot_25_12_0 + slot_25_14_0 + 15

        for iter_25_11, iter_25_12 in pairs(slot_0_38_0) do
                slot_25_26_0 = slot_25_19_0 + iter_25_12.x
                slot_25_27_0 = slot_25_20_0 + iter_25_12.y
                slot_25_28_0 = slot_0_40_0[iter_25_11]
                slot_25_29_0 = slot_0_39_0[iter_25_11]
                slot_0_40_0[iter_25_11] = slot_0_6_0(slot_25_28_0, 0, 0.2 * slot_25_5_0)
                slot_0_39_0[iter_25_11] = slot_0_6_0(slot_25_29_0, slot_0_7_0(slot_0_18_0.cur_x, slot_0_18_0.cur_y, slot_25_26_0, slot_25_27_0, iter_25_12.w, iter_25_12.h) and 1 or 0, 0.2 * slot_25_5_0)
                slot_25_30_0 = false

                if iter_25_11 == "start" then
                        slot_25_30_0 = slot_0_16_0.started and not slot_0_16_0.game_over and not slot_0_16_0.paused
                elseif iter_25_11 ~= "pause" then
                        slot_25_30_0 = not slot_0_16_0.started or slot_0_16_0.paused or slot_0_16_0.game_over
                end

                slot_25_31_0 = 1 - slot_25_28_0 * 0.05
                slot_25_32_0 = iter_25_12.w * slot_25_31_0
                slot_25_33_0 = iter_25_12.h * slot_25_31_0
                slot_25_34_0 = slot_25_26_0 + (iter_25_12.w - slot_25_32_0) / 2
                slot_25_35_0 = slot_25_27_0 + (iter_25_12.h - slot_25_33_0) / 2
                slot_25_36_0 = slot_0_6_0(40, 60, slot_0_39_0[iter_25_11])
                slot_25_37_0 = slot_0_6_0(45, 70, slot_0_39_0[iter_25_11])
                slot_25_38_0 = slot_0_6_0(60, 110, slot_0_39_0[iter_25_11])

                if iter_25_11 == "start" and not slot_25_30_0 then
                        slot_25_36_0, slot_25_37_0, slot_25_38_0 = slot_0_6_0(30, 45, slot_0_39_0[iter_25_11]), slot_0_6_0(70, 100, slot_0_39_0[iter_25_11]), slot_0_6_0(45, 65, slot_0_39_0[iter_25_11])
                elseif iter_25_11 == "hard_drop" and not slot_25_30_0 then
                        slot_25_36_0, slot_25_37_0, slot_25_38_0 = slot_0_6_0(70, 100, slot_0_39_0[iter_25_11]), slot_0_6_0(40, 60, slot_0_39_0[iter_25_11]), slot_0_6_0(35, 50, slot_0_39_0[iter_25_11])
                end

                slot_25_39_0 = iter_25_12.l
                slot_25_40_0 = false

                if iter_25_11 == "pause" then
                        slot_25_39_0 = slot_0_16_0.paused and "RESUME" or "PAUSE"
                elseif iter_25_11 == "start" then
                        if slot_0_16_0.started and slot_0_16_0.paused and not slot_0_16_0.game_over then
                                slot_25_39_0 = "RESTART"
                                slot_25_40_0 = true
                        else
                                slot_25_39_0 = "START"
                        end
                end

                if slot_25_40_0 and not slot_25_30_0 then
                        slot_25_36_0, slot_25_37_0, slot_25_38_0 = slot_0_6_0(80, 120, slot_0_39_0[iter_25_11]), slot_0_6_0(30, 45, slot_0_39_0[iter_25_11]), slot_0_6_0(30, 45, slot_0_39_0[iter_25_11])
                end

                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_34_0), math.floor(slot_25_35_0), math.floor(slot_25_34_0 + slot_25_32_0), math.floor(slot_25_35_0 + slot_25_33_0)), slot_25_30_0 and draw.color(25, 26, 30, 255) or draw.color(math.floor(slot_25_36_0 * (1 - slot_25_28_0 * 0.3)), math.floor(slot_25_37_0 * (1 - slot_25_28_0 * 0.3)), math.floor(slot_25_38_0 * (1 - slot_25_28_0 * 0.3)), 255), 4)
                slot_25_0_0:add_rect(draw.rect(math.floor(slot_25_34_0), math.floor(slot_25_35_0), math.floor(slot_25_34_0 + slot_25_32_0), math.floor(slot_25_35_0 + slot_25_33_0)), slot_25_30_0 and draw.color(40, 40, 40, 255) or draw.color(80, 90, 130, 255), 4, 1)
                slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_34_0, slot_25_35_0, slot_25_32_0, slot_25_33_0, slot_25_39_0, slot_25_30_0 and draw.color(70, 75, 85, 255) or draw.color(240, 245, 255, 255))
        end

        if slot_0_16_0.message ~= "" then
                slot_25_21_2 = slot_25_12_0 + slot_25_14_0 / 2 - 20
                slot_25_22_0 = slot_0_9_0.white

                if slot_0_16_0.message:find("TETRIS") then
                        slot_25_22_0 = slot_0_9_0.cyan
                elseif slot_0_16_0.message:find("LEVEL") then
                        slot_25_22_0 = slot_0_9_0.green
                elseif slot_0_16_0.message:find("DOUBLE") or slot_0_16_0.message:find("TRIPLE") then
                        slot_25_22_0 = slot_0_9_0.yellow
                end

                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0 + 10), math.floor(slot_25_21_2), math.floor(slot_25_11_0 + slot_25_13_0 - 10), math.floor(slot_25_21_2 + 40)), draw.color(0, 0, 0, 180), 8)
                slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_11_0, slot_25_21_2, slot_25_13_0, 40, slot_0_16_0.message, slot_25_22_0)
        end

        if slot_0_16_0.game_over then
                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0), math.floor(slot_25_12_0), math.floor(slot_25_11_0 + slot_25_13_0), math.floor(slot_25_12_0 + slot_25_14_0)), draw.color(0, 0, 0, 200), 4)

                slot_25_21_1 = slot_25_12_0 + slot_25_14_0 / 2 - 50

                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0 + 10), math.floor(slot_25_21_1), math.floor(slot_25_11_0 + slot_25_13_0 - 10), math.floor(slot_25_21_1 + 100)), draw.color(70, 30, 35, 250), 10)
                slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_11_0, slot_25_21_1, slot_25_13_0, 50, "GAME OVER", slot_0_9_0.white)
                slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_11_0, slot_25_21_1 + 50, slot_25_13_0, 25, "Score: " .. slot_0_16_0.score, slot_0_9_0.white)
                slot_0_8_0(slot_25_0_0, slot_0_4_0.main, slot_25_11_0, slot_25_21_1 + 75, slot_25_13_0, 25, "Press START", slot_0_9_0.white)
        end

        if slot_0_16_0.paused then
                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0), math.floor(slot_25_12_0), math.floor(slot_25_11_0 + slot_25_13_0), math.floor(slot_25_12_0 + slot_25_14_0)), draw.color(0, 0, 0, 180), 4)

                slot_25_21_0 = slot_25_12_0 + slot_25_14_0 / 2 - 25

                slot_25_0_0:add_rect_filled(draw.rect(math.floor(slot_25_11_0 + 20), math.floor(slot_25_21_0), math.floor(slot_25_11_0 + slot_25_13_0 - 20), math.floor(slot_25_21_0 + 50)), draw.color(60, 60, 70, 250), 10)
                slot_0_8_0(slot_25_0_0, slot_0_4_0.bold, slot_25_11_0, slot_25_21_0, slot_25_13_0, 50, "PAUSED", slot_0_9_0.white)
        end

        for iter_25_13, iter_25_14 in ipairs(slot_0_16_0.particles) do
                slot_25_0_0:add_rect_filled(draw.rect(math.floor(iter_25_14.x), math.floor(iter_25_14.y), math.floor(iter_25_14.x + iter_25_14.size), math.floor(iter_25_14.y + iter_25_14.size)), slot_0_5_0(iter_25_14.color, iter_25_14.life * 255), 1)
        end

        slot_25_0_0:add_rect(draw.rect(math.floor(slot_25_11_0), math.floor(slot_25_12_0), math.floor(slot_25_11_0 + slot_25_13_0), math.floor(slot_25_12_0 + slot_25_14_0)), draw.color(80, 90, 130, 255), 4, 3)
end)
events.input:add(function(arg_26_0, arg_26_1, arg_26_2)
        local var_26_0 = bit.band(arg_26_2, 65535)
        local var_26_1 = bit.rshift(arg_26_2, 16)

        if arg_26_0 >= 512 and arg_26_0 <= 514 then
                slot_0_18_0.cur_x, slot_0_18_0.cur_y = var_26_0, var_26_1
        end

        if arg_26_0 == 512 then
                if slot_0_18_0.is_dragging then
                        slot_0_18_0.panel_x, slot_0_18_0.panel_y = var_26_0 - slot_0_18_0.off_x, var_26_1 - slot_0_18_0.off_y
                end
        elseif arg_26_0 == 513 then
                local var_26_2 = false
                local var_26_3 = slot_0_18_0.panel_x + 20
                local var_26_4 = slot_0_18_0.panel_y + 45 + slot_0_13_0 * slot_0_14_0 + 15

                for iter_26_0, iter_26_1 in pairs(slot_0_38_0) do
                        if slot_0_7_0(var_26_0, var_26_1, var_26_3 + iter_26_1.x, var_26_4 + iter_26_1.y, iter_26_1.w, iter_26_1.h) then
                                slot_0_40_0[iter_26_0] = 1

                                slot_0_37_0(iter_26_0)

                                var_26_2 = true

                                break
                        end
                end

                if not var_26_2 and slot_0_7_0(var_26_0, var_26_1, slot_0_18_0.panel_x, slot_0_18_0.panel_y, slot_0_41_0, 30) then
                        slot_0_18_0.is_dragging, slot_0_18_0.off_x, slot_0_18_0.off_y = true, var_26_0 - slot_0_18_0.panel_x, var_26_1 - slot_0_18_0.panel_y
                end
        elseif arg_26_0 == 514 then
                slot_0_18_0.is_dragging = false
        elseif arg_26_0 == 256 then
                if arg_26_1 == 37 then
                        slot_0_17_0.left = true
                        slot_0_17_0.left_timer = 0
                        slot_0_17_0.left_charged = false

                        slot_0_37_0("left")
                elseif arg_26_1 == 39 then
                        slot_0_17_0.right = true
                        slot_0_17_0.right_timer = 0
                        slot_0_17_0.right_charged = false

                        slot_0_37_0("right")
                elseif arg_26_1 == 38 then
                        slot_0_37_0("rotate_cw")
                elseif arg_26_1 == 40 then
                        slot_0_16_0.soft_drop = true
                        slot_0_16_0.soft_drop_timer = 0.03
                elseif arg_26_1 == 32 then
                        slot_0_37_0("hard_drop")
                elseif arg_26_1 == 90 then
                        slot_0_37_0("rotate_ccw")
                elseif arg_26_1 == 88 then
                        slot_0_37_0("rotate_cw")
                elseif arg_26_1 == 67 or arg_26_1 == 16 then
                        slot_0_37_0("hold")
                elseif arg_26_1 == 80 or arg_26_1 == 27 then
                        slot_0_37_0("pause")
                end
        elseif arg_26_0 == 257 then
                if arg_26_1 == 40 then
                        slot_0_16_0.soft_drop = false
                elseif arg_26_1 == 37 then
                        slot_0_17_0.left = false
                        slot_0_17_0.left_timer = 0
                        slot_0_17_0.left_charged = false
                elseif arg_26_1 == 39 then
                        slot_0_17_0.right = false
                        slot_0_17_0.right_timer = 0
                        slot_0_17_0.right_charged = false
                end
        end
end)
slot_0_21_0()
