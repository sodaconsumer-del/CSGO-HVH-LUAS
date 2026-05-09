--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = {}
slot_0_3_0 = {}
slot_0_4_0 = -1
slot_0_5_0 = false
slot_0_6_0 = nil
slot_0_7_0 = nil
slot_0_8_0 = nil
slot_0_9_0 = -1
slot_0_10_0 = 90
slot_0_11_0 = nil
slot_0_12_0 = nil
slot_0_13_0 = nil
slot_0_14_0 = nil
slot_0_15_0 = nil
slot_0_16_0 = nil
slot_0_17_0 = nil
slot_0_18_0 = nil
slot_0_19_0 = nil
slot_0_20_1 = gui.GetMainWindow()

if slot_0_20_1 ~= nil then
        slot_0_21_1 = draw.textures.icon_rage or draw.textures.icon_scripts or draw.textures.gui_icon_settings
        slot_0_22_1 = slot_0_20_1:AddTab("semirage_essentials_tab", slot_0_21_1, "Semirage", gui.TabLayoutMode.SUBTABS)
        slot_0_23_1 = slot_0_22_1:AddTab("semirage_essentials_rage", "Rage", gui.TabLayoutMode.DEFAULT, true)
        slot_0_24_1 = slot_0_22_1:AddTab("semirage_essentials_visuals", "Visuals", gui.TabLayoutMode.DEFAULT, false)
        slot_0_25_1 = gui.Group("semirage_essentials>rage_group", "Rage", 286, gui.GroupWidthMode.FULL)
        slot_0_26_1 = gui.Group("semirage_essentials>visuals_group", "Visuals", 160, gui.GroupWidthMode.FULL)
        slot_0_27_1, slot_0_28_1 = gui.MakeControlEasy("semirage_essentials>delay", "Autofire delay ms", "slider", 0, 1000, {
                "%.0fms"
        }, 5)
        slot_0_29_1, slot_0_30_1 = gui.MakeControlEasy("semirage_essentials>smooth", "Aim smooth", "slider", 0, 30, {
                "%.0f"
        }, 1)
        slot_0_31_1, slot_0_32_1 = gui.MakeControlEasy("semirage_essentials>visible_body", "Visible body", "slider", 1, 100, {
                "%.0f%%"
        }, 1)
        slot_0_33_1, slot_0_34_1 = gui.MakeControlEasy("semirage_essentials>adaptive_smooth", "Adaptive smooth", "checkbox")
        slot_0_35_1, slot_0_36_1 = gui.MakeControlEasy("semirage_essentials>force_wait_smooth", "Force wait for smooth", "checkbox")
        slot_0_37_1, slot_0_38_1 = gui.MakeControlEasy("semirage_essentials>strict", "Legacy autofire mode", "checkbox")
        slot_0_39_1, slot_0_40_1 = gui.MakeControlEasy("semirage_essentials>draw_timer", "Draw visible timer", "checkbox")
        slot_0_41_1, slot_0_42_2 = gui.MakeControlEasy("semirage_essentials>draw_fov", "Draw rage FOV", "checkbox")
        slot_0_43_2, slot_0_44_1 = gui.MakeControlEasy("semirage_essentials>fov_color", "FOV color", "color_picker", true)
        slot_0_11_0 = slot_0_27_1
        slot_0_12_0 = slot_0_31_1
        slot_0_13_0 = slot_0_29_1
        slot_0_14_0 = slot_0_33_1
        slot_0_15_0 = slot_0_35_1
        slot_0_16_0 = slot_0_37_1
        slot_0_19_0 = slot_0_39_1
        slot_0_17_0 = slot_0_41_1
        slot_0_18_0 = slot_0_43_2

        slot_0_23_1:Add(slot_0_25_1)
        slot_0_24_1:Add(slot_0_26_1)
        slot_0_25_1:Add(slot_0_28_1)
        slot_0_25_1:Add(slot_0_32_1)
        slot_0_25_1:Add(slot_0_30_1)
        slot_0_25_1:Add(slot_0_34_1)
        slot_0_25_1:Add(slot_0_36_1)
        slot_0_25_1:Add(slot_0_38_1)
        slot_0_26_1:Add(slot_0_40_1)
        slot_0_26_1:Add(slot_0_42_2)
        slot_0_26_1:Add(slot_0_44_1)
end

function slot_0_20_0(arg_1_0)
        for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
                local var_1_0 = gui.ctx:Find(iter_1_1)

                if var_1_0 ~= nil then
                        return var_1_0
                end
        end

        return nil
end

function slot_0_21_0()
        return gui.ctx:Find("rage>aimbot>general>autofire")
end

function slot_0_22_0()
        local var_3_0 = {
                "rage>aimbot>general>maximum fov",
                "rage>aimbot>general>max fov",
                "rage>aimbot>general>maximum_fov",
                "rage>aimbot>general>max_fov"
        }
        local var_3_1 = slot_0_20_0(var_3_0)

        if var_3_1 == nil then
                return nil
        end

        return var_3_1:Get()
end

function slot_0_23_0()
        if slot_0_11_0 == nil then
                return 0
        end

        return slot_0_11_0:Get() / 1000
end

function slot_0_24_0()
        if slot_0_12_0 == nil then
                return 1
        end

        return slot_0_12_0:Get()
end

function slot_0_25_0()
        return slot_0_23_0() <= 0
end

function slot_0_26_0()
        if slot_0_13_0 == nil then
                return 0
        end

        return slot_0_13_0:Get()
end

function slot_0_27_0()
        return slot_0_14_0 ~= nil and slot_0_14_0:Get()
end

function slot_0_28_0()
        return slot_0_15_0 ~= nil and slot_0_15_0:Get()
end

function slot_0_29_0()
        local var_10_0 = slot_0_26_0()

        if var_10_0 <= 0 then
                return 0
        end

        if not slot_0_27_0() then
                return var_10_0
        end

        local var_10_1 = 2 + slot_0_23_0() * 1000 / 1000 * 13

        return math.Clamp(var_10_1, 2, 15)
end

function slot_0_30_0()
        return slot_0_16_0 == nil or not slot_0_16_0:Get()
end

function slot_0_31_0()
        return slot_0_17_0 ~= nil and slot_0_17_0:Get()
end

function slot_0_32_0()
        return slot_0_19_0 ~= nil and slot_0_19_0:Get()
end

function slot_0_33_0()
        if slot_0_18_0 == nil then
                return draw.Color(120, 255, 140, 180)
        end

        return slot_0_18_0:GetValue():Get()
end

function slot_0_34_0(arg_15_0)
        if arg_15_0 < 0 or arg_15_0 > 0.25 then
                return 0
        end

        return arg_15_0
end

function slot_0_35_0(arg_16_0, arg_16_1)
        if arg_16_1 ~= nil then
                arg_16_0[#arg_16_0 + 1] = arg_16_1
        end
end

function slot_0_36_0(arg_17_0, arg_17_1)
        slot_0_35_0(arg_17_0, arg_17_1)
end

function slot_0_37_0(arg_18_0)
        local var_18_0 = arg_18_0:GetAbsOrigin()
        local var_18_1 = {}

        slot_0_36_0(var_18_1, arg_18_0:GetHitboxCenter(EHitBox.HEAD))
        slot_0_36_0(var_18_1, arg_18_0:GetHitboxCenter(EHitBox.NECK))
        slot_0_36_0(var_18_1, arg_18_0:GetHitboxCenter(EHitBox.UPPER_CHEST))
        slot_0_36_0(var_18_1, arg_18_0:GetHitboxCenter(EHitBox.CHEST))
        slot_0_36_0(var_18_1, arg_18_0:GetHitboxCenter(EHitBox.PELVIS))
        slot_0_36_0(var_18_1, var_18_0 + Vector(0, 0, 64))
        slot_0_36_0(var_18_1, var_18_0 + Vector(0, 0, 52))
        slot_0_36_0(var_18_1, var_18_0 + Vector(0, 0, 40))

        return var_18_1
end

function slot_0_38_0(arg_19_0, arg_19_1, arg_19_2)
        if arg_19_0 == nil then
                return false
        end

        if arg_19_0.m_pEnt ~= nil and arg_19_0.m_pEnt == arg_19_1 then
                return true
        end

        return arg_19_0.m_EntHandle ~= nil and arg_19_2 ~= nil and arg_19_0.m_EntHandle == arg_19_2
end

function slot_0_39_0(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
        local var_20_0 = arg_20_0:GetEyePos()
        local var_20_1 = game.physicsQueryInterface:TraceRay(Ray_t(), var_20_0, arg_20_3, false)

        if var_20_1 == nil then
                return false
        end

        if slot_0_38_0(var_20_1, arg_20_1, arg_20_2) then
                return true
        end

        if not var_20_1:DidHitWorld() then
                return true
        end

        return false
end

function slot_0_40_0(arg_21_0, arg_21_1, arg_21_2)
        local var_21_0 = slot_0_37_0(arg_21_1)
        local var_21_1 = 0
        local var_21_2 = #var_21_0
        local var_21_3 = math.max(1, math.ceil(var_21_2 * slot_0_24_0() / 100))

        if var_21_2 == 0 then
                return 0
        end

        for iter_21_0, iter_21_1 in ipairs(var_21_0) do
                if iter_21_1 ~= nil then
                        if slot_0_39_0(arg_21_0, arg_21_1, arg_21_2, iter_21_1) then
                                var_21_1 = var_21_1 + 1

                                if var_21_3 <= var_21_1 then
                                        return var_21_1 / var_21_2 * 100
                                end
                        end

                        if var_21_3 > var_21_1 + (var_21_2 - iter_21_0) then
                                return var_21_1 / var_21_2 * 100
                        end
                end
        end

        return var_21_1 / var_21_2 * 100
end

function slot_0_41_0(arg_22_0, arg_22_1, arg_22_2)
        if arg_22_2 == nil then
                return false
        end

        local var_22_0 = arg_22_2.index
        local var_22_1 = game.globalVars.m_iFrameCount
        local var_22_2 = slot_0_3_0[var_22_0]

        if var_22_2 ~= nil and var_22_2.frame == var_22_1 and var_22_2.threshold == slot_0_24_0() then
                return var_22_2.visible
        end

        local var_22_3 = slot_0_40_0(arg_22_0, arg_22_1, arg_22_2) >= slot_0_24_0()

        slot_0_3_0[var_22_0] = {
                frame = var_22_1,
                threshold = slot_0_24_0(),
                visible = var_22_3
        }

        return var_22_3
end

slot_0_42_1 = nil
slot_0_43_1 = nil

function slot_0_42_0(arg_23_0, arg_23_1)
        local var_23_0 = arg_23_0:GetEyePos()
        local var_23_1 = game.input:GetViewAngles()
        local var_23_2 = math.CalcAngle(var_23_0, arg_23_1:GetEyePos())
        local var_23_3 = math.AngleNormalize(var_23_2.x - var_23_1.x)
        local var_23_4 = math.AngleNormalize(var_23_2.y - var_23_1.y)

        return var_23_3 * var_23_3 + var_23_4 * var_23_4
end

function slot_0_43_0(arg_24_0, arg_24_1)
        local var_24_0 = slot_0_22_0()

        if var_24_0 == nil or var_24_0 <= 0 then
                return false
        end

        return slot_0_42_0(arg_24_0, arg_24_1) <= var_24_0 * var_24_0
end

function slot_0_44_0(arg_25_0, arg_25_1, arg_25_2)
        local var_25_0 = slot_0_42_0(arg_25_0, arg_25_1)

        if slot_0_9_0 ~= arg_25_2 then
                slot_0_7_0 = nil
                slot_0_8_0 = nil
                slot_0_9_0 = arg_25_2
        end

        if slot_0_8_0 ~= nil and var_25_0 >= slot_0_8_0 then
                return
        end

        slot_0_7_0 = math.CalcAngle(arg_25_0:GetEyePos(), arg_25_1:GetEyePos())
        slot_0_8_0 = var_25_0
end

function slot_0_45_0(arg_26_0, arg_26_1)
        local var_26_0 = game.globalVars.m_iFrameCount
        local var_26_1 = slot_0_21_0()

        if slot_0_4_0 ~= var_26_0 then
                slot_0_4_0 = var_26_0
        end

        slot_0_44_0(arg_26_0, arg_26_1, var_26_0)

        if var_26_1 == nil then
                return
        end

        if not slot_0_5_0 then
                slot_0_6_0 = var_26_1:Get()
                slot_0_5_0 = true
        end

        if var_26_1:Get() then
                var_26_1:SetValue(false)
        end
end

function slot_0_46_0(arg_27_0)
        local var_27_0 = slot_0_21_0()

        if var_27_0 == nil then
                return
        end

        if not slot_0_5_0 then
                slot_0_6_0 = var_27_0:Get()
                slot_0_5_0 = true
        end

        if var_27_0:Get() ~= arg_27_0 then
                var_27_0:SetValue(arg_27_0)
        end
end

function slot_0_47_0(arg_28_0, arg_28_1, arg_28_2)
        return arg_28_0 + math.AngleNormalize(arg_28_1 - arg_28_0) / arg_28_2
end

function slot_0_48_0(arg_29_0, arg_29_1)
        local var_29_0 = math.AngleNormalize(arg_29_1.x - arg_29_0.x)
        local var_29_1 = math.AngleNormalize(arg_29_1.y - arg_29_0.y)

        return var_29_0 * var_29_0 + var_29_1 * var_29_1
end

function slot_0_49_0(arg_30_0, arg_30_1)
        if not slot_0_28_0() or slot_0_29_0() <= 0 then
                return true
        end

        local var_30_0 = game.input:GetViewAngles()
        local var_30_1 = math.CalcAngle(arg_30_0:GetEyePos(), arg_30_1:GetEyePos())

        return slot_0_48_0(var_30_0, var_30_1) <= 0.5625
end

function slot_0_50_0(arg_31_0)
        local var_31_0 = game.globalVars.m_iFrameCount

        if slot_0_7_0 == nil or var_31_0 - slot_0_9_0 > 2 or var_31_0 - slot_0_4_0 > 2 then
                return
        end

        local var_31_1 = slot_0_29_0()

        if var_31_1 <= 0 then
                slot_0_7_0 = nil
                slot_0_8_0 = nil
                slot_0_9_0 = -1

                return
        end

        local var_31_2 = arg_31_0:GetViewangles()
        local var_31_3 = Vector(slot_0_47_0(var_31_2.x, slot_0_7_0.x, var_31_1), slot_0_47_0(var_31_2.y, slot_0_7_0.y, var_31_1), var_31_2.z)

        arg_31_0:SetViewangles(var_31_3)
        arg_31_0:LockAngles()
end

function slot_0_51_0(arg_32_0, arg_32_1, arg_32_2)
        if slot_0_25_0() then
                return false
        end

        if arg_32_1 == nil or arg_32_2 == nil or arg_32_1 == arg_32_0 then
                return false
        end

        if not arg_32_1:IsAlive() or not arg_32_1:IsEnemy() or not slot_0_41_0(arg_32_0, arg_32_1, arg_32_2) then
                return false
        end

        if not slot_0_43_0(arg_32_0, arg_32_1) then
                return false
        end

        return (slot_0_0_0[arg_32_2.index] or 0) < slot_0_23_0()
end

function slot_0_52_0(arg_33_0, arg_33_1, arg_33_2)
        if arg_33_1 == nil or arg_33_2 == nil or arg_33_1 == arg_33_0 then
                return false
        end

        if not arg_33_1:IsAlive() or not arg_33_1:IsEnemy() or not slot_0_41_0(arg_33_0, arg_33_1, arg_33_2) then
                return false
        end

        if not slot_0_43_0(arg_33_0, arg_33_1) then
                return false
        end

        if (slot_0_0_0[arg_33_2.index] or 0) < slot_0_23_0() then
                return false
        end

        return slot_0_49_0(arg_33_0, arg_33_1)
end

function slot_0_53_0(arg_34_0, arg_34_1, arg_34_2)
        if slot_0_25_0() or not slot_0_28_0() or slot_0_29_0() <= 0 then
                return false
        end

        if arg_34_1 == nil or arg_34_2 == nil or arg_34_1 == arg_34_0 then
                return false
        end

        if not arg_34_1:IsAlive() or not arg_34_1:IsEnemy() or not slot_0_41_0(arg_34_0, arg_34_1, arg_34_2) then
                return false
        end

        if not slot_0_43_0(arg_34_0, arg_34_1) then
                return false
        end

        if (slot_0_0_0[arg_34_2.index] or 0) < slot_0_23_0() then
                return false
        end

        return not slot_0_49_0(arg_34_0, arg_34_1)
end

function slot_0_54_0(arg_35_0)
        if slot_0_25_0() then
                slot_0_7_0 = nil
                slot_0_8_0 = nil
                slot_0_9_0 = -1

                slot_0_46_0(true)

                return
        end

        local var_35_0 = entities.GetLocalPawn()

        if var_35_0 == nil or not var_35_0:IsAlive() then
                if slot_0_30_0() then
                        slot_0_46_0(false)
                end

                return
        end

        local var_35_1 = false
        local var_35_2 = false
        local var_35_3 = slot_0_30_0()

        entities.players:ForEach(function(arg_36_0)
                if var_35_1 and (var_35_2 or not var_35_3) then
                        return
                end

                local var_36_0 = arg_36_0.entity
                local var_36_1 = arg_36_0.handle

                if var_35_3 and slot_0_52_0(var_35_0, var_36_0, var_36_1) then
                        var_35_2 = true
                end

                if slot_0_51_0(var_35_0, var_36_0, var_36_1) then
                        slot_0_45_0(var_35_0, var_36_0)

                        var_35_1 = true
                elseif slot_0_53_0(var_35_0, var_36_0, var_36_1) then
                        slot_0_45_0(var_35_0, var_36_0)

                        var_35_1 = true
                end
        end)

        if var_35_3 then
                slot_0_46_0(var_35_2)

                return
        end

        if var_35_1 then
                arg_35_0:RemoveButton(InputBitMask_t.IN_ATTACK)
        end
end

function slot_0_55_0()
        local var_37_0 = game.globalVars.m_iFrameCount
        local var_37_1 = slot_0_4_0 == var_37_0 or slot_0_4_0 == var_37_0 - 1
        local var_37_2 = slot_0_21_0()

        if var_37_2 == nil then
                return
        end

        if slot_0_25_0() then
                if slot_0_5_0 then
                        var_37_2:SetValue(true)

                        slot_0_5_0 = false
                        slot_0_6_0 = nil
                elseif not var_37_2:Get() then
                        var_37_2:SetValue(true)
                end

                return
        end

        if slot_0_30_0() then
                return
        end

        if var_37_1 then
                return
        end

        if slot_0_5_0 then
                var_37_2:SetValue(slot_0_6_0 == true)

                slot_0_5_0 = false
                slot_0_6_0 = nil
        end
end

function slot_0_56_0()
        if not slot_0_31_0() then
                return
        end

        local var_38_0 = slot_0_22_0()

        if var_38_0 == nil or var_38_0 <= 0 then
                return
        end

        local var_38_1 = draw.GetDisplay()
        local var_38_2 = draw.Vec2(var_38_1.x * 0.5, var_38_1.y * 0.5)
        local var_38_3 = slot_0_10_0

        if var_38_3 == nil or var_38_3 <= 0 then
                var_38_3 = 90
        end

        local var_38_4 = math.tan(math.rad(var_38_0 * 0.5)) / math.tan(math.rad(var_38_3 * 0.5)) * (var_38_1.x * 0.5)

        if var_38_4 <= 0 then
                return
        end

        draw.surface:AddCircle(var_38_2, var_38_4, slot_0_33_0(), 96, 1, 1, draw.OutlineMode.INSET)
end

function slot_0_57_0(arg_39_0, arg_39_1, arg_39_2)
        slot_0_0_0[arg_39_0] = 0
        slot_0_1_0[arg_39_0] = arg_39_1
        slot_0_2_0[arg_39_0] = arg_39_2
end

events.playerInfoPre:Add(function(arg_40_0)
        local var_40_0 = entities.GetLocalPawn()

        if var_40_0 == nil or not var_40_0:IsAlive() then
                slot_0_0_0 = {}
                slot_0_1_0 = {}
                slot_0_2_0 = {}
                slot_0_3_0 = {}

                return
        end

        local var_40_1 = arg_40_0.entry
        local var_40_2 = var_40_1.entity
        local var_40_3 = var_40_1.handle
        local var_40_4 = var_40_1.visuals

        if var_40_2 == nil or var_40_3 == nil or var_40_4 == nil or var_40_4.isPreview then
                return
        end

        local var_40_5 = var_40_3.index
        local var_40_6 = game.globalVars.m_flRealTime
        local var_40_7 = game.globalVars.m_iFrameCount

        if not var_40_2:IsAlive() or not var_40_2:IsEnemy() or var_40_4.isOutOfScreen then
                slot_0_57_0(var_40_5, var_40_6, var_40_7)

                return
        end

        if not slot_0_41_0(var_40_0, var_40_2, var_40_3) then
                slot_0_57_0(var_40_5, var_40_6, var_40_7)

                return
        end

        if slot_0_2_0[var_40_5] == nil or var_40_7 - slot_0_2_0[var_40_5] > 1 then
                slot_0_0_0[var_40_5] = 0
                slot_0_1_0[var_40_5] = var_40_6
        end

        slot_0_0_0[var_40_5] = (slot_0_0_0[var_40_5] or 0) + slot_0_34_0(var_40_6 - (slot_0_1_0[var_40_5] or var_40_6))
        slot_0_1_0[var_40_5] = var_40_6
        slot_0_2_0[var_40_5] = var_40_7

        if not slot_0_25_0() and slot_0_43_0(var_40_0, var_40_2) and slot_0_0_0[var_40_5] < slot_0_23_0() then
                slot_0_45_0(var_40_0, var_40_2)
        elseif slot_0_53_0(var_40_0, var_40_2, var_40_3) then
                slot_0_45_0(var_40_0, var_40_2)
        end

        if slot_0_32_0() then
                arg_40_0:AddText(EspItemPos.BOTTOM, draw.Color(120, 255, 140, 255), string.format("visible %.2fs", slot_0_0_0[var_40_5]))
        end
end)
events.presentQueue:Add(slot_0_55_0)
events.presentQueue:Add(slot_0_56_0)
events.renderStartPost:Add(function(arg_41_0)
        if arg_41_0 ~= nil and arg_41_0.m_flFOV ~= nil and arg_41_0.m_flFOV > 0 then
                slot_0_10_0 = arg_41_0.m_flFOV
        end
end)
events.createMove:Add(function(arg_42_0)
        slot_0_54_0(arg_42_0)
        slot_0_50_0(arg_42_0)
end)
