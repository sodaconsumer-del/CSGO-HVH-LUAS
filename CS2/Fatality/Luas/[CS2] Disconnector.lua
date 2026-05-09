--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

mods.events:add_listener("player_death")
mods.events:add_listener("round_start")

slot_0_0_0 = 0
slot_0_1_0 = 3

function slot_0_2_0()
        game.engine:client_cmd("disconnect")
end

function slot_0_3_0()
        local var_2_0 = draw.surface
        local var_2_1 = string.format("KILLS: %d/%d", slot_0_0_0, slot_0_1_0)

        var_2_0.font = draw.fonts.gui_main

        local var_2_2 = 10
        local var_2_3 = 50
        local var_2_4 = draw.color.white()

        if slot_0_0_0 >= slot_0_1_0 then
                var_2_4 = draw.color(255, 50, 50)
        end

        var_2_0:add_text(draw.vec2(var_2_2 + 1, var_2_3 + 1), var_2_1, draw.color.black())
        var_2_0:add_text(draw.vec2(var_2_2, var_2_3), var_2_1, var_2_4)
end

events.present_queue:add(slot_0_3_0)
events.event:add(function(arg_3_0)
        local var_3_0 = arg_3_0:get_name()

        if var_3_0 == "round_start" then
                slot_0_0_0 = 0

                return
        end

        if var_3_0 == "player_death" then
                local var_3_1 = arg_3_0:get_controller("userid")
                local var_3_2 = arg_3_0:get_controller("attacker")

                if var_3_1 == nil or var_3_2 == nil then
                        return
                end

                local var_3_3 = var_3_1.m_bIsLocalPlayerController:get()
                local var_3_4 = var_3_2.m_bIsLocalPlayerController:get()

                if not var_3_3 and var_3_4 then
                        slot_0_0_0 = slot_0_0_0 + 1

                        if slot_0_0_0 >= slot_0_1_0 then
                                slot_0_2_0()
                        end
                end

                return
        end
end)
