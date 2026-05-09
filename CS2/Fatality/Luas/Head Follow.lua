--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        RADIUS_THRESHOLD = 32,
        PLAYER_HEIGHT = 72,
        DEAD_ZONE = 5,
        FOLLOW_ENEMIES_ONLY = false,
        HEIGHT_MAX = 85,
        HEIGHT_MIN = 20
}
slot_0_1_0 = {
        enable_checkbox = nil
}

function slot_0_2_0()
        slot_0_1_0.enable_checkbox = gui.checkbox(gui.control_id("head_follow_enable"))

        slot_0_1_0.enable_checkbox:set_value(true)

        local var_1_0 = gui.make_control("Enable Head Follow", slot_0_1_0.enable_checkbox)
        local var_1_1 = gui.ctx:find("lua>elements a")

        if not var_1_1 then
                print("[Head Follow] Warning: Cannot find lua>elements a group")

                return
        end

        var_1_1:add(var_1_0)
        var_1_1:reset()
        print("[Head Follow] GUI initialized")
end

function slot_0_3_0()
        if not slot_0_1_0.enable_checkbox then
                return false
        end

        local var_2_0 = slot_0_1_0.enable_checkbox:get_value()

        if not var_2_0 then
                return false
        end

        return var_2_0:get() or false
end

slot_0_4_0 = {
        event_registered = false,
        is_following = false
}

function slot_0_5_0(arg_3_0)
        if not arg_3_0 then
                return false
        end

        local var_3_0 = entities.get_local_pawn()

        if not var_3_0 then
                return false
        end

        local var_3_1 = var_3_0:get_abs_origin()
        local var_3_2 = arg_3_0:get_abs_origin()

        return var_3_1:dist(var_3_2) < 0.1
end

function slot_0_6_0(arg_4_0)
        local var_4_0
        local var_4_1 = math.huge

        entities.players:for_each(function(arg_5_0)
                if arg_5_0.handle and arg_5_0.handle:valid() then
                        local var_5_0 = arg_5_0.handle:get()

                        if var_5_0 and (not var_5_0.is_null or not var_5_0:is_null()) and not slot_0_5_0(var_5_0) and (not slot_0_0_0.FOLLOW_ENEMIES_ONLY or var_5_0:is_enemy()) then
                                local var_5_1 = var_5_0:get_abs_origin()
                                local var_5_2 = arg_4_0:dist_2d(var_5_1)

                                if var_5_2 < var_4_1 then
                                        var_4_1 = var_5_2
                                        var_4_0 = var_5_0
                                end
                        end
                end
        end)

        return var_4_0, var_4_1
end

function slot_0_7_0(arg_6_0, arg_6_1)
        local var_6_0 = arg_6_0:dist_2d(arg_6_1)
        local var_6_1 = arg_6_0.z - arg_6_1.z
        local var_6_2 = var_6_0 < slot_0_0_0.RADIUS_THRESHOLD
        local var_6_3 = var_6_1 > slot_0_0_0.HEIGHT_MIN and var_6_1 < slot_0_0_0.HEIGHT_MAX

        return var_6_2 and var_6_3
end

function slot_0_8_0(arg_7_0, arg_7_1)
        local var_7_0 = vector(arg_7_1.x, arg_7_1.y, arg_7_1.z + slot_0_0_0.PLAYER_HEIGHT)
        local var_7_1 = var_7_0.x - arg_7_0.x
        local var_7_2 = var_7_0.y - arg_7_0.y

        return math.deg(math.atan2(var_7_2, var_7_1))
end

function slot_0_9_0(arg_8_0, arg_8_1, arg_8_2)
        local var_8_0 = vector(arg_8_2.x, arg_8_2.y, arg_8_2.z + slot_0_0_0.PLAYER_HEIGHT)

        if arg_8_1:dist_2d(var_8_0) < slot_0_0_0.DEAD_ZONE then
                arg_8_0:set_forwardmove(0)
                arg_8_0:set_leftmove(0)

                return
        end

        local var_8_1 = slot_0_8_0(arg_8_1, arg_8_2) - arg_8_0:get_viewangles().y

        while var_8_1 > 180 do
                var_8_1 = var_8_1 - 360
        end

        while var_8_1 < -180 do
                var_8_1 = var_8_1 + 360
        end

        local var_8_2 = math.rad(var_8_1)
        local var_8_3 = math.cos(var_8_2)
        local var_8_4 = math.sin(var_8_2)

        arg_8_0:set_forwardmove(var_8_3)
        arg_8_0:set_leftmove(var_8_4)
end

slot_0_2_0()

if not slot_0_4_0.event_registered then
        events.create_move:add(function(arg_9_0)
                if not slot_0_3_0() then
                        slot_0_4_0.target_player = nil
                        slot_0_4_0.is_following = false

                        return
                end

                if not game.engine:in_game() then
                        return
                end

                local var_9_0 = entities.get_local_pawn()

                if not var_9_0 then
                        return
                end

                if var_9_0.is_null and var_9_0:is_null() then
                        return
                end

                local var_9_1 = var_9_0:get_abs_origin()
                local var_9_2, var_9_3 = slot_0_6_0(var_9_1)

                if not var_9_2 then
                        slot_0_4_0.target_player = nil
                        slot_0_4_0.is_following = false

                        return
                end

                local var_9_4 = var_9_2:get_abs_origin()

                if slot_0_7_0(var_9_1, var_9_4) then
                        slot_0_4_0.target_player = var_9_2
                        slot_0_4_0.is_following = true

                        slot_0_9_0(arg_9_0, var_9_1, var_9_4)
                else
                        slot_0_4_0.target_player = nil
                        slot_0_4_0.is_following = false
                end
        end)
        events.present_queue:add(function()
                local var_10_0 = draw.surface

                var_10_0.font = draw.fonts.gui_main

                local var_10_1 = 10
                local var_10_2 = 100
                local var_10_3 = 20

                var_10_0:add_text(draw.vec2(var_10_1, var_10_2), "Head Follow", draw.color(255, 255, 100, 255))

                local var_10_4 = var_10_2 + var_10_3
                local var_10_5 = slot_0_3_0()
                local var_10_6 = var_10_5 and "Enable: ✓" or "Enable: ✗"
                local var_10_7 = var_10_5 and draw.color(100, 255, 100, 255) or draw.color(255, 100, 100, 255)

                var_10_0:add_text(draw.vec2(var_10_1, var_10_4), var_10_6, var_10_7)

                local var_10_8 = var_10_4 + var_10_3
                local var_10_9 = slot_0_4_0.is_following and "Status: Following" or "Status: Waiting"
                local var_10_10 = slot_0_4_0.is_following and draw.color(100, 255, 100, 255) or draw.color(150, 150, 150, 255)

                var_10_0:add_text(draw.vec2(var_10_1, var_10_8), var_10_9, var_10_10)
        end)

        slot_0_4_0.event_registered = true
end

print("========================================")
print("Head Follow v1.0.0 Loaded")
print("Auto-follow when standing on player's head")
print("========================================")
