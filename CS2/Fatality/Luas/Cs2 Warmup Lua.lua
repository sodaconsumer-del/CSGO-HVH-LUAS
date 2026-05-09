--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = "warmup"
slot_0_1_0 = {}
slot_0_2_0 = false

function slot_0_3_0(arg_1_0)
        return gui and gui.control_id and gui.control_id(slot_0_0_0 .. "_" .. arg_1_0) or slot_0_0_0 .. "_" .. arg_1_0
end

function slot_0_4_0(arg_2_0)
        if game and game.engine and game.engine.client_cmd then
                game.engine:client_cmd(arg_2_0, true)
        end
end

function slot_0_5_0(arg_3_0)
        if not arg_3_0 then
                return nil
        end

        local var_3_0 = arg_3_0.get_value and arg_3_0:get_value() or arg_3_0.GetValue and arg_3_0:GetValue()

        if not var_3_0 then
                return nil
        end

        return var_3_0.get and var_3_0:get() or var_3_0.Get and var_3_0:Get() or var_3_0.value or var_3_0.Value
end

function slot_0_6_0(arg_4_0, arg_4_1)
        if not arg_4_0 then
                return
        end

        local var_4_0 = arg_4_0.get_value and arg_4_0:get_value() or arg_4_0.GetValue and arg_4_0:GetValue()

        if var_4_0 and (var_4_0.set or var_4_0.Set) then
                (var_4_0.set or var_4_0.Set)(var_4_0, arg_4_1)
        end

        if arg_4_0.SetValue then
                arg_4_0:SetValue(arg_4_1)
        end

        if arg_4_0.set_value then
                arg_4_0:set_value(arg_4_1)
        end
end

function slot_0_7_0(arg_5_0)
        if gui and gui.notification then
                gui.notification(arg_5_0)
        else
                print("[Warmup] " .. tostring(arg_5_0))
        end
end

function slot_0_8_0()
        if not slot_0_1_0.all_settings or not slot_0_5_0(slot_0_1_0.all_settings) then
                slot_0_7_0("Enable 'All settings on' first.")

                return
        end

        if not game or not game.engine then
                return
        end

        slot_0_4_0("sv_cheats 1")
        slot_0_4_0("sv_quantize_movement_input false")
        slot_0_4_0("sv_infinite_ammo " .. (slot_0_5_0(slot_0_1_0.infinite_ammo) and "1" or "0"))
        slot_0_4_0("mp_autoteambalance " .. (slot_0_5_0(slot_0_1_0.autoteambalance) and "1" or "0"))
        slot_0_4_0("mp_autokick " .. (slot_0_5_0(slot_0_1_0.autokick) and "1" or "0"))
        slot_0_4_0("mp_buy_anywhere " .. (slot_0_5_0(slot_0_1_0.buy_anywhere) and "1" or "0"))
        slot_0_4_0("mp_buytime " .. tostring(math.floor(tonumber(slot_0_5_0(slot_0_1_0.mp_buytime)) or 999999)))
        slot_0_4_0("impulse 101")
        slot_0_4_0("bot_stop " .. (slot_0_5_0(slot_0_1_0.bot_stop) and "1" or "0"))
        slot_0_4_0("mp_respawn_on_death_ct " .. (slot_0_5_0(slot_0_1_0.respawn) and "true" or "false"))
        slot_0_4_0("mp_respawn_on_death_t " .. (slot_0_5_0(slot_0_1_0.respawn) and "true" or "false"))
        slot_0_4_0("mp_free_armor " .. (slot_0_5_0(slot_0_1_0.free_armor) and "1" or "0"))
        slot_0_4_0("mp_freezetime " .. tostring(math.floor(tonumber(slot_0_5_0(slot_0_1_0.mp_freezetime)) or 0)))
        slot_0_4_0("mp_spawnprotectiontime " .. tostring(math.floor(tonumber(slot_0_5_0(slot_0_1_0.spawn_protection)) or 0)))
        slot_0_4_0("bot_kick")

        slot_6_0_0 = math.max(0, math.min(10, math.floor(tonumber(slot_0_5_0(slot_0_1_0.bot_add_t)) or 0)))
        slot_6_1_0 = math.max(0, math.min(10, math.floor(tonumber(slot_0_5_0(slot_0_1_0.bot_add_ct)) or 0)))

        for iter_6_0 = 1, slot_6_0_0 do
                slot_0_4_0("bot_add_t")
        end

        for iter_6_1 = 1, slot_6_1_0 do
                slot_0_4_0("bot_add_ct")
        end

        if slot_0_5_0(slot_0_1_0.bot_stop) then
                slot_0_4_0("bot_stop 1")
        end

        slot_6_2_0 = math.floor(tonumber(slot_0_5_0(slot_0_1_0.bot_difficulty)) or 0)

        if slot_6_2_0 >= 0 and slot_6_2_0 <= 3 then
                slot_0_4_0("bot_difficulty " .. slot_6_2_0)
        end

        slot_0_4_0("sv_enablebunnyhopping " .. (slot_0_5_0(slot_0_1_0.bhop) and "1" or "0"))
        slot_0_4_0("sv_maxvelocity " .. tostring(math.floor(tonumber(slot_0_5_0(slot_0_1_0.sv_maxvelocity)) or 7000)))
        slot_0_4_0("sv_staminamax 0")
        slot_0_4_0("sv_staminalandcost 0")
        slot_0_4_0("sv_staminajumpcost 0")
        slot_0_4_0("sv_accelerate_use_weapon_speed 0")
        slot_0_4_0("sv_staminarecoveryrate 0")
        slot_0_4_0("sv_autobunnyhopping " .. (slot_0_5_0(slot_0_1_0.autobhop) and "1" or "0"))
        slot_0_4_0("sv_airaccelerate " .. tostring(math.floor(tonumber(slot_0_5_0(slot_0_1_0.sv_airaccel)) or 2000)))

        slot_6_3_0 = math.floor(tonumber(slot_0_5_0(slot_0_1_0.sv_gravity)) or 800)

        if slot_6_3_0 >= 0 and slot_6_3_0 <= 1000 then
                slot_0_4_0("sv_gravity " .. slot_6_3_0)
        end

        slot_6_4_0 = tonumber(slot_0_5_0(slot_0_1_0.mp_roundtime)) or 60

        slot_0_4_0("mp_roundtime " .. slot_6_4_0)
        slot_0_4_0("mp_roundtime_defuse " .. slot_6_4_0)
        slot_0_4_0("mp_roundtime_hostage " .. slot_6_4_0)
        slot_0_7_0("Warmup applied.")
end

function slot_0_9_0()
        slot_0_4_0("mp_restartgame 1")
        slot_0_7_0("Round restarted.")
end

function slot_0_10_0()
        slot_0_4_0("bot_kick")
        slot_0_7_0("Bots kicked.")
end

function slot_0_11_0()
        if not slot_0_1_0.mp_buytime then
                return
        end

        slot_0_6_0(slot_0_1_0.auto_apply, false)
        slot_0_6_0(slot_0_1_0.all_settings, true)
        slot_0_6_0(slot_0_1_0.mp_buytime, 999999)
        slot_0_6_0(slot_0_1_0.mp_roundtime, 60)
        slot_0_6_0(slot_0_1_0.mp_freezetime, 0)
        slot_0_6_0(slot_0_1_0.spawn_protection, 0)
        slot_0_6_0(slot_0_1_0.buy_anywhere, true)
        slot_0_6_0(slot_0_1_0.free_armor, true)
        slot_0_6_0(slot_0_1_0.sv_maxvelocity, 7000)
        slot_0_6_0(slot_0_1_0.sv_airaccel, 2000)
        slot_0_6_0(slot_0_1_0.sv_gravity, 800)
        slot_0_6_0(slot_0_1_0.bhop, true)
        slot_0_6_0(slot_0_1_0.autobhop, true)
        slot_0_6_0(slot_0_1_0.bot_add_t, 1)
        slot_0_6_0(slot_0_1_0.bot_add_ct, 3)
        slot_0_6_0(slot_0_1_0.bot_difficulty, 0)
        slot_0_6_0(slot_0_1_0.bot_stop, true)
        slot_0_6_0(slot_0_1_0.infinite_ammo, true)
        slot_0_6_0(slot_0_1_0.respawn, true)
        slot_0_6_0(slot_0_1_0.autoteambalance, false)
        slot_0_6_0(slot_0_1_0.autokick, false)
        slot_0_7_0("Defaults reset.")
end

function slot_0_12_0()
        slot_0_6_0(slot_0_1_0.all_settings, true)
        slot_0_6_0(slot_0_1_0.mp_buytime, 999999)
        slot_0_6_0(slot_0_1_0.mp_roundtime, 60)
        slot_0_6_0(slot_0_1_0.mp_freezetime, 0)
        slot_0_6_0(slot_0_1_0.buy_anywhere, true)
        slot_0_6_0(slot_0_1_0.free_armor, true)
        slot_0_6_0(slot_0_1_0.bot_add_t, 5)
        slot_0_6_0(slot_0_1_0.bot_add_ct, 5)
        slot_0_6_0(slot_0_1_0.bot_stop, true)
        slot_0_6_0(slot_0_1_0.infinite_ammo, true)
        slot_0_6_0(slot_0_1_0.respawn, true)
        slot_0_8_0()
        slot_0_7_0("Preset: Aim")
end

function slot_0_13_0()
        slot_0_6_0(slot_0_1_0.all_settings, true)
        slot_0_6_0(slot_0_1_0.sv_maxvelocity, 7000)
        slot_0_6_0(slot_0_1_0.sv_airaccel, 2000)
        slot_0_6_0(slot_0_1_0.sv_gravity, 800)
        slot_0_6_0(slot_0_1_0.bhop, true)
        slot_0_6_0(slot_0_1_0.autobhop, true)
        slot_0_6_0(slot_0_1_0.bot_add_t, 0)
        slot_0_6_0(slot_0_1_0.bot_add_ct, 0)
        slot_0_6_0(slot_0_1_0.infinite_ammo, true)
        slot_0_6_0(slot_0_1_0.respawn, true)
        slot_0_6_0(slot_0_1_0.mp_roundtime, 60)
        slot_0_6_0(slot_0_1_0.mp_freezetime, 0)
        slot_0_8_0()
        slot_0_7_0("Preset: Movement")
end

function slot_0_14_0()
        slot_0_11_0()
        slot_0_8_0()
        slot_0_7_0("Preset: Full warmup")
end

function slot_0_15_0()
        slot_0_6_0(slot_0_1_0.all_settings, true)
        slot_0_6_0(slot_0_1_0.free_armor, true)
        slot_0_6_0(slot_0_1_0.mp_buytime, 999999)
        slot_0_6_0(slot_0_1_0.mp_roundtime, 60)
        slot_0_6_0(slot_0_1_0.mp_freezetime, 0)
        slot_0_6_0(slot_0_1_0.spawn_protection, 0)
        slot_0_6_0(slot_0_1_0.buy_anywhere, true)
        slot_0_6_0(slot_0_1_0.bot_add_t, 1)
        slot_0_6_0(slot_0_1_0.bot_add_ct, 3)
        slot_0_6_0(slot_0_1_0.bot_stop, true)
        slot_0_6_0(slot_0_1_0.infinite_ammo, true)
        slot_0_6_0(slot_0_1_0.respawn, true)
        slot_0_6_0(slot_0_1_0.autoteambalance, false)
        slot_0_6_0(slot_0_1_0.autokick, false)
        slot_0_6_0(slot_0_1_0.sv_maxvelocity, 700)
        slot_0_6_0(slot_0_1_0.sv_airaccel, 200)
        slot_0_6_0(slot_0_1_0.bhop, true)
        slot_0_6_0(slot_0_1_0.autobhop, true)
        slot_0_8_0()
        slot_0_7_0("Preset: 3 Bots HVH")
end

function slot_0_16_0()
        if not gui or slot_0_2_0 then
                return
        end

        slot_14_0_0 = gui.GetMainWindow and gui.GetMainWindow() or gui.get_main_window and gui.get_main_window()

        if not slot_14_0_0 or not slot_14_0_0.AddTab and not slot_14_0_0.add_tab then
                return
        end

        slot_14_1_0 = slot_14_0_0.AddTab or slot_14_0_0.add_tab
        slot_14_2_0 = gui.TabLayoutMode and (gui.TabLayoutMode.SUBTABS or gui.TabLayoutMode.Subtabs)
        slot_14_3_0 = gui.TabLayoutMode and (gui.TabLayoutMode.DEFAULT or gui.TabLayoutMode.Default)
        slot_14_4_0 = gui.GroupWidthMode and (gui.GroupWidthMode.REDUCED or gui.GroupWidthMode.Reduced or gui.GroupWidthMode.FULL or gui.GroupWidthMode.Full)

        if not slot_14_2_0 or not slot_14_3_0 or not slot_14_4_0 then
                return
        end

        slot_14_5_0 = gui.Checkbox or gui.checkbox
        slot_14_6_0 = gui.Slider or gui.slider
        slot_14_7_0 = gui.Button or gui.button
        slot_14_8_0 = gui.MakeControl or gui.make_control
        slot_14_9_0 = gui.Group or gui.group

        if not slot_14_5_0 or not slot_14_9_0 then
                return
        end

        slot_14_10_0 = nil

        if draw and draw.textures then
                slot_14_10_0 = draw.textures.gui_icon_rage or draw.textures.gui_icon_visuals or draw.textures.gui_icon_down
        end

        if not slot_14_10_0 then
                return
        end

        slot_14_11_0 = slot_14_1_0(slot_14_0_0, "warmup_tab", slot_14_10_0, "Warmup", slot_14_2_0)

        if not slot_14_11_0 then
                return
        end

        slot_14_12_0 = slot_14_11_0.AddTab or slot_14_11_0.add_tab

        if not slot_14_12_0 then
                return
        end

        slot_14_13_0 = slot_14_12_0(slot_14_11_0, "warmup_gen", "General", slot_14_3_0, true)
        slot_14_14_0 = slot_14_12_0(slot_14_11_0, "warmup_round", "Round & Buy", slot_14_3_0, false)
        slot_14_15_0 = slot_14_12_0(slot_14_11_0, "warmup_mov", "Movement", slot_14_3_0, false)
        slot_14_16_0 = slot_14_12_0(slot_14_11_0, "warmup_bots", "Bots", slot_14_3_0, false)
        slot_14_17_0 = slot_14_12_0(slot_14_11_0, "warmup_extra", "Extra", slot_14_3_0, false)
        slot_14_18_0 = slot_14_12_0(slot_14_11_0, "warmup_apply", "Apply", slot_14_3_0, false)

        if not slot_14_13_0 or not slot_14_14_0 then
                return
        end

        function slot_14_19_0(arg_15_0, arg_15_1, arg_15_2)
                if not arg_15_1 then
                        return
                end

                local var_15_0 = slot_14_8_0 and slot_14_8_0(arg_15_2 or "", arg_15_1)

                if var_15_0 then
                        (arg_15_0.Add or arg_15_0.add)(arg_15_0, var_15_0)
                else
                        (arg_15_0.Add or arg_15_0.add)(arg_15_0, arg_15_1)
                end
        end

        function slot_14_20_0(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
                local var_16_0 = slot_14_9_0 and slot_14_9_0(arg_16_1, arg_16_2, arg_16_3 or 140, slot_14_4_0)

                if not var_16_0 then
                        return nil
                end

                ;(arg_16_0.Add or arg_16_0.add)(arg_16_0, var_16_0)

                return var_16_0
        end

        function slot_14_21_0(arg_17_0, arg_17_1)
                local var_17_0 = arg_17_0.AddCallback or arg_17_0.add_callback

                if var_17_0 then
                        var_17_0(arg_17_0, function()
                                arg_17_1()
                        end)
                end
        end

        slot_14_22_0 = slot_14_20_0(slot_14_13_0, "warmup_grp_gen", "General", 120)

        if slot_14_22_0 then
                slot_0_1_0.auto_apply = slot_14_5_0(slot_0_3_0("auto_apply"))
                slot_0_1_0.all_settings = slot_14_5_0(slot_0_3_0("all_settings"))
                slot_0_1_0.apply_delay = slot_14_6_0 and slot_14_6_0(slot_0_3_0("apply_delay"), 0, 5, {
                        "%.1f"
                }, 0.5)

                slot_14_19_0(slot_14_22_0, slot_0_1_0.auto_apply, "Auto apply")
                slot_14_19_0(slot_14_22_0, slot_0_1_0.all_settings, "All settings on")

                if slot_0_1_0.apply_delay then
                        slot_14_19_0(slot_14_22_0, slot_0_1_0.apply_delay, "Apply delay")
                end
        end

        if slot_14_7_0 then
                slot_14_23_1 = slot_14_20_0(slot_14_13_0, "warmup_grp_act", "Actions", 100)

                if slot_14_23_1 then
                        slot_14_24_4 = slot_14_7_0(slot_0_3_0("apply"), "Apply Warmup")
                        slot_14_25_2 = slot_14_7_0(slot_0_3_0("reset"), "Reset defaults")

                        slot_14_19_0(slot_14_23_1, slot_14_24_4, "")
                        slot_14_19_0(slot_14_23_1, slot_14_25_2, "")
                        slot_14_21_0(slot_14_24_4, slot_0_8_0)
                        slot_14_21_0(slot_14_25_2, slot_0_11_0)
                end
        end

        slot_14_23_0 = slot_14_20_0(slot_14_14_0, "warmup_grp_round", "Round & Buy", 220)

        if slot_14_23_0 then
                slot_0_1_0.mp_buytime = slot_14_6_0 and slot_14_6_0(slot_0_3_0("mp_buytime"), 0, 999999, {
                        "%.0f"
                }, 1)
                slot_0_1_0.mp_roundtime = slot_14_6_0 and slot_14_6_0(slot_0_3_0("mp_roundtime"), 0.5, 60, {
                        "%.1f"
                }, 0.5)
                slot_0_1_0.mp_freezetime = slot_14_6_0 and slot_14_6_0(slot_0_3_0("mp_freezetime"), 0, 60, {
                        "%.0f"
                }, 1)
                slot_0_1_0.spawn_protection = slot_14_6_0 and slot_14_6_0(slot_0_3_0("spawn_protection"), 0, 10, {
                        "%.0f"
                }, 0.5)
                slot_0_1_0.buy_anywhere = slot_14_5_0(slot_0_3_0("buy_anywhere"))
                slot_0_1_0.free_armor = slot_14_5_0(slot_0_3_0("free_armor"))

                slot_14_19_0(slot_14_23_0, slot_0_1_0.mp_buytime, "Buy time")
                slot_14_19_0(slot_14_23_0, slot_0_1_0.mp_roundtime, "Round time")
                slot_14_19_0(slot_14_23_0, slot_0_1_0.mp_freezetime, "Freeze time")
                slot_14_19_0(slot_14_23_0, slot_0_1_0.spawn_protection, "Spawn protec")
                slot_14_19_0(slot_14_23_0, slot_0_1_0.buy_anywhere, "Buy anywhere")
                slot_14_19_0(slot_14_23_0, slot_0_1_0.free_armor, "Free armor")
        end

        if slot_14_15_0 then
                slot_14_24_3 = slot_14_20_0(slot_14_15_0, "warmup_grp_mov", "Movement", 200)

                if slot_14_24_3 then
                        slot_0_1_0.sv_maxvelocity = slot_14_6_0 and slot_14_6_0(slot_0_3_0("sv_maxvelocity"), 0, 9000, {
                                "%.0f"
                        }, 10)
                        slot_0_1_0.sv_airaccel = slot_14_6_0 and slot_14_6_0(slot_0_3_0("sv_airaccel"), 0, 3000, {
                                "%.0f"
                        }, 10)
                        slot_0_1_0.sv_gravity = slot_14_6_0 and slot_14_6_0(slot_0_3_0("sv_gravity"), 0, 1000, {
                                "%.0f"
                        }, 10)
                        slot_0_1_0.bhop = slot_14_5_0(slot_0_3_0("bhop"))
                        slot_0_1_0.autobhop = slot_14_5_0(slot_0_3_0("autobhop"))

                        slot_14_19_0(slot_14_24_3, slot_0_1_0.sv_maxvelocity, "Max velocity")
                        slot_14_19_0(slot_14_24_3, slot_0_1_0.sv_airaccel, "Air accel")
                        slot_14_19_0(slot_14_24_3, slot_0_1_0.sv_gravity, "Gravity")
                        slot_14_19_0(slot_14_24_3, slot_0_1_0.bhop, "Bhop")
                        slot_14_19_0(slot_14_24_3, slot_0_1_0.autobhop, "Auto bhop")
                end
        end

        if slot_14_16_0 then
                slot_14_24_2 = slot_14_20_0(slot_14_16_0, "warmup_grp_bots", "Bots", 180)

                if slot_14_24_2 then
                        slot_0_1_0.bot_add_t = slot_14_6_0 and slot_14_6_0(slot_0_3_0("bot_add_t"), 0, 10, {
                                "%.0f"
                        }, 1)
                        slot_0_1_0.bot_add_ct = slot_14_6_0 and slot_14_6_0(slot_0_3_0("bot_add_ct"), 0, 10, {
                                "%.0f"
                        }, 1)
                        slot_0_1_0.bot_difficulty = slot_14_6_0 and slot_14_6_0(slot_0_3_0("bot_difficulty"), 0, 3, {
                                "%.0f"
                        }, 1)
                        slot_0_1_0.bot_stop = slot_14_5_0(slot_0_3_0("bot_stop"))

                        slot_14_19_0(slot_14_24_2, slot_0_1_0.bot_add_t, "T bots")
                        slot_14_19_0(slot_14_24_2, slot_0_1_0.bot_add_ct, "CT bots")
                        slot_14_19_0(slot_14_24_2, slot_0_1_0.bot_difficulty, "Difficulty (0-3)")
                        slot_14_19_0(slot_14_24_2, slot_0_1_0.bot_stop, "Freeze bots")
                end
        end

        if slot_14_17_0 then
                slot_14_24_1 = slot_14_20_0(slot_14_17_0, "warmup_grp_extra", "Extra", 160)

                if slot_14_24_1 then
                        slot_0_1_0.infinite_ammo = slot_14_5_0(slot_0_3_0("infinite_ammo"))
                        slot_0_1_0.respawn = slot_14_5_0(slot_0_3_0("respawn"))
                        slot_0_1_0.autoteambalance = slot_14_5_0(slot_0_3_0("autoteambalance"))
                        slot_0_1_0.autokick = slot_14_5_0(slot_0_3_0("autokick"))

                        slot_14_19_0(slot_14_24_1, slot_0_1_0.infinite_ammo, "Infinite ammo")
                        slot_14_19_0(slot_14_24_1, slot_0_1_0.respawn, "Respawn")
                        slot_14_19_0(slot_14_24_1, slot_0_1_0.autoteambalance, "Auto balance")
                        slot_14_19_0(slot_14_24_1, slot_0_1_0.autokick, "Auto kick")
                end
        end

        if slot_14_18_0 and slot_14_7_0 then
                slot_14_24_0 = slot_14_20_0(slot_14_18_0, "warmup_grp_presets", "Presets", 140)

                if slot_14_24_0 then
                        slot_14_25_1 = slot_14_7_0(slot_0_3_0("preset_aim"), "5 Bots Def")
                        slot_14_26_1 = slot_14_7_0(slot_0_3_0("preset_mov"), "Movement")
                        slot_14_27_1 = slot_14_7_0(slot_0_3_0("preset_hvh"), "3 Bots hvh set")

                        slot_14_19_0(slot_14_24_0, slot_14_25_1, "")
                        slot_14_19_0(slot_14_24_0, slot_14_26_1, "")
                        slot_14_19_0(slot_14_24_0, slot_14_27_1, "")
                        slot_14_21_0(slot_14_25_1, slot_0_12_0)
                        slot_14_21_0(slot_14_26_1, slot_0_13_0)
                        slot_14_21_0(slot_14_27_1, slot_0_15_0)
                end

                slot_14_25_0 = slot_14_20_0(slot_14_18_0, "warmup_grp_actions", "Actions", 140)

                if slot_14_25_0 then
                        slot_14_26_0 = slot_14_7_0(slot_0_3_0("apply2"), "Apply Warmup")
                        slot_14_27_0 = slot_14_7_0(slot_0_3_0("kick_bots"), "Kick bots")
                        slot_14_28_0 = slot_14_7_0(slot_0_3_0("mp_restart"), "Mp restart")

                        slot_14_19_0(slot_14_25_0, slot_14_26_0, "")
                        slot_14_19_0(slot_14_25_0, slot_14_27_0, "")
                        slot_14_19_0(slot_14_25_0, slot_14_28_0, "")
                        slot_14_21_0(slot_14_26_0, slot_0_8_0)
                        slot_14_21_0(slot_14_27_0, slot_0_10_0)
                        slot_14_21_0(slot_14_28_0, slot_0_9_0)
                end
        end

        slot_0_6_0(slot_0_1_0.auto_apply, false)
        slot_0_6_0(slot_0_1_0.all_settings, true)

        if slot_0_1_0.apply_delay then
                slot_0_6_0(slot_0_1_0.apply_delay, 1)
        end

        if slot_0_1_0.mp_buytime then
                slot_0_6_0(slot_0_1_0.mp_buytime, 999999)
        end

        if slot_0_1_0.mp_roundtime then
                slot_0_6_0(slot_0_1_0.mp_roundtime, 60)
        end

        if slot_0_1_0.mp_freezetime then
                slot_0_6_0(slot_0_1_0.mp_freezetime, 0)
        end

        if slot_0_1_0.spawn_protection then
                slot_0_6_0(slot_0_1_0.spawn_protection, 0)
        end

        slot_0_6_0(slot_0_1_0.buy_anywhere, true)
        slot_0_6_0(slot_0_1_0.free_armor, true)

        if slot_0_1_0.sv_maxvelocity then
                slot_0_6_0(slot_0_1_0.sv_maxvelocity, 7000)
        end

        if slot_0_1_0.sv_airaccel then
                slot_0_6_0(slot_0_1_0.sv_airaccel, 2000)
        end

        if slot_0_1_0.sv_gravity then
                slot_0_6_0(slot_0_1_0.sv_gravity, 800)
        end

        slot_0_6_0(slot_0_1_0.bhop, true)
        slot_0_6_0(slot_0_1_0.autobhop, true)

        if slot_0_1_0.bot_add_t then
                slot_0_6_0(slot_0_1_0.bot_add_t, 1)
        end

        if slot_0_1_0.bot_add_ct then
                slot_0_6_0(slot_0_1_0.bot_add_ct, 3)
        end

        if slot_0_1_0.bot_difficulty then
                slot_0_6_0(slot_0_1_0.bot_difficulty, 0)
        end

        slot_0_6_0(slot_0_1_0.bot_stop, true)
        slot_0_6_0(slot_0_1_0.infinite_ammo, true)
        slot_0_6_0(slot_0_1_0.respawn, true)
        slot_0_6_0(slot_0_1_0.autoteambalance, false)
        slot_0_6_0(slot_0_1_0.autokick, false)

        slot_0_2_0 = true
end

if events and events.present_queue then
        events.present_queue:add(slot_0_16_0)
end

slot_0_17_0 = ""

if events and events.frame_stage_notify then
        events.frame_stage_notify:add(function()
                if not slot_0_1_0.auto_apply or not slot_0_5_0(slot_0_1_0.auto_apply) then
                        return
                end

                if not slot_0_1_0.all_settings or not slot_0_5_0(slot_0_1_0.all_settings) then
                        return
                end

                if not game or not game.global_vars then
                        return
                end

                local var_19_0 = game.global_vars.map_name or ""

                if var_19_0 == "" or var_19_0 == slot_0_17_0 then
                        return
                end

                slot_0_17_0 = var_19_0

                local var_19_1 = slot_0_1_0.apply_delay and (tonumber(slot_0_5_0(slot_0_1_0.apply_delay)) or 0) or 0

                if var_19_1 > 0 then
                        slot_0_1_0._delay_until = (game.global_vars.real_time or 0) + var_19_1
                else
                        slot_0_8_0()
                end
        end)
end

if events and events.present_queue then
        events.present_queue:add(function()
                if not slot_0_1_0._delay_until or not game or not game.global_vars then
                        return
                end

                if (game.global_vars.real_time or 0) < slot_0_1_0._delay_until then
                        return
                end

                slot_0_1_0._delay_until = nil

                if slot_0_5_0(slot_0_1_0.auto_apply) and slot_0_5_0(slot_0_1_0.all_settings) then
                        slot_0_8_0()
                end
        end)
end
