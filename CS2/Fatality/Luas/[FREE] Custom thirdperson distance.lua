--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

print("custom thirdperson loaded")

slot_0_0_0 = gui.slider(gui.control_id("custom_tp_distance"), 31, 180)
slot_0_1_0 = gui.ctx:find("lua>elements a")

if slot_0_1_0 then
        slot_0_1_0:add(gui.make_control("Thirdperson overrider", slot_0_0_0))
end

if slot_0_0_0.get_value then
        slot_0_0_0:get_value():set(150)
end

if slot_0_1_0.reset then
        slot_0_1_0:reset()
end

slot_0_2_0 = gui.ctx:find("visuals>misc>local>thirdperson>settings>distance") or gui.ctx:find("visuals > misc > local > thirdperson > settings > distance")

if slot_0_0_0 and slot_0_0_0.add_callback then
        slot_0_0_0:add_callback(function()
                local var_1_0 = slot_0_0_0:get_value():get()

                if slot_0_2_0 and slot_0_2_0.get_value then
                        slot_0_2_0:get_value():set(var_1_0)
                end
        end)
end
