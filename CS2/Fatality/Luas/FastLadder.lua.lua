--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.label(gui.control_id("fastladder_line_top"), "====================", draw.color(100, 100, 100, 255), true)
slot_0_1_0 = gui.checkbox(gui.control_id("fast_ladder_enable"))
slot_0_2_0 = gui.make_control("Fast Ladder", slot_0_1_0)
slot_0_3_0 = gui.label(gui.control_id("fastladder_line_bottom"), "====================", draw.color(100, 100, 100, 255), true)
slot_0_4_0 = gui.ctx:find("lua>elements a")

if slot_0_4_0 then
        slot_0_4_0:add(slot_0_0_0)
        slot_0_4_0:add(slot_0_2_0)
        slot_0_4_0:add(slot_0_3_0)
        slot_0_4_0:reset()
end

slot_0_1_0:set_value(false)

function slot_0_5_0(arg_1_0)
        if not slot_0_1_0:get_value():get() then
                return
        end

        local var_1_0 = entities.get_local_pawn()

        if var_1_0 == nil then
                return
        end

        local var_1_1 = var_1_0:get_abs_velocity()

        if math.sqrt(var_1_1.x * var_1_1.x + var_1_1.y * var_1_1.y) > 50 or var_1_1.z < 20 then
                return
        end

        if var_1_0.m_fFlags:get() ~= 65664 then
                return
        end

        if arg_1_0:get_forwardmove() <= 0 then
                return
        end

        local var_1_2 = arg_1_0:get_viewangles()

        var_1_2.x = var_1_2.x - 80
        var_1_2.y = var_1_2.y + 80

        arg_1_0:set_viewangles(vector(var_1_2.x, var_1_2.y, var_1_2.z))
        arg_1_0:set_leftmove(-1)
end

events.create_move:add(slot_0_5_0)
print("[FastLadder] Loaded!")
