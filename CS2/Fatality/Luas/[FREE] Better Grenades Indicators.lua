--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if ffi == nil then
        return gui.notify:add(gui.notification("Better Grenade indicators", "You must turn on \"Allow insecure\" toggle to use this lua."))
end

slot_0_0_0 = draw.surface
slot_0_1_0 = draw.svg_texture("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"94\" height=\"90\"><path d=\"M59 9h3v2h-1v4h1v3h1v2h1v4h1v7h-1v3h-1v3h-1v2h-1v1h-1v1h-1v1h-1v1h-2v1h-1v1h-1v1h-1v2h1v1h2v1h2v-1h2v-1h1v-3h1v-4h1v-1h1v-2h1v-1h2v-1h1v-1h1v-1h2v-1h3v-1h2v-1h1v-1h1v-1h1v-1h1v-3h1v-6h1v1h1v1h1v2h1v3h1v6h-1v3h-1v1h-1v2h-1v1h-1v1h-1v1h-1v1h-1v1h-1v2h-1v2h-1v19h-1v3h-1v2h-1v1h-1v1h-1v1h-1v1h-1v1h-1v1h-1v1h-2v1h-2v1h-5v1H46v-1h-5v-1h-3v-1h-2v-1h-2v-1h-1v-1h-1v-1h-1v-2h-1v-2h-1v-3h-1v-4h-1v-5h-1v1h-1v1h-1v2h-1v3h-1v2h1v4h1v4h1v4h-1v1h-4v1h-1v-1h-3v-1h-2v-1h-1v-1h-1v-1h-1v-2h-1v-3H9v-6H8V53h1v-3h1v-2h1v-2h1v-1h1v-1h1v-1h1v-1h1v-1h1v-1h2v-1h1v-1h2v-1h1v-1h1v-1h1v-1h1v-9h-1v-2h-1v-2h-1v-2h-1v-1h-1v-1h-1v-2h2v1h3v1h3v1h1v1h2v1h1v1h1v1h1v1h1v2h1v4h1v7h-1v2h1v-1h1v-1h1v-1h1v-1h2v-1h2v-1h2v-1h3v-1h2v-1h2v-1h1v-1h1v-2h1v-4h-1v-8h1v-1h1v-1h1v-1h1Z\" fill=\"#FFF\"/></svg>", 192)

slot_0_1_0:create()

slot_0_2_0 = draw.color(28, 28, 28, 180)
slot_0_3_0 = draw.color(255, 79, 94)
slot_0_4_0 = draw.fonts.gui_main
slot_0_5_0 = ffi.cast("uint64_t(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "GetModuleHandleA"))
slot_0_6_0 = slot_0_5_0("client.dll")
slot_0_7_0 = slot_0_5_0("engine2.dll")
slot_0_8_0 = {
        value = false,
        name = ""
}

function slot_0_8_0.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
        local var_1_0 = setmetatable({}, slot_0_8_0)

        var_1_0.name = arg_1_1
        var_1_0.value = arg_1_2
        var_1_0.control = arg_1_3

        return var_1_0
end

function slot_0_8_0.__index(arg_2_0, arg_2_1)
        return slot_0_8_0[arg_2_1]
end

function slot_0_8_0.get(arg_3_0)
        if arg_3_0.control == nil then
                return
        end

        if type(arg_3_0.control.get_value) ~= "function" then
                return
        end

        return arg_3_0.control
end

function slot_0_8_0.set(arg_4_0, arg_4_1)
        if not arg_4_0.control then
                return
        end

        if type(arg_4_0.control.set_value) ~= "function" then
                return
        end

        return arg_4_0.control:set_value(arg_4_1)
end

function slot_0_9_0(arg_5_0)
        if arg_5_0.name == nil or arg_5_0.value == nil or arg_5_0.control == nil then
                return
        end

        local var_5_0 = gui.make_control(arg_5_0.name, arg_5_0.control)
        local var_5_1 = gui.ctx:find("lua>elements a")

        var_5_1:add(var_5_0)
        var_5_1:reset()
end

function slot_0_10_0(arg_6_0)
        if arg_6_0 == nil then
                return
        end

        for iter_6_0, iter_6_1 in pairs(arg_6_0) do
                if iter_6_1 == nil then
                        return
                end

                slot_0_9_0(iter_6_1)
        end
end

slot_0_11_0 = {
        slot_0_8_0:new("Better Smokes Indicators", false, gui.checkbox(gui.control_id("better_grenades > smokes"))),
        slot_0_8_0:new("Better Molotovs Indicators", false, gui.checkbox(gui.control_id("better_grenades > molotovs"))),
        slot_0_8_0:new("Custom Theme", false, gui.color_picker(gui.control_id("better_grenades > theme"))),
        slot_0_8_0:new("Custom Smoke Color", false, gui.checkbox(gui.control_id("better_grenades > custom_smoke_color_cb"))),
        slot_0_8_0:new("Smoke Theme", false, gui.color_picker(gui.control_id("better_grenades > custom_smoke_color_theme")))
}
slot_0_12_0 = {
        dwBuildNumber = 5508068
}
slot_0_13_0 = {
        dwEntityList = 27482544,
        dwGameEntitySystem_highestEntityIndex = 8432,
        dwGameEntitySystem = 28690120
}
slot_0_14_0 = ffi.cast("int*", slot_0_7_0 + slot_0_12_0.dwBuildNumber)[0]

print(slot_0_14_0)

if slot_0_14_0 ~= 14068 then
        gui.notify:add(gui.notification("Better Grenade indicator", "Lua is outdated, please wait for update."))

        return
end

slot_0_10_0(slot_0_11_0)

slot_0_15_0 = {
        m_nInfernoType = 5852,
        m_nFireEffectTickBegin = 5868,
        m_firePositions = 3480,
        m_bFireIsBurning = 5016
}
slot_0_16_0 = {
        m_vSmokeColor = 4636,
        m_vSmokeDetonationPos = 4648,
        m_bDidSmokeEffect = 4628,
        flNextTrailLineTime = 4536
}

ffi.cdef("    typedef struct {\n        float x;\n        float y;\n        float z;\n    } Vector;\n\n    typedef struct {\n        float spawnTime; \n    } GameTime_t;\n")

function convexHull(arg_7_0)
        local function var_7_0(arg_8_0, arg_8_1, arg_8_2)
                return (arg_8_1.x - arg_8_0.x) * (arg_8_2.y - arg_8_0.y) - (arg_8_1.y - arg_8_0.y) * (arg_8_2.x - arg_8_0.x)
        end

        table.sort(arg_7_0, function(arg_9_0, arg_9_1)
                return arg_9_0.x == arg_9_1.x and arg_9_0.y < arg_9_1.y or arg_9_0.x < arg_9_1.x
        end)

        local var_7_1 = {}

        for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
                while #var_7_1 >= 2 and var_7_0(var_7_1[#var_7_1 - 1], var_7_1[#var_7_1], iter_7_1) <= 0 do
                        table.remove(var_7_1)
                end

                table.insert(var_7_1, iter_7_1)
        end

        local var_7_2 = {}

        for iter_7_2 = #arg_7_0, 1, -1 do
                local var_7_3 = arg_7_0[iter_7_2]

                while #var_7_2 >= 2 and var_7_0(var_7_2[#var_7_2 - 1], var_7_2[#var_7_2], var_7_3) <= 0 do
                        table.remove(var_7_2)
                end

                table.insert(var_7_2, var_7_3)
        end

        table.remove(var_7_2, 1)
        table.remove(var_7_2, #var_7_2)

        for iter_7_3, iter_7_4 in ipairs(var_7_2) do
                table.insert(var_7_1, iter_7_4)
        end

        return var_7_1
end

function move_point_away_from_centroid(arg_10_0, arg_10_1, arg_10_2)
        local var_10_0 = vector(arg_10_0.x - arg_10_1.x, arg_10_0.y - arg_10_1.y, arg_10_0.z - arg_10_1.z)
        local var_10_1 = math.sqrt(var_10_0.x * var_10_0.x + var_10_0.y * var_10_0.y + var_10_0.z * var_10_0.z)

        if var_10_1 > 0 then
                var_10_0 = vector(var_10_0.x / var_10_1, var_10_0.y / var_10_1, var_10_0.z / var_10_1)
        end

        return vector(arg_10_0.x + var_10_0.x * arg_10_2, arg_10_0.y + var_10_0.y * arg_10_2, arg_10_0.z + var_10_0.z * arg_10_2)
end

function draw_circle_3d(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
        local var_11_0 = 2 * math.pi / arg_11_2
        local var_11_1 = vector(arg_11_0.x + arg_11_1 * math.cos(0), arg_11_0.y + arg_11_1 * math.sin(0), arg_11_0.z)
        local var_11_2 = math.world_to_screen(var_11_1)

        for iter_11_0 = 1, arg_11_2 do
                local var_11_3 = iter_11_0 * var_11_0
                local var_11_4 = vector(arg_11_0.x + arg_11_1 * math.cos(var_11_3), arg_11_0.y + arg_11_1 * math.sin(var_11_3), arg_11_0.z)
                local var_11_5 = math.world_to_screen(var_11_4)

                slot_0_0_0:add_line(var_11_2, var_11_5, arg_11_3, arg_11_4)

                var_11_2 = var_11_5
        end
end

function draw_progres_molotov(arg_12_0, arg_12_1, arg_12_2)
        local var_12_0 = math.world_to_screen(vector(arg_12_0.x, arg_12_0.y, arg_12_0.z + 14))
        local var_12_1 = var_12_0
        local var_12_2 = draw.vec2(var_12_0.x + 30, var_12_0.y + 30)
        local var_12_3 = draw.rect(var_12_1, var_12_2):translate(draw.vec2(-15, -15)):expand(10)
        local var_12_4 = var_12_3:padding_right(27):padding_bottom(20):center()

        slot_0_0_0:add_circle_filled(var_12_4, 24, slot_0_3_0:a(50), 128)
        slot_0_0_0:add_circle_filled(var_12_4, 22, slot_0_2_0:a(50), 128)

        local var_12_5 = slot_0_0_0.g

        var_12_5:set_texture(slot_0_1_0)
        slot_0_0_0:add_rect_filled(var_12_3, draw.color.white())
        var_12_5:set_texture(nil)

        local var_12_6 = arg_12_2 - (game.global_vars.tick_count - arg_12_1)
        local var_12_7 = string.format("%.1f", var_12_6 / 64)
        local var_12_8 = draw.text_params.with_vh(draw.text_alignment.center, draw.text_alignment.center)

        draw.surface.font = slot_0_4_0

        slot_0_0_0:add_text(var_12_3:padding_right(27):padding_bottom(20):margin_top(14):center(), var_12_7, draw.color.white(), var_12_8)
end

function draw_progres_smoke(arg_13_0, arg_13_1)
        draw_circle_3d(arg_13_0, 160, 128, slot_0_3_0, 2)

        local var_13_0 = math.world_to_screen(arg_13_0)
        local var_13_1 = draw.rect(var_13_0, draw.vec2(var_13_0.x + 15, var_13_0.y)):translate(draw.vec2(-9, 10)):expand(10):padding_top(10)

        slot_0_0_0:add_rect_filled(var_13_1, slot_0_2_0)

        local var_13_2 = 1 - arg_13_1 / 1344
        local var_13_3 = var_13_1:expand(-2):width(var_13_1:expand(-2):width() * var_13_2)

        slot_0_0_0:add_rect_filled(var_13_3, slot_0_3_0)
end

slot_0_17_0 = {}

function draw_grenades()
        slot_14_0_0 = ffi.cast("uintptr_t*", slot_0_6_0 + slot_0_13_0.dwGameEntitySystem)[0]
        slot_14_1_0 = ffi.cast("int*", slot_14_0_0 + slot_0_13_0.dwGameEntitySystem_highestEntityIndex)[0]
        slot_14_2_0 = entities.get_local_pawn()

        if slot_14_2_0 == nil then
                return
        end

        if not slot_14_2_0:is_alive() then
                return
        end

        slot_14_3_0 = ffi.cast("uintptr_t*", slot_0_6_0 + slot_0_13_0.dwEntityList)[0]

        for iter_14_0 = 65, slot_14_1_0 do
                slot_14_8_0 = ffi.cast("uintptr_t*", slot_14_3_0 + (8 * bit32.rshift(bit32.band(iter_14_0, 32767), 9) + 16))[0]

                if slot_14_8_0 == 0 then
                        -- block empty
                else
                        slot_14_9_0 = ffi.cast("uintptr_t*", slot_14_8_0 + 120 * bit32.band(iter_14_0, 511))[0]

                        if slot_14_9_0 == 0 then
                                -- block empty
                        else
                                slot_14_10_0 = ffi.cast("uintptr_t*", slot_14_9_0 + 16)[0]

                                if slot_14_10_0 == 0 then
                                        -- block empty
                                else
                                        slot_14_11_0 = ffi.cast("uintptr_t*", slot_14_10_0 + 8)[0]

                                        if slot_14_11_0 == 0 then
                                                -- block empty
                                        else
                                                slot_14_12_0 = ffi.cast("uintptr_t*", slot_14_11_0 + 40)[0]

                                                if slot_14_12_0 == 0 then
                                                        -- block empty
                                                else
                                                        slot_14_13_0 = ffi.cast("uintptr_t*", slot_14_12_0 + 8)[0]

                                                        if slot_14_13_0 == 0 then
                                                                -- block empty
                                                        else
                                                                slot_14_14_0 = ffi.string(ffi.cast("char*", slot_14_13_0), 32)

                                                                if not slot_14_14_0 or slot_14_14_0 == "" then
                                                                        -- block empty
                                                                else
                                                                        if slot_0_11_0[2]:get():get_value():get() and ffi.string(slot_14_14_0) == "C_Inferno" then
                                                                                if not ffi.cast("bool*", slot_14_9_0 + slot_0_15_0.m_bFireIsBurning)[0] then
                                                                                        slot_0_17_0[tostring(iter_14_0)] = nil

                                                                                        goto label_14_0
                                                                                end

                                                                                slot_14_16_2 = {}

                                                                                for iter_14_1 = 0, 63 do
                                                                                        slot_14_21_1 = ffi.cast("Vector*", slot_14_9_0 + slot_0_15_0.m_firePositions + iter_14_1 * ffi.sizeof("Vector"))

                                                                                        if slot_14_21_1.x ~= 0 or slot_14_21_1.y ~= 0 or slot_14_21_1.z ~= 0 then
                                                                                                slot_14_22_2 = vector(slot_14_21_1.x, slot_14_21_1.y, slot_14_21_1.z)

                                                                                                if slot_14_2_0:get_abs_origin():dist(slot_14_22_2) > 1250 then
                                                                                                        return
                                                                                                end

                                                                                                slot_0_17_0[tostring(iter_14_0)] = slot_0_17_0[tostring(iter_14_0)] or slot_14_22_2

                                                                                                table.insert(slot_14_16_2, slot_14_22_2)
                                                                                        end
                                                                                end

                                                                                slot_14_17_1 = ffi.cast("int*", slot_14_9_0 + slot_0_15_0.m_nFireEffectTickBegin)[0]
                                                                                slot_14_19_0 = ffi.cast("int*", slot_14_9_0 + slot_0_15_0.m_nInfernoType)[0] == 0 and 449 or 353
                                                                                slot_14_20_1 = convexHull(slot_14_16_2)
                                                                                slot_14_21_0 = #slot_14_20_1

                                                                                if slot_14_21_0 == 0 then
                                                                                        goto label_14_0
                                                                                end

                                                                                slot_14_22_1 = vector(0, 0, 0)

                                                                                for iter_14_2, iter_14_3 in ipairs(slot_14_20_1) do
                                                                                        slot_14_22_1 = slot_14_22_1 + iter_14_3
                                                                                end

                                                                                slot_14_22_0 = vector(slot_14_22_1.x / slot_14_21_0, slot_14_22_1.y / slot_14_21_0, slot_14_22_1.z / slot_14_21_0)
                                                                                slot_14_23_0 = slot_14_20_1[1]

                                                                                for iter_14_4, iter_14_5 in ipairs(slot_14_16_2) do
                                                                                        if iter_14_5.z > slot_14_23_0.z then
                                                                                                slot_14_23_0 = iter_14_5
                                                                                        end
                                                                                end

                                                                                slot_14_22_0.z = slot_14_23_0.z

                                                                                for iter_14_6 = 1, slot_14_21_0 do
                                                                                        slot_14_28_0 = move_point_away_from_centroid(slot_14_20_1[iter_14_6], slot_14_22_0, 60)
                                                                                        slot_14_29_0 = move_point_away_from_centroid(slot_14_20_1[iter_14_6 % slot_14_21_0 + 1], slot_14_22_0, 60)
                                                                                        slot_14_30_0 = math.world_to_screen(slot_14_28_0)
                                                                                        slot_14_31_0 = math.world_to_screen(slot_14_29_0)
                                                                                        slot_14_32_0 = math.world_to_screen(slot_14_22_0)

                                                                                        slot_0_0_0:add_triangle_filled(slot_14_30_0, slot_14_31_0, slot_14_32_0, draw.color(255, 0, 0, 50))
                                                                                end

                                                                                draw_progres_molotov(slot_0_17_0[tostring(iter_14_0)], slot_14_17_1, slot_14_19_0)
                                                                        end

                                                                        if ffi.string(slot_14_14_0) == "C_SmokeGrenadeProjectile" then
                                                                                if slot_0_11_0[4]:get():get_value():get() then
                                                                                        slot_14_15_0 = ffi.cast("Vector*", slot_14_9_0 + slot_0_16_0.m_vSmokeColor)[0]
                                                                                        slot_14_16_1 = slot_0_11_0[5]:get():get_value():get()
                                                                                        slot_14_15_0.x = slot_14_16_1:get_r()
                                                                                        slot_14_15_0.y = slot_14_16_1:get_g()
                                                                                        slot_14_15_0.z = slot_14_16_1:get_b()
                                                                                end

                                                                                if not slot_0_11_0[1]:get():get_value():get() or not ffi.cast("bool*", slot_14_9_0 + slot_0_16_0.m_bDidSmokeEffect)[0] then
                                                                                        -- block empty
                                                                                else
                                                                                        slot_14_16_0 = ffi.cast("Vector*", slot_14_9_0 + slot_0_16_0.m_vSmokeDetonationPos)[0]
                                                                                        slot_14_17_0 = vector(slot_14_16_0.x, slot_14_16_0.y, slot_14_16_0.z)

                                                                                        if slot_14_2_0:get_abs_origin():dist(slot_14_17_0) > 1800 then
                                                                                                return
                                                                                        end

                                                                                        slot_14_18_0 = ffi.cast("GameTime_t*", slot_14_9_0 + slot_0_16_0.flNextTrailLineTime)[0]
                                                                                        slot_14_20_0 = game.global_vars.tick_count - math.floor(slot_14_18_0.spawnTime * 64)

                                                                                        if 1344 - slot_14_20_0 <= 0 then
                                                                                                -- block empty
                                                                                        else
                                                                                                draw_progres_smoke(slot_14_17_0, slot_14_20_0)
                                                                                        end
                                                                                end
                                                                        end
                                                                end
                                                        end
                                                end
                                        end
                                end
                        end
                end

                ::label_14_0::
        end
end

function on_draw()
        if game.global_vars.map_name == nil then
                return
        end

        draw_grenades()
end

slot_0_11_0[3]:get():add_callback(function()
        slot_0_3_0 = slot_0_11_0[3]:get():get_value():get()
end)

if slot_0_11_0[3]:get():get_value():get() ~= draw.color(0, 0, 0, 0) then
        slot_0_3_0 = slot_0_11_0[3]:get():get_value():get()
end

events.present_queue:add(function()
        on_draw()
end)
