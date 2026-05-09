--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = 30
slot_0_1_0 = 300
slot_0_2_0 = draw.surface
slot_0_3_0 = " | "
slot_0_4_0 = " "
slot_0_5_0 = "fatality.win"
slot_0_6_0 = gui.ctx.user.username
slot_0_7_0 = 0
slot_0_8_0 = 0
slot_0_9_0 = 0
slot_0_10_0 = 0
slot_0_11_0 = 0

function get_fps()
        slot_0_7_0 = 0.9 * slot_0_7_0 + 0.1 * game.global_vars.frame_time

        return math.min(999, math.floor(1 / slot_0_7_0 + 0.5))
end

slot_0_12_0 = 0
slot_0_13_0 = game.engine:get_netchan()

function slot_0_14_0()
        local var_2_0 = game.engine:get_netchan()

        if var_2_0 and not var_2_0:is_null() then
                local var_2_1 = var_2_0:get_latency()

                if var_2_1 then
                        return math.min(999, math.floor(var_2_1 * 1000))
                end
        end

        return 0
end

slot_0_15_0 = draw.color(15, 15, 35, 250)
slot_0_16_0 = draw.color(35, 30, 70, 200)
slot_0_17_0 = draw.color(235, 5, 90)
slot_0_18_0 = draw.color(70, 60, 140)
slot_0_19_0 = draw.color(255, 255, 255)
slot_0_20_0 = draw.color(75, 15, 140, 250)
slot_0_21_0, slot_0_22_0 = game.engine:get_screen_size()
slot_0_23_0 = slot_0_21_0 * 0.883
slot_0_24_0 = slot_0_22_0 * 0.0105
slot_0_25_0 = slot_0_21_0 * 0.9943
slot_0_26_0 = slot_0_22_0 * 0.0315
slot_0_27_0 = draw.vec2(slot_0_23_0 + slot_0_23_0 * 0.005, slot_0_24_0 + slot_0_24_0 * 0.85)
slot_0_28_0 = slot_0_22_0 * 0.014

function slot_0_29_0()
        local var_3_0 = slot_0_14_0()

        if var_3_0 >= 1 then
                var_3_0 = var_3_0 .. " ms"
        else
                var_3_0 = ""
        end

        slot_0_8_0 = slot_0_8_0 + 0.01
        slot_0_9_0 = slot_0_9_0 + 0.01

        if slot_0_9_0 >= 0.7 then
                slot_0_10_0 = get_fps()
                slot_0_11_0 = slot_0_10_0 .. " fps"
                slot_0_9_0 = 0
        end

        local var_3_1 = slot_0_5_0 .. slot_0_3_0 .. slot_0_6_0 .. slot_0_3_0 .. slot_0_11_0 .. slot_0_3_0 .. var_3_0

        slot_0_2_0:add_shadow_rect(draw.rect(slot_0_23_0, slot_0_24_0, slot_0_25_0, slot_0_26_0), 20, true, 0.6)
        slot_0_2_0:add_glow(draw.rect(slot_0_23_0, slot_0_24_0, slot_0_25_0, slot_0_28_0), 7, slot_0_20_0)
        slot_0_2_0:add_rect_filled_multicolor(draw.rect(slot_0_23_0, slot_0_24_0, slot_0_25_0, slot_0_26_0), {
                slot_0_15_0,
                slot_0_15_0,
                slot_0_16_0,
                slot_0_16_0
        })
        slot_0_2_0:add_rect_filled_multicolor(draw.rect(slot_0_23_0, slot_0_24_0, slot_0_25_0, slot_0_28_0), {
                slot_0_17_0,
                slot_0_18_0,
                slot_0_18_0,
                slot_0_17_0
        })

        slot_0_2_0.font = draw.fonts.gui_main

        slot_0_2_0:add_text(slot_0_27_0, var_3_1, slot_0_19_0)
end

events.present_queue:add(slot_0_29_0)

slot_0_30_0 = slot_0_22_0 * 0.014

print("soma " .. slot_0_30_0)
print("x " .. slot_0_21_0 .. " y " .. slot_0_22_0)
