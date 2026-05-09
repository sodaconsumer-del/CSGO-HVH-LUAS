--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = math.sin
slot_0_1_0 = math.floor
slot_0_2_0 = math.clamp
slot_0_3_0 = string.sub
slot_0_4_0 = string.format
slot_0_5_0 = string.upper
slot_0_6_0 = table.concat
slot_0_7_0 = type
slot_0_8_0 = tostring
slot_0_9_0 = pairs
slot_0_10_0 = ipairs
slot_0_11_0 = draw.color.Interpolate
slot_0_12_0 = draw.Color
slot_0_13_0 = draw.Vec2
slot_0_14_0 = draw.Rect
slot_0_15_0 = draw.GetScale
slot_0_16_0 = utils.GetUnixTime
slot_0_17_0 = utils.GetDate
slot_0_18_0 = slot_0_12_0(255, 255, 255, 255)
slot_0_19_0 = slot_0_12_0(0, 0, 0, 100)
slot_0_20_0 = slot_0_12_0(255, 255, 255, 100)
slot_0_21_0 = slot_0_12_0(14, 14, 14)
slot_0_22_0 = slot_0_12_0(14, 14, 14, 100)
slot_0_23_0 = slot_0_13_0(18)
slot_0_24_0 = slot_0_13_0(100)
slot_0_25_0 = draw.Rounding.ALL
slot_0_26_0 = InputBitMask_t.IN_ATTACK
slot_0_27_0 = InputBitMask_t.IN_ATTACK2
slot_0_28_0 = InputBitMask_t.IN_RELOAD
slot_0_29_0 = InputBitMask_t.IN_USE
slot_0_30_0 = InputBitMask_t.IN_USEORRELOAD
slot_0_31_0 = InputBitMask_t.IN_ZOOM
slot_0_32_0, slot_0_33_0 = gui.MakeControlEasy("hud.elems", "Elements", "combo_box")
slot_0_32_0.allowMultiple = true
slot_0_34_0 = gui.Selectable("hud.elems.wt", "Watermark")
slot_0_35_0 = gui.Selectable("hud.elems.kb", "Hotkeys")

slot_0_32_0:Add(slot_0_34_0)
slot_0_32_0:Add(slot_0_35_0)

slot_0_36_0, slot_0_37_0 = gui.MakeControlEasy("hud.color1", "First color", "color_picker", slot_0_12_0(255, 255, 255, 255), false)
slot_0_38_0, slot_0_39_0 = gui.MakeControlEasy("hud.color2", "Second color", "color_picker", slot_0_12_0(0, 0, 0, 255), false)
slot_0_40_0 = gui.ctx:Find("lua>elements a")

slot_0_40_0:Add(slot_0_33_0)
slot_0_40_0:Add(slot_0_37_0)
slot_0_40_0:Add(slot_0_39_0)
slot_0_40_0:Reset()

slot_0_41_0 = {
        lightning = draw.SvgTexture("    <svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n    <path d=\"M18.0287 9.65001C19.4292 10.198 20.5531 10.6378 21.3154 11.0578C21.7032 11.2715 22.0582 11.5117 22.3168 11.8044C22.5928 12.1168 22.7724 12.5068 22.7477 12.9677C22.723 13.4305 22.5007 13.7995 22.1919 14.0803C21.9023 14.3437 21.522 14.545 21.1111 14.7167C20.3033 15.0545 19.0706 15.3907 17.6084 15.7894L17.6084 15.7894C17.1439 15.9161 16.8471 15.9979 16.6247 16.0825C16.4173 16.1613 16.3322 16.2223 16.2772 16.2772C16.2223 16.3322 16.1613 16.4173 16.0825 16.6247C15.9979 16.8471 15.9161 17.1439 15.7894 17.6084L15.7894 17.6084C15.3907 19.0706 15.0545 20.3033 14.7167 21.1111C14.545 21.522 14.3437 21.9023 14.0803 22.1919C13.7995 22.5007 13.4305 22.723 12.9677 22.7477C12.5068 22.7724 12.1168 22.5928 11.8044 22.3168C11.5117 22.0582 11.2715 21.7032 11.0578 21.3154C10.6378 20.5531 10.198 19.4292 9.65001 18.0287L9.65001 18.0287L7.63556 12.8807L7.63556 12.8807C7.06192 11.4148 6.60068 10.2361 6.38754 9.32854C6.17634 8.42929 6.13413 7.49585 6.81499 6.81499C7.49585 6.13413 8.42929 6.17634 9.32854 6.38754C10.2361 6.60068 11.4148 7.06192 12.8807 7.63556L18.0287 9.65001L18.0287 9.65001Z\" fill=\"#FFFFFF\"/>\n    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M8.97414 1.25C9.50738 1.25 9.93966 1.68228 9.93966 2.21552V4.14655C9.93966 4.67979 9.50738 5.11207 8.97414 5.11207C8.4409 5.11207 8.00862 4.67979 8.00862 4.14655V2.21552C8.00862 1.68228 8.4409 1.25 8.97414 1.25ZM2.98107 2.98107C3.35813 2.60401 3.96946 2.60401 4.34652 2.98107L5.79479 4.42935C6.17185 4.8064 6.17185 5.41773 5.79479 5.79479C5.41773 6.17185 4.8064 6.17185 4.42935 5.79479L2.98107 4.34652C2.60401 3.96946 2.60401 3.35813 2.98107 2.98107ZM14.9672 2.98107C15.3443 3.35813 15.3443 3.96946 14.9672 4.34652L13.5189 5.79479C13.1419 6.17185 12.5305 6.17185 12.1535 5.79479C11.7764 5.41773 11.7764 4.8064 12.1535 4.42935L13.6018 2.98107C13.9788 2.60401 14.5901 2.60401 14.9672 2.98107ZM1.25 8.97414C1.25 8.4409 1.68228 8.00862 2.21552 8.00862H4.14655C4.67979 8.00862 5.11207 8.4409 5.11207 8.97414C5.11207 9.50738 4.67979 9.93966 4.14655 9.93966H2.21552C1.68228 9.93966 1.25 9.50738 1.25 8.97414ZM5.79479 12.1535C6.17185 12.5305 6.17185 13.1419 5.79479 13.5189L4.34652 14.9672C3.96946 15.3443 3.35813 15.3443 2.98107 14.9672C2.60401 14.5901 2.60401 13.9788 2.98107 13.6018L4.42935 12.1535C4.8064 11.7764 5.41773 11.7764 5.79479 12.1535Z\" fill=\"#FFFFFF\"/>\n    </svg>\n    ", 24),
        enable = draw.SvgTexture("    <svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M8 5.25C4.27208 5.25 1.25 8.27208 1.25 12C1.25 15.7279 4.27208 18.75 8 18.75H16C19.7279 18.75 22.75 15.7279 22.75 12C22.75 8.27208 19.7279 5.25 16 5.25H8ZM16 8.25C13.9289 8.25 12.25 9.92893 12.25 12C12.25 14.0711 13.9289 15.75 16 15.75C18.0711 15.75 19.75 14.0711 19.75 12C19.75 9.92893 18.0711 8.25 16 8.25Z\" fill=\"#FFFFFF\"/>\n    </svg>\n    ")
}

slot_0_41_0.lightning:Create()
slot_0_41_0.enable:Create()

slot_0_42_0 = 0
slot_0_43_0 = slot_0_16_0()
slot_0_44_0 = 0
slot_0_45_0 = 0
slot_0_46_0 = 0
slot_0_47_0 = false

function slot_0_48_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
        if arg_1_0 then
                draw.surface.g:SetTexture(arg_1_0)
                draw.surface:AddRectFilled(slot_0_14_0(arg_1_1.x, arg_1_1.y, arg_1_1.x + arg_1_2.x, arg_1_1.y + arg_1_2.y), arg_1_3)
                draw.surface.g:SetTexture(nil)
        end
end

function slot_0_49_0(arg_2_0)
        return arg_2_0 * slot_0_15_0()
end

function slot_0_50_0(arg_3_0)
        return slot_0_2_0(arg_3_0, 0, 255)
end

function slot_0_51_0(arg_4_0, arg_4_1, arg_4_2)
        return arg_4_0 + (arg_4_1 - arg_4_0) * arg_4_2
end

slot_0_52_0 = {}

function slot_0_53_0(arg_5_0)
        local var_5_0 = {}
        local var_5_1 = slot_0_36_0:GetValue():Get()
        local var_5_2 = slot_0_38_0:GetValue():Get()

        if not slot_0_52_0[arg_5_0] then
                slot_0_52_0[arg_5_0] = {}

                for iter_5_0 = 1, #arg_5_0 do
                        slot_0_52_0[arg_5_0][iter_5_0] = slot_0_3_0(arg_5_0, iter_5_0, iter_5_0)
                end
        end

        local var_5_3 = slot_0_52_0[arg_5_0]
        local var_5_4 = #var_5_3

        for iter_5_1 = 1, var_5_4 do
                local var_5_5 = slot_0_0_0(iter_5_1 * 0.15 + slot_0_42_0 * 3)

                if var_5_5 < 0 then
                        var_5_5 = 0
                end

                local var_5_6 = slot_0_11_0(var_5_1, var_5_2, var_5_5)

                var_5_0[iter_5_1] = "\f" .. slot_0_4_0("%02x%02x%02x%02x", var_5_6:GetR(), var_5_6:GetG(), var_5_6:GetB(), 255) .. var_5_3[iter_5_1] .. "\b"
        end

        return slot_0_6_0(var_5_0)
end

slot_0_54_0 = {
        box = slot_0_14_0(45, 45, 90, 65)
}
slot_0_54_0.drag = false
slot_0_54_0.dx = 0
slot_0_54_0.dy = 0

function slot_0_54_0.click(arg_6_0, arg_6_1)
        if slot_0_54_0.box == nil then
                return false
        end

        if slot_0_54_0.box:Contains(slot_0_13_0(arg_6_0, arg_6_1)) then
                slot_0_54_0.drag = true
                slot_0_54_0.dx = arg_6_0 - slot_0_54_0.box.mins.x
                slot_0_54_0.dy = arg_6_1 - slot_0_54_0.box.mins.y

                return true
        end

        return false
end

function slot_0_54_0.release()
        if slot_0_54_0.box == nil then
                return false
        end

        slot_0_54_0.drag = false

        return false
end

function slot_0_54_0.render()
        local var_8_0 = draw.surface

        var_8_0.font = draw.fonts.gui_main_fb

        local var_8_1 = slot_0_54_0.box.mins.x
        local var_8_2 = slot_0_54_0.box.mins.y

        if slot_0_54_0.drag then
                local var_8_3 = gui.input:Cursor()

                var_8_1 = slot_0_49_0(var_8_3.x) - slot_0_54_0.dx
                var_8_2 = slot_0_49_0(var_8_3.y) - slot_0_54_0.dy
        end

        local var_8_4 = gui.ctx.user
        local var_8_5 = slot_0_17_0()
        local var_8_6 = slot_0_53_0("fatality.win") .. " - " .. var_8_4.username .. " - " .. var_8_5.hour .. ":" .. var_8_5.minute .. " - " .. slot_0_1_0(slot_0_46_0)
        local var_8_7 = var_8_0.font:GetTextSize(var_8_6, true)

        slot_0_54_0.box = slot_0_14_0(var_8_1, var_8_2, var_8_1 + 45 + var_8_7.x, var_8_2 + 18 + var_8_7.y)

        var_8_0:AddWithBlur(slot_0_54_0.box, function()
                var_8_0:AddRectFilledRounded(slot_0_54_0.box, slot_0_21_0, 6, slot_0_25_0)
        end)
        var_8_0:AddRectFilledRounded(slot_0_54_0.box, slot_0_22_0, 6, slot_0_25_0)
        var_8_0:AddText(slot_0_13_0(slot_0_54_0.box.mins.x + 38, slot_0_54_0.box.mins.y + 10), var_8_6, slot_0_18_0)

        if var_8_4.avatar ~= nil then
                local var_8_8 = var_8_4.avatar:GetSize()

                draw.surface.g:SetTexture(var_8_4.avatar)
                draw.surface:AddCircleFilled(slot_0_13_0(slot_0_54_0.box.mins.x + 16, slot_0_54_0.box.mins.y + 16), 13, slot_0_18_0, 0, 1)
                draw.surface.g:SetTexture(nil)
        else
                var_8_0:AddRectFilledRounded(slot_0_14_0(slot_0_54_0.box.mins.x + 5, slot_0_54_0.box.mins.y + 5, slot_0_54_0.box.mins.x + 28, slot_0_54_0.box.mins.y + 28), slot_0_19_0, 6, slot_0_25_0)
                var_8_0:AddText(slot_0_13_0(slot_0_54_0.box.mins.x + 12, slot_0_54_0.box.mins.y + 11), slot_0_5_0(slot_0_3_0(var_8_4.username, 1, 1)), slot_0_20_0)
        end
end

slot_0_55_0 = {
        box = slot_0_14_0(45, 45, 90, 65)
}
slot_0_55_0.drag = false
slot_0_55_0.dx = 0
slot_0_55_0.dy = 0
slot_0_55_0.keys = {}

function slot_0_55_0.click(arg_10_0, arg_10_1)
        if slot_0_55_0.box == nil then
                return false
        end

        if slot_0_55_0.box:Contains(slot_0_13_0(arg_10_0, arg_10_1)) then
                slot_0_55_0.drag = true
                slot_0_55_0.dx = arg_10_0 - slot_0_55_0.box.mins.x
                slot_0_55_0.dy = arg_10_1 - slot_0_55_0.box.mins.y

                return true
        end

        return false
end

function slot_0_55_0.release()
        if slot_0_55_0.box == nil then
                return false
        end

        slot_0_55_0.drag = false

        return false
end

function slot_0_55_0.render()
        slot_12_0_0 = draw.surface
        slot_12_0_0.font = draw.fonts.gui_main_fb
        slot_12_1_0 = slot_0_55_0.box.mins.x
        slot_12_2_0 = slot_0_55_0.box.mins.y

        if slot_0_55_0.drag then
                slot_12_3_1 = gui.input:Cursor()
                slot_12_1_0 = slot_0_49_0(slot_12_3_1.x) - slot_0_55_0.dx
                slot_12_2_0 = slot_0_49_0(slot_12_3_1.y) - slot_0_55_0.dy
        end

        slot_12_0_0:AddWithBlur(slot_0_55_0.box, function()
                slot_12_0_0:AddRectFilledRounded(slot_0_55_0.box, slot_0_18_0, 6, slot_0_25_0)
        end)
        slot_12_0_0:AddRectFilledRounded(slot_0_55_0.box, slot_0_22_0, 6, slot_0_25_0)
        slot_12_0_0:AddText(slot_0_13_0(slot_0_55_0.box.mins.x + 38, slot_0_55_0.box.mins.y + 10), "Hotkeys", slot_0_18_0)
        slot_0_48_0(slot_0_41_0.lightning, slot_0_13_0(slot_0_55_0.box.mins.x + 8, slot_0_55_0.box.mins.y + 7), slot_0_23_0, slot_0_18_0)

        slot_12_3_0 = 150
        slot_12_4_0 = 32
        slot_12_5_0 = gui.GetHotkeyList()

        for iter_12_0, iter_12_1 in slot_0_10_0(slot_12_5_0) do
                slot_12_11_1 = iter_12_1:Cast()
                slot_12_12_1 = slot_12_11_1:GetLabel().text
                slot_12_13_1 = 0

                if slot_0_55_0.keys[slot_12_12_1] ~= nil then
                        slot_12_13_1 = slot_0_55_0.keys[slot_12_12_1].lrp
                end

                slot_0_55_0.keys[slot_12_12_1] = {
                        lrp = slot_12_13_1,
                        elem = slot_12_11_1
                }
        end

        slot_12_0_0.g.clipRect = slot_0_55_0.box

        for iter_12_2, iter_12_3 in slot_0_9_0(slot_0_55_0.keys) do
                slot_12_11_0 = iter_12_3.elem
                slot_12_12_0 = slot_12_11_0:GetHotkeyState() and 1 or 0
                iter_12_3.lrp = iter_12_3.lrp + (slot_12_12_0 - iter_12_3.lrp) * 0.1
                slot_12_13_0 = slot_12_11_0:GetLabel().text
                slot_12_14_0 = slot_12_0_0.font:GetTextSize(slot_12_13_0, true)

                slot_12_0_0:AddText(slot_0_13_0(slot_0_55_0.box.mins.x + 5 - (slot_12_14_0.x + 6) * (1 - iter_12_3.lrp), slot_0_55_0.box.mins.y + slot_12_4_0), slot_12_13_0, slot_0_12_0(255, 255, 255, 255 * iter_12_3.lrp))

                slot_12_15_0 = slot_12_11_0:GetValue():Get()
                slot_12_16_0 = slot_0_8_0(slot_12_15_0)
                slot_12_17_0 = slot_12_0_0.font:GetTextSize(slot_12_16_0, true)

                if slot_0_7_0(slot_12_15_0) == "boolean" then
                        slot_0_48_0(slot_0_41_0.enable, slot_0_13_0(slot_0_55_0.box.maxs.x - slot_12_17_0.x + (slot_12_17_0.x + 5) * (1 - iter_12_3.lrp), slot_0_55_0.box.mins.y + slot_12_4_0 - 2), slot_0_23_0, slot_0_18_0)
                else
                        slot_12_0_0:AddText(slot_0_13_0(slot_0_55_0.box.maxs.x - 5 - slot_12_17_0.x + (slot_12_17_0.x + 5) * (1 - iter_12_3.lrp), slot_0_55_0.box.mins.y + slot_12_4_0), slot_12_16_0, slot_0_12_0(255, 255, 255, 255 * iter_12_3.lrp))
                end

                slot_12_4_0 = slot_12_4_0 + 20 * iter_12_3.lrp
        end

        slot_12_0_0.g.clipRect = nil
        slot_0_55_0.box = slot_0_14_0(slot_12_1_0, slot_12_2_0, slot_12_1_0 + slot_12_3_0, slot_12_2_0 + slot_12_4_0)
end

slot_0_56_0 = {
        slot_0_54_0,
        slot_0_55_0
}

function slot_0_57_0()
        local var_14_0 = {}

        for iter_14_0, iter_14_1 in slot_0_10_0(slot_0_56_0) do
                var_14_0[iter_14_0] = {
                        x = iter_14_1.box.mins.x,
                        y = iter_14_1.box.mins.y
                }
        end

        utils.DbSave(var_14_0, "hud_drags")
end

;(function()
        local var_15_0 = utils.DbLoad("hud_drags")

        if var_15_0 then
                for iter_15_0, iter_15_1 in slot_0_9_0(var_15_0) do
                        slot_0_56_0[iter_15_0].box.mins.x = iter_15_1.x
                        slot_0_56_0[iter_15_0].box.mins.y = iter_15_1.y
                end
        end
end)()

function __shutdown()
        slot_0_57_0()
end

function slot_0_59_0()
        local var_17_0 = draw.GetFrameTime()

        slot_0_42_0 = slot_0_42_0 + var_17_0

        local var_17_1 = slot_0_16_0()

        if var_17_1 ~= slot_0_43_0 then
                slot_0_45_0 = slot_0_44_0
                slot_0_44_0 = 0
                slot_0_43_0 = var_17_1
        end

        slot_0_44_0 = slot_0_44_0 + 1
        slot_0_46_0 = slot_0_46_0 + (slot_0_45_0 - slot_0_46_0) * 0.1

        local var_17_2 = slot_0_32_0:GetValue():Get()

        for iter_17_0, iter_17_1 in slot_0_10_0(slot_0_56_0) do
                if var_17_2:Get(iter_17_0 - 1) then
                        draw.surface.g.antiAlias = true

                        iter_17_1.render()
                end
        end
end

function slot_0_60_0(arg_18_0, arg_18_1, arg_18_2)
        if not gui.IsVisible() then
                return
        end

        if arg_18_0 == 513 then
                local var_18_0 = gui.input:Cursor()
                local var_18_1 = slot_0_49_0(var_18_0.x)
                local var_18_2 = slot_0_49_0(var_18_0.y)
                local var_18_3 = slot_0_32_0:GetValue():Get()

                for iter_18_0, iter_18_1 in slot_0_10_0(slot_0_56_0) do
                        if var_18_3:Get(iter_18_0 - 1) and iter_18_1.click(var_18_1, var_18_2) then
                                slot_0_47_0 = true

                                return true
                        end
                end
        end

        if arg_18_0 == 514 then
                slot_0_47_0 = false

                local var_18_4 = slot_0_32_0:GetValue():Get()

                for iter_18_2, iter_18_3 in slot_0_10_0(slot_0_56_0) do
                        if var_18_4:Get(iter_18_2 - 1) and iter_18_3.release() then
                                return true
                        end
                end
        end

        return true
end

events.presentQueue:Add(slot_0_59_0)
events.input:Add(slot_0_60_0)
events.create_move:add(function(arg_19_0)
        if slot_0_47_0 then
                arg_19_0:RemoveButton(slot_0_26_0)
                arg_19_0:RemoveButton(slot_0_27_0)
                arg_19_0:RemoveButton(slot_0_28_0)
                arg_19_0:RemoveButton(slot_0_29_0)
                arg_19_0:RemoveButton(slot_0_30_0)
                arg_19_0:RemoveButton(slot_0_31_0)
        end
end)
