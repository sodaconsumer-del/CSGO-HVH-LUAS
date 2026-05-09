--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function getflags(arg_1_0)
        local var_1_0 = arg_1_0.m_fFlags:get()

        return {
                on_ground = bit.band(arg_1_0.m_fFlags:get(), 1) == 1,
                duck = bit.band(arg_1_0.m_fFlags:get(), 2) == 1
        }
end

slot_0_0_0 = 0

events.override_view:add(function(arg_2_0)
        local var_2_0 = entities.get_local_pawn()

        if getflags(var_2_0).on_ground then
                slot_0_0_0 = slot_0_0_0 + 1
        else
                slot_0_0_0 = 0
        end

        var_2_0:set_abs_angles(vector(0, game.global_vars.tick_count % 30 * 12, 0))
end)
