--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:Find("lua>elements a")

if not slot_0_0_0 then
        return
end

slot_0_1_0 = gui.Checkbox("tm_aim_enable")
slot_0_2_0 = gui.MakeControl("Teammate Aimbot", slot_0_1_0)
slot_0_3_0 = gui.Slider("tm_aim_fov", 1, 180, "%.0f°")
slot_0_4_0 = gui.MakeControl("FOV", slot_0_3_0)
slot_0_5_0 = gui.Slider("tm_aim_smooth", 1, 20, "%.1f")
slot_0_6_0 = gui.MakeControl("Smoothing", slot_0_5_0)

slot_0_0_0:Add(slot_0_2_0)
slot_0_0_0:Add(slot_0_4_0)
slot_0_0_0:Add(slot_0_6_0)
slot_0_0_0:Reset()

if slot_0_3_0:GetValue():Get() == 0 then
        slot_0_3_0:GetValue():Set(180)
end

if slot_0_5_0:GetValue():Get() == 0 then
        slot_0_5_0:GetValue():Set(1)
end

slot_0_7_0 = nil
slot_0_8_0 = 9999

function slot_0_9_0(arg_1_0)
        while arg_1_0 > 180 do
                arg_1_0 = arg_1_0 - 360
        end

        while arg_1_0 < -180 do
                arg_1_0 = arg_1_0 + 360
        end

        return arg_1_0
end

function slot_0_10_0(arg_2_0, arg_2_1)
        local var_2_0 = slot_0_9_0(arg_2_0.x - arg_2_1.x)
        local var_2_1 = slot_0_9_0(arg_2_0.y - arg_2_1.y)

        return math.sqrt(var_2_0 * var_2_0 + var_2_1 * var_2_1)
end

events.presentQueue:Add(function()
        slot_0_7_0 = nil
        slot_0_8_0 = 9999

        if not slot_0_1_0:GetValue():Get() then
                return
        end

        if not game.engine:InGame() then
                return
        end

        local var_3_0 = entities.GetLocalPawn()

        if not var_3_0 or not var_3_0:IsAlive() then
                return
        end

        local var_3_1 = var_3_0:GetEyePos()

        if not var_3_1 then
                return
        end

        local var_3_2 = game.input:GetViewAngles()
        local var_3_3 = slot_0_3_0:GetValue():Get()

        entities.players:ForEach(function(arg_4_0)
                local var_4_0 = arg_4_0.entity

                if not var_4_0 then
                        return
                end

                if var_4_0 == var_3_0 then
                        return
                end

                if not var_4_0:IsAlive() then
                        return
                end

                if var_4_0:IsEnemy() then
                        return
                end

                local var_4_1 = var_4_0:GetHitboxCenter(EHitBox.HEAD)

                if not var_4_1 then
                        return
                end

                local var_4_2 = math.CalcAngle(var_3_1, var_4_1)
                local var_4_3 = slot_0_10_0(var_3_2, var_4_2)

                if var_4_3 < var_3_3 and var_4_3 < slot_0_8_0 then
                        slot_0_8_0 = var_4_3
                        slot_0_7_0 = var_4_1
                end
        end)
end)
events.createMove:Add(function(arg_5_0)
        if not slot_0_1_0:GetValue():Get() then
                return
        end

        if not slot_0_7_0 then
                return
        end

        local var_5_0 = entities.GetLocalPawn()

        if not var_5_0 or not var_5_0:IsAlive() then
                return
        end

        local var_5_1 = var_5_0:GetEyePos()

        if not var_5_1 then
                return
        end

        local var_5_2 = math.CalcAngle(var_5_1, slot_0_7_0)
        local var_5_3 = arg_5_0:GetViewangles()
        local var_5_4 = slot_0_5_0:GetValue():Get()
        local var_5_5 = slot_0_9_0(var_5_2.x - var_5_3.x)
        local var_5_6 = slot_0_9_0(var_5_2.y - var_5_3.y)
        local var_5_7 = Vector(0, 0, 0)

        var_5_7.x = var_5_3.x + var_5_5 / var_5_4
        var_5_7.y = var_5_3.y + var_5_6 / var_5_4
        var_5_7.z = 0

        if var_5_7.x > 89 then
                var_5_7.x = 89
        end

        if var_5_7.x < -89 then
                var_5_7.x = -89
        end

        arg_5_0:SetViewangles(var_5_7)
        game.input:SetViewAngles(var_5_7)
end)

function __shutdown()
        return
end

print("[Teammate Aimbot] Loaded")
