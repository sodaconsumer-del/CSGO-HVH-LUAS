--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function slot_0_0_0(arg_1_0)
        local var_1_0 = "Kill Announcer error: " .. tostring(arg_1_0)

        if gui and gui.notify and gui.notification then
                local var_1_1 = draw and draw.textures and draw.textures.icon_close or nil

                gui.notify:add(gui.notification("Kill Announcer", var_1_0, var_1_1))
        end

        return var_1_0
end

function slot_0_1_0()
        if ffi == nil then
                return (function(arg_3_0, arg_3_1, arg_3_2)
                        return gui.notify:add(gui.notification(arg_3_0, arg_3_1, arg_3_2))
                end)("WARNING!", "TURN ON ALLOW INSECURE IN LUA AND RELOAD SCRIPT!", draw.textures.icon_allow_insecure)
        end

        slot_2_0_0 = {}
        slot_2_1_1 = {}

        function slot_2_2_1(arg_4_0)
                if gui and gui.notify and gui.notification then
                        local var_4_0 = draw and draw.textures and draw.textures.icon_close or nil

                        gui.notify:add(gui.notification("Kill Announcer", "Unload error: " .. tostring(arg_4_0), var_4_0))
                end
        end

        function slot_2_0_0.add(arg_5_0)
                if type(arg_5_0) ~= "function" then
                        return
                end

                slot_2_1_1[#slot_2_1_1 + 1] = arg_5_0
        end

        function slot_2_0_0.run()
                for iter_6_0 = 1, #slot_2_1_1 do
                        xpcall(slot_2_1_1[iter_6_0], slot_2_2_1)
                end
        end

        xpcall(function()
                ffi.cdef("struct __unload {}")
        end, function(arg_8_0)
                return
        end)
        xpcall(function()
                slot_2_0_0._o = ffi.metatype("struct __unload", {
                        __gc = slot_2_0_0.run
                })()
        end, function(arg_10_0)
                slot_2_2_1(arg_10_0)
        end)

        slot_2_1_0 = false
        slot_2_2_0 = nil
        slot_2_3_0 = gui.ctx:find("misc>hit effects>hitsound>volume")

        if slot_2_3_0 then
                slot_2_2_0 = slot_2_3_0:get_value():get()
        end

        slot_2_4_0 = gui.combo_box(gui.control_id("ka_mode_selector"))

        slot_2_4_0:add(gui.selectable(gui.control_id("ka_mode_preloaded"), "Preloaded Sounds"))
        slot_2_4_0:add(gui.selectable(gui.control_id("ka_mode_custom"), "Custom Sounds"))

        slot_2_5_0 = gui.slider(gui.control_id("ka_volume"), 0, 100, {
                "%.0f%%"
        }, 10)
        slot_2_6_0 = gui.checkbox(gui.control_id("ka_loop_kills"))
        slot_2_7_0 = nil
        slot_2_8_0 = {}
        slot_2_9_0 = 10

        for iter_2_0 = 1, 10 do
                slot_2_8_0[iter_2_0] = gui.combo_box(gui.control_id("ka_custom_kill_" .. iter_2_0))
        end

        slot_2_10_0 = gui.combo_box(gui.control_id("ka_hit_sound"))
        slot_2_11_0 = gui.button(gui.control_id("ka_open_sounds"), "Open Folder")
        slot_2_12_0 = gui.button(gui.control_id("ka_refresh_sounds"), "Refresh")
        slot_2_13_0 = gui.button(gui.control_id("ka_add_kill_sound"), "Add")
        slot_2_14_0 = gui.button(gui.control_id("ka_remove_kill_sound"), "Remove")
        slot_2_15_0 = gui.ctx:find("lua>elements a")
        slot_2_16_0 = gui.ctx:find("lua>elements b")

        function slot_2_17_0()
                if not slot_2_15_0 then
                        return
                end

                slot_2_15_0:reset()
                slot_2_15_0:add(gui.make_control("Kill Announcer Mode", slot_2_4_0))
                slot_2_15_0:add(gui.make_control("Volume", slot_2_5_0))
                slot_2_15_0:add(gui.make_control("Loop kill sounds", slot_2_6_0))
                slot_2_15_0:add(gui.make_control("Hit Sound", slot_2_10_0))
                slot_2_15_0:add(gui.make_control("Open Sounds Folder", slot_2_11_0))
                slot_2_15_0:add(gui.make_control("Refresh Sounds", slot_2_12_0))
        end

        slot_2_18_0 = {}
        slot_2_19_0 = nil
        slot_2_20_0 = nil

        function slot_2_21_0()
                if not slot_2_16_0 then
                        return
                end

                slot_2_16_0:reset()

                slot_2_18_0 = {}
                slot_2_19_0 = gui.make_control("Add Extra Sound", slot_2_13_0)
                slot_2_20_0 = gui.make_control("Remove Extra Sound", slot_2_14_0)

                slot_2_16_0:add(slot_2_19_0)
                slot_2_16_0:add(slot_2_20_0)

                for iter_12_0 = 1, #slot_2_8_0 do
                        local var_12_0 = gui.make_control("Kill " .. iter_12_0 .. " Sound", slot_2_8_0[iter_12_0])

                        slot_2_16_0:add(var_12_0)

                        slot_2_18_0[iter_12_0] = var_12_0
                end
        end

        slot_2_17_0()
        slot_2_21_0()

        function slot_2_22_0()
                if not slot_2_16_0 then
                        return
                end

                local var_13_0 = slot_2_4_0:get_value():get():get_raw() == 2

                if slot_2_19_0 then
                        slot_2_19_0:set_visible(var_13_0)
                end

                if slot_2_20_0 then
                        slot_2_20_0:set_visible(var_13_0)
                end

                local var_13_1 = #slot_2_18_0

                for iter_13_0 = 1, var_13_1 do
                        local var_13_2 = slot_2_18_0[iter_13_0]

                        if var_13_2 then
                                var_13_2:set_visible(var_13_0 and iter_13_0 <= slot_2_9_0)
                        end
                end
        end

        slot_2_23_0 = 260
        slot_2_24_0 = nil
        slot_2_25_0 = nil
        slot_2_26_0 = nil
        slot_2_27_0 = nil
        slot_2_28_0 = nil
        slot_2_29_0 = nil
        slot_2_30_0 = nil
        slot_2_31_0 = nil
        slot_2_32_0, slot_2_33_0 = xpcall(function()
                ffi.cdef("        typedef struct {\n            uint32_t dwFileAttributes;\n            uint32_t ftCreationTimeLow;\n            uint32_t ftCreationTimeHigh;\n            uint32_t ftLastAccessTimeLow;\n            uint32_t ftLastAccessTimeHigh;\n            uint32_t ftLastWriteTimeLow;\n            uint32_t ftLastWriteTimeHigh;\n            uint32_t nFileSizeHigh;\n            uint32_t nFileSizeLow;\n            uint32_t dwReserved0;\n            uint32_t dwReserved1;\n            char cFileName[260];\n            char cAlternateFileName[14];\n        } WIN32_FIND_DATAA;\n\n        void* FindFirstFileA(const char* lpFileName, WIN32_FIND_DATAA* lpFindFileData);\n        bool FindNextFileA(void* hFindFile, WIN32_FIND_DATAA* lpFindFileData);\n        bool FindClose(void* hFindFile);\n        unsigned int GetCurrentDirectoryA(unsigned int nBufferLength, char* lpBuffer);\n        int ShellExecuteA(int hwnd, const char* lpOperation, const char* lpFile, const char* lpParameters, const char* lpDirectory, int nShowCmd);\n        bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n        bool CopyFileA(const char* lpExistingFileName, const char* lpNewFileName, bool bFailIfExists);\n    ")

                local function var_14_0(arg_15_0, arg_15_1, arg_15_2)
                        local var_15_0 = utils and utils.find_export and utils.find_export(arg_15_0, arg_15_1) or nil

                        if not var_15_0 or var_15_0 == 0 then
                                error("Missing export: " .. arg_15_0 .. "!" .. arg_15_1)
                        end

                        return ffi.cast(arg_15_2, var_15_0)
                end

                slot_2_25_0 = var_14_0("kernel32.dll", "GetCurrentDirectoryA", "unsigned int(__stdcall*)(unsigned int, char*)")
                slot_2_26_0 = var_14_0("kernel32.dll", "FindFirstFileA", "void*(__stdcall*)(const char*, WIN32_FIND_DATAA*)")
                slot_2_27_0 = var_14_0("kernel32.dll", "FindNextFileA", "bool(__stdcall*)(void*, WIN32_FIND_DATAA*)")
                slot_2_28_0 = var_14_0("kernel32.dll", "FindClose", "bool(__stdcall*)(void*)")
                slot_2_29_0 = var_14_0("shell32.dll", "ShellExecuteA", "int(__stdcall*)(int, const char*, const char*, const char*, const char*, int)")
                slot_2_30_0 = var_14_0("kernel32.dll", "CreateDirectoryA", "bool(__stdcall*)(const char*, void*)")
                slot_2_31_0 = var_14_0("kernel32.dll", "CopyFileA", "bool(__stdcall*)(const char*, const char*, bool)")
                slot_2_24_0 = ffi.new("char[?]", slot_2_23_0)
        end, function(arg_16_0)
                return arg_16_0
        end)

        if not slot_2_32_0 then
                gui.notify:add(gui.notification("Kill Announcer", "FFI init failed: " .. tostring(slot_2_33_0), draw.textures.icon_close or nil))

                return
        end

        slot_2_25_0(slot_2_23_0, slot_2_24_0)

        slot_2_34_0 = ffi.string(slot_2_24_0)
        slot_2_35_0 = slot_2_34_0:gsub("bin\\win64", "csgo\\sounds")
        slot_2_36_0 = slot_2_34_0:gsub("bin\\win64", "csgo")
        slot_2_37_0 = slot_2_35_0

        if (ws and ws.get_item_id and ws.get_item_id() or 0) ~= 0 and not slot_2_1_0 then
                slot_2_40_2 = ws and ws.get_resource_dir and ws.get_resource_dir() or nil

                if slot_2_40_2 and slot_2_40_2 ~= "" then
                        slot_2_40_1 = slot_2_40_2:gsub("/", "\\")
                        slot_2_41_1 = slot_2_36_0 .. "\\" .. slot_2_40_1
                        slot_2_42_1 = ffi.new("WIN32_FIND_DATAA")
                        slot_2_43_1 = slot_2_41_1 .. "\\*.vsnd_c"
                        slot_2_44_1 = slot_2_26_0(slot_2_43_1, slot_2_42_1)

                        if slot_2_44_1 ~= ffi.cast("void*", -1) then
                                slot_2_30_0(slot_2_35_0, nil)

                                slot_2_45_1 = 0

                                repeat
                                        slot_2_46_1 = ffi.string(slot_2_42_1.cFileName)

                                        if slot_2_46_1 ~= "." and slot_2_46_1 ~= ".." then
                                                slot_2_47_1 = slot_2_41_1 .. "\\" .. slot_2_46_1
                                                slot_2_48_1 = slot_2_35_0 .. "\\" .. slot_2_46_1

                                                if slot_2_31_0(slot_2_47_1, slot_2_48_1, false) then
                                                        slot_2_45_1 = slot_2_45_1 + 1
                                                end
                                        end
                                until not slot_2_27_0(slot_2_44_1, slot_2_42_1)

                                slot_2_28_0(slot_2_44_1)
                        end
                end
        end

        slot_2_40_0 = {}
        slot_2_41_0 = {}
        slot_2_42_0 = {}
        slot_2_43_0 = 2
        slot_2_44_0 = {
                "first_blood.vsnd_c",
                "double_kill.vsnd_c",
                "triple_kill.vsnd_c",
                "dominating.vsnd_c",
                "rampage.vsnd_c",
                "mega_kill.vsnd_c",
                "unstoppable.vsnd_c",
                "monsterkill.vsnd_c",
                "godlike.vsnd_c",
                "wicked_sick.vsnd_c"
        }
        slot_2_45_0 = {}
        slot_2_46_0 = false
        slot_2_47_0 = nil
        slot_2_48_0 = false

        function slot_2_49_0(arg_17_0)
                local var_17_0, var_17_1 = xpcall(function()
                        local var_18_0 = {}

                        for iter_18_0 in string.gmatch(arg_17_0, "[^\\]+") do
                                table.insert(var_18_0, iter_18_0)
                        end

                        local var_18_1 = ""

                        for iter_18_1, iter_18_2 in ipairs(var_18_0) do
                                if iter_18_1 == 1 then
                                        var_18_1 = iter_18_2
                                else
                                        var_18_1 = var_18_1 .. "\\" .. iter_18_2

                                        slot_2_30_0(var_18_1, nil)
                                end
                        end

                        return true
                end, function(arg_19_0)
                        return false
                end)

                return var_17_0 and var_17_1
        end

        function slot_2_50_0()
                local var_20_0, var_20_1 = xpcall(function()
                        local var_21_0 = ws and ws.test_capability and ws.test_capability("fs") or false
                        local var_21_1 = ffi.cast("void*", -1)

                        for iter_21_0 = 1, 10 do
                                local var_21_2 = slot_2_44_0[iter_21_0]
                                local var_21_3 = slot_2_37_0 .. "\\" .. var_21_2
                                local var_21_4 = false

                                if var_21_0 and fs and fs.exists then
                                        var_21_4 = fs.exists(var_21_3)
                                else
                                        local var_21_5 = ffi.new("WIN32_FIND_DATAA")
                                        local var_21_6 = slot_2_26_0(var_21_3, var_21_5)

                                        if var_21_6 ~= var_21_1 then
                                                var_21_4 = true

                                                slot_2_28_0(var_21_6)
                                        end
                                end

                                if not var_21_4 then
                                        slot_2_47_0 = "Missing sound file: " .. var_21_2

                                        return false
                                end
                        end

                        return true
                end, function(arg_22_0)
                        slot_2_47_0 = "Validation error: " .. tostring(arg_22_0)

                        return false
                end)

                slot_2_46_0 = var_20_0 and var_20_1

                return slot_2_46_0
        end

        function slot_2_51_0(arg_23_0, arg_23_1)
                if not arg_23_0 then
                        return
                end

                arg_23_0:add(gui.selectable(gui.control_id("ka_none_dyn_" .. arg_23_1), "None"))

                for iter_23_0 = 1, #slot_2_41_0 do
                        local var_23_0 = slot_2_41_0[iter_23_0]

                        arg_23_0:add(gui.selectable(gui.control_id("ka_dyn_" .. arg_23_1 .. "_" .. var_23_0), var_23_0))
                end
        end

        function slot_2_52_0(arg_24_0, arg_24_1)
                if not arg_24_0 or not arg_24_1 then
                        return
                end

                local var_24_0 = slot_2_42_0[arg_24_1]

                if not var_24_0 then
                        return
                end

                local var_24_1 = arg_24_0:get_value():get()

                var_24_1:set_raw(var_24_0)
                arg_24_0:get_value():set(var_24_1)
        end

        function slot_2_53_0(arg_25_0)
                if not slot_2_16_0 then
                        return
                end

                local var_25_0 = math.max(10, math.floor(arg_25_0 or 10))

                while var_25_0 > #slot_2_8_0 do
                        local var_25_1 = #slot_2_8_0 + 1
                        local var_25_2 = gui.combo_box(gui.control_id("ka_custom_kill_" .. var_25_1))

                        slot_2_8_0[var_25_1] = var_25_2

                        slot_2_51_0(var_25_2, var_25_1)
                        slot_2_7_0(var_25_2)
                end

                slot_2_21_0()
        end

        function slot_2_7_0(arg_26_0)
                return
        end

        for iter_2_1 = 1, #slot_2_8_0 do
                slot_2_7_0(slot_2_8_0[iter_2_1])
        end

        function slot_2_54_0(arg_27_0)
                gui.notify:add(gui.notification("Kill Announcer", "Refresh failed: " .. tostring(arg_27_0), draw.textures.icon_close or nil))
        end

        function slot_2_55_0(arg_28_0)
                local var_28_0 = {}
                local var_28_1 = ffi.cast("void*", -1)
                local var_28_2 = ffi.new("WIN32_FIND_DATAA")
                local var_28_3 = slot_2_26_0(arg_28_0 .. "\\*", var_28_2)

                if var_28_3 == var_28_1 then
                        return var_28_0
                end

                repeat
                        local var_28_4 = ffi.string(var_28_2.cFileName)

                        if var_28_4 ~= "." and var_28_4 ~= ".." and string.find(var_28_4, ".vsnd_c") then
                                var_28_0[#var_28_0 + 1] = var_28_4
                        end
                until not slot_2_27_0(var_28_3, var_28_2)

                slot_2_28_0(var_28_3)

                return var_28_0
        end

        function slot_2_56_0(arg_29_0)
                local var_29_0, var_29_1 = xpcall(function()
                        slot_2_40_0 = {}
                        slot_2_41_0 = {}
                        slot_2_42_0 = {}
                        slot_2_43_0 = 2

                        local var_30_0 = ffi.cast("void*", -1)
                        local var_30_1 = ffi.new("WIN32_FIND_DATAA")
                        local var_30_2 = slot_2_26_0(arg_29_0 .. "\\*", var_30_1)

                        if var_30_2 == var_30_0 then
                                return
                        end

                        local var_30_3 = 1
                        local var_30_4 = 4294967296

                        for iter_30_0 = 1, #slot_2_8_0 do
                                slot_2_8_0[iter_30_0]:add(gui.selectable(gui.control_id("ka_none_" .. iter_30_0), "None"))
                        end

                        slot_2_10_0:add(gui.selectable(gui.control_id("ka_hit_none"), "None"))

                        slot_2_40_0[var_30_3] = "None"
                        slot_2_42_0.None = var_30_3

                        repeat
                                local var_30_5 = ffi.string(var_30_1.cFileName)

                                if var_30_3 <= var_30_4 and var_30_5 ~= "." and var_30_5 ~= ".." and string.find(var_30_5, ".vsnd_c") then
                                        slot_2_41_0[#slot_2_41_0 + 1] = var_30_5

                                        for iter_30_1 = 1, #slot_2_8_0 do
                                                slot_2_8_0[iter_30_1]:add(gui.selectable(gui.control_id("ka_k" .. iter_30_1 .. "_" .. var_30_5), var_30_5))
                                        end

                                        slot_2_10_0:add(gui.selectable(gui.control_id("ka_hit_" .. var_30_5), var_30_5))

                                        if var_30_3 > var_30_4 / 2 then
                                                break
                                        end

                                        var_30_3 = var_30_3 * 2
                                        slot_2_40_0[var_30_3] = var_30_5
                                        slot_2_42_0[var_30_5] = var_30_3
                                end
                        until not slot_2_27_0(var_30_2, var_30_1)

                        slot_2_28_0(var_30_2)

                        slot_2_43_0 = var_30_3
                end, function(arg_31_0)
                        return tostring(arg_31_0)
                end)
        end

        function slot_2_57_0()
                xpcall(function()
                        if not slot_2_42_0.None then
                                slot_2_56_0(slot_2_35_0)
                                slot_2_22_0()
                                gui.notify:add(gui.notification("Kill Announcer", "Sounds refreshed.", draw.textures.icon_info or nil))

                                return
                        end

                        local var_33_0 = slot_2_55_0(slot_2_35_0)
                        local var_33_1 = 0

                        for iter_33_0, iter_33_1 in ipairs(var_33_0) do
                                if not slot_2_42_0[iter_33_1] then
                                        var_33_1 = var_33_1 + 1
                                        slot_2_41_0[#slot_2_41_0 + 1] = iter_33_1

                                        local var_33_2 = slot_2_43_0

                                        slot_2_43_0 = slot_2_43_0 * 2
                                        slot_2_40_0[var_33_2] = iter_33_1
                                        slot_2_42_0[iter_33_1] = var_33_2

                                        for iter_33_2 = 1, #slot_2_8_0 do
                                                local var_33_3 = slot_2_8_0[iter_33_2]

                                                if var_33_3 then
                                                        var_33_3:add(gui.selectable(gui.control_id("ka_k_dyn_" .. iter_33_2 .. "_" .. iter_33_1), iter_33_1))
                                                end
                                        end

                                        slot_2_10_0:add(gui.selectable(gui.control_id("ka_hit_dyn_" .. iter_33_1), iter_33_1))
                                end
                        end

                        slot_2_22_0()

                        if var_33_1 > 0 then
                                gui.notify:add(gui.notification("Kill Announcer", "Sounds refreshed: " .. tostring(var_33_1) .. " new file(s).", draw.textures.icon_info or nil))
                        else
                                gui.notify:add(gui.notification("Kill Announcer", "Sounds refreshed: no new files found.", draw.textures.icon_info or nil))
                        end
                end, function(arg_34_0)
                        slot_2_54_0(arg_34_0)
                end)
        end

        function slot_2_58_0(arg_35_0, arg_35_1)
                if not arg_35_0 or arg_35_0 == "None" then
                        return false
                end

                local var_35_0, var_35_1 = xpcall(function()
                        local var_36_0 = slot_2_5_0:get_value():get() / 100

                        game.engine:client_cmd("snd_toolvolume " .. var_36_0, true)

                        local var_36_1

                        if arg_35_1 then
                                var_36_1 = "sounds/" .. arg_35_0
                        else
                                var_36_1 = "sounds/" .. arg_35_0
                        end

                        game.engine:client_cmd("play " .. var_36_1)

                        return true
                end, function(arg_37_0)
                        return false
                end)

                return var_35_0 and var_35_1
        end

        function slot_2_59_0(arg_38_0)
                if arg_38_0 < 1 then
                        return nil
                end

                local var_38_0 = slot_2_4_0:get_value():get():get_raw()
                local var_38_1 = var_38_0 == 1 and #slot_2_44_0 or slot_2_9_0

                if var_38_1 < arg_38_0 then
                        if slot_2_6_0:get_value():get() then
                                arg_38_0 = var_38_1
                        else
                                return nil
                        end
                end

                if var_38_0 == 1 then
                        if not slot_2_46_0 then
                                return nil
                        end

                        return slot_2_44_0[arg_38_0]
                end

                local var_38_2 = slot_2_8_0[arg_38_0]

                if var_38_2 then
                        local var_38_3 = var_38_2:get_value():get():get_raw()

                        return slot_2_40_0[var_38_3]
                end

                return nil
        end

        function slot_2_60_0()
                local var_39_0 = slot_2_10_0:get_value():get():get_raw()

                return slot_2_40_0[var_39_0]
        end

        slot_2_61_0 = 0
        slot_2_62_0 = 0

        function slot_2_63_0()
                slot_2_61_0 = 0
        end

        function slot_2_64_0()
                slot_2_61_0 = slot_2_61_0 + 1

                local var_41_0, var_41_1 = xpcall(function()
                        local var_42_0 = slot_2_4_0:get_value():get():get_raw() == 1
                        local var_42_1 = slot_2_59_0(slot_2_61_0)

                        if var_42_1 then
                                slot_2_58_0(var_42_1, var_42_0)
                        end
                end, function(arg_43_0)
                        return tostring(arg_43_0)
                end)
        end

        function slot_2_65_0()
                local var_44_0, var_44_1 = xpcall(function()
                        local var_45_0 = slot_2_60_0()

                        if var_45_0 and var_45_0 ~= "None" then
                                slot_2_58_0(var_45_0, false)
                        end
                end, function(arg_46_0)
                        return tostring(arg_46_0)
                end)
        end

        function slot_2_66_0(arg_47_0)
                local var_47_0, var_47_1 = xpcall(function()
                        local var_48_0 = arg_47_0:get_name()

                        if var_48_0 == "round_start" then
                                slot_2_63_0()

                                slot_2_62_0 = game.global_vars.cur_time
                        elseif var_48_0 == "player_death" then
                                local var_48_1 = arg_47_0:get_pawn_from_id("userid")
                                local var_48_2 = entities.get_local_pawn()

                                if var_48_1 and var_48_2 and var_48_1 == var_48_2 then
                                        slot_2_63_0()
                                end
                        elseif var_48_0 == "player_spawn" then
                                local var_48_3 = arg_47_0:get_pawn_from_id("userid")
                                local var_48_4 = entities.get_local_pawn()

                                if var_48_3 and var_48_4 and var_48_3 == var_48_4 then
                                        slot_2_63_0()
                                end
                        elseif var_48_0 == "player_hurt" then
                                local var_48_5 = arg_47_0:get_pawn_from_id("attacker")
                                local var_48_6 = entities.get_local_pawn()

                                if var_48_5 and var_48_6 and var_48_5 == var_48_6 then
                                        if arg_47_0:get_int("health") <= 0 then
                                                slot_2_64_0()
                                        else
                                                slot_2_65_0()
                                        end
                                end
                        end
                end, function(arg_49_0)
                        return tostring(arg_49_0)
                end)
        end

        slot_2_13_0:add_callback(function()
                xpcall(function()
                        if not slot_2_16_0 then
                                return
                        end

                        local var_51_0 = slot_2_9_0 + 1
                        local var_51_1 = slot_2_8_0[var_51_0]
                        local var_51_2 = slot_2_18_0[var_51_0]

                        if not var_51_1 then
                                var_51_1 = gui.combo_box(gui.control_id("ka_custom_kill_" .. var_51_0))
                                slot_2_8_0[var_51_0] = var_51_1

                                slot_2_51_0(var_51_1, var_51_0)
                                slot_2_7_0(var_51_1)
                        end

                        if not var_51_2 then
                                local var_51_3 = gui.make_control("Kill " .. var_51_0 .. " Sound", var_51_1)

                                slot_2_18_0[var_51_0] = var_51_3

                                slot_2_16_0:add(var_51_3)
                        end

                        slot_2_9_0 = var_51_0

                        slot_2_22_0()
                end, function(arg_52_0)
                        return tostring(arg_52_0)
                end)
        end)
        slot_2_14_0:add_callback(function()
                xpcall(function()
                        if slot_2_9_0 <= 10 then
                                return
                        end

                        local var_54_0 = slot_2_9_0
                        local var_54_1 = slot_2_18_0[var_54_0]

                        if var_54_1 and var_54_1.set_visible then
                                var_54_1:set_visible(false)
                        end

                        slot_2_9_0 = slot_2_9_0 - 1

                        slot_2_22_0()
                end, function(arg_55_0)
                        return tostring(arg_55_0)
                end)
        end)
        slot_2_11_0:add_callback(function()
                xpcall(function()
                        slot_2_29_0(0, "open", slot_2_35_0, nil, nil, 1)
                end, function(arg_58_0)
                        return tostring(arg_58_0)
                end)
        end)
        slot_2_12_0:add_callback(function()
                slot_2_48_0 = true
        end)
        slot_2_5_0:add_callback(function()
                local var_60_0 = slot_2_5_0:get_value():get() / 100

                game.engine:client_cmd("snd_toolvolume " .. var_60_0, true)
        end)
        slot_2_4_0:add_callback(function()
                slot_2_22_0()

                if slot_2_4_0:get_value():get():get_raw() == 1 and not slot_2_46_0 then
                        gui.notify:add(gui.notification("Kill Announcer", "Preloaded mode disabled: " .. (slot_2_47_0 or "Missing sound files"), draw.textures.icon_close or nil))
                end
        end)
        ;(function()
                local var_62_0, var_62_1 = xpcall(function()
                        if not slot_2_1_0 then
                                slot_2_49_0(slot_2_37_0)
                        end

                        local var_63_0 = gui.ctx:find("misc>hit effects>hitsound>volume")

                        if var_63_0 then
                                var_63_0:get_value():set(0)
                        end

                        slot_2_5_0:get_value():set(100)
                        game.engine:client_cmd("snd_toolvolume 1", true)

                        if not slot_2_1_0 then
                                slot_2_50_0()
                        else
                                slot_2_46_0 = true
                        end

                        if not slot_2_46_0 then
                                gui.notify:add(gui.notification("Kill Announcer", "No preloaded sounds found. Use custom mode.", draw.textures.icon_info or nil))
                        end

                        if not slot_2_1_0 then
                                slot_2_56_0(slot_2_35_0)
                        end

                        slot_2_22_0()

                        if slot_2_1_0 then
                                gui.notify:add(gui.notification("Kill Announcer", "Safe init enabled: click Refresh Sounds to scan files.", draw.textures.icon_info or nil))
                        end

                        if mods and mods.events and mods.events.add_listener then
                                mods.events:add_listener("player_hurt")
                                mods.events:add_listener("round_start")
                                mods.events:add_listener("player_death")
                                mods.events:add_listener("player_spawn")
                        end

                        if events and events.event and events.event.add then
                                events.event:add(slot_2_66_0)
                        end
                end, function(arg_64_0)
                        return tostring(arg_64_0)
                end)

                if not var_62_0 then
                        gui.notify:add(gui.notification("Kill Announcer", "Initialization failed - check console", draw.textures.icon_close or nil))
                end
        end)()

        if events and events.present_queue and events.present_queue.add then
                events.present_queue:add(function()
                        if slot_2_48_0 then
                                slot_2_48_0 = false

                                xpcall(function()
                                        slot_2_57_0()
                                end, function(arg_67_0)
                                        return tostring(arg_67_0)
                                end)
                        end
                end)
        end

        function slot_2_68_0()
                if slot_2_2_0 ~= nil and slot_2_2_0 > 0 then
                        local var_68_0 = gui.ctx:find("misc>hit effects>hitsound>volume")

                        if var_68_0 then
                                var_68_0:get_value():set(slot_2_2_0)
                        end
                end
        end

        slot_2_0_0.add(slot_2_68_0)

        slot_2_69_0 = events.unload or events.shutdown

        if slot_2_69_0 and slot_2_69_0.add then
                slot_2_69_0:add(function()
                        xpcall(slot_2_68_0, function(arg_70_0)
                                return tostring(arg_70_0)
                        end)
                end)
        end
end

xpcall(slot_0_1_0, slot_0_0_0)
