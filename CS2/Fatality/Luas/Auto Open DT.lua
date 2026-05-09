--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = "misc>matchmaking>untrusted features"
slot_0_1_0 = "rage>aimbot>doubletap"
slot_0_2_0 = gui.ctx:Find(slot_0_0_0)
slot_0_3_0 = gui.ctx:Find(slot_0_1_0)
slot_0_4_0 = gui.ctx:Find("lua>elements a")
slot_0_5_0, slot_0_6_0 = gui.MakeControlEasy("dt_weapons", "Auto DT", "combo_box")
slot_0_5_0.allowMultiple = true

slot_0_5_0:Add(gui.Selectable("dt_w_knife", "Knife"))
slot_0_5_0:Add(gui.Selectable("dt_w_taser", "Taser"))
slot_0_5_0:GetValue():Get():SetRaw(3)
slot_0_4_0:Add(slot_0_6_0)
slot_0_4_0:Reset()

slot_0_7_0 = false
slot_0_8_0 = nil
slot_0_9_0 = nil

function slot_0_10_0(arg_1_0)
        if arg_1_0 then
                return arg_1_0:Get()
        end

        return false
end

function slot_0_11_0(arg_2_0, arg_2_1)
        if arg_2_0 then
                arg_2_0:SetValue(arg_2_1)
        end
end

function slot_0_12_0()
        slot_0_8_0 = slot_0_10_0(slot_0_2_0)
        slot_0_9_0 = slot_0_10_0(slot_0_3_0)

        slot_0_11_0(slot_0_2_0, true)
        slot_0_11_0(slot_0_3_0, true)

        slot_0_7_0 = true
end

function slot_0_13_0()
        if slot_0_9_0 ~= nil then
                slot_0_11_0(slot_0_3_0, slot_0_9_0)
        end

        if slot_0_8_0 ~= nil then
                slot_0_11_0(slot_0_2_0, slot_0_8_0)
        end

        slot_0_8_0 = nil
        slot_0_9_0 = nil
        slot_0_7_0 = false
end

function slot_0_14_0()
        if not game.engine:InGame() then
                return false
        end

        local var_5_0 = entities.GetLocalController()

        if not var_5_0 then
                return false
        end

        local var_5_1 = var_5_0:GetPawn()

        if not var_5_1 then
                return false
        end

        local var_5_2 = var_5_1:GetActiveWeapon()

        if not var_5_2 then
                return false
        end

        local var_5_3 = var_5_2:GetType()
        local var_5_4 = slot_0_5_0:Get()
        local var_5_5 = var_5_4:Get(0)
        local var_5_6 = var_5_4:Get(1)

        if var_5_5 and var_5_3 == CSWeaponType.KNIFE then
                return true
        end

        if var_5_6 and var_5_3 == CSWeaponType.TASER then
                return true
        end

        return false
end

function slot_0_15_0()
        local var_6_0 = slot_0_14_0()

        if var_6_0 and not slot_0_7_0 then
                slot_0_12_0()
        elseif not var_6_0 and slot_0_7_0 then
                slot_0_13_0()
        end
end

events.createMove:Add(slot_0_15_0)

function __shutdown()
        if slot_0_7_0 then
                slot_0_13_0()
        end

        slot_0_4_0:Remove(slot_0_6_0)
        slot_0_4_0:Reset()
end
