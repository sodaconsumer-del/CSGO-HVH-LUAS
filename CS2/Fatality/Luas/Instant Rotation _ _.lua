--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = "InstantRotation"
slot_0_1_0 = {
        yawJitterAmount = 90,
        yawJitterOption = 2,
        timerDuration = 0.023,
        jitterDisablerOption = 0
}
slot_0_2_0 = {
        overrideLeft = "rage>anti-aim>angles>manual override>override left",
        overrideForward = "rage>anti-aim>angles>manual override>override forward",
        overrideBack = "rage>anti-aim>angles>manual override>override back",
        yawJitterAmount = "rage>anti-aim>angles>yaw jitter>settings>amount",
        yawJitter = "rage>anti-aim>angles>yaw jitter",
        overrideRight = "rage>anti-aim>angles>manual override>override right",
        jitterDisabler = "rage>anti-aim>angles>jitter disabler"
}
slot_0_3_0 = {
        override_back = nil
}
slot_0_4_0 = {
        remove_jitter = nil,
        enable = nil
}
slot_0_5_0 = {
        saved = false
}
slot_0_6_0 = {
        start_time = 0,
        active = false
}

function slot_0_7_0()
        slot_0_3_0.yaw_jitter = gui.ctx:Find(slot_0_2_0.yawJitter)
        slot_0_3_0.yaw_jitter_amount = gui.ctx:Find(slot_0_2_0.yawJitterAmount)
        slot_0_3_0.jitter_disabler = gui.ctx:Find(slot_0_2_0.jitterDisabler)
        slot_0_3_0.override_left = gui.ctx:Find(slot_0_2_0.overrideLeft)
        slot_0_3_0.override_right = gui.ctx:Find(slot_0_2_0.overrideRight)
        slot_0_3_0.override_back = gui.ctx:Find(slot_0_2_0.overrideBack)
        slot_0_3_0.override_forward = gui.ctx:Find(slot_0_2_0.overrideForward)
end

function slot_0_8_0(arg_2_0)
        if not arg_2_0 then
                return 0
        end

        local var_2_0 = arg_2_0:GetValue()

        if not var_2_0 then
                return 0
        end

        local var_2_1 = var_2_0:Get()

        if not var_2_1 or not var_2_1.GetRaw then
                return 0
        end

        return var_2_1:GetRaw() or 0
end

function slot_0_9_0(arg_3_0, arg_3_1)
        if not arg_3_0 then
                return
        end

        local var_3_0 = arg_3_0:GetValue()

        if not var_3_0 then
                return
        end

        local var_3_1 = var_3_0:Get()

        if not var_3_1 or not var_3_1.Reset or not var_3_1.SetRaw then
                return
        end

        var_3_1:Reset()
        var_3_1:SetRaw(arg_3_1 or 0)
        arg_3_0:GetValue():Set(var_3_1)
end

function slot_0_10_0(arg_4_0)
        if not arg_4_0 then
                return 0
        end

        local var_4_0 = arg_4_0:GetValue()

        if not var_4_0 then
                return 0
        end

        return var_4_0:Get() or 0
end

function slot_0_11_0(arg_5_0, arg_5_1)
        if not arg_5_0 then
                return
        end

        local var_5_0 = arg_5_0:GetValue()

        if var_5_0 and var_5_0.Set then
                var_5_0:Set(arg_5_1 or 0)
        end
end

function slot_0_12_0()
        if slot_0_5_0.saved then
                return
        end

        slot_0_5_0.yaw_jitter_raw = slot_0_8_0(slot_0_3_0.yaw_jitter)
        slot_0_5_0.yaw_jitter_amount = slot_0_10_0(slot_0_3_0.yaw_jitter_amount)
        slot_0_5_0.jitter_disabler_raw = slot_0_8_0(slot_0_3_0.jitter_disabler)
        slot_0_5_0.saved = true
end

function slot_0_13_0()
        if not slot_0_5_0.saved then
                return
        end

        slot_0_9_0(slot_0_3_0.yaw_jitter, slot_0_5_0.yaw_jitter_raw)
        slot_0_11_0(slot_0_3_0.yaw_jitter_amount, slot_0_5_0.yaw_jitter_amount)
        slot_0_9_0(slot_0_3_0.jitter_disabler, slot_0_5_0.jitter_disabler_raw)

        slot_0_5_0.saved = false
end

function slot_0_14_0()
        slot_0_9_0(slot_0_3_0.yaw_jitter, slot_0_1_0.yawJitterOption)
        slot_0_11_0(slot_0_3_0.yaw_jitter_amount, slot_0_1_0.yawJitterAmount)
        slot_0_9_0(slot_0_3_0.jitter_disabler, slot_0_1_0.jitterDisablerOption)
end

function slot_0_15_0()
        if not slot_0_4_0.enable:GetValue():Get() then
                return
        end

        if not slot_0_4_0.remove_jitter:GetValue():Get() then
                return
        end

        if not slot_0_5_0.saved then
                slot_0_12_0()
        end

        slot_0_6_0.active = true
        slot_0_6_0.start_time = game.globalVars.m_flRealTime
end

function slot_0_16_0()
        local var_10_0 = {
                slot_0_3_0.override_left,
                slot_0_3_0.override_right,
                slot_0_3_0.override_back,
                slot_0_3_0.override_forward
        }

        for iter_10_0, iter_10_1 in ipairs(var_10_0) do
                if iter_10_1 and iter_10_1.AddCallback then
                        iter_10_1:AddCallback(slot_0_15_0)
                end
        end
end

function slot_0_17_0()
        local var_11_0 = slot_0_4_0.enable:GetValue():Get()
        local var_11_1 = slot_0_4_0.remove_jitter:GetValue():Get()

        if not var_11_0 then
                if slot_0_5_0.saved then
                        slot_0_13_0()
                end

                slot_0_6_0.active = false

                return
        end

        if not var_11_1 then
                if not slot_0_5_0.saved then
                        slot_0_12_0()
                end

                slot_0_14_0()

                slot_0_6_0.active = false
        elseif slot_0_6_0.active then
                if game.globalVars.m_flRealTime - slot_0_6_0.start_time < slot_0_1_0.timerDuration then
                        slot_0_14_0()
                else
                        slot_0_13_0()

                        slot_0_6_0.active = false
                end
        end
end

function slot_0_18_0()
        local var_12_0 = gui.ctx:Find("lua>elements a")

        if not var_12_0 then
                print("[" .. slot_0_0_0 .. "] 无法找到 lua>elements a 容器")

                return false
        end

        slot_0_4_0.enable = gui.Checkbox(gui.ControlID("instant_rotation.enable"))

        local var_12_1 = gui.MakeControl("Instant Rotation", slot_0_4_0.enable)

        var_12_0:Add(var_12_1)

        slot_0_4_0.remove_jitter = gui.Checkbox(gui.ControlID("instant_rotation.remove_jitter"))

        local var_12_2 = gui.MakeControl("Remove Jitter", slot_0_4_0.remove_jitter)

        var_12_0:Add(var_12_2)
        var_12_0:Reset()

        return true
end

;(function()
        slot_0_7_0()

        if not slot_0_18_0() then
                return
        end

        slot_0_16_0()
        events.presentQueue:Add(slot_0_17_0)
end)()
