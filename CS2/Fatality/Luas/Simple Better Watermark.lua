--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        show_ping = true,
        offset_y = 10,
        offset_x = 10,
        show_fps = true,
        show_username = true,
        blur_strength = 3,
        show_icons = true,
        particle_count = 15,
        animation_speed = 1.5,
        enable_animation = true,
        enable_blur = true,
        enabled = true,
        toggle_key = 45,
        animation_type = "rainbow",
        enable_particles = true,
        cheat_name = "fatality",
        corner_radius = 8,
        glow_size = 8,
        enable_glow = true,
        padding_x = 14,
        fps_smoothing = 30,
        opacity = 1,
        show_time = true,
        draggable = true,
        show_tickrate = true,
        fade_duration = 1,
        padding_y = 8,
        bg_color = draw.Color(20, 20, 25, 220),
        bg_color2 = draw.Color(25, 25, 35, 220),
        text_color = draw.Color(255, 255, 255, 255),
        shadow_color = draw.Color(0, 0, 0, 100),
        gradient_colors = {
                draw.Color(255, 80, 80, 255),
                draw.Color(255, 160, 80, 255),
                draw.Color(255, 255, 80, 255),
                draw.Color(80, 255, 80, 255),
                draw.Color(80, 160, 255, 255),
                draw.Color(160, 80, 255, 255),
                draw.Color(255, 80, 160, 255)
        }
}
slot_0_1_0 = "fatality_watermark_config.json"
slot_0_2_0 = {
        is_dragging = false,
        drag_offset_y = 0,
        drag_offset_x = 0
}

function slot_0_3_0()
        if utils.FileExists(slot_0_1_0) then
                local var_1_0 = utils.DbLoad(slot_0_1_0, {})

                if var_1_0.custom_x then
                        slot_0_2_0.custom_x = var_1_0.custom_x
                        slot_0_2_0.custom_y = var_1_0.custom_y
                end

                if var_1_0.opacity then
                        slot_0_0_0.opacity = var_1_0.opacity
                end
        end
end

function slot_0_4_0()
        local var_2_0 = {
                custom_x = slot_0_2_0.custom_x,
                custom_y = slot_0_2_0.custom_y,
                opacity = slot_0_0_0.opacity
        }

        utils.DbSave(var_2_0, slot_0_1_0)
end

slot_0_5_0 = {
        time = "T:",
        fps = "FPS:",
        tickrate = "TK:",
        ping = "MS:",
        cheat = "[>]",
        username = "@"
}
slot_0_6_0 = {}

function slot_0_7_0()
        local var_3_0 = {
                {
                        x = -10,
                        y = -10,
                        name = "top_left"
                },
                {
                        x = 10,
                        y = -10,
                        name = "top_right"
                },
                {
                        x = -10,
                        y = 10,
                        name = "bottom_left"
                },
                {
                        x = 10,
                        y = 10,
                        name = "bottom_right"
                }
        }

        for iter_3_0, iter_3_1 in ipairs(var_3_0) do
                for iter_3_2 = 1, math.floor(slot_0_0_0.particle_count / 4) do
                        table.insert(slot_0_6_0, {
                                base_x = iter_3_1.x,
                                base_y = iter_3_1.y,
                                offset_x = (math.random() - 0.5) * 15,
                                offset_y = (math.random() - 0.5) * 15,
                                rotation = math.random() * 360,
                                rotation_speed = (math.random() - 0.5) * 180,
                                scale = 0.5 + math.random() * 0.5,
                                pulse_offset = math.random() * math.pi * 2,
                                corner = iter_3_1.name
                        })
                end
        end
end

function slot_0_8_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
        local var_4_0 = 5
        local var_4_1 = arg_4_3
        local var_4_2 = arg_4_3 * 0.4

        for iter_4_0 = 0, var_4_0 - 1 do
                local var_4_3 = iter_4_0 * 2 * math.pi / var_4_0 + math.rad(arg_4_4)
                local var_4_4 = (iter_4_0 + 0.5) * 2 * math.pi / var_4_0 + math.rad(arg_4_4)
                local var_4_5 = (iter_4_0 + 1) * 2 * math.pi / var_4_0 + math.rad(arg_4_4)
                local var_4_6 = arg_4_1 + math.cos(var_4_3) * var_4_1
                local var_4_7 = arg_4_2 + math.sin(var_4_3) * var_4_1
                local var_4_8 = arg_4_1 + math.cos(var_4_4) * var_4_2
                local var_4_9 = arg_4_2 + math.sin(var_4_4) * var_4_2
                local var_4_10 = arg_4_1 + math.cos(var_4_5) * var_4_1
                local var_4_11 = arg_4_2 + math.sin(var_4_5) * var_4_1

                arg_4_0:AddTriangleFilled(draw.Vec2(arg_4_1, arg_4_2), draw.Vec2(var_4_6, var_4_7), draw.Vec2(var_4_8, var_4_9), arg_4_5)
                arg_4_0:AddTriangleFilled(draw.Vec2(arg_4_1, arg_4_2), draw.Vec2(var_4_8, var_4_9), draw.Vec2(var_4_10, var_4_11), arg_4_5)
        end
end

function slot_0_9_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
        for iter_5_0, iter_5_1 in ipairs(slot_0_6_0) do
                iter_5_1.rotation = iter_5_1.rotation + iter_5_1.rotation_speed * arg_5_0
        end
end

slot_0_3_0()
slot_0_7_0()

function slot_0_10_0(arg_6_0, arg_6_1)
        if slot_0_2_0.custom_x and slot_0_2_0.custom_y then
                return slot_0_2_0.custom_x, slot_0_2_0.custom_y
        end

        return slot_0_0_0.offset_x, slot_0_0_0.offset_y
end

function slot_0_11_0(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
        local var_7_0 = gui.input:Cursor()

        return arg_7_0 <= var_7_0.x and var_7_0.x <= arg_7_0 + arg_7_2 and arg_7_1 <= var_7_0.y and var_7_0.y <= arg_7_1 + arg_7_3
end

function slot_0_12_0()
        local var_8_0 = utils.GetDate()

        return string.format("%02d:%02d:%02d", var_8_0.hour, var_8_0.minute, var_8_0.second)
end

slot_0_13_0 = {}

function slot_0_14_0()
        local var_9_0 = math.floor(1 / draw.GetFrameTime())

        table.insert(slot_0_13_0, var_9_0)

        if #slot_0_13_0 > slot_0_0_0.fps_smoothing then
                table.remove(slot_0_13_0, 1)
        end

        local var_9_1 = 0

        for iter_9_0 = 1, #slot_0_13_0 do
                var_9_1 = var_9_1 + slot_0_13_0[iter_9_0]
        end

        return math.floor(var_9_1 / #slot_0_13_0)
end

function slot_0_15_0()
        local var_10_0 = game.engine:GetNetChan()

        if var_10_0 and not var_10_0:IsNull() then
                return (math.floor(var_10_0:GetLatency() * 1000))
        end

        return 0
end

slot_0_16_0 = 0
slot_0_17_0 = 0
slot_0_18_0 = 64

function slot_0_19_0()
        if game.engine:IsConnected() then
                local var_11_0 = game.globalVars.m_iTickCount
                local var_11_1 = game.globalVars.m_flCurTime

                if slot_0_16_0 > 0 and var_11_0 > slot_0_16_0 then
                        local var_11_2 = var_11_0 - slot_0_16_0
                        local var_11_3 = var_11_1 - slot_0_17_0

                        if var_11_3 > 0 then
                                slot_0_18_0 = math.floor(var_11_2 / var_11_3)
                        end
                end

                slot_0_16_0 = var_11_0
                slot_0_17_0 = var_11_1

                return slot_0_18_0
        end

        return 0
end

slot_0_20_0 = nil

function slot_0_21_0()
        if slot_0_20_0 then
                return slot_0_20_0
        end

        if gui.ctx and gui.ctx.user and gui.ctx.user.username then
                slot_0_20_0 = gui.ctx.user.username

                return slot_0_20_0
        end

        local var_12_0 = entities.GetLocalController()

        if var_12_0 then
                local var_12_1 = var_12_0:GetName()

                if var_12_1 and var_12_1 ~= "" then
                        slot_0_20_0 = var_12_1

                        return var_12_1
                end
        end

        return "user"
end

slot_0_22_0 = 0
slot_0_23_0 = 0
slot_0_24_0 = false

events.presentQueue:Add(function()
        slot_13_0_0 = gui.input:IsKeyDown(slot_0_0_0.toggle_key)

        if slot_13_0_0 and not slot_0_24_0 then
                slot_0_0_0.enabled = not slot_0_0_0.enabled
        end

        slot_0_24_0 = slot_13_0_0

        if not slot_0_0_0.enabled then
                return
        end

        slot_13_1_0 = draw.surface
        slot_13_1_0.font = draw.fonts.gui_main

        if slot_0_0_0.enable_animation then
                slot_0_22_0 = slot_0_22_0 + draw.GetFrameTime()
        end

        if slot_0_23_0 < 1 then
                slot_0_23_0 = slot_0_23_0 + draw.GetFrameTime() / slot_0_0_0.fade_duration

                if slot_0_23_0 > 1 then
                        slot_0_23_0 = 1
                end
        end

        slot_13_2_0 = {}
        slot_13_3_0 = 0
        slot_13_4_0 = 0

        if slot_0_0_0.cheat_name ~= "" then
                slot_13_5_6 = slot_0_0_0.show_icons and slot_0_5_0.cheat .. " " or ""

                table.insert(slot_13_2_0, slot_13_5_6 .. slot_0_0_0.cheat_name)
        end

        if slot_0_0_0.show_username then
                slot_13_5_5 = slot_0_0_0.show_icons and slot_0_5_0.username .. " " or ""

                table.insert(slot_13_2_0, slot_13_5_5 .. slot_0_21_0())
        end

        if slot_0_0_0.show_fps then
                slot_13_3_0 = slot_0_14_0()
                slot_13_5_4 = slot_0_0_0.show_icons and slot_0_5_0.fps .. " " or ""

                table.insert(slot_13_2_0, slot_13_5_4 .. slot_13_3_0 .. " fps")
        end

        if slot_0_0_0.show_ping then
                slot_13_4_0 = slot_0_15_0()
                slot_13_5_3 = slot_0_0_0.show_icons and slot_0_5_0.ping .. " " or ""

                table.insert(slot_13_2_0, slot_13_5_3 .. slot_13_4_0 .. " ms")
        end

        if slot_0_0_0.show_tickrate then
                slot_13_5_2 = slot_0_19_0()

                if slot_13_5_2 > 0 then
                        slot_13_6_1 = slot_0_0_0.show_icons and slot_0_5_0.tickrate .. " " or ""

                        table.insert(slot_13_2_0, slot_13_6_1 .. slot_13_5_2 .. " tick")
                end
        end

        if slot_0_0_0.show_time then
                slot_13_5_1 = slot_0_0_0.show_icons and slot_0_5_0.time .. " " or ""

                table.insert(slot_13_2_0, slot_13_5_1 .. slot_0_12_0())
        end

        slot_13_5_0 = table.concat(slot_13_2_0, " | ")
        slot_13_6_0 = draw.fonts.gui_main:GetTextSize(slot_13_5_0)
        slot_13_7_0 = slot_13_6_0.x + slot_0_0_0.padding_x * 2
        slot_13_8_0 = slot_13_6_0.y + slot_0_0_0.padding_y * 2
        slot_13_9_0, slot_13_10_0 = slot_0_10_0(slot_13_7_0, slot_13_8_0)

        if slot_0_0_0.draggable then
                slot_13_11_1 = gui.input:Cursor()
                slot_13_12_1 = slot_0_11_0(slot_13_9_0, slot_13_10_0, slot_13_7_0, slot_13_8_0)

                if gui.input:IsMouseDown(gui.MouseButton.LEFT) and slot_13_12_1 and not slot_0_2_0.is_dragging then
                        slot_0_2_0.is_dragging = true
                        slot_0_2_0.drag_offset_x = slot_13_11_1.x - slot_13_9_0
                        slot_0_2_0.drag_offset_y = slot_13_11_1.y - slot_13_10_0
                end

                if slot_0_2_0.is_dragging then
                        if gui.input:IsMouseDown(gui.MouseButton.LEFT) then
                                slot_0_2_0.custom_x = slot_13_11_1.x - slot_0_2_0.drag_offset_x
                                slot_0_2_0.custom_y = slot_13_11_1.y - slot_0_2_0.drag_offset_y
                                slot_13_9_0 = slot_0_2_0.custom_x
                                slot_13_10_0 = slot_0_2_0.custom_y
                        else
                                slot_0_2_0.is_dragging = false

                                slot_0_4_0()
                        end
                end
        end

        if slot_0_0_0.enable_particles then
                slot_0_9_0(draw.GetFrameTime(), slot_13_9_0, slot_13_10_0, slot_13_7_0, slot_13_8_0)
        end

        slot_13_11_0 = 1

        if slot_0_0_0.animation_type == "breathing" then
                slot_13_11_0 = 0.7 + math.sin(slot_0_22_0 * 2) * 0.3
        end

        slot_13_12_0 = slot_13_11_0 * slot_0_23_0 * slot_0_0_0.opacity
        slot_13_13_0 = draw.Color(slot_0_0_0.bg_color:GetR(), slot_0_0_0.bg_color:GetG(), slot_0_0_0.bg_color:GetB(), slot_0_0_0.bg_color:GetA() * slot_13_12_0)
        slot_13_14_0 = draw.Color(slot_0_0_0.bg_color2:GetR(), slot_0_0_0.bg_color2:GetG(), slot_0_0_0.bg_color2:GetB(), slot_0_0_0.bg_color2:GetA() * slot_13_12_0)
        slot_13_15_0 = draw.Color(slot_0_0_0.shadow_color:GetR(), slot_0_0_0.shadow_color:GetG(), slot_0_0_0.shadow_color:GetB(), slot_0_0_0.shadow_color:GetA() * slot_0_23_0 * slot_0_0_0.opacity)

        slot_13_1_0:AddRectFilledRounded(draw.Rect(slot_13_9_0 + 2, slot_13_10_0 + 2, slot_13_9_0 + slot_13_7_0 + 2, slot_13_10_0 + slot_13_8_0 + 2), slot_13_15_0, slot_0_0_0.corner_radius)

        if slot_0_0_0.enable_blur then
                slot_13_1_0:AddWithBlurShared(draw.Rect(slot_13_9_0, slot_13_10_0, slot_13_9_0 + slot_13_7_0, slot_13_10_0 + slot_13_8_0), function()
                        slot_13_1_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_13_9_0, slot_13_10_0, slot_13_9_0 + slot_13_7_0, slot_13_10_0 + slot_13_8_0), {
                                slot_13_13_0,
                                slot_13_13_0,
                                slot_13_14_0,
                                slot_13_14_0
                        }, slot_0_0_0.corner_radius, draw.Rounding.ALL)
                end)
        else
                slot_13_1_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_13_9_0, slot_13_10_0, slot_13_9_0 + slot_13_7_0, slot_13_10_0 + slot_13_8_0), {
                        slot_13_13_0,
                        slot_13_13_0,
                        slot_13_14_0,
                        slot_13_14_0
                }, slot_0_0_0.corner_radius, draw.Rounding.ALL)
        end

        slot_13_16_0 = 3
        slot_13_17_0 = #slot_0_0_0.gradient_colors
        slot_13_18_0 = slot_0_0_0.animation_speed
        slot_13_19_0 = nil
        slot_13_20_0 = nil

        if slot_0_0_0.animation_type == "rainbow" then
                slot_13_21_4 = slot_0_22_0 * slot_13_18_0 % slot_13_17_0
                slot_13_22_4 = math.floor(slot_13_21_4) % slot_13_17_0 + 1
                slot_13_23_5 = (math.floor(slot_13_21_4) + 1) % slot_13_17_0 + 1
                slot_13_24_3 = slot_13_21_4 % 1
                slot_13_25_6 = slot_0_0_0.gradient_colors[slot_13_22_4]
                slot_13_26_7 = slot_0_0_0.gradient_colors[slot_13_23_5]
                slot_13_27_6 = slot_13_25_6:GetR()
                slot_13_28_4 = slot_13_25_6:GetG()
                slot_13_29_1 = slot_13_25_6:GetB()
                slot_13_30_1 = slot_13_26_7:GetR()
                slot_13_31_1 = slot_13_26_7:GetG()
                slot_13_32_0 = slot_13_26_7:GetB()
                slot_13_19_0 = draw.Color(slot_13_27_6 + (slot_13_30_1 - slot_13_27_6) * slot_13_24_3, slot_13_28_4 + (slot_13_31_1 - slot_13_28_4) * slot_13_24_3, slot_13_29_1 + (slot_13_32_0 - slot_13_29_1) * slot_13_24_3, 255)
                slot_13_33_0 = (math.floor(slot_13_21_4) + 2) % slot_13_17_0 + 1
                slot_13_34_0 = slot_0_0_0.gradient_colors[slot_13_33_0]
                slot_13_35_0 = slot_13_34_0:GetR()
                slot_13_36_0 = slot_13_34_0:GetG()
                slot_13_37_0 = slot_13_34_0:GetB()
                slot_13_20_0 = draw.Color(slot_13_30_1 + (slot_13_35_0 - slot_13_30_1) * slot_13_24_3, slot_13_31_1 + (slot_13_36_0 - slot_13_31_1) * slot_13_24_3, slot_13_32_0 + (slot_13_37_0 - slot_13_32_0) * slot_13_24_3, 255)
        elseif slot_0_0_0.animation_type == "wave" then
                slot_13_21_3 = math.sin(slot_0_22_0 * slot_13_18_0) * 0.5 + 0.5
                slot_13_22_3 = math.floor(slot_13_21_3 * (slot_13_17_0 - 1)) + 1
                slot_13_23_4 = slot_0_0_0.gradient_colors[slot_13_22_3]
                slot_13_19_0 = slot_13_23_4
                slot_13_20_0 = slot_13_23_4
        elseif slot_0_0_0.animation_type == "slide" then
                slot_13_21_2 = slot_0_22_0 * slot_13_18_0 * 0.5 % 1
                slot_13_22_2 = slot_13_7_0
                slot_13_23_3 = math.floor(slot_13_21_2 * slot_13_17_0) % slot_13_17_0 + 1
                slot_13_24_2 = (slot_13_23_3 + 2) % slot_13_17_0 + 1
                slot_13_19_0 = slot_0_0_0.gradient_colors[slot_13_23_3]
                slot_13_20_0 = slot_0_0_0.gradient_colors[slot_13_24_2]
        else
                slot_13_19_0 = slot_0_0_0.gradient_colors[1]
                slot_13_20_0 = slot_0_0_0.gradient_colors[3]
        end

        slot_13_1_0:AddRectFilledRoundedMulticolor(draw.Rect(slot_13_9_0, slot_13_10_0, slot_13_9_0 + slot_13_7_0, slot_13_10_0 + slot_13_16_0), {
                slot_13_19_0,
                slot_13_20_0,
                slot_13_20_0,
                slot_13_19_0
        }, slot_0_0_0.corner_radius, draw.Rounding.ALL)

        if slot_0_0_0.enable_glow then
                slot_13_21_1 = slot_13_19_0:GetR()
                slot_13_22_1 = slot_13_19_0:GetG()
                slot_13_23_2 = slot_13_19_0:GetB()

                slot_13_1_0:AddGlow(draw.Rect(slot_13_9_0, slot_13_10_0, slot_13_9_0 + slot_13_7_0, slot_13_10_0 + slot_13_16_0), slot_0_0_0.glow_size, draw.Color(slot_13_21_1, slot_13_22_1, slot_13_23_2, 80 * slot_0_23_0 * slot_0_0_0.opacity))
        end

        if slot_0_0_0.enable_particles then
                for iter_13_0, iter_13_1 in ipairs(slot_0_6_0) do
                        slot_13_26_6 = (math.sin(slot_0_22_0 * 3 + iter_13_1.pulse_offset) + 1) / 2
                        slot_13_27_5 = (0.5 + slot_13_26_6 * 0.5) * 255 * slot_0_23_0 * slot_0_0_0.opacity
                        slot_13_28_3 = draw.Color(slot_13_19_0:GetR(), slot_13_19_0:GetG(), slot_13_19_0:GetB(), slot_13_27_5)
                        slot_13_29_0 = nil
                        slot_13_30_0 = nil

                        if iter_13_1.corner == "top_left" then
                                slot_13_29_0 = slot_13_9_0 + iter_13_1.base_x + iter_13_1.offset_x
                                slot_13_30_0 = slot_13_10_0 + iter_13_1.base_y + iter_13_1.offset_y
                        elseif iter_13_1.corner == "top_right" then
                                slot_13_29_0 = slot_13_9_0 + slot_13_7_0 + iter_13_1.base_x + iter_13_1.offset_x
                                slot_13_30_0 = slot_13_10_0 + iter_13_1.base_y + iter_13_1.offset_y
                        elseif iter_13_1.corner == "bottom_left" then
                                slot_13_29_0 = slot_13_9_0 + iter_13_1.base_x + iter_13_1.offset_x
                                slot_13_30_0 = slot_13_10_0 + slot_13_8_0 + iter_13_1.base_y + iter_13_1.offset_y
                        elseif iter_13_1.corner == "bottom_right" then
                                slot_13_29_0 = slot_13_9_0 + slot_13_7_0 + iter_13_1.base_x + iter_13_1.offset_x
                                slot_13_30_0 = slot_13_10_0 + slot_13_8_0 + iter_13_1.base_y + iter_13_1.offset_y
                        end

                        slot_13_31_0 = 3 * iter_13_1.scale * (0.8 + slot_13_26_6 * 0.2)

                        slot_0_8_0(slot_13_1_0, slot_13_29_0, slot_13_30_0, slot_13_31_0, iter_13_1.rotation, slot_13_28_3)
                end
        end

        slot_13_1_0:AddText(draw.Vec2(slot_13_9_0 + slot_0_0_0.padding_x + 1, slot_13_10_0 + slot_0_0_0.padding_y + slot_13_16_0 + 1), slot_13_5_0, draw.Color(0, 0, 0, 150 * slot_0_23_0 * slot_0_0_0.opacity))

        slot_13_21_0 = slot_13_9_0 + slot_0_0_0.padding_x
        slot_13_22_0 = slot_13_10_0 + slot_0_0_0.padding_y + slot_13_16_0
        slot_13_23_1 = 1

        if slot_0_0_0.cheat_name ~= "" then
                slot_13_25_4 = (slot_0_0_0.show_icons and slot_0_5_0.cheat .. " " or "") .. slot_0_0_0.cheat_name
                slot_13_26_5 = draw.Color(slot_0_0_0.text_color:GetR(), slot_0_0_0.text_color:GetG(), slot_0_0_0.text_color:GetB(), slot_0_0_0.text_color:GetA() * slot_0_23_0 * slot_0_0_0.opacity)

                slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_25_4, slot_13_26_5)

                slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_25_4).x

                if slot_13_23_1 < #slot_13_2_0 then
                        slot_13_27_4 = " | "

                        slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_27_4, slot_13_26_5)

                        slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_27_4).x
                end

                slot_13_23_1 = slot_13_23_1 + 1
        end

        if slot_0_0_0.show_username then
                slot_13_25_3 = (slot_0_0_0.show_icons and slot_0_5_0.username .. " " or "") .. slot_0_21_0()
                slot_13_26_4 = draw.Color(slot_0_0_0.text_color:GetR(), slot_0_0_0.text_color:GetG(), slot_0_0_0.text_color:GetB(), slot_0_0_0.text_color:GetA() * slot_0_23_0 * slot_0_0_0.opacity)

                slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_25_3, slot_13_26_4)

                slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_25_3).x

                if slot_13_23_1 < #slot_13_2_0 then
                        slot_13_27_3 = " | "

                        slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_27_3, slot_13_26_4)

                        slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_27_3).x
                end

                slot_13_23_1 = slot_13_23_1 + 1
        end

        if slot_0_0_0.show_fps then
                slot_13_25_2 = (slot_0_0_0.show_icons and slot_0_5_0.fps .. " " or "") .. slot_13_3_0 .. " fps"
                slot_13_26_3 = nil

                if slot_13_3_0 > 100 then
                        slot_13_26_3 = draw.Color(80, 255, 80, 255 * slot_0_23_0 * slot_0_0_0.opacity)
                elseif slot_13_3_0 >= 60 then
                        slot_13_26_3 = draw.Color(255, 255, 80, 255 * slot_0_23_0 * slot_0_0_0.opacity)
                else
                        slot_13_26_3 = draw.Color(255, 80, 80, 255 * slot_0_23_0 * slot_0_0_0.opacity)
                end

                slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_25_2, slot_13_26_3)

                slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_25_2).x

                if slot_13_23_1 < #slot_13_2_0 then
                        slot_13_27_2 = " | "
                        slot_13_28_2 = draw.Color(slot_0_0_0.text_color:GetR(), slot_0_0_0.text_color:GetG(), slot_0_0_0.text_color:GetB(), slot_0_0_0.text_color:GetA() * slot_0_23_0 * slot_0_0_0.opacity)

                        slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_27_2, slot_13_28_2)

                        slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_27_2).x
                end

                slot_13_23_1 = slot_13_23_1 + 1
        end

        if slot_0_0_0.show_ping then
                slot_13_25_1 = (slot_0_0_0.show_icons and slot_0_5_0.ping .. " " or "") .. slot_13_4_0 .. " ms"
                slot_13_26_2 = nil

                if slot_13_4_0 < 50 then
                        slot_13_26_2 = draw.Color(80, 255, 80, 255 * slot_0_23_0 * slot_0_0_0.opacity)
                elseif slot_13_4_0 <= 100 then
                        slot_13_26_2 = draw.Color(255, 255, 80, 255 * slot_0_23_0 * slot_0_0_0.opacity)
                else
                        slot_13_26_2 = draw.Color(255, 80, 80, 255 * slot_0_23_0 * slot_0_0_0.opacity)
                end

                slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_25_1, slot_13_26_2)

                slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_25_1).x

                if slot_13_23_1 < #slot_13_2_0 then
                        slot_13_27_1 = " | "
                        slot_13_28_1 = draw.Color(slot_0_0_0.text_color:GetR(), slot_0_0_0.text_color:GetG(), slot_0_0_0.text_color:GetB(), slot_0_0_0.text_color:GetA() * slot_0_23_0 * slot_0_0_0.opacity)

                        slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_27_1, slot_13_28_1)

                        slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_27_1).x
                end

                slot_13_23_1 = slot_13_23_1 + 1
        end

        if slot_0_0_0.show_tickrate then
                slot_13_24_0 = slot_0_19_0()

                if slot_13_24_0 > 0 then
                        slot_13_26_1 = (slot_0_0_0.show_icons and slot_0_5_0.tickrate .. " " or "") .. slot_13_24_0 .. " tick"
                        slot_13_27_0 = draw.Color(slot_0_0_0.text_color:GetR(), slot_0_0_0.text_color:GetG(), slot_0_0_0.text_color:GetB(), slot_0_0_0.text_color:GetA() * slot_0_23_0 * slot_0_0_0.opacity)

                        slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_26_1, slot_13_27_0)

                        slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_26_1).x

                        if slot_13_23_1 < #slot_13_2_0 then
                                slot_13_28_0 = " | "

                                slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_28_0, slot_13_27_0)

                                slot_13_21_0 = slot_13_21_0 + draw.fonts.gui_main:GetTextSize(slot_13_28_0).x
                        end

                        slot_13_23_0 = slot_13_23_1 + 1
                end
        end

        if slot_0_0_0.show_time then
                slot_13_25_0 = (slot_0_0_0.show_icons and slot_0_5_0.time .. " " or "") .. slot_0_12_0()
                slot_13_26_0 = draw.Color(slot_0_0_0.text_color:GetR(), slot_0_0_0.text_color:GetG(), slot_0_0_0.text_color:GetB(), slot_0_0_0.text_color:GetA() * slot_0_23_0 * slot_0_0_0.opacity)

                slot_13_1_0:AddText(draw.Vec2(slot_13_21_0, slot_13_22_0), slot_13_25_0, slot_13_26_0)
        end
end)
print("Watermark loaded successfully! Drag with mouse to reposition.")
