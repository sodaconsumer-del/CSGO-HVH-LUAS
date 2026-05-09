--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi then
        game.engine:client_cmd("showconsole")
        gui.notify:add(gui.notification("Particle Modulate", "Error: make sure \"allow insecure is open\""))
        assert(ffi, "Particle Modulate: ffi is invalid, please open \"allow insecure\"")
end

ffi.cdef("    typedef struct {\n        uint8_t nRefCount;\n    } MyUnloadWrapper_t;\n\n    typedef struct {\n        float flColorR;\n        float flColorG;\n        float flColorB;\n        uint8_t nDefaultR, nDefaultG, nDefaultB, nDefaultA;\n        int nDataSize;\n        const char** pDataArray;\n        void* pStringCmp;\n        void* pOriginalFn;\n    } CParticleModulateContext;\n    \n    typedef struct {\n        uintptr_t BaseAddress;\n        void* AllocationBase;\n        uint32_t AllocationProtect;\n        uint16_t PartitionId;\n        uint64_t RegionSize;\n        uint32_t State;\n        uint32_t Protect;\n        uint32_t Type;\n    } CMemoryBasicInformation;\n\n    typedef struct {\n        union {\n            uint32_t dwOemId;\n            struct {\n                uint16_t wProcessorArchitecture;\n                uint16_t wReserved;\n            };\n        };\n\n        uint32_t dwPageSize;\n        uintptr_t lpMinimumApplicationAddress;\n        uintptr_t lpMaximumApplicationAddress;\n        uint64_t dwActiveProcessorMask;\n        uint32_t dwNumberOfProcessors;\n        uint32_t dwProcessorType;\n        uint32_t dwAllocationGranularity;\n        uint16_t wProcessorLevel;\n        uint16_t wProcessorRevision;\n    } CSystemInfo;\n    \n    typedef struct {\n        int nSize;\n        int nCapacity;\n        const char** arrData;\n    } CParticleModulateStack;\n")

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = {}
slot_0_3_0 = {}
slot_0_4_0 = ffi.cast("void*", 0)
slot_0_5_0 = gui.ctx:find("lua>elements b")
slot_0_6_0 = gui.checkbox(gui.control_id("PARTICLE MODULATE"))
slot_0_7_0 = gui.combo_box(gui.control_id("PARTICLE: ITEMS"))
slot_0_8_0 = gui.color_picker(gui.control_id("PARTICLE MODULATE COLOR"), true)

if slot_0_8_0:get_value():get():rgba() == 0 then
        slot_0_8_0:get_value():set(draw.color(0, 255, 255, 255))
        slot_0_8_0:reset()
end

slot_0_7_0:add(gui.selectable(gui.control_id("MOD: All"), "All"))
slot_0_7_0:add(gui.selectable(gui.control_id("MOD: BOLLDS"), "Bloods"))
slot_0_7_0:add(gui.selectable(gui.control_id("MOD: DECALS"), "Decals"))
slot_0_7_0:add(gui.selectable(gui.control_id("MOD: GRENADE"), "Grenade"))
slot_0_7_0:add(gui.selectable(gui.control_id("MOD: MOLOTOV"), "Molotov"))
slot_0_7_0:add(gui.selectable(gui.control_id("MOD: BULLET TRACER"), "Bullet Tracer"))

slot_0_7_0.allow_multiple = true
slot_0_9_0 = gui.make_control("Modulate Particle List", slot_0_7_0)
slot_0_10_0 = gui.make_control("Particles Modulate Color", slot_0_8_0)

slot_0_5_0:add(gui.make_control("Particle Modulate", slot_0_6_0))
slot_0_5_0:add(slot_0_9_0)
slot_0_5_0:add(slot_0_10_0)
slot_0_5_0:reset()
ffi.metatype("MyUnloadWrapper_t", {
        __gc = function(arg_1_0)
                for iter_1_0, iter_1_1 in pairs(slot_0_3_0) do
                        xpcall(iter_1_1, print)
                end
        end
})
ffi.metatype("CParticleModulateStack", {
        __gc = function(arg_2_0)
                arg_2_0:Purge()
        end,
        __index = {
                Size = function(arg_3_0)
                        return arg_3_0.nSize
                end,
                Clear = function(arg_4_0)
                        arg_4_0:Purge()
                end,
                Data = function(arg_5_0)
                        return arg_5_0.arrData
                end,
                Capacity = function(arg_6_0)
                        return arg_6_0.nCapacity
                end,
                Empty = function(arg_7_0)
                        return arg_7_0.nSize <= 0
                end,
                At = function(arg_8_0, arg_8_1)
                        if arg_8_1 >= arg_8_0.nSize then
                                return nil
                        end

                        return arg_8_0.arrData[arg_8_1]
                end,
                Contain = function(arg_9_0, arg_9_1)
                        if arg_9_0.nSize <= 0 or arg_9_0.arrData == slot_0_4_0 then
                                return false
                        end

                        for iter_9_0 = 0, arg_9_0.nSize - 1 do
                                if ffi.string(arg_9_0:At(iter_9_0)) == arg_9_1 then
                                        return true
                                end
                        end

                        return false
                end,
                Allocate = function(arg_10_0, arg_10_1)
                        if arg_10_1 <= 0 then
                                return slot_0_4_0
                        end

                        return (ffi.new(("const char*[%d]"):format(arg_10_1)))
                end,
                Reserve = function(arg_11_0, arg_11_1)
                        if arg_11_1 <= arg_11_0.nCapacity then
                                return false
                        end

                        local var_11_0 = arg_11_0:Allocate(arg_11_1)

                        if var_11_0 == slot_0_4_0 then
                                return false
                        end

                        if arg_11_0.arrData ~= slot_0_4_0 then
                                ffi.copy(var_11_0, arg_11_0.arrData, arg_11_0.nSize * ffi.sizeof("const char*"))
                        end

                        arg_11_0.nCapacity = arg_11_1
                        arg_11_0.arrData = var_11_0

                        return true
                end,
                Push = function(arg_12_0, arg_12_1)
                        if not arg_12_1 then
                                return false
                        end

                        if arg_12_0.arrData == slot_0_4_0 then
                                local var_12_0 = arg_12_0.nSize <= 0 and 1 or arg_12_0.nSize * 2

                                if not arg_12_0:Reserve(var_12_0) then
                                        return false
                                end
                        end

                        if arg_12_0.nSize >= arg_12_0.nCapacity then
                                arg_12_0:Reserve(arg_12_0.nSize * 2)
                        end

                        local var_12_1 = arg_12_0.nSize

                        arg_12_0.arrData[var_12_1] = arg_12_1
                        arg_12_0.nSize = arg_12_0.nSize + 1
                end,
                Pop = function(arg_13_0, arg_13_1)
                        if not arg_13_1 or arg_13_0.arrData == slot_0_4_0 or arg_13_0.nSize <= 0 then
                                return false
                        end

                        local var_13_0 = -1

                        for iter_13_0 = 0, arg_13_0.nSize - 1 do
                                if ffi.string(arg_13_0:At(iter_13_0)) == arg_13_1 then
                                        var_13_0 = iter_13_0

                                        break
                                end
                        end

                        if var_13_0 < 0 then
                                return false
                        end

                        local var_13_1 = arg_13_0.nSize - var_13_0 - 1

                        if var_13_0 == arg_13_0.nSize - 1 then
                                arg_13_0.nSize = arg_13_0.nSize - 1
                                arg_13_0.arrData[arg_13_0.nSize] = slot_0_4_0

                                return true
                        end

                        if arg_13_0.nCapacity > arg_13_0.nSize then
                                local var_13_2 = arg_13_0:Allocate(var_13_1)

                                ffi.copy(var_13_2, arg_13_0.arrData + var_13_0 + 1, var_13_1 * ffi.sizeof("const char*"))
                                ffi.copy(arg_13_0.arrData + var_13_0, var_13_2, var_13_1 * ffi.sizeof("const char*"))

                                arg_13_0.nSize = arg_13_0.nSize - 1
                        else
                                local var_13_3 = arg_13_0:Allocate((arg_13_0.nSize - 1) * 2)

                                ffi.copy(var_13_3, arg_13_0.arrData, var_13_0 * ffi.sizeof("const char*"))
                                ffi.copy(var_13_3, arg_13_0.arrData + var_13_0 + 1, var_13_1 * ffi.sizeof("const char*"))

                                arg_13_0.nSize = arg_13_0.nSize - 1
                                arg_13_0.nCapacity = arg_13_0.nSize * 2
                                arg_13_0.arrData = var_13_3
                        end

                        return true
                end,
                Purge = function(arg_14_0)
                        arg_14_0.nSize = 0
                        arg_14_0.nCapacity = 0
                        arg_14_0.arrData = slot_0_4_0
                end,
                Dump = function(arg_15_0)
                        if arg_15_0.nSize <= 0 or arg_15_0.arrData == slot_0_4_0 then
                                return
                        end

                        for iter_15_0 = 0, arg_15_0.nSize - 1 do
                                local var_15_0 = ffi.string(arg_15_0:At(iter_15_0))

                                print(("Position: %d -> %s"):format(iter_15_0, var_15_0))
                        end
                end
        }
})

function slot_0_11_0(arg_16_0)
        table.insert(slot_0_3_0, arg_16_0)
end

function slot_0_12_0(arg_17_0, arg_17_1)
        return bit.band(arg_17_0, bit.lshift(1, arg_17_1 - 1)) > 0
end

function slot_0_13_0(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
        assert(arg_18_0 ~= slot_0_4_0, "error: is a invalid address")

        arg_18_0 = ffi.cast("intptr_t", arg_18_0)
        arg_18_0 = arg_18_0 + (arg_18_1 or 1)
        arg_18_0 = arg_18_0 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_18_0)[0])
        arg_18_0 = arg_18_0 + (arg_18_2 or 0)

        if arg_18_3 then
                return ffi.cast("intptr_t*", arg_18_0)[0]
        end

        return arg_18_0
end

function slot_0_14_0(arg_19_0, arg_19_1, arg_19_2)
        local var_19_0 = ffi.cast("intptr_t", arg_19_0)
        local var_19_1 = ffi.cast("intptr_t", arg_19_1) - (var_19_0 + arg_19_2 + ffi.sizeof("int"))

        ffi.cast("int*", var_19_0 + arg_19_2)[0] = var_19_1
end

function slot_0_15_0(arg_20_0, arg_20_1)
        local var_20_0 = ffi.cast("void*", utils.find_pattern(arg_20_0, arg_20_1))

        if var_20_0 == slot_0_4_0 then
                assert(false, "Particle Modulate Error: outdated pattern")

                return nil
        end

        return var_20_0
end

function slot_0_16_0(arg_21_0, arg_21_1, arg_21_2)
        local var_21_0 = arg_21_0:lower()

        if not slot_0_0_0[var_21_0] then
                slot_0_0_0[var_21_0] = {}
        end

        if not slot_0_0_0[var_21_0][arg_21_1] or slot_0_0_0[var_21_0][arg_21_1] == slot_0_4_0 then
                slot_0_0_0[var_21_0][arg_21_1] = ffi.cast(arg_21_2, utils.find_export(var_21_0, arg_21_1))
        end

        if slot_0_0_0[var_21_0][arg_21_1] == slot_0_4_0 then
                assert(false, ("Particle Modulate Error: %s - %s not found export"):format(arg_21_0, arg_21_1))

                return nil
        end

        return slot_0_0_0[var_21_0][arg_21_1]
end

function slot_0_17_0(arg_22_0, arg_22_1, arg_22_2, ...)
        local var_22_0 = slot_0_16_0(arg_22_0:lower(), arg_22_1, arg_22_2)

        if not var_22_0 then
                return nil
        end

        return var_22_0(...)
end

function slot_0_18_0()
        slot_0_9_0:set_visible(slot_0_6_0:get_value():get())
        slot_0_10_0:set_visible(slot_0_6_0:get_value():get() and slot_0_7_0:get_value():get():get_raw() > 0)
end

function slot_0_19_0(arg_24_0)
        local var_24_0 = ffi.new("CSystemInfo")
        local var_24_1 = ffi.cast("uintptr_t", arg_24_0)
        local var_24_2 = ffi.new("CMemoryBasicInformation")

        slot_0_17_0("Kernel32.dll", "GetSystemInfo", "void(__stdcall*)(CSystemInfo*)", var_24_0)

        local var_24_3 = var_24_1 - var_24_1 % var_24_0.dwAllocationGranularity + var_24_0.dwAllocationGranularity
        local var_24_4 = var_24_0.lpMaximumApplicationAddress

        while var_24_3 < var_24_4 do
                if slot_0_17_0("Kernel32.dll", "VirtualQuery", "int(__stdcall*)(const void*, CMemoryBasicInformation*, uint64_t)", ffi.cast("void*", var_24_3), var_24_2, ffi.sizeof("CMemoryBasicInformation")) <= 0 then
                        break
                end

                if var_24_2.State == 65536 then
                        return ffi.cast("void*", var_24_3)
                end

                var_24_3 = var_24_2.BaseAddress + var_24_2.RegionSize
                var_24_3 = var_24_3 + var_24_0.dwAllocationGranularity - 1
                var_24_3 = var_24_3 - var_24_3 % var_24_0.dwAllocationGranularity
        end

        return false
end

function slot_0_20_0(arg_25_0)
        if arg_25_0 == slot_0_4_0 then
                return
        end

        slot_0_17_0("Kernel32.dll", "VirtualFree", "int(__cdecl*)(void*, uint64_t, uint32_t)", arg_25_0, 0, 32768)
end

function slot_0_21_0(arg_26_0, arg_26_1)
        local var_26_0 = slot_0_17_0("Kernel32.dll", "VirtualAlloc", "void*(__cdecl*)(void*, uint64_t, uint32_t, uint32_t)", arg_26_0, arg_26_1, bit.bor(4096, 8192), 64)

        table.insert(slot_0_2_0, var_26_0)

        return var_26_0
end

function slot_0_22_0(arg_27_0, arg_27_1, arg_27_2)
        local var_27_0 = slot_0_19_0(arg_27_0)

        if not var_27_0 then
                return false
        end

        local var_27_1 = slot_0_21_0(var_27_0, arg_27_1)

        if var_27_1 == slot_0_4_0 then
                return false
        end

        return ffi.cast(arg_27_2, var_27_1)
end

function slot_0_23_0(arg_28_0, arg_28_1, arg_28_2)
        local var_28_0 = slot_0_22_0(arg_28_0, #arg_28_1, arg_28_2)

        if not var_28_0 then
                return false
        end

        local var_28_1 = ffi.new("uint8_t[?]", #arg_28_1, arg_28_1)

        ffi.copy(var_28_0, var_28_1, #arg_28_1)

        return var_28_0, #arg_28_1
end

function slot_0_24_0(arg_29_0, arg_29_1, arg_29_2)
        local var_29_0 = ffi.cast("uint8_t*", arg_29_0)

        for iter_29_0 = 0, arg_29_1 - 1 do
                local var_29_1 = true

                for iter_29_1 = 0, #arg_29_2 - 1 do
                        if var_29_0[iter_29_0 + iter_29_1] ~= arg_29_2[iter_29_1 + 1] then
                                var_29_1 = false

                                break
                        end
                end

                if var_29_1 then
                        return var_29_0 + iter_29_0
                end
        end

        return nil
end

function slot_0_25_0(arg_30_0, arg_30_1, arg_30_2)
        local var_30_0 = {}
        local var_30_1 = ffi.cast("uint8_t*", arg_30_0)

        for iter_30_0 = 0, arg_30_1 - 1 do
                local var_30_2 = true

                for iter_30_1 = 0, #arg_30_2 - 1 do
                        if var_30_1[iter_30_0 + iter_30_1] ~= arg_30_2[iter_30_1 + 1] then
                                var_30_2 = false

                                break
                        end
                end

                if var_30_2 then
                        table.insert(var_30_0, var_30_1 + iter_30_0)
                end
        end

        return var_30_0
end

function slot_0_26_0(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
        for iter_31_0, iter_31_1 in pairs(arg_31_2) do
                local var_31_0 = slot_0_25_0(arg_31_0, arg_31_1, iter_31_1)

                for iter_31_2, iter_31_3 in pairs(var_31_0) do
                        local var_31_1 = ffi.cast("intptr_t", iter_31_3)
                        local var_31_2 = slot_0_13_0(iter_31_3, iter_31_1[0], 0)
                        local var_31_3 = arg_31_3(tonumber(var_31_2 - var_31_1))

                        if var_31_3 then
                                slot_0_14_0(iter_31_3, var_31_3, iter_31_1[0])
                        end
                end
        end
end

slot_0_27_0 = slot_0_15_0("particles.dll", "E8 ? ? ? ? 44 38 65 8C 74 32 48 8B ? ? 48 85")
slot_0_28_0, slot_0_29_0 = slot_0_23_0(slot_0_27_0, {
        72,
        131,
        236,
        56,
        76,
        137,
        76,
        36,
        32,
        77,
        139,
        200,
        76,
        139,
        194,
        72,
        139,
        209,
        72,
        141,
        13,
        119,
        50,
        0,
        0,
        232,
        2,
        252,
        255,
        255,
        72,
        131,
        196,
        56,
        195,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        64,
        83,
        85,
        65,
        84,
        72,
        131,
        236,
        32,
        73,
        139,
        193,
        77,
        139,
        208,
        76,
        139,
        76,
        36,
        96,
        72,
        139,
        234,
        72,
        139,
        217,
        76,
        139,
        192,
        73,
        139,
        210,
        72,
        139,
        205,
        255,
        83,
        40,
        68,
        15,
        182,
        224,
        72,
        133,
        237,
        15,
        132,
        233,
        2,
        0,
        0,
        139,
        75,
        16,
        131,
        249,
        255,
        72,
        137,
        124,
        36,
        72,
        76,
        137,
        124,
        36,
        88,
        64,
        15,
        148,
        199,
        76,
        139,
        125,
        24,
        77,
        133,
        255,
        15,
        132,
        8,
        1,
        0,
        0,
        131,
        249,
        255,
        116,
        83,
        77,
        139,
        127,
        8,
        77,
        133,
        255,
        116,
        74,
        77,
        139,
        63,
        77,
        133,
        255,
        116,
        66,
        72,
        137,
        116,
        36,
        64,
        51,
        246,
        133,
        201,
        126,
        50,
        76,
        137,
        116,
        36,
        80,
        68,
        139,
        246,
        15,
        31,
        0,
        72,
        139,
        67,
        24,
        73,
        139,
        207,
        73,
        139,
        20,
        6,
        255,
        83,
        32,
        133,
        192,
        116,
        13,
        255,
        198,
        73,
        131,
        198,
        8,
        59,
        115,
        16,
        124,
        227,
        235,
        3,
        64,
        183,
        1,
        76,
        139,
        116,
        36,
        80,
        72,
        139,
        116,
        36,
        64,
        72,
        139,
        69,
        24,
        72,
        139,
        8,
        72,
        133,
        201,
        15,
        132,
        160,
        0,
        0,
        0,
        64,
        132,
        255,
        116,
        39,
        243,
        15,
        16,
        3,
        243,
        15,
        17,
        129,
        136,
        3,
        0,
        0,
        72,
        139,
        69,
        24,
        243,
        15,
        16,
        75,
        4,
        72,
        139,
        8,
        243,
        15,
        17,
        137,
        140,
        3,
        0,
        0,
        243,
        15,
        16,
        83,
        8,
        235,
        101,
        15,
        182,
        67,
        12,
        102,
        15,
        110,
        200,
        15,
        182,
        67,
        15,
        15,
        91,
        201,
        102,
        15,
        110,
        192,
        15,
        91,
        192,
        243,
        15,
        94,
        200,
        243,
        15,
        17,
        137,
        136,
        3,
        0,
        0,
        15,
        182,
        67,
        13,
        102,
        15,
        110,
        200,
        15,
        182,
        67,
        15,
        15,
        91,
        201,
        102,
        15,
        110,
        192,
        72,
        139,
        69,
        24,
        15,
        91,
        192,
        72,
        139,
        8,
        243,
        15,
        94,
        200,
        243,
        15,
        17,
        137,
        140,
        3,
        0,
        0,
        15,
        182,
        67,
        14,
        102,
        15,
        110,
        208,
        15,
        182,
        67,
        15,
        15,
        91,
        210,
        102,
        15,
        110,
        192,
        15,
        91,
        192,
        243,
        15,
        94,
        208,
        72,
        139,
        69,
        24,
        72,
        139,
        8,
        243,
        15,
        17,
        145,
        144,
        3,
        0,
        0,
        76,
        139,
        69,
        32,
        76,
        139,
        124,
        36,
        88,
        77,
        133,
        192,
        15,
        132,
        165,
        1,
        0,
        0,
        102,
        144,
        73,
        139,
        64,
        24,
        72,
        133,
        192,
        15,
        132,
        172,
        0,
        0,
        0,
        72,
        139,
        8,
        72,
        133,
        201,
        15,
        132,
        160,
        0,
        0,
        0,
        64,
        132,
        255,
        116,
        39,
        243,
        15,
        16,
        3,
        243,
        15,
        17,
        129,
        136,
        3,
        0,
        0,
        73,
        139,
        64,
        24,
        243,
        15,
        16,
        75,
        4,
        72,
        139,
        8,
        243,
        15,
        17,
        137,
        140,
        3,
        0,
        0,
        243,
        15,
        16,
        83,
        8,
        235,
        101,
        15,
        182,
        67,
        12,
        102,
        15,
        110,
        200,
        15,
        182,
        67,
        15,
        15,
        91,
        201,
        102,
        15,
        110,
        192,
        15,
        91,
        192,
        243,
        15,
        94,
        200,
        243,
        15,
        17,
        137,
        136,
        3,
        0,
        0,
        15,
        182,
        67,
        13,
        102,
        15,
        110,
        200,
        15,
        182,
        67,
        15,
        15,
        91,
        201,
        102,
        15,
        110,
        192,
        73,
        139,
        64,
        24,
        15,
        91,
        192,
        72,
        139,
        8,
        243,
        15,
        94,
        200,
        243,
        15,
        17,
        137,
        140,
        3,
        0,
        0,
        15,
        182,
        67,
        14,
        102,
        15,
        110,
        208,
        15,
        182,
        67,
        15,
        15,
        91,
        210,
        102,
        15,
        110,
        192,
        15,
        91,
        192,
        243,
        15,
        94,
        208,
        73,
        139,
        64,
        24,
        72,
        139,
        8,
        243,
        15,
        17,
        145,
        144,
        3,
        0,
        0,
        73,
        139,
        80,
        32,
        72,
        133,
        210,
        15,
        132,
        208,
        0,
        0,
        0,
        102,
        102,
        15,
        31,
        132,
        0,
        0,
        0,
        0,
        0,
        72,
        139,
        66,
        24,
        72,
        133,
        192,
        15,
        132,
        172,
        0,
        0,
        0,
        72,
        139,
        8,
        72,
        133,
        201,
        15,
        132,
        160,
        0,
        0,
        0,
        64,
        132,
        255,
        116,
        39,
        243,
        15,
        16,
        3,
        243,
        15,
        17,
        129,
        136,
        3,
        0,
        0,
        72,
        139,
        66,
        24,
        243,
        15,
        16,
        75,
        4,
        72,
        139,
        8,
        243,
        15,
        17,
        137,
        140,
        3,
        0,
        0,
        243,
        15,
        16,
        83,
        8,
        235,
        101,
        15,
        182,
        67,
        12,
        102,
        15,
        110,
        200,
        15,
        182,
        67,
        15,
        15,
        91,
        201,
        102,
        15,
        110,
        192,
        15,
        91,
        192,
        243,
        15,
        94,
        200,
        243,
        15,
        17,
        137,
        136,
        3,
        0,
        0,
        15,
        182,
        67,
        13,
        102,
        15,
        110,
        200,
        15,
        182,
        67,
        15,
        15,
        91,
        201,
        102,
        15,
        110,
        192,
        72,
        139,
        66,
        24,
        15,
        91,
        192,
        72,
        139,
        8,
        243,
        15,
        94,
        200,
        243,
        15,
        17,
        137,
        140,
        3,
        0,
        0,
        15,
        182,
        67,
        14,
        102,
        15,
        110,
        208,
        15,
        182,
        67,
        15,
        15,
        91,
        210,
        102,
        15,
        110,
        192,
        15,
        91,
        192,
        243,
        15,
        94,
        208,
        72,
        139,
        66,
        24,
        72,
        139,
        8,
        243,
        15,
        17,
        145,
        144,
        3,
        0,
        0,
        72,
        139,
        82,
        48,
        72,
        133,
        210,
        15,
        133,
        58,
        255,
        255,
        255,
        77,
        139,
        64,
        48,
        77,
        133,
        192,
        15,
        133,
        93,
        254,
        255,
        255,
        72,
        139,
        124,
        36,
        72,
        65,
        15,
        182,
        196,
        72,
        131,
        196,
        32,
        65,
        92,
        93,
        91,
        195,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        204,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        204,
        204,
        204,
        204
}, "uint8_t*")
slot_0_30_0 = ffi.new("MyUnloadWrapper_t")
slot_0_31_0 = slot_0_24_0(slot_0_28_0, slot_0_29_0, {
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255,
        255
})
slot_0_32_0 = slot_0_24_0(slot_0_28_0, slot_0_29_0, {
        64,
        83,
        85,
        65,
        84,
        72,
        131,
        236,
        32,
        73,
        139,
        193
})

slot_0_26_0(slot_0_28_0, slot_0_29_0, {
        {
                [0] = 1,
                232,
                2,
                252,
                255,
                255
        },
        {
                [0] = 3,
                72,
                141,
                13,
                119,
                50,
                0,
                0
        }
}, function(arg_32_0)
        return ({
                ["12926"] = slot_0_31_0,
                ["-1017"] = slot_0_32_0
        })[tostring(arg_32_0)]
end)

slot_0_33_0 = ffi.new("CParticleModulateStack")
slot_0_34_0 = ffi.cast("CParticleModulateContext*", slot_0_31_0)

ffi.metatype("CParticleModulateContext", {
        __index = {
                Clear = function(arg_33_0)
                        slot_0_33_0:Clear()
                        arg_33_0:FullyModulate()
                end,
                FullyModulate = function(arg_34_0)
                        arg_34_0.nDataSize = -1
                        arg_34_0.pDataArray = slot_0_4_0
                end,
                ClearModulate = function(arg_35_0)
                        arg_35_0.nDataSize = 0
                        arg_35_0.pDataArray = slot_0_4_0
                end,
                StackPush = function(arg_36_0, arg_36_1)
                        slot_0_33_0:Push(arg_36_1)
                        arg_36_0:UpdateStackArray()
                end,
                StackPop = function(arg_37_0, arg_37_1)
                        slot_0_33_0:Pop(arg_37_1)
                        arg_37_0:UpdateStackArray()
                end,
                SetParticle = function(arg_38_0, arg_38_1, arg_38_2)
                        local var_38_0 = slot_0_33_0:Contain(arg_38_1)

                        if arg_38_2 then
                                if not var_38_0 then
                                        arg_38_0:StackPush(arg_38_1)
                                end
                        elseif var_38_0 then
                                arg_38_0:StackPop(arg_38_1)
                        end
                end,
                UpdateStackArray = function(arg_39_0)
                        if not slot_0_33_0:Empty() then
                                slot_0_34_0.nDataSize = slot_0_33_0:Size()
                                slot_0_34_0.pDataArray = slot_0_33_0:Data()
                        else
                                arg_39_0:FullyModulate()
                        end
                end,
                ColorModulate = function(arg_40_0, arg_40_1)
                        local var_40_0 = math.clamp(arg_40_1[4], 0, 255) / 255

                        arg_40_0.flColorR = math.clamp(arg_40_1[1], 0, 255) / 255 * var_40_0
                        arg_40_0.flColorG = math.clamp(arg_40_1[2], 0, 255) / 255 * var_40_0
                        arg_40_0.flColorB = math.clamp(arg_40_1[3], 0, 255) / 255 * var_40_0
                end,
                Initialize = function(arg_41_0)
                        arg_41_0.nDefaultR = 255
                        arg_41_0.nDefaultG = 255
                        arg_41_0.nDefaultB = 255
                        arg_41_0.nDefaultA = 255

                        if arg_41_0.pDataArray == slot_0_4_0 then
                                arg_41_0:FullyModulate()
                        end

                        slot_0_33_0:Reserve(32)

                        local var_41_0 = slot_0_8_0:get_value():get()

                        arg_41_0.pStringCmp = slot_0_16_0("msvcrt.dll", "strcmp", "void*")
                        arg_41_0.pOriginalFn = ffi.cast("void*", slot_0_13_0(slot_0_27_0, 1, 0))

                        arg_41_0:ColorModulate({
                                var_41_0:get_r(),
                                var_41_0:get_g(),
                                var_41_0:get_b(),
                                var_41_0:get_a()
                        })
                end
        }
})

function slot_0_35_0()
        local var_42_0 = slot_0_8_0:get_value():get()

        slot_0_34_0:ColorModulate({
                var_42_0:get_r(),
                var_42_0:get_g(),
                var_42_0:get_b(),
                var_42_0:get_a()
        })
end

function slot_0_36_0()
        slot_0_18_0()

        local var_43_0 = slot_0_7_0:get_value():get():get_raw()

        if var_43_0 == 0 or not slot_0_6_0:get_value():get() then
                slot_0_34_0:ClearModulate()

                return
        end

        if slot_0_12_0(var_43_0, 1) then
                slot_0_34_0:FullyModulate()

                return
        end

        slot_0_34_0:SetParticle("particles/impact_fx/impact_dirt.vpcf", slot_0_12_0(var_43_0, 2))
        slot_0_34_0:SetParticle("particles/impact_fx/impact_concrete.vpcf", slot_0_12_0(var_43_0, 2))
        slot_0_34_0:SetParticle("particles/inferno_fx/molotov_bodyburn.vpcf", slot_0_12_0(var_43_0, 5))
        slot_0_34_0:SetParticle("particles/inferno_fx/incendiary_fire01.vpcf", slot_0_12_0(var_43_0, 5))
        slot_0_34_0:SetParticle("particles/inferno_fx/molotov_explosion.vpcf", slot_0_12_0(var_43_0, 5))
        slot_0_34_0:SetParticle("particles/explosions_fx/explosion_basic.vpcf", slot_0_12_0(var_43_0, 4))
        slot_0_34_0:SetParticle("particles/inferno_fx/molotov_groundfire.vpcf", slot_0_12_0(var_43_0, 5))
        slot_0_34_0:SetParticle("particles/blood_impact/blood_impact_low.vpcf", slot_0_12_0(var_43_0, 2))
        slot_0_34_0:SetParticle("particles/entity/spectator_utility_trail.vpcf", slot_0_12_0(var_43_0, 6))
        slot_0_34_0:SetParticle("particles/blood_impact/blood_impact_high.vpcf", slot_0_12_0(var_43_0, 2))
        slot_0_34_0:SetParticle("particles/inferno_fx/incendiary_explosion.vpcf", slot_0_12_0(var_43_0, 5))
        slot_0_34_0:SetParticle("particles/impact_fx/impact_helmet_headshot.vpcf", slot_0_12_0(var_43_0, 2))
        slot_0_34_0:SetParticle("particles/inferno_fx/incendiary_groundfire.vpcf", slot_0_12_0(var_43_0, 5))
        slot_0_34_0:SetParticle("particles/explosions_fx/explosion_hegrenade.vpcf", slot_0_12_0(var_43_0, 4))
        slot_0_34_0:SetParticle("pparticles/blood_impact/blood_impact_friendly.vpcf", slot_0_12_0(var_43_0, 2))
        slot_0_34_0:SetParticle("particles/explosions_fx/explosion_hegrenade_dirt.vpcf", slot_0_12_0(var_43_0, 4))
        slot_0_34_0:SetParticle("particles/explosions_fx/explosion_hegrenade_brief.vpcf", slot_0_12_0(var_43_0, 4))
        slot_0_34_0:SetParticle("particles/explosions_fx/explosion_hegrenade_debris.vpcf", slot_0_12_0(var_43_0, 4))
        slot_0_34_0:SetParticle("particles/weapons/cs_weapon_fx/weapon_tracers_taser.vpcf", slot_0_12_0(var_43_0, 3))
        slot_0_34_0:SetParticle("particles/weapons/cs_weapon_fx/weapon_tracers_rifle.vpcf", slot_0_12_0(var_43_0, 3))
end

function slot_0_37_0(arg_44_0, arg_44_1, arg_44_2)
        local var_44_0 = ffi.cast("uintptr_t", arg_44_0)
        local var_44_1 = ffi.cast("uintptr_t", arg_44_1)
        local var_44_2 = setmetatable({
                bSwaped = false,
                pProtection = ffi.new("uint32_t[1]"),
                pSwapTarget = ffi.cast("int*", var_44_0 + arg_44_2),
                nBackupInstruction = ffi.cast("int*", var_44_0 + arg_44_2)[0],
                nSwapInstruction = ffi.cast("int32_t", var_44_1 - (var_44_0 + arg_44_2 + ffi.sizeof("int")))
        }, {
                __index = {
                        Swap = function(arg_45_0)
                                if arg_45_0.bSwaped then
                                        return
                                end

                                arg_45_0.bSwaped = true

                                slot_0_17_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_45_0.pSwapTarget, ffi.sizeof("int"), 64, arg_45_0.pProtection)

                                arg_45_0.pSwapTarget[0] = arg_45_0.nSwapInstruction

                                slot_0_17_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_45_0.pSwapTarget, ffi.sizeof("int"), arg_45_0.pProtection[0], arg_45_0.pProtection)
                        end,
                        UnSwap = function(arg_46_0)
                                if not arg_46_0.bSwaped then
                                        return
                                end

                                arg_46_0.bSwaped = false

                                slot_0_17_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_46_0.pSwapTarget, ffi.sizeof("int"), 64, arg_46_0.pProtection)

                                arg_46_0.pSwapTarget[0] = arg_46_0.nBackupInstruction

                                slot_0_17_0("Kernel32.dll", "VirtualProtect", "int(__cdecl*)(void*, uint64_t, uint32_t, uint32_t*)", arg_46_0.pSwapTarget, ffi.sizeof("int"), arg_46_0.pProtection[0], arg_46_0.pProtection)
                        end
                }
        })

        var_44_2:Swap()
        table.insert(slot_0_1_0, var_44_2)

        return var_44_2
end

function slot_0_38_0()
        for iter_47_0, iter_47_1 in pairs(slot_0_1_0) do
                iter_47_1:UnSwap()
        end

        for iter_47_2, iter_47_3 in pairs(slot_0_2_0) do
                slot_0_20_0(iter_47_3)
        end
end

slot_0_18_0()
slot_0_36_0()
slot_0_11_0(slot_0_38_0)
slot_0_34_0:Initialize()
slot_0_7_0:add_callback(slot_0_36_0)
slot_0_6_0:add_callback(slot_0_36_0)
slot_0_8_0:add_callback(slot_0_35_0)
events.present_queue:add(function()
        slot_0_30_0.nRefCount = 0
end)
slot_0_37_0(slot_0_27_0, slot_0_28_0, 1)
