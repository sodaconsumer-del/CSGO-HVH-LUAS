--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi then
        return error("Turn on unsafe scripts")
end

ffi.cdef("typedef unsigned int SOCKET;\ntypedef uint16_t WORD;\ntypedef uint32_t DWORD;\ntypedef int BOOL;\ntypedef uint16_t u_short;\ntypedef struct WSAData {\n    WORD wVersion;\n    WORD wHighVersion;\n    char szDescription[257];\n    char szSystemStatus[129];\n    unsigned short iMaxSockets;\n    unsigned short iMaxUdpDg;\n    char *lpVendorInfo;\n} WSADATA;\n\ntypedef struct sockaddr {\n    u_short sa_family;\n    char sa_data[14];\n} sockaddr;\n\ntypedef struct in_addr {\n    uint32_t s_addr;\n} in_addr;\n\ntypedef struct sockaddr_in {\n    short sin_family;\n    u_short sin_port;\n    struct in_addr sin_addr;\n    char sin_zero[8];\n} sockaddr_in;\n\ntypedef struct hostent {\n    char *h_name;\n    char **h_aliases;\n    short h_addrtype;\n    short h_length;\n    char **h_addr_list;\n} hostent;\n")

slot_0_0_0 = "ws2_32.dll"
slot_0_1_0 = ffi.cast("int (__stdcall*)(WORD, WSADATA*)", utils.find_export(slot_0_0_0, "WSAStartup"))
slot_0_2_0 = ffi.cast("int (__stdcall*)()", utils.find_export(slot_0_0_0, "WSACleanup"))
slot_0_3_0 = ffi.cast("SOCKET (__stdcall*)(int, int, int)", utils.find_export(slot_0_0_0, "socket"))
slot_0_4_0 = ffi.cast("int (__stdcall*)(SOCKET, const sockaddr*, int)", utils.find_export(slot_0_0_0, "connect"))
slot_0_5_0 = ffi.cast("int (__stdcall*)(SOCKET)", utils.find_export(slot_0_0_0, "closesocket"))
slot_0_6_0 = ffi.cast("int (__stdcall*)(SOCKET, const char*, int, int)", utils.find_export(slot_0_0_0, "send"))
slot_0_7_0 = ffi.cast("int (__stdcall*)(SOCKET, char*, int, int)", utils.find_export(slot_0_0_0, "recv"))
slot_0_8_0 = ffi.cast("uint16_t (__stdcall*)(uint16_t)", utils.find_export(slot_0_0_0, "htons"))
slot_0_9_0 = ffi.cast("uint32_t (__stdcall*)(const char*)", utils.find_export(slot_0_0_0, "inet_addr"))
slot_0_10_0 = ffi.cast("struct hostent* (__stdcall*)(const char*)", utils.find_export(slot_0_0_0, "gethostbyname"))
slot_0_11_0 = false
slot_0_12_0 = {}

function slot_0_13_0()
        if slot_0_11_0 then
                return true
        end

        local var_1_0 = ffi.new("WSADATA")

        if slot_0_1_0(514, var_1_0) ~= 0 then
                return false
        end

        slot_0_11_0 = true

        return true
end

function slot_0_14_0(arg_2_0)
        local var_2_0 = slot_0_12_0[arg_2_0]

        if var_2_0 then
                return var_2_0
        end

        local var_2_1 = slot_0_9_0(arg_2_0)

        if var_2_1 ~= 4294967295 then
                slot_0_12_0[arg_2_0] = var_2_1

                return var_2_1
        end

        local var_2_2 = slot_0_10_0(arg_2_0)

        if var_2_2 == nil or var_2_2.h_addr_list == nil then
                return nil
        end

        local var_2_3 = ffi.cast("uint32_t**", var_2_2.h_addr_list)

        if var_2_3[0] == nil then
                return nil
        end

        local var_2_4 = var_2_3[0][0]

        slot_0_12_0[arg_2_0] = var_2_4

        return var_2_4
end

function slot_0_15_0(arg_3_0)
        local var_3_0 = {}
        local var_3_1 = 1

        while true do
                local var_3_2 = arg_3_0:find("\r\n", var_3_1, true)

                if not var_3_2 then
                        break
                end

                local var_3_3 = arg_3_0:sub(var_3_1, var_3_2 - 1)
                local var_3_4 = tonumber(var_3_3, 16)

                if not var_3_4 then
                        break
                end

                var_3_1 = var_3_2 + 2

                if var_3_4 == 0 then
                        break
                end

                local var_3_5 = arg_3_0:sub(var_3_1, var_3_1 + var_3_4 - 1)

                var_3_0[#var_3_0 + 1] = var_3_5
                var_3_1 = var_3_1 + var_3_4 + 2
        end

        return table.concat(var_3_0)
end

function slot_0_16_0(arg_4_0, arg_4_1)
        if not slot_0_13_0() then
                return nil, "WSAStartup failed"
        end

        local var_4_0 = 2
        local var_4_1 = 1
        local var_4_2 = 6
        local var_4_3 = slot_0_3_0(var_4_0, var_4_1, var_4_2)

        if var_4_3 == ffi.cast("SOCKET", -1) then
                return nil, "socket creation failed"
        end

        local var_4_4 = slot_0_14_0(arg_4_0)

        if not var_4_4 then
                slot_0_5_0(var_4_3)

                return nil, "DNS lookup failed"
        end

        local var_4_5 = ffi.new("sockaddr_in")

        var_4_5.sin_family = var_4_0
        var_4_5.sin_port = slot_0_8_0(80)
        var_4_5.sin_addr.s_addr = var_4_4

        if slot_0_4_0(var_4_3, ffi.cast("sockaddr*", var_4_5), ffi.sizeof(var_4_5)) ~= 0 then
                slot_0_5_0(var_4_3)

                return nil, "connection failed"
        end

        local var_4_6 = "GET " .. arg_4_1 .. " HTTP/1.1\r\nHost: " .. arg_4_0 .. "\r\nConnection: close\r\n\r\n"

        if slot_0_6_0(var_4_3, var_4_6, #var_4_6, 0) == -1 then
                slot_0_5_0(var_4_3)

                return nil, "send failed"
        end

        local var_4_7 = {}
        local var_4_8 = ffi.new("char[4096]")

        while true do
                local var_4_9 = slot_0_7_0(var_4_3, var_4_8, 4096, 0)

                if var_4_9 == nil or var_4_9 <= 0 then
                        break
                end

                var_4_7[#var_4_7 + 1] = ffi.string(var_4_8, var_4_9)
        end

        slot_0_5_0(var_4_3)

        local var_4_10 = table.concat(var_4_7)
        local var_4_11 = var_4_10:find("\r\n\r\n", 1, true)

        if not var_4_11 then
                return nil, "invalid response"
        end

        local var_4_12 = var_4_10:sub(1, var_4_11 - 1)
        local var_4_13 = var_4_10:sub(var_4_11 + 4)

        if var_4_12:lower():find("transfer%-encoding:%s*chunked", 1, false) ~= nil then
                var_4_13 = slot_0_15_0(var_4_13)
        end

        return var_4_13
end

function slot_0_17_0(arg_5_0)
        local var_5_0, var_5_1, var_5_2 = arg_5_0:match("^STEAM_([0-5]):([0-1]):(%d+)$")

        if not var_5_0 or not var_5_1 or not var_5_2 then
                return nil
        end

        local var_5_3 = 7.656119796026573e+16 + tonumber(var_5_2) * 2 + tonumber(var_5_1)

        return string.format("%u", var_5_3)
end

function slot_0_18_0(arg_6_0)
        local var_6_0 = arg_6_0:match("^%s*(.-)%s*$")

        if var_6_0 == "" then
                return nil
        end

        local var_6_1 = var_6_0:match("^([^|]+)")

        if var_6_1 then
                var_6_0 = var_6_1
        end

        if var_6_0:match("^%d+$") then
                return var_6_0
        end

        if var_6_0:match("^STEAM_[0-5]:[0-1]:%d+$") then
                return slot_0_17_0(var_6_0)
        end

        return nil
end

function slot_0_19_0()
        local var_7_0, var_7_1 = slot_0_16_0("www.qfl1337.xyz", "/steamid.txt")

        if not var_7_0 then
                return nil
        end

        local var_7_2 = {}
        local var_7_3 = 0

        for iter_7_0 in var_7_0:gmatch("[^\r\n]+") do
                local var_7_4 = slot_0_18_0(iter_7_0)

                if var_7_4 then
                        var_7_2[var_7_4] = true
                        var_7_3 = var_7_3 + 1
                end
        end

        return var_7_2
end

slot_0_20_0 = {}
slot_0_21_0 = false
slot_0_22_0 = 0

function slot_0_23_0(arg_8_0)
        local var_8_0 = 0

        for iter_8_0 in pairs(arg_8_0 or {}) do
                var_8_0 = var_8_0 + 1
        end

        return var_8_0
end

function slot_0_24_0()
        local var_9_0 = slot_0_19_0()

        if var_9_0 then
                slot_0_20_0 = var_9_0
                slot_0_22_0 = slot_0_23_0(slot_0_20_0)

                print("[qfl] list updated:", tostring(slot_0_22_0))
        end
end

function slot_0_25_0()
        local var_10_0

        entities.controllers:for_each(function(arg_11_0)
                if not arg_11_0.handle:valid() then
                        return
                end

                local var_11_0 = arg_11_0.handle:get()

                if var_11_0 and is_local_controller(var_11_0) then
                        var_10_0 = get_controller_steamid(var_11_0)
                end
        end)

        return var_10_0
end

function slot_0_26_0(arg_12_0)
        if not arg_12_0 or not arg_12_0.m_bIsLocalPlayerController then
                return false
        end

        return arg_12_0.m_bIsLocalPlayerController:get() == true
end

function slot_0_27_0(arg_13_0)
        if not arg_13_0 or not arg_13_0.m_steamID then
                return nil
        end

        local var_13_0 = arg_13_0.m_steamID:get()

        if var_13_0 == nil then
                return nil
        end

        return string.format("%u", var_13_0)
end

function slot_0_28_0(arg_14_0)
        local var_14_0 = arg_14_0:get_pawn()

        if not var_14_0 then
                return false, "no pawn"
        end

        local var_14_1 = var_14_0:get_abs_origin()

        if not var_14_1 then
                return false, "no origin"
        end

        local var_14_2 = vector(var_14_1.x, var_14_1.y, var_14_1.z + 72)
        local var_14_3 = math.world_to_screen(var_14_2)

        if not var_14_3 then
                return false, "no screen"
        end

        local var_14_4 = draw.surface
        local var_14_5 = draw.fonts.gui_main

        if not var_14_5 then
                if not warned_font_missing then
                        warned_font_missing = true

                        print("[qfl] draw skipped: gui_main font missing")
                end

                return false, "no font"
        end

        local var_14_6 = draw.color(255, 110, 110, 255)
        local var_14_7 = draw.color(12, 12, 12, 190)
        local var_14_8 = draw.color(255, 70, 70, 220)
        local var_14_9 = 0.18
        local var_14_10 = "HACKER"
        local var_14_11 = 6
        local var_14_12 = 3
        local var_14_13 = var_14_5:get_text_size(var_14_10)
        local var_14_14 = var_14_3.x - var_14_13.x * 0.5
        local var_14_15 = var_14_3.y - 10 - var_14_13.y
        local var_14_16 = draw.rect(var_14_14 - var_14_11, var_14_15 - var_14_12, var_14_14 + var_14_13.x + var_14_11, var_14_15 + var_14_13.y + var_14_12)

        var_14_4.font = var_14_5

        var_14_4:add_shadow_rect(var_14_16, 6, true, var_14_9)
        var_14_4:add_rect_filled_rounded(var_14_16, var_14_7, 6, draw.rounding.all)
        var_14_4:add_rect_rounded(var_14_16, var_14_8, 6, draw.rounding.all)
        var_14_4:add_text(draw.vec2(var_14_14, var_14_15), var_14_10, var_14_6)

        return true
end

function slot_0_29_0()
        local var_15_0 = 0

        entities.controllers:for_each(function(arg_16_0)
                if not arg_16_0.handle:valid() then
                        return
                end

                local var_16_0 = arg_16_0.handle:get()

                if not var_16_0 or slot_0_26_0(var_16_0) then
                        return
                end

                local var_16_1 = slot_0_27_0(var_16_0)

                if var_16_1 and slot_0_20_0[var_16_1] then
                        var_15_0 = var_15_0 + 1
                end
        end)

        return var_15_0
end

function slot_0_30_0()
        local var_17_0 = {}
        local var_17_1 = {}

        entities.controllers:for_each(function(arg_18_0)
                if not arg_18_0.handle:valid() then
                        return
                end

                local var_18_0 = arg_18_0.handle:get()

                if not var_18_0 or slot_0_26_0(var_18_0) then
                        return
                end

                local var_18_1 = slot_0_27_0(var_18_0)

                if not var_18_1 then
                        return
                end

                local var_18_2 = var_18_0:get_name() or "unknown"

                var_17_0[#var_17_0 + 1] = var_18_1 .. " | " .. var_18_2

                if slot_0_20_0[var_18_1] then
                        var_17_1[#var_17_1 + 1] = var_18_1 .. " | " .. var_18_2
                end
        end)
        print("[qfl] match players:")

        for iter_17_0 = 1, #var_17_0 do
                print(var_17_0[iter_17_0])
        end

        print("[qfl] matched list players:")

        for iter_17_1 = 1, #var_17_1 do
                print(var_17_1[iter_17_1])
        end
end

slot_0_31_0 = gui and gui.ctx and gui.ctx.find and gui.ctx:find("lua>elements a")
slot_0_32_0 = nil
slot_0_33_0 = nil
slot_0_34_1 = nil
slot_0_35_0 = nil
slot_0_36_0 = nil
slot_0_37_0 = nil
slot_0_38_0 = nil
slot_0_39_0 = nil
slot_0_40_0 = nil
slot_0_41_0 = false

if slot_0_31_0 and gui and gui.checkbox and gui.button then
        slot_0_32_0 = gui.checkbox(gui.control_id("qfl>master"))
        slot_0_33_0 = gui.checkbox(gui.control_id("qfl>display"))

        slot_0_32_0:set_value(false)
        slot_0_33_0:set_value(false)

        slot_0_34_0 = gui.button(gui.control_id("qfl>update"), "Update")

        slot_0_31_0:add(gui.make_control("Master", slot_0_32_0))

        slot_0_35_0 = gui.spacer(gui.control_id("qfl>sp1"))

        slot_0_31_0:add(slot_0_35_0)

        slot_0_39_0 = gui.make_control("ESP", slot_0_33_0)

        slot_0_31_0:add(slot_0_39_0)

        slot_0_37_0 = gui.spacer(gui.control_id("qfl>sp2"))

        slot_0_31_0:add(slot_0_37_0)

        slot_0_38_0 = gui.spacer(gui.control_id("qfl>sp4"))

        slot_0_31_0:add(slot_0_38_0)

        slot_0_40_0 = gui.make_control("Update List", slot_0_34_0)

        slot_0_31_0:add(slot_0_40_0)

        slot_0_36_0 = gui.spacer(gui.control_id("qfl>sp5"))

        slot_0_31_0:add(slot_0_36_0)
        slot_0_31_0:reset()
        slot_0_34_0:add_callback(function()
                slot_0_41_0 = true
        end)

        if slot_0_39_0 then
                slot_0_39_0:set_visible(false)
        end

        if slot_0_40_0 then
                slot_0_40_0:set_visible(false)
        end

        slot_0_35_0:set_visible(false)
        slot_0_37_0:set_visible(false)
        slot_0_38_0:set_visible(false)
        slot_0_36_0:set_visible(false)
        slot_0_31_0:reset()
end

function slot_0_42_0()
        if not slot_0_32_0 then
                return true
        end

        return slot_0_32_0:get_value():get()
end

function slot_0_43_0()
        if not slot_0_33_0 then
                return true
        end

        return slot_0_33_0:get_value():get()
end

slot_0_44_0 = nil
slot_0_45_0 = 0
slot_0_46_0 = false
slot_0_47_0 = false
slot_0_48_0 = 0
slot_0_49_0 = nil
slot_0_50_0 = false

function slot_0_51_0()
        local var_22_0 = slot_0_42_0()
        local var_22_1 = slot_0_43_0()
        local var_22_2 = var_22_0 and var_22_1

        if slot_0_39_0 then
                slot_0_39_0:set_visible(var_22_0)
        end

        if slot_0_40_0 then
                slot_0_40_0:set_visible(var_22_2)
        end

        if slot_0_35_0 then
                slot_0_35_0:set_visible(var_22_0)
        end

        if slot_0_37_0 then
                slot_0_37_0:set_visible(var_22_0)
        end

        if slot_0_38_0 then
                slot_0_38_0:set_visible(var_22_0)
        end

        if slot_0_36_0 then
                slot_0_36_0:set_visible(var_22_0)
        end

        return var_22_0, var_22_1, var_22_2
end

if slot_0_32_0 then
        slot_0_51_0()

        if slot_0_31_0 and slot_0_31_0.reset then
                slot_0_31_0:reset()
        end
end

if mods and mods.events and mods.events.add_listener and events and events.event and events.event.add then
        mods.events:add_listener("round_start")
        events.event:add(function(arg_23_0)
                if not arg_23_0 or not arg_23_0.get_name then
                        return
                end

                if arg_23_0:get_name() ~= "round_start" then
                        return
                end

                print("[qfl] round_start -> refresh list")

                slot_0_21_0 = true
        end)
end

events.present_queue:add(function()
        local var_24_0 = game.global_vars.real_time
        local var_24_1 = slot_0_42_0()
        local var_24_2 = slot_0_43_0()
        local var_24_3 = var_24_1 and var_24_2
        local var_24_4 = (var_24_1 and "1" or "0") .. (var_24_3 and "1" or "0")

        if var_24_4 ~= slot_0_44_0 then
                slot_0_44_0 = var_24_4

                slot_0_51_0()
        end

        if slot_0_21_0 or slot_0_41_0 then
                slot_0_21_0 = false
                slot_0_41_0 = false

                slot_0_24_0()

                slot_0_50_0 = true
        end

        local var_24_5 = 0
        local var_24_6 = 0
        local var_24_7

        entities.controllers:for_each(function(arg_25_0)
                if not arg_25_0.handle:valid() then
                        return
                end

                local var_25_0 = arg_25_0.handle:get()

                if not var_25_0 or slot_0_26_0(var_25_0) then
                        return
                end

                local var_25_1 = slot_0_27_0(var_25_0)

                if var_24_1 and var_24_2 and var_25_1 and slot_0_20_0[var_25_1] then
                        var_24_6 = var_24_6 + 1

                        local var_25_2, var_25_3 = slot_0_28_0(var_25_0)

                        if var_25_2 then
                                var_24_5 = var_24_5 + 1
                        elseif not var_24_7 then
                                var_24_7 = var_25_3
                        end
                end
        end)

        slot_0_45_0 = var_24_5
        slot_0_48_0 = var_24_6
        slot_0_49_0 = var_24_7

        if var_24_1 and var_24_2 and slot_0_45_0 == 0 and var_24_7 and not slot_0_47_0 then
                slot_0_47_0 = true

                print("[qfl] draw failed:", tostring(var_24_7))
        end

        if slot_0_50_0 then
                slot_0_50_0 = false

                print("[qfl] matches in server:", tostring(slot_0_29_0()))
                print("[qfl] master:", tostring(var_24_1), "esp:", tostring(var_24_2))
                print("[qfl] frame drawn:", tostring(var_24_5))
                print("[qfl] frame match loop:", tostring(var_24_6))

                if var_24_7 then
                        print("[qfl] frame draw fail:", tostring(var_24_7))
                end

                slot_0_30_0()
        end
end)
