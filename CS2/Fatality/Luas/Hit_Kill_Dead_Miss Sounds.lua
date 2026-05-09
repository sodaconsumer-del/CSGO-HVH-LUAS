--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if ffi == nil then
        return gui.notify:add(gui.notification("WARNING!", "ENABLE \"ALLOW INSECURE\" IN LUA SETTINGS AND RELOAD THE SCRIPT!", draw.textures.icon_close))
end

ffi.cdef("typedef int BOOL;\ntypedef unsigned long DWORD;\n")

function slot_0_0_0(arg_1_0)
        local var_1_0 = ffi.cast("BOOL(__stdcall*)(const char*, void*)", utils.find_export("kernel32.dll", "CreateDirectoryA"))
        local var_1_1 = ffi.cast("DWORD(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "GetFileAttributesA"))
        local var_1_2 = 16
        local var_1_3 = 4294967295
        local var_1_4 = ffi.new("const char[?]", #arg_1_0 + 1, arg_1_0)
        local var_1_5 = var_1_1(var_1_4)

        if var_1_5 == var_1_3 or bit.band(var_1_5, var_1_2) == 0 then
                var_1_0(var_1_4, nil)
        end
end

slot_0_0_0("..\\..\\csgo\\fatality\\sounds\\wav")
slot_0_0_0("..\\..\\csgo\\fatality\\sounds\\vsnd_c")

slot_0_1_0 = "..\\..\\csgo\\fatality\\sounds\\wav\\"
slot_0_2_0 = "..\\..\\csgo\\fatality\\sounds\\vsnd_c\\"

ffi.cdef("typedef unsigned long DWORD;\ntypedef int BOOL;\ntypedef void* HANDLE;\n\n#pragma pack(push, 1)\ntypedef struct {\n    DWORD dwFileAttributes;\n    unsigned long long ftCreationTime;\n    unsigned long long ftLastAccessTime;\n    unsigned long long ftLastWriteTime;\n    DWORD nFileSizeHigh;\n    DWORD nFileSizeLow;\n    DWORD dwReserved0;\n    DWORD dwReserved1;\n    char  cFileName[260];\n    char  cAlternateFileName[14];\n} WIN32_FIND_DATAA;\n#pragma pack(pop)\n\nHANDLE __stdcall FindFirstFileA(const char* lpFileName, WIN32_FIND_DATAA* lpFindFileData);\nBOOL   __stdcall FindNextFileA(HANDLE hFindFile, WIN32_FIND_DATAA* lpFindFileData);\nBOOL   __stdcall FindClose(HANDLE hFindFile);\n")

slot_0_3_0 = utils.find_export("kernel32.dll", "FindFirstFileA")
slot_0_4_0 = utils.find_export("kernel32.dll", "FindNextFileA")
slot_0_5_0 = utils.find_export("kernel32.dll", "FindClose")
slot_0_6_0 = ffi.cast("HANDLE (__stdcall *)(const char*, WIN32_FIND_DATAA*)", slot_0_3_0)
slot_0_7_0 = ffi.cast("BOOL (__stdcall *)(HANDLE, WIN32_FIND_DATAA*)", slot_0_4_0)
slot_0_8_0 = ffi.cast("BOOL (__stdcall *)(HANDLE)", slot_0_5_0)

function slot_0_9_0(arg_2_0, arg_2_1)
        local var_2_0 = {}
        local var_2_1 = ffi.new("WIN32_FIND_DATAA")
        local var_2_2 = arg_2_0 .. "\\*." .. arg_2_1
        local var_2_3 = slot_0_6_0(var_2_2, var_2_1)

        if var_2_3 ~= ffi.cast("HANDLE", -1) then
                repeat
                        local var_2_4 = ffi.string(var_2_1.cFileName, 260):match("^[^%z]+") or ""

                        if var_2_4 ~= "" and var_2_4 ~= "." and var_2_4 ~= ".." then
                                local var_2_5 = var_2_4:gsub("%." .. arg_2_1 .. "$", "")

                                table.insert(var_2_0, var_2_5)
                        end
                until slot_0_7_0(var_2_3, var_2_1) == 0

                slot_0_8_0(var_2_3)
        end

        return var_2_0
end

ffi.cdef("typedef void* HWND;\ntypedef const char* LPCSTR;\ntypedef int INT;\n\n// функция ShellExecuteA из shell32.dll\nINT __stdcall ShellExecuteA(\n    HWND hwnd,\n    LPCSTR lpOperation,\n    LPCSTR lpFile,\n    LPCSTR lpParameters,\n    LPCSTR lpDirectory,\n    INT nShowCmd\n);\n")

slot_0_10_0 = 5
slot_0_11_0 = utils.find_export("shell32.dll", "ShellExecuteA")
ShellExecuteA = ffi.cast("int(__stdcall*)(HWND, const char*, const char*, const char*, const char*, int)", slot_0_11_0)
sl_volume_wav = nil
sl_volume_vsnd_c = nil
cbx_hit_wav = nil
cbx_kill_wav = nil
cbx_dead_wav = nil
cbx_miss_wav = nil
cbx_hit_vsnd = nil
cbx_kill_vsnd = nil
cbx_dead_vsnd = nil
cbx_miss_vsnd = nil
cb_overlap_wav = nil
btn_open_folder_wav = nil
btn_open_folder_vsnd_c = nil
slot_0_12_0 = nil
slot_0_13_0 = nil
slot_0_14_0 = nil
slot_0_15_0 = nil
slot_0_16_0 = nil
slot_0_17_0 = nil
slot_0_18_0 = nil
slot_0_19_0 = nil

function slot_0_20_0(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
        local var_3_0 = gui.combo_box(gui.control_id("combobox_" .. arg_3_1 .. "_" .. arg_3_3))
        local var_3_1 = slot_0_9_0(arg_3_2, arg_3_3)

        if #var_3_1 == 0 then
                var_3_0:add(gui.selectable(gui.control_id("no_sounds_found_" .. arg_3_1 .. "_" .. arg_3_3), "No sounds found"))
        else
                var_3_0:add(gui.selectable(gui.control_id("sound_" .. arg_3_1 .. "_none_" .. arg_3_3), "None"))

                for iter_3_0, iter_3_1 in ipairs(var_3_1) do
                        var_3_0:add(gui.selectable(gui.control_id("sound_" .. arg_3_1 .. "_" .. iter_3_1 .. "_" .. arg_3_3), iter_3_1))
                end
        end

        if arg_3_3 == "wav" then
                if arg_3_1 == "hit" then
                        cbx_hit_wav, slot_0_12_0 = var_3_0, var_3_1
                end

                if arg_3_1 == "kill" then
                        cbx_kill_wav, slot_0_13_0 = var_3_0, var_3_1
                end

                if arg_3_1 == "dead" then
                        cbx_dead_wav, slot_0_14_0 = var_3_0, var_3_1
                end

                if arg_3_1 == "miss" then
                        cbx_miss_wav, slot_0_15_0 = var_3_0, var_3_1
                end
        elseif arg_3_3 == "vsnd_c" then
                if arg_3_1 == "hit" then
                        cbx_hit_vsnd, slot_0_16_0 = var_3_0, var_3_1
                end

                if arg_3_1 == "kill" then
                        cbx_kill_vsnd, slot_0_17_0 = var_3_0, var_3_1
                end

                if arg_3_1 == "dead" then
                        cbx_dead_vsnd, slot_0_18_0 = var_3_0, var_3_1
                end

                if arg_3_1 == "miss" then
                        cbx_miss_vsnd, slot_0_19_0 = var_3_0, var_3_1
                end
        end

        return gui.make_control(arg_3_0, var_3_0)
end

function slot_0_21_0(arg_4_0, arg_4_1, arg_4_2)
        local var_4_0 = gui.ctx:find(arg_4_0)

        var_4_0:reset()

        local var_4_1

        if arg_4_2 == "wav" then
                cb_overlap_wav = gui.checkbox(gui.control_id("overlap_wav"))

                local var_4_2 = gui.make_control("Allow Overlapping WAV Sounds", cb_overlap_wav)

                var_4_0:add(var_4_2)

                sl_volume_wav = gui.slider(gui.control_id("volume_" .. arg_4_2), 1, 100, {
                        "%.0f%%"
                })
                var_4_1 = sl_volume_wav
        elseif arg_4_2 == "vsnd_c" then
                sl_volume_vsnd_c = gui.slider(gui.control_id("volume_" .. arg_4_2), 1, 100, {
                        "%.0f%%"
                })
                var_4_1 = sl_volume_vsnd_c
        else
                var_4_1 = gui.slider(gui.control_id("volume_" .. arg_4_2), 1, 100, {
                        "%.0f%%"
                })
        end

        local var_4_3 = gui.make_control("Volume", var_4_1)
        local var_4_4 = slot_0_20_0("Hit Sound", "hit", arg_4_1, arg_4_2)
        local var_4_5 = slot_0_20_0("Kill Sound", "kill", arg_4_1, arg_4_2)
        local var_4_6 = slot_0_20_0("Dead Sound", "dead", arg_4_1, arg_4_2)
        local var_4_7 = slot_0_20_0("Miss Sound", "miss", arg_4_1, arg_4_2)

        var_4_0:add(var_4_3)
        var_4_0:add(var_4_4)
        var_4_0:add(var_4_5)
        var_4_0:add(var_4_6)
        var_4_0:add(var_4_7)

        local var_4_8 = gui.button(gui.control_id("open_folder_" .. arg_4_2), "Open Folder")
        local var_4_9 = gui.make_control("Open Folder", var_4_8)

        var_4_0:add(var_4_9)

        var_4_8.tooltip = "Open the folder containing your " .. arg_4_2 .. " sounds"

        var_4_8:add_callback(function()
                if not ShellExecuteA then
                        return
                end

                if arg_4_1 and #arg_4_1 > 0 then
                        local var_5_0 = ShellExecuteA(nil, "open", arg_4_1, nil, nil, slot_0_10_0)

                        if var_5_0 and tonumber(var_5_0) > 32 then
                                -- block empty
                        else
                                gui.notify:add(gui.notification("Failed to Open Folder", "Folder not found or cannot be opened", draw.textures.icon_close))
                        end
                else
                        gui.notify:add(gui.notification("Error", "Invalid folder path", draw.textures.icon_info))
                end
        end)

        if arg_4_2 == "wav" then
                btn_open_folder_wav = var_4_8
        elseif arg_4_2 == "vsnd_c" then
                btn_open_folder_vsnd_c = var_4_8
        end
end

slot_0_21_0("lua>elements a", slot_0_1_0, "wav")
slot_0_21_0("lua>elements b", slot_0_2_0, "vsnd_c")

function slot_0_22_0()
        return gui.input:is_mouse_down(gui.mouse_button["left﻿"])
end

ffi.cdef("typedef unsigned short WORD;\ntypedef unsigned int UINT;\ntypedef unsigned long DWORD;\ntypedef void* HANDLE;\ntypedef const char* LPCSTR;\ntypedef int BOOL;\ntypedef void* LPVOID;\ntypedef long LONG;\n\ntypedef struct {\n    char chunkID[4];\n    DWORD chunkSize;\n    char format[4];\n} RIFFHeader;\n\ntypedef struct {\n    char subchunk1ID[4];\n    DWORD subchunk1Size;\n    WORD audioFormat;\n    WORD numChannels;\n    DWORD sampleRate;\n    DWORD byteRate;\n    WORD blockAlign;\n    WORD bitsPerSample;\n} FmtSubchunk;\n\ntypedef struct {\n    char subchunk2ID[4];\n    DWORD subchunk2Size;\n} DataSubchunk;\n\nHANDLE __stdcall CreateFileA(\n    LPCSTR lpFileName,\n    DWORD dwDesiredAccess,\n    DWORD dwShareMode,\n    LPVOID lpSecurityAttributes,\n    DWORD dwCreationDisposition,\n    DWORD dwFlagsAndAttributes,\n    HANDLE hTemplateFile\n);\n\nBOOL __stdcall ReadFile(\n    HANDLE hFile,\n    LPVOID lpBuffer,\n    DWORD nNumberOfBytesToRead,\n    DWORD* lpNumberOfBytesRead,\n    LPVOID lpOverlapped\n);\n\nBOOL __stdcall CloseHandle(HANDLE hObject);\n\nDWORD __stdcall SetFilePointer(\n    HANDLE hFile,\n    LONG lDistanceToMove,\n    LONG* lpDistanceToMoveHigh,\n    DWORD dwMoveMethod\n);\n\ntypedef unsigned int HWAVEOUT;\ntypedef DWORD MMRESULT;\n\nMMRESULT waveOutGetVolume(HWAVEOUT hwo, DWORD* pdwVolume);\nMMRESULT waveOutSetVolume(HWAVEOUT hwo, DWORD dwVolume);\n\nint PlaySoundA(const char *pszSound, void* hmod, unsigned int fdwSound);\n")

addr_CreateFileA = utils.find_export("kernel32.dll", "CreateFileA")
addr_ReadFile = utils.find_export("kernel32.dll", "ReadFile")
addr_CloseHandle = utils.find_export("kernel32.dll", "CloseHandle")
addr_SetFilePointer = utils.find_export("kernel32.dll", "SetFilePointer")
addr_waveOutGetVolume = utils.find_export("winmm.dll", "waveOutGetVolume")
addr_waveOutSetVolume = utils.find_export("winmm.dll", "waveOutSetVolume")
addr_PlaySoundA = utils.find_export("winmm.dll", "PlaySoundA")
CreateFileA = ffi.cast("HANDLE (__stdcall *)(LPCSTR, DWORD, DWORD, LPVOID, DWORD, DWORD, HANDLE)", addr_CreateFileA)
ReadFile = ffi.cast("BOOL (__stdcall *)(HANDLE, LPVOID, DWORD, DWORD*, LPVOID)", addr_ReadFile)
CloseHandle = ffi.cast("BOOL (__stdcall *)(HANDLE)", addr_CloseHandle)
SetFilePointer = ffi.cast("DWORD (__stdcall *)(HANDLE, LONG, LONG*, DWORD)", addr_SetFilePointer)
waveOutGetVolume = ffi.cast("MMRESULT (__stdcall *)(HWAVEOUT, DWORD*)", addr_waveOutGetVolume)
waveOutSetVolume = ffi.cast("MMRESULT (__stdcall *)(HWAVEOUT, DWORD)", addr_waveOutSetVolume)
PlaySoundA = ffi.cast("int (__stdcall *)(const char*, void*, unsigned int)", addr_PlaySoundA)
GENERIC_READ = 2147483648
FILE_SHARE_READ = 1
OPEN_EXISTING = 3
INVALID_HANDLE_VALUE = ffi.cast("HANDLE", -1)
FILE_BEGIN = 0
FILE_CURRENT = 1
SND_FILENAME = 131072
SND_ASYNC = 1

function slot_0_23_0(arg_7_0, arg_7_1)
        if SetFilePointer(arg_7_0, arg_7_1, nil, FILE_CURRENT) == 4294967295 then
                return false
        end

        return true
end

function slot_0_24_0(arg_8_0)
        local var_8_0 = CreateFileA(arg_8_0, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, nil)

        if var_8_0 == nil or tonumber(ffi.cast("intptr_t", var_8_0)) == -1 then
                return nil, "Failed to open file: " .. tostring(arg_8_0)
        end

        local var_8_1 = ffi.new("DWORD[1]")
        local var_8_2 = ffi.new("RIFFHeader")

        if ReadFile(var_8_0, var_8_2, ffi.sizeof(var_8_2), var_8_1, nil) == 0 or var_8_1[0] < ffi.sizeof(var_8_2) then
                CloseHandle(var_8_0)

                return nil, "Failed to read RIFF header"
        end

        local var_8_3 = ffi.string(var_8_2.chunkID, 4)
        local var_8_4 = ffi.string(var_8_2.format, 4)

        if var_8_3 ~= "RIFF" or var_8_4 ~= "WAVE" then
                CloseHandle(var_8_0)

                return nil, "Not a valid WAV file"
        end

        local var_8_5 = ffi.new("FmtSubchunk")

        if ReadFile(var_8_0, var_8_5, ffi.sizeof(var_8_5), var_8_1, nil) == 0 or var_8_1[0] < ffi.sizeof(var_8_5) then
                CloseHandle(var_8_0)

                return nil, "Failed to read fmt chunk"
        end

        if ffi.string(var_8_5.subchunk1ID, 4) ~= "fmt " then
                CloseHandle(var_8_0)

                return nil, "Expected 'fmt ' chunk"
        end

        if var_8_5.subchunk1Size > 16 then
                local var_8_6 = tonumber(var_8_5.subchunk1Size) - 16

                if not slot_0_23_0(var_8_0, var_8_6) then
                        CloseHandle(var_8_0)

                        return nil, "Failed to skip extra fmt data"
                end
        end

        local var_8_7 = ffi.new("DataSubchunk")
        local var_8_8 = false

        while true do
                if ReadFile(var_8_0, var_8_7, ffi.sizeof(var_8_7), var_8_1, nil) == 0 or var_8_1[0] < ffi.sizeof(var_8_7) then
                        CloseHandle(var_8_0)

                        return nil, "Failed to read next chunk header"
                end

                local var_8_9 = ffi.string(var_8_7.subchunk2ID, 4)
                local var_8_10 = tonumber(var_8_7.subchunk2Size)

                if var_8_9 == "data" then
                        var_8_8 = true

                        break
                else
                        if var_8_10 <= 0 or var_8_10 > 268435456 then
                                CloseHandle(var_8_0)

                                return nil, "Invalid or corrupted chunk size"
                        end

                        if not slot_0_23_0(var_8_0, var_8_10) then
                                CloseHandle(var_8_0)

                                return nil, "Failed to skip unknown chunk"
                        end
                end
        end

        if not var_8_8 then
                CloseHandle(var_8_0)

                return nil, "No 'data' chunk found"
        end

        CloseHandle(var_8_0)

        local var_8_11 = tonumber(var_8_7.subchunk2Size)
        local var_8_12 = tonumber(var_8_5.numChannels)
        local var_8_13 = tonumber(var_8_5.sampleRate)
        local var_8_14 = tonumber(var_8_5.bitsPerSample)

        if var_8_12 <= 0 or var_8_13 <= 0 or var_8_14 <= 0 then
                return nil, "Invalid WAV parameters"
        end

        local var_8_15 = var_8_14 / 8

        return var_8_11 / (var_8_12 * var_8_13 * var_8_15)
end

function slot_0_25_0()
        local var_9_0 = ffi.new("DWORD[1]")

        if waveOutGetVolume(ffi.cast("HWAVEOUT", 0), var_9_0) == 0 then
                return var_9_0[0]
        else
                return nil
        end
end

function slot_0_26_0(arg_10_0)
        local var_10_0 = 65535
        local var_10_1 = math.floor(var_10_0 * (arg_10_0 / 100))
        local var_10_2 = bit.bor(bit.lshift(var_10_1, 16), var_10_1)

        waveOutSetVolume(ffi.cast("HWAVEOUT", 0), var_10_2)
end

play = {}
base_sound_path = "..\\..\\csgo\\fatality\\sounds\\wav\\"

function slot_0_27_0()
        if game and game.global_vars and type(game.global_vars.real_time) == "number" then
                return game.global_vars.real_time
        end
end

isSoundPlaying = false
soundEndTime = 0

slot_0_26_0(100)

function play.sound(arg_12_0)
        local var_12_0 = cb_overlap_wav and cb_overlap_wav:get_value():get()
        local var_12_1 = base_sound_path .. tostring(arg_12_0) .. ".wav"
        local var_12_2, var_12_3 = slot_0_24_0(var_12_1)

        if not var_12_2 then
                return
        end

        if not play.originalVolume then
                play.originalVolume = slot_0_25_0()
        end

        if var_12_0 and isSoundPlaying then
                PlaySoundA(nil, nil, SND_ASYNC)

                isSoundPlaying = false
                soundEndTime = 0
        elseif not var_12_0 and isSoundPlaying and game.global_vars.real_time < soundEndTime then
                return
        end

        if sl_volume_wav then
                slot_0_26_0(sl_volume_wav:get_value():get())
        end

        PlaySoundA(var_12_1, nil, bit.bor(SND_FILENAME, SND_ASYNC))

        soundEndTime = game.global_vars.real_time + var_12_2
        isSoundPlaying = true

        local var_12_4

        var_12_4 = events.present_queue:add(function()
                if game.global_vars.real_time >= soundEndTime then
                        if play.originalVolume then
                                waveOutSetVolume(ffi.cast("HWAVEOUT", 0), play.originalVolume)

                                play.originalVolume = nil
                        end

                        isSoundPlaying = false

                        events.present_queue:remove(var_12_4)
                end
        end)
end

slot_0_28_0 = nil

events.present_queue:add(function()
        local var_14_0 = sl_volume_vsnd_c:get_value():get() / 100

        if slot_0_28_0 ~= var_14_0 then
                game.engine:client_cmd("snd_toolvolume " .. var_14_0)

                slot_0_28_0 = var_14_0
        end
end)
events.event:add(function(arg_15_0)
        if arg_15_0:get_name() == "player_hurt" then
                local var_15_0 = entities.get_local_controller()

                if not var_15_0 then
                        return
                end

                if arg_15_0:get_controller("attacker") ~= var_15_0 then
                        return
                end

                local var_15_1 = arg_15_0:get_int("health") or 0
                local var_15_2
                local var_15_3

                if var_15_1 > 0 then
                        var_15_2 = cbx_hit_wav:get_value():get():get_raw()
                        var_15_3 = slot_0_12_0
                else
                        var_15_2 = cbx_kill_wav:get_value():get():get_raw()
                        var_15_3 = slot_0_13_0
                end

                local var_15_4

                for iter_15_0 = 0, 63 do
                        if bit.band(var_15_2, bit.lshift(1, iter_15_0)) ~= 0 then
                                var_15_4 = iter_15_0

                                break
                        end
                end

                if var_15_4 then
                        local var_15_5 = var_15_3[var_15_4]

                        if var_15_5 then
                                local var_15_6 = var_15_5:gsub("%.[Ww][Aa][Vv]$", "")

                                play.sound(var_15_6)
                        end
                end

                local var_15_7
                local var_15_8

                if var_15_1 > 0 then
                        var_15_7 = cbx_hit_vsnd:get_value():get():get_raw()
                        var_15_8 = slot_0_16_0
                else
                        var_15_7 = cbx_kill_vsnd:get_value():get():get_raw()
                        var_15_8 = slot_0_17_0
                end

                local var_15_9

                for iter_15_1 = 0, 63 do
                        if bit.band(var_15_7, bit.lshift(1, iter_15_1)) ~= 0 then
                                var_15_9 = iter_15_1

                                break
                        end
                end

                if var_15_9 then
                        local var_15_10 = var_15_8[var_15_9]

                        if var_15_10 then
                                local var_15_11 = var_15_10:gsub("%.[Vv][Ss][Nn][Dd]_[Cc]$", "")
                                local var_15_12 = string.format("play \\fatality\\sounds\\vsnd_c\\%s.vsnd_c", var_15_11)

                                game.engine:client_cmd(var_15_12)
                        end
                end
        end
end)
mods.events:add_listener("player_death")
events.event:add(function(arg_16_0)
        if arg_16_0:get_name() == "player_death" then
                if not entities.get_local_pawn() then
                        return
                end

                local var_16_0 = arg_16_0:get_pawn_from_id("victim")
                local var_16_1 = entities.get_local_pawn()

                if not var_16_1 then
                        return
                end

                if not var_16_1:is_alive() then
                        if arg_16_0:get_int("userid") == 0 then
                                return
                        end

                        local var_16_2 = arg_16_0:get_controller("userid")
                        local var_16_3 = var_16_2 and var_16_2:get_name() or arg_16_0:get_string("name")
                        local var_16_4 = entities.get_local_controller()

                        if var_16_3 == (var_16_4 and var_16_4:get_name() or "unknown") then
                                local var_16_5 = cbx_dead_wav:get_value():get():get_raw()
                                local var_16_6

                                for iter_16_0 = 0, 63 do
                                        if bit.band(var_16_5, bit.lshift(1, iter_16_0)) ~= 0 then
                                                var_16_6 = iter_16_0

                                                break
                                        end
                                end

                                if var_16_6 then
                                        local var_16_7 = slot_0_14_0[var_16_6]

                                        if var_16_7 then
                                                local var_16_8 = var_16_7:gsub("%.[Ww][Aa][Vv]$", "")

                                                play.sound(var_16_8)
                                        end
                                end

                                local var_16_9 = cbx_dead_vsnd:get_value():get():get_raw()
                                local var_16_10

                                for iter_16_1 = 0, 63 do
                                        if bit.band(var_16_9, bit.lshift(1, iter_16_1)) ~= 0 then
                                                var_16_10 = iter_16_1

                                                break
                                        end
                                end

                                if var_16_10 then
                                        local var_16_11 = slot_0_18_0[var_16_10]

                                        if var_16_11 then
                                                local var_16_12 = var_16_11:gsub("%.[Vv][Ss][Nn][Dd]_[Cc]$", "")
                                                local var_16_13 = string.format("play \\fatality\\sounds\\vsnd_c\\%s.vsnd_c", var_16_12)

                                                game.engine:client_cmd(var_16_13)
                                        end
                                end
                        end
                end
        end
end)

slot_0_29_0 = false
slot_0_30_0 = 0
slot_0_31_0 = 0.1

events.event:add(function(arg_17_0)
        if slot_0_22_0() then
                return
        end

        if arg_17_0:get_name() == "weapon_fire" then
                if arg_17_0:get_controller("userid") ~= entities.get_local_controller() then
                        return
                end

                slot_0_29_0 = true
                slot_0_30_0 = game.global_vars.real_time
        end
end)
events.event:add(function(arg_18_0)
        local var_18_0 = entities.get_local_pawn()

        if not var_18_0 then
                return
        end

        if arg_18_0:get_name() == "player_hurt" then
                if arg_18_0:get_controller("attacker") == entities.get_local_controller() then
                        slot_0_29_0 = false
                end
        elseif arg_18_0:get_name() == "player_death" and arg_18_0:get_pawn_from_id("attacker") == var_18_0 then
                slot_0_29_0 = false
        end
end)
events.present_queue:add(function()
        if slot_0_29_0 and game.global_vars.real_time - slot_0_30_0 > slot_0_31_0 then
                local var_19_0 = cbx_miss_wav:get_value():get():get_raw()
                local var_19_1

                for iter_19_0 = 0, 63 do
                        if bit.band(var_19_0, bit.lshift(1, iter_19_0)) ~= 0 then
                                var_19_1 = iter_19_0

                                break
                        end
                end

                if var_19_1 then
                        local var_19_2 = slot_0_15_0[var_19_1]

                        if var_19_2 then
                                local var_19_3 = var_19_2:gsub("%.[Ww][Aa][Vv]$", "")

                                play.sound(var_19_3)
                        end
                end

                local var_19_4 = cbx_miss_vsnd:get_value():get():get_raw()
                local var_19_5

                for iter_19_1 = 0, 63 do
                        if bit.band(var_19_4, bit.lshift(1, iter_19_1)) ~= 0 then
                                var_19_5 = iter_19_1

                                break
                        end
                end

                if var_19_5 then
                        local var_19_6 = slot_0_19_0[var_19_5]

                        if var_19_6 then
                                local var_19_7 = var_19_6:gsub("%.[Vv][Ss][Nn][Dd]_[Cc]$", "")
                                local var_19_8 = string.format("play \\fatality\\sounds\\vsnd_c\\%s.vsnd_c", var_19_7)

                                game.engine:client_cmd(var_19_8)
                        end
                end

                slot_0_29_0 = false
        end
end)
