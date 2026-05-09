--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi then
        game.engine:client_cmd("showconsole")
        gui.notify:add(gui.notification("Props Modulate.lua", "Error: make sure \"allow insecure is open\""))
        assert(ffi, "error: ffi is invalid, please open \"allow insecure\"")
end

ffi.cdef("    typedef struct { } CMaterial2;\n    typedef struct { } IResourceSystem;\n    typedef struct {\n        float x, y, z, w;\n    } Vector4D;\n\n    typedef struct {\n        uint8_t nRefCount;\n    } MyModulateUnloadWrapper_t;\n\n    typedef struct {\n        void* pData;\n        const char** szResourceName;\n        uint32_t nFlags;\n        uint8_t nResourceType;\n        char pad_0x18[0x8];\n        int32_t nRefCount;\n    } CResourceBinding;\n\n    typedef struct {\n        CResourceBinding* pBinding;\n    } CStrongHandle;\n\n    typedef struct {\n        uint64_t nSize;\n        CStrongHandle* arrMaterials;\n        char pad[0x18];\n    } CMaterialResources;\n\n    typedef struct {\n        Vector4D vecValue;\n        void* pTextureValue;\n        char pad[0x10];\n        const char* szParameterName;\n        const char* szValue;\n        int64_t nValue;\n    } CMaterialParam;\n")

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = false
slot_0_3_0 = ffi.cast("void*", 0)
slot_0_4_0 = gui.ctx:find("lua>elements b")
slot_0_5_0 = gui.checkbox(gui.control_id("PROPS MODULATE: ENABLED"))
slot_0_6_0 = gui.color_picker(gui.control_id("PROPS: COLOR"), true)
slot_0_7_0 = gui.button(gui.control_id("PROPS: UPDATE"), "Refresh")
slot_0_8_0 = gui.make_control("Props Modulate Color", slot_0_6_0)
slot_0_9_0 = gui.make_control("Refresh Props Color", slot_0_7_0)

if slot_0_6_0:get_value():get():rgba() == 0 then
        slot_0_6_0:get_value():set(draw.color(0, 255, 255, 255))
        slot_0_6_0:reset()
end

slot_0_4_0:add(gui.make_control("Props Modulate", slot_0_5_0))
slot_0_4_0:add(slot_0_8_0)
slot_0_4_0:add(slot_0_9_0)
slot_0_4_0:reset()

function slot_0_10_0(arg_1_0, arg_1_1, arg_1_2)
        local var_1_0 = ffi.cast("uintptr_t", utils.find_pattern(arg_1_0, arg_1_1))

        assert(var_1_0 ~= 522ULL, "error: outdated pattern")

        return ffi.cast(arg_1_2 or "void*", var_1_0)
end

function slot_0_11_0(arg_2_0)
        table.insert(slot_0_1_0, arg_2_0)
end

function slot_0_12_0(arg_3_0, arg_3_1)
        local var_3_0 = ffi.cast("void*", utils.find_export(arg_3_0, "CreateInterface"))

        assert(var_3_0 ~= slot_0_3_0, "failed find interface")

        local var_3_1 = ffi.cast("void*(__cdecl*)(const char*, void*)", var_3_0)(arg_3_1, nil)

        assert(var_3_1 ~= slot_0_3_0, "failed find interface")

        return var_3_1
end

function slot_0_13_0(arg_4_0, arg_4_1, arg_4_2, ...)
        if arg_4_0 == slot_0_3_0 then
                return nil
        end

        local var_4_0 = ffi.cast("void***", arg_4_0)[0][arg_4_1]
        local var_4_1 = ("VFuncOf: %02X"):format(ffi.cast("uintptr_t", var_4_0))

        if not slot_0_0_0[var_4_1] then
                slot_0_0_0[var_4_1] = ffi.cast(arg_4_2, var_4_0)
        end

        return slot_0_0_0[var_4_1](arg_4_0, ...)
end

function slot_0_14_0(arg_5_0, arg_5_1)
        return function(arg_6_0, ...)
                return slot_0_13_0(arg_6_0, arg_5_0, arg_5_1, ...)
        end
end

ffi.metatype("MyModulateUnloadWrapper_t", {
        __gc = function()
                for iter_7_0, iter_7_1 in pairs(slot_0_1_0) do
                        iter_7_1()
                end
        end
})
ffi.metatype("CStrongHandle", {
        __index = {
                Get = function(arg_8_0, arg_8_1)
                        if not arg_8_0:IsValidate() then
                                return false
                        end

                        if arg_8_1 then
                                return ffi.cast(arg_8_1, arg_8_0.pBinding.pData)
                        end

                        return arg_8_0.pBinding.pData
                end,
                IsValidate = function(arg_9_0)
                        return arg_9_0.pBinding ~= slot_0_3_0 and arg_9_0.pBinding.pData ~= slot_0_3_0
                end,
                GetName = function(arg_10_0)
                        if not arg_10_0:IsValidate() then
                                return ""
                        end

                        local var_10_0 = arg_10_0.pBinding.szResourceName

                        if var_10_0 == slot_0_3_0 then
                                return ""
                        end

                        local var_10_1 = var_10_0[0]

                        if var_10_1 == slot_0_3_0 or var_10_1[0] == 0 then
                                return ""
                        end

                        return ffi.string(var_10_1)
                end
        }
})

slot_0_15_0 = ffi.new("MyModulateUnloadWrapper_t")
slot_0_16_0 = ffi.cast("IResourceSystem*", slot_0_12_0("resourcesystem.dll", "ResourceSystem013"))
slot_0_17_0 = ffi.cast("void(__fastcall*)(void*)", slot_0_10_0("materialsystem2.dll", "48 89 7C 24 20 41 56 48 83 EC 20 8B 81 ? ? ? ? ? ? ? FF"))
slot_0_18_0 = ffi.cast("CMaterialParam*(__fastcall*)(void*, const char*)", slot_0_10_0("materialsystem2.dll", "48 89 5C 24 ? 48 89 74 24 ? 57 48 83 EC 20 48 8B 59 18"))

ffi.metatype("CMaterial2", {
        __index = {
                __GetName = slot_0_14_0(0, "const char*(__thiscall*)(void*)"),
                __GetShareName = slot_0_14_0(1, "const char*(__thiscall*)(void*)"),
                GetName = function(arg_11_0)
                        return ffi.string(arg_11_0:__GetName())
                end,
                GetShareName = function(arg_12_0)
                        return ffi.string(arg_12_0:__GetShareName())
                end,
                UpdateParameter = function(arg_13_0)
                        return slot_0_17_0(arg_13_0)
                end,
                FindParameter = function(arg_14_0, arg_14_1)
                        return slot_0_18_0(arg_14_0, arg_14_1)
                end,
                ColorModulate = function(arg_15_0, arg_15_1)
                        local var_15_0 = arg_15_0:FindParameter("g_vColorTint")

                        if var_15_0 == slot_0_3_0 then
                                return
                        end

                        var_15_0.vecValue.x = math.clamp(arg_15_1[1] / 255, 0, 1)
                        var_15_0.vecValue.y = math.clamp(arg_15_1[2] / 255, 0, 1)
                        var_15_0.vecValue.z = math.clamp(arg_15_1[3] / 255, 0, 1)

                        arg_15_0:UpdateParameter()
                end
        }
})
ffi.metatype("IResourceSystem", {
        __index = {
                EnumerateResources = slot_0_14_0(32, "void(__thiscall*)(void*, uint64_t, CMaterialResources&, uint8_t)"),
                IteratorMaterials = function(arg_16_0)
                        local var_16_0 = {}
                        local var_16_1 = ffi.new("CMaterialResources")

                        arg_16_0:EnumerateResources(1952542070, var_16_1, 2)

                        for iter_16_0 = 0, tonumber(var_16_1.nSize) - 1 do
                                table.insert(var_16_0, var_16_1.arrMaterials[iter_16_0])
                        end

                        return var_16_0
                end
        }
})

function slot_0_19_0()
        if not slot_0_2_0 then
                return
        end

        slot_0_2_0 = false
        slot_0_15_0.nRefCount = 0

        for iter_17_0, iter_17_1 in pairs(slot_0_16_0:IteratorMaterials()) do
                if not iter_17_1:IsValidate() then
                        -- block empty
                else
                        local var_17_0 = iter_17_1:GetName()

                        if not var_17_0 or not var_17_0:find("models/props") then
                                -- block empty
                        else
                                local var_17_1 = iter_17_1:Get("CMaterial2*")

                                if var_17_1 == slot_0_3_0 then
                                        -- block empty
                                else
                                        var_17_1:ColorModulate({
                                                255,
                                                255,
                                                255,
                                                255
                                        })
                                end
                        end
                end
        end
end

function slot_0_20_0()
        if not slot_0_5_0:get_value():get() then
                return
        end

        slot_0_2_0 = true
        slot_0_15_0.nRefCount = 0

        local var_18_0 = slot_0_6_0:get_value():get()
        local var_18_1 = {
                var_18_0:get_r(),
                var_18_0:get_g(),
                var_18_0:get_b()
        }

        for iter_18_0, iter_18_1 in pairs(slot_0_16_0:IteratorMaterials()) do
                if not iter_18_1:IsValidate() then
                        -- block empty
                else
                        local var_18_2 = iter_18_1:GetName()

                        if not var_18_2 or not var_18_2:find("models/props") then
                                -- block empty
                        else
                                local var_18_3 = iter_18_1:Get("CMaterial2*")

                                if var_18_3 == slot_0_3_0 then
                                        -- block empty
                                else
                                        var_18_3:ColorModulate(var_18_1)
                                end
                        end
                end
        end
end

function slot_0_21_0()
        local var_19_0 = slot_0_5_0:get_value():get()

        slot_0_9_0:set_visible(var_19_0)
        slot_0_8_0:set_visible(var_19_0)

        if var_19_0 then
                slot_0_20_0()
        else
                slot_0_19_0()
        end
end

function slot_0_22_0()
        if not slot_0_5_0:get_value():get() then
                return
        end

        slot_0_20_0()
end

function slot_0_23_0(arg_21_0)
        slot_0_15_0.nRefCount = 0

        local var_21_0 = arg_21_0:get_name()

        if var_21_0 == "round_start" then
                slot_0_20_0()
        elseif var_21_0 == "game_newmap" then
                if arg_21_0:get_string("mapname"):find("empty") then
                        return
                end

                slot_0_20_0()
        end
end

;(function()
        slot_0_21_0()
        slot_0_11_0(slot_0_19_0)
        events.event:add(slot_0_23_0)
        slot_0_5_0:add_callback(slot_0_21_0)
        mods.events:add_listener("game_newmap")
        slot_0_7_0:add_callback(slot_0_22_0)
end)()
