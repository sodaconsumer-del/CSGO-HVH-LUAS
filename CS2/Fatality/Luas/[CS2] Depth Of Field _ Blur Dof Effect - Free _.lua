--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

ffi.cdef("    typedef struct {\n        float x, y, z, w;\n    } Vector4D;\n\n    typedef struct {\n        uint8_t nRefCount;\n    } MyUnloadWrapper_t;\n\n    typedef struct {\n        uintptr_t BaseAddress;\n        void* AllocationBase;\n        uint32_t AllocationProtect;\n        uint16_t PartitionId;\n        uint64_t RegionSize;\n        uint32_t State;\n        uint32_t Protect;\n        uint32_t Type;\n    } CMemoryBasicInformation;\n\n    typedef struct {\n        union {\n            uint32_t dwOemId;\n            struct {\n                uint16_t wProcessorArchitecture;\n                uint16_t wReserved;\n            };\n        };\n\n        uint32_t dwPageSize;\n        void* lpMinimumApplicationAddress;\n        uintptr_t lpMaximumApplicationAddress;\n        uint64_t dwActiveProcessorMask;\n        uint32_t dwNumberOfProcessors;\n        uint32_t dwProcessorType;\n        uint32_t dwAllocationGranularity;\n        uint16_t wProcessorLevel;\n        uint16_t wProcessorRevision;\n    } CSystemInfo;\n")

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = {}
slot_0_3_0 = {}
slot_0_4_0 = ffi.cast("void*", 0)
slot_0_5_0 = nil
slot_0_6_0 = gui.ctx:find("lua>elements b")
slot_0_7_0 = gui.checkbox(gui.control_id("DOF RANGES"))
slot_0_8_0 = gui.slider(gui.control_id("DOF: START"), 1, 5000, {
        "%.fx"
})
slot_0_9_0 = gui.slider(gui.control_id("DOF: END"), 1, 5000, {
        "%.fx"
})
slot_0_10_0 = gui.slider(gui.control_id("DOF: EDGE ANGLES"), 0, 180, {
        "%.fx"
})
slot_0_11_0 = gui.slider(gui.control_id("DOF: OUTLINE"), -100, 100, {
        "%.fx"
})

if slot_0_9_0:get_value():get() <= 0 then
        slot_0_9_0:get_value():set(1500)
        slot_0_9_0:reset()
end

if slot_0_8_0:get_value():get() <= 0 then
        slot_0_8_0:get_value():set(200)
        slot_0_8_0:reset()
end

slot_0_12_0 = gui.make_control("Dof Start", slot_0_8_0)
slot_0_13_0 = gui.make_control("Dof End", slot_0_9_0)
slot_0_14_0 = gui.make_control("Dof Angles", slot_0_10_0)
slot_0_15_0 = gui.make_control("Dof Nearest Shadow", slot_0_11_0)

slot_0_6_0:add(gui.make_control("Dof Ranges", slot_0_7_0))
slot_0_6_0:add(slot_0_12_0)
slot_0_6_0:add(slot_0_13_0)
slot_0_6_0:add(slot_0_14_0)
slot_0_6_0:add(slot_0_15_0)
slot_0_6_0:reset()

function slot_0_16_0(arg_1_0)
        table.insert(slot_0_3_0, arg_1_0)
end

function slot_0_17_0()
        slot_0_13_0:set_visible(slot_0_7_0:get_value():get())
        slot_0_12_0:set_visible(slot_0_7_0:get_value():get())
        slot_0_14_0:set_visible(slot_0_7_0:get_value():get())
        slot_0_15_0:set_visible(slot_0_7_0:get_value():get())
end

function slot_0_18_0(arg_3_0, arg_3_1)
        local var_3_0 = ffi.cast("void*", utils.find_pattern(arg_3_0, arg_3_1))

        if var_3_0 == slot_0_4_0 then
                assert(false, "Dof Ranges Error: outdated pattern")

                return nil
        end

        return var_3_0
end

function slot_0_19_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
        assert(arg_4_0 ~= slot_0_4_0, "error: is a invalid address")

        arg_4_0 = ffi.cast("uintptr_t", arg_4_0)
        arg_4_0 = arg_4_0 + (arg_4_1 or 1)
        arg_4_0 = arg_4_0 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_4_0)[0])
        arg_4_0 = arg_4_0 + (arg_4_2 or 0)

        if arg_4_3 then
                return ffi.cast("uintptr_t*", arg_4_0)[0]
        end

        return arg_4_0
end

function slot_0_20_0(arg_5_0, arg_5_1, arg_5_2)
        local var_5_0 = arg_5_0:lower()

        if not slot_0_0_0[var_5_0] then
                slot_0_0_0[var_5_0] = {}
        end

        if not slot_0_0_0[var_5_0][arg_5_1] or slot_0_0_0[var_5_0][arg_5_1] == slot_0_4_0 then
                slot_0_0_0[var_5_0][arg_5_1] = ffi.cast(arg_5_2, utils.find_export(var_5_0, arg_5_1))
        end

        if slot_0_0_0[var_5_0][arg_5_1] == slot_0_4_0 then
                assert(false, ("Dof Ranges Error: %s - %s not found export"):format(arg_5_0, arg_5_1))

                return nil
        end

        return slot_0_0_0[var_5_0][arg_5_1]
end

function slot_0_21_0(arg_6_0, arg_6_1, arg_6_2, ...)
        local var_6_0 = slot_0_20_0(arg_6_0:lower(), arg_6_1, arg_6_2)

        if not var_6_0 then
                return nil
        end

        return var_6_0(...)
end

function slot_0_22_0(arg_7_0, arg_7_1)
        local var_7_0 = slot_0_21_0("Kernel32.dll", "VirtualAlloc", "void*(__cdecl*)(void*, uint64_t, uint32_t, uint32_t)", arg_7_0, arg_7_1, bit.bor(4096, 8192), 64)

        table.insert(slot_0_1_0, var_7_0)

        return var_7_0
end

function slot_0_23_0(arg_8_0)
        if arg_8_0 == slot_0_4_0 then
                return
        end

        slot_0_21_0("Kernel32.dll", "VirtualFree", "int(__cdecl*)(void*, uint64_t, uint32_t)", arg_8_0, 0, 32768)
end

function slot_0_24_0(arg_9_0, arg_9_1)
        local var_9_0 = ffi.new("CSystemInfo")
        local var_9_1 = ffi.cast("uintptr_t", arg_9_0)
        local var_9_2 = ffi.new("CMemoryBasicInformation")

        slot_0_21_0("Kernel32.dll", "GetSystemInfo", "void(__stdcall*)(CSystemInfo*)", var_9_0)

        local var_9_3 = var_9_1 - var_9_1 % var_9_0.dwAllocationGranularity + var_9_0.dwAllocationGranularity
        local var_9_4 = var_9_0.lpMaximumApplicationAddress - arg_9_1

        while var_9_3 < var_9_4 do
                if slot_0_21_0("Kernel32.dll", "VirtualQuery", "int(__stdcall*)(const void*, CMemoryBasicInformation*, uint64_t)", ffi.cast("void*", var_9_3), var_9_2, ffi.sizeof("CMemoryBasicInformation")) <= 0 then
                        break
                end

                if var_9_2.State == 65536 then
                        return ffi.cast("void*", var_9_3)
                end

                var_9_3 = var_9_2.BaseAddress + var_9_2.RegionSize
                var_9_3 = var_9_3 + var_9_0.dwAllocationGranularity - 1
                var_9_3 = var_9_3 - var_9_3 % var_9_0.dwAllocationGranularity
        end

        return false
end

function slot_0_25_0(arg_10_0, arg_10_1, arg_10_2)
        local var_10_0 = slot_0_24_0(arg_10_0, arg_10_1)

        if not var_10_0 then
                return false
        end

        local var_10_1 = slot_0_22_0(var_10_0, arg_10_1)

        if var_10_1 == slot_0_4_0 then
                return false
        end

        return ffi.cast(arg_10_2, var_10_1)
end

function slot_0_26_0(arg_11_0, arg_11_1, arg_11_2)
        local var_11_0 = slot_0_25_0(arg_11_0, #arg_11_1, arg_11_2)

        if not var_11_0 then
                return false
        end

        local var_11_1 = ffi.new("uint8_t[?]", #arg_11_1, arg_11_1)

        ffi.copy(var_11_0, var_11_1, #arg_11_1)

        return var_11_0
end

function slot_0_27_0(arg_12_0, arg_12_1, arg_12_2)
        local var_12_0 = ffi.cast("uint8_t*", arg_12_0)
        local var_12_1 = slot_0_26_0(var_12_0, {
                72,
                184,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                255,
                224
        }, "uint8_t*")

        if not var_12_1 then
                return false
        end

        local var_12_2 = ffi.new("uint32_t[1]")
        local var_12_3 = ffi.new("uint8_t[5]")
        local var_12_4 = ffi.cast(arg_12_2, arg_12_1)
        local var_12_5 = ffi.new("uint8_t[5]", {
                233,
                0,
                0,
                0,
                0
        })
        local var_12_6 = setmetatable({
                bPrepared = false,
                bInstall = false,
                pCallBack = var_12_4,
                pOldProtect = var_12_2,
                arrJmpOpcode = var_12_5,
                pPatchTarget = var_12_0,
                arrBackupOpcode = var_12_3,
                pTrampoline = var_12_1,
                pOriginal = ffi.cast(arg_12_2, var_12_0)
        }, {
                __call = function(arg_13_0, ...)
                        arg_13_0:UnInstallHook()

                        local var_13_0 = arg_13_0.pOriginal(...)

                        arg_13_0:InstallHook()

                        return var_13_0
                end,
                __index = {
                        Prepare = function(arg_14_0)
                                if arg_14_0.bPrepared then
                                        return
                                end

                                arg_14_0.bPrepared = true
                                ffi.cast("void**", arg_14_0.pTrampoline + 2)[0] = arg_14_0.pCallBack

                                ffi.copy(arg_14_0.arrBackupOpcode, arg_14_0.pPatchTarget, ffi.sizeof(arg_14_0.arrBackupOpcode))

                                ffi.cast("uint32_t*", arg_14_0.arrJmpOpcode + 1)[0] = ffi.cast("uint32_t", ffi.cast("uint8_t*", arg_14_0.pTrampoline) - (arg_14_0.pPatchTarget + ffi.sizeof(arg_14_0.arrJmpOpcode)))
                        end,
                        InstallHook = function(arg_15_0)
                                if arg_15_0.bInstall then
                                        return
                                end

                                arg_15_0.bInstall = true

                                slot_0_21_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_15_0.pPatchTarget, ffi.sizeof(arg_15_0.arrJmpOpcode), 64, arg_15_0.pOldProtect)
                                ffi.copy(arg_15_0.pPatchTarget, arg_15_0.arrJmpOpcode, ffi.sizeof(arg_15_0.arrJmpOpcode))
                                slot_0_21_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_15_0.pPatchTarget, ffi.sizeof(arg_15_0.arrJmpOpcode), arg_15_0.pOldProtect[0], arg_15_0.pOldProtect)
                        end,
                        UnInstallHook = function(arg_16_0)
                                if not arg_16_0.bInstall then
                                        return
                                end

                                arg_16_0.bInstall = false

                                slot_0_21_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_16_0.pPatchTarget, ffi.sizeof(arg_16_0.arrBackupOpcode), 64, arg_16_0.pOldProtect)
                                ffi.copy(arg_16_0.pPatchTarget, arg_16_0.arrBackupOpcode, ffi.sizeof(arg_16_0.arrBackupOpcode))
                                slot_0_21_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_16_0.pPatchTarget, ffi.sizeof(arg_16_0.arrBackupOpcode), arg_16_0.pOldProtect[0], arg_16_0.pOldProtect)
                        end
                }
        })

        var_12_6:Prepare()
        var_12_6:InstallHook()
        table.insert(slot_0_2_0, var_12_6)

        return var_12_6
end

ffi.metatype("MyUnloadWrapper_t", {
        __gc = function(arg_17_0)
                for iter_17_0, iter_17_1 in pairs(slot_0_3_0) do
                        xpcall(iter_17_1, print)
                end
        end
})

slot_0_28_0 = ffi.new("MyUnloadWrapper_t")

function slot_0_29_0(arg_18_0)
        return tonumber(ffi.cast("uint32_t", arg_18_0))
end

slot_0_30_0 = ffi.cast("uint64_t(__fastcall*)(const char*, uint32_t)", slot_0_19_0(slot_0_18_0("client.dll", "E8 ? ? ? ? 8B D0 48 8D 0D ? ? ? ? E8 ? ? ? ? ? ? ? ? 69 C8"), 1, 0))
slot_0_31_0 = slot_0_19_0(slot_0_18_0("engine2.dll", "E8 ? ? ? ? BA ? ? ? ? 48 8D 0D ? ? ? ? E8 ? ? ? ? 48 85 C0 75 ? 48 8B 05 ? ? ? ? 48 8B 40 ? 33 FF 48 8D 0D"), 1, 0)
slot_0_32_0 = slot_0_30_0("DofRanges", 826366255)
slot_0_33_0 = bit.bxor(slot_0_29_0(6616326153743368677ULL * bit.bxor(slot_0_32_0, 115)), bit.rshift(slot_0_29_0(6616326153743368677ULL * bit.bxor(slot_0_32_0, 115)), 13))
slot_0_34_0 = slot_0_29_0(bit.bxor(slot_0_29_0(6616326153743368677ULL * slot_0_33_0), bit.rshift(slot_0_29_0(6616326153743368677ULL * slot_0_33_0), 15)))
slot_0_35_0 = slot_0_30_0("DofTiltToGround", 826366249)
slot_0_36_0 = slot_0_29_0(6616326153743368677ULL * slot_0_29_0(bit.bxor(slot_0_29_0(6616326153743368677ULL * bit.bxor(slot_0_29_0(6616326153743368677ULL * slot_0_35_0), 79678622)), slot_0_29_0(bit.rshift(slot_0_29_0(6616326153743368677ULL * bit.bxor(slot_0_29_0(6616326153743368677ULL * slot_0_35_0), 79678622)), 13)))))
slot_0_37_0 = slot_0_29_0(bit.bxor(slot_0_36_0, bit.rshift(slot_0_36_0, 15)))

function slot_0_38_0(arg_19_0)
        if not slot_0_7_0:get_value():get() then
                return
        end

        local var_19_0 = ffi.new("Vector4D", {
                0,
                slot_0_8_0:get_value():get(),
                slot_0_11_0:get_value():get(),
                slot_0_9_0:get_value():get()
        })
        local var_19_1 = ffi.new("Vector4D", {
                slot_0_10_0:get_value():get(),
                0,
                0,
                0
        })

        slot_0_5_0(arg_19_0, slot_0_34_0, var_19_0)
        slot_0_5_0(arg_19_0, slot_0_37_0, var_19_1)
end

function slot_0_39_0(arg_20_0, arg_20_1, arg_20_2)
        xpcall(slot_0_38_0, print, arg_20_0)
        slot_0_5_0(arg_20_0, arg_20_1, arg_20_2)
end

function slot_0_40_0()
        for iter_21_0, iter_21_1 in pairs(slot_0_1_0) do
                slot_0_23_0(iter_21_1)
        end

        for iter_21_2, iter_21_3 in pairs(slot_0_2_0) do
                iter_21_3:UnInstallHook()
        end
end

slot_0_17_0()
slot_0_16_0(slot_0_40_0)
slot_0_7_0:add_callback(slot_0_17_0)
events.present_queue:add(function()
        slot_0_28_0.nRefCount = 0
end)

slot_0_5_0 = slot_0_27_0(slot_0_31_0, slot_0_39_0, "void(__fastcall*)(void*, uint32_t, Vector4D*)")
