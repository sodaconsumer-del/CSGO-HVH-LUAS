--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        SCOUT_DEFIDX = 40,
        GROUND_PS = 79,
        GROUND_HC = 68,
        HC_MAX = 85,
        HC_MIN = 15,
        SHOW_HUD = true,
        PS_BEST = 90,
        HC_WORST = 75,
        HC_BEST = 20,
        AIR_BLOCK_CONE = 0.12,
        PS_WORST = 35
}
slot_0_1_0 = {
        vz = 0,
        blocked = false,
        isScout = false,
        inacc = 0,
        isAir = false,
        hc = slot_0_0_0.GROUND_HC,
        ps = slot_0_0_0.GROUND_PS
}

function slot_0_2_0(arg_1_0, arg_1_1, arg_1_2)
        return arg_1_0 < arg_1_1 and arg_1_1 or arg_1_2 < arg_1_0 and arg_1_2 or arg_1_0
end

function slot_0_3_0(arg_2_0, arg_2_1, arg_2_2)
        arg_2_0 = slot_0_2_0(arg_2_0, 0, 1)

        return arg_2_1 + arg_2_0 * (arg_2_2 - arg_2_1)
end

function slot_0_4_0(arg_3_0, arg_3_1)
        if arg_3_1 and arg_3_0 > slot_0_0_0.AIR_BLOCK_CONE then
                return nil, nil
        end

        local var_3_0 = slot_0_2_0(arg_3_0 / slot_0_0_0.AIR_BLOCK_CONE, 0, 1)
        local var_3_1 = math.floor(slot_0_3_0(var_3_0, slot_0_0_0.HC_BEST, slot_0_0_0.HC_WORST))
        local var_3_2 = math.floor(slot_0_3_0(var_3_0, slot_0_0_0.PS_BEST, slot_0_0_0.PS_WORST))
        local var_3_3 = slot_0_2_0(var_3_1, slot_0_0_0.HC_MIN, slot_0_0_0.HC_MAX)
        local var_3_4 = slot_0_2_0(var_3_2, slot_0_0_0.PS_WORST, slot_0_0_0.PS_BEST)

        return var_3_3, var_3_4
end

function slot_0_5_0(arg_4_0, arg_4_1)
        local var_4_0 = gui.GetActiveOverridePath()

        if not var_4_0 or var_4_0 == "" then
                return
        end

        local var_4_1 = gui.ctx:Find(var_4_0 .. ">weapon>hitchance")

        if var_4_1 then
                local var_4_2 = var_4_1:GetValue()

                if var_4_2 then
                        var_4_2:Set(arg_4_0)
                end
        end

        local var_4_3 = gui.ctx:Find(var_4_0 .. ">weapon>pointscale")

        if var_4_3 then
                local var_4_4 = var_4_3:GetValue()

                if var_4_4 then
                        var_4_4:Set(arg_4_1)
                end
        end
end

function slot_0_6_0(arg_5_0)
        local var_5_0 = arg_5_0:GetActiveWeapon()

        if not var_5_0 then
                return false
        end

        return var_5_0:GetDefIndex() == slot_0_0_0.SCOUT_DEFIDX
end

events.createMove:Add(function(arg_6_0)
        slot_0_1_0.isScout = false
        slot_0_1_0.blocked = false

        local var_6_0 = entities.GetLocalPawn()

        if not var_6_0 or not var_6_0:IsAlive() then
                return
        end

        if not slot_0_6_0(var_6_0) then
                return
        end

        slot_0_1_0.isScout = true

        local var_6_1 = var_6_0:GetAbsVelocity()

        slot_0_1_0.vz = var_6_1.z
        slot_0_1_0.isAir = math.abs(slot_0_1_0.vz) > 2

        local var_6_2 = var_6_0:GetActiveWeapon()
        local var_6_3 = var_6_2:GetInaccuracy(CSWeaponMode.PRIMARY_MODE)
        local var_6_4 = var_6_2:GetSpread(CSWeaponMode.PRIMARY_MODE)

        slot_0_1_0.inacc = var_6_3 + var_6_4

        local var_6_5, var_6_6 = slot_0_4_0(slot_0_1_0.inacc, slot_0_1_0.isAir)

        if not slot_0_1_0.isAir then
                slot_0_1_0.hc = slot_0_0_0.GROUND_HC
                slot_0_1_0.ps = slot_0_0_0.GROUND_PS
                slot_0_1_0.blocked = false

                return
        end

        if var_6_5 == nil then
                slot_0_1_0.blocked = true

                arg_6_0:RemoveButton(InputBitMask_t.IN_ATTACK)
                slot_0_5_0(slot_0_0_0.GROUND_HC, slot_0_0_0.GROUND_PS)
        else
                slot_0_1_0.hc = var_6_5
                slot_0_1_0.ps = var_6_6

                slot_0_5_0(var_6_5, var_6_6)
        end
end)

if slot_0_0_0.SHOW_HUD then
        events.presentQueue:Add(function()
                if not slot_0_1_0.isScout then
                        return
                end

                slot_7_0_0 = draw.surface

                if not slot_7_0_0 then
                        return
                end

                slot_7_1_0 = draw.fonts.gui_bold or draw.fonts.gui_main

                if not slot_7_1_0 then
                        return
                end

                slot_7_0_0.font = slot_7_1_0
                slot_7_2_0 = 14
                slot_7_3_5 = 14
                slot_7_4_0 = 220

                slot_7_0_0:AddRectFilled(draw.Rect(slot_7_2_0 - 5, slot_7_3_5 - 5, slot_7_2_0 + slot_7_4_0 + 5, slot_7_3_5 + 100), draw.Color(6, 6, 10, 190))
                slot_7_0_0:AddRect(draw.Rect(slot_7_2_0 - 5, slot_7_3_5 - 5, slot_7_2_0 + slot_7_4_0 + 5, slot_7_3_5 + 100), draw.Color(140, 40, 220, 215))
                slot_7_0_0:AddText(draw.Vec2(slot_7_2_0, slot_7_3_5), "JUMPSCOUT OPTIMIZER v0.1.1", draw.Color(200, 130, 255, 255))

                slot_7_3_4 = slot_7_3_5 + 18
                slot_7_5_0 = slot_0_2_0(slot_0_1_0.inacc / (slot_0_0_0.AIR_BLOCK_CONE * 2), 0, 1)
                slot_7_6_0 = slot_7_4_0
                slot_7_7_0 = math.floor(slot_7_6_0 * slot_7_5_0)
                slot_7_8_0 = math.floor(255 * slot_7_5_0)
                slot_7_9_0 = math.floor(255 * (1 - slot_7_5_0))

                slot_7_0_0:AddRectFilled(draw.Rect(slot_7_2_0, slot_7_3_4, slot_7_2_0 + slot_7_6_0, slot_7_3_4 + 9), draw.Color(20, 20, 20, 200))

                if slot_7_7_0 > 0 then
                        slot_7_0_0:AddRectFilled(draw.Rect(slot_7_2_0, slot_7_3_4, slot_7_2_0 + slot_7_7_0, slot_7_3_4 + 9), draw.Color(slot_7_8_0, slot_7_9_0, 15, 240))
                end

                slot_7_0_0:AddRect(draw.Rect(slot_7_2_0, slot_7_3_4, slot_7_2_0 + slot_7_6_0, slot_7_3_4 + 9), draw.Color(75, 75, 75, 180))

                slot_7_3_3 = slot_7_3_4 + 13
                slot_7_10_0 = slot_0_1_0.isAir and "AIR" or "GND"
                slot_7_11_0 = string.format("vZ=%+.0f", slot_0_1_0.vz)

                slot_7_0_0:AddText(draw.Vec2(slot_7_2_0, slot_7_3_3), slot_7_10_0, draw.Color(255, 255, 255, 255))
                slot_7_0_0:AddText(draw.Vec2(slot_7_2_0 + 45, slot_7_3_3), slot_7_11_0, draw.Color(185, 185, 185, 255))

                slot_7_3_2 = slot_7_3_3 + 14

                slot_7_0_0:AddText(draw.Vec2(slot_7_2_0, slot_7_3_2), string.format("Cone=%.5f  thr=%.3f", slot_0_1_0.inacc, slot_0_0_0.AIR_BLOCK_CONE), draw.Color(170, 170, 170, 255))

                slot_7_3_1 = slot_7_3_2 + 14

                slot_7_0_0:AddText(draw.Vec2(slot_7_2_0, slot_7_3_1), string.format("HC=%d%%   PS=%d%%", slot_0_1_0.hc, slot_0_1_0.ps), draw.Color(130, 215, 255, 255))

                slot_7_3_0 = slot_7_3_1 + 14

                if slot_0_1_0.blocked then
                        slot_7_0_0:AddText(draw.Vec2(slot_7_2_0, slot_7_3_0), "BLOCKED — wait for apex", draw.Color(255, 70, 35, 255))
                elseif slot_0_1_0.isAir then
                        slot_7_12_0 = 1 - slot_0_2_0(slot_0_1_0.inacc / slot_0_0_0.AIR_BLOCK_CONE, 0, 1)
                        slot_7_13_0 = math.floor(255 * (1 - slot_7_12_0))
                        slot_7_14_0 = math.floor(255 * slot_7_12_0)

                        slot_7_0_0:AddText(draw.Vec2(slot_7_2_0, slot_7_3_0), string.format("FIRE  quality=%.0f%%", slot_7_12_0 * 100), draw.Color(slot_7_13_0, slot_7_14_0, 40, 255))
                else
                        slot_7_0_0:AddText(draw.Vec2(slot_7_2_0, slot_7_3_0), "GROUND — settings applied", draw.Color(150, 150, 150, 200))
                end
        end)
end

function __shutdown()
        slot_0_5_0(slot_0_0_0.GROUND_HC, slot_0_0_0.GROUND_PS)
        print("[JumpScout v0.1.1] Unloaded.")
end

print("[JumpScout v0.1.1] Loaded. HC logic fixed!")
