--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        _refresh_cooldown = 0.1,
        _last_refresh_time = 0,
        notification_text = "wuyan",
        killsay_enabled = false,
        killsay_cooldown = 2,
        notification_duration = 5,
        last_killsay_time = 0,
        main = {
                groupa = gui.ctx:find("lua>elements a")
        },
        screen = {
                game.engine:get_screen_size()
        },
        _group_reset_this_frame = {
                groupa = false
        },
        startup_anim = {
                script_started = true,
                first_frame = true,
                active = true,
                start_time = 0,
                letters_wuyan = {
                        "W    ",
                        " U    ",
                        " Y    ",
                        " A    ",
                        " N    "
                }
        },
        colors = {
                white = draw.color(255, 255, 255),
                accent = draw.color(0, 209, 255, 255)
        },
        killsay_messages = {
                " [SlienceFix] @@{player} 那点狗屁的尊严浪费我的时间你是多么的不堪",
                " [SlienceFix] @@{player} 毕竟爸爸在你幼稚的氛围早已是千里之外了这还用爸爸这个意思的跟你浪费时",
                " [SlienceFix] @@{player} 我给你一个反抗的机会让你心服口服爸爸是怎么来教育你这个老鼠角色的",
                " [SlienceFix] @@{player} 背信弃义的唯唯诺诺死缠烂打的跟着我叫爸爸难怪我觉得你一点都不像我这么威风凛凛",
                " [SlienceFix] @@{player} 可是到了后来的你怎么就成了大逆不道的狗儿呢我真是叹声叹气",
                " [SlienceFix] @@{player} 你这种货色不应该把你抛之千里之外的吗到现在跟我学了点本事就蹬鼻子上脸翻脸不认我这个平时待你不薄的爸爸",
                " [SlienceFix] @@{player} 爸爸你觉得你这么做是不是叫大逆不道而我随随便便殴打你",
                " [SlienceFix] @@{player} 看清楚爸爸的速度了吗干吗这样无力挣扎的反抗爸爸为什么你能跟我解释一下么",
                " [SlienceFix] @@{player} 还是当初你为了能巴结我一下给你留点风光的样子",
                " [SlienceFix] @@{player} 现在就可以跟爸爸单枪匹马的挑战了我也就呵呵了",
                " [SlienceFix] @@{player} 你那叫什么真本事算个什么j8玩意儿",
                " [SlienceFix] @@{player} 也许在你这种幼稚人的眼里那点破三字经就是你的秘密武器了吧",
                " [SlienceFix] @@{player} 那我好歹也夸你几句勇气可嘉了难听点就是狂傲自大了不是吗",
                " [SlienceFix] @@{player} 你这个j8玩意干嘛费力的跟我叽叽歪歪留点口水去读点书好吗",
                " [SlienceFix] @@{player} 你说什么风风火火晃晃悠悠呢乱七八糟的东西就天下无敌了瞧你那嚣张跋扈的样",
                " [SlienceFix] @@{player} 要不是爸爸想象了你待会被我打的鼻青脸肿的样子我还真会这么做",
                " [SlienceFix] @@{player} 毕竟你那个脸小的都快没了我只好给你生存的机会",
                " [SlienceFix] @@{player} 可我现在给你消失的机会你干嘛不走还死皮赖脸说要跟我战斗",
                " [SlienceFix] @@{player} 好在爸爸没大发雷霆给你一个巴掌",
                " [SlienceFix] @@{player} 衮回家可是爸爸又是情不自禁的放过了你",
                " [SlienceFix] @@{player} 你那个小小蜗牛的速度就不用拿出来了吧可你的耀武扬威已经证明了你的欠揍",
                " [SlienceFix] @@{player} 我真是舍不得打你这个老鼠样子待会就跟我痛哭流涕的道歉几声",
                " [SlienceFix] @@{player} 篮子似的你有什么资格耀武扬威呢不就是学了点狗叫的本事干嘛唬这唬那的你"
        }
}

function smart_reset(arg_1_0, arg_1_1)
        local var_1_0 = game.global_vars.real_time

        if (arg_1_1 or not slot_0_0_0._group_reset_this_frame[arg_1_0]) and (var_1_0 - slot_0_0_0._last_refresh_time >= slot_0_0_0._refresh_cooldown or arg_1_1) then
                if arg_1_0 == "groupa" and slot_0_0_0.main.groupa then
                        slot_0_0_0.main.groupa:reset()

                        slot_0_0_0._group_reset_this_frame.groupa = true
                end

                slot_0_0_0._last_refresh_time = var_1_0
        end
end

if not slot_0_0_0.main.groupa then
        print("[Wuyan.lua] 错误：无法找到 GUI 上下文 'lua>elements a'，尝试使用默认上下文 'lua'")

        slot_0_0_0.main.groupa = gui.ctx:find("lua") or gui.ctx:find("")

        if not slot_0_0_0.main.groupa then
                print("[Wuyan.lua] 错误：无法初始化 GUI 上下文，跳过 GUI 设置")

                slot_0_0_0.main.groupa = {
                        add = function()
                                return
                        end,
                        reset = function()
                                return
                        end
                }
        end
end

slot_0_1_0 = gui.label(gui.control_id("title_label"), "                      Wuyan.lua", draw.color(255, 255, 255, 255), true)

slot_0_0_0.main.groupa:add(slot_0_1_0)
smart_reset("groupa")

slot_0_0_0.notification_text_input = gui.text_input(gui.control_id("notification_text"))
slot_0_0_0.notification_text_input.placeholder = "Enter notification text..."

slot_0_0_0.notification_text_input:set_value(slot_0_0_0.notification_text)

slot_0_0_0.notification_text_wrapper = gui.make_control("Notification Text", slot_0_0_0.notification_text_input)

slot_0_0_0.main.groupa:add(slot_0_0_0.notification_text_wrapper)
smart_reset("groupa")

slot_0_0_0.killsay_checkbox = gui.checkbox(gui.control_id("killsay_enable"))

slot_0_0_0.killsay_checkbox:set_value(false)

slot_0_0_0.killsay_wrapper = gui.make_control("Enable Killsay", slot_0_0_0.killsay_checkbox)

slot_0_0_0.main.groupa:add(slot_0_0_0.killsay_wrapper)
smart_reset("groupa")

function slot_0_0_0.update_notification_text()
        slot_0_0_0.notification_text = slot_0_0_0.notification_text_input.value
end

function slot_0_0_0.update_killsay_state()
        slot_0_0_0.killsay_enabled = slot_0_0_0.killsay_checkbox:get_value():get()
end

events.present_queue:add(slot_0_0_0.update_notification_text)
events.present_queue:add(slot_0_0_0.update_killsay_state)

function slot_0_0_0.render_startup_animation()
        if not slot_0_0_0.startup_anim.active then
                return
        end

        local var_6_0 = draw.surface
        local var_6_1 = game.global_vars.real_time

        if slot_0_0_0.startup_anim.first_frame then
                slot_0_0_0.startup_anim.start_time = var_6_1
                slot_0_0_0.startup_anim.first_frame = false
        end

        local var_6_2 = var_6_1 - slot_0_0_0.startup_anim.start_time
        local var_6_3 = 2

        if var_6_3 < var_6_2 then
                slot_0_0_0.startup_anim.active = false

                return
        end

        local var_6_4 = var_6_2 / var_6_3
        local var_6_5 = math.min(255, math.floor(255 * (1 - var_6_4)))

        var_6_0.font = draw.fonts.gui_title

        local var_6_6 = table.concat(slot_0_0_0.startup_anim.letters_wuyan)
        local var_6_7 = var_6_0.font:get_text_size(var_6_6)
        local var_6_8 = slot_0_0_0.screen[1]
        local var_6_9 = slot_0_0_0.screen[2]
        local var_6_10 = (var_6_8 - var_6_7.x) / 2
        local var_6_11 = var_6_9 / 2

        for iter_6_0, iter_6_1 in ipairs(slot_0_0_0.startup_anim.letters_wuyan) do
                local var_6_12 = math.min(1, var_6_2 - (iter_6_0 - 1) * 0.1)
                local var_6_13 = math.floor(var_6_5 * var_6_12)
                local var_6_14 = var_6_0.font:get_text_size(iter_6_1)

                var_6_0:add_text(draw.vec2(var_6_10, var_6_11), iter_6_1, draw.color(slot_0_0_0.colors.accent:get_r(), slot_0_0_0.colors.accent:get_g(), slot_0_0_0.colors.accent:get_b(), var_6_13))

                var_6_10 = var_6_10 + var_6_14.x
        end
end

events.present_queue:add(slot_0_0_0.render_startup_animation)

function slot_0_0_0.handle_hit_notification(arg_7_0)
        if arg_7_0:get_name() ~= "player_hurt" then
                return
        end

        local var_7_0 = arg_7_0:get_pawn_from_id("attacker")
        local var_7_1 = arg_7_0:get_pawn_from_id("userid")
        local var_7_2 = entities.get_local_pawn()

        if var_7_0 and var_7_2 and var_7_0 == var_7_2 and var_7_1 and var_7_1:is_enemy() then
                local var_7_3 = arg_7_0:get_int("dmg_health")
                local var_7_4 = arg_7_0:get_int("hitgroup")
                local var_7_5 = arg_7_0:get_int("health")
                local var_7_6 = var_7_1:get_name() or "unknown"
                local var_7_7 = slot_0_0_0.HITBOX_NAMES[var_7_4] or "body"
                local var_7_8 = string.format("%s - Hit %s in %s for %d damage (%d HP remaining)", slot_0_0_0.notification_text, var_7_6, var_7_7, var_7_3, var_7_5)
                local var_7_9 = gui.notification("Wuyan.lua", var_7_8, nil, slot_0_0_0.notification_duration)

                gui.notify:add(var_7_9)
        end
end

slot_0_0_0.HITBOX_NAMES = {
        "head",
        "chest",
        "stomach",
        "left arm",
        "right arm",
        "left leg",
        "right leg"
}

events.event:add(slot_0_0_0.handle_hit_notification)

function slot_0_0_0.handle_killsay(arg_8_0)
        if not slot_0_0_0.killsay_enabled or arg_8_0:get_name() ~= "player_death" then
                return
        end

        local var_8_0 = arg_8_0:get_pawn_from_id("attacker")
        local var_8_1 = arg_8_0:get_pawn_from_id("userid")
        local var_8_2 = entities.get_local_pawn()

        if not var_8_0 or not var_8_1 or not var_8_2 or var_8_0 ~= var_8_2 or not var_8_1:is_enemy() then
                return
        end

        local var_8_3 = var_8_1:get_name() or "unknown"
        local var_8_4 = slot_0_0_0.killsay_messages[math.random(1, #slot_0_0_0.killsay_messages)]:gsub("@{player}", var_8_3)

        game.engine:client_cmd("say " .. var_8_4)
end

events.event:add(slot_0_0_0.handle_killsay)

function slot_0_0_0.show_welcome_notification()
        local var_9_0 = gui.ctx.user and gui.ctx.user.username or "Unknown"
        local var_9_1 = string.format("Welcome %s to Wuyan.lua", var_9_0)
        local var_9_2 = gui.notification("Wuyan.lua", var_9_1, nil, slot_0_0_0.notification_duration)

        gui.notify:add(var_9_2)
end

slot_0_0_0.show_welcome_notification()
