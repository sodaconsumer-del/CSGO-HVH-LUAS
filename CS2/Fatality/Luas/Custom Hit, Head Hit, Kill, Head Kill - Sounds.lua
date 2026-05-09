--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

function slot_0_0_0(arg_1_0, arg_1_1, arg_1_2)
        return gui.notify:add(gui.notification(arg_1_0, arg_1_1, arg_1_2))
end

if ffi == nil then
        return slot_0_0_0("WARNING!", "TURN ON ALLOW INSECURE IN LUA AND RELOAD SCRIPT!", draw.textures.icon_allow_insecure)
end

slot_0_1_0 = gui.combo_box(gui.control_id("hitsound_box"))
slot_0_2_0 = gui.make_control("Hit Sounds", slot_0_1_0)
slot_0_3_0 = gui.combo_box(gui.control_id("killsound_box"))
slot_0_4_0 = gui.make_control("Kill Sounds", slot_0_3_0)
slot_0_5_0 = gui.combo_box(gui.control_id("hithssound_box"))
slot_0_6_0 = gui.make_control("Head Hit Sounds", slot_0_5_0)
slot_0_7_0 = gui.combo_box(gui.control_id("killhssound_box"))
slot_0_8_0 = gui.make_control("Head Kill Sounds", slot_0_7_0)
slot_0_9_0 = gui.button(gui.control_id("open_sounds_path"), "Open!")
slot_0_10_0 = gui.make_control("Open Sounds Folder", slot_0_9_0)
slot_0_11_0 = gui.button(gui.control_id("refresh_sounds"), "Refresh")
slot_0_12_0 = gui.make_control("Refresh Sounds", slot_0_11_0)
slot_0_13_0 = gui.slider(gui.control_id("sound_volume"), 0, 100, {
        "%.00f%%"
}, 0.1)
slot_0_14_0 = gui.make_control("Sounds Volume", slot_0_13_0)
slot_0_15_0 = gui.ctx:find("lua>elements a")

slot_0_15_0:reset()

function slot_0_16_0()
        slot_0_15_0:add(slot_0_2_0)
        slot_0_15_0:add(slot_0_4_0)
        slot_0_15_0:add(slot_0_6_0)
        slot_0_15_0:add(slot_0_8_0)
        slot_0_15_0:add(slot_0_14_0)
        slot_0_15_0:add(slot_0_10_0)
        slot_0_15_0:add(slot_0_12_0)
end

slot_0_17_0 = {}
slot_0_18_0 = 260
slot_0_19_0 = ffi.new("char[?]", slot_0_18_0)
slot_0_20_0 = "https://raw.githubusercontent.com/de0ver/Fatality-CS2-LUA/refs/heads/main/sounds/other_sounds/roblox.vsnd_c"

ffi.cdef("    typedef struct {\n        uint32_t dwFileAttributes;\n        uint32_t ftCreationTimeLow;\n        uint32_t ftCreationTimeHigh;\n        uint32_t ftLastAccessTimeLow;\n        uint32_t ftLastAccessTimeHigh;\n        uint32_t ftLastWriteTimeLow;\n        uint32_t ftLastWriteTimeHigh;\n        uint32_t nFileSizeHigh;\n        uint32_t nFileSizeLow;\n        uint32_t dwReserved0;\n        uint32_t dwReserved1;\n        char cFileName[260];\n        char cAlternateFileName[14];\n    } WIN32_FIND_DATAA;\n    \n    void* FindFirstFileA(const char* lpFileName, WIN32_FIND_DATAA* lpFindFileData);\n    bool FindNextFileA(void* hFindFile, WIN32_FIND_DATAA* lpFindFileData);\n    bool FindClose(void* hFindFile);\n    unsigned int GetCurrentDirectoryA(unsigned int nBufferLength, char* lpBuffer);\n    int ShellExecuteA(int hwnd, const char* lpOperation, const char* lpFile, const char* lpParameters, const char* lpDirectory, int nShowCmd);\n    int URLDownloadToFileA(const char* pCaller, const char* szURL, const char* szFileName, unsigned int dwReserved, int lpfnCB);\n    unsigned int GetFileAttributesA(const char* lpFileName);\n")

slot_0_21_0 = ffi.cast("unsigned int(__stdcall*)(unsigned int, char*)", utils.find_export("kernel32.dll", "GetCurrentDirectoryA"))
slot_0_22_0 = ffi.cast("void*(__stdcall*)(const char*, WIN32_FIND_DATAA*)", utils.find_export("kernel32.dll", "FindFirstFileA"))
slot_0_23_0 = ffi.cast("bool(__stdcall*)(void*, WIN32_FIND_DATAA*)", utils.find_export("kernel32.dll", "FindNextFileA"))
slot_0_24_0 = ffi.cast("bool(__stdcall*)(void*)", utils.find_export("kernel32.dll", "FindClose"))
slot_0_25_0 = ffi.cast("int(__stdcall*)(int, const char*, const char*, const char*, const char*, int)", utils.find_export("shell32.dll", "ShellExecuteA"))
slot_0_26_0 = ffi.cast("int(__stdcall*)(const char*, const char*, const char*, unsigned int, int)", utils.find_export("urlmon.dll", "URLDownloadToFileA"))
slot_0_27_0 = ffi.cast("unsigned int(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "GetFileAttributesA"))

slot_0_21_0(slot_0_18_0, slot_0_19_0)

slot_0_29_0 = ffi.string(slot_0_19_0):gsub("bin\\win64", "csgo\\sounds")

function slot_0_30_0(arg_3_0)
        slot_0_1_0:add(gui.selectable(gui.control_id("hit" .. arg_3_0), arg_3_0))
        slot_0_3_0:add(gui.selectable(gui.control_id("kill" .. arg_3_0), arg_3_0))
        slot_0_5_0:add(gui.selectable(gui.control_id("hiths" .. arg_3_0), arg_3_0))
        slot_0_7_0:add(gui.selectable(gui.control_id("killhs" .. arg_3_0), arg_3_0))
end

function slot_0_31_0(arg_4_0)
        local var_4_0 = ffi.new("WIN32_FIND_DATAA")
        local var_4_1 = slot_0_22_0(arg_4_0 .. "\\*", var_4_0)

        if var_4_1 == -1 then
                return slot_0_0_0("Fail!", "Invalid File Handle.", draw.textures.icon_close)
        end

        local var_4_2 = 1
        local var_4_3 = 4294967296

        slot_0_30_0("None")

        slot_0_17_0[var_4_2] = "None"

        repeat
                local var_4_4 = ffi.string(var_4_0.cFileName)

                if var_4_2 <= var_4_3 and var_4_4 ~= "." and var_4_4 ~= ".." and string.find(var_4_4, ".vsnd_c") then
                        slot_0_30_0(var_4_4)

                        var_4_2 = var_4_2 * 2
                        slot_0_17_0[var_4_2] = var_4_4
                end
        until not slot_0_23_0(var_4_1, var_4_0)

        slot_0_24_0(var_4_1)
end

function slot_0_32_0()
        return slot_0_0_0("WIP", "The current API does not allow to create this. Reload script to refresh...", draw.textures.icon_scripts)
end

function slot_0_33_0()
        slot_0_16_0()
        slot_0_13_0:add_callback(function()
                return game.engine:client_cmd("snd_toolvolume " .. slot_0_13_0:get_value():get() / 100, true)
        end)
        slot_0_9_0:add_callback(function()
                return slot_0_25_0(0, "open", ffi.string(slot_0_29_0), nil, nil, 1)
        end)
        slot_0_11_0:add_callback(function()
                return slot_0_32_0()
        end)
        slot_0_31_0(slot_0_29_0)
end

function slot_0_34_0(arg_10_0)
        return game.engine:client_cmd("play \\sounds\\" .. arg_10_0)
end

function slot_0_35_0(arg_11_0, arg_11_1, arg_11_2)
        if arg_11_1 and arg_11_0:get_int("hitgroup") == 1 then
                return slot_0_34_0(slot_0_17_0[slot_0_5_0:get_value():get():get_raw()])
        elseif arg_11_2 then
                return slot_0_34_0(slot_0_17_0[slot_0_1_0:get_value():get():get_raw()])
        end
end

function slot_0_36_0(arg_12_0, arg_12_1, arg_12_2)
        if arg_12_1 and arg_12_0:get_int("hitgroup") == 1 then
                return slot_0_34_0(slot_0_17_0[slot_0_7_0:get_value():get():get_raw()])
        elseif arg_12_2 then
                return slot_0_34_0(slot_0_17_0[slot_0_3_0:get_value():get():get_raw()])
        end
end

events.event:add(function(arg_13_0)
        local var_13_0 = slot_0_1_0:get_value():get():get_raw() > 1
        local var_13_1 = slot_0_5_0:get_value():get():get_raw() > 1
        local var_13_2 = slot_0_3_0:get_value():get():get_raw() > 1
        local var_13_3 = slot_0_7_0:get_value():get():get_raw() > 1

        if var_13_0 or var_13_1 or var_13_2 or var_13_3 then
                if arg_13_0:get_name() == "player_hurt" then
                        if arg_13_0:get_controller("attacker") == entities.get_local_controller() then
                                if not var_13_2 and not var_13_3 then
                                        return slot_0_35_0(arg_13_0, var_13_1, var_13_0)
                                elseif arg_13_0:get_int("health") > 0 then
                                        return slot_0_35_0(arg_13_0, var_13_1, var_13_0)
                                elseif arg_13_0:get_int("health") <= 0 then
                                        return slot_0_36_0(arg_13_0, var_13_3, var_13_2)
                                end
                        end
                else
                        return
                end
        end
end)
slot_0_33_0()
