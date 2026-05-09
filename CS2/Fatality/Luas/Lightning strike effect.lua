--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("lua>elements a>realistic_lightning_effect"))
slot_0_1_0 = gui.make_control("Lightning strike effect", slot_0_0_0)
slot_0_2_0 = gui.ctx:find("lua>elements a")

if slot_0_2_0 then
        slot_0_2_0:add(slot_0_1_0)
else
        error("Failed to find GUI context group for lightning effect!")
end

slot_0_3_0 = {}

function slot_0_4_0(arg_1_0, arg_1_1)
        local var_1_0
        local var_1_1
        local var_1_2

        if arg_1_0 < 0.5 then
                var_1_0 = math.floor(math.lerp(50, 135, arg_1_0 / 0.5))
                var_1_1 = math.floor(math.lerp(100, 180, arg_1_0 / 0.5))
                var_1_2 = math.floor(math.lerp(255, 255, arg_1_0 / 0.5))
        else
                var_1_0 = math.floor(math.lerp(135, 100, (arg_1_0 - 0.5) / 0.5))
                var_1_1 = math.floor(math.lerp(180, 50, (arg_1_0 - 0.5) / 0.5))
                var_1_2 = math.floor(math.lerp(255, 226, (arg_1_0 - 0.5) / 0.5))
        end

        return draw.color(var_1_0, var_1_1, var_1_2, math.floor(arg_1_1 * 255))
end

events.present_queue:add(function()
        local var_2_0 = draw.surface

        for iter_2_0 = #slot_0_3_0, 1, -1 do
                local var_2_1 = slot_0_3_0[iter_2_0]

                if var_2_1 ~= nil then
                        var_2_1.time = var_2_1.time - game.global_vars.frame_time
                        var_2_1.opacity = var_2_1.opacity - game.global_vars.frame_time * 1.5

                        if var_2_1.time <= 0 or var_2_1.opacity <= 0 then
                                table.remove(slot_0_3_0, iter_2_0)
                        else
                                local var_2_2 = var_2_1.position

                                for iter_2_1, iter_2_2 in ipairs(var_2_1.path) do
                                        local var_2_3 = var_2_2 + iter_2_2
                                        local var_2_4 = math.world_to_screen(var_2_2)
                                        local var_2_5 = math.world_to_screen(var_2_3)

                                        if var_2_4 and var_2_5 then
                                                local var_2_6 = slot_0_4_0(iter_2_1 / #var_2_1.path, var_2_1.opacity)

                                                var_2_0:add_line(var_2_4, var_2_5, var_2_6, 4)

                                                if math.random() > 0.6 then
                                                        local var_2_7 = var_2_3 + math.vec3(math.random(-10, 10), math.random(-10, 10), math.random(-10, 20))
                                                        local var_2_8 = math.world_to_screen(var_2_3)
                                                        local var_2_9 = math.world_to_screen(var_2_7)

                                                        if var_2_8 and var_2_9 then
                                                                local var_2_10 = slot_0_4_0(iter_2_1 / #var_2_1.path, var_2_1.opacity * 0.7)

                                                                var_2_0:add_line(var_2_8, var_2_9, var_2_10, 2)
                                                        end
                                                end
                                        end

                                        var_2_2 = var_2_3
                                end
                        end
                end
        end
end)
events.event:add(function(arg_3_0)
        if not slot_0_0_0:get_value():get() then
                return
        end

        if arg_3_0:get_name() == "player_death" then
                local var_3_0 = entities.get_local_pawn()
                local var_3_1 = arg_3_0:get_pawn_from_id("userid")

                if arg_3_0:get_pawn_from_id("attacker") ~= var_3_0 or not var_3_1 then
                        return
                end

                local var_3_2 = var_3_1:get_abs_origin()
                local var_3_3 = {}

                for iter_3_0 = 1, 20 do
                        local var_3_4 = math.vec3(math.random(-15, 15), math.random(-15, 15), math.random(20, 60))

                        table.insert(var_3_3, var_3_4)
                end

                table.insert(slot_0_3_0, {
                        opacity = 1,
                        time = 1.8,
                        position = var_3_2,
                        path = var_3_3
                })
        end
end)
