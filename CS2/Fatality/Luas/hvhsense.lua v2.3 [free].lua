--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = true
slot_0_1_0 = ""
slot_0_2_0 = false
slot_0_3_0 = {
        C_WeaponDEagle = "Desert Eagle",
        C_Molotov = "Molotov",
        C_WeaponG3SG1 = "G3SG1",
        C_IncGrenade = "Incendiary",
        C_KnifeGG = "Knife",
        C_WeaponSCAR20 = "SCAR-20",
        C_Knife = "Knife",
        C_WeaponMP5SD = "MP5-SD",
        C_USP = "USP-S",
        C_WeaponAWP = "AWP",
        C_WeaponM4A1 = "M4A1-S",
        C_M4A4 = "M4A4",
        C_AK47 = "AK-47",
        C_WeaponGalilAR = "Galil AR",
        C_HEGrenade = "HE",
        C_WeaponBizon = "PP-Bizon",
        C_WeaponUMP45 = "UMP-45",
        C_WeaponP90 = "P90",
        C_Flashbang = "Flash",
        C_WeaponMP7 = "MP7",
        C_SmokeGrenade = "Smoke",
        C_WeaponMP9 = "MP9",
        C_WeaponMAC10 = "MAC-10",
        C_Revolver = "R8 Revolver",
        C_WeaponNegev = "Negev",
        C_WeaponElite = "Dual Berettas",
        C_WeaponM249 = "M249",
        C_WeaponCZ75a = "CZ75-Auto",
        C_WeaponMag7 = "MAG-7",
        C_WeaponFiveSeven = "Five-SeveN",
        C_WeaponSawedoff = "Sawed-Off",
        C_WeaponSSG08 = "SSG 08",
        C_WeaponTec9 = "Tec-9",
        C_WeaponXM1014 = "XM1014",
        C_WeaponP250 = "P250",
        C_WeaponNOVA = "Nova",
        C_WeaponHKP2000 = "P2000",
        C_WeaponSG556 = "SG 553",
        C_WeaponGlock = "Glock-18",
        C_WeaponFamas = "FAMAS",
        C_WeaponAug = "AUG"
}
slot_0_4_0 = {
        C_Nomad = true,
        C_Talon = true,
        C_Fists = true,
        C_Kukri = true,
        C_Skeleton = true,
        C_KnifeGG = true,
        C_Stiletto = true,
        C_Knife = true,
        C_Navaja = true,
        C_Ursus = true,
        C_Survival = true,
        C_Paracord = true,
        C_ShadowDaggers = true,
        C_Butterfly = true,
        C_Bowie = true,
        C_Falchion = true,
        C_Huntsman = true,
        C_M9Bayonet = true,
        C_Karambit = true,
        C_Gut = true,
        C_Flip = true,
        C_Bayonet = true
}
slot_0_5_0 = 0
slot_0_6_0 = 0.5
slot_0_7_0 = {}
slot_0_8_0 = {}
slot_0_9_0 = nil
slot_0_10_0 = 0
slot_0_11_0 = {}
slot_0_12_0 = 2
slot_0_13_0 = false
slot_0_14_0 = gui.checkbox(gui.control_id("knife_dt_hvhsense"))
slot_0_15_0 = gui.checkbox(gui.control_id("watermark_enable"))
slot_0_16_0 = gui.checkbox(gui.control_id("bf4_hitlogs_enable"))
slot_0_17_0 = gui.checkbox(gui.control_id("ping_esp_enable"))
slot_0_18_0 = 0
slot_0_19_0 = gui.checkbox(gui.control_id("fast_ladder_enable"))
slot_0_20_0 = gui.checkbox(gui.control_id("kill_effect_enable"))
slot_0_21_0 = gui.color_picker(gui.control_id("kill_effect_color"))
slot_0_22_0 = gui.combo_box(gui.control_id("kill_effect_type"))
slot_0_23_0 = gui.checkbox(gui.control_id("orbit_enable"))
slot_0_24_0 = gui.checkbox(gui.control_id("trail_enable"))
slot_0_25_0 = gui.checkbox(gui.control_id("rainbow_enable"))
slot_0_26_0 = gui.slider(gui.control_id("orbit_radius"), 20, 200, {
        "%.0f"
})
slot_0_27_0 = gui.slider(gui.control_id("orbit_speed"), 1, 10, {
        "%.1f"
})
slot_0_28_0 = gui.slider(gui.control_id("line_thickness"), 1, 8, {
        "%.0f"
})
slot_0_29_0 = gui.slider(gui.control_id("orbit_height"), -50, 50, {
        "%.0f"
})
slot_0_30_0 = gui.color_picker(gui.control_id("orbit_trail_color"))
slot_0_31_0 = 1
slot_0_32_0 = gui.combo_box(gui.control_id("trashtalk_mode"))
slot_0_33_0 = {
        {
                "Lightning",
                1
        },
        {
                "Hearts",
                2
        }
}

for iter_0_0, iter_0_1 in ipairs(slot_0_33_0) do
        slot_0_39_2 = iter_0_1[1]
        slot_0_40_2 = gui.control_id(slot_0_39_2 .. "_kill_effect_select")
        slot_0_41_2 = gui.selectable(slot_0_40_2, slot_0_39_2)

        slot_0_22_0:add(slot_0_41_2)
end

slot_0_34_0 = {
        {
                "Disable",
                1
        },
        {
                "Enable",
                2
        }
}

for iter_0_2, iter_0_3 in ipairs(slot_0_34_0) do
        slot_0_40_1 = iter_0_3[1]
        slot_0_41_1 = gui.control_id(slot_0_40_1 .. "_trashtalk_select")
        slot_0_42_1 = gui.selectable(slot_0_41_1, slot_0_40_1)

        slot_0_32_0:add(slot_0_42_1)
end

slot_0_35_0 = gui.checkbox(gui.control_id("jumpscout_enable"))
slot_0_36_0 = gui.slider(gui.control_id("jumpscout_hitchance"), 0, 100, {
        "%.0f%%"
})
slot_0_37_0 = gui.slider(gui.control_id("jumpscout_mindmg"), 1, 120, {
        "%.0f"
})
slot_0_38_0 = gui.slider(gui.control_id("jumpscout_pointscale"), 1, 100, {
        "%.0f"
})
slot_0_39_0 = gui.checkbox(gui.control_id("jumpscout_baim"))
slot_0_40_0 = gui.checkbox(gui.control_id("jumpscout_force_shoot"))
slot_0_41_0 = gui.checkbox(gui.control_id("advanced_js_dynamic_hitchance"))
slot_0_42_0 = gui.checkbox(gui.control_id("advanced_js_dynamic_mindmg"))
slot_0_43_0 = gui.checkbox(gui.control_id("advanced_js_dynamic_pointscale"))
slot_0_44_0 = gui.combo_box(gui.control_id("tab_selector"))
slot_0_45_0 = {
        {
                "General",
                1
        },
        {
                "Visuals",
                2
        }
}

for iter_0_4, iter_0_5 in ipairs(slot_0_45_0) do
        slot_0_51_1 = iter_0_5[1]
        slot_0_52_1 = gui.control_id(slot_0_51_1 .. "_tab_select")
        slot_0_53_1 = gui.selectable(slot_0_52_1, slot_0_51_1)

        slot_0_44_0:add(slot_0_53_1)
end

slot_0_46_0 = gui.make_control("Auto Knife DoubleTap", slot_0_14_0)
slot_0_47_0 = gui.make_control("Watermark", slot_0_15_0)
slot_0_48_0 = gui.make_control("Trashtalk", slot_0_32_0)
slot_0_49_0 = gui.make_control("Fast Ladder", slot_0_19_0)
slot_0_50_0 = gui.make_control("Jump Scout", slot_0_35_0)
slot_0_51_0 = gui.make_control("JS Hitchance", slot_0_36_0)
slot_0_52_0 = gui.make_control("JS Min Damage", slot_0_37_0)
slot_0_53_0 = gui.make_control("JS Point Scale", slot_0_38_0)
slot_0_54_0 = gui.make_control("JS Force Body", slot_0_39_0)
slot_0_55_0 = gui.make_control("JS Force Shoot", slot_0_40_0)
slot_0_56_0 = gui.make_control("Dynamic Hit Chance", slot_0_41_0)
slot_0_57_0 = gui.make_control("Dynamic Min Damage", slot_0_42_0)
slot_0_58_0 = gui.make_control("Dynamic Point Scale", slot_0_43_0)
slot_0_59_0 = gui.make_control("BF4 Hitlogs", slot_0_16_0)
slot_0_60_0 = gui.make_control("Ping Compare ESP", slot_0_17_0)
slot_0_61_0 = gui.make_control("Kill Effect", slot_0_20_0)
slot_0_62_0 = gui.make_control("Effect Type", slot_0_22_0)
slot_0_63_0 = gui.make_control("Effect Color", slot_0_21_0)
slot_0_64_0 = gui.make_control("Orbit", slot_0_23_0)
slot_0_65_0 = gui.make_control("Trail", slot_0_24_0)
slot_0_66_0 = gui.make_control("Rainbow Mode", slot_0_25_0)
slot_0_67_0 = gui.make_control("Radius", slot_0_26_0)
slot_0_68_0 = gui.make_control("Speed", slot_0_27_0)
slot_0_69_0 = gui.make_control("Thickness", slot_0_28_0)
slot_0_70_0 = gui.make_control("Height", slot_0_29_0)
slot_0_71_0 = gui.make_control("Orbit/Trail Color", slot_0_30_0)
slot_0_72_0 = gui.make_control("Tab", slot_0_44_0)
slot_0_73_0 = gui.ctx:find("lua>elements a")

if slot_0_73_0 then
        slot_0_73_0:reset()
        slot_0_73_0:add(slot_0_72_0)
        slot_0_73_0:add(slot_0_46_0)
        slot_0_73_0:add(slot_0_47_0)
        slot_0_73_0:add(slot_0_48_0)
        slot_0_73_0:add(slot_0_49_0)
        slot_0_73_0:add(slot_0_50_0)
        slot_0_73_0:add(slot_0_51_0)
        slot_0_73_0:add(slot_0_52_0)
        slot_0_73_0:add(slot_0_53_0)
        slot_0_73_0:add(slot_0_54_0)
        slot_0_73_0:add(slot_0_55_0)
        slot_0_73_0:add(slot_0_56_0)
        slot_0_73_0:add(slot_0_57_0)
        slot_0_73_0:add(slot_0_58_0)
        slot_0_73_0:add(slot_0_59_0)
        slot_0_73_0:add(slot_0_60_0)
        slot_0_73_0:add(slot_0_61_0)
        slot_0_73_0:add(slot_0_62_0)
        slot_0_73_0:add(slot_0_63_0)
        slot_0_73_0:add(slot_0_64_0)
        slot_0_73_0:add(slot_0_65_0)
        slot_0_73_0:add(slot_0_66_0)
        slot_0_73_0:add(slot_0_67_0)
        slot_0_73_0:add(slot_0_68_0)
        slot_0_73_0:add(slot_0_69_0)
        slot_0_73_0:add(slot_0_70_0)
        slot_0_73_0:add(slot_0_71_0)
        slot_0_73_0:reset()
end

slot_0_14_0:set_value(true)
slot_0_15_0:set_value(true)
slot_0_16_0:set_value(false)
slot_0_17_0:set_value(false)
slot_0_19_0:set_value(false)
slot_0_20_0:set_value(false)
slot_0_35_0:set_value(false)
slot_0_36_0:get_value():set(65)
slot_0_37_0:get_value():set(50)
slot_0_38_0:get_value():set(100)
slot_0_39_0:set_value(true)
slot_0_40_0:set_value(false)
slot_0_23_0:set_value(false)
slot_0_24_0:set_value(false)
slot_0_25_0:set_value(false)
slot_0_44_0:get_value():get():set_raw(1)
slot_0_32_0:get_value():get():set_raw(1)
slot_0_22_0:get_value():get():set_raw(1)
slot_0_51_0:set_visible(false)
slot_0_52_0:set_visible(false)
slot_0_53_0:set_visible(false)
slot_0_54_0:set_visible(false)
slot_0_55_0:set_visible(false)
slot_0_59_0:set_visible(false)
slot_0_60_0:set_visible(false)
slot_0_61_0:set_visible(false)
slot_0_62_0:set_visible(false)
slot_0_63_0:set_visible(false)
slot_0_64_0:set_visible(false)
slot_0_65_0:set_visible(false)
slot_0_66_0:set_visible(false)
slot_0_67_0:set_visible(false)
slot_0_68_0:set_visible(false)
slot_0_69_0:set_visible(false)
slot_0_70_0:set_visible(false)
slot_0_71_0:set_visible(false)

slot_0_74_0 = {}
slot_0_75_0 = 70
slot_0_76_0 = {
        "1",
        "1 bot",
        "bot_kick",
        "!bot_kick"
}
slot_0_77_0 = -999
slot_0_78_0 = 2
slot_0_79_0 = false
slot_0_80_0 = false
slot_0_81_0 = 0
slot_0_82_0 = 0
slot_0_83_0 = 1
slot_0_84_0 = 0
slot_0_85_0 = 3

if mods and mods.events then
        mods.events:add_listener("player_death")
        print("[hvhsense] Added player_death listener")
end

function slot_0_86_0()
        local var_1_0 = slot_0_32_0:get_value()

        if not var_1_0 then
                return
        end

        local var_1_1 = var_1_0:get()

        if not var_1_1 or not var_1_1.get_raw then
                return
        end

        if var_1_1:get_raw() ~= 2 then
                return
        end

        if not game or not game.engine then
                return
        end

        local var_1_2 = game.global_vars.real_time

        if var_1_2 - slot_0_77_0 < slot_0_78_0 then
                return
        end

        local var_1_3 = slot_0_76_0[math.random(#slot_0_76_0)]

        if game.engine.client_cmd then
                game.engine:client_cmd("say \"" .. var_1_3 .. "\"")

                slot_0_77_0 = var_1_2
        end
end

function slot_0_87_0(arg_2_0)
        if not arg_2_0 then
                return
        end

        if not game or not game.engine then
                return
        end

        if not game.engine:in_game() then
                return
        end

        local var_2_0 = arg_2_0:get_name()

        if not var_2_0 or var_2_0 ~= "player_death" then
                return
        end

        local var_2_1 = arg_2_0:get_controller("attacker")
        local var_2_2 = arg_2_0:get_controller("userid")
        local var_2_3 = entities.get_local_controller()

        if not var_2_1 or not var_2_2 or not var_2_3 then
                return
        end

        if var_2_1 ~= var_2_3 then
                return
        end

        slot_0_86_0()
end

function slot_0_88_0(arg_3_0)
        if not arg_3_0 then
                return
        end

        if not game or not game.engine then
                return
        end

        if not game.engine:in_game() then
                return
        end

        if not slot_0_20_0 or not slot_0_20_0:get_value() then
                return
        end

        if not slot_0_20_0:get_value():get() then
                return
        end

        local var_3_0 = arg_3_0:get_name()

        if not var_3_0 or var_3_0 ~= "player_death" then
                return
        end

        if not entities or not entities.get_local_controller then
                return
        end

        local var_3_1 = entities.get_local_controller()

        if not var_3_1 then
                return
        end

        local var_3_2 = arg_3_0:get_controller("attacker")
        local var_3_3 = arg_3_0:get_controller("userid")

        if not var_3_2 or not var_3_3 then
                return
        end

        if var_3_2 == var_3_1 and var_3_3 ~= var_3_1 then
                local var_3_4

                if arg_3_0.get_pawn_from_id then
                        var_3_4 = arg_3_0:get_pawn_from_id("userid")
                end

                if not var_3_4 and entities.players then
                        entities.players:for_each(function(arg_4_0)
                                if arg_4_0 and arg_4_0.entity then
                                        local var_4_0 = arg_4_0.entity

                                        if var_4_0 and var_4_0.get_controller then
                                                local var_4_1 = var_4_0:get_controller()

                                                if var_4_1 and var_4_1 == var_3_3 then
                                                        var_3_4 = var_4_0
                                                end
                                        end
                                end
                        end)
                end

                if var_3_4 then
                        local var_3_5

                        if var_3_4.get_abs_origin then
                                var_3_5 = var_3_4:get_abs_origin()
                        end

                        if var_3_5 and var_3_5.x and var_3_5.y and var_3_5.z then
                                local var_3_6 = utils.get_unix_time and utils.get_unix_time() or 0

                                table.insert(slot_0_11_0, {
                                        position = vector(var_3_5.x, var_3_5.y, var_3_5.z),
                                        time = var_3_6
                                })
                        end
                end
        end
end

function slot_0_89_0()
        if not slot_0_20_0 then
                return
        end

        slot_5_0_0 = slot_0_20_0:get_value()

        if not slot_5_0_0 then
                return
        end

        if not slot_5_0_0:get() then
                return
        end

        if not game or not game.engine or not game.engine:in_game() then
                slot_0_11_0 = {}

                return
        end

        if #slot_0_11_0 == 0 then
                return
        end

        slot_5_1_0 = draw.surface

        if not slot_5_1_0 then
                return
        end

        slot_5_2_0 = 0

        if utils and utils.get_unix_time then
                slot_5_2_0 = utils.get_unix_time()
        end

        slot_5_2_0 = slot_5_2_0 or 0
        slot_5_3_0 = 135
        slot_5_4_0 = 206
        slot_5_5_0 = 250
        slot_5_6_0 = slot_0_21_0:get_value()

        if slot_5_6_0 then
                slot_5_7_1 = slot_5_6_0:get()

                if slot_5_7_1 and slot_5_7_1.get_r and slot_5_7_1.get_g and slot_5_7_1.get_b then
                        slot_5_3_0 = slot_5_7_1:get_r()
                        slot_5_4_0 = slot_5_7_1:get_g()
                        slot_5_5_0 = slot_5_7_1:get_b()
                end
        end

        slot_5_7_0 = 1
        slot_5_8_0 = slot_0_22_0:get_value()

        if slot_5_8_0 then
                slot_5_9_0 = slot_5_8_0:get()

                if slot_5_9_0 and slot_5_9_0.get_raw then
                        slot_5_7_0 = slot_5_9_0:get_raw()
                end
        end

        for iter_5_0 = #slot_0_11_0, 1, -1 do
                slot_5_13_0 = slot_0_11_0[iter_5_0]

                if not slot_5_13_0 or not slot_5_13_0.time or not slot_5_13_0.position then
                        table.remove(slot_0_11_0, iter_5_0)
                else
                        slot_5_14_0 = slot_5_2_0 - slot_5_13_0.time

                        if slot_5_14_0 > slot_0_12_0 then
                                table.remove(slot_0_11_0, iter_5_0)
                        else
                                slot_5_15_0 = slot_5_13_0.position

                                if slot_5_15_0 and slot_5_15_0.x and slot_5_15_0.y and slot_5_15_0.z then
                                        if slot_5_7_0 == 1 then
                                                slot_5_16_1 = 400
                                                slot_5_17_0 = 10
                                                slot_5_18_0 = slot_5_16_1 / slot_5_17_0
                                                slot_5_19_0 = {
                                                        {
                                                                x = slot_5_15_0.x,
                                                                y = slot_5_15_0.y,
                                                                z = slot_5_15_0.z + slot_5_16_1
                                                        }
                                                }

                                                for iter_5_1 = 2, slot_5_17_0 do
                                                        slot_5_25_3 = (1 - iter_5_1 / slot_5_17_0) * 40
                                                        slot_5_26_3 = math.sin(slot_5_2_0 * 10 + iter_5_1 * 73) * slot_5_25_3
                                                        slot_5_27_3 = math.cos(slot_5_2_0 * 10 + iter_5_1 * 91) * slot_5_25_3
                                                        slot_5_19_0[iter_5_1] = {
                                                                x = slot_5_15_0.x + slot_5_26_3,
                                                                y = slot_5_15_0.y + slot_5_27_3,
                                                                z = slot_5_15_0.z + slot_5_16_1 - (iter_5_1 - 1) * slot_5_18_0
                                                        }
                                                end

                                                slot_5_19_0[slot_5_17_0 + 1] = {
                                                        x = slot_5_15_0.x,
                                                        y = slot_5_15_0.y,
                                                        z = slot_5_15_0.z + 50
                                                }

                                                for iter_5_2 = 1, #slot_5_19_0 - 1 do
                                                        slot_5_24_2 = vector(slot_5_19_0[iter_5_2].x, slot_5_19_0[iter_5_2].y, slot_5_19_0[iter_5_2].z)
                                                        slot_5_25_2 = vector(slot_5_19_0[iter_5_2 + 1].x, slot_5_19_0[iter_5_2 + 1].y, slot_5_19_0[iter_5_2 + 1].z)

                                                        if math.world_to_screen then
                                                                slot_5_26_2 = math.world_to_screen(slot_5_24_2)
                                                                slot_5_27_2 = math.world_to_screen(slot_5_25_2)

                                                                if slot_5_26_2 and slot_5_27_2 then
                                                                        slot_5_28_2 = slot_5_26_2.x
                                                                        slot_5_29_2 = slot_5_26_2.y
                                                                        slot_5_30_1 = slot_5_27_2.x
                                                                        slot_5_31_1 = slot_5_27_2.y

                                                                        if slot_5_28_2 and slot_5_29_2 and slot_5_30_1 and slot_5_31_1 and type(slot_5_28_2) == "number" then
                                                                                slot_5_32_1 = draw.vec2(slot_5_28_2, slot_5_29_2)
                                                                                slot_5_33_1 = draw.vec2(slot_5_30_1, slot_5_31_1)

                                                                                if slot_5_32_1 and slot_5_33_1 then
                                                                                        slot_5_1_0:add_line(slot_5_32_1, slot_5_33_1, draw.color(255, 255, 255))
                                                                                        slot_5_1_0:add_line(slot_5_32_1, slot_5_33_1, draw.color(slot_5_3_0, slot_5_4_0, slot_5_5_0))
                                                                                end
                                                                        end
                                                                end
                                                        end
                                                end

                                                for iter_5_3 = 3, #slot_5_19_0 - 2, 2 do
                                                        slot_5_24_1 = 25 + math.sin(slot_5_2_0 * 8 + iter_5_3) * 15
                                                        slot_5_25_1 = math.sin(slot_5_2_0 * 5 + iter_5_3 * 37) > 0 and 1 or -1
                                                        slot_5_26_1 = slot_5_19_0[iter_5_3]
                                                        slot_5_27_1 = {
                                                                x = slot_5_26_1.x + slot_5_25_1 * slot_5_24_1,
                                                                y = slot_5_26_1.y + math.cos(slot_5_2_0 * 6 + iter_5_3) * slot_5_24_1 * 0.5,
                                                                z = slot_5_26_1.z - 20
                                                        }
                                                        slot_5_28_1 = vector(slot_5_26_1.x, slot_5_26_1.y, slot_5_26_1.z)
                                                        slot_5_29_1 = vector(slot_5_27_1.x, slot_5_27_1.y, slot_5_27_1.z)

                                                        if math.world_to_screen then
                                                                slot_5_30_0 = math.world_to_screen(slot_5_28_1)
                                                                slot_5_31_0 = math.world_to_screen(slot_5_29_1)

                                                                if slot_5_30_0 and slot_5_31_0 then
                                                                        slot_5_32_0 = slot_5_30_0.x
                                                                        slot_5_33_0 = slot_5_30_0.y
                                                                        slot_5_34_0 = slot_5_31_0.x
                                                                        slot_5_35_0 = slot_5_31_0.y

                                                                        if slot_5_32_0 and slot_5_33_0 and slot_5_34_0 and slot_5_35_0 and type(slot_5_32_0) == "number" then
                                                                                slot_5_36_0 = draw.vec2(slot_5_32_0, slot_5_33_0)
                                                                                slot_5_37_0 = draw.vec2(slot_5_34_0, slot_5_35_0)

                                                                                if slot_5_36_0 and slot_5_37_0 then
                                                                                        slot_5_1_0:add_line(slot_5_36_0, slot_5_37_0, draw.color(slot_5_3_0, slot_5_4_0, slot_5_5_0))
                                                                                end
                                                                        end
                                                                end
                                                        end
                                                end
                                        elseif slot_5_7_0 == 2 then
                                                slot_5_16_0 = 8

                                                for iter_5_4 = 1, slot_5_16_0 do
                                                        slot_5_21_0 = iter_5_4 / slot_5_16_0 * math.pi * 2 + slot_5_2_0 * 2
                                                        slot_5_22_0 = 30 + math.sin(slot_5_2_0 * 3 + iter_5_4) * 10
                                                        slot_5_23_0 = 60 + slot_5_14_0 * 50 + math.sin(slot_5_2_0 * 4 + iter_5_4 * 0.5) * 20
                                                        slot_5_24_0 = vector(slot_5_15_0.x + math.cos(slot_5_21_0) * slot_5_22_0, slot_5_15_0.y + math.sin(slot_5_21_0) * slot_5_22_0, slot_5_15_0.z + slot_5_23_0)

                                                        if math.world_to_screen then
                                                                slot_5_25_0 = math.world_to_screen(slot_5_24_0)

                                                                if slot_5_25_0 and slot_5_25_0.x and slot_5_25_0.y then
                                                                        slot_5_26_0 = slot_5_25_0.x
                                                                        slot_5_27_0 = slot_5_25_0.y
                                                                        slot_5_28_0 = 8 + math.sin(slot_5_2_0 * 5 + iter_5_4) * 3
                                                                        slot_5_29_0 = draw.color(slot_5_3_0, slot_5_4_0, slot_5_5_0)

                                                                        slot_5_1_0:add_line(draw.vec2(slot_5_26_0, slot_5_27_0 - slot_5_28_0 * 0.3), draw.vec2(slot_5_26_0 - slot_5_28_0 * 0.5, slot_5_27_0 - slot_5_28_0 * 0.8), slot_5_29_0)
                                                                        slot_5_1_0:add_line(draw.vec2(slot_5_26_0 - slot_5_28_0 * 0.5, slot_5_27_0 - slot_5_28_0 * 0.8), draw.vec2(slot_5_26_0 - slot_5_28_0 * 0.8, slot_5_27_0 - slot_5_28_0 * 0.3), slot_5_29_0)
                                                                        slot_5_1_0:add_line(draw.vec2(slot_5_26_0 - slot_5_28_0 * 0.8, slot_5_27_0 - slot_5_28_0 * 0.3), draw.vec2(slot_5_26_0, slot_5_27_0 + slot_5_28_0 * 0.6), slot_5_29_0)
                                                                        slot_5_1_0:add_line(draw.vec2(slot_5_26_0, slot_5_27_0 - slot_5_28_0 * 0.3), draw.vec2(slot_5_26_0 + slot_5_28_0 * 0.5, slot_5_27_0 - slot_5_28_0 * 0.8), slot_5_29_0)
                                                                        slot_5_1_0:add_line(draw.vec2(slot_5_26_0 + slot_5_28_0 * 0.5, slot_5_27_0 - slot_5_28_0 * 0.8), draw.vec2(slot_5_26_0 + slot_5_28_0 * 0.8, slot_5_27_0 - slot_5_28_0 * 0.3), slot_5_29_0)
                                                                        slot_5_1_0:add_line(draw.vec2(slot_5_26_0 + slot_5_28_0 * 0.8, slot_5_27_0 - slot_5_28_0 * 0.3), draw.vec2(slot_5_26_0, slot_5_27_0 + slot_5_28_0 * 0.6), slot_5_29_0)
                                                                end
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
end

function slot_0_90_0(arg_6_0)
        return slot_0_4_0[arg_6_0] == true
end

function slot_0_91_0(arg_7_0)
        if slot_0_2_0 == arg_7_0 then
                return
        end

        local var_7_0 = gui.ctx:find("rage>aimbot>doubletap")

        if var_7_0 then
                local var_7_1 = var_7_0:cast()

                if var_7_1 and var_7_1.set_value then
                        var_7_1:set_value(arg_7_0)

                        slot_0_2_0 = arg_7_0
                end
        end
end

function slot_0_92_0()
        if not slot_0_0_0 then
                return
        end

        local var_8_0 = entities.get_local_pawn()

        if not var_8_0 then
                return
        end

        local var_8_1 = var_8_0:get_active_weapon()

        if not var_8_1 then
                return
        end

        local var_8_2 = ""

        if var_8_1.get_class_name then
                var_8_2 = var_8_1:get_class_name()
        end

        if var_8_2 == "" then
                return
        end

        if var_8_2 ~= slot_0_1_0 then
                slot_0_1_0 = var_8_2

                local var_8_3 = slot_0_90_0(var_8_2)

                slot_0_91_0(var_8_3)
        end
end

slot_0_93_0 = 1920
slot_0_94_0 = 1080
slot_0_95_0 = {}
slot_0_96_0 = 5
slot_0_97_0 = 3
slot_0_98_0 = false

function slot_0_99_0()
        local var_9_0 = entities.get_local_pawn()

        if not var_9_0 then
                return "UNKNOWN"
        end

        local var_9_1 = var_9_0:get_active_weapon()

        if not var_9_1 or not var_9_1.get_class_name then
                return "UNKNOWN"
        end

        local var_9_2 = var_9_1:get_class_name()

        return slot_0_3_0[var_9_2] or var_9_2:gsub("C_", "")
end

function slot_0_100_0(arg_10_0, arg_10_1, arg_10_2)
        local var_10_0 = utils.get_unix_time and utils.get_unix_time() or 0
        local var_10_1 = {
                slide_offset = 0,
                alpha = 255,
                target = arg_10_0 or "Enemy",
                damage = arg_10_1 or 0,
                weapon = arg_10_2 or "UNKNOWN",
                time = var_10_0
        }

        table.insert(slot_0_95_0, 1, var_10_1)

        while #slot_0_95_0 > slot_0_96_0 do
                table.remove(slot_0_95_0)
        end
end

function slot_0_101_0()
        if not slot_0_16_0:get_value():get() then
                return
        end

        slot_11_0_0 = utils.get_unix_time and utils.get_unix_time() or 0
        slot_11_1_0 = draw.surface
        slot_11_1_0.font = draw.fonts.gui_main
        slot_11_2_0 = slot_0_93_0 / 2
        slot_11_3_0 = slot_0_94_0 / 2 + 150
        slot_11_4_0 = 30
        slot_11_5_0 = 400
        slot_11_6_0 = 25

        while #slot_0_95_0 > slot_0_96_0 do
                table.remove(slot_0_95_0, #slot_0_95_0)
        end

        for iter_11_0 = #slot_0_95_0, 1, -1 do
                slot_11_11_0 = slot_0_95_0[iter_11_0]
                slot_11_12_0 = slot_11_0_0 - slot_11_11_0.time

                if slot_11_12_0 > slot_0_97_0 then
                        table.remove(slot_0_95_0, iter_11_0)
                else
                        slot_11_13_0 = 255

                        if slot_11_12_0 < 0.2 then
                                slot_11_13_0 = 255 * (slot_11_12_0 / 0.2)
                        elseif slot_11_12_0 > slot_0_97_0 - 0.5 then
                                slot_11_13_0 = 255 * (1 - (slot_11_12_0 - (slot_0_97_0 - 0.5)) / 0.5)
                        end

                        slot_11_11_0.alpha = slot_11_13_0
                        slot_11_15_0 = slot_11_3_0 + (#slot_0_95_0 - iter_11_0 + 1 - 1) * slot_11_4_0
                        slot_11_16_0 = slot_11_2_0 - slot_11_5_0 / 2
                        slot_11_17_0 = slot_11_13_0 * 0.8

                        slot_11_1_0:add_rect_filled(draw.rect(slot_11_16_0, slot_11_15_0, slot_11_16_0 + slot_11_5_0, slot_11_15_0 + slot_11_6_0), draw.color(25, 25, 25, slot_11_17_0))

                        slot_11_18_0 = draw.color(200, 50, 50, slot_11_13_0)

                        slot_11_1_0:add_rect_filled(draw.rect(slot_11_16_0, slot_11_15_0, slot_11_16_0 + slot_11_5_0, slot_11_15_0 + 2), slot_11_18_0)
                        slot_11_1_0:add_rect_filled(draw.rect(slot_11_16_0, slot_11_15_0 + slot_11_6_0 - 2, slot_11_16_0 + slot_11_5_0, slot_11_15_0 + slot_11_6_0), slot_11_18_0)
                        slot_11_1_0:add_rect_filled(draw.rect(slot_11_16_0, slot_11_15_0, slot_11_16_0 + 2, slot_11_15_0 + slot_11_6_0), slot_11_18_0)
                        slot_11_1_0:add_rect_filled(draw.rect(slot_11_16_0 + slot_11_5_0 - 2, slot_11_15_0, slot_11_16_0 + slot_11_5_0, slot_11_15_0 + slot_11_6_0), slot_11_18_0)
                        slot_11_1_0:add_rect_filled(draw.rect(slot_11_16_0 + 2, slot_11_15_0 + 2, slot_11_16_0 + 8, slot_11_15_0 + slot_11_6_0 - 2), draw.color(255, 140, 0, slot_11_13_0))

                        slot_11_19_0 = slot_11_11_0.weapon
                        slot_11_20_0 = slot_11_11_0.target
                        slot_11_21_0 = tostring(slot_11_11_0.damage)
                        slot_11_22_0 = slot_11_16_0 + 15
                        slot_11_23_0 = slot_11_16_0 + 120
                        slot_11_24_0 = slot_11_16_0 + 280
                        slot_11_25_0 = slot_11_16_0 + 310
                        slot_11_26_0 = slot_11_15_0 + 6
                        slot_11_27_0 = draw.color(255, 255, 255, slot_11_13_0)
                        slot_11_28_0 = draw.color(255, 255, 255, slot_11_13_0)
                        slot_11_29_0 = draw.color(0, 255, 0, slot_11_13_0)
                        slot_11_30_0 = draw.color(0, 255, 0, slot_11_13_0)

                        if slot_11_11_0.damage >= 100 then
                                slot_11_29_0 = draw.color(255, 80, 80, slot_11_13_0)
                                slot_11_28_0 = draw.color(255, 120, 120, slot_11_13_0)
                        end

                        slot_11_1_0:add_text(draw.vec2(slot_11_22_0, slot_11_26_0), slot_11_19_0, slot_11_27_0)
                        slot_11_1_0:add_text(draw.vec2(slot_11_23_0, slot_11_26_0), slot_11_20_0, slot_11_28_0)
                        slot_11_1_0:add_text(draw.vec2(slot_11_24_0, slot_11_26_0), slot_11_21_0, slot_11_29_0)
                        slot_11_1_0:add_text(draw.vec2(slot_11_25_0, slot_11_26_0), "HP", slot_11_30_0)
                        slot_11_1_0:add_rect_filled(draw.rect(slot_11_25_0 + 25, slot_11_26_0 + 8, slot_11_25_0 + 28, slot_11_26_0 + 11), draw.color(255, 255, 255, slot_11_13_0))
                end
        end
end

function slot_0_102_0(arg_12_0)
        if not arg_12_0 then
                return
        end

        if not game or not game.engine then
                return
        end

        if not game.engine:in_game() then
                return
        end

        if not slot_0_16_0 or not slot_0_16_0:get_value() then
                return
        end

        if not slot_0_16_0:get_value():get() then
                return
        end

        local var_12_0 = arg_12_0:get_name()

        if not var_12_0 or var_12_0 ~= "player_hurt" then
                return
        end

        if not entities or not entities.get_local_pawn then
                return
        end

        local var_12_1 = entities.get_local_pawn()

        if not var_12_1 then
                return
        end

        local var_12_2
        local var_12_3

        if arg_12_0.get_pawn_from_id then
                var_12_2 = arg_12_0:get_pawn_from_id("userid")
                var_12_3 = arg_12_0:get_pawn_from_id("attacker")
        end

        if not var_12_2 or not var_12_3 then
                return
        end

        if var_12_2.is_enemy and not var_12_2:is_enemy() then
                return
        end

        if var_12_3 ~= var_12_1 then
                return
        end

        local var_12_4 = 0
        local var_12_5 = 100

        if arg_12_0.get_int then
                var_12_4 = arg_12_0:get_int("dmg_health") or 0

                local var_12_6

                var_12_6 = arg_12_0:get_int("health") or 100
        end

        if var_12_4 <= 0 then
                return
        end

        local var_12_7 = "Enemy"

        if var_12_2.get_name then
                local var_12_8 = var_12_2:get_name()

                if var_12_8 and var_12_8 ~= "" then
                        var_12_7 = var_12_8
                end
        elseif var_12_2.name and var_12_2.name ~= "" then
                var_12_7 = var_12_2.name
        end

        local var_12_9 = slot_0_99_0()

        slot_0_100_0(var_12_7, var_12_4, var_12_9)
end

function slot_0_103_0()
        return gui.ctx.user and gui.ctx.user.username or "Unknown"
end

slot_0_104_0 = {}
slot_0_105_0 = 64

function slot_0_106_0()
        local var_14_0 = game.global_vars.frame_time

        table.insert(slot_0_104_0, var_14_0)

        if #slot_0_104_0 > slot_0_105_0 then
                table.remove(slot_0_104_0, 1)
        end

        local var_14_1 = 0

        for iter_14_0, iter_14_1 in ipairs(slot_0_104_0) do
                var_14_1 = var_14_1 + iter_14_1
        end

        local var_14_2 = var_14_1 / #slot_0_104_0

        return math.floor(1 / var_14_2 + 0.5)
end

function slot_0_107_0()
        local var_15_0 = game.engine:get_netchan()

        if var_15_0 and not var_15_0:is_null() then
                local var_15_1 = math.floor(var_15_0:get_latency() * 1000)

                return var_15_1 > 0 and var_15_1 or 0
        end

        return 0
end

function slot_0_108_0()
        if not slot_0_15_0:get_value():get() then
                return
        end

        slot_16_0_0 = draw.surface
        slot_16_0_0.font = draw.fonts.gui_main
        slot_16_1_0 = slot_0_103_0()
        slot_16_2_0 = slot_0_106_0()
        slot_16_3_0 = slot_0_107_0()
        slot_16_4_0 = {
                "hvhsense.lua",
                " | ",
                slot_16_1_0,
                " | ",
                slot_16_2_0 .. " fps",
                " | ",
                slot_16_3_0 > 0 and slot_16_3_0 .. " ms" or "idle"
        }
        slot_16_5_0 = table.concat(slot_16_4_0, "")
        slot_16_6_0 = slot_16_0_0.font:get_text_size(slot_16_5_0)
        slot_16_7_0 = 8
        slot_16_8_0 = slot_16_6_0.x + slot_16_7_0 * 2
        slot_16_9_0 = slot_16_6_0.y + slot_16_7_0 * 2
        slot_16_10_0 = slot_0_93_0 - slot_16_8_0 - 15
        slot_16_11_0 = 15

        for iter_16_0 = 0, slot_16_9_0 do
                slot_16_16_1 = 0

                if iter_16_0 < slot_16_9_0 * 0.2 or iter_16_0 > slot_16_9_0 * 0.8 then
                        slot_16_16_0 = 40
                else
                        slot_16_17_0 = (iter_16_0 - slot_16_9_0 * 0.2) / (slot_16_9_0 * 0.6)
                        slot_16_16_0 = 40 * (1 - math.sin(slot_16_17_0 * math.pi))
                end

                slot_16_0_0:add_rect_filled(draw.rect(slot_16_10_0, slot_16_11_0 + iter_16_0, slot_16_10_0 + slot_16_8_0, slot_16_11_0 + iter_16_0 + 1), draw.color(0, 0, 0, slot_16_16_0))
        end

        slot_16_0_0:add_rect_filled(draw.rect(slot_16_10_0, slot_16_11_0, slot_16_10_0 + slot_16_8_0, slot_16_11_0 + 1), draw.color(0, 0, 0, 100))
        slot_16_0_0:add_rect_filled(draw.rect(slot_16_10_0, slot_16_11_0 + slot_16_9_0 - 1, slot_16_10_0 + slot_16_8_0, slot_16_11_0 + slot_16_9_0), draw.color(0, 0, 0, 100))
        slot_16_0_0:add_rect_filled(draw.rect(slot_16_10_0, slot_16_11_0 + 2, slot_16_10_0 + 3, slot_16_11_0 + slot_16_9_0 - 2), draw.color(255, 140, 0, 255))

        slot_16_14_0, slot_16_13_0 = slot_16_10_0 + slot_16_7_0 + 5, slot_16_11_0 + slot_16_7_0
        slot_16_15_0 = {
                draw.color(255, 140, 0, 255),
                draw.color(150, 150, 150, 255),
                draw.color(255, 255, 255, 255),
                draw.color(150, 150, 150, 255),
                draw.color(255, 255, 255, 255),
                draw.color(150, 150, 150, 255),
                draw.color(255, 255, 255, 255)
        }

        for iter_16_1, iter_16_2 in ipairs(slot_16_4_0) do
                slot_16_21_0 = slot_16_0_0.font:get_text_size(iter_16_2)

                slot_16_0_0:add_text(draw.vec2(slot_16_14_0, slot_16_13_0), iter_16_2, slot_16_15_0[iter_16_1])

                slot_16_14_0 = slot_16_14_0 + slot_16_21_0.x
        end
end

function slot_0_109_0(arg_17_0, arg_17_1)
        if not arg_17_0 then
                return false
        end

        if not arg_17_1 then
                return false
        end

        return arg_17_0[arg_17_1] ~= nil
end

function slot_0_110_0(arg_18_0, arg_18_1)
        if not slot_0_109_0(arg_18_0, arg_18_1) then
                return nil
        end

        local var_18_0 = arg_18_0[arg_18_1]

        if type(var_18_0) ~= "function" then
                return nil
        end

        return var_18_0(arg_18_0)
end

function slot_0_111_0(arg_19_0, arg_19_1)
        if not slot_0_109_0(arg_19_0, arg_19_1) then
                return nil
        end

        local var_19_0 = arg_19_0[arg_19_1]

        if not var_19_0 then
                return nil
        end

        if not slot_0_109_0(var_19_0, "get") then
                return nil
        end

        return var_19_0:get()
end

function slot_0_112_0()
        if not game or not game.engine then
                return 0
        end

        local var_20_0 = game.engine:get_netchan()

        if not var_20_0 or var_20_0:is_null() then
                return 0
        end

        local var_20_1 = var_20_0:get_latency()

        if not var_20_1 then
                return 0
        end

        return math.floor(var_20_1 * 1000)
end

function slot_0_113_0()
        local var_21_0 = {}

        if not entities or not entities.controllers then
                slot_0_8_0 = var_21_0

                return
        end

        entities.controllers:for_each(function(arg_22_0)
                if not arg_22_0 or not arg_22_0.entity then
                        return
                end

                local var_22_0 = arg_22_0.entity

                if not var_22_0 then
                        return
                end

                local var_22_1 = slot_0_110_0(var_22_0, "get_name")
                local var_22_2 = slot_0_111_0(var_22_0, "m_iPing")

                if var_22_1 and var_22_2 and type(var_22_2) == "number" then
                        var_21_0[var_22_1] = var_22_2
                end
        end)

        slot_0_8_0 = var_21_0
end

function slot_0_114_0(arg_23_0)
        if not arg_23_0 then
                return nil
        end

        return slot_0_8_0[arg_23_0]
end

function slot_0_115_0()
        if not game or not game.engine or not game.engine:in_game() then
                slot_0_7_0 = {}
                slot_0_8_0 = {}
                slot_0_9_0 = nil
                slot_0_10_0 = 0

                return
        end

        if not entities or not entities.players then
                slot_0_7_0 = {}

                return
        end

        local var_24_0 = entities.get_local_pawn()

        if not var_24_0 then
                slot_0_7_0 = {}
                slot_0_8_0 = {}
                slot_0_9_0 = nil
                slot_0_10_0 = 0

                return
        end

        if slot_0_9_0 ~= var_24_0 then
                slot_0_7_0 = {}
                slot_0_8_0 = {}
                slot_0_9_0 = var_24_0
                slot_0_10_0 = 0
                slot_0_5_0 = 0
        end

        local var_24_1 = game.global_vars.real_time
        local var_24_2 = 0

        entities.players:for_each(function(arg_25_0)
                if arg_25_0 and arg_25_0.entity then
                        var_24_2 = var_24_2 + 1
                end
        end)

        if not (var_24_2 ~= slot_0_10_0) and var_24_1 - slot_0_5_0 < slot_0_6_0 then
                return
        end

        slot_0_10_0 = var_24_2

        slot_0_113_0()

        local var_24_3 = {}
        local var_24_4 = slot_0_112_0()

        entities.players:for_each(function(arg_26_0)
                if not arg_26_0 or not arg_26_0.entity then
                        return
                end

                local var_26_0 = arg_26_0.entity

                if not var_26_0 then
                        return
                end

                local var_26_1 = slot_0_110_0(var_26_0, "is_enemy")
                local var_26_2 = slot_0_110_0(var_26_0, "is_alive")

                if var_26_1 and var_26_2 then
                        local var_26_3
                        local var_26_4 = slot_0_110_0(var_26_0, "get_controller")

                        if var_26_4 then
                                var_26_3 = slot_0_111_0(var_26_4, "m_iPing")
                        end

                        if not var_26_3 or var_26_3 <= 0 then
                                local var_26_5 = slot_0_110_0(var_26_0, "get_name")

                                if var_26_5 then
                                        var_26_3 = slot_0_114_0(var_26_5)
                                end
                        end

                        if var_26_3 and type(var_26_3) == "number" and var_26_3 > 0 then
                                local var_26_6 = var_26_3 - var_24_4

                                table.insert(var_24_3, {
                                        ping = var_26_3,
                                        ping_diff = var_26_6,
                                        pawn = var_26_0
                                })
                        end
                end
        end)

        slot_0_7_0 = var_24_3
        slot_0_5_0 = var_24_1
end

function slot_0_116_0()
        if not slot_0_17_0:get_value():get() then
                return
        end

        if not game or not game.engine or not game.engine:in_game() then
                slot_0_7_0 = {}

                return
        end

        slot_0_115_0()

        if not draw or not draw.surface then
                return
        end

        slot_27_0_0 = draw.surface

        if not draw.fonts or not draw.fonts.gui_main then
                return
        end

        slot_27_0_0.font = draw.fonts.gui_main

        for iter_27_0, iter_27_1 in ipairs(slot_0_7_0) do
                if not iter_27_1.pawn then
                        -- block empty
                else
                        slot_27_6_0 = slot_0_110_0(iter_27_1.pawn, "get_eye_pos")

                        if not slot_27_6_0 then
                                slot_27_7_1 = slot_0_110_0(iter_27_1.pawn, "get_abs_origin")

                                if slot_27_7_1 and slot_27_7_1.x and slot_27_7_1.y and slot_27_7_1.z then
                                        slot_27_6_0 = vector(slot_27_7_1.x, slot_27_7_1.y, slot_27_7_1.z + 65)
                                end
                        end

                        if not slot_27_6_0 then
                                -- block empty
                        elseif not math or not math.world_to_screen then
                                -- block empty
                        else
                                slot_27_7_0 = math.world_to_screen(slot_27_6_0)

                                if not slot_27_7_0 or not slot_27_7_0.x or not slot_27_7_0.y then
                                        -- block empty
                                elseif slot_27_7_0.x < -50 or slot_27_7_0.x > 2000 or slot_27_7_0.y < -50 or slot_27_7_0.y > 1200 then
                                        -- block empty
                                else
                                        slot_27_8_0 = tostring(math.floor(iter_27_1.ping_diff))
                                        slot_27_9_0 = draw.color(255, 255, 255, 255)

                                        if math.abs(iter_27_1.ping_diff) <= 2 then
                                                slot_27_9_0 = draw.color(200, 200, 200, 255)

                                                if iter_27_1.ping_diff > 0 then
                                                        slot_27_8_0 = "+" .. slot_27_8_0
                                                elseif iter_27_1.ping_diff < 0 then
                                                        -- block empty
                                                else
                                                        slot_27_8_0 = "=" .. slot_27_8_0
                                                end
                                        elseif iter_27_1.ping_diff > 2 then
                                                slot_27_9_0 = draw.color(0, 255, 0, 255)
                                                slot_27_8_0 = "+" .. slot_27_8_0
                                        elseif iter_27_1.ping_diff < -2 then
                                                slot_27_9_0 = draw.color(255, 0, 0, 255)
                                        end

                                        slot_27_11_0 = slot_27_0_0.font:get_text_size(slot_27_8_0)
                                        slot_27_12_0 = draw.vec2(slot_27_7_0.x - (slot_27_11_0 and slot_27_11_0.x and slot_27_11_0.x / 2 or 15), slot_27_7_0.y - 35)
                                        slot_27_13_0 = slot_27_11_0 and slot_27_11_0.x or 30
                                        slot_27_14_0 = slot_27_11_0 and slot_27_11_0.y or 16
                                        slot_27_15_0 = 4

                                        for iter_27_2 = 0, slot_27_14_0 + slot_27_15_0 * 2 do
                                                slot_27_20_1 = 0

                                                if iter_27_2 < (slot_27_14_0 + slot_27_15_0 * 2) * 0.2 or iter_27_2 > (slot_27_14_0 + slot_27_15_0 * 2) * 0.8 then
                                                        slot_27_20_0 = 40
                                                else
                                                        slot_27_21_0 = (iter_27_2 - (slot_27_14_0 + slot_27_15_0 * 2) * 0.2) / ((slot_27_14_0 + slot_27_15_0 * 2) * 0.6)
                                                        slot_27_20_0 = 40 * (1 - math.sin(slot_27_21_0 * math.pi))
                                                end

                                                slot_27_0_0:add_rect_filled(draw.rect(slot_27_12_0.x - slot_27_15_0, slot_27_12_0.y - slot_27_15_0 + iter_27_2, slot_27_12_0.x + slot_27_13_0 + slot_27_15_0, slot_27_12_0.y - slot_27_15_0 + iter_27_2 + 1), draw.color(0, 0, 0, slot_27_20_0))
                                        end

                                        slot_27_0_0:add_rect_filled(draw.rect(slot_27_12_0.x - slot_27_15_0, slot_27_12_0.y - slot_27_15_0, slot_27_12_0.x + slot_27_13_0 + slot_27_15_0, slot_27_12_0.y - slot_27_15_0 + 1), draw.color(0, 0, 0, 100))
                                        slot_27_0_0:add_rect_filled(draw.rect(slot_27_12_0.x - slot_27_15_0, slot_27_12_0.y + slot_27_14_0 + slot_27_15_0 - 1, slot_27_12_0.x + slot_27_13_0 + slot_27_15_0, slot_27_12_0.y + slot_27_14_0 + slot_27_15_0), draw.color(0, 0, 0, 100))
                                        slot_27_0_0:add_text(slot_27_12_0, slot_27_8_0, slot_27_9_0)
                                end
                        end
                end
        end
end

function slot_0_117_0()
        if not slot_0_35_0:get_value():get() then
                return
        end

        local var_28_0 = entities.get_local_pawn()

        if not var_28_0 then
                return
        end

        local var_28_1 = slot_0_41_0:get_value():get()
        local var_28_2 = slot_0_42_0:get_value():get()
        local var_28_3 = slot_0_43_0:get_value():get()

        if not var_28_1 and not var_28_2 and not var_28_3 then
                return
        end

        local var_28_4 = math.huge

        if entities and entities.players then
                entities.players:for_each(function(arg_29_0)
                        if arg_29_0 and arg_29_0.entity then
                                local var_29_0 = arg_29_0.entity

                                if var_29_0 and var_29_0.is_enemy and var_29_0:is_enemy() then
                                        local var_29_1 = var_28_0:get_abs_origin()
                                        local var_29_2 = var_29_0:get_abs_origin()

                                        if var_29_1 and var_29_2 then
                                                local var_29_3 = var_29_1.x - var_29_2.x
                                                local var_29_4 = var_29_1.y - var_29_2.y
                                                local var_29_5 = var_29_1.z - var_29_2.z
                                                local var_29_6 = math.sqrt(var_29_3 * var_29_3 + var_29_4 * var_29_4 + var_29_5 * var_29_5)

                                                if var_29_6 < var_28_4 then
                                                        var_28_4 = var_29_6
                                                end
                                        end
                                end
                        end
                end)
        end

        if var_28_4 < math.huge then
                slot_0_80_0 = true

                if var_28_1 then
                        local var_28_5 = 95
                        local var_28_6 = var_28_4 < 500 and 95 or var_28_4 < 1000 and 85 or var_28_4 < 1500 and 75 or var_28_4 < 2000 and 65 or 55

                        slot_0_36_0:get_value():set(var_28_6)

                        slot_0_81_0 = var_28_6
                end

                if var_28_2 then
                        local var_28_7 = 50
                        local var_28_8 = var_28_4 < 500 and 80 or var_28_4 < 1000 and 70 or var_28_4 < 1500 and 60 or var_28_4 < 2000 and 50 or 40

                        slot_0_37_0:get_value():set(var_28_8)

                        slot_0_82_0 = var_28_8
                end

                if var_28_3 then
                        local var_28_9 = 100
                        local var_28_10 = var_28_4 < 500 and 100 or var_28_4 < 1000 and 95 or var_28_4 < 1500 and 85 or var_28_4 < 2000 and 75 or 60

                        slot_0_38_0:get_value():set(var_28_10)

                        slot_0_83_0 = var_28_10
                end

                slot_0_84_0 = utils.get_unix_time and utils.get_unix_time() or 0
        else
                slot_0_80_0 = false
        end
end

function slot_0_118_0(arg_30_0)
        if not slot_0_19_0:get_value():get() then
                return
        end

        local var_30_0 = entities.get_local_pawn()

        if var_30_0 == nil then
                return
        end

        local var_30_1 = var_30_0:get_abs_velocity()

        if math.sqrt(var_30_1.x * var_30_1.x + var_30_1.y * var_30_1.y) > 50 or var_30_1.z < 20 then
                return
        end

        if var_30_0.m_fFlags:get() ~= 65664 then
                return
        end

        if arg_30_0:get_forwardmove() <= 0 then
                return
        end

        local var_30_2 = arg_30_0:get_viewangles()

        var_30_2.x = var_30_2.x - 80
        var_30_2.y = var_30_2.y + 80

        arg_30_0:set_viewangles(vector(var_30_2.x, var_30_2.y, var_30_2.z))
        arg_30_0:set_leftmove(-1)
end

events.create_move:add(slot_0_118_0)

function slot_0_119_0(arg_31_0)
        return draw.color(math.floor(127 * math.sin(arg_31_0) + 128), math.floor(127 * math.sin(arg_31_0 + 2) + 128), math.floor(127 * math.sin(arg_31_0 + 4) + 128))
end

function slot_0_120_0(arg_32_0)
        table.insert(slot_0_74_0, 1, {
                x = arg_32_0.x,
                y = arg_32_0.y,
                z = arg_32_0.z
        })

        if #slot_0_74_0 > slot_0_75_0 then
                table.remove(slot_0_74_0)
        end
end

function slot_0_121_0()
        slot_33_0_0 = slot_0_23_0:get_value():get()
        slot_33_1_0 = slot_0_24_0:get_value():get()

        if not slot_33_0_0 and not slot_33_1_0 then
                slot_0_74_0 = {}

                return
        end

        if not game or not game.engine or not game.engine:in_game() then
                slot_0_74_0 = {}

                return
        end

        slot_33_2_0 = entities.get_local_pawn()

        if not slot_33_2_0 then
                slot_0_74_0 = {}

                return
        end

        slot_33_3_0 = slot_33_2_0:get_abs_origin()

        if not slot_33_3_0 then
                return
        end

        slot_33_4_0 = game.global_vars.real_time
        slot_33_5_0 = draw.surface

        if not slot_33_5_0 then
                return
        end

        slot_33_6_0 = slot_0_25_0:get_value():get()
        slot_33_7_0 = 255
        slot_33_8_0 = 0
        slot_33_9_0 = 0
        slot_33_10_0 = slot_0_30_0:get_value()

        if slot_33_10_0 then
                slot_33_11_1 = slot_33_10_0:get()

                if slot_33_11_1 and slot_33_11_1.get_r and slot_33_11_1.get_g and slot_33_11_1.get_b then
                        slot_33_7_0 = slot_33_11_1:get_r()
                        slot_33_8_0 = slot_33_11_1:get_g()
                        slot_33_9_0 = slot_33_11_1:get_b()
                end
        end

        slot_33_11_0 = slot_0_28_0:get_value():get()

        if slot_33_0_0 then
                slot_33_12_0 = slot_0_26_0:get_value():get()
                slot_33_13_0 = slot_0_29_0:get_value():get()
                slot_33_14_0 = slot_0_27_0:get_value():get()
                slot_33_15_1 = nil

                for iter_33_0 = 0, 40 do
                        slot_33_20_1 = iter_33_0 / 40 * math.pi * 2 + slot_33_4_0 * slot_33_14_0
                        slot_33_21_1 = slot_33_3_0.x + math.cos(slot_33_20_1) * slot_33_12_0
                        slot_33_22_1 = slot_33_3_0.y + math.sin(slot_33_20_1) * slot_33_12_0
                        slot_33_23_0 = slot_33_3_0.z + slot_33_13_0
                        slot_33_24_0 = vector(slot_33_21_1, slot_33_22_1, slot_33_23_0)

                        if math.world_to_screen then
                                slot_33_25_0 = math.world_to_screen(slot_33_24_0)

                                if slot_33_25_0 and slot_33_25_0.x and slot_33_25_0.y then
                                        if slot_33_15_1 then
                                                slot_33_26_0 = nil

                                                if slot_33_6_0 then
                                                        slot_33_26_0 = slot_0_119_0(slot_33_4_0 + iter_33_0 * 0.2)
                                                else
                                                        slot_33_26_0 = draw.color(slot_33_7_0, slot_33_8_0, slot_33_9_0)
                                                end

                                                slot_33_5_0:add_line(draw.vec2(slot_33_15_1.x, slot_33_15_1.y), draw.vec2(slot_33_25_0.x, slot_33_25_0.y), slot_33_26_0)
                                        end

                                        slot_33_15_1 = slot_33_25_0
                                end
                        end
                end
        end

        if slot_33_1_0 then
                slot_0_120_0(slot_33_3_0)

                for iter_33_1 = 1, #slot_0_74_0 - 1 do
                        slot_33_16_0 = slot_0_74_0[iter_33_1]
                        slot_33_17_0 = slot_0_74_0[iter_33_1 + 1]
                        slot_33_18_0 = vector(slot_33_16_0.x, slot_33_16_0.y, slot_33_16_0.z)
                        slot_33_19_0 = vector(slot_33_17_0.x, slot_33_17_0.y, slot_33_17_0.z)

                        if math.world_to_screen then
                                slot_33_20_0 = math.world_to_screen(slot_33_18_0)
                                slot_33_21_0 = math.world_to_screen(slot_33_19_0)

                                if slot_33_20_0 and slot_33_21_0 and slot_33_20_0.x and slot_33_20_0.y and slot_33_21_0.x and slot_33_21_0.y then
                                        slot_33_22_0 = nil

                                        if slot_33_6_0 then
                                                slot_33_22_0 = slot_0_119_0(slot_33_4_0 + iter_33_1 * 0.15)
                                        else
                                                slot_33_22_0 = draw.color(slot_33_7_0, slot_33_8_0, slot_33_9_0)
                                        end

                                        slot_33_5_0:add_line(draw.vec2(slot_33_20_0.x, slot_33_20_0.y), draw.vec2(slot_33_21_0.x, slot_33_21_0.y), slot_33_22_0)
                                end
                        end
                end
        else
                slot_0_74_0 = {}
        end
end

slot_0_122_0 = nil
slot_0_123_0 = nil
slot_0_124_0 = nil
slot_0_125_0 = nil
slot_0_126_0 = nil
slot_0_127_0 = false
slot_0_128_0 = false

function slot_0_129_0(arg_34_0)
        return arg_34_0 == "C_WeaponSSG08" or arg_34_0 == "C_SSG08"
end

function slot_0_130_0()
        local var_35_0 = entities.get_local_pawn()

        if not var_35_0 then
                return false
        end

        local var_35_1 = var_35_0.m_fFlags

        if var_35_1 then
                local var_35_2 = var_35_1:get()

                if var_35_2 then
                        return bit.band(var_35_2, 1) == 0
                end
        end

        return false
end

function slot_0_131_0()
        if not slot_0_35_0:get_value():get() then
                if slot_0_127_0 then
                        slot_36_0_1 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")
                        slot_36_1_1 = gui.ctx:find("rage>weapon>SSG-08>weapon>mindamage")

                        if slot_36_0_1 and slot_0_122_0 then
                                slot_36_2_3 = slot_36_0_1:cast()

                                if slot_36_2_3 and slot_36_2_3.set_value then
                                        slot_36_2_3:set_value(slot_0_122_0)
                                end
                        end

                        if slot_36_1_1 and slot_0_123_0 then
                                slot_36_2_2 = slot_36_1_1:cast()

                                if slot_36_2_2 and slot_36_2_2.set_value then
                                        slot_36_2_2:set_value(slot_0_123_0)
                                end
                        end

                        slot_36_2_1 = gui.ctx:find("rage>weapon>SSG-08>weapon>pointscale")

                        if slot_36_2_1 and slot_0_124_0 then
                                slot_36_3_1 = slot_36_2_1:cast()

                                if slot_36_3_1 and slot_36_3_1.set_value then
                                        slot_36_3_1:set_value(slot_0_124_0)
                                end
                        end

                        slot_0_127_0 = false
                end

                return
        end

        slot_36_0_0 = entities.get_local_pawn()

        if not slot_36_0_0 then
                return
        end

        slot_36_1_0 = slot_36_0_0:get_active_weapon()

        if not slot_36_1_0 then
                return
        end

        slot_36_2_0 = slot_36_1_0:get_class_name()
        slot_36_3_0 = slot_0_129_0(slot_36_2_0)
        slot_36_4_0 = slot_0_130_0()
        slot_36_5_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")
        slot_36_6_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>mindamage")
        slot_36_7_0 = gui.ctx:find("rage>aimbot>general>force bodyaim")
        slot_36_8_0 = gui.ctx:find("rage>aimbot>general>force shoot")

        if slot_36_3_0 and slot_36_4_0 then
                if not slot_0_127_0 then
                        if slot_36_5_0 then
                                slot_36_9_6 = slot_36_5_0:get_value()

                                if slot_36_9_6 then
                                        slot_0_122_0 = slot_36_9_6:get()
                                end
                        end

                        if slot_36_6_0 then
                                slot_36_9_5 = slot_36_6_0:get_value()

                                if slot_36_9_5 then
                                        slot_0_123_0 = slot_36_9_5:get()
                                end
                        end

                        slot_36_9_4 = gui.ctx:find("rage>weapon>SSG-08>weapon>pointscale")

                        if slot_36_9_4 then
                                slot_36_10_6 = slot_36_9_4:get_value()

                                if slot_36_10_6 then
                                        slot_0_124_0 = slot_36_10_6:get()
                                end
                        end

                        if slot_36_7_0 then
                                slot_36_10_5 = slot_36_7_0:cast()

                                if slot_36_10_5 and slot_36_10_5.get_value then
                                        slot_0_125_0 = slot_36_10_5:get_value():get()
                                end
                        end

                        if slot_36_8_0 then
                                slot_36_10_4 = slot_36_8_0:cast()

                                if slot_36_10_4 and slot_36_10_4.get_value then
                                        slot_0_126_0 = slot_36_10_4:get_value():get()
                                end
                        end

                        slot_0_127_0 = true
                end

                slot_36_9_3 = slot_0_41_0:get_value():get()
                slot_36_10_3 = slot_0_42_0:get_value():get()

                if slot_36_5_0 then
                        slot_36_11_2 = slot_36_5_0:get_value()

                        if slot_36_11_2 then
                                slot_36_12_4 = slot_0_36_0:get_value():get()

                                if slot_36_11_2.set then
                                        slot_36_11_2:set(slot_36_12_4)
                                end
                        end
                end

                if slot_36_6_0 then
                        slot_36_11_1 = slot_36_6_0:get_value()

                        if slot_36_11_1 then
                                slot_36_12_3 = slot_0_37_0:get_value():get()

                                if slot_36_11_1.set then
                                        slot_36_11_1:set(slot_36_12_3)
                                end
                        end
                end

                slot_36_11_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>pointscale")

                if slot_36_11_0 then
                        slot_36_12_2 = slot_36_11_0:get_value()

                        if slot_36_12_2 then
                                slot_36_13_1 = slot_0_38_0:get_value():get()

                                if slot_36_12_2.set then
                                        slot_36_12_2:set(slot_36_13_1)
                                end
                        end
                end

                if slot_36_7_0 and slot_0_39_0:get_value():get() then
                        slot_36_12_1 = slot_36_7_0:cast()

                        if slot_36_12_1 and slot_36_12_1.set_value then
                                slot_36_12_1:set_value(true)
                        end
                end

                if slot_36_8_0 then
                        slot_36_12_0 = slot_36_8_0:cast()

                        if slot_36_12_0 and slot_36_12_0.set_value then
                                slot_36_12_0:set_value(slot_0_40_0:get_value():get())
                        end
                end

                draw.surface.font = draw.fonts.gui_main
                slot_36_13_0 = slot_0_36_0:get_value():get()
                slot_36_14_0 = slot_0_37_0:get_value():get()
        elseif slot_0_127_0 then
                if slot_36_5_0 and slot_0_122_0 then
                        slot_36_9_2 = slot_36_5_0:get_value()

                        if slot_36_9_2 and slot_36_9_2.set then
                                slot_36_9_2:set(slot_0_122_0)
                        end
                end

                if slot_36_6_0 and slot_0_123_0 then
                        slot_36_9_1 = slot_36_6_0:get_value()

                        if slot_36_9_1 and slot_36_9_1.set then
                                slot_36_9_1:set(slot_0_123_0)
                        end
                end

                slot_36_9_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>pointscale")

                if slot_36_9_0 and slot_0_124_0 then
                        slot_36_10_2 = slot_36_9_0:get_value()

                        if slot_36_10_2 and slot_36_10_2.set then
                                slot_36_10_2:set(slot_0_124_0)
                        end
                end

                if slot_36_7_0 and slot_0_125_0 ~= nil then
                        slot_36_10_1 = slot_36_7_0:cast()

                        if slot_36_10_1 and slot_36_10_1.set_value then
                                slot_36_10_1:set_value(slot_0_125_0)
                        end
                end

                if slot_36_8_0 and slot_0_126_0 ~= nil then
                        slot_36_10_0 = slot_36_8_0:cast()

                        if slot_36_10_0 and slot_36_10_0.set_value then
                                slot_36_10_0:set_value(slot_0_126_0)
                        end
                end

                slot_0_127_0 = false
        end
end

function slot_0_132_0()
        slot_37_0_0 = slot_0_32_0:get_value()
        slot_37_1_0 = slot_0_44_0:get_value()

        if slot_37_1_0 then
                slot_37_2_1 = slot_37_1_0:get()

                if slot_37_2_1 and slot_37_2_1.get_raw then
                        slot_0_31_0 = slot_37_2_1:get_raw()
                end
        end

        slot_37_2_0 = slot_0_32_0:get_value()
        slot_37_3_0 = false

        if slot_37_2_0 then
                slot_37_4_1 = slot_37_2_0:get()

                if slot_37_4_1 and slot_37_4_1.get_raw then
                        slot_37_3_0 = slot_37_4_1:get_raw() == 2
                end
        end

        slot_37_4_0 = slot_0_14_0:get_value():get()
        slot_37_5_0 = slot_0_16_0:get_value():get()
        slot_37_6_0 = slot_0_20_0:get_value():get()
        slot_37_7_0 = slot_0_23_0:get_value():get()
        slot_37_8_0 = slot_0_24_0:get_value():get()
        slot_37_9_0 = slot_37_7_0 or slot_37_8_0
        slot_37_10_0 = game and game.engine and game.engine:in_game()

        if slot_37_10_0 and not was_in_game then
                slot_0_79_0 = false
                slot_0_98_0 = false
                slot_0_13_0 = false
                slot_0_77_0 = -999

                if events and events.event then
                        events.event:remove(slot_0_87_0)
                end
        end

        was_in_game = slot_37_10_0
        slot_37_11_0 = slot_0_31_0 == 1
        slot_37_12_0 = slot_0_31_0 == 2

        slot_0_46_0:set_visible(slot_37_11_0)
        slot_0_47_0:set_visible(slot_37_11_0)
        slot_0_48_0:set_visible(slot_37_11_0)
        slot_0_49_0:set_visible(slot_37_11_0)
        slot_0_50_0:set_visible(slot_37_11_0)

        slot_37_13_0 = slot_0_35_0:get_value():get()

        slot_0_51_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_52_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_53_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_54_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_55_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_56_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_57_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_58_0:set_visible(slot_37_11_0 and slot_37_13_0)
        slot_0_59_0:set_visible(slot_37_12_0)
        slot_0_60_0:set_visible(slot_37_12_0)
        slot_0_61_0:set_visible(slot_37_12_0)
        slot_0_62_0:set_visible(slot_37_12_0 and slot_37_6_0)
        slot_0_63_0:set_visible(slot_37_12_0 and slot_37_6_0)
        slot_0_64_0:set_visible(slot_37_12_0)
        slot_0_65_0:set_visible(slot_37_12_0)
        slot_0_66_0:set_visible(slot_37_12_0 and slot_37_9_0)
        slot_0_67_0:set_visible(slot_37_12_0 and slot_37_7_0)
        slot_0_68_0:set_visible(slot_37_12_0 and slot_37_7_0)
        slot_0_69_0:set_visible(slot_37_12_0 and slot_37_9_0)
        slot_0_70_0:set_visible(slot_37_12_0 and slot_37_7_0)
        slot_0_71_0:set_visible(slot_37_12_0 and slot_37_9_0)

        if slot_37_5_0 and not slot_0_98_0 then
                if events and events.event and events.event.add then
                        events.event:add(slot_0_102_0)

                        slot_0_98_0 = true
                end
        elseif not slot_37_5_0 and slot_0_98_0 then
                slot_0_98_0 = false
        end

        if slot_37_6_0 and not slot_0_13_0 then
                if events and events.event and events.event.add then
                        events.event:add(slot_0_88_0)

                        slot_0_13_0 = true
                end
        elseif not slot_37_6_0 and slot_0_13_0 then
                if events and events.event then
                        events.event:remove(slot_0_88_0)
                end

                slot_0_13_0 = false
                slot_0_11_0 = {}
        end

        if slot_37_3_0 and not slot_0_79_0 then
                if events and events.event then
                        events.event:remove(slot_0_87_0)
                        events.event:add(slot_0_87_0)

                        slot_0_79_0 = true
                end
        elseif not slot_37_3_0 and slot_0_79_0 then
                if events and events.event then
                        events.event:remove(slot_0_87_0)
                end

                slot_0_79_0 = false
        end

        if slot_37_4_0 ~= slot_0_0_0 then
                slot_0_0_0 = slot_37_4_0

                if not slot_0_0_0 then
                        slot_0_91_0(false)

                        slot_0_1_0 = ""
                end
        end

        if slot_0_0_0 then
                slot_0_92_0()
                slot_0_117_0()
        end

        slot_0_108_0()
        slot_0_101_0()
        slot_0_116_0()
        slot_0_89_0()
        slot_0_121_0()
        slot_0_131_0()
end

events.present_queue:add(slot_0_132_0)
print("hvhsense.lua loaded")
