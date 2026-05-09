--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements a")
slot_0_1_0 = gui.checkbox(gui.control_id("AIR DUCK"))
slot_0_2_0 = gui.combo_box(gui.control_id("AIR DUCK: MODE"))

slot_0_2_0:add(gui.selectable(gui.control_id("AIR DUCK: DEFAULT"), "Default"))
slot_0_2_0:add(gui.selectable(gui.control_id("AIR DUCK: WAIT"), "Lock Jump Until Ducked"))

slot_0_3_0 = gui.make_control("Air Duck Mode", slot_0_2_0)

slot_0_0_0:add(gui.make_control("Air Duck", slot_0_1_0))
slot_0_0_0:add(slot_0_3_0)
slot_0_0_0:reset()

function slot_0_4_0()
        slot_0_3_0:set_visible(slot_0_1_0:get_value():get())
end

function slot_0_5_0(arg_2_0)
        if not slot_0_1_0:get_value():get() then
                return
        end

        local var_2_0 = entities.get_local_pawn()

        if not var_2_0 then
                return
        end

        local var_2_1 = var_2_0.m_fFlags:get()
        local var_2_2 = slot_0_2_0:get_value():get():get_raw()
        local var_2_3 = bit.band(var_2_1, bit.lshift(1, 0)) > 0

        if arg_2_0:get_button(input_bit_mask.in_jump) then
                if bit.band(var_2_2, bit.lshift(1, 0)) > 0 then
                        if not var_2_3 then
                                arg_2_0:set_button(input_bit_mask.in_duck)
                        end
                else
                        local var_2_4 = var_2_0.m_pMovementServices:get()

                        if var_2_3 and var_2_4 and var_2_4.m_flDuckAmount:get() < 0.4 then
                                arg_2_0:set_button(input_bit_mask.in_duck)
                                arg_2_0:remove_button(input_bit_mask.in_jump)
                        end
                end
        end
end

slot_0_4_0()
slot_0_1_0:add_callback(slot_0_4_0)
events.create_move:add(slot_0_5_0)
