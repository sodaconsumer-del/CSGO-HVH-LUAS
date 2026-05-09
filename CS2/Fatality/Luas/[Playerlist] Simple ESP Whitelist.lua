--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi then
        error("ffi library not available")

        return
end

ffi.cdef("    typedef struct {\n        float x, y, z;\n    } Vector;\n")

slot_0_0_0 = {
        model_state = 352,
        game_scene_node = 824,
        bone_head = 6,
        skeleton_instance = 128
}
slot_0_1_0 = {
        enabled = gui.checkbox(gui.control_id("esp_head_enabled")),
        size = gui.slider(gui.control_id("esp_head_size"), 1, 30, 5),
        color = gui.color_picker(gui.control_id("esp_head_color"), true),
        disable_list = gui.checkbox(gui.control_id("esp_disable_player_list")),
        auto_sizing = gui.checkbox(gui.control_id("esp_auto_sizing"))
}
slot_0_2_0 = gui.ctx and gui.ctx:find("lua>elements a")

if slot_0_2_0 then
        slot_0_2_0:add(gui.make_control("Head Dot Enabled", slot_0_1_0.enabled))
        slot_0_2_0:add(gui.make_control("Head Dot Size", slot_0_1_0.size))
        slot_0_2_0:add(gui.make_control("Head Dot Color", slot_0_1_0.color))
        slot_0_2_0:add(gui.make_control("Hide Player List", slot_0_1_0.disable_list))
        slot_0_2_0:add(gui.make_control("Disable Dynamic ESP", slot_0_1_0.auto_sizing))
        slot_0_2_0:reset()
end

slot_0_3_0 = {
        scan_frame = 0,
        scroll_offset = 0,
        players = {},
        teams = {},
        rects = {},
        window = {
                w = 300,
                max_w = 550,
                min_w = 220,
                x = 50,
                y = 50,
                h = 750
        },
        drag = {
                oy = 0,
                ox = 0,
                active = false
        },
        mouse = {
                prev_down = false,
                down = false
        }
}

function slot_0_4_0()
        if not slot_0_1_0.disable_list then
                return true
        end

        local var_1_0 = slot_0_1_0.disable_list:get_value()

        return (not var_1_0 or not var_1_0:get()) and true
end

function slot_0_5_0(arg_2_0)
        if not arg_2_0 then
                return ""
        end

        if #arg_2_0 <= 22 then
                return arg_2_0
        end

        return arg_2_0:sub(1, 19) .. "..."
end

function slot_0_6_0(arg_3_0, arg_3_1, arg_3_2)
        return math.max(arg_3_1, math.min(arg_3_2, arg_3_0))
end

function slot_0_7_0(arg_4_0, arg_4_1)
        local var_4_0 = arg_4_0.x - arg_4_1.x
        local var_4_1 = arg_4_0.y - arg_4_1.y
        local var_4_2 = arg_4_0.z - arg_4_1.z

        return math.sqrt(var_4_0 * var_4_0 + var_4_1 * var_4_1 + var_4_2 * var_4_2)
end

slot_0_8_0 = {
        scale = 1,
        frame = 0
}
slot_0_9_0 = 0

function slot_0_10_0()
        slot_0_9_0 = slot_0_9_0 + 1

        if slot_0_9_0 - slot_0_8_0.frame < 35 then
                return slot_0_8_0.scale
        end

        if draw and draw.surface and draw.surface.font then
                local var_5_0 = draw.surface.font:get_text_size("A", false)
                local var_5_1 = draw.surface.font:get_text_size("A", true)

                if var_5_0 and var_5_1 and var_5_0.x > 0 then
                        slot_0_8_0.scale = var_5_1.x / var_5_0.x
                        slot_0_8_0.frame = slot_0_9_0

                        return slot_0_8_0.scale
                end
        end

        return 1
end

function slot_0_11_0()
        local var_6_0 = gui.input and gui.input:cursor()

        if not var_6_0 then
                return nil
        end

        local var_6_1 = slot_0_10_0()

        return draw.vec2(var_6_0.x * var_6_1, var_6_0.y * var_6_1)
end

function slot_0_12_0(arg_7_0, arg_7_1)
        if not arg_7_0 then
                return vector(0, 0, 0)
        end

        local var_7_0 = ffi.cast("uintptr_t*", arg_7_0)[0]

        if var_7_0 == 0 then
                return vector(0, 0, 0)
        end

        local var_7_1 = ffi.cast("uintptr_t*", var_7_0 + slot_0_0_0.game_scene_node)[0]

        if var_7_1 == 0 then
                return vector(0, 0, 0)
        end

        local var_7_2 = ffi.cast("uintptr_t*", var_7_1 + slot_0_0_0.model_state + slot_0_0_0.skeleton_instance)[0]

        if var_7_2 == 0 then
                return vector(0, 0, 0)
        end

        local var_7_3 = ffi.cast("Vector*", var_7_2 + arg_7_1 * 32)[0]

        return var_7_3 and vector(var_7_3.x, var_7_3.y, var_7_3.z) or vector(0, 0, 0)
end

function slot_0_13_0()
        if not (slot_0_1_0.enabled:get_value() and slot_0_1_0.enabled:get_value():get()) then
                return
        end

        local var_8_0 = slot_0_1_0.size:get_value() and slot_0_1_0.size:get_value():get() or 5
        local var_8_1 = slot_0_1_0.color:get_value() and slot_0_1_0.color:get_value():get() or draw.color(204, 0, 0, 73)
        local var_8_2 = not (slot_0_1_0.auto_sizing and slot_0_1_0.auto_sizing:get_value() and slot_0_1_0.auto_sizing:get_value():get())
        local var_8_3 = entities.get_local_pawn()
        local var_8_4

        if var_8_2 and var_8_3 then
                var_8_4 = slot_0_12_0(var_8_3, slot_0_0_0.bone_head)
        end

        entities.players:for_each(function(arg_9_0)
                local var_9_0 = arg_9_0.entity

                if not var_9_0 or not var_8_3 then
                        return
                end

                if not var_9_0:is_alive() then
                        return
                end

                local var_9_1 = var_9_0:get_name()

                if not var_9_1 or not slot_0_3_0.players[var_9_1] then
                        return
                end

                local var_9_2 = slot_0_12_0(var_9_0, slot_0_0_0.bone_head)

                if var_9_2.x == 0 and var_9_2.y == 0 and var_9_2.z == 0 then
                        return
                end

                local var_9_3 = math.world_to_screen(var_9_2)

                if var_9_3 then
                        local var_9_4 = var_8_0

                        if var_8_2 and var_8_4 and var_8_4.x ~= 0 then
                                local var_9_5 = slot_0_7_0(var_8_4, var_9_2)

                                if var_9_5 > 0.01 then
                                        local var_9_6 = 500
                                        local var_9_7 = var_8_0 * (var_9_6 / var_9_5)

                                        var_9_4 = slot_0_6_0(var_9_7, 2, 20)
                                end
                        end

                        draw.surface:add_circle_filled(draw.vec2(var_9_3.x, var_9_3.y), var_9_4, var_8_1)
                end
        end)
end

function slot_0_14_0()
        local var_10_0 = {}
        local var_10_1 = entities.get_local_pawn()

        if not var_10_1 then
                slot_0_3_0.players = {}
                slot_0_3_0.teams = {}

                return
        end

        entities.players:for_each(function(arg_11_0)
                local var_11_0 = arg_11_0.entity

                if not var_11_0 or var_11_0 == var_10_1 then
                        return
                end

                local var_11_1 = var_11_0:get_name()

                if not var_11_1 or var_11_1 == "" then
                        return
                end

                var_10_0[var_11_1] = true

                if not slot_0_3_0.players[var_11_1] then
                        slot_0_3_0.players[var_11_1] = false
                end

                slot_0_3_0.teams[var_11_1] = var_11_0:is_enemy() and "enemy" or "teammate"
        end)

        for iter_10_0 in pairs(slot_0_3_0.players) do
                if not var_10_0[iter_10_0] then
                        slot_0_3_0.players[iter_10_0] = nil
                        slot_0_3_0.teams[iter_10_0] = nil
                end
        end
end

function slot_0_15_0()
        if not draw.surface then
                return
        end

        local var_12_0 = slot_0_3_0.window
        local var_12_1 = 8
        local var_12_2 = 20

        slot_0_3_0.rects = {}

        draw.surface:add_text(draw.vec2(var_12_0.x + var_12_1, var_12_0.y + var_12_1), "Head ESP - Players", draw.color(255, 200, 100, 255))

        local var_12_3 = {}
        local var_12_4 = {}

        for iter_12_0 in pairs(slot_0_3_0.players) do
                if slot_0_3_0.teams[iter_12_0] == "teammate" then
                        table.insert(var_12_4, iter_12_0)
                else
                        table.insert(var_12_3, iter_12_0)
                end
        end

        table.sort(var_12_3)
        table.sort(var_12_4)

        local function var_12_5(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
                if #arg_13_2 == 0 then
                        return arg_13_3
                end

                local var_13_0 = arg_13_3

                if var_13_0 + var_12_2 > var_12_0.y + var_12_0.h - var_12_1 then
                        return arg_13_3
                end

                draw.surface:add_text(draw.vec2(var_12_0.x + var_12_1, var_13_0), arg_13_0, arg_13_1)

                local var_13_1 = var_13_0 + var_12_2

                for iter_13_0, iter_13_1 in ipairs(arg_13_2) do
                        if var_13_1 + var_12_2 > var_12_0.y + var_12_0.h - var_12_1 then
                                break
                        end

                        local var_13_2 = slot_0_3_0.players[iter_13_1]
                        local var_13_3 = var_13_2 and "[X]" or "[ ]"
                        local var_13_4 = var_13_2 and draw.color(100, 255, 100, 255) or draw.color(180, 180, 180, 255)
                        local var_13_5 = slot_0_5_0(iter_13_1)
                        local var_13_6 = var_13_3 .. " " .. var_13_5

                        draw.surface:add_text(draw.vec2(var_12_0.x + var_12_1, var_13_1), var_13_6, var_13_4)

                        slot_0_3_0.rects[iter_13_1] = draw.rect(var_12_0.x + var_12_1, var_13_1, var_12_0.x + var_12_0.w - var_12_1, var_13_1 + var_12_2)
                        var_13_1 = var_13_1 + var_12_2
                end

                return var_13_1
        end

        local var_12_6 = var_12_0.y + 30
        local var_12_7 = var_12_5("Enemies", draw.color(255, 80, 80, 255), var_12_3, var_12_6)
        local var_12_8 = var_12_5("Teammates", draw.color(80, 150, 255, 255), var_12_4, var_12_7)

        if #var_12_3 + #var_12_4 + 2 > math.floor((var_12_0.h - 30) / var_12_2) then
                draw.surface:add_text(draw.vec2(var_12_0.x + var_12_0.w - 30, var_12_0.y + var_12_0.h - var_12_1 - 15), "▼", draw.color(150, 150, 150, 255))
        end
end

function slot_0_16_0(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
        local var_14_0 = slot_0_11_0()

        if not var_14_0 then
                return false
        end

        return arg_14_0 <= var_14_0.x and var_14_0.x <= arg_14_0 + arg_14_2 and arg_14_1 <= var_14_0.y and var_14_0.y <= arg_14_1 + arg_14_3
end

if events.input then
        events.input:add(function(arg_15_0)
                if not slot_0_4_0() then
                        return
                end

                if arg_15_0 == 513 then
                        slot_0_3_0.mouse.down = true
                elseif arg_15_0 == 514 then
                        slot_0_3_0.mouse.down = false

                        local var_15_0 = slot_0_11_0()

                        if not var_15_0 then
                                return
                        end

                        for iter_15_0, iter_15_1 in pairs(slot_0_3_0.rects) do
                                if iter_15_1 and iter_15_1:contains(var_15_0) then
                                        slot_0_3_0.players[iter_15_0] = not slot_0_3_0.players[iter_15_0]

                                        break
                                end
                        end
                end
        end)
end

if events.present_queue then
        events.present_queue:add(function()
                slot_0_3_0.scan_frame = slot_0_3_0.scan_frame + 1

                if slot_0_3_0.scan_frame >= 30 then
                        slot_0_14_0()

                        slot_0_3_0.scan_frame = 0
                end

                if not slot_0_4_0() then
                        slot_0_3_0.drag.active = false
                        slot_0_3_0.rects = {}

                        slot_0_13_0()

                        return
                end

                local var_16_0 = slot_0_11_0()

                if var_16_0 then
                        local var_16_1 = slot_0_3_0.window

                        if slot_0_3_0.mouse.down and not slot_0_3_0.mouse.prev_down and slot_0_16_0(var_16_1.x, var_16_1.y, var_16_1.w, var_16_1.h) then
                                slot_0_3_0.drag.active = true
                                slot_0_3_0.drag.ox = var_16_0.x - var_16_1.x
                                slot_0_3_0.drag.oy = var_16_0.y - var_16_1.y
                        end

                        if not slot_0_3_0.mouse.down and slot_0_3_0.mouse.prev_down then
                                slot_0_3_0.drag.active = false
                        end

                        if slot_0_3_0.drag.active then
                                local var_16_2 = var_16_0.x - slot_0_3_0.drag.ox
                                local var_16_3 = var_16_0.y - slot_0_3_0.drag.oy
                                local var_16_4 = 1920
                                local var_16_5 = 1080

                                if engine and engine.get_screen_size then
                                        var_16_4, var_16_5 = engine:get_screen_size()
                                elseif draw and draw.get_screen_size then
                                        local var_16_6 = draw.get_screen_size()

                                        var_16_4, var_16_5 = var_16_6.x, var_16_6.y
                                end

                                var_16_1.x = slot_0_6_0(var_16_2, 0, var_16_4 - 150)
                                var_16_1.y = slot_0_6_0(var_16_3, 0, var_16_5 - 50)
                        end
                end

                slot_0_3_0.mouse.prev_down = slot_0_3_0.mouse.down

                slot_0_15_0()
                slot_0_13_0()
        end)
end
