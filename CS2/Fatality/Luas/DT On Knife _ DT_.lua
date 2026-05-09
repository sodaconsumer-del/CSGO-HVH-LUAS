--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:Find("lua>elements a")
slot_0_1_0 = gui.Checkbox(gui.ControlID("knifeDT_enable"))

slot_0_0_0:Add(gui.MakeControl("DT On Knife", slot_0_1_0))
slot_0_0_0:Reset()

slot_0_2_0 = gui.ctx:Find("rage>aimbot>doubletap")

events.presentQueue:Add(function()
        if not slot_0_1_0:GetValue():Get() then
                if slot_0_2_0:GetValue():Get() then
                        slot_0_2_0:GetValue():Set(false)
                end

                return
        end

        local var_1_0 = entities.GetLocalPawn()

        if not var_1_0 or not var_1_0:IsAlive() then
                return
        end

        local var_1_1 = var_1_0:GetActiveWeapon()

        if not var_1_1 then
                return
        end

        local var_1_2 = var_1_1:GetType() == csweapon_type.knife

        if var_1_2 ~= slot_0_2_0:GetValue():Get() then
                slot_0_2_0:GetValue():Set(var_1_2)
        end
end)
