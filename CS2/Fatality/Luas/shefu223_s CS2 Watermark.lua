--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0, slot_0_1_0 = gui.MakeControlEasy("wm_name", "Show Name", "checkbox")
slot_0_2_0, slot_0_3_0 = gui.MakeControlEasy("wm_fps", "Show FPS", "checkbox")
slot_0_4_0, slot_0_5_0 = gui.MakeControlEasy("wm_ping", "Show Ping", "checkbox")
slot_0_6_0, slot_0_7_0 = gui.MakeControlEasy("wm_logo", "Show Logo", "checkbox")
slot_0_8_0 = gui.ctx:Find("lua>groups")
slot_0_9_0 = gui.Group("wm_group", "Watermark", 120, gui.GroupWidthMode.FULL)

slot_0_8_0:Add(slot_0_9_0)
slot_0_9_0:Add(slot_0_1_0)
slot_0_9_0:Add(slot_0_3_0)
slot_0_9_0:Add(slot_0_5_0)
slot_0_9_0:Add(slot_0_7_0)
slot_0_0_0:GetValue():Set(true)
slot_0_2_0:GetValue():Set(true)
slot_0_4_0:GetValue():Set(true)
slot_0_6_0:GetValue():Set(true)

slot_0_10_0 = draw.fonts.gui_main
slot_0_11_0 = draw.Color(160, 160, 170, 255)
slot_0_12_0 = draw.Color(80, 80, 90, 255)
slot_0_13_0 = draw.Color(14, 14, 18, 200)
slot_0_14_0 = draw.Color(50, 50, 60, 160)
slot_0_15_0 = draw.Color(255, 40, 130, 255)
slot_0_16_0 = 8
slot_0_17_0 = 20
slot_0_18_0 = 10
slot_0_19_0 = 26
slot_0_20_0 = 4
slot_0_21_0 = 6
slot_0_22_0 = "  |  "
slot_0_23_0 = gui.ctx.user.username or "unknown"
slot_0_24_0 = slot_0_10_0:GetTextSize(slot_0_23_0).x
slot_0_25_0 = slot_0_10_0:GetTextSize("9999 fps").x
slot_0_26_0 = slot_0_10_0:GetTextSize(slot_0_22_0).x
slot_0_27_0 = slot_0_10_0.height
slot_0_28_0 = 0
slot_0_29_0 = 0

function slot_0_30_0()
        slot_1_0_0 = draw.surface
        slot_1_0_0.font = slot_0_10_0
        slot_1_1_0 = slot_0_0_0:GetValue():Get()
        slot_1_2_0 = slot_0_2_0:GetValue():Get()
        slot_1_3_0 = slot_0_4_0:GetValue():Get()
        slot_1_4_0 = slot_0_6_0:GetValue():Get()

        if not slot_1_1_0 and not slot_1_2_0 and not slot_1_3_0 and not slot_1_4_0 then
                return
        end

        slot_1_5_0 = draw.GetTime()

        if slot_1_5_0 >= slot_0_29_0 then
                slot_1_6_1 = draw.GetFrameTime()
                slot_0_28_0 = slot_1_6_1 and slot_1_6_1 > 0 and math.floor(1 / slot_1_6_1) or 0
                slot_0_29_0 = slot_1_5_0 + 0.5
        end

        slot_1_6_0 = slot_0_28_0
        slot_1_7_0 = "0 ms"

        if slot_1_3_0 then
                slot_1_8_2 = game.engine:get_netchan()

                if slot_1_8_2 then
                        slot_1_9_3 = slot_1_8_2:get_latency(0)
                        slot_1_7_0 = slot_1_9_3 and math.floor(slot_1_9_3 * 1000) .. " ms" or "0 ms"
                end
        end

        slot_1_8_1 = slot_0_16_0
        slot_1_9_2 = true

        if slot_1_1_0 then
                slot_1_8_1 = slot_1_8_1 + slot_0_24_0
                slot_1_9_2 = false
        end

        if slot_1_2_0 then
                if not slot_1_9_2 then
                        slot_1_8_1 = slot_1_8_1 + slot_0_26_0
                end

                slot_1_8_1 = slot_1_8_1 + slot_0_25_0
                slot_1_9_2 = false
        end

        if slot_1_3_0 then
                if not slot_1_9_2 then
                        slot_1_8_1 = slot_1_8_1 + slot_0_26_0
                end

                slot_1_8_1 = slot_1_8_1 + slot_0_10_0:GetTextSize(slot_1_7_0).x
                slot_1_9_1 = false
        end

        slot_1_8_0 = slot_1_8_1 + slot_0_16_0
        slot_1_10_0 = slot_1_1_0 or slot_1_2_0 or slot_1_3_0
        slot_1_11_0 = slot_0_27_0 + slot_0_16_0 * 2
        slot_1_12_0 = draw.GetDisplay()
        slot_1_13_0 = slot_1_12_0.x
        slot_1_14_0 = slot_1_12_0.y
        slot_1_15_0 = slot_1_13_0 - slot_1_8_0 - slot_0_17_0
        slot_1_16_0 = slot_0_18_0

        if slot_1_4_0 then
                slot_1_17_1 = slot_1_10_0 and slot_1_15_0 - slot_0_21_0 - slot_0_19_0 or slot_1_13_0 - slot_0_17_0 - slot_0_19_0
                slot_1_18_1 = slot_1_16_0 + (slot_1_10_0 and math.floor((slot_1_11_0 - slot_0_19_0) / 2) or 0)
                slot_1_0_0.g.antiAlias = false

                slot_1_0_0:AddRectFilledRounded(draw.Rect(slot_1_17_1, slot_1_18_1, slot_1_17_1 + slot_0_19_0, slot_1_18_1 + slot_0_19_0), draw.Color(20, 16, 28, 220), slot_0_20_0, draw.Rounding.ALL)
                slot_1_0_0:AddRectRounded(draw.Rect(slot_1_17_1, slot_1_18_1, slot_1_17_1 + slot_0_19_0, slot_1_18_1 + slot_0_19_0), slot_0_14_0, slot_0_20_0, draw.Rounding.ALL)

                slot_1_0_0.g.antiAlias = true
                slot_1_19_1 = slot_0_10_0:GetTextSize("F")

                slot_1_0_0:AddText(draw.Vec2(slot_1_17_1 + math.floor((slot_0_19_0 - slot_1_19_1.x) / 2), slot_1_18_1 + math.floor((slot_0_19_0 - slot_1_19_1.y) / 2)), "F", slot_0_15_0)
        end

        if not slot_1_10_0 then
                return
        end

        slot_1_0_0.g.antiAlias = false

        slot_1_0_0:AddRectFilledRounded(draw.Rect(slot_1_15_0, slot_1_16_0, slot_1_15_0 + slot_1_8_0, slot_1_16_0 + slot_1_11_0), slot_0_13_0, 6, draw.Rounding.ALL)
        slot_1_0_0:AddRectRounded(draw.Rect(slot_1_15_0, slot_1_16_0, slot_1_15_0 + slot_1_8_0, slot_1_16_0 + slot_1_11_0), slot_0_14_0, 6, draw.Rounding.ALL)

        slot_1_0_0.g.antiAlias = true
        slot_1_17_0 = slot_1_16_0 + slot_0_16_0 + 2
        slot_1_18_0 = slot_1_15_0 + slot_0_16_0
        slot_1_9_0 = true

        if slot_1_1_0 then
                slot_1_0_0:AddText(draw.Vec2(slot_1_18_0, slot_1_17_0), slot_0_23_0, slot_0_11_0)

                slot_1_18_0 = slot_1_18_0 + slot_0_24_0
                slot_1_9_0 = false
        end

        if slot_1_2_0 then
                if not slot_1_9_0 then
                        slot_1_0_0:AddText(draw.Vec2(slot_1_18_0, slot_1_17_0), slot_0_22_0, slot_0_12_0)

                        slot_1_18_0 = slot_1_18_0 + slot_0_26_0
                end

                slot_1_19_0 = slot_1_6_0 .. " fps"
                slot_1_20_0 = slot_0_10_0:GetTextSize(slot_1_19_0).x

                slot_1_0_0:AddText(draw.Vec2(slot_1_18_0 + math.floor((slot_0_25_0 - slot_1_20_0) / 2), slot_1_17_0), slot_1_19_0, slot_0_11_0)

                slot_1_18_0 = slot_1_18_0 + slot_0_25_0
                slot_1_9_0 = false
        end

        if slot_1_3_0 then
                if not slot_1_9_0 then
                        slot_1_0_0:AddText(draw.Vec2(slot_1_18_0, slot_1_17_0), slot_0_22_0, slot_0_12_0)

                        slot_1_18_0 = slot_1_18_0 + slot_0_26_0
                end

                slot_1_0_0:AddText(draw.Vec2(slot_1_18_0, slot_1_17_0), slot_1_7_0, slot_0_11_0)
        end
end

events.presentQueue:Add(slot_0_30_0)
