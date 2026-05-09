--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        gui.ctx:find("rage>weapon>general>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Pistols>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Heavy Pistols>weapon>mindamage"),
        gui.ctx:find("rage>weapon>SMGs>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Rifles>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Heavy>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Auto Snipers>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Bolt Snipers>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Desert Eagle>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Dual Berettas>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Five-SeveN>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Glock-18>weapon>mindamage"),
        gui.ctx:find("rage>weapon>AK-47>weapon>mindamage"),
        gui.ctx:find("rage>weapon>AUG>weapon>mindamage"),
        gui.ctx:find("rage>weapon>AWP>weapon>mindamage"),
        gui.ctx:find("rage>weapon>FAMAS>weapon>mindamage"),
        gui.ctx:find("rage>weapon>G3SG1>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Galil AR>weapon>mindamage"),
        gui.ctx:find("rage>weapon>M249>weapon>mindamage"),
        gui.ctx:find("rage>weapon>M4A4>weapon>mindamage"),
        gui.ctx:find("rage>weapon>MAC-10>weapon>mindamage"),
        gui.ctx:find("rage>weapon>P90>weapon>mindamage"),
        gui.ctx:find("rage>weapon>MP5-SD>weapon>mindamage"),
        gui.ctx:find("rage>weapon>UMP-45>weapon>mindamage"),
        gui.ctx:find("rage>weapon>XM1014>weapon>mindamage"),
        gui.ctx:find("rage>weapon>PP Bizon>weapon>mindamage"),
        gui.ctx:find("rage>weapon>MAG-7>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Negev>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Sawed Off>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Tec-9>weapon>mindamage"),
        gui.ctx:find("rage>weapon>P2000>weapon>mindamage"),
        gui.ctx:find("rage>weapon>MP7>weapon>mindamage"),
        gui.ctx:find("rage>weapon>MP9>weapon>mindamage"),
        gui.ctx:find("rage>weapon>Nova>weapon>mindamage"),
        gui.ctx:find("rage>weapon>P250>weapon>mindamage"),
        gui.ctx:find("rage>weapon>SCAR-20>weapon>mindamage"),
        gui.ctx:find("rage>weapon>SG 553>weapon>mindamage"),
        gui.ctx:find("rage>weapon>SSG-08>weapon>mindamage"),
        gui.ctx:find("rage>weapon>M4A1-S>weapon>mindamage"),
        gui.ctx:find("rage>weapon>USP-S>weapon>mindamage"),
        gui.ctx:find("rage>weapon>CZ-75 Auto>weapon>mindamage"),
        gui.ctx:find("rage>weapon>R8 Revolver>weapon>mindamage")
}
slot_0_1_0, slot_0_2_0 = game.engine:get_screen_size()
slot_0_3_0 = {
        controls = {
                main = {
                        enabled = gui.checkbox(gui.control_id("keystrokes>main>enabled")),
                        gradient_mode = gui.checkbox(gui.control_id("keystrokes>main>gradient mode")),
                        rage = gui.checkbox(gui.control_id("keystrokes>main>rage row")),
                        enable_custom = gui.checkbox(gui.control_id("keystrokes>main>customizer"))
                },
                positions = {
                        x = gui.slider(gui.control_id("keystrokes>positions>x"), 1, slot_0_1_0, {
                                "%.f"
                        }),
                        y = gui.slider(gui.control_id("keystrokes>positions>y"), 1, slot_0_2_0, {
                                "%.f"
                        })
                },
                custom = {
                        size = gui.slider(gui.control_id("keystrokes>custom>size"), 20, 120, {
                                "%.f"
                        }),
                        padding = gui.slider(gui.control_id("keystrokes>custom>padding"), 0, 100, {
                                "%.f"
                        }),
                        rnd = gui.slider(gui.control_id("keystrokes>custom>rounding"), 0, 59, {
                                "%.f"
                        })
                }
        }
}
slot_0_3_0.containers = {
        main = gui.make_control("keystrokes: ", slot_0_3_0.controls.main.enabled),
        positions = {
                x = gui.make_control("position x: ", slot_0_3_0.controls.positions.x),
                y = gui.make_control("position y: ", slot_0_3_0.controls.positions.y)
        },
        custom = {
                size = gui.make_control("size: ", slot_0_3_0.controls.custom.size),
                padding = gui.make_control("padding: ", slot_0_3_0.controls.custom.padding),
                rnd = gui.make_control("rounding: ", slot_0_3_0.controls.custom.rnd)
        }
}
slot_0_3_0.controls.main.enabled.tooltip = "enabled"
slot_0_3_0.controls.main.gradient_mode.tooltip = "gradient mode"
slot_0_3_0.controls.main.rage.tooltip = "rage row"
slot_0_3_0.controls.main.enable_custom.tooltip = "show customizer"

table.foreach(slot_0_3_0.controls.positions, function(arg_1_0, arg_1_1)
        if arg_1_1:get_value():get() == 0 then
                arg_1_1:get_value():set(1)
        end
end)

if slot_0_3_0.controls.custom.size:get_value():get() == 0 then
        slot_0_3_0.controls.custom.size:get_value():set(60)
end

if slot_0_3_0.controls.custom.padding:get_value():get() == 0 then
        slot_0_3_0.controls.custom.padding:get_value():set(10)
end

if slot_0_3_0.controls.custom.rnd:get_value():get() == 0 then
        slot_0_3_0.controls.custom.rnd:get_value():set(7)
end

slot_0_3_0.containers.main:add(slot_0_3_0.controls.main.gradient_mode)
slot_0_3_0.containers.main:add(slot_0_3_0.controls.main.rage)
slot_0_3_0.containers.main:add(slot_0_3_0.controls.main.enable_custom)

slot_0_4_1 = gui.ctx:find("lua>elements a")

slot_0_4_1:add(slot_0_3_0.containers.main)
slot_0_4_1:add(slot_0_3_0.containers.positions.x)
slot_0_4_1:add(slot_0_3_0.containers.positions.y)
slot_0_4_1:add(slot_0_3_0.containers.custom.size)
slot_0_4_1:add(slot_0_3_0.containers.custom.padding)
slot_0_4_1:add(slot_0_3_0.containers.custom.rnd)
slot_0_4_1:reset()

slot_0_4_0 = {
        rounding = 0,
        padding = 10,
        is_gradient = true,
        size = 60,
        position = {
                y = 0,
                x = 0
        }
}

slot_0_3_0.controls.main.enable_custom:add_callback(function()
        table.foreach(slot_0_3_0.containers.positions, function(arg_3_0, arg_3_1)
                arg_3_1:set_visible(slot_0_3_0.controls.main.enable_custom:get_value():get())
        end)
        table.foreach(slot_0_3_0.containers.custom, function(arg_4_0, arg_4_1)
                arg_4_1:set_visible(slot_0_3_0.controls.main.enable_custom:get_value():get())
        end)
end)
slot_0_3_0.controls.positions.x:add_callback(function()
        slot_0_4_0.position.x = slot_0_3_0.controls.positions.x:get_value():get()
end)
slot_0_3_0.controls.positions.y:add_callback(function()
        slot_0_4_0.position.y = slot_0_3_0.controls.positions.y:get_value():get()
end)
slot_0_3_0.controls.custom.size:add_callback(function()
        if slot_0_3_0.controls.custom.rnd:get_value():get() > slot_0_3_0.controls.custom.size:get_value():get() / 2 - 1 then
                slot_0_3_0.controls.custom.rnd:get_value():set(slot_0_3_0.controls.custom.size:get_value():get() / 2 - 1)
        end

        slot_0_4_0.rounding = slot_0_3_0.controls.custom.rnd:get_value():get()
        slot_0_4_0.size = slot_0_3_0.controls.custom.size:get_value():get()
end)
slot_0_3_0.controls.custom.padding:add_callback(function()
        slot_0_4_0.padding = slot_0_3_0.controls.custom.padding:get_value():get()
end)
slot_0_3_0.controls.custom.rnd:add_callback(function()
        if slot_0_3_0.controls.custom.rnd:get_value():get() > slot_0_3_0.controls.custom.size:get_value():get() / 2 - 1 then
                slot_0_3_0.controls.custom.rnd:get_value():set(slot_0_3_0.controls.custom.size:get_value():get() / 2 - 1)
        end

        slot_0_4_0.rounding = slot_0_3_0.controls.custom.rnd:get_value():get()
end)
slot_0_3_0.controls.main.gradient_mode:add_callback(function()
        slot_0_4_0.is_gradient = slot_0_3_0.controls.main.gradient_mode:get_value():get()
end)

slot_0_5_0 = {
        in_jump = false,
        in_duck = false,
        in_forward = false,
        in_back = false,
        in_moveright = false,
        in_speed = false,
        in_moveleft = false
}

events.create_move:add(function(arg_11_0)
        slot_0_5_0.in_forward = arg_11_0:get_button(input_bit_mask.in_forward)
        slot_0_5_0.in_moveleft = arg_11_0:get_button(input_bit_mask.in_moveleft)
        slot_0_5_0.in_moveright = arg_11_0:get_button(input_bit_mask.in_moveright)
        slot_0_5_0.in_back = arg_11_0:get_button(input_bit_mask.in_back)
        slot_0_5_0.in_jump = arg_11_0:get_button(input_bit_mask.in_jump)
        slot_0_5_0.in_duck = arg_11_0:get_button(input_bit_mask.in_duck)
        slot_0_5_0.in_speed = arg_11_0:get_button(input_bit_mask.in_speed)
end)

function slot_0_6_0()
        if not slot_0_3_0.controls.main.enabled:get_value():get() then
                return
        end

        slot_12_0_0, slot_12_1_0 = game.engine:get_screen_size()
        slot_12_2_0 = draw.surface
        slot_12_2_0.font = draw.fonts.gui_title or slot_12_2_0.font
        slot_12_3_0 = draw.color(255, 255, 255)
        slot_12_4_0 = draw.color(255, 255, 255)
        slot_12_5_0 = draw.color.white()

        if slot_0_4_0.is_gradient and game.global_vars.tick_count then
                slot_12_6_1 = game.global_vars.tick_count / 20
                slot_12_3_0 = draw.color(math.floor(math.sin(slot_12_6_1 * 2) * 127 + 128), math.floor(math.sin(slot_12_6_1 * 2 + 2) * 127 + 128), math.floor(math.sin(slot_12_6_1 * 2 + 4) * 127 + 128))
                slot_12_4_0 = draw.color(math.floor(math.sin(slot_12_6_1 * 2 + 4) * 127 + 128), math.floor(math.sin(slot_12_6_1 * 2) * 127 + 128), math.floor(math.sin(slot_12_6_1 * 2 + 2) * 127 + 128))
        end

        slot_12_6_0 = slot_0_4_0.position.x
        slot_12_7_0 = slot_0_4_0.position.y
        slot_12_8_0 = slot_0_4_0.size
        slot_12_9_0 = slot_0_4_0.padding
        slot_12_10_0 = {
                y = 0,
                x = 0,
                x = slot_12_8_0 + slot_12_9_0
        }

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_0_5_0.in_forward and {
                slot_12_3_0:a(slot_0_5_0.in_forward and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_forward and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_forward and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_forward and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "W", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        slot_12_10_0.x = 0
        slot_12_10_0.y = slot_12_8_0 + slot_12_9_0

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_0_5_0.in_moveleft and {
                slot_12_4_0:a(slot_0_5_0.in_moveleft and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_moveleft and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_moveleft and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_moveleft and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "A", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        slot_12_10_0.x = slot_12_8_0 + slot_12_9_0

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_0_5_0.in_back and {
                slot_12_4_0:a(slot_0_5_0.in_back and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_back and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_back and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_back and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "S", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        slot_12_10_0.x = (slot_12_8_0 + slot_12_9_0) * 2

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_0_5_0.in_moveright and {
                slot_12_4_0:a(slot_0_5_0.in_moveright and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_moveright and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_moveright and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_moveright and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "D", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        slot_12_10_0.y = (slot_12_8_0 + slot_12_9_0) * 2
        slot_12_10_0.x = 0

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 + (slot_12_9_0 + slot_12_8_0) / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_0_5_0.in_duck and {
                slot_12_3_0:a(slot_0_5_0.in_duck and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_duck and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_duck and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_duck and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + (slot_12_8_0 + (slot_12_9_0 + slot_12_8_0) / 2) / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "Duck", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        slot_12_10_0.x = slot_12_8_0 + (slot_12_9_0 + slot_12_8_0) / 2 + slot_12_9_0

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 + (slot_12_9_0 + slot_12_8_0) / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_0_5_0.in_jump and {
                slot_12_3_0:a(slot_0_5_0.in_jump and 100 or 230),
                slot_12_3_0:a(slot_0_5_0.in_jump and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_jump and 100 or 230),
                slot_12_4_0:a(slot_0_5_0.in_jump and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + (slot_12_8_0 + (slot_12_9_0 + slot_12_8_0) / 2) / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "Jump", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        if not slot_0_3_0.controls.main.rage:get_value():get() then
                return
        end

        slot_12_10_0.x = 0
        slot_12_10_0.y = (slot_12_8_0 + slot_12_9_0) * 3
        slot_12_11_0 = false
        slot_12_12_0 = gui.ctx:find("misc>movement>duck peek assist"):get_hotkey_state()
        slot_12_13_0 = gui.ctx:find("misc>movement>slowwalk"):get_hotkey_state() or slot_0_5_0.in_speed

        table.foreach(slot_0_0_0, function(arg_13_0, arg_13_1)
                if slot_0_0_0[arg_13_0]:get_hotkey_state() then
                        slot_12_11_0 = true
                end
        end)
        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_12_11_0 and {
                slot_12_4_0:a(slot_12_11_0 and 100 or 230),
                slot_12_4_0:a(slot_12_11_0 and 100 or 230),
                slot_12_3_0:a(slot_12_11_0 and 100 or 230),
                slot_12_3_0:a(slot_12_11_0 and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "DMG", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        slot_12_10_0.x = slot_12_8_0 + slot_12_9_0

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_12_12_0 and {
                slot_12_4_0:a(slot_12_12_0 and 100 or 230),
                slot_12_4_0:a(slot_12_12_0 and 100 or 230),
                slot_12_3_0:a(slot_12_12_0 and 100 or 230),
                slot_12_3_0:a(slot_12_12_0 and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "DPA", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))

        slot_12_10_0.x = (slot_12_8_0 + slot_12_9_0) * 2

        slot_12_2_0:add_rect_filled_rounded_multicolor(draw.rect(slot_12_10_0.x + slot_12_6_0, slot_12_10_0.y + slot_12_7_0, slot_12_10_0.x + slot_12_6_0 + slot_12_8_0, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0), slot_12_13_0 and {
                slot_12_4_0:a(slot_12_13_0 and 100 or 230),
                slot_12_4_0:a(slot_12_13_0 and 100 or 230),
                slot_12_3_0:a(slot_12_13_0 and 100 or 230),
                slot_12_3_0:a(slot_12_13_0 and 100 or 230)
        } or {
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230),
                slot_12_5_0:a(230)
        }, slot_0_4_0.rounding, draw.rounding.all)
        slot_12_2_0:add_text(draw.vec2(slot_12_10_0.x + slot_12_6_0 + slot_12_8_0 / 2, slot_12_10_0.y + slot_12_7_0 + slot_12_8_0 / 2), "SW", draw.color.white(), draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center))
end

events.present_queue:add(function()
        slot_0_6_0()
end)
