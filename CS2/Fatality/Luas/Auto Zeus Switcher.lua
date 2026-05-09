--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        TICK_INTERVAL = 0.08,
        DIST_DEFAULT = 800,
        DIST_MAX = 1500,
        DIST_MIN = 50
}
slot_0_1_0 = {
        next_tick = 0
}
slot_0_2_0 = gui.ctx:find("lua>elements a")
slot_0_3_0 = gui.checkbox(gui.control_id("zeus_safe"))
slot_0_4_0 = gui.slider(gui.control_id("zeus_trigger_dist"), slot_0_0_0.DIST_MIN, slot_0_0_0.DIST_MAX, slot_0_0_0.DIST_DEFAULT)

slot_0_2_0:add(gui.make_control("Trigger Zeus", slot_0_3_0))
slot_0_2_0:add(gui.make_control("Trigger Dist", slot_0_4_0))
slot_0_2_0:reset()

function slot_0_5_0()
        local var_1_0 = utils.get_unix_time()

        if var_1_0 < slot_0_1_0.next_tick then
                return
        end

        slot_0_1_0.next_tick = var_1_0 + slot_0_0_0.TICK_INTERVAL

        if not slot_0_3_0:get_value():get() then
                return
        end

        local var_1_1 = entities.get_local_pawn()

        if not var_1_1 or not var_1_1:is_alive() then
                return
        end

        local var_1_2 = var_1_1:get_active_weapon()

        if var_1_2 and var_1_2:get_id() == weapon_id.taser then
                return
        end

        local var_1_3 = tonumber(slot_0_4_0:get_value():get())
        local var_1_4 = type(var_1_3) == "number" and var_1_3 > 0 and math.clamp(var_1_3, slot_0_0_0.DIST_MIN, slot_0_0_0.DIST_MAX) or slot_0_0_0.DIST_DEFAULT
        local var_1_5 = var_1_1:get_abs_origin()

        entities.players:for_each(function(arg_2_0)
                local var_2_0 = arg_2_0.entity

                if not var_2_0 or var_2_0 == var_1_1 or not var_2_0:is_alive() or not var_2_0:is_enemy() then
                        return
                end

                local var_2_1 = var_2_0:get_active_weapon()

                if not var_2_1 or var_2_1:get_id() ~= weapon_id.taser then
                        return
                end

                local var_2_2 = var_2_0:get_abs_origin()

                if var_1_5:dist(var_2_2) < var_1_4 then
                        game.engine:client_cmd("slot11")
                end
        end)
end

events.present_queue:add(slot_0_5_0)
