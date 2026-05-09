--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("lua>elements a>hitmarkers"))
slot_0_1_0 = gui.make_control("Hit Markers", slot_0_0_0)

gui.ctx:find("lua>elements a"):add(slot_0_1_0)

slot_0_3_0 = {}
slot_0_4_0 = {}
slot_0_5_0 = draw.color(255, 255, 255)

function slot_0_6_0(arg_1_0)
        for iter_1_0, iter_1_1 in ipairs(slot_0_4_0) do
                if iter_1_1.position:dist_sqr(arg_1_0) < 10 then
                        return iter_1_1
                end
        end

        return nil
end

events.present_queue:add(function()
        local var_2_0 = draw.surface

        var_2_0.g.anti_alias = true

        for iter_2_0 = #slot_0_4_0, 1, -1 do
                local var_2_1 = slot_0_4_0[iter_2_0]

                if var_2_1 ~= nil then
                        var_2_1.position = var_2_1.position + math.vec3(0, 0, 0.3)
                        var_2_1.opacity = var_2_1.opacity - game.global_vars.frame_time * 0.3

                        if var_2_1.opacity <= 0 then
                                table.remove(slot_0_4_0, iter_2_0)
                        else
                                local var_2_2 = math.world_to_screen(var_2_1.position)

                                if var_2_2 then
                                        local var_2_3 = draw.text_params.with_h(draw.text_alignment.center)
                                        local var_2_4 = tostring(var_2_1.damage)
                                        local var_2_5 = slot_0_5_0:a(math.floor(var_2_1.opacity * 255))

                                        var_2_0:add_text(math.vec2(var_2_2.x, var_2_2.y), var_2_4, var_2_5, var_2_3)
                                end
                        end
                end
        end
end)
events.event:add(function(arg_3_0)
        if not slot_0_0_0:get_value():get() then
                return
        end

        local var_3_0 = arg_3_0:get_name()

        if var_3_0 == "player_hurt" then
                local var_3_1 = entities.get_local_pawn()
                local var_3_2 = arg_3_0:get_pawn_from_id("userid")
                local var_3_3 = arg_3_0:get_pawn_from_id("attacker")

                if var_3_2 == var_3_1 or var_3_3 ~= var_3_1 then
                        return
                end

                local var_3_4 = var_3_2:get_abs_origin()
                local var_3_5 = math.huge
                local var_3_6

                for iter_3_0 = 1, #slot_0_3_0 do
                        local var_3_7 = slot_0_3_0[iter_3_0]
                        local var_3_8 = var_3_7.position:dist_sqr(var_3_4)

                        if var_3_8 < var_3_5 then
                                var_3_5 = var_3_8
                                var_3_6 = var_3_7
                        end
                end

                if var_3_6 == nil then
                        return
                end

                local var_3_9 = slot_0_6_0(var_3_6.position)

                if var_3_9 then
                        var_3_9.damage = var_3_9.damage + arg_3_0:get_int("dmg_health")
                        var_3_9.opacity = 1
                else
                        table.insert(slot_0_4_0, {
                                opacity = 1,
                                position = var_3_6.position,
                                damage = arg_3_0:get_int("dmg_health")
                        })
                end

                slot_0_3_0 = {}
        end

        if var_3_0 == "bullet_impact" then
                local var_3_10 = entities.get_local_pawn()

                if arg_3_0:get_pawn_from_id("userid") ~= var_3_10 then
                        return
                end

                table.insert(slot_0_3_0, {
                        time = 0.2,
                        position = math.vec3(arg_3_0:get_float("x"), arg_3_0:get_float("y"), arg_3_0:get_float("z"))
                })
        end
end)
gui.notify:add(gui.notification("Hit Markers", "Hit Markers script loaded successfully!"))
print("Hit Markers script loaded")
