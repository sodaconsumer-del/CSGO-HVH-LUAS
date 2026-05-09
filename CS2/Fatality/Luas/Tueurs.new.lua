--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
        elements_initialized = false,
        sound_played = false,
        elapsed_time = 0,
        is_in_game = false,
        active = true,
        streams = {},
        hud_elements = {},
        font_rain = draw.font_gdi("Consolas", 16, draw.font_flags.bold),
        font_title = draw.font_gdi("Arial Unicode MS", 48, draw.font_flags.bold),
        font_subtitle = draw.font_gdi("Arial Unicode MS", 32, 0),
        font_dev = draw.font_gdi("Arial Unicode MS", 24, 0),
        font_small = draw.font_gdi("Arial Unicode MS", 14, 0)
}
slot_0_1_0 = {
        blockbot_enable = false
}
slot_0_2_0 = {
        minesweeper_difficulty = 2,
        chess_difficulty = 2,
        snake_enable = false,
        minesweeper_enable = false,
        chess_enable = false,
        snake_difficulty = 2,
        snake_window = {
                dragging = false,
                w = 450,
                drag_oy = 0,
                drag_ox = 0,
                open = false,
                h = 550,
                x = 100,
                y = 100
        },
        minesweeper_window = {
                dragging = false,
                w = 400,
                drag_oy = 0,
                drag_ox = 0,
                open = false,
                h = 500,
                x = 150,
                y = 150
        },
        chess_window = {
                dragging = false,
                w = 500,
                drag_oy = 0,
                drag_ox = 0,
                open = false,
                h = 600,
                x = 200,
                y = 200
        },
        animation_test = {
                current_animation = 1,
                enabled = false,
                animations = {
                        {
                                name = "Matrix Decode",
                                type = 1
                        },
                        {
                                name = "Terminal Boot",
                                type = 2
                        },
                        {
                                name = "Security Scan",
                                type = 3
                        },
                        {
                                name = "Neon Pulse",
                                type = 4
                        },
                        {
                                name = "Clean Fade",
                                type = 5
                        },
                        {
                                name = "VHS Retro",
                                type = 6
                        },
                        {
                                name = "Card Slide",
                                type = 7
                        }
                }
        },
        snake = {
                move_delay = 0.15,
                game_over = false,
                cell_size = 20,
                score = 0,
                grid_size = 20,
                last_move = 0,
                snake_body = {
                        {
                                x = 10,
                                y = 10
                        }
                },
                direction = {
                        x = 1,
                        y = 0
                },
                food = {
                        x = 15,
                        y = 10
                }
        },
        minesweeper = {
                first_click = true,
                won = false,
                game_over = false,
                cell_size = 25,
                mines_count = 15,
                grid_h = 10,
                grid_w = 10,
                grid = {},
                revealed = {},
                flagged = {}
        },
        chess = {
                game_over = false,
                cell_size = 40,
                ai_start_time = 0,
                current_turn = 1,
                last_move = nil,
                player_color = 1,
                ai_thinking = false,
                board = {}
        }
}

function slot_0_3_0()
        local var_1_0 = entities and entities.get_local_pawn and entities.get_local_pawn() or nil

        if not var_1_0 then
                return "General"
        end

        local var_1_1 = var_1_0.get_active_weapon and var_1_0:get_active_weapon() or nil

        if not var_1_1 then
                return "General"
        end

        local var_1_2 = var_1_1.get_type and var_1_1:get_type() or nil

        if var_1_2 and csweapon_type and (var_1_2 == csweapon_type.knife or var_1_2 == csweapon_type.grenade or var_1_2 == csweapon_type.c4) then
                return "General"
        end

        local var_1_3 = ""

        if var_1_1.get_name then
                var_1_3 = var_1_1:get_name()
        end

        if (not var_1_3 or var_1_3 == "") and var_1_1.get_class_name then
                var_1_3 = var_1_1:get_class_name()
        end

        local var_1_4 = string.lower(var_1_3)

        if var_1_4:find("ssg08") then
                return "SSG-08"
        elseif var_1_4:find("awp") then
                return "AWP"
        elseif var_1_4:find("scar20") or var_1_4:find("g3sg1") then
                return "Auto Snipers"
        elseif var_1_4:find("deagle") then
                return "Desert Eagle"
        elseif var_1_4:find("revolver") then
                return "R8 Revolver"
        elseif var_1_4:find("elite") then
                return "Dual Berettas"
        elseif var_1_4:find("tec9") then
                return "Tec-9"
        elseif var_1_4:find("ak47") then
                return "AK-47"
        elseif var_1_4:find("m4a1") or var_1_4:find("m4a4") then
                return "M4A4 / M4A1-S"
        elseif var_1_4:find("glock") then
                return "Glock-18"
        elseif var_1_4:find("usp") or var_1_4:find("hkp2000") then
                return "USP-S"
        elseif var_1_4:find("p250") or var_1_4:find("fiveseven") or var_1_4:find("cz75") then
                return "Pistols"
        else
                return "General"
        end
end

function slot_0_4_0(arg_2_0)
        if not arg_2_0 then
                return false
        end

        if arg_2_0.get_hotkey_state and type(arg_2_0.get_hotkey_state) == "function" then
                return arg_2_0:get_hotkey_state()
        end

        return false
end

slot_0_5_0 = nil

if gui and gui.ctx and gui.ctx.find then
        slot_0_5_0 = gui.ctx:find("lua>elements b")

        if not slot_0_5_0 then
                slot_0_6_1 = gui.ctx:find("lua")

                if slot_0_6_1 then
                        slot_0_5_0 = gui.group_box(gui.control_id("elements_b"), "Elements B")

                        slot_0_6_1:add(slot_0_5_0)
                end
        end
end

slot_0_6_0 = nil

if gui and gui.checkbox and gui.control_id then
        slot_0_6_0 = gui.checkbox(gui.control_id("bbot_enable"))
end

if slot_0_5_0 and slot_0_6_0 then
        slot_0_5_0:add(gui.make_control("Blockbot (put bind)", slot_0_6_0))
        slot_0_5_0:reset()
end

function slot_0_7_0(arg_3_0, arg_3_1, arg_3_2)
        return arg_3_0 + (arg_3_1 - arg_3_0) * arg_3_2
end

function slot_0_8_0(arg_4_0)
        return 1 - (1 - arg_4_0)^5
end

slot_0_9_0 = {}
slot_0_10_0 = {}
slot_0_11_0 = {}
slot_0_12_0 = {}
slot_0_13_0 = {}
slot_0_14_0 = {}

function slot_0_15_0()
        local var_5_0 = {
                rage = {
                        scout = "rage>weapon>SSG-08>weapon>mindamage",
                        awp = "rage>weapon>AWP>weapon>mindamage",
                        ssg08 = "rage>weapon>SSG-08>weapon>mindamage",
                        deagle = "rage>weapon>Desert Eagle>weapon>mindamage",
                        teco = "rage>weapon>Tec-9>weapon>mindamage",
                        r8 = "rage>weapon>R8 Revolver>weapon>mindamage"
                },
                legit = {
                        scout = "legit>weapon>SSG-08>trigger>mindamage",
                        awp = "legit>weapon>AWP>trigger>mindamage",
                        ssg08 = "legit>weapon>SSG-08>trigger>mindamage",
                        deagle = "legit>weapon>Desert Eagle>trigger>mindamage",
                        teco = "legit>weapon>Tec-9>trigger>mindamage",
                        r8 = "legit>weapon>R8 Revolver>trigger>mindamage"
                }
        }

        if gui and gui.ctx and gui.ctx.find then
                for iter_5_0, iter_5_1 in pairs(var_5_0.rage) do
                        slot_0_9_0[iter_5_0] = gui.ctx:find(iter_5_1)
                end

                for iter_5_2, iter_5_3 in pairs(var_5_0.legit) do
                        slot_0_10_0[iter_5_2] = gui.ctx:find(iter_5_3)
                end
        end
end

function slot_0_16_0(arg_6_0)
        if arg_6_0 and arg_6_0.get_value and arg_6_0:get_value().get then
                return tonumber(arg_6_0:get_value():get())
        end

        return nil
end

function slot_0_17_0(arg_7_0, arg_7_1, arg_7_2)
        local var_7_0 = arg_7_0 and slot_0_9_0[arg_7_1] or slot_0_10_0[arg_7_1]

        if var_7_0 and var_7_0:get_value() and var_7_0:get_value().set then
                var_7_0:get_value():set(arg_7_2)
        end
end

function slot_0_18_0(arg_8_0, arg_8_1)
        local var_8_0 = arg_8_0 and slot_0_11_0 or slot_0_12_0
        local var_8_1 = arg_8_0 and slot_0_9_0[arg_8_1] or slot_0_10_0[arg_8_1]

        if var_8_0[arg_8_1] == nil then
                var_8_0[arg_8_1] = slot_0_16_0(var_8_1)
        end
end

function slot_0_19_0(arg_9_0, arg_9_1)
        local var_9_0 = arg_9_0 and slot_0_13_0 or slot_0_14_0
        local var_9_1 = arg_9_0 and slot_0_11_0 or slot_0_12_0

        if var_9_0[arg_9_1] and var_9_1[arg_9_1] ~= nil then
                slot_0_17_0(arg_9_0, arg_9_1, var_9_1[arg_9_1])
        end

        var_9_0[arg_9_1] = nil
        var_9_1[arg_9_1] = nil
end

function slot_0_20_0()
        if not hvh.automd and not hvh.automd_legit then
                for iter_10_0, iter_10_1 in pairs(slot_0_9_0) do
                        slot_0_19_0(true, iter_10_0)
                end

                for iter_10_2, iter_10_3 in pairs(slot_0_10_0) do
                        slot_0_19_0(false, iter_10_2)
                end

                return
        end

        if not next(slot_0_9_0) and not next(slot_0_10_0) then
                slot_0_15_0()
        end

        local var_10_0 = entities.get_local_pawn()

        if not var_10_0 or not var_10_0:is_alive() then
                return
        end

        local var_10_1
        local var_10_2

        for iter_10_4, iter_10_5 in ipairs(hvh.waypoints) do
                if iter_10_5.map == game.global_vars.map_name and iter_10_5.pos and var_10_0:get_abs_origin():dist(iter_10_5.pos) < 50 then
                        var_10_1, var_10_2 = true, iter_10_5

                        break
                end
        end

        if var_10_1 and var_10_2 and var_10_2.min_damage then
                for iter_10_6, iter_10_7 in pairs(var_10_2.min_damage) do
                        if iter_10_7 and iter_10_7 > 0 then
                                if hvh.automd and slot_0_9_0[iter_10_6] then
                                        slot_0_18_0(true, iter_10_6)
                                        slot_0_17_0(true, iter_10_6, iter_10_7)

                                        slot_0_13_0[iter_10_6] = true
                                end

                                if hvh.automd_legit and slot_0_10_0[iter_10_6] then
                                        slot_0_18_0(false, iter_10_6)
                                        slot_0_17_0(false, iter_10_6, iter_10_7)

                                        slot_0_14_0[iter_10_6] = true
                                end
                        end
                end
        else
                for iter_10_8, iter_10_9 in pairs(slot_0_9_0) do
                        slot_0_19_0(true, iter_10_8)
                end

                for iter_10_10, iter_10_11 in pairs(slot_0_10_0) do
                        slot_0_19_0(false, iter_10_10)
                end
        end
end

function slot_0_21_0()
        if not hvh.ia_md then
                return
        end

        if not next(slot_0_9_0) then
                slot_0_15_0()
        end

        local var_11_0 = entities.get_local_pawn()

        if not var_11_0 or not var_11_0:is_alive() then
                return
        end

        local var_11_1
        local var_11_2 = 1000000000

        entities.players:for_each(function(arg_12_0)
                if arg_12_0.entity and arg_12_0.entity:is_alive() and arg_12_0.entity:is_enemy() then
                        local var_12_0 = var_11_0:get_abs_origin():dist(arg_12_0.entity:get_abs_origin())

                        if var_12_0 > 1 and var_12_0 < var_11_2 then
                                var_11_2, var_11_1 = var_12_0, arg_12_0.entity
                        end
                end
        end)

        if var_11_1 and var_11_2 <= hvh.ia_md_dist then
                local var_11_3 = var_11_1.m_iHealth:get()

                for iter_11_0, iter_11_1 in pairs(slot_0_9_0) do
                        slot_0_18_0(true, iter_11_0)
                        slot_0_17_0(true, iter_11_0, var_11_3)

                        slot_0_13_0[iter_11_0] = true
                end
        end
end

events.create_move:add(function(arg_13_0)
        if not hvh.js_fastladder then
                return
        end

        local var_13_0 = entities.get_local_pawn()

        if var_13_0 == nil then
                return
        end

        local var_13_1 = var_13_0:get_abs_velocity()

        if var_13_1.x ~= 0 and var_13_1.y ~= 0 then
                return
        end

        if var_13_0.m_fFlags:get() ~= 65664 then
                return
        end

        if arg_13_0:get_forwardmove() <= 0 then
                return
        end

        local var_13_2 = arg_13_0:get_viewangles()

        var_13_2.y = var_13_2.y + 45

        arg_13_0:set_viewangles(var_13_2)
        arg_13_0:set_leftmove(-1)
end)

function slot_0_22_0()
        if not hvh.show_coords then
                return
        end

        local var_14_0 = entities.get_local_pawn()

        if not var_14_0 or not var_14_0:is_alive() then
                return
        end

        local var_14_1 = var_14_0:get_abs_origin()

        print(string.format("map=%s;x=%.2f;y=%.2f;z=%.2f;ssg08=12;scout=12;teco=7;awp=20;r8=7;deagle=2;", game.global_vars.map_name, var_14_1.x, var_14_1.y, var_14_1.z))
end

function slot_0_23_0()
        if not hvh.warn_on then
                return
        end

        local var_15_0 = game.global_vars.real_time or 0

        if var_15_0 - (hvh.warn_last or 0) < (hvh.warn_cd or 0) then
                return
        end

        local var_15_1 = entities.get_local_pawn()

        if not var_15_1 or not var_15_1:is_alive() then
                return
        end

        local var_15_2 = game.global_vars.map_name

        for iter_15_0, iter_15_1 in ipairs(hvh.waypoints) do
                if iter_15_1.map == var_15_2 and iter_15_1.pos and (function(arg_16_0)
                        local var_16_0 = false

                        entities.players:for_each(function(arg_17_0)
                                if not var_16_0 and arg_17_0.entity and arg_17_0.entity:is_alive() and arg_17_0.entity:is_enemy() and arg_17_0.entity:get_abs_origin():dist(arg_16_0) < 50 then
                                        var_16_0 = true
                                end
                        end)

                        return var_16_0 and "enemy" or nil
                end)(iter_15_1.pos) == "enemy" then
                        local var_15_3 = iter_15_0 % 2 == 1 and iter_15_0 + 1 or iter_15_0 - 1
                        local var_15_4 = hvh.waypoints[var_15_3]

                        if var_15_4 and var_15_4.map == var_15_2 and var_15_4.pos and var_15_1:get_abs_origin():dist(var_15_4.pos) <= hvh.warn_dist then
                                hvh.warn_last = var_15_0

                                game.engine:client_cmd("play ui/beep07")

                                break
                        end
                end
        end

        if y and cy then
                G.tab_heights = G.tab_heights or {}
                G.tab_heights.Games = math.max(0, cy - y + 20)
        end
end

slot_0_24_0 = nil

function slot_0_25_0()
        local var_18_0 = entities.get_local_pawn()

        if not var_18_0 or not var_18_0:is_alive() then
                slot_0_24_0 = nil

                return
        end

        local var_18_1 = var_18_0:get_abs_origin()
        local var_18_2 = 1000000000

        entities.players:for_each(function(arg_19_0)
                local var_19_0 = arg_19_0.entity

                if var_19_0 and var_19_0:is_alive() and var_19_0:is_enemy() then
                        local var_19_1 = var_19_0:get_abs_origin():dist(var_18_1)

                        if var_19_1 > 1 and var_19_1 < var_18_2 then
                                var_18_2 = var_19_1
                                slot_0_24_0 = var_19_0
                        end
                end
        end)
end

function slot_0_26_0(arg_20_0)
        while arg_20_0 > 180 do
                arg_20_0 = arg_20_0 - 360
        end

        while arg_20_0 < -180 do
                arg_20_0 = arg_20_0 + 360
        end

        return arg_20_0
end

function slot_0_27_0(arg_21_0, arg_21_1)
        local var_21_0 = arg_21_1.x - arg_21_0.x
        local var_21_1 = arg_21_1.y - arg_21_0.y
        local var_21_2 = math.deg(math.atan2(var_21_1, var_21_0))

        return slot_0_26_0(var_21_2)
end

events.create_move:add(function(arg_22_0)
        if not slot_0_6_0 or not slot_0_6_0:get_value():get() then
                return
        end

        local var_22_0 = entities.get_local_pawn()

        if not var_22_0 or not var_22_0:is_alive() then
                return
        end

        slot_0_25_0()

        local var_22_1 = slot_0_24_0

        if not var_22_1 or not var_22_1:is_alive() then
                return
        end

        local var_22_2 = var_22_0:get_abs_origin()
        local var_22_3 = var_22_1:get_abs_origin()
        local var_22_4 = game.input:get_view_angles()
        local var_22_5 = slot_0_27_0(var_22_2, var_22_3)
        local var_22_6 = slot_0_26_0(var_22_5 - var_22_4.y)

        if var_22_6 < -2 then
                arg_22_0:set_leftmove(-1)
        elseif var_22_6 > 2 then
                arg_22_0:set_leftmove(1)
        else
                arg_22_0:set_leftmove(0)
        end

        arg_22_0:set_forwardmove(0.6)
end)

slot_0_28_1 = {
        override_fwd = "rage>anti-aim>angles>manual override>override forward",
        override_right = "rage>anti-aim>angles>manual override>override right",
        override_left = "rage>anti-aim>angles>manual override>override left",
        yaw_offset = "rage>anti-aim>angles>yaw>settings>amount",
        override_back = "rage>anti-aim>angles>manual override>override back"
}
slot_0_29_1 = gui.ctx:find(slot_0_28_1.yaw_offset)
slot_0_30_1 = gui.ctx:find(slot_0_28_1.override_left)
slot_0_31_1 = gui.ctx:find(slot_0_28_1.override_right)
slot_0_32_1 = gui.ctx:find(slot_0_28_1.override_fwd)
slot_0_33_1 = gui.ctx:find(slot_0_28_1.override_back)
slot_0_34_1 = gui.ctx:find("lua>elements a") or gui.ctx:find("rage>anti-aim>angles")
slot_0_35_1 = {
        enable = gui.checkbox(gui.control_id("mi.enable")),
        size = gui.slider(gui.control_id("mi.size"), 5, 150, {
                "%.0fpx"
        }, 1),
        shape = gui.combo_box(gui.control_id("mi.shape")),
        anim_style = gui.combo_box(gui.control_id("mi.anim_style")),
        anim_easing = gui.combo_box(gui.control_id("mi.anim_easing")),
        indicator_color = gui.color_picker(gui.control_id("mi.indicator_color")),
        background_color = gui.color_picker(gui.control_id("mi.background_color")),
        rainbow = gui.checkbox(gui.control_id("mi.rainbow")),
        enable_glow = gui.checkbox(gui.control_id("mi.enable_glow")),
        enable_glitch = gui.checkbox(gui.control_id("mi.enable_glitch"))
}
slot_0_36_1 = {
        "Arc",
        "Arrow",
        "Triangle",
        "Pointer"
}
slot_0_37_1 = {
        "Fade",
        "Fall",
        "Zoom"
}
slot_0_38_1 = {
        "Slow",
        "Default",
        "Fast",
        "Instant"
}

for iter_0_0, iter_0_1 in ipairs(slot_0_36_1) do
        slot_0_35_1.shape:add(gui.selectable(gui.control_id("mi.shape." .. iter_0_1), iter_0_1))
end

for iter_0_2, iter_0_3 in ipairs(slot_0_37_1) do
        slot_0_35_1.anim_style:add(gui.selectable(gui.control_id("mi.astyle." .. iter_0_3), iter_0_3))
end

for iter_0_4, iter_0_5 in ipairs(slot_0_38_1) do
        slot_0_35_1.anim_easing:add(gui.selectable(gui.control_id("mi.aeasing." .. iter_0_5), iter_0_5))
end

if slot_0_35_1.enable and slot_0_35_1.enable:get_value() then
        slot_0_35_1.enable:get_value():set(false)
end

if slot_0_34_1 then
        slot_0_34_1:add(gui.make_control("Enable Manual Indicator", slot_0_35_1.enable))
        slot_0_34_1:add(gui.make_control("Indicator Size", slot_0_35_1.size))
        slot_0_34_1:add(gui.make_control("Indicator Shape", slot_0_35_1.shape))
        slot_0_34_1:add(gui.make_control("Animation Style", slot_0_35_1.anim_style))
        slot_0_34_1:add(gui.make_control("Animation Easing", slot_0_35_1.anim_easing))
        slot_0_34_1:add(gui.make_control("Indicator Color", slot_0_35_1.indicator_color))
        slot_0_34_1:add(gui.make_control("Background Color", slot_0_35_1.background_color))
        slot_0_34_1:add(gui.make_control("Rainbow Indicator", slot_0_35_1.rainbow))
        slot_0_34_1:add(gui.make_control("Enable Glow Effect", slot_0_35_1.enable_glow))
        slot_0_34_1:add(gui.make_control("Enable Glitch Effect", slot_0_35_1.enable_glitch))
        slot_0_34_1:reset()
end

slot_0_35_1.enable:get_value():set(false)
slot_0_35_1.size:get_value():set(50)
slot_0_35_1.shape:get_value():get():set_raw(1)
slot_0_35_1.anim_style:get_value():get():set_raw(2)
slot_0_35_1.anim_easing:get_value():get():set_raw(2)
slot_0_35_1.indicator_color:get_value():set(draw.color("#00e7dbff"))
slot_0_35_1.background_color:get_value():set(draw.color("#34343478"))
slot_0_35_1.rainbow:get_value():set(false)
slot_0_35_1.enable_glow:get_value():set(false)
slot_0_35_1.enable_glitch:get_value():set(false)

function slot_0_39_1(arg_23_0, arg_23_1)
        local var_23_0 = arg_23_0:get_value():get():get_raw()

        for iter_23_0 = 0, arg_23_1 - 1 do
                if bit.band(var_23_0, bit.lshift(1, iter_23_0)) > 0 then
                        return iter_23_0 + 1
                end
        end

        return 1
end

function slot_0_40_1(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5, arg_24_6, arg_24_7)
        local var_24_0 = draw.surface
        local var_24_1 = (arg_24_5 - arg_24_4) / arg_24_6
        local var_24_2 = arg_24_2 - arg_24_3 / 2
        local var_24_3 = arg_24_2 + arg_24_3 / 2

        for iter_24_0 = 0, arg_24_6 - 1 do
                local var_24_4 = math.rad(arg_24_4 + iter_24_0 * var_24_1)
                local var_24_5 = math.rad(arg_24_4 + (iter_24_0 + 1) * var_24_1)
                local var_24_6 = draw.vec2(arg_24_0 + math.cos(var_24_4) * var_24_3, arg_24_1 + math.sin(var_24_4) * var_24_3)
                local var_24_7 = draw.vec2(arg_24_0 + math.cos(var_24_5) * var_24_3, arg_24_1 + math.sin(var_24_5) * var_24_3)
                local var_24_8 = draw.vec2(arg_24_0 + math.cos(var_24_4) * var_24_2, arg_24_1 + math.sin(var_24_4) * var_24_2)
                local var_24_9 = draw.vec2(arg_24_0 + math.cos(var_24_5) * var_24_2, arg_24_1 + math.sin(var_24_5) * var_24_2)

                var_24_0:add_quad_filled(var_24_6, var_24_7, var_24_9, var_24_8, arg_24_7)
        end
end

function slot_0_41_1(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
        local var_25_0 = draw.surface
        local var_25_1 = math.rad(arg_25_3)
        local var_25_2 = math.rad(35)
        local var_25_3 = draw.vec2(arg_25_0 + math.cos(var_25_1) * arg_25_2, arg_25_1 + math.sin(var_25_1) * arg_25_2)
        local var_25_4 = draw.vec2(arg_25_0 + math.cos(var_25_1 + var_25_2) * (arg_25_2 - arg_25_4), arg_25_1 + math.sin(var_25_1 + var_25_2) * (arg_25_2 - arg_25_4))
        local var_25_5 = draw.vec2(arg_25_0 + math.cos(var_25_1 - var_25_2) * (arg_25_2 - arg_25_4), arg_25_1 + math.sin(var_25_1 - var_25_2) * (arg_25_2 - arg_25_4))
        local var_25_6 = draw.vec2(arg_25_0 + math.cos(var_25_1) * (arg_25_2 - arg_25_4 * 0.8), arg_25_1 + math.sin(var_25_1) * (arg_25_2 - arg_25_4 * 0.8))

        var_25_0:add_triangle_filled(var_25_3, var_25_4, var_25_6, arg_25_5)
        var_25_0:add_triangle_filled(var_25_3, var_25_5, var_25_6, arg_25_5)
end

function slot_0_42_1(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4, arg_26_5)
        local var_26_0 = draw.surface
        local var_26_1 = math.rad(arg_26_3)
        local var_26_2 = math.rad(30)
        local var_26_3 = draw.vec2(arg_26_0 + math.cos(var_26_1) * arg_26_2, arg_26_1 + math.sin(var_26_1) * arg_26_2)
        local var_26_4 = draw.vec2(arg_26_0 + math.cos(var_26_1 + var_26_2) * (arg_26_2 - arg_26_4), arg_26_1 + math.sin(var_26_1 + var_26_2) * (arg_26_2 - arg_26_4))
        local var_26_5 = draw.vec2(arg_26_0 + math.cos(var_26_1 - var_26_2) * (arg_26_2 - arg_26_4), arg_26_1 + math.sin(var_26_1 - var_26_2) * (arg_26_2 - arg_26_4))

        var_26_0:add_triangle_filled(var_26_3, var_26_4, var_26_5, arg_26_5)
end

function slot_0_43_1(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5)
        local var_27_0 = draw.surface
        local var_27_1 = math.rad(arg_27_3)
        local var_27_2 = math.pi / 2
        local var_27_3 = draw.vec2(arg_27_0 + math.cos(var_27_1) * arg_27_2, arg_27_1 + math.sin(var_27_1) * arg_27_2)
        local var_27_4 = draw.vec2(arg_27_0 + math.cos(var_27_1 + var_27_2) * arg_27_4, arg_27_1 + math.sin(var_27_1 + var_27_2) * arg_27_4)
        local var_27_5 = draw.vec2(arg_27_0 + math.cos(var_27_1 - var_27_2) * arg_27_4, arg_27_1 + math.sin(var_27_1 - var_27_2) * arg_27_4)

        var_27_0:add_triangle_filled(var_27_3, var_27_4, var_27_5, arg_27_5)
end

function slot_0_44_1()
        if slot_0_30_1 and (slot_0_30_1:get_hotkey_state() or slot_0_30_1:get_value():get_direct()) then
                return "left"
        end

        if slot_0_31_1 and (slot_0_31_1:get_hotkey_state() or slot_0_31_1:get_value():get_direct()) then
                return "right"
        end

        if slot_0_33_1 and (slot_0_33_1:get_hotkey_state() or slot_0_33_1:get_value():get_direct()) then
                return "back"
        end

        if slot_0_32_1 and (slot_0_32_1:get_hotkey_state() or slot_0_32_1:get_value():get_direct()) then
                return "fwd"
        end

        if slot_0_29_1 and slot_0_29_1:get_hotkey_state() then
                local var_28_0 = slot_0_29_1:get_value():get()

                if var_28_0 > 0 then
                        return "left"
                elseif var_28_0 < 0 then
                        return "right"
                end
        end

        return "none"
end

slot_0_45_1 = {
        left = 180,
        back = 90,
        fwd = 270,
        right = 0
}
slot_0_46_1 = 0
slot_0_47_1 = 0
slot_0_48_1 = 50
slot_0_49_1 = 0
slot_0_50_1 = "none"

events.present_queue:add(function()
        if not slot_0_35_1.enable:get_value():get() then
                return
        end

        slot_29_0_0 = {
                "Arc",
                "Arrow",
                "Triangle",
                "Pointer"
        }
        slot_29_1_0 = {
                "Fade",
                "Fall",
                "Zoom"
        }
        slot_29_2_0 = {
                8,
                14,
                25,
                999
        }
        slot_29_3_0 = entities.get_local_pawn()

        if not slot_29_3_0 or not slot_29_3_0:is_alive() then
                slot_0_47_1 = 0

                return
        end

        slot_29_4_0 = slot_0_44_1()
        slot_29_5_0 = slot_0_39_1(slot_0_35_1.anim_easing, #slot_29_2_0)
        slot_29_6_0 = slot_0_39_1(slot_0_35_1.anim_style, #slot_29_1_0)
        slot_29_7_0 = slot_0_39_1(slot_0_35_1.shape, #slot_29_0_0)
        slot_29_8_0 = math.max(5, slot_0_35_1.size:get_value():get())
        slot_29_9_0 = slot_29_2_0[slot_29_5_0] or 14
        slot_29_10_0 = math.min(1, slot_29_9_0 * game.global_vars.frame_time)

        if slot_29_4_0 ~= "none" and slot_29_4_0 ~= slot_0_50_1 then
                if slot_29_1_0[slot_29_6_0] == "Fall" then
                        slot_0_49_1 = -40
                end

                if slot_29_1_0[slot_29_6_0] == "Zoom" then
                        slot_0_48_1 = slot_29_8_0 * 0.2
                end
        end

        slot_0_50_1 = slot_29_4_0
        slot_29_11_0 = slot_29_4_0 ~= "none" and 1 or 0
        slot_29_13_0 = (slot_0_45_1[slot_29_4_0] or slot_0_46_1) - slot_0_46_1

        if slot_29_13_0 > 180 then
                slot_29_13_0 = slot_29_13_0 - 360
        elseif slot_29_13_0 < -180 then
                slot_29_13_0 = slot_29_13_0 + 360
        end

        slot_0_46_1 = (slot_0_46_1 + slot_29_13_0 * slot_29_10_0 + 360) % 360
        slot_0_47_1 = slot_0_47_1 + (slot_29_11_0 - slot_0_47_1) * slot_29_10_0
        slot_0_49_1 = slot_0_49_1 + (0 - slot_0_49_1) * slot_29_10_0
        slot_0_48_1 = slot_0_48_1 + (slot_29_8_0 - slot_0_48_1) * slot_29_10_0

        if slot_0_47_1 < 0.01 then
                return
        end

        slot_29_14_0, slot_29_15_0 = game.engine:get_screen_size()
        slot_29_16_0 = slot_29_14_0 / 2
        slot_29_17_0 = slot_29_15_0 / 2 + slot_0_49_1
        slot_29_18_0 = slot_0_35_1.rainbow:get_value():get() and draw.color(0, 0, 0, 0) or slot_0_35_1.indicator_color:get_value():get():mod_a(slot_0_47_1)

        if slot_0_35_1.rainbow:get_value():get() then
                slot_29_19_1 = game.global_vars.real_time * 60 % 360
                slot_29_20_2 = draw.color(0, 0, 0):hsv(slot_29_19_1, 1, 1)
                slot_29_18_0 = draw.color(slot_29_20_2:get_r(), slot_29_20_2:get_g(), slot_29_20_2:get_b(), math.floor(255 * slot_0_47_1))
        end

        function slot_29_19_0(arg_30_0, arg_30_1, arg_30_2)
                local var_30_0 = slot_29_16_0 + (arg_30_0 or 0)
                local var_30_1 = slot_29_17_0 + (arg_30_1 or 0)

                if slot_29_0_0[slot_29_7_0] == "Arc" then
                        local var_30_2 = slot_0_35_1.background_color:get_value():get():mod_a(arg_30_2:get_a() / 255 * 0.7)

                        slot_0_40_1(var_30_0, var_30_1, slot_0_48_1, 8, 0, 360, 64, var_30_2)
                        slot_0_40_1(var_30_0, var_30_1, slot_0_48_1, 8, slot_0_46_1 - 45, slot_0_46_1 + 45, 32, arg_30_2)
                elseif slot_29_0_0[slot_29_7_0] == "Arrow" then
                        slot_0_41_1(var_30_0, var_30_1, slot_0_48_1, slot_0_46_1, slot_0_48_1 * 0.4, arg_30_2)
                elseif slot_29_0_0[slot_29_7_0] == "Triangle" then
                        slot_0_42_1(var_30_0, var_30_1, slot_0_48_1, slot_0_46_1, slot_0_48_1 * 0.5, arg_30_2)
                else
                        slot_0_43_1(var_30_0, var_30_1, slot_0_48_1, slot_0_46_1, 3, arg_30_2)
                end
        end

        if slot_0_35_1.enable_glitch:get_value():get() then
                slot_29_20_1 = slot_29_18_0:get_r()
                slot_29_21_0 = slot_29_18_0:get_g()
                slot_29_22_0 = slot_29_18_0:get_b()
                slot_29_23_0 = slot_29_18_0:get_a()
                slot_29_24_1 = 2 + math.sin(game.global_vars.real_time * 20) * 2

                slot_29_19_0(slot_29_24_1, 0, draw.color(slot_29_20_1, 0, 0, slot_29_23_0 * 0.5))
                slot_29_19_0(-slot_29_24_1, 0, draw.color(0, 0, slot_29_22_0, slot_29_23_0 * 0.5))
                slot_29_19_0(0, 0, draw.color(slot_29_20_1, slot_29_21_0, slot_29_22_0, slot_29_23_0))
        elseif slot_0_35_1.enable_glow:get_value():get() then
                slot_29_20_0 = 5

                for iter_29_0 = slot_29_20_0, 1, -1 do
                        slot_29_25_0 = slot_29_18_0:get_a() / (slot_29_20_0 * 2.5)
                        slot_29_26_0 = slot_29_18_0:mod_a(slot_29_25_0 / 255)

                        if slot_29_0_0[slot_29_7_0] == "Arc" then
                                slot_0_40_1(slot_29_16_0, slot_29_17_0, slot_0_48_1, 8 + iter_29_0 * 2, slot_0_46_1 - 45, slot_0_46_1 + 45, 32, slot_29_26_0)
                        else
                                slot_29_19_0(0, 0, slot_29_26_0)
                        end
                end

                slot_29_19_0(0, 0, slot_29_18_0)
        else
                slot_29_19_0(0, 0, slot_29_18_0)
        end
end)

function slot_0_28_0(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4)
        draw.surface.font = arg_31_3

        draw.surface:add_text(draw.vec2(arg_31_1, arg_31_2), arg_31_0, arg_31_4)
end

function slot_0_29_0()
        if slot_0_0_0.elements_initialized then
                return
        end

        local var_32_0, var_32_1 = game.engine:get_screen_size()

        slot_0_0_0.hud_elements = {
                {
                        duration = 0.5,
                        start_time = 2.5,
                        type = "line",
                        p1 = {
                                x = 50,
                                y = 50
                        },
                        p2 = {
                                x = 200,
                                y = 50
                        }
                },
                {
                        duration = 0.5,
                        start_time = 2.5,
                        type = "line",
                        p1 = {
                                x = 50,
                                y = 50
                        },
                        p2 = {
                                x = 50,
                                y = 200
                        }
                },
                {
                        duration = 0.5,
                        start_time = 2.6,
                        type = "line",
                        p1 = {
                                y = 50,
                                x = var_32_0 - 50
                        },
                        p2 = {
                                y = 50,
                                x = var_32_0 - 200
                        }
                },
                {
                        duration = 0.5,
                        start_time = 2.6,
                        type = "line",
                        p1 = {
                                y = 50,
                                x = var_32_0 - 50
                        },
                        p2 = {
                                y = 200,
                                x = var_32_0 - 50
                        }
                },
                {
                        duration = 0.5,
                        start_time = 2.7,
                        type = "line",
                        p1 = {
                                x = 50,
                                y = var_32_1 - 50
                        },
                        p2 = {
                                x = 200,
                                y = var_32_1 - 50
                        }
                },
                {
                        duration = 0.5,
                        start_time = 2.7,
                        type = "line",
                        p1 = {
                                x = 50,
                                y = var_32_1 - 50
                        },
                        p2 = {
                                x = 50,
                                y = var_32_1 - 200
                        }
                },
                {
                        duration = 0.5,
                        start_time = 2.8,
                        type = "line",
                        p1 = {
                                x = var_32_0 - 50,
                                y = var_32_1 - 50
                        },
                        p2 = {
                                x = var_32_0 - 200,
                                y = var_32_1 - 50
                        }
                },
                {
                        duration = 0.5,
                        start_time = 2.8,
                        type = "line",
                        p1 = {
                                x = var_32_0 - 50,
                                y = var_32_1 - 50
                        },
                        p2 = {
                                x = var_32_0 - 50,
                                y = var_32_1 - 200
                        }
                },
                {
                        duration = 1,
                        start_time = 3,
                        text = "> LOADING THE BEST LUA...",
                        type = "text",
                        pos = {
                                x = 50,
                                y = var_32_1 - 30
                        }
                },
                {
                        duration = 1,
                        start_time = 3.2,
                        text = "> AUTHENTICATING USER...",
                        type = "text",
                        pos = {
                                y = 30,
                                x = var_32_0 - 250
                        }
                }
        }
        slot_0_0_0.elements_initialized = true
end

function slot_0_30_0(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4, arg_33_5, arg_33_6)
        if not slot_0_0_0.active then
                return
        end

        if not slot_0_0_0.start_time then
                slot_0_0_0.is_in_game = game.engine:in_game()
                slot_0_0_0.start_time = game.global_vars.real_time
        end

        slot_0_0_0.elapsed_time = game.global_vars.real_time - slot_0_0_0.start_time
        slot_33_7_0, slot_33_8_0 = game.engine:get_screen_size()
        slot_33_9_0 = slot_0_0_0.elapsed_time
        slot_33_10_0 = 1

        if slot_0_2_0.animation_test.enabled then
                slot_33_10_0 = slot_0_2_0.animation_test.animations[slot_0_2_0.animation_test.current_animation].type
        elseif gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
                slot_33_11_12 = gui.ctx.user.username
                slot_33_10_0 = slot_33_11_12 == "LukinhasMenu" and 10 or slot_33_11_12 == "victorcxz" and 7 or slot_33_11_12 == "BrayHax" and 8 or 1
        end

        if slot_33_10_0 == 1 then
                slot_0_29_0()

                slot_33_11_11 = 8.5

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(0, 5, 0, 255))

                slot_33_12_10 = math.floor(slot_33_7_0 / 16)

                if not slot_0_0_0.matrix_drops or #slot_0_0_0.matrix_drops ~= slot_33_12_10 then
                        slot_0_0_0.matrix_drops = {}

                        for iter_33_0 = 1, slot_33_12_10 do
                                slot_0_0_0.matrix_drops[iter_33_0] = math.random(-slot_33_8_0, 0)
                        end
                end

                draw.surface.font = slot_0_0_0.font_rain

                for iter_33_1 = 1, slot_33_12_10 do
                        slot_33_17_17 = (iter_33_1 - 1) * 16
                        slot_33_18_15 = slot_0_0_0.matrix_drops[iter_33_1]

                        for iter_33_2 = 0, 18 do
                                slot_33_23_9 = slot_33_18_15 - iter_33_2 * 16

                                if slot_33_23_9 < slot_33_8_0 and slot_33_23_9 > -16 then
                                        slot_33_24_7 = slot_0_0_0.charset:sub(math.random(1, #slot_0_0_0.charset), math.random(1, #slot_0_0_0.charset))
                                        slot_33_25_1 = iter_33_2 == 0 and 255 or math.floor(255 * (1 - iter_33_2 / 18))
                                        slot_33_26_2 = iter_33_2 == 0 and draw.color(200, 255, 200, slot_33_25_1) or draw.color(0, 255, 70, slot_33_25_1)

                                        draw.surface:add_text(draw.vec2(slot_33_17_17, slot_33_23_9), slot_33_24_7, slot_33_26_2)
                                end
                        end

                        if slot_33_9_0 < 6.5 then
                                slot_0_0_0.matrix_drops[iter_33_1] = slot_33_18_15 + math.random(15, 25)

                                if slot_33_8_0 < slot_0_0_0.matrix_drops[iter_33_1] - 300 then
                                        slot_0_0_0.matrix_drops[iter_33_1] = math.random(-200, -20)
                                end
                        end
                end

                slot_33_13_10 = slot_33_9_0 > 6.5 and slot_0_7_0(255, 0, (slot_33_9_0 - 6.5) / 2) or 255

                for iter_33_3, iter_33_4 in ipairs(slot_0_0_0.hud_elements) do
                        slot_33_19_11 = 0

                        if slot_33_9_0 > iter_33_4.start_time then
                                slot_33_19_11 = math.min(1, (slot_33_9_0 - iter_33_4.start_time) / iter_33_4.duration)
                        end

                        if iter_33_4.type == "line" then
                                slot_33_20_12 = draw.vec2(slot_0_7_0(iter_33_4.p1.x, iter_33_4.p2.x, slot_0_8_0(slot_33_19_11)), slot_0_7_0(iter_33_4.p1.y, iter_33_4.p2.y, slot_0_8_0(slot_33_19_11)))

                                draw.surface:add_line(draw.vec2(iter_33_4.p1.x, iter_33_4.p1.y), slot_33_20_12, draw.color(0, 255, 100, slot_33_13_10))
                        elseif iter_33_4.type == "text" then
                                slot_0_28_0(iter_33_4.text:sub(1, math.floor(slot_0_8_0(slot_33_19_11) * #iter_33_4.text)), iter_33_4.pos.x, iter_33_4.pos.y, slot_0_0_0.font_small, draw.color(0, 255, 100, math.floor(slot_33_13_10 * 0.75)))
                        end
                end

                if slot_33_9_0 > 4 then
                        slot_33_14_15 = gui.ctx.user and gui.ctx.user.username or "User"
                        slot_33_15_22 = "Welcome, " .. slot_33_14_15
                        slot_33_16_16 = "Loading Tueurs.lua..."
                        slot_33_17_15 = 15
                        slot_33_18_13 = slot_0_0_0.font_title:get_text_size(slot_33_15_22)
                        slot_33_19_10 = slot_33_7_0 / 2 - slot_33_18_13.x / 2
                        slot_33_20_11 = slot_33_8_0 / 2 - slot_33_18_13.y - slot_33_17_15
                        slot_33_21_8 = slot_0_0_0.font_subtitle:get_text_size(slot_33_16_16)
                        slot_33_22_7 = slot_33_7_0 / 2 - slot_33_21_8.x / 2
                        slot_33_23_8 = slot_33_20_11 + slot_33_18_13.y + slot_33_17_15

                        slot_0_30_0(slot_33_15_22, 4.5, 2, slot_0_0_0.font_title, slot_33_19_10, slot_33_20_11, draw.color(0, 255, 100, slot_33_13_10))
                        slot_0_30_0(slot_33_16_16, 5.5, 2, slot_0_0_0.font_subtitle, slot_33_22_7, slot_33_23_8, draw.color(0, 255, 100, slot_33_13_10))
                end

                if slot_33_11_11 < slot_33_9_0 then
                        if not slot_0_0_0.sound_played then
                                slot_33_14_14 = game and game.engine

                                if slot_33_14_14 and slot_33_14_14.client_cmd then
                                        slot_33_14_14:client_cmd("playvol buttons/button14 1.0; playvol ui/buttonclick 1.0; play ui/beep07")
                                end

                                slot_0_0_0.sound_played = true
                        end

                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 2 then
                slot_0_29_0()

                slot_33_11_10 = 10
                slot_33_12_9 = {
                        draw.color(255, 0, 255, 255),
                        draw.color(0, 255, 255, 255),
                        draw.color(255, 255, 0, 255),
                        draw.color(0, 255, 0, 255)
                }

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(10, 0, 20, 255))

                slot_33_13_9 = slot_0_7_0(0, 100, math.min(slot_33_9_0 * 2, 1))

                for iter_33_5 = 0, slot_33_7_0, 30 do
                        draw.surface:add_line(draw.vec2(iter_33_5, 0), draw.vec2(iter_33_5, slot_33_8_0), draw.color(100, 0, 150, slot_33_13_9))
                end

                for iter_33_6 = 0, slot_33_8_0, 30 do
                        draw.surface:add_line(draw.vec2(0, iter_33_6), draw.vec2(slot_33_7_0, iter_33_6), draw.color(100, 0, 150, slot_33_13_9))
                end

                slot_33_14_13 = {
                        "[SYSTEM] Initializing TUEURS Protocol...",
                        "[AUTH] Developer access granted - LUKINHAS_MENU",
                        "[SCAN] Checking environment variables...",
                        "[LOAD] Loading advanced modules...",
                        "[AI] Neural network online",
                        "[SECURITY] Quantum encryption enabled",
                        "[READY] System operational"
                }
                slot_33_15_21 = slot_33_8_0 / 2 - 100

                for iter_33_7, iter_33_8 in ipairs(slot_33_14_13) do
                        slot_33_21_7 = (iter_33_7 - 1) * 0.3

                        if slot_33_21_7 < slot_33_9_0 then
                                slot_33_22_6 = slot_33_9_0 - slot_33_21_7
                                slot_33_23_7 = slot_0_7_0(0, 255, math.min(slot_33_22_6 * 3, 1))
                                slot_33_24_6 = slot_33_12_9[(iter_33_7 - 1) % #slot_33_12_9 + 1]

                                slot_0_28_0(iter_33_8, 50, slot_33_15_21 + (iter_33_7 - 1) * 25, slot_0_0_0.font_small, slot_33_24_6:mod_a(slot_33_23_7))
                        end
                end

                if slot_33_9_0 > 2.5 then
                        slot_33_16_15 = slot_0_7_0(0, 255, math.min((slot_33_9_0 - 2.5) * 2, 1))
                        slot_33_17_12 = math.sin(slot_33_9_0 * 20) * 2
                        slot_33_18_12 = "TUEURS.DEV"

                        for iter_33_9 = 1, 3 do
                                slot_33_23_6 = (iter_33_9 - 1) * slot_33_17_12
                                slot_33_24_5 = slot_33_12_9[iter_33_9]

                                slot_0_28_0(slot_33_18_12, slot_33_7_0 / 2 - slot_0_0_0.font_title:get_text_size(slot_33_18_12).x / 2 + slot_33_23_6, slot_33_8_0 / 2 - 50, slot_0_0_0.font_title, slot_33_24_5:mod_a(slot_33_16_15 * (1 - (iter_33_9 - 1) * 0.3)))
                        end
                end

                if slot_33_9_0 > 4 then
                        slot_33_16_14 = slot_0_7_0(0, 200, math.min((slot_33_9_0 - 4) * 2, 1))
                        slot_33_17_11 = {
                                "function init_dev_mode() {",
                                "  enable_quantum_features();",
                                "  load_neural_networks();",
                                "  return SYSTEM_READY;",
                                "}"
                        }
                        slot_33_18_11 = slot_33_7_0 - 400
                        slot_33_19_8 = slot_33_8_0 / 2 - 50

                        for iter_33_10, iter_33_11 in ipairs(slot_33_17_11) do
                                slot_0_28_0(iter_33_11, slot_33_18_11, slot_33_19_8 + (iter_33_10 - 1) * 20, slot_0_0_0.font_small, draw.color(0, 255, 100, slot_33_16_14))
                        end
                end

                if slot_33_9_0 > 8 then
                        slot_33_16_13 = slot_0_7_0(0, 255, math.min((slot_33_9_0 - 8) * 3, 1))

                        slot_0_28_0("DEVELOPER MODE ACTIVATED", slot_33_7_0 / 2 - slot_0_0_0.font_subtitle:get_text_size("DEVELOPER MODE ACTIVATED").x / 2, slot_33_8_0 / 2 + 100, slot_0_0_0.font_subtitle, draw.color(255, 0, 255, slot_33_16_13))
                end

                if slot_33_11_10 < slot_33_9_0 then
                        if not slot_0_0_0.sound_played then
                                game.engine:client_cmd("play buttons/blip1")

                                slot_0_0_0.sound_played = true
                        end

                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 3 then
                slot_0_29_0()

                slot_33_11_9 = 6
                slot_33_12_8 = gui and gui.ctx and gui.ctx.user and gui.ctx.user.username or "User"
                slot_33_13_8 = slot_0_7_0(0, 200, math.min(slot_33_9_0 * 2, 1))

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(15, 15, 25, slot_33_13_8))

                if slot_33_9_0 > 0.5 then
                        slot_33_14_12 = slot_0_7_0(0, 100, math.min((slot_33_9_0 - 0.5) * 2, 1))

                        for iter_33_12 = 1, 20 do
                                slot_33_19_7 = iter_33_12 * 73 % slot_33_7_0
                                slot_33_20_9 = (iter_33_12 * 47 + slot_33_9_0 * 50) % slot_33_8_0
                                slot_33_21_6 = 1 + math.sin(slot_33_9_0 * 5 + iter_33_12) * 0.5

                                draw.surface:add_rect_filled(draw.rect(slot_33_19_7, slot_33_20_9, slot_33_19_7 + slot_33_21_6, slot_33_20_9 + slot_33_21_6), draw.color(100, 150, 255, slot_33_14_12))
                        end
                end

                if slot_33_9_0 > 1 then
                        slot_33_14_11 = slot_0_7_0(0, 255, math.min((slot_33_9_0 - 1) * 1.5, 1))
                        slot_33_15_20 = 1 + math.sin(slot_33_9_0 * 3) * 0.02
                        slot_33_16_12 = "TUEURS"
                        slot_33_17_10 = slot_0_0_0.font_title:get_text_size(slot_33_16_12)
                        slot_33_18_9 = draw.vec2(slot_33_17_10.x * slot_33_15_20, slot_33_17_10.y * slot_33_15_20)
                        slot_33_19_6 = slot_33_7_0 / 2 - slot_33_18_9.x / 2
                        slot_33_20_8 = slot_33_8_0 / 2 - slot_33_18_9.y / 2 - 30

                        for iter_33_13 = 3, 1, -1 do
                                slot_33_25_0 = slot_33_14_11 * (0.1 * iter_33_13)
                                slot_33_26_1 = iter_33_13 * 2
                                draw.surface.font = slot_0_0_0.font_title

                                draw.surface:add_text(draw.vec2(slot_33_19_6 - slot_33_26_1, slot_33_20_8), slot_33_16_12, draw.color(100, 150, 255, slot_33_25_0))
                                draw.surface:add_text(draw.vec2(slot_33_19_6 + slot_33_26_1, slot_33_20_8), slot_33_16_12, draw.color(100, 150, 255, slot_33_25_0))
                        end

                        draw.surface.font = slot_0_0_0.font_title

                        draw.surface:add_text(draw.vec2(slot_33_19_6, slot_33_20_8), slot_33_16_12, draw.color(255, 255, 255, slot_33_14_11))
                end

                if slot_33_9_0 > 2 then
                        slot_33_14_10 = slot_0_7_0(0, 200, math.min((slot_33_9_0 - 2) * 2, 1))
                        slot_33_15_19 = "Premium"
                        slot_33_16_11 = slot_0_0_0.font_subtitle:get_text_size(slot_33_15_19)
                        slot_33_17_9 = slot_33_7_0 / 2 - slot_33_16_11.x / 2
                        slot_33_18_8 = slot_33_8_0 / 2 + 20
                        draw.surface.font = slot_0_0_0.font_subtitle

                        draw.surface:add_text(draw.vec2(slot_33_17_9, slot_33_18_8), slot_33_15_19, draw.color(150, 200, 255, slot_33_14_10))
                end

                if slot_33_9_0 > 3 then
                        slot_33_14_9 = slot_0_7_0(0, 180, math.min((slot_33_9_0 - 3) * 2, 1))
                        slot_33_15_18 = "Welcome, " .. slot_33_12_8
                        slot_33_16_10 = slot_0_0_0.font_dev:get_text_size(slot_33_15_18)
                        slot_33_17_8 = slot_33_7_0 / 2 - slot_33_16_10.x / 2
                        slot_33_18_7 = slot_33_8_0 / 2 + 70
                        draw.surface.font = slot_0_0_0.font_dev

                        draw.surface:add_text(draw.vec2(slot_33_17_8, slot_33_18_7), slot_33_15_18, draw.color(200, 200, 200, slot_33_14_9))
                end

                if slot_33_9_0 > 1.5 then
                        slot_33_14_8 = slot_0_7_0(0, 150, math.min((slot_33_9_0 - 1.5) * 2, 1))
                        slot_33_15_17 = math.min((slot_33_9_0 - 1.5) / 2, 1)
                        slot_33_16_9 = slot_33_8_0 / 2 + 120
                        slot_33_17_7 = 300 * slot_33_15_17
                        slot_33_18_6 = slot_33_7_0 / 2 - slot_33_17_7 / 2

                        draw.surface:add_rect_filled(draw.rect(slot_33_18_6, slot_33_16_9, slot_33_18_6 + slot_33_17_7, slot_33_16_9 + 2), draw.color(100, 150, 255, slot_33_14_8))
                end

                if slot_33_11_9 < slot_33_9_0 then
                        if not slot_0_0_0.sound_played then
                                game.engine:client_cmd("play buttons/blip1")

                                slot_0_0_0.sound_played = true
                        end

                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 4 then
                slot_33_11_8 = 7

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(5, 5, 10, 255))

                if not slot_0_0_0.warp_stars then
                        slot_0_0_0.warp_stars = {}

                        for iter_33_14 = 1, 100 do
                                table.insert(slot_0_0_0.warp_stars, {
                                        x = math.random(-slot_33_7_0, slot_33_7_0),
                                        y = math.random(-slot_33_8_0, slot_33_8_0),
                                        z = math.random(1, slot_33_7_0)
                                })
                        end
                end

                slot_33_12_7 = slot_33_7_0 / 2
                slot_33_13_7 = slot_33_8_0 / 2

                for iter_33_15, iter_33_16 in ipairs(slot_0_0_0.warp_stars) do
                        iter_33_16.z = iter_33_16.z - (15 + slot_33_9_0 * 5)

                        if iter_33_16.z <= 1 then
                                iter_33_16.x = math.random(-slot_33_7_0, slot_33_7_0)
                                iter_33_16.y = math.random(-slot_33_8_0, slot_33_8_0)
                                iter_33_16.z = slot_33_7_0
                        end

                        slot_33_19_5 = iter_33_16.x / iter_33_16.z * 100 + slot_33_12_7
                        slot_33_20_7 = iter_33_16.y / iter_33_16.z * 100 + slot_33_13_7
                        slot_33_21_5 = (slot_33_7_0 - iter_33_16.z) / 200

                        if slot_33_21_5 < 0 then
                                slot_33_21_5 = 0
                        end

                        slot_33_22_4 = math.min(255, slot_33_7_0 - iter_33_16.z)

                        if slot_33_19_5 > 0 and slot_33_19_5 < slot_33_7_0 and slot_33_20_7 > 0 and slot_33_20_7 < slot_33_8_0 then
                                draw.surface:add_rect_filled(draw.rect(slot_33_19_5, slot_33_20_7, slot_33_19_5 + slot_33_21_5, slot_33_20_7 + slot_33_21_5), draw.color(200, 220, 255, math.floor(slot_33_22_4)))

                                if slot_33_9_0 > 2 then
                                        slot_33_23_4 = iter_33_16.x / (iter_33_16.z + 50) * 100 + slot_33_12_7
                                        slot_33_24_2 = iter_33_16.y / (iter_33_16.z + 50) * 100 + slot_33_13_7

                                        draw.surface:add_line(draw.vec2(slot_33_19_5, slot_33_20_7), draw.vec2(slot_33_23_4, slot_33_24_2), draw.color(100, 150, 255, math.floor(slot_33_22_4 * 0.5)))
                                end
                        end
                end

                if slot_33_9_0 > 1.5 then
                        slot_33_14_7 = math.min(1, slot_33_9_0 - 1.5)
                        slot_33_15_15 = slot_0_7_0(0, 255, slot_33_14_7)
                        slot_33_16_8 = "TUEURS"
                        slot_33_17_5 = slot_0_0_0.font_title:get_text_size(slot_33_16_8)
                        draw.surface.font = slot_0_0_0.font_title

                        draw.surface:add_text(draw.vec2(slot_33_12_7 - slot_33_17_5.x / 2, slot_33_13_7 - slot_33_17_5.y / 2), slot_33_16_8, draw.color(255, 255, 255, slot_33_15_15))

                        if slot_33_9_0 > 2.5 then
                                slot_33_18_4 = slot_0_7_0(0, 200, math.min(slot_33_9_0 - 2.5, 1))
                                slot_33_19_4 = "WARP SPEED ACTIVATED"
                                slot_33_20_6 = slot_0_0_0.font_small:get_text_size(slot_33_19_4)
                                draw.surface.font = slot_0_0_0.font_small

                                draw.surface:add_text(draw.vec2(slot_33_12_7 - slot_33_20_6.x / 2, slot_33_13_7 + 40), slot_33_19_4, draw.color(100, 200, 255, slot_33_18_4))
                        end
                end

                if slot_33_11_8 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 5 then
                slot_33_11_7 = 8

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(10, 10, 12, 255))

                if not slot_0_0_0.nodes then
                        slot_0_0_0.nodes = {}

                        for iter_33_17 = 1, 60 do
                                table.insert(slot_0_0_0.nodes, {
                                        x = math.random(0, slot_33_7_0),
                                        y = math.random(0, slot_33_8_0),
                                        vx = math.random(-10, 10) / 10,
                                        vy = math.random(-10, 10) / 10
                                })
                        end
                end

                for iter_33_18, iter_33_19 in ipairs(slot_0_0_0.nodes) do
                        iter_33_19.x = iter_33_19.x + iter_33_19.vx
                        iter_33_19.y = iter_33_19.y + iter_33_19.vy

                        if iter_33_19.x < 0 or slot_33_7_0 < iter_33_19.x then
                                iter_33_19.vx = -iter_33_19.vx
                        end

                        if iter_33_19.y < 0 or slot_33_8_0 < iter_33_19.y then
                                iter_33_19.vy = -iter_33_19.vy
                        end

                        draw.surface:add_circle_filled(draw.vec2(iter_33_19.x, iter_33_19.y), 2, draw.color(255, 255, 255, 150))

                        for iter_33_20 = iter_33_18 + 1, #slot_0_0_0.nodes do
                                slot_33_21_4 = slot_0_0_0.nodes[iter_33_20]
                                slot_33_22_3 = math.sqrt((iter_33_19.x - slot_33_21_4.x)^2 + (iter_33_19.y - slot_33_21_4.y)^2)

                                if slot_33_22_3 < 120 then
                                        slot_33_23_3 = math.floor((1 - slot_33_22_3 / 120) * 150)

                                        draw.surface:add_line(draw.vec2(iter_33_19.x, iter_33_19.y), draw.vec2(slot_33_21_4.x, slot_33_21_4.y), draw.color(100, 100, 255, slot_33_23_3))
                                end
                        end
                end

                slot_33_12_6 = "TUEURS NETWORK"
                slot_33_13_6 = slot_0_0_0.font_title:get_text_size(slot_33_12_6)
                slot_33_14_6 = slot_33_7_0 / 2 - slot_33_13_6.x / 2
                slot_33_15_12 = slot_33_8_0 / 2 - slot_33_13_6.y / 2

                if slot_33_9_0 > 1 then
                        slot_33_16_6 = math.random(-1, 1)
                        slot_33_17_4 = math.random(-1, 1)
                        slot_33_18_3 = slot_0_7_0(0, 255, math.min(slot_33_9_0 - 1, 1))
                        draw.surface.font = slot_0_0_0.font_title

                        draw.surface:add_text(draw.vec2(slot_33_14_6 + 2 + slot_33_16_6, slot_33_15_12 + 2 + slot_33_17_4), slot_33_12_6, draw.color(0, 255, 255, slot_33_18_3 * 0.5))
                        draw.surface:add_text(draw.vec2(slot_33_14_6 - 2 - slot_33_16_6, slot_33_15_12 - 2 - slot_33_17_4), slot_33_12_6, draw.color(255, 0, 255, slot_33_18_3 * 0.5))
                        draw.surface:add_text(draw.vec2(slot_33_14_6, slot_33_15_12), slot_33_12_6, draw.color(255, 255, 255, slot_33_18_3))

                        slot_33_19_3 = 300
                        slot_33_20_4 = 4
                        slot_33_21_3 = math.min((slot_33_9_0 - 1) / 5, 1)
                        slot_33_22_2 = slot_33_7_0 / 2 - slot_33_19_3 / 2
                        slot_33_23_2 = slot_33_15_12 + slot_33_13_6.y + 20

                        draw.surface:add_rect_filled(draw.rect(slot_33_22_2, slot_33_23_2, slot_33_22_2 + slot_33_19_3, slot_33_23_2 + slot_33_20_4), draw.color(30, 30, 30, 200))
                        draw.surface:add_rect_filled(draw.rect(slot_33_22_2, slot_33_23_2, slot_33_22_2 + slot_33_19_3 * slot_33_21_3, slot_33_23_2 + slot_33_20_4), draw.color(0, 255, 255, 200))
                end

                if slot_33_11_7 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 6 then
                slot_33_11_6 = 7.5
                slot_33_12_5 = draw.color(0, 255, 100, 255)
                slot_33_13_5 = draw.color(10, 20, 10, 255)

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), slot_33_13_5)

                slot_33_14_5 = slot_33_7_0 / 2
                slot_33_15_11 = slot_33_8_0 / 2
                slot_33_16_5 = 250

                draw.surface:add_circle(draw.vec2(slot_33_14_5, slot_33_15_11), slot_33_16_5, slot_33_12_5:mod_a(50), 2)
                draw.surface:add_circle(draw.vec2(slot_33_14_5, slot_33_15_11), slot_33_16_5 * 0.66, slot_33_12_5:mod_a(30), 1)
                draw.surface:add_circle(draw.vec2(slot_33_14_5, slot_33_15_11), slot_33_16_5 * 0.33, slot_33_12_5:mod_a(30), 1)
                draw.surface:add_line(draw.vec2(slot_33_14_5 - slot_33_16_5, slot_33_15_11), draw.vec2(slot_33_14_5 + slot_33_16_5, slot_33_15_11), slot_33_12_5:mod_a(30))
                draw.surface:add_line(draw.vec2(slot_33_14_5, slot_33_15_11 - slot_33_16_5), draw.vec2(slot_33_14_5, slot_33_15_11 + slot_33_16_5), slot_33_12_5:mod_a(30))

                slot_33_17_3 = slot_33_9_0 * 3
                slot_33_18_2 = slot_33_14_5 + math.cos(slot_33_17_3) * slot_33_16_5
                slot_33_19_2 = slot_33_15_11 + math.sin(slot_33_17_3) * slot_33_16_5

                draw.surface:add_line(draw.vec2(slot_33_14_5, slot_33_15_11), draw.vec2(slot_33_18_2, slot_33_19_2), slot_33_12_5)

                if slot_33_9_0 > 1 then
                        slot_33_20_3 = "SYSTEM SECURE"
                        slot_33_21_2 = math.abs(math.sin(slot_33_9_0 * 2)) * 255
                        draw.surface.font = slot_0_0_0.font_subtitle
                        slot_33_22_1 = slot_0_0_0.font_subtitle:get_text_size(slot_33_20_3)

                        draw.surface:add_text(draw.vec2(slot_33_14_5 - slot_33_22_1.x / 2, slot_33_15_11 - slot_33_16_5 - 50), slot_33_20_3, slot_33_12_5:mod_a(math.floor(slot_33_21_2)))

                        if not slot_0_0_0.blips then
                                slot_0_0_0.blips = {
                                        {
                                                start = 1.5,
                                                x = slot_33_14_5 + 50,
                                                y = slot_33_15_11 - 50
                                        },
                                        {
                                                start = 2.5,
                                                x = slot_33_14_5 - 120,
                                                y = slot_33_15_11 + 30
                                        },
                                        {
                                                start = 3.5,
                                                x = slot_33_14_5 + 80,
                                                y = slot_33_15_11 + 100
                                        }
                                }
                        end

                        for iter_33_21, iter_33_22 in ipairs(slot_0_0_0.blips) do
                                if slot_33_9_0 > iter_33_22.start then
                                        slot_33_28_0 = 255

                                        if slot_33_9_0 - iter_33_22.start > 0.5 then
                                                slot_33_28_0 = math.max(0, 255 - (slot_33_9_0 - iter_33_22.start - 0.5) * 100)
                                        end

                                        if slot_33_28_0 > 0 then
                                                draw.surface:add_circle_filled(draw.vec2(iter_33_22.x, iter_33_22.y), 5, draw.color(255, 50, 50, math.floor(slot_33_28_0)))
                                                draw.surface:add_text(draw.vec2(iter_33_22.x + 10, iter_33_22.y - 10), "THREAT", draw.color(255, 255, 255, math.floor(slot_33_28_0)))
                                        end
                                end
                        end
                end

                slot_33_20_2 = "TUEURS"
                slot_33_21_1 = slot_0_0_0.font_title:get_text_size(slot_33_20_2)
                draw.surface.font = slot_0_0_0.font_title

                draw.surface:add_text(draw.vec2(slot_33_14_5 - slot_33_21_1.x / 2, slot_33_15_11 - slot_33_21_1.y / 2), slot_33_20_2, draw.color(255, 255, 255, math.min(255, slot_33_9_0 * 50)))

                if slot_33_11_6 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 7 then
                slot_33_11_5 = 6.5

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(0, 0, 180, 255))

                for iter_33_23 = 1, 50 do
                        slot_33_16_4 = math.random(0, slot_33_7_0)
                        slot_33_17_2 = math.random(0, slot_33_8_0)
                        slot_33_18_1 = math.random(2, 4)

                        draw.surface:add_rect_filled(draw.rect(slot_33_16_4, slot_33_17_2, slot_33_16_4 + slot_33_18_1, slot_33_17_2 + 2), draw.color(255, 255, 255, math.random(20, 80)))
                end

                for iter_33_24 = 0, slot_33_8_0, 4 do
                        if iter_33_24 % 8 == 0 then
                                draw.surface:add_rect_filled(draw.rect(0, iter_33_24, slot_33_7_0, iter_33_24 + 1), draw.color(0, 0, 0, 50))
                        end
                end

                if math.floor(slot_33_9_0 * 2) % 2 == 0 then
                        draw.surface.font = slot_0_0_0.font_title

                        draw.surface:add_text(draw.vec2(50, 50), "PLAY >", draw.color(255, 255, 255, 255))
                end

                draw.surface.font = slot_0_0_0.font_subtitle

                draw.surface:add_text(draw.vec2(50, slot_33_8_0 - 100), "SP: " .. "SLP", draw.color(255, 255, 255, 200))
                draw.surface:add_text(draw.vec2(50, slot_33_8_0 - 60), "TUEURS.LUA V1.7", draw.color(255, 255, 255, 200))

                if slot_33_11_5 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 8 then
                slot_33_11_4 = 8

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(20, 20, 20, 255))

                if not slot_0_0_0.dvd then
                        slot_0_0_0.dvd = {
                                h = 50,
                                w = 150,
                                dy = 300,
                                dx = 300,
                                x = slot_33_7_0 / 2,
                                y = slot_33_8_0 / 2,
                                color = draw.color(255, 0, 0, 255)
                        }
                end

                slot_33_12_4 = slot_0_0_0.dvd
                slot_33_13_4 = game.global_vars.frame_time
                slot_33_12_4.x = slot_33_12_4.x + slot_33_12_4.dx * slot_33_13_4
                slot_33_12_4.y = slot_33_12_4.y + slot_33_12_4.dy * slot_33_13_4
                slot_33_14_4 = false

                if slot_33_12_4.x <= 0 then
                        slot_33_12_4.x = 0
                        slot_33_12_4.dx = math.abs(slot_33_12_4.dx)
                        slot_33_14_4 = true
                end

                if slot_33_7_0 <= slot_33_12_4.x + slot_33_12_4.w then
                        slot_33_12_4.x = slot_33_7_0 - slot_33_12_4.w
                        slot_33_12_4.dx = -math.abs(slot_33_12_4.dx)
                        slot_33_14_4 = true
                end

                if slot_33_12_4.y <= 0 then
                        slot_33_12_4.y = 0
                        slot_33_12_4.dy = math.abs(slot_33_12_4.dy)
                        slot_33_14_4 = true
                end

                if slot_33_8_0 <= slot_33_12_4.y + slot_33_12_4.h then
                        slot_33_12_4.y = slot_33_8_0 - slot_33_12_4.h
                        slot_33_12_4.dy = -math.abs(slot_33_12_4.dy)
                        slot_33_14_4 = true
                end

                if slot_33_14_4 then
                        slot_33_12_4.color = draw.color(math.random(100, 255), math.random(100, 255), math.random(100, 255), 255)
                end

                draw.surface:add_rect_filled(draw.rect(slot_33_12_4.x, slot_33_12_4.y, slot_33_12_4.x + slot_33_12_4.w, slot_33_12_4.y + slot_33_12_4.h), slot_33_12_4.color)
                draw.surface:add_rect(draw.rect(slot_33_12_4.x, slot_33_12_4.y, slot_33_12_4.x + slot_33_12_4.w, slot_33_12_4.y + slot_33_12_4.h), draw.color(255, 255, 255, 255))

                draw.surface.font = slot_0_0_0.font_dev
                slot_33_15_8 = "TUEURS"
                slot_33_16_3 = slot_0_0_0.font_dev:get_text_size(slot_33_15_8)

                draw.surface:add_text(draw.vec2(slot_33_12_4.x + (slot_33_12_4.w - slot_33_16_3.x) / 2, slot_33_12_4.y + (slot_33_12_4.h - slot_33_16_3.y) / 2), slot_33_15_8, draw.color(255, 255, 255, 255))

                if slot_33_11_4 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 9 then
                slot_33_11_3 = 7

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(0, 20, 10, 255))

                for iter_33_25 = 0, slot_33_7_0, 50 do
                        draw.surface:add_line(draw.vec2(iter_33_25, 0), draw.vec2(iter_33_25, slot_33_8_0), draw.color(0, 50, 25, 100))
                end

                for iter_33_26 = 0, slot_33_8_0, 50 do
                        draw.surface:add_line(draw.vec2(0, iter_33_26), draw.vec2(slot_33_7_0, iter_33_26), draw.color(0, 50, 25, 100))
                end

                slot_33_12_3 = slot_33_8_0 / 2
                slot_33_13_3 = slot_33_9_0 * 600 % (slot_33_7_0 + 200)
                slot_33_14_3 = 0
                slot_33_15_5 = slot_33_12_3

                for iter_33_27 = 0, 50 do
                        slot_33_20_1 = slot_33_13_3 - iter_33_27 * 10

                        if slot_33_20_1 > 0 and slot_33_20_1 < slot_33_7_0 then
                                slot_33_21_0 = 0
                                slot_33_22_0 = slot_33_20_1 % 400

                                if slot_33_22_0 > 300 and slot_33_22_0 < 320 then
                                        slot_33_21_0 = -100
                                elseif slot_33_22_0 > 320 and slot_33_22_0 < 340 then
                                        slot_33_21_0 = 50
                                end

                                slot_33_23_1 = slot_33_12_3 + slot_33_21_0
                                slot_33_24_1 = math.max(0, 255 - iter_33_27 * 5)

                                if iter_33_27 > 0 then
                                        draw.surface:add_line(draw.vec2(slot_33_14_3, slot_33_15_5), draw.vec2(slot_33_20_1, slot_33_23_1), draw.color(0, 255, 100, slot_33_24_1))
                                end

                                slot_33_14_3, slot_33_15_5 = slot_33_20_1, slot_33_23_1
                        end
                end

                draw.surface.font = slot_0_0_0.font_title

                draw.surface:add_text(draw.vec2(50, 50), "SYSTEM: STABLE", draw.color(0, 255, 100, 255))
                draw.surface:add_text(draw.vec2(50, 100), "INJECTING...", draw.color(0, 255, 100, math.abs(math.sin(slot_33_9_0 * 3)) * 255))

                if slot_33_11_3 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 10 then
                slot_33_11_2 = 7.5

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(10, 10, 10, 255))

                slot_33_12_2 = slot_33_7_0 / 2
                slot_33_13_2 = slot_33_8_0 / 2
                slot_33_14_2 = 400
                slot_33_15_4 = 20
                slot_33_16_2 = math.min(1, slot_33_9_0 / 6)

                draw.surface:add_rect_filled(draw.rect(slot_33_12_2 - slot_33_14_2 / 2, slot_33_13_2, slot_33_12_2 + slot_33_14_2 / 2, slot_33_13_2 + slot_33_15_4), draw.color(30, 30, 30, 255))
                draw.surface:add_rect_filled(draw.rect(slot_33_12_2 - slot_33_14_2 / 2, slot_33_13_2, slot_33_12_2 - slot_33_14_2 / 2 + slot_33_14_2 * slot_33_16_2, slot_33_13_2 + slot_33_15_4), draw.color(0, 150, 255, 255))
                draw.surface:add_rect(draw.rect(slot_33_12_2 - slot_33_14_2 / 2, slot_33_13_2, slot_33_12_2 + slot_33_14_2 / 2, slot_33_13_2 + slot_33_15_4), draw.color(255, 255, 255, 200))

                slot_33_17_1 = math.floor(slot_33_16_2 * 100)
                slot_33_18_0 = "UPLOADING... " .. slot_33_17_1 .. "%"
                slot_33_19_0 = slot_0_0_0.font_subtitle:get_text_size(slot_33_18_0)
                draw.surface.font = slot_0_0_0.font_subtitle

                draw.surface:add_text(draw.vec2(slot_33_12_2 - slot_33_19_0.x / 2, slot_33_13_2 - 40), slot_33_18_0, draw.color(255, 255, 255, 255))

                if not slot_0_0_0.hex_lines then
                        slot_0_0_0.hex_lines = {}
                end

                if math.random(1, 5) == 1 then
                        slot_33_20_0 = string.format("0x%08X  MEM_ALLOC  %04d", math.random(0, 4294967295), math.random(0, 9999))

                        table.insert(slot_0_0_0.hex_lines, slot_33_20_0)

                        if #slot_0_0_0.hex_lines > 15 then
                                table.remove(slot_0_0_0.hex_lines, 1)
                        end
                end

                draw.surface.font = slot_0_0_0.font_small

                for iter_33_28, iter_33_29 in ipairs(slot_0_0_0.hex_lines) do
                        draw.surface:add_text(draw.vec2(slot_33_12_2 - slot_33_14_2 / 2, slot_33_13_2 + 40 + iter_33_28 * 15), iter_33_29, draw.color(0, 255, 0, 150))
                end

                if slot_33_11_2 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        elseif slot_33_10_0 == 11 then
                slot_33_11_1 = 7

                draw.surface:add_rect_filled(draw.rect(0, 0, slot_33_7_0, slot_33_8_0), draw.color(15, 5, 5, 255))

                if not slot_0_0_0.embers then
                        slot_0_0_0.embers = {}

                        for iter_33_30 = 1, 60 do
                                table.insert(slot_0_0_0.embers, {
                                        x = math.random(0, slot_33_7_0),
                                        y = math.random(slot_33_8_0, slot_33_8_0 + 100),
                                        speed = math.random(1, 4),
                                        size = math.random(2, 5)
                                })
                        end
                end

                for iter_33_31, iter_33_32 in ipairs(slot_0_0_0.embers) do
                        iter_33_32.y = iter_33_32.y - iter_33_32.speed
                        iter_33_32.x = iter_33_32.x + math.sin(slot_33_9_0 + iter_33_32.y * 0.01) * 0.5

                        if iter_33_32.y < -10 then
                                iter_33_32.y = slot_33_8_0 + 10
                                iter_33_32.x = math.random(0, slot_33_7_0)
                        end

                        slot_33_17_0 = math.min(255, iter_33_32.y / slot_33_8_0 * 255)

                        draw.surface:add_rect_filled(draw.rect(iter_33_32.x, iter_33_32.y, iter_33_32.x + iter_33_32.size, iter_33_32.y + iter_33_32.size), draw.color(255, 100, 50, math.floor(slot_33_17_0)))
                end

                if slot_33_9_0 > 1 then
                        slot_33_12_1 = math.min(255, (slot_33_9_0 - 1) * 100)
                        slot_33_13_1 = "TUEURS"
                        slot_33_14_1 = slot_0_0_0.font_title:get_text_size(slot_33_13_1)
                        draw.surface.font = slot_0_0_0.font_title

                        draw.surface:add_text(draw.vec2(slot_33_7_0 / 2 - slot_33_14_1.x / 2, slot_33_8_0 / 2 - slot_33_14_1.y), slot_33_13_1, draw.color(255, 200, 150, math.floor(slot_33_12_1)))

                        slot_33_15_1 = "Premium"
                        slot_33_16_0 = slot_0_0_0.font_subtitle:get_text_size(slot_33_15_1)
                        draw.surface.font = slot_0_0_0.font_subtitle

                        draw.surface:add_text(draw.vec2(slot_33_7_0 / 2 - slot_33_16_0.x / 2, slot_33_8_0 / 2 + 10), slot_33_15_1, draw.color(255, 255, 255, math.floor(slot_33_12_1 * 0.7)))
                end

                if slot_33_11_1 < slot_33_9_0 then
                        slot_0_0_0.active = false
                        menu_open = true
                end
        end

        if slot_33_9_0 > 1 then
                slot_33_11_0 = 0

                if slot_33_9_0 < 3 then
                        slot_33_11_0 = slot_0_7_0(0, 200, (slot_33_9_0 - 1) / 2)
                else
                        slot_33_11_0 = slot_33_9_0 > 6 and 200 or 200
                end

                slot_33_12_0 = "Developed By Lukinhas"
                slot_33_13_0 = slot_0_0_0.font_dev:get_text_size(slot_33_12_0)
                slot_33_14_0 = slot_33_7_0 / 2 - slot_33_13_0.x / 2
                slot_33_15_0 = slot_33_8_0 - 100
                draw.surface.font = slot_0_0_0.font_dev

                draw.surface:add_text(draw.vec2(slot_33_14_0, slot_33_15_0), slot_33_12_0, draw.color(200, 200, 200, math.floor(slot_33_11_0)))
        end
end

function slot_0_31_0()
        if not slot_0_0_0.active then
                return
        end

        if not game.engine or not game.engine.get_screen_size then
                return
        end

        if mouse then
                mouse.pressed = false
        end

        if not slot_0_0_0.start_time then
                slot_0_0_0.is_in_game = game.engine:in_game()
                slot_0_0_0.start_time = game.global_vars.real_time

                math.randomseed(math.floor(game.global_vars.real_time * 10000))

                if not slot_0_0_0.selected_anim then
                        if slot_0_2_0 and slot_0_2_0.animation_test and slot_0_2_0.animation_test.enabled then
                                slot_0_0_0.selected_anim = slot_0_2_0.animation_test.animations[slot_0_2_0.animation_test.current_animation].type
                        else
                                slot_34_0_1 = gui and gui.ctx and gui.ctx.user and gui.ctx.user.username or ""

                                if slot_34_0_1 == "LukinhasMenu" then
                                        slot_0_0_0.selected_anim = 2
                                elseif slot_34_0_1 == "victorcxz" or slot_34_0_1 == "arionsanz" or slot_34_0_1 == "temniyprince812" then
                                        slot_0_0_0.selected_anim = 3
                                elseif slot_34_0_1 == "BrayHax" then
                                        slot_0_0_0.selected_anim = 3
                                else
                                        slot_0_0_0.selected_anim = 5
                                end
                        end
                end
        end

        slot_34_0_0 = game.global_vars.real_time - slot_0_0_0.start_time
        slot_0_0_0.elapsed_time = slot_34_0_0
        slot_34_1_0, slot_34_2_0 = game.engine:get_screen_size()
        slot_34_3_0 = math.floor(slot_34_1_0)
        slot_34_4_0 = math.floor(slot_34_2_0)
        slot_34_5_0 = math.floor(slot_34_3_0 / 2)
        slot_34_6_0 = math.floor(slot_34_4_0 / 2)
        slot_34_7_0 = slot_0_0_0.is_in_game and 2 or 5
        slot_34_8_0 = gui and gui.ctx and gui.ctx.user and gui.ctx.user.username or "User"
        slot_34_9_0 = "PREMIUM"
        slot_34_10_0 = "Tueurs.New"
        slot_34_11_0 = "Dev: Lukinhas"

        if slot_34_8_0 == "LukinhasMenu" then
                slot_34_9_0 = "DEV_BUILD"
        elseif slot_34_8_0 == "victorcxz" then
                slot_34_9_0 = "BETA_BUILD"
        elseif slot_34_8_0 == "arionsanz" then
                slot_34_9_0 = "BETA_BUILD"
        end

        slot_34_12_0 = slot_0_0_0.selected_anim or 1

        if game.engine and game.engine.client_cmd then
                -- block empty
        end

        if slot_34_12_0 == 1 then
                draw.surface:add_rect_filled(draw.rect(0, 0, slot_34_3_0, slot_34_4_0), draw.color(0, 0, 0, 255))

                slot_34_13_6 = 18
                slot_34_14_5 = math.floor(slot_34_3_0 / slot_34_13_6)

                if not slot_0_0_0.matrix or #slot_0_0_0.matrix ~= slot_34_14_5 then
                        slot_0_0_0.matrix = {}

                        for iter_34_0 = 1, slot_34_14_5 do
                                slot_0_0_0.matrix[iter_34_0] = math.random(-slot_34_4_0, 0)
                        end
                end

                draw.surface.font = slot_0_0_0.font_rain

                for iter_34_1 = 1, slot_34_14_5 do
                        slot_34_19_8 = (iter_34_1 - 1) * slot_34_13_6
                        slot_34_20_6 = slot_0_0_0.matrix[iter_34_1]

                        if slot_34_20_6 > 0 and slot_34_20_6 < slot_34_4_0 then
                                slot_34_21_3 = slot_0_0_0.charset:sub(math.random(1, 30), math.random(1, 30))

                                draw.surface:add_text(draw.vec2(slot_34_19_8, slot_34_20_6), slot_34_21_3, draw.color(200, 255, 200, 255))

                                for iter_34_2 = 1, 3 do
                                        slot_34_26_1 = slot_34_20_6 - iter_34_2 * slot_34_13_6

                                        if slot_34_26_1 > 0 then
                                                slot_34_27_1 = slot_0_0_0.charset:sub(math.random(1, 30), math.random(1, 30))

                                                draw.surface:add_text(draw.vec2(slot_34_19_8, slot_34_26_1), slot_34_27_1, draw.color(0, 255, 50, 150 - iter_34_2 * 40))
                                        end
                                end
                        end

                        slot_0_0_0.matrix[iter_34_1] = slot_34_20_6 + 20

                        if slot_34_4_0 < slot_0_0_0.matrix[iter_34_1] - 100 then
                                slot_0_0_0.matrix[iter_34_1] = math.random(-200, -10)
                        end
                end

                if slot_34_0_0 > 1 then
                        slot_34_15_6 = 500
                        slot_34_16_11 = 150

                        draw.surface:add_rect_filled(draw.rect(slot_34_5_0 - slot_34_15_6 / 2, slot_34_6_0 - slot_34_16_11 / 2, slot_34_5_0 + slot_34_15_6 / 2, slot_34_6_0 + slot_34_16_11 / 2), draw.color(0, 20, 0, 230))
                        draw.surface:add_rect(draw.rect(slot_34_5_0 - slot_34_15_6 / 2, slot_34_6_0 - slot_34_16_11 / 2, slot_34_5_0 + slot_34_15_6 / 2, slot_34_6_0 + slot_34_16_11 / 2), draw.color(0, 255, 0, 255), 2)

                        function slot_34_17_10(arg_35_0, arg_35_1)
                                if arg_35_1 > slot_34_0_0 then
                                        return ""
                                end

                                local var_35_0 = math.min(1, (slot_34_0_0 - arg_35_1) / 1.5)
                                local var_35_1 = #arg_35_0
                                local var_35_2 = math.floor(var_35_1 * var_35_0)
                                local var_35_3 = arg_35_0:sub(1, var_35_2)

                                for iter_35_0 = var_35_2 + 1, var_35_1 do
                                        var_35_3 = var_35_3 .. slot_0_0_0.charset:sub(math.random(1, 15), math.random(1, 15))
                                end

                                return var_35_3
                        end

                        draw.surface.font = slot_0_0_0.font_title

                        draw.surface:add_text(draw.vec2(slot_34_5_0 - 180, slot_34_6_0 - 40), slot_34_17_10(slot_34_10_0, 1), draw.color(255, 255, 255, 255))

                        draw.surface.font = slot_0_0_0.font_subtitle

                        draw.surface:add_text(draw.vec2(slot_34_5_0 - 180, slot_34_6_0 + 10), slot_34_17_10("USER: " .. slot_34_8_0, 2), draw.color(0, 255, 100, 255))
                end
        elseif slot_34_12_0 == 2 then
                draw.surface:add_rect_filled(draw.rect(0, 0, slot_34_3_0, slot_34_4_0), draw.color(10, 10, 12, 255))

                slot_34_13_5 = {
                        "root@system:~# ./init_tueurs.sh",
                        "Allocating memory space... OK",
                        "Bypassing integrity checks... OK",
                        "Authenticating user: " .. slot_34_8_0,
                        "License status: " .. slot_34_9_0 .. " [VERIFIED]",
                        "Loading modules... " .. slot_34_10_0,
                        "Hooking functions... SUCCESS",
                        "Welcome back, " .. slot_34_8_0
                }
                draw.surface.font = slot_0_0_0.font_rain
                slot_34_14_4 = slot_34_6_0 - #slot_34_13_5 * 15
                slot_34_15_5 = slot_34_5_0 - 250

                for iter_34_3, iter_34_4 in ipairs(slot_34_13_5) do
                        slot_34_21_2 = iter_34_3 * 0.6

                        if slot_34_21_2 < slot_34_0_0 then
                                slot_34_22_2 = iter_34_4

                                if slot_34_0_0 < slot_34_21_2 + 0.5 then
                                        slot_34_22_2 = iter_34_4:sub(1, math.floor(#iter_34_4 * ((slot_34_0_0 - slot_34_21_2) / 0.5))) .. "_"
                                end

                                slot_34_23_2 = draw.color(200, 200, 200, 255)

                                if iter_34_4:find("OK") or iter_34_4:find("SUCCESS") or iter_34_4:find("VERIFIED") then
                                        slot_34_23_2 = draw.color(0, 255, 50, 255)
                                end

                                if iter_34_4:find("root@") then
                                        slot_34_23_2 = draw.color(50, 150, 255, 255)
                                end

                                draw.surface:add_text(draw.vec2(slot_34_15_5, slot_34_14_4 + iter_34_3 * 25), slot_34_22_2, slot_34_23_2)
                        end
                end
        elseif slot_34_12_0 == 3 then
                draw.surface:add_rect_filled(draw.rect(0, 0, slot_34_3_0, slot_34_4_0), draw.color(5, 10, 5, 255))

                for iter_34_5 = 0, slot_34_3_0, 100 do
                        draw.surface:add_line(draw.vec2(iter_34_5, 0), draw.vec2(iter_34_5, slot_34_4_0), draw.color(0, 50, 0, 80))
                end

                for iter_34_6 = 0, slot_34_4_0, 100 do
                        draw.surface:add_line(draw.vec2(0, iter_34_6), draw.vec2(slot_34_3_0, iter_34_6), draw.color(0, 50, 0, 80))
                end

                draw.surface.font = slot_0_0_0.font_rain

                for iter_34_7 = 1, 30 do
                        slot_34_17_9 = math.random(0, slot_34_3_0)
                        slot_34_18_7 = math.random(0, slot_34_4_0)
                        slot_34_19_6 = math.random(20, 60)
                        slot_34_20_4 = {
                                "[ACCESS]",
                                "[SCAN]",
                                "[AUTH]",
                                "[DATA]",
                                "[SYS]",
                                "[CHK]",
                                "[SEC]",
                                "[VER]",
                                "[PKT]",
                                "[NET]",
                                "[CRC]",
                                "[HDR]"
                        }
                        slot_34_21_1 = slot_34_20_4[math.random(1, #slot_34_20_4)]

                        draw.surface:add_text(draw.vec2(slot_34_17_9, slot_34_18_7), slot_34_21_1, draw.color(0, 150, 0, slot_34_19_6))
                end

                for iter_34_8 = 1, 25 do
                        slot_34_17_8 = (slot_34_0_0 * 100 + iter_34_8 * 40) % slot_34_3_0
                        slot_34_18_6 = math.sin(slot_34_0_0 * 2 + iter_34_8 * 0.5) * 30 + slot_34_6_0

                        draw.surface:add_rect_filled(draw.rect(slot_34_17_8, slot_34_18_6, slot_34_17_8 + 2, slot_34_18_6 + 2), draw.color(0, 200, 0, 150))
                end

                for iter_34_9 = 1, 15 do
                        slot_34_17_7 = (slot_34_0_0 * 80 + iter_34_9 * 80) % slot_34_3_0
                        slot_34_18_5 = iter_34_9 * 60 % slot_34_4_0
                        slot_34_19_5 = {
                                "0xFF4A",
                                "0x2B8C",
                                "0x9D3F",
                                "0x7E1A",
                                "0xC5B2",
                                "0x8A1D",
                                "0x3F9C",
                                "0xB7E4"
                        }
                        slot_34_20_3 = slot_34_19_5[math.random(1, #slot_34_19_5)]

                        draw.surface:add_text(draw.vec2(slot_34_17_7, slot_34_18_5), slot_34_20_3, draw.color(0, 100, 0, 100))
                end

                for iter_34_10 = 1, 8 do
                        slot_34_17_6 = (slot_34_0_0 * 50 + iter_34_10 * 120) % (slot_34_3_0 + 200) - 100
                        slot_34_18_4 = math.sin(slot_34_0_0 + iter_34_10) * 100 + slot_34_6_0
                        slot_34_19_4 = slot_34_17_6 + 80
                        slot_34_20_2 = math.cos(slot_34_0_0 + iter_34_10) * 100 + slot_34_6_0

                        draw.surface:add_line(draw.vec2(slot_34_17_6, slot_34_18_4), draw.vec2(slot_34_19_4, slot_34_20_2), draw.color(0, 120, 0, 80))
                end

                for iter_34_11 = 1, 3 do
                        slot_34_17_5 = 50 + iter_34_11 * 30
                        slot_34_18_3 = 30 - iter_34_11 * 8

                        draw.surface:add_circle(draw.vec2(slot_34_5_0, slot_34_6_0), slot_34_17_5, draw.color(0, 100, 0, slot_34_18_3), 1)
                end

                slot_34_13_4 = {
                        "SCANNING...",
                        "ANALYZING...",
                        "VERIFYING...",
                        "PROCESSING..."
                }

                for iter_34_12 = 1, 4 do
                        slot_34_18_2 = (iter_34_12 - 1) * 200 + 50
                        slot_34_19_3 = 50

                        if math.sin(slot_34_0_0 * 3 + iter_34_12) > 0 then
                                draw.surface:add_text(draw.vec2(slot_34_18_2, slot_34_19_3), slot_34_13_4[iter_34_12], draw.color(0, 180, 0, 120))
                        end
                end

                slot_34_14_3 = slot_34_0_0 * 250 - 150
                slot_34_15_4 = {
                        {
                                txt = slot_34_10_0,
                                y = slot_34_6_0 - 140,
                                f = slot_0_0_0.font_title
                        },
                        {
                                txt = "IDENTITY: " .. slot_34_8_0,
                                y = slot_34_6_0 - 80,
                                f = slot_0_0_0.font_subtitle
                        },
                        {
                                txt = "ACCESS LEVEL: " .. slot_34_9_0,
                                y = slot_34_6_0 - 40,
                                f = slot_0_0_0.font_subtitle
                        },
                        {
                                txt = "STATUS: AUTHENTICATED",
                                y = slot_34_6_0,
                                f = slot_0_0_0.font_subtitle
                        },
                        {
                                txt = "SESSION ID: " .. string.format("%04X", math.random(0, 65535)),
                                y = slot_34_6_0 + 40,
                                f = slot_0_0_0.font_small
                        },
                        {
                                txt = "ENCRYPTION: AES-256",
                                y = slot_34_6_0 + 75,
                                f = slot_0_0_0.font_small
                        },
                        {
                                txt = "DEV: LUKINHAS",
                                y = slot_34_6_0 + 110,
                                f = slot_0_0_0.font_small
                        },
                        {
                                txt = "VERSION: v1.7.0",
                                y = slot_34_6_0 + 140,
                                f = slot_0_0_0.font_small
                        }
                }

                for iter_34_13, iter_34_14 in ipairs(slot_34_15_4) do
                        slot_34_22_1 = slot_34_5_0 - iter_34_14.f:get_text_size(iter_34_14.txt).x / 2
                        draw.surface.font = iter_34_14.f

                        if slot_34_14_3 > iter_34_14.y then
                                slot_34_23_1 = (slot_34_14_3 - iter_34_14.y) / 100
                                slot_34_24_1 = math.max(0, 50 - slot_34_23_1 * 50)
                                slot_34_25_0 = math.floor(slot_34_0_0 * 4)
                                slot_34_26_0 = slot_34_25_0 % 3 - 1
                                slot_34_27_0 = slot_34_25_0 % 2 - 1
                                slot_34_28_0 = slot_34_25_0 % 3 + 1

                                draw.surface:add_text(draw.vec2(slot_34_22_1 - slot_34_24_1, iter_34_14.y), iter_34_14.txt, draw.color(200, 50, 255, 255))

                                if slot_34_28_0 == 1 then
                                        draw.surface:add_text(draw.vec2(slot_34_22_1 - slot_34_24_1 + slot_34_26_0, iter_34_14.y + slot_34_27_0), iter_34_14.txt, draw.color(255, 0, 0, 150))
                                elseif slot_34_28_0 == 2 then
                                        draw.surface:add_text(draw.vec2(slot_34_22_1 - slot_34_24_1 - slot_34_26_0, iter_34_14.y - slot_34_27_0), iter_34_14.txt, draw.color(0, 100, 255, 150))
                                else
                                        draw.surface:add_text(draw.vec2(slot_34_22_1 - slot_34_24_1 + slot_34_26_0 * 2, iter_34_14.y), iter_34_14.txt, draw.color(255, 255, 0, 100))
                                end

                                draw.surface:add_text(draw.vec2(slot_34_22_1 - slot_34_24_1 + 1, iter_34_14.y + 1), iter_34_14.txt, draw.color(200, 50, 255, 100))
                        end
                end

                if slot_34_14_3 < slot_34_4_0 + 50 then
                        draw.surface:add_line(draw.vec2(0, slot_34_14_3), draw.vec2(slot_34_3_0, slot_34_14_3), draw.color(0, 255, 0, 255))
                        draw.surface:add_rect_filled(draw.rect(0, slot_34_14_3 - 50, slot_34_3_0, slot_34_14_3), draw.color(0, 255, 0, 30))
                end
        elseif slot_34_12_0 == 4 then
                draw.surface:add_rect_filled(draw.rect(0, 0, slot_34_3_0, slot_34_4_0), draw.color(10, 0, 15, 255))

                slot_34_13_3 = math.sin(slot_34_0_0 * 8) * 12
                slot_34_14_2 = math.abs(slot_34_13_3) / 2

                draw.surface:add_circle(draw.vec2(slot_34_5_0, slot_34_6_0), 180 + slot_34_13_3, draw.color(200, 0, 255, 100), 3)
                draw.surface:add_circle(draw.vec2(slot_34_5_0, slot_34_6_0), 220 + slot_34_13_3 * 1.5, draw.color(0, 255, 255, 100), 2)

                function slot_34_15_3(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
                        draw.surface.font = arg_36_2

                        local var_36_0 = arg_36_2:get_text_size(arg_36_0)
                        local var_36_1 = slot_34_5_0 - var_36_0.x / 2
                        local var_36_2 = slot_34_6_0 + arg_36_1

                        draw.surface:add_text(draw.vec2(var_36_1 - slot_34_14_2, var_36_2), arg_36_0, draw.color(255, 0, 0, 150))
                        draw.surface:add_text(draw.vec2(var_36_1 + slot_34_14_2, var_36_2), arg_36_0, draw.color(0, 255, 255, 150))
                        draw.surface:add_text(draw.vec2(var_36_1, var_36_2), arg_36_0, arg_36_3)
                end

                slot_34_15_3(slot_34_10_0, -80, slot_0_0_0.font_title, draw.color(255, 255, 255, 255))
                slot_34_15_3(slot_34_8_0 .. " [" .. slot_34_9_0 .. "]", 10, slot_0_0_0.font_subtitle, draw.color(255, 0, 255, 255))
                slot_34_15_3(slot_34_11_0, 60, slot_0_0_0.font_small, draw.color(0, 255, 255, 200))
        elseif slot_34_12_0 == 5 then
                if slot_34_0_0 < slot_34_7_0 then
                        draw.surface:add_rect_filled(draw.rect(0, 0, slot_34_3_0, slot_34_4_0), draw.color(15, 15, 15, 255))

                        function slot_34_13_2(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
                                if arg_37_2 < slot_34_0_0 then
                                        local var_37_0 = math.min(255, (slot_34_0_0 - arg_37_2) * 200)
                                        local var_37_1 = math.max(0, 20 - (slot_34_0_0 - arg_37_2) * 40)

                                        draw.surface.font = arg_37_3

                                        local var_37_2 = arg_37_3:get_text_size(arg_37_0)

                                        draw.surface:add_text(draw.vec2(slot_34_5_0 - var_37_2.x / 2, slot_34_6_0 + arg_37_1 + var_37_1), arg_37_0, draw.color(255, 255, 255, math.floor(var_37_0)))
                                end
                        end

                        slot_34_15_2 = (slot_0_0_0.font_title:get_text_size(slot_34_10_0).x + 40) * 2.2
                        slot_34_16_3 = slot_34_6_0 - 40
                        slot_34_17_3 = math.min(1, slot_34_0_0 / (slot_34_7_0 * 0.6))

                        draw.surface:add_rect_filled(draw.rect(slot_34_5_0 - slot_34_15_2 / 2, slot_34_16_3, slot_34_5_0 - slot_34_15_2 / 2 + slot_34_15_2 * slot_34_17_3, slot_34_16_3 + 2), draw.color(255, 255, 255, 255))
                        slot_34_13_2(slot_34_10_0, -100, slot_34_7_0 * 0.1, slot_0_0_0.font_title)
                        slot_34_13_2("User: " .. slot_34_8_0, 60, slot_34_7_0 * 0.3, slot_0_0_0.font_subtitle)
                        slot_34_13_2("Build: " .. slot_34_9_0, 110, slot_34_7_0 * 0.4, slot_0_0_0.font_small)
                        slot_34_13_2(slot_34_11_0, 160, slot_34_7_0 * 0.6, slot_0_0_0.font_small)
                end
        elseif slot_34_12_0 == 6 then
                draw.surface:add_rect_filled(draw.rect(0, 0, slot_34_3_0, slot_34_4_0), draw.color(0, 0, 160, 255))

                for iter_34_15 = 1, 60 do
                        slot_34_17_2 = math.random(0, slot_34_3_0)
                        slot_34_18_1 = math.random(0, slot_34_4_0)
                        slot_34_19_1 = math.random(2, 4)

                        draw.surface:add_rect_filled(draw.rect(slot_34_17_2, slot_34_18_1, slot_34_17_2 + slot_34_19_1, slot_34_18_1 + 2), draw.color(255, 255, 255, math.random(20, 60)))
                end

                slot_34_13_1 = math.floor(slot_34_0_0 * 120 % slot_34_4_0)

                draw.surface:add_rect_filled(draw.rect(0, slot_34_13_1, slot_34_3_0, slot_34_13_1 + 30), draw.color(255, 255, 255, 15))
                draw.surface:add_line(draw.vec2(0, slot_34_13_1 + 15), draw.vec2(slot_34_3_0, slot_34_13_1 + math.random(10, 20)), draw.color(255, 255, 255, 80))

                function slot_34_14_1(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
                        local var_38_0 = 0

                        if math.abs(slot_34_13_1 - arg_38_2) < 100 then
                                var_38_0 = math.random(-2, 2)
                        end

                        local var_38_1 = arg_38_1
                        local var_38_2 = arg_38_2 + var_38_0

                        draw.surface.font = arg_38_3

                        draw.surface:add_text(draw.vec2(var_38_1 - 2, var_38_2), arg_38_0, draw.color(255, 0, 0, 180))
                        draw.surface:add_text(draw.vec2(var_38_1 + 2, var_38_2), arg_38_0, draw.color(0, 255, 255, 180))

                        local var_38_3 = math.random(220, 255)

                        draw.surface:add_text(draw.vec2(var_38_1, var_38_2), arg_38_0, draw.color(240, 240, 240, var_38_3))

                        local var_38_4 = arg_38_3:get_text_size(arg_38_0)

                        for iter_38_0 = 0, var_38_4.y, 4 do
                                draw.surface:add_line(draw.vec2(var_38_1, var_38_2 + iter_38_0), draw.vec2(var_38_1 + var_38_4.x, var_38_2 + iter_38_0), draw.color(0, 0, 160, 100))
                        end
                end

                slot_34_14_1("PLAY >", 50, 50, slot_0_0_0.font_title)
                slot_34_14_1("SP", slot_34_3_0 - 100, 50, slot_0_0_0.font_title)

                slot_34_15_1 = math.floor(slot_34_3_0 / 2)
                slot_34_16_1 = math.floor(slot_34_4_0 / 2)
                slot_34_17_1 = "TAPE: " .. slot_34_10_0
                slot_34_18_0 = slot_0_0_0.font_title:get_text_size(slot_34_17_1)

                slot_34_14_1(slot_34_17_1, slot_34_15_1 - math.floor(slot_34_18_0.x / 2), slot_34_4_0 - 180, slot_0_0_0.font_title)

                slot_34_19_0 = "REC: " .. slot_34_8_0 .. " [" .. slot_34_9_0 .. "]"
                slot_34_20_0 = slot_0_0_0.font_subtitle:get_text_size(slot_34_19_0)

                slot_34_14_1(slot_34_19_0, slot_34_15_1 - math.floor(slot_34_20_0.x / 2), slot_34_4_0 - 120, slot_0_0_0.font_subtitle)

                slot_34_21_0 = math.floor(slot_34_0_0 / 60)
                slot_34_22_0 = math.floor(slot_34_0_0 % 60)
                slot_34_23_0 = math.floor(slot_34_0_0 * 30 % 30)
                slot_34_24_0 = string.format("JAN 05 2026   AM 12:%02d:%02d:%02d", slot_34_21_0, slot_34_22_0, slot_34_23_0)

                slot_34_14_1(slot_34_24_0, 50, slot_34_4_0 - 60, slot_0_0_0.font_rain)

                if math.floor(slot_34_0_0 * 2) % 2 == 0 then
                        draw.surface:add_circle_filled(draw.vec2(50, 95), 8, draw.color(255, 0, 0, 255))
                        slot_34_14_1("REC", 70, 85, slot_0_0_0.font_small)
                end
        elseif slot_34_12_0 == 7 then
                draw.surface:add_rect_filled(draw.rect(0, 0, slot_34_3_0, slot_34_4_0), draw.color(25, 25, 30, 255))

                slot_34_13_0 = 500
                slot_34_14_0 = 250
                slot_34_15_0 = slot_34_5_0 - slot_34_13_0 / 2
                slot_34_16_0 = -slot_34_13_0 + slot_34_0_0 * 1200

                if slot_34_15_0 < slot_34_16_0 then
                        slot_34_16_0 = slot_34_15_0
                end

                slot_34_17_0 = slot_34_6_0 - slot_34_14_0 / 2

                draw.surface:add_rect_filled(draw.rect(slot_34_16_0 + 15, slot_34_17_0 + 15, slot_34_16_0 + slot_34_13_0 + 15, slot_34_17_0 + slot_34_14_0 + 15), draw.color(0, 0, 0, 100))
                draw.surface:add_rect_filled(draw.rect(slot_34_16_0, slot_34_17_0, slot_34_16_0 + slot_34_13_0, slot_34_17_0 + slot_34_14_0), draw.color(40, 40, 45, 255))
                draw.surface:add_rect_filled(draw.rect(slot_34_16_0, slot_34_17_0, slot_34_16_0 + 10, slot_34_17_0 + slot_34_14_0), draw.color(100, 100, 255, 255))

                if slot_34_16_0 > -slot_34_13_0 + 50 then
                        draw.surface.font = slot_0_0_0.font_title

                        draw.surface:add_text(draw.vec2(slot_34_16_0 + 40, slot_34_17_0 + 30), slot_34_10_0, draw.color(255, 255, 255, 255))

                        draw.surface.font = slot_0_0_0.font_subtitle

                        draw.surface:add_text(draw.vec2(slot_34_16_0 + 40, slot_34_17_0 + 90), slot_34_8_0, draw.color(200, 200, 220, 255))
                        draw.surface:add_rect_filled(draw.rect(slot_34_16_0 + 40, slot_34_17_0 + 140, slot_34_16_0 + 160, slot_34_17_0 + 170), draw.color(100, 100, 255, 255))

                        draw.surface.font = slot_0_0_0.font_small

                        draw.surface:add_text(draw.vec2(slot_34_16_0 + 50, slot_34_17_0 + 145), slot_34_9_0, draw.color(0, 0, 0, 255))
                        draw.surface:add_text(draw.vec2(slot_34_16_0 + 40, slot_34_17_0 + 210), slot_34_11_0, draw.color(150, 150, 160, 255))
                        draw.surface:add_rect_filled(draw.rect(slot_34_16_0 + slot_34_13_0 - 120, slot_34_17_0 + 30, slot_34_16_0 + slot_34_13_0 - 30, slot_34_17_0 + 120), draw.color(50, 50, 60, 255))
                        draw.surface:add_text(draw.vec2(slot_34_16_0 + slot_34_13_0 - 95, slot_34_17_0 + 65), "USER", draw.color(100, 100, 100, 255))
                end
        end

        if slot_34_7_0 < slot_34_0_0 then
                if not slot_0_0_0.sound_played then
                        if game.engine.client_cmd then
                                game.engine:client_cmd("play buttons/blip1")
                        end

                        slot_0_0_0.sound_played = true
                end

                slot_0_0_0.active = false
                menu_open = true

                if mouse then
                        mouse.pressed = false
                end
        end
end

ffi.cdef("    typedef struct { int x; int y; } POINT;\n    short __stdcall GetAsyncKeyState(int vKey);\n    bool  __stdcall GetCursorPos(POINT* lpPoint);\n    void* fopen(const char *filename, const char *mode);\n    int   fclose(void *stream);\n    int   fseek(void *stream, long int offset, int origin);\n    long  ftell(void *stream);\n    size_t fread(void *ptr, size_t size, size_t nmemb, void *stream);\n    size_t fwrite(const void* ptr, size_t size, size_t count, void* stream);\n    uint32_t __stdcall GetModuleFileNameA(void* hModule, char* lpFilename, uint32_t nSize);\n    bool __stdcall CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall ShellExecuteA(void* hwnd, const char* lpOperation, const char* lpFile, const char* lpParameters, const char* lpDirectory, int nShowCmd);\n    typedef struct {\n        uint32_t dwFileAttributes;\n        int64_t ftCreationTime;\n        int64_t ftLastAccessTime;\n        int64_t ftLastWriteTime;\n        uint32_t nFileSizeHigh;\n        uint32_t nFileSizeLow;\n        uint32_t dwReserved0;\n        uint32_t dwReserved1;\n        char cFileName[260];\n        char cAlternateFileName[14];\n    } WIN32_FIND_DATAA;\n    void* __stdcall FindFirstFileA(const char* lpFileName, WIN32_FIND_DATAA* lpFindFileData);\n    bool __stdcall FindNextFileA(void* hFindFile, WIN32_FIND_DATAA* lpFindFileData);\n    bool __stdcall FindClose(void* hFindFile);\n")

slot_0_32_0 = ffi.cast("short(__stdcall*)(int)", utils.find_export("user32.dll", "GetAsyncKeyState"))
slot_0_33_0 = ffi.cast("bool(__stdcall*)(POINT*)", utils.find_export("user32.dll", "GetCursorPos"))
slot_0_34_0 = ffi.cast("uint32_t(__stdcall*)(void*,char*,uint32_t)", utils.find_export("kernel32.dll", "GetModuleFileNameA"))
slot_0_35_0 = ffi.cast("bool(__stdcall*)(const char*, void*)", utils.find_export("kernel32.dll", "CreateDirectoryA"))
slot_0_36_0 = ffi.cast("void*(__stdcall*)(void*,const char*,const char*,const char*,const char*,int)", utils.find_export("shell32.dll", "ShellExecuteA"))
slot_0_37_0 = ffi.cast("void*(__stdcall*)(const char*,const char*)", utils.find_export("msvcrt.dll", "fopen"))
slot_0_38_0 = ffi.cast("int(__stdcall*)(void*)", utils.find_export("msvcrt.dll", "fclose"))
slot_0_39_0 = ffi.cast("int(__stdcall*)(void*, long, int)", utils.find_export("msvcrt.dll", "fseek"))
slot_0_40_0 = ffi.cast("long(__stdcall*)(void*)", utils.find_export("msvcrt.dll", "ftell"))
slot_0_41_0 = ffi.cast("size_t(__stdcall*)(void*, size_t, size_t, void*)", utils.find_export("msvcrt.dll", "fread"))
slot_0_42_0 = ffi.cast("size_t(__stdcall*)(const void*, size_t, size_t, void*)", utils.find_export("msvcrt.dll", "fwrite"))
slot_0_43_0 = ffi.cast("void*(__stdcall*)(const char*, WIN32_FIND_DATAA*)", utils.find_export("kernel32.dll", "FindFirstFileA"))
slot_0_44_0 = ffi.cast("bool(__stdcall*)(void*, WIN32_FIND_DATAA*)", utils.find_export("kernel32.dll", "FindNextFileA"))
slot_0_45_0 = ffi.cast("bool(__stdcall*)(void*)", utils.find_export("kernel32.dll", "FindClose"))
slot_0_46_0 = 36
slot_0_47_0 = 1
slot_0_48_0 = 8
slot_0_49_0 = 16
slot_0_50_0 = 522
slot_0_51_0 = 0
slot_0_52_0 = 2
slot_0_53_0 = ffi.cast("void*", -1)

if not G then
        G = {}
end

function slot_0_54_0(arg_39_0, arg_39_1, arg_39_2)
        if arg_39_0 < arg_39_1 then
                return arg_39_1
        elseif arg_39_2 < arg_39_0 then
                return arg_39_2
        else
                return arg_39_0
        end
end

function slot_0_55_0(arg_40_0, arg_40_1, arg_40_2)
        return arg_40_0 + (arg_40_1 - arg_40_0) * arg_40_2
end

function slot_0_56_0(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
        local var_41_0 = draw.color(0, 0, 0):hsv(arg_41_0, arg_41_1, arg_41_2)

        if arg_41_3 then
                return var_41_0:mod_a(arg_41_3)
        end

        return var_41_0
end

function slot_0_57_0(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4, arg_42_5)
        return arg_42_0 <= arg_42_4 and arg_42_4 <= arg_42_0 + arg_42_2 and arg_42_1 <= arg_42_5 and arg_42_5 <= arg_42_1 + arg_42_3
end

function slot_0_58_0(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4, arg_43_5, arg_43_6)
        if not arg_43_1 then
                return
        end

        arg_43_0.font = arg_43_1

        arg_43_0:add_text(draw.vec2(arg_43_2, arg_43_3), arg_43_4, arg_43_5, arg_43_6)
end

function slot_0_59_0()
        if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
                return gui.ctx.user.username
        end

        return "User"
end

if not G.ui_funcs then
        G.ui_funcs = {}
end

function G.ui_funcs.draw_sidebar_footer(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5, arg_45_6, arg_45_7)
        local var_45_0 = {
                h = 50,
                x = arg_45_1 + 10,
                y = arg_45_2 + arg_45_4 - 65,
                w = arg_45_3 - 20
        }

        if slot_0_57_0(var_45_0.x, var_45_0.y, var_45_0.w, var_45_0.h, arg_45_5, arg_45_6) or active_item_id == "Main" then
                arg_45_0:add_rect_filled_rounded(draw.rect(var_45_0.x, var_45_0.y, var_45_0.x + var_45_0.w, var_45_0.y + var_45_0.h), theme.colors.bg_item_hover:mod_a(arg_45_7 * 0.5), 4)
        end

        local var_45_1 = arg_45_2 + arg_45_4 - 60
        local var_45_2 = arg_45_1 + 20

        arg_45_0:add_rect_filled(draw.rect(arg_45_1, var_45_1 - 10, arg_45_1 + arg_45_3, var_45_1 - 9), theme.colors.border_inner:mod_a(arg_45_7))

        local var_45_3 = gui.ctx and gui.ctx.user and gui.ctx.user.avatar

        if var_45_3 then
                arg_45_0.g:set_texture(var_45_3)
                arg_45_0:add_rect_filled(draw.rect(var_45_2, var_45_1, var_45_2 + 32, var_45_1 + 32), draw.color(255, 255, 255, 255 * arg_45_7))
                arg_45_0.g:set_texture(nil)
        else
                arg_45_0:add_rect_filled(draw.rect(var_45_2, var_45_1, var_45_2 + 32, var_45_1 + 32), theme.colors.text_dark:mod_a(arg_45_7))
        end

        slot_0_58_0(arg_45_0, theme.fonts.username, var_45_2 + 42, var_45_1 - 2, slot_0_59_0(), theme.colors.text_light:mod_a(arg_45_7))

        local var_45_4 = "Premium"

        if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
                local var_45_5 = gui.ctx.user.username

                if var_45_5 == "LukinhasMenu" then
                        var_45_4 = "Dev"
                elseif var_45_5 == "victorcxz" or var_45_5 == "arionsanz" or var_45_5 == "temniyprince812" then
                        var_45_4 = "Beta-User"
                elseif var_45_5 == "BrayHax" then
                        var_45_4 = "Debug"
                end
        end

        slot_0_58_0(arg_45_0, theme.fonts.premium_tag, var_45_2 + 42, var_45_1 + 16, var_45_4, theme.colors.premium:mod_a(arg_45_7))
end

G = G or {}
G.screen_w, G.screen_h = 2560, 1440
G.dpi_scale = 1

function G.scale_dim(arg_46_0)
        return math.floor(arg_46_0 * (G.dpi_scale or 1))
end

theme = {
        colors = {
                accent = draw.color(140, 120, 255, 255),
                accent_text = draw.color(255, 255, 255, 255),
                bg_sidebar = draw.color(24, 25, 32, 130),
                bg_content = draw.color(32, 33, 40, 100),
                bg_content_grad = draw.color(26, 27, 34, 120),
                bg_item_hover = draw.color(65, 68, 78, 150),
                bg_item_active = draw.color(50, 52, 60, 170),
                text_title = draw.color(255, 255, 255, 255),
                text_light = draw.color(240, 240, 245, 255),
                text_normal = draw.color(185, 190, 200, 255),
                text_dark = draw.color(100, 100, 110, 255),
                border_outer = draw.color(10, 11, 14, 150),
                border_inner = draw.color(80, 82, 94, 120),
                shadow = draw.color(0, 0, 0, 200),
                premium = draw.color(200, 180, 100, 255),
                watermark_user = draw.color(255, 255, 255, 255),
                watermark_sep = draw.color(220, 220, 220, 200),
                watermark_val = draw.color(255, 255, 255, 255),
                kb_success = draw.color(80, 220, 150, 255),
                kb_danger = draw.color(255, 100, 100, 255),
                accent_text = draw.color(255, 255, 255, 255)
        },
        fonts = {
                logo = draw.font_gdi("Segoe UI", 26, draw.font_flags.bold),
                category = draw.font_gdi("Segoe UI", 13, draw.font_flags.bold),
                item = draw.font_gdi("Segoe UI", 14, 0),
                username = draw.font_gdi("Segoe UI", 14, draw.font_flags.bold),
                small = draw.font_gdi("Segoe UI", 11, 0),
                premium_tag = draw.font_gdi("Segoe UI Semibold", 13, 0),
                content_title = draw.font_gdi("Segoe UI Semibold", 16, 0),
                mono = draw.font_gdi("Consolas", 14, 0),
                kb_hud_style1 = draw.font_gdi("Verdana", 14, draw.font_flags.shadow, 0, 255, 700),
                kb_hud_style2 = draw.font_gdi("Segoe UI", 32, draw.font_flags.shadow, 0, 255, 700)
        }
}
slot_0_60_0 = {
        current_language = "EN",
        language_index = 2,
        languages = {
                "PT-BR",
                "EN"
        }
}
slot_0_61_0 = {
        nav_main = {
                ["PT-BR"] = "Principal",
                EN = "Main"
        },
        nav_hvh = {
                ["PT-BR"] = "HVH",
                EN = "HVH"
        },
        nav_waypoints = {
                ["PT-BR"] = "Waypoints",
                EN = "Waypoints"
        },
        nav_jumpscout = {
                ["PT-BR"] = "JumpScout",
                EN = "JumpScout"
        },
        nav_mmhelper = {
                ["PT-BR"] = "MM Helper",
                EN = "MM Helper"
        },
        mmhelper_title = {
                ["PT-BR"] = "MM Helper — Rastreador de Inimigos",
                EN = "MM Helper — Enemy Tracker"
        },
        mmhelper_enable = {
                ["PT-BR"] = "Ativar Enemy Tracker",
                EN = "Enable Enemy Tracker"
        },
        mmhelper_mode = {
                ["PT-BR"] = "Modo",
                EN = "Mode"
        },
        mmhelper_mode_premier = {
                ["PT-BR"] = "Premier (5)",
                EN = "Premier (5)"
        },
        mmhelper_mode_hvh = {
                ["PT-BR"] = "HvH (todos)",
                EN = "HvH (all)"
        },
        mmhelper_mark_selected = {
                ["PT-BR"] = "Marcar pessoas selecionadas",
                EN = "Mark selected people"
        },
        mmhelper_killsay_global = {
                ["PT-BR"] = "Killsays custom (global)",
                EN = "Custom Killsays (global)"
        },
        mmhelper_features_auto = {
                ["PT-BR"] = "Features automáticas (Rage/Legit ao mirar)",
                EN = "Auto features (Rage/Legit on aim)"
        },
        mmhelper_aim_assist = {
                ["PT-BR"] = "Ativar Aim Assist junto (Legit)",
                EN = "Enable Aim Assist (Legit)"
        },
        mmhelper_killsay_per_enemy = {
                ["PT-BR"] = "Killsays por inimigo",
                EN = "Killsays per enemy"
        },
        mmhelper_no_enemies = {
                ["PT-BR"] = "Nenhum inimigo em cache.",
                EN = "No enemies in cache."
        },
        mmhelper_killsay_label = {
                ["PT-BR"] = "Killsay:",
                EN = "Killsay:"
        },
        nav_hchelper = {
                ["PT-BR"] = "HC Helper",
                EN = "HC Helper"
        },
        nav_funny = {
                ["PT-BR"] = "Diversão",
                EN = "Funny"
        },
        nav_games = {
                ["PT-BR"] = "Jogos",
                EN = "Games"
        },
        nav_killsay = {
                ["PT-BR"] = "Killsay",
                EN = "Killsay"
        },
        nav_chatspam = {
                ["PT-BR"] = "Chat Spam",
                EN = "Chat Spam"
        },
        nav_visuals = {
                ["PT-BR"] = "Visuais",
                EN = "Visuals"
        },
        nav_menu = {
                ["PT-BR"] = "Menu",
                EN = "Menu"
        },
        nav_keybinds = {
                ["PT-BR"] = "Keybinds",
                EN = "Keybinds"
        },
        nav_velocity = {
                ["PT-BR"] = "Velocity",
                EN = "Velocity"
        },
        nav_tracers = {
                ["PT-BR"] = "Tracers",
                EN = "Tracers"
        },
        lua_keybinds = {
                ["PT-BR"] = "Lua Keybinds",
                EN = "Lua Keybinds"
        },
        funny_blockbot = {
                ["PT-BR"] = "Blockbot",
                EN = "Blockbot"
        },
        active_tab = {
                ["PT-BR"] = "Aba Ativa: ",
                EN = "Active Tab: "
        },
        watermark_enable = {
                ["PT-BR"] = "Ativar Watermark",
                EN = "Enable Watermark"
        },
        watermark_rgb = {
                ["PT-BR"] = "Watermark RGB (só 'Tueurs')",
                EN = "Watermark RGB ('Tueurs' only)"
        },
        watermark_color_segment = {
                ["PT-BR"] = "Elemento para colorir",
                EN = "Element to color"
        },
        watermark_color_segments = {
                ["PT-BR"] = {
                        "Mudar Tudo",
                        "Tueurs",
                        "User",
                        "FPS",
                        "Ping"
                },
                EN = {
                        "Change All",
                        "Tueurs",
                        "User",
                        "FPS",
                        "Ping"
                }
        },
        watermark_items = {
                ["PT-BR"] = "Itens da Watermark",
                EN = "Watermark Items"
        },
        watermark_preview = {
                ["PT-BR"] = "Pré-visualização da Watermark",
                EN = "Watermark Preview"
        },
        configs_title = {
                ["PT-BR"] = "Configurações",
                EN = "Configurations"
        },
        config_name = {
                ["PT-BR"] = "Nome da Config",
                EN = "Config Name"
        },
        config_list = {
                ["PT-BR"] = "Configs Salvas",
                EN = "Saved Configs"
        },
        config_load = {
                ["PT-BR"] = "Carregar",
                EN = "Load"
        },
        config_save = {
                ["PT-BR"] = "Salvar",
                EN = "Save"
        },
        config_update = {
                ["PT-BR"] = "Atualizar",
                EN = "Update"
        },
        config_refresh = {
                ["PT-BR"] = "Atualizar",
                EN = "Refresh"
        },
        config_delete = {
                ["PT-BR"] = "Deletar",
                EN = "Delete"
        },
        confirm_yes = {
                ["PT-BR"] = "Sim",
                EN = "Yes"
        },
        confirm_cancel = {
                ["PT-BR"] = "Cancelar",
                EN = "Cancel"
        },
        language = {
                ["PT-BR"] = "Idioma",
                EN = "Language"
        },
        welcome_animation = {
                ["PT-BR"] = "Animação de Entrada",
                EN = "Welcome Animation"
        },
        welcome_animation_options = {
                ["PT-BR"] = {
                        "Matrix",
                        "Glitch",
                        "Default"
                },
                EN = {
                        "Matrix",
                        "Glitch",
                        "Default"
                }
        },
        menu_rgb = {
                ["PT-BR"] = "Menu em modo RGB",
                EN = "Menu in RGB mode"
        },
        menu_color_target = {
                ["PT-BR"] = "Alvo para colorir",
                EN = "Target to color"
        },
        menu_color_targets = {
                ["PT-BR"] = {
                        "Bordas",
                        "Nome abas",
                        "Checkboxes",
                        "Fundo"
                },
                EN = {
                        "Borders",
                        "Tab names",
                        "Checkboxes",
                        "Background"
                }
        },
        menu_accent_color = {
                ["PT-BR"] = "Cor de Destaque (accent)",
                EN = "Accent Color"
        },
        menu_glass_effect = {
                ["PT-BR"] = "Efeito de Vidro",
                EN = "Glass Effect"
        },
        waypoints_title = {
                ["PT-BR"] = "Waypoints",
                EN = "Waypoints"
        },
        waypoints_enable = {
                ["PT-BR"] = "Ativar Waypoints",
                EN = "Enable Waypoints"
        },
        waypoints_shapes = {
                ["PT-BR"] = "Formas",
                EN = "Shapes"
        },
        shape_square = {
                ["PT-BR"] = "Quadrado",
                EN = "Square"
        },
        shape_triangle = {
                ["PT-BR"] = "Triângulo",
                EN = "Triangle"
        },
        shape_circle = {
                ["PT-BR"] = "Círculo",
                EN = "Circle"
        },
        shape_star = {
                ["PT-BR"] = "Estrela",
                EN = "Star"
        },
        shape_diamond = {
                ["PT-BR"] = "Diamante",
                EN = "Diamond"
        },
        shape_hexagon = {
                ["PT-BR"] = "Hexágono",
                EN = "Hexagon"
        },
        waypoints_fill = {
                ["PT-BR"] = "Preencher somente se eu estiver em cima",
                EN = "Fill only if I am on top"
        },
        waypoints_link = {
                ["PT-BR"] = "Ligar Linhas (apenas atual ? oposto)",
                EN = "Link Lines (current ? opposite only)"
        },
        waypoints_distance = {
                ["PT-BR"] = "Distância de desenho",
                EN = "Drawing distance"
        },
        waypoints_shape_color = {
                ["PT-BR"] = "Cor das Formas",
                EN = "Shapes Color"
        },
        waypoints_line_color = {
                ["PT-BR"] = "Cor das Linhas",
                EN = "Lines Color"
        },
        waypoints_add_title = {
                ["PT-BR"] = "Adicionar Waypoint",
                EN = "Add Waypoint"
        },
        waypoints_name = {
                ["PT-BR"] = "Nome do waypoint",
                EN = "Waypoint name"
        },
        waypoints_add_button_phase0 = {
                ["PT-BR"] = "Adicionar Par (2 cliques fora do menu)",
                EN = "Add Pair (2 clicks outside menu)"
        },
        waypoints_add_button_phase1 = {
                ["PT-BR"] = "Clique 1 (pegou sua posição)",
                EN = "Click 1 (got your position)"
        },
        waypoints_add_button_phase2 = {
                ["PT-BR"] = "Clique 2 (salva)",
                EN = "Click 2 (saves)"
        },
        waypoints_delete_button = {
                ["PT-BR"] = "Deletar Waypoint",
                EN = "Delete Waypoint"
        },
        waypoints_delete_confirm = {
                ["PT-BR"] = "Confirmar",
                EN = "Confirm"
        },
        waypoints_delete_cancel = {
                ["PT-BR"] = "Cancelar",
                EN = "Cancel"
        },
        waypoints_file = {
                ["PT-BR"] = "Arquivo TXT",
                EN = "TXT File"
        },
        waypoints_load = {
                ["PT-BR"] = "Carregar",
                EN = "Load"
        },
        waypoints_open = {
                ["PT-BR"] = "Abrir",
                EN = "Open"
        },
        waypoints_flow_info = {
                ["PT-BR"] = "Fluxo: Botão ? clique 1 (salva sua pos) ? clique 2 ? escreve 2 linhas no TXT.",
                EN = "Flow: Button ? click 1 (saves your pos) ? click 2 ? writes 2 lines to TXT."
        },
        waypoints_animations_title = {
                ["PT-BR"] = "Animações dos Waypoints",
                EN = "Waypoint Animations"
        },
        anim_pulse = {
                ["PT-BR"] = "Pulsação",
                EN = "Pulse"
        },
        anim_rotate = {
                ["PT-BR"] = "Rotação",
                EN = "Rotation"
        },
        anim_scale = {
                ["PT-BR"] = "Escala",
                EN = "Scale"
        },
        anim_glow = {
                ["PT-BR"] = "Brilho",
                EN = "Glow"
        },
        anim_wave = {
                ["PT-BR"] = "Ondas de Radar",
                EN = "Radar Waves"
        },
        anim_spiral = {
                ["PT-BR"] = "Espiral",
                EN = "Spiral"
        },
        anim_speed = {
                ["PT-BR"] = "Velocidade",
                EN = "Speed"
        },
        anim_intensity = {
                ["PT-BR"] = "Intensidade",
                EN = "Intensity"
        },
        anim_preset_minimal = {
                ["PT-BR"] = "Preset Mínimo",
                EN = "Minimal Preset"
        },
        anim_preset_full = {
                ["PT-BR"] = "Preset Completo",
                EN = "Full Preset"
        },
        waypoints_3d = {
                ["PT-BR"] = "Waypoints 3D",
                EN = "3D Waypoints"
        },
        jumpscout_title = {
                ["PT-BR"] = "JumpScout SSG-08",
                EN = "JumpScout SSG-08"
        },
        jumpscout_enable = {
                ["PT-BR"] = "Ativar JumpScout",
                EN = "Enable JumpScout"
        },
        jumpscout_hitchance = {
                ["PT-BR"] = "Hitchance no Ar",
                EN = "In Air Hitchance"
        },
        jumpscout_pointscale = {
                ["PT-BR"] = "Pointscale no Ar",
                EN = "In Air Pointscale"
        },
        jumpscout_mindamage = {
                ["PT-BR"] = "Min Damage no Ar",
                EN = "In Air Min Damage"
        },
        jumpscout_autoscope = {
                ["PT-BR"] = "Auto-Scope no Ar",
                EN = "In Air Auto-Scope"
        },
        jumpscout_forceshoot = {
                ["PT-BR"] = "Force Shoot no Ar",
                EN = "In Air Force Shoot"
        },
        jumpscout_adaptive = {
                ["PT-BR"] = "Configuração Adaptativa",
                EN = "Adaptive Config"
        },
        jumpscout_autoconfig = {
                ["PT-BR"] = "Auto On Beta",
                EN = "Auto On Beta"
        },
        jumpscout_autopointscale = {
                ["PT-BR"] = "Auto Pointscale",
                EN = "Auto Pointscale"
        },
        jumpscout_mindmg_onland = {
                ["PT-BR"] = "Min Dmg no Chão",
                EN = "Min Dmg on Land"
        },
        jumpscout_force_lethal_air = {
                ["PT-BR"] = "Force Lethal no Ar",
                EN = "Force Lethal in Air"
        },
        jumpscout_headshot_only = {
                ["PT-BR"] = "Apenas Headshot",
                EN = "Headshot Only"
        },
        jumpscout_peek_assist = {
                ["PT-BR"] = "Peek Assist",
                EN = "Peek Assist"
        },
        jumpscout_duckjump = {
                ["PT-BR"] = "Duck Jump",
                EN = "Duck Jump"
        },
        jumpscout_fastladder = {
                ["PT-BR"] = "Fast Ladder",
                EN = "Fast Ladder"
        },
        jumpscout_info = {
                ["PT-BR"] = "Configurações aplicadas automaticamente quando no ar com SSG-08",
                EN = "Settings applied automatically when airborne with SSG-08"
        },
        jumpscout_autoconfig_info = {
                ["PT-BR"] = "HC: 1-30, PS: 50-80, MD: 0-100 (aleatório)",
                EN = "HC: 1-30, PS: 50-80, MD: 0-100 (random)"
        },
        aimlock_title = {
                ["PT-BR"] = "Aimlock Invisível",
                EN = "Invisible Aimlock"
        },
        aimlock_enable = {
                ["PT-BR"] = "Ativar Aimlock",
                EN = "Enable Aimlock"
        },
        aimlock_show_fov = {
                ["PT-BR"] = "Mostrar FOV Circle (Glitch)",
                EN = "Show FOV Circle (Glitch)"
        },
        aimlock_fov_no_anim = {
                ["PT-BR"] = "Desativar Animação Glitch",
                EN = "Disable Glitch Animation"
        },
        aimlock_disable_multi = {
                ["PT-BR"] = "Desativar se =2 Inimigos na Mira",
                EN = "Disable if =2 Enemies Near Crosshair"
        },
        aimlock_multi_distance = {
                ["PT-BR"] = "Distância da Mira (px)",
                EN = "Crosshair Distance (px)"
        },
        aimlock_fov_multiplier = {
                ["PT-BR"] = "Multiplicador de FOV",
                EN = "FOV Multiplier"
        },
        aimlock_disable_distance = {
                ["PT-BR"] = "Distância de Desativação",
                EN = "Disable Distance"
        },
        aimlock_smooth = {
                ["PT-BR"] = "Suavização",
                EN = "Smoothing"
        },
        aimlock_info = {
                ["PT-BR"] = "Aimlock invisível que trava no inimigo mais próximo da mira",
                EN = "Invisible aimlock that locks onto the nearest enemy to crosshair"
        },
        aimlock_detect_enemies = {
                ["PT-BR"] = "Detectar Inimigos",
                EN = "Detect Enemies"
        },
        aimlock_enemy_list = {
                ["PT-BR"] = "Selecione os Alvos:",
                EN = "Select Targets:"
        },
        aimlock_no_enemies = {
                ["PT-BR"] = "Clique em 'Detectar Inimigos' para ver a lista",
                EN = "Click 'Detect Enemies' to see the list"
        },
        chatspam_enable = {
                ["PT-BR"] = "Ativar Chat Spam",
                EN = "Enable Chat Spam"
        },
        chatspam_cooldown = {
                ["PT-BR"] = "Cooldown",
                EN = "Cooldown"
        },
        chatspam_sequential = {
                ["PT-BR"] = "Enviar em sequência",
                EN = "Send sequentially"
        },
        chatspam_message = {
                ["PT-BR"] = "Mensagem",
                EN = "Message"
        },
        chatspam_antikick = {
                ["PT-BR"] = "Tueurs.vote (Auto-Disconnect)",
                EN = "Tueurs.vote (Auto-Disconnect)"
        },
        vote_reveal_enable = {
                ["PT-BR"] = "Vote Reveal",
                EN = "Vote Reveal"
        },
        vote_reveal_notification = {
                ["PT-BR"] = "Notificação",
                EN = "Notification"
        },
        vote_reveal_team_chat = {
                ["PT-BR"] = "Chat da Equipe",
                EN = "Team Chat"
        },
        vote_reveal_all_chat = {
                ["PT-BR"] = "Chat Geral",
                EN = "All Chat"
        },
        vote_reveal_show_enemies = {
                ["PT-BR"] = "Mostrar Votos Inimigos",
                EN = "Show Enemy Votes"
        },
        vote_reveal_show_allies = {
                ["PT-BR"] = "Mostrar Votos Aliados",
                EN = "Show Ally Votes"
        },
        ks_enable = {
                ["PT-BR"] = "Ativar Killsay",
                EN = "Enable Killsay"
        },
        ks_source = {
                ["PT-BR"] = "Fonte das Frases",
                EN = "Phrase Source"
        },
        ks_source_options = {
                ["PT-BR"] = {
                        "Preset Lua",
                        "Arquivo .TXT"
                },
                EN = {
                        "Lua Preset",
                        ".TXT File"
                }
        },
        ks_lang_en = {
                ["PT-BR"] = "Idioma: Inglês",
                EN = "Language: English"
        },
        ks_lang_br = {
                ["PT-BR"] = "Idioma: Português",
                EN = "Language: Portuguese"
        },
        ks_lang_ru = {
                ["PT-BR"] = "Idioma: Russo",
                EN = "Language: Russian"
        },
        ks_load_file = {
                ["PT-BR"] = "Carregar killsay.txt",
                EN = "Load killsay.txt"
        },
        ks_open_folder = {
                ["PT-BR"] = "Abrir Pasta",
                EN = "Open Folder"
        },
        hud_style = {
                ["PT-BR"] = "Estilo do HUD",
                EN = "HUD Style"
        },
        hud_style_options = {
                ["PT-BR"] = {
                        "Estilo 1 (Lista Padrão)",
                        "Estilo 2 (Glitch)"
                },
                EN = {
                        "Style 1 (Default List)",
                        "Style 2 (Glitch)"
                }
        },
        hud1_options = {
                ["PT-BR"] = "Opções do HUD Estilo 1",
                EN = "HUD Style 1 Options"
        },
        hud2_options = {
                ["PT-BR"] = "Opções do HUD Estilo 2",
                EN = "HUD Style 2 Options"
        },
        items_to_show = {
                ["PT-BR"] = "Itens para Exibir",
                EN = "Items to Show"
        },
        ms_selected = {
                ["PT-BR"] = "selecionado(s)",
                EN = "selected"
        },
        hud1_color_mode = {
                ["PT-BR"] = "Modo de Cor (Verde/Vermelho)",
                EN = "Color Mode (Green/Red)"
        },
        hud2_mode_info = {
                ["PT-BR"] = "Modo: Verde/Vermelho + Letras Caindo ao ATIVAR",
                EN = "Mode: Green/Red + Letters Fall on ACTIVATE"
        },
        fall_speed = {
                ["PT-BR"] = "Velocidade da Queda (Gravidade)",
                EN = "Fall Speed (Gravity)"
        },
        aa_manual_values = {
                ["PT-BR"] = "Valores Manuais (Digitar)",
                EN = "Manual Values (Type)"
        },
        aa_lock_stand = {
                ["PT-BR"] = "Fixar em Parado (desliga Automático)",
                EN = "Lock at Stand (disable Automatic)"
        },
        aa_preview = {
                ["PT-BR"] = "Prévia",
                EN = "Preview"
        },
        aa_status = {
                ["PT-BR"] = "Status",
                EN = "Status"
        },
        aa_mode_label = {
                ["PT-BR"] = "Modo: ",
                EN = "Mode: "
        },
        aa_mode_activation = {
                ["PT-BR"] = "Modo de Ativação",
                EN = "Activation Mode"
        },
        aa_show_sections = {
                ["PT-BR"] = "Exibir Seções:",
                EN = "Show Sections:"
        },
        aa_state_auto = {
                ["PT-BR"] = "Automático",
                EN = "Automatic"
        },
        aa_state_indic = {
                ["PT-BR"] = "Indicadores",
                EN = "Indicators"
        },
        waypoints_alerts_title = {
                ["PT-BR"] = "Alertas/Auto-MinDmg",
                EN = "Alerts/Auto-MinDmg"
        },
        waypoints_sound_alert = {
                ["PT-BR"] = "Alerta Sonoro",
                EN = "Sound Alert"
        },
        waypoints_alert_distance = {
                ["PT-BR"] = "Dist. do Alerta",
                EN = "Alert Distance"
        },
        waypoints_cooldown = {
                ["PT-BR"] = "Cooldown (s)",
                EN = "Cooldown (s)"
        },
        waypoints_auto_mindmg_rage = {
                ["PT-BR"] = "Auto MinDmg (Rage)",
                EN = "Auto MinDmg (Rage)"
        },
        waypoints_auto_mindmg_legit = {
                ["PT-BR"] = "Auto MinDmg (Legit)",
                EN = "Auto MinDmg (Legit)"
        },
        waypoints_ia_mindmg_title = {
                ["PT-BR"] = "IA MinDmg (por HP do inimigo)",
                EN = "AI MinDmg (by enemy HP)"
        },
        waypoints_ia_mindmg_enable = {
                ["PT-BR"] = "Ativar IA MinDmg",
                EN = "Enable AI MinDmg"
        },
        waypoints_ia_mindmg_distance = {
                ["PT-BR"] = "Dist. da IA",
                EN = "AI Distance"
        },
        waypoints_preview = {
                ["PT-BR"] = "Pré-visualização (Waypoints)",
                EN = "Preview (Waypoints)"
        },
        tracers_title = {
                ["PT-BR"] = "Player Tracers",
                EN = "Player Tracers"
        },
        tracers_enable = {
                ["PT-BR"] = "Ativar Tracers",
                EN = "Enable Tracers"
        },
        tracers_settings = {
                ["PT-BR"] = "Configurações",
                EN = "Settings"
        },
        tracers_trail_length = {
                ["PT-BR"] = "Comprimento da Trilha",
                EN = "Trail Length"
        },
        tracers_line_thickness = {
                ["PT-BR"] = "Espessura da Linha",
                EN = "Line Thickness"
        },
        tracers_style = {
                ["PT-BR"] = "Estilo Visual",
                EN = "Visual Style"
        },
        tracers_style_options = {
                ["PT-BR"] = {
                        "Simple",
                        "Neon Glow",
                        "Gradient",
                        "Particles",
                        "Laser Beam"
                },
                EN = {
                        "Simple",
                        "Neon Glow",
                        "Gradient",
                        "Particles",
                        "Laser Beam"
                }
        },
        tracers_glow_intensity = {
                ["PT-BR"] = "Intensidade do Glow",
                EN = "Glow Intensity"
        },
        tracers_particle_density = {
                ["PT-BR"] = "Densidade de Partículas",
                EN = "Particle Density"
        },
        tracers_animation = {
                ["PT-BR"] = "Animação",
                EN = "Animation"
        },
        tracers_animation_options = {
                ["PT-BR"] = {
                        "None",
                        "Pulse",
                        "Wave",
                        "Rainbow",
                        "Glitch"
                },
                EN = {
                        "None",
                        "Pulse",
                        "Wave",
                        "Rainbow",
                        "Glitch"
                }
        },
        tracers_color = {
                ["PT-BR"] = "Cor da Trilha",
                EN = "Trail Color"
        },
        tracers_preview = {
                ["PT-BR"] = "Pré-visualização",
                EN = "Preview"
        },
        velocity_title = {
                ["PT-BR"] = "Velocity Meter",
                EN = "Velocity Meter"
        },
        velocity_enable = {
                ["PT-BR"] = "Ativar Velocity Meter",
                EN = "Enable Velocity Meter"
        },
        velocity_style_label = {
                ["PT-BR"] = "Estilo de Visualização",
                EN = "Visualization Style"
        },
        velocity_style_options = {
                ["PT-BR"] = {
                        "Barra Horizontal",
                        "Círculo",
                        "Gráfico",
                        "Numérico",
                        "Onda",
                        "Velocímetro",
                        "Radar",
                        "Hexágono",
                        "Neon"
                },
                EN = {
                        "Horizontal Bar",
                        "Circle",
                        "Graph",
                        "Numeric",
                        "Wave",
                        "Speedometer",
                        "Radar",
                        "Hexagon",
                        "Neon"
                }
        },
        velocity_color_mode = {
                ["PT-BR"] = "Modo de Cor",
                EN = "Color Mode"
        },
        velocity_color_mode_options = {
                ["PT-BR"] = {
                        "Baseado na Velocidade",
                        "Cor Estática",
                        "Rainbow"
                },
                EN = {
                        "Speed Based",
                        "Static Color",
                        "Rainbow"
                }
        },
        velocity_show_numeric = {
                ["PT-BR"] = "Mostrar Valor Numérico",
                EN = "Show Numeric Value"
        },
        velocity_preview = {
                ["PT-BR"] = "Preview (Animado)",
                EN = "Preview (Animated)"
        },
        menu_ui_sounds_enable = {
                ["PT-BR"] = "Ativar Sons da UI",
                EN = "Enable UI Sounds"
        },
        menu_ui_tab_volume = {
                ["PT-BR"] = "Volume Troca de Abas",
                EN = "Tab Switch Volume"
        },
        menu_ui_checkbox_volume = {
                ["PT-BR"] = "Volume Checkboxes",
                EN = "Checkbox Volume"
        },
        nav_hitlogs = {
                ["PT-BR"] = "Hit Logs",
                EN = "Hit Logs"
        },
        hitlogs_title = {
                ["PT-BR"] = "Hit/Hurt Logs",
                EN = "Hit/Hurt Logs"
        },
        hitlogs_enable = {
                ["PT-BR"] = "Ativar Logs",
                EN = "Enable Logs"
        },
        hitlogs_show_hit = {
                ["PT-BR"] = "Mostrar Hits",
                EN = "Show Hits"
        },
        hitlogs_show_hurt = {
                ["PT-BR"] = "Mostrar Hurts",
                EN = "Show Hurts"
        },
        hitlogs_show_bomb = {
                ["PT-BR"] = "Mostrar Eventos da Bomba",
                EN = "Show Bomb Events"
        },
        hitlogs_show_round = {
                ["PT-BR"] = "Mostrar Início de Round",
                EN = "Show Round Start"
        },
        hitlogs_visual_style = {
                ["PT-BR"] = "Estilo Visual",
                EN = "Visual Style"
        },
        hitlogs_visual_styles = {
                ["PT-BR"] = {
                        "Simples",
                        "Caixa",
                        "Glow",
                        "Gradiente",
                        "Neon"
                },
                EN = {
                        "Simple",
                        "Box",
                        "Glow",
                        "Gradient",
                        "Neon"
                }
        },
        hitlogs_animation = {
                ["PT-BR"] = "Animação",
                EN = "Animation"
        },
        hitlogs_animations = {
                ["PT-BR"] = {
                        "Fade",
                        "Deslizar",
                        "Bounce",
                        "Escala",
                        "Rainbow"
                },
                EN = {
                        "Fade",
                        "Slide",
                        "Bounce",
                        "Scale",
                        "Rainbow"
                }
        },
        hitlogs_max_logs = {
                ["PT-BR"] = "Máximo de Logs",
                EN = "Max Logs"
        },
        hitlogs_fade_time = {
                ["PT-BR"] = "Tempo de Fade (s)",
                EN = "Fade Time (s)"
        },
        hitlogs_drag_info = {
                ["PT-BR"] = "Use Shift+Drag para mover a posição",
                EN = "Use Shift+Drag to move position"
        },
        discord_bug_report = {
                ["PT-BR"] = "Qualquer dúvida ou bugs reporta no Discord",
                EN = "Any questions or bugs report on Discord"
        },
        game_snake = {
                ["PT-BR"] = "Jogo da Cobrinha (Snake)",
                EN = "Snake"
        },
        game_minesweeper = {
                ["PT-BR"] = "Campo Minado (Minesweeper)",
                EN = "Minesweeper"
        },
        game_chess = {
                ["PT-BR"] = "Xadrez com IA",
                EN = "Chess with AI"
        },
        game_difficulty = {
                ["PT-BR"] = "Dif",
                EN = "Diff"
        },
        game_diff_easy = {
                ["PT-BR"] = "Fácil",
                EN = "Easy"
        },
        game_diff_medium = {
                ["PT-BR"] = "Médio",
                EN = "Medium"
        },
        game_diff_hard = {
                ["PT-BR"] = "Difícil",
                EN = "Hard"
        },
        game_your_turn_white = {
                ["PT-BR"] = "Seu turno (Brancas)",
                EN = "Your turn (White)"
        },
        game_ai_turn_black = {
                ["PT-BR"] = "Turno da IA (Pretas)",
                EN = "AI turn (Black)"
        },
        game_ai_thinking = {
                ["PT-BR"] = "IA pensando...",
                EN = "AI thinking..."
        },
        game_difficulty_label = {
                ["PT-BR"] = "Dificuldade",
                EN = "Difficulty"
        },
        game_difficulty_ai_label = {
                ["PT-BR"] = "Dificuldade IA",
                EN = "AI Difficulty"
        },
        game_open_miniui = {
                ["PT-BR"] = "Abrir Mini-UI",
                EN = "Open Mini-UI"
        },
        game_score = {
                ["PT-BR"] = "Pontuação",
                EN = "Score"
        },
        game_controls_arrows = {
                ["PT-BR"] = "Controles: Setas do Teclado",
                EN = "Controls: Arrow Keys"
        },
        game_over = {
                ["PT-BR"] = "GAME OVER!",
                EN = "GAME OVER!"
        },
        game_restart = {
                ["PT-BR"] = "Reiniciar",
                EN = "Restart"
        },
        game_left_click_reveal = {
                ["PT-BR"] = "Clique esquerdo: revelar | Shift+Clique: bandeira",
                EN = "Left click: reveal | Shift+Click: flag"
        },
        game_you_won = {
                ["PT-BR"] = "VENCEU!",
                EN = "YOU WON!"
        },
        game_exploded = {
                ["PT-BR"] = "EXPLODIU!",
                EN = "EXPLODED!"
        },
        game_check = {
                ["PT-BR"] = "XEQUE!",
                EN = "CHECK!"
        },
        game_player_won = {
                ["PT-BR"] = "VOCÊ VENCEU!",
                EN = "YOU WON!"
        },
        game_ai_won = {
                ["PT-BR"] = "IA VENCEU!",
                EN = "AI WON!"
        },
        game_draw = {
                ["PT-BR"] = "EMPATE!",
                EN = "DRAW!"
        },
        miniui_active_hint = {
                ["PT-BR"] = "Mini UI ativa (Shift-arrastar para mover, X para fechar)",
                EN = "Mini UI active (Shift-drag to move, X to close)"
        },
        game_ai_captured = {
                ["PT-BR"] = "IA capturou: ",
                EN = "AI captured: "
        },
        game_ai_last_move = {
                ["PT-BR"] = "Último movimento da IA",
                EN = "AI last move"
        },
        piece_pawn = {
                ["PT-BR"] = "Peão",
                EN = "Pawn"
        },
        piece_knight = {
                ["PT-BR"] = "Cavalo",
                EN = "Knight"
        },
        piece_bishop = {
                ["PT-BR"] = "Bispo",
                EN = "Bishop"
        },
        piece_rook = {
                ["PT-BR"] = "Torre",
                EN = "Rook"
        },
        piece_queen = {
                ["PT-BR"] = "Rainha",
                EN = "Queen"
        },
        piece_king = {
                ["PT-BR"] = "Rei",
                EN = "King"
        },
        piece_king = {
                ["PT-BR"] = "Rei",
                EN = "King"
        },
        hchelper_title = {
                ["PT-BR"] = "HC Helper (Todas as Armas)",
                EN = "HC Helper (All Weapons)"
        },
        hchelper_enable = {
                ["PT-BR"] = "Ativar HC Helper",
                EN = "Enable HC Helper"
        },
        hchelper_info = {
                ["PT-BR"] = "Sistema avançado de HC/MinDmg com ajuste automático e anti-miss",
                EN = "Advanced HC/MinDmg system with auto-adjust and anti-miss"
        },
        hchelper_auto = {
                ["PT-BR"] = "Modo Automático",
                EN = "Auto Mode"
        },
        hchelper_hitchance = {
                ["PT-BR"] = "Hitchance Alvo",
                EN = "Target Hitchance"
        },
        hchelper_mindmg = {
                ["PT-BR"] = "Min Damage Alvo",
                EN = "Target Min Damage"
        },
        hchelper_status = {
                ["PT-BR"] = "Status",
                EN = "Status"
        },
        hchelper_active = {
                ["PT-BR"] = "Ativo",
                EN = "Active"
        },
        hchelper_inactive = {
                ["PT-BR"] = "Inativo",
                EN = "Inactive"
        },
        hchelper_antimiss = {
                ["PT-BR"] = "Anti-Miss (Auto HC+)",
                EN = "Anti-Miss (Auto HC+)"
        },
        hchelper_antimiss_info = {
                ["PT-BR"] = "Incremento: Deagle/R8: +7 | AWP: +5 | Auto: +3 | Scout: +10 | Demais: +4",
                EN = "Increment: Deagle/R8: +7 | AWP: +5 | Auto: +3 | Scout: +10 | Others: +4"
        },
        hchelper_antimiss_conflict = {
                ["PT-BR"] = "Misses: %d | HC aumentado a cada miss",
                EN = "Misses: %d | HC increased on each miss"
        }
}

function slot_0_62_0(arg_47_0, arg_47_1)
        local var_47_0 = slot_0_60_0 and slot_0_60_0.current_language or "PT-BR"
        local var_47_1 = slot_0_61_0 and slot_0_61_0[arg_47_0]

        if var_47_1 and var_47_1[var_47_0] then
                return var_47_1[var_47_0]
        end

        if var_47_1 and var_47_1.EN then
                return var_47_1.EN
        end

        return arg_47_1 or arg_47_0
end

function slot_0_63_0(arg_48_0, arg_48_1)
        return slot_0_62_0(arg_48_0, arg_48_1)
end

function slot_0_64_0()
        local var_49_0 = slot_0_60_0 and slot_0_60_0.current_language or "PT-BR"

        if type(var_49_0) ~= "string" then
                var_49_0 = tostring(var_49_0 or "")
        end

        local var_49_1 = string.lower(var_49_0)

        if var_49_1 == "en" or var_49_1 == "english" then
                return true
        end

        if string.sub(var_49_1, 1, 2) == "en" then
                return true
        end

        if slot_0_60_0 and slot_0_60_0.language_index and slot_0_60_0.languages then
                local var_49_2 = slot_0_60_0.language_index
                local var_49_3 = slot_0_60_0.languages[var_49_2]

                if type(var_49_3) == "string" then
                        local var_49_4 = string.lower(var_49_3)

                        if var_49_4 == "en" or var_49_4 == "english" or string.sub(var_49_4, 1, 2) == "en" then
                                return true
                        end
                end
        end

        return false
end

slot_0_65_0 = {
        released = false,
        down = false,
        pressed = false,
        x = 0,
        y = 0
}
slot_0_66_0 = false
slot_0_67_0 = {
        y = nil
}
menu_open, last_home_toggle = false, 0
dragging, drag_offset = false, {}
resizing, resize_start_pos, resize_start_size = false, {}, {}
active_control_id, open_control_rect = nil
open_control_rect_prev = nil
color_picker_open, color_picker_target = false
deferred, opened_this_frame = {}, false

function defer(arg_50_0)
        table.insert(deferred, arg_50_0)
end

scroll_states = {}
scroll_this_frame = 0
game_panel_active = false
slot_0_68_0 = 0
slot_0_69_0 = -1
slot_0_70_0 = G.screen_w
slot_0_71_0 = G.screen_h
slot_0_72_0 = 400
slot_0_73_0 = slot_0_71_0 - 40
slot_0_74_0 = G.scale_dim(750)
slot_0_75_0 = slot_0_70_0 - 40
G = G or {}
G.MIN_CONTENT_W = G.MIN_CONTENT_W or G.scale_dim(380)
G.antiafk = G.antiafk or {
        last_tick_count = 0,
        should_start = false,
        enable = false,
        freeze_time = 20,
        time_in_ticks = 0,
        spawn_position = nil
}
G.tracers = G.tracers or {
        shift_speed = 10,
        trail_length = 35,
        enable = false,
        particle_density = 15,
        glow_intensity = 3,
        line_thickness = 5,
        style = 1,
        animation = 1,
        trail_points = {},
        color_hsv = {
                v = 1,
                s = 1,
                h = 120
        }
}
G.hitlogs = G.hitlogs or {
        drag_offset_y = 0,
        drag_offset_x = 0,
        animation_style = 1,
        visual_style = 1,
        position_y = 400,
        position_x = 100,
        show_round = false,
        show_bomb = true,
        show_hurt = true,
        show_hit = true,
        enable = false,
        max_logs = 7,
        fade_time = 6,
        dragging = false,
        data = {},
        hitgroup_names = {
                [0] = "generic",
                "head",
                "chest",
                "stomach",
                "left arm",
                "right arm",
                "left leg",
                "right leg"
        },
        weapon_names = {
                negev = "Negev",
                sawedoff = "Sawed-Off",
                tec9 = "Tec-9",
                hkp2000 = "P2000",
                mp7 = "MP7",
                mp9 = "MP9",
                nova = "Nova",
                p250 = "P250",
                scar20 = "SCAR-20",
                sg556 = "SG 553",
                ssg08 = "SSG 08",
                knife = "Knife",
                hegrenade = "HE Grenade",
                molotov = "Molotov",
                incgrenade = "Molotov",
                taser = "Zeus",
                usp_silencer = "USP-S",
                cz75a = "CZ75-Auto",
                revolver = "R8 Revolver",
                deagle = "Desert Eagle",
                elite = "Dual Berettas",
                fiveseven = "Five-SeveN",
                glock = "Glock-18",
                ak47 = "AK-47",
                aug = "AUG",
                awp = "AWP",
                famas = "FAMAS",
                g3sg1 = "G3SG1",
                galilar = "Galil AR",
                m249 = "M249",
                m4a1 = "M4A4",
                mac10 = "MAC-10",
                p90 = "P90",
                m4a1_silencer = "M4A1-S",
                mp5sd = "MP5-SD",
                ump45 = "UMP-45",
                xm1014 = "XM1014",
                bizon = "PP-Bizon",
                mag7 = "MAG-7"
        },
        bomb_event_names = {
                bomb_exploded = "Exploded the bomb",
                bomb_beginplant = "Began planting the bomb",
                bomb_defused = "Defused the bomb",
                bomb_abortplant = "Cancelled planting the bomb",
                bomb_planted = "Planted the bomb"
        }
}

setmetatable(G.hitlogs.hitgroup_names, {
        __index = function(arg_51_0, arg_51_1)
                return arg_51_1
        end
})
setmetatable(G.hitlogs.weapon_names, {
        __index = function(arg_52_0, arg_52_1)
                return "undefined"
        end
})
setmetatable(G.hitlogs.bomb_event_names, {
        __index = function(arg_53_0, arg_53_1)
                return arg_53_1
        end
})

slot_0_76_0 = G.scale_dim(100)
slot_0_77_0 = G.scale_dim(100)
slot_0_78_0 = G.scale_dim(900)
slot_0_79_0 = G.scale_dim(620)
slot_0_80_0 = G.scale_dim(200)
slot_0_81_0 = G.scale_dim(8)
G.content_scroll_y = G.content_scroll_y or {}
G.FREE_VERSION_LOCKED_TABS = {
        Killsay = true,
        MMHelper = true,
        Waypoints = true,
        HCHelper = true
}
G.FREE_VERSION_NOTICE_SHOWN = false

function G.render_locked_tab(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4, arg_54_5)
        slot_54_6_0 = slot_0_60_0 and slot_0_60_0.lang == "ptbr"
        slot_54_7_0 = slot_54_6_0 and "RECURSO EXCLUSIVO" or "EXCLUSIVE FEATURE"
        slot_54_8_0 = slot_54_6_0 and "Esta funcionalidade foi desabilitada na Tueurs.New." or "This feature has been disabled in Tueurs.New."
        slot_54_9_0 = slot_54_6_0 and "Disponivel apenas na Tueurs.Pro." or "Available only in Tueurs.Pro."
        slot_54_10_0 = slot_54_6_0 and "Updates futuros serao apenas na Tueurs.Pro." or "Future updates will only be in Tueurs.Pro."
        slot_54_11_0 = math.min(arg_54_3 - 40, 420)
        slot_54_12_0 = 160
        slot_54_13_0 = arg_54_1 + (arg_54_3 - slot_54_11_0) / 2
        slot_54_14_0 = arg_54_2 + 40

        arg_54_0:add_rect_filled_rounded(draw.rect(slot_54_13_0, slot_54_14_0, slot_54_13_0 + slot_54_11_0, slot_54_14_0 + slot_54_12_0), draw.color(20, 20, 28, math.floor(230 * arg_54_5)), 10)
        arg_54_0:add_rect_rounded(draw.rect(slot_54_13_0, slot_54_14_0, slot_54_13_0 + slot_54_11_0, slot_54_14_0 + slot_54_12_0), draw.color(255, 80, 80, math.floor(180 * arg_54_5)), 10)

        slot_54_15_0 = slot_54_13_0 + slot_54_11_0 / 2
        slot_54_16_0 = slot_54_14_0 + 18

        arg_54_0:add_rect_filled_rounded(draw.rect(slot_54_15_0 - 12, slot_54_16_0 + 10, slot_54_15_0 + 12, slot_54_16_0 + 28), draw.color(255, 80, 80, math.floor(255 * arg_54_5)), 3)
        arg_54_0:add_rect_rounded(draw.rect(slot_54_15_0 - 8, slot_54_16_0, slot_54_15_0 + 8, slot_54_16_0 + 14), draw.color(255, 80, 80, math.floor(255 * arg_54_5)), 4, 2)

        slot_54_17_0 = theme.fonts.content_title:get_text_size(slot_54_7_0)

        slot_0_58_0(arg_54_0, theme.fonts.content_title, slot_54_13_0 + (slot_54_11_0 - slot_54_17_0.x) / 2, slot_54_14_0 + 50, slot_54_7_0, draw.color(255, 100, 100, math.floor(255 * arg_54_5)))

        slot_54_18_2 = slot_54_14_0 + 80

        slot_0_58_0(arg_54_0, theme.fonts.item, slot_54_13_0 + 20, slot_54_18_2, slot_54_8_0, draw.color(200, 200, 210, math.floor(220 * arg_54_5)))

        slot_54_18_1 = slot_54_18_2 + 22

        slot_0_58_0(arg_54_0, theme.fonts.item, slot_54_13_0 + 20, slot_54_18_1, slot_54_9_0, draw.color(180, 140, 255, math.floor(255 * arg_54_5)))

        slot_54_18_0 = slot_54_18_1 + 22

        slot_0_58_0(arg_54_0, theme.fonts.item, slot_54_13_0 + 20, slot_54_18_0, slot_54_10_0, draw.color(150, 150, 160, math.floor(180 * arg_54_5)))
end

slot_0_82_0 = {
        {
                is_open = false,
                label_key = "nav_hvh",
                id = "HVH",
                select_alpha = 0,
                hover_alpha = 0,
                is_category = true
        },
        {
                parent = "HVH",
                label_key = "nav_waypoints",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Waypoints"
        },
        {
                parent = "HVH",
                label_key = "nav_jumpscout",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "JumpScout"
        },
        {
                parent = "HVH",
                label_key = "aimlock",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Aimlock"
        },
        {
                parent = "HVH",
                label_key = "nav_mmhelper",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "MMHelper"
        },
        {
                parent = "HVH",
                label_key = "nav_hchelper",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "HCHelper"
        },
        {
                is_open = false,
                label_key = "nav_funny",
                id = "Funny",
                select_alpha = 0,
                hover_alpha = 0,
                is_category = true
        },
        {
                parent = "Funny",
                label_key = "nav_killsay",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Killsay"
        },
        {
                parent = "Funny",
                label_key = "funny_blockbot",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Blockbot"
        },
        {
                parent = "Funny",
                label_key = "nav_chatspam",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "ChatSpam"
        },
        {
                parent = "Funny",
                label_key = "nav_games",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Games"
        },
        {
                is_open = false,
                label_key = "nav_visuals",
                id = "Visuals",
                select_alpha = 0,
                hover_alpha = 0,
                is_category = true
        },
        {
                parent = "Visuals",
                label_key = "nav_menu",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Menu"
        },
        {
                parent = "Visuals",
                label_key = "nav_keybinds",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Keybinds"
        },
        {
                parent = "Visuals",
                label_key = "nav_velocity",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Velocity"
        },
        {
                parent = "Visuals",
                label_key = "nav_tracers",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "Tracers"
        },
        {
                parent = "Visuals",
                label_key = "nav_hitlogs",
                icon = "•",
                select_alpha = 0,
                hover_alpha = 0,
                id = "HitLogs"
        }
}
slot_0_83_0 = "Main"
slot_0_84_0 = "01/11/2026"
slot_0_85_0 = "11/01/2026"
slot_0_86_0 = {
        anim_text_input = false,
        anim_speed = 2.5,
        anim_dropdown = false,
        anim_enable = false,
        is_rgb = false,
        blur_enable = false,
        transparency = 0.95,
        ui_checkbox_volume = 0.7,
        enable_ui_sounds = true,
        anim_buttons = false,
        target_index = 1,
        ui_tab_volume = 1,
        anim_easing = 1,
        accent_hue = 212,
        accent_val = 1,
        accent_sat = 1,
        anim_pulse = false,
        anim_glow = 0.6,
        anim_rainbow = false,
        anim_particles = false,
        anim_checkbox = false,
        target_hsv = {
                borders = {
                        v = 0.35,
                        s = 0.2,
                        h = 212
                },
                tabs = {
                        v = 1,
                        s = 0.7,
                        h = 212
                },
                checks = {
                        v = 1,
                        s = 0.55,
                        h = 146
                },
                bg = {
                        v = 0.12,
                        s = 0.1,
                        h = 212
                }
        },
        target_key_map = {
                ["Tab names"] = "tabs",
                Borders = "borders",
                Fundo = "bg",
                Checkboxes = "checks",
                ["Nome abas"] = "tabs",
                Bordas = "borders",
                Accent = "accent",
                Background = "bg"
        }
}
slot_0_87_0 = {
        config_name_input = "",
        confirm_config_name = "",
        wm_is_rgb = false,
        wm_animated_enabled = false,
        welcome_shown = false,
        welcome_animation = 1,
        wm_drag_offy = 0,
        wm_drag_offx = 0,
        wm_dragging = false,
        wm_y = 40,
        wm_x = 40,
        show_load_confirm = false,
        kb_anim_mode = 1,
        wm_segment_index = 1,
        tueurs_detect = false,
        show_save_confirm = false,
        show_delete_confirm = false,
        show_update_confirm = false,
        wm_enabled = true,
        selected_config_index = 1,
        wm_selected = {
                User = false,
                Build = false,
                FPS = false,
                Ping = false
        },
        wm_colors = {
                tueurs = {
                        v = 1,
                        s = 0.65,
                        h = 280
                },
                user = {
                        v = 1,
                        s = 0,
                        h = 0
                },
                fps = {
                        v = 1,
                        s = 0,
                        h = 0
                },
                ping = {
                        v = 1,
                        s = 0,
                        h = 0
                }
        },
        kb_color = {
                v = 1,
                s = 0,
                h = 0
        },
        config_list = {
                "-"
        }
}
slot_0_88_0 = {
        message2 = "",
        antikick_enable = false,
        vote_reveal_show_enemies = false,
        message1 = "Tueurs on top!",
        last_sent_message = "",
        current_message_index = 1,
        last_sent_time = 0,
        sequential = false,
        vote_reveal_enable = false,
        vote_reveal_all_chat = false,
        enable = false,
        vote_reveal_show_allies = true,
        vote_reveal_team_chat = false,
        message3 = "",
        vote_reveal_notification = true,
        cooldown = 0.5
}
hvh = {
        txt_path_input = "",
        new_name = "",
        automd_legit = false,
        automd = false,
        waypoints_3d = false,
        ia_md_dist = 400,
        ia_md = false,
        js_fastladder = false,
        add_phase = 0,
        show_coords = false,
        js_adaptive = false,
        js_headshot_only = false,
        delete_phase = 0,
        js_force_lethal_air = false,
        js_enable = false,
        warn_dist = 300,
        warn_cd = 1,
        warn_last = 0,
        js_forceshoot = false,
        js_hitchance = 0,
        js_autoscope = false,
        js_pointscale = 0,
        js_mindamage = 0,
        wp_enable = false,
        anti_miss_count = 0,
        anti_miss_enable = false,
        link_lines = false,
        hc_enable = false,
        js_original_md = nil,
        js_original_md_saved = false,
        js_autoconfig = false,
        js_original_hc_saved = false,
        fill_on_top = false,
        js_autopointscale = false,
        js_mindmg_onland = 50,
        js_peek_assist = false,
        js_duck_jump = false,
        show_opposite_out_of_range = false,
        anim_intensity = 1,
        anim_speed = 1,
        hc_auto = false,
        hc_original_md = nil,
        velocity_show_numeric = true,
        original_values_saved_on_start = false,
        hc_mindmg = 0,
        hc_value = 15,
        velocity_color_mode = 1,
        velocity_peak_time = 0,
        velocity_peak_speed = 0,
        velocity_drag_offset_y = 0,
        velocity_drag_offset_x = 0,
        velocity_dragging = false,
        velocity_total_distance = 0,
        velocity_position_y = 50,
        velocity_position_x = 50,
        velocity_avg_speed = 0,
        velocity_avg_samples = 0,
        dist = 500,
        velocity_max_history = 60,
        velocity_style = 1,
        velocity_enable = false,
        hc_active = false,
        hc_fire_time = 0,
        hc_last_ammo = nil,
        anti_miss_active = false,
        anti_miss_last_shot_time = 0,
        warn_on = false,
        shapes = {
                Square = false,
                Triangle = false,
                Hexagon = false,
                Diamond = false,
                Star = false,
                Circle = false
        },
        animations = {
                glow = false,
                spiral = false,
                scale = false,
                rotate = false,
                pulse = false,
                wave = false
        },
        _wave_history = {},
        shape_color_hsv = {
                v = 1,
                s = 0.9,
                h = 140
        },
        line_color_hsv = {
                v = 1,
                s = 0.9,
                h = 60
        },
        shape_color = draw.color(85, 255, 85),
        line_color = draw.color(255, 255, 85),
        waypoints = {},
        delete_candidates = {},
        velocity_history = {},
        indicator_drag = {
                dragging = false,
                offset_y = 0,
                offset_x = 0
        }
}
slot_0_89_0 = {
        last_sent = 0,
        enable = false,
        cooldown = 0,
        txt_path = "",
        src_index = 1,
        langs = {
                ENG = false,
                BR = false,
                RU = false
        },
        messagesENG = {
                "Nice shot!",
                "Too easy!"
        },
        messagesBR = {
                "Boa!",
                "Tá fácil!"
        },
        messagesRU = {
                "??????? ???????!",
                "??????? ?????!",
                "???",
                "??",
                "????? ? ????????? ???"
        },
        decks = {
                ENG = {},
                BR = {},
                RU = {}
        }
}

function slot_0_90_0(arg_55_0, arg_55_1)
        arg_55_0[#arg_55_0 + 1] = arg_55_1
end

slot_0_91_0 = {}

function slot_0_92_0(arg_56_0, arg_56_1)
        if arg_56_0 ~= nil then
                slot_0_91_0[arg_56_0] = arg_56_1
        end
end

if weapon_id then
        slot_0_92_0(weapon_id.ssg08, "SSG-08")
        slot_0_92_0(weapon_id.awp, "AWP")
        slot_0_92_0(weapon_id.g3sg1, "Auto Snipers")
        slot_0_92_0(weapon_id.scar20, "Auto Snipers")
        slot_0_92_0(weapon_id.deagle, "Desert Eagle")
        slot_0_92_0(weapon_id.r8 or weapon_id.revolver, "R8 Revolver")
        slot_0_92_0(weapon_id.elite, "Pistols")
        slot_0_92_0(weapon_id.fiveseven, "Pistols")
        slot_0_92_0(weapon_id.glock, "Pistols")
        slot_0_92_0(weapon_id.hkp2000, "Pistols")
        slot_0_92_0(weapon_id.p250, "Pistols")
        slot_0_92_0(weapon_id.tec9, "Pistols")
        slot_0_92_0(weapon_id.usp_silencer, "Pistols")
        slot_0_92_0(weapon_id.cz75a, "Pistols")
end

slot_0_93_0 = {
        {
                label = "Peek Assist",
                path = "misc>movement>peek assist"
        },
        {
                label = "SlowWalk",
                path = "misc>movement>slowwalk"
        },
        {
                label = "Jump Bug",
                path = "misc>movement>jumpbug"
        },
        {
                label = "Edge Jump",
                path = "misc>movement>edge jump"
        },
        {
                label = "ThirdPerson",
                path = "visuals>misc>local>thirdperson"
        },
        {
                label = "Duck Peek",
                path = "misc>movement>duck peek assist"
        },
        {
                label = "AutoWall",
                path = "legit>general>penetration"
        },
        {
                label = "Aim Assist",
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>aim>aim assist"
        },
        {
                label = "TriggerBot",
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>trigger>triggerbot"
        },
        {
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>aim>multipoint",
                unit = "%",
                label = "Multipoint",
                show_when = "always",
                value_paths = {
                        "legit>weapon>{WPN_GROUP}>aim>multipoint>settings>value",
                        "legit>weapon>{WPN_GROUP}>aim>multipoint"
                }
        },
        {
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>aim>aim fov",
                unit = "°",
                label = "Aim FOV",
                show_when = "always",
                value_paths = {
                        "legit>weapon>{WPN_GROUP}>aim>aim fov"
                }
        },
        {
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>aim>aim speed",
                unit = "",
                label = "AimSpeed",
                show_when = "always",
                value_paths = {
                        "legit>weapon>{WPN_GROUP}>aim>aim speed"
                }
        },
        {
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>trigger>mindamage",
                unit = "",
                label = "MinDamage",
                show_when = "always",
                value_paths = {
                        "legit>weapon>{WPN_GROUP}>trigger>mindamage"
                }
        },
        {
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>aim>hitchance",
                unit = "%",
                label = "Hitchance",
                show_when = "always",
                value_paths = {
                        "legit>weapon>{WPN_GROUP}>aim>hitchance"
                }
        },
        {
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>trigger>reaction time",
                unit = "ms",
                label = "ReactionTime",
                show_when = "always",
                value_paths = {
                        "legit>weapon>{WPN_GROUP}>trigger>reaction time"
                }
        },
        {
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>backtrack>backtrack",
                unit = "ms",
                label = "BackTrack",
                show_when = "always",
                value_paths = {
                        "legit>weapon>{WPN_GROUP}>backtrack>time",
                        "legit>weapon>{WPN_GROUP}>backtrack>ms"
                }
        },
        {
                label = "Autostop",
                is_weapon_specific = true,
                path = "legit>weapon>{WPN_GROUP}>aim>autostop"
        },
        {
                unit = "°",
                label = "Rage Aimbot",
                path = "rage>aimbot>general>aimbot",
                value_paths = {
                        "rage>aimbot>general>maximum fov"
                }
        },
        {
                label = "AutoWall Rage",
                path = "rage>aimbot>general>penetration"
        },
        {
                label = "AutoFire",
                path = "rage>aimbot>general>autofire"
        },
        {
                label = "NS",
                path = "rage>aimbot>general>nospread"
        },
        {
                label = "Resolver",
                path = "rage>aimbot>general>fake pitch correction"
        },
        {
                label = "Hide Shot",
                path = "rage>anti-aim>angles>hide shot"
        },
        {
                label = "Force",
                path = "rage>aimbot>general>force shoot"
        },
        {
                label = "Force Head",
                path = "rage>aimbot>general>headshot only"
        },
        {
                label = "Force Body",
                path = "rage>aimbot>general>force bodyaim"
        },
        {
                label = "Force Lethal Air",
                path = "rage>aimbot>general>force lethal in air"
        },
        {
                is_weapon_specific = true,
                label = "Rage MinDmg",
                unit = "",
                show_when = "always",
                value_paths = {
                        "rage>weapon>{WPN_GROUP}>weapon>mindamage"
                }
        },
        {
                is_weapon_specific = true,
                label = "Rage HC",
                unit = "%",
                show_when = "always",
                value_paths = {
                        "rage>weapon>{WPN_GROUP}>aim>hitchance"
                }
        }
}

for iter_0_6, iter_0_7 in ipairs(slot_0_93_0) do
        if not iter_0_7.label then
                error("FATAL: KEYBIND_CATALOG[" .. tostring(iter_0_6 or "?") .. "] sem 'label'")
        end
end

slot_0_94_0 = {
        selected_style = 2
}
slot_0_95_0 = {
        dragging = false,
        drag_offy = 0,
        drag_offx = 0,
        color_mode = false,
        x = 10,
        y = 400,
        items = {},
        select_names = {},
        selected = {}
}
slot_0_96_0 = {
        dragging = false,
        fall_speed = 3000,
        drag_offy = 0,
        drag_offx = 0,
        color_mode = true,
        letter_spacing = 2,
        animation_mode = 2,
        x = 10,
        y = 200,
        items = {},
        select_names = {},
        selected = {}
}
slot_0_97_0 = {
        dragging = false,
        drag_offy = 0,
        drag_offx = 0,
        color_mode = false,
        x = 400,
        y = 100,
        items = {},
        select_names = {},
        selected = {}
}
slot_0_98_0 = {
        {
                label = "Waypoints",
                check_func = function()
                        return hvh.wp_enable
                end
        },
        {
                label = "JumpScout",
                check_func = function()
                        return hvh.js_enable
                end
        },
        {
                label = "Aimlock",
                check_func = function()
                        return G.aimlock and G.aimlock.enable
                end
        },
        {
                label = "Chat Spam",
                check_func = function()
                        return slot_0_88_0.enable
                end
        },
        {
                label = "Killsay",
                check_func = function()
                        return slot_0_89_0.enable
                end
        },
        {
                label = "Blockbot",
                check_func = function()
                        return slot_0_1_0.blockbot_enable
                end
        },
        {
                label = "Snake Game",
                check_func = function()
                        return slot_0_2_0.snake_enable
                end
        },
        {
                label = "Minesweeper",
                check_func = function()
                        return slot_0_2_0.minesweeper_enable
                end
        },
        {
                label = "Chess",
                check_func = function()
                        return slot_0_2_0.chess_enable
                end
        }
}

for iter_0_8, iter_0_9 in ipairs(slot_0_93_0) do
        slot_0_90_0(slot_0_95_0.select_names, iter_0_9.label)

        slot_0_95_0.selected[iter_0_9.label] = false
        slot_0_95_0.items[iter_0_9.label] = {
                alpha = 0
        }

        slot_0_90_0(slot_0_96_0.select_names, iter_0_9.label)

        slot_0_96_0.selected[iter_0_9.label] = false
        slot_0_96_0.items[iter_0_9.label] = {
                animation_phase = "settled",
                was_active = false,
                alpha = 1,
                last_letter_fall_time = 0,
                animation_timer = 0,
                next_letter_to_fall = 1,
                letters = {}
        }
end

for iter_0_10, iter_0_11 in ipairs(slot_0_98_0) do
        slot_0_90_0(slot_0_97_0.select_names, iter_0_11.label)

        slot_0_97_0.selected[iter_0_11.label] = false
end

function slot_0_99_0(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
        arg_66_0 = arg_66_0 % 360
        arg_66_1 = math.max(0, math.min(1, arg_66_1))
        arg_66_2 = math.max(0, math.min(1, arg_66_2))

        local var_66_0 = arg_66_2 * arg_66_1
        local var_66_1 = var_66_0 * (1 - math.abs(arg_66_0 / 60 % 2 - 1))
        local var_66_2 = arg_66_2 - var_66_0
        local var_66_3
        local var_66_4
        local var_66_5

        if arg_66_0 < 60 then
                var_66_3, var_66_4, var_66_5 = var_66_0, var_66_1, 0
        elseif arg_66_0 < 120 then
                var_66_3, var_66_4, var_66_5 = var_66_1, var_66_0, 0
        elseif arg_66_0 < 180 then
                var_66_3, var_66_4, var_66_5 = 0, var_66_0, var_66_1
        elseif arg_66_0 < 240 then
                var_66_3, var_66_4, var_66_5 = 0, var_66_1, var_66_0
        elseif arg_66_0 < 300 then
                var_66_3, var_66_4, var_66_5 = var_66_1, 0, var_66_0
        else
                var_66_3, var_66_4, var_66_5 = var_66_0, 0, var_66_1
        end

        return draw.color(math.floor((var_66_3 + var_66_2) * 255), math.floor((var_66_4 + var_66_2) * 255), math.floor((var_66_5 + var_66_2) * 255), arg_66_3 or 255)
end

slot_0_100_0 = nil
slot_0_101_0 = nil
slot_0_102_1 = nil
slot_0_103_1 = nil

function slot_0_104_1(arg_67_0)
        local var_67_0 = type(arg_67_0)

        if var_67_0 == "string" then
                return "\"" .. arg_67_0:gsub("[\\\"]", "\\%0"):gsub("\n", "\\n"):gsub("\r", "\\r"):gsub("\t", "\\t"):gsub("[\b]", "\\b"):gsub("[\f]", "\\f") .. "\""
        end

        if var_67_0 == "number" or var_67_0 == "boolean" then
                return tostring(arg_67_0)
        end

        if var_67_0 == "table" then
                local var_67_1 = #arg_67_0 > 0 and arg_67_0[1] ~= nil
                local var_67_2 = {}

                if var_67_1 then
                        for iter_67_0 = 1, #arg_67_0 do
                                var_67_2[#var_67_2 + 1] = slot_0_104_1(arg_67_0[iter_67_0])
                        end

                        return "[" .. table.concat(var_67_2, ",") .. "]"
                else
                        for iter_67_1, iter_67_2 in pairs(arg_67_0) do
                                var_67_2[#var_67_2 + 1] = slot_0_104_1(iter_67_1) .. ":" .. slot_0_104_1(iter_67_2)
                        end

                        return "{" .. table.concat(var_67_2, ",") .. "}"
                end
        end

        return "null"
end

slot_0_102_0 = slot_0_104_1

function slot_0_103_0(arg_68_0)
        if arg_68_0 == nil then
                return nil, "empty"
        end

        if arg_68_0:sub(1, 3) == "﻿" then
                arg_68_0 = arg_68_0:sub(4)
        end

        if arg_68_0 == "" then
                return nil, "empty"
        end

        local var_68_0 = 1
        local var_68_1

        local function var_68_2()
                return arg_68_0:sub(var_68_0, var_68_0)
        end

        local function var_68_3()
                local var_70_0 = arg_68_0:sub(var_68_0, var_68_0)

                var_68_0 = var_68_0 + 1

                return var_70_0
        end

        local function var_68_4()
                while true do
                        local var_71_0 = var_68_2()

                        if var_71_0 == " " or var_71_0 == "\t" or var_71_0 == "\n" or var_71_0 == "\r" then
                                var_68_0 = var_68_0 + 1
                        else
                                break
                        end
                end
        end

        local var_68_5

        local function var_68_6()
                if var_68_3() ~= "\"" then
                        var_68_1 = "str"

                        return nil
                end

                local var_72_0 = {}

                while var_68_0 <= #arg_68_0 do
                        local var_72_1 = var_68_3()

                        if var_72_1 == "\"" then
                                return table.concat(var_72_0)
                        end

                        if var_72_1 == "\\" then
                                local var_72_2 = var_68_3()

                                if var_72_2 == "\"" or var_72_2 == "\\" or var_72_2 == "/" then
                                        var_72_0[#var_72_0 + 1] = var_72_2
                                elseif var_72_2 == "b" then
                                        var_72_0[#var_72_0 + 1] = "\b"
                                elseif var_72_2 == "f" then
                                        var_72_0[#var_72_0 + 1] = "\f"
                                elseif var_72_2 == "n" then
                                        var_72_0[#var_72_0 + 1] = "\n"
                                elseif var_72_2 == "r" then
                                        var_72_0[#var_72_0 + 1] = "\r"
                                elseif var_72_2 == "t" then
                                        var_72_0[#var_72_0 + 1] = "\t"
                                elseif var_72_2 == "u" then
                                        local var_72_3 = arg_68_0:sub(var_68_0, var_68_0 + 3)

                                        if not var_72_3:match("^%x%x%x%x$") then
                                                var_68_1 = "uhex"

                                                return nil
                                        end

                                        var_68_0 = var_68_0 + 4

                                        local var_72_4 = tonumber(var_72_3, 16)

                                        if var_72_4 < 128 then
                                                var_72_0[#var_72_0 + 1] = string.char(var_72_4)
                                        elseif var_72_4 < 2048 then
                                                var_72_0[#var_72_0 + 1] = string.char(192 + math.floor(var_72_4 / 64), 128 + var_72_4 % 64)
                                        else
                                                var_72_0[#var_72_0 + 1] = string.char(224 + math.floor(var_72_4 / 256), 128 + math.floor(var_72_4 / 64) % 64, 128 + var_72_4 % 64)
                                        end
                                else
                                        var_68_1 = "esc"

                                        return nil
                                end
                        else
                                var_72_0[#var_72_0 + 1] = var_72_1
                        end
                end

                var_68_1 = "unterminated"

                return nil
        end

        local function var_68_7()
                local var_73_0 = var_68_0
                local var_73_1 = arg_68_0:match("^%-?%d+%.?%d*[eE]?[+-]?%d*", var_68_0)

                if not var_73_1 or var_73_1 == "" then
                        var_68_1 = "nan"

                        return nil
                end

                var_68_0 = var_68_0 + #var_73_1

                local var_73_2 = tonumber(var_73_1)

                if var_73_2 == nil then
                        var_68_1 = "nan"

                        return nil
                end

                return var_73_2
        end

        local function var_68_8()
                if var_68_3() ~= "[" then
                        var_68_1 = "arr"

                        return nil
                end

                var_68_4()

                local var_74_0 = {}

                if var_68_2() == "]" then
                        var_68_0 = var_68_0 + 1

                        return var_74_0
                end

                while true do
                        local var_74_1 = var_68_5()

                        if var_74_1 == nil and var_68_1 then
                                return nil
                        end

                        var_74_0[#var_74_0 + 1] = var_74_1

                        var_68_4()

                        local var_74_2 = var_68_3()

                        if var_74_2 == "]" then
                                return var_74_0
                        end

                        if var_74_2 ~= "," then
                                var_68_1 = "arr,"

                                return nil
                        end

                        var_68_4()
                end
        end

        local function var_68_9()
                if var_68_3() ~= "{" then
                        var_68_1 = "obj"

                        return nil
                end

                var_68_4()

                local var_75_0 = {}

                if var_68_2() == "}" then
                        var_68_0 = var_68_0 + 1

                        return var_75_0
                end

                while true do
                        if var_68_2() ~= "\"" then
                                var_68_1 = "key"

                                return nil
                        end

                        local var_75_1 = var_68_6()

                        if not var_75_1 then
                                return nil
                        end

                        var_68_4()

                        if var_68_3() ~= ":" then
                                var_68_1 = ":"

                                return nil
                        end

                        var_68_4()

                        local var_75_2 = var_68_5()

                        if var_75_2 == nil and var_68_1 then
                                return nil
                        end

                        var_75_0[var_75_1] = var_75_2

                        var_68_4()

                        local var_75_3 = var_68_3()

                        if var_75_3 == "}" then
                                return var_75_0
                        end

                        if var_75_3 ~= "," then
                                var_68_1 = "obj,"

                                return nil
                        end

                        var_68_4()
                end
        end

        function var_68_5()
                var_68_4()

                local var_76_0 = var_68_2()

                if var_76_0 == "\"" then
                        return var_68_6()
                elseif var_76_0 == "{" then
                        return var_68_9()
                elseif var_76_0 == "[" then
                        return var_68_8()
                elseif var_76_0 == "t" and arg_68_0:sub(var_68_0, var_68_0 + 3) == "true" then
                        var_68_0 = var_68_0 + 4

                        return true
                elseif var_76_0 == "f" and arg_68_0:sub(var_68_0, var_68_0 + 4) == "false" then
                        var_68_0 = var_68_0 + 5

                        return false
                elseif var_76_0 == "n" and arg_68_0:sub(var_68_0, var_68_0 + 3) == "null" then
                        var_68_0 = var_68_0 + 4

                        return nil
                else
                        return var_68_7()
                end
        end

        local var_68_10 = var_68_5()

        if var_68_10 == nil and var_68_1 then
                return nil, var_68_1
        end

        var_68_4()

        if var_68_0 <= #arg_68_0 then
                return nil, "trailing@" .. tostring(var_68_0)
        end

        return var_68_10, nil
end

function slot_0_104_0(arg_77_0)
        local var_77_0 = slot_0_37_0(arg_77_0, "rb")

        if var_77_0 == nil then
                return nil
        end

        slot_0_39_0(var_77_0, 0, 2)

        local var_77_1 = slot_0_40_0(var_77_0)

        slot_0_39_0(var_77_0, 0, 0)

        if var_77_1 <= 0 then
                slot_0_38_0(var_77_0)

                return ""
        end

        local var_77_2 = ffi.new("char[?]", var_77_1 + 1)

        slot_0_41_0(var_77_2, 1, var_77_1, var_77_0)
        slot_0_38_0(var_77_0)

        var_77_2[var_77_1] = 0

        return ffi.string(var_77_2, var_77_1)
end

function slot_0_105_0(arg_78_0, arg_78_1, arg_78_2)
        local var_78_0 = slot_0_37_0(arg_78_0, arg_78_2 and "ab" or "wb")

        if var_78_0 == nil then
                return false
        end

        slot_0_42_0(arg_78_1, 1, #arg_78_1, var_78_0)
        slot_0_38_0(var_78_0)

        return true
end

function slot_0_106_0()
        local var_79_0 = 1 / game.global_vars.frame_time
        local var_79_1 = 0
        local var_79_2 = game.engine:get_netchan()

        if var_79_2 and not var_79_2:is_null() then
                var_79_1 = var_79_2:get_latency() * 1000
        end

        return math.floor(var_79_0), math.floor(var_79_1)
end

function slot_0_107_0(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
        slot_80_4_0 = game.global_vars.real_time
        slot_80_5_0 = slot_0_59_0()

        if not slot_0_87_0.wm_fps_last_update then
                slot_0_87_0.wm_fps_last_update = 0
                slot_80_6_2, slot_80_7_2 = slot_0_106_0()
                slot_0_87_0.wm_cached_fps = slot_80_6_2
                slot_0_87_0.wm_cached_ping = slot_80_7_2
        end

        if slot_80_4_0 - slot_0_87_0.wm_fps_last_update >= 0.3 then
                slot_80_6_1, slot_80_7_1 = slot_0_106_0()
                slot_0_87_0.wm_cached_fps = slot_80_6_1
                slot_0_87_0.wm_cached_ping = slot_80_7_1
                slot_0_87_0.wm_fps_last_update = slot_80_4_0
        end

        slot_80_6_0 = slot_0_87_0.wm_cached_fps
        slot_80_7_0 = slot_0_87_0.wm_cached_ping
        slot_80_8_0 = {}

        if slot_0_87_0.wm_animated_enabled then
                slot_80_8_0[#slot_80_8_0 + 1] = {
                        "Tueurs",
                        slot_0_56_0(280, 0.6, 1, arg_80_3)
                }
        elseif slot_0_87_0.wm_is_rgb then
                slot_80_8_0[#slot_80_8_0 + 1] = {
                        "Tueurs",
                        slot_0_56_0(slot_80_4_0 * 50 % 360, 1, 1, arg_80_3)
                }
        else
                slot_80_9_5 = slot_0_87_0.wm_colors.tueurs
                slot_80_8_0[#slot_80_8_0 + 1] = {
                        "Tueurs",
                        slot_0_56_0(slot_80_9_5.h, slot_80_9_5.s, slot_80_9_5.v, arg_80_3)
                }
        end

        if slot_0_87_0.wm_selected.User then
                slot_80_9_4 = slot_0_87_0.wm_colors.user

                if slot_0_87_0.wm_animated_enabled then
                        slot_80_8_0[#slot_80_8_0 + 1] = {
                                slot_80_5_0 .. "|ANIM",
                                slot_0_56_0(280, 0.6, 1, arg_80_3)
                        }
                else
                        slot_80_8_0[#slot_80_8_0 + 1] = {
                                slot_80_5_0,
                                slot_0_56_0(slot_80_9_4.h, slot_80_9_4.s, slot_80_9_4.v, arg_80_3)
                        }
                end
        end

        if slot_0_87_0.wm_selected.FPS then
                slot_80_9_3 = slot_0_87_0.wm_colors.fps

                if slot_0_87_0.wm_animated_enabled then
                        slot_80_10_3 = nil
                        slot_80_11_4 = nil

                        if slot_80_6_0 < 60 then
                                slot_80_10_3 = 0
                                slot_80_11_3 = 0.8
                        elseif slot_80_6_0 < 80 then
                                slot_80_10_3 = 60
                                slot_80_11_3 = 0.7
                        else
                                slot_80_10_3 = 120
                                slot_80_11_3 = 0.6
                        end

                        slot_80_8_0[#slot_80_8_0 + 1] = {
                                tostring(slot_80_6_0) .. " FPS",
                                slot_0_56_0(slot_80_10_3, slot_80_11_3, 1, arg_80_3)
                        }
                else
                        slot_80_8_0[#slot_80_8_0 + 1] = {
                                tostring(slot_80_6_0) .. " FPS",
                                slot_0_56_0(slot_80_9_3.h, slot_80_9_3.s, slot_80_9_3.v, arg_80_3)
                        }
                end
        end

        if slot_0_87_0.wm_selected.Ping then
                slot_80_9_2 = slot_0_87_0.wm_colors.ping

                if slot_0_87_0.wm_animated_enabled then
                        slot_80_10_2 = nil
                        slot_80_11_2 = nil

                        if slot_80_7_0 > 100 then
                                slot_80_10_2 = 0
                                slot_80_11_1 = 0.8
                        elseif slot_80_7_0 > 80 then
                                slot_80_10_2 = 60
                                slot_80_11_1 = 0.7
                        else
                                slot_80_10_2 = 120
                                slot_80_11_1 = 0.6
                        end

                        slot_80_8_0[#slot_80_8_0 + 1] = {
                                tostring(slot_80_7_0) .. " PING",
                                slot_0_56_0(slot_80_10_2, slot_80_11_1, 1, arg_80_3)
                        }
                else
                        slot_80_8_0[#slot_80_8_0 + 1] = {
                                tostring(slot_80_7_0) .. " PING",
                                slot_0_56_0(slot_80_9_2.h, slot_80_9_2.s, slot_80_9_2.v, arg_80_3)
                        }
                end
        end

        if slot_0_87_0.wm_selected.Build then
                slot_80_9_1 = "Premium"

                if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
                        slot_80_10_1 = gui.ctx.user.username

                        if slot_80_10_1 == "LukinhasMenu" then
                                slot_80_9_1 = "Dev"
                        elseif slot_80_10_1 == "victorcxz" or slot_80_10_1 == "arionsanz" or slot_80_10_1 == "temniyprince812" then
                                slot_80_9_1 = "Beta|SCAN"
                        elseif slot_80_10_1 == "BrayHax" then
                                slot_80_9_1 = "Debug|SCAN"
                        end
                end

                slot_80_8_0[#slot_80_8_0 + 1] = {
                        slot_80_9_1,
                        slot_0_56_0(280, 0.6, 1, arg_80_3)
                }
        end

        slot_80_9_0 = G.scale_dim and G.scale_dim(20) or 20
        slot_80_10_0 = 12
        slot_80_11_0 = 24

        for iter_80_0, iter_80_1 in ipairs(slot_80_8_0) do
                slot_80_17_2 = string.gsub(iter_80_1[1], "|ANIM", "")
                slot_80_17_1 = string.gsub(slot_80_17_2, "|SCAN", "")
                slot_80_10_0 = slot_80_10_0 + theme.fonts.mono:get_text_size(slot_80_17_1).x + slot_80_9_0
        end

        slot_80_12_0 = arg_80_1 + slot_80_9_0

        for iter_80_2, iter_80_3 in ipairs(slot_80_8_0) do
                slot_80_18_1 = string.gsub(iter_80_3[1], "|ANIM", "")
                slot_80_18_0 = string.gsub(slot_80_18_1, "|SCAN", "")
                slot_80_19_0 = theme.fonts.mono:get_text_size(slot_80_18_0).x
                slot_80_20_0 = string.find(iter_80_3[1], "|SCAN") ~= nil

                if slot_0_87_0.wm_animated_enabled and (iter_80_3[1] == "Tueurs" or string.find(iter_80_3[1], "|ANIM") or slot_80_20_0) then
                        slot_80_21_3 = string.gsub(iter_80_3[1], "|ANIM", "")
                        slot_80_21_2 = string.gsub(slot_80_21_3, "|SCAN", "")
                        slot_80_22_2 = theme.fonts.mono:get_text_size(slot_80_21_2).x
                        slot_80_23_1 = slot_80_4_0 * 3

                        for iter_80_4 = 1, #slot_80_21_2 do
                                slot_80_28_2 = slot_80_21_2:sub(iter_80_4, iter_80_4)
                                slot_80_29_2 = theme.fonts.mono:get_text_size(slot_80_28_2).x
                                slot_80_30_1 = slot_80_12_0 + theme.fonts.mono:get_text_size(slot_80_21_2:sub(1, iter_80_4 - 1)).x
                                slot_80_31_1 = arg_80_2 + 4
                                slot_80_32_0 = nil

                                if slot_80_20_0 then
                                        slot_80_33_2 = 2.5
                                        slot_80_34_1 = slot_80_4_0 % slot_80_33_2 / slot_80_33_2
                                        slot_80_35_1 = #slot_80_21_2 > 1 and (iter_80_4 - 1) / (#slot_80_21_2 - 1) or 0

                                        if math.abs(slot_80_35_1 - slot_80_34_1) < 0.1 then
                                                slot_80_32_0 = draw.color(0, 255, 255, arg_80_3 * 255)
                                        elseif slot_80_35_1 < slot_80_34_1 then
                                                slot_80_32_0 = slot_0_56_0(280, 0.7, 1, arg_80_3)
                                        else
                                                slot_80_32_0 = iter_80_3[2]:mod_a(0.2 * (arg_80_3 / 255))
                                        end
                                else
                                        slot_80_33_1 = #slot_80_21_2 > 1 and (iter_80_4 - 1) / (#slot_80_21_2 - 1) or 0
                                        slot_80_34_0 = 280
                                        slot_80_35_0 = slot_80_33_1 * 0.6
                                        slot_80_32_0 = slot_0_56_0(slot_80_34_0, slot_80_35_0, 1, arg_80_3)
                                end

                                slot_80_33_0 = draw.color(0, 0, 0, arg_80_3 * 255)

                                slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_30_1 + 1, slot_80_31_1, slot_80_28_2, slot_80_33_0)
                                slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_30_1 - 1, slot_80_31_1, slot_80_28_2, slot_80_33_0)
                                slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_30_1, slot_80_31_1 + 1, slot_80_28_2, slot_80_33_0)
                                slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_30_1, slot_80_31_1 - 1, slot_80_28_2, slot_80_33_0)
                                slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_30_1, slot_80_31_1, slot_80_28_2, slot_80_32_0)
                        end

                        if slot_80_20_0 then
                                slot_80_24_2 = 2.5
                                slot_80_26_2 = slot_80_12_0 + slot_80_22_2 * (slot_80_4_0 % slot_80_24_2 / slot_80_24_2)

                                arg_80_0:add_line(draw.vec2(slot_80_26_2, arg_80_2 + 2), draw.vec2(slot_80_26_2, arg_80_2 + 22), draw.color(0, 255, 100, arg_80_3 * 255), 2)
                        end

                        slot_80_24_1 = slot_80_9_0

                        if iter_80_2 < #slot_80_8_0 then
                                slot_80_25_1 = iter_80_3[1] == "Tueurs"
                                slot_80_26_1 = string.find(iter_80_3[1], slot_80_5_0) ~= nil or string.find(iter_80_3[1], "|ANIM") ~= nil or string.find(iter_80_3[1], "|SCAN") ~= nil
                                slot_80_27_1 = string.find(slot_80_8_0[iter_80_2 + 1][1], slot_80_5_0) ~= nil or string.find(slot_80_8_0[iter_80_2 + 1][1], "|ANIM") ~= nil or string.find(slot_80_8_0[iter_80_2 + 1][1], "|SCAN") ~= nil
                                slot_80_28_1 = string.find(slot_80_8_0[iter_80_2 + 1][1], "FPS") ~= nil
                                slot_80_29_1 = string.find(slot_80_8_0[iter_80_2 + 1][1], "PING") ~= nil

                                if slot_80_25_1 and slot_80_27_1 then
                                        slot_80_24_1 = G.scale_dim and G.scale_dim(25) or 25
                                elseif slot_80_26_1 and (slot_80_28_1 or slot_80_29_1) then
                                        slot_80_30_0 = G.scale_dim and G.scale_dim(31) or 31
                                        slot_80_31_0 = #slot_80_5_0

                                        if slot_80_31_0 > 12 then
                                                slot_80_24_1 = slot_80_30_0 + (slot_80_31_0 - 12)
                                        else
                                                slot_80_24_1 = slot_80_30_0
                                        end
                                end
                        end

                        slot_80_12_0 = slot_80_12_0 + slot_80_22_2 + slot_80_24_1
                else
                        slot_80_21_1 = draw.color(0, 0, 0, arg_80_3 * 255)

                        slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_12_0 + 1, arg_80_2 + 4, slot_80_18_0, slot_80_21_1)
                        slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_12_0 - 1, arg_80_2 + 4, slot_80_18_0, slot_80_21_1)
                        slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_12_0, arg_80_2 + 5, slot_80_18_0, slot_80_21_1)
                        slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_12_0, arg_80_2 + 3, slot_80_18_0, slot_80_21_1)
                        slot_0_58_0(arg_80_0, theme.fonts.mono, slot_80_12_0, arg_80_2 + 4, slot_80_18_0, iter_80_3[2])

                        slot_80_22_1 = slot_80_9_0

                        if iter_80_2 < #slot_80_8_0 then
                                slot_80_23_0 = iter_80_3[1] == "Tueurs"
                                slot_80_24_0 = string.find(iter_80_3[1], slot_80_5_0) ~= nil
                                slot_80_25_0 = string.find(slot_80_8_0[iter_80_2 + 1][1], slot_80_5_0) ~= nil
                                slot_80_26_0 = string.find(slot_80_8_0[iter_80_2 + 1][1], "FPS") ~= nil
                                slot_80_27_0 = string.find(slot_80_8_0[iter_80_2 + 1][1], "PING") ~= nil

                                if slot_80_23_0 and slot_80_25_0 then
                                        slot_80_22_1 = G.scale_dim and G.scale_dim(25) or 25
                                elseif slot_80_24_0 and (slot_80_26_0 or slot_80_27_0) then
                                        slot_80_28_0 = G.scale_dim and G.scale_dim(31) or 31
                                        slot_80_29_0 = #slot_80_5_0

                                        if slot_80_29_0 > 12 then
                                                slot_80_22_1 = slot_80_28_0 + (slot_80_29_0 - 12)
                                        else
                                                slot_80_22_1 = slot_80_28_0
                                        end
                                end
                        end

                        slot_80_12_0 = slot_80_12_0 + slot_80_19_0 + slot_80_22_1
                end

                if iter_80_2 < #slot_80_8_0 then
                        slot_80_21_0 = G.scale_dim and G.scale_dim(5) or 5

                        if iter_80_3[1] == "Tueurs" then
                                slot_80_21_0 = G.scale_dim and G.scale_dim(8) or 8
                        end

                        if slot_0_87_0.wm_animated_enabled then
                                slot_80_22_0 = math.sin(slot_80_4_0 * 6 + iter_80_2 * 2) * 0.3 + 0.7

                                arg_80_0:add_rect_filled(draw.rect(slot_80_12_0 - slot_80_21_0 - 2, arg_80_2 + 6, slot_80_12_0 - slot_80_21_0, arg_80_2 + slot_80_11_0 - 6), slot_0_56_0(180, 0.7, 1, arg_80_3 * slot_80_22_0))
                        else
                                arg_80_0:add_rect_filled(draw.rect(slot_80_12_0 - slot_80_21_0 - 2, arg_80_2 + 6, slot_80_12_0 - slot_80_21_0, arg_80_2 + slot_80_11_0 - 6), theme.colors.watermark_sep:mod_a(arg_80_3 * 0.5))
                        end
                end
        end

        return slot_80_10_0, slot_80_11_0
end

function slot_0_108_0(arg_81_0, arg_81_1, arg_81_2, arg_81_3, arg_81_4, arg_81_5)
        slot_0_107_0(arg_81_0, arg_81_1 + (arg_81_3 - 300) / 2, arg_81_2 + (arg_81_4 - 24) / 2, arg_81_5)
end

function slot_0_109_0()
        if not slot_0_87_0.wm_enabled then
                return
        end

        slot_82_0_0 = draw.surface
        slot_82_1_0 = bit.band(slot_0_32_0(16) or 0, 32768) ~= 0
        slot_82_2_0 = slot_0_65_0.x
        slot_82_3_0 = slot_0_65_0.y

        if slot_0_87_0.wm_crosshair_enabled then
                slot_82_4_1 = game.global_vars.real_time
                slot_82_5_1, slot_82_6_0 = game.engine:get_screen_size()
                slot_0_87_0.wm_scope_lerp = slot_0_87_0.wm_scope_lerp or 0
                slot_82_7_0 = entities.get_local_pawn()
                slot_82_8_0 = false

                if slot_82_7_0 and slot_82_7_0:is_alive() and slot_82_7_0.m_bIsScoped then
                        slot_82_8_0 = slot_82_7_0.m_bIsScoped:get()
                end

                slot_82_9_0 = game.global_vars.frame_time or 0.01
                slot_82_10_0 = slot_82_8_0 and 1 or 0
                slot_0_87_0.wm_scope_lerp = slot_0_55_0(slot_0_87_0.wm_scope_lerp, slot_82_10_0, slot_82_9_0 * 12)
                slot_82_11_0 = 20 + slot_0_87_0.wm_scope_lerp * 80
                slot_82_12_0 = slot_82_5_1 / 2 + slot_82_11_0
                slot_82_13_0 = slot_82_6_0 / 2 - 35
                slot_82_14_0 = "Tueurs"

                if slot_0_87_0.wm_selected.Build then
                        slot_82_15_3 = "Premium"

                        if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
                                slot_82_16_4 = gui.ctx.user.username

                                if slot_82_16_4 == "LukinhasMenu" then
                                        slot_82_15_3 = "Dev"
                                elseif slot_82_16_4 == "victorcxz" or slot_82_16_4 == "arionsanz" or slot_82_16_4 == "temniyprince812" then
                                        slot_82_15_3 = "Beta"
                                elseif slot_82_16_4 == "BrayHax" then
                                        slot_82_15_3 = "Debug"
                                end
                        end

                        slot_82_14_0 = "Tueurs." .. slot_82_15_3
                end

                if slot_0_87_0.wm_animated_enabled then
                        slot_82_15_2 = theme.fonts.mono:get_text_size(slot_82_14_0).x
                        slot_82_16_3 = slot_82_4_1 * 3
                        slot_82_17_1 = 4
                        slot_82_19_1 = slot_82_16_3 * 2 % (#slot_82_14_0 + slot_82_17_1 * 2)

                        for iter_82_0 = 1, #slot_82_14_0 do
                                slot_82_24_0 = slot_82_14_0:sub(iter_82_0, iter_82_0)
                                slot_82_25_0 = theme.fonts.mono:get_text_size(slot_82_24_0).x
                                slot_82_26_0 = slot_82_12_0 - slot_82_15_2 / 2 + theme.fonts.mono:get_text_size(slot_82_14_0:sub(1, iter_82_0 - 1)).x
                                slot_82_27_0 = slot_82_13_0 + 4
                                slot_82_28_0 = math.abs(iter_82_0 - slot_82_19_1)

                                if slot_82_28_0 <= slot_82_17_1 then
                                        slot_82_29_1 = 1 - slot_82_28_0 / slot_82_17_1
                                        slot_82_27_0 = slot_82_27_0 - math.sin(slot_82_28_0 * math.pi / slot_82_17_1) * slot_82_29_1 * 4
                                end

                                slot_82_29_0 = #slot_82_14_0 > 1 and (iter_82_0 - 1) / (#slot_82_14_0 - 1) or 0
                                slot_82_30_0 = 280
                                slot_82_31_0 = slot_82_29_0 * 0.6
                                slot_82_32_0 = slot_0_56_0(slot_82_30_0, slot_82_31_0, 1, 1)

                                slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_26_0 + 1, slot_82_27_0 + 1, slot_82_24_0, draw.color(0, 0, 0, 255))
                                slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_26_0, slot_82_27_0, slot_82_24_0, slot_82_32_0)
                        end
                else
                        slot_82_15_1 = nil

                        if slot_0_87_0.wm_is_rgb then
                                slot_82_15_1 = slot_0_56_0(slot_82_4_1 * 50 % 360, 1, 1, 1)
                        else
                                slot_82_16_2 = slot_0_87_0.wm_colors.tueurs
                                slot_82_15_1 = slot_0_56_0(slot_82_16_2.h, slot_82_16_2.s, slot_82_16_2.v, 1)
                        end

                        slot_82_16_1 = theme.fonts.mono:get_text_size(slot_82_14_0).x

                        slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_12_0 - slot_82_16_1 / 2 + 1, slot_82_13_0 + 5, slot_82_14_0, draw.color(0, 0, 0, 255))
                        slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_12_0 - slot_82_16_1 / 2, slot_82_13_0 + 4, slot_82_14_0, slot_82_15_1)
                end

                if slot_0_87_0.wm_selected.FPS then
                        slot_82_15_0 = game.global_vars.real_time
                        G.wm_fps_cache = G.wm_fps_cache or 0
                        G.wm_fps_last_update = G.wm_fps_last_update or 0

                        if slot_82_15_0 - G.wm_fps_last_update > 0.5 then
                                G.wm_fps_cache = math.floor(1 / (game.global_vars.frame_time or 0.01))
                                G.wm_fps_last_update = slot_82_15_0
                        end

                        slot_82_16_0 = "Fps: " .. tostring(G.wm_fps_cache)
                        slot_82_17_0 = theme.fonts.mono:get_text_size(slot_82_16_0).x
                        slot_82_18_0 = slot_82_13_0 + 16

                        slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_12_0 - slot_82_17_0 / 2 + 1, slot_82_18_0 + 1, slot_82_16_0, draw.color(0, 0, 0, 255))
                        slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_12_0 - slot_82_17_0 / 2 - 1, slot_82_18_0 + 1, slot_82_16_0, draw.color(0, 0, 0, 255))
                        slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_12_0 - slot_82_17_0 / 2, slot_82_18_0 + 2, slot_82_16_0, draw.color(0, 0, 0, 255))
                        slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_12_0 - slot_82_17_0 / 2, slot_82_18_0, slot_82_16_0, draw.color(0, 0, 0, 255))

                        slot_82_19_0 = tueurs_color

                        if not slot_82_19_0 then
                                if slot_0_87_0.wm_is_rgb then
                                        slot_82_19_0 = slot_0_56_0(slot_82_4_1 * 50 % 360, 1, 1, 1)
                                else
                                        slot_82_20_0 = slot_0_87_0.wm_colors.tueurs
                                        slot_82_19_0 = slot_0_56_0(slot_82_20_0.h, slot_82_20_0.s, slot_82_20_0.v, 1)
                                end
                        end

                        slot_0_58_0(slot_82_0_0, theme.fonts.mono, slot_82_12_0 - slot_82_17_0 / 2, slot_82_18_0 + 1, slot_82_16_0, slot_82_19_0)
                end

                return
        end

        slot_82_4_0, slot_82_5_0 = slot_0_107_0(slot_82_0_0, slot_0_87_0.wm_x, slot_0_87_0.wm_y, 1)

        if slot_82_1_0 and slot_0_65_0.pressed and slot_0_57_0(slot_0_87_0.wm_x, slot_0_87_0.wm_y, slot_82_4_0, slot_82_5_0, slot_82_2_0, slot_82_3_0) then
                slot_0_87_0.wm_dragging = true
                slot_0_87_0.wm_drag_offx = slot_82_2_0 - slot_0_87_0.wm_x
                slot_0_87_0.wm_drag_offy = slot_82_3_0 - slot_0_87_0.wm_y
        end

        if slot_0_65_0.released then
                slot_0_87_0.wm_dragging = false
        end

        if slot_0_87_0.wm_dragging then
                slot_0_87_0.wm_x = slot_0_54_0(slot_82_2_0 - slot_0_87_0.wm_drag_offx, 0, slot_0_70_0 - slot_82_4_0)
                slot_0_87_0.wm_y = slot_0_54_0(slot_82_3_0 - slot_0_87_0.wm_drag_offy, 0, slot_0_71_0 - slot_82_5_0)
        end
end

slot_0_110_0 = text_buffers or {}
slot_0_111_0 = false
slot_0_112_0 = __ui_state or {
        slider_vis = {},
        toggle_ripple = {},
        combo_open_time = {},
        button_hover = {},
        checkbox_bounce = {},
        text_input_focus = {},
        particles = {},
        input = {
                key_pressed = {},
                key_timer = {}
        }
}
slot_0_113_0 = 0

function slot_0_114_0()
        local var_83_0 = game and game.engine

        if not var_83_0 or not var_83_0.client_cmd then
                return
        end

        local var_83_1 = game and game.global_vars and game.global_vars.real_time or 0

        if var_83_1 - slot_0_113_0 < 0.06 then
                return
        end

        slot_0_113_0 = var_83_1

        var_83_0:client_cmd("playvol ui/buttonclick 0.8; playvol buttons/button14 0.7; playvol buttons/button9 0.7; play ui/beep07")
end

function slot_0_115_0(arg_84_0)
        return arg_84_0
end

function slot_0_116_0(arg_85_0)
        return 1 - (1 - arg_85_0) * (1 - arg_85_0)
end

function slot_0_117_0(arg_86_0)
        if arg_86_0 < 0.36363636363636365 then
                return 7.5625 * arg_86_0 * arg_86_0
        elseif arg_86_0 < 0.7272727272727273 then
                arg_86_0 = arg_86_0 - 0.5454545454545454

                return 7.5625 * arg_86_0 * arg_86_0 + 0.75
        elseif arg_86_0 < 0.9090909090909091 then
                arg_86_0 = arg_86_0 - 0.8181818181818182

                return 7.5625 * arg_86_0 * arg_86_0 + 0.9375
        else
                arg_86_0 = arg_86_0 - 0.9545454545454546

                return 7.5625 * arg_86_0 * arg_86_0 + 0.984375
        end
end

function slot_0_118_0(arg_87_0, arg_87_1)
        if arg_87_1 == 2 then
                return slot_0_116_0(arg_87_0)
        elseif arg_87_1 == 3 then
                return slot_0_117_0(arg_87_0)
        else
                return slot_0_115_0(arg_87_0)
        end
end

function slot_0_119_0(arg_88_0, arg_88_1, arg_88_2, arg_88_3, arg_88_4, arg_88_5, arg_88_6, arg_88_7, arg_88_8)
        local var_88_0 = G.scale_dim(18)
        local var_88_1 = slot_0_57_0(arg_88_1, arg_88_2, var_88_0, var_88_0, arg_88_5, arg_88_6)
        local var_88_2 = arg_88_7 and var_88_1
        local var_88_3 = theme._checks_override or slot_0_86_0.target_hsv and slot_0_86_0.target_hsv.checks or {
                v = 1,
                s = 0.55,
                h = 146
        }
        local var_88_4 = slot_0_86_0.is_rgb and theme.colors.accent:mod_a(arg_88_8) or slot_0_56_0(var_88_3.h, var_88_3.s, var_88_3.v, arg_88_8)

        arg_88_0:add_rect_filled_rounded(draw.rect(arg_88_1, arg_88_2, arg_88_1 + var_88_0, arg_88_2 + var_88_0), theme.colors.bg_item_active:mod_a(arg_88_8), 4)
        arg_88_0:add_rect_rounded(draw.rect(arg_88_1, arg_88_2, arg_88_1 + var_88_0, arg_88_2 + var_88_0), theme.colors.border_inner:mod_a(arg_88_8), 4)

        if arg_88_4 then
                arg_88_0:add_rect_filled_rounded(draw.rect(arg_88_1 + 4, arg_88_2 + 4, arg_88_1 + var_88_0 - 4, arg_88_2 + var_88_0 - 4), var_88_4, 2)
        end

        slot_0_58_0(arg_88_0, theme.fonts.item, arg_88_1 + var_88_0 + 10, arg_88_2 + 1, arg_88_3, theme.colors.text_light:mod_a(arg_88_8))

        if var_88_2 then
                active_control_id = nil
                open_control_rect = nil

                return not arg_88_4
        end

        return arg_88_4
end

function slot_0_120_0(arg_89_0, arg_89_1, arg_89_2, arg_89_3, arg_89_4, arg_89_5, arg_89_6, arg_89_7, arg_89_8)
        local var_89_0 = G.scale_dim(18)
        local var_89_1 = slot_0_57_0(arg_89_1, arg_89_2, var_89_0, var_89_0, arg_89_5, arg_89_6)
        local var_89_2 = arg_89_7 and var_89_1
        local var_89_3 = theme._checks_override or slot_0_86_0.target_hsv and slot_0_86_0.target_hsv.checks or {
                v = 1,
                s = 0.55,
                h = 146
        }
        local var_89_4 = slot_0_86_0.is_rgb and theme.colors.accent:mod_a(arg_89_8) or slot_0_56_0(var_89_3.h, var_89_3.s, var_89_3.v, arg_89_8)

        arg_89_0:add_rect_filled_rounded(draw.rect(arg_89_1, arg_89_2, arg_89_1 + var_89_0, arg_89_2 + var_89_0), theme.colors.bg_item_active:mod_a(arg_89_8), 4)
        arg_89_0:add_rect_rounded(draw.rect(arg_89_1, arg_89_2, arg_89_1 + var_89_0, arg_89_2 + var_89_0), theme.colors.border_inner:mod_a(arg_89_8), 4)

        if arg_89_4 then
                arg_89_0:add_rect_filled_rounded(draw.rect(arg_89_1 + 4, arg_89_2 + 4, arg_89_1 + var_89_0 - 4, arg_89_2 + var_89_0 - 4), var_89_4, 2)
        end

        slot_0_58_0(arg_89_0, theme.fonts.item, arg_89_1 + var_89_0 + 10, arg_89_2 + 1, arg_89_3, theme.colors.text_light:mod_a(arg_89_8))

        if var_89_2 then
                return not arg_89_4
        end

        return arg_89_4
end

function slot_0_121_0(arg_90_0, arg_90_1, arg_90_2, arg_90_3, arg_90_4, arg_90_5, arg_90_6, arg_90_7, arg_90_8, arg_90_9, arg_90_10, arg_90_11, arg_90_12, arg_90_13)
        slot_90_14_0 = G.scale_dim(6)
        slot_90_15_0 = arg_90_3 + G.scale_dim(22)
        arg_90_12 = arg_90_12 or "%.0f"

        if arg_90_5 and arg_90_5 ~= "" then
                slot_0_58_0(arg_90_0, theme.fonts.item, arg_90_2, arg_90_3, arg_90_5, theme.colors.text_light:mod_a(arg_90_11))

                slot_90_16_2 = string.format(arg_90_12, arg_90_8)
                slot_90_17_1 = theme.fonts.item:get_text_size(slot_90_16_2).x

                slot_0_58_0(arg_90_0, theme.fonts.item, arg_90_2 + arg_90_4 - slot_90_17_1, arg_90_3, slot_90_16_2, theme.colors.text_normal:mod_a(arg_90_11))
        end

        arg_90_0:add_rect_filled_rounded(draw.rect(arg_90_2, slot_90_15_0, arg_90_2 + arg_90_4, slot_90_15_0 + slot_90_14_0), theme.colors.bg_item_active:mod_a(arg_90_11), 3)

        slot_90_16_1 = (arg_90_8 - arg_90_6) / (arg_90_7 - arg_90_6)
        slot_90_16_0 = slot_0_54_0(slot_90_16_1, 0, 1)
        slot_90_17_0 = slot_90_16_0
        slot_0_112_0.slider_vis[arg_90_1] = slot_90_16_0

        if slot_90_17_0 > 0 then
                arg_90_0:add_rect_filled_rounded(draw.rect(arg_90_2, slot_90_15_0, arg_90_2 + arg_90_4 * slot_90_17_0, slot_90_15_0 + slot_90_14_0), theme.colors.accent:mod_a(arg_90_11), 3)
        end

        arg_90_0:add_rect_rounded(draw.rect(arg_90_2, slot_90_15_0, arg_90_2 + arg_90_4, slot_90_15_0 + slot_90_14_0), theme.colors.border_inner:mod_a(arg_90_11), 3)

        slot_90_18_0 = arg_90_2 + slot_90_17_0 * arg_90_4

        arg_90_0:add_circle_filled(draw.vec2(slot_90_18_0, slot_90_15_0 + slot_90_14_0 / 2), 8, theme.colors.accent:mod_a(arg_90_11))
        arg_90_0:add_circle_filled(draw.vec2(slot_90_18_0, slot_90_15_0 + slot_90_14_0 / 2), 6, theme.colors.accent_text:mod_a(arg_90_11))

        if (arg_90_13 or slot_0_65_0.pressed) and slot_0_57_0(arg_90_2, slot_90_15_0 - 8, arg_90_4, slot_90_14_0 + 16, arg_90_9, arg_90_10) or active_control_id == arg_90_1 and slot_0_65_0.down then
                active_control_id = arg_90_1
                slot_90_20_1 = (arg_90_9 - arg_90_2) / arg_90_4
                slot_90_20_0 = slot_0_54_0(slot_90_20_1, 0, 1)
                arg_90_8 = arg_90_6 + (arg_90_7 - arg_90_6) * slot_90_20_0
        end

        if slot_0_65_0.released and active_control_id == arg_90_1 then
                active_control_id = nil
        end

        return arg_90_8
end

function slot_0_122_0(arg_91_0, arg_91_1, arg_91_2, arg_91_3, arg_91_4, arg_91_5, arg_91_6, arg_91_7, arg_91_8, arg_91_9)
        for iter_91_0 = 0, arg_91_4 do
                arg_91_0:add_line(draw.vec2(arg_91_2 + iter_91_0, arg_91_3), draw.vec2(arg_91_2 + iter_91_0, arg_91_3 + arg_91_5), draw.color(0, 0, 0):hsv(iter_91_0 / arg_91_4 * 359, 1, 1):mod_a(arg_91_8))
        end

        arg_91_0:add_rect_rounded(draw.rect(arg_91_2, arg_91_3, arg_91_2 + arg_91_4, arg_91_3 + arg_91_5), theme.colors.border_inner:mod_a(arg_91_8), 3)

        if slot_0_65_0.pressed and slot_0_57_0(arg_91_2, arg_91_3, arg_91_4, arg_91_5, arg_91_6, arg_91_7) or active_control_id == arg_91_1 and slot_0_65_0.down and slot_0_57_0(arg_91_2 - 5, arg_91_3, arg_91_4 + 10, arg_91_5, arg_91_6, arg_91_7) then
                active_control_id = arg_91_1

                local var_91_0 = (arg_91_6 - arg_91_2) / arg_91_4

                arg_91_9 = slot_0_54_0(var_91_0 * 359, 0, 359)

                if arg_91_1 == "picker_hue_menu" then
                        slot_0_86_0.is_rgb = false
                elseif arg_91_1:find("wm") then
                        slot_0_87_0.wm_is_rgb = false
                end
        end

        local var_91_1 = arg_91_2 + arg_91_9 / 359 * arg_91_4

        arg_91_0:add_rect_filled(draw.rect(var_91_1 - 1, arg_91_3, var_91_1 + 1, arg_91_3 + arg_91_5), draw.color(255, 255, 255, 150 * arg_91_8))
        arg_91_0:add_rect(draw.rect(var_91_1 - 2, arg_91_3 - 1, var_91_1 + 2, arg_91_3 + arg_91_5 + 1), draw.color(0, 0, 0, 200 * arg_91_8))

        return arg_91_9
end

function slot_0_123_0(arg_92_0, arg_92_1, arg_92_2, arg_92_3, arg_92_4, arg_92_5, arg_92_6, arg_92_7, arg_92_8, arg_92_9, arg_92_10, arg_92_11)
        arg_92_0:add_rect_filled_multicolor(draw.rect(arg_92_2, arg_92_3, arg_92_2 + arg_92_4, arg_92_3 + arg_92_5), {
                arg_92_10:mod_a(arg_92_8),
                arg_92_11:mod_a(arg_92_8),
                arg_92_11:mod_a(arg_92_8),
                arg_92_10:mod_a(arg_92_8)
        })
        arg_92_0:add_rect_rounded(draw.rect(arg_92_2, arg_92_3, arg_92_2 + arg_92_4, arg_92_3 + arg_92_5), theme.colors.border_inner:mod_a(arg_92_8), 3)

        if slot_0_65_0.pressed and slot_0_57_0(arg_92_2, arg_92_3, arg_92_4, arg_92_5, arg_92_6, arg_92_7) or active_control_id == arg_92_1 and slot_0_65_0.down and slot_0_57_0(arg_92_2 - 5, arg_92_3, arg_92_4 + 10, arg_92_5, arg_92_6, arg_92_7) then
                active_control_id = arg_92_1

                local var_92_0 = (arg_92_6 - arg_92_2) / arg_92_4

                arg_92_9 = slot_0_54_0(var_92_0, 0, 1)
        end

        local var_92_1 = arg_92_2 + arg_92_9 * arg_92_4

        arg_92_0:add_rect_filled(draw.rect(var_92_1 - 1, arg_92_3, var_92_1 + 1, arg_92_3 + arg_92_5), draw.color(255, 255, 255, 150 * arg_92_8))
        arg_92_0:add_rect(draw.rect(var_92_1 - 2, arg_92_3 - 1, var_92_1 + 2, arg_92_3 + arg_92_5 + 1), draw.color(0, 0, 0, 200 * arg_92_8))

        return arg_92_9
end

function slot_0_124_0(arg_93_0, arg_93_1, arg_93_2, arg_93_3, arg_93_4, arg_93_5, arg_93_6, arg_93_7, arg_93_8, arg_93_9, arg_93_10)
        local var_93_0 = slot_0_57_0(arg_93_2, arg_93_3, arg_93_4, arg_93_5, arg_93_7, arg_93_8)
        local var_93_1 = var_93_0 and theme.colors.bg_item_hover or theme.colors.bg_item_active

        arg_93_0:add_rect_filled_rounded(draw.rect(arg_93_2, arg_93_3, arg_93_2 + arg_93_4, arg_93_3 + arg_93_5), var_93_1:mod_a(arg_93_10), 4)
        arg_93_0:add_rect_rounded(draw.rect(arg_93_2, arg_93_3, arg_93_2 + arg_93_4, arg_93_3 + arg_93_5), theme.colors.border_inner:mod_a(arg_93_10), 4)

        local var_93_2 = theme.fonts.item:get_text_size(arg_93_6).x

        slot_0_58_0(arg_93_0, theme.fonts.item, arg_93_2 + (arg_93_4 - var_93_2) / 2, arg_93_3 + (arg_93_5 - 14) / 2, arg_93_6, theme.colors.text_light:mod_a(arg_93_10))

        if var_93_0 and arg_93_9 then
                slot_0_114_0()

                return true
        end

        return false
end

function slot_0_125_0(arg_94_0, arg_94_1, arg_94_2, arg_94_3, arg_94_4, arg_94_5, arg_94_6, arg_94_7, arg_94_8)
        local var_94_0 = G.scale_dim(42)
        local var_94_1 = G.scale_dim(20)
        local var_94_2 = var_94_1 / 2
        local var_94_3 = arg_94_1
        local var_94_4 = arg_94_2
        local var_94_5 = slot_0_57_0(var_94_3, var_94_4, var_94_0, var_94_1, arg_94_5, arg_94_6)
        local var_94_6 = theme.colors.accent:mod_a(arg_94_8)
        local var_94_7 = theme.colors.bg_item_active:mod_a(arg_94_8)

        arg_94_0:add_rect_filled_rounded(draw.rect(var_94_3, var_94_4, var_94_3 + var_94_0, var_94_4 + var_94_1), var_94_7, var_94_2)

        if arg_94_4 then
                arg_94_0:add_rect_filled_rounded(draw.rect(var_94_3, var_94_4, var_94_3 + var_94_0, var_94_4 + var_94_1), var_94_6, var_94_2)
        end

        local var_94_8 = var_94_3 + (arg_94_4 and var_94_0 - var_94_2 or var_94_2)

        arg_94_0:add_circle_filled(draw.vec2(var_94_8, var_94_4 + var_94_2), var_94_2 - 2, theme.colors.accent_text:mod_a(arg_94_8))

        local var_94_9 = game and game.global_vars and game.global_vars.real_time or 0
        local var_94_10 = slot_0_112_0.toggle_ripple[arg_94_3]

        if var_94_10 and var_94_9 - var_94_10.t0 < 0.35 then
                local var_94_11 = (var_94_9 - var_94_10.t0) / 0.35
                local var_94_12 = var_94_2 + var_94_11 * var_94_0
                local var_94_13 = (1 - var_94_11) * 0.25 * arg_94_8

                arg_94_0:add_circle_filled(draw.vec2(var_94_3 + var_94_0 / 2, var_94_4 + var_94_2), var_94_12, theme.colors.accent:mod_a(var_94_13))
        end

        if arg_94_7 and var_94_5 then
                slot_0_112_0.toggle_ripple[arg_94_3] = {
                        t0 = var_94_9
                }

                if slot_0_86_0.enable_ui_sounds and game and game.engine and game.engine.client_cmd and slot_0_86_0.ui_checkbox_volume > 0.01 then
                        game.engine:client_cmd("play buttons/blip1")
                end
        end

        slot_0_58_0(arg_94_0, theme.fonts.item, arg_94_1 + var_94_0 + 10, arg_94_2 + 1, arg_94_3, theme.colors.text_light:mod_a(arg_94_8))

        if arg_94_7 and var_94_5 then
                return not arg_94_4
        end

        return arg_94_4
end

function slot_0_126_0(arg_95_0, arg_95_1, arg_95_2, arg_95_3, arg_95_4, arg_95_5, arg_95_6, arg_95_7, arg_95_8, arg_95_9, arg_95_10)
        local var_95_0 = active_control_id == arg_95_1
        local var_95_1 = slot_0_57_0(arg_95_2, arg_95_3, arg_95_4, arg_95_5, arg_95_7, arg_95_8)

        if arg_95_9 and (open_control_rect == nil or var_95_1) then
                if var_95_1 then
                        active_control_id = arg_95_1
                elseif var_95_0 then
                        active_control_id = nil
                end

                var_95_0 = active_control_id == arg_95_1
        end

        local var_95_2 = var_95_0 and theme.colors.bg_item_active or var_95_1 and theme.colors.bg_item_hover or theme.colors.bg_sidebar
        local var_95_3 = var_95_0 and theme.colors.accent or theme.colors.border_inner

        arg_95_6 = arg_95_6 or ""

        if var_95_0 and slot_0_32_0 then
                -- block empty
        end

        arg_95_0:add_rect_filled_rounded(draw.rect(arg_95_2, arg_95_3, arg_95_2 + arg_95_4, arg_95_3 + arg_95_5), var_95_2:mod_a(arg_95_10), 4)
        arg_95_0:add_rect_rounded(draw.rect(arg_95_2, arg_95_3, arg_95_2 + arg_95_4, arg_95_3 + arg_95_5), var_95_3:mod_a(arg_95_10), 4)

        local var_95_4 = arg_95_6 or ""
        local var_95_5 = theme.fonts.item:get_text_size(var_95_4).x

        while var_95_5 > arg_95_4 - 16 and #var_95_4 > 0 do
                var_95_4 = var_95_4:sub(2)
                var_95_5 = theme.fonts.item:get_text_size(var_95_4).x
        end

        slot_0_58_0(arg_95_0, theme.fonts.item, arg_95_2 + 8, arg_95_3 + (arg_95_5 - 14) / 2, var_95_4, theme.colors.text_light:mod_a(arg_95_10))

        if var_95_0 and math.fmod(game.global_vars.real_time, 1) < 0.5 then
                local var_95_6 = arg_95_2 + 8 + var_95_5

                arg_95_0:add_rect_filled(draw.rect(var_95_6 + 1, arg_95_3 + 4, var_95_6 + 2, arg_95_3 + arg_95_5 - 4), theme.colors.text_light:mod_a(arg_95_10))
        end

        return arg_95_6
end

function slot_0_127_0(arg_96_0, arg_96_1, arg_96_2, arg_96_3, arg_96_4, arg_96_5, arg_96_6, arg_96_7, arg_96_8, arg_96_9, arg_96_10)
        slot_0_58_0(arg_96_0, theme.fonts.item, arg_96_2, arg_96_3, arg_96_5, theme.colors.text_light:mod_a(arg_96_10))

        local var_96_0 = arg_96_3 + 20
        local var_96_1 = 28
        local var_96_2 = slot_0_110_0[arg_96_1] or tostring(arg_96_6 or 0)
        local var_96_3 = slot_0_126_0(arg_96_0, arg_96_1, arg_96_2, var_96_0, arg_96_4, var_96_1, var_96_2, arg_96_7, arg_96_8, arg_96_9, arg_96_10)

        slot_0_110_0[arg_96_1] = var_96_3

        local var_96_4 = tonumber(var_96_3)

        if var_96_4 then
                return math.floor(var_96_4 + 0.5)
        else
                return arg_96_6
        end
end

function slot_0_128_0(arg_97_0, arg_97_1, arg_97_2, arg_97_3, arg_97_4, arg_97_5, arg_97_6, arg_97_7, arg_97_8, arg_97_9, arg_97_10, arg_97_11, arg_97_12)
        local var_97_0 = arg_97_7[arg_97_8] or 1
        local var_97_1 = active_control_id == arg_97_1
        local var_97_2 = slot_0_57_0(arg_97_2, arg_97_3, arg_97_4, arg_97_5, arg_97_9, arg_97_10)

        if arg_97_11 and var_97_2 then
                if var_97_1 then
                        active_control_id = nil
                else
                        active_control_id = arg_97_1
                        opened_this_frame = true

                        if scroll_states[arg_97_1] then
                                scroll_states[arg_97_1].offset = 0
                        end
                end

                var_97_1 = active_control_id == arg_97_1
                open_control_rect = nil
        end

        local var_97_3 = var_97_1 and theme.colors.bg_item_active or var_97_2 and theme.colors.bg_item_hover or theme.colors.bg_sidebar

        arg_97_0:add_rect_filled_rounded(draw.rect(arg_97_2, arg_97_3, arg_97_2 + arg_97_4, arg_97_3 + arg_97_5), var_97_3:mod_a(arg_97_12), 4)
        arg_97_0:add_rect_rounded(draw.rect(arg_97_2, arg_97_3, arg_97_2 + arg_97_4, arg_97_3 + arg_97_5), theme.colors.border_inner:mod_a(arg_97_12), 4)
        slot_0_58_0(arg_97_0, theme.fonts.item, arg_97_2 + 12, arg_97_3 + (arg_97_5 - 14) / 2, arg_97_6[var_97_0] or "...", theme.colors.text_light:mod_a(arg_97_12))

        local var_97_4 = arg_97_2 + arg_97_4 - 18
        local var_97_5 = arg_97_3 + arg_97_5 / 2

        arg_97_0:add_line(draw.vec2(var_97_4, var_97_5 - 2), draw.vec2(var_97_4 + 4, var_97_5 + 2), theme.colors.text_dark:mod_a(arg_97_12), 1.5)
        arg_97_0:add_line(draw.vec2(var_97_4 + 4, var_97_5 + 2), draw.vec2(var_97_4 + 8, var_97_5 - 2), theme.colors.text_dark:mod_a(arg_97_12), 1.5)

        if not var_97_1 then
                return arg_97_5
        end

        local var_97_6 = 24
        local var_97_7 = 220
        local var_97_8 = var_97_6 * #arg_97_6
        local var_97_9 = var_97_7 < var_97_8
        local var_97_10 = (var_97_9 and var_97_7 or var_97_8) + 12
        local var_97_11 = arg_97_3 + arg_97_5 + 4

        if var_97_11 + var_97_10 > slot_0_77_0 + slot_0_79_0 then
                var_97_11 = arg_97_3 - var_97_10 - 4
        end

        defer(function()
                open_control_rect = {
                        x = arg_97_2,
                        y = var_97_11,
                        w = arg_97_4,
                        h = var_97_10
                }

                if scroll_states[arg_97_1] == nil then
                        scroll_states[arg_97_1] = {
                                offset = 0
                        }
                end

                slot_98_0_0 = scroll_states[arg_97_1]

                if var_97_9 and slot_0_57_0(open_control_rect.x, open_control_rect.y, open_control_rect.w, open_control_rect.h, slot_0_65_0.x, slot_0_65_0.y) then
                        slot_98_0_0.offset = slot_98_0_0.offset + scroll_this_frame * var_97_6
                        slot_98_0_0.offset = slot_0_54_0(slot_98_0_0.offset, 0, var_97_8 - var_97_7)
                end

                slot_98_1_0 = draw.surface
                slot_98_2_0 = 1

                slot_98_1_0:add_shadow_rect(draw.rect(arg_97_2, var_97_11, arg_97_2 + arg_97_4, var_97_11 + var_97_10), 10, true, 0.3 * arg_97_12 * slot_98_2_0)
                slot_98_1_0:add_rect_filled_rounded(draw.rect(arg_97_2, var_97_11, arg_97_2 + arg_97_4, var_97_11 + var_97_10), draw.color(24, 25, 32, 245 * slot_98_2_0), 6)
                slot_98_1_0:add_rect_rounded(draw.rect(arg_97_2, var_97_11, arg_97_2 + arg_97_4, var_97_11 + var_97_10), theme.colors.border_inner:mod_a(arg_97_12 * slot_98_2_0), 6)

                slot_98_3_0 = draw.rect(arg_97_2 + 4, var_97_11 + 6, arg_97_2 + arg_97_4 - 4 - (var_97_9 and 8 or 0), var_97_11 + var_97_10 - 6)

                slot_98_1_0:override_clip_rect(slot_98_3_0, true)

                for iter_98_0, iter_98_1 in ipairs(arg_97_6) do
                        slot_98_9_0 = var_97_11 + 6 + (iter_98_0 - 1) * var_97_6 - slot_98_0_0.offset

                        if slot_98_9_0 > slot_98_3_0.mins.y - var_97_6 and slot_98_9_0 < slot_98_3_0.maxs.y then
                                slot_98_10_0 = slot_0_57_0(slot_98_3_0.mins.x, slot_98_9_0, slot_98_3_0:width(), var_97_6, slot_0_65_0.x, slot_0_65_0.y)

                                if slot_98_10_0 then
                                        slot_98_1_0:add_rect_filled_rounded(draw.rect(arg_97_2 + 4, slot_98_9_0, arg_97_2 + arg_97_4 - 4 - (var_97_9 and 4 or 0), slot_98_9_0 + var_97_6), theme.colors.bg_item_hover:mod_a(arg_97_12 * slot_98_2_0), 4)
                                end

                                slot_0_58_0(slot_98_1_0, theme.fonts.item, arg_97_2 + 12, slot_98_9_0 + 4, iter_98_1, (iter_98_0 == var_97_0 or slot_98_10_0) and theme.colors.text_light:mod_a(arg_97_12 * slot_98_2_0) or theme.colors.text_normal:mod_a(arg_97_12 * slot_98_2_0))

                                if slot_98_10_0 and slot_0_65_0.pressed then
                                        arg_97_7[arg_97_8] = iter_98_0
                                        active_control_id = nil

                                        if arg_97_1 == "lang_select" then
                                                slot_0_60_0.current_language = slot_0_60_0.languages[iter_98_0]
                                        end
                                end
                        end
                end

                slot_98_1_0:override_clip_rect(nil)

                if var_97_9 then
                        slot_98_4_0 = var_97_10 - 12
                        slot_98_5_0 = math.max(20, slot_98_4_0 * (var_97_7 / var_97_8))
                        slot_98_6_0 = var_97_11 + 6 + (slot_98_4_0 - slot_98_5_0) * (slot_98_0_0.offset / (var_97_8 - var_97_7))

                        slot_98_1_0:add_rect_filled_rounded(draw.rect(arg_97_2 + arg_97_4 - 6, slot_98_6_0, arg_97_2 + arg_97_4 - 2, slot_98_6_0 + slot_98_5_0), theme.colors.bg_item_active:mod_a(arg_97_12 * slot_98_2_0), 3)
                        slot_98_1_0:add_rect_rounded(draw.rect(arg_97_2 + arg_97_4 - 6, slot_98_6_0, arg_97_2 + arg_97_4 - 2, slot_98_6_0 + slot_98_5_0), theme.colors.border_inner:mod_a(arg_97_12 * slot_98_2_0), 3)
                end
        end)

        return arg_97_5 + var_97_10 + 4
end

function slot_0_129_0(arg_99_0, arg_99_1, arg_99_2, arg_99_3, arg_99_4, arg_99_5, arg_99_6, arg_99_7, arg_99_8, arg_99_9, arg_99_10, arg_99_11, arg_99_12)
        local var_99_0 = 0

        for iter_99_0, iter_99_1 in ipairs(arg_99_7) do
                if arg_99_8[iter_99_1] then
                        var_99_0 = var_99_0 + 1
                end
        end

        local var_99_1 = var_99_0 .. " " .. slot_0_63_0("ms_selected")

        slot_0_58_0(arg_99_0, theme.fonts.item, arg_99_2, arg_99_3, arg_99_6, theme.colors.text_light:mod_a(arg_99_12))

        local var_99_2 = arg_99_3 + 22
        local var_99_3 = active_control_id == arg_99_1
        local var_99_4 = slot_0_57_0(arg_99_2, var_99_2, arg_99_4, arg_99_5, arg_99_9, arg_99_10)

        if arg_99_11 and var_99_4 then
                if var_99_3 then
                        active_control_id = nil
                else
                        active_control_id = arg_99_1
                        opened_this_frame = true

                        if scroll_states[arg_99_1] then
                                scroll_states[arg_99_1].offset = 0
                        end
                end

                var_99_3 = active_control_id == arg_99_1
                open_control_rect = nil
        end

        local var_99_5 = var_99_3 and theme.colors.bg_item_active or var_99_4 and theme.colors.bg_item_hover or theme.colors.bg_sidebar

        arg_99_0:add_rect_filled_rounded(draw.rect(arg_99_2, var_99_2, arg_99_2 + arg_99_4, var_99_2 + arg_99_5), var_99_5:mod_a(arg_99_12), 4)
        arg_99_0:add_rect_rounded(draw.rect(arg_99_2, var_99_2, arg_99_2 + arg_99_4, var_99_2 + arg_99_5), theme.colors.border_inner:mod_a(arg_99_12), 4)
        slot_0_58_0(arg_99_0, theme.fonts.item, arg_99_2 + 12, var_99_2 + (arg_99_5 - 14) / 2, var_99_1, theme.colors.text_light:mod_a(arg_99_12))

        local var_99_6 = arg_99_2 + arg_99_4 - 18
        local var_99_7 = var_99_2 + arg_99_5 / 2

        arg_99_0:add_line(draw.vec2(var_99_6, var_99_7 - 2), draw.vec2(var_99_6 + 4, var_99_7 + 2), theme.colors.text_dark:mod_a(arg_99_12), 1.5)
        arg_99_0:add_line(draw.vec2(var_99_6 + 4, var_99_7 + 2), draw.vec2(var_99_6 + 8, var_99_7 - 2), theme.colors.text_dark:mod_a(arg_99_12), 1.5)

        if not var_99_3 then
                return arg_99_5 + 22
        end

        local var_99_8 = 24
        local var_99_9 = 220
        local var_99_10 = var_99_8 * #arg_99_7
        local var_99_11 = var_99_9 < var_99_10
        local var_99_12 = (var_99_11 and var_99_9 or var_99_10) + 12
        local var_99_13 = var_99_2 + arg_99_5 + 4

        if var_99_13 + var_99_12 > slot_0_77_0 + slot_0_79_0 then
                var_99_13 = arg_99_3 - var_99_12 - 4
        end

        defer(function()
                open_control_rect = {
                        x = arg_99_2,
                        y = var_99_13,
                        w = arg_99_4,
                        h = var_99_12
                }

                if scroll_states[arg_99_1] == nil then
                        scroll_states[arg_99_1] = {
                                offset = 0
                        }
                end

                slot_100_0_0 = scroll_states[arg_99_1]

                if var_99_11 and slot_0_57_0(open_control_rect.x, open_control_rect.y, open_control_rect.w, open_control_rect.h, slot_0_65_0.x, slot_0_65_0.y) then
                        slot_100_0_0.offset = slot_100_0_0.offset + scroll_this_frame * var_99_8
                        slot_100_0_0.offset = slot_0_54_0(slot_100_0_0.offset, 0, var_99_10 - var_99_9)
                end

                slot_100_1_0 = draw.surface

                slot_100_1_0:add_shadow_rect(draw.rect(arg_99_2, var_99_13, arg_99_2 + arg_99_4, var_99_13 + var_99_12), 10, true, 0.3 * arg_99_12)
                slot_100_1_0:add_rect_filled_rounded(draw.rect(arg_99_2, var_99_13, arg_99_2 + arg_99_4, var_99_13 + var_99_12), draw.color(24, 25, 32, 245), 6)
                slot_100_1_0:add_rect_rounded(draw.rect(arg_99_2, var_99_13, arg_99_2 + arg_99_4, var_99_13 + var_99_12), theme.colors.border_inner:mod_a(arg_99_12), 6)

                slot_100_2_0 = draw.rect(arg_99_2 + 4, var_99_13 + 6, arg_99_2 + arg_99_4 - 4 - (var_99_11 and 8 or 0), var_99_13 + var_99_12 - 6)

                slot_100_1_0:override_clip_rect(slot_100_2_0, true)

                for iter_100_0, iter_100_1 in ipairs(arg_99_7) do
                        slot_100_8_0 = var_99_13 + 6 + (iter_100_0 - 1) * var_99_8 - slot_100_0_0.offset

                        if slot_100_8_0 > var_99_13 - var_99_8 and slot_100_8_0 < var_99_13 + var_99_12 then
                                slot_100_9_0 = slot_0_57_0(slot_100_2_0.mins.x, slot_100_8_0, slot_100_2_0:width(), var_99_8, slot_0_65_0.x, slot_0_65_0.y)

                                if slot_100_9_0 then
                                        slot_100_1_0:add_rect_filled_rounded(draw.rect(arg_99_2 + 4, slot_100_8_0, slot_100_2_0.maxs.x, slot_100_8_0 + var_99_8), theme.colors.bg_item_hover:mod_a(arg_99_12), 4)
                                end

                                slot_100_10_0 = arg_99_8[iter_100_1]
                                slot_100_11_0 = slot_0_120_0(slot_100_1_0, arg_99_2 + 10, slot_100_8_0 + 3, iter_100_1, slot_100_10_0, slot_0_65_0.x, slot_0_65_0.y, slot_100_9_0 and slot_0_65_0.pressed, arg_99_12)

                                if slot_100_11_0 ~= slot_100_10_0 then
                                        arg_99_8[iter_100_1] = slot_100_11_0
                                end
                        end
                end

                slot_100_1_0:override_clip_rect(nil)

                if var_99_11 then
                        slot_100_3_0 = var_99_12 - 12
                        slot_100_4_0 = math.max(20, slot_100_3_0 * (var_99_9 / var_99_10))
                        slot_100_5_0 = var_99_13 + 6 + (slot_100_3_0 - slot_100_4_0) * (slot_100_0_0.offset / (var_99_10 - var_99_9))

                        slot_100_1_0:add_rect_filled_rounded(draw.rect(arg_99_2 + arg_99_4 - 8, slot_100_5_0, arg_99_2 + arg_99_4 - 4, slot_100_5_0 + slot_100_4_0), theme.colors.bg_item_active, 2)
                end
        end)

        return arg_99_5 + 22
end

function slot_0_130_0(arg_101_0, arg_101_1)
        local var_101_0 = 0
        local var_101_1 = 1

        while arg_101_0 > 0 and arg_101_1 > 0 do
                if arg_101_0 % 2 == 1 and arg_101_1 % 2 == 1 then
                        var_101_0 = var_101_0 + var_101_1
                end

                var_101_1 = var_101_1 * 2
                arg_101_0 = math.floor(arg_101_0 / 2)
                arg_101_1 = math.floor(arg_101_1 / 2)
        end

        return var_101_0
end

function slot_0_131_0(arg_102_0, arg_102_1)
        local var_102_0 = 0
        local var_102_1 = 1

        for iter_102_0 = 0, 31 do
                local var_102_2 = arg_102_0 % 2
                local var_102_3 = arg_102_1 % 2

                if var_102_2 + var_102_3 > 0 then
                        var_102_0 = var_102_0 + var_102_1
                end

                arg_102_0 = (arg_102_0 - var_102_2) / 2
                arg_102_1 = (arg_102_1 - var_102_3) / 2
                var_102_1 = var_102_1 * 2
        end

        return var_102_0
end

function slot_0_132_0(arg_103_0)
        return 4294967295 - arg_103_0 % 4294967296
end

slot_0_133_0 = __welcome_already or false

if not __script_loaded_rt and (not game or not game.global_vars or not game.global_vars.real_time) then
        slot_0_134_0 = 0
end

if not G then
        G = {}
end

if not G.aimlock then
        G.aimlock = {
                target_priority = 1,
                disable_if_multi = false,
                fov_no_anim = false,
                show_fov = true,
                multi_distance = 200,
                enable = false,
                disable_distance = 0,
                fov_multiplier = 200,
                smooth = 50,
                enemy_list = {},
                selected_enemies = {},
                weapon_names = {
                        [0] = "None",
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
                        "M249",
                        nil,
                        "M4A4",
                        "MAC-10",
                        nil,
                        "P90",
                        "Zone Repulsor",
                        nil,
                        nil,
                        "MP5-SD",
                        "UMP-45",
                        "XM1014",
                        "PP-Bizon",
                        "MAG-7",
                        "Negev",
                        "Sawed-Off",
                        "Tec-9",
                        "Zeus x27",
                        "P2000",
                        "MP7",
                        "MP9",
                        "Nova",
                        "P250",
                        "Shield",
                        "SCAR-20",
                        "SG 553",
                        "SSG-08",
                        "Golden Knife",
                        "Knife",
                        "Flashbang",
                        "HE Grenade",
                        "Smoke Grenade",
                        "Molotov",
                        "Decoy Grenade",
                        "Incendiary Grenade",
                        "C4 Explosive",
                        "Health Shot",
                        "Terrorist Knife",
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
                        nil,
                        nil,
                        nil,
                        "Tactical Awareness Grenade",
                        "Fists",
                        "Breach Charge",
                        nil,
                        "Tablet",
                        nil,
                        "Melee",
                        "Axe",
                        "Hammer",
                        nil,
                        "Spanner (Wrench)",
                        nil,
                        "Ghost Knife",
                        "Firebomb",
                        "Diversion Device",
                        "Frag Grenade",
                        "Snowball",
                        "Bump Mine",
                        [515] = "Butterfly Knife",
                        [516] = "Shadow Daggers",
                        [519] = "Ursus Knife",
                        [520] = "Navaja Knife",
                        [523] = "Talon Knife",
                        [525] = "Skeleton Knife",
                        [526] = "Kukri Knife",
                        [512] = "Falchion Knife",
                        [514] = "Bowie Knife",
                        [518] = "Survival Knife",
                        [500] = "Bayonet",
                        [503] = "Classic Knife",
                        [521] = "Nomad Knife",
                        [505] = "Flip Knife",
                        [522] = "Stiletto Knife",
                        [507] = "Karambit",
                        [506] = "Gut Knife",
                        [509] = "Huntsman Knife",
                        [508] = "M9 Bayonet",
                        [517] = "Paracord Knife"
                },
                weapon_type_names = {
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
                        "Zone Repulsor",
                        "Unknown"
                }
        }

        function G.aimlock.normalize_yaw(arg_104_0)
                return (arg_104_0 + 180) % 360 - 180
        end

        function G.aimlock.detect_enemies()
                local var_105_0 = G.aimlock

                var_105_0.enemy_list = {}

                if not game.engine:in_game() then
                        return
                end

                local var_105_1 = entities.get_local_pawn()

                if not var_105_1 or not var_105_1:is_alive() then
                        return
                end

                if not entities or not entities.players or not entities.players.for_each then
                        return
                end

                entities.players:for_each(function(arg_106_0)
                        if arg_106_0.entity and arg_106_0.entity.is_enemy and arg_106_0.entity:is_enemy() and arg_106_0.entity.is_alive and arg_106_0.entity:is_alive() then
                                local var_106_0 = arg_106_0.entity.m_iHealth and arg_106_0.entity.m_iHealth.get and arg_106_0.entity.m_iHealth:get() or 100
                                local var_106_1 = arg_106_0.entity.get_name and arg_106_0.entity:get_name() or "Unknown"
                                local var_106_2 = tostring(arg_106_0.entity.get_index and arg_106_0.entity:get_index() or math.random(1000, 9999))

                                table.insert(var_105_0.enemy_list, {
                                        name = var_106_1,
                                        hp = var_106_0,
                                        user_id = var_106_2,
                                        entity = arg_106_0.entity
                                })
                        end
                end)
                table.sort(var_105_0.enemy_list, function(arg_107_0, arg_107_1)
                        return (arg_107_0.name or "") < (arg_107_1.name or "")
                end)
        end

        function G.aimlock.get_player_in_crosshair()
                local var_108_0 = entities.get_local_pawn()

                if not var_108_0 or not var_108_0:is_alive() then
                        return nil
                end

                local var_108_1 = game and game.engine

                if not var_108_1 or not var_108_1.get_screen_size then
                        return nil
                end

                local var_108_2, var_108_3 = var_108_1:get_screen_size()
                local var_108_4 = var_108_2 / 2
                local var_108_5 = var_108_3 / 2
                local var_108_6 = 50
                local var_108_7 = math.huge
                local var_108_8

                entities.players:for_each(function(arg_109_0)
                        if arg_109_0.entity and arg_109_0.entity.is_alive and arg_109_0.entity:is_alive() and arg_109_0.entity.is_enemy and arg_109_0.entity:is_enemy() then
                                local var_109_0 = arg_109_0.entity:get_eye_pos()

                                if var_109_0 then
                                        local var_109_1 = {
                                                var_109_0,
                                                math.vec3(var_109_0.x, var_109_0.y, var_109_0.z - 30),
                                                math.vec3(var_109_0.x, var_109_0.y, var_109_0.z - 60)
                                        }

                                        for iter_109_0, iter_109_1 in ipairs(var_109_1) do
                                                local var_109_2 = math.world_to_screen(iter_109_1)

                                                if var_109_2 then
                                                        local var_109_3 = var_109_2.x - var_108_4
                                                        local var_109_4 = var_109_2.y - var_108_5
                                                        local var_109_5 = math.sqrt(var_109_3 * var_109_3 + var_109_4 * var_109_4)

                                                        if var_109_5 < var_108_6 and var_109_5 < var_108_7 then
                                                                var_108_7 = var_109_5
                                                                var_108_8 = arg_109_0.entity

                                                                break
                                                        end
                                                end
                                        end
                                end
                        end
                end)

                return var_108_8
        end

        function G.aimlock.count_nearby_enemies()
                local var_110_0 = entities.get_local_pawn()

                if not var_110_0 or not var_110_0:is_alive() then
                        return 0
                end

                local var_110_1, var_110_2 = game.engine:get_screen_size()
                local var_110_3 = var_110_1 / 2
                local var_110_4 = var_110_2 / 2
                local var_110_5 = 0

                entities.players:for_each(function(arg_111_0)
                        if arg_111_0 and arg_111_0.had_dataupdate and arg_111_0.entity:is_alive() and arg_111_0.entity ~= var_110_0 and arg_111_0.entity:is_enemy() then
                                local var_111_0 = arg_111_0.entity:get_eye_pos()
                                local var_111_1 = math.world_to_screen(var_111_0)

                                if var_111_1 and math.sqrt((var_111_1.x - var_110_3)^2 + (var_111_1.y - var_110_4)^2) < G.aimlock.multi_distance then
                                        var_110_5 = var_110_5 + 1
                                end
                        end
                end)

                return var_110_5
        end

        function G.aimlock.loop()
                slot_112_0_0 = G.aimlock

                if not slot_112_0_0.enable then
                        return
                end

                slot_112_1_0 = 0

                if slot_112_0_0.disable_if_multi then
                        slot_112_1_0 = slot_112_0_0.count_nearby_enemies()
                end

                if slot_112_0_0.disable_if_multi and slot_112_1_0 >= 2 then
                        return
                end

                slot_112_2_0 = entities.get_local_pawn()

                if not slot_112_2_0 or not slot_112_2_0:is_alive() then
                        return
                end

                slot_112_3_0 = game.input:get_view_angles()

                if not slot_112_3_0 then
                        return
                end

                slot_112_4_0, slot_112_5_0 = game.engine:get_screen_size()
                slot_112_6_0 = math.huge
                slot_112_7_0 = nil

                entities.players:for_each(function(arg_113_0)
                        if arg_113_0 and arg_113_0.had_dataupdate and arg_113_0.entity:is_alive() and arg_113_0.entity ~= slot_112_2_0 and arg_113_0.entity:is_enemy() then
                                local var_113_0 = arg_113_0.entity:get_eye_pos()
                                local var_113_1 = math.world_to_screen(var_113_0)

                                if var_113_1 then
                                        local var_113_2 = draw.vec2(slot_112_4_0 / 2, slot_112_5_0 / 2)
                                        local var_113_3 = math.sqrt((var_113_2.x - var_113_1.x)^2 + (var_113_2.y - var_113_1.y)^2)

                                        if var_113_3 < slot_112_6_0 then
                                                slot_112_6_0 = var_113_3
                                                slot_112_7_0 = arg_113_0.handle
                                        end
                                end
                        end
                end)

                if slot_112_7_0 and slot_112_7_0:valid() and slot_112_7_0:get() then
                        slot_112_7_0 = slot_112_7_0:get()
                        slot_112_8_0 = slot_112_7_0:get_eye_pos()
                        slot_112_9_0 = slot_112_2_0:get_eye_pos()
                        slot_112_10_0 = math.world_to_screen(slot_112_8_0)

                        if not slot_112_10_0 then
                                return
                        end

                        slot_112_11_0 = draw.vec2(slot_112_4_0 / 2, slot_112_5_0 / 2)
                        slot_112_12_0 = math.sqrt((slot_112_11_0.x - slot_112_10_0.x)^2 + (slot_112_11_0.y - slot_112_10_0.y)^2)
                        slot_112_13_0 = math.vec3(slot_112_8_0.x - slot_112_9_0.x, slot_112_8_0.y - slot_112_9_0.y, slot_112_8_0.z - slot_112_9_0.z)
                        slot_112_14_1 = math.deg(math.atan2(slot_112_13_0.y, slot_112_13_0.x))
                        slot_112_15_1 = math.deg(math.atan2(-slot_112_13_0.z, math.sqrt(slot_112_13_0.x * slot_112_13_0.x + slot_112_13_0.y * slot_112_13_0.y)))
                        slot_112_14_0 = slot_112_0_0.normalize_yaw(slot_112_14_1)
                        slot_112_15_0 = slot_0_54_0(slot_112_15_1, -89, 89)
                        slot_112_16_0 = slot_112_0_0.normalize_yaw(slot_112_14_0 - slot_112_3_0.y)
                        slot_112_17_0 = slot_112_15_0 - slot_112_3_0.x
                        slot_112_18_0 = slot_112_2_0:get_active_weapon()

                        if not slot_112_18_0 then
                                return
                        end

                        slot_112_19_0 = 0
                        slot_112_20_2 = "legit>weapon>" .. (slot_112_0_0.weapon_names[slot_112_18_0:get_id()] or "") .. ">aim>aim fov"
                        slot_112_21_0 = gui.ctx:find(slot_112_20_2)

                        if not slot_112_21_0 then
                                slot_112_20_1 = "legit>weapon>" .. (slot_112_0_0.weapon_type_names[slot_112_18_0:get_type()] or "") .. ">aim>aim fov"
                                slot_112_21_0 = gui.ctx:find(slot_112_20_1)
                        end

                        if not slot_112_21_0 then
                                slot_112_20_0 = "legit>weapon>general>aim>aim fov"
                                slot_112_21_0 = gui.ctx:find(slot_112_20_0)
                        end

                        if slot_112_21_0 and slot_112_21_0.get_value then
                                slot_112_19_0 = slot_112_21_0:get_value():get()
                        end

                        slot_112_22_0 = slot_112_0_0.fov_multiplier

                        if slot_112_0_0.disable_if_multi and slot_112_1_0 >= 2 then
                                slot_112_22_0 = 2
                        end

                        if slot_112_12_0 > slot_112_19_0 * slot_112_22_0 or slot_112_12_0 < slot_112_0_0.disable_distance then
                                return
                        end

                        slot_112_24_0 = slot_112_0_0.smooth * 0.01
                        slot_112_25_0 = math.max(0.05, 1 - slot_112_24_0)
                        slot_112_26_0 = slot_112_0_0.normalize_yaw(slot_112_3_0.y + slot_112_16_0 * slot_112_25_0)
                        slot_112_27_0 = slot_0_54_0(slot_112_3_0.x + slot_112_17_0 * slot_112_25_0, -89, 89)

                        game.input:set_view_angles(math.vec3(slot_112_27_0, slot_112_26_0, 0))
                end
        end
end

function G.aimlock.draw_fov()
        slot_114_0_0 = G.aimlock

        if not slot_114_0_0.enable or not slot_114_0_0.show_fov then
                return
        end

        slot_114_1_0 = entities.get_local_pawn()

        if not slot_114_1_0 or not slot_114_1_0:is_alive() then
                return
        end

        slot_114_2_0 = slot_114_1_0:get_active_weapon()

        if not slot_114_2_0 then
                return
        end

        slot_114_3_0 = 0
        slot_114_4_2 = "legit>weapon>" .. (slot_114_0_0.weapon_names[slot_114_2_0:get_id()] or "") .. ">aim>aim fov"
        slot_114_5_0 = gui.ctx:find(slot_114_4_2)

        if not slot_114_5_0 then
                slot_114_4_1 = "legit>weapon>" .. (slot_114_0_0.weapon_type_names[slot_114_2_0:get_type()] or "") .. ">aim>aim fov"
                slot_114_5_0 = gui.ctx:find(slot_114_4_1)
        end

        if not slot_114_5_0 then
                slot_114_4_0 = "legit>weapon>general>aim>aim fov"
                slot_114_5_0 = gui.ctx:find(slot_114_4_0)
        end

        if slot_114_5_0 and slot_114_5_0.get_value then
                slot_114_3_0 = slot_114_5_0:get_value():get()
        end

        if slot_114_3_0 <= 0 then
                return
        end

        slot_114_6_0 = draw.surface
        slot_114_7_0, slot_114_8_0 = game.engine:get_screen_size()
        slot_114_9_0 = slot_114_7_0 / 2
        slot_114_10_0 = slot_114_8_0 / 2
        slot_114_11_0 = slot_114_3_0 * slot_114_0_0.fov_multiplier
        slot_114_12_0 = game.global_vars.real_time
        slot_114_13_0 = slot_114_0_0.fov_no_anim and 0 or math.sin(slot_114_12_0 * 20) * 3
        slot_114_14_0 = 64
        slot_114_15_0 = 180

        for iter_114_0 = 0, slot_114_14_0 - 1 do
                slot_114_20_0 = iter_114_0 / slot_114_14_0 * math.pi * 2
                slot_114_21_0 = (iter_114_0 + 1) / slot_114_14_0 * math.pi * 2
                slot_114_22_0 = draw.vec2(slot_114_9_0 + math.cos(slot_114_20_0) * slot_114_11_0, slot_114_10_0 + math.sin(slot_114_20_0) * slot_114_11_0)
                slot_114_23_0 = draw.vec2(slot_114_9_0 + math.cos(slot_114_21_0) * slot_114_11_0, slot_114_10_0 + math.sin(slot_114_21_0) * slot_114_11_0)
                slot_114_24_0 = draw.vec2(slot_114_22_0.x + slot_114_13_0, slot_114_22_0.y)
                slot_114_25_0 = draw.vec2(slot_114_23_0.x + slot_114_13_0, slot_114_23_0.y)

                slot_114_6_0:add_line(slot_114_24_0, slot_114_25_0, draw.color(255, 0, 0, slot_114_15_0 * 0.6), 2)

                slot_114_26_0 = draw.vec2(slot_114_22_0.x - slot_114_13_0, slot_114_22_0.y)
                slot_114_27_0 = draw.vec2(slot_114_23_0.x - slot_114_13_0, slot_114_23_0.y)

                slot_114_6_0:add_line(slot_114_26_0, slot_114_27_0, draw.color(0, 255, 255, slot_114_15_0 * 0.6), 2)
                slot_114_6_0:add_line(slot_114_22_0, slot_114_23_0, draw.color(255, 255, 255, slot_114_15_0), 1.5)
        end

        if not slot_114_0_0.fov_no_anim and math.floor(slot_114_12_0 * 10) % 3 == 0 then
                slot_114_16_0 = slot_114_10_0 + math.random(-slot_114_11_0, slot_114_11_0)

                slot_114_6_0:add_line(draw.vec2(slot_114_9_0 - slot_114_11_0, slot_114_16_0), draw.vec2(slot_114_9_0 + slot_114_11_0, slot_114_16_0), draw.color(0, 255, 0, 100), 1)
        end
end

function G.aimlock.render_tab(arg_115_0, arg_115_1, arg_115_2, arg_115_3, arg_115_4, arg_115_5, arg_115_6, arg_115_7, arg_115_8, arg_115_9)
        local var_115_0 = G.aimlock
        local var_115_1 = (arg_115_3 - 20) * 0.5
        local var_115_2 = arg_115_2

        slot_0_58_0(arg_115_0, theme.fonts.category, arg_115_1, var_115_2, slot_0_63_0("aimlock_title"), theme.colors.text_light:mod_a(arg_115_8))

        local var_115_3 = var_115_2 + 30

        var_115_0.enable = slot_0_125_0(arg_115_0, arg_115_1, var_115_3, slot_0_63_0("aimlock_enable"), var_115_0.enable, arg_115_5, arg_115_6, arg_115_7, arg_115_8)

        local var_115_4 = var_115_3 + 35

        if var_115_0.enable then
                var_115_0.show_fov = slot_0_125_0(arg_115_0, arg_115_1, var_115_4, slot_0_63_0("aimlock_show_fov"), var_115_0.show_fov, arg_115_5, arg_115_6, arg_115_7, arg_115_8)

                local var_115_5 = var_115_4 + 35

                if var_115_0.show_fov then
                        var_115_0.fov_no_anim = slot_0_125_0(arg_115_0, arg_115_1, var_115_5, slot_0_63_0("aimlock_fov_no_anim"), var_115_0.fov_no_anim, arg_115_5, arg_115_6, arg_115_7, arg_115_8)
                        var_115_5 = var_115_5 + 35
                end

                var_115_0.disable_if_multi = slot_0_125_0(arg_115_0, arg_115_1, var_115_5, slot_0_63_0("aimlock_disable_multi"), var_115_0.disable_if_multi, arg_115_5, arg_115_6, arg_115_7, arg_115_8)

                local var_115_6 = var_115_5 + 35

                if var_115_0.disable_if_multi then
                        var_115_0.multi_distance = slot_0_121_0(arg_115_0, "aimlock_multi_dist", arg_115_1, var_115_6, var_115_1, slot_0_63_0("aimlock_multi_distance"), 50, 500, var_115_0.multi_distance, arg_115_5, arg_115_6, arg_115_8, "%.0f px")
                        var_115_6 = var_115_6 + 50
                end

                var_115_0.fov_multiplier = slot_0_121_0(arg_115_0, "aimlock_fov_mult", arg_115_1, var_115_6, var_115_1, slot_0_63_0("aimlock_fov_multiplier"), 1, 200, var_115_0.fov_multiplier, arg_115_5, arg_115_6, arg_115_8, "%.1f")

                local var_115_7 = var_115_6 + 50

                var_115_0.disable_distance = slot_0_121_0(arg_115_0, "aimlock_disable_dist", arg_115_1, var_115_7, var_115_1, slot_0_63_0("aimlock_disable_distance"), 0, 35, var_115_0.disable_distance, arg_115_5, arg_115_6, arg_115_8, "%.0fpx")

                local var_115_8 = var_115_7 + 50

                var_115_0.smooth = slot_0_121_0(arg_115_0, "aimlock_smooth", arg_115_1, var_115_8, var_115_1, slot_0_63_0("aimlock_smooth"), 0, 100, var_115_0.smooth, arg_115_5, arg_115_6, arg_115_8, "%.0f")

                local var_115_9 = var_115_8 + 50

                slot_0_58_0(arg_115_0, theme.fonts.small, arg_115_1, var_115_9, slot_0_63_0("aimlock_info"), theme.colors.text_normal:mod_a(arg_115_8))

                local var_115_10 = var_115_9 + 30
        end
end

slot_0_135_0 = __tab_ripple or {}

function slot_0_136_0(arg_116_0, arg_116_1, arg_116_2, arg_116_3, arg_116_4, arg_116_5)
        local var_116_0 = game.global_vars.real_time
        local var_116_1 = (arg_116_3 or 20) / 2
        local var_116_2 = arg_116_2 or 42
        local var_116_3 = arg_116_4 or 255

        slot_0_135_0[arg_116_5 or "tab"] = {
                t0 = var_116_0,
                x = arg_116_0,
                y = arg_116_1,
                r = var_116_1,
                w = var_116_2,
                a = var_116_3
        }
end

function slot_0_137_0(arg_117_0)
        local var_117_0 = game.global_vars.real_time

        for iter_117_0, iter_117_1 in pairs(slot_0_135_0) do
                if iter_117_1 and var_117_0 - iter_117_1.t0 < 0.18 then
                        local var_117_1 = (var_117_0 - iter_117_1.t0) / 0.18
                        local var_117_2 = iter_117_1.r + var_117_1 * iter_117_1.w
                        local var_117_3 = math.min(var_117_2, 8)
                        local var_117_4 = (1 - var_117_1) * 0.3 * iter_117_1.a

                        arg_117_0:add_circle_filled(draw.vec2(iter_117_1.x, iter_117_1.y), var_117_3, theme.colors.accent:mod_a(var_117_4))
                else
                        slot_0_135_0[iter_117_0] = nil
                end
        end
end

function slot_0_138_0()
        if slot_0_86_0.is_rgb then
                theme.colors.accent = draw.color(0, 0, 0):hsv(game.global_vars.real_time * 50 % 360, 1, 1)
                theme._tabs_override = nil
                theme._checks_override = nil

                return
        end

        local var_118_0 = slot_0_63_0("menu_color_targets")
        local var_118_1 = slot_0_86_0.target_key_map[var_118_0[slot_0_86_0.target_index]] or "borders"
        local var_118_2 = slot_0_86_0.target_hsv[var_118_1]

        if var_118_1 == "borders" then
                theme.colors.border_inner = slot_0_56_0(var_118_2.h, var_118_2.s, var_118_2.v)
        elseif var_118_1 == "tabs" then
                theme._tabs_override = slot_0_56_0(var_118_2.h, var_118_2.s, var_118_2.v)
        elseif var_118_1 == "checks" then
                theme._checks_override = slot_0_56_0(var_118_2.h, var_118_2.s, var_118_2.v)
        elseif var_118_1 == "bg" then
                local var_118_3 = slot_0_56_0(var_118_2.h, var_118_2.s, var_118_2.v)

                theme.colors.bg_content = var_118_3
                theme.colors.bg_content_grad = var_118_3:mod_a(200)
        end

        theme.colors.accent = draw.color(0, 0, 0):hsv(slot_0_86_0.accent_hue, slot_0_86_0.accent_sat, slot_0_86_0.accent_val)
end

if not G.ui_funcs then
        G.ui_funcs = {}
end

function G.ui_funcs.draw_sidebar(arg_119_0, arg_119_1, arg_119_2, arg_119_3, arg_119_4, arg_119_5, arg_119_6, arg_119_7, arg_119_8)
        arg_119_0:add_rect_filled(draw.rect(arg_119_1, arg_119_2, arg_119_1 + arg_119_3, arg_119_2 + arg_119_4), theme.colors.bg_sidebar:mod_a(arg_119_7))
        slot_0_58_0(arg_119_0, theme.fonts.logo, arg_119_1 + 25, arg_119_2 + 20, "Tueurs.Lua", theme.colors.text_title:mod_a(arg_119_8))

        slot_119_9_0 = theme.fonts.logo:get_text_size("Tueurs.Lua").x

        arg_119_0:add_rect_filled(draw.rect(arg_119_1 + 25, arg_119_2 + 55, arg_119_1 + 25 + slot_119_9_0, arg_119_2 + 57), theme.colors.accent:mod_a(arg_119_8))

        G.sidebar_scroll_y = G.sidebar_scroll_y or 0
        slot_119_10_0 = arg_119_2 + 80
        slot_119_11_0 = arg_119_4 - 80 - 70
        slot_119_12_0 = draw.rect(arg_119_1, slot_119_10_0, arg_119_1 + arg_119_3, slot_119_10_0 + slot_119_11_0)
        slot_119_13_0 = arg_119_1 + 25
        slot_119_14_0 = arg_119_3 - 50
        slot_119_15_0 = 0

        for iter_119_0, iter_119_1 in ipairs(slot_0_82_0) do
                slot_119_21_0 = true

                if iter_119_1.parent then
                        for iter_119_2, iter_119_3 in ipairs(slot_0_82_0) do
                                if iter_119_3.id == iter_119_1.parent and not iter_119_3.is_open then
                                        slot_119_21_0 = false

                                        break
                                end
                        end
                end

                if slot_119_21_0 then
                        slot_119_15_0 = slot_119_15_0 + (iter_119_1.is_category and 36 or 38)
                end
        end

        if scroll_this_frame ~= 0 and slot_0_57_0(arg_119_1, slot_119_10_0, arg_119_3, slot_119_11_0, arg_119_5, arg_119_6) then
                G.sidebar_scroll_y = G.sidebar_scroll_y + scroll_this_frame * 40
        end

        slot_119_16_0 = math.max(0, slot_119_15_0 - slot_119_11_0)

        if G.sidebar_scroll_y < 0 then
                G.sidebar_scroll_y = 0
        end

        if slot_119_16_0 < G.sidebar_scroll_y then
                G.sidebar_scroll_y = slot_119_16_0
        end

        slot_119_17_0 = G.sidebar_scroll_y

        arg_119_0:override_clip_rect(slot_119_12_0, true)

        slot_119_18_0 = slot_119_10_0 - slot_119_17_0
        slot_119_19_1 = -1
        slot_119_20_0 = game and game.global_vars and game.global_vars.real_time or 0

        for iter_119_4, iter_119_5 in ipairs(slot_0_82_0) do
                slot_119_26_0 = true

                if iter_119_5.parent then
                        for iter_119_6, iter_119_7 in ipairs(slot_0_82_0) do
                                if iter_119_7.id == iter_119_5.parent and not iter_119_7.is_open then
                                        slot_119_26_0 = false

                                        break
                                end
                        end
                end

                if slot_119_26_0 then
                        slot_119_27_0 = iter_119_5.is_category and 36 or 38
                        slot_119_28_0 = slot_0_57_0(slot_119_13_0, slot_119_18_0, slot_119_14_0, slot_119_27_0, arg_119_5, arg_119_6)
                        slot_119_29_0 = slot_0_83_0 == iter_119_5.id

                        if slot_119_29_0 then
                                slot_119_19_0 = slot_119_18_0
                        end

                        iter_119_5.hover_alpha = iter_119_5.hover_alpha or 0

                        if slot_119_28_0 then
                                iter_119_5.hover_alpha = math.min(1, iter_119_5.hover_alpha + 0.15)
                        else
                                iter_119_5.hover_alpha = math.max(0, iter_119_5.hover_alpha - 0.15)
                        end

                        iter_119_5.select_alpha = iter_119_5.select_alpha or 0

                        if slot_119_29_0 then
                                iter_119_5.select_alpha = math.min(1, iter_119_5.select_alpha + 0.12)
                        else
                                iter_119_5.select_alpha = math.max(0, iter_119_5.select_alpha - 0.12)
                        end

                        if iter_119_5.is_category then
                                slot_119_30_1 = false

                                for iter_119_8, iter_119_9 in ipairs(slot_0_82_0) do
                                        if iter_119_9.parent == iter_119_5.id and slot_0_83_0 == iter_119_9.id then
                                                slot_119_30_1 = true

                                                break
                                        end
                                end

                                slot_119_31_1 = theme._tabs_override or theme.colors.accent:mod_a(arg_119_8)
                                iter_119_5.arrow_rotation = iter_119_5.arrow_rotation or 0
                                slot_119_32_1 = iter_119_5.is_open and 90 or 0
                                iter_119_5.arrow_rotation = iter_119_5.arrow_rotation + (slot_119_32_1 - iter_119_5.arrow_rotation) * 0.2

                                if slot_119_10_0 < slot_119_18_0 then
                                        arg_119_0:add_rect_filled(draw.rect(slot_119_13_0 + 10, slot_119_18_0 - 1, slot_119_13_0 + slot_119_14_0 - 10, slot_119_18_0), theme.colors.border_inner:mod_a(arg_119_8 * 0.3))
                                end

                                slot_119_33_2 = "?"

                                if iter_119_5.arrow_rotation > 80 then
                                        slot_119_33_2 = "?"
                                elseif iter_119_5.arrow_rotation > 60 then
                                        slot_119_33_2 = "?"
                                elseif iter_119_5.arrow_rotation > 40 then
                                        slot_119_33_2 = "?"
                                elseif iter_119_5.arrow_rotation > 20 then
                                        slot_119_33_2 = "?"
                                end

                                slot_0_58_0(arg_119_0, theme.fonts.category, slot_119_13_0 + 8, slot_119_18_0 + 11, slot_119_33_2, slot_119_31_1)

                                if slot_119_30_1 then
                                        slot_119_34_2 = (math.sin(slot_119_20_0 * 2) + 1) / 2
                                        slot_119_35_1 = math.floor(255 * slot_119_34_2 + 138 * (1 - slot_119_34_2))
                                        slot_119_36_1 = math.floor(255 * slot_119_34_2 + 43 * (1 - slot_119_34_2))
                                        slot_119_37_0 = math.floor(255 * slot_119_34_2 + 226 * (1 - slot_119_34_2))
                                        slot_119_38_1 = draw.color(slot_119_35_1, slot_119_36_1, slot_119_37_0, 255):mod_a(arg_119_8)

                                        slot_0_58_0(arg_119_0, theme.fonts.category, slot_119_13_0 + 28, slot_119_18_0 + 11, slot_0_63_0(iter_119_5.label_key), slot_119_38_1)
                                else
                                        slot_0_58_0(arg_119_0, theme.fonts.category, slot_119_13_0 + 28, slot_119_18_0 + 11, slot_0_63_0(iter_119_5.label_key), slot_119_31_1)
                                end

                                if not iter_119_5.is_open then
                                        slot_119_34_1 = 0

                                        for iter_119_10, iter_119_11 in ipairs(slot_0_82_0) do
                                                if iter_119_11.parent == iter_119_5.id then
                                                        slot_119_34_1 = slot_119_34_1 + 1
                                                end
                                        end

                                        slot_119_35_0 = "(" .. slot_119_34_1 .. ")"
                                        slot_119_36_0 = theme.fonts.small:get_text_size(slot_119_35_0)

                                        slot_0_58_0(arg_119_0, theme.fonts.small, slot_119_13_0 + slot_119_14_0 - slot_119_36_0.x - 5, slot_119_18_0 + 13, slot_119_35_0, theme.colors.text_normal:mod_a(arg_119_8 * 0.5))
                                end
                        else
                                slot_119_30_0 = theme.colors.text_normal:mod_a(arg_119_8)
                                slot_119_31_0 = theme.colors.text_normal:mod_a(arg_119_8)
                                iter_119_5.slide_in_alpha = iter_119_5.slide_in_alpha or 1

                                if iter_119_5.slide_in_alpha < 1 then
                                        iter_119_5.slide_in_alpha = math.min(1, iter_119_5.slide_in_alpha + 0.2)
                                end

                                slot_119_32_0 = (1 - iter_119_5.slide_in_alpha) * 15

                                if slot_119_29_0 then
                                        arg_119_0:add_rect_filled_rounded(draw.rect(slot_119_13_0 + slot_119_32_0, slot_119_18_0, slot_119_13_0 + slot_119_14_0, slot_119_18_0 + slot_119_27_0), theme.colors.bg_item_active:mod_a(arg_119_7 * 1.2), 5)
                                        arg_119_0:add_rect_filled_rounded(draw.rect(slot_119_13_0, slot_119_18_0 + 4, slot_119_13_0 + 3, slot_119_18_0 + slot_119_27_0 - 4), theme.colors.accent:mod_a(arg_119_8), 2)
                                        arg_119_0:add_rect_rounded(draw.rect(slot_119_13_0 + slot_119_32_0, slot_119_18_0, slot_119_13_0 + slot_119_14_0, slot_119_18_0 + slot_119_27_0), theme.colors.accent:mod_a(arg_119_8 * 0.4), 5, 1)

                                        slot_119_30_0 = theme.colors.accent_text:mod_a(arg_119_8)
                                        slot_119_31_0 = theme.colors.accent:mod_a(arg_119_8)
                                elseif iter_119_5.hover_alpha > 0 then
                                        slot_119_33_1 = arg_119_7 * iter_119_5.hover_alpha

                                        arg_119_0:add_rect_filled_rounded(draw.rect(slot_119_13_0 + slot_119_32_0, slot_119_18_0, slot_119_13_0 + slot_119_14_0, slot_119_18_0 + slot_119_27_0), theme.colors.bg_item_hover:mod_a(slot_119_33_1), 5)
                                        arg_119_0:add_rect_filled_rounded(draw.rect(slot_119_13_0, slot_119_18_0 + 6, slot_119_13_0 + 2, slot_119_18_0 + slot_119_27_0 - 6), theme.colors.accent:mod_a(arg_119_8 * iter_119_5.hover_alpha * 0.5), 1)

                                        slot_119_30_0 = theme.colors.text_light:mod_a(arg_119_8)
                                elseif slot_119_32_0 > 0 then
                                        slot_119_30_0 = theme.colors.text_normal:mod_a(arg_119_8 * iter_119_5.slide_in_alpha)
                                        slot_119_31_0 = theme.colors.text_normal:mod_a(arg_119_8 * iter_119_5.slide_in_alpha)
                                end

                                slot_119_33_0 = slot_119_13_0 + 16 + slot_119_32_0
                                slot_119_34_0 = 3

                                arg_119_0:add_circle_filled(draw.vec2(slot_119_33_0, slot_119_18_0 + slot_119_27_0 / 2), slot_119_34_0, slot_119_31_0)
                                slot_0_58_0(arg_119_0, theme.fonts.item, slot_119_13_0 + 28 + slot_119_32_0, slot_119_18_0 + 11, slot_0_63_0(iter_119_5.label_key), slot_119_30_0)
                        end

                        slot_119_18_0 = slot_119_18_0 + slot_119_27_0
                end
        end

        arg_119_0:override_clip_rect(nil)
        G.ui_funcs.draw_sidebar_footer(arg_119_0, arg_119_1, arg_119_2, arg_119_3, arg_119_4, arg_119_5, arg_119_6, arg_119_8)
end

function G.ui_funcs.handle_nav_click(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
        G.sidebar_scroll_y = G.sidebar_scroll_y or 0

        local var_120_0 = slot_0_77_0 + 80
        local var_120_1 = slot_0_79_0 - 80 - 70
        local var_120_2 = arg_120_3 + 25
        local var_120_3 = slot_0_80_0 - 50

        if not slot_0_57_0(var_120_2, var_120_0, var_120_3, var_120_1, arg_120_0, arg_120_1) then
                return
        end

        local var_120_4 = var_120_0 - G.sidebar_scroll_y

        for iter_120_0, iter_120_1 in ipairs(slot_0_82_0) do
                local var_120_5 = true

                if iter_120_1.parent then
                        for iter_120_2, iter_120_3 in ipairs(slot_0_82_0) do
                                if iter_120_3.id == iter_120_1.parent and not iter_120_3.is_open then
                                        var_120_5 = false

                                        break
                                end
                        end
                end

                if var_120_5 then
                        local var_120_6 = iter_120_1.is_category and 36 or 38

                        if slot_0_57_0(var_120_2, var_120_4, var_120_3, var_120_6, arg_120_0, arg_120_1) then
                                if iter_120_1.is_category then
                                        local var_120_7 = not iter_120_1.is_open

                                        iter_120_1.is_open = not iter_120_1.is_open

                                        if var_120_7 then
                                                for iter_120_4, iter_120_5 in ipairs(slot_0_82_0) do
                                                        if iter_120_5.parent == iter_120_1.id then
                                                                iter_120_5.slide_in_alpha = 0
                                                        end
                                                end
                                        end
                                else
                                        slot_0_83_0 = iter_120_1.id
                                end

                                if slot_0_86_0.enable_ui_sounds and game and game.engine and game.engine.client_cmd and slot_0_86_0.ui_tab_volume > 0.01 then
                                        game.engine:client_cmd("play buttons/button9")
                                end

                                break
                        end

                        var_120_4 = var_120_4 + var_120_6
                end
        end
end

function G.ui_funcs.draw_color_picker(arg_121_0, arg_121_1, arg_121_2, arg_121_3, arg_121_4, arg_121_5, arg_121_6, arg_121_7, arg_121_8)
        arg_121_0:add_shadow_rect(draw.rect(arg_121_1, arg_121_2, arg_121_1 + arg_121_3, arg_121_2 + arg_121_4), 15, true, 0.4 * arg_121_7)
        arg_121_0:add_rect_filled_rounded(draw.rect(arg_121_1, arg_121_2, arg_121_1 + arg_121_3, arg_121_2 + arg_121_4), theme.colors.bg_sidebar:mod_a(arg_121_7 * 0.98), 6)
        arg_121_0:add_rect_rounded(draw.rect(arg_121_1, arg_121_2, arg_121_1 + arg_121_3, arg_121_2 + arg_121_4), theme.colors.border_inner:mod_a(arg_121_7), 6)

        slot_121_9_2 = arg_121_2 + 15
        slot_121_10_0 = arg_121_3 - 30
        slot_121_11_0 = 20

        if color_picker_target == "menu" or color_picker_target and color_picker_target:match("^menu_") then
                slot_121_12_5 = color_picker_target == "menu" and "accent" or color_picker_target:gsub("^menu_", "")

                if slot_121_12_5 == "accent" then
                        slot_0_86_0.accent_hue = slot_0_122_0(arg_121_0, "picker_hue_menu", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_0_86_0.accent_hue, arg_121_8)
                        slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                        slot_121_13_6 = slot_0_56_0(slot_0_86_0.accent_hue, 1, slot_0_86_0.accent_val)
                        slot_0_86_0.accent_sat = slot_0_123_0(arg_121_0, "picker_sat_menu", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_0_86_0.accent_sat, draw.color(255, 255, 255), slot_121_13_6, arg_121_8)
                        slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                        slot_121_14_6 = slot_0_56_0(slot_0_86_0.accent_hue, slot_0_86_0.accent_sat, 1)
                        slot_0_86_0.accent_val = slot_0_123_0(arg_121_0, "picker_val_menu", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_0_86_0.accent_val, draw.color(0, 0, 0), slot_121_14_6, arg_121_8)
                else
                        slot_121_13_5 = slot_0_86_0.target_hsv[slot_121_12_5]

                        if not slot_121_13_5 then
                                return
                        end

                        slot_121_13_5.h = slot_0_122_0(arg_121_0, "picker_hue_menu_" .. slot_121_12_5, arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_13_5.h, arg_121_8)
                        slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                        slot_121_14_5 = slot_0_56_0(slot_121_13_5.h, 1, slot_121_13_5.v)
                        slot_121_13_5.s = slot_0_123_0(arg_121_0, "picker_sat_menu_" .. slot_121_12_5, arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_13_5.s, draw.color(255, 255, 255), slot_121_14_5, arg_121_8)
                        slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                        slot_121_15_2 = slot_0_56_0(slot_121_13_5.h, slot_121_13_5.s, 1)
                        slot_121_13_5.v = slot_0_123_0(arg_121_0, "picker_val_menu_" .. slot_121_12_5, arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_13_5.v, draw.color(0, 0, 0), slot_121_15_2, arg_121_8)
                end
        elseif color_picker_target and color_picker_target:match("^wm_") then
                slot_121_12_4 = color_picker_target:gsub("^wm_", "")
                slot_121_13_4 = slot_121_12_4 == "all"
                slot_121_14_4 = slot_121_13_4 and slot_0_87_0.wm_colors.tueurs or slot_0_87_0.wm_colors[slot_121_12_4]

                if not slot_121_14_4 then
                        return
                end

                slot_121_15_1 = slot_121_14_4.h
                slot_121_16_1 = slot_121_14_4.s
                slot_121_17_1 = slot_121_14_4.v
                slot_121_18_1 = slot_0_122_0(arg_121_0, "picker_hue_wm_" .. slot_121_12_4, arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_14_4.h, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_19_1 = slot_0_56_0(slot_121_18_1, 1, slot_121_14_4.v)
                slot_121_20_1 = slot_0_123_0(arg_121_0, "picker_sat_wm_" .. slot_121_12_4, arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_14_4.s, draw.color(255, 255, 255), slot_121_19_1, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_21_0 = slot_0_56_0(slot_121_18_1, slot_121_20_1, 1)
                slot_121_22_0 = slot_0_123_0(arg_121_0, "picker_val_wm_" .. slot_121_12_4, arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_14_4.v, draw.color(0, 0, 0), slot_121_21_0, arg_121_8)

                if slot_121_18_1 ~= slot_121_15_1 or slot_121_20_1 ~= slot_121_16_1 or slot_121_22_0 ~= slot_121_17_1 then
                        if slot_121_13_4 then
                                for iter_121_0, iter_121_1 in pairs(slot_0_87_0.wm_colors) do
                                        slot_0_87_0.wm_colors[iter_121_0] = {
                                                h = slot_121_18_1,
                                                s = slot_121_20_1,
                                                v = slot_121_22_0
                                        }
                                end
                        else
                                slot_121_14_4.h, slot_121_14_4.s, slot_121_14_4.v = slot_121_18_1, slot_121_20_1, slot_121_22_0
                        end
                end
        elseif color_picker_target == "hvh_shape_color" then
                slot_121_12_3 = hvh.shape_color_hsv
                slot_121_12_3.h = slot_0_122_0(arg_121_0, "picker_hue_hvh_shape", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_3.h, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_13_3 = slot_0_56_0(slot_121_12_3.h, 1, slot_121_12_3.v)
                slot_121_12_3.s = slot_0_123_0(arg_121_0, "picker_sat_hvh_shape", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_3.s, draw.color(255, 255, 255), slot_121_13_3, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_14_3 = slot_0_56_0(slot_121_12_3.h, slot_121_12_3.s, 1)
                slot_121_12_3.v = slot_0_123_0(arg_121_0, "picker_val_hvh_shape", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_3.v, draw.color(0, 0, 0), slot_121_14_3, arg_121_8)
        elseif color_picker_target == "hvh_line_color" then
                slot_121_12_2 = hvh.line_color_hsv
                slot_121_12_2.h = slot_0_122_0(arg_121_0, "picker_hue_hvh_line", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_2.h, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_13_2 = slot_0_56_0(slot_121_12_2.h, 1, slot_121_12_2.v)
                slot_121_12_2.s = slot_0_123_0(arg_121_0, "picker_sat_hvh_line", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_2.s, draw.color(255, 255, 255), slot_121_13_2, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_14_2 = slot_0_56_0(slot_121_12_2.h, slot_121_12_2.s, 1)
                slot_121_12_2.v = slot_0_123_0(arg_121_0, "picker_val_hvh_line", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_2.v, draw.color(0, 0, 0), slot_121_14_2, arg_121_8)
        elseif color_picker_target == "tracers_color" then
                slot_121_12_1 = G.tracers.color_hsv
                slot_121_12_1.h = slot_0_122_0(arg_121_0, "picker_hue_tracers", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_1.h, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_13_1 = slot_0_56_0(slot_121_12_1.h, 1, slot_121_12_1.v)
                slot_121_12_1.s = slot_0_123_0(arg_121_0, "picker_sat_tracers", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_1.s, draw.color(255, 255, 255), slot_121_13_1, arg_121_8)
                slot_121_9_2 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_14_1 = slot_0_56_0(slot_121_12_1.h, slot_121_12_1.s, 1)
                slot_121_12_1.v = slot_0_123_0(arg_121_0, "picker_val_tracers", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_1.v, draw.color(0, 0, 0), slot_121_14_1, arg_121_8)
        elseif color_picker_target == "kb_color" then
                slot_121_12_0 = slot_0_87_0.kb_color

                if not slot_121_12_0 then
                        return
                end

                slot_121_13_0 = slot_121_12_0.h
                slot_121_14_0 = slot_121_12_0.s
                slot_121_15_0 = slot_121_12_0.v
                slot_121_16_0 = slot_0_122_0(arg_121_0, "picker_hue_kb", arg_121_1 + 15, slot_121_9_2, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_0.h, arg_121_8)
                slot_121_9_1 = slot_121_9_2 + slot_121_11_0 + 15
                slot_121_17_0 = slot_0_56_0(slot_121_16_0, 1, slot_121_12_0.v)
                slot_121_18_0 = slot_0_123_0(arg_121_0, "picker_sat_kb", arg_121_1 + 15, slot_121_9_1, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_0.s, draw.color(255, 255, 255), slot_121_17_0, arg_121_8)
                slot_121_9_0 = slot_121_9_1 + slot_121_11_0 + 15
                slot_121_19_0 = slot_0_56_0(slot_121_16_0, slot_121_18_0, 1)
                slot_121_20_0 = slot_0_123_0(arg_121_0, "picker_val_kb", arg_121_1 + 15, slot_121_9_0, slot_121_10_0, slot_121_11_0, arg_121_5, arg_121_6, arg_121_7, slot_121_12_0.v, draw.color(0, 0, 0), slot_121_19_0, arg_121_8)

                if slot_121_16_0 ~= slot_121_13_0 or slot_121_18_0 ~= slot_121_14_0 or slot_121_20_0 ~= slot_121_15_0 then
                        slot_121_12_0.h, slot_121_12_0.s, slot_121_12_0.v = slot_121_16_0, slot_121_18_0, slot_121_20_0
                end
        end
end

function slot_0_139_0(arg_122_0, arg_122_1, arg_122_2, arg_122_3, arg_122_4)
        arg_122_3 = arg_122_3 or 1
        arg_122_4 = arg_122_4 or false

        for iter_122_0 = 1, #arg_122_1 do
                local var_122_0 = arg_122_1[iter_122_0]
                local var_122_1 = arg_122_1[iter_122_0 == #arg_122_1 and 1 or iter_122_0 + 1]

                if arg_122_4 then
                        arg_122_0:add_line(var_122_0, var_122_1, draw.color(255, 255, 255, 30), arg_122_3 + 6)
                        arg_122_0:add_line(var_122_0, var_122_1, draw.color(255, 255, 255, 60), arg_122_3 + 4)
                        arg_122_0:add_line(var_122_0, var_122_1, draw.color(255, 255, 255, 120), arg_122_3 + 2)
                else
                        arg_122_0:add_line(var_122_0, var_122_1, draw.color(0, 0, 0, 200), arg_122_3 + 2)
                end

                arg_122_0:add_line(var_122_0, var_122_1, arg_122_2, arg_122_3)
        end
end

function slot_0_140_0(arg_123_0, arg_123_1)
        local var_123_0 = math.pi
        local var_123_1 = {}
        local var_123_2 = arg_123_1 * 0.5

        for iter_123_0 = 0, 4 do
                local var_123_3 = iter_123_0 * 2 * var_123_0 / 5 - var_123_0 / 2
                local var_123_4 = var_123_3 + var_123_0 / 5

                var_123_1[#var_123_1 + 1] = draw.vec2(arg_123_0.x + arg_123_1 * math.cos(var_123_3), arg_123_0.y + arg_123_1 * math.sin(var_123_3))
                var_123_1[#var_123_1 + 1] = draw.vec2(arg_123_0.x + var_123_2 * math.cos(var_123_4), arg_123_0.y + var_123_2 * math.sin(var_123_4))
        end

        return var_123_1
end

function slot_0_141_0(arg_124_0, arg_124_1, arg_124_2)
        local var_124_0 = arg_124_2 or 32
        local var_124_1 = {}

        for iter_124_0 = 0, var_124_0 - 1 do
                local var_124_2 = iter_124_0 / var_124_0 * (2 * math.pi)

                var_124_1[#var_124_1 + 1] = draw.vec2(arg_124_0.x + arg_124_1 * math.cos(var_124_2), arg_124_0.y + arg_124_1 * math.sin(var_124_2))
        end

        return var_124_1
end

function slot_0_142_0(arg_125_0, arg_125_1)
        return {
                draw.vec2(arg_125_0.x - arg_125_1, arg_125_0.y - arg_125_1),
                draw.vec2(arg_125_0.x + arg_125_1, arg_125_0.y - arg_125_1),
                draw.vec2(arg_125_0.x + arg_125_1, arg_125_0.y + arg_125_1),
                draw.vec2(arg_125_0.x - arg_125_1, arg_125_0.y + arg_125_1)
        }
end

function slot_0_143_0(arg_126_0, arg_126_1)
        local var_126_0 = {}

        var_126_0[#var_126_0 + 1] = draw.vec2(arg_126_0.x, arg_126_0.y - arg_126_1)
        var_126_0[#var_126_0 + 1] = draw.vec2(arg_126_0.x - arg_126_1, arg_126_0.y + arg_126_1)
        var_126_0[#var_126_0 + 1] = draw.vec2(arg_126_0.x + arg_126_1, arg_126_0.y + arg_126_1)

        return var_126_0
end

function slot_0_144_0(arg_127_0, arg_127_1, arg_127_2)
        arg_127_2 = arg_127_2 or 0

        local var_127_0 = {}

        for iter_127_0 = 0, 3 do
                local var_127_1 = iter_127_0 * math.pi / 2 + arg_127_2

                var_127_0[#var_127_0 + 1] = draw.vec2(arg_127_0.x + arg_127_1 * math.cos(var_127_1), arg_127_0.y + arg_127_1 * math.sin(var_127_1))
        end

        return var_127_0
end

function slot_0_145_0(arg_128_0, arg_128_1, arg_128_2)
        arg_128_2 = arg_128_2 or 0

        local var_128_0 = {}

        for iter_128_0 = 0, 5 do
                local var_128_1 = iter_128_0 * math.pi / 3 + arg_128_2

                var_128_0[#var_128_0 + 1] = draw.vec2(arg_128_0.x + arg_128_1 * math.cos(var_128_1), arg_128_0.y + arg_128_1 * math.sin(var_128_1))
        end

        return var_128_0
end

function slot_0_146_0(arg_129_0, arg_129_1, arg_129_2, arg_129_3, arg_129_4)
        local var_129_0 = math.pi
        local var_129_1 = {}
        local var_129_2 = 1 + math.sin(arg_129_2 * arg_129_3 * 3) * 0.3 * arg_129_4
        local var_129_3 = arg_129_2 * arg_129_3 * 0.5
        local var_129_4 = arg_129_1 * 0.5 * var_129_2

        arg_129_1 = arg_129_1 * var_129_2

        for iter_129_0 = 0, 4 do
                local var_129_5 = iter_129_0 * 2 * var_129_0 / 5 - var_129_0 / 2 + var_129_3
                local var_129_6 = var_129_5 + var_129_0 / 5

                var_129_1[#var_129_1 + 1] = draw.vec2(arg_129_0.x + arg_129_1 * math.cos(var_129_5), arg_129_0.y + arg_129_1 * math.sin(var_129_5))
                var_129_1[#var_129_1 + 1] = draw.vec2(arg_129_0.x + var_129_4 * math.cos(var_129_6), arg_129_0.y + var_129_4 * math.sin(var_129_6))
        end

        return var_129_1
end

function slot_0_147_0(arg_130_0, arg_130_1, arg_130_2, arg_130_3)
        local var_130_0 = {}
        local var_130_1 = 3
        local var_130_2 = 32

        for iter_130_0 = 0, var_130_2 - 1 do
                local var_130_3 = iter_130_0 / var_130_2 * var_130_1 * 2 * math.pi + arg_130_2 * arg_130_3
                local var_130_4 = arg_130_1 * (1 - iter_130_0 / var_130_2 * 0.7)

                var_130_0[#var_130_0 + 1] = draw.vec2(arg_130_0.x + var_130_4 * math.cos(var_130_3), arg_130_0.y + var_130_4 * math.sin(var_130_3))
        end

        return var_130_0
end

function slot_0_148_0(arg_131_0, arg_131_1, arg_131_2, arg_131_3, arg_131_4, arg_131_5, arg_131_6)
        if not arg_131_5 then
                return
        end

        arg_131_6 = arg_131_6 or 1

        local var_131_0 = 32
        local var_131_1 = 4
        local var_131_2 = 0.8
        local var_131_3 = {
                r = 100,
                g = 100,
                b = 255
        }

        if arg_131_5 == "enemy" then
                var_131_3 = {
                        r = 255,
                        g = 80,
                        b = 80
                }
        elseif arg_131_5 == "local" then
                var_131_3 = {
                        r = 80,
                        g = 255,
                        b = 80
                }
        end

        for iter_131_0 = 1, var_131_1 do
                local var_131_4 = (arg_131_3 * arg_131_4 * 2 - iter_131_0 * var_131_2) % (var_131_1 * var_131_2) / (var_131_1 * var_131_2)

                if var_131_4 >= 0 and var_131_4 <= 1 then
                        local var_131_5 = arg_131_2 + var_131_4 * 60
                        local var_131_6 = math.floor(180 * (1 - var_131_4) * (1 - var_131_4) * arg_131_6)

                        if var_131_6 > 5 then
                                local var_131_7 = draw.color(var_131_3.r, var_131_3.g, var_131_3.b, var_131_6)
                                local var_131_8 = slot_0_141_0(arg_131_1, var_131_5, var_131_0)

                                for iter_131_1 = 1, #var_131_8 do
                                        local var_131_9 = var_131_8[iter_131_1]
                                        local var_131_10 = var_131_8[iter_131_1 == #var_131_8 and 1 or iter_131_1 + 1]

                                        arg_131_0:add_line(var_131_9, var_131_10, var_131_7, 2)
                                end

                                if var_131_4 < 0.1 then
                                        local var_131_11 = math.floor(255 * (0.1 - var_131_4) * 10 * arg_131_6)
                                        local var_131_12 = draw.color(var_131_3.r, var_131_3.g, var_131_3.b, var_131_11)

                                        arg_131_0:add_circle_filled(arg_131_1, arg_131_2 * 0.3, var_131_12)
                                end
                        end
                end
        end
end

function slot_0_149_0(arg_132_0)
        local var_132_0 = entities.get_local_pawn()

        if var_132_0 and var_132_0:is_alive() and var_132_0:get_abs_origin():dist(arg_132_0) < 50 then
                return "local"
        end

        local var_132_1 = false

        entities.players:for_each(function(arg_133_0)
                if not var_132_1 and arg_133_0.entity and arg_133_0.entity:is_alive() and arg_133_0.entity:is_enemy() and arg_133_0.entity:get_abs_origin():dist(arg_132_0) < 50 then
                        var_132_1 = true
                end
        end)

        if var_132_1 then
                return "enemy"
        end

        return nil
end

function slot_0_150_0()
        local var_134_0 = ffi.new("char[?]", 520)

        slot_0_34_0(nil, var_134_0, 520)

        return (ffi.string(var_134_0):gsub("[^\\/]+$", ""):gsub("[^\\/]+[\\/]$", ""):gsub("[^\\/]+[\\/]$", "") .. "csgo\\fatality\\scripts\\") .. "waypoints.txt"
end

function slot_0_151_0(arg_135_0)
        local var_135_0 = slot_0_104_0(arg_135_0)

        if not var_135_0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Waypoints", "Não foi possível ler " .. tostring(arg_135_0)))
                end

                return
        end

        hvh.waypoints = {}

        local var_135_1 = 0

        for iter_135_0 in var_135_0:gmatch("([^\r\n]+)") do
                local var_135_2 = {}

                for iter_135_1 in iter_135_0:gmatch("[^;]+") do
                        local var_135_3, var_135_4 = iter_135_1:match("([^=]+)=([^=]+)")

                        if var_135_3 and var_135_4 then
                                var_135_2[var_135_3:gsub("^%s*(.-)%s*$", "%1")] = var_135_4:gsub("^%s*(.-)%s*$", "%1")
                        end
                end

                if var_135_2.x and var_135_2.y and var_135_2.z and var_135_2.map then
                        table.insert(hvh.waypoints, {
                                name = var_135_2.name or "",
                                map = var_135_2.map,
                                pos = vector(tonumber(var_135_2.x), tonumber(var_135_2.y), tonumber(var_135_2.z)),
                                min_damage = {
                                        ssg08 = var_135_2.ssg08 and tonumber(var_135_2.ssg08) or nil,
                                        scout = var_135_2.scout and tonumber(var_135_2.scout) or nil,
                                        teco = var_135_2.teco and tonumber(var_135_2.teco) or nil,
                                        awp = var_135_2.awp and tonumber(var_135_2.awp) or nil,
                                        r8 = var_135_2.r8 and tonumber(var_135_2.r8) or nil,
                                        deagle = var_135_2.deagle and tonumber(var_135_2.deagle) or nil
                                }
                        })

                        var_135_1 = var_135_1 + 1
                end
        end

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Waypoints", string.format("? %d waypoints carregados com sucesso!", var_135_1)))
        end

        if game and game.engine and game.engine.client_cmd then
                game.engine:client_cmd("play buttons/blip1")
        end
end

function slot_0_152_0(arg_136_0, arg_136_1, arg_136_2, arg_136_3)
        local var_136_0 = game.global_vars.map_name or "unknown"
        local var_136_1 = string.format
        local var_136_2 = var_136_1("map=%s;name=%s;x=%.2f;y=%.2f;z=%.2f;ssg08=12;scout=12;teco=7;awp=20;r8=7;deagle=2;\r\n", var_136_0, arg_136_1 or "", arg_136_2.x, arg_136_2.y, arg_136_2.z)
        local var_136_3 = var_136_1("map=%s;name=%s;x=%.2f;y=%.2f;z=%.2f;ssg08=12;scout=12;teco=7;awp=20;r8=7;deagle=2;\r\n", var_136_0, arg_136_1 or "", arg_136_3.x, arg_136_3.y, arg_136_3.z)

        slot_0_105_0(arg_136_0, var_136_2 .. var_136_3, true)

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Waypoints", "Par adicionado: " .. (arg_136_1 or "(sem nome)")))
        end
end

function slot_0_153_0(arg_137_0)
        if arg_137_0 % 2 == 1 then
                return arg_137_0 + 1
        else
                return arg_137_0 - 1
        end
end

function slot_0_154_0(arg_138_0, arg_138_1)
        local var_138_0 = {}
        local var_138_1 = game.global_vars.map_name

        for iter_138_0, iter_138_1 in ipairs(hvh.waypoints) do
                if iter_138_1.map == var_138_1 and iter_138_1.pos and arg_138_0:dist(iter_138_1.pos) < (arg_138_1 or 50) then
                        table.insert(var_138_0, {
                                index = iter_138_0,
                                waypoint = iter_138_1
                        })
                end
        end

        return var_138_0
end

function slot_0_155_0(arg_139_0)
        local var_139_0 = ""

        for iter_139_0, iter_139_1 in ipairs(hvh.waypoints) do
                local var_139_1 = iter_139_1.min_damage or {}

                var_139_0 = var_139_0 .. string.format("map=%s;name=%s;x=%.2f;y=%.2f;z=%.2f;ssg08=%s;scout=%s;teco=%s;awp=%s;r8=%s;deagle=%s;\r\n", iter_139_1.map, iter_139_1.name or "", iter_139_1.pos.x, iter_139_1.pos.y, iter_139_1.pos.z, var_139_1.ssg08 or "12", var_139_1.scout or "12", var_139_1.teco or "7", var_139_1.awp or "20", var_139_1.r8 or "7", var_139_1.deagle or "2")
        end

        slot_0_105_0(arg_139_0, var_139_0, false)
end

function slot_0_156_0(arg_140_0)
        local var_140_0 = slot_0_153_0(arg_140_0)
        local var_140_1 = hvh.waypoints[arg_140_0]
        local var_140_2 = hvh.waypoints[var_140_0]

        if var_140_1 and var_140_2 then
                if var_140_0 < arg_140_0 then
                        table.remove(hvh.waypoints, arg_140_0)
                        table.remove(hvh.waypoints, var_140_0)
                else
                        table.remove(hvh.waypoints, var_140_0)
                        table.remove(hvh.waypoints, arg_140_0)
                end

                slot_0_155_0(hvh.txt_path or slot_0_150_0())

                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Waypoints", "Par deletado: " .. (var_140_1.name or "sem nome")))
                end

                return true
        end

        return false
end

function slot_0_157_0(arg_141_0, arg_141_1, arg_141_2, arg_141_3, arg_141_4, arg_141_5, arg_141_6)
        if arg_141_5 then
                local var_141_0 = arg_141_4:mod_a(90)

                if arg_141_1 == "Circle" then
                        arg_141_0:add_circle_filled(arg_141_2, arg_141_3 - 2, var_141_0, 24)
                elseif arg_141_1 == "Square" then
                        local var_141_1 = arg_141_3 - 1

                        arg_141_0:add_rect_filled(draw.rect(arg_141_2.x - var_141_1, arg_141_2.y - var_141_1, arg_141_2.x + var_141_1, arg_141_2.y + var_141_1), var_141_0)
                elseif arg_141_1 == "Triangle" then
                        local var_141_2 = slot_0_143_0(arg_141_2, arg_141_3 - 1)

                        arg_141_0:add_triangle_filled(var_141_2[1], var_141_2[2], var_141_2[3], var_141_0)
                elseif arg_141_1 == "Star" then
                        local var_141_3 = slot_0_140_0(arg_141_2, arg_141_3 - 2)

                        for iter_141_0 = 1, #var_141_3 - 2, 2 do
                                arg_141_0:add_triangle_filled(arg_141_2, var_141_3[iter_141_0], var_141_3[iter_141_0 + 1], var_141_0)
                        end
                end
        end

        local var_141_4 = arg_141_6 or arg_141_4

        if arg_141_1 == "Circle" then
                arg_141_0:add_circle(arg_141_2, arg_141_3, var_141_4, 24, 1.2)
        elseif arg_141_1 == "Square" then
                slot_0_139_0(arg_141_0, slot_0_142_0(arg_141_2, arg_141_3), var_141_4)
        elseif arg_141_1 == "Triangle" then
                slot_0_139_0(arg_141_0, slot_0_143_0(arg_141_2, arg_141_3), var_141_4)
        elseif arg_141_1 == "Star" then
                slot_0_139_0(arg_141_0, slot_0_140_0(arg_141_2, arg_141_3), var_141_4)
        end
end

function slot_0_158_0()
        slot_142_0_0 = entities.get_local_pawn()

        if not slot_142_0_0 or not slot_142_0_0:is_alive() or not hvh.wp_enable then
                return
        end

        slot_142_1_0 = draw.surface
        slot_142_2_0 = game.global_vars.map_name
        slot_142_3_0 = slot_142_0_0:get_abs_origin()
        slot_142_4_0 = game.global_vars.real_time
        slot_142_5_0 = hvh.anim_speed
        slot_142_6_0 = hvh.anim_intensity
        slot_142_7_0 = slot_0_56_0(hvh.line_color_hsv.h, hvh.line_color_hsv.s, hvh.line_color_hsv.v)
        slot_142_8_0 = {}

        for iter_142_0, iter_142_1 in ipairs(hvh.waypoints) do
                if iter_142_1.map == slot_142_2_0 and iter_142_1.pos and slot_142_3_0:dist(iter_142_1.pos) < 50 then
                        table.insert(slot_142_8_0, iter_142_0)
                end
        end

        slot_142_9_0 = {}

        for iter_142_2, iter_142_3 in ipairs(hvh.waypoints) do
                if iter_142_3.map == slot_142_2_0 and iter_142_3.pos and slot_0_149_0(iter_142_3.pos) == "enemy" then
                        table.insert(slot_142_9_0, iter_142_2)
                end
        end

        for iter_142_4, iter_142_5 in ipairs(hvh.waypoints) do
                if iter_142_5.map == slot_142_2_0 and iter_142_5.pos then
                        slot_142_15_2 = math.world_to_screen(iter_142_5.pos)

                        if slot_142_15_2 then
                                slot_142_16_2 = slot_0_149_0(iter_142_5.pos)
                                slot_142_17_2 = slot_0_56_0(hvh.shape_color_hsv.h, hvh.shape_color_hsv.s, hvh.shape_color_hsv.v)
                                slot_142_18_2 = false
                                slot_142_19_2 = slot_142_3_0:dist(iter_142_5.pos)

                                if slot_142_16_2 == "enemy" then
                                        slot_142_17_2 = draw.color(255, 100, 100)
                                        slot_142_18_2 = true
                                elseif slot_142_16_2 == "local" then
                                        slot_142_17_2 = draw.color(128, 0, 128)
                                        slot_142_18_2 = true
                                elseif slot_142_19_2 <= hvh.dist then
                                        slot_142_18_2 = true
                                end

                                for iter_142_6, iter_142_7 in ipairs(slot_142_8_0) do
                                        if iter_142_4 == slot_0_153_0(iter_142_7) then
                                                slot_142_18_2 = true
                                        end
                                end

                                for iter_142_8, iter_142_9 in ipairs(slot_142_9_0) do
                                        if iter_142_4 == slot_0_153_0(iter_142_9) then
                                                slot_142_18_2 = true
                                                slot_142_17_2 = draw.color(255, 200, 100)
                                        end
                                end

                                if hvh.show_opposite_out_of_range and #slot_142_8_0 > 0 then
                                        for iter_142_10, iter_142_11 in ipairs(slot_142_8_0) do
                                                if iter_142_4 == slot_0_153_0(iter_142_11) then
                                                        slot_142_18_2 = true
                                                end
                                        end
                                end

                                if slot_142_18_2 then
                                        slot_142_20_1 = hvh.animations.pulse and 1 + math.sin(slot_142_4_0 * slot_142_5_0 * 4) * 0.3 * slot_142_6_0 or 1
                                        slot_142_21_1 = hvh.animations.rotate and slot_142_4_0 * slot_142_5_0 or 0
                                        slot_142_22_1 = hvh.animations.scale and 1 + math.sin(slot_142_4_0 * slot_142_5_0 * 2) * 0.2 * slot_142_6_0 or 1
                                        slot_142_23_0 = slot_142_17_2

                                        if hvh.animations.pulse then
                                                slot_142_24_2 = math.floor(255 * (0.7 + 0.3 * math.sin(slot_142_4_0 * slot_142_5_0 * 3)))

                                                if slot_142_16_2 == "enemy" then
                                                        slot_142_23_0 = draw.color(255, 100, 100, slot_142_24_2)
                                                elseif slot_142_16_2 == "local" then
                                                        slot_142_23_0 = draw.color(128, 0, 128, slot_142_24_2)
                                                else
                                                        slot_142_23_0 = draw.color(100, 100, 255, slot_142_24_2)
                                                end
                                        end

                                        if hvh.animations.wave then
                                                slot_142_24_1 = iter_142_5.map .. "_" .. iter_142_4

                                                if slot_142_16_2 then
                                                        hvh._wave_history[slot_142_24_1] = {
                                                                type = slot_142_16_2,
                                                                start_time = slot_142_4_0,
                                                                last_seen = slot_142_4_0
                                                        }
                                                elseif hvh._wave_history[slot_142_24_1] and slot_142_4_0 - hvh._wave_history[slot_142_24_1].last_seen > 1 then
                                                        hvh._wave_history[slot_142_24_1] = nil
                                                end

                                                if hvh._wave_history[slot_142_24_1] then
                                                        slot_142_25_1 = 1

                                                        if slot_142_16_2 then
                                                                hvh._wave_history[slot_142_24_1].last_seen = slot_142_4_0
                                                        else
                                                                slot_142_26_2 = slot_142_4_0 - hvh._wave_history[slot_142_24_1].last_seen
                                                                slot_142_25_1 = math.max(0, 1 - slot_142_26_2 / 1)
                                                        end

                                                        slot_0_148_0(slot_142_1_0, slot_142_15_2, 15 * slot_142_22_1, slot_142_4_0, slot_142_5_0, hvh._wave_history[slot_142_24_1].type, slot_142_25_1)
                                                end
                                        end

                                        slot_142_24_0 = 12 * slot_142_20_1 * slot_142_22_1
                                        slot_142_25_0 = hvh.animations.glow

                                        if hvh.fill_on_top then
                                                slot_142_26_1 = slot_142_16_2 == "local"
                                        end

                                        if hvh.shapes.Star then
                                                slot_142_27_8 = hvh.animations.rotate and slot_0_146_0(slot_142_15_2, slot_142_24_0, slot_142_4_0, slot_142_5_0, slot_142_6_0) or slot_0_140_0(slot_142_15_2, slot_142_24_0)

                                                slot_0_139_0(slot_142_1_0, slot_142_27_8, slot_142_23_0, 2, slot_142_25_0)
                                        end

                                        if hvh.shapes.Circle then
                                                slot_142_27_7 = slot_0_141_0(slot_142_15_2, slot_142_24_0 * 0.8, 20)

                                                slot_0_139_0(slot_142_1_0, slot_142_27_7, slot_142_23_0, 2, slot_142_25_0)
                                        end

                                        if hvh.shapes.Square then
                                                slot_142_27_6 = slot_0_142_0(slot_142_15_2, slot_142_24_0)

                                                slot_0_139_0(slot_142_1_0, slot_142_27_6, slot_142_23_0, 2, slot_142_25_0)
                                        end

                                        if hvh.shapes.Triangle then
                                                slot_142_27_5 = slot_0_143_0(slot_142_15_2, slot_142_24_0)

                                                slot_0_139_0(slot_142_1_0, slot_142_27_5, slot_142_23_0, 2, slot_142_25_0)
                                        end

                                        if hvh.shapes.Diamond then
                                                slot_142_27_4 = slot_0_144_0(slot_142_15_2, slot_142_24_0, slot_142_21_1)

                                                slot_0_139_0(slot_142_1_0, slot_142_27_4, slot_142_23_0, 2, slot_142_25_0)
                                        end

                                        if hvh.shapes.Hexagon then
                                                slot_142_27_3 = slot_0_145_0(slot_142_15_2, slot_142_24_0, slot_142_21_1)

                                                slot_0_139_0(slot_142_1_0, slot_142_27_3, slot_142_23_0, 2, slot_142_25_0)
                                        end

                                        if hvh.animations.spiral then
                                                slot_142_27_2 = slot_0_147_0(slot_142_15_2, slot_142_24_0 * 1.5, slot_142_4_0, slot_142_5_0)

                                                for iter_142_12 = 1, #slot_142_27_2 - 1 do
                                                        slot_142_32_0 = math.floor(255 * (1 - iter_142_12 / #slot_142_27_2))
                                                        slot_142_33_0 = draw.color(200, 150, 255, slot_142_32_0)

                                                        slot_142_1_0:add_line(slot_142_27_2[iter_142_12], slot_142_27_2[iter_142_12 + 1], slot_142_33_0, 2)
                                                end
                                        end

                                        if slot_142_19_2 <= hvh.dist then
                                                slot_142_27_1 = string.format("%.0fm", slot_142_19_2 / 16)
                                                slot_142_28_1 = draw.vec2(slot_142_15_2.x - 15, slot_142_15_2.y + slot_142_24_0 + 8)

                                                slot_0_58_0(slot_142_1_0, theme.fonts.small, slot_142_28_1.x, slot_142_28_1.y, slot_142_27_1, draw.color(255, 255, 255, 180))
                                        end

                                        if iter_142_5.name and iter_142_5.name ~= "" then
                                                slot_0_58_0(slot_142_1_0, theme.fonts.small, slot_142_15_2.x + 12, slot_142_15_2.y - 6, iter_142_5.name, theme.colors.text_light)
                                        end
                                end
                        end
                end
        end

        if hvh.link_lines and #slot_142_8_0 > 0 then
                for iter_142_13, iter_142_14 in ipairs(slot_142_8_0) do
                        slot_142_15_1 = slot_0_153_0(iter_142_14)
                        slot_142_16_1 = hvh.waypoints[iter_142_14]
                        slot_142_17_1 = hvh.waypoints[slot_142_15_1]

                        if slot_142_16_1 and slot_142_17_1 and slot_142_16_1.map == slot_142_2_0 and slot_142_17_1.map == slot_142_2_0 then
                                slot_142_18_1 = math.world_to_screen(slot_142_16_1.pos)
                                slot_142_19_1 = math.world_to_screen(slot_142_17_1.pos)

                                if slot_142_18_1 and slot_142_19_1 then
                                        slot_142_20_0 = hvh.animations.pulse and math.floor(255 * (0.5 + 0.3 * math.sin(slot_142_4_0 * slot_142_5_0 * 2))) or 255
                                        slot_142_21_0 = draw.color(255, 255, 255, slot_142_20_0)

                                        slot_142_1_0:add_line(slot_142_18_1, slot_142_19_1, draw.color(0, 0, 0, 200), 3)
                                        slot_142_1_0:add_line(slot_142_18_1, slot_142_19_1, slot_142_21_0, 2)

                                        if hvh.animations.glow then
                                                slot_142_22_0 = 5

                                                for iter_142_15 = 1, slot_142_22_0 do
                                                        slot_142_27_0 = iter_142_15 / slot_142_22_0 + slot_142_4_0 * slot_142_5_0 * 0.1 % 1
                                                        slot_142_28_0 = draw.vec2(slot_142_18_1.x + (slot_142_19_1.x - slot_142_18_1.x) * slot_142_27_0, slot_142_18_1.y + (slot_142_19_1.y - slot_142_18_1.y) * slot_142_27_0)
                                                        slot_142_29_0 = draw.color(255, 255, 100, 150)

                                                        slot_142_1_0:add_circle_filled(slot_142_28_0, 2, slot_142_29_0)
                                                end
                                        end
                                end
                        end
                end
        end

        if hvh.link_lines then
                for iter_142_16, iter_142_17 in ipairs(slot_142_9_0) do
                        slot_142_15_0 = slot_0_153_0(iter_142_17)
                        slot_142_16_0 = hvh.waypoints[iter_142_17]
                        slot_142_17_0 = hvh.waypoints[slot_142_15_0]

                        if slot_142_16_0 and slot_142_17_0 and slot_142_16_0.map == slot_142_2_0 and slot_142_17_0.map == slot_142_2_0 then
                                slot_142_18_0 = math.world_to_screen(slot_142_16_0.pos)
                                slot_142_19_0 = math.world_to_screen(slot_142_17_0.pos)

                                if slot_142_18_0 and slot_142_19_0 then
                                        slot_142_1_0:add_line(slot_142_18_0, slot_142_19_0, draw.color(0, 0, 0, 200), 3)
                                        slot_142_1_0:add_line(slot_142_18_0, slot_142_19_0, draw.color(255, 100, 100), 1)
                                end
                        end
                end
        end
end

function slot_0_159_0()
        if not hvh.velocity_enable then
                return
        end

        slot_143_0_0 = entities.get_local_pawn()

        if not slot_143_0_0 or not slot_143_0_0:is_alive() then
                return
        end

        slot_143_1_0 = draw.surface
        slot_143_3_0 = slot_143_0_0:get_abs_velocity():length_2d()

        if hvh.velocity_style == 3 then
                table.insert(hvh.velocity_history, slot_143_3_0)

                if #hvh.velocity_history > hvh.velocity_max_history then
                        table.remove(hvh.velocity_history, 1)
                end
        end

        if slot_143_3_0 > 5 then
                slot_143_4_1 = game.global_vars.frame_time
                hvh.velocity_total_distance = hvh.velocity_total_distance + slot_143_3_0 * slot_143_4_1
                hvh.velocity_avg_samples = hvh.velocity_avg_samples + 1
                hvh.velocity_avg_speed = hvh.velocity_avg_speed + (slot_143_3_0 - hvh.velocity_avg_speed) / hvh.velocity_avg_samples
        end

        slot_143_4_0, slot_143_5_0 = game.engine:get_screen_size()
        slot_143_6_0 = slot_143_4_0 * (hvh.velocity_position_x / 100)
        slot_143_7_0 = slot_143_5_0 * (hvh.velocity_position_y / 100)
        slot_143_8_0 = key_down and key_down(slot_0_49_0) or bit.band(slot_0_32_0(16) or 0, 32768) ~= 0
        slot_143_9_0 = slot_0_65_0.x
        slot_143_10_0 = slot_0_65_0.y
        slot_143_11_0 = 200
        slot_143_12_0 = 20

        if hvh.velocity_style == 2 then
                slot_143_11_0, slot_143_12_0 = 80, 80
        elseif hvh.velocity_style == 3 then
                slot_143_11_0, slot_143_12_0 = 250, 80
        elseif hvh.velocity_style == 4 then
                slot_143_11_0, slot_143_12_0 = 150, 60
        elseif hvh.velocity_style == 5 then
                slot_143_11_0, slot_143_12_0 = 280, 60
        elseif hvh.velocity_style == 6 then
                slot_143_11_0, slot_143_12_0 = 170, 170
        elseif hvh.velocity_style == 7 then
                slot_143_11_0, slot_143_12_0 = 140, 140
        elseif hvh.velocity_style == 8 then
                slot_143_11_0, slot_143_12_0 = 120, 120
        elseif hvh.velocity_style == 9 then
                slot_143_11_0, slot_143_12_0 = 220, 80
        end

        slot_143_13_0 = slot_143_6_0 <= slot_143_9_0 and slot_143_9_0 <= slot_143_6_0 + slot_143_11_0 and slot_143_7_0 <= slot_143_10_0 and slot_143_10_0 <= slot_143_7_0 + slot_143_12_0

        if slot_143_8_0 and slot_0_65_0.pressed and slot_143_13_0 and not hvh.velocity_dragging then
                hvh.velocity_dragging = true
                hvh.velocity_drag_offset_x = slot_143_9_0 - slot_143_6_0
                hvh.velocity_drag_offset_y = slot_143_10_0 - slot_143_7_0
        end

        if slot_0_65_0.released then
                hvh.velocity_dragging = false
        end

        if hvh.velocity_dragging then
                slot_143_6_0 = slot_143_9_0 - hvh.velocity_drag_offset_x
                slot_143_7_0 = slot_143_10_0 - hvh.velocity_drag_offset_y
                hvh.velocity_position_x = math.max(0, math.min(100, slot_143_6_0 / slot_143_4_0 * 100))
                hvh.velocity_position_y = math.max(0, math.min(100, slot_143_7_0 / slot_143_5_0 * 100))
                slot_143_6_0 = slot_143_4_0 * (hvh.velocity_position_x / 100)
                slot_143_7_0 = slot_143_5_0 * (hvh.velocity_position_y / 100)
        end

        slot_143_14_0 = 350
        slot_143_15_0 = math.min(slot_143_3_0 / slot_143_14_0, 1)
        slot_143_16_0 = game.global_vars.real_time

        if slot_143_3_0 > hvh.velocity_peak_speed then
                hvh.velocity_peak_speed = slot_143_3_0
                hvh.velocity_peak_time = slot_143_16_0
        end

        if slot_143_3_0 < 5 and hvh.velocity_peak_time and slot_143_16_0 - hvh.velocity_peak_time > 10 then
                hvh.velocity_peak_speed = 0
        end

        slot_143_17_0 = nil

        if hvh.velocity_color_mode == 1 then
                if slot_143_3_0 < 100 then
                        slot_143_17_0 = draw.color(50, 255, 50)
                elseif slot_143_3_0 < 200 then
                        slot_143_17_0 = draw.color(255, 200, 50)
                else
                        slot_143_17_0 = draw.color(255, 50, 50)
                end
        elseif hvh.velocity_color_mode == 2 then
                slot_143_17_0 = draw.color(100, 150, 255)
        else
                slot_143_19_10 = game.global_vars.real_time * 100 % 360
                slot_143_17_0 = slot_0_56_0(slot_143_19_10, 0.8, 1)
        end

        if hvh.velocity_style == 1 then
                slot_143_18_9 = 200
                slot_143_19_9 = 20
                slot_143_20_8 = slot_143_18_9 * slot_143_15_0

                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_9, slot_143_7_0 + slot_143_19_9), draw.color(20, 20, 25, 200))
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_9, slot_143_7_0 + slot_143_19_9), draw.color(100, 100, 100, 255), 1)
                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0 + 2, slot_143_7_0 + 2, slot_143_6_0 + slot_143_20_8 - 2, slot_143_7_0 + slot_143_19_9 - 2), slot_143_17_0)

                for iter_143_0 = 1, 4 do
                        slot_143_25_14 = slot_143_6_0 + slot_143_18_9 * (iter_143_0 / 5)

                        slot_143_1_0:add_line(draw.vec2(slot_143_25_14, slot_143_7_0), draw.vec2(slot_143_25_14, slot_143_7_0 + slot_143_19_9), draw.color(60, 60, 60, 150), 1)
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_21_7 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0 + slot_143_18_9 - 55, slot_143_7_0 + 24, slot_143_21_7, draw.color(255, 150, 50, 200))
                end
        elseif hvh.velocity_style == 2 then
                slot_143_18_8 = 40
                slot_143_19_8 = 8
                slot_143_20_7 = 60
                slot_143_21_6 = math.floor(slot_143_20_7 * slot_143_15_0)

                for iter_143_1 = 0, slot_143_20_7 - 1 do
                        slot_143_26_13 = iter_143_1 / slot_143_20_7 * math.pi * 2 - math.pi / 2
                        slot_143_27_13 = (iter_143_1 + 1) / slot_143_20_7 * math.pi * 2 - math.pi / 2
                        slot_143_28_10 = slot_143_6_0 + math.cos(slot_143_26_13) * slot_143_18_8
                        slot_143_29_10 = slot_143_7_0 + math.sin(slot_143_26_13) * slot_143_18_8
                        slot_143_30_8 = slot_143_6_0 + math.cos(slot_143_27_13) * slot_143_18_8
                        slot_143_31_8 = slot_143_7_0 + math.sin(slot_143_27_13) * slot_143_18_8
                        slot_143_32_8 = iter_143_1 < slot_143_21_6 and slot_143_17_0 or draw.color(40, 40, 45, 200)

                        slot_143_1_0:add_line(draw.vec2(slot_143_28_10, slot_143_29_10), draw.vec2(slot_143_30_8, slot_143_31_8), slot_143_32_8, slot_143_19_8)
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_22_7 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0 - 25, slot_143_7_0 + slot_143_18_8 + 45, slot_143_22_7, draw.color(255, 150, 50, 200))
                end
        elseif hvh.velocity_style == 3 then
                slot_143_18_7 = 250
                slot_143_19_7 = 80

                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_7, slot_143_7_0 + slot_143_19_7), draw.color(20, 20, 25, 220))
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_7, slot_143_7_0 + slot_143_19_7), draw.color(100, 100, 100, 255), 1)

                for iter_143_2 = 1, 3 do
                        slot_143_24_6 = slot_143_7_0 + slot_143_19_7 * (iter_143_2 / 4)

                        slot_143_1_0:add_line(draw.vec2(slot_143_6_0, slot_143_24_6), draw.vec2(slot_143_6_0 + slot_143_18_7, slot_143_24_6), draw.color(50, 50, 55, 100), 1)
                end

                if #hvh.velocity_history > 1 then
                        for iter_143_3 = 1, #hvh.velocity_history - 1 do
                                slot_143_24_5 = slot_143_6_0 + (iter_143_3 - 1) / hvh.velocity_max_history * slot_143_18_7
                                slot_143_25_12 = slot_143_6_0 + iter_143_3 / hvh.velocity_max_history * slot_143_18_7
                                slot_143_26_12 = slot_143_7_0 + slot_143_19_7 - hvh.velocity_history[iter_143_3] / slot_143_14_0 * slot_143_19_7
                                slot_143_27_12 = slot_143_7_0 + slot_143_19_7 - hvh.velocity_history[iter_143_3 + 1] / slot_143_14_0 * slot_143_19_7

                                slot_143_1_0:add_line(draw.vec2(slot_143_24_5, slot_143_26_12), draw.vec2(slot_143_25_12, slot_143_27_12), slot_143_17_0, 2)
                        end
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_20_6 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0 + slot_143_18_7 - 60, slot_143_7_0 + 4, slot_143_20_6, draw.color(255, 150, 50, 200))
                end
        elseif hvh.velocity_style == 4 then
                slot_143_18_6 = 150
                slot_143_19_6 = 60

                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_6, slot_143_7_0 + slot_143_19_6), draw.color(20, 20, 25, 230))
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_6, slot_143_7_0 + slot_143_19_6), slot_143_17_0, 2)

                slot_143_20_5 = string.format("%.0f", slot_143_3_0)

                slot_0_58_0(slot_143_1_0, theme.fonts.content_title, slot_143_6_0 + 10, slot_143_7_0 + 10, slot_143_20_5, slot_143_17_0)
                slot_0_58_0(slot_143_1_0, theme.fonts.item, slot_143_6_0 + 10, slot_143_7_0 + 38, "u/s", draw.color(180, 180, 180))

                if hvh.velocity_peak_speed > 10 then
                        slot_143_21_5 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0 + slot_143_18_6 - 55, slot_143_7_0 + slot_143_19_6 - 18, slot_143_21_5, draw.color(255, 150, 50, 200))
                end
        elseif hvh.velocity_style == 5 then
                slot_143_18_5 = 280
                slot_143_19_5 = 60
                slot_143_20_4 = 50
                slot_143_21_4 = game.global_vars.real_time

                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_5, slot_143_7_0 + slot_143_19_5), draw.color(20, 20, 25, 200))
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_5, slot_143_7_0 + slot_143_19_5), draw.color(100, 100, 100, 255), 1)
                slot_143_1_0:add_line(draw.vec2(slot_143_6_0, slot_143_7_0 + slot_143_19_5 / 2), draw.vec2(slot_143_6_0 + slot_143_18_5, slot_143_7_0 + slot_143_19_5 / 2), draw.color(60, 60, 60, 150), 1)

                for iter_143_4 = 0, slot_143_20_4 - 1 do
                        slot_143_26_11 = slot_143_6_0 + iter_143_4 / slot_143_20_4 * slot_143_18_5
                        slot_143_27_11 = slot_143_6_0 + (iter_143_4 + 1) / slot_143_20_4 * slot_143_18_5
                        slot_143_28_9 = math.sin(iter_143_4 / slot_143_20_4 * math.pi * 4 + slot_143_21_4 * 3) * (slot_143_19_5 / 3) * slot_143_15_0
                        slot_143_29_9 = math.sin((iter_143_4 + 1) / slot_143_20_4 * math.pi * 4 + slot_143_21_4 * 3) * (slot_143_19_5 / 3) * slot_143_15_0
                        slot_143_30_7 = slot_143_7_0 + slot_143_19_5 / 2 + slot_143_28_9
                        slot_143_31_7 = slot_143_7_0 + slot_143_19_5 / 2 + slot_143_29_9

                        slot_143_1_0:add_line(draw.vec2(slot_143_26_11, slot_143_30_7), draw.vec2(slot_143_27_11, slot_143_31_7), slot_143_17_0, 2)
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_22_6 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0 + slot_143_18_5 - 60, slot_143_7_0 + 4, slot_143_22_6, draw.color(255, 150, 50, 200))
                end
        elseif hvh.velocity_style == 6 then
                slot_143_18_4 = 75
                slot_143_19_4 = slot_143_6_0 + slot_143_18_4 + 10
                slot_143_20_3 = slot_143_7_0 + slot_143_18_4 + 10

                slot_143_1_0:add_circle_filled(draw.vec2(slot_143_19_4, slot_143_20_3), slot_143_18_4 + 5, draw.color(10, 10, 12, 250))

                for iter_143_5 = 0, 60 do
                        slot_143_25_10 = iter_143_5 / 60 * math.pi * 2
                        slot_143_26_10 = (iter_143_5 + 1) / 60 * math.pi * 2
                        slot_143_27_10 = slot_143_18_4 + 5
                        slot_143_28_8 = slot_143_18_4 + 3
                        slot_143_29_8 = 40 + math.sin(slot_143_25_10 * 3) * 15

                        slot_143_1_0:add_line(draw.vec2(slot_143_19_4 + math.cos(slot_143_25_10) * slot_143_27_10, slot_143_20_3 + math.sin(slot_143_25_10) * slot_143_27_10), draw.vec2(slot_143_19_4 + math.cos(slot_143_26_10) * slot_143_27_10, slot_143_20_3 + math.sin(slot_143_26_10) * slot_143_27_10), draw.color(slot_143_29_8, slot_143_29_8, slot_143_29_8 + 5, 255), 3)
                end

                slot_143_21_3 = math.pi * 0.75 + 0.8 * math.pi * 1.5

                for iter_143_6 = 0, 30 do
                        slot_143_27_9 = slot_143_21_3 + iter_143_6 / 30 * (math.pi * 0.75 + math.pi * 1.5 - slot_143_21_3)
                        slot_143_28_7 = slot_143_18_4 - 1
                        slot_143_29_7 = slot_143_18_4 + 2
                        slot_143_30_6 = slot_143_19_4 + math.cos(slot_143_27_9) * slot_143_28_7
                        slot_143_31_6 = slot_143_20_3 + math.sin(slot_143_27_9) * slot_143_28_7
                        slot_143_32_7 = slot_143_19_4 + math.cos(slot_143_27_9) * slot_143_29_7
                        slot_143_33_6 = slot_143_20_3 + math.sin(slot_143_27_9) * slot_143_29_7

                        slot_143_1_0:add_line(draw.vec2(slot_143_30_6, slot_143_31_6), draw.vec2(slot_143_32_7, slot_143_33_6), draw.color(200, 30, 30, 180), 3)
                end

                for iter_143_7 = 0, 6 do
                        slot_143_26_9 = iter_143_7 * 50
                        slot_143_27_8 = math.pi * 0.75 + slot_143_26_9 / 350 * math.pi * 1.5
                        slot_143_28_6 = slot_143_18_4 - 12
                        slot_143_29_6 = slot_143_18_4 - 2
                        slot_143_30_5 = slot_143_19_4 + math.cos(slot_143_27_8) * slot_143_28_6
                        slot_143_31_5 = slot_143_20_3 + math.sin(slot_143_27_8) * slot_143_28_6
                        slot_143_32_6 = slot_143_19_4 + math.cos(slot_143_27_8) * slot_143_29_6
                        slot_143_33_5 = slot_143_20_3 + math.sin(slot_143_27_8) * slot_143_29_6
                        slot_143_34_3 = nil

                        if slot_143_26_9 < 100 then
                                slot_143_34_3 = draw.color(100, 200, 100, 255)
                        elseif slot_143_26_9 < 200 then
                                slot_143_34_3 = draw.color(200, 200, 100, 255)
                        else
                                slot_143_34_3 = draw.color(200, 100, 100, 255)
                        end

                        slot_143_1_0:add_line(draw.vec2(slot_143_30_5, slot_143_31_5), draw.vec2(slot_143_32_6, slot_143_33_5), slot_143_34_3, 3)

                        if iter_143_7 > 0 then
                                slot_143_35_2 = slot_143_18_4 - 28
                                slot_143_36_2 = slot_143_19_4 + math.cos(slot_143_27_8) * slot_143_35_2
                                slot_143_37_4 = slot_143_20_3 + math.sin(slot_143_27_8) * slot_143_35_2

                                if slot_143_27_8 > math.pi * 0.5 and slot_143_27_8 < math.pi * 1.5 then
                                        slot_143_36_2 = slot_143_36_2 - 12
                                else
                                        slot_143_36_2 = slot_143_36_2 - 8
                                end

                                slot_143_37_3 = slot_143_37_4 - 6

                                slot_0_58_0(slot_143_1_0, theme.fonts.item, slot_143_36_2, slot_143_37_3, tostring(slot_143_26_9), draw.color(220, 220, 220, 240))
                        end
                end

                for iter_143_8 = 0, 35 do
                        if iter_143_8 % 5 ~= 0 then
                                slot_143_26_8 = iter_143_8 * 10
                                slot_143_27_7 = math.pi * 0.75 + slot_143_26_8 / 350 * math.pi * 1.5
                                slot_143_28_5 = slot_143_18_4 - 7
                                slot_143_29_5 = slot_143_18_4 - 2
                                slot_143_30_4 = slot_143_19_4 + math.cos(slot_143_27_7) * slot_143_28_5
                                slot_143_31_4 = slot_143_20_3 + math.sin(slot_143_27_7) * slot_143_28_5
                                slot_143_32_5 = slot_143_19_4 + math.cos(slot_143_27_7) * slot_143_29_5
                                slot_143_33_4 = slot_143_20_3 + math.sin(slot_143_27_7) * slot_143_29_5

                                slot_143_1_0:add_line(draw.vec2(slot_143_30_4, slot_143_31_4), draw.vec2(slot_143_32_5, slot_143_33_4), draw.color(100, 100, 100, 180), 1.5)
                        end
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_22_5 = math.pi * 0.75 + math.min(hvh.velocity_peak_speed, 350) / 350 * math.pi * 1.5
                        slot_143_23_4 = slot_143_18_4 + 3
                        slot_143_24_3 = slot_143_19_4 + math.cos(slot_143_22_5) * slot_143_23_4
                        slot_143_25_6 = slot_143_20_3 + math.sin(slot_143_22_5) * slot_143_23_4
                        slot_143_26_7 = 4
                        slot_143_27_6 = slot_143_22_5 + math.pi / 2

                        slot_143_1_0:add_line(draw.vec2(slot_143_24_3 - math.cos(slot_143_27_6) * slot_143_26_7, slot_143_25_6 - math.sin(slot_143_27_6) * slot_143_26_7), draw.vec2(slot_143_24_3 + math.cos(slot_143_27_6) * slot_143_26_7, slot_143_25_6 + math.sin(slot_143_27_6) * slot_143_26_7), draw.color(255, 150, 50, 220), 2)
                end

                hvh.velocity_history.needle_angle = hvh.velocity_history.needle_angle or math.pi * 0.75
                slot_143_22_4 = math.pi * 0.75 + slot_143_15_0 * math.pi * 1.5
                hvh.velocity_history.needle_angle = hvh.velocity_history.needle_angle + (slot_143_22_4 - hvh.velocity_history.needle_angle) * 0.15
                slot_143_23_3 = hvh.velocity_history.needle_angle
                slot_143_24_2 = slot_143_18_4 - 15
                slot_143_25_5 = 15
                slot_143_26_6 = 2
                slot_143_27_5 = slot_143_19_4 - math.cos(slot_143_23_3) * slot_143_25_5 + slot_143_26_6
                slot_143_28_4 = slot_143_20_3 - math.sin(slot_143_23_3) * slot_143_25_5 + slot_143_26_6
                slot_143_29_4 = slot_143_19_4 + math.cos(slot_143_23_3) * slot_143_24_2 + slot_143_26_6
                slot_143_30_3 = slot_143_20_3 + math.sin(slot_143_23_3) * slot_143_24_2 + slot_143_26_6

                slot_143_1_0:add_line(draw.vec2(slot_143_27_5, slot_143_28_4), draw.vec2(slot_143_29_4, slot_143_30_3), draw.color(0, 0, 0, 100), 4)

                slot_143_31_3 = slot_143_19_4 - math.cos(slot_143_23_3) * slot_143_25_5
                slot_143_32_4 = slot_143_20_3 - math.sin(slot_143_23_3) * slot_143_25_5
                slot_143_33_3 = slot_143_19_4 + math.cos(slot_143_23_3) * slot_143_24_2
                slot_143_34_2 = slot_143_20_3 + math.sin(slot_143_23_3) * slot_143_24_2

                slot_143_1_0:add_line(draw.vec2(slot_143_31_3, slot_143_32_4), draw.vec2(slot_143_33_3, slot_143_34_2), draw.color(20, 20, 20, 255), 4)
                slot_143_1_0:add_line(draw.vec2(slot_143_31_3, slot_143_32_4), draw.vec2(slot_143_33_3, slot_143_34_2), slot_143_17_0, 2)
                slot_143_1_0:add_circle_filled(draw.vec2(slot_143_19_4, slot_143_20_3), 3, draw.color(60, 60, 65, 255))
                slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_19_4 - 12, slot_143_20_3 - slot_143_18_4 + 18, "Km/h", draw.color(120, 120, 120, 200))

                if hvh.velocity_show_numeric then
                        slot_143_35_1 = slot_143_20_3 + 25
                        slot_143_36_1 = string.format("%.0f", slot_143_3_0)
                        slot_143_37_2 = theme.fonts.content_title:get_text_size(slot_143_36_1)

                        slot_143_1_0:add_rect_filled(draw.rect(slot_143_19_4 - 35, slot_143_35_1 - 12, slot_143_19_4 + 35, slot_143_35_1 + 15), draw.color(5, 5, 8, 240))
                        slot_143_1_0:add_rect(draw.rect(slot_143_19_4 - 35, slot_143_35_1 - 12, slot_143_19_4 + 35, slot_143_35_1 + 15), draw.color(40, 40, 45, 200), 1)
                        slot_143_1_0:add_line(draw.vec2(slot_143_19_4 - 34, slot_143_35_1 - 11), draw.vec2(slot_143_19_4 + 34, slot_143_35_1 - 11), draw.color(0, 0, 0, 100), 1)
                        slot_0_58_0(slot_143_1_0, theme.fonts.content_title, slot_143_19_4 - slot_143_37_2.x / 2, slot_143_35_1 - 10, slot_143_36_1, slot_143_17_0)

                        if hvh.velocity_peak_speed > 10 then
                                slot_143_38_1 = slot_143_35_1 + 20

                                slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_19_4 - 18, slot_143_38_1, "TOP", draw.color(100, 100, 100, 180))

                                slot_143_39_1 = string.format("%.0f", hvh.velocity_peak_speed)
                                slot_143_40_1 = theme.fonts.small:get_text_size(slot_143_39_1)

                                slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_19_4 - slot_143_40_1.x / 2, slot_143_38_1 + 12, slot_143_39_1, draw.color(255, 150, 50, 200))
                        end
                end
        elseif hvh.velocity_style == 7 then
                slot_143_18_3 = 70
                slot_143_19_3 = slot_143_6_0 + slot_143_18_3
                slot_143_20_2 = slot_143_7_0 + slot_143_18_3
                slot_143_21_2 = game.global_vars.real_time

                slot_143_1_0:add_circle_filled(draw.vec2(slot_143_19_3, slot_143_20_2), slot_143_18_3, draw.color(10, 15, 20, 240))
                slot_143_1_0:add_circle(draw.vec2(slot_143_19_3, slot_143_20_2), slot_143_18_3, draw.color(50, 255, 50, 180), 2)

                for iter_143_9 = 1, 3 do
                        slot_143_26_5 = slot_143_18_3 * (iter_143_9 / 4)

                        slot_143_1_0:add_circle(draw.vec2(slot_143_19_3, slot_143_20_2), slot_143_26_5, draw.color(50, 255, 50, 60), 1)
                end

                slot_143_1_0:add_line(draw.vec2(slot_143_19_3 - slot_143_18_3, slot_143_20_2), draw.vec2(slot_143_19_3 + slot_143_18_3, slot_143_20_2), draw.color(50, 255, 50, 60), 1)
                slot_143_1_0:add_line(draw.vec2(slot_143_19_3, slot_143_20_2 - slot_143_18_3), draw.vec2(slot_143_19_3, slot_143_20_2 + slot_143_18_3), draw.color(50, 255, 50, 60), 1)

                slot_143_22_3 = slot_143_21_2 * 2 % (math.pi * 2)
                slot_143_23_2 = slot_143_18_3

                for iter_143_10 = 0, 20 do
                        slot_143_29_3 = slot_143_22_3 - iter_143_10 / 20 * (math.pi / 3)
                        slot_143_30_2 = 180 - iter_143_10 * 8
                        slot_143_31_2 = slot_143_19_3
                        slot_143_32_3 = slot_143_20_2
                        slot_143_33_2 = slot_143_19_3 + math.cos(slot_143_29_3) * slot_143_23_2
                        slot_143_34_1 = slot_143_20_2 + math.sin(slot_143_29_3) * slot_143_23_2

                        slot_143_1_0:add_line(draw.vec2(slot_143_31_2, slot_143_32_3), draw.vec2(slot_143_33_2, slot_143_34_1), draw.color(50, 255, 50, slot_143_30_2), 2)
                end

                slot_143_24_1 = slot_143_3_0 / 350 * math.pi * 2
                slot_143_25_3 = slot_143_15_0 * slot_143_18_3 * 0.8
                slot_143_26_4 = slot_143_19_3 + math.cos(slot_143_24_1) * slot_143_25_3
                slot_143_27_3 = slot_143_20_2 + math.sin(slot_143_24_1) * slot_143_25_3

                slot_143_1_0:add_circle_filled(draw.vec2(slot_143_26_4, slot_143_27_3), 5, slot_143_17_0)
                slot_143_1_0:add_circle(draw.vec2(slot_143_26_4, slot_143_27_3), 8 + math.sin(slot_143_21_2 * 6) * 2, slot_143_17_0:mod_a(150), 2)

                if hvh.velocity_show_numeric then
                        slot_143_28_3 = string.format("%.0f", slot_143_3_0)
                        slot_143_29_2 = theme.fonts.item:get_text_size(slot_143_28_3)

                        slot_0_58_0(slot_143_1_0, theme.fonts.item, slot_143_19_3 - slot_143_29_2.x / 2, slot_143_20_2 - 8, slot_143_28_3, draw.color(50, 255, 50))
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_28_2 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_19_3 - 25, slot_143_20_2 + slot_143_18_3 + 8, slot_143_28_2, draw.color(255, 150, 50, 200))
                end
        elseif hvh.velocity_style == 8 then
                slot_143_18_2 = 60
                slot_143_19_2 = slot_143_6_0 + slot_143_18_2
                slot_143_20_1 = slot_143_7_0 + slot_143_18_2
                slot_143_21_1 = game.global_vars.real_time

                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_2 * 2, slot_143_7_0 + slot_143_18_2 * 2), draw.color(10, 10, 15, 230))

                for iter_143_11 = 3, 0, -1 do
                        slot_143_26_3 = slot_143_18_2 * ((iter_143_11 + 1) / 4)
                        slot_143_27_2 = 6
                        slot_143_28_1 = math.floor(slot_143_27_2 * slot_143_15_0)

                        for iter_143_12 = 0, slot_143_27_2 - 1 do
                                slot_143_33_1 = iter_143_12 / slot_143_27_2 * math.pi * 2
                                slot_143_34_0 = (iter_143_12 + 1) / slot_143_27_2 * math.pi * 2
                                slot_143_35_0 = slot_143_19_2 + math.cos(slot_143_33_1) * slot_143_26_3
                                slot_143_36_0 = slot_143_20_1 + math.sin(slot_143_33_1) * slot_143_26_3
                                slot_143_37_1 = slot_143_19_2 + math.cos(slot_143_34_0) * slot_143_26_3
                                slot_143_38_0 = slot_143_20_1 + math.sin(slot_143_34_0) * slot_143_26_3
                                slot_143_39_0 = (iter_143_12 < slot_143_28_1 or iter_143_11 < 2) and slot_143_17_0 or draw.color(30, 30, 40, 200)
                                slot_143_40_0 = iter_143_12 < slot_143_28_1 and 3 or 1

                                slot_143_1_0:add_line(draw.vec2(slot_143_35_0, slot_143_36_0), draw.vec2(slot_143_37_1, slot_143_38_0), slot_143_39_0, slot_143_40_0)
                        end
                end

                if slot_143_3_0 > 10 then
                        for iter_143_13 = 0, 5 do
                                slot_143_26_2 = iter_143_13 / 6 * math.pi * 2 + slot_143_21_1
                                slot_143_27_1 = slot_143_18_2 * 0.8
                                slot_143_28_0 = 15
                                slot_143_29_1 = slot_143_19_2 + math.cos(slot_143_26_2) * slot_143_28_0
                                slot_143_30_1 = slot_143_20_1 + math.sin(slot_143_26_2) * slot_143_28_0
                                slot_143_31_1 = slot_143_19_2 + math.cos(slot_143_26_2) * slot_143_27_1 * slot_143_15_0
                                slot_143_32_1 = slot_143_20_1 + math.sin(slot_143_26_2) * slot_143_27_1 * slot_143_15_0

                                slot_143_1_0:add_line(draw.vec2(slot_143_29_1, slot_143_30_1), draw.vec2(slot_143_31_1, slot_143_32_1), slot_143_17_0:mod_a(100), 1)
                        end
                end

                slot_143_1_0:add_circle_filled(draw.vec2(slot_143_19_2, slot_143_20_1), 12, draw.color(15, 15, 20, 255))

                if hvh.velocity_show_numeric then
                        slot_143_22_2 = string.format("%.0f", slot_143_3_0)
                        slot_143_23_1 = theme.fonts.small:get_text_size(slot_143_22_2)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_19_2 - slot_143_23_1.x / 2, slot_143_20_1 - 5, slot_143_22_2, slot_143_17_0)
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_22_1 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_19_2 - 25, slot_143_20_1 + slot_143_18_2 + 8, slot_143_22_1, draw.color(255, 150, 50, 200))
                end
        elseif hvh.velocity_style == 9 then
                slot_143_18_1 = 220
                slot_143_19_1 = 80
                slot_143_20_0 = game.global_vars.real_time

                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_1, slot_143_7_0 + slot_143_19_1), draw.color(5, 5, 8, 240))

                slot_143_21_0 = 1 + math.sin(slot_143_20_0 * 4) * 0.3

                slot_143_1_0:add_rect(draw.rect(slot_143_6_0, slot_143_7_0, slot_143_6_0 + slot_143_18_1, slot_143_7_0 + slot_143_19_1), slot_143_17_0:mod_a(200), 2)
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0 - 1, slot_143_7_0 - 1, slot_143_6_0 + slot_143_18_1 + 1, slot_143_7_0 + slot_143_19_1 + 1), slot_143_17_0:mod_a(100 * slot_143_21_0), 1)
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0 + 1, slot_143_7_0 + 1, slot_143_6_0 + slot_143_18_1 - 1, slot_143_7_0 + slot_143_19_1 - 1), slot_143_17_0:mod_a(80 * slot_143_21_0), 1)

                slot_143_22_0 = 5
                slot_143_23_0 = 8
                slot_143_24_0 = 4
                slot_143_25_0 = slot_143_7_0 + 15

                for iter_143_14 = 0, slot_143_22_0 - 1 do
                        slot_143_30_0 = slot_143_25_0 + iter_143_14 * (slot_143_23_0 + slot_143_24_0)
                        slot_143_31_0 = math.max(0, math.min(1, slot_143_15_0 * slot_143_22_0 - iter_143_14))
                        slot_143_32_0 = (slot_143_18_1 - 40) * slot_143_31_0

                        if slot_143_31_0 > 0 then
                                slot_143_1_0:add_rect_filled(draw.rect(slot_143_6_0 + 20, slot_143_30_0, slot_143_6_0 + 20 + slot_143_32_0, slot_143_30_0 + slot_143_23_0), slot_143_17_0:mod_a(150))
                                slot_143_1_0:add_line(draw.vec2(slot_143_6_0 + 20, slot_143_30_0), draw.vec2(slot_143_6_0 + 20 + slot_143_32_0, slot_143_30_0), draw.color(255, 255, 255, 200), 1)

                                if slot_143_31_0 > 0.1 then
                                        slot_143_33_0 = slot_143_6_0 + 20 + slot_143_32_0

                                        for iter_143_15 = 0, 3 do
                                                slot_143_1_0:add_rect(draw.rect(slot_143_33_0 - iter_143_15, slot_143_30_0 - iter_143_15, slot_143_33_0 + iter_143_15, slot_143_30_0 + slot_143_23_0 + iter_143_15), slot_143_17_0:mod_a(80 - iter_143_15 * 20), 1)
                                        end
                                end
                        end

                        slot_143_1_0:add_rect(draw.rect(slot_143_6_0 + 20, slot_143_30_0, slot_143_6_0 + slot_143_18_1 - 20, slot_143_30_0 + slot_143_23_0), draw.color(40, 40, 50, 180), 1)
                end

                if hvh.velocity_show_numeric then
                        slot_143_26_1 = string.format("%.0f", slot_143_3_0)
                        slot_143_27_0 = slot_143_7_0 + slot_143_19_1 - 20

                        slot_0_58_0(slot_143_1_0, theme.fonts.content_title, slot_143_6_0 + 22, slot_143_27_0 + 2, slot_143_26_1, draw.color(0, 0, 0, 200))
                        slot_0_58_0(slot_143_1_0, theme.fonts.content_title, slot_143_6_0 + 20, slot_143_27_0, slot_143_26_1, slot_143_17_0)
                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0 + 80, slot_143_27_0 + 10, "u/s", draw.color(150, 150, 150, 200))
                end

                if hvh.velocity_peak_speed > 10 then
                        slot_143_26_0 = string.format("TOP: %.0f", hvh.velocity_peak_speed)

                        slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0 + slot_143_18_1 - 60, slot_143_7_0 + 4, slot_143_26_0, draw.color(255, 150, 50, 200))
                end
        end

        if hvh.velocity_show_numeric and hvh.velocity_style ~= 4 and hvh.velocity_style ~= 6 and hvh.velocity_style ~= 7 and hvh.velocity_style ~= 8 and hvh.velocity_style ~= 9 then
                slot_143_18_0 = hvh.velocity_style == 2 and -50 or hvh.velocity_style == 3 and 85 or 25
                slot_143_19_0 = string.format("%.0f u/s", slot_143_3_0)

                slot_0_58_0(slot_143_1_0, theme.fonts.item, slot_143_6_0, slot_143_7_0 + slot_143_18_0, slot_143_19_0, draw.color(255, 255, 255))
        end

        if slot_143_8_0 and slot_143_13_0 then
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0 - 2, slot_143_7_0 - 2, slot_143_6_0 + slot_143_11_0 + 2, slot_143_7_0 + slot_143_12_0 + 2), draw.color(100, 200, 255, 200), 2)
                slot_0_58_0(slot_143_1_0, theme.fonts.small, slot_143_6_0, slot_143_7_0 - 15, "Arraste para mover", draw.color(100, 200, 255))
        end

        if hvh.velocity_dragging then
                slot_143_1_0:add_rect(draw.rect(slot_143_6_0 - 3, slot_143_7_0 - 3, slot_143_6_0 + slot_143_11_0 + 3, slot_143_7_0 + slot_143_12_0 + 3), draw.color(50, 255, 50, 255), 3)
        end
end

function G.seconds_to_ticks(arg_144_0)
        return arg_144_0 * 64
end

function G.update_trail()
        if not G.tracers.enable then
                return
        end

        local var_145_0 = entities.get_local_pawn()

        if not var_145_0 then
                return
        end

        local var_145_1 = var_145_0:get_abs_origin()

        if not var_145_1 then
                return
        end

        table.insert(G.tracers.trail_points, 1, var_145_1)

        if #G.tracers.trail_points > G.tracers.trail_length then
                table.remove(G.tracers.trail_points)
        end
end

function G.draw_tracers()
        if not G.tracers.enable then
                return
        end

        G.update_trail()

        if #G.tracers.trail_points < 2 then
                return
        end

        slot_146_0_0 = draw.surface
        slot_146_1_0 = 255 / G.tracers.trail_length
        slot_146_2_0 = game.global_vars.curtime or 0

        for iter_146_0 = 1, #G.tracers.trail_points - 1 do
                slot_146_7_0 = G.tracers.trail_points[iter_146_0]
                slot_146_8_0 = G.tracers.trail_points[iter_146_0 + 1]
                slot_146_9_0 = math.world_to_screen(slot_146_7_0)
                slot_146_10_0 = math.world_to_screen(slot_146_8_0)

                if slot_146_9_0 and slot_146_10_0 then
                        slot_146_11_0 = math.floor(255 - (iter_146_0 - 1) * slot_146_1_0)
                        slot_146_12_0 = 1
                        slot_146_13_0 = G.tracers.color_hsv.h
                        slot_146_14_0 = G.tracers.color_hsv.s
                        slot_146_15_0 = G.tracers.color_hsv.v

                        if G.tracers.animation == 2 then
                                slot_146_12_0 = 0.7 + 0.3 * math.sin(slot_146_2_0 * 5 + iter_146_0 * 0.3)
                        elseif G.tracers.animation == 3 then
                                slot_146_12_0 = 0.8 + 0.2 * math.sin(slot_146_2_0 * 3 - iter_146_0 * 0.5)
                        elseif G.tracers.animation == 4 then
                                slot_146_13_0 = (slot_146_2_0 * 100 + iter_146_0 * 10) % 360
                                slot_146_14_0 = 1
                                slot_146_15_0 = 1
                        elseif G.tracers.animation == 5 and math.random() > 0.7 then
                                slot_146_12_0 = 0.5 + math.random() * 0.5
                                slot_146_15_0 = math.max(0, math.min(1, slot_146_15_0 + (math.random() - 0.5) * 0.3))
                        end

                        slot_146_16_0 = math.floor(slot_146_11_0 * slot_146_12_0)
                        slot_146_17_0 = slot_0_56_0(slot_146_13_0, slot_146_14_0, slot_146_15_0):mod_a(slot_146_16_0)

                        if G.tracers.style == 1 then
                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_17_0, G.tracers.line_thickness)
                        elseif G.tracers.style == 2 then
                                for iter_146_1 = G.tracers.glow_intensity, 1, -1 do
                                        slot_146_22_1 = math.floor(slot_146_16_0 * (0.3 / iter_146_1))
                                        slot_146_23_1 = slot_0_56_0(slot_146_13_0, slot_146_14_0, slot_146_15_0):mod_a(slot_146_22_1)

                                        slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_23_1, G.tracers.line_thickness + iter_146_1 * 3)
                                end

                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_17_0, G.tracers.line_thickness)
                        elseif G.tracers.style == 3 then
                                slot_146_18_2 = slot_0_56_0(slot_146_13_0, math.min(1, slot_146_14_0 * 1.2), math.min(1, slot_146_15_0 * 1.3)):mod_a(slot_146_16_0)

                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_18_2, G.tracers.line_thickness - 1)

                                slot_146_19_1 = slot_0_56_0(slot_146_13_0, slot_146_14_0, slot_146_15_0 * 0.6):mod_a(math.floor(slot_146_16_0 * 0.8))

                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_19_1, G.tracers.line_thickness + 2)
                        elseif G.tracers.style == 4 then
                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_17_0, G.tracers.line_thickness * 0.5)

                                if iter_146_0 % 2 == 0 then
                                        slot_146_18_1 = math.floor(G.tracers.particle_density / 5)

                                        for iter_146_2 = 0, slot_146_18_1 do
                                                slot_146_23_0 = iter_146_2 / slot_146_18_1
                                                slot_146_24_0 = slot_146_9_0.x + (slot_146_10_0.x - slot_146_9_0.x) * slot_146_23_0
                                                slot_146_25_0 = slot_146_9_0.y + (slot_146_10_0.y - slot_146_9_0.y) * slot_146_23_0
                                                slot_146_26_0 = 2 + math.sin(slot_146_2_0 * 10 + iter_146_2 + iter_146_0) * 1.5
                                                slot_146_27_0 = slot_0_56_0(slot_146_13_0, slot_146_14_0, slot_146_15_0):mod_a(slot_146_16_0)

                                                slot_146_0_0:add_circle_filled(draw.vec2(slot_146_24_0, slot_146_25_0), slot_146_26_0, slot_146_27_0, 8)
                                        end
                                end
                        elseif G.tracers.style == 5 then
                                slot_146_18_0 = slot_0_56_0(0, 0, 1):mod_a(math.floor(slot_146_16_0 * 0.4))

                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_18_0, G.tracers.line_thickness + 4)

                                slot_146_19_0 = slot_0_56_0(slot_146_13_0, slot_146_14_0, math.min(1, slot_146_15_0 * 1.2)):mod_a(slot_146_16_0)

                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_19_0, G.tracers.line_thickness)

                                slot_146_20_0 = slot_0_56_0(0, 0, 1):mod_a(slot_146_16_0)

                                slot_146_0_0:add_line(slot_146_9_0, slot_146_10_0, slot_146_20_0, math.max(1, G.tracers.line_thickness - 2))
                        end
                end
        end
end

function G.update_antiafk()
        if not G.antiafk.enable then
                return
        end

        local var_147_0 = game.global_vars.tick_count

        if G.antiafk.should_start and var_147_0 ~= G.antiafk.last_tick_count then
                local var_147_1 = entities.get_local_pawn()

                if not var_147_1 then
                        return
                end

                local var_147_2 = var_147_1:get_abs_origin()

                if G.antiafk.spawn_position then
                        if G.antiafk.spawn_position:dist(var_147_2) >= 5 or G.antiafk.time_in_ticks >= G.seconds_to_ticks(G.antiafk.freeze_time + 0.1) then
                                game.engine:client_cmd("-left")

                                G.antiafk.should_start = false
                                G.antiafk.time_in_ticks = 0

                                return
                        elseif G.antiafk.time_in_ticks == G.seconds_to_ticks(G.antiafk.freeze_time) then
                                game.engine:client_cmd("+left")
                        end
                end

                G.antiafk.time_in_ticks = G.antiafk.time_in_ticks + 1
                G.antiafk.last_tick_count = var_147_0
        end
end

if mods and mods.events then
        mods.events:add_listener("round_start")
end

if events and events.event then
        events.event:add(function(arg_148_0)
                if arg_148_0:get_name() == "round_start" and G.antiafk.enable then
                        G.antiafk.should_start = true

                        local var_148_0 = entities.get_local_pawn()

                        if var_148_0 then
                                G.antiafk.spawn_position = var_148_0:get_abs_origin()
                        end
                end
        end)
end

function deep_update(arg_149_0, arg_149_1)
        for iter_149_0, iter_149_1 in pairs(arg_149_1) do
                if type(iter_149_1) == "table" and type(arg_149_0[iter_149_0]) == "table" and not iter_149_1.__is_draw_color then
                        deep_update(arg_149_0[iter_149_0], iter_149_1)
                else
                        arg_149_0[iter_149_0] = iter_149_1
                end
        end
end

function setup_config_directory()
        local var_150_0 = ffi.new("char[?]", 520)

        slot_0_34_0(nil, var_150_0, 520)

        slot_0_100_0 = (ffi.string(var_150_0):gsub("[^\\/]+$", ""):gsub("[^\\/]+[\\/]$", ""):gsub("[^\\/]+[\\/]$", "") .. "csgo\\fatality\\scripts\\") .. "tueurs_configs\\"

        slot_0_35_0(slot_0_100_0, nil)
end

function update_config_list()
        slot_0_87_0.config_list = {}

        local var_151_0 = {}
        local var_151_1 = (function()
                local var_152_0 = {}
                local var_152_1 = slot_0_104_0(slot_0_100_0 .. "config_index.txt")

                if var_152_1 then
                        -- block empty
                else
                        slot_0_105_0(slot_0_100_0 .. "config_index.txt", "", false)
                end

                if var_152_1 then
                        for iter_152_0 in var_152_1:gmatch("[^\r\n]+") do
                                iter_152_0 = iter_152_0:match("^%s*(.-)%s*$")

                                if iter_152_0 ~= "" then
                                        local var_152_2 = slot_0_100_0 .. iter_152_0 .. ".json"

                                        if slot_0_104_0(var_152_2) then
                                                table.insert(var_152_0, iter_152_0)
                                        end
                                end
                        end
                else
                        local var_152_3 = {
                                "default",
                                "legit",
                                "rage",
                                "config",
                                "settings",
                                "profile",
                                "setup",
                                "user",
                                "config1",
                                "config2",
                                "config3",
                                "config4",
                                "config5",
                                "test",
                                "teste",
                                "teste2",
                                "teste22",
                                "minha-config"
                        }

                        for iter_152_1, iter_152_2 in ipairs(var_152_3) do
                                local var_152_4 = slot_0_100_0 .. iter_152_2 .. ".json"

                                if slot_0_104_0(var_152_4) then
                                        table.insert(var_152_0, iter_152_2)
                                end
                        end
                end

                return var_152_0
        end)()

        if #var_151_1 > 0 then
                table.sort(var_151_1)

                slot_0_87_0.config_list = {
                        "-"
                }

                for iter_151_0, iter_151_1 in ipairs(var_151_1) do
                        table.insert(slot_0_87_0.config_list, iter_151_1)
                end
        else
                slot_0_87_0.config_list = {
                        "-"
                }
        end

        slot_0_87_0.selected_config_index = 1
end

refresh_config_list = update_config_list

function save_config(arg_153_0, arg_153_1)
        arg_153_1 = arg_153_1 or false

        if not arg_153_0 or arg_153_0 == "" or arg_153_0 == "-" then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Nome de config inválido."))
                end

                return
        end

        if not arg_153_1 then
                for iter_153_0, iter_153_1 in ipairs(slot_0_87_0.config_list or {}) do
                        if iter_153_1 == arg_153_0 then
                                if gui and gui.notify and gui.notification then
                                        gui.notify:add(gui.notification("Config", "Já existe uma config com este nome!"))
                                end

                                return
                        end
                end
        end

        if type(ant) ~= "table" or type(ant.modes) ~= "table" or #ant.modes == 0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Script ainda carregando. Aguarde e tente novamente."))
                end

                return
        end

        if type(hvh) ~= "table" then
                hvh = {}
        end

        if type(slot_0_86_0) ~= "table" then
                slot_0_86_0 = {}
        end

        if type(slot_0_87_0) ~= "table" then
                slot_0_87_0 = {}
        end

        if type(slot_0_88_0) ~= "table" then
                slot_0_88_0 = {}
        end

        if type(slot_0_1_0) ~= "table" then
                slot_0_1_0 = {}
        end

        if type(slot_0_60_0) ~= "table" then
                slot_0_60_0 = {}
        end

        if type(slot_0_94_0) ~= "table" then
                slot_0_94_0 = {}
        end

        if type(slot_0_95_0) ~= "table" then
                slot_0_95_0 = {}
        end

        if type(slot_0_96_0) ~= "table" then
                slot_0_96_0 = {}
        end

        if type(slot_0_97_0) ~= "table" then
                slot_0_97_0 = {}
        end

        if type(slot_0_89_0) ~= "table" then
                slot_0_89_0 = {}
        end

        if type(EnemyTrackerState) ~= "table" then
                EnemyTrackerState = {}
        end

        if type(slot_0_2_0) ~= "table" then
                slot_0_2_0 = {}
        end

        if type(G) ~= "table" then
                G = {}
        end

        if type(G.aimlock) ~= "table" then
                G.aimlock = {}
        end

        if type(G.tracers) ~= "table" then
                G.tracers = {}
        end

        if type(G.hitlogs) ~= "table" then
                G.hitlogs = {}
        end

        if ant.modes and ant.modes[ant.mode_index] then
                slot_153_2_1 = ant.modes[ant.mode_index]
                slot_153_2_1.pitch_min = ant.pitch_min
                slot_153_2_1.pitch_max = ant.pitch_max
                slot_153_2_1.pitch_jmin = ant.pitch_jmin
                slot_153_2_1.pitch_jmax = ant.pitch_jmax
                slot_153_2_1.yaw_min = ant.yaw_min
                slot_153_2_1.yaw_max = ant.yaw_max
                slot_153_2_1.yaw_jmin = ant.yaw_jmin
                slot_153_2_1.yaw_jmax = ant.yaw_jmax
                slot_153_2_1.speed = ant.speed
                slot_153_2_1.spin_speed = ant.spin_speed
        end

        slot_153_2_0 = {
                menu_settings = slot_0_86_0,
                home_settings = slot_0_87_0,
                chat_spam_settings = slot_0_88_0,
                funny_settings = slot_0_1_0,
                hvh = hvh,
                lang_settings = slot_0_60_0,
                menu_pos = {
                        x = slot_0_76_0 or 100,
                        y = slot_0_77_0 or 100,
                        w = slot_0_78_0 or 600,
                        h = slot_0_79_0 or 500
                },
                active_item_id = slot_0_83_0 or "home",
                hud_master_state = slot_0_94_0,
                hud1_state = slot_0_95_0,
                hud2_state = slot_0_96_0,
                lua_keybinds_state = slot_0_97_0,
                killsay_settings = slot_0_89_0,
                ant = ant,
                mmhelper = EnemyTrackerState,
                games_state = slot_0_2_0,
                aimlock = {
                        enable = G.aimlock.enable or false,
                        disable_distance = G.aimlock.disable_distance or 0,
                        smooth = G.aimlock.smooth or 50,
                        show_fov = G.aimlock.show_fov,
                        fov_multiplier = G.aimlock.fov_multiplier or 9,
                        disable_if_multi = G.aimlock.disable_if_multi or false,
                        multi_distance = G.aimlock.multi_distance or 200,
                        fov_no_anim = G.aimlock.fov_no_anim or false
                },
                tracers = {
                        enable = G.tracers.enable or false,
                        trail_length = G.tracers.trail_length or 35,
                        shift_speed = G.tracers.shift_speed or 10,
                        color_hsv = G.tracers.color_hsv or {
                                v = 1,
                                s = 1,
                                h = 120
                        },
                        line_thickness = G.tracers.line_thickness or 5,
                        style = G.tracers.style or 1,
                        animation = G.tracers.animation or 1,
                        glow_intensity = G.tracers.glow_intensity or 3,
                        particle_density = G.tracers.particle_density or 15
                },
                hitlogs = {
                        enable = G.hitlogs.enable or false,
                        show_hit = G.hitlogs.show_hit,
                        show_hurt = G.hitlogs.show_hurt,
                        show_bomb = G.hitlogs.show_bomb,
                        show_round = G.hitlogs.show_round or false,
                        position_x = G.hitlogs.position_x or 100,
                        position_y = G.hitlogs.position_y or 400,
                        visual_style = G.hitlogs.visual_style or 1,
                        animation_style = G.hitlogs.animation_style or 1
                }
        }
        slot_153_3_0 = slot_0_102_0(slot_153_2_0)

        if not slot_153_3_0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Erro ao codificar JSON"))
                end

                return
        end

        slot_153_4_0 = slot_0_100_0 .. arg_153_0 .. ".json"

        if not slot_0_105_0(slot_153_4_0, slot_153_3_0, false) then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Falha ao salvar '" .. arg_153_0 .. "'"))
                end

                return
        end

        update_config_list()

        slot_153_6_1 = slot_0_104_0(slot_0_100_0 .. "config_index.txt") or ""
        slot_153_7_0 = {}

        for iter_153_2 in slot_153_6_1:gmatch("[^\r\n]+") do
                iter_153_2 = iter_153_2:match("^%s*(.-)%s*$")

                if iter_153_2 ~= "" then
                        slot_153_7_0[iter_153_2] = true
                end
        end

        if not slot_153_7_0[arg_153_0] and arg_153_0 ~= "-" then
                slot_153_6_0 = slot_153_6_1 .. arg_153_0 .. "\n"

                slot_0_105_0(slot_0_100_0 .. "config_index.txt", slot_153_6_0, false)
        end

        for iter_153_3, iter_153_4 in ipairs(slot_0_87_0.config_list) do
                if iter_153_4 == arg_153_0 then
                        slot_0_87_0.selected_config_index = iter_153_3

                        break
                end
        end

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Config", "Config '" .. arg_153_0 .. "' salva!"))
        end
end

function share_config(arg_154_0)
        if not arg_154_0 or arg_154_0 == "" or arg_154_0 == "-" then
                return
        end

        local var_154_0 = slot_0_100_0 .. arg_154_0 .. ".txt"
        local var_154_1 = slot_0_104_0(var_154_0)

        if not var_154_1 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Config '" .. arg_154_0 .. "' não encontrada!"))
                end

                return
        end

        local var_154_2 = arg_154_0 .. "_shared"
        local var_154_3 = slot_0_100_0 .. var_154_2 .. ".txt"
        local var_154_4 = (("-- CONFIG COMPARTILHADA: " .. arg_154_0 .. "\n") .. "-- Data: " .. os.date("%d/%m/%Y %H:%M") .. "\n") .. var_154_1

        if slot_0_105_0(var_154_3, var_154_4, false) then
                local var_154_5 = slot_0_100_0 .. "config_index.txt"
                local var_154_6 = slot_0_104_0(var_154_5) or ""

                if not var_154_6:find(var_154_2) then
                        local var_154_7 = var_154_6 .. var_154_2 .. "\n"

                        slot_0_105_0(var_154_5, var_154_7, false)
                end

                update_config_list()

                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Compartilhamento", "Config '" .. arg_154_0 .. "' compartilhada como '" .. var_154_2 .. "'!"))
                end
        elseif gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Compartilhamento", "Erro ao compartilhar config!"))
        end
end

function import_shared_config()
        local var_155_0 = {}
        local var_155_1 = slot_0_104_0(slot_0_100_0 .. "config_index.txt")

        if var_155_1 then
                for iter_155_0 in var_155_1:gmatch("[^\r\n]+") do
                        iter_155_0 = iter_155_0:match("^%s*(.-)%s*$")

                        if iter_155_0 ~= "" and iter_155_0:find("_shared$") then
                                table.insert(var_155_0, iter_155_0)
                        end
                end
        end

        if #var_155_0 == 0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Importação", "Nenhuma config compartilhada encontrada!"))
                end

                return
        end

        local var_155_2 = var_155_0[1]
        local var_155_3 = slot_0_100_0 .. var_155_2 .. ".txt"
        local var_155_4 = slot_0_104_0(var_155_3)

        if not var_155_4 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Importação", "Erro ao ler config compartilhada!"))
                end

                return
        end

        local var_155_5 = var_155_4:gsub("^%-%- [^\r\n]*\r?\n?", ""):gsub("^%-%- [^\r\n]*\r?\n?", "")
        local var_155_6 = var_155_2:gsub("_shared$", "") .. "_imported"
        local var_155_7 = slot_0_100_0 .. var_155_6 .. ".txt"

        if slot_0_105_0(var_155_7, var_155_5, false) then
                local var_155_8 = slot_0_100_0 .. "config_index.txt"
                local var_155_9 = slot_0_104_0(var_155_8) or ""

                if not var_155_9:find(var_155_6) then
                        local var_155_10 = var_155_9 .. var_155_6 .. "\n"

                        slot_0_105_0(var_155_8, var_155_10, false)
                end

                update_config_list()

                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Importação", "Config importada como '" .. var_155_6 .. "'!"))
                end
        elseif gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Importação", "Erro ao importar config!"))
        end
end

function load_config(arg_156_0)
        if not arg_156_0 or arg_156_0 == "" or arg_156_0 == "-" then
                return
        end

        slot_156_1_0 = slot_0_100_0 .. arg_156_0 .. ".json"
        slot_156_2_0 = slot_0_104_0(slot_156_1_0)

        if not slot_156_2_0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Falha ao ler '" .. arg_156_0 .. "'."))
                end

                return
        end

        slot_156_3_0, slot_156_4_0 = slot_0_103_0(slot_156_2_0)

        if not slot_156_3_0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Erro ao decodificar '" .. arg_156_0 .. "': " .. tostring(slot_156_4_0)))
                end

                return
        end

        function slot_156_5_0(arg_157_0)
                if type(arg_157_0) ~= "table" then
                        return arg_157_0
                end

                local var_157_0 = {}

                for iter_157_0, iter_157_1 in pairs(arg_157_0) do
                        var_157_0[iter_157_0] = type(iter_157_1) == "table" and slot_156_5_0(iter_157_1) or iter_157_1
                end

                return var_157_0
        end

        if type(ant) ~= "table" then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Config", "Script ainda carregando. Aguarde e tente novamente."))
                end

                return
        end

        if type(hvh) ~= "table" then
                hvh = {}
        end

        if type(slot_0_86_0) ~= "table" then
                slot_0_86_0 = {}
        end

        if type(slot_0_87_0) ~= "table" then
                slot_0_87_0 = {}
        end

        if type(slot_0_88_0) ~= "table" then
                slot_0_88_0 = {}
        end

        if type(slot_0_1_0) ~= "table" then
                slot_0_1_0 = {}
        end

        if type(slot_0_60_0) ~= "table" then
                slot_0_60_0 = {}
        end

        if type(slot_0_94_0) ~= "table" then
                slot_0_94_0 = {}
        end

        if type(slot_0_95_0) ~= "table" then
                slot_0_95_0 = {}
        end

        if type(slot_0_96_0) ~= "table" then
                slot_0_96_0 = {}
        end

        if type(slot_0_97_0) ~= "table" then
                slot_0_97_0 = {}
        end

        if type(slot_0_89_0) ~= "table" then
                slot_0_89_0 = {}
        end

        if type(EnemyTrackerState) ~= "table" then
                EnemyTrackerState = {}
        end

        if type(slot_0_2_0) ~= "table" then
                slot_0_2_0 = {}
        end

        if type(G) ~= "table" then
                G = {}
        end

        if type(G.aimlock) ~= "table" then
                G.aimlock = {}
        end

        if type(G.tracers) ~= "table" then
                G.tracers = {}
        end

        if type(G.hitlogs) ~= "table" then
                G.hitlogs = {}
        end

        if slot_156_3_0.menu_settings then
                for iter_156_0 in pairs(slot_0_86_0) do
                        slot_0_86_0[iter_156_0] = nil
                end

                for iter_156_1, iter_156_2 in pairs(slot_156_3_0.menu_settings) do
                        slot_0_86_0[iter_156_1] = type(iter_156_2) == "table" and slot_156_5_0(iter_156_2) or iter_156_2
                end
        end

        if slot_156_3_0.home_settings then
                for iter_156_3 in pairs(slot_0_87_0) do
                        slot_0_87_0[iter_156_3] = nil
                end

                for iter_156_4, iter_156_5 in pairs(slot_156_3_0.home_settings) do
                        slot_0_87_0[iter_156_4] = type(iter_156_5) == "table" and slot_156_5_0(iter_156_5) or iter_156_5
                end

                slot_0_87_0.config_name_input = ""
                slot_0_87_0.show_save_confirm = false
                slot_0_87_0.show_load_confirm = false
                slot_0_87_0.show_update_confirm = false
                slot_0_87_0.show_delete_confirm = false
        end

        if slot_156_3_0.chat_spam_settings then
                for iter_156_6 in pairs(slot_0_88_0) do
                        slot_0_88_0[iter_156_6] = nil
                end

                for iter_156_7, iter_156_8 in pairs(slot_156_3_0.chat_spam_settings) do
                        slot_0_88_0[iter_156_7] = type(iter_156_8) == "table" and slot_156_5_0(iter_156_8) or iter_156_8
                end
        end

        if slot_156_3_0.funny_settings then
                for iter_156_9 in pairs(slot_0_1_0) do
                        slot_0_1_0[iter_156_9] = nil
                end

                for iter_156_10, iter_156_11 in pairs(slot_156_3_0.funny_settings) do
                        slot_0_1_0[iter_156_10] = type(iter_156_11) == "table" and slot_156_5_0(iter_156_11) or iter_156_11
                end
        end

        if slot_156_3_0.hvh then
                for iter_156_12 in pairs(hvh) do
                        hvh[iter_156_12] = nil
                end

                for iter_156_13, iter_156_14 in pairs(slot_156_3_0.hvh) do
                        hvh[iter_156_13] = type(iter_156_14) == "table" and slot_156_5_0(iter_156_14) or iter_156_14
                end
        end

        if slot_156_3_0.lang_settings then
                for iter_156_15 in pairs(slot_0_60_0) do
                        slot_0_60_0[iter_156_15] = nil
                end

                for iter_156_16, iter_156_17 in pairs(slot_156_3_0.lang_settings) do
                        slot_0_60_0[iter_156_16] = type(iter_156_17) == "table" and slot_156_5_0(iter_156_17) or iter_156_17
                end
        end

        if slot_156_3_0.hud_master_state then
                for iter_156_18 in pairs(slot_0_94_0) do
                        slot_0_94_0[iter_156_18] = nil
                end

                for iter_156_19, iter_156_20 in pairs(slot_156_3_0.hud_master_state) do
                        slot_0_94_0[iter_156_19] = type(iter_156_20) == "table" and slot_156_5_0(iter_156_20) or iter_156_20
                end
        end

        if slot_156_3_0.hud1_state then
                for iter_156_21 in pairs(slot_0_95_0) do
                        slot_0_95_0[iter_156_21] = nil
                end

                for iter_156_22, iter_156_23 in pairs(slot_156_3_0.hud1_state) do
                        slot_0_95_0[iter_156_22] = type(iter_156_23) == "table" and slot_156_5_0(iter_156_23) or iter_156_23
                end
        end

        if slot_156_3_0.hud2_state then
                for iter_156_24 in pairs(slot_0_96_0) do
                        slot_0_96_0[iter_156_24] = nil
                end

                for iter_156_25, iter_156_26 in pairs(slot_156_3_0.hud2_state) do
                        slot_0_96_0[iter_156_25] = type(iter_156_26) == "table" and slot_156_5_0(iter_156_26) or iter_156_26
                end
        end

        if slot_156_3_0.lua_keybinds_state then
                for iter_156_27 in pairs(slot_0_97_0) do
                        slot_0_97_0[iter_156_27] = nil
                end

                for iter_156_28, iter_156_29 in pairs(slot_156_3_0.lua_keybinds_state) do
                        slot_0_97_0[iter_156_28] = type(iter_156_29) == "table" and slot_156_5_0(iter_156_29) or iter_156_29
                end
        end

        if slot_156_3_0.killsay_settings then
                for iter_156_30 in pairs(slot_0_89_0) do
                        slot_0_89_0[iter_156_30] = nil
                end

                for iter_156_31, iter_156_32 in pairs(slot_156_3_0.killsay_settings) do
                        slot_0_89_0[iter_156_31] = type(iter_156_32) == "table" and slot_156_5_0(iter_156_32) or iter_156_32
                end
        end

        if slot_156_3_0.ant and type(slot_156_3_0.ant) == "table" then
                for iter_156_33 in pairs(ant) do
                        ant[iter_156_33] = nil
                end

                for iter_156_34, iter_156_35 in pairs(slot_156_3_0.ant) do
                        ant[iter_156_34] = type(iter_156_35) == "table" and slot_156_5_0(iter_156_35) or iter_156_35
                end
        end

        if slot_156_3_0.mmhelper and type(slot_156_3_0.mmhelper) == "table" then
                for iter_156_36, iter_156_37 in pairs(slot_156_3_0.mmhelper) do
                        EnemyTrackerState[iter_156_36] = iter_156_37
                end
        end

        if slot_156_3_0.games_state and type(slot_156_3_0.games_state) == "table" then
                for iter_156_38, iter_156_39 in pairs(slot_156_3_0.games_state) do
                        slot_0_2_0[iter_156_38] = iter_156_39
                end
        end

        if slot_156_3_0.aimlock then
                G.aimlock.enable = slot_156_3_0.aimlock.enable or false
                G.aimlock.disable_distance = slot_156_3_0.aimlock.disable_distance or 0
                G.aimlock.smooth = slot_156_3_0.aimlock.smooth or 50
                G.aimlock.show_fov = slot_156_3_0.aimlock.show_fov ~= nil and slot_156_3_0.aimlock.show_fov or true
                G.aimlock.fov_multiplier = slot_156_3_0.aimlock.fov_multiplier or 9
                G.aimlock.disable_if_multi = slot_156_3_0.aimlock.disable_if_multi or false
                G.aimlock.multi_distance = slot_156_3_0.aimlock.multi_distance or 200
                G.aimlock.fov_no_anim = slot_156_3_0.aimlock.fov_no_anim or false
        end

        if slot_156_3_0.tracers then
                G.tracers.enable = slot_156_3_0.tracers.enable or false
                G.tracers.trail_length = slot_156_3_0.tracers.trail_length or 35
                G.tracers.shift_speed = slot_156_3_0.tracers.shift_speed or 10
                G.tracers.color_hsv = slot_156_3_0.tracers.color_hsv or {
                        v = 1,
                        s = 1,
                        h = 120
                }
                G.tracers.line_thickness = slot_156_3_0.tracers.line_thickness or 5
                G.tracers.style = slot_156_3_0.tracers.style or 1
                G.tracers.animation = slot_156_3_0.tracers.animation or 1
                G.tracers.glow_intensity = slot_156_3_0.tracers.glow_intensity or 3
                G.tracers.particle_density = slot_156_3_0.tracers.particle_density or 15
        end

        if slot_156_3_0.hitlogs then
                G.hitlogs.enable = slot_156_3_0.hitlogs.enable or false
                G.hitlogs.show_hit = slot_156_3_0.hitlogs.show_hit ~= nil and slot_156_3_0.hitlogs.show_hit or true
                G.hitlogs.show_hurt = slot_156_3_0.hitlogs.show_hurt ~= nil and slot_156_3_0.hitlogs.show_hurt or true
                G.hitlogs.show_bomb = slot_156_3_0.hitlogs.show_bomb ~= nil and slot_156_3_0.hitlogs.show_bomb or true
                G.hitlogs.show_round = slot_156_3_0.hitlogs.show_round or false
                G.hitlogs.position_x = slot_156_3_0.hitlogs.position_x or 100
                G.hitlogs.position_y = slot_156_3_0.hitlogs.position_y or 400
                G.hitlogs.visual_style = slot_156_3_0.hitlogs.visual_style or 1
                G.hitlogs.animation_style = slot_156_3_0.hitlogs.animation_style or 1
        end

        if slot_156_3_0.menu_pos then
                slot_0_76_0 = slot_156_3_0.menu_pos.x or slot_0_76_0
                slot_0_77_0 = slot_156_3_0.menu_pos.y or slot_0_77_0
                slot_0_78_0 = slot_156_3_0.menu_pos.w or slot_0_78_0
                slot_0_79_0 = slot_156_3_0.menu_pos.h or slot_0_79_0
        end

        if slot_156_3_0.active_item_id and type(slot_156_3_0.active_item_id) == "string" then
                slot_0_83_0 = slot_156_3_0.active_item_id
        end

        if ant and ant.mode_index and ant.modes and ant.modes[ant.mode_index] then
                slot_156_6_0 = ant.modes[ant.mode_index]
                ant.pitch_min = slot_156_6_0.pitch_min
                ant.pitch_max = slot_156_6_0.pitch_max
                ant.pitch_jmin = slot_156_6_0.pitch_jmin
                ant.pitch_jmax = slot_156_6_0.pitch_jmax
                ant.yaw_min = slot_156_6_0.yaw_min
                ant.yaw_max = slot_156_6_0.yaw_max
                ant.yaw_jmin = slot_156_6_0.yaw_jmin
                ant.yaw_jmax = slot_156_6_0.yaw_jmax
                ant.speed = slot_156_6_0.speed
                ant.spin_speed = slot_156_6_0.spin_speed or 14
                ant._initialized = true

                if slot_0_110_0 then
                        slot_0_110_0.pitch_min = tostring(ant.pitch_min or 0)
                        slot_0_110_0.pitch_max = tostring(ant.pitch_max or 0)
                        slot_0_110_0.pitch_jmin = tostring(ant.pitch_jmin or 0)
                        slot_0_110_0.pitch_jmax = tostring(ant.pitch_jmax or 0)
                        slot_0_110_0.yaw_min = tostring(ant.yaw_min or 0)
                        slot_0_110_0.yaw_max = tostring(ant.yaw_max or 0)
                        slot_0_110_0.yaw_jmin = tostring(ant.yaw_jmin or 0)
                        slot_0_110_0.yaw_jmax = tostring(ant.yaw_jmax or 0)
                        slot_0_110_0.aa_speed = tostring(ant.speed or 0)
                        slot_0_110_0.aa_spin_speed = tostring(ant.spin_speed or 0)
                end
        end

        slot_0_60_0.current_language = slot_0_60_0.languages[slot_0_60_0.language_index]

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Config", "Config '" .. arg_156_0 .. "' carregada!"))
        end
end

function delete_config(arg_158_0)
        if not arg_158_0 or arg_158_0 == "" or arg_158_0 == "-" then
                return
        end

        local var_158_0 = slot_0_100_0 .. arg_158_0 .. ".json"

        if slot_0_104_0(var_158_0) then
                ffi.cdef("            bool __stdcall DeleteFileA(const char* lpFileName);\n        ")

                local var_158_1 = ffi.cast("bool(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "DeleteFileA"))

                if var_158_1 then
                        var_158_1(var_158_0 .. "\x00")
                end
        end

        local var_158_2 = slot_0_104_0(slot_0_100_0 .. "config_index.txt")

        if var_158_2 then
                local var_158_3 = ""

                for iter_158_0 in var_158_2:gmatch("[^\r\n]+") do
                        local var_158_4 = iter_158_0:match("^%s*(.-)%s*$")

                        if var_158_4 ~= "" and var_158_4 ~= arg_158_0 then
                                var_158_3 = var_158_3 .. var_158_4 .. "\n"
                        end
                end

                slot_0_105_0(slot_0_100_0 .. "config_index.txt", var_158_3, false)
        end

        update_config_list()

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Config", "Config '" .. arg_158_0 .. "' removida."))
        end
end

setup_config_directory()
update_config_list()

if events and events.present_queue and events.present_queue.add then
        events.present_queue:add(function()
                if not draw or not draw.surface then
                        return
                end

                slot_159_0_0 = game and game.engine

                if not slot_159_0_0 or not slot_159_0_0.get_screen_size then
                        return
                end

                slot_159_1_0 = EnemyTrackerState

                if not slot_159_1_0 or not slot_159_1_0.enabled then
                        return
                end

                if not slot_159_1_0.mini_ui_enabled then
                        return
                end

                slot_159_1_0.mini_ui_drag = slot_159_1_0.mini_ui_drag or {}
                slot_159_2_0 = slot_159_1_0.mini_ui_drag
                slot_159_2_0.x = slot_159_2_0.x or 1400
                slot_159_2_0.y = slot_159_2_0.y or 200
                slot_159_3_0 = slot_159_2_0.x
                slot_159_4_0 = slot_159_2_0.y
                slot_159_5_0 = 260
                slot_159_6_0 = 700
                slot_159_7_0 = draw.surface

                slot_159_7_0:add_rect_filled_rounded(draw.rect(slot_159_3_0, slot_159_4_0, slot_159_3_0 + slot_159_5_0, slot_159_4_0 + slot_159_6_0), draw.color(15, 15, 25, 220), 8)
                slot_159_7_0:add_rect_rounded(draw.rect(slot_159_3_0, slot_159_4_0, slot_159_3_0 + slot_159_5_0, slot_159_4_0 + slot_159_6_0), draw.color(120, 180, 255, 255), 8, 2)
                slot_159_7_0:add_rect_filled_rounded(draw.rect(slot_159_3_0, slot_159_4_0, slot_159_3_0 + slot_159_5_0, slot_159_4_0 + 35), draw.color(25, 35, 60, 240), 8, 2)
                slot_159_7_0:add_rect_rounded(draw.rect(slot_159_3_0, slot_159_4_0, slot_159_3_0 + slot_159_5_0, slot_159_4_0 + 35), draw.color(80, 140, 220, 255), 8, 1)
                slot_159_7_0:add_rect_filled(draw.rect(slot_159_3_0 + 8, slot_159_4_0 + 35, slot_159_3_0 + slot_159_5_0 - 8, slot_159_4_0 + 36), draw.color(120, 180, 255, 150))

                slot_159_8_0 = 35
                slot_159_9_0 = slot_159_3_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_3_0 + slot_159_5_0 and slot_159_4_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_4_0 + slot_159_8_0

                if slot_0_65_0.pressed and slot_159_9_0 and not slot_159_1_0.mini_ui_drag.dragging then
                        slot_159_1_0.mini_ui_drag.dragging = true
                        slot_159_1_0.mini_ui_drag.offset_x = slot_0_65_0.x - slot_159_3_0
                        slot_159_1_0.mini_ui_drag.offset_y = slot_0_65_0.y - slot_159_4_0
                end

                if slot_0_65_0.released then
                        slot_159_1_0.mini_ui_drag.dragging = false
                end

                if slot_159_1_0.mini_ui_drag.dragging then
                        slot_159_2_0.x = slot_0_65_0.x - slot_159_1_0.mini_ui_drag.offset_x
                        slot_159_2_0.y = slot_0_65_0.y - slot_159_1_0.mini_ui_drag.offset_y
                        slot_159_10_1, slot_159_11_1 = slot_159_0_0:get_screen_size()
                        slot_159_2_0.x = math.max(0, math.min(slot_159_10_1 - slot_159_5_0, slot_159_2_0.x))
                        slot_159_2_0.y = math.max(0, math.min(slot_159_11_1 - slot_159_6_0, slot_159_2_0.y))
                end

                slot_159_10_0 = slot_159_3_0 + slot_159_5_0 - 20

                if slot_0_65_0.pressed and slot_159_10_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_10_0 + 15 and slot_0_65_0.y >= slot_159_4_0 + 3 and slot_0_65_0.y <= slot_159_4_0 + 18 then
                        slot_159_1_0.mini_ui_enabled = false
                end

                slot_159_7_0:add_rect_filled(draw.rect(slot_159_10_0, slot_159_4_0 + 3, slot_159_10_0 + 15, slot_159_4_0 + 18), draw.color(255, 60, 60, 200))
                slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_10_0 + 3, slot_159_4_0 + 5, "?", draw.color(255, 255, 255, 255))
                slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_3_0 + 8, slot_159_4_0 + 6, "? ENEMY TRACKER ?", draw.color(180, 220, 255, 255))

                slot_159_11_0 = slot_159_4_0 + 25
                slot_159_12_0 = 16
                slot_159_13_0 = 0

                if slot_159_1_0.cache and #slot_159_1_0.cache > 0 then
                        for iter_159_0, iter_159_1 in ipairs(slot_159_1_0.cache) do
                                if slot_159_12_0 <= slot_159_13_0 then
                                        break
                                end

                                slot_159_19_1 = iter_159_1.name or "Unknown"
                                slot_159_20_0 = slot_159_1_0.selected_names and slot_159_1_0.selected_names[slot_159_19_1]
                                slot_159_21_0 = slot_159_20_0 and 85 or 25

                                if slot_159_11_0 + slot_159_21_0 > slot_159_4_0 + slot_159_6_0 - 5 then
                                        break
                                end

                                slot_159_22_0 = slot_159_11_0
                                slot_159_11_0 = slot_159_11_0 + slot_159_21_0
                                slot_159_13_0 = slot_159_13_0 + 1

                                slot_159_7_0:add_rect_filled(draw.rect(slot_159_3_0 + 5, slot_159_22_0, slot_159_3_0 + slot_159_5_0 - 5, slot_159_22_0 + slot_159_21_0 - 2), draw.color(35, 40, 55, 120))
                                slot_159_7_0:add_rect(draw.rect(slot_159_3_0 + 5, slot_159_22_0, slot_159_3_0 + slot_159_5_0 - 5, slot_159_22_0 + slot_159_21_0 - 2), draw.color(60, 100, 150, 100), 1)

                                slot_159_23_0 = slot_159_3_0 + 10
                                slot_159_24_0 = slot_159_22_0 + 2
                                slot_159_25_0 = 12

                                slot_159_7_0:add_rect_filled(draw.rect(slot_159_23_0, slot_159_24_0, slot_159_23_0 + slot_159_25_0, slot_159_24_0 + slot_159_25_0), draw.color(50, 50, 65, 200))
                                slot_159_7_0:add_rect(draw.rect(slot_159_23_0, slot_159_24_0, slot_159_23_0 + slot_159_25_0, slot_159_24_0 + slot_159_25_0), draw.color(100, 150, 200, 255), 1)

                                if slot_159_20_0 then
                                        slot_159_7_0:add_rect_filled(draw.rect(slot_159_23_0 + 2, slot_159_24_0 + 2, slot_159_23_0 + slot_159_25_0 - 2, slot_159_24_0 + slot_159_25_0 - 2), draw.color(100, 255, 100, 255))
                                        slot_159_7_0:add_rect(draw.rect(slot_159_23_0 + 2, slot_159_24_0 + 2, slot_159_23_0 + slot_159_25_0 - 2, slot_159_24_0 + slot_159_25_0 - 2), draw.color(150, 255, 150, 255), 1)
                                end

                                if slot_0_65_0.pressed and slot_159_23_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_23_0 + slot_159_25_0 and slot_159_24_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_24_0 + slot_159_25_0 then
                                        slot_159_1_0.selected_names = slot_159_1_0.selected_names or {}
                                        slot_159_1_0.enemy_features = slot_159_1_0.enemy_features or {}

                                        if slot_159_20_0 then
                                                slot_159_1_0.selected_names[slot_159_19_1] = nil
                                                slot_159_1_0.tags[slot_159_19_1] = nil
                                                slot_159_1_0.enemy_features[slot_159_19_1] = nil
                                        else
                                                slot_159_1_0.selected_names[slot_159_19_1] = true
                                                slot_159_1_0.tags[slot_159_19_1] = slot_159_1_0.tags[slot_159_19_1] or "rage"
                                                slot_159_1_0.enemy_features[slot_159_19_1] = slot_159_1_0.enemy_features[slot_159_19_1] or "None"
                                        end
                                end

                                slot_159_26_0 = slot_159_20_0 and draw.color(255, 220, 100, 255) or draw.color(220, 220, 220, 255)

                                if slot_159_20_0 then
                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_23_0 + slot_159_25_0 + 3, slot_159_22_0 - 1, "? ", draw.color(255, 200, 50, 255))
                                end

                                slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_23_0 + slot_159_25_0 + 4, slot_159_22_0, slot_159_19_1, slot_159_26_0)

                                if slot_159_20_0 then
                                        slot_159_27_0 = slot_159_22_0 + 28
                                        slot_159_28_0 = slot_159_23_0 + slot_159_25_0 + 15
                                        slot_159_29_0 = slot_159_1_0.tags[slot_159_19_1] == "rage" and draw.color(150, 120, 200, 255) or draw.color(80, 80, 80, 200)

                                        slot_159_7_0:add_rect_filled(draw.rect(slot_159_28_0, slot_159_27_0, slot_159_28_0 + 35, slot_159_27_0 + 15), slot_159_29_0)
                                        slot_159_7_0:add_rect(draw.rect(slot_159_28_0, slot_159_27_0, slot_159_28_0 + 35, slot_159_27_0 + 15), draw.color(120, 100, 160, 255), 1)

                                        slot_159_30_0 = theme.fonts.small:get_text_size("RAGE").x

                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_28_0 + (35 - slot_159_30_0) / 2, slot_159_27_0 + 2, "RAGE", draw.color(255, 255, 255, 255))

                                        if slot_0_65_0.pressed and slot_159_28_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_28_0 + 35 and slot_159_27_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_27_0 + 15 then
                                                slot_159_1_0.tags[slot_159_19_1] = "rage"
                                        end

                                        slot_159_31_0 = slot_159_28_0 + 40
                                        slot_159_32_0 = slot_159_1_0.tags[slot_159_19_1] == "legit" and draw.color(150, 120, 200, 255) or draw.color(80, 80, 80, 200)

                                        slot_159_7_0:add_rect_filled(draw.rect(slot_159_31_0, slot_159_27_0, slot_159_31_0 + 35, slot_159_27_0 + 15), slot_159_32_0)
                                        slot_159_7_0:add_rect(draw.rect(slot_159_31_0, slot_159_27_0, slot_159_31_0 + 35, slot_159_27_0 + 15), draw.color(120, 100, 160, 255), 1)

                                        slot_159_33_0 = theme.fonts.small:get_text_size("LEGIT").x

                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_31_0 + (35 - slot_159_33_0) / 2, slot_159_27_0 + 2, "LEGIT", draw.color(255, 255, 255, 255))

                                        if slot_0_65_0.pressed and slot_159_31_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_31_0 + 35 and slot_159_27_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_27_0 + 15 then
                                                slot_159_1_0.tags[slot_159_19_1] = "legit"
                                        end

                                        slot_159_34_0 = slot_159_31_0 + 40
                                        slot_159_35_0 = slot_159_1_0.tags[slot_159_19_1] == "legit-hacking" and draw.color(150, 120, 200, 255) or draw.color(80, 80, 80, 200)

                                        slot_159_7_0:add_rect_filled(draw.rect(slot_159_34_0, slot_159_27_0, slot_159_34_0 + 40, slot_159_27_0 + 15), slot_159_35_0)
                                        slot_159_7_0:add_rect(draw.rect(slot_159_34_0, slot_159_27_0, slot_159_34_0 + 40, slot_159_27_0 + 15), draw.color(120, 100, 160, 255), 1)

                                        slot_159_36_0 = theme.fonts.small:get_text_size("L-HACK").x

                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_34_0 + (40 - slot_159_36_0) / 2, slot_159_27_0 + 2, "L-HACK", draw.color(255, 255, 255, 255))

                                        if slot_0_65_0.pressed and slot_159_34_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_34_0 + 40 and slot_159_27_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_27_0 + 15 then
                                                slot_159_1_0.tags[slot_159_19_1] = "legit-hacking"
                                        end

                                        slot_159_37_0 = slot_159_22_0 + 52

                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_28_0, slot_159_37_0, "Auto:", draw.color(180, 180, 180, 255))

                                        slot_159_38_0 = slot_159_28_0 + 45
                                        slot_159_39_0 = slot_159_1_0.enemy_features[slot_159_19_1] == "None" and draw.color(150, 120, 200, 255) or draw.color(80, 80, 80, 200)

                                        slot_159_7_0:add_rect_filled(draw.rect(slot_159_38_0, slot_159_37_0, slot_159_38_0 + 35, slot_159_37_0 + 16), slot_159_39_0)
                                        slot_159_7_0:add_rect(draw.rect(slot_159_38_0, slot_159_37_0, slot_159_38_0 + 35, slot_159_37_0 + 16), draw.color(120, 100, 160, 255), 1)

                                        slot_159_40_0 = theme.fonts.small:get_text_size("NONE").x

                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_38_0 + (35 - slot_159_40_0) / 2, slot_159_37_0 + 3, "NONE", draw.color(255, 255, 255, 255))

                                        if slot_0_65_0.pressed and slot_159_38_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_38_0 + 35 and slot_159_37_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_37_0 + 16 then
                                                slot_159_1_0.enemy_features[slot_159_19_1] = "None"
                                        end

                                        slot_159_41_0 = slot_159_38_0 + 42
                                        slot_159_42_0 = slot_159_1_0.enemy_features[slot_159_19_1] == "Rage" and draw.color(150, 120, 200, 255) or draw.color(80, 80, 80, 200)

                                        slot_159_7_0:add_rect_filled(draw.rect(slot_159_41_0, slot_159_37_0, slot_159_41_0 + 35, slot_159_37_0 + 16), slot_159_42_0)
                                        slot_159_7_0:add_rect(draw.rect(slot_159_41_0, slot_159_37_0, slot_159_41_0 + 35, slot_159_37_0 + 16), draw.color(120, 100, 160, 255), 1)

                                        slot_159_43_0 = theme.fonts.small:get_text_size("AA").x

                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_41_0 + (35 - slot_159_43_0) / 2, slot_159_37_0 + 3, "AA", draw.color(255, 255, 255, 255))

                                        if slot_0_65_0.pressed and slot_159_41_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_41_0 + 35 and slot_159_37_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_37_0 + 16 then
                                                slot_159_1_0.enemy_features[slot_159_19_1] = "Rage"
                                        end

                                        slot_159_44_0 = slot_159_41_0 + 42
                                        slot_159_45_0 = slot_159_1_0.enemy_features[slot_159_19_1] == "Legit" and draw.color(150, 120, 200, 255) or draw.color(80, 80, 80, 200)

                                        slot_159_7_0:add_rect_filled(draw.rect(slot_159_44_0, slot_159_37_0, slot_159_44_0 + 35, slot_159_37_0 + 16), slot_159_45_0)
                                        slot_159_7_0:add_rect(draw.rect(slot_159_44_0, slot_159_37_0, slot_159_44_0 + 35, slot_159_37_0 + 16), draw.color(120, 100, 160, 255), 1)

                                        slot_159_46_0 = theme.fonts.small:get_text_size("TRG").x

                                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_44_0 + (35 - slot_159_46_0) / 2, slot_159_37_0 + 3, "TRG", draw.color(255, 255, 255, 255))

                                        if slot_0_65_0.pressed and slot_159_44_0 <= slot_0_65_0.x and slot_0_65_0.x <= slot_159_44_0 + 35 and slot_159_37_0 <= slot_0_65_0.y and slot_0_65_0.y <= slot_159_37_0 + 16 then
                                                slot_159_1_0.enemy_features[slot_159_19_1] = "Legit"
                                        end
                                end
                        end
                else
                        slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_3_0 + 5, slot_159_11_0, "No enemies", draw.color(120, 120, 120, 255))
                end

                slot_159_14_0 = slot_159_4_0 + slot_159_6_0 - 20

                slot_159_7_0:add_rect_filled(draw.rect(slot_159_3_0, slot_159_14_0, slot_159_3_0 + slot_159_5_0, slot_159_4_0 + slot_159_6_0), draw.color(30, 40, 55, 200))
                slot_159_7_0:add_rect(draw.rect(slot_159_3_0, slot_159_14_0, slot_159_3_0 + slot_159_5_0, slot_159_4_0 + slot_159_6_0), draw.color(80, 120, 180, 255), 1)

                slot_159_15_0 = 0

                if slot_159_1_0.selected_names then
                        for iter_159_2 in pairs(slot_159_1_0.selected_names) do
                                slot_159_15_0 = slot_159_15_0 + 1
                        end
                end

                slot_159_16_0 = slot_159_1_0.mode_premier and tostring(#(slot_159_1_0.cache or {})) or "infinite"

                slot_0_58_0(slot_159_7_0, theme.fonts.small, slot_159_3_0 + 5, slot_159_14_0 + 2, string.format("Selected: %d/%s", slot_159_15_0, slot_159_16_0), draw.color(100, 200, 100, 255))
        end)
end

function render_mmhelper_tab(arg_160_0, arg_160_1, arg_160_2, arg_160_3, arg_160_4, arg_160_5, arg_160_6, arg_160_7, arg_160_8, arg_160_9)
        return
end

function G.render_tracers_tab(arg_161_0, arg_161_1, arg_161_2, arg_161_3, arg_161_4, arg_161_5, arg_161_6, arg_161_7, arg_161_8, arg_161_9)
        slot_161_10_2 = arg_161_2
        slot_161_11_0 = game and game.global_vars and (game.global_vars.real_time or game.global_vars.curtime) or 0

        slot_0_58_0(arg_161_0, theme.fonts.category, arg_161_1, slot_161_10_2, slot_0_63_0("tracers_title"), theme.colors.text_light:mod_a(arg_161_8))

        slot_161_10_1 = slot_161_10_2 + 30
        G.tracers.enable = slot_0_125_0(arg_161_0, arg_161_1, slot_161_10_1, slot_0_63_0("tracers_enable"), G.tracers.enable, arg_161_5, arg_161_6, arg_161_7, arg_161_8)
        slot_161_10_0 = slot_161_10_1 + 34

        if G.tracers.enable then
                arg_161_0:add_rect_filled(draw.rect(arg_161_1, slot_161_10_0, arg_161_1 + arg_161_3, slot_161_10_0 + 1), theme.colors.border_inner:mod_a(arg_161_8 * 0.5))

                slot_161_10_0 = slot_161_10_0 + 15

                slot_0_58_0(arg_161_0, theme.fonts.item, arg_161_1, slot_161_10_0, slot_0_63_0("tracers_settings"), theme.colors.text_light:mod_a(arg_161_8))

                slot_161_10_0 = slot_161_10_0 + 26
                G.tracers.trail_length = slot_0_121_0(arg_161_0, "tracers_length", arg_161_1, slot_161_10_0, arg_161_3, slot_0_63_0("tracers_trail_length"), 10, 100, G.tracers.trail_length, arg_161_5, arg_161_6, arg_161_8, "%.0f", arg_161_7)
                slot_161_10_0 = slot_161_10_0 + 50
                G.tracers.line_thickness = slot_0_121_0(arg_161_0, "tracers_thickness", arg_161_1, slot_161_10_0, arg_161_3, slot_0_63_0("tracers_line_thickness"), 1, 15, G.tracers.line_thickness, arg_161_5, arg_161_6, arg_161_8, "%.0f", arg_161_7)
                slot_161_10_0 = slot_161_10_0 + 50

                arg_161_0:add_rect_filled(draw.rect(arg_161_1, slot_161_10_0, arg_161_1 + arg_161_3, slot_161_10_0 + 1), theme.colors.border_inner:mod_a(arg_161_8 * 0.5))

                slot_161_10_0 = slot_161_10_0 + 15

                slot_0_58_0(arg_161_0, theme.fonts.item, arg_161_1, slot_161_10_0, slot_0_63_0("tracers_style"), theme.colors.text_light:mod_a(arg_161_8))

                slot_161_10_0 = slot_161_10_0 + 26
                slot_161_12_0 = slot_0_63_0("tracers_style_options") or {
                        "Simple",
                        "Neon Glow",
                        "Gradient",
                        "Particles",
                        "Laser Beam"
                }
                slot_161_10_0 = slot_161_10_0 + slot_0_128_0(arg_161_0, "tracers_style", arg_161_1, slot_161_10_0, arg_161_3, 32, slot_161_12_0, G.tracers, "style", arg_161_5, arg_161_6, arg_161_7, arg_161_8) + 10

                if G.tracers.style == 2 then
                        G.tracers.glow_intensity = slot_0_121_0(arg_161_0, "tracers_glow", arg_161_1, slot_161_10_0, arg_161_3, slot_0_63_0("tracers_glow_intensity"), 1, 5, G.tracers.glow_intensity, arg_161_5, arg_161_6, arg_161_8, "%.0f", arg_161_7)
                        slot_161_10_0 = slot_161_10_0 + 50
                elseif G.tracers.style == 4 then
                        G.tracers.particle_density = slot_0_121_0(arg_161_0, "tracers_particles", arg_161_1, slot_161_10_0, arg_161_3, slot_0_63_0("tracers_particle_density"), 5, 30, G.tracers.particle_density, arg_161_5, arg_161_6, arg_161_8, "%.0f", arg_161_7)
                        slot_161_10_0 = slot_161_10_0 + 50
                end

                arg_161_0:add_rect_filled(draw.rect(arg_161_1, slot_161_10_0, arg_161_1 + arg_161_3, slot_161_10_0 + 1), theme.colors.border_inner:mod_a(arg_161_8 * 0.5))

                slot_161_10_0 = slot_161_10_0 + 15

                slot_0_58_0(arg_161_0, theme.fonts.item, arg_161_1, slot_161_10_0, slot_0_63_0("tracers_animation"), theme.colors.text_light:mod_a(arg_161_8))

                slot_161_10_0 = slot_161_10_0 + 26
                slot_161_14_0 = slot_0_63_0("tracers_animation_options") or {
                        "None",
                        "Pulse",
                        "Wave",
                        "Rainbow",
                        "Glitch"
                }
                slot_161_10_0 = slot_161_10_0 + slot_0_128_0(arg_161_0, "tracers_anim", arg_161_1, slot_161_10_0, arg_161_3, 32, slot_161_14_0, G.tracers, "animation", arg_161_5, arg_161_6, arg_161_7, arg_161_8) + 10

                arg_161_0:add_rect_filled(draw.rect(arg_161_1, slot_161_10_0, arg_161_1 + arg_161_3, slot_161_10_0 + 1), theme.colors.border_inner:mod_a(arg_161_8 * 0.5))

                slot_161_10_0 = slot_161_10_0 + 15

                slot_0_58_0(arg_161_0, theme.fonts.item, arg_161_1, slot_161_10_0, slot_0_63_0("tracers_color"), theme.colors.text_light:mod_a(arg_161_8))

                slot_161_16_0 = {
                        h = 22,
                        w = 22,
                        x = arg_161_1 + arg_161_3 - 22,
                        y = slot_161_10_0
                }
                slot_161_17_0 = slot_0_56_0(G.tracers.color_hsv.h, G.tracers.color_hsv.s, G.tracers.color_hsv.v)

                arg_161_0:add_rect_filled(draw.rect(slot_161_16_0.x, slot_161_16_0.y, slot_161_16_0.x + slot_161_16_0.w, slot_161_16_0.y + slot_161_16_0.h), slot_161_17_0:mod_a(arg_161_8))
                arg_161_0:add_rect(draw.rect(slot_161_16_0.x, slot_161_16_0.y, slot_161_16_0.x + slot_161_16_0.w, slot_161_16_0.y + slot_161_16_0.h), theme.colors.border_inner:mod_a(arg_161_8))

                if arg_161_7 and slot_0_57_0(slot_161_16_0.x, slot_161_16_0.y, slot_161_16_0.w, slot_161_16_0.h, arg_161_5, arg_161_6) and not color_picker_open then
                        color_picker_open = true
                        color_picker_target = "tracers_color"
                end

                slot_161_10_0 = slot_161_10_0 + 32

                arg_161_0:add_rect_filled(draw.rect(arg_161_1, slot_161_10_0, arg_161_1 + arg_161_3, slot_161_10_0 + 1), theme.colors.border_inner:mod_a(arg_161_8 * 0.5))

                slot_161_10_0 = slot_161_10_0 + 15

                slot_0_58_0(arg_161_0, theme.fonts.item, arg_161_1, slot_161_10_0, slot_0_63_0("tracers_preview"), theme.colors.text_light:mod_a(arg_161_8))

                slot_161_19_0 = ({
                        "None",
                        "Pulse",
                        "Wave",
                        "Rainbow",
                        "Glitch"
                })[G.tracers.animation] or "None"

                slot_0_58_0(arg_161_0, theme.fonts.item, arg_161_1 + arg_161_3 - 50, slot_161_10_0, slot_161_19_0, theme.colors.accent:mod_a(arg_161_8 * 0.7))

                slot_161_10_0 = slot_161_10_0 + 26
                slot_161_20_0 = 120
                slot_161_21_0 = draw.color(20, 20, 25, 255)

                arg_161_0:add_rect_filled_rounded(draw.rect(arg_161_1, slot_161_10_0, arg_161_1 + arg_161_3, slot_161_10_0 + slot_161_20_0), slot_161_21_0:mod_a(arg_161_8), 6)

                slot_161_23_0 = ({
                        "Simple",
                        "Neon Glow",
                        "Gradient",
                        "Particles",
                        "Laser"
                })[G.tracers.style] or "Simple"

                slot_0_58_0(arg_161_0, theme.fonts.small, arg_161_1 + 8, slot_161_10_0 + 6, slot_161_23_0, theme.colors.text_light:mod_a(arg_161_8 * 0.5))

                slot_161_24_0 = slot_161_10_0 + slot_161_20_0 / 2
                slot_161_25_0 = 12

                for iter_161_0 = 0, slot_161_25_0 - 1 do
                        slot_161_30_0 = iter_161_0 / slot_161_25_0
                        slot_161_31_0 = arg_161_1 + 20 + (arg_161_3 - 40) * slot_161_30_0
                        slot_161_32_0 = arg_161_1 + 20 + (arg_161_3 - 40) * ((iter_161_0 + 1) / slot_161_25_0)
                        slot_161_33_0 = math.sin(slot_161_11_0 * 2 + slot_161_30_0 * 6) * 20
                        slot_161_34_0 = math.sin(slot_161_11_0 * 2 + (iter_161_0 + 1) / slot_161_25_0 * 6) * 20
                        slot_161_35_0 = slot_161_24_0 + slot_161_33_0
                        slot_161_36_0 = slot_161_24_0 + slot_161_34_0
                        slot_161_37_0 = draw.vec2(slot_161_31_0, slot_161_35_0)
                        slot_161_38_0 = draw.vec2(slot_161_32_0, slot_161_36_0)
                        slot_161_39_0 = math.floor(255 * (1 - slot_161_30_0))
                        slot_161_40_0 = G.tracers.color_hsv.h
                        slot_161_41_0 = G.tracers.color_hsv.s
                        slot_161_42_0 = G.tracers.color_hsv.v

                        if G.tracers.animation == 2 then
                                slot_161_39_0 = math.floor(slot_161_39_0 * (0.5 + 0.5 * math.sin(slot_161_11_0 * 6 + iter_161_0 * 0.4)))
                        elseif G.tracers.animation == 3 then
                                slot_161_39_0 = math.floor(slot_161_39_0 * (0.6 + 0.4 * math.sin(slot_161_11_0 * 4 - iter_161_0 * 0.6)))
                        elseif G.tracers.animation == 4 then
                                slot_161_40_0 = (slot_161_11_0 * 180 + iter_161_0 * 60) % 360
                                slot_161_41_0 = 1
                                slot_161_42_0 = 1
                        elseif G.tracers.animation == 5 and math.sin(slot_161_11_0 * 20 + iter_161_0) > 0.6 then
                                slot_161_39_0 = math.floor(slot_161_39_0 * (0.3 + math.random() * 0.7))
                                slot_161_42_0 = 0.5 + math.random() * 0.5
                        end

                        slot_161_43_0 = slot_0_56_0(slot_161_40_0, slot_161_41_0, slot_161_42_0):mod_a(slot_161_39_0)

                        if G.tracers.style == 1 then
                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_43_0, G.tracers.line_thickness)
                        elseif G.tracers.style == 2 then
                                for iter_161_1 = G.tracers.glow_intensity, 1, -1 do
                                        slot_161_48_1 = math.floor(slot_161_39_0 * (0.3 / iter_161_1))
                                        slot_161_49_1 = slot_0_56_0(slot_161_40_0, slot_161_41_0, slot_161_42_0):mod_a(slot_161_48_1)

                                        arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_49_1, G.tracers.line_thickness + iter_161_1 * 3)
                                end

                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_43_0, G.tracers.line_thickness)
                        elseif G.tracers.style == 3 then
                                slot_161_44_2 = slot_0_56_0(slot_161_40_0, math.min(1, slot_161_41_0 * 1.2), math.min(1, slot_161_42_0 * 1.3)):mod_a(slot_161_39_0)

                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_44_2, G.tracers.line_thickness - 1)

                                slot_161_45_1 = slot_0_56_0(slot_161_40_0, slot_161_41_0, slot_161_42_0 * 0.6):mod_a(math.floor(slot_161_39_0 * 0.8))

                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_45_1, G.tracers.line_thickness + 2)
                        elseif G.tracers.style == 4 then
                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_43_0, G.tracers.line_thickness * 0.5)

                                slot_161_44_1 = 5

                                for iter_161_2 = 0, slot_161_44_1 do
                                        slot_161_49_0 = iter_161_2 / slot_161_44_1
                                        slot_161_50_0 = slot_161_31_0 + (slot_161_32_0 - slot_161_31_0) * slot_161_49_0
                                        slot_161_51_0 = slot_161_35_0 + (slot_161_36_0 - slot_161_35_0) * slot_161_49_0
                                        slot_161_52_0 = 2.5 + math.sin(slot_161_11_0 * 12 + iter_161_2 + iter_161_0) * 2

                                        arg_161_0:add_circle_filled(draw.vec2(slot_161_50_0, slot_161_51_0), slot_161_52_0, slot_161_43_0, 8)
                                end
                        elseif G.tracers.style == 5 then
                                slot_161_44_0 = slot_0_56_0(0, 0, 1):mod_a(math.floor(slot_161_39_0 * 0.4))

                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_44_0, G.tracers.line_thickness + 4)

                                slot_161_45_0 = slot_0_56_0(slot_161_40_0, slot_161_41_0, math.min(1, slot_161_42_0 * 1.2)):mod_a(slot_161_39_0)

                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_45_0, G.tracers.line_thickness)

                                slot_161_46_0 = slot_0_56_0(0, 0, 1):mod_a(slot_161_39_0)

                                arg_161_0:add_line(slot_161_37_0, slot_161_38_0, slot_161_46_0, math.max(1, G.tracers.line_thickness - 2))
                        end
                end

                arg_161_0:add_rect_rounded(draw.rect(arg_161_1, slot_161_10_0, arg_161_1 + arg_161_3, slot_161_10_0 + slot_161_20_0), theme.colors.border_inner:mod_a(arg_161_8), 6)

                slot_161_10_0 = slot_161_10_0 + slot_161_20_0 + 10
        end

        G.tab_heights = G.tab_heights or {}
        G.tab_heights.Tracers = math.max(0, slot_161_10_0 - arg_161_2 + 20)
end

function G.render_hc_helper_tab(arg_162_0, arg_162_1, arg_162_2, arg_162_3, arg_162_4, arg_162_5, arg_162_6, arg_162_7, arg_162_8, arg_162_9)
        return
end

function G.render_hitlogs_tab(arg_163_0, arg_163_1, arg_163_2, arg_163_3, arg_163_4, arg_163_5, arg_163_6, arg_163_7, arg_163_8, arg_163_9)
        slot_163_10_2 = arg_163_2

        slot_0_58_0(arg_163_0, theme.fonts.category, arg_163_1, slot_163_10_2, slot_0_63_0("hitlogs_title"), theme.colors.text_light:mod_a(arg_163_8))

        slot_163_10_1 = slot_163_10_2 + 30
        slot_163_11_0 = G.hitlogs.enable
        G.hitlogs.enable = slot_0_125_0(arg_163_0, arg_163_1, slot_163_10_1, slot_0_63_0("hitlogs_enable"), G.hitlogs.enable, arg_163_5, arg_163_6, arg_163_7, arg_163_8)
        slot_163_10_0 = slot_163_10_1 + 34

        if G.hitlogs.enable and not slot_163_11_0 then
                G.hitlogs.demo_shown = false
                G.hitlogs.demo_start_time = nil
                G.hitlogs.data = {}
        end

        if G.hitlogs.enable then
                arg_163_0:add_rect_filled(draw.rect(arg_163_1, slot_163_10_0, arg_163_1 + arg_163_3, slot_163_10_0 + 1), theme.colors.border_inner:mod_a(arg_163_8 * 0.5))

                slot_163_10_0 = slot_163_10_0 + 15
                G.hitlogs.show_hit = slot_0_119_0(arg_163_0, arg_163_1, slot_163_10_0, slot_0_63_0("hitlogs_show_hit"), G.hitlogs.show_hit, arg_163_5, arg_163_6, arg_163_7, arg_163_8)
                slot_163_10_0 = slot_163_10_0 + 24
                G.hitlogs.show_hurt = slot_0_119_0(arg_163_0, arg_163_1, slot_163_10_0, slot_0_63_0("hitlogs_show_hurt"), G.hitlogs.show_hurt, arg_163_5, arg_163_6, arg_163_7, arg_163_8)
                slot_163_10_0 = slot_163_10_0 + 24
                G.hitlogs.show_bomb = slot_0_119_0(arg_163_0, arg_163_1, slot_163_10_0, slot_0_63_0("hitlogs_show_bomb"), G.hitlogs.show_bomb, arg_163_5, arg_163_6, arg_163_7, arg_163_8)
                slot_163_10_0 = slot_163_10_0 + 24
                G.hitlogs.show_round = slot_0_119_0(arg_163_0, arg_163_1, slot_163_10_0, slot_0_63_0("hitlogs_show_round"), G.hitlogs.show_round, arg_163_5, arg_163_6, arg_163_7, arg_163_8)
                slot_163_10_0 = slot_163_10_0 + 30

                arg_163_0:add_rect_filled(draw.rect(arg_163_1, slot_163_10_0, arg_163_1 + arg_163_3, slot_163_10_0 + 1), theme.colors.border_inner:mod_a(arg_163_8 * 0.5))

                slot_163_10_0 = slot_163_10_0 + 15

                slot_0_58_0(arg_163_0, theme.fonts.item, arg_163_1, slot_163_10_0, slot_0_63_0("hitlogs_visual_style"), theme.colors.text_light:mod_a(arg_163_8))

                slot_163_10_0 = slot_163_10_0 + 26
                slot_163_12_0 = slot_0_63_0("hitlogs_visual_styles") or {
                        "Simple",
                        "Box",
                        "Glow",
                        "Gradient",
                        "Neon"
                }
                slot_163_10_0 = slot_163_10_0 + (slot_0_128_0(arg_163_0, "hitlogs_vstyle", arg_163_1, slot_163_10_0, arg_163_3, 28, slot_163_12_0, G.hitlogs, "visual_style", arg_163_5, arg_163_6, arg_163_7, arg_163_8) or 28) + 12

                slot_0_58_0(arg_163_0, theme.fonts.item, arg_163_1, slot_163_10_0, slot_0_63_0("hitlogs_animation"), theme.colors.text_light:mod_a(arg_163_8))

                slot_163_10_0 = slot_163_10_0 + 26
                slot_163_14_0 = slot_0_63_0("hitlogs_animations") or {
                        "Fade",
                        "Slide",
                        "Bounce",
                        "Scale",
                        "Rainbow"
                }
                slot_163_10_0 = slot_163_10_0 + (slot_0_128_0(arg_163_0, "hitlogs_anim", arg_163_1, slot_163_10_0, arg_163_3, 28, slot_163_14_0, G.hitlogs, "animation_style", arg_163_5, arg_163_6, arg_163_7, arg_163_8) or 28) + 12

                arg_163_0:add_rect_filled(draw.rect(arg_163_1, slot_163_10_0, arg_163_1 + arg_163_3, slot_163_10_0 + 1), theme.colors.border_inner:mod_a(arg_163_8 * 0.5))

                slot_163_10_0 = slot_163_10_0 + 15
                slot_163_16_0 = draw.color(255, 200, 100):mod_a(arg_163_8)

                slot_0_58_0(arg_163_0, theme.fonts.item, arg_163_1, slot_163_10_0, "? " .. slot_0_63_0("hitlogs_drag_info"), slot_163_16_0)

                slot_163_10_0 = slot_163_10_0 + 24

                slot_0_58_0(arg_163_0, theme.fonts.small, arg_163_1, slot_163_10_0, "Max: 7 logs | Fade: 6.0s", theme.colors.text_normal:mod_a(arg_163_8 * 0.7))

                slot_163_10_0 = slot_163_10_0 + 30

                arg_163_0:add_rect_filled(draw.rect(arg_163_1, slot_163_10_0, arg_163_1 + arg_163_3, slot_163_10_0 + 1), theme.colors.border_inner:mod_a(arg_163_8 * 0.5))

                slot_163_10_0 = slot_163_10_0 + 15

                slot_0_58_0(arg_163_0, theme.fonts.item, arg_163_1, slot_163_10_0, "Preview:", theme.colors.text_light:mod_a(arg_163_8))

                slot_163_10_0 = slot_163_10_0 + 26
                slot_163_17_0 = arg_163_1 + 10
                slot_163_18_0 = slot_163_10_0
                slot_163_19_0 = game and game.global_vars and game.global_vars.real_time or 0
                slot_163_20_0 = {
                        {
                                text = "Hit enemy's head with AWP for 120 (0) hp",
                                age = slot_163_19_0 % 3
                        },
                        {
                                text = "Hit player's chest with AK-47 for 36 (64) hp",
                                age = slot_163_19_0 % 3 + 0.6
                        }
                }

                for iter_163_0, iter_163_1 in ipairs(slot_163_20_0) do
                        slot_163_26_0 = math.min(255, iter_163_1.age * 300)
                        slot_163_27_0 = 0
                        slot_163_28_0 = 0
                        slot_163_29_0 = draw.color(255, 255, 255, slot_163_26_0)

                        if G.hitlogs.animation_style == 2 then
                                slot_163_27_0 = -50 * math.max(0, 1 - iter_163_1.age * 2)
                        elseif G.hitlogs.animation_style == 3 then
                                slot_163_28_0 = -10 * math.abs(math.sin(iter_163_1.age * 10)) * math.max(0, 1 - iter_163_1.age)
                        elseif G.hitlogs.animation_style == 5 then
                                slot_163_30_1 = (slot_163_19_0 * 100 + iter_163_0 * 30) % 360
                                slot_163_29_0 = slot_0_56_0(slot_163_30_1, 0.7, 1):mod_a(slot_163_26_0)
                        end

                        slot_163_30_0 = slot_163_18_0 + (iter_163_0 - 1) * 20 + slot_163_28_0
                        slot_163_31_0 = slot_163_17_0 + slot_163_27_0

                        if G.hitlogs.visual_style == 2 then
                                arg_163_0:add_rect_filled(draw.rect(slot_163_31_0 - 3, slot_163_30_0 - 1, slot_163_31_0 + 200, slot_163_30_0 + 14), draw.color(0, 0, 0, math.floor(slot_163_26_0 * 0.5)))
                                arg_163_0:add_rect(draw.rect(slot_163_31_0 - 3, slot_163_30_0 - 1, slot_163_31_0 + 200, slot_163_30_0 + 14), slot_163_29_0:mod_a(slot_163_26_0 * 0.8), 1)
                        elseif G.hitlogs.visual_style == 3 then
                                arg_163_0:add_rect_filled(draw.rect(slot_163_31_0 - 2, slot_163_30_0, slot_163_31_0 + 200, slot_163_30_0 + 13), draw.color(100, 150, 255, math.floor(slot_163_26_0 * 0.2)))
                        elseif G.hitlogs.visual_style == 4 then
                                for iter_163_2 = 0, 14 do
                                        slot_163_36_0 = math.floor(slot_163_26_0 * (1 - iter_163_2 / 14) * 0.25)

                                        arg_163_0:add_line(draw.vec2(slot_163_31_0 - 3, slot_163_30_0 - 1 + iter_163_2), draw.vec2(slot_163_31_0 + 200, slot_163_30_0 - 1 + iter_163_2), draw.color(50, 100, 255, slot_163_36_0))
                                end
                        elseif G.hitlogs.visual_style == 5 then
                                arg_163_0:add_rect_filled(draw.rect(slot_163_31_0 - 3, slot_163_30_0 - 1, slot_163_31_0 + 200, slot_163_30_0 + 14), draw.color(10, 10, 15, math.floor(slot_163_26_0 * 0.7)))
                                arg_163_0:add_rect(draw.rect(slot_163_31_0 - 3, slot_163_30_0 - 1, slot_163_31_0 + 200, slot_163_30_0 + 14), draw.color(0, 255, 255, math.floor(slot_163_26_0 * 0.5)), 1)
                        end

                        if G.hitlogs.animation_style == 5 then
                                slot_0_58_0(arg_163_0, theme.fonts.small, slot_163_31_0 + 1, slot_163_30_0 + 1, iter_163_1.text, draw.color(0, 0, 0, math.floor(slot_163_26_0 * 0.8)))
                        end

                        slot_0_58_0(arg_163_0, theme.fonts.small, slot_163_31_0, slot_163_30_0, iter_163_1.text, slot_163_29_0)
                end

                slot_163_10_0 = slot_163_10_0 + 50
        end

        G.tab_heights = G.tab_heights or {}
        G.tab_heights.HitLogs = math.max(0, slot_163_10_0 - arg_163_2 + 20)
end

function G.hitlogs.add_log(arg_164_0)
        if not G.hitlogs or not G.hitlogs.data then
                return
        end

        table.insert(G.hitlogs.data, {
                alpha = 50,
                text = arg_164_0,
                time = game and game.global_vars and game.global_vars.real_time or 0
        })

        while #G.hitlogs.data > G.hitlogs.max_logs do
                table.remove(G.hitlogs.data, 1)
        end
end

function G.hitlogs.process_hit_event(arg_165_0)
        if not G.hitlogs.show_hit then
                return
        end

        local var_165_0 = G.hitlogs.weapon_names[arg_165_0:get_string("weapon")] or "undefined"
        local var_165_1 = arg_165_0:get_controller("userid"):get_name() or "undefined"
        local var_165_2 = G.hitlogs.hitgroup_names[arg_165_0:get_int("hitgroup")]
        local var_165_3 = arg_165_0:get_int("dmg_health")
        local var_165_4 = arg_165_0:get_int("health")

        G.hitlogs.add_log(string.format("Hit %s's %s with %s for %d (%d) hp", var_165_1, var_165_2, var_165_0, var_165_3, var_165_4))
end

function G.hitlogs.process_hurt_event(arg_166_0)
        if not G.hitlogs.show_hurt then
                return
        end

        local var_166_0 = arg_166_0:get_controller("attacker"):get_name() or "undefined"
        local var_166_1 = arg_166_0:get_int("dmg_health")
        local var_166_2 = arg_166_0:get_int("health")
        local var_166_3 = G.hitlogs.hitgroup_names[arg_166_0:get_int("hitgroup")]
        local var_166_4 = G.hitlogs.weapon_names[arg_166_0:get_string("weapon")]

        G.hitlogs.add_log(string.format("Hurt %s for %d (%d) hp in %s with %s", var_166_0, var_166_1, var_166_2, var_166_3, var_166_4))
end

function G.hitlogs.process_bomb_event(arg_167_0)
        if not G.hitlogs.show_bomb then
                return
        end

        G.hitlogs.add_log(G.hitlogs.bomb_event_names[arg_167_0:get_name()])
end

function G.hitlogs.process_round_event(arg_168_0)
        if not G.hitlogs.show_round then
                return
        end

        G.hitlogs.add_log("Round started! Buy weapons and FIGHT!!!")
end

function G.hitlogs.on_event(arg_169_0)
        if not G.hitlogs or not G.hitlogs.enable then
                return
        end

        local var_169_0 = arg_169_0:get_name()

        if var_169_0 == "player_hurt" then
                local var_169_1 = entities.get_local_controller()

                if arg_169_0:get_controller("attacker") == var_169_1 then
                        G.hitlogs.process_hit_event(arg_169_0)
                elseif arg_169_0:get_controller("userid") == var_169_1 then
                        G.hitlogs.process_hurt_event(arg_169_0)
                end
        elseif var_169_0 == "round_start" then
                G.hitlogs.process_round_event(arg_169_0)
        elseif var_169_0:find("bomb_") then
                G.hitlogs.process_bomb_event(arg_169_0)
        end
end

function G.hitlogs.draw()
        if not G.hitlogs or not G.hitlogs.enable then
                return
        end

        if not G.hitlogs.data then
                G.hitlogs.data = {}
        end

        slot_170_0_0, slot_170_1_0 = game.engine:get_screen_size()
        slot_170_2_0 = draw.surface
        slot_170_3_0 = theme.fonts.item or draw.fonts.gui_main
        slot_170_4_0 = game and game.global_vars and game.global_vars.real_time or 0
        slot_170_5_0 = slot_0_65_0.x
        slot_170_6_0 = slot_0_65_0.y
        slot_170_7_0 = key_down and key_down(slot_0_49_0) or bit.band(slot_0_32_0(16) or 0, 32768) ~= 0

        if not G.hitlogs.demo_shown and #G.hitlogs.data == 0 then
                if not G.hitlogs.demo_start_time then
                        G.hitlogs.demo_start_time = slot_170_4_0

                        G.hitlogs.add_log("? Hit enemy's head with AWP for 120 (0) hp")
                        G.hitlogs.add_log("? Hurt player for 36 (64) hp in chest")
                elseif slot_170_4_0 - G.hitlogs.demo_start_time > 5 then
                        G.hitlogs.demo_shown = true
                        G.hitlogs.data = {}
                end
        end

        if #G.hitlogs.data > 0 and G.hitlogs.data[1].text and not G.hitlogs.data[1].text:find("?") then
                G.hitlogs.demo_shown = true
        end

        slot_170_8_0 = 400
        slot_170_9_0 = math.max(50, #G.hitlogs.data * 25)
        slot_170_10_0 = slot_170_5_0 >= G.hitlogs.position_x and slot_170_5_0 <= G.hitlogs.position_x + slot_170_8_0 and slot_170_6_0 >= G.hitlogs.position_y and slot_170_6_0 <= G.hitlogs.position_y + slot_170_9_0

        if slot_170_7_0 and slot_0_65_0.pressed and slot_170_10_0 and not G.hitlogs.dragging then
                G.hitlogs.dragging = true
                G.hitlogs.drag_offset_x = slot_170_5_0 - G.hitlogs.position_x
                G.hitlogs.drag_offset_y = slot_170_6_0 - G.hitlogs.position_y
        end

        if slot_0_65_0.released then
                G.hitlogs.dragging = false
        end

        if G.hitlogs.dragging then
                G.hitlogs.position_x = slot_170_5_0 - G.hitlogs.drag_offset_x
                G.hitlogs.position_y = slot_170_6_0 - G.hitlogs.drag_offset_y
                G.hitlogs.position_x = math.max(0, math.min(slot_170_0_0 - slot_170_8_0, G.hitlogs.position_x))
                G.hitlogs.position_y = math.max(0, math.min(slot_170_1_0 - slot_170_9_0, G.hitlogs.position_y))
        end

        if slot_170_7_0 or G.hitlogs.dragging then
                slot_170_2_0:add_rect_filled(draw.rect(G.hitlogs.position_x, G.hitlogs.position_y, G.hitlogs.position_x + slot_170_8_0, G.hitlogs.position_y + slot_170_9_0), draw.color(255, 255, 255, 20))
                slot_170_2_0:add_rect(draw.rect(G.hitlogs.position_x, G.hitlogs.position_y, G.hitlogs.position_x + slot_170_8_0, G.hitlogs.position_y + slot_170_9_0), draw.color(50, 255, 50, G.hitlogs.dragging and 255 or 100), 2)

                slot_170_2_0.font = slot_170_3_0
                slot_170_11_1 = "Arraste para mover os logs"
                slot_170_12_0 = slot_170_3_0:get_text_size(slot_170_11_1)

                slot_170_2_0:add_text(draw.vec2(G.hitlogs.position_x + (slot_170_8_0 - slot_170_12_0.x) / 2, G.hitlogs.position_y + 5), slot_170_11_1, draw.color(255, 255, 255, 200))
        end

        slot_170_11_0 = 0

        for iter_170_0, iter_170_1 in pairs(G.hitlogs.data) do
                if slot_170_4_0 < iter_170_1.time + 1 then
                        iter_170_1.alpha = iter_170_1.alpha + (255 - iter_170_1.alpha) * 0.095
                end

                slot_170_17_0 = 0
                slot_170_18_0 = 0
                slot_170_19_0 = 1
                slot_170_20_0 = draw.color(255, 255, 255, math.floor(iter_170_1.alpha))
                slot_170_21_0 = slot_170_4_0 - iter_170_1.time

                if G.hitlogs.animation_style == 2 then
                        if slot_170_21_0 < 0.5 then
                                slot_170_17_0 = -150 * (1 - slot_170_21_0 / 0.5)
                        end
                elseif G.hitlogs.animation_style == 3 then
                        if slot_170_21_0 < 0.6 then
                                slot_170_18_0 = -(math.abs(math.sin(slot_170_21_0 * 15)) * (1 - slot_170_21_0 / 0.6)) * 20
                        end
                elseif G.hitlogs.animation_style == 4 then
                        if slot_170_21_0 < 0.4 then
                                slot_170_19_0 = 0.5 + slot_170_21_0 / 0.4 * 0.5
                        end
                elseif G.hitlogs.animation_style == 5 then
                        slot_170_22_1 = (slot_170_4_0 * 100 + iter_170_0 * 30) % 360
                        slot_170_20_0 = slot_0_56_0(slot_170_22_1, 0.7, 1):mod_a(iter_170_1.alpha)
                end

                slot_170_22_0 = slot_170_11_0 + slot_170_18_0
                slot_170_23_0 = G.hitlogs.position_x + slot_170_17_0
                slot_170_11_0 = slot_170_11_0 + 22 * (iter_170_1.alpha / 255)

                if iter_170_1.alpha > 0 then
                        slot_170_24_0 = slot_170_3_0:get_text_size(iter_170_1.text)
                        slot_170_25_0 = slot_170_24_0.x * slot_170_19_0
                        slot_170_26_0 = slot_170_24_0.y * slot_170_19_0

                        if G.hitlogs.visual_style == 2 then
                                slot_170_2_0:add_rect_filled(draw.rect(slot_170_23_0 - 5, G.hitlogs.position_y + slot_170_22_0 - 2, slot_170_23_0 + slot_170_25_0 + 5, G.hitlogs.position_y + slot_170_22_0 + slot_170_26_0 + 2), draw.color(0, 0, 0, math.floor(iter_170_1.alpha * 0.7)))
                                slot_170_2_0:add_rect(draw.rect(slot_170_23_0 - 5, G.hitlogs.position_y + slot_170_22_0 - 2, slot_170_23_0 + slot_170_25_0 + 5, G.hitlogs.position_y + slot_170_22_0 + slot_170_26_0 + 2), slot_170_20_0, 1)
                        elseif G.hitlogs.visual_style == 3 then
                                for iter_170_2 = 1, 3 do
                                        slot_170_31_1 = math.floor(iter_170_1.alpha * 0.15 * (4 - iter_170_2))

                                        slot_170_2_0:add_rect_filled(draw.rect(slot_170_23_0 - iter_170_2 * 2, G.hitlogs.position_y + slot_170_22_0 - iter_170_2, slot_170_23_0 + slot_170_25_0 + iter_170_2 * 2, G.hitlogs.position_y + slot_170_22_0 + slot_170_26_0 + iter_170_2), draw.color(100, 150, 255, slot_170_31_1))
                                end
                        elseif G.hitlogs.visual_style == 4 then
                                slot_170_27_0 = slot_170_26_0 + 4

                                for iter_170_3 = 0, slot_170_27_0 do
                                        slot_170_32_0 = math.floor(iter_170_1.alpha * (1 - iter_170_3 / slot_170_27_0) * 0.3)

                                        slot_170_2_0:add_line(draw.vec2(slot_170_23_0 - 5, G.hitlogs.position_y + slot_170_22_0 - 2 + iter_170_3), draw.vec2(slot_170_23_0 + slot_170_25_0 + 5, G.hitlogs.position_y + slot_170_22_0 - 2 + iter_170_3), draw.color(50, 100, 255, slot_170_32_0))
                                end
                        elseif G.hitlogs.visual_style == 5 then
                                slot_170_2_0:add_rect_filled(draw.rect(slot_170_23_0 - 5, G.hitlogs.position_y + slot_170_22_0 - 2, slot_170_23_0 + slot_170_25_0 + 5, G.hitlogs.position_y + slot_170_22_0 + slot_170_26_0 + 2), draw.color(10, 10, 15, math.floor(iter_170_1.alpha * 0.9)))

                                for iter_170_4 = 1, 2 do
                                        slot_170_2_0:add_rect(draw.rect(slot_170_23_0 - 5 - iter_170_4, G.hitlogs.position_y + slot_170_22_0 - 2 - iter_170_4, slot_170_23_0 + slot_170_25_0 + 5 + iter_170_4, G.hitlogs.position_y + slot_170_22_0 + slot_170_26_0 + 2 + iter_170_4), draw.color(0, 255, 255, math.floor(iter_170_1.alpha * 0.5 / iter_170_4)), 1)
                                end
                        end

                        slot_170_2_0.font = slot_170_3_0

                        if G.hitlogs.animation_style == 5 then
                                slot_170_2_0:add_text(draw.vec2(slot_170_23_0 + 1, G.hitlogs.position_y + slot_170_22_0 + 1), iter_170_1.text, draw.color(0, 0, 0, math.floor(iter_170_1.alpha * 0.8)))
                        end

                        slot_170_2_0:add_text(draw.vec2(slot_170_23_0, G.hitlogs.position_y + slot_170_22_0), iter_170_1.text, slot_170_20_0)
                end

                if slot_170_4_0 > iter_170_1.time + G.hitlogs.fade_time then
                        iter_170_1.alpha = iter_170_1.alpha - iter_170_1.alpha * 0.095
                end

                if iter_170_1.alpha < 1 and slot_170_4_0 > iter_170_1.time + G.hitlogs.fade_time + 2 then
                        table.remove(G.hitlogs.data, iter_170_0)
                end
        end
end

if events and events.event then
        events.event:add(G.hitlogs.on_event)
end

if events and events.present_queue then
        events.present_queue:add(G.hitlogs.draw)
end

function slot_0_160_0()
        if not gui or not gui.ctx or not gui.ctx.find then
                return
        end

        local var_171_0 = gui.ctx:find("misc>helpers>auto min damage>enable")

        if var_171_0 and var_171_0.get_value then
                local var_171_1 = var_171_0:get_value()

                if var_171_1 and var_171_1.get then
                        hvh.automd = var_171_1:get()
                end
        end

        local var_171_2 = gui.ctx:find("misc>helpers>auto min damage (legit)>enable")

        if var_171_2 and var_171_2.get_value then
                local var_171_3 = var_171_2:get_value()

                if var_171_3 and var_171_3.get then
                        hvh.automd_legit = var_171_3:get()
                end
        end
end

function slot_0_161_0(arg_172_0, arg_172_1, arg_172_2, arg_172_3, arg_172_4, arg_172_5, arg_172_6, arg_172_7, arg_172_8, arg_172_9)
        slot_0_160_0()

        game_panel_active = true
        slot_172_10_8 = arg_172_2
        slot_172_11_0 = (arg_172_3 - 10) / 2
        slot_172_12_0 = arg_172_1
        slot_0_97_0.crosshair_mode = slot_0_119_0(arg_172_0, slot_172_12_0, slot_172_10_8, "Keybinds na Mira (Fatality Style)", slot_0_97_0.crosshair_mode, arg_172_5, arg_172_6, arg_172_7, arg_172_8)
        slot_172_10_7 = slot_172_10_8 + 30

        arg_172_0:add_rect_filled(draw.rect(slot_172_12_0, slot_172_10_7, slot_172_12_0 + arg_172_3, slot_172_10_7 + 1), theme.colors.border_inner:mod_a(arg_172_8 * 0.5))

        slot_172_10_6 = slot_172_10_7 + 15

        slot_0_58_0(arg_172_0, theme.fonts.item, slot_172_12_0, slot_172_10_6, slot_0_63_0("hud_style"), theme.colors.text_light:mod_a(arg_172_8))

        slot_172_10_5 = slot_172_10_6 + 22
        slot_172_10_4 = slot_172_10_5 + (slot_0_128_0(arg_172_0, "style_sel", slot_172_12_0, slot_172_10_5, slot_172_11_0, 28, slot_0_63_0("hud_style_options"), slot_0_94_0, "selected_style", arg_172_5, arg_172_6, arg_172_7, arg_172_8) or 28) + 12

        arg_172_0:add_rect_filled(draw.rect(slot_172_12_0, slot_172_10_4, slot_172_12_0 + arg_172_3, slot_172_10_4 + 1), theme.colors.border_inner:mod_a(arg_172_8 * 0.5))

        slot_172_10_3 = slot_172_10_4 + 15

        if slot_0_94_0.selected_style == 1 then
                slot_0_58_0(arg_172_0, theme.fonts.item, slot_172_12_0, slot_172_10_3, slot_0_63_0("hud1_options"), theme.colors.text_title:mod_a(arg_172_8))

                slot_172_10_3 = slot_172_10_3 + 24
                slot_0_95_0.color_mode = slot_0_125_0(arg_172_0, slot_172_12_0, slot_172_10_3, slot_0_63_0("hud1_color_mode"), slot_0_95_0.color_mode, arg_172_5, arg_172_6, arg_172_7, arg_172_8)
                slot_172_10_3 = slot_172_10_3 + 34
                slot_172_10_3 = slot_172_10_3 + (slot_0_129_0(arg_172_0, "hud1_items", slot_172_12_0, slot_172_10_3, slot_172_11_0, 28, slot_0_63_0("items_to_show"), slot_0_95_0.select_names, slot_0_95_0.selected, arg_172_5, arg_172_6, arg_172_7, arg_172_8) or 50)
        else
                slot_0_58_0(arg_172_0, theme.fonts.item, slot_172_12_0, slot_172_10_3, slot_0_63_0("hud2_options"), theme.colors.text_title:mod_a(arg_172_8))

                slot_172_10_3 = slot_172_10_3 + 24

                slot_0_58_0(arg_172_0, theme.fonts.small, slot_172_12_0, slot_172_10_3, slot_0_63_0("hud2_mode_info"), theme.colors.text_normal:mod_a(arg_172_8))

                slot_172_10_3 = slot_172_10_3 + 30
                slot_0_96_0.fall_speed = slot_0_121_0(arg_172_0, "fall_speed", slot_172_12_0, slot_172_10_3, slot_172_11_0, slot_0_63_0("fall_speed"), 500, 5000, slot_0_96_0.fall_speed, arg_172_5, arg_172_6, arg_172_8, "%.0f")
                slot_172_10_3 = slot_172_10_3 + 48
                slot_172_10_3 = slot_172_10_3 + (slot_0_129_0(arg_172_0, "hud2_items", slot_172_12_0, slot_172_10_3, slot_172_11_0, 28, slot_0_63_0("items_to_show"), slot_0_96_0.select_names, slot_0_96_0.selected, arg_172_5, arg_172_6, arg_172_7, arg_172_8) or 50)
                slot_172_10_3 = slot_172_10_3 + 12

                slot_0_58_0(arg_172_0, theme.fonts.small, slot_172_12_0, slot_172_10_3, "Keybinds Color", theme.colors.text_normal:mod_a(arg_172_8))

                slot_0_87_0.kb_color = slot_0_87_0.kb_color or {
                        v = 1,
                        s = 0,
                        h = 0
                }
                slot_172_15_0 = slot_0_87_0.kb_color
                slot_172_16_0 = slot_0_56_0(slot_172_15_0.h, slot_172_15_0.s, slot_172_15_0.v)
                slot_172_17_0 = {
                        h = 22,
                        w = 22,
                        x = slot_172_12_0 + slot_172_11_0 - 30,
                        y = slot_172_10_3 - 2
                }

                arg_172_0:add_rect_filled(draw.rect(slot_172_17_0.x, slot_172_17_0.y, slot_172_17_0.x + slot_172_17_0.w, slot_172_17_0.y + slot_172_17_0.h), slot_172_16_0:mod_a(arg_172_8))
                arg_172_0:add_rect(draw.rect(slot_172_17_0.x, slot_172_17_0.y, slot_172_17_0.x + slot_172_17_0.w, slot_172_17_0.y + slot_172_17_0.h), theme.colors.border_inner:mod_a(arg_172_8))

                if arg_172_7 and slot_0_57_0(slot_172_17_0.x, slot_172_17_0.y, slot_172_17_0.w, slot_172_17_0.h, arg_172_5, arg_172_6) and not color_picker_open then
                        color_picker_open = true
                        color_picker_target = "kb_color"
                end

                slot_172_10_3 = slot_172_10_3 + 24
                slot_172_10_3 = slot_172_10_3 + (slot_0_128_0(arg_172_0, "kb_anim", slot_172_12_0, slot_172_10_3, slot_172_11_0, 28, {
                        "Fade",
                        "Static"
                }, slot_0_87_0, "kb_anim_mode", arg_172_5, arg_172_6, arg_172_7, arg_172_8) or 28) + 12
        end

        arg_172_0:add_rect_filled(draw.rect(slot_172_12_0, slot_172_10_3, slot_172_12_0 + arg_172_3, slot_172_10_3 + 1), theme.colors.border_inner:mod_a(arg_172_8 * 0.5))

        slot_172_10_2 = slot_172_10_3 + 15

        slot_0_58_0(arg_172_0, theme.fonts.item, slot_172_12_0, slot_172_10_2, slot_0_63_0("lua_keybinds"), theme.colors.text_title:mod_a(arg_172_8))

        slot_172_10_1 = slot_172_10_2 + 24
        slot_0_97_0.enable = slot_0_119_0(arg_172_0, slot_172_12_0, slot_172_10_1, "Mostrar HUD Lua Keybinds", slot_0_97_0.enable or false, arg_172_5, arg_172_6, arg_172_7, arg_172_8)
        slot_172_10_0 = slot_172_10_1 + 30

        if slot_0_97_0.enable then
                slot_0_58_0(arg_172_0, theme.fonts.small, slot_172_12_0, slot_172_10_0, "Opções de HUD:", theme.colors.text_title:mod_a(arg_172_8))

                slot_172_10_0 = slot_172_10_0 + 20
                slot_0_97_0.color_mode = slot_0_119_0(arg_172_0, slot_172_12_0, slot_172_10_0, "Modo Colorido", slot_0_97_0.color_mode, arg_172_5, arg_172_6, arg_172_7, arg_172_8)
                slot_172_10_0 = slot_172_10_0 + 30
        end

        G.tab_heights = G.tab_heights or {}
        G.tab_heights.Keybinds = slot_172_10_0 - arg_172_2 + 20
end

function slot_0_162_0(arg_173_0, arg_173_1, arg_173_2, arg_173_3, arg_173_4, arg_173_5, arg_173_6, arg_173_7, arg_173_8, arg_173_9)
        local var_173_0 = arg_173_2

        slot_0_58_0(arg_173_0, theme.fonts.category, arg_173_1, var_173_0, "Blockbot", theme.colors.text_light:mod_a(arg_173_8))

        local var_173_1 = var_173_0 + 30

        slot_0_58_0(arg_173_0, theme.fonts.item, arg_173_1, var_173_1, "Keybind configurada em:", theme.colors.text_normal:mod_a(arg_173_8))

        local var_173_2 = var_173_1 + 25

        slot_0_58_0(arg_173_0, theme.fonts.small, arg_173_1, var_173_2, "Lua > Elements B > Blockbot (HOLD BIND)", theme.colors.accent:mod_a(arg_173_8))

        local var_173_3 = var_173_2 + 30

        slot_0_58_0(arg_173_0, theme.fonts.small, arg_173_1, var_173_3, "Segure a keybind perto de um inimigo para bloquear o caminho dele.", theme.colors.text_normal:mod_a(arg_173_8))

        G.tab_heights = G.tab_heights or {}
        G.tab_heights.Blockbot = var_173_3 - arg_173_2 + 40
end

if not G.games then
        G.games = {}
end

function G.games.init_minesweeper()
        local var_174_0 = slot_0_2_0.minesweeper
        local var_174_1 = {
                {
                        mines = 10,
                        w = 8,
                        h = 8
                },
                {
                        mines = 25,
                        w = 12,
                        h = 12
                },
                {
                        mines = 50,
                        w = 16,
                        h = 16
                }
        }
        local var_174_2 = var_174_1[slot_0_2_0.minesweeper_difficulty] or var_174_1[2]

        var_174_0.grid_w, var_174_0.grid_h, var_174_0.mines_count = var_174_2.w, var_174_2.h, var_174_2.mines
        var_174_0.grid = {}
        var_174_0.revealed = {}
        var_174_0.flagged = {}
        var_174_0.game_over = false
        var_174_0.won = false
        var_174_0.first_click = true

        for iter_174_0 = 1, var_174_0.grid_h do
                var_174_0.grid[iter_174_0] = {}
                var_174_0.revealed[iter_174_0] = {}
                var_174_0.flagged[iter_174_0] = {}

                for iter_174_1 = 1, var_174_0.grid_w do
                        var_174_0.grid[iter_174_0][iter_174_1] = 0
                        var_174_0.revealed[iter_174_0][iter_174_1] = false
                        var_174_0.flagged[iter_174_0][iter_174_1] = false
                end
        end
end

function G.games.place_mines(arg_175_0, arg_175_1)
        local var_175_0 = slot_0_2_0.minesweeper
        local var_175_1 = 0

        while var_175_1 < var_175_0.mines_count do
                local var_175_2 = math.random(1, var_175_0.grid_w)
                local var_175_3 = math.random(1, var_175_0.grid_h)

                if var_175_0.grid[var_175_3][var_175_2] ~= -1 and (var_175_2 ~= arg_175_0 or var_175_3 ~= arg_175_1) then
                        var_175_0.grid[var_175_3][var_175_2] = -1
                        var_175_1 = var_175_1 + 1
                end
        end

        for iter_175_0 = 1, var_175_0.grid_h do
                for iter_175_1 = 1, var_175_0.grid_w do
                        if var_175_0.grid[iter_175_0][iter_175_1] ~= -1 then
                                local var_175_4 = 0

                                for iter_175_2 = -1, 1 do
                                        for iter_175_3 = -1, 1 do
                                                local var_175_5 = iter_175_0 + iter_175_2
                                                local var_175_6 = iter_175_1 + iter_175_3

                                                if var_175_5 >= 1 and var_175_5 <= var_175_0.grid_h and var_175_6 >= 1 and var_175_6 <= var_175_0.grid_w and var_175_0.grid[var_175_5][var_175_6] == -1 then
                                                        var_175_4 = var_175_4 + 1
                                                end
                                        end
                                end

                                var_175_0.grid[iter_175_0][iter_175_1] = var_175_4
                        end
                end
        end
end

function G.games.reveal_cell(arg_176_0, arg_176_1)
        local var_176_0 = slot_0_2_0.minesweeper

        if arg_176_0 < 1 or arg_176_0 > var_176_0.grid_w or arg_176_1 < 1 or arg_176_1 > var_176_0.grid_h or var_176_0.revealed[arg_176_1][arg_176_0] or var_176_0.flagged[arg_176_1][arg_176_0] then
                return
        end

        if var_176_0.first_click then
                G.games.place_mines(arg_176_0, arg_176_1)

                var_176_0.first_click = false
        end

        var_176_0.revealed[arg_176_1][arg_176_0] = true

        if var_176_0.grid[arg_176_1][arg_176_0] == -1 then
                var_176_0.game_over = true

                return
        end

        if var_176_0.grid[arg_176_1][arg_176_0] == 0 then
                for iter_176_0 = -1, 1 do
                        for iter_176_1 = -1, 1 do
                                G.games.reveal_cell(arg_176_0 + iter_176_1, arg_176_1 + iter_176_0)
                        end
                end
        end

        local var_176_1 = 0

        for iter_176_2 = 1, var_176_0.grid_h do
                for iter_176_3 = 1, var_176_0.grid_w do
                        if var_176_0.revealed[iter_176_2][iter_176_3] then
                                var_176_1 = var_176_1 + 1
                        end
                end
        end

        if var_176_1 == var_176_0.grid_w * var_176_0.grid_h - var_176_0.mines_count then
                var_176_0.won = true
                var_176_0.game_over = true
        end
end

function G.games.init_chess()
        local var_177_0 = slot_0_2_0.chess

        var_177_0.board = {}
        var_177_0.selected_pos = nil
        var_177_0.current_turn = 1
        var_177_0.game_over = false
        var_177_0.winner = nil
        var_177_0.last_move = nil

        for iter_177_0 = 1, 8 do
                var_177_0.board[iter_177_0] = {}

                for iter_177_1 = 1, 8 do
                        var_177_0.board[iter_177_0][iter_177_1] = {
                                color = 0
                        }
                end
        end

        var_177_0.board[1][1] = {
                piece = "R",
                color = -1
        }
        var_177_0.board[1][2] = {
                piece = "N",
                color = -1
        }
        var_177_0.board[1][3] = {
                piece = "B",
                color = -1
        }
        var_177_0.board[1][4] = {
                piece = "Q",
                color = -1
        }
        var_177_0.board[1][5] = {
                piece = "K",
                color = -1
        }
        var_177_0.board[1][6] = {
                piece = "B",
                color = -1
        }
        var_177_0.board[1][7] = {
                piece = "N",
                color = -1
        }
        var_177_0.board[1][8] = {
                piece = "R",
                color = -1
        }

        for iter_177_2 = 1, 8 do
                var_177_0.board[2][iter_177_2] = {
                        piece = "P",
                        color = -1
                }
        end

        for iter_177_3 = 1, 8 do
                var_177_0.board[7][iter_177_3] = {
                        piece = "P",
                        color = 1
                }
        end

        var_177_0.board[8][1] = {
                piece = "R",
                color = 1
        }
        var_177_0.board[8][2] = {
                piece = "N",
                color = 1
        }
        var_177_0.board[8][3] = {
                piece = "B",
                color = 1
        }
        var_177_0.board[8][4] = {
                piece = "Q",
                color = 1
        }
        var_177_0.board[8][5] = {
                piece = "K",
                color = 1
        }
        var_177_0.board[8][6] = {
                piece = "B",
                color = 1
        }
        var_177_0.board[8][7] = {
                piece = "N",
                color = 1
        }
        var_177_0.board[8][8] = {
                piece = "R",
                color = 1
        }
end

function G.games.is_valid_pos(arg_178_0, arg_178_1)
        return arg_178_0 >= 1 and arg_178_0 <= 8 and arg_178_1 >= 1 and arg_178_1 <= 8
end

function G.games.get_piece_moves(arg_179_0, arg_179_1, arg_179_2)
        slot_179_3_0 = {}
        slot_179_4_0 = arg_179_0[arg_179_2][arg_179_1]

        if not slot_179_4_0.piece then
                return slot_179_3_0
        end

        slot_179_5_0 = slot_179_4_0.piece
        slot_179_6_0 = slot_179_4_0.color

        if slot_179_5_0 == "P" then
                slot_179_7_0 = slot_179_6_0 == 1 and -1 or 1
                slot_179_8_0 = arg_179_2 + slot_179_7_0

                if G.games.is_valid_pos(arg_179_1, slot_179_8_0) and not arg_179_0[slot_179_8_0][arg_179_1].piece then
                        table.insert(slot_179_3_0, {
                                arg_179_1,
                                slot_179_8_0
                        })

                        if arg_179_2 == (slot_179_6_0 == 1 and 7 or 2) and not arg_179_0[arg_179_2 + 2 * slot_179_7_0][arg_179_1].piece then
                                table.insert(slot_179_3_0, {
                                        arg_179_1,
                                        arg_179_2 + 2 * slot_179_7_0
                                })
                        end
                end

                for iter_179_0 = -1, 1, 2 do
                        if G.games.is_valid_pos(arg_179_1 + iter_179_0, slot_179_8_0) and arg_179_0[slot_179_8_0][arg_179_1 + iter_179_0].piece and arg_179_0[slot_179_8_0][arg_179_1 + iter_179_0].color ~= slot_179_6_0 then
                                table.insert(slot_179_3_0, {
                                        arg_179_1 + iter_179_0,
                                        slot_179_8_0
                                })
                        end
                end
        elseif slot_179_5_0 == "R" then
                for iter_179_1, iter_179_2 in ipairs({
                        {
                                1,
                                0
                        },
                        {
                                -1,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                0,
                                -1
                        }
                }) do
                        for iter_179_3 = 1, 7 do
                                slot_179_16_3 = arg_179_1 + iter_179_2[1] * iter_179_3
                                slot_179_17_2 = arg_179_2 + iter_179_2[2] * iter_179_3

                                if not G.games.is_valid_pos(slot_179_16_3, slot_179_17_2) then
                                        break
                                end

                                if arg_179_0[slot_179_17_2][slot_179_16_3].piece then
                                        if arg_179_0[slot_179_17_2][slot_179_16_3].color ~= slot_179_6_0 then
                                                table.insert(slot_179_3_0, {
                                                        slot_179_16_3,
                                                        slot_179_17_2
                                                })
                                        end

                                        break
                                end

                                table.insert(slot_179_3_0, {
                                        slot_179_16_3,
                                        slot_179_17_2
                                })
                        end
                end
        elseif slot_179_5_0 == "N" then
                for iter_179_4, iter_179_5 in ipairs({
                        {
                                2,
                                1
                        },
                        {
                                2,
                                -1
                        },
                        {
                                -2,
                                1
                        },
                        {
                                -2,
                                -1
                        },
                        {
                                1,
                                2
                        },
                        {
                                1,
                                -2
                        },
                        {
                                -1,
                                2
                        },
                        {
                                -1,
                                -2
                        }
                }) do
                        slot_179_12_0 = arg_179_1 + iter_179_5[1]
                        slot_179_13_0 = arg_179_2 + iter_179_5[2]

                        if G.games.is_valid_pos(slot_179_12_0, slot_179_13_0) and (not arg_179_0[slot_179_13_0][slot_179_12_0].piece or arg_179_0[slot_179_13_0][slot_179_12_0].color ~= slot_179_6_0) then
                                table.insert(slot_179_3_0, {
                                        slot_179_12_0,
                                        slot_179_13_0
                                })
                        end
                end
        elseif slot_179_5_0 == "B" then
                for iter_179_6, iter_179_7 in ipairs({
                        {
                                1,
                                1
                        },
                        {
                                1,
                                -1
                        },
                        {
                                -1,
                                1
                        },
                        {
                                -1,
                                -1
                        }
                }) do
                        for iter_179_8 = 1, 7 do
                                slot_179_16_2 = arg_179_1 + iter_179_7[1] * iter_179_8
                                slot_179_17_1 = arg_179_2 + iter_179_7[2] * iter_179_8

                                if not G.games.is_valid_pos(slot_179_16_2, slot_179_17_1) then
                                        break
                                end

                                if arg_179_0[slot_179_17_1][slot_179_16_2].piece then
                                        if arg_179_0[slot_179_17_1][slot_179_16_2].color ~= slot_179_6_0 then
                                                table.insert(slot_179_3_0, {
                                                        slot_179_16_2,
                                                        slot_179_17_1
                                                })
                                        end

                                        break
                                end

                                table.insert(slot_179_3_0, {
                                        slot_179_16_2,
                                        slot_179_17_1
                                })
                        end
                end
        elseif slot_179_5_0 == "Q" then
                for iter_179_9, iter_179_10 in ipairs({
                        {
                                1,
                                0
                        },
                        {
                                -1,
                                0
                        },
                        {
                                0,
                                1
                        },
                        {
                                0,
                                -1
                        },
                        {
                                1,
                                1
                        },
                        {
                                1,
                                -1
                        },
                        {
                                -1,
                                1
                        },
                        {
                                -1,
                                -1
                        }
                }) do
                        for iter_179_11 = 1, 7 do
                                slot_179_16_1 = arg_179_1 + iter_179_10[1] * iter_179_11
                                slot_179_17_0 = arg_179_2 + iter_179_10[2] * iter_179_11

                                if not G.games.is_valid_pos(slot_179_16_1, slot_179_17_0) then
                                        break
                                end

                                if arg_179_0[slot_179_17_0][slot_179_16_1].piece then
                                        if arg_179_0[slot_179_17_0][slot_179_16_1].color ~= slot_179_6_0 then
                                                table.insert(slot_179_3_0, {
                                                        slot_179_16_1,
                                                        slot_179_17_0
                                                })
                                        end

                                        break
                                end

                                table.insert(slot_179_3_0, {
                                        slot_179_16_1,
                                        slot_179_17_0
                                })
                        end
                end
        elseif slot_179_5_0 == "K" then
                for iter_179_12 = -1, 1 do
                        for iter_179_13 = -1, 1 do
                                if iter_179_13 ~= 0 or iter_179_12 ~= 0 then
                                        slot_179_15_0 = arg_179_1 + iter_179_13
                                        slot_179_16_0 = arg_179_2 + iter_179_12

                                        if G.games.is_valid_pos(slot_179_15_0, slot_179_16_0) and (not arg_179_0[slot_179_16_0][slot_179_15_0].piece or arg_179_0[slot_179_16_0][slot_179_15_0].color ~= slot_179_6_0) then
                                                table.insert(slot_179_3_0, {
                                                        slot_179_15_0,
                                                        slot_179_16_0
                                                })
                                        end
                                end
                        end
                end
        end

        return slot_179_3_0
end

function G.games.find_king(arg_180_0, arg_180_1)
        for iter_180_0 = 1, 8 do
                for iter_180_1 = 1, 8 do
                        if arg_180_0[iter_180_0][iter_180_1].piece == "K" and arg_180_0[iter_180_0][iter_180_1].color == arg_180_1 then
                                return iter_180_1, iter_180_0
                        end
                end
        end

        return nil, nil
end

function G.games.is_in_check(arg_181_0, arg_181_1)
        local var_181_0, var_181_1 = G.games.find_king(arg_181_0, arg_181_1)

        if not var_181_0 then
                return false
        end

        for iter_181_0 = 1, 8 do
                for iter_181_1 = 1, 8 do
                        if arg_181_0[iter_181_0][iter_181_1].color == -arg_181_1 then
                                local var_181_2 = G.games.get_piece_moves(arg_181_0, iter_181_1, iter_181_0)

                                for iter_181_2, iter_181_3 in ipairs(var_181_2) do
                                        if iter_181_3[1] == var_181_0 and iter_181_3[2] == var_181_1 then
                                                return true
                                        end
                                end
                        end
                end
        end

        return false
end

function G.games.clone_board(arg_182_0)
        local var_182_0 = {}

        for iter_182_0 = 1, 8 do
                var_182_0[iter_182_0] = {}

                for iter_182_1 = 1, 8 do
                        var_182_0[iter_182_0][iter_182_1] = {
                                piece = arg_182_0[iter_182_0][iter_182_1].piece,
                                color = arg_182_0[iter_182_0][iter_182_1].color
                        }
                end
        end

        return var_182_0
end

function G.games.make_move(arg_183_0, arg_183_1, arg_183_2, arg_183_3, arg_183_4)
        local var_183_0 = G.games.clone_board(arg_183_0)

        var_183_0[arg_183_4][arg_183_3] = var_183_0[arg_183_2][arg_183_1]
        var_183_0[arg_183_2][arg_183_1] = {
                color = 0
        }

        return var_183_0
end

function G.games.get_all_valid_moves(arg_184_0, arg_184_1)
        local var_184_0 = {}

        for iter_184_0 = 1, 8 do
                for iter_184_1 = 1, 8 do
                        if arg_184_0[iter_184_0][iter_184_1].color == arg_184_1 then
                                local var_184_1 = G.games.get_piece_moves(arg_184_0, iter_184_1, iter_184_0)

                                for iter_184_2, iter_184_3 in ipairs(var_184_1) do
                                        local var_184_2 = G.games.make_move(arg_184_0, iter_184_1, iter_184_0, iter_184_3[1], iter_184_3[2])

                                        if not G.games.is_in_check(var_184_2, arg_184_1) then
                                                table.insert(var_184_0, {
                                                        from = {
                                                                iter_184_1,
                                                                iter_184_0
                                                        },
                                                        to = iter_184_3
                                                })
                                        end
                                end
                        end
                end
        end

        return var_184_0
end

function G.games.evaluate_board(arg_185_0)
        local var_185_0 = {
                Q = 9,
                P = 1,
                R = 5,
                B = 3,
                N = 3,
                K = 100
        }
        local var_185_1 = 0
        local var_185_2 = {
                [-1] = 0,
                [1] = 0
        }

        for iter_185_0 = 1, 8 do
                for iter_185_1 = 1, 8 do
                        local var_185_3 = arg_185_0[iter_185_0][iter_185_1]

                        if var_185_3.piece then
                                var_185_2[var_185_3.color] = var_185_2[var_185_3.color] + 1

                                local var_185_4 = var_185_0[var_185_3.piece] or 0
                                local var_185_5 = 0

                                if iter_185_1 >= 4 and iter_185_1 <= 5 and iter_185_0 >= 4 and iter_185_0 <= 5 then
                                        var_185_5 = var_185_5 + 0.3
                                elseif iter_185_1 >= 3 and iter_185_1 <= 6 and iter_185_0 >= 3 and iter_185_0 <= 6 then
                                        var_185_5 = var_185_5 + 0.15
                                end

                                if (iter_185_1 == 1 or iter_185_1 == 8 or iter_185_0 == 1 or iter_185_0 == 8) and var_185_3.piece ~= "R" and var_185_3.piece ~= "K" then
                                        var_185_5 = var_185_5 - 0.2
                                end

                                if var_185_3.color == -1 then
                                        if (var_185_3.piece == "N" or var_185_3.piece == "B") and iter_185_0 > 1 then
                                                var_185_5 = var_185_5 + 0.2
                                        elseif var_185_3.piece == "P" and iter_185_0 > 2 then
                                                var_185_5 = var_185_5 + 0.1
                                        end
                                elseif (var_185_3.piece == "N" or var_185_3.piece == "B") and iter_185_0 < 8 then
                                        var_185_5 = var_185_5 + 0.2
                                elseif var_185_3.piece == "P" and iter_185_0 < 7 then
                                        var_185_5 = var_185_5 + 0.1
                                end

                                local var_185_6 = #G.games.get_piece_moves(arg_185_0, iter_185_1, iter_185_0) * 0.05

                                var_185_1 = var_185_1 + (var_185_4 + var_185_5 + var_185_6) * var_185_3.color
                        end
                end
        end

        return var_185_1 + (math.random() - 0.5) * 0.1
end

function G.games.minimax(arg_186_0, arg_186_1, arg_186_2, arg_186_3, arg_186_4)
        if arg_186_1 == 0 then
                return G.games.evaluate_board(arg_186_0)
        end

        local var_186_0 = arg_186_4 and -1 or 1
        local var_186_1 = G.games.get_all_valid_moves(arg_186_0, var_186_0)

        if #var_186_1 == 0 then
                if G.games.is_in_check(arg_186_0, var_186_0) then
                        return arg_186_4 and -10000 or 10000
                end

                return 0
        end

        if arg_186_4 then
                local var_186_2 = -99999

                for iter_186_0, iter_186_1 in ipairs(var_186_1) do
                        local var_186_3 = G.games.make_move(arg_186_0, iter_186_1.from[1], iter_186_1.from[2], iter_186_1.to[1], iter_186_1.to[2])
                        local var_186_4 = G.games.minimax(var_186_3, arg_186_1 - 1, arg_186_2, arg_186_3, false)

                        var_186_2 = math.max(var_186_2, var_186_4)
                        arg_186_2 = math.max(arg_186_2, var_186_4)

                        if arg_186_3 <= arg_186_2 then
                                break
                        end
                end

                return var_186_2
        else
                local var_186_5 = 99999

                for iter_186_2, iter_186_3 in ipairs(var_186_1) do
                        local var_186_6 = G.games.make_move(arg_186_0, iter_186_3.from[1], iter_186_3.from[2], iter_186_3.to[1], iter_186_3.to[2])
                        local var_186_7 = G.games.minimax(var_186_6, arg_186_1 - 1, arg_186_2, arg_186_3, true)

                        var_186_5 = math.min(var_186_5, var_186_7)
                        arg_186_3 = math.min(arg_186_3, var_186_7)

                        if arg_186_3 <= arg_186_2 then
                                break
                        end
                end

                return var_186_5
        end
end

function G.games.get_ai_move(arg_187_0)
        local var_187_0 = G.games.get_all_valid_moves(arg_187_0, -1)

        if #var_187_0 == 0 then
                return nil
        end

        local var_187_1 = {}
        local var_187_2 = ({
                2,
                3,
                4
        })[slot_0_2_0.chess_difficulty] or 3

        for iter_187_0, iter_187_1 in ipairs(var_187_0) do
                local var_187_3 = G.games.make_move(arg_187_0, iter_187_1.from[1], iter_187_1.from[2], iter_187_1.to[1], iter_187_1.to[2])
                local var_187_4 = G.games.minimax(var_187_3, var_187_2, -99999, 99999, false)

                table.insert(var_187_1, {
                        move = iter_187_1,
                        score = var_187_4
                })
        end

        table.sort(var_187_1, function(arg_188_0, arg_188_1)
                return arg_188_0.score > arg_188_1.score
        end)

        local var_187_5 = var_187_1[1].score
        local var_187_6 = {}

        for iter_187_2, iter_187_3 in ipairs(var_187_1) do
                if iter_187_3.score >= var_187_5 - 0.5 then
                        table.insert(var_187_6, iter_187_3.move)
                end
        end

        if #var_187_6 > 0 then
                return var_187_6[math.random(1, #var_187_6)]
        end

        return var_187_1[1].move
end

function G.games.check_chess_game_end(arg_189_0, arg_189_1)
        local var_189_0 = slot_0_2_0.chess

        if #G.games.get_all_valid_moves(arg_189_0, arg_189_1) == 0 then
                if G.games.is_in_check(arg_189_0, arg_189_1) then
                        var_189_0.game_over = true
                        var_189_0.winner = arg_189_1 == 1 and -1 or 1

                        return true
                else
                        var_189_0.game_over = true
                        var_189_0.winner = 0

                        return true
                end
        end

        local var_189_1 = {}

        for iter_189_0 = 1, 8 do
                for iter_189_1 = 1, 8 do
                        local var_189_2 = arg_189_0[iter_189_0][iter_189_1]

                        if var_189_2.piece then
                                table.insert(var_189_1, {
                                        piece = var_189_2.piece,
                                        color = var_189_2.color
                                })
                        end
                end
        end

        if #var_189_1 == 2 then
                local var_189_3 = true

                for iter_189_2, iter_189_3 in ipairs(var_189_1) do
                        if iter_189_3.piece ~= "K" then
                                var_189_3 = false

                                break
                        end
                end

                if var_189_3 then
                        var_189_0.game_over = true
                        var_189_0.winner = 0

                        return true
                end
        end

        if #var_189_1 == 3 then
                local var_189_4 = false

                for iter_189_4, iter_189_5 in ipairs(var_189_1) do
                        if iter_189_5.piece == "N" or iter_189_5.piece == "B" then
                                var_189_4 = true
                        end
                end

                if var_189_4 then
                        var_189_0.game_over = true
                        var_189_0.winner = 0

                        return true
                end
        end

        return false
end

function G.games.init_snake()
        local var_190_0 = slot_0_2_0.snake

        var_190_0.snake_body = {
                {
                        x = 10,
                        y = 10
                }
        }
        var_190_0.direction = {
                x = 1,
                y = 0
        }
        var_190_0.food = {
                x = 15,
                y = 10
        }
        var_190_0.game_over = false
        var_190_0.score = 0
        var_190_0.last_move = game.global_vars.real_time
        var_190_0.move_delay = ({
                0.2,
                0.15,
                0.1
        })[slot_0_2_0.snake_difficulty] or 0.15
        var_190_0.obstacles = {}

        local var_190_1 = ({
                0,
                8,
                16
        })[slot_0_2_0.snake_difficulty] or 0

        for iter_190_0 = 1, var_190_1 do
                local var_190_2
                local var_190_3
                local var_190_4 = 0

                repeat
                        var_190_2 = math.random(0, var_190_0.grid_size - 1)
                        var_190_3 = math.random(0, var_190_0.grid_size - 1)
                        var_190_4 = var_190_4 + 1

                        local var_190_5 = (var_190_2 ~= 10 or var_190_3 ~= 10) and (var_190_2 ~= 15 or var_190_3 ~= 10)

                        if var_190_5 then
                                for iter_190_1, iter_190_2 in ipairs(var_190_0.obstacles) do
                                        if iter_190_2.x == var_190_2 and iter_190_2.y == var_190_3 then
                                                var_190_5 = false

                                                break
                                        end
                                end
                        end
                until var_190_5 or var_190_4 > 50

                if var_190_4 <= 50 then
                        table.insert(var_190_0.obstacles, {
                                x = var_190_2,
                                y = var_190_3
                        })
                end
        end
end

function G.games.update_snake()
        local var_191_0 = slot_0_2_0.snake

        if var_191_0.game_over then
                return
        end

        local var_191_1 = game.global_vars.real_time

        if var_191_1 - var_191_0.last_move < var_191_0.move_delay then
                return
        end

        var_191_0.last_move = var_191_1

        local var_191_2 = var_191_0.snake_body[1]
        local var_191_3 = {
                x = var_191_2.x + var_191_0.direction.x,
                y = var_191_2.y + var_191_0.direction.y
        }

        if var_191_3.x < 0 or var_191_3.x >= var_191_0.grid_size or var_191_3.y < 0 or var_191_3.y >= var_191_0.grid_size then
                var_191_0.game_over = true

                return
        end

        if var_191_0.obstacles then
                for iter_191_0, iter_191_1 in ipairs(var_191_0.obstacles) do
                        if var_191_3.x == iter_191_1.x and var_191_3.y == iter_191_1.y then
                                var_191_0.game_over = true

                                return
                        end
                end
        end

        for iter_191_2 = 2, #var_191_0.snake_body do
                local var_191_4 = var_191_0.snake_body[iter_191_2]

                if var_191_3.x == var_191_4.x and var_191_3.y == var_191_4.y then
                        var_191_0.game_over = true

                        return
                end
        end

        table.insert(var_191_0.snake_body, 1, var_191_3)

        if var_191_3.x == var_191_0.food.x and var_191_3.y == var_191_0.food.y then
                var_191_0.score = var_191_0.score + 1

                local var_191_5 = 0

                repeat
                        var_191_0.food = {
                                x = math.random(0, var_191_0.grid_size - 1),
                                y = math.random(0, var_191_0.grid_size - 1)
                        }
                        var_191_5 = var_191_5 + 1

                        local var_191_6 = true

                        if var_191_0.obstacles then
                                for iter_191_3, iter_191_4 in ipairs(var_191_0.obstacles) do
                                        if var_191_0.food.x == iter_191_4.x and var_191_0.food.y == iter_191_4.y then
                                                var_191_6 = false

                                                break
                                        end
                                end
                        end

                        if var_191_6 then
                                for iter_191_5, iter_191_6 in ipairs(var_191_0.snake_body) do
                                        if var_191_0.food.x == iter_191_6.x and var_191_0.food.y == iter_191_6.y then
                                                var_191_6 = false

                                                break
                                        end
                                end
                        end
                until var_191_6 or var_191_5 > 50
        else
                table.remove(var_191_0.snake_body)
        end
end

function slot_0_163_0(arg_192_0, arg_192_1, arg_192_2, arg_192_3, arg_192_4, arg_192_5, arg_192_6, arg_192_7, arg_192_8, arg_192_9)
        function slot_192_10_0(arg_193_0)
                return arg_193_0 == 1 and slot_0_62_0("game_diff_easy", "Easy") or arg_193_0 == 2 and slot_0_62_0("game_diff_medium", "Medium") or slot_0_62_0("game_diff_hard", "Hard")
        end

        slot_192_11_11 = arg_192_2

        slot_0_58_0(arg_192_0, theme.fonts.category, arg_192_1, slot_192_11_11, slot_0_62_0("nav_games", "Games"), theme.colors.text_light:mod_a(arg_192_8))

        slot_192_11_10 = slot_192_11_11 + 30

        function slot_192_12_0(arg_194_0)
                if not slot_0_32_0 then
                        return false
                end

                return bit.band(slot_0_32_0(arg_194_0) or 0, 32768) ~= 0
        end

        slot_192_13_0 = slot_0_2_0.snake_enable
        slot_0_2_0.snake_enable = slot_0_125_0(arg_192_0, arg_192_1, slot_192_11_10, slot_0_62_0("game_snake", "Snake"), slot_0_2_0.snake_enable, arg_192_5, arg_192_6, arg_192_7, arg_192_8)
        slot_192_11_9 = slot_192_11_10 + 34

        if slot_0_2_0.snake_enable and not slot_192_13_0 then
                slot_0_2_0.active_mini_game = "snake"
        end

        if not slot_0_2_0.snake_enable and slot_192_13_0 and slot_0_2_0.active_mini_game == "snake" then
                slot_0_2_0.active_mini_game = nil
        end

        if slot_0_2_0.snake_enable then
                slot_192_11_9 = slot_192_11_9 + 30
        end

        slot_192_14_0 = slot_0_2_0.minesweeper_enable
        slot_0_2_0.minesweeper_enable = slot_0_125_0(arg_192_0, arg_192_1, slot_192_11_9, slot_0_62_0("game_minesweeper", "Minesweeper"), slot_0_2_0.minesweeper_enable, arg_192_5, arg_192_6, arg_192_7, arg_192_8)
        slot_192_11_8 = slot_192_11_9 + 34

        if slot_0_2_0.minesweeper_enable and not slot_192_14_0 then
                slot_0_2_0.active_mini_game = "minesweeper"
        end

        if not slot_0_2_0.minesweeper_enable and slot_192_14_0 and slot_0_2_0.active_mini_game == "minesweeper" then
                slot_0_2_0.active_mini_game = nil
        end

        if slot_0_2_0.minesweeper_enable then
                slot_192_11_8 = slot_192_11_8 + 30
        end

        slot_192_11_7 = slot_192_11_8 + 40
        slot_192_15_0 = slot_0_2_0.chess_enable
        slot_0_2_0.chess_enable = slot_0_125_0(arg_192_0, arg_192_1, slot_192_11_7, slot_0_62_0("game_chess", "Chess"), slot_0_2_0.chess_enable, arg_192_5, arg_192_6, arg_192_7, arg_192_8)
        slot_192_11_6 = slot_192_11_7 + 34

        if slot_0_2_0.chess_enable and not slot_192_15_0 then
                slot_0_2_0.active_mini_game = "chess"
        end

        if not slot_0_2_0.chess_enable and slot_192_15_0 and slot_0_2_0.active_mini_game == "chess" then
                slot_0_2_0.active_mini_game = nil
        end

        if slot_0_2_0.chess_enable then
                slot_192_11_6 = slot_192_11_6 + 30
        end

        if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username == "LukinhasMenu" then
                slot_192_11_5 = slot_192_11_6 + 40

                slot_0_58_0(arg_192_0, theme.fonts.content_title, arg_192_1, slot_192_11_5, "Animation Test (Dev)", theme.colors.text_light:mod_a(arg_192_8))

                slot_192_11_4 = slot_192_11_5 + 30
                slot_192_16_0 = slot_0_2_0.animation_test.enabled
                slot_0_2_0.animation_test.enabled = slot_0_125_0(arg_192_0, arg_192_1, slot_192_11_4, "Enable Test Mode", slot_0_2_0.animation_test.enabled, arg_192_5, arg_192_6, arg_192_7, arg_192_8)
                slot_192_11_3 = slot_192_11_4 + 34

                if slot_0_2_0.animation_test.enabled then
                        slot_192_11_2 = slot_192_11_3 + 20
                        slot_192_17_0 = {}

                        for iter_192_0, iter_192_1 in ipairs(slot_0_2_0.animation_test.animations) do
                                slot_192_17_0[iter_192_0] = iter_192_1.name
                        end

                        slot_192_11_1 = slot_192_11_2 + (slot_0_128_0(arg_192_0, "animation_test_select", arg_192_1, slot_192_11_2, 200, 28, slot_192_17_0, slot_0_2_0.animation_test, "current_animation", arg_192_5, arg_192_6, arg_192_7, arg_192_8) or 28) + 12

                        if slot_0_124_0(arg_192_0, "test_animation_btn", arg_192_1, slot_192_11_1, 120, 28, "Test Animation", arg_192_5, arg_192_6, arg_192_7, arg_192_8) then
                                slot_0_0_0.active = true
                                slot_0_0_0.start_time = nil
                                slot_0_0_0.elapsed_time = 0
                                slot_0_0_0.sound_played = false
                                slot_0_0_0.selected_anim = slot_0_2_0.animation_test.animations[slot_0_2_0.animation_test.current_animation].type
                        end

                        slot_192_11_0 = slot_192_11_1 + 40
                end
        end
end

function slot_0_164_0(arg_195_0, arg_195_1, arg_195_2, arg_195_3, arg_195_4, arg_195_5, arg_195_6, arg_195_7, arg_195_8, arg_195_9)
        return
end

function slot_0_165_0(arg_196_0, arg_196_1, arg_196_2, arg_196_3, arg_196_4, arg_196_5, arg_196_6, arg_196_7, arg_196_8, arg_196_9)
        slot_196_10_2 = arg_196_2

        slot_0_58_0(arg_196_0, theme.fonts.category, arg_196_1, slot_196_10_2, slot_0_63_0("velocity_title"), theme.colors.text_light:mod_a(arg_196_8))

        slot_196_10_1 = slot_196_10_2 + 30
        hvh.velocity_enable = slot_0_125_0(arg_196_0, arg_196_1, slot_196_10_1, slot_0_63_0("velocity_enable"), hvh.velocity_enable, arg_196_5, arg_196_6, arg_196_7, arg_196_8)
        slot_196_10_0 = slot_196_10_1 + 34

        if hvh.velocity_enable then
                slot_196_11_0 = (arg_196_3 - 40) / 2
                slot_196_12_0 = arg_196_1
                slot_196_13_0 = arg_196_1 + slot_196_11_0 + 20
                slot_196_14_6 = slot_196_10_0
                slot_196_15_0 = slot_196_10_0

                slot_0_58_0(arg_196_0, theme.fonts.item, slot_196_12_0, slot_196_14_6, slot_0_63_0("velocity_style_label"), theme.colors.text_light:mod_a(arg_196_8))

                slot_196_14_5 = slot_196_14_6 + 22
                slot_196_16_0 = slot_0_63_0("velocity_style_options") or {
                        "Barra Horizontal",
                        "Círculo",
                        "Gráfico",
                        "Numérico",
                        "Onda",
                        "Velocímetro",
                        "Radar",
                        "Hexágono",
                        "Neon"
                }
                slot_196_14_4 = slot_196_14_5 + (slot_0_128_0(arg_196_0, "vel_style", slot_196_12_0, slot_196_14_5, slot_196_11_0 - 20, 28, slot_196_16_0, hvh, "velocity_style", arg_196_5, arg_196_6, arg_196_7, arg_196_8) or 28) + 15

                slot_0_58_0(arg_196_0, theme.fonts.item, slot_196_12_0, slot_196_14_4, slot_0_63_0("velocity_color_mode"), theme.colors.text_light:mod_a(arg_196_8))

                slot_196_14_3 = slot_196_14_4 + 22
                slot_196_18_0 = slot_0_63_0("velocity_color_mode_options") or {
                        "Baseado na Velocidade",
                        "Cor Estática",
                        "Rainbow"
                }
                slot_196_14_2 = slot_196_14_3 + (slot_0_128_0(arg_196_0, "vel_color_mode", slot_196_12_0, slot_196_14_3, slot_196_11_0 - 20, 28, slot_196_18_0, hvh, "velocity_color_mode", arg_196_5, arg_196_6, arg_196_7, arg_196_8) or 28) + 15
                hvh.velocity_show_numeric = slot_0_119_0(arg_196_0, slot_196_12_0, slot_196_14_2, slot_0_63_0("velocity_show_numeric"), hvh.velocity_show_numeric, arg_196_5, arg_196_6, arg_196_7, arg_196_8)
                slot_196_14_1 = slot_196_14_2 + 30

                slot_0_58_0(arg_196_0, theme.fonts.item, slot_196_12_0, slot_196_14_1, slot_0_63_0("velocity_preview"), theme.colors.text_light:mod_a(arg_196_8))

                slot_196_14_0 = slot_196_14_1 + 26
                slot_196_20_0 = slot_196_11_0 - 20
                slot_196_21_0 = 80

                arg_196_0:add_rect_filled(draw.rect(slot_196_12_0, slot_196_14_0, slot_196_12_0 + slot_196_20_0, slot_196_14_0 + slot_196_21_0), draw.color(15, 15, 20, 230))
                arg_196_0:add_rect(draw.rect(slot_196_12_0, slot_196_14_0, slot_196_12_0 + slot_196_20_0, slot_196_14_0 + slot_196_21_0), theme.colors.border_inner:mod_a(arg_196_8), 1)

                slot_196_22_0 = slot_196_12_0 + slot_196_20_0 / 2
                slot_196_23_0 = slot_196_14_0 + slot_196_21_0 / 2
                slot_196_24_0 = game and game.global_vars and (game.global_vars.real_time or game.global_vars.curtime) or 0
                slot_196_25_0 = 165 + math.sin(slot_196_24_0 * 1.5) * 115
                slot_196_26_0 = math.min(1, slot_196_25_0 / 300)
                slot_196_27_0 = nil

                if hvh.velocity_color_mode == 1 then
                        if slot_196_25_0 < 100 then
                                slot_196_27_0 = draw.color(50, 255, 50)
                        elseif slot_196_25_0 < 200 then
                                slot_196_27_0 = draw.color(255, 255, 50)
                        else
                                slot_196_27_0 = draw.color(255, 50, 50)
                        end
                elseif hvh.velocity_color_mode == 2 then
                        slot_196_27_0 = draw.color(100, 150, 255)
                else
                        slot_196_27_0 = slot_0_56_0(slot_196_24_0 * 50 % 360, 1, 1)
                end

                if hvh.velocity_style == 1 then
                        slot_196_28_5 = 100
                        slot_196_29_3 = 10
                        slot_196_30_2 = slot_196_28_5 * slot_196_26_0

                        arg_196_0:add_rect_filled(draw.rect(slot_196_22_0 - slot_196_28_5 / 2, slot_196_23_0 - slot_196_29_3 / 2, slot_196_22_0 - slot_196_28_5 / 2 + slot_196_30_2, slot_196_23_0 + slot_196_29_3 / 2), slot_196_27_0:mod_a(200))
                        arg_196_0:add_rect(draw.rect(slot_196_22_0 - slot_196_28_5 / 2, slot_196_23_0 - slot_196_29_3 / 2, slot_196_22_0 + slot_196_28_5 / 2, slot_196_23_0 + slot_196_29_3 / 2), draw.color(100, 100, 100, 150), 1)

                        if hvh.velocity_show_numeric then
                                slot_0_58_0(arg_196_0, theme.fonts.small, slot_196_22_0 - 12, slot_196_23_0 - 20, string.format("%.0f", slot_196_25_0), slot_196_27_0)
                        end
                elseif hvh.velocity_style == 2 then
                        slot_196_28_4 = slot_196_26_0 * 270

                        for iter_196_0 = 0, math.floor(slot_196_28_4 / 5) do
                                slot_196_33_5 = -135 + iter_196_0 * 5
                                slot_196_34_3 = math.rad(slot_196_33_5)
                                slot_196_35_4 = slot_196_22_0 + math.cos(slot_196_34_3) * 18
                                slot_196_36_1 = slot_196_23_0 + math.sin(slot_196_34_3) * 18
                                slot_196_37_2 = slot_196_22_0 + math.cos(slot_196_34_3) * 22
                                slot_196_38_1 = slot_196_23_0 + math.sin(slot_196_34_3) * 22

                                arg_196_0:add_line(draw.vec2(slot_196_35_4, slot_196_36_1), draw.vec2(slot_196_37_2, slot_196_38_1), slot_196_27_0:mod_a(200), 3)
                        end

                        arg_196_0:add_circle(draw.vec2(slot_196_22_0, slot_196_23_0), 22, draw.color(100, 100, 100, 100), 1)

                        if hvh.velocity_show_numeric then
                                slot_0_58_0(arg_196_0, theme.fonts.small, slot_196_22_0 - 12, slot_196_23_0 - 5, string.format("%.0f", slot_196_25_0), slot_196_27_0)
                        end
                elseif hvh.velocity_style == 3 then
                        for iter_196_1 = 1, 20 do
                                slot_196_32_5 = slot_196_12_0 + 10 + (iter_196_1 - 1) * 4.5
                                slot_196_33_4 = slot_196_12_0 + 10 + iter_196_1 * 4.5
                                slot_196_35_3 = (1 - (165 + math.sin((slot_196_24_0 - iter_196_1 * 0.1) * 1.5) * 115) / 300) * 35 - 5

                                arg_196_0:add_line(draw.vec2(slot_196_32_5, slot_196_14_0 + slot_196_21_0 - 10 + slot_196_35_3), draw.vec2(slot_196_33_4, slot_196_14_0 + slot_196_21_0 - 10 + slot_196_35_3), slot_196_27_0:mod_a(180), 2)
                        end
                elseif hvh.velocity_style == 4 then
                        slot_0_58_0(arg_196_0, theme.fonts.item, slot_196_22_0 - 20, slot_196_23_0 - 10, string.format("%.0f", slot_196_25_0), slot_196_27_0)
                elseif hvh.velocity_style == 5 then
                        for iter_196_2 = 0, 25 do
                                slot_196_32_4 = slot_196_12_0 + 5 + iter_196_2 * 3.5
                                slot_196_33_3 = slot_196_12_0 + 5 + (iter_196_2 + 1) * 3.5
                                slot_196_34_2 = math.sin(slot_196_24_0 * 3 + iter_196_2 * 0.5) * (slot_196_26_0 * 20)
                                slot_196_35_2 = math.sin(slot_196_24_0 * 3 + (iter_196_2 + 1) * 0.5) * (slot_196_26_0 * 20)

                                arg_196_0:add_line(draw.vec2(slot_196_32_4, slot_196_23_0 + slot_196_34_2), draw.vec2(slot_196_33_3, slot_196_23_0 + slot_196_35_2), slot_196_27_0:mod_a(200), 2)
                        end
                elseif hvh.velocity_style == 6 then
                        slot_196_28_3 = 32

                        arg_196_0:add_circle_filled(draw.vec2(slot_196_22_0, slot_196_23_0), slot_196_28_3 + 2, draw.color(10, 10, 12, 240))
                        arg_196_0:add_circle(draw.vec2(slot_196_22_0, slot_196_23_0), slot_196_28_3 + 2, draw.color(60, 60, 70, 255), 1)

                        for iter_196_3 = 0, 6 do
                                slot_196_33_2 = iter_196_3 * 50
                                slot_196_34_1 = math.pi * 0.75 + slot_196_33_2 / 350 * math.pi * 1.5
                                slot_196_35_1 = slot_196_28_3 - 5
                                slot_196_36_0 = slot_196_28_3 - 1
                                slot_196_37_1 = nil

                                if slot_196_33_2 < 100 then
                                        slot_196_37_1 = draw.color(100, 200, 100, 200)
                                elseif slot_196_33_2 < 200 then
                                        slot_196_37_1 = draw.color(200, 200, 100, 200)
                                else
                                        slot_196_37_1 = draw.color(200, 100, 100, 200)
                                end

                                arg_196_0:add_line(draw.vec2(slot_196_22_0 + math.cos(slot_196_34_1) * slot_196_35_1, slot_196_23_0 + math.sin(slot_196_34_1) * slot_196_35_1), draw.vec2(slot_196_22_0 + math.cos(slot_196_34_1) * slot_196_36_0, slot_196_23_0 + math.sin(slot_196_34_1) * slot_196_36_0), slot_196_37_1, 2)
                        end

                        slot_196_29_2 = math.pi * 0.75 + math.pi * 1.5 * slot_196_26_0
                        slot_196_30_1 = slot_196_22_0 + math.cos(slot_196_29_2) * (slot_196_28_3 - 7)
                        slot_196_31_1 = slot_196_23_0 + math.sin(slot_196_29_2) * (slot_196_28_3 - 7)

                        arg_196_0:add_line(draw.vec2(slot_196_22_0, slot_196_23_0), draw.vec2(slot_196_30_1, slot_196_31_1), slot_196_27_0:mod_a(220), 2)
                        arg_196_0:add_circle_filled(draw.vec2(slot_196_22_0, slot_196_23_0), 4, draw.color(60, 60, 65, 255))

                        if hvh.velocity_show_numeric then
                                slot_0_58_0(arg_196_0, theme.fonts.small, slot_196_22_0 - 10, slot_196_23_0 + 12, string.format("%.0f", slot_196_25_0), slot_196_27_0)
                        end
                elseif hvh.velocity_style == 7 then
                        slot_196_28_2 = 30

                        arg_196_0:add_circle_filled(draw.vec2(slot_196_22_0, slot_196_23_0), slot_196_28_2, draw.color(10, 15, 20, 240))
                        arg_196_0:add_circle(draw.vec2(slot_196_22_0, slot_196_23_0), slot_196_28_2, draw.color(50, 255, 50, 180), 2)

                        for iter_196_4 = 1, 2 do
                                arg_196_0:add_circle(draw.vec2(slot_196_22_0, slot_196_23_0), slot_196_28_2 * (iter_196_4 / 3), draw.color(50, 255, 50, 80), 1)
                        end

                        arg_196_0:add_line(draw.vec2(slot_196_22_0 - slot_196_28_2, slot_196_23_0), draw.vec2(slot_196_22_0 + slot_196_28_2, slot_196_23_0), draw.color(50, 255, 50, 60), 1)
                        arg_196_0:add_line(draw.vec2(slot_196_22_0, slot_196_23_0 - slot_196_28_2), draw.vec2(slot_196_22_0, slot_196_23_0 + slot_196_28_2), draw.color(50, 255, 50, 60), 1)

                        slot_196_29_1 = slot_196_24_0 * 2
                        slot_196_30_0 = slot_196_28_2 * (slot_196_26_0 * 0.6)
                        slot_196_31_0 = slot_196_22_0 + math.cos(slot_196_29_1) * slot_196_30_0
                        slot_196_32_1 = slot_196_23_0 + math.sin(slot_196_29_1) * slot_196_30_0

                        arg_196_0:add_circle_filled(draw.vec2(slot_196_31_0, slot_196_32_1), 3, slot_196_27_0:mod_a(200))
                elseif hvh.velocity_style == 8 then
                        slot_196_28_1 = 25

                        for iter_196_5 = 2, 0, -1 do
                                slot_196_33_1 = slot_196_28_1 * ((iter_196_5 + 1) / 3)

                                for iter_196_6 = 0, 5 do
                                        slot_196_38_0 = iter_196_6 / 6 * math.pi * 2
                                        slot_196_39_0 = (iter_196_6 + 1) / 6 * math.pi * 2
                                        slot_196_40_0 = slot_196_22_0 + math.cos(slot_196_38_0) * slot_196_33_1
                                        slot_196_41_0 = slot_196_23_0 + math.sin(slot_196_38_0) * slot_196_33_1
                                        slot_196_42_0 = slot_196_22_0 + math.cos(slot_196_39_0) * slot_196_33_1
                                        slot_196_43_0 = slot_196_23_0 + math.sin(slot_196_39_0) * slot_196_33_1
                                        slot_196_44_0 = iter_196_5 == 0 and 255 or iter_196_5 == 1 and 180 or 120
                                        slot_196_45_0 = iter_196_5 < slot_196_26_0 * 3 and slot_196_27_0 or draw.color(80, 80, 90)

                                        arg_196_0:add_line(draw.vec2(slot_196_40_0, slot_196_41_0), draw.vec2(slot_196_42_0, slot_196_43_0), slot_196_45_0:mod_a(slot_196_44_0), 2)
                                end
                        end
                elseif hvh.velocity_style == 9 then
                        slot_196_28_0 = 80
                        slot_196_29_0 = slot_196_22_0 - slot_196_28_0 / 2

                        arg_196_0:add_rect(draw.rect(slot_196_29_0, slot_196_23_0 - 20, slot_196_29_0 + slot_196_28_0, slot_196_23_0 + 20), draw.color(50, 150, 255, 200), 2)

                        for iter_196_7 = 0, 2 do
                                slot_196_34_0 = slot_196_23_0 - 10 + iter_196_7 * 8
                                slot_196_35_0 = slot_196_28_0 * (0.4 + iter_196_7 * 0.2) * slot_196_26_0

                                arg_196_0:add_rect_filled(draw.rect(slot_196_29_0 + 5, slot_196_34_0, slot_196_29_0 + 5 + slot_196_35_0, slot_196_34_0 + 5), slot_196_27_0:mod_a(200))
                        end

                        if hvh.velocity_show_numeric then
                                slot_0_58_0(arg_196_0, theme.fonts.small, slot_196_22_0 - 12, slot_196_23_0 + 15, string.format("%.0f", slot_196_25_0), slot_196_27_0)
                        end
                end

                slot_196_10_0 = slot_196_14_0 + slot_196_21_0 + 15
        end

        G.tab_heights = G.tab_heights or {}
        G.tab_heights.Velocity = math.max(0, slot_196_10_0 - arg_196_2 + 20)
end

function slot_0_166_0(arg_197_0, arg_197_1, arg_197_2, arg_197_3, arg_197_4, arg_197_5, arg_197_6, arg_197_7, arg_197_8, arg_197_9)
        slot_197_10_0 = (arg_197_3 - 20) * 0.5
        slot_197_11_6 = arg_197_2

        slot_0_58_0(arg_197_0, theme.fonts.category, arg_197_1, slot_197_11_6, slot_0_63_0("chatspam_enable"), theme.colors.text_light:mod_a(arg_197_8))

        slot_197_11_5 = slot_197_11_6 + 30
        slot_0_88_0.enable = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_5, slot_0_63_0("chatspam_enable"), slot_0_88_0.enable, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
        slot_197_11_4 = slot_197_11_5 + 35

        if slot_0_88_0.enable then
                slot_0_88_0.cooldown = slot_0_121_0(arg_197_0, "spam_cooldown", arg_197_1, slot_197_11_4, slot_197_10_0, slot_0_63_0("chatspam_cooldown"), 0.1, 10, slot_0_88_0.cooldown, arg_197_5, arg_197_6, arg_197_8, "%.1f")
                slot_197_11_4 = slot_197_11_4 + 50
                slot_0_88_0.sequential = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_4, slot_0_63_0("chatspam_sequential"), slot_0_88_0.sequential, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_4 = slot_197_11_4 + 35

                slot_0_58_0(arg_197_0, theme.fonts.item, arg_197_1, slot_197_11_4, slot_0_63_0("chatspam_message") .. " 1", theme.colors.text_light:mod_a(arg_197_8))

                slot_197_11_4 = slot_197_11_4 + 22
                slot_0_88_0.message1 = slot_0_126_0(arg_197_0, "spam_msg1", arg_197_1, slot_197_11_4, slot_197_10_0, 28, slot_0_88_0.message1, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_4 = slot_197_11_4 + 38

                slot_0_58_0(arg_197_0, theme.fonts.item, arg_197_1, slot_197_11_4, slot_0_63_0("chatspam_message") .. " 2", theme.colors.text_light:mod_a(arg_197_8))

                slot_197_11_4 = slot_197_11_4 + 22
                slot_0_88_0.message2 = slot_0_126_0(arg_197_0, "spam_msg2", arg_197_1, slot_197_11_4, slot_197_10_0, 28, slot_0_88_0.message2, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_4 = slot_197_11_4 + 38

                slot_0_58_0(arg_197_0, theme.fonts.item, arg_197_1, slot_197_11_4, slot_0_63_0("chatspam_message") .. " 3", theme.colors.text_light:mod_a(arg_197_8))

                slot_197_11_4 = slot_197_11_4 + 22
                slot_0_88_0.message3 = slot_0_126_0(arg_197_0, "spam_msg3", arg_197_1, slot_197_11_4, slot_197_10_0, 28, slot_0_88_0.message3, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_4 = slot_197_11_4 + 38
        end

        slot_197_11_3 = slot_197_11_4 + 20
        slot_0_88_0.antikick_enable = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_3, slot_0_63_0("chatspam_antikick"), slot_0_88_0.antikick_enable, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
        slot_197_11_2 = slot_197_11_3 + 35

        slot_0_58_0(arg_197_0, theme.fonts.small, arg_197_1, slot_197_11_2, "Vote Reveal:", theme.colors.text_light:mod_a(arg_197_8))

        slot_197_11_1 = slot_197_11_2 + 22
        slot_0_88_0.vote_reveal_enable = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_1, slot_0_63_0("vote_reveal_enable"), slot_0_88_0.vote_reveal_enable, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
        slot_197_11_0 = slot_197_11_1 + 30

        if slot_0_88_0.vote_reveal_enable then
                slot_0_58_0(arg_197_0, theme.fonts.small, arg_197_1, slot_197_11_0, "Onde mostrar:", theme.colors.text_light:mod_a(arg_197_8))

                slot_197_11_0 = slot_197_11_0 + 22
                slot_0_88_0.vote_reveal_notification = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_0, slot_0_63_0("vote_reveal_notification"), slot_0_88_0.vote_reveal_notification, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_0 = slot_197_11_0 + 30
                slot_0_88_0.vote_reveal_team_chat = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_0, slot_0_63_0("vote_reveal_team_chat"), slot_0_88_0.vote_reveal_team_chat, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_0 = slot_197_11_0 + 30
                slot_0_88_0.vote_reveal_all_chat = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_0, slot_0_63_0("vote_reveal_all_chat"), slot_0_88_0.vote_reveal_all_chat, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_0 = slot_197_11_0 + 30
                slot_197_11_0 = slot_197_11_0 + 10

                slot_0_58_0(arg_197_0, theme.fonts.small, arg_197_1, slot_197_11_0, "Quem mostrar:", theme.colors.text_light:mod_a(arg_197_8))

                slot_197_11_0 = slot_197_11_0 + 22
                slot_0_88_0.vote_reveal_show_allies = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_0, slot_0_63_0("vote_reveal_show_allies"), slot_0_88_0.vote_reveal_show_allies, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_0 = slot_197_11_0 + 30
                slot_0_88_0.vote_reveal_show_enemies = slot_0_125_0(arg_197_0, arg_197_1, slot_197_11_0, slot_0_63_0("vote_reveal_show_enemies"), slot_0_88_0.vote_reveal_show_enemies, arg_197_5, arg_197_6, arg_197_7, arg_197_8)
                slot_197_11_0 = slot_197_11_0 + 30
        end

        G.tab_heights = G.tab_heights or {}
        G.tab_heights.ChatSpam = math.max(0, slot_197_11_0 - arg_197_2 + 20)
end

function slot_0_167_0(arg_198_0, arg_198_1, arg_198_2, arg_198_3, arg_198_4, arg_198_5, arg_198_6, arg_198_7, arg_198_8, arg_198_9)
        slot_198_10_0 = (arg_198_3 - 20) * 0.5
        slot_198_11_15 = arg_198_2

        slot_0_58_0(arg_198_0, theme.fonts.category, arg_198_1, slot_198_11_15, slot_0_63_0("jumpscout_title"), theme.colors.text_light:mod_a(arg_198_8))

        slot_198_11_14 = slot_198_11_15 + 30
        slot_198_12_0 = not slot_0_64_0()
        slot_198_13_0 = theme.colors.accent and theme.colors.accent or draw.color(150, 150, 255)

        slot_0_58_0(arg_198_0, theme.fonts.small, arg_198_1, slot_198_11_14, slot_198_12_0 and "[INFO] JumpScout atualizado e com novas funcoes" or "[INFO] JumpScout updated with new features", slot_198_13_0:mod_a(arg_198_8))

        slot_198_11_13 = slot_198_11_14 + 15

        slot_0_58_0(arg_198_0, theme.fonts.small, arg_198_1, slot_198_11_13, slot_198_12_0 and "apenas na versao Tueurs.Pro!" or "only in Tueurs.Pro!", slot_198_13_0:mod_a(arg_198_8))

        slot_198_11_12 = slot_198_11_13 + 30
        hvh.js_fastladder = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_12, slot_0_63_0("jumpscout_fastladder"), hvh.js_fastladder, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
        slot_198_11_11 = slot_198_11_12 + 35
        hvh.js_enable = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_11, slot_0_63_0("jumpscout_enable"), hvh.js_enable, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
        slot_198_11_10 = slot_198_11_11 + 35

        if hvh.js_enable then
                hvh.js_autoconfig = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_10, slot_0_63_0("jumpscout_autoconfig"), hvh.js_autoconfig, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_9 = slot_198_11_10 + 35

                if hvh.js_autoconfig then
                        slot_0_58_0(arg_198_0, theme.fonts.small, arg_198_1, slot_198_11_9, slot_0_63_0("jumpscout_autoconfig_info"), theme.colors.text_normal:mod_a(arg_198_8))

                        slot_198_11_9 = slot_198_11_9 + 25
                else
                        hvh.js_hitchance = slot_0_121_0(arg_198_0, "js_hitchance", arg_198_1, slot_198_11_9, slot_198_10_0, slot_0_63_0("jumpscout_hitchance"), 0, 100, hvh.js_hitchance, arg_198_5, arg_198_6, arg_198_8, "%.0f", arg_198_7)
                        slot_198_11_9 = slot_198_11_9 + 50

                        if not hvh.js_autopointscale then
                                hvh.js_pointscale = slot_0_121_0(arg_198_0, "js_pointscale", arg_198_1, slot_198_11_9, slot_198_10_0, slot_0_63_0("jumpscout_pointscale"), 0, 100, hvh.js_pointscale, arg_198_5, arg_198_6, arg_198_8, "%.0f", arg_198_7)
                                slot_198_11_9 = slot_198_11_9 + 50
                        end

                        hvh.js_mindamage = slot_0_121_0(arg_198_0, "js_mindamage", arg_198_1, slot_198_11_9, slot_198_10_0, slot_0_63_0("jumpscout_mindamage"), 0, 120, hvh.js_mindamage, arg_198_5, arg_198_6, arg_198_8, "%.0f", arg_198_7)
                        slot_198_11_9 = slot_198_11_9 + 50
                end

                hvh.js_autoscope = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_9, slot_0_63_0("jumpscout_autoscope"), hvh.js_autoscope, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_8 = slot_198_11_9 + 35
                hvh.js_forceshoot = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_8, slot_0_63_0("jumpscout_forceshoot"), hvh.js_forceshoot, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_7 = slot_198_11_8 + 35
                hvh.js_autopointscale = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_7, slot_0_63_0("jumpscout_autopointscale"), hvh.js_autopointscale, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_6 = slot_198_11_7 + 35
                hvh.js_mindmg_onland = slot_0_121_0(arg_198_0, "js_mindmg_onland", arg_198_1, slot_198_11_6, slot_198_10_0, slot_0_63_0("jumpscout_mindmg_onland"), 0, 120, hvh.js_mindmg_onland, arg_198_5, arg_198_6, arg_198_8, "%.0f", arg_198_7)
                slot_198_11_5 = slot_198_11_6 + 50
                hvh.js_force_lethal_air = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_5, slot_0_63_0("jumpscout_force_lethal_air"), hvh.js_force_lethal_air, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_4 = slot_198_11_5 + 35
                hvh.js_headshot_only = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_4, slot_0_63_0("jumpscout_headshot_only"), hvh.js_headshot_only, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_3 = slot_198_11_4 + 35
                hvh.js_peek_assist = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_3, slot_0_63_0("jumpscout_peek_assist"), hvh.js_peek_assist, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_2 = slot_198_11_3 + 35
                hvh.js_duck_jump = slot_0_125_0(arg_198_0, arg_198_1, slot_198_11_2, slot_0_63_0("jumpscout_duckjump"), hvh.js_duck_jump, arg_198_5, arg_198_6, arg_198_7, arg_198_8)
                slot_198_11_1 = slot_198_11_2 + 35

                slot_0_58_0(arg_198_0, theme.fonts.small, arg_198_1, slot_198_11_1, slot_0_63_0("jumpscout_info"), theme.colors.text_normal:mod_a(arg_198_8))

                slot_198_11_0 = slot_198_11_1 + 20
        end
end

function slot_0_168_0(arg_199_0, arg_199_1, arg_199_2, arg_199_3, arg_199_4, arg_199_5, arg_199_6, arg_199_7, arg_199_8, arg_199_9, arg_199_10)
        arg_199_0:add_rect_filled_multicolor(draw.rect(arg_199_1, arg_199_2, arg_199_1 + arg_199_3, arg_199_2 + arg_199_4), {
                theme.colors.bg_content_grad:mod_a(arg_199_5),
                theme.colors.bg_content:mod_a(arg_199_5),
                theme.colors.bg_content:mod_a(arg_199_5),
                theme.colors.bg_content_grad:mod_a(arg_199_5)
        })

        slot_199_11_0 = {}

        for iter_199_0, iter_199_1 in ipairs(slot_0_82_0) do
                if iter_199_1.id == arg_199_7 then
                        slot_199_11_0 = iter_199_1

                        break
                end
        end

        slot_199_12_0 = 50

        slot_0_58_0(arg_199_0, theme.fonts.content_title, arg_199_1 + 25, arg_199_2 + 15, slot_0_63_0("active_tab") .. slot_0_63_0(slot_199_11_0.label_key or "nav_main"), theme.colors.text_light:mod_a(arg_199_6))

        slot_199_13_0 = slot_0_64_0() and slot_0_85_0 or slot_0_84_0
        slot_199_14_0 = "Update: " .. slot_199_13_0
        slot_199_15_0 = theme.fonts.item:get_text_size(slot_199_14_0).x

        slot_0_58_0(arg_199_0, theme.fonts.item, arg_199_1 + arg_199_3 - slot_199_15_0 - 25, arg_199_2 + 18, slot_199_14_0, theme.colors.text_normal:mod_a(arg_199_6 * 0.7))
        arg_199_0:add_rect_filled(draw.rect(arg_199_1, arg_199_2 + slot_199_12_0, arg_199_1 + arg_199_3, arg_199_2 + slot_199_12_0 + 1), theme.colors.border_inner:mod_a(arg_199_6 * 0.5))

        slot_199_16_0 = arg_199_1 + 25
        slot_199_17_0 = arg_199_2 + slot_199_12_0 + 25
        slot_199_18_0 = arg_199_3 - 50
        slot_199_19_0 = arg_199_4 - (slot_199_17_0 - arg_199_2) - 25
        slot_199_20_0 = draw.rect(slot_199_16_0, slot_199_17_0, slot_199_16_0 + slot_199_18_0, slot_199_17_0 + slot_199_19_0)
        G.content_scroll_y[slot_199_11_0.id or arg_199_7] = G.content_scroll_y[slot_199_11_0.id or arg_199_7] or 0
        slot_199_21_0 = slot_199_11_0.id or arg_199_7

        if scroll_this_frame ~= 0 and not game_panel_active and arg_199_7 ~= "Keybinds" and slot_0_57_0(slot_199_16_0, slot_199_17_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9) then
                G.content_scroll_y[slot_199_21_0] = math.max(0, G.content_scroll_y[slot_199_21_0] + scroll_this_frame * 40)
        end

        slot_199_22_0 = G.content_scroll_y[slot_199_21_0]

        arg_199_0:override_clip_rect(slot_199_20_0, true)

        slot_199_23_0 = #deferred

        if arg_199_7 == "Main" then
                slot_199_24_2 = slot_199_18_0 * 0.48
                slot_199_25_16 = slot_199_17_0 - slot_199_22_0
                slot_0_87_0.wm_enabled = slot_0_125_0(arg_199_0, slot_199_16_0, slot_199_25_16, slot_0_63_0("watermark_enable"), slot_0_87_0.wm_enabled, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_15 = slot_199_25_16 + 35
                slot_0_87_0.wm_animated_enabled = slot_0_125_0(arg_199_0, slot_199_16_0, slot_199_25_15, "Watermark Animada", slot_0_87_0.wm_animated_enabled, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_14 = slot_199_25_15 + 35
                slot_0_87_0.wm_is_rgb = slot_0_125_0(arg_199_0, slot_199_16_0, slot_199_25_14, slot_0_63_0("watermark_rgb"), slot_0_87_0.wm_is_rgb, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_13 = slot_199_25_14 + 40

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_16_0, slot_199_25_13, slot_0_63_0("watermark_color_segment"), theme.colors.text_light:mod_a(arg_199_6))

                slot_199_26_2 = slot_199_25_13 + 22
                slot_199_27_2 = slot_0_128_0(arg_199_0, "wm_segment", slot_199_16_0, slot_199_26_2, 260, 28, slot_0_63_0("watermark_color_segments"), slot_0_87_0, "wm_segment_index", arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_28_2 = slot_0_63_0("watermark_color_segments")[slot_0_87_0.wm_segment_index]
                slot_199_30_1 = ({
                        User = "user",
                        Tueurs = "tueurs",
                        Ping = "ping",
                        ["Mudar Tudo"] = "all",
                        FPS = "fps",
                        ["Change All"] = "all"
                })[slot_199_28_2] or "tueurs"
                slot_199_31_0 = slot_199_30_1 == "all" and slot_0_87_0.wm_colors.tueurs or slot_0_87_0.wm_colors[slot_199_30_1]
                slot_199_32_0 = {
                        h = 22,
                        w = 22,
                        x = slot_199_16_0 + 270,
                        y = slot_199_26_2
                }

                arg_199_0:add_rect_filled(draw.rect(slot_199_32_0.x, slot_199_32_0.y, slot_199_32_0.x + slot_199_32_0.w, slot_199_32_0.y + slot_199_32_0.h), slot_0_56_0(slot_199_31_0.h, slot_199_31_0.s, slot_199_31_0.v):mod_a(arg_199_6))
                arg_199_0:add_rect(draw.rect(slot_199_32_0.x, slot_199_32_0.y, slot_199_32_0.x + slot_199_32_0.w, slot_199_32_0.y + slot_199_32_0.h), theme.colors.border_inner:mod_a(arg_199_6))

                if arg_199_10 and slot_0_57_0(slot_199_32_0.x, slot_199_32_0.y, slot_199_32_0.w, slot_199_32_0.h, arg_199_8, arg_199_9) and not color_picker_open then
                        color_picker_open = true
                        color_picker_target = "wm_" .. slot_199_30_1
                end

                slot_199_25_12 = slot_199_26_2 + (slot_199_27_2 or 28) + 12

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_16_0, slot_199_25_12, slot_0_63_0("watermark_items"), theme.colors.text_light:mod_a(arg_199_6))

                slot_199_25_11 = slot_199_25_12 + 25
                slot_0_87_0.wm_selected.User = slot_0_119_0(arg_199_0, slot_199_16_0, slot_199_25_11, "User", slot_0_87_0.wm_selected.User, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_10 = slot_199_25_11 + 25
                slot_0_87_0.wm_selected.FPS = slot_0_119_0(arg_199_0, slot_199_16_0, slot_199_25_10, "FPS", slot_0_87_0.wm_selected.FPS, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_9 = slot_199_25_10 + 25
                slot_0_87_0.wm_selected.Ping = slot_0_119_0(arg_199_0, slot_199_16_0, slot_199_25_9, "Ping", slot_0_87_0.wm_selected.Ping, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_8 = slot_199_25_9 + 25
                slot_0_87_0.wm_selected.Build = slot_0_119_0(arg_199_0, slot_199_16_0, slot_199_25_8, "Build", slot_0_87_0.wm_selected.Build, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_7 = slot_199_25_8 + 25
                slot_0_87_0.wm_crosshair_enabled = slot_0_119_0(arg_199_0, slot_199_16_0, slot_199_25_7, "Watermark on Crosshair", slot_0_87_0.wm_crosshair_enabled, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_6 = slot_199_25_7 + 25
                slot_0_87_0.tueurs_detect = slot_0_119_0(arg_199_0, slot_199_16_0, slot_199_25_6, "Tueurs Detect", slot_0_87_0.tueurs_detect, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_5 = slot_199_25_6 + 25 + 15

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_16_0, slot_199_25_5, slot_0_63_0("language"), theme.colors.text_light:mod_a(arg_199_6))

                slot_199_25_4 = slot_199_25_5 + 24
                slot_199_25_3 = slot_199_25_4 + (slot_0_128_0(arg_199_0, "lang_select", slot_199_16_0, slot_199_25_4, 200, 28, slot_0_60_0.languages, slot_0_60_0, "language_index", arg_199_8, arg_199_9, arg_199_10, arg_199_6) or 28) + 12 + 10
                slot_0_86_0.enable_ui_sounds = slot_0_125_0(arg_199_0, slot_199_16_0, slot_199_25_3, slot_0_63_0("menu_ui_sounds_enable"), slot_0_86_0.enable_ui_sounds, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_25_2 = slot_199_25_3 + 35

                if slot_0_86_0.enable_ui_sounds then
                        slot_0_86_0.ui_tab_volume = slot_0_121_0(arg_199_0, "ui_tab_vol", slot_199_16_0, slot_199_25_2, slot_199_24_2, slot_0_63_0("menu_ui_tab_volume"), 0, 1, slot_0_86_0.ui_tab_volume, arg_199_8, arg_199_9, arg_199_6, "%.2f", arg_199_10)
                        slot_199_25_2 = slot_199_25_2 + 50
                        slot_0_86_0.ui_checkbox_volume = slot_0_121_0(arg_199_0, "ui_checkbox_vol", slot_199_16_0, slot_199_25_2, slot_199_24_2, slot_0_63_0("menu_ui_checkbox_volume"), 0, 1, slot_0_86_0.ui_checkbox_volume, arg_199_8, arg_199_9, arg_199_6, "%.2f", arg_199_10)
                        slot_199_25_2 = slot_199_25_2 + 50
                end

                arg_199_0:add_rect_filled(draw.rect(slot_199_16_0, slot_199_25_2, slot_199_16_0 + slot_199_24_2, slot_199_25_2 + 1), theme.colors.border_inner:mod_a(arg_199_6 * 0.5))

                slot_199_34_0 = slot_199_16_0 + slot_199_24_2 + 20
                slot_199_35_0 = slot_199_18_0 - slot_199_24_2 - 20
                slot_199_36_8 = slot_199_17_0 - slot_199_22_0

                slot_0_58_0(arg_199_0, theme.fonts.category, slot_199_34_0, slot_199_36_8, slot_0_63_0("watermark_preview"), theme.colors.text_light:mod_a(arg_199_6))
                arg_199_0:add_rect_filled(draw.rect(slot_199_34_0, slot_199_36_8 + 30, slot_199_34_0 + slot_199_35_0, slot_199_36_8 + 100), theme.colors.bg_sidebar:mod_a(arg_199_5))
                slot_0_108_0(arg_199_0, slot_199_34_0, slot_199_36_8 + 30, slot_199_35_0, 70, arg_199_6)

                slot_199_36_7 = slot_199_36_8 + 120

                arg_199_0:add_rect_filled(draw.rect(slot_199_34_0 - 25, slot_199_36_7, slot_199_34_0 + slot_199_35_0, slot_199_36_7 + 1), theme.colors.border_inner:mod_a(arg_199_6 * 0.5))

                slot_199_36_6 = slot_199_36_7 + 20

                slot_0_58_0(arg_199_0, theme.fonts.category, slot_199_34_0, slot_199_36_6, slot_0_63_0("configs_title"), theme.colors.text_light:mod_a(arg_199_6))

                slot_199_36_5 = slot_199_36_6 + 30

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_34_0, slot_199_36_5, slot_0_63_0("config_list"), theme.colors.text_normal:mod_a(arg_199_6))

                slot_199_36_4 = slot_199_36_5 + 20
                slot_199_37_0 = slot_0_128_0(arg_199_0, "cfg_list", slot_199_34_0, slot_199_36_4, slot_199_35_0 - 90, 28, slot_0_87_0.config_list, slot_0_87_0, "selected_config_index", arg_199_8, arg_199_9, arg_199_10, arg_199_6)

                if slot_0_124_0(arg_199_0, "cfg_refresh", slot_199_34_0 + slot_199_35_0 - 80, slot_199_36_4, 80, 28, slot_0_63_0("config_refresh"), arg_199_8, arg_199_9, arg_199_10, arg_199_6) then
                        refresh_config_list()
                end

                slot_199_36_3 = slot_199_36_4 + (slot_199_37_0 or 28) + 6
                slot_199_38_0 = slot_0_87_0.config_list[slot_0_87_0.selected_config_index]

                if slot_199_38_0 and slot_199_38_0 ~= "-" then
                        if slot_0_124_0(arg_199_0, "cfg_load", slot_199_34_0, slot_199_36_3, 80, 28, slot_0_63_0("config_load"), arg_199_8, arg_199_9, arg_199_10, arg_199_6) then
                                slot_0_87_0.show_load_confirm = true
                                slot_0_87_0.confirm_config_name = slot_0_87_0.config_list[slot_0_87_0.selected_config_index]
                        end

                        if slot_0_124_0(arg_199_0, "cfg_update", slot_199_34_0 + 90, slot_199_36_3, 80, 28, slot_0_63_0("config_update"), arg_199_8, arg_199_9, arg_199_10, arg_199_6) then
                                slot_0_87_0.show_update_confirm = true
                                slot_0_87_0.confirm_config_name = slot_0_87_0.config_list[slot_0_87_0.selected_config_index]
                        end

                        if slot_0_124_0(arg_199_0, "cfg_delete", slot_199_34_0 + 180, slot_199_36_3, 80, 28, slot_0_63_0("config_delete"), arg_199_8, arg_199_9, arg_199_10, arg_199_6) then
                                slot_0_87_0.show_delete_confirm = true
                                slot_0_87_0.confirm_config_name = slot_0_87_0.config_list[slot_0_87_0.selected_config_index]
                        end

                        slot_199_36_3 = slot_199_36_3 + 40
                end

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_34_0, slot_199_36_3, slot_0_63_0("config_name"), theme.colors.text_normal:mod_a(arg_199_6))

                slot_199_36_2 = slot_199_36_3 + 20
                slot_0_87_0.config_name_input = slot_0_126_0(arg_199_0, "cfg_name", slot_199_34_0, slot_199_36_2, slot_199_35_0 - 90, 28, slot_0_87_0.config_name_input, arg_199_8, arg_199_9, arg_199_10, arg_199_6)

                if slot_0_87_0.config_name_input and slot_0_87_0.config_name_input ~= "" then
                        if slot_0_124_0(arg_199_0, "cfg_save", slot_199_34_0 + slot_199_35_0 - 80, slot_199_36_2, 80, 28, slot_0_63_0("config_save"), arg_199_8, arg_199_9, arg_199_10, arg_199_6) then
                                slot_0_87_0.show_save_confirm = true
                        end

                        slot_199_36_2 = slot_199_36_2 + 40
                end

                slot_199_36_1 = slot_199_36_2 + 40

                if slot_0_124_0(arg_199_0, "discord_btn", slot_199_34_0, slot_199_36_1, 120, 28, "Discord", arg_199_8, arg_199_9, arg_199_10, arg_199_6) then
                        slot_0_36_0(nil, "open", "https://discord.gg/XruZEDhSUN", nil, nil, 1)
                end

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_34_0 + 130, slot_199_36_1 + 6, slot_0_63_0("discord_bug_report"), theme.colors.text_normal:mod_a(arg_199_6))

                slot_199_36_0 = slot_199_36_1 + 35

                if slot_0_124_0(arg_199_0, "custommatch_btn", slot_199_34_0, slot_199_36_0, 140, 28, "CustomMatch", arg_199_8, arg_199_9, arg_199_10, arg_199_6) then
                        game.engine:client_cmd("sv_cheats true;mp_respawn_on_death_ct true;mp_startmoney 999999999;mp_buytime 99999999999999999999;mp_maxmoney 9999999;mp_buy_anywhere 1;mp_freezetime 0;mp_roundtime_defuse 99999999999999999999;mp_roundtime 9999999999999999;bot_stop 1;mp_roundtime 999999999999999999;mp_respawn_on_death_t true;mp_respawn_on_death_ct true;mp_restartgame 1")
                end

                G.tab_heights = G.tab_heights or {}
                G.tab_heights.Main = math.max(slot_199_25_2, slot_199_36_0 + 40) - (slot_199_17_0 - slot_199_22_0) + 20
        elseif arg_199_7 == "Menu" then
                slot_0_111_0 = true
                slot_0_86_0.is_rgb = slot_0_125_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_0_63_0("menu_rgb"), slot_0_86_0.is_rgb, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_17_0 = slot_199_17_0 + 40

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_0_63_0("menu_color_target"), theme.colors.text_light:mod_a(arg_199_6))

                slot_199_24_1 = slot_199_17_0 - slot_199_22_0 + 22
                slot_199_25_1 = slot_0_128_0(arg_199_0, "menu_target", slot_199_16_0, slot_199_24_1, 260, 28, slot_0_63_0("menu_color_targets"), slot_0_86_0, "target_index", arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_26_1 = slot_0_86_0.target_key_map[slot_0_63_0("menu_color_targets")[slot_0_86_0.target_index]] or "borders"
                slot_199_27_1 = slot_199_26_1 == "accent" and {
                        h = slot_0_86_0.accent_hue,
                        s = slot_0_86_0.accent_sat,
                        v = slot_0_86_0.accent_val
                } or slot_0_86_0.target_hsv[slot_199_26_1]
                slot_199_28_1 = {
                        h = 22,
                        w = 22,
                        x = slot_199_16_0 + 270,
                        y = slot_199_24_1
                }

                arg_199_0:add_rect_filled(draw.rect(slot_199_28_1.x, slot_199_28_1.y, slot_199_28_1.x + slot_199_28_1.w, slot_199_28_1.y + slot_199_28_1.h), slot_0_56_0(slot_199_27_1.h, slot_199_27_1.s, slot_199_27_1.v):mod_a(arg_199_6))
                arg_199_0:add_rect(draw.rect(slot_199_28_1.x, slot_199_28_1.y, slot_199_28_1.x + slot_199_28_1.w, slot_199_28_1.y + slot_199_28_1.h), theme.colors.border_inner:mod_a(arg_199_6))

                if arg_199_10 and slot_0_57_0(slot_199_28_1.x, slot_199_28_1.y, slot_199_28_1.w, slot_199_28_1.h, arg_199_8, arg_199_9) and not color_picker_open then
                        color_picker_open = true
                        color_picker_target = "menu_" .. slot_199_26_1
                end

                slot_199_17_0 = slot_199_17_0 - slot_199_22_0 + 22
                slot_199_17_0 = slot_199_24_1 + (slot_199_25_1 or 28) + 12 + slot_199_22_0

                slot_0_58_0(arg_199_0, theme.fonts.item, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_0_63_0("menu_accent_color"), theme.colors.text_light:mod_a(arg_199_6))

                slot_199_29_3 = {
                        h = 20,
                        w = 20,
                        x = slot_199_16_0 + 220,
                        y = slot_199_17_0 - slot_199_22_0
                }

                arg_199_0:add_rect_filled(draw.rect(slot_199_29_3.x, slot_199_29_3.y, slot_199_29_3.x + slot_199_29_3.w, slot_199_29_3.y + slot_199_29_3.h), draw.color(0, 0, 0):hsv(slot_0_86_0.accent_hue, slot_0_86_0.accent_sat, slot_0_86_0.accent_val):mod_a(arg_199_6))
                arg_199_0:add_rect(draw.rect(slot_199_29_3.x, slot_199_29_3.y, slot_199_29_3.x + slot_199_29_3.w, slot_199_29_3.y + slot_199_29_3.h), theme.colors.border_inner:mod_a(arg_199_6))

                if arg_199_10 and slot_0_57_0(slot_199_29_3.x, slot_199_29_3.y, slot_199_29_3.w, slot_199_29_3.h, arg_199_8, arg_199_9) and not color_picker_open then
                        color_picker_open = true
                        color_picker_target = "menu"
                end

                slot_199_17_0 = slot_199_17_0 + 40
                slot_0_86_0.transparency = slot_0_121_0(arg_199_0, "menu_transparency", slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_0_63_0("menu_glass_effect"), 0.1, 1, slot_0_86_0.transparency, arg_199_8, arg_199_9, arg_199_6, "%.2f", arg_199_10)
                slot_199_17_0 = slot_199_17_0 + 50
                slot_0_86_0.blur_enable = slot_0_125_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, "Ativar Blur do Menu", slot_0_86_0.blur_enable, arg_199_8, arg_199_9, arg_199_10, arg_199_6)
                slot_199_17_0 = slot_199_17_0 + 35
                slot_0_111_0 = false
                G.tab_heights = G.tab_heights or {}
                G.tab_heights.Menu = slot_199_17_0 - (slot_199_17_0 - slot_199_22_0) + 20
        elseif G.FREE_VERSION_LOCKED_TABS[arg_199_7] then
                G.render_locked_tab(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_6)
        elseif arg_199_7 == "Velocity" then
                slot_0_165_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        elseif arg_199_7 == "JumpScout" then
                slot_0_167_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        elseif arg_199_7 == "Aimlock" then
                G.aimlock.render_tab(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        elseif arg_199_7 == "Blockbot" then
                slot_0_162_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        elseif arg_199_7 == "Games" then
                slot_0_163_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        elseif arg_199_7 == "Keybinds" then
                slot_0_161_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        elseif arg_199_7 == "ChatSpam" then
                slot_0_166_0(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        elseif arg_199_7 == "Anti-Aim" then
                if render_antiaim_tab then
                        render_antiaim_tab(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_5, arg_199_6, arg_199_8, arg_199_9, arg_199_10)
                end
        elseif arg_199_7 == "Tracers" then
                if G.render_tracers_tab then
                        G.render_tracers_tab(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
                end
        elseif arg_199_7 == "HitLogs" and G.render_hitlogs_tab then
                G.render_hitlogs_tab(arg_199_0, slot_199_16_0, slot_199_17_0 - slot_199_22_0, slot_199_18_0, slot_199_19_0, arg_199_8, arg_199_9, arg_199_10, arg_199_6, arg_199_5)
        end

        slot_199_24_0 = G.tab_heights and G.tab_heights[arg_199_7] or slot_199_19_0
        slot_199_25_0 = math.max(0, slot_199_24_0 - slot_199_19_0)

        if slot_199_25_0 < G.content_scroll_y[slot_199_21_0] then
                G.content_scroll_y[slot_199_21_0] = slot_199_25_0
        end

        if G.content_scroll_y[slot_199_21_0] < 0 then
                G.content_scroll_y[slot_199_21_0] = 0
        end

        if slot_199_23_0 < #deferred then
                for iter_199_2 = slot_199_23_0 + 1, #deferred do
                        slot_199_30_0 = deferred[iter_199_2]

                        if type(slot_199_30_0) == "function" then
                                slot_199_30_0()
                        end
                end

                for iter_199_3 = #deferred, slot_199_23_0 + 1, -1 do
                        deferred[iter_199_3] = nil
                end
        end

        arg_199_0:override_clip_rect(nil)

        slot_199_26_0 = 12
        slot_199_27_0 = arg_199_1 + arg_199_3
        slot_199_28_0 = arg_199_2 + arg_199_4
        slot_199_29_0 = theme.colors.border_inner:mod_a(arg_199_6 * 0.7)

        arg_199_0:add_line(draw.vec2(slot_199_27_0 - slot_199_26_0, slot_199_28_0 - 4), draw.vec2(slot_199_27_0 - 4, slot_199_28_0 - slot_199_26_0), slot_199_29_0, 1.5)
        arg_199_0:add_line(draw.vec2(slot_199_27_0 - slot_199_26_0 + 5, slot_199_28_0 - 4), draw.vec2(slot_199_27_0 - 4, slot_199_28_0 - slot_199_26_0 + 5), slot_199_29_0, 1.5)
end

function slot_0_169_0()
        if not slot_0_88_0.enable or not game.engine:in_game() then
                return
        end

        local var_200_0 = game.global_vars.real_time

        if math.max(slot_0_88_0.cooldown, 0.2) > var_200_0 - slot_0_88_0.last_sent_time then
                return
        end

        local var_200_1
        local var_200_2 = slot_0_88_0.current_message_index

        if slot_0_88_0.sequential then
                local var_200_3 = {
                        slot_0_88_0.message1,
                        slot_0_88_0.message2,
                        slot_0_88_0.message3
                }
                local var_200_4 = 0

                while var_200_4 < 3 do
                        local var_200_5 = var_200_3[var_200_2]

                        if var_200_5 and var_200_5 ~= "" and (var_200_5 ~= slot_0_88_0.last_sent_message or var_200_4 > 0) then
                                var_200_1 = var_200_5

                                break
                        end

                        var_200_2 = var_200_2 % 3 + 1
                        var_200_4 = var_200_4 + 1
                end
        elseif slot_0_88_0.message1 and slot_0_88_0.message1 ~= "" then
                var_200_1 = slot_0_88_0.message1
        end

        if var_200_1 then
                game.engine:client_cmd("say " .. var_200_1)

                slot_0_88_0.last_sent_time = var_200_0
                slot_0_88_0.last_sent_message = var_200_1

                if slot_0_88_0.sequential then
                        slot_0_88_0.current_message_index = var_200_2 % 3 + 1
                end
        end
end

events.create_move:add(function(arg_201_0)
        if menu_open and arg_201_0 and arg_201_0.remove_button then
                arg_201_0:remove_button(input_bit_mask.in_attack)
                arg_201_0:remove_button(input_bit_mask.in_attack2)
        end

        if G and G._miniui_draw then
                G._miniui_draw()
        end
end)
events.input:add(function(arg_202_0, arg_202_1, arg_202_2)
        scroll_this_frame = 0
        game_panel_active = false

        if arg_202_0 == slot_0_50_0 then
                slot_202_3_3 = ffi.cast("int16_t", bit.rshift(arg_202_1, 16))

                if slot_202_3_3 > 0 then
                        scroll_this_frame = -1
                elseif slot_202_3_3 < 0 then
                        scroll_this_frame = 1
                end
        end

        if not menu_open or not active_control_id then
                return
        end

        if arg_202_0 == 258 then
                if arg_202_1 >= 32 then
                        slot_202_3_2 = string.char(arg_202_1)

                        if active_control_id == "cfg_name" then
                                slot_0_87_0.config_name_input = slot_0_87_0.config_name_input .. slot_202_3_2
                        elseif active_control_id == "hvh_newname" then
                                hvh.new_name = (hvh.new_name or "") .. slot_202_3_2
                        elseif active_control_id == "hvh_txt_path" then
                                hvh.txt_path_input = (hvh.txt_path_input or "") .. slot_202_3_2
                        elseif active_control_id:find("^spam_msg") then
                                slot_202_4_2 = active_control_id:gsub("spam_msg", "")
                                slot_0_88_0["message" .. slot_202_4_2] = slot_0_88_0["message" .. slot_202_4_2] .. slot_202_3_2
                        elseif active_control_id:find("^mm_et_ks_") then
                                slot_202_4_1 = active_control_id:gsub("^mm_et_ks_", "")
                                slot_202_5_0 = _G and _G.EnemyTrackerState or EnemyTrackerState

                                if slot_202_5_0 then
                                        slot_202_5_0.killsay = slot_202_5_0.killsay or {}
                                        slot_202_5_0.killsay[slot_202_4_1] = (slot_202_5_0.killsay[slot_202_4_1] or "") .. slot_202_3_2
                                end
                        elseif active_control_id and slot_0_110_0 and (active_control_id == "pitch_min" or active_control_id == "pitch_max" or active_control_id == "pitch_jmin" or active_control_id == "pitch_jmax" or active_control_id == "yaw_min" or active_control_id == "yaw_max" or active_control_id == "yaw_jmin" or active_control_id == "yaw_jmax" or active_control_id == "aa_speed" or active_control_id == "aa_spin_speed") and slot_202_3_2:match("[0-9%-%+%.]") then
                                slot_0_110_0[active_control_id] = (slot_0_110_0[active_control_id] or "") .. slot_202_3_2
                        end
                end
        elseif arg_202_0 == 256 and arg_202_1 == slot_0_48_0 then
                if active_control_id == "cfg_name" and #slot_0_87_0.config_name_input > 0 then
                        slot_0_87_0.config_name_input = slot_0_87_0.config_name_input:sub(1, -2)
                elseif active_control_id == "hvh_newname" and hvh.new_name and #hvh.new_name > 0 then
                        hvh.new_name = hvh.new_name:sub(1, -2)
                elseif active_control_id == "hvh_txt_path" and hvh.txt_path_input and #hvh.txt_path_input > 0 then
                        hvh.txt_path_input = hvh.txt_path_input:sub(1, -2)
                elseif active_control_id:find("^spam_msg") then
                        slot_202_3_1 = active_control_id:gsub("spam_msg", "")

                        if slot_0_88_0["message" .. slot_202_3_1] and #slot_0_88_0["message" .. slot_202_3_1] > 0 then
                                slot_0_88_0["message" .. slot_202_3_1] = slot_0_88_0["message" .. slot_202_3_1]:sub(1, -2)
                        end
                elseif active_control_id:find("^mm_et_ks_") then
                        slot_202_3_0 = active_control_id:gsub("^mm_et_ks_", "")
                        slot_202_4_0 = _G and _G.EnemyTrackerState or EnemyTrackerState

                        if slot_202_4_0 and slot_202_4_0.killsay and slot_202_4_0.killsay[slot_202_3_0] and #slot_202_4_0.killsay[slot_202_3_0] > 0 then
                                slot_202_4_0.killsay[slot_202_3_0] = slot_202_4_0.killsay[slot_202_3_0]:sub(1, -2)
                        end
                elseif active_control_id and slot_0_110_0 and slot_0_110_0[active_control_id] and #slot_0_110_0[active_control_id] > 0 then
                        slot_0_110_0[active_control_id] = slot_0_110_0[active_control_id]:sub(1, -2)
                end
        end
end)

function slot_0_170_0()
        local var_203_0 = ffi.new("POINT[1]")

        if slot_0_33_0(var_203_0) then
                return tonumber(var_203_0[0].x), tonumber(var_203_0[0].y)
        end

        return 0, 0
end

function slot_0_171_0(arg_204_0)
        return bit.band(slot_0_32_0(arg_204_0), 32768) ~= 0
end

function slot_0_172_0(arg_205_0, arg_205_1, arg_205_2, arg_205_3, arg_205_4, arg_205_5, arg_205_6)
        if not arg_205_1 or not arg_205_4 then
                return 0
        end

        arg_205_0.font = arg_205_1

        local var_205_0 = arg_205_2

        for iter_205_0 in arg_205_4:gmatch(".") do
                arg_205_0:add_text(draw.vec2(var_205_0, arg_205_3), iter_205_0, arg_205_5)

                var_205_0 = var_205_0 + arg_205_1:get_text_size(iter_205_0).x + arg_205_6
        end

        return var_205_0 - arg_205_2
end

function slot_0_173_0(arg_206_0, arg_206_1, arg_206_2)
        if not arg_206_0 or not arg_206_1 then
                return 0
        end

        local var_206_0 = #arg_206_1 > 0 and (#arg_206_1 - 1) * arg_206_2 or 0

        return arg_206_0:get_text_size(arg_206_1).x + var_206_0
end

function draw_hud_style_1()
        if slot_0_97_0 and slot_0_97_0.crosshair_mode then
                return
        end

        slot_207_0_0 = draw.surface
        slot_207_1_0 = theme.fonts.kb_hud_style1

        if not slot_207_1_0 then
                return
        end

        slot_207_2_0 = {}
        slot_207_3_0 = 0
        slot_207_4_0 = 0
        slot_207_5_0 = slot_0_3_0()

        for iter_207_0, iter_207_1 in ipairs(slot_0_93_0) do
                if slot_0_95_0.selected[iter_207_1.label] then
                        slot_207_11_2 = false
                        slot_207_12_1 = ""
                        slot_207_13_1 = iter_207_1.path

                        if iter_207_1.is_weapon_specific then
                                slot_207_13_1 = slot_207_13_1 and slot_207_13_1:gsub("{WPN_GROUP}", slot_207_5_0)
                        end

                        slot_207_14_1 = slot_207_13_1 and gui.ctx:find(slot_207_13_1)
                        slot_207_11_1 = slot_0_4_0(slot_207_14_1)

                        if slot_207_11_1 then
                                slot_207_12_1 = "on"
                        end

                        if iter_207_1.value_paths and (slot_207_11_1 or iter_207_1.show_when == "always") then
                                slot_207_15_3 = {}

                                for iter_207_2, iter_207_3 in ipairs(iter_207_1.value_paths) do
                                        slot_207_15_3[#slot_207_15_3 + 1] = iter_207_3:gsub("{WPN_GROUP}", slot_207_5_0)
                                end

                                slot_207_17_1 = (function(arg_208_0)
                                        if not arg_208_0 then
                                                return nil
                                        end

                                        for iter_208_0, iter_208_1 in ipairs(arg_208_0) do
                                                local var_208_0 = gui.ctx:find(iter_208_1)

                                                if var_208_0 and type(var_208_0.get_value) == "function" then
                                                        local var_208_1 = var_208_0:get_value()

                                                        if var_208_1 and type(var_208_1.get) == "function" then
                                                                local var_208_2 = var_208_1:get()

                                                                if type(var_208_2) == "number" then
                                                                        return var_208_2
                                                                end
                                                        end
                                                end
                                        end

                                        return nil
                                end)(slot_207_15_3)

                                if slot_207_17_1 ~= nil then
                                        slot_207_12_1 = tostring(math.floor(slot_207_17_1 + 0.5)) .. (iter_207_1.unit or "")
                                end
                        end

                        if slot_0_95_0.color_mode then
                                slot_207_15_2 = slot_207_11_1 and theme.colors.kb_success or theme.colors.kb_danger
                                slot_207_16_2 = slot_207_11_1 and slot_207_12_1 or "off"

                                slot_0_90_0(slot_207_2_0, {
                                        label = iter_207_1.label,
                                        value = slot_207_16_2,
                                        color = slot_207_15_2
                                })

                                slot_207_3_0 = math.max(slot_207_3_0, slot_207_1_0:get_text_size(iter_207_1.label).x)
                                slot_207_4_0 = math.max(slot_207_4_0, slot_207_1_0:get_text_size(slot_207_16_2).x)
                        else
                                slot_207_15_1 = slot_0_95_0.items[iter_207_1.label]
                                slot_207_16_1 = slot_207_11_1 and 1 or 0
                                slot_207_15_1.alpha = slot_0_55_0(slot_207_15_1.alpha, slot_207_16_1, 0.15)

                                if slot_207_15_1.alpha > 0.01 then
                                        slot_0_90_0(slot_207_2_0, {
                                                label = iter_207_1.label,
                                                value = slot_207_12_1,
                                                color = theme.colors.text_light:mod_a(slot_207_15_1.alpha)
                                        })

                                        slot_207_3_0 = math.max(slot_207_3_0, slot_207_1_0:get_text_size(iter_207_1.label).x)
                                        slot_207_4_0 = math.max(slot_207_4_0, slot_207_1_0:get_text_size(slot_207_12_1).x)
                                end
                        end
                end
        end

        slot_207_6_0 = draw.textures.icon_keys
        slot_207_7_0 = slot_207_5_0:gsub("^%l", string.upper)
        slot_207_8_0 = "Keybinds (" .. slot_207_7_0 .. ")"
        slot_207_9_0 = (slot_207_6_0 and 18 or 0) + slot_207_1_0:get_text_size(slot_207_8_0).x

        if #slot_207_2_0 == 0 then
                return
        end

        slot_207_10_0 = 18
        slot_207_11_0 = 10
        slot_207_12_0 = 28
        slot_207_13_0 = slot_207_3_0 + slot_207_4_0 + slot_207_11_0 * 3
        slot_207_14_0 = math.max(slot_207_13_0, slot_207_9_0 + slot_207_11_0 * 2)
        slot_207_15_0 = #slot_207_2_0 * slot_207_10_0 + slot_207_11_0 * 2 + slot_207_12_0
        slot_207_16_0 = slot_0_65_0.x
        slot_207_17_0 = slot_0_65_0.y

        if slot_0_171_0(slot_0_49_0) and slot_0_65_0.pressed and slot_0_57_0(slot_0_95_0.x, slot_0_95_0.y, slot_207_14_0, slot_207_15_0, slot_207_16_0, slot_207_17_0) then
                slot_0_95_0.dragging, slot_0_95_0.drag_offx, slot_0_95_0.drag_offy = true, slot_207_16_0 - slot_0_95_0.x, slot_207_17_0 - slot_0_95_0.y
        end

        if slot_0_65_0.released then
                slot_0_95_0.dragging = false
        end

        if slot_0_95_0.dragging then
                slot_207_19_1, slot_207_20_0 = game.engine:get_screen_size()
                slot_0_95_0.x = slot_0_54_0(slot_207_16_0 - slot_0_95_0.drag_offx, 0, slot_207_19_1 - slot_207_14_0)
                slot_0_95_0.y = slot_0_54_0(slot_207_17_0 - slot_0_95_0.drag_offy, 0, slot_207_20_0 - slot_207_15_0)
        end

        slot_207_0_0:add_shadow_rect(draw.rect(slot_0_95_0.x, slot_0_95_0.y, slot_0_95_0.x + slot_207_14_0, slot_0_95_0.y + slot_207_15_0), 10, true, 0.4)
        slot_207_0_0:add_rect_filled_rounded(draw.rect(slot_0_95_0.x, slot_0_95_0.y, slot_0_95_0.x + slot_207_14_0, slot_0_95_0.y + slot_207_15_0), theme.colors.bg_content:mod_a(0.85), 6)
        slot_207_0_0:add_rect_rounded(draw.rect(slot_0_95_0.x, slot_0_95_0.y, slot_0_95_0.x + slot_207_14_0, slot_0_95_0.y + slot_207_15_0), theme.colors.border_inner, 6)

        slot_207_19_0 = slot_0_95_0.x + slot_207_11_0

        if slot_207_6_0 then
                slot_207_0_0.g:set_texture(slot_207_6_0)
                slot_207_0_0:add_rect_filled(draw.rect(slot_207_19_0, slot_0_95_0.y + slot_207_11_0 - 2, slot_207_19_0 + 16, slot_0_95_0.y + slot_207_11_0 + 14), draw.color(255, 255, 255))
                slot_207_0_0.g:set_texture(nil)

                slot_207_19_0 = slot_207_19_0 + 18
        end

        slot_0_58_0(slot_207_0_0, slot_207_1_0, slot_207_19_0, slot_0_95_0.y + slot_207_11_0, slot_207_8_0, theme.colors.text_light)
        slot_207_0_0:add_rect_filled(draw.rect(slot_0_95_0.x + 4, slot_0_95_0.y + slot_207_12_0 - 4, slot_0_95_0.x + slot_207_14_0 - 4, slot_0_95_0.y + slot_207_12_0 - 3), theme.colors.border_inner:mod_a(0.5))

        for iter_207_4, iter_207_5 in ipairs(slot_207_2_0) do
                slot_207_25_0 = slot_0_95_0.y + slot_207_11_0 + slot_207_12_0 + (iter_207_4 - 1) * slot_207_10_0

                slot_0_58_0(slot_207_0_0, slot_207_1_0, slot_0_95_0.x + slot_207_11_0, slot_207_25_0, iter_207_5.label, iter_207_5.color)

                slot_207_26_0 = slot_207_1_0:get_text_size(iter_207_5.value).x

                slot_0_58_0(slot_207_0_0, slot_207_1_0, slot_0_95_0.x + slot_207_14_0 - slot_207_11_0 - slot_207_26_0, slot_207_25_0, iter_207_5.value, iter_207_5.color)
        end
end

function draw_lua_keybinds_hud()
        if not slot_0_97_0.enable and not slot_0_97_0.crosshair_mode then
                return
        end

        if slot_0_97_0.crosshair_mode then
                slot_209_0_1 = draw.surface
                slot_209_1_1, slot_209_2_1 = game.engine:get_screen_size()
                slot_209_3_1 = game.global_vars.frame_time or 0.01
                slot_209_4_1 = entities.get_local_pawn()
                slot_209_5_1 = false

                if slot_209_4_1 and slot_209_4_1:is_alive() and slot_209_4_1.m_bIsScoped then
                        slot_209_5_1 = slot_209_4_1.m_bIsScoped:get()
                end

                slot_0_97_0.scope_lerp = slot_0_97_0.scope_lerp or 0
                slot_209_6_3 = slot_209_5_1 and 1 or 0
                slot_0_97_0.scope_lerp = slot_0_55_0(slot_0_97_0.scope_lerp, slot_209_6_3, slot_209_3_1 * 12)
                slot_209_7_2 = slot_0_97_0.scope_lerp * 80
                slot_209_8_0 = slot_209_1_1 / 2 + 20 + slot_209_7_2
                slot_209_9_1 = slot_209_2_1 / 2
                slot_209_10_1 = slot_209_9_1 + 22

                if hvh and (hvh.hc_enable and hvh.hc_active or hvh.anti_miss_enable and hvh.anti_miss_count and hvh.anti_miss_count > 0) then
                        slot_209_10_1 = slot_209_9_1 + 62
                end

                slot_0_97_0.kb_anims = slot_0_97_0.kb_anims or {}
                slot_209_11_1 = game.global_vars.frame_time or 0.01
                slot_209_12_2 = slot_0_3_0()
                slot_209_13_1 = slot_0_95_0.selected

                if slot_0_94_0.selected_style == 2 then
                        slot_209_13_1 = slot_0_96_0.selected
                end

                function slot_209_14_3(arg_210_0)
                        if not arg_210_0 then
                                return nil
                        end

                        for iter_210_0, iter_210_1 in ipairs(arg_210_0) do
                                local var_210_0 = gui.ctx:find(iter_210_1)

                                if var_210_0 and type(var_210_0.get_value) == "function" then
                                        local var_210_1 = var_210_0:get_value()

                                        if var_210_1 and type(var_210_1.get) == "function" then
                                                local var_210_2 = var_210_1:get()

                                                if type(var_210_2) == "number" then
                                                        return var_210_2
                                                end
                                        end
                                end
                        end

                        return nil
                end

                slot_209_15_2 = {}

                for iter_209_0, iter_209_1 in ipairs(slot_0_93_0) do
                        slot_209_21_1 = false
                        slot_209_22_1 = iter_209_1.path

                        if iter_209_1.is_weapon_specific then
                                slot_209_22_1 = slot_209_22_1 and slot_209_22_1:gsub("{WPN_GROUP}", slot_209_12_2)
                        end

                        slot_209_23_2 = slot_209_13_1 and slot_209_13_1[iter_209_1.label]

                        if slot_209_22_1 and slot_209_23_2 then
                                slot_209_24_3 = gui.ctx:find(slot_209_22_1)
                                slot_209_21_1 = slot_0_4_0(slot_209_24_3)
                        end

                        slot_209_24_2 = nil

                        if slot_209_23_2 and iter_209_1.value_paths and (slot_209_21_1 or iter_209_1.show_when == "always") then
                                slot_209_25_3 = {}

                                for iter_209_2, iter_209_3 in ipairs(iter_209_1.value_paths) do
                                        slot_209_25_3[#slot_209_25_3 + 1] = iter_209_3:gsub("{WPN_GROUP}", slot_209_12_2)
                                end

                                slot_209_24_2 = slot_209_14_3(slot_209_25_3)

                                if slot_209_24_2 == nil and slot_209_12_2 ~= "General" then
                                        slot_209_26_3 = {}

                                        for iter_209_4, iter_209_5 in ipairs(iter_209_1.value_paths) do
                                                slot_209_26_3[#slot_209_26_3 + 1] = iter_209_5:gsub("{WPN_GROUP}", "General")
                                        end

                                        slot_209_27_3 = slot_209_14_3(slot_209_26_3)

                                        if slot_209_27_3 then
                                                slot_209_24_2 = slot_209_27_3
                                                slot_209_12_2 = "General"
                                        end
                                end
                        end

                        slot_209_25_2 = iter_209_1.label

                        if slot_209_24_2 ~= nil then
                                slot_209_26_2 = tostring(math.floor(slot_209_24_2 + 0.5))

                                if iter_209_1.label == "Rage MinDmg" then
                                        slot_209_25_2 = slot_209_12_2 .. " (" .. slot_209_26_2 .. ")"
                                elseif iter_209_1.label == "Rage HC" then
                                        slot_209_25_2 = "Hitchance (" .. slot_209_26_2 .. "%)"
                                else
                                        slot_209_25_2 = iter_209_1.label .. " [" .. slot_209_26_2 .. (iter_209_1.unit or "") .. "]"
                                end
                        end

                        slot_209_26_1 = slot_0_97_0.kb_anims[iter_209_1.label] or {
                                alpha = 0,
                                y = 0
                        }
                        slot_209_27_2 = (slot_209_21_1 or iter_209_1.show_when == "always" and slot_209_23_2) and 1 or 0

                        if (slot_0_87_0 and slot_0_87_0.kb_anim_mode or 1) == 2 then
                                slot_209_26_1.alpha = slot_209_27_2
                        else
                                slot_209_26_1.alpha = slot_0_55_0(slot_209_26_1.alpha, slot_209_27_2, slot_209_11_1 * 15)
                        end

                        slot_0_97_0.kb_anims[iter_209_1.label] = slot_209_26_1

                        if slot_209_26_1.alpha > 0.01 then
                                table.insert(slot_209_15_2, {
                                        label = slot_209_25_2,
                                        info = slot_209_26_1
                                })
                        end
                end

                slot_209_16_1 = 0
                slot_209_17_1 = 16

                for iter_209_6, iter_209_7 in ipairs(slot_209_15_2) do
                        if anim_mode == 2 then
                                iter_209_7.info.y = slot_209_16_1
                        else
                                iter_209_7.info.y = slot_0_55_0(iter_209_7.info.y, slot_209_16_1, slot_209_11_1 * 15)
                        end

                        slot_209_23_1 = iter_209_7.info.alpha
                        slot_209_24_1 = slot_209_10_1 + iter_209_7.info.y
                        slot_209_25_1 = iter_209_7.label
                        slot_209_27_1 = slot_209_8_0 - theme.fonts.mono:get_text_size(slot_209_25_1).x / 2
                        slot_209_28_1 = draw.color(0, 0, 0, slot_209_23_1 * 255)

                        slot_0_58_0(slot_209_0_1, theme.fonts.mono, slot_209_27_1 + 1, slot_209_24_1, slot_209_25_1, slot_209_28_1)
                        slot_0_58_0(slot_209_0_1, theme.fonts.mono, slot_209_27_1 - 1, slot_209_24_1, slot_209_25_1, slot_209_28_1)
                        slot_0_58_0(slot_209_0_1, theme.fonts.mono, slot_209_27_1, slot_209_24_1 + 1, slot_209_25_1, slot_209_28_1)
                        slot_0_58_0(slot_209_0_1, theme.fonts.mono, slot_209_27_1, slot_209_24_1 - 1, slot_209_25_1, slot_209_28_1)

                        slot_209_29_0 = draw.color(255, 255, 255, 255)

                        if slot_0_87_0 and slot_0_87_0.kb_color then
                                slot_209_30_2 = slot_0_87_0.kb_color
                                slot_209_29_0 = slot_0_56_0(slot_209_30_2.h, slot_209_30_2.s, slot_209_30_2.v)
                        end

                        slot_209_30_1 = draw.color(slot_209_29_0:get_r(), slot_209_29_0:get_g(), slot_209_29_0:get_b(), math.floor(slot_209_23_1 * 255))

                        slot_0_58_0(slot_209_0_1, theme.fonts.mono, slot_209_27_1, slot_209_24_1, slot_209_25_1, slot_209_30_1)

                        slot_209_16_1 = slot_209_16_1 + slot_209_17_1
                end

                return
        end

        if not slot_0_97_0.enable then
                return
        end

        slot_209_0_0 = draw.surface
        slot_209_1_0 = theme.fonts.kb_hud_style1

        if not slot_209_1_0 then
                return
        end

        slot_209_2_0 = {}

        for iter_209_8, iter_209_9 in ipairs(slot_0_98_0) do
                if iter_209_9.check_func and iter_209_9.check_func() then
                        slot_0_90_0(slot_209_2_0, iter_209_9.label)
                end
        end

        if #slot_209_2_0 == 0 then
                return
        end

        slot_209_3_0 = 12
        slot_209_4_0 = 22
        slot_209_5_0 = 30
        slot_209_6_1 = 0
        slot_209_7_0 = "LUA KEYBINDS"
        slot_209_6_0 = slot_209_1_0:get_text_size(slot_209_7_0).x

        for iter_209_10, iter_209_11 in ipairs(slot_209_2_0) do
                slot_209_14_2 = slot_209_1_0:get_text_size(iter_209_11).x
                slot_209_6_0 = math.max(slot_209_6_0, slot_209_14_2)
        end

        slot_209_9_0 = slot_209_6_0 + slot_209_3_0 * 2 + 30
        slot_209_10_0 = slot_209_5_0 + #slot_209_2_0 * slot_209_4_0 + slot_209_3_0 * 2
        slot_209_11_0 = slot_0_65_0.x
        slot_209_12_0 = slot_0_65_0.y

        if slot_0_171_0(slot_0_49_0) and slot_0_65_0.pressed and slot_0_57_0(slot_0_97_0.x, slot_0_97_0.y, slot_209_9_0, slot_209_10_0, slot_209_11_0, slot_209_12_0) then
                slot_0_97_0.dragging = true
                slot_0_97_0.drag_offx = slot_209_11_0 - slot_0_97_0.x
                slot_0_97_0.drag_offy = slot_209_12_0 - slot_0_97_0.y
        end

        if slot_0_65_0.released then
                slot_0_97_0.dragging = false
        end

        if slot_0_97_0.dragging then
                slot_209_14_1, slot_209_15_1 = game.engine:get_screen_size()
                slot_0_97_0.x = slot_0_54_0(slot_209_11_0 - slot_0_97_0.drag_offx, 0, slot_209_14_1 - slot_209_9_0)
                slot_0_97_0.y = slot_0_54_0(slot_209_12_0 - slot_0_97_0.drag_offy, 0, slot_209_15_1 - slot_209_10_0)
        end

        slot_209_14_0 = slot_0_97_0.x
        slot_209_15_0 = slot_0_97_0.y

        slot_209_0_0:add_rect_filled_rounded(draw.rect(slot_209_14_0, slot_209_15_0, slot_209_14_0 + slot_209_9_0, slot_209_15_0 + slot_209_10_0), draw.color(15, 15, 20, 240), 8)

        slot_209_16_0 = nil

        if slot_0_97_0.color_mode then
                slot_209_18_1 = (game.global_vars.real_time or 0) * 50 % 360
                slot_209_16_0 = slot_0_99_0(slot_209_18_1, 1, 1, 200)
        else
                slot_209_16_0 = theme.colors.accent:mod_a(0.8)
        end

        slot_209_0_0:add_rect_rounded(draw.rect(slot_209_14_0 + 1, slot_209_15_0 + 1, slot_209_14_0 + slot_209_9_0 - 1, slot_209_15_0 + slot_209_10_0 - 1), slot_209_16_0, 7, 1)

        slot_209_17_0 = slot_209_14_0 + slot_209_3_0
        slot_209_18_0 = nil

        if slot_0_97_0.color_mode then
                slot_209_20_0 = (game.global_vars.real_time or 0) * 50 % 360
                slot_209_18_0 = slot_0_99_0(slot_209_20_0, 1, 1, 255)
        else
                slot_209_18_0 = theme.colors.accent
        end

        slot_0_58_0(slot_209_0_0, slot_209_1_0, slot_209_17_0, slot_209_15_0 + 8, slot_209_7_0, slot_209_18_0)

        slot_209_19_0 = slot_209_15_0 + slot_209_5_0 + slot_209_3_0

        for iter_209_12, iter_209_13 in ipairs(slot_209_2_0) do
                slot_209_25_0 = slot_209_14_0 + slot_209_3_0
                slot_209_26_0 = slot_209_19_0 + slot_209_4_0 / 2
                slot_209_27_0 = nil
                slot_209_28_0 = nil

                if slot_0_97_0.color_mode then
                        slot_209_30_0 = (game.global_vars.real_time or 0) * 50 % 360
                        slot_209_27_0 = slot_0_99_0(slot_209_30_0, 1, 1, 255)
                        slot_209_28_0 = draw.color(255, 255, 255)
                else
                        slot_209_27_0 = theme.colors.kb_success
                        slot_209_28_0 = theme.colors.text_light
                end

                slot_209_0_0:add_circle_filled(draw.vec2(slot_209_25_0 + 3, slot_209_26_0), 4, slot_209_27_0)
                slot_209_0_0:add_circle(draw.vec2(slot_209_25_0 + 3, slot_209_26_0), 4, slot_209_27_0, 1)
                slot_0_58_0(slot_209_0_0, slot_209_1_0, slot_209_25_0 + 15, slot_209_19_0 + 3, iter_209_13, slot_209_28_0)

                slot_209_19_0 = slot_209_19_0 + slot_209_4_0
        end
end

function draw_hud_style_2()
        if slot_0_97_0 and slot_0_97_0.crosshair_mode then
                return
        end

        slot_211_0_0 = draw.surface
        slot_211_1_0 = theme.fonts.kb_hud_style2

        if not slot_211_1_0 then
                return
        end

        slot_211_2_0 = {}
        slot_211_3_0 = 0
        slot_211_4_0 = slot_0_3_0()

        for iter_211_0, iter_211_1 in ipairs(slot_0_93_0) do
                if slot_0_96_0.selected[iter_211_1.label] then
                        slot_211_10_2 = slot_0_96_0.items[iter_211_1.label]
                        slot_211_11_3 = false
                        slot_211_12_0 = ""
                        slot_211_13_0 = iter_211_1.path

                        if iter_211_1.is_weapon_specific then
                                slot_211_13_0 = slot_211_13_0 and slot_211_13_0:gsub("{WPN_GROUP}", slot_211_4_0)
                        end

                        slot_211_14_0 = slot_211_13_0 and gui.ctx:find(slot_211_13_0)
                        slot_211_11_2 = slot_0_4_0(slot_211_14_0)

                        if iter_211_1.value_paths and (slot_211_11_2 or iter_211_1.show_when == "always") then
                                slot_211_15_2 = {}

                                for iter_211_2, iter_211_3 in ipairs(iter_211_1.value_paths) do
                                        slot_211_15_2[#slot_211_15_2 + 1] = iter_211_3:gsub("{WPN_GROUP}", slot_211_4_0)
                                end

                                slot_211_17_1 = (function(arg_212_0)
                                        if not arg_212_0 then
                                                return nil
                                        end

                                        for iter_212_0, iter_212_1 in ipairs(arg_212_0) do
                                                local var_212_0 = gui.ctx:find(iter_212_1)

                                                if var_212_0 and type(var_212_0.get_value) == "function" then
                                                        local var_212_1 = var_212_0:get_value()

                                                        if var_212_1 and type(var_212_1.get) == "function" then
                                                                local var_212_2 = var_212_1:get()

                                                                if type(var_212_2) == "number" then
                                                                        return var_212_2
                                                                end
                                                        end
                                                end
                                        end

                                        return nil
                                end)(slot_211_15_2)

                                if slot_211_17_1 ~= nil then
                                        slot_211_12_0 = tostring(math.floor(slot_211_17_1 + 0.5)) .. (iter_211_1.unit or "")
                                end
                        end

                        slot_211_15_1 = iter_211_1.label

                        if (slot_211_11_2 or iter_211_1.show_when == "always") and slot_211_12_0 ~= "" and slot_211_12_0 ~= "on" then
                                slot_211_15_1 = slot_211_15_1 .. " [" .. slot_211_12_0 .. "]"
                        end

                        slot_211_10_2.alpha = slot_0_55_0(slot_211_10_2.alpha, 1, 0.2)

                        if slot_211_11_2 and not slot_211_10_2.was_active then
                                slot_211_10_2.animation_phase = "disappearing"
                                slot_211_10_2.animation_timer = game.global_vars.real_time
                        elseif not slot_211_11_2 and slot_211_10_2.was_active and slot_211_10_2.animation_phase ~= "disappearing" and slot_211_10_2.animation_phase ~= "falling" then
                                slot_211_10_2.animation_phase = "settled"
                        end

                        slot_211_10_2.was_active = slot_211_11_2

                        slot_0_90_0(slot_211_2_0, {
                                label = slot_211_15_1,
                                active = slot_211_11_2,
                                state = slot_211_10_2
                        })

                        slot_211_3_0 = math.max(slot_211_3_0, slot_0_173_0(slot_211_1_0, slot_211_15_1, slot_0_96_0.letter_spacing))
                end
        end

        if #slot_211_2_0 == 0 then
                return
        end

        slot_211_5_0 = slot_211_3_0
        slot_211_6_0 = #slot_211_2_0 * slot_211_1_0.height
        slot_211_7_0 = slot_0_65_0.x
        slot_211_8_0 = slot_0_65_0.y

        if slot_0_171_0(slot_0_49_0) and slot_0_65_0.pressed and slot_0_57_0(slot_0_96_0.x, slot_0_96_0.y, slot_211_5_0, slot_211_6_0, slot_211_7_0, slot_211_8_0) then
                slot_0_96_0.dragging, slot_0_96_0.drag_offx, slot_0_96_0.drag_offy = true, slot_211_7_0 - slot_0_96_0.x, slot_211_8_0 - slot_0_96_0.y
        end

        if slot_0_65_0.released then
                slot_0_96_0.dragging = false
        end

        if slot_0_96_0.dragging then
                slot_211_10_1, slot_211_11_1 = game.engine:get_screen_size()
                slot_0_96_0.x = slot_0_54_0(slot_211_7_0 - slot_0_96_0.drag_offx, 0, slot_211_10_1 - slot_211_5_0)
                slot_0_96_0.y = slot_0_54_0(slot_211_8_0 - slot_0_96_0.drag_offy, 0, slot_211_11_1 - slot_211_6_0)
        end

        function slot_211_10_0(arg_213_0, arg_213_1, arg_213_2, arg_213_3)
                local var_213_0 = arg_213_3:get_a() / 255
                local var_213_1 = theme.colors.accent:mod_a(var_213_0 * 0.7)

                for iter_213_0 = 1, 4 do
                        local var_213_2 = math.random(-2, 2)
                        local var_213_3 = math.random(-2, 2)

                        slot_0_172_0(slot_211_0_0, slot_211_1_0, arg_213_1 + var_213_2, arg_213_2 + var_213_3, arg_213_0, var_213_1, slot_0_96_0.letter_spacing)
                end

                slot_0_172_0(slot_211_0_0, slot_211_1_0, arg_213_1, arg_213_2, arg_213_0, arg_213_3, slot_0_96_0.letter_spacing)
        end

        slot_211_11_0 = slot_0_96_0.y

        for iter_211_4, iter_211_5 in ipairs(slot_211_2_0) do
                slot_211_17_0 = iter_211_5.state
                slot_211_18_0 = iter_211_5.label

                if slot_211_17_0.animation_phase == "disappearing" then
                        slot_211_19_2 = game.global_vars.real_time - slot_211_17_0.animation_timer
                        slot_211_20_1 = 0.18
                        slot_211_21_1 = 1 - slot_0_54_0(slot_211_19_2 / slot_211_20_1, 0, 1)
                        slot_211_22_0 = theme.colors.kb_danger:mod_a(slot_211_17_0.alpha * slot_211_21_1)

                        slot_211_10_0(slot_211_18_0, slot_0_96_0.x, slot_211_11_0, slot_211_22_0)

                        if slot_211_21_1 <= 0 then
                                slot_211_17_0.animation_phase = "falling"
                                slot_211_17_0.letters = {}
                                slot_211_23_0 = 0

                                for iter_211_6 = 1, #slot_211_18_0 do
                                        slot_211_28_1 = slot_211_18_0:sub(iter_211_6, iter_211_6)

                                        slot_0_90_0(slot_211_17_0.letters, {
                                                vy = 0,
                                                state = "waiting",
                                                char = slot_211_28_1,
                                                x_offset = slot_211_23_0,
                                                current_y = slot_211_11_0 - 150,
                                                target_y = slot_211_11_0
                                        })

                                        slot_211_23_0 = slot_211_23_0 + slot_211_1_0:get_text_size(slot_211_28_1).x + slot_0_96_0.letter_spacing
                                end

                                slot_211_17_0.next_letter_to_fall = 1
                                slot_211_17_0.last_letter_fall_time = 0
                        end
                elseif slot_211_17_0.animation_phase == "falling" then
                        slot_211_19_1 = game.global_vars.real_time
                        slot_211_20_0 = 0.05

                        if slot_211_17_0.next_letter_to_fall <= #slot_211_17_0.letters and slot_211_20_0 < slot_211_19_1 - slot_211_17_0.last_letter_fall_time then
                                slot_211_17_0.letters[slot_211_17_0.next_letter_to_fall].state = "falling"
                                slot_211_17_0.next_letter_to_fall = slot_211_17_0.next_letter_to_fall + 1
                                slot_211_17_0.last_letter_fall_time = slot_211_19_1
                        end

                        slot_211_21_0 = true

                        for iter_211_7, iter_211_8 in ipairs(slot_211_17_0.letters) do
                                if iter_211_8.state == "falling" then
                                        slot_211_21_0 = false
                                        slot_211_27_0 = slot_0_96_0.fall_speed
                                        slot_211_28_0 = 0.4
                                        iter_211_8.vy = iter_211_8.vy + slot_211_27_0 * game.global_vars.frame_time
                                        iter_211_8.current_y = iter_211_8.current_y + iter_211_8.vy * game.global_vars.frame_time

                                        if iter_211_8.current_y >= iter_211_8.target_y then
                                                iter_211_8.current_y = iter_211_8.target_y
                                                iter_211_8.vy = -iter_211_8.vy * slot_211_28_0

                                                if math.abs(iter_211_8.vy) < 20 then
                                                        iter_211_8.state = "settled"
                                                end
                                        end
                                end

                                if iter_211_8.state ~= "waiting" then
                                        slot_211_10_0(iter_211_8.char, slot_0_96_0.x + iter_211_8.x_offset, iter_211_8.current_y, theme.colors.kb_success:mod_a(slot_211_17_0.alpha))
                                end
                        end

                        if slot_211_21_0 and #slot_211_17_0.letters > 0 then
                                slot_211_17_0.animation_phase = "settled"
                        end
                else
                        slot_211_19_0 = (iter_211_5.active and theme.colors.kb_success or theme.colors.kb_danger):mod_a(slot_211_17_0.alpha)

                        slot_211_10_0(slot_211_18_0, slot_0_96_0.x, slot_211_11_0, slot_211_19_0)
                end

                slot_211_11_0 = slot_211_11_0 + slot_211_1_0.height
        end
end

slot_0_174_1 = {
        dragging = false,
        apply_mode = "MM",
        mark_selected = false,
        ui_open = false,
        features_enabled = false,
        mode_premier = true,
        __name = "enemy_tracker",
        enable_aim_assist = false,
        last_update = 0,
        ui_x = 120,
        killsay_enable = false,
        enabled = false,
        drag_dx = 0,
        drag_dy = 0,
        ui_h = 300,
        ui_w = 300,
        ui_y = 140,
        selected_names = {},
        tags = {},
        killsay = {},
        cache = {}
}
EnemyTrackerState = slot_0_174_1

if _G then
        _G.EnemyTrackerState = slot_0_174_1
end

slot_0_175_1 = _G and _G.ffi or nil
slot_0_176_1 = _G and _G.jit or nil
slot_0_177_1 = slot_0_176_1 and slot_0_176_1.os == "Windows" or false
slot_0_178_1 = slot_0_175_1 ~= nil and slot_0_177_1
slot_0_179_1 = nil
slot_0_180_1 = nil
slot_0_181_1 = 1
slot_0_182_1 = 36

if slot_0_178_1 then
        slot_0_175_1.cdef("      typedef struct { long x; long y; } POINT;\n      short __stdcall GetAsyncKeyState(int vKey);\n      int   __stdcall GetCursorPos(POINT* lpPoint);\n    ")

        slot_0_183_3 = slot_0_175_1.load("user32")
        slot_0_179_1 = slot_0_183_3.GetAsyncKeyState

        function slot_0_180_1()
                local var_214_0 = slot_0_175_1.new("POINT[1]")

                if slot_0_183_3.GetCursorPos(var_214_0) ~= 0 then
                        return tonumber(var_214_0[0].x), tonumber(var_214_0[0].y)
                end

                return nil, nil
        end

        if slot_0_2_0.snake_window.open or slot_0_2_0.minesweeper_window.open or slot_0_2_0.chess_window.open then
                s:add_rect_filled_rounded(draw.rect(12, 44, 210, 68), draw.color(15, 15, 18, 180), 6)
                slot_0_58_0(s, theme.fonts.small, 18, 50, slot_0_62_0("miniui_active_hint", "Mini UI active (Shift-drag to move, X to close)"), theme.colors.text_light)
        end
end

G._miniui_draw = __draw_panel_impl

if events and events.present_queue and events.present_queue.add then
        events.present_queue:add(function()
                if G and G._miniui_draw then
                        G._miniui_draw()
                end
        end)
end

if events and events.present_queue and events.present_queue.add then
        events.present_queue:add(function()
                if not draw or not draw.surface then
                        return
                end

                slot_216_0_0 = game and game.engine

                if not slot_216_0_0 or not slot_216_0_0.get_screen_size then
                        return
                end

                slot_216_1_0 = draw.surface
                slot_216_2_0, slot_216_3_0 = slot_216_0_0:get_screen_size()
                slot_216_4_0 = slot_0_2_0 and (slot_0_2_0.active_mini_game or slot_0_2_0.chess_enable and "chess" or slot_0_2_0.minesweeper_enable and "minesweeper" or slot_0_2_0.snake_enable and "snake") or nil

                if not slot_216_4_0 then
                        return
                end

                G._miniui_box = G._miniui_box or {
                        dragging = false,
                        w = 460,
                        ox = 0,
                        oy = 0,
                        h = 160,
                        x = math.floor(slot_216_2_0 / 2 - 230),
                        y = math.floor(slot_216_3_0 / 2 - 180)
                }
                slot_216_5_0 = G._miniui_box
                slot_216_6_0 = slot_0_65_0 or {
                        released = false,
                        down = false,
                        pressed = false,
                        x = 0,
                        y = 0
                }
                slot_216_7_0 = slot_216_6_0.x or 0
                slot_216_8_0 = slot_216_6_0.y or 0
                slot_216_9_0 = slot_216_6_0.pressed == true
                slot_216_10_0 = slot_216_6_0.down == true
                slot_216_11_0 = slot_216_6_0.released == true
                slot_216_12_0 = slot_0_171_0 and slot_0_49_0 and slot_0_171_0(slot_0_49_0) or false

                function slot_216_13_0(arg_217_0)
                        return arg_217_0 == 1 and slot_0_62_0("game_diff_easy", "Easy") or arg_217_0 == 2 and slot_0_62_0("game_diff_medium", "Medium") or slot_0_62_0("game_diff_hard", "Hard")
                end

                slot_216_14_0 = slot_216_5_0.x
                slot_216_15_0 = slot_216_5_0.y
                slot_216_16_0 = 260
                slot_216_17_0 = 260

                if slot_216_4_0 == "snake" then
                        slot_216_18_3 = slot_0_2_0.snake

                        if not slot_216_18_3.snake_body[1] and G and G.games and G.games.init_snake then
                                G.games.init_snake()
                        end

                        function slot_216_19_3(arg_218_0)
                                if slot_0_171_0 then
                                        return slot_0_171_0(arg_218_0)
                                end

                                if slot_0_179_1 then
                                        return bit.band(slot_0_179_1(arg_218_0) or 0, 32768) ~= 0
                                end

                                return false
                        end

                        slot_216_20_3 = slot_216_19_3(37)
                        slot_216_21_3 = slot_216_19_3(38)
                        slot_216_22_4 = slot_216_19_3(39)
                        slot_216_23_8 = slot_216_19_3(40)

                        if slot_216_20_3 and slot_216_18_3.direction.x ~= 1 then
                                slot_216_18_3.direction = {
                                        x = -1,
                                        y = 0
                                }
                        elseif slot_216_22_4 and slot_216_18_3.direction.x ~= -1 then
                                slot_216_18_3.direction = {
                                        x = 1,
                                        y = 0
                                }
                        elseif slot_216_21_3 and slot_216_18_3.direction.y ~= 1 then
                                slot_216_18_3.direction = {
                                        x = 0,
                                        y = -1
                                }
                        elseif slot_216_23_8 and slot_216_18_3.direction.y ~= -1 then
                                slot_216_18_3.direction = {
                                        x = 0,
                                        y = 1
                                }
                        end

                        if G and G.games and G.games.update_snake then
                                G.games.update_snake()
                        end

                        slot_216_19_2 = slot_216_18_3.grid_size * slot_216_18_3.cell_size
                        slot_216_16_0, slot_216_17_0 = slot_216_19_2, slot_216_19_2 + 56

                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_14_0 - 2, slot_216_15_0 - 2, slot_216_14_0 + slot_216_19_2 + 2, slot_216_15_0 + slot_216_19_2 + 2), theme.colors.bg_content)

                        for iter_216_0 = 0, slot_216_18_3.grid_size - 1 do
                                for iter_216_1 = 0, slot_216_18_3.grid_size - 1 do
                                        slot_216_28_4 = slot_216_14_0 + iter_216_1 * slot_216_18_3.cell_size
                                        slot_216_29_3 = slot_216_15_0 + iter_216_0 * slot_216_18_3.cell_size
                                        slot_216_30_3 = (iter_216_1 + iter_216_0) % 2 == 0

                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_28_4, slot_216_29_3, slot_216_28_4 + slot_216_18_3.cell_size, slot_216_29_3 + slot_216_18_3.cell_size), slot_216_30_3 and draw.color(30, 30, 36, 200) or draw.color(26, 26, 30, 200))
                                end
                        end

                        slot_216_20_2 = slot_216_14_0 + slot_216_18_3.food.x * slot_216_18_3.cell_size
                        slot_216_21_2 = slot_216_15_0 + slot_216_18_3.food.y * slot_216_18_3.cell_size

                        slot_216_1_0:add_rect_filled_rounded(draw.rect(slot_216_20_2 + 4, slot_216_21_2 + 4, slot_216_20_2 + slot_216_18_3.cell_size - 4, slot_216_21_2 + slot_216_18_3.cell_size - 4), draw.color(200, 60, 60, 240), 3)

                        for iter_216_2, iter_216_3 in ipairs(slot_216_18_3.snake_body) do
                                slot_216_27_4 = slot_216_14_0 + iter_216_3.x * slot_216_18_3.cell_size
                                slot_216_28_3 = slot_216_15_0 + iter_216_3.y * slot_216_18_3.cell_size
                                slot_216_29_2 = iter_216_2 == 1 and theme.colors.accent or theme.colors.accent:darken(0.15)

                                slot_216_1_0:add_rect_filled_rounded(draw.rect(slot_216_27_4 + 2, slot_216_28_3 + 2, slot_216_27_4 + slot_216_18_3.cell_size - 2, slot_216_28_3 + slot_216_18_3.cell_size - 2), slot_216_29_2, 4)
                        end

                        if slot_216_18_3.obstacles then
                                for iter_216_4, iter_216_5 in ipairs(slot_216_18_3.obstacles) do
                                        slot_216_27_3 = slot_216_14_0 + iter_216_5.x * slot_216_18_3.cell_size
                                        slot_216_28_2 = slot_216_15_0 + iter_216_5.y * slot_216_18_3.cell_size

                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_27_3 + 3, slot_216_28_2 + 3, slot_216_27_3 + slot_216_18_3.cell_size - 3, slot_216_28_2 + slot_216_18_3.cell_size - 3), draw.color(80, 80, 90, 220))
                                        slot_216_1_0:add_rect(draw.rect(slot_216_27_3 + 3, slot_216_28_2 + 3, slot_216_27_3 + slot_216_18_3.cell_size - 3, slot_216_28_2 + slot_216_18_3.cell_size - 3), draw.color(120, 120, 130, 255), 1)
                                end
                        end

                        slot_216_22_3 = slot_216_15_0 + slot_216_19_2 + 8

                        if slot_0_124_0(slot_216_1_0, "mini_snake_diff", slot_216_14_0, slot_216_22_3, 170, 24, slot_0_62_0("game_difficulty_label", "Difficulty") .. " " .. slot_216_13_0(slot_0_2_0.snake_difficulty), slot_216_7_0, slot_216_8_0, slot_216_9_0, 1) then
                                slot_0_2_0.snake_difficulty = slot_0_2_0.snake_difficulty % 3 + 1

                                if G and G.games and G.games.init_snake then
                                        G.games.init_snake()
                                end
                        end

                        if slot_0_124_0(slot_216_1_0, "mini_snake_restart", slot_216_14_0 + 180, slot_216_22_3, 110, 24, slot_0_62_0("game_restart", "Restart"), slot_216_7_0, slot_216_8_0, slot_216_9_0, 1) and G and G.games and G.games.init_snake then
                                G.games.init_snake()
                        end

                        if slot_216_18_3.game_over then
                                slot_216_23_6 = slot_216_22_3 + 28

                                slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_14_0, slot_216_23_6, slot_0_62_0("game_over", "GAME OVER!"), draw.color(255, 60, 60, 255))
                        end
                elseif slot_216_4_0 == "minesweeper" then
                        slot_216_18_2 = slot_0_2_0.minesweeper

                        if not slot_216_18_2.grid[1] and G and G.games and G.games.init_minesweeper then
                                G.games.init_minesweeper()
                        end

                        slot_216_19_1 = slot_216_18_2.grid_w * slot_216_18_2.cell_size
                        slot_216_20_1 = slot_216_18_2.grid_h * slot_216_18_2.cell_size
                        slot_216_16_0, slot_216_17_0 = slot_216_19_1, slot_216_20_1 + 56

                        function slot_216_21_1(arg_219_0, arg_219_1, arg_219_2, arg_219_3, arg_219_4, arg_219_5)
                                return arg_219_0 <= arg_219_4 and arg_219_4 <= arg_219_0 + arg_219_2 and arg_219_1 <= arg_219_5 and arg_219_5 <= arg_219_1 + arg_219_3
                        end

                        if slot_216_9_0 and slot_216_21_1(slot_216_14_0, slot_216_15_0, slot_216_19_1, slot_216_20_1, slot_216_7_0, slot_216_8_0) and not slot_216_18_2.game_over and not slot_216_18_2.won then
                                slot_216_22_2 = math.floor((slot_216_7_0 - slot_216_14_0) / slot_216_18_2.cell_size) + 1
                                slot_216_23_5 = math.floor((slot_216_8_0 - slot_216_15_0) / slot_216_18_2.cell_size) + 1

                                if slot_216_22_2 >= 1 and slot_216_22_2 <= (slot_216_18_2.grid_w or 0) and slot_216_23_5 >= 1 and slot_216_23_5 <= (slot_216_18_2.grid_h or 0) then
                                        if slot_216_12_0 then
                                                slot_216_18_2.flagged[slot_216_23_5] = slot_216_18_2.flagged[slot_216_23_5] or {}
                                                slot_216_18_2.flagged[slot_216_23_5][slot_216_22_2] = not slot_216_18_2.flagged[slot_216_23_5][slot_216_22_2]
                                        elseif G and G.games and G.games.reveal_cell then
                                                G.games.reveal_cell(slot_216_22_2, slot_216_23_5)
                                        end
                                end
                        end

                        for iter_216_6 = 1, slot_216_18_2.grid_h do
                                for iter_216_7 = 1, slot_216_18_2.grid_w do
                                        slot_216_30_2 = slot_216_14_0 + (iter_216_7 - 1) * slot_216_18_2.cell_size
                                        slot_216_31_4 = slot_216_15_0 + (iter_216_6 - 1) * slot_216_18_2.cell_size
                                        slot_216_32_4 = draw.rect(slot_216_30_2, slot_216_31_4, slot_216_30_2 + slot_216_18_2.cell_size, slot_216_31_4 + slot_216_18_2.cell_size)

                                        if not slot_216_18_2.revealed[iter_216_6][iter_216_7] then
                                                slot_216_1_0:add_rect_filled(slot_216_32_4, draw.color(45, 45, 54, 220))

                                                if slot_216_18_2.flagged[iter_216_6][iter_216_7] then
                                                        slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_30_2 + 6, slot_216_31_4 + 2, "F", draw.color(255, 200, 0, 230))
                                                end
                                        else
                                                slot_216_34_1 = slot_216_18_2.grid[iter_216_6][iter_216_7]

                                                if slot_216_34_1 == -1 then
                                                        slot_216_1_0:add_rect_filled(slot_216_32_4, draw.color(180, 50, 50, 220))
                                                else
                                                        slot_216_1_0:add_rect_filled(slot_216_32_4, draw.color(36, 36, 42, 220))

                                                        if slot_216_34_1 > 0 then
                                                                slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_30_2 + 6, slot_216_31_4 + 2, tostring(slot_216_34_1), draw.color(180, 220, 255, 230))
                                                        end
                                                end
                                        end

                                        slot_216_1_0:add_rect(slot_216_32_4, draw.color(70, 70, 80, 220))
                                end
                        end

                        slot_216_22_1 = slot_216_15_0 + slot_216_20_1 + 8

                        if slot_0_124_0(slot_216_1_0, "mini_ms_diff", slot_216_14_0, slot_216_22_1, 170, 24, slot_0_62_0("game_difficulty_label", "Difficulty") .. " " .. slot_216_13_0(slot_0_2_0.minesweeper_difficulty), slot_216_7_0, slot_216_8_0, slot_216_9_0, 1) then
                                slot_0_2_0.minesweeper_difficulty = slot_0_2_0.minesweeper_difficulty % 3 + 1

                                if G and G.games and G.games.init_minesweeper then
                                        G.games.init_minesweeper()
                                end
                        end

                        if slot_0_124_0(slot_216_1_0, "mini_ms_restart", slot_216_14_0 + 180, slot_216_22_1, 110, 24, slot_0_62_0("game_restart", "Restart"), slot_216_7_0, slot_216_8_0, slot_216_9_0, 1) and G and G.games and G.games.init_minesweeper then
                                G.games.init_minesweeper()
                        end

                        slot_216_23_4 = slot_216_22_1 + 28

                        if slot_216_18_2.won then
                                slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_14_0, slot_216_23_4, slot_0_62_0("game_you_won", "YOU WON!"), draw.color(0, 255, 100, 255))
                        elseif slot_216_18_2.game_over then
                                slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_14_0, slot_216_23_4, slot_0_62_0("game_exploded", "EXPLODED!"), draw.color(255, 50, 50, 255))
                        end
                elseif slot_216_4_0 == "chess" then
                        slot_216_18_1 = slot_0_2_0.chess

                        if not slot_216_18_1.board[1] and G and G.games and G.games.init_chess then
                                G.games.init_chess()
                        end

                        slot_216_19_0 = 8 * slot_216_18_1.cell_size
                        slot_216_16_0, slot_216_17_0 = slot_216_19_0, slot_216_19_0 + 56
                        slot_0_2_0.__ai = slot_0_2_0.__ai or {
                                active = false
                        }

                        function slot_216_20_0(arg_220_0)
                                if not G or not G.games or not G.games.get_all_valid_moves then
                                        return
                                end

                                local var_220_0 = G.games.get_all_valid_moves(arg_220_0, -1)

                                if not var_220_0 or type(var_220_0) ~= "table" or #var_220_0 == 0 then
                                        return
                                end

                                slot_0_2_0.__ai = {
                                        i = 1,
                                        active = true,
                                        board = arg_220_0,
                                        moves = var_220_0,
                                        evaluated = {}
                                }
                        end

                        function slot_216_21_0()
                                local var_221_0 = slot_0_2_0.__ai

                                if not var_221_0 or not var_221_0.active then
                                        return
                                end

                                local var_221_1 = 24
                                local var_221_2 = math.min(#var_221_0.moves, var_221_0.i + var_221_1 - 1)

                                for iter_221_0 = var_221_0.i, var_221_2 do
                                        local var_221_3 = var_221_0.moves[iter_221_0]

                                        if var_221_3 and var_221_3.from and var_221_3.to then
                                                local var_221_4 = G.games.make_move and G.games.make_move(var_221_0.board, var_221_3.from[1], var_221_3.from[2], var_221_3.to[1], var_221_3.to[2])

                                                if var_221_4 and G and G.games and G.games.evaluate_board then
                                                        local var_221_5 = G.games.evaluate_board(var_221_4)

                                                        if var_221_5 then
                                                                table.insert(var_221_0.evaluated, {
                                                                        move = var_221_3,
                                                                        score = var_221_5
                                                                })
                                                        end
                                                end
                                        end
                                end

                                var_221_0.i = var_221_2 + 1

                                if var_221_0.i > #var_221_0.moves then
                                        var_221_0.done = true
                                        var_221_0.active = false

                                        table.sort(var_221_0.evaluated, function(arg_222_0, arg_222_1)
                                                return arg_222_0.score < arg_222_1.score
                                        end)
                                end
                        end

                        function slot_216_22_0(arg_223_0, arg_223_1, arg_223_2, arg_223_3, arg_223_4, arg_223_5)
                                return arg_223_0 <= arg_223_4 and arg_223_4 <= arg_223_0 + arg_223_2 and arg_223_1 <= arg_223_5 and arg_223_5 <= arg_223_1 + arg_223_3
                        end

                        if slot_216_9_0 and not slot_216_12_0 and slot_216_22_0(slot_216_14_0, slot_216_15_0, slot_216_19_0, slot_216_19_0, slot_216_7_0, slot_216_8_0) and not slot_216_18_1.winner then
                                slot_216_23_3 = math.floor((slot_216_7_0 - slot_216_14_0) / slot_216_18_1.cell_size) + 1
                                slot_216_24_2 = math.floor((slot_216_8_0 - slot_216_15_0) / slot_216_18_1.cell_size) + 1

                                if slot_216_23_3 >= 1 and slot_216_23_3 <= 8 and slot_216_24_2 >= 1 and slot_216_24_2 <= 8 then
                                        if not slot_216_18_1.selected_pos then
                                                slot_216_25_4 = slot_216_18_1.board[slot_216_24_2][slot_216_23_3]

                                                if slot_216_25_4 and slot_216_25_4.piece and slot_216_25_4.color == 1 then
                                                        slot_216_18_1.selected_pos = {
                                                                slot_216_23_3,
                                                                slot_216_24_2
                                                        }
                                                end
                                        else
                                                slot_216_25_3 = slot_216_18_1.selected_pos
                                                slot_216_26_6 = {}

                                                if G and G.games and G.games.get_piece_moves then
                                                        slot_216_26_6 = G.games.get_piece_moves(slot_216_18_1.board, slot_216_25_3[1], slot_216_25_3[2]) or {}
                                                end

                                                slot_216_27_2 = false

                                                for iter_216_8, iter_216_9 in ipairs(slot_216_26_6) do
                                                        if iter_216_9[1] == slot_216_23_3 and iter_216_9[2] == slot_216_24_2 and G and G.games and G.games.make_move and G.games.is_in_check then
                                                                slot_216_33_2 = G.games.make_move(slot_216_18_1.board, slot_216_25_3[1], slot_216_25_3[2], slot_216_23_3, slot_216_24_2)

                                                                if slot_216_33_2 and not G.games.is_in_check(slot_216_33_2, 1) then
                                                                        slot_216_18_1.board = slot_216_33_2
                                                                        slot_216_27_2 = true
                                                                        slot_216_18_1.selected_pos = nil
                                                                        slot_216_18_1.last_ai_move = nil

                                                                        if G.games.check_chess_game_end then
                                                                                G.games.check_chess_game_end(slot_216_18_1.board, -1)
                                                                        end

                                                                        if not slot_216_18_1.game_over then
                                                                                slot_216_20_0(slot_216_18_1.board)
                                                                        end

                                                                        break
                                                                end
                                                        end
                                                end

                                                if not slot_216_27_2 then
                                                        slot_216_28_1 = slot_216_18_1.board[slot_216_24_2][slot_216_23_3]

                                                        if slot_216_28_1 and slot_216_28_1.piece and slot_216_28_1.color == 1 then
                                                                slot_216_18_1.selected_pos = {
                                                                        slot_216_23_3,
                                                                        slot_216_24_2
                                                                }
                                                        else
                                                                slot_216_18_1.selected_pos = nil
                                                        end
                                                end
                                        end
                                end
                        end

                        if slot_0_2_0.__ai and slot_0_2_0.__ai.active then
                                slot_216_21_0()
                        elseif slot_0_2_0.__ai and slot_0_2_0.__ai.done then
                                slot_216_23_2 = nil
                                slot_216_24_1 = slot_0_2_0.__ai.evaluated

                                if slot_216_24_1 and #slot_216_24_1 > 0 then
                                        slot_216_25_2 = slot_0_2_0.chess_difficulty
                                        slot_216_26_5 = nil

                                        if slot_216_25_2 == 1 then
                                                slot_216_26_5 = math.max(1, math.floor(#slot_216_24_1 * 0.4))
                                        elseif slot_216_25_2 == 2 then
                                                slot_216_26_5 = math.max(1, math.floor(#slot_216_24_1 * 0.15))
                                        else
                                                slot_216_26_5 = 1
                                        end

                                        slot_216_23_2 = slot_216_24_1[math.random(1, slot_216_26_5)].move
                                end

                                if slot_216_23_2 and G and G.games and G.games.make_move then
                                        slot_216_25_1 = slot_216_18_1.board[slot_216_23_2.to[2]][slot_216_23_2.to[1]]
                                        slot_216_26_4 = slot_216_25_1 and slot_216_25_1.piece or nil
                                        slot_216_27_1 = G.games.make_move(slot_216_18_1.board, slot_216_23_2.from[1], slot_216_23_2.from[2], slot_216_23_2.to[1], slot_216_23_2.to[2])

                                        if slot_216_27_1 then
                                                slot_216_18_1.board = slot_216_27_1
                                                slot_216_18_1.last_ai_move = slot_216_23_2
                                                slot_216_18_1.last_ai_move.captured = slot_216_26_4

                                                if G.games.check_chess_game_end then
                                                        G.games.check_chess_game_end(slot_216_18_1.board, 1)
                                                end
                                        end
                                end

                                slot_0_2_0.__ai = {
                                        active = false
                                }
                        end

                        for iter_216_10 = 0, 7 do
                                for iter_216_11 = 0, 7 do
                                        slot_216_31_2 = slot_216_14_0 + iter_216_11 * slot_216_18_1.cell_size
                                        slot_216_32_2 = slot_216_15_0 + iter_216_10 * slot_216_18_1.cell_size
                                        slot_216_33_1 = (iter_216_11 + iter_216_10) % 2 == 1

                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_31_2, slot_216_32_2, slot_216_31_2 + slot_216_18_1.cell_size, slot_216_32_2 + slot_216_18_1.cell_size), slot_216_33_1 and draw.color(45, 45, 54, 230) or draw.color(210, 210, 220, 230))

                                        if slot_216_18_1.last_ai_move then
                                                if slot_216_18_1.last_ai_move.from and slot_216_18_1.last_ai_move.from[1] == iter_216_11 + 1 and slot_216_18_1.last_ai_move.from[2] == iter_216_10 + 1 then
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_31_2, slot_216_32_2, slot_216_31_2 + slot_216_18_1.cell_size, slot_216_32_2 + slot_216_18_1.cell_size), draw.color(255, 120, 60, 140))
                                                end

                                                if slot_216_18_1.last_ai_move.to and slot_216_18_1.last_ai_move.to[1] == iter_216_11 + 1 and slot_216_18_1.last_ai_move.to[2] == iter_216_10 + 1 then
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_31_2, slot_216_32_2, slot_216_31_2 + slot_216_18_1.cell_size, slot_216_32_2 + slot_216_18_1.cell_size), draw.color(255, 60, 60, 160))
                                                        slot_216_1_0:add_rect(draw.rect(slot_216_31_2, slot_216_32_2, slot_216_31_2 + slot_216_18_1.cell_size, slot_216_32_2 + slot_216_18_1.cell_size), draw.color(255, 30, 30, 255), 2)
                                                end
                                        end

                                        if slot_216_18_1.selected_pos and slot_216_18_1.selected_pos[1] == iter_216_11 + 1 and slot_216_18_1.selected_pos[2] == iter_216_10 + 1 then
                                                slot_216_1_0:add_rect_filled(draw.rect(slot_216_31_2, slot_216_32_2, slot_216_31_2 + slot_216_18_1.cell_size, slot_216_32_2 + slot_216_18_1.cell_size), draw.color(100, 255, 100, 120))
                                        end
                                end
                        end

                        if slot_216_18_1.selected_pos and G and G.games and G.games.get_piece_moves and G.games.make_move and G.games.is_in_check then
                                slot_216_23_1 = G.games.get_piece_moves(slot_216_18_1.board, slot_216_18_1.selected_pos[1], slot_216_18_1.selected_pos[2])

                                if type(slot_216_23_1) == "table" then
                                        for iter_216_12, iter_216_13 in ipairs(slot_216_23_1) do
                                                slot_216_29_0 = G.games.make_move(slot_216_18_1.board, slot_216_18_1.selected_pos[1], slot_216_18_1.selected_pos[2], iter_216_13[1], iter_216_13[2])

                                                if slot_216_29_0 and not G.games.is_in_check(slot_216_29_0, 1) then
                                                        slot_216_31_1 = slot_216_14_0 + (iter_216_13[1] - 1) * slot_216_18_1.cell_size + slot_216_18_1.cell_size / 2
                                                        slot_216_32_1 = slot_216_15_0 + (iter_216_13[2] - 1) * slot_216_18_1.cell_size + slot_216_18_1.cell_size / 2

                                                        slot_216_1_0:add_circle_filled(draw.vec2(slot_216_31_1, slot_216_32_1), 6, draw.color(100, 255, 100, 180))
                                                end
                                        end
                                end
                        end

                        for iter_216_14 = 1, 8 do
                                for iter_216_15 = 1, 8 do
                                        slot_216_31_0 = slot_216_18_1.board[iter_216_14][iter_216_15]

                                        if slot_216_31_0 and slot_216_31_0.piece then
                                                slot_216_32_0 = slot_216_14_0 + (iter_216_15 - 1) * slot_216_18_1.cell_size
                                                slot_216_33_0 = slot_216_15_0 + (iter_216_14 - 1) * slot_216_18_1.cell_size
                                                slot_216_34_0 = slot_216_31_0.color == 1 and draw.color(255, 255, 255, 255) or draw.color(40, 40, 40, 255)
                                                slot_216_35_0 = slot_216_32_0 + slot_216_18_1.cell_size / 2
                                                slot_216_36_0 = slot_216_33_0 + slot_216_18_1.cell_size / 2
                                                slot_216_37_0 = slot_216_18_1.cell_size * 0.3

                                                if slot_216_31_0.piece == "P" then
                                                        slot_216_1_0:add_circle_filled(draw.vec2(slot_216_35_0, slot_216_36_0), slot_216_37_0 * 0.7, slot_216_34_0)
                                                elseif slot_216_31_0.piece == "R" then
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_35_0 - slot_216_37_0 * 0.6, slot_216_36_0 - slot_216_37_0 * 0.3, slot_216_35_0 + slot_216_37_0 * 0.6, slot_216_36_0 + slot_216_37_0 * 0.7), slot_216_34_0)
                                                elseif slot_216_31_0.piece == "N" then
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_35_0 - slot_216_37_0 * 0.5, slot_216_36_0 - slot_216_37_0 * 0.3, slot_216_35_0 - slot_216_37_0 * 0.1, slot_216_36_0 + slot_216_37_0 * 0.7), slot_216_34_0)
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_35_0 - slot_216_37_0 * 0.1, slot_216_36_0 - slot_216_37_0 * 0.7, slot_216_35_0 + slot_216_37_0 * 0.5, slot_216_36_0 - slot_216_37_0 * 0.3), slot_216_34_0)
                                                elseif slot_216_31_0.piece == "B" then
                                                        slot_216_1_0:add_circle_filled(draw.vec2(slot_216_35_0, slot_216_36_0 - slot_216_37_0 * 0.5), slot_216_37_0 * 0.35, slot_216_34_0)
                                                        slot_216_1_0:add_triangle_filled(draw.vec2(slot_216_35_0, slot_216_36_0 - slot_216_37_0 * 0.2), draw.vec2(slot_216_35_0 - slot_216_37_0 * 0.5, slot_216_36_0 + slot_216_37_0 * 0.7), draw.vec2(slot_216_35_0 + slot_216_37_0 * 0.5, slot_216_36_0 + slot_216_37_0 * 0.7), slot_216_34_0)
                                                elseif slot_216_31_0.piece == "Q" then
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_35_0 - slot_216_37_0 * 0.7, slot_216_36_0 + slot_216_37_0 * 0.1, slot_216_35_0 + slot_216_37_0 * 0.7, slot_216_36_0 + slot_216_37_0 * 0.7), slot_216_34_0)
                                                        slot_216_1_0:add_triangle_filled(draw.vec2(slot_216_35_0 - slot_216_37_0 * 0.5, slot_216_36_0 + slot_216_37_0 * 0.1), draw.vec2(slot_216_35_0 - slot_216_37_0 * 0.35, slot_216_36_0 - slot_216_37_0 * 0.5), draw.vec2(slot_216_35_0 - slot_216_37_0 * 0.2, slot_216_36_0 + slot_216_37_0 * 0.1), slot_216_34_0)
                                                        slot_216_1_0:add_triangle_filled(draw.vec2(slot_216_35_0 - slot_216_37_0 * 0.15, slot_216_36_0 + slot_216_37_0 * 0.1), draw.vec2(slot_216_35_0, slot_216_36_0 - slot_216_37_0 * 0.7), draw.vec2(slot_216_35_0 + slot_216_37_0 * 0.15, slot_216_36_0 + slot_216_37_0 * 0.1), slot_216_34_0)
                                                        slot_216_1_0:add_triangle_filled(draw.vec2(slot_216_35_0 + slot_216_37_0 * 0.2, slot_216_36_0 + slot_216_37_0 * 0.1), draw.vec2(slot_216_35_0 + slot_216_37_0 * 0.35, slot_216_36_0 - slot_216_37_0 * 0.5), draw.vec2(slot_216_35_0 + slot_216_37_0 * 0.5, slot_216_36_0 + slot_216_37_0 * 0.1), slot_216_34_0)
                                                elseif slot_216_31_0.piece == "K" then
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_35_0 - slot_216_37_0 * 0.7, slot_216_36_0 + slot_216_37_0 * 0.2, slot_216_35_0 + slot_216_37_0 * 0.7, slot_216_36_0 + slot_216_37_0 * 0.7), slot_216_34_0)
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_35_0 - slot_216_37_0 * 0.12, slot_216_36_0 - slot_216_37_0 * 0.7, slot_216_35_0 + slot_216_37_0 * 0.12, slot_216_36_0 + slot_216_37_0 * 0.3), slot_216_34_0)
                                                        slot_216_1_0:add_rect_filled(draw.rect(slot_216_35_0 - slot_216_37_0 * 0.4, slot_216_36_0 - slot_216_37_0 * 0.4, slot_216_35_0 + slot_216_37_0 * 0.4, slot_216_36_0 - slot_216_37_0 * 0.15), slot_216_34_0)
                                                end
                                        end
                                end
                        end

                        slot_216_23_0 = slot_216_15_0 + slot_216_19_0 + 8

                        if slot_0_124_0(slot_216_1_0, "mini_chess_diff", slot_216_14_0, slot_216_23_0, 220, 24, slot_0_62_0("game_difficulty_ai_label", "AI Difficulty") .. " " .. slot_216_13_0(slot_0_2_0.chess_difficulty), slot_216_7_0, slot_216_8_0, slot_216_9_0, 1) then
                                slot_0_2_0.chess_difficulty = slot_0_2_0.chess_difficulty % 3 + 1
                        end

                        if slot_0_124_0(slot_216_1_0, "mini_chess_restart", slot_216_14_0 + 230, slot_216_23_0, 110, 24, slot_0_62_0("game_restart", "Restart"), slot_216_7_0, slot_216_8_0, slot_216_9_0, 1) then
                                if G and G.games and G.games.init_chess then
                                        G.games.init_chess()
                                end

                                slot_0_2_0.__ai = {
                                        active = false
                                }
                        end

                        slot_216_24_0 = slot_216_23_0 + 28

                        if slot_216_18_1.game_over then
                                slot_216_25_0 = slot_216_18_1.winner == 1 and slot_0_62_0("game_player_won", "YOU WON!") or slot_216_18_1.winner == -1 and slot_0_62_0("game_ai_won", "AI WON!") or slot_0_62_0("game_draw", "DRAW!")
                                slot_216_26_1 = slot_216_18_1.winner == 1 and draw.color(0, 255, 100, 255) or slot_216_18_1.winner == -1 and draw.color(255, 50, 50, 255) or draw.color(255, 200, 0, 255)

                                slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_14_0, slot_216_24_0, slot_216_25_0, slot_216_26_1)
                        elseif slot_216_18_1.last_ai_move and slot_216_18_1.last_ai_move.captured then
                                slot_216_26_0 = ({
                                        P = slot_0_62_0("piece_pawn", "Pawn"),
                                        N = slot_0_62_0("piece_knight", "Knight"),
                                        B = slot_0_62_0("piece_bishop", "Bishop"),
                                        R = slot_0_62_0("piece_rook", "Rook"),
                                        Q = slot_0_62_0("piece_queen", "Queen"),
                                        K = slot_0_62_0("piece_king", "King")
                                })[slot_216_18_1.last_ai_move.captured] or slot_216_18_1.last_ai_move.captured

                                slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_14_0, slot_216_24_0, slot_0_62_0("game_ai_captured", "AI captured: ") .. slot_216_26_0, draw.color(255, 80, 80, 255))
                        elseif slot_216_18_1.last_ai_move then
                                slot_0_58_0(slot_216_1_0, theme.fonts.item, slot_216_14_0, slot_216_24_0, slot_0_62_0("game_ai_last_move", "AI last move"), draw.color(255, 150, 100, 200))
                        end
                end

                slot_216_5_0.w, slot_216_5_0.h = slot_216_16_0, slot_216_17_0

                function slot_216_18_0(arg_224_0, arg_224_1, arg_224_2, arg_224_3, arg_224_4, arg_224_5)
                        return arg_224_0 <= arg_224_4 and arg_224_4 <= arg_224_0 + arg_224_2 and arg_224_1 <= arg_224_5 and arg_224_5 <= arg_224_1 + arg_224_3
                end

                if slot_216_12_0 and slot_216_9_0 and slot_216_18_0(slot_216_5_0.x, slot_216_5_0.y, slot_216_5_0.w, slot_216_5_0.h, slot_216_7_0, slot_216_8_0) then
                        slot_216_5_0.dragging = true
                        slot_216_5_0.ox, slot_216_5_0.oy = slot_216_7_0 - slot_216_5_0.x, slot_216_8_0 - slot_216_5_0.y
                end

                if slot_216_11_0 then
                        slot_216_5_0.dragging = false
                end

                if slot_216_5_0.dragging then
                        slot_216_5_0.x = math.max(0, math.min(slot_216_2_0 - slot_216_5_0.w, slot_216_7_0 - slot_216_5_0.ox))
                        slot_216_5_0.y = math.max(0, math.min(slot_216_3_0 - slot_216_5_0.h, slot_216_8_0 - slot_216_5_0.oy))
                end
        end)
end

slot_0_183_2 = nil

if gui and gui.ctx and gui.ctx.find and gui.control_id then
        if slot_0_5_0 then
                slot_0_183_2 = slot_0_5_0
        else
                slot_0_184_3 = gui.ctx:find("lua>elements b")

                if slot_0_184_3 then
                        slot_0_183_2 = slot_0_184_3
                elseif gui.group_box then
                        slot_0_185_2 = gui.ctx:find("lua")

                        if slot_0_185_2 and slot_0_185_2.add then
                                slot_0_186_3 = gui.group_box(gui.control_id("elements_b"), "Elements B")

                                if slot_0_186_3 then
                                        slot_0_185_2:add(slot_0_186_3)

                                        slot_0_183_2 = slot_0_186_3
                                end
                        end
                end
        end
end

slot_0_184_2 = gui and gui.checkbox and gui.checkbox(gui.control_id("etr.cb_enable"))
slot_0_185_1 = gui and gui.combo_box and gui.combo_box(gui.control_id("etr.mode"))
slot_0_186_2 = gui and gui.slider and gui.slider(gui.control_id("etr.warn"), 100, 2000, {
        "%.0fm"
}, 10)
slot_0_187_3 = gui and gui.hotkey and gui.hotkey(gui.control_id("etr.hk_toggle"))

if slot_0_185_1 and gui and gui.selectable then
        slot_0_185_1:add(gui.selectable(gui.control_id("etr.mode.prem"), "Premier (5)"))
        slot_0_185_1:add(gui.selectable(gui.control_id("etr.mode.hvh"), "HvH (todos)"))
end

if slot_0_184_2 and slot_0_184_2.get_value then
        slot_0_184_2:get_value():set(slot_0_174_1.enabled)
end

if slot_0_185_1 and slot_0_185_1.get_value then
        slot_0_185_1:get_value():get():set_raw(slot_0_174_1.mode_premier and 1 or 2)
end

if slot_0_186_2 and slot_0_186_2.get_value then
        slot_0_186_2:get_value():set(slot_0_174_1.warn_dist)
end

if false then
        slot_0_188_3 = false

        function slot_0_189_2(arg_225_0, arg_225_1)
                if arg_225_1 then
                        local var_225_0 = gui.make_control(arg_225_0, arg_225_1)

                        if var_225_0 and slot_0_183_2.add then
                                slot_0_183_2:add(var_225_0)

                                slot_0_188_3 = true
                        end
                end
        end

        slot_0_189_2("mm helper — habilitar", slot_0_184_2)
        slot_0_189_2("mm helper — modo", slot_0_185_1)
        slot_0_189_2("mm helper — distância de alerta", slot_0_186_2)
        slot_0_189_2("mm helper — atalho (toggle)", slot_0_187_3)

        if slot_0_188_3 and slot_0_183_2.reset then
                slot_0_183_2:reset()
        end
end

slot_0_188_2 = {
        lmb_pressed = false,
        x = 0,
        lmb = false,
        y = 0
}
slot_0_189_1 = false

function slot_0_190_1()
        local var_226_0 = false

        if slot_0_178_1 and slot_0_179_1 then
                local var_226_1 = bit.band(slot_0_179_1(slot_0_181_1) or 0, 32768) ~= 0

                slot_0_188_2.lmb_pressed = var_226_1 and not slot_0_188_2.lmb
                slot_0_188_2.lmb = var_226_1

                local var_226_2, var_226_3 = slot_0_180_1()

                if var_226_2 and var_226_3 then
                        slot_0_188_2.x, slot_0_188_2.y = var_226_2, var_226_3
                end

                local var_226_4 = bit.band(slot_0_179_1(slot_0_182_1) or 0, 32768) ~= 0

                if var_226_4 and not slot_0_189_1 then
                        var_226_0 = true
                end

                slot_0_189_1 = var_226_4
        elseif slot_0_187_3 and slot_0_187_3.get_hotkey_state and slot_0_187_3:get_hotkey_state() then
                -- block empty
        end

        if slot_0_184_2 and slot_0_184_2.get_value then
                slot_0_184_2:get_value():set(slot_0_174_1.enabled)
        end

        if slot_0_185_1 and slot_0_185_1.get_value then
                slot_0_185_1:get_value():get():set_raw(slot_0_174_1.mode_premier and 1 or 2)
        end

        if slot_0_186_2 and slot_0_186_2.get_value then
                slot_0_186_2:get_value():set(slot_0_174_1.warn_dist)
        end

        return var_226_0
end

function slot_0_191_1()
        slot_0_174_1.cache = {}

        if not entities or not entities.players or not entities.players.for_each then
                return
        end

        entities.players:for_each(function(arg_228_0)
                local var_228_0 = arg_228_0.entity

                if var_228_0 and var_228_0.is_enemy and var_228_0:is_enemy() then
                        local var_228_1 = var_228_0.m_iHealth and var_228_0.m_iHealth.get and var_228_0.m_iHealth:get() or 0
                        local var_228_2 = var_228_0.get_name and var_228_0:get_name() or "enemy"
                        local var_228_3 = tostring(var_228_0.get_index and var_228_0:get_index() or math.random(1000, 9999))
                        local var_228_4 = var_228_0.is_alive and var_228_0:is_alive() or false

                        table.insert(slot_0_174_1.cache, {
                                name = var_228_2,
                                health = var_228_1,
                                entity = var_228_0,
                                user_id = var_228_3,
                                is_alive = var_228_4
                        })
                end
        end)
        table.sort(slot_0_174_1.cache, function(arg_229_0, arg_229_1)
                if arg_229_0.name == arg_229_1.name then
                        return (arg_229_0.health or 0) > (arg_229_1.health or 0)
                end

                return (arg_229_0.name or "") < (arg_229_1.name or "")
        end)

        if slot_0_174_1.mode_premier and #slot_0_174_1.cache > 5 then
                for iter_227_0 = #slot_0_174_1.cache, 6, -1 do
                        table.remove(slot_0_174_1.cache, iter_227_0)
                end
        end
end

if not G then
        G = {}
end

function slot_0_192_1()
        if not draw or not draw.surface then
                return
        end

        if not game or not game.engine or not game.engine.get_screen_size then
                return
        end

        if not slot_0_2_0 then
                return
        end

        if not slot_0_2_0.snake_window or not slot_0_2_0.minesweeper_window or not slot_0_2_0.chess_window then
                return
        end

        slot_230_0_0 = draw.surface

        if slot_230_0_0.override_clip_rect then
                slot_230_0_0:override_clip_rect(nil)
        end

        if slot_230_0_0.g and slot_230_0_0.g.set_shader then
                slot_230_0_0.g:set_shader(nil)

                slot_230_0_0.g.texture = nil
        end

        slot_230_1_0 = slot_0_188_2 or {
                released = false,
                down = false,
                pressed = false,
                x = 0,
                y = 0
        }
        slot_230_2_0 = slot_230_1_0.x
        slot_230_3_0 = slot_230_1_0.y
        slot_230_4_0 = slot_230_1_0.pressed
        slot_230_5_0 = slot_230_1_0.down
        slot_230_6_0 = slot_0_171_0 and slot_0_49_0 and slot_0_171_0(slot_0_49_0) or false
        slot_0_2_0.__hk = slot_0_2_0.__hk or {
                f8 = false,
                f7 = false,
                f6 = false
        }
        slot_0_2_0.__hot_msg_t = slot_0_2_0.__hot_msg_t or 0
        slot_230_7_1 = slot_0_171_0 and slot_0_171_0(117) or false
        slot_230_8_3 = slot_0_171_0 and slot_0_171_0(118) or false
        slot_230_9_3 = slot_0_171_0 and slot_0_171_0(119) or false

        if slot_230_7_1 and not slot_0_2_0.__hk.f6 then
                slot_0_2_0.snake_window.open = not slot_0_2_0.snake_window.open
                slot_0_2_0.__hot_msg_t = game.global_vars.real_time + 1
        end

        if slot_230_8_3 and not slot_0_2_0.__hk.f7 then
                slot_0_2_0.minesweeper_window.open = not slot_0_2_0.minesweeper_window.open
                slot_0_2_0.__hot_msg_t = game.global_vars.real_time + 1
        end

        if slot_230_9_3 and not slot_0_2_0.__hk.f8 then
                slot_0_2_0.chess_window.open = not slot_0_2_0.chess_window.open
                slot_0_2_0.__hot_msg_t = game.global_vars.real_time + 1
        end

        slot_0_2_0.__hk.f6, slot_0_2_0.__hk.f7, slot_0_2_0.__hk.f8 = slot_230_7_1, slot_230_8_3, slot_230_9_3

        if game.global_vars.real_time < slot_0_2_0.__hot_msg_t then
                slot_230_0_0:add_rect_filled_rounded(draw.rect(12, 12, 210, 38), draw.color(15, 15, 18, 200), 6)
                slot_0_58_0(slot_230_0_0, theme.fonts.small, 18, 18, "Mini UI toggled (F6/F7/F8)", theme.colors.text_light)
        end

        function slot_230_7_0(arg_231_0, arg_231_1)
                if not arg_231_0 or not arg_231_0.open then
                        return
                end

                slot_231_2_0, slot_231_3_0 = game.engine:get_screen_size()
                arg_231_0.w = math.max(arg_231_0.w or 320, 240)
                arg_231_0.h = math.max(arg_231_0.h or 240, 220)
                slot_0_2_0.__hk = slot_0_2_0.__hk or {}
                slot_231_4_0 = slot_0_171_0 and slot_0_171_0(120) or false

                if slot_231_4_0 and not slot_0_2_0.__hk.f9 then
                        arg_231_0.x, arg_231_0.y = 100, 100
                end

                slot_0_2_0.__hk.f9 = slot_231_4_0
                arg_231_0.x = slot_0_54_0(arg_231_0.x or 100, 0, math.max(0, slot_231_2_0 - arg_231_0.w))
                arg_231_0.y = slot_0_54_0(arg_231_0.y or 100, 0, math.max(0, slot_231_3_0 - arg_231_0.h))
                slot_231_5_0 = arg_231_0.x
                slot_231_6_0 = arg_231_0.y
                slot_231_7_0 = arg_231_0.w
                slot_231_8_0 = arg_231_0.h
                slot_231_9_0 = 28
                slot_231_10_0 = 10
                slot_231_11_0 = slot_231_5_0 + slot_231_10_0
                slot_231_12_0 = slot_231_6_0 + slot_231_9_0 + slot_231_10_0
                slot_231_13_0 = slot_231_7_0 - slot_231_10_0 * 2
                slot_231_14_0 = slot_231_8_0 - slot_231_9_0 - slot_231_10_0 * 2

                if slot_230_6_0 and slot_230_4_0 and slot_0_57_0(slot_231_5_0, slot_231_6_0, slot_231_7_0, slot_231_9_0, slot_230_2_0, slot_230_3_0) then
                        arg_231_0.dragging = true
                        arg_231_0.drag_ox = slot_230_2_0 - slot_231_5_0
                        arg_231_0.drag_oy = slot_230_3_0 - slot_231_6_0
                end

                if slot_230_1_0.released then
                        arg_231_0.dragging = false
                end

                if arg_231_0.dragging then
                        arg_231_0.x = slot_0_54_0(slot_230_2_0 - arg_231_0.drag_ox, 0, slot_231_2_0 - slot_231_7_0)
                        arg_231_0.y = slot_0_54_0(slot_230_3_0 - arg_231_0.drag_oy, 0, slot_231_3_0 - slot_231_8_0)
                        slot_231_5_0, slot_231_6_0 = arg_231_0.x, arg_231_0.y
                        slot_231_11_0, slot_231_12_0 = slot_231_5_0 + slot_231_10_0, slot_231_6_0 + slot_231_9_0 + slot_231_10_0
                end

                slot_230_0_0:add_shadow_rect(draw.rect(slot_231_5_0, slot_231_6_0, slot_231_5_0 + slot_231_7_0, slot_231_6_0 + slot_231_8_0), 14, true, 0.35)
                slot_230_0_0:add_rect_filled_rounded(draw.rect(slot_231_5_0, slot_231_6_0, slot_231_5_0 + slot_231_7_0, slot_231_6_0 + slot_231_8_0), theme.colors.bg_sidebar:mod_a(0.95), 8)
                slot_230_0_0:add_rect_rounded(draw.rect(slot_231_5_0, slot_231_6_0, slot_231_5_0 + slot_231_7_0, slot_231_6_0 + slot_231_8_0), theme.colors.border_inner, 8)
                slot_230_0_0:add_rect_filled_rounded(draw.rect(slot_231_5_0, slot_231_6_0, slot_231_5_0 + slot_231_7_0, slot_231_6_0 + slot_231_9_0), theme.colors.bg_header or theme.colors.bg_content, 8)
                slot_0_58_0(slot_230_0_0, theme.fonts.item, slot_231_5_0 + 10, slot_231_6_0 + 6, arg_231_1, theme.colors.text_light)

                slot_231_15_0 = 18
                slot_231_16_0 = slot_231_5_0 + slot_231_7_0 - slot_231_15_0 - 6
                slot_231_17_0 = slot_231_6_0 + 5
                slot_231_18_0 = slot_0_57_0(slot_231_16_0, slot_231_17_0, slot_231_15_0, slot_231_15_0, slot_230_2_0, slot_230_3_0)

                slot_230_0_0:add_rect_filled_rounded(draw.rect(slot_231_16_0, slot_231_17_0, slot_231_16_0 + slot_231_15_0, slot_231_17_0 + slot_231_15_0), slot_231_18_0 and draw.color(200, 60, 60, 200) or draw.color(140, 40, 40, 180), 4)
                slot_0_58_0(slot_230_0_0, theme.fonts.small, slot_231_16_0 + 5, slot_231_17_0 + 2, "X", draw.color(255, 255, 255, 230))

                if slot_230_4_0 and slot_231_18_0 then
                        arg_231_0.open = false

                        return
                end

                slot_230_0_0:add_rect(draw.rect(slot_231_5_0, slot_231_6_0 + slot_231_9_0, slot_231_5_0 + slot_231_7_0, slot_231_6_0 + slot_231_9_0), theme.colors.border_inner)

                return slot_231_11_0, slot_231_12_0, slot_231_13_0, slot_231_14_0
        end

        slot_230_8_2, slot_230_9_2, slot_230_10_2, slot_230_11_2 = slot_230_7_0(slot_0_2_0.snake_window, "Snake")

        if slot_230_8_2 then
                if not slot_0_2_0.snake.snake_body[1] then
                        G.games.init_snake()
                end

                G.games.update_snake()

                slot_230_12_2 = slot_0_2_0.snake
                slot_230_13_2 = slot_230_12_2.grid_size * slot_230_12_2.cell_size
                slot_230_14_2 = slot_230_8_2 + 10
                slot_230_15_2 = slot_230_9_2 + 10

                slot_230_0_0:add_rect_filled(draw.rect(slot_230_14_2 - 2, slot_230_15_2 - 2, slot_230_14_2 + slot_230_13_2 + 2, slot_230_15_2 + slot_230_13_2 + 2), theme.colors.bg_content)

                for iter_230_0 = 0, slot_230_12_2.grid_size - 1 do
                        for iter_230_1 = 0, slot_230_12_2.grid_size - 1 do
                                slot_230_24_3 = slot_230_14_2 + iter_230_1 * slot_230_12_2.cell_size
                                slot_230_25_4 = slot_230_15_2 + iter_230_0 * slot_230_12_2.cell_size
                                slot_230_26_4 = (iter_230_1 + iter_230_0) % 2 == 0

                                slot_230_0_0:add_rect_filled(draw.rect(slot_230_24_3, slot_230_25_4, slot_230_24_3 + slot_230_12_2.cell_size, slot_230_25_4 + slot_230_12_2.cell_size), slot_230_26_4 and draw.color(30, 30, 36, 200) or draw.color(26, 26, 30, 200))
                        end
                end

                slot_230_16_2 = slot_230_14_2 + slot_230_12_2.food.x * slot_230_12_2.cell_size
                slot_230_17_3 = slot_230_15_2 + slot_230_12_2.food.y * slot_230_12_2.cell_size

                slot_230_0_0:add_rect_filled_rounded(draw.rect(slot_230_16_2 + 4, slot_230_17_3 + 4, slot_230_16_2 + slot_230_12_2.cell_size - 4, slot_230_17_3 + slot_230_12_2.cell_size - 4), draw.color(200, 60, 60, 240), 3)

                for iter_230_2, iter_230_3 in ipairs(slot_230_12_2.snake_body) do
                        slot_230_23_2 = slot_230_14_2 + iter_230_3.x * slot_230_12_2.cell_size
                        slot_230_24_2 = slot_230_15_2 + iter_230_3.y * slot_230_12_2.cell_size
                        slot_230_25_3 = iter_230_2 == 1 and theme.colors.accent or theme.colors.accent:darken(0.15)

                        slot_230_0_0:add_rect_filled_rounded(draw.rect(slot_230_23_2 + 2, slot_230_24_2 + 2, slot_230_23_2 + slot_230_12_2.cell_size - 2, slot_230_24_2 + slot_230_12_2.cell_size - 2), slot_230_25_3, 4)
                end

                if slot_230_12_2.obstacles then
                        for iter_230_4, iter_230_5 in ipairs(slot_230_12_2.obstacles) do
                                slot_230_23_1 = slot_230_14_2 + iter_230_5.x * slot_230_12_2.cell_size
                                slot_230_24_1 = slot_230_15_2 + iter_230_5.y * slot_230_12_2.cell_size

                                slot_230_0_0:add_rect_filled(draw.rect(slot_230_23_1 + 3, slot_230_24_1 + 3, slot_230_23_1 + slot_230_12_2.cell_size - 3, slot_230_24_1 + slot_230_12_2.cell_size - 3), draw.color(80, 80, 90, 220))
                                slot_230_0_0:add_rect(draw.rect(slot_230_23_1 + 3, slot_230_24_1 + 3, slot_230_23_1 + slot_230_12_2.cell_size - 3, slot_230_24_1 + slot_230_12_2.cell_size - 3), draw.color(120, 120, 130, 255), 1)
                        end
                end

                slot_0_58_0(slot_230_0_0, theme.fonts.item, slot_230_8_2, slot_230_15_2 + slot_230_13_2 + 8, slot_0_62_0("game_score", "Score") .. " " .. tostring(slot_230_12_2.score or 0), theme.colors.text_light)
                slot_0_58_0(slot_230_0_0, theme.fonts.small, slot_230_8_2 + 140, slot_230_15_2 + slot_230_13_2 + 10, slot_0_62_0("game_controls_arrows", "Controls: Arrow Keys"), theme.colors.text_normal)

                if slot_230_12_2.game_over then
                        slot_230_18_4 = 110
                        slot_230_19_3 = 26
                        slot_230_20_5 = slot_230_8_2 + 10
                        slot_230_21_6 = slot_230_15_2 + slot_230_13_2 + 30

                        if slot_0_124_0(slot_230_0_0, "snake_restart_mini", slot_230_20_5, slot_230_21_6, slot_230_18_4, slot_230_19_3, slot_0_62_0("game_restart", "Restart"), slot_230_2_0, slot_230_3_0, slot_230_4_0, 1) then
                                G.games.init_snake()
                        end
                end
        end

        slot_230_8_1, slot_230_9_1, slot_230_10_1, slot_230_11_1 = slot_230_7_0(slot_0_2_0.minesweeper_window, "Minesweeper")

        if slot_230_8_1 then
                slot_230_12_1 = slot_0_2_0.minesweeper

                if not slot_230_12_1.grid[1] then
                        G.games.init_minesweeper()
                end

                slot_230_13_1 = slot_230_12_1.grid_w * slot_230_12_1.cell_size
                slot_230_14_1 = slot_230_12_1.grid_h * slot_230_12_1.cell_size
                slot_230_15_1 = slot_230_8_1 + 10
                slot_230_16_1 = slot_230_9_1 + 10

                if slot_230_4_0 and slot_0_57_0(slot_230_15_1, slot_230_16_1, slot_230_13_1, slot_230_14_1, slot_230_2_0, slot_230_3_0) and not slot_230_12_1.game_over and not slot_230_12_1.won then
                        slot_230_17_2 = math.floor((slot_230_2_0 - slot_230_15_1) / slot_230_12_1.cell_size) + 1
                        slot_230_18_3 = math.floor((slot_230_3_0 - slot_230_16_1) / slot_230_12_1.cell_size) + 1

                        if slot_230_17_2 >= 1 and slot_230_17_2 <= (slot_230_12_1.grid_w or 0) and slot_230_18_3 >= 1 and slot_230_18_3 <= (slot_230_12_1.grid_h or 0) then
                                if slot_230_6_0 then
                                        slot_230_12_1.flagged[slot_230_18_3] = slot_230_12_1.flagged[slot_230_18_3] or {}
                                        slot_230_12_1.flagged[slot_230_18_3][slot_230_17_2] = not slot_230_12_1.flagged[slot_230_18_3][slot_230_17_2]
                                elseif G and G.games and G.games.reveal_cell then
                                        G.games.reveal_cell(slot_230_17_2, slot_230_18_3)
                                end
                        end
                end

                for iter_230_6 = 1, slot_230_12_1.grid_h do
                        for iter_230_7 = 1, slot_230_12_1.grid_w do
                                slot_230_25_2 = slot_230_15_1 + (iter_230_7 - 1) * slot_230_12_1.cell_size
                                slot_230_26_3 = slot_230_16_1 + (iter_230_6 - 1) * slot_230_12_1.cell_size
                                slot_230_27_3 = draw.rect(slot_230_25_2, slot_230_26_3, slot_230_25_2 + slot_230_12_1.cell_size, slot_230_26_3 + slot_230_12_1.cell_size)

                                if not slot_230_12_1.revealed[iter_230_6][iter_230_7] then
                                        slot_230_0_0:add_rect_filled(slot_230_27_3, draw.color(45, 45, 54, 220))

                                        if slot_230_12_1.flagged[iter_230_6][iter_230_7] then
                                                slot_0_58_0(slot_230_0_0, theme.fonts.item, slot_230_25_2 + 6, slot_230_26_3 + 2, "F", draw.color(255, 200, 0, 230))
                                        end
                                else
                                        slot_230_29_1 = slot_230_12_1.grid[iter_230_6][iter_230_7]

                                        if slot_230_29_1 == -1 then
                                                slot_230_0_0:add_rect_filled(slot_230_27_3, draw.color(180, 50, 50, 220))
                                        else
                                                slot_230_0_0:add_rect_filled(slot_230_27_3, draw.color(36, 36, 42, 220))

                                                if slot_230_29_1 > 0 then
                                                        slot_0_58_0(slot_230_0_0, theme.fonts.item, slot_230_25_2 + 6, slot_230_26_3 + 2, tostring(slot_230_29_1), draw.color(180, 220, 255, 230))
                                                end
                                        end
                                end

                                slot_230_0_0:add_rect(slot_230_27_3, draw.color(70, 70, 80, 220))
                        end
                end

                slot_230_17_1 = slot_230_16_1 + slot_230_14_1 + 8

                if slot_230_12_1.won then
                        slot_0_58_0(slot_230_0_0, theme.fonts.item, slot_230_8_1, slot_230_17_1, slot_0_62_0("game_you_won", "YOU WON!"), draw.color(0, 255, 100, 255))
                elseif slot_230_12_1.game_over then
                        slot_0_58_0(slot_230_0_0, theme.fonts.item, slot_230_8_1, slot_230_17_1, slot_0_62_0("game_exploded", "EXPLODED!"), draw.color(255, 50, 50, 255))
                end

                slot_230_18_2 = 110
                slot_230_19_2 = 26

                if slot_0_124_0(slot_230_0_0, "ms_restart_mini", slot_230_8_1 + 180, slot_230_17_1 - 6, slot_230_18_2, slot_230_19_2, slot_0_62_0("game_restart", "Restart"), slot_230_2_0, slot_230_3_0, slot_230_4_0, 1) then
                        G.games.init_minesweeper()
                end
        end

        slot_230_8_0, slot_230_9_0, slot_230_10_0, slot_230_11_0 = slot_230_7_0(slot_0_2_0.chess_window, "Chess")

        if slot_230_8_0 then
                slot_230_12_0 = slot_0_2_0.chess

                if not slot_230_12_0.board[1] then
                        G.games.init_chess()
                end

                slot_230_13_0 = 8 * slot_230_12_0.cell_size
                slot_230_14_0 = slot_230_8_0 + 10
                slot_230_15_0 = slot_230_9_0 + 10
                slot_0_2_0.__ai = slot_0_2_0.__ai or {
                        active = false
                }

                function slot_230_16_0(arg_232_0)
                        if not G or not G.games or not G.games.get_all_valid_moves then
                                return
                        end

                        local var_232_0 = G.games.get_all_valid_moves(arg_232_0, -1)

                        if not var_232_0 or type(var_232_0) ~= "table" or #var_232_0 == 0 then
                                return
                        end

                        slot_0_2_0.__ai = {
                                i = 1,
                                active = true,
                                board = arg_232_0,
                                moves = var_232_0,
                                evaluated = {}
                        }
                end

                function slot_230_17_0()
                        local var_233_0 = slot_0_2_0.__ai

                        if not var_233_0 or not var_233_0.active then
                                return
                        end

                        local var_233_1 = 24
                        local var_233_2 = math.min(#var_233_0.moves, var_233_0.i + var_233_1 - 1)

                        for iter_233_0 = var_233_0.i, var_233_2 do
                                local var_233_3 = var_233_0.moves[iter_233_0]

                                if var_233_3 and var_233_3.from and var_233_3.to then
                                        local var_233_4 = G.games.make_move and G.games.make_move(var_233_0.board, var_233_3.from[1], var_233_3.from[2], var_233_3.to[1], var_233_3.to[2])

                                        if var_233_4 and G and G.games and G.games.evaluate_board then
                                                local var_233_5 = G.games.evaluate_board(var_233_4)

                                                if var_233_5 then
                                                        table.insert(var_233_0.evaluated, {
                                                                move = var_233_3,
                                                                score = var_233_5
                                                        })
                                                end
                                        end
                                end
                        end

                        var_233_0.i = var_233_2 + 1

                        if var_233_0.i > #var_233_0.moves then
                                var_233_0.done = true
                                var_233_0.active = false

                                table.sort(var_233_0.evaluated, function(arg_234_0, arg_234_1)
                                        return arg_234_0.score < arg_234_1.score
                                end)
                        end
                end

                if slot_230_4_0 and slot_0_57_0(slot_230_14_0, slot_230_15_0, slot_230_13_0, slot_230_13_0, slot_230_2_0, slot_230_3_0) and not slot_230_12_0.winner then
                        slot_230_18_1 = math.floor((slot_230_2_0 - slot_230_14_0) / slot_230_12_0.cell_size) + 1
                        slot_230_19_1 = math.floor((slot_230_3_0 - slot_230_15_0) / slot_230_12_0.cell_size) + 1

                        if slot_230_18_1 >= 1 and slot_230_18_1 <= 8 and slot_230_19_1 >= 1 and slot_230_19_1 <= 8 then
                                if not slot_230_12_0.selected_pos then
                                        slot_230_20_3 = slot_230_12_0.board[slot_230_19_1]
                                        slot_230_21_5 = slot_230_20_3 and slot_230_20_3[slot_230_18_1] or nil

                                        if slot_230_21_5 and slot_230_21_5.color == 1 then
                                                slot_230_12_0.selected_pos = {
                                                        slot_230_18_1,
                                                        slot_230_19_1
                                                }
                                        end
                                else
                                        slot_230_20_2 = slot_230_12_0.selected_pos
                                        slot_230_21_4 = {}

                                        if G and G.games and G.games.get_all_valid_moves then
                                                slot_230_21_4 = G.games.get_all_valid_moves(slot_230_12_0.board, 1) or {}
                                        end

                                        slot_230_22_1 = nil

                                        for iter_230_8, iter_230_9 in ipairs(slot_230_21_4) do
                                                if iter_230_9.from and iter_230_9.to and iter_230_9.from[1] == slot_230_20_2[1] and iter_230_9.from[2] == slot_230_20_2[2] and iter_230_9.to[1] == slot_230_18_1 and iter_230_9.to[2] == slot_230_19_1 then
                                                        slot_230_22_1 = iter_230_9

                                                        break
                                                end
                                        end

                                        if slot_230_22_1 and G and G.games and G.games.make_move then
                                                slot_230_23_0 = G.games.make_move(slot_230_12_0.board, slot_230_22_1.from[1], slot_230_22_1.from[2], slot_230_22_1.to[1], slot_230_22_1.to[2])

                                                if slot_230_23_0 then
                                                        slot_230_12_0.board = slot_230_23_0
                                                end

                                                slot_230_12_0.selected_pos = nil
                                                slot_230_12_0.last_ai_move = nil

                                                slot_230_16_0(slot_230_12_0.board)
                                        else
                                                slot_230_12_0.selected_pos = nil
                                        end
                                end
                        end
                end

                if slot_0_2_0.__ai and slot_0_2_0.__ai.active then
                        slot_230_17_0()
                elseif slot_0_2_0.__ai and slot_0_2_0.__ai.done then
                        slot_230_18_0 = nil
                        slot_230_19_0 = slot_0_2_0.__ai.evaluated

                        if slot_230_19_0 and #slot_230_19_0 > 0 then
                                slot_230_20_1 = slot_0_2_0.chess_difficulty
                                slot_230_21_3 = nil

                                if slot_230_20_1 == 1 then
                                        slot_230_21_3 = math.max(1, math.floor(#slot_230_19_0 * 0.4))
                                elseif slot_230_20_1 == 2 then
                                        slot_230_21_3 = math.max(1, math.floor(#slot_230_19_0 * 0.15))
                                else
                                        slot_230_21_3 = 1
                                end

                                slot_230_18_0 = slot_230_19_0[math.random(1, slot_230_21_3)].move
                        end

                        if slot_230_18_0 and G and G.games and G.games.make_move then
                                slot_230_20_0 = slot_230_12_0.board[slot_230_18_0.to[2]][slot_230_18_0.to[1]]
                                slot_230_21_2 = slot_230_20_0 and slot_230_20_0.piece or nil
                                slot_230_22_0 = G.games.make_move(slot_230_12_0.board, slot_230_18_0.from[1], slot_230_18_0.from[2], slot_230_18_0.to[1], slot_230_18_0.to[2])

                                if slot_230_22_0 then
                                        slot_230_12_0.board = slot_230_22_0
                                        slot_230_12_0.last_ai_move = slot_230_18_0
                                        slot_230_12_0.last_ai_move.captured = slot_230_21_2
                                end
                        end

                        slot_0_2_0.__ai = {
                                active = false
                        }
                end

                for iter_230_10 = 0, 7 do
                        for iter_230_11 = 0, 7 do
                                slot_230_26_1 = slot_230_14_0 + iter_230_11 * slot_230_12_0.cell_size
                                slot_230_27_1 = slot_230_15_0 + iter_230_10 * slot_230_12_0.cell_size
                                slot_230_28_1 = (iter_230_11 + iter_230_10) % 2 == 1

                                slot_230_0_0:add_rect_filled(draw.rect(slot_230_26_1, slot_230_27_1, slot_230_26_1 + slot_230_12_0.cell_size, slot_230_27_1 + slot_230_12_0.cell_size), slot_230_28_1 and draw.color(45, 45, 54, 230) or draw.color(210, 210, 220, 230))

                                if slot_230_12_0.last_ai_move then
                                        if slot_230_12_0.last_ai_move.from and slot_230_12_0.last_ai_move.from[1] == iter_230_11 + 1 and slot_230_12_0.last_ai_move.from[2] == iter_230_10 + 1 then
                                                slot_230_0_0:add_rect_filled(draw.rect(slot_230_26_1, slot_230_27_1, slot_230_26_1 + slot_230_12_0.cell_size, slot_230_27_1 + slot_230_12_0.cell_size), draw.color(255, 120, 60, 140))
                                        end

                                        if slot_230_12_0.last_ai_move.to and slot_230_12_0.last_ai_move.to[1] == iter_230_11 + 1 and slot_230_12_0.last_ai_move.to[2] == iter_230_10 + 1 then
                                                slot_230_0_0:add_rect_filled(draw.rect(slot_230_26_1, slot_230_27_1, slot_230_26_1 + slot_230_12_0.cell_size, slot_230_27_1 + slot_230_12_0.cell_size), draw.color(255, 60, 60, 160))
                                                slot_230_0_0:add_rect(draw.rect(slot_230_26_1, slot_230_27_1, slot_230_26_1 + slot_230_12_0.cell_size, slot_230_27_1 + slot_230_12_0.cell_size), draw.color(255, 30, 30, 255), 2)
                                        end
                                end
                        end
                end

                for iter_230_12 = 1, 8 do
                        for iter_230_13 = 1, 8 do
                                slot_230_26_0 = slot_230_12_0.board[iter_230_12][iter_230_13]

                                if slot_230_26_0 then
                                        slot_230_27_0 = slot_230_14_0 + (iter_230_13 - 1) * slot_230_12_0.cell_size + 6
                                        slot_230_28_0 = slot_230_15_0 + (iter_230_12 - 1) * slot_230_12_0.cell_size + 2
                                        slot_230_29_0 = slot_230_26_0.type
                                        slot_230_30_0 = draw.color(10, 10, 12, 255)

                                        if slot_230_26_0.color == 1 then
                                                slot_230_30_0 = draw.color(10, 10, 12, 255)
                                        else
                                                slot_230_30_0 = draw.color(240, 240, 245, 255)
                                        end

                                        slot_0_58_0(slot_230_0_0, theme.fonts.item, slot_230_27_0, slot_230_28_0, slot_230_29_0, slot_230_30_0)
                                end
                        end
                end
        end
end

function slot_0_193_0()
        if not draw or not draw.surface then
                return
        end

        local var_235_0 = draw.surface
        local var_235_1 = game and game.engine

        if not var_235_1 or not var_235_1.get_screen_size then
                return
        end

        local var_235_2, var_235_3 = var_235_1:get_screen_size()
        local var_235_4 = var_235_2 / 70
        local var_235_5 = var_235_3 / 4 + 200

        if draw.fonts and draw.fonts.gui_main then
                var_235_0.font = draw.fonts.gui_main
        end

        var_235_0:add_text(draw.vec2(var_235_4, var_235_5 - 60), "=== ENEMY TRACKER ===", draw.color(0, 255, 127, 255))
        var_235_0:add_text(draw.vec2(var_235_4, var_235_5 - 40), slot_0_174_1.mode_premier and "[Premier - 5 max]" or "[HvH - All]", draw.color(255, 200, 0, 255))

        for iter_235_0, iter_235_1 in ipairs(slot_0_174_1.cache) do
                -- block empty
        end
end

function slot_0_194_1()
        local var_236_0 = entities.get_local_pawn()

        if not var_236_0 then
                return nil
        end

        local var_236_1 = game and game.engine

        if not var_236_1 or not var_236_1.get_screen_size then
                return nil
        end

        local var_236_2, var_236_3 = var_236_1:get_screen_size()
        local var_236_4 = var_236_2 / 2
        local var_236_5 = var_236_3 / 2
        local var_236_6
        local var_236_7 = math.huge
        local var_236_8 = (slot_0_174_1.crosshair_fov or 5) * 10

        if not entities.players then
                return nil
        end

        entities.players:for_each(function(arg_237_0)
                if arg_237_0 and arg_237_0.entity and arg_237_0.entity ~= var_236_0 and arg_237_0.entity.is_alive and arg_237_0.entity:is_alive() and arg_237_0.entity.is_enemy and arg_237_0.entity:is_enemy() and arg_237_0.entity.get_abs_origin then
                        local var_237_0 = arg_237_0.entity:get_abs_origin()

                        if var_237_0 then
                                local var_237_1 = {
                                        math.vec3(var_237_0.x, var_237_0.y, var_237_0.z),
                                        math.vec3(var_237_0.x, var_237_0.y, var_237_0.z + 18),
                                        math.vec3(var_237_0.x, var_237_0.y, var_237_0.z + 36),
                                        math.vec3(var_237_0.x, var_237_0.y, var_237_0.z + 54),
                                        math.vec3(var_237_0.x, var_237_0.y, var_237_0.z + 64)
                                }

                                for iter_237_0, iter_237_1 in ipairs(var_237_1) do
                                        local var_237_2 = math.world_to_screen(iter_237_1)

                                        if var_237_2 then
                                                local var_237_3 = var_237_2.x - var_236_4
                                                local var_237_4 = var_237_2.y - var_236_5
                                                local var_237_5 = math.sqrt(var_237_3 * var_237_3 + var_237_4 * var_237_4)

                                                if var_237_5 < var_236_8 and var_237_5 < var_236_7 then
                                                        var_236_7 = var_237_5
                                                        var_236_6 = arg_237_0.entity

                                                        break
                                                end
                                        end
                                end
                        end
                end
        end)

        return var_236_6
end

function slot_0_195_1()
        return
end

function slot_0_196_1()
        if not slot_0_174_1.enabled then
                return
        end

        if not draw or not draw.surface then
                return
        end

        slot_239_0_0 = draw.surface
        slot_239_1_0 = game and game.global_vars and game.global_vars.real_time or 0
        slot_239_2_0 = math.sin(slot_239_1_0 * 6) * 0.5 + 0.5
        slot_239_3_0 = draw.color(255, 255 - slot_239_2_0 * 100, 0, 255)

        for iter_239_0, iter_239_1 in ipairs(slot_0_174_1.cache or {}) do
                if iter_239_1 and iter_239_1.name and slot_0_174_1.selected_names and slot_0_174_1.selected_names[iter_239_1.name] and iter_239_1.is_alive then
                        slot_239_9_0 = iter_239_1.entity:get_abs_origin()

                        if slot_239_9_0 then
                                slot_239_10_0 = math.world_to_screen(slot_239_9_0)

                                if slot_239_10_0 then
                                        slot_239_11_0 = slot_239_10_0.x
                                        slot_239_12_0 = slot_239_10_0.y + 40
                                        slot_239_13_0 = 18 * (slot_0_174_1.symbol_size or 0.6)
                                        slot_239_14_0 = draw.vec2(slot_239_11_0, slot_239_12_0 - slot_239_13_0)
                                        slot_239_15_0 = draw.vec2(slot_239_11_0 - slot_239_13_0 * 0.866, slot_239_12_0 + slot_239_13_0 * 0.5)
                                        slot_239_16_0 = draw.vec2(slot_239_11_0 + slot_239_13_0 * 0.866, slot_239_12_0 + slot_239_13_0 * 0.5)

                                        slot_239_0_0:add_line(slot_239_14_0, slot_239_15_0, slot_239_3_0, 4 * (slot_0_174_1.symbol_size or 0.6))
                                        slot_239_0_0:add_line(slot_239_15_0, slot_239_16_0, slot_239_3_0, 4 * (slot_0_174_1.symbol_size or 0.6))
                                        slot_239_0_0:add_line(slot_239_16_0, slot_239_14_0, slot_239_3_0, 4 * (slot_0_174_1.symbol_size or 0.6))
                                        slot_239_0_0:add_line(draw.vec2(slot_239_11_0, slot_239_12_0 - slot_239_13_0 * 0.5), draw.vec2(slot_239_11_0, slot_239_12_0), slot_239_3_0, 3 * (slot_0_174_1.symbol_size or 0.6))
                                        slot_239_0_0:add_circle_filled(draw.vec2(slot_239_11_0, slot_239_12_0 + slot_239_13_0 * 0.2), 3 * (slot_0_174_1.symbol_size or 0.6), slot_239_3_0)

                                        if slot_0_174_1.tags and slot_0_174_1.tags[iter_239_1.name] and slot_0_174_1.tags[iter_239_1.name] ~= "None" then
                                                slot_239_17_0 = slot_0_174_1.tags[iter_239_1.name]
                                                slot_239_18_0 = slot_239_10_0.y + 60
                                                slot_239_19_0 = draw.color(255, 255, 0, 255)

                                                if slot_239_17_0 == "Rage" then
                                                        slot_239_19_0 = draw.color(255, 50, 50, 255)
                                                elseif slot_239_17_0 == "Legit-Hack" then
                                                        slot_239_19_0 = draw.color(255, 150, 0, 255)
                                                end

                                                slot_239_20_0 = nil
                                                slot_239_21_0 = nil

                                                if slot_0_174_1.features_enabled then
                                                        slot_239_22_1 = slot_0_174_1.enemy_features and slot_0_174_1.enemy_features[iter_239_1.name]

                                                        if slot_239_22_1 == "Rage" then
                                                                slot_239_20_0 = "AA on"
                                                                slot_239_21_0 = draw.color(50, 255, 50, 255)
                                                        elseif slot_239_22_1 == "Legit" then
                                                                slot_239_20_0 = "TRG on"
                                                                slot_239_21_0 = draw.color(100, 200, 255, 255)
                                                        end
                                                end

                                                slot_239_22_0 = theme and theme.fonts and theme.fonts.item

                                                if slot_239_22_0 and slot_239_22_0.get_text_size then
                                                        slot_239_23_0 = slot_239_17_0

                                                        if slot_239_20_0 then
                                                                slot_239_23_0 = slot_239_17_0 .. " | " .. slot_239_20_0
                                                        end

                                                        slot_239_24_0 = slot_239_22_0:get_text_size(slot_239_23_0)
                                                        slot_239_25_0 = slot_239_10_0.x - slot_239_24_0.x / 2

                                                        slot_239_0_0:add_rect_filled_rounded(draw.rect(slot_239_25_0 - 6, slot_239_18_0 - 2, slot_239_25_0 + slot_239_24_0.x + 6, slot_239_18_0 + 20), draw.color(0, 0, 0, 180), 3)

                                                        slot_239_0_0.font = slot_239_22_0

                                                        slot_239_0_0:add_text(draw.vec2(slot_239_25_0, slot_239_18_0), slot_239_17_0, slot_239_19_0)

                                                        if slot_239_20_0 then
                                                                slot_239_27_0 = slot_239_25_0 + slot_239_22_0:get_text_size(slot_239_17_0).x
                                                                slot_239_28_0 = draw.color(150, 150, 150, 255)

                                                                slot_239_0_0:add_text(draw.vec2(slot_239_27_0, slot_239_18_0), " | ", slot_239_28_0)

                                                                slot_239_29_0 = slot_239_22_0:get_text_size(" | ")

                                                                slot_239_0_0:add_text(draw.vec2(slot_239_27_0 + slot_239_29_0.x, slot_239_18_0), slot_239_20_0, slot_239_21_0)
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
end

slot_0_197_1 = {
        [0] = "None",
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
        "M249",
        nil,
        "M4A4",
        "MAC-10",
        nil,
        "P90",
        "Zone Repulsor",
        nil,
        nil,
        "MP5-SD",
        "UMP-45",
        "XM1014",
        "PP-Bizon",
        "MAG-7",
        "Negev",
        "Sawed-Off",
        "Tec-9",
        "Zeus x27",
        "P2000",
        "MP7",
        "MP9",
        "Nova",
        "P250",
        "Shield",
        "SCAR-20",
        "SG 553",
        "SSG-08",
        "Golden Knife",
        "Knife",
        "Flashbang",
        "HE Grenade",
        "Smoke Grenade",
        "Molotov",
        "Decoy Grenade",
        "Incendiary Grenade",
        "C4 Explosive",
        "Health Shot",
        "Terrorist Knife",
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
        nil,
        nil,
        nil,
        "Tactical Awareness Grenade",
        "Fists",
        "Breach Charge",
        nil,
        "Tablet",
        nil,
        "Melee",
        "Axe",
        "Hammer",
        nil,
        "Spanner (Wrench)",
        nil,
        "Ghost Knife",
        "Firebomb",
        "Diversion Device",
        "Frag Grenade",
        "Snowball",
        "Bump Mine",
        [515] = "Butterfly Knife",
        [516] = "Shadow Daggers",
        [519] = "Ursus Knife",
        [520] = "Navaja Knife",
        [523] = "Talon Knife",
        [525] = "Skeleton Knife",
        [526] = "Kukri Knife",
        [512] = "Falchion Knife",
        [514] = "Bowie Knife",
        [518] = "Survival Knife",
        [500] = "Bayonet",
        [503] = "Classic Knife",
        [521] = "Nomad Knife",
        [505] = "Flip Knife",
        [522] = "Stiletto Knife",
        [507] = "Karambit",
        [506] = "Gut Knife",
        [509] = "Huntsman Knife",
        [508] = "M9 Bayonet",
        [517] = "Paracord Knife"
}
slot_0_198_1 = {
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
        "Zone Repulsor",
        "Unknown"
}

function slot_0_199_1()
        if not slot_0_174_1.enabled or not slot_0_174_1.features_enabled then
                return
        end

        local var_240_0 = entities.get_local_pawn()

        if not var_240_0 then
                return
        end

        local var_240_1 = var_240_0:get_active_weapon()

        if not var_240_1 then
                return
        end

        local var_240_2 = var_240_1:get_id()
        local var_240_3 = var_240_1:get_type()
        local var_240_4 = slot_0_197_1[var_240_2]
        local var_240_5 = slot_0_198_1[var_240_3]
        local var_240_6 = slot_0_194_1()
        local var_240_7
        local var_240_8 = "None"

        if var_240_6 and var_240_6.is_enemy and var_240_6:is_enemy() and var_240_6.get_name then
                local var_240_9 = var_240_6:get_name()

                if slot_0_174_1.selected_names and slot_0_174_1.selected_names[var_240_9] then
                        var_240_8 = slot_0_174_1.enemy_features and slot_0_174_1.enemy_features[var_240_9] or "None"
                end
        end

        local function var_240_10()
                if not gui or not gui.ctx or not gui.ctx.find then
                        return nil
                end

                if var_240_4 then
                        local var_241_0 = "legit>weapon>" .. var_240_4 .. ">trigger>triggerbot"
                        local var_241_1 = gui.ctx:find(var_241_0)

                        if var_241_1 then
                                return var_241_1
                        end
                end

                if var_240_5 then
                        local var_241_2 = "legit>weapon>" .. var_240_5 .. ">trigger>triggerbot"
                        local var_241_3 = gui.ctx:find(var_241_2)

                        if var_241_3 then
                                return var_241_3
                        end
                end

                return gui.ctx:find("legit>weapon>general>trigger>triggerbot")
        end

        local function var_240_11()
                if not gui or not gui.ctx or not gui.ctx.find then
                        return nil
                end

                if var_240_4 then
                        local var_242_0 = "legit>weapon>" .. var_240_4 .. ">aim>aim assist"
                        local var_242_1 = gui.ctx:find(var_242_0)

                        if var_242_1 then
                                return var_242_1
                        end
                end

                if var_240_5 then
                        local var_242_2 = "legit>weapon>" .. var_240_5 .. ">aim>aim assist"
                        local var_242_3 = gui.ctx:find(var_242_2)

                        if var_242_3 then
                                return var_242_3
                        end
                end

                return gui.ctx:find("legit>weapon>general>aim>aim assist")
        end

        if var_240_8 == "Rage" then
                local var_240_12 = gui and gui.ctx and gui.ctx.find and gui.ctx:find("rage>aimbot>general>autofire") or nil

                if var_240_12 then
                        var_240_12:set_value(true)
                end

                local var_240_13 = var_240_10()

                if var_240_13 then
                        var_240_13:set_value(false)
                end

                local var_240_14 = var_240_11()

                if var_240_14 then
                        var_240_14:set_value(false)
                end
        elseif var_240_8 == "Legit" then
                local var_240_15 = var_240_10()

                if var_240_15 then
                        var_240_15:set_value(true)
                end

                if slot_0_174_1.enable_aim_assist then
                        local var_240_16 = var_240_11()

                        if var_240_16 then
                                var_240_16:set_value(true)
                        end
                end

                local var_240_17 = gui and gui.ctx and gui.ctx.find and gui.ctx:find("rage>aimbot>general>autofire") or nil

                if var_240_17 then
                        var_240_17:set_value(false)
                end
        else
                local var_240_18 = gui and gui.ctx and gui.ctx.find and gui.ctx:find("rage>aimbot>general>autofire") or nil

                if var_240_18 then
                        var_240_18:set_value(false)
                end

                local var_240_19 = var_240_10()

                if var_240_19 then
                        var_240_19:set_value(false)
                end

                local var_240_20 = var_240_11()

                if var_240_20 then
                        var_240_20:set_value(false)
                end
        end
end

if events and events.present_queue and events.present_queue.add then
        events.present_queue:add(function()
                local var_243_0 = game and game.engine

                if not var_243_0 or not var_243_0.in_game or not var_243_0:in_game() then
                        return
                end

                slot_0_190_1()

                if slot_0_174_1.enabled then
                        local var_243_1 = game and game.global_vars and game.global_vars.real_time or 0

                        if slot_0_174_1.__force_refresh or var_243_1 - slot_0_174_1.last_update >= 0.4 then
                                slot_0_191_1()

                                slot_0_174_1.last_update = var_243_1
                                slot_0_174_1.__force_refresh = false
                        end

                        slot_0_196_1()
                        slot_0_195_1()

                        if slot_0_174_1.features_enabled then
                                slot_0_199_1()
                        end
                end
        end)
end

if events and events.event and events.event.add then
        events.event:add(function(arg_244_0)
                if not arg_244_0 then
                        return
                end

                if arg_244_0:get_name() == "player_death" and slot_0_174_1.killsay_enable then
                        local var_244_0 = arg_244_0:get_pawn_from_id("attacker")
                        local var_244_1 = arg_244_0:get_pawn_from_id("userid")
                        local var_244_2 = entities.get_local_pawn()

                        if var_244_1 and var_244_2 and var_244_1 == var_244_2 and hvh then
                                hvh.hc_active = false
                                hvh.hc_fire_time = nil
                        end

                        if var_244_0 and var_244_2 and var_244_0 == var_244_2 and var_244_1 then
                                local var_244_3 = "Unknown"
                                local var_244_4 = "0"

                                if var_244_1.get_name then
                                        var_244_3 = var_244_1:get_name() or "Unknown"
                                end

                                if var_244_1.get_index then
                                        local var_244_5 = tostring(var_244_1:get_index() or 0)
                                end

                                local var_244_6 = false
                                local var_244_7

                                if slot_0_174_1.killsay and slot_0_174_1.killsay[var_244_3] and slot_0_174_1.killsay[var_244_3] ~= "" then
                                        var_244_6 = true
                                        var_244_7 = slot_0_174_1.killsay[var_244_3]
                                end

                                if var_244_6 and var_244_7 then
                                        local var_244_8 = var_244_7:gsub("{name}", var_244_3)

                                        if game.engine then
                                                game.engine:client_cmd("say " .. var_244_8)
                                        end
                                end
                        end
                end
        end)

        if mods and mods.events and mods.events.add_listener then
                mods.events:add_listener("player_death")
        end
end

slot_0_174_0 = nil

function slot_0_175_0()
        if not game or not game.engine or not game.engine.in_game then
                return
        end

        local var_245_0 = game.engine:in_game()

        if slot_0_174_0 == nil then
                slot_0_174_0 = var_245_0

                return
        end

        if not slot_0_133_0 then
                slot_0_0_0.active = true
                slot_0_0_0.start_time = nil
                slot_0_0_0.elapsed_time = 0
                slot_0_0_0.elements_initialized = false
                slot_0_0_0.sound_played = false
                slot_0_133_0 = true
        end

        slot_0_174_0 = var_245_0
end

ant = {
        spin_speed = 100,
        last_mode_switch = 0,
        speed = 5,
        mode_msg = "Tueurs.aa : Unknown",
        master_mode_index = 1,
        is_currently_active = false,
        indicators = false,
        lock_mode_to_stand = false,
        yaw_jmin = -8,
        _initialized = false,
        manual_values = false,
        _drag = nil,
        ind_y = 300,
        ind_x = 300,
        yaw_max = -90,
        yaw_min = -150,
        pitch_jmax = -2,
        pitch_jmin = -4,
        pitch_max = -50,
        pitch_min = -70,
        mode_index = 1,
        yaw_jmax = -4,
        master_mode_names = {
                "Desligado",
                "Sempre Ligado",
                "Automático (Por Situação)"
        },
        activation_states = {
                walking = true,
                in_air = true,
                stand = true
        },
        mode_names = {
                "stand",
                "walking",
                "crouch_stand",
                "crouch_walk",
                "in_air",
                "in_air_crouch"
        },
        mode_display_names = {
                "Parado",
                "Andando",
                "Agachar Parado",
                "Agachar Andando",
                "No Ar",
                "No Ar Agachado"
        },
        mode_display_names_en = {
                "Stand",
                "Walking",
                "Crouch Stand",
                "Crouch Walk",
                "In Air",
                "In Air (Crouch)"
        },
        exploit_on_states = {},
        spin_on_states = {},
        ui_filter_options = {
                "Pitch",
                "Pitch Jitter",
                "Yaw",
                "Yaw Jitter",
                "Velocidades"
        },
        ui_filter_selection = {
                ["Pitch Jitter"] = false,
                Pitch = true,
                Velocidades = false,
                ["Yaw Jitter"] = false,
                Yaw = true
        },
        modes = {
                {
                        spin_speed = 10,
                        speed = 4,
                        yaw_jmax = -2,
                        yaw_jmin = -3,
                        yaw_max = -30,
                        yaw_min = -90,
                        pitch_jmax = 0,
                        pitch_jmin = -2,
                        name = "stand",
                        pitch_min = -30,
                        pitch_max = -10
                },
                {
                        spin_speed = 12,
                        speed = 7,
                        yaw_jmax = -5,
                        yaw_jmin = -10,
                        yaw_max = -150,
                        yaw_min = -180,
                        pitch_jmax = -1,
                        pitch_jmin = -5,
                        name = "walking",
                        pitch_min = -89,
                        pitch_max = -70
                },
                {
                        spin_speed = 9,
                        speed = 3,
                        yaw_jmax = -3,
                        yaw_jmin = -6,
                        yaw_max = -60,
                        yaw_min = -90,
                        pitch_jmax = -1,
                        pitch_jmin = -3,
                        name = "crouch_stand",
                        pitch_min = -45,
                        pitch_max = -30
                },
                {
                        spin_speed = 11,
                        speed = 5,
                        yaw_jmax = -4,
                        yaw_jmin = -7,
                        yaw_max = -80,
                        yaw_min = -120,
                        pitch_jmax = -2,
                        pitch_jmin = -4,
                        name = "crouch_walk",
                        pitch_min = -55,
                        pitch_max = -40
                },
                {
                        spin_speed = 10,
                        speed = 5,
                        yaw_jmax = -4,
                        yaw_jmin = -8,
                        yaw_max = -90,
                        yaw_min = -150,
                        pitch_jmax = -2,
                        pitch_jmin = -4,
                        name = "in_air",
                        pitch_min = -70,
                        pitch_max = -50
                },
                {
                        spin_speed = 11,
                        speed = 6,
                        yaw_jmax = -5,
                        yaw_jmin = -9,
                        yaw_max = -100,
                        yaw_min = -160,
                        pitch_jmax = -3,
                        pitch_jmin = -5,
                        name = "in_air_crouch",
                        pitch_min = -80,
                        pitch_max = -60
                }
        }
}

function slot_0_176_0(arg_246_0)
        local var_246_0 = ant.modes[arg_246_0]

        if not var_246_0 then
                return
        end

        ant.pitch_min = var_246_0.pitch_min
        ant.pitch_max = var_246_0.pitch_max
        ant.pitch_jmin = var_246_0.pitch_jmin
        ant.pitch_jmax = var_246_0.pitch_jmax
        ant.yaw_min = var_246_0.yaw_min
        ant.yaw_max = var_246_0.yaw_max
        ant.yaw_jmin = var_246_0.yaw_jmin
        ant.yaw_jmax = var_246_0.yaw_jmax
        ant.speed = var_246_0.speed
        ant.spin_speed = var_246_0.spin_speed or 14
end

function slot_0_177_0()
        if not ant.modes[ant.mode_index] then
                return
        end

        local var_247_0 = ant.modes[ant.mode_index]

        var_247_0.pitch_min = ant.pitch_min
        var_247_0.pitch_max = ant.pitch_max
        var_247_0.pitch_jmin = ant.pitch_jmin
        var_247_0.pitch_jmax = ant.pitch_jmax
        var_247_0.yaw_min = ant.yaw_min
        var_247_0.yaw_max = ant.yaw_max
        var_247_0.yaw_jmin = ant.yaw_jmin
        var_247_0.yaw_jmax = ant.yaw_jmax
        var_247_0.speed = ant.speed
        var_247_0.spin_speed = ant.spin_speed
end

function slot_0_178_0()
        if not gui or not gui.ctx or not gui.ctx.find then
                return nil
        end

        local var_248_0 = {
                "rage>anti-aim>angles>anti-aim",
                "rage>anti-aim>general>anti-aim",
                "rage>anti-aim>anti-aim",
                "rage>anti-aim>enabled",
                "rage>anti-aim>enable"
        }

        for iter_248_0 = 1, #var_248_0 do
                local var_248_1 = gui.ctx:find(var_248_0[iter_248_0])

                if var_248_1 then
                        return var_248_1
                end
        end

        return nil
end

function slot_0_179_0()
        local var_249_0 = gui.ctx:find("rage>anti-aim>angles>pitch>settings>value")
        local var_249_1 = gui.ctx:find("rage>anti-aim>angles>pitch jitter>settings>value")
        local var_249_2 = gui.ctx:find("rage>anti-aim>angles>yaw>settings>amount")
        local var_249_3 = gui.ctx:find("rage>anti-aim>angles>yaw jitter>settings>amount")

        return var_249_0, var_249_1, var_249_2, var_249_3
end

function slot_0_180_0()
        if ant.mode_index and ant.mode_names and ant.mode_names[ant.mode_index] then
                ant.mode_msg = "Tueurs.aa : " .. ant.mode_names[ant.mode_index]
        else
                ant.mode_msg = "Tueurs.aa : Unknown"
        end

        if ant.lock_mode_to_stand then
                if ant.mode_index ~= 1 then
                        ant.mode_index = 1
                end

                return
        end

        local var_250_0 = entities.get_local_pawn()

        if not var_250_0 or not var_250_0:is_alive() or not var_250_0.m_fFlags then
                return
        end

        local var_250_1 = var_250_0.m_fFlags:get()
        local var_250_2 = var_250_0:get_abs_velocity():length_2d()
        local var_250_3 = bit.band(var_250_1, 1) ~= 0
        local var_250_4 = bit.band(var_250_1, 2) ~= 0
        local var_250_5 = var_250_2 > 5
        local var_250_6 = 1

        if not var_250_3 then
                var_250_6 = var_250_4 and 6 or 5
        elseif var_250_4 then
                var_250_6 = var_250_5 and 4 or 3
        else
                var_250_6 = var_250_5 and 2 or 1
        end

        if var_250_6 ~= ant.mode_index then
                local var_250_7 = game.global_vars.real_time

                if var_250_7 - ant.last_mode_switch >= 0.2 then
                        slot_0_177_0()

                        ant.last_mode_switch = var_250_7
                        ant.mode_index = var_250_6

                        slot_0_176_0(var_250_6)

                        if active_control_id and (active_control_id == "pitch_min" or active_control_id == "pitch_max" or active_control_id == "pitch_jmin" or active_control_id == "pitch_jmax" or active_control_id == "yaw_min" or active_control_id == "yaw_max" or active_control_id == "yaw_jmin" or active_control_id == "yaw_jmax" or active_control_id == "aa_speed" or active_control_id == "aa_spin_speed") then
                                active_control_id = nil
                        end

                        slot_0_110_0.pitch_min = tostring(ant.pitch_min)
                        slot_0_110_0.pitch_max = tostring(ant.pitch_max)
                        slot_0_110_0.pitch_jmin = tostring(ant.pitch_jmin)
                        slot_0_110_0.pitch_jmax = tostring(ant.pitch_jmax)
                        slot_0_110_0.yaw_min = tostring(ant.yaw_min)
                        slot_0_110_0.yaw_max = tostring(ant.yaw_max)
                        slot_0_110_0.yaw_jmin = tostring(ant.yaw_jmin)
                        slot_0_110_0.yaw_jmax = tostring(ant.yaw_jmax)
                        slot_0_110_0.aa_speed = tostring(ant.speed)
                        slot_0_110_0.aa_spin_speed = tostring(ant.spin_speed)
                end
        end

        if ant.mode_index and ant.mode_names and ant.mode_names[ant.mode_index] then
                ant.mode_msg = "Tueurs.aa : " .. ant.mode_names[ant.mode_index]
        end
end

function slot_0_181_0()
        if not gui or not gui.ctx or not gui.ctx.find then
                return
        end

        if not ant.mode_index or ant.mode_index < 1 or ant.mode_index > #ant.mode_names then
                ant.mode_index = 1
        end

        local var_251_0, var_251_1, var_251_2, var_251_3 = slot_0_179_0()
        local var_251_4 = gui.ctx:find("rage>anti-aim>angles>spin")
        local var_251_5 = gui.ctx:find("rage>anti-aim>angles>spin amount")
        local var_251_6 = ant.mode_names[ant.mode_index]

        if not var_251_6 then
                return
        end

        if ant.spin_on_states[var_251_6] then
                if var_251_4 and var_251_5 then
                        var_251_4:set_value(true)

                        local var_251_7 = var_251_5:get_value()

                        if var_251_7 and var_251_7.set then
                                var_251_7:set(ant.spin_speed)
                        end
                end
        elseif var_251_4 then
                var_251_4:set_value(false)
        end

        if not var_251_0 or not var_251_1 or not var_251_2 or not var_251_3 then
                return
        end

        if ant.exploit_on_states[var_251_6] then
                local var_251_8 = var_251_0

                if var_251_8 then
                        local var_251_9 = var_251_8:get_value()

                        if var_251_9 and var_251_9.set then
                                var_251_9:set(-3.4028233462974e+30)
                        end
                end

                return
        end

        local var_251_10 = game.global_vars.real_time
        local var_251_11 = math.random(ant.pitch_min, ant.pitch_max)
        local var_251_12 = math.floor(var_251_10 * 2) % 2 == 0 and ant.pitch_jmin or ant.pitch_jmax
        local var_251_13 = math.floor(var_251_10 * 2) % 2 == 0 and ant.yaw_min or ant.yaw_max
        local var_251_14 = math.floor(var_251_10 * 2) % 2 == 0 and ant.yaw_jmin or ant.yaw_jmax
        local var_251_15 = game.global_vars.tick_count * ant.speed

        if math.floor(var_251_15) % 2 == 0 then
                var_251_11 = ant.pitch_min
                var_251_12 = ant.pitch_jmin
                var_251_13 = ant.yaw_min
                var_251_14 = ant.yaw_jmin
        end

        local function var_251_16(arg_252_0, arg_252_1)
                if arg_252_0 then
                        local var_252_0 = arg_252_0:get_value()

                        if var_252_0 and var_252_0.set then
                                var_252_0:set(arg_252_1)
                        end
                end
        end

        var_251_16(var_251_0, var_251_11)
        var_251_16(var_251_1, var_251_12)
        var_251_16(var_251_2, var_251_13)
        var_251_16(var_251_3, var_251_14)
end

function slot_0_182_0()
        if not ant.indicators or not ant.is_currently_active then
                return
        end

        slot_253_0_0 = draw.surface
        slot_253_1_0, slot_253_2_0 = game.engine:get_screen_size()
        ant.ind_x = slot_0_54_0(ant.ind_x, 0, slot_253_1_0 - 250)
        ant.ind_y = slot_0_54_0(ant.ind_y, 0, slot_253_2_0 - 150)
        slot_253_3_0 = ant.ind_x
        slot_253_4_0 = ant.ind_y
        slot_253_5_0 = 12
        slot_253_6_0 = 220
        slot_253_7_0 = 24
        slot_253_8_0 = 100
        slot_253_9_0 = slot_253_5_0 + slot_253_7_0 + slot_253_8_0 + slot_253_5_0
        slot_253_10_0 = slot_0_65_0.x
        slot_253_11_0 = slot_0_65_0.y

        if slot_0_171_0(slot_0_49_0) and slot_0_65_0.pressed and slot_0_57_0(slot_253_3_0, slot_253_4_0, slot_253_6_0, slot_253_9_0, slot_253_10_0, slot_253_11_0) then
                ant._drag = {
                        offx = slot_253_10_0 - slot_253_3_0,
                        offy = slot_253_11_0 - slot_253_4_0
                }
        end

        if slot_0_65_0.released then
                ant._drag = nil
        end

        if ant._drag then
                ant.ind_x = slot_0_54_0(slot_253_10_0 - ant._drag.offx, 0, slot_253_1_0 - slot_253_6_0)
                ant.ind_y = slot_0_54_0(slot_253_11_0 - ant._drag.offy, 0, slot_253_2_0 - slot_253_9_0)
                slot_253_3_0, slot_253_4_0 = ant.ind_x, ant.ind_y
        end

        slot_253_0_0:add_shadow_rect(draw.rect(slot_253_3_0, slot_253_4_0, slot_253_3_0 + slot_253_6_0, slot_253_4_0 + slot_253_9_0), 12, true, 0.3)
        slot_253_0_0:add_rect_filled_rounded(draw.rect(slot_253_3_0, slot_253_4_0, slot_253_3_0 + slot_253_6_0, slot_253_4_0 + slot_253_9_0), theme.colors.bg_sidebar:mod_a(0.9), 6)
        slot_253_0_0:add_rect_rounded(draw.rect(slot_253_3_0, slot_253_4_0, slot_253_3_0 + slot_253_6_0, slot_253_4_0 + slot_253_9_0), theme.colors.border_inner:mod_a(0.8), 6)
        slot_0_58_0(slot_253_0_0, theme.fonts.item, slot_253_3_0 + slot_253_5_0, slot_253_4_0 + slot_253_5_0 - 4, ant.mode_msg or "Tueurs.aa", theme.colors.accent)

        function slot_253_12_0(arg_254_0, arg_254_1, arg_254_2, arg_254_3, arg_254_4, arg_254_5)
                slot_253_0_0:add_rect_filled_rounded(draw.rect(arg_254_0, arg_254_1, arg_254_0 + arg_254_2, arg_254_1 + arg_254_3), theme.colors.bg_content, arg_254_3 / 2)

                if arg_254_4 > 0 then
                        slot_253_0_0:add_rect_filled_rounded_multicolor(draw.rect(arg_254_0, arg_254_1, arg_254_0 + arg_254_2 * arg_254_4, arg_254_1 + arg_254_3), {
                                theme.colors.accent:darken(0.2),
                                theme.colors.accent,
                                theme.colors.accent,
                                theme.colors.accent:darken(0.2)
                        }, arg_254_3 / 2)
                end

                slot_253_0_0:add_rect_rounded(draw.rect(arg_254_0, arg_254_1, arg_254_0 + arg_254_2, arg_254_1 + arg_254_3), theme.colors.border_inner, arg_254_3 / 2)
                slot_0_58_0(slot_253_0_0, theme.fonts.small, arg_254_0, arg_254_1 - 14, arg_254_5, theme.colors.text_normal)
        end

        slot_253_13_0 = slot_253_3_0 + slot_253_5_0
        slot_253_14_0 = slot_253_4_0 + slot_253_5_0 + slot_253_7_0 + 10
        slot_253_15_0 = slot_253_6_0 - slot_253_5_0 * 2
        slot_253_16_0 = 6
        slot_253_17_0 = 26
        slot_253_18_0, slot_253_19_0, slot_253_20_0, slot_253_21_0 = slot_0_179_0()

        function slot_253_22_0(arg_255_0, arg_255_1)
                if arg_255_0 and arg_255_0:get_value() and arg_255_0:get_value().get then
                        return arg_255_0:get_value():get()
                end

                return arg_255_1 or 0
        end

        slot_253_23_0 = {
                {
                        l = "Pitch",
                        min = -89,
                        max = 89,
                        v = slot_253_22_0(slot_253_18_0)
                },
                {
                        l = "Pitch Jitter",
                        min = -89,
                        max = 89,
                        v = slot_253_22_0(slot_253_19_0)
                },
                {
                        l = "Yaw",
                        min = -180,
                        max = 180,
                        v = slot_253_22_0(slot_253_20_0)
                },
                {
                        l = "Yaw Jitter",
                        min = -180,
                        max = 180,
                        v = slot_253_22_0(slot_253_21_0)
                }
        }

        for iter_253_0, iter_253_1 in ipairs(slot_253_23_0) do
                slot_253_29_0 = slot_0_54_0((iter_253_1.v - iter_253_1.min) / (iter_253_1.max - iter_253_1.min), 0, 1)

                slot_253_12_0(slot_253_13_0, slot_253_14_0 + (iter_253_0 - 1) * slot_253_17_0, slot_253_15_0, slot_253_16_0, slot_253_29_0, iter_253_1.l)
        end
end

events.present_queue:add(function()
        if not G.resolution_initialized then
                slot_256_0_1 = 2560
                slot_256_1_1 = 1440

                if game and game.engine and game.engine.get_screen_size then
                        slot_256_2_1, slot_256_3_5 = game.engine:get_screen_size()

                        if slot_256_2_1 and slot_256_3_5 then
                                slot_256_0_1, slot_256_1_1 = slot_256_2_1, slot_256_3_5
                        end
                end

                G.screen_w, G.screen_h = slot_256_0_1, slot_256_1_1
                G.dpi_scale = math.max(1, slot_256_1_1 / 1440)

                if G.dpi_scale < 0.5 then
                        G.dpi_scale = 0.5
                end

                G.resolution_initialized = true
        end

        if not G.fonts_initialized then
                if slot_0_0_0 and slot_0_0_0.font_rain and slot_0_0_0.font_rain.create then
                        slot_0_0_0.font_rain:create()
                end

                if slot_0_0_0 and slot_0_0_0.font_title and slot_0_0_0.font_title.create then
                        slot_0_0_0.font_title:create()
                end

                if slot_0_0_0 and slot_0_0_0.font_subtitle and slot_0_0_0.font_subtitle.create then
                        slot_0_0_0.font_subtitle:create()
                end

                if slot_0_0_0 and slot_0_0_0.font_dev and slot_0_0_0.font_dev.create then
                        slot_0_0_0.font_dev:create()
                end

                if slot_0_0_0 and slot_0_0_0.font_small and slot_0_0_0.font_small.create then
                        slot_0_0_0.font_small:create()
                end

                for iter_256_0, iter_256_1 in pairs(theme.fonts) do
                        if iter_256_1 and iter_256_1.create then
                                iter_256_1:create()
                        end
                end

                G.fonts_initialized = true
        end

        if not G.printed_resolution then
                if not G.script_start_time then
                        G.script_start_time = game.global_vars.real_time
                end

                if game.global_vars.real_time - G.script_start_time >= 10 then
                        print("[TUEURS] Resolução detectada: " .. tostring(G.screen_w) .. "x" .. tostring(G.screen_h) .. " | DPI Scale: " .. tostring(G.dpi_scale))

                        G.printed_resolution = true
                end
        end

        slot_0_175_0()
        slot_0_169_0()

        if G and G.aimlock then
                if G.aimlock.loop then
                        G.aimlock.loop()
                end

                if G.aimlock.draw_fov then
                        G.aimlock.draw_fov()
                end
        end

        if slot_0_0_0.active then
                slot_0_31_0()

                return
        end

        opened_this_frame = false
        slot_256_0_0, slot_256_1_0 = slot_0_170_0()
        slot_256_2_0 = bit.band(slot_0_32_0(slot_0_47_0) or 0, 32768) ~= 0
        slot_0_65_0.pressed, slot_0_65_0.released = not slot_0_65_0.down and slot_256_2_0, slot_0_65_0.down and not slot_256_2_0
        slot_0_65_0.down, slot_0_65_0.x, slot_0_65_0.y = slot_256_2_0, slot_256_0_0, slot_256_1_0

        if color_picker_open then
                slot_256_3_3 = slot_0_65_0.pressed
                slot_256_4_5 = slot_0_55_0(slot_0_76_0 - 100, slot_0_76_0, slot_0_68_0)
                slot_256_5_7 = {
                        x = slot_256_4_5 + slot_0_80_0 + 40,
                        y = color_picker_target and (color_picker_target:find("^menu_") or color_picker_target:find("^hvh_")) and slot_0_77_0 + 220 or slot_0_77_0 + 110
                }
                slot_256_6_7 = {
                        h = 160,
                        w = 260
                }
                slot_256_7_7 = slot_0_65_0.x
                slot_256_8_7 = slot_0_65_0.y

                if slot_256_7_7 >= slot_256_5_7.x and slot_256_7_7 <= slot_256_5_7.x + slot_256_6_7.w and slot_256_8_7 >= slot_256_5_7.y and slot_256_8_7 <= slot_256_5_7.y + slot_256_6_7.h then
                        _color_picker_original_click = slot_256_3_3
                else
                        if slot_256_3_3 then
                                color_picker_open = false
                                active_control_id = nil
                                slot_0_65_0.pressed = false
                        end

                        _color_picker_original_click = false
                end
        else
                _color_picker_original_click = nil
        end

        if slot_0_65_0.pressed and not opened_this_frame and active_control_id then
                slot_256_3_2 = open_control_rect
                slot_256_4_4 = nil
                slot_256_5_6 = nil

                if color_picker_open and not slot_256_3_2 then
                        slot_256_6_6 = slot_0_55_0(slot_0_76_0 - 100, slot_0_76_0, slot_0_68_0)
                        slot_256_4_3 = {
                                x = slot_256_6_6 + slot_0_80_0 + 40,
                                y = color_picker_target and (color_picker_target:find("^menu_") or color_picker_target:find("^hvh_")) and slot_0_77_0 + 220 or slot_0_77_0 + 110
                        }
                        slot_256_5_5 = {
                                h = 160,
                                w = 260
                        }
                        slot_256_3_2 = {
                                x = slot_256_4_3.x,
                                y = slot_256_4_3.y,
                                w = slot_256_5_5.w,
                                h = slot_256_5_5.h
                        }
                end

                if slot_256_3_2 and not slot_0_57_0(slot_256_3_2.x, slot_256_3_2.y, slot_256_3_2.w, slot_256_3_2.h, slot_256_0_0, slot_256_1_0) then
                        active_control_id = nil
                        color_picker_open = false
                end
        end

        if slot_0_65_0.released and active_control_id then
                slot_256_3_1 = tostring(active_control_id)
                slot_256_4_2 = slot_256_3_1:find("_dist") or slot_256_3_1:find("_transparency") or slot_256_3_1:find("picker_sat") or slot_256_3_1:find("picker_val") or slot_256_3_1:find("picker_hue") or slot_256_3_1:find("spam_cooldown") or slot_256_3_1:find("fall_speed")
                slot_256_5_4 = not ant.manual_values and (slot_256_3_1:find("pitch_") or slot_256_3_1:find("yaw_") or slot_256_3_1:find("aa_speed") or slot_256_3_1:find("aa_spin"))

                if slot_256_4_2 or slot_256_5_4 then
                        active_control_id = nil
                end
        end

        slot_256_3_0 = slot_0_32_0(slot_0_46_0) or 0

        if bit.band(slot_256_3_0, 32768) ~= 0 and game.global_vars.real_time - last_home_toggle > 0.3 then
                slot_256_4_1 = menu_open
                menu_open = not menu_open
                last_home_toggle = game.global_vars.real_time
                slot_256_5_3 = EnemyTrackerState

                if slot_256_5_3 and slot_256_5_3.enabled then
                        slot_256_5_3.mini_ui_enabled = not slot_256_5_3.mini_ui_enabled
                        slot_256_5_3.force_closed = not slot_256_5_3.mini_ui_enabled
                end

                if (not slot_256_5_3 or not slot_256_5_3.enabled) and slot_256_5_3 then
                        slot_256_5_3.mini_ui_enabled = false
                end

                if menu_open and not slot_0_66_0 then
                        if game and game.input_system and game.game_ui_funcs and game.game_ui_funcs.get_binding_for_button_code then
                                slot_256_6_5 = game.input_system:vk_to_button_code(1)

                                if slot_256_6_5 then
                                        slot_0_67_0.mouse1 = game.game_ui_funcs:get_binding_for_button_code(slot_256_6_5)
                                end

                                slot_256_7_6 = game.input_system:vk_to_button_code(89)

                                if slot_256_7_6 then
                                        slot_0_67_0.y = game.game_ui_funcs:get_binding_for_button_code(slot_256_7_6)
                                end

                                slot_256_8_6 = game.input_system:vk_to_button_code(85)

                                if slot_256_8_6 then
                                        slot_0_67_0.u = game.game_ui_funcs:get_binding_for_button_code(slot_256_8_6)
                                end
                        end

                        if not slot_0_67_0.mouse1 or slot_0_67_0.mouse1 == "" then
                                slot_0_67_0.mouse1 = "+attack"
                        end

                        if not slot_0_67_0.y or slot_0_67_0.y == "" then
                                slot_0_67_0.y = "messagemode"
                        end

                        if not slot_0_67_0.u or slot_0_67_0.u == "" then
                                slot_0_67_0.u = "messagemode2"
                        end

                        if game and game.engine and game.engine.client_cmd then
                                game.engine:client_cmd("unbind mouse1")
                                game.engine:client_cmd("unbind y")
                                game.engine:client_cmd("unbind u")

                                slot_0_66_0 = true
                        end
                end

                if not menu_open then
                        active_control_id = nil
                        color_picker_open = false
                        open_control_rect = nil
                        open_control_rect_prev = nil

                        if hvh then
                                hvh.hc_active = false
                                hvh.hc_fire_time = nil
                        end

                        if slot_0_66_0 and game and game.engine and game.engine.client_cmd then
                                slot_256_6_4 = slot_0_67_0.mouse1 or "+attack"
                                slot_256_7_5 = slot_0_67_0.y or "messagemode"
                                slot_256_8_5 = slot_0_67_0.u or "messagemode2"

                                game.engine:client_cmd("bind mouse1 \"" .. tostring(slot_256_6_4) .. "\"")
                                game.engine:client_cmd("bind y \"" .. tostring(slot_256_7_5) .. "\"")
                                game.engine:client_cmd("bind u \"" .. tostring(slot_256_8_5) .. "\"")

                                slot_0_66_0 = false
                                slot_0_67_0 = {
                                        y = nil
                                }
                        end
                end
        end

        if not slot_0_86_0.is_rgb then
                theme.colors.accent = draw.color(0, 0, 0):hsv(slot_0_86_0.accent_hue, slot_0_86_0.accent_sat, slot_0_86_0.accent_val)
        end

        slot_0_138_0()

        slot_256_4_0 = menu_open and 1 or 0
        slot_0_68_0 = slot_0_55_0(slot_0_68_0, slot_256_4_0, 0.2)

        if math.abs(slot_0_68_0 - slot_256_4_0) < 0.001 then
                slot_0_68_0 = slot_256_4_0
        end

        slot_0_109_0()

        if game.engine:in_game() then
                if slot_0_94_0.selected_style == 1 then
                        draw_hud_style_1()
                elseif slot_0_94_0.selected_style == 2 then
                        draw_hud_style_2()
                end

                draw_lua_keybinds_hud()

                if hvh and hvh.hc_enable and hvh.hc_active or hvh and hvh.anti_miss_enable and hvh.anti_miss_count and hvh.anti_miss_count > 0 then
                        slot_256_5_2 = draw.surface
                        slot_256_6_3, slot_256_7_4 = game.engine:get_screen_size()
                        slot_256_8_4 = slot_256_6_3 / 2
                        slot_256_9_5 = slot_256_7_4 / 2
                        slot_256_10_2 = game.global_vars and game.global_vars.real_time or 0
                        hvh.indicator_drag = hvh.indicator_drag or {
                                dragging = false,
                                offset_y = 0,
                                offset_x = 0
                        }
                        slot_256_11_2 = hvh.indicator_drag
                        slot_256_12_4 = 8
                        slot_256_13_4 = 6
                        slot_256_14_4 = 0
                        slot_256_15_3 = 120
                        slot_256_16_3 = ""
                        slot_256_17_2 = {
                                x = 0,
                                y = 0
                        }
                        slot_256_18_2 = ""
                        slot_256_19_2 = {
                                x = 0,
                                y = 0
                        }

                        if hvh.hc_enable and hvh.hc_active then
                                slot_256_20_3 = slot_256_10_2 - (hvh.hc_fire_time or 0)
                                slot_256_21_3 = math.max(0, 2 - slot_256_20_3)
                                slot_256_16_3 = "HC Helper (" .. string.format("%.1fs", slot_256_21_3) .. ")"
                                slot_256_17_2 = theme.fonts.mono:get_text_size(slot_256_16_3)
                                slot_256_15_3 = math.max(slot_256_15_3, slot_256_17_2.x + slot_256_12_4 * 2)
                                slot_256_14_4 = slot_256_14_4 + slot_256_17_2.y + slot_256_12_4 * 2 + 6
                        end

                        if hvh.anti_miss_enable and hvh.anti_miss_count and hvh.anti_miss_count > 0 then
                                slot_256_18_2 = "Miss (" .. hvh.anti_miss_count .. ")"
                                slot_256_19_2 = theme.fonts.mono:get_text_size(slot_256_18_2)
                                slot_256_15_3 = math.max(slot_256_15_3, slot_256_19_2.x + slot_256_12_4 * 2)

                                if slot_256_14_4 > 0 then
                                        slot_256_14_4 = slot_256_14_4 + slot_256_13_4
                                end

                                slot_256_14_4 = slot_256_14_4 + slot_256_19_2.y + slot_256_12_4 * 2
                        end

                        if not slot_256_11_2.x then
                                slot_256_11_2.x = slot_256_8_4 - slot_256_15_3 / 2
                        end

                        if not slot_256_11_2.y then
                                slot_256_11_2.y = slot_256_9_5 + 30
                        end

                        slot_256_20_2 = slot_256_11_2.x
                        slot_256_21_2 = slot_256_11_2.y
                        slot_256_22_2 = slot_0_65_0 and slot_256_20_2 <= slot_0_65_0.x and slot_0_65_0.x <= slot_256_20_2 + slot_256_15_3 and slot_256_21_2 <= slot_0_65_0.y and slot_0_65_0.y <= slot_256_21_2 + slot_256_14_4

                        if slot_0_65_0 and slot_0_65_0.pressed and slot_256_22_2 and not slot_256_11_2.dragging then
                                slot_256_11_2.dragging = true
                                slot_256_11_2.offset_x = slot_0_65_0.x - slot_256_20_2
                                slot_256_11_2.offset_y = slot_0_65_0.y - slot_256_21_2
                        end

                        if slot_0_65_0 and slot_0_65_0.released then
                                slot_256_11_2.dragging = false
                        end

                        if slot_256_11_2.dragging and slot_0_65_0 then
                                slot_256_11_2.x = slot_0_65_0.x - slot_256_11_2.offset_x
                                slot_256_11_2.y = slot_0_65_0.y - slot_256_11_2.offset_y
                                slot_256_20_2 = slot_256_11_2.x
                                slot_256_21_2 = slot_256_11_2.y
                        end

                        slot_256_23_3 = slot_256_21_2
                        slot_256_24_2 = math.sin(slot_256_10_2 * 6) * 0.5 + 0.5

                        if hvh.hc_enable and hvh.hc_active then
                                slot_256_25_3 = slot_256_10_2 - (hvh.hc_fire_time or 0)
                                slot_256_26_3 = math.max(0, 2 - slot_256_25_3)
                                slot_256_27_1 = slot_256_20_2 + (slot_256_15_3 - slot_256_17_2.x) / 2
                                slot_256_28_1 = slot_256_23_3
                                slot_256_29_0 = slot_256_24_2 * 2

                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_27_1 - slot_256_29_0, slot_256_28_1 - slot_256_29_0, slot_256_16_3, draw.color(0, 100, 50, 100))
                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_27_1 + slot_256_29_0, slot_256_28_1 + slot_256_29_0, slot_256_16_3, draw.color(0, 100, 50, 100))
                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_27_1 + 1, slot_256_28_1 + 1, slot_256_16_3, draw.color(0, 0, 0, 180))
                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_27_1, slot_256_28_1, slot_256_16_3, draw.color(0, 200 + slot_256_24_2 * 55, 120, 255))

                                slot_256_30_1 = slot_256_28_1 + slot_256_17_2.y + 4
                                slot_256_31_1 = slot_256_15_3
                                slot_256_32_0 = 3
                                slot_256_33_0 = slot_256_26_3 / 2

                                slot_256_5_2:add_rect_filled(draw.rect(slot_256_20_2, slot_256_30_1, slot_256_20_2 + slot_256_31_1, slot_256_30_1 + slot_256_32_0), draw.color(0, 0, 0, 150))
                                slot_256_5_2:add_rect_filled(draw.rect(slot_256_20_2, slot_256_30_1, slot_256_20_2 + slot_256_31_1 * slot_256_33_0, slot_256_30_1 + slot_256_32_0), draw.color(0, 220, 120, 255))

                                slot_256_23_3 = slot_256_23_3 + slot_256_17_2.y + 6 + slot_256_13_4
                        end

                        if hvh.anti_miss_enable and hvh.anti_miss_count and hvh.anti_miss_count > 0 then
                                slot_256_25_2 = math.sin(slot_256_10_2 * 10) * 0.5 + 0.5
                                slot_256_26_2 = slot_256_20_2 + (slot_256_15_3 - slot_256_19_2.x) / 2
                                slot_256_27_0 = slot_256_23_3
                                slot_256_28_0 = slot_256_25_2 * 3

                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_26_2 - slot_256_28_0, slot_256_27_0 - slot_256_28_0, slot_256_18_2, draw.color(150, 0, 0, 120))
                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_26_2 + slot_256_28_0, slot_256_27_0 + slot_256_28_0, slot_256_18_2, draw.color(150, 0, 0, 120))
                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_26_2 + 1, slot_256_27_0 + 1, slot_256_18_2, draw.color(0, 0, 0, 180))
                                slot_0_58_0(slot_256_5_2, theme.fonts.mono, slot_256_26_2, slot_256_27_0, slot_256_18_2, draw.color(220 + slot_256_25_2 * 35, 80, 80, 255))
                        end
                end
        end

        if hvh.add_phase > 0 and slot_0_65_0.pressed and not slot_0_57_0(slot_0_76_0, slot_0_77_0, slot_0_78_0, slot_0_79_0, slot_256_0_0, slot_256_1_0) then
                slot_256_6_2 = entities.get_local_pawn()

                if slot_256_6_2 and slot_256_6_2:is_alive() then
                        slot_256_7_3 = slot_256_6_2:get_abs_origin()

                        if hvh.add_phase == 1 then
                                hvh.tmp_first = vector(slot_256_7_3.x, slot_256_7_3.y, slot_256_7_3.z)
                                hvh.add_phase = 2

                                if gui and gui.notify and gui.notification then
                                        gui.notify:add(gui.notification("Waypoints", "Fase 2: clique novamente (iremos salvar o par)."))
                                end
                        elseif hvh.add_phase == 2 then
                                slot_256_8_3 = vector(slot_256_7_3.x, slot_256_7_3.y, slot_256_7_3.z)
                                slot_256_9_4 = hvh.new_name or ""

                                slot_0_152_0(hvh.txt_path or slot_0_150_0(), slot_256_9_4, hvh.tmp_first, slot_256_8_3)
                                slot_0_151_0(hvh.txt_path or slot_0_150_0())

                                hvh.add_phase = 0
                                hvh.tmp_first = nil
                        end
                end
        end

        if slot_0_68_0 > 0.001 then
                slot_256_5_1 = draw.surface
                slot_256_6_1 = slot_0_55_0(slot_0_76_0 - 100, slot_0_76_0, slot_0_68_0)
                slot_256_7_2 = slot_0_65_0.pressed
                slot_256_8_2 = {
                        x = slot_256_6_1 + slot_0_80_0 + 40,
                        y = color_picker_target and (color_picker_target:find("^menu_") or color_picker_target:find("^hvh_")) and slot_0_77_0 + 220 or slot_0_77_0 + 110
                }
                slot_256_9_3 = {
                        h = 160,
                        w = 260
                }

                if slot_256_7_2 and color_picker_open then
                        if not slot_0_57_0(slot_256_8_2.x, slot_256_8_2.y, slot_256_9_3.w, slot_256_9_3.h, slot_256_0_0, slot_256_1_0) then
                                color_picker_open = false
                                active_control_id = nil
                        else
                                slot_256_7_2 = false
                        end
                end

                slot_256_10_1 = 50
                slot_256_11_1 = slot_0_57_0(slot_256_6_1, slot_0_77_0, slot_0_78_0, slot_256_10_1, slot_256_0_0, slot_256_1_0)

                if slot_256_7_2 and slot_0_68_0 > 0.9 and not color_picker_open and open_control_rect == nil then
                        slot_256_12_3 = 20
                        slot_256_13_3 = {
                                x = slot_256_6_1 + slot_0_78_0 - slot_256_12_3,
                                y = slot_0_77_0 + slot_0_79_0 - slot_256_12_3,
                                w = slot_256_12_3,
                                h = slot_256_12_3
                        }

                        if slot_0_57_0(slot_256_13_3.x, slot_256_13_3.y, slot_256_13_3.w, slot_256_13_3.h, slot_256_0_0, slot_256_1_0) then
                                resizing = true
                                resize_start_pos = {
                                        x = slot_256_0_0,
                                        y = slot_256_1_0
                                }
                                resize_start_size = {
                                        w = slot_0_78_0,
                                        h = slot_0_79_0
                                }
                        elseif active_control_id == nil and slot_256_11_1 then
                                dragging = true
                                drag_offset = {
                                        x = slot_256_0_0 - slot_0_76_0,
                                        y = slot_256_1_0 - slot_0_77_0
                                }
                        else
                                slot_256_14_3 = {
                                        h = 50,
                                        x = slot_256_6_1 + 10,
                                        y = slot_0_77_0 + slot_0_79_0 - 65,
                                        w = slot_0_80_0 - 20
                                }

                                if slot_0_57_0(slot_256_14_3.x, slot_256_14_3.y, slot_256_14_3.w, slot_256_14_3.h, slot_256_0_0, slot_256_1_0) then
                                        slot_0_83_0 = "Main"
                                elseif G.ui_funcs and G.ui_funcs.handle_nav_click then
                                        G.ui_funcs.handle_nav_click(slot_256_0_0, slot_256_1_0, slot_256_7_2, slot_256_6_1)
                                end
                        end
                end

                if slot_0_65_0.released then
                        dragging, resizing = false, false
                end

                if dragging then
                        slot_0_76_0, slot_0_77_0 = slot_256_0_0 - drag_offset.x, slot_256_1_0 - drag_offset.y
                end

                if resizing then
                        slot_256_12_2 = slot_256_0_0 - resize_start_pos.x
                        slot_256_13_2 = slot_256_1_0 - resize_start_pos.y
                        slot_256_14_2 = math.max(slot_0_74_0, slot_0_80_0 + (G.MIN_CONTENT_W or 380) + 2)
                        slot_0_78_0 = math.max(slot_256_14_2, math.min(slot_0_75_0, resize_start_size.w + slot_256_12_2))
                        slot_0_79_0 = math.max(slot_0_72_0, math.min(slot_0_73_0, resize_start_size.h + slot_256_13_2))
                end

                slot_256_12_1 = draw.rect(slot_256_6_1, slot_0_77_0, slot_256_6_1 + slot_0_78_0, slot_0_77_0 + slot_0_79_0)
                slot_256_13_1 = slot_0_68_0
                slot_256_14_1 = slot_0_68_0 * slot_0_86_0.transparency

                if slot_0_86_0.blur_enable then
                        slot_256_5_1:add_shadow_rect(slot_256_12_1, 25, true, 0.5 * slot_0_68_0)

                        slot_256_15_2 = draw.shaders.blur_f

                        if slot_256_15_2 then
                                slot_256_16_2 = draw.adapter:get_back_buffer()

                                slot_256_5_1.g:set_shader(slot_256_15_2)

                                slot_256_5_1.g.texture = slot_256_16_2

                                slot_256_5_1:add_rect_filled(slot_256_12_1, draw.color(255, 255, 255, 255 * slot_256_14_1))
                                slot_256_5_1.g:set_shader(nil)

                                slot_256_5_1.g.texture = nil
                        end
                end

                slot_256_15_1 = 1 - slot_0_86_0.transparency

                slot_256_5_1:add_rect_filled_rounded(slot_256_12_1, draw.color(10, 11, 14, 230 * slot_256_15_1 * slot_0_68_0), slot_0_81_0)
                slot_256_5_1:override_clip_rect(slot_256_12_1, true)

                slot_256_16_1 = theme.colors.accent:mod_a(0.12 * slot_256_14_1)
                slot_256_17_1 = theme.colors.accent:mod_a(0)

                slot_256_5_1:add_circle_filled_multicolor(draw.vec2(slot_0_65_0.x, slot_0_65_0.y), 350, {
                        slot_256_16_1,
                        slot_256_17_1
                })
                slot_256_5_1:override_clip_rect(nil)
                slot_256_5_1:add_rect_filled_rounded(slot_256_12_1, theme.colors.border_outer:mod_a(slot_256_13_1), slot_0_81_0)

                slot_256_18_1 = slot_256_6_1 + 1
                slot_256_19_1 = slot_0_77_0 + 1
                slot_256_20_1 = slot_0_78_0 - 2
                slot_256_21_1 = slot_0_79_0 - 2
                open_control_rect = nil
                deferred = {}

                if G.ui_funcs and G.ui_funcs.draw_sidebar then
                        G.ui_funcs.draw_sidebar(slot_256_5_1, slot_256_18_1, slot_256_19_1, slot_0_80_0, slot_256_21_1, slot_256_0_0, slot_256_1_0, slot_256_14_1, slot_256_13_1)
                end

                slot_256_22_1 = slot_256_7_2

                if open_control_rect_prev and slot_256_7_2 then
                        slot_256_23_2 = open_control_rect_prev

                        if not slot_0_57_0(slot_256_23_2.x, slot_256_23_2.y, slot_256_23_2.w, slot_256_23_2.h, slot_256_0_0, slot_256_1_0) then
                                slot_256_22_1 = false
                        end
                end

                slot_256_23_1 = slot_256_22_1

                if color_picker_open then
                        slot_256_23_1 = false
                end

                slot_0_168_0(slot_256_5_1, slot_256_18_1 + slot_0_80_0, slot_256_19_1, slot_256_20_1 - slot_0_80_0, slot_256_21_1, slot_256_14_1, slot_256_13_1, slot_0_83_0, slot_256_0_0, slot_256_1_0, slot_256_23_1)

                slot_256_24_1 = theme.colors.border_inner
                slot_256_25_1 = slot_256_24_1:mod_a(0)
                slot_256_26_1 = slot_256_24_1:mod_a(slot_256_13_1)

                slot_256_5_1:add_rect_filled_multicolor(draw.rect(slot_256_18_1 + slot_0_80_0, slot_256_19_1, slot_256_18_1 + slot_0_80_0 + 1, slot_256_19_1 + slot_256_21_1), {
                        slot_256_25_1,
                        slot_256_25_1,
                        slot_256_26_1,
                        slot_256_26_1
                })

                for iter_256_2, iter_256_3 in ipairs(deferred) do
                        iter_256_3()
                end

                open_control_rect_prev = open_control_rect
                deferred = {}

                if color_picker_open and G.ui_funcs and G.ui_funcs.draw_color_picker then
                        G.ui_funcs.draw_color_picker(slot_256_5_1, slot_256_8_2.x, slot_256_8_2.y, slot_256_9_3.w, slot_256_9_3.h, slot_256_0_0, slot_256_1_0, slot_256_13_1, _color_picker_original_click or false)
                end
        end

        if game.engine:in_game() then
                slot_0_158_0()
                slot_0_159_0()

                if G and G._miniui_draw then
                        G._miniui_draw()
                end

                if G.draw_tracers then
                        G.draw_tracers()
                end

                if G.update_antiafk then
                        G.update_antiafk()
                end

                slot_0_23_0()
                slot_0_20_0()
                slot_0_21_0()
        end

        slot_0_109_0()

        if menu_open then
                game.engine:client_cmd("-attack")
                game.engine:client_cmd("-attack2")
        end

        if open_control_rect and slot_0_65_0.pressed then
                slot_0_65_0.pressed = false
        end

        scroll_this_frame = 0
        slot_256_5_0 = ant.__was_in_game or false
        slot_256_6_0 = game.engine:in_game()
        ant.__was_in_game = slot_256_6_0

        if slot_256_6_0 and not slot_256_5_0 then
                ant.is_currently_active = nil
        end

        if not slot_256_6_0 and slot_256_5_0 and hvh then
                hvh.hc_active = false
                hvh.hc_fire_time = nil
        end

        if ant and slot_0_178_0 and slot_0_180_0 and slot_0_181_0 and slot_0_182_0 and not slot_0_0_0.active then
                slot_0_180_0()

                slot_256_7_1 = false
                slot_256_8_1 = game.global_vars.real_time

                if ant.master_mode_index == 2 then
                        slot_256_7_1 = true
                elseif ant.master_mode_index == 3 then
                        if not ant.mode_index or ant.mode_index < 1 or ant.mode_index > #ant.mode_names then
                                ant.mode_index = 1
                        end

                        slot_256_9_2 = ant.mode_names[ant.mode_index]

                        if slot_256_9_2 then
                                slot_256_7_1 = ant.activation_states[slot_256_9_2] == true
                        else
                                slot_256_7_1 = false
                        end
                end

                if slot_256_7_1 ~= ant.is_currently_active then
                        ant.is_currently_active = slot_256_7_1

                        if gui and gui.ctx then
                                slot_256_9_1 = slot_0_178_0()

                                if slot_256_9_1 then
                                        slot_256_9_1:set_value(slot_256_7_1)
                                end
                        end
                end

                if ant.is_currently_active then
                        slot_0_181_0()
                end

                slot_0_182_0()
        end

        if menu_open and (slot_0_87_0.show_load_confirm or slot_0_87_0.show_update_confirm or slot_0_87_0.show_delete_confirm or slot_0_87_0.show_save_confirm) then
                slot_256_7_0 = draw.surface
                slot_256_8_0, slot_256_9_0 = game.engine:get_screen_size()
                slot_256_10_0 = 320
                slot_256_11_0 = 160
                slot_256_12_0 = (slot_256_8_0 - slot_256_10_0) / 2
                slot_256_13_0 = (slot_256_9_0 - slot_256_11_0) / 2
                slot_256_14_0 = slot_0_65_0.pressed

                if slot_256_14_0 then
                        slot_0_65_0.pressed = false
                end

                slot_256_15_0 = draw.rect(0, 0, slot_256_8_0, slot_256_9_0)

                slot_256_7_0:add_rect_filled(slot_256_15_0, draw.color(0, 0, 0, 120))

                slot_256_16_0 = draw.rect(slot_256_12_0, slot_256_13_0, slot_256_12_0 + slot_256_10_0, slot_256_13_0 + slot_256_11_0)
                slot_256_17_0 = 8
                slot_256_18_0 = 1 - slot_0_86_0.transparency

                slot_256_7_0:add_rect_filled_rounded(slot_256_16_0, draw.color(10, 11, 14, 230 * slot_256_18_0 * slot_0_68_0), slot_256_17_0)
                slot_256_7_0:add_rect_filled_rounded(slot_256_16_0, theme.colors.border_outer:mod_a(slot_0_68_0), slot_256_17_0)

                slot_256_19_0 = draw.rect(slot_256_12_0 + 1, slot_256_13_0 + 1, slot_256_12_0 + slot_256_10_0 - 1, slot_256_13_0 + slot_256_11_0 - 1)

                slot_256_7_0:add_rect_filled_rounded(slot_256_19_0, theme.colors.border_inner:mod_a(slot_0_68_0 * 0.5), slot_256_17_0 - 1)

                slot_256_20_0 = theme.colors.accent:mod_a(0.08 * slot_0_68_0)
                slot_256_21_0 = theme.colors.accent:mod_a(0)

                slot_256_7_0:add_circle_filled_multicolor(draw.vec2(slot_256_12_0 + slot_256_10_0 / 2, slot_256_13_0 + slot_256_11_0 / 2), 200, {
                        slot_256_20_0,
                        slot_256_21_0
                })

                slot_256_22_0 = slot_0_68_0
                slot_256_23_0 = slot_256_13_0 + slot_256_11_0 - 50
                slot_256_24_0 = slot_256_13_0 + 35
                slot_256_25_0 = slot_0_65_0.x
                slot_256_26_0 = slot_0_65_0.y

                if slot_0_87_0.show_load_confirm then
                        slot_0_58_0(slot_256_7_0, theme.fonts.category, slot_256_12_0 + slot_256_10_0 / 2 - 60, slot_256_24_0, slot_0_63_0("config_load") .. " '" .. slot_0_87_0.confirm_config_name .. "'?", theme.colors.text_light:mod_a(slot_256_22_0))

                        if slot_0_124_0(slot_256_7_0, "load_yes_popup", slot_256_12_0 + 60, slot_256_23_0, 80, 28, slot_0_63_0("confirm_yes"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                load_config(slot_0_87_0.confirm_config_name)

                                slot_0_87_0.show_load_confirm = false
                        end

                        if slot_0_124_0(slot_256_7_0, "load_cancel_popup", slot_256_12_0 + slot_256_10_0 - 140, slot_256_23_0, 80, 28, slot_0_63_0("confirm_cancel"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                slot_0_87_0.show_load_confirm = false
                        end
                elseif slot_0_87_0.show_update_confirm then
                        slot_0_58_0(slot_256_7_0, theme.fonts.category, slot_256_12_0 + slot_256_10_0 / 2 - 65, slot_256_24_0, slot_0_63_0("config_update") .. " '" .. slot_0_87_0.confirm_config_name .. "'?", theme.colors.text_light:mod_a(slot_256_22_0))

                        if slot_0_124_0(slot_256_7_0, "update_yes_popup", slot_256_12_0 + 60, slot_256_23_0, 80, 28, slot_0_63_0("confirm_yes"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                save_config(slot_0_87_0.confirm_config_name, true)

                                slot_0_87_0.show_update_confirm = false
                        end

                        if slot_0_124_0(slot_256_7_0, "update_cancel_popup", slot_256_12_0 + slot_256_10_0 - 140, slot_256_23_0, 80, 28, slot_0_63_0("confirm_cancel"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                slot_0_87_0.show_update_confirm = false
                        end
                elseif slot_0_87_0.show_delete_confirm then
                        slot_0_58_0(slot_256_7_0, theme.fonts.category, slot_256_12_0 + slot_256_10_0 / 2 - 65, slot_256_24_0, slot_0_63_0("config_delete") .. " '" .. slot_0_87_0.confirm_config_name .. "'?", theme.colors.text_light:mod_a(slot_256_22_0))

                        if slot_0_124_0(slot_256_7_0, "delete_yes_popup", slot_256_12_0 + 60, slot_256_23_0, 80, 28, slot_0_63_0("confirm_yes"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                delete_config(slot_0_87_0.confirm_config_name)

                                slot_0_87_0.show_delete_confirm = false
                        end

                        if slot_0_124_0(slot_256_7_0, "delete_cancel_popup", slot_256_12_0 + slot_256_10_0 - 140, slot_256_23_0, 80, 28, slot_0_63_0("confirm_cancel"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                slot_0_87_0.show_delete_confirm = false
                        end
                elseif slot_0_87_0.show_save_confirm then
                        slot_0_58_0(slot_256_7_0, theme.fonts.category, slot_256_12_0 + slot_256_10_0 / 2 - 60, slot_256_24_0, slot_0_63_0("config_save") .. " '" .. slot_0_87_0.config_name_input .. "'?", theme.colors.text_light:mod_a(slot_256_22_0))

                        if slot_0_124_0(slot_256_7_0, "save_yes_popup", slot_256_12_0 + 60, slot_256_23_0, 80, 28, slot_0_63_0("confirm_yes"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                save_config(slot_0_87_0.config_name_input)

                                slot_0_87_0.config_name_input = ""
                                slot_0_87_0.show_save_confirm = false
                        end

                        if slot_0_124_0(slot_256_7_0, "save_cancel_popup", slot_256_12_0 + slot_256_10_0 - 140, slot_256_23_0, 80, 28, slot_0_63_0("confirm_cancel"), slot_256_25_0, slot_256_26_0, slot_256_14_0, slot_256_22_0) then
                                slot_0_87_0.show_save_confirm = false
                        end
                end
        end

        if G and G._miniui_draw then
                G._miniui_draw()
        end
end)

function __ks_read_file_ffi(arg_257_0)
        local var_257_0 = slot_0_37_0 and slot_0_37_0(arg_257_0, "rb")

        if var_257_0 == nil then
                return nil, "open fail: " .. tostring(arg_257_0)
        end

        slot_0_39_0(var_257_0, 0, slot_0_52_0)

        local var_257_1 = slot_0_40_0(var_257_0)

        slot_0_39_0(var_257_0, 0, slot_0_51_0)

        if var_257_1 <= 0 then
                slot_0_38_0(var_257_0)

                return ""
        end

        local var_257_2 = ffi.new("char[?]", var_257_1 + 1)
        local var_257_3 = slot_0_41_0(var_257_2, 1, var_257_1, var_257_0)

        slot_0_38_0(var_257_0)

        if var_257_3 ~= var_257_1 then
                return nil, "read mismatch"
        end

        var_257_2[var_257_1] = 0

        return ffi.string(var_257_2, var_257_1)
end

function __ks_default_path()
        local var_258_0 = ffi.new("char[?]", 520)

        slot_0_34_0(nil, var_258_0, 520)

        return (ffi.string(var_258_0):gsub("[^\\/]+$", ""):gsub("[^\\/]+[\\/]$", ""):gsub("[^\\/]+[\\/]$", "") .. "csgo\\fatality\\scripts\\") .. "killsay.txt"
end

function __ks_open_location(arg_259_0)
        local var_259_0 = arg_259_0:match("^(.*[\\/])")

        if var_259_0 then
                slot_0_36_0(nil, "open", var_259_0, nil, nil, 1)
        end
end

function __ks_shuffle(arg_260_0)
        for iter_260_0 = #arg_260_0, 2, -1 do
                local var_260_0 = math.random(iter_260_0)

                arg_260_0[iter_260_0], arg_260_0[var_260_0] = arg_260_0[var_260_0], arg_260_0[iter_260_0]
        end
end

function __ks_parse(arg_261_0)
        if arg_261_0:sub(1, 3) == "﻿" then
                arg_261_0 = arg_261_0:sub(4)
        end

        local var_261_0 = {}
        local var_261_1 = {}
        local var_261_2 = {}
        local var_261_3

        for iter_261_0 in arg_261_0:gmatch("([^\r\n]+)") do
                iter_261_0 = iter_261_0:match("^%s*(.-)%s*$")

                if iter_261_0:upper() == "[ENG]" then
                        var_261_3 = var_261_0
                elseif iter_261_0:upper() == "[BR]" then
                        var_261_3 = var_261_1
                elseif iter_261_0:upper() == "[RU]" then
                        var_261_3 = var_261_2
                elseif iter_261_0:match("^%[.+%]$") then
                        var_261_3 = nil
                elseif var_261_3 and iter_261_0 ~= "" then
                        table.insert(var_261_3, iter_261_0)
                end
        end

        return var_261_0, var_261_1, var_261_2
end

function __ks_load_file(arg_262_0)
        local var_262_0, var_262_1 = __ks_read_file_ffi(arg_262_0)

        if not var_262_0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Killsay", "Falha ao abrir: " .. tostring(var_262_1)))
                end

                return false
        end

        local var_262_2, var_262_3, var_262_4 = __ks_parse(var_262_0)

        if #var_262_2 + #var_262_3 + #var_262_4 == 0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Killsay", "Arquivo sem frases válidas."))
                end

                return false
        end

        slot_0_89_0.messagesENG, slot_0_89_0.messagesBR, slot_0_89_0.messagesRU = var_262_2, var_262_3, var_262_4
        slot_0_89_0.decks = {
                ENG = {},
                BR = {},
                RU = {}
        }
        slot_0_89_0.txt_path = arg_262_0

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Killsay", "TXT carregado (" .. tostring(#var_262_2 + #var_262_3 + #var_262_4) .. " frases)"))
        end

        return true
end

function __ks_get_deck_pool(arg_263_0)
        if arg_263_0 == "ENG" then
                return slot_0_89_0.decks.ENG, slot_0_89_0.messagesENG
        end

        if arg_263_0 == "BR" then
                return slot_0_89_0.decks.BR, slot_0_89_0.messagesBR
        end

        if arg_263_0 == "RU" then
                return slot_0_89_0.decks.RU, slot_0_89_0.messagesRU
        end

        return {}, {}
end

function __ks_take_from_deck(arg_264_0, arg_264_1)
        if #arg_264_1 == 0 then
                return nil
        end

        if #arg_264_0 == 0 then
                for iter_264_0 = 1, #arg_264_1 do
                        arg_264_0[iter_264_0] = arg_264_1[iter_264_0]
                end

                __ks_shuffle(arg_264_0)
        end

        return table.remove(arg_264_0, 1)
end

function __ks_pick_lang()
        local var_265_0 = {}

        if slot_0_89_0.langs.ENG and #slot_0_89_0.messagesENG > 0 then
                table.insert(var_265_0, "ENG")
        end

        if slot_0_89_0.langs.BR and #slot_0_89_0.messagesBR > 0 then
                table.insert(var_265_0, "BR")
        end

        if slot_0_89_0.langs.RU and #slot_0_89_0.messagesRU > 0 then
                table.insert(var_265_0, "RU")
        end

        if #var_265_0 == 0 then
                if #slot_0_89_0.messagesENG > 0 then
                        return "ENG"
                end

                if #slot_0_89_0.messagesBR > 0 then
                        return "BR"
                end

                if #slot_0_89_0.messagesRU > 0 then
                        return "RU"
                end
        end

        return #var_265_0 > 0 and var_265_0[math.random(1, #var_265_0)] or "ENG"
end

function __ks_say_msg(arg_266_0)
        if not arg_266_0 or arg_266_0 == "" then
                return
        end

        game.engine:client_cmd("say " .. tostring(arg_266_0):gsub("\"", "'"):gsub("[\r\n]", " "))
end

function __ks_send()
        if game.global_vars.real_time - slot_0_89_0.last_sent < slot_0_89_0.cooldown then
                return
        end

        slot_0_89_0.last_sent = game.global_vars.real_time

        local var_267_0 = __ks_pick_lang()
        local var_267_1, var_267_2 = __ks_get_deck_pool(var_267_0)

        if slot_0_89_0.src_index == 2 and slot_0_89_0.txt_path ~= "" and #var_267_2 == 0 then
                slot_0_89_0.src_index = 1
                var_267_1, var_267_2 = __ks_get_deck_pool(__ks_pick_lang())
        end

        local var_267_3 = __ks_take_from_deck(var_267_1, var_267_2)

        if not var_267_3 then
                local var_267_4, var_267_5 = __ks_get_deck_pool("ENG")

                var_267_3 = __ks_take_from_deck(var_267_4, var_267_5)
        end

        __ks_say_msg(var_267_3)
end

__ks_theme = {
        colors = {
                accent = draw.color(130, 90, 255),
                item_idle = draw.color(38, 40, 48),
                item_hover = draw.color(48, 50, 60),
                border = draw.color(50, 52, 64),
                text_light = draw.color(220, 220, 230),
                text_normal = draw.color(180, 180, 190),
                text_dark = draw.color(120, 120, 130),
                bg_frame = draw.color(18, 19, 24),
                bg_card = draw.color(28, 29, 36),
                accent_dark = draw.color(100, 70, 225),
                accent_light = draw.color(160, 120, 255),
                text_title = draw.color(255, 255, 255),
                success = draw.color(80, 220, 150)
        },
        fonts = {
                text = draw.font_gdi("Segoe UI", 13, 0)
        }
}

for iter_0_12, iter_0_13 in pairs(__ks_theme.fonts) do
        if iter_0_13 and iter_0_13.create then
                iter_0_13:create()
        end
end

__ks_ui_state = {
        active_slider = nil,
        combo_open_id = nil
}

function __ks_measure_text(arg_268_0, arg_268_1)
        if not arg_268_1 then
                return 0
        end

        return arg_268_1:get_text_size(tostring(arg_268_0)).x
end

function __ks_mouse_in2(arg_269_0, arg_269_1, arg_269_2, arg_269_3, arg_269_4, arg_269_5)
        return arg_269_0 <= arg_269_4 and arg_269_4 <= arg_269_0 + arg_269_2 and arg_269_1 <= arg_269_5 and arg_269_5 <= arg_269_1 + arg_269_3
end

function __ks_ui_checkbox2(arg_270_0, arg_270_1, arg_270_2, arg_270_3, arg_270_4, arg_270_5, arg_270_6, arg_270_7, arg_270_8)
        local var_270_0 = 18
        local var_270_1 = __ks_mouse_in2(arg_270_2, arg_270_3, var_270_0, var_270_0, arg_270_6, arg_270_7)

        arg_270_0:add_rect_filled_rounded(draw.rect(arg_270_2, arg_270_3, arg_270_2 + var_270_0, arg_270_3 + var_270_0), var_270_1 and __ks_theme.colors.item_hover or __ks_theme.colors.item_idle, 4)
        arg_270_0:add_rect_rounded(draw.rect(arg_270_2, arg_270_3, arg_270_2 + var_270_0, arg_270_3 + var_270_0), __ks_theme.colors.border, 4)

        if arg_270_5 then
                arg_270_0:add_rect_filled_rounded(draw.rect(arg_270_2 + 4, arg_270_3 + 4, arg_270_2 + var_270_0 - 4, arg_270_3 + var_270_0 - 4), __ks_theme.colors.success, 2)
        end

        arg_270_0.font = __ks_theme.fonts.text

        arg_270_0:add_text(draw.vec2(arg_270_2 + var_270_0 + 10, arg_270_3 - 1), arg_270_4, arg_270_5 and __ks_theme.colors.text_light or __ks_theme.colors.text_normal)

        if var_270_1 and arg_270_8 then
                return not arg_270_5
        end

        return arg_270_5
end

function __ks_ui_combo2(arg_271_0, arg_271_1, arg_271_2, arg_271_3, arg_271_4, arg_271_5, arg_271_6, arg_271_7, arg_271_8, arg_271_9, arg_271_10)
        local var_271_0 = 28

        arg_271_0.font = __ks_theme.fonts.text

        arg_271_0:add_text(draw.vec2(arg_271_2, arg_271_3), arg_271_5, __ks_theme.colors.text_normal)

        local var_271_1 = arg_271_3 + 20
        local var_271_2 = __ks_ui_state.combo_open_id == arg_271_1
        local var_271_3 = __ks_mouse_in2(arg_271_2, var_271_1, arg_271_4, var_271_0, arg_271_8, arg_271_9)

        arg_271_0:add_rect_filled_rounded(draw.rect(arg_271_2, var_271_1, arg_271_2 + arg_271_4, var_271_1 + var_271_0), (var_271_2 or var_271_3) and __ks_theme.colors.item_hover or __ks_theme.colors.item_idle, 6)
        arg_271_0:add_rect_rounded(draw.rect(arg_271_2, var_271_1, arg_271_2 + arg_271_4, var_271_1 + var_271_0), __ks_theme.colors.border, 6)

        arg_271_0.font = __ks_theme.fonts.text

        arg_271_0:add_text(draw.vec2(arg_271_2 + 12, var_271_1 + 5), arg_271_6[arg_271_7] or "...", __ks_theme.colors.text_light)

        local var_271_4 = arg_271_2 + arg_271_4 - 18
        local var_271_5 = var_271_1 + var_271_0 / 2

        arg_271_0:add_line(draw.vec2(var_271_4, var_271_5 - 2), draw.vec2(var_271_4 + 4, var_271_5 + 2), __ks_theme.colors.text_dark, 1.5)
        arg_271_0:add_line(draw.vec2(var_271_4 + 4, var_271_5 + 2), draw.vec2(var_271_4 + 8, var_271_5 - 2), __ks_theme.colors.text_dark, 1.5)

        if var_271_3 and arg_271_10 then
                local var_271_6 = __ks_ui_state

                if var_271_2 then
                        -- block empty
                end

                var_271_6.combo_open_id = arg_271_1
        end

        if __ks_ui_state.combo_open_id == arg_271_1 then
                defer(function()
                        local var_272_0 = 24
                        local var_272_1 = var_272_0 * #arg_271_6 + 12
                        local var_272_2 = var_271_1 + var_271_0 + 4

                        arg_271_0:add_rect_filled_rounded(draw.rect(arg_271_2, var_272_2, arg_271_2 + arg_271_4, var_272_2 + var_272_1), __ks_theme.colors.bg_card, 6)
                        arg_271_0:add_rect_rounded(draw.rect(arg_271_2, var_272_2, arg_271_2 + arg_271_4, var_272_2 + var_272_1), __ks_theme.colors.border, 6)

                        for iter_272_0, iter_272_1 in ipairs(arg_271_6) do
                                local var_272_3 = var_272_2 + 6 + (iter_272_0 - 1) * var_272_0
                                local var_272_4 = __ks_mouse_in2(arg_271_2 + 4, var_272_3, arg_271_4 - 8, var_272_0, slot_0_65_0.x, slot_0_65_0.y)

                                if var_272_4 then
                                        arg_271_0:add_rect_filled_rounded(draw.rect(arg_271_2 + 4, var_272_3, arg_271_2 + arg_271_4 - 4, var_272_3 + var_272_0), __ks_theme.colors.item_hover, 4)
                                end

                                arg_271_0.font = __ks_theme.fonts.text

                                arg_271_0:add_text(draw.vec2(arg_271_2 + 12, var_272_3 + 3), iter_272_1, (iter_272_0 == arg_271_7 or var_272_4) and __ks_theme.colors.text_light or __ks_theme.colors.text_normal)

                                if var_272_4 and slot_0_65_0.pressed then
                                        arg_271_7 = iter_272_0
                                        slot_0_89_0.src_index = iter_272_0
                                        __ks_ui_state.combo_open_id = nil
                                end
                        end

                        if slot_0_65_0.pressed and not __ks_mouse_in2(arg_271_2, var_272_2, arg_271_4, var_272_1, slot_0_65_0.x, slot_0_65_0.y) and not __ks_mouse_in2(arg_271_2, var_271_1, arg_271_4, var_271_0, slot_0_65_0.x, slot_0_65_0.y) then
                                __ks_ui_state.combo_open_id = nil
                        end
                end)
        end

        return arg_271_7
end

function __ks_ui_button2(arg_273_0, arg_273_1, arg_273_2, arg_273_3, arg_273_4, arg_273_5, arg_273_6, arg_273_7)
        local var_273_0 = 28
        local var_273_1 = 24
        local var_273_2 = __ks_measure_text(arg_273_4, __ks_theme.fonts.text)
        local var_273_3 = var_273_2 + var_273_1
        local var_273_4 = __ks_mouse_in2(arg_273_2, arg_273_3, var_273_3, var_273_0, arg_273_5, arg_273_6)
        local var_273_5 = var_273_4 and __ks_theme.colors.accent_dark or __ks_theme.colors.accent

        arg_273_0:add_rect_filled_rounded(draw.rect(arg_273_2, arg_273_3, arg_273_2 + var_273_3, arg_273_3 + var_273_0), var_273_5, 6)

        if var_273_4 then
                arg_273_0:add_rect_rounded(draw.rect(arg_273_2, arg_273_3, arg_273_2 + var_273_3, arg_273_3 + var_273_0), __ks_theme.colors.accent_light, 6)
        end

        arg_273_0.font = __ks_theme.fonts.text

        arg_273_0:add_text(draw.vec2(arg_273_2 + (var_273_3 - var_273_2) / 2, arg_273_3 + 6), arg_273_4, __ks_theme.colors.text_title)

        return var_273_4 and arg_273_7
end

function __ks_draw_inline(arg_274_0, arg_274_1, arg_274_2, arg_274_3, arg_274_4, arg_274_5, arg_274_6, arg_274_7)
        local var_274_0 = arg_274_1
        local var_274_1 = arg_274_2
        local var_274_2 = arg_274_3

        slot_0_89_0.enable = __ks_ui_checkbox2(arg_274_0, "ks_enable_inline", var_274_0, var_274_1, slot_0_63_0("ks_enable"), slot_0_89_0.enable, arg_274_5, arg_274_6, arg_274_7)

        local var_274_3 = var_274_1 + 30

        slot_0_89_0.src_index = __ks_ui_combo2(arg_274_0, "ks_src_inline", var_274_0, var_274_3, var_274_2, slot_0_63_0("ks_source"), slot_0_63_0("ks_source_options"), slot_0_89_0.src_index, arg_274_5, arg_274_6, arg_274_7)

        local var_274_4 = var_274_3 + 55 + 10

        slot_0_89_0.langs.ENG = __ks_ui_checkbox2(arg_274_0, "ks_lang_eng_inline", var_274_0, var_274_4, slot_0_63_0("ks_lang_en"), slot_0_89_0.langs.ENG, arg_274_5, arg_274_6, arg_274_7)

        local var_274_5 = var_274_4 + 30

        slot_0_89_0.langs.BR = __ks_ui_checkbox2(arg_274_0, "ks_lang_br_inline", var_274_0, var_274_5, slot_0_63_0("ks_lang_br"), slot_0_89_0.langs.BR, arg_274_5, arg_274_6, arg_274_7)

        local var_274_6 = var_274_5 + 30

        slot_0_89_0.langs.RU = __ks_ui_checkbox2(arg_274_0, "ks_lang_ru_inline", var_274_0, var_274_6, slot_0_63_0("ks_lang_ru"), slot_0_89_0.langs.RU, arg_274_5, arg_274_6, arg_274_7)

        local var_274_7 = var_274_6 + 40

        if slot_0_89_0.src_index == 2 then
                if __ks_ui_button2(arg_274_0, "ks_load_inline", var_274_0, var_274_7, slot_0_63_0("ks_load_file"), arg_274_5, arg_274_6, arg_274_7) then
                        __ks_load_file(__ks_default_path())
                end

                if __ks_ui_button2(arg_274_0, "ks_open_inline", var_274_0 + 200, var_274_7, slot_0_63_0("ks_open_folder"), arg_274_5, arg_274_6, arg_274_7) then
                        __ks_open_location(__ks_default_path())
                end
        end
end

if not __tks_hooked then
        __tks_hooked = true

        events.event:add(function(arg_275_0)
                if not arg_275_0 then
                        return
                end

                local var_275_0 = arg_275_0:get_name()

                if var_275_0 == "game_newmap" then
                        last_home_toggle = 0
                        G.fps_history = {}
                        G.ping_history = {}

                        if hvh and hvh.velocity_history then
                                hvh.velocity_history = {}
                        end

                        hvh.velocity_peak_speed = 0
                        hvh.velocity_peak_time = 0
                        hvh.velocity_total_distance = 0
                        hvh.velocity_avg_speed = 0
                        hvh.velocity_avg_samples = 0

                        if G and G.hitlogs and G.hitlogs.data then
                                G.hitlogs.data = {}
                        end

                        if slot_0_87_0 then
                                slot_0_87_0.wm_fps_last_update = nil
                                slot_0_87_0.wm_cached_fps = nil
                                slot_0_87_0.wm_cached_ping = nil
                                hvh.velocity_total_distance = 0
                                hvh.velocity_avg_speed = 0
                                hvh.velocity_avg_samples = 0

                                if G and G.hitlogs and G.hitlogs.data then
                                        G.hitlogs.data = {}
                                end

                                if slot_0_88_0 then
                                        slot_0_88_0.last_sent_time = 0
                                        slot_0_88_0.current_index = 1
                                end

                                if ant then
                                        ant.last_state = nil
                                end

                                if slot_0_87_0 then
                                        slot_0_87_0.wm_fps_last_update = nil
                                        slot_0_87_0.wm_cached_fps = nil
                                        slot_0_87_0.wm_cached_ping = nil
                                end
                        end
                end

                if var_275_0 == "round_start" then
                        if hvh then
                                hvh.hc_active = false
                                hvh.hc_fire_time = nil
                        end

                        slot_0_89_0.decks = {
                                ENG = {},
                                BR = {}
                        }

                        if game and game.global_vars then
                                if hvh and hvh.velocity_history then
                                        hvh.velocity_history = {}
                                end

                                hvh.velocity_peak_speed = 0
                                hvh.velocity_peak_time = 0
                                hvh.velocity_total_distance = 0
                                hvh.velocity_avg_speed = 0
                                hvh.velocity_avg_samples = 0

                                if G and G.hitlogs and G.hitlogs.data then
                                        G.hitlogs.data = {}
                                end

                                if slot_0_87_0 then
                                        slot_0_87_0.wm_fps_last_update = nil
                                        slot_0_87_0.wm_cached_fps = nil
                                        slot_0_87_0.wm_cached_ping = nil
                                end
                        end
                end

                if slot_0_89_0.enable and var_275_0 == "player_death" then
                        local var_275_1 = arg_275_0:get_controller("attacker")

                        if var_275_1 then
                                local var_275_2 = var_275_1:get_pawn()
                                local var_275_3 = entities.get_local_pawn()

                                if var_275_2 and var_275_3 and var_275_2 == var_275_3 then
                                        __ks_send()
                                end
                        end
                end
        end)
        mods.events:add_listener("player_death")
        mods.events:add_listener("round_start")
        mods.events:add_listener("game_newmap")
end

if not TUEURS_KILLSAY then
        TUEURS_KILLSAY = {}
end

TUEURS_KILLSAY.draw_inline = __ks_draw_inline

if slot_0_82_0 then
        slot_0_183_1 = 0

        for iter_0_14, iter_0_15 in ipairs(slot_0_82_0) do
                if iter_0_15.id == "Waypoints" then
                        slot_0_183_1 = iter_0_14

                        break
                end
        end

        slot_0_184_1 = {
                parent = "HVH",
                label_key = "nav_antiaim",
                icon = "•",
                hover_alpha = 0,
                id = "Anti-Aim"
        }

        if slot_0_183_1 > 0 then
                table.insert(slot_0_82_0, slot_0_183_1 + 1, slot_0_184_1)
        else
                table.insert(slot_0_82_0, slot_0_184_1)
        end
end

if slot_0_61_0 then
        slot_0_61_0.nav_antiaim = {
                ["PT-BR"] = "Anti-Aim",
                EN = "Anti-Aim"
        }
end

function slot_0_183_0()
        slot_0_177_0()

        local var_276_0 = {
                version = "TUEURS_AA_MODES_V2",
                modes = ant.modes,
                master_mode_index = ant.master_mode_index,
                activation_states = ant.activation_states,
                spin_on_states = ant.spin_on_states,
                exploit_on_states = ant.exploit_on_states,
                lock_mode_to_stand = ant.lock_mode_to_stand,
                indicators = ant.indicators,
                mode_names = ant.mode_names
        }
        local var_276_1 = slot_0_102_0(var_276_0)

        if not var_276_1 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Export Error", "Falha ao codificar AA para JSON.", nil, 4))
                end

                return
        end

        utils.clipboard_set(var_276_1)

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Export", "Configurações de AA exportadas!", nil, 4))
        end
end

function slot_0_184_0()
        slot_277_0_0 = utils.clipboard_get()

        if not slot_277_0_0 or slot_277_0_0 == "" then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Import Error", "Área de transferência vazia.", nil, 4))
                end

                return
        end

        slot_277_1_0, slot_277_2_0 = slot_0_103_0(slot_277_0_0)

        if not slot_277_1_0 or slot_277_2_0 then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Import Error", "Formato de AA inválido (não é JSON).", nil, 4))
                end

                return
        end

        if not slot_277_1_0.modes or type(slot_277_1_0.modes) ~= "table" then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Import Error", "Preset de AA sem modos.", nil, 4))
                end

                return
        end

        slot_277_3_0 = tostring(slot_277_1_0.version or "")

        if slot_277_3_0 ~= "TUEURS_AA_MODES_V1" and slot_277_3_0 ~= "TUEURS_AA_MODES_V2" then
                if gui and gui.notify and gui.notification then
                        gui.notify:add(gui.notification("Import Error", "Versão do preset de AA incompatível.", nil, 4))
                end

                return
        end

        for iter_277_0, iter_277_1 in ipairs(slot_277_1_0.modes) do
                if ant.modes[iter_277_0] and type(iter_277_1) == "table" then
                        for iter_277_2, iter_277_3 in pairs(iter_277_1) do
                                ant.modes[iter_277_0][iter_277_2] = iter_277_3
                        end
                end
        end

        if slot_277_3_0 == "TUEURS_AA_MODES_V2" then
                if type(slot_277_1_0.master_mode_index) == "number" then
                        ant.master_mode_index = slot_277_1_0.master_mode_index
                end

                if type(slot_277_1_0.activation_states) == "table" then
                        ant.activation_states = slot_277_1_0.activation_states
                end

                if type(slot_277_1_0.spin_on_states) == "table" then
                        ant.spin_on_states = slot_277_1_0.spin_on_states
                end

                if type(slot_277_1_0.exploit_on_states) == "table" then
                        ant.exploit_on_states = slot_277_1_0.exploit_on_states
                end

                if type(slot_277_1_0.lock_mode_to_stand) == "boolean" then
                        ant.lock_mode_to_stand = slot_277_1_0.lock_mode_to_stand
                end

                if type(slot_277_1_0.indicators) == "boolean" then
                        ant.indicators = slot_277_1_0.indicators
                end

                if type(slot_277_1_0.mode_names) == "table" then
                        ant.mode_names = slot_277_1_0.mode_names
                end
        end

        slot_0_176_0(ant.mode_index)

        if active_control_id then
                active_control_id = nil
        end

        slot_0_110_0.pitch_min, slot_0_110_0.pitch_max = tostring(ant.pitch_min), tostring(ant.pitch_max)
        slot_0_110_0.pitch_jmin, slot_0_110_0.pitch_jmax = tostring(ant.pitch_jmin), tostring(ant.pitch_jmax)
        slot_0_110_0.yaw_min, slot_0_110_0.yaw_max = tostring(ant.yaw_min), tostring(ant.yaw_max)
        slot_0_110_0.yaw_jmin, slot_0_110_0.yaw_jmax = tostring(ant.yaw_jmin), tostring(ant.yaw_jmax)
        slot_0_110_0.aa_speed, slot_0_110_0.aa_spin_speed = tostring(ant.speed), tostring(ant.spin_speed)

        if gui and gui.notify and gui.notification then
                gui.notify:add(gui.notification("Import", "Configurações de AA importadas!", nil, 4))
        end
end

function render_antiaim_tab(arg_278_0, arg_278_1, arg_278_2, arg_278_3, arg_278_4, arg_278_5, arg_278_6, arg_278_7, arg_278_8, arg_278_9)
        if not ant._initialized then
                ant._initialized = true

                slot_0_176_0(ant.mode_index)

                slot_0_110_0.pitch_min = tostring(ant.pitch_min)
                slot_0_110_0.pitch_max = tostring(ant.pitch_max)
                slot_0_110_0.pitch_jmin = tostring(ant.pitch_jmin)
                slot_0_110_0.pitch_jmax = tostring(ant.pitch_jmax)
                slot_0_110_0.yaw_min = tostring(ant.yaw_min)
                slot_0_110_0.yaw_max = tostring(ant.yaw_max)
                slot_0_110_0.yaw_jmin = tostring(ant.yaw_jmin)
                slot_0_110_0.yaw_jmax = tostring(ant.yaw_jmax)
                slot_0_110_0.aa_speed = tostring(ant.speed)
                slot_0_110_0.aa_spin_speed = tostring(ant.spin_speed)
        end

        slot_278_10_0 = arg_278_1 + 20
        slot_278_11_0 = arg_278_2 + 10
        slot_278_12_0 = arg_278_3 - 40
        slot_278_13_0 = slot_278_12_0 < 520
        slot_278_14_0 = slot_278_13_0 and slot_278_12_0 or math.floor((slot_278_12_0 - 20) / 2)
        slot_278_15_0 = slot_278_13_0 and slot_278_10_0 or slot_278_10_0 + slot_278_14_0 + 20
        slot_278_16_2 = slot_278_11_0
        ant.manual_values = slot_0_125_0(arg_278_0, slot_278_10_0, slot_278_16_2, slot_0_62_0("aa_manual_values", "Manual Values (Type)"), ant.manual_values, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
        slot_278_16_1 = slot_278_16_2 + 30
        slot_278_17_10 = ant.modes and ant.modes[ant.mode_index]

        if slot_278_17_10 then
                function slot_278_18_2(arg_279_0, arg_279_1, arg_279_2)
                        if active_control_id ~= arg_279_0 then
                                ant[arg_279_1] = slot_278_17_10[arg_279_2]

                                if slot_0_110_0 then
                                        slot_0_110_0[arg_279_0] = tostring(ant[arg_279_1])
                                end
                        end
                end

                slot_278_18_2("pitch_min", "pitch_min", "pitch_min")
                slot_278_18_2("pitch_max", "pitch_max", "pitch_max")
                slot_278_18_2("pitch_jmin", "pitch_jmin", "pitch_jmin")
                slot_278_18_2("pitch_jmax", "pitch_jmax", "pitch_jmax")
                slot_278_18_2("yaw_min", "yaw_min", "yaw_min")
                slot_278_18_2("yaw_max", "yaw_max", "yaw_max")
                slot_278_18_2("yaw_jmin", "yaw_jmin", "yaw_jmin")
                slot_278_18_2("yaw_jmax", "yaw_jmax", "yaw_jmax")
                slot_278_18_2("aa_speed", "speed", "speed")
                slot_278_18_2("aa_spin_speed", "spin_speed", "spin_speed")
        end

        slot_278_16_0 = slot_278_16_1 + slot_0_129_0(arg_278_0, "ui_filter", slot_278_10_0, slot_278_16_1, slot_278_14_0, 28, slot_0_62_0("aa_show_sections", "Show Sections:"), ant.ui_filter_options, ant.ui_filter_selection, arg_278_7, arg_278_8, arg_278_9, arg_278_6) + 10

        if ant.ui_filter_selection.Pitch then
                slot_0_58_0(arg_278_0, theme.fonts.category, slot_278_10_0, slot_278_16_0, "Pitch", theme.colors.text_light:mod_a(arg_278_6))

                slot_278_16_0 = slot_278_16_0 + 25

                if ant.manual_values then
                        ant.pitch_min = slot_0_127_0(arg_278_0, "pitch_min", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Pitch Mínimo", ant.pitch_min, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_16_0 = slot_278_16_0 + 60
                        ant.pitch_max = slot_0_127_0(arg_278_0, "pitch_max", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Pitch Máximo", ant.pitch_max, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_16_0 = slot_278_16_0 + 60
                else
                        ant.pitch_min = math.floor(0.5 + slot_0_121_0(arg_278_0, "pitch_min", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Mínimo", -89, 0, ant.pitch_min, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_16_0 = slot_278_16_0 + 40
                        ant.pitch_max = math.floor(0.5 + slot_0_121_0(arg_278_0, "pitch_max", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Máximo", 0, 89, ant.pitch_max, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_16_0 = slot_278_16_0 + 40
                end
        end

        if ant.ui_filter_selection["Pitch Jitter"] then
                slot_0_58_0(arg_278_0, theme.fonts.category, slot_278_10_0, slot_278_16_0, "Pitch Jitter", theme.colors.text_light:mod_a(arg_278_6))

                slot_278_16_0 = slot_278_16_0 + 25

                if ant.manual_values then
                        ant.pitch_jmin = slot_0_127_0(arg_278_0, "pitch_jmin", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Jitter Pitch Mínimo", ant.pitch_jmin, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_16_0 = slot_278_16_0 + 60
                        ant.pitch_jmax = slot_0_127_0(arg_278_0, "pitch_jmax", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Jitter Pitch Máximo", ant.pitch_jmax, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_16_0 = slot_278_16_0 + 60
                else
                        ant.pitch_jmin = math.floor(0.5 + slot_0_121_0(arg_278_0, "pitch_jmin", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Mínimo", -89, 0, ant.pitch_jmin, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_16_0 = slot_278_16_0 + 40
                        ant.pitch_jmax = math.floor(0.5 + slot_0_121_0(arg_278_0, "pitch_jmax", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Máximo", 0, 89, ant.pitch_jmax, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_16_0 = slot_278_16_0 + 40
                end
        end

        if ant.ui_filter_selection.Velocidades then
                slot_0_58_0(arg_278_0, theme.fonts.category, slot_278_10_0, slot_278_16_0, "Velocidades", theme.colors.text_light:mod_a(arg_278_6))

                slot_278_16_0 = slot_278_16_0 + 25

                if ant.manual_values then
                        ant.speed = slot_0_127_0(arg_278_0, "aa_speed", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Velocidade AA", ant.speed, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_16_0 = slot_278_16_0 + 60
                        ant.spin_speed = slot_0_127_0(arg_278_0, "aa_spin_speed", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Velocidade Spin", ant.spin_speed, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_16_0 = slot_278_16_0 + 60
                else
                        ant.speed = math.floor(0.5 + slot_0_121_0(arg_278_0, "aa_speed", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Velocidade AA", 0, 10, ant.speed, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_16_0 = slot_278_16_0 + 40
                        ant.spin_speed = math.floor(0.5 + slot_0_121_0(arg_278_0, "aa_spin_speed", slot_278_10_0, slot_278_16_0, slot_278_14_0, "Velocidade Spin", 0, 180, ant.spin_speed, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_16_0 = slot_278_16_0 + 40
                end
        end

        slot_278_17_9 = ant.modes and ant.modes[ant.mode_index]

        if slot_278_17_9 then
                slot_278_18_1 = false

                function slot_278_19_0(arg_280_0)
                        if slot_278_17_9[arg_280_0] ~= ant[arg_280_0] then
                                slot_278_17_9[arg_280_0] = ant[arg_280_0]
                                slot_278_18_1 = true
                        end
                end

                slot_278_19_0("pitch_min")
                slot_278_19_0("pitch_max")
                slot_278_19_0("pitch_jmin")
                slot_278_19_0("pitch_jmax")
                slot_278_19_0("yaw_min")
                slot_278_19_0("yaw_max")
                slot_278_19_0("yaw_jmin")
                slot_278_19_0("yaw_jmax")

                if slot_278_17_9.speed ~= ant.speed then
                        slot_278_17_9.speed = ant.speed
                        slot_278_18_1 = true
                end

                if slot_278_17_9.spin_speed ~= ant.spin_speed then
                        slot_278_17_9.spin_speed = ant.spin_speed
                        slot_278_18_1 = true
                end

                if slot_278_18_1 then
                        slot_0_177_0()
                end
        end

        slot_278_17_8 = slot_278_13_0 and 0 or slot_278_11_0

        slot_0_58_0(arg_278_0, theme.fonts.item, slot_278_15_0, slot_278_17_8, slot_0_62_0("aa_mode_activation", "Activation Mode"), theme.colors.text_light:mod_a(arg_278_6))

        slot_278_17_7 = slot_278_17_8 + 22
        slot_278_18_0 = ant.lock_mode_to_stand
        ant.lock_mode_to_stand = slot_0_125_0(arg_278_0, slot_278_15_0, slot_278_17_7, slot_0_62_0("aa_lock_stand", "Lock at Stand (disable Automatic)"), ant.lock_mode_to_stand, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
        slot_278_17_6 = slot_278_17_7 + 30

        if ant.lock_mode_to_stand and not slot_278_18_0 then
                for iter_278_0, iter_278_1 in ipairs(ant.mode_names) do
                        ant.activation_states[iter_278_1] = false
                end

                if ant.mode_index ~= 1 then
                        slot_0_177_0()

                        ant.mode_index = 1

                        slot_0_176_0(1)

                        if active_control_id and (active_control_id == "pitch_min" or active_control_id == "pitch_max" or active_control_id == "pitch_jmin" or active_control_id == "pitch_jmax" or active_control_id == "yaw_min" or active_control_id == "yaw_max" or active_control_id == "yaw_jmin" or active_control_id == "yaw_jmax" or active_control_id == "aa_speed" or active_control_id == "aa_spin_speed") then
                                active_control_id = nil
                        end

                        slot_0_110_0.pitch_min = tostring(ant.pitch_min)
                        slot_0_110_0.pitch_max = tostring(ant.pitch_max)
                        slot_0_110_0.pitch_jmin = tostring(ant.pitch_jmin)
                        slot_0_110_0.pitch_jmax = tostring(ant.pitch_jmax)
                        slot_0_110_0.yaw_min = tostring(ant.yaw_min)
                        slot_0_110_0.yaw_max = tostring(ant.yaw_max)
                        slot_0_110_0.yaw_jmin = tostring(ant.yaw_jmin)
                        slot_0_110_0.yaw_jmax = tostring(ant.yaw_jmax)
                        slot_0_110_0.aa_speed = tostring(ant.speed)
                        slot_0_110_0.aa_spin_speed = tostring(ant.spin_speed)
                end
        end

        slot_0_128_0(arg_278_0, "aa_master_mode", slot_278_15_0, slot_278_17_6, slot_278_14_0, 28, ant.master_mode_names, ant, "master_mode_index", arg_278_7, arg_278_8, arg_278_9, arg_278_6)

        slot_278_17_5 = slot_278_17_6 + 40

        if ant.master_mode_index == 3 then
                slot_278_17_5 = slot_278_17_5 + slot_0_129_0(arg_278_0, "aa_activation_states", slot_278_15_0, slot_278_17_5, slot_278_14_0, 28, "Ativar para:", ant.mode_names, ant.activation_states, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
        end

        slot_278_17_4 = slot_278_17_5 + 10

        slot_0_129_0(arg_278_0, "spin_modes", slot_278_15_0, slot_278_17_4, slot_278_14_0, 28, "Ativar Spinbot para:", ant.mode_names, ant.spin_on_states, arg_278_7, arg_278_8, arg_278_9, arg_278_6)

        slot_278_17_3 = slot_278_17_4 + 55

        if slot_278_13_0 and slot_278_17_3 == 0 then
                slot_278_17_3 = slot_278_16_0 + 10
        end

        ant.indicators = slot_0_125_0(arg_278_0, slot_278_15_0, slot_278_17_3, "Ativar Indicadores", ant.indicators, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
        slot_278_17_2 = slot_278_17_3 + 50

        slot_0_58_0(arg_278_0, theme.fonts.category, slot_278_15_0, slot_278_17_2, slot_0_62_0("aa_preview", "Preview"), theme.colors.accent:mod_a(arg_278_6))

        slot_278_17_1 = slot_278_17_2 + 25
        slot_278_20_0 = (function()
                local var_281_0 = 0
                local var_281_1 = var_281_0 + 22 + 35
                local var_281_2 = 4

                if slot_278_14_0 < 240 then
                        var_281_1 = var_281_1 + math.ceil(var_281_2 / 2) * 18
                else
                        var_281_1 = var_281_1 + var_281_2 * 18
                end

                local var_281_3 = var_281_1 + 15 + 1 + 15
                local var_281_4 = slot_278_14_0 < 260

                if var_281_4 then
                        var_281_3 = var_281_3 + 50
                else
                        var_281_3 = var_281_3 + 25
                end

                if var_281_4 then
                        var_281_3 = var_281_3 + 50
                else
                        var_281_3 = var_281_3 + 25
                end

                return var_281_3 + 25 + 20
        end)()

        arg_278_0:add_rect_filled_rounded(draw.rect(slot_278_15_0, slot_278_17_1, slot_278_15_0 + slot_278_14_0, slot_278_17_1 + slot_278_20_0), theme.colors.bg_sidebar:mod_a(arg_278_5 * 0.8), 6)
        arg_278_0:add_rect_rounded(draw.rect(slot_278_15_0, slot_278_17_1, slot_278_15_0 + slot_278_14_0, slot_278_17_1 + slot_278_20_0), theme.colors.border_inner:mod_a(arg_278_6), 6)

        slot_278_21_0 = slot_278_15_0 + 12
        slot_278_22_6 = slot_278_17_1 + 12

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0, slot_278_22_6, slot_0_62_0("aa_status", "Status"), theme.colors.text_normal:mod_a(arg_278_6))

        slot_278_22_5 = slot_278_22_6 + 44
        slot_278_23_0 = slot_0_62_0("aa_mode_label", "Mode: ")

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0, slot_278_22_5, slot_278_23_0, theme.colors.text_light:mod_a(arg_278_6))

        slot_278_24_5 = theme.fonts.small:get_text_size(slot_278_23_0).x
        slot_278_27_5 = (slot_0_64_0() and (ant.mode_display_names_en or ant.mode_names) or ant.mode_display_names or ant.mode_names)[ant.mode_index] or "Unknown"
        slot_278_28_5 = 10

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0 + slot_278_24_5 + slot_278_28_5, slot_278_22_5, slot_278_27_5, theme.colors.accent:mod_a(arg_278_6))

        slot_278_22_4 = slot_278_22_5 + 35
        slot_278_24_4 = ant.mode_names[ant.mode_index]
        slot_278_25_12 = ant.spin_on_states[slot_278_24_4] == true
        slot_278_26_3 = {
                {
                        label = "AA",
                        on = ant.is_currently_active
                },
                {
                        label = slot_0_62_0("aa_state_auto", "Automatic"),
                        on = ant.master_mode_index ~= 1
                },
                {
                        label = slot_0_62_0("aa_state_indic", "Indicators"),
                        on = ant.indicators
                },
                {
                        label = "Spin",
                        on = slot_278_25_12
                }
        }

        function slot_278_27_4(arg_282_0, arg_282_1, arg_282_2, arg_282_3)
                local var_282_0 = (arg_282_3 and theme.colors.kb_success or theme.colors.kb_danger):mod_a(arg_278_6)

                arg_278_0:add_circle_filled(draw.vec2(arg_282_0 + 2, arg_282_1 + 6), 2, var_282_0)

                local var_282_1 = arg_282_0 + 10

                slot_0_58_0(arg_278_0, theme.fonts.small, var_282_1, arg_282_1, arg_282_2 .. ": ", theme.colors.text_normal:mod_a(arg_278_6))

                local var_282_2 = theme.fonts.small:get_text_size(arg_282_2 .. ": ").x
                local var_282_3 = 10

                slot_0_58_0(arg_278_0, theme.fonts.small, var_282_1 + var_282_2 + var_282_3, arg_282_1, arg_282_3 and "ON" or "OFF", var_282_0)
        end

        if slot_278_14_0 < 240 then
                slot_278_29_4 = math.floor((slot_278_14_0 - 24) / 2)
                slot_278_30_4 = math.ceil(#slot_278_26_3 / 2)

                for iter_278_2 = 1, slot_278_30_4 do
                        slot_278_35_0 = slot_278_26_3[iter_278_2]

                        if slot_278_35_0 then
                                slot_278_27_4(slot_278_21_0, slot_278_22_4, slot_278_35_0.label, slot_278_35_0.on)
                        end

                        slot_278_36_0 = slot_278_26_3[iter_278_2 + slot_278_30_4]

                        if slot_278_36_0 then
                                slot_278_27_4(slot_278_21_0 + slot_278_29_4, slot_278_22_4, slot_278_36_0.label, slot_278_36_0.on)
                        end

                        slot_278_22_4 = slot_278_22_4 + 18
                end
        else
                for iter_278_3, iter_278_4 in ipairs(slot_278_26_3) do
                        slot_278_27_4(slot_278_21_0, slot_278_22_4, iter_278_4.label, iter_278_4.on)

                        slot_278_22_4 = slot_278_22_4 + 18
                end
        end

        slot_278_22_3 = slot_278_22_4 + 15

        arg_278_0:add_rect_filled(draw.rect(slot_278_21_0, slot_278_22_3, slot_278_15_0 + slot_278_14_0 - 12, slot_278_22_3 + 1), theme.colors.border_inner:mod_a(arg_278_6 * 0.3))

        slot_278_22_2 = slot_278_22_3 + 15
        slot_278_24_3 = slot_278_14_0 < 260

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0, slot_278_22_2, "Pitch: ", theme.colors.text_normal:mod_a(arg_278_6))

        slot_278_25_11 = slot_278_21_0 + theme.fonts.small:get_text_size("Pitch: ").x
        slot_278_26_2 = string.format("%d..%d", ant.pitch_min, ant.pitch_max)
        slot_278_27_3 = 6

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_25_11 + slot_278_27_3, slot_278_22_2, slot_278_26_2, theme.colors.accent:mod_a(arg_278_6))

        if slot_278_24_3 then
                slot_278_22_2 = slot_278_22_2 + 25

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0, slot_278_22_2, "Jitter: ", theme.colors.text_dark:mod_a(arg_278_6))

                slot_278_28_4 = slot_278_21_0 + theme.fonts.small:get_text_size("Jitter: ").x
                slot_278_29_3 = string.format("%d..%d", ant.pitch_jmin, ant.pitch_jmax)
                slot_278_30_3 = 6

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_28_4 + slot_278_30_3, slot_278_22_2, slot_278_29_3, theme.colors.accent:mod_a(arg_278_6))
        else
                slot_278_25_10 = slot_278_25_11 + theme.fonts.small:get_text_size(slot_278_26_2).x
                slot_278_28_3 = 6
                slot_278_29_2 = 3
                slot_278_25_9 = slot_278_25_10 + slot_278_28_3 + slot_278_29_2

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_25_9, slot_278_22_2, " | Jitter: ", theme.colors.text_dark:mod_a(arg_278_6))

                slot_278_25_8 = slot_278_25_9 + theme.fonts.small:get_text_size(" | Jitter: ").x
                slot_278_30_2 = string.format("%d..%d", ant.pitch_jmin, ant.pitch_jmax)
                slot_278_25_7 = slot_278_25_8 + slot_278_28_3 + slot_278_29_2

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_25_7, slot_278_22_2, slot_278_30_2, theme.colors.accent:mod_a(arg_278_6))
        end

        slot_278_22_1 = slot_278_22_2 + 25
        slot_278_24_2 = slot_278_14_0 < 260

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0, slot_278_22_1, "Yaw: ", theme.colors.text_normal:mod_a(arg_278_6))

        slot_278_25_6 = slot_278_21_0 + theme.fonts.small:get_text_size("Yaw: ").x
        slot_278_26_1 = string.format("%d..%d", ant.yaw_min, ant.yaw_max)
        slot_278_27_2 = 6

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_25_6 + slot_278_27_2, slot_278_22_1, slot_278_26_1, theme.colors.accent:mod_a(arg_278_6))

        if slot_278_24_2 then
                slot_278_22_1 = slot_278_22_1 + 25

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0, slot_278_22_1, "Jitter: ", theme.colors.text_dark:mod_a(arg_278_6))

                slot_278_28_2 = slot_278_21_0 + theme.fonts.small:get_text_size("Jitter: ").x
                slot_278_29_1 = string.format("%d..%d", ant.yaw_jmin, ant.yaw_jmax)
                slot_278_30_1 = 6

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_28_2 + slot_278_30_1, slot_278_22_1, slot_278_29_1, theme.colors.accent:mod_a(arg_278_6))
        else
                slot_278_25_5 = slot_278_25_6 + theme.fonts.small:get_text_size(slot_278_26_1).x
                slot_278_28_1 = 6
                slot_278_29_0 = 3
                slot_278_25_4 = slot_278_25_5 + slot_278_28_1 + slot_278_29_0

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_25_4, slot_278_22_1, " | Jitter: ", theme.colors.text_dark:mod_a(arg_278_6))

                slot_278_25_3 = slot_278_25_4 + theme.fonts.small:get_text_size(" | Jitter: ").x
                slot_278_30_0 = string.format("%d..%d", ant.yaw_jmin, ant.yaw_jmax)
                slot_278_25_2 = slot_278_25_3 + slot_278_28_1 + slot_278_29_0

                slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_25_2, slot_278_22_1, slot_278_30_0, theme.colors.accent:mod_a(arg_278_6))
        end

        slot_278_22_0 = slot_278_22_1 + 25

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_21_0, slot_278_22_0, "Velocidade: ", theme.colors.text_normal:mod_a(arg_278_6))

        slot_278_24_1 = slot_278_21_0 + theme.fonts.small:get_text_size("Velocidade: ").x
        slot_278_25_1 = 20

        slot_0_58_0(arg_278_0, theme.fonts.small, slot_278_24_1 + slot_278_25_1, slot_278_22_0, tostring(ant.speed), theme.colors.accent:mod_a(arg_278_6))

        slot_278_17_0 = slot_278_17_1 + slot_278_20_0 + 40

        if ant.ui_filter_selection.Yaw then
                slot_0_58_0(arg_278_0, theme.fonts.category, slot_278_15_0, slot_278_17_0, "Yaw", theme.colors.text_light:mod_a(arg_278_6))

                slot_278_17_0 = slot_278_17_0 + 25

                if ant.manual_values then
                        ant.yaw_min = slot_0_127_0(arg_278_0, "yaw_min", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Yaw Mínimo", ant.yaw_min, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_17_0 = slot_278_17_0 + 60
                        ant.yaw_max = slot_0_127_0(arg_278_0, "yaw_max", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Yaw Máximo", ant.yaw_max, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_17_0 = slot_278_17_0 + 60
                else
                        ant.yaw_min = math.floor(0.5 + slot_0_121_0(arg_278_0, "yaw_min", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Mínimo", -180, 0, ant.yaw_min, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_17_0 = slot_278_17_0 + 40
                        ant.yaw_max = math.floor(0.5 + slot_0_121_0(arg_278_0, "yaw_max", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Máximo", 0, 180, ant.yaw_max, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_17_0 = slot_278_17_0 + 40
                end
        end

        if ant.ui_filter_selection["Yaw Jitter"] then
                slot_0_58_0(arg_278_0, theme.fonts.category, slot_278_15_0, slot_278_17_0, "Yaw Jitter", theme.colors.text_light:mod_a(arg_278_6))

                slot_278_17_0 = slot_278_17_0 + 25

                if ant.manual_values then
                        ant.yaw_jmin = slot_0_127_0(arg_278_0, "yaw_jmin", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Jitter Yaw Mínimo", ant.yaw_jmin, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_17_0 = slot_278_17_0 + 60
                        ant.yaw_jmax = slot_0_127_0(arg_278_0, "yaw_jmax", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Jitter Yaw Máximo", ant.yaw_jmax, arg_278_7, arg_278_8, arg_278_9, arg_278_6)
                        slot_278_17_0 = slot_278_17_0 + 60
                else
                        ant.yaw_jmin = math.floor(0.5 + slot_0_121_0(arg_278_0, "yaw_jmin", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Mínimo", -180, 0, ant.yaw_jmin, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_17_0 = slot_278_17_0 + 40
                        ant.yaw_jmax = math.floor(0.5 + slot_0_121_0(arg_278_0, "yaw_jmax", slot_278_15_0, slot_278_17_0, slot_278_14_0, "Máximo", 0, 180, ant.yaw_jmax, arg_278_7, arg_278_8, arg_278_6, "%.0f"))
                        slot_278_17_0 = slot_278_17_0 + 40
                end
        end

        slot_278_24_0 = math.max(arg_278_2 + arg_278_4 - 100, slot_278_16_0 + 20, slot_278_17_0 + 20)
        slot_278_25_0 = ant.mode_index
        slot_278_26_0 = slot_0_64_0() and (ant.mode_display_names_en or ant.mode_names) or ant.mode_display_names or ant.mode_names

        slot_0_128_0(arg_278_0, "aa_mode", slot_278_10_0, slot_278_24_0, slot_278_14_0, 28, slot_278_26_0, ant, "mode_index", arg_278_7, arg_278_8, arg_278_9, arg_278_6)

        if ant.mode_index ~= slot_278_25_0 then
                slot_278_27_1 = ant.mode_index
                ant.mode_index = slot_278_25_0

                slot_0_177_0()

                ant.mode_index = slot_278_27_1

                slot_0_176_0(ant.mode_index)

                if active_control_id and (active_control_id == "pitch_min" or active_control_id == "pitch_max" or active_control_id == "pitch_jmin" or active_control_id == "pitch_jmax" or active_control_id == "yaw_min" or active_control_id == "yaw_max" or active_control_id == "yaw_jmin" or active_control_id == "yaw_jmax" or active_control_id == "aa_speed" or active_control_id == "aa_spin_speed") then
                        active_control_id = nil
                end

                slot_0_110_0.pitch_min = tostring(ant.pitch_min)
                slot_0_110_0.pitch_max = tostring(ant.pitch_max)
                slot_0_110_0.pitch_jmin = tostring(ant.pitch_jmin)
                slot_0_110_0.pitch_jmax = tostring(ant.pitch_jmax)
                slot_0_110_0.yaw_min = tostring(ant.yaw_min)
                slot_0_110_0.yaw_max = tostring(ant.yaw_max)
                slot_0_110_0.yaw_jmin = tostring(ant.yaw_jmin)
                slot_0_110_0.yaw_jmax = tostring(ant.yaw_jmax)
                slot_0_110_0.aa_speed = tostring(ant.speed)
                slot_0_110_0.aa_spin_speed = tostring(ant.spin_speed)
        end

        slot_278_27_0 = math.floor(slot_278_14_0 / 2 - 5)

        if slot_0_124_0(arg_278_0, "aa_export", slot_278_15_0, slot_278_24_0, slot_278_27_0, 28, "Exportar", arg_278_7, arg_278_8, arg_278_9, arg_278_6) then
                slot_0_183_0()
        end

        if slot_0_124_0(arg_278_0, "aa_import", slot_278_15_0 + slot_278_27_0 + 10, slot_278_24_0, slot_278_27_0, 28, "Importar", arg_278_7, arg_278_8, arg_278_9, arg_278_6) then
                slot_0_184_0()
        end

        G.tab_heights = G.tab_heights or {}
        slot_278_28_0 = math.max(slot_278_16_0, slot_278_17_0, slot_278_24_0 + 40)
        G.tab_heights["Anti-Aim"] = slot_278_28_0 - arg_278_2 + 20
end

slot_0_185_0 = 4
slot_0_186_0 = 16
slot_0_187_0 = -1
slot_0_188_0 = -1
slot_0_189_0 = -1
slot_0_190_0 = -1
slot_0_191_0 = nil
slot_0_192_0 = false

;(function()
        if game and game.global_vars and game.global_vars.real_time then
                math.randomseed(math.floor(game.global_vars.real_time * 1000))
        else
                math.randomseed(12345)
        end
end)()
events.create_move:add(function(arg_284_0)
        if not hvh.js_enable then
                return
        end

        slot_284_1_0 = gui.ctx:find("rage>weapon>SSG-08>extra>autostop>settings>mode")
        slot_284_2_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")
        slot_284_3_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>pointscale")
        slot_284_4_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>mindamage")
        slot_284_5_0 = gui.ctx:find("rage>aimbot>general>force shoot")

        if not slot_284_1_0 or not slot_284_2_0 or not slot_284_3_0 or not slot_284_4_0 then
                return
        end

        slot_284_6_0 = slot_284_1_0:get_value()
        slot_284_7_0 = slot_284_2_0:get_value()
        slot_284_8_0 = slot_284_3_0:get_value()
        slot_284_9_0 = slot_284_4_0:get_value()
        slot_284_10_0 = slot_284_6_0:get()
        slot_284_11_0 = entities.get_local_pawn()

        if not slot_284_11_0 then
                return
        end

        slot_284_12_0 = slot_284_11_0:get_active_weapon()

        if not slot_284_12_0 then
                return
        end

        if slot_284_12_0:get_class_name() ~= "C_WeaponSSG08" then
                return
        end

        slot_284_13_0 = slot_0_130_0(slot_284_11_0.m_fFlags:get(), 1) ~= 0
        slot_284_14_0 = slot_284_11_0:get_abs_velocity()
        slot_284_15_0 = math.abs(slot_284_14_0.z) < 100

        if slot_284_13_0 then
                if slot_0_192_0 then
                        if slot_0_187_0 >= 0 then
                                slot_284_10_0:set_raw(slot_0_187_0)
                                slot_284_6_0:set(slot_284_10_0)
                        end

                        if hvh.js_original_hc_saved and hvh.js_original_hc then
                                slot_284_7_0:set(hvh.js_original_hc)
                        elseif slot_0_188_0 >= 0 then
                                slot_284_7_0:set(slot_0_188_0)
                        end

                        if slot_0_189_0 >= 0 then
                                slot_284_8_0:set(slot_0_189_0)
                        end

                        if hvh.js_mindmg_onland and hvh.js_mindmg_onland > 0 then
                                slot_284_9_0:set(hvh.js_mindmg_onland)
                        elseif hvh.js_original_md_saved and hvh.js_original_md then
                                slot_284_9_0:set(hvh.js_original_md)
                        elseif slot_0_190_0 >= 0 then
                                slot_284_9_0:set(slot_0_190_0)
                        end

                        if slot_0_191_0 ~= nil and slot_284_5_0 then
                                slot_284_5_0:set_value(slot_0_191_0)
                        end

                        slot_0_187_0, slot_0_188_0, slot_0_189_0, slot_0_190_0 = -1, -1, -1, -1
                        slot_0_191_0 = nil
                        slot_0_192_0 = false
                end

                return
        end

        if hvh.js_autoscope and slot_284_12_0.m_zoomLevel:get() < 1 then
                arg_284_0:set_button(input_bit_mask.in_attack2)
        end

        if not slot_0_192_0 then
                slot_0_192_0 = true
                slot_0_187_0 = slot_284_10_0:get_raw()
                slot_0_188_0 = slot_284_7_0:get()
                slot_0_189_0 = slot_284_8_0:get()
                slot_0_190_0 = slot_284_9_0:get()

                if slot_284_5_0 then
                        slot_0_191_0 = slot_284_5_0:get_value():get()
                end

                if not hvh.js_original_hc_saved then
                        hvh.js_original_hc = slot_284_7_0:get()
                        hvh.js_original_md = slot_284_9_0:get()
                        hvh.js_original_hc_saved = true
                        hvh.js_original_md_saved = true
                end
        end

        slot_284_16_0 = nil
        slot_284_17_0 = nil
        slot_284_18_0 = nil

        if hvh.js_autoconfig then
                if game and game.global_vars and game.global_vars.real_time then
                        math.randomseed(math.floor(game.global_vars.real_time * 1000) + math.floor(slot_284_14_0.z * 100))
                end

                slot_284_16_0 = math.random(12, 44)
                slot_284_17_0 = slot_0_189_0 and slot_0_189_0 >= 0 and slot_0_189_0 or slot_284_8_0:get()
                slot_284_18_0 = slot_0_190_0 and slot_0_190_0 >= 0 and slot_0_190_0 or slot_284_9_0:get()
        else
                slot_284_16_0 = hvh.js_hitchance
                slot_284_17_0 = hvh.js_pointscale
                slot_284_18_0 = hvh.js_mindamage
        end

        if hvh.js_autoconfig then
                slot_284_7_0:set(slot_284_16_0)
        else
                slot_284_7_0:set(slot_284_16_0)
                slot_284_8_0:set(slot_284_17_0)
                slot_284_9_0:set(slot_284_18_0)
        end

        slot_284_19_0 = slot_0_131_0(slot_0_187_0, slot_0_186_0)

        if slot_284_15_0 then
                slot_284_19_0 = slot_0_131_0(slot_284_19_0, slot_0_185_0)
        else
                slot_284_19_0 = slot_0_130_0(slot_284_19_0, slot_0_132_0(slot_0_185_0))
        end

        slot_284_10_0:set_raw(slot_284_19_0)
        slot_284_6_0:set(slot_284_10_0)

        if hvh.js_forceshoot and slot_284_5_0 then
                if slot_0_191_0 == nil then
                        slot_0_191_0 = slot_284_5_0:get_value():get()
                end

                if slot_284_15_0 then
                        slot_284_5_0:set_value(true)
                else
                        slot_284_5_0:set_value(false)
                end
        elseif slot_284_5_0 and slot_0_191_0 ~= nil then
                slot_284_5_0:set_value(slot_0_191_0)
        end
end)
events.create_move:add(function(arg_285_0)
        if not hvh.js_autopointscale then
                return
        end

        local var_285_0 = 90
        local var_285_1 = 0.57831001281738
        local var_285_2 = gui.ctx:find("rage>weapon>SSG-08>weapon>pointscale") or gui.ctx:find("rage>weapon>Bolt Snipers>weapon>pointscale")

        if not var_285_2 then
                return
        end

        local var_285_3 = entities.get_local_pawn()

        if not var_285_3 then
                return
        end

        local var_285_4 = var_285_3:get_active_weapon()

        if not var_285_4 then
                return
        end

        if var_285_4:get_class_name() ~= "C_WeaponSSG08" then
                var_285_2:get_value():set(var_285_0)

                return
        end

        local var_285_5 = var_285_4:get_inaccuracy(csweapon_mode.primary_mode)
        local var_285_6 = math.floor(var_285_0 - var_285_5 / var_285_1 * var_285_0)

        var_285_2:get_value():set(var_285_6)
end)
events.create_move:add(function(arg_286_0)
        if not gui or not gui.ctx or not gui.ctx.find then
                return
        end

        local var_286_0 = entities.get_local_pawn()

        if not var_286_0 or not var_286_0:is_alive() then
                return
        end

        local var_286_1 = var_286_0:get_active_weapon()

        if not var_286_1 then
                return
        end

        local var_286_2 = var_286_1:to_weapon_base_gun()

        if not var_286_2 then
                return
        end

        local var_286_3 = game.global_vars.real_time
        local var_286_4 = var_286_2.m_iClip1:get()

        if var_286_4 >= 0 and hvh.hc_last_ammo and var_286_4 < hvh.hc_last_ammo and not arg_286_0:get_button(input_bit_mask.in_attack) then
                if hvh.hc_enable and hvh.anti_miss_enable and not hvh.hc_active then
                        hvh.anti_miss_last_shot_time = var_286_3
                        hvh.anti_miss_active = false
                end

                if hvh.hc_enable then
                        hvh.hc_shot_time = var_286_3
                end
        end

        hvh.hc_last_ammo = var_286_4
end)
events.create_move:add(function(arg_287_0)
        if not hvh.original_values_saved_on_start then
                local var_287_0 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")

                if var_287_0 and var_287_0.get_value then
                        hvh.hc_original_hc = var_287_0:get_value():get()
                end

                local var_287_1 = gui.ctx:find("rage>weapon>SSG-08>weapon>mindamage")

                if var_287_1 and var_287_1.get_value then
                        hvh.hc_original_md = var_287_1:get_value():get()
                end

                hvh.original_values_saved_on_start = true
        end
end)

if events and events.event and events.event.add then
        events.event:add(function(arg_288_0)
                if not hvh.hc_enable then
                        return
                end

                if not arg_288_0 then
                        return
                end

                if arg_288_0:get_name() == "player_hurt" then
                        local var_288_0 = entities.get_local_controller()

                        if not var_288_0 then
                                return
                        end

                        if arg_288_0:get_controller("attacker") == var_288_0 then
                                if hvh.anti_miss_enable then
                                        if hvh.anti_miss_original_hc then
                                                local var_288_1 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")

                                                if var_288_1 and var_288_1.get_value then
                                                        var_288_1:get_value():set(hvh.anti_miss_original_hc)
                                                end

                                                hvh.anti_miss_original_hc = nil
                                        end

                                        hvh.anti_miss_active = false
                                        hvh.anti_miss_last_shot_time = 0
                                        hvh.anti_miss_count = 0
                                end

                                hvh.hc_active = true
                                hvh.hc_fire_time = game.global_vars.real_time
                        end
                end
        end)
end

events.create_move:add(function(arg_289_0)
        if not hvh.hc_enable then
                return
        end

        if not hvh.hc_active then
                return
        end

        if game.global_vars.real_time - hvh.hc_fire_time < 2 then
                local var_289_0 = hvh.hc_auto and 15 or hvh.hc_value
                local var_289_1 = hvh.hc_auto and 0 or hvh.hc_mindmg
                local var_289_2 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")

                if var_289_2 and var_289_2.get_value then
                        var_289_2:get_value():set(var_289_0)
                end

                local var_289_3 = gui.ctx:find("rage>weapon>SSG-08>weapon>mindamage")

                if var_289_3 and var_289_3.get_value then
                        var_289_3:get_value():set(var_289_1)
                end
        else
                local var_289_4 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")

                if var_289_4 and var_289_4.get_value and hvh.hc_original_hc then
                        var_289_4:get_value():set(hvh.hc_original_hc)
                end

                local var_289_5 = gui.ctx:find("rage>weapon>SSG-08>weapon>mindamage")

                if var_289_5 and var_289_5.get_value and hvh.hc_original_md then
                        var_289_5:get_value():set(hvh.hc_original_md)
                end

                hvh.hc_active = false
        end
end)

if events and events.event and events.event.add then
        events.event:add(function(arg_290_0)
                if not hvh.anti_miss_enable then
                        return
                end

                if not arg_290_0 then
                        return
                end

                if hvh.hc_active then
                        return
                end

                local var_290_0 = arg_290_0:get_name()

                if var_290_0 == "player_hurt" then
                        local var_290_1 = entities.get_local_controller()

                        if not var_290_1 then
                                return
                        end

                        if arg_290_0:get_controller("attacker") == var_290_1 then
                                if hvh.anti_miss_original_hc then
                                        local var_290_2 = gui.ctx:find("rage>weapon>SSG-08>weapon>hitchance")

                                        if var_290_2 and var_290_2.get_value then
                                                var_290_2:get_value():set(hvh.anti_miss_original_hc)
                                        end

                                        hvh.anti_miss_original_hc = nil
                                end

                                hvh.anti_miss_active = false
                                hvh.anti_miss_last_shot_time = 0
                                hvh.anti_miss_count = 0
                        end
                end

                if var_290_0 == "round_start" then
                        hvh.anti_miss_count = 0
                        hvh.anti_miss_active = false
                        hvh.anti_miss_last_shot_time = 0

                        if hvh.anti_miss_original_hc then
                                hvh.anti_miss_original_hc = nil
                        end

                        hvh.hc_active = false

                        if slot_0_88_0 then
                                slot_0_88_0.last_sent_time = 0
                                slot_0_88_0.current_index = 1
                        end
                end

                if var_290_0 == "player_death" and arg_290_0:get_pawn_from_id("userid") == entities.get_local_pawn() then
                        hvh.anti_miss_count = 0
                        hvh.anti_miss_active = false
                        hvh.anti_miss_last_shot_time = 0

                        if hvh.anti_miss_original_hc then
                                hvh.anti_miss_original_hc = nil
                        end

                        hvh.hc_active = false
                end
        end)
end

events.create_move:add(function(arg_291_0)
        if not hvh.hc_enable or not hvh.anti_miss_enable then
                return
        end

        if not hvh.anti_miss_last_shot_time or hvh.anti_miss_last_shot_time == 0 then
                return
        end

        if hvh.hc_active then
                return
        end

        if game.global_vars.real_time - hvh.anti_miss_last_shot_time > 0.5 and not hvh.anti_miss_active then
                hvh.anti_miss_count = hvh.anti_miss_count + 1

                local var_291_0 = entities.get_local_pawn()

                if not var_291_0 then
                        hvh.anti_miss_active = true
                        hvh.anti_miss_last_shot_time = 0

                        return
                end

                local var_291_1 = var_291_0:get_active_weapon()

                if not var_291_1 then
                        hvh.anti_miss_active = true
                        hvh.anti_miss_last_shot_time = 0

                        return
                end

                local var_291_2 = var_291_1:get_class_name()

                if not var_291_2 then
                        hvh.anti_miss_active = true
                        hvh.anti_miss_last_shot_time = 0

                        return
                end

                local var_291_3 = 4

                if var_291_2 == "C_DEagle" or var_291_2 == "C_WeaponRevolver" then
                        var_291_3 = 7
                elseif var_291_2 == "C_AWP" then
                        var_291_3 = 5
                elseif var_291_2 == "C_WeaponSCAR20" or var_291_2 == "C_WeaponG3SG1" then
                        var_291_3 = 3
                elseif var_291_2 == "C_WeaponSSG08" then
                        var_291_3 = 10
                end

                local var_291_4 = var_291_1.m_iItemDefinitionIndex

                if not var_291_4 then
                        hvh.anti_miss_active = true
                        hvh.anti_miss_last_shot_time = 0

                        return
                end

                local var_291_5 = var_291_4:get()

                if not var_291_5 then
                        hvh.anti_miss_active = true
                        hvh.anti_miss_last_shot_time = 0

                        return
                end

                local var_291_6 = ({
                        "Desert Eagle",
                        nil,
                        nil,
                        nil,
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
                        [39] = "SG 553",
                        [60] = "M4A1-S",
                        [64] = "R8 Revolver",
                        [40] = "SSG-08",
                        [38] = "SCAR-20"
                })[var_291_5]

                if not var_291_6 then
                        hvh.anti_miss_active = true
                        hvh.anti_miss_last_shot_time = 0

                        return
                end

                local var_291_7 = "rage>weapon>" .. var_291_6 .. ">weapon>hitchance"

                if not hvh.anti_miss_original_hc then
                        local var_291_8 = gui.ctx:find(var_291_7)

                        if var_291_8 and var_291_8.get_value then
                                local var_291_9 = var_291_8:get_value():get()

                                if var_291_9 < 100 - var_291_3 then
                                        hvh.anti_miss_original_hc = var_291_9

                                        local var_291_10 = math.min(100, var_291_9 + var_291_3)

                                        var_291_8:get_value():set(var_291_10)
                                end
                        end
                else
                        local var_291_11 = gui.ctx:find(var_291_7)

                        if var_291_11 and var_291_11.get_value then
                                local var_291_12 = var_291_11:get_value():get()

                                if var_291_12 < 100 - var_291_3 then
                                        local var_291_13 = math.min(100, var_291_12 + var_291_3)

                                        var_291_11:get_value():set(var_291_13)
                                end
                        end
                end

                hvh.anti_miss_active = true
                hvh.anti_miss_last_shot_time = 0
        end
end)

slot_0_194_0 = gui.notify

function slot_0_195_0(arg_292_0)
        if slot_0_88_0.vote_reveal_notification then
                slot_0_194_0:add(gui.notification("Vote Reveal", arg_292_0))
        end

        if slot_0_88_0.vote_reveal_team_chat then
                game.engine:client_cmd("say_team " .. arg_292_0)
        end

        if slot_0_88_0.vote_reveal_all_chat then
                game.engine:client_cmd("say " .. arg_292_0)
        end
end

slot_0_196_0 = 0
slot_0_197_0 = 0
slot_0_198_0 = {}
slot_0_198_0.Amount = 0
slot_0_198_0.Yes = 0
slot_0_198_0.No = 0
slot_0_198_0.Lp_No = false
slot_0_199_0 = {}

if mods and mods.events and mods.events.add_listener then
        mods.events:add_listener("vote_cast")
        mods.events:add_listener("vote_options")
        mods.events:add_listener("player_connect")
        mods.events:add_listener("player_disconnect")
end

events.event:add(function(arg_293_0)
        local var_293_0 = arg_293_0:get_name()

        if slot_0_88_0.vote_reveal_enable and var_293_0 == "vote_cast" then
                local var_293_1 = arg_293_0:get_pawn_from_id("userid")

                if var_293_1 then
                        local var_293_2 = var_293_1:get_name() or "Desconhecido"
                        local var_293_3 = var_293_1:is_enemy()
                        local var_293_4 = var_293_3 and "Inimigo" or "Aliado"
                        local var_293_5 = arg_293_0:get_int("vote_option") == 0 and "SIM" or "NÃO"
                        local var_293_6 = false

                        if var_293_3 and slot_0_88_0.vote_reveal_show_enemies then
                                var_293_6 = true
                        elseif not var_293_3 and slot_0_88_0.vote_reveal_show_allies then
                                var_293_6 = true
                        end

                        if var_293_6 then
                                local var_293_7 = string.format("[%s] (%s) votou: %s", var_293_2, var_293_4, var_293_5)

                                slot_0_195_0(var_293_7)
                        end
                end
        end

        if not slot_0_88_0.antikick_enable then
                return
        end

        if var_293_0 == "player_disconnect" or var_293_0 == "player_connect" then
                local var_293_8 = arg_293_0:get_pawn_from_id("userid")

                if var_293_8 == nil or var_293_8:is_enemy() then
                        return
                end

                if var_293_0 == "player_disconnect" then
                        slot_0_197_0 = slot_0_197_0 + 1
                else
                        slot_0_197_0 = math.max(0, slot_0_197_0 - 1)
                end

                return
        elseif var_293_0 == "round_start" then
                slot_0_197_0 = 0

                return
        end

        if var_293_0 == "vote_options" then
                slot_0_196_0 = game.global_vars.tick_count

                return
        end

        if var_293_0 ~= "vote_cast" then
                return
        end

        local var_293_9 = arg_293_0:get_pawn_from_id("userid")

        if var_293_9 == nil or var_293_9:is_enemy() then
                return
        end

        if game.global_vars.tick_count == slot_0_196_0 then
                slot_0_198_0.Yes = 0
                slot_0_198_0.No = 0
                slot_0_198_0.Lp_No = false

                while #slot_0_199_0 > 0 do
                        table.remove(slot_0_199_0)
                end

                slot_0_196_0 = 0
        end

        slot_0_198_0.Amount = 0

        entities.controllers:for_each(function(arg_294_0)
                local var_294_0 = arg_294_0.entity

                if var_294_0 == nil or var_294_0:is_enemy() then
                        return
                end

                slot_0_198_0.Amount = slot_0_198_0.Amount + 1
        end)

        slot_0_198_0.Amount = slot_0_198_0.Amount - slot_0_197_0

        if slot_0_198_0.Amount > 5 then
                return
        end

        local var_293_10 = entities.get_local_pawn()

        if var_293_10 == nil then
                return
        end

        local var_293_11 = var_293_10:get_name()
        local var_293_12 = var_293_9:get_name()

        if arg_293_0:get_int("vote_option") == 0 then
                table.insert(slot_0_199_0, "Yes")
        else
                table.insert(slot_0_199_0, "No")

                if var_293_11 == var_293_12 then
                        slot_0_198_0.Lp_No = true
                end
        end

        if #slot_0_199_0 ~= slot_0_198_0.Amount then
                return
        end

        for iter_293_0, iter_293_1 in ipairs(slot_0_199_0) do
                if iter_293_1 == "Yes" then
                        slot_0_198_0.Yes = slot_0_198_0.Yes + 1
                else
                        slot_0_198_0.No = slot_0_198_0.No + 1
                end
        end

        if slot_0_198_0.Yes == slot_0_198_0.Amount - 1 and slot_0_198_0.Lp_No then
                if slot_0_88_0.vote_reveal_enable then
                        slot_0_195_0("[ANTI-KICK] Desconectando para evitar cooldown...")
                end

                game.engine:client_cmd("disconnect")
        end
end)

if not TUEURS_DETECT_MODULE then
        TUEURS_DETECT_MODULE = {
                KEY_2 = "[T-ACK]",
                DELAY = 2.5,
                timer = 0,
                KEY_1 = "[T-SYN]",
                TOL = 0.2,
                py = 50,
                px = 300,
                listener_registered = false,
                detect_font = nil,
                initialized = false,
                stage = 0,
                next_send = 0,
                sent = false,
                active = false,
                users = {},
                users_check = {},
                pending = {}
        }

        function TUEURS_DETECT_MODULE.Init(arg_295_0)
                if arg_295_0.initialized then
                        return
                end

                if not arg_295_0.detect_font then
                        arg_295_0.detect_font = draw.font_gdi("Verdana", 11, draw.font_flags.shadow)

                        if arg_295_0.detect_font then
                                arg_295_0.detect_font:create()
                        end
                end

                if not arg_295_0.listener_registered and mods and mods.events then
                        mods.events:add_listener("player_chat")

                        arg_295_0.listener_registered = true
                end

                arg_295_0.initialized = true

                print("[TUEURS DETECT] Module initialized")
        end

        function TUEURS_DETECT_MODULE.Reset(arg_296_0)
                arg_296_0.users = {}
                arg_296_0.users_check = {}
                arg_296_0.pending = {}
                arg_296_0.stage = 0
                arg_296_0.sent = false

                if game and game.global_vars then
                        arg_296_0.next_send = game.global_vars.real_time + 3
                end

                print("[TUEURS DETECT] Reset on new map")
        end

        function TUEURS_DETECT_MODULE.Validate(arg_297_0, arg_297_1, arg_297_2)
                if arg_297_0.users_check[arg_297_1] then
                        return
                end

                arg_297_0.users_check[arg_297_1] = true

                table.insert(arg_297_0.users, {
                        n = arg_297_1,
                        d = arg_297_2,
                        t = game.global_vars.real_time
                })

                if gui and gui.notify then
                        gui.notify:add(gui.notification("TUEURS", arg_297_1 .. " validado"))
                end

                print("[TUEURS] Validated: " .. arg_297_1)
        end

        function TUEURS_DETECT_MODULE.RemoveUser(arg_298_0, arg_298_1)
                for iter_298_0 = #arg_298_0.users, 1, -1 do
                        if arg_298_0.users[iter_298_0].n == arg_298_1 then
                                table.remove(arg_298_0.users, iter_298_0)
                                print("[TUEURS DETECT] Removido: " .. arg_298_1 .. " (desconectou)")
                        end
                end

                arg_298_0.users_check[arg_298_1] = nil
                arg_298_0.pending[arg_298_1] = nil
        end

        function TUEURS_DETECT_MODULE.Send(arg_299_0)
                if not game or not game.engine or not game.engine:in_game() then
                        return
                end

                local var_299_0 = game.global_vars.real_time

                if arg_299_0.stage == 0 and var_299_0 > arg_299_0.next_send then
                        game.engine:client_cmd("say " .. arg_299_0.KEY_1)

                        arg_299_0.stage = 1
                        arg_299_0.timer = var_299_0
                elseif arg_299_0.stage == 1 and var_299_0 >= arg_299_0.timer + arg_299_0.DELAY then
                        game.engine:client_cmd("say " .. arg_299_0.KEY_2)

                        arg_299_0.stage = 0
                        arg_299_0.sent = true
                        arg_299_0.next_send = var_299_0 + 999999
                end
        end

        function TUEURS_DETECT_MODULE.OnChat(arg_300_0, arg_300_1)
                if arg_300_1:get_name() ~= "player_chat" then
                        return
                end

                local var_300_0 = arg_300_1:get_string("text")
                local var_300_1 = arg_300_1:get_controller("userid")

                if not var_300_1 then
                        return
                end

                local var_300_2 = var_300_1:get_name() or "?"
                local var_300_3 = entities.get_local_controller()

                if not var_300_3 then
                        return
                end

                if var_300_1 == var_300_3 then
                        if var_300_0 == "!teste" then
                                arg_300_0:Validate(var_300_2, 0)
                        end

                        return
                end

                local var_300_4 = game.global_vars.real_time

                if string.find(var_300_0, arg_300_0.KEY_1, 1, true) then
                        arg_300_0.pending[var_300_2] = var_300_4

                        if not arg_300_0.users_check[var_300_2] and arg_300_0.sent and arg_300_0.stage == 0 then
                                arg_300_0.next_send = var_300_4 + 2
                        end
                elseif string.find(var_300_0, arg_300_0.KEY_2, 1, true) and arg_300_0.pending[var_300_2] then
                        local var_300_5 = var_300_4 - arg_300_0.pending[var_300_2]

                        if var_300_5 >= arg_300_0.DELAY - arg_300_0.TOL and var_300_5 <= arg_300_0.DELAY + arg_300_0.TOL then
                                arg_300_0:Validate(var_300_2, var_300_5)
                        end

                        arg_300_0.pending[var_300_2] = nil
                end
        end

        function TUEURS_DETECT_MODULE.Draw(arg_301_0)
                if not game or not game.engine or not game.engine:in_game() then
                        return
                end

                if #arg_301_0.users == 0 then
                        return
                end

                slot_301_1_0 = draw.surface
                slot_301_2_0 = game.global_vars.real_time
                slot_301_3_0 = bit.band(slot_0_32_0(16) or 0, 32768) ~= 0
                slot_301_4_0 = slot_0_65_0.x
                slot_301_5_0 = slot_0_65_0.y
                slot_301_6_0 = 210
                slot_301_7_0 = 30 + #arg_301_0.users * 22

                if slot_301_3_0 and slot_0_65_0.down and slot_0_57_0(arg_301_0.px, arg_301_0.py, slot_301_6_0, slot_301_7_0, slot_301_4_0, slot_301_5_0) then
                        if not arg_301_0.dragging then
                                arg_301_0.dragging = true
                                arg_301_0.drag_ox = slot_301_4_0 - arg_301_0.px
                                arg_301_0.drag_oy = slot_301_5_0 - arg_301_0.py
                        end
                else
                        arg_301_0.dragging = false
                end

                if arg_301_0.dragging then
                        arg_301_0.px = slot_301_4_0 - arg_301_0.drag_ox
                        arg_301_0.py = slot_301_5_0 - arg_301_0.drag_oy
                end

                slot_301_8_0 = arg_301_0.px
                slot_301_9_0 = arg_301_0.py
                slot_301_10_0 = theme.colors.bg_sidebar:mod_a(240)
                slot_301_11_0 = theme.colors.accent

                slot_301_1_0:add_rect_filled_rounded(draw.rect(slot_301_8_0, slot_301_9_0, slot_301_8_0 + slot_301_6_0, slot_301_9_0 + slot_301_7_0), slot_301_10_0, 6)
                slot_301_1_0:add_rect_rounded(draw.rect(slot_301_8_0, slot_301_9_0, slot_301_8_0 + slot_301_6_0, slot_301_9_0 + slot_301_7_0), theme.colors.border_inner:mod_a(120), 6)
                slot_301_1_0:add_rect_filled_rounded(draw.rect(slot_301_8_0, slot_301_9_0, slot_301_8_0 + slot_301_6_0, slot_301_9_0 + 2), slot_301_11_0, 2)
                slot_0_58_0(slot_301_1_0, theme.fonts.category, slot_301_8_0 + 12, slot_301_9_0 + 7, "TUEURS USERS (" .. #arg_301_0.users .. ")", theme.colors.text_light)
                slot_301_1_0:add_line(draw.vec2(slot_301_8_0 + 8, slot_301_9_0 + 25), draw.vec2(slot_301_8_0 + slot_301_6_0 - 8, slot_301_9_0 + 25), theme.colors.border_inner:mod_a(60))

                for iter_301_0, iter_301_1 in ipairs(arg_301_0.users) do
                        slot_301_17_0 = slot_301_9_0 + 28 + (iter_301_0 - 1) * 22
                        slot_301_18_0 = draw.rect(slot_301_8_0 + 5, slot_301_17_0 - 2, slot_301_8_0 + slot_301_6_0 - 5, slot_301_17_0 + 20)

                        if slot_0_57_0(slot_301_8_0 + 5, slot_301_17_0 - 2, slot_301_6_0 - 10, 22, slot_301_4_0, slot_301_5_0) then
                                slot_301_1_0:add_rect_filled_rounded(slot_301_18_0, theme.colors.bg_item_hover:mod_a(80), 4)
                        end

                        slot_301_19_0 = (math.sin(slot_301_2_0 * 5) + 1) / 2
                        slot_301_20_0 = draw.color(50, 255, 50, 255)

                        if iter_301_1.d > 0 and math.abs(iter_301_1.d - arg_301_0.DELAY) > 0.15 then
                                slot_301_20_0 = draw.color(255, 200, 0, 255)
                        end

                        slot_301_1_0:add_circle_filled(draw.vec2(slot_301_8_0 + 18, slot_301_17_0 + 10), 3 + slot_301_19_0 * 0.5, slot_301_20_0:mod_a(180 + slot_301_19_0 * 75))
                        slot_0_58_0(slot_301_1_0, theme.fonts.small, slot_301_8_0 + 32, slot_301_17_0 + 2, iter_301_1.n, theme.colors.text_normal)
                end
        end
end

events.event:add(function(arg_302_0)
        if not TUEURS_DETECT_MODULE.initialized then
                TUEURS_DETECT_MODULE:Init()
        end

        local var_302_0 = arg_302_0:get_name()

        if var_302_0 == "game_newmap" then
                TUEURS_DETECT_MODULE:Reset()
        elseif var_302_0 == "player_disconnect" then
                local var_302_1 = arg_302_0:get_string("name")

                if not var_302_1 or var_302_1 == "" then
                        local var_302_2 = arg_302_0:get_controller("userid")

                        if var_302_2 then
                                var_302_1 = var_302_2:get_name()
                        end
                end

                if var_302_1 and var_302_1 ~= "" then
                        TUEURS_DETECT_MODULE:RemoveUser(var_302_1)
                end
        else
                TUEURS_DETECT_MODULE:OnChat(arg_302_0)
        end
end)
events.present_queue:add(function()
        if not TUEURS_DETECT_MODULE.initialized then
                TUEURS_DETECT_MODULE:Init()
        end

        TUEURS_DETECT_MODULE:Send()

        if slot_0_87_0 and slot_0_87_0.tueurs_detect and menu_open then
                TUEURS_DETECT_MODULE:Draw()
        end
end)
events.present_queue:add(function()
        if EnemyTrackerState then
                EnemyTrackerState.enabled = false
                EnemyTrackerState.killsay_enable = false
                EnemyTrackerState.features_enabled = false
                EnemyTrackerState.mini_ui_enabled = false
        end

        if hvh then
                hvh.hc_enable = false
                hvh.hc_active = false
        end

        if slot_0_89_0 then
                slot_0_89_0.enable = false
        end

        if not G.FREE_VERSION_NOTICE_SHOWN and menu_open and not slot_0_0_0.active then
                G.FREE_VERSION_NOTICE_SHOWN = true
                G.changelog_state.active = true
                menu_open = false
        end
end)

_cl_gask = ffi.cast("short(__stdcall*)(int)", utils.find_export("user32.dll", "GetAsyncKeyState"))

ffi.cdef("    typedef struct { int x; int y; } POINT__CL;\n")

_cl_gcp = ffi.cast("bool(__stdcall*)(POINT__CL*)", utils.find_export("user32.dll", "GetCursorPos"))
_cl_last_lmb = false
G.changelog_state = {
        dismissed = false,
        update_date = "03/03/2026",
        version = "New",
        active = false,
        features = {
                {
                        "LOCKED",
                        en = "MM Helper — Enemy Tracker & Vis-Check",
                        pt = "MM Helper — Rastreador de Inimigos e Vis-Check"
                },
                {
                        "LOCKED",
                        en = "HC Helper — Dynamic Hitchance & Anti-Miss",
                        pt = "HC Helper — Hitchance Dinâmico e Anti-Miss"
                },
                {
                        "LOCKED",
                        en = "Killsay — Custom Messages & Inline Drawing",
                        pt = "Killsay — Mensagens Customizadas e na Tela"
                },
                {
                        "LOCKED",
                        en = "Waypoints — 3D Indicators & Animations",
                        pt = "Waypoints — Indicadores 3D e Animações"
                },
                {
                        "INFO",
                        en = "Upgrade to Tueurs.Pro to unlock all features.",
                        pt = "Adquira o Tueurs.Pro para liberar tudo."
                }
        }
}

function G.render_changelog()
        if not G.changelog_state.active then
                return
        end

        if not game.engine or not game.engine.get_screen_size then
                return
        end

        if slot_0_65_0 then
                slot_0_65_0.pressed = false
        end

        if not G.changelog_state.start_time then
                G.changelog_state.start_time = game.global_vars.real_time
        end

        slot_305_0_0 = game.global_vars.real_time - G.changelog_state.start_time
        slot_305_1_0 = draw.surface
        slot_305_2_0, slot_305_3_0 = game.engine:get_screen_size()
        slot_305_4_0 = slot_305_2_0 / 2
        slot_305_5_0 = slot_305_3_0 / 2
        slot_305_6_0 = ffi.new("POINT__CL")

        _cl_gcp(slot_305_6_0)

        slot_305_7_0 = slot_305_6_0.x
        slot_305_8_0 = slot_305_6_0.y
        slot_305_9_0 = bit.band(_cl_gask(1) or 0, 32768) ~= 0
        slot_305_10_0 = slot_305_9_0 and not _cl_last_lmb
        _cl_last_lmb = slot_305_9_0
        slot_305_11_0 = math.min(1, slot_305_0_0 * 2.5)

        slot_305_1_0:add_rect_filled(draw.rect(0, 0, slot_305_2_0, slot_305_3_0), draw.color(5, 7, 14, math.floor(255 * slot_305_11_0 * 0.92)))

        slot_305_12_0 = 60
        slot_305_13_0 = 0.5 + 0.5 * math.sin(slot_305_0_0 * 0.8)
        slot_305_14_0 = draw.color(40, 70, 160, math.floor(slot_305_11_0 * 15 * slot_305_13_0))

        for iter_305_0 = 0, slot_305_2_0, slot_305_12_0 do
                slot_305_19_3 = slot_305_0_0 * 15 % slot_305_12_0

                slot_305_1_0:add_line(draw.vec2(iter_305_0 + slot_305_19_3, 0), draw.vec2(iter_305_0 + slot_305_19_3, slot_305_3_0), slot_305_14_0)
        end

        for iter_305_1 = 0, slot_305_3_0, slot_305_12_0 do
                slot_305_19_2 = slot_305_0_0 * 15 % slot_305_12_0

                slot_305_1_0:add_line(draw.vec2(0, iter_305_1 + slot_305_19_2), draw.vec2(slot_305_2_0, iter_305_1 + slot_305_19_2), slot_305_14_0)
        end

        if not G.changelog_state.particles then
                G.changelog_state.particles = {}

                for iter_305_2 = 1, 55 do
                        G.changelog_state.particles[iter_305_2] = {
                                x = math.random() * slot_305_2_0,
                                y = math.random() * slot_305_3_0,
                                speed = 0.15 + math.random() * 0.5,
                                size = 1 + math.random() * 2,
                                phase = math.random() * 6.28,
                                hue_shift = math.random() * 3.14
                        }
                end
        end

        for iter_305_3, iter_305_4 in ipairs(G.changelog_state.particles) do
                iter_305_4.y = iter_305_4.y - iter_305_4.speed
                iter_305_4.x = iter_305_4.x + math.sin(slot_305_0_0 * 0.4 + iter_305_4.phase) * 0.6

                if iter_305_4.y < -5 then
                        iter_305_4.y = slot_305_3_0 + 5
                        iter_305_4.x = math.random() * slot_305_2_0
                end

                slot_305_20_2 = slot_305_11_0 * (0.15 + 0.1 * math.sin(slot_305_0_0 * 1.2 + iter_305_4.phase))

                if slot_305_20_2 > 0.01 then
                        slot_305_21_1 = math.floor(80 + 30 * math.sin(slot_305_0_0 * 0.5 + iter_305_4.hue_shift))
                        slot_305_22_1 = math.floor(120 + 40 * math.sin(slot_305_0_0 * 0.8 + iter_305_4.hue_shift))
                        slot_305_23_1 = math.floor(255)

                        slot_305_1_0:add_circle_filled(draw.vec2(iter_305_4.x, iter_305_4.y), iter_305_4.size, draw.color(slot_305_21_1, slot_305_22_1, slot_305_23_1, math.floor(slot_305_20_2 * 255)))
                end
        end

        slot_305_15_0 = math.min(520, slot_305_2_0 - 80)
        slot_305_16_0 = #G.changelog_state.features
        slot_305_17_0 = math.min(170 + slot_305_16_0 * 27 + 50, slot_305_3_0 - 60)
        slot_305_18_0 = slot_305_4_0 - slot_305_15_0 / 2
        slot_305_19_0 = slot_305_5_0 - slot_305_17_0 / 2
        slot_305_20_1 = math.min(1, slot_305_0_0 / 0.55)
        slot_305_20_0 = 1 - (1 - slot_305_20_1) * (1 - slot_305_20_1) * (1 - slot_305_20_1)
        slot_305_21_0 = slot_305_19_0 + (1 - slot_305_20_0) * 60
        slot_305_22_0 = math.floor(slot_305_20_0 * 255)
        slot_305_23_0 = theme and theme.colors and theme.colors.accent or draw.color(80, 140, 255, 255)

        slot_305_1_0:add_rect_filled_rounded(draw.rect(slot_305_18_0 + 4, slot_305_21_0 + 6, slot_305_18_0 + slot_305_15_0 + 4, slot_305_21_0 + slot_305_17_0 + 6), draw.color(0, 0, 0, math.floor(slot_305_20_0 * 120)), 12)
        slot_305_1_0:add_rect_filled_rounded(draw.rect(slot_305_18_0, slot_305_21_0, slot_305_18_0 + slot_305_15_0, slot_305_21_0 + slot_305_17_0), draw.color(12, 14, 20, math.floor(slot_305_20_0 * 248)), 12)
        slot_305_1_0:add_rect_rounded(draw.rect(slot_305_18_0, slot_305_21_0, slot_305_18_0 + slot_305_15_0, slot_305_21_0 + slot_305_17_0), slot_305_23_0:mod_a(math.floor(slot_305_20_0 * 100)), 12, 1)
        slot_305_1_0:override_clip_rect(draw.rect(slot_305_18_0, slot_305_21_0, slot_305_18_0 + slot_305_15_0, slot_305_21_0 + slot_305_17_0), true)

        slot_305_24_0 = slot_305_18_0 + 28
        slot_305_25_5 = slot_305_21_0 + 24
        slot_305_26_0 = theme.fonts.content_title

        if not slot_305_26_0 then
                return
        end

        slot_305_1_0.font = slot_305_26_0

        slot_305_1_0:add_text(draw.vec2(slot_305_24_0, slot_305_25_5), "Tueurs", draw.color(255, 255, 255, slot_305_22_0))

        slot_305_27_0 = slot_305_26_0:get_text_size("Tueurs").x

        slot_305_1_0:add_text(draw.vec2(slot_305_24_0 + slot_305_27_0, slot_305_25_5), ".New", slot_305_23_0:mod_a(slot_305_22_0))

        slot_305_28_0 = slot_305_26_0:get_text_size("Tueurs.New").x
        draw.surface.font = theme.fonts.small
        slot_305_29_0 = slot_305_24_0 + slot_305_28_0 + 12
        slot_305_30_0 = slot_305_25_5 + 4

        slot_305_1_0:add_rect_filled_rounded(draw.rect(slot_305_29_0, slot_305_30_0, slot_305_29_0 + 40, slot_305_30_0 + 18), slot_305_23_0:mod_a(math.floor(slot_305_20_0 * 200)), 5)
        slot_305_1_0:add_text(draw.vec2(slot_305_29_0 + 6, slot_305_30_0 + 1), "FREE", draw.color(255, 255, 255, slot_305_22_0))

        slot_305_25_4 = slot_305_25_5 + 40

        slot_305_1_0:add_rect_filled(draw.rect(slot_305_24_0, slot_305_25_4, slot_305_24_0 + slot_305_15_0 - 56, slot_305_25_4 + 1), draw.color(255, 255, 255, math.floor(slot_305_20_0 * 25)))

        slot_305_25_3 = slot_305_25_4 + 12
        slot_305_1_0.font = theme.fonts.small
        slot_305_31_0 = not slot_0_64_0()

        slot_305_1_0:add_text(draw.vec2(slot_305_24_0, slot_305_25_3), slot_305_31_0 and "AVISO IMPORTANTE" or "IMPORTANT NOTICE", draw.color(130, 140, 165, math.floor(slot_305_20_0 * 200)))

        slot_305_25_2 = slot_305_25_3 + 18

        slot_305_1_0:add_text(draw.vec2(slot_305_24_0, slot_305_25_2), slot_305_31_0 and "Versao gratuita com limitacoes" or "Free version limitations", draw.color(255, 255, 255, slot_305_22_0))

        slot_305_25_1 = slot_305_25_2 + 30

        slot_305_1_0:add_text(draw.vec2(slot_305_24_0, slot_305_25_1), slot_305_31_0 and "FUNCOES BLOQUEADAS (DISPONIVEL NA PRO):" or "LOCKED FEATURES (AVAILABLE IN PRO):", slot_305_23_0:mod_a(slot_305_22_0))

        slot_305_25_0 = slot_305_25_1 + 20
        slot_305_32_0 = 27
        slot_305_33_0 = math.floor((slot_305_21_0 + slot_305_17_0 - 50 - slot_305_25_0) / slot_305_32_0)

        for iter_305_5, iter_305_6 in ipairs(G.changelog_state.features) do
                if slot_305_33_0 < iter_305_5 then
                        break
                end

                slot_305_39_1 = iter_305_6[1]
                slot_305_40_1 = slot_305_31_0 and iter_305_6.pt or iter_305_6.en
                slot_305_41_1 = 0.5 + (iter_305_5 - 1) * 0.07

                if slot_305_41_1 < slot_305_0_0 then
                        slot_305_42_1 = math.min(1, (slot_305_0_0 - slot_305_41_1) * 5)
                        slot_305_43_1 = math.floor((1 - slot_305_42_1) * 18)
                        slot_305_44_1 = math.floor(slot_305_42_1 * slot_305_20_0 * 230)
                        slot_305_45_1 = nil
                        slot_305_46_1 = nil
                        slot_305_47_0 = nil
                        slot_305_48_0 = slot_305_39_1

                        if slot_305_39_1 == "LOCKED" then
                                slot_305_45_1, slot_305_46_1, slot_305_47_0 = 255, 60, 60
                        elseif slot_305_39_1 == "INFO" then
                                slot_305_45_1, slot_305_46_1, slot_305_47_0 = 60, 180, 255
                        end

                        slot_305_49_0 = slot_305_39_1 == "LOCKED" and 45 or 34

                        slot_305_1_0:add_rect_filled_rounded(draw.rect(slot_305_24_0 + slot_305_43_1, slot_305_25_0 + 3, slot_305_24_0 + slot_305_43_1 + slot_305_49_0, slot_305_25_0 + 19), draw.color(slot_305_45_1, slot_305_46_1, slot_305_47_0, math.floor(slot_305_44_1 * 0.22)), 3)

                        slot_305_1_0.font = theme.fonts.small
                        slot_305_50_0 = theme.fonts.small:get_text_size(slot_305_48_0).x

                        slot_305_1_0:add_text(draw.vec2(slot_305_24_0 + slot_305_43_1 + (slot_305_49_0 - slot_305_50_0) / 2, slot_305_25_0 + 2), slot_305_48_0, draw.color(slot_305_45_1, slot_305_46_1, slot_305_47_0, slot_305_44_1))
                        slot_305_1_0:add_text(draw.vec2(slot_305_24_0 + slot_305_43_1 + slot_305_49_0 + 8, slot_305_25_0 + 2), slot_305_40_1, draw.color(210, 215, 228, math.floor(slot_305_44_1 * 0.9)))
                end

                slot_305_25_0 = slot_305_25_0 + slot_305_32_0
        end

        slot_305_34_0 = 15
        slot_305_35_0 = math.max(0, slot_305_34_0 - slot_305_0_0)
        slot_305_36_0 = math.ceil(slot_305_35_0)
        slot_305_37_0 = 120
        slot_305_38_0 = 28
        slot_305_39_0 = slot_305_18_0 + (slot_305_15_0 - slot_305_37_0) / 2
        slot_305_40_0 = slot_305_21_0 + slot_305_17_0 - 42
        slot_305_41_0 = slot_305_39_0 <= slot_305_7_0 and slot_305_7_0 <= slot_305_39_0 + slot_305_37_0 and slot_305_40_0 <= slot_305_8_0 and slot_305_8_0 <= slot_305_40_0 + slot_305_38_0
        slot_305_42_0 = slot_305_41_0 and math.floor(slot_305_20_0 * 200) or math.floor(slot_305_20_0 * 120)

        slot_305_1_0:add_rect_filled_rounded(draw.rect(slot_305_39_0, slot_305_40_0, slot_305_39_0 + slot_305_37_0, slot_305_40_0 + slot_305_38_0), slot_305_23_0:mod_a(slot_305_42_0), 7)

        if slot_305_41_0 then
                slot_305_1_0:add_rect_rounded(draw.rect(slot_305_39_0, slot_305_40_0, slot_305_39_0 + slot_305_37_0, slot_305_40_0 + slot_305_38_0), draw.color(255, 255, 255, math.floor(slot_305_20_0 * 100)), 7, 1)
        end

        slot_305_1_0.font = theme.fonts.small
        slot_305_43_0 = "Continuar  (" .. tostring(slot_305_36_0) .. "s)"

        if not slot_305_31_0 then
                slot_305_43_0 = "Continue  (" .. tostring(slot_305_36_0) .. "s)"
        end

        slot_305_44_0 = theme.fonts.small:get_text_size(slot_305_43_0).x

        slot_305_1_0:add_text(draw.vec2(slot_305_39_0 + (slot_305_37_0 - slot_305_44_0) / 2, slot_305_40_0 + 5), slot_305_43_0, draw.color(255, 255, 255, math.floor(slot_305_20_0 * 255)))
        slot_305_1_0:override_clip_rect(nil)

        slot_305_45_0 = bit.band(_cl_gask(36) or 0, 32768) ~= 0
        slot_305_46_0 = slot_305_41_0 and slot_305_10_0

        if slot_305_34_0 <= slot_305_0_0 or slot_305_45_0 or slot_305_46_0 then
                G.changelog_state.active = false
                G.changelog_state.dismissed = true
                menu_open = true

                if game.engine and game.engine.client_cmd then
                        game.engine:client_cmd("play buttons/blip1")
                end
        end
end

events.present_queue:add(function()
        if G.render_changelog then
                G.render_changelog()
        end
end)
