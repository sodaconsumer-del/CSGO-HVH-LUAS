--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        bold = draw.fonts.gui_bold,
        main = draw.fonts.gui_main
}
slot_0_1_0 = {
        window_bg = draw.color(18, 20, 28, 250),
        header_bg = draw.color(22, 24, 32, 255),
        header_hover = draw.color(28, 32, 45, 255),
        header_drag = draw.color(35, 40, 60, 255),
        toolbar_bg = draw.color(22, 24, 32, 255),
        toolbar_border = draw.color(40, 45, 65, 100),
        btn_bg = draw.color(28, 30, 42, 255),
        btn_hover = draw.color(40, 45, 70, 255),
        btn_active = draw.color(70, 90, 180, 255),
        btn_active_bar = draw.color(100, 140, 255, 255),
        control_bg = draw.color(25, 28, 40, 255),
        control_hover = draw.color(55, 65, 110, 255),
        text_primary = draw.color(240, 245, 255, 255),
        text_secondary = draw.color(140, 150, 180, 200),
        accent = draw.color(90, 120, 255, 255),
        border = draw.color(70, 90, 200, 100),
        resize_idle = draw.color(80, 100, 220, 140),
        resize_hover = draw.color(100, 130, 255, 200),
        resize_grip = draw.color(160, 180, 255, 200),
        canvas_bg = draw.color(255, 255, 255, 255),
        canvas_border = draw.color(50, 55, 80, 180),
        shadow = draw.color(0, 0, 0, 180)
}
slot_0_2_0 = {
        toolbar_w = 95,
        header_h = 38,
        resize_size = 18
}
slot_0_3_0 = {
        tool = "brush",
        brush_size = 3,
        canvas_h = 450,
        canvas_w = 600,
        min_canvas_h = 400,
        min_canvas_w = 400,
        strokes = {},
        brush_color = draw.color(0, 0, 0, 255)
}
slot_0_4_0 = {
        y = 100,
        cy = 0,
        cx = 0,
        is_drawing = false,
        start_h = 450,
        start_w = 600,
        resizing = false,
        oy = 0,
        ox = 0,
        x = 100,
        active = false
}
slot_0_5_0 = {
        {
                g = 0,
                b = 0,
                r = 0
        },
        {
                g = 50,
                b = 50,
                r = 255
        },
        {
                g = 255,
                b = 50,
                r = 50
        },
        {
                g = 100,
                b = 255,
                r = 50
        },
        {
                g = 255,
                b = 50,
                r = 255
        },
        {
                g = 50,
                b = 255,
                r = 255
        },
        {
                g = 255,
                b = 255,
                r = 50
        },
        {
                g = 160,
                b = 50,
                r = 255
        },
        {
                g = 50,
                b = 255,
                r = 160
        },
        {
                g = 255,
                b = 255,
                r = 255
        },
        {
                g = 120,
                b = 120,
                r = 120
        },
        {
                g = 200,
                b = 200,
                r = 200
        }
}

function slot_0_6_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
        return arg_1_2 <= arg_1_0 and arg_1_0 <= arg_1_2 + arg_1_4 and arg_1_3 <= arg_1_1 and arg_1_1 <= arg_1_3 + arg_1_5
end

function slot_0_7_0(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7)
        if not arg_2_6 or arg_2_6 == "" or not arg_2_1 then
                return
        end

        local var_2_0 = arg_2_1:get_text_size(tostring(arg_2_6))

        arg_2_0.font = arg_2_1

        arg_2_0:add_text(draw.vec2(math.floor(arg_2_2 + (arg_2_4 - var_2_0.x * 1.1) / 2), math.floor(arg_2_3 + (arg_2_5 - var_2_0.y) / 2)), tostring(arg_2_6), arg_2_7)
end

function slot_0_8_0(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5, arg_3_6)
        arg_3_0:add_rect_filled(draw.rect(arg_3_1, arg_3_2, arg_3_3, arg_3_4), arg_3_5, arg_3_6 or 0)
end

slot_0_9_0 = gui.checkbox(gui.control_id("fatal_paint_enable"))

gui.ctx:find("lua>elements a"):add(gui.make_control("Fatal Paint", slot_0_9_0))
events.present_queue:add(function()
        if not slot_0_9_0:get_value():get() then
                return
        end

        slot_4_0_0 = draw.surface
        slot_4_1_0 = slot_0_4_0.x
        slot_4_2_0 = slot_0_4_0.y
        slot_4_3_0 = slot_0_2_0.toolbar_w
        slot_4_4_0 = slot_0_3_0.canvas_w + slot_4_3_0 + 40
        slot_4_5_0 = slot_0_3_0.canvas_h + slot_0_2_0.header_h + 45
        slot_4_6_0 = slot_4_1_0 + 12
        slot_4_7_0 = slot_4_2_0 + slot_0_2_0.header_h + 10
        slot_4_8_0 = slot_4_1_0 + slot_4_3_0 + 18
        slot_4_9_0 = slot_4_2_0 + slot_0_2_0.header_h + 10

        slot_0_8_0(slot_4_0_0, slot_4_1_0 - 3, slot_4_2_0 - 3, slot_4_1_0 + slot_4_4_0 + 3, slot_4_2_0 + slot_4_5_0 + 3, slot_0_1_0.shadow, 14)
        slot_0_8_0(slot_4_0_0, slot_4_1_0, slot_4_2_0, slot_4_1_0 + slot_4_4_0, slot_4_2_0 + slot_4_5_0, slot_0_1_0.window_bg, 10)
        slot_0_8_0(slot_4_0_0, slot_4_8_0, slot_4_9_0, slot_4_8_0 + slot_0_3_0.canvas_w, slot_4_9_0 + slot_0_3_0.canvas_h, slot_0_1_0.canvas_bg, 4)

        for iter_4_0, iter_4_1 in ipairs(slot_0_3_0.strokes) do
                slot_4_15_3 = iter_4_1.points
                slot_4_16_4 = iter_4_1.size
                slot_4_17_4 = slot_0_3_0.canvas_w
                slot_4_18_2 = slot_0_3_0.canvas_h

                for iter_4_2 = 1, #slot_4_15_3 do
                        slot_4_23_0 = slot_4_15_3[iter_4_2]

                        if slot_4_23_0.x >= 0 and slot_4_17_4 >= slot_4_23_0.x and slot_4_23_0.y >= 0 and slot_4_18_2 >= slot_4_23_0.y then
                                slot_4_0_0:add_circle_filled(draw.vec2(math.floor(slot_4_8_0 + slot_4_23_0.x), math.floor(slot_4_9_0 + slot_4_23_0.y)), slot_4_16_4, iter_4_1.color, 12)
                        end

                        if iter_4_2 > 1 then
                                slot_4_24_0 = slot_4_15_3[iter_4_2 - 1]
                                slot_4_25_0 = math.sqrt((slot_4_23_0.x - slot_4_15_3[iter_4_2 - 1].x)^2 + (slot_4_23_0.y - slot_4_15_3[iter_4_2 - 1].y)^2)

                                if slot_4_25_0 > 1 then
                                        for iter_4_3 = 1, math.floor(slot_4_25_0) do
                                                slot_4_30_0 = slot_4_24_0.x + (slot_4_23_0.x - slot_4_24_0.x) * (iter_4_3 / slot_4_25_0)
                                                slot_4_31_0 = slot_4_24_0.y + (slot_4_23_0.y - slot_4_24_0.y) * (iter_4_3 / slot_4_25_0)

                                                if slot_4_30_0 >= 0 and slot_4_30_0 <= slot_4_17_4 and slot_4_31_0 >= 0 and slot_4_31_0 <= slot_4_18_2 then
                                                        slot_4_0_0:add_circle_filled(draw.vec2(math.floor(slot_4_8_0 + slot_4_30_0), math.floor(slot_4_9_0 + slot_4_31_0)), slot_4_16_4, iter_4_1.color, 8)
                                                end
                                        end
                                end
                        end
                end
        end

        for iter_4_4, iter_4_5 in ipairs({
                {
                        slot_4_1_0,
                        slot_4_2_0 + slot_0_2_0.header_h,
                        slot_4_8_0,
                        slot_4_2_0 + slot_4_5_0
                },
                {
                        slot_4_8_0 + slot_0_3_0.canvas_w,
                        slot_4_2_0 + slot_0_2_0.header_h,
                        slot_4_1_0 + slot_4_4_0,
                        slot_4_2_0 + slot_4_5_0
                },
                {
                        slot_4_8_0,
                        slot_4_2_0 + slot_0_2_0.header_h,
                        slot_4_8_0 + slot_0_3_0.canvas_w,
                        slot_4_9_0
                },
                {
                        slot_4_8_0,
                        slot_4_9_0 + slot_0_3_0.canvas_h,
                        slot_4_8_0 + slot_0_3_0.canvas_w,
                        slot_4_2_0 + slot_4_5_0
                }
        }) do
                slot_0_8_0(slot_4_0_0, iter_4_5[1], iter_4_5[2], iter_4_5[3], iter_4_5[4], slot_0_1_0.window_bg)
        end

        slot_4_0_0:add_rect(draw.rect(slot_4_8_0, slot_4_9_0, slot_4_8_0 + slot_0_3_0.canvas_w, slot_4_9_0 + slot_0_3_0.canvas_h), slot_0_1_0.canvas_border, 4, 1)
        slot_0_8_0(slot_4_0_0, slot_4_6_0, slot_4_7_0, slot_4_6_0 + slot_4_3_0, slot_4_7_0 + slot_0_3_0.canvas_h, slot_0_1_0.toolbar_bg, 6)
        slot_4_0_0:add_rect(draw.rect(slot_4_6_0, slot_4_7_0, slot_4_6_0 + slot_4_3_0, slot_4_7_0 + slot_0_3_0.canvas_h), slot_0_1_0.toolbar_border, 6, 1)

        for iter_4_6, iter_4_7 in ipairs({
                {
                        "BRUSH",
                        10,
                        slot_0_3_0.tool == "brush"
                },
                {
                        "ERASER",
                        48,
                        slot_0_3_0.tool == "eraser"
                },
                {
                        "CLEAR",
                        96,
                        false
                },
                {
                        "UNDO",
                        134,
                        false
                }
        }) do
                slot_4_15_2 = slot_4_6_0 + 8
                slot_4_16_3 = slot_4_7_0 + iter_4_7[2]
                slot_4_17_3 = slot_4_3_0 - 16
                slot_4_18_1 = 32
                slot_4_19_1 = slot_0_6_0(slot_0_4_0.cx, slot_0_4_0.cy, slot_4_15_2, slot_4_16_3, slot_4_17_3, slot_4_18_1)

                slot_0_8_0(slot_4_0_0, slot_4_15_2, slot_4_16_3, slot_4_15_2 + slot_4_17_3, slot_4_16_3 + slot_4_18_1, iter_4_7[3] and slot_0_1_0.btn_active or slot_4_19_1 and slot_0_1_0.btn_hover or slot_0_1_0.btn_bg, 6)

                if iter_4_7[3] then
                        slot_0_8_0(slot_4_0_0, slot_4_15_2, slot_4_16_3 + 3, slot_4_15_2 + 3, slot_4_16_3 + slot_4_18_1 - 3, slot_0_1_0.btn_active_bar, 2)
                end

                slot_0_7_0(slot_4_0_0, slot_0_0_0.main, slot_4_15_2, slot_4_16_3, slot_4_17_3, slot_4_18_1, iter_4_7[1], slot_0_1_0.text_primary)
        end

        slot_0_7_0(slot_4_0_0, slot_0_0_0.main, slot_4_6_0, slot_4_7_0 + 180, slot_4_3_0, 20, "SIZE: " .. slot_0_3_0.brush_size, slot_0_1_0.text_secondary)

        for iter_4_8, iter_4_9 in ipairs({
                {
                        "-",
                        8
                },
                {
                        "+",
                        slot_4_3_0 - 36
                }
        }) do
                slot_4_15_1 = slot_0_6_0(slot_0_4_0.cx, slot_0_4_0.cy, slot_4_6_0 + iter_4_9[2], slot_4_7_0 + 205, 28, 28)

                slot_0_8_0(slot_4_0_0, slot_4_6_0 + iter_4_9[2], slot_4_7_0 + 205, slot_4_6_0 + iter_4_9[2] + 28, slot_4_7_0 + 233, slot_4_15_1 and slot_0_1_0.control_hover or slot_0_1_0.control_bg, 4)
                slot_0_7_0(slot_4_0_0, slot_0_0_0.bold, slot_4_6_0 + iter_4_9[2], slot_4_7_0 + 205, 28, 28, iter_4_9[1], slot_0_1_0.text_primary)
        end

        slot_0_8_0(slot_4_0_0, slot_4_6_0 + 8, slot_4_7_0 + 242, slot_4_6_0 + slot_4_3_0 - 8, slot_4_7_0 + 280, slot_0_1_0.control_bg, 6)
        slot_4_0_0:add_circle_filled(draw.vec2(slot_4_6_0 + slot_4_3_0 / 2, slot_4_7_0 + 261), slot_0_3_0.brush_size, slot_0_3_0.tool == "eraser" and slot_0_1_0.canvas_bg or slot_0_3_0.brush_color, 16)
        slot_0_7_0(slot_4_0_0, slot_0_0_0.main, slot_4_6_0, slot_4_7_0 + 294, slot_4_3_0, 20, "COLORS", slot_0_1_0.text_secondary)

        for iter_4_10, iter_4_11 in ipairs(slot_0_5_0) do
                slot_4_15_0 = math.floor((iter_4_10 - 1) / 3)
                slot_4_16_2 = (iter_4_10 - 1) % 3
                slot_4_17_2 = slot_4_6_0 + 14 + slot_4_16_2 * 24
                slot_4_18_0 = slot_4_7_0 + 320 + slot_4_15_0 * 24
                slot_4_19_0 = draw.color(iter_4_11.r, iter_4_11.g, iter_4_11.b, 255)

                if slot_0_3_0.brush_color:get_r() == iter_4_11.r and slot_0_3_0.brush_color:get_g() == iter_4_11.g and slot_0_3_0.brush_color:get_b() == iter_4_11.b then
                        slot_0_8_0(slot_4_0_0, slot_4_17_2, slot_4_18_0, slot_4_17_2 + 20, slot_4_18_0 + 20, slot_0_1_0.accent, 4)
                        slot_0_8_0(slot_4_0_0, slot_4_17_2 + 3, slot_4_18_0 + 3, slot_4_17_2 + 17, slot_4_18_0 + 17, slot_4_19_0, 3)
                else
                        slot_0_8_0(slot_4_0_0, slot_4_17_2, slot_4_18_0, slot_4_17_2 + 20, slot_4_18_0 + 20, slot_4_19_0, 4)

                        if slot_0_6_0(slot_0_4_0.cx, slot_0_4_0.cy, slot_4_17_2, slot_4_18_0, 20, 20) then
                                slot_4_0_0:add_rect(draw.rect(slot_4_17_2, slot_4_18_0, slot_4_17_2 + 20, slot_4_18_0 + 20), draw.color(255, 255, 255, 150), 4, 1)
                        end
                end
        end

        slot_4_10_0 = slot_0_6_0(slot_0_4_0.cx, slot_0_4_0.cy, slot_4_1_0, slot_4_2_0, slot_4_4_0, slot_0_2_0.header_h)

        slot_0_8_0(slot_4_0_0, slot_4_1_0, slot_4_2_0, slot_4_1_0 + slot_4_4_0, slot_4_2_0 + slot_0_2_0.header_h, slot_0_4_0.active and slot_0_1_0.header_drag or slot_4_10_0 and slot_0_1_0.header_hover or slot_0_1_0.header_bg, 10)
        slot_0_7_0(slot_4_0_0, slot_0_0_0.bold, slot_4_1_0, slot_4_2_0, slot_4_4_0, slot_0_2_0.header_h, "F A T A L   P A I N T", slot_0_1_0.text_primary)

        slot_4_11_0 = slot_0_2_0.resize_size
        slot_4_12_0 = slot_0_6_0(slot_0_4_0.cx, slot_0_4_0.cy, slot_4_1_0 + slot_4_4_0 - slot_0_2_0.resize_size, slot_4_2_0 + slot_4_5_0 - slot_0_2_0.resize_size, slot_0_2_0.resize_size, slot_0_2_0.resize_size)

        for iter_4_12, iter_4_13 in ipairs({
                {
                        slot_4_1_0,
                        slot_4_2_0,
                        slot_4_1_0 + slot_4_4_0,
                        slot_4_2_0 + 1
                },
                {
                        slot_4_1_0,
                        slot_4_2_0,
                        slot_4_1_0 + 1,
                        slot_4_2_0 + slot_4_5_0
                },
                {
                        slot_4_1_0 + slot_4_4_0 - 1,
                        slot_4_2_0,
                        slot_4_1_0 + slot_4_4_0,
                        slot_4_2_0 + slot_4_5_0 - slot_4_11_0
                },
                {
                        slot_4_1_0,
                        slot_4_2_0 + slot_4_5_0 - 1,
                        slot_4_1_0 + slot_4_4_0 - slot_4_11_0,
                        slot_4_2_0 + slot_4_5_0
                }
        }) do
                slot_0_8_0(slot_4_0_0, iter_4_13[1], iter_4_13[2], iter_4_13[3], iter_4_13[4], slot_0_1_0.border)
        end

        slot_0_8_0(slot_4_0_0, slot_4_1_0 + slot_4_4_0 - 1, slot_4_2_0 + slot_4_5_0 - slot_4_11_0, slot_4_1_0 + slot_4_4_0, slot_4_2_0 + slot_4_5_0, slot_4_12_0 and slot_0_1_0.resize_hover or slot_0_1_0.resize_idle)
        slot_0_8_0(slot_4_0_0, slot_4_1_0 + slot_4_4_0 - slot_4_11_0, slot_4_2_0 + slot_4_5_0 - 1, slot_4_1_0 + slot_4_4_0, slot_4_2_0 + slot_4_5_0, slot_4_12_0 and slot_0_1_0.resize_hover or slot_0_1_0.resize_idle)

        for iter_4_14 = 0, 2 do
                slot_4_17_0 = 3 + iter_4_14 * 4

                slot_0_8_0(slot_4_0_0, slot_4_1_0 + slot_4_4_0 - slot_4_17_0 - 1, slot_4_2_0 + slot_4_5_0 - 2, slot_4_1_0 + slot_4_4_0 - slot_4_17_0 + 1, slot_4_2_0 + slot_4_5_0, slot_0_1_0.resize_grip)
                slot_0_8_0(slot_4_0_0, slot_4_1_0 + slot_4_4_0 - 2, slot_4_2_0 + slot_4_5_0 - slot_4_17_0 - 1, slot_4_1_0 + slot_4_4_0, slot_4_2_0 + slot_4_5_0 - slot_4_17_0 + 1, slot_0_1_0.resize_grip)
        end
end)
events.input:add(function(arg_5_0, arg_5_1, arg_5_2)
        if not slot_0_9_0:get_value():get() then
                return
        end

        slot_5_3_0 = bit.band(arg_5_2, 65535)
        slot_5_4_0 = bit.rshift(arg_5_2, 16)

        if arg_5_0 >= 512 and arg_5_0 <= 514 then
                slot_0_4_0.cx, slot_0_4_0.cy = slot_5_3_0, slot_5_4_0
        end

        slot_5_5_0 = slot_0_2_0.toolbar_w
        slot_5_6_0 = slot_0_4_0.x + 12
        slot_5_7_0 = slot_0_4_0.y + slot_0_2_0.header_h + 10
        slot_5_8_0 = slot_0_4_0.x + slot_5_5_0 + 18
        slot_5_9_0 = slot_0_4_0.y + slot_0_2_0.header_h + 10
        slot_5_10_0 = slot_0_3_0.canvas_w + slot_5_5_0 + 40
        slot_5_11_0 = slot_0_3_0.canvas_h + slot_0_2_0.header_h + 45

        if arg_5_0 == 513 then
                slot_5_12_1 = false

                if slot_0_6_0(slot_5_3_0, slot_5_4_0, slot_0_4_0.x, slot_0_4_0.y, slot_5_10_0, slot_0_2_0.header_h) then
                        slot_0_4_0.active, slot_0_4_0.ox, slot_0_4_0.oy, slot_5_12_1 = true, slot_5_3_0 - slot_0_4_0.x, slot_5_4_0 - slot_0_4_0.y, true
                end

                if not slot_5_12_1 and slot_0_6_0(slot_5_3_0, slot_5_4_0, slot_0_4_0.x + slot_5_10_0 - slot_0_2_0.resize_size, slot_0_4_0.y + slot_5_11_0 - slot_0_2_0.resize_size, slot_0_2_0.resize_size, slot_0_2_0.resize_size) then
                        slot_0_4_0.resizing, slot_0_4_0.ox, slot_0_4_0.oy, slot_0_4_0.start_w, slot_0_4_0.start_h, slot_5_12_1 = true, slot_5_3_0, slot_5_4_0, slot_0_3_0.canvas_w, slot_0_3_0.canvas_h, true
                end

                if not slot_5_12_1 then
                        for iter_5_0, iter_5_1 in ipairs({
                                {
                                        slot_5_6_0 + 8,
                                        slot_5_7_0 + 10,
                                        slot_5_5_0 - 16,
                                        32,
                                        function()
                                                slot_0_3_0.tool = "brush"
                                        end
                                },
                                {
                                        slot_5_6_0 + 8,
                                        slot_5_7_0 + 48,
                                        slot_5_5_0 - 16,
                                        32,
                                        function()
                                                slot_0_3_0.tool = "eraser"
                                        end
                                },
                                {
                                        slot_5_6_0 + 8,
                                        slot_5_7_0 + 96,
                                        slot_5_5_0 - 16,
                                        32,
                                        function()
                                                slot_0_3_0.strokes = {}
                                        end
                                },
                                {
                                        slot_5_6_0 + 8,
                                        slot_5_7_0 + 134,
                                        slot_5_5_0 - 16,
                                        32,
                                        function()
                                                table.remove(slot_0_3_0.strokes)
                                        end
                                },
                                {
                                        slot_5_6_0 + 8,
                                        slot_5_7_0 + 205,
                                        28,
                                        28,
                                        function()
                                                slot_0_3_0.brush_size = math.max(1, slot_0_3_0.brush_size - 1)
                                        end
                                },
                                {
                                        slot_5_6_0 + slot_5_5_0 - 36,
                                        slot_5_7_0 + 205,
                                        28,
                                        28,
                                        function()
                                                slot_0_3_0.brush_size = math.min(15, slot_0_3_0.brush_size + 1)
                                        end
                                }
                        }) do
                                if slot_0_6_0(slot_5_3_0, slot_5_4_0, iter_5_1[1], iter_5_1[2], iter_5_1[3], iter_5_1[4]) then
                                        iter_5_1[5]()

                                        slot_5_12_1 = true

                                        break
                                end
                        end

                        for iter_5_2, iter_5_3 in ipairs(slot_0_5_0) do
                                slot_5_18_0 = math.floor((iter_5_2 - 1) / 3)
                                slot_5_19_0 = (iter_5_2 - 1) % 3

                                if slot_0_6_0(slot_5_3_0, slot_5_4_0, slot_5_6_0 + 14 + slot_5_19_0 * 24, slot_5_7_0 + 320 + slot_5_18_0 * 24, 20, 20) then
                                        slot_0_3_0.brush_color, slot_0_3_0.tool, slot_5_12_1 = draw.color(iter_5_3.r, iter_5_3.g, iter_5_3.b, 255), "brush", true

                                        break
                                end
                        end
                end

                if not slot_5_12_1 and slot_0_6_0(slot_5_3_0, slot_5_4_0, slot_5_8_0, slot_5_9_0, slot_0_3_0.canvas_w, slot_0_3_0.canvas_h) then
                        slot_0_4_0.is_drawing = true
                        slot_0_3_0.current_stroke = {
                                color = slot_0_3_0.tool == "eraser" and slot_0_1_0.canvas_bg or slot_0_3_0.brush_color,
                                size = slot_0_3_0.brush_size,
                                points = {
                                        {
                                                x = slot_5_3_0 - slot_5_8_0,
                                                y = slot_5_4_0 - slot_5_9_0
                                        }
                                }
                        }

                        table.insert(slot_0_3_0.strokes, slot_0_3_0.current_stroke)
                end
        elseif arg_5_0 == 512 then
                if slot_0_4_0.active then
                        slot_0_4_0.x, slot_0_4_0.y = slot_5_3_0 - slot_0_4_0.ox, slot_5_4_0 - slot_0_4_0.oy
                elseif slot_0_4_0.resizing then
                        slot_0_3_0.canvas_w, slot_0_3_0.canvas_h = math.max(slot_0_3_0.min_canvas_w, slot_0_4_0.start_w + (slot_5_3_0 - slot_0_4_0.ox)), math.max(slot_0_3_0.min_canvas_h, slot_0_4_0.start_h + (slot_5_4_0 - slot_0_4_0.oy))
                end

                if slot_0_4_0.is_drawing and slot_0_6_0(slot_5_3_0, slot_5_4_0, slot_5_8_0, slot_5_9_0, slot_0_3_0.canvas_w, slot_0_3_0.canvas_h) then
                        slot_5_12_0 = {
                                x = slot_5_3_0 - slot_5_8_0,
                                y = slot_5_4_0 - slot_5_9_0
                        }
                        slot_5_13_0 = slot_0_3_0.current_stroke.points[#slot_0_3_0.current_stroke.points]

                        if (slot_5_12_0.x - slot_5_13_0.x)^2 + (slot_5_12_0.y - slot_5_13_0.y)^2 > 2 then
                                table.insert(slot_0_3_0.current_stroke.points, slot_5_12_0)
                        end
                end
        elseif arg_5_0 == 514 then
                slot_0_4_0.active, slot_0_4_0.is_drawing, slot_0_4_0.resizing = false, false, false
        end
end)
