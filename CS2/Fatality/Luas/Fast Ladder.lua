--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function FastLadder(arg_1_0)
        local var_1_0 = entities.get_local_pawn()

        if var_1_0 == nil then
                return
        end

        local var_1_1 = var_1_0:get_abs_velocity()

        if var_1_1.x ~= 0 and var_1_1.y ~= 0 then
                return
        end

        if var_1_0.m_fFlags:get() ~= 65664 then
                return
        end

        if arg_1_0:get_forwardmove() <= 0 then
                return
        end

        local var_1_2 = arg_1_0:get_viewangles()

        var_1_2.y = var_1_2.y + 45

        arg_1_0:set_viewangles(var_1_2)
        arg_1_0:set_leftmove(-1)
end

events.create_move:add(FastLadder)
