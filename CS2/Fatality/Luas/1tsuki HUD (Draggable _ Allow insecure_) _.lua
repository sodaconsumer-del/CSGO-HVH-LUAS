--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements a")
slot_0_1_0 = gui.ctx:find("lua>elements b")
slot_0_2_0, slot_0_3_0 = game.engine:get_screen_size()
slot_0_4_0 = gui.checkbox(gui.control_id("HUD checkbox"))
slot_0_5_0 = gui.checkbox(gui.control_id("Killcount checkbox"))
slot_0_6_0 = gui.checkbox(gui.control_id("HP and AP checkbox"))
slot_0_7_0 = gui.color_picker(gui.control_id("Glow picker"))
slot_0_8_0 = gui.color_picker(gui.control_id("Self color picker"))
slot_0_9_0 = gui.color_picker(gui.control_id("Weapon color picker"))
slot_0_10_0 = gui.color_picker(gui.control_id("Enemy color picker"))
slot_0_11_0 = gui.color_picker(gui.control_id("Teammate color picker"))
slot_0_12_0 = gui.color_picker(gui.control_id("Background picker"))
slot_0_13_0 = gui.color_picker(gui.control_id("HS picker"))
slot_0_14_0 = gui.color_picker(gui.control_id("NS picker"))
slot_0_15_0 = gui.color_picker(gui.control_id("Air picker"))
slot_0_16_0 = gui.color_picker(gui.control_id("Wallbang color"))
slot_0_17_0 = gui.color_picker(gui.control_id("Thru smoke color"))
slot_0_18_0 = gui.color_picker(gui.control_id("HP picker"))
slot_0_19_0 = gui.color_picker(gui.control_id("AP picker"))
slot_0_20_0 = gui.color_picker(gui.control_id("HP decrease color picker"))
slot_0_21_0 = gui.slider(gui.control_id("Max killfeed"), 1, 10, {
        "%.0f"
})
slot_0_22_0 = gui.checkbox(gui.control_id("Preserve checkbox"))
slot_0_23_0 = gui.combo_box(gui.control_id("HS icon combobox"))
slot_0_23_0.allow_multiple = false

slot_0_23_0:add(gui.selectable(gui.control_id("hsOption_1"), "Original"))
slot_0_23_0:add(gui.selectable(gui.control_id("hsOption_2"), "Simple"))

slot_0_24_0 = gui.combo_box(gui.control_id("Extra info combobox"))
slot_0_24_0.allow_multiple = false

slot_0_24_0:add(gui.selectable(gui.control_id("extraOption_1"), "Icon"))
slot_0_24_0:add(gui.selectable(gui.control_id("extraOption_2"), "Text"))

slot_0_25_0 = gui.slider(gui.control_id("Custom gap offset"), 0, 20, {
        "%.0f"
})
slot_0_26_0 = gui.slider(gui.control_id("Clear after X seconds"), 1, 15, {
        "%.0f"
})
slot_0_27_0 = gui.slider(gui.control_id("Animation speed"), 1, 10, {
        "%.0f"
})
slot_0_28_0 = gui.slider(gui.control_id("Killfeed icon size"), 1, 25, {
        "%.0f"
})
slot_0_29_0 = gui.slider(gui.control_id("Killfeed font size"), 1, 25, {
        "%.0f"
})
slot_0_30_0 = gui.button(gui.control_id("Change font"), "Change font")
slot_0_31_0 = gui.button(gui.control_id("Clear killfeed"), "Clear killfeed")
slot_0_32_0 = gui.make_control("Enable 1tsuki HUD", slot_0_4_0)
slot_0_33_0 = gui.make_control("Enable killcount HUD", slot_0_5_0)
slot_0_34_0 = gui.make_control("Enable HP and AP HUD", slot_0_6_0)
slot_0_35_0 = gui.make_control("Glow color", slot_0_7_0)
slot_0_36_0 = gui.make_control("Self color", slot_0_8_0)
slot_0_37_0 = gui.make_control("Weapon color", slot_0_9_0)
slot_0_38_0 = gui.make_control("Enemy color", slot_0_10_0)
slot_0_39_0 = gui.make_control("Team color", slot_0_11_0)
slot_0_40_0 = gui.make_control("Background color", slot_0_12_0)
slot_0_41_0 = gui.make_control("Headshot color", slot_0_13_0)
slot_0_42_0 = gui.make_control("No scope color", slot_0_14_0)
slot_0_43_0 = gui.make_control("Air shot color", slot_0_15_0)
slot_0_44_0 = gui.make_control("Wallbang color", slot_0_16_0)
slot_0_45_0 = gui.make_control("Thru smoke color", slot_0_17_0)
slot_0_46_0 = gui.make_control("HP color", slot_0_18_0)
slot_0_47_0 = gui.make_control("AP color", slot_0_19_0)
slot_0_48_0 = gui.make_control("-HP color", slot_0_20_0)
slot_0_49_0 = gui.make_control("Max killfeed", slot_0_21_0)
slot_0_50_0 = gui.make_control("Preserve killfeed", slot_0_22_0)
slot_0_51_0 = gui.make_control("Headshot icon", slot_0_23_0)
slot_0_52_0 = gui.make_control("Extra info", slot_0_24_0)
slot_0_53_0 = gui.make_control("Custom gap offset", slot_0_25_0)
slot_0_54_0 = gui.make_control("Clear timer (seconds)", slot_0_26_0)
slot_0_55_0 = gui.make_control("Animation speed", slot_0_27_0)
slot_0_56_0 = gui.make_control("Killfeed icon size", slot_0_28_0)
slot_0_57_0 = gui.make_control("Killfeed font size", slot_0_29_0)
slot_0_58_0 = gui.make_control("", slot_0_31_0)
slot_0_59_0 = gui.make_control("", slot_0_30_0)

slot_0_0_0:reset()
slot_0_1_0:reset()
slot_0_0_0:add(slot_0_32_0)
slot_0_0_0:add(slot_0_33_0)
slot_0_0_0:add(slot_0_34_0)
slot_0_1_0:add(slot_0_35_0)
slot_0_1_0:add(slot_0_36_0)
slot_0_1_0:add(slot_0_37_0)
slot_0_1_0:add(slot_0_38_0)
slot_0_1_0:add(slot_0_39_0)
slot_0_1_0:add(slot_0_40_0)
slot_0_1_0:add(slot_0_41_0)
slot_0_1_0:add(slot_0_42_0)
slot_0_1_0:add(slot_0_43_0)
slot_0_1_0:add(slot_0_44_0)
slot_0_1_0:add(slot_0_45_0)
slot_0_1_0:add(slot_0_46_0)
slot_0_1_0:add(slot_0_47_0)
slot_0_1_0:add(slot_0_48_0)
slot_0_0_0:add(slot_0_49_0)
slot_0_0_0:add(slot_0_50_0)
slot_0_0_0:add(slot_0_51_0)
slot_0_0_0:add(slot_0_52_0)
slot_0_0_0:add(slot_0_53_0)
slot_0_0_0:add(slot_0_54_0)
slot_0_0_0:add(slot_0_55_0)
slot_0_0_0:add(slot_0_56_0)
slot_0_0_0:add(slot_0_57_0)
slot_0_0_0:add(slot_0_59_0)
slot_0_0_0:add(slot_0_58_0)
slot_0_0_0:reset()
slot_0_1_0:reset()
gui.notify:add(gui.notification("1tsuki HUD", "Script loaded! Enjoy!", draw.textures.icon_visuals))
gui.notify:add(gui.notification("1tsuki HUD", "Make sure you have font installed (right click)", draw.textures.icon_visuals))
print("\n\n .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.      .----------------.  .----------------.  .----------------. \n| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |    | .--------------. || .--------------. || .--------------. |\n| |     __       | || |  _________   | || |    _______   | || | _____  _____ | || |  ___  ____   | || |     _____    | |    | |  ____  ____  | || | _____  _____ | || |  ________    | |\n| |    /  |      | || | |  _   _  |  | || |   /  ___  |  | || ||_   _||_   _|| || | |_  ||_  _|  | || |    |_   _|   | |    | | |_   ||   _| | || ||_   _||_   _|| || | |_   ___ `.  | |\n| |    `| |      | || | |_/ | | \\_|  | || |  |  (__ \\_|  | || |  | |    | |  | || |   | |_/ /    | || |      | |     | |    | |   | |__| |   | || |  | |    | |  | || |   | |   `. \\ | |\n| |     | |      | || |     | |      | || |   '.___`-.   | || |  | '    ' |  | || |   |  __'.    | || |      | |     | |    | |   |  __  |   | || |  | '    ' |  | || |   | |    | | | |\n| |    _| |_     | || |    _| |_     | || |  |`\\____) |  | || |   \\ `--' /   | || |  _| |  \\ \\_  | || |     _| |_    | |    | |  _| |  | |_  | || |   \\ `--' /   | || |  _| |___.' / | |\n| |   |_____|    | || |   |_____|    | || |  |_______.'  | || |    `.__.'    | || | |____||____| | || |    |_____|   | |    | | |____||____| | || |    `.__.'    | || | |________.'  | |\n| |              | || |              | || |              | || |              | || |              | || |              | |    | |              | || |              | || |              | |\n| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |    | '--------------' || '--------------' || '--------------' |\n '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'     '----------------'  '----------------'  '----------------' \n\n")
print("                                                                                        \n                                                                                        1tsuki HUD v2\n                                                                                    Developed by 1tsuki :D\n                                                                    请确保字体已经安装并开启 Allow insecure 模式 就是旁边的那个小锁锁\n\n                                                    Please make sure you have the font installed (for all users) and you have the allow insecure on\n    ")
slot_0_7_0:get_value():set(draw.color("#bac4ff20"))
slot_0_12_0:get_value():set(draw.color("#00000077"))
slot_0_13_0:get_value():set(draw.color("#ffbabaff"))
slot_0_14_0:get_value():set(draw.color("#ffff00ff"))
slot_0_15_0:get_value():set(draw.color("#ff0000ff"))
slot_0_8_0:get_value():set(draw.color("#8195f0ff"))
slot_0_9_0:get_value():set(draw.color("#ffffffff"))
slot_0_10_0:get_value():set(draw.color("#f88888ff"))
slot_0_11_0:get_value():set(draw.color("#ffffffff"))
slot_0_16_0:get_value():set(draw.color("#bfbffdff"))
slot_0_17_0:get_value():set(draw.color("#808080ff"))
slot_0_18_0:get_value():set(draw.color("#6bfa98ff"))
slot_0_19_0:get_value():set(draw.color("#8287cfff"))
slot_0_20_0:get_value():set(draw.color("#f77d7dff"))
slot_0_22_0:get_value():set(1)
slot_0_21_0:get_value():set(7)
slot_0_26_0:get_value():set(5)
slot_0_27_0:get_value():set(1)
slot_0_29_0:get_value():set(14)
slot_0_28_0:get_value():set(13)

slot_0_60_0 = draw.surface
slot_0_61_0 = draw.font_gdi("iconscs2", 14, bit.bor(draw.font_flags.anti_alias, draw.font_flags.no_dpi))
slot_0_62_0 = draw.font_gdi("Verdana Regular", 13, bit.bor(draw.font_flags.anti_alias, draw.font_flags.no_dpi))
slot_0_63_0 = draw.font_gdi("Segoe UI Bold", 12, bit.bor(draw.font_flags.anti_alias, draw.font_flags.no_dpi))
slot_0_64_0 = draw.font_gdi("Segoe UI Bold", 35, bit.bor(draw.font_flags.anti_alias, draw.font_flags.no_dpi))

slot_0_63_0:create()
slot_0_64_0:create()
slot_0_61_0:create()
slot_0_62_0:create()

slot_0_65_0 = {
        flip = "e",
        revolver = "\"",
        taser = ",",
        sawedoff = "#",
        scar20 = "$",
        sg556 = "%",
        flashbang = "d",
        tactical = "+",
        m4a1_silencer_off = "w",
        stiletto = "(",
        inferno = "1",
        ssg08 = "'",
        mp9 = "4",
        css = "Q",
        cz75a = "S",
        world = ")",
        aug = "I",
        m249 = "y",
        deagle = "T",
        elite = "Z",
        fiveseven = "c",
        glock = "h",
        ak47 = "E",
        push = "!",
        awp = "J",
        famas = "b",
        g3sg1 = "f",
        galilar = "g",
        survival_bowie = "M",
        m4a1 = "v",
        mac10 = "z",
        butterfly = "N",
        mag7 = "0",
        mp5sd = "2",
        canis = "P",
        xm1014 = "D",
        bizon = "K",
        widowmaker = "C",
        negev = "5",
        m9_bayonet = "x",
        urus = "A",
        idfk = "?",
        mp7 = "3",
        cord = "9",
        nova = "6",
        p250 = "8",
        tec9 = "-",
        karambit = "s",
        falchion = "a",
        gypsy_jackknife = "r",
        ump45 = ".",
        usp_silencer_off = "n",
        hegrenade = "m",
        smokegrenade = "&",
        gut = "j",
        decoy = "U",
        knife = "R",
        p90 = "7",
        knife_t = "u",
        m4a1_silencer = "w",
        usp_silencer = "B"
}
slot_0_66_0 = nil
slot_0_67_0 = nil
slot_0_68_0 = false
slot_0_69_0 = 0
slot_0_70_0 = 0
slot_0_71_0 = nil
slot_0_72_0 = nil
slot_0_73_0 = false
slot_0_74_0 = 0
slot_0_75_0 = 0
slot_0_76_0 = nil
slot_0_77_0 = nil
slot_0_78_0 = false
slot_0_79_0 = 0
slot_0_80_0 = 0
slot_0_81_0 = nil
slot_0_82_0 = nil
slot_0_83_0 = 0
deathLogs = {}
chatLogs = {}
slot_0_84_0 = false
slot_0_85_0 = 100
slot_0_86_0 = 100
slot_0_87_0 = 100
slot_0_88_0 = 100
slot_0_89_0 = 100
slot_0_90_0 = 100
slot_0_91_0 = 0
slot_0_92_0 = 0
slot_0_93_0 = true

function slot_0_94_0(arg_1_0, arg_1_1, arg_1_2)
        return arg_1_0 + (arg_1_1 - arg_1_0) * arg_1_2
end

game.engine:client_cmd("cl_drawhud_force_deathnotices -1")

function slot_0_95_0(arg_2_0)
        if arg_2_0:get_name() == "player_death" then
                local var_2_0 = entities.get_local_pawn()
                local var_2_1 = arg_2_0:get_pawn_from_id("attacker")
                local var_2_2 = arg_2_0:get_pawn_from_id("assister")
                local var_2_3 = arg_2_0:get_pawn_from_id("userid")
                local var_2_4 = arg_2_0:get_string("weapon")
                local var_2_5 = arg_2_0:get_bool("headshot") or false
                local var_2_6 = arg_2_0:get_bool("noscope") or false
                local var_2_7 = arg_2_0:get_bool("attackerinair") or false
                local var_2_8 = arg_2_0:get_int("penetrated")
                local var_2_9 = arg_2_0:get_bool("thrusmoke") or false
                local var_2_10 = arg_2_0:get_bool("attackerblind") or false

                if var_2_1 and var_2_3 then
                        local var_2_11 = {
                                alpha = 0,
                                attackerPawn = var_2_1,
                                victimPawn = var_2_3,
                                assisterPawn = var_2_2,
                                attacker = var_2_1:get_name(),
                                victim = var_2_3:get_name(),
                                weapon = var_2_4,
                                isHeadshot = var_2_5,
                                isNoscope = var_2_6,
                                isFly = var_2_7,
                                timeAdded = game.global_vars.cur_time,
                                wallbang = var_2_8,
                                isThrusmoke = var_2_9,
                                isBline = var_2_10
                        }

                        if var_2_2 then
                                var_2_11.assister = var_2_2:get_name()
                        end

                        table.insert(deathLogs, var_2_11)

                        if var_2_1 == var_2_0 and var_2_4 ~= "world" and var_2_1 ~= var_2_3 then
                                slot_0_83_0 = slot_0_83_0 + 1
                        end
                end
        end

        if arg_2_0:get_name() == "cs_pre_restart" then
                deathLogs = {}
                slot_0_85_0 = entities.get_local_pawn().m_iHealth:get()
                slot_0_83_0 = 0
        end

        if arg_2_0:get_name() == "player_hurt" then
                local var_2_12 = entities.get_local_pawn()
                local var_2_13 = arg_2_0:get_pawn_from_id("userid")
                local var_2_14 = arg_2_0:get_int("dmg_health")
                local var_2_15 = arg_2_0:get_int("dmg_armor")

                if var_2_13 == var_2_12 then
                        slot_0_89_0 = var_2_12.m_iHealth:get()
                        slot_0_90_0 = var_2_12.m_ArmorValue:get()

                        if slot_0_89_0 <= 0 then
                                slot_0_89_0 = 0
                        end

                        if slot_0_90_0 <= 0 then
                                slot_0_90_0 = 0
                        end

                        if slot_0_89_0 >= 100 then
                                slot_0_89_0 = 100
                        end

                        if slot_0_90_0 >= 100 then
                                slot_0_90_0 = 100
                        end

                        if slot_0_89_0 >= 0 and slot_0_89_0 <= 100 then
                                slot_0_87_0 = slot_0_89_0 + var_2_14
                        end

                        if slot_0_90_0 >= 0 and slot_0_90_0 <= 100 then
                                slot_0_88_0 = slot_0_90_0 + var_2_15
                        end

                        slot_0_91_0 = game.global_vars.cur_time
                        slot_0_92_0 = game.global_vars.cur_time
                end
        end

        if arg_2_0:get_name() == "enter_buyzone" then
                slot_0_93_0 = true
        end

        if arg_2_0:get_name() == "exit_buyzone" then
                slot_0_93_0 = false
        end

        if arg_2_0:get_name() == "buytime_ended" then
                slot_0_93_0 = false
        end
end

function slot_0_96_0()
        local var_3_0 = slot_0_27_0:get_value():get()
        local var_3_1 = game.global_vars.cur_time

        if slot_0_87_0 <= 0 then
                slot_0_87_0 = 0
        end

        if slot_0_88_0 <= 0 then
                slot_0_88_0 = 0
        end

        if slot_0_87_0 >= 100 then
                slot_0_87_0 = 100
        end

        if slot_0_88_0 >= 100 then
                slot_0_88_0 = 100
        end

        if slot_0_87_0 ~= slot_0_89_0 then
                local var_3_2 = (var_3_1 - slot_0_91_0) * var_3_0 * 0.1

                if var_3_2 >= 1 then
                        slot_0_87_0 = slot_0_89_0
                else
                        slot_0_87_0 = slot_0_94_0(slot_0_87_0, slot_0_89_0, var_3_2)
                end
        end

        if slot_0_88_0 ~= slot_0_90_0 then
                local var_3_3 = (var_3_1 - slot_0_92_0) * var_3_0 * 0.1

                if var_3_3 >= 1 then
                        slot_0_88_0 = slot_0_90_0
                else
                        slot_0_88_0 = slot_0_94_0(slot_0_88_0, slot_0_90_0, var_3_3)
                end
        end
end

slot_0_97_0 = {}

function slot_0_98_0(arg_4_0, arg_4_1)
        table.insert(slot_0_97_0, {
                reqTime = game.global_vars.cur_time + arg_4_0,
                callback = arg_4_1
        })
end

function slot_0_99_0()
        local var_5_0 = game.global_vars.cur_time

        for iter_5_0, iter_5_1 in ipairs(slot_0_97_0) do
                if var_5_0 >= iter_5_1.reqTime then
                        iter_5_1.callback()
                        table.remove(slot_0_97_0, iter_5_0)
                end
        end
end

function slot_0_100_0(arg_6_0, arg_6_1, arg_6_2)
        if arg_6_0[arg_6_1] then
                local var_6_0 = arg_6_0[arg_6_1]

                slot_0_98_0(arg_6_2, function()
                        for iter_7_0, iter_7_1 in ipairs(arg_6_0) do
                                if iter_7_1 == var_6_0 then
                                        table.remove(arg_6_0, iter_7_0)

                                        break
                                end
                        end
                end)
        end
end

slot_0_101_0 = utils.find_export("user32.dll", "GetAsyncKeyState")
slot_0_102_0 = ffi.cast("int(__stdcall*)(int)", slot_0_101_0)

function slot_0_103_0(arg_8_0)
        local var_8_0 = slot_0_102_0(arg_8_0)

        return bit.band(var_8_0, 32768) ~= 0
end

slot_0_30_0:add_callback(function()
        slot_0_61_0:destroy()
        slot_0_62_0:destroy()

        slot_0_61_0 = draw.font_gdi("iconscs2", slot_0_28_0:get_value():get(), bit.bor(draw.font_flags.anti_alias, draw.font_flags.no_dpi))
        slot_0_62_0 = draw.font_gdi("Verdana Regular", slot_0_29_0:get_value():get(), bit.bor(draw.font_flags.anti_alias, draw.font_flags.no_dpi))

        slot_0_61_0:create()
        slot_0_62_0:create()
        print("Font changed")
end)
slot_0_31_0:add_callback(function()
        deathLogs = {}
        slot_0_83_0 = 0

        print("Killfeed cache cleared manually")
end)

function sin(arg_11_0)
        local var_11_0 = arg_11_0
        local var_11_1 = arg_11_0
        local var_11_2 = 1

        while var_11_2 < 10 do
                var_11_1 = -var_11_1 * arg_11_0^2 / (2 * var_11_2 * (2 * var_11_2 + 1))
                var_11_0 = var_11_0 + var_11_1
                var_11_2 = var_11_2 + 1
        end

        return var_11_0
end

function cos(arg_12_0)
        local var_12_0 = 1
        local var_12_1 = 1
        local var_12_2 = 1

        while var_12_2 < 10 do
                var_12_1 = -var_12_1 * arg_12_0^2 / ((2 * var_12_2 - 1) * (2 * var_12_2))
                var_12_0 = var_12_0 + var_12_1
                var_12_2 = var_12_2 + 1
        end

        return var_12_0
end

function slot_0_104_0()
        slot_0_60_0.skip_dpi = true
        slot_13_0_0 = entities.get_local_pawn()
        slot_13_1_0 = 200
        slot_13_2_0 = 5
        slot_13_3_0 = 200
        slot_13_4_0 = 5

        if not slot_0_66_0 or not slot_0_67_0 then
                slot_0_66_0 = slot_0_2_0 / 2 + 600
                slot_0_67_0 = slot_0_3_0 / 2 - slot_0_3_0 / 2.75

                if slot_0_66_0 > slot_0_2_0 + 50 then
                        slot_0_66_0 = slot_0_2_0 / 2
                end

                if slot_0_67_0 > slot_0_3_0 + 50 then
                        slot_0_67_0 = slot_0_3_0 / 2
                end
        end

        if not slot_0_71_0 or not slot_0_72_0 then
                slot_0_71_0 = slot_0_2_0 / 2 + 175
                slot_0_72_0 = slot_0_3_0 / 2 - slot_0_3_0 / 2.75 + 385

                if slot_0_71_0 > slot_0_2_0 + 50 then
                        slot_0_71_0 = slot_0_2_0 / 2
                end

                if slot_0_72_0 > slot_0_3_0 + 50 then
                        slot_0_72_0 = slot_0_3_0 / 2 + 150
                end
        end

        if not slot_0_76_0 or not slot_0_77_0 then
                slot_0_76_0 = slot_0_2_0 / 2 - 1000
                slot_0_77_0 = slot_0_3_0 - 45

                if slot_0_76_0 > slot_0_2_0 + 50 then
                        slot_0_76_0 = slot_0_2_0 / 2
                end

                if slot_0_77_0 > slot_0_3_0 + 50 then
                        slot_0_77_0 = slot_0_3_0 / 2 + 300
                end
        end

        if not slot_0_81_0 or not slot_0_82_0 then
                slot_0_81_0 = slot_0_2_0 / 2 - 650
                slot_0_82_0 = slot_0_3_0 - 45

                if slot_0_81_0 > slot_0_2_0 + 50 then
                        slot_0_81_0 = slot_0_2_0 / 2 + 350
                end

                if slot_0_82_0 > slot_0_3_0 + 50 then
                        slot_0_82_0 = slot_0_3_0 / 2 + 300
                end
        end

        if not game.engine:in_game() then
                deathLogs = {}
                slot_0_83_0 = 0
        end

        slot_13_5_0 = gui.input:cursor()
        slot_13_6_0 = slot_0_103_0(1)
        slot_13_7_0 = 200
        slot_13_8_0 = 50 * table.getn(deathLogs)

        if slot_13_5_0.x >= slot_0_66_0 - slot_13_7_0 and slot_13_5_0.x <= slot_0_66_0 and slot_13_5_0.y >= slot_0_67_0 and slot_13_5_0.y <= slot_0_67_0 + slot_13_8_0 and slot_13_6_0 and not slot_0_68_0 then
                slot_0_68_0 = true
                slot_0_69_0 = slot_13_5_0.x - slot_0_66_0
                slot_0_70_0 = slot_13_5_0.y - slot_0_67_0
        end

        if slot_0_68_0 then
                if slot_13_6_0 then
                        slot_0_66_0 = slot_13_5_0.x - slot_0_69_0
                        slot_0_67_0 = slot_13_5_0.y - slot_0_70_0
                else
                        slot_0_68_0 = false
                end
        end

        if slot_13_5_0.x >= slot_0_71_0 + 10 and slot_13_5_0.x <= slot_0_71_0 + 20 and slot_13_5_0.y >= slot_0_72_0 + 15 and slot_13_5_0.y <= slot_0_72_0 + 25 and slot_13_6_0 and not slot_0_73_0 then
                slot_0_73_0 = true
        end

        if slot_0_73_0 then
                if slot_13_6_0 then
                        slot_0_71_0 = slot_13_5_0.x - 15
                        slot_0_72_0 = slot_13_5_0.y - 20
                else
                        slot_0_73_0 = false
                end
        end

        if slot_13_5_0.x >= slot_0_76_0 - 70 and slot_13_5_0.x <= slot_0_76_0 + slot_13_1_0 + slot_0_81_0 + slot_13_3_0 + 50 and slot_13_5_0.y >= slot_0_77_0 - 20 and slot_13_5_0.y <= slot_0_77_0 + slot_13_2_0 + 20 and slot_13_6_0 and not slot_0_78_0 then
                slot_0_78_0 = true
                slot_0_79_0 = slot_13_5_0.x - slot_0_76_0
                slot_0_80_0 = slot_13_5_0.y - slot_0_77_0
        end

        if slot_0_78_0 then
                if slot_13_6_0 then
                        slot_0_76_0 = slot_13_5_0.x - slot_0_79_0
                        slot_0_77_0 = slot_13_5_0.y - slot_0_80_0
                        slot_0_81_0 = slot_0_76_0 + 350
                        slot_0_82_0 = slot_0_77_0
                else
                        slot_0_78_0 = false
                end
        end

        slot_13_9_0 = slot_0_5_0:get_value():get()
        slot_13_10_0 = slot_0_6_0:get_value():get()
        slot_13_11_0 = slot_0_7_0:get_value():get()
        slot_13_12_0 = slot_0_8_0:get_value():get()
        slot_13_13_0 = slot_0_9_0:get_value():get()
        slot_13_14_0 = slot_0_10_0:get_value():get()
        slot_13_15_0 = slot_0_11_0:get_value():get()
        slot_13_16_0 = slot_0_12_0:get_value():get()
        slot_13_17_0 = slot_0_13_0:get_value():get()
        slot_13_18_0 = slot_0_14_0:get_value():get()
        slot_13_19_0 = slot_0_15_0:get_value():get()
        slot_13_20_0 = slot_0_16_0:get_value():get()
        slot_13_21_0 = slot_0_17_0:get_value():get()
        slot_13_22_0 = slot_0_18_0:get_value():get()
        slot_13_23_0 = slot_0_19_0:get_value():get()
        slot_13_24_0 = slot_0_20_0:get_value():get()
        slot_13_25_0 = slot_0_21_0:get_value():get()
        slot_13_26_0 = slot_0_22_0:get_value():get()
        slot_13_27_0 = slot_0_23_0:get_value():get():get_raw()
        slot_13_28_0 = slot_0_24_0:get_value():get():get_raw()
        slot_13_29_0 = nil
        slot_13_30_0 = nil
        slot_13_31_0 = nil
        slot_13_32_0 = slot_0_25_0:get_value():get()
        slot_13_33_0 = slot_0_26_0:get_value():get()
        slot_13_34_0 = 0
        slot_13_35_0 = 0
        slot_13_36_0 = math.abs(sin(game.global_vars.cur_time * 0.25))
        slot_13_37_0 = math.abs(cos(game.global_vars.cur_time * 0.25))
        slot_13_38_0 = slot_0_27_0:get_value():get()

        if not slot_0_4_0:get_value():get() then
                return
        end

        if not game.engine:in_game() then
                return
        end

        if slot_13_10_0 then
                slot_13_39_2 = slot_13_0_0.m_iHealth:get()
                slot_13_40_2 = slot_13_0_0.m_ArmorValue:get()
                slot_0_89_0 = slot_13_0_0.m_iHealth:get()
                slot_0_90_0 = slot_13_0_0.m_ArmorValue:get()

                if slot_0_87_0 < 0 then
                        slot_0_87_0 = 0
                end

                if slot_0_88_0 < 0 then
                        slot_0_88_0 = 0
                end

                if slot_0_87_0 > 100 then
                        slot_0_87_0 = 100
                end

                if slot_0_88_0 > 100 then
                        slot_0_88_0 = 100
                end

                if slot_13_39_2 < 0 then
                        slot_13_39_2 = 0
                end

                if slot_13_40_2 < 0 then
                        slot_13_40_2 = 0
                end

                if slot_13_39_2 > 100 then
                        slot_13_39_2 = 100
                end

                if slot_13_40_2 > 100 then
                        slot_13_40_1 = 100
                end

                slot_0_96_0()

                slot_13_41_1 = slot_0_94_0(0, slot_13_1_0, slot_0_87_0 / 100)
                slot_13_42_2 = slot_0_94_0(0, slot_13_3_0, slot_0_88_0 / 100)

                slot_0_60_0:add_shadow_rect(draw.rect(slot_0_76_0, slot_0_77_0, slot_0_76_0 + slot_13_1_0, slot_0_77_0 + slot_13_2_0), 5, true, 0.25)
                slot_0_60_0:add_shadow_rect(draw.rect(slot_0_81_0, slot_0_82_0, slot_0_81_0 + slot_13_3_0, slot_0_82_0 + slot_13_4_0), 5, true, 0.25)

                slot_13_43_2 = slot_13_22_0

                if slot_13_39_2 < math.floor(slot_0_87_0) then
                        slot_13_43_2 = slot_13_24_0
                else
                        slot_13_43_2 = slot_13_22_0
                end

                slot_0_60_0:add_rect_filled(draw.rect(slot_0_76_0, slot_0_77_0, slot_0_76_0 + slot_13_41_1, slot_0_77_0 + slot_13_2_0), slot_13_43_2)
                slot_0_60_0:add_rect_filled(draw.rect(slot_0_81_0, slot_0_82_0, slot_0_81_0 + slot_13_42_2, slot_0_82_0 + slot_13_4_0), slot_13_23_0)

                slot_0_60_0.font = slot_0_63_0

                slot_0_60_0:add_text(draw.vec2(slot_0_76_0 - 70, slot_0_77_0 - 3), string.format("HP"), slot_13_22_0)
                slot_0_60_0:add_text(draw.vec2(slot_0_81_0 - 70, slot_0_82_0 - 3), string.format("AP"), slot_13_23_0)

                slot_0_60_0.font = slot_0_64_0

                slot_0_60_0:add_text(draw.vec2(slot_0_76_0 - 50, slot_0_77_0 - 20), string.format("%.0f", slot_0_87_0), slot_13_22_0)
                slot_0_60_0:add_text(draw.vec2(slot_0_81_0 - 50, slot_0_82_0 - 20), string.format("%.0f", slot_0_88_0), slot_13_23_0)
        end

        if slot_0_93_0 then
                -- block empty
        end

        if slot_0_83_0 > 0 and slot_13_9_0 then
                slot_0_60_0.font = slot_0_61_0
                slot_13_39_1 = draw.vec2(slot_0_71_0 + 10, slot_0_72_0 + 15)

                slot_0_60_0:add_text(slot_13_39_1, "o", slot_13_13_0, right)

                slot_0_60_0.font = slot_0_62_0
                slot_13_40_0 = draw.vec2(slot_0_71_0 + 32, slot_0_72_0 + 18)

                slot_0_60_0:add_text(slot_13_40_0, tostring(slot_0_83_0), slot_13_13_0, right)
        end

        for iter_13_0, iter_13_1 in ipairs(deathLogs) do
                slot_13_44_0 = 7
                slot_13_45_1 = 18 + slot_13_44_0 * 2 + math.max(slot_0_29_0:get_value():get(), slot_0_28_0:get_value():get()) / 10
                slot_13_46_4 = 0
                slot_0_60_0.font = slot_0_62_0
                slot_13_48_0 = slot_0_60_0.font:get_text_size(iter_13_1.attacker).x
                slot_13_46_3 = slot_13_46_4 + slot_13_48_0 + slot_13_44_0

                if iter_13_1.assisterPawn then
                        slot_13_35_0 = slot_0_60_0.font:get_text_size(" + " .. iter_13_1.assister).x
                        slot_13_46_3 = slot_13_46_3 + slot_13_35_0 + slot_13_44_0 + 12
                end

                slot_0_60_0.font = slot_0_61_0
                slot_13_49_0 = slot_0_65_0[iter_13_1.weapon] or "?"
                slot_13_50_0 = 0
                slot_13_51_0 = 5

                if iter_13_1.weapon == "hegrenade" or iter_13_1.weapon == "inferno" or iter_13_1.weapon == "smokegrenade" or iter_13_1.weapon == "flashbang" or iter_13_1.weapon == "decoy" then
                        slot_13_50_0 = 9
                        slot_13_51_0 = -9
                end

                if iter_13_1.isFly and slot_13_28_0 == 1 then
                        slot_13_49_0 = "[ " .. slot_0_65_0[iter_13_1.weapon]
                end

                slot_13_53_0 = slot_0_60_0.font:get_text_size(slot_13_49_0).x + slot_13_50_0
                slot_13_46_2 = slot_13_46_3 + slot_13_53_0 + slot_13_44_0 + slot_13_51_0
                slot_13_54_0 = 0

                if iter_13_1.isHeadshot then
                        slot_0_60_0.font = slot_0_61_0
                        slot_13_55_1 = nil

                        if slot_13_27_0 == 1 then
                                slot_13_55_1 = slot_0_60_0.font:get_text_size("k")
                        else
                                slot_13_55_1 = slot_0_60_0.font:get_text_size("\\")
                        end

                        slot_13_54_0 = slot_13_55_1.x
                        slot_13_46_2 = slot_13_46_2 + slot_13_54_0 + slot_13_44_0
                end

                slot_13_55_0 = 0

                if iter_13_1.isNoscope and slot_13_28_0 == 2 then
                        slot_0_60_0.font = slot_0_62_0
                        slot_13_55_0 = slot_0_60_0.font:get_text_size("NS").x
                        slot_13_46_2 = slot_13_46_2 + slot_13_55_0 + slot_13_44_0
                end

                if iter_13_1.isNoscope and slot_13_28_0 == 1 then
                        slot_0_60_0.font = slot_0_61_0
                        slot_13_55_0 = slot_0_60_0.font:get_text_size("X").x
                        slot_13_46_2 = slot_13_46_2 + slot_13_55_0 + slot_13_44_0
                end

                slot_13_56_0 = 0

                if iter_13_1.isFly and slot_13_28_0 == 2 then
                        slot_0_60_0.font = slot_0_62_0
                        slot_13_56_0 = slot_0_60_0.font:get_text_size("AIR").x
                        slot_13_46_2 = slot_13_46_2 + slot_13_56_0 + slot_13_44_0
                end

                slot_13_57_0 = 0

                if iter_13_1.wallbang > 0 and slot_13_28_0 == 1 then
                        slot_0_60_0.font = slot_0_61_0
                        slot_13_57_0 = slot_0_60_0.font:get_text_size("/").x
                        slot_13_46_2 = slot_13_46_2 + slot_13_57_0 + slot_13_44_0
                end

                if iter_13_1.wallbang > 0 and slot_13_28_0 == 2 then
                        slot_0_60_0.font = slot_0_62_0
                        slot_13_57_0 = slot_0_60_0.font:get_text_size("WB").x
                        slot_13_46_2 = slot_13_46_2 + slot_13_57_0 + slot_13_44_0
                end

                slot_13_58_0 = 0

                if iter_13_1.isThrusmoke and slot_13_28_0 == 1 then
                        slot_0_60_0.font = slot_0_61_0
                        slot_13_58_0 = slot_0_60_0.font:get_text_size("Y").x
                        slot_13_46_2 = slot_13_46_2 + slot_13_58_0 + slot_13_44_0
                end

                if iter_13_1.isThrusmoke and slot_13_28_0 == 2 then
                        slot_0_60_0.font = slot_0_62_0
                        slot_13_58_0 = slot_0_60_0.font:get_text_size("SM").x
                        slot_13_46_2 = slot_13_46_2 + slot_13_58_0 + slot_13_44_0
                end

                slot_0_60_0.font = slot_0_62_0
                slot_13_46_1 = slot_13_46_2 + slot_0_60_0.font:get_text_size(iter_13_1.victim).x + slot_13_44_0 + 2
                slot_13_61_0 = 1 / slot_13_38_0
                slot_13_62_0 = 1 / slot_13_38_0
                slot_13_63_0 = game.global_vars.cur_time - iter_13_1.timeAdded
                slot_13_64_0 = slot_13_33_0 - slot_13_62_0
                slot_13_65_0 = iter_13_1.isFadingOut and math.max(0, math.min(1, (slot_13_33_0 - slot_13_63_0) / slot_13_62_0)) or 1
                slot_13_67_0 = math.min(1, slot_13_63_0 / slot_13_61_0) * slot_13_65_0
                slot_13_68_0 = draw.color(slot_13_16_0:get_r(), slot_13_16_0:get_g(), slot_13_16_0:get_b(), math.floor(slot_13_16_0:get_a() * slot_13_67_0))
                slot_13_69_0 = draw.color(slot_13_11_0:get_r(), slot_13_11_0:get_g(), slot_13_11_0:get_b(), math.floor(slot_13_11_0:get_a() * slot_13_67_0))
                slot_13_70_0 = draw.rect(slot_0_66_0 - slot_13_46_1, slot_0_67_0 + slot_13_34_0, slot_0_66_0 + 6, slot_0_67_0 + slot_13_34_0 + slot_13_45_1 - 4)

                slot_0_60_0:add_rect_filled(slot_13_70_0, slot_13_68_0)
                slot_0_60_0:add_glow(slot_13_70_0, 5, slot_13_69_0)

                slot_13_71_0 = draw.vec2(slot_0_66_0 - slot_13_46_1 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 2)
                slot_0_60_0.font = slot_0_62_0

                if slot_13_0_0 == iter_13_1.attackerPawn then
                        slot_13_29_0 = draw.color(slot_13_12_0:get_r(), slot_13_12_0:get_g(), slot_13_12_0:get_b(), math.floor(slot_13_12_0:get_a() * slot_13_67_0))
                elseif slot_13_0_0.m_iTeamNum:get() == iter_13_1.attackerPawn.m_iTeamNum:get() and not iter_13_1.weapon ~= "world" then
                        slot_13_29_0 = draw.color(slot_13_15_0:get_r(), slot_13_15_0:get_g(), slot_13_15_0:get_b(), math.floor(slot_13_15_0:get_a() * slot_13_67_0))
                else
                        slot_13_29_0 = draw.color(slot_13_14_0:get_r(), slot_13_14_0:get_g(), slot_13_14_0:get_b(), math.floor(slot_13_14_0:get_a() * slot_13_67_0))
                end

                slot_0_60_0:add_text(slot_13_71_0, iter_13_1.attacker, slot_13_29_0, right)

                slot_13_72_0 = nil

                if iter_13_1.assisterPawn then
                        slot_13_73_1 = draw.vec2(slot_13_71_0.x + slot_13_48_0 + slot_13_44_0, slot_13_71_0.y)

                        slot_0_60_0:add_text(slot_13_73_1, " +", draw.color(255, 255, 255, math.floor(255 * slot_13_67_0)), right)

                        slot_13_72_0 = draw.vec2(slot_13_73_1.x + slot_0_60_0.font:get_text_size("+").x + slot_13_44_0 + 5, slot_13_71_0.y)

                        if slot_13_0_0 == iter_13_1.assisterPawn then
                                slot_13_30_0 = draw.color(slot_13_12_0:get_r(), slot_13_12_0:get_g(), slot_13_12_0:get_b(), math.floor(slot_13_12_0:get_a() * slot_13_67_0))
                        elseif slot_13_0_0.m_iTeamNum:get() == iter_13_1.attackerPawn.m_iTeamNum:get() then
                                slot_13_30_0 = draw.color(slot_13_15_0:get_r(), slot_13_15_0:get_g(), slot_13_15_0:get_b(), math.floor(slot_13_15_0:get_a() * slot_13_67_0))
                        else
                                slot_13_30_0 = draw.color(slot_13_14_0:get_r(), slot_13_14_0:get_g(), slot_13_14_0:get_b(), math.floor(slot_13_14_0:get_a() * slot_13_67_0))
                        end

                        slot_0_60_0:add_text(slot_13_72_0, iter_13_1.assister, slot_13_30_0, right)
                end

                slot_13_73_0 = 3
                slot_13_74_0 = 3
                slot_0_60_0.font = slot_0_61_0

                if iter_13_1.attackerPawn.m_iTeamNum:get() == 3 and iter_13_1.weapon == "inferno" then
                        slot_13_49_0 = "q"
                end

                slot_13_75_0 = draw.vec2(slot_0_66_0 - slot_13_53_0 - slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + slot_13_74_0)

                if slot_13_72_0 then
                        slot_13_75_0 = draw.vec2(slot_13_72_0.x + slot_13_35_0 + slot_13_44_0 - 5, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + slot_13_74_0)
                else
                        slot_13_75_0 = draw.vec2(slot_13_71_0.x + slot_13_48_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + slot_13_74_0)
                end

                slot_13_76_0 = draw.color(slot_13_13_0:get_r(), slot_13_13_0:get_g(), slot_13_13_0:get_b(), math.floor(slot_13_13_0:get_a() * slot_13_67_0))

                slot_0_60_0:add_text(slot_13_75_0, slot_13_49_0, slot_13_76_0, right)

                slot_13_77_0 = nil

                if iter_13_1.isHeadshot then
                        slot_0_60_0.font = slot_0_61_0
                        slot_13_77_0 = draw.vec2(slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 3)
                        slot_13_78_1 = draw.color(slot_13_17_0:get_r(), slot_13_17_0:get_g(), slot_13_17_0:get_b(), math.floor(slot_13_17_0:get_a() * slot_13_67_0))

                        if slot_13_27_0 == 1 then
                                slot_0_60_0:add_text(slot_13_77_0, "k", slot_13_78_1, right)
                        else
                                slot_0_60_0:add_text(slot_13_77_0, "\\", slot_13_78_1, right)
                        end
                end

                slot_13_78_0 = nil

                if iter_13_1.isNoscope then
                        slot_13_79_1 = draw.color(slot_13_18_0:get_r(), slot_13_18_0:get_g(), slot_13_18_0:get_b(), math.floor(slot_13_18_0:get_a() * slot_13_67_0))

                        if slot_13_28_0 == 1 then
                                slot_0_60_0.font = slot_0_61_0
                                slot_13_78_0 = draw.vec2(slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 + 3 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 3)

                                slot_0_60_0:add_text(slot_13_78_0, "X", slot_13_79_1, right)
                        else
                                slot_0_60_0.font = slot_0_62_0
                                slot_13_78_0 = draw.vec2(slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 + 3 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 2)

                                slot_0_60_0:add_text(slot_13_78_0, "NS", slot_13_79_1, right)
                        end
                end

                slot_13_79_0 = nil

                if iter_13_1.isFly and slot_13_28_0 == 2 then
                        slot_0_60_0.font = slot_0_62_0
                        slot_13_79_0 = draw.vec2(slot_13_78_0 and slot_13_78_0.x + slot_13_55_0 + slot_13_44_0 or slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 2)
                        slot_13_80_1 = draw.color(slot_13_19_0:get_r(), slot_13_19_0:get_g(), slot_13_19_0:get_b(), math.floor(slot_13_19_0:get_a() * slot_13_67_0))

                        slot_0_60_0:add_text(slot_13_79_0, "AIR", slot_13_80_1, right)
                end

                slot_13_80_0 = nil

                if iter_13_1.wallbang > 0 then
                        slot_13_81_1 = draw.color(slot_13_20_0:get_r(), slot_13_20_0:get_g(), slot_13_20_0:get_b(), math.floor(slot_13_20_0:get_a() * slot_13_67_0))

                        if slot_13_28_0 == 1 then
                                slot_0_60_0.font = slot_0_61_0
                                slot_13_80_0 = draw.vec2(slot_13_79_0 and slot_13_79_0.x + slot_13_56_0 + slot_13_44_0 + 3 or slot_13_78_0 and slot_13_78_0.x + slot_13_55_0 + slot_13_44_0 - 1 or slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 + 3 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 3)

                                slot_0_60_0:add_text(slot_13_80_0, "/", slot_13_81_1, right)
                        else
                                slot_0_60_0.font = slot_0_62_0
                                slot_13_80_0 = draw.vec2(slot_13_79_0 and slot_13_79_0.x + slot_13_56_0 + slot_13_44_0 or slot_13_78_0 and slot_13_78_0.x + slot_13_55_0 + slot_13_44_0 - 1 or slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 2)

                                slot_0_60_0:add_text(slot_13_80_0, "WB", slot_13_81_1, right)
                        end
                end

                slot_13_81_0 = nil

                if iter_13_1.isThrusmoke then
                        slot_13_82_1 = draw.color(slot_13_21_0:get_r(), slot_13_21_0:get_g(), slot_13_21_0:get_b(), math.floor(slot_13_21_0:get_a() * slot_13_67_0))

                        if slot_13_28_0 == 1 then
                                slot_0_60_0.font = slot_0_61_0
                                slot_13_81_0 = draw.vec2(slot_13_80_0 and slot_13_80_0.x + slot_13_57_0 + slot_13_44_0 + 1 or slot_13_79_0 and slot_13_79_0.x + slot_13_56_0 + slot_13_44_0 + 3 or slot_13_78_0 and slot_13_78_0.x + slot_13_55_0 + slot_13_44_0 - 1 or slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 + 3 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 3)

                                slot_0_60_0:add_text(slot_13_81_0, "Y", slot_13_82_1, right)
                        else
                                slot_0_60_0.font = slot_0_62_0
                                slot_13_81_0 = draw.vec2(slot_13_80_0 and slot_13_80_0.x + slot_13_57_0 + slot_13_44_0 or slot_13_79_0 and slot_13_79_0.x + slot_13_56_0 + slot_13_44_0 or slot_13_78_0 and slot_13_78_0.x + slot_13_55_0 + slot_13_44_0 - 1 or slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 2)

                                slot_0_60_0:add_text(slot_13_81_0, "SM", slot_13_82_1, right)
                        end
                end

                slot_0_60_0.font = slot_0_62_0
                slot_13_82_0 = draw.vec2(slot_13_81_0 and slot_13_81_0.x + slot_13_58_0 + slot_13_44_0 or slot_13_80_0 and slot_13_80_0.x + slot_13_57_0 + slot_13_44_0 or slot_13_79_0 and slot_13_79_0.x + slot_13_56_0 + slot_13_44_0 or slot_13_78_0 and slot_13_78_0.x + slot_13_55_0 + slot_13_44_0 or slot_13_77_0 and slot_13_77_0.x + slot_13_54_0 + slot_13_44_0 or slot_13_75_0.x + slot_13_53_0 + slot_13_44_0, slot_0_67_0 + slot_13_34_0 + slot_13_44_0 + 2)

                if iter_13_1.weapon == "inferno" or iter_13_1.weapon == "hegrenade" or iter_13_1.weapon == "flashbang" or iter_13_1.weapon == "smokegrenade" then
                        slot_13_82_0 = draw.vec2(slot_13_82_0.x - 10, slot_13_82_0.y)
                end

                if iter_13_1.wallbang > 0 and slot_13_28_0 == 1 then
                        slot_13_82_0 = draw.vec2(slot_13_82_0.x, slot_13_82_0.y)
                end

                if iter_13_1.wallbang > 0 and slot_13_28_0 == 1 and iter_13_1.isThrusmoke and slot_13_28_0 == 1 then
                        slot_13_82_0 = draw.vec2(slot_13_82_0.x + 2, slot_13_82_0.y)
                end

                if iter_13_1.isThrusmoke and slot_13_28_0 == 1 then
                        slot_13_82_0 = draw.vec2(slot_13_82_0.x, slot_13_82_0.y)
                end

                if iter_13_1.weapon == "world" then
                        slot_13_82_0 = draw.vec2(slot_13_82_0.x + 3, slot_13_82_0.y)
                end

                if slot_13_0_0 == iter_13_1.victimPawn then
                        slot_13_31_0 = draw.color(slot_13_12_0:get_r(), slot_13_12_0:get_g(), slot_13_12_0:get_b(), math.floor(slot_13_12_0:get_a() * slot_13_67_0))
                elseif slot_13_0_0.m_iTeamNum:get() == iter_13_1.victimPawn.m_iTeamNum:get() then
                        slot_13_31_0 = draw.color(slot_13_15_0:get_r(), slot_13_15_0:get_g(), slot_13_15_0:get_b(), math.floor(slot_13_15_0:get_a() * slot_13_67_0))
                else
                        slot_13_31_0 = draw.color(slot_13_14_0:get_r(), slot_13_14_0:get_g(), slot_13_14_0:get_b(), math.floor(slot_13_14_0:get_a() * slot_13_67_0))
                end

                slot_0_60_0:add_text(slot_13_82_0, iter_13_1.victim, slot_13_31_0, right)

                if slot_13_32_0 == 0 then
                        slot_13_34_0 = slot_13_34_0 + slot_13_45_1 + 10
                else
                        slot_13_34_0 = slot_13_34_0 + slot_13_45_1 + slot_13_32_0
                end

                if iter_13_1.attackerPawn == slot_13_0_0 or iter_13_1.victimPawn == slot_13_0_0 or iter_13_1.assisterPawn == slot_13_0_0 then
                        slot_0_84_0 = true
                else
                        slot_0_84_0 = false
                end
        end

        if slot_13_26_0 then
                slot_13_39_0 = deathLogs[#deathLogs]

                if slot_13_39_0 and not slot_0_84_0 and not slot_13_39_0.isFadingOut then
                        slot_13_41_0 = 1 / (slot_0_27_0 and slot_0_27_0:get_value():get()) + slot_13_33_0
                        slot_13_39_0.isFadingOut = true

                        slot_0_98_0(slot_13_41_0, function()
                                for iter_14_0, iter_14_1 in ipairs(deathLogs) do
                                        if iter_14_1 == slot_13_39_0 then
                                                table.remove(deathLogs, iter_14_0)

                                                break
                                        end
                                end
                        end)
                end
        else
                for iter_13_2 = #deathLogs, 1, -1 do
                        slot_13_43_0 = deathLogs[iter_13_2]

                        if not slot_13_43_0 or slot_13_43_0.isFadingOut or slot_0_84_0 and slot_13_26_0 then
                                -- block empty
                        else
                                slot_13_45_0 = 1 / (slot_0_27_0 and slot_0_27_0:get_value():get())
                                slot_13_46_0 = game.global_vars.cur_time - slot_13_43_0.timeAdded
                                slot_13_47_0 = slot_13_33_0 - slot_13_45_0

                                if slot_13_46_0 and slot_13_47_0 and slot_13_47_0 <= slot_13_46_0 then
                                        slot_13_43_0.isFadingOut = true

                                        slot_0_98_0(slot_13_45_0, function()
                                                for iter_15_0, iter_15_1 in ipairs(deathLogs) do
                                                        if iter_15_1 == slot_13_43_0 then
                                                                table.remove(deathLogs, iter_15_0)

                                                                break
                                                        end
                                                end
                                        end)
                                end
                        end
                end
        end

        while slot_13_25_0 < #deathLogs do
                table.remove(deathLogs, 1)
        end

        slot_0_60_0.skip_dpi = true
end

mods.events:add_listener("player_death")
mods.events:add_listener("cs_pre_restart")
mods.events:add_listener("player_chat")
mods.events:add_listener("enter_buyzone")
mods.events:add_listener("exit_buyzone")
mods.events:add_listener("buytime_ended")
events.event:add(slot_0_95_0)
events.present_queue:add(slot_0_104_0)
events.present_queue:add(slot_0_99_0)
