--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function utils.error(arg_1_0)
        game.engine:client_cmd("play sounds/ui/panorama/lobby_error_01.wav")
        gui.notify:add(gui.notification("Fast Ladder", "Error: " .. arg_1_0))
end

function utils.success(arg_2_0)
        game.engine:client_cmd("play sounds/ui/beep07.vsnd_c")
        gui.notify:add(gui.notification("Fast Ladder", arg_2_0))
end

if ffi == nil then
        utils.error("You must turn on \"Allow insecure\" toggle to use this lua.")

        return
end

function slot_0_0_0(arg_3_0)
        local var_3_0 = entities.get_local_pawn()

        if var_3_0 == nil then
                return
        end

        if not var_3_0:is_alive() then
                return
        end

        local var_3_1 = ffi.cast("uint64_t*", var_3_0)[0]

        if var_3_1 == 0 then
                return
        end

        local var_3_2 = ffi.cast("char*", var_3_1 + 1094)[0]
        local var_3_3 = arg_3_0:get_viewangles()

        if var_3_2 ~= 9 then
                return
        end

        local var_3_4 = 89
        local var_3_5 = 1

        if arg_3_0:get_button(input_bit_mask.in_forward) then
                arg_3_0:set_forwardmove(-1)
        elseif arg_3_0:get_button(input_bit_mask.in_back) then
                arg_3_0:set_forwardmove(1)

                var_3_5 = -1
        else
                return
        end

        if var_3_3.y > 135 and var_3_3.y <= 180 then
                arg_3_0:set_viewangles(vector(var_3_4, 90, 0))
                arg_3_0:set_leftmove(1 * var_3_5)
        elseif var_3_3.y <= 135 and var_3_3.y >= 90 then
                arg_3_0:set_viewangles(vector(var_3_4, 179, 0))
                arg_3_0:set_leftmove(-1 * var_3_5)
        elseif var_3_3.y <= -135 and var_3_3.y >= -180 then
                arg_3_0:set_viewangles(vector(var_3_4, -90, 0))
                arg_3_0:set_leftmove(-1 * var_3_5)
        elseif var_3_3.y <= 90 and var_3_3.y >= 45 then
                arg_3_0:set_viewangles(vector(var_3_4, 0, 0))
                arg_3_0:set_leftmove(1 * var_3_5)
        elseif var_3_3.y >= -90 and var_3_3.y <= -45 then
                arg_3_0:set_viewangles(vector(var_3_4, 0, 0))
                arg_3_0:set_leftmove(-1 * var_3_5)
        elseif var_3_3.y <= -90 and var_3_3.y >= -135 then
                arg_3_0:set_viewangles(vector(var_3_4, -179, 0))
                arg_3_0:set_leftmove(1 * var_3_5)
        elseif var_3_3.y <= 45 and var_3_3.y > 0 then
                arg_3_0:set_viewangles(vector(var_3_4, 90, 0))
                arg_3_0:set_leftmove(-1 * var_3_5)
        elseif var_3_3.y <= 0 and var_3_3.y >= -45 then
                arg_3_0:set_viewangles(vector(var_3_4, -90, 0))
                arg_3_0:set_leftmove(1 * var_3_5)
        end
end

utils.success("Lua loaded successfully")
events.create_move:add(slot_0_0_0)
