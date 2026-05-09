--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = false

events.present_queue:add(function()
        local var_1_0 = gui.input:is_key_down(27)

        if var_1_0 and var_1_0 ~= slot_0_0_0 then
                game.engine:client_cmd("hideconsole")
        end

        slot_0_0_0 = var_1_0
end)
