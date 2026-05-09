--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi then
        game.engine:client_cmd("showconsole")
        gui.notify:add(gui.notification("Model Glow", "Error: make sure \"allow insecure is open\""))
        assert(ffi, "model glow error: ffi is invalid, please allow insecure script")
end

ffi.cdef("    typedef struct { } CBaseEntity;\n    typedef struct { } CSceneSystem;\n    typedef struct { } CGameSceneNode;\n    typedef struct { } CRenderComponent;\n    typedef struct { } CSceneObjectAttributes;\n    typedef struct {\n        uint8_t nRefCount;\n    } MyUnloadWrapper_t;\n\n    typedef struct {\n        float x, y, z, w;\n    } Vector4D;\n    \n    typedef struct {\n        void* pParameter;\n        void* pUpdateFunction;\n    } CSceneObjectHandlers;\n    \n    typedef struct {\n        uint32_t nSize;\n        CSceneObjectHandlers** arrData;\n    } CUtlVector;\n    \n    typedef struct {\n        char pad_0x0[0x98];\n        CSceneObjectAttributes* pAttributes;\n    } CSceneObject;\n\n    typedef struct {\n        void* BaseAddress;\n        void* AllocationBase;\n        uint32_t AllocationProtect;\n        uint16_t PartitionId;\n        uint64_t RegionSize;\n        uint32_t State;\n        uint32_t Protect;\n        uint32_t Type;\n    } CMemoryBasicInformation;\n")

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = {}
slot_0_3_0 = nil
slot_0_4_0 = ffi.cast("void*", 0)
slot_0_5_0 = gui.ctx:find("lua>elements b")
slot_0_6_0 = gui.checkbox(gui.control_id("MODEL GLOW OUTLINE"))
slot_0_7_0 = gui.color_picker(gui.control_id("MODEL GLOW COLOR"), true)

slot_0_5_0:add(gui.make_control("Model Glow Outline", slot_0_6_0))
slot_0_5_0:add(gui.make_control("Model Glow Color", slot_0_7_0))

if slot_0_7_0:get_value():get():rgba() == 0 then
        slot_0_7_0:get_value():set(draw.color(255, 255, 255, 255))
        slot_0_7_0:reset()
end

slot_0_5_0:reset()

slot_0_8_0 = {
        pRenderComponent = 824,
        nRenderableFlags = 168,
        pChild = 64,
        pGameEntitySystem = 88,
        pOwner = 48,
        pGameSceneNode = 816,
        vecSceneObjectHandlers = 56,
        pNextSibling = 72
}

function slot_0_9_0(arg_1_0)
        table.insert(slot_0_1_0, arg_1_0)
end

function slot_0_10_0(arg_2_0, arg_2_1, arg_2_2)
        local var_2_0 = ffi.cast("void*", utils.find_export(arg_2_0, "CreateInterface"))

        assert(var_2_0 ~= slot_0_4_0, ("[Model Glow] error: interface of module %s not found"):format(arg_2_0))

        local var_2_1 = ffi.cast("void*(__cdecl*)(const char*, void*)", var_2_0)(arg_2_1, nil)

        assert(var_2_1 ~= slot_0_4_0, ("[Model Glow] error: interface of module %s not found"):format(arg_2_0))

        return ffi.cast(arg_2_2 or "void*", var_2_1)
end

function slot_0_11_0(arg_3_0, arg_3_1)
        local var_3_0 = utils.find_export(arg_3_0:lower(), arg_3_1)

        if not var_3_0 or var_3_0 == slot_0_4_0 then
                assert(false, ("[Model Glow] error: %s -> %s not found"):format(arg_3_0, arg_3_1))

                return false
        end

        return ffi.cast("void*", var_3_0)
end

function slot_0_12_0(arg_4_0, arg_4_1, arg_4_2, ...)
        local var_4_0 = slot_0_11_0(arg_4_0, arg_4_1)

        if not var_4_0 then
                return nil
        end

        return ffi.cast(arg_4_2, var_4_0)(...)
end

function slot_0_13_0(arg_5_0, arg_5_1, arg_5_2)
        local var_5_0 = ffi.cast("void*", utils.find_pattern(arg_5_0, arg_5_1))

        if var_5_0 == slot_0_4_0 then
                assert(false, "[Model Glow] error: outdated pattern: " .. arg_5_1)

                return nil
        end

        return ffi.cast(arg_5_2 or "void*", var_5_0)
end

function slot_0_14_0(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
        assert(arg_6_0 ~= 421ULL, "error: is a invalid address")

        arg_6_0 = ffi.cast("uintptr_t", arg_6_0)
        arg_6_0 = arg_6_0 + (arg_6_1 or 1)
        arg_6_0 = arg_6_0 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_6_0)[0])
        arg_6_0 = arg_6_0 + (arg_6_2 or 0)

        if arg_6_3 then
                return ffi.cast(arg_6_3, arg_6_0)
        end

        return arg_6_0
end

function slot_0_15_0(arg_7_0)
        if type(arg_7_0) == "cdata" then
                return ffi.cast("CBaseEntity*", arg_7_0)
        elseif type(arg_7_0) == "userdata" then
                return ffi.cast("CBaseEntity**", arg_7_0)[0]
        end

        return false
end

function slot_0_16_0(arg_8_0, arg_8_1, arg_8_2, ...)
        if arg_8_0 == slot_0_4_0 then
                return nil
        end

        local var_8_0 = ffi.cast("void***", arg_8_0)[0][arg_8_1]
        local var_8_1 = ("VFuncOf: %02X"):format(ffi.cast("uintptr_t", var_8_0))

        if not slot_0_0_0[var_8_1] then
                slot_0_0_0[var_8_1] = ffi.cast(arg_8_2, var_8_0)
        end

        return slot_0_0_0[var_8_1](arg_8_0, ...)
end

function slot_0_17_0(arg_9_0, arg_9_1)
        local var_9_0 = slot_0_8_0[arg_9_0]

        return function(arg_10_0)
                if not var_9_0 then
                        return false
                end

                local var_10_0 = ffi.cast("uintptr_t", arg_10_0)

                return ffi.cast(("%s*"):format(arg_9_1), var_10_0 + var_9_0)[0]
        end
end

function slot_0_18_0(arg_11_0)
        return function(arg_12_0, ...)
                return arg_11_0(arg_12_0, ...)
        end
end

function slot_0_19_0(arg_13_0, arg_13_1)
        return function(arg_14_0, ...)
                return slot_0_16_0(arg_14_0, arg_13_0, arg_13_1, ...)
        end
end

function slot_0_20_0(arg_15_0, arg_15_1)
        local var_15_0 = slot_0_12_0("Kernel32.dll", "VirtualAlloc", "void*(__stdcall*)(void*, uint64_t, uint32_t, uint32_t)", arg_15_0, arg_15_1, bit.bor(4096, 8192), 64)

        table.insert(slot_0_2_0, var_15_0)

        return var_15_0
end

function slot_0_21_0(arg_16_0)
        if arg_16_0 == slot_0_4_0 then
                return
        end

        slot_0_12_0("Kernel32.dll", "VirtualFree", "int(__stdcall*)(void*, uint64_t, uint32_t)", arg_16_0, 0, 32768)
end

function slot_0_22_0()
        for iter_17_0, iter_17_1 in pairs(slot_0_2_0) do
                slot_0_21_0(iter_17_1)
        end

        slot_0_2_0 = {}
end

function slot_0_23_0(arg_18_0, arg_18_1)
        local var_18_0 = ffi.new("uint8_t[?]", #arg_18_0, arg_18_0)
        local var_18_1 = slot_0_20_0(slot_0_4_0, #arg_18_0)

        ffi.copy(var_18_1, var_18_0, #arg_18_0)

        return ffi.cast(arg_18_1, var_18_1), #arg_18_0
end

function slot_0_24_0(arg_19_0)
        local var_19_0 = ffi.new("CMemoryBasicInformation")

        slot_0_12_0("Kernel32.dll", "VirtualQuery", "uint64_t(__stdcall*)(const void*, CMemoryBasicInformation*, uint64_t)", arg_19_0, var_19_0, ffi.sizeof("CMemoryBasicInformation"))

        return var_19_0.State == 4096 and bit.band(var_19_0.Protect, bit.bor(bit.bor(bit.bor(16, 32), 64), 128)) > 0
end

slot_0_25_0 = slot_0_10_0("scenesystem.dll", "SceneSystem_002", "CSceneSystem*")
slot_0_26_0 = slot_0_13_0("scenesystem.dll", "40 55 48 83 EC ? 48 83 BA", "void(__fastcall*)(void*, void*)")
slot_0_27_0 = slot_0_14_0(slot_0_13_0("client.dll", "E8 ? ? ? ? FF C6 48 83 C3 ? 49 3B"), 1, 0, "void(__fastcall*)(void*, uint32_t, Vector4D)")
slot_0_28_0 = slot_0_14_0(slot_0_13_0("client.dll", "E8 ? ? ? ? 48 8B ? 48 85 C0 74 ? ? ? 48 8D 1D"), 1, 0, "CSceneObject*(__fastcall*)(void*, int)")
slot_0_29_0 = slot_0_23_0({
        72,
        35,
        202,
        72,
        139,
        193,
        195
}, "uint64_t(__fastcall*)(uint64_t, uint64_t)")
slot_0_30_0 = slot_0_23_0({
        72,
        139,
        193,
        72,
        139,
        202,
        72,
        211,
        224,
        195
}, "uint64_t(__fastcall*)(uint64_t, uint64_t)")

ffi.metatype("MyUnloadWrapper_t", {
        __gc = function(arg_20_0)
                for iter_20_0, iter_20_1 in pairs(slot_0_1_0) do
                        xpcall(iter_20_1, print)
                end
        end
})
ffi.metatype("CSceneSystem", {
        __index = {
                AllocateAttribure = slot_0_18_0(slot_0_26_0)
        }
})
ffi.metatype("CSceneObjectHandlers", {
        __index = {
                SetCallBack = function(arg_21_0, arg_21_1)
                        if not slot_0_24_0(arg_21_0.pUpdateFunction) or arg_21_0.pUpdateFunction == arg_21_1 then
                                return
                        end

                        arg_21_0.pUpdateFunction = ffi.cast("void*(__fastcall*)(CBaseEntity*, void*, bool)", arg_21_1)
                end,
                GetCallBack = function(arg_22_0)
                        if not slot_0_24_0(arg_22_0.pUpdateFunction) then
                                return false
                        end

                        return ffi.cast("void*(__fastcall*)(CBaseEntity*, void*, bool)", arg_22_0.pUpdateFunction)
                end
        }
})
ffi.metatype("CGameSceneNode", {
        __index = {
                pOwner = slot_0_17_0("pOwner", "CBaseEntity*"),
                pChild = slot_0_17_0("pChild", "CGameSceneNode*"),
                pNextSibling = slot_0_17_0("pNextSibling", "CGameSceneNode*"),
                ForEach = function(arg_23_0, arg_23_1)
                        local var_23_0 = arg_23_0:pChild()

                        while var_23_0 ~= slot_0_4_0 do
                                arg_23_1(var_23_0)

                                var_23_0 = var_23_0:pNextSibling()
                        end
                end
        }
})
ffi.metatype("CRenderComponent", {
        __index = {
                vecSceneObjectHandlers = slot_0_17_0("vecSceneObjectHandlers", "CUtlVector"),
                GetSceneObject = slot_0_18_0(slot_0_28_0),
                ForEach = function(arg_24_0, arg_24_1)
                        local var_24_0 = arg_24_0:vecSceneObjectHandlers()

                        for iter_24_0 = 0, var_24_0.nSize - 1 do
                                local var_24_1 = var_24_0.arrData[iter_24_0]

                                if var_24_1 ~= slot_0_4_0 then
                                        arg_24_1(var_24_1)
                                end
                        end
                end,
                ForEachSceneObject = function(arg_25_0, arg_25_1)
                        local var_25_0 = arg_25_0:vecSceneObjectHandlers()

                        for iter_25_0 = 0, var_25_0.nSize - 1 do
                                local var_25_1 = arg_25_0:GetSceneObject(iter_25_0)

                                if var_25_1 ~= slot_0_4_0 then
                                        arg_25_1(var_25_1)
                                end
                        end
                end
        }
})
ffi.metatype("CSceneObject", {
        __index = {
                nRenderableFlags = slot_0_17_0("nRenderableFlags", "uint64_t"),
                GetOrAllocateAttributes = function(arg_26_0)
                        slot_0_25_0:AllocateAttribure(arg_26_0)

                        return arg_26_0.pAttributes
                end,
                IsPartOfViewmodel = function(arg_27_0)
                        return slot_0_29_0(arg_27_0:nRenderableFlags(), bit.lshift(1, 8)) > 0
                end,
                IsCulledByFirstPersonView = function(arg_28_0)
                        return slot_0_29_0(arg_28_0:nRenderableFlags(), slot_0_30_0(1, 54)) > 0
                end
        }
})
ffi.metatype("CSceneObjectAttributes", {
        __index = {
                SetFloat = function(arg_29_0, arg_29_1, arg_29_2)
                        local var_29_0 = ffi.new("Vector4D", {
                                arg_29_2,
                                arg_29_2,
                                arg_29_2,
                                arg_29_2
                        })

                        slot_0_27_0(arg_29_0, arg_29_1, var_29_0)
                end,
                SetColor = function(arg_30_0, arg_30_1, arg_30_2)
                        local var_30_0 = ffi.new("Vector4D", {
                                math.clamp(arg_30_2[1] / 255, 0, 1),
                                math.clamp(arg_30_2[2] / 255, 0, 1),
                                math.clamp(arg_30_2[3] / 255, 0, 1),
                                0
                        })

                        slot_0_27_0(arg_30_0, arg_30_1, var_30_0)
                end,
                RemoveSpawnProtectionEffect = function(arg_31_0)
                        arg_31_0:SetFloat(609143216, 0)
                end,
                SetSpawnProtectionEffectColor = function(arg_32_0, arg_32_1)
                        arg_32_0:SetColor(2999645407, arg_32_1)
                        arg_32_0:SetFloat(609143216, math.clamp(arg_32_1[4] / 255, 0, 1))
                end
        }
})
ffi.metatype("CBaseEntity", {
        __index = {
                pGameSceneNode = slot_0_17_0("pGameSceneNode", "CGameSceneNode*"),
                pRenderComponent = slot_0_17_0("pRenderComponent", "CRenderComponent*"),
                ForEach = function(arg_33_0, arg_33_1)
                        local var_33_0 = arg_33_0:pGameSceneNode()

                        if var_33_0 == slot_0_4_0 then
                                return
                        end

                        var_33_0:ForEach(function(arg_34_0)
                                local var_34_0 = arg_34_0:pOwner()

                                if var_34_0 ~= slot_0_4_0 then
                                        arg_33_1(var_34_0)
                                end
                        end)
                end,
                RemoveSpawnProtectionEffect = function(arg_35_0)
                        local var_35_0 = arg_35_0:pRenderComponent()

                        if var_35_0 == slot_0_4_0 then
                                return
                        end

                        var_35_0:ForEachSceneObject(function(arg_36_0)
                                local var_36_0 = arg_36_0:GetOrAllocateAttributes()

                                if var_36_0 == slot_0_4_0 then
                                        return
                                end

                                var_36_0:RemoveSpawnProtectionEffect()
                        end)
                end,
                ApplySpawnProtectionEffect = function(arg_37_0, arg_37_1)
                        local var_37_0 = arg_37_0:pRenderComponent()

                        if var_37_0 == slot_0_4_0 then
                                return
                        end

                        var_37_0:ForEachSceneObject(function(arg_38_0)
                                if arg_38_0:IsPartOfViewmodel() or arg_38_0:IsCulledByFirstPersonView() then
                                        return
                                end

                                local var_38_0 = arg_38_0:GetOrAllocateAttributes()

                                if var_38_0 == slot_0_4_0 then
                                        return
                                end

                                var_38_0:SetSpawnProtectionEffectColor(arg_37_1)
                        end)
                end,
                RemoveSpawnProtectionEffectRecursively = function(arg_39_0)
                        arg_39_0:RemoveSpawnProtectionEffect()
                        arg_39_0:ForEach(function(arg_40_0)
                                arg_40_0:RemoveSpawnProtectionEffect()
                        end)
                end,
                ApplySpawnProtectionEffectRecursively = function(arg_41_0, arg_41_1)
                        arg_41_0:ApplySpawnProtectionEffect(arg_41_1)
                        arg_41_0:ForEach(function(arg_42_0)
                                arg_42_0:ApplySpawnProtectionEffect(arg_41_1)
                        end)
                end,
                SetSceneCallBack = function(arg_43_0, arg_43_1)
                        arg_43_0:pRenderComponent():ForEach(function(arg_44_0)
                                local var_44_0 = arg_44_0:GetCallBack()

                                if not var_44_0 then
                                        return
                                end

                                if not slot_0_3_0 then
                                        slot_0_3_0 = var_44_0
                                end

                                arg_44_0:SetCallBack(arg_43_1)
                        end)
                end
        }
})

slot_0_31_0 = ffi.new("MyUnloadWrapper_t")
slot_0_32_0 = ffi.cast("void*(__fastcall*)(CBaseEntity*, void*, bool)", function(arg_45_0, arg_45_1, arg_45_2)
        local var_45_0 = slot_0_3_0(arg_45_0, arg_45_1, arg_45_2)

        if not slot_0_6_0:get_value():get() then
                return var_45_0
        end

        local var_45_1 = slot_0_7_0:get_value():get()

        arg_45_0:ApplySpawnProtectionEffectRecursively({
                var_45_1:get_r(),
                var_45_1:get_g(),
                var_45_1:get_b(),
                var_45_1:get_a()
        })

        return var_45_0
end)

function slot_0_33_0(arg_46_0)
        if arg_46_0 ~= client_frame_stage.net_update_postdataupdate_end or not game.engine:in_game() then
                return
        end

        local var_46_0 = entities.get_local_pawn()

        if not var_46_0 or not var_46_0:is_alive() then
                return
        end

        local var_46_1 = slot_0_15_0(var_46_0)

        if not var_46_1 then
                return
        end

        slot_0_31_0.nRefCount = 0

        var_46_1:SetSceneCallBack(slot_0_32_0)
end

function slot_0_34_0()
        local var_47_0 = entities.get_local_pawn()

        if not var_47_0 or not var_47_0:is_alive() then
                return
        end

        local var_47_1 = slot_0_15_0(var_47_0)

        if not var_47_1 then
                return
        end

        var_47_1:SetSceneCallBack(slot_0_3_0)
        var_47_1:RemoveSpawnProtectionEffectRecursively()
end

function slot_0_35_0()
        slot_0_34_0()
        slot_0_22_0()
end

function slot_0_36_0(arg_49_0)
        slot_0_33_0(arg_49_0)
end

slot_0_9_0(slot_0_35_0)
events.frame_stage_notify:add(slot_0_36_0)
