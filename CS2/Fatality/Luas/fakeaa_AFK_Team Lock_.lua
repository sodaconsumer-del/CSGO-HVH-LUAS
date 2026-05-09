--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements a")
slot_0_1_0 = gui.combo_box(gui.control_id("kill_hit_combo"))
slot_0_1_0.allow_multiple = true

slot_0_1_0:add(gui.selectable(gui.control_id("killsay_list_select"), "Kill/Chat"))
slot_0_1_0:add(gui.selectable(gui.control_id("hitlog_list_select"), "Hit Popup"))

slot_0_2_0 = gui.checkbox(gui.control_id("kill_countdown"))
slot_0_3_0 = gui.make_control("Kill Countdown (6s)", slot_0_2_0)
slot_0_4_0 = gui.combo_box(gui.control_id("fake_aa_combo"))
slot_0_4_0.allow_multiple = true

slot_0_4_0:add(gui.selectable(gui.control_id("fake_aa_up_select"), "Fake AA UP (180°)"))
slot_0_4_0:add(gui.selectable(gui.control_id("fake_aa_down_select"), "Fake AA DOWN (-180°)"))

slot_0_5_0 = gui.checkbox(gui.control_id("Anti_AFK"))
slot_0_6_0 = gui.make_control("Anti AFK", slot_0_5_0)
slot_0_7_0 = gui.combo_box(gui.control_id("auto_say_combo"))
slot_0_7_0.allow_multiple = true

slot_0_7_0:add(gui.selectable(gui.control_id("auto_say_ruma"), "lv yan ru ma"))
slot_0_7_0:add(gui.selectable(gui.control_id("auto_say_night"), "Kai gua zui ying"))
slot_0_7_0:add(gui.selectable(gui.control_id("auto_say_chao"), "Chao feng shen ren"))
slot_0_7_0:add(gui.selectable(gui.control_id("auto_say_weifa"), "Kai gua wei fa"))

slot_0_8_0 = gui.combo_box(gui.control_id("vote_combo"))
slot_0_8_0.allow_multiple = true

slot_0_8_0:add(gui.selectable(gui.control_id("vote_notify_select"), "Vote Popup"))
slot_0_8_0:add(gui.selectable(gui.control_id("vote_chat_select"), "Vote Chat"))

slot_0_9_0 = gui.checkbox(gui.control_id("Stronglock"))
slot_0_10_0 = gui.slider(gui.control_id("Disable distance"), 0, 30, {
        "%.0f m"
})
slot_0_11_0 = gui.slider(gui.control_id("Smoothness"), 0, 30, {
        "%.0fdeg"
})

slot_0_0_0:add(gui.make_control("Kill/Hit Notify", slot_0_1_0))
slot_0_0_0:add(slot_0_3_0)
slot_0_0_0:add(gui.make_control("Fake AA Options", slot_0_4_0))
slot_0_0_0:add(slot_0_6_0)
slot_0_0_0:add(gui.make_control("China Say", slot_0_7_0))
slot_0_0_0:add(gui.make_control("Vote Notify", slot_0_8_0))
slot_0_0_0:add(gui.make_control("Stronglock", slot_0_9_0))
slot_0_0_0:add(gui.make_control("Disable distance", slot_0_10_0))
slot_0_0_0:add(gui.make_control("Smoothness", slot_0_11_0))

slot_0_12_0 = gui.checkbox(gui.control_id("purchase_monitor_main"))
slot_0_13_0 = gui.make_control("Weapon Purchase Monitor", slot_0_12_0)
slot_0_14_0 = gui.combo_box(gui.control_id("purchase_target"))

slot_0_14_0:add(gui.selectable(gui.control_id("target_all"), "All Players"))
slot_0_14_0:add(gui.selectable(gui.control_id("target_enemy"), "Enemies Only"))

slot_0_15_0 = gui.make_control("Monitor Target", slot_0_14_0)

slot_0_0_0:add(slot_0_13_0)
slot_0_0_0:add(slot_0_15_0)

slot_0_16_0 = gui.checkbox(gui.control_id("Enable_team_lock"))
slot_0_17_0 = gui.slider(gui.control_id("Team_lock_disable_distance"), 0, 30, {
        "%.0f m"
})
slot_0_18_0 = gui.slider(gui.control_id("Team_lock_smoothness"), 0, 30, {
        "%.0fdeg"
})
slot_0_19_0 = gui.make_control("Enable Team Lock", slot_0_16_0)
slot_0_20_0 = gui.make_control("Lock Disable distance", slot_0_17_0)
slot_0_21_0 = gui.make_control("Lock Smoothness", slot_0_18_0)

slot_0_0_0:add(slot_0_19_0)
slot_0_0_0:add(slot_0_20_0)
slot_0_0_0:add(slot_0_21_0)
slot_0_0_0:reset()

slot_0_22_0 = false
slot_0_23_0 = 6
slot_0_24_0 = 0

function slot_0_25_0()
        if not slot_0_2_0:get_value():get() then
                return
        end

        local var_1_0 = game.global_vars.real_time

        if slot_0_22_0 and var_1_0 >= slot_0_24_0 then
                if slot_0_23_0 >= 0 then
                        game.engine:client_cmd("say " .. slot_0_23_0)

                        slot_0_23_0 = slot_0_23_0 - 1
                        slot_0_24_0 = var_1_0 + 1
                end

                if slot_0_23_0 < 0 then
                        slot_0_22_0 = false
                end
        end
end

events.present_queue:add(slot_0_25_0)

slot_0_26_0 = 0
slot_0_27_0 = 0
slot_0_28_0 = nil
slot_0_29_0 = {
        "头部",
        "脖子",
        "胸部",
        "左手",
        "右手",
        "左腿",
        "右腿",
        "脚部"
}
slot_0_30_0 = {
        [0] = "Unknown",
        "Head",
        "Neck",
        "Chest",
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right Leg",
        "Foot"
}
slot_0_31_0 = {
        "大地球V5外置版提示您： [@name] 已被您使用[@weapon]击中了他的[@hitbox] 造成了[@dmg_health]的伤害，击杀数[@count]"
}
slot_0_32_0 = {
        "您被[@name]击杀 使用[@weapon]击中了我的[@hitbox] "
}
slot_0_33_0 = {
        "[@name]，已被击杀 需要多练~"
}
slot_0_34_0 = {
        "你装你木呢.为什么排到我们没点逼.数吗？",
        "自己有没有开小透小锁自瞄？",
        "我们账户隐藏分低.你为什么会排到我们？",
        "搁着装什么清白绿玩啊？",
        "你只会演技吗？",
        "遇到我们不演的就破防？",
        "你木四了.你这么会演",
        "看看你自己的账户隐藏分吧笑死我了",
        "没开东西为什么隐藏分会低？傻子东西",
        "你要真是绿玩也是个出生",
        "是不是之前杀队友被检测还被举报了？笑死我了",
        "打的就是你FW 嘴臭绿玩",
        "打的就是你FW 嘴臭绿演小透小锁",
        "想想自己做了什么事情才能来这种黄红信局",
        "你真是会演.我看奥斯卡要给你颁奖",
        "官匹对局搁这演呢？",
        "要演gun去优先买个板子演",
        "还装起清白了",
        "表.子牌坊"
}
slot_0_35_0 = {
        "外挂是工具，开挂是手段，手段是能力，作弊是智慧 ",
        "没挂就别叫，有挂就得开（开挂已是无敌路，何须再用操作补。",
        "开挂有路你不走，绿玩无门你自来投。外挂只是最强的外设，强者总会被针对。",
        "练枪是小径，自瞄是大道，意识会出错，透.视秒全场，不要问为什么开挂，因为你已经习惯愚蠢。",
        "开挂者人均天资聪颖，因为真正的高手，都善于走捷径，我们在熙熙攘攘的生活中享受外挂",
        "当绿玩被无情击败，才会明白，他们离成功只差一张板子。",
        "昔海无涯回头是挂，外挂就是最踏实的那条路，趁现在开挂还来得及。",
        "当你练了一辈子，站在山巅，才发现，外挂在对着你笑。"
}
slot_0_36_0 = {
        "你是什么低 智神人吗？ ",
        "自己先开个挂演都不演乐呵呵的",
        "我们开了打不过就说，我们开挂有意思吗，骄傲吗？",
        "我还以为你是清白玩家？",
        "你母知道自己要死了吗？",
        "你这么辱骂你自己的母和家人？",
        "特么隔墙瞄着我，说我们开挂 司 马",
        "废物就是废物，开智没有？",
        "启智学校招生办看见你都连夜跑路",
        "真乃LOWIQ也",
        "万古独一的没脑子，别人是左脑右脑互博",
        "你这种属于是大脑小脑互博了",
        "笨比"
}
slot_0_37_0 = {
        "开挂是违法的 ",
        "你在开，我报警了",
        "给你一次机会卸载挂",
        "在中国，开挂行为在不同情形下可能违法，涉及破坏计算机信息系统罪、侵犯著作权罪或非法经营罪，并可能承担民事责任。",
        "在游戏领域，开挂违反游戏服务协议，破坏游戏公平性，侵犯其他玩家权益。若开挂行为严重影响游戏正常运营秩序，游戏运营商可依据协议对开挂者采取封号等措施。",
        "从民事角度看，若因开挂给其他玩家造成损失，如导致玩家投入大量时间和金钱获得的优势丧失，",
        "受损玩家可要求开挂者承担赔偿责任。",
        "2025年四月内蒙古中级人  民 法  院受理的一起刑  事案件：廖某某 因在cs2游戏中使用大地球外挂被判处 死 行",
        "据不完全统计，笔者从威科先行法律数据库中以“游戏外挂”为关键词，限定刑事案由进行检索，得到472份裁判文书",
        "2003年12月18日就联合下发《关于开展对“私服”、“外挂”专项治理的通知》",
        "关掉你们的外 挂",
        "刑事犯罪中主要以提供侵入、非法控制计算机信息系统程序、工具罪（137件）",
        "破坏计算机信息系统罪（28件）、非法经营罪（68件）",
        "侵犯著作权罪（18件）、诈骗罪（102件）等",
        "总之，开挂不仅可能面临民事赔偿，严重时更会触犯刑法。"
}
slot_0_38_0 = 1
slot_0_39_0 = 1
slot_0_40_0 = 1
slot_0_41_0 = 1
slot_0_42_0 = 0
slot_0_43_0 = 1.2

mods.events:add_listener("player_death")
mods.events:add_listener("player_hurt")
events.event:add(function(arg_2_0)
        slot_2_1_0 = slot_0_1_0:get_value():get():get_raw()

        if type(slot_2_1_0) ~= "number" then
                return
        end

        slot_2_2_0 = arg_2_0:get_name()

        if slot_2_2_0 == "player_death" then
                slot_2_3_2 = arg_2_0:get_pawn_from_id("userid")
                slot_2_4_2 = arg_2_0:get_pawn_from_id("attacker")

                if slot_2_4_2 and slot_2_4_2 == entities.get_local_pawn() and slot_2_4_2:is_enemy_to(slot_2_3_2) and slot_0_2_0:get_value():get() then
                        slot_0_22_0 = true
                        slot_0_23_0 = 6
                        slot_0_24_0 = game.global_vars.real_time + 1
                end
        end

        if bit.band(slot_2_1_0, 1) ~= 0 and slot_2_2_0 == "player_death" then
                slot_2_3_1 = arg_2_0:get_pawn_from_id("userid")
                slot_2_4_1 = arg_2_0:get_pawn_from_id("attacker")
                slot_2_5_1 = arg_2_0:get_int("hitgroup") or 0
                slot_2_6_1 = slot_0_29_0[slot_2_5_1] or "未知"
                slot_2_7_1 = slot_2_3_1 and slot_2_3_1:get_name() or "未知"
                slot_2_8_1 = slot_2_4_1 and slot_2_4_1:get_name() or "世界"
                slot_2_9_1 = arg_2_0:get_string("weapon")
                slot_2_10_1 = arg_2_0:get_int("dmg_health")

                if slot_2_3_1 == entities.get_local_pawn() then
                        slot_0_27_0 = slot_0_27_0 + 1
                        slot_2_11_15 = slot_0_32_0[math.random(1, #slot_0_32_0)]
                        slot_2_11_14 = string.gsub(slot_2_11_15, "@name", slot_2_8_1)
                        slot_2_11_13 = string.gsub(slot_2_11_14, "@hitbox", slot_2_6_1)
                        slot_2_11_12 = string.gsub(slot_2_11_13, "@weapon", slot_2_9_1)
                        slot_2_11_11 = string.gsub(slot_2_11_12, "@dmg_health", slot_2_10_1)
                        slot_2_11_10 = string.gsub(slot_2_11_11, "@count", tostring(slot_0_27_0))

                        game.engine:client_cmd("say " .. slot_2_11_10)

                        slot_0_28_0 = slot_2_8_1
                end

                if slot_2_4_1 and slot_2_4_1 == entities.get_local_pawn() and slot_2_4_1:is_enemy_to(slot_2_3_1) then
                        slot_0_26_0 = slot_0_26_0 + 1
                        slot_2_11_9 = slot_0_31_0[math.random(1, #slot_0_31_0)]
                        slot_2_11_8 = string.gsub(slot_2_11_9, "@name", slot_2_7_1)
                        slot_2_11_7 = string.gsub(slot_2_11_8, "@hitbox", slot_2_6_1)
                        slot_2_11_6 = string.gsub(slot_2_11_7, "@weapon", slot_2_9_1)
                        slot_2_11_5 = string.gsub(slot_2_11_6, "@dmg_health", slot_2_10_1)
                        slot_2_11_4 = string.gsub(slot_2_11_5, "@count", tostring(slot_0_26_0))

                        game.engine:client_cmd("say " .. slot_2_11_4)
                end

                if slot_0_28_0 and slot_2_7_1 == slot_0_28_0 then
                        slot_2_11_3 = slot_0_33_0[math.random(1, #slot_0_33_0)]
                        slot_2_11_2 = string.gsub(slot_2_11_3, "@name", slot_2_7_1)
                        slot_2_11_1 = string.gsub(slot_2_11_2, "@hitbox", slot_2_6_1)
                        slot_2_11_0 = string.gsub(slot_2_11_1, "@weapon", slot_2_9_1)

                        game.engine:client_cmd("say " .. slot_2_11_0)

                        slot_0_28_0 = nil
                end
        end

        if bit.band(slot_2_1_0, 2) ~= 0 and slot_2_2_0 == "player_hurt" then
                slot_2_3_0 = entities.get_local_pawn()

                if not slot_2_3_0 then
                        return
                end

                slot_2_4_0 = arg_2_0:get_pawn_from_id("attacker")
                slot_2_5_0 = arg_2_0:get_pawn_from_id("userid")
                slot_2_6_0 = arg_2_0:get_int("health")
                slot_2_7_0 = arg_2_0:get_int("dmg_health")
                slot_2_8_0 = arg_2_0:get_int("hitgroup")

                if slot_2_3_0 == slot_2_4_0 and slot_2_3_0 ~= slot_2_5_0 then
                        slot_2_9_0 = "Hit log | DMG: " .. slot_2_7_0 .. " | Player: " .. slot_2_5_0:get_name() .. " | Hit: " .. slot_0_30_0[slot_2_8_0] .. " | HP left:" .. slot_2_6_0
                        slot_2_10_0 = gui.notification("大地球V5", slot_2_9_0, draw.textures.icon_rage)

                        gui.notify:add(slot_2_10_0)
                end
        end
end)

slot_0_44_0 = gui.ctx:find("rage>anti-aim>angles>pitch")

function slot_0_45_0(arg_3_0)
        return 2^(arg_3_0 - 1)
end

function slot_0_46_0(arg_4_0, arg_4_1)
        local var_4_0 = arg_4_0:get_value():get()

        var_4_0:reset()
        var_4_0:set_raw(slot_0_45_0(arg_4_1))
        arg_4_0:get_value():set(var_4_0)
end

function slot_0_47_0()
        local var_5_0 = slot_0_4_0:get_value():get():get_raw()

        if type(var_5_0) ~= "number" then
                return
        end

        if bit.band(var_5_0, 1) ~= 0 then
                slot_0_46_0(slot_0_44_0, 5)
                gui.ctx:find("rage>anti-aim>angles>pitch>settings>value"):get_value():set(180)

                local var_5_1 = draw.surface

                var_5_1.font = draw.fonts.gui_main

                local var_5_2, var_5_3 = game.engine:get_screen_size()
                local var_5_4 = var_5_1.font.height
                local var_5_5 = "FAKE AA UP"
                local var_5_6 = var_5_1.font:get_text_size(var_5_5, true).x

                var_5_1:add_glow(draw.rect(var_5_2 / 2 - var_5_6 / 2, var_5_3 / 2 + 30 + var_5_4 / 2, var_5_2 / 2 + var_5_6 / 2, var_5_3 / 2 + 30 + var_5_4 / 2), 6, draw.color(0, 255, 255, 105))
                var_5_1:add_text(draw.vec2(var_5_2 / 2 - var_5_6 / 2, var_5_3 / 2 + 30), var_5_5, draw.color(255, 255, 255))
        end

        if bit.band(var_5_0, 2) ~= 0 then
                slot_0_46_0(slot_0_44_0, 5)
                gui.ctx:find("rage>anti-aim>angles>pitch>settings>value"):get_value():set(-180)

                local var_5_7 = draw.surface

                var_5_7.font = draw.fonts.gui_main

                local var_5_8, var_5_9 = game.engine:get_screen_size()
                local var_5_10 = var_5_7.font.height
                local var_5_11 = "FAKE AA DOWN"
                local var_5_12 = var_5_7.font:get_text_size(var_5_11, true).x

                var_5_7:add_glow(draw.rect(var_5_8 / 2 - var_5_12 / 2, var_5_9 / 2 + 30 + var_5_10 / 2, var_5_8 / 2 + var_5_12 / 2, var_5_9 / 2 + 30 + var_5_10 / 2), 6, draw.color(255, 0, 255, 105))
                var_5_7:add_text(draw.vec2(var_5_8 / 2 - var_5_12 / 2, var_5_9 / 2 + 30), var_5_11, draw.color(255, 255, 255))
        end
end

events.present_queue:add(slot_0_47_0)

slot_0_48_0 = false
slot_0_49_0 = 0
slot_0_50_0 = game.global_vars.tick_count
slot_0_51_0 = nil

function SecondsToTicks(arg_6_0)
        return arg_6_0 * 64
end

slot_0_52_0 = 20

function slot_0_53_0(arg_7_0)
        if arg_7_0:get_name() == "round_start" and game.engine:in_game() then
                local var_7_0 = entities.get_local_pawn()

                if not var_7_0 then
                        return
                end

                slot_0_51_0 = var_7_0:get_abs_origin()
                slot_0_48_0 = true
        end
end

function slot_0_54_0()
        local var_8_0 = slot_0_7_0:get_value():get():get_raw()

        if type(var_8_0) ~= "number" then
                return
        end

        if not game.engine:in_game() then
                return
        end

        local var_8_1 = game.global_vars.real_time

        if var_8_1 - slot_0_42_0 < slot_0_43_0 then
                return
        end

        local var_8_2 = false

        if bit.band(var_8_0, 1) ~= 0 then
                game.engine:client_cmd("say " .. slot_0_34_0[slot_0_38_0])

                slot_0_38_0 = slot_0_38_0 + 1

                if slot_0_38_0 > #slot_0_34_0 then
                        slot_0_38_0 = 1
                end

                var_8_2 = true
        end

        if bit.band(var_8_0, 2) ~= 0 then
                game.engine:client_cmd("say " .. slot_0_35_0[slot_0_39_0])

                slot_0_39_0 = slot_0_39_0 + 1

                if slot_0_39_0 > #slot_0_35_0 then
                        slot_0_39_0 = 1
                end

                var_8_2 = true
        end

        if bit.band(var_8_0, 4) ~= 0 then
                game.engine:client_cmd("say " .. slot_0_36_0[slot_0_40_0])

                slot_0_40_0 = slot_0_40_0 + 1

                if slot_0_40_0 > #slot_0_36_0 then
                        slot_0_40_0 = 1
                end

                var_8_2 = true
        end

        if bit.band(var_8_0, 8) ~= 0 then
                game.engine:client_cmd("say " .. slot_0_37_0[slot_0_41_0])

                slot_0_41_0 = slot_0_41_0 + 1

                if slot_0_41_0 > #slot_0_37_0 then
                        slot_0_41_0 = 1
                end

                var_8_2 = true
        end

        if var_8_2 then
                slot_0_42_0 = var_8_1
        end
end

function slot_0_55_0(arg_9_0)
        local var_9_0 = slot_0_8_0:get_value():get():get_raw()

        if type(var_9_0) ~= "number" then
                return
        end

        if arg_9_0:get_name() == "vote_cast" then
                local var_9_1 = arg_9_0:get_int("vote_option")
                local var_9_2 = arg_9_0:get_int("team")
                local var_9_3 = arg_9_0:get_pawn_from_id("userid")

                if not var_9_3 then
                        return
                end

                local var_9_4 = var_9_3:get_name()
                local var_9_5 = var_9_1 == 0 and "同意" or "拒绝"
                local var_9_6 = var_9_2 == 2 and "T" or "CT"
                local var_9_7 = string.format("队伍: %s | 投票选择: %s | 玩家: %s", var_9_6, var_9_5, var_9_4)
                local var_9_8 = gui.notification("投票事件!", var_9_7, draw.textures.gui_icon_bug)

                if bit.band(var_9_0, 1) ~= 0 then
                        gui.notify:add(var_9_8)
                end

                if bit.band(var_9_0, 2) ~= 0 then
                        local var_9_9 = string.format("[投票] %s(%s) 投票选择: %s", var_9_4, var_9_6, var_9_5)

                        game.engine:client_cmd("say \"" .. var_9_9 .. "\"")
                end
        end
end

function slot_0_56_0()
        if slot_0_48_0 and game.global_vars.tick_count ~= slot_0_50_0 and game.engine:in_game() and slot_0_5_0:get_value():get() then
                local var_10_0 = entities.get_local_pawn()

                if not var_10_0 then
                        return
                end

                if not (slot_0_51_0:dist(var_10_0:get_abs_origin()) < 5) or slot_0_49_0 >= SecondsToTicks(slot_0_52_0 + 0.1) then
                        game.engine:client_cmd("-left")

                        slot_0_48_0 = false
                        slot_0_49_0 = 0

                        return
                elseif slot_0_49_0 == SecondsToTicks(slot_0_52_0) then
                        game.engine:client_cmd("+left")
                end

                slot_0_49_0 = slot_0_49_0 + 1
                slot_0_50_0 = game.global_vars.tick_count
        end
end

slot_0_57_0 = {
        "Desert Eagle",
        "Dual Berettas",
        "Five-SeveN",
        "Glock-18",
        nil,
        nil,
        "AK-47",
        "AUG",
        "AWP",
        "FAMAS",
        "G3SG1",
        nil,
        "Galil AR",
        nil,
        nil,
        "M4A4",
        nil,
        nil,
        "P90",
        nil,
        nil,
        nil,
        "MP5-SD",
        "UMP-45",
        nil,
        nil,
        nil,
        nil,
        nil,
        "Tec-9",
        nil,
        "P2000",
        nil,
        nil,
        nil,
        "P250",
        nil,
        "SCAR-20",
        "SG 553",
        "SSG-08",
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        "M4A1-S",
        "USP-S",
        nil,
        "CZ75-Auto",
        "R8 Revolver",
        [508] = "M9 Bayonet",
        [515] = "Butterfly Knife",
        [500] = "Bayonet",
        [507] = "Karambit"
}
slot_0_58_0 = {
        [0] = "Knife",
        "Pistols",
        "SMGs",
        "Rifles",
        "Heavy",
        "Auto Snipers",
        "Bolt Snipers",
        "C4",
        "Taser",
        "Grenades",
        "Stackable Items",
        "Fists",
        "Breach Charge",
        "Bump Mine",
        "Tablet",
        "Melee",
        "Shield",
        "Zone Repulsor"
}

setmetatable(slot_0_57_0, {
        __index = function()
                return "Unknown Weapon"
        end
})
setmetatable(slot_0_58_0, {
        __index = function()
                return "Unknown Weapon Type"
        end
})

function slot_0_59_0(arg_13_0)
        return (arg_13_0 + 180) % 360 - 180
end

function slot_0_60_0(arg_14_0, arg_14_1, arg_14_2)
        return math.max(arg_14_1, math.min(arg_14_2, arg_14_0))
end

function slot_0_61_0(arg_15_0, arg_15_1)
        local var_15_0 = arg_15_0.x - arg_15_1.x
        local var_15_1 = arg_15_0.y - arg_15_1.y
        local var_15_2 = arg_15_0.z - arg_15_1.z

        return math.sqrt(var_15_0 * var_15_0 + var_15_1 * var_15_1 + var_15_2 * var_15_2)
end

function slot_0_62_0(arg_16_0, arg_16_1)
        local var_16_0 = slot_0_59_0(arg_16_1.y - arg_16_0.y)
        local var_16_1 = arg_16_1.x - arg_16_0.x

        return math.sqrt(var_16_0 * var_16_0 + var_16_1 * var_16_1)
end

function slot_0_63_0(arg_17_0)
        if not arg_17_0 then
                return 0
        end

        local var_17_0 = arg_17_0:get_id()
        local var_17_1 = arg_17_0:get_type()

        if not var_17_0 or not var_17_1 then
                return 0
        end

        local var_17_2 = {
                string.format("legit>weapon>%s>aim>aim fov", slot_0_57_0[var_17_0] or "Unknown Weapon"),
                string.format("legit>weapon>%s>aim>aim fov", slot_0_58_0[var_17_1] or "Unknown Weapon Type"),
                "legit>weapon>general>aim>aim fov"
        }

        for iter_17_0, iter_17_1 in ipairs(var_17_2) do
                local var_17_3 = gui.ctx:find(iter_17_1)

                if var_17_3 then
                        return var_17_3:get_value():get()
                end
        end

        return 0
end

function slot_0_64_0(arg_18_0, arg_18_1)
        local var_18_0 = arg_18_0 * 0.033
        local var_18_1 = slot_0_60_0(arg_18_1, 0, 5000)
        local var_18_2 = slot_0_60_0(var_18_1 / 500, 0.5, 1.5)

        return math.max(0.05, 1 - var_18_0 * var_18_2)
end

function aimbot()
        local var_19_0 = entities.get_local_pawn()

        if not var_19_0 or not var_19_0:is_alive() then
                return
        end

        local var_19_1 = var_19_0:get_active_weapon()

        if not var_19_1 then
                return
        end

        local var_19_2 = var_19_1:get_type()

        if not var_19_2 or var_19_2 == 9 then
                return
        end

        local var_19_3 = game.input:get_view_angles()

        if not var_19_3 then
                return
        end

        local var_19_4 = var_19_0:get_eye_pos()

        if not var_19_4 then
                return
        end

        local var_19_5 = math.huge
        local var_19_6

        entities.players:for_each(function(arg_20_0)
                if arg_20_0 and arg_20_0.had_dataupdate and arg_20_0.entity:is_alive() and arg_20_0.entity ~= var_19_0 and arg_20_0.entity:is_enemy() then
                        local var_20_0 = arg_20_0.entity:get_eye_pos()

                        if not var_20_0 then
                                return
                        end

                        local var_20_1 = slot_0_61_0(var_19_4, var_20_0)
                        local var_20_2 = math.vec3(var_20_0.x - var_19_4.x, var_20_0.y - var_19_4.y, var_20_0.z - var_19_4.z)
                        local var_20_3 = math.deg(math.atan2(var_20_2.y, var_20_2.x))
                        local var_20_4 = math.deg(math.atan2(-var_20_2.z, math.sqrt(var_20_2.x * var_20_2.x + var_20_2.y * var_20_2.y)))
                        local var_20_5 = slot_0_62_0(var_19_3, math.vec3(var_20_4, var_20_3, 0)) * (1 + slot_0_60_0(var_20_1 * 0.0005, 0, 1))

                        if var_20_5 < var_19_5 then
                                var_19_5 = var_20_5
                                var_19_6 = arg_20_0.handle
                        end
                end
        end)

        if var_19_6 and var_19_6:valid() then
                local var_19_7 = var_19_6:get()

                if not var_19_7 or not slot_0_9_0:get_value():get() then
                        return
                end

                local var_19_8 = var_19_7:get_eye_pos()

                if not var_19_8 then
                        return
                end

                local var_19_9 = slot_0_61_0(var_19_4, var_19_8)

                if var_19_9 < slot_0_10_0:get_value():get() * 10 then
                        return
                end

                local var_19_10 = math.vec3(var_19_8.x - var_19_4.x, var_19_8.y - var_19_4.y, var_19_8.z - var_19_4.z)
                local var_19_11 = math.deg(math.atan2(var_19_10.y, var_19_10.x))
                local var_19_12 = math.deg(math.atan2(-var_19_10.z, math.sqrt(var_19_10.x * var_19_10.x + var_19_10.y * var_19_10.y)))
                local var_19_13 = slot_0_59_0(var_19_11)
                local var_19_14 = slot_0_60_0(var_19_12, -89, 89)

                if slot_0_63_0(var_19_1) < slot_0_62_0(var_19_3, math.vec3(var_19_14, var_19_13, 0)) then
                        return
                end

                local var_19_15 = slot_0_59_0(var_19_13 - var_19_3.y)
                local var_19_16 = var_19_14 - var_19_3.x
                local var_19_17 = slot_0_60_0(var_19_9, 0, 5000)
                local var_19_18 = slot_0_64_0(slot_0_11_0:get_value():get(), var_19_17 / 10)
                local var_19_19 = slot_0_59_0(var_19_3.y + var_19_15 * var_19_18)
                local var_19_20 = slot_0_60_0(var_19_3.x + var_19_16 * var_19_18, -89, 89)

                game.input:set_view_angles(math.vec3(var_19_20, var_19_19, 0))
        end
end

events.present_queue:add(aimbot)

function slot_0_65_0()
        local var_21_0 = entities.get_local_pawn()

        if not var_21_0 or not var_21_0:is_alive() then
                return
        end

        if not slot_0_16_0:get_value():get() then
                return
        end

        local var_21_1 = var_21_0:get_active_weapon()

        if not var_21_1 then
                return
        end

        local var_21_2 = var_21_1:get_type()

        if not var_21_2 or var_21_2 == 9 then
                return
        end

        local var_21_3 = game.input:get_view_angles()

        if not var_21_3 then
                return
        end

        local var_21_4 = var_21_0:get_eye_pos()

        if not var_21_4 then
                return
        end

        local var_21_5 = math.huge
        local var_21_6

        entities.players:for_each(function(arg_22_0)
                if arg_22_0 and arg_22_0.had_dataupdate and arg_22_0.entity:is_alive() and arg_22_0.entity ~= var_21_0 and not arg_22_0.entity:is_enemy() then
                        local var_22_0 = arg_22_0.entity:get_eye_pos()

                        if not var_22_0 then
                                return
                        end

                        local var_22_1 = slot_0_61_0(var_21_4, var_22_0)
                        local var_22_2 = math.vec3(var_22_0.x - var_21_4.x, var_22_0.y - var_21_4.y, var_22_0.z - var_21_4.z)
                        local var_22_3 = math.deg(math.atan2(var_22_2.y, var_22_2.x))
                        local var_22_4 = math.deg(math.atan2(-var_22_2.z, math.sqrt(var_22_2.x * var_22_2.x + var_22_2.y * var_22_2.y)))
                        local var_22_5 = slot_0_62_0(var_21_3, math.vec3(var_22_4, var_22_3, 0)) * (1 + slot_0_60_0(var_22_1 * 0.0005, 0, 1))

                        if var_22_5 < var_21_5 then
                                var_21_5 = var_22_5
                                var_21_6 = arg_22_0.handle
                        end
                end
        end)

        if var_21_6 and var_21_6:valid() then
                local var_21_7 = var_21_6:get()

                if not var_21_7 then
                        return
                end

                local var_21_8 = var_21_7:get_eye_pos()

                if not var_21_8 then
                        return
                end

                local var_21_9 = slot_0_61_0(var_21_4, var_21_8)

                if var_21_9 < slot_0_17_0:get_value():get() * 10 then
                        return
                end

                local var_21_10 = math.vec3(var_21_8.x - var_21_4.x, var_21_8.y - var_21_4.y, var_21_8.z - var_21_4.z)
                local var_21_11 = math.deg(math.atan2(var_21_10.y, var_21_10.x))
                local var_21_12 = math.deg(math.atan2(-var_21_10.z, math.sqrt(var_21_10.x * var_21_10.x + var_21_10.y * var_21_10.y)))
                local var_21_13 = slot_0_59_0(var_21_11)
                local var_21_14 = slot_0_60_0(var_21_12, -89, 89)

                if slot_0_63_0(var_21_1) < slot_0_62_0(var_21_3, math.vec3(var_21_14, var_21_13, 0)) then
                        return
                end

                local var_21_15 = slot_0_59_0(var_21_13 - var_21_3.y)
                local var_21_16 = var_21_14 - var_21_3.x
                local var_21_17 = slot_0_60_0(var_21_9, 0, 5000)
                local var_21_18 = slot_0_64_0(slot_0_18_0:get_value():get(), var_21_17 / 10)
                local var_21_19 = slot_0_59_0(var_21_3.y + var_21_15 * var_21_18)
                local var_21_20 = slot_0_60_0(var_21_3.x + var_21_16 * var_21_18, -89, 89)

                game.input:set_view_angles(math.vec3(var_21_20, var_21_19, 0))
        end
end

events.present_queue:add(slot_0_65_0)
print("队友锁定模块已加载 | 勾选 Enable Team Lock 即可锁定队友")
mods.events:add_listener("vote_started")
mods.events:add_listener("vote_failed")
mods.events:add_listener("vote_passed")
mods.events:add_listener("vote_changed")
mods.events:add_listener("vote_cast_yes")
mods.events:add_listener("vote_cast_no")
mods.events:add_listener("vote_cast")
mods.events:add_listener("start_vote")
mods.events:add_listener("vote_ended")
mods.events:add_listener("vote_options")
events.event:add(slot_0_55_0)
events.event:add(slot_0_53_0)
events.present_queue:add(slot_0_56_0)
events.present_queue:add(slot_0_54_0)

slot_0_66_0 = {
        weapon_mp7 = "MP7",
        weapon_mp9 = "MP9",
        weapon_mac10 = "MAC-10",
        weapon_hkp2000 = "P2000",
        weapon_p250 = "P250",
        weapon_revolver = "R8左轮",
        weapon_cz75a = "CZ75-Auto",
        weapon_tec9 = "Tec-9",
        weapon_awp = "AWP大狙",
        weapon_fiveseven = "Five-SeveN",
        weapon_ssg08 = "SSG 08鸟狙",
        weapon_elite = "双持贝瑞塔",
        weapon_galilar = "Galil AR",
        weapon_glock = "Glock-18",
        weapon_famas = "法玛斯",
        weapon_usp_silencer = "USP-S",
        weapon_sg556 = "SG 553",
        weapon_deagle = "沙漠之鹰",
        weapon_aug = "AUG",
        weapon_g3sg1 = "G3SG1",
        weapon_scar20 = "SCAR-20",
        weapon_m4a1 = "M4A4",
        weapon_ak47 = "AK-47",
        weapon_negev = "Negev",
        weapon_m249 = "M249",
        weapon_sawedoff = "截短霰弹枪",
        weapon_mag7 = "MAG-7",
        weapon_xm1014 = "XM1014",
        weapon_nova = "Nova",
        weapon_bizon = "PP-Bizon",
        weapon_p90 = "P90",
        weapon_ump45 = "UMP-45",
        weapon_m4a1_silencer = "M4A1-S",
        weapon_mp5sd = "MP5-SD"
}
slot_0_67_0 = {
        [3] = "【CT】",
        [2] = "【T】"
}
slot_0_68_0 = {}

function slot_0_69_0()
        local var_23_0 = entities.get_local_controller()

        if not var_23_0 then
                return nil
        end

        local var_23_1 = var_23_0.m_iTeamNum

        if not var_23_1 then
                return nil
        end

        return var_23_1:get()
end

events.event:add(function(arg_24_0)
        if arg_24_0:get_name() ~= "item_purchase" then
                return
        end

        if not slot_0_12_0:get_value():get() then
                return
        end

        local var_24_0 = arg_24_0:get_controller("userid")

        if not var_24_0 then
                return
        end

        local var_24_1 = var_24_0:get_name()

        if not var_24_1 then
                return
        end

        local var_24_2 = var_24_0.m_iTeamNum

        if not var_24_2 then
                return
        end

        local var_24_3 = var_24_2:get()

        if not var_24_3 then
                return
        end

        if slot_0_14_0:get_value():get():get_raw() == 2 then
                local var_24_4 = slot_0_69_0()

                if var_24_4 and var_24_3 == var_24_4 then
                        return
                end
        end

        local var_24_5 = arg_24_0:get_string("weapon")
        local var_24_6 = slot_0_66_0[var_24_5]

        if not var_24_6 then
                return
        end

        local var_24_7 = slot_0_67_0[var_24_3] or ""
        local var_24_8 = string.format("%s %s 购买了 %s", var_24_7, var_24_1, var_24_6)

        table.insert(slot_0_68_0, var_24_8)
end)
events.present_queue:add(function()
        if #slot_0_68_0 == 0 then
                return
        end

        for iter_25_0, iter_25_1 in ipairs(slot_0_68_0) do
                game.engine:client_cmd("say \"" .. iter_25_1 .. "\"")
        end

        slot_0_68_0 = {}
end)
print("武器购买监测已加载")
print("Lua已加载 ")
