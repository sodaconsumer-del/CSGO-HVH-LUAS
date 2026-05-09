--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi then
        return error("Turn on unsafe scripts")
end

slot_0_0_0 = (function()
        local var_1_0 = {}

        local function var_1_1(arg_2_0)
                arg_2_0 = arg_2_0:gsub("\"", "\\\"")
                arg_2_0 = arg_2_0:gsub("\n", "\\n")
                arg_2_0 = arg_2_0:gsub("\r", "\\r")
                arg_2_0 = arg_2_0:gsub("\t", "\\t")
                arg_2_0 = arg_2_0:gsub("\b", "\\b")
                arg_2_0 = arg_2_0:gsub("\f", "\\f")

                return "\"" .. arg_2_0 .. "\""
        end

        function var_1_0.stringify(arg_3_0)
                if type(arg_3_0) == "string" then
                        return var_1_1(arg_3_0)
                elseif type(arg_3_0) == "number" or type(arg_3_0) == "boolean" then
                        return tostring(arg_3_0)
                elseif type(arg_3_0) == "table" then
                        local var_3_0 = {}

                        for iter_3_0, iter_3_1 in pairs(arg_3_0) do
                                local var_3_1 = type(iter_3_0) == "string" and iter_3_0:match("^[%w_]+$") and iter_3_0 or var_1_1(tostring(iter_3_0))
                                local var_3_2 = var_1_0.stringify(iter_3_1)

                                table.insert(var_3_0, var_3_1 .. ":" .. var_3_2)
                        end

                        return "{" .. table.concat(var_3_0, ",") .. "}"
                elseif arg_3_0 == nil then
                        return "null"
                else
                        return "null"
                end
        end

        function var_1_0.parse(arg_4_0)
                local function var_4_0(arg_5_0, arg_5_1)
                        local var_5_0 = arg_5_0:sub(arg_5_1, arg_5_1)

                        if var_5_0 == "\"" then
                                local var_5_1 = arg_5_0:find("\"", arg_5_1 + 1)

                                return arg_5_0:sub(arg_5_1 + 1, var_5_1 - 1), var_5_1 + 1
                        elseif var_5_0 == "{" then
                                local var_5_2 = {}
                                local var_5_3
                                local var_5_4

                                arg_5_1 = arg_5_1 + 1

                                while true do
                                        local var_5_5 = arg_5_0:sub(arg_5_1, arg_5_1)

                                        if var_5_5 == "}" then
                                                return var_5_2, arg_5_1 + 1
                                        elseif var_5_5 == "\"" then
                                                local var_5_6

                                                var_5_6, arg_5_1 = var_4_0(arg_5_0, arg_5_1)
                                                arg_5_1 = arg_5_1 + 1
                                                var_5_2[var_5_6], arg_5_1 = var_4_0(arg_5_0, arg_5_1)
                                        end

                                        if arg_5_0:sub(arg_5_1, arg_5_1) == "," then
                                                arg_5_1 = arg_5_1 + 1
                                        end
                                end
                        elseif var_5_0 == "[" then
                                local var_5_7 = {}

                                arg_5_1 = arg_5_1 + 1

                                while true do
                                        if arg_5_0:sub(arg_5_1, arg_5_1) == "]" then
                                                return var_5_7, arg_5_1 + 1
                                        else
                                                local var_5_8
                                                local var_5_9

                                                var_5_9, arg_5_1 = var_4_0(arg_5_0, arg_5_1)

                                                table.insert(var_5_7, var_5_9)
                                        end

                                        if arg_5_0:sub(arg_5_1, arg_5_1) == "," then
                                                arg_5_1 = arg_5_1 + 1
                                        end
                                end
                        elseif arg_5_0:sub(arg_5_1, arg_5_1 + 3) == "true" then
                                return true, arg_5_1 + 4
                        elseif arg_5_0:sub(arg_5_1, arg_5_1 + 4) == "false" then
                                return false, arg_5_1 + 5
                        elseif arg_5_0:sub(arg_5_1, arg_5_1 + 3) == "null" then
                                return nil, arg_5_1 + 4
                        else
                                local var_5_10 = arg_5_0:match("^-?%d+%.?%d*", arg_5_1)

                                return tonumber(var_5_10), arg_5_1 + #var_5_10
                        end
                end

                return var_4_0(arg_4_0, 1)
        end

        return var_1_0
end)()
slot_0_1_0 = ffi.cast("uint64_t(__stdcall*)(const char*)", utils.find_export("kernel32.dll", "GetModuleHandleA"))
slot_0_2_0 = ffi.cast("uint64_t(__stdcall*)(uint64_t, const char*)", utils.find_export("kernel32.dll", "GetProcAddress"))
slot_0_3_0 = slot_0_1_0("steam_api64.dll")
slot_0_4_0 = ffi.cast("void*(__thiscall*)()", slot_0_2_0(slot_0_3_0, "SteamClient"))
slot_0_5_0 = ffi.cast("int(__stdcall*)()", slot_0_2_0(slot_0_3_0, "SteamAPI_GetHSteamPipe"))
slot_0_6_0 = ffi.cast("int(__stdcall*)()", slot_0_2_0(slot_0_3_0, "SteamAPI_GetHSteamPipe"))
slot_0_7_0 = ffi.cast("void*(__thiscall*)(void*, int, const char*)", slot_0_2_0(slot_0_3_0, "SteamAPI_ISteamClient_GetISteamUtils"))
slot_0_9_0 = ffi.cast("uint64_t(__thiscall*)(void*, int, int, const char*)", slot_0_2_0(slot_0_3_0, "SteamAPI_ISteamClient_GetISteamHTTP"))(slot_0_4_0(), slot_0_5_0(), slot_0_6_0(), "STEAMHTTP_INTERFACE_VERSION003")
slot_0_10_0 = slot_0_7_0(slot_0_4_0(), slot_0_5_0(), "SteamUtils009")
slot_0_11_0 = assert
slot_0_12_0 = xpcall
slot_0_13_0 = error
slot_0_14_0 = setmetatable
slot_0_15_0 = tostring
slot_0_16_0 = tonumber
slot_0_17_0 = type
slot_0_18_0 = pairs
slot_0_19_0 = ipairs
slot_0_20_0 = string.format
slot_0_21_0 = ffi.typeof
slot_0_22_0 = ffi.sizeof
slot_0_23_0 = ffi.cast
slot_0_24_0 = ffi.cdef
slot_0_25_0 = ffi.string
slot_0_26_0 = ffi.gc
slot_0_27_0 = string.lower
slot_0_28_0 = string.len
slot_0_29_0 = string.find
slot_0_30_0 = utils.base64_encode
slot_0_31_1 = nil
slot_0_32_1 = nil

ffi.cdef("\t\ttypedef uint64_t SteamAPICall_t;\n\t\tstruct SteamAPI_callback_base_vtbl {\n\t\t\tvoid(__thiscall *run1)(struct SteamAPI_callback_base *, void *, bool, uint64_t);\n\t\t\tvoid(__thiscall *run2)(struct SteamAPI_callback_base *, void *);\n\t\t\tint(__thiscall *get_size)(struct SteamAPI_callback_base *);\n\t\t};\n\t\tstruct SteamAPI_callback_base {\n\t\t\tstruct SteamAPI_callback_base_vtbl *vtbl;\n\t\t\tuint8_t flags;\n\t\t\tint id;\n\t\t\tuint64_t api_call_handle;\n\t\t\tstruct SteamAPI_callback_base_vtbl vtbl_storage[1];\n\t\t};\n\t")

slot_0_33_1 = {
        [0] = "Steam gone",
        "Network failure",
        "Invalid handle",
        [3] = "Mismatched callback",
        [-1] = "No failure"
}
slot_0_34_1 = nil
slot_0_35_1 = nil
slot_0_36_1 = nil
slot_0_37_2 = nil
slot_0_38_1 = nil
slot_0_39_1 = slot_0_21_0("struct SteamAPI_callback_base")
slot_0_40_1 = slot_0_22_0(slot_0_39_1)
slot_0_41_1 = slot_0_21_0("struct SteamAPI_callback_base[1]")
slot_0_42_1 = slot_0_21_0("struct SteamAPI_callback_base*")
slot_0_43_1 = slot_0_21_0("uintptr_t")
slot_0_44_1 = {}
slot_0_45_1 = {}
slot_0_46_1 = {}

function slot_0_47_1(arg_6_0)
        return slot_0_15_0(slot_0_16_0(slot_0_23_0(slot_0_43_1, arg_6_0)))
end

function slot_0_48_1(arg_7_0, arg_7_1, arg_7_2)
        arg_7_2 = arg_7_2 and (slot_0_33_1[slot_0_38_1(arg_7_0.api_call_handle)] or "Unknown error")
        arg_7_0.api_call_handle = 0

        local var_7_0 = slot_0_47_1(arg_7_0)
        local var_7_1 = slot_0_44_1[var_7_0]

        if var_7_1 ~= nil then
                var_7_1(arg_7_1, arg_7_2)
        end

        if slot_0_45_1[var_7_0] ~= nil then
                slot_0_44_1[var_7_0] = nil
                slot_0_45_1[var_7_0] = nil
        end
end

function slot_0_49_1(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
        if arg_8_3 == arg_8_0.api_call_handle then
                slot_0_48_1(arg_8_0, arg_8_1, arg_8_2)
        end
end

function slot_0_50_1(arg_9_0, arg_9_1)
        slot_0_48_1(arg_9_0, arg_9_1, false)
end

function slot_0_51_1(arg_10_0)
        return slot_0_40_1
end

function slot_0_52_1(arg_11_0)
        if arg_11_0.api_call_handle ~= 0 then
                slot_0_35_1(arg_11_0, arg_11_0.api_call_handle)

                arg_11_0.api_call_handle = 0

                local var_11_0 = slot_0_47_1(arg_11_0)

                slot_0_44_1[var_11_0] = nil
                slot_0_45_1[var_11_0] = nil
        end
end

ffi.metatype(slot_0_39_1, {
        __gc = slot_0_52_1,
        __index = {
                cancel = slot_0_52_1
        }
})

slot_0_53_1 = slot_0_23_0("void(__thiscall *)(struct SteamAPI_callback_base *, void *, bool, uint64_t)", slot_0_49_1)
slot_0_54_1 = slot_0_23_0("void(__thiscall *)(struct SteamAPI_callback_base *, void *)", slot_0_50_1)
slot_0_55_1 = slot_0_23_0("int(__thiscall *)(struct SteamAPI_callback_base *)", slot_0_51_1)

function slot_0_31_0(arg_12_0, arg_12_1, arg_12_2)
        slot_0_11_0(arg_12_0 ~= 0)

        local var_12_0 = slot_0_41_1()
        local var_12_1 = slot_0_23_0(slot_0_42_1, var_12_0)

        var_12_1.vtbl_storage[0].run1 = slot_0_53_1
        var_12_1.vtbl_storage[0].run2 = slot_0_54_1
        var_12_1.vtbl_storage[0].get_size = slot_0_55_1
        var_12_1.vtbl = var_12_1.vtbl_storage
        var_12_1.api_call_handle = arg_12_0
        var_12_1.id = arg_12_2

        local var_12_2 = slot_0_47_1(var_12_1)

        slot_0_44_1[var_12_2] = arg_12_1
        slot_0_45_1[var_12_2] = var_12_0

        slot_0_34_1(var_12_1, arg_12_0)

        return var_12_1
end

function slot_0_32_0(arg_13_0, arg_13_1)
        slot_0_11_0(slot_0_46_1[arg_13_0] == nil)

        local var_13_0 = slot_0_41_1()
        local var_13_1 = slot_0_23_0(slot_0_42_1, var_13_0)

        var_13_1.vtbl_storage[0].run1 = slot_0_53_1
        var_13_1.vtbl_storage[0].run2 = slot_0_54_1
        var_13_1.vtbl_storage[0].get_size = slot_0_55_1
        var_13_1.vtbl = var_13_1.vtbl_storage
        var_13_1.api_call_handle = 0
        var_13_1.id = arg_13_0

        local var_13_2 = slot_0_47_1(var_13_1)

        slot_0_44_1[var_13_2] = arg_13_1
        slot_0_46_1[arg_13_0] = var_13_0

        slot_0_36_1(var_13_1, arg_13_0)
end

function slot_0_56_1(arg_14_0, arg_14_1, arg_14_2)
        return slot_0_23_0(arg_14_2, slot_0_23_0("void***", arg_14_0)[0][arg_14_1])
end

slot_0_34_1 = ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, uint64_t)", slot_0_2_0(slot_0_3_0, "SteamAPI_RegisterCallResult"))
slot_0_35_1 = ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, uint64_t)", slot_0_2_0(slot_0_3_0, "SteamAPI_UnregisterCallResult"))
slot_0_36_1 = ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, int)", slot_0_2_0(slot_0_3_0, "SteamAPI_RegisterCallback"))
slot_0_37_1 = ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *)", slot_0_2_0(slot_0_3_0, "SteamAPI_UnregisterCallback"))
slot_0_57_1 = ffi.cast("int(__thiscall*)(void*, SteamAPICall_t)", slot_0_2_0(slot_0_3_0, "SteamAPI_ISteamUtils_GetAPICallFailureReason"))

function slot_0_38_1(arg_15_0)
        return slot_0_57_1(slot_0_10_0, arg_15_0)
end

ffi.cdef("\ttypedef uint32_t http_HTTPRequestHandle;\n\ttypedef uint32_t http_HTTPCookieContainerHandle;\n\tenum http_EHTTPMethod {\n\t\tk_EHTTPMethodInvalid,\n\t\tk_EHTTPMethodGET,\n\t\tk_EHTTPMethodHEAD,\n\t\tk_EHTTPMethodPOST,\n\t\tk_EHTTPMethodPUT,\n\t\tk_EHTTPMethodDELETE,\n\t\tk_EHTTPMethodOPTIONS,\n\t\tk_EHTTPMethodPATCH,\n\t};\n\tstruct http_ISteamHTTPVtbl {\n\t\thttp_HTTPRequestHandle(__thiscall *CreateHTTPRequest)(uintptr_t, enum http_EHTTPMethod, const char *);\n\t\tbool(__thiscall *SetHTTPRequestContextValue)(uintptr_t, http_HTTPRequestHandle, uint64_t);\n\t\tbool(__thiscall *SetHTTPRequestNetworkActivityTimeout)(uintptr_t, http_HTTPRequestHandle, uint32_t);\n\t\tbool(__thiscall *SetHTTPRequestHeaderValue)(uintptr_t, http_HTTPRequestHandle, const char *, const char *);\n\t\tbool(__thiscall *SetHTTPRequestGetOrPostParameter)(uintptr_t, http_HTTPRequestHandle, const char *, const char *);\n\t\tbool(__thiscall *SendHTTPRequest)(uintptr_t, http_HTTPRequestHandle, SteamAPICall_t *);\n\t\tbool(__thiscall *SendHTTPRequestAndStreamResponse)(uintptr_t, http_HTTPRequestHandle, SteamAPICall_t *);\n\t\tbool(__thiscall *DeferHTTPRequest)(uintptr_t, http_HTTPRequestHandle);\n\t\tbool(__thiscall *PrioritizeHTTPRequest)(uintptr_t, http_HTTPRequestHandle);\n\t\tbool(__thiscall *GetHTTPResponseHeaderSize)(uintptr_t, http_HTTPRequestHandle, const char *, uint32_t *);\n\t\tbool(__thiscall *GetHTTPResponseHeaderValue)(uintptr_t, http_HTTPRequestHandle, const char *, uint8_t *, uint32_t);\n\t\tbool(__thiscall *GetHTTPResponseBodySize)(uintptr_t, http_HTTPRequestHandle, uint32_t *);\n\t\tbool(__thiscall *GetHTTPResponseBodyData)(uintptr_t, http_HTTPRequestHandle, uint8_t *, uint32_t);\n\t\tbool(__thiscall *GetHTTPStreamingResponseBodyData)(uintptr_t, http_HTTPRequestHandle, uint32_t, uint8_t *, uint32_t);\n\t\tbool(__thiscall *ReleaseHTTPRequest)(uintptr_t, http_HTTPRequestHandle);\n\t\tbool(__thiscall *GetHTTPDownloadProgressPct)(uintptr_t, http_HTTPRequestHandle, float *);\n\t\tbool(__thiscall *SetHTTPRequestRawPostBody)(uintptr_t, http_HTTPRequestHandle, const char *, uint8_t *, uint32_t);\n\t\thttp_HTTPCookieContainerHandle(__thiscall *CreateCookieContainer)(uintptr_t, bool);\n\t\tbool(__thiscall *ReleaseCookieContainer)(uintptr_t, http_HTTPCookieContainerHandle);\n\t\tbool(__thiscall *SetCookie)(uintptr_t, http_HTTPCookieContainerHandle, const char *, const char *, const char *);\n\t\tbool(__thiscall *SetHTTPRequestCookieContainer)(uintptr_t, http_HTTPRequestHandle, http_HTTPCookieContainerHandle);\n\t\tbool(__thiscall *SetHTTPRequestUserAgentInfo)(uintptr_t, http_HTTPRequestHandle, const char *);\n\t\tbool(__thiscall *SetHTTPRequestRequiresVerifiedCertificate)(uintptr_t, http_HTTPRequestHandle, bool);\n\t\tbool(__thiscall *SetHTTPRequestAbsoluteTimeoutMS)(uintptr_t, http_HTTPRequestHandle, uint32_t);\n\t\tbool(__thiscall *GetHTTPRequestWasTimedOut)(uintptr_t, http_HTTPRequestHandle, bool *pbWasTimedOut);\n\t};\n")

slot_0_33_0 = {
        head = 2,
        patch = 7,
        options = 6,
        delete = 5,
        get = 1,
        post = 3,
        put = 4
}
slot_0_34_0 = {
        [495] = "Cert Error",
        [494] = "Request Header Too Large",
        [497] = "HTTP to HTTPS",
        [496] = "No Cert",
        [499] = "Client Closed Request",
        [501] = "Not Implemented",
        [500] = "Internal Server Error",
        [503] = "Service Unavailable",
        [502] = "Bad Gateway",
        [505] = "HTTP Version Not Supported",
        [504] = "Gateway Timeout",
        [507] = "Insufficient Storage",
        [506] = "Variant Also Negotiates",
        [509] = "Bandwidth Limit Exceeded",
        [508] = "Loop Detected",
        [511] = "Network Authentication Required",
        [510] = "Not Extended",
        [250] = "Low on Storage Space",
        [101] = "Switching Protocols",
        [100] = "Continue",
        [404] = "Not Found",
        [551] = "Option not supported",
        [406] = "Not Acceptable",
        [407] = "Proxy Authentication Required",
        [102] = "Processing",
        [401] = "Unauthorized",
        [402] = "Payment Required",
        [403] = "Forbidden",
        [204] = "No Content",
        [413] = "Request Entity Too Large",
        [205] = "Reset Content",
        [415] = "Unsupported Media Type",
        [408] = "Request Timeout",
        [409] = "Conflict",
        [410] = "Gone",
        [411] = "Length Required",
        [200] = "OK",
        [418] = "I'm a teapot",
        [417] = "Expectation Failed",
        [416] = "Requested Range Not Satisfiable",
        [423] = "Locked",
        [422] = "Unprocessable Entity",
        [420] = "Enhance Your Calm",
        [426] = "Upgrade Required",
        [425] = "Unordered Collection",
        [424] = "Method Failure",
        [431] = "Request Header Fields Too Large",
        [300] = "Multiple Choices",
        [429] = "Too Many Requests",
        [428] = "Precondition Required",
        [308] = "Permanent Redirect",
        [307] = "Temporary Redirect",
        [306] = "Switch Proxy",
        [305] = "Use Proxy",
        [304] = "Not Modified",
        [444] = "No Response",
        [451] = "Redirect",
        [405] = "Method Not Allowed",
        [400] = "Bad Request",
        [449] = "Retry With",
        [455] = "Method Not Valid in This State",
        [452] = "Conference Not Found",
        [453] = "Not Enough Bandwidth",
        [458] = "Parameter Is Read-Only",
        [459] = "Aggregate Operation Not Allowed",
        [456] = "Header Field Not Valid for Resource",
        [457] = "Invalid Range",
        [462] = "Destination Unreachable",
        [207] = "Multi-Status",
        [460] = "Only Aggregate Operation Allowed",
        [461] = "Unsupported Transport",
        [412] = "Precondition Failed",
        [414] = "Request-URI Too Long",
        [226] = "IM Used",
        [598] = "Network read timeout error",
        [202] = "Accepted",
        [203] = "Non-Authoritative Information",
        [201] = "Created",
        [303] = "See Other",
        [302] = "Found",
        [301] = "Moved Permanently",
        [208] = "Already Reported",
        [450] = "Blocked by Windows Parental Controls",
        [599] = "Network connect timeout error",
        [454] = "Session Not Found",
        [206] = "Partial Content"
}
slot_0_35_0 = {
        "params",
        "body",
        "json"
}
slot_0_36_0 = 2101
slot_0_37_0 = 2102
slot_0_38_0 = 2103
slot_0_39_0 = slot_0_21_0("struct {\n\thttp_HTTPRequestHandle m_hRequest;\n\tuint64_t m_ulContextValue;\n\tbool m_bRequestSuccessful;\n\tint m_eStatusCode;\n\tuint32_t m_unBodySize;\n} *\n")
slot_0_40_0 = slot_0_21_0("struct {\n\thttp_HTTPRequestHandle m_hRequest;\n\tuint64_t m_ulContextValue;\n} *\n")
slot_0_41_0 = slot_0_21_0("struct {\n\thttp_HTTPRequestHandle m_hRequest;\n\tuint64_t m_ulContextValue;\n\tuint32_t m_cOffset;\n\tuint32_t m_cBytesReceived;\n} *\n")
slot_0_42_0 = slot_0_21_0("struct {\n\thttp_HTTPCookieContainerHandle m_hCookieContainer;\n}\n")
slot_0_43_0 = slot_0_21_0("SteamAPICall_t[1]")
slot_0_44_0 = slot_0_21_0("const char[?]")
slot_0_45_0 = slot_0_21_0("uint8_t[?]")
slot_0_46_0 = slot_0_21_0("unsigned int[?]")
slot_0_47_0 = slot_0_21_0("bool[1]")
slot_0_48_0 = slot_0_21_0("float[1]")

function slot_0_49_0()
        local var_16_0 = ffi.cast("struct http_ISteamHTTPVtbl**", slot_0_9_0)[0]

        if var_16_0 == 0 or var_16_0 == nil then
                return slot_0_13_0("find_isteamhttp failed")
        end

        return slot_0_9_0, var_16_0
end

function slot_0_50_0(arg_17_0, arg_17_1)
        return function(...)
                return arg_17_0(arg_17_1, ...)
        end
end

slot_0_51_0, slot_0_52_0 = slot_0_49_0()
slot_0_53_0 = slot_0_50_0(slot_0_52_0.CreateHTTPRequest, slot_0_51_0)
slot_0_54_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestContextValue, slot_0_51_0)
slot_0_55_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestNetworkActivityTimeout, slot_0_51_0)
slot_0_56_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestHeaderValue, slot_0_51_0)
slot_0_57_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestGetOrPostParameter, slot_0_51_0)
slot_0_58_0 = slot_0_50_0(slot_0_52_0.SendHTTPRequest, slot_0_51_0)
slot_0_59_0 = slot_0_50_0(slot_0_52_0.SendHTTPRequestAndStreamResponse, slot_0_51_0)
slot_0_60_0 = slot_0_50_0(slot_0_52_0.DeferHTTPRequest, slot_0_51_0)
slot_0_61_0 = slot_0_50_0(slot_0_52_0.PrioritizeHTTPRequest, slot_0_51_0)
slot_0_62_0 = slot_0_50_0(slot_0_52_0.GetHTTPResponseHeaderSize, slot_0_51_0)
slot_0_63_0 = slot_0_50_0(slot_0_52_0.GetHTTPResponseHeaderValue, slot_0_51_0)
slot_0_64_0 = slot_0_50_0(slot_0_52_0.GetHTTPResponseBodySize, slot_0_51_0)
slot_0_65_0 = slot_0_50_0(slot_0_52_0.GetHTTPResponseBodyData, slot_0_51_0)
slot_0_66_0 = slot_0_50_0(slot_0_52_0.GetHTTPStreamingResponseBodyData, slot_0_51_0)
slot_0_67_0 = slot_0_50_0(slot_0_52_0.ReleaseHTTPRequest, slot_0_51_0)
slot_0_68_0 = slot_0_50_0(slot_0_52_0.GetHTTPDownloadProgressPct, slot_0_51_0)
slot_0_69_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestRawPostBody, slot_0_51_0)
slot_0_70_0 = slot_0_50_0(slot_0_52_0.CreateCookieContainer, slot_0_51_0)
slot_0_71_0 = slot_0_50_0(slot_0_52_0.ReleaseCookieContainer, slot_0_51_0)
slot_0_72_0 = slot_0_50_0(slot_0_52_0.SetCookie, slot_0_51_0)
slot_0_73_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestCookieContainer, slot_0_51_0)
slot_0_74_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestUserAgentInfo, slot_0_51_0)
slot_0_75_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestRequiresVerifiedCertificate, slot_0_51_0)
slot_0_76_0 = slot_0_50_0(slot_0_52_0.SetHTTPRequestAbsoluteTimeoutMS, slot_0_51_0)
slot_0_77_0 = slot_0_50_0(slot_0_52_0.GetHTTPRequestWasTimedOut, slot_0_51_0)
slot_0_78_0 = {}
slot_0_79_0 = false
slot_0_80_0 = false
slot_0_81_0 = {}
slot_0_82_0 = false
slot_0_83_0 = {}
slot_0_84_0 = slot_0_14_0({}, {
        __mode = "k"
})
slot_0_85_0 = slot_0_14_0({}, {
        __mode = "k"
})
slot_0_86_0 = slot_0_14_0({}, {
        __mode = "v"
})
slot_0_87_0 = {}
slot_0_88_0 = {
        __metatable = false,
        __index = function(arg_19_0, arg_19_1)
                local var_19_0 = slot_0_85_0[arg_19_0]

                if var_19_0 == nil then
                        return
                end

                arg_19_1 = slot_0_15_0(arg_19_1)

                if var_19_0.m_hRequest ~= 0 then
                        local var_19_1 = slot_0_46_0(1)

                        if slot_0_62_0(var_19_0.m_hRequest, arg_19_1, var_19_1) and var_19_1 ~= nil then
                                local var_19_2 = var_19_1[0]

                                if var_19_2 < 0 then
                                        return
                                end

                                local var_19_3 = slot_0_45_0(var_19_2)

                                if slot_0_63_0(var_19_0.m_hRequest, arg_19_1, var_19_3, var_19_2) then
                                        arg_19_0[arg_19_1] = slot_0_25_0(var_19_3, var_19_2 - 1)

                                        return arg_19_0[arg_19_1]
                                end
                        end
                end
        end
}
slot_0_89_0 = {
        __metatable = false,
        __index = {
                set_cookie = function(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
                        local var_20_0 = slot_0_84_0[arg_20_0]

                        if var_20_0 == nil or var_20_0.m_hCookieContainer == 0 then
                                return
                        end

                        slot_0_72_0(var_20_0.m_hCookieContainer, arg_20_1, arg_20_2, slot_0_15_0(arg_20_3) .. "=" .. slot_0_15_0(arg_20_4))
                end
        }
}

function slot_0_90_0(arg_21_0)
        if arg_21_0.m_hCookieContainer ~= 0 then
                slot_0_71_0(arg_21_0.m_hCookieContainer)

                arg_21_0.m_hCookieContainer = 0
        end
end

function slot_0_91_0(arg_22_0)
        if arg_22_0.m_hRequest ~= 0 then
                slot_0_67_0(arg_22_0.m_hRequest)

                arg_22_0.m_hRequest = 0
        end
end

function slot_0_92_0(arg_23_0, ...)
        slot_0_67_0(arg_23_0)

        return slot_0_13_0(...)
end

function slot_0_93_0(arg_24_0, arg_24_1, arg_24_2, arg_24_3, ...)
        local var_24_0 = slot_0_86_0[arg_24_0.m_hRequest]

        if var_24_0 == nil then
                var_24_0 = slot_0_14_0({}, slot_0_88_0)
                slot_0_86_0[arg_24_0.m_hRequest] = var_24_0
        end

        slot_0_85_0[var_24_0] = arg_24_0
        arg_24_3.headers = var_24_0
        slot_0_79_0 = true

        arg_24_1(arg_24_2, arg_24_3, ...)

        slot_0_79_0 = false
end

function slot_0_94_0(arg_25_0, arg_25_1)
        if arg_25_0 == nil then
                return
        end

        local var_25_0 = slot_0_23_0(slot_0_39_0, arg_25_0)

        if var_25_0.m_hRequest ~= 0 then
                local var_25_1 = slot_0_78_0[var_25_0.m_hRequest]

                if var_25_1 ~= nil then
                        slot_0_78_0[var_25_0.m_hRequest] = nil
                        slot_0_83_0[var_25_0.m_hRequest] = nil
                        slot_0_81_0[var_25_0.m_hRequest] = nil

                        if var_25_1 then
                                local var_25_2 = arg_25_1 == false and var_25_0.m_bRequestSuccessful
                                local var_25_3 = var_25_0.m_eStatusCode
                                local var_25_4 = {
                                        status = var_25_3
                                }
                                local var_25_5 = var_25_0.m_unBodySize

                                if var_25_2 and var_25_5 > 0 then
                                        local var_25_6 = slot_0_45_0(var_25_5)

                                        if slot_0_65_0(var_25_0.m_hRequest, var_25_6, var_25_5) then
                                                var_25_4.body = slot_0_25_0(var_25_6, var_25_5)
                                        end
                                elseif not var_25_0.m_bRequestSuccessful then
                                        local var_25_7 = slot_0_47_0()

                                        slot_0_77_0(var_25_0.m_hRequest, var_25_7)

                                        var_25_4.timed_out = var_25_7 ~= nil and var_25_7[0] == true
                                end

                                if var_25_3 > 0 then
                                        var_25_4.status_message = slot_0_34_0[var_25_3] or "Unknown status"
                                elseif arg_25_1 then
                                        var_25_4.status_message = slot_0_20_0("IO Failure: %s", arg_25_1)
                                else
                                        var_25_4.status_message = var_25_4.timed_out and "Timed out" or "Unknown error"
                                end

                                slot_0_93_0(var_25_0, var_25_1, var_25_2, var_25_4)
                        end

                        slot_0_91_0(var_25_0)
                end
        end
end

function slot_0_95_0(arg_26_0, arg_26_1)
        if arg_26_0 == nil then
                return
        end

        local var_26_0 = slot_0_23_0(slot_0_40_0, arg_26_0)

        if var_26_0.m_hRequest ~= 0 then
                local var_26_1 = slot_0_81_0[var_26_0.m_hRequest]

                if var_26_1 then
                        slot_0_93_0(var_26_0, var_26_1, arg_26_1 == false, {})
                end
        end
end

function slot_0_96_0(arg_27_0, arg_27_1)
        if arg_27_0 == nil then
                return
        end

        local var_27_0 = slot_0_23_0(slot_0_41_0, arg_27_0)

        if var_27_0.m_hRequest ~= 0 then
                local var_27_1 = slot_0_83_0[var_27_0.m_hRequest]

                if slot_0_83_0[var_27_0.m_hRequest] then
                        local var_27_2 = {}
                        local var_27_3 = slot_0_48_0()

                        if slot_0_68_0(var_27_0.m_hRequest, var_27_3) then
                                var_27_2.download_progress = slot_0_16_0(var_27_3[0])
                        end

                        local var_27_4 = slot_0_45_0(var_27_0.m_cBytesReceived)

                        if slot_0_66_0(var_27_0.m_hRequest, var_27_0.m_cOffset, var_27_4, var_27_0.m_cBytesReceived) then
                                var_27_2.body = slot_0_25_0(var_27_4, var_27_0.m_cBytesReceived)
                        end

                        slot_0_93_0(var_27_0, var_27_1, arg_27_1 == false, var_27_2)
                end
        end
end

function slot_0_97_0(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
        if slot_0_17_0(arg_28_2) == "function" and arg_28_3 == nil then
                arg_28_3 = arg_28_2
                arg_28_2 = {}
        end

        arg_28_2 = arg_28_2 or {}
        slot_28_4_0 = slot_0_33_0[slot_0_27_0(slot_0_15_0(arg_28_0))]

        if slot_28_4_0 == nil then
                return slot_0_13_0("invalid HTTP method")
        end

        if slot_0_17_0(arg_28_1) ~= "string" then
                return slot_0_13_0("URL has to be a string")
        end

        slot_28_5_0 = nil
        slot_28_6_0 = nil
        slot_28_7_0 = nil

        if slot_0_17_0(arg_28_3) == "function" then
                slot_28_5_0 = arg_28_3
        elseif slot_0_17_0(arg_28_3) == "table" then
                slot_28_5_0 = arg_28_3.completed or arg_28_3.complete
                slot_28_6_0 = arg_28_3.headers_received or arg_28_3.headers
                slot_28_7_0 = arg_28_3.data_received or arg_28_3.data

                if slot_28_5_0 ~= nil and slot_0_17_0(slot_28_5_0) ~= "function" then
                        return slot_0_13_0("callbacks.completed callback has to be a function")
                elseif slot_28_6_0 ~= nil and slot_0_17_0(slot_28_6_0) ~= "function" then
                        return slot_0_13_0("callbacks.headers_received callback has to be a function")
                elseif slot_28_7_0 ~= nil and slot_0_17_0(slot_28_7_0) ~= "function" then
                        return slot_0_13_0("callbacks.data_received callback has to be a function")
                end
        else
                return slot_0_13_0("callbacks has to be a function or table")
        end

        slot_28_8_0 = slot_0_53_0(slot_28_4_0, arg_28_1)

        if slot_28_8_0 == 0 then
                return slot_0_13_0("Failed to create HTTP request")
        end

        slot_28_9_0 = false

        for iter_28_0, iter_28_1 in slot_0_19_0(slot_0_35_0) do
                if arg_28_2[iter_28_1] ~= nil then
                        if slot_28_9_0 then
                                return slot_0_13_0("can only set options.params, options.body or options.json")
                        else
                                slot_28_9_0 = true
                        end
                end
        end

        slot_28_10_0 = nil

        if arg_28_2.json ~= nil then
                slot_28_10_0 = slot_0_0_0.stringify(arg_28_2.json)

                if not slot_28_10_0 then
                        return slot_0_13_0("options.json is invalid")
                end
        end

        slot_28_11_0 = arg_28_2.network_timeout

        if slot_28_11_0 == nil then
                slot_28_11_0 = 10
        end

        if slot_0_17_0(slot_28_11_0) == "number" and slot_28_11_0 > 0 then
                if not slot_0_55_0(slot_28_8_0, slot_28_11_0) then
                        return slot_0_92_0(slot_28_8_0, "failed to set network_timeout")
                end
        elseif slot_28_11_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.network_timeout has to be of type number and greater than 0")
        end

        slot_28_12_0 = arg_28_2.absolute_timeout

        if slot_28_12_0 == nil then
                slot_28_12_0 = 30
        end

        if slot_0_17_0(slot_28_12_0) == "number" and slot_28_12_0 > 0 then
                if not slot_0_76_0(slot_28_8_0, slot_28_12_0 * 1000) then
                        return slot_0_92_0(slot_28_8_0, "failed to set absolute_timeout")
                end
        elseif slot_28_12_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.absolute_timeout has to be of type number and greater than 0")
        end

        slot_28_13_0 = slot_28_10_0 ~= nil and "application/json" or "text/plain"
        slot_28_14_0 = nil
        slot_28_15_0 = arg_28_2.headers

        if slot_0_17_0(slot_28_15_0) == "table" then
                for iter_28_2, iter_28_3 in slot_0_18_0(slot_28_15_0) do
                        iter_28_2 = slot_0_15_0(iter_28_2)
                        iter_28_3 = slot_0_15_0(iter_28_3)
                        slot_28_21_1 = slot_0_27_0(iter_28_2)

                        if slot_28_21_1 == "content-type" then
                                slot_28_13_0 = iter_28_3
                        elseif slot_28_21_1 == "authorization" then
                                slot_28_14_0 = true
                        end

                        if not slot_0_56_0(slot_28_8_0, iter_28_2, iter_28_3) then
                                return slot_0_92_0(slot_28_8_0, "failed to set header " .. iter_28_2)
                        end
                end
        elseif slot_28_15_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.headers has to be of type table")
        end

        slot_28_16_0 = arg_28_2.authorization

        if slot_0_17_0(slot_28_16_0) == "table" then
                if slot_28_14_0 then
                        return slot_0_92_0(slot_28_8_0, "Cannot set both options.authorization and the 'Authorization' header.")
                end

                slot_28_17_1 = slot_28_16_0[1]
                slot_28_18_2 = slot_28_16_0[2]
                slot_28_19_1 = slot_0_20_0("Basic %s", slot_0_30_0(slot_0_20_0("%s:%s", slot_0_15_0(slot_28_17_1), slot_0_15_0(slot_28_18_2)), "base64"))

                if not slot_0_56_0(slot_28_8_0, "Authorization", slot_28_19_1) then
                        return slot_0_92_0(slot_28_8_0, "failed to apply options.authorization")
                end
        elseif slot_28_16_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.authorization has to be of type table")
        end

        slot_28_17_0 = slot_28_10_0 or arg_28_2.body

        if slot_0_17_0(slot_28_17_0) == "string" then
                slot_28_18_1 = slot_0_28_0(slot_28_17_0)

                if not slot_0_69_0(slot_28_8_0, slot_28_13_0, slot_0_23_0("unsigned char*", slot_28_17_0), slot_28_18_1) then
                        return slot_0_92_0(slot_28_8_0, "failed to set post body")
                end
        elseif slot_28_17_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.body has to be of type string")
        end

        slot_28_18_0 = arg_28_2.params

        if slot_0_17_0(slot_28_18_0) == "table" then
                for iter_28_4, iter_28_5 in slot_0_18_0(slot_28_18_0) do
                        iter_28_4 = slot_0_15_0(iter_28_4)

                        if not slot_0_57_0(slot_28_8_0, iter_28_4, slot_0_15_0(iter_28_5)) then
                                return slot_0_92_0(slot_28_8_0, "failed to set parameter " .. iter_28_4)
                        end
                end
        elseif slot_28_18_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.params has to be of type table")
        end

        slot_28_19_0 = arg_28_2.require_ssl

        if slot_0_17_0(slot_28_19_0) == "boolean" then
                if not slot_0_75_0(slot_28_8_0, slot_28_19_0 == true) then
                        return slot_0_92_0(slot_28_8_0, "failed to set require_ssl")
                end
        elseif slot_28_19_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.require_ssl has to be of type boolean")
        end

        slot_28_20_0 = arg_28_2.user_agent_info

        if slot_0_17_0(slot_28_20_0) == "string" then
                if not slot_0_74_0(slot_28_8_0, slot_0_15_0(slot_28_20_0)) then
                        return slot_0_92_0(slot_28_8_0, "failed to set user_agent_info")
                end
        elseif slot_28_20_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.user_agent_info has to be of type string")
        end

        slot_28_21_0 = arg_28_2.cookie_container

        if slot_0_17_0(slot_28_21_0) == "table" then
                slot_28_22_1 = slot_0_84_0[slot_28_21_0]

                if slot_28_22_1 ~= nil and slot_28_22_1.m_hCookieContainer ~= 0 then
                        if not slot_0_73_0(slot_28_8_0, slot_28_22_1.m_hCookieContainer) then
                                return slot_0_92_0(slot_28_8_0, "failed to set user_agent_info")
                        end
                else
                        return slot_0_92_0(slot_28_8_0, "options.cookie_container has to a valid cookie container")
                end
        elseif slot_28_21_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.cookie_container has to a valid cookie container")
        end

        slot_28_22_0 = slot_0_58_0
        slot_28_23_0 = arg_28_2.stream_response

        if slot_0_17_0(slot_28_23_0) == "boolean" then
                if slot_28_23_0 then
                        slot_28_22_0 = slot_0_59_0

                        if slot_28_5_0 == nil and slot_28_6_0 == nil and slot_28_7_0 == nil then
                                return slot_0_92_0(slot_28_8_0, "a 'completed', 'headers_received' or 'data_received' callback is required")
                        end
                elseif slot_28_5_0 == nil then
                        return slot_0_92_0(slot_28_8_0, "'completed' callback has to be set for non-streamed requests")
                elseif slot_28_6_0 ~= nil or slot_28_7_0 ~= nil then
                        return slot_0_92_0(slot_28_8_0, "non-streamed requests only support 'completed' callbacks")
                end
        elseif slot_28_23_0 ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.stream_response has to be of type boolean")
        end

        if slot_28_6_0 ~= nil or slot_28_7_0 ~= nil then
                slot_0_81_0[slot_28_8_0] = slot_28_6_0 or false

                if slot_28_6_0 ~= nil and not slot_0_80_0 then
                        slot_0_32_0(slot_0_37_0, slot_0_95_0)

                        slot_0_80_0 = true
                end

                slot_0_83_0[slot_28_8_0] = slot_28_7_0 or false

                if slot_28_7_0 ~= nil and not slot_0_82_0 then
                        slot_0_32_0(slot_0_38_0, slot_0_96_0)

                        slot_0_82_0 = true
                end
        end

        slot_28_24_0 = slot_0_43_0()

        if not slot_28_22_0(slot_28_8_0, slot_28_24_0) then
                slot_0_67_0(slot_28_8_0)

                if slot_28_5_0 ~= nil then
                        slot_28_5_0(false, {
                                status = 0,
                                status_message = "Failed to send request"
                        })
                end

                return
        end

        if arg_28_2.priority == "defer" or arg_28_2.priority == "prioritize" then
                if not (arg_28_2.priority == "prioritize" and slot_0_61_0 or slot_0_60_0)(slot_28_8_0) then
                        return slot_0_92_0(slot_28_8_0, "failed to set priority")
                end
        elseif arg_28_2.priority ~= nil then
                return slot_0_92_0(slot_28_8_0, "options.priority has to be 'defer' of 'prioritize'")
        end

        slot_0_78_0[slot_28_8_0] = slot_28_5_0 or false

        if slot_28_5_0 ~= nil then
                slot_0_31_0(slot_28_24_0[0], slot_0_94_0, slot_0_36_0)
        end
end

function slot_0_98_0(arg_29_0)
        if arg_29_0 ~= nil and slot_0_17_0(arg_29_0) ~= "boolean" then
                return slot_0_13_0("allow_modification has to be of type boolean")
        end

        local var_29_0 = slot_0_70_0(arg_29_0 == true)

        if var_29_0 ~= nil then
                local var_29_1 = slot_0_42_0(var_29_0)

                slot_0_26_0(var_29_1, slot_0_90_0)

                local var_29_2 = slot_0_14_0({}, slot_0_89_0)

                slot_0_84_0[var_29_2] = var_29_1

                return var_29_2
        end
end

slot_0_99_0 = {
        request = slot_0_97_0,
        create_cookie_container = slot_0_98_0
}

for iter_0_0 in slot_0_18_0(slot_0_33_0) do
        slot_0_99_0[iter_0_0] = function(...)
                return slot_0_97_0(iter_0_0, ...)
        end
end

slot_0_100_0 = {}
slot_0_101_0 = gui.text_input(gui.control_id("LUA > A > Bot name"))
slot_0_101_0.placeholder = "Insert bot name >.<"
slot_0_102_0 = gui.text_input(gui.control_id("LUA > A > Webhook URL"))
slot_0_102_0.placeholder = "Insert webhook >.<"
slot_0_103_0 = gui.text_input(gui.control_id("LUA > A > Log title"))
slot_0_103_0.placeholder = "Insert log title >.<"
slot_0_104_0 = gui.make_control("Bot name", slot_0_101_0)
slot_0_105_0 = gui.make_control("Webhook link", slot_0_102_0)
slot_0_106_0 = gui.make_control("Log title", slot_0_103_0)
slot_0_107_0 = gui.ctx:find("lua>elements a")

slot_0_107_0:add(slot_0_104_0)
slot_0_107_0:add(slot_0_105_0)
slot_0_107_0:add(slot_0_106_0)
slot_0_107_0:reset()

slot_0_108_0 = 1
slot_0_109_0 = {
        [0] = "None",
        "Head",
        "Neck",
        "Pelvis",
        "Stomach",
        "Lower Chest",
        "Chest",
        "Upper Chest",
        "Left Thigh",
        "Right Thigh",
        "Left Calf",
        "Right Calf",
        "Left Foot",
        "Right Foot",
        "Left Hand",
        "Right Hand",
        "Left Arm",
        "Left Forearm",
        "Right Arm",
        "Right Forearm",
        [-1] = "None"
}

function slot_0_110_0(arg_31_0)
        if arg_31_0:get_name() == "player_hurt" then
                local var_31_0 = entities.get_local_pawn()
                local var_31_1 = arg_31_0:get_pawn_from_id("attacker")
                local var_31_2 = arg_31_0:get_pawn_from_id("userid")
                local var_31_3 = arg_31_0:get_string("weapon")
                local var_31_4 = arg_31_0:get_int("health")
                local var_31_5 = arg_31_0:get_int("dmg_health")
                local var_31_6 = arg_31_0:get_int("hitgroup")

                if var_31_1 and var_31_2 and var_31_1 == var_31_0 then
                        local var_31_7 = "[" .. slot_0_103_0.value .. "]" .. " Hit " .. var_31_2:get_name() .. "'s " .. slot_0_109_0[var_31_6] .. " for " .. slot_0_15_0(var_31_5) .. " hp" .. " | Remaining HP: " .. slot_0_15_0(var_31_4) .. " | ID: " .. slot_0_108_0

                        slot_0_108_0 = slot_0_108_0 + 1

                        if slot_0_102_0.value and slot_0_102_0.value ~= "" and slot_0_102_0.value ~= " " then
                                local var_31_8 = "{\"content\":\"" .. var_31_7:gsub("\"", "\\\"") .. "\",\"username\":\"" .. (slot_0_101_0.value ~= "" and slot_0_101_0.value or "1tsuki-Logger"):gsub("\"", "\\\"") .. "\"}"

                                slot_0_99_0.post(slot_0_102_0.value, {
                                        headers = {
                                                ["Content-Type"] = "application/json"
                                        },
                                        body = var_31_8
                                }, function(arg_32_0, arg_32_1)
                                        if arg_32_0 and arg_32_1.status == 204 then
                                                -- block empty
                                        else
                                                print("Debug 發送失敗，狀態碼：" .. (arg_32_1.status or "未知"))

                                                if arg_32_1.body then
                                                        print("Debug 回應內容：" .. arg_32_1.body)
                                                end
                                        end
                                end)
                        end
                end
        end
end

mods.events:add_listener("player_hurt")
events.event:add(slot_0_110_0)
