--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = true
slot_0_1_0 = {
        SCRIPT_NAME = "AA Builder Trial",
        UPDATE_URL = "https://api.github.com/repos/Hvygd/AAlecense/contents/trial_data.json",
        DEBUG = false,
        SAVE_INTERVAL = 30,
        DISCORD_URL = "https://discord.gg/8jQVnmnwwE",
        DATA_URL = "https://api.github.com/repos/Hvygd/AAlecense/contents/trial_data.json",
        MAX_SECONDS = 3600,
        GITHUB_TOKEN = "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",
        UPDATE_INTERVAL = 1
}

if slot_0_0_0 and not ffi then
        if gui and gui.notify then
                gui.notify:add(gui.notification(slot_0_1_0.SCRIPT_NAME, "ERROR: FFI is not enabled!"))
        end

        return
end

slot_0_2_0 = (function()
        local var_1_0 = ffi.cast("uint64_t(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "GetModuleHandleA"))
        local var_1_1 = ffi.cast("uint64_t(__stdcall*)(uint64_t, const char*)", utils.find_export("kernel32.dll", "GetProcAddress"))
        local var_1_2 = var_1_0("steam_api64.dll")

        if var_1_2 == 0 then
                return nil
        end

        if not __trial_ffi_steam_defined_builder then
                ffi.cdef("            typedef uint64_t SteamAPICall_t;\n            struct SteamAPI_callback_base_vtbl {\n                void(__thiscall *run1)(struct SteamAPI_callback_base *, void *, bool, uint64_t);\n                void(__thiscall *run2)(struct SteamAPI_callback_base *, void *);\n                int(__thiscall *get_size)(struct SteamAPI_callback_base *);\n            };\n            struct SteamAPI_callback_base {\n                struct SteamAPI_callback_base_vtbl *vtbl;\n                uint8_t flags;\n                int id;\n                uint64_t api_call_handle;\n                struct SteamAPI_callback_base_vtbl vtbl_storage[1];\n            };\n            typedef uint32_t http_HTTPRequestHandle;\n            struct http_ISteamHTTPVtbl {\n                http_HTTPRequestHandle(__thiscall *CreateHTTPRequest)(uintptr_t, int, const char *);\n                bool(__thiscall *SetHTTPRequestContextValue)(uintptr_t, http_HTTPRequestHandle, uint64_t);\n                bool(__thiscall *SetHTTPRequestNetworkActivityTimeout)(uintptr_t, http_HTTPRequestHandle, uint32_t);\n                bool(__thiscall *SetHTTPRequestHeaderValue)(uintptr_t, http_HTTPRequestHandle, const char *, const char *);\n                bool(__thiscall *SetHTTPRequestGetOrPostParameter)(uintptr_t, http_HTTPRequestHandle, const char *, const char *);\n                bool(__thiscall *SendHTTPRequest)(uintptr_t, http_HTTPRequestHandle, SteamAPICall_t *);\n                bool(__thiscall *SendHTTPRequestAndStreamResponse)(uintptr_t, http_HTTPRequestHandle, SteamAPICall_t *);\n                bool(__thiscall *DeferHTTPRequest)(uintptr_t, http_HTTPRequestHandle);\n                bool(__thiscall *PrioritizeHTTPRequest)(uintptr_t, http_HTTPRequestHandle);\n                bool(__thiscall *GetHTTPResponseHeaderSize)(uintptr_t, http_HTTPRequestHandle, const char *, uint32_t *);\n                bool(__thiscall *GetHTTPResponseHeaderValue)(uintptr_t, http_HTTPRequestHandle, const char *, uint8_t *, uint32_t);\n                bool(__thiscall *GetHTTPResponseBodySize)(uintptr_t, http_HTTPRequestHandle, uint32_t *);\n                bool(__thiscall *GetHTTPResponseBodyData)(uintptr_t, http_HTTPRequestHandle, uint8_t *, uint32_t);\n                bool(__thiscall *GetHTTPStreamingResponseBodyData)(uintptr_t, http_HTTPRequestHandle, uint32_t, uint8_t *, uint32_t);\n                bool(__thiscall *ReleaseHTTPRequest)(uintptr_t, http_HTTPRequestHandle);\n                bool(__thiscall *GetHTTPDownloadProgressPct)(uintptr_t, http_HTTPRequestHandle, float *);\n                bool(__thiscall *SetHTTPRequestRawPostBody)(uintptr_t, http_HTTPRequestHandle, const char *, uint8_t *, uint32_t);\n            };\n        ")

                __trial_ffi_steam_defined_builder = true
        end

        local var_1_3 = var_1_1(var_1_2, "SteamClient")
        local var_1_4 = var_1_1(var_1_2, "SteamAPI_GetHSteamPipe")
        local var_1_5 = var_1_1(var_1_2, "SteamAPI_ISteamClient_GetISteamHTTP")
        local var_1_6 = var_1_1(var_1_2, "SteamAPI_RegisterCallResult")

        if var_1_3 == 0 or var_1_4 == 0 or var_1_5 == 0 or var_1_6 == 0 then
                return nil
        end

        local var_1_7 = ffi.cast("void*(__thiscall*)()", var_1_3)
        local var_1_8 = ffi.cast("int(__stdcall*)()", var_1_4)
        local var_1_9 = ffi.cast("int(__stdcall*)()", var_1_4)
        local var_1_10 = ffi.cast("uint64_t(__thiscall*)(void*, int, int, const char*)", var_1_5)
        local var_1_11 = var_1_7()
        local var_1_12 = var_1_8()
        local var_1_13 = var_1_9()

        if var_1_11 == nil or var_1_12 == 0 or var_1_13 == 0 then
                return nil
        end

        local var_1_14 = var_1_10(var_1_11, var_1_12, var_1_13, "STEAMHTTP_INTERFACE_VERSION003")

        if var_1_14 == 0 then
                return nil
        end

        local var_1_15 = ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, uint64_t)", var_1_6)
        local var_1_16 = ffi.cast("struct http_ISteamHTTPVtbl**", var_1_14)[0]

        if var_1_16 == nil then
                return nil
        end

        local var_1_17 = {}
        local var_1_18 = {}
        local var_1_19 = {}

        local function var_1_20(arg_2_0)
                return tostring(tonumber(ffi.cast("uintptr_t", arg_2_0)))
        end

        local var_1_21 = ffi.typeof("struct SteamAPI_callback_base[1]")
        local var_1_22 = ffi.typeof("struct SteamAPI_callback_base*")
        local var_1_23 = ffi.sizeof("struct SteamAPI_callback_base")

        local function var_1_24(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
                if arg_3_3 == arg_3_0.api_call_handle then
                        arg_3_0.api_call_handle = 0

                        local var_3_0 = var_1_20(arg_3_0)
                        local var_3_1 = var_1_17[var_3_0]

                        if var_3_1 then
                                xpcall(var_3_1, print, arg_3_1, arg_3_2)
                        end

                        var_1_17[var_3_0] = nil
                        var_1_18[var_3_0] = nil
                end
        end

        local function var_1_25(arg_4_0, arg_4_1)
                var_1_24(arg_4_0, arg_4_1, false, arg_4_0.api_call_handle)
        end

        local function var_1_26()
                return var_1_23
        end

        local var_1_27 = ffi.cast("void(__thiscall *)(struct SteamAPI_callback_base *, void *, bool, uint64_t)", var_1_24)
        local var_1_28 = ffi.cast("void(__thiscall *)(struct SteamAPI_callback_base *, void *)", var_1_25)
        local var_1_29 = ffi.cast("int(__thiscall *)(struct SteamAPI_callback_base *)", var_1_26)

        local function var_1_30(arg_6_0, arg_6_1, arg_6_2)
                local var_6_0 = var_1_21()
                local var_6_1 = ffi.cast(var_1_22, var_6_0)

                var_6_1.vtbl_storage[0].run1 = var_1_27
                var_6_1.vtbl_storage[0].run2 = var_1_28
                var_6_1.vtbl_storage[0].get_size = var_1_29
                var_6_1.vtbl = var_6_1.vtbl_storage
                var_6_1.api_call_handle = arg_6_0
                var_6_1.id = arg_6_2

                local var_6_2 = var_1_20(var_6_1)

                var_1_17[var_6_2] = arg_6_1
                var_1_18[var_6_2] = var_6_0

                var_1_15(var_6_1, arg_6_0)

                return var_6_1
        end

        local var_1_31 = ffi.typeof("struct {\n        http_HTTPRequestHandle m_hRequest;\n        uint64_t m_ulContextValue;\n        bool m_bRequestSuccessful;\n        int m_eStatusCode;\n        uint32_t m_unBodySize;\n    } *")

        local function var_1_32(arg_7_0, arg_7_1)
                if arg_7_0 == nil then
                        return
                end

                local var_7_0 = ffi.cast(var_1_31, arg_7_0)

                if var_7_0.m_hRequest ~= 0 then
                        local var_7_1 = var_1_19[var_7_0.m_hRequest]

                        if var_7_1 then
                                var_1_19[var_7_0.m_hRequest] = nil

                                local var_7_2 = arg_7_1 == false and var_7_0.m_bRequestSuccessful
                                local var_7_3
                                local var_7_4 = var_7_0.m_unBodySize

                                if var_7_2 and var_7_4 > 0 then
                                        local var_7_5 = ffi.new("uint8_t[?]", var_7_4)

                                        if var_1_16.GetHTTPResponseBodyData(var_1_14, var_7_0.m_hRequest, var_7_5, var_7_4) then
                                                var_7_3 = ffi.string(var_7_5, var_7_4)
                                        end
                                end

                                xpcall(var_7_1, print, var_7_2, {
                                        status = var_7_0.m_eStatusCode,
                                        body = var_7_3
                                })
                                var_1_16.ReleaseHTTPRequest(var_1_14, var_7_0.m_hRequest)
                        end
                end
        end

        local var_1_33 = {
                POST = 3,
                PUT = 4,
                DELETE = 5,
                HEAD = 2,
                GET = 1
        }

        local function var_1_34(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
                local var_8_0 = var_1_16.CreateHTTPRequest(var_1_14, var_1_33[arg_8_0] or 1, arg_8_1)

                if var_8_0 == 0 then
                        if arg_8_4 then
                                arg_8_4(false, {
                                        body = nil,
                                        status = 0
                                })
                        end

                        return
                end

                var_1_16.SetHTTPRequestNetworkActivityTimeout(var_1_14, var_8_0, 15)

                if arg_8_2 then
                        for iter_8_0, iter_8_1 in pairs(arg_8_2) do
                                var_1_16.SetHTTPRequestHeaderValue(var_1_14, var_8_0, iter_8_0, iter_8_1)
                        end
                end

                if arg_8_3 and (arg_8_0 == "PUT" or arg_8_0 == "POST") then
                        local var_8_1 = ffi.new("uint8_t[?]", #arg_8_3)

                        ffi.copy(var_8_1, arg_8_3, #arg_8_3)
                        var_1_16.SetHTTPRequestRawPostBody(var_1_14, var_8_0, "application/json", var_8_1, #arg_8_3)
                end

                local var_8_2 = ffi.new("SteamAPICall_t[1]")

                if not var_1_16.SendHTTPRequest(var_1_14, var_8_0, var_8_2) then
                        var_1_16.ReleaseHTTPRequest(var_1_14, var_8_0)

                        if arg_8_4 then
                                arg_8_4(false, {
                                        body = nil,
                                        status = 0
                                })
                        end

                        return
                end

                var_1_19[var_8_0] = arg_8_4

                var_1_30(var_8_2[0], var_1_32, 2101)
        end

        return {
                get = function(arg_9_0, arg_9_1, arg_9_2)
                        var_1_34("GET", arg_9_0, arg_9_1, nil, arg_9_2)
                end,
                put = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
                        var_1_34("PUT", arg_10_0, arg_10_1, arg_10_2, arg_10_3)
                end,
                post = function(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
                        var_1_34("POST", arg_11_0, arg_11_1, arg_11_2, arg_11_3)
                end
        }
end)()

if not slot_0_2_0 then
        if gui and gui.notify then
                gui.notify:add(gui.notification(slot_0_1_0.SCRIPT_NAME, "HTTP init failed!"))
        end

        return
end

slot_0_3_0 = nil

if not __aapeek_shell32_defined then
        ffi.cdef("        typedef void* HWND_SHELL;\n        typedef const char* LPCSTR_SHELL;\n        typedef void* (__stdcall *ShellExecuteA_t)(HWND_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, LPCSTR_SHELL, int);\n    ")

        __aapeek_shell32_defined = true
end

slot_0_4_0 = utils.find_export("shell32.dll", "ShellExecuteA")

if slot_0_4_0 then
        slot_0_3_0 = ffi.cast("ShellExecuteA_t", slot_0_4_0)
end

function slot_0_5_0(arg_12_0)
        if slot_0_3_0 then
                slot_0_3_0(nil, "open", arg_12_0, nil, nil, 1)
        end
end

slot_0_6_0 = {
        init_complete = false,
        script_enabled = false,
        connection_failed = false,
        data_loaded = false,
        last_update = 0,
        session_start = 0,
        is_blocked = false,
        github_sha = nil,
        is_licensed = false,
        used_seconds = 0,
        username = "unknown",
        last_save = 0,
        all_users_data = {}
}

function slot_0_7_0()
        if gui and gui.ctx and gui.ctx.user and gui.ctx.user.username then
                return gui.ctx.user.username
        end

        return "unknown"
end

slot_0_8_0 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

function slot_0_9_0(arg_14_0)
        return (arg_14_0:gsub(".", function(arg_15_0)
                local var_15_0 = ""
                local var_15_1 = arg_15_0:byte()

                for iter_15_0 = 8, 1, -1 do
                        var_15_0 = var_15_0 .. (var_15_1 % 2^iter_15_0 - var_15_1 % 2^(iter_15_0 - 1) > 0 and "1" or "0")
                end

                return var_15_0
        end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(arg_16_0)
                if #arg_16_0 < 6 then
                        return ""
                end

                local var_16_0 = 0

                for iter_16_0 = 1, 6 do
                        var_16_0 = var_16_0 + (arg_16_0:sub(iter_16_0, iter_16_0) == "1" and 2^(6 - iter_16_0) or 0)
                end

                return slot_0_8_0:sub(var_16_0 + 1, var_16_0 + 1)
        end) .. ({
                "",
                "==",
                "="
        })[#arg_14_0 % 3 + 1]
end

function slot_0_10_0(arg_17_0)
        arg_17_0 = arg_17_0:gsub("[^" .. slot_0_8_0 .. "=]", "")

        return (arg_17_0:gsub(".", function(arg_18_0)
                if arg_18_0 == "=" then
                        return ""
                end

                local var_18_0 = ""
                local var_18_1 = slot_0_8_0:find(arg_18_0) - 1

                for iter_18_0 = 6, 1, -1 do
                        var_18_0 = var_18_0 .. (var_18_1 % 2^iter_18_0 - var_18_1 % 2^(iter_18_0 - 1) > 0 and "1" or "0")
                end

                return var_18_0
        end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(arg_19_0)
                if #arg_19_0 ~= 8 then
                        return ""
                end

                local var_19_0 = 0

                for iter_19_0 = 1, 8 do
                        var_19_0 = var_19_0 + (arg_19_0:sub(iter_19_0, iter_19_0) == "1" and 2^(8 - iter_19_0) or 0)
                end

                return string.char(var_19_0)
        end))
end

function slot_0_11_0(arg_20_0)
        local var_20_0 = {
                users = {},
                _licensed = {}
        }

        if not arg_20_0 then
                return var_20_0
        end

        arg_20_0 = arg_20_0:gsub("%s+", "")

        local var_20_1 = arg_20_0:match("\"users\":{(.-)}")

        if var_20_1 then
                for iter_20_0, iter_20_1 in var_20_1:gmatch("\"([^\"]+)\":(%d+)") do
                        var_20_0.users[iter_20_0:lower()] = tonumber(iter_20_1)
                end
        end

        local var_20_2 = arg_20_0:match("\"licensed\":%[(.-)%]")

        if var_20_2 then
                for iter_20_2 in var_20_2:gmatch("\"([^\"]+)\"") do
                        var_20_0._licensed[iter_20_2:lower()] = true
                end
        end

        return var_20_0
end

function slot_0_12_0(arg_21_0, arg_21_1)
        local var_21_0 = {}

        for iter_21_0, iter_21_1 in pairs(arg_21_0) do
                table.insert(var_21_0, "\"" .. iter_21_0 .. "\":" .. iter_21_1)
        end

        local var_21_1 = {}

        if arg_21_1 then
                for iter_21_2, iter_21_3 in pairs(arg_21_1) do
                        table.insert(var_21_1, "\"" .. iter_21_2 .. "\"")
                end
        end

        return "{\"users\":{" .. table.concat(var_21_0, ",") .. "},\"licensed\":[" .. table.concat(var_21_1, ",") .. "]}"
end

function slot_0_13_0(arg_22_0)
        if gui and gui.notify then
                gui.notify:add(gui.notification(slot_0_1_0.SCRIPT_NAME, arg_22_0))
        end
end

function slot_0_14_0(arg_23_0)
        if slot_0_1_0.DEBUG and gui and gui.notify then
                gui.notify:add(gui.notification("[DEBUG]", arg_23_0))
        end
end

function slot_0_15_0(arg_24_0)
        local var_24_0 = {
                ["User-Agent"] = "FatalityScript",
                Accept = "application/vnd.github.v3+json",
                Authorization = "token " .. slot_0_1_0.GITHUB_TOKEN
        }

        slot_0_14_0("Loading: " .. slot_0_6_0.username)
        slot_0_2_0.get(slot_0_1_0.DATA_URL, var_24_0, function(arg_25_0, arg_25_1)
                if arg_25_0 and arg_25_1.body then
                        local var_25_0 = arg_25_1.body:match("\"content\"%s*:%s*\"([^\"]+)\"")
                        local var_25_1 = arg_25_1.body:match("\"sha\"%s*:%s*\"([^\"]+)\"")

                        if var_25_1 then
                                slot_0_6_0.github_sha = var_25_1
                        end

                        local var_25_2 = ""

                        if var_25_0 then
                                local var_25_3 = var_25_0:gsub("\\n", "")

                                var_25_2 = slot_0_10_0(var_25_3)

                                slot_0_14_0("Data: " .. string.sub(var_25_2, 1, 40))
                        else
                                slot_0_14_0("No content!")

                                slot_0_6_0.data_loaded = false
                                slot_0_6_0.connection_failed = true
                                slot_0_6_0.script_enabled = false
                                slot_0_6_0.init_complete = true

                                if arg_24_0 then
                                        arg_24_0(false)
                                end

                                return
                        end

                        local var_25_4 = slot_0_11_0(var_25_2)

                        slot_0_6_0.all_users_data = var_25_4

                        local var_25_5 = slot_0_6_0.username:lower()
                        local var_25_6 = var_25_5:gsub("[^%w]", "_")

                        slot_0_14_0("Key: " .. var_25_6)

                        if var_25_4.users and var_25_4.users[var_25_6] then
                                slot_0_6_0.used_seconds = var_25_4.users[var_25_6]

                                slot_0_14_0("Found: " .. slot_0_6_0.used_seconds .. "s")
                        else
                                slot_0_6_0.used_seconds = 0

                                slot_0_14_0("New user")
                        end

                        if var_25_4._licensed and var_25_4._licensed[var_25_5] then
                                slot_0_6_0.is_licensed = true
                        end

                        slot_0_6_0.data_loaded = true
                        slot_0_6_0.connection_failed = false

                        if slot_0_6_0.used_seconds >= slot_0_1_0.MAX_SECONDS and not slot_0_6_0.is_licensed then
                                slot_0_6_0.is_blocked = true
                                slot_0_6_0.script_enabled = false
                        else
                                slot_0_6_0.script_enabled = true
                        end

                        slot_0_6_0.init_complete = true

                        if arg_24_0 then
                                arg_24_0(true)
                        end
                else
                        slot_0_14_0("Failed!")

                        slot_0_6_0.data_loaded = false
                        slot_0_6_0.connection_failed = true
                        slot_0_6_0.script_enabled = false
                        slot_0_6_0.init_complete = true

                        if arg_24_0 then
                                arg_24_0(false)
                        end
                end
        end)
end

function slot_0_16_0()
        if slot_0_6_0.is_licensed then
                return
        end

        local var_26_0 = slot_0_6_0.username:lower():gsub("[^%w]", "_")
        local var_26_1 = {
                ["User-Agent"] = "FatalityScript",
                Accept = "application/vnd.github.v3+json",
                Authorization = "token " .. slot_0_1_0.GITHUB_TOKEN
        }

        slot_0_2_0.get(slot_0_1_0.DATA_URL, var_26_1, function(arg_27_0, arg_27_1)
                if not arg_27_0 or not arg_27_1.body then
                        return
                end

                local var_27_0 = arg_27_1.body:match("\"content\"%s*:%s*\"([^\"]+)\"")
                local var_27_1 = arg_27_1.body:match("\"sha\"%s*:%s*\"([^\"]+)\"")

                if not var_27_1 then
                        return
                end

                local var_27_2 = ""

                if var_27_0 then
                        local var_27_3 = var_27_0:gsub("\\n", "")

                        var_27_2 = slot_0_10_0(var_27_3)
                end

                local var_27_4 = slot_0_11_0(var_27_2)

                if not var_27_4.users then
                        var_27_4.users = {}
                end

                var_27_4.users[var_26_0] = slot_0_6_0.used_seconds

                local var_27_5 = var_27_4._licensed or {}
                local var_27_6 = slot_0_12_0(var_27_4.users, var_27_5)
                local var_27_7 = slot_0_9_0(var_27_6)
                local var_27_8 = "{\"message\":\"Update " .. var_26_0 .. "\",\"content\":\"" .. var_27_7 .. "\",\"sha\":\"" .. var_27_1 .. "\"}"
                local var_27_9 = {
                        ["User-Agent"] = "FatalityScript",
                        ["Content-Type"] = "application/json",
                        Accept = "application/vnd.github.v3+json",
                        Authorization = "token " .. slot_0_1_0.GITHUB_TOKEN
                }

                slot_0_2_0.put(slot_0_1_0.UPDATE_URL, var_27_9, var_27_8, function(arg_28_0, arg_28_1)
                        if arg_28_0 and arg_28_1.body then
                                local var_28_0 = arg_28_1.body:match("\"sha\"%s*:%s*\"([^\"]+)\"")

                                if var_28_0 then
                                        slot_0_6_0.github_sha = var_28_0
                                end
                        end
                end)
        end)
end

function slot_0_17_0()
        if game and game.global_vars then
                return game.global_vars.real_time or 0
        end

        return 0
end

function slot_0_18_0()
        if not slot_0_0_0 then
                slot_0_6_0.init_complete = true
                slot_0_6_0.script_enabled = true
                slot_0_6_0.is_licensed = true
                slot_0_6_0.data_loaded = true

                return
        end

        slot_0_6_0.username = slot_0_7_0()
        slot_0_6_0.session_start = slot_0_17_0()
        slot_0_6_0.last_update = slot_0_17_0()
        slot_0_6_0.last_save = slot_0_17_0()

        slot_0_14_0("User: " .. slot_0_6_0.username)
        slot_0_13_0("Connecting...")
        slot_0_15_0(function(arg_31_0)
                if arg_31_0 then
                        if slot_0_6_0.is_licensed then
                                slot_0_13_0("Licensed! Full access.")
                        elseif slot_0_6_0.is_blocked then
                                slot_0_13_0("Trial expired!")

                                if hide_all_ui then
                                        hide_all_ui()
                                end
                        else
                                local var_31_0 = slot_0_1_0.MAX_SECONDS - slot_0_6_0.used_seconds
                                local var_31_1 = math.floor(var_31_0 / 60)
                                local var_31_2 = var_31_0 % 60

                                slot_0_13_0("Trial: " .. var_31_1 .. "m " .. var_31_2 .. "s left")
                        end
                else
                        slot_0_13_0("Connection failed!")

                        if hide_all_ui then
                                hide_all_ui()
                        end
                end
        end)
end

function slot_0_19_0()
        if not slot_0_0_0 then
                return true
        end

        if not slot_0_6_0.init_complete then
                return false
        end

        if slot_0_6_0.connection_failed then
                return false
        end

        if slot_0_6_0.is_licensed then
                return true
        end

        if slot_0_6_0.is_blocked then
                return false
        end

        return slot_0_6_0.script_enabled
end

function slot_0_20_0()
        if not slot_0_0_0 then
                return
        end

        if slot_0_6_0.connection_failed then
                return
        end

        if slot_0_6_0.is_licensed or slot_0_6_0.is_blocked or not slot_0_6_0.data_loaded then
                return
        end

        local var_33_0 = slot_0_17_0()
        local var_33_1 = var_33_0 - slot_0_6_0.last_update

        if var_33_1 >= slot_0_1_0.UPDATE_INTERVAL then
                slot_0_6_0.used_seconds = math.floor(slot_0_6_0.used_seconds + var_33_1)
                slot_0_6_0.last_update = var_33_0

                if slot_0_6_0.used_seconds >= slot_0_1_0.MAX_SECONDS then
                        slot_0_6_0.is_blocked = true
                        slot_0_6_0.script_enabled = false

                        slot_0_13_0("Trial expired!")
                        slot_0_16_0()

                        if hide_all_ui then
                                hide_all_ui()
                        end
                else
                        if var_33_0 - slot_0_6_0.last_save >= slot_0_1_0.SAVE_INTERVAL then
                                slot_0_6_0.last_save = var_33_0

                                slot_0_16_0()
                        end

                        local var_33_2 = slot_0_1_0.MAX_SECONDS - slot_0_6_0.used_seconds

                        if var_33_2 == 300 or var_33_2 == 60 or var_33_2 == 30 then
                                local var_33_3 = math.floor(var_33_2 / 60)
                                local var_33_4 = var_33_2 % 60

                                slot_0_13_0(var_33_3 .. "m " .. var_33_4 .. "s left!")
                        end
                end
        end
end

slot_0_21_0 = {
        pitch = "rage>anti-aim>angles>pitch>settings>value",
        yaw_base = "rage>anti-aim>angles>yaw base",
        pitch_mode = "rage>anti-aim>angles>pitch",
        pitch_jitter_3way = "rage>anti-aim>angles>pitch jitter>settings>3way",
        jitter_disabler = "rage>anti-aim>angles>jitter disabler",
        yaw_jitter_val = "rage>anti-aim>angles>yaw jitter>settings>amount",
        pitch_jitter_val = "rage>anti-aim>angles>pitch jitter>settings>value",
        yaw = "rage>anti-aim>angles>yaw",
        hide_shot = "rage>anti-aim>angles>hide shot",
        spin_enable = "rage>anti-aim>angles>spin",
        yaw_jitter_3way = "rage>anti-aim>angles>yaw jitter>settings>3way",
        spin = "rage>anti-aim>angles>spin amount",
        yaw_jitter = "rage>anti-aim>angles>yaw jitter",
        pitch_jitter = "rage>anti-aim>angles>pitch jitter"
}
slot_0_22_0 = {
        "default",
        "standing",
        "moving",
        "slowwalk",
        "air",
        "air_ctrl",
        "crouch",
        "on_damage",
        "on_shot"
}
slot_0_23_0 = {
        conditions = {},
        presets = {}
}
slot_0_24_0 = "fatality"
slot_0_25_0 = true
slot_0_26_0 = nil
slot_0_27_1 = nil
slot_0_28_0 = nil
slot_0_29_0 = nil
slot_0_30_0 = nil
slot_0_31_0 = nil
slot_0_32_0 = nil
slot_0_33_1 = nil
slot_0_34_0 = nil
slot_0_35_0 = nil
slot_0_36_0 = nil
slot_0_37_0 = nil
slot_0_38_1 = nil
slot_0_39_0 = nil
slot_0_40_0 = nil
slot_0_41_0 = nil
slot_0_42_0 = nil
slot_0_43_0 = nil
slot_0_44_0 = nil
slot_0_45_0 = nil
slot_0_46_0 = "fatality/aa_builder_"
slot_0_47_0 = "fatality/aa_builder_configs.txt"
slot_0_48_0 = {}
slot_0_49_0 = {}

function slot_0_50_0(arg_34_0, arg_34_1)
        arg_34_1 = arg_34_1 or 0

        local var_34_0 = string.rep("  ", arg_34_1)
        local var_34_1 = string.rep("  ", arg_34_1 + 1)

        if arg_34_0 == nil then
                return "null"
        elseif type(arg_34_0) == "boolean" then
                return arg_34_0 and "true" or "false"
        elseif type(arg_34_0) == "number" then
                return tostring(arg_34_0)
        elseif type(arg_34_0) == "string" then
                local var_34_2 = arg_34_0:gsub("\\", "\\\\"):gsub("\"", "\\\""):gsub("\n", "\\n"):gsub("\r", "\\r"):gsub("\t", "\\t")

                return "\"" .. var_34_2 .. "\""
        elseif type(arg_34_0) == "table" then
                local var_34_3 = true
                local var_34_4 = 0

                for iter_34_0, iter_34_1 in pairs(arg_34_0) do
                        if type(iter_34_0) ~= "number" or iter_34_0 <= 0 or math.floor(iter_34_0) ~= iter_34_0 then
                                var_34_3 = false

                                break
                        end

                        if var_34_4 < iter_34_0 then
                                var_34_4 = iter_34_0
                        end
                end

                if var_34_3 and var_34_4 > 0 then
                        local var_34_5 = {}

                        for iter_34_2 = 1, var_34_4 do
                                table.insert(var_34_5, slot_0_50_0(arg_34_0[iter_34_2], arg_34_1 + 1))
                        end

                        if #var_34_5 == 0 then
                                return "[]"
                        end

                        return "[\n" .. var_34_1 .. table.concat(var_34_5, ",\n" .. var_34_1) .. "\n" .. var_34_0 .. "]"
                else
                        local var_34_6 = {}

                        for iter_34_3, iter_34_4 in pairs(arg_34_0) do
                                local var_34_7 = type(iter_34_3) == "string" and iter_34_3 or tostring(iter_34_3)

                                table.insert(var_34_6, "\"" .. var_34_7 .. "\": " .. slot_0_50_0(iter_34_4, arg_34_1 + 1))
                        end

                        if #var_34_6 == 0 then
                                return "{}"
                        end

                        table.sort(var_34_6)

                        return "{\n" .. var_34_1 .. table.concat(var_34_6, ",\n" .. var_34_1) .. "\n" .. var_34_0 .. "}"
                end
        end

        return "null"
end

function slot_0_51_0(arg_35_0)
        if not arg_35_0 or arg_35_0 == "" then
                return nil
        end

        local var_35_0 = 1

        local function var_35_1()
                while var_35_0 <= #arg_35_0 and arg_35_0:sub(var_35_0, var_35_0):match("%s") do
                        var_35_0 = var_35_0 + 1
                end
        end

        local function var_35_2()
                var_35_1()

                slot_37_0_0 = arg_35_0:sub(var_35_0, var_35_0)

                if slot_37_0_0 == "\"" then
                        var_35_0 = var_35_0 + 1
                        slot_37_1_3 = ""

                        while var_35_0 <= #arg_35_0 do
                                slot_37_2_1 = arg_35_0:sub(var_35_0, var_35_0)

                                if slot_37_2_1 == "\"" then
                                        var_35_0 = var_35_0 + 1

                                        return slot_37_1_3
                                elseif slot_37_2_1 == "\\" then
                                        var_35_0 = var_35_0 + 1
                                        slot_37_3_0 = arg_35_0:sub(var_35_0, var_35_0)

                                        if slot_37_3_0 == "n" then
                                                slot_37_1_3 = slot_37_1_3 .. "\n"
                                        elseif slot_37_3_0 == "r" then
                                                slot_37_1_3 = slot_37_1_3 .. "\r"
                                        elseif slot_37_3_0 == "t" then
                                                slot_37_1_3 = slot_37_1_3 .. "\t"
                                        elseif slot_37_3_0 == "\"" then
                                                slot_37_1_3 = slot_37_1_3 .. "\""
                                        elseif slot_37_3_0 == "\\" then
                                                slot_37_1_3 = slot_37_1_3 .. "\\"
                                        else
                                                slot_37_1_3 = slot_37_1_3 .. slot_37_3_0
                                        end

                                        var_35_0 = var_35_0 + 1
                                else
                                        slot_37_1_3 = slot_37_1_3 .. slot_37_2_1
                                        var_35_0 = var_35_0 + 1
                                end
                        end

                        return slot_37_1_3
                elseif slot_37_0_0 == "{" then
                        var_35_0 = var_35_0 + 1
                        slot_37_1_2 = {}

                        var_35_1()

                        if arg_35_0:sub(var_35_0, var_35_0) == "}" then
                                var_35_0 = var_35_0 + 1

                                return slot_37_1_2
                        end

                        while var_35_0 <= #arg_35_0 do
                                var_35_1()

                                if arg_35_0:sub(var_35_0, var_35_0) ~= "\"" then
                                        break
                                end

                                slot_37_2_0 = var_35_2()

                                var_35_1()

                                if arg_35_0:sub(var_35_0, var_35_0) == ":" then
                                        var_35_0 = var_35_0 + 1
                                end

                                slot_37_1_2[slot_37_2_0] = var_35_2()

                                var_35_1()

                                if arg_35_0:sub(var_35_0, var_35_0) == "," then
                                        var_35_0 = var_35_0 + 1
                                else
                                        if arg_35_0:sub(var_35_0, var_35_0) == "}" then
                                                var_35_0 = var_35_0 + 1
                                        end

                                        break
                                end

                                if false then
                                        break
                                end
                        end

                        return slot_37_1_2
                elseif slot_37_0_0 == "[" then
                        var_35_0 = var_35_0 + 1
                        slot_37_1_1 = {}

                        var_35_1()

                        if arg_35_0:sub(var_35_0, var_35_0) == "]" then
                                var_35_0 = var_35_0 + 1

                                return slot_37_1_1
                        end

                        while var_35_0 <= #arg_35_0 do
                                table.insert(slot_37_1_1, var_35_2())
                                var_35_1()

                                if arg_35_0:sub(var_35_0, var_35_0) == "," then
                                        var_35_0 = var_35_0 + 1
                                else
                                        if arg_35_0:sub(var_35_0, var_35_0) == "]" then
                                                var_35_0 = var_35_0 + 1
                                        end

                                        break
                                end

                                if false then
                                        break
                                end
                        end

                        return slot_37_1_1
                elseif arg_35_0:sub(var_35_0, var_35_0 + 3) == "true" then
                        var_35_0 = var_35_0 + 4

                        return true
                elseif arg_35_0:sub(var_35_0, var_35_0 + 4) == "false" then
                        var_35_0 = var_35_0 + 5

                        return false
                elseif arg_35_0:sub(var_35_0, var_35_0 + 3) == "null" then
                        var_35_0 = var_35_0 + 4

                        return nil
                elseif slot_37_0_0:match("[%d%-]") then
                        slot_37_1_0 = var_35_0

                        if arg_35_0:sub(var_35_0, var_35_0) == "-" then
                                var_35_0 = var_35_0 + 1
                        end

                        while var_35_0 <= #arg_35_0 and arg_35_0:sub(var_35_0, var_35_0):match("[%d%.eE%+%-]") do
                                var_35_0 = var_35_0 + 1
                        end

                        return tonumber(arg_35_0:sub(slot_37_1_0, var_35_0 - 1))
                end

                return nil
        end

        return var_35_2()
end

function slot_0_52_0(arg_38_0, arg_38_1)
        if utils and utils.file_write and utils.string_to_array then
                utils.file_write(arg_38_0, utils.string_to_array(arg_38_1))

                return true
        end

        return false
end

function slot_0_53_0(arg_39_0)
        if not utils or not utils.file_exists or not utils.file_read or not utils.array_to_string then
                return nil
        end

        if not utils.file_exists(arg_39_0) then
                return nil
        end

        local var_39_0 = utils.file_read(arg_39_0)

        if not var_39_0 then
                return nil
        end

        return utils.array_to_string(var_39_0)
end

function slot_0_54_0(arg_40_0)
        if utils and utils.file_exists then
                return utils.file_exists(arg_40_0)
        end

        return false
end

function slot_0_55_0()
        local var_41_0 = {
                version = 2,
                builder_enabled = slot_0_29_0 and slot_0_29_0.enable and slot_0_31_0(slot_0_29_0.enable) or false,
                ticks_enabled = slot_0_29_0 and slot_0_29_0.ticks_enable and slot_0_31_0(slot_0_29_0.ticks_enable) or false,
                preset_mode = slot_0_29_0 and slot_0_29_0.preset_mode and slot_0_31_0(slot_0_29_0.preset_mode) or false,
                hud_enabled = slot_0_29_0 and slot_0_29_0.hud and slot_0_31_0(slot_0_29_0.hud) or false,
                presets = {},
                conditions = {},
                ticks = {
                        conditions = {}
                }
        }

        if presets then
                for iter_41_0, iter_41_1 in pairs(presets) do
                        var_41_0.presets[iter_41_0] = iter_41_1
                end
        end

        if slot_0_22_0 and slot_0_23_0 and slot_0_23_0.conditions then
                for iter_41_2, iter_41_3 in ipairs(slot_0_22_0) do
                        local var_41_1 = slot_0_23_0.conditions[iter_41_3]

                        if var_41_1 then
                                var_41_0.conditions[iter_41_3] = {
                                        override_enabled = var_41_1.override_enabled,
                                        pitch_val = var_41_1.pitch_val,
                                        pitch_random = var_41_1.pitch_random,
                                        pitch_rand_min = var_41_1.pitch_rand_min,
                                        pitch_rand_max = var_41_1.pitch_rand_max,
                                        pitch_speed = var_41_1.pitch_speed,
                                        pj_val = var_41_1.pj_val,
                                        pj_random = var_41_1.pj_random,
                                        pj_rand_min = var_41_1.pj_rand_min,
                                        pj_rand_max = var_41_1.pj_rand_max,
                                        pj_mode = var_41_1.pj_mode,
                                        pj_3way = var_41_1.pj_3way,
                                        pj_speed = var_41_1.pj_speed,
                                        yaw_mode = var_41_1.yaw_mode,
                                        yaw_base = var_41_1.yaw_base,
                                        yj_val = var_41_1.yj_val,
                                        yj_random = var_41_1.yj_random,
                                        yj_rand_min = var_41_1.yj_rand_min,
                                        yj_rand_max = var_41_1.yj_rand_max,
                                        yj_mode = var_41_1.yj_mode,
                                        yj_3way = var_41_1.yj_3way,
                                        yj_speed = var_41_1.yj_speed,
                                        spin_val = var_41_1.spin_val,
                                        spin_random = var_41_1.spin_random,
                                        spin_rand_min = var_41_1.spin_rand_min,
                                        spin_rand_max = var_41_1.spin_rand_max,
                                        spin_speed = var_41_1.spin_speed,
                                        jitter_dis = var_41_1.jitter_dis,
                                        hide_shot = var_41_1.hide_shot,
                                        dmg_duration = var_41_1.dmg_duration,
                                        shot_duration = var_41_1.shot_duration
                                }
                        end
                end
        end

        if slot_0_42_0 and slot_0_44_0 and slot_0_44_0.conditions then
                for iter_41_4, iter_41_5 in ipairs(slot_0_42_0) do
                        local var_41_2 = slot_0_44_0.conditions[iter_41_5]

                        if var_41_2 then
                                var_41_0.ticks.conditions[iter_41_5] = {
                                        enabled = var_41_2.enabled,
                                        tick_count = var_41_2.tick_count,
                                        ticks = {}
                                }

                                for iter_41_6 = 1, slot_0_43_0 do
                                        local var_41_3 = var_41_2.ticks[iter_41_6]

                                        if var_41_3 then
                                                var_41_0.ticks.conditions[iter_41_5].ticks[iter_41_6] = {
                                                        pitch_mode = var_41_3.pitch_mode,
                                                        pitch = var_41_3.pitch,
                                                        pitch_jitter = var_41_3.pitch_jitter,
                                                        yaw_jitter = var_41_3.yaw_jitter,
                                                        spin = var_41_3.spin,
                                                        yaw_mode = var_41_3.yaw_mode,
                                                        yaw_base = var_41_3.yaw_base,
                                                        pj_mode = var_41_3.pj_mode,
                                                        yj_mode = var_41_3.yj_mode,
                                                        random_pitch = var_41_3.random_pitch,
                                                        random_pitch_min = var_41_3.random_pitch_min,
                                                        random_pitch_max = var_41_3.random_pitch_max,
                                                        random_yj = var_41_3.random_yj,
                                                        random_yj_min = var_41_3.random_yj_min,
                                                        random_yj_max = var_41_3.random_yj_max,
                                                        random_spin = var_41_3.random_spin,
                                                        random_spin_min = var_41_3.random_spin_min,
                                                        random_spin_max = var_41_3.random_spin_max
                                                }
                                        end
                                end
                        end
                end
        end

        return var_41_0
end

function slot_0_56_0(arg_42_0)
        if not arg_42_0 then
                return false
        end

        if arg_42_0.version ~= 2 then
                return false
        end

        if arg_42_0.presets then
                presets = {}

                for iter_42_0, iter_42_1 in pairs(arg_42_0.presets) do
                        presets[iter_42_0] = iter_42_1
                end
        end

        if arg_42_0.conditions then
                for iter_42_2, iter_42_3 in pairs(arg_42_0.conditions) do
                        if slot_0_23_0.conditions[iter_42_2] then
                                local var_42_0 = slot_0_23_0.conditions[iter_42_2]

                                var_42_0.override_enabled = iter_42_3.override_enabled or false
                                var_42_0.pitch_val = iter_42_3.pitch_val or "89"
                                var_42_0.pitch_random = iter_42_3.pitch_random or false
                                var_42_0.pitch_rand_min = iter_42_3.pitch_rand_min or "80"
                                var_42_0.pitch_rand_max = iter_42_3.pitch_rand_max or "89"
                                var_42_0.pitch_speed = iter_42_3.pitch_speed or 50
                                var_42_0.pj_val = iter_42_3.pj_val or "0"
                                var_42_0.pj_random = iter_42_3.pj_random or false
                                var_42_0.pj_rand_min = iter_42_3.pj_rand_min or "0"
                                var_42_0.pj_rand_max = iter_42_3.pj_rand_max or "30"
                                var_42_0.pj_mode = iter_42_3.pj_mode or 1
                                var_42_0.pj_3way = iter_42_3.pj_3way or false
                                var_42_0.pj_speed = iter_42_3.pj_speed or 50
                                var_42_0.yaw_mode = iter_42_3.yaw_mode or 2
                                var_42_0.yaw_base = iter_42_3.yaw_base or 2
                                var_42_0.yj_val = iter_42_3.yj_val or "0"
                                var_42_0.yj_random = iter_42_3.yj_random or false
                                var_42_0.yj_rand_min = iter_42_3.yj_rand_min or "0"
                                var_42_0.yj_rand_max = iter_42_3.yj_rand_max or "30"
                                var_42_0.yj_mode = iter_42_3.yj_mode or 1
                                var_42_0.yj_3way = iter_42_3.yj_3way or false
                                var_42_0.yj_speed = iter_42_3.yj_speed or 50
                                var_42_0.spin_val = iter_42_3.spin_val or "0"
                                var_42_0.spin_random = iter_42_3.spin_random or false
                                var_42_0.spin_rand_min = iter_42_3.spin_rand_min or "0"
                                var_42_0.spin_rand_max = iter_42_3.spin_rand_max or "100"
                                var_42_0.spin_speed = iter_42_3.spin_speed or 50
                                var_42_0.jitter_dis = iter_42_3.jitter_dis or 1
                                var_42_0.hide_shot = iter_42_3.hide_shot or false
                                var_42_0.dmg_duration = iter_42_3.dmg_duration or 64
                                var_42_0.shot_duration = iter_42_3.shot_duration or 32
                        end
                end
        end

        if arg_42_0.ticks and arg_42_0.ticks.conditions then
                for iter_42_4, iter_42_5 in pairs(arg_42_0.ticks.conditions) do
                        if slot_0_44_0.conditions[iter_42_4] then
                                local var_42_1 = slot_0_44_0.conditions[iter_42_4]

                                var_42_1.enabled = iter_42_5.enabled or iter_42_4 == "default"
                                var_42_1.tick_count = iter_42_5.tick_count or 4

                                if iter_42_5.ticks then
                                        for iter_42_6, iter_42_7 in pairs(iter_42_5.ticks) do
                                                local var_42_2 = tonumber(iter_42_6)

                                                if var_42_2 and var_42_2 >= 1 and var_42_2 <= slot_0_43_0 then
                                                        var_42_1.ticks[var_42_2] = {
                                                                pitch_mode = iter_42_7.pitch_mode or 16,
                                                                pitch = iter_42_7.pitch or "89",
                                                                pitch_jitter = iter_42_7.pitch_jitter or "0",
                                                                yaw_jitter = iter_42_7.yaw_jitter or "0",
                                                                spin = iter_42_7.spin or "0",
                                                                yaw_mode = iter_42_7.yaw_mode or 2,
                                                                yaw_base = iter_42_7.yaw_base or 2,
                                                                pj_mode = iter_42_7.pj_mode or 1,
                                                                yj_mode = iter_42_7.yj_mode or 1,
                                                                random_pitch = iter_42_7.random_pitch or false,
                                                                random_pitch_min = iter_42_7.random_pitch_min or "80",
                                                                random_pitch_max = iter_42_7.random_pitch_max or "89",
                                                                random_yj = iter_42_7.random_yj or false,
                                                                random_yj_min = iter_42_7.random_yj_min or "0",
                                                                random_yj_max = iter_42_7.random_yj_max or "30",
                                                                random_spin = iter_42_7.random_spin or false,
                                                                random_spin_min = iter_42_7.random_spin_min or "0",
                                                                random_spin_max = iter_42_7.random_spin_max or "100"
                                                        }
                                                end
                                        end
                                end
                        end
                end
        end

        if slot_0_29_0 then
                if arg_42_0.builder_enabled ~= nil and slot_0_29_0.enable then
                        slot_0_32_0(slot_0_29_0.enable, arg_42_0.builder_enabled)
                end

                if arg_42_0.ticks_enabled ~= nil and slot_0_29_0.ticks_enable then
                        slot_0_32_0(slot_0_29_0.ticks_enable, arg_42_0.ticks_enabled)
                end

                if arg_42_0.preset_mode ~= nil and slot_0_29_0.preset_mode then
                        slot_0_32_0(slot_0_29_0.preset_mode, arg_42_0.preset_mode)
                end

                if arg_42_0.hud_enabled ~= nil and slot_0_29_0.hud then
                        slot_0_32_0(slot_0_29_0.hud, arg_42_0.hud_enabled)
                end
        end

        if slot_0_29_0 and slot_0_29_0.cond then
                local var_42_3 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

                if slot_0_35_0 then
                        slot_0_35_0(var_42_3)
                end
        end

        if slot_0_29_0 and slot_0_29_0.ticks_cond then
                slot_0_45_0 = slot_0_34_0(slot_0_30_0(slot_0_29_0.ticks_cond))

                if slot_0_36_0 then
                        slot_0_36_0(slot_0_45_0)
                end
        end

        if slot_0_37_0 then
                slot_0_37_0()
        end

        return true
end

function slot_0_57_0(arg_43_0)
        if not arg_43_0 or arg_43_0 == "" then
                gui.notify:add(gui.notification("AA Builder", "Enter config name!"))

                return false
        end

        local var_43_0 = arg_43_0:gsub("[^%w_%-]", "_")
        local var_43_1 = slot_0_46_0 .. var_43_0 .. ".json"
        local var_43_2 = slot_0_55_0()
        local var_43_3 = slot_0_50_0(var_43_2)

        if slot_0_52_0(var_43_1, var_43_3) then
                local var_43_4 = false

                for iter_43_0, iter_43_1 in ipairs(slot_0_48_0) do
                        if iter_43_1 == var_43_0 then
                                var_43_4 = true

                                break
                        end
                end

                if not var_43_4 then
                        table.insert(slot_0_48_0, var_43_0)
                        slot_0_26_0()
                        slot_0_28_0()
                end

                gui.notify:add(gui.notification("AA Builder", "Config '" .. arg_43_0 .. "' saved!"))

                return true
        else
                gui.notify:add(gui.notification("AA Builder", "Failed to save config!"))

                return false
        end
end

function slot_0_58_0(arg_44_0)
        if not arg_44_0 or arg_44_0 == "" then
                gui.notify:add(gui.notification("AA Builder", "Select config to load!"))

                return false
        end

        local var_44_0 = slot_0_46_0 .. arg_44_0 .. ".json"
        local var_44_1 = slot_0_53_0(var_44_0)

        if not var_44_1 then
                gui.notify:add(gui.notification("AA Builder", "Config not found!"))

                return false
        end

        local var_44_2 = slot_0_51_0(var_44_1)

        if slot_0_56_0(var_44_2) then
                gui.notify:add(gui.notification("AA Builder", "Config '" .. arg_44_0 .. "' loaded!"))

                return true
        else
                gui.notify:add(gui.notification("AA Builder", "Failed to parse config!"))

                return false
        end
end

function slot_0_59_0(arg_45_0)
        if not arg_45_0 or arg_45_0 == "" then
                gui.notify:add(gui.notification("AA Builder", "Select config to delete!"))

                return false
        end

        local var_45_0 = slot_0_46_0 .. arg_45_0 .. ".json"

        if utils and utils.file_exists and utils.file_exists(var_45_0) then
                if utils.file_remove then
                        utils.file_remove(var_45_0)
                else
                        slot_0_52_0(var_45_0, "")
                end
        end

        for iter_45_0, iter_45_1 in ipairs(slot_0_48_0) do
                if iter_45_1 == arg_45_0 then
                        table.remove(slot_0_48_0, iter_45_0)

                        break
                end
        end

        slot_0_26_0()
        slot_0_28_0()
        gui.notify:add(gui.notification("AA Builder", "Config '" .. arg_45_0 .. "' deleted!"))

        return true
end

function slot_0_26_0()
        local var_46_0 = table.concat(slot_0_48_0, "\n")

        slot_0_52_0(slot_0_47_0, var_46_0)
end

function slot_0_27_0()
        local var_47_0 = slot_0_53_0(slot_0_47_0)

        slot_0_48_0 = {}

        if var_47_0 then
                for iter_47_0 in var_47_0:gmatch("[^\n]+") do
                        local var_47_1 = iter_47_0:match("^%s*(.-)%s*$")

                        if var_47_1 and var_47_1 ~= "" then
                                table.insert(slot_0_48_0, var_47_1)
                        end
                end
        end
end

function slot_0_60_0()
        if not slot_0_29_0 or not slot_0_29_0.cfg_list then
                return nil
        end

        local var_48_0 = slot_0_30_0(slot_0_29_0.cfg_list)

        if var_48_0 == 0 then
                return nil
        end

        local var_48_1 = 0

        for iter_48_0 = 0, 31 do
                if bit.band(var_48_0, bit.lshift(1, iter_48_0)) ~= 0 then
                        var_48_1 = iter_48_0 + 1

                        break
                end
        end

        if var_48_1 > 0 and var_48_1 <= #slot_0_48_0 then
                return slot_0_48_0[var_48_1]
        end

        return nil
end

function slot_0_28_0()
        if not slot_0_29_0 then
                gui.notify:add(gui.notification("AA Builder", "C is nil"))

                return
        end

        if not slot_0_29_0.cfg_list then
                gui.notify:add(gui.notification("AA Builder", "C.cfg_list is nil"))

                return
        end

        for iter_49_0, iter_49_1 in ipairs(slot_0_49_0) do
                slot_0_29_0.cfg_list:remove(iter_49_1)
        end

        slot_0_49_0 = {}

        gui.notify:add(gui.notification("AA Builder", "Adding " .. #slot_0_48_0 .. " configs to list"))

        for iter_49_2, iter_49_3 in ipairs(slot_0_48_0) do
                local var_49_0 = gui.selectable(gui.control_id("aab_cfg_" .. iter_49_2 .. "_" .. tostring(math.random(1, 99999))), iter_49_3)

                slot_0_29_0.cfg_list:add(var_49_0)
                table.insert(slot_0_49_0, var_49_0)
        end
end

function slot_0_61_0()
        local var_50_0 = slot_0_55_0()
        local var_50_1 = slot_0_50_0(var_50_0)
        local var_50_2 = "AABFULL:" .. var_50_1

        if utils and utils.clipboard_set then
                utils.clipboard_set(var_50_2)
                gui.notify:add(gui.notification("AA Builder", "Full config exported to clipboard!"))

                return true
        else
                gui.notify:add(gui.notification("AA Builder", "Clipboard not available!"))

                return false
        end
end

function slot_0_62_0()
        if not utils or not utils.clipboard_get then
                gui.notify:add(gui.notification("AA Builder", "Clipboard not available!"))

                return false
        end

        local var_51_0 = utils.clipboard_get()

        if not var_51_0 or var_51_0 == "" then
                gui.notify:add(gui.notification("AA Builder", "Clipboard is empty!"))

                return false
        end

        if var_51_0:sub(1, 8) == "AABFULL:" then
                local var_51_1 = var_51_0:sub(9)
                local var_51_2 = slot_0_51_0(var_51_1)

                if var_51_2 and slot_0_56_0(var_51_2) then
                        gui.notify:add(gui.notification("AA Builder", "Full config imported from clipboard!"))

                        return true
                else
                        gui.notify:add(gui.notification("AA Builder", "Failed to parse config!"))

                        return false
                end
        else
                gui.notify:add(gui.notification("AA Builder", "Invalid config format! Use AAB5: for condition or AABFULL: for full config"))

                return false
        end
end

function slot_0_63_0()
        slot_0_27_0()

        slot_0_49_0 = {}

        if slot_0_29_0 and slot_0_29_0.cfg_list then
                for iter_52_0, iter_52_1 in ipairs(slot_0_48_0) do
                        local var_52_0 = gui.selectable(gui.control_id("aab_cfg_" .. iter_52_0), iter_52_1)

                        slot_0_29_0.cfg_list:add(var_52_0)
                        table.insert(slot_0_49_0, var_52_0)
                end
        end
end

slot_0_64_0 = {}
slot_0_65_0 = {}

function slot_0_66_0()
        local var_53_0 = {
                "AAB_PRESETS_V1"
        }

        for iter_53_0, iter_53_1 in pairs(slot_0_64_0) do
                table.insert(var_53_0, iter_53_0 .. "=" .. iter_53_1)
        end

        local var_53_1 = table.concat(var_53_0, "\n")

        utils.file_write(slot_0_24_0 .. "/aa_builder_presets.txt", utils.string_to_array(var_53_1))
end

function slot_0_67_0()
        local var_54_0 = slot_0_24_0 .. "/aa_builder_presets.txt"

        if not utils.file_exists(var_54_0) then
                return
        end

        local var_54_1 = utils.file_read(var_54_0)

        if not var_54_1 then
                return
        end

        local var_54_2 = utils.array_to_string(var_54_1)

        slot_0_64_0 = {}

        for iter_54_0 in var_54_2:gmatch("[^\n]+") do
                if iter_54_0 ~= "AAB_PRESETS_V1" then
                        local var_54_3, var_54_4 = iter_54_0:match("^(.+)=(.+)$")

                        if var_54_3 and var_54_4 then
                                slot_0_64_0[var_54_3] = tonumber(var_54_4) or 0
                        end
                end
        end
end

function slot_0_68_0(arg_55_0, arg_55_1)
        if not arg_55_0 or arg_55_0 == "" then
                return {
                        0
                }
        end

        local var_55_0 = {}
        local var_55_1 = arg_55_1 or false

        for iter_55_0 in arg_55_0:gmatch("[^,]+") do
                iter_55_0 = iter_55_0:match("^%s*(.-)%s*$")

                if iter_55_0:sub(1, 1) == "#" then
                        local var_55_2 = iter_55_0:sub(2)

                        if slot_0_64_0[var_55_2] then
                                table.insert(var_55_0, slot_0_64_0[var_55_2])
                        end
                elseif var_55_1 and slot_0_64_0[iter_55_0] then
                        table.insert(var_55_0, slot_0_64_0[iter_55_0])
                else
                        local var_55_3 = tonumber(iter_55_0)

                        if var_55_3 then
                                table.insert(var_55_0, var_55_3)
                        end
                end
        end

        if #var_55_0 == 0 then
                var_55_0 = {
                        0
                }
        end

        return var_55_0
end

function slot_0_69_0(arg_56_0, arg_56_1, arg_56_2)
        if #arg_56_0 == 1 then
                return arg_56_0[1]
        end

        local var_56_0 = math.max(1, math.floor(100 / (arg_56_2 or 50)))

        return arg_56_0[math.floor(arg_56_1 / var_56_0) % #arg_56_0 + 1]
end

function slot_0_70_0()
        return {
                pj_rand_min = "0",
                yj_mode = 1,
                yaw_base = 2,
                pitch_speed = 50,
                yaw_mode = 2,
                pj_mode = 1,
                pitch_random = false,
                pitch_val = "89",
                shot_duration = 32,
                dmg_duration = 64,
                hide_shot = false,
                jitter_dis = 1,
                spin_speed = 50,
                spin_rand_max = "100",
                spin_rand_min = "0",
                spin_random = false,
                spin_val = "0",
                yj_speed = 50,
                yj_3way = false,
                yj_rand_max = "30",
                yj_rand_min = "0",
                yj_random = false,
                yj_val = "0",
                pj_speed = 50,
                override_enabled = false,
                pitch_rand_min = "80",
                pitch_rand_max = "89",
                pj_val = "0",
                pj_random = false,
                pj_3way = false,
                pj_rand_max = "30"
        }
end

for iter_0_0, iter_0_1 in ipairs(slot_0_22_0) do
        slot_0_23_0.conditions[iter_0_1] = slot_0_70_0()
end

slot_0_71_0 = false
slot_0_72_0 = 0
slot_0_73_0 = 0
slot_0_74_0 = 0
slot_0_75_0 = 0
slot_0_76_0 = "standing"
slot_0_77_0 = 10
slot_0_78_0 = 300
slot_0_79_0 = {}
slot_0_80_0 = false
slot_0_81_0 = {
        last_tick = 0
}
slot_0_82_0 = 0
slot_0_83_0 = 1
slot_0_84_0 = 1
slot_0_85_0 = {}
slot_0_43_0 = 128
slot_0_42_0 = {
        "default",
        "standing",
        "moving",
        "slowwalk",
        "air",
        "air_ctrl",
        "crouch",
        "on_damage",
        "on_shot"
}

function slot_0_86_0()
        return {
                pitch = "89",
                yj_mode = 1,
                yaw_base = 2,
                pitch_mode = 16,
                yaw_mode = 2,
                pj_mode = 1,
                random_spin_max = "100",
                random_spin_min = "0",
                random_spin = false,
                random_yj_max = "30",
                random_yj_min = "0",
                random_yj = false,
                random_pitch_max = "89",
                random_pitch_min = "80",
                random_pitch = false,
                spin = "0",
                yaw_jitter = "0",
                pitch_jitter = "0"
        }
end

slot_0_44_0 = {
        enabled = false,
        current_cond = "default",
        conditions = {}
}

for iter_0_2, iter_0_3 in ipairs(slot_0_42_0) do
        slot_0_44_0.conditions[iter_0_3] = {
                tick_count = 4,
                enabled = iter_0_3 == "default",
                ticks = {}
        }

        for iter_0_4 = 1, slot_0_43_0 do
                slot_0_44_0.conditions[iter_0_3].ticks[iter_0_4] = slot_0_86_0()
        end
end

slot_0_87_0 = gui.ctx:find("lua>elements a")

if not slot_0_87_0 then
        return
end

slot_0_88_0 = gui.ctx:find("lua>elements b")

if not slot_0_88_0 then
        return
end

slot_0_29_0 = {
        enable = gui.checkbox(gui.control_id("aab_enable")),
        tab = gui.combo_box(gui.control_id("aab_tab"))
}

slot_0_29_0.tab:add(gui.selectable(gui.control_id("aab_tab_1"), "Pitch"))
slot_0_29_0.tab:add(gui.selectable(gui.control_id("aab_tab_2"), "Yaw"))
slot_0_29_0.tab:add(gui.selectable(gui.control_id("aab_tab_3"), "Spin"))
slot_0_29_0.tab:add(gui.selectable(gui.control_id("aab_tab_4"), "Ticks"))
slot_0_29_0.tab:add(gui.selectable(gui.control_id("aab_tab_5"), "Presets"))
slot_0_29_0.tab:add(gui.selectable(gui.control_id("aab_tab_6"), "Config"))

slot_0_29_0.cond = gui.combo_box(gui.control_id("aab_cond"))

slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_0"), "Default"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_1"), "Standing"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_2"), "Moving"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_3"), "Slow Walk"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_4"), "Air"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_5"), "Air + Ctrl"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_6"), "Crouch"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_7"), "On Damage"))
slot_0_29_0.cond:add(gui.selectable(gui.control_id("aab_cond_8"), "On Shot"))

slot_0_29_0.override_enable = gui.checkbox(gui.control_id("aab_override_en"))
slot_0_29_0.pitch_val = gui.text_input(gui.control_id("aab_pitch_val"))
slot_0_29_0.pitch_val.placeholder = "89 or 1,2,3"
slot_0_29_0.pitch_random = gui.checkbox(gui.control_id("aab_pitch_rand"))
slot_0_29_0.pitch_rand_min = gui.text_input(gui.control_id("aab_pitch_rmin"))
slot_0_29_0.pitch_rand_min.placeholder = "80"
slot_0_29_0.pitch_rand_max = gui.text_input(gui.control_id("aab_pitch_rmax"))
slot_0_29_0.pitch_rand_max.placeholder = "89"
slot_0_29_0.pitch_speed = gui.text_input(gui.control_id("aab_pitch_spd"))
slot_0_29_0.pitch_speed.placeholder = "50"
slot_0_29_0.pj_mode = gui.combo_box(gui.control_id("aab_pj_mode"))

slot_0_29_0.pj_mode:add(gui.selectable(gui.control_id("aab_pjm_1"), "None"))
slot_0_29_0.pj_mode:add(gui.selectable(gui.control_id("aab_pjm_2"), "Center"))
slot_0_29_0.pj_mode:add(gui.selectable(gui.control_id("aab_pjm_3"), "Offset"))

slot_0_29_0.pj_3way = gui.checkbox(gui.control_id("aab_pj_3way"))
slot_0_29_0.pj_val = gui.text_input(gui.control_id("aab_pj_val"))
slot_0_29_0.pj_val.placeholder = "0 or 1,2,3"
slot_0_29_0.pj_random = gui.checkbox(gui.control_id("aab_pj_rand"))
slot_0_29_0.pj_rand_min = gui.text_input(gui.control_id("aab_pj_rmin"))
slot_0_29_0.pj_rand_min.placeholder = "0"
slot_0_29_0.pj_rand_max = gui.text_input(gui.control_id("aab_pj_rmax"))
slot_0_29_0.pj_rand_max.placeholder = "30"
slot_0_29_0.pj_speed = gui.text_input(gui.control_id("aab_pj_spd"))
slot_0_29_0.pj_speed.placeholder = "50"
slot_0_29_0.yaw_mode = gui.combo_box(gui.control_id("aab_yaw_mode"))

slot_0_29_0.yaw_mode:add(gui.selectable(gui.control_id("aab_ym_1"), "None"))
slot_0_29_0.yaw_mode:add(gui.selectable(gui.control_id("aab_ym_2"), "Backwards"))
slot_0_29_0.yaw_mode:add(gui.selectable(gui.control_id("aab_ym_3"), "Custom"))

slot_0_29_0.yaw_base = gui.combo_box(gui.control_id("aab_yaw_base"))

slot_0_29_0.yaw_base:add(gui.selectable(gui.control_id("aab_yb_1"), "Viewangles"))
slot_0_29_0.yaw_base:add(gui.selectable(gui.control_id("aab_yb_2"), "At Target"))

slot_0_29_0.yj_mode = gui.combo_box(gui.control_id("aab_yj_mode"))

slot_0_29_0.yj_mode:add(gui.selectable(gui.control_id("aab_yjm_1"), "None"))
slot_0_29_0.yj_mode:add(gui.selectable(gui.control_id("aab_yjm_2"), "Center"))
slot_0_29_0.yj_mode:add(gui.selectable(gui.control_id("aab_yjm_3"), "Offset"))

slot_0_29_0.yj_3way = gui.checkbox(gui.control_id("aab_yj_3way"))
slot_0_29_0.yj_val = gui.text_input(gui.control_id("aab_yj_val"))
slot_0_29_0.yj_val.placeholder = "0 or 1,2"
slot_0_29_0.yj_random = gui.checkbox(gui.control_id("aab_yj_rand"))
slot_0_29_0.yj_rand_min = gui.text_input(gui.control_id("aab_yj_rmin"))
slot_0_29_0.yj_rand_min.placeholder = "0"
slot_0_29_0.yj_rand_max = gui.text_input(gui.control_id("aab_yj_rmax"))
slot_0_29_0.yj_rand_max.placeholder = "30"
slot_0_29_0.yj_speed = gui.text_input(gui.control_id("aab_yj_spd"))
slot_0_29_0.yj_speed.placeholder = "50"
slot_0_29_0.spin_val = gui.text_input(gui.control_id("aab_spin_val"))
slot_0_29_0.spin_val.placeholder = "0 or 1,2"
slot_0_29_0.spin_random = gui.checkbox(gui.control_id("aab_spin_rand"))
slot_0_29_0.spin_rand_min = gui.text_input(gui.control_id("aab_spin_rmin"))
slot_0_29_0.spin_rand_min.placeholder = "0"
slot_0_29_0.spin_rand_max = gui.text_input(gui.control_id("aab_spin_rmax"))
slot_0_29_0.spin_rand_max.placeholder = "100"
slot_0_29_0.spin_speed = gui.text_input(gui.control_id("aab_spin_spd"))
slot_0_29_0.spin_speed.placeholder = "50"
slot_0_29_0.jit_dis = gui.combo_box(gui.control_id("aab_jit_dis"))
slot_0_29_0.jit_dis.allow_multiple = true

slot_0_29_0.jit_dis:add(gui.selectable(gui.control_id("aab_jd_1"), "Yaw Change"))
slot_0_29_0.jit_dis:add(gui.selectable(gui.control_id("aab_jd_2"), "Angle Override"))

slot_0_29_0.hide_shot = gui.checkbox(gui.control_id("aab_hide_shot"))
slot_0_29_0.dmg_duration = gui.text_input(gui.control_id("aab_dmg_dur"))
slot_0_29_0.dmg_duration.placeholder = "64"
slot_0_29_0.shot_duration = gui.text_input(gui.control_id("aab_shot_dur"))
slot_0_29_0.shot_duration.placeholder = "32"
slot_0_29_0.pitch_shot_dur = gui.text_input(gui.control_id("aab_pitch_shot_dur"))
slot_0_29_0.pitch_shot_dur.placeholder = "32"
slot_0_29_0.yaw_shot_dur = gui.text_input(gui.control_id("aab_yaw_shot_dur"))
slot_0_29_0.yaw_shot_dur.placeholder = "32"
slot_0_29_0.spin_shot_dur = gui.text_input(gui.control_id("aab_spin_shot_dur"))
slot_0_29_0.spin_shot_dur.placeholder = "32"
slot_0_29_0.ticks_enable = gui.checkbox(gui.control_id("aab_ticks_en"))
slot_0_29_0.ticks_cond = gui.combo_box(gui.control_id("aab_ticks_cond"))

slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_0"), "Default"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_1"), "Standing"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_2"), "Moving"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_3"), "Slow Walk"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_4"), "Air"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_5"), "Air + Ctrl"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_6"), "Crouch"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_7"), "On Damage"))
slot_0_29_0.ticks_cond:add(gui.selectable(gui.control_id("aab_tcond_8"), "On Shot"))

slot_0_29_0.ticks_cond_enable = gui.checkbox(gui.control_id("aab_ticks_cond_en"))
slot_0_29_0.ticks_count = gui.text_input(gui.control_id("aab_ticks_cnt"))
slot_0_29_0.ticks_count.placeholder = "4"
slot_0_29_0.ticks_current = gui.text_input(gui.control_id("aab_ticks_cur"))
slot_0_29_0.ticks_current.placeholder = "1"
slot_0_29_0.ticks_pitch_mode = gui.combo_box(gui.control_id("aab_ticks_pm"))

slot_0_29_0.ticks_pitch_mode:add(gui.selectable(gui.control_id("aab_tpm_1"), "None"))
slot_0_29_0.ticks_pitch_mode:add(gui.selectable(gui.control_id("aab_tpm_2"), "Down"))
slot_0_29_0.ticks_pitch_mode:add(gui.selectable(gui.control_id("aab_tpm_3"), "Up"))
slot_0_29_0.ticks_pitch_mode:add(gui.selectable(gui.control_id("aab_tpm_4"), "Zero"))
slot_0_29_0.ticks_pitch_mode:add(gui.selectable(gui.control_id("aab_tpm_5"), "Custom"))

slot_0_29_0.ticks_pitch = gui.text_input(gui.control_id("aab_ticks_pitch"))
slot_0_29_0.ticks_pitch.placeholder = "89"
slot_0_29_0.ticks_pitch_jitter = gui.text_input(gui.control_id("aab_ticks_pj"))
slot_0_29_0.ticks_pitch_jitter.placeholder = "0"
slot_0_29_0.ticks_yaw_jitter = gui.text_input(gui.control_id("aab_ticks_yj"))
slot_0_29_0.ticks_yaw_jitter.placeholder = "0"
slot_0_29_0.ticks_spin = gui.text_input(gui.control_id("aab_ticks_spin"))
slot_0_29_0.ticks_spin.placeholder = "0"
slot_0_29_0.ticks_yaw_mode = gui.combo_box(gui.control_id("aab_ticks_ym"))

slot_0_29_0.ticks_yaw_mode:add(gui.selectable(gui.control_id("aab_tym_1"), "None"))
slot_0_29_0.ticks_yaw_mode:add(gui.selectable(gui.control_id("aab_tym_2"), "Backwards"))
slot_0_29_0.ticks_yaw_mode:add(gui.selectable(gui.control_id("aab_tym_3"), "Custom"))

slot_0_29_0.ticks_yaw_base = gui.combo_box(gui.control_id("aab_ticks_yb"))

slot_0_29_0.ticks_yaw_base:add(gui.selectable(gui.control_id("aab_tyb_1"), "Viewangles"))
slot_0_29_0.ticks_yaw_base:add(gui.selectable(gui.control_id("aab_tyb_2"), "At Target"))

slot_0_29_0.ticks_pj_mode = gui.combo_box(gui.control_id("aab_ticks_pjm"))

slot_0_29_0.ticks_pj_mode:add(gui.selectable(gui.control_id("aab_tpjm_1"), "None"))
slot_0_29_0.ticks_pj_mode:add(gui.selectable(gui.control_id("aab_tpjm_2"), "Center"))
slot_0_29_0.ticks_pj_mode:add(gui.selectable(gui.control_id("aab_tpjm_3"), "Offset"))

slot_0_29_0.ticks_yj_mode = gui.combo_box(gui.control_id("aab_ticks_yjm"))

slot_0_29_0.ticks_yj_mode:add(gui.selectable(gui.control_id("aab_tyjm_1"), "None"))
slot_0_29_0.ticks_yj_mode:add(gui.selectable(gui.control_id("aab_tyjm_2"), "Center"))
slot_0_29_0.ticks_yj_mode:add(gui.selectable(gui.control_id("aab_tyjm_3"), "Offset"))

slot_0_29_0.ticks_rand_pitch = gui.checkbox(gui.control_id("aab_ticks_rp"))
slot_0_29_0.ticks_rand_pitch_min = gui.text_input(gui.control_id("aab_ticks_rpmin"))
slot_0_29_0.ticks_rand_pitch_min.placeholder = "80"
slot_0_29_0.ticks_rand_pitch_max = gui.text_input(gui.control_id("aab_ticks_rpmax"))
slot_0_29_0.ticks_rand_pitch_max.placeholder = "89"
slot_0_29_0.ticks_rand_yj = gui.checkbox(gui.control_id("aab_ticks_ryj"))
slot_0_29_0.ticks_rand_yj_min = gui.text_input(gui.control_id("aab_ticks_ryjmin"))
slot_0_29_0.ticks_rand_yj_min.placeholder = "0"
slot_0_29_0.ticks_rand_yj_max = gui.text_input(gui.control_id("aab_ticks_ryjmax"))
slot_0_29_0.ticks_rand_yj_max.placeholder = "30"
slot_0_29_0.ticks_rand_spin = gui.checkbox(gui.control_id("aab_ticks_rspin"))
slot_0_29_0.ticks_rand_spin_min = gui.text_input(gui.control_id("aab_ticks_rspinmin"))
slot_0_29_0.ticks_rand_spin_min.placeholder = "0"
slot_0_29_0.ticks_rand_spin_max = gui.text_input(gui.control_id("aab_ticks_rspinmax"))
slot_0_29_0.ticks_rand_spin_max.placeholder = "100"
slot_0_29_0.ticks_copy = gui.button(gui.control_id("aab_ticks_copy"), "Copy Tick")
slot_0_29_0.ticks_paste = gui.button(gui.control_id("aab_ticks_paste"), "Paste Tick")
slot_0_29_0.ticks_reset = gui.button(gui.control_id("aab_ticks_reset"), "Reset Tick")
slot_0_29_0.preset_mode = gui.checkbox(gui.control_id("aab_preset_mode"))
slot_0_29_0.preset_name = gui.text_input(gui.control_id("aab_preset_name"))
slot_0_29_0.preset_name.placeholder = "1"
slot_0_29_0.preset_value = gui.text_input(gui.control_id("aab_preset_value"))
slot_0_29_0.preset_value.placeholder = "89"
slot_0_29_0.preset_add = gui.button(gui.control_id("aab_preset_add"), "Add Preset")
slot_0_29_0.preset_list = gui.combo_box(gui.control_id("aab_preset_list"))
slot_0_29_0.preset_del = gui.button(gui.control_id("aab_preset_del"), "Delete Preset")
slot_0_29_0.cfg_name = gui.text_input(gui.control_id("aab_cfg_name"))
slot_0_29_0.cfg_name.placeholder = "Config Name"
slot_0_29_0.cfg_list = gui.combo_box(gui.control_id("aab_cfg_list"))
slot_0_29_0.cfg_save = gui.button(gui.control_id("aab_cfg_save"), "Save Config")
slot_0_29_0.cfg_load = gui.button(gui.control_id("aab_cfg_load"), "Load Config")
slot_0_29_0.cfg_del = gui.button(gui.control_id("aab_cfg_del"), "Delete Config")
slot_0_29_0.copy_cond = gui.button(gui.control_id("aab_copy_cond"), "Copy Condition")
slot_0_29_0.paste_cond = gui.button(gui.control_id("aab_paste_cond"), "Paste Condition")
slot_0_29_0.export_btn = gui.button(gui.control_id("aab_export"), "Export Condition")
slot_0_29_0.import_btn = gui.button(gui.control_id("aab_import"), "Import Condition")
slot_0_29_0.export_full_btn = gui.button(gui.control_id("aab_export_full"), "Export Full Config")
slot_0_29_0.import_full_btn = gui.button(gui.control_id("aab_import_full"), "Import Full Config")
slot_0_29_0.reset_btn = gui.button(gui.control_id("aab_reset"), "Reset")
slot_0_29_0.discord = gui.button(gui.control_id("aab_discord"), "Discord")
slot_0_29_0.hud = gui.checkbox(gui.control_id("aab_hud"))
slot_0_29_0.enable.tooltip = "Enable AA Builder - overrides anti-aim settings based on conditions"
slot_0_29_0.tab.tooltip = "Select settings tab"
slot_0_29_0.cond.tooltip = "Default = always works. Override conditions replace Default when enabled"
slot_0_29_0.override_enable.tooltip = "Enable this override condition to replace Default"
slot_0_29_0.pitch_val.tooltip = "Pitch value. Use number (89) or sequence (1,2,3) referencing presets"
slot_0_29_0.pitch_random.tooltip = "Randomize pitch between sequence values"
slot_0_29_0.pitch_speed.tooltip = "Speed of value changes (1-100, higher = faster)"
slot_0_29_0.pj_mode.tooltip = "Pitch Jitter mode: None, Center, or Offset"
slot_0_29_0.pj_3way.tooltip = "Enable 3-way pitch jitter"
slot_0_29_0.pj_val.tooltip = "Pitch Jitter value. Use number or sequence"
slot_0_29_0.pj_random.tooltip = "Randomize pitch jitter between sequence values"
slot_0_29_0.pj_speed.tooltip = "Speed of pitch jitter changes"
slot_0_29_0.yaw_mode.tooltip = "Yaw mode: None, Backwards, or Custom"
slot_0_29_0.yaw_base.tooltip = "Yaw base: Viewangles or At Target"
slot_0_29_0.yj_mode.tooltip = "Yaw Jitter mode: None, Center, or Offset"
slot_0_29_0.yj_3way.tooltip = "Enable 3-way yaw jitter"
slot_0_29_0.yj_val.tooltip = "Yaw Jitter amount. Use number or sequence"
slot_0_29_0.yj_random.tooltip = "Randomize yaw jitter between sequence values"
slot_0_29_0.yj_speed.tooltip = "Speed of yaw jitter changes"
slot_0_29_0.spin_val.tooltip = "Spin amount. Use number or sequence"
slot_0_29_0.spin_random.tooltip = "Randomize spin between sequence values"
slot_0_29_0.spin_speed.tooltip = "Speed of spin changes"
slot_0_29_0.jit_dis.tooltip = "Jitter Disabler: None, Yaw Change, or Angle Override"
slot_0_29_0.hide_shot.tooltip = "Enable Hide Shot (desync on shot)"
slot_0_29_0.dmg_duration.tooltip = "Duration in ticks to use On Damage AA after being hit (64 ticks = ~1 sec)"
slot_0_29_0.shot_duration.tooltip = "Duration in ticks to use On Shot AA after shooting (32 ticks = ~0.5 sec)"
slot_0_29_0.ticks_enable.tooltip = "Enable Ticks Builder - cycle through tick settings"
slot_0_29_0.ticks_cond.tooltip = "Default = always works. Override conditions replace Default when enabled"
slot_0_29_0.ticks_cond_enable.tooltip = "Enable this override condition (Default always works)"
slot_0_29_0.ticks_count.tooltip = "Number of ticks in sequence"
slot_0_29_0.ticks_current.tooltip = "Select tick to edit"
slot_0_29_0.ticks_pitch.tooltip = "Pitch value for this tick"
slot_0_29_0.ticks_pitch_jitter.tooltip = "Pitch jitter value for this tick"
slot_0_29_0.ticks_yaw_jitter.tooltip = "Yaw jitter value for this tick"
slot_0_29_0.ticks_spin.tooltip = "Spin amount for this tick"
slot_0_29_0.ticks_yaw_mode.tooltip = "Yaw mode for this tick"
slot_0_29_0.ticks_yaw_base.tooltip = "Yaw base for this tick"
slot_0_29_0.ticks_pj_mode.tooltip = "Pitch jitter mode for this tick"
slot_0_29_0.ticks_yj_mode.tooltip = "Yaw jitter mode for this tick"
slot_0_29_0.ticks_rand_pitch.tooltip = "Randomize pitch for this tick"
slot_0_29_0.ticks_rand_yj.tooltip = "Randomize yaw jitter for this tick"
slot_0_29_0.ticks_rand_spin.tooltip = "Randomize spin for this tick"
slot_0_29_0.ticks_copy.tooltip = "Copy current tick settings"
slot_0_29_0.ticks_paste.tooltip = "Paste copied tick settings"
slot_0_29_0.ticks_reset.tooltip = "Reset current tick to defaults"
slot_0_29_0.preset_mode.tooltip = "When ON: 1,2,3 = presets. When OFF: 1,2,3 = numbers"
slot_0_29_0.preset_name.tooltip = "Preset name/number (e.g. 1, 2, mypreset)"
slot_0_29_0.preset_value.tooltip = "Value to store in this preset"
slot_0_29_0.preset_add.tooltip = "Add or update preset with current name and value"
slot_0_29_0.preset_list.tooltip = "List of saved presets"
slot_0_29_0.preset_del.tooltip = "Delete selected preset"
slot_0_29_0.cfg_name.tooltip = "Name for new config"
slot_0_29_0.cfg_list.tooltip = "List of saved configs"
slot_0_29_0.cfg_save.tooltip = "Save current settings to config with specified name"
slot_0_29_0.cfg_load.tooltip = "Load selected config"
slot_0_29_0.cfg_del.tooltip = "Delete selected config"
slot_0_29_0.copy_cond.tooltip = "Copy current condition settings to memory"
slot_0_29_0.paste_cond.tooltip = "Paste copied condition settings"
slot_0_29_0.export_btn.tooltip = "Export current condition to clipboard (AAB5: format)"
slot_0_29_0.import_btn.tooltip = "Import condition from clipboard (AAB5: format)"
slot_0_29_0.export_full_btn.tooltip = "Export FULL config to clipboard (AABFULL: format)"
slot_0_29_0.import_full_btn.tooltip = "Import FULL config from clipboard"
slot_0_29_0.reset_btn.tooltip = "Reset current condition to defaults"
slot_0_29_0.discord.tooltip = "Open Discord server"
slot_0_29_0.hud.tooltip = "Show HUD with current AA values"

function slot_0_31_0(arg_59_0)
        if arg_59_0 then
                local var_59_0 = arg_59_0:get_value()

                if var_59_0 and var_59_0.get then
                        return var_59_0:get()
                end
        end

        return false
end

function slot_0_32_0(arg_60_0, arg_60_1)
        if arg_60_0 then
                arg_60_0:set_value(arg_60_1 or false)
        end
end

function slot_0_30_0(arg_61_0)
        if arg_61_0 then
                local var_61_0 = arg_61_0:get_value()

                if var_61_0 and var_61_0.get then
                        local var_61_1 = var_61_0:get()

                        if var_61_1 and var_61_1.get_raw then
                                return var_61_1:get_raw()
                        end
                end
        end

        return 0
end

function slot_0_89_0(arg_62_0, arg_62_1)
        if arg_62_0 and arg_62_1 then
                local var_62_0 = arg_62_0:get_value()

                if var_62_0 and var_62_0.get then
                        local var_62_1 = var_62_0:get()

                        if var_62_1 and var_62_1.set_raw then
                                var_62_1:set_raw(arg_62_1)
                                var_62_0:set(var_62_1)
                        end
                end
        end
end

function slot_0_33_0(arg_63_0)
        if arg_63_0 then
                return arg_63_0.value or ""
        end

        return ""
end

function slot_0_90_0(arg_64_0, arg_64_1)
        if arg_64_0 then
                arg_64_0:set_value(tostring(arg_64_1 or ""))
        end
end

function slot_0_91_0(arg_65_0, arg_65_1)
        return tonumber(slot_0_33_0(arg_65_0)) or arg_65_1
end

function slot_0_34_0(arg_66_0)
        if arg_66_0 == 1 then
                return "default"
        elseif arg_66_0 == 2 then
                return "standing"
        elseif arg_66_0 == 4 then
                return "moving"
        elseif arg_66_0 == 8 then
                return "slowwalk"
        elseif arg_66_0 == 16 then
                return "air"
        elseif arg_66_0 == 32 then
                return "air_ctrl"
        elseif arg_66_0 == 64 then
                return "crouch"
        elseif arg_66_0 == 128 then
                return "on_damage"
        elseif arg_66_0 == 256 then
                return "on_shot"
        end

        return "default"
end

function slot_0_92_0()
        return game.global_vars.tick_count or 0
end

function slot_0_93_0()
        local var_68_0 = entities.get_local_pawn()

        if var_68_0 and var_68_0:is_alive() then
                return var_68_0
        end

        return nil
end

function slot_0_94_0()
        local var_69_0 = slot_0_93_0()

        if not var_69_0 then
                return "standing"
        end

        local var_69_1 = var_69_0.m_fFlags:get()
        local var_69_2 = var_69_0:get_abs_velocity()
        local var_69_3 = math.sqrt(var_69_2.x * var_69_2.x + var_69_2.y * var_69_2.y)
        local var_69_4 = bit.band(var_69_1, 1) ~= 0
        local var_69_5 = bit.band(var_69_1, 2) ~= 0

        if not var_69_4 then
                return var_69_5 and "air_ctrl" or "air"
        end

        if var_69_5 then
                return "crouch"
        end

        local var_69_6 = false

        if gui.input and gui.input.is_key_down then
                var_69_6 = gui.input:is_key_down(16)
        end

        if var_69_6 and var_69_3 > 5 then
                return "slowwalk"
        end

        if var_69_3 > 10 then
                return "moving"
        end

        return "standing"
end

function slot_0_95_0(arg_70_0)
        local var_70_0 = gui.ctx:find(arg_70_0)

        if var_70_0 and var_70_0.get_value then
                local var_70_1 = var_70_0:get_value()

                if var_70_1 and var_70_1.get then
                        return var_70_1:get()
                end
        end

        return nil
end

function slot_0_96_0(arg_71_0, arg_71_1)
        if arg_71_1 == nil then
                return
        end

        local var_71_0 = gui.ctx:find(arg_71_0)

        if not var_71_0 then
                return
        end

        if var_71_0.get_value then
                local var_71_1 = var_71_0:get_value()

                if var_71_1 and var_71_1.set then
                        var_71_1:set(arg_71_1)
                end
        end
end

function slot_0_97_0(arg_72_0)
        local var_72_0 = gui.ctx:find(arg_72_0)

        if var_72_0 and var_72_0.get_value then
                local var_72_1 = var_72_0:get_value()

                if var_72_1 and var_72_1.get then
                        local var_72_2 = var_72_1:get()

                        if var_72_2 and var_72_2.get_raw then
                                return var_72_2:get_raw()
                        end
                end
        end

        return nil
end

function slot_0_98_0(arg_73_0, arg_73_1)
        if arg_73_1 == nil then
                return
        end

        local var_73_0 = gui.ctx:find(arg_73_0)

        if not var_73_0 then
                return
        end

        if var_73_0.get_value then
                local var_73_1 = var_73_0:get_value()

                if var_73_1 and var_73_1.get then
                        local var_73_2 = var_73_1:get()

                        if var_73_2 and var_73_2.set_raw then
                                var_73_2:set_raw(arg_73_1)
                                var_73_1:set(var_73_2)

                                if var_73_0.reset then
                                        var_73_0:reset()
                                end
                        end
                end
        end
end

function slot_0_99_0(arg_74_0, arg_74_1)
        local var_74_0 = gui.ctx:find(arg_74_0)

        if not var_74_0 then
                return
        end

        if var_74_0.set_value then
                var_74_0:set_value(arg_74_1 or false)
        elseif var_74_0.get_value then
                local var_74_1 = var_74_0:get_value()

                if var_74_1 and var_74_1.set then
                        var_74_1:set(arg_74_1 or false)
                end
        end
end

function slot_0_100_0(arg_75_0)
        local var_75_0 = gui.ctx:find(arg_75_0)

        if var_75_0 and var_75_0.get_value then
                local var_75_1 = var_75_0:get_value()

                if var_75_1 and var_75_1.get then
                        return var_75_1:get()
                end
        end

        return false
end

function slot_0_101_0()
        if slot_0_80_0 then
                return
        end

        slot_0_79_0.pitch_mode = slot_0_97_0(slot_0_21_0.pitch_mode)
        slot_0_79_0.pitch_value = slot_0_95_0(slot_0_21_0.pitch)
        slot_0_79_0.yaw = slot_0_97_0(slot_0_21_0.yaw)
        slot_0_79_0.yaw_base = slot_0_97_0(slot_0_21_0.yaw_base)
        slot_0_79_0.spin = slot_0_95_0(slot_0_21_0.spin)
        slot_0_79_0.pitch_jitter = slot_0_97_0(slot_0_21_0.pitch_jitter)
        slot_0_79_0.pitch_jitter_val = slot_0_95_0(slot_0_21_0.pitch_jitter_val)
        slot_0_79_0.yaw_jitter = slot_0_97_0(slot_0_21_0.yaw_jitter)
        slot_0_79_0.yaw_jitter_val = slot_0_95_0(slot_0_21_0.yaw_jitter_val)
        slot_0_79_0.jitter_dis = slot_0_97_0(slot_0_21_0.jitter_disabler)
        slot_0_79_0.hide_shot = slot_0_100_0(slot_0_21_0.hide_shot)
        slot_0_79_0.pitch_jitter_3way = slot_0_100_0(slot_0_21_0.pitch_jitter_3way)
        slot_0_79_0.yaw_jitter_3way = slot_0_100_0(slot_0_21_0.yaw_jitter_3way)
        slot_0_80_0 = true
end

function slot_0_102_0()
        if not slot_0_80_0 then
                return
        end

        if slot_0_79_0.pitch_mode then
                slot_0_98_0(slot_0_21_0.pitch_mode, slot_0_79_0.pitch_mode)
        end

        if slot_0_79_0.pitch_value then
                slot_0_96_0(slot_0_21_0.pitch, slot_0_79_0.pitch_value)
        end

        if slot_0_79_0.yaw then
                slot_0_98_0(slot_0_21_0.yaw, slot_0_79_0.yaw)
        end

        if slot_0_79_0.yaw_base then
                slot_0_98_0(slot_0_21_0.yaw_base, slot_0_79_0.yaw_base)
        end

        if slot_0_79_0.spin then
                slot_0_96_0(slot_0_21_0.spin, slot_0_79_0.spin)
        end

        if slot_0_79_0.pitch_jitter then
                slot_0_98_0(slot_0_21_0.pitch_jitter, slot_0_79_0.pitch_jitter)
        end

        if slot_0_79_0.pitch_jitter_val then
                slot_0_96_0(slot_0_21_0.pitch_jitter_val, slot_0_79_0.pitch_jitter_val)
        end

        if slot_0_79_0.yaw_jitter then
                slot_0_98_0(slot_0_21_0.yaw_jitter, slot_0_79_0.yaw_jitter)
        end

        if slot_0_79_0.yaw_jitter_val then
                slot_0_96_0(slot_0_21_0.yaw_jitter_val, slot_0_79_0.yaw_jitter_val)
        end

        if slot_0_79_0.jitter_dis then
                slot_0_98_0(slot_0_21_0.jitter_disabler, slot_0_79_0.jitter_dis)
        end

        slot_0_99_0(slot_0_21_0.hide_shot, slot_0_79_0.hide_shot or false)
        slot_0_99_0(slot_0_21_0.pitch_jitter_3way, slot_0_79_0.pitch_jitter_3way or false)
        slot_0_99_0(slot_0_21_0.yaw_jitter_3way, slot_0_79_0.yaw_jitter_3way or false)

        slot_0_80_0 = false
end

slot_0_103_0 = 0

function slot_0_38_0(arg_78_0)
        local var_78_0 = slot_0_23_0.conditions[arg_78_0]

        if not var_78_0 then
                return
        end

        if arg_78_0 ~= "default" then
                var_78_0.override_enabled = slot_0_31_0(slot_0_29_0.override_enable)
        end

        var_78_0.pitch_val = slot_0_33_0(slot_0_29_0.pitch_val) or "89"
        var_78_0.pitch_random = slot_0_31_0(slot_0_29_0.pitch_random)
        var_78_0.pitch_rand_min = slot_0_33_0(slot_0_29_0.pitch_rand_min) or "80"
        var_78_0.pitch_rand_max = slot_0_33_0(slot_0_29_0.pitch_rand_max) or "89"
        var_78_0.pitch_speed = slot_0_91_0(slot_0_29_0.pitch_speed, 50)
        var_78_0.pj_mode = slot_0_30_0(slot_0_29_0.pj_mode)
        var_78_0.pj_3way = slot_0_31_0(slot_0_29_0.pj_3way)
        var_78_0.pj_val = slot_0_33_0(slot_0_29_0.pj_val) or "0"
        var_78_0.pj_random = slot_0_31_0(slot_0_29_0.pj_random)
        var_78_0.pj_rand_min = slot_0_33_0(slot_0_29_0.pj_rand_min) or "0"
        var_78_0.pj_rand_max = slot_0_33_0(slot_0_29_0.pj_rand_max) or "30"
        var_78_0.pj_speed = slot_0_91_0(slot_0_29_0.pj_speed, 50)

        local var_78_1 = slot_0_30_0(slot_0_29_0.yaw_mode)

        if var_78_1 > 0 then
                var_78_0.yaw_mode = var_78_1
        end

        local var_78_2 = slot_0_30_0(slot_0_29_0.yaw_base)

        if var_78_2 > 0 then
                var_78_0.yaw_base = var_78_2
        end

        var_78_0.yj_mode = slot_0_30_0(slot_0_29_0.yj_mode)
        var_78_0.yj_3way = slot_0_31_0(slot_0_29_0.yj_3way)
        var_78_0.yj_val = slot_0_33_0(slot_0_29_0.yj_val) or "0"
        var_78_0.yj_random = slot_0_31_0(slot_0_29_0.yj_random)
        var_78_0.yj_rand_min = slot_0_33_0(slot_0_29_0.yj_rand_min) or "0"
        var_78_0.yj_rand_max = slot_0_33_0(slot_0_29_0.yj_rand_max) or "30"
        var_78_0.yj_speed = slot_0_91_0(slot_0_29_0.yj_speed, 50)
        var_78_0.spin_val = slot_0_33_0(slot_0_29_0.spin_val) or "0"
        var_78_0.spin_random = slot_0_31_0(slot_0_29_0.spin_random)
        var_78_0.spin_rand_min = slot_0_33_0(slot_0_29_0.spin_rand_min) or "0"
        var_78_0.spin_rand_max = slot_0_33_0(slot_0_29_0.spin_rand_max) or "100"
        var_78_0.spin_speed = slot_0_91_0(slot_0_29_0.spin_speed, 50)
        var_78_0.jitter_dis = slot_0_30_0(slot_0_29_0.jit_dis)
        var_78_0.hide_shot = slot_0_31_0(slot_0_29_0.hide_shot)
        var_78_0.dmg_duration = slot_0_91_0(slot_0_29_0.dmg_duration, 64)
        var_78_0.shot_duration = slot_0_91_0(slot_0_29_0.shot_duration, 32)
        var_78_0.pitch_shot_dur = slot_0_91_0(slot_0_29_0.pitch_shot_dur, 32)
        var_78_0.yaw_shot_dur = slot_0_91_0(slot_0_29_0.yaw_shot_dur, 32)
        var_78_0.spin_shot_dur = slot_0_91_0(slot_0_29_0.spin_shot_dur, 32)
end

function slot_0_35_0(arg_79_0)
        local var_79_0 = slot_0_23_0.conditions[arg_79_0]

        if not var_79_0 then
                return
        end

        if arg_79_0 ~= "default" then
                slot_0_32_0(slot_0_29_0.override_enable, var_79_0.override_enabled or false)
        end

        slot_0_90_0(slot_0_29_0.pitch_val, var_79_0.pitch_val or "89")
        slot_0_32_0(slot_0_29_0.pitch_random, var_79_0.pitch_random)
        slot_0_90_0(slot_0_29_0.pitch_rand_min, var_79_0.pitch_rand_min or "80")
        slot_0_90_0(slot_0_29_0.pitch_rand_max, var_79_0.pitch_rand_max or "89")
        slot_0_90_0(slot_0_29_0.pitch_speed, var_79_0.pitch_speed or 50)
        slot_0_89_0(slot_0_29_0.pj_mode, var_79_0.pj_mode or 1)
        slot_0_32_0(slot_0_29_0.pj_3way, var_79_0.pj_3way)
        slot_0_90_0(slot_0_29_0.pj_val, var_79_0.pj_val or "0")
        slot_0_32_0(slot_0_29_0.pj_random, var_79_0.pj_random)
        slot_0_90_0(slot_0_29_0.pj_rand_min, var_79_0.pj_rand_min or "0")
        slot_0_90_0(slot_0_29_0.pj_rand_max, var_79_0.pj_rand_max or "30")
        slot_0_90_0(slot_0_29_0.pj_speed, var_79_0.pj_speed or 50)
        slot_0_89_0(slot_0_29_0.yaw_mode, var_79_0.yaw_mode or 2)
        slot_0_89_0(slot_0_29_0.yaw_base, var_79_0.yaw_base or 2)
        slot_0_89_0(slot_0_29_0.yj_mode, var_79_0.yj_mode or 1)
        slot_0_32_0(slot_0_29_0.yj_3way, var_79_0.yj_3way)
        slot_0_90_0(slot_0_29_0.yj_val, var_79_0.yj_val or "0")
        slot_0_32_0(slot_0_29_0.yj_random, var_79_0.yj_random)
        slot_0_90_0(slot_0_29_0.yj_rand_min, var_79_0.yj_rand_min or "0")
        slot_0_90_0(slot_0_29_0.yj_rand_max, var_79_0.yj_rand_max or "30")
        slot_0_90_0(slot_0_29_0.yj_speed, var_79_0.yj_speed or 50)
        slot_0_90_0(slot_0_29_0.spin_val, var_79_0.spin_val or "0")
        slot_0_32_0(slot_0_29_0.spin_random, var_79_0.spin_random)
        slot_0_90_0(slot_0_29_0.spin_rand_min, var_79_0.spin_rand_min or "0")
        slot_0_90_0(slot_0_29_0.spin_rand_max, var_79_0.spin_rand_max or "100")
        slot_0_90_0(slot_0_29_0.spin_speed, var_79_0.spin_speed or 50)
        slot_0_89_0(slot_0_29_0.jit_dis, var_79_0.jitter_dis or 1)
        slot_0_32_0(slot_0_29_0.hide_shot, var_79_0.hide_shot)
        slot_0_90_0(slot_0_29_0.dmg_duration, var_79_0.dmg_duration or 64)
        slot_0_90_0(slot_0_29_0.shot_duration, var_79_0.shot_duration or 32)
        slot_0_90_0(slot_0_29_0.pitch_shot_dur, var_79_0.pitch_shot_dur or 32)
        slot_0_90_0(slot_0_29_0.yaw_shot_dur, var_79_0.yaw_shot_dur or 32)
        slot_0_90_0(slot_0_29_0.spin_shot_dur, var_79_0.spin_shot_dur or 32)
end

function slot_0_104_0(arg_80_0)
        slot_80_1_0 = {}

        table.insert(slot_80_1_0, "oe=" .. (arg_80_0.override_enabled and "1" or "0"))
        table.insert(slot_80_1_0, "pv=" .. (arg_80_0.pitch_val or "89"))
        table.insert(slot_80_1_0, "pr=" .. (arg_80_0.pitch_random and "1" or "0"))
        table.insert(slot_80_1_0, "prmin=" .. (arg_80_0.pitch_rand_min or "80"))
        table.insert(slot_80_1_0, "prmax=" .. (arg_80_0.pitch_rand_max or "89"))
        table.insert(slot_80_1_0, "ps=" .. (arg_80_0.pitch_speed or 50))
        table.insert(slot_80_1_0, "pjv=" .. (arg_80_0.pj_val or "0"))
        table.insert(slot_80_1_0, "pjr=" .. (arg_80_0.pj_random and "1" or "0"))
        table.insert(slot_80_1_0, "pjrmin=" .. (arg_80_0.pj_rand_min or "0"))
        table.insert(slot_80_1_0, "pjrmax=" .. (arg_80_0.pj_rand_max or "30"))
        table.insert(slot_80_1_0, "pjmd=" .. (arg_80_0.pj_mode or 0))
        table.insert(slot_80_1_0, "pj3=" .. (arg_80_0.pj_3way and "1" or "0"))
        table.insert(slot_80_1_0, "pjs=" .. (arg_80_0.pj_speed or 50))
        table.insert(slot_80_1_0, "ym=" .. (arg_80_0.yaw_mode or 2))
        table.insert(slot_80_1_0, "yb=" .. (arg_80_0.yaw_base or 2))
        table.insert(slot_80_1_0, "yjv=" .. (arg_80_0.yj_val or "0"))
        table.insert(slot_80_1_0, "yjr=" .. (arg_80_0.yj_random and "1" or "0"))
        table.insert(slot_80_1_0, "yjrmin=" .. (arg_80_0.yj_rand_min or "0"))
        table.insert(slot_80_1_0, "yjrmax=" .. (arg_80_0.yj_rand_max or "30"))
        table.insert(slot_80_1_0, "yjmd=" .. (arg_80_0.yj_mode or 0))
        table.insert(slot_80_1_0, "yj3=" .. (arg_80_0.yj_3way and "1" or "0"))
        table.insert(slot_80_1_0, "yjs=" .. (arg_80_0.yj_speed or 50))
        table.insert(slot_80_1_0, "sv=" .. (arg_80_0.spin_val or "0"))
        table.insert(slot_80_1_0, "sr=" .. (arg_80_0.spin_random and "1" or "0"))
        table.insert(slot_80_1_0, "srmin=" .. (arg_80_0.spin_rand_min or "0"))
        table.insert(slot_80_1_0, "srmax=" .. (arg_80_0.spin_rand_max or "100"))
        table.insert(slot_80_1_0, "ss=" .. (arg_80_0.spin_speed or 50))
        table.insert(slot_80_1_0, "jd=" .. (arg_80_0.jitter_dis or 0))
        table.insert(slot_80_1_0, "hs=" .. (arg_80_0.hide_shot and "1" or "0"))
        table.insert(slot_80_1_0, "dd=" .. (arg_80_0.dmg_duration or 64))
        table.insert(slot_80_1_0, "sd=" .. (arg_80_0.shot_duration or 32))

        return table.concat(slot_80_1_0, "|")
end

function slot_0_105_0(arg_81_0)
        local var_81_0 = slot_0_70_0()

        var_81_0.override_enabled = string.match(arg_81_0, "oe=1") ~= nil
        var_81_0.pitch_val = string.match(arg_81_0, "pv=([^|]+)") or "89"
        var_81_0.pitch_random = string.match(arg_81_0, "pr=1") ~= nil
        var_81_0.pitch_rand_min = string.match(arg_81_0, "prmin=([^|]+)") or "80"
        var_81_0.pitch_rand_max = string.match(arg_81_0, "prmax=([^|]+)") or "89"
        var_81_0.pitch_speed = tonumber(string.match(arg_81_0, "ps=([^|]+)")) or 50
        var_81_0.pj_val = string.match(arg_81_0, "pjv=([^|]+)") or "0"
        var_81_0.pj_random = string.match(arg_81_0, "pjr=1") ~= nil
        var_81_0.pj_rand_min = string.match(arg_81_0, "pjrmin=([^|]+)") or "0"
        var_81_0.pj_rand_max = string.match(arg_81_0, "pjrmax=([^|]+)") or "30"
        var_81_0.pj_mode = tonumber(string.match(arg_81_0, "pjmd=([^|]+)")) or 1
        var_81_0.pj_3way = string.match(arg_81_0, "pj3=1") ~= nil
        var_81_0.pj_speed = tonumber(string.match(arg_81_0, "pjs=([^|]+)")) or 50
        var_81_0.yaw_mode = tonumber(string.match(arg_81_0, "ym=([^|]+)")) or 2
        var_81_0.yaw_base = tonumber(string.match(arg_81_0, "yb=([^|]+)")) or 2
        var_81_0.yj_val = string.match(arg_81_0, "yjv=([^|]+)") or "0"
        var_81_0.yj_random = string.match(arg_81_0, "yjr=1") ~= nil
        var_81_0.yj_rand_min = string.match(arg_81_0, "yjrmin=([^|]+)") or "0"
        var_81_0.yj_rand_max = string.match(arg_81_0, "yjrmax=([^|]+)") or "30"
        var_81_0.yj_mode = tonumber(string.match(arg_81_0, "yjmd=([^|]+)")) or 1
        var_81_0.yj_3way = string.match(arg_81_0, "yj3=1") ~= nil
        var_81_0.yj_speed = tonumber(string.match(arg_81_0, "yjs=([^|]+)")) or 50
        var_81_0.spin_val = string.match(arg_81_0, "sv=([^|]+)") or "0"
        var_81_0.spin_random = string.match(arg_81_0, "sr=1") ~= nil
        var_81_0.spin_rand_min = string.match(arg_81_0, "srmin=([^|]+)") or "0"
        var_81_0.spin_rand_max = string.match(arg_81_0, "srmax=([^|]+)") or "100"
        var_81_0.spin_speed = tonumber(string.match(arg_81_0, "ss=([^|]+)")) or 50
        var_81_0.jitter_dis = tonumber(string.match(arg_81_0, "jd=([^|]+)")) or 1
        var_81_0.hide_shot = string.match(arg_81_0, "hs=1") ~= nil
        var_81_0.dmg_duration = tonumber(string.match(arg_81_0, "dd=([^|]+)")) or 64
        var_81_0.shot_duration = tonumber(string.match(arg_81_0, "sd=([^|]+)")) or 32

        return var_81_0
end

function slot_0_106_0()
        if slot_0_25_0 then
                return
        end

        local var_82_0 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

        slot_0_38_0(var_82_0)
end

function slot_0_107_0()
        if slot_0_29_0.pitch_val then
                slot_0_29_0.pitch_val:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pitch_random then
                slot_0_29_0.pitch_random:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pitch_rand_min then
                slot_0_29_0.pitch_rand_min:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pitch_rand_max then
                slot_0_29_0.pitch_rand_max:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pitch_speed then
                slot_0_29_0.pitch_speed:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pj_mode then
                slot_0_29_0.pj_mode:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pj_3way then
                slot_0_29_0.pj_3way:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pj_val then
                slot_0_29_0.pj_val:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pj_random then
                slot_0_29_0.pj_random:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pj_rand_min then
                slot_0_29_0.pj_rand_min:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pj_rand_max then
                slot_0_29_0.pj_rand_max:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.pj_speed then
                slot_0_29_0.pj_speed:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yaw_mode then
                slot_0_29_0.yaw_mode:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yaw_base then
                slot_0_29_0.yaw_base:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yj_mode then
                slot_0_29_0.yj_mode:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yj_3way then
                slot_0_29_0.yj_3way:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yj_val then
                slot_0_29_0.yj_val:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yj_random then
                slot_0_29_0.yj_random:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yj_rand_min then
                slot_0_29_0.yj_rand_min:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yj_rand_max then
                slot_0_29_0.yj_rand_max:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.yj_speed then
                slot_0_29_0.yj_speed:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.spin_val then
                slot_0_29_0.spin_val:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.spin_random then
                slot_0_29_0.spin_random:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.spin_rand_min then
                slot_0_29_0.spin_rand_min:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.spin_rand_max then
                slot_0_29_0.spin_rand_max:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.spin_speed then
                slot_0_29_0.spin_speed:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.jit_dis then
                slot_0_29_0.jit_dis:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.hide_shot then
                slot_0_29_0.hide_shot:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.override_enable then
                slot_0_29_0.override_enable:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.dmg_duration then
                slot_0_29_0.dmg_duration:add_callback(slot_0_106_0)
        end

        if slot_0_29_0.shot_duration then
                slot_0_29_0.shot_duration:add_callback(slot_0_106_0)
        end
end

function slot_0_37_0()
        for iter_84_0, iter_84_1 in ipairs(slot_0_65_0) do
                slot_0_29_0.preset_list:remove(iter_84_1)
        end

        slot_0_65_0 = {}

        for iter_84_2, iter_84_3 in pairs(slot_0_64_0) do
                local var_84_0 = iter_84_2 .. " = " .. iter_84_3
                local var_84_1 = gui.selectable(gui.control_id("aab_preset_item_" .. iter_84_2), var_84_0)

                slot_0_29_0.preset_list:add(var_84_1)
                table.insert(slot_0_65_0, var_84_1)
        end
end

slot_0_108_0 = {
        enable = gui.make_control("AA Builder", slot_0_29_0.enable)
}

slot_0_87_0:add(slot_0_108_0.enable)
slot_0_87_0:reset()

slot_0_108_0.tab = gui.make_control("Tab", slot_0_29_0.tab)

slot_0_87_0:add(slot_0_108_0.tab)
slot_0_87_0:reset()

slot_0_108_0.discord = gui.make_control("", slot_0_29_0.discord)

slot_0_87_0:add(slot_0_108_0.discord)
slot_0_87_0:reset()

slot_0_108_0.cond = gui.make_control("Condition", slot_0_29_0.cond)

slot_0_87_0:add(slot_0_108_0.cond)
slot_0_87_0:reset()

slot_0_108_0.override_enable = gui.make_control("Override Enabled", slot_0_29_0.override_enable)

slot_0_87_0:add(slot_0_108_0.override_enable)
slot_0_87_0:reset()

slot_0_108_0.pitch_val = gui.make_control("Pitch Value", slot_0_29_0.pitch_val)

slot_0_87_0:add(slot_0_108_0.pitch_val)
slot_0_87_0:reset()

slot_0_108_0.pitch_speed = gui.make_control("Pitch Speed", slot_0_29_0.pitch_speed)

slot_0_87_0:add(slot_0_108_0.pitch_speed)
slot_0_87_0:reset()

slot_0_108_0.pj_val = gui.make_control("Pitch Jitter Value", slot_0_29_0.pj_val)

slot_0_87_0:add(slot_0_108_0.pj_val)
slot_0_87_0:reset()

slot_0_108_0.pj_speed = gui.make_control("Pitch Jitter Speed", slot_0_29_0.pj_speed)

slot_0_87_0:add(slot_0_108_0.pj_speed)
slot_0_87_0:reset()

slot_0_108_0.yj_val = gui.make_control("Yaw Jitter Value", slot_0_29_0.yj_val)

slot_0_87_0:add(slot_0_108_0.yj_val)
slot_0_87_0:reset()

slot_0_108_0.yj_speed = gui.make_control("Yaw Jitter Speed", slot_0_29_0.yj_speed)

slot_0_87_0:add(slot_0_108_0.yj_speed)
slot_0_87_0:reset()

slot_0_108_0.spin_val = gui.make_control("Spin Value", slot_0_29_0.spin_val)

slot_0_87_0:add(slot_0_108_0.spin_val)
slot_0_87_0:reset()

slot_0_108_0.spin_speed = gui.make_control("Spin Speed", slot_0_29_0.spin_speed)

slot_0_87_0:add(slot_0_108_0.spin_speed)
slot_0_87_0:reset()

slot_0_108_0.dmg_duration = gui.make_control("Damage Duration (ticks)", slot_0_29_0.dmg_duration)

slot_0_87_0:add(slot_0_108_0.dmg_duration)
slot_0_87_0:reset()

slot_0_108_0.shot_duration = gui.make_control("Shot Duration (ticks)", slot_0_29_0.shot_duration)

slot_0_87_0:add(slot_0_108_0.shot_duration)
slot_0_87_0:reset()

slot_0_108_0.pitch_shot_dur = gui.make_control("Pitch Shot Dur", slot_0_29_0.pitch_shot_dur)

slot_0_87_0:add(slot_0_108_0.pitch_shot_dur)
slot_0_87_0:reset()

slot_0_108_0.yaw_shot_dur = gui.make_control("Yaw Shot Dur", slot_0_29_0.yaw_shot_dur)

slot_0_87_0:add(slot_0_108_0.yaw_shot_dur)
slot_0_87_0:reset()

slot_0_108_0.spin_shot_dur = gui.make_control("Spin Shot Dur", slot_0_29_0.spin_shot_dur)

slot_0_87_0:add(slot_0_108_0.spin_shot_dur)
slot_0_87_0:reset()

slot_0_108_0.ticks_enable = gui.make_control("Enable Ticks Builder", slot_0_29_0.ticks_enable)

slot_0_87_0:add(slot_0_108_0.ticks_enable)
slot_0_87_0:reset()

slot_0_108_0.ticks_cond = gui.make_control("Condition", slot_0_29_0.ticks_cond)

slot_0_87_0:add(slot_0_108_0.ticks_cond)
slot_0_87_0:reset()

slot_0_108_0.ticks_cond_enable = gui.make_control("Condition Enabled", slot_0_29_0.ticks_cond_enable)

slot_0_87_0:add(slot_0_108_0.ticks_cond_enable)
slot_0_87_0:reset()

slot_0_108_0.ticks_count = gui.make_control("Tick Count", slot_0_29_0.ticks_count)

slot_0_87_0:add(slot_0_108_0.ticks_count)
slot_0_87_0:reset()

slot_0_108_0.ticks_current = gui.make_control("Edit Tick", slot_0_29_0.ticks_current)

slot_0_87_0:add(slot_0_108_0.ticks_current)
slot_0_87_0:reset()

slot_0_108_0.ticks_pitch_mode = gui.make_control("Pitch Mode", slot_0_29_0.ticks_pitch_mode)

slot_0_87_0:add(slot_0_108_0.ticks_pitch_mode)
slot_0_87_0:reset()

slot_0_108_0.ticks_pitch = gui.make_control("Pitch Value", slot_0_29_0.ticks_pitch)

slot_0_87_0:add(slot_0_108_0.ticks_pitch)
slot_0_87_0:reset()

slot_0_108_0.ticks_pitch_jitter = gui.make_control("Pitch Jitter", slot_0_29_0.ticks_pitch_jitter)

slot_0_87_0:add(slot_0_108_0.ticks_pitch_jitter)
slot_0_87_0:reset()

slot_0_108_0.ticks_yaw_jitter = gui.make_control("Yaw Jitter", slot_0_29_0.ticks_yaw_jitter)

slot_0_87_0:add(slot_0_108_0.ticks_yaw_jitter)
slot_0_87_0:reset()

slot_0_108_0.ticks_spin = gui.make_control("Spin", slot_0_29_0.ticks_spin)

slot_0_87_0:add(slot_0_108_0.ticks_spin)
slot_0_87_0:reset()

slot_0_108_0.ticks_rand_pitch = gui.make_control("Random Pitch", slot_0_29_0.ticks_rand_pitch)

slot_0_87_0:add(slot_0_108_0.ticks_rand_pitch)
slot_0_87_0:reset()

slot_0_108_0.ticks_rand_pitch_min = gui.make_control("Pitch Min", slot_0_29_0.ticks_rand_pitch_min)

slot_0_87_0:add(slot_0_108_0.ticks_rand_pitch_min)
slot_0_87_0:reset()

slot_0_108_0.ticks_rand_pitch_max = gui.make_control("Pitch Max", slot_0_29_0.ticks_rand_pitch_max)

slot_0_87_0:add(slot_0_108_0.ticks_rand_pitch_max)
slot_0_87_0:reset()

slot_0_108_0.ticks_rand_yj = gui.make_control("Random Yaw Jitter", slot_0_29_0.ticks_rand_yj)

slot_0_88_0:add(slot_0_108_0.ticks_rand_yj)
slot_0_88_0:reset()

slot_0_108_0.ticks_rand_yj_min = gui.make_control("YJ Min", slot_0_29_0.ticks_rand_yj_min)

slot_0_88_0:add(slot_0_108_0.ticks_rand_yj_min)
slot_0_88_0:reset()

slot_0_108_0.ticks_rand_yj_max = gui.make_control("YJ Max", slot_0_29_0.ticks_rand_yj_max)

slot_0_88_0:add(slot_0_108_0.ticks_rand_yj_max)
slot_0_88_0:reset()

slot_0_108_0.ticks_rand_spin = gui.make_control("Random Spin", slot_0_29_0.ticks_rand_spin)

slot_0_88_0:add(slot_0_108_0.ticks_rand_spin)
slot_0_88_0:reset()

slot_0_108_0.ticks_rand_spin_min = gui.make_control("Spin Min", slot_0_29_0.ticks_rand_spin_min)

slot_0_88_0:add(slot_0_108_0.ticks_rand_spin_min)
slot_0_88_0:reset()

slot_0_108_0.ticks_rand_spin_max = gui.make_control("Spin Max", slot_0_29_0.ticks_rand_spin_max)

slot_0_88_0:add(slot_0_108_0.ticks_rand_spin_max)
slot_0_88_0:reset()

slot_0_108_0.ticks_yaw_mode = gui.make_control("Yaw Mode", slot_0_29_0.ticks_yaw_mode)

slot_0_87_0:add(slot_0_108_0.ticks_yaw_mode)
slot_0_87_0:reset()

slot_0_108_0.ticks_yaw_base = gui.make_control("Yaw Base", slot_0_29_0.ticks_yaw_base)

slot_0_87_0:add(slot_0_108_0.ticks_yaw_base)
slot_0_87_0:reset()

slot_0_108_0.ticks_pj_mode = gui.make_control("Pitch Jitter Mode", slot_0_29_0.ticks_pj_mode)

slot_0_87_0:add(slot_0_108_0.ticks_pj_mode)
slot_0_87_0:reset()

slot_0_108_0.ticks_yj_mode = gui.make_control("Yaw Jitter Mode", slot_0_29_0.ticks_yj_mode)

slot_0_87_0:add(slot_0_108_0.ticks_yj_mode)
slot_0_87_0:reset()

slot_0_108_0.ticks_copy = gui.make_control("", slot_0_29_0.ticks_copy)

slot_0_87_0:add(slot_0_108_0.ticks_copy)
slot_0_87_0:reset()

slot_0_108_0.ticks_paste = gui.make_control("", slot_0_29_0.ticks_paste)

slot_0_87_0:add(slot_0_108_0.ticks_paste)
slot_0_87_0:reset()

slot_0_108_0.ticks_reset = gui.make_control("", slot_0_29_0.ticks_reset)

slot_0_87_0:add(slot_0_108_0.ticks_reset)
slot_0_87_0:reset()

slot_0_108_0.preset_mode = gui.make_control("Use Presets Mode", slot_0_29_0.preset_mode)

slot_0_87_0:add(slot_0_108_0.preset_mode)
slot_0_87_0:reset()

slot_0_108_0.preset_name = gui.make_control("Preset Name", slot_0_29_0.preset_name)

slot_0_87_0:add(slot_0_108_0.preset_name)
slot_0_87_0:reset()

slot_0_108_0.preset_value = gui.make_control("Preset Value", slot_0_29_0.preset_value)

slot_0_87_0:add(slot_0_108_0.preset_value)
slot_0_87_0:reset()

slot_0_108_0.cfg_name = gui.make_control("Config Name", slot_0_29_0.cfg_name)

slot_0_87_0:add(slot_0_108_0.cfg_name)
slot_0_87_0:reset()

slot_0_108_0.pitch_random = gui.make_control("Pitch Random", slot_0_29_0.pitch_random)

slot_0_87_0:add(slot_0_108_0.pitch_random)
slot_0_87_0:reset()

slot_0_108_0.pitch_rand_min = gui.make_control("Pitch Min", slot_0_29_0.pitch_rand_min)

slot_0_87_0:add(slot_0_108_0.pitch_rand_min)
slot_0_87_0:reset()

slot_0_108_0.pitch_rand_max = gui.make_control("Pitch Max", slot_0_29_0.pitch_rand_max)

slot_0_87_0:add(slot_0_108_0.pitch_rand_max)
slot_0_87_0:reset()

slot_0_108_0.pj_mode = gui.make_control("Pitch Jitter Mode", slot_0_29_0.pj_mode)

slot_0_87_0:add(slot_0_108_0.pj_mode)
slot_0_87_0:reset()

slot_0_108_0.pj_3way = gui.make_control("Pitch Jitter 3-Way", slot_0_29_0.pj_3way)

slot_0_87_0:add(slot_0_108_0.pj_3way)
slot_0_87_0:reset()

slot_0_108_0.pj_random = gui.make_control("Pitch Jitter Random", slot_0_29_0.pj_random)

slot_0_87_0:add(slot_0_108_0.pj_random)
slot_0_87_0:reset()

slot_0_108_0.pj_rand_min = gui.make_control("PJ Min", slot_0_29_0.pj_rand_min)

slot_0_87_0:add(slot_0_108_0.pj_rand_min)
slot_0_87_0:reset()

slot_0_108_0.pj_rand_max = gui.make_control("PJ Max", slot_0_29_0.pj_rand_max)

slot_0_87_0:add(slot_0_108_0.pj_rand_max)
slot_0_87_0:reset()

slot_0_108_0.jit_dis = gui.make_control("Jitter Disabler", slot_0_29_0.jit_dis)

slot_0_87_0:add(slot_0_108_0.jit_dis)
slot_0_87_0:reset()

slot_0_108_0.hide_shot = gui.make_control("Hide Shot", slot_0_29_0.hide_shot)

slot_0_87_0:add(slot_0_108_0.hide_shot)
slot_0_87_0:reset()

slot_0_108_0.yaw_mode = gui.make_control("Yaw Mode", slot_0_29_0.yaw_mode)

slot_0_87_0:add(slot_0_108_0.yaw_mode)
slot_0_87_0:reset()

slot_0_108_0.yaw_base = gui.make_control("Yaw Base", slot_0_29_0.yaw_base)

slot_0_87_0:add(slot_0_108_0.yaw_base)
slot_0_87_0:reset()

slot_0_108_0.yj_mode = gui.make_control("Yaw Jitter Mode", slot_0_29_0.yj_mode)

slot_0_87_0:add(slot_0_108_0.yj_mode)
slot_0_87_0:reset()

slot_0_108_0.yj_3way = gui.make_control("Yaw Jitter 3-Way", slot_0_29_0.yj_3way)

slot_0_87_0:add(slot_0_108_0.yj_3way)
slot_0_87_0:reset()

slot_0_108_0.yj_random = gui.make_control("Yaw Jitter Random", slot_0_29_0.yj_random)

slot_0_87_0:add(slot_0_108_0.yj_random)
slot_0_87_0:reset()

slot_0_108_0.yj_rand_min = gui.make_control("YJ Min", slot_0_29_0.yj_rand_min)

slot_0_87_0:add(slot_0_108_0.yj_rand_min)
slot_0_87_0:reset()

slot_0_108_0.yj_rand_max = gui.make_control("YJ Max", slot_0_29_0.yj_rand_max)

slot_0_87_0:add(slot_0_108_0.yj_rand_max)
slot_0_87_0:reset()

slot_0_108_0.spin_random = gui.make_control("Spin Random", slot_0_29_0.spin_random)

slot_0_87_0:add(slot_0_108_0.spin_random)
slot_0_87_0:reset()

slot_0_108_0.spin_rand_min = gui.make_control("Spin Min", slot_0_29_0.spin_rand_min)

slot_0_87_0:add(slot_0_108_0.spin_rand_min)
slot_0_87_0:reset()

slot_0_108_0.spin_rand_max = gui.make_control("Spin Max", slot_0_29_0.spin_rand_max)

slot_0_87_0:add(slot_0_108_0.spin_rand_max)
slot_0_87_0:reset()

slot_0_108_0.preset_add = gui.make_control("", slot_0_29_0.preset_add)

slot_0_87_0:add(slot_0_108_0.preset_add)
slot_0_87_0:reset()

slot_0_108_0.preset_list = gui.make_control("Presets", slot_0_29_0.preset_list)

slot_0_87_0:add(slot_0_108_0.preset_list)
slot_0_87_0:reset()

slot_0_108_0.preset_del = gui.make_control("", slot_0_29_0.preset_del)

slot_0_87_0:add(slot_0_108_0.preset_del)
slot_0_87_0:reset()

slot_0_108_0.cfg_list = gui.make_control("Configs", slot_0_29_0.cfg_list)

slot_0_87_0:add(slot_0_108_0.cfg_list)
slot_0_87_0:reset()

slot_0_108_0.cfg_save = gui.make_control("", slot_0_29_0.cfg_save)

slot_0_87_0:add(slot_0_108_0.cfg_save)
slot_0_87_0:reset()

slot_0_108_0.cfg_load = gui.make_control("", slot_0_29_0.cfg_load)

slot_0_87_0:add(slot_0_108_0.cfg_load)
slot_0_87_0:reset()

slot_0_108_0.cfg_del = gui.make_control("", slot_0_29_0.cfg_del)

slot_0_87_0:add(slot_0_108_0.cfg_del)
slot_0_87_0:reset()

slot_0_108_0.copy_cond = gui.make_control("", slot_0_29_0.copy_cond)

slot_0_87_0:add(slot_0_108_0.copy_cond)
slot_0_87_0:reset()

slot_0_108_0.paste_cond = gui.make_control("", slot_0_29_0.paste_cond)

slot_0_87_0:add(slot_0_108_0.paste_cond)
slot_0_87_0:reset()

slot_0_108_0.hud = gui.make_control("HUD", slot_0_29_0.hud)

slot_0_87_0:add(slot_0_108_0.hud)
slot_0_87_0:reset()

slot_0_108_0.export_btn = gui.make_control("", slot_0_29_0.export_btn)

slot_0_87_0:add(slot_0_108_0.export_btn)
slot_0_87_0:reset()

slot_0_108_0.import_btn = gui.make_control("", slot_0_29_0.import_btn)

slot_0_87_0:add(slot_0_108_0.import_btn)
slot_0_87_0:reset()

slot_0_108_0.export_full_btn = gui.make_control("", slot_0_29_0.export_full_btn)

slot_0_87_0:add(slot_0_108_0.export_full_btn)
slot_0_87_0:reset()

slot_0_108_0.import_full_btn = gui.make_control("", slot_0_29_0.import_full_btn)

slot_0_87_0:add(slot_0_108_0.import_full_btn)
slot_0_87_0:reset()

slot_0_108_0.reset_btn = gui.make_control("", slot_0_29_0.reset_btn)

slot_0_87_0:add(slot_0_108_0.reset_btn)
slot_0_87_0:reset()
slot_0_29_0.cond:add_callback(function()
        local var_85_0 = slot_0_34_0(slot_0_103_0)

        slot_0_38_0(var_85_0)

        slot_0_103_0 = slot_0_30_0(slot_0_29_0.cond)

        local var_85_1 = slot_0_34_0(slot_0_103_0)

        slot_0_35_0(var_85_1)
end)

slot_0_109_0 = nil

slot_0_29_0.copy_cond:add_callback(function()
        local var_86_0 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

        slot_0_38_0(var_86_0)

        local var_86_1 = slot_0_23_0.conditions[var_86_0]

        if var_86_1 then
                slot_0_109_0 = {}

                for iter_86_0, iter_86_1 in pairs(var_86_1) do
                        slot_0_109_0[iter_86_0] = iter_86_1
                end
        end
end)
slot_0_29_0.paste_cond:add_callback(function()
        if not slot_0_109_0 then
                return
        end

        local var_87_0 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

        slot_0_23_0.conditions[var_87_0] = {}

        for iter_87_0, iter_87_1 in pairs(slot_0_109_0) do
                slot_0_23_0.conditions[var_87_0][iter_87_0] = iter_87_1
        end

        slot_0_35_0(var_87_0)
end)
slot_0_29_0.export_btn:add_callback(function()
        local var_88_0 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

        slot_0_38_0(var_88_0)

        local var_88_1 = "AAB5:" .. slot_0_104_0(slot_0_23_0.conditions[var_88_0])

        if utils and utils.clipboard_set then
                utils.clipboard_set(var_88_1)
        end
end)
slot_0_29_0.import_btn:add_callback(function()
        if utils and utils.clipboard_get then
                local var_89_0 = utils.clipboard_get()

                if var_89_0 and var_89_0:sub(1, 5) == "AAB5:" then
                        local var_89_1 = slot_0_105_0(var_89_0:sub(6))

                        if var_89_1 then
                                local var_89_2 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

                                slot_0_23_0.conditions[var_89_2] = var_89_1

                                slot_0_35_0(var_89_2)
                        end
                end
        end
end)
slot_0_29_0.reset_btn:add_callback(function()
        local var_90_0 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

        slot_0_23_0.conditions[var_90_0] = slot_0_70_0()

        slot_0_35_0(var_90_0)
end)
slot_0_29_0.export_full_btn:add_callback(function()
        slot_0_61_0()
end)
slot_0_29_0.import_full_btn:add_callback(function()
        slot_0_62_0()
end)
slot_0_29_0.discord:add_callback(function()
        slot_0_5_0(slot_0_1_0.DISCORD_URL)
end)
slot_0_29_0.cfg_save:add_callback(function()
        local var_94_0 = slot_0_33_0(slot_0_29_0.cfg_name)

        if var_94_0 == "" then
                gui.notify:add(gui.notification("AA Builder", "Enter config name!"))

                return
        end

        local var_94_1 = slot_0_34_0(slot_0_30_0(slot_0_29_0.cond))

        if slot_0_38_0 then
                slot_0_38_0(var_94_1)
        end

        if slot_0_39_0 and slot_0_41_0 then
                slot_0_39_0(slot_0_41_0)
        end

        slot_0_45_0 = slot_0_34_0(slot_0_30_0(slot_0_29_0.ticks_cond))

        if slot_0_40_0 then
                slot_0_40_0(slot_0_45_0)
        end

        slot_0_57_0(var_94_0)
end)
slot_0_29_0.cfg_load:add_callback(function()
        local var_95_0 = slot_0_60_0()

        if var_95_0 then
                slot_0_58_0(var_95_0)
        else
                gui.notify:add(gui.notification("AA Builder", "Select a config first!"))
        end
end)
slot_0_29_0.cfg_del:add_callback(function()
        local var_96_0 = slot_0_60_0()

        if var_96_0 then
                slot_0_59_0(var_96_0)
        else
                gui.notify:add(gui.notification("AA Builder", "Select a config first!"))
        end
end)
slot_0_29_0.preset_add:add_callback(function()
        local var_97_0 = slot_0_33_0(slot_0_29_0.preset_name)
        local var_97_1 = slot_0_91_0(slot_0_29_0.preset_value, 0)

        if var_97_0 ~= "" then
                slot_0_64_0[var_97_0] = var_97_1

                slot_0_66_0()
                slot_0_37_0()
        end
end)
slot_0_29_0.preset_del:add_callback(function()
        local var_98_0 = slot_0_30_0(slot_0_29_0.preset_list)
        local var_98_1 = 1

        for iter_98_0 = 0, 20 do
                if bit.band(var_98_0, bit.lshift(1, iter_98_0)) ~= 0 then
                        var_98_1 = iter_98_0 + 1

                        break
                end
        end

        local var_98_2 = 1

        for iter_98_1, iter_98_2 in pairs(slot_0_64_0) do
                if var_98_2 == var_98_1 then
                        slot_0_64_0[iter_98_1] = nil

                        slot_0_66_0()
                        slot_0_37_0()

                        break
                end

                var_98_2 = var_98_2 + 1
        end
end)

slot_0_110_0 = nil
slot_0_45_0 = "default"
slot_0_41_0 = 1

function slot_0_111_0(arg_99_0, arg_99_1)
        if arg_99_0 then
                local var_99_0 = arg_99_0:get_value()

                if var_99_0 and var_99_0.get then
                        return var_99_0:get()
                end
        end

        return arg_99_1
end

function slot_0_112_0(arg_100_0, arg_100_1)
        if arg_100_0 then
                local var_100_0 = arg_100_0:get_value()

                if var_100_0 and var_100_0.set then
                        var_100_0:set(arg_100_1)
                end
        end
end

function slot_0_113_0(arg_101_0)
        if arg_101_0 == 1 then
                return "default"
        elseif arg_101_0 == 2 then
                return "standing"
        elseif arg_101_0 == 4 then
                return "moving"
        elseif arg_101_0 == 8 then
                return "slowwalk"
        elseif arg_101_0 == 16 then
                return "air"
        elseif arg_101_0 == 32 then
                return "air_ctrl"
        elseif arg_101_0 == 64 then
                return "crouch"
        elseif arg_101_0 == 128 then
                return "on_damage"
        elseif arg_101_0 == 256 then
                return "on_shot"
        end

        return "default"
end

function slot_0_114_0(arg_102_0)
        local var_102_0 = slot_0_44_0.conditions[slot_0_45_0]

        if not var_102_0 then
                return
        end

        local var_102_1 = var_102_0.ticks[arg_102_0]

        if not var_102_1 then
                return
        end

        slot_0_89_0(slot_0_29_0.ticks_pitch_mode, var_102_1.pitch_mode or 16)
        slot_0_90_0(slot_0_29_0.ticks_pitch, var_102_1.pitch or "89")
        slot_0_90_0(slot_0_29_0.ticks_pitch_jitter, var_102_1.pitch_jitter or "0")
        slot_0_90_0(slot_0_29_0.ticks_yaw_jitter, var_102_1.yaw_jitter or "0")
        slot_0_90_0(slot_0_29_0.ticks_spin, var_102_1.spin or "0")
        slot_0_89_0(slot_0_29_0.ticks_yaw_mode, var_102_1.yaw_mode or 2)
        slot_0_89_0(slot_0_29_0.ticks_yaw_base, var_102_1.yaw_base or 2)
        slot_0_89_0(slot_0_29_0.ticks_pj_mode, var_102_1.pj_mode or 1)
        slot_0_89_0(slot_0_29_0.ticks_yj_mode, var_102_1.yj_mode or 1)
        slot_0_32_0(slot_0_29_0.ticks_rand_pitch, var_102_1.random_pitch or false)
        slot_0_90_0(slot_0_29_0.ticks_rand_pitch_min, var_102_1.random_pitch_min or "80")
        slot_0_90_0(slot_0_29_0.ticks_rand_pitch_max, var_102_1.random_pitch_max or "89")
        slot_0_32_0(slot_0_29_0.ticks_rand_yj, var_102_1.random_yj or false)
        slot_0_90_0(slot_0_29_0.ticks_rand_yj_min, var_102_1.random_yj_min or "0")
        slot_0_90_0(slot_0_29_0.ticks_rand_yj_max, var_102_1.random_yj_max or "30")
        slot_0_32_0(slot_0_29_0.ticks_rand_spin, var_102_1.random_spin or false)
        slot_0_90_0(slot_0_29_0.ticks_rand_spin_min, var_102_1.random_spin_min or "0")
        slot_0_90_0(slot_0_29_0.ticks_rand_spin_max, var_102_1.random_spin_max or "100")
end

function slot_0_39_0(arg_103_0)
        local var_103_0 = slot_0_44_0.conditions[slot_0_45_0]

        if not var_103_0 then
                return
        end

        local var_103_1 = var_103_0.ticks[arg_103_0]

        if not var_103_1 then
                return
        end

        var_103_1.pitch_mode = slot_0_30_0(slot_0_29_0.ticks_pitch_mode)

        if var_103_1.pitch_mode == 0 then
                var_103_1.pitch_mode = 16
        end

        var_103_1.pitch = slot_0_33_0(slot_0_29_0.ticks_pitch) or "89"
        var_103_1.pitch_jitter = slot_0_33_0(slot_0_29_0.ticks_pitch_jitter) or "0"
        var_103_1.yaw_jitter = slot_0_33_0(slot_0_29_0.ticks_yaw_jitter) or "0"
        var_103_1.spin = slot_0_33_0(slot_0_29_0.ticks_spin) or "0"
        var_103_1.yaw_mode = slot_0_30_0(slot_0_29_0.ticks_yaw_mode)

        if var_103_1.yaw_mode == 0 then
                var_103_1.yaw_mode = 2
        end

        var_103_1.yaw_base = slot_0_30_0(slot_0_29_0.ticks_yaw_base)

        if var_103_1.yaw_base == 0 then
                var_103_1.yaw_base = 2
        end

        var_103_1.pj_mode = slot_0_30_0(slot_0_29_0.ticks_pj_mode)

        if var_103_1.pj_mode == 0 then
                var_103_1.pj_mode = 1
        end

        var_103_1.yj_mode = slot_0_30_0(slot_0_29_0.ticks_yj_mode)

        if var_103_1.yj_mode == 0 then
                var_103_1.yj_mode = 1
        end

        var_103_1.random_pitch = slot_0_31_0(slot_0_29_0.ticks_rand_pitch)
        var_103_1.random_pitch_min = slot_0_33_0(slot_0_29_0.ticks_rand_pitch_min) or "80"
        var_103_1.random_pitch_max = slot_0_33_0(slot_0_29_0.ticks_rand_pitch_max) or "89"
        var_103_1.random_yj = slot_0_31_0(slot_0_29_0.ticks_rand_yj)
        var_103_1.random_yj_min = slot_0_33_0(slot_0_29_0.ticks_rand_yj_min) or "0"
        var_103_1.random_yj_max = slot_0_33_0(slot_0_29_0.ticks_rand_yj_max) or "30"
        var_103_1.random_spin = slot_0_31_0(slot_0_29_0.ticks_rand_spin)
        var_103_1.random_spin_min = slot_0_33_0(slot_0_29_0.ticks_rand_spin_min) or "0"
        var_103_1.random_spin_max = slot_0_33_0(slot_0_29_0.ticks_rand_spin_max) or "100"
end

function slot_0_36_0(arg_104_0)
        local var_104_0 = slot_0_44_0.conditions[arg_104_0]

        if not var_104_0 then
                return
        end

        slot_0_45_0 = arg_104_0

        slot_0_32_0(slot_0_29_0.ticks_cond_enable, var_104_0.enabled)
        slot_0_90_0(slot_0_29_0.ticks_count, var_104_0.tick_count or 4)

        slot_0_41_0 = 1

        slot_0_90_0(slot_0_29_0.ticks_current, 1)
        slot_0_114_0(1)
end

function slot_0_40_0(arg_105_0)
        local var_105_0 = slot_0_44_0.conditions[arg_105_0]

        if not var_105_0 then
                return
        end

        var_105_0.enabled = slot_0_31_0(slot_0_29_0.ticks_cond_enable)
        var_105_0.tick_count = slot_0_91_0(slot_0_29_0.ticks_count, 4)

        if var_105_0.tick_count < 1 then
                var_105_0.tick_count = 1
        end

        if var_105_0.tick_count > slot_0_43_0 then
                var_105_0.tick_count = slot_0_43_0
        end
end

slot_0_29_0.ticks_cond:add_callback(function()
        slot_0_39_0(slot_0_41_0)

        local var_106_0 = slot_0_30_0(slot_0_29_0.ticks_cond)
        local var_106_1 = slot_0_113_0(var_106_0)

        slot_0_36_0(var_106_1)
end)
slot_0_29_0.ticks_cond_enable:add_callback(function()
        local var_107_0 = slot_0_44_0.conditions[slot_0_45_0]

        if var_107_0 then
                var_107_0.enabled = slot_0_31_0(slot_0_29_0.ticks_cond_enable)
        end
end)
slot_0_29_0.ticks_current:add_callback(function()
        slot_0_39_0(slot_0_41_0)

        local var_108_0 = slot_0_91_0(slot_0_29_0.ticks_current, 1)

        if var_108_0 < 1 then
                var_108_0 = 1
        end

        if var_108_0 > slot_0_43_0 then
                var_108_0 = slot_0_43_0
        end

        slot_0_114_0(var_108_0)

        slot_0_41_0 = var_108_0
end)
slot_0_29_0.ticks_count:add_callback(function()
        local var_109_0 = slot_0_44_0.conditions[slot_0_45_0]

        if var_109_0 then
                local var_109_1 = slot_0_91_0(slot_0_29_0.ticks_count, 4)

                if var_109_1 < 1 then
                        var_109_1 = 1
                end

                if var_109_1 > slot_0_43_0 then
                        var_109_1 = slot_0_43_0
                end

                var_109_0.tick_count = var_109_1
        end
end)
slot_0_29_0.ticks_enable:add_callback(function()
        slot_0_44_0.enabled = slot_0_31_0(slot_0_29_0.ticks_enable)
end)
slot_0_29_0.ticks_copy:add_callback(function()
        local var_111_0 = slot_0_91_0(slot_0_29_0.ticks_current, 1)

        if var_111_0 < 1 then
                var_111_0 = 1
        end

        if var_111_0 > slot_0_43_0 then
                var_111_0 = slot_0_43_0
        end

        slot_0_39_0(var_111_0)

        local var_111_1 = slot_0_44_0.conditions[slot_0_45_0]

        if not var_111_1 then
                return
        end

        slot_0_110_0 = {}

        for iter_111_0, iter_111_1 in pairs(var_111_1.ticks[var_111_0]) do
                slot_0_110_0[iter_111_0] = iter_111_1
        end
end)
slot_0_29_0.ticks_paste:add_callback(function()
        if not slot_0_110_0 then
                return
        end

        local var_112_0 = slot_0_91_0(slot_0_29_0.ticks_current, 1)

        if var_112_0 < 1 then
                var_112_0 = 1
        end

        if var_112_0 > slot_0_43_0 then
                var_112_0 = slot_0_43_0
        end

        local var_112_1 = slot_0_44_0.conditions[slot_0_45_0]

        if not var_112_1 then
                return
        end

        for iter_112_0, iter_112_1 in pairs(slot_0_110_0) do
                var_112_1.ticks[var_112_0][iter_112_0] = iter_112_1
        end

        slot_0_114_0(var_112_0)
end)
slot_0_29_0.ticks_reset:add_callback(function()
        local var_113_0 = slot_0_91_0(slot_0_29_0.ticks_current, 1)

        if var_113_0 < 1 then
                var_113_0 = 1
        end

        if var_113_0 > slot_0_43_0 then
                var_113_0 = slot_0_43_0
        end

        local var_113_1 = slot_0_44_0.conditions[slot_0_45_0]

        if not var_113_1 then
                return
        end

        var_113_1.ticks[var_113_0] = slot_0_86_0()

        slot_0_114_0(var_113_0)
end)
slot_0_29_0.ticks_pitch_mode:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_pitch:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_pitch_jitter:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_yaw_jitter:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_spin:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_yaw_mode:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_yaw_base:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_pj_mode:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_yj_mode:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_pitch:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_pitch_min:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_pitch_max:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_yj:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_yj_min:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_yj_max:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_spin:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_spin_min:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)
slot_0_29_0.ticks_rand_spin_max:add_callback(function()
        slot_0_39_0(slot_0_41_0)
end)

function slot_0_115_0()
        for iter_132_0, iter_132_1 in pairs(slot_0_108_0) do
                if iter_132_1 and iter_132_1.set_visible then
                        iter_132_1:set_visible(false)
                end
        end
end

slot_0_18_0()

function slot_0_116_0()
        if not slot_0_108_0.enable then
                return
        end

        if slot_0_0_0 and (not slot_0_6_0.init_complete or not slot_0_19_0()) then
                slot_0_115_0()

                return
        end

        slot_0_108_0.enable:set_visible(true)
        slot_0_108_0.discord:set_visible(slot_0_0_0)

        slot_133_0_0 = slot_0_31_0(slot_0_29_0.enable)

        slot_0_108_0.tab:set_visible(slot_133_0_0)

        slot_133_1_0 = slot_0_30_0(slot_0_29_0.tab)
        slot_133_2_0 = slot_133_1_0 == 1
        slot_133_3_0 = slot_133_1_0 == 2
        slot_133_4_0 = slot_133_1_0 == 4
        slot_133_5_0 = slot_133_1_0 == 8
        slot_133_6_0 = slot_133_1_0 == 16
        slot_133_7_0 = slot_133_1_0 == 32
        slot_133_8_0 = slot_0_30_0(slot_0_29_0.cond)
        slot_133_9_0 = slot_133_8_0 == 1
        slot_133_10_0 = slot_133_8_0 == 128
        slot_133_11_0 = slot_133_8_0 == 256
        slot_133_12_0 = slot_133_0_0 and not slot_133_6_0 and not slot_133_7_0 and not slot_133_5_0

        slot_0_108_0.cond:set_visible(slot_133_12_0)
        slot_0_108_0.override_enable:set_visible(slot_133_12_0 and not slot_133_9_0)
        slot_0_108_0.dmg_duration:set_visible(slot_133_12_0 and slot_133_10_0)
        slot_0_108_0.shot_duration:set_visible(slot_133_12_0 and slot_133_11_0)
        slot_0_108_0.pitch_shot_dur:set_visible(slot_133_0_0 and slot_133_2_0 and slot_133_11_0)
        slot_0_108_0.yaw_shot_dur:set_visible(slot_133_0_0 and slot_133_3_0 and slot_133_11_0)
        slot_0_108_0.spin_shot_dur:set_visible(slot_133_0_0 and slot_133_4_0 and slot_133_11_0)
        slot_0_108_0.pitch_val:set_visible(slot_133_0_0 and slot_133_2_0)
        slot_0_108_0.pitch_random:set_visible(slot_133_0_0 and slot_133_2_0)

        slot_133_13_0 = slot_133_0_0 and slot_133_2_0 and slot_0_31_0(slot_0_29_0.pitch_random)

        slot_0_108_0.pitch_rand_min:set_visible(slot_133_13_0)
        slot_0_108_0.pitch_rand_max:set_visible(slot_133_13_0)
        slot_0_108_0.pitch_speed:set_visible(slot_133_0_0 and slot_133_2_0)
        slot_0_108_0.pj_mode:set_visible(slot_133_0_0 and slot_133_2_0)
        slot_0_108_0.pj_3way:set_visible(slot_133_0_0 and slot_133_2_0)
        slot_0_108_0.pj_val:set_visible(slot_133_0_0 and slot_133_2_0)
        slot_0_108_0.pj_random:set_visible(slot_133_0_0 and slot_133_2_0)

        slot_133_14_0 = slot_133_0_0 and slot_133_2_0 and slot_0_31_0(slot_0_29_0.pj_random)

        slot_0_108_0.pj_rand_min:set_visible(slot_133_14_0)
        slot_0_108_0.pj_rand_max:set_visible(slot_133_14_0)
        slot_0_108_0.pj_speed:set_visible(slot_133_0_0 and slot_133_2_0)
        slot_0_108_0.hide_shot:set_visible(slot_133_0_0 and slot_133_2_0)
        slot_0_108_0.yaw_mode:set_visible(slot_133_0_0 and slot_133_3_0)
        slot_0_108_0.yaw_base:set_visible(slot_133_0_0 and slot_133_3_0)
        slot_0_108_0.yj_mode:set_visible(slot_133_0_0 and slot_133_3_0)
        slot_0_108_0.yj_3way:set_visible(slot_133_0_0 and slot_133_3_0)
        slot_0_108_0.yj_val:set_visible(slot_133_0_0 and slot_133_3_0)
        slot_0_108_0.yj_random:set_visible(slot_133_0_0 and slot_133_3_0)

        slot_133_15_0 = slot_133_0_0 and slot_133_3_0 and slot_0_31_0(slot_0_29_0.yj_random)

        slot_0_108_0.yj_rand_min:set_visible(slot_133_15_0)
        slot_0_108_0.yj_rand_max:set_visible(slot_133_15_0)
        slot_0_108_0.yj_speed:set_visible(slot_133_0_0 and slot_133_3_0)
        slot_0_108_0.jit_dis:set_visible(slot_133_0_0 and slot_133_3_0)
        slot_0_108_0.spin_val:set_visible(slot_133_0_0 and slot_133_4_0)
        slot_0_108_0.spin_random:set_visible(slot_133_0_0 and slot_133_4_0)

        slot_133_16_0 = slot_133_0_0 and slot_133_4_0 and slot_0_31_0(slot_0_29_0.spin_random)

        slot_0_108_0.spin_rand_min:set_visible(slot_133_16_0)
        slot_0_108_0.spin_rand_max:set_visible(slot_133_16_0)
        slot_0_108_0.spin_speed:set_visible(slot_133_0_0 and slot_133_4_0)
        slot_0_108_0.ticks_enable:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_cond:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_cond_enable:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_count:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_current:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_pitch_mode:set_visible(slot_133_0_0 and slot_133_5_0)

        slot_133_18_0 = slot_0_30_0(slot_0_29_0.ticks_pitch_mode) == 16

        slot_0_108_0.ticks_pitch:set_visible(slot_133_0_0 and slot_133_5_0 and slot_133_18_0)
        slot_0_108_0.ticks_pitch_jitter:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_yaw_jitter:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_spin:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_yaw_mode:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_yaw_base:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_pj_mode:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_yj_mode:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_rand_pitch:set_visible(slot_133_0_0 and slot_133_5_0 and slot_133_18_0)

        slot_133_19_0 = slot_133_0_0 and slot_133_5_0 and slot_133_18_0 and slot_0_31_0(slot_0_29_0.ticks_rand_pitch)

        slot_0_108_0.ticks_rand_pitch_min:set_visible(slot_133_19_0)
        slot_0_108_0.ticks_rand_pitch_max:set_visible(slot_133_19_0)
        slot_0_108_0.ticks_rand_yj:set_visible(slot_133_0_0 and slot_133_5_0)

        slot_133_20_0 = slot_133_0_0 and slot_133_5_0 and slot_0_31_0(slot_0_29_0.ticks_rand_yj)

        slot_0_108_0.ticks_rand_yj_min:set_visible(slot_133_20_0)
        slot_0_108_0.ticks_rand_yj_max:set_visible(slot_133_20_0)
        slot_0_108_0.ticks_rand_spin:set_visible(slot_133_0_0 and slot_133_5_0)

        slot_133_21_0 = slot_133_0_0 and slot_133_5_0 and slot_0_31_0(slot_0_29_0.ticks_rand_spin)

        slot_0_108_0.ticks_rand_spin_min:set_visible(slot_133_21_0)
        slot_0_108_0.ticks_rand_spin_max:set_visible(slot_133_21_0)
        slot_0_108_0.ticks_copy:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_paste:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.ticks_reset:set_visible(slot_133_0_0 and slot_133_5_0)
        slot_0_108_0.preset_mode:set_visible(slot_133_0_0 and slot_133_6_0)
        slot_0_108_0.preset_name:set_visible(slot_133_0_0 and slot_133_6_0)
        slot_0_108_0.preset_value:set_visible(slot_133_0_0 and slot_133_6_0)
        slot_0_108_0.preset_add:set_visible(slot_133_0_0 and slot_133_6_0)
        slot_0_108_0.preset_list:set_visible(slot_133_0_0 and slot_133_6_0)
        slot_0_108_0.preset_del:set_visible(slot_133_0_0 and slot_133_6_0)

        if slot_0_108_0.cfg_name then
                slot_0_108_0.cfg_name:set_visible(slot_133_0_0 and slot_133_7_0)
        end

        if slot_0_108_0.cfg_list then
                slot_0_108_0.cfg_list:set_visible(slot_133_0_0 and slot_133_7_0)
        end

        if slot_0_108_0.cfg_save then
                slot_0_108_0.cfg_save:set_visible(slot_133_0_0 and slot_133_7_0)
        end

        if slot_0_108_0.cfg_load then
                slot_0_108_0.cfg_load:set_visible(slot_133_0_0 and slot_133_7_0)
        end

        if slot_0_108_0.cfg_del then
                slot_0_108_0.cfg_del:set_visible(slot_133_0_0 and slot_133_7_0)
        end

        slot_0_108_0.hud:set_visible(slot_133_0_0 and slot_133_7_0)
        slot_0_108_0.export_btn:set_visible(slot_133_0_0 and slot_133_7_0)
        slot_0_108_0.import_btn:set_visible(slot_133_0_0 and slot_133_7_0)
        slot_0_108_0.export_full_btn:set_visible(slot_133_0_0 and slot_133_7_0)
        slot_0_108_0.import_full_btn:set_visible(slot_133_0_0 and slot_133_7_0)
        slot_0_108_0.reset_btn:set_visible(slot_133_0_0 and slot_133_7_0)

        slot_133_22_0 = slot_133_0_0 and (slot_133_2_0 or slot_133_3_0 or slot_133_4_0)

        slot_0_108_0.copy_cond:set_visible(slot_133_22_0)
        slot_0_108_0.paste_cond:set_visible(slot_133_22_0)
end

function slot_0_117_0(arg_134_0, arg_134_1, arg_134_2, arg_134_3)
        local var_134_0 = slot_0_29_0 and slot_0_29_0.preset_mode and slot_0_31_0(slot_0_29_0.preset_mode) or false
        local var_134_1 = slot_0_68_0(arg_134_0, var_134_0)

        if arg_134_1 and #var_134_1 > 1 then
                local var_134_2 = slot_0_92_0()

                if math.max(1, math.floor(100 / (arg_134_2 or 50))) <= var_134_2 - (slot_0_81_0.last_tick or 0) then
                        slot_0_81_0.last_tick = var_134_2
                        slot_0_81_0[arg_134_3] = var_134_1[math.random(1, #var_134_1)]
                end

                return slot_0_81_0[arg_134_3] or var_134_1[1]
        end

        return slot_0_69_0(var_134_1, slot_0_92_0(), arg_134_2)
end

function slot_0_118_0(arg_135_0)
        local var_135_0 = arg_135_0.pitch_mode or 16

        slot_0_98_0(slot_0_21_0.pitch_mode, var_135_0)

        if var_135_0 == 16 then
                local var_135_1 = slot_0_117_0(arg_135_0.pitch or "89", arg_135_0.random_pitch, 50, "tick_pitch")

                if arg_135_0.random_pitch then
                        local var_135_2 = tonumber(arg_135_0.random_pitch_min) or 80
                        local var_135_3 = tonumber(arg_135_0.random_pitch_max) or 89

                        if var_135_3 < var_135_2 then
                                var_135_2, var_135_3 = var_135_3, var_135_2
                        end

                        var_135_1 = math.random(var_135_2, var_135_3)
                end

                slot_0_96_0(slot_0_21_0.pitch, var_135_1)
        end

        slot_0_98_0(slot_0_21_0.pitch_jitter, arg_135_0.pj_mode or 1)

        local var_135_4 = slot_0_117_0(arg_135_0.pitch_jitter or "0", false, 50, "tick_pj")

        slot_0_96_0(slot_0_21_0.pitch_jitter_val, var_135_4)
        slot_0_98_0(slot_0_21_0.yaw, arg_135_0.yaw_mode or 2)
        slot_0_98_0(slot_0_21_0.yaw_base, arg_135_0.yaw_base or 2)

        local var_135_5 = slot_0_117_0(arg_135_0.yaw_jitter or "0", arg_135_0.random_yj, 50, "tick_yj")

        if arg_135_0.random_yj then
                local var_135_6 = tonumber(arg_135_0.random_yj_min) or 0
                local var_135_7 = tonumber(arg_135_0.random_yj_max) or 30

                if var_135_7 < var_135_6 then
                        var_135_6, var_135_7 = var_135_7, var_135_6
                end

                var_135_5 = math.random(var_135_6, var_135_7)
        end

        slot_0_98_0(slot_0_21_0.yaw_jitter, arg_135_0.yj_mode or 1)
        slot_0_96_0(slot_0_21_0.yaw_jitter_val, var_135_5)

        local var_135_8 = slot_0_117_0(arg_135_0.spin or "0", arg_135_0.random_spin, 50, "tick_spin")

        if arg_135_0.random_spin then
                local var_135_9 = tonumber(arg_135_0.random_spin_min) or 0
                local var_135_10 = tonumber(arg_135_0.random_spin_max) or 100

                if var_135_10 < var_135_9 then
                        var_135_9, var_135_10 = var_135_10, var_135_9
                end

                var_135_8 = math.random(var_135_9, var_135_10)
        end

        local var_135_11 = arg_135_0.spin or "0"

        if var_135_11 ~= "" and var_135_11 ~= "0" then
                slot_0_99_0(slot_0_21_0.spin_enable, true)
        else
                slot_0_99_0(slot_0_21_0.spin_enable, false)
        end

        slot_0_96_0(slot_0_21_0.spin, var_135_8)
end

function slot_0_119_0()
        if not slot_0_44_0.enabled then
                return false
        end

        local var_136_0 = slot_0_92_0()
        local var_136_1 = slot_0_94_0()
        local var_136_2 = slot_0_44_0.conditions.on_damage

        if var_136_2 and var_136_2.enabled and slot_0_72_0 > 0 then
                local var_136_3 = slot_0_23_0.conditions.on_damage

                if (var_136_3 and var_136_3.dmg_duration or 64) > var_136_0 - slot_0_72_0 then
                        local var_136_4 = var_136_2
                        local var_136_5 = var_136_4.tick_count or 4

                        if var_136_5 < 1 then
                                var_136_5 = 1
                        end

                        local var_136_6 = var_136_0 % var_136_5 + 1
                        local var_136_7 = var_136_4.ticks[var_136_6]

                        if var_136_7 then
                                slot_0_118_0(var_136_7)

                                slot_0_44_0.current_tick = var_136_6
                                slot_0_44_0.current_cond_used = "on_damage"

                                return true
                        end
                end
        end

        local var_136_8 = slot_0_44_0.conditions.on_shot

        if var_136_8 and var_136_8.enabled and slot_0_73_0 > 0 then
                local var_136_9 = slot_0_23_0.conditions.on_shot

                if (var_136_9 and var_136_9.shot_duration or 32) > var_136_0 - slot_0_73_0 then
                        local var_136_10 = var_136_8
                        local var_136_11 = var_136_10.tick_count or 4

                        if var_136_11 < 1 then
                                var_136_11 = 1
                        end

                        local var_136_12 = var_136_0 % var_136_11 + 1
                        local var_136_13 = var_136_10.ticks[var_136_12]

                        if var_136_13 then
                                slot_0_118_0(var_136_13)

                                slot_0_44_0.current_tick = var_136_12
                                slot_0_44_0.current_cond_used = "on_shot"

                                return true
                        end
                end
        end

        local var_136_14 = "default"

        if var_136_1 ~= "default" and slot_0_44_0.conditions[var_136_1] and slot_0_44_0.conditions[var_136_1].enabled then
                var_136_14 = var_136_1
        end

        local var_136_15 = slot_0_44_0.conditions[var_136_14]

        if not var_136_15 then
                var_136_15 = slot_0_44_0.conditions.default

                if not var_136_15 then
                        return false
                end
        end

        local var_136_16 = var_136_15.tick_count or 4

        if var_136_16 < 1 then
                var_136_16 = 1
        end

        local var_136_17 = var_136_0 % var_136_16 + 1
        local var_136_18 = var_136_15.ticks[var_136_17]

        if not var_136_18 then
                return false
        end

        slot_0_118_0(var_136_18)

        slot_0_44_0.current_tick = var_136_17
        slot_0_44_0.current_cond_used = var_136_14

        return true
end

function slot_0_120_0(arg_137_0)
        if slot_0_44_0.enabled then
                slot_0_119_0()

                return
        end

        local var_137_0 = slot_0_23_0.conditions[arg_137_0]

        if not var_137_0 then
                return
        end

        local var_137_1 = slot_0_117_0(var_137_0.pitch_val or "89", var_137_0.pitch_random, var_137_0.pitch_speed, arg_137_0 .. "_pitch")

        if var_137_0.pitch_random then
                local var_137_2 = tonumber(var_137_0.pitch_rand_min) or 80
                local var_137_3 = tonumber(var_137_0.pitch_rand_max) or 89

                if var_137_3 < var_137_2 then
                        var_137_2, var_137_3 = var_137_3, var_137_2
                end

                var_137_1 = math.random(var_137_2, var_137_3)
        end

        slot_0_98_0(slot_0_21_0.pitch_mode, 16)
        slot_0_96_0(slot_0_21_0.pitch, var_137_1)

        local var_137_4 = var_137_0.pj_mode or 1

        slot_0_98_0(slot_0_21_0.pitch_jitter, var_137_4)

        local var_137_5 = slot_0_117_0(var_137_0.pj_val or "0", var_137_0.pj_random, var_137_0.pj_speed, arg_137_0 .. "_pj")

        if var_137_0.pj_random then
                local var_137_6 = tonumber(var_137_0.pj_rand_min) or 0
                local var_137_7 = tonumber(var_137_0.pj_rand_max) or 30

                if var_137_7 < var_137_6 then
                        var_137_6, var_137_7 = var_137_7, var_137_6
                end

                var_137_5 = math.random(var_137_6, var_137_7)
        end

        slot_0_96_0(slot_0_21_0.pitch_jitter_val, var_137_5)
        slot_0_99_0(slot_0_21_0.pitch_jitter_3way, var_137_0.pj_3way or false)

        local var_137_8 = var_137_0.yaw_mode

        if not var_137_8 or var_137_8 == 0 then
                var_137_8 = 2
        end

        slot_0_98_0(slot_0_21_0.yaw, var_137_8)

        local var_137_9 = var_137_0.yaw_base

        if not var_137_9 or var_137_9 == 0 then
                var_137_9 = 2
        end

        slot_0_98_0(slot_0_21_0.yaw_base, var_137_9)

        local var_137_10 = var_137_0.yj_mode or 1

        slot_0_98_0(slot_0_21_0.yaw_jitter, var_137_10)

        local var_137_11 = slot_0_117_0(var_137_0.yj_val or "0", var_137_0.yj_random, var_137_0.yj_speed, arg_137_0 .. "_yj")

        if var_137_0.yj_random then
                local var_137_12 = tonumber(var_137_0.yj_rand_min) or 0
                local var_137_13 = tonumber(var_137_0.yj_rand_max) or 30

                if var_137_13 < var_137_12 then
                        var_137_12, var_137_13 = var_137_13, var_137_12
                end

                var_137_11 = math.random(var_137_12, var_137_13)
        end

        slot_0_96_0(slot_0_21_0.yaw_jitter_val, var_137_11)
        slot_0_99_0(slot_0_21_0.yaw_jitter_3way, var_137_0.yj_3way or false)

        local var_137_14 = slot_0_117_0(var_137_0.spin_val or "0", var_137_0.spin_random, var_137_0.spin_speed, arg_137_0 .. "_spin")

        if var_137_0.spin_random then
                local var_137_15 = tonumber(var_137_0.spin_rand_min) or 0
                local var_137_16 = tonumber(var_137_0.spin_rand_max) or 100

                if var_137_16 < var_137_15 then
                        var_137_15, var_137_16 = var_137_16, var_137_15
                end

                var_137_14 = math.random(var_137_15, var_137_16)
        end

        local var_137_17 = var_137_0.spin_val or "0"

        if var_137_17 ~= "" and var_137_17 ~= "0" then
                slot_0_99_0(slot_0_21_0.spin_enable, true)
        else
                slot_0_99_0(slot_0_21_0.spin_enable, false)
        end

        slot_0_96_0(slot_0_21_0.spin, var_137_14)

        local var_137_18 = var_137_0.jitter_dis or 1

        slot_0_98_0(slot_0_21_0.jitter_disabler, var_137_18)
        slot_0_99_0(slot_0_21_0.hide_shot, var_137_0.hide_shot or false)
end

function slot_0_121_0()
        if not slot_0_19_0() then
                return
        end

        if not slot_0_31_0(slot_0_29_0.hud) then
                return
        end

        if not slot_0_93_0() then
                return
        end

        slot_138_1_0 = draw.surface

        if not slot_138_1_0 then
                return
        end

        slot_138_2_0 = draw.fonts.gui_main

        if slot_138_2_0 then
                slot_138_1_0.font = slot_138_2_0
        end

        slot_138_3_0 = slot_0_94_0()
        slot_138_4_0 = slot_0_23_0.conditions[slot_138_3_0]

        if not slot_138_4_0 then
                return
        end

        slot_138_5_0 = slot_0_77_0
        slot_138_6_5 = slot_0_78_0
        slot_138_7_0 = draw.color(255, 255, 255, 255)
        slot_138_8_0 = draw.color(100, 255, 100, 255)
        slot_138_9_0 = draw.color(255, 255, 100, 255)
        slot_138_10_0 = draw.color(100, 255, 255, 255)
        slot_138_11_0 = draw.color(255, 100, 100, 255)

        slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_5), "AA Builder v5.0", slot_138_8_0)

        slot_138_6_4 = slot_138_6_5 + 12

        slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_4), slot_138_3_0, slot_138_7_0)

        slot_138_6_3 = slot_138_6_4 + 10
        slot_138_12_0 = slot_0_117_0(slot_138_4_0.pitch_val or "89", slot_138_4_0.pitch_random, slot_138_4_0.pitch_speed, "pitch")

        slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_3), "Pitch: " .. slot_138_12_0, slot_138_9_0)

        slot_138_6_2 = slot_138_6_3 + 10
        slot_138_13_0 = slot_138_4_0.yaw_mode == 1 and "None" or slot_138_4_0.yaw_mode == 2 and "Back" or "Custom"
        slot_138_14_0 = slot_138_4_0.yaw_base == 1 and "View" or "Target"

        slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_2), "Yaw: " .. slot_138_13_0 .. "/" .. slot_138_14_0, slot_138_9_0)

        slot_138_6_1 = slot_138_6_2 + 10
        slot_138_15_0 = slot_0_117_0(slot_138_4_0.spin_val or "0", slot_138_4_0.spin_random, slot_138_4_0.spin_speed, "spin")

        if slot_138_15_0 ~= 0 then
                slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_1), "Spin: " .. slot_138_15_0, slot_138_9_0)

                slot_138_6_1 = slot_138_6_1 + 10
        end

        if (slot_138_4_0.pj_mode or 0) > 0 then
                slot_138_16_2 = slot_0_117_0(slot_138_4_0.pj_val or "0", slot_138_4_0.pj_random, slot_138_4_0.pj_speed, "pj")
                slot_138_17_2 = slot_138_4_0.pj_mode == 1 and "C" or "O"

                slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_1), "Pitch Jitter: " .. slot_138_16_2 .. " " .. slot_138_17_2 .. (slot_138_4_0.pj_3way and " 3W" or ""), slot_138_10_0)

                slot_138_6_1 = slot_138_6_1 + 10
        end

        if (slot_138_4_0.yj_mode or 0) > 0 then
                slot_138_16_1 = slot_0_117_0(slot_138_4_0.yj_val or "0", slot_138_4_0.yj_random, slot_138_4_0.yj_speed, "yj")
                slot_138_17_1 = slot_138_4_0.yj_mode == 1 and "C" or "O"

                slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_1), "Yaw Jitter: " .. slot_138_16_1 .. " " .. slot_138_17_1 .. (slot_138_4_0.yj_3way and " 3W" or ""), slot_138_10_0)

                slot_138_6_1 = slot_138_6_1 + 10
        end

        slot_138_16_0 = slot_0_92_0()
        slot_138_17_0 = slot_0_23_0.conditions.on_damage

        if slot_138_17_0 and slot_138_17_0.override_enabled and slot_138_16_0 - slot_0_72_0 < (slot_138_17_0.dmg_duration or 64) then
                slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_1), "ON DAMAGE!", slot_138_11_0)

                slot_138_6_1 = slot_138_6_1 + 10
        end

        slot_138_18_0 = slot_0_23_0.conditions.on_shot

        if slot_138_18_0 and slot_138_18_0.override_enabled and slot_138_16_0 - slot_0_73_0 < (slot_138_18_0.shot_duration or 32) then
                slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_1), "ON SHOT!", slot_138_11_0)

                slot_138_6_1 = slot_138_6_1 + 10
        end

        if slot_0_44_0.enabled then
                slot_138_19_0 = slot_0_44_0.current_cond_used or "default"
                slot_138_20_0 = string.format("TICKS: %d/%d [%s]", slot_0_44_0.current_tick or 1, slot_0_44_0.conditions[slot_138_19_0] and slot_0_44_0.conditions[slot_138_19_0].tick_count or 4, slot_138_19_0)

                slot_138_1_0:add_text(draw.vec2(slot_138_5_0, slot_138_6_1), slot_138_20_0, draw.color(255, 200, 100, 255))

                slot_138_6_0 = slot_138_6_1 + 10
        end
end

mods.events:add_listener("player_hurt")
mods.events:add_listener("weapon_fire")

function slot_0_122_0(arg_139_0)
        if not slot_0_31_0(slot_0_29_0.enable) then
                return
        end

        local var_139_0 = arg_139_0:get_name()
        local var_139_1 = slot_0_93_0()

        if not var_139_1 then
                return
        end

        if var_139_0 == "player_hurt" then
                local var_139_2 = arg_139_0:get_pawn_from_id("userid")

                if var_139_2 and var_139_2 == var_139_1 then
                        slot_0_72_0 = slot_0_92_0()
                        slot_0_74_0 = 0

                        local var_139_3 = slot_0_23_0.conditions.on_damage
                end
        elseif var_139_0 == "weapon_fire" then
                local var_139_4 = arg_139_0:get_pawn_from_id("userid")

                if var_139_4 and var_139_4 == var_139_1 then
                        slot_0_73_0 = slot_0_92_0()
                        slot_0_75_0 = 0

                        local var_139_5 = slot_0_23_0.conditions.on_shot
                end
        end
end

events.event:add(slot_0_122_0)

slot_0_123_0 = false
slot_0_124_0 = 0

function slot_0_125_0()
        local var_140_0 = slot_0_31_0(slot_0_29_0.enable)

        if var_140_0 then
                slot_0_20_0()
        end

        if not slot_0_19_0() then
                slot_0_115_0()

                return
        end

        if var_140_0 and not slot_0_123_0 then
                slot_0_101_0()
        elseif not var_140_0 and slot_0_123_0 then
                slot_0_102_0()

                slot_0_71_0 = false
        end

        slot_0_123_0 = var_140_0

        if not var_140_0 then
                return
        end

        if not slot_0_93_0() then
                return
        end

        slot_0_71_0 = true

        local var_140_1 = slot_0_94_0()

        slot_0_76_0 = var_140_1

        local var_140_2 = slot_0_92_0()
        local var_140_3 = slot_0_23_0.conditions.on_damage

        if var_140_3 and var_140_3.override_enabled and slot_0_72_0 > 0 then
                local var_140_4 = var_140_2 - slot_0_72_0

                if var_140_4 < (var_140_3.dmg_duration or 64) then
                        if var_140_4 == 0 or var_140_4 == 1 and slot_0_74_0 == 0 then
                                slot_0_74_0 = 1
                        end

                        slot_0_120_0("on_damage")

                        return
                elseif slot_0_74_0 == 1 then
                        slot_0_74_0 = 0
                end
        end

        local var_140_5 = slot_0_23_0.conditions.on_shot

        if var_140_5 and var_140_5.override_enabled and slot_0_73_0 > 0 then
                local var_140_6 = var_140_2 - slot_0_73_0

                if var_140_6 < (var_140_5.shot_duration or 32) then
                        if var_140_6 == 0 or var_140_6 == 1 and slot_0_75_0 == 0 then
                                slot_0_75_0 = 1
                        end

                        slot_0_120_0("on_shot")

                        return
                elseif slot_0_75_0 == 1 then
                        slot_0_75_0 = 0
                end
        end

        local var_140_7 = "default"
        local var_140_8 = slot_0_23_0.conditions[var_140_1]

        if var_140_1 ~= "default" and var_140_8 and var_140_8.override_enabled then
                var_140_7 = var_140_1
        end

        slot_0_120_0(var_140_7)
end

events.render_start_pre:add(slot_0_125_0)

slot_0_126_0 = "1"

function slot_0_127_0()
        slot_0_116_0()
        slot_0_121_0()

        local var_141_0 = slot_0_29_0.ticks_current.value or "1"

        if var_141_0 ~= slot_0_126_0 then
                slot_0_126_0 = var_141_0

                local var_141_1 = tonumber(var_141_0) or 1

                if var_141_1 >= 1 and var_141_1 <= slot_0_43_0 and var_141_1 ~= slot_0_41_0 then
                        slot_0_39_0(slot_0_41_0)
                        slot_0_114_0(var_141_1)

                        slot_0_41_0 = var_141_1
                end
        end
end

events.present_queue:add(slot_0_127_0)
slot_0_67_0()
slot_0_37_0()

slot_0_45_0 = "default"
slot_0_41_0 = 1

slot_0_32_0(slot_0_29_0.ticks_enable, slot_0_44_0.enabled)
slot_0_90_0(slot_0_29_0.ticks_current, 1)

slot_0_128_0 = slot_0_44_0.conditions.default

if slot_0_128_0 then
        slot_0_32_0(slot_0_29_0.ticks_cond_enable, slot_0_128_0.enabled)
        slot_0_90_0(slot_0_29_0.ticks_count, slot_0_128_0.tick_count or 4)

        slot_0_129_1 = slot_0_128_0.ticks[1]

        if slot_0_129_1 then
                slot_0_90_0(slot_0_29_0.ticks_pitch, slot_0_129_1.pitch or "89")
                slot_0_90_0(slot_0_29_0.ticks_pitch_jitter, slot_0_129_1.pitch_jitter or "0")
                slot_0_90_0(slot_0_29_0.ticks_yaw_jitter, slot_0_129_1.yaw_jitter or "0")
                slot_0_90_0(slot_0_29_0.ticks_spin, slot_0_129_1.spin or "0")
                slot_0_89_0(slot_0_29_0.ticks_yaw_mode, slot_0_129_1.yaw_mode or 2)
                slot_0_89_0(slot_0_29_0.ticks_yaw_base, slot_0_129_1.yaw_base or 2)
                slot_0_89_0(slot_0_29_0.ticks_pj_mode, slot_0_129_1.pj_mode or 1)
                slot_0_89_0(slot_0_29_0.ticks_yj_mode, slot_0_129_1.yj_mode or 1)
                slot_0_32_0(slot_0_29_0.ticks_rand_pitch, slot_0_129_1.random_pitch or false)
                slot_0_90_0(slot_0_29_0.ticks_rand_pitch_min, slot_0_129_1.random_pitch_min or "80")
                slot_0_90_0(slot_0_29_0.ticks_rand_pitch_max, slot_0_129_1.random_pitch_max or "89")
                slot_0_32_0(slot_0_29_0.ticks_rand_yj, slot_0_129_1.random_yj or false)
                slot_0_90_0(slot_0_29_0.ticks_rand_yj_min, slot_0_129_1.random_yj_min or "0")
                slot_0_90_0(slot_0_29_0.ticks_rand_yj_max, slot_0_129_1.random_yj_max or "30")
                slot_0_32_0(slot_0_29_0.ticks_rand_spin, slot_0_129_1.random_spin or false)
                slot_0_90_0(slot_0_29_0.ticks_rand_spin_min, slot_0_129_1.random_spin_min or "0")
                slot_0_90_0(slot_0_29_0.ticks_rand_spin_max, slot_0_129_1.random_spin_max or "100")
        end
end

slot_0_103_0 = slot_0_30_0(slot_0_29_0.cond)

slot_0_35_0(slot_0_34_0(slot_0_103_0))
slot_0_116_0()

slot_0_25_0 = false

slot_0_107_0()

slot_0_129_0 = 0

events.present_queue:add(function()
        local var_142_0 = slot_0_92_0()

        if var_142_0 - slot_0_129_0 >= 256 then
                slot_0_129_0 = var_142_0

                local var_142_1 = slot_0_91_0(slot_0_29_0.ticks_current, 1)

                if var_142_1 < 1 then
                        var_142_1 = 1
                end

                if var_142_1 > slot_0_43_0 then
                        var_142_1 = slot_0_43_0
                end

                slot_0_39_0(var_142_1)
        end
end)
slot_0_63_0()
