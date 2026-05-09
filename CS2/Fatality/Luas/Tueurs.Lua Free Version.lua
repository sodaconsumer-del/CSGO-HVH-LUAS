--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not pcall then
        function pcall(arg_1_0, ...)
                return arg_1_0(...)
        end
end

slot_0_0_0 = {}
slot_0_0_0.__index = slot_0_0_0

function slot_0_0_0.new(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5, arg_2_6, arg_2_7)
        local var_2_0 = {
                exit_direction = "left",
                opacity = 255,
                animation_progress = 0,
                animation_duration = 0.5,
                exit_duration = 1,
                exit_moving = false,
                visible = false,
                char = arg_2_1,
                final_pos = {
                        x = arg_2_2,
                        y = arg_2_3
                },
                current_pos = {
                        y = 0,
                        x = arg_2_2
                },
                animation_type = arg_2_4,
                delay = arg_2_5,
                color = {
                        b = 255,
                        r = 255,
                        g = 255
                },
                font = arg_2_6,
                screen_width = arg_2_7
        }

        if arg_2_4 == "fall" then
                var_2_0.current_pos.y = var_2_0.final_pos.y - 100
        else
                var_2_0.current_pos.y = var_2_0.final_pos.y + 100
        end

        if math.random() < 0.5 then
                var_2_0.exit_direction = "left"
        else
                var_2_0.exit_direction = "right"
        end

        setmetatable(var_2_0, slot_0_0_0)

        return var_2_0
end

function slot_0_0_0.update(arg_3_0, arg_3_1, arg_3_2)
        if not arg_3_0.start_time then
                arg_3_0.start_time = arg_3_1 + arg_3_0.delay
        end

        if arg_3_1 >= arg_3_0.start_time and arg_3_0.animation_progress < 1 then
                local var_3_0 = arg_3_1 - arg_3_0.start_time

                arg_3_0.animation_progress = math.min(var_3_0 / arg_3_0.animation_duration, 1)

                if arg_3_0.animation_type == "fall" then
                        arg_3_0.current_pos.y = arg_3_0.final_pos.y - 100 + 100 * arg_3_0.animation_progress
                else
                        arg_3_0.current_pos.y = arg_3_0.final_pos.y + 100 - 100 * arg_3_0.animation_progress
                end

                arg_3_0.visible = true
        end

        if arg_3_2 and not arg_3_0.exit_moving and arg_3_2 <= arg_3_1 then
                arg_3_0.exit_moving = true
                arg_3_0.exit_start_time = arg_3_1
        end

        if arg_3_0.exit_moving and arg_3_0.exit_start_time then
                local var_3_1 = arg_3_1 - arg_3_0.exit_start_time

                if var_3_1 < arg_3_0.exit_duration then
                        local var_3_2 = var_3_1 / arg_3_0.exit_duration
                        local var_3_3 = arg_3_0.screen_width * 0.3

                        if arg_3_0.exit_direction == "left" then
                                arg_3_0.current_pos.x = arg_3_0.final_pos.x - var_3_3 * var_3_2
                        else
                                arg_3_0.current_pos.x = arg_3_0.final_pos.x + var_3_3 * var_3_2
                        end
                else
                        arg_3_0.opacity = 0
                end
        end
end

function slot_0_0_0.draw(arg_4_0, arg_4_1, arg_4_2)
        if arg_4_0.visible and arg_4_0.opacity > 0 then
                local var_4_0 = 2
                local var_4_1 = math.fmod(arg_4_2 * var_4_0, 3)

                if var_4_1 < 1 then
                        arg_4_0.color = {
                                g = 0,
                                r = 255 * var_4_1,
                                b = 255 * (1 - var_4_1)
                        }
                elseif var_4_1 < 2 then
                        var_4_1 = var_4_1 - 1
                        arg_4_0.color = {
                                r = 255,
                                g = 255 * var_4_1,
                                b = 255 * var_4_1
                        }
                else
                        local var_4_2 = var_4_1 - 2

                        arg_4_0.color = {
                                b = 255,
                                r = 255 * (1 - var_4_2),
                                g = 255 * var_4_2
                        }
                end

                local var_4_3 = {
                        {
                                y = -1,
                                x = -1
                        },
                        {
                                y = 0,
                                x = -1
                        },
                        {
                                y = 1,
                                x = -1
                        },
                        {
                                y = -1,
                                x = 0
                        },
                        {
                                y = 1,
                                x = 0
                        },
                        {
                                y = -1,
                                x = 1
                        },
                        {
                                y = 0,
                                x = 1
                        },
                        {
                                y = 1,
                                x = 1
                        }
                }

                for iter_4_0, iter_4_1 in ipairs(var_4_3) do
                        local var_4_4 = draw.vec2(arg_4_0.current_pos.x + iter_4_1.x, arg_4_0.current_pos.y + iter_4_1.y)

                        arg_4_1:add_text(var_4_4, arg_4_0.char, draw.color(0, 0, 0), arg_4_0.font)
                end

                local var_4_5 = math.floor(arg_4_0.color.r)
                local var_4_6 = math.floor(arg_4_0.color.g)
                local var_4_7 = math.floor(arg_4_0.color.b)
                local var_4_8 = draw.vec2(arg_4_0.current_pos.x, arg_4_0.current_pos.y)

                arg_4_1:add_text(var_4_8, arg_4_0.char, draw.color(var_4_5, var_4_6, var_4_7), arg_4_0.font)
        end
end

slot_0_1_0 = {}
slot_0_1_0.__index = slot_0_1_0

function slot_0_1_0.new(arg_5_0)
        local var_5_0 = {
                developed_start_time = nil,
                developed_text_opacity = 0,
                phase = 1,
                sh = 0,
                sw = 0,
                phase_message_printed = false,
                developed_hold_time = 3,
                letters = {}
        }

        setmetatable(var_5_0, slot_0_1_0)

        return var_5_0
end

function slot_0_1_0.initialize(arg_6_0, arg_6_1, arg_6_2)
        arg_6_0.sw = arg_6_1
        arg_6_0.sh = arg_6_2
        arg_6_0.start_time = game.global_vars.real_time

        local var_6_0 = "Welcome to Tueurs.lua"
        local var_6_1 = 40
        local var_6_2 = draw.font("Arial", var_6_1, draw.font_flags.outline)
        local var_6_3 = var_6_1 * 0.6
        local var_6_4 = (arg_6_1 - #var_6_0 * var_6_3) / 2
        local var_6_5 = arg_6_2 / 2 - 50
        local var_6_6 = 0.05
        local var_6_7 = {
                "fall",
                "rise"
        }
        local var_6_8 = 1
        local var_6_9 = var_6_4

        for iter_6_0 = 1, #var_6_0 do
                local var_6_10 = var_6_0:sub(iter_6_0, iter_6_0)
                local var_6_11 = var_6_7[var_6_8]

                var_6_8 = var_6_8 + 1

                if var_6_8 > #var_6_7 then
                        var_6_8 = 1
                end

                local var_6_12 = (iter_6_0 - 1) * var_6_6
                local var_6_13 = slot_0_0_0:new(var_6_10, var_6_9, var_6_5, var_6_11, var_6_12, var_6_2, arg_6_0.sw)

                table.insert(arg_6_0.letters, var_6_13)

                var_6_9 = var_6_9 + var_6_3
        end
end

function slot_0_1_0.update(arg_7_0, arg_7_1)
        if arg_7_0.phase == 1 then
                local var_7_0 = arg_7_0.start_time + 3

                for iter_7_0, iter_7_1 in ipairs(arg_7_0.letters) do
                        iter_7_1:update(arg_7_1, var_7_0)
                end

                local var_7_1 = true

                for iter_7_2, iter_7_3 in ipairs(arg_7_0.letters) do
                        if iter_7_3.opacity > 0 then
                                var_7_1 = false

                                break
                        end
                end

                if var_7_1 then
                        arg_7_0.phase = 2
                        arg_7_0.developed_start_time = arg_7_1
                end
        elseif arg_7_0.phase == 2 then
                local var_7_2 = arg_7_1 - arg_7_0.developed_start_time

                if arg_7_0.developed_text_opacity < 255 then
                        arg_7_0.developed_text_opacity = math.min(var_7_2 * 255, 255)
                end

                if arg_7_0.developed_text_opacity >= 255 then
                        if not arg_7_0.text_hold_start_time then
                                arg_7_0.text_hold_start_time = arg_7_1
                        elseif arg_7_1 - arg_7_0.text_hold_start_time >= arg_7_0.developed_hold_time then
                                arg_7_0.phase = 3

                                if not arg_7_0.phase_message_printed then
                                        arg_7_0.phase_message_printed = true
                                end
                        end
                end
        end
end

function slot_0_1_0.draw(arg_8_0, arg_8_1, arg_8_2)
        if arg_8_0.phase == 1 then
                for iter_8_0, iter_8_1 in ipairs(arg_8_0.letters) do
                        iter_8_1:draw(arg_8_1, arg_8_2)
                end
        else
                arg_8_0:draw_dev_text(arg_8_1)
        end
end

function slot_0_1_0.draw_dev_text(arg_9_0, arg_9_1)
        local var_9_0 = "Developed By Lukinhas"
        local var_9_1 = draw.font("Arial", 24, draw.font_flags.outline)
        local var_9_2 = draw.color(255, 0, 0)
        local var_9_3 = 14.399999999999999 * #var_9_0
        local var_9_4 = (arg_9_0.sw - var_9_3) / 2
        local var_9_5 = arg_9_0.sh / 2 + 150
        local var_9_6 = {
                {
                        y = -1,
                        x = -1
                },
                {
                        y = 0,
                        x = -1
                },
                {
                        y = 1,
                        x = -1
                },
                {
                        y = -1,
                        x = 0
                },
                {
                        y = 1,
                        x = 0
                },
                {
                        y = -1,
                        x = 1
                },
                {
                        y = 0,
                        x = 1
                },
                {
                        y = 1,
                        x = 1
                }
        }

        for iter_9_0, iter_9_1 in ipairs(var_9_6) do
                local var_9_7 = draw.vec2(var_9_4 + iter_9_1.x, var_9_5 + iter_9_1.y)

                arg_9_1:add_text(var_9_7, var_9_0, draw.color(0, 0, 0), var_9_1)
        end

        local var_9_8 = draw.vec2(var_9_4, var_9_5)

        arg_9_1:add_text(var_9_8, var_9_0, var_9_2, var_9_1)
end

slot_0_2_0 = nil
slot_0_3_0 = false

function slot_0_4_0()
        if not slot_0_3_0 then
                local var_10_0, var_10_1 = game.engine:get_screen_size()

                slot_0_2_0 = slot_0_1_0:new()

                slot_0_2_0:initialize(var_10_0, var_10_1)

                slot_0_3_0 = true
        end

        if slot_0_2_0 then
                local var_10_2 = game.global_vars.real_time

                slot_0_2_0:update(var_10_2)
                slot_0_2_0:draw(draw.surface, var_10_2)

                if slot_0_2_0.phase == 3 then
                        slot_0_2_0 = nil
                end
        end
end

events.present_queue:add(function()
        if game.engine:in_game() then
                slot_0_4_0()
        end
end)

slot_0_5_0 = nil
slot_0_6_1 = utils.find_export("user32.dll", "GetAsyncKeyState")

if slot_0_6_1 then
        slot_0_5_0 = ffi.cast("short(__stdcall*)(int)", slot_0_6_1)
else
        print("[Error] Falhou ao mapear GetAsyncKeyState.")
end

function slot_0_6_0(arg_12_0, arg_12_1, arg_12_2)
        gui.notify:add(gui.notification(arg_12_0, arg_12_1, arg_12_2, 6))
end

if not ffi then
        return slot_0_6_0("WARNING!", "ALLOW INSECURE deve estar ON!", draw.textures.icon_allow_insecure)
end

ffi.cdef("typedef struct _SYSTEMTIME {\n  unsigned short wYear;\n  unsigned short wMonth;\n  unsigned short wDayOfWeek;\n  unsigned short wDay;\n  unsigned short wHour;\n  unsigned short wMinute;\n  unsigned short wSecond;\n  unsigned short wMilliseconds;\n} SYSTEMTIME;\n")

slot_0_7_0 = utils.find_export("msvcrt.dll", "fopen")
slot_0_8_0 = utils.find_export("msvcrt.dll", "fclose")
slot_0_9_0 = utils.find_export("msvcrt.dll", "fseek")
slot_0_10_0 = utils.find_export("msvcrt.dll", "ftell")
slot_0_11_0 = utils.find_export("msvcrt.dll", "fread")
slot_0_12_0 = ffi.cast("void*(__stdcall*)(const char*,const char*)", slot_0_7_0)
slot_0_13_0 = ffi.cast("int(__stdcall*)(void*)", slot_0_8_0)
slot_0_14_0 = ffi.cast("int(__stdcall*)(void*,long,int)", slot_0_9_0)
slot_0_15_0 = ffi.cast("long(__stdcall*)(void*)", slot_0_10_0)
slot_0_16_0 = ffi.cast("size_t(__stdcall*)(void*,size_t,size_t,void*)", slot_0_11_0)
slot_0_17_0 = 0
slot_0_18_0 = 2

function slot_0_19_0(arg_13_0)
        local var_13_0 = slot_0_12_0(arg_13_0, "rb")

        if var_13_0 == nil then
                return nil, "Failed to open: " .. arg_13_0
        end

        slot_0_14_0(var_13_0, 0, slot_0_18_0)

        local var_13_1 = slot_0_15_0(var_13_0)

        slot_0_14_0(var_13_0, 0, slot_0_17_0)

        local var_13_2 = ffi.new("char[?]", var_13_1 + 1)
        local var_13_3 = slot_0_16_0(var_13_2, 1, var_13_1, var_13_0)

        slot_0_13_0(var_13_0)

        if var_13_3 ~= var_13_1 then
                return nil, "Mismatch read"
        end

        var_13_2[var_13_1] = 0

        return ffi.string(var_13_2, var_13_1)
end

G = G or {}
G.script_version = "Free"
G.groupA = gui.ctx:find("lua>elements a")
G.groupB = gui.ctx:find("lua>elements b")

if not G.groupA or not G.groupB then
        print("[Error] groupA or groupB not found.")

        return
end

G.messagesENG = {}
G.messagesBR = {}
G.messagesRU = {}
G.decks = {
        ENG = {},
        BR = {},
        RU = {}
}

function G.load_killsays(arg_14_0)
        local var_14_0, var_14_1 = slot_0_19_0(arg_14_0)

        if not var_14_0 then
                print("Fail killsays:", var_14_1)

                return
        end

        G.messagesENG, G.messagesBR, G.messagesRU = {}, {}, {}

        local var_14_2

        for iter_14_0 in var_14_0:gmatch("([^\r\n]+)") do
                iter_14_0 = iter_14_0:match("^%s*(.-)%s*$")

                if iter_14_0:match("^%[ENG%]") then
                        var_14_2 = "ENG"
                elseif iter_14_0:match("^%[BR%]") then
                        var_14_2 = "BR"
                elseif iter_14_0:match("^%[RU%]") then
                        var_14_2 = "RU"
                elseif #iter_14_0 > 0 then
                        if var_14_2 == "ENG" then
                                table.insert(G.messagesENG, iter_14_0)
                        elseif var_14_2 == "BR" then
                                table.insert(G.messagesBR, iter_14_0)
                        elseif var_14_2 == "RU" then
                                table.insert(G.messagesRU, iter_14_0)
                        end
                end
        end

        G.decks = {
                ENG = {},
                BR = {},
                RU = {}
        }

        print("Killsays loaded from", arg_14_0)
end

function G.load_waypoints_from_txt(arg_15_0)
        local var_15_0, var_15_1 = slot_0_19_0(arg_15_0)

        if not var_15_0 then
                print("Fail wps:", var_15_1)

                return
        end

        G.waypoints = {}

        for iter_15_0 in var_15_0:gmatch("([^\r\n]+)") do
                local var_15_2 = {}

                for iter_15_1 in iter_15_0:gmatch("[^;]+") do
                        local var_15_3, var_15_4 = iter_15_1:match("([^=]+)=([^=]+)")

                        if var_15_3 and var_15_4 then
                                var_15_2[var_15_3] = var_15_4
                        end
                end

                local var_15_5 = tonumber(var_15_2.x) or 0
                local var_15_6 = tonumber(var_15_2.y) or 0
                local var_15_7 = tonumber(var_15_2.z) or 0

                table.insert(G.waypoints, {
                        label = var_15_2.label or "NoLabel",
                        map = var_15_2.map or "UnknownMap",
                        pos = vector(var_15_5, var_15_6, var_15_7)
                })
        end

        print("Waypoints loaded from", arg_15_0)
end

G.combo_box = gui.combo_box(gui.control_id("lua>tabselect_main"))
G.combo_box.allow_multiple = false

G.combo_box:reset()
G.combo_box:add(gui.selectable(gui.control_id("info_tab"), "Info"))
G.combo_box:add(gui.selectable(gui.control_id("killsay_tab"), "Killsay"))
G.combo_box:add(gui.selectable(gui.control_id("wp_tab"), "Waypoints"))

slot_0_20_0 = gui.make_control("[TU] Tab Selection", G.combo_box)

G.groupB:add(slot_0_20_0)
G.groupB:reset()

G.current_tab_mode = 1
G.info_title = gui.label(gui.control_id("info_title"), "Tueurs.Lua")
G.version_lbl = gui.label(gui.control_id("version_label"), "Version: " .. G.script_version)
G.update_lbl = gui.label(gui.control_id("update_label"), "Last update: 16/03/25")
G.custom_lbl1 = gui.label(gui.control_id("lbl1"), "Developed by Lukinhas")
G.custom_lbl2 = gui.label(gui.control_id("lbl2"), "Discord.gg/tueurs for help")

G.groupA:add(G.info_title)
G.groupA:reset()
G.groupA:add(G.version_lbl)
G.groupA:reset()
G.groupA:add(G.update_lbl)
G.groupA:reset()
G.groupA:add(G.custom_lbl1)
G.groupA:reset()
G.groupA:add(G.custom_lbl2)
G.groupA:reset()

G.top_spacing_slider = gui.slider(gui.control_id("info_topspace_slider"), 0, 300, 0)
slot_0_21_0 = gui.make_control("[TU] Watermark Spacing", G.top_spacing_slider)

G.groupA:add(slot_0_21_0)
G.groupA:reset()

G.spacing_button = gui.button(gui.control_id("info_space_btn"), "Confirm Spacing")
slot_0_22_0 = gui.make_control("[TU] Apply Spacing", G.spacing_button)

G.groupA:add(slot_0_22_0)
G.groupA:reset()
G.spacing_button:add_callback(function()
        G.final_spacing_value = G.top_spacing_slider:get_value():get()

        gui.notify:add(gui.notification("Spacing", "Novo valor: " .. tostring(G.final_spacing_value)))
end)

slot_0_23_0 = bit or require("bit")
slot_0_24_0 = {
        "User",
        "FPS",
        "Ping"
}
G.selectedHUD = {
        User = true,
        Ping = true,
        FPS = true
}
G.hud_combo = gui.combo_box(gui.control_id("hud_combo multiple"))
G.hud_combo.allow_multiple = true

G.hud_combo:reset()

for iter_0_0, iter_0_1 in ipairs(slot_0_24_0) do
        G.hud_combo:add(gui.selectable(gui.control_id("hud_item_" .. iter_0_0), iter_0_1))
end

slot_0_25_0 = gui.make_control("[TU] Watermark Items", G.hud_combo)

G.groupA:add(slot_0_25_0)
G.groupA:reset()

slot_0_26_0 = nil

function slot_0_27_0(arg_17_0)
        if not slot_0_26_0 then
                slot_0_26_0 = arg_17_0

                return
        end

        local var_17_0 = slot_0_23_0.bxor(slot_0_26_0, arg_17_0)

        if var_17_0 == 0 then
                return
        end

        for iter_17_0, iter_17_1 in ipairs(slot_0_24_0) do
                local var_17_1 = 2^(iter_17_0 - 1)

                if slot_0_23_0.band(var_17_0, var_17_1) ~= 0 then
                        local var_17_2 = slot_0_23_0.band(arg_17_0, var_17_1) ~= 0

                        G.selectedHUD[iter_17_1] = var_17_2
                end
        end

        slot_0_26_0 = arg_17_0
end

G.hud_combo:add_callback(function()
        local var_18_0 = G.hud_combo:get_value()

        if var_18_0 then
                local var_18_1 = var_18_0:get()

                if var_18_1 and type(var_18_1.get_raw) == "function" then
                        local var_18_2 = tonumber(var_18_1:get_raw()) or 0

                        slot_0_27_0(var_18_2)
                end
        end
end)

G.chat_main = gui.checkbox(gui.control_id("chat_main"))
slot_0_28_0 = gui.make_control("[TU] Killsay Main", G.chat_main)

G.groupB:add(slot_0_28_0)
G.groupB:reset()

G.langENG = gui.checkbox(gui.control_id("killsay_eng"))
slot_0_29_0 = gui.make_control("|TU| ENG", G.langENG)

G.groupB:add(slot_0_29_0)
G.groupB:reset()

G.langBR = gui.checkbox(gui.control_id("killsay_br"))
slot_0_30_0 = gui.make_control("|TU| BR", G.langBR)

G.groupB:add(slot_0_30_0)
G.groupB:reset()

G.langRU = gui.checkbox(gui.control_id("killsay_ru"))
slot_0_31_0 = gui.make_control("|TU| RU", G.langRU)

G.groupB:add(slot_0_31_0)
G.groupB:reset()

function G.update_killsay_subcontrols()
        local var_19_0 = G.chat_main:get_value():get()

        G.langENG:set_visible(var_19_0)
        slot_0_29_0:set_visible(var_19_0)
        G.langBR:set_visible(var_19_0)
        slot_0_30_0:set_visible(var_19_0)
        G.langRU:set_visible(var_19_0)
        slot_0_31_0:set_visible(var_19_0)
end

G.chat_main:add_callback(function()
        pcall(G.update_killsay_subcontrols)
end)
G.update_killsay_subcontrols()

G.help_main = gui.checkbox(gui.control_id("help_main"))
slot_0_32_0 = gui.make_control("[TU] Waypoints Main", G.help_main)

G.groupA:add(slot_0_32_0)
G.groupA:reset()

G.enable_waypoints = gui.checkbox(gui.control_id("enable_wp_check"))
slot_0_33_0 = gui.make_control("|TU| Enable Waypoints", G.enable_waypoints)

G.groupA:add(slot_0_33_0)
G.groupA:reset()

G.wp_stars = gui.checkbox(gui.control_id("wp_stars_check"))
slot_0_34_0 = gui.make_control("|TU| Stars", G.wp_stars)

G.groupA:add(slot_0_34_0)
G.groupA:reset()

G.wp_circles = gui.checkbox(gui.control_id("wp_circles_check"))
slot_0_35_0 = gui.make_control("|TU| Circle", G.wp_circles)

G.groupA:add(slot_0_35_0)
G.groupA:reset()

G.wp_squares = gui.checkbox(gui.control_id("wp_squares_check"))
slot_0_36_0 = gui.make_control("|TU| square", G.wp_squares)

G.groupA:add(slot_0_36_0)
G.groupA:reset()

G.wp_triangle = gui.checkbox(gui.control_id("wp_triangle_check"))
slot_0_37_0 = gui.make_control("|TU| triangle", G.wp_triangle)

G.groupA:add(slot_0_37_0)
G.groupA:reset()

G.print_coords_cb = gui.checkbox(gui.control_id("print_coords_checkbox"))
slot_0_38_0 = gui.make_control("|TU| Print Coords", G.print_coords_cb)

G.groupA:add(slot_0_38_0)
G.groupA:reset()

G.cb_liner = gui.checkbox(gui.control_id("liner_checkbox"))
slot_0_39_0 = gui.make_control("|TU| Enable Liner", G.cb_liner)

G.groupA:add(slot_0_39_0)
G.groupA:reset()

G.wp_distance_slider = gui.slider(gui.control_id("wp_distance_slider"), 250, 3000, 250)
slot_0_40_0 = gui.make_control("|TU| WP Distance", G.wp_distance_slider)

G.groupB:add(slot_0_40_0)
G.groupB:reset()

G.wp_distance_button = gui.button(gui.control_id("wp_distance_button"), "Confirm Distance")
slot_0_41_0 = gui.make_control("|TU| Apply Dist", G.wp_distance_button)

G.groupB:add(slot_0_41_0)
G.groupB:reset()

function G.update_waypoints_sub()
        local var_21_0 = G.help_main:get_value():get()

        G.enable_waypoints:set_visible(var_21_0)
        slot_0_33_0:set_visible(var_21_0)
        G.wp_stars:set_visible(var_21_0)
        slot_0_34_0:set_visible(var_21_0)
        G.wp_circles:set_visible(var_21_0)
        slot_0_35_0:set_visible(var_21_0)
        G.wp_squares:set_visible(var_21_0)
        slot_0_36_0:set_visible(var_21_0)
        G.wp_triangle:set_visible(var_21_0)
        slot_0_37_0:set_visible(var_21_0)
        G.print_coords_cb:set_visible(var_21_0)
        slot_0_38_0:set_visible(var_21_0)
        G.cb_liner:set_visible(var_21_0)
        slot_0_39_0:set_visible(var_21_0)

        if var_21_0 then
                G.wp_distance_slider:set_visible(true)
                slot_0_40_0:set_visible(true)
                G.wp_distance_button:set_visible(true)
                slot_0_41_0:set_visible(true)
        else
                G.wp_distance_slider:set_visible(false)
                slot_0_40_0:set_visible(false)
                G.wp_distance_button:set_visible(false)
                slot_0_41_0:set_visible(false)
        end
end

G.help_main:add_callback(function()
        pcall(G.update_waypoints_sub)
end)
G.update_waypoints_sub()

function G.update_mode_visibility(arg_23_0)
        G.current_tab_mode = arg_23_0
        slot_23_1_0 = arg_23_0 == 1
        slot_23_2_0 = arg_23_0 == 2
        slot_23_3_0 = arg_23_0 == 4

        G.info_title:set_visible(slot_23_1_0)
        G.version_lbl:set_visible(slot_23_1_0)
        G.update_lbl:set_visible(slot_23_1_0)
        G.custom_lbl1:set_visible(slot_23_1_0)
        G.custom_lbl2:set_visible(slot_23_1_0)

        if slot_23_1_0 then
                G.top_spacing_slider:set_visible(true)
                slot_0_21_0:set_visible(true)
                G.spacing_button:set_visible(true)
                slot_0_22_0:set_visible(true)
                slot_0_25_0:set_visible(true)
        else
                G.top_spacing_slider:set_visible(false)
                slot_0_21_0:set_visible(false)
                G.spacing_button:set_visible(false)
                slot_0_22_0:set_visible(false)
                slot_0_25_0:set_visible(false)
        end

        G.chat_main:set_visible(slot_23_2_0)
        slot_0_28_0:set_visible(slot_23_2_0)

        if slot_23_2_0 and G.chat_main:get_value():get() then
                G.langENG:set_visible(true)
                slot_0_29_0:set_visible(true)
                G.langBR:set_visible(true)
                slot_0_30_0:set_visible(true)
                G.langRU:set_visible(true)
                slot_0_31_0:set_visible(true)
        else
                G.langENG:set_visible(false)
                slot_0_29_0:set_visible(false)
                G.langBR:set_visible(false)
                slot_0_30_0:set_visible(false)
                G.langRU:set_visible(false)
                slot_0_31_0:set_visible(false)
        end

        if slot_23_3_0 then
                G.help_main:set_visible(true)
                slot_0_32_0:set_visible(true)
                G.update_waypoints_sub()
        else
                G.help_main:set_visible(false)
                slot_0_32_0:set_visible(false)
                G.enable_waypoints:set_visible(false)
                slot_0_33_0:set_visible(false)
                G.wp_stars:set_visible(false)
                slot_0_34_0:set_visible(false)
                G.wp_circles:set_visible(false)
                slot_0_35_0:set_visible(false)
                G.wp_squares:set_visible(false)
                slot_0_36_0:set_visible(false)
                G.wp_triangle:set_visible(false)
                slot_0_37_0:set_visible(false)
                G.print_coords_cb:set_visible(false)
                slot_0_38_0:set_visible(false)
                G.cb_liner:set_visible(false)
                slot_0_39_0:set_visible(false)
                G.wp_distance_slider:set_visible(false)
                slot_0_40_0:set_visible(false)
                G.wp_distance_button:set_visible(false)
                slot_0_41_0:set_visible(false)
        end
end

G.combo_box:add_callback(function()
        local var_24_0 = tonumber(G.combo_box:get_value():get():get_raw()) or 1

        G.update_mode_visibility(var_24_0)
end)
G.update_mode_visibility(1)

function slot_0_42_0(arg_25_0, arg_25_1, arg_25_2)
        local var_25_0 = draw.font("Arial", 14, draw.font_flags.outline)

        arg_25_0:add_text(draw.vec2(20, arg_25_2 - 40), "Discord/tueurs", draw.color(0, 180, 255), var_25_0)
end

G.frame_rate = 0
G.framerate = 1
G.last_fps_update = 0

function G.get_abs_fps()
        local var_26_0 = game.global_vars.real_time

        if var_26_0 - G.last_fps_update >= 0.25 then
                local var_26_1 = game.global_vars.frame_time

                if var_26_1 > 0 then
                        G.frame_rate = 0.9 * G.frame_rate + 0.1 * var_26_1
                        G.framerate = math.floor(1 / G.frame_rate + 0.5)
                else
                        G.framerate = 0
                end

                G.last_fps_update = var_26_0
        end

        return G.framerate
end

function slot_0_43_0(arg_27_0)
        if arg_27_0 <= 25 then
                return draw.color(0, 255, 0)
        elseif arg_27_0 <= 70 then
                return draw.color(255, 255, 0)
        else
                return draw.color(255, 0, 0)
        end
end

function slot_0_44_0(arg_28_0)
        if arg_28_0 <= 60 then
                return draw.color(255, 0, 0)
        elseif arg_28_0 <= 150 then
                return draw.color(255, 255, 0)
        else
                return draw.color(0, 255, 0)
        end
end

function slot_0_45_0(arg_29_0, arg_29_1, arg_29_2)
        local var_29_0 = (math.sin(arg_29_0 * 2) + 1) / 2
        local var_29_1 = math.floor(arg_29_1.r * var_29_0 + arg_29_2.r * (1 - var_29_0))
        local var_29_2 = math.floor(arg_29_1.g * var_29_0 + arg_29_2.g * (1 - var_29_0))
        local var_29_3 = math.floor(arg_29_1.b * var_29_0 + arg_29_2.b * (1 - var_29_0))

        return draw.color(var_29_1, var_29_2, var_29_3)
end

function G.draw_info_hud()
        local var_30_0 = draw.surface
        local var_30_1 = draw.font("Arial", 18, draw.font_flags.outline)
        local var_30_2, var_30_3 = game.engine:get_screen_size()
        local var_30_4 = G.get_abs_fps()
        local var_30_5 = 0
        local var_30_6 = game.engine:get_netchan()

        if var_30_6 and not var_30_6:is_null() then
                var_30_5 = math.floor(var_30_6:get_latency() * 1000)
        end

        local var_30_7 = gui.ctx.user and gui.ctx.user.username or "<empty>"
        local var_30_8 = game.global_vars.real_time
        local var_30_9 = slot_0_45_0(var_30_8, {
                b = 255,
                r = 255,
                g = 255
        }, {
                b = 128,
                r = 128,
                g = 0
        })
        local var_30_10 = {
                {
                        text = "Tueurs.Lua v" .. G.script_version,
                        color = draw.color(128, 0, 128),
                        spacing = 120 + (G.final_spacing_value or 0)
                }
        }

        if G.selectedHUD.User then
                table.insert(var_30_10, {
                        text = var_30_7,
                        color = var_30_9,
                        spacing = 100 + (G.final_spacing_value or 0)
                })
        end

        if G.selectedHUD.FPS then
                table.insert(var_30_10, {
                        text = "FPS: " .. tostring(var_30_4),
                        color = slot_0_44_0(var_30_4),
                        spacing = 90 + (G.final_spacing_value or 0)
                })
        end

        if G.selectedHUD.Ping then
                table.insert(var_30_10, {
                        text = "Ping: " .. tostring(var_30_5) .. "ms",
                        color = slot_0_43_0(var_30_5),
                        spacing = 100 + (G.final_spacing_value or 0)
                })
        end

        local var_30_11 = 20

        for iter_30_0, iter_30_1 in ipairs(var_30_10) do
                var_30_11 = var_30_11 + iter_30_1.spacing
        end

        local var_30_12 = var_30_11
        local var_30_13 = 40
        local var_30_14 = var_30_2 - var_30_12 - 20
        local var_30_15 = 20
        local var_30_16 = draw.color(20, 20, 20)
        local var_30_17 = draw.color(0, 255, 127)

        var_30_0:add_rect_filled(draw.rect(var_30_14, var_30_15, var_30_14 + var_30_12, var_30_15 + var_30_13), var_30_16)
        var_30_0:add_rect(draw.rect(var_30_14, var_30_15, var_30_14 + var_30_12, var_30_15 + var_30_13), var_30_17)

        local var_30_18 = var_30_14 + 10

        for iter_30_2, iter_30_3 in ipairs(var_30_10) do
                var_30_0:add_text(draw.vec2(var_30_18, var_30_15 + 10), iter_30_3.text, iter_30_3.color, var_30_1)

                var_30_18 = var_30_18 + iter_30_3.spacing
        end

        slot_0_42_0(var_30_0, var_30_2, var_30_3)
end

events.present_queue:add(function()
        if game.engine:in_game() then
                G.draw_info_hud()
        end
end)

function slot_0_46_0(arg_32_0)
        local var_32_0 = {}

        for iter_32_0, iter_32_1 in ipairs(arg_32_0) do
                table.insert(var_32_0, math.random(1, #var_32_0 + 1), iter_32_1)
        end

        return var_32_0
end

function G.get_next_message(arg_33_0)
        if arg_33_0 == "ENG" then
                if #G.decks.ENG == 0 then
                        G.decks.ENG = slot_0_46_0(G.messagesENG)
                end

                return table.remove(G.decks.ENG, 1)
        elseif arg_33_0 == "BR" then
                if #G.decks.BR == 0 then
                        G.decks.BR = slot_0_46_0(G.messagesBR)
                end

                return table.remove(G.decks.BR, 1)
        elseif arg_33_0 == "RU" then
                if #G.decks.RU == 0 then
                        G.decks.RU = slot_0_46_0(G.messagesRU)
                end

                return table.remove(G.decks.RU, 1)
        end

        return "???"
end

events.event:add(function(arg_34_0)
        if arg_34_0:get_name() == "player_hurt" then
                local var_34_0 = arg_34_0:get_int("health")
                local var_34_1 = arg_34_0:get_pawn_from_id("attacker")
                local var_34_2 = arg_34_0:get_pawn_from_id("userid")
                local var_34_3 = entities.get_local_pawn()

                if not var_34_3 then
                        return
                end

                if slot_0_5_0 and slot_0_5_0(2) ~= 0 then
                        return
                end

                if var_34_2 == var_34_3 or not var_34_2 or not var_34_2:is_enemy() then
                        return
                end

                if arg_34_0:get_int("dmg_health") == 0 then
                        return
                end

                if var_34_0 == 0 and var_34_1 and var_34_1 == var_34_3 then
                        if not G.chat_main or not G.chat_main:get_value():get() then
                                return
                        end

                        local var_34_4

                        if G.langBR and G.langBR:get_value():get() then
                                var_34_4 = "BR"
                        elseif G.langRU and G.langRU:get_value():get() then
                                var_34_4 = "RU"
                        elseif G.langENG and G.langENG:get_value():get() then
                                var_34_4 = "ENG"
                        end

                        if var_34_4 then
                                local var_34_5 = G.get_next_message(var_34_4)

                                if var_34_5 and var_34_5 ~= "" then
                                        game.engine:client_cmd("say " .. var_34_5)
                                end
                        end
                end
        end
end)

function slot_0_47_0(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
        if arg_35_1 == "local" then
                local var_35_0 = 0
                local var_35_1 = 0

                for iter_35_0, iter_35_1 in ipairs(arg_35_2) do
                        var_35_0 = var_35_0 + iter_35_1.x
                        var_35_1 = var_35_1 + iter_35_1.y
                end

                local var_35_2 = var_35_0 / #arg_35_2
                local var_35_3 = var_35_1 / #arg_35_2
                local var_35_4 = draw.vec2(var_35_2, var_35_3)

                for iter_35_2 = 1, #arg_35_2 do
                        arg_35_0:add_line(var_35_4, arg_35_2[iter_35_2], arg_35_3, 1)
                end
        end
end

function slot_0_48_0(arg_36_0, arg_36_1, arg_36_2)
        for iter_36_0 = 1, #arg_36_1 do
                local var_36_0 = iter_36_0 % #arg_36_1 + 1

                arg_36_0:add_line(arg_36_1[iter_36_0], arg_36_1[var_36_0], draw.color(0, 0, 0), 2)
                arg_36_0:add_line(arg_36_1[iter_36_0], arg_36_1[var_36_0], arg_36_2, 1)
        end
end

function slot_0_49_0(arg_37_0, arg_37_1)
        local var_37_0 = math.pi
        local var_37_1 = {}
        local var_37_2 = arg_37_1 * 0.5

        for iter_37_0 = 0, 4 do
                local var_37_3 = iter_37_0 * 2 * var_37_0 / 5 - var_37_0 / 2
                local var_37_4 = (iter_37_0 + 0.5) * 2 * var_37_0 / 5 - var_37_0 / 2
                local var_37_5 = arg_37_0.x + arg_37_1 * math.cos(var_37_3)
                local var_37_6 = arg_37_0.y + arg_37_1 * math.sin(var_37_3)

                table.insert(var_37_1, draw.vec2(var_37_5, var_37_6))

                local var_37_7 = arg_37_0.x + var_37_2 * math.cos(var_37_4)
                local var_37_8 = arg_37_0.y + var_37_2 * math.sin(var_37_4)

                table.insert(var_37_1, draw.vec2(var_37_7, var_37_8))
        end

        return var_37_1
end

function slot_0_50_0(arg_38_0, arg_38_1)
        local var_38_0 = 16
        local var_38_1 = {}

        for iter_38_0 = 0, var_38_0 - 1 do
                local var_38_2 = iter_38_0 / var_38_0 * (2 * math.pi)
                local var_38_3 = arg_38_0.x + arg_38_1 * math.cos(var_38_2)
                local var_38_4 = arg_38_0.y + arg_38_1 * math.sin(var_38_2)

                table.insert(var_38_1, draw.vec2(var_38_3, var_38_4))
        end

        return var_38_1
end

function slot_0_51_0(arg_39_0, arg_39_1)
        local var_39_0 = arg_39_1 / 2

        return {
                draw.vec2(arg_39_0.x - var_39_0, arg_39_0.y - var_39_0),
                draw.vec2(arg_39_0.x + var_39_0, arg_39_0.y - var_39_0),
                draw.vec2(arg_39_0.x + var_39_0, arg_39_0.y + var_39_0),
                draw.vec2(arg_39_0.x - var_39_0, arg_39_0.y + var_39_0)
        }
end

function slot_0_52_0(arg_40_0, arg_40_1)
        local var_40_0 = arg_40_1 / 2
        local var_40_1 = draw.vec2(arg_40_0.x, arg_40_0.y - var_40_0)
        local var_40_2 = draw.vec2(arg_40_0.x - var_40_0, arg_40_0.y + var_40_0 / 1.2)
        local var_40_3 = draw.vec2(arg_40_0.x + var_40_0, arg_40_0.y + var_40_0 / 1.2)

        return {
                var_40_1,
                var_40_2,
                var_40_3
        }
end

function slot_0_53_0(arg_41_0)
        local var_41_0 = false
        local var_41_1 = false
        local var_41_2 = entities.get_local_pawn()

        if var_41_2 and var_41_2:get_abs_origin():dist(arg_41_0) < 50 then
                var_41_0 = true
        end

        entities.players:for_each(function(arg_42_0)
                if arg_42_0.entity and arg_42_0.entity:is_alive() and arg_42_0.entity:is_enemy() and arg_42_0.entity:get_abs_origin():dist(arg_41_0) < 50 then
                        var_41_1 = true
                end
        end)

        if var_41_1 then
                return "enemy"
        elseif var_41_0 then
                return "local"
        end

        return nil
end

G.waypoints = {
        {
                map = "de_mirage",
                label = "Underpass",
                pos = vector(703.59, -1603.12, -262.88)
        },
        {
                map = "de_mirage",
                label = "Ramp [CAVE]",
                pos = vector(-1039.57, -327.51, -367.97)
        }
}
G.final_wp_distance = 250

events.present_queue:add(function()
        if not game.engine:in_game() then
                return
        end

        if not G.help_main or not G.help_main:get_value():get() then
                return
        end

        if not G.enable_waypoints or not G.enable_waypoints:get_value():get() then
                return
        end

        slot_43_0_0 = entities.get_local_pawn()

        if not slot_43_0_0 then
                return
        end

        if G.wp_distance_slider then
                G.final_wp_distance = G.wp_distance_slider:get_value():get()
        end

        slot_43_1_0 = game.global_vars.map_name or ""
        slot_43_2_0 = draw.surface

        for iter_43_0, iter_43_1 in ipairs(G.waypoints) do
                if iter_43_1.map == slot_43_1_0 then
                        slot_43_8_0 = slot_43_0_0:get_abs_origin():dist(iter_43_1.pos)
                        slot_43_9_0 = slot_0_53_0(iter_43_1.pos)
                        slot_43_10_0 = false
                        slot_43_11_0 = nil

                        if slot_43_9_0 == "enemy" then
                                slot_43_10_0 = true
                                slot_43_11_0 = draw.color(255, 165, 0)
                        elseif slot_43_9_0 == "local" then
                                slot_43_10_0 = true
                                slot_43_11_0 = draw.color(128, 0, 128)
                        elseif slot_43_8_0 <= G.final_wp_distance then
                                slot_43_10_0 = true
                                slot_43_11_0 = draw.color(0, 0, 255)
                        end

                        slot_43_12_0 = math.world_to_screen(iter_43_1.pos)

                        if slot_43_10_0 and slot_43_12_0 then
                                if G.wp_stars and G.wp_stars:get_value():get() then
                                        slot_43_13_4 = slot_0_49_0(slot_43_12_0, 12)

                                        slot_0_48_0(slot_43_2_0, slot_43_13_4, slot_43_11_0)
                                        slot_0_47_0(slot_43_2_0, slot_43_9_0, slot_43_13_4, slot_43_11_0)
                                end

                                if G.wp_circles and G.wp_circles:get_value():get() then
                                        slot_43_13_3 = slot_0_50_0(slot_43_12_0, 10)

                                        slot_0_48_0(slot_43_2_0, slot_43_13_3, slot_43_11_0)
                                        slot_0_47_0(slot_43_2_0, slot_43_9_0, slot_43_13_3, slot_43_11_0)
                                end

                                if G.wp_squares and G.wp_squares:get_value():get() then
                                        slot_43_13_2 = slot_0_51_0(slot_43_12_0, 20)

                                        slot_0_48_0(slot_43_2_0, slot_43_13_2, slot_43_11_0)
                                        slot_0_47_0(slot_43_2_0, slot_43_9_0, slot_43_13_2, slot_43_11_0)
                                end

                                if G.wp_triangle and G.wp_triangle:get_value():get() then
                                        slot_43_13_1 = slot_0_52_0(slot_43_12_0, 20)

                                        slot_0_48_0(slot_43_2_0, slot_43_13_1, slot_43_11_0)
                                        slot_0_47_0(slot_43_2_0, slot_43_9_0, slot_43_13_1, slot_43_11_0)
                                end
                        end

                        if (slot_43_9_0 == "enemy" or slot_43_9_0 == "local") and G.cb_liner and G.cb_liner:get_value():get() then
                                slot_43_13_0 = iter_43_0 % 2 == 1 and iter_43_0 + 1 or iter_43_0 - 1
                                slot_43_14_0 = slot_43_13_0 >= 1 and slot_43_13_0 <= #G.waypoints and G.waypoints[slot_43_13_0] or nil

                                if slot_43_14_0 then
                                        slot_43_15_0 = math.world_to_screen(iter_43_1.pos)
                                        slot_43_16_0 = math.world_to_screen(slot_43_14_0.pos)

                                        if slot_43_15_0 and slot_43_16_0 then
                                                slot_43_2_0:add_line(slot_43_15_0, slot_43_16_0, draw.color(0, 0, 0), 3)
                                                slot_43_2_0:add_line(slot_43_15_0, slot_43_16_0, draw.color(255, 255, 255), 1)
                                        end

                                        slot_43_17_0 = slot_0_53_0(slot_43_14_0.pos)
                                        slot_43_18_0 = nil

                                        if slot_43_17_0 == "enemy" then
                                                slot_43_18_0 = draw.color(255, 165, 0)
                                        elseif slot_43_17_0 == "local" then
                                                slot_43_18_0 = draw.color(128, 0, 128)
                                        else
                                                slot_43_18_0 = draw.color(0, 0, 255)
                                        end

                                        slot_43_19_0 = math.world_to_screen(slot_43_14_0.pos)

                                        if slot_43_19_0 then
                                                if G.wp_stars and G.wp_stars:get_value():get() then
                                                        slot_43_20_3 = slot_0_49_0(slot_43_19_0, 12)

                                                        slot_0_48_0(slot_43_2_0, slot_43_20_3, slot_43_18_0)
                                                        slot_0_47_0(slot_43_2_0, slot_43_17_0, slot_43_20_3, slot_43_18_0)
                                                end

                                                if G.wp_circles and G.wp_circles:get_value():get() then
                                                        slot_43_20_2 = slot_0_50_0(slot_43_19_0, 10)

                                                        slot_0_48_0(slot_43_2_0, slot_43_20_2, slot_43_18_0)
                                                        slot_0_47_0(slot_43_2_0, slot_43_17_0, slot_43_20_2, slot_43_18_0)
                                                end

                                                if G.wp_squares and G.wp_squares:get_value():get() then
                                                        slot_43_20_1 = slot_0_51_0(slot_43_19_0, 20)

                                                        slot_0_48_0(slot_43_2_0, slot_43_20_1, slot_43_18_0)
                                                        slot_0_47_0(slot_43_2_0, slot_43_17_0, slot_43_20_1, slot_43_18_0)
                                                end

                                                if G.wp_triangle and G.wp_triangle:get_value():get() then
                                                        slot_43_20_0 = slot_0_52_0(slot_43_19_0, 20)

                                                        slot_0_48_0(slot_43_2_0, slot_43_20_0, slot_43_18_0)
                                                        slot_0_47_0(slot_43_2_0, slot_43_17_0, slot_43_20_0, slot_43_18_0)
                                                end
                                        end
                                end
                        end
                end
        end
end)

G.last_print_coords_time = 0

function G.maybe_print_coords()
        if not G.help_main or not G.help_main:get_value():get() then
                return
        end

        if not G.print_coords_cb or not G.print_coords_cb:get_value():get() then
                return
        end

        local var_44_0 = game.global_vars.real_time

        if var_44_0 - G.last_print_coords_time < 0.5 then
                return
        end

        G.last_print_coords_time = var_44_0

        local var_44_1 = entities.get_local_pawn()

        if not var_44_1 then
                return
        end

        local var_44_2 = var_44_1:get_abs_origin()
        local var_44_3 = game.global_vars.map_name or "unknown_map"
        local var_44_4 = string.format("label=Random;map=%s;x=%.2f;y=%.2f;z=%.2f", var_44_3, var_44_2.x, var_44_2.y, var_44_2.z)

        print("[Coords]", var_44_4)
end

events.present_queue:add(function()
        if game.engine:in_game() then
                G.maybe_print_coords()
        end
end)

slot_0_54_0 = utils.find_export("kernel32.dll", "GetCurrentDirectoryA")

if slot_0_54_0 then
        slot_0_55_1 = 260
        slot_0_56_1 = ffi.new("char[?]", slot_0_55_1)

        ffi.cast("unsigned int(__stdcall*)(unsigned int,char*)", slot_0_54_0)(slot_0_55_1, slot_0_56_1)

        slot_0_59_0 = ffi.string(slot_0_56_1):gsub("bin\\win64", "csgo\\fatality\\scripts")

        G.load_waypoints_from_txt(slot_0_59_0 .. "\\waypoints.txt")
        G.load_killsays(slot_0_59_0 .. "\\killsays.txt")
end

slot_0_55_0 = entities.get_local_controller() and entities.get_local_controller():get_name() or "<unknown>"
slot_0_56_0 = "Welcome " .. (gui.ctx.user and gui.ctx.user.username or "<empty>") .. "\nWelcome to Tueurs.lua Version " .. G.script_version

gui.notify:add(gui.notification(slot_0_56_0, "", draw.textures.icon_check, 8))
game.engine:client_cmd("say Welcome " .. slot_0_55_0 .. " to Tueurs.lua Version " .. G.script_version)
print("[Tueurs.lua] (Free) occupant==local => fill, occupant==enemy||local => line oposto + forma forçada no oposto, Killsay e Info. + FIX GetAsyncKeyState -> done!")
