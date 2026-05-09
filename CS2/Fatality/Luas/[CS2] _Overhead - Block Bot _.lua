--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi or not ws.test_capability("ffi") then
        game.engine:client_cmd("showconsole")
        gui.notify:add(gui.notification("[Block Bot]", "Error: make sure \"allow insecure is open\""))
        assert(ffi, "block bot error: ffi is invalid, please open \"allow insecure\"")
end

ffi.cdef("    typedef struct {\n        float x, y, z;\n    } Vector;\n\n    typedef struct {\n        char pad_0x0[0x8];\n        const char* szName;\n        char pad_0x10[0x60];\n    } CSchemaClassInfoData;\n")

slot_0_0_0 = {}
slot_0_1_0 = 0.015625
slot_0_2_0 = ffi.cast("void*", 0)
slot_0_3_0 = 4294967295
slot_0_4_0 = gui.ctx:find("lua>elements b")
slot_0_5_0 = gui.checkbox(gui.control_id("OVERHEAD BLOCKBOT"))

slot_0_4_0:add(gui.make_control("[Overhead] Block Bot", slot_0_5_0))
slot_0_4_0:reset()

slot_0_6_0 = {
        hGroundEntity = 1328,
        vecOrigin = 136,
        vecVelocity = 1072,
        pGameSceneNode = 816
}

function slot_0_7_0(arg_1_0, arg_1_1, arg_1_2)
        assert(slot_0_6_0[arg_1_1], ("block bot error: %s schema field not found"):format(arg_1_1))

        return ffi.cast(("%s*"):format(arg_1_2), ffi.cast("uintptr_t", arg_1_0) + slot_0_6_0[arg_1_1])[0]
end

function slot_0_8_0(arg_2_0, arg_2_1)
        local var_2_0 = ffi.cast("void*", utils.find_export(arg_2_0, "CreateInterface"))

        assert(var_2_0 ~= slot_0_2_0, ("[Block Bot] interface of module %s not found"):format(arg_2_0))

        local var_2_1 = ffi.cast("void*(__fastcall*)(const char*, void*)", var_2_0)(arg_2_1, nil)

        assert(var_2_1 ~= slot_0_2_0, ("[Block Bot] interface of module %s not found"):format(arg_2_0))

        return var_2_1
end

function slot_0_9_0(arg_3_0, arg_3_1, arg_3_2)
        local var_3_0 = ffi.cast("uintptr_t", utils.find_pattern(arg_3_0, arg_3_1))

        assert(var_3_0 ~= 556ULL, "block bot error: outdated pattern")

        return ffi.cast(arg_3_2 or "void*", var_3_0)
end

slot_0_10_0 = (function()
        local var_4_0 = slot_0_8_0("engine2.dll", "GameResourceServiceClientV001")
        local var_4_1 = ffi.cast("void**", ffi.cast("uintptr_t", var_4_0) + 88)
        local var_4_2 = slot_0_9_0("client.dll", "4C 8D 49 10 81 FA FE 7F", "void*(__fastcall*)(void*, int)")

        return function(arg_5_0)
                return var_4_2(var_4_1[0], arg_5_0)
        end
end)()

function slot_0_11_0(arg_6_0)
        if type(arg_6_0) == "cdata" then
                return arg_6_0
        elseif type(arg_6_0) == "userdata" then
                return ffi.cast("void**", arg_6_0)[0]
        end

        return false
end

function slot_0_12_0(arg_7_0, arg_7_1, arg_7_2, ...)
        if arg_7_0 == slot_0_2_0 then
                return nil
        end

        local var_7_0 = ffi.cast("void***", arg_7_0)[0][arg_7_1]
        local var_7_1 = ("VFuncOf: %02X"):format(ffi.cast("uintptr_t", var_7_0))

        if not slot_0_0_0[var_7_1] then
                slot_0_0_0[var_7_1] = ffi.cast(arg_7_2, var_7_0)
        end

        return slot_0_0_0[var_7_1](arg_7_0, ...)
end

function slot_0_13_0(arg_8_0)
        local var_8_0 = ffi.new("CSchemaClassInfoData*[1]")

        slot_0_12_0(arg_8_0, 42, "void(__thiscall*)(void*, CSchemaClassInfoData**)", var_8_0)

        if var_8_0[0] == slot_0_2_0 or var_8_0[0].szName == slot_0_2_0 or var_8_0[0].szName[0] == 0 then
                return false
        end

        return ffi.string(var_8_0[0].szName)
end

function slot_0_14_0(arg_9_0)
        if not slot_0_5_0:get_value():get() then
                return
        end

        local var_9_0 = entities.get_local_pawn()

        if not var_9_0 or not var_9_0:is_alive() then
                return
        end

        local var_9_1 = slot_0_11_0(var_9_0)

        if not var_9_1 then
                return
        end

        local var_9_2 = slot_0_7_0(var_9_1, "hGroundEntity", "uint32_t")

        if var_9_2 == slot_0_3_0 then
                return
        end

        local var_9_3 = slot_0_10_0(bit.band(var_9_2, 32767))

        if not var_9_3 or var_9_3 == slot_0_2_0 then
                return
        end

        local var_9_4 = slot_0_7_0(var_9_1, "pGameSceneNode", "void*")
        local var_9_5 = slot_0_7_0(var_9_3, "pGameSceneNode", "void*")

        if var_9_4 == slot_0_2_0 or var_9_5 == slot_0_2_0 then
                return
        end

        local var_9_6 = slot_0_13_0(var_9_3)

        if not var_9_6 or var_9_6 ~= "C_CSPlayerPawn" then
                return
        end

        local var_9_7 = arg_9_0:get_button(input_bit_mask.in_duck)
        local var_9_8 = slot_0_7_0(var_9_1, "vecVelocity", "Vector")
        local var_9_9 = slot_0_7_0(var_9_4, "vecOrigin", "Vector")
        local var_9_10 = slot_0_7_0(var_9_3, "vecVelocity", "Vector")
        local var_9_11 = slot_0_7_0(var_9_5, "vecOrigin", "Vector")
        local var_9_12 = vector(var_9_9.x + var_9_8.x * slot_0_1_0 * 2, var_9_9.y + var_9_8.y * slot_0_1_0 * 2, var_9_9.z + var_9_8.z * slot_0_1_0 * 2)
        local var_9_13 = vector(var_9_11.x + var_9_10.x * slot_0_1_0 * 2, var_9_11.y + var_9_10.y * slot_0_1_0 * 2, var_9_11.z + var_9_10.z * slot_0_1_0 * 2)
        local var_9_14 = (var_9_12 - var_9_13):length_2d()

        if math.abs(var_9_14) > (var_9_7 and 0.15 or 0.75) then
                arg_9_0:set_leftmove(0)
                arg_9_0:set_forwardmove(1)

                local var_9_15 = math.calc_angle(var_9_12, var_9_13)

                arg_9_0:rotate_movement(var_9_15.y)
        end
end

events.create_move:add(slot_0_14_0)
