--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi then
        return
end

ffi.cdef("    typedef struct { long cx; long cy; } SIZE;\n")

slot_0_0_0 = math.vec3
slot_0_1_0 = math.world_to_screen
slot_0_2_0 = math.floor
slot_0_3_0 = math.sqrt
slot_0_4_0 = bit.bor
slot_0_5_0 = bit.band
slot_0_6_0 = bit.lshift
slot_0_7_0 = bit.rshift
slot_0_8_0 = math.min
slot_0_9_0 = math.max

function slot_0_10_0(arg_1_0, arg_1_1, arg_1_2)
        return slot_0_4_0(arg_1_0, slot_0_6_0(arg_1_1, 8), slot_0_6_0(arg_1_2, 16))
end

function slot_0_11_0(arg_2_0)
        return slot_0_4_0(arg_2_0[1], slot_0_6_0(arg_2_0[2], 8), slot_0_6_0(arg_2_0[3], 16))
end

function slot_0_12_0(arg_3_0)
        local var_3_0 = slot_0_5_0(arg_3_0, 255)
        local var_3_1 = slot_0_5_0(slot_0_7_0(arg_3_0, 8), 255)
        local var_3_2 = slot_0_5_0(slot_0_7_0(arg_3_0, 16), 255)

        return var_3_0, var_3_1, var_3_2
end

function slot_0_13_0(arg_4_0)
        return arg_4_0 < 0 and 0 or arg_4_0 > 100 and 100 or arg_4_0
end

function slot_0_14_0(arg_5_0)
        if type(arg_5_0) == "number" or type(arg_5_0) == "boolean" then
                return arg_5_0
        end

        if type(arg_5_0) == "userdata" and arg_5_0.get then
                return arg_5_0:get()
        end

        return arg_5_0
end

function slot_0_15_0(arg_6_0, arg_6_1, arg_6_2)
        local var_6_0 = utils.find_export(arg_6_0, arg_6_1)

        if not var_6_0 or var_6_0 == 0 then
                return nil
        end

        return ffi.cast(arg_6_2, var_6_0)
end

slot_0_16_0 = {
        FindWindowA = slot_0_15_0("user32.dll", "FindWindowA", "void*(__stdcall*)(const char*, const char*)"),
        QueryPerformanceCounter = slot_0_15_0("kernel32.dll", "QueryPerformanceCounter", "int(__stdcall*)(int64_t*)"),
        QueryPerformanceFrequency = slot_0_15_0("kernel32.dll", "QueryPerformanceFrequency", "int(__stdcall*)(int64_t*)"),
        CreateWindowExA = slot_0_15_0("user32.dll", "CreateWindowExA", "void*(__stdcall*)(unsigned long,const char*,const char*,unsigned long,int,int,int,int,void*,void*,void*,void*)"),
        DestroyWindow = slot_0_15_0("user32.dll", "DestroyWindow", "int(__stdcall*)(void*)"),
        SetWindowDisplayAffinity = slot_0_15_0("user32.dll", "SetWindowDisplayAffinity", "int(__stdcall*)(void*, unsigned long)"),
        SetLayeredWindowAttributes = slot_0_15_0("user32.dll", "SetLayeredWindowAttributes", "int(__stdcall*)(void*, unsigned long, unsigned char, unsigned long)"),
        SetWindowPos = slot_0_15_0("user32.dll", "SetWindowPos", "int(__stdcall*)(void*, void*, int, int, int, int, unsigned int)"),
        ShowWindow = slot_0_15_0("user32.dll", "ShowWindow", "int(__stdcall*)(void*, int)"),
        GetWindowRect = slot_0_15_0("user32.dll", "GetWindowRect", "int(__stdcall*)(void*, int*)"),
        IsWindow = slot_0_15_0("user32.dll", "IsWindow", "int(__stdcall*)(void*)"),
        GetDC = slot_0_15_0("user32.dll", "GetDC", "void*(__stdcall*)(void*)"),
        ReleaseDC = slot_0_15_0("user32.dll", "ReleaseDC", "int(__stdcall*)(void*, void*)"),
        SetClassLongPtrA = slot_0_15_0("user32.dll", "SetClassLongPtrA", "uintptr_t(__stdcall*)(void*, int, intptr_t)"),
        GetSystemMetrics = slot_0_15_0("user32.dll", "GetSystemMetrics", "int(__stdcall*)(int)"),
        CreateCompatibleDC = slot_0_15_0("gdi32.dll", "CreateCompatibleDC", "void*(__stdcall*)(void*)"),
        CreateCompatibleBitmap = slot_0_15_0("gdi32.dll", "CreateCompatibleBitmap", "void*(__stdcall*)(void*, int, int)"),
        SelectObject = slot_0_15_0("gdi32.dll", "SelectObject", "void*(__stdcall*)(void*, void*)"),
        DeleteObject = slot_0_15_0("gdi32.dll", "DeleteObject", "int(__stdcall*)(void*)"),
        DeleteDC = slot_0_15_0("gdi32.dll", "DeleteDC", "int(__stdcall*)(void*)"),
        BitBlt = slot_0_15_0("gdi32.dll", "BitBlt", "int(__stdcall*)(void*, int, int, int, int, void*, int, int, unsigned long)"),
        PatBlt = slot_0_15_0("gdi32.dll", "PatBlt", "int(__stdcall*)(void*, int, int, int, int, unsigned long)"),
        CreateSolidBrush = slot_0_15_0("gdi32.dll", "CreateSolidBrush", "void*(__stdcall*)(unsigned long)"),
        SetBkMode = slot_0_15_0("gdi32.dll", "SetBkMode", "int(__stdcall*)(void*, int)"),
        SetTextColor = slot_0_15_0("gdi32.dll", "SetTextColor", "unsigned long(__stdcall*)(void*, unsigned long)"),
        TextOutA = slot_0_15_0("gdi32.dll", "TextOutA", "int(__stdcall*)(void*, int, int, const char*, int)"),
        CreateFontA = slot_0_15_0("gdi32.dll", "CreateFontA", "void*(__stdcall*)(int,int,int,int,int,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,unsigned long,const char*)"),
        FillRect = slot_0_15_0("user32.dll", "FillRect", "int(__stdcall*)(void*, int*, void*)"),
        GetTextExtentPoint32A = slot_0_15_0("gdi32.dll", "GetTextExtentPoint32A", "int(__stdcall*)(void*, const char*, int, SIZE*)")
}

if not slot_0_16_0.BitBlt or not slot_0_16_0.PatBlt or not slot_0_16_0.SetLayeredWindowAttributes then
        return
end

slot_0_17_0 = {}
slot_0_18_1 = {}

function slot_0_17_0.add(arg_7_0)
        slot_0_18_1[#slot_0_18_1 + 1] = arg_7_0
end

function slot_0_17_0.run()
        for iter_8_0 = 1, #slot_0_18_1 do
                slot_0_18_1[iter_8_0]()
        end
end

ffi.cdef("struct __unload {}")

slot_0_17_0._o = ffi.metatype("struct __unload", {
        __gc = slot_0_17_0.run
})()
slot_0_18_0 = ffi.new("int64_t[1]")
slot_0_20_0 = slot_0_16_0.QueryPerformanceFrequency and slot_0_16_0.QueryPerformanceFrequency(slot_0_18_0) ~= 0 and tonumber(slot_0_18_0[0]) or 1

function slot_0_21_0()
        local var_9_0 = ffi.new("int64_t[1]")

        if slot_0_16_0.QueryPerformanceCounter(var_9_0) ~= 0 then
                return tonumber(var_9_0[0]) / slot_0_20_0
        end

        return globals.realtime
end

function slot_0_22_0()
        for iter_10_0 = 1, 10 do
                local var_10_0 = slot_0_16_0.FindWindowA("Static", WINDOW_TITLE)

                if var_10_0 and var_10_0 ~= 0 then
                        slot_0_16_0.DestroyWindow(var_10_0)
                else
                        break
                end
        end
end

slot_0_22_0()

slot_0_23_0 = "FATALITY_RENDER"
slot_0_24_0 = 0
slot_0_25_0 = 66
slot_0_26_0 = {
        visible_only = false,
        max_dist = 0,
        teammates = false,
        bits = 0,
        enabled = true,
        flags = 0,
        fps_limit = 120,
        c_enemy = {
                255,
                255,
                255
        },
        c_team = {
                255,
                255,
                255
        },
        c_ammo = {
                80,
                140,
                200
        },
        c_white = {
                255,
                255,
                255
        },
        c_outline = {
                10,
                10,
                10
        },
        c_flag_armor = {
                255,
                240,
                150
        },
        c_flag_zoom = {
                60,
                180,
                225
        }
}
slot_0_27_0 = ray_t and ray_t() or nil
slot_0_28_0 = 1
slot_0_29_0 = 2
slot_0_30_0 = 4
slot_0_31_0 = 1
slot_0_32_0 = 2
slot_0_33_0 = 4
slot_0_34_0 = 8
slot_0_35_0 = 16
slot_0_36_0 = 32
slot_0_37_0 = {
        [weapon_id.deagle] = "DEAGLE",
        [weapon_id.elite] = "DUALIES",
        [weapon_id.fiveseven] = "5-7",
        [weapon_id.glock] = "GLOCK",
        [weapon_id.ak47] = "AK-47",
        [weapon_id.aug] = "AUG",
        [weapon_id.awp] = "AWP",
        [weapon_id.famas] = "FAMAS",
        [weapon_id.g3sg1] = "G3SG1",
        [weapon_id.galilar] = "GALIL",
        [weapon_id.m249] = "M249",
        [weapon_id.m4a1] = "M4A4",
        [weapon_id.mac10] = "MAC-10",
        [weapon_id.p90] = "P90",
        [weapon_id.mp5sd] = "MP5-SD",
        [weapon_id.ump45] = "UMP-45",
        [weapon_id.xm1014] = "XM1014",
        [weapon_id.bizon] = "BIZON",
        [weapon_id.mag7] = "MAG-7",
        [weapon_id.negev] = "NEGEV",
        [weapon_id.sawedoff] = "SAWED-OFF",
        [weapon_id.tec9] = "TEC-9",
        [weapon_id.taser] = "ZEUS",
        [weapon_id.hkp2000] = "P2000",
        [weapon_id.mp7] = "MP7",
        [weapon_id.mp9] = "MP9",
        [weapon_id.nova] = "NOVA",
        [weapon_id.p250] = "P250",
        [weapon_id.scar20] = "SCAR-20",
        [weapon_id.sg556] = "SG-553",
        [weapon_id.ssg08] = "SCOUT",
        [weapon_id.flashbang] = "FLASH",
        [weapon_id.hegrenade] = "HE",
        [weapon_id.smokegrenade] = "SMOKE",
        [weapon_id.molotov] = "MOLLY",
        [weapon_id.decoy] = "DECOY",
        [weapon_id.incgrenade] = "MOLLY",
        [weapon_id.c4] = "C4",
        [weapon_id.m4a1_silencer] = "M4A1-S",
        [weapon_id.usp_silencer] = "USP-S",
        [weapon_id.cz75a] = "CZ75",
        [weapon_id.revolver] = "R8"
}
slot_0_38_0 = {
        [weapon_id.deagle] = 7,
        [weapon_id.elite] = 30,
        [weapon_id.fiveseven] = 20,
        [weapon_id.glock] = 20,
        [weapon_id.ak47] = 30,
        [weapon_id.aug] = 30,
        [weapon_id.awp] = 5,
        [weapon_id.famas] = 25,
        [weapon_id.g3sg1] = 20,
        [weapon_id.galilar] = 35,
        [weapon_id.m249] = 100,
        [weapon_id.m4a1] = 30,
        [weapon_id.m4a1_silencer] = 20,
        [weapon_id.mac10] = 30,
        [weapon_id.p90] = 50,
        [weapon_id.mp5sd] = 30,
        [weapon_id.ump45] = 25,
        [weapon_id.xm1014] = 7,
        [weapon_id.bizon] = 64,
        [weapon_id.mag7] = 5,
        [weapon_id.negev] = 150,
        [weapon_id.sawedoff] = 7,
        [weapon_id.tec9] = 18,
        [weapon_id.taser] = 1,
        [weapon_id.hkp2000] = 13,
        [weapon_id.mp7] = 30,
        [weapon_id.mp9] = 30,
        [weapon_id.nova] = 8,
        [weapon_id.p250] = 13,
        [weapon_id.scar20] = 20,
        [weapon_id.sg556] = 30,
        [weapon_id.ssg08] = 10,
        [weapon_id.usp_silencer] = 12,
        [weapon_id.cz75a] = 12,
        [weapon_id.revolver] = 8
}
slot_0_39_0 = {
        ok = false,
        h = 1080,
        sync_tick = 0,
        frame_count = 0,
        w = 1920,
        brushes = {},
        rect = ffi.new("int[4]"),
        prev = {
                x2 = 0,
                y1 = 0,
                x1 = 0,
                valid = false,
                y2 = 0
        },
        curr = {
                x2 = 0,
                y1 = 0,
                x1 = 0,
                valid = false,
                y2 = 0
        },
        sz_buf = ffi.new("SIZE")
}

function slot_0_40_0()
        for iter_11_0, iter_11_1 in pairs(slot_0_39_0.brushes) do
                if iter_11_1 then
                        slot_0_16_0.DeleteObject(iter_11_1)
                end
        end

        slot_0_39_0.brushes = {}
end

function slot_0_41_0()
        if slot_0_39_0.hwnd and slot_0_16_0.IsWindow(slot_0_39_0.hwnd) ~= 0 then
                slot_0_16_0.ShowWindow(slot_0_39_0.hwnd, 0)

                if slot_0_39_0.target_dc then
                        slot_0_16_0.PatBlt(slot_0_39_0.target_dc, 0, 0, slot_0_39_0.w, slot_0_39_0.h, slot_0_25_0)
                end

                slot_0_16_0.DestroyWindow(slot_0_39_0.hwnd)
        end

        slot_0_40_0()

        if slot_0_39_0.font then
                slot_0_16_0.DeleteObject(slot_0_39_0.font)

                slot_0_39_0.font = nil
        end

        if slot_0_39_0.mem_dc then
                if slot_0_39_0.old_bmp then
                        slot_0_16_0.SelectObject(slot_0_39_0.mem_dc, slot_0_39_0.old_bmp)
                end

                slot_0_16_0.DeleteDC(slot_0_39_0.mem_dc)

                slot_0_39_0.mem_dc = nil
        end

        if slot_0_39_0.mem_bmp then
                slot_0_16_0.DeleteObject(slot_0_39_0.mem_bmp)

                slot_0_39_0.mem_bmp = nil
        end

        if slot_0_39_0.target_dc then
                slot_0_39_0.target_dc = nil
        end

        slot_0_39_0.hwnd = nil
        slot_0_39_0.ok = false
        slot_0_39_0.prev.valid = false
        slot_0_39_0.frame_count = 0
end

slot_0_17_0.add(function()
        slot_0_41_0()
end)

function slot_0_42_0(arg_14_0)
        if slot_0_39_0.brushes[arg_14_0] then
                return slot_0_39_0.brushes[arg_14_0]
        end

        local var_14_0, var_14_1, var_14_2 = slot_0_12_0(arg_14_0)
        local var_14_3 = slot_0_16_0.CreateSolidBrush(slot_0_10_0(var_14_0, var_14_1, var_14_2))

        slot_0_39_0.brushes[arg_14_0] = var_14_3

        return var_14_3
end

function slot_0_43_0()
        if slot_0_39_0.ok then
                return true
        end

        slot_0_22_0()
        slot_0_40_0()

        local var_15_0 = slot_0_16_0.GetSystemMetrics(0)
        local var_15_1 = slot_0_16_0.GetSystemMetrics(1)

        slot_0_39_0.w, slot_0_39_0.h = var_15_0, var_15_1
        slot_0_39_0.game_wnd = slot_0_16_0.FindWindowA("SDL_app", "Counter-Strike 2")

        local var_15_2 = slot_0_4_0(524288, 32, 8, 128, 134217728)

        slot_0_39_0.hwnd = slot_0_16_0.CreateWindowExA(var_15_2, "Static", slot_0_23_0, 2147483648, 0, 0, slot_0_39_0.w, slot_0_39_0.h, nil, nil, nil, nil)

        if not slot_0_39_0.hwnd then
                return false
        end

        if slot_0_16_0.SetClassLongPtrA then
                slot_0_16_0.SetClassLongPtrA(slot_0_39_0.hwnd, -10, 4)
        end

        if slot_0_16_0.SetWindowDisplayAffinity(slot_0_39_0.hwnd, 17) == 0 then
                slot_0_16_0.DestroyWindow(slot_0_39_0.hwnd)

                return false
        end

        slot_0_16_0.SetLayeredWindowAttributes(slot_0_39_0.hwnd, slot_0_24_0, 0, 1)

        slot_0_39_0.target_dc = slot_0_16_0.GetDC(slot_0_39_0.hwnd)
        slot_0_39_0.mem_dc = slot_0_16_0.CreateCompatibleDC(slot_0_39_0.target_dc)
        slot_0_39_0.mem_bmp = slot_0_16_0.CreateCompatibleBitmap(slot_0_39_0.target_dc, slot_0_39_0.w, slot_0_39_0.h)

        if not slot_0_39_0.mem_dc or not slot_0_39_0.mem_bmp then
                slot_0_41_0()

                return false
        end

        slot_0_39_0.old_bmp = slot_0_16_0.SelectObject(slot_0_39_0.mem_dc, slot_0_39_0.mem_bmp)

        slot_0_16_0.PatBlt(slot_0_39_0.mem_dc, 0, 0, slot_0_39_0.w, slot_0_39_0.h, slot_0_25_0)
        slot_0_16_0.BitBlt(slot_0_39_0.target_dc, 0, 0, slot_0_39_0.w, slot_0_39_0.h, slot_0_39_0.mem_dc, 0, 0, 13369376)
        slot_0_16_0.ShowWindow(slot_0_39_0.hwnd, 8)

        slot_0_39_0.font = slot_0_16_0.CreateFontA(12, 0, 0, 0, 600, 0, 0, 0, 0, 0, 0, 3, 0, "Tahoma")

        if slot_0_39_0.font then
                slot_0_16_0.SelectObject(slot_0_39_0.mem_dc, slot_0_39_0.font)
        end

        slot_0_16_0.SetBkMode(slot_0_39_0.mem_dc, 1)

        slot_0_39_0.last_rect = {
                x = 0,
                y = 0,
                w = slot_0_39_0.w,
                h = slot_0_39_0.h
        }
        slot_0_39_0.ok = true

        return true
end

slot_0_44_0 = {
        fills = {},
        texts = {}
}

function slot_0_45_0(arg_16_0, arg_16_1)
        local var_16_0 = arg_16_0[arg_16_1]

        if not var_16_0 then
                var_16_0 = {
                        n = 0,
                        a = {}
                }
                arg_16_0[arg_16_1] = var_16_0
        end

        return var_16_0
end

function slot_0_46_0(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
        local var_17_0 = slot_0_2_0(arg_17_0)
        local var_17_1 = slot_0_2_0(arg_17_1)
        local var_17_2 = slot_0_2_0(arg_17_0 + arg_17_2)
        local var_17_3 = slot_0_2_0(arg_17_1 + arg_17_3)
        local var_17_4 = slot_0_39_0.curr

        if not var_17_4.valid then
                var_17_4.x1, var_17_4.y1, var_17_4.x2, var_17_4.y2, var_17_4.valid = var_17_0, var_17_1, var_17_2, var_17_3, true
        else
                if var_17_0 < var_17_4.x1 then
                        var_17_4.x1 = var_17_0
                end

                if var_17_1 < var_17_4.y1 then
                        var_17_4.y1 = var_17_1
                end

                if var_17_2 > var_17_4.x2 then
                        var_17_4.x2 = var_17_2
                end

                if var_17_3 > var_17_4.y2 then
                        var_17_4.y2 = var_17_3
                end
        end

        local var_17_5 = slot_0_45_0(slot_0_44_0.fills, slot_0_11_0(arg_17_4))
        local var_17_6 = var_17_5.n

        var_17_5.a[var_17_6 + 1], var_17_5.a[var_17_6 + 2], var_17_5.a[var_17_6 + 3], var_17_5.a[var_17_6 + 4] = var_17_0, var_17_1, var_17_2, var_17_3
        var_17_5.n = var_17_6 + 4
end

function slot_0_47_0(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
        local var_18_0 = slot_0_2_0(arg_18_0)
        local var_18_1 = slot_0_2_0(arg_18_1)
        local var_18_2 = slot_0_2_0(arg_18_0 + arg_18_2)
        local var_18_3 = slot_0_2_0(arg_18_1 + arg_18_3)
        local var_18_4 = slot_0_39_0.curr

        if not var_18_4.valid then
                var_18_4.x1, var_18_4.y1, var_18_4.x2, var_18_4.y2, var_18_4.valid = var_18_0, var_18_1, var_18_2, var_18_3, true
        else
                if var_18_0 < var_18_4.x1 then
                        var_18_4.x1 = var_18_0
                end

                if var_18_1 < var_18_4.y1 then
                        var_18_4.y1 = var_18_1
                end

                if var_18_2 > var_18_4.x2 then
                        var_18_4.x2 = var_18_2
                end

                if var_18_3 > var_18_4.y2 then
                        var_18_4.y2 = var_18_3
                end
        end

        local var_18_5 = slot_0_45_0(slot_0_44_0.fills, slot_0_11_0(arg_18_4))
        local var_18_6 = var_18_5.n
        local var_18_7 = slot_0_2_0(arg_18_2 / 4)

        if var_18_7 < 3 then
                var_18_7 = 3
        end

        var_18_5.a[var_18_6 + 1], var_18_5.a[var_18_6 + 2], var_18_5.a[var_18_6 + 3], var_18_5.a[var_18_6 + 4] = var_18_0, var_18_1, var_18_0 + var_18_7, var_18_1 + 1
        var_18_5.a[var_18_6 + 5], var_18_5.a[var_18_6 + 6], var_18_5.a[var_18_6 + 7], var_18_5.a[var_18_6 + 8] = var_18_0, var_18_1, var_18_0 + 1, var_18_1 + var_18_7
        var_18_5.a[var_18_6 + 9], var_18_5.a[var_18_6 + 10], var_18_5.a[var_18_6 + 11], var_18_5.a[var_18_6 + 12] = var_18_2 - var_18_7, var_18_1, var_18_2, var_18_1 + 1
        var_18_5.a[var_18_6 + 13], var_18_5.a[var_18_6 + 14], var_18_5.a[var_18_6 + 15], var_18_5.a[var_18_6 + 16] = var_18_2 - 1, var_18_1, var_18_2, var_18_1 + var_18_7
        var_18_5.a[var_18_6 + 17], var_18_5.a[var_18_6 + 18], var_18_5.a[var_18_6 + 19], var_18_5.a[var_18_6 + 20] = var_18_0, var_18_3, var_18_0 + var_18_7, var_18_3 + 1
        var_18_5.a[var_18_6 + 21], var_18_5.a[var_18_6 + 22], var_18_5.a[var_18_6 + 23], var_18_5.a[var_18_6 + 24] = var_18_0, var_18_3 - var_18_7, var_18_0 + 1, var_18_3
        var_18_5.a[var_18_6 + 25], var_18_5.a[var_18_6 + 26], var_18_5.a[var_18_6 + 27], var_18_5.a[var_18_6 + 28] = var_18_2 - var_18_7, var_18_3, var_18_2, var_18_3 + 1
        var_18_5.a[var_18_6 + 29], var_18_5.a[var_18_6 + 30], var_18_5.a[var_18_6 + 31], var_18_5.a[var_18_6 + 32] = var_18_2 - 1, var_18_3 - var_18_7, var_18_2, var_18_3
        var_18_5.n = var_18_6 + 32
end

function slot_0_48_0(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
        if not arg_19_2 or #arg_19_2 == 0 then
                return
        end

        local var_19_0 = arg_19_0
        local var_19_1 = 2

        if arg_19_4 == 0 then
                var_19_0 = arg_19_0 - #arg_19_2 * 4
        end

        local var_19_2 = slot_0_2_0(var_19_0 - var_19_1)
        local var_19_3 = slot_0_2_0(arg_19_1 - var_19_1)
        local var_19_4 = slot_0_2_0(var_19_0 + #arg_19_2 * 8 + var_19_1)
        local var_19_5 = slot_0_2_0(arg_19_1 + 14 + var_19_1)
        local var_19_6 = slot_0_39_0.curr

        if not var_19_6.valid then
                var_19_6.x1, var_19_6.y1, var_19_6.x2, var_19_6.y2, var_19_6.valid = var_19_2, var_19_3, var_19_4, var_19_5, true
        else
                if var_19_2 < var_19_6.x1 then
                        var_19_6.x1 = var_19_2
                end

                if var_19_3 < var_19_6.y1 then
                        var_19_6.y1 = var_19_3
                end

                if var_19_4 > var_19_6.x2 then
                        var_19_6.x2 = var_19_4
                end

                if var_19_5 > var_19_6.y2 then
                        var_19_6.y2 = var_19_5
                end
        end

        local var_19_7 = slot_0_45_0(slot_0_44_0.texts, slot_0_11_0(arg_19_3))
        local var_19_8 = var_19_7.n

        var_19_7.a[var_19_8 + 1], var_19_7.a[var_19_8 + 2], var_19_7.a[var_19_8 + 3], var_19_7.a[var_19_8 + 4] = slot_0_2_0(arg_19_0), slot_0_2_0(arg_19_1), arg_19_2, arg_19_4
        var_19_7.n = var_19_8 + 4
end

function slot_0_49_0()
        local var_20_0 = slot_0_39_0.mem_dc
        local var_20_1 = slot_0_39_0.rect

        for iter_20_0, iter_20_1 in pairs(slot_0_44_0.fills) do
                local var_20_2 = iter_20_1.n

                if var_20_2 > 0 then
                        local var_20_3 = slot_0_42_0(iter_20_0)

                        for iter_20_2 = 1, var_20_2, 4 do
                                var_20_1[0] = iter_20_1.a[iter_20_2]
                                var_20_1[1] = iter_20_1.a[iter_20_2 + 1]
                                var_20_1[2] = iter_20_1.a[iter_20_2 + 2]
                                var_20_1[3] = iter_20_1.a[iter_20_2 + 3]

                                slot_0_16_0.FillRect(var_20_0, var_20_1, var_20_3)
                        end

                        iter_20_1.n = 0
                end
        end

        for iter_20_3, iter_20_4 in pairs(slot_0_44_0.texts) do
                local var_20_4 = iter_20_4.n

                if var_20_4 > 0 then
                        slot_0_16_0.SetTextColor(var_20_0, slot_0_10_0(10, 10, 10))

                        for iter_20_5 = 1, var_20_4, 4 do
                                local var_20_5 = iter_20_4.a[iter_20_5]
                                local var_20_6 = iter_20_4.a[iter_20_5 + 1]
                                local var_20_7 = iter_20_4.a[iter_20_5 + 2]
                                local var_20_8 = iter_20_4.a[iter_20_5 + 3]
                                local var_20_9 = var_20_5

                                if var_20_8 == 0 then
                                        slot_0_16_0.GetTextExtentPoint32A(var_20_0, var_20_7, #var_20_7, slot_0_39_0.sz_buf)

                                        var_20_9 = slot_0_2_0(var_20_5 - slot_0_39_0.sz_buf.cx * 0.5)
                                end

                                slot_0_16_0.TextOutA(var_20_0, var_20_9 + 1, var_20_6 + 1, var_20_7, #var_20_7)
                        end

                        local var_20_10, var_20_11, var_20_12 = slot_0_12_0(iter_20_3)

                        slot_0_16_0.SetTextColor(var_20_0, slot_0_10_0(var_20_10, var_20_11, var_20_12))

                        for iter_20_6 = 1, var_20_4, 4 do
                                local var_20_13 = iter_20_4.a[iter_20_6]
                                local var_20_14 = iter_20_4.a[iter_20_6 + 1]
                                local var_20_15 = iter_20_4.a[iter_20_6 + 2]
                                local var_20_16 = iter_20_4.a[iter_20_6 + 3]
                                local var_20_17 = var_20_13

                                if var_20_16 == 0 then
                                        slot_0_16_0.GetTextExtentPoint32A(var_20_0, var_20_15, #var_20_15, slot_0_39_0.sz_buf)

                                        var_20_17 = slot_0_2_0(var_20_13 - slot_0_39_0.sz_buf.cx * 0.5)
                                end

                                slot_0_16_0.TextOutA(var_20_0, var_20_17, var_20_14, var_20_15, #var_20_15)
                        end

                        iter_20_4.n = 0
                end
        end
end

slot_0_50_0 = false

function slot_0_51_0()
        if not slot_0_26_0.enabled then
                return
        end

        if slot_0_50_0 then
                return
        end

        if not slot_0_39_0.ok and not slot_0_43_0() then
                slot_0_50_0 = true

                return
        end

        slot_0_39_0.sync_tick = slot_0_39_0.sync_tick + 1
        slot_0_39_0.frame_count = slot_0_39_0.frame_count + 1

        if slot_0_39_0.sync_tick % 60 == 0 and slot_0_39_0.game_wnd then
                slot_21_0_1 = slot_0_39_0.rect

                if slot_0_16_0.GetWindowRect(slot_0_39_0.game_wnd, slot_21_0_1) ~= 0 then
                        slot_21_1_1 = slot_21_0_1[2] - slot_21_0_1[0]
                        slot_21_2_2 = slot_21_0_1[3] - slot_21_0_1[1]
                        slot_21_3_2 = slot_0_8_0(slot_21_1_1, slot_0_39_0.w)
                        slot_21_4_1 = slot_0_8_0(slot_21_2_2, slot_0_39_0.h)

                        if slot_21_1_1 > 100 and (slot_21_1_1 ~= slot_0_39_0.last_rect.w or slot_21_2_2 ~= slot_0_39_0.last_rect.h) then
                                slot_0_16_0.SetWindowPos(slot_0_39_0.hwnd, nil, slot_21_0_1[0], slot_21_0_1[1], slot_21_3_2, slot_21_4_1, 20)

                                slot_0_39_0.last_rect = {
                                        x = slot_21_0_1[0],
                                        y = slot_21_0_1[1],
                                        w = slot_21_1_1,
                                        h = slot_21_2_2
                                }
                        end
                end
        elseif slot_0_39_0.sync_tick % 120 == 0 and not slot_0_39_0.game_wnd then
                slot_0_39_0.game_wnd = slot_0_16_0.FindWindowA("SDL_app", "Counter-Strike 2")
        end

        slot_0_39_0.curr.valid = false
        slot_0_39_0.curr.x1, slot_0_39_0.curr.y1, slot_0_39_0.curr.x2, slot_0_39_0.curr.y2 = slot_0_39_0.w, slot_0_39_0.h, 0, 0
        slot_21_0_0 = entities.get_local_pawn()
        slot_21_1_0 = entities.get_local_controller()

        if slot_21_0_0 and slot_21_0_0:is_alive() then
                slot_21_2_1 = slot_21_0_0:get_eye_pos()
                slot_21_3_1 = slot_0_26_0.bits

                entities.controllers:for_each(function(arg_22_0)
                        slot_22_1_0 = arg_22_0.entity

                        if not slot_22_1_0 or slot_22_1_0 == slot_21_1_0 then
                                return
                        end

                        if not slot_0_26_0.teammates and not slot_22_1_0:is_enemy() then
                                return
                        end

                        slot_22_2_0 = slot_22_1_0.get_pawn and slot_22_1_0:get_pawn()

                        if not slot_22_2_0 or not slot_22_2_0:is_alive() then
                                return
                        end

                        slot_22_3_0 = slot_22_2_0:get_abs_origin()

                        if not slot_22_3_0 or slot_22_3_0.x == 0 and slot_22_3_0.y == 0 and slot_22_3_0.z == 0 then
                                return
                        end

                        slot_22_4_0 = slot_22_3_0.x - slot_21_2_1.x
                        slot_22_5_0 = slot_22_3_0.y - slot_21_2_1.y
                        slot_22_6_0 = slot_22_3_0.z - slot_21_2_1.z
                        slot_22_7_0 = slot_0_3_0(slot_22_4_0 * slot_22_4_0 + slot_22_5_0 * slot_22_5_0 + slot_22_6_0 * slot_22_6_0)
                        slot_22_8_0 = slot_0_2_0(slot_22_7_0 * 0.0254)

                        if slot_0_26_0.max_dist > 0 and slot_22_8_0 > slot_0_26_0.max_dist then
                                return
                        end

                        if slot_0_26_0.visible_only and slot_0_27_0 and game.physics_query_interface then
                                slot_22_9_1 = slot_0_0_0(slot_22_3_0.x, slot_22_3_0.y, slot_22_3_0.z + 68)

                                if game.physics_query_interface:trace_ray(slot_0_27_0, slot_21_2_1, slot_22_9_1).fraction < 0.98 then
                                        return
                                end
                        end

                        slot_22_9_0 = slot_0_1_0(slot_0_0_0(slot_22_3_0.x, slot_22_3_0.y, slot_22_3_0.z + 72))
                        slot_22_10_0 = slot_0_1_0(slot_22_3_0)

                        if not slot_22_9_0 or not slot_22_10_0 then
                                return
                        end

                        if slot_22_9_0.x < 20 and slot_22_9_0.y < 20 or slot_22_10_0.x < 20 and slot_22_10_0.y < 20 then
                                return
                        end

                        slot_22_11_0 = slot_22_10_0.y - slot_22_9_0.y

                        if slot_22_11_0 < 2 or slot_22_11_0 > slot_0_39_0.h then
                                return
                        end

                        slot_22_12_0 = slot_22_11_0 * 0.5
                        slot_22_13_0 = slot_22_9_0.x - slot_22_12_0 * 0.5
                        slot_22_14_0 = slot_22_9_0.y
                        slot_22_15_0 = slot_22_1_0:is_enemy() and slot_0_26_0.c_enemy or slot_0_26_0.c_team

                        if slot_0_5_0(slot_21_3_1, slot_0_31_0) ~= 0 then
                                slot_0_47_0(slot_22_13_0 - 1, slot_22_14_0 - 1, slot_22_12_0 + 2, slot_22_11_0 + 2, slot_0_26_0.c_outline)
                                slot_0_47_0(slot_22_13_0, slot_22_14_0, slot_22_12_0, slot_22_11_0, slot_22_15_0)
                        end

                        if slot_0_5_0(slot_21_3_1, slot_0_32_0) ~= 0 then
                                slot_22_16_3 = slot_0_13_0(slot_0_14_0(slot_22_2_0.m_iHealth) or 100)
                                slot_22_17_1 = slot_22_11_0 * (slot_22_16_3 * 0.01)

                                slot_0_46_0(slot_22_13_0 - 7, slot_22_14_0 - 1, 1, slot_22_11_0 + 2, slot_0_26_0.c_outline)
                                slot_0_46_0(slot_22_13_0 - 2, slot_22_14_0 - 1, 1, slot_22_11_0 + 2, slot_0_26_0.c_outline)
                                slot_0_46_0(slot_22_13_0 - 6, slot_22_14_0 - 2, 4, 1, slot_0_26_0.c_outline)
                                slot_0_46_0(slot_22_13_0 - 6, slot_22_14_0 + slot_22_11_0 + 1, 4, 1, slot_0_26_0.c_outline)

                                slot_22_18_4 = slot_0_8_0(slot_0_2_0(510 * (100 - slot_22_16_3) / 100), 255)
                                slot_22_19_6 = slot_0_8_0(slot_0_2_0(510 * slot_22_16_3 / 100), 255)

                                if slot_22_16_3 > 0 then
                                        if slot_22_17_1 < 1 then
                                                slot_22_17_1 = 1
                                        end

                                        slot_0_46_0(slot_22_13_0 - 5, slot_22_14_0 + (slot_22_11_0 - slot_22_17_1), 2, slot_22_17_1, {
                                                slot_22_18_4,
                                                slot_22_19_6,
                                                0
                                        })
                                end
                        end

                        if slot_0_5_0(slot_21_3_1, slot_0_33_0) ~= 0 then
                                slot_22_16_2 = slot_22_1_0.get_name and slot_22_1_0:get_name() or "Player"

                                slot_0_48_0(slot_22_9_0.x, slot_22_14_0 - 18, slot_22_16_2, slot_0_26_0.c_white, 0)
                        end

                        slot_22_16_1 = slot_22_14_0 + slot_22_11_0 + 2
                        slot_22_17_0 = nil

                        if slot_0_5_0(slot_21_3_1, slot_0_4_0(slot_0_34_0, slot_0_35_0)) ~= 0 then
                                slot_22_17_0 = slot_22_2_0.get_active_weapon and slot_22_2_0:get_active_weapon()

                                if not slot_22_17_0 then
                                        slot_22_18_3 = slot_22_2_0.m_pWeaponServices
                                        slot_22_19_5 = slot_22_18_3 and slot_22_18_3.m_hActiveWeapon or 0

                                        if type(slot_22_19_5) ~= "number" and slot_22_19_5 and slot_22_19_5.get then
                                                slot_22_19_5 = slot_22_19_5:get()
                                        end

                                        if slot_22_19_5 and slot_22_19_5 ~= 0 and slot_22_19_5 ~= 4294967295 then
                                                slot_22_17_0 = entities.get_by_handle(slot_22_19_5)
                                        end
                                end
                        end

                        if slot_0_5_0(slot_21_3_1, slot_0_34_0) ~= 0 and slot_22_17_0 then
                                slot_22_18_2 = slot_22_17_0.is_gun and slot_22_17_0:is_gun()

                                if not slot_22_18_2 then
                                        slot_22_19_4 = slot_22_17_0.get_type and slot_22_17_0:get_type()
                                        slot_22_18_2 = slot_22_19_4 and slot_22_19_4 >= csweapon_type.pistol and slot_22_19_4 <= csweapon_type.machinegun
                                end

                                if slot_22_18_2 then
                                        slot_22_19_3 = slot_0_14_0(slot_22_17_0.m_iClip1)

                                        if slot_22_19_3 and slot_22_19_3 >= 0 then
                                                slot_22_20_2 = nil

                                                if slot_22_17_0.get_data then
                                                        slot_22_21_2 = slot_22_17_0:get_data()

                                                        if slot_22_21_2 then
                                                                slot_22_20_2 = slot_0_14_0(slot_22_21_2.m_iMaxClip1)
                                                        end
                                                end

                                                if not slot_22_20_2 or slot_22_20_2 <= 0 then
                                                        slot_22_20_2 = slot_0_38_0[slot_22_17_0.get_id and slot_22_17_0:get_id()] or 30
                                                end

                                                slot_22_22_0 = slot_22_12_0 * slot_0_8_0(1, slot_0_9_0(0, slot_22_19_3 / slot_22_20_2))

                                                slot_0_46_0(slot_22_13_0 - 2, slot_22_16_1, slot_22_12_0 + 4, 6, slot_0_26_0.c_outline)
                                                slot_0_46_0(slot_22_13_0 - 1, slot_22_16_1 + 1, slot_22_12_0 + 2, 4, {
                                                        20,
                                                        20,
                                                        20
                                                })

                                                if slot_22_22_0 > 0 then
                                                        slot_0_46_0(slot_22_13_0, slot_22_16_1 + 2, slot_22_22_0, 2, slot_0_26_0.c_ammo)
                                                end

                                                slot_22_16_1 = slot_22_16_1 + 8
                                        end
                                end
                        end

                        if slot_0_5_0(slot_21_3_1, slot_0_35_0) ~= 0 and slot_22_17_0 then
                                slot_22_18_1 = nil
                                slot_22_19_2 = slot_22_17_0.get_id and slot_22_17_0:get_id()

                                if slot_22_19_2 then
                                        slot_22_18_1 = slot_0_37_0[slot_22_19_2]
                                end

                                if not slot_22_18_1 then
                                        slot_22_20_1 = slot_22_17_0.get_type and slot_22_17_0:get_type()
                                        slot_22_18_1 = slot_22_20_1 == csweapon_type.knife and "KNIFE" or slot_22_20_1 == csweapon_type.pistol and "PISTOL" or slot_22_20_1 == csweapon_type.submachinegun and "SMG" or slot_22_20_1 == csweapon_type.rifle and "RIFLE" or slot_22_20_1 == csweapon_type.shotgun and "SHOTGUN" or slot_22_20_1 == csweapon_type.sniper_rifle and "SNIPER" or slot_22_20_1 == csweapon_type.machinegun and "LMG" or slot_22_20_1 == csweapon_type.c4 and "C4" or slot_22_20_1 == csweapon_type.grenade and "GRENADE" or "UNKNOWN"
                                end

                                if slot_22_18_1 and slot_22_18_1 ~= "" then
                                        slot_0_48_0(slot_22_9_0.x, slot_22_16_1, slot_22_18_1, slot_0_26_0.c_white, 0)

                                        slot_22_16_1 = slot_22_16_1 + 13
                                end
                        end

                        if slot_0_5_0(slot_21_3_1, slot_0_36_0) ~= 0 then
                                slot_0_48_0(slot_22_9_0.x, slot_22_16_1, tostring(slot_22_8_0) .. " FT", slot_0_26_0.c_white, 0)

                                slot_22_16_0 = slot_22_16_1 + 13
                        end

                        slot_22_18_0 = slot_22_13_0 + slot_22_12_0 + 4
                        slot_22_19_1 = slot_22_14_0
                        slot_22_20_0 = 13

                        if bit.band(slot_0_26_0.flags, slot_0_28_0) ~= 0 then
                                slot_22_21_1 = slot_0_14_0(slot_22_2_0.m_ArmorValue)

                                if type(slot_22_21_1) == "number" and slot_22_21_1 > 0 then
                                        slot_0_48_0(slot_22_18_0, slot_22_19_1, "A", slot_0_26_0.c_flag_armor, 1)

                                        slot_22_19_1 = slot_22_19_1 + slot_22_20_0
                                end
                        end

                        if bit.band(slot_0_26_0.flags, slot_0_29_0) ~= 0 and slot_0_14_0(slot_22_2_0.m_bIsScoped) == true then
                                slot_0_48_0(slot_22_18_0, slot_22_19_1, "ZOOM", slot_0_26_0.c_flag_zoom, 1)

                                slot_22_19_1 = slot_22_19_1 + slot_22_20_0
                        end

                        if bit.band(slot_0_26_0.flags, slot_0_30_0) ~= 0 then
                                slot_22_21_0 = slot_0_14_0(slot_22_2_0.m_flFlashDuration)

                                if type(slot_22_21_0) == "number" and slot_22_21_0 > 0.5 then
                                        slot_0_48_0(slot_22_18_0, slot_22_19_1, "BLIND", slot_0_26_0.c_flag_zoom, 1)

                                        slot_22_19_0 = slot_22_19_1 + slot_22_20_0
                                end
                        end
                end)
        end

        slot_21_2_0 = slot_0_39_0.frame_count < 20
        slot_21_3_0 = slot_0_39_0.curr.valid
        slot_21_4_0 = slot_0_39_0.prev.valid

        if slot_21_3_0 or slot_21_4_0 or slot_21_2_0 then
                slot_21_5_1 = nil
                slot_21_6_1 = nil
                slot_21_7_1 = nil
                slot_21_8_1 = nil

                if slot_21_2_0 then
                        slot_21_5_1, slot_21_6_1, slot_21_7_1, slot_21_8_1 = 0, 0, slot_0_39_0.w, slot_0_39_0.h
                elseif slot_21_3_0 and slot_21_4_0 then
                        slot_21_5_1, slot_21_6_1, slot_21_7_1, slot_21_8_1 = slot_0_8_0(slot_0_39_0.curr.x1, slot_0_39_0.prev.x1), slot_0_8_0(slot_0_39_0.curr.y1, slot_0_39_0.prev.y1), slot_0_9_0(slot_0_39_0.curr.x2, slot_0_39_0.prev.x2), slot_0_9_0(slot_0_39_0.curr.y2, slot_0_39_0.prev.y2)
                elseif slot_21_3_0 then
                        slot_21_5_1, slot_21_6_1, slot_21_7_1, slot_21_8_1 = slot_0_39_0.curr.x1, slot_0_39_0.curr.y1, slot_0_39_0.curr.x2, slot_0_39_0.curr.y2
                else
                        slot_21_5_1, slot_21_6_1, slot_21_7_1, slot_21_8_1 = slot_0_39_0.prev.x1, slot_0_39_0.prev.y1, slot_0_39_0.prev.x2, slot_0_39_0.prev.y2
                end

                slot_21_5_0 = slot_0_9_0(0, slot_21_5_1 - 30)
                slot_21_6_0 = slot_0_9_0(0, slot_21_6_1 - 30)
                slot_21_7_0 = slot_0_8_0(slot_0_39_0.w, slot_21_7_1 + 30)
                slot_21_8_0 = slot_0_8_0(slot_0_39_0.h, slot_21_8_1 + 30)

                slot_0_16_0.PatBlt(slot_0_39_0.mem_dc, slot_21_5_0, slot_21_6_0, slot_21_7_0 - slot_21_5_0, slot_21_8_0 - slot_21_6_0, slot_0_25_0)
                slot_0_49_0()
                slot_0_16_0.BitBlt(slot_0_39_0.target_dc, slot_21_5_0, slot_21_6_0, slot_21_7_0 - slot_21_5_0, slot_21_8_0 - slot_21_6_0, slot_0_39_0.mem_dc, slot_21_5_0, slot_21_6_0, 13369376)

                if slot_21_3_0 then
                        slot_0_39_0.prev.x1, slot_0_39_0.prev.y1 = slot_0_39_0.curr.x1, slot_0_39_0.curr.y1
                        slot_0_39_0.prev.x2, slot_0_39_0.prev.y2 = slot_0_39_0.curr.x2, slot_0_39_0.curr.y2
                        slot_0_39_0.prev.valid = true
                else
                        slot_0_39_0.prev.valid = false
                end
        end
end

slot_0_52_0 = {}

;(function()
        slot_23_0_0 = gui.ctx:find("lua>elements a")

        if not slot_23_0_0 then
                return
        end

        slot_23_0_0:reset()

        function slot_23_1_0(arg_24_0, arg_24_1, arg_24_2)
                local var_24_0 = gui.checkbox(gui.control_id(arg_24_0))

                var_24_0:get_value():set(arg_24_2)
                slot_23_0_0:add(gui.make_control(arg_24_1, var_24_0))

                return var_24_0
        end

        slot_0_52_0.enabled = slot_23_1_0("ovl_esp_enabled", "Stream proof overlay", true)
        slot_0_52_0.filters = gui.combo_box(gui.control_id("ovl_esp_filters"))
        slot_0_52_0.filters.allow_multiple = true

        slot_0_52_0.filters:add(gui.selectable(gui.control_id("fl_esp_visible"), "Visible only"))
        slot_0_52_0.filters:add(gui.selectable(gui.control_id("fl_esp_teammates"), "Teammates"))

        slot_23_2_0 = slot_0_52_0.filters:get_value():get()

        if slot_23_2_0 and slot_23_2_0.set_raw then
                slot_23_2_0:set_raw(0)
        end

        slot_23_0_0:add(gui.make_control("Filters", slot_0_52_0.filters))

        slot_0_52_0.box = slot_23_1_0("ovl_esp_box", "BoxESP", false)
        slot_0_52_0.ammo = slot_23_1_0("ovl_esp_ammo", "Ammo bar", false)
        slot_0_52_0.name = slot_23_1_0("ovl_esp_name", "Player name", false)
        slot_0_52_0.hp = slot_23_1_0("ovl_esp_health", "Health bar", false)
        slot_0_52_0.dist = slot_23_1_0("ovl_esp_distance", "Distance", false)
        slot_0_52_0.weapon = slot_23_1_0("ovl_esp_weapon", "Weapon name", false)
        slot_0_52_0.flags = gui.combo_box(gui.control_id("ovl_esp_flags"))
        slot_0_52_0.flags.allow_multiple = true

        slot_0_52_0.flags:add(gui.selectable(gui.control_id("fl_esp_armor_v2"), "Armor"))
        slot_0_52_0.flags:add(gui.selectable(gui.control_id("fl_esp_zoom_v2"), "Scoped"))
        slot_0_52_0.flags:add(gui.selectable(gui.control_id("fl_esp_blind_v2"), "Flashed"))

        slot_23_3_0 = slot_0_52_0.flags:get_value():get()

        if slot_23_3_0 and slot_23_3_0.set_raw then
                slot_23_3_0:set_raw(0)
        end

        slot_23_0_0:add(gui.make_control("Flags", slot_0_52_0.flags))

        slot_0_52_0.fps = gui.slider(gui.control_id("ovl_esp_fps"), 0, 240, " FPS")

        slot_0_52_0.fps:get_value():set(120)
        slot_23_0_0:add(gui.make_control("Overlay FPS (0=Max)", slot_0_52_0.fps))

        slot_0_52_0.max_dist = gui.slider(gui.control_id("ovl_esp_max_dist"), 0, 100, " FT")

        slot_0_52_0.max_dist:get_value():set(0)
        slot_23_0_0:add(gui.make_control("Max distance (0=Max)", slot_0_52_0.max_dist))
end)()

slot_0_54_0 = 0

events.present_queue:add(function()
        if not slot_0_52_0.enabled then
                return
        end

        local var_25_0 = slot_0_52_0.enabled:get_value():get()

        if not var_25_0 and slot_0_39_0.ok then
                slot_0_41_0()
        end

        slot_0_26_0.enabled = var_25_0

        if not slot_0_26_0.enabled then
                return
        end

        local var_25_1 = slot_0_52_0.fps:get_value():get()

        if var_25_1 > 0 then
                local var_25_2 = slot_0_21_0()

                if var_25_2 - slot_0_54_0 < 1 / var_25_1 then
                        return
                end

                slot_0_54_0 = var_25_2
        end

        slot_0_26_0.max_dist = slot_0_52_0.max_dist and slot_0_52_0.max_dist:get_value():get() or 0

        if slot_0_52_0.filters then
                local var_25_3 = slot_0_52_0.filters:get_value():get()
                local var_25_4 = type(var_25_3) == "userdata" and var_25_3.get_raw and var_25_3:get_raw() or type(var_25_3) == "number" and var_25_3 or 0

                slot_0_26_0.visible_only = slot_0_5_0(var_25_4, 1) ~= 0
                slot_0_26_0.teammates = slot_0_5_0(var_25_4, 2) ~= 0
        end

        if slot_0_52_0.flags then
                local var_25_5 = slot_0_52_0.flags:get_value():get()
                local var_25_6 = type(var_25_5) == "userdata" and var_25_5.get_raw and var_25_5:get_raw() or type(var_25_5) == "number" and var_25_5 or 0

                slot_0_26_0.flags = var_25_6
        end

        local var_25_7 = 0

        if slot_0_52_0.box and slot_0_52_0.box:get_value():get() then
                var_25_7 = slot_0_4_0(var_25_7, slot_0_31_0)
        end

        if slot_0_52_0.hp and slot_0_52_0.hp:get_value():get() then
                var_25_7 = slot_0_4_0(var_25_7, slot_0_32_0)
        end

        if slot_0_52_0.name and slot_0_52_0.name:get_value():get() then
                var_25_7 = slot_0_4_0(var_25_7, slot_0_33_0)
        end

        if slot_0_52_0.ammo and slot_0_52_0.ammo:get_value():get() then
                var_25_7 = slot_0_4_0(var_25_7, slot_0_34_0)
        end

        if slot_0_52_0.weapon and slot_0_52_0.weapon:get_value():get() then
                var_25_7 = slot_0_4_0(var_25_7, slot_0_35_0)
        end

        if slot_0_52_0.dist and slot_0_52_0.dist:get_value():get() then
                var_25_7 = slot_0_4_0(var_25_7, slot_0_36_0)
        end

        slot_0_26_0.bits = var_25_7

        slot_0_51_0()
end)

if events.cs2_game_events then
        events.cs2_game_events:add(function(arg_26_0)
                if arg_26_0:get_name() == "map_shutdown" then
                        slot_0_41_0()
                end
        end)
end
