--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.text_input(gui.control_id("item_name_F003F829-3692-45B9-860B-0A205D3381B7"))
slot_0_1_0 = gui.combo_box(gui.control_id("skin_rare_BBF28370-B346-4B89-BB4A-15D1A3F8AABA"))
slot_0_2_0 = gui.button(gui.control_id("button_fake_open_F4E9C08E-0B27-4F93-B4D4-623AFDDF5045"), "Fake Unbox")
slot_0_3_0 = gui.checkbox(gui.control_id("enable_stattrak_70A5615B-C273-4C7C-A571-7DF05FF895D4"))
slot_0_4_0 = gui.checkbox(gui.control_id("enable_star_A848C1FD-B3B3-4D2A-808C-3F6CE2CEDFEC"))
slot_0_5_0 = gui.text_input(gui.control_id("skin_name_794E9300-4EF0-400A-B402-F95DAE35FAA1"))
slot_0_6_0 = gui.make_control("Push Button", slot_0_2_0)
slot_0_7_0 = gui.make_control("Enable StatTrak™?", slot_0_3_0)
slot_0_8_0 = gui.make_control("Enter Skin: ", slot_0_5_0)
slot_0_9_0 = gui.make_control("Enable Star?", slot_0_4_0)
slot_0_10_0 = gui.make_control("Choose Rare: ", slot_0_1_0)
slot_0_11_0 = gui.make_control("Enter Item: ", slot_0_0_0)
slot_0_12_0 = gui.ctx:find("lua>elements a")

slot_0_12_0:reset()
slot_0_12_0:add(slot_0_11_0)
slot_0_12_0:add(slot_0_8_0)
slot_0_12_0:add(slot_0_7_0)
slot_0_12_0:add(slot_0_9_0)
slot_0_12_0:add(slot_0_10_0)
slot_0_12_0:add(slot_0_6_0)

slot_0_13_0 = {
        "\x0F",
        "\f",
        nil,
        "\x0E"
}

slot_0_1_0:add(gui.selectable(gui.control_id("rare_red_250F4963-0EFE-4BC5-8CDF-628908A7F6DA"), "Red"))
slot_0_1_0:add(gui.selectable(gui.control_id("rare_blue_CC0E055A-4AB9-4499-AEFC-ADC39052F16D"), "Blue"))
slot_0_1_0:add(gui.selectable(gui.control_id("rare_pink_D9619421-2BED-4B09-BEAD-4874DF4C8B43"), "Pink"))
slot_0_2_0:add_callback(function()
        if not game.engine:in_game() then
                return gui.notify:add(gui.notification("GO TO MAP!", "Connext to server or smth", draw.textures.icon_close))
        end

        local var_1_0 = " "
        local var_1_1 = " "

        if slot_0_3_0:get_value():get() then
                var_1_0 = "StatTrak™"
        end

        if slot_0_4_0:get_value():get() then
                var_1_1 = "★"
        end

        game.engine:client_cmd(string.format("Playerchatwheel CW.NeedQuiet \"\x03%s \x01has opened a container and found: %s %s %s %s | %s\"", entities:get_local_controller():get_name(), slot_0_13_0[slot_0_1_0:get_value():get():get_raw()], var_1_1, var_1_0, slot_0_0_0.value, slot_0_5_0.value))
end)
