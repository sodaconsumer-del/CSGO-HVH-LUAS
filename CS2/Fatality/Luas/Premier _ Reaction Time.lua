--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

math.randomseed(utils.GetUnixTime() * 1000)

slot_0_0_0 = gui.ctx:find("lua>elements a")
slot_0_1_0 = gui.ctx:Find("rage>aimbot>general>autofire")
slot_0_2_0 = gui.ctx:Find("rage>aimbot>general>maximum fov")
slot_0_3_0 = gui.Checkbox(gui.ControlID("checkbox_ReactionTime_free"))
slot_0_4_0 = gui.Slider(gui.ControlID("slider_ReactionTime_free"), 0.1, 3, {
        "%.2f s"
}, 0.01)
slot_0_5_0 = gui.MakeControl("Reaction Time", slot_0_3_0)
slot_0_6_0 = gui.MakeControl("Delay", slot_0_4_0)

slot_0_0_0:Add(slot_0_5_0)
slot_0_0_0:Add(slot_0_6_0)
slot_0_0_0:Reset()

function slot_0_7_0(arg_1_0)
        local var_1_0 = math.sqrt(arg_1_0.x * arg_1_0.x + arg_1_0.y * arg_1_0.y + arg_1_0.z * arg_1_0.z)

        if var_1_0 == 0 then
                return {
                        x = 0,
                        y = 0,
                        z = 0
                }
        end

        return {
                x = arg_1_0.x / var_1_0,
                y = arg_1_0.y / var_1_0,
                z = arg_1_0.z / var_1_0
        }
end

function slot_0_8_0(arg_2_0, arg_2_1)
        return arg_2_0.x * arg_2_1.x + arg_2_0.y * arg_2_1.y + arg_2_0.z * arg_2_1.z
end

function slot_0_9_0(arg_3_0)
        local var_3_0 = math.pi
        local var_3_1 = arg_3_0.x * var_3_0 / 180
        local var_3_2 = arg_3_0.y * var_3_0 / 180
        local var_3_3 = math.sin(var_3_1)
        local var_3_4 = math.cos(var_3_1)
        local var_3_5 = math.sin(var_3_2)
        local var_3_6 = math.cos(var_3_2)

        return {
                x = var_3_4 * var_3_6,
                y = var_3_4 * var_3_5,
                z = -var_3_3
        }
end

function slot_0_10_0(arg_4_0)
        arg_4_0 = math.max(-1, math.min(1, arg_4_0))

        return math.deg(math.acos(arg_4_0))
end

function slot_0_11_0(arg_5_0, arg_5_1)
        local var_5_0 = arg_5_0:GetEyePos()
        local var_5_1 = arg_5_1:GetEyePos()

        if not var_5_0 or not var_5_1 then
                return nil
        end

        local var_5_2 = {
                x = var_5_1.x - var_5_0.x,
                y = var_5_1.y - var_5_0.y,
                z = var_5_1.z - var_5_0.z
        }

        return slot_0_7_0(var_5_2)
end

function slot_0_12_0(arg_6_0)
        if not game.engine:InGame() then
                return nil
        end

        local var_6_0 = game.input:GetViewAngles()

        if not var_6_0 then
                return nil
        end

        local var_6_1 = slot_0_9_0(var_6_0)
        local var_6_2
        local var_6_3 = -1

        entities.players:ForEach(function(arg_7_0)
                local var_7_0 = arg_7_0.entity:ToPlayerPawn()

                if not var_7_0 or not var_7_0:IsAlive() then
                        return
                end

                if not arg_6_0:IsEnemyTo(var_7_0) then
                        return
                end

                local var_7_1 = slot_0_11_0(arg_6_0, var_7_0)

                if not var_7_1 then
                        return
                end

                local var_7_2 = slot_0_8_0(var_6_1, var_7_1)

                if var_7_2 > var_6_3 then
                        var_6_3 = var_7_2
                        var_6_2 = var_7_0
                end
        end)

        return var_6_2, var_6_3
end

function slot_0_13_0(arg_8_0, arg_8_1)
        local var_8_0 = arg_8_0.x - arg_8_1.x
        local var_8_1 = arg_8_0.y - arg_8_1.y
        local var_8_2 = arg_8_0.z - arg_8_1.z

        return math.sqrt(var_8_0 * var_8_0 + var_8_1 * var_8_1 + var_8_2 * var_8_2)
end

function slot_0_14_0(arg_9_0, arg_9_1)
        if not game.engine:InGame() then
                return
        end

        local var_9_0 = ray_t()

        if not arg_9_0 then
                return
        end

        if not arg_9_1 then
                return
        end

        local var_9_1 = arg_9_0:GetEyePos()
        local var_9_2 = arg_9_1:GetEyePos()

        if not var_9_1 or not var_9_2 then
                return false
        end

        local var_9_3 = game.physics_query_interface:TraceRay(var_9_0, var_9_1, var_9_2)

        dist = slot_0_13_0(var_9_1, var_9_2)

        local var_9_4 = 0.97 - (630 - dist) / 630 * 0.57

        if var_9_3 then
                if dist < 630 then
                        if var_9_3 and var_9_4 < var_9_3.fraction then
                                return true
                        end
                elseif dist > 630 and var_9_3 and var_9_3.fraction > 0.97 then
                        return true
                end
        end
end

slot_0_15_0 = {
        reaction_delay = 0,
        reactionStartTime = nil
}

function slot_0_16_0()
        if not game.engine:InGame() then
                return
        end

        if not slot_0_3_0:Get() then
                return
        end

        local var_10_0 = game.global_vars.real_time
        local var_10_1 = entities.GetLocalPawn()

        if not var_10_1 or not var_10_1:IsAlive() then
                slot_0_15_0.reactionStartTime = nil

                return
        end

        local var_10_2, var_10_3 = slot_0_12_0(var_10_1)

        if not var_10_2 then
                slot_0_15_0.reactionStartTime = nil

                slot_0_1_0:SetValue(false)

                return
        end

        if not slot_0_14_0(var_10_1, var_10_2) then
                slot_0_15_0.reactionStartTime = nil

                slot_0_1_0:SetValue(false)

                return
        end

        if slot_0_10_0(var_10_3) > slot_0_2_0:Get() then
                slot_0_15_0.reactionStartTime = nil

                slot_0_1_0:SetValue(false)

                return
        end

        if not slot_0_15_0.reactionStartTime then
                slot_0_15_0.reactionStartTime = var_10_0

                local var_10_4 = slot_0_4_0:Get()

                slot_0_15_0.reaction_delay = var_10_4

                slot_0_1_0:SetValue(false)

                return
        end

        if var_10_0 - slot_0_15_0.reactionStartTime >= slot_0_15_0.reaction_delay then
                slot_0_1_0:SetValue(true)
        else
                slot_0_1_0:SetValue(false)
        end
end

events.present_queue:Add(slot_0_16_0)
