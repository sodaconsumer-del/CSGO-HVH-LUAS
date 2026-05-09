--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

bit32 = {}
slot_0_0_0 = 32
slot_0_1_0 = 2^slot_0_0_0

function bit32.bnot(arg_1_0)
        arg_1_0 = arg_1_0 % slot_0_1_0

        return slot_0_1_0 - 1 - arg_1_0
end

function bit32.band(arg_2_0, arg_2_1)
        if arg_2_1 == 255 then
                return arg_2_0 % 256
        end

        if arg_2_1 == 65535 then
                return arg_2_0 % 65536
        end

        if arg_2_1 == 4294967295 then
                return arg_2_0 % 4294967296
        end

        arg_2_0, arg_2_1 = arg_2_0 % slot_0_1_0, arg_2_1 % slot_0_1_0

        local var_2_0 = 0
        local var_2_1 = 1

        for iter_2_0 = 1, slot_0_0_0 do
                local var_2_2 = arg_2_0 % 2
                local var_2_3 = arg_2_1 % 2

                arg_2_0, arg_2_1 = math.floor(arg_2_0 / 2), math.floor(arg_2_1 / 2)

                if var_2_2 + var_2_3 == 2 then
                        var_2_0 = var_2_0 + var_2_1
                end

                var_2_1 = 2 * var_2_1
        end

        return var_2_0
end

function bit32.bor(arg_3_0, arg_3_1)
        if arg_3_1 == 255 then
                return arg_3_0 - arg_3_0 % 256 + 255
        end

        if arg_3_1 == 65535 then
                return arg_3_0 - arg_3_0 % 65536 + 65535
        end

        if arg_3_1 == 4294967295 then
                return 4294967295
        end

        arg_3_0, arg_3_1 = arg_3_0 % slot_0_1_0, arg_3_1 % slot_0_1_0

        local var_3_0 = 0
        local var_3_1 = 1

        for iter_3_0 = 1, slot_0_0_0 do
                local var_3_2 = arg_3_0 % 2
                local var_3_3 = arg_3_1 % 2

                arg_3_0, arg_3_1 = math.floor(arg_3_0 / 2), math.floor(arg_3_1 / 2)

                if var_3_2 + var_3_3 >= 1 then
                        var_3_0 = var_3_0 + var_3_1
                end

                var_3_1 = 2 * var_3_1
        end

        return var_3_0
end

function bit32.bxor(arg_4_0, arg_4_1)
        arg_4_0, arg_4_1 = arg_4_0 % slot_0_1_0, arg_4_1 % slot_0_1_0

        local var_4_0 = 0
        local var_4_1 = 1

        for iter_4_0 = 1, slot_0_0_0 do
                local var_4_2 = arg_4_0 % 2
                local var_4_3 = arg_4_1 % 2

                arg_4_0, arg_4_1 = math.floor(arg_4_0 / 2), math.floor(arg_4_1 / 2)

                if var_4_2 + var_4_3 == 1 then
                        var_4_0 = var_4_0 + var_4_1
                end

                var_4_1 = 2 * var_4_1
        end

        return var_4_0
end

function bit32.lshift(arg_5_0, arg_5_1)
        if math.abs(arg_5_1) >= slot_0_0_0 then
                return 0
        end

        arg_5_0 = arg_5_0 % slot_0_1_0

        if arg_5_1 < 0 then
                return math.floor(arg_5_0 * 2^arg_5_1)
        else
                return arg_5_0 * 2^arg_5_1 % slot_0_1_0
        end
end

function bit32.rshift(arg_6_0, arg_6_1)
        if math.abs(arg_6_1) >= slot_0_0_0 then
                return 0
        end

        arg_6_0 = arg_6_0 % slot_0_1_0

        if arg_6_1 > 0 then
                return math.floor(arg_6_0 * 2^-arg_6_1)
        else
                return arg_6_0 * 2^-arg_6_1 % slot_0_1_0
        end
end

function bit32.arshift(arg_7_0, arg_7_1)
        if math.abs(arg_7_1) >= slot_0_0_0 then
                return 0
        end

        arg_7_0 = arg_7_0 % slot_0_1_0

        if arg_7_1 > 0 then
                local var_7_0 = 0

                if arg_7_0 >= slot_0_1_0 / 2 then
                        var_7_0 = slot_0_1_0 - 2^(slot_0_0_0 - arg_7_1)
                end

                return math.floor(arg_7_0 * 2^-arg_7_1) + var_7_0
        else
                return arg_7_0 * 2^-arg_7_1 % slot_0_1_0
        end
end

slot_0_2_0 = {
        animation_rise_time = 0.5,
        color_picker_id = "standalone_hit_damage.color_picker",
        duration_slider_id = "standalone_hit_damage.duration_slider",
        animation_rise_distance = 50,
        toggle_id = "standalone_hit_damage.toggle",
        ui_path = "visuals>enemy>ESP"
}
slot_0_3_0 = {}
slot_0_4_0 = {}
slot_0_5_0 = false

mods.events:add_listener("player_hurt")

function slot_0_6_0()
        local var_8_0 = gui.ctx:find(slot_0_2_0.ui_path)

        if var_8_0 then
                slot_0_3_0.toggle = gui.checkbox(gui.control_id(slot_0_2_0.toggle_id))

                slot_0_3_0.toggle:set_value(true)

                slot_0_3_0.duration_slider = gui.slider(gui.control_id(slot_0_2_0.duration_slider_id), 0.5, 5, {
                        "%.1fs"
                }, 0.1)
                slot_0_3_0.color_picker = gui.color_picker(gui.control_id(slot_0_2_0.color_picker_id))

                local var_8_1 = gui.make_control("Hit", slot_0_3_0.toggle)

                var_8_1.tooltip = "Hit Damage"

                var_8_1:add(slot_0_3_0.duration_slider)
                var_8_1:add(slot_0_3_0.color_picker)
                var_8_0:add(var_8_1)

                slot_0_5_0 = true

                return true
        end

        return false
end

function slot_0_7_0(arg_9_0)
        if arg_9_0:get_name() ~= "player_hurt" then
                return
        end

        if not slot_0_5_0 or not slot_0_3_0.toggle or not slot_0_3_0.toggle:get_value():get() then
                return
        end

        local var_9_0 = arg_9_0:get_controller("attacker")
        local var_9_1 = entities.get_local_controller()

        if var_9_0 and var_9_1 and var_9_0 == var_9_1 then
                local var_9_2 = arg_9_0:get_controller("userid")

                if var_9_2 and var_9_2:is_enemy() then
                        local var_9_3 = arg_9_0:get_int("dmg_health")

                        if var_9_3 > 0 then
                                local var_9_4 = var_9_2:get_pawn()

                                if var_9_4 then
                                        entities.players:for_each(function(arg_10_0)
                                                if arg_10_0.entity == var_9_4 then
                                                        local var_10_0 = arg_10_0.handle
                                                        local var_10_1 = var_9_4:get_eye_pos() + vector(0, 0, 10)

                                                        if slot_0_4_0[var_10_0] then
                                                                local var_10_2 = slot_0_4_0[var_10_0]

                                                                var_10_2.damage = var_10_2.damage + var_9_3
                                                                var_10_2.pos = var_10_1
                                                                var_10_2.time = game.global_vars.real_time
                                                        else
                                                                slot_0_4_0[var_10_0] = {
                                                                        pos = var_10_1,
                                                                        damage = var_9_3,
                                                                        time = game.global_vars.real_time
                                                                }
                                                        end
                                                end
                                        end)
                                end
                        end
                end
        end
end

function slot_0_8_0()
        if not slot_0_5_0 then
                slot_0_6_0()

                return
        end

        if not slot_0_3_0.toggle or not slot_0_3_0.toggle:get_value():get() or next(slot_0_4_0) == nil then
                if next(slot_0_4_0) ~= nil then
                        slot_0_4_0 = {}
                end

                return
        end

        local var_11_0 = game.global_vars.real_time
        local var_11_1 = draw.surface
        local var_11_2 = slot_0_3_0.duration_slider:get_value():get()
        local var_11_3 = slot_0_3_0.color_picker:get_value():get()

        var_11_1.font = draw.fonts.gui_title or draw.fonts.gui_main

        if not var_11_1.font then
                return
        end

        local var_11_4 = draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center)
        local var_11_5 = {}

        for iter_11_0, iter_11_1 in pairs(slot_0_4_0) do
                local var_11_6 = var_11_0 - iter_11_1.time
                local var_11_7 = slot_0_2_0.animation_rise_time + var_11_2

                if var_11_7 < var_11_6 then
                        table.insert(var_11_5, iter_11_0)
                else
                        local var_11_8 = math.world_to_screen(iter_11_1.pos)

                        if var_11_8 then
                                local var_11_9 = 0
                                local var_11_10 = 1

                                if var_11_6 < slot_0_2_0.animation_rise_time then
                                        local var_11_11 = var_11_6 / slot_0_2_0.animation_rise_time

                                        var_11_9 = math.lerp(0, -slot_0_2_0.animation_rise_distance, var_11_11)
                                else
                                        var_11_9 = -slot_0_2_0.animation_rise_distance
                                end

                                if var_11_6 > var_11_7 / 2 then
                                        local var_11_12 = var_11_7 / 2
                                        local var_11_13 = var_11_7 - var_11_12

                                        var_11_10 = 1 - (var_11_6 - var_11_12) / var_11_13
                                end

                                local var_11_14 = draw.vec2(var_11_8.x, var_11_8.y + var_11_9)
                                local var_11_15 = var_11_3:mod_a(var_11_10)
                                local var_11_16 = draw.color(0, 0, 0, 150):mod_a(var_11_10)
                                local var_11_17 = "-" .. tostring(iter_11_1.damage)

                                var_11_1:add_text(draw.vec2(var_11_14.x + 2, var_11_14.y + 2), var_11_17, var_11_16, var_11_4)
                                var_11_1:add_text(var_11_14, var_11_17, var_11_15, var_11_4)
                        end
                end
        end

        for iter_11_2, iter_11_3 in ipairs(var_11_5) do
                slot_0_4_0[iter_11_3] = nil
        end
end

events.event:add(slot_0_7_0)
events.present_queue:add(slot_0_8_0)
