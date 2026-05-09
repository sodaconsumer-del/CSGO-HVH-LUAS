--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = utils.find_export("user32.dll", "GetAsyncKeyState")
slot_0_1_0 = ffi.cast("int(__stdcall*)(int)", slot_0_0_0)

function slot_0_2_0(arg_1_0)
        local var_1_0 = slot_0_1_0(arg_1_0)

        return bit.band(var_1_0, 32768) ~= 0
end

slot_0_3_0 = ffi.cast("uint32_t (__stdcall*)()", utils.find_export("kernel32.dll", "GetTickCount"))
slot_0_4_0 = gui.ctx:find("lua>elements a")
slot_0_5_0 = gui.slider(gui.control_id("Lean Strength"), 0, 10, {
        "%.1f"
}, 0.1)
slot_0_6_0 = gui.make_control("Lean Strength", slot_0_5_0)

slot_0_4_0:add(slot_0_6_0)
slot_0_4_0:reset()

slot_0_7_0 = 0
slot_0_8_0 = slot_0_3_0()
slot_0_9_0 = 5

function slot_0_10_0()
        local var_2_0 = slot_0_3_0()
        local var_2_1 = (var_2_0 - slot_0_8_0) / 1000

        slot_0_8_0 = var_2_0

        local var_2_2 = math.abs(slot_0_5_0:get_value():get())
        local var_2_3 = 0
        local var_2_4 = slot_0_2_0(65)
        local var_2_5 = slot_0_2_0(68)

        if var_2_4 and var_2_5 then
                var_2_3 = 0
        elseif var_2_4 then
                var_2_3 = -var_2_2
        elseif var_2_5 then
                var_2_3 = var_2_2
        end

        local var_2_6 = 1 - math.exp(-slot_0_9_0 * var_2_1)

        slot_0_7_0 = slot_0_7_0 + (var_2_3 - slot_0_7_0) * var_2_6

        local var_2_7 = game.input:get_view_angles()

        game.input:set_view_angles(math.vec3(var_2_7.x, var_2_7.y, slot_0_7_0))
end

events.present_queue:add(slot_0_10_0)
