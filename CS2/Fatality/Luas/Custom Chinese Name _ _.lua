--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:Find("lua>elements a")
slot_0_1_0 = gui.Checkbox(gui.ControlID("enemyNameEsp_enable"))
slot_0_2_0 = gui.Checkbox(gui.ControlID("enemyNameEsp_customFont"))
slot_0_3_0 = gui.ComboBox(gui.ControlID("enemyNameEsp_fontSize"))
slot_0_4_0 = gui.Selectable(gui.ControlID("enemyNameEsp_fontSize_large"), "Large")
slot_0_5_0 = gui.Selectable(gui.ControlID("enemyNameEsp_fontSize_medium"), "Medium")
slot_0_6_0 = gui.Selectable(gui.ControlID("enemyNameEsp_fontSize_small"), "Small")

slot_0_3_0:Add(slot_0_4_0)
slot_0_3_0:Add(slot_0_5_0)
slot_0_3_0:Add(slot_0_6_0)

slot_0_7_0 = gui.ComboBox(gui.ControlID("enemyNameEsp_fontWeight"))
slot_0_8_0 = gui.Selectable(gui.ControlID("enemyNameEsp_fontWeight_bold"), "Bold")
slot_0_9_0 = gui.Selectable(gui.ControlID("enemyNameEsp_fontWeight_regular"), "Regular")
slot_0_10_0 = gui.Selectable(gui.ControlID("enemyNameEsp_fontWeight_light"), "Light")

slot_0_7_0:Add(slot_0_8_0)
slot_0_7_0:Add(slot_0_9_0)
slot_0_7_0:Add(slot_0_10_0)

slot_0_11_0 = gui.ColorPicker(gui.ControlID("enemyNameEsp_color"))
slot_0_12_0 = gui.MakeControl("Enemy Name ESP", slot_0_1_0)
slot_0_13_0 = gui.MakeControl("Custom Font", slot_0_2_0)
slot_0_14_0 = gui.MakeControl("Font Size", slot_0_3_0)
slot_0_15_0 = gui.MakeControl("Font Weight", slot_0_7_0)
slot_0_16_0 = gui.MakeControl("Text Color", slot_0_11_0)

slot_0_0_0:Reset()
slot_0_0_0:Add(slot_0_12_0)
slot_0_0_0:Add(slot_0_13_0)
slot_0_0_0:Add(slot_0_14_0)
slot_0_0_0:Add(slot_0_15_0)
slot_0_0_0:Add(slot_0_16_0)

if slot_0_11_0:GetValue():Get():GetA() == 0 then
        slot_0_11_0:GetValue():Set(draw.Color(255, 255, 255, 255))
end

slot_0_18_0 = {
        currentWeight = 0,
        currentSize = 0,
        init = function(arg_1_0, arg_1_1, arg_1_2)
                local var_1_0 = bit.bor(draw.FontFlags.ANTI_ALIAS, draw.FontFlags.SHADOW, draw.FontFlags.NO_DPI)

                arg_1_0.font = draw.FontGDI("Microsoft YaHei UI", arg_1_1, var_1_0, 32, 40869, arg_1_2)

                if arg_1_0.font then
                        arg_1_0.font:Create()

                        arg_1_0.currentSize = arg_1_1
                        arg_1_0.currentWeight = arg_1_2
                end
        end,
        update = function(arg_2_0, arg_2_1, arg_2_2)
                if arg_2_1 ~= arg_2_0.currentSize or arg_2_2 ~= arg_2_0.currentWeight then
                        arg_2_0:init(arg_2_1, arg_2_2)
                end
        end,
        drawText = function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
                if not arg_3_0.font then
                        return
                end

                draw.surface.font = arg_3_0.font

                draw.surface:AddText(arg_3_1, arg_3_2, arg_3_3)
        end,
        measureText = function(arg_4_0, arg_4_1)
                if not arg_4_0.font then
                        return draw.Vec2(0, 0)
                end

                return arg_4_0.font:GetTextSize(arg_4_1)
        end
}
slot_0_19_0 = {
        fontWeight = 400,
        fontSize = 20,
        customFont = false,
        enabled = false
}
slot_0_20_0 = {
        28,
        20,
        nil,
        14
}
slot_0_21_0 = {
        800,
        600,
        nil,
        400
}

slot_0_18_0:init(slot_0_19_0.fontSize, slot_0_19_0.fontWeight)

function slot_0_22_0()
        local var_5_0 = slot_0_1_0:GetValue():Get()
        local var_5_1 = slot_0_2_0:GetValue():Get()

        slot_0_13_0:SetVisible(var_5_0)
        slot_0_14_0:SetVisible(var_5_0 and var_5_1)
        slot_0_15_0:SetVisible(var_5_0 and var_5_1)
        slot_0_16_0:SetVisible(var_5_0)
end

function slot_0_23_0()
        slot_0_19_0.enabled = slot_0_1_0:GetValue():Get()
        slot_0_19_0.customFont = slot_0_2_0:GetValue():Get()

        slot_0_22_0()

        if not slot_0_19_0.enabled then
                return
        end

        if not game.engine:InGame() then
                return
        end

        if not entities or not entities.players then
                return
        end

        local var_6_0
        local var_6_1

        if slot_0_19_0.customFont then
                local var_6_2 = slot_0_3_0:GetValue():Get():GetRaw()
                local var_6_3 = slot_0_7_0:GetValue():Get():GetRaw()

                var_6_0 = slot_0_20_0[var_6_2] or 20
                var_6_1 = slot_0_21_0[var_6_3] or 400
        else
                var_6_0 = 20
                var_6_1 = 400
        end

        slot_0_18_0:update(var_6_0, var_6_1)

        local var_6_4 = slot_0_11_0:GetValue():Get()
        local var_6_5 = draw.Color(var_6_4:GetR(), var_6_4:GetG(), var_6_4:GetB(), var_6_4:GetA())

        entities.players:ForEach(function(arg_7_0)
                if not arg_7_0.handle:valid() then
                        return
                end

                local var_7_0 = arg_7_0.handle:Get()

                if not var_7_0 then
                        return
                end

                if not var_7_0:IsEnemy() then
                        return
                end

                if not var_7_0:IsAlive() then
                        return
                end

                local var_7_1 = var_7_0:GetEyePos()

                if not var_7_1 then
                        return
                end

                local var_7_2 = math.WorldToScreen(var_7_1)

                if not var_7_2 then
                        return
                end

                local var_7_3 = var_7_0:GetName() or "Unknown"
                local var_7_4 = slot_0_18_0:measureText(var_7_3)
                local var_7_5 = draw.Vec2(var_7_2.x - var_7_4.x / 2, var_7_2.y - var_7_4.y - 12)

                slot_0_18_0:drawText(var_7_5, var_7_3, var_6_5)
        end)
end

events.presentQueue:Add(slot_0_23_0)
slot_0_22_0()
