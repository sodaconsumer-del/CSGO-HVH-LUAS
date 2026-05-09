--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = ffi ~= nil
slot_0_1_0 = nil
slot_0_2_0 = nil
slot_0_3_0 = nil
slot_0_4_0 = nil
slot_0_5_0 = nil
slot_0_6_0 = nil
slot_0_7_0 = nil
slot_0_8_0 = nil
slot_0_9_0 = nil
slot_0_10_0 = nil
slot_0_11_1 = nil

if slot_0_0_0 then
        ffi.cdef("    typedef unsigned int u_int;\n    typedef unsigned short u_short;\n    typedef unsigned long u_long;\n    typedef uintptr_t SOCKET;\n    typedef struct sockaddr { u_short sa_family; char sa_data[14]; } sockaddr;\n    typedef struct { unsigned short wVersion; unsigned short wHighVersion; char szDescription[257]; char szSystemStatus[129]; unsigned short iMaxSockets; unsigned short iMaxUdpDg; char *lpVendorInfo; } WSADATA, *LPWSADATA;\n    typedef struct { short sin_family; u_short sin_port; struct { u_long S_un_b; } sin_addr; char sin_zero[8]; } sockaddr_in;\n    typedef struct { u_int fd_count; SOCKET fd_array[64]; } fd_set;\n    struct timeval { long tv_sec; long tv_usec; };\n    typedef struct in_addr { union { struct { u_long s_b1, s_b2, s_b3, s_b4; } S_un_b; struct { u_short s_w1, s_w2; } S_un_w; u_long S_addr; } S_un; } in_addr;\n    struct hostent { char *h_name; char **h_aliases; short h_addrtype; short h_length; char **h_addr_list; };\n")

        function slot_0_12_1(arg_1_0, arg_1_1, arg_1_2)
                local var_1_0 = utils.find_export(arg_1_0, arg_1_1)

                if not var_1_0 then
                        return nil
                end

                return ffi.cast(arg_1_2, var_1_0)
        end

        slot_0_13_1 = "ws2_32.dll"
        slot_0_1_0 = slot_0_12_1(slot_0_13_1, "WSAStartup", "int(__stdcall*)(u_short, WSADATA*)")
        slot_0_2_0 = slot_0_12_1(slot_0_13_1, "socket", "SOCKET(__stdcall*)(int, int, int)")
        slot_0_3_0 = slot_0_12_1(slot_0_13_1, "connect", "int(__stdcall*)(SOCKET, const struct sockaddr*, int)")
        slot_0_4_0 = slot_0_12_1(slot_0_13_1, "send", "int(__stdcall*)(SOCKET, const char*, int, int)")
        slot_0_5_0 = slot_0_12_1(slot_0_13_1, "recv", "int(__stdcall*)(SOCKET, char*, int, int)")
        slot_0_6_0 = slot_0_12_1(slot_0_13_1, "closesocket", "int(__stdcall*)(SOCKET)")
        slot_0_7_0 = slot_0_12_1(slot_0_13_1, "ioctlsocket", "int(__stdcall*)(SOCKET, long, u_long*)")
        slot_0_8_0 = slot_0_12_1(slot_0_13_1, "select", "int(__stdcall*)(int, fd_set*, fd_set*, fd_set*, const struct timeval*)")
        slot_0_9_0 = slot_0_12_1(slot_0_13_1, "htons", "u_short(__stdcall*)(u_short)")
        slot_0_10_0 = slot_0_12_1(slot_0_13_1, "gethostbyname", "struct hostent*(__stdcall*)(const char*)")
        slot_0_11_0 = slot_0_12_1(slot_0_13_1, "inet_addr", "unsigned long(__stdcall*)(const char*)")
end

slot_0_12_0 = 2
slot_0_13_0 = 1
slot_0_14_0 = 6
slot_0_15_0 = -1
slot_0_16_0 = "irc.libera.chat"
slot_0_17_0 = 6667
slot_0_18_0 = "xK7mP2nQ9vL4wR8y"
slot_0_19_0 = 6

function slot_0_20_0()
        local var_2_0 = 0

        if slot_0_0_0 then
                local var_2_1 = utils.find_export("kernel32.dll", "GetSystemTimeAsFileTime")

                if var_2_1 and var_2_1 ~= 0 then
                        local var_2_2 = ffi.new("uint64_t[1]")

                        ffi.cast("void(__stdcall*)(void*)", var_2_1)(var_2_2)

                        local var_2_3 = math.floor((tonumber(var_2_2[0]) - 1.16444736e+17) / 10000000)

                        var_2_0 = math.floor(var_2_3 / 86400)
                end
        end

        return var_2_0 ~= 0 and var_2_0 or 19723
end

slot_0_21_0 = "abcdefghijklmnopqrstuvwxyz0123456789"

function slot_0_22_0(arg_3_0)
        local var_3_0 = "#"

        for iter_3_0 = 1, 8 do
                arg_3_0 = (arg_3_0 * 1103515245 + 12345) % 2147483648

                local var_3_1 = arg_3_0 % #slot_0_21_0 + 1

                var_3_0 = var_3_0 .. string.sub(slot_0_21_0, var_3_1, var_3_1)
        end

        return var_3_0
end

function slot_0_23_0()
        local var_4_0 = slot_0_20_0()

        for iter_4_0 = 1, #slot_0_18_0 do
                var_4_0 = (var_4_0 * 31 + string.byte(slot_0_18_0, iter_4_0)) % 2147483647
        end

        return slot_0_22_0(var_4_0)
end

function slot_0_24_0(arg_5_0)
        arg_5_0 = string.lower(arg_5_0)
        arg_5_0 = string.gsub(arg_5_0, "[^a-z0-9]", "")

        if #arg_5_0 == 0 then
                return nil
        end

        if #arg_5_0 > slot_0_19_0 then
                arg_5_0 = string.sub(arg_5_0, 1, slot_0_19_0)
        end

        local var_5_0 = slot_0_20_0()

        for iter_5_0 = 1, #arg_5_0 do
                var_5_0 = (var_5_0 * 31 + string.byte(arg_5_0, iter_5_0)) % 2147483647
        end

        for iter_5_1 = 1, #slot_0_18_0 do
                var_5_0 = (var_5_0 * 31 + string.byte(slot_0_18_0, iter_5_1)) % 2147483647
        end

        return slot_0_22_0(var_5_0)
end

slot_0_25_0 = slot_0_23_0()
slot_0_26_0 = nil
slot_0_27_0 = "k9Xm2vQ7pL4nR8wY3jF6hB1cT5zA0dE"
slot_0_28_0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

function slot_0_29_0(arg_6_0)
        return (arg_6_0:gsub(".", function(arg_7_0)
                local var_7_0 = ""
                local var_7_1 = arg_7_0:byte()

                for iter_7_0 = 8, 1, -1 do
                        var_7_0 = var_7_0 .. (var_7_1 % 2^iter_7_0 - var_7_1 % 2^(iter_7_0 - 1) > 0 and "1" or "0")
                end

                return var_7_0
        end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg_8_0)
                if #arg_8_0 < 6 then
                        return ""
                end

                local var_8_0 = 0

                for iter_8_0 = 1, 6 do
                        var_8_0 = var_8_0 + (arg_8_0:sub(iter_8_0, iter_8_0) == "1" and 2^(6 - iter_8_0) or 0)
                end

                return slot_0_28_0:sub(var_8_0 + 1, var_8_0 + 1)
        end) .. ({
                "",
                "==",
                "="
        })[#arg_6_0 % 3 + 1]
end

function slot_0_30_0(arg_9_0)
        arg_9_0 = string.gsub(arg_9_0, "[^" .. slot_0_28_0 .. "=]", "")

        return (arg_9_0:gsub(".", function(arg_10_0)
                if arg_10_0 == "=" then
                        return ""
                end

                local var_10_0 = ""
                local var_10_1 = slot_0_28_0:find(arg_10_0) - 1

                for iter_10_0 = 6, 1, -1 do
                        var_10_0 = var_10_0 .. (var_10_1 % 2^iter_10_0 - var_10_1 % 2^(iter_10_0 - 1) > 0 and "1" or "0")
                end

                return var_10_0
        end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(arg_11_0)
                if #arg_11_0 ~= 8 then
                        return ""
                end

                local var_11_0 = 0

                for iter_11_0 = 1, 8 do
                        var_11_0 = var_11_0 + (arg_11_0:sub(iter_11_0, iter_11_0) == "1" and 2^(8 - iter_11_0) or 0)
                end

                return string.char(var_11_0)
        end))
end

function slot_0_31_0(arg_12_0, arg_12_1)
        if not bit then
                return arg_12_0
        end

        local var_12_0 = {}

        for iter_12_0 = 1, #arg_12_0 do
                local var_12_1 = string.byte(arg_12_1, (iter_12_0 - 1) % #arg_12_1 + 1)

                table.insert(var_12_0, string.char(bit.bxor(string.byte(arg_12_0, iter_12_0), var_12_1)))
        end

        return table.concat(var_12_0)
end

function slot_0_32_0(arg_13_0)
        local var_13_0 = 0

        for iter_13_0 = 1, #arg_13_0 do
                var_13_0 = (var_13_0 * 31 + string.byte(arg_13_0, iter_13_0)) % 4294967296
        end

        return string.format("%08x", var_13_0)
end

slot_0_33_0 = nil

if slot_0_0_0 then
        slot_0_34_1 = utils.find_export("kernel32.dll", "GetSystemTimeAsFileTime")

        if slot_0_34_1 and slot_0_34_1 ~= 0 then
                ffi.cdef("typedef struct { unsigned long dwLowDateTime; unsigned long dwHighDateTime; } FILETIME_T;")

                slot_0_35_1 = ffi.cast("void(__stdcall*)(void*)", slot_0_34_1)
                slot_0_36_1 = ffi.new("FILETIME_T")

                function slot_0_33_0()
                        slot_0_35_1(slot_0_36_1)

                        local var_14_0 = tonumber(slot_0_36_1.dwHighDateTime) or 0
                        local var_14_1 = tonumber(slot_0_36_1.dwLowDateTime) or 0

                        return math.floor((var_14_0 * 4294967296 + var_14_1 - 1.16444736e+17) / 10000000)
                end
        end
end

slot_0_33_0 = slot_0_33_0 or function()
        return draw and draw.time and math.floor(draw.time) or 0
end
slot_0_34_0 = 60
slot_0_35_0 = 500
slot_0_36_0 = 20
slot_0_37_0 = 20

function slot_0_38_0(arg_16_0, arg_16_1, arg_16_2)
        local var_16_0 = slot_0_33_0()
        local var_16_1 = arg_16_2 or "*"
        local var_16_2 = tostring(var_16_0) .. "|" .. arg_16_0 .. "|" .. var_16_1 .. "|" .. arg_16_1
        local var_16_3 = slot_0_32_0(var_16_2 .. slot_0_27_0)
        local var_16_4 = slot_0_29_0(slot_0_31_0(var_16_2, slot_0_27_0))

        return "[ENC:" .. var_16_3 .. "]" .. var_16_4
end

function slot_0_39_0(arg_17_0)
        local var_17_0, var_17_1 = string.match(arg_17_0, "^%[ENC:(%x%x%x%x%x%x%x%x)%](.+)$")

        if not var_17_0 or not var_17_1 then
                return nil, nil, nil
        end

        if #var_17_1 > 2000 then
                return nil, nil, nil
        end

        local var_17_2 = slot_0_31_0(slot_0_30_0(var_17_1), slot_0_27_0)

        if var_17_0 ~= slot_0_32_0(var_17_2 .. slot_0_27_0) then
                return nil, nil, nil
        end

        local var_17_3 = {}

        for iter_17_0 in string.gmatch(var_17_2, "([^|]+)") do
                table.insert(var_17_3, iter_17_0)
        end

        local var_17_4
        local var_17_5
        local var_17_6
        local var_17_7

        if #var_17_3 >= 4 then
                var_17_4, var_17_5, var_17_6 = var_17_3[1], var_17_3[2], var_17_3[3]
                var_17_7 = table.concat(var_17_3, "|", 4)
        else
                return nil, nil, nil
        end

        if #var_17_5 > slot_0_36_0 then
                return nil, nil, nil
        end

        if #var_17_6 > slot_0_37_0 then
                return nil, nil, nil
        end

        if #var_17_7 > slot_0_35_0 then
                var_17_7 = string.sub(var_17_7, 1, slot_0_35_0) .. "..."
        end

        if math.abs(slot_0_33_0() - (tonumber(var_17_4) or 0)) > slot_0_34_0 then
                return nil, nil, nil
        end

        return var_17_5, var_17_7, var_17_6
end

slot_0_40_0 = slot_0_15_0
slot_0_41_0 = 0
slot_0_42_0 = ""
slot_0_43_0 = gui.checkbox(gui.control_id("shoutbox_enable"))
slot_0_44_0 = gui.ctx:find("lua>elements a")

if slot_0_44_0 then
        slot_0_44_0:add(gui.make_control("shoutbox", slot_0_43_0))
end

function slot_0_45_0(arg_18_0, arg_18_1, arg_18_2)
        return arg_18_0 < arg_18_1 and arg_18_1 or arg_18_2 < arg_18_0 and arg_18_2 or arg_18_0
end

slot_0_46_0 = {
        dragging = false,
        max_h = 600,
        min_h = 200,
        max_w = 800,
        input_scroll = 0,
        drag_offset_y = 0,
        drag_offset_x = 0,
        scroll_offset = 0,
        x = 100,
        cursor_timer = 0,
        input_text = "",
        focused = false,
        y = 100,
        w = 450,
        h = 320,
        min_w = 300,
        resizing = false
}
slot_0_47_0 = {}
slot_0_48_0 = 50
slot_0_49_0 = {}

function slot_0_50_0(arg_19_0, arg_19_1)
        table.insert(slot_0_47_0, {
                text = arg_19_0,
                color = arg_19_1 or draw.color.white()
        })

        if #slot_0_47_0 > slot_0_48_0 then
                table.remove(slot_0_47_0, 1)
        end

        slot_0_46_0.scroll_offset = 0
end

slot_0_51_0 = 0

if slot_0_0_0 then
        slot_0_52_1 = utils.find_export("kernel32.dll", "GetTimeZoneInformation")

        if slot_0_52_1 and slot_0_52_1 ~= 0 then
                ffi.cdef("            typedef struct { \n                long Bias;\n                char StandardName[64];\n                char StandardDate[16];\n                long StandardBias;\n                char DaylightName[64];\n                char DaylightDate[16];\n                long DaylightBias;\n            } TIME_ZONE_INFORMATION_T;\n        ")

                slot_0_53_1 = ffi.cast("int(__stdcall*)(void*)", slot_0_52_1)
                slot_0_54_1 = ffi.new("TIME_ZONE_INFORMATION_T")
                slot_0_55_1 = slot_0_53_1(slot_0_54_1)
                slot_0_56_1 = slot_0_54_1.Bias

                if slot_0_55_1 == 2 then
                        slot_0_56_1 = slot_0_56_1 + slot_0_54_1.DaylightBias
                elseif slot_0_55_1 == 1 then
                        slot_0_56_1 = slot_0_56_1 + slot_0_54_1.StandardBias
                end

                slot_0_51_0 = -slot_0_56_1 * 60
        end
end

function slot_0_52_0()
        local var_20_0 = slot_0_33_0()

        if var_20_0 == 0 then
                return ""
        end

        local var_20_1 = (var_20_0 + slot_0_51_0) % 86400
        local var_20_2 = math.floor(var_20_1 / 3600)
        local var_20_3 = math.floor(var_20_1 % 3600 / 60)

        return string.format("[%02d:%02d] ", var_20_2, var_20_3)
end

slot_0_53_0 = {
        MENTION = draw.color(255, 220, 100, 255),
        PM = draw.color(255, 180, 255, 255),
        OWN_MSG = draw.color(180, 220, 255, 255),
        SUCCESS = draw.color(100, 255, 100, 255),
        WARNING = draw.color(255, 180, 50, 255),
        ERROR = draw.color(255, 100, 100, 255),
        SYSTEM = draw.color.gray(150, 255)
}

function slot_0_54_0(arg_21_0, arg_21_1)
        local var_21_0 = string.lower(arg_21_0)
        local var_21_1 = string.lower(arg_21_1)
        local var_21_2, var_21_3 = string.find(var_21_0, var_21_1, 1, true)

        while var_21_2 do
                local var_21_4 = var_21_2 > 1 and string.sub(var_21_0, var_21_2 - 1, var_21_2 - 1) or nil
                local var_21_5 = var_21_3 < #var_21_0 and string.sub(var_21_0, var_21_3 + 1, var_21_3 + 1) or nil
                local var_21_6 = not var_21_4 or not string.match(var_21_4, "%w")
                local var_21_7 = not var_21_5 or not string.match(var_21_5, "%w")

                if var_21_6 and var_21_7 then
                        return true
                end

                var_21_2, var_21_3 = string.find(var_21_0, var_21_1, var_21_3 + 1, true)
        end

        return false
end

function slot_0_55_0()
        local var_22_0 = gui.ctx and gui.ctx.user and gui.ctx.user.username and gui.ctx.user.username or "UnknownUser"
        local var_22_1 = string.gsub(var_22_0, "[^a-zA-Z0-9]", "")

        if #var_22_1 > 12 then
                var_22_1 = string.sub(var_22_1, 1, 12)
        end

        if #var_22_1 < 3 then
                var_22_1 = "User" .. tostring(math.random(100, 999))
        end

        return var_22_1
end

function slot_0_56_0()
        local var_23_0 = "abcdefghijklmnopqrstuvwxyz"
        local var_23_1 = "abcdefghijklmnopqrstuvwxyz0123456789"
        local var_23_2 = math.random(1, #var_23_0)
        local var_23_3 = string.sub(var_23_0, var_23_2, var_23_2)

        for iter_23_0 = 2, 8 do
                local var_23_4 = math.random(1, #var_23_1)

                var_23_3 = var_23_3 .. string.sub(var_23_1, var_23_4, var_23_4)
        end

        return var_23_3
end

slot_0_57_0 = slot_0_55_0()
slot_0_58_0 = slot_0_56_0()

function slot_0_59_0(arg_24_0)
        return slot_0_49_0[string.lower(arg_24_0)] == true
end

function slot_0_60_0(arg_25_0)
        local var_25_0 = string.lower(arg_25_0)

        if var_25_0 == string.lower(slot_0_57_0) then
                return false, "You can't block yourself!"
        end

        if slot_0_49_0[var_25_0] then
                return false, arg_25_0 .. " is already blocked."
        end

        slot_0_49_0[var_25_0] = true

        return true, "Blocked " .. arg_25_0
end

function slot_0_61_0(arg_26_0)
        local var_26_0 = string.lower(arg_26_0)

        if not slot_0_49_0[var_26_0] then
                return false, arg_26_0 .. " is not blocked."
        end

        slot_0_49_0[var_26_0] = nil

        return true, "Unblocked " .. arg_26_0
end

function slot_0_62_0()
        local var_27_0 = {}

        for iter_27_0, iter_27_1 in pairs(slot_0_49_0) do
                table.insert(var_27_0, iter_27_0)
        end

        return var_27_0
end

function slot_0_63_0(arg_28_0)
        if not slot_0_10_0 then
                return nil
        end

        local var_28_0 = slot_0_10_0(arg_28_0)

        if var_28_0 == nil then
                return nil
        end

        local var_28_1 = ffi.cast("struct in_addr **", var_28_0.h_addr_list)[0]

        return ffi.string(ffi.cast("char *", var_28_1), 4)
end

function slot_0_64_0()
        if not slot_0_1_0 or not slot_0_2_0 then
                return false
        end

        slot_0_58_0 = slot_0_56_0()

        local var_29_0 = ffi.new("WSADATA")

        if slot_0_1_0(514, var_29_0) ~= 0 then
                return false
        end

        slot_0_40_0 = slot_0_2_0(slot_0_12_0, slot_0_13_0, slot_0_14_0)

        if slot_0_40_0 == slot_0_15_0 then
                return false
        end

        local var_29_1 = ffi.new("u_long[1]", 1)

        slot_0_7_0(slot_0_40_0, 2147772030, var_29_1)

        local var_29_2 = slot_0_63_0(slot_0_16_0)

        if not var_29_2 then
                return false
        end

        local var_29_3 = ffi.new("sockaddr_in")

        var_29_3.sin_family, var_29_3.sin_port = slot_0_12_0, slot_0_9_0(slot_0_17_0)

        ffi.copy(var_29_3.sin_addr, var_29_2, 4)
        slot_0_3_0(slot_0_40_0, ffi.cast("const struct sockaddr*", var_29_3), ffi.sizeof(var_29_3))
        slot_0_50_0("Connecting...", slot_0_53_0.SYSTEM)

        slot_0_41_0 = 2

        return true
end

function slot_0_65_0(arg_30_0)
        if slot_0_40_0 ~= slot_0_15_0 then
                slot_0_4_0(slot_0_40_0, arg_30_0 .. "\r\n", #arg_30_0 + 2, 0)
        end
end

slot_0_66_0 = 120
slot_0_67_0 = 0
slot_0_68_0 = 2

function slot_0_69_0()
        if draw and draw.time and draw.time > 0 then
                return draw.time
        end

        if game and game.global_vars and game.global_vars.realtime then
                return game.global_vars.realtime
        end

        return 0
end

slot_0_70_0 = slot_0_69_0

if slot_0_0_0 then
        slot_0_71_1 = utils.find_export("kernel32.dll", "QueryPerformanceCounter")
        slot_0_72_1 = utils.find_export("kernel32.dll", "QueryPerformanceFrequency")

        if slot_0_71_1 and slot_0_72_1 and slot_0_71_1 ~= 0 and slot_0_72_1 ~= 0 then
                ffi.cdef("typedef struct { int64_t QuadPart; } LI_TIME; int QueryPerformanceCounter(LI_TIME* lpPC); int QueryPerformanceFrequency(LI_TIME* lpF);")

                slot_0_73_1 = ffi.cast("int(__stdcall*)(void*)", slot_0_71_1)
                slot_0_74_1 = ffi.cast("int(__stdcall*)(void*)", slot_0_72_1)
                slot_0_75_1 = ffi.new("LI_TIME")
                slot_0_76_1 = ffi.new("LI_TIME")

                if slot_0_74_1(slot_0_75_1) ~= 0 then
                        slot_0_77_1 = tonumber(slot_0_75_1.QuadPart)

                        function slot_0_70_0()
                                return slot_0_73_1(slot_0_76_1) ~= 0 and tonumber(slot_0_76_1.QuadPart) / slot_0_77_1 or slot_0_69_0()
                        end
                end
        end
end

slot_0_71_0 = nil

function slot_0_72_0(arg_33_0)
        if not slot_0_0_0 then
                return
        end

        slot_33_1_1, slot_33_2_1 = string.match(arg_33_0, "^/(%w+)%s*(.*)")

        if slot_33_1_1 then
                slot_33_1_0 = string.lower(slot_33_1_1)
                slot_33_2_0 = slot_33_2_1 and string.match(slot_33_2_1, "^%s*(.-)%s*$") or ""

                if slot_33_1_0 == "block" then
                        if slot_33_2_0 == "" then
                                slot_0_50_0("Usage: /block <username>", slot_0_53_0.WARNING)
                        else
                                slot_33_3_6, slot_33_4_3 = slot_0_60_0(slot_33_2_0)

                                slot_0_50_0(slot_33_4_3, slot_33_3_6 and slot_0_53_0.SUCCESS or slot_0_53_0.WARNING)
                        end

                        return
                elseif slot_33_1_0 == "unblock" then
                        if slot_33_2_0 == "" then
                                slot_0_50_0("Usage: /unblock <username>", slot_0_53_0.WARNING)
                        else
                                slot_33_3_5, slot_33_4_2 = slot_0_61_0(slot_33_2_0)

                                slot_0_50_0(slot_33_4_2, slot_33_3_5 and slot_0_53_0.SUCCESS or slot_0_53_0.WARNING)
                        end

                        return
                elseif slot_33_1_0 == "blocklist" or slot_33_1_0 == "blocks" then
                        slot_33_3_4 = slot_0_62_0()

                        if #slot_33_3_4 == 0 then
                                slot_0_50_0("No users blocked.", slot_0_53_0.SYSTEM)
                        else
                                slot_0_50_0("Blocked users: " .. table.concat(slot_33_3_4, ", "), slot_0_53_0.SYSTEM)
                        end

                        return
                elseif slot_33_1_0 == "clear" then
                        slot_0_47_0 = {}
                        slot_0_46_0.scroll_offset = 0

                        slot_0_50_0("Chat cleared.", slot_0_53_0.SYSTEM)

                        return
                elseif slot_33_1_0 == "reconnect" then
                        slot_0_71_0()

                        return
                elseif slot_33_1_0 == "pm" or slot_33_1_0 == "msg" or slot_33_1_0 == "w" or slot_33_1_0 == "whisper" then
                        slot_33_3_3, slot_33_4_1 = string.match(slot_33_2_0, "^(%S+)%s+(.+)$")

                        if not slot_33_3_3 or not slot_33_4_1 then
                                slot_0_50_0("Usage: /pm <username> <message>", slot_0_53_0.WARNING)

                                return
                        end

                        if #slot_33_3_3 > slot_0_36_0 then
                                slot_0_50_0("Username too long! Max " .. slot_0_36_0 .. " chars.", slot_0_53_0.ERROR)

                                return
                        end

                        if not string.match(slot_33_3_3, "^[a-zA-Z0-9]+$") then
                                slot_0_50_0("Invalid username. Use letters/numbers only.", slot_0_53_0.ERROR)

                                return
                        end

                        slot_33_5_0 = slot_0_70_0()

                        if slot_33_5_0 - slot_0_67_0 < slot_0_68_0 then
                                slot_0_50_0("Slow down! Wait " .. math.ceil(slot_0_68_0 - (slot_33_5_0 - slot_0_67_0)) .. "s", slot_0_53_0.WARNING)

                                return
                        end

                        if #slot_33_4_1 > slot_0_66_0 then
                                slot_0_50_0("Message too long!", slot_0_53_0.ERROR)

                                return
                        end

                        slot_0_67_0 = slot_33_5_0

                        slot_0_50_0(slot_0_52_0() .. "[PM to " .. slot_33_3_3 .. "] " .. slot_33_4_1, slot_0_53_0.PM)
                        slot_0_65_0("PRIVMSG " .. slot_0_25_0 .. " :" .. slot_0_38_0(slot_0_57_0, slot_33_4_1, slot_33_3_3))

                        return
                elseif slot_33_1_0 == "channel" or slot_33_1_0 == "join" or slot_33_1_0 == "ch" then
                        if slot_33_2_0 == "" then
                                if slot_0_26_0 then
                                        slot_0_50_0("Current channel: " .. slot_0_26_0, slot_0_53_0.SYSTEM)
                                else
                                        slot_0_50_0("Current channel: (default)", slot_0_53_0.SYSTEM)
                                end

                                slot_0_50_0("Usage: /channel <name> (max 6 chars)", slot_0_53_0.WARNING)

                                return
                        end

                        slot_33_3_2 = string.lower(slot_33_2_0)
                        slot_33_3_1 = string.gsub(slot_33_3_2, "[^a-z0-9]", "")

                        if #slot_33_3_1 == 0 then
                                slot_0_50_0("Invalid channel name. Use letters/numbers only.", slot_0_53_0.ERROR)

                                return
                        end

                        if #slot_33_3_1 > slot_0_19_0 then
                                slot_0_50_0("Channel name too long! Max " .. slot_0_19_0 .. " chars.", slot_0_53_0.ERROR)

                                return
                        end

                        slot_33_4_0 = slot_0_24_0(slot_33_3_1)

                        if slot_33_4_0 and slot_33_4_0 ~= slot_0_25_0 then
                                slot_0_26_0 = slot_33_3_1
                                slot_0_25_0 = slot_33_4_0
                                slot_0_47_0 = {}

                                slot_0_50_0("Joining channel: " .. slot_33_3_1, slot_0_53_0.SUCCESS)
                                slot_0_71_0()
                        elseif slot_33_4_0 == slot_0_25_0 then
                                slot_0_50_0("Already in channel: " .. slot_33_3_1, slot_0_53_0.WARNING)
                        end

                        return
                elseif slot_33_1_0 == "leave" or slot_33_1_0 == "default" then
                        if slot_0_26_0 == nil then
                                slot_0_50_0("Already in default channel.", slot_0_53_0.WARNING)

                                return
                        end

                        slot_0_26_0 = nil
                        slot_0_25_0 = slot_0_23_0()
                        slot_0_47_0 = {}

                        slot_0_50_0("Returning to default channel.", slot_0_53_0.SUCCESS)
                        slot_0_71_0()

                        return
                elseif slot_33_1_0 == "help" or slot_33_1_0 == "commands" then
                        slot_0_50_0("--- Chat ---", slot_0_53_0.SYSTEM)
                        slot_0_50_0("/pm <user> <msg>   - Send private message", slot_0_53_0.SYSTEM)
                        slot_0_50_0("/channel <name>    - Join custom channel", slot_0_53_0.SYSTEM)
                        slot_0_50_0("/default           - Return to main channel", slot_0_53_0.SYSTEM)
                        slot_0_50_0("--- Tools ---", slot_0_53_0.SYSTEM)
                        slot_0_50_0("/block <user>      - Block a user", slot_0_53_0.SYSTEM)
                        slot_0_50_0("/unblock <user>    - Unblock a user", slot_0_53_0.SYSTEM)
                        slot_0_50_0("/blocklist         - View blocked users", slot_0_53_0.SYSTEM)
                        slot_0_50_0("/clear             - Clear chat history", slot_0_53_0.SYSTEM)

                        return
                end
        end

        slot_33_3_0 = slot_0_70_0()

        if slot_33_3_0 - slot_0_67_0 < slot_0_68_0 then
                slot_0_50_0("Slow down! Wait " .. math.ceil(slot_0_68_0 - (slot_33_3_0 - slot_0_67_0)) .. "s", slot_0_53_0.WARNING)

                return
        end

        if #arg_33_0 > slot_0_66_0 then
                slot_0_50_0("Message too long!", slot_0_53_0.ERROR)

                return
        end

        slot_0_67_0 = slot_33_3_0

        slot_0_50_0(slot_0_52_0() .. slot_0_57_0 .. ": " .. arg_33_0, slot_0_53_0.OWN_MSG)
        slot_0_65_0("PRIVMSG " .. slot_0_25_0 .. " :" .. slot_0_38_0(slot_0_57_0, arg_33_0))
end

slot_0_73_0 = 0
slot_0_74_0 = 0
slot_0_75_0 = 0

function slot_0_71_0()
        if not slot_0_0_0 then
                return
        end

        slot_0_50_0("Forcing reconnect...", slot_0_53_0.SYSTEM)

        if slot_0_40_0 ~= slot_0_15_0 then
                slot_0_6_0(slot_0_40_0)
        end

        slot_0_40_0, slot_0_41_0, slot_0_74_0 = slot_0_15_0, 0, 0
end

function slot_0_76_0()
        if not slot_0_0_0 then
                return
        end

        slot_35_0_0 = slot_0_69_0()

        if slot_35_0_0 - slot_0_75_0 > 60 then
                slot_35_1_2 = nil

                if slot_0_26_0 then
                        slot_35_1_2 = slot_0_24_0(slot_0_26_0)
                else
                        slot_35_1_2 = slot_0_23_0()
                end

                if slot_35_1_2 and slot_35_1_2 ~= slot_0_25_0 then
                        slot_0_25_0 = slot_35_1_2

                        slot_0_50_0("Channel rotated (daily security).", slot_0_53_0.SYSTEM)
                        slot_0_71_0()

                        slot_0_75_0 = slot_35_0_0

                        return
                end

                slot_0_75_0 = slot_35_0_0
        end

        if slot_0_40_0 == slot_0_15_0 then
                if slot_0_73_0 == 0 or slot_35_0_0 - slot_0_73_0 > 5 then
                        slot_0_73_0 = slot_35_0_0

                        slot_0_64_0()
                end

                return
        end

        if slot_0_41_0 == 3 and slot_0_74_0 > 0 and slot_35_0_0 > 0 and slot_35_0_0 - slot_0_74_0 > 15 then
                slot_0_6_0(slot_0_40_0)

                slot_0_40_0, slot_0_41_0 = slot_0_15_0, 0

                return
        end

        if slot_0_41_0 == 2 then
                slot_35_1_1 = ffi.new("fd_set")
                slot_35_2_1 = ffi.new("fd_set")
                slot_35_1_1.fd_count, slot_35_2_1.fd_count = 1, 1
                slot_35_1_1.fd_array[0], slot_35_2_1.fd_array[0] = slot_0_40_0, slot_0_40_0

                if slot_0_8_0(0, nil, slot_35_1_1, slot_35_2_1, ffi.new("struct timeval", {
                        0,
                        0
                })) > 0 then
                        slot_35_3_1 = false

                        for iter_35_0 = 0, slot_35_2_1.fd_count - 1 do
                                if slot_35_2_1.fd_array[iter_35_0] == slot_0_40_0 then
                                        slot_35_3_1 = true

                                        break
                                end
                        end

                        if slot_35_3_1 then
                                slot_0_6_0(slot_0_40_0)

                                slot_0_40_0, slot_0_41_0 = slot_0_15_0, 0
                        else
                                slot_0_50_0("Connected! Logging in...", draw.color.white())

                                slot_0_41_0 = 3
                                slot_0_74_0 = slot_35_0_0

                                slot_0_65_0("NICK " .. slot_0_58_0)
                                slot_0_65_0("USER " .. slot_0_58_0 .. " " .. slot_0_58_0 .. " " .. slot_0_58_0 .. " :user")
                        end
                end
        elseif slot_0_41_0 == 3 then
                slot_35_1_0 = ffi.new("fd_set")
                slot_35_1_0.fd_count, slot_35_1_0.fd_array[0] = 1, slot_0_40_0

                if slot_0_8_0(0, slot_35_1_0, nil, nil, ffi.new("struct timeval", {
                        0,
                        0
                })) > 0 then
                        slot_35_2_0 = ffi.new("char[4096]")
                        slot_35_3_0 = slot_0_5_0(slot_0_40_0, slot_35_2_0, 4095, 0)

                        if slot_35_3_0 > 0 then
                                slot_0_42_0 = slot_0_42_0 .. ffi.string(slot_35_2_0, slot_35_3_0)

                                if #slot_0_42_0 > 20480 then
                                        slot_0_42_0 = string.sub(slot_0_42_0, -4096)
                                end

                                while true do
                                        slot_35_4_0 = string.find(slot_0_42_0, "\r\n")

                                        if not slot_35_4_0 then
                                                break
                                        end

                                        slot_35_5_0 = string.sub(slot_0_42_0, 1, slot_35_4_0 - 1)
                                        slot_0_42_0 = string.sub(slot_0_42_0, slot_35_4_0 + 2)

                                        if string.sub(slot_35_5_0, 1, 4) == "PING" then
                                                slot_0_65_0("PONG " .. string.sub(slot_35_5_0, 6))
                                        elseif string.find(slot_35_5_0, " 001 ") then
                                                slot_0_50_0("Connected to chat!", slot_0_53_0.SUCCESS)

                                                slot_0_74_0 = 0

                                                slot_0_65_0("JOIN " .. slot_0_25_0)
                                        elseif string.find(slot_35_5_0, " 433 ") then
                                                slot_0_58_0 = slot_0_56_0()

                                                slot_0_65_0("NICK " .. slot_0_58_0)
                                        elseif string.find(slot_35_5_0, "PRIVMSG " .. slot_0_25_0) then
                                                slot_35_6_0, slot_35_7_0, slot_35_8_0 = slot_0_39_0(string.sub(slot_35_5_0, (string.find(slot_35_5_0, " :") or 0) + 2))

                                                if slot_35_6_0 and slot_35_7_0 and not slot_0_59_0(slot_35_6_0) then
                                                        slot_35_9_0 = slot_0_52_0()

                                                        if slot_35_8_0 == "*" then
                                                                slot_35_10_0 = draw.color.white()

                                                                if slot_0_54_0(slot_35_7_0, slot_0_57_0) then
                                                                        slot_35_10_0 = slot_0_53_0.MENTION
                                                                end

                                                                slot_0_50_0(slot_35_9_0 .. slot_35_6_0 .. ": " .. slot_35_7_0, slot_35_10_0)
                                                        elseif string.lower(slot_35_8_0) == string.lower(slot_0_57_0) then
                                                                slot_0_50_0(slot_35_9_0 .. "[PM from " .. slot_35_6_0 .. "] " .. slot_35_7_0, slot_0_53_0.PM)
                                                        end
                                                end
                                        end
                                end
                        elseif slot_35_3_0 == 0 then
                                slot_0_6_0(slot_0_40_0)

                                slot_0_40_0, slot_0_41_0 = slot_0_15_0, 0
                        end
                end
        end
end

function slot_0_77_0(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5)
        return arg_36_2 <= arg_36_0 and arg_36_0 <= arg_36_2 + arg_36_4 and arg_36_3 <= arg_36_1 and arg_36_1 <= arg_36_3 + arg_36_5
end

function slot_0_78_0(arg_37_0, arg_37_1, arg_37_2)
        if not arg_37_2 or arg_37_1 <= 50 then
                return {
                        arg_37_0
                }
        end

        local var_37_0 = {}
        local var_37_1 = ""
        local var_37_2 = 1.22
        local var_37_3 = {}

        for iter_37_0 in string.gmatch(arg_37_0, "%S+") do
                table.insert(var_37_3, iter_37_0)
        end

        if #var_37_3 == 0 then
                return {
                        ""
                }
        end

        for iter_37_1, iter_37_2 in ipairs(var_37_3) do
                local var_37_4 = arg_37_2:get_text_size(iter_37_2)

                if arg_37_1 < (var_37_4 and var_37_4.x and var_37_4.x * var_37_2 or 0) then
                        if var_37_1 ~= "" then
                                table.insert(var_37_0, var_37_1)

                                var_37_1 = ""
                        end

                        local var_37_5 = ""

                        for iter_37_3 = 1, #iter_37_2 do
                                local var_37_6 = string.sub(iter_37_2, iter_37_3, iter_37_3)
                                local var_37_7 = arg_37_2:get_text_size(var_37_5 .. var_37_6)

                                if (var_37_7 and var_37_7.x and var_37_7.x * var_37_2 or 0) > arg_37_1 - 5 then
                                        table.insert(var_37_0, var_37_5)

                                        var_37_5 = var_37_6
                                else
                                        var_37_5 = var_37_5 .. var_37_6
                                end
                        end

                        var_37_1 = var_37_5
                else
                        local var_37_8 = var_37_1 == "" and iter_37_2 or var_37_1 .. " " .. iter_37_2
                        local var_37_9 = arg_37_2:get_text_size(var_37_8)

                        if arg_37_1 < (var_37_9 and var_37_9.x and var_37_9.x * var_37_2 or 0) and var_37_1 ~= "" then
                                table.insert(var_37_0, var_37_1)

                                var_37_1 = iter_37_2
                        else
                                var_37_1 = var_37_8
                        end
                end
        end

        if var_37_1 ~= "" then
                table.insert(var_37_0, var_37_1)
        end

        return #var_37_0 == 0 and {
                ""
        } or var_37_0
end

function slot_0_79_0()
        if not slot_0_43_0:get_value():get() then
                slot_0_46_0.dragging, slot_0_46_0.resizing = false, false

                return
        end

        slot_38_0_0 = draw.surface
        slot_38_1_0 = draw.fonts.gui_main
        slot_38_0_0.font = slot_38_1_0
        slot_38_2_0 = math.floor(slot_0_46_0.x)
        slot_38_3_0 = math.floor(slot_0_46_0.y)
        slot_38_4_0 = math.floor(slot_0_46_0.w)
        slot_38_5_0 = math.floor(slot_0_46_0.h)

        if not slot_0_0_0 then
                slot_38_0_0:add_rect_filled(draw.rect(slot_38_2_0, slot_38_3_0, slot_38_2_0 + 200, slot_38_3_0 + 30), draw.color(18, 20, 28, 245), 4)
                slot_38_0_0:add_rect(draw.rect(slot_38_2_0, slot_38_3_0, slot_38_2_0 + 200, slot_38_3_0 + 30), draw.color(255, 80, 80, 255), 4, 1)
                slot_38_0_0:add_text(draw.vec2(slot_38_2_0 + 8, slot_38_3_0 + 8), "Shoutbox - FFI not enabled", draw.color.white())

                return
        end

        slot_38_0_0:add_rect_filled(draw.rect(slot_38_2_0, slot_38_3_0, slot_38_2_0 + slot_38_4_0, slot_38_3_0 + slot_38_5_0), draw.color(18, 20, 28, 245), 4)
        slot_38_0_0:add_rect(draw.rect(slot_38_2_0, slot_38_3_0, slot_38_2_0 + slot_38_4_0, slot_38_3_0 + slot_38_5_0), draw.color(60, 70, 120, 255), 4, 1)

        slot_38_6_0 = 25

        slot_38_0_0:add_rect_filled(draw.rect(slot_38_2_0, slot_38_3_0, slot_38_2_0 + slot_38_4_0, slot_38_3_0 + slot_38_6_0), draw.color(35, 40, 55, 255), 4)

        slot_38_7_0 = slot_0_26_0 and "Shoutbox [" .. slot_0_26_0 .. "]" or "Shoutbox"

        slot_38_0_0:add_text(draw.vec2(slot_38_2_0 + 8, slot_38_3_0 + 5), slot_38_7_0, draw.color.white())

        slot_38_8_0 = "Reconnect"
        slot_38_9_0 = 60
        slot_38_10_0 = 12

        if slot_38_1_0 then
                slot_38_11_1 = slot_38_1_0:get_text_size(slot_38_8_0)

                if slot_38_11_1 and slot_38_11_1.x then
                        slot_38_9_0 = math.ceil(slot_38_11_1.x * 1.15)
                end

                if slot_38_11_1 and slot_38_11_1.y then
                        slot_38_10_0 = slot_38_11_1.y
                end
        end

        slot_38_11_0 = slot_38_9_0 + 14
        slot_38_12_0 = 17
        slot_38_13_0 = math.max(slot_38_2_0 + 70, slot_38_2_0 + slot_38_4_0 - slot_38_11_0 - 5)
        slot_38_14_0 = slot_38_3_0 + 4
        slot_38_15_0 = slot_0_77_0(slot_0_46_0.last_mx or 0, slot_0_46_0.last_my or 0, slot_38_13_0, slot_38_14_0, slot_38_11_0, slot_38_12_0)

        slot_38_0_0:add_rect_filled(draw.rect(slot_38_13_0, slot_38_14_0, slot_38_13_0 + slot_38_11_0, slot_38_14_0 + slot_38_12_0), slot_38_15_0 and draw.color(70, 75, 95, 255) or draw.color(50, 55, 70, 255), 3)
        slot_38_0_0:add_text(draw.vec2(slot_38_13_0 + math.floor((slot_38_11_0 - slot_38_9_0) / 2), slot_38_14_0 + math.floor((slot_38_12_0 - slot_38_10_0) / 2)), slot_38_8_0, draw.color.white())

        slot_38_16_0 = 26
        slot_38_17_0 = slot_38_3_0 + slot_38_5_0 - 31
        slot_38_18_0 = slot_38_2_0 + 5
        slot_38_19_0 = slot_38_4_0 - 10
        slot_38_20_0 = slot_38_19_0 - 20
        slot_38_21_0 = slot_0_77_0(slot_0_46_0.last_mx or 0, slot_0_46_0.last_my or 0, slot_38_18_0, slot_38_17_0, slot_38_19_0, slot_38_16_0)

        slot_38_0_0:add_rect_filled(draw.rect(slot_38_18_0, slot_38_17_0, slot_38_18_0 + slot_38_19_0, slot_38_17_0 + slot_38_16_0), slot_0_46_0.focused and draw.color(30, 30, 40, 255) or slot_38_21_0 and draw.color(25, 25, 35, 255) or draw.color(20, 20, 30, 255), 4)
        slot_38_0_0:add_rect(draw.rect(slot_38_18_0, slot_38_17_0, slot_38_18_0 + slot_38_19_0, slot_38_17_0 + slot_38_16_0), draw.color(60, 60, 70, 255), 4, 1)

        slot_38_22_0 = slot_0_46_0.input_text

        if slot_38_1_0 and #slot_38_22_0 > 0 then
                slot_38_23_1 = slot_38_1_0:get_text_size(slot_38_22_0)

                if slot_38_20_0 < (slot_38_23_1 and slot_38_23_1.x and slot_38_23_1.x * 1.22 or 0) then
                        slot_38_24_1 = slot_38_22_0

                        while #slot_38_24_1 > 1 do
                                slot_38_24_1 = string.sub(slot_38_24_1, 2)
                                slot_38_25_1 = slot_38_1_0:get_text_size("..." .. slot_38_24_1)

                                if slot_38_20_0 >= (slot_38_25_1 and slot_38_25_1.x and slot_38_25_1.x * 1.22 or 0) then
                                        slot_38_22_0 = "..." .. slot_38_24_1

                                        break
                                end
                        end
                end
        end

        if slot_0_46_0.focused then
                slot_0_46_0.cursor_timer = slot_0_46_0.cursor_timer + 1

                if slot_0_46_0.cursor_timer % 60 < 30 then
                        slot_38_22_0 = slot_38_22_0 .. "|"
                end
        elseif slot_0_46_0.input_text == "" then
                slot_38_22_0 = "Type here..."
        end

        slot_38_0_0:add_text(draw.vec2(slot_38_18_0 + 5, slot_38_17_0 + 6), slot_38_22_0, slot_0_46_0.focused and draw.color.white() or draw.color.gray(150, 255))

        slot_38_23_0 = slot_38_2_0 + 5
        slot_38_24_0 = slot_38_3_0 + slot_38_6_0 + 3
        slot_38_25_0 = slot_38_4_0 - 18
        slot_38_26_0 = slot_38_5_0 - slot_38_6_0 - slot_38_16_0 - 12
        slot_38_27_0 = 14
        slot_38_28_0 = {}

        for iter_38_0, iter_38_1 in ipairs(slot_0_47_0) do
                slot_38_34_2 = slot_0_78_0(iter_38_1.text, slot_38_25_0 - 5, slot_38_1_0)

                for iter_38_2, iter_38_3 in ipairs(slot_38_34_2) do
                        table.insert(slot_38_28_0, {
                                text = iter_38_3,
                                color = iter_38_1.color
                        })
                end
        end

        slot_38_29_0 = math.floor(slot_38_26_0 / slot_38_27_0)
        slot_38_30_0 = math.max(0, #slot_38_28_0 - slot_38_29_0)
        slot_0_46_0.scroll_offset = slot_0_45_0(slot_0_46_0.scroll_offset, 0, slot_38_30_0)
        slot_38_31_0 = #slot_38_28_0 - slot_0_46_0.scroll_offset

        for iter_38_4 = 0, slot_38_29_0 - 1 do
                slot_38_36_2 = slot_38_28_0[slot_38_31_0 - iter_38_4]

                if not slot_38_36_2 then
                        break
                end

                slot_38_37_1 = slot_38_36_2.text

                if slot_38_1_0 then
                        slot_38_38_0 = slot_38_1_0:get_text_size(slot_38_37_1)

                        while slot_38_38_0 and slot_38_38_0.x and slot_38_25_0 < slot_38_38_0.x and #slot_38_37_1 > 1 do
                                slot_38_37_1 = string.sub(slot_38_37_1, 1, -2)
                                slot_38_38_0 = slot_38_1_0:get_text_size(slot_38_37_1)
                        end
                end

                slot_38_0_0:add_text(draw.vec2(slot_38_23_0, slot_38_24_0 + slot_38_26_0 - (iter_38_4 + 1) * slot_38_27_0), slot_38_37_1, slot_38_36_2.color)
        end

        if slot_38_29_0 < #slot_38_28_0 then
                slot_38_32_1 = slot_38_2_0 + slot_38_4_0 - 10
                slot_38_33_1 = slot_38_24_0
                slot_38_34_1 = slot_38_26_0
                slot_38_35_0 = 6

                slot_38_0_0:add_rect_filled(draw.rect(slot_38_32_1, slot_38_33_1, slot_38_32_1 + slot_38_35_0, slot_38_33_1 + slot_38_34_1), draw.color(30, 32, 40, 255), 3)

                slot_38_36_1 = math.max(20, slot_38_29_0 / #slot_38_28_0 * slot_38_34_1)
                slot_38_37_0 = slot_38_33_1 + slot_38_34_1 - slot_38_36_1 - slot_0_46_0.scroll_offset / slot_38_30_0 * (slot_38_34_1 - slot_38_36_1)

                slot_38_0_0:add_rect_filled(draw.rect(slot_38_32_1, slot_38_37_0, slot_38_32_1 + slot_38_35_0, slot_38_37_0 + slot_38_36_1), draw.color(80, 90, 120, 255), 3)
        end

        slot_38_32_0 = 12
        slot_38_33_0 = slot_38_2_0 + slot_38_4_0 - slot_38_32_0
        slot_38_34_0 = slot_38_3_0 + slot_38_5_0 - slot_38_32_0
        slot_38_36_0 = (slot_0_77_0(slot_0_46_0.last_mx or 0, slot_0_46_0.last_my or 0, slot_38_33_0, slot_38_34_0, slot_38_32_0, slot_38_32_0) or slot_0_46_0.resizing) and draw.color(100, 110, 150, 255) or draw.color(60, 70, 100, 255)

        for iter_38_5 = 0, 2 do
                slot_38_41_0 = iter_38_5 * 4

                slot_38_0_0:add_rect_filled(draw.rect(slot_38_33_0 + slot_38_41_0 + 2, slot_38_34_0 + slot_38_32_0 - 2, slot_38_33_0 + slot_38_41_0 + 4, slot_38_34_0 + slot_38_32_0), slot_38_36_0, 0)
                slot_38_0_0:add_rect_filled(draw.rect(slot_38_33_0 + slot_38_32_0 - 2, slot_38_34_0 + slot_38_41_0 + 2, slot_38_33_0 + slot_38_32_0, slot_38_34_0 + slot_38_41_0 + 4), slot_38_36_0, 0)
        end

        slot_0_76_0()
end

events.input:add(function(arg_39_0, arg_39_1, arg_39_2)
        if not slot_0_43_0:get_value():get() then
                return
        end

        slot_39_3_0 = bit.band(arg_39_2, 65535)
        slot_39_4_0 = bit.rshift(arg_39_2, 16)
        slot_0_46_0.last_mx, slot_0_46_0.last_my = slot_39_3_0, slot_39_4_0

        if arg_39_0 == 512 then
                if slot_0_46_0.dragging then
                        slot_0_46_0.x, slot_0_46_0.y = slot_39_3_0 - slot_0_46_0.drag_offset_x, slot_39_4_0 - slot_0_46_0.drag_offset_y
                elseif slot_0_46_0.resizing then
                        slot_0_46_0.w, slot_0_46_0.h = slot_0_45_0(slot_39_3_0 - slot_0_46_0.x, slot_0_46_0.min_w, slot_0_46_0.max_w), slot_0_45_0(slot_39_4_0 - slot_0_46_0.y, slot_0_46_0.min_h, slot_0_46_0.max_h)
                end
        elseif arg_39_0 == 513 then
                if slot_0_77_0(slot_39_3_0, slot_39_4_0, slot_0_46_0.x + slot_0_46_0.w - 12, slot_0_46_0.y + slot_0_46_0.h - 12, 12, 12) then
                        slot_0_46_0.resizing, slot_0_46_0.focused = true, false
                elseif slot_0_77_0(slot_39_3_0, slot_39_4_0, slot_0_46_0.x + 5, slot_0_46_0.y + slot_0_46_0.h - 33, slot_0_46_0.w - 10, 28) then
                        slot_0_46_0.focused = true
                else
                        slot_0_46_0.focused = false
                        slot_39_5_0 = math.max(slot_0_46_0.x + 70, slot_0_46_0.x + slot_0_46_0.w - 90)

                        if slot_0_77_0(slot_39_3_0, slot_39_4_0, slot_39_5_0, slot_0_46_0.y + 3, 85, 20) then
                                slot_0_71_0()
                        elseif slot_0_77_0(slot_39_3_0, slot_39_4_0, slot_0_46_0.x, slot_0_46_0.y, slot_0_46_0.w, 25) then
                                slot_0_46_0.dragging, slot_0_46_0.drag_offset_x, slot_0_46_0.drag_offset_y = true, slot_39_3_0 - slot_0_46_0.x, slot_39_4_0 - slot_0_46_0.y
                        end
                end
        elseif arg_39_0 == 514 then
                slot_0_46_0.dragging, slot_0_46_0.resizing = false, false
        elseif arg_39_0 == 522 then
                if slot_0_77_0(slot_39_3_0, slot_39_4_0, slot_0_46_0.x, slot_0_46_0.y, slot_0_46_0.w, slot_0_46_0.h) then
                        if bit.arshift(arg_39_1, 16) > 0 then
                                slot_0_46_0.scroll_offset = slot_0_46_0.scroll_offset + 3
                        else
                                slot_0_46_0.scroll_offset = math.max(0, slot_0_46_0.scroll_offset - 3)
                        end
                end
        elseif arg_39_0 == 258 and slot_0_46_0.focused then
                if arg_39_1 >= 32 and arg_39_1 <= 126 and #slot_0_46_0.input_text < slot_0_66_0 then
                        slot_0_46_0.input_text = slot_0_46_0.input_text .. string.char(arg_39_1)
                end
        elseif arg_39_0 == 256 and slot_0_46_0.focused then
                if arg_39_1 == 8 then
                        if #slot_0_46_0.input_text > 0 then
                                slot_0_46_0.input_text = string.sub(slot_0_46_0.input_text, 1, -2)
                        end
                elseif arg_39_1 == 13 then
                        if #slot_0_46_0.input_text > 0 then
                                slot_0_72_0(slot_0_46_0.input_text)

                                slot_0_46_0.input_text = ""
                        end
                elseif arg_39_1 == 27 then
                        slot_0_46_0.focused = false
                end
        end
end)

if slot_0_0_0 then
        slot_0_64_0()
end

events.present_queue:add(slot_0_79_0)
