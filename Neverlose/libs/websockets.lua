local function reloaded_0_0(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local reloaded_1_0 = utils.opcode_scan(arg_1_0, arg_1_1) or error("signature not found", 2)
	local reloaded_1_1 = ffi.cast("uintptr_t", reloaded_1_0)

	if arg_1_3 ~= nil and arg_1_3 ~= 0 then
		reloaded_1_1 = reloaded_1_1 + arg_1_3
	end

	if arg_1_4 ~= nil then
		for iter_1_0 = 1, arg_1_4 do
			reloaded_1_1 = ffi.cast("uintptr_t*", reloaded_1_1)[0]

			if reloaded_1_1 == nil then
				return error("signature not found")
			end
		end
	end

	return ffi.cast(arg_1_2, reloaded_1_1)
end

local reloaded_0_1
local reloaded_0_2

if not pcall(ffi.sizeof, "SteamAPICall_t") then
	ffi.cdef("            typedef uint64_t SteamAPICall_t;\n        ")
end

local reloaded_0_3 = ffi.typeof("        struct {\n            void(__thiscall *run1)(void*, void*, bool, uint64_t);\n            void(__thiscall *run2)(void*, void*);\n            int(__thiscall *get_size)(void*);\n        }\n    ")
local reloaded_0_4 = ffi.typeof("        struct {\n            $ *vtbl;\n            uint8_t flags;\n            int id;\n            uint64_t api_call_handle;\n            $ vtbl_storage[1];\n        }\n    ", reloaded_0_3, reloaded_0_3)
local reloaded_0_5 = {
	[0] = "Steam gone",
	"Network failure",
	"Invalid handle",
	[-1] = "No failure",
	[3] = "Mismatched callback"
}
local reloaded_0_6
local reloaded_0_7
local reloaded_0_8
local reloaded_0_9
local reloaded_0_10 = reloaded_0_4
local reloaded_0_11 = ffi.sizeof(reloaded_0_10)
local reloaded_0_12 = ffi.typeof("$[1]", reloaded_0_4)
local reloaded_0_13 = ffi.typeof("$*", reloaded_0_4)
local reloaded_0_14 = ffi.typeof("uintptr_t")
local reloaded_0_15 = {}
local reloaded_0_16 = {}
local reloaded_0_17 = {}

local function reloaded_0_18(arg_2_0)
	return tostring(tonumber(ffi.cast(reloaded_0_14, arg_2_0)))
end

local function reloaded_0_19(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.api_call_handle = 0

	local reloaded_3_0 = reloaded_0_18(arg_3_0)
	local reloaded_3_1 = reloaded_0_15[reloaded_3_0]

	if reloaded_3_1 ~= nil then
		xpcall(reloaded_3_1, print, arg_3_1, arg_3_2)
	end

	if reloaded_0_16[reloaded_3_0] ~= nil then
		reloaded_0_15[reloaded_3_0] = nil
		reloaded_0_16[reloaded_3_0] = nil
	end
end

local function reloaded_0_20(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if arg_4_3 == arg_4_0.api_call_handle then
		reloaded_0_19(arg_4_0, arg_4_1, arg_4_2)
	end
end

local function reloaded_0_21(arg_5_0, arg_5_1)
	reloaded_0_19(arg_5_0, arg_5_1, false)
end

local function reloaded_0_22(arg_6_0)
	return reloaded_0_11
end

local function reloaded_0_23(arg_7_0)
	if arg_7_0.api_call_handle ~= 0 then
		reloaded_0_7(arg_7_0, arg_7_0.api_call_handle)

		arg_7_0.api_call_handle = 0

		local reloaded_7_0 = reloaded_0_18(arg_7_0)

		reloaded_0_15[reloaded_7_0] = nil
		reloaded_0_16[reloaded_7_0] = nil
	end
end

pcall(ffi.metatype, reloaded_0_10, {
	__gc = reloaded_0_23,
	__index = {
		cancel = reloaded_0_23
	}
})

local reloaded_0_24 = ffi.cast(ffi.typeof("void(__thiscall*)($*, void*, bool, uint64_t)", reloaded_0_4), reloaded_0_20)
local reloaded_0_25 = ffi.cast(ffi.typeof("void(__thiscall*)($*, void*)", reloaded_0_4), reloaded_0_21)
local reloaded_0_26 = ffi.cast(ffi.typeof("int(__thiscall*)($*)", reloaded_0_4), reloaded_0_22)

local function reloaded_0_27(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_0 ~= 0 then
		local reloaded_8_0 = reloaded_0_12()
		local reloaded_8_1 = ffi.cast(reloaded_0_13, reloaded_8_0)

		reloaded_8_1.vtbl_storage[0].run1 = reloaded_0_24
		reloaded_8_1.vtbl_storage[0].run2 = reloaded_0_25
		reloaded_8_1.vtbl_storage[0].get_size = reloaded_0_26
		reloaded_8_1.vtbl = reloaded_8_1.vtbl_storage
		reloaded_8_1.api_call_handle = arg_8_0
		reloaded_8_1.id = arg_8_2

		local reloaded_8_2 = reloaded_0_18(reloaded_8_1)

		reloaded_0_15[reloaded_8_2] = arg_8_1
		reloaded_0_16[reloaded_8_2] = reloaded_8_0

		reloaded_0_6(reloaded_8_1, arg_8_0)

		return reloaded_8_1
	end
end

local function reloaded_0_28(arg_9_0, arg_9_1)
	if reloaded_0_17[arg_9_0] == nil then
		local reloaded_9_0 = reloaded_0_12()
		local reloaded_9_1 = ffi.cast(reloaded_0_13, reloaded_9_0)

		reloaded_9_1.vtbl_storage[0].run1 = reloaded_0_24
		reloaded_9_1.vtbl_storage[0].run2 = reloaded_0_25
		reloaded_9_1.vtbl_storage[0].get_size = reloaded_0_26
		reloaded_9_1.vtbl = reloaded_9_1.vtbl_storage
		reloaded_9_1.api_call_handle = 0
		reloaded_9_1.id = arg_9_0

		local reloaded_9_2 = reloaded_0_18(reloaded_9_1)

		reloaded_0_15[reloaded_9_2] = arg_9_1
		reloaded_0_17[arg_9_0] = reloaded_9_0

		reloaded_0_8(reloaded_9_1, arg_9_0)
	end
end

local function reloaded_0_29(arg_10_0, arg_10_1, arg_10_2)
	return ffi.cast(arg_10_2, ffi.cast("void***", arg_10_0)[0][arg_10_1])
end

reloaded_0_6 = reloaded_0_0("steam_api.dll", "55 8B EC 83 3D ? ? ? ? ? 7E ? 68 ? ? ? ? FF 15 ? ? ? ? 5D C3 FF 75 ? C7 05 ? ? ? ? ? ? ? ? FF 75 ? FF 75 ?", ffi.typeof("void(__cdecl*)($*, uint64_t)", reloaded_0_4))
reloaded_0_7 = reloaded_0_0("steam_api.dll", "55 8B EC FF 75 ? FF 75 ? FF 75 ? E8 ? ? ? ?", ffi.typeof("void(__cdecl*)($*, uint64_t)", reloaded_0_4))
reloaded_0_8 = reloaded_0_0("steam_api.dll", "55 8B EC 83 3D ? ? ? ? ? 7E ? 68 ? ? ? ? FF 15 ? ? ? ? 5D C3 C7 05 ? ? ? ? ? ? ? ?", ffi.typeof("void(__cdecl*)($*, int)", reloaded_0_4))

local reloaded_0_30 = reloaded_0_0("steam_api.dll", "E9 ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? 55 8B EC", ffi.typeof("void(__cdecl*)($*)", reloaded_0_4))

events.shutdown:set(function()
	for iter_11_0, iter_11_1 in pairs(reloaded_0_16) do
		local reloaded_11_0 = ffi.cast(reloaded_0_13, iter_11_1)

		reloaded_0_23(reloaded_11_0)
	end

	for iter_11_2, iter_11_3 in pairs(reloaded_0_17) do
		local reloaded_11_1 = ffi.cast(reloaded_0_13, iter_11_3)

		reloaded_0_30(reloaded_11_1)
	end
end)

if not pcall(ffi.sizeof, "http_HHTMLBrowser") then
	ffi.cdef("        typedef uint32_t http_HHTMLBrowser;\n\n        struct http_ISteamHTMLSurfaceVtbl {\n            bool(__thiscall *ISteamHTMLSurface)(uintptr_t);\n            bool(__thiscall *Init)(uintptr_t);\n            bool(__thiscall *Shutdown)(uintptr_t);\n            SteamAPICall_t(__thiscall *CreateBrowser)(uintptr_t, const char*, const char*);\n            void(__thiscall *RemoveBrowser)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *LoadURL)(uintptr_t, http_HHTMLBrowser, const char*, const char*);\n            void(__thiscall *SetSize)(uintptr_t, http_HHTMLBrowser, uint32_t, uint32_t);\n            void(__thiscall *StopLoad)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *Reload)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *GoBack)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *GoForward)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *AddHeader)(uintptr_t, http_HHTMLBrowser, const char*, const char*);\n            void(__thiscall *ExecuteJavascript)(uintptr_t, http_HHTMLBrowser, const char*);\n            void(__thiscall *MouseUp)(uintptr_t, http_HHTMLBrowser, int);\n            void(__thiscall *MouseDown)(uintptr_t, http_HHTMLBrowser, int);\n            void(__thiscall *MouseDoubleClick)(uintptr_t, http_HHTMLBrowser, int);\n            void(__thiscall *MouseMove)(uintptr_t, http_HHTMLBrowser, int, int);\n            void(__thiscall *MouseWheel)(uintptr_t, http_HHTMLBrowser, int32_t);\n            void(__thiscall *KeyDown)(uintptr_t, http_HHTMLBrowser, uint32_t, int, bool);\n            void(__thiscall *KeyUp)(uintptr_t, http_HHTMLBrowser, uint32_t, int);\n            void(__thiscall *KeyChar)(uintptr_t, http_HHTMLBrowser, uint32_t, int);\n            void(__thiscall *SetHorizontalScroll)(uintptr_t, http_HHTMLBrowser, uint32_t);\n            void(__thiscall *SetVerticalScroll)(uintptr_t, http_HHTMLBrowser, uint32_t);\n            void(__thiscall *SetKeyFocus)(uintptr_t, http_HHTMLBrowser, bool);\n            void(__thiscall *ViewSource)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *CopyToClipboard)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *PasteFromClipboard)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *Find)(uintptr_t, http_HHTMLBrowser, const char*, bool, bool);\n            void(__thiscall *StopFind)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *GetLinkAtPosition)(uintptr_t, http_HHTMLBrowser, int, int);\n            void(__thiscall *SetCookie)(uintptr_t, const char*, const char*, const char*, const char*, uint32_t, bool, bool);\n            void(__thiscall *SetPageScaleFactor)(uintptr_t, http_HHTMLBrowser, float, int, int);\n            void(__thiscall *SetBackgroundMode)(uintptr_t, http_HHTMLBrowser, bool);\n            void(__thiscall *SetDPIScalingFactor)(uintptr_t, http_HHTMLBrowser, float);\n            void(__thiscall *OpenDeveloperTools)(uintptr_t, http_HHTMLBrowser);\n            void(__thiscall *AllowStartRequest)(uintptr_t, http_HHTMLBrowser, bool);\n            void(__thiscall *JSDialogResponse)(uintptr_t, http_HHTMLBrowser, bool);\n            void(__thiscall *FileLoadDialogResponse)(uintptr_t, http_HHTMLBrowser, const char**);\n        };\n    ")
end

local reloaded_0_31 = 4501
local reloaded_0_32 = 4502
local reloaded_0_33 = 4503
local reloaded_0_34 = 4504
local reloaded_0_35 = 4505
local reloaded_0_36 = 4506
local reloaded_0_37 = 4507
local reloaded_0_38 = 4508
local reloaded_0_39 = 4509
local reloaded_0_40 = 4510
local reloaded_0_41 = 4511
local reloaded_0_42 = 4512
local reloaded_0_43 = 4513
local reloaded_0_44 = 4514
local reloaded_0_45 = 4515
local reloaded_0_46 = 4516
local reloaded_0_47 = 4521
local reloaded_0_48 = 4522
local reloaded_0_49 = 4523
local reloaded_0_50 = 4524
local reloaded_0_51 = 4525
local reloaded_0_52 = 4526
local reloaded_0_53 = 4527

local function reloaded_0_54()
	local reloaded_12_0 = reloaded_0_0("client.dll", "B9 ? ? ? ? E8 ? ? ? ? 83 3D ? ? ? ? ? 0F 84", "uintptr_t", 1, 1)
	local reloaded_12_1 = ffi.cast("uintptr_t*", reloaded_12_0)[18]

	if reloaded_12_1 == 0 then
		return error("find_isteamhtmlsurface failed")
	end

	local reloaded_12_2 = ffi.cast("struct http_ISteamHTMLSurfaceVtbl**", reloaded_12_1)[0]

	if reloaded_12_2 == nil then
		return error("find_isteamhtmlsurface failed")
	end

	return reloaded_12_1, reloaded_12_2
end

local function reloaded_0_55(arg_13_0, arg_13_1)
	return function(...)
		return arg_13_0(arg_13_1, ...)
	end
end

local reloaded_0_56 = ffi.typeof("struct {\n    http_HHTMLBrowser unBrowserHandle;\n} *\n")
local reloaded_0_57 = ffi.typeof("struct {\n    http_HHTMLBrowser unBrowserHandle;\n    const char* pchURL;\n    const char* pchTarget;\n    const char* pchPostData;\n    bool bIsRedirect;\n} *\n")
local reloaded_0_58 = ffi.typeof("struct {\n    http_HHTMLBrowser unBrowserHandle;\n    const char* pchURL;\n    const char* pchPageTitle;\n} *\n")
local reloaded_0_59 = ffi.typeof("struct {\n    http_HHTMLBrowser unBrowserHandle;\n    const char* pchMessage;\n} *\n")
local reloaded_0_60 = ffi.typeof("struct {\n    http_HHTMLBrowser unBrowserHandle;\n    const char* pchMessage;\n} *\n")
local reloaded_0_61 = ffi.typeof("struct {\n    http_HHTMLBrowser unBrowserHandle;\n    const char* pchTitle;\n} *\n")
local reloaded_0_62 = ffi.typeof("struct {\n    http_HHTMLBrowser unBrowserHandle;\n    const char* pchURL;\n    const char* pchPostData;\n    bool bIsRedirect;\n    const char* pchPageTitle;\n    bool bNewNavigation;\n} *\n")
local reloaded_0_63, reloaded_0_64 = reloaded_0_54()
local reloaded_0_65 = reloaded_0_55(reloaded_0_64.Init, reloaded_0_63)
local reloaded_0_66 = reloaded_0_55(reloaded_0_64.Shutdown, reloaded_0_63)
local reloaded_0_67 = reloaded_0_55(reloaded_0_64.CreateBrowser, reloaded_0_63)
local reloaded_0_68 = reloaded_0_55(reloaded_0_64.RemoveBrowser, reloaded_0_63)
local reloaded_0_69 = reloaded_0_55(reloaded_0_64.LoadURL, reloaded_0_63)
local reloaded_0_70 = reloaded_0_55(reloaded_0_64.SetSize, reloaded_0_63)
local reloaded_0_71 = reloaded_0_55(reloaded_0_64.StopLoad, reloaded_0_63)
local reloaded_0_72 = reloaded_0_55(reloaded_0_64.Reload, reloaded_0_63)
local reloaded_0_73 = reloaded_0_55(reloaded_0_64.GoBack, reloaded_0_63)
local reloaded_0_74 = reloaded_0_55(reloaded_0_64.GoForward, reloaded_0_63)
local reloaded_0_75 = reloaded_0_55(reloaded_0_64.AddHeader, reloaded_0_63)
local reloaded_0_76 = reloaded_0_55(reloaded_0_64.ExecuteJavascript, reloaded_0_63)
local reloaded_0_77 = reloaded_0_55(reloaded_0_64.MouseUp, reloaded_0_63)
local reloaded_0_78 = reloaded_0_55(reloaded_0_64.MouseDown, reloaded_0_63)
local reloaded_0_79 = reloaded_0_55(reloaded_0_64.MouseDoubleClick, reloaded_0_63)
local reloaded_0_80 = reloaded_0_55(reloaded_0_64.MouseMove, reloaded_0_63)
local reloaded_0_81 = reloaded_0_55(reloaded_0_64.MouseWheel, reloaded_0_63)
local reloaded_0_82 = reloaded_0_55(reloaded_0_64.KeyDown, reloaded_0_63)
local reloaded_0_83 = reloaded_0_55(reloaded_0_64.KeyUp, reloaded_0_63)
local reloaded_0_84 = reloaded_0_55(reloaded_0_64.KeyChar, reloaded_0_63)
local reloaded_0_85 = reloaded_0_55(reloaded_0_64.SetHorizontalScroll, reloaded_0_63)
local reloaded_0_86 = reloaded_0_55(reloaded_0_64.SetVerticalScroll, reloaded_0_63)
local reloaded_0_87 = reloaded_0_55(reloaded_0_64.SetKeyFocus, reloaded_0_63)
local reloaded_0_88 = reloaded_0_55(reloaded_0_64.ViewSource, reloaded_0_63)
local reloaded_0_89 = reloaded_0_55(reloaded_0_64.CopyToClipboard, reloaded_0_63)
local reloaded_0_90 = reloaded_0_55(reloaded_0_64.PasteFromClipboard, reloaded_0_63)
local reloaded_0_91 = reloaded_0_55(reloaded_0_64.Find, reloaded_0_63)
local reloaded_0_92 = reloaded_0_55(reloaded_0_64.StopFind, reloaded_0_63)
local reloaded_0_93 = reloaded_0_55(reloaded_0_64.GetLinkAtPosition, reloaded_0_63)
local reloaded_0_94 = reloaded_0_55(reloaded_0_64.SetCookie, reloaded_0_63)
local reloaded_0_95 = reloaded_0_55(reloaded_0_64.SetPageScaleFactor, reloaded_0_63)
local reloaded_0_96 = reloaded_0_55(reloaded_0_64.SetBackgroundMode, reloaded_0_63)
local reloaded_0_97 = reloaded_0_55(reloaded_0_64.SetDPIScalingFactor, reloaded_0_63)
local reloaded_0_98 = reloaded_0_55(reloaded_0_64.OpenDeveloperTools, reloaded_0_63)
local reloaded_0_99 = reloaded_0_55(reloaded_0_64.AllowStartRequest, reloaded_0_63)
local reloaded_0_100 = reloaded_0_55(reloaded_0_64.JSDialogResponse, reloaded_0_63)
local reloaded_0_101 = reloaded_0_55(reloaded_0_64.FileLoadDialogResponse, reloaded_0_63)
local reloaded_0_102
local reloaded_0_103 = {}
local reloaded_0_104 = {
	send = function(arg_15_0)
		if reloaded_0_102 ~= nil then
			reloaded_0_76(reloaded_0_102, string.format("Client.receive(%s)", json.stringify(arg_15_0)))
		end
	end,
	receive = function(arg_16_0, arg_16_1)
		arg_16_0 = json.parse(arg_16_0)

		if reloaded_0_103[arg_16_0.type] ~= nil then
			reloaded_0_103[arg_16_0.type](arg_16_0)
		end
	end,
	register_handler = function(arg_17_0, arg_17_1)
		reloaded_0_103[arg_17_0] = arg_17_1
	end
}
local reloaded_0_105 = {}
local reloaded_0_106 = {
	register = function(arg_18_0, arg_18_1)
		reloaded_0_105[arg_18_0] = arg_18_1
	end
}

reloaded_0_104.register_handler("rpc", function(arg_19_0)
	if reloaded_0_105[arg_19_0.method] then
		local reloaded_19_0 = {
			type = "rpc_resp",
			id = arg_19_0.id
		}
		local reloaded_19_1, reloaded_19_2 = pcall(reloaded_0_105[arg_19_0.method], unpack(arg_19_0.params or {}))

		if reloaded_19_1 then
			reloaded_19_0.result = reloaded_19_2
		else
			reloaded_19_0.error = reloaded_19_2
		end

		reloaded_0_104.send(reloaded_19_0)
	end
end)

local reloaded_0_107 = {}
local reloaded_0_108 = 0
local reloaded_0_109 = {
	call = function(arg_20_0, arg_20_1, ...)
		reloaded_0_108 = reloaded_0_108 + 1

		local reloaded_20_0 = {
			type = "rpc",
			method = arg_20_0,
			id = reloaded_0_108
		}
		local reloaded_20_1 = {
			...
		}

		if #reloaded_20_1 > 0 then
			reloaded_20_0.params = reloaded_20_1
		end

		reloaded_0_107[reloaded_0_108] = arg_20_1

		reloaded_0_104.send(reloaded_20_0)
	end
}

reloaded_0_104.register_handler("rpc_resp", function(arg_21_0)
	if reloaded_0_107[arg_21_0.id] ~= nil then
		if arg_21_0.error ~= nil then
			xpcall(reloaded_0_107[arg_21_0.id], print, arg_21_0.error)
		else
			xpcall(reloaded_0_107[arg_21_0.id], print, nil, arg_21_0.result)
		end
	end
end)

local function reloaded_0_110(arg_22_0)
	local reloaded_22_0 = "        // communication with client\n        var Client = (function(){\n            var handlers = {}\n            var _SendMessage = function(message) {\n                var json = JSON.stringify(message)\n\n                // console.log(`sending ${json}`)\n\n                if(json.length > 10200) {\n                    // alert has a size limit, so we need to use document.location.hash - should be rare since it has its own rate limiting too\n                    var ensureChangeChar = document.location.hash[1] == \"h\" ? \"H\" : \"h\"\n\n                    // setting location causes a HTML_ChangedTitle_t event (even if the title didnt actually change) so we set it to an empty string here and avoid that\n                    document.title = \"\"\n                    document.location.hash = ensureChangeChar + json\n\n                    // console.log(\"used hash with ensureChangeChar \" + JSON.stringify(ensureChangeChar))\n                } else if(json.length > 4090) {\n                    // alert has no rate limit but is rather slow (and limited to 10240 chars), so only use it if its required\n                    alert(json)\n                    // console.log(\"used alert\")\n                } else {\n                    // title has an even smaller size limit (4096), but its the fastest\n                    var ensureChangeChar = document.title[0] == \"t\" ? \"T\" : \"t\"\n                    document.title = ensureChangeChar + json\n                    // console.log(\"used title with ensureChangeChar \" + JSON.stringify(ensureChangeChar) + \" because title is \" + JSON.stringify(document.title))\n                }\n            }\n\n            var _RegisterHandler = function(type, callback) {\n                handlers[type] = callback\n            }\n\n            var _ReceiveMessage = function(message) {\n                if(handlers[message.type]) {\n                    handlers[message.type](message)\n                }\n            }\n\n            return {\n                send: _SendMessage,\n                register_handler: _RegisterHandler,\n                receive: _ReceiveMessage\n            }\n        })()\n\n        var RPCServer = (function(){\n            var rpc_functions = {}\n\n            // internal func to handle incoming RPC messages\n            var _RPCHandler = function(message) {\n                if(rpc_functions[message.method]) {\n                    var resp = {\n                        type: \"rpc_resp\",\n                        id: message.id\n                    }\n\n                    try {\n                        var params = message.params || []\n\n                        resp.result = rpc_functions[message.method](...params)\n                    } catch (e) {\n                        resp.error = e.toString()\n                    }\n\n                    Client.send(resp)\n                }\n            }\n            Client.register_handler(\"rpc\", _RPCHandler)\n\n            var _RegisterRPCFunction = function(name, callback) {\n                rpc_functions[name] = callback\n            }\n\n            return {\n                register: _RegisterRPCFunction\n            }\n        })()\n\n        RPCServer.register(\"add\", function(a, b){\n            return a + b\n        })\n\n        var RPCClient = (function(){\n            var index = 0\n            var pending_requests = {}\n\n            var _RPCRespHandler = function(message) {\n                if(pending_requests[message.id]) {\n                    if(message.error) {\n                        pending_requests[message.id].reject(message.error)\n                    } else {\n                        pending_requests[message.id].resolve(message.result)\n                    }\n                    pending_requests[message.id] = null\n                }\n            }\n            Client.register_handler(\"rpc_resp\", _RPCRespHandler)\n\n            var _Call = async function(method, params) {\n                index += 1\n                var req = {\n                    type: \"rpc\",\n                    method: method,\n                    id: index\n                }\n\n                if(params) {\n                    req.params = params\n                }\n\n                var result = new Promise((resolve, reject) => {\n                    pending_requests[index] = {resolve: resolve, reject: reject}\n                })\n\n                Client.send(req)\n\n                return result\n            }\n\n            return {\n                call: _Call\n            }\n        })()\n\n        // websocket implementation\n        var ws_api = (function(){\n            var open_websockets = []\n            var socket_index = 0\n\n            var _OnOpen = function(index, e) {\n                RPCClient.call(\"ws_open\", [index, {extensions: e.target.extensions, protocol: e.target.protocol}])\n            }\n\n            var _OnMessage = function(index, e) {\n                RPCClient.call(\"ws_message\", [index, e.data])\n            }\n\n            var _OnClose = function(index, e) {\n                RPCClient.call(\"ws_closed\", [index, e.code, e.reason, e.wasClean])\n                open_websockets[index] = null\n            }\n\n            var _OnError = function(index, error) {\n                RPCClient.call(\"ws_error\", [index])\n            }\n\n            RPCServer.register(\"ws_create\", function(url, protocols){\n                var index = socket_index++\n                console.log(`creating websocket with index ${index}`)\n                var socket = (typeof protocols != \"undefined\") ? (new WebSocket(url, protocols)) : (new WebSocket(url))\n\n                socket.onopen = _OnOpen.bind(null, index)\n                socket.onmessage = _OnMessage.bind(null, index)\n                socket.onclose = _OnClose.bind(null, index)\n                socket.onerror = _OnError.bind(null, index)\n\n                open_websockets[index] = socket\n\n                return index\n            })\n\n            RPCServer.register(\"ws_send\", function(index, data){\n                if(open_websockets[index]) {\n                    console.log(\"sending \", data)\n                    open_websockets[index].send(data)\n                }\n            })\n\n            RPCServer.register(\"ws_close\", function(index, code, reason){\n                if(open_websockets[index]) {\n                    open_websockets[index].close(code, reason)\n                }\n            })\n        })()\n\n        RPCClient.call(\"browser_ready\")\n    "
	local reloaded_22_1 = false

	local function reloaded_22_2(arg_23_0, arg_23_1)
		if arg_23_0 == nil then
			return
		end

		local reloaded_23_0 = ffi.cast(reloaded_0_56, arg_23_0)

		if reloaded_23_0.unBrowserHandle == nil then
			return
		end

		reloaded_0_102 = reloaded_23_0.unBrowserHandle

		reloaded_0_69(reloaded_0_102, "about:blank", "")
	end

	reloaded_0_28(reloaded_0_33, function(arg_24_0, arg_24_1)
		if arg_24_0 == nil then
			return
		end

		if ffi.cast(reloaded_0_57, arg_24_0).unBrowserHandle == reloaded_0_102 then
			reloaded_0_99(reloaded_0_102, true)
		end
	end)
	reloaded_0_28(reloaded_0_44, function(arg_25_0, arg_25_1)
		if arg_25_0 == nil then
			return
		end

		local reloaded_25_0 = ffi.cast(reloaded_0_59, arg_25_0)

		if reloaded_25_0.unBrowserHandle == reloaded_0_102 and reloaded_25_0.pchMessage ~= nil then
			local reloaded_25_1 = ffi.string(reloaded_25_0.pchMessage)

			reloaded_0_104.receive(reloaded_25_1, "alert")
			reloaded_0_100(reloaded_0_102, false)
		end
	end)
	reloaded_0_28(reloaded_0_38, function(arg_26_0, arg_26_1)
		if arg_26_0 == nil then
			return
		end

		local reloaded_26_0 = ffi.cast(reloaded_0_61, arg_26_0)

		if reloaded_26_0.unBrowserHandle == reloaded_0_102 and reloaded_26_0.pchTitle ~= nil then
			local reloaded_26_1 = ffi.string(reloaded_26_0.pchTitle)

			if reloaded_22_1 then
				reloaded_26_1 = reloaded_26_1:gsub("^about:blank#", "")

				local reloaded_26_2 = reloaded_26_1:sub(1, 1)

				if reloaded_26_2 == "t" or reloaded_26_2 == "T" then
					reloaded_0_104.receive(reloaded_26_1:sub(2, -1), "changedtitle")
				end
			elseif reloaded_26_1 == "about:blank" then
				reloaded_0_76(reloaded_0_102, reloaded_22_0)

				reloaded_22_1 = true

				if arg_22_0 ~= nil then
					xpcall(arg_22_0, print)
				end
			end
		end
	end)
	reloaded_0_28(reloaded_0_35, function(arg_27_0, arg_27_1)
		if arg_27_0 == nil then
			return
		end

		local reloaded_27_0 = ffi.cast(reloaded_0_62, arg_27_0)

		if reloaded_27_0.unBrowserHandle == reloaded_0_102 and reloaded_27_0.bNewNavigation == false and reloaded_27_0.bIsRedirect == false and reloaded_27_0.pchURL ~= nil then
			local reloaded_27_1 = ffi.string(reloaded_27_0.pchURL)

			if reloaded_22_1 then
				local reloaded_27_2 = reloaded_27_1:sub(1, 13)

				if reloaded_27_2 == "about:blank#h" or reloaded_27_2 == "about:blank#H" then
					reloaded_0_104.receive(reloaded_27_1:sub(14, -1), "hash")
				end
			end
		end
	end)

	local reloaded_22_3 = reloaded_0_67(nil, nil)

	reloaded_0_27(reloaded_22_3, reloaded_22_2, reloaded_0_31)
	events.shutdown:set(function()
		if reloaded_0_102 ~= nil then
			reloaded_0_68(reloaded_0_102)

			reloaded_0_102 = nil
		end
	end)
end

local reloaded_0_111 = {}
local reloaded_0_112 = setmetatable({}, {
	__mode = "k"
})

local function reloaded_0_113(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_1 ~= nil then
		local reloaded_29_0 = reloaded_0_112[arg_29_0]

		if reloaded_29_0 ~= nil and reloaded_29_0.callback_error ~= nil then
			xpcall(reloaded_29_0.callback_error, print, arg_29_0, arg_29_1)
		end
	end
end

local reloaded_0_114 = {
	__metatable = false,
	__index = {
		close = function(arg_30_0, arg_30_1, arg_30_2)
			local reloaded_30_0 = reloaded_0_112[arg_30_0]

			if reloaded_30_0 == nil then
				return
			end

			if not reloaded_30_0.open then
				return
			end

			reloaded_0_109.call("ws_close", reloaded_0_55(reloaded_0_113, arg_30_0), reloaded_30_0.index, arg_30_1, arg_30_2)
		end,
		send = function(arg_31_0, arg_31_1)
			local reloaded_31_0 = reloaded_0_112[arg_31_0]

			if reloaded_31_0 == nil then
				return
			end

			if not reloaded_31_0.open then
				return
			end

			reloaded_0_109.call("ws_send", reloaded_0_55(reloaded_0_113, arg_31_0), reloaded_31_0.index, tostring(arg_31_1))
		end
	}
}

reloaded_0_106.register("ws_open", function(arg_32_0, arg_32_1)
	local reloaded_32_0 = reloaded_0_111[arg_32_0]
	local reloaded_32_1 = reloaded_0_112[reloaded_32_0]

	if reloaded_32_1 ~= nil then
		reloaded_32_0.open = true
		reloaded_32_1.open = true
		reloaded_32_0.protocol = arg_32_1.protocol
		reloaded_32_0.extensions = arg_32_1.extensions

		if reloaded_32_1.callback_open ~= nil then
			xpcall(reloaded_32_1.callback_open, print, reloaded_32_0)
		end
	end
end)
reloaded_0_106.register("ws_message", function(arg_33_0, arg_33_1)
	local reloaded_33_0 = reloaded_0_111[arg_33_0]
	local reloaded_33_1 = reloaded_0_112[reloaded_33_0]

	if reloaded_33_1 ~= nil and reloaded_33_1.callback_message ~= nil then
		xpcall(reloaded_33_1.callback_message, print, reloaded_33_0, arg_33_1)
	end
end)
reloaded_0_106.register("ws_closed", function(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local reloaded_34_0 = reloaded_0_111[arg_34_0]
	local reloaded_34_1 = reloaded_0_112[reloaded_34_0]

	if reloaded_34_1 ~= nil then
		reloaded_34_0.open = false
		reloaded_34_1.open = false

		if reloaded_34_1.callback_close ~= nil then
			xpcall(reloaded_34_1.callback_close, print, reloaded_34_0, arg_34_1, arg_34_2, arg_34_3)
		end

		reloaded_0_111[arg_34_0] = nil
		reloaded_0_112[reloaded_34_0] = nil
	end
end)
reloaded_0_106.register("ws_error", function(arg_35_0, arg_35_1)
	local reloaded_35_0 = reloaded_0_111[arg_35_0]
	local reloaded_35_1 = reloaded_0_112[reloaded_35_0]

	if reloaded_35_1 ~= nil and reloaded_35_1.callback_error ~= nil then
		xpcall(reloaded_35_1.callback_error, print, reloaded_35_0)
	end
end)

local reloaded_0_115 = 0
local reloaded_0_116 = {}

local function reloaded_0_117(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	local reloaded_36_0 = arg_36_3.error

	reloaded_0_112[arg_36_0] = {
		open = false,
		callback_open = arg_36_3.open,
		callback_error = reloaded_36_0,
		callback_message = arg_36_3.message,
		callback_close = arg_36_3.close
	}

	reloaded_0_109.call("ws_create", function(arg_37_0, arg_37_1)
		if arg_37_0 then
			if reloaded_36_0 ~= nil then
				xpcall(reloaded_36_0, print, arg_36_0, arg_37_0)
			end

			reloaded_0_112[arg_36_0] = nil

			return
		end

		reloaded_0_111[arg_37_1] = arg_36_0
		reloaded_0_112[arg_36_0].index = arg_37_1
	end, arg_36_1, arg_36_2)
end

local function reloaded_0_118(arg_38_0, arg_38_1, arg_38_2)
	if arg_38_2 == nil then
		arg_38_2 = arg_38_1
		arg_38_1 = nil
	end

	if type(arg_38_0) ~= "string" then
		return error("Invalid url, has to be a string")
	end

	if type(arg_38_2) ~= "table" then
		return error("Invalid callbacks, has to be a table")
	elseif arg_38_2.open == nil or type(arg_38_2.open) ~= "function" then
		return error("Invalid callbacks, open callback has to be registered")
	elseif arg_38_2.open == nil and arg_38_2.error == nil and arg_38_2.message == nil and arg_38_2.close == nil then
		return error("Invalid callbacks, at least one callback has to be registered")
	elseif arg_38_2.error ~= nil and type(arg_38_2.error) ~= "function" or arg_38_2.message ~= nil and type(arg_38_2.message) ~= "function" or arg_38_2.close ~= nil and type(arg_38_2.close) ~= "function" then
		return error("Invalid callbacks, all callbacks have to be functions")
	end

	local reloaded_38_0

	if type(arg_38_1) == "table" then
		if type(arg_38_1.protocols) == "string" then
			reloaded_38_0 = arg_38_1.protocols
		elseif type(arg_38_1.protocols) == "table" and #arg_38_1.protocols > 0 then
			for iter_38_0 = 1, #arg_38_1.protocols do
				if type(arg_38_1.protocols[iter_38_0]) ~= "string" then
					return error("Invalid options.protocols, has to be an array of strings")
				end
			end

			reloaded_38_0 = arg_38_1.protocols
		elseif arg_38_1.protocols ~= nil then
			return error("Invalid options.protocols, has to be a string or array")
		end
	elseif arg_38_1 ~= nil then
		return error("Invalid options, has to be a table")
	end

	if reloaded_0_115 == 0 then
		reloaded_0_115 = 1

		reloaded_0_110(function()
			reloaded_0_115 = 2

			for iter_39_0 = 1, #reloaded_0_116 do
				local reloaded_39_0 = reloaded_0_116[iter_39_0]

				xpcall(reloaded_0_117, print, reloaded_39_0.websocket, reloaded_39_0.url, reloaded_39_0.protocols, reloaded_39_0.callbacks)
			end

			reloaded_0_116 = nil
		end)
	end

	local reloaded_38_1 = setmetatable({
		open = false,
		url = arg_38_0
	}, reloaded_0_114)

	if reloaded_0_115 ~= 2 then
		table.insert(reloaded_0_116, {
			websocket = reloaded_38_1,
			url = arg_38_0,
			protocols = reloaded_38_0,
			callbacks = arg_38_2
		})
	else
		reloaded_0_117(reloaded_38_1, arg_38_0, reloaded_38_0, arg_38_2)
	end

	return reloaded_38_1
end

return {
	connect = reloaded_0_118
}
