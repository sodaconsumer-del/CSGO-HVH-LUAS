--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = true
slot_0_1_0 = {
        SCRIPT_NAME = "AI Peek Trial",
        DEBUG = false,
        GIST_ID = "9ffb3a8a6fe3d8e17e3a93008062d604",
        DISCORD_URL = "https://discord.gg/8jQVnmnwwE",
        GITHUB_TOKEN = "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",
        MAX_SECONDS = 3600,
        SAVE_INTERVAL = 30,
        UPDATE_INTERVAL = 1
}

if slot_0_0_0 and not ffi then
        if gui and gui.notify then
                gui.notify:Add(gui.notification(slot_0_1_0.SCRIPT_NAME, "ERROR: FFI is not enabled!"))
        end

        return
end

if not ffi then
        gui.notify:Add(gui.notification("AI Peek", "ERROR: FFI is not enabled!"))

        slot_0_2_1 = gui.notification("AI Peek", "Turn On FFI First!")

        if gui.notify then
                gui.notify:Add(slot_0_2_1)
        end

        return
end

slot_0_2_0 = {
        get = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
                if not arg_1_1 then
                        return
                end

                if not arg_1_2 then
                        return
                end

                local var_1_0 = arg_1_1[arg_1_2]

                if not var_1_0 then
                        return
                end

                local var_1_1 = ffi.cast("uintptr_t*", var_1_0)[0]

                if var_1_1 == 0 then
                        return
                end

                local var_1_2 = ffi.cast("uintptr_t*", var_1_1)[0]
                local var_1_3 = ffi.cast("uint32_t*", var_1_1)[2]

                return ffi.cast(arg_1_3, var_1_2 + var_1_3)[0]
        end,
        get_offset = function(arg_2_0, arg_2_1, arg_2_2)
                if not arg_2_1 then
                        return 0
                end

                if not arg_2_2 then
                        return 0
                end

                local var_2_0 = arg_2_1[arg_2_2]

                if not var_2_0 then
                        return 0
                end

                if type(var_2_0) == "cdata" and var_2_0.offset then
                        return var_2_0.offset
                end

                local var_2_1 = ffi.cast("uintptr_t*", var_2_0)[0]

                if var_2_1 == 0 then
                        return 0
                end

                return ffi.cast("uint32_t*", var_2_1)[2]
        end
}
slot_0_3_0 = 0
slot_0_4_0 = 0
slot_0_5_0 = 0
slot_0_6_0 = 0
slot_0_7_1 = entities.get_local_pawn()

if slot_0_7_1 then
        slot_0_8_1 = slot_0_7_1:get_active_weapon()

        if slot_0_8_1 then
                slot_0_3_0 = slot_0_2_0:get_offset(slot_0_8_1, "m_nNextPrimaryAttackTick")
        end

        slot_0_4_0 = slot_0_2_0:get_offset(slot_0_7_1, "m_pGameSceneNode")
        slot_0_6_0 = slot_0_2_0:get_offset(slot_0_7_1, "m_skeletonInstance")
        slot_0_5_0 = 352
end

print(string.format("[AI Peek Init] Offsets loaded: m_nNextPrimaryAttackTick=0x%X, m_pGameSceneNode=0x%X, m_skeletonInstance=0x%X, m_modelState=0x%X", slot_0_3_0, slot_0_4_0, slot_0_6_0, slot_0_5_0))

slot_0_7_0 = false
slot_0_8_0 = 0
slot_0_9_0 = 0
pen_distance_cycle = 0
slot_0_10_0 = {
        pelvis = 0,
        stomach = 2,
        chest = 4,
        neck = 5,
        head = 6
}

ffi.cdef("    typedef struct {\n        float x;\n        float y;\n        float z;\n    } Vector;\n")

function GetBonePosition(arg_3_0, arg_3_1)
        local var_3_0 = vector(0, 0, 0)

        if not arg_3_0 then
                return nil
        end

        local var_3_1 = ffi.cast("uintptr_t*", arg_3_0)[0]

        if not var_3_1 then
                return nil
        end

        local var_3_2 = ffi.cast("uintptr_t*", var_3_1 + slot_0_4_0)[0]

        if var_3_2 == 0 then
                return nil
        end

        local var_3_3 = ffi.cast("uintptr_t*", var_3_2 + slot_0_5_0 + slot_0_6_0)[0]

        if var_3_3 == 0 then
                return nil
        end

        local var_3_4 = var_3_3 + arg_3_1 * 32
        local var_3_5 = ffi.cast("Vector*", var_3_4)[0]

        if var_3_5 == nil then
                return nil
        end

        var_3_0.x = var_3_5.x
        var_3_0.y = var_3_5.y
        var_3_0.z = var_3_5.z

        return var_3_0
end

if mods and mods.penetration and mods.penetration.FireBullet then
        slot_0_7_0 = true

        if gui and gui.notify then
                gui.notify:Add(gui.notification("AI Peek", "Penetration API loaded successfully!"))
        end
elseif gui and gui.notify then
        gui.notify:Add(gui.notification("AI Peek", "Penetration API not available - wallbang features disabled"))
end

function slot_0_11_0()
        if not slot_0_7_0 then
                return
        end

        local var_4_0 = entities.get_local_pawn()

        if not var_4_0 or not var_4_0:is_alive() then
                return
        end

        local var_4_1 = var_4_0:get_eye_pos()

        if not var_4_1 then
                return
        end

        local var_4_2 = var_4_0:get_active_weapon()

        if not var_4_2 then
                return
        end

        local var_4_3 = var_4_0.m_iTeamNum and var_4_0.m_iTeamNum:get() or 0
        local var_4_4 = draw.surface

        entities.players:for_each(function(arg_5_0)
                if not arg_5_0 then
                        return
                end

                slot_5_1_0 = arg_5_0.entity

                if not slot_5_1_0 or slot_5_1_0 == var_4_0 or not slot_5_1_0:is_alive() then
                        return
                end

                if (slot_5_1_0.m_iTeamNum and slot_5_1_0.m_iTeamNum:get() or 0) == var_4_3 then
                        return
                end

                slot_5_3_0 = slot_5_1_0.m_iHealth and slot_5_1_0.m_iHealth:get() or 100
                slot_5_4_0 = slot_5_1_0:get_abs_origin()

                if not slot_5_4_0 then
                        return
                end

                slot_5_5_0 = 0
                slot_5_6_0 = slot_5_1_0.m_vecViewOffset

                if slot_5_6_0 then
                        slot_5_7_3 = slot_5_6_0:get()

                        if slot_5_7_3 and slot_5_7_3.z then
                                slot_5_8_2 = slot_5_7_3.z

                                if slot_5_8_2 < 50 then
                                        slot_5_5_0 = 1
                                elseif slot_5_8_2 < 60 then
                                        slot_5_5_0 = (64 - slot_5_8_2) / 18
                                end
                        end
                end

                if slot_5_5_0 == 0 then
                        slot_5_7_2 = slot_5_1_0.m_pMovementServices

                        if slot_5_7_2 then
                                slot_5_8_1 = slot_5_7_2:get()

                                if slot_5_8_1 then
                                        slot_5_9_1 = slot_5_8_1.m_flDuckAmount

                                        if slot_5_9_1 then
                                                slot_5_10_1 = slot_5_9_1:get()

                                                if slot_5_10_1 and slot_5_10_1 > 0 then
                                                        slot_5_5_0 = slot_5_10_1
                                                end
                                        end
                                end
                        end
                end

                if slot_5_5_0 == 0 and slot_5_1_0.m_fFlags then
                        slot_5_7_1 = slot_5_1_0.m_fFlags:get()

                        if slot_5_7_1 and (bit.band(slot_5_7_1, 2) ~= 0 or bit.band(slot_5_7_1, 4) ~= 0) then
                                slot_5_5_0 = 1
                        end
                end

                slot_5_7_0 = slot_5_5_0 * 18
                slot_5_8_0 = 3
                slot_5_9_0 = 1

                if C and C.pen_points_per_hitbox then
                        slot_5_8_0 = C.pen_points_per_hitbox:get_value():get()
                end

                if C and C.pen_min_damage then
                        slot_5_9_0 = C.pen_min_damage:get_value():get()
                end

                slot_5_10_0 = GetBonePosition(slot_5_1_0, slot_0_10_0.head)
                slot_5_11_0 = GetBonePosition(slot_5_1_0, slot_0_10_0.neck)
                slot_5_12_0 = GetBonePosition(slot_5_1_0, slot_0_10_0.chest)
                slot_5_13_0 = GetBonePosition(slot_5_1_0, slot_0_10_0.stomach)
                slot_5_14_0 = GetBonePosition(slot_5_1_0, slot_0_10_0.pelvis)
                slot_5_15_0 = {}

                function slot_5_16_0(arg_6_0, arg_6_1, arg_6_2)
                        if not arg_6_0 then
                                return
                        end

                        table.insert(slot_5_15_0, {
                                pos = arg_6_0,
                                name = arg_6_1,
                                priority = arg_6_2
                        })

                        if slot_5_8_0 >= 3 then
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x, arg_6_0.y + 3, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x, arg_6_0.y - 3, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                        end

                        if slot_5_8_0 >= 5 then
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x + 3, arg_6_0.y, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x - 3, arg_6_0.y, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                        end

                        if slot_5_8_0 >= 9 then
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x + 3, arg_6_0.y + 3, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x - 3, arg_6_0.y + 3, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x + 3, arg_6_0.y - 3, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                                table.insert(slot_5_15_0, {
                                        pos = vector(arg_6_0.x - 3, arg_6_0.y - 3, arg_6_0.z),
                                        name = arg_6_1,
                                        priority = arg_6_2
                                })
                        end
                end

                function slot_5_17_0(arg_7_0, arg_7_1, arg_7_2)
                        table.insert(slot_5_15_0, {
                                name = "LEG_L",
                                pos = vector(arg_7_0.x - 8, arg_7_0.y, arg_7_0.z + 20 - arg_7_1 * 0.5),
                                priority = arg_7_2
                        })
                        table.insert(slot_5_15_0, {
                                name = "LEG_R",
                                pos = vector(arg_7_0.x + 8, arg_7_0.y, arg_7_0.z + 20 - arg_7_1 * 0.5),
                                priority = arg_7_2 + 1
                        })
                end

                if C.hb_head:get_value():get() and slot_5_10_0 then
                        slot_5_16_0(slot_5_10_0, "HEAD", 1)
                end

                if C.hb_chest:get_value():get() then
                        if slot_5_11_0 then
                                slot_5_16_0(slot_5_11_0, "NECK", 2)
                        end

                        if slot_5_12_0 then
                                slot_5_16_0(slot_5_12_0, "CHEST", 3)
                        end
                end

                if C.hb_stomach:get_value():get() and slot_5_13_0 then
                        slot_5_16_0(slot_5_13_0, "STOMACH", 4)
                end

                if C.hb_legs:get_value():get() then
                        if slot_5_14_0 then
                                slot_5_16_0(slot_5_14_0, "PELVIS", 6)
                        end

                        slot_5_17_0(slot_5_4_0, slot_5_7_0, 7)
                end

                if C.hb_feet:get_value():get() then
                        table.insert(slot_5_15_0, {
                                name = "FOOT_L",
                                priority = 8,
                                pos = vector(slot_5_4_0.x - 12, slot_5_4_0.y, slot_5_4_0.z + 5 - slot_5_7_0 * 0.5)
                        })
                        table.insert(slot_5_15_0, {
                                name = "FOOT_R",
                                priority = 8,
                                pos = vector(slot_5_4_0.x + 12, slot_5_4_0.y, slot_5_4_0.z + 5 - slot_5_7_0 * 0.5)
                        })
                end

                if #slot_5_15_0 == 0 then
                        return
                end

                slot_5_18_0 = nil
                slot_5_19_0 = ""
                slot_5_20_0 = 0
                slot_5_21_0 = draw.surface
                slot_5_22_0 = {}

                for iter_5_0, iter_5_1 in ipairs(slot_5_15_0) do
                        slot_5_28_1 = vector(iter_5_1.pos.x - var_4_1.x, iter_5_1.pos.y - var_4_1.y, iter_5_1.pos.z - var_4_1.z)
                        slot_5_29_1, slot_5_30_1 = mods.penetration.FireBullet(var_4_1, slot_5_28_1, var_4_2, slot_5_1_0, false, false)
                        slot_5_31_0 = 0

                        if slot_5_30_1 and slot_5_30_1.damage then
                                slot_5_31_0 = slot_5_30_1.damage
                        end

                        table.insert(slot_5_22_0, {
                                hitbox = iter_5_1,
                                damage = slot_5_31_0
                        })

                        if slot_5_9_0 <= slot_5_31_0 and (not slot_5_18_0 or iter_5_1.priority < slot_5_18_0.priority or iter_5_1.priority == slot_5_18_0.priority and slot_5_20_0 < slot_5_31_0) then
                                slot_5_18_0 = {
                                        damage = slot_5_31_0,
                                        priority = iter_5_1.priority
                                }
                                slot_5_19_0 = iter_5_1.name
                                slot_5_20_0 = slot_5_31_0
                        end
                end

                for iter_5_2, iter_5_3 in ipairs(slot_5_22_0) do
                        slot_5_28_0 = math.world_to_screen(iter_5_3.hitbox.pos)

                        if slot_5_28_0 then
                                slot_5_29_0 = nil
                                slot_5_30_0 = math.floor(iter_5_3.damage)

                                if slot_5_3_0 <= slot_5_30_0 then
                                        slot_5_29_0 = draw.Color(0, 255, 0, 255)
                                elseif slot_5_30_0 > 0 then
                                        slot_5_29_0 = draw.Color(255, 200, 0, 255)
                                else
                                        slot_5_29_0 = draw.Color(255, 50, 50, 200)
                                end

                                slot_5_21_0:AddCircleFilled(draw.Vec2(slot_5_28_0.x, slot_5_28_0.y), 4, slot_5_29_0)

                                if slot_5_30_0 > 0 then
                                        slot_5_21_0.font = draw.fonts.gui_small

                                        slot_5_21_0:AddText(draw.Vec2(slot_5_28_0.x + 6, slot_5_28_0.y - 4), tostring(slot_5_30_0), slot_5_29_0)
                                end
                        end
                end

                slot_5_23_0 = math.world_to_screen(slot_5_4_0)

                if not slot_5_23_0 then
                        return
                end

                slot_5_24_0 = ""
                slot_5_25_0 = draw.Color(255, 50, 50, 255)

                if slot_5_18_0 and slot_5_18_0.damage and slot_5_18_0.damage > 0 then
                        slot_5_26_1 = math.floor(slot_5_18_0.damage)

                        if slot_5_3_0 <= slot_5_26_1 then
                                slot_5_24_0 = "LETHAL WB [" .. slot_5_19_0 .. "] -" .. slot_5_26_1
                                slot_5_25_0 = draw.Color(0, 255, 0, 255)
                        elseif slot_5_26_1 > 0 then
                                slot_5_24_0 = "WB [" .. slot_5_19_0 .. "] -" .. slot_5_26_1
                                slot_5_25_0 = draw.Color(255, 200, 0, 255)
                        end
                else
                        slot_5_24_0 = "NO PEN"
                end

                if slot_5_24_0 ~= "" then
                        slot_5_21_0.font = draw.fonts.gui_bold
                        slot_5_26_0 = slot_5_23_0.x - 50
                        slot_5_27_0 = slot_5_23_0.y - 40

                        slot_5_21_0:AddRectFilled(draw.rect(slot_5_26_0 - 4, slot_5_27_0 - 2, slot_5_26_0 + 140, slot_5_27_0 + 14), draw.Color(20, 20, 20, 180))
                        slot_5_21_0:AddText(draw.Vec2(slot_5_26_0, slot_5_27_0), slot_5_24_0, slot_5_25_0)
                end
        end)
end

slot_0_12_0 = nil

if slot_0_0_0 then
        if http and http.Get then
                slot_0_12_0 = {
                        get = function(arg_8_0, arg_8_1, arg_8_2)
                                http.Get(arg_8_0, {
                                        headers = arg_8_1
                                }, function(arg_9_0, arg_9_1)
                                        local var_9_0 = arg_9_0 and arg_9_0 ~= false and arg_9_0 >= 200 and arg_9_0 < 300

                                        arg_8_2(var_9_0, {
                                                status = arg_9_0 or 0,
                                                body = arg_9_1
                                        })
                                end)
                        end,
                        post = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
                                http.Post(arg_10_0, {
                                        contentType = "application/json",
                                        headers = arg_10_1,
                                        data = arg_10_2
                                }, function(arg_11_0, arg_11_1)
                                        local var_11_0 = arg_11_0 and arg_11_0 ~= false and arg_11_0 >= 200 and arg_11_0 < 300

                                        arg_10_3(var_11_0, {
                                                status = arg_11_0 or 0,
                                                body = arg_11_1
                                        })
                                end)
                        end
                }

                if gui and gui.notify then
                        gui.notify:Add(gui.notification(slot_0_1_0.SCRIPT_NAME, "HTTP API loaded successfully!"))
                end
        else
                if gui and gui.notify then
                        gui.notify:Add(gui.notification(slot_0_1_0.SCRIPT_NAME, "HTTP API not available! Enable insecure mode."))
                end

                return
        end
end

slot_0_13_0 = nil

if not __aipeek_shell32_defined then
        ffi.cdef(" typedef void* HWND_SHELL; typedef const char* LPCSTR_SHELL; typedef void* (__stdcall *ShellExecuteA_t)(HWND_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, int); ")

        __aipeek_shell32_defined = true
end

slot_0_14_0 = utils.find_export("shell32.dll", "ShellExecuteA")

if slot_0_14_0 then
        slot_0_13_0 = ffi.cast("ShellExecuteA_t", slot_0_14_0)
end

function slot_0_15_0(arg_12_0)
        if slot_0_13_0 then
                slot_0_13_0(nil, "open", arg_12_0, nil, nil, 1)
        end
end

slot_0_16_0 = {
        last_save = 0,
        last_update = 0,
        script_enabled = false,
        connection_failed = false,
        data_loaded = false,
        github_sha = nil,
        init_complete = false,
        username = "unknown",
        used_seconds = 0,
        is_blocked = false,
        session_start = 0,
        is_licensed = false,
        all_users_data = {}
}

function slot_0_17_0()
        if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
                return gui.ctx.user.username
        end

        return "unknown"
end

slot_0_18_0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

function slot_0_19_0(arg_14_0)
        return (arg_14_0:gsub(".", function(arg_15_0)
                local var_15_0 = ""
                local var_15_1 = arg_15_0:byte()

                for iter_15_0 = 8, 1, -1 do
                        var_15_0 = var_15_0 .. (var_15_1 % 2^iter_15_0 - var_15_1 % 2^(iter_15_0 - 1) > 0 and "1" or "0")
                end

                return var_15_0
        end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg_16_0)
                if #arg_16_0 < 6 then
                        return ""
                end

                local var_16_0 = 0

                for iter_16_0 = 1, 6 do
                        var_16_0 = var_16_0 + (arg_16_0:sub(iter_16_0, iter_16_0) == "1" and 2^(6 - iter_16_0) or 0)
                end

                return slot_0_18_0:sub(var_16_0 + 1, var_16_0 + 1)
        end) .. ({
                "",
                "==",
                "="
        })[#arg_14_0 % 3 + 1]
end

function slot_0_20_0(arg_17_0)
        arg_17_0 = arg_17_0:gsub("[^" .. slot_0_18_0 .. "=]", "")

        return (arg_17_0:gsub(".", function(arg_18_0)
                if arg_18_0 == "=" then
                        return ""
                end

                local var_18_0 = ""
                local var_18_1 = slot_0_18_0:find(arg_18_0) - 1

                for iter_18_0 = 6, 1, -1 do
                        var_18_0 = var_18_0 .. (var_18_1 % 2^iter_18_0 - var_18_1 % 2^(iter_18_0 - 1) > 0 and "1" or "0")
                end

                return var_18_0
        end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(arg_19_0)
                if #arg_19_0 ~= 8 then
                        return ""
                end

                local var_19_0 = 0

                for iter_19_0 = 1, 8 do
                        var_19_0 = var_19_0 + (arg_19_0:sub(iter_19_0, iter_19_0) == "1" and 2^(8 - iter_19_0) or 0)
                end

                return string.char(var_19_0)
        end))
end

function slot_0_21_0(arg_20_0)
        local var_20_0 = {
                users = {},
                _licensed = {}
        }

        if not arg_20_0 then
                return var_20_0
        end

        arg_20_0 = arg_20_0:gsub("%s+", "")

        local var_20_1 = arg_20_0:match("\"users\":{(.-)}")

        if var_20_1 then
                for iter_20_0, iter_20_1 in var_20_1:gmatch("\"([^\"]+)\":(%d+)") do
                        var_20_0.users[iter_20_0:lower()] = tonumber(iter_20_1)
                end
        end

        local var_20_2 = arg_20_0:match("\"licensed\":%[(.-)%]")

        if var_20_2 then
                for iter_20_2 in var_20_2:gmatch("\"([^\"]+)\"") do
                        var_20_0._licensed[iter_20_2:lower()] = true
                end
        end

        return var_20_0
end

function slot_0_22_0(arg_21_0, arg_21_1)
        local var_21_0 = {}

        for iter_21_0, iter_21_1 in pairs(arg_21_0) do
                table.insert(var_21_0, "\"" .. iter_21_0 .. "\":" .. iter_21_1)
        end

        local var_21_1 = {}

        if arg_21_1 then
                for iter_21_2, iter_21_3 in pairs(arg_21_1) do
                        table.insert(var_21_1, "\"" .. iter_21_2 .. "\"")
                end
        end

        return "{\"users\":{" .. table.concat(var_21_0, ",") .. "},\"licensed\":[" .. table.concat(var_21_1, ",") .. "]}"
end

function slot_0_23_0(arg_22_0)
        if gui and gui.notify then
                local var_22_0 = slot_0_0_0 and slot_0_1_0.SCRIPT_NAME or "AI Peek"

                gui.notify:Add(gui.notification(var_22_0, arg_22_0))
        end
end

function slot_0_24_0(arg_23_0)
        if slot_0_0_0 and slot_0_1_0.DEBUG and gui and gui.notify then
                gui.notify:Add(gui.notification("[DEBUG]", arg_23_0))
        end
end

function slot_0_25_0(arg_24_0)
        if not slot_0_0_0 then
                return
        end

        local var_24_0 = "https://api.github.com/gists/" .. slot_0_1_0.GIST_ID
        local var_24_1 = {
                ["User-Agent"] = "FatalityScript",
                Accept = "application/vnd.github.v3+json",
                Authorization = "Bearer " .. slot_0_1_0.GITHUB_TOKEN
        }

        slot_0_24_0("Loading: " .. slot_0_16_0.username)
        slot_0_12_0.get(var_24_0, var_24_1, function(arg_25_0, arg_25_1)
                if arg_25_0 and arg_25_1.body then
                        slot_0_24_0("Response received")

                        local var_25_0 = utils.JsonDecode(arg_25_1.body)

                        if not var_25_0 or not var_25_0.files then
                                slot_0_24_0("Invalid gist response!")

                                slot_0_16_0.data_loaded, slot_0_16_0.connection_failed, slot_0_16_0.script_enabled, slot_0_16_0.init_complete = false, true, false, true

                                if arg_24_0 then
                                        arg_24_0(false)
                                end

                                return
                        end

                        local var_25_1 = var_25_0.files["trial_data.json"]

                        if not var_25_1 or not var_25_1.content then
                                slot_0_24_0("No trial_data.json found!")

                                slot_0_16_0.data_loaded, slot_0_16_0.connection_failed, slot_0_16_0.script_enabled, slot_0_16_0.init_complete = false, true, false, true

                                if arg_24_0 then
                                        arg_24_0(false)
                                end

                                return
                        end

                        local var_25_2 = var_25_1.content

                        slot_0_24_0("Content: " .. var_25_2)

                        local var_25_3 = utils.JsonDecode(var_25_2)

                        if not var_25_3 then
                                slot_0_24_0("Invalid JSON in content!")

                                slot_0_16_0.data_loaded, slot_0_16_0.connection_failed, slot_0_16_0.script_enabled, slot_0_16_0.init_complete = false, true, false, true

                                if arg_24_0 then
                                        arg_24_0(false)
                                end

                                return
                        end

                        slot_0_16_0.all_users_data = var_25_3

                        local var_25_4 = slot_0_16_0.username:lower()
                        local var_25_5 = slot_0_16_0.username:lower():gsub("[^%w]", "_")

                        slot_0_24_0("Key: " .. var_25_5)

                        if var_25_3.users and var_25_3.users[var_25_5] then
                                slot_0_16_0.used_seconds = var_25_3.users[var_25_5]

                                slot_0_24_0("Found: " .. slot_0_16_0.used_seconds .. "s")
                        else
                                slot_0_16_0.used_seconds = 0

                                slot_0_24_0("New user (no data for " .. var_25_5 .. ")")
                        end

                        if var_25_3.licensed then
                                for iter_25_0, iter_25_1 in ipairs(var_25_3.licensed) do
                                        if iter_25_1:lower() == var_25_4 then
                                                slot_0_16_0.is_licensed = true

                                                break
                                        end
                                end
                        end

                        slot_0_16_0.data_loaded, slot_0_16_0.connection_failed = true, false

                        if slot_0_16_0.used_seconds >= slot_0_1_0.MAX_SECONDS and not slot_0_16_0.is_licensed then
                                slot_0_16_0.is_blocked, slot_0_16_0.script_enabled = true, false
                        else
                                slot_0_16_0.script_enabled = true
                        end

                        slot_0_16_0.init_complete = true

                        if arg_24_0 then
                                arg_24_0(true)
                        end
                else
                        slot_0_24_0("Failed! Status: " .. tostring(arg_25_1.status))

                        if arg_25_1.body then
                                slot_0_24_0("Error: " .. string.sub(arg_25_1.body, 1, 100))
                        end

                        slot_0_16_0.data_loaded, slot_0_16_0.connection_failed, slot_0_16_0.script_enabled, slot_0_16_0.init_complete = false, true, false, true

                        if arg_24_0 then
                                arg_24_0(false)
                        end
                end
        end)
end

function slot_0_26_0()
        if not slot_0_0_0 or slot_0_16_0.is_licensed then
                return
        end

        local var_26_0 = slot_0_16_0.username:lower()
        local var_26_1 = slot_0_16_0.username:lower():gsub("[^%w]", "_")

        if not slot_0_16_0.all_users_data.users then
                slot_0_16_0.all_users_data.users = {}
        end

        slot_0_16_0.all_users_data.users[var_26_1] = slot_0_16_0.used_seconds

        local var_26_2 = utils.JsonEncode(slot_0_16_0.all_users_data)
        local var_26_3 = {
                files = {
                        ["trial_data.json"] = {
                                content = var_26_2
                        }
                }
        }
        local var_26_4 = utils.JsonEncode(var_26_3)
        local var_26_5 = "https://api.github.com/gists/" .. slot_0_1_0.GIST_ID
        local var_26_6 = {
                ["User-Agent"] = "FatalityScript",
                Accept = "application/vnd.github.v3+json",
                Authorization = "Bearer " .. slot_0_1_0.GITHUB_TOKEN
        }

        slot_0_24_0("Saving: " .. var_26_1)
        slot_0_12_0.post(var_26_5, var_26_6, var_26_4, function(arg_27_0, arg_27_1)
                if arg_27_0 then
                        slot_0_24_0("Save: OK")
                else
                        slot_0_24_0("Save: Failed " .. tostring(arg_27_1.status))

                        if arg_27_1.body then
                                slot_0_24_0("Error: " .. string.sub(arg_27_1.body, 1, 100))
                        end
                end
        end)
end

function slot_0_27_0()
        if game and game.global_vars then
                return game.global_vars.real_time or 0
        end

        return 0
end

function slot_0_28_0()
        if not slot_0_0_0 then
                slot_0_16_0.init_complete, slot_0_16_0.script_enabled, slot_0_16_0.is_licensed, slot_0_16_0.data_loaded = true, true, true, true

                return
        end

        slot_0_16_0.username, slot_0_16_0.session_start, slot_0_16_0.last_update, slot_0_16_0.last_save = slot_0_17_0(), slot_0_27_0(), slot_0_27_0(), slot_0_27_0()

        slot_0_24_0("User: " .. slot_0_16_0.username)
        slot_0_23_0("Connecting...")
        slot_0_25_0(function(arg_30_0)
                if arg_30_0 then
                        if slot_0_16_0.is_licensed then
                                slot_0_23_0("Licensed! Full access.")
                        elseif slot_0_16_0.is_blocked then
                                slot_0_23_0("Trial expired!")

                                if hide_all_ui then
                                        hide_all_ui()
                                end
                        else
                                local var_30_0 = slot_0_1_0.MAX_SECONDS - slot_0_16_0.used_seconds
                                local var_30_1 = math.floor((slot_0_1_0.MAX_SECONDS - slot_0_16_0.used_seconds) / 60)
                                local var_30_2 = (slot_0_1_0.MAX_SECONDS - slot_0_16_0.used_seconds) % 60

                                slot_0_23_0("Trial: " .. var_30_1 .. "m " .. var_30_2 .. "s left")
                        end
                else
                        slot_0_23_0("Connection failed!")

                        if hide_all_ui then
                                hide_all_ui()
                        end
                end
        end)
end

function slot_0_29_0()
        if not slot_0_0_0 then
                return true
        end

        if not slot_0_16_0.init_complete or slot_0_16_0.connection_failed then
                return false
        end

        if slot_0_16_0.is_licensed then
                return true
        end

        if slot_0_16_0.is_blocked then
                return false
        end

        return slot_0_16_0.script_enabled
end

function slot_0_30_0()
        if not slot_0_0_0 or slot_0_16_0.connection_failed or slot_0_16_0.is_licensed or slot_0_16_0.is_blocked or not slot_0_16_0.data_loaded then
                return
        end

        local var_32_0 = slot_0_27_0()
        local var_32_1 = slot_0_27_0() - slot_0_16_0.last_update

        if var_32_1 >= slot_0_1_0.UPDATE_INTERVAL then
                slot_0_16_0.used_seconds, slot_0_16_0.last_update = math.floor(slot_0_16_0.used_seconds + var_32_1), var_32_0

                if slot_0_16_0.used_seconds >= slot_0_1_0.MAX_SECONDS then
                        slot_0_16_0.is_blocked, slot_0_16_0.script_enabled = true, false

                        slot_0_23_0("Trial expired!")
                        slot_0_26_0()

                        if hide_all_ui then
                                hide_all_ui()
                        end
                else
                        if var_32_0 - slot_0_16_0.last_save >= slot_0_1_0.SAVE_INTERVAL then
                                slot_0_16_0.last_save = var_32_0

                                slot_0_26_0()
                        end

                        local var_32_2 = slot_0_1_0.MAX_SECONDS - slot_0_16_0.used_seconds

                        if var_32_2 == 300 or var_32_2 == 60 or var_32_2 == 30 then
                                local var_32_3 = math.floor(var_32_2 / 60)
                                local var_32_4 = var_32_2 % 60

                                slot_0_23_0(var_32_3 .. "m " .. var_32_4 .. "s left!")
                        end
                end
        end
end

slot_0_28_0()

slot_0_31_0 = gui.GetMainWindow()
slot_0_32_0 = draw.textures.gui_icon_down or draw.textures.gui_icon_misc or draw.texture(1, 1)

if slot_0_32_0 and slot_0_32_0.create then
        slot_0_32_0:create()
end

slot_0_33_0 = slot_0_31_0:AddTab("aipeek_tab", slot_0_32_0, "AI PEEK", 0)
slot_0_34_0 = gui.Group("aipeek_main", "AI Peek", 450, gui.GroupWidthMode.FULL)

slot_0_33_0:Add(slot_0_34_0)

C = {}
C.tab = gui.combo_box(gui.control_id("aip_tab"))

C.tab:Add(gui.selectable(gui.control_id("aip_tab_main"), "AI Peek"))
C.tab:Add(gui.selectable(gui.control_id("aip_tab_hitbox"), "Hitbox & Mindmg"))
C.tab:Add(gui.selectable(gui.control_id("aip_tab_bait"), "Bait"))
C.tab:Add(gui.selectable(gui.control_id("aip_tab_scanner"), "Scanner"))
C.tab:Add(gui.selectable(gui.control_id("aip_tab_colors"), "Colors"))
C.tab:Add(gui.selectable(gui.control_id("aip_tab_config"), "Config"))

C.enable = gui.checkbox(gui.control_id("aip_enable"))
C.key = gui.checkbox(gui.control_id("aip_key"))
C.ignore_knife = gui.checkbox(gui.control_id("aip_ignore_knife"))
C.ignore_crouch = gui.checkbox(gui.control_id("aip_ignore_crouch"))
C.jump_on_enemy = gui.checkbox(gui.control_id("aip_jump_on_enemy"))
C.jump_distance = gui.slider(gui.control_id("aip_jump_distance"), 10, 500, {
        "%.0f"
})
C.show_ui = gui.checkbox(gui.control_id("aip_show_ui"))
C.show_radius = gui.checkbox(gui.control_id("aip_show_radius"))
C.ui_circle_color = gui.color_picker(gui.control_id("aip_ui_circle_color"))
C.ui_circle_color_return = gui.color_picker(gui.control_id("aip_ui_circle_color_return"))
C.return_on_shot = gui.checkbox(gui.control_id("aip_return_on_shot"))
C.return_on_key_release = gui.checkbox(gui.control_id("aip_return_on_key_release"))
C.return_rage_only = gui.checkbox(gui.control_id("aip_return_rage_only"))
C.debug = gui.checkbox(gui.control_id("aip_debug"))
C.max_players = gui.slider(gui.control_id("aip_max_players"), 1, 10, {
        "%.0f"
})
C.hb_head = gui.checkbox(gui.control_id("aip_hb_head"))
C.hb_chest = gui.checkbox(gui.control_id("aip_hb_chest"))
C.hb_stomach = gui.checkbox(gui.control_id("aip_hb_stomach"))
C.hb_legs = gui.checkbox(gui.control_id("aip_hb_legs"))
C.hb_feet = gui.checkbox(gui.control_id("aip_hb_feet"))
C.mindmg_enable = gui.checkbox(gui.control_id("aip_mindmg_enable"))
C.mindmg_value = gui.slider(gui.control_id("aip_mindmg_value"), 1, 100, {
        "%.0f"
})
C.bait_enable = gui.checkbox(gui.control_id("aip_bait_enable"))
C.bait_mode = gui.combo_box(gui.control_id("aip_bait_mode"))

C.bait_mode:Add(gui.selectable(gui.control_id("aip_bait_mode_auto"), "Auto"))
C.bait_mode:Add(gui.selectable(gui.control_id("aip_bait_mode_manual"), "Manual"))

C.bait_safe_peek = gui.checkbox(gui.control_id("aip_bait_safe_peek"))
C.bait_interval_min = gui.slider(gui.control_id("aip_bait_interval_min"), 100, 2000, {
        "%.0f ms"
})
C.bait_interval_max = gui.slider(gui.control_id("aip_bait_interval_max"), 100, 3000, {
        "%.0f ms"
})
C.bait_duration_min = gui.slider(gui.control_id("aip_bait_duration_min"), 30, 500, {
        "%.0f ms"
})
C.bait_duration_max = gui.slider(gui.control_id("aip_bait_duration_max"), 30, 800, {
        "%.0f ms"
})
C.bait_peek_dist = gui.slider(gui.control_id("aip_bait_peek_dist"), 10, 100, {
        "%.0f"
})
C.bait_safe_dist = gui.slider(gui.control_id("aip_bait_safe_dist"), 200, 2000, {
        "%.0f"
})
C.cfg_save = gui.button(gui.control_id("aip_cfg_save"), "Save")
C.cfg_load = gui.button(gui.control_id("aip_cfg_load"), "Load")
C.cfg_export = gui.button(gui.control_id("aip_cfg_export"), "Export")
C.cfg_import = gui.button(gui.control_id("aip_cfg_import"), "Import")
C.cfg_reset = gui.button(gui.control_id("aip_cfg_reset"), "Reset Defaults")
C.use_fallback_offsets = gui.checkbox(gui.control_id("aip_use_fallback_offsets"))
C.scan_segments = gui.slider(gui.control_id("aip_scan_segments"), 2, 60, {
        "%.0f"
})
C.scan_radius = gui.slider(gui.control_id("aip_scan_radius"), 10, 250, {
        "%.0f"
})
C.scan_depart = gui.slider(gui.control_id("aip_scan_depart"), 1, 12, {
        "%.0f"
})
C.scan_wall_dist = gui.slider(gui.control_id("aip_scan_wall_dist"), 50, 200, {
        "%.0f"
})
C.scan_wall_angles = gui.slider(gui.control_id("aip_scan_wall_angles"), 1, 5, {
        "%.0f"
})
C.scan_height_offset = gui.slider(gui.control_id("aip_scan_height_offset"), 0, 40, {
        "%.0f"
})
C.scan_eye_height = gui.slider(gui.control_id("aip_scan_eye_height"), 32, 72, {
        "%.0f"
})
C.scan_player_width = gui.slider(gui.control_id("aip_scan_player_width"), 0, 32, {
        "%.0f"
})
C.scan_full_body = gui.checkbox(gui.control_id("aip_scan_full_body"))
C.scan_target_mode = gui.combo_box(gui.control_id("aip_scan_target_mode"))

C.scan_target_mode:Add(gui.selectable(gui.control_id("aip_scan_target_closest1"), "Closest (lateral)"))
C.scan_target_mode:Add(gui.selectable(gui.control_id("aip_scan_target_closest2"), "Closest (full)"))
C.scan_target_mode:Add(gui.selectable(gui.control_id("aip_scan_target_lowhp"), "Lowest HP"))
C.scan_target_mode:Add(gui.selectable(gui.control_id("aip_scan_target_fov"), "Closest to Crosshair"))

C.scan_view_direction = gui.checkbox(gui.control_id("aip_scan_view_direction"))
C.scan_defaults = gui.button(gui.control_id("aip_scan_defaults"), "Reset Defaults")
C.pen_points_per_hitbox = gui.slider(gui.control_id("aip_pen_points_per_hitbox"), 1, 9, {
        "%.0f"
})
C.pen_enable_legs = gui.checkbox(gui.control_id("aip_pen_enable_legs"))
C.pen_min_damage = gui.slider(gui.control_id("aip_pen_min_damage"), 0, 100, {
        "%.0f"
})
C.discord = gui.button(gui.control_id("aip_discord"), "Discord")

C.discord:AddCallback(function()
        slot_0_15_0(slot_0_1_0.DISCORD_URL)
end)
C.max_players:get_value():set(1)
C.hb_head:get_value():set(true)
C.hb_chest:get_value():set(true)
C.hb_stomach:get_value():set(false)
C.hb_legs:get_value():set(false)
C.hb_feet:get_value():set(false)
C.mindmg_value:get_value():set(50)
C.bait_interval_min:get_value():set(500)
C.bait_interval_max:get_value():set(1200)
C.bait_duration_min:get_value():set(100)
C.bait_duration_max:get_value():set(250)
C.bait_peek_dist:get_value():set(30)
C.bait_safe_dist:get_value():set(800)
C.bait_safe_peek:get_value():set(true)
C.jump_distance:get_value():set(150)
C.scan_segments:get_value():set(2)
C.scan_radius:get_value():set(175)
C.scan_depart:get_value():set(2)
C.scan_wall_dist:get_value():set(80)
C.scan_wall_angles:get_value():set(3)
C.scan_height_offset:get_value():set(5)
C.scan_eye_height:get_value():set(64)
C.scan_player_width:get_value():set(16)
C.scan_full_body:set_value(false)
C.scan_view_direction:set_value(true)
C.pen_points_per_hitbox:get_value():set(3)
C.pen_enable_legs:get_value():set(true)
C.pen_min_damage:get_value():set(1)

slot_0_35_1 = C.scan_target_mode:get_value():get()

slot_0_35_1:set_raw(1)
C.scan_target_mode:get_value():set(slot_0_35_1)
C.ui_circle_color:get_value():set(draw.Color(0, 255, 200, 255))
C.ui_circle_color_return:get_value():set(draw.Color(255, 100, 50, 255))
C.return_on_shot:get_value():set(true)
C.return_on_key_release:get_value():set(true)
C.return_rage_only:get_value():set(true)
C.use_fallback_offsets:get_value():set(false)

function slot_0_35_0()
        C.scan_segments:get_value():set(2)
        C.scan_radius:get_value():set(175)
        C.scan_depart:get_value():set(2)
        C.scan_wall_dist:get_value():set(80)
        C.scan_wall_angles:get_value():set(3)
        C.scan_height_offset:get_value():set(5)
        C.scan_eye_height:get_value():set(64)
        C.scan_player_width:get_value():set(16)
        C.scan_full_body:set_value(false)
        C.scan_view_direction:set_value(true)
        C.pen_points_per_hitbox:get_value():set(3)
        C.pen_enable_legs:get_value():set(true)
        C.pen_min_damage:get_value():set(1)

        local var_34_0 = C.scan_target_mode:get_value():get()

        var_34_0:set_raw(2)
        C.scan_target_mode:get_value():set(var_34_0)
        gui.notify:Add(gui.notification("AI Peek", "Scanner defaults reset!"))
end

function slot_0_36_0()
        C.enable:get_value():set(true)
        C.ignore_knife:get_value():set(false)
        C.ignore_crouch:get_value():set(false)
        C.jump_on_enemy:get_value():set(false)
        C.jump_distance:get_value():set(150)
        C.show_ui:get_value():set(true)
        C.show_radius:get_value():set(false)
        C.return_on_shot:get_value():set(true)
        C.return_on_key_release:get_value():set(true)
        C.return_rage_only:get_value():set(true)
        C.debug:get_value():set(false)
        C.max_players:get_value():set(1)
        C.hb_head:get_value():set(true)
        C.hb_chest:get_value():set(true)
        C.hb_stomach:get_value():set(false)
        C.hb_legs:get_value():set(false)
        C.hb_feet:get_value():set(false)
        C.mindmg_enable:get_value():set(false)
        C.mindmg_value:get_value():set(50)
        C.bait_enable:get_value():set(false)
        C.bait_safe_peek:get_value():set(true)
        C.bait_interval_min:get_value():set(500)
        C.bait_interval_max:get_value():set(1200)
        C.bait_duration_min:get_value():set(100)
        C.bait_duration_max:get_value():set(250)
        C.bait_peek_dist:get_value():set(30)
        C.bait_safe_dist:get_value():set(800)
        C.scan_segments:get_value():set(2)
        C.scan_radius:get_value():set(175)
        C.scan_depart:get_value():set(2)
        C.scan_wall_dist:get_value():set(80)
        C.scan_wall_angles:get_value():set(3)
        C.scan_height_offset:get_value():set(5)
        C.scan_eye_height:get_value():set(64)
        C.scan_player_width:get_value():set(16)
        C.scan_full_body:set_value(false)
        C.scan_view_direction:set_value(true)
        C.pen_points_per_hitbox:get_value():set(3)
        C.pen_enable_legs:get_value():set(true)
        C.pen_min_damage:get_value():set(1)
        gui.notify:Add(gui.notification("AI Peek", "All settings reset to defaults!"))
end

C.enable.tooltip = "Enable AI Peek functionality"
C.key.tooltip = "Hold this key to activate AI Peek movement"
C.ignore_knife.tooltip = "Disable weapon validation (allow knife, grenades, zeus, etc.)"
C.ignore_crouch.tooltip = "Ignore crouching enemies when scanning"
C.jump_on_enemy.tooltip = "Jump when enemy is close to avoid collision"
C.jump_distance.tooltip = "Distance to enemy to trigger jump"
C.show_ui.tooltip = "Show simple UI with neon circle"
C.show_radius.tooltip = "Show AI Peek radius circle around saved position"
C.ui_circle_color.tooltip = "Color of the neon circle when NOT returning to safe zone"
C.ui_circle_color_return.tooltip = "Color of the neon circle when RETURNING to safe zone"
C.return_on_shot.tooltip = "Return to safe zone after shooting"
C.return_on_key_release.tooltip = "Return to safe zone when movement keys released"
C.return_rage_only.tooltip = "Only return on rage shot (not manual shots)"
C.debug.tooltip = "Show full debug visualization on screen (for developers)"
C.max_players.tooltip = "Maximum number of enemies to scan for visibility"
C.hb_head.tooltip = "Include head hitbox in visibility check"
C.hb_chest.tooltip = "Include chest hitbox in visibility check"
C.hb_stomach.tooltip = "Include pelvis hitbox in visibility check"
C.hb_legs.tooltip = "Include pelvis and legs hitbox in visibility check"
C.hb_feet.tooltip = "Include feet hitbox in visibility check"
C.mindmg_enable.tooltip = "Override mindamage when only body/limbs visible (no head)"
C.mindmg_value.tooltip = "Mindamage value to set when override is active"
C.bait_enable.tooltip = "Enable bait peeking when no valid peek points found"
C.bait_mode.tooltip = "Auto: automatic peek timing. Manual: hold key to peek"
C.bait_safe_peek.tooltip = "Check if bait position is safe and avoid dangerous spots"
C.bait_interval_min.tooltip = "Minimum time between bait peeks (ms)"
C.bait_interval_max.tooltip = "Maximum time between bait peeks (ms)"
C.bait_duration_min.tooltip = "Minimum bait peek duration (ms)"
C.bait_duration_max.tooltip = "Maximum bait peek duration (ms)"
C.bait_peek_dist.tooltip = "Distance to peek out from cover"
C.bait_safe_dist.tooltip = "Distance at which peek distance starts scaling down"
C.cfg_save.tooltip = "Save current settings to config file"
C.cfg_load.tooltip = "Load settings from config file"
C.cfg_export.tooltip = "Export settings to clipboard"
C.cfg_import.tooltip = "Import settings from clipboard"
C.use_fallback_offsets.tooltip = "Use hardcoded fallback offsets instead of Schema (0x18C0, 0x338, 0x160, 0x310)"
C.scan_segments.tooltip = "Number of scan points on the peek line"
C.scan_radius.tooltip = "Maximum peek distance from saved position"
C.scan_depart.tooltip = "Number of intermediate points between origin and target"
C.scan_wall_dist.tooltip = "Distance to check for walls when finding bait edge"
C.scan_wall_angles.tooltip = "Number of angles to check for walls"
C.scan_height_offset.tooltip = "Height offset for scan points (helps with stairs)"
C.scan_eye_height.tooltip = "Eye height for visibility checks (64 = standing, 46 = crouching)"
C.scan_player_width.tooltip = "Player collision width for path checking (0 = center only, 16 = default)"
C.scan_full_body.tooltip = "Check all 3 heights (legs, body, head). OFF = legs only (faster)"
C.scan_target_mode.tooltip = "Target selection mode: Closest, Lowest HP, Highest Damage, Closest to Crosshair"
C.scan_view_direction.tooltip = "Limit peek line to one side based on current view direction (left or right from saved position)"
C.pen_points_per_hitbox.tooltip = "Number of points to check per hitbox (1=center, 3=depth, 5=cardinal, 9=all)"
C.pen_enable_legs.tooltip = "Include leg hitboxes in penetration scanning"
C.pen_min_damage.tooltip = "Minimum damage required to consider wallbang viable (0 = any damage)"
C.scan_defaults.tooltip = "Reset all scanner settings to default values"
slot_0_37_0 = false
slot_0_38_0 = false
slot_0_39_0 = true
slot_0_40_0 = true
slot_0_41_0 = false
slot_0_42_0 = "IDLE"
slot_0_43_0 = nil
slot_0_44_0 = nil
slot_0_45_0 = 0
slot_0_46_0 = 0
slot_0_47_0 = 800
slot_0_48_0 = 150
slot_0_49_0 = {}
slot_0_50_0 = {}
slot_0_51_0 = nil
slot_0_52_0 = {}
slot_0_53_0 = 5
slot_0_54_0 = "none"
slot_0_55_0 = 0
slot_0_56_0 = "IDLE"
slot_0_57_0 = 0
slot_0_58_0 = false
slot_0_59_0 = 72
slot_0_60_0 = nil
slot_0_61_0 = nil
slot_0_62_0 = {}
slot_0_63_0 = {}
slot_0_64_0 = nil
slot_0_65_0 = nil
slot_0_66_0 = nil
slot_0_67_0 = nil
slot_0_68_0 = nil
slot_0_69_0 = 0
slot_0_70_0 = 0
slot_0_71_0 = 0
slot_0_72_0 = 0
slot_0_73_0 = 0
slot_0_74_0 = 0
slot_0_75_0 = 0
slot_0_76_0 = 0
slot_0_77_0 = false

function slot_0_78_0(arg_36_0)
        table.insert(slot_0_52_0, arg_36_0)

        if #slot_0_52_0 > slot_0_53_0 then
                table.remove(slot_0_52_0, 1)
        end

        if #slot_0_52_0 < 5 then
                slot_0_57_0 = 0
                slot_0_58_0 = false

                return false
        end

        local var_36_0 = slot_0_52_0[1]
        local var_36_1 = slot_0_52_0[1]

        for iter_36_0, iter_36_1 in ipairs(slot_0_52_0) do
                if iter_36_1 < var_36_0 then
                        var_36_0 = iter_36_1
                end

                if var_36_1 < iter_36_1 then
                        var_36_1 = iter_36_1
                end
        end

        local var_36_2 = var_36_1 - var_36_0
        local var_36_3 = var_36_2 > 0.6

        slot_0_57_0 = var_36_2
        slot_0_58_0 = var_36_3

        return var_36_3
end

slot_0_79_0 = 0
slot_0_80_0 = 0
slot_0_81_0 = 0
slot_0_82_0 = 0
slot_0_83_0 = 0
slot_0_84_0 = 0
slot_0_85_0 = false
slot_0_86_0 = false
slot_0_87_0 = false
slot_0_88_0 = false
slot_0_89_0 = 0
slot_0_90_0 = {}
slot_0_91_0 = {}
slot_0_92_0 = false
slot_0_93_0 = false
slot_0_94_0 = false
slot_0_95_0 = false
slot_0_96_0 = {}
slot_0_97_0 = {
        "rage>weapon>Pistols>weapon>mindamage",
        "rage>weapon>Heavy Pistols>weapon>mindamage",
        "rage>weapon>Auto Snipers>weapon>mindamage",
        "rage>weapon>AWP>weapon>mindamage",
        "rage>weapon>SSG-08>weapon>mindamage",
        "rage>weapon>R8 Revolver>weapon>mindamage"
}

function slot_0_98_0(arg_37_0, arg_37_1)
        return math.sqrt(arg_37_0 * arg_37_0 + arg_37_1 * arg_37_1)
end

function slot_0_99_0(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
        arg_38_4 = arg_38_4 or 5

        local var_38_0 = arg_38_3 + 90
        local var_38_1 = math.rad(var_38_0)

        return vector(arg_38_2.x + math.cos(var_38_1) * arg_38_1 * arg_38_0, arg_38_2.y + math.sin(var_38_1) * arg_38_1 * arg_38_0, arg_38_2.z + arg_38_4)
end

function slot_0_100_0(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
        local var_39_0 = {}

        arg_39_1 = math.max(2, math.floor(arg_39_1))

        local var_39_1 = 2 / arg_39_1
        local var_39_2 = {}

        if arg_39_4 and arg_39_4 >= 150 then
                var_39_2 = {
                        -40,
                        -20,
                        5,
                        25,
                        45,
                        65,
                        85
                }
        else
                var_39_2 = {
                        5
                }
        end

        for iter_39_0, iter_39_1 in ipairs(var_39_2) do
                if not arg_39_4 or arg_39_4 >= math.abs(iter_39_1) then
                        for iter_39_2 = 0, arg_39_1 do
                                local var_39_3 = -1 + var_39_1 * iter_39_2
                                local var_39_4 = slot_0_99_0(var_39_3, arg_39_0, arg_39_2, arg_39_3, iter_39_1)

                                table.insert(var_39_0, var_39_4)
                        end
                end
        end

        return var_39_0
end

function slot_0_101_0(arg_40_0, arg_40_1)
        local var_40_0 = ray_t()
        local var_40_1 = game.physics_query_interface:trace_ray(var_40_0, arg_40_0, arg_40_1)

        if var_40_1 and var_40_1.fraction then
                local var_40_2 = var_40_1.fraction

                return vector(arg_40_0.x + (arg_40_1.x - arg_40_0.x) * var_40_2, arg_40_0.y + (arg_40_1.y - arg_40_0.y) * var_40_2, arg_40_0.z + (arg_40_1.z - arg_40_0.z) * var_40_2), var_40_2
        end

        return arg_40_1, 1
end

function slot_0_102_0(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
        local var_41_0 = {}
        local var_41_1 = arg_41_0.x - arg_41_1.x
        local var_41_2 = arg_41_0.y - arg_41_1.y
        local var_41_3 = var_41_1 / arg_41_2
        local var_41_4 = var_41_2 / arg_41_2
        local var_41_5 = slot_0_98_0(arg_41_3.x - arg_41_1.x, arg_41_3.y - arg_41_1.y)

        for iter_41_0 = 1, arg_41_2 do
                local var_41_6 = var_41_3 * iter_41_0
                local var_41_7 = var_41_4 * iter_41_0

                if var_41_5 > slot_0_98_0(var_41_6, var_41_7) then
                        table.insert(var_41_0, vector(arg_41_1.x + var_41_6, arg_41_1.y + var_41_7, arg_41_1.z + 20))
                end
        end

        return var_41_0
end

function slot_0_103_0(arg_42_0, arg_42_1, arg_42_2)
        local var_42_0 = {}
        local var_42_1 = C.scan_radius:get_value():get()
        local var_42_2 = C.scan_segments:get_value():get()
        local var_42_3 = C.scan_depart:get_value():get()
        local var_42_4 = C.scan_height_offset:get_value():get()
        local var_42_5 = C.scan_player_width:get_value():get()
        local var_42_6 = C.scan_full_body:get_value():get()

        if not arg_42_0 then
                return var_42_0
        end

        local var_42_7 = slot_0_100_0(var_42_1, var_42_2, arg_42_0, arg_42_1, arg_42_2)

        slot_0_60_0 = slot_0_99_0(-1, var_42_1, arg_42_0, arg_42_1)
        slot_0_61_0 = slot_0_99_0(1, var_42_1, arg_42_0, arg_42_1)

        for iter_42_0, iter_42_1 in ipairs(var_42_7) do
                if iter_42_1 then
                        local var_42_8 = vector(iter_42_1.x, iter_42_1.y, iter_42_1.z + var_42_4)
                        local var_42_9 = var_42_8.x - arg_42_0.x
                        local var_42_10 = var_42_8.y - arg_42_0.y
                        local var_42_11 = slot_0_98_0(var_42_9, var_42_10)

                        if var_42_11 < 1 then
                                table.insert(var_42_0, var_42_8)
                        else
                                local var_42_12 = var_42_9 / var_42_11
                                local var_42_13 = var_42_10 / var_42_11
                                local var_42_14 = -var_42_13
                                local var_42_15 = var_42_12
                                local var_42_16 = {}

                                if arg_42_2 and arg_42_2 >= 150 then
                                        var_42_16 = {
                                                5,
                                                15,
                                                25,
                                                36,
                                                48,
                                                62,
                                                75
                                        }
                                else
                                        var_42_16 = {
                                                5
                                        }
                                end

                                local var_42_17 = var_42_5 > 0 and {
                                        0,
                                        var_42_5,
                                        -var_42_5
                                } or {
                                        0
                                }
                                local var_42_18 = 1

                                for iter_42_2, iter_42_3 in ipairs(var_42_16) do
                                        for iter_42_4, iter_42_5 in ipairs(var_42_17) do
                                                local var_42_19 = vector(arg_42_0.x + var_42_14 * iter_42_5, arg_42_0.y + var_42_15 * iter_42_5, arg_42_0.z + iter_42_3)
                                                local var_42_20 = vector(var_42_8.x + var_42_14 * iter_42_5, var_42_8.y + var_42_15 * iter_42_5, var_42_8.z + iter_42_3)
                                                local var_42_21 = ray_t()
                                                local var_42_22 = game.physics_query_interface:trace_ray(var_42_21, var_42_19, var_42_20)

                                                if var_42_22 and var_42_22.fraction and var_42_18 > var_42_22.fraction then
                                                        var_42_18 = var_42_22.fraction
                                                end
                                        end
                                end

                                if var_42_18 > 0.1 then
                                        local var_42_23 = var_42_11 * var_42_18 * 0.9

                                        if var_42_23 > 5 then
                                                local var_42_24 = vector(arg_42_0.x + var_42_12 * var_42_23, arg_42_0.y + var_42_13 * var_42_23, var_42_8.z)

                                                table.insert(var_42_0, var_42_24)
                                        end
                                end
                        end
                end
        end

        return var_42_0
end

function slot_0_104_0(arg_43_0)
        if not arg_43_0 then
                return 0
        end

        local var_43_0 = arg_43_0.m_vecViewOffset

        if var_43_0 then
                local var_43_1 = var_43_0:get()

                if var_43_1 and var_43_1.z then
                        local var_43_2 = var_43_1.z

                        if var_43_2 < 50 then
                                return 1
                        elseif var_43_2 < 60 then
                                return (64 - var_43_2) / 18
                        end
                end
        end

        local var_43_3 = arg_43_0.m_pMovementServices

        if var_43_3 then
                local var_43_4 = var_43_3:get()

                if var_43_4 then
                        local var_43_5 = var_43_4.m_flDuckAmount

                        if var_43_5 then
                                local var_43_6 = var_43_5:get()

                                if var_43_6 and var_43_6 > 0 then
                                        return var_43_6
                                end
                        end
                end
        end

        if arg_43_0.m_fFlags then
                local var_43_7 = arg_43_0.m_fFlags:get()

                if var_43_7 and (bit.band(var_43_7, 2) ~= 0 or bit.band(var_43_7, 4) ~= 0) then
                        return 1
                end
        end

        return 0
end

function slot_0_105_0(arg_44_0)
        if not arg_44_0 then
                return false
        end

        return slot_0_104_0(arg_44_0) > 0.5
end

function slot_0_106_0(arg_45_0)
        local var_45_0 = {}

        if not arg_45_0 then
                return var_45_0
        end

        if C.hb_head:get_value():get() then
                local var_45_1 = arg_45_0:GetHitboxCenter(EHitBox.HEAD)

                if var_45_1 then
                        table.insert(var_45_0, var_45_1)
                end
        end

        if C.hb_chest:get_value():get() then
                local var_45_2 = arg_45_0:GetHitboxCenter(EHitBox.CHEST)

                if var_45_2 then
                        table.insert(var_45_0, var_45_2)
                end
        end

        if C.hb_stomach:get_value():get() then
                local var_45_3 = arg_45_0:GetHitboxCenter(EHitBox.PELVIS)

                if var_45_3 then
                        table.insert(var_45_0, var_45_3)
                end
        end

        if C.hb_legs:get_value():get() then
                local var_45_4 = arg_45_0:GetHitboxCenter(EHitBox.PELVIS)

                if var_45_4 then
                        table.insert(var_45_0, var_45_4)
                end

                local var_45_5 = arg_45_0:GetHitboxCenter(EHitBox.LEFT_FOOT)
                local var_45_6 = arg_45_0:GetHitboxCenter(EHitBox.RIGHT_FOOT)

                if var_45_5 then
                        table.insert(var_45_0, var_45_5)
                end

                if var_45_6 then
                        table.insert(var_45_0, var_45_6)
                end
        end

        if C.hb_feet:get_value():get() then
                local var_45_7 = arg_45_0:GetHitboxCenter(EHitBox.LEFT_FOOT)
                local var_45_8 = arg_45_0:GetHitboxCenter(EHitBox.RIGHT_FOOT)

                if var_45_7 then
                        table.insert(var_45_0, var_45_7)
                end

                if var_45_8 then
                        table.insert(var_45_0, var_45_8)
                end
        end

        if #var_45_0 == 0 then
                local var_45_9 = arg_45_0:GetHitboxCenter(EHitBox.HEAD)

                if var_45_9 then
                        table.insert(var_45_0, var_45_9)
                end
        end

        return var_45_0
end

function slot_0_107_0()
        return C.scan_target_mode:get_value():get():get_raw() or 1
end

function slot_0_108_0(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
        if not entities or not entities.players then
                return nil, 99999, "none", {}
        end

        local var_47_0 = C.max_players:get_value():get()
        local var_47_1 = slot_0_107_0()

        slot_0_84_0 = var_47_1

        local var_47_2 = {}
        local var_47_3 = arg_47_3 or arg_47_0
        local var_47_4 = C.scan_eye_height:get_value():get()
        local var_47_5 = C.scan_radius:get_value():get()
        local var_47_6 = 0

        if arg_47_4 and arg_47_4.y then
                var_47_6 = arg_47_4.y
        elseif arg_47_2 and arg_47_2.y then
                var_47_6 = arg_47_2.y
        end

        local var_47_7 = math.rad(var_47_6)
        local var_47_8 = math.cos(var_47_7)
        local var_47_9 = math.sin(var_47_7)
        local var_47_10 = 0

        if arg_47_2 and arg_47_2.y then
                var_47_10 = arg_47_2.y
        end

        local var_47_11 = math.rad(var_47_10)
        local var_47_12 = math.cos(var_47_11)
        local var_47_13 = math.sin(var_47_11)

        entities.players:for_each(function(arg_48_0)
                if not arg_48_0 then
                        return
                end

                local var_48_0 = arg_48_0.entity

                if not var_48_0 then
                        return
                end

                if not var_48_0:is_enemy() then
                        return
                end

                if not var_48_0:is_alive() then
                        return
                end

                if arg_47_1 and slot_0_105_0(var_48_0) then
                        return
                end

                local var_48_1 = var_48_0:get_abs_origin()

                if not var_48_1 then
                        return
                end

                local var_48_2 = var_48_1.x - var_47_3.x
                local var_48_3 = var_48_1.y - var_47_3.y
                local var_48_4 = slot_0_98_0(var_48_2, var_48_3)

                if var_48_4 > 1 then
                        local var_48_5 = "unknown"
                        local var_48_6 = arg_48_0.controller

                        if var_48_6 then
                                local var_48_7 = var_48_6:get_name()

                                if var_48_7 then
                                        var_48_5 = var_48_7
                                end
                        end

                        local var_48_8 = 100

                        if var_48_0.m_iHealth then
                                var_48_8 = var_48_0.m_iHealth:get() or 100
                        end

                        local var_48_9 = var_48_2 * var_47_8 + var_48_3 * var_47_9
                        local var_48_10 = math.abs(var_48_2 * var_47_9 - var_48_3 * var_47_8)
                        local var_48_11 = 180
                        local var_48_12 = var_48_2 / var_48_4
                        local var_48_13 = var_48_3 / var_48_4
                        local var_48_14 = var_47_12 * var_48_12 + var_47_13 * var_48_13
                        local var_48_15 = math.max(-1, math.min(1, var_48_14))
                        local var_48_16 = math.deg(math.acos(var_48_15))

                        table.insert(var_47_2, {
                                pawn = var_48_0,
                                dist = var_48_4,
                                lateral = var_48_10,
                                forward = var_48_9,
                                name = var_48_5,
                                hp = var_48_8,
                                fov = var_48_16
                        })
                end
        end)

        if var_47_1 == 1 then
                table.sort(var_47_2, function(arg_49_0, arg_49_1)
                        return arg_49_0.lateral < arg_49_1.lateral
                end)
        elseif var_47_1 == 2 then
                table.sort(var_47_2, function(arg_50_0, arg_50_1)
                        return arg_50_0.dist < arg_50_1.dist
                end)
        elseif var_47_1 == 4 then
                table.sort(var_47_2, function(arg_51_0, arg_51_1)
                        return arg_51_0.hp < arg_51_1.hp
                end)
        elseif var_47_1 == 8 then
                table.sort(var_47_2, function(arg_52_0, arg_52_1)
                        return arg_52_0.fov < arg_52_1.fov
                end)
        else
                table.sort(var_47_2, function(arg_53_0, arg_53_1)
                        return arg_53_0.dist < arg_53_1.dist
                end)
        end

        if #var_47_2 > 0 then
                return var_47_2[1].pawn, var_47_2[1].dist, var_47_2[1].name, var_47_2
        end

        return nil, 99999, "none", {}
end

function slot_0_109_0(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
        if not mods or not mods.penetration or not mods.penetration.FireBullet then
                return false, 0
        end

        if not arg_54_2 then
                local var_54_0 = entities.get_local_pawn()

                if not var_54_0 then
                        return false, 0
                end

                arg_54_2 = var_54_0:get_active_weapon()

                if not arg_54_2 then
                        return false, 0
                end
        end

        local var_54_1 = vector(arg_54_1.x - arg_54_0.x, arg_54_1.y - arg_54_0.y, arg_54_1.z - arg_54_0.z)
        local var_54_2, var_54_3 = mods.penetration.FireBullet(arg_54_0, var_54_1, arg_54_2, arg_54_3, false, false)

        if var_54_3 and var_54_3.damage then
                return var_54_3.damage > 0, var_54_3.damage
        end

        return false, 0
end

function slot_0_110_0(arg_55_0, arg_55_1)
        local var_55_0 = slot_0_106_0(arg_55_1)
        local var_55_1 = C.scan_eye_height:get_value():get()
        local var_55_2 = vector(arg_55_0.x, arg_55_0.y, arg_55_0.z + var_55_1)

        for iter_55_0, iter_55_1 in ipairs(var_55_0) do
                local var_55_3 = ray_t()
                local var_55_4 = game.physics_query_interface:trace_ray(var_55_3, var_55_2, iter_55_1)

                if var_55_4 and var_55_4.fraction and var_55_4.fraction >= 0.97 then
                        return true
                end
        end

        local var_55_5 = entities.get_local_pawn()

        if not var_55_5 then
                return false
        end

        local var_55_6 = var_55_5:get_active_weapon()

        if not var_55_6 then
                return false
        end

        local var_55_7 = 1

        if C and C.pen_min_damage then
                var_55_7 = C.pen_min_damage:get_value():get()
        end

        for iter_55_2, iter_55_3 in ipairs(var_55_0) do
                local var_55_8 = vector(iter_55_3.x - var_55_2.x, iter_55_3.y - var_55_2.y, iter_55_3.z - var_55_2.z)

                if mods and mods.penetration and mods.penetration.FireBullet then
                        local var_55_9, var_55_10 = mods.penetration.FireBullet(var_55_2, var_55_8, var_55_6, arg_55_1, false, false)

                        if var_55_10 and var_55_10.damage and var_55_7 <= var_55_10.damage then
                                return true
                        end
                end
        end

        return false
end

function slot_0_111_0()
        local var_56_0 = entities.get_local_pawn()

        if not var_56_0 then
                return false
        end

        local var_56_1 = var_56_0:get_active_weapon()

        if not var_56_1 then
                return false
        end

        local var_56_2 = var_56_1:get_type()

        if not var_56_2 then
                return false
        end

        if C.ignore_knife:get_value():get() then
                return true
        end

        if var_56_2 == csweapon_type.knife or var_56_2 == csweapon_type.grenade or var_56_2 == csweapon_type.c4 or var_56_2 == csweapon_type.melee or var_56_2 == csweapon_type.fists or var_56_2 == csweapon_type.taser then
                return false
        end

        return true
end

function slot_0_112_0(arg_57_0)
        if not arg_57_0 then
                return 0
        end

        local var_57_0 = ffi.cast("uintptr_t*", arg_57_0)[0]

        if not var_57_0 or var_57_0 == 0 then
                return 0
        end

        return ffi.cast("int*", var_57_0 + slot_0_3_0)[0] or 0
end

function slot_0_113_0()
        local var_58_0 = entities.get_local_pawn()

        if not var_58_0 then
                return true
        end

        local var_58_1 = var_58_0:get_active_weapon()

        if not var_58_1 then
                return true
        end

        if not var_58_1:is_gun() then
                return true
        end

        local var_58_2 = slot_0_112_0(var_58_1)
        local var_58_3 = game.global_vars.tick_count

        if var_58_2 and var_58_3 and var_58_2 > 0 then
                return var_58_2 <= var_58_3
        end

        return true
end

function slot_0_114_0()
        return 0
end

function slot_0_115_0()
        if C.bait_mode:get_value():get():get_raw() == 2 then
                return 1
        end

        return 0
end

function slot_0_116_0(arg_61_0, arg_61_1, arg_61_2)
        local var_61_0 = {}
        local var_61_1 = {}
        local var_61_2 = 64
        local var_61_3 = vector(arg_61_0.x, arg_61_0.y, arg_61_0.z + var_61_2)
        local var_61_4 = arg_61_1 + 90
        local var_61_5 = math.rad(var_61_4)
        local var_61_6 = math.cos(var_61_5)
        local var_61_7 = math.sin(var_61_5)
        local var_61_8 = C.scan_radius:get_value():get()
        local var_61_9 = C.scan_segments:get_value():get()
        local var_61_10 = C.scan_wall_dist:get_value():get()
        local var_61_11 = C.scan_wall_angles:get_value():get()
        local var_61_12 = C.bait_safe_peek:get_value():get()
        local var_61_13 = {
                0
        }
        local var_61_14 = 25

        for iter_61_0 = 1, var_61_11 - 1 do
                table.insert(var_61_13, -var_61_14 * iter_61_0)
                table.insert(var_61_13, var_61_14 * iter_61_0)
        end

        local var_61_15 = {}
        local var_61_16 = 0
        local var_61_17 = 0
        local var_61_18 = 0
        local var_61_19 = 0

        for iter_61_1 = -var_61_9, var_61_9 do
                local var_61_20 = iter_61_1 / var_61_9 * var_61_8
                local var_61_21 = vector(var_61_3.x + var_61_6 * var_61_20, var_61_3.y + var_61_7 * var_61_20, var_61_3.z)
                local var_61_22 = false
                local var_61_23 = false

                for iter_61_2, iter_61_3 in ipairs(var_61_13) do
                        local var_61_24 = arg_61_1 + iter_61_3
                        local var_61_25 = math.rad(var_61_24)
                        local var_61_26 = math.cos(var_61_25)
                        local var_61_27 = math.sin(var_61_25)
                        local var_61_28 = vector(var_61_21.x + var_61_26 * var_61_10, var_61_21.y + var_61_27 * var_61_10, var_61_21.z)
                        local var_61_29 = ray_t()
                        local var_61_30 = game.physics_query_interface:trace_ray(var_61_29, var_61_21, var_61_28)
                        local var_61_31 = var_61_30 and var_61_30.fraction and var_61_30.fraction < 0.9

                        table.insert(var_61_1, {
                                start_pos = var_61_21,
                                end_pos = var_61_28,
                                hit = var_61_31
                        })

                        if var_61_31 then
                                var_61_22 = true
                        end
                end

                if var_61_22 then
                        if iter_61_1 < 0 then
                                var_61_18 = var_61_18 + 1
                        elseif iter_61_1 > 0 then
                                var_61_19 = var_61_19 + 1
                        end
                end

                if var_61_12 and arg_61_2 and var_61_22 then
                        local var_61_32, var_61_33 = slot_0_109_0(arg_61_2, var_61_21, nil, nil)

                        if var_61_32 then
                                var_61_23 = true
                        end
                end

                if var_61_22 and not var_61_23 then
                        table.insert(var_61_0, {
                                pos = var_61_21,
                                offset = var_61_20,
                                has_wall = var_61_22,
                                can_be_wb = var_61_23,
                                index = iter_61_1
                        })
                end

                table.insert(var_61_0, {
                        can_see = false,
                        pos = var_61_21,
                        has_wall = var_61_22,
                        can_be_wb = var_61_23
                })
        end

        local var_61_34 = var_61_16
        local var_61_35 = var_61_17

        if var_61_16 == 0 and var_61_17 == 0 then
                var_61_34 = var_61_18
                var_61_35 = var_61_19
        end

        local var_61_36 = 1

        if var_61_35 < var_61_34 then
                var_61_36 = 1
        elseif var_61_34 < var_61_35 then
                var_61_36 = -1
        end

        slot_0_62_0 = var_61_0
        slot_0_63_0 = var_61_1

        return var_61_36, var_61_6, var_61_7, var_61_34, var_61_35
end

function slot_0_117_0(arg_62_0, arg_62_1)
        local var_62_0 = game.global_vars.real_time * 1000
        local var_62_1 = C.bait_peek_dist:get_value():get()
        local var_62_2 = C.bait_safe_dist:get_value():get()
        local var_62_3 = slot_0_115_0()
        local var_62_4 = 1

        if arg_62_1 < var_62_2 then
                var_62_4 = math.max(0.1, arg_62_1 / var_62_2)
        end

        local var_62_5 = var_62_1 * var_62_4

        slot_0_69_0 = var_62_5

        local var_62_6 = entities.get_local_pawn():get_abs_origin()
        local var_62_7 = arg_62_0 and arg_62_0:get_eye_pos() or nil
        local var_62_8 = my_old_view and my_old_view.y or current_view.y
        local var_62_9, var_62_10, var_62_11, var_62_12, var_62_13 = slot_0_116_0(my_old_vec, var_62_8, var_62_7)

        slot_0_70_0 = var_62_12
        slot_0_71_0 = var_62_13
        slot_0_72_0 = var_62_9

        if var_62_12 > 0 or var_62_13 > 0 then
                slot_0_44_0 = nil
                slot_0_68_0 = nil

                local var_62_14 = vector(my_old_vec.x + var_62_10 * var_62_5 * var_62_9, my_old_vec.y + var_62_11 * var_62_5 * var_62_9, my_old_vec.z)

                slot_0_43_0 = var_62_14
                slot_0_67_0 = slot_0_43_0

                local var_62_15 = false

                if arg_62_0 and arg_62_0:is_alive() then
                        local var_62_16, var_62_17 = slot_0_110_0(var_62_14, arg_62_0)
                        local var_62_18 = var_62_16
                end

                slot_0_66_0 = nil

                if var_62_3 == 0 then
                        if slot_0_42_0 == "WAITING" then
                                if var_62_0 - slot_0_45_0 >= slot_0_47_0 then
                                        slot_0_42_0 = "PEEKING"
                                        slot_0_46_0 = var_62_0

                                        local var_62_19 = C.bait_duration_min:get_value():get()
                                        local var_62_20 = C.bait_duration_max:get_value():get()

                                        if var_62_20 < var_62_19 then
                                                var_62_19, var_62_20 = var_62_20, var_62_19
                                        end

                                        slot_0_48_0 = var_62_19 + math.random() * (var_62_20 - var_62_19)
                                end
                        elseif slot_0_42_0 == "PEEKING" then
                                if var_62_0 - slot_0_46_0 >= slot_0_48_0 then
                                        slot_0_42_0 = "RETURNING"
                                end
                        elseif slot_0_42_0 == "RETURNING" then
                                if slot_0_98_0(var_62_6.x - my_old_vec.x, var_62_6.y - my_old_vec.y) <= 10 then
                                        slot_0_42_0 = "WAITING"
                                        slot_0_45_0 = var_62_0

                                        local var_62_21 = C.bait_interval_min:get_value():get()
                                        local var_62_22 = C.bait_interval_max:get_value():get()

                                        if var_62_22 < var_62_21 then
                                                var_62_21, var_62_22 = var_62_22, var_62_21
                                        end

                                        slot_0_47_0 = var_62_21 + math.random() * (var_62_22 - var_62_21)
                                end
                        else
                                slot_0_42_0 = "WAITING"

                                local var_62_23 = C.bait_interval_min:get_value():get()
                                local var_62_24 = C.bait_interval_max:get_value():get()

                                if var_62_24 < var_62_23 then
                                        var_62_23, var_62_24 = var_62_24, var_62_23
                                end

                                slot_0_47_0 = var_62_23 + math.random() * (var_62_24 - var_62_23)
                                slot_0_45_0 = var_62_0 - slot_0_47_0
                        end
                else
                        local var_62_25 = slot_0_98_0(var_62_6.x - my_old_vec.x, var_62_6.y - my_old_vec.y)

                        if var_62_25 > var_62_5 + 5 then
                                slot_0_42_0 = "RETURNING"
                        elseif slot_0_42_0 == "RETURNING" then
                                if var_62_25 <= var_62_5 then
                                        slot_0_42_0 = "MANUAL"
                                end
                        else
                                slot_0_42_0 = "MANUAL"
                        end
                end

                slot_0_56_0 = "BAIT: " .. slot_0_42_0
        else
                slot_0_42_0 = "NO WALL"
                slot_0_43_0 = nil
                slot_0_56_0 = "BAIT: NO WALL"
        end
end

function slot_0_118_0()
        slot_0_96_0 = {}

        for iter_63_0, iter_63_1 in ipairs(slot_0_97_0) do
                local var_63_0 = gui.ctx:find(iter_63_1)

                if var_63_0 then
                        local var_63_1 = var_63_0:get_value()

                        if var_63_1 and var_63_1.get then
                                slot_0_96_0[iter_63_1] = var_63_1:get()
                        end
                end
        end
end

function slot_0_119_0(arg_64_0)
        for iter_64_0, iter_64_1 in ipairs(slot_0_97_0) do
                local var_64_0 = gui.ctx:find(iter_64_1)

                if var_64_0 then
                        local var_64_1 = var_64_0:get_value()

                        if var_64_1 and var_64_1.set then
                                var_64_1:set(arg_64_0)
                        end
                end
        end
end

function slot_0_120_0()
        for iter_65_0, iter_65_1 in pairs(slot_0_96_0) do
                local var_65_0 = gui.ctx:find(iter_65_0)

                if var_65_0 then
                        local var_65_1 = var_65_0:get_value()

                        if var_65_1 and var_65_1.set then
                                var_65_1:set(iter_65_1)
                        end
                end
        end
end

function slot_0_121_0()
        local var_66_0 = game.global_vars.map_name

        if var_66_0 then
                return var_66_0
        end

        return "unknown"
end

function slot_0_122_0(arg_67_0)
        local var_67_0 = {}
        local var_67_1 = arg_67_0:get_abs_origin()

        if not var_67_1 then
                return var_67_0
        end

        if C.hb_head:get_value():get() then
                table.insert(var_67_0, vector(var_67_1.x, var_67_1.y, var_67_1.z + 68))
        end

        if C.hb_chest:get_value():get() then
                table.insert(var_67_0, vector(var_67_1.x, var_67_1.y, var_67_1.z + 48))
        end

        if C.hb_stomach:get_value():get() then
                table.insert(var_67_0, vector(var_67_1.x, var_67_1.y, var_67_1.z + 36))
        end

        if C.hb_arms:get_value():get() then
                table.insert(var_67_0, vector(var_67_1.x + 12, var_67_1.y, var_67_1.z + 48))
                table.insert(var_67_0, vector(var_67_1.x - 12, var_67_1.y, var_67_1.z + 48))
        end

        if C.hb_legs:get_value():get() then
                table.insert(var_67_0, vector(var_67_1.x, var_67_1.y, var_67_1.z + 20))
        end

        if C.hb_feet:get_value():get() then
                table.insert(var_67_0, vector(var_67_1.x, var_67_1.y, var_67_1.z + 5))
        end

        if #var_67_0 == 0 then
                table.insert(var_67_0, vector(var_67_1.x, var_67_1.y, var_67_1.z + 68))
        end

        return var_67_0
end

function slot_0_123_0(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
        if not arg_68_1 then
                return false, false, false
        end

        slot_0_51_0 = arg_68_1:get_eye_pos()

        if arg_68_2 then
                slot_0_54_0 = arg_68_2
        end

        if arg_68_3 then
                slot_0_55_0 = arg_68_3
        end

        slot_68_4_0 = false
        slot_68_5_0 = false
        slot_68_6_0 = false
        slot_0_90_0 = {}

        if C.hb_head:get_value():get() then
                slot_68_7_4 = arg_68_1:GetHitboxCenter(EHitBox.HEAD)

                if slot_68_7_4 then
                        slot_68_8_5 = ray_t()
                        slot_68_9_6 = game.physics_query_interface:trace_ray(slot_68_8_5, arg_68_0, slot_68_7_4)
                        slot_68_10_7 = slot_68_9_6 and slot_68_9_6.fraction or 0
                        slot_68_11_7, slot_68_12_6 = slot_0_109_0(arg_68_0, slot_68_7_4, nil, arg_68_1)

                        if slot_68_10_7 >= 0.97 or slot_68_11_7 and slot_68_12_6 > 30 then
                                slot_68_4_0 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Head",
                                pos = slot_68_7_4,
                                visible = slot_68_4_0,
                                frac = slot_68_10_7
                        })
                end
        end

        if C.hb_chest:get_value():get() then
                slot_68_7_3 = arg_68_1:GetHitboxCenter(EHitBox.CHEST)

                if slot_68_7_3 then
                        slot_68_8_4 = false
                        slot_68_9_5 = ray_t()
                        slot_68_10_6 = game.physics_query_interface:trace_ray(slot_68_9_5, arg_68_0, slot_68_7_3)
                        slot_68_11_6 = slot_68_10_6 and slot_68_10_6.fraction or 0
                        slot_68_12_5, slot_68_13_3 = slot_0_109_0(arg_68_0, slot_68_7_3, nil, arg_68_1)

                        if slot_68_11_6 >= 0.97 or slot_68_12_5 and slot_68_13_3 > 30 then
                                slot_68_5_0 = true
                                slot_68_8_4 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Chest",
                                pos = slot_68_7_3,
                                visible = slot_68_8_4,
                                frac = slot_68_11_6
                        })
                end
        end

        if C.hb_stomach:get_value():get() then
                slot_68_7_2 = arg_68_1:GetHitboxCenter(EHitBox.PELVIS)

                if slot_68_7_2 then
                        slot_68_8_3 = false
                        slot_68_9_4 = ray_t()
                        slot_68_10_5 = game.physics_query_interface:trace_ray(slot_68_9_4, arg_68_0, slot_68_7_2)
                        slot_68_11_5 = slot_68_10_5 and slot_68_10_5.fraction or 0
                        slot_68_12_4, slot_68_13_2 = slot_0_109_0(arg_68_0, slot_68_7_2, nil, arg_68_1)

                        if slot_68_11_5 >= 0.97 or slot_68_12_4 and slot_68_13_2 > 30 then
                                slot_68_5_0 = true
                                slot_68_8_3 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Pelvis",
                                pos = slot_68_7_2,
                                visible = slot_68_8_3,
                                frac = slot_68_11_5
                        })
                end
        end

        if C.hb_legs:get_value():get() then
                slot_68_7_1 = arg_68_1:GetHitboxCenter(EHitBox.PELVIS)

                if slot_68_7_1 then
                        slot_68_8_2 = ray_t()
                        slot_68_9_3 = game.physics_query_interface:trace_ray(slot_68_8_2, arg_68_0, slot_68_7_1)
                        slot_68_10_4 = slot_68_9_3 and slot_68_9_3.fraction or 0
                        slot_68_11_4 = slot_68_10_4 >= 0.97

                        if slot_68_11_4 then
                                slot_68_6_0 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Pelvis",
                                pos = slot_68_7_1,
                                visible = slot_68_11_4,
                                frac = slot_68_10_4
                        })
                end

                slot_68_8_1 = arg_68_1:GetHitboxCenter(EHitBox.LEFT_FOOT)
                slot_68_9_2 = arg_68_1:GetHitboxCenter(EHitBox.RIGHT_FOOT)

                if slot_68_8_1 then
                        slot_68_10_3 = ray_t()
                        slot_68_11_3 = game.physics_query_interface:trace_ray(slot_68_10_3, arg_68_0, slot_68_8_1)
                        slot_68_12_3 = slot_68_11_3 and slot_68_11_3.fraction or 0
                        slot_68_13_1 = slot_68_12_3 >= 0.97

                        if slot_68_13_1 then
                                slot_68_6_0 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Leg_L",
                                pos = slot_68_8_1,
                                visible = slot_68_13_1,
                                frac = slot_68_12_3
                        })
                end

                if slot_68_9_2 then
                        slot_68_10_2 = ray_t()
                        slot_68_11_2 = game.physics_query_interface:trace_ray(slot_68_10_2, arg_68_0, slot_68_9_2)
                        slot_68_12_2 = slot_68_11_2 and slot_68_11_2.fraction or 0
                        slot_68_13_0 = slot_68_12_2 >= 0.97

                        if slot_68_13_0 then
                                slot_68_6_0 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Leg_R",
                                pos = slot_68_9_2,
                                visible = slot_68_13_0,
                                frac = slot_68_12_2
                        })
                end
        end

        if C.hb_feet:get_value():get() then
                slot_68_7_0 = arg_68_1:GetHitboxCenter(EHitBox.LEFT_FOOT)
                slot_68_8_0 = arg_68_1:GetHitboxCenter(EHitBox.RIGHT_FOOT)

                if slot_68_7_0 then
                        slot_68_9_1 = ray_t()
                        slot_68_10_1 = game.physics_query_interface:trace_ray(slot_68_9_1, arg_68_0, slot_68_7_0)
                        slot_68_11_1 = slot_68_10_1 and slot_68_10_1.fraction or 0
                        slot_68_12_1 = slot_68_11_1 >= 0.97

                        if slot_68_12_1 then
                                slot_68_6_0 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Foot_L",
                                pos = slot_68_7_0,
                                visible = slot_68_12_1,
                                frac = slot_68_11_1
                        })
                end

                if slot_68_8_0 then
                        slot_68_9_0 = ray_t()
                        slot_68_10_0 = game.physics_query_interface:trace_ray(slot_68_9_0, arg_68_0, slot_68_8_0)
                        slot_68_11_0 = slot_68_10_0 and slot_68_10_0.fraction or 0
                        slot_68_12_0 = slot_68_11_0 >= 0.97

                        if slot_68_12_0 then
                                slot_68_6_0 = true
                        end

                        table.insert(slot_0_90_0, {
                                name = "Foot_R",
                                pos = slot_68_8_0,
                                visible = slot_68_12_0,
                                frac = slot_68_11_0
                        })
                end
        end

        slot_0_85_0 = slot_68_4_0
        slot_0_86_0 = slot_68_5_0
        slot_0_87_0 = slot_68_6_0

        return slot_68_4_0, slot_68_5_0, slot_68_6_0
end

function slot_0_124_0(arg_69_0, arg_69_1)
        if not C.mindmg_enable:get_value():get() then
                if slot_0_95_0 then
                        slot_0_120_0()

                        slot_0_95_0 = false
                end

                slot_0_88_0 = false
                slot_0_89_0 = 0

                return
        end

        if not arg_69_1 then
                if slot_0_95_0 then
                        slot_0_120_0()

                        slot_0_95_0 = false
                end

                slot_0_88_0 = false
                slot_0_89_0 = 0

                return
        end

        if not C.hb_head:get_value():get() then
                if slot_0_95_0 then
                        slot_0_120_0()

                        slot_0_95_0 = false
                end

                slot_0_88_0 = false
                slot_0_89_0 = 0

                return
        end

        local var_69_0, var_69_1, var_69_2 = slot_0_123_0(arg_69_0, arg_69_1)
        local var_69_3 = not var_69_0 and (var_69_1 or var_69_2)

        slot_0_88_0 = var_69_3
        slot_0_89_0 = var_69_3 and C.mindmg_value:get_value():get() or 0

        if var_69_3 and not slot_0_95_0 then
                slot_0_118_0()

                local var_69_4 = C.mindmg_value:get_value():get()

                slot_0_119_0(var_69_4)

                slot_0_95_0 = true
        elseif not var_69_3 and slot_0_95_0 then
                slot_0_120_0()

                slot_0_95_0 = false
        end
end

function slot_0_125_0()
        if not game or not game.global_vars then
                return
        end

        if not entities or not entities.get_local_pawn then
                return
        end

        if not C.enable:get_value():get() then
                slot_0_56_0 = "DISABLED"
                slot_0_42_0 = "DISABLED"
                slot_0_49_0 = {}
                slot_0_50_0 = {}
                slot_0_62_0 = {}
                slot_0_63_0 = {}

                if slot_0_95_0 then
                        slot_0_120_0()

                        slot_0_95_0 = false
                end

                return
        end

        if not (C.key:get_hotkey_state() or C.key:get_value():get()) then
                slot_0_56_0 = "KEY OFF"
                slot_0_42_0 = "KEY OFF"
                slot_0_49_0 = {}
                slot_0_50_0 = {}
                slot_0_62_0 = {}
                slot_0_63_0 = {}

                if slot_0_95_0 then
                        slot_0_120_0()

                        slot_0_95_0 = false
                end

                return
        end

        slot_70_1_0 = entities.get_local_pawn()

        if not slot_70_1_0 then
                return
        end

        if not slot_70_1_0:is_alive() then
                return
        end

        slot_70_2_0 = slot_70_1_0:get_eye_pos()
        slot_70_3_0 = slot_70_1_0:get_abs_origin()

        if not slot_70_2_0 or not slot_70_3_0 then
                return
        end

        slot_70_4_0 = game.input:get_view_angles()

        if not slot_70_4_0 then
                return
        end

        slot_70_5_0 = C.ignore_crouch:get_value():get()
        slot_70_6_0, slot_70_7_0, slot_70_8_0, slot_70_9_0 = slot_0_108_0(slot_70_2_0, slot_70_5_0, slot_70_4_0, my_old_vec, my_old_view)

        if slot_70_6_0 then
                slot_0_54_0 = slot_70_8_0 or "unknown"
                slot_0_55_0 = slot_70_7_0 or 0
                slot_0_51_0 = slot_70_6_0:get_eye_pos()
        else
                slot_0_54_0 = "none"
                slot_0_55_0 = 0
                slot_0_51_0 = nil
        end

        slot_0_64_0 = slot_70_3_0
        slot_0_65_0 = my_old_vec

        if not slot_0_111_0() then
                IS_WORKING = false
                WORKING_VEC = nil
                slot_0_56_0 = "INVALID WEAPON"
                slot_0_42_0 = "INVALID WEAPON"

                return
        end

        slot_0_39_0 = slot_0_113_0()
        slot_70_10_0 = C.bait_enable:get_value():get() and (slot_0_42_0 == "PEEKING" or slot_0_42_0 == "RETURNING" or slot_0_42_0 == "WAITING")

        if slot_0_40_0 and not slot_0_39_0 and my_old_vec and not slot_70_10_0 then
                slot_70_11_0 = false

                if C.return_on_shot:get_value():get() then
                        if C.return_rage_only:get_value():get() then
                                if IS_WORKING then
                                        slot_70_11_0 = true
                                end
                        else
                                slot_70_11_0 = true
                        end
                end

                if slot_70_11_0 then
                        slot_0_41_0 = true
                end
        end

        slot_0_40_0 = slot_0_39_0

        if slot_0_41_0 and my_old_vec then
                if slot_0_98_0(slot_70_3_0.x - my_old_vec.x, slot_70_3_0.y - my_old_vec.y) <= 5 then
                        slot_0_41_0 = false
                        slot_0_93_0 = false
                        slot_0_56_0 = "RETURNED"
                else
                        IS_WORKING = false
                        WORKING_VEC = my_old_vec
                        slot_0_56_0 = "RETURN"

                        if slot_70_6_0 then
                                slot_0_123_0(slot_70_2_0, slot_70_6_0, slot_70_8_0, slot_70_7_0)
                                slot_0_124_0(slot_70_2_0, slot_70_6_0)
                        end

                        return
                end
        end

        if not slot_0_39_0 then
                slot_0_56_0 = "WEAPON CD"

                return
        end

        if not slot_70_6_0 then
                IS_WORKING = false
                WORKING_VEC = nil
                slot_0_54_0 = "none"
                slot_0_55_0 = 0
                slot_0_51_0 = nil

                if slot_0_41_0 and my_old_vec then
                        WORKING_VEC = my_old_vec
                        slot_0_56_0 = "RETURN"

                        return
                end

                slot_0_56_0 = "NO ENEMY"

                return
        end

        slot_0_123_0(slot_70_2_0, slot_70_6_0, slot_70_8_0, slot_70_7_0)
        slot_0_123_0(slot_70_2_0, slot_70_6_0, slot_70_8_0, slot_70_7_0)
        slot_0_124_0(slot_70_2_0, slot_70_6_0)

        if slot_0_114_0() == 0 then
                slot_70_12_0 = 72

                if C.jump_on_enemy:get_value():get() then
                        slot_70_12_0 = slot_70_12_0 + 40
                end

                if slot_0_78_0(slot_70_3_0.z) then
                        slot_70_12_0 = 200
                end

                slot_0_59_0 = slot_70_12_0
                slot_70_15_0 = my_old_view and my_old_view.y or slot_70_4_0.y
                slot_70_16_0 = slot_0_103_0(my_old_vec, slot_70_15_0, slot_70_12_0)
                slot_0_49_0 = slot_70_16_0
                slot_70_17_0 = {}
                slot_70_18_0 = math.min(C.max_players:get_value():get(), #slot_70_9_0)
                slot_70_19_0 = {}

                for iter_70_0, iter_70_1 in ipairs(slot_70_16_0) do
                        for iter_70_2 = 1, slot_70_18_0 do
                                slot_70_29_2 = slot_70_9_0[iter_70_2]

                                if slot_70_29_2 and slot_70_29_2.pawn and slot_70_29_2.pawn:is_alive() then
                                        slot_70_30_1, slot_70_31_2 = slot_0_110_0(iter_70_1, slot_70_29_2.pawn)

                                        if slot_70_30_1 then
                                                table.insert(slot_70_17_0, iter_70_1)

                                                slot_70_19_0[iter_70_1] = slot_70_31_2

                                                break
                                        end
                                end
                        end
                end

                slot_0_50_0 = slot_70_17_0
                slot_0_91_0 = {}

                if #slot_70_16_0 == 0 then
                        IS_WORKING = false
                        WORKING_VEC = nil
                        slot_0_66_0 = nil
                        slot_0_56_0 = "NO POINT: NO SCAN"
                        slot_0_42_0 = "NO SCAN"
                        slot_0_67_0 = nil
                elseif #slot_70_17_0 > 0 then
                        slot_70_20_0 = nil
                        slot_70_21_1 = 99999
                        slot_70_22_1 = C.scan_player_width:get_value():get()
                        slot_70_23_1 = C.scan_full_body:get_value():get()
                        slot_70_24_1 = 0
                        slot_70_25_0 = 0
                        slot_70_26_0 = 0

                        for iter_70_3, iter_70_4 in ipairs(slot_70_17_0) do
                                slot_70_32_1 = math.abs(iter_70_4.z - slot_70_3_0.z)
                                slot_70_33_3 = 72

                                if C.jump_on_enemy:get_value():get() then
                                        slot_70_33_3 = slot_70_33_3 + 40
                                end

                                if slot_70_6_0 and slot_70_6_0:get_abs_origin() then
                                        slot_70_35_1 = slot_70_6_0:get_abs_origin()

                                        if math.abs(slot_70_35_1.z - slot_70_3_0.z) > 80 then
                                                slot_70_33_3 = 200
                                        end
                                end

                                if slot_70_33_3 < slot_70_32_1 then
                                        slot_70_24_1 = slot_70_24_1 + 1
                                else
                                        slot_70_35_0 = iter_70_4.x - slot_70_3_0.x
                                        slot_70_36_0 = iter_70_4.y - slot_70_3_0.y
                                        slot_70_37_0 = slot_0_98_0(slot_70_35_0, slot_70_36_0)

                                        if slot_70_37_0 < 5 then
                                                slot_70_25_0 = slot_70_25_0 + 1
                                        else
                                                slot_70_41_1, slot_70_40_1 = slot_70_35_0 / slot_70_37_0, -(slot_70_36_0 / slot_70_37_0)
                                                slot_70_42_1 = true
                                                slot_70_43_0 = math.max(3, math.floor(slot_70_37_0 / 15))
                                                slot_70_44_0 = {}
                                                slot_70_45_0 = slot_70_22_1 > 0 and {
                                                        0,
                                                        slot_70_22_1,
                                                        -slot_70_22_1
                                                } or {
                                                        0
                                                }
                                                slot_70_46_0 = slot_70_23_1 and {
                                                        10,
                                                        36,
                                                        62
                                                } or {
                                                        10
                                                }
                                                slot_70_47_0 = false

                                                if slot_70_6_0 and slot_70_6_0:get_abs_origin() then
                                                        slot_70_48_1 = slot_70_6_0:get_abs_origin()

                                                        if math.abs(slot_70_48_1.z - slot_70_3_0.z) > 80 then
                                                                slot_70_47_0 = true
                                                        end
                                                end

                                                for iter_70_5 = 1, slot_70_43_0 do
                                                        if not slot_70_42_1 then
                                                                break
                                                        end

                                                        slot_70_52_0 = iter_70_5 / slot_70_43_0
                                                        slot_70_53_0 = slot_70_3_0.x + slot_70_35_0 * slot_70_52_0
                                                        slot_70_54_0 = slot_70_3_0.y + slot_70_36_0 * slot_70_52_0
                                                        slot_70_55_0 = slot_70_47_0 and slot_70_3_0.z + (iter_70_4.z - slot_70_3_0.z) * slot_70_52_0 or slot_70_3_0.z

                                                        for iter_70_6, iter_70_7 in ipairs(slot_70_46_0) do
                                                                if not slot_70_42_1 then
                                                                        break
                                                                end

                                                                for iter_70_8, iter_70_9 in ipairs(slot_70_45_0) do
                                                                        slot_70_66_0 = slot_70_3_0.x + slot_70_40_1 * iter_70_9
                                                                        slot_70_67_0 = slot_70_3_0.y + slot_70_41_1 * iter_70_9
                                                                        slot_70_68_0 = slot_70_53_0 + slot_70_40_1 * iter_70_9
                                                                        slot_70_69_0 = slot_70_54_0 + slot_70_41_1 * iter_70_9
                                                                        slot_70_70_0 = vector(slot_70_66_0, slot_70_67_0, slot_70_3_0.z + iter_70_7)
                                                                        slot_70_71_0 = vector(slot_70_68_0, slot_70_69_0, slot_70_55_0 + iter_70_7)
                                                                        slot_70_72_0 = ray_t()
                                                                        slot_70_73_0 = game.physics_query_interface:trace_ray(slot_70_72_0, slot_70_70_0, slot_70_71_0)
                                                                        slot_70_74_0 = slot_70_73_0 and slot_70_73_0.fraction and slot_70_73_0.fraction >= 0.97

                                                                        table.insert(slot_70_44_0, {
                                                                                from = slot_70_70_0,
                                                                                to = slot_70_71_0,
                                                                                ok = slot_70_74_0
                                                                        })

                                                                        if not slot_70_74_0 then
                                                                                slot_70_42_1 = false

                                                                                break
                                                                        end
                                                                end
                                                        end
                                                end

                                                if slot_70_42_1 then
                                                        slot_70_48_0 = slot_70_19_0[iter_70_4]
                                                        slot_70_49_0 = slot_0_98_0(iter_70_4.x - slot_70_3_0.x, iter_70_4.y - slot_70_3_0.y)

                                                        if slot_70_49_0 < slot_70_21_1 then
                                                                slot_70_21_1 = slot_70_49_0
                                                                slot_70_20_0 = vector(iter_70_4.x, iter_70_4.y, slot_70_3_0.z)
                                                        end

                                                        slot_0_91_0 = slot_70_44_0
                                                else
                                                        slot_70_26_0 = slot_70_26_0 + 1
                                                end
                                        end
                                end
                        end

                        if slot_70_20_0 then
                                IS_WORKING = true
                                WORKING_VEC = slot_70_20_0
                                slot_0_66_0 = slot_70_20_0
                                slot_0_56_0 = "PEEK"
                                slot_0_42_0 = "AI PEEK"
                                slot_0_43_0 = nil
                                slot_0_67_0 = nil
                                slot_0_68_0 = nil
                        elseif not slot_70_6_0 or not slot_70_6_0:is_alive() then
                                slot_70_27_1 = C.scan_radius:get_value():get()
                                slot_70_28_1 = slot_70_27_1 * 2

                                if slot_70_28_1 > 250 then
                                        slot_70_28_1 = 250
                                end

                                slot_70_29_1 = 72

                                if C.jump_on_enemy:get_value():get() then
                                        slot_70_29_1 = slot_70_29_1 + 40
                                end

                                slot_70_31_0 = slot_0_78_0(slot_70_3_0.z)
                                slot_70_32_0 = false

                                if slot_70_6_0 and slot_70_6_0:get_abs_origin() then
                                        slot_70_33_2 = slot_70_6_0:get_abs_origin()

                                        if math.abs(slot_70_33_2.z - slot_70_3_0.z) > 80 then
                                                slot_70_32_0 = true
                                        end
                                end

                                if slot_70_31_0 or slot_70_32_0 then
                                        slot_70_29_1 = 200
                                end

                                C.scan_radius:get_value():set(slot_70_28_1)

                                slot_70_33_1 = my_old_view and my_old_view.y or slot_70_4_0.y
                                slot_70_34_1 = slot_0_103_0(my_old_vec, slot_70_33_1, slot_70_29_1)

                                C.scan_radius:get_value():set(slot_70_27_1)

                                slot_0_43_0 = nil
                                slot_0_67_0 = nil
                                slot_0_56_0 = "BAIT: ENEMY DEAD"
                        else
                                slot_0_117_0(slot_70_6_0, slot_70_7_0)
                        end
                elseif #slot_70_17_0 == 0 then
                        if C.bait_enable:get_value():get() and slot_70_6_0 and slot_70_6_0:is_alive() then
                                slot_0_117_0(slot_70_6_0, slot_70_7_0)
                        else
                                if slot_0_98_0(slot_70_3_0.x - my_old_vec.x, slot_70_3_0.y - my_old_vec.y) < 10 then
                                        slot_70_21_0 = false
                                        slot_70_22_0 = C.scan_radius:get_value():get()
                                        slot_70_23_0 = slot_70_22_0 * 2

                                        if slot_70_23_0 > 250 then
                                                slot_70_23_0 = 250
                                        end

                                        slot_70_24_0 = 72

                                        if C.jump_on_enemy:get_value():get() then
                                                slot_70_24_0 = slot_70_24_0 + 40
                                        end

                                        if slot_0_78_0(slot_70_3_0.z) then
                                                slot_70_24_0 = 200
                                        end

                                        C.scan_radius:get_value():set(slot_70_23_0)

                                        slot_70_27_0 = my_old_view and my_old_view.y or slot_70_4_0.y
                                        slot_70_28_0 = slot_0_103_0(my_old_vec, slot_70_27_0, slot_70_24_0)

                                        C.scan_radius:get_value():set(slot_70_22_0)

                                        slot_70_29_0 = math.min(C.max_players:get_value():get(), #slot_70_9_0)

                                        for iter_70_10, iter_70_11 in ipairs(slot_70_28_0) do
                                                if slot_70_22_0 < slot_0_98_0(iter_70_11.x - my_old_vec.x, iter_70_11.y - my_old_vec.y) then
                                                        for iter_70_12 = 1, slot_70_29_0 do
                                                                slot_70_40_0 = slot_70_9_0[iter_70_12]

                                                                if slot_70_40_0 and slot_70_40_0.pawn and slot_70_40_0.pawn:is_alive() then
                                                                        slot_70_41_0, slot_70_42_0 = slot_0_110_0(iter_70_11, slot_70_40_0.pawn)

                                                                        if slot_70_41_0 then
                                                                                slot_70_21_0 = true

                                                                                break
                                                                        end
                                                                end
                                                        end

                                                        if slot_70_21_0 then
                                                                break
                                                        end
                                                end
                                        end

                                        if slot_70_21_0 then
                                                slot_0_56_0 = "NO POINT: RADIUS SMALL"
                                        else
                                                slot_0_56_0 = "NO POINT: NO VISIBLE (" .. #slot_70_16_0 .. ")"
                                        end
                                else
                                        slot_0_56_0 = "NO POINT: NO VISIBLE (" .. #slot_70_16_0 .. ")"
                                end

                                slot_0_42_0 = "NO POINTS"
                                slot_0_67_0 = nil
                        end
                end
        else
                IS_WORKING = false
                WORKING_VEC = nil
                slot_0_56_0 = "NOSPREAD: TODO"
                slot_0_42_0 = "NOSPREAD"
        end
end

function slot_0_126_0(arg_71_0)
        if not C.enable:get_value():get() then
                return
        end

        slot_71_1_0 = C.key:get_hotkey_state() or C.key:get_value():get()

        if slot_71_1_0 and not slot_0_94_0 then
                slot_0_93_0 = false
        end

        slot_0_94_0 = slot_71_1_0

        if not slot_71_1_0 then
                return
        end

        slot_71_2_0 = entities.get_local_pawn()

        if not slot_71_2_0 then
                return
        end

        if not slot_71_2_0:is_alive() then
                return
        end

        if not slot_0_111_0() then
                return
        end

        slot_71_3_0 = slot_71_2_0:get_abs_origin()

        if not slot_71_3_0 then
                return
        end

        slot_71_4_0 = slot_71_2_0.m_fFlags and slot_71_2_0.m_fFlags:get() or 0
        slot_71_5_0 = bit.band(slot_71_4_0, 1) ~= 0
        slot_71_6_0 = false

        if C.jump_on_enemy:get_value():get() and WORKING_VEC and IS_WORKING and not slot_0_41_0 and not slot_0_93_0 then
                slot_71_7_2 = C.jump_distance:get_value():get()
                slot_71_8_2 = WORKING_VEC.x - slot_71_3_0.x
                slot_71_9_5 = WORKING_VEC.y - slot_71_3_0.y
                slot_71_10_7 = slot_0_98_0(slot_71_8_2, slot_71_9_5)
                slot_71_11_5 = false
                slot_71_12_3 = 0

                if slot_71_10_7 > 10 then
                        slot_71_13_4 = 64
                        slot_71_14_0 = vector(slot_71_3_0.x, slot_71_3_0.y, slot_71_3_0.z + slot_71_13_4)
                        slot_71_15_0 = vector(WORKING_VEC.x, WORKING_VEC.y, WORKING_VEC.z + slot_71_13_4)
                        slot_71_16_0 = ray_t()
                        slot_71_17_0 = game.physics_query_interface:trace_ray(slot_71_16_0, slot_71_14_0, slot_71_15_0)

                        if slot_71_17_0 and slot_71_17_0.fraction and slot_71_17_0.fraction < 0.95 then
                                slot_71_11_5 = true
                                slot_71_12_3 = slot_71_10_7 * slot_71_17_0.fraction
                        end
                end

                slot_71_13_3 = false

                if slot_71_11_5 then
                        slot_71_13_3 = slot_71_12_3 <= 50 and slot_71_12_3 > 3
                else
                        slot_71_13_3 = slot_71_10_7 <= slot_71_7_2 and slot_71_10_7 > 3
                end

                if slot_71_13_3 and slot_71_5_0 then
                        arg_71_0:set_button(input_bit_mask.in_jump)

                        slot_0_93_0 = true
                end
        end

        if C.return_on_key_release:get_value():get() and my_old_vec then
                slot_71_7_1 = arg_71_0:get_forwardmove()
                slot_71_8_1 = arg_71_0:get_leftmove()
                slot_71_9_4 = math.abs(slot_71_7_1) > 0.1 or math.abs(slot_71_8_1) > 0.1
                slot_71_10_6 = C.bait_enable:get_value():get() and (slot_0_42_0 == "PEEKING" or slot_0_42_0 == "RETURNING" or slot_0_42_0 == "WAITING")
                slot_71_11_4 = IS_WORKING and WORKING_VEC ~= nil

                if not slot_71_9_4 and not slot_0_41_0 and not slot_71_10_6 and not slot_71_11_4 and slot_0_98_0(slot_71_3_0.x - my_old_vec.x, slot_71_3_0.y - my_old_vec.y) > 5 then
                        slot_0_41_0 = true
                end

                if slot_71_9_4 and slot_0_41_0 then
                        slot_0_41_0 = false
                end
        end

        slot_71_7_0 = C.bait_enable:get_value():get() and (slot_0_42_0 == "PEEKING" or slot_0_42_0 == "RETURNING" or slot_0_42_0 == "WAITING")

        if slot_0_41_0 and my_old_vec and not slot_71_7_0 then
                slot_71_8_0 = my_old_vec.x - slot_71_3_0.x
                slot_71_9_3 = my_old_vec.y - slot_71_3_0.y

                if slot_0_98_0(slot_71_8_0, slot_71_9_3) > 5 then
                        slot_71_11_3 = math.deg(math.atan2(slot_71_9_3, slot_71_8_0))

                        arg_71_0:set_forwardmove(1)
                        arg_71_0:set_leftmove(0)
                        arg_71_0:rotate_movement(slot_71_11_3)
                end

                return
        end

        if not my_old_vec then
                return
        end

        if slot_0_98_0(slot_71_3_0.x - my_old_vec.x, slot_71_3_0.y - my_old_vec.y) <= 15 then
                slot_0_37_0 = true

                if slot_0_38_0 then
                        slot_0_38_0 = false
                end
        end

        if slot_0_38_0 then
                slot_71_9_2 = my_old_vec.x - slot_71_3_0.x
                slot_71_10_5 = my_old_vec.y - slot_71_3_0.y

                if slot_0_98_0(slot_71_9_2, slot_71_10_5) > 5 then
                        slot_71_12_2 = math.deg(math.atan2(slot_71_10_5, slot_71_9_2))

                        arg_71_0:set_forwardmove(1)
                        arg_71_0:set_leftmove(0)
                        arg_71_0:rotate_movement(slot_71_12_2)
                end

                return
        end

        if not slot_0_39_0 then
                return
        end

        if IS_WORKING and slot_0_37_0 and WORKING_VEC then
                slot_71_9_1 = WORKING_VEC.x - slot_71_3_0.x
                slot_71_10_4 = WORKING_VEC.y - slot_71_3_0.y

                if slot_0_98_0(slot_71_9_1, slot_71_10_4) > 5 then
                        slot_71_12_1 = math.deg(math.atan2(slot_71_10_4, slot_71_9_1))

                        arg_71_0:set_forwardmove(1)
                        arg_71_0:set_leftmove(0)
                        arg_71_0:rotate_movement(slot_71_12_1)
                end

                return
        end

        if C.bait_enable:get_value():get() and slot_0_43_0 then
                if slot_0_115_0() == 0 then
                        if slot_0_42_0 == "PEEKING" then
                                slot_71_10_3 = slot_0_43_0.x - slot_71_3_0.x
                                slot_71_11_2 = slot_0_43_0.y - slot_71_3_0.y

                                if slot_0_98_0(slot_71_10_3, slot_71_11_2) > 3 then
                                        slot_71_13_2 = math.deg(math.atan2(slot_71_11_2, slot_71_10_3))

                                        arg_71_0:set_forwardmove(1)
                                        arg_71_0:set_leftmove(0)
                                        arg_71_0:rotate_movement(slot_71_13_2)
                                end
                        elseif slot_0_42_0 == "RETURNING" then
                                slot_71_10_2 = my_old_vec.x - slot_71_3_0.x
                                slot_71_11_1 = my_old_vec.y - slot_71_3_0.y

                                if slot_0_98_0(slot_71_10_2, slot_71_11_1) > 3 then
                                        slot_71_13_1 = math.deg(math.atan2(slot_71_11_1, slot_71_10_2))

                                        arg_71_0:set_forwardmove(1)
                                        arg_71_0:set_leftmove(0)
                                        arg_71_0:rotate_movement(slot_71_13_1)
                                end
                        end
                elseif slot_0_42_0 == "RETURNING" then
                        slot_71_10_1 = slot_0_43_0.x - slot_71_3_0.x
                        slot_71_11_0 = slot_0_43_0.y - slot_71_3_0.y

                        if slot_0_98_0(slot_71_10_1, slot_71_11_0) > 3 then
                                slot_71_13_0 = math.deg(math.atan2(slot_71_11_0, slot_71_10_1))

                                arg_71_0:set_forwardmove(1)
                                arg_71_0:set_leftmove(0)
                                arg_71_0:rotate_movement(slot_71_13_0)
                        end
                end

                return
        end

        if not slot_0_37_0 then
                slot_71_9_0 = my_old_vec.x - slot_71_3_0.x
                slot_71_10_0 = my_old_vec.y - slot_71_3_0.y

                if slot_0_98_0(slot_71_9_0, slot_71_10_0) > 5 then
                        slot_71_12_0 = math.deg(math.atan2(slot_71_10_0, slot_71_9_0))

                        arg_71_0:set_forwardmove(1)
                        arg_71_0:set_leftmove(0)
                        arg_71_0:rotate_movement(slot_71_12_0)
                end
        end
end

function slot_0_127_0()
        if not entities or not entities.get_local_pawn then
                return
        end

        if not game or not game.input then
                return
        end

        local var_72_0 = entities.get_local_pawn()

        if not var_72_0 then
                return
        end

        if not var_72_0:is_alive() then
                return
        end

        local var_72_1 = C.key:get_hotkey_state() or C.key:get_value():get()
        local var_72_2 = var_72_0:get_abs_origin()

        if not var_72_2 then
                return
        end

        local var_72_3 = game.input:get_view_angles()
        local var_72_4 = C.scan_view_direction:get_value():get()

        if not var_72_1 then
                if my_old_vec then
                        if slot_0_98_0(var_72_2.x - my_old_vec.x, var_72_2.y - my_old_vec.y) > 5 then
                                if not var_72_4 and var_72_3 then
                                        my_old_view = {
                                                x = var_72_3.x,
                                                y = var_72_3.y
                                        }
                                end

                                my_old_vec = var_72_2
                        end
                else
                        if var_72_3 then
                                my_old_view = {
                                        x = var_72_3.x,
                                        y = var_72_3.y
                                }
                        end

                        my_old_vec = var_72_2
                end

                if var_72_4 and var_72_3 then
                        my_old_view = {
                                x = var_72_3.x,
                                y = var_72_3.y
                        }
                end

                slot_0_37_0 = false
                slot_0_38_0 = false
                IS_WORKING = false
                WORKING_VEC = nil
                slot_0_42_0 = "IDLE"
                slot_0_43_0 = nil
                slot_0_41_0 = false
                slot_0_93_0 = false
                slot_0_40_0 = true
        end
end

function slot_0_128_0()
        if not C.show_ui:get_value():get() then
                return
        end

        if not C.enable:get_value():get() then
                return
        end

        if not draw or not draw.surface then
                return
        end

        if not math or not math.world_to_screen then
                return
        end

        slot_73_0_0 = draw.surface
        slot_73_1_0 = entities.get_local_pawn()

        if not slot_73_1_0 or not slot_73_1_0:is_alive() then
                return
        end

        slot_73_2_0 = slot_73_1_0:get_abs_origin()

        if not slot_73_2_0 then
                return
        end

        slot_73_3_0 = C.key:get_hotkey_state() or C.key:get_value():get()
        slot_73_4_0 = slot_73_2_0.z
        slot_73_5_0 = slot_0_41_0 and C.ui_circle_color_return:get_value():get() or C.ui_circle_color:get_value():get()

        if my_old_vec and slot_73_3_0 then
                slot_73_6_0 = math.world_to_screen(vector(my_old_vec.x, my_old_vec.y, my_old_vec.z))

                if slot_73_6_0 then
                        slot_73_7_1 = 25
                        slot_73_8_1 = 48

                        for iter_73_0 = 5, 1, -1 do
                                slot_73_13_3 = slot_73_7_1 + iter_73_0 * 4
                                slot_73_14_3 = math.floor(40 / iter_73_0)
                                slot_73_15_3 = draw.Color(slot_73_5_0:get_r(), slot_73_5_0:get_g(), slot_73_5_0:get_b(), slot_73_14_3)

                                for iter_73_1 = 0, slot_73_8_1 - 1 do
                                        slot_73_20_1 = iter_73_1 / slot_73_8_1 * math.pi * 2
                                        slot_73_21_0 = (iter_73_1 + 1) / slot_73_8_1 * math.pi * 2
                                        slot_73_22_0 = slot_73_6_0.x + math.cos(slot_73_20_1) * slot_73_13_3
                                        slot_73_23_0 = slot_73_6_0.y + math.sin(slot_73_20_1) * slot_73_13_3
                                        slot_73_24_0 = slot_73_6_0.x + math.cos(slot_73_21_0) * slot_73_13_3
                                        slot_73_25_0 = slot_73_6_0.y + math.sin(slot_73_21_0) * slot_73_13_3

                                        slot_73_0_0:AddLine(draw.Vec2(slot_73_22_0, slot_73_23_0), draw.Vec2(slot_73_24_0, slot_73_25_0), slot_73_15_3, 2)
                                end
                        end

                        slot_73_9_0 = slot_73_7_1 - 3

                        for iter_73_2 = 0, slot_73_8_1 - 1 do
                                slot_73_14_2 = iter_73_2 / slot_73_8_1 * math.pi * 2
                                slot_73_15_2 = (iter_73_2 + 1) / slot_73_8_1 * math.pi * 2
                                slot_73_16_2 = slot_73_6_0.x + math.cos(slot_73_14_2) * slot_73_9_0
                                slot_73_17_2 = slot_73_6_0.y + math.sin(slot_73_14_2) * slot_73_9_0
                                slot_73_18_1 = slot_73_6_0.x + math.cos(slot_73_15_2) * slot_73_9_0
                                slot_73_19_1 = slot_73_6_0.y + math.sin(slot_73_15_2) * slot_73_9_0
                                slot_73_20_0 = draw.Color(slot_73_5_0:get_r(), slot_73_5_0:get_g(), slot_73_5_0:get_b(), 100)

                                slot_73_0_0:AddLine(draw.Vec2(slot_73_16_2, slot_73_17_2), draw.Vec2(slot_73_18_1, slot_73_19_1), slot_73_20_0, 1)
                        end

                        for iter_73_3 = 0, slot_73_8_1 - 1 do
                                slot_73_14_1 = iter_73_3 / slot_73_8_1 * math.pi * 2
                                slot_73_15_1 = (iter_73_3 + 1) / slot_73_8_1 * math.pi * 2
                                slot_73_16_1 = slot_73_6_0.x + math.cos(slot_73_14_1) * slot_73_7_1
                                slot_73_17_1 = slot_73_6_0.y + math.sin(slot_73_14_1) * slot_73_7_1
                                slot_73_18_0 = slot_73_6_0.x + math.cos(slot_73_15_1) * slot_73_7_1
                                slot_73_19_0 = slot_73_6_0.y + math.sin(slot_73_15_1) * slot_73_7_1

                                slot_73_0_0:AddLine(draw.Vec2(slot_73_16_1, slot_73_17_1), draw.Vec2(slot_73_18_0, slot_73_19_0), slot_73_5_0, 3)
                        end

                        slot_73_0_0:AddRectFilled(draw.rect(slot_73_6_0.x - 2, slot_73_6_0.y - 2, slot_73_6_0.x + 2, slot_73_6_0.y + 2), slot_73_5_0)
                end

                if C.show_radius:get_value():get() then
                        slot_73_7_0 = C.scan_radius:get_value():get()
                        slot_73_8_0 = draw.Color(slot_73_5_0:get_r(), slot_73_5_0:get_g(), slot_73_5_0:get_b(), 100)
                        slot_73_10_0 = (my_old_view and my_old_view.y or current_view.y) + 90
                        slot_73_11_0 = math.rad(slot_73_10_0)
                        slot_73_12_0 = math.cos(slot_73_11_0)
                        slot_73_13_0 = math.sin(slot_73_11_0)
                        slot_73_14_0 = vector(my_old_vec.x - slot_73_12_0 * slot_73_7_0, my_old_vec.y - slot_73_13_0 * slot_73_7_0, my_old_vec.z)
                        slot_73_15_0 = vector(my_old_vec.x + slot_73_12_0 * slot_73_7_0, my_old_vec.y + slot_73_13_0 * slot_73_7_0, my_old_vec.z)
                        slot_73_16_0 = math.world_to_screen(slot_73_14_0)
                        slot_73_17_0 = math.world_to_screen(slot_73_15_0)

                        if slot_73_16_0 and slot_73_17_0 then
                                slot_73_0_0:AddLine(draw.Vec2(slot_73_16_0.x, slot_73_16_0.y), draw.Vec2(slot_73_17_0.x, slot_73_17_0.y), slot_73_8_0, 2)
                                slot_73_0_0:AddRectFilled(draw.rect(slot_73_16_0.x - 3, slot_73_16_0.y - 3, slot_73_16_0.x + 3, slot_73_16_0.y + 3), slot_73_8_0)
                                slot_73_0_0:AddRectFilled(draw.rect(slot_73_17_0.x - 3, slot_73_17_0.y - 3, slot_73_17_0.x + 3, slot_73_17_0.y + 3), slot_73_8_0)
                        end
                end
        end
end

function slot_0_129_0()
        if not C.debug:get_value():get() then
                return
        end

        if not C.enable:get_value():get() then
                return
        end

        if not draw or not draw.surface then
                return
        end

        if not math or not math.world_to_screen then
                return
        end

        slot_74_0_0 = draw.surface
        slot_74_1_0 = entities.get_local_pawn()

        if not slot_74_1_0 or not slot_74_1_0:is_alive() then
                return
        end

        slot_74_2_0 = slot_74_1_0:get_abs_origin()
        slot_74_3_0 = slot_74_1_0:get_eye_pos()

        if not slot_74_2_0 or not slot_74_3_0 then
                return
        end

        slot_74_4_0 = slot_74_2_0.z
        slot_74_5_0 = C.key:get_hotkey_state() or C.key:get_value():get()
        slot_74_0_0.font = draw.fonts.gui_bold
        slot_74_6_32 = 10

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_32), "[AI PEEK DEBUG]", draw.Color(255, 200, 0, 255))

        slot_74_6_31 = slot_74_6_32 + 18

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_31), "State: " .. slot_0_56_0, draw.Color(255, 255, 255, 255))

        slot_74_6_30 = slot_74_6_31 + 16

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_30), "Enemy: " .. slot_0_54_0, draw.Color(255, 255, 255, 255))

        slot_74_6_29 = slot_74_6_30 + 16

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_29), string.format("Dist: %.0f", slot_0_55_0), draw.Color(255, 255, 255, 255))

        slot_74_6_28 = slot_74_6_29 + 16

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_28), "Key: " .. (slot_74_5_0 and "ON" or "OFF"), draw.Color(slot_74_5_0 and 0 or 255, slot_74_5_0 and 255 or 0, 0, 255))

        slot_74_6_27 = slot_74_6_28 + 16 + 4

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_27), "[STAIRS DETECTION]", draw.Color(100, 200, 255, 255))

        slot_74_6_26 = slot_74_6_27 + 16

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_26), string.format("Height Change: %.2f", slot_0_57_0), slot_0_57_0 > 0.6 and draw.Color(0, 255, 0, 255) or draw.Color(150, 150, 150, 255))

        slot_74_6_25 = slot_74_6_26 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_25), "On Stairs: " .. (slot_0_58_0 and "YES" or "NO"), slot_0_58_0 and draw.Color(0, 255, 0, 255) or draw.Color(150, 150, 150, 255))

        slot_74_6_24 = slot_74_6_25 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_24), string.format("Max Height Diff: %d", slot_0_59_0), slot_0_59_0 >= 150 and draw.Color(255, 255, 0, 255) or draw.Color(200, 200, 200, 255))

        slot_74_6_23 = slot_74_6_24 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_23), "Mode: " .. (slot_0_59_0 >= 150 and "STAIRS" or "FLAT"), slot_0_59_0 >= 150 and draw.Color(255, 255, 0, 255) or draw.Color(200, 200, 200, 255))

        slot_74_6_22 = slot_74_6_23 + 14 + 4

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_22), "[TARGET INFO]", draw.Color(255, 100, 100, 255))

        slot_74_6_21 = slot_74_6_22 + 16

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_21), string.format("Duck: %.2f", slot_0_79_0), slot_0_79_0 > 0.5 and draw.Color(255, 255, 0, 255) or draw.Color(150, 150, 150, 255))

        slot_74_6_20 = slot_74_6_21 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_20), string.format("ViewOffset.z: %.1f", slot_0_80_0), draw.Color(200, 200, 200, 255))

        slot_74_6_19 = slot_74_6_20 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_19), string.format("Flags: %d (0x%X)", slot_0_81_0, slot_0_81_0), draw.Color(200, 200, 200, 255))

        slot_74_6_18 = slot_74_6_19 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_18), string.format("Origin.z: %.1f", slot_0_82_0), draw.Color(200, 200, 200, 255))

        slot_74_6_17 = slot_74_6_18 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_17), string.format("CrouchOffset: %.1f", slot_0_83_0), slot_0_83_0 > 0 and draw.Color(0, 255, 0, 255) or draw.Color(150, 150, 150, 255))

        slot_74_6_16 = slot_74_6_17 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_16), string.format("TargetMode: %d", slot_0_84_0), draw.Color(255, 200, 0, 255))

        slot_74_6_15 = slot_74_6_16 + 14 + 4

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_15), "[PENETRATION API]", draw.Color(100, 255, 200, 255))

        slot_74_6_14 = slot_74_6_15 + 16
        slot_74_7_0 = slot_0_7_0 and draw.Color(0, 255, 0, 255) or draw.Color(255, 100, 0, 255)

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_14), "Status: " .. (slot_0_7_0 and "LOADED" or "NOT AVAILABLE"), slot_74_7_0)

        slot_74_6_13 = slot_74_6_14 + 14 + 4

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_13), "Bait: " .. slot_0_42_0, draw.Color(255, 150, 0, 255))

        slot_74_6_12 = slot_74_6_13 + 16 + 8

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_12), "[HITBOX SCAN]", draw.Color(100, 200, 255, 255))

        slot_74_6_11 = slot_74_6_12 + 16
        slot_74_8_0 = {}

        for iter_74_0, iter_74_1 in ipairs(slot_0_90_0) do
                if iter_74_1 and iter_74_1.name and iter_74_1.visible then
                        table.insert(slot_74_8_0, iter_74_1.name)
                end
        end

        if #slot_74_8_0 > 0 then
                slot_74_9_1 = table.concat(slot_74_8_0, ", ")

                slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_11), "Visible: " .. slot_74_9_1, draw.Color(0, 255, 0, 255))

                slot_74_6_11 = slot_74_6_11 + 14
        else
                slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_11), "Visible: NONE", draw.Color(255, 0, 0, 255))

                slot_74_6_11 = slot_74_6_11 + 14
        end

        slot_74_6_10 = slot_74_6_11 + 4

        for iter_74_2, iter_74_3 in ipairs(slot_0_90_0) do
                if iter_74_3 and iter_74_3.name then
                        slot_74_14_2 = iter_74_3.visible and draw.Color(0, 200, 0, 255) or draw.Color(200, 0, 0, 255)

                        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_10), string.format("  %s: %.2f", iter_74_3.name, iter_74_3.frac or 0), slot_74_14_2)

                        slot_74_6_10 = slot_74_6_10 + 12
                end
        end

        slot_74_6_9 = slot_74_6_10 + 8

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_9), "[MINDAMAGE]", draw.Color(255, 100, 200, 255))

        slot_74_6_8 = slot_74_6_9 + 16
        slot_74_9_0 = slot_0_88_0 and draw.Color(0, 255, 0, 255) or draw.Color(150, 150, 150, 255)

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_8), "Active: " .. (slot_0_88_0 and "YES" or "NO"), slot_74_9_0)

        slot_74_6_7 = slot_74_6_8 + 14

        if slot_0_88_0 then
                slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_7), "Value: " .. tostring(slot_0_89_0), draw.Color(255, 255, 0, 255))

                slot_74_6_7 = slot_74_6_7 + 14
        end

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_7), "[SCAN POINTS]", draw.Color(200, 200, 100, 255))

        slot_74_6_6 = slot_74_6_7 + 16

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_6), "All: " .. #slot_0_49_0, draw.Color(150, 150, 150, 255))

        slot_74_6_5 = slot_74_6_6 + 14

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_5), "Valid: " .. #slot_0_50_0, draw.Color(0, 255, 0, 255))

        slot_74_6_4 = slot_74_6_5 + 14
        slot_74_11_0 = C.jump_on_enemy:get_value():get() and 112 or 72

        if enemy and enemy:get_abs_origin() then
                slot_74_12_3 = enemy:get_abs_origin()

                if math.abs(slot_74_12_3.z - slot_74_2_0.z) > 80 then
                        slot_74_11_0 = 200
                end
        end

        slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_4), string.format("Height limit: %.0f", slot_74_11_0), draw.Color(200, 200, 0, 255))

        slot_74_6_3 = slot_74_6_4 + 14

        if slot_0_51_0 and slot_74_2_0 then
                slot_74_12_2 = math.abs(slot_0_51_0.z - slot_74_2_0.z)
                slot_74_13_2 = slot_74_11_0 < slot_74_12_2 and draw.Color(255, 0, 0, 255) or draw.Color(0, 255, 0, 255)

                slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_3), string.format("Height diff: %.1f", slot_74_12_2), slot_74_13_2)

                slot_74_6_2 = slot_74_6_3 + 14

                slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_2), string.format("Enemy Z: %.1f", slot_0_51_0.z), draw.Color(200, 200, 200, 255))

                slot_74_6_1 = slot_74_6_2 + 14

                slot_74_0_0:AddText(draw.Vec2(10, slot_74_6_1), string.format("Player Z: %.1f", slot_74_2_0.z), draw.Color(200, 200, 200, 255))

                slot_74_6_0 = slot_74_6_1 + 14
        end

        if not slot_74_5_0 then
                return
        end

        for iter_74_4, iter_74_5 in ipairs(slot_0_49_0) do
                if iter_74_5 and iter_74_5.x and iter_74_5.y and iter_74_5.z then
                        slot_74_17_4 = math.world_to_screen(vector(iter_74_5.x, iter_74_5.y, iter_74_5.z))

                        if slot_74_17_4 then
                                slot_74_18_3 = math.abs(iter_74_5.z - slot_74_2_0.z)
                                slot_74_20_1 = slot_74_11_0 < slot_74_18_3 and draw.Color(255, 100, 0, 150) or draw.Color(100, 100, 100, 150)

                                slot_74_0_0:AddRectFilled(draw.rect(slot_74_17_4.x - 2, slot_74_17_4.y - 2, slot_74_17_4.x + 2, slot_74_17_4.y + 2), slot_74_20_1)
                                slot_74_0_0:AddText(draw.Vec2(slot_74_17_4.x + 4, slot_74_17_4.y - 4), string.format("%.0f", slot_74_18_3), slot_74_20_1)
                        end
                end
        end

        for iter_74_6, iter_74_7 in ipairs(slot_0_50_0) do
                if iter_74_7 and iter_74_7.x and iter_74_7.y and iter_74_7.z then
                        slot_74_17_3 = math.world_to_screen(vector(iter_74_7.x, iter_74_7.y, iter_74_7.z))

                        if slot_74_17_3 then
                                slot_74_0_0:AddRectFilled(draw.rect(slot_74_17_3.x - 3, slot_74_17_3.y - 3, slot_74_17_3.x + 3, slot_74_17_3.y + 3), draw.Color(0, 255, 0, 200))
                        end
                end
        end

        for iter_74_8, iter_74_9 in ipairs(slot_0_90_0) do
                if iter_74_9 and iter_74_9.pos and iter_74_9.name then
                        slot_74_17_2 = math.world_to_screen(iter_74_9.pos)

                        if slot_74_17_2 then
                                slot_74_18_2 = iter_74_9.visible and draw.Color(0, 255, 0, 200) or draw.Color(255, 0, 0, 200)

                                slot_74_0_0:AddCircleFilled(draw.Vec2(slot_74_17_2.x, slot_74_17_2.y), 4, slot_74_18_2)
                                slot_74_0_0:AddText(draw.Vec2(slot_74_17_2.x + 6, slot_74_17_2.y - 4), iter_74_9.name, draw.Color(255, 255, 255, 255))
                        end
                end
        end

        if slot_0_51_0 and #slot_0_90_0 > 0 then
                slot_74_12_1 = math.world_to_screen(slot_74_3_0)

                if slot_74_12_1 then
                        for iter_74_10, iter_74_11 in ipairs(slot_0_90_0) do
                                if iter_74_11 and iter_74_11.pos then
                                        slot_74_18_1 = math.world_to_screen(iter_74_11.pos)

                                        if slot_74_18_1 then
                                                slot_74_19_1 = iter_74_11.visible and draw.Color(0, 255, 0, 80) or draw.Color(255, 0, 0, 80)

                                                slot_74_0_0:AddLine(draw.Vec2(slot_74_12_1.x, slot_74_12_1.y), draw.Vec2(slot_74_18_1.x, slot_74_18_1.y), slot_74_19_1)
                                        end
                                end
                        end
                end
        end

        slot_74_12_0 = slot_0_65_0 or my_old_vec

        if slot_74_12_0 then
                slot_74_13_1 = math.world_to_screen(vector(slot_74_12_0.x, slot_74_12_0.y, slot_74_12_0.z))

                if slot_74_13_1 then
                        slot_74_0_0:AddRectFilled(draw.rect(slot_74_13_1.x - 5, slot_74_13_1.y - 5, slot_74_13_1.x + 5, slot_74_13_1.y + 5), draw.Color(255, 255, 0, 255))
                        slot_74_0_0:AddText(draw.Vec2(slot_74_13_1.x + 8, slot_74_13_1.y - 5), "SAVED", draw.Color(255, 255, 0, 255))
                end
        end

        slot_74_13_0 = slot_0_66_0 or WORKING_VEC

        if slot_74_13_0 then
                slot_74_14_1 = math.world_to_screen(vector(slot_74_13_0.x, slot_74_13_0.y, slot_74_13_0.z))

                if slot_74_14_1 then
                        slot_74_0_0:AddRectFilled(draw.rect(slot_74_14_1.x - 5, slot_74_14_1.y - 5, slot_74_14_1.x + 5, slot_74_14_1.y + 5), draw.Color(0, 255, 255, 255))
                        slot_74_0_0:AddText(draw.Vec2(slot_74_14_1.x + 8, slot_74_14_1.y - 5), "TARGET", draw.Color(0, 255, 255, 255))
                end
        end

        for iter_74_12, iter_74_13 in ipairs(slot_0_91_0) do
                if iter_74_13 and iter_74_13.from and iter_74_13.to then
                        slot_74_19_0 = math.world_to_screen(iter_74_13.from)
                        slot_74_20_0 = math.world_to_screen(iter_74_13.to)

                        if slot_74_19_0 and slot_74_20_0 then
                                slot_74_21_0 = iter_74_13.ok and draw.Color(0, 255, 0, 120) or draw.Color(255, 0, 0, 200)

                                slot_74_0_0:AddLine(draw.Vec2(slot_74_19_0.x, slot_74_19_0.y), draw.Vec2(slot_74_20_0.x, slot_74_20_0.y), slot_74_21_0, 1)

                                if not iter_74_13.ok then
                                        slot_74_0_0:AddRectFilled(draw.rect(slot_74_20_0.x - 3, slot_74_20_0.y - 3, slot_74_20_0.x + 3, slot_74_20_0.y + 3), draw.Color(255, 0, 0, 255))
                                end
                        end
                end
        end

        slot_74_14_0 = slot_0_67_0 or slot_0_43_0

        if slot_74_14_0 then
                slot_74_15_0 = math.world_to_screen(vector(slot_74_14_0.x, slot_74_14_0.y, slot_74_14_0.z))

                if slot_74_15_0 then
                        slot_74_16_0 = slot_0_42_0 == "PEEKING" and draw.Color(255, 50, 0, 255) or draw.Color(255, 200, 0, 200)

                        slot_74_0_0:AddRectFilled(draw.rect(slot_74_15_0.x - 5, slot_74_15_0.y - 5, slot_74_15_0.x + 5, slot_74_15_0.y + 5), slot_74_16_0)
                        slot_74_0_0:AddText(draw.Vec2(slot_74_15_0.x + 8, slot_74_15_0.y - 5), "BAIT", slot_74_16_0)
                end
        end
end

slot_0_131_0 = "fatality" .. "/aipeek_config.txt"

function slot_0_132_0(arg_75_0, arg_75_1)
        utils.file_write(arg_75_0, utils.string_to_array(arg_75_1))

        return true
end

function slot_0_133_0(arg_76_0)
        if not utils.file_exists(arg_76_0) then
                return nil
        end

        local var_76_0 = utils.file_read(arg_76_0)

        if not var_76_0 then
                return nil
        end

        return utils.array_to_string(var_76_0)
end

function slot_0_134_0()
        function slot_77_0_0(arg_78_0)
                return string.format("%d,%d,%d,%d", arg_78_0:get_r(), arg_78_0:get_g(), arg_78_0:get_b(), arg_78_0:get_a())
        end

        return {
                enable = C.enable:get_value():get(),
                ignore_knife = C.ignore_knife:get_value():get(),
                ignore_crouch = C.ignore_crouch:get_value():get(),
                jump_on_enemy = C.jump_on_enemy:get_value():get(),
                jump_distance = C.jump_distance:get_value():get(),
                show_ui = C.show_ui:get_value():get(),
                show_radius = C.show_radius:get_value():get(),
                return_on_shot = C.return_on_shot:get_value():get(),
                return_on_key_release = C.return_on_key_release:get_value():get(),
                return_rage_only = C.return_rage_only:get_value():get(),
                debug = C.debug:get_value():get(),
                max_players = C.max_players:get_value():get(),
                hb_head = C.hb_head:get_value():get(),
                hb_chest = C.hb_chest:get_value():get(),
                hb_stomach = C.hb_stomach:get_value():get(),
                hb_legs = C.hb_legs:get_value():get(),
                hb_feet = C.hb_feet:get_value():get(),
                mindmg_enable = C.mindmg_enable:get_value():get(),
                mindmg_value = C.mindmg_value:get_value():get(),
                bait_enable = C.bait_enable:get_value():get(),
                bait_mode = C.bait_mode:get_value():get():get_raw(),
                bait_safe_peek = C.bait_safe_peek:get_value():get(),
                bait_interval_min = C.bait_interval_min:get_value():get(),
                bait_interval_max = C.bait_interval_max:get_value():get(),
                bait_duration_min = C.bait_duration_min:get_value():get(),
                bait_duration_max = C.bait_duration_max:get_value():get(),
                bait_peek_dist = C.bait_peek_dist:get_value():get(),
                bait_safe_dist = C.bait_safe_dist:get_value():get(),
                scan_segments = C.scan_segments:get_value():get(),
                scan_radius = C.scan_radius:get_value():get(),
                scan_depart = C.scan_depart:get_value():get(),
                scan_wall_dist = C.scan_wall_dist:get_value():get(),
                scan_wall_angles = C.scan_wall_angles:get_value():get(),
                scan_height_offset = C.scan_height_offset:get_value():get(),
                scan_eye_height = C.scan_eye_height:get_value():get(),
                scan_player_width = C.scan_player_width:get_value():get(),
                scan_full_body = C.scan_full_body:get_value():get(),
                scan_view_direction = C.scan_view_direction:get_value():get(),
                scan_target_mode = C.scan_target_mode:get_value():get():get_raw(),
                pen_points_per_hitbox = C.pen_points_per_hitbox:get_value():get(),
                pen_enable_legs = C.pen_enable_legs:get_value():get(),
                pen_min_damage = C.pen_min_damage:get_value():get(),
                ui_circle_color = slot_77_0_0(C.ui_circle_color:get_value():get()),
                ui_circle_color_return = slot_77_0_0(C.ui_circle_color_return:get_value():get()),
                use_fallback_offsets = C.use_fallback_offsets:get_value():get()
        }
end

function slot_0_135_0(arg_79_0)
        local var_79_0 = {
                "[AIPeek Config]"
        }

        for iter_79_0, iter_79_1 in pairs(arg_79_0) do
                if type(iter_79_1) == "boolean" then
                        table.insert(var_79_0, iter_79_0 .. "=" .. (iter_79_1 and "true" or "false"))
                else
                        table.insert(var_79_0, iter_79_0 .. "=" .. tostring(iter_79_1))
                end
        end

        return table.concat(var_79_0, "\n")
end

function slot_0_136_0(arg_80_0)
        if not arg_80_0 or arg_80_0 == "" then
                return nil
        end

        if not arg_80_0:match("%[AIPeek Config%]") then
                return nil
        end

        local var_80_0 = {}

        for iter_80_0 in arg_80_0:gmatch("[^\n]+") do
                local var_80_1, var_80_2 = iter_80_0:match("^([%w_]+)=(.+)$")

                if var_80_1 and var_80_2 then
                        if var_80_2 == "true" then
                                var_80_0[var_80_1] = true
                        elseif var_80_2 == "false" then
                                var_80_0[var_80_1] = false
                        elseif var_80_2:match("^%d+,%d+,%d+,%d+$") then
                                var_80_0[var_80_1] = var_80_2
                        else
                                var_80_0[var_80_1] = tonumber(var_80_2) or var_80_2
                        end
                end
        end

        return var_80_0
end

function slot_0_137_0(arg_81_0)
        if not arg_81_0 or type(arg_81_0) ~= "string" then
                return nil
        end

        local var_81_0, var_81_1, var_81_2, var_81_3 = arg_81_0:match("^(%d+),(%d+),(%d+),(%d+)$")

        if var_81_0 and var_81_1 and var_81_2 and var_81_3 then
                return draw.color(tonumber(var_81_0), tonumber(var_81_1), tonumber(var_81_2), tonumber(var_81_3))
        end

        return nil
end

function slot_0_138_0()
        if C.use_fallback_offsets:get_value():get() then
                slot_0_3_0 = 6336
                slot_0_4_0 = 824
                slot_0_5_0 = 352
                slot_0_6_0 = 784

                print(string.format("[AI Peek] Fallback offsets applied: m_nNextPrimaryAttackTick=0x%X, m_pGameSceneNode=0x%X, m_skeletonInstance=0x%X, m_modelState=0x%X", slot_0_3_0, slot_0_4_0, slot_0_6_0, slot_0_5_0))
                gui.notify:Add(gui.notification("AI Peek", "Fallback offsets applied!"))
        else
                local var_82_0 = entities.get_local_pawn()

                if var_82_0 then
                        local var_82_1 = var_82_0:get_active_weapon()

                        if var_82_1 then
                                slot_0_3_0 = slot_0_2_0:get_offset(var_82_1, "m_nNextPrimaryAttackTick")
                        end

                        slot_0_4_0 = slot_0_2_0:get_offset(var_82_0, "m_pGameSceneNode")
                        slot_0_6_0 = slot_0_2_0:get_offset(var_82_0, "m_skeletonInstance")
                        slot_0_5_0 = 352
                end
        end
end

function slot_0_139_0(arg_83_0)
        if not arg_83_0 then
                return false
        end

        if arg_83_0.enable ~= nil then
                C.enable:get_value():set(arg_83_0.enable)
        end

        if arg_83_0.ignore_knife ~= nil then
                C.ignore_knife:get_value():set(arg_83_0.ignore_knife)
        end

        if arg_83_0.ignore_crouch ~= nil then
                C.ignore_crouch:get_value():set(arg_83_0.ignore_crouch)
        end

        if arg_83_0.jump_on_enemy ~= nil then
                C.jump_on_enemy:get_value():set(arg_83_0.jump_on_enemy)
        end

        if arg_83_0.jump_distance then
                C.jump_distance:get_value():set(arg_83_0.jump_distance)
        end

        if arg_83_0.show_ui ~= nil then
                C.show_ui:get_value():set(arg_83_0.show_ui)
        end

        if arg_83_0.show_radius ~= nil then
                C.show_radius:get_value():set(arg_83_0.show_radius)
        end

        if arg_83_0.return_on_shot ~= nil then
                C.return_on_shot:get_value():set(arg_83_0.return_on_shot)
        end

        if arg_83_0.return_on_key_release ~= nil then
                C.return_on_key_release:get_value():set(arg_83_0.return_on_key_release)
        end

        if arg_83_0.return_rage_only ~= nil then
                C.return_rage_only:get_value():set(arg_83_0.return_rage_only)
        end

        if arg_83_0.debug ~= nil then
                C.debug:get_value():set(arg_83_0.debug)
        end

        if arg_83_0.max_players then
                C.max_players:get_value():set(arg_83_0.max_players)
        end

        if arg_83_0.hb_head ~= nil then
                C.hb_head:get_value():set(arg_83_0.hb_head)
        end

        if arg_83_0.hb_chest ~= nil then
                C.hb_chest:get_value():set(arg_83_0.hb_chest)
        end

        if arg_83_0.hb_stomach ~= nil then
                C.hb_stomach:get_value():set(arg_83_0.hb_stomach)
        end

        if arg_83_0.hb_legs ~= nil then
                C.hb_legs:get_value():set(arg_83_0.hb_legs)
        end

        if arg_83_0.hb_feet ~= nil then
                C.hb_feet:get_value():set(arg_83_0.hb_feet)
        end

        if arg_83_0.mindmg_enable ~= nil then
                C.mindmg_enable:get_value():set(arg_83_0.mindmg_enable)
        end

        if arg_83_0.mindmg_value then
                C.mindmg_value:get_value():set(arg_83_0.mindmg_value)
        end

        if arg_83_0.bait_enable ~= nil then
                C.bait_enable:get_value():set(arg_83_0.bait_enable)
        end

        if arg_83_0.bait_mode then
                slot_83_1_3 = C.bait_mode:get_value():get()

                if slot_83_1_3 then
                        slot_83_1_3:set_raw(arg_83_0.bait_mode)
                        C.bait_mode:get_value():set(slot_83_1_3)
                end
        end

        if arg_83_0.bait_safe_peek ~= nil then
                C.bait_safe_peek:get_value():set(arg_83_0.bait_safe_peek)
        end

        if arg_83_0.bait_interval_min then
                C.bait_interval_min:get_value():set(arg_83_0.bait_interval_min)
        end

        if arg_83_0.bait_interval_max then
                C.bait_interval_max:get_value():set(arg_83_0.bait_interval_max)
        end

        if arg_83_0.bait_duration_min then
                C.bait_duration_min:get_value():set(arg_83_0.bait_duration_min)
        end

        if arg_83_0.bait_duration_max then
                C.bait_duration_max:get_value():set(arg_83_0.bait_duration_max)
        end

        if arg_83_0.bait_peek_dist then
                C.bait_peek_dist:get_value():set(arg_83_0.bait_peek_dist)
        end

        if arg_83_0.bait_safe_dist then
                C.bait_safe_dist:get_value():set(arg_83_0.bait_safe_dist)
        end

        if arg_83_0.scan_segments then
                C.scan_segments:get_value():set(arg_83_0.scan_segments)
        end

        if arg_83_0.scan_radius then
                C.scan_radius:get_value():set(arg_83_0.scan_radius)
        end

        if arg_83_0.scan_depart then
                C.scan_depart:get_value():set(arg_83_0.scan_depart)
        end

        if arg_83_0.scan_wall_dist then
                C.scan_wall_dist:get_value():set(arg_83_0.scan_wall_dist)
        end

        if arg_83_0.scan_wall_angles then
                C.scan_wall_angles:get_value():set(arg_83_0.scan_wall_angles)
        end

        if arg_83_0.scan_height_offset then
                C.scan_height_offset:get_value():set(arg_83_0.scan_height_offset)
        end

        if arg_83_0.scan_eye_height then
                C.scan_eye_height:get_value():set(arg_83_0.scan_eye_height)
        end

        if arg_83_0.scan_player_width then
                C.scan_player_width:get_value():set(arg_83_0.scan_player_width)
        end

        if arg_83_0.scan_full_body ~= nil then
                C.scan_full_body:get_value():set(arg_83_0.scan_full_body)
        end

        if arg_83_0.scan_view_direction ~= nil then
                C.scan_view_direction:get_value():set(arg_83_0.scan_view_direction)
        end

        if arg_83_0.pen_points_per_hitbox then
                C.pen_points_per_hitbox:get_value():set(arg_83_0.pen_points_per_hitbox)
        end

        if arg_83_0.pen_enable_legs ~= nil then
                C.pen_enable_legs:get_value():set(arg_83_0.pen_enable_legs)
        end

        if arg_83_0.pen_min_damage then
                C.pen_min_damage:get_value():set(arg_83_0.pen_min_damage)
        end

        if arg_83_0.scan_target_mode then
                slot_83_1_2 = C.scan_target_mode:get_value():get()

                if slot_83_1_2 then
                        slot_83_1_2:set_raw(arg_83_0.scan_target_mode)
                        C.scan_target_mode:get_value():set(slot_83_1_2)
                end
        end

        slot_83_1_1 = slot_0_137_0(arg_83_0.ui_circle_color)

        if slot_83_1_1 then
                C.ui_circle_color:get_value():set(slot_83_1_1)
        end

        slot_83_1_0 = slot_0_137_0(arg_83_0.ui_circle_color_return)

        if slot_83_1_0 then
                C.ui_circle_color_return:get_value():set(slot_83_1_0)
        end

        if arg_83_0.use_fallback_offsets ~= nil then
                C.use_fallback_offsets:get_value():set(arg_83_0.use_fallback_offsets)
                slot_0_138_0()
        end

        return true
end

function slot_0_140_0()
        local var_84_0 = slot_0_134_0()

        if utils.DbSave(var_84_0, "aipeek_config") then
                gui.notify:Add(gui.notification("AI Peek", "Config saved!"))

                return true
        end

        gui.notify:Add(gui.notification("AI Peek", "Save failed!"))

        return false
end

function slot_0_141_0()
        local var_85_0 = utils.DbLoad("aipeek_config")

        if not var_85_0 then
                gui.notify:Add(gui.notification("AI Peek", "No config file!"))

                return false
        end

        if slot_0_139_0(var_85_0) then
                gui.notify:Add(gui.notification("AI Peek", "Config loaded!"))

                return true
        end

        gui.notify:Add(gui.notification("AI Peek", "Load failed!"))

        return false
end

function slot_0_142_0()
        local var_86_0 = utils.DbLoad("aipeek_config")

        if var_86_0 and slot_0_139_0(var_86_0) then
                return true
        end

        return false
end

function slot_0_143_0()
        local var_87_0 = slot_0_134_0()
        local var_87_1 = utils.JsonEncode(var_87_0)

        if utils and utils.ClipboardSet then
                utils.ClipboardSet(var_87_1)
                gui.notify:Add(gui.notification("AI Peek", "Config exported to clipboard!"))

                return true
        end

        gui.notify:Add(gui.notification("AI Peek", "Export failed!"))

        return false
end

function slot_0_144_0()
        local var_88_0

        if utils and utils.ClipboardGet then
                var_88_0 = utils.ClipboardGet()
        end

        if not var_88_0 or var_88_0 == "" then
                gui.notify:Add(gui.notification("AI Peek", "Clipboard empty!"))

                return false
        end

        local var_88_1 = utils.JsonDecode(var_88_0)

        if var_88_1 and slot_0_139_0(var_88_1) then
                gui.notify:Add(gui.notification("AI Peek", "Config imported!"))

                return true
        end

        gui.notify:Add(gui.notification("AI Peek", "Import failed!"))

        return false
end

slot_0_145_0 = {}

if slot_0_34_0 then
        slot_0_145_0.tab = gui.make_control("[AI Peek] Tab", C.tab)
        slot_0_145_0.enable = gui.make_control("Enable", C.enable)
        slot_0_145_0.key = gui.make_control("Key [bind hotkey]", C.key)
        slot_0_145_0.ignore_knife = gui.make_control("Ignore Weapon Check", C.ignore_knife)
        slot_0_145_0.ignore_crouch = gui.make_control("Ignore Crouching", C.ignore_crouch)
        slot_0_145_0.jump_on_enemy = gui.make_control("Jump On Enemy", C.jump_on_enemy)
        slot_0_145_0.jump_distance = gui.make_control("Jump Distance", C.jump_distance)
        slot_0_145_0.show_ui = gui.make_control("Show UI", C.show_ui)
        slot_0_145_0.show_radius = gui.make_control("Show Radius", C.show_radius)
        slot_0_145_0.ui_circle_color = gui.make_control("Circle Color", C.ui_circle_color)
        slot_0_145_0.ui_circle_color_return = gui.make_control("Return Color", C.ui_circle_color_return)
        slot_0_145_0.return_on_shot = gui.make_control("Return On Shot", C.return_on_shot)
        slot_0_145_0.return_on_key_release = gui.make_control("Return On Key Release", C.return_on_key_release)
        slot_0_145_0.return_rage_only = gui.make_control("Rage Only", C.return_rage_only)
        slot_0_145_0.debug = gui.make_control("Debug Visualize", C.debug)
        slot_0_145_0.max_players = gui.make_control("Max Players Scan", C.max_players)
        slot_0_145_0.hb_head = gui.make_control("Head", C.hb_head)
        slot_0_145_0.hb_chest = gui.make_control("Chest", C.hb_chest)
        slot_0_145_0.hb_stomach = gui.make_control("Pelvis", C.hb_stomach)
        slot_0_145_0.hb_legs = gui.make_control("Legs", C.hb_legs)
        slot_0_145_0.hb_feet = gui.make_control("Feet", C.hb_feet)
        slot_0_145_0.mindmg_enable = gui.make_control("Mindmg Override", C.mindmg_enable)
        slot_0_145_0.mindmg_value = gui.make_control("Mindmg Value", C.mindmg_value)
        slot_0_145_0.bait_enable = gui.make_control("Enable Bait", C.bait_enable)
        slot_0_145_0.bait_mode = gui.make_control("Bait Mode", C.bait_mode)
        slot_0_145_0.bait_safe_peek = gui.make_control("Safe Peek (Anti-WB)", C.bait_safe_peek)
        slot_0_145_0.bait_interval_min = gui.make_control("Interval Min", C.bait_interval_min)
        slot_0_145_0.bait_interval_max = gui.make_control("Interval Max", C.bait_interval_max)
        slot_0_145_0.bait_duration_min = gui.make_control("Duration Min", C.bait_duration_min)
        slot_0_145_0.bait_duration_max = gui.make_control("Duration Max", C.bait_duration_max)
        slot_0_145_0.bait_peek_dist = gui.make_control("Bait Distance", C.bait_peek_dist)
        slot_0_145_0.bait_safe_dist = gui.make_control("Safe Distance", C.bait_safe_dist)
        slot_0_145_0.scan_radius = gui.make_control("Peek Radius", C.scan_radius)
        slot_0_145_0.scan_segments = gui.make_control("Segments", C.scan_segments)
        slot_0_145_0.scan_depart = gui.make_control("Department", C.scan_depart)
        slot_0_145_0.scan_wall_dist = gui.make_control("Wall Check Dist", C.scan_wall_dist)
        slot_0_145_0.scan_wall_angles = gui.make_control("Wall Check Angles", C.scan_wall_angles)
        slot_0_145_0.scan_height_offset = gui.make_control("Height Offset", C.scan_height_offset)
        slot_0_145_0.scan_eye_height = gui.make_control("Eye Height", C.scan_eye_height)
        slot_0_145_0.scan_player_width = gui.make_control("Player Width", C.scan_player_width)
        slot_0_145_0.scan_full_body = gui.make_control("Full Body Check", C.scan_full_body)
        slot_0_145_0.scan_view_direction = gui.make_control("View Direction", C.scan_view_direction)
        slot_0_145_0.scan_target_mode = gui.make_control("Target Mode", C.scan_target_mode)
        slot_0_145_0.pen_points_per_hitbox = gui.make_control("Points Per Hitbox", C.pen_points_per_hitbox)
        slot_0_145_0.pen_enable_legs = gui.make_control("Enable Legs", C.pen_enable_legs)
        slot_0_145_0.pen_min_damage = gui.make_control("Min Damage", C.pen_min_damage)
        slot_0_145_0.scan_defaults = gui.make_control("Reset Defaults", C.scan_defaults)
        slot_0_145_0.cfg_save = gui.make_control("Save", C.cfg_save)
        slot_0_145_0.cfg_load = gui.make_control("Load", C.cfg_load)
        slot_0_145_0.cfg_export = gui.make_control("Export", C.cfg_export)
        slot_0_145_0.cfg_import = gui.make_control("Import", C.cfg_import)
        slot_0_145_0.cfg_reset = gui.make_control("Reset Defaults", C.cfg_reset)
        slot_0_145_0.use_fallback_offsets = gui.make_control("Use Fallback Offsets", C.use_fallback_offsets)

        if slot_0_0_0 then
                slot_0_145_0.discord = gui.make_control("", C.discord)
        end

        slot_0_34_0:Add(slot_0_145_0.tab)
        slot_0_34_0:reset()

        if slot_0_0_0 and slot_0_145_0.discord then
                slot_0_34_0:Add(slot_0_145_0.discord)
                slot_0_34_0:reset()
        end

        slot_0_34_0:Add(slot_0_145_0.enable)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.key)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.ignore_knife)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.ignore_crouch)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.jump_on_enemy)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.jump_distance)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.show_ui)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.show_radius)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.ui_circle_color)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.ui_circle_color_return)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.return_on_shot)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.return_on_key_release)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.return_rage_only)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.debug)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_radius)
        slot_0_34_0:reset()
        slot_0_145_0.pen_points_per_hitbox:set_visible(is_scanner)
        slot_0_145_0.pen_enable_legs:set_visible(is_scanner)
        slot_0_145_0.pen_min_damage:set_visible(is_scanner)
        slot_0_145_0.scan_defaults:set_visible(is_scanner)
        slot_0_34_0:Add(slot_0_145_0.hb_head)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.hb_chest)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.hb_stomach)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.hb_legs)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.hb_feet)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.mindmg_enable)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.mindmg_value)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_enable)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_mode)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_safe_peek)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_interval_min)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_interval_max)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_duration_min)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_duration_max)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_peek_dist)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.bait_safe_dist)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_segments)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_depart)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_wall_dist)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_wall_angles)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_height_offset)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_eye_height)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_player_width)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_full_body)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_target_mode)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.pen_points_per_hitbox)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.pen_enable_legs)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.pen_min_damage)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.scan_defaults)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.cfg_save)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.cfg_load)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.cfg_export)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.cfg_import)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.cfg_reset)
        slot_0_34_0:reset()
        slot_0_34_0:Add(slot_0_145_0.use_fallback_offsets)
        slot_0_34_0:reset()
end

slot_0_142_0()

function slot_0_146_0()
        for iter_89_0, iter_89_1 in pairs(slot_0_145_0) do
                if iter_89_1 and iter_89_1.set_visible then
                        iter_89_1:set_visible(false)
                end
        end
end

function slot_0_147_0()
        if not slot_0_145_0.tab then
                return
        end

        if slot_0_0_0 and (not slot_0_16_0.init_complete or not slot_0_29_0()) then
                slot_0_146_0()

                return
        end

        slot_0_145_0.tab:set_visible(true)

        if slot_0_0_0 and slot_0_145_0.discord then
                slot_0_145_0.discord:set_visible(true)
        end

        slot_90_0_0 = C.tab:get_value():get():get_raw()
        slot_90_1_0 = slot_90_0_0 == 1
        slot_90_2_0 = slot_90_0_0 == 2
        slot_90_3_0 = slot_90_0_0 == 4
        slot_90_4_0 = slot_90_0_0 == 8
        slot_90_5_0 = slot_90_0_0 == 16
        slot_90_6_0 = slot_90_0_0 == 32
        slot_90_7_0 = C.bait_enable:get_value():get()
        slot_90_8_0 = slot_90_7_0 and slot_0_115_0() == 0

        slot_0_145_0.enable:set_visible(slot_90_1_0)
        slot_0_145_0.key:set_visible(slot_90_1_0)
        slot_0_145_0.ignore_knife:set_visible(slot_90_1_0)
        slot_0_145_0.ignore_crouch:set_visible(slot_90_1_0)
        slot_0_145_0.jump_on_enemy:set_visible(slot_90_1_0)

        slot_90_9_0 = C.jump_on_enemy:get_value():get()

        slot_0_145_0.jump_distance:set_visible(slot_90_1_0 and slot_90_9_0)
        slot_0_145_0.show_ui:set_visible(slot_90_1_0)

        slot_90_10_0 = C.show_ui:get_value():get()

        slot_0_145_0.show_radius:set_visible(slot_90_1_0 and slot_90_10_0)
        slot_0_145_0.ui_circle_color:set_visible(slot_90_5_0)
        slot_0_145_0.ui_circle_color_return:set_visible(slot_90_5_0)
        slot_0_145_0.return_on_shot:set_visible(slot_90_1_0)
        slot_0_145_0.return_on_key_release:set_visible(slot_90_1_0)

        slot_90_11_0 = C.return_on_shot:get_value():get()

        slot_0_145_0.return_rage_only:set_visible(slot_90_1_0 and slot_90_11_0)
        slot_0_145_0.scan_radius:set_visible(slot_90_1_0)
        slot_0_145_0.scan_view_direction:set_visible(slot_90_1_0)
        slot_0_145_0.debug:set_visible(slot_90_1_0)

        slot_90_12_0 = C.mindmg_enable:get_value():get()

        slot_0_145_0.max_players:set_visible(slot_90_2_0)
        slot_0_145_0.hb_head:set_visible(slot_90_2_0)
        slot_0_145_0.hb_chest:set_visible(slot_90_2_0)
        slot_0_145_0.hb_stomach:set_visible(slot_90_2_0)
        slot_0_145_0.hb_legs:set_visible(slot_90_2_0)
        slot_0_145_0.hb_feet:set_visible(slot_90_2_0)
        slot_0_145_0.mindmg_enable:set_visible(slot_90_2_0)
        slot_0_145_0.mindmg_value:set_visible(slot_90_2_0 and slot_90_12_0)
        slot_0_145_0.bait_enable:set_visible(slot_90_3_0)
        slot_0_145_0.bait_mode:set_visible(slot_90_3_0 and slot_90_7_0)
        slot_0_145_0.bait_safe_peek:set_visible(slot_90_3_0 and slot_90_7_0)
        slot_0_145_0.bait_interval_min:set_visible(slot_90_3_0 and slot_90_8_0)
        slot_0_145_0.bait_interval_max:set_visible(slot_90_3_0 and slot_90_8_0)
        slot_0_145_0.bait_duration_min:set_visible(slot_90_3_0 and slot_90_8_0)
        slot_0_145_0.bait_duration_max:set_visible(slot_90_3_0 and slot_90_8_0)
        slot_0_145_0.bait_peek_dist:set_visible(slot_90_3_0 and slot_90_7_0)
        slot_0_145_0.bait_safe_dist:set_visible(slot_90_3_0 and slot_90_7_0)
        slot_0_145_0.scan_segments:set_visible(slot_90_4_0)
        slot_0_145_0.scan_depart:set_visible(slot_90_4_0)
        slot_0_145_0.scan_wall_dist:set_visible(slot_90_4_0)
        slot_0_145_0.scan_wall_angles:set_visible(slot_90_4_0)
        slot_0_145_0.scan_height_offset:set_visible(slot_90_4_0)
        slot_0_145_0.scan_eye_height:set_visible(slot_90_4_0)
        slot_0_145_0.scan_player_width:set_visible(slot_90_4_0)
        slot_0_145_0.scan_full_body:set_visible(slot_90_4_0)
        slot_0_145_0.scan_target_mode:set_visible(slot_90_4_0)
        slot_0_145_0.pen_points_per_hitbox:set_visible(slot_90_4_0)
        slot_0_145_0.pen_enable_legs:set_visible(slot_90_4_0)
        slot_0_145_0.pen_min_damage:set_visible(slot_90_4_0)
        slot_0_145_0.scan_defaults:set_visible(slot_90_4_0)
        slot_0_145_0.cfg_save:set_visible(slot_90_6_0)
        slot_0_145_0.cfg_load:set_visible(slot_90_6_0)
        slot_0_145_0.cfg_export:set_visible(slot_90_6_0)
        slot_0_145_0.cfg_import:set_visible(slot_90_6_0)
        slot_0_145_0.cfg_reset:set_visible(slot_90_6_0)
        slot_0_145_0.use_fallback_offsets:set_visible(slot_90_6_0)
end

C.tab:get_value():get():set(1)
C.tab:AddCallback(function()
        if C.tab:get_value():get():get_raw() == 0 then
                C.tab:get_value():get():set(1)
        end
end)
C.cfg_save:AddCallback(function()
        slot_0_140_0()
end)
C.cfg_load:AddCallback(function()
        slot_0_141_0()
end)
C.cfg_export:AddCallback(function()
        slot_0_143_0()
end)
C.cfg_import:AddCallback(function()
        slot_0_144_0()
end)
C.cfg_reset:AddCallback(function()
        slot_0_36_0()
end)
C.scan_defaults:AddCallback(function()
        slot_0_35_0()
end)
C.use_fallback_offsets:AddCallback(slot_0_138_0)
events.present_queue:Add(function()
        if not game or not game.global_vars then
                return
        end

        if not entities or not entities.get_local_pawn then
                return
        end

        if not gui or not gui.ctx then
                return
        end

        slot_0_30_0()

        if not slot_0_29_0() then
                slot_0_146_0()

                return
        end

        if not entities.get_local_pawn() then
                return
        end

        slot_0_147_0()
        slot_0_127_0()
        slot_0_125_0()
        slot_0_128_0()
        slot_0_129_0()

        if C and C.debug and C.debug:get_value():get() then
                slot_0_11_0()
        end
end)
events.create_move:Add(function(arg_99_0)
        if not arg_99_0 then
                return
        end

        if not game or not game.global_vars then
                return
        end

        if not entities or not entities.get_local_pawn then
                return
        end

        if not slot_0_29_0() then
                return
        end

        if not entities.get_local_pawn() then
                return
        end

        slot_0_126_0(arg_99_0)
end)

function slot_0_148_0()
        my_old_vec = nil
        my_old_view = {
                x = 0,
                y = 0
        }
        IS_WORKING = false
        WORKING_VEC = nil
        slot_0_37_0 = false
        slot_0_38_0 = false
        slot_0_41_0 = false
        slot_0_42_0 = "IDLE"
        slot_0_43_0 = nil
        slot_0_44_0 = nil
        slot_0_45_0 = 0
        slot_0_46_0 = 0
        slot_0_92_0 = false
        slot_0_93_0 = false
        slot_0_49_0 = {}
        slot_0_50_0 = {}
        slot_0_51_0 = nil
        slot_0_54_0 = "none"
        slot_0_55_0 = 0
        slot_0_56_0 = "IDLE"
        slot_0_60_0 = nil
        slot_0_61_0 = nil
        slot_0_62_0 = {}
        slot_0_63_0 = {}
        slot_0_64_0 = nil
        slot_0_65_0 = nil
        slot_0_66_0 = nil
        slot_0_67_0 = nil
        slot_0_68_0 = nil
        slot_0_90_0 = {}
        slot_0_91_0 = {}

        if slot_0_95_0 then
                slot_0_120_0()

                slot_0_95_0 = false
        end
end

events.event:Add(function(arg_101_0)
        if not arg_101_0 then
                return
        end

        local var_101_0 = arg_101_0:get_name()

        if not var_101_0 then
                return
        end

        if var_101_0 == "round_start" then
                slot_0_148_0()
        elseif var_101_0 == "map_shutdown" or var_101_0 == "game_newmap" then
                slot_0_148_0()

                slot_0_49_0 = {}
                slot_0_50_0 = {}
                slot_0_90_0 = {}
                slot_0_91_0 = {}
                slot_0_62_0 = {}
                slot_0_63_0 = {}
        elseif var_101_0 == "cs_win_panel_match" or var_101_0 == "announce_phase_end" then
                slot_0_148_0()
        end
end)

slot_0_149_0 = 0

function slot_0_150_0()
        local var_102_0 = globals.realtime()

        if var_102_0 - slot_0_149_0 >= 1 then
                slot_0_149_0 = var_102_0

                print(string.format("[AI Peek Debug] Offsets: m_nNextPrimaryAttackTick=0x%X, m_pGameSceneNode=0x%X, m_skeletonInstance=0x%X, m_modelState=0x%X", slot_0_3_0, slot_0_4_0, slot_0_6_0, slot_0_5_0))
        end
end

if events and events.render then
        events.render:Add(slot_0_150_0)
elseif callbacks and callbacks.add then
        callbacks.add(e_callbacks.PAINT, slot_0_150_0, "offset_debug")
end

gui.notify:Add(gui.notification("AI Peek", "Loaded!"))
print("[AI Peek] If you have issues, join our Discord: https://discord.gg/8jQVnmnwwE")
gui.notify:Add(gui.notification("AI Peek", "If you have issues, use Fallback offsets in config tab"))
