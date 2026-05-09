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

slot_0_2_0 = slot_0_1_0()

math.randomseed(slot_0_2_0 * 1000)

slot_0_3_0 = {
        bold = draw.fonts.gui_bold,
        main = draw.fonts.gui_main
}
slot_0_4_0 = {
        bg = draw.color(187, 173, 160, 255),
        empty = draw.color(205, 193, 180, 255),
        text_dark = draw.color(119, 110, 101, 255),
        text_light = draw.color(249, 246, 242, 255),
        window_bg = draw.color(12, 14, 20, 250),
        window_border = draw.color(80, 100, 255, 120),
        header_glow = draw.color(80, 110, 255, 200),
        white = draw.color(255, 255, 255, 255),
        shadow = draw.color(0, 0, 0, 120),
        overlay = draw.color(0, 0, 0, 180)
}
slot_0_5_0 = {
        [2] = draw.color(238, 228, 218, 255),
        [4] = draw.color(237, 224, 200, 255),
        [8] = draw.color(242, 177, 121, 255),
        [16] = draw.color(245, 149, 99, 255),
        [32] = draw.color(246, 124, 95, 255),
        [64] = draw.color(246, 94, 59, 255),
        [128] = draw.color(237, 207, 114, 255),
        [256] = draw.color(237, 204, 97, 255),
        [512] = draw.color(237, 200, 80, 255),
        [1024] = draw.color(237, 197, 63, 255),
        [2048] = draw.color(237, 194, 46, 255),
        [4096] = draw.color(160, 200, 160, 255),
        [8192] = draw.color(100, 150, 100, 255)
}
slot_0_6_0 = 4
slot_0_7_0 = 400
slot_0_8_0 = 590
slot_0_9_0 = 80
slot_0_10_0 = 10
slot_0_11_0 = {
        over = false,
        score = 0,
        best = 0,
        score_pulse = 0,
        started = false,
        won = false,
        grid = {},
        anim_tiles = {}
}
slot_0_12_0 = {
        active = false,
        cy = 0,
        cx = 0,
        y = 200,
        x = 200,
        oy = 0,
        ox = 0
}

function slot_0_13_0(arg_3_0, arg_3_1, arg_3_2)
        return arg_3_0 + (arg_3_1 - arg_3_0) * arg_3_2
end

function slot_0_14_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
        return arg_4_2 <= arg_4_0 and arg_4_0 <= arg_4_2 + arg_4_4 and arg_4_3 <= arg_4_1 and arg_4_1 <= arg_4_3 + arg_4_5
end

function slot_0_15_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5, arg_5_6, arg_5_7)
        if not arg_5_6 or arg_5_6 == "" or not arg_5_1 then
                return
        end

        arg_5_0.font = arg_5_1

        local var_5_0 = arg_5_1:get_text_size(tostring(arg_5_6))

        arg_5_0:add_text(draw.vec2(math.floor(arg_5_2 + (arg_5_4 - var_5_0.x) / 2), math.floor(arg_5_3 + (arg_5_5 - var_5_0.y) / 2)), tostring(arg_5_6), arg_5_7)
end

function slot_0_16_0()
        local var_6_0 = {}

        for iter_6_0 = 1, slot_0_6_0 do
                for iter_6_1 = 1, slot_0_6_0 do
                        if slot_0_11_0.grid[iter_6_0][iter_6_1] == 0 then
                                table.insert(var_6_0, {
                                        r = iter_6_0,
                                        c = iter_6_1
                                })
                        end
                end
        end

        if #var_6_0 > 0 then
                local var_6_1 = var_6_0[math.random(#var_6_0)]
                local var_6_2 = math.random() < 0.9 and 2 or 4

                slot_0_11_0.grid[var_6_1.r][var_6_1.c] = var_6_2

                table.insert(slot_0_11_0.anim_tiles, {
                        scale = 0,
                        r = var_6_1.r,
                        c = var_6_1.c,
                        vx = var_6_1.c,
                        vy = var_6_1.r,
                        val = var_6_2
                })
        end
end

function slot_0_17_0()
        slot_0_11_0.grid, slot_0_11_0.anim_tiles = {}, {}

        for iter_7_0 = 1, slot_0_6_0 do
                slot_0_11_0.grid[iter_7_0] = {
                        0,
                        0,
                        0,
                        0
                }
        end

        slot_0_11_0.score, slot_0_11_0.over, slot_0_11_0.won, slot_0_11_0.started, slot_0_11_0.score_pulse = 0, false, false, true, 0

        slot_0_16_0()
        slot_0_16_0()
end

function slot_0_18_0()
        for iter_8_0 = 1, slot_0_6_0 do
                for iter_8_1 = 1, slot_0_6_0 do
                        if slot_0_11_0.grid[iter_8_0][iter_8_1] == 0 then
                                return true
                        end

                        local var_8_0 = slot_0_11_0.grid[iter_8_0][iter_8_1]

                        if iter_8_0 < slot_0_6_0 and slot_0_11_0.grid[iter_8_0 + 1][iter_8_1] == var_8_0 or iter_8_1 < slot_0_6_0 and slot_0_11_0.grid[iter_8_0][iter_8_1 + 1] == var_8_0 then
                                return true
                        end
                end
        end

        return false
end

function slot_0_19_0(arg_9_0)
        if slot_0_11_0.over or not slot_0_11_0.started then
                return
        end

        local var_9_0 = false
        local var_9_1 = {}
        local var_9_2 = 0
        local var_9_3 = 0
        local var_9_4 = 1
        local var_9_5 = slot_0_6_0
        local var_9_6 = 1
        local var_9_7 = 1
        local var_9_8 = slot_0_6_0
        local var_9_9 = 1

        for iter_9_0 = 1, slot_0_6_0 do
                var_9_1[iter_9_0] = {
                        0,
                        0,
                        0,
                        0
                }
        end

        if arg_9_0 == "up" then
                var_9_2, var_9_6 = -1, 1
        elseif arg_9_0 == "down" then
                var_9_2, var_9_4, var_9_5, var_9_6 = 1, slot_0_6_0, 1, -1
        elseif arg_9_0 == "left" then
                var_9_3, var_9_9 = -1, 1
        elseif arg_9_0 == "right" then
                var_9_3, var_9_7, var_9_8, var_9_9 = 1, slot_0_6_0, 1, -1
        end

        local var_9_10 = {}
        local var_9_11 = {}

        local function var_9_12(arg_10_0, arg_10_1)
                for iter_10_0, iter_10_1 in ipairs(slot_0_11_0.anim_tiles) do
                        if not iter_10_1.dying and math.floor(iter_10_1.r + 0.5) == arg_10_0 and math.floor(iter_10_1.c + 0.5) == arg_10_1 then
                                return iter_10_1.vx, iter_10_1.vy, iter_10_1.scale
                        end
                end

                return arg_10_1, arg_10_0, 1
        end

        for iter_9_1 = var_9_4, var_9_5, var_9_6 do
                for iter_9_2 = var_9_7, var_9_8, var_9_9 do
                        if slot_0_11_0.grid[iter_9_1][iter_9_2] ~= 0 then
                                local var_9_13 = slot_0_11_0.grid[iter_9_1][iter_9_2]
                                local var_9_14 = iter_9_1 + var_9_2
                                local var_9_15 = iter_9_2 + var_9_3
                                local var_9_16 = iter_9_1
                                local var_9_17 = iter_9_2
                                local var_9_18

                                while var_9_14 >= 1 and var_9_14 <= slot_0_6_0 and var_9_15 >= 1 and var_9_15 <= slot_0_6_0 do
                                        if var_9_1[var_9_14][var_9_15] == 0 then
                                                var_9_16, var_9_17 = var_9_14, var_9_15
                                                var_9_14, var_9_15 = var_9_16 + var_9_2, var_9_17 + var_9_3
                                        else
                                                if var_9_1[var_9_14][var_9_15] == var_9_13 and not var_9_10[var_9_14 .. "," .. var_9_15] then
                                                        var_9_16, var_9_17, var_9_18 = var_9_14, var_9_15, true
                                                end

                                                break
                                        end

                                        if false then
                                                break
                                        end
                                end

                                local var_9_19, var_9_20, var_9_21 = var_9_12(iter_9_1, iter_9_2)

                                if var_9_16 ~= iter_9_1 or var_9_17 ~= iter_9_2 then
                                        var_9_0 = true

                                        if var_9_18 then
                                                var_9_1[var_9_16][var_9_17], var_9_10[var_9_16 .. "," .. var_9_17] = var_9_13 * 2, true
                                                slot_0_11_0.score, slot_0_11_0.score_pulse = slot_0_11_0.score + var_9_13 * 2, 1

                                                if var_9_13 * 2 == 2048 then
                                                        slot_0_11_0.won = true
                                                end

                                                table.insert(var_9_11, {
                                                        dying = true,
                                                        r = var_9_16,
                                                        c = var_9_17,
                                                        vx = var_9_19,
                                                        vy = var_9_20,
                                                        val = var_9_13,
                                                        scale = var_9_21
                                                })
                                                table.insert(var_9_11, {
                                                        scale = 0,
                                                        bump = 1.2,
                                                        r = var_9_16,
                                                        c = var_9_17,
                                                        vx = var_9_17,
                                                        vy = var_9_16,
                                                        val = var_9_13 * 2
                                                })
                                        else
                                                var_9_1[var_9_16][var_9_17] = var_9_13

                                                table.insert(var_9_11, {
                                                        r = var_9_16,
                                                        c = var_9_17,
                                                        vx = var_9_19,
                                                        vy = var_9_20,
                                                        val = var_9_13,
                                                        scale = var_9_21
                                                })
                                        end
                                else
                                        var_9_1[iter_9_1][iter_9_2] = var_9_13

                                        table.insert(var_9_11, {
                                                r = iter_9_1,
                                                c = iter_9_2,
                                                vx = var_9_19,
                                                vy = var_9_20,
                                                val = var_9_13,
                                                scale = var_9_21
                                        })
                                end
                        end
                end
        end

        if var_9_0 then
                slot_0_11_0.grid, slot_0_11_0.anim_tiles = var_9_1, var_9_11

                if slot_0_11_0.score > slot_0_11_0.best then
                        slot_0_11_0.best = slot_0_11_0.score
                end

                slot_0_16_0()

                slot_0_11_0.over = not slot_0_18_0()
        end
end

slot_0_20_0 = gui.checkbox(gui.control_id("2048_enable"))

gui.ctx:find("lua>elements a"):add(gui.make_control("2048 Game", slot_0_20_0))
events.present_queue:add(function()
        if not slot_0_20_0:get_value():get() then
                slot_0_2_0 = 0

                return
        end

        slot_11_0_0 = draw.surface
        slot_11_1_0 = slot_0_1_0()
        slot_11_2_0 = math.min(0.1, slot_11_1_0 - slot_0_2_0)
        slot_0_2_0 = slot_11_1_0

        if slot_11_2_0 <= 0 then
                return
        end

        slot_11_3_0 = 1 - math.exp(-18 * slot_11_2_0)
        slot_11_4_0 = slot_0_12_0.x
        slot_11_5_0 = slot_0_12_0.y

        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0 - 4, slot_11_5_0 - 4, slot_11_4_0 + slot_0_7_0 + 4, slot_11_5_0 + slot_0_8_0 + 4), slot_0_4_0.shadow, 16)
        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0, slot_11_5_0, slot_11_4_0 + slot_0_7_0, slot_11_5_0 + slot_0_8_0), slot_0_4_0.window_bg, 16)
        slot_11_0_0:add_rect(draw.rect(slot_11_4_0, slot_11_5_0, slot_11_4_0 + slot_0_7_0, slot_11_5_0 + slot_0_8_0), slot_0_4_0.window_border, 16, 1)

        slot_11_6_0 = slot_0_14_0(slot_0_12_0.cx, slot_0_12_0.cy, slot_11_4_0, slot_11_5_0, slot_0_7_0, 40)

        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0, slot_11_5_0, slot_11_4_0 + slot_0_7_0, slot_11_5_0 + 40), slot_0_12_0.active and draw.color(50, 60, 100, 255) or slot_11_6_0 and draw.color(40, 45, 75, 255) or draw.color(25, 30, 50, 255), 16)
        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0, slot_11_5_0 + 37, slot_11_4_0 + slot_0_7_0, slot_11_5_0 + 40), slot_0_4_0.header_glow, 0)
        slot_0_15_0(slot_11_0_0, slot_0_3_0.bold, slot_11_4_0, slot_11_5_0, slot_0_7_0, 40, "2 0 4 8", slot_0_4_0.white)

        slot_11_7_0 = slot_11_5_0 + 55
        slot_11_8_0 = (slot_0_7_0 - 40) / 2
        slot_0_11_0.score_pulse = slot_0_13_0(slot_0_11_0.score_pulse, 0, slot_11_3_0)
        slot_11_9_0 = math.floor(slot_0_11_0.score_pulse * 3)

        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0 + 15 - slot_11_9_0, slot_11_7_0 - slot_11_9_0, slot_11_4_0 + 15 + slot_11_8_0 + slot_11_9_0, slot_11_7_0 + 50 + slot_11_9_0), slot_0_4_0.bg, 8)
        slot_0_15_0(slot_11_0_0, slot_0_3_0.main, slot_11_4_0 + 15, slot_11_7_0 + 5, slot_11_8_0, 20, "SCORE", slot_0_4_0.text_light)
        slot_0_15_0(slot_11_0_0, slot_0_3_0.bold, slot_11_4_0 + 15, slot_11_7_0 + 25, slot_11_8_0, 20, tostring(slot_0_11_0.score), slot_0_4_0.white)
        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0 + 25 + slot_11_8_0, slot_11_7_0, slot_11_4_0 + 25 + slot_11_8_0 * 2, slot_11_7_0 + 50), slot_0_4_0.bg, 8)
        slot_0_15_0(slot_11_0_0, slot_0_3_0.main, slot_11_4_0 + 25 + slot_11_8_0, slot_11_7_0 + 5, slot_11_8_0, 20, "BEST", slot_0_4_0.text_light)
        slot_0_15_0(slot_11_0_0, slot_0_3_0.bold, slot_11_4_0 + 25 + slot_11_8_0, slot_11_7_0 + 25, slot_11_8_0, 20, tostring(slot_0_11_0.best), slot_0_4_0.white)

        slot_11_10_0 = slot_11_4_0 + 15
        slot_11_11_0 = slot_11_7_0 + 65
        slot_11_12_0 = slot_0_7_0 - 30

        slot_11_0_0:add_rect_filled(draw.rect(slot_11_10_0, slot_11_11_0, slot_11_10_0 + slot_11_12_0, slot_11_11_0 + slot_11_12_0), slot_0_4_0.bg, 10)

        for iter_11_0 = 1, slot_0_6_0 do
                for iter_11_1 = 1, slot_0_6_0 do
                        slot_11_21_1 = slot_11_10_0 + slot_0_10_0 + (iter_11_1 - 1) * (slot_0_9_0 + slot_0_10_0)
                        slot_11_22_1 = slot_11_11_0 + slot_0_10_0 + (iter_11_0 - 1) * (slot_0_9_0 + slot_0_10_0)

                        slot_11_0_0:add_rect_filled(draw.rect(slot_11_21_1, slot_11_22_1, slot_11_21_1 + slot_0_9_0, slot_11_22_1 + slot_0_9_0), slot_0_4_0.empty, 6)
                end
        end

        for iter_11_2 = #slot_0_11_0.anim_tiles, 1, -1 do
                slot_11_17_1 = slot_0_11_0.anim_tiles[iter_11_2]
                slot_11_17_1.vx, slot_11_17_1.vy = slot_0_13_0(slot_11_17_1.vx, slot_11_17_1.c, slot_11_3_0), slot_0_13_0(slot_11_17_1.vy, slot_11_17_1.r, slot_11_3_0)
                slot_11_17_1.scale = slot_0_13_0(slot_11_17_1.scale, slot_11_17_1.dying and 0 or 1, slot_11_3_0)

                if slot_11_17_1.bump then
                        slot_11_17_1.bump = slot_0_13_0(slot_11_17_1.bump, 1, slot_11_3_0)

                        if slot_11_17_1.bump < 1.01 then
                                slot_11_17_1.bump = nil
                        end
                end

                if slot_11_17_1.dying and slot_11_17_1.scale < 0.01 then
                        table.remove(slot_0_11_0.anim_tiles, iter_11_2)
                end
        end

        for iter_11_3 = 1, #slot_0_11_0.anim_tiles do
                slot_11_17_0 = slot_0_11_0.anim_tiles[iter_11_3]
                slot_11_18_0 = slot_11_10_0 + slot_0_10_0 + (slot_11_17_0.vx - 1) * (slot_0_9_0 + slot_0_10_0)
                slot_11_19_0 = slot_11_11_0 + slot_0_10_0 + (slot_11_17_0.vy - 1) * (slot_0_9_0 + slot_0_10_0)
                slot_11_20_0 = slot_11_17_0.scale * (slot_11_17_0.bump or 1)

                if slot_11_20_0 > 0.001 then
                        slot_11_21_0 = slot_0_9_0 * (1 - slot_11_20_0) / 2
                        slot_11_22_0 = slot_0_5_0[slot_11_17_0.val] or draw.color(60, 58, 50, 255)

                        slot_11_0_0:add_rect_filled(draw.rect(slot_11_18_0 + slot_11_21_0, slot_11_19_0 + slot_11_21_0, slot_11_18_0 + slot_0_9_0 - slot_11_21_0, slot_11_19_0 + slot_0_9_0 - slot_11_21_0), slot_11_22_0, 6)

                        if slot_11_20_0 > 0.4 then
                                slot_0_15_0(slot_11_0_0, slot_11_17_0.val >= 1024 and slot_0_3_0.main or slot_0_3_0.bold, slot_11_18_0, slot_11_19_0, slot_0_9_0, slot_0_9_0, tostring(slot_11_17_0.val), slot_11_17_0.val <= 4 and slot_0_4_0.text_dark or slot_0_4_0.text_light)
                        end
                end
        end

        slot_11_13_0 = slot_11_11_0 + slot_11_12_0 + 15

        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0 + 15, slot_11_13_0, slot_11_4_0 + slot_0_7_0 - 15, slot_11_13_0 + 30), draw.color(20, 22, 30, 255), 8)
        slot_0_15_0(slot_11_0_0, slot_0_3_0.main, slot_11_4_0 + 15, slot_11_13_0, slot_0_7_0 - 30, 30, "WASD / ARROWS: MOVE  |  SPACE: RESET", draw.color(160, 170, 210, 180))

        slot_11_14_0 = slot_11_13_0 + 40
        slot_11_15_0 = slot_0_7_0 - 30
        slot_11_16_0 = slot_0_14_0(slot_0_12_0.cx, slot_0_12_0.cy, slot_11_4_0 + 15, slot_11_14_0, slot_11_15_0, 35)

        slot_11_0_0:add_rect_filled(draw.rect(slot_11_4_0 + 15, slot_11_14_0, slot_11_4_0 + 15 + slot_11_15_0, slot_11_14_0 + 35), slot_11_16_0 and draw.color(60, 200, 100, 255) or draw.color(40, 150, 80, 255), 8)
        slot_0_15_0(slot_11_0_0, slot_0_3_0.main, slot_11_4_0 + 15, slot_11_14_0, slot_11_15_0, 35, slot_0_11_0.started and (slot_0_11_0.over and "RESTART" or "NEW GAME") or "START PLAYING", slot_0_4_0.white)

        if not slot_0_11_0.started then
                slot_11_0_0:add_rect_filled(draw.rect(slot_11_10_0, slot_11_11_0, slot_11_10_0 + slot_11_12_0, slot_11_11_0 + slot_11_12_0), slot_0_4_0.overlay, 10)
                slot_0_15_0(slot_11_0_0, slot_0_3_0.bold, slot_11_10_0, slot_11_11_0, slot_11_12_0, slot_11_12_0, "CLICK BOARD TO START", slot_0_4_0.white)
        elseif slot_0_11_0.won then
                slot_11_0_0:add_rect_filled(draw.rect(slot_11_10_0, slot_11_11_0, slot_11_10_0 + slot_11_12_0, slot_11_11_0 + slot_11_12_0), slot_0_4_0.overlay, 10)
                slot_0_15_0(slot_11_0_0, slot_0_3_0.bold, slot_11_10_0, slot_11_11_0, slot_11_12_0, slot_11_12_0 - 40, "2048 REACHED!", slot_0_4_0.white)
                slot_0_15_0(slot_11_0_0, slot_0_3_0.main, slot_11_10_0, slot_11_11_0 + 40, slot_11_12_0, slot_11_12_0, "Keep going for higher scores!", slot_0_4_0.white)
        elseif slot_0_11_0.over then
                slot_11_0_0:add_rect_filled(draw.rect(slot_11_10_0, slot_11_11_0, slot_11_10_0 + slot_11_12_0, slot_11_11_0 + slot_11_12_0), slot_0_4_0.overlay, 10)
                slot_0_15_0(slot_11_0_0, slot_0_3_0.bold, slot_11_10_0, slot_11_11_0, slot_11_12_0, slot_11_12_0, "GAME OVER! CLICK BOARD", slot_0_4_0.white)
        end
end)
events.input:add(function(arg_12_0, arg_12_1, arg_12_2)
        local var_12_0 = bit.band(arg_12_2, 65535)
        local var_12_1 = bit.rshift(arg_12_2, 16)

        if arg_12_0 >= 512 and arg_12_0 <= 514 then
                slot_0_12_0.cx, slot_0_12_0.cy = var_12_0, var_12_1
        end

        if arg_12_0 == 512 and slot_0_12_0.active then
                slot_0_12_0.x, slot_0_12_0.y = var_12_0 - slot_0_12_0.ox, var_12_1 - slot_0_12_0.oy
        elseif arg_12_0 == 513 then
                if slot_0_14_0(var_12_0, var_12_1, slot_0_12_0.x, slot_0_12_0.y, slot_0_7_0, 40) then
                        slot_0_12_0.active, slot_0_12_0.ox, slot_0_12_0.oy = true, var_12_0 - slot_0_12_0.x, var_12_1 - slot_0_12_0.y
                else
                        local var_12_2 = slot_0_12_0.x + 15
                        local var_12_3 = slot_0_12_0.y + 120
                        local var_12_4 = slot_0_7_0 - 30

                        if (not slot_0_11_0.started or slot_0_11_0.over) and slot_0_14_0(var_12_0, var_12_1, var_12_2, var_12_3, var_12_4, var_12_4) or slot_0_14_0(var_12_0, var_12_1, var_12_2, var_12_3 + var_12_4 + 55, var_12_4, 35) then
                                slot_0_17_0()
                        end
                end
        elseif arg_12_0 == 514 then
                slot_0_12_0.active = false
        elseif arg_12_0 == 256 then
                if arg_12_1 == 38 or arg_12_1 == 87 then
                        slot_0_19_0("up")
                elseif arg_12_1 == 40 or arg_12_1 == 83 then
                        slot_0_19_0("down")
                elseif arg_12_1 == 37 or arg_12_1 == 65 then
                        slot_0_19_0("left")
                elseif arg_12_1 == 39 or arg_12_1 == 68 then
                        slot_0_19_0("right")
                elseif arg_12_1 == 32 then
                        slot_0_17_0()
                end
        end
end)
