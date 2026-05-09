--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if ffi == nil then
        return gui.notify:add(gui.notification("WARNING!", "TURN ON ALLOW INSECURE IN LUA AND RELOAD SCRIPT!", draw.textures.icon_close))
end

slot_0_0_0 = gui.checkbox(gui.control_id("enable_smoke_color_DB33997D-6963-4B60-A35E-8368EB3D44C1"))
slot_0_1_0 = gui.color_picker(gui.control_id("smoke_colorpicker_A9CF5E38-5FBA-4295-9D7D-6F305D565263"))
slot_0_2_0 = gui.make_control("Enable Smoke Color", slot_0_0_0)
slot_0_3_0 = gui.make_control("Custom Color", slot_0_1_0)
slot_0_4_0 = gui.ctx:find("lua>elements a")

slot_0_4_0:reset()
slot_0_4_0:add(slot_0_2_0)
slot_0_4_0:add(slot_0_3_0)

slot_0_6_0 = ffi.cast("uint64_t(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "GetModuleHandleA"))("client.dll")
slot_0_7_0 = {
        dwGameEntitySystem_highestEntityIndex = 8432,
        dwGameEntitySystem = 28553064,
        dwEntityList = 27358920
}

ffi.cdef("    typedef struct {\n        float x;\n        float y;\n        float z;\n    } Vector;\n\n    typedef struct {\n        float m_Value; //float32\n    } GameTime_t;\n")

if ffi.cast("int64_t(__stdcall*)()", utils.find_pattern("engine2.dll", "8B 05 ? ? ? ? C3 CC CC CC CC CC CC CC CC CC 48 8B 0D ? ? ? ?"))() ~= 14061 then
        return gui.notify:add(gui.notification("LUA Outdated!", "Wait until developer update this...", draw.textures.icon_close))
end

function slot_0_8_0(arg_1_0)
        local var_1_0 = ffi.cast("Vector*", arg_1_0 + 4636)[0]
        local var_1_1 = slot_0_1_0:get_value():get()

        var_1_0.x = var_1_1:get_r()
        var_1_0.y = var_1_1:get_g()
        var_1_0.z = var_1_1:get_b()
end

function slot_0_9_0()
        local var_2_0 = ffi.cast("uintptr_t*", slot_0_6_0 + slot_0_7_0.dwGameEntitySystem)[0]
        local var_2_1 = ffi.cast("int*", var_2_0 + slot_0_7_0.dwGameEntitySystem_highestEntityIndex)[0]
        local var_2_2 = ffi.cast("uintptr_t*", slot_0_6_0 + slot_0_7_0.dwEntityList)[0]

        for iter_2_0 = 65, var_2_1 do
                local var_2_3 = ffi.cast("uintptr_t*", var_2_2 + (8 * bit32.rshift(bit32.band(iter_2_0, 32767), 9) + 16))[0]

                if var_2_3 == 0 then
                        -- block empty
                else
                        local var_2_4 = ffi.cast("uintptr_t*", var_2_3 + 120 * bit32.band(iter_2_0, 511))[0]

                        if var_2_4 == 0 then
                                -- block empty
                        else
                                local var_2_5 = ffi.cast("uintptr_t*", var_2_4 + 16)[0]

                                if var_2_5 == 0 then
                                        -- block empty
                                else
                                        local var_2_6 = ffi.cast("uintptr_t*", var_2_5 + 32)[0]

                                        if var_2_6 == 0 then
                                                -- block empty
                                        elseif string.find(ffi.string(ffi.cast("char*", var_2_6)), "smokegrenade_projectile") then
                                                slot_0_8_0(var_2_4)
                                        end
                                end
                        end
                end
        end
end

if slot_0_0_0:get_value():get() then
        events.present_queue:add(slot_0_9_0)
else
        return
end
