--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        show_avatars = true,
        auto_leave = false,
        posY = 400,
        posX = 10,
        show_timer = true,
        vote_say = false,
        votes_to_watch_for = "all",
        force_show = false,
        enabled = false
}
slot_0_1_0 = "snoop_vote_revealer_cfg"
slot_0_2_0 = nil
slot_0_3_0 = {}
slot_0_4_0 = {}
slot_0_5_0 = {}
slot_0_6_0 = false
slot_0_7_0 = false
slot_0_8_0 = 0
slot_0_9_0 = {}
slot_0_10_0 = {}
slot_0_11_0 = {}
slot_0_12_0 = 45
slot_0_13_0 = {}
slot_0_14_0 = 0

function slot_0_15_0(arg_1_0, arg_1_1)
        slot_0_14_0 = slot_0_14_0 + 1

        local var_1_0 = slot_0_14_0

        slot_0_13_0[var_1_0] = true

        Delay(arg_1_0, function()
                if slot_0_13_0[var_1_0] then
                        slot_0_13_0[var_1_0] = nil

                        if slot_0_2_0 and arg_1_1 then
                                arg_1_1()
                        end
                end
        end)

        return var_1_0
end

function slot_0_16_0()
        for iter_3_0, iter_3_1 in pairs(slot_0_13_0) do
                slot_0_13_0[iter_3_0] = nil
        end
end

slot_0_17_0 = {}
slot_0_18_0 = {}
slot_0_19_0 = nil
slot_0_20_0 = nil
slot_0_21_0 = nil
slot_0_22_0 = {
        slower = 0.5,
        fast = 0.15,
        veryLong = 2,
        verySlow = 0.8,
        normal = 0.25,
        long = 1.2,
        slow = 0.35
}

function slot_0_17_0.clamp(arg_4_0, arg_4_1, arg_4_2)
        if arg_4_0 < arg_4_1 then
                return arg_4_1
        end

        if arg_4_2 < arg_4_0 then
                return arg_4_2
        end

        return arg_4_0
end

function slot_0_17_0.lerp(arg_5_0, arg_5_1, arg_5_2)
        local var_5_0 = slot_0_17_0.clamp(arg_5_2, 0, 1)

        return arg_5_0 + (arg_5_1 - arg_5_0) * var_5_0
end

slot_0_17_0.color = {}

function slot_0_17_0.color.applyAlpha(arg_6_0, arg_6_1)
        local var_6_0 = arg_6_0:get_r()
        local var_6_1 = arg_6_0:get_g()
        local var_6_2 = arg_6_0:get_b()
        local var_6_3 = arg_6_0:get_a()

        return draw.color(var_6_0, var_6_1, var_6_2, math.floor(var_6_3 * (arg_6_1 / 255)))
end

function slot_0_17_0.color.lerp(arg_7_0, arg_7_1, arg_7_2)
        if not arg_7_0 or not arg_7_1 then
                return arg_7_0 or arg_7_1
        end

        if arg_7_2 <= 0 then
                return arg_7_0
        end

        if arg_7_2 >= 1 then
                return arg_7_1
        end

        local var_7_0 = arg_7_0:get_r()
        local var_7_1 = arg_7_0:get_g()
        local var_7_2 = arg_7_0:get_b()
        local var_7_3 = arg_7_0:get_a()
        local var_7_4 = arg_7_1:get_r()
        local var_7_5 = arg_7_1:get_g()
        local var_7_6 = arg_7_1:get_b()
        local var_7_7 = arg_7_1:get_a()

        return draw.color(slot_0_17_0.clamp(math.floor(var_7_0 + (var_7_4 - var_7_0) * arg_7_2 + 0.5), 0, 255), slot_0_17_0.clamp(math.floor(var_7_1 + (var_7_5 - var_7_1) * arg_7_2 + 0.5), 0, 255), slot_0_17_0.clamp(math.floor(var_7_2 + (var_7_6 - var_7_2) * arg_7_2 + 0.5), 0, 255), slot_0_17_0.clamp(math.floor(var_7_3 + (var_7_7 - var_7_3) * arg_7_2 + 0.5), 0, 255))
end

function slot_0_17_0.color.rgbToHsv(arg_8_0, arg_8_1, arg_8_2)
        arg_8_0, arg_8_1, arg_8_2 = arg_8_0 / 255, arg_8_1 / 255, arg_8_2 / 255

        local var_8_0 = math.max(arg_8_0, arg_8_1, arg_8_2)
        local var_8_1 = math.min(arg_8_0, arg_8_1, arg_8_2)
        local var_8_2 = 0
        local var_8_3 = 0
        local var_8_4 = var_8_0
        local var_8_5 = var_8_0 - var_8_1
        local var_8_6 = var_8_0 == 0 and 0 or var_8_5 / var_8_0

        if var_8_0 ~= var_8_1 then
                if var_8_0 == arg_8_0 then
                        var_8_2 = (arg_8_1 - arg_8_2) / var_8_5 + (arg_8_1 < arg_8_2 and 6 or 0)
                elseif var_8_0 == arg_8_1 then
                        var_8_2 = (arg_8_2 - arg_8_0) / var_8_5 + 2
                else
                        var_8_2 = (arg_8_0 - arg_8_1) / var_8_5 + 4
                end

                var_8_2 = var_8_2 / 6
        end

        return var_8_2 * 360, var_8_6, var_8_4
end

function slot_0_17_0.color.hsvToRgb(arg_9_0, arg_9_1, arg_9_2)
        arg_9_0 = arg_9_0 / 360

        local var_9_0
        local var_9_1
        local var_9_2
        local var_9_3 = math.floor(arg_9_0 * 6)
        local var_9_4 = arg_9_0 * 6 - var_9_3
        local var_9_5 = arg_9_2 * (1 - arg_9_1)
        local var_9_6 = arg_9_2 * (1 - var_9_4 * arg_9_1)
        local var_9_7 = arg_9_2 * (1 - (1 - var_9_4) * arg_9_1)
        local var_9_8 = var_9_3 % 6

        if var_9_8 == 0 then
                var_9_0, var_9_1, var_9_2 = arg_9_2, var_9_7, var_9_5
        elseif var_9_8 == 1 then
                var_9_0, var_9_1, var_9_2 = var_9_6, arg_9_2, var_9_5
        elseif var_9_8 == 2 then
                var_9_0, var_9_1, var_9_2 = var_9_5, arg_9_2, var_9_7
        elseif var_9_8 == 3 then
                var_9_0, var_9_1, var_9_2 = var_9_5, var_9_6, arg_9_2
        elseif var_9_8 == 4 then
                var_9_0, var_9_1, var_9_2 = var_9_7, var_9_5, arg_9_2
        elseif var_9_8 == 5 then
                var_9_0, var_9_1, var_9_2 = arg_9_2, var_9_5, var_9_6
        end

        return math.floor(var_9_0 * 255 + 0.5), math.floor(var_9_1 * 255 + 0.5), math.floor(var_9_2 * 255 + 0.5)
end

function slot_0_23_0(arg_10_0, arg_10_1)
        if not arg_10_1 or arg_10_1 == "linear" then
                return arg_10_0
        elseif arg_10_1 == "ease_in" then
                return arg_10_0 * arg_10_0
        elseif arg_10_1 == "ease_out" then
                local var_10_0 = 1 - arg_10_0

                return 1 - var_10_0 * var_10_0
        elseif arg_10_1 == "ease_in_out" then
                if arg_10_0 < 0.5 then
                        return 2 * arg_10_0 * arg_10_0
                else
                        local var_10_1 = 1 - arg_10_0

                        return 1 - 2 * var_10_1 * var_10_1
                end
        end

        return arg_10_0
end

function slot_0_17_0.start(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
        if not arg_11_0 or not arg_11_3 then
                return
        end

        local var_11_0 = arg_11_3.duration or 0

        if var_11_0 <= 0 then
                var_11_0 = 0.0001
        end

        local var_11_1 = slot_0_18_0[arg_11_0]

        if var_11_1 and var_11_1.onComplete then
                var_11_1.onComplete(var_11_1.to)
        end

        slot_0_18_0[arg_11_0] = {
                value = 0,
                elapsed = 0,
                id = arg_11_0,
                from = arg_11_1,
                to = arg_11_2,
                duration = var_11_0,
                easingName = arg_11_3.easingName or arg_11_3.easing or "linear",
                onUpdate = arg_11_4,
                onComplete = arg_11_5
        }

        if arg_11_4 then
                arg_11_4(0, arg_11_1, arg_11_2)
        end
end

function slot_0_17_0.getValue(arg_12_0, arg_12_1)
        local var_12_0 = slot_0_18_0[arg_12_0]

        if not var_12_0 or var_12_0.value == nil then
                return arg_12_1
        end

        return var_12_0.value
end

function slot_0_17_0.stop(arg_13_0)
        slot_0_18_0[arg_13_0] = nil
end

function slot_0_17_0.update(arg_14_0)
        if not arg_14_0 or arg_14_0 <= 0 then
                return
        end

        for iter_14_0, iter_14_1 in pairs(slot_0_18_0) do
                local var_14_0 = iter_14_1.duration or 0

                if var_14_0 <= 0 then
                        iter_14_1.value = 1

                        if iter_14_1.onUpdate then
                                iter_14_1.onUpdate(1, iter_14_1.from, iter_14_1.to)
                        end

                        if iter_14_1.onComplete then
                                iter_14_1.onComplete(iter_14_1.to)
                        end

                        slot_0_18_0[iter_14_0] = nil
                else
                        iter_14_1.elapsed = (iter_14_1.elapsed or 0) + arg_14_0

                        local var_14_1 = iter_14_1.elapsed / var_14_0
                        local var_14_2 = slot_0_23_0(slot_0_17_0.clamp(var_14_1, 0, 1), iter_14_1.easingName)

                        iter_14_1.value = var_14_2

                        if iter_14_1.onUpdate then
                                iter_14_1.onUpdate(var_14_2, iter_14_1.from, iter_14_1.to)
                        end

                        if var_14_0 <= iter_14_1.elapsed then
                                if iter_14_1.onComplete then
                                        iter_14_1.onComplete(iter_14_1.to)
                                end

                                slot_0_18_0[iter_14_0] = nil
                        end
                end
        end
end

slot_0_17_0.config = {
        constants = {
                ROUNDING_OFFSET = 0.5,
                EXIT_SPEED_MULTIPLIER = 0.5,
                TRANSITION_INSTANT_THRESHOLD = 0.9,
                DEFAULT_HOLD_DURATION = 1
        },
        presets = {
                fade = {
                        window = {
                                easing = "ease_in_out",
                                duration = "slow"
                        },
                        overlay = {
                                easing = "linear",
                                duration = "normal"
                        },
                        dpi = {
                                easing = "ease_in_out",
                                fadeOut = "normal",
                                fadeIn = "normal"
                        },
                        notification = {
                                easing = "ease_out",
                                enter = "normal",
                                exit = "normal"
                        },
                        theme = {
                                easing = "ease_in_out",
                                duration = "normal"
                        }
                },
                popup = {
                        generic = {
                                easing = "ease_out",
                                duration = "slow"
                        },
                        colorPicker = {
                                easing = "ease_out",
                                duration = "slow"
                        },
                        keybind = {
                                open = "fast",
                                easing = "ease_out",
                                close = "fast",
                                rowExpand = "fast"
                        },
                        about = {
                                easing = "ease_out",
                                duration = "slow"
                        },
                        notification = {
                                exitAccelerated = true,
                                exit = "normal",
                                easing = "ease_in"
                        }
                },
                slide = {
                        dimension = {
                                easing = "ease_out",
                                duration = "normal"
                        },
                        slider = {
                                easing = "ease_out",
                                duration = "fast"
                        },
                        switch = {
                                easing = "ease_out",
                                duration = "slow"
                        },
                        combobox = {
                                easing = "ease_out",
                                duration = "normal"
                        },
                        notification = {
                                easing = "ease_out",
                                position = "fast"
                        }
                },
                toggle = {
                        checkbox = {
                                easing = "ease_out",
                                duration = "slow"
                        },
                        switch = {
                                easing = "ease_out",
                                duration = "slow"
                        },
                        sliderText = {
                                easing = "ease_out",
                                duration = "fast"
                        }
                },
                value = {
                        generic = {
                                easing = "ease_out",
                                duration = "normal"
                        },
                        hover = {
                                easing = "ease_out",
                                duration = "slow"
                        },
                        textChange = {
                                easing = "ease_out",
                                duration = "slower"
                        },
                        colorProgress = {
                                easing = "ease_out",
                                duration = "fast"
                        },
                        stateinfoText = {
                                minAlpha = 0.82,
                                easing = "ease_out",
                                duration = "normal"
                        },
                        navigationText = {
                                hoverDuration = "normal",
                                easing = "linear",
                                selectDuration = "normal",
                                deselectDuration = "normal"
                        },
                        sidebarAccent = {
                                easing = "linear",
                                duration = "normal"
                        }
                },
                sequence = {
                        visibility = {
                                showing = {
                                        height = {
                                                easing = "ease_in_out",
                                                duration = "normal"
                                        },
                                        alpha = {
                                                easing = "ease_in",
                                                duration = "normal"
                                        }
                                },
                                hiding = {
                                        alpha = {
                                                easing = "ease_out",
                                                duration = "normal"
                                        },
                                        height = {
                                                easing = "ease_in_out",
                                                duration = "normal"
                                        }
                                }
                        },
                        transition = {
                                bgFadeIn = {
                                        easing = "ease_in",
                                        duration = "slow"
                                },
                                contentFadeIn = {
                                        delay = 0.4,
                                        easing = "ease_in",
                                        duration = "slow"
                                },
                                fadeOut = {
                                        easing = "ease_in",
                                        duration = "verySlow"
                                },
                                contexts = {
                                        startup = {
                                                loadingSubtitle = "Loading...",
                                                holdDuration = "verySlow",
                                                holdDurationWithLoading = "veryLong",
                                                subtitle = "Stay fatal"
                                        },
                                        dpi = {
                                                holdDuration = "long",
                                                subtitle = "Rebuilding..."
                                        },
                                        language = {
                                                holdDuration = "long",
                                                subtitle = "Loading..."
                                        }
                                }
                        },
                        navigation = {
                                easing = "ease_in_out",
                                duration = "slow"
                        }
                }
        }
}

function slot_0_17_0.config.resolve(arg_15_0, arg_15_1, arg_15_2)
        local var_15_0 = slot_0_19_0 or slot_0_22_0
        local var_15_1 = slot_0_17_0.config.presets[arg_15_0]

        if not var_15_1 then
                return {
                        easing = "ease_out",
                        duration = 0.25
                }
        end

        local var_15_2 = var_15_1[arg_15_1]

        if not var_15_2 then
                return {
                        easing = "ease_out",
                        duration = 0.25
                }
        end

        local var_15_3 = var_15_2[arg_15_2 or "duration"] or var_15_2.duration

        if type(var_15_3) == "string" and var_15_0 then
                var_15_3 = var_15_0[var_15_3] or 0.25
        elseif type(var_15_3) == "string" then
                var_15_3 = slot_0_22_0[var_15_3] or 0.25
        end

        return {
                duration = var_15_3 or 0.25,
                easing = var_15_2.easing or "ease_out"
        }
end

slot_0_24_0 = {}

function slot_0_25_0(arg_16_0)
        return slot_0_24_0[arg_16_0]
end

function slot_0_26_0(arg_17_0, arg_17_1)
        slot_0_24_0[arg_17_0] = arg_17_1
end

function slot_0_27_0(arg_18_0)
        slot_0_24_0[arg_18_0] = nil
end

function slot_0_28_0(arg_19_0, arg_19_1)
        local var_19_0 = slot_0_24_0[arg_19_0]

        if var_19_0 then
                var_19_0.currentValue = arg_19_1
        end
end

function slot_0_29_0(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5)
        local var_20_0 = slot_0_21_0 or game and game.global_vars

        slot_0_26_0(arg_20_0, {
                running = true,
                currentValue = arg_20_1,
                from = arg_20_1,
                to = arg_20_2,
                startTime = var_20_0 and var_20_0.real_time or 0
        })

        local function var_20_1(arg_21_0, arg_21_1, arg_21_2)
                local var_21_0 = slot_0_17_0.lerp(arg_21_1, arg_21_2, arg_21_0)

                slot_0_28_0(arg_20_0, var_21_0)

                if arg_20_4 then
                        arg_20_4(arg_21_0, arg_21_1, arg_21_2)
                end
        end

        local function var_20_2(arg_22_0)
                slot_0_27_0(arg_20_0)

                if arg_20_5 then
                        arg_20_5(arg_22_0)
                end
        end

        slot_0_17_0.start(arg_20_0, arg_20_1, arg_20_2, {
                duration = arg_20_3.duration,
                easingName = arg_20_3.easing
        }, var_20_1, var_20_2)
end

function slot_0_30_0(arg_23_0)
        local var_23_0 = slot_0_25_0(arg_23_0)

        if var_23_0 and var_23_0.running then
                slot_0_17_0.stop(arg_23_0)
                slot_0_27_0(arg_23_0)

                return var_23_0.currentValue
        end

        return nil
end

slot_0_17_0.effects = {}
slot_0_17_0.effects.slide = {}

function slot_0_17_0.effects.slide.to(arg_24_0, arg_24_1)
        arg_24_1 = arg_24_1 or {}

        local var_24_0 = arg_24_1.target

        if not var_24_0 then
                return
        end

        local var_24_1 = arg_24_1.key or "value"
        local var_24_2 = arg_24_1.to

        if var_24_2 == nil then
                return
        end

        local var_24_3 = arg_24_1.preset or "slider"
        local var_24_4 = slot_0_17_0.config.resolve("slide", var_24_3)

        if arg_24_1.duration then
                var_24_4.duration = arg_24_1.duration
        end

        if arg_24_1.easing then
                var_24_4.easing = arg_24_1.easing
        end

        local var_24_5 = var_24_0[var_24_1] or var_24_2
        local var_24_6 = arg_24_1.onUpdate or function(arg_25_0, arg_25_1, arg_25_2)
                var_24_0[var_24_1] = slot_0_17_0.lerp(arg_25_1, arg_25_2, arg_25_0)
        end

        local function var_24_7(arg_26_0)
                var_24_0[var_24_1] = var_24_2

                if arg_24_1.onComplete then
                        arg_24_1.onComplete()
                end
        end

        slot_0_29_0(arg_24_0, var_24_5, var_24_2, var_24_4, var_24_6, var_24_7)
end

events.presentQueue:Add(function()
        slot_0_17_0.update(game.global_vars.frame_time)
end)

function slot_0_31_0(arg_28_0, arg_28_1)
        gui.notify:Add(gui.Notification(arg_28_0, arg_28_1))
end

function slot_0_32_0()
        local var_29_0 = {
                enabled = slot_0_0_0.enabled,
                force_show = slot_0_0_0.force_show,
                votes_to_watch_for = slot_0_0_0.votes_to_watch_for,
                vote_say = slot_0_0_0.vote_say,
                show_timer = slot_0_0_0.show_timer,
                posX = slot_0_0_0.posX,
                posY = slot_0_0_0.posY,
                auto_leave = slot_0_0_0.auto_leave,
                show_avatars = slot_0_0_0.show_avatars
        }

        if not utils.DbSave(var_29_0, slot_0_1_0) then
                print("[Vote Revealer] Failed to save settings")
        end
end

;(function()
        local var_30_0 = utils.DbLoad(slot_0_1_0)

        if var_30_0 then
                slot_0_0_0.enabled = var_30_0.enabled == true
                slot_0_0_0.force_show = var_30_0.force_show == true
                slot_0_0_0.votes_to_watch_for = var_30_0.votes_to_watch_for or slot_0_0_0.votes_to_watch_for
                slot_0_0_0.vote_say = var_30_0.vote_say == true
                slot_0_0_0.show_timer = var_30_0.show_timer == true
                slot_0_0_0.posX = var_30_0.posX ~= nil and var_30_0.posX or slot_0_0_0.posX
                slot_0_0_0.posY = var_30_0.posY ~= nil and var_30_0.posY or slot_0_0_0.posY
                slot_0_0_0.auto_leave = false
                slot_0_0_0.show_avatars = var_30_0.show_avatars == true

                print("[Vote Revealer] Settings loaded successfully")

                return true
        else
                print("[Vote Revealer] No saved settings found, using defaults")

                return false
        end
end)()

slot_0_34_0 = draw.FontGDI("Arial Unicode MS", 14, 0, 0, 65535, 400)
draw.fonts.gui_main.fallbackFont = slot_0_34_0

function slot_0_35_0(arg_31_0, arg_31_1)
        local var_31_0 = draw.Color(142, 184, 220, arg_31_1)
        local var_31_1 = draw.Color(210, 180, 92, arg_31_1)
        local var_31_2 = draw.Color(128, 128, 128, arg_31_1)

        if arg_31_0 == "CT" then
                return var_31_0
        elseif arg_31_0 == "T" then
                return var_31_1
        elseif arg_31_0 == "TEAM" then
                return var_31_0
        elseif arg_31_0 == "ENEMY" then
                return var_31_1
        else
                return var_31_2
        end
end

function slot_0_36_0(arg_32_0, arg_32_1)
        slot_0_15_0(arg_32_1, function()
                if slot_0_5_0 and slot_0_5_0[arg_32_0] then
                        slot_0_17_0.effects.slide.to("slide_in_" .. arg_32_0, {
                                preset = "slider",
                                key = "slideValue",
                                to = 1,
                                duration = 0.35,
                                target = slot_0_5_0[arg_32_0]
                        })
                end
        end)
end

function slot_0_37_0(arg_34_0, arg_34_1, arg_34_2)
        slot_0_15_0(arg_34_1, function()
                if slot_0_5_0 and slot_0_5_0[arg_34_0] then
                        slot_0_17_0.effects.slide.to("slide_out_" .. arg_34_0, {
                                preset = "slider",
                                key = "slideValue",
                                to = 0,
                                duration = 0.35,
                                target = slot_0_5_0[arg_34_0],
                                onComplete = arg_34_2
                        })
                end
        end)
end

function slot_0_38_0(arg_36_0)
        local var_36_0 = slot_0_7_0 and slot_0_4_0 or slot_0_3_0

        if not var_36_0 or #var_36_0 == 0 then
                if arg_36_0 then
                        arg_36_0()
                end

                return
        end

        slot_0_6_0 = true

        local var_36_1 = 0
        local var_36_2 = {}

        if slot_0_7_0 then
                local var_36_3 = {}
                local var_36_4 = {}

                for iter_36_0, iter_36_1 in ipairs(var_36_0) do
                        if iter_36_1.is_enemy then
                                table.insert(var_36_4, iter_36_1)
                        else
                                table.insert(var_36_3, iter_36_1)
                        end
                end

                for iter_36_2, iter_36_3 in ipairs(var_36_3) do
                        table.insert(var_36_2, iter_36_3)
                end

                for iter_36_4, iter_36_5 in ipairs(var_36_4) do
                        table.insert(var_36_2, iter_36_5)
                end
        else
                var_36_2 = var_36_0
        end

        for iter_36_6 = #var_36_2, 1, -1 do
                local var_36_5 = var_36_2[iter_36_6].player_steam_id
                local var_36_6 = (#var_36_2 - iter_36_6) * 0.08

                slot_0_37_0(var_36_5, var_36_6, function()
                        var_36_1 = var_36_1 + 1

                        if var_36_1 >= #var_36_2 then
                                slot_0_6_0 = false

                                if arg_36_0 then
                                        arg_36_0()
                                end
                        end
                end)
        end
end

function slot_0_39_0(arg_38_0)
        if slot_0_7_0 then
                return
        end

        if slot_0_6_0 then
                slot_0_15_0(0.6, function()
                        slot_0_39_0(arg_38_0)
                end)

                return
        end

        local var_38_0 = {}

        for iter_38_0, iter_38_1 in ipairs(slot_0_3_0) do
                if iter_38_1.team == arg_38_0 then
                        table.insert(var_38_0, iter_38_1)
                end
        end

        if #var_38_0 == 0 then
                return
        end

        local var_38_1 = 0

        slot_0_6_0 = true
        slot_0_11_0[arg_38_0] = nil
        slot_0_9_0[arg_38_0] = nil
        slot_0_10_0[arg_38_0] = nil

        for iter_38_2 = #var_38_0, 1, -1 do
                local var_38_2 = var_38_0[iter_38_2].player_steam_id
                local var_38_3 = (#var_38_0 - iter_38_2) * 0.08

                slot_0_37_0(var_38_2, var_38_3, function()
                        var_38_1 = var_38_1 + 1

                        if var_38_1 >= #var_38_0 then
                                slot_0_6_0 = false

                                local var_40_0 = {}

                                for iter_40_0, iter_40_1 in ipairs(slot_0_3_0) do
                                        if iter_40_1.team ~= arg_38_0 then
                                                table.insert(var_40_0, iter_40_1)
                                        end
                                end

                                slot_0_3_0 = var_40_0

                                for iter_40_2, iter_40_3 in pairs(slot_0_5_0) do
                                        local var_40_1 = false

                                        for iter_40_4, iter_40_5 in ipairs(slot_0_3_0) do
                                                if iter_40_5.player_steam_id == iter_40_2 then
                                                        var_40_1 = true

                                                        break
                                                end
                                        end

                                        if not var_40_1 then
                                                slot_0_5_0[iter_40_2] = nil
                                        end
                                end

                                slot_0_8_0 = #slot_0_3_0

                                if slot_0_2_0 and #slot_0_3_0 == 0 then
                                        local var_40_2 = 48

                                        slot_0_2_0:SetDimensions(draw.Vec2(slot_0_0_0.posX, slot_0_0_0.posY), draw.Vec2(98, var_40_2))
                                end
                        end
                end)
        end
end

function slot_0_40_0()
        if slot_0_7_0 then
                return
        end

        if #slot_0_3_0 == 0 then
                return
        end

        if slot_0_6_0 then
                slot_0_15_0(0.6, function()
                        slot_0_40_0()
                end)

                return
        end

        slot_0_11_0 = {}
        slot_0_9_0 = {}
        slot_0_10_0 = {}

        slot_0_38_0(function()
                slot_0_3_0 = {}
                slot_0_5_0 = {}
                slot_0_8_0 = 0
                slot_0_11_0 = {}
                slot_0_9_0 = {}
                slot_0_10_0 = {}

                if slot_0_2_0 then
                        local var_43_0 = 48

                        slot_0_2_0:SetDimensions(draw.Vec2(slot_0_0_0.posX, slot_0_0_0.posY), draw.Vec2(98, var_43_0))
                end
        end)
end

function slot_0_41_0()
        slot_0_16_0()

        for iter_44_0, iter_44_1 in pairs(slot_0_5_0) do
                slot_0_17_0.stop("slide_in_" .. iter_44_0)
                slot_0_17_0.stop("slide_out_" .. iter_44_0)
        end

        slot_0_3_0 = {}
        slot_0_5_0 = {}
        slot_0_8_0 = 0
        slot_0_11_0 = {}
        slot_0_9_0 = {}
        slot_0_10_0 = {}
        slot_0_6_0 = false

        if slot_0_2_0 then
                local var_44_0 = 48

                slot_0_2_0:SetDimensions(draw.Vec2(slot_0_0_0.posX, slot_0_0_0.posY), draw.Vec2(98, var_44_0))
        end
end

function slot_0_42_0()
        local var_45_0 = slot_0_7_0 and slot_0_4_0 or slot_0_3_0
        local var_45_1 = {}
        local var_45_2 = {}

        for iter_45_0, iter_45_1 in ipairs(var_45_0) do
                if iter_45_1.is_enemy then
                        table.insert(var_45_2, iter_45_1)
                else
                        table.insert(var_45_1, iter_45_1)
                end
        end

        local var_45_3 = {}

        for iter_45_2, iter_45_3 in ipairs(var_45_1) do
                table.insert(var_45_3, iter_45_3)
        end

        for iter_45_4, iter_45_5 in ipairs(var_45_2) do
                table.insert(var_45_3, iter_45_5)
        end

        return var_45_3
end

function slot_0_43_0(arg_46_0, arg_46_1)
        if arg_46_1 <= 0 then
                return false
        end

        local var_46_0 = 0
        local var_46_1 = false

        for iter_46_0, iter_46_1 in ipairs(slot_0_3_0) do
                if iter_46_1.team == arg_46_0 then
                        var_46_0 = var_46_0 + 1

                        if iter_46_1.vote_cast == "NO" then
                                var_46_1 = true
                        end
                end
        end

        if not var_46_1 and var_46_0 == arg_46_1 - 1 and var_46_0 > 0 then
                return true
        end

        return false
end

slot_0_44_0 = gui.LuaContainerProto()
slot_0_45_0 = draw.Vec2(-1, -1)

function slot_0_44_0.onRender(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
        if not slot_0_0_0.enabled and not slot_0_7_0 then
                return
        end

        slot_47_5_0 = slot_0_7_0 and slot_0_4_0 or slot_0_3_0
        slot_47_6_0 = slot_0_42_0()
        slot_47_7_1 = false
        slot_47_8_0 = false
        slot_47_9_0 = false

        for iter_47_0, iter_47_1 in ipairs(slot_47_6_0) do
                if not iter_47_1.is_enemy then
                        slot_47_8_0 = true
                else
                        slot_47_9_0 = true
                end
        end

        slot_47_7_0 = slot_47_8_0 and slot_47_9_0

        if not slot_0_6_0 then
                for iter_47_2, iter_47_3 in ipairs(slot_47_6_0) do
                        slot_47_15_2 = iter_47_3.player_steam_id

                        if not slot_0_5_0[slot_47_15_2] then
                                slot_0_5_0[slot_47_15_2] = {
                                        slideValue = 0
                                }

                                slot_0_36_0(slot_47_15_2, (iter_47_2 - 1) * 0.05)
                        end
                end
        end

        for iter_47_4, iter_47_5 in pairs(slot_0_5_0) do
                slot_47_15_1 = false

                for iter_47_6, iter_47_7 in ipairs(slot_47_5_0) do
                        if iter_47_7.player_steam_id == iter_47_4 then
                                slot_47_15_1 = true

                                break
                        end
                end

                if not slot_47_15_1 then
                        slot_0_5_0[iter_47_4] = nil
                end
        end

        slot_47_10_0 = draw.fonts.gui_main
        slot_47_11_0 = 2
        slot_47_12_0 = 6
        slot_47_13_0 = 4
        slot_47_14_0 = 3
        slot_47_15_0 = slot_47_10_0.height
        slot_47_17_0 = slot_47_15_0 + 12
        slot_47_18_0 = slot_47_17_0 - 6
        slot_47_19_0 = 10
        slot_47_20_0 = 20
        slot_47_21_0 = 0

        for iter_47_8 in pairs(slot_0_11_0) do
                slot_47_21_0 = slot_47_21_0 + 1
        end

        slot_47_22_0 = 4
        slot_47_23_1 = slot_0_0_0.show_timer and not slot_0_7_0 and next(slot_0_11_0) ~= nil
        slot_47_24_0 = ""

        if slot_47_23_1 then
                slot_47_25_1 = utils.GetUnixTime()
                slot_47_26_1 = 0

                for iter_47_9, iter_47_10 in pairs(slot_0_11_0) do
                        slot_47_32_1 = math.max(0, iter_47_10 + slot_0_12_0 - slot_47_25_1)

                        if slot_47_26_1 < slot_47_32_1 then
                                slot_47_26_1 = slot_47_32_1
                        end
                end

                if slot_47_26_1 <= 0 then
                        slot_47_23_0 = false
                end
        end

        slot_47_25_0 = #slot_47_6_0

        if slot_47_7_0 then
                slot_47_25_0 = slot_47_25_0 + 1
        end

        slot_47_26_0 = slot_47_11_0 + slot_47_20_0 + slot_47_22_0 + slot_47_25_0 * (slot_47_17_0 + slot_47_12_0) - slot_47_12_0

        if slot_47_26_0 < 10 then
                slot_47_26_0 = 10
        end

        slot_47_27_0 = 0

        for iter_47_11, iter_47_12 in ipairs(slot_47_6_0) do
                slot_47_33_1 = slot_47_10_0:GetTextSize(iter_47_12.player_name).x
                slot_47_34_2 = iter_47_12.avatar ~= nil and slot_47_18_0 + 4 or 0

                if slot_47_27_0 < slot_47_33_1 + slot_47_34_2 then
                        slot_47_27_0 = slot_47_33_1 + slot_47_34_2
                end
        end

        slot_47_28_0 = "Vote Revealer"
        slot_47_29_0 = slot_47_10_0:GetTextSize(slot_47_28_0).x
        slot_47_30_0 = math.max(slot_47_27_0 + slot_47_19_0 * 2 + slot_47_14_0, slot_47_29_0 + slot_47_19_0 * 2)

        if slot_47_30_0 < 50 then
                slot_47_30_0 = 50
        end

        if #slot_47_5_0 ~= slot_0_8_0 and slot_0_2_0 then
                slot_0_8_0 = #slot_47_5_0

                slot_0_2_0:SetDimensions(draw.Vec2(slot_0_0_0.posX, slot_0_0_0.posY), draw.Vec2(slot_47_30_0, slot_47_26_0))
        end

        slot_47_31_0 = draw.GetDisplay().x
        slot_47_33_0 = arg_47_3.x + slot_47_30_0 / 2 > slot_47_31_0 / 2

        if gui.IsVisible() then
                slot_0_2_0.renderBackground = true
                slot_47_34_1 = arg_47_3.x + slot_47_30_0 / 2 - slot_47_10_0:GetTextSize(slot_47_28_0).x / 2
                slot_47_35_1 = arg_47_3.y + slot_47_20_0 / 2 - slot_47_15_0 / 2 + 6

                arg_47_1:AddText(draw.Vec2(slot_47_34_1, slot_47_35_1), slot_47_28_0, draw.Color(130, 130, 130, 255))
        else
                slot_0_2_0.renderBackground = false
        end

        slot_47_34_0 = arg_47_3.y + slot_47_11_0 + slot_47_20_0 + slot_47_22_0
        slot_47_35_0 = false
        slot_47_36_0 = {}

        for iter_47_13, iter_47_14 in ipairs(slot_47_6_0) do
                if slot_47_7_0 and not slot_47_35_0 and iter_47_14.is_enemy then
                        slot_47_34_0 = slot_47_34_0 + slot_47_17_0 + slot_47_12_0
                        slot_47_35_0 = true
                end

                if slot_0_0_0.show_timer and not slot_0_7_0 then
                        slot_47_42_1 = iter_47_14.team

                        if not slot_47_36_0[slot_47_42_1] and slot_0_11_0[slot_47_42_1] then
                                slot_47_36_0[slot_47_42_1] = true
                                slot_47_43_1 = utils.GetUnixTime()
                                slot_47_44_1 = math.max(0, slot_0_11_0[slot_47_42_1] + slot_0_12_0 - slot_47_43_1)

                                if slot_47_44_1 > 0 then
                                        slot_47_45_1 = slot_47_44_1 % 60
                                        slot_47_46_1 = string.format("[%s] ends in: %ds", slot_47_42_1, slot_47_45_1)

                                        arg_47_1:AddText(draw.Vec2(arg_47_3.x, slot_47_34_0), slot_47_46_1, draw.Color(240, 240, 240, 255))

                                        slot_47_34_0 = slot_47_34_0 + slot_47_10_0.height + 4
                                end
                        end
                end

                slot_47_42_0 = iter_47_14.player_name
                slot_47_43_0 = iter_47_14.player_steam_id
                slot_47_44_0 = iter_47_14.vote_cast
                slot_47_45_0 = iter_47_14.team
                slot_47_46_0 = slot_0_5_0[slot_47_43_0]
                slot_47_47_0 = slot_47_46_0 and slot_47_46_0.slideValue or 0
                slot_47_51_0 = slot_47_10_0:GetTextSize(slot_47_42_0).x + (iter_47_14.avatar ~= nil and slot_0_0_0.show_avatars and slot_47_18_0 + 4 or 0) + slot_47_19_0 * 2 + slot_47_14_0
                slot_47_52_0 = nil
                slot_47_53_0 = nil

                if slot_47_33_0 then
                        slot_47_52_0 = arg_47_3.x + slot_47_30_0 - slot_47_51_0
                        slot_47_53_0 = slot_47_51_0 * (1 - slot_47_47_0)
                else
                        slot_47_52_0 = arg_47_3.x
                        slot_47_53_0 = -slot_47_51_0 * (1 - slot_47_47_0)
                end

                if slot_47_47_0 > 0 then
                        slot_47_54_0 = slot_47_52_0 + slot_47_53_0
                        slot_47_55_0 = slot_47_54_0 + slot_47_51_0 - 6

                        if slot_47_33_0 then
                                slot_47_54_0 = slot_47_54_0 - 4
                        else
                                slot_47_55_0 = slot_47_55_0 + 6
                        end

                        slot_47_56_0 = draw.Color(25, 25, 25, 200):ModA(slot_47_47_0)
                        slot_47_57_0 = draw.Rect(slot_47_54_0, slot_47_34_0, slot_47_55_0, slot_47_34_0 + slot_47_17_0)

                        arg_47_1:AddRectFilledRounded(slot_47_57_0, slot_47_56_0, slot_47_13_0, draw.Rounding.ALL)

                        if slot_47_33_0 then
                                slot_47_58_3 = draw.Rect(slot_47_55_0 - slot_47_14_0, slot_47_34_0, slot_47_55_0, slot_47_34_0 + slot_47_17_0)

                                arg_47_1:AddRectFilledRounded(slot_47_58_3, slot_0_35_0(slot_47_45_0, 255 * slot_47_47_0), slot_47_13_0, draw.Rounding.RIGHT)
                        else
                                slot_47_58_2 = draw.Rect(slot_47_54_0, slot_47_34_0, slot_47_54_0 + slot_47_14_0, slot_47_34_0 + slot_47_17_0)

                                arg_47_1:AddRectFilledRounded(slot_47_58_2, slot_0_35_0(slot_47_45_0, 255 * slot_47_47_0), slot_47_13_0, draw.Rounding.LEFT)
                        end

                        slot_47_58_1 = nil

                        if iter_47_14.is_force_show then
                                slot_47_58_1 = draw.Color(225, 225, 235, 255)
                        elseif slot_47_44_0 == "YES" then
                                slot_47_58_1 = draw.Color(129, 199, 132, 255)
                        elseif slot_47_44_0 == "NO" then
                                slot_47_58_1 = draw.Color(239, 83, 80, 255)
                        else
                                slot_47_58_1 = draw.Color(225, 225, 235, 255)
                        end

                        slot_47_58_0 = slot_47_58_1:ModA(slot_47_47_0)
                        slot_47_59_0 = false

                        if slot_0_0_0.show_avatars and iter_47_14.avatar then
                                slot_47_60_1 = iter_47_14.avatar
                                slot_47_61_3 = nil
                                slot_47_62_3 = nil
                                slot_47_62_2 = slot_47_34_0 + 3

                                if slot_47_33_0 then
                                        slot_47_61_3 = slot_47_54_0 + 4
                                else
                                        slot_47_61_3 = slot_47_54_0 + slot_47_14_0 + 4
                                end

                                arg_47_1.g:SetTexture(slot_47_60_1)

                                slot_47_63_0 = draw.Rect(slot_47_61_3, slot_47_62_2, slot_47_61_3 + slot_47_18_0, slot_47_62_2 + slot_47_18_0)

                                arg_47_1:AddRectFilled(slot_47_63_0, draw.Color(255, 255, 255, 255 * slot_47_47_0))
                                arg_47_1.g:SetTexture(nil)

                                slot_47_59_0 = true
                        end

                        slot_47_60_0 = slot_47_59_0 and slot_47_18_0 + 8 or 6
                        slot_47_61_2 = nil
                        slot_47_62_1 = nil
                        slot_47_62_0 = slot_47_34_0 + (slot_47_17_0 - slot_47_15_0) / 2 + 2

                        if slot_47_33_0 then
                                slot_47_61_1 = slot_47_54_0 + 4 + slot_47_60_0

                                arg_47_1:AddText(draw.Vec2(slot_47_61_1, slot_47_62_0), slot_47_42_0, slot_47_58_0)
                        else
                                slot_47_61_0 = slot_47_54_0 + slot_47_14_0 + 4 + slot_47_60_0

                                arg_47_1:AddText(draw.Vec2(slot_47_61_0, slot_47_62_0), slot_47_42_0, slot_47_58_0)
                        end
                end

                slot_47_34_0 = slot_47_34_0 + slot_47_17_0 + slot_47_12_0
        end
end

slot_0_2_0 = gui.LuaWidgetControl("vote-revealer", slot_0_44_0, draw.Vec2(slot_0_0_0.posX, slot_0_0_0.posY), draw.Vec2(98, 160))

slot_0_2_0:ToggleVisibility(true)

slot_0_2_0.renderBackground = false

gui.ctx:Add(slot_0_2_0)

function slot_0_46_0()
        if slot_0_7_0 then
                return
        end

        slot_0_6_0 = false

        for iter_48_0, iter_48_1 in pairs(slot_0_5_0) do
                slot_0_17_0.stop("slide_in_" .. iter_48_0)
                slot_0_17_0.stop("slide_out_" .. iter_48_0)
        end

        if #slot_0_3_0 > 0 then
                slot_0_3_0 = {}
        end

        slot_0_9_0 = {}
        slot_0_11_0 = {}
        slot_0_10_0 = {}
        slot_0_7_0 = true
        slot_0_4_0 = {
                {
                        team = "ENEMY",
                        vote_cast = "NO",
                        is_enemy = true,
                        is_force_show = true,
                        player_name = "Enemy",
                        player_steam_id = "123"
                },
                {
                        team = "TEAM",
                        vote_cast = "YES",
                        is_enemy = false,
                        is_force_show = true,
                        player_name = "Vote",
                        player_steam_id = "1234"
                },
                {
                        team = "TEAM",
                        vote_cast = "none",
                        is_enemy = false,
                        is_force_show = true,
                        player_name = "Revealer",
                        player_steam_id = "1235"
                }
        }
        slot_0_5_0 = {}
        slot_0_8_0 = 0

        if #slot_0_4_0 == 0 then
                slot_0_31_0("Vote Revealer", "No players found")

                slot_0_7_0 = false

                return
        end
end

function slot_0_47_0()
        if not slot_0_7_0 then
                return
        end

        slot_0_38_0(function()
                slot_0_4_0 = {}
                slot_0_5_0 = {}
                slot_0_7_0 = false
                slot_0_6_0 = false
                slot_0_8_0 = 0
                slot_0_10_0 = {}

                if slot_0_2_0 then
                        slot_0_2_0:SetDimensions(draw.Vec2(slot_0_0_0.posX, slot_0_0_0.posY), draw.Vec2(98, 160))
                end
        end)
end

events.input:Add(function()
        if not slot_0_2_0 then
                return
        end

        local var_51_0 = slot_0_2_0.pos

        if var_51_0.x ~= slot_0_45_0.x or var_51_0.y ~= slot_0_45_0.y then
                slot_0_45_0 = draw.Vec2(var_51_0.x, var_51_0.y)
                slot_0_0_0.posX = var_51_0.x
                slot_0_0_0.posY = var_51_0.y
        end
end)

slot_0_48_0 = gui.ctx:find("lua>elements b")

if not slot_0_48_0 then
        error("Could not find lua>elements b")

        return
end

slot_0_49_0, slot_0_50_0 = gui.MakeControlEasy("vote_revealer_enable", "Enable Vote Revealer", "checkbox")
slot_0_51_0, slot_0_52_0 = gui.MakeControlEasy("vote_revealer_force_show", "Show Dummy Votes", "checkbox")
slot_0_51_0.tooltip = "This will remove any existing votes"
slot_0_53_0, slot_0_54_0 = gui.MakeControlEasy("vote_revealer_timer", "Show Vote Timer", "checkbox")
slot_0_55_0, slot_0_56_0 = gui.MakeControlEasy("vote_revealer_avatars", "Show Profile Pictures", "checkbox")
slot_0_57_0 = gui.ComboBox("vote_revealer_watch")
slot_0_57_0.allowMultiple = false

slot_0_57_0:Add(gui.Selectable("all", "All"))
slot_0_57_0:Add(gui.Selectable("team", "Team"))
slot_0_57_0:Add(gui.Selectable("enemy", "Enemy"))

slot_0_58_0 = gui.MakeControl("Votes to Watch", slot_0_57_0)
slot_0_59_0, slot_0_60_0 = gui.MakeControlEasy("vote_revealer_say", "Send Votes to Chat", "checkbox")
slot_0_61_0, slot_0_62_0 = gui.MakeControlEasy("vote_revealer_autoleave", "Auto Leave", "checkbox")
slot_0_61_0.tooltip = "Disconnects instantly when the game ends"

slot_0_49_0:GetValue():Set(slot_0_0_0.enabled)
slot_0_51_0:GetValue():Set(slot_0_0_0.force_show)
slot_0_53_0:GetValue():Set(slot_0_0_0.show_timer)
slot_0_55_0:GetValue():Set(slot_0_0_0.show_avatars)
slot_0_59_0:GetValue():Set(slot_0_0_0.vote_say)

slot_0_63_0 = 1

if slot_0_0_0.votes_to_watch_for == "team" then
        slot_0_63_0 = 2
elseif slot_0_0_0.votes_to_watch_for == "enemy" then
        slot_0_63_0 = 4
end

slot_0_57_0:Get():SetRaw(slot_0_63_0)
slot_0_61_0:GetValue():Set(slot_0_0_0.auto_leave)
slot_0_57_0:Reset()
slot_0_48_0:Add(slot_0_50_0)
slot_0_48_0:Add(slot_0_52_0)
slot_0_48_0:Add(slot_0_54_0)
slot_0_48_0:Add(slot_0_56_0)
slot_0_48_0:Add(slot_0_58_0)
slot_0_48_0:Add(slot_0_60_0)
slot_0_48_0:Reset()
slot_0_49_0:AddCallback(function()
        local var_52_0 = slot_0_49_0:GetValue():Get()

        if not var_52_0 and slot_0_7_0 then
                slot_0_51_0:GetValue():Set(false)
                slot_0_51_0:Reset()
                slot_0_47_0()
        end

        slot_0_0_0.enabled = var_52_0

        if not slot_0_0_0.enabled and not slot_0_0_0.force_show then
                if slot_0_7_0 then
                        slot_0_47_0()
                else
                        slot_0_40_0()
                end
        end

        if slot_0_0_0.enabled then
                slot_0_2_0:ToggleVisibility(true)
        else
                slot_0_2_0:ToggleVisibility(false)
        end

        slot_0_32_0()
end)
slot_0_51_0:AddCallback(function()
        local var_53_0 = slot_0_51_0:GetValue():Get()

        if not slot_0_0_0.enabled and var_53_0 then
                slot_0_31_0("Vote Revealer", "Enable vote revealer first")
                slot_0_51_0:GetValue():Set(false)
                slot_0_51_0:Reset()

                return
        end

        slot_0_0_0.force_show = var_53_0

        if slot_0_0_0.force_show then
                slot_0_46_0()
        else
                slot_0_47_0()
        end

        slot_0_32_0()
end)
slot_0_53_0:AddCallback(function()
        local var_54_0 = slot_0_53_0:GetValue():Get()

        if #slot_0_3_0 > 0 then
                slot_0_53_0:GetValue():Set(slot_0_0_0.show_timer)
                slot_0_31_0("Vote Revealer", "Cannot modify with active vote")

                return
        end

        slot_0_0_0.show_timer = var_54_0

        slot_0_32_0()
end)
slot_0_55_0:AddCallback(function()
        slot_0_0_0.show_avatars = slot_0_55_0:GetValue():Get()

        slot_0_32_0()
end)
slot_0_57_0:AddCallback(function()
        local var_56_0 = slot_0_57_0:Get():GetRaw()
        local var_56_1 = "all"

        if var_56_0 == 2 then
                var_56_1 = "team"
        elseif var_56_0 == 4 then
                var_56_1 = "enemy"
        end

        slot_0_0_0.votes_to_watch_for = var_56_1

        slot_0_32_0()
end)
slot_0_59_0:AddCallback(function()
        slot_0_0_0.vote_say = slot_0_59_0:GetValue():Get()

        slot_0_32_0()
end)
slot_0_61_0:AddCallback(function()
        slot_0_0_0.auto_leave = slot_0_61_0:GetValue():Get()

        slot_0_32_0()
end)
mods.events:AddListener("vote_cast")
mods.events:AddListener("map_shutdown")
mods.events:AddListener("cs_win_panel_match")
mods.events:AddListener("game_phase_changed")
mods.events:AddListener("weapon_outofammo")
mods.events:AddListener("weapon_fire_on_empty")
events.event:Add(function(arg_59_0)
        local var_59_0 = arg_59_0:GetName()

        if not slot_0_0_0.enabled then
                return
        end

        if var_59_0 == "map_shutdown" then
                slot_0_41_0()
        end

        if var_59_0 == "vote_cast" then
                if slot_0_0_0.force_show then
                        return
                end

                if slot_0_7_0 then
                        return
                end

                local var_59_1 = arg_59_0:GetController("userid")

                if not var_59_1 then
                        return
                end

                local var_59_2 = var_59_1:GetName()
                local var_59_3 = var_59_1:GetStringSteamID()
                local var_59_4 = var_59_1:IsEnemy()
                local var_59_5 = entities.GetLocalController()
                local var_59_6 = var_59_5 and var_59_5:GetStringSteamID()

                if slot_0_0_0.votes_to_watch_for == "team" and var_59_4 then
                        return
                end

                if slot_0_0_0.votes_to_watch_for == "enemy" and not var_59_4 then
                        return
                end

                local var_59_7 = arg_59_0:GetInt("vote_option")
                local var_59_8 = "unknown"

                if var_59_7 == 0 then
                        var_59_8 = "YES"
                end

                if var_59_7 == 1 then
                        var_59_8 = "NO"
                end

                local var_59_9 = arg_59_0:GetInt("team")
                local var_59_10 = "unknown"

                if var_59_9 == 2 then
                        var_59_10 = "T"
                end

                if var_59_9 == 3 then
                        var_59_10 = "CT"
                end

                if var_59_10 ~= "T" and var_59_10 ~= "CT" then
                        return
                end

                local var_59_11 = 0
                local var_59_12 = 0
                local var_59_13

                entities.controllers:ForEach(function(arg_60_0)
                        local var_60_0 = arg_60_0.entity

                        if var_60_0 then
                                if var_60_0:GetPawn() ~= nil then
                                        if var_60_0:IsEnemy() then
                                                var_59_11 = var_59_11 + 1
                                        else
                                                var_59_12 = var_59_12 + 1
                                        end
                                end

                                local var_60_1 = var_60_0:GetStringSteamID()

                                if var_60_1 == var_59_3 then
                                        if var_60_1 == var_59_6 then
                                                var_59_13 = draw.textures.gui_user_avatar
                                        else
                                                var_59_13 = arg_60_0.avatar
                                        end
                                end
                        end
                end)

                local var_59_14 = {
                        player_name = var_59_2,
                        player_steam_id = var_59_3,
                        vote_cast = var_59_8,
                        team = var_59_10,
                        is_enemy = var_59_4,
                        avatar = var_59_13
                }
                local var_59_15 = slot_0_11_0[var_59_10] == nil

                table.insert(slot_0_3_0, var_59_14)

                if var_59_15 then
                        local var_59_16 = utils.GetUnixTime()

                        slot_0_11_0[var_59_10] = var_59_16
                        slot_0_9_0[var_59_10] = var_59_16 + slot_0_12_0

                        local var_59_17 = var_59_10

                        slot_0_15_0(slot_0_12_0 + 3.5, function()
                                if not slot_0_0_0.force_show and not slot_0_7_0 and slot_0_11_0[var_59_17] then
                                        slot_0_39_0(var_59_17)
                                end
                        end)
                end

                local var_59_18 = var_59_4 and var_59_11 or var_59_12

                if slot_0_43_0(var_59_10, var_59_18) then
                        local var_59_19 = var_59_10

                        slot_0_15_0(1.5, function()
                                if not slot_0_0_0.force_show and not slot_0_7_0 and not slot_0_6_0 and slot_0_11_0[var_59_19] then
                                        slot_0_39_0(var_59_19)
                                end
                        end)
                end

                local var_59_20 = var_59_4 and var_59_11 or var_59_12
                local var_59_21 = 0

                for iter_59_0, iter_59_1 in ipairs(slot_0_3_0) do
                        if iter_59_1.team == var_59_10 then
                                var_59_21 = var_59_21 + 1
                        end
                end

                if var_59_20 <= var_59_21 and var_59_20 > 0 then
                        local var_59_22 = var_59_20 == 1 and 2 or 4
                        local var_59_23 = var_59_10

                        slot_0_15_0(var_59_22, function()
                                if not slot_0_0_0.force_show and not slot_0_7_0 and not slot_0_6_0 and slot_0_11_0[var_59_23] then
                                        slot_0_39_0(var_59_23)
                                end
                        end)
                end

                if slot_0_0_0.vote_say then
                        game.engine:ClientCmd("say " .. "[" .. var_59_10 .. "] " .. var_59_2 .. " voted " .. var_59_8, false)
                end
        end
end)

function __shutdown()
        slot_0_16_0()

        for iter_64_0, iter_64_1 in pairs(slot_0_5_0) do
                slot_0_17_0.stop("slide_in_" .. iter_64_0)
                slot_0_17_0.stop("slide_out_" .. iter_64_0)
        end

        if slot_0_2_0 and gui.ctx then
                gui.ctx:Remove(slot_0_2_0)

                slot_0_2_0 = nil
        end

        slot_0_3_0 = {}
        slot_0_4_0 = {}
        slot_0_5_0 = {}
        slot_0_9_0 = {}
        slot_0_11_0 = {}
        slot_0_10_0 = {}
        slot_0_6_0 = false
        slot_0_7_0 = false
end
