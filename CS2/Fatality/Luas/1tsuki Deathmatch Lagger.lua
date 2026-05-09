--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("lua>element a>Enable 1tsuki DM Lagger"))
slot_0_1_0 = gui.make_control("Enable 1tsuki DM Lagger", slot_0_0_0)
slot_0_2_0 = gui.ctx:find("lua>elements a")

slot_0_2_0:add(slot_0_1_0)
slot_0_2_0:reset()

slot_0_3_0 = 0
slot_0_4_0 = 0

events.create_move:add(function(arg_1_0)
        if not slot_0_0_0:get_value():get() then
                return
        end

        slot_0_3_0 = slot_0_3_0 + 1

        if slot_0_3_0 == 64 then
                local var_1_0 = game.cvar:find("mp_death_drop_gun")

                if var_1_0 then
                        slot_0_4_0 = var_1_0.value
                end

                slot_0_3_0 = 0
        end

        local var_1_1 = vector(89, slot_0_3_0, 0)

        arg_1_0:set_button(input_bit_mask.in_use)

        local var_1_2 = math.random(2, 18)
        local var_1_3 = "buy unused " .. var_1_2
        local var_1_4 = game.cvar:find("game_type")

        if var_1_4 and var_1_4.value == 1 then
                game.engine:client_cmd(var_1_3)
        else
                game.engine:client_cmd("player_ping")

                if slot_0_3_0 % 2 == 0 then
                        game.engine:client_cmd(var_1_3)
                else
                        game.engine:client_cmd("sellbackall")
                end

                if slot_0_4_0 == 0 then
                        game.engine:client_cmd("drop")
                end
        end

        game.engine:client_cmd("jointeam")
end)
