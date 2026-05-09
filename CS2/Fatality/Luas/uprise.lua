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

slot_0_9_0 = {
        b = slot_0_0_0.fonts.gui_bold,
        m = slot_0_0_0.fonts.gui_main
}
slot_0_10_0 = 340
slot_0_11_0 = 560
slot_0_12_0 = 60
slot_0_13_0 = 10
slot_0_14_0 = 10
slot_0_15_0 = {
        h = 0,
        s = 0,
        a = false,
        t = 0,
        lt = 0,
        d = false,
        cy = 0,
        p = {
                vy = 0,
                x = 170,
                y = 400
        },
        platforms = {},
        pt = {},
        pos = {
                x = 400,
                y = 200
        }
}

function slot_0_16_0(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
        return slot_0_0_0.color(arg_3_0, arg_3_1, arg_3_2, arg_3_3 or 255)
end

function slot_0_17_0(arg_4_0, arg_4_1, arg_4_2)
        return arg_4_0 + (arg_4_1 - arg_4_0) * arg_4_2
end

function slot_0_18_0()
        slot_0_15_0.p = {
                vy = -13,
                x = 170,
                y = 500
        }
        slot_0_15_0.platforms = {}
        slot_0_15_0.pt = {}
        slot_0_15_0.cy = 0
        slot_0_15_0.s = 0
        slot_0_15_0.d = false
        slot_0_15_0.a = true
        slot_0_15_0.t = 0
        slot_0_15_0.lt = slot_0_8_0()

        table.insert(slot_0_15_0.platforms, {
                t = 0,
                x = 140,
                y = 540
        })

        for iter_5_0 = 1, 20 do
                local var_5_0 = 540

                for iter_5_1, iter_5_2 in ipairs(slot_0_15_0.platforms) do
                        if var_5_0 > iter_5_2.y then
                                var_5_0 = iter_5_2.y
                        end
                end

                table.insert(slot_0_15_0.platforms, {
                        x = math.random(10, slot_0_10_0 - slot_0_12_0 - 10),
                        y = var_5_0 - math.random(75, 100),
                        t = math.random() > 0.88 and 1 or 0
                })
        end
end

function slot_0_19_0(arg_6_0)
        if not slot_0_15_0.a or slot_0_15_0.d then
                return
        end

        slot_6_1_0 = math.min(arg_6_0, 0.1) * 60
        slot_0_15_0.t = slot_0_15_0.t + arg_6_0
        slot_0_15_0.p.vy = slot_0_15_0.p.vy + 0.43 * slot_6_1_0

        if slot_0_15_0.p.vy > 15 then
                slot_0_15_0.p.vy = 15
        end

        slot_0_15_0.p.y = slot_0_15_0.p.y + slot_0_15_0.p.vy * slot_6_1_0

        if slot_0_15_0.p.y < slot_0_15_0.cy + 240 then
                slot_0_15_0.cy = slot_0_17_0(slot_0_15_0.cy, slot_0_15_0.p.y - 240, 0.2 * slot_6_1_0)
        end

        if slot_0_15_0.p.x < 0 then
                slot_0_15_0.p.x = slot_0_10_0
        elseif slot_0_15_0.p.x > slot_0_10_0 then
                slot_0_15_0.p.x = 0
        end

        if slot_0_15_0.p.vy > 0 then
                for iter_6_0 = #slot_0_15_0.platforms, 1, -1 do
                        slot_6_6_1 = slot_0_15_0.platforms[iter_6_0]

                        if slot_0_15_0.p.y + slot_0_14_0 >= slot_6_6_1.y and slot_0_15_0.p.y - slot_0_14_0 <= slot_6_6_1.y + slot_0_13_0 and slot_0_15_0.p.x >= slot_6_6_1.x - 5 and slot_0_15_0.p.x <= slot_6_6_1.x + slot_0_12_0 + 5 then
                                slot_0_15_0.p.vy = -12.5
                                slot_0_15_0.p.y = slot_6_6_1.y - slot_0_14_0

                                if slot_6_6_1.t == 1 then
                                        table.remove(slot_0_15_0.platforms, iter_6_0)

                                        for iter_6_1 = 1, 6 do
                                                table.insert(slot_0_15_0.pt, {
                                                        l = 0.8,
                                                        x = slot_0_15_0.p.x,
                                                        y = slot_0_15_0.p.y,
                                                        vx = (math.random() - 0.5) * 8,
                                                        vy = (math.random() - 0.5) * 8,
                                                        c = slot_0_16_0(255, 100, 100)
                                                })
                                        end

                                        break
                                end

                                for iter_6_2 = 1, 3 do
                                        table.insert(slot_0_15_0.pt, {
                                                l = 0.5,
                                                x = slot_0_15_0.p.x,
                                                y = slot_0_15_0.p.y,
                                                vx = (math.random() - 0.5) * 4,
                                                vy = (math.random() - 0.5) * 4,
                                                c = slot_0_16_0(100, 200, 255, 150)
                                        })
                                end

                                break
                        end
                end
        end

        for iter_6_3 = #slot_0_15_0.platforms, 1, -1 do
                if slot_0_15_0.platforms[iter_6_3].y > slot_0_15_0.cy + slot_0_11_0 + 100 then
                        table.remove(slot_0_15_0.platforms, iter_6_3)
                end
        end

        slot_6_2_0 = slot_0_15_0.cy

        for iter_6_4, iter_6_5 in ipairs(slot_0_15_0.platforms) do
                if slot_6_2_0 > iter_6_5.y then
                        slot_6_2_0 = iter_6_5.y
                end
        end

        while slot_6_2_0 > slot_0_15_0.cy - 200 do
                slot_6_3_1 = slot_6_2_0 - math.random(80, 105)

                table.insert(slot_0_15_0.platforms, {
                        x = math.random(10, slot_0_10_0 - slot_0_12_0 - 10),
                        y = slot_6_3_1,
                        t = math.random() > 0.88 and 1 or 0
                })

                slot_6_2_0 = slot_6_3_1
        end

        slot_6_3_0 = math.floor(math.max(0, -slot_0_15_0.cy / 12))

        if slot_6_3_0 > slot_0_15_0.s then
                slot_0_15_0.s = slot_6_3_0
        end

        for iter_6_6 = #slot_0_15_0.pt, 1, -1 do
                slot_6_8_0 = slot_0_15_0.pt[iter_6_6]
                slot_6_8_0.x, slot_6_8_0.y, slot_6_8_0.l = slot_6_8_0.x + slot_6_8_0.vx * slot_6_1_0, slot_6_8_0.y + slot_6_8_0.vy * slot_6_1_0, slot_6_8_0.l - 0.02 * slot_6_1_0

                if slot_6_8_0.l <= 0 then
                        table.remove(slot_0_15_0.pt, iter_6_6)
                end
        end

        if slot_0_15_0.p.y > slot_0_15_0.cy + slot_0_11_0 + 20 then
                slot_0_15_0.d = true

                if slot_0_15_0.s > slot_0_15_0.h then
                        slot_0_15_0.h = slot_0_15_0.s
                end
        end
end

slot_0_20_0 = slot_0_2_0.checkbox(slot_0_2_0.control_id("uprise_prod"))

slot_0_2_0.ctx:find("lua>elements a"):add(slot_0_2_0.make_control("Enable UPRISE", slot_0_20_0))
slot_0_3_0.present_queue:add(function()
        if not slot_0_20_0:get_value():get() then
                slot_0_15_0.lt = 0

                return
        end

        slot_7_0_0 = slot_0_0_0.surface
        slot_7_1_0 = slot_0_8_0()

        if slot_0_15_0.lt == 0 then
                slot_0_15_0.lt = slot_7_1_0
        end

        slot_7_2_0 = slot_7_1_0 > slot_0_15_0.lt and math.min(0.1, slot_7_1_0 - slot_0_15_0.lt) or 0.016
        slot_0_15_0.lt = slot_7_1_0

        slot_0_19_0(slot_7_2_0)

        slot_7_3_0 = math.floor(slot_0_15_0.pos.x)
        slot_7_4_0 = math.floor(slot_0_15_0.pos.y)

        slot_7_0_0:add_rect_filled(slot_0_0_0.rect(slot_7_3_0, slot_7_4_0, slot_7_3_0 + slot_0_10_0, slot_7_4_0 + slot_0_11_0), slot_0_16_0(10, 12, 16, 255), 14)
        slot_7_0_0:add_rect(slot_0_0_0.rect(slot_7_3_0, slot_7_4_0, slot_7_3_0 + slot_0_10_0, slot_7_4_0 + slot_0_11_0), slot_0_16_0(45, 50, 70), 14, 1)
        slot_7_0_0:add_rect_filled(slot_0_0_0.rect(slot_7_3_0, slot_7_4_0, slot_7_3_0 + slot_0_10_0, slot_7_4_0 + 40), slot_0_16_0(20, 24, 32), 14)

        slot_7_0_0.font = slot_0_9_0.b

        slot_7_0_0:add_text(slot_0_0_0.vec2(slot_7_3_0 + 15, slot_7_4_0 + 11), "UPRISE", slot_0_16_0(255, 255, 255))

        slot_7_0_0.font = slot_0_9_0.m
        slot_7_5_0 = "SCORE: " .. math.floor(slot_0_15_0.s)
        slot_7_6_0 = "BEST: " .. math.floor(slot_0_15_0.h)
        slot_7_7_0 = slot_7_0_0.font:get_text_size(slot_7_5_0)
        slot_7_8_0 = slot_7_0_0.font:get_text_size(slot_7_6_0)

        slot_7_0_0:add_text(slot_0_0_0.vec2(slot_7_3_0 + slot_0_10_0 - slot_7_7_0.x - 25, slot_7_4_0 + 5), slot_7_5_0, slot_0_16_0(255, 255, 255, 200))
        slot_7_0_0:add_text(slot_0_0_0.vec2(slot_7_3_0 + slot_0_10_0 - slot_7_8_0.x - 25, slot_7_4_0 + 21), slot_7_6_0, slot_0_16_0(140, 160, 180, 140))

        slot_7_9_0 = slot_0_15_0.cy % 60

        for iter_7_0 = 0, 10 do
                slot_7_14_3 = slot_7_4_0 + iter_7_0 * 60 - slot_7_9_0

                if slot_7_14_3 > slot_7_4_0 + 40 and slot_7_14_3 < slot_7_4_0 + slot_0_11_0 then
                        slot_7_0_0:add_rect_filled(slot_0_0_0.rect(slot_7_3_0 + 2, slot_7_14_3, slot_7_3_0 + slot_0_10_0 - 2, slot_7_14_3 + 1), slot_0_16_0(255, 255, 255, 5), 0)
                end
        end

        function slot_7_10_0(arg_8_0, arg_8_1)
                return slot_7_3_0 + arg_8_0, slot_7_4_0 + (arg_8_1 - slot_0_15_0.cy)
        end

        for iter_7_1, iter_7_2 in ipairs(slot_0_15_0.pt) do
                slot_7_16_1, slot_7_17_1 = slot_7_10_0(iter_7_2.x, iter_7_2.y)

                if slot_7_17_1 > slot_7_4_0 + 40 and slot_7_17_1 < slot_7_4_0 + slot_0_11_0 then
                        slot_7_0_0:add_circle_filled(slot_0_0_0.vec2(slot_7_16_1, slot_7_17_1), 2, iter_7_2.c, 4)
                end
        end

        for iter_7_3, iter_7_4 in ipairs(slot_0_15_0.platforms) do
                slot_7_16_0, slot_7_17_0 = slot_7_10_0(iter_7_4.x, iter_7_4.y)

                if slot_7_17_0 > slot_7_4_0 + 40 and slot_7_17_0 < slot_7_4_0 + slot_0_11_0 then
                        slot_7_0_0:add_rect_filled(slot_0_0_0.rect(slot_7_16_0, slot_7_17_0, slot_7_16_0 + slot_0_12_0, slot_7_17_0 + slot_0_13_0), iter_7_4.t == 1 and slot_0_16_0(220, 80, 80) or slot_0_16_0(60, 180, 120), 5)
                        slot_7_0_0:add_rect(slot_0_0_0.rect(slot_7_16_0, slot_7_17_0, slot_7_16_0 + slot_0_12_0, slot_7_17_0 + slot_0_13_0), slot_0_16_0(255, 255, 255, 30), 5, 1)
                end
        end

        if slot_0_15_0.a and not slot_0_15_0.d then
                slot_7_11_1, slot_7_12_1 = slot_7_10_0(slot_0_15_0.p.x, slot_0_15_0.p.y)
                slot_7_13_1 = math.sin(slot_0_15_0.t * 10) * 2

                slot_7_0_0:add_circle_filled(slot_0_0_0.vec2(slot_7_11_1, slot_7_12_1), math.floor(slot_0_14_0 + slot_7_13_1), slot_0_16_0(0, 180, 255, 120), 16)
                slot_7_0_0:add_circle_filled(slot_0_0_0.vec2(slot_7_11_1, slot_7_12_1), slot_0_14_0, slot_0_16_0(255, 255, 255), 16)
                slot_7_0_0:add_circle(slot_0_0_0.vec2(slot_7_11_1, slot_7_12_1), slot_0_14_0 + 1, slot_0_16_0(0, 180, 255), 16, 1)
        end

        if not slot_0_15_0.a or slot_0_15_0.d then
                slot_7_0_0:add_rect_filled(slot_0_0_0.rect(slot_7_3_0, slot_7_4_0 + 40, slot_7_3_0 + slot_0_10_0, slot_7_4_0 + slot_0_11_0), slot_0_16_0(0, 0, 0, 210), 14)

                slot_7_11_0 = not slot_0_15_0.a and "READY TO ASCEND?" or "ASCENSION FAILED"
                slot_7_0_0.font = slot_0_9_0.b
                slot_7_12_0 = slot_7_0_0.font:get_text_size(slot_7_11_0)

                slot_7_0_0:add_text(slot_0_0_0.vec2(slot_7_3_0 + (slot_0_10_0 - slot_7_12_0.x) / 2, slot_7_4_0 + slot_0_11_0 / 2 - 15), slot_7_11_0, not slot_0_15_0.a and slot_0_16_0(255, 255, 255) or slot_0_16_0(255, 70, 70))

                slot_7_0_0.font = slot_0_9_0.m
                slot_7_13_0 = "Click anywhere to Play"
                slot_7_14_0 = slot_7_0_0.font:get_text_size(slot_7_13_0)

                slot_7_0_0:add_text(slot_0_0_0.vec2(slot_7_3_0 + (slot_0_10_0 - slot_7_14_0.x) / 2, slot_7_4_0 + slot_0_11_0 / 2 + 20), slot_7_13_0, slot_0_16_0(180, 180, 180))
        end
end)

slot_0_21_0 = {
        oy = 0,
        ox = 0,
        a = false
}

slot_0_3_0.input:add(function(arg_9_0, arg_9_1, arg_9_2)
        if not slot_0_20_0:get_value():get() then
                return
        end

        local var_9_0 = slot_0_6_0.band(arg_9_2, 65535)
        local var_9_1 = slot_0_6_0.rshift(arg_9_2, 16)

        if arg_9_0 == 512 then
                if slot_0_15_0.a and not slot_0_15_0.d then
                        local var_9_2 = math.max(10, math.min(slot_0_10_0 - 10, var_9_0 - slot_0_15_0.pos.x))

                        slot_0_15_0.p.x = slot_0_17_0(slot_0_15_0.p.x, var_9_2, 0.28)
                end

                if slot_0_21_0.a then
                        slot_0_15_0.pos.x, slot_0_15_0.pos.y = var_9_0 - slot_0_21_0.ox, var_9_1 - slot_0_21_0.oy
                end
        elseif arg_9_0 == 513 then
                if var_9_0 >= slot_0_15_0.pos.x and var_9_0 <= slot_0_15_0.pos.x + slot_0_10_0 and var_9_1 >= slot_0_15_0.pos.y and var_9_1 <= slot_0_15_0.pos.y + 40 then
                        slot_0_21_0.a, slot_0_21_0.ox, slot_0_21_0.oy = true, var_9_0 - slot_0_15_0.pos.x, var_9_1 - slot_0_15_0.pos.y
                elseif not slot_0_15_0.a or slot_0_15_0.d then
                        slot_0_18_0()
                end
        elseif arg_9_0 == 514 then
                slot_0_21_0.a = false
        end
end)
