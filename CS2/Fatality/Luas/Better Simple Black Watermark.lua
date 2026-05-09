--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = game.engine
slot_0_1_0 = math.floor
slot_0_2_0 = math.min
slot_0_3_0 = math.max
slot_0_4_0 = math.clamp
slot_0_5_1 = nil
slot_0_6_1 = nil
slot_0_7_0 = ws.GetResourceDir():gsub("\\", "/")

if slot_0_7_0:sub(-1) == "/" then
        slot_0_7_0 = slot_0_7_0:sub(1, -2)
end

slot_0_5_0 = draw.Texture(slot_0_7_0 .. "/kill.png")

if slot_0_5_0 and slot_0_5_0.Create then
        slot_0_5_0:Create()
end

slot_0_6_0 = draw.Texture(slot_0_7_0 .. "/death.png")

if slot_0_6_0 and slot_0_6_0.Create then
        slot_0_6_0:Create()
end

function slot_0_8_0(arg_1_0, arg_1_1)
        local var_1_0 = arg_1_0 + arg_1_1 * 3600
        local var_1_1 = slot_0_1_0(var_1_0 / 3600) % 24
        local var_1_2 = slot_0_1_0(var_1_0 / 60) % 60
        local var_1_3 = slot_0_1_0(var_1_0 % 60)

        return string.format("%02d:%02d:%02d", var_1_1, var_1_2, var_1_3)
end

function slot_0_9_0(arg_2_0, arg_2_1)
        if not arg_2_1 then
                return 0
        end

        arg_2_1 = tostring(arg_2_1)

        local var_2_0 = draw.GetScale()
        local var_2_1 = 0

        for iter_2_0 = 1, #arg_2_1 do
                local var_2_2 = string.sub(arg_2_1, iter_2_0, iter_2_0)

                if var_2_2 == ":" or var_2_2 == "." or var_2_2 == " " or var_2_2 == "-" or var_2_2 == "|" or var_2_2 == "(" or var_2_2 == ")" or var_2_2 == "+" then
                        var_2_1 = var_2_1 + 3
                elseif var_2_2 == "i" or var_2_2 == "l" or var_2_2 == "I" or var_2_2 == "1" or var_2_2 == "t" or var_2_2 == "j" then
                        var_2_1 = var_2_1 + 4.5
                elseif var_2_2 >= "A" and var_2_2 <= "Z" then
                        var_2_1 = var_2_1 + 7.5
                else
                        var_2_1 = var_2_1 + 6
                end
        end

        return (var_2_1 + 1) * var_2_0
end

slot_0_10_0 = gui.ComboBox("wm_elements")
slot_0_10_0.allowMultiple = true
slot_0_11_0 = gui.Selectable("wm_sel_time", "Time")
slot_0_12_0 = gui.Selectable("wm_sel_user", "Nickname")
slot_0_13_0 = gui.Selectable("wm_sel_ping", "Ping")
slot_0_14_0 = gui.Selectable("wm_sel_kd", "Kill + Death")

slot_0_10_0:Add(slot_0_11_0)
slot_0_10_0:Add(slot_0_12_0)
slot_0_10_0:Add(slot_0_13_0)
slot_0_10_0:Add(slot_0_14_0)

slot_0_15_0 = gui.MakeControl("Watermark Elements", slot_0_10_0)
slot_0_16_0 = gui.Slider("wm_tz_fix_final1", -12, 14, {
        "%.0f"
}, 1)

slot_0_16_0:GetValue():Set(3)

slot_0_17_0 = gui.MakeControl("Timezone Offset (UTC)", slot_0_16_0)
slot_0_18_0 = gui.Slider("wm_rounding", 0, 20, {
        "%.0fpx"
}, 1)

slot_0_18_0:GetValue():Set(10)

slot_0_19_0 = gui.MakeControl("Watermark Rounding", slot_0_18_0)
slot_0_20_0 = gui.Checkbox("wm_glow_kill")

slot_0_20_0:GetValue():Set(true)

slot_0_21_0 = gui.MakeControl("White Glow on Kill", slot_0_20_0)
slot_0_22_0 = gui.Slider("wm_saved_pos_x", -1, 10000, {
        "%.0f"
}, 1)
slot_0_23_0 = gui.Slider("wm_saved_pos_y", -1, 10000, {
        "%.0f"
}, 1)
slot_0_24_0 = gui.ctx:Find("lua>elements a")

if slot_0_24_0 then
        slot_0_24_0:Add(slot_0_15_0)
        slot_0_24_0:Add(slot_0_17_0)
        slot_0_24_0:Add(slot_0_19_0)
        slot_0_24_0:Add(slot_0_21_0)
        slot_0_24_0:Reset()
end

slot_0_25_0 = 0
slot_0_26_0 = 0
slot_0_27_0 = nil
slot_0_28_0 = nil
slot_0_29_0 = false
slot_0_30_0 = false
slot_0_31_0 = 0
slot_0_32_0 = 0
slot_0_33_0 = 0

mods.events:AddListener("player_death")
events.event:Add(function(arg_3_0)
        local var_3_0 = arg_3_0:GetName()

        if var_3_0 == "game_newmap" or var_3_0 == "round_start" then
                slot_0_25_0 = 0
                slot_0_26_0 = 0

                return
        end

        if var_3_0 == "player_death" then
                local var_3_1 = entities.GetLocalController()

                if not var_3_1 then
                        return
                end

                local var_3_2 = arg_3_0:GetController("attacker")
                local var_3_3 = arg_3_0:GetController("userid")

                if var_3_2 == var_3_1 and var_3_3 ~= var_3_1 then
                        slot_0_25_0 = slot_0_25_0 + 1
                        slot_0_33_0 = 255
                end

                if var_3_3 == var_3_1 then
                        slot_0_26_0 = slot_0_26_0 + 1
                end
        end
end)
events.input:Add(function(arg_4_0, arg_4_1, arg_4_2)
        if arg_4_0 >= 513 and arg_4_0 <= 518 and (slot_0_30_0 or slot_0_29_0) then
                return true
        end
end)
events.createMove:Add(function(arg_5_0)
        if (slot_0_30_0 or slot_0_29_0) and arg_5_0 then
                arg_5_0:RemoveButton(InputBitMask_t.IN_ATTACK)
                arg_5_0:RemoveButton(InputBitMask_t.IN_ATTACK2)
        end
end)
events.presentQueue:Add(function()
        slot_6_0_0 = draw.surface
        slot_6_0_0.font = draw.fonts.gui_main
        slot_6_0_0.skipDpi = true
        slot_6_1_0 = slot_0_10_0:GetValue():Get()
        slot_6_2_0 = slot_6_1_0:Get(0)
        slot_6_3_0 = slot_6_1_0:Get(1)
        slot_6_4_0 = slot_6_1_0:Get(2)
        slot_6_5_0 = slot_6_1_0:Get(3)
        slot_6_6_0 = slot_0_16_0:GetValue():Get()
        slot_6_7_0 = slot_0_20_0:GetValue():Get()
        slot_6_8_0 = slot_0_18_0:GetValue():Get()
        slot_6_9_0 = draw.GetScale()
        slot_6_10_0, slot_6_11_0 = slot_0_0_0:GetScreenSize()
        slot_6_12_0 = 26 * slot_6_9_0
        slot_6_13_0 = 16 * slot_6_9_0
        slot_6_14_0 = 14 * slot_6_9_0
        slot_6_15_0 = 10 * slot_6_9_0
        slot_6_16_0 = 6 * slot_6_9_0
        slot_6_17_0 = 17 * slot_6_9_0

        if slot_0_33_0 > 0 then
                slot_0_33_0 = slot_0_33_0 - 150 * game.globalVars.m_flAbsFrameTime

                if slot_0_33_0 < 0 then
                        slot_0_33_0 = 0
                end
        end

        slot_6_18_1 = 0
        slot_6_19_0 = 0
        slot_6_20_0 = slot_0_0_0:InGame()
        slot_6_21_0 = ""
        slot_6_22_0 = ""
        slot_6_23_0 = ""
        slot_6_24_0 = ""
        slot_6_25_0 = 0
        slot_6_26_0 = 0
        slot_6_27_0 = 0
        slot_6_28_1 = 0

        if slot_6_3_0 then
                if gui.ctx.user.avatar then
                        slot_6_25_0 = slot_6_25_0 + slot_6_13_0 + slot_6_16_0
                end

                slot_6_29_2 = gui.ctx.user.username or "Unknown"
                slot_6_18_1 = slot_6_18_1 + (slot_6_25_0 + slot_0_9_0(slot_6_0_0, slot_6_29_2))
                slot_6_19_0 = slot_6_19_0 + 1
        end

        if slot_6_2_0 then
                slot_6_21_0 = slot_0_8_0(utils.GetUnixTime(), slot_6_6_0)
                slot_6_26_0 = slot_0_9_0(slot_6_0_0, slot_6_21_0)
                slot_6_18_1 = slot_6_18_1 + slot_6_26_0
                slot_6_19_0 = slot_6_19_0 + 1
        end

        if slot_6_4_0 and slot_6_20_0 then
                slot_6_29_1 = game.engine:GetNetChan()

                if slot_6_29_1 and not slot_6_29_1:IsNull() then
                        slot_6_22_0 = slot_0_1_0(slot_6_29_1:GetLatency() * 1000 + 0.5) .. "ms"
                        slot_6_27_0 = slot_0_9_0(slot_6_0_0, slot_6_22_0)
                        slot_6_18_1 = slot_6_18_1 + slot_6_27_0
                        slot_6_19_0 = slot_6_19_0 + 1
                end
        end

        if slot_6_5_0 and slot_6_20_0 then
                slot_6_23_0 = tostring(slot_0_25_0)
                slot_6_24_0 = tostring(slot_0_26_0)

                if slot_0_5_0 then
                        slot_6_28_1 = slot_6_28_1 + slot_6_14_0 + slot_6_16_0
                else
                        slot_6_28_1 = slot_6_28_1 + slot_0_9_0(slot_6_0_0, "K: ")
                end

                slot_6_28_0 = slot_6_28_1 + slot_0_9_0(slot_6_0_0, slot_6_23_0) + 10 * slot_6_9_0

                if slot_0_6_0 then
                        slot_6_28_0 = slot_6_28_0 + slot_6_14_0 + slot_6_16_0
                else
                        slot_6_28_0 = slot_6_28_0 + slot_0_9_0(slot_6_0_0, "D: ")
                end

                slot_6_18_1 = slot_6_18_1 + (slot_6_28_0 + slot_0_9_0(slot_6_0_0, slot_6_24_0))
                slot_6_19_0 = slot_6_19_0 + 1
        end

        if slot_6_19_0 == 0 then
                slot_0_29_0 = false
                slot_0_30_0 = false

                return
        end

        slot_6_18_0 = slot_6_18_1 + slot_6_15_0 * 2 + slot_6_17_0 * (slot_6_19_0 - 1)
        slot_6_29_0 = gui.input:Cursor() * slot_6_9_0
        slot_6_30_0 = gui.input:IsMouseDown(gui.MouseButton.Left)

        if not slot_0_29_0 then
                slot_6_31_0 = slot_0_22_0:GetValue():Get()
                slot_6_32_2 = slot_0_23_0:GetValue():Get()

                if slot_6_31_0 == -1 or slot_6_32_2 == -1 then
                        slot_0_27_0 = slot_6_10_0 - slot_6_18_0 - 15 * slot_6_9_0
                        slot_0_28_0 = 15 * slot_6_9_0

                        slot_0_22_0:GetValue():Set(slot_0_27_0)
                        slot_0_23_0:GetValue():Set(slot_0_28_0)
                else
                        slot_0_27_0 = slot_6_31_0
                        slot_0_28_0 = slot_6_32_2
                end
        end

        slot_0_30_0 = draw.Rect(slot_0_27_0, slot_0_28_0, slot_0_27_0 + slot_6_18_0, slot_0_28_0 + slot_6_12_0):Contains(slot_6_29_0)

        if slot_6_30_0 then
                if slot_0_29_0 then
                        slot_0_27_0 = slot_6_29_0.x - slot_0_31_0
                        slot_0_28_0 = slot_6_29_0.y - slot_0_32_0
                        slot_0_27_0 = slot_0_4_0(slot_0_27_0, 0, slot_6_10_0 - slot_6_18_0)
                        slot_0_28_0 = slot_0_4_0(slot_0_28_0, 0, slot_6_11_0 - slot_6_12_0)

                        slot_0_22_0:GetValue():Set(slot_0_27_0)
                        slot_0_23_0:GetValue():Set(slot_0_28_0)
                elseif slot_0_30_0 then
                        slot_0_29_0 = true
                        slot_0_31_0 = slot_6_29_0.x - slot_0_27_0
                        slot_0_32_0 = slot_6_29_0.y - slot_0_28_0
                end
        else
                slot_0_29_0 = false
        end

        slot_0_27_0 = slot_0_4_0(slot_0_27_0, 0, slot_6_10_0 - slot_6_18_0)
        slot_0_28_0 = slot_0_4_0(slot_0_28_0, 0, slot_6_11_0 - slot_6_12_0)

        if slot_6_7_0 and slot_0_33_0 > 0 then
                slot_6_32_1 = slot_0_1_0(7 * slot_6_9_0)

                for iter_6_0 = slot_6_32_1, 1, -2 do
                        slot_6_37_2 = 1 - iter_6_0 / slot_6_32_1
                        slot_6_38_2 = slot_0_33_0 * 0.08 * slot_6_37_2

                        if slot_6_38_2 >= 1 then
                                slot_6_39_1 = slot_6_8_0 * slot_6_9_0 + iter_6_0 * 0.8
                                slot_6_40_0 = draw.Rect(slot_0_27_0 - iter_6_0, slot_0_28_0 - iter_6_0, slot_0_27_0 + slot_6_18_0 + iter_6_0, slot_0_28_0 + slot_6_12_0 + iter_6_0)

                                slot_6_0_0:AddRectFilledRounded(slot_6_40_0, draw.Color(255, 255, 255, slot_0_1_0(slot_6_38_2)), slot_6_39_1, draw.Rounding.All)
                        end
                end
        end

        slot_6_32_0 = draw.Rect(slot_0_27_0, slot_0_28_0, slot_0_27_0 + slot_6_18_0, slot_0_28_0 + slot_6_12_0)

        slot_6_0_0:AddRectFilledRoundedMulticolor(slot_6_32_0, {
                draw.Color(45, 45, 45, 180),
                draw.Color(25, 25, 25, 150),
                draw.Color(15, 15, 15, 150),
                draw.Color(20, 20, 20, 180)
        }, slot_6_8_0 * slot_6_9_0, draw.Rounding.All)

        slot_6_33_0 = slot_0_27_0 + slot_6_15_0
        slot_6_34_0 = slot_0_28_0 + slot_6_12_0 / 2
        slot_6_35_0 = draw.TextParams.WithVH(draw.TextAlignment.CENTER, draw.TextAlignment.LEFT)

        function slot_6_36_0()
                if slot_6_33_0 > slot_0_27_0 + slot_6_15_0 then
                        slot_6_33_0 = slot_6_33_0 + slot_6_17_0
                end
        end

        if slot_6_3_0 then
                slot_6_37_1 = gui.ctx.user.avatar

                if slot_6_37_1 then
                        slot_6_0_0.g:SetTexture(slot_6_37_1)

                        slot_6_0_0.texSz = draw.Vec2(slot_6_13_0, slot_6_13_0)
                        slot_6_38_1 = slot_6_34_0 - slot_6_13_0 / 2
                        slot_6_39_0 = slot_0_2_0(slot_6_8_0 * slot_6_9_0, slot_6_13_0 / 2)

                        slot_6_0_0:AddRectFilledRounded(draw.Rect(slot_6_33_0, slot_6_38_1, slot_6_33_0 + slot_6_13_0, slot_6_38_1 + slot_6_13_0), draw.Color.White(), slot_6_39_0, draw.Rounding.All)

                        slot_6_0_0.g.texture = nil
                        slot_6_0_0.texSz = nil
                        slot_6_33_0 = slot_6_33_0 + slot_6_13_0 + slot_6_16_0
                end

                slot_6_38_0 = gui.ctx.user.username or "Unknown"

                slot_6_0_0:AddText(draw.Vec2(slot_6_33_0, slot_6_34_0), slot_6_38_0, draw.Color.White(), slot_6_35_0)

                slot_6_33_0 = slot_6_33_0 + slot_0_9_0(slot_6_0_0, slot_6_38_0)
        end

        if slot_6_2_0 then
                slot_6_36_0()
                slot_6_0_0:AddText(draw.Vec2(slot_6_33_0, slot_6_34_0), slot_6_21_0, draw.Color.White(), slot_6_35_0)

                slot_6_33_0 = slot_6_33_0 + slot_6_26_0
        end

        if slot_6_4_0 and slot_6_20_0 and slot_6_22_0 ~= "" then
                slot_6_36_0()
                slot_6_0_0:AddText(draw.Vec2(slot_6_33_0, slot_6_34_0), slot_6_22_0, draw.Color.White(), slot_6_35_0)

                slot_6_33_0 = slot_6_33_0 + slot_6_27_0
        end

        if slot_6_5_0 and slot_6_20_0 then
                slot_6_36_0()

                slot_6_37_0 = slot_6_34_0 - slot_6_14_0 / 2

                if slot_0_5_0 then
                        slot_6_0_0.g:SetTexture(slot_0_5_0)

                        slot_6_0_0.texSz = draw.Vec2(slot_6_14_0, slot_6_14_0)

                        slot_6_0_0:AddRectFilled(draw.Rect(slot_6_33_0, slot_6_37_0, slot_6_33_0 + slot_6_14_0, slot_6_37_0 + slot_6_14_0), draw.Color.White())

                        slot_6_0_0.g.texture = nil
                        slot_6_0_0.texSz = nil
                        slot_6_33_0 = slot_6_33_0 + slot_6_14_0 + slot_6_16_0
                else
                        slot_6_0_0:AddText(draw.Vec2(slot_6_33_0, slot_6_34_0), "K: ", draw.Color.White(), slot_6_35_0)

                        slot_6_33_0 = slot_6_33_0 + slot_0_9_0(slot_6_0_0, "K: ")
                end

                slot_6_0_0:AddText(draw.Vec2(slot_6_33_0, slot_6_34_0), slot_6_23_0, draw.Color.White(), slot_6_35_0)

                slot_6_33_0 = slot_6_33_0 + slot_0_9_0(slot_6_0_0, slot_6_23_0) + 10 * slot_6_9_0

                if slot_0_6_0 then
                        slot_6_0_0.g:SetTexture(slot_0_6_0)

                        slot_6_0_0.texSz = draw.Vec2(slot_6_14_0, slot_6_14_0)

                        slot_6_0_0:AddRectFilled(draw.Rect(slot_6_33_0, slot_6_37_0, slot_6_33_0 + slot_6_14_0, slot_6_37_0 + slot_6_14_0), draw.Color.White())

                        slot_6_0_0.g.texture = nil
                        slot_6_0_0.texSz = nil
                        slot_6_33_0 = slot_6_33_0 + slot_6_14_0 + slot_6_16_0
                else
                        slot_6_0_0:AddText(draw.Vec2(slot_6_33_0, slot_6_34_0), "D: ", draw.Color.White(), slot_6_35_0)

                        slot_6_33_0 = slot_6_33_0 + slot_0_9_0(slot_6_0_0, "D: ")
                end

                slot_6_0_0:AddText(draw.Vec2(slot_6_33_0, slot_6_34_0), slot_6_24_0, draw.Color.White(), slot_6_35_0)

                slot_6_33_0 = slot_6_33_0 + slot_0_9_0(slot_6_0_0, slot_6_24_0)
        end
end)
