--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function setnegro()
        local var_1_0 = entities.get_local_pawn()
        local var_1_1 = var_1_0:get_abs_angles()

        var_1_0:set_abs_angles(vector(-40, game.global_vars.tick_count % 36 * 10, 30))
end

events.render_start_pre:add(function(arg_2_0)
        entities.get_local_pawn():set_abs_angles(vector(0, 0, 0))
end)
events.setup_view_post:add(function(arg_3_0)
        setnegro()
end)
