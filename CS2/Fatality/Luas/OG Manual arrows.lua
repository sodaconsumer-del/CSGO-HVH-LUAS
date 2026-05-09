--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = 9
slot_0_1_0 = 45
slot_0_2_0 = draw.color(0, 170, 255, 255)
slot_0_3_0 = draw.color(255, 255, 255, 110)

function slot_0_4_0()
        local var_1_0, var_1_1 = game.engine:get_screen_size()

        return var_1_0, var_1_1
end

function slot_0_5_0(arg_2_0)
        for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
                local var_2_0 = gui.ctx:find(iter_2_1)

                if var_2_0 ~= nil then
                        return var_2_0
                end
        end

        return nil
end

slot_0_6_0 = slot_0_5_0({
        "rage>anti-aim>angles>override left"
})
slot_0_7_0 = slot_0_5_0({
        "rage>anti-aim>angles>override right"
})
slot_0_8_0 = slot_0_5_0({
        "rage>anti-aim>angles>override back"
})

function slot_0_9_0(arg_3_0)
        if not arg_3_0 then
                return false
        end

        if arg_3_0.get_hotkey_state then
                return arg_3_0:get_hotkey_state()
        end

        if arg_3_0.get then
                return arg_3_0:get()
        end

        if arg_3_0.get_value then
                return arg_3_0:get_value()
        end

        return false
end

function slot_0_10_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
        draw.surface:add_triangle_filled(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
end

events.present_queue:add(function()
        if not game.engine:in_game() then
                return
        end

        local var_5_0 = entities.get_local_pawn()

        if not var_5_0 or not var_5_0:is_alive() then
                return
        end

        local var_5_1, var_5_2 = slot_0_4_0()
        local var_5_3 = var_5_1 * 0.5
        local var_5_4 = var_5_2 * 0.5
        local var_5_5 = math.min(var_5_1 / 1920, var_5_2 / 1080)
        local var_5_6 = math.max(1, math.floor(slot_0_0_0 * var_5_5 + 0.5))
        local var_5_7 = math.floor(slot_0_1_0 * var_5_5 + 0.5)
        local var_5_8 = slot_0_9_0(slot_0_6_0)
        local var_5_9 = slot_0_9_0(slot_0_7_0)
        local var_5_10 = slot_0_3_0
        local var_5_11 = slot_0_3_0
        local var_5_12 = slot_0_3_0

        if var_5_8 then
                var_5_10 = slot_0_2_0
        elseif var_5_9 then
                var_5_11 = slot_0_2_0
        else
                var_5_12 = slot_0_2_0
        end

        local var_5_13 = 1.9
        local var_5_14 = var_5_3 - var_5_7 - var_5_6 * var_5_13
        local var_5_15 = var_5_3 - var_5_7

        slot_0_10_0(draw.vec2(var_5_14, var_5_4), draw.vec2(var_5_15, var_5_4 - var_5_6), draw.vec2(var_5_15, var_5_4 + var_5_6), var_5_10)

        local var_5_16 = var_5_3 + var_5_7 + var_5_6 * var_5_13
        local var_5_17 = var_5_3 + var_5_7

        slot_0_10_0(draw.vec2(var_5_16, var_5_4), draw.vec2(var_5_17, var_5_4 - var_5_6), draw.vec2(var_5_17, var_5_4 + var_5_6), var_5_11)

        local var_5_18 = var_5_4 + var_5_7 + var_5_6 * var_5_13
        local var_5_19 = var_5_4 + var_5_7

        slot_0_10_0(draw.vec2(var_5_3, var_5_18), draw.vec2(var_5_3 - var_5_6, var_5_19), draw.vec2(var_5_3 + var_5_6, var_5_19), var_5_12)
end)
