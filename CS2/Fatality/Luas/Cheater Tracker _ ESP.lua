--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = {}
slot_0_3_0 = {}
slot_0_4_0 = "threat_esp_config"
slot_0_5_0 = {
        position = "left",
        style = "icon",
        show_steam_ids = false,
        enabled = false,
        esp_color = {
                g = 23,
                a = 255,
                b = 80,
                r = 194
        }
}
slot_0_6_0 = nil
slot_0_7_0 = {}

function slot_0_8_0(arg_1_0, arg_1_1)
        gui.notify:add(gui.notification(arg_1_0, arg_1_1))
end

function slot_0_9_0()
        local var_2_0 = {
                threats = slot_0_0_0,
                enabled = slot_0_5_0.enabled,
                show_steam_ids = slot_0_5_0.show_steam_ids,
                style = slot_0_5_0.style,
                position = slot_0_5_0.position,
                esp_color = slot_0_5_0.esp_color
        }

        if not utils.DbSave(var_2_0, slot_0_4_0) then
                print("[Threat Markers] Failed to save settings")
        end
end

function slot_0_10_0()
        local var_3_0 = utils.DbLoad(slot_0_4_0)

        if var_3_0 then
                slot_0_0_0 = var_3_0.threats or {}
                slot_0_5_0.enabled = var_3_0.enabled == true
                slot_0_5_0.show_steam_ids = var_3_0.show_steam_ids == true
                slot_0_5_0.style = var_3_0.style or slot_0_5_0.style
                slot_0_5_0.position = var_3_0.position or slot_0_5_0.position

                if var_3_0.esp_color and var_3_0.esp_color.r and var_3_0.esp_color.g and var_3_0.esp_color.b and var_3_0.esp_color.a then
                        slot_0_5_0.esp_color = {
                                r = var_3_0.esp_color.r,
                                g = var_3_0.esp_color.g,
                                b = var_3_0.esp_color.b,
                                a = var_3_0.esp_color.a
                        }
                else
                        slot_0_5_0.esp_color = {
                                g = 23,
                                a = 255,
                                b = 80,
                                r = 194
                        }
                end

                return true
        else
                print("[Threat Markers] No saved settings found, using defaults")

                return false
        end
end

slot_0_10_0()

slot_0_11_0 = gui.ctx:Find("lua>groups")

if not slot_0_11_0 then
        error("[Threat Markers] Could not find lua>groups")

        return
end

slot_0_12_0 = 280
slot_0_13_0 = 496
slot_0_11_0.sizeToParentW = false
slot_0_11_0.sizeToParentH = false

slot_0_11_0:SetDimensions(draw.Vec2(556, -6), draw.Vec2(slot_0_12_0, slot_0_13_0))

slot_0_14_0 = gui.Group("threat_markers", "Threat Markers", slot_0_13_0 - 18, gui.GroupWidthMode.DEFAULT)
slot_0_15_0, slot_0_16_0 = gui.MakeControlEasy("enabled_threat_esp", "Enable Threat ESP", "Checkbox")
slot_0_17_0, slot_0_18_0 = gui.MakeControlEasy("enabled_steam_id_threat_esp", "Show Steam IDs", "checkbox")
slot_0_19_0, slot_0_20_0 = gui.MakeControlEasy("threat_search_name", "Search", "TextInput")
slot_0_21_0 = gui.Button("dump_threats", "Dump")
slot_0_22_0 = gui.MakeControl("Full Threat List", slot_0_21_0)
slot_0_23_0 = gui.Button("reload_threats", "Reload")
slot_0_24_0 = gui.MakeControl("Reload Threats", slot_0_23_0)
slot_0_25_0, slot_0_26_0 = gui.MakeControlEasy("threat_marker_esp_color", "ESP Color", "ColorPicker")
slot_0_27_0 = gui.ComboBox("visual_placement")
slot_0_27_0.allowMultiple = false

slot_0_27_0:Add(gui.Selectable("visual_placement_opt_1", "Left"))
slot_0_27_0:Add(gui.Selectable("visual_placement_opt_2", "Right"))
slot_0_27_0:Add(gui.Selectable("visual_placement_opt_3", "Top"))
slot_0_27_0:Add(gui.Selectable("visual_placement_opt_4", "Bottom"))

slot_0_28_0 = gui.MakeControl("Position", slot_0_27_0)
slot_0_29_0 = gui.ComboBox("visual_style")
slot_0_29_0.allowMultiple = false

slot_0_29_0:Add(gui.Selectable("visual_style_opt_1", "Icon"))
slot_0_29_0:Add(gui.Selectable("visual_style_opt_2", "Text"))

slot_0_30_0 = gui.MakeControl("Style", slot_0_29_0)

slot_0_15_0:GetValue():Set(slot_0_5_0.enabled or false)
slot_0_17_0:GetValue():Set(slot_0_5_0.show_steam_ids or false)
slot_0_25_0:GetValue():Set(draw.Color(slot_0_5_0.esp_color.r, slot_0_5_0.esp_color.g, slot_0_5_0.esp_color.b, slot_0_5_0.esp_color.a))

slot_0_31_0 = 1

if slot_0_5_0.position == "right" then
        slot_0_31_0 = 2
elseif slot_0_5_0.position == "top" then
        slot_0_31_0 = 4
elseif slot_0_5_0.position == "bottom" then
        slot_0_31_0 = 8
end

slot_0_27_0:Get():SetRaw(slot_0_31_0)
slot_0_27_0:Reset()
slot_0_28_0:Reset()

slot_0_32_0 = 1

if slot_0_5_0.style == "text" then
        slot_0_32_0 = 2
end

slot_0_29_0:Get():SetRaw(slot_0_32_0)
slot_0_29_0:Reset()
slot_0_30_0:Reset()
slot_0_11_0:Add(slot_0_14_0)
slot_0_11_0:Reset()
slot_0_14_0:Add(slot_0_16_0)
slot_0_14_0:Add(slot_0_26_0)
slot_0_14_0:Add(slot_0_30_0)
slot_0_14_0:Add(slot_0_28_0)
slot_0_14_0:Add(slot_0_24_0)
slot_0_14_0:Add(slot_0_22_0)
slot_0_14_0:Add(slot_0_18_0)
slot_0_14_0:Add(gui.Spacer("potential_threats_spacer", 20))
slot_0_14_0:Reset()

function slot_0_33_0(arg_4_0)
        if not arg_4_0 then
                return false
        end

        if arg_4_0 == "0" or arg_4_0 == "STEAM_ID_STOP_IGNORING_RETVALS" or arg_4_0 == "" then
                return false
        end

        if arg_4_0 == "BOT" or arg_4_0 == "DEMORECORDER" then
                return false
        end

        return true
end

function slot_0_34_0(arg_5_0)
        if not slot_0_33_0(arg_5_0) then
                return false
        end

        if not slot_0_6_0 then
                local var_5_0 = entities.GetLocalController()

                if var_5_0 then
                        slot_0_6_0 = var_5_0:GetStringSteamID()
                end
        end

        return arg_5_0 == slot_0_6_0
end

function slot_0_35_0(arg_6_0, arg_6_1)
        if not slot_0_33_0(arg_6_1) or slot_0_34_0(arg_6_1) then
                return
        end

        if not slot_0_3_0[arg_6_0] then
                slot_0_3_0[arg_6_0] = {}
        end

        local var_6_0 = slot_0_3_0[arg_6_0]
        local var_6_1 = false

        for iter_6_0, iter_6_1 in ipairs(var_6_0) do
                if iter_6_1 == arg_6_1 then
                        var_6_1 = true

                        break
                end
        end

        if not var_6_1 then
                table.insert(var_6_0, arg_6_1)
        end

        local var_6_2 = arg_6_0

        if slot_0_5_0.show_steam_ids then
                var_6_2 = arg_6_0 .. " (" .. string.sub(arg_6_1, -6) .. ")"
        end

        local var_6_3, var_6_4 = gui.MakeControlEasy("potential_threat_cb_" .. arg_6_1, var_6_2, "Checkbox")

        slot_0_14_0:Add(var_6_4)

        if slot_0_0_0[arg_6_1] then
                var_6_3:GetValue():Set(true)
        end

        var_6_3:AddCallback(function()
                if var_6_3:GetValue():Get() then
                        slot_0_0_0[arg_6_1] = true
                else
                        slot_0_0_0[arg_6_1] = nil
                end

                slot_0_9_0()
        end)

        slot_0_1_0[arg_6_1] = true
        slot_0_2_0[arg_6_1] = {
                checkbox = var_6_3,
                row = var_6_4
        }

        slot_0_9_0()
end

function slot_0_36_0(arg_8_0)
        if not slot_0_33_0(arg_8_0) or slot_0_34_0(arg_8_0) then
                return
        end

        if slot_0_1_0[arg_8_0] then
                slot_0_1_0[arg_8_0] = nil
        end

        for iter_8_0, iter_8_1 in pairs(slot_0_3_0) do
                for iter_8_2, iter_8_3 in ipairs(iter_8_1) do
                        if iter_8_3 == arg_8_0 then
                                table.remove(iter_8_1, iter_8_2)

                                if #iter_8_1 == 0 then
                                        slot_0_3_0[iter_8_0] = nil
                                end

                                break
                        end
                end
        end

        local var_8_0 = slot_0_2_0[arg_8_0]

        if var_8_0 then
                slot_0_14_0:Remove(var_8_0.checkbox)
                slot_0_14_0:Remove(var_8_0.row)

                slot_0_2_0[arg_8_0] = nil
        end

        for iter_8_4, iter_8_5 in pairs(slot_0_7_0) do
                if iter_8_5 == arg_8_0 then
                        slot_0_7_0[iter_8_4] = nil

                        break
                end
        end

        slot_0_9_0()
end

function slot_0_37_0()
        local var_9_0 = entities.GetLocalController()

        if var_9_0 then
                slot_0_6_0 = var_9_0:GetStringSteamID()
        end

        entities.controllers:ForEach(function(arg_10_0)
                local var_10_0 = arg_10_0.entity
                local var_10_1 = var_10_0 and var_10_0:GetName()
                local var_10_2 = var_10_0 and var_10_0:GetStringSteamID()
                local var_10_3

                var_10_3 = var_10_0 and var_10_0:IsEnemy()

                if slot_0_33_0(var_10_2) and not slot_0_34_0(var_10_2) and var_10_2 and not slot_0_1_0[var_10_2] then
                        slot_0_35_0(var_10_1, var_10_2)
                end
        end)
        Delay(0.05, function()
                slot_0_14_0:Reset()
                slot_0_11_0:Reset()
        end)
end

function slot_0_38_0()
        for iter_12_0, iter_12_1 in pairs(slot_0_1_0) do
                slot_0_36_0(iter_12_0)
        end

        slot_0_1_0 = {}
        slot_0_3_0 = {}
        slot_0_7_0 = {}

        Delay(0.05, function()
                slot_0_14_0:Reset()
                slot_0_11_0:Reset()
        end)
end

slot_0_15_0:AddCallback(function()
        slot_0_5_0.enabled = slot_0_15_0:GetValue():Get()

        slot_0_9_0()
end)
slot_0_17_0:AddCallback(function()
        slot_0_5_0.show_steam_ids = slot_0_17_0:GetValue():Get()

        slot_0_9_0()
end)

slot_0_39_0 = 0
slot_0_40_0 = nil

slot_0_25_0:AddCallback(function()
        slot_0_40_0 = slot_0_25_0:GetValue():Get()
        slot_0_39_0 = 1
end)
events.presentQueue:Add(function()
        if slot_0_39_0 > 0 then
                slot_0_39_0 = slot_0_39_0 - 1

                if slot_0_39_0 == 0 and slot_0_40_0 then
                        slot_0_5_0.esp_color = {
                                r = slot_0_40_0:GetR(),
                                g = slot_0_40_0:GetG(),
                                b = slot_0_40_0:GetB(),
                                a = slot_0_40_0:GetA()
                        }

                        slot_0_9_0()

                        slot_0_40_0 = nil
                end
        end
end)
slot_0_29_0:AddCallback(function()
        local var_18_0 = slot_0_29_0:GetValue():Get():GetRaw()
        local var_18_1 = "icon"

        if var_18_0 == 2 then
                var_18_1 = "text"
        end

        slot_0_5_0.style = var_18_1

        slot_0_9_0()
end)
slot_0_27_0:AddCallback(function()
        local var_19_0 = slot_0_27_0:GetValue():Get():GetRaw()
        local var_19_1 = "left"

        if var_19_0 == 2 then
                var_19_1 = "right"
        elseif var_19_0 == 4 then
                var_19_1 = "top"
        elseif var_19_0 == 8 then
                var_19_1 = "bottom"
        end

        slot_0_5_0.position = var_19_1

        slot_0_9_0()
end)
slot_0_23_0:AddCallback(function()
        slot_0_38_0()
        slot_0_10_0()
        slot_0_37_0()
        slot_0_8_0("Threat Markers", "Threat list reloaded from config")
end)
slot_0_21_0:AddCallback(function()
        print("=========== Current Threats ===========")

        local var_21_0 = 0

        for iter_21_0, iter_21_1 in pairs(slot_0_0_0) do
                var_21_0 = var_21_0 + 1

                local var_21_1 = "Unknown"

                for iter_21_2, iter_21_3 in pairs(slot_0_3_0) do
                        for iter_21_4, iter_21_5 in ipairs(iter_21_3) do
                                if iter_21_5 == iter_21_0 then
                                        var_21_1 = iter_21_2

                                        break
                                end
                        end
                end

                print(var_21_1 .. " (" .. iter_21_0 .. ")")
        end

        print("=======================================")
        print("Threat Count: " .. var_21_0)
        print("=======================================")
end)
mods.events:AddListener("player_connect_full")
mods.events:AddListener("player_disconnect")
mods.events:AddListener("player_team")
mods.events:AddListener("local_player_team")
mods.events:AddListener("map_shutdown")
events.event:Add(function(arg_22_0)
        if not slot_0_5_0.enabled then
                return
        end

        local var_22_0 = arg_22_0:GetName()

        if var_22_0 == "player_connect_full" then
                local var_22_1 = arg_22_0:GetController("userid")
                local var_22_2 = var_22_1 and var_22_1:GetName()
                local var_22_3 = var_22_1 and var_22_1:GetStringSteamID()
                local var_22_4

                var_22_4 = var_22_1 and var_22_1:IsEnemy()

                if not slot_0_33_0(var_22_3) then
                        return
                end

                if var_22_1 and var_22_1.GetIndex then
                        local var_22_5 = var_22_1:GetIndex()

                        if var_22_5 then
                                slot_0_7_0[tostring(var_22_5)] = var_22_3
                        end
                end

                if slot_0_34_0(var_22_3) then
                        slot_0_6_0 = var_22_3

                        if game.engine:InGame() then
                                print("[Threat Markers] Local player spawned, waiting 2 seconds before loading existing players")
                                Delay(2, slot_0_37_0)
                        end

                        return
                end

                if var_22_3 and slot_0_1_0[var_22_3] then
                        return
                end

                slot_0_35_0(var_22_2, var_22_3)
        end

        if var_22_0 == "player_disconnect" then
                local var_22_6 = arg_22_0:GetController("userid")
                local var_22_7

                var_22_7 = var_22_6 and var_22_6:GetName()

                local var_22_8 = var_22_6 and var_22_6:GetStringSteamID()

                if not slot_0_33_0(var_22_8) or slot_0_34_0(var_22_8) then
                        return
                end

                if var_22_8 and not slot_0_1_0[var_22_8] then
                        return
                end

                slot_0_36_0(var_22_8)
        end

        if var_22_0 == "map_shutdown" then
                slot_0_38_0()

                slot_0_6_0 = nil
        end

        if var_22_0 == "local_player_team" then
                local var_22_9 = entities.GetLocalController()

                if var_22_9 then
                        slot_0_6_0 = var_22_9:GetStringSteamID()
                end
        end
end)

slot_0_41_0 = 12
slot_0_42_0 = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><path fill=\"rgb(255, 255, 255)\" d=\"M480 208C480 128.5 408.4 64 320 64C231.6 64 160 128.5 160 208C160 255.1 185.1 296.9 224 323.2L224 352C224 369.7 238.3 384 256 384L384 384C401.7 384 416 369.7 416 352L416 323.2C454.9 296.9 480 255.1 480 208zM256 192C273.7 192 288 206.3 288 224C288 241.7 273.7 256 256 256C238.3 256 224 241.7 224 224C224 206.3 238.3 192 256 192zM352 224C352 206.3 366.3 192 384 192C401.7 192 416 206.3 416 224C416 241.7 401.7 256 384 256C366.3 256 352 241.7 352 224zM541.5 403.7C534.7 387.4 516 379.7 499.7 386.5L320 461.3L140.3 386.5C124 379.7 105.3 387.4 98.5 403.7C91.7 420 99.4 438.7 115.7 445.5L236.8 496L115.7 546.5C99.4 553.3 91.7 572 98.5 588.3C105.3 604.6 124 612.3 140.3 605.5L320 530.7L499.7 605.5C516 612.3 534.7 604.6 541.5 588.3C548.3 572 540.6 553.3 524.3 546.5L403.2 496L524.3 445.5C540.6 438.7 548.3 420 541.5 403.7z\"/></svg>"
slot_0_43_0 = draw.SvgTexture(slot_0_42_0, slot_0_41_0)

slot_0_43_0:Create()

slot_0_44_0 = gui.ctx:Find("visuals>enemy>esp>health")

function slot_0_45_0(arg_23_0)
        local var_23_0 = draw.Vec2(-1, 0)

        if slot_0_44_0 and slot_0_44_0:GetValue():Get() then
                var_23_0 = draw.Vec2(-5, 0)
        end

        local var_23_1 = draw.Color(slot_0_5_0.esp_color.r, slot_0_5_0.esp_color.g, slot_0_5_0.esp_color.b, slot_0_5_0.esp_color.a)
        local var_23_2 = EspItemPos.LEFT

        if slot_0_5_0.position == "right" then
                var_23_2 = EspItemPos.RIGHT
        elseif slot_0_5_0.position == "top" then
                var_23_2 = EspItemPos.TOP
        elseif slot_0_5_0.position == "bottom" then
                var_23_2 = EspItemPos.BOTTOM
        end

        if slot_0_5_0.style == "text" then
                arg_23_0:AddText(var_23_2, var_23_1, "THR")
        else
                arg_23_0:AddIcon(var_23_2, var_23_1, slot_0_43_0, var_23_0, slot_0_41_0)
        end
end

events.playerInfoPre:Add(function(arg_24_0)
        if not slot_0_5_0.enabled then
                return
        end

        local var_24_0 = arg_24_0.entry.handle:Get()

        if not var_24_0 then
                return
        end

        local var_24_1 = var_24_0:GetName()
        local var_24_2 = var_24_0.GetPlayerController and var_24_0:GetPlayerController()

        if not var_24_2 then
                local var_24_3 = slot_0_3_0[var_24_1]

                if var_24_3 then
                        local var_24_4 = false

                        for iter_24_0, iter_24_1 in ipairs(var_24_3) do
                                if slot_0_0_0[iter_24_1] then
                                        var_24_4 = true

                                        break
                                end
                        end

                        if var_24_4 then
                                slot_0_45_0(arg_24_0)
                        end
                end

                return
        end

        local var_24_5 = var_24_2:GetStringSteamID()

        if slot_0_34_0(var_24_5) then
                return
        end

        if slot_0_0_0[var_24_5] == true then
                slot_0_45_0(arg_24_0)
        end
end)

function __shutdown()
        slot_0_9_0()
        print("[Threat Markers] Unloaded. Settings saved.")
end

if game.engine:InGame() then
        if not slot_0_5_0.enabled then
                return
        end

        slot_0_37_0()
end

print("[Threat Markers] Loaded")
