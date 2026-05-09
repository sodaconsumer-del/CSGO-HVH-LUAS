--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

assert(ffi, "ffi is invalid, please allow insecure script")
ffi.cdef("    typedef struct {\n        float x, y, z;\n    } Vector;\n\n    typedef struct {\n        uint8_t r, g, b, a;\n    } Color;\n\n    typedef struct {\n        uint32_t dwSize;\n        uint32_t cntUsage;\n        uint32_t th32ThreadID;\n        uint32_t th32OwnerProcessID;\n        long tpBasePri;\n        long tpDeltaPri;\n        uint32_t dwFlags;\n    } CThread32Entry;\n    \n    typedef struct {\n        uint8_t nRefCount;\n    } CLocalteEspShutDownWrapper;\n")

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = {}
slot_0_3_0 = ffi.cast("void*", 0)
slot_0_4_0 = ffi.cast("void*", -1)
slot_0_5_0 = gui.ctx:find("lua>elements a")
slot_0_6_0 = gui.checkbox(gui.control_id("ESP NAME: ENABLED"))
slot_0_7_0 = gui.ctx:find("visuals>enemy>esp>name")
slot_0_8_0 = gui.color_picker(gui.control_id("ESP NAME: COLOR"), true)

slot_0_5_0:add(gui.make_control("[Localtion Name] Enabled", slot_0_6_0))
slot_0_5_0:add(gui.make_control("[Localtion Name] Color", slot_0_8_0))
slot_0_5_0:reset()

slot_0_9_0 = {
        pCollision = 832,
        vecMins = 64,
        vecMaxs = 76
}

function slot_0_10_0(arg_1_0)
        return arg_1_0 * math.pi / 180
end

function slot_0_11_0(arg_2_0, arg_2_1)
        return arg_2_0 * (type(arg_2_1) == "number" and vector(arg_2_1, arg_2_1, arg_2_1) or arg_2_1)
end

function slot_0_12_0(arg_3_0, arg_3_1, arg_3_2)
        assert(slot_0_9_0[arg_3_1], ("Localtion Esp Name error: %s schema field not found"):format(arg_3_1))

        return ffi.cast(("%s*"):format(arg_3_2), ffi.cast("uintptr_t", arg_3_0) + slot_0_9_0[arg_3_1])[0]
end

function slot_0_13_0(arg_4_0)
        local var_4_0 = vector(math.sin(slot_0_10_0(arg_4_0.x)), math.sin(slot_0_10_0(arg_4_0.y)), 0)
        local var_4_1 = vector(math.cos(slot_0_10_0(arg_4_0.x)), math.cos(slot_0_10_0(arg_4_0.y)), 0)

        return vector(var_4_1.x * var_4_1.y, var_4_1.x * var_4_0.y, -var_4_0.x)
end

function slot_0_14_0(arg_5_0)
        local var_5_0 = vector(math.sin(slot_0_10_0(arg_5_0.x)), math.sin(slot_0_10_0(arg_5_0.y)), math.sin(slot_0_10_0(arg_5_0.z)))
        local var_5_1 = vector(math.cos(slot_0_10_0(arg_5_0.x)), math.cos(slot_0_10_0(arg_5_0.y)), math.cos(slot_0_10_0(arg_5_0.z)))

        return vector(var_5_0.z * var_5_0.x * var_5_1.y * -1 + var_5_1.z * var_5_0.y, var_5_0.z * var_5_0.x * var_5_0.y * -1 + -1 * var_5_1.z * var_5_1.y, -1 * var_5_0.z * var_5_1.x)
end

function slot_0_15_0(arg_6_0)
        local var_6_0 = vector(math.sin(slot_0_10_0(arg_6_0.x)), math.sin(slot_0_10_0(arg_6_0.y)), math.sin(slot_0_10_0(arg_6_0.z)))
        local var_6_1 = vector(math.cos(slot_0_10_0(arg_6_0.x)), math.cos(slot_0_10_0(arg_6_0.y)), math.cos(slot_0_10_0(arg_6_0.z)))

        return vector(var_6_1.z * var_6_0.x * var_6_1.y + var_6_0.z * var_6_0.y, var_6_1.z * var_6_0.x * var_6_0.y + var_6_0.z * var_6_1.y * -1, var_6_1.z * var_6_1.x)
end

function slot_0_16_0(arg_7_0, arg_7_1, arg_7_2)
        local var_7_0 = ffi.cast("void*", utils.find_pattern(arg_7_0, arg_7_1))

        assert(var_7_0 ~= slot_0_3_0, ("[Localtion Esp Name] pattern of module: %s not found"):format(arg_7_0))

        if arg_7_2 then
                return ffi.cast(arg_7_2, var_7_0)
        end

        return var_7_0
end

function slot_0_17_0(arg_8_0, arg_8_1)
        local var_8_0 = ffi.cast("void*", utils.find_export(arg_8_0, "CreateInterface"))

        assert(var_8_0 ~= slot_0_3_0, ("[Localtion Esp Name] interface of module %s not found"):format(arg_8_0))

        local var_8_1 = ffi.cast("void*(__cdecl*)(const char*, void*)", var_8_0)(arg_8_1, nil)

        assert(var_8_1 ~= slot_0_3_0, ("[Localtion Esp Name] interface of module %s not found"):format(arg_8_0))

        return var_8_1
end

function slot_0_18_0(arg_9_0, arg_9_1, arg_9_2, ...)
        local var_9_0 = ffi.cast("void*", utils.find_export(arg_9_0:lower(), arg_9_1))

        if var_9_0 == slot_0_3_0 then
                return nil
        end

        return ffi.cast(arg_9_2, var_9_0)(...)
end

function slot_0_19_0(arg_10_0)
        if type(arg_10_0) == "cdata" then
                return arg_10_0
        elseif type(arg_10_0) == "userdata" then
                return ffi.cast("void**", arg_10_0)[0]
        end

        return false
end

function slot_0_20_0(arg_11_0, arg_11_1)
        local var_11_0 = {}

        entities.controllers:for_each(function(arg_12_0)
                local var_12_0 = arg_12_0.entity:get_pawn()

                if var_12_0 then
                        local var_12_1 = not arg_11_1 or var_12_0:is_alive()
                        local var_12_2 = not arg_11_0 or var_12_0:is_enemy()

                        if var_12_1 and var_12_2 then
                                table.insert(var_11_0, arg_12_0.entity)
                        end
                end
        end)

        return var_11_0
end

function slot_0_21_0(arg_13_0, arg_13_1, arg_13_2, ...)
        if arg_13_0 == slot_0_3_0 then
                return nil
        end

        local var_13_0 = ffi.cast("void***", arg_13_0)[0][arg_13_1]
        local var_13_1 = ("VFuncOf: %02X"):format(ffi.cast("uintptr_t", var_13_0))

        if not slot_0_1_0[var_13_1] then
                slot_0_1_0[var_13_1] = ffi.cast(arg_13_2, var_13_0)
        end

        return slot_0_1_0[var_13_1](arg_13_0, ...)
end

function slot_0_22_0(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
        assert(arg_14_0 ~= 491ULL and arg_14_0 ~= slot_0_3_0, "[Localtion Esp Name] try absolute invalid address")

        arg_14_0 = ffi.cast("uintptr_t", arg_14_0)
        arg_14_0 = arg_14_0 + (arg_14_1 or 1)
        arg_14_0 = arg_14_0 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_14_0)[0])
        arg_14_0 = arg_14_0 + (arg_14_2 or 0)

        if arg_14_4 then
                arg_14_0 = ffi.cast("uintptr_t*", arg_14_0)[0]
        end

        if arg_14_3 then
                return ffi.cast(arg_14_3, arg_14_0)
        end

        return arg_14_0
end

function slot_0_23_0(arg_15_0)
        local var_15_0 = slot_0_19_0(arg_15_0)

        if not var_15_0 or var_15_0 == slot_0_3_0 then
                return false
        end

        local var_15_1 = slot_0_12_0(var_15_0, "pCollision", "uintptr_t")

        if var_15_1 == 491ULL then
                return false
        end

        local var_15_2 = slot_0_12_0(var_15_1, "vecMins", "Vector")
        local var_15_3 = slot_0_12_0(var_15_1, "vecMaxs", "Vector")

        return {
                vecMins = vector(var_15_2.x, var_15_2.y, var_15_2.z),
                vecMaxs = vector(var_15_3.x, var_15_3.y, var_15_3.z)
        }
end

slot_0_24_0 = slot_0_22_0(slot_0_16_0("engine2.dll", "48 89 1D ? ? ? ? ? ? ? ? ? ? ? FF 15"), 3, 0)
slot_0_25_0 = setmetatable({
        pMaterialSystemUtils = slot_0_17_0("materialsystem2.dll", "MaterialUtils_001")
}, {
        __index = {
                Get = function(arg_16_0)
                        return arg_16_0.pMaterialSystemUtils
                end,
                IsValidate = function(arg_17_0)
                        return arg_17_0.pMaterialSystemUtils ~= slot_0_3_0
                end,
                DrawText = function(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
                        if not arg_18_0:IsValidate() then
                                return
                        end

                        local var_18_0 = ffi.new("Vector[1]", {
                                {
                                        arg_18_2.x,
                                        arg_18_2.y,
                                        0
                                }
                        })
                        local var_18_1 = ffi.new("Color", {
                                arg_18_3:get_r(),
                                arg_18_3:get_g(),
                                arg_18_3:get_b(),
                                arg_18_3:get_a()
                        })

                        return slot_0_21_0(arg_18_0:Get(), 28, "void(__thiscall*)(void*, void*, const char*, Vector*, Color, int, void*, int)", arg_18_1, arg_18_4, var_18_0, var_18_1, 0, slot_0_3_0, 0)
                end
        }
})

function slot_0_26_0(arg_19_0)
        slot_19_1_0 = slot_0_23_0(arg_19_0)

        if not slot_19_1_0 then
                return false
        end

        slot_19_2_0 = {}
        slot_19_3_0 = slot_19_1_0.vecMins
        slot_19_4_0 = slot_19_1_0.vecMaxs
        slot_19_5_0 = arg_19_0:get_abs_origin()
        slot_19_6_0 = vector(0, game.input:get_view_angles().y, 0)
        slot_19_7_0 = {
                Up = slot_0_15_0(slot_19_6_0),
                Right = slot_0_14_0(slot_19_6_0),
                Forward = slot_0_13_0(slot_19_6_0)
        }
        slot_19_8_0 = {
                slot_0_11_0(slot_19_7_0.Up, slot_19_4_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_4_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_4_0.x),
                slot_0_11_0(slot_19_7_0.Up, slot_19_3_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_4_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_4_0.x),
                slot_0_11_0(slot_19_7_0.Up, slot_19_4_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_3_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_4_0.x),
                slot_0_11_0(slot_19_7_0.Up, slot_19_4_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_4_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_3_0.x),
                slot_0_11_0(slot_19_7_0.Up, slot_19_3_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_4_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_3_0.x),
                slot_0_11_0(slot_19_7_0.Up, slot_19_3_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_3_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_4_0.x),
                slot_0_11_0(slot_19_7_0.Up, slot_19_4_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_3_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_3_0.x),
                slot_0_11_0(slot_19_7_0.Up, slot_19_3_0.z) + slot_0_11_0(slot_19_7_0.Forward, slot_19_3_0.y) + slot_0_11_0(slot_19_7_0.Right, slot_19_3_0.x)
        }

        for iter_19_0, iter_19_1 in pairs(slot_19_8_0) do
                slot_19_14_1 = math.world_to_screen(slot_19_5_0 + iter_19_1)

                if not slot_19_14_1 then
                        return false
                end

                slot_19_2_0[iter_19_0] = slot_19_14_1
        end

        slot_19_9_0 = {
                between = vector(0, 0, 0),
                pos1 = vector(math.huge, math.huge, math.huge),
                pos2 = vector(-math.huge, -math.huge, math.huge)
        }

        for iter_19_2, iter_19_3 in pairs(slot_19_2_0) do
                slot_19_9_0.pos1.x = math.min(slot_19_9_0.pos1.x, iter_19_3.x)
                slot_19_9_0.pos1.y = math.min(slot_19_9_0.pos1.y, iter_19_3.y)
                slot_19_9_0.pos2.x = math.max(slot_19_9_0.pos2.x, iter_19_3.x)
                slot_19_9_0.pos2.y = math.max(slot_19_9_0.pos2.y, iter_19_3.y)
        end

        slot_19_9_0.between = slot_19_9_0.pos2 - slot_19_9_0.pos1

        return slot_19_9_0
end

function slot_0_27_0(arg_20_0)
        local var_20_0 = slot_0_18_0("Kernel32.dll", "OpenThread", "void*(__cdecl*)(uint32_t, int, uint32_t)", 2, 0, arg_20_0)

        if var_20_0 == slot_0_3_0 or var_20_0 == slot_0_4_0 then
                return false
        end

        return setmetatable({
                bIsSuspended = false,
                bValid = true,
                nId = arg_20_0,
                hThread = var_20_0
        }, {
                __index = {
                        Suspend = function(arg_21_0)
                                if arg_21_0.bIsSuspended or not arg_21_0.bValid then
                                        return false
                                end

                                if slot_0_18_0("Kernel32.dll", "SuspendThread", "uint32_t(__cdecl*)(void*)", arg_21_0.hThread) ~= -1 then
                                        arg_21_0.bIsSuspended = true

                                        return true
                                end

                                return false
                        end,
                        Resume = function(arg_22_0)
                                if not arg_22_0.bIsSuspended or not arg_22_0.bValid then
                                        return false
                                end

                                if slot_0_18_0("Kernel32.dll", "ResumeThread", "uint32_t(__cdecl*)(void*)", arg_22_0.hThread) ~= -1 then
                                        arg_22_0.bIsSuspended = false

                                        return true
                                end

                                return false
                        end,
                        Close = function(arg_23_0)
                                if not arg_23_0.bValid then
                                        return
                                end

                                arg_23_0:Resume()

                                arg_23_0.bValid = false

                                slot_0_18_0("Kernel32.dll", "CloseHandle", "int(__cdecl*)(void*)", arg_23_0.hThread)
                        end
                }
        })
end

function slot_0_28_0()
        slot_0_2_0 = {}

        local var_24_0 = slot_0_18_0("Kernel32.dll", "CreateToolhelp32Snapshot", "void*(__cdecl*)(uint32_t, uint32_t)", 4, 0)

        if var_24_0 == slot_0_4_0 then
                return false
        end

        local var_24_1 = ffi.new("CThread32Entry[1]")

        var_24_1[0].dwSize = ffi.sizeof("CThread32Entry")

        if slot_0_18_0("Kernel32.dll", "Thread32First", "int(__cdecl*)(void*, CThread32Entry*)", var_24_0, var_24_1) == 0 then
                slot_0_18_0("Kernel32.dll", "CloseHandle", "int(__cdecl*)(void*)", var_24_0)

                return false
        end

        local var_24_2 = slot_0_18_0("Kernel32.dll", "GetCurrentThreadId", "uint32_t(__cdecl*)()")
        local var_24_3 = slot_0_18_0("Kernel32.dll", "GetCurrentProcessId", "uint32_t(__cdecl*)()")

        while slot_0_18_0("Kernel32.dll", "Thread32Next", "int(__cdecl*)(void*, CThread32Entry*)", var_24_0, var_24_1) > 0 do
                if var_24_1[0].dwSize >= 20 and var_24_1[0].th32OwnerProcessID == var_24_3 and var_24_1[0].th32ThreadID ~= var_24_2 then
                        local var_24_4 = slot_0_27_0(var_24_1[0].th32ThreadID)

                        if not var_24_4 then
                                for iter_24_0, iter_24_1 in pairs(slot_0_2_0) do
                                        iter_24_1:Close()
                                end

                                slot_0_2_0 = {}

                                slot_0_18_0("Kernel32.dll", "CloseHandle", "int(__cdecl*)(void*)", var_24_0)

                                return false
                        end

                        table.insert(slot_0_2_0, var_24_4)
                end
        end

        slot_0_18_0("Kernel32.dll", "CloseHandle", "int(__cdecl*)(void*)", var_24_0)

        return true
end

function slot_0_29_0()
        if not slot_0_28_0() then
                return false
        end

        for iter_25_0, iter_25_1 in pairs(slot_0_2_0) do
                iter_25_1:Suspend()
        end

        return true
end

function slot_0_30_0()
        for iter_26_0, iter_26_1 in pairs(slot_0_2_0) do
                iter_26_1:Resume()
                iter_26_1:Close()
        end
end

function slot_0_31_0(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
        assert(type(arg_27_1) == "function", "vtable hook error: invalid detour function")
        assert(type(arg_27_0) == "cdata" or type(arg_27_0) == "userdata", "vtable hook error: invalid target function")

        if not slot_0_29_0() then
                slot_0_30_0()
                print("vtable hook error: failed suspend threads")

                return false
        end

        local var_27_0 = ffi.sizeof("void*")
        local var_27_1 = ffi.cast("void***", arg_27_0)[0]

        if not var_27_1 or var_27_1 == ffi.NULL or var_27_1 == slot_0_3_0 then
                print("[vtable hook]: invalid vtable")

                return nil
        end

        local var_27_2 = {
                bAvailable = true,
                bAttach = false,
                nIndex = arg_27_2,
                pVtable = var_27_1,
                pOldProtect = ffi.new("uint32_t[1]"),
                pVtableBase = ffi.cast("uintptr_t", var_27_1),
                pCallBackDetourFn = ffi.cast(arg_27_3, arg_27_1),
                pTargetOriginalFn = ffi.cast(arg_27_3, var_27_1[arg_27_2])
        }

        var_27_2.__index = setmetatable(var_27_2, {
                __call = function(arg_28_0, ...)
                        if not arg_28_0.bAvailable or not arg_28_0.bAttach then
                                return nil
                        end

                        return arg_28_0.pTargetOriginalFn(...)
                end,
                __index = {
                        IsValid = function(arg_29_0)
                                return arg_29_0.bAvailable
                        end,
                        Attach = function(arg_30_0)
                                if not arg_30_0.bAttach and arg_30_0.bAvailable then
                                        arg_30_0.bAttach = true

                                        local var_30_0 = ffi.cast("void*", arg_30_0.pVtableBase + arg_27_2 * var_27_0)

                                        slot_0_18_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", var_30_0, var_27_0, 64, arg_30_0.pOldProtect)

                                        arg_30_0.pVtable[arg_27_2] = ffi.cast("void*", arg_30_0.pCallBackDetourFn)

                                        slot_0_18_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", var_30_0, var_27_0, arg_30_0.pOldProtect[0], arg_30_0.pOldProtect)

                                        return true
                                end

                                return false
                        end,
                        Detach = function(arg_31_0)
                                if arg_31_0.bAttach and arg_31_0.bAvailable then
                                        arg_31_0.bAttach = false

                                        local var_31_0 = ffi.cast("void*", arg_31_0.pVtableBase + arg_27_2 * var_27_0)

                                        slot_0_18_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", var_31_0, var_27_0, 64, arg_31_0.pOldProtect)

                                        arg_31_0.pVtable[arg_27_2] = ffi.cast("void*", arg_31_0.pTargetOriginalFn)

                                        slot_0_18_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", var_31_0, var_27_0, arg_31_0.pOldProtect[0], arg_31_0.pOldProtect)

                                        return true
                                end

                                return false
                        end,
                        Remove = function(arg_32_0)
                                if arg_32_0.bAvailable then
                                        arg_32_0:Detach()

                                        arg_32_0.bAvailable = false

                                        return true
                                end

                                return false
                        end
                }
        })

        var_27_2:Attach()
        table.insert(slot_0_0_0, var_27_2)
        slot_0_30_0()

        return var_27_2
end

function slot_0_32_0()
        for iter_33_0, iter_33_1 in pairs(slot_0_0_0) do
                iter_33_1:Remove()
        end

        slot_0_0_0 = {}
end

function slot_0_33_0(arg_34_0)
        if arg_34_0 == slot_0_3_0 or not game.engine:in_game() or not slot_0_6_0:get_value():get() then
                return
        end

        slot_0_7_0:get_value():set(false)

        local var_34_0 = slot_0_8_0:get_value():get()

        for iter_34_0, iter_34_1 in pairs(slot_0_20_0(true, true)) do
                local var_34_1 = iter_34_1:get_pawn()

                if not var_34_1 then
                        -- block empty
                else
                        local var_34_2 = slot_0_26_0(var_34_1)

                        if not var_34_2 then
                                -- block empty
                        else
                                local var_34_3 = iter_34_1.m_steamID:get()

                                if not var_34_3 then
                                        -- block empty
                                else
                                        local var_34_4 = var_34_3 <= 0
                                        local var_34_5 = ("%s%s"):format(var_34_4 and "人机:" or "", iter_34_1:get_name())
                                        local var_34_6 = draw.vec2(var_34_5:len() * 2.5, 10)

                                        slot_0_25_0:DrawText(arg_34_0, draw.vec2(var_34_2.pos1.x + var_34_2.between.x / 2 - var_34_6.x, var_34_2.pos1.y - var_34_6.y), var_34_0, var_34_5)
                                end
                        end
                end
        end
end

slot_0_34_0 = nil

function slot_0_35_0(arg_35_0, arg_35_1, arg_35_2)
        slot_0_33_0(arg_35_2)

        return slot_0_34_0(arg_35_0, arg_35_1, arg_35_2)
end

;(function()
        ffi.metatype("CLocalteEspShutDownWrapper", {
                __gc = function(arg_37_0)
                        slot_0_32_0()
                end
        })

        local var_36_0 = ffi.new("CLocalteEspShutDownWrapper")

        events.present_queue:add(function()
                var_36_0.nRefCount = 0
        end)

        slot_0_34_0 = slot_0_31_0(slot_0_24_0, slot_0_35_0, 0, "char*(__fastcall*)(void*, void*, void*)")
end)()
