--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {}
slot_0_1_0 = draw.font("verdana.ttf", 12, draw.font_flags.outline)
slot_0_2_0 = gui.checkbox(gui.control_id("lua>elements a>add_waypoint"))
slot_0_3_0 = gui.checkbox(gui.control_id("lua>elements b>clear_waypoint"))
slot_0_4_0 = gui.make_control("Add Waypoint [Click]", slot_0_2_0)
slot_0_5_0 = gui.make_control("Clear Last Waypoint", slot_0_3_0)
slot_0_6_0 = gui.ctx:find("lua>elements a")
slot_0_7_0 = gui.ctx:find("lua>elements b")

slot_0_6_0:add(slot_0_4_0)
slot_0_7_0:add(slot_0_5_0)

slot_0_8_0 = {
        clear = false,
        add = false
}
slot_0_9_0 = {
        {
                map = "de_mirage",
                label = "Waypoint 1",
                pos = vector(703.59, -1603.12, -262.88)
        },
        {
                map = "de_mirage",
                label = "Waypoint 2",
                pos = vector(-1039.57, -327.51, -367.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 3",
                pos = vector(605.47, -1718.96, -258.09)
        },
        {
                map = "de_mirage",
                label = "Waypoint 4",
                pos = vector(-1005.98, -2480.6, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 5",
                pos = vector(576.92, -1717.41, -259.04)
        },
        {
                map = "de_mirage",
                label = "Waypoint 6",
                pos = vector(12.23, -2093.41, -39.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 7",
                pos = vector(509.55, -1665.9, -263.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 8",
                pos = vector(459.3, -2343.78, -39.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 9",
                pos = vector(444.76, -1710.55, -234.35)
        },
        {
                map = "de_mirage",
                label = "Waypoint 10",
                pos = vector(1039.96, -1909.43, -71.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 11",
                pos = vector(430.87, -1523.46, -227.4)
        },
        {
                map = "de_mirage",
                label = "Waypoint 12",
                pos = vector(-675.45, -780.14, -262.05)
        },
        {
                map = "de_mirage",
                label = "Waypoint 13",
                pos = vector(487.58, -1601.25, -255.76)
        },
        {
                map = "de_mirage",
                label = "Waypoint 14",
                pos = vector(527.97, -534.74, -155.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 15",
                pos = vector(-647.06, -778.04, -261.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 16",
                pos = vector(419.38, -1522.17, -221.65)
        },
        {
                map = "de_mirage",
                label = "Waypoint 17",
                pos = vector(-628.49, -778.79, -261.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 18",
                pos = vector(-142.97, -1418.03, -72.18)
        },
        {
                map = "de_mirage",
                label = "Waypoint 19",
                pos = vector(-611.44, -767.45, -261.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 20",
                pos = vector(-297.2, -1529.68, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 21",
                pos = vector(-600.88, -739.22, -262.38)
        },
        {
                map = "de_mirage",
                label = "Waypoint 22",
                pos = vector(-391.37, -2031.91, -179.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 23",
                pos = vector(-152.51, -934.7, -167.55)
        },
        {
                map = "de_mirage",
                label = "Waypoint 24",
                pos = vector(-704.82, -814.35, -263.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 25",
                pos = vector(-710.23, -812.21, -263.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 26",
                pos = vector(-1374.63, -987.34, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 27",
                pos = vector(-999.98, -307.89, -367.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 28",
                pos = vector(684.14, -1625.9, -262.55)
        },
        {
                map = "de_mirage",
                label = "Waypoint 29",
                pos = vector(-1070.3, -2468.48, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 30",
                pos = vector(691.76, -1642.52, -258.56)
        },
        {
                map = "de_mirage",
                label = "Waypoint 31",
                pos = vector(-1711.97, -1023.42, -203.92)
        },
        {
                map = "de_mirage",
                label = "Waypoint 32",
                pos = vector(11.61, -607.98, -189.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 33",
                pos = vector(-1671.04, 564.31, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 34",
                pos = vector(-1133.83, -786.66, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 35",
                pos = vector(-1567.95, 526.26, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 36",
                pos = vector(-1567.95, 526.26, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 37",
                pos = vector(-1054.21, 731.78, -79.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 38",
                pos = vector(-1571.11, 525.77, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 39",
                pos = vector(-1449.3, 252.92, -166.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 40",
                pos = vector(-1504.24, 750.58, -47.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 41",
                pos = vector(-1633.51, 115.84, -168.39)
        },
        {
                map = "de_mirage",
                label = "Waypoint 42",
                pos = vector(-752.04, -61.73, -161.07)
        },
        {
                map = "de_mirage",
                label = "Waypoint 43",
                pos = vector(20.35, -2122.48, -39.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 44",
                pos = vector(667.86, -1601.04, -263.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 45",
                pos = vector(151.97, -2071.96, -39.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 46",
                pos = vector(208.15, -1437.61, -175.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 47",
                pos = vector(15.97, -1740.47, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 48",
                pos = vector(947.48, -2273.43, -39.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 49",
                pos = vector(-129.66, -2412.97, -163.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 50",
                pos = vector(468.79, -2337.59, -39.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 51",
                pos = vector(735.97, -2390.94, 10.63)
        },
        {
                map = "de_mirage",
                label = "Waypoint 52",
                pos = vector(-282.84, -2399.04, -163.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 53",
                pos = vector(1179.1, -1479.96, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 54",
                pos = vector(878.89, -2009.5, -71.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 55",
                pos = vector(-552.23, -1310.53, -163.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 56",
                pos = vector(-453.46, -1798.52, -175.77)
        },
        {
                map = "de_mirage",
                label = "Waypoint 57",
                pos = vector(-1504.52, -1420.02, -259.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 58",
                pos = vector(-327.19, -2037.79, -175.18)
        },
        {
                map = "de_mirage",
                label = "Waypoint 59",
                pos = vector(-1525.03, -1474.21, -259.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 60",
                pos = vector(-494.8, -702.3, -267.72)
        },
        {
                map = "de_mirage",
                label = "Waypoint 61",
                pos = vector(-1504.39, -1440.34, -259.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 62",
                pos = vector(-1156.04, -1248.18, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 63",
                pos = vector(-1556.84, -950.87, -191.93)
        },
        {
                map = "de_mirage",
                label = "Waypoint 64",
                pos = vector(-1041.4, -300.32, -367.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 65",
                pos = vector(-1041.4, -300.32, -367.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 66",
                pos = vector(-1572.53, -1607.21, -263.62)
        },
        {
                map = "de_mirage",
                label = "Waypoint 67",
                pos = vector(-1961.6, -472.47, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 68",
                pos = vector(-1006.52, -321.76, -367.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 69",
                pos = vector(-1128.4, 295.97, -159.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 70",
                pos = vector(-436.49, 662.3, -79.64)
        },
        {
                map = "de_mirage",
                label = "Waypoint 71",
                pos = vector(-1073.82, 297.22, -159.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 72",
                pos = vector(-1012.98, 546.72, -79.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 73",
                pos = vector(-1839.26, 241.86, -162.15)
        },
        {
                map = "de_mirage",
                label = "Waypoint 74",
                pos = vector(-982.12, 327.82, -367.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 75",
                pos = vector(-913.93, 112.04, -170.46)
        },
        {
                map = "de_mirage",
                label = "Waypoint 76",
                pos = vector(-1011.93, -163.11, -348.3)
        },
        {
                map = "de_mirage",
                label = "Waypoint 77",
                pos = vector(-2004.44, 682.37, -46.56)
        },
        {
                map = "de_mirage",
                label = "Waypoint 78",
                pos = vector(-1044, -333.05, -357.7)
        },
        {
                map = "de_mirage",
                label = "Waypoint 79",
                pos = vector(-1038.34, 360.31, -367.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 80",
                pos = vector(-1932.83, -356.13, -167.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 81",
                pos = vector(-969.88, -378.17, -346.88)
        },
        {
                map = "de_mirage",
                label = "Waypoint 82",
                pos = vector(187.1, 841.37, -135.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 83",
                pos = vector(-1017.47, -456.4, -307.77)
        },
        {
                map = "de_mirage",
                label = "Waypoint 84",
                pos = vector(-969.66, 240.66, -171.39)
        },
        {
                map = "de_mirage",
                label = "Waypoint 85",
                pos = vector(-710.95, -821.33, -263.97)
        },
        {
                map = "de_mirage",
                label = "Waypoint 86",
                pos = vector(-1255.57, -1440.03, -158.01)
        },
        {
                map = "de_dust2",
                label = "Waypoint 87",
                pos = vector(820.49, 808.03, 47.03)
        },
        {
                map = "de_dust2",
                label = "Waypoint 88",
                pos = vector(311.44, 1786.08, 96.03)
        },
        {
                map = "de_dust2",
                label = "Waypoint 89",
                pos = vector(915.47, 2412.67, 127.03)
        },
        {
                map = "de_dust2",
                label = "Waypoint 90",
                pos = vector(291.23, 2415.4, -121.09)
        },
        {
                map = "de_dust2",
                label = "Waypoint 91",
                pos = vector(-364.1, 2145.41, -127.84)
        },
        {
                map = "de_dust2",
                label = "Waypoint 92",
                pos = vector(334, 1678.27, 43.28)
        },
        {
                map = "de_dust2",
                label = "Waypoint 93",
                pos = vector(362.84, 1636.5, 21.39)
        },
        {
                map = "de_dust2",
                label = "Waypoint 94",
                pos = vector(-166.03, 2172.27, -126)
        },
        {
                map = "de_dust2",
                label = "Waypoint 95",
                pos = vector(1146.69, 2276.1, 9.44)
        },
        {
                map = "de_dust2",
                label = "Waypoint 96",
                pos = vector(1356.49, 2533.7, 67.16)
        },
        {
                map = "de_dust2",
                label = "Waypoint 97",
                pos = vector(597.71, 457.31, 1.21)
        },
        {
                map = "de_dust2",
                label = "Waypoint 98",
                pos = vector(-541.42, 404.95, 5.82)
        }
}

;(function()
        for iter_1_0, iter_1_1 in ipairs(slot_0_9_0) do
                table.insert(slot_0_0_0, iter_1_1)
        end
end)()

function slot_0_11_0()
        return (entities.get_local_pawn())
end

function slot_0_12_0()
        return game.global_vars.map_name
end

function slot_0_13_0(arg_4_0)
        return string.format("%.2f, %.2f, %.2f", arg_4_0.x, arg_4_0.y, arg_4_0.z)
end

function slot_0_14_0()
        print("Current Waypoints:")

        for iter_5_0, iter_5_1 in ipairs(slot_0_0_0) do
                print(string.format("Waypoint %d at %s on map %s", iter_5_0, slot_0_13_0(iter_5_1.pos), iter_5_1.map))
        end
end

function slot_0_15_0()
        local var_6_0 = slot_0_11_0()

        if not var_6_0 then
                return
        end

        local var_6_1 = var_6_0:get_abs_origin()
        local var_6_2 = slot_0_12_0()
        local var_6_3 = "Event Name"

        table.insert(slot_0_0_0, {
                pos = var_6_1,
                label = var_6_3,
                map = var_6_2
        })
        print("Added waypoint: " .. var_6_3 .. " at " .. slot_0_13_0(var_6_1) .. " on map " .. var_6_2)
        slot_0_14_0()
        slot_0_2_0:set_value(false)
end

function slot_0_16_0()
        if #slot_0_0_0 > 0 then
                local var_7_0 = table.remove(slot_0_0_0)

                print("Removed last waypoint: " .. var_7_0.label .. " at " .. slot_0_13_0(var_7_0.pos))
        else
                print("No waypoints to remove")
        end

        slot_0_3_0:set_value(false)
end

function slot_0_17_0()
        local var_8_0 = slot_0_2_0:get_value():get()

        if var_8_0 and not slot_0_8_0.add then
                slot_0_15_0()
        end

        slot_0_8_0.add = var_8_0

        local var_8_1 = slot_0_3_0:get_value():get()

        if var_8_1 and not slot_0_8_0.clear then
                slot_0_16_0()
        end

        slot_0_8_0.clear = var_8_1
end

function slot_0_18_0(arg_9_0)
        local var_9_0 = false

        entities.players:for_each(function(arg_10_0)
                if arg_10_0.entity and arg_10_0.entity:is_enemy() and arg_10_0.entity:get_abs_origin():dist(arg_9_0.pos) < 50 then
                        var_9_0 = true
                end
        end)

        return var_9_0
end

function slot_0_19_0()
        if #slot_0_0_0 == 0 then
                return
        end

        slot_11_0_0 = draw.surface
        slot_11_0_0.font = slot_0_1_0
        slot_11_1_0 = slot_0_11_0()
        slot_11_2_0 = slot_0_12_0()
        slot_11_3_0 = 50
        slot_11_4_0 = 300
        slot_11_5_0 = {}
        slot_11_6_0 = {}

        for iter_11_0 = 1, #slot_0_0_0 do
                slot_11_11_2 = slot_0_0_0[iter_11_0]

                if slot_11_11_2.map == slot_11_2_0 then
                        slot_11_12_2 = slot_11_11_2.pos:dist(slot_11_1_0:get_abs_origin())

                        if slot_11_1_0 and (slot_11_12_2 < slot_11_3_0 or slot_0_18_0(slot_11_11_2)) then
                                slot_11_5_0[iter_11_0] = true
                                slot_11_13_2 = iter_11_0 % 2 == 1 and iter_11_0 + 1 or iter_11_0 - 1

                                if slot_11_13_2 >= 1 and slot_11_13_2 <= #slot_0_0_0 then
                                        slot_11_6_0[slot_11_13_2] = true
                                end
                        end

                        if slot_11_12_2 < slot_11_4_0 or slot_11_5_0[iter_11_0] or iter_11_0 % 2 == 1 and slot_11_5_0[iter_11_0 + 1] or iter_11_0 % 2 == 0 and slot_11_5_0[iter_11_0 - 1] then
                                slot_11_6_0[iter_11_0] = true
                        end
                end
        end

        for iter_11_1 = 1, #slot_0_0_0 do
                if slot_11_5_0[iter_11_1] then
                        slot_11_11_1 = slot_0_0_0[iter_11_1]
                        slot_11_12_1 = math.world_to_screen(slot_11_11_1.pos)

                        if slot_11_11_1.map == slot_11_2_0 then
                                slot_11_13_1 = iter_11_1 % 2 == 1 and iter_11_1 + 1 or iter_11_1 - 1

                                if slot_11_13_1 >= 1 and slot_11_13_1 <= #slot_0_0_0 then
                                        slot_11_14_4 = slot_0_0_0[slot_11_13_1]
                                        slot_11_15_2 = math.world_to_screen(slot_11_14_4.pos)

                                        if slot_11_12_1 and slot_11_15_2 then
                                                slot_11_0_0:add_line(slot_11_12_1, slot_11_15_2, draw.color(255, 255, 255, 200), 1)
                                        end
                                end
                        end
                end
        end

        for iter_11_2 = 1, #slot_0_0_0 do
                if not slot_11_6_0[iter_11_2] then
                        -- block empty
                else
                        slot_11_11_0 = slot_0_0_0[iter_11_2]
                        slot_11_12_0 = math.world_to_screen(slot_11_11_0.pos)

                        if slot_11_12_0 and slot_11_11_0.map == slot_11_2_0 then
                                slot_11_13_0 = slot_11_5_0[iter_11_2]
                                slot_11_14_3 = draw.color(255, 0, 0, 255)

                                if iter_11_2 % 2 == 1 then
                                        slot_11_15_1 = iter_11_2 + 1
                                        slot_11_16_1 = slot_11_15_1 <= #slot_0_0_0 and slot_11_5_0[slot_11_15_1]

                                        if slot_11_13_0 then
                                                slot_11_14_3 = draw.color(0, 255, 0, 255)
                                        elseif slot_11_16_1 then
                                                slot_11_14_3 = draw.color(255, 255, 0, 255)
                                        end

                                        slot_11_0_0:add_circle_filled(slot_11_12_0, 10, slot_11_14_3)
                                        slot_11_0_0:add_circle(slot_11_12_0, 12, draw.color(255, 255, 0, 100))
                                else
                                        slot_11_15_0 = iter_11_2 - 1
                                        slot_11_16_0 = slot_11_15_0 >= 1 and slot_11_5_0[slot_11_15_0]

                                        if slot_11_13_0 and slot_11_16_0 then
                                                slot_11_14_2 = draw.color(0, 255, 0, 255)

                                                slot_11_0_0:add_circle_filled(slot_11_12_0, 10, slot_11_14_2)
                                        elseif slot_11_13_0 then
                                                slot_11_14_1 = draw.color(0, 255, 0, 255)

                                                slot_11_0_0:add_circle_filled(slot_11_12_0, 10, slot_11_14_1)
                                        elseif slot_11_16_0 then
                                                slot_11_14_0 = draw.color(255, 255, 0, 255)

                                                slot_11_0_0:add_circle_filled(slot_11_12_0, 10, slot_11_14_0)
                                        else
                                                slot_11_0_0:add_circle(slot_11_12_0, 10, draw.color(255, 255, 255, 255))
                                        end
                                end
                        end
                end
        end
end

events.present_queue:add(function()
        slot_0_17_0()
        slot_0_19_0()
end)
print("Script Loaded (Waypoint)")
print("Use checkboxes in menu (Lua > Elements) to control waypoints")
