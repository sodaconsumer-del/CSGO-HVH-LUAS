--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("All_say"))
slot_0_1_0 = gui.checkbox(gui.control_id("my_checkbox"))
slot_0_2_0 = gui.make_control("[Vote Cast] (Team_chat / All_say)", slot_0_0_0)
slot_0_3_0 = gui.ctx:find("lua>elements a")

slot_0_2_0:add(slot_0_1_0)
slot_0_3_0:add(slot_0_2_0)
slot_0_3_0:reset()
mods.events:add_listener("vote_cast")

slot_0_4_0 = {
        [0] = "U",
        "S",
        "T",
        "CT"
}

events.event:add(function(arg_1_0)
        if arg_1_0:get_name() == "vote_cast" then
                pPlayerController = arg_1_0:get_controller("userid")

                print(string.format("[%s] %s voted %s", slot_0_4_0[arg_1_0:get_int("team")] or "U", pPlayerController:get_name(), arg_1_0:get_int("vote_option") == 0 and "yes" or "no"))

                if slot_0_0_0:get_value():get() then
                        game.engine:client_cmd("say " .. string.format("[%s] %s voted %s", slot_0_4_0[arg_1_0:get_int("team")] or "U", pPlayerController:get_name(), arg_1_0:get_int("vote_option") == 0 and "Yes" or "No"))
                end

                if slot_0_1_0:get_value():get() then
                        game.engine:client_cmd(" playerchatwheel CW.IFixBomb \"" .. string.format(" \b[%s] \x05%s \x10voted %s \"", slot_0_4_0[arg_1_0:get_int("team")] or "U", pPlayerController:get_name(), arg_1_0:get_int("vote_option") == 0 and "\x05Yes" or "\x02No"))
                end
        end
end)
