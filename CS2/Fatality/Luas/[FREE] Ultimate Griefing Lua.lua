--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = 500
slot_0_1_0 = 50
slot_0_2_0 = {}
slot_0_3_0 = "fatality/grief_data.txt"

function slot_0_4_0()
        local var_1_0 = utils.JsonEncode(slot_0_2_0)

        if var_1_0 then
                utils.FileWrite(slot_0_3_0, utils.StringToArray(var_1_0))
        end
end

;(function()
        if utils.FileExists(slot_0_3_0) then
                local var_2_0 = utils.FileRead(slot_0_3_0)

                if var_2_0 then
                        local var_2_1 = utils.ArrayToString(var_2_0)

                        if var_2_1 and var_2_1 ~= "" then
                                local var_2_2 = utils.JsonDecode(var_2_1)

                                if type(var_2_2) == "table" then
                                        slot_0_2_0 = var_2_2
                                end
                        end
                end
        end
end)()

function slot_0_6_0(arg_3_0)
        if not arg_3_0 then
                return "[?]"
        end

        local var_3_0

        if arg_3_0.m_iTeamNum then
                var_3_0 = arg_3_0.m_iTeamNum:Get()
        end

        if not var_3_0 then
                local var_3_1 = arg_3_0:GetPawn()

                if var_3_1 and var_3_1.m_iTeamNum then
                        var_3_0 = var_3_1.m_iTeamNum:Get()
                end
        end

        if not var_3_0 then
                return "[?]"
        end

        if var_3_0 == 3 then
                return "[CT]"
        elseif var_3_0 == 2 then
                return "[T]"
        else
                return "[?]"
        end
end

slot_0_7_0 = gui.ctx:Find("lua>elements a")
slot_0_8_0 = gui.Spacer("bb_spacer", 0)
slot_0_9_0 = gui.Checkbox("bb_on")
slot_0_10_0 = gui.Slider("bb_x", 0, 3840, {
        "%.0f px"
}, 10)
slot_0_11_0 = gui.Slider("bb_y", 0, 2160, {
        "%.0f px"
}, 10)
slot_0_12_0 = gui.Checkbox("bb_jump")
slot_0_13_0 = gui.Checkbox("bb_ign_enemy")
slot_0_14_0 = gui.Checkbox("bb_ign_friend")
slot_0_15_0 = gui.Checkbox("bb_dot")
slot_0_16_0 = gui.ColorPicker("bb_dot_c")
slot_0_17_0 = gui.Checkbox("bb_grid")
slot_0_18_0 = gui.ColorPicker("bb_grid_c")
slot_0_19_0 = gui.Spacer("ds_spacer", 0)
slot_0_20_0 = gui.Checkbox("ds_on")
slot_0_21_0 = gui.Slider("ds_cd", 0, 0.5, {
        "%.2fs"
}, 0.01)
slot_0_22_0 = gui.Spacer("gt_spacer", 0)
slot_0_23_0 = gui.Checkbox("gt_on")
slot_0_24_0 = gui.Slider("gt_x", 0, 2560, {
        "%.0f px"
}, 10)
slot_0_25_0 = gui.Slider("gt_y", 0, 1440, {
        "%.0f px"
}, 10)
slot_0_26_0 = gui.Button("gt_clear", "Clear Data")
slot_0_27_0 = gui.Spacer("vr_spacer", 0)
slot_0_28_0 = gui.Checkbox("vr_on")
slot_0_29_0 = gui.Checkbox("vr_chat")
slot_0_30_0 = gui.Checkbox("vr_local")
slot_0_31_0 = gui.Checkbox("vr_notif")
slot_0_32_0 = gui.Spacer("molo_spacer", 0)
slot_0_33_0 = gui.Checkbox("molo_on")
slot_0_34_0 = gui.ColorPicker("molo_color")
slot_0_35_0 = gui.Checkbox("molo_name")
slot_0_36_0 = gui.Checkbox("molo_timer")

slot_0_26_0:AddCallback(function()
        slot_0_2_0 = {}

        slot_0_4_0()
end)
slot_0_7_0:Add(gui.MakeControl("--- BLOCKBOT ---", slot_0_8_0))
slot_0_7_0:Add(gui.MakeControl("Blockbot", slot_0_9_0))
slot_0_7_0:Add(gui.MakeControl("Status Pos X", slot_0_10_0))
slot_0_7_0:Add(gui.MakeControl("Status Pos Y", slot_0_11_0))
slot_0_7_0:Add(gui.MakeControl("Jump Sync", slot_0_12_0))
slot_0_7_0:Add(gui.MakeControl("Ignore Enemies", slot_0_13_0))
slot_0_7_0:Add(gui.MakeControl("Ignore Teammates", slot_0_14_0))
slot_0_7_0:Add(gui.MakeControl("Draw Target", slot_0_15_0))
slot_0_7_0:Add(gui.MakeControl("  Dot Color", slot_0_16_0))
slot_0_7_0:Add(gui.MakeControl("Draw Grid", slot_0_17_0))
slot_0_7_0:Add(gui.MakeControl("  Grid Color", slot_0_18_0))
slot_0_7_0:Add(gui.MakeControl("--- DOOR SPAM ---", slot_0_19_0))
slot_0_7_0:Add(gui.MakeControl("Enable Door Spam", slot_0_20_0))
slot_0_7_0:Add(gui.MakeControl("Cooldown", slot_0_21_0))
slot_0_7_0:Add(gui.MakeControl("--- GRIEF TRACKER ---", slot_0_22_0))
slot_0_7_0:Add(gui.MakeControl("Enable Tracker", slot_0_23_0))
slot_0_7_0:Add(gui.MakeControl("Table Pos X", slot_0_24_0))
slot_0_7_0:Add(gui.MakeControl("Table Pos Y", slot_0_25_0))
slot_0_7_0:Add(gui.MakeControl("Manage DB", slot_0_26_0))
slot_0_7_0:Add(gui.MakeControl("--- VOTE REVEALER ---", slot_0_27_0))
slot_0_7_0:Add(gui.MakeControl("Enable Vote Revealer", slot_0_28_0))
slot_0_7_0:Add(gui.MakeControl("Write to Chat", slot_0_29_0))
slot_0_7_0:Add(gui.MakeControl("Local Print (Console)", slot_0_30_0))
slot_0_7_0:Add(gui.MakeControl("Show Notifications", slot_0_31_0))
slot_0_7_0:Add(gui.MakeControl("--- MOLOTOV ESP ---", slot_0_32_0))
slot_0_7_0:Add(gui.MakeControl("Teammate Molotov ESP", slot_0_33_0))
slot_0_7_0:Add(gui.MakeControl("  Zone Color", slot_0_34_0))
slot_0_7_0:Add(gui.MakeControl("  Show Owner Name", slot_0_35_0))
slot_0_7_0:Add(gui.MakeControl("  Show Timer", slot_0_36_0))
slot_0_7_0:Reset()
slot_0_16_0:GetValue():Set(draw.Color(255, 80, 30, 255))
slot_0_18_0:GetValue():Set(draw.Color(0, 180, 255, 255))
slot_0_15_0:SetValue(true)
slot_0_17_0:SetValue(true)
slot_0_21_0:GetValue():Set(0)
slot_0_24_0:GetValue():Set(100)
slot_0_25_0:GetValue():Set(400)
slot_0_28_0:SetValue(true)
slot_0_30_0:SetValue(true)
slot_0_31_0:SetValue(true)
slot_0_34_0:GetValue():Set(draw.Color(255, 120, 30, 255))
slot_0_33_0:SetValue(true)
slot_0_35_0:SetValue(true)
slot_0_36_0:SetValue(true)

slot_0_37_0 = {
        freeze_end_time = 0,
        last_door_spam = 0,
        mode = "OFF",
        tgt_grounded = true
}
slot_0_38_0 = {}
slot_0_39_0 = 7.2
slot_0_40_0 = false

function slot_0_41_0()
        if slot_0_37_0.handle == nil then
                return nil
        end

        local var_5_0 = slot_0_37_0.handle:Get()

        if var_5_0 == nil then
                slot_0_37_0.handle = nil

                return nil
        end

        if not var_5_0:IsAlive() then
                slot_0_37_0.handle = nil

                return nil
        end

        return var_5_0
end

function slot_0_42_0()
        slot_0_37_0.handle = nil
        slot_0_37_0.tgt_grounded = true
        slot_0_37_0.mode = "SEARCHING"
end

mods.events:AddListener("player_hurt")
mods.events:AddListener("player_death")
mods.events:AddListener("round_freeze_end")
mods.events:AddListener("vote_cast")
mods.events:AddListener("call_vote")
mods.events:AddListener("vote_passed")
mods.events:AddListener("vote_failed")
mods.events:AddListener("vote_ended")
mods.events:AddListener("molotov_detonate")
mods.events:AddListener("inferno_startburn")
mods.events:AddListener("inferno_expire")
events.event:Add(function(arg_7_0)
        slot_7_1_0 = arg_7_0:GetName()

        if slot_7_1_0 == "game_newmap" then
                slot_0_37_0.handle = nil
                slot_0_37_0.freeze_end_time = 0
                slot_0_38_0 = {}
        elseif slot_7_1_0 == "round_start" then
                slot_0_37_0.handle = nil
                slot_0_38_0 = {}
        elseif slot_7_1_0 == "round_freeze_end" then
                slot_0_37_0.freeze_end_time = game.globalVars.m_flRealTime + 8
        elseif slot_7_1_0 == "player_hurt" then
                slot_7_2_6 = arg_7_0:GetController("attacker")
                slot_7_3_4 = arg_7_0:GetController("userid")

                if slot_7_2_6 and slot_7_3_4 and slot_7_2_6 ~= slot_7_3_4 and not slot_7_2_6:IsEnemy() and not slot_7_3_4:IsEnemy() then
                        slot_7_4_5 = slot_7_2_6:GetName()

                        if slot_7_4_5 and slot_7_4_5 ~= "" then
                                slot_7_5_5 = arg_7_0:GetInt("dmg_health")

                                if not slot_0_2_0[slot_7_4_5] then
                                        slot_0_2_0[slot_7_4_5] = {
                                                kills = 0,
                                                dmg = 0
                                        }
                                end

                                slot_0_2_0[slot_7_4_5].dmg = slot_0_2_0[slot_7_4_5].dmg + slot_7_5_5

                                slot_0_4_0()
                        end
                end
        elseif slot_7_1_0 == "player_death" then
                slot_7_2_5 = arg_7_0:GetController("attacker")
                slot_7_3_3 = arg_7_0:GetController("userid")

                if slot_0_37_0.handle ~= nil and slot_7_3_3 ~= nil then
                        slot_7_4_4 = slot_7_3_3:GetPawn()
                        slot_7_5_4 = slot_0_37_0.handle:Get()

                        if slot_7_4_4 ~= nil and slot_7_5_4 ~= nil and slot_7_4_4 == slot_7_5_4 then
                                slot_0_37_0.handle = nil
                        end
                end

                if slot_7_2_5 and slot_7_3_3 and slot_7_2_5 ~= slot_7_3_3 and not slot_7_2_5:IsEnemy() and not slot_7_3_3:IsEnemy() then
                        slot_7_4_3 = slot_7_2_5:GetName()

                        if slot_7_4_3 and slot_7_4_3 ~= "" then
                                if not slot_0_2_0[slot_7_4_3] then
                                        slot_0_2_0[slot_7_4_3] = {
                                                kills = 0,
                                                dmg = 0
                                        }
                                end

                                slot_0_2_0[slot_7_4_3].kills = slot_0_2_0[slot_7_4_3].kills + 1

                                slot_0_4_0()
                        end
                end
        elseif slot_7_1_0 == "call_vote" then
                if slot_0_28_0:GetValue():Get() then
                        slot_7_2_4 = arg_7_0:GetString("reason") or "Unknown"
                        slot_7_3_2 = arg_7_0:GetString("param1") or ""
                        slot_7_4_2 = arg_7_0:GetController("userid")
                        slot_7_5_3 = slot_7_4_2 and slot_0_6_0(slot_7_4_2) .. " " .. slot_7_4_2:GetName() or "Someone"
                        slot_7_6_3 = slot_7_4_2 and slot_7_4_2:IsEnemy() and "Enemy Team" or "Local Team"
                        slot_7_7_0 = string.format("Vote Started in %s! Caller: %s (Reason: %s %s)", slot_7_6_3, slot_7_5_3, slot_7_2_4, slot_7_3_2)

                        if slot_0_29_0:GetValue():Get() then
                                game.engine:ClientCmd("say_team \"[VoteRevealer] " .. slot_7_7_0 .. "\"")
                        end

                        if slot_0_30_0:GetValue():Get() then
                                print("[VoteRevealer] " .. slot_7_7_0)
                        end

                        if slot_0_31_0:GetValue():Get() then
                                gui.notify:Add(gui.Notification("Vote Started", slot_7_7_0))
                        end
                end
        elseif slot_7_1_0 == "vote_cast" then
                if slot_0_28_0:GetValue():Get() then
                        slot_7_2_3 = arg_7_0:GetInt("vote_option")
                        slot_7_3_1 = arg_7_0:GetController("userid") or arg_7_0:GetController("entityid")
                        slot_7_4_1 = slot_7_3_1 and slot_0_6_0(slot_7_3_1) .. " " .. slot_7_3_1:GetName() or "Unknown Player"
                        slot_7_5_2 = "UNKNOWN"
                        slot_7_5_1 = slot_7_2_3 == 0 and "YES" or slot_7_2_3 == 1 and "NO" or tostring(slot_7_2_3)
                        slot_7_6_2 = string.format("%s - %s", slot_7_4_1, slot_7_5_1)

                        if slot_0_29_0:GetValue():Get() then
                                game.engine:ClientCmd("say_team \"[VoteRevealer] " .. slot_7_6_2 .. "\"")
                        end

                        if slot_0_30_0:GetValue():Get() then
                                print("[VoteRevealer] " .. slot_7_6_2)
                        end

                        if slot_0_31_0:GetValue():Get() then
                                gui.notify:Add(gui.Notification("Vote Cast", slot_7_6_2))
                        end
                end
        elseif slot_7_1_0 == "vote_passed" or slot_7_1_0 == "vote_failed" or slot_7_1_0 == "vote_ended" then
                if slot_0_28_0:GetValue():Get() then
                        slot_7_2_2 = slot_7_1_0 == "vote_passed" and "Vote Passed!" or "Vote Failed/Ended"

                        if slot_0_30_0:GetValue():Get() then
                                print("[VoteRevealer] " .. slot_7_2_2)
                        end

                        if slot_0_31_0:GetValue():Get() then
                                gui.notify:Add(gui.Notification("Vote Result", slot_7_2_2))
                        end
                end
        elseif slot_7_1_0 == "molotov_detonate" then
                if slot_0_33_0:GetValue():Get() then
                        slot_7_2_1 = arg_7_0:GetController("userid")

                        if slot_7_2_1 and not slot_7_2_1:IsEnemy() then
                                slot_7_3_0 = slot_7_2_1:GetName() or "Teammate"
                                slot_7_4_0 = arg_7_0:GetFloat("x")
                                slot_7_5_0 = arg_7_0:GetFloat("y")
                                slot_7_6_1 = arg_7_0:GetFloat("z")

                                if slot_7_4_0 ~= 0 or slot_7_5_0 ~= 0 or slot_7_6_1 ~= 0 then
                                        table.insert(slot_0_38_0, {
                                                x = slot_7_4_0,
                                                y = slot_7_5_0,
                                                z = slot_7_6_1,
                                                owner = slot_7_3_0,
                                                start_time = game.globalVars.m_flRealTime,
                                                ent_id = arg_7_0:GetInt("entityid")
                                        })
                                end
                        end
                end
        elseif slot_7_1_0 == "inferno_expire" then
                slot_7_2_0 = arg_7_0:GetInt("entityid")

                for iter_7_0 = #slot_0_38_0, 1, -1 do
                        if slot_0_38_0[iter_7_0].ent_id == slot_7_2_0 then
                                table.remove(slot_0_38_0, iter_7_0)

                                break
                        end
                end
        end
end)
events.createMove:Add(function(arg_8_0)
        if slot_0_20_0:GetValue():Get() then
                slot_8_1_1 = slot_0_21_0:GetValue():Get()
                slot_8_2_1 = game.globalVars.m_flRealTime

                if slot_8_1_1 <= 0.01 then
                        if game.globalVars.m_iTickCount % 2 == 0 then
                                arg_8_0:SetButton(InputBitMask_t.IN_USE)
                        else
                                arg_8_0:RemoveButton(InputBitMask_t.IN_USE)
                        end
                elseif slot_8_1_1 <= slot_8_2_1 - slot_0_37_0.last_door_spam then
                        slot_0_37_0.last_door_spam = slot_8_2_1

                        arg_8_0:SetButton(InputBitMask_t.IN_USE)
                else
                        arg_8_0:RemoveButton(InputBitMask_t.IN_USE)
                end
        end

        if not slot_0_9_0:GetValue():Get() then
                slot_0_37_0.mode = "OFF"

                slot_0_42_0()

                return
        end

        slot_8_1_0 = entities.GetLocalPawn()

        if not slot_8_1_0 or not slot_8_1_0:IsAlive() then
                slot_0_42_0()

                return
        end

        slot_8_2_0 = slot_0_41_0()
        slot_8_3_0 = slot_8_1_0:GetAbsOrigin()

        if not slot_8_3_0 then
                return
        end

        if not slot_8_2_0 then
                slot_8_4_1 = slot_0_0_0
                slot_8_5_1 = nil
                slot_8_6_1 = slot_0_13_0:GetValue():Get()
                slot_8_7_1 = slot_0_14_0:GetValue():Get()

                entities.players:ForEach(function(arg_9_0)
                        local var_9_0 = arg_9_0.entity

                        if not var_9_0 or not var_9_0:IsAlive() or var_9_0 == slot_8_1_0 then
                                return
                        end

                        if slot_8_6_1 and var_9_0:IsEnemy() then
                                return
                        end

                        if slot_8_7_1 and not var_9_0:IsEnemy() then
                                return
                        end

                        local var_9_1 = var_9_0:GetAbsOrigin()

                        if not var_9_1 then
                                return
                        end

                        local var_9_2 = slot_8_3_0:Dist(var_9_1)

                        if var_9_2 < slot_8_4_1 then
                                slot_8_4_1 = var_9_2
                                slot_8_5_1 = arg_9_0.handle
                        end
                end)

                if slot_8_5_1 then
                        slot_0_37_0.handle = slot_8_5_1
                        slot_8_2_0 = slot_0_41_0()
                else
                        slot_0_37_0.mode = "SEARCHING"

                        return
                end
        end

        if not slot_8_2_0 then
                return
        end

        slot_8_4_0 = slot_8_2_0:GetAbsOrigin()
        slot_8_5_0 = slot_8_2_0:GetAbsVelocity()
        slot_8_6_0 = slot_8_1_0:GetAbsVelocity()

        if not slot_8_4_0 or not slot_8_5_0 or not slot_8_6_0 then
                return
        end

        slot_8_7_0 = slot_8_3_0.z > slot_8_4_0.z + slot_0_1_0
        slot_0_37_0.mode = slot_8_7_0 and "HEAD" or "FRONT"
        slot_8_8_0 = 0.05
        slot_8_9_0 = slot_8_4_0.x + slot_8_5_0.x * slot_8_8_0
        slot_8_10_0 = slot_8_4_0.y + slot_8_5_0.y * slot_8_8_0
        slot_8_11_0 = slot_8_9_0 - slot_8_3_0.x
        slot_8_12_0 = slot_8_10_0 - slot_8_3_0.y
        slot_8_13_0 = slot_8_6_0.x * slot_8_8_0
        slot_8_14_0 = slot_8_6_0.y * slot_8_8_0
        slot_8_15_0 = 0
        slot_8_16_0 = 0
        slot_8_17_0 = 2
        slot_8_18_0 = arg_8_0:GetViewangles()
        slot_8_19_0 = math.rad(slot_8_18_0.y)
        slot_8_20_0 = math.cos(slot_8_19_0)
        slot_8_21_0 = math.sin(slot_8_19_0)
        slot_8_22_0 = 50

        if slot_8_7_0 then
                if math.abs(slot_8_11_0) > 0.5 then
                        if slot_8_11_0 > 0 and slot_8_11_0 - slot_8_13_0 < 0 or slot_8_11_0 < 0 and slot_8_11_0 - slot_8_13_0 > 0 then
                                slot_8_15_0 = -slot_8_11_0 * slot_8_17_0
                        else
                                slot_8_15_0 = slot_8_11_0
                        end
                end

                if math.abs(slot_8_12_0) > 0.5 then
                        if slot_8_12_0 > 0 and slot_8_12_0 - slot_8_14_0 < 0 or slot_8_12_0 < 0 and slot_8_12_0 - slot_8_14_0 > 0 then
                                slot_8_16_0 = -slot_8_12_0 * slot_8_17_0
                        else
                                slot_8_16_0 = slot_8_12_0
                        end
                end

                slot_8_23_1 = slot_8_15_0 * slot_8_20_0 + slot_8_16_0 * slot_8_21_0
                slot_8_24_1 = -slot_8_15_0 * slot_8_21_0 + slot_8_16_0 * slot_8_20_0

                arg_8_0:SetForwardMove(math.Clamp(slot_8_23_1 * slot_8_22_0, -1, 1))
                arg_8_0:SetLeftMove(math.Clamp(slot_8_24_1 * slot_8_22_0, -1, 1))
        else
                if math.abs(slot_8_4_0.x - slot_8_3_0.x) > math.abs(slot_8_4_0.y - slot_8_3_0.y) then
                        if math.abs(slot_8_12_0) > 0.5 then
                                if slot_8_12_0 > 0 and slot_8_12_0 - slot_8_14_0 < 0 or slot_8_12_0 < 0 and slot_8_12_0 - slot_8_14_0 > 0 then
                                        slot_8_16_0 = -slot_8_12_0 * slot_8_17_0
                                else
                                        slot_8_16_0 = slot_8_12_0
                                end
                        end
                elseif math.abs(slot_8_11_0) > 0.5 then
                        if slot_8_11_0 > 0 and slot_8_11_0 - slot_8_13_0 < 0 or slot_8_11_0 < 0 and slot_8_11_0 - slot_8_13_0 > 0 then
                                slot_8_15_0 = -slot_8_11_0 * slot_8_17_0
                        else
                                slot_8_15_0 = slot_8_11_0
                        end
                end

                slot_8_25_0 = -slot_8_15_0 * slot_8_21_0 + slot_8_16_0 * slot_8_20_0

                if math.abs(slot_8_25_0) > 0.01 then
                        arg_8_0:SetLeftMove(math.Clamp(slot_8_25_0 * slot_8_22_0, -1, 1))

                        slot_8_26_0 = slot_8_1_0.m_fFlags:Get()

                        if not (slot_8_26_0 ~= nil and bit.band(slot_8_26_0, 1) ~= 0) then
                                arg_8_0:SetForwardMove(0)
                        end
                else
                        arg_8_0:SetLeftMove(0)
                end
        end

        if slot_0_12_0:GetValue():Get() then
                slot_8_23_0 = slot_8_2_0.m_fFlags:Get()
                slot_8_24_0 = slot_8_23_0 ~= nil and bit.band(slot_8_23_0, 1) ~= 0

                if not slot_8_24_0 and slot_0_37_0.tgt_grounded then
                        arg_8_0:SetButton(InputBitMask_t.IN_JUMP)
                end

                slot_0_37_0.tgt_grounded = slot_8_24_0
        end
end)
events.presentQueue:Add(function()
        if not game.engine:InGame() then
                return
        end

        slot_10_0_0 = draw.surface
        slot_10_0_0.font = draw.fonts.gui_main
        slot_10_1_0, slot_10_2_0 = game.engine:GetScreenSize()

        if not slot_0_40_0 and slot_10_2_0 > 0 then
                if slot_0_10_0:GetValue():Get() == 0 and slot_0_11_0:GetValue():Get() == 0 then
                        slot_0_10_0:GetValue():Set(18)
                        slot_0_11_0:GetValue():Set(slot_10_2_0 - 80)
                end

                slot_0_40_0 = true
        end

        if slot_0_23_0:GetValue():Get() then
                slot_10_3_1 = slot_0_24_0:GetValue():Get()
                slot_10_4_1 = slot_0_25_0:GetValue():Get()
                slot_10_5_1 = 330
                slot_10_6_1 = slot_0_37_0.freeze_end_time - game.globalVars.m_flRealTime

                if slot_10_6_1 > 0 then
                        slot_10_0_0:AddText(draw.Vec2(slot_10_3_1, slot_10_4_1 - 18), string.format("Grief Cooldown: %.1f sec...   | DONT SHOOT!", slot_10_6_1), draw.Color(255, 50, 50, 255))
                else
                        slot_10_0_0:AddText(draw.Vec2(slot_10_3_1, slot_10_4_1 - 18), "No Grief Cooldown  | Can Shoot", draw.Color(50, 255, 50, 255))
                end

                slot_10_7_2 = 0

                slot_10_0_0:AddRectFilled(draw.Rect(slot_10_3_1, slot_10_4_1, slot_10_3_1 + slot_10_5_1, slot_10_4_1 + 24), draw.Color(25, 20, 20, 220))
                slot_10_0_0:AddText(draw.Vec2(slot_10_3_1 + 8, slot_10_4_1 + 4), "Name", draw.Color(220, 220, 220, 255))
                slot_10_0_0:AddText(draw.Vec2(slot_10_3_1 + 160, slot_10_4_1 + 4), "Team Damage", draw.Color(220, 220, 220, 255))
                slot_10_0_0:AddText(draw.Vec2(slot_10_3_1 + 260, slot_10_4_1 + 4), "Team Kills", draw.Color(220, 220, 220, 255))

                slot_10_7_1 = slot_10_7_2 + 24

                entities.controllers:ForEach(function(arg_11_0)
                        slot_11_1_0 = arg_11_0.entity

                        if not slot_11_1_0 then
                                return
                        end

                        if not slot_11_1_0:IsEnemy() then
                                slot_11_2_0 = slot_11_1_0:GetName()

                                if slot_11_2_0 and slot_11_2_0 ~= "" then
                                        slot_11_3_0 = slot_0_2_0[slot_11_2_0] or {
                                                kills = 0,
                                                dmg = 0
                                        }
                                        slot_11_4_0 = slot_10_7_1 / 24 % 2 == 0 and draw.Color(55, 40, 30, 210) or draw.Color(45, 30, 20, 210)

                                        slot_10_0_0:AddRectFilled(draw.Rect(slot_10_3_1, slot_10_4_1 + slot_10_7_1, slot_10_3_1 + slot_10_5_1, slot_10_4_1 + slot_10_7_1 + 24), slot_11_4_0)
                                        slot_10_0_0:AddText(draw.Vec2(slot_10_3_1 + 8, slot_10_4_1 + slot_10_7_1 + 4), slot_11_2_0, draw.Color(0, 180, 220, 255))

                                        slot_11_5_0 = math.Clamp(slot_11_3_0.dmg / 300, 0, 1)
                                        slot_11_6_0 = draw.Color(50, 200, 50, 255)

                                        if slot_11_5_0 > 0.66 then
                                                slot_11_6_0 = draw.Color(220, 50, 50, 255)
                                        elseif slot_11_5_0 > 0.33 then
                                                slot_11_6_0 = draw.Color(200, 200, 50, 255)
                                        end

                                        slot_10_0_0:AddRectFilled(draw.Rect(slot_10_3_1 + 145, slot_10_4_1 + slot_10_7_1 + 6, slot_10_3_1 + 155, slot_10_4_1 + slot_10_7_1 + 16), slot_11_6_0)
                                        slot_10_0_0:AddText(draw.Vec2(slot_10_3_1 + 160, slot_10_4_1 + slot_10_7_1 + 4), string.format("%d/300", slot_11_3_0.dmg), draw.color.White())

                                        slot_11_7_0 = math.Clamp(slot_11_3_0.kills / 3, 0, 1)
                                        slot_11_8_0 = draw.Color(50, 200, 50, 255)

                                        if slot_11_7_0 >= 0.66 then
                                                slot_11_8_0 = draw.Color(220, 50, 50, 255)
                                        elseif slot_11_7_0 >= 0.33 then
                                                slot_11_8_0 = draw.Color(200, 200, 50, 255)
                                        end

                                        slot_10_0_0:AddRectFilled(draw.Rect(slot_10_3_1 + 245, slot_10_4_1 + slot_10_7_1 + 6, slot_10_3_1 + 255, slot_10_4_1 + slot_10_7_1 + 16), slot_11_8_0)
                                        slot_10_0_0:AddText(draw.Vec2(slot_10_3_1 + 260, slot_10_4_1 + slot_10_7_1 + 4), string.format("%d/3", slot_11_3_0.kills), draw.color.White())

                                        slot_10_7_1 = slot_10_7_1 + 24
                                end
                        end
                end)
        end

        slot_10_3_0 = slot_0_9_0:GetValue():Get()
        slot_10_4_0 = slot_0_41_0()
        slot_10_5_0 = slot_10_4_0 ~= nil
        slot_10_6_0 = nil
        slot_10_7_0 = nil

        if slot_10_5_0 then
                slot_10_6_0 = "Blockbot  \f00ff00ff" .. slot_0_37_0.mode
                slot_10_7_0 = "Blockbot  " .. slot_0_37_0.mode
        elseif slot_10_3_0 then
                slot_10_6_0 = "Blockbot  \ffffc832fSEARCHING"
                slot_10_7_0 = "Blockbot  SEARCHING"
        else
                slot_10_6_0 = "Blockbot  \f888888ffOFF"
                slot_10_7_0 = "Blockbot  OFF"
        end

        slot_10_8_0 = slot_0_10_0:GetValue():Get()
        slot_10_9_0 = slot_0_11_0:GetValue():Get()
        slot_10_10_0 = slot_10_0_0.font:GetTextSize(slot_10_7_0)
        slot_10_11_0 = 6

        slot_10_0_0:AddRectFilledRounded(draw.Rect(slot_10_8_0 - slot_10_11_0, slot_10_9_0 - slot_10_11_0, slot_10_8_0 + slot_10_10_0.x + slot_10_11_0, slot_10_9_0 + slot_10_10_0.y + slot_10_11_0), draw.Color(12, 12, 12, 165), 4)
        slot_10_0_0:AddText(draw.Vec2(slot_10_8_0, slot_10_9_0), slot_10_6_0, draw.color.White())

        if not slot_10_5_0 then
                return
        end

        slot_10_12_0 = slot_10_4_0:GetAbsOrigin()

        if not slot_10_12_0 then
                return
        end

        if slot_0_15_0:GetValue():Get() then
                slot_10_13_1 = slot_0_16_0:GetValue():Get()
                slot_10_14_1 = math.WorldToScreen(Vector(slot_10_12_0.x, slot_10_12_0.y, slot_10_12_0.z + 73))

                if slot_10_14_1 then
                        slot_10_0_0:AddCircleFilled(slot_10_14_1, 10, slot_10_13_1:ModA(0.25))
                        slot_10_0_0:AddCircleFilled(slot_10_14_1, 6, slot_10_13_1)
                        slot_10_0_0:AddCircle(slot_10_14_1, 6, draw.Color(0, 0, 0, 160), 0, 1, 1.5)
                        slot_10_0_0:AddCircleFilled(slot_10_14_1, 2, draw.Color(255, 255, 255, 230))
                end
        end

        if slot_0_17_0:GetValue():Get() then
                slot_10_13_0 = slot_0_18_0:GetValue():Get()
                slot_10_14_0 = 56
                slot_10_15_0 = 7
                slot_10_16_0 = slot_10_14_0 / slot_10_15_0
                slot_10_17_0 = slot_10_12_0.z + 2

                function slot_10_18_0(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5)
                        local var_12_0 = math.WorldToScreen(Vector(arg_12_0, arg_12_1, slot_10_17_0))
                        local var_12_1 = math.WorldToScreen(Vector(arg_12_2, arg_12_3, slot_10_17_0))

                        if var_12_0 and var_12_1 then
                                slot_10_0_0:AddLine(var_12_0, var_12_1, slot_10_13_0:ModA(arg_12_4), arg_12_5)
                        end
                end

                for iter_10_0 = -slot_10_15_0, slot_10_15_0 do
                        slot_10_23_0 = iter_10_0 * slot_10_16_0
                        slot_10_24_0 = iter_10_0 * slot_10_16_0
                        slot_10_25_0 = iter_10_0 == 0
                        slot_10_26_0 = 1 - math.abs(slot_10_23_0) / slot_10_14_0
                        slot_10_27_0 = 1 - math.abs(slot_10_24_0) / slot_10_14_0

                        slot_10_18_0(slot_10_12_0.x - slot_10_14_0, slot_10_12_0.y + slot_10_24_0, slot_10_12_0.x + slot_10_14_0, slot_10_12_0.y + slot_10_24_0, slot_10_25_0 and 0.9 or slot_10_27_0 * 0.4 + 0.06, slot_10_25_0 and 2 or 1)
                        slot_10_18_0(slot_10_12_0.x + slot_10_23_0, slot_10_12_0.y - slot_10_14_0, slot_10_12_0.x + slot_10_23_0, slot_10_12_0.y + slot_10_14_0, slot_10_25_0 and 0.9 or slot_10_26_0 * 0.4 + 0.06, slot_10_25_0 and 2 or 1)
                end

                slot_10_19_0 = math.WorldToScreen(Vector(slot_10_12_0.x, slot_10_12_0.y, slot_10_17_0))

                if slot_10_19_0 then
                        slot_10_0_0:AddCircle(slot_10_19_0, 5, slot_10_13_0:ModA(0.9), 0, 1, 1.8)
                end
        end
end)
events.presentQueue:Add(function()
        if not slot_0_33_0:GetValue():Get() then
                return
        end

        if not game.engine:InGame() then
                return
        end

        slot_13_0_0 = game.globalVars.m_flRealTime

        for iter_13_0 = #slot_0_38_0, 1, -1 do
                if slot_13_0_0 - slot_0_38_0[iter_13_0].start_time > slot_0_39_0 + 1 then
                        table.remove(slot_0_38_0, iter_13_0)
                end
        end

        if #slot_0_38_0 == 0 then
                return
        end

        slot_13_1_0 = draw.surface
        slot_13_2_0 = slot_0_34_0:GetValue():Get()
        slot_13_3_0 = slot_0_35_0:GetValue():Get()
        slot_13_4_0 = slot_0_36_0:GetValue():Get()
        slot_13_5_0 = 175
        slot_13_6_0 = 48

        for iter_13_1, iter_13_2 in ipairs(slot_0_38_0) do
                slot_13_12_0 = slot_0_39_0 - (slot_13_0_0 - iter_13_2.start_time)

                if slot_13_12_0 < 0 then
                        slot_13_12_0 = 0
                end

                slot_13_13_0 = slot_13_12_0 < 1.5 and slot_13_12_0 / 1.5 or 1
                slot_13_14_0 = math.WorldToScreen(Vector(iter_13_2.x, iter_13_2.y, iter_13_2.z))
                slot_13_15_0 = nil

                for iter_13_3 = 0, slot_13_6_0 do
                        slot_13_20_1 = iter_13_3 / slot_13_6_0 * math.pi * 2
                        slot_13_21_1 = math.WorldToScreen(Vector(iter_13_2.x + math.cos(slot_13_20_1) * slot_13_5_0, iter_13_2.y + math.sin(slot_13_20_1) * slot_13_5_0, iter_13_2.z))

                        if slot_13_21_1 and slot_13_15_0 then
                                slot_13_1_0:AddLine(slot_13_15_0, slot_13_21_1, slot_13_2_0:ModA(slot_13_13_0 * 0.7), 1.5)
                        end

                        slot_13_15_0 = slot_13_21_1
                end

                if slot_13_14_0 then
                        slot_13_1_0:AddCircleFilled(slot_13_14_0, 6, slot_13_2_0:ModA(slot_13_13_0 * 0.5))
                        slot_13_1_0:AddCircle(slot_13_14_0, 6, draw.Color(0, 0, 0, math.floor(slot_13_13_0 * 150)), 0, 1, 1.5)

                        slot_13_1_0.font = draw.fonts.gui_bold or draw.fonts.gui_main
                        slot_13_16_1 = {}

                        if slot_13_3_0 then
                                slot_13_16_1[#slot_13_16_1 + 1] = iter_13_2.owner
                        end

                        if slot_13_4_0 then
                                slot_13_16_1[#slot_13_16_1 + 1] = string.format("%.1fs", slot_13_12_0)
                        end

                        if #slot_13_16_1 > 0 then
                                slot_13_17_1 = table.concat(slot_13_16_1, " | ")
                                slot_13_18_0 = slot_13_1_0.font:GetTextSize(slot_13_17_1)
                                slot_13_19_0 = slot_13_14_0.x - slot_13_18_0.x * 0.5
                                slot_13_20_0 = slot_13_14_0.y - 22

                                slot_13_1_0:AddRectFilledRounded(draw.Rect(slot_13_19_0 - 5, slot_13_20_0 - 2, slot_13_19_0 + slot_13_18_0.x + 5, slot_13_20_0 + slot_13_18_0.y + 2), draw.Color(15, 10, 5, math.floor(slot_13_13_0 * 160)), 3)
                                slot_13_1_0:AddText(draw.Vec2(slot_13_19_0, slot_13_20_0), slot_13_17_1, slot_13_2_0:ModA(slot_13_13_0 * 0.9))
                        end

                        slot_13_1_0.font = draw.fonts.gui_main
                end

                slot_13_16_0 = slot_13_5_0 * 0.45
                slot_13_17_0 = nil

                for iter_13_4 = 0, 24 do
                        slot_13_22_0 = iter_13_4 / 24 * math.pi * 2
                        slot_13_23_0 = math.WorldToScreen(Vector(iter_13_2.x + math.cos(slot_13_22_0) * slot_13_16_0, iter_13_2.y + math.sin(slot_13_22_0) * slot_13_16_0, iter_13_2.z))

                        if slot_13_23_0 and slot_13_17_0 then
                                slot_13_1_0:AddLine(slot_13_17_0, slot_13_23_0, slot_13_2_0:ModA(slot_13_13_0 * 0.25), 1)
                        end

                        slot_13_17_0 = slot_13_23_0
                end
        end
end)
