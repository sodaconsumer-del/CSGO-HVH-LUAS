--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = 0
slot_0_1_0 = entities.get_local_pawn()
slot_0_2_0 = ws.get_resource_dir()

function slot_0_3_0()
        if slot_0_0_0 == 0 then
                error("[VALORANTIFY]", "Called play_kill_sound() with 0 kills!")

                return
        end

        local var_1_0 = "play /" .. slot_0_2_0 .. "/sounds/"

        if slot_0_0_0 < 5 then
                game.engine:client_cmd(var_1_0 .. "mk" .. slot_0_0_0)

                return
        end

        game.engine:client_cmd(var_1_0 .. "ace")
end

function slot_0_4_0(arg_2_0, arg_2_1, arg_2_2)
        if arg_2_2 > 0 then
                return
        end

        if arg_2_0:get_pawn() == slot_0_1_0 then
                slot_0_0_0 = 0

                return
        end

        if arg_2_1:get_pawn() ~= slot_0_1_0 then
                return
        end

        if not arg_2_0:is_enemy() then
                return
        end

        slot_0_0_0 = slot_0_0_0 + 1

        slot_0_3_0()
end

function slot_0_5_0(arg_3_0)
        local var_3_0 = arg_3_0:get_name()

        if var_3_0 == "player_hurt" then
                slot_0_4_0(arg_3_0:get_controller("userid"), arg_3_0:get_controller("attacker"), arg_3_0:get_int("health"))

                return
        end

        if var_3_0 == "round_end" or var_3_0 == "round_start" then
                slot_0_0_0 = 0

                return
        end
end

events.event:add(slot_0_5_0)
