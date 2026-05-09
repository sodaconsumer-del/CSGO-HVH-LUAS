--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0, slot_0_1_0 = game.engine:get_screen_size()
slot_0_2_0 = gui.Label(gui.control_id("luaSepLabel"), "----- Simple Indicators -----")
slot_0_3_0 = gui.Checkbox(gui.control_id("active_cb"))
slot_0_4_0 = gui.make_control("Show only active keybinds", slot_0_3_0)
slot_0_5_0 = gui.Checkbox(gui.control_id("background_cb"))
slot_0_6_0 = gui.make_control("Show background color", slot_0_5_0)
slot_0_7_0 = gui.ColorPicker(gui.control_id("textcolor_picker_id"))
slot_0_8_0 = gui.make_control("Text color", slot_0_7_0)
slot_0_9_0 = gui.ColorPicker(gui.control_id("bgcolor_picker_id"))
slot_0_10_0 = gui.make_control("Background color", slot_0_9_0)
slot_0_11_0 = gui.Slider(gui.control_id("x_slider"), 0, slot_0_0_0, {
        "%.0fpx"
})
slot_0_12_0 = gui.make_control("Pos Left/Right", slot_0_11_0)
slot_0_13_0 = gui.Slider(gui.control_id("y_slider"), 0, slot_0_1_0, {
        "%.0fpx"
})
slot_0_14_0 = gui.make_control("Pos Up/Down", slot_0_13_0)
slot_0_15_0 = gui.Slider(gui.control_id("step_size"), 0, 20, {
        "%.0fpx"
})
slot_0_16_0 = gui.make_control("Spacing", slot_0_15_0)
slot_0_17_0 = gui.Button(gui.control_id("test_button"), "Testing")
slot_0_18_0 = gui.ctx:find("lua>elements b")

slot_0_18_0:reset()
slot_0_18_0:add(slot_0_2_0)
slot_0_18_0:add(slot_0_4_0)
slot_0_18_0:add(slot_0_6_0)
slot_0_18_0:add(slot_0_8_0)
slot_0_18_0:add(slot_0_10_0)
slot_0_18_0:add(slot_0_12_0)
slot_0_18_0:add(slot_0_14_0)
slot_0_18_0:add(slot_0_16_0)

function slot_0_19_0()
        local var_1_0 = gui.GetHotkeyList()
        local var_1_1 = {}
        local var_1_2 = slot_0_11_0:Get()
        local var_1_3 = slot_0_13_0:Get()
        local var_1_4 = slot_0_15_0:Get()
        local var_1_5 = draw.surface

        var_1_5.font = draw.fonts.gui_main

        local var_1_6 = slot_0_7_0:GetValue():Get():GetR()
        local var_1_7 = slot_0_7_0:GetValue():Get():GetG()
        local var_1_8 = slot_0_7_0:GetValue():Get():GetB()
        local var_1_9 = slot_0_7_0:GetValue():Get():GetA()
        local var_1_10 = slot_0_9_0:GetValue():Get():GetR()
        local var_1_11 = slot_0_9_0:GetValue():Get():GetG()
        local var_1_12 = slot_0_9_0:GetValue():Get():GetB()
        local var_1_13 = slot_0_9_0:GetValue():Get():GetA()

        for iter_1_0, iter_1_1 in ipairs(var_1_0) do
                if iter_1_1 ~= nil then
                        local var_1_14 = iter_1_1:Cast()

                        if var_1_14 ~= nil and var_1_14.GetLabel ~= nil then
                                local var_1_15 = var_1_14:GetLabel()

                                if var_1_15 ~= nil then
                                        local var_1_16 = var_1_15.text

                                        if var_1_16 ~= nil then
                                                var_1_16 = tostring(var_1_16)

                                                if not var_1_1[var_1_16] then
                                                        var_1_1[var_1_16] = true

                                                        local var_1_17 = table.getn(var_1_1)
                                                        local var_1_18 = draw.rect(var_1_2 - 10, var_1_3 - 10, var_1_2 + 180, var_1_3 + 20)

                                                        local function var_1_19()
                                                                if slot_0_5_0:Get() then
                                                                        draw.surface.g.anti_alias = true

                                                                        draw.surface:AddRectFilledRounded(var_1_18, draw.color(var_1_10, var_1_11, var_1_12, var_1_13), 5)
                                                                end

                                                                var_1_5:add_text(draw.vec2(var_1_2, var_1_3), string.format("%s: %s", var_1_16, var_1_14:GetHotkeyState()), draw.color(var_1_6, var_1_7, var_1_8, var_1_9))

                                                                var_1_3 = var_1_3 + var_1_4 + 15
                                                        end

                                                        if slot_0_3_0:Get() then
                                                                if var_1_14:GetHotkeyState() then
                                                                        var_1_19()
                                                                end
                                                        else
                                                                var_1_19()
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
end

events.present_queue:add(slot_0_19_0)
slot_0_17_0:add_callback(function()
        local var_3_0 = slot_0_9_0:GetValue():Get():GetR()

        print(var_3_0)
end)
