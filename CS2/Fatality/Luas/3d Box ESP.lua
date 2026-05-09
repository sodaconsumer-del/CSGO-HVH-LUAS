--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("esp_3dbox"))
slot_0_1_0 = gui.make_control("Enable ESP", slot_0_0_0)
slot_0_2_0 = gui.checkbox(gui.control_id("esp_teamcheck"))
slot_0_3_0 = gui.make_control("Team Check", slot_0_2_0)
slot_0_4_0 = gui.ctx:find("lua>elements a")

if slot_0_4_0 then
        slot_0_4_0:add(slot_0_1_0)
        slot_0_4_0:add(slot_0_3_0)
        slot_0_4_0:reset()
end

slot_0_5_0 = gui.color_picker(gui.control_id("esp_enemy_color"), true)
slot_0_6_0 = gui.make_control("Enemy Color", slot_0_5_0)
slot_0_7_0 = gui.color_picker(gui.control_id("esp_team_color"), true)
slot_0_8_0 = gui.make_control("Team Color", slot_0_7_0)
slot_0_9_0 = gui.ctx:find("lua>elements b")

if slot_0_9_0 then
        slot_0_9_0:add(slot_0_6_0)
        slot_0_9_0:add(slot_0_8_0)
        slot_0_9_0:reset()
end

function slot_0_10_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
        if arg_1_1 and arg_1_2 then
                arg_1_0:add_line(arg_1_1, arg_1_2, arg_1_3, arg_1_4 or 2)
        end
end

function slot_0_11_0()
        if not slot_0_0_0:get_value():get() then
                return
        end

        local var_2_0 = draw.surface
        local var_2_1 = slot_0_5_0:get_value():get()
        local var_2_2 = slot_0_7_0:get_value():get()
        local var_2_3 = slot_0_2_0:get_value():get()

        entities.players:for_each(function(arg_3_0)
                local var_3_0 = arg_3_0.entity

                if not var_3_0 or not var_3_0:is_alive() or not var_3_0:should_draw() then
                        return
                end

                if var_2_3 and not var_3_0:is_enemy() then
                        return
                end

                local var_3_1 = var_3_0:is_enemy() and var_2_1 or var_2_2
                local var_3_2 = var_3_0:get_abs_origin()
                local var_3_3 = var_3_0:get_eye_pos()

                if not var_3_2 or not var_3_3 then
                        return
                end

                local var_3_4 = var_3_2 + math.vec3(-16, -16, 0)
                local var_3_5 = var_3_3 + math.vec3(16, 16, 8)
                local var_3_6 = {
                        math.world_to_screen(math.vec3(var_3_4.x, var_3_4.y, var_3_4.z)),
                        math.world_to_screen(math.vec3(var_3_5.x, var_3_4.y, var_3_4.z)),
                        math.world_to_screen(math.vec3(var_3_5.x, var_3_5.y, var_3_4.z)),
                        math.world_to_screen(math.vec3(var_3_4.x, var_3_5.y, var_3_4.z)),
                        math.world_to_screen(math.vec3(var_3_4.x, var_3_4.y, var_3_5.z)),
                        math.world_to_screen(math.vec3(var_3_5.x, var_3_4.y, var_3_5.z)),
                        math.world_to_screen(math.vec3(var_3_5.x, var_3_5.y, var_3_5.z)),
                        math.world_to_screen(math.vec3(var_3_4.x, var_3_5.y, var_3_5.z))
                }

                slot_0_10_0(var_2_0, var_3_6[1], var_3_6[2], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[2], var_3_6[3], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[3], var_3_6[4], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[4], var_3_6[1], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[5], var_3_6[6], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[6], var_3_6[7], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[7], var_3_6[8], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[8], var_3_6[5], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[1], var_3_6[5], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[2], var_3_6[6], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[3], var_3_6[7], var_3_1)
                slot_0_10_0(var_2_0, var_3_6[4], var_3_6[8], var_3_1)
        end)
end

events.present_queue:add(slot_0_11_0)
