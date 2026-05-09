--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = draw
slot_0_1_0 = game
slot_0_2_0 = gui
slot_0_3_0 = entities
slot_0_4_0 = math.lerp
slot_0_5_0 = events
slot_0_6_0 = {
        counter = {}
}

function slot_0_0_0.color.unpack(arg_1_0)
        return arg_1_0:get_r(), arg_1_0:get_g(), arg_1_0:get_b(), arg_1_0:get_a()
end

function slot_0_7_0(arg_2_0)
        local var_2_0 = {
                set = function(arg_3_0, arg_3_1)
                        return arg_3_0:get_value():set(arg_3_1)
                end,
                set_text = function(arg_4_0, arg_4_1)
                        arg_4_0:set_text(arg_4_1)
                end,
                get = function(arg_5_0)
                        return arg_5_0:get_value():get()
                end,
                set_callback = function(arg_6_0, arg_6_1)
                        arg_6_0:add_callback(arg_6_1)
                end
        }

        return setmetatable({}, {
                __index = function(arg_7_0, arg_7_1)
                        assert(var_2_0[arg_7_1], "methods not found")

                        if var_2_0[arg_7_1] then
                                return function(arg_8_0, ...)
                                        return var_2_0[arg_7_1](arg_2_0, ...)
                                end
                        end

                        return arg_2_0[arg_7_1]
                end
        })
end

function slot_0_8_0(arg_9_0, arg_9_1)
        local var_9_0 = string.lower(arg_9_0)

        if not slot_0_6_0.counter[var_9_0] then
                slot_0_6_0.counter[var_9_0] = {}
        end

        local var_9_1 = string.lower(arg_9_1):gsub(" ", "_")

        if not slot_0_6_0.counter[var_9_0][var_9_1] then
                slot_0_6_0.counter[var_9_0][var_9_1] = 0
        end

        slot_0_6_0.counter[var_9_0][var_9_1] = slot_0_6_0.counter[var_9_0][var_9_1] + 1

        if slot_0_6_0.counter[var_9_0][var_9_1] == 1 then
                return string.format("%s>%s", var_9_0, var_9_1)
        end

        return string.format("%s>%s_%d", var_9_0, var_9_1, slot_0_6_0.counter[var_9_0][var_9_1])
end

slot_0_9_0 = {}
slot_0_9_0.__index = slot_0_9_0

function slot_0_6_0.create(arg_10_0, arg_10_1)
        local var_10_0 = setmetatable({}, slot_0_9_0)

        var_10_0.name = arg_10_0
        var_10_0.display_name = arg_10_1
        var_10_0.controls = {}

        return var_10_0
end

function slot_0_6_0.find(arg_11_0)
        local var_11_0 = slot_0_2_0.ctx:find(arg_11_0)

        return slot_0_7_0(var_11_0)
end

function slot_0_9_0.check(arg_12_0, arg_12_1)
        local var_12_0 = slot_0_8_0(arg_12_0.name, arg_12_0.display_name .. "_check")
        local var_12_1 = slot_0_2_0.checkbox(slot_0_2_0.control_id(var_12_0))

        arg_12_0:add_control(arg_12_1, var_12_1)

        return slot_0_7_0(var_12_1)
end

function slot_0_9_0.slider(arg_13_0, arg_13_1, ...)
        local var_13_0 = slot_0_8_0(arg_13_0.name, arg_13_0.display_name .. "_slider")
        local var_13_1 = slot_0_2_0.slider(slot_0_2_0.control_id(var_13_0), ...)

        arg_13_0:add_control(arg_13_1, var_13_1)

        return slot_0_7_0(var_13_1)
end

function slot_0_9_0.button(arg_14_0, arg_14_1, ...)
        local var_14_0 = slot_0_8_0(arg_14_0.name, arg_14_0.display_name .. "_button")
        local var_14_1 = slot_0_2_0.button(slot_0_2_0.control_id(var_14_0), arg_14_1)

        arg_14_0:add_control(arg_14_1, var_14_1)
        var_14_1:add_callback(...)

        return slot_0_7_0(var_14_1)
end

function slot_0_9_0.color_picker(arg_15_0, arg_15_1, arg_15_2)
        local var_15_0 = slot_0_8_0(arg_15_0.name, arg_15_0.display_name .. "_picker")
        local var_15_1 = slot_0_2_0.color_picker(slot_0_2_0.control_id(var_15_0), arg_15_1)

        arg_15_0:add_control(arg_15_1, var_15_1)

        if arg_15_2 then
                var_15_1:get_value():set(arg_15_2)
        end

        return slot_0_7_0(var_15_1)
end

function slot_0_9_0.select(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
        assert(type(arg_16_2) == "table", "items type not is table")

        local var_16_0 = slot_0_8_0(arg_16_0.name, arg_16_0.display_name .. "_select")
        local var_16_1 = slot_0_2_0.combo_box(slot_0_2_0.control_id(var_16_0))

        if arg_16_3 == nil then
                -- block empty
        end

        var_16_1.allow_multiple = arg_16_3

        for iter_16_0 = 1, #arg_16_2 do
                var_16_1:add(slot_0_2_0.selectable(slot_0_2_0.control_id(string.format("%s_option_%s", var_16_0, iter_16_0)), arg_16_2[iter_16_0]))
        end

        arg_16_0:add_control(arg_16_1, var_16_1)

        return slot_0_7_0(var_16_1)
end

function slot_0_9_0.add_control(arg_17_0, arg_17_1, arg_17_2)
        local var_17_0 = slot_0_2_0.ctx:find(arg_17_0.name)

        var_17_0:add(slot_0_2_0.make_control(arg_17_1, arg_17_2))
        var_17_0:reset()
        table.insert(arg_17_0.controls, arg_17_2)
end

slot_0_10_0 = {
        over_Left = slot_0_6_0.find("rage>anti-aim>angles>override left"),
        over_Right = slot_0_6_0.find("rage>anti-aim>angles>override right"),
        over_Back = slot_0_6_0.find("rage>anti-aim>angles>override back"),
        over_Forward = slot_0_6_0.find("rage>anti-aim>angles>override forward")
}
slot_0_11_0 = {
        blink = function(arg_18_0, arg_18_1)
                return math.sin(math.abs(-math.pi + slot_0_1_0.global_vars.real_time * (1 / arg_18_1) % (math.pi * 1))) * arg_18_0
        end,
        rainbow = function(arg_19_0)
                local var_19_0 = slot_0_1_0.global_vars.real_time
                local var_19_1
                local var_19_2
                local var_19_3
                local var_19_4 = (math.sin(var_19_0 * arg_19_0) + 1) / 2
                local var_19_5 = (math.sin(var_19_0 * arg_19_0 + 2) + 1) / 2
                local var_19_6 = (math.sin(var_19_0 * arg_19_0 + 4) + 1) / 2

                return math.floor(var_19_4 * 255), math.floor(var_19_5 * 255), math.floor(var_19_6 * 255)
        end
}
slot_0_12_0, slot_0_13_0 = slot_0_1_0.engine:get_screen_size()
slot_0_14_0 = slot_0_12_0 / 2
slot_0_15_0 = slot_0_13_0 / 2
slot_0_16_0 = 0
slot_0_17_0 = 0
slot_0_18_0 = 0
slot_0_19_0 = slot_0_6_0.create("lua>elements a", "indicator")
slot_0_20_0 = slot_0_19_0:check("Circle AA Ind")
slot_0_21_0 = slot_0_19_0:slider("Anim Speed", 1, 20, {
        "%.0fms"
}, 1)
slot_0_22_0 = slot_0_19_0:slider("Circle Radius", 10, 35, {
        "%.0fpx"
}, 1)
slot_0_23_0 = slot_0_19_0:slider("Circle Gap", 10, 300, {
        "%.0f%%"
}, 1)
slot_0_24_0 = slot_0_19_0:color_picker("Circle Color", slot_0_0_0.color(235, 5, 90, 255))
slot_0_25_0 = slot_0_19_0:check("Circle Blink")
slot_0_26_0 = slot_0_19_0:slider("Blink Speed", 1, 200, {
        "%.0fms"
}, 1)
slot_0_27_0 = slot_0_19_0:check("Rainbow Color")
slot_0_28_0 = slot_0_19_0:slider("Rainbow Speed", 1, 200, {
        "%.0fms"
}, 1)

function slot_0_29_0()
        local var_20_0 = slot_0_3_0.get_local_pawn()

        if not slot_0_20_0:get() or var_20_0 == nil or not var_20_0:is_alive() then
                return
        end

        local var_20_1 = slot_0_10_0.over_Left:get()
        local var_20_2 = slot_0_10_0.over_Right:get()
        local var_20_3 = slot_0_10_0.over_Back:get()
        local var_20_4 = slot_0_10_0.over_Forward:get()
        local var_20_5 = slot_0_25_0:get()
        local var_20_6 = slot_0_23_0:get()
        local var_20_7 = slot_0_24_0:get()
        local var_20_8 = slot_0_26_0:get() / 100
        local var_20_9 = slot_0_28_0:get() / 100
        local var_20_10, var_20_11, var_20_12, var_20_13 = var_20_7:unpack()
        local var_20_14, var_20_15, var_20_16 = slot_0_11_0.rainbow(var_20_9)

        if slot_0_27_0:get() then
                var_20_10, var_20_11, var_20_12 = var_20_14, var_20_15, var_20_16
        end

        local var_20_17 = var_20_5 and slot_0_11_0.blink(var_20_13, var_20_8) or var_20_13
        local var_20_18 = var_20_5 and slot_0_11_0.blink(var_20_17 < 10 and 0 or 10, var_20_8) or var_20_13 < 10 and 0 or 10
        local var_20_19 = {
                slot_0_0_0.color(var_20_10, var_20_11, var_20_12, var_20_17),
                slot_0_0_0.color(var_20_10, var_20_11, var_20_12, var_20_18)
        }
        local var_20_20 = var_20_1 and -var_20_6 or var_20_2 and var_20_6 or 0
        local var_20_21 = var_20_3 and -var_20_6 or var_20_4 and var_20_6 or 0
        local var_20_22 = slot_0_21_0:get() / 100
        local var_20_23 = slot_0_22_0:get()

        if var_20_1 or var_20_2 then
                slot_0_16_0 = slot_0_4_0(slot_0_16_0, var_20_20, var_20_22)
                slot_0_18_0 = slot_0_4_0(slot_0_18_0, var_20_23, var_20_22)
                slot_0_17_0 = slot_0_4_0(slot_0_17_0, 5, var_20_22)
        elseif var_20_3 or var_20_4 then
                slot_0_16_0 = slot_0_4_0(slot_0_16_0, 0, var_20_22)
                slot_0_18_0 = slot_0_4_0(slot_0_18_0, var_20_23, var_20_22)
                slot_0_17_0 = slot_0_4_0(slot_0_17_0, var_20_21, var_20_22)
        else
                slot_0_16_0 = slot_0_4_0(slot_0_16_0, 0, var_20_22)
                slot_0_18_0 = slot_0_4_0(slot_0_18_0, 0, var_20_22)
                slot_0_17_0 = slot_0_4_0(slot_0_17_0, 0, var_20_22)
        end

        slot_0_0_0.surface:add_circle_filled_multicolor(slot_0_0_0.vec2(slot_0_14_0 + slot_0_16_0, slot_0_15_0 - slot_0_17_0), slot_0_18_0, var_20_19, 36, 1)
end

slot_0_5_0.present_queue:add(slot_0_29_0)
