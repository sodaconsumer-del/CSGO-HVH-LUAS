--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = draw.shaders.blur_f
slot_0_1_0 = 15
slot_0_2_0 = 15
slot_0_3_0 = ws.GetResourceDir()
slot_0_4_0 = draw.Texture(slot_0_3_0 .. "/fps.png")
slot_0_5_0 = draw.Texture(slot_0_3_0 .. "/ping.png")
slot_0_6_0 = draw.Texture(slot_0_3_0 .. "/clock.png")
slot_0_7_0 = draw.Texture(slot_0_3_0 .. "/user.png")

slot_0_4_0:Create()
slot_0_5_0:Create()
slot_0_6_0:Create()
slot_0_7_0:Create()

slot_0_8_0 = 1
slot_0_9_0 = 0
slot_0_10_0 = 0

function slot_0_11_0()
        local var_1_0 = utils.GetDate()

        return var_1_0.hour * 3600000 + var_1_0.minute * 60000 + var_1_0.second * 1000
end

function slot_0_12_0()
        local var_2_0 = draw.GetFrameTime()

        if var_2_0 == 0 then
                return slot_0_9_0
        end

        slot_0_8_0 = 0.9 * slot_0_8_0 + 0.1 * var_2_0

        local var_2_1 = slot_0_11_0()

        if var_2_1 - slot_0_10_0 >= 750 then
                slot_0_10_0 = var_2_1
                slot_0_9_0 = math.floor(1 / slot_0_8_0 + 0.5)
        end

        return slot_0_9_0
end

function slot_0_13_0()
        local var_3_0 = game.engine:GetNetChan()

        if not var_3_0 or var_3_0:IsNull() then
                return nil
        end

        if var_3_0:IsLoopback() then
                return nil
        end

        local var_3_1 = var_3_0:GetLatency()

        if not var_3_1 then
                return nil
        end

        return math.floor(var_3_1 * 1000 + 0.5)
end

slot_0_14_0 = 0
slot_0_15_0 = 0
slot_0_16_0 = 0
slot_0_17_0 = 0
slot_0_18_0 = 0
slot_0_19_0, slot_0_20_0 = gui.MakeControlEasy("Enable_watermark", "Enable watermark", "checkbox")
slot_0_21_0, slot_0_22_0 = gui.MakeControlEasy("wm_color", "Accent color", "color_picker")
slot_0_23_0, slot_0_24_0 = gui.MakeControlEasy("glitch_max_x", "Glitch Max X", "slider", 0, 10, 3)
slot_0_25_0, slot_0_26_0 = gui.MakeControlEasy("glitch_max_y", "Glitch Max Y", "slider", 0, 10, 2)
slot_0_27_0, slot_0_28_0 = gui.MakeControlEasy("glitch_speed", "Glitch Speed (ms)", "slider", 10, 200, 100)
slot_0_29_0, slot_0_30_0 = gui.MakeControlEasy("first_color", "First color", "color_picker")
slot_0_31_0, slot_0_32_0 = gui.MakeControlEasy("end_color", "End color", "color_picker")
slot_0_33_0 = gui.ComboBox("wm_line_mode")

slot_0_33_0:Add(gui.Selectable("wm_line_normal", "Normal"))
slot_0_33_0:Add(gui.Selectable("wm_line_gradient", "Gradient"))

slot_0_33_0.allowMultiple = false

function slot_0_34_0()
        local var_4_0 = slot_0_33_0:Get():Get(1)

        slot_0_22_0:SetVisible(not var_4_0)
        slot_0_30_0:SetVisible(var_4_0)
        slot_0_32_0:SetVisible(var_4_0)
end

slot_0_33_0:AddCallback(function()
        slot_0_34_0()
end)

slot_0_35_0 = gui.ctx:Find("lua>elements a")

slot_0_35_0:Add(slot_0_20_0)
slot_0_35_0:Add(slot_0_33_0)
slot_0_35_0:Add(slot_0_22_0)
slot_0_35_0:Add(slot_0_30_0)
slot_0_35_0:Add(slot_0_32_0)
slot_0_35_0:Add(slot_0_24_0)
slot_0_35_0:Add(slot_0_26_0)
slot_0_35_0:Add(slot_0_28_0)
slot_0_35_0:Reset()
slot_0_34_0()
events.presentQueue:Add(function()
        if not slot_0_19_0:GetValue():Get() then
                return
        end

        slot_6_0_0 = draw.surface
        slot_6_1_0 = draw.fonts.gui_main
        slot_6_0_0.font = slot_6_1_0
        slot_6_2_0 = gui.ctx.user
        slot_6_3_0 = slot_6_2_0.username
        slot_6_4_0 = slot_6_2_0.avatar
        slot_6_5_0 = utils.GetDate()
        slot_6_6_0 = string.format("%02d:%02d:%02d", slot_6_5_0.hour, slot_6_5_0.minute, slot_6_5_0.second)
        slot_6_7_0 = draw.Color(255, 255, 255, 255)
        slot_6_8_0 = slot_0_21_0:GetValue():Get()
        slot_6_9_0 = slot_0_29_0:GetValue():Get()
        slot_6_10_0 = slot_0_31_0:GetValue():Get()
        slot_6_11_0 = draw.Color(255, 255, 255, 60)
        slot_6_12_0 = draw.Color(204, 0, 255, 255)
        slot_6_13_0 = draw.Color(128, 91, 215, 255)
        slot_6_14_0 = slot_0_12_0()
        slot_6_15_0 = slot_0_13_0()
        slot_6_16_0 = slot_6_15_0 and string.format("%dms", slot_6_15_0) or "localhost"
        slot_6_17_0 = draw.GetDisplay()
        slot_6_18_0 = 28
        slot_6_19_0 = 10
        slot_6_20_0 = slot_6_19_0 + 7
        slot_6_21_0 = 3
        slot_6_22_0 = 6
        slot_6_23_0 = slot_6_1_0:GetTextSize("fatality").x
        slot_6_24_0 = slot_6_1_0:GetTextSize("|").x
        slot_6_25_0 = slot_6_1_0:GetTextSize(tostring(slot_6_14_0)).x
        slot_6_26_0 = slot_6_1_0:GetTextSize(" fps").x
        slot_6_27_0 = slot_6_1_0:GetTextSize(slot_6_16_0).x
        slot_6_28_0 = slot_6_1_0:GetTextSize(slot_6_6_0).x
        slot_6_29_0 = 8 + slot_6_23_0 + slot_6_21_0 + slot_6_24_0 + slot_6_21_0 + slot_0_2_0 + slot_6_21_0 + slot_6_1_0:GetTextSize(slot_6_3_0).x + slot_6_21_0 + slot_6_24_0 + slot_6_21_0 + slot_0_1_0 + slot_6_21_0 + slot_6_25_0 + slot_6_26_0 + slot_6_21_0 + slot_6_24_0 + slot_6_21_0 + slot_0_1_0 + slot_6_21_0 + slot_6_27_0 + slot_6_21_0 + slot_6_24_0 + slot_6_21_0 + slot_0_1_0 + slot_6_21_0 + slot_6_28_0 + 10
        slot_6_30_0 = slot_6_17_0.x - slot_6_29_0 - 10
        slot_6_31_0 = draw.Rect(slot_6_30_0, slot_6_19_0, slot_6_30_0 + slot_6_29_0, slot_6_19_0 + slot_6_18_0)
        slot_6_32_0 = draw.adapter:GetBackBuffer()
        slot_6_0_0.g.texture = slot_6_32_0
        slot_6_0_0.g.uvRect = draw.Rect((slot_6_30_0 + slot_6_22_0 / 2) / slot_6_17_0.x, (slot_6_19_0 + slot_6_22_0 / 2) / slot_6_17_0.y, (slot_6_30_0 + slot_6_29_0 - slot_6_22_0 / 2) / slot_6_17_0.x, (slot_6_19_0 + slot_6_18_0 - slot_6_22_0 / 2) / slot_6_17_0.y)

        slot_6_0_0.g:SetShader(slot_0_0_0)
        slot_6_0_0:AddRectFilled(draw.Rect(slot_6_30_0 + slot_6_22_0 / 2, slot_6_19_0 + slot_6_22_0 / 2, slot_6_30_0 + slot_6_29_0 - slot_6_22_0 / 2, slot_6_19_0 + slot_6_18_0 - slot_6_22_0 / 2), slot_6_7_0)
        slot_6_0_0.g:SetShader(nil)

        slot_6_0_0.g.texture = nil
        slot_6_0_0.g.uvRect = nil

        slot_6_0_0:AddRectFilledRounded(slot_6_31_0, draw.Color(20, 20, 20, 80), slot_6_22_0, draw.Rounding.ALL)

        slot_6_33_0 = slot_0_33_0:Get()

        if slot_6_33_0:Get(0) then
                slot_6_0_0:AddLineMulticolor(draw.Vec2(slot_6_30_0 + 2, slot_6_19_0 + 1), draw.Vec2(slot_6_30_0 + slot_6_29_0 - 2, slot_6_19_0 + 1), slot_6_8_0, slot_6_8_0, 1)
        elseif slot_6_33_0:Get(1) then
                slot_6_0_0:AddLineMulticolor(draw.Vec2(slot_6_30_0 + 2, slot_6_19_0 + 1), draw.Vec2(slot_6_30_0 + slot_6_29_0 - 2, slot_6_19_0 + 1), slot_6_9_0, slot_6_10_0, 1)
        end

        slot_6_34_0 = draw.GetFrameTime() * 1000
        slot_0_18_0 = slot_0_18_0 + slot_6_34_0
        slot_6_35_0 = slot_0_23_0:GetValue():Get()
        slot_6_36_0 = slot_0_25_0:GetValue():Get()

        if slot_0_27_0:GetValue():Get() < slot_0_18_0 then
                slot_0_18_0 = 0

                if math.random() > 0.85 then
                        slot_0_16_0 = math.random(-slot_6_35_0, slot_6_35_0)
                        slot_0_17_0 = math.random(-slot_6_36_0, slot_6_36_0)
                else
                        slot_0_16_0 = 0
                        slot_0_17_0 = 0
                end
        end

        slot_0_14_0 = slot_0_14_0 + (slot_0_16_0 - slot_0_14_0) * 0.2
        slot_0_15_0 = slot_0_15_0 + (slot_0_17_0 - slot_0_15_0) * 0.2
        slot_6_38_13 = slot_6_30_0 + 8

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_13 + slot_0_14_0, slot_6_20_0 + slot_0_15_0 - 1), "fatality", draw.Color(255, 0, 0, 160))
        slot_6_0_0:AddText(draw.Vec2(slot_6_38_13 - slot_0_14_0, slot_6_20_0 - slot_0_15_0 + 1), "fatality", draw.Color(0, 0, 255, 160))
        slot_6_0_0:AddText(draw.Vec2(slot_6_38_13, slot_6_20_0), "fatality", slot_6_7_0)

        slot_6_38_12 = slot_6_38_13 + slot_6_23_0 + slot_6_21_0

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_12, slot_6_20_0), "|", slot_6_11_0)

        slot_6_38_11 = slot_6_38_12 + slot_6_24_0 + slot_6_21_0

        if slot_6_4_0 and slot_6_4_0.obj == nil then
                slot_6_4_0:Create()
        end

        slot_6_39_0 = slot_6_4_0 and slot_6_4_0.obj and slot_6_4_0 or slot_0_7_0

        slot_6_0_0.g:SetTexture(slot_6_39_0)
        slot_6_0_0:AddRectFilled(draw.Rect(slot_6_38_11, slot_6_20_0 - 2, slot_6_38_11 + slot_0_2_0, slot_6_20_0 - 2 + slot_0_2_0), slot_6_7_0)
        slot_6_0_0.g:SetTexture(nil)

        slot_6_38_10 = slot_6_38_11 + slot_0_2_0 + slot_6_21_0
        slot_6_40_0 = #slot_6_3_0

        for iter_6_0 = 1, slot_6_40_0 do
                slot_6_45_0 = slot_6_40_0 > 1 and (iter_6_0 - 1) / (slot_6_40_0 - 1) or 0
                slot_6_46_0 = draw.color.Interpolate(slot_6_12_0, slot_6_13_0, slot_6_45_0)
                slot_6_47_0 = slot_6_3_0:sub(iter_6_0, iter_6_0)

                slot_6_0_0:AddText(draw.Vec2(slot_6_38_10, slot_6_20_0), slot_6_47_0, slot_6_46_0)

                slot_6_38_10 = slot_6_38_10 + slot_6_1_0:GetTextSize(slot_6_47_0).x
        end

        slot_6_38_9 = slot_6_38_10 + slot_6_21_0

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_9, slot_6_20_0), "|", slot_6_11_0)

        slot_6_38_8 = slot_6_38_9 + slot_6_24_0 + slot_6_21_0

        slot_6_0_0.g:SetTexture(slot_0_4_0)
        slot_6_0_0:AddRectFilled(draw.Rect(slot_6_38_8, slot_6_20_0 - 2, slot_6_38_8 + slot_0_1_0, slot_6_20_0 - 2 + slot_0_1_0), slot_6_7_0)
        slot_6_0_0.g:SetTexture(nil)

        slot_6_38_7 = slot_6_38_8 + slot_0_1_0 + slot_6_21_0

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_7, slot_6_20_0), tostring(slot_6_14_0), slot_6_7_0)

        slot_6_38_6 = slot_6_38_7 + slot_6_25_0 + 1

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_6, slot_6_20_0), " fps", slot_6_7_0)

        slot_6_38_5 = slot_6_38_6 + slot_6_26_0 + slot_6_21_0

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_5, slot_6_20_0), "|", slot_6_11_0)

        slot_6_38_4 = slot_6_38_5 + slot_6_24_0 + slot_6_21_0

        slot_6_0_0.g:SetTexture(slot_0_5_0)
        slot_6_0_0:AddRectFilled(draw.Rect(slot_6_38_4, slot_6_20_0 - 2, slot_6_38_4 + slot_0_1_0, slot_6_20_0 - 2 + slot_0_1_0), slot_6_7_0)
        slot_6_0_0.g:SetTexture(nil)

        slot_6_38_3 = slot_6_38_4 + slot_0_1_0 + slot_6_21_0

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_3, slot_6_20_0), slot_6_16_0, slot_6_7_0)

        slot_6_38_2 = slot_6_38_3 + slot_6_27_0 + slot_6_21_0

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_2, slot_6_20_0), "|", slot_6_11_0)

        slot_6_38_1 = slot_6_38_2 + slot_6_24_0 + slot_6_21_0

        slot_6_0_0.g:SetTexture(slot_0_6_0)
        slot_6_0_0:AddRectFilled(draw.Rect(slot_6_38_1, slot_6_20_0 - 2, slot_6_38_1 + slot_0_1_0, slot_6_20_0 - 2 + slot_0_1_0), slot_6_7_0)
        slot_6_0_0.g:SetTexture(nil)

        slot_6_38_0 = slot_6_38_1 + slot_0_1_0 + slot_6_21_0

        slot_6_0_0:AddText(draw.Vec2(slot_6_38_0, slot_6_20_0), slot_6_6_0, slot_6_7_0)
end)
