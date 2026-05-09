--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = game.engine
slot_0_1_0 = math.floor
slot_0_2_0 = gui.Checkbox("lua_glitch_enable_hurt")

slot_0_2_0:GetValue():Set(true)

slot_0_3_0 = gui.MakeControl("Enable Damage Glitch", slot_0_2_0)
slot_0_4_0 = gui.ctx:Find("lua>elements a")

if slot_0_4_0 then
        slot_0_4_0:Add(slot_0_3_0)
        slot_0_4_0:Reset()
end

slot_0_5_0 = {
        {
                0,
                255,
                255
        },
        {
                255,
                0,
                255
        },
        {
                0,
                0,
                0
        },
        {
                255,
                255,
                255
        }
}
slot_0_6_0 = 0
slot_0_7_0 = 0

events.event:Add(function(arg_1_0)
        if not slot_0_2_0:GetValue():Get() then
                return
        end

        if arg_1_0:GetName() == "player_hurt" then
                local var_1_0 = entities.GetLocalController()

                if not var_1_0 then
                        return
                end

                if arg_1_0:GetController("userid") == var_1_0 and arg_1_0:GetInt("health") > 0 then
                        slot_0_7_0 = 1
                end
        end
end)
events.presentQueue:Add(function()
        local var_2_0 = game.globalVars.m_flAbsFrameTime

        if slot_0_6_0 < slot_0_7_0 then
                slot_0_6_0 = slot_0_6_0 + 10 * var_2_0

                if slot_0_6_0 >= slot_0_7_0 then
                        slot_0_6_0 = slot_0_7_0
                        slot_0_7_0 = 0
                end
        else
                slot_0_6_0 = slot_0_6_0 - 1.2 * var_2_0

                if slot_0_6_0 < 0 then
                        slot_0_6_0 = 0
                end
        end

        if slot_0_6_0 <= 0 then
                return
        end

        local var_2_1 = draw.surface

        var_2_1.skipDpi = true

        local var_2_2, var_2_3 = slot_0_0_0:GetScreenSize()
        local var_2_4 = slot_0_1_0(slot_0_6_0 * 10 * math.random(1, 3))

        if var_2_4 < 1 and slot_0_6_0 > 0.1 then
                var_2_4 = 1
        end

        for iter_2_0 = 1, var_2_4 do
                local var_2_5 = math.random(2, 12)
                local var_2_6 = math.random(slot_0_1_0(var_2_2 * 0.2), var_2_2)
                local var_2_7 = math.random(-50, var_2_2 - slot_0_1_0(var_2_6 / 2))
                local var_2_8 = math.random(0, var_2_3 - var_2_5)
                local var_2_9 = slot_0_5_0[math.random(1, #slot_0_5_0)]
                local var_2_10 = math.random(20, 120)
                local var_2_11 = slot_0_1_0(var_2_10 * slot_0_6_0)

                if var_2_11 > 0 then
                        local var_2_12 = draw.Rect(var_2_7, var_2_8, var_2_7 + var_2_6, var_2_8 + var_2_5)

                        var_2_1:AddRectFilled(var_2_12, draw.Color(var_2_9[1], var_2_9[2], var_2_9[3], var_2_11))

                        if math.random() > 0.7 then
                                local var_2_13 = math.random(-10, 10)
                                local var_2_14 = draw.Rect(var_2_7 + var_2_13, var_2_8, var_2_7 + var_2_6 + var_2_13, var_2_8 + var_2_5)

                                var_2_1:AddRectFilled(var_2_14, draw.Color(255, 0, 0, slot_0_1_0(var_2_11 * 0.5)))
                        end
                end
        end
end)
