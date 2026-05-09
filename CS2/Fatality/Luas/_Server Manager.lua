--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = bit
slot_0_1_0 = gui.ctx:find("lua>elements a")
slot_0_2_0 = gui.ctx:find("lua>elements b")
slot_0_3_0 = gui.combo_box(gui.control_id("ct"))
slot_0_4_0 = gui.selectable(gui.control_id("DE"), "Germany")
slot_0_5_0 = gui.selectable(gui.control_id("RU"), "Russia")
slot_0_6_0 = gui.selectable(gui.control_id("CN"), "China")
slot_0_7_0 = gui.selectable(gui.control_id("US"), "US")
slot_0_8_0 = gui.selectable(gui.control_id("PL"), "Poland")
slot_0_9_0 = gui.selectable(gui.control_id("ES"), "Spain")
slot_0_10_0 = gui.selectable(gui.control_id("FI"), "Finland")
slot_0_11_0 = gui.selectable(gui.control_id("BR"), "Brazil")
slot_0_12_0 = gui.selectable(gui.control_id("TR"), "Turkey")
slot_0_13_0 = gui.selectable(gui.control_id("SG"), "Singapore")

slot_0_3_0:add(slot_0_4_0)
slot_0_3_0:add(slot_0_5_0)
slot_0_3_0:add(slot_0_6_0)
slot_0_3_0:add(slot_0_7_0)
slot_0_3_0:add(slot_0_8_0)
slot_0_3_0:add(slot_0_9_0)
slot_0_3_0:add(slot_0_10_0)
slot_0_3_0:add(slot_0_11_0)
slot_0_3_0:add(slot_0_12_0)
slot_0_3_0:add(slot_0_13_0)

slot_0_3_0.allow_multiple = true
slot_0_14_0 = gui.make_control("Country", slot_0_3_0)

slot_0_1_0:add(slot_0_14_0)

slot_0_15_0 = gui.combo_box(gui.control_id("ft"))
slot_0_16_0 = gui.selectable(gui.control_id("sd"), "Spread")
slot_0_17_0 = gui.selectable(gui.control_id("ns"), "No Spread")
slot_0_18_0 = gui.selectable(gui.control_id("dt"), "Double Tap")
slot_0_19_0 = gui.selectable(gui.control_id("so"), "Scout Only")

slot_0_15_0:add(slot_0_16_0)
slot_0_15_0:add(slot_0_17_0)
slot_0_15_0:add(slot_0_18_0)
slot_0_15_0:add(slot_0_19_0)

slot_0_15_0.allow_multiple = true
slot_0_20_0 = gui.make_control("Features", slot_0_15_0)

slot_0_1_0:add(slot_0_20_0)

function slot_0_21_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
        if not (slot_0_0_0.band(slot_0_0_0.rshift(arg_1_0, arg_1_2), 1) == 1) then
                return
        end

        local var_1_0 = slot_0_0_0.band(slot_0_0_0.rshift(arg_1_1, 0), 1) == 1
        local var_1_1 = slot_0_0_0.band(slot_0_0_0.rshift(arg_1_1, 1), 1) == 1
        local var_1_2 = slot_0_0_0.band(slot_0_0_0.rshift(arg_1_1, 2), 1) == 1
        local var_1_3 = slot_0_0_0.band(slot_0_0_0.rshift(arg_1_1, 3), 1) == 1
        local var_1_4 = {
                spread = var_1_0,
                nospread = var_1_1,
                dt = var_1_2,
                scoutonly = var_1_3
        }

        for iter_1_0, iter_1_1 in pairs(arg_1_3.features or {}) do
                if var_1_4[iter_1_0] then
                        for iter_1_2, iter_1_3 in ipairs(iter_1_1) do
                                iter_1_3:set_visible(true)
                        end
                end
        end
end

slot_0_22_0 = gui.button(gui.control_id("de_cs2hvh_sc"), "connect")
slot_0_23_0 = gui.button(gui.control_id("de_cs2hvh_sc_ns"), "connect")
slot_0_24_0 = gui.button(gui.control_id("de_cs2hvh_s"), "connect")
slot_0_25_0 = gui.button(gui.control_id("de_cs2hvh_s_dt"), "connect")
slot_0_26_0 = gui.button(gui.control_id("mcd_sc"), "connect")
slot_0_27_0 = gui.button(gui.control_id("mcd_sc_dt"), "connect")
slot_0_28_0 = gui.button(gui.control_id("mcd_s"), "connect")
slot_0_29_0 = gui.button(gui.control_id("mcd_s_dt"), "connect")
slot_0_30_0 = gui.make_control("CS2HVH | Scout", slot_0_22_0)
slot_0_31_0 = gui.make_control("CS2HVH | Scout NS", slot_0_23_0)
slot_0_32_0 = gui.make_control("CS2HVH | Mirage", slot_0_24_0)
slot_0_33_0 = gui.make_control("CS2HVH | Mirage DT", slot_0_25_0)
slot_0_34_0 = gui.make_control("McD HvH | Scout", slot_0_26_0)
slot_0_35_0 = gui.make_control("McD HvH | Scout DT", slot_0_27_0)
slot_0_36_0 = gui.make_control("McD HvH | Mirage", slot_0_28_0)
slot_0_37_0 = gui.make_control("McD HvH | Mirage DT", slot_0_29_0)

slot_0_2_0:add(slot_0_30_0)
slot_0_2_0:add(slot_0_31_0)
slot_0_2_0:add(slot_0_32_0)
slot_0_2_0:add(slot_0_33_0)
slot_0_2_0:add(slot_0_34_0)
slot_0_2_0:add(slot_0_35_0)
slot_0_2_0:add(slot_0_36_0)
slot_0_2_0:add(slot_0_37_0)
slot_0_22_0:add_callback(function()
        game.engine:client_cmd("connect 82.23.183.95:27015")
end)
slot_0_23_0:add_callback(function()
        game.engine:client_cmd("connect 82.23.183.114:27016")
end)
slot_0_24_0:add_callback(function()
        game.engine:client_cmd("connect 82.23.183.114:27020")
end)
slot_0_25_0:add_callback(function()
        game.engine:client_cmd("connect 82.23.183.114:27025")
end)
slot_0_26_0:add_callback(function()
        game.engine:client_cmd("connect 62.192.153.60:27019")
end)
slot_0_27_0:add_callback(function()
        game.engine:client_cmd("connect 62.192.153.60:27019")
end)
slot_0_28_0:add_callback(function()
        game.engine:client_cmd("connect 62.192.153.60:27019")
end)
slot_0_29_0:add_callback(function()
        game.engine:client_cmd("connect 62.192.153.60:27019")
end)

slot_0_38_0 = gui.button(gui.control_id("ex_hvh_sc"), "connect")
slot_0_39_0 = gui.button(gui.control_id("ex_hvh_ns"), "connect")
slot_0_40_0 = gui.button(gui.control_id("ex_hvh_msk"), "connect")
slot_0_41_0 = gui.button(gui.control_id("ex_hvh_nsk"), "connect")
slot_0_42_0 = gui.button(gui.control_id("dk_pjct"), "connect")
slot_0_43_0 = gui.button(gui.control_id("nix_dm"), "connect")
slot_0_44_0 = gui.button(gui.control_id("anomaly"), "connect")
slot_0_45_0 = gui.button(gui.control_id("ekb_hvh"), "connect")
slot_0_46_0 = gui.button(gui.control_id("hvh_club"), "connect")
slot_0_47_0 = gui.button(gui.control_id("re_hvh_s"), "connect")
slot_0_48_0 = gui.button(gui.control_id("re_hvh_s_dt"), "connect")
slot_0_49_0 = gui.button(gui.control_id("re_hvh_ns"), "connect")
slot_0_50_0 = gui.button(gui.control_id("re_hvh_ns_dt"), "connect")
slot_0_51_0 = gui.make_control("EX HVH | SCOUT ONLY", slot_0_38_0)
slot_0_52_0 = gui.make_control("EX HVH | RAPID", slot_0_39_0)
slot_0_53_0 = gui.make_control("EX HvH | MSK", slot_0_40_0)
slot_0_54_0 = gui.make_control("EX HvH | NSK", slot_0_41_0)
slot_0_55_0 = gui.make_control("DarkProject", slot_0_42_0)
slot_0_56_0 = gui.make_control("NIXWARE DM", slot_0_43_0)
slot_0_57_0 = gui.make_control("Anomaly HvH", slot_0_44_0)
slot_0_58_0 = gui.make_control("HvH Club", slot_0_46_0)
slot_0_59_0 = gui.make_control("HvH EKB | FPS", slot_0_45_0)
slot_0_60_0 = gui.make_control("REHVH | Spread", slot_0_47_0)
slot_0_61_0 = gui.make_control("REHVH | Spread DT", slot_0_48_0)
slot_0_62_0 = gui.make_control("REHVH | No Spread", slot_0_49_0)
slot_0_63_0 = gui.make_control("REHVH | No Spread DT", slot_0_50_0)

slot_0_2_0:add(slot_0_51_0)
slot_0_2_0:add(slot_0_52_0)
slot_0_2_0:add(slot_0_53_0)
slot_0_2_0:add(slot_0_54_0)
slot_0_2_0:add(slot_0_55_0)
slot_0_2_0:add(slot_0_56_0)
slot_0_2_0:add(slot_0_57_0)
slot_0_2_0:add(slot_0_59_0)
slot_0_2_0:add(slot_0_58_0)
slot_0_2_0:add(slot_0_60_0)
slot_0_2_0:add(slot_0_61_0)
slot_0_2_0:add(slot_0_62_0)
slot_0_2_0:add(slot_0_63_0)
slot_0_38_0:add_callback(function()
        game.engine:client_cmd("connect 37.48.252.6:27315")
end)
slot_0_39_0:add_callback(function()
        game.engine:client_cmd("connect 85.119.149.28:27215")
end)
slot_0_40_0:add_callback(function()
        game.engine:client_cmd("connect 95.213.255.200:27415")
end)
slot_0_41_0:add_callback(function()
        game.engine:client_cmd("connect 178.250.186.16:27015")
end)
slot_0_42_0:add_callback(function()
        game.engine:client_cmd("connect 62.122.213.101:1337")
end)
slot_0_43_0:add_callback(function()
        game.engine:client_cmd("connect 46.174.54.169:27015")
end)
slot_0_44_0:add_callback(function()
        game.engine:client_cmd("connect 62.122.215.57:27015")
end)
slot_0_45_0:add_callback(function()
        game.engine:client_cmd("connect 109.200.117.181:27015")
end)
slot_0_46_0:add_callback(function()
        game.engine:client_cmd("connect 37.230.228.237:27015")
end)
slot_0_47_0:add_callback(function()
        game.engine:client_cmd("connect 45.93.200.154:27016")
end)
slot_0_48_0:add_callback(function()
        game.engine:client_cmd("connect 45.93.200.154:27020")
end)
slot_0_49_0:add_callback(function()
        game.engine:client_cmd("connect 45.93.200.154:27015")
end)
slot_0_50_0:add_callback(function()
        game.engine:client_cmd("connect 45.93.200.154:27018")
end)

slot_0_64_0 = gui.button(gui.control_id("flux_s1"), "connect")
slot_0_65_0 = gui.button(gui.control_id("flux_s2"), "connect")
slot_0_66_0 = gui.button(gui.control_id("flux_s3"), "connect")
slot_0_67_0 = gui.button(gui.control_id("flux_sc_ns1"), "connect")
slot_0_68_0 = gui.button(gui.control_id("flux_sc1"), "connect")
slot_0_69_0 = gui.button(gui.control_id("flux_sc2"), "connect")
slot_0_70_0 = gui.button(gui.control_id("flux_s_chs"), "connect")
slot_0_71_0 = gui.button(gui.control_id("flux_ns2"), "connect")
slot_0_72_0 = gui.button(gui.control_id("flux_dm1"), "connect")
slot_0_73_0 = gui.button(gui.control_id("flux_dm2"), "connect")
slot_0_74_0 = gui.button(gui.control_id("flux_ns3"), "connect")
slot_0_75_0 = gui.button(gui.control_id("flux_s4"), "connect")
slot_0_76_0 = gui.button(gui.control_id("flux_s5"), "connect")
slot_0_77_0 = gui.make_control("FLUX | Match Battle 1", slot_0_64_0)
slot_0_78_0 = gui.make_control("FLUX | Match Battle 2", slot_0_65_0)
slot_0_79_0 = gui.make_control("FLUX | Pure Server 1", slot_0_66_0)
slot_0_80_0 = gui.make_control("FLUX | Dry Run 1", slot_0_67_0)
slot_0_81_0 = gui.make_control("FLUX | Scout  2", slot_0_68_0)
slot_0_82_0 = gui.make_control("FLUX | Scout  1", slot_0_69_0)
slot_0_83_0 = gui.make_control("FLUX | Scout HS ", slot_0_70_0)
slot_0_84_0 = gui.make_control("FLUX | Dry Run 2", slot_0_71_0)
slot_0_85_0 = gui.make_control("FLUX | DM 2", slot_0_72_0)
slot_0_86_0 = gui.make_control("FLUX | DMh 1", slot_0_73_0)
slot_0_87_0 = gui.make_control("FLUX | Flash Server", slot_0_74_0)
slot_0_88_0 = gui.make_control("FLUX | Battle 2", slot_0_75_0)
slot_0_89_0 = gui.make_control("FLUX | Battle 1", slot_0_76_0)

slot_0_2_0:add(slot_0_77_0)
slot_0_2_0:add(slot_0_78_0)
slot_0_2_0:add(slot_0_79_0)
slot_0_2_0:add(slot_0_80_0)
slot_0_2_0:add(slot_0_81_0)
slot_0_2_0:add(slot_0_82_0)
slot_0_2_0:add(slot_0_83_0)
slot_0_2_0:add(slot_0_84_0)
slot_0_2_0:add(slot_0_85_0)
slot_0_2_0:add(slot_0_86_0)
slot_0_2_0:add(slot_0_87_0)
slot_0_2_0:add(slot_0_88_0)
slot_0_2_0:add(slot_0_89_0)
slot_0_64_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27016")
end)
slot_0_65_0:add_callback(function()
        game.engine:client_cmd("connect 43.241.18.158:27016")
end)
slot_0_66_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27035")
end)
slot_0_67_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27015")
end)
slot_0_68_0:add_callback(function()
        game.engine:client_cmd("connect 43.241.18.158:27017")
end)
slot_0_69_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27020")
end)
slot_0_70_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27018")
end)
slot_0_71_0:add_callback(function()
        game.engine:client_cmd("connect 43.241.18.158:27015")
end)
slot_0_72_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27010")
end)
slot_0_73_0:add_callback(function()
        game.engine:client_cmd("connect 43.241.18.158:27018")
end)
slot_0_74_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27050")
end)
slot_0_75_0:add_callback(function()
        game.engine:client_cmd("connect 43.241.18.158:27019")
end)
slot_0_76_0:add_callback(function()
        game.engine:client_cmd("connect 202.189.15.28:27033")
end)

slot_0_90_0 = gui.button(gui.control_id("na_cs2hvh_sc"), "connect")
slot_0_91_0 = gui.button(gui.control_id("na_cs2hvh_s_dt"), "connect")
slot_0_92_0 = gui.button(gui.control_id("na_cs2hvh_ns"), "connect")
slot_0_93_0 = gui.make_control("CS2HvH | Scout", slot_0_90_0)
slot_0_94_0 = gui.make_control("CS2HvH | Mirage DT", slot_0_91_0)
slot_0_95_0 = gui.make_control("CS2HvH | No Spread", slot_0_92_0)

slot_0_2_0:add(slot_0_93_0)
slot_0_2_0:add(slot_0_94_0)
slot_0_2_0:add(slot_0_95_0)
slot_0_90_0:add_callback(function()
        game.engine:client_cmd("connect 151.243.93.162:27015")
end)
slot_0_91_0:add_callback(function()
        game.engine:client_cmd("connect 151.243.93.162:27016")
end)
slot_0_92_0:add_callback(function()
        game.engine:client_cmd("connect 151.243.93.162:27017")
end)

slot_0_96_0 = gui.button(gui.control_id("pl_cs2hvh_s_dt"), "connect")
slot_0_97_0 = gui.make_control("CS2HVH | DT", slot_0_96_0)

slot_0_2_0:add(slot_0_97_0)
slot_0_96_0:add_callback(function()
        game.engine:client_cmd("connect 146.59.81.217:30002")
end)

slot_0_98_0 = gui.button(gui.control_id("zonahvh_s"), "connect")
slot_0_99_0 = gui.make_control("ZonaHVH | Spread", slot_0_98_0)

slot_0_2_0:add(slot_0_99_0)
slot_0_98_0:add_callback(function()
        game.engine:client_cmd("connect 37.19.215.246:25564")
end)

slot_0_100_0 = gui.button(gui.control_id("fin_nl_ns"), "connect")
slot_0_101_0 = gui.make_control("NL | Mirage Only", slot_0_100_0)

slot_0_2_0:add(slot_0_101_0)
slot_0_100_0:add_callback(function()
        game.engine:client_cmd("connect 135.181.205.27:27015")
end)

slot_0_102_0 = gui.button(gui.control_id("br_cs2hvh_sc"), "connect")
slot_0_103_0 = gui.button(gui.control_id("hyperhvh_sc"), "connect")
slot_0_104_0 = gui.button(gui.control_id("cyberhvh_sc"), "connect")
slot_0_105_0 = gui.button(gui.control_id("avalonhvh_s"), "connect")
slot_0_106_0 = gui.make_control("CS2HVH | Scout", slot_0_102_0)
slot_0_107_0 = gui.make_control("Hyper HvH | Scout", slot_0_103_0)
slot_0_108_0 = gui.make_control("Cyber HvH | Scout", slot_0_104_0)
slot_0_109_0 = gui.make_control("AVALON HvH | Spread", slot_0_105_0)

slot_0_2_0:add(slot_0_106_0)
slot_0_2_0:add(slot_0_107_0)
slot_0_2_0:add(slot_0_108_0)
slot_0_2_0:add(slot_0_109_0)
slot_0_102_0:add_callback(function()
        game.engine:client_cmd("connect connect 80.75.221.5:28006")
end)
slot_0_103_0:add_callback(function()
        game.engine:client_cmd("connect connect 45.149.153.39:2020")
end)
slot_0_104_0:add_callback(function()
        game.engine:client_cmd("connect connect 131.196.196.197:27110")
end)
slot_0_105_0:add_callback(function()
        game.engine:client_cmd("connect connect 18.229.78.179:27015")
end)

slot_0_110_0 = gui.button(gui.control_id("skntlhvh_sc"), "connect")
slot_0_111_0 = gui.button(gui.control_id("hvhcat_sc"), "connect")
slot_0_112_0 = gui.button(gui.control_id("matrixhvh_s"), "connect")
slot_0_113_0 = gui.make_control("SIKINTILI HvH | Scout", slot_0_110_0)
slot_0_114_0 = gui.make_control("HvH.CAT | Scout", slot_0_111_0)
slot_0_115_0 = gui.make_control("Matrix HVH | Spread", slot_0_112_0)

slot_0_2_0:add(slot_0_113_0)
slot_0_2_0:add(slot_0_114_0)
slot_0_2_0:add(slot_0_115_0)
slot_0_110_0:add_callback(function()
        game.engine:client_cmd("connect 185.193.165.53:27015")
end)
slot_0_111_0:add_callback(function()
        game.engine:client_cmd("cconnect 46.203.182.220:28000")
end)
slot_0_112_0:add_callback(function()
        game.engine:client_cmd("connect 95.173.175.93:27015")
end)

slot_0_116_0 = gui.button(gui.control_id("mtclubsc_s_dt"), "connect")
slot_0_117_0 = gui.button(gui.control_id("mtclubsc_sc"), "connect")
slot_0_118_0 = gui.make_control("MATCHCLUB | DT", slot_0_116_0)
slot_0_119_0 = gui.make_control("MATCHCLUB | Scout", slot_0_117_0)

slot_0_2_0:add(slot_0_119_0)
slot_0_2_0:add(slot_0_118_0)
slot_0_116_0:add_callback(function()
        game.engine:client_cmd("connect 139.99.124.57:27015")
end)
slot_0_117_0:add_callback(function()
        game.engine:client_cmd("connect 139.99.124.57:27016")
end)

slot_0_120_0 = {
        slot_0_30_0,
        slot_0_31_0,
        slot_0_32_0,
        slot_0_33_0,
        slot_0_34_0,
        slot_0_35_0,
        slot_0_36_0,
        slot_0_37_0,
        slot_0_51_0,
        slot_0_52_0,
        slot_0_53_0,
        slot_0_54_0,
        slot_0_55_0,
        slot_0_56_0,
        slot_0_57_0,
        slot_0_59_0,
        slot_0_58_0,
        slot_0_60_0,
        slot_0_61_0,
        slot_0_62_0,
        slot_0_63_0,
        slot_0_77_0,
        slot_0_78_0,
        slot_0_79_0,
        slot_0_80_0,
        slot_0_81_0,
        slot_0_82_0,
        slot_0_83_0,
        slot_0_84_0,
        slot_0_85_0,
        slot_0_86_0,
        slot_0_87_0,
        slot_0_88_0,
        slot_0_89_0,
        slot_0_93_0,
        slot_0_94_0,
        slot_0_95_0,
        slot_0_97_0,
        slot_0_99_0,
        slot_0_101_0,
        slot_0_106_0,
        slot_0_107_0,
        slot_0_108_0,
        slot_0_109_0,
        slot_0_113_0,
        slot_0_114_0,
        slot_0_119_0,
        slot_0_118_0,
        slot_0_115_0
}

for iter_0_0, iter_0_1 in pairs(slot_0_120_0) do
        iter_0_1:set_visible(false)
end

slot_0_121_0 = nil
slot_0_122_0 = nil

events.present_queue:add(function()
        slot_51_0_0 = slot_0_3_0:get_value():get()
        slot_51_1_0 = slot_0_15_0:get_value():get()
        slot_51_2_0 = slot_51_0_0:get_raw()
        slot_51_3_0 = slot_51_1_0:get_raw()

        if slot_51_2_0 ~= slot_0_121_0 or slot_51_3_0 ~= slot_0_122_0 then
                slot_0_121_0, slot_0_122_0 = slot_51_2_0, slot_51_3_0

                for iter_51_0, iter_51_1 in pairs(slot_0_120_0) do
                        iter_51_1:set_visible(false)
                end

                slot_0_21_0(slot_51_2_0, slot_51_3_0, 0, {
                        features = {
                                spread = {
                                        slot_0_32_0,
                                        slot_0_36_0
                                },
                                nospread = {
                                        slot_0_31_0
                                },
                                dt = {
                                        slot_0_33_0,
                                        slot_0_35_0,
                                        slot_0_37_0
                                },
                                scoutonly = {
                                        slot_0_30_0,
                                        slot_0_34_0
                                }
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 1, {
                        features = {
                                spread = {
                                        slot_0_53_0,
                                        slot_0_54_0,
                                        slot_0_55_0,
                                        slot_0_56_0,
                                        slot_0_57_0,
                                        slot_0_59_0,
                                        slot_0_58_0,
                                        slot_0_60_0
                                },
                                nospread = {
                                        slot_0_52_0,
                                        slot_0_62_0,
                                        slot_0_63_0
                                },
                                dt = {
                                        slot_0_61_0,
                                        slot_0_63_0
                                },
                                scoutonly = {
                                        slot_0_51_0
                                }
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 2, {
                        features = {
                                spread = {
                                        slot_0_77_0,
                                        slot_0_78_0,
                                        slot_0_79_0,
                                        slot_0_86_0,
                                        slot_0_85_0,
                                        slot_0_88_0,
                                        slot_0_89_0
                                },
                                nospread = {
                                        slot_0_80_0,
                                        slot_0_84_0,
                                        slot_0_87_0
                                },
                                dt = {},
                                scoutonly = {
                                        slot_0_81_0,
                                        slot_0_82_0,
                                        slot_0_83_0
                                }
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 3, {
                        features = {
                                spread = {
                                        slot_0_93_0
                                },
                                nospread = {
                                        slot_0_95_0
                                },
                                dt = {
                                        slot_0_94_0
                                },
                                scoutonly = {
                                        slot_0_93_0
                                }
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 4, {
                        features = {
                                spread = {
                                        slot_0_97_0
                                },
                                nospread = {},
                                dt = {
                                        slot_0_97_0
                                },
                                scoutonly = {}
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 5, {
                        features = {
                                spread = {
                                        slot_0_99_0
                                },
                                nospread = {},
                                dt = {},
                                scoutonly = {}
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 6, {
                        features = {
                                spread = {},
                                nospread = {
                                        slot_0_101_0
                                },
                                dt = {},
                                scoutonly = {}
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 7, {
                        features = {
                                spread = {
                                        slot_0_106_0,
                                        slot_0_107_0,
                                        slot_0_108_0,
                                        slot_0_109_0
                                },
                                nospread = {},
                                dt = {},
                                scoutonly = {
                                        slot_0_106_0,
                                        slot_0_107_0,
                                        slot_0_108_0
                                }
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 8, {
                        features = {
                                spread = {
                                        slot_0_113_0,
                                        slot_0_114_0
                                },
                                nospread = {},
                                dt = {},
                                scoutonly = {
                                        slot_0_113_0,
                                        slot_0_114_0
                                }
                        }
                })
                slot_0_21_0(slot_51_2_0, slot_51_3_0, 9, {
                        features = {
                                spread = {
                                        slot_0_119_0,
                                        slot_0_118_0
                                },
                                nospread = {},
                                dt = {
                                        slot_0_118_0
                                },
                                scoutonly = {
                                        slot_0_119_0
                                }
                        }
                })
        end
end)

slot_0_123_0 = gui.button(gui.control_id("dc"), "disconnect")
slot_0_124_0 = gui.button(gui.control_id("quit"), "quit game")
slot_0_125_0 = gui.button(gui.control_id("rs"), "reset")
slot_0_126_0 = gui.button(gui.control_id("clear"), "clear")
slot_0_127_0 = gui.make_control("Disconnect", slot_0_123_0)
slot_0_128_0 = gui.make_control("Quit", slot_0_124_0)
slot_0_129_0 = gui.make_control("Reset stats", slot_0_125_0)
slot_0_130_0 = gui.make_control("Clear console", slot_0_126_0)
slot_0_131_0 = gui.spacer(gui.control_id("space1"))
slot_0_132_0 = gui.make_control("", slot_0_131_0)

slot_0_1_0:add(slot_0_132_0)
slot_0_1_0:add(slot_0_127_0)
slot_0_1_0:add(slot_0_129_0)
slot_0_1_0:add(slot_0_130_0)
slot_0_1_0:add(slot_0_128_0)
slot_0_123_0:add_callback(function()
        game.engine:client_cmd("disconnect")
end)
slot_0_125_0:add_callback(function()
        game.engine:client_cmd("css_rs")
end)
slot_0_125_0:add_callback(function()
        game.engine:client_cmd("rs")
end)
slot_0_126_0:add_callback(function()
        game.engine:client_cmd("clear")
end)
slot_0_124_0:add_callback(function()
        game.engine:client_cmd("quit")
end)
slot_0_1_0:reset()
slot_0_2_0:reset()
