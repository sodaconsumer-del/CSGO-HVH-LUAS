--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:Find("misc>movement>edge jump")
slot_0_1_0 = gui.ctx:Find("misc>movement>autostrafer")
slot_0_2_0 = nil
slot_0_3_0 = false

function slot_0_4_0(arg_1_0)
        if not slot_0_0_0 or not slot_0_1_0 then
                return
        end

        local var_1_0 = entities.GetLocalPawn()

        if not var_1_0 or not var_1_0:IsAlive() then
                return
        end

        local var_1_1 = var_1_0.m_fFlags:Get()
        local var_1_2 = bit.band(var_1_1, 1) == 1
        local var_1_3 = slot_0_0_0:GetHotkeyState()
        local var_1_4 = var_1_2 and var_1_3

        if var_1_4 and not slot_0_3_0 then
                local var_1_5 = slot_0_1_0:GetValue()
                local var_1_6 = var_1_5:Get()

                slot_0_2_0 = var_1_6:GetRaw()

                var_1_6:SetRaw(0)
                var_1_5:Set(var_1_6)

                slot_0_3_0 = true
        elseif not var_1_4 and slot_0_3_0 then
                if slot_0_2_0 ~= nil then
                        local var_1_7 = slot_0_1_0:GetValue()
                        local var_1_8 = var_1_7:Get()

                        var_1_8:SetRaw(slot_0_2_0)
                        var_1_7:Set(var_1_8)

                        slot_0_2_0 = nil
                end

                slot_0_3_0 = false
        end
end

events.createMove:Add(slot_0_4_0)
