--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_1_0 = gui.GetMainWindow():AddTab("bad_apple", draw.textures.icon_cloud, "BAD APPLE", gui.TabLayoutMode.NONE)
slot_0_2_0 = gui.Button("bad_apple.play", "Play")
slot_0_3_0 = {}
slot_0_4_0 = utils.FileRead(ws.GetResourceDir() .. "/video.bin")
slot_0_5_0 = false
slot_0_6_0 = false
slot_0_7_0 = 0
slot_0_8_0 = false

utils.FileCreateDirectories("sounds")

if not utils.FileExists("sounds/bd.vsnd_c") then
        print("bad apple - Downloading sound file...")
        http.Get("https://cdn.discordapp.com/attachments/1380610865614557204/1477377040842887409/badapple.vsnd_c?ex=69a48a16&is=69a33896&hm=a23210fbf3a60158478cef682d54093c271c8e2fc07670e3df65009d15a24ee8&", {
                saveToFile = "sounds/bd.vsnd_c"
        }, function(arg_1_0, arg_1_1)
                if not arg_1_0 then
                        error("Failed to download sound file")
                end

                print("bad apple - Ready!")

                slot_0_8_0 = true
        end)
else
        slot_0_8_0 = true
end

function playBadApple()
        local var_2_0 = gui.Layout("bad_apple.ct", draw.vec2(0, 0), draw.vec2(820, 484), gui.StackDirection.GRID)

        for iter_2_0 = 1, 1368 do
                local var_2_1 = gui.Checkbox("bad_apple.cb." .. iter_2_0)

                slot_0_3_0[iter_2_0] = var_2_1

                var_2_0:Add(var_2_1)
        end

        slot_0_1_0:Add(var_2_0)
        slot_0_1_0:Reset()

        slot_0_5_0 = true
end

slot_0_2_0:SetDimensions(draw.vec2(0, 0), draw.vec2(100, 26))
slot_0_2_0:AddCallback(playBadApple)
slot_0_1_0:Add(slot_0_2_0)

slot_0_9_0 = 0.04
slot_0_10_0 = 57
slot_0_11_0 = 24
slot_0_12_0 = 171
slot_0_13_0 = 0
slot_0_14_0 = 0

events.presentQueue:add(function()
        if not slot_0_5_0 then
                return
        end

        if not slot_0_8_0 then
                return
        end

        if not slot_0_6_0 then
                game.PlaySound("sounds/bd", -1)

                slot_0_6_0 = true
        end

        if slot_0_13_0 <= draw.GetTime() then
                local var_3_0 = slot_0_14_0 * slot_0_12_0
                local var_3_1 = 1

                for iter_3_0 = 1, slot_0_12_0 do
                        local var_3_2 = slot_0_4_0[var_3_0 + iter_3_0]

                        for iter_3_1 = 7, 0, -1 do
                                if var_3_1 > 1368 then
                                        slot_0_5_0 = false

                                        break
                                end

                                local var_3_3 = bit32.band(bit32.rshift(var_3_2, iter_3_1), 1) == 1

                                slot_0_3_0[var_3_1]:set_value(var_3_3)

                                var_3_1 = var_3_1 + 1
                        end
                end

                slot_0_13_0 = draw.GetTime() + slot_0_9_0
                slot_0_14_0 = slot_0_14_0 + 1
        end
end)

function __shutdown()
        game.engine:ClientCmd("stopsound")
end
