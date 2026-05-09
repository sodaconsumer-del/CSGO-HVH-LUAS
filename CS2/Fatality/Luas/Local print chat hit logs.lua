--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = (function()
        return function(arg_2_0, arg_2_1, arg_2_2)
                if arg_2_0 == nil then
                        return arg_2_0
                end

                local var_2_0 = ffi.cast("uintptr_t", arg_2_0) + arg_2_1

                return var_2_0 + ffi.sizeof("int") + ffi.cast("int", ffi.cast("int*", var_2_0)[0]) + arg_2_2
        end
end)()
slot_0_1_0 = ffi.cast("void*(__fastcall*)(const char*)", utils.find_pattern("client.dll", "40 55 48 83 EC 20 48 83 3D"))
slot_0_2_0 = ffi.cast("void*(__cdecl*)(void*, unsigned int, const char*, ...)", slot_0_0_0(utils.find_pattern("client.dll", "E8 ? ? ? ? 49 8B 4E ? BA ? ? ? ? 48 83 C1 ? E8"), 1, 0))
slot_0_3_0 = slot_0_1_0("HudChatDelegate")

function slot_0_4_0(arg_3_0)
        slot_0_2_0(slot_0_3_0, -1, arg_3_0)
end

slot_0_5_0 = gui.combo_box(gui.control_id("hit_log"))
slot_0_6_0 = gui.selectable(gui.control_id("hit_log_EN"), "EN")
slot_0_7_0 = gui.selectable(gui.control_id("hit_log_CN"), "CN")
slot_0_8_0 = gui.selectable(gui.control_id("hit_log_OFF"), "OFF")

slot_0_5_0:add(slot_0_6_0)
slot_0_5_0:add(slot_0_7_0)
slot_0_5_0:add(slot_0_8_0)

slot_0_9_0 = gui.make_control("[Hit Log] ", slot_0_5_0)
slot_0_10_0 = gui.ctx:find("lua>elements a")

slot_0_10_0:add(slot_0_9_0)
slot_0_10_0:reset()

slot_0_11_0 = nil

function getSpeedPercentage(arg_4_0)
        if arg_4_0 <= 75 then
                return tostring(100) .. "%%"
        elseif arg_4_0 >= 150 then
                return "\x02NS"
        else
                return tostring(math.floor(100 - (arg_4_0 - 75) / 75 * 100)) .. "%%"
        end
end

events.event:add(function(arg_5_0)
        if arg_5_0:get_name() == "player_hurt" then
                if arg_5_0:get_string("weapon") == "" then
                        return
                end

                local var_5_0 = arg_5_0:get_pawn_from_id("attacker"):get_name()
                local var_5_1 = arg_5_0:get_pawn_from_id("userid"):get_name()
                local var_5_2 = entities.get_local_pawn():get_name()
                local var_5_3 = arg_5_0:get_int("dmg_health")
                local var_5_4 = arg_5_0:get_string("weapon")
                local var_5_5 = arg_5_0:get_int("health")
                local var_5_6 = arg_5_0:get_int("hitgroup")

                if var_5_0 ~= var_5_2 or var_5_3 == 0 or arg_5_0:get_pawn_from_id("userid"):is_enemy() == false then
                        return
                end

                local var_5_7 = getSpeedPercentage(slot_0_11_0)

                print(string.format("[%s] %s %d %s %d %d", var_5_4, var_5_1, var_5_3, hit_location, var_5_5, slot_0_11_0))

                local var_5_8 = slot_0_5_0:get_value():get():get_raw()

                if var_5_8 == 2 then
                        local var_5_9 = ({
                                "身体",
                                "头部",
                                "胸部",
                                "胃部",
                                "左胳膊",
                                "右胳膊",
                                "左脚",
                                "右腿",
                                "脖子",
                                "?",
                                "gear"
                        })[var_5_6 + 1] or "?"

                        slot_0_4_0("\x01[\x02Fata\x01lity\x01] " .. "\x01命中\x04 " .. var_5_1 .. "\x01 的 \x04" .. var_5_9 .. "\x01 伤害: \x04" .. tostring(var_5_3) .. "\x01 剩余HP: \x02" .. tostring(var_5_5) .. "\x01 命中率: \x04" .. var_5_7)
                end

                if var_5_8 == 1 then
                        local var_5_10 = ({
                                "body",
                                "head",
                                "chest",
                                "stomach",
                                "left arm",
                                "right arm",
                                "left leg",
                                "right leg",
                                "neck",
                                "?",
                                "gear"
                        })[var_5_6 + 1] or "?"

                        slot_0_4_0("\x01[\x02Fata\x01lity\x01] " .. "\x01Hit\x04 " .. var_5_1 .. "\x01's \x04" .. var_5_10 .. "\x01 for \x04" .. tostring(var_5_3) .. "\x01 (\x02" .. tostring(var_5_5) .. "\x01 health remaining) hc: \x04" .. var_5_7)
                end
        end
end)

function slot_0_12_0()
        lp = entities.get_local_pawn()

        if not lp then
                return
        end

        local var_6_0 = lp:get_abs_origin()

        if not prev_lp_pos then
                prev_lp_pos = var_6_0
        end

        local var_6_1 = var_6_0.x - prev_lp_pos.x
        local var_6_2 = var_6_0.y - prev_lp_pos.y
        local var_6_3 = var_6_0.z - prev_lp_pos.z

        slot_0_11_0 = math.sqrt(var_6_1 * var_6_1 + var_6_2 * var_6_2 + var_6_3 * var_6_3) / game.global_vars.frame_time
        slot_0_11_0 = math.floor(slot_0_11_0)
        prev_lp_pos = var_6_0
end

events.present_queue:add(slot_0_12_0)
