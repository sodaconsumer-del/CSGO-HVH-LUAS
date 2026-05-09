--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

assert(ffi, "matrix shot error: ffi is invalid, please allow insecure script")
ffi.cdef("    typedef struct {\n        float x, y, z;\n    } Vector;\n\n    typedef struct {\n        float x, y, z, w;\n    } Vector4D;\n    \n    typedef struct {\n        uint8_t r, g, b, a;\n    } Color;\n    \n    typedef struct {\n        const char* szName;\n        const char* szSurfaceProperty;\n        const char* szBoneName;\n        Vector vecMinBounds;\n        Vector vecMaxBounds;\n        float flShapeRadius;\n        uint32_t uBoneNameHash;\n        int nHitgroup;\n        uint8_t nShapeType;\n        bool bTranslationOnly;\n        char pad_02[0x2];\n        uint32_t uCRC;\n        char pad_03[0x4];\n        uint16_t nHitBoxIndex;\n        char pad_04[0x26];\n    } CHitBox;\n    \n    typedef struct {\n        CHitBox* pHitbox;\n        char pad[0x8];\n    } CSceneHitbox;\n\n    typedef struct {\n        Vector vecPosition;\n        float flScale;\n        Vector4D vecRotation;\n    } CHitboxPosition;\n\n    typedef struct {\n        uint64_t nHitboxCount;\n        void* pHitboxData;\n        char pad[0x8];\n        CSceneHitbox arrHitbox[19];\n    } CSceneHitboxData;\n\n    typedef struct {\n        uint64_t nHitboxCount;\n        char pad[0x8];\n        void* pHitboxData;\n        char pad_2[0x8];\n        CHitboxPosition arrHitbox[19];\n    } CSceneHitboxPosition;\n")

slot_0_0_0 = {}
slot_0_1_0 = {}
slot_0_2_0 = 19
slot_0_3_0 = {}
slot_0_4_0 = ffi.cast("void*", 0)
slot_0_5_0 = {
        pGameSceneNode = 816
}
slot_0_6_0 = gui.ctx:find("lua>elements a")
slot_0_7_0 = gui.combo_box(gui.control_id("MS: STYLE"))
slot_0_8_0 = gui.color_picker(gui.control_id("MS: COLOR"), true)
slot_0_9_0 = gui.slider(gui.control_id("MS: DURATION"), 1, 10, {
        "%.01fs"
}, 0.1)

slot_0_7_0:add(gui.selectable(gui.control_id("MS: DISABLE"), "Disabled"))
slot_0_7_0:add(gui.selectable(gui.control_id("MS: ALL"), "All"))
slot_0_7_0:add(gui.selectable(gui.control_id("MS: HITGROUP"), "Hitgroup"))
slot_0_6_0:add(gui.make_control("[Matrix Shot] Style", slot_0_7_0))
slot_0_6_0:add(gui.make_control("[Matrix Shot] Color", slot_0_8_0))
slot_0_6_0:add(gui.make_control("[Matrix Shot] Duration", slot_0_9_0))
slot_0_6_0:reset()

function slot_0_10_0(arg_1_0, arg_1_1, ...)
        if not slot_0_1_0[arg_1_0] then
                slot_0_1_0[arg_1_0] = ffi.new(("%s[1]"):format(arg_1_1), ...)
        end

        return ffi.cast(("%s*"):format(arg_1_1), slot_0_1_0[arg_1_0])
end

function slot_0_11_0(arg_2_0, arg_2_1, arg_2_2)
        assert(slot_0_5_0[arg_2_1], ("matrix shot error: %s schema field not found"):format(arg_2_1))

        return ffi.cast(("%s*"):format(arg_2_2), ffi.cast("uintptr_t", arg_2_0) + slot_0_5_0[arg_2_1])[0]
end

function slot_0_12_0(arg_3_0, arg_3_1)
        local var_3_0 = ffi.cast("uintptr_t", utils.find_pattern(arg_3_0, arg_3_1))

        if var_3_0 == 522ULL then
                assert(false, "matrix shot error: outdated pattern")

                return nil
        end

        return var_3_0
end

function slot_0_13_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
        assert(arg_4_0 ~= 522ULL, "matrix shot error: is a invalid address")

        arg_4_0 = ffi.cast("uintptr_t", arg_4_0)
        arg_4_0 = arg_4_0 + (arg_4_1 or 1)
        arg_4_0 = arg_4_0 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_4_0)[0])
        arg_4_0 = arg_4_0 + (arg_4_2 or 0)

        if arg_4_3 then
                return ffi.cast("uintptr_t*", arg_4_0)[0]
        end

        return arg_4_0
end

function slot_0_14_0(arg_5_0, arg_5_1, arg_5_2, ...)
        if arg_5_0 == slot_0_4_0 then
                return nil
        end

        local var_5_0 = ffi.cast("void***", arg_5_0)[0][arg_5_1]
        local var_5_1 = ("VFuncOf: %02X"):format(ffi.cast("uintptr_t", var_5_0))

        if not slot_0_0_0[var_5_1] then
                slot_0_0_0[var_5_1] = ffi.cast(arg_5_2, var_5_0)
        end

        return slot_0_0_0[var_5_1](arg_5_0, ...)
end

slot_0_15_0 = ffi.cast("void**", slot_0_13_0(slot_0_12_0("client.dll", "48 89 05 ? ? ? ? ? ? ? ? ? ? 48 8B 47 30"), 3, 0))
slot_0_16_0 = ffi.cast("void*(__fastcall*)(void*, int)", slot_0_12_0("client.dll", "48 89 5C 24 08 48 89 74 24 10 57 48 81 EC 40 01 ? ? 8B DA 48 8B F9 E8"))
slot_0_17_0 = ffi.cast("int(__fastcall*)(void*, const char*)", slot_0_12_0("client.dll", "40 53 48 83 EC 20 48 8B ? ? ? ? ? 48 8B ? 48 8B ? ? ? ? 48 8B ? 48 8B"))
slot_0_18_0 = ffi.cast("void(__fastcall*)(CSceneHitboxData*, CSceneHitboxPosition*, void*, void*, void*, bool, Color*)", slot_0_12_0("client.dll", "4C 89 44 24 18 48 89 54 24 10 48 89 4C 24 08 55 56 57 41 55 41 56 48 8D 6C 24"))

function slot_0_19_0(arg_6_0)
        slot_0_18_0(arg_6_0.pHitboxData, arg_6_0.pHitboxPosition, slot_0_15_0[0], slot_0_4_0, slot_0_4_0, true, arg_6_0.pColor)
end

function slot_0_20_0(arg_7_0)
        if type(arg_7_0) == "cdata" then
                return arg_7_0
        elseif type(arg_7_0) == "userdata" then
                return ffi.cast("void**", arg_7_0)[0]
        end

        return false
end

function slot_0_21_0(arg_8_0)
        local var_8_0 = slot_0_11_0(arg_8_0, "pGameSceneNode", "void*")

        if var_8_0 == slot_0_4_0 then
                return false
        end

        local var_8_1 = slot_0_14_0(var_8_0, 8, "void*(__thiscall*)(void*)")

        if var_8_1 == slot_0_4_0 then
                return false
        end

        return var_8_1
end

function slot_0_22_0(arg_9_0, arg_9_1)
        local var_9_0 = slot_0_21_0(arg_9_0)

        if not var_9_0 or var_9_0 == slot_0_4_0 then
                return false
        end

        local var_9_1 = ffi.cast("CHitboxPosition**", ffi.cast("uintptr_t", var_9_0) + 400 + 128)[0]

        if var_9_1 == slot_0_4_0 then
                return false
        end

        return var_9_1[arg_9_1]
end

function slot_0_23_0(arg_10_0, arg_10_1)
        local var_10_0 = ffi.cast("uintptr_t", slot_0_16_0(arg_10_0, 0))

        if var_10_0 == 522ULL then
                return false
        end

        local var_10_1 = ffi.cast("int*", var_10_0 + 16)[0]

        if arg_10_1 < 0 or var_10_1 <= 0 or var_10_1 < arg_10_1 then
                return false
        end

        local var_10_2 = ffi.cast("CHitBox**", var_10_0 + 24)[0]

        if var_10_2 == slot_0_4_0 then
                return false
        end

        return var_10_2 + arg_10_1
end

function slot_0_24_0(arg_11_0, arg_11_1)
        local var_11_0 = slot_0_20_0(arg_11_0)

        if not var_11_0 or var_11_0 == slot_0_4_0 then
                return false
        end

        local var_11_1 = slot_0_23_0(var_11_0, arg_11_1)

        if not var_11_1 or var_11_1.szName == slot_0_4_0 or var_11_1.szName[0] == 0 then
                return false
        end

        local var_11_2 = slot_0_17_0(var_11_0, var_11_1.szName)

        if var_11_2 < 0 or var_11_2 > 128 then
                return false
        end

        return var_11_1, slot_0_22_0(var_11_0, var_11_2)
end

function slot_0_25_0(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
        local var_12_0 = slot_0_20_0(arg_12_0)

        if not var_12_0 or var_12_0 == slot_0_4_0 or arg_12_2:get_a() <= 0 then
                return
        end

        if type(arg_12_1) == "boolean" then
                local var_12_1 = 0
                local var_12_2 = slot_0_10_0("AddDrawHitbox::Color", "Color")
                local var_12_3 = slot_0_10_0("AddDrawHitbox::HitboxData", "CSceneHitboxData")
                local var_12_4 = slot_0_10_0("AddDrawHitbox::HitboxPosition", "CSceneHitboxPosition")

                for iter_12_0 = 0, slot_0_2_0 - 1 do
                        local var_12_5, var_12_6 = slot_0_24_0(arg_12_0, iter_12_0)

                        if not var_12_5 or not var_12_6 then
                                -- block empty
                        else
                                var_12_3.arrHitbox[var_12_1].pHitbox = var_12_5
                                var_12_4.arrHitbox[var_12_1].flScale = var_12_6.flScale
                                var_12_4.arrHitbox[var_12_1].vecRotation = var_12_6.vecRotation
                                var_12_4.arrHitbox[var_12_1].vecPosition = var_12_6.vecPosition
                                var_12_1 = var_12_1 + 1
                        end
                end

                var_12_2.r = arg_12_2:get_r()
                var_12_2.g = arg_12_2:get_g()
                var_12_2.b = arg_12_2:get_b()
                var_12_2.a = arg_12_2:get_a()
                var_12_3.nHitboxCount = var_12_1
                var_12_4.nHitboxCount = var_12_1
                var_12_3.pHitboxData = var_12_3.arrHitbox
                var_12_4.pHitboxData = var_12_4.arrHitbox

                table.insert(slot_0_3_0, {
                        pColor = var_12_2,
                        flDuration = arg_12_3,
                        pHitboxData = var_12_3,
                        pHitboxPosition = var_12_4,
                        flStartTime = game.global_vars.cur_time
                })
        elseif type(arg_12_1) == "number" then
                local var_12_7 = 0
                local var_12_8 = slot_0_10_0("AddDrawHitbox::Color", "Color")
                local var_12_9 = ffi.cast("CSceneHitboxData*", ffi.new("CSceneHitboxData[1]"))
                local var_12_10 = ffi.cast("CSceneHitboxPosition*", ffi.new("CSceneHitboxPosition[1]"))

                for iter_12_1 = 0, slot_0_2_0 - 1 do
                        local var_12_11, var_12_12 = slot_0_24_0(arg_12_0, iter_12_1)

                        if not var_12_11 or not var_12_12 or var_12_11.nHitgroup ~= arg_12_1 then
                                -- block empty
                        else
                                var_12_9.arrHitbox[var_12_7].pHitbox = var_12_11
                                var_12_10.arrHitbox[var_12_7].flScale = var_12_12.flScale
                                var_12_10.arrHitbox[var_12_7].vecRotation = var_12_12.vecRotation
                                var_12_10.arrHitbox[var_12_7].vecPosition = var_12_12.vecPosition
                                var_12_7 = var_12_7 + 1
                        end
                end

                var_12_8.r = arg_12_2:get_r()
                var_12_8.g = arg_12_2:get_g()
                var_12_8.b = arg_12_2:get_b()
                var_12_8.a = arg_12_2:get_a()
                var_12_9.nHitboxCount = var_12_7
                var_12_10.nHitboxCount = var_12_7
                var_12_9.pHitboxData = var_12_9.arrHitbox
                var_12_10.pHitboxData = var_12_10.arrHitbox

                table.insert(slot_0_3_0, {
                        pColor = var_12_8,
                        flDuration = arg_12_3,
                        pHitboxData = var_12_9,
                        pHitboxPosition = var_12_10,
                        flStartTime = game.global_vars.cur_time
                })
        end
end

function slot_0_26_0(arg_13_0)
        if arg_13_0 ~= client_frame_stage.render_start or not game.engine:in_game() or #slot_0_3_0 == 0 then
                return
        end

        for iter_13_0, iter_13_1 in pairs(slot_0_3_0) do
                if math.abs(game.global_vars.cur_time - iter_13_1.flStartTime) > iter_13_1.flDuration then
                        table.remove(slot_0_3_0, iter_13_0)
                else
                        slot_0_19_0(iter_13_1)
                end
        end
end

function slot_0_27_0(arg_14_0)
        local var_14_0 = slot_0_7_0:get_value():get():get_raw()

        if arg_14_0:get_name() ~= "player_hurt" or var_14_0 == 1 then
                return
        end

        local var_14_1 = arg_14_0:get_controller("userid")
        local var_14_2 = arg_14_0:get_controller("attacker")

        if not var_14_2 or not var_14_1 or not var_14_2.m_bIsLocalPlayerController:get() or var_14_1.m_bIsLocalPlayerController:get() then
                return
        end

        local var_14_3 = var_14_1:get_pawn()

        if not var_14_3 then
                return
        end

        local var_14_4 = var_14_0 == 2
        local var_14_5 = arg_14_0:get_int("hitgroup")
        local var_14_6 = slot_0_8_0:get_value():get()
        local var_14_7 = slot_0_9_0:get_value():get()

        if var_14_5 <= 0 or var_14_5 >= 9 or var_14_4 then
                slot_0_25_0(var_14_3, true, var_14_6, var_14_7)

                return
        end

        slot_0_25_0(var_14_3, var_14_5, var_14_6, var_14_7)
end

events.event:add(slot_0_27_0)
mods.events:add_listener("player_hurt")
events.frame_stage_notify:add(slot_0_26_0)
