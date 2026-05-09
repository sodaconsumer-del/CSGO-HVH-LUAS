--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("deathesp"))
slot_0_1_0 = gui.make_control("Enable ESP while dead", slot_0_0_0)
slot_0_2_0 = gui.checkbox(gui.control_id("deathname"))
slot_0_3_0 = gui.make_control("Enable Name", slot_0_2_0)
slot_0_4_0 = gui.checkbox(gui.control_id("deathhealth"))
slot_0_5_0 = gui.make_control("Enable Health", slot_0_4_0)
slot_0_6_0 = gui.checkbox(gui.control_id("deathskeleton"))
slot_0_7_0 = gui.make_control("Enable Skeleton", slot_0_6_0)
slot_0_8_0 = gui.checkbox(gui.control_id("deathbox"))
slot_0_9_0 = gui.make_control("Enable Box", slot_0_8_0)
slot_0_10_0 = gui.checkbox(gui.control_id("deathweaponname"))
slot_0_11_0 = gui.make_control("Enable Weapon Name", slot_0_10_0)
slot_0_12_0 = gui.checkbox(gui.control_id("deathweaponicon"))
slot_0_13_0 = gui.make_control("Enable Weapon Icon", slot_0_12_0)
slot_0_14_0 = gui.ctx:find("lua>elements a")

slot_0_14_0:add(slot_0_1_0)
slot_0_14_0:add(slot_0_3_0)
slot_0_14_0:add(slot_0_5_0)
slot_0_14_0:add(slot_0_7_0)
slot_0_14_0:add(slot_0_9_0)
slot_0_14_0:add(slot_0_11_0)
slot_0_14_0:add(slot_0_13_0)
slot_0_14_0:reset()

slot_0_15_0 = gui.ctx:find("visuals>enemy>esp>name")
slot_0_16_0 = gui.ctx:find("visuals>enemy>esp>health")
slot_0_17_0 = gui.ctx:find("visuals>enemy>esp>skeleton")
slot_0_18_0 = gui.ctx:find("visuals>enemy>esp>box")
slot_0_19_0 = gui.ctx:find("visuals>enemy>esp>weapon")
slot_0_20_0 = gui.ctx:find("visuals>enemy>esp>weapon icons")

function slot_0_21_0(arg_1_0)
        slot_0_15_0:get_value():set(arg_1_0 and slot_0_2_0:get_value():get())
        slot_0_16_0:get_value():set(arg_1_0 and slot_0_4_0:get_value():get())
        slot_0_17_0:get_value():set(arg_1_0 and slot_0_6_0:get_value():get())
        slot_0_18_0:get_value():set(arg_1_0 and slot_0_8_0:get_value():get())
        slot_0_19_0:get_value():set(arg_1_0 and slot_0_10_0:get_value():get())
        slot_0_20_0:get_value():set(arg_1_0 and slot_0_12_0:get_value():get())
end

function slot_0_22_0()
        if not slot_0_0_0:get_value():get() then
                return
        end

        local var_2_0 = entities.get_local_pawn()

        if not var_2_0 then
                return
        end

        if var_2_0:is_alive() then
                slot_0_21_0(false)
        else
                slot_0_21_0(true)
        end
end

events.present_queue:add(slot_0_22_0)
