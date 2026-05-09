--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.ctx:find("lua>elements a")

if not slot_0_0_0 then
        return
end

slot_0_1_0 = gui.checkbox(gui.control_id("league_mode"))
slot_0_2_0 = gui.make_control("Auto Connect", slot_0_1_0)

slot_0_0_0:add(slot_0_2_0)
slot_0_0_0:reset()

slot_0_3_0 = ffi

slot_0_3_0.cdef("typedef void* HANDLE;\ntypedef void* HGLOBAL;\ntypedef void* HWND;\ntypedef void* LPVOID;\ntypedef const void* LPCVOID;\ntypedef unsigned int UINT;\ntypedef unsigned long DWORD;\ntypedef int BOOL;\ntypedef unsigned short WCHAR;\ntypedef unsigned long long uintptr_t;\n\nBOOL __stdcall OpenClipboard(HWND hWndNewOwner);\nBOOL __stdcall CloseClipboard(void);\nBOOL __stdcall IsClipboardFormatAvailable(UINT format);\nHANDLE __stdcall GetClipboardData(UINT uFormat);\n\nLPVOID __stdcall GlobalLock(HGLOBAL hMem);\nBOOL __stdcall GlobalUnlock(HGLOBAL hMem);\n\nint __stdcall WideCharToMultiByte(\n    UINT CodePage, DWORD dwFlags,\n    const WCHAR* lpWideCharStr, int cchWideChar,\n    char* lpMultiByteStr, int cbMultiByte,\n    const char* lpDefaultChar, BOOL* lpUsedDefaultChar\n);\n")

slot_0_4_0 = 13
slot_0_5_0 = 65001
slot_0_6_0 = false
slot_0_7_0 = ""
slot_0_8_0 = nil
slot_0_9_0 = 0
slot_0_10_0 = 0

function slot_0_11_0(arg_1_0, ...)
        if not arg_1_0 then
                return nil
        end

        if type(arg_1_0) == "function" then
                return arg_1_0(...)
        end

        local var_1_0 = getmetatable(arg_1_0)

        if var_1_0 and var_1_0.__call then
                return arg_1_0(...)
        end

        return nil
end

function slot_0_12_0(arg_2_0, arg_2_1)
        local var_2_0 = utils and utils.find_export or nil
        local var_2_1 = slot_0_11_0(var_2_0, arg_2_0, arg_2_1)

        if var_2_1 == nil then
                var_2_1 = slot_0_11_0(var_2_0, arg_2_0:gsub("%.dll$", ""), arg_2_1)
        end

        if var_2_1 == nil then
                var_2_1 = slot_0_11_0(var_2_0, arg_2_0:upper(), arg_2_1)
        end

        if var_2_1 == nil then
                var_2_1 = slot_0_11_0(var_2_0, arg_2_0:upper():gsub("%.DLL$", ""), arg_2_1)
        end

        return var_2_1
end

function slot_0_13_0(arg_3_0)
        if arg_3_0 == nil then
                return nil
        end

        if type(arg_3_0) == "number" then
                return slot_0_3_0.cast("uintptr_t", arg_3_0)
        end

        return slot_0_3_0.cast("uintptr_t", arg_3_0)
end

slot_0_14_0 = slot_0_3_0.cast("BOOL(__stdcall*)(HWND)", slot_0_13_0(slot_0_12_0("user32.dll", "OpenClipboard")))
slot_0_15_0 = slot_0_3_0.cast("BOOL(__stdcall*)(void)", slot_0_13_0(slot_0_12_0("user32.dll", "CloseClipboard")))
slot_0_16_0 = slot_0_3_0.cast("BOOL(__stdcall*)(UINT)", slot_0_13_0(slot_0_12_0("user32.dll", "IsClipboardFormatAvailable")))
slot_0_17_0 = slot_0_3_0.cast("HANDLE(__stdcall*)(UINT)", slot_0_13_0(slot_0_12_0("user32.dll", "GetClipboardData")))
slot_0_18_0 = slot_0_3_0.cast("LPVOID(__stdcall*)(HGLOBAL)", slot_0_13_0(slot_0_12_0("kernel32.dll", "GlobalLock")))
slot_0_19_0 = slot_0_3_0.cast("BOOL(__stdcall*)(HGLOBAL)", slot_0_13_0(slot_0_12_0("kernel32.dll", "GlobalUnlock")))
slot_0_20_0 = slot_0_3_0.cast("int(__stdcall*)(UINT,DWORD,const WCHAR*,int,char*,int,const char*,BOOL*)", slot_0_13_0(slot_0_12_0("kernel32.dll", "WideCharToMultiByte")))

function slot_0_21_0(arg_4_0)
        local var_4_0, var_4_1, var_4_2, var_4_3 = arg_4_0:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")

        if not var_4_0 then
                return false
        end

        local var_4_4, var_4_5, var_4_6, var_4_7 = tonumber(var_4_0), tonumber(var_4_1), tonumber(var_4_2), tonumber(var_4_3)

        if not var_4_4 or not var_4_5 or not var_4_6 or not var_4_7 then
                return false
        end

        return var_4_4 <= 255 and var_4_5 <= 255 and var_4_6 <= 255 and var_4_7 <= 255
end

function slot_0_22_0(arg_5_0)
        local var_5_0 = tonumber(arg_5_0)

        return var_5_0 and var_5_0 >= 1 and var_5_0 <= 65535
end

function slot_0_23_0(arg_6_0)
        if type(arg_6_0) ~= "string" then
                return nil
        end

        local var_6_0 = arg_6_0:gsub("\r", " "):gsub("\n", " "):gsub("\t", " ")
        local var_6_1 = var_6_0:match("steam://connect/([%d%.]+:%d+)") or var_6_0:match("connect%s+([%d%.]+:%d+)") or var_6_0:match("([%d%.]+:%d+)")

        if not var_6_1 then
                return nil
        end

        local var_6_2, var_6_3 = var_6_1:match("^([%d%.]+):(%d+)$")

        if not var_6_2 or not var_6_3 then
                return nil
        end

        if not slot_0_21_0(var_6_2) or not slot_0_22_0(var_6_3) then
                return nil
        end

        return var_6_2 .. ":" .. tostring(tonumber(var_6_3))
end

function slot_0_24_0()
        if not game.engine:is_connected() then
                return nil
        end

        local var_7_0 = game.engine:get_netchan()

        if not var_7_0 or var_7_0:is_null() then
                return nil
        end

        return var_7_0:get_address()
end

function slot_0_25_0()
        if not slot_0_14_0 or not slot_0_15_0 or not slot_0_16_0 or not slot_0_17_0 then
                return nil
        end

        if not slot_0_18_0 or not slot_0_19_0 or not slot_0_20_0 then
                return nil
        end

        if slot_0_14_0(nil) == 0 then
                return nil
        end

        if slot_0_16_0(slot_0_4_0) == 0 then
                slot_0_15_0()

                return nil
        end

        local var_8_0 = slot_0_17_0(slot_0_4_0)

        if var_8_0 == nil then
                slot_0_15_0()

                return nil
        end

        local var_8_1 = slot_0_18_0(var_8_0)

        if var_8_1 == nil then
                slot_0_15_0()

                return nil
        end

        local var_8_2 = slot_0_3_0.cast("const WCHAR*", var_8_1)
        local var_8_3 = 8192
        local var_8_4 = 0

        while var_8_4 < var_8_3 and var_8_2[var_8_4] ~= 0 do
                var_8_4 = var_8_4 + 1
        end

        local var_8_5 = slot_0_20_0(slot_0_5_0, 0, var_8_2, var_8_4, nil, 0, nil, nil)
        local var_8_6

        if var_8_5 and var_8_5 > 0 then
                local var_8_7 = slot_0_3_0.new("char[?]", var_8_5 + 1)

                slot_0_20_0(slot_0_5_0, 0, var_8_2, var_8_4, var_8_7, var_8_5, nil, nil)

                var_8_7[var_8_5] = 0
                var_8_6 = slot_0_3_0.string(var_8_7)
        end

        slot_0_19_0(var_8_0)
        slot_0_15_0()

        return var_8_6
end

slot_0_1_0:add_callback(function()
        slot_0_6_0 = slot_0_1_0:get_value():get()

        if slot_0_6_0 then
                slot_0_7_0 = ""
                slot_0_8_0 = nil
                slot_0_9_0 = 0
                slot_0_10_0 = 0
        else
                slot_0_8_0 = nil
        end
end)
events.present_queue:add(function()
        if not slot_0_6_0 then
                return
        end

        local var_10_0 = game.global_vars.real_time

        if var_10_0 >= slot_0_9_0 then
                slot_0_9_0 = var_10_0 + 0.08

                local var_10_1 = slot_0_25_0()

                if var_10_1 and var_10_1 ~= slot_0_7_0 then
                        slot_0_7_0 = var_10_1

                        local var_10_2 = slot_0_23_0(var_10_1)

                        if var_10_2 then
                                slot_0_8_0 = var_10_2
                                slot_0_10_0 = 0
                        end
                end
        end

        if not slot_0_8_0 then
                return
        end

        local var_10_3 = slot_0_24_0()

        if var_10_3 and var_10_3:find(slot_0_8_0, 1, true) then
                slot_0_1_0:get_value():set(false)

                slot_0_6_0 = false
                slot_0_8_0 = nil

                return
        end

        if var_10_0 >= slot_0_10_0 then
                slot_0_10_0 = var_10_0 + 0.25

                game.engine:client_cmd("connect " .. slot_0_8_0)
        end
end)
