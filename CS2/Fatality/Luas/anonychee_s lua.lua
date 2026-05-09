--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("watermark"))
slot_0_0_0.tooltip = "Show watermark"
slot_0_1_0 = gui.checkbox(gui.control_id("watermark_showname"))
slot_0_1_0.tooltip = "Show username in watermark"
slot_0_2_0 = {
        "fatality",
        "aimjunkies",
        "aimware",
        "ayyware",
        "ezfrags",
        "x22"
}
slot_0_3_0 = gui.combo_box(gui.control_id("watermark_combobox"))

for iter_0_0, iter_0_1 in ipairs(slot_0_2_0) do
        slot_0_9_1 = gui.selectable(gui.control_id("watermark_" .. string.lower(iter_0_1)), iter_0_1)

        slot_0_3_0:add(slot_0_9_1)
end

slot_0_4_0 = gui.make_control("Watermark", slot_0_0_0)

slot_0_4_0:add(slot_0_1_0)
slot_0_4_0:add(slot_0_3_0)

slot_0_5_0 = gui.checkbox(gui.control_id("vote_revealer"))
slot_0_5_0.tooltip = "Show vote revealer"
slot_0_6_0 = gui.make_control("Vote Revealer", slot_0_5_0)
slot_0_7_0 = gui.checkbox(gui.control_id("vote_revealer_say"))
slot_0_7_0.tooltip = "Say vote in chat"

slot_0_6_0:add(slot_0_7_0)

slot_0_8_0 = gui.combo_box(gui.control_id("vote_revealer_combo_box"))
slot_0_9_0 = gui.selectable(gui.control_id("vote_revealer_teamchat"), "Team Chat")
slot_0_10_0 = gui.selectable(gui.control_id("vote_revealer_allchat"), "All Chat")

slot_0_8_0:add(slot_0_9_0)
slot_0_8_0:add(slot_0_10_0)
slot_0_6_0:add(slot_0_8_0)

slot_0_11_0 = gui.checkbox(gui.control_id("team_damage"))
slot_0_11_0.tooltip = "Show team damage"
slot_0_12_0 = gui.make_control("Team Damage", slot_0_11_0)
slot_0_13_0 = gui.checkbox(gui.control_id("hit_bar"))
slot_0_13_0.tooltip = "Show hit bar"
slot_0_14_0 = gui.make_control("Hit Bar", slot_0_13_0)
slot_0_15_0 = gui.checkbox(gui.control_id("player_list"))
slot_0_15_0.tooltip = "Show player list"
slot_0_16_0 = gui.make_control("Player List", slot_0_15_0)
slot_0_17_0 = gui.checkbox(gui.control_id("player_list_killstreak"))
slot_0_17_0.tooltip = "Say killstreak in chat"

slot_0_16_0:add(slot_0_17_0)

slot_0_18_0 = gui.checkbox(gui.control_id("hit_log"))
slot_0_18_0.tooltip = "Show hit log"
slot_0_19_0 = gui.make_control("Hit Log", slot_0_18_0)
slot_0_20_0 = gui.checkbox(gui.control_id("manual_aa_indicators"))
slot_0_20_0.tooltip = "Show manual aa indicators"
slot_0_21_0 = gui.make_control("Manual AA Indicators", slot_0_20_0)
slot_0_22_0 = gui.checkbox(gui.control_id("manual_aa_rainbow"))
slot_0_22_0.tooltip = "Rainbow manual aa indicators"

slot_0_21_0:add(slot_0_22_0)

slot_0_23_0 = gui.checkbox(gui.control_id("manual_aa_indicators_text"))
slot_0_23_0.tooltip = "Show text in manual aa indicators"

slot_0_21_0:add(slot_0_23_0)

slot_0_24_0 = gui.checkbox(gui.control_id("middle_indicators"))
slot_0_24_0.tooltip = "Show indicators in the middle of the screen"
slot_0_25_0 = gui.make_control("Middle Indicators", slot_0_24_0)
slot_0_26_0 = gui.checkbox(gui.control_id("ns_on_team_kill"))
slot_0_26_0.tooltip = "Say NS on team kill"
slot_0_27_0 = gui.make_control("NS on Team Kill", slot_0_26_0)
slot_0_28_0 = gui.checkbox(gui.control_id("trails"))
slot_0_28_0.tooltip = "Show trails"
slot_0_29_0 = gui.make_control("Trails", slot_0_28_0)
slot_0_30_0 = {
        "White",
        "Rainbow",
        "Transgender",
        "Red",
        "Green",
        "Blue",
        "Yellow",
        "Purple",
        "Orange",
        "Pink"
}
slot_0_31_0 = gui.combo_box(gui.control_id("trails_combo_box"))

for iter_0_2, iter_0_3 in ipairs(slot_0_30_0) do
        slot_0_37_1 = gui.selectable(gui.control_id("trail_" .. string.lower(iter_0_3)), iter_0_3)

        slot_0_31_0:add(slot_0_37_1)
end

slot_0_29_0:add(slot_0_31_0)

slot_0_32_0 = gui.checkbox(gui.control_id("min_dmg_override"))
slot_0_32_0.tooltip = "Override minimum damage [bind it]"
slot_0_33_0 = gui.make_control("Keybinds", slot_0_32_0)
slot_0_34_0 = gui.checkbox(gui.control_id("hit_chance_override"))
slot_0_34_0.tooltip = "Override hit chance [bind it]"

slot_0_33_0:add(slot_0_34_0)

slot_0_35_0 = gui.checkbox(gui.control_id("disconnect_on_match_end"))
slot_0_35_0.tooltip = "Disconnect on match end"
slot_0_36_0 = gui.make_control("Disconnect on Match End", slot_0_35_0)
slot_0_37_0 = gui.checkbox(gui.control_id("anti_afk"))
slot_0_37_0.tooltip = "Auto AFK"
slot_0_38_0 = gui.make_control("Anti AFK", slot_0_37_0)

slot_0_37_0:add_callback(function()
        game.engine:client_cmd("-forward")
        game.engine:client_cmd("-turnleft")
        game.engine:client_cmd("-back")
        game.engine:client_cmd("-turnright")
end)

slot_0_39_0 = gui.checkbox(gui.control_id("killsay"))
slot_0_39_0.tooltip = "Say something in chat after killing someone"
slot_0_40_0 = gui.make_control("Killsay", slot_0_39_0)
slot_0_41_0 = gui.checkbox(gui.control_id("nospread_killsay"))
slot_0_41_0.tooltip = "Use nospread additional killsay phrases"

slot_0_40_0:add(slot_0_41_0)

slot_0_42_0 = gui.combo_box(gui.control_id("killsay_combo_box"))

slot_0_42_0:add(gui.selectable(gui.control_id("killsay_polite"), "Polite"))
slot_0_42_0:add(gui.selectable(gui.control_id("killsay_aimtux"), "AimTux"))
slot_0_42_0:add(gui.selectable(gui.control_id("killsay_furry"), "Furry"))

slot_0_43_0 = gui.checkbox(gui.control_id("ultimate_killstreak"))
slot_0_43_0.tooltip = "Use ultimate killstreak messages from Counter-Strike 1.6"

slot_0_40_0:add(slot_0_43_0)
slot_0_40_0:add(slot_0_42_0)

slot_0_44_0 = gui.checkbox(gui.control_id("disable_autobuy"))
slot_0_44_0.tooltip = "Disable autobuy when you're holding weapons like AWP/Auto Sniper"
slot_0_45_0 = gui.make_control("Disable Autobuy on AWP/Auto Sniper", slot_0_44_0)
slot_0_46_0 = gui.checkbox(gui.control_id("slowed_indicator"))
slot_0_46_0.tooltip = "Show slowed indicator"
slot_0_47_0 = gui.make_control("Slowed Indicator", slot_0_46_0)
slot_0_48_0 = gui.checkbox(gui.control_id("spectator_list"))
slot_0_48_0.tooltip = "Show spectator list"
slot_0_49_0 = gui.make_control("Spectator List", slot_0_48_0)
slot_0_50_0 = gui.checkbox(gui.control_id("hitmarker"))
slot_0_50_0.tooltip = "Show hitmarker"
slot_0_51_0 = gui.make_control("Hitmarker", slot_0_50_0)
slot_0_52_0 = gui.checkbox(gui.control_id("hitmarker_healthid"))
slot_0_52_0.tooltip = "Show health hitmarker"

slot_0_51_0:add(slot_0_52_0)

function slot_0_53_0(arg_2_0)
        local var_2_0 = arg_2_0:gsub(" ", "_"):lower()
        local var_2_1 = gui.label(gui.control_id(var_2_0), arg_2_0, draw.color(255, 165, 0))

        return gui.make_control(" ", var_2_1)
end

slot_0_54_0 = 0

function slot_0_55_0()
        slot_0_54_0 = slot_0_54_0 + 1

        return gui.make_control(" ", gui.spacer(gui.control_id("spacer_" .. slot_0_54_0)))
end

slot_0_56_0 = gui.label(gui.control_id("playerlist_label"), "(% = px's)", draw.color(255, 255, 255))
slot_0_57_0 = gui.slider(gui.control_id("playerlist_x_slider"), 0, 2560, {
        "%.0f%%"
})
slot_0_58_0 = gui.slider(gui.control_id("playerlist_y_slider"), 0, 1440, {
        "%.0f%%"
})
slot_0_59_0 = gui.checkbox(gui.control_id("playerlist_x_negative"))
slot_0_59_0.tooltip = "Use negative x value"
slot_0_60_0 = gui.checkbox(gui.control_id("playerlist_y_negative"))
slot_0_60_0.tooltip = "Use negative y value"
slot_0_61_0 = gui.make_control("Playerlist Offset", slot_0_56_0)
slot_0_62_0 = gui.make_control("X", slot_0_57_0)
slot_0_63_0 = gui.make_control("Y", slot_0_58_0)

slot_0_62_0:add(slot_0_59_0)
slot_0_63_0:add(slot_0_60_0)

slot_0_64_0 = gui.label(gui.control_id("voterevealer_label"), "(% = px's)", draw.color(255, 255, 255))
slot_0_65_0 = gui.slider(gui.control_id("voterevealer_x_slider"), 0, 2560, {
        "%.0f%%"
})
slot_0_66_0 = gui.slider(gui.control_id("voterevealer_y_slider"), 0, 1440, {
        "%.0f%%"
})
slot_0_67_0 = gui.checkbox(gui.control_id("voterevealer_x_negative"))
slot_0_67_0.tooltip = "Use negative x value"
slot_0_68_0 = gui.checkbox(gui.control_id("voterevealer_y_negative"))
slot_0_68_0.tooltip = "Use negative y value"
slot_0_69_0 = gui.make_control("Vote Revealer Offset", slot_0_64_0)
slot_0_70_0 = gui.make_control("X", slot_0_65_0)
slot_0_71_0 = gui.make_control("Y", slot_0_66_0)

slot_0_70_0:add(slot_0_67_0)
slot_0_71_0:add(slot_0_68_0)

slot_0_72_0 = gui.label(gui.control_id("teamdamage_label"), "(% = px's)", draw.color(255, 255, 255))
slot_0_73_0 = gui.slider(gui.control_id("team_damage_x_slider"), 0, 2560, {
        "%.0f%%"
})
slot_0_74_0 = gui.slider(gui.control_id("team_damage_y_slider"), 0, 1440, {
        "%.0f%%"
})
slot_0_75_0 = gui.checkbox(gui.control_id("teamdamage_x_negative"))
slot_0_75_0.tooltip = "Use negative x value"
slot_0_76_0 = gui.checkbox(gui.control_id("teamdamage_y_negative"))
slot_0_76_0.tooltip = "Use negative y value"
slot_0_77_0 = gui.make_control("Team Damage Offset", slot_0_72_0)
slot_0_78_0 = gui.make_control("X", slot_0_73_0)
slot_0_79_0 = gui.make_control("Y", slot_0_74_0)

slot_0_78_0:add(slot_0_75_0)
slot_0_79_0:add(slot_0_76_0)

slot_0_80_0 = gui.label(gui.control_id("hitbar_label"), "(% = px's)", draw.color(255, 255, 255))
slot_0_81_0 = gui.slider(gui.control_id("hitbar_x_slider"), 0, 2560, {
        "%.0f%%"
})
slot_0_82_0 = gui.slider(gui.control_id("hitbar_y_slider"), 0, 1440, {
        "%.0f%%"
})
slot_0_83_0 = gui.checkbox(gui.control_id("hitbar_x_negative"))
slot_0_83_0.tooltip = "Use negative x value"
slot_0_84_0 = gui.checkbox(gui.control_id("hitbar_y_negative"))
slot_0_84_0.tooltip = "Use negative y value"
slot_0_85_0 = gui.make_control("Hit Bar Offset", slot_0_80_0)
slot_0_86_0 = gui.make_control("X", slot_0_81_0)
slot_0_87_0 = gui.make_control("Y", slot_0_82_0)

slot_0_86_0:add(slot_0_83_0)
slot_0_87_0:add(slot_0_84_0)

slot_0_88_0 = gui.label(gui.control_id("watermark_label"), "(% = px's)", draw.color(255, 255, 255))
slot_0_89_0 = gui.slider(gui.control_id("watermark_x_slider"), 0, 2560, {
        "%.0f%%"
})
slot_0_90_0 = gui.slider(gui.control_id("watermark_y_slider"), 0, 1440, {
        "%.0f%%"
})
slot_0_91_0 = gui.checkbox(gui.control_id("watermark_x_negative"))
slot_0_91_0.tooltip = "Use negative x value"
slot_0_92_0 = gui.checkbox(gui.control_id("watermark_y_negative"))
slot_0_92_0.tooltip = "Use negative y value"
slot_0_93_0 = gui.make_control("Watermark Offset", slot_0_88_0)
slot_0_94_0 = gui.make_control("X", slot_0_89_0)
slot_0_95_0 = gui.make_control("Y", slot_0_90_0)

slot_0_94_0:add(slot_0_91_0)
slot_0_95_0:add(slot_0_92_0)

slot_0_96_0 = gui.label(gui.control_id("spectatorlist_label"), "(% = px's)", draw.color(255, 255, 255))
slot_0_97_0 = gui.slider(gui.control_id("spectatorlist_x_slider"), 0, 2560, {
        "%.0f%%"
})
slot_0_98_0 = gui.slider(gui.control_id("spectatorlist_y_slider"), 0, 1440, {
        "%.0f%%"
})
slot_0_99_0 = gui.checkbox(gui.control_id("spectatorlist_x_negative"))
slot_0_99_0.tooltip = "Use negative x value"
slot_0_100_0 = gui.checkbox(gui.control_id("spectatorlist_y_negative"))
slot_0_100_0.tooltip = "Use negative y value"
slot_0_101_0 = gui.make_control("Spectator List Offset", slot_0_96_0)
slot_0_102_0 = gui.make_control("X", slot_0_97_0)
slot_0_103_0 = gui.make_control("Y", slot_0_98_0)

slot_0_102_0:add(slot_0_99_0)
slot_0_103_0:add(slot_0_100_0)

slot_0_104_0 = gui.ctx:find("lua>elements a")

slot_0_104_0:add(slot_0_53_0("anonychee's lua v2.0.2"))
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_53_0("Features"))
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_53_0("Visuals"))
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_4_0)
slot_0_104_0:add(slot_0_51_0)
slot_0_104_0:add(slot_0_14_0)
slot_0_104_0:add(slot_0_19_0)
slot_0_104_0:add(slot_0_47_0)
slot_0_104_0:add(slot_0_21_0)
slot_0_104_0:add(slot_0_25_0)
slot_0_104_0:add(slot_0_29_0)
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_53_0("Misc"))
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_38_0)
slot_0_104_0:add(slot_0_36_0)
slot_0_104_0:add(slot_0_45_0)
slot_0_104_0:add(slot_0_6_0)
slot_0_104_0:add(slot_0_16_0)
slot_0_104_0:add(slot_0_12_0)
slot_0_104_0:add(slot_0_49_0)
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_53_0("Chat"))
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_40_0)
slot_0_104_0:add(slot_0_27_0)
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_53_0("Controls"))
slot_0_104_0:add(slot_0_55_0())
slot_0_104_0:add(slot_0_33_0)
slot_0_104_0:reset()

slot_0_105_0 = gui.ctx:find("lua>elements b")

slot_0_105_0:add(slot_0_53_0("Position Offsets"))
slot_0_105_0:add(slot_0_55_0())
slot_0_105_0:add(slot_0_61_0)
slot_0_105_0:add(slot_0_62_0)
slot_0_105_0:add(slot_0_63_0)
slot_0_105_0:add(slot_0_55_0())
slot_0_105_0:add(slot_0_69_0)
slot_0_105_0:add(slot_0_70_0)
slot_0_105_0:add(slot_0_71_0)
slot_0_105_0:add(slot_0_55_0())
slot_0_105_0:add(slot_0_77_0)
slot_0_105_0:add(slot_0_78_0)
slot_0_105_0:add(slot_0_79_0)
slot_0_105_0:add(slot_0_55_0())
slot_0_105_0:add(slot_0_85_0)
slot_0_105_0:add(slot_0_86_0)
slot_0_105_0:add(slot_0_87_0)
slot_0_105_0:add(slot_0_55_0())
slot_0_105_0:add(slot_0_93_0)
slot_0_105_0:add(slot_0_94_0)
slot_0_105_0:add(slot_0_95_0)
slot_0_105_0:add(slot_0_55_0())
slot_0_105_0:add(slot_0_101_0)
slot_0_105_0:add(slot_0_102_0)
slot_0_105_0:add(slot_0_103_0)
slot_0_105_0:reset()

slot_0_106_0 = 16
slot_0_107_0 = 16
slot_0_108_0 = 45
slot_0_109_0 = 50
slot_0_110_0 = 0
slot_0_111_0 = nil
slot_0_112_0 = 0
slot_0_113_0 = 0
slot_0_114_0 = 0
slot_0_115_0 = 0
slot_0_116_0 = {}
slot_0_117_0 = {}
slot_0_118_0 = {}
slot_0_119_0 = {}
slot_0_120_0 = 1
slot_0_121_0 = {
        hit = {
                current = 0,
                new = 0,
                old = 0
        },
        miss = {
                current = 0,
                new = 0,
                old = 0
        },
        kills = {
                current = 0,
                new = 0,
                old = 0
        },
        killstreak = {
                current = 0,
                new = 0,
                old = 0
        },
        deaths = {
                current = 0,
                new = 0,
                old = 0
        },
        hs = {
                current = 0,
                new = 0,
                old = 0
        },
        ns = {
                current = 0,
                new = 0,
                old = 0
        },
        wb = {
                current = 0,
                new = 0,
                old = 0
        },
        totaldmg = {
                current = 0,
                new = 0,
                old = 0
        }
}
slot_0_122_0 = 0
slot_0_123_0 = nil
slot_0_124_0 = nil
slot_0_125_0 = nil
slot_0_126_0 = {}
slot_0_127_0 = {}
slot_0_128_0 = 0
slot_0_129_0 = 0.1
slot_0_130_0 = false
slot_0_131_0 = 0
slot_0_132_0 = {}
slot_0_133_0 = false
slot_0_134_0 = {}
slot_0_135_0 = 0
slot_0_136_0 = slot_0_113_0 + 100
slot_0_137_0 = 0
slot_0_138_0 = 0
slot_0_139_0 = 0
slot_0_140_0 = 0
slot_0_141_0 = 0
slot_0_142_0 = 0
slot_0_143_0 = 0
slot_0_144_0 = 0
slot_0_145_0 = slot_0_113_0 / 2
slot_0_146_0 = 150
slot_0_147_0 = 255
slot_0_148_0 = slot_0_113_0 / 2 - 100
slot_0_149_0 = 0
slot_0_150_0 = 0
slot_0_151_0 = false
slot_0_152_0 = 4000
slot_0_153_0 = {}
slot_0_154_0 = {
        "%s, AimTux owns me and all",
        "%s, Your Windows p2c sucks my AimTux dry",
        "%s, It's free as in FREEDOM!",
        "%s, Tux only let me out so I could play this game, please be nice!",
        "%s, Tux nutted but you keep sucken",
        "%s, >tfw no vac on Linux"
}
slot_0_155_0 = {
        "%s, AimTux owns me and all, especially with nospread",
        "%s, Your Windows p2c sucks my AimTux dry, with my superior foss nospread",
        "%s, Tux only let me out so I could play this game, please be nice! He also gave me nospread",
        "%s, Tux nutted but you keep sucken, even when his spread was none",
        "%s, >tfw no vac on Linux, but nospread is still a thing"
}
slot_0_156_0 = {
        "i'm sorry for that %s, i hope you have a good day",
        "i'm sorry %s, i didn't mean to do that",
        "well %s, this was pure luck from my side",
        "ahh %s, i'm sorry for that",
        "weird situation %s, i'm sorry, i didn't knew it would happen",
        "well, %s, i'm sorry for that",
        "oops, %s, i'm sure you will get me next time",
        "this is pretty awkward %s, you are a good player",
        "welp, %s... i'm sorry for that"
}
slot_0_157_0 = {
        "i'm sorry %s for using nospread, i hope you have a good day",
        "i'm sorry %s, i didn't mean to use nospread, but i had to",
        "well %s, i had to use nospread, otherwise you would get me",
        "ahh %s, i'm sorry for that, i had to use nospread",
        "weird situation %s, i'm sorry for using nospread",
        "well, %s, i'm sorry for abusing nospread",
        "oops, %s, i'm sure you will get me next time when i won't use nospread",
        "this is pretty awkward %s, i'm sorry for using nospread"
}
slot_0_158_0 = {
        "uwu %s, i'm sowwy for that",
        "i'm sowwy %s, i didn't mean to do that",
        "well %s, this was puwe wuck fwom my side",
        "ahh %s, i'm sowwy for that",
        "weird situation %s, i'm sowwy, i didn't knew it would happen",
        "well, %s, i'm sowwy for that",
        "oops, %s, i'm suwe you yiff me next time",
        "this is pwetty awkwawd %s, you awe a good pwayew",
        "wewp, %s... i'm sowwy fow that"
}
slot_0_159_0 = {
        "i'm sowwy %s fow using nospwead, i hope you have a good day",
        "i'm sowwy %s, i didn't mean to use nospwead, but i had to",
        "weww %s, i had to use nospwead, othewwise you wouwd get me",
        "ahh %s, i'm sowwy fow that, i had to use nospwead",
        "weiwed situation %s, i'm sowwy fow using nospwead",
        "weww, %s, i'm sowwy fow abusing nospwead",
        "oops, %s, i'm suwe you wiww get me next time when i won't use nospwead",
        "this is pwetty awkwawd %s, i'm sowwy fow using nospwead"
}
slot_0_160_0 = {
        nil,
        nil,
        "%s: Triple Kill !",
        "%s: Multi Kill !",
        nil,
        "%s: Ultra Kill !",
        nil,
        "%s: Killing Spree !",
        nil,
        "%s: Mega Kill !",
        nil,
        "%s: Holy Shit !",
        nil,
        "%s: Ludicrous Kill !",
        "%s: Rampage !",
        "%s: Unstoppable !",
        nil,
        "%s: M o n s t e R  K i L L ! ! !"
}
slot_0_161_0 = draw.font_gdi("Smallest Pixel-7", 13, 12, 0, 1279, 100)

slot_0_161_0:create()

slot_0_162_0 = draw.font_gdi("Smallest Pixel-7", 26, 12, 0, 1279, 100)

slot_0_162_0:create()
mods.events:add_listener("player_death")
mods.events:add_listener("round_freeze_end")
mods.events:add_listener("round_end")
mods.events:add_listener("cs_win_panel_match")
mods.events:add_listener("vote_cast")

function slot_0_163_0()
        if not game or not game.global_vars then
                return 0
        end

        local var_4_0 = game.global_vars.cur_time

        if not var_4_0 then
                return 0
        end

        return var_4_0
end

function slot_0_164_0(arg_5_0)
        local var_5_0 = gui.ctx:find(arg_5_0)

        return var_5_0 and var_5_0:get_value():get()
end

function slot_0_165_0(arg_6_0)
        table.insert(slot_0_118_0, {
                txt = arg_6_0,
                time = slot_0_110_0
        })
end

function slot_0_166_0(arg_7_0, arg_7_1)
        arg_7_0 = arg_7_0:gsub(";", ":")

        if arg_7_1 then
                slot_0_127_0[#slot_0_127_0 + 1] = "say_team " .. arg_7_0
        else
                slot_0_127_0[#slot_0_127_0 + 1] = "say " .. arg_7_0
        end
end

function slot_0_167_0(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
        if slot_0_111_0 == nil then
                return
        end

        slot_0_111_0:add_rect_filled(draw.rect(arg_8_0, arg_8_1, arg_8_0 + arg_8_2, arg_8_1 + arg_8_3), draw.color(0, 0, 0, arg_8_4))
        slot_0_111_0:add_line(draw.vec2(arg_8_0 - 1, arg_8_1), draw.vec2(arg_8_0 + arg_8_2, arg_8_1), draw.color(255, 255, 255, arg_8_4))
        slot_0_111_0:add_line(draw.vec2(arg_8_0 + arg_8_2, arg_8_1), draw.vec2(arg_8_0 + arg_8_2, arg_8_1 + arg_8_3), draw.color(255, 255, 255, arg_8_4))
        slot_0_111_0:add_line(draw.vec2(arg_8_0, arg_8_1), draw.vec2(arg_8_0, arg_8_1 + arg_8_3), draw.color(255, 255, 255, arg_8_4))
        slot_0_111_0:add_line(draw.vec2(arg_8_0, arg_8_1 + arg_8_3), draw.vec2(arg_8_0 + arg_8_2, arg_8_1 + arg_8_3), draw.color(255, 255, 255, arg_8_4))

        if arg_8_5 then
                local var_8_0 = 15

                for iter_8_0 = 1, arg_8_2 + 1, var_8_0 do
                        local var_8_1 = arg_8_0 + iter_8_0 - 1
                        local var_8_2 = math.min(arg_8_0 + iter_8_0 + var_8_0 - 1, arg_8_0 + arg_8_2)

                        slot_0_111_0:add_line(draw.vec2(var_8_1, arg_8_1 + arg_8_3), draw.vec2(var_8_2, arg_8_1 + arg_8_3), draw.color(255, 255, 255, arg_8_4):hsv((slot_0_110_0 + iter_8_0 * (90 / arg_8_2)) % 360, 1, 1))
                end
        else
                slot_0_111_0:add_line(draw.vec2(arg_8_0 - 1, arg_8_1 + arg_8_3), draw.vec2(arg_8_0 + arg_8_2, arg_8_1 + arg_8_3), draw.color(255, 255, 255, arg_8_4))
        end
end

function slot_0_168_0(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
        slot_0_111_0:add_text(draw.vec2(arg_9_0, arg_9_1), arg_9_2, arg_9_3, draw.text_params.with_h(draw.text_alignment.center))
end

function slot_0_169_0(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
        slot_0_111_0:add_text(draw.vec2(arg_10_0, arg_10_1), arg_10_2, arg_10_3, draw.text_params.with_h(draw.text_alignment.left))
end

function slot_0_170_0(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
        arg_11_3 = arg_11_3 + 24

        slot_0_111_0:add_rect_filled(draw.rect(arg_11_0, arg_11_1, arg_11_0 + arg_11_2, arg_11_1 + 24), draw.color(0, 0, 0, arg_11_4))
        slot_0_167_0(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, true)
        slot_0_111_0:add_line(draw.vec2(arg_11_0, arg_11_1 + 24), draw.vec2(arg_11_0 + arg_11_2, arg_11_1 + 24), draw.color(255, 255, 255, arg_11_4))
        slot_0_168_0(arg_11_0 + arg_11_2 / 2, arg_11_1 + 7, arg_11_5, draw.color(255, 255, 255, 255))
end

function slot_0_171_0()
        if #slot_0_127_0 > 0 and slot_0_110_0 - slot_0_128_0 > 64 then
                local var_12_0 = slot_0_127_0[1]

                game.engine:client_cmd(var_12_0)
                table.remove(slot_0_127_0, 1)

                slot_0_128_0 = slot_0_110_0
        end
end

function slot_0_172_0()
        if game.engine:in_game() and slot_0_130_0 and slot_0_131_0 + slot_0_129_0 > slot_0_163_0() then
                slot_0_121_0.miss.old = slot_0_121_0.miss.new
                slot_0_121_0.miss.new = slot_0_121_0.miss.new + 1

                slot_0_165_0("missed due to spread")

                slot_0_130_0 = false
        end
end

function slot_0_173_0()
        if slot_0_0_0:get_value():get() then
                local var_14_0 = slot_0_3_0:get_value():get()

                if not var_14_0 then
                        return
                end

                local var_14_1 = var_14_0:get_raw()
                local var_14_2 = "fatality.win"

                if var_14_1 == 2 then
                        var_14_2 = "aimjunkies.com"
                elseif var_14_1 == 4 then
                        var_14_2 = "aimware.net"
                elseif var_14_1 == 8 then
                        var_14_2 = "Syn's Ayyware"
                elseif var_14_1 == 16 then
                        var_14_2 = "ezfrags.co.uk"
                elseif var_14_1 == 32 then
                        var_14_2 = "xinstanthook 2.0"
                end

                if slot_0_1_0:get_value():get() then
                        var_14_2 = var_14_2 .. " | " .. gui.ctx.user.username
                end

                local var_14_3 = slot_0_111_0.font:get_text_size(var_14_2)
                local var_14_4 = var_14_3.x + slot_0_107_0
                local var_14_5 = var_14_3.y + slot_0_107_0
                local var_14_6 = math.lerp(slot_0_114_0, var_14_4, 0.1)
                local var_14_7 = math.lerp(slot_0_115_0, var_14_5, 0.1)

                slot_0_114_0 = var_14_6
                slot_0_115_0 = var_14_7

                local var_14_8 = slot_0_89_0:get_value():get() * (slot_0_91_0:get_value():get() and -1 or 1)
                local var_14_9 = slot_0_90_0:get_value():get() * (slot_0_92_0:get_value():get() and -1 or 1)

                slot_0_167_0(slot_0_112_0 - slot_0_106_0 - var_14_6 + var_14_8, slot_0_106_0 + var_14_9, var_14_6, var_14_7, 150, true)
                slot_0_168_0(slot_0_112_0 - slot_0_106_0 - var_14_6 / 2 + var_14_8, slot_0_106_0 + var_14_7 / 2 - var_14_3.y / 2 + var_14_9, var_14_2, draw.color(255, 255, 255, 255))
        end
end

function slot_0_174_0()
        if slot_0_0_0:get_value():get() then
                local var_15_0 = ""
                local var_15_1 = game.global_vars.frame_time or 0
                local var_15_2 = var_15_1 > 0 and 1 / var_15_1 or 0
                local var_15_3 = string.format("%03.0f", var_15_2) .. " fps"
                local var_15_4 = ""

                if game.engine:in_game() then
                        local var_15_5 = game.engine:get_netchan()

                        if var_15_5 and not var_15_5:is_null() then
                                slot_0_129_0 = var_15_5:get_latency() * 1000
                                var_15_4 = string.format("%03.0f", slot_0_129_0) .. "ms"
                        end
                end

                local var_15_6 = 64
                local var_15_7 = 64
                local var_15_8 = slot_0_89_0:get_value():get() * (slot_0_91_0:get_value():get() and -1 or 1)
                local var_15_9 = slot_0_90_0:get_value():get() * (slot_0_92_0:get_value():get() and -1 or 1)
                local var_15_10 = slot_0_112_0 - slot_0_106_0 - var_15_6 + var_15_8
                local var_15_11 = slot_0_106_0 + slot_0_115_0 + slot_0_107_0 / 2 + var_15_9

                slot_0_167_0(var_15_10, var_15_11, var_15_6, var_15_7, 150, true)
                slot_0_168_0(var_15_10 + var_15_6 / 2, var_15_11 + var_15_7 / 2 - 4 - 6, "fps", draw.color(255, 255, 255, 255))
                slot_0_168_0(var_15_10 + var_15_6 / 2, var_15_11 + var_15_7 / 2 - 4 + 6, var_15_3, draw.color(255, 255, 255, 255))

                if var_15_4 ~= "" then
                        local var_15_12 = var_15_10 - var_15_6 - slot_0_106_0

                        slot_0_167_0(var_15_12, var_15_11, var_15_6, var_15_7, 150, true)
                        slot_0_168_0(var_15_12 + var_15_6 / 2, var_15_11 + var_15_7 / 2 - 4 - 6, "ping", draw.color(255, 255, 255, 255))
                        slot_0_168_0(var_15_12 + var_15_6 / 2, var_15_11 + var_15_7 / 2 - 4 + 6, var_15_4, draw.color(255, 255, 255, 255))
                end
        end
end

function slot_0_175_0()
        if game.engine:in_game() and slot_0_5_0:get_value():get() then
                slot_16_0_1 = 0
                slot_16_1_1 = 0
                slot_16_2_1 = ""
                slot_16_3_1 = ""
                slot_16_4_0 = slot_0_65_0:get_value():get() * (slot_0_67_0:get_value():get() and -1 or 1)
                slot_16_5_0 = slot_0_66_0:get_value():get() * (slot_0_68_0:get_value():get() and -1 or 1)

                if slot_0_122_0 > 0 then
                        slot_16_6_0 = slot_0_124_0
                        slot_16_7_0 = slot_0_123_0

                        if not slot_16_6_0 or slot_16_6_0 == "" then
                                slot_16_6_0 = "server"
                        end

                        if not slot_16_7_0 or slot_16_7_0 == "" or not slot_16_6_0 or slot_16_6_0 == "" then
                                slot_16_7_0 = "nobody"
                        end

                        slot_16_2_0 = string.format("[%s] Vote started by %s (%ds left)", slot_0_125_0, slot_16_6_0, math.floor(slot_0_122_0 + slot_0_108_0 - slot_0_163_0()))
                        slot_16_3_0 = string.format("Vote target: %s", slot_16_7_0)
                        slot_16_8_0 = slot_0_111_0.font:get_text_size(slot_16_2_0)
                        slot_16_9_0 = slot_0_111_0.font:get_text_size(slot_16_3_0)
                        slot_16_1_0 = slot_16_8_0.y + slot_16_9_0.y + 24 + #slot_0_126_0 * 16
                        slot_16_10_0 = 0

                        for iter_16_0, iter_16_1 in ipairs(slot_0_126_0) do
                                slot_16_16_0 = iter_16_1.player_name .. " voted " .. iter_16_1.option
                                slot_16_17_0 = slot_0_111_0.font:get_text_size(slot_16_16_0)
                                slot_16_10_0 = math.max(slot_16_10_0, slot_16_17_0.x)
                        end

                        slot_16_0_0 = math.max(slot_16_8_0.x, slot_16_10_0) + 16
                        slot_16_11_0 = 16 + slot_16_4_0
                        slot_16_12_1 = 150

                        if slot_0_122_0 + slot_0_108_0 > slot_0_163_0() then
                                slot_16_11_0 = 16 + slot_16_4_0
                                slot_16_12_0 = 150
                        else
                                slot_16_11_0 = -400 + slot_16_4_0
                                slot_16_12_0 = 0
                        end

                        slot_16_13_0 = math.lerp(slot_0_141_0, slot_16_11_0, 0.035)
                        slot_16_14_0 = math.floor(math.lerp(slot_0_142_0, slot_16_12_0, 0.035))
                        slot_0_141_0 = slot_16_13_0
                        slot_0_142_0 = slot_16_14_0

                        slot_0_170_0(slot_16_13_0, slot_0_113_0 / 2 + slot_16_5_0, slot_16_0_0, slot_16_1_0, slot_16_14_0, "Vote Revealer")
                        slot_0_169_0(slot_16_13_0 + 8, slot_0_113_0 / 2 + 30 + slot_16_5_0, slot_16_2_0, draw.color(255, 255, 255, 255))
                        slot_0_169_0(slot_16_13_0 + 8, slot_0_113_0 / 2 + 30 + 16 + slot_16_5_0, slot_16_3_0, draw.color(255, 255, 255, 255))

                        slot_16_15_0 = 0

                        for iter_16_2, iter_16_3 in ipairs(slot_0_126_0) do
                                slot_16_21_0 = draw.color(255, 255, 255, 255)

                                if iter_16_3.option == "yes" then
                                        slot_16_21_0 = draw.color(0, 255, 0, 255)
                                elseif iter_16_3.option == "no" then
                                        slot_16_21_0 = draw.color(255, 0, 0, 255)
                                end

                                slot_0_169_0(slot_16_13_0 + 8, slot_0_113_0 / 2 + 30 + 32 + slot_16_15_0 + slot_16_5_0, iter_16_3.player_name .. " voted " .. iter_16_3.option, slot_16_21_0)

                                slot_16_15_0 = slot_16_15_0 + 16
                        end
                end
        end
end

function slot_0_176_0()
        local var_17_0 = 0

        if game.engine:in_game() then
                for iter_17_0, iter_17_1 in pairs(slot_0_116_0) do
                        if not iter_17_1.enemy then
                                var_17_0 = var_17_0 + 1
                        end
                end
        end

        local var_17_1 = slot_0_73_0:get_value():get() * (slot_0_75_0:get_value():get() and -1 or 1)
        local var_17_2 = slot_0_74_0:get_value():get() * (slot_0_76_0:get_value():get() and -1 or 1)

        if game.engine:in_game() and slot_0_11_0:get_value():get() and var_17_0 > 0 then
                local var_17_3 = slot_0_111_0.font:get_text_size("Team Damage").x
                local var_17_4 = 0

                for iter_17_2, iter_17_3 in pairs(slot_0_116_0) do
                        if not iter_17_3.enemy then
                                if not iter_17_3.teamdmg.current then
                                        iter_17_3.teamdmg.current = 0
                                end

                                local var_17_5 = slot_0_111_0.font:get_text_size(iter_17_2 .. ": " .. math.floor(iter_17_3.teamdmg.current)).x

                                var_17_3 = math.max(var_17_3, var_17_5)
                                var_17_4 = var_17_4 + 16
                        end
                end

                local var_17_6 = var_17_3 + 16
                local var_17_7 = math.lerp(slot_0_139_0, var_17_6, 0.035)
                local var_17_8 = math.lerp(slot_0_140_0, var_17_4 + 8, 0.035)

                slot_0_139_0 = var_17_7
                slot_0_140_0 = var_17_8

                slot_0_170_0(16 + var_17_1, slot_0_113_0 / 2 - 200 - var_17_8 - 16 + var_17_2, var_17_7, var_17_8, 150, "Team Damage")

                local var_17_9 = slot_0_113_0 / 2 - 200 - var_17_8 - 16 + 30 + var_17_2

                for iter_17_4, iter_17_5 in pairs(slot_0_116_0) do
                        if not iter_17_5.enemy then
                                slot_0_169_0(24 + var_17_1, var_17_9, iter_17_4 .. ": " .. math.floor(iter_17_5.teamdmg.current), draw.color(255, 255, 255, 255))

                                var_17_9 = var_17_9 + 16
                        end
                end
        end
end

function slot_0_177_0()
        if game.engine:in_game() and slot_0_13_0:get_value():get() then
                function slot_18_0_0(arg_19_0)
                        if arg_19_0 and arg_19_0.current and arg_19_0.new then
                                arg_19_0.current = math.lerp(arg_19_0.current, arg_19_0.new, 0.035)
                        end
                end

                slot_18_0_0(slot_0_121_0.hit)
                slot_18_0_0(slot_0_121_0.miss)
                slot_18_0_0(slot_0_121_0.kills)
                slot_18_0_0(slot_0_121_0.killstreak)
                slot_18_0_0(slot_0_121_0.deaths)
                slot_18_0_0(slot_0_121_0.hs)
                slot_18_0_0(slot_0_121_0.ns)
                slot_18_0_0(slot_0_121_0.wb)
                slot_18_0_0(slot_0_121_0.totaldmg)

                slot_18_1_0 = 0
                slot_18_2_0 = 0

                if slot_0_121_0.hit.current + slot_0_121_0.miss.current > 0 then
                        slot_18_1_0 = slot_0_121_0.hit.current / (slot_0_121_0.hit.current + slot_0_121_0.miss.current) * 100
                        slot_18_2_0 = slot_0_121_0.miss.current / (slot_0_121_0.hit.current + slot_0_121_0.miss.current) * 100
                end

                slot_18_3_0 = string.format("hit: %d (%.2f%%) | miss: %d (%.2f%%) | kills: %d | deaths: %d | killstreak: %d | hs: %d | airkills: %d | wallbangs: %d | totaldmg: %d", math.ceil(slot_0_121_0.hit.current), slot_18_1_0, math.ceil(slot_0_121_0.miss.current), slot_18_2_0, math.ceil(slot_0_121_0.kills.current), math.ceil(slot_0_121_0.deaths.current), math.ceil(slot_0_121_0.killstreak.current), math.ceil(slot_0_121_0.hs.current), math.ceil(slot_0_121_0.ns.current), math.ceil(slot_0_121_0.wb.current), math.ceil(slot_0_121_0.totaldmg.current))
                slot_18_4_0 = slot_0_111_0.font:get_text_size(slot_18_3_0)

                if not slot_18_4_0 then
                        return
                end

                slot_18_5_0 = slot_18_4_0.x + 16
                slot_18_6_0 = slot_18_4_0.y + 16
                slot_18_7_0 = math.lerp(slot_0_137_0, slot_18_5_0, 0.035)
                slot_18_8_0 = math.lerp(slot_0_138_0, slot_18_6_0, 0.035)
                slot_0_137_0 = slot_18_7_0
                slot_0_138_0 = slot_18_8_0
                slot_18_9_0 = slot_0_81_0:get_value():get() * (slot_0_83_0:get_value():get() and -1 or 1)
                slot_18_10_0 = slot_0_82_0:get_value():get() * (slot_0_84_0:get_value():get() and -1 or 1)
                slot_18_11_0 = slot_0_113_0 - 200 - slot_18_8_0 / 2 + slot_18_10_0
                slot_18_12_0 = math.lerp(slot_0_136_0, slot_18_11_0, 0.035)
                slot_0_136_0 = slot_18_12_0

                slot_0_167_0(slot_0_112_0 / 2 - slot_18_7_0 / 2 + slot_18_9_0, slot_18_12_0, slot_18_7_0, slot_18_8_0, 150, true)
                slot_0_168_0(slot_0_112_0 / 2 + slot_18_9_0, slot_18_12_0 + slot_18_8_0 / 2 - slot_18_4_0.y / 2, slot_18_3_0, draw.color(255, 255, 255, 255))
        end
end

function slot_0_178_0()
        if game.engine:in_game() then
                slot_0_117_0 = {}
                slot_20_0_1 = slot_0_111_0.font:get_text_size("name").x
                slot_20_1_0 = slot_0_57_0:get_value():get() * (slot_0_59_0:get_value():get() and -1 or 1)
                slot_20_2_0 = slot_0_58_0:get_value():get() * (slot_0_60_0:get_value():get() and -1 or 1)

                if not entities.controllers then
                        return
                end

                if entities and entities.controllers and entities.controllers.for_each then
                        entities.controllers:for_each(function(arg_21_0)
                                if arg_21_0 and arg_21_0.entity then
                                        local var_21_0 = arg_21_0.entity
                                        local var_21_1 = var_21_0:get_pawn()
                                        local var_21_2 = true

                                        if not var_21_1 then
                                                var_21_2 = false
                                        end

                                        if var_21_0.get_name and var_21_0:get_name() == "DemoRecorder" then
                                                return
                                        end

                                        local var_21_3 = var_21_0.get_name and var_21_0:get_name() or "unknown"

                                        slot_0_117_0[var_21_3] = {
                                                kills = {
                                                        current = 0,
                                                        new = 0,
                                                        old = 0
                                                },
                                                deaths = {
                                                        current = 0,
                                                        new = 0,
                                                        old = 0
                                                },
                                                hs = {
                                                        current = 0,
                                                        new = 0,
                                                        old = 0
                                                },
                                                nospread = {
                                                        current = 0,
                                                        new = 0,
                                                        old = 0
                                                },
                                                wallbangs = {
                                                        current = 0,
                                                        new = 0,
                                                        old = 0
                                                },
                                                killstreak = {
                                                        current = 0,
                                                        new = 0,
                                                        old = 0
                                                },
                                                teamdmg = {
                                                        current = 0,
                                                        new = 0,
                                                        old = 0
                                                },
                                                enemy = var_21_0.is_enemy and var_21_0:is_enemy() or false,
                                                active = var_21_2
                                        }
                                end
                        end)
                end

                for iter_20_0, iter_20_1 in pairs(slot_0_117_0) do
                        if not slot_0_116_0[iter_20_0] then
                                slot_0_116_0[iter_20_0] = {
                                        kills = {
                                                current = 0,
                                                new = 0,
                                                old = 0
                                        },
                                        deaths = {
                                                current = 0,
                                                new = 0,
                                                old = 0
                                        },
                                        hs = {
                                                current = 0,
                                                new = 0,
                                                old = 0
                                        },
                                        nospread = {
                                                current = 0,
                                                new = 0,
                                                old = 0
                                        },
                                        wallbangs = {
                                                current = 0,
                                                new = 0,
                                                old = 0
                                        },
                                        killstreak = {
                                                current = 0,
                                                new = 0,
                                                old = 0
                                        },
                                        teamdmg = {
                                                current = 0,
                                                new = 0,
                                                old = 0
                                        },
                                        enemy = iter_20_1.enemy,
                                        active = iter_20_1.active
                                }
                        else
                                slot_0_116_0[iter_20_0].enemy = iter_20_1.enemy
                                slot_0_116_0[iter_20_0].active = iter_20_1.active
                        end
                end

                slot_20_3_0 = 0

                for iter_20_2, iter_20_3 in pairs(slot_0_116_0) do
                        if iter_20_3 and iter_20_3.active then
                                slot_20_3_0 = slot_20_3_0 + 1
                                slot_20_9_1 = slot_0_111_0.font:get_text_size(iter_20_2).x
                                slot_20_0_1 = math.max(slot_20_0_1, slot_20_9_1)
                        end
                end

                for iter_20_4, iter_20_5 in pairs(slot_0_116_0) do
                        if slot_0_117_0[iter_20_4] then
                                iter_20_5.kills.current = math.lerp(iter_20_5.kills.current, iter_20_5.kills.new, 0.035)
                                iter_20_5.deaths.current = math.lerp(iter_20_5.deaths.current, iter_20_5.deaths.new, 0.035)
                                iter_20_5.hs.current = math.lerp(iter_20_5.hs.current, iter_20_5.hs.new, 0.035)
                                iter_20_5.nospread.current = math.lerp(iter_20_5.nospread.current, iter_20_5.nospread.new, 0.035)
                                iter_20_5.wallbangs.current = math.lerp(iter_20_5.wallbangs.current, iter_20_5.wallbangs.new, 0.035)
                                iter_20_5.killstreak.current = math.lerp(iter_20_5.killstreak.current, iter_20_5.killstreak.new, 0.035)
                                iter_20_5.teamdmg.current = math.lerp(iter_20_5.teamdmg.current, iter_20_5.teamdmg.new, 0.035)
                        else
                                iter_20_5.active = false
                        end
                end

                if slot_0_15_0:get_value():get() then
                        slot_20_4_0 = slot_0_111_0.font:get_text_size("kills").x
                        slot_20_5_0 = slot_0_111_0.font:get_text_size("deaths").x
                        slot_20_6_0 = slot_0_111_0.font:get_text_size("hs").x
                        slot_20_7_0 = slot_0_111_0.font:get_text_size("airkills").x
                        slot_20_8_0 = slot_0_111_0.font:get_text_size("wallbangs").x
                        slot_20_9_0 = slot_0_111_0.font:get_text_size("killstreak").x
                        slot_20_0_0 = slot_20_0_1 + 16
                        slot_20_10_0 = slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + slot_20_8_0 + slot_20_9_0 + 112
                        slot_20_11_0 = slot_20_3_0 * 16 + 32
                        slot_20_12_0 = slot_0_112_0 / 2 - slot_20_10_0 / 2 + slot_20_1_0
                        slot_20_13_0 = 100 + slot_20_2_0

                        slot_0_170_0(slot_20_12_0, slot_20_13_0, slot_20_10_0, slot_20_11_0, 150, "Player List")

                        slot_20_14_1 = slot_20_13_0 + 30

                        slot_0_168_0(slot_20_12_0 + slot_20_0_0 / 2 + 5, slot_20_14_1, "name", draw.color(255, 255, 255, 255))
                        slot_0_169_0(slot_20_12_0 + slot_20_0_0 + 16, slot_20_14_1, "kills", draw.color(255, 255, 255, 255))
                        slot_0_169_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + 32, slot_20_14_1, "deaths", draw.color(255, 255, 255, 255))
                        slot_0_169_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + 48, slot_20_14_1, "hs", draw.color(255, 255, 255, 255))
                        slot_0_169_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + 64, slot_20_14_1, "airkills", draw.color(255, 255, 255, 255))
                        slot_0_169_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + 80, slot_20_14_1, "wallbangs", draw.color(255, 255, 255, 255))
                        slot_0_169_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + slot_20_8_0 + 99, slot_20_14_1, "killstreak", draw.color(255, 255, 255, 255))
                        slot_0_111_0:add_line(draw.vec2(slot_20_12_0, slot_20_14_1 + 16), draw.vec2(slot_20_12_0 + slot_20_10_0, slot_20_14_1 + 16), draw.color(255, 255, 255, 255))
                        slot_0_111_0:add_line(draw.vec2(slot_20_12_0 + slot_20_0_0 + 8, slot_20_14_1 - 6), draw.vec2(slot_20_12_0 + slot_20_0_0 + 8, slot_20_14_1 + 25 + 16 * slot_20_3_0), draw.color(255, 255, 255, 255))
                        slot_0_111_0:add_line(draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + 24, slot_20_14_1 - 6), draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + 24, slot_20_14_1 + 25 + 16 * slot_20_3_0), draw.color(255, 255, 255, 255))
                        slot_0_111_0:add_line(draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + 40, slot_20_14_1 - 6), draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + 40, slot_20_14_1 + 25 + 16 * slot_20_3_0), draw.color(255, 255, 255, 255))
                        slot_0_111_0:add_line(draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + 56, slot_20_14_1 - 6), draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + 56, slot_20_14_1 + 25 + 16 * slot_20_3_0), draw.color(255, 255, 255, 255))
                        slot_0_111_0:add_line(draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + 72, slot_20_14_1 - 6), draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + 72, slot_20_14_1 + 25 + 16 * slot_20_3_0), draw.color(255, 255, 255, 255))
                        slot_0_111_0:add_line(draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + slot_20_8_0 + 88, slot_20_14_1 - 6), draw.vec2(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + slot_20_8_0 + 88, slot_20_14_1 + 25 + 16 * slot_20_3_0), draw.color(255, 255, 255, 255))

                        slot_20_14_0 = slot_20_14_1 + 24
                        slot_20_15_0 = entities.get_local_controller():get_name()
                        slot_20_16_0 = {}
                        slot_20_17_0 = {}
                        slot_20_18_0 = nil

                        for iter_20_6, iter_20_7 in pairs(slot_0_116_0) do
                                if iter_20_6 == slot_20_15_0 then
                                        slot_20_18_0 = {
                                                name = iter_20_6,
                                                data = iter_20_7
                                        }
                                elseif iter_20_7.enemy and iter_20_7.active then
                                        table.insert(slot_20_16_0, {
                                                name = iter_20_6,
                                                data = iter_20_7
                                        })
                                elseif iter_20_7.active then
                                        table.insert(slot_20_17_0, {
                                                name = iter_20_6,
                                                data = iter_20_7
                                        })
                                end
                        end

                        slot_20_19_0 = {}

                        if slot_20_18_0 then
                                table.insert(slot_20_19_0, slot_20_18_0)
                        end

                        for iter_20_8, iter_20_9 in ipairs(slot_20_16_0) do
                                table.insert(slot_20_19_0, iter_20_9)
                        end

                        for iter_20_10, iter_20_11 in ipairs(slot_20_17_0) do
                                table.insert(slot_20_19_0, iter_20_11)
                        end

                        for iter_20_12, iter_20_13 in ipairs(slot_20_19_0) do
                                slot_20_25_0 = iter_20_13.name
                                slot_20_26_0 = iter_20_13.data
                                slot_20_27_0 = draw.color(255, 255, 255, 255)

                                if slot_20_26_0.enemy then
                                        slot_20_27_0 = draw.color(255, 0, 0, 255)
                                elseif slot_20_25_0 == slot_20_15_0 then
                                        slot_20_27_0 = draw.color(0, 255, 0, 255)
                                end

                                slot_0_168_0(slot_20_12_0 + slot_20_0_0 / 2 + 4, slot_20_14_0, slot_20_25_0, slot_20_27_0)
                                slot_0_168_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 / 2 + 16, slot_20_14_0, math.ceil(slot_20_26_0.kills.current), draw.color(255, 255, 255, 255))
                                slot_0_168_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 / 2 + 32, slot_20_14_0, math.ceil(slot_20_26_0.deaths.current), draw.color(255, 255, 255, 255))
                                slot_0_168_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 / 2 + 48, slot_20_14_0, math.ceil(slot_20_26_0.hs.current), draw.color(255, 255, 255, 255))
                                slot_0_168_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 / 2 + 64, slot_20_14_0, math.ceil(slot_20_26_0.nospread.current), draw.color(255, 255, 255, 255))
                                slot_0_168_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + slot_20_8_0 / 2 + 80, slot_20_14_0, math.ceil(slot_20_26_0.wallbangs.current), draw.color(255, 255, 255, 255))
                                slot_0_168_0(slot_20_12_0 + slot_20_0_0 + slot_20_4_0 + slot_20_5_0 + slot_20_6_0 + slot_20_7_0 + slot_20_8_0 + slot_20_9_0 / 2 + 99, slot_20_14_0, math.ceil(slot_20_26_0.killstreak.current), draw.color(255, 255, 255, 255))

                                slot_20_14_0 = slot_20_14_0 + 16
                        end
                end
        end
end

function slot_0_179_0()
        if game.engine:in_game() and slot_0_18_0:get_value():get() and #slot_0_118_0 > 0 then
                for iter_22_0 = 1, #slot_0_118_0 do
                        local var_22_0 = #slot_0_118_0 - iter_22_0 + 1
                        local var_22_1 = slot_0_118_0[var_22_0]

                        if not var_22_1 then
                                break
                        end

                        local var_22_2 = var_22_1.txt

                        if not var_22_2 then
                                break
                        end

                        local var_22_3 = slot_0_111_0.font:get_text_size(var_22_2)

                        if not var_22_3 then
                                break
                        end

                        local var_22_4 = slot_0_113_0 - 300 + (iter_22_0 - 1) * 40

                        if not var_22_1.alpha then
                                var_22_1.alpha = 255
                        end

                        if not var_22_1.box_alpha then
                                var_22_1.box_alpha = 150
                        end

                        if not var_22_1.y then
                                var_22_1.y = slot_0_113_0 + 100 + (iter_22_0 - 1) * 40
                        end

                        if not var_22_1.time then
                                var_22_1.time = slot_0_110_0
                        end

                        var_22_1.y = math.lerp(var_22_1.y, var_22_4, 0.035)

                        if slot_0_110_0 - var_22_1.time > 150 then
                                var_22_1.alpha = math.lerp(var_22_1.alpha, 0, 0.035)
                                var_22_1.box_alpha = math.lerp(var_22_1.box_alpha, 0, 0.035)
                        end

                        if var_22_1.alpha <= 0.01 and var_22_1.box_alpha <= 0.01 then
                                table.remove(slot_0_118_0, var_22_0)
                        else
                                slot_0_167_0(slot_0_112_0 / 2 - var_22_3.x / 2 - 8, var_22_1.y - var_22_3.y / 2 - 8, var_22_3.x + 16, var_22_3.y + 16, math.floor(var_22_1.box_alpha), false)
                                slot_0_168_0(slot_0_112_0 / 2, var_22_1.y - 4, var_22_2, draw.color(255, 255, 255, math.floor(var_22_1.alpha)))
                        end
                end
        end
end

function slot_0_180_0()
        if not game.engine:in_game() or not slot_0_20_0:get_value():get() or not slot_0_164_0("rage>anti-aim>angles>anti-aim") then
                return
        end

        slot_23_0_0 = math.floor(50 + math.abs(math.sin(slot_0_110_0 / 100) * 100))
        slot_23_1_0 = draw.color(255, 255, 255, slot_23_0_0)
        slot_23_2_0 = slot_0_164_0("rage>anti-aim>angles>override left")
        slot_23_3_0 = slot_0_164_0("rage>anti-aim>angles>override right")
        slot_23_4_0 = slot_0_164_0("rage>anti-aim>angles>override back")
        slot_23_5_0 = slot_0_164_0("rage>anti-aim>angles>override forward")

        if slot_0_22_0:get_value():get() then
                slot_23_6_0 = 0

                if slot_23_2_0 then
                        slot_23_6_0 = slot_23_6_0 + 72
                end

                if slot_23_3_0 then
                        slot_23_6_0 = slot_23_6_0 + 144
                end

                if slot_23_4_0 then
                        slot_23_6_0 = slot_23_6_0 + 216
                end

                if slot_23_5_0 then
                        slot_23_6_0 = slot_23_6_0 + 288
                end

                slot_23_1_0 = slot_23_1_0:hsv((slot_0_110_0 + slot_23_6_0) % 360, 0.5, 1)
        end

        if slot_23_2_0 then
                slot_0_111_0:add_triangle_filled(draw.vec2(slot_0_112_0 / 2 - 20 - slot_0_109_0, slot_0_113_0 / 2), draw.vec2(slot_0_112_0 / 2 - slot_0_109_0, slot_0_113_0 / 2 - 20), draw.vec2(slot_0_112_0 / 2 - slot_0_109_0, slot_0_113_0 / 2 + 20), slot_23_1_0)
        end

        if slot_23_3_0 then
                slot_0_111_0:add_triangle_filled(draw.vec2(slot_0_112_0 / 2 + 20 + slot_0_109_0, slot_0_113_0 / 2), draw.vec2(slot_0_112_0 / 2 + slot_0_109_0, slot_0_113_0 / 2 - 20), draw.vec2(slot_0_112_0 / 2 + slot_0_109_0, slot_0_113_0 / 2 + 20), slot_23_1_0)
        end

        if slot_23_4_0 then
                slot_0_111_0:add_triangle_filled(draw.vec2(slot_0_112_0 / 2, slot_0_113_0 / 2 + 20 + slot_0_109_0), draw.vec2(slot_0_112_0 / 2 - 20, slot_0_113_0 / 2 + slot_0_109_0), draw.vec2(slot_0_112_0 / 2 + 20, slot_0_113_0 / 2 + slot_0_109_0), slot_23_1_0)
        end

        if slot_23_5_0 then
                slot_0_111_0:add_triangle_filled(draw.vec2(slot_0_112_0 / 2, slot_0_113_0 / 2 - 20 - slot_0_109_0), draw.vec2(slot_0_112_0 / 2 - 20, slot_0_113_0 / 2 - slot_0_109_0), draw.vec2(slot_0_112_0 / 2 + 20, slot_0_113_0 / 2 - slot_0_109_0), slot_23_1_0)
        end
end

function slot_0_181_0()
        if game.engine:in_game() and slot_0_28_0:get_value():get() then
                if not entities.get_local_pawn() or not entities.get_local_pawn():is_alive() then
                        return
                end

                slot_24_0_0 = entities.get_local_pawn():get_abs_origin()
                slot_0_119_0[#slot_0_119_0 + 1] = slot_24_0_0

                if #slot_0_119_0 > 100 then
                        table.remove(slot_0_119_0, 1)
                end

                slot_24_1_0 = slot_0_31_0:get_value():get()

                if not slot_24_1_0 then
                        return
                end

                slot_24_2_0 = slot_24_1_0:get_raw()

                if slot_24_2_0 == 2 then
                        for iter_24_0 = 1, #slot_0_119_0 do
                                slot_24_7_2 = math.world_to_screen(slot_0_119_0[iter_24_0])

                                if iter_24_0 > 1 then
                                        slot_0_111_0:add_line_multicolor(draw.vec2(slot_24_7_2.x, slot_24_7_2.y), draw.vec2(math.world_to_screen(slot_0_119_0[iter_24_0 - 1]).x, math.world_to_screen(slot_0_119_0[iter_24_0 - 1]).y), draw.color(255, 255, 255):hsv((slot_0_110_0 + iter_24_0 * (90 / #slot_0_119_0)) % 360, 1, 1), draw.color(255, 255, 255):hsv((slot_0_110_0 + (iter_24_0 + 1 * (90 / #slot_0_119_0))) % 360, 1, 1), 5)
                                end
                        end
                elseif slot_24_2_0 == 4 then
                        for iter_24_1 = 1, #slot_0_119_0 do
                                slot_24_7_1 = math.world_to_screen(slot_0_119_0[iter_24_1])
                                slot_24_8_1 = #slot_0_119_0 / 5

                                if iter_24_1 > 1 then
                                        if iter_24_1 > 1 and iter_24_1 <= slot_24_8_1 then
                                                slot_0_111_0:add_line(draw.vec2(slot_24_7_1.x, slot_24_7_1.y), draw.vec2(math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).x, math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).y), draw.color(85, 205, 252), 5)
                                        end

                                        if slot_24_8_1 < iter_24_1 and iter_24_1 <= slot_24_8_1 * 2 then
                                                slot_0_111_0:add_line(draw.vec2(slot_24_7_1.x, slot_24_7_1.y), draw.vec2(math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).x, math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).y), draw.color(247, 168, 184), 5)
                                        end

                                        if iter_24_1 > slot_24_8_1 * 2 and iter_24_1 <= slot_24_8_1 * 3 then
                                                slot_0_111_0:add_line(draw.vec2(slot_24_7_1.x, slot_24_7_1.y), draw.vec2(math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).x, math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).y), draw.color(255, 255, 255), 5)
                                        end

                                        if iter_24_1 > slot_24_8_1 * 3 and iter_24_1 <= slot_24_8_1 * 4 then
                                                slot_0_111_0:add_line(draw.vec2(slot_24_7_1.x, slot_24_7_1.y), draw.vec2(math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).x, math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).y), draw.color(247, 168, 184), 5)
                                        end

                                        if iter_24_1 > slot_24_8_1 * 4 and iter_24_1 < slot_24_8_1 * 5 then
                                                slot_0_111_0:add_line(draw.vec2(slot_24_7_1.x, slot_24_7_1.y), draw.vec2(math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).x, math.world_to_screen(slot_0_119_0[iter_24_1 - 1]).y), draw.color(85, 205, 252), 5)
                                        end
                                end
                        end
                else
                        slot_24_3_0 = draw.color(255, 255, 255)

                        if slot_24_2_0 == 1 then
                                slot_24_3_0 = draw.color(255, 255, 255)
                        elseif slot_24_2_0 == 8 then
                                slot_24_3_0 = draw.color(255, 0, 0)
                        elseif slot_24_2_0 == 16 then
                                slot_24_3_0 = draw.color(0, 255, 0)
                        elseif slot_24_2_0 == 32 then
                                slot_24_3_0 = draw.color(0, 0, 255)
                        elseif slot_24_2_0 == 64 then
                                slot_24_3_0 = draw.color(255, 255, 0)
                        elseif slot_24_2_0 == 128 then
                                slot_24_3_0 = draw.color(255, 0, 255)
                        elseif slot_24_2_0 == 256 then
                                slot_24_3_0 = draw.color(255, 165, 0)
                        elseif slot_24_2_0 == 512 then
                                slot_24_3_0 = draw.color(255, 192, 203)
                        end

                        for iter_24_2 = 1, #slot_0_119_0 do
                                slot_24_8_0 = math.world_to_screen(slot_0_119_0[iter_24_2])

                                if iter_24_2 > 1 then
                                        slot_0_111_0:add_line(draw.vec2(slot_24_8_0.x, slot_24_8_0.y), draw.vec2(math.world_to_screen(slot_0_119_0[iter_24_2 - 1]).x, math.world_to_screen(slot_0_119_0[iter_24_2 - 1]).y), slot_24_3_0, 5)
                                end
                        end
                end
        end
end

function slot_0_182_0()
        if game.engine:in_game() and slot_0_24_0:get_value():get() then
                slot_0_132_0 = {}

                if (slot_0_164_0("rage>anti-aim>angles>override left") or slot_0_164_0("rage>anti-aim>angles>override right") or slot_0_164_0("rage>anti-aim>angles>override back") or slot_0_164_0("rage>anti-aim>angles>override forward")) and slot_0_23_0:get_value():get() and slot_0_164_0("rage>anti-aim>angles>anti-aim") then
                        table.insert(slot_0_132_0, "manual override")
                end

                if slot_0_32_0:get_value():get() then
                        table.insert(slot_0_132_0, "min dmg override")
                end

                if slot_0_164_0("rage>aimbot>general>doubletap") then
                        table.insert(slot_0_132_0, "doubletap")
                end

                if slot_0_164_0("rage>aimbot>general>nospread") then
                        if slot_0_164_0("rage>aimbot>general>nospread>settings>force") then
                                table.insert(slot_0_132_0, "force nospread")
                        else
                                table.insert(slot_0_132_0, "nospread")
                        end
                end

                if slot_0_164_0("misc>aimbot>general>duck peek assist") then
                        table.insert(slot_0_132_0, "duck peek assist")
                end

                if slot_0_164_0("rage>anti-aim>angles>spin") then
                        table.insert(slot_0_132_0, "spinbot")
                end

                if slot_0_164_0("rage>aimbot>general>force bodyaim") then
                        table.insert(slot_0_132_0, "force bodyaim")
                end

                slot_25_0_0 = 2

                for iter_25_0, iter_25_1 in pairs(slot_0_132_0) do
                        slot_25_0_0 = slot_25_0_0 + slot_0_111_0.font:get_text_size(iter_25_1).y
                end

                for iter_25_2, iter_25_3 in pairs(slot_0_132_0) do
                        if not slot_0_134_0[iter_25_2] then
                                slot_0_134_0[iter_25_2] = slot_0_113_0 / 2 - slot_25_0_0 / 2 + 16 * (iter_25_2 - 1)
                        end

                        slot_25_6_0 = slot_0_113_0 / 2 - slot_25_0_0 / 2 + 16 * (iter_25_2 - 1)
                        slot_25_7_0 = 255
                        slot_25_8_0 = math.lerp(slot_0_134_0[iter_25_2], slot_25_6_0, 0.035)
                        slot_25_9_0 = math.lerp(slot_0_135_0, slot_25_7_0, 0.035)
                        slot_0_134_0[iter_25_2] = slot_25_8_0
                        slot_0_135_0 = slot_25_9_0

                        slot_0_111_0:add_text(draw.vec2(slot_0_112_0 / 2, slot_25_8_0 + 2), iter_25_3, draw.color(0, 0, 0, slot_25_9_0), draw.text_params.with_h(draw.text_alignment.center))
                        slot_0_111_0:add_text(draw.vec2(slot_0_112_0 / 2, slot_25_8_0), iter_25_3, draw.color(255, 255, 255, slot_25_9_0), draw.text_params.with_h(draw.text_alignment.center))
                end
        end
end

function slot_0_183_0()
        if game.engine:in_game() and entities.get_local_pawn() and entities.get_local_pawn():is_alive() then
                if slot_0_143_0 + slot_0_144_0 > slot_0_163_0() then
                        slot_0_145_0 = slot_0_113_0 / 2 + 100
                        slot_0_146_0 = 150
                        slot_0_147_0 = 255
                else
                        slot_0_145_0 = slot_0_113_0 / 2 + 200
                        slot_0_146_0 = 0
                        slot_0_147_0 = 0
                end

                slot_0_148_0 = math.lerp(slot_0_148_0, slot_0_145_0, 0.02)
                slot_0_149_0 = math.floor(math.lerp(slot_0_149_0, slot_0_146_0, 0.02))
                slot_0_150_0 = math.floor(math.lerp(slot_0_150_0, slot_0_147_0, 0.02))

                local var_26_0 = string.format("slowed (%.1f s)", math.max(0, slot_0_143_0 + slot_0_144_0 - slot_0_163_0()))
                local var_26_1 = slot_0_111_0.font:get_text_size(var_26_0)

                slot_0_167_0(slot_0_112_0 / 2 - var_26_1.x / 2 - 8, slot_0_148_0 - var_26_1.y / 2 - 8, var_26_1.x + 16, var_26_1.y + 16, slot_0_149_0, false)

                local var_26_2 = slot_0_143_0 + slot_0_144_0 - slot_0_163_0()
                local var_26_3 = slot_0_144_0 - var_26_2
                local var_26_4 = math.min(var_26_3 / slot_0_144_0, 1)
                local var_26_5 = math.ceil(var_26_1.x * var_26_4) or 0

                slot_0_111_0:add_rect_filled(draw.rect(slot_0_112_0 / 2 - var_26_1.x / 2 - 8, slot_0_148_0 - var_26_1.y / 2 - 8, slot_0_112_0 / 2 - var_26_1.x / 2 + var_26_5 + 8, slot_0_148_0 + var_26_1.y / 2 + 8), draw.color(120, 255, 120, slot_0_149_0))
                slot_0_168_0(slot_0_112_0 / 2, slot_0_148_0 - 5, var_26_0, draw.color(255, 255, 255, slot_0_150_0))
        end
end

function slot_0_184_0()
        if game.engine:in_game() and slot_0_48_0:get_value():get() and slot_0_151_0 then
                local var_27_0 = {}
                local var_27_1 = entities.get_local_controller()

                if not var_27_1 then
                        return
                end

                local var_27_2 = var_27_1:get_observer_target()

                if not entities.controllers then
                        return
                end

                entities.controllers:for_each(function(arg_28_0)
                        if not arg_28_0.entity then
                                return
                        end

                        local var_28_0 = arg_28_0.entity

                        if not var_28_0 or not var_28_0:get_pawn() or var_28_0:get_pawn():is_alive() then
                                return
                        end

                        local var_28_1 = var_28_0:get_name()

                        if not var_28_1 then
                                return
                        end

                        local var_28_2 = var_28_0:get_observer_target()

                        if not var_28_2 then
                                return
                        end

                        if var_27_2 and var_28_2 and var_27_2:get_name() == var_28_2:get_name() or var_28_2 and var_28_2:get_name() == var_27_1:get_name() then
                                if var_28_1 == var_27_1:get_name() then
                                        return
                                end

                                table.insert(var_27_0, var_28_1)
                        end
                end)

                local var_27_3 = 0
                local var_27_4 = 0
                local var_27_5 = 0

                if #var_27_0 > 0 then
                        for iter_27_0, iter_27_1 in pairs(var_27_0) do
                                local var_27_6 = slot_0_111_0.font:get_text_size(iter_27_1)

                                if var_27_6 then
                                        var_27_5 = math.max(var_27_5, var_27_6.x)
                                end
                        end
                end

                local var_27_7 = string.format("spectator list (%s)", #var_27_0)
                local var_27_8 = slot_0_111_0.font:get_text_size(var_27_7)

                if var_27_8 then
                        var_27_5 = math.max(var_27_5, var_27_8.x)
                end

                local var_27_9 = var_27_5 + 16
                local var_27_10 = 16 * #var_27_0 + 8
                local var_27_11 = slot_0_97_0:get_value():get() * (slot_0_99_0:get_value():get() and -1 or 1)
                local var_27_12 = slot_0_98_0:get_value():get() * (slot_0_100_0:get_value():get() and -1 or 1)
                local var_27_13 = slot_0_112_0 - var_27_9 - 16 + var_27_11

                if #var_27_0 == 0 then
                        var_27_13 = slot_0_112_0 + 200 + var_27_11
                end

                slot_0_152_0 = math.lerp(slot_0_152_0, var_27_13, 0.035)

                if slot_0_152_0 <= slot_0_112_0 + 100 + var_27_11 then
                        slot_0_170_0(slot_0_152_0, slot_0_113_0 / 2 - var_27_10 / 2 - 12 + var_27_12, var_27_9, var_27_10, 150, var_27_7)

                        local var_27_14 = 0

                        for iter_27_2, iter_27_3 in pairs(var_27_0) do
                                slot_0_169_0(slot_0_152_0 + 8, slot_0_113_0 / 2 - var_27_10 / 2 + 16 + 3 + var_27_14 + var_27_12, iter_27_3, draw.color(255, 255, 255, 255))

                                var_27_14 = var_27_14 + 16
                        end
                end
        end
end

function slot_0_185_0()
        if not game.engine:in_game() or not slot_0_50_0:get_value():get() then
                return
        end

        for iter_29_0, iter_29_1 in pairs(slot_0_153_0) do
                slot_29_5_0 = iter_29_1.eyepos.z - iter_29_1.pos.z < 47
                slot_29_7_0 = ({
                        {
                                0,
                                64,
                                48
                        },
                        {
                                0,
                                48,
                                40
                        },
                        {
                                0,
                                32,
                                24
                        },
                        {
                                16,
                                48,
                                40
                        },
                        {
                                -16,
                                48,
                                40
                        },
                        {
                                16,
                                0,
                                0
                        },
                        {
                                -16,
                                0,
                                0
                        }
                })[iter_29_1.hitgroup] or {
                        0,
                        0,
                        0
                }
                slot_29_8_0 = slot_29_7_0[1]
                slot_29_9_0 = slot_29_7_0[2]

                if slot_29_5_0 then
                        slot_29_9_0 = slot_29_7_0[3]
                end

                slot_29_10_0 = math.rad(iter_29_1.angles.y)
                slot_29_11_0 = math.cos(slot_29_10_0)
                slot_29_12_0 = math.sin(slot_29_10_0)
                slot_29_13_0 = nil
                slot_29_14_0 = nil

                if iter_29_1.hitgroup == 4 or iter_29_1.hitgroup == 5 then
                        slot_29_13_0 = slot_29_8_0 * slot_29_11_0
                        slot_29_14_0 = slot_29_8_0 * slot_29_12_0
                else
                        slot_29_13_0 = slot_29_8_0 * slot_29_11_0
                        slot_29_14_0 = slot_29_8_0 * slot_29_12_0
                end

                slot_29_15_0 = vector(iter_29_1.pos.x + slot_29_13_0, iter_29_1.pos.y + slot_29_14_0, iter_29_1.pos.z + slot_29_9_0)
                slot_29_16_0 = math.world_to_screen(slot_29_15_0)
                slot_29_17_0 = math.ceil(math.lerp(0, 255, iter_29_1.y_offset / 200))
                slot_29_18_0 = 8

                slot_0_111_0:add_line(draw.vec2(slot_29_16_0.x - slot_29_18_0, slot_29_16_0.y - slot_29_18_0), draw.vec2(slot_29_16_0.x + slot_29_18_0, slot_29_16_0.y + slot_29_18_0), draw.color(0, 0, 0, slot_29_17_0))
                slot_0_111_0:add_line(draw.vec2(slot_29_16_0.x + slot_29_18_0, slot_29_16_0.y - slot_29_18_0), draw.vec2(slot_29_16_0.x - slot_29_18_0, slot_29_16_0.y + slot_29_18_0), draw.color(0, 0, 0, slot_29_17_0))
                slot_0_111_0:add_line(draw.vec2(slot_29_16_0.x - slot_29_18_0, slot_29_16_0.y - slot_29_18_0), draw.vec2(slot_29_16_0.x + slot_29_18_0, slot_29_16_0.y + slot_29_18_0), draw.color(255, 255, 255, slot_29_17_0))
                slot_0_111_0:add_line(draw.vec2(slot_29_16_0.x + slot_29_18_0, slot_29_16_0.y - slot_29_18_0), draw.vec2(slot_29_16_0.x - slot_29_18_0, slot_29_16_0.y + slot_29_18_0), draw.color(255, 255, 255, slot_29_17_0))

                if slot_0_52_0:get_value():get() then
                        slot_0_111_0.font = slot_0_162_0

                        slot_0_168_0(slot_29_16_0.x, slot_29_16_0.y + iter_29_1.y_offset + 2, string.format("%d", math.ceil(iter_29_1.current)), draw.color(0, 0, 0, slot_29_17_0))
                        slot_0_168_0(slot_29_16_0.x, slot_29_16_0.y + iter_29_1.y_offset, string.format("%d", math.ceil(iter_29_1.current)), draw.color(255, 255, 255, slot_29_17_0))

                        slot_0_111_0.font = slot_0_161_0
                end

                iter_29_1.current = math.lerp(iter_29_1.old, iter_29_1.new, math.min(iter_29_1.y_offset / 200, 1))
                iter_29_1.y_offset = math.lerp(iter_29_1.y_offset, -200, 0.005)

                if iter_29_1.y_offset < -199 then
                        table.remove(slot_0_153_0, iter_29_0)
                end
        end
end

function slot_0_186_0(arg_30_0)
        slot_0_151_0 = false
        slot_0_144_0 = 0
        slot_0_143_0 = 0
        slot_0_122_0 = 0
        slot_0_124_0 = nil
        slot_0_123_0 = nil
        slot_0_125_0 = nil
        slot_0_126_0 = {}
        slot_0_116_0 = {}
        slot_0_117_0 = {}
        slot_0_118_0 = {}
        slot_0_121_0 = {
                hit = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                miss = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                kills = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                killstreak = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                deaths = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                hs = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                ns = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                wb = {
                        current = 0,
                        new = 0,
                        old = 0
                },
                totaldmg = {
                        current = 0,
                        new = 0,
                        old = 0
                }
        }
        slot_0_127_0 = {}
        slot_0_128_0 = 0
        slot_0_119_0 = {}
        slot_0_133_0 = false
        slot_0_129_0 = 0.1
end

function slot_0_187_0(arg_31_0)
        local var_31_0 = false
        local var_31_1 = false

        if slot_0_122_0 == 0 or slot_0_122_0 + slot_0_108_0 < slot_0_163_0() then
                var_31_0 = true
                var_31_1 = true
                slot_0_122_0 = slot_0_163_0()
                slot_0_126_0 = {}
                slot_0_124_0 = nil
                slot_0_123_0 = nil
        end

        if not slot_0_124_0 or slot_0_124_0 and slot_0_124_0 == "" then
                var_31_0 = true
        end

        if not slot_0_123_0 or slot_0_123_0 and slot_0_123_0 == "" then
                var_31_1 = true
        end

        local var_31_2 = arg_31_0:get_int("vote_option")
        local var_31_3 = arg_31_0:get_controller("userid")
        local var_31_4 = arg_31_0:get_int("team")

        if not var_31_3 then
                return
        end

        local var_31_5 = "unknown"

        if var_31_2 == 1 then
                var_31_5 = "no"
        elseif var_31_2 == 0 then
                var_31_5 = "yes"
        end

        local var_31_6 = "unknown"

        if var_31_4 == 2 then
                var_31_6 = "T"
        elseif var_31_4 == 3 then
                var_31_6 = "CT"
        end

        local var_31_7 = var_31_3:get_name()

        if var_31_0 and var_31_2 == 0 and #slot_0_126_0 < 2 then
                slot_0_124_0 = var_31_7
        end

        if var_31_1 and var_31_2 == 1 and #slot_0_126_0 == 0 then
                slot_0_123_0 = var_31_7
        end

        slot_0_125_0 = var_31_6

        if slot_0_7_0:get_value():get() then
                local var_31_8 = slot_0_8_0:get_value():get()

                if not var_31_8 then
                        return
                end

                local var_31_9 = var_31_8:get_raw()
                local var_31_10 = true

                if var_31_9 == 2 then
                        var_31_10 = false
                end

                if var_31_0 and var_31_2 == 0 and #slot_0_126_0 < 2 then
                        slot_0_166_0(string.format("[%s] %s has called a vote", var_31_6, var_31_7), var_31_10)
                end

                slot_0_166_0(string.format("[%s] %s has voted for %s", var_31_6, var_31_7, var_31_5), var_31_10)
        end

        local var_31_11 = 0

        for iter_31_0, iter_31_1 in pairs(slot_0_117_0) do
                if iter_31_1.enemy == slot_0_117_0[var_31_7].enemy and iter_31_1.active then
                        var_31_11 = var_31_11 + 1
                end
        end

        table.insert(slot_0_126_0, {
                player_name = var_31_7,
                option = var_31_5
        })

        if var_31_11 == #slot_0_126_0 then
                slot_0_122_0 = slot_0_163_0() - (slot_0_108_0 - 3)
        elseif var_31_11 < #slot_0_126_0 then
                slot_0_122_0 = slot_0_163_0() - (slot_0_108_0 - 1)
        end
end

function slot_0_188_0(arg_32_0)
        local var_32_0 = arg_32_0:get_controller("userid")
        local var_32_1 = arg_32_0:get_controller("attacker")
        local var_32_2 = arg_32_0:get_string("weapon")
        local var_32_3 = arg_32_0:get_int("dmg_health")
        local var_32_4 = arg_32_0:get_int("hitgroup")

        if slot_0_133_0 == false then
                return
        end

        if not var_32_0 or not var_32_1 or not var_32_2 then
                return
        end

        if var_32_1 == entities.get_local_controller() then
                local var_32_5 = "hit %s at %s for %d with %s"
                local var_32_6 = "unknown"

                if var_32_4 == 1 then
                        var_32_6 = "head"
                elseif var_32_4 == 2 then
                        var_32_6 = "chest"
                elseif var_32_4 == 3 then
                        var_32_6 = "stomach"
                elseif var_32_4 == 4 then
                        var_32_6 = "left arm"
                elseif var_32_4 == 5 then
                        var_32_6 = "right arm"
                elseif var_32_4 == 6 then
                        var_32_6 = "left leg"
                elseif var_32_4 == 7 then
                        var_32_6 = "right leg"
                end

                local var_32_7 = string.format(var_32_5, var_32_0:get_name(), var_32_6, var_32_3, var_32_2)

                slot_0_165_0(var_32_7)

                if slot_0_130_0 or var_32_2 == "knife" then
                        slot_0_130_0 = false
                        slot_0_131_0 = slot_0_163_0()

                        if var_32_2 ~= "inferno" then
                                slot_0_121_0.hit.old = slot_0_121_0.hit.new
                                slot_0_121_0.hit.new = slot_0_121_0.hit.new + 1
                        end
                end
        end

        if var_32_1:get_name() ~= var_32_0:get_name() and slot_0_116_0[var_32_1:get_name()] and not slot_0_116_0[var_32_1:get_name()].enemy and slot_0_116_0[var_32_0:get_name()] and not slot_0_116_0[var_32_0:get_name()].enemy then
                slot_0_116_0[var_32_1:get_name()].teamdmg.old = slot_0_116_0[var_32_1:get_name()].teamdmg.new
                slot_0_116_0[var_32_1:get_name()].teamdmg.new = slot_0_116_0[var_32_1:get_name()].teamdmg.new + math.min(var_32_3, 100)
        end

        if var_32_1 == entities.get_local_controller() then
                slot_0_121_0.totaldmg.old = slot_0_121_0.totaldmg.new
                slot_0_121_0.totaldmg.new = slot_0_121_0.totaldmg.new + math.min(var_32_3, 100)

                local var_32_8 = var_32_0:get_pawn()

                if not var_32_8 then
                        return
                end

                if slot_0_50_0:get_value():get() then
                        table.insert(slot_0_153_0, {
                                old = 0,
                                y_offset = 0,
                                current = 0,
                                pos = var_32_8:get_abs_origin(),
                                eyepos = var_32_8:get_eye_pos(),
                                angles = var_32_8:get_abs_angles(),
                                player_angles = entities.get_local_pawn():get_abs_angles(),
                                new = var_32_3,
                                hitgroup = var_32_4
                        })
                end
        end

        if var_32_0 == entities.get_local_controller() and var_32_2 ~= "inferno" then
                slot_0_143_0 = slot_0_163_0()
                slot_0_144_0 = math.min(2, var_32_3 / 50)
        end
end

function slot_0_189_0(arg_33_0)
        slot_33_1_0 = arg_33_0:get_controller("userid")
        slot_33_2_0 = arg_33_0:get_controller("attacker")

        if not slot_33_2_0 or not slot_33_1_0 then
                return
        end

        slot_33_3_0 = slot_33_2_0:get_name()
        slot_33_4_0 = slot_33_1_0:get_name()
        slot_33_5_1 = arg_33_0:get_bool("attackerinair")
        slot_33_6_1 = arg_33_0:get_bool("headshot")
        slot_33_7_1 = arg_33_0:get_int("penetrated")

        if slot_0_133_0 then
                slot_33_5_0 = slot_33_5_1 and 1 or 0
                slot_33_6_0 = slot_33_6_1 and 1 or 0
                slot_33_7_0 = slot_33_7_1 > 0 and 1 or 0

                if slot_33_1_0 == entities.get_local_controller() then
                        slot_0_119_0 = {}
                end

                if (slot_33_2_0:is_enemy() and slot_33_1_0:is_enemy() or not slot_33_2_0:is_enemy() and not slot_33_1_0:is_enemy()) and slot_33_3_0 ~= slot_33_4_0 and slot_33_2_0 ~= entities.get_local_controller() and slot_0_26_0:get_value():get() then
                        slot_0_166_0("ns", false)
                end

                if not slot_0_116_0[slot_33_3_0] then
                        slot_0_116_0[slot_33_3_0] = {
                                kills = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                deaths = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                hs = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                nospread = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                wallbangs = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                killstreak = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                teamdmg = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                enemy = slot_33_2_0:is_enemy()
                        }
                elseif slot_33_1_0 ~= slot_33_2_0 then
                        slot_0_116_0[slot_33_3_0].kills.old = slot_0_116_0[slot_33_3_0].kills.new
                        slot_0_116_0[slot_33_3_0].kills.new = slot_0_116_0[slot_33_3_0].kills.new + 1
                        slot_0_116_0[slot_33_3_0].hs.old = slot_0_116_0[slot_33_3_0].hs.new
                        slot_0_116_0[slot_33_3_0].hs.new = slot_0_116_0[slot_33_3_0].hs.new + slot_33_6_0
                        slot_0_116_0[slot_33_3_0].nospread.old = slot_0_116_0[slot_33_3_0].nospread.new
                        slot_0_116_0[slot_33_3_0].nospread.new = slot_0_116_0[slot_33_3_0].nospread.new + slot_33_5_0
                        slot_0_116_0[slot_33_3_0].wallbangs.old = slot_0_116_0[slot_33_3_0].wallbangs.new
                        slot_0_116_0[slot_33_3_0].wallbangs.new = slot_0_116_0[slot_33_3_0].wallbangs.new + slot_33_7_0
                        slot_0_116_0[slot_33_3_0].killstreak.old = slot_0_116_0[slot_33_3_0].killstreak.new
                        slot_0_116_0[slot_33_3_0].killstreak.new = slot_0_116_0[slot_33_3_0].killstreak.new + 1
                        slot_0_116_0[slot_33_3_0].enemy = slot_33_2_0:is_enemy()

                        if slot_0_43_0:get_value():get() and slot_0_160_0[slot_0_116_0[slot_33_3_0].killstreak.new] then
                                slot_0_166_0(string.format(slot_0_160_0[slot_0_116_0[slot_33_3_0].killstreak.new], slot_33_3_0), false)
                        end

                        if slot_33_2_0 == entities.get_local_controller() then
                                slot_0_121_0.kills.old = slot_0_121_0.kills.new
                                slot_0_121_0.kills.new = slot_0_121_0.kills.new + 1
                                slot_0_121_0.hs.old = slot_0_121_0.hs.new
                                slot_0_121_0.hs.new = slot_0_121_0.hs.new + slot_33_6_0
                                slot_0_121_0.ns.old = slot_0_121_0.ns.new
                                slot_0_121_0.ns.new = slot_0_121_0.ns.new + slot_33_5_0
                                slot_0_121_0.wb.old = slot_0_121_0.wb.new
                                slot_0_121_0.wb.new = slot_0_121_0.wb.new + slot_33_7_0
                                slot_0_121_0.killstreak.old = slot_0_121_0.killstreak.new
                                slot_0_121_0.killstreak.new = slot_0_121_0.killstreak.new + 1

                                if slot_0_39_0:get_value():get() then
                                        slot_33_8_0 = ""
                                        slot_33_9_0 = slot_0_42_0:get_value():get()

                                        if not slot_33_9_0 then
                                                return
                                        end

                                        slot_33_10_0 = slot_33_9_0:get_raw()

                                        if slot_33_10_0 == 1 then
                                                slot_33_8_0 = slot_0_156_0[math.random(1, #slot_0_156_0)]

                                                if slot_0_41_0:get_value():get() and (slot_0_164_0("rage>aimbot>general>nospread") or slot_0_164_0("rage>aimbot>general>nospread>settings>force")) then
                                                        slot_33_8_0 = slot_0_157_0[math.random(1, #slot_0_157_0)]
                                                end
                                        elseif slot_33_10_0 == 2 then
                                                slot_33_8_0 = slot_0_154_0[math.random(1, #slot_0_154_0)]

                                                if slot_0_41_0:get_value():get() and (slot_0_164_0("rage>aimbot>general>nospread") or slot_0_164_0("rage>aimbot>general>nospread>settings>force")) then
                                                        slot_33_8_0 = slot_0_155_0[math.random(1, #slot_0_155_0)]
                                                end
                                        elseif slot_33_10_0 == 4 then
                                                slot_33_8_0 = slot_0_158_0[math.random(1, #slot_0_158_0)]

                                                if slot_0_41_0:get_value():get() and (slot_0_164_0("rage>aimbot>general>nospread") or slot_0_164_0("rage>aimbot>general>nospread>settings>force")) then
                                                        slot_33_8_0 = slot_0_159_0[math.random(1, #slot_0_159_0)]
                                                end
                                        end

                                        slot_0_166_0(string.format(slot_33_8_0, slot_33_4_0), false)
                                end
                        end
                end

                if not slot_0_116_0[slot_33_4_0] then
                        slot_0_116_0[slot_33_4_0] = {
                                kills = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                deaths = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                hs = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                nospread = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                wallbangs = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                killstreak = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                teamdmg = {
                                        current = 0,
                                        new = 0,
                                        old = 0
                                },
                                enemy = slot_33_1_0:is_enemy()
                        }
                else
                        if slot_0_17_0:get_value():get() then
                                if slot_33_3_0 == slot_33_4_0 and slot_0_116_0[slot_33_4_0].killstreak.current >= 3 then
                                        slot_0_166_0(slot_33_4_0 .. " ended their " .. slot_0_116_0[slot_33_4_0].killstreak.new .. " kills killstreak", false)
                                elseif slot_33_3_0 ~= slot_33_4_0 and slot_0_116_0[slot_33_4_0].killstreak.current >= 3 then
                                        slot_0_166_0(slot_33_3_0 .. " ended " .. slot_33_4_0 .. "'s " .. slot_0_116_0[slot_33_4_0].killstreak.new .. " kills killstreak", false)
                                end
                        end

                        if slot_33_1_0 == entities.get_local_controller() then
                                slot_0_121_0.deaths.old = slot_0_121_0.deaths.new
                                slot_0_121_0.deaths.new = slot_0_121_0.deaths.new + 1
                                slot_0_121_0.killstreak.old = slot_0_121_0.killstreak.new
                                slot_0_121_0.killstreak.new = 0
                        end

                        slot_0_116_0[slot_33_4_0].deaths.old = slot_0_116_0[slot_33_4_0].deaths.new
                        slot_0_116_0[slot_33_4_0].deaths.new = slot_0_116_0[slot_33_4_0].deaths.new + 1
                        slot_0_116_0[slot_33_4_0].killstreak.old = slot_0_116_0[slot_33_4_0].killstreak.new
                        slot_0_116_0[slot_33_4_0].killstreak.new = 0
                        slot_0_116_0[slot_33_4_0].enemy = slot_33_1_0:is_enemy()
                end
        end
end

function slot_0_190_0(arg_34_0)
        local var_34_0 = arg_34_0:get_controller("userid")
        local var_34_1 = arg_34_0:get_string("weapon")
        local var_34_2 = {
                "weapon_flashbang",
                "weapon_hegrenade",
                "weapon_molotov",
                "weapon_smokegrenade",
                "weapon_incgrenade",
                "weapon_decoy",
                "weapon_knife",
                "weapon_taser"
        }

        for iter_34_0 = 1, #var_34_2 do
                if string.match(var_34_1, var_34_2[iter_34_0]) then
                        return
                end
        end

        if not var_34_0 or not var_34_1 then
                return
        end

        if var_34_0 == entities.get_local_controller() and slot_0_133_0 then
                if slot_0_130_0 == true then
                        slot_0_121_0.miss.old = slot_0_121_0.miss.new
                        slot_0_121_0.miss.new = slot_0_121_0.miss.new + 1

                        slot_0_165_0("missed due to spread")
                end

                slot_0_130_0 = true
                slot_0_131_0 = game.global_vars.frame_count or 0
        end
end

function slot_0_191_0(arg_35_0)
        if arg_35_0:get_name() == "round_start" then
                slot_0_119_0 = {}

                if slot_0_37_0:get_value():get() then
                        if slot_0_120_0 == 1 then
                                game.engine:client_cmd("+forward")
                                game.engine:client_cmd("+turnleft")
                                game.engine:client_cmd("-back")
                                game.engine:client_cmd("-turnright")

                                slot_0_120_0 = 2
                        else
                                game.engine:client_cmd("+back")
                                game.engine:client_cmd("+turnright")
                                game.engine:client_cmd("-forward")
                                game.engine:client_cmd("-turnleft")

                                slot_0_120_0 = 1
                        end
                else
                        game.engine:client_cmd("-forward")
                        game.engine:client_cmd("-turnleft")
                        game.engine:client_cmd("-back")
                        game.engine:client_cmd("-turnright")
                end
        end
end

function slot_0_192_0(arg_36_0)
        if slot_0_35_0:get_value():get() then
                game.engine:client_cmd("disconnect")
        end
end

function slot_0_193_0(arg_37_0)
        if slot_0_44_0:get_value():get() then
                if not entities.get_local_controller() then
                        return
                end

                local var_37_0 = entities.get_local_pawn()

                if not var_37_0 then
                        return
                end

                local var_37_1 = var_37_0:get_active_weapon()
                local var_37_2 = gui.ctx:find("misc>autobuy>enabled")

                if not var_37_1 then
                        return
                end

                local var_37_3 = var_37_1:get_data()

                if not var_37_3 then
                        return
                end

                local var_37_4 = var_37_3.name

                if var_37_4 == "weapon_awp" or var_37_4 == "weapon_scar20" or var_37_4 == "weapon_g3sg1" then
                        if var_37_2 then
                                var_37_2:set_value(false)
                        end
                elseif var_37_2 then
                        var_37_2:set_value(true)
                end

                gui.ctx:find("misc>autobuy"):reset()
        end
end

function slot_0_194_0(arg_38_0)
        slot_0_133_0 = true
        slot_0_151_0 = true

        if slot_0_110_0 < slot_0_128_0 then
                slot_0_128_0 = slot_0_110_0
        end
end

function slot_0_195_0(arg_39_0)
        if arg_39_0:get_name() == "game_newmap" then
                slot_0_186_0(arg_39_0)
        end

        if arg_39_0:get_name() == "vote_cast" then
                slot_0_187_0(arg_39_0)
        end

        if arg_39_0:get_name() == "player_hurt" then
                slot_0_188_0(arg_39_0)
        end

        if arg_39_0:get_name() == "player_death" then
                slot_0_189_0(arg_39_0)
        end

        if arg_39_0:get_name() == "weapon_fire" then
                slot_0_190_0(arg_39_0)
        end

        if arg_39_0:get_name() == "round_start" then
                slot_0_191_0(arg_39_0)
        end

        if arg_39_0:get_name() == "cs_win_panel_match" then
                slot_0_192_0(arg_39_0)
        end

        if arg_39_0:get_name() == "round_end" then
                slot_0_193_0(arg_39_0)
        end

        if arg_39_0:get_name() == "round_freeze_end" then
                slot_0_194_0(arg_39_0)
        end
end

function slot_0_196_0()
        slot_0_112_0, slot_0_113_0 = game.engine:get_screen_size()
        slot_0_111_0 = draw.surface
        slot_0_111_0.font = slot_0_161_0
        slot_0_110_0 = game.global_vars.frame_count or 0

        slot_0_171_0()
        slot_0_172_0()
        slot_0_173_0()
        slot_0_174_0()
        slot_0_175_0()
        slot_0_176_0()
        slot_0_177_0()
        slot_0_178_0()
        slot_0_179_0()
        slot_0_180_0()
        slot_0_181_0()
        slot_0_182_0()
        slot_0_183_0()
        slot_0_184_0()
        slot_0_185_0()
end

events.present_queue:add(slot_0_196_0)
events.event:add(slot_0_195_0)
