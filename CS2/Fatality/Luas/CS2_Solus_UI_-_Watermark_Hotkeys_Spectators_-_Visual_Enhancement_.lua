--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

if not ffi or not ws.test_capability("ffi") then
	game.engine:client_cmd("showconsole")
	gui.notify:add(gui.notification("Solus UI", "Error: make sure \"allow insecure is open\""))
	assert(ffi, "Solus UI: ffi is invalid, please open \"allow insecure\"")
end

ffi.cdef("    typedef struct { } hSteamUser;\n    typedef struct { } hSteamPipe;\n    typedef struct { } ISteamUser;\n    typedef struct { } ISteamUtils;\n    typedef struct { } ISteamClient;\n    typedef struct { } ID3D11Device;\n    typedef struct { } ID3D11Object;\n    typedef struct { } ISteamFriends;\n    typedef struct { } IDXGISwapChain;\n    typedef struct {\n        long x, y;\n    } Point;\n\n    typedef struct {\n        uint32_t dwLowDateTime;\n        uint32_t dwHighDateTime;\n    } FILETIME;\n\n    typedef struct {\n        uint8_t* pData;\n        uint32_t nSize;\n    } CDataBuffer;\n\n    typedef struct {\n        uint32_t LowPart;\n        int32_t HighPart;\n    } LUID;\n\n    typedef struct {\n        LUID Luid;\n        uint32_t Attributes;\n    } LUID_AND_ATTRIBUTES;\n    \n    typedef struct {\n        uint32_t PrivilegeCount;\n        LUID_AND_ATTRIBUTES Privileges[1];\n    } TOKEN_PRIVILEGES;\n\n    typedef struct {\n        int nSupported;\n        int nValue;\n    } ADLSingleSensorData;\n\n    typedef struct {\n        int nSize;\n        ADLSingleSensorData sensors[256];\n    } ADLPMLogDataOutput;\n\n    typedef struct {\n        uint32_t Data1;\n        uint16_t Data2;\n        uint16_t Data3;\n        uint8_t Data4[8];\n    } GUID;\n\n    typedef struct {\n        char pad_0x0[0x10];\n        void* hWindow;\n        char pad_0x0[0x158];\n        IDXGISwapChain* pSwapChain;\n    } CRenderDevice;\n\n    typedef struct {\n        uint16_t nYears;\n        uint16_t nMonths;\n        uint16_t nDayOfWeek;\n        uint16_t nDays;\n        uint16_t nHours;\n        uint16_t nMinutes;\n        uint16_t nSeconds;\n        uint16_t nMilliseconds;\n    } SystemTime;\n\n    typedef struct {\n        uint64_t nSteam64;\n    } CSteamID;\n\n    typedef struct {\n        uint32_t Numerator;\n        uint32_t Denominator;\n    } DXGI_RATIONAL;\n\n    typedef struct {\n        uint32_t Count;\n        uint32_t Quality;\n    } DXGI_SAMPLE_DESC;\n\n    typedef struct {\n        const void *pSysMem;\n        uint32_t SysMemPitch;\n        uint32_t SysMemSlicePitch;\n    } D3D11_SUBRESOURCE_DATA;\n    \n    typedef struct {\n        uint32_t Width;\n        uint32_t Height;\n        DXGI_RATIONAL RefreshRate;\n        uint32_t Format;\n        uint32_t ScanlineOrdering;\n        uint32_t Scaling;\n    } DXGI_MODE_DESC;\n\n    typedef struct {\n        DXGI_MODE_DESC BufferDesc;\n        DXGI_SAMPLE_DESC SampleDesc;\n        uint32_t BufferUsage;\n        uint32_t BufferCount;\n        void* OutputWindow;\n        int Windowed;\n        uint32_t SwapEffect;\n        uint32_t Flags;\n    } DXGI_SWAP_CHAIN_DESC;\n    \n    typedef struct {\n        uint32_t Width;\n        uint32_t Height;\n        uint32_t MipLevels;\n        uint32_t ArraySize;\n        uint32_t Format;\n        DXGI_SAMPLE_DESC SampleDesc;\n        uint32_t Usage;\n        uint32_t BindFlags;\n        uint32_t CPUAccessFlags;\n        uint32_t MiscFlags;\n    } D3D11_TEXTURE2D_DESC;\n\n    typedef struct {\n        uint32_t MostDetailedMip;\n        uint32_t MipLevels;\n    } D3D11_TEX2D_SRV;\n    \n    typedef struct  {\n        uint32_t MostDetailedMip;\n        uint32_t MipLevels;\n        uint32_t FirstArraySlice;\n        uint32_t ArraySize;\n    } D3D11_TEX2D_ARRAY_SRV;\n    \n    typedef struct {\n        uint32_t Format;\n        uint32_t ViewDimension;\n        union {\n            D3D11_TEX2D_SRV Texture2D;\n            D3D11_TEX2D_ARRAY_SRV Texture2DArray;\n        };\n\n    } D3D11_SHADER_RESOURCE_VIEW_DESC;\n\n    typedef struct {\n        void* hHandle;\n    } CHandle;\n\n    typedef struct {\n        int iSize;\n        int iAdapterIndex;\n        char strUDID[256];\n        int iBusNumber;\n        int iDeviceNumber;\n        int iFunctionNumber;\n        int iVendorID;\n        char strAdapterName[256];\n        char strDisplayName[256];\n        int iPresent;\n        int iExist;\n        char strDriverPath[256];\n        char strDriverPathExt[256];\n        char strPNPString[256];\n        int iOSDisplayIndex;\n    } CAMDAdapterInfo;\n\n    typedef struct {\n        int nSize;\n        int iEngineClock;\n        int iMemoryClock;\n        int iVddc;\n        int iActivityPercent;\n        int iCurrentPerformanceLevel;\n        int iCurrentBusSpeed;\n        int iCurrentBusLanes;\n        int iMaximumBusLanes;\n        int iReserved;\n    } ADLPMActivity;\n\n        typedef union {\n        struct {\n            uint32_t LowPart;\n            int32_t HighPart;\n        };\n\n        struct {\n            uint32_t LowPart;\n            int32_t HighPart;\n        } u;\n\n        int64_t QuadPart;\n    } LARGE_INTEGER;\n\n    typedef struct {\n        union {\n            uint32_t dwOemId;\n            struct {\n                uint16_t wProcessorArchitecture;\n                uint16_t wReserved;\n            };\n        };\n\n        uint32_t dwPageSize;\n        uintptr_t lpMinimumApplicationAddress;\n        uintptr_t lpMaximumApplicationAddress;\n        uint64_t dwActiveProcessorMask;\n        uint32_t dwNumberOfProcessors;\n        uint32_t dwProcessorType;\n        uint32_t dwAllocationGranularity;\n        uint16_t wProcessorLevel;\n        uint16_t wProcessorRevision;\n    } CSystemInfo;\n")

slot_0_0_0 = {
	nProcessorCount = 0,
	bNVAPIInterfaceInitialized = false,
	nNvidiaGPUCount = 0,
	arrNvidiaAdapterUsage = nil,
	szUserName = "SYR",
	flPrevAlpha = 0,
	szSavedWatermarkCustomTitleFile = "watermark custom title.txt",
	flCarryAnimation = 50,
	flAnimation = 70,
	bADLInterfaceInitialized = false,
	bPrevSkipDPI = false,
	nCompensateHeight = 0,
	bADLControlCreated = false,
	nGPUType = 0,
	bPhysicalGPUInitialized = false,
	nLastUpdateGPULoad = 0,
	flLastGPULoadUpdateTime = 0,
	nLastUpdateCPULoad = 0,
	flLastCPULoadUpdateTime = 0,
	nADLActiveGPU = 0,
	bPrevIgnoreScaling = false,
	nLastUpdateFrame = 0,
	flLastFrameUpdateTime = 0,
	NECK = nil,
	arrIcons = {},
	arrFonts = {},
	arrExport = {},
	arrAvatars = {},
	arrElements = {},
	arrControllers = {},
	arrHotkeysData = {},
	arrSpectatorsData = {},
	arrProcessHandles = {},
	arrVirtualKeyState = {},
	arrLinerAnimations = {},
	arrUnloadCallBacks = {},
	arrAllocatedMemory = {},
	arrLastProcessTime = {},
	arrStaticAnimations = {},
	arrElementCategorys = {},
	arrLastProcessSystemTime = {},
	pSteamID = ffi.new("CSteamID"),
	NULLPTR = ffi.cast("void*", 0),
	clrAccent = draw.color(0, 255, 255, 255),
	INVALID_HANDLE_VALUE = ffi.cast("void*", -1),
	refDpiScale = gui.ctx:find("misc>menu>dpi scale"),
	vecScreenSize = draw.vec2(game.engine:get_screen_size()),
	arrSchema = {
		nSteamID = 1904,
		Visuals_t_PlayerData_t = nil
	},
	arrVirtualKeys = {
		VK_LBUTTON = 1
	},
	Typeof = setmetatable({}, {
		__index = function(arg_1_0, arg_1_1)
			arg_1_0[arg_1_1] = ffi.typeof(arg_1_1)

			return arg_1_0[arg_1_1]
		end
	}),
	arrWeaponIncludeCategory = {
		["Bolt Snipers"] = {
			40,
			9,
			[0] = nil
		},
		["Auto Snipers"] = {
			11,
			38,
			[0] = nil
		},
		["Heavy Pistols"] = {
			1,
			64,
			[0] = nil
		},
		Heavy = {
			35,
			25,
			28,
			27,
			14,
			29,
			[0] = nil
		},
		SMGs = {
			23,
			19,
			17,
			34,
			33,
			26,
			24,
			[0] = nil
		},
		Rifles = {
			13,
			7,
			10,
			60,
			16,
			8,
			39,
			[0] = nil
		},
		Pistols = {
			4,
			2,
			30,
			19,
			61,
			3,
			36,
			63,
			[0] = nil
		}
	},
	EADLStatus = {
		STATUS_OK = 0,
		["sol.+QNi"] = nil
	},
	ENVAPIStatus = {
		STATUS_OK = 0
	},
	EGPUTYPE = {
		TYPE_AMD = 1,
		TYPE_NVIDIA = 2,
		TYPE_NONE = 0
	},
	ENVAPIGpuMAXS = {
		MAX_USAGES_PER_GPU = 34,
		MAX_PHYSICAL_GPUS = 64
	},
	EADLODNTemperatureType = {
		LIQUID = 5,
		VRM_MEMORY = 4,
		VRM_CORE = 3,
		MEMORY = 2,
		CORE = 1,
		HOTSPOT = 7,
		PLX = 6,
		InitializePhysicalGPU = nil
	},
	EADLSensorType = {
		TEMPERATURE_SOC = 29,
		TEMPERATURE_GFX = 28,
		TEMPERATURE_HOTSPOT = 27,
		TEMPERATURE_VRMVDD1 = 26,
		TEMPERATURE_VRMVDD0 = 25,
		TEMPERATURE_VRSOC = 24,
		ASIC_POWER = 23,
		MEM_VOLTAGE = 22,
		GFX_VOLTAGE = 21,
		INFO_ACTIVITY_MEM = 20,
		SOC_CURRENT = 18,
		SOC_POWER = 17,
		SOC_VOLTAGE = 16,
		FAN_PERCENTAGE = 15,
		FAN_RPM = 14,
		TEMPERATURE_PLX = 13,
		TEMPERATURE_LIQUID = 12,
		TEMPERATURE_VRMVDD = 11,
		TEMPERATURE_VRVDDC = 10,
		TEMPERATURE_MEM = 9,
		TEMPERATURE_EDGE = 8,
		CLK_VCNCLK = 7,
		CLK_VCECLK = 6,
		CLK_UVDCLK2 = 5,
		CLK_UVDCLK1 = 4,
		CLK_SOCCLK = 3,
		CLK_MEMCLK = 2,
		CLK_GFXCLK = 1,
		INFO_ACTIVITY_GFX = 19,
		SMART_POWERSHIFT_DGPU = 39,
		SMART_POWERSHIFT_CPU = 38,
		CLK_VCN1CLK2 = 37,
		CLK_VCN1CLK1 = 36,
		THROTTLER_STATUS = 35,
		CLK_CPUCLK = 34,
		CPU_POWER = 33,
		TEMPERATURE_CPU = 32,
		GFX_CURRENT = 31,
		GFX_POWER = 30,
		fmod = nil
	},
	arrWeaponCategorys = {
		"Desert Eagle",
		"Dual Berettas",
		"Five-SeveN",
		"Glock-18",
		nil,
		nil,
		"AK-47",
		"AUG",
		"AWP",
		"FAMAS",
		"G3SG1",
		nil,
		"Galil AR",
		"M249",
		nil,
		"M4A4",
		"MAC-10",
		nil,
		"P90",
		nil,
		nil,
		nil,
		"MP5-SD",
		"UMP-45",
		"XM1014",
		"PP Bizon",
		"MAG-7",
		"Negev",
		"Sawed Off",
		"Tec-9",
		nil,
		"P2000",
		"MP7",
		"MP9",
		"Nova",
		"P250",
		nil,
		"SCAR-20",
		"SG 553",
		"SSG-08",
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		"M4A1-S",
		"USP-S",
		nil,
		"CZ-75 Auto",
		"R8 Revolver",
		[0] = nil
	},
	arrHotkeysReferences = {
		["Trigger bot"] = "legit>weapon>%s>trigger>triggerbot",
		["Legit aim"] = "legit>weapon>%s>aim>aim assist",
		["Pointscale override"] = "rage>weapon>%s>weapon>pointscale",
		["Multipoint override"] = "rage>weapon>%s>weapon>multipoint",
		["Hitchance override"] = "rage>weapon>%s>weapon>hitchance",
		["Hitboxes override"] = "rage>weapon>%s>weapon>hitboxes",
		["Damage override"] = "rage>weapon>%s>weapon>mindamage",
		mp7 = nil,
		Bhop = gui.ctx:find("misc>movement>bhop"),
		["No spread"] = gui.ctx:find("rage>aimbot>nospread"),
		["Jump bug"] = gui.ctx:find("misc>movement>jumpbug"),
		["Double tap"] = gui.ctx:find("rage>aimbot>doubletap"),
		Aimbot = gui.ctx:find("rage>aimbot>general>aimbot"),
		["Edge jump"] = gui.ctx:find("misc>movement>edge jump"),
		["Silent aim"] = gui.ctx:find("rage>aimbot>general>silent"),
		["Peek assist"] = gui.ctx:find("misc>movement>peek assist"),
		["Auto fire"] = gui.ctx:find("rage>aimbot>general>autofire"),
		["Anti-aim"] = gui.ctx:find("rage>anti-aim>angles>anti-aim"),
		["Hide shots"] = gui.ctx:find("rage>anti-aim>angles>hide shot"),
		["Body aim"] = gui.ctx:find("rage>aimbot>general>force bodyaim"),
		["Force shoot"] = gui.ctx:find("rage>aimbot>general>force shoot"),
		["Head only"] = gui.ctx:find("rage>aimbot>general>headshot only"),
		Untrusted = gui.ctx:find("misc>matchmaking>untrusted features"),
		["Duck peek assist"] = gui.ctx:find("misc>movement>duck peek assist"),
		["Force thirdperson"] = gui.ctx:find("visuals>misc>local>thirdperson"),
		["Mouse override"] = gui.ctx:find("rage>anti-aim>angles>mouse override"),
		["Lethal in air"] = gui.ctx:find("rage>aimbot>general>force lethal in air"),
		["Fakepitch correction"] = gui.ctx:find("rage>aimbot>general>fake pitch correction"),
		["Manual left"] = gui.ctx:find("rage>anti-aim>angles>manual override>override left"),
		["Manual back"] = gui.ctx:find("rage>anti-aim>angles>manual override>override back"),
		["Manual right"] = gui.ctx:find("rage>anti-aim>angles>manual override>override right"),
		["Manual forward"] = gui.ctx:find("rage>anti-aim>angles>manual override>override forward")
	},
	BlurManager = setmetatable({
		szConstant = "            cbuffer cb : register(b0) {\n                float4x4 mvp;\n                float2 tex;\n                float time;\n                float alpha;\n            };\n\n            struct PS_INPUT {\n                float4 pos : SV_POSITION;\n                float4 col : COLOR0;\n                float2 uv : TEXCOORD0;\n            };\n\n            sampler sampler0;\n            Texture2D texture0;\n            float4 main(PS_INPUT inp) : SV_Target {\n                float weight = 0.0;\n                float4 color = 0.0;\n                float radius = %.1f;\n                float2 inv_size = 1.0 / tex.xy;\n                for (float x = -radius; x <= radius; x ++) {\n                    for (float y = -radius; y <= radius; y ++) {\n                        float2 coord = inp.uv + float2(x, y) * inv_size;\n                        color += texture0.Sample(sampler0, coord) * exp(-((x * x + y * y) / (2.0 * radius * radius)));\n                        weight += exp(-((x * x + y * y) / (2.0 * radius * radius)));\n                    }\n                }\n\n                color /= weight;\n                color *= inp.col;\n                return color;\n            }\n        ",
		tonumber = nil,
		arrShaders = {},
		vecScreenSize = draw.vec2(game.engine:get_screen_size())
	}, {
		__index = {
			PushBackBuffer = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
				draw.surface.g.uv_rect = arg_2_3
				draw.surface.g.texture = arg_2_1

				draw.surface.g:set_shader(arg_2_2)
			end,
			PopBackBuffer = function(arg_3_0)
				draw.surface.g.uv_rect = nil

				draw.surface.g:set_shader(nil)
				draw.surface.g:set_texture(nil)
			end,
			Render = function(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
				local var_4_0 = tostring(arg_4_3)

				if not arg_4_0.arrShaders[var_4_0] then
					local var_4_1 = arg_4_0.szConstant:format(arg_4_3)

					arg_4_0.arrShaders[var_4_0] = draw.shader(var_4_1)

					if arg_4_0.arrShaders[var_4_0] then
						arg_4_0.arrShaders[var_4_0]:create()
					end
				end

				local var_4_2 = arg_4_0.arrShaders[var_4_0]

				if not var_4_2 then
					return
				end

				local var_4_3 = draw.rect(arg_4_1, arg_4_2)
				local var_4_4 = draw.vec2(arg_4_0.vecScreenSize.x * 0.25, arg_4_0.vecScreenSize.y * 0.25)
				local var_4_5 = draw.rect(var_4_3.mins.x * 0.25 / var_4_4.x, var_4_3.mins.y * 0.25 / var_4_4.y, var_4_3.maxs.x * 0.25 / var_4_4.x, var_4_3.maxs.y * 0.25 / var_4_4.y)
				local var_4_6 = draw.adapter:get_back_buffer()

				arg_4_0:PushBackBuffer(var_4_6, var_4_2, var_4_5)
				draw.surface:add_rect_filled(var_4_3, arg_4_4)
				arg_4_0:PopBackBuffer()
			end
		}
	})
}
slot_0_0_0.__index = setmetatable(slot_0_0_0, {})

function slot_0_0_0.__index.BindArgument(arg_5_0, arg_5_1, arg_5_2)
	return function(...)
		return arg_5_1(arg_5_2 or arg_5_0, ...)
	end
end

function slot_0_0_0.__index.Round(arg_7_0, arg_7_1)
	return math.floor(arg_7_1 + 0.5)
end

function slot_0_0_0.__index.DegToRad(arg_8_0, arg_8_1)
	return arg_8_1 * math.pi / 180
end

function slot_0_0_0.__index.RadToDeg(arg_9_0, arg_9_1)
	return arg_9_1 * (180 / math.pi)
end

function slot_0_0_0.__index.ContainUI(arg_10_0, arg_10_1, arg_10_2)
	return bit.band(arg_10_1, bit.lshift(1, arg_10_2 - 1)) > 0
end

function slot_0_0_0.__index.PushUnloadCallBack(arg_11_0, arg_11_1)
	table.insert(arg_11_0.arrUnloadCallBacks, arg_11_1)
end

function slot_0_0_0.__index.FindIndexByContain(arg_12_0, arg_12_1, arg_12_2)
	for iter_12_0 = 1, arg_12_1 do
		if arg_12_0:ContainUI(arg_12_2, iter_12_0) then
			return iter_12_0
		end
	end

	return 0
end

function slot_0_0_0.__index.GetXButtonWParam(arg_13_0, arg_13_1)
	return bit.band(ffi.cast("uint16_t", bit.rshift(arg_13_1, 16)), 65535)
end

function slot_0_0_0.__index.IsKeyDown(arg_14_0, arg_14_1)
	if arg_14_0.arrVirtualKeyState[arg_14_1] == nil then
		arg_14_0.arrVirtualKeyState[arg_14_1] = false
	end

	return arg_14_0.arrVirtualKeyState[arg_14_1]
end

function slot_0_0_0.__index.Contains(arg_15_0, arg_15_1, arg_15_2)
	for iter_15_0, iter_15_1 in pairs(arg_15_1) do
		if iter_15_1 == arg_15_2 then
			return true
		end
	end

	return false
end

function slot_0_0_0.__index.GetVirtual(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = ffi.cast(arg_16_0.Typeof["void***"], arg_16_1)[0][arg_16_2]

	return ffi.cast(arg_16_0.Typeof[arg_16_3], var_16_0)
end

function slot_0_0_0.__index.Virtual(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.Typeof[arg_17_2]

	return function(arg_18_0, ...)
		return arg_17_0:GetVirtual(arg_18_0, arg_17_1, var_17_0)(arg_18_0, ...)
	end
end

function slot_0_0_0.__index.LoadSvg(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = draw.svg_texture(arg_19_1, arg_19_2)

	assert(var_19_0, "Solus UI: error -> font load svg content")
	var_19_0:create()

	return var_19_0
end

function slot_0_0_0.__index.CreateFont(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5)
	local var_20_0 = draw.font(arg_20_1, arg_20_2, arg_20_3, arg_20_4 or 0, arg_20_5 or 65535)

	assert(var_20_0, ("Solus UI: error -> font load failed: %s"):format(arg_20_1))
	var_20_0:create()

	return var_20_0
end

function slot_0_0_0.__index.CreateGDIFont(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4, arg_21_5, arg_21_6)
	local var_21_0 = draw.font_gdi(arg_21_1, arg_21_2, arg_21_3, arg_21_4 or 0, arg_21_5 or 65535, arg_21_6)

	assert(var_21_0, ("Solus UI: error -> gdi font load failed: %s"):format(arg_21_1))
	var_21_0:create()

	return var_21_0
end

function slot_0_0_0.__index.CreateGameFont(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4, arg_22_5)
	local var_22_0 = arg_22_0:GetGameDirectory()

	return arg_22_0:CreateFont(("%s\\csgo\\panorama\\fonts\\%s"):format(var_22_0, arg_22_1), arg_22_2, arg_22_3, arg_22_4, arg_22_5)
end

function slot_0_0_0.__index.CreateGDIGameFont(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4, arg_23_5, arg_23_6)
	local var_23_0 = arg_23_0:GetGameDirectory()

	return arg_23_0:CreateGDIFont(("%s\\csgo\\panorama\\fonts\\%s"):format(var_23_0, arg_23_1), arg_23_2, arg_23_3, arg_23_4, arg_23_5, arg_23_6)
end

function slot_0_0_0.__index.CallVirtual(arg_24_0, arg_24_1, arg_24_2, arg_24_3, ...)
	if arg_24_1 == arg_24_0.NULLPTR then
		return nil
	end

	return ffi.cast(arg_24_0.Typeof[arg_24_3], ffi.cast(arg_24_0.Typeof["void***"], arg_24_1)[0][arg_24_2])(arg_24_1, ...)
end

function slot_0_0_0.__index.FindPattern(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = ffi.cast("void*", utils.find_pattern(arg_25_1, arg_25_2))

	if var_25_0 == arg_25_0.NULLPTR then
		error("Solus UI: pattern outdated")

		return nil
	end

	return var_25_0
end

function slot_0_0_0.__index.ToAbsolute(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	assert(arg_26_1 ~= 0ULL, "Solus UI: invalidate address")

	arg_26_1 = ffi.cast("uintptr_t", arg_26_1)
	arg_26_1 = arg_26_1 + (arg_26_2 or 1)
	arg_26_1 = arg_26_1 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_26_1)[0])
	arg_26_1 = arg_26_1 + (arg_26_3 or 0)

	if arg_26_4 then
		if type(arg_26_4) == "boolean" then
			return ffi.cast("uintptr_t*", arg_26_1)[0]
		elseif type(arg_26_4) == "number" then
			for iter_26_0 = 1, arg_26_4 do
				arg_26_1 = ffi.cast("uintptr_t*", arg_26_1)[0]
			end

			return arg_26_1
		end
	end

	return arg_26_1
end

function slot_0_0_0.__index.GetModuleProc(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_1:lower()

	if not arg_27_0.arrExport[var_27_0] then
		arg_27_0.arrExport[var_27_0] = {}
	end

	if not arg_27_0.arrExport[var_27_0][arg_27_2] or arg_27_0.arrExport[var_27_0][arg_27_2] == arg_27_0.NULLPTR then
		arg_27_0.arrExport[var_27_0][arg_27_2] = ffi.cast(arg_27_0.Typeof["void*"], utils.find_export(var_27_0, arg_27_2))
	end

	if arg_27_0.arrExport[var_27_0][arg_27_2] == arg_27_0.NULLPTR then
		return nil
	end

	return arg_27_0.arrExport[var_27_0][arg_27_2]
end

function slot_0_0_0.__index.CallModuleExport(arg_28_0, arg_28_1, arg_28_2, arg_28_3, ...)
	local var_28_0 = arg_28_0:GetModuleProc(arg_28_1:lower(), arg_28_2)

	if not var_28_0 then
		return nil
	end

	return ffi.cast(arg_28_0.Typeof[arg_28_3], var_28_0)(...)
end

function slot_0_0_0.__index.GetSystemTime(arg_29_0)
	local var_29_0 = ffi.new("SystemTime")

	arg_29_0:CallModuleExport("Kernel32.dll", "GetLocalTime", "void(__stdcall*)(SystemTime*)", var_29_0)

	return var_29_0
end

function slot_0_0_0.__index.GetGameDirectory(arg_30_0)
	local var_30_0 = ffi.new("char[260]")

	arg_30_0:CallModuleExport("Kernel32.dll", "GetCurrentDirectoryA", "int(__stdcall*)(uint32_t, char*)", ffi.sizeof(var_30_0), var_30_0)

	local var_30_1 = ffi.string(var_30_0)

	return var_30_1:sub(0, var_30_1:len() - 10)
end

function slot_0_0_0.__index.VirtualAlloc(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0:CallModuleExport("Kernel32.dll", "VirtualAlloc", "void*(__stdcall*)(void*, uint64_t, uint32_t, uint32_t)", arg_31_1, arg_31_2, bit.bor(4096, 8192), 64)

	table.insert(arg_31_0.arrAllocatedMemory, var_31_0)

	return var_31_0
end

function slot_0_0_0.__index.VirtualFree(arg_32_0, arg_32_1)
	if arg_32_1 == arg_32_0.NULLPTR then
		return
	end

	arg_32_0:CallModuleExport("Kernel32.dll", "VirtualFree", "int(__stdcall*)(void*, uint64_t, uint32_t)", arg_32_1, 0, 32768)
end

function slot_0_0_0.__index.CreateShellCode(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = ffi.new("uint8_t[?]", #arg_33_1, arg_33_1)
	local var_33_1 = arg_33_0:VirtualAlloc(arg_33_0.NULLPTR, #arg_33_1)

	ffi.copy(var_33_1, var_33_0, #arg_33_1)

	return ffi.cast(arg_33_2, var_33_1), #arg_33_1
end

function slot_0_0_0.__index.FreeAllocateMemorys(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.arrAllocatedMemory) do
		arg_34_0:VirtualFree(iter_34_1)
	end

	arg_34_0.arrAllocatedMemory = {}
end

function slot_0_0_0.__index.GetIncreaseIconSize(arg_35_0)
	local var_35_0 = arg_35_0.arrElements.pFonts:get_value():get():get_raw()

	if arg_35_0:FindIndexByContain(5, var_35_0) == 1 then
		return 0
	end

	return 3
end

function slot_0_0_0.__index.AddNewFontForKey(arg_36_0, arg_36_1, ...)
	if arg_36_0.arrFonts[arg_36_1] then
		return arg_36_0.arrFonts[arg_36_1]
	end

	arg_36_0.arrFonts[arg_36_1] = arg_36_0:CreateGameFont(...)
end

function slot_0_0_0.__index.Lerp(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if type(arg_37_1) == "table" and type(arg_37_2) == "table" then
		return {
			arg_37_0:Lerp(arg_37_1[1] or arg_37_1.x or 0, arg_37_2[1] or arg_37_2.x or 0, arg_37_3),
			arg_37_0:Lerp(arg_37_1[2] or arg_37_1.y or 0, arg_37_2[2] or arg_37_2.y or 0, arg_37_3),
			arg_37_0:Lerp(arg_37_1[3] or arg_37_1.z or 0, arg_37_2[3] or arg_37_2.z or 0, arg_37_3),
			arg_37_0:Lerp(arg_37_1[4] or arg_37_1.w or 0, arg_37_2[4] or arg_37_2.w or 0, arg_37_3)
		}
	end

	return arg_37_1 + (arg_37_2 - arg_37_1) * arg_37_3
end

function slot_0_0_0.__index.WriteFile(arg_38_0, arg_38_1, arg_38_2)
	if type(arg_38_2) ~= "string" or arg_38_2:len() <= 0 or arg_38_2:len() > 255 then
		return
	end

	local var_38_0 = utils.string_to_array(arg_38_2)

	if not var_38_0 or #var_38_0 <= 0 then
		return
	end

	utils.file_write(arg_38_1, var_38_0)
end

function slot_0_0_0.__index.ReadFile(arg_39_0, arg_39_1)
	if not utils.file_exists(arg_39_1) then
		return false
	end

	local var_39_0 = utils.file_read(arg_39_1)

	if not var_39_0 or #var_39_0 <= 0 then
		return false
	end

	return utils.array_to_string(var_39_0)
end

function slot_0_0_0.__index.SaveTitleStorage(arg_40_0)
	local var_40_0 = arg_40_0:GetGameDirectory()
	local var_40_1 = arg_40_0.arrElements.pWatermarkTitle.value

	if not var_40_1 or var_40_1 == "" or var_40_1:len() > 60 then
		return
	end

	arg_40_0:WriteFile(("%s\\csgo\\fatality\\%s"):format(var_40_0, var_40_1))
end

function slot_0_0_0.__index.LoadTitleStorage(arg_41_0)
	local var_41_0 = arg_41_0:GetGameDirectory()
	local var_41_1 = arg_41_0:ReadFile(("%s\\csgo\\fatality\\%s"):format(var_41_0, arg_41_0.szSavedWatermarkCustomTitleFile))

	if not var_41_1 or var_41_1 == "" or var_41_1:len() > 60 then
		arg_41_0.arrElements.pWatermarkTitle:set_value("fatality")

		return
	end

	arg_41_0.arrElements.pWatermarkTitle:set_value(var_41_1)
end

function slot_0_0_0.__index.RemoveIllegalString(arg_42_0, arg_42_1)
	if arg_42_1:len() < 4 then
		return arg_42_1
	end

	local var_42_0 = arg_42_1:lower()
	local var_42_1 = var_42_0:find(".lua")

	if var_42_0:find(".lua") then
		arg_42_1 = ("%s%s"):format(arg_42_1:sub(0, var_42_1 - 1), arg_42_1:sub(var_42_1 + 4, arg_42_1:len()))
	end

	return arg_42_1
end

function slot_0_0_0.__index.GetHotkeysTitleText(arg_43_0)
	if not arg_43_0.arrElements.pLocalizeAll:get_value():get() then
		return "Hotkeys"
	end

	local var_43_0 = arg_43_0.arrElements.pFonts:get_value():get():get_raw()
	local var_43_1 = arg_43_0:FindIndexByContain(5, var_43_0)

	if var_43_1 == 1 then
		return "Hotkeys"
	elseif var_43_1 == 2 then
		return "按键列表"
	elseif var_43_1 == 3 then
		return "按键列表"
	elseif var_43_1 == 4 then
		return "ボタンリスト"
	elseif var_43_1 == 5 then
		return "버튼목록"
	end

	return "Hotkeys"
end

function slot_0_0_0.__index.GetSpectatorsTitleText(arg_44_0)
	if not arg_44_0.arrElements.pLocalizeAll:get_value():get() then
		return "Spectators"
	end

	local var_44_0 = arg_44_0.arrElements.pFonts:get_value():get():get_raw()
	local var_44_1 = arg_44_0:FindIndexByContain(5, var_44_0)

	if var_44_1 == 1 then
		return "Spectators"
	elseif var_44_1 == 2 then
		return "观察列表"
	elseif var_44_1 == 3 then
		return "觀察列表"
	elseif var_44_1 == 4 then
		return "観察者"
	elseif var_44_1 == 5 then
		return "관찰자"
	end

	return "Spectators"
end

function slot_0_0_0.__index.GetTimeLocalte(arg_45_0, arg_45_1)
	if not arg_45_0.arrElements.pLocalizeAll:get_value():get() then
		return arg_45_1 and "PM" or "AM"
	end

	local var_45_0 = arg_45_0.arrElements.pFonts:get_value():get():get_raw()
	local var_45_1 = arg_45_0:FindIndexByContain(5, var_45_0)

	if var_45_1 == 1 then
		return arg_45_1 and "PM" or "AM"
	elseif var_45_1 == 2 then
		return arg_45_1 and "下午" or "上午"
	elseif var_45_1 == 3 then
		return arg_45_1 and "下午" or "上午"
	elseif var_45_1 == 4 then
		return arg_45_1 and "午後" or "午前"
	elseif var_45_1 == 5 then
		return arg_45_1 and "오후" or "오전"
	end

	return arg_45_1 and "PM" or "AM"
end

function slot_0_0_0.__index.GetMilliSecondLocalte(arg_46_0)
	if not arg_46_0.arrElements.pLocalizeAll:get_value():get() then
		return "ms"
	end

	local var_46_0 = arg_46_0.arrElements.pFonts:get_value():get():get_raw()
	local var_46_1 = arg_46_0:FindIndexByContain(5, var_46_0)

	if var_46_1 == 1 then
		return "ms"
	elseif var_46_1 == 2 then
		return "毫秒"
	elseif var_46_1 == 3 then
		return "毫秒"
	elseif var_46_1 == 4 then
		return "ミリ秒"
	elseif var_46_1 == 5 then
		return "밀리초"
	end

	return "ms"
end

function slot_0_0_0.__index.GetLocalServerLocalte(arg_47_0)
	if not arg_47_0.arrElements.pLocalizeAll:get_value():get() then
		return "local server"
	end

	local var_47_0 = arg_47_0.arrElements.pFonts:get_value():get():get_raw()
	local var_47_1 = arg_47_0:FindIndexByContain(5, var_47_0)

	if var_47_1 == 1 then
		return "local server"
	elseif var_47_1 == 2 then
		return "本地服务器"
	elseif var_47_1 == 3 then
		return "本地伺服器"
	elseif var_47_1 == 4 then
		return "ローカルサーバー"
	elseif var_47_1 == 5 then
		return "로컬 서버"
	end

	return "local server"
end

function slot_0_0_0.__index.GetCoreLocalte(arg_48_0)
	if not arg_48_0.arrElements.pLocalizeAll:get_value():get() then
		return "CPU"
	end

	local var_48_0 = arg_48_0.arrElements.pFonts:get_value():get():get_raw()
	local var_48_1 = arg_48_0:FindIndexByContain(5, var_48_0)

	if var_48_1 == 1 then
		return "CPU"
	elseif var_48_1 == 2 then
		return "核心"
	elseif var_48_1 == 3 then
		return "核心"
	elseif var_48_1 == 4 then
		return "中核"
	elseif var_48_1 == 5 then
		return "핵심"
	end

	return "CPU"
end

function slot_0_0_0.__index.GetGraphicsLocalte(arg_49_0)
	if not arg_49_0.arrElements.pLocalizeAll:get_value():get() then
		return "GPU"
	end

	local var_49_0 = arg_49_0.arrElements.pFonts:get_value():get():get_raw()
	local var_49_1 = arg_49_0:FindIndexByContain(5, var_49_0)

	if var_49_1 == 1 then
		return "GPU"
	elseif var_49_1 == 2 then
		return "显卡"
	elseif var_49_1 == 3 then
		return "顯視卡"
	elseif var_49_1 == 4 then
		return "図形"
	elseif var_49_1 == 5 then
		return "그래픽"
	end

	return "GPU"
end

function slot_0_0_0.__index.GetFramerateLocalte(arg_50_0)
	if not arg_50_0.arrElements.pLocalizeAll:get_value():get() then
		return "FPS"
	end

	local var_50_0 = arg_50_0.arrElements.pFonts:get_value():get():get_raw()
	local var_50_1 = arg_50_0:FindIndexByContain(5, var_50_0)

	if var_50_1 == 1 then
		return "FPS"
	elseif var_50_1 == 2 then
		return "帧数"
	elseif var_50_1 == 3 then
		return "幀數"
	elseif var_50_1 == 4 then
		return "フレーム"
	elseif var_50_1 == 5 then
		return "프레임"
	end

	return "FPS"
end

function slot_0_0_0.__index.GetToogleStateText(arg_51_0, arg_51_1)
	if not arg_51_0.arrElements.pLocalizeAll:get_value():get() then
		return arg_51_1 and "on" or "off"
	end

	local var_51_0 = arg_51_0.arrElements.pFonts:get_value():get():get_raw()
	local var_51_1 = arg_51_0:FindIndexByContain(5, var_51_0)

	if var_51_1 == 1 then
		return arg_51_1 and "on" or "off"
	elseif var_51_1 == 2 then
		return arg_51_1 and "开启" or "关闭"
	elseif var_51_1 == 3 then
		return arg_51_1 and "開启" or "關閉"
	elseif var_51_1 == 4 then
		return arg_51_1 and "ひらく" or "かん"
	elseif var_51_1 == 5 then
		return arg_51_1 and "켜다" or "끄다"
	end

	return arg_51_1 and "on" or "off"
end

function slot_0_0_0.__index.UpdatePreviewLocalize(arg_52_0)
	local var_52_0 = arg_52_0.arrElements.pFonts:get_value():get():get_raw()
	local var_52_1 = arg_52_0:FindIndexByContain(5, var_52_0)

	if arg_52_0.arrHotkeysData.Menu then
		arg_52_0.arrHotkeysData.Menu.szName = var_52_1 == 1 and "Menu" or var_52_1 == 2 and "菜单" or var_52_1 == 3 and "菜单" or var_52_1 == 4 and "メニュー" or "메뉴"
	end

	if arg_52_0.arrSpectatorsData.Preview then
		arg_52_0.arrSpectatorsData.Preview.szName = var_52_1 == 1 and "PREVIEW" or var_52_1 == 2 and "预览" or var_52_1 == 3 and "預覽" or var_52_1 == 4 and "よらん" or "예고편"
	end
end

function slot_0_0_0.__index.HandleUpdateFont(arg_53_0)
	arg_53_0:HandleElements()
	arg_53_0:UpdatePreviewLocalize()

	local var_53_0 = arg_53_0.arrElements.pFonts:get_value():get():get_raw()
	local var_53_1 = arg_53_0:FindIndexByContain(5, var_53_0)

	if var_53_1 == 1 then
		return
	end

	if var_53_1 == 2 then
		arg_53_0:AddNewFontForKey("Chinese", "notosanssc-regular.ttf", 11, bit.bor(draw.font_flags.shadow, draw.font_flags.anti_alias, draw.font_flags.no_dpi, draw.font_flags.light), 0, 65535)
	elseif var_53_1 == 3 then
		arg_53_0:AddNewFontForKey("T-Chinese", "notosanstc-regular.ttf", 11, bit.bor(draw.font_flags.shadow, draw.font_flags.anti_alias, draw.font_flags.no_dpi, draw.font_flags.light), 0, 65535)
	elseif var_53_1 == 4 then
		arg_53_0:AddNewFontForKey("Japan", "notosansjp-regular.ttf", 11, bit.bor(draw.font_flags.shadow, draw.font_flags.anti_alias, draw.font_flags.no_dpi, draw.font_flags.light), 0, 65535)
	elseif var_53_1 == 5 then
		arg_53_0:AddNewFontForKey("Korea", "notosanskr-regular.ttf", 11, bit.bor(draw.font_flags.shadow, draw.font_flags.anti_alias, draw.font_flags.no_dpi, draw.font_flags.light), 0, 65535)
	end
end

function slot_0_0_0.__index.GetGlobalFont(arg_54_0)
	local var_54_0 = arg_54_0.arrElements.pFonts:get_value():get():get_raw()
	local var_54_1 = arg_54_0:FindIndexByContain(5, var_54_0)

	if var_54_1 == 2 then
		return arg_54_0.arrFonts.Chinese or arg_54_0.arrFonts.Default
	elseif var_54_1 == 3 then
		return arg_54_0.arrFonts["T-Chinese"] or arg_54_0.arrFonts.Default
	elseif var_54_1 == 4 then
		return arg_54_0.arrFonts.Japan or arg_54_0.arrFonts.Default
	elseif var_54_1 == 5 then
		return arg_54_0.arrFonts.Korea or arg_54_0.arrFonts.Default
	end

	return arg_54_0.arrFonts.Default
end

function slot_0_0_0.__uuidof(arg_55_0, arg_55_1)
	local var_55_0, var_55_1, var_55_2, var_55_3, var_55_4, var_55_5, var_55_6, var_55_7, var_55_8, var_55_9, var_55_10 = arg_55_1:match("^(%x+)%-(%x+)%-(%x+)%-(%x%x)(%x%x)%-(%x%x)(%x%x)(%x%x)(%x%x)(%x%x)(%x%x)$")
	local var_55_11 = ffi.new("GUID")

	var_55_11.Data1 = tonumber(var_55_0, 16)
	var_55_11.Data2 = tonumber(var_55_1, 16)
	var_55_11.Data3 = tonumber(var_55_2, 16)
	var_55_11.Data4[0] = tonumber(var_55_3, 16)
	var_55_11.Data4[1] = tonumber(var_55_4, 16)
	var_55_11.Data4[2] = tonumber(var_55_5, 16)
	var_55_11.Data4[3] = tonumber(var_55_6, 16)
	var_55_11.Data4[4] = tonumber(var_55_7, 16)
	var_55_11.Data4[5] = tonumber(var_55_8, 16)
	var_55_11.Data4[6] = tonumber(var_55_9, 16)
	var_55_11.Data4[7] = tonumber(var_55_10, 16)

	return var_55_11
end

function slot_0_0_0.__index.GetMousePosition(arg_56_0)
	local var_56_0 = ffi.new("Point")

	arg_56_0:CallModuleExport("User32.dll", "GetCursorPos", "void(__stdcall*)(Point*)", var_56_0)
	arg_56_0:CallModuleExport("User32.dll", "ScreenToClient", "void(__stdcall*)(void*, Point*)", arg_56_0.pRenderDevice.hWindow, var_56_0)

	return draw.vec2(var_56_0.x, var_56_0.y)
end

function slot_0_0_0.__index.PushFont(arg_57_0, arg_57_1)
	draw.surface.font = arg_57_1
end

function slot_0_0_0.__index.PopFont(arg_58_0)
	draw.surface.font = nil
end

function slot_0_0_0.__index.SetAntiAlias(arg_59_0, arg_59_1)
	draw.surface.g.anti_alias = arg_59_1
end

function slot_0_0_0.__index.PushAlpha(arg_60_0, arg_60_1)
	arg_60_0.flPrevAlpha = draw.surface.g.alpha
	draw.surface.g.alpha = arg_60_1
end

function slot_0_0_0.__index.PopAlpha(arg_61_0)
	draw.surface.g.alpha = arg_61_0.flPrevAlpha
end

function slot_0_0_0.__index.PushTexture(arg_62_0, arg_62_1)
	draw.surface.g:set_texture(arg_62_1)
end

function slot_0_0_0.__index.PopTexture(arg_63_0)
	draw.surface.g:set_texture(nil)
end

function slot_0_0_0.__index.PushClipRect(arg_64_0, arg_64_1, arg_64_2, arg_64_3)
	draw.surface:override_clip_rect(draw.rect(arg_64_1, arg_64_2), arg_64_3)
end

function slot_0_0_0.__index.PopClipRect(arg_65_0)
	draw.surface:override_clip_rect(nil)
end

function slot_0_0_0.__index.PushRotation(arg_66_0, arg_66_1)
	draw.surface.g.rotation = arg_66_1
end

function slot_0_0_0.__index.PopRotation(arg_67_0)
	draw.surface.g.rotation = nil
end

function slot_0_0_0.__index.Blur(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4)
	return arg_68_0.BlurManager:Render(arg_68_1, arg_68_2, arg_68_3, arg_68_4)
end

function slot_0_0_0.__index.MesureText(arg_69_0, arg_69_1, arg_69_2)
	return arg_69_2:get_text_size(arg_69_1, true)
end

function slot_0_0_0.__index.Text(arg_70_0, arg_70_1, arg_70_2, arg_70_3, arg_70_4)
	if arg_70_4 then
		arg_70_0:PushFont(arg_70_4)
	end

	draw.surface:add_text(arg_70_1, arg_70_2, arg_70_3 or draw.color(255, 255, 255, 255))

	if arg_70_4 then
		arg_70_0:PopFont()
	end
end

function slot_0_0_0.__index.Rect(arg_71_0, arg_71_1, arg_71_2, arg_71_3, arg_71_4)
	draw.surface:add_rect(draw.rect(arg_71_1, arg_71_2), arg_71_3, arg_71_4)
end

function slot_0_0_0.__index.RectFilled(arg_72_0, arg_72_1, arg_72_2, arg_72_3)
	draw.surface:add_rect_filled(draw.rect(arg_72_1, arg_72_2), arg_72_3)
end

function slot_0_0_0.__index.GlowOutline(arg_73_0, arg_73_1, arg_73_2, arg_73_3, arg_73_4)
	draw.surface:add_glow(draw.rect(arg_73_1, arg_73_2), arg_73_3, arg_73_4)
end

function slot_0_0_0.__index.GradientRectFilled(arg_74_0, arg_74_1, arg_74_2, arg_74_3, arg_74_4, arg_74_5)
	draw.surface:add_rect_filled_multicolor(draw.rect(arg_74_1, arg_74_2), {
		arg_74_3,
		arg_74_5 and arg_74_4 or arg_74_3,
		arg_74_4,
		arg_74_5 and arg_74_3 or arg_74_4
	})
end

function slot_0_0_0.__index.RoundingRectFilled(arg_75_0, arg_75_1, arg_75_2, arg_75_3, arg_75_4, arg_75_5)
	draw.surface:add_rect_filled_rounded(draw.rect(arg_75_1, arg_75_2), arg_75_3, arg_75_4, arg_75_5)
end

function slot_0_0_0.__index.Line(arg_76_0, arg_76_1, arg_76_2, arg_76_3, arg_76_4)
	draw.surface:add_line(arg_76_1, arg_76_2, arg_76_3, arg_76_4)
end

function slot_0_0_0.__index.Circle(arg_77_0, arg_77_1, arg_77_2, arg_77_3, arg_77_4, arg_77_5, arg_77_6)
	arg_77_0:PushRotation(arg_77_4)
	draw.surface:add_circle(arg_77_1, arg_77_3, arg_77_2, 36, arg_77_5, arg_77_6)
	arg_77_0:PopRotation()
end

function slot_0_0_0.__index.HalfRoundedRect(arg_78_0, arg_78_1, arg_78_2, arg_78_3, arg_78_4, arg_78_5, arg_78_6)
	arg_78_0:RectFilled(draw.vec2(arg_78_1.x + arg_78_3, arg_78_1.y), draw.vec2(arg_78_2.x - arg_78_3, arg_78_1.y + arg_78_4), arg_78_5)

	if arg_78_6 then
		arg_78_0:GradientRectFilled(draw.vec2(arg_78_1.x, arg_78_1.y + arg_78_3), draw.vec2(arg_78_1.x + arg_78_4, arg_78_2.y - arg_78_3 * 2), arg_78_5, draw.color(arg_78_5:get_r(), arg_78_5:get_g(), arg_78_5:get_b(), 0))
		arg_78_0:GradientRectFilled(draw.vec2(arg_78_2.x - arg_78_4, arg_78_1.y + arg_78_3), draw.vec2(arg_78_2.x, arg_78_2.y - arg_78_3 * 2), arg_78_5, draw.color(arg_78_5:get_r(), arg_78_5:get_g(), arg_78_5:get_b(), 0))
	end

	arg_78_0:Circle(draw.vec2(arg_78_1.x + arg_78_3 + arg_78_4, arg_78_1.y + arg_78_3 + arg_78_4), arg_78_5, arg_78_3, 180, 0.25, arg_78_4)
	arg_78_0:Circle(draw.vec2(arg_78_2.x - arg_78_3 - arg_78_4, arg_78_1.y + arg_78_3 + arg_78_4), arg_78_5, arg_78_3, 270, 0.25, arg_78_4)
end

function slot_0_0_0.__index.RoundingBoard(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4, arg_79_5, arg_79_6, arg_79_7, arg_79_8, arg_79_9, arg_79_10)
	local var_79_0 = arg_79_8 or 1
	local var_79_1 = math.clamp(arg_79_4:get_a() / 255, 0, 1)

	if arg_79_6 > 0 then
		arg_79_0:GlowOutline(arg_79_1, arg_79_2, arg_79_6, draw.color(arg_79_3:get_r(), arg_79_3:get_g(), arg_79_3:get_b(), 80 * var_79_1))
	end

	arg_79_0:Blur(arg_79_1, arg_79_2, arg_79_7, arg_79_5)
	arg_79_0:RoundingRectFilled(arg_79_1, arg_79_2, arg_79_4, arg_79_9 or 2, draw.rounding.t)
	arg_79_0:HalfRoundedRect(draw.vec2(arg_79_1.x - var_79_0, arg_79_1.y - var_79_0), draw.vec2(arg_79_2.x + 1, arg_79_2.y + 1), arg_79_9 or 2, var_79_0, arg_79_3, arg_79_10)
end

function slot_0_0_0.__index.CircleTexture(arg_80_0, arg_80_1, arg_80_2, arg_80_3, arg_80_4)
	arg_80_0:PushTexture(arg_80_1)
	draw.surface:add_circle_filled(arg_80_2, arg_80_3, arg_80_4)
	arg_80_0:PopTexture()
end

function slot_0_0_0.__index.Texture(arg_81_0, arg_81_1, arg_81_2, arg_81_3, arg_81_4)
	local var_81_0 = draw.vec2(arg_81_2.x - arg_81_3.x / 2, arg_81_2.y - arg_81_3.y / 2)
	local var_81_1 = draw.vec2(arg_81_2.x + arg_81_3.x / 2, arg_81_2.y - arg_81_3.y / 2)
	local var_81_2 = draw.vec2(arg_81_2.x - arg_81_3.x / 2, arg_81_2.y + arg_81_3.y / 2)
	local var_81_3 = draw.vec2(arg_81_2.x + arg_81_3.x / 2, arg_81_2.y + arg_81_3.y / 2)

	arg_81_0:PushTexture(arg_81_1)
	draw.surface:add_quad_filled(var_81_0, var_81_1, var_81_3, var_81_2, arg_81_4)
	arg_81_0:PopTexture()
end

function slot_0_0_0.__index.FileTimeToUTCTime(arg_82_0, arg_82_1)
	local var_82_0 = ffi.new("LARGE_INTEGER")

	var_82_0.LowPart = arg_82_1.dwLowDateTime
	var_82_0.HighPart = arg_82_1.dwHighDateTime

	return var_82_0.QuadPart
end

function slot_0_0_0.__index.GetProcessorNumber(arg_83_0)
	local var_83_0 = ffi.new("CSystemInfo")

	arg_83_0:CallModuleExport("Kernel32.dll", "GetSystemInfo", "void(__stdcall*)(CSystemInfo*)", var_83_0)

	return var_83_0.dwNumberOfProcessors
end

function slot_0_0_0.__index.GetAMDGPUCount(arg_84_0)
	local var_84_0 = ffi.new("int[1]")

	if arg_84_0:CallModuleExport("atiadlxx.dll", "ADL_Adapter_NumberOfAdapters_Get", "int(__stdcall*)(int*)", var_84_0) == arg_84_0.EADLStatus.STATUS_OK then
		return var_84_0[0]
	end

	return 0
end

function slot_0_0_0.__index.GetAMDPhysicalGPU(arg_85_0, arg_85_1)
	if arg_85_1 < 0 or arg_85_1 >= arg_85_0.nADLActiveGPU then
		return nil
	end

	return arg_85_0.pActiveAMDAdapters + arg_85_1
end

function slot_0_0_0.__index.GetNVIDIAPhysicalGPU(arg_86_0, arg_86_1)
	if arg_86_1 < 0 or arg_86_1 >= arg_86_0.ENVAPIGpuMAXS.MAX_PHYSICAL_GPUS then
		return nil
	end

	return arg_86_0.arrNvidiaAdapterHandles[arg_86_1]
end

function slot_0_0_0.__index.EnableSeDebugPrivilege(arg_87_0)
	local var_87_0 = ffi.new("void*[1]")

	if arg_87_0:CallModuleExport("Advapi32.dll", "OpenThreadToken", "int(__stdcall*)(void*, uint32_t, int, void**)", arg_87_0:CallModuleExport("Kernel32.dll", "GetCurrentThread", "void*(__stdcall*)()"), bit.bor(8, 32), 1, var_87_0) == 0 and arg_87_0:CallModuleExport("Advapi32.dll", "OpenProcessToken", "int(__stdcall*)(void*, uint32_t, void**)", arg_87_0:CallModuleExport("Kernel32.dll", "GetCurrentProcess", "void*(__stdcall*)()"), bit.bor(8, 32), var_87_0) == 0 then
		return false
	end

	local var_87_1 = ffi.new("LUID")

	if arg_87_0:CallModuleExport("Advapi32.dll", "LookupPrivilegeValueA", "int(__stdcall*)(const char*, const char*, LUID*)", arg_87_0.NULLPTR, "SeDebugPrivilege", var_87_1) == 0 then
		arg_87_0:CallModuleExport("Kernel32.dll", "CloseHandle", "int(__stdcall*)(void*)", var_87_0[0])

		return false
	end

	local var_87_2 = ffi.new("TOKEN_PRIVILEGES")

	var_87_2.PrivilegeCount = 1
	var_87_2.Privileges[0].Attributes = 2

	if arg_87_0:CallModuleExport("Advapi32.dll", "AdjustTokenPrivileges", "int(__stdcall*)(void*, int, TOKEN_PRIVILEGES*, uint32_t, TOKEN_PRIVILEGES*, uint32_t*)", var_87_0[0], 0, var_87_2, ffi.sizeof("TOKEN_PRIVILEGES"), arg_87_0.NULLPTR, arg_87_0.NULLPTR) == 0 then
		arg_87_0:CallModuleExport("Kernel32.dll", "CloseHandle", "int(__stdcall*)(void*)", var_87_0[0])

		return false
	end

	arg_87_0:CallModuleExport("Kernel32.dll", "CloseHandle", "int(__stdcall*)(void*)", var_87_0[0])

	return true
end

function slot_0_0_0.__index.InitializeNVIDIAPhysicalGPU(arg_88_0)
	if arg_88_0:CallModuleExport("Kernel32.dll", "GetModuleHandleA", "void*(__stdcall*)(const char*)", "nvapi64.dll") == arg_88_0.NULLPTR then
		return false
	end

	arg_88_0.fnNVAPIInitialize = ffi.cast("int(__stdcall*)()", arg_88_0:CallModuleExport("nvapi64.dll", "nvapi_QueryInterface", "void*(__stdcall*)(uint32_t)", 22079528))
	arg_88_0.fnNVAPIGPUGetUsages = ffi.cast("int(__stdcall*)(int*, uint32_t*)", arg_88_0:CallModuleExport("nvapi64.dll", "nvapi_QueryInterface", "void*(__stdcall*)(uint32_t)", 412753887))
	arg_88_0.fnNVAPIEnumPhysicalGPUs = ffi.cast("int(__stdcall*)(int**, int*)", arg_88_0:CallModuleExport("nvapi64.dll", "nvapi_QueryInterface", "void*(__stdcall*)(uint32_t)", 3853292063))

	if arg_88_0.fnNVAPIInitialize == arg_88_0.NULLPTR or arg_88_0.fnNVAPIGPUGetUsages == arg_88_0.NULLPTR or arg_88_0.fnNVAPIEnumPhysicalGPUs == arg_88_0.NULLPTR then
		return false
	end

	if arg_88_0.fnNVAPIInitialize() ~= arg_88_0.ENVAPIStatus.STATUS_OK then
		return false
	end

	local var_88_0 = ffi.new("int[1]")

	arg_88_0.arrNvidiaAdapterHandles = ffi.new("int*[?]", arg_88_0.ENVAPIGpuMAXS.MAX_PHYSICAL_GPUS)
	arg_88_0.arrNvidiaAdapterUsage = ffi.new("uint32_t[?]", arg_88_0.ENVAPIGpuMAXS.MAX_USAGES_PER_GPU)

	if arg_88_0.fnNVAPIEnumPhysicalGPUs(arg_88_0.arrNvidiaAdapterHandles, var_88_0) ~= arg_88_0.ENVAPIStatus.STATUS_OK then
		return false
	end

	arg_88_0.nNvidiaGPUCount = var_88_0[0]
	arg_88_0.bNVAPIInterfaceInitialized = arg_88_0.nNvidiaGPUCount > 0

	return arg_88_0.bNVAPIInterfaceInitialized
end

function slot_0_0_0.__index.InitializeAMDPhysicalGPU(arg_89_0)
	if arg_89_0:CallModuleExport("Kernel32.dll", "GetModuleHandleA", "void*(__stdcall*)(const char*)", "atiadlxx.dll") == arg_89_0.NULLPTR then
		return false
	end

	local var_89_0 = arg_89_0:GetModuleProc("msvcrt.dll", "malloc")

	if var_89_0 == arg_89_0.NULLPTR then
		return false
	end

	if arg_89_0:CallModuleExport("atiadlxx.dll", "ADL_Main_Control_Create", "int(__stdcall*)(void*, int)", var_89_0, 0) ~= arg_89_0.EADLStatus.STATUS_OK then
		return false
	end

	arg_89_0.bADLControlCreated = true

	local var_89_1 = arg_89_0:GetAMDGPUCount()

	if var_89_1 <= 0 then
		return false
	end

	local var_89_2 = 0

	arg_89_0.pAMDAdapters = ffi.new("CAMDAdapterInfo[?]", var_89_1)
	arg_89_0.pActiveAMDAdapters = ffi.new("CAMDAdapterInfo[?]", var_89_1)

	for iter_89_0 = 0, var_89_1 - 1 do
		arg_89_0.pAMDAdapters[iter_89_0].iSize = ffi.sizeof("CAMDAdapterInfo")
		arg_89_0.pActiveAMDAdapters[iter_89_0].iSize = ffi.sizeof("CAMDAdapterInfo")
	end

	if arg_89_0:CallModuleExport("atiadlxx.dll", "ADL_Adapter_AdapterInfo_Get", "int(__stdcall*)(CAMDAdapterInfo*, int)", arg_89_0.pAMDAdapters, var_89_1 * ffi.sizeof("CAMDAdapterInfo")) ~= arg_89_0.EADLStatus.STATUS_OK then
		return false
	end

	for iter_89_1 = 0, var_89_1 - 1 do
		local var_89_3 = ffi.new("int[1]")
		local var_89_4 = arg_89_0.pAMDAdapters + iter_89_1

		if arg_89_0:CallModuleExport("atiadlxx.dll", "ADL_Adapter_Active_Get", "int(__stdcall*)(int, int*)", var_89_4.iAdapterIndex, var_89_3) == arg_89_0.EADLStatus.STATUS_OK and var_89_3[0] == 1 and var_89_4.iVendorID == 1002 then
			ffi.copy(arg_89_0.pActiveAMDAdapters + var_89_2, var_89_4, ffi.sizeof("CAMDAdapterInfo"))

			var_89_2 = var_89_2 + 1
		end
	end

	arg_89_0.nADLActiveGPU = var_89_2
	arg_89_0.bADLInterfaceInitialized = arg_89_0.nADLActiveGPU > 0

	return arg_89_0.bADLInterfaceInitialized
end

function slot_0_0_0.__index.GetNVIDIAPhysicalGPUUsage(arg_90_0)
	if not arg_90_0.bPhysicalGPUInitialized or not arg_90_0.bNVAPIInterfaceInitialized or arg_90_0.nGPUType ~= arg_90_0.EGPUTYPE.TYPE_NVIDIA then
		return 0
	end

	local var_90_0 = arg_90_0:GetNVIDIAPhysicalGPU(0)

	if not var_90_0 or var_90_0 == arg_90_0.NULLPTR then
		return 0
	end

	arg_90_0.arrNvidiaAdapterUsage[0] = bit.bor(arg_90_0.ENVAPIGpuMAXS.MAX_USAGES_PER_GPU * 4, 65536)

	if arg_90_0.fnNVAPIGPUGetUsages(var_90_0, arg_90_0.arrNvidiaAdapterUsage) ~= arg_90_0.ENVAPIStatus.STATUS_OK then
		return 0
	end

	return math.clamp(arg_90_0.arrNvidiaAdapterUsage[3], 0, 100)
end

function slot_0_0_0.__index.GetAMDPhysicalGPUUsage(arg_91_0)
	if not arg_91_0.bPhysicalGPUInitialized or not arg_91_0.bADLInterfaceInitialized or arg_91_0.nGPUType ~= arg_91_0.EGPUTYPE.TYPE_AMD then
		return 0
	end

	local var_91_0 = arg_91_0:GetAMDPhysicalGPU(0)

	if not var_91_0 or var_91_0 == arg_91_0.NULLPTR then
		return 0
	end

	local var_91_1 = var_91_0.iAdapterIndex

	if var_91_1 >= 250 or var_91_1 < 0 then
		return 100
	end

	local var_91_2 = ffi.new("int[1]")
	local var_91_3 = ffi.new("int[1]")
	local var_91_4 = ffi.new("int[1]")

	if arg_91_0:CallModuleExport("atiadlxx.dll", "ADL_Overdrive_Caps", "int(__stdcall*)(int, int*, int*, int*)", var_91_1, var_91_4, var_91_2, var_91_3) == arg_91_0.EADLStatus.STATUS_OK and (var_91_4[0] == 0 or var_91_2[0] == 0) then
		return 0
	end

	if var_91_3[0] >= 8 then
		local var_91_5 = ffi.new("ADLPMLogDataOutput")

		var_91_5.nSize = ffi.sizeof("ADLPMLogDataOutput")

		if arg_91_0:CallModuleExport("atiadlxx.dll", "ADL2_New_QueryPMLogData_Get", "int(__stdcall*)(void*, int, ADLPMLogDataOutput*)", arg_91_0.NULLPTR, var_91_1, var_91_5) == arg_91_0.EADLStatus.STATUS_OK then
			return math.clamp(var_91_5.sensors[arg_91_0.EADLSensorType.INFO_ACTIVITY_GFX].nValue, 0, 100)
		end
	else
		local var_91_6 = ffi.new("ADLPMActivity")

		var_91_6.nSize = ffi.sizeof("ADLPMActivity")

		if arg_91_0:CallModuleExport("atiadlxx.dll", "ADL_Overdrive5_CurrentActivity_Get", "int(__stdcall*)(int, pADLPMActivity*)", var_91_1, var_91_6) == arg_91_0.EADLStatus.STATUS_OK then
			return math.clamp(var_91_6.iActivityPercent, 0, 100)
		end
	end

	return 0
end

function slot_0_0_0.__index.GetProcessCPUUsage(arg_92_0, arg_92_1, arg_92_2, arg_92_3, arg_92_4)
	local var_92_0 = arg_92_4 or 0

	if var_92_0 >= 16 or arg_92_0.nProcessorCount <= 0 then
		return 0
	end

	if not arg_92_0.arrLastProcessTime[arg_92_1] then
		arg_92_0.arrLastProcessTime[arg_92_1] = 0
	end

	if not arg_92_0.arrLastProcessSystemTime[arg_92_1] then
		arg_92_0.arrLastProcessSystemTime[arg_92_1] = 0
	end

	local var_92_1 = ffi.new("FILETIME")
	local var_92_2 = ffi.new("FILETIME")
	local var_92_3 = ffi.new("FILETIME")
	local var_92_4 = ffi.new("FILETIME")

	if arg_92_0:CallModuleExport("Kernel32.dll", "GetProcessTimes", "void(__stdcall*)(void*, FILETIME*, FILETIME*, FILETIME*, FILETIME*)", arg_92_3, var_92_4, var_92_1, var_92_3, var_92_2) == 0 then
		return 0
	end

	local var_92_5 = var_92_0 + 1
	local var_92_6 = (arg_92_0:FileTimeToUTCTime(var_92_3) + arg_92_0:FileTimeToUTCTime(var_92_2)) / arg_92_0.nProcessorCount

	if arg_92_0.arrLastProcessTime[arg_92_1] == 0 or arg_92_0.arrLastProcessSystemTime[arg_92_1] == 0 then
		arg_92_0.arrLastProcessTime[arg_92_1] = arg_92_2
		arg_92_0.arrLastProcessSystemTime[arg_92_1] = var_92_6

		return arg_92_0:GetProcessCPUUsage(arg_92_1, arg_92_2, arg_92_3, var_92_5)
	end

	local var_92_7 = arg_92_2 - arg_92_0.arrLastProcessTime[arg_92_1]
	local var_92_8 = var_92_6 - arg_92_0.arrLastProcessSystemTime[arg_92_1]

	if var_92_7 <= 0 then
		return arg_92_0:GetProcessCPUUsage(arg_92_1, arg_92_2, arg_92_3, var_92_5)
	end

	arg_92_0.arrLastProcessTime[arg_92_1] = arg_92_2
	arg_92_0.arrLastProcessSystemTime[arg_92_1] = var_92_6

	local var_92_9 = (var_92_8 * 100 + var_92_7 / 2) / var_92_7

	return math.clamp(tonumber(var_92_9), 0, 100)
end

function slot_0_0_0.__index.InitializePhysicalCPU(arg_93_0)
	arg_93_0.nProcessorCount = arg_93_0:GetProcessorNumber()

	if arg_93_0.nProcessorCount > 0 then
		return
	end

	gui.notify:add(gui.notification("[ Solus UI ] Physical CPU Error !", "failed initialize physical core interface !"))
end

function slot_0_0_0.__index.InitializePhysicalGPU(arg_94_0)
	arg_94_0:EnableSeDebugPrivilege()

	if arg_94_0:InitializeAMDPhysicalGPU() then
		arg_94_0.bPhysicalGPUInitialized = true
		arg_94_0.nGPUType = arg_94_0.EGPUTYPE.TYPE_AMD

		return
	elseif arg_94_0:InitializeNVIDIAPhysicalGPU() then
		arg_94_0.bPhysicalGPUInitialized = true
		arg_94_0.nGPUType = arg_94_0.EGPUTYPE.TYPE_NVIDIA

		return
	end

	arg_94_0.bPhysicalGPUInitialized = false
	arg_94_0.nGPUType = arg_94_0.EGPUTYPE.TYPE_NONE

	gui.notify:add(gui.notification("[ Solus UI ] Physical GPU Error !", "failed initialize physical graphics device interface, unsupport graphics !"))
end

function slot_0_0_0.__index.GetGPULoad(arg_95_0)
	if not arg_95_0.bPhysicalGPUInitialized then
		return 0
	end

	if arg_95_0.nGPUType == arg_95_0.EGPUTYPE.TYPE_AMD then
		return arg_95_0:GetAMDPhysicalGPUUsage()
	elseif arg_95_0.nGPUType == arg_95_0.EGPUTYPE.TYPE_NVIDIA then
		return arg_95_0:GetNVIDIAPhysicalGPUUsage()
	end

	return 0
end

function slot_0_0_0.__index.GetCPULoad(arg_96_0)
	if arg_96_0.nProcessorCount <= 0 then
		return 0
	end

	local var_96_0 = ffi.new("uint32_t[1]")
	local var_96_1 = ffi.new("uint32_t[1024]")

	if arg_96_0:CallModuleExport("Kernel32.dll", "K32EnumProcesses", "int(__stdcall*)(uint32_t*, uint32_t, uint32_t*)", var_96_1, ffi.sizeof(var_96_1), var_96_0) == 0 then
		return 0
	end

	local var_96_2 = ffi.new("FILETIME")
	local var_96_3 = 4096
	local var_96_4 = var_96_0[0] / ffi.sizeof("uint32_t")

	arg_96_0:CallModuleExport("Kernel32.dll", "GetSystemTimeAsFileTime", "void(__stdcall*)(FILETIME*)", var_96_2)

	local var_96_5 = arg_96_0:FileTimeToUTCTime(var_96_2)
	local var_96_6 = arg_96_0:CallModuleExport("Kernel32.dll", "GetCurrentProcessId", "uint32_t(__stdcall*)()")
	local var_96_7 = arg_96_0:GetProcessCPUUsage(var_96_6, var_96_5, arg_96_0:CallModuleExport("Kernel32.dll", "GetCurrentProcess", "void*(__stdcall*)()"))

	for iter_96_0 = 0, var_96_4 - 1 do
		local var_96_8 = var_96_1[iter_96_0]

		if var_96_8 == var_96_6 then
			-- block empty
		else
			local var_96_9 = arg_96_0:CallModuleExport("Kernel32.dll", "OpenProcess", "void*(__stdcall*)(uint32_t, int, uint32_t)", var_96_3, 0, var_96_1[iter_96_0])

			if var_96_9 == arg_96_0.NULLPTR or var_96_9 == arg_96_0.INVALID_HANDLE_VALUE then
				-- block empty
			else
				var_96_7 = var_96_7 + arg_96_0:GetProcessCPUUsage(var_96_8, var_96_5, var_96_9)

				arg_96_0:CallModuleExport("Kernel32.dll", "CloseHandle", "int(__stdcall*)(void*)", var_96_9)
			end
		end
	end

	return math.clamp(var_96_7, 0, 100)
end

function slot_0_0_0.__index.LoadTextureFromMemory(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	if not arg_97_0.pDX11Device or arg_97_0.pDX11Device == arg_97_0.NULLPTR then
		return nil
	end

	local var_97_0 = ffi.new("D3D11_TEXTURE2D_DESC")

	var_97_0.Usage = 0
	var_97_0.Format = 28
	var_97_0.MipLevels = 1
	var_97_0.ArraySize = 1
	var_97_0.BindFlags = 8
	var_97_0.Width = arg_97_2
	var_97_0.Height = arg_97_3
	var_97_0.CPUAccessFlags = 0
	var_97_0.SampleDesc.Count = 1

	local var_97_1 = ffi.new("D3D11_SUBRESOURCE_DATA")

	var_97_1.pSysMem = arg_97_1
	var_97_1.SysMemSlicePitch = 0
	var_97_1.SysMemPitch = arg_97_2 * 4

	local var_97_2 = ffi.new("ID3D11Object*[1]")

	if arg_97_0.pDX11Device:CreateTexture2D(var_97_0, var_97_1, var_97_2) < 0 then
		gui.notify:add(gui.notification("[ Solus UI ] Direct3D Error !", "failed create texture !"))

		return nil
	end

	local var_97_3 = ffi.new("ID3D11Object*[1]")
	local var_97_4 = ffi.new("D3D11_SHADER_RESOURCE_VIEW_DESC")

	var_97_4.Format = 28
	var_97_4.ViewDimension = 4
	var_97_4.Texture2D.MostDetailedMip = 0
	var_97_4.Texture2D.MipLevels = var_97_0.MipLevels

	if arg_97_0.pDX11Device:CreateShaderResourceView(var_97_2[0], var_97_4, var_97_3) < 0 then
		gui.notify:add(gui.notification("[ Solus UI ] Direct3D Error !", "failed create shader resource view !"))
		var_97_2[0]:Release()

		return nil
	end

	var_97_2[0]:Release()

	return var_97_3[0]
end

function slot_0_0_0.__index.CreateTextureFromRGBA(arg_98_0, arg_98_1, arg_98_2, arg_98_3)
	if not arg_98_1 or arg_98_1 == arg_98_0.NULLPTR then
		return nil
	end

	local var_98_0 = ptr(ffi.cast("uintptr_t", arg_98_1))
	local var_98_1 = draw.texture(var_98_0, arg_98_2, arg_98_3, arg_98_2 * 4)

	if not var_98_1 then
		return nil
	end

	var_98_1:create()

	local var_98_2 = arg_98_0:LoadTextureFromMemory(arg_98_1, arg_98_2, arg_98_3)

	if not var_98_2 or var_98_2 == arg_98_0.NULLPTR then
		gui.notify:add(gui.notification("[ Solus UI ] Texture Error !", "failed load texture !"))

		return nil
	end

	local var_98_3 = ffi.cast("void**", var_98_1)[0]
	local var_98_4 = ffi.cast("ID3D11Object**", ffi.cast("uintptr_t", var_98_3) + 8)[0]

	if var_98_4 ~= arg_98_0.NULLPTR then
		var_98_4:Release()
	end

	ffi.cast("ID3D11Object**", ffi.cast("uintptr_t", var_98_3) + 8)[0] = var_98_2

	return var_98_1
end

function slot_0_0_0.__index.GetSteamAvatar(arg_99_0, arg_99_1)
	if arg_99_1 <= 0ULL then
		return nil
	end

	local var_99_0 = ("%d"):format(arg_99_1)

	if arg_99_0.arrAvatars[var_99_0] then
		return arg_99_0.arrAvatars[var_99_0]
	end

	local var_99_1 = arg_99_0.pSteamFriends:GetSmallFriendAvatar(arg_99_1)

	if var_99_1 <= 0 then
		return nil
	end

	local var_99_2 = ffi.new("uint32_t[1]")
	local var_99_3 = ffi.new("uint32_t[1]")

	if not arg_99_0.pSteamUtils:GetImageSize(var_99_1, var_99_2, var_99_3) then
		return nil
	end

	local var_99_4 = var_99_2[0] * var_99_3[0] * 4
	local var_99_5 = ffi.new("uint8_t[?]", var_99_4)

	if not arg_99_0.pSteamUtils:GetImageRGBA(var_99_1, var_99_5, var_99_4) then
		return nil
	end

	arg_99_0.arrAvatars[var_99_0] = arg_99_0:CreateTextureFromRGBA(var_99_5, var_99_2[0], var_99_3[0])

	return arg_99_0.arrAvatars[var_99_0]
end

function slot_0_0_0.__index.GetSteamID(arg_100_0, arg_100_1)
	local var_100_0 = ffi.cast("uintptr_t*", arg_100_1)[0]

	if var_100_0 <= 0ULL then
		return nil
	end

	return ffi.cast("uint64_t*", var_100_0 + arg_100_0.arrSchema.nSteamID)[0]
end

function slot_0_0_0.__index.GetEntIndex(arg_101_0, arg_101_1)
	local var_101_0 = ffi.cast("uintptr_t*", arg_101_1)[0]

	if var_101_0 <= 0ULL then
		return nil
	end

	return ffi.cast("uint32_t*", var_101_0 + 16)[0]
end

function slot_0_0_0.__index.GetSteamAvatarFromPlayer(arg_102_0, arg_102_1)
	local var_102_0 = arg_102_0:GetSteamID(arg_102_1)

	if not var_102_0 then
		return nil
	end

	return arg_102_0:GetSteamAvatar(var_102_0)
end

function slot_0_0_0.__index.CreateLinerAnimation(arg_103_0, arg_103_1, arg_103_2, arg_103_3, arg_103_4)
	if not arg_103_0.arrLinerAnimations[arg_103_4] then
		arg_103_0.arrLinerAnimations[arg_103_4] = arg_103_1
	end

	local var_103_0 = math.clamp(game.global_vars.frame_time * (arg_103_3 / 10), 0, 1)

	if math.abs(arg_103_2 - arg_103_0.arrLinerAnimations[arg_103_4]) < 0.001 then
		arg_103_0.arrLinerAnimations[arg_103_4] = arg_103_2

		return arg_103_2
	end

	arg_103_0.arrLinerAnimations[arg_103_4] = arg_103_0:Lerp(arg_103_0.arrLinerAnimations[arg_103_4], arg_103_2, var_103_0)

	return arg_103_2 > arg_103_0.arrLinerAnimations[arg_103_4] and math.min(arg_103_0.arrLinerAnimations[arg_103_4], arg_103_2) or math.max(arg_103_0.arrLinerAnimations[arg_103_4], arg_103_2)
end

function slot_0_0_0.__index.CreateStaticTargetAnimation(arg_104_0, arg_104_1, arg_104_2, arg_104_3, arg_104_4)
	if not arg_104_0.arrStaticAnimations[arg_104_4] then
		arg_104_0.arrStaticAnimations[arg_104_4] = arg_104_1
	end

	local var_104_0 = math.clamp(game.global_vars.frame_time * (arg_104_3 / 10), 0, 1)
	local var_104_1 = arg_104_2 > arg_104_0.arrStaticAnimations[arg_104_4] and var_104_0 or -var_104_0

	if var_104_0 > math.abs(arg_104_2 - arg_104_0.arrStaticAnimations[arg_104_4]) then
		return arg_104_2
	end

	arg_104_0.arrStaticAnimations[arg_104_4] = math.clamp(arg_104_0.arrStaticAnimations[arg_104_4] + var_104_1, 0, 1)

	return arg_104_2 > arg_104_0.arrStaticAnimations[arg_104_4] and math.min(arg_104_0.arrStaticAnimations[arg_104_4], arg_104_2) or math.max(arg_104_0.arrStaticAnimations[arg_104_4], arg_104_2)
end

function slot_0_0_0.__index.GetWeaponCategoryElement(arg_105_0, arg_105_1, arg_105_2)
	if not arg_105_0.arrElementCategorys[arg_105_1] then
		arg_105_0.arrElementCategorys[arg_105_1] = {}
	elseif arg_105_0.arrElementCategorys[arg_105_1][arg_105_2] then
		return arg_105_0.arrElementCategorys[arg_105_1][arg_105_2]
	end

	local var_105_0 = arg_105_0.arrWeaponCategorys[arg_105_1]

	if var_105_0 then
		local var_105_1 = gui.ctx:find(arg_105_2:format(var_105_0))

		if var_105_1 then
			arg_105_0.arrElementCategorys[arg_105_1][arg_105_2] = var_105_1

			return arg_105_0.arrElementCategorys[arg_105_1][arg_105_2]
		end
	end

	if not arg_105_0.arrElementCategorys[arg_105_1][arg_105_2] then
		for iter_105_0, iter_105_1 in pairs(arg_105_0.arrWeaponIncludeCategory) do
			if arg_105_0:Contains(iter_105_1, arg_105_1) then
				local var_105_2 = gui.ctx:find(arg_105_2:format(iter_105_0))

				if var_105_2 then
					arg_105_0.arrElementCategorys[arg_105_1][arg_105_2] = var_105_2

					return arg_105_0.arrElementCategorys[arg_105_1][arg_105_2]
				end
			end
		end
	end

	if not arg_105_0.arrElementCategorys[arg_105_1][arg_105_2] then
		arg_105_0.arrElementCategorys[arg_105_1][arg_105_2] = gui.ctx:find(arg_105_2:format("general"))
	end

	return arg_105_0.arrElementCategorys[arg_105_1][arg_105_2]
end

function slot_0_0_0.__index.CreateRectMoveable(arg_106_0, arg_106_1, arg_106_2)
	if arg_106_0.arrControllers[arg_106_1] then
		return arg_106_0.arrControllers[arg_106_1]
	end

	local var_106_0 = arg_106_2 or draw.vec2(200, 200)
	local var_106_1 = gui.slider(gui.control_id(("%s-MOVEABLE X"):format(arg_106_1)), 0, arg_106_0.vecScreenSize.x, {
		"%.1f",
		[0] = nil
	}, 0.1)
	local var_106_2 = gui.slider(gui.control_id(("%s-MOVEABLE Y"):format(arg_106_1)), 0, arg_106_0.vecScreenSize.y, {
		"%.1f",
		[0] = nil
	}, 0.1)
	local var_106_3 = gui.make_control(("%s-MOVEABLE X"):format(arg_106_1), var_106_1)
	local var_106_4 = gui.make_control(("%s-MOVEABLE Y"):format(arg_106_1), var_106_2)

	if var_106_1:get_value():get() <= 0 then
		var_106_1:get_value():set(var_106_0.x)
		var_106_1:reset()
	end

	if var_106_2:get_value():get() <= 0 then
		var_106_2:get_value():set(var_106_0.y)
		var_106_2:reset()
	end

	var_106_3:set_visible(false)
	var_106_4:set_visible(false)
	arg_106_0.arrElements.pElementOfLuaA:add(var_106_3)
	arg_106_0.arrElements.pElementOfLuaA:add(var_106_4)
	arg_106_0.arrElements.pElementOfLuaA:reset()

	arg_106_0.arrControllers[arg_106_1] = setmetatable({
		flLastPressTime = 0,
		bInCursor = false,
		bAllowControl = false,
		SetViewangles = nil,
		pElementX = var_106_1,
		pElementY = var_106_2,
		vecLastCursourDelta = draw.vec2(),
		vecPosition = draw.vec2(var_106_1:get_value():get(), var_106_2:get_value():get())
	}, {
		[0] = nil,
		__index = {
			Get = function(arg_107_0)
				return arg_107_0.vecPosition
			end,
			InCursor = function(arg_108_0)
				return arg_108_0.bInCursor
			end,
			IsCarry = function(arg_109_0)
				return arg_109_0:InCursor() and arg_106_0:IsKeyDown(arg_106_0.arrVirtualKeys.VK_LBUTTON)
			end,
			Update = function(arg_110_0, arg_110_1)
				if not gui.is_visible() then
					arg_110_0.bInCursor = false
					arg_110_0.bAllowControl = false

					return
				end

				local var_110_0 = arg_106_0:GetMousePosition()
				local var_110_1 = arg_106_0:IsKeyDown(arg_106_0.arrVirtualKeys.VK_LBUTTON)
				local var_110_2 = draw.vec2(arg_110_0.vecPosition.x + arg_110_1.x, arg_110_0.vecPosition.y + arg_110_1.y)

				arg_110_0.bInCursor = var_110_0.x > arg_110_0.vecPosition.x and var_110_0.y > arg_110_0.vecPosition.y and var_110_0.x < var_110_2.x and var_110_0.y < var_110_2.y

				if arg_110_0.bInCursor and var_110_1 then
					arg_110_0.flLastPressTime = game.global_vars.cur_time

					if not arg_110_0.bAllowControl then
						arg_110_0.bAllowControl = true
						arg_110_0.vecLastCursourDelta = draw.vec2(arg_110_0.vecPosition.x - var_110_0.x, arg_110_0.vecPosition.y - var_110_0.y)
					end
				end

				if var_110_1 and math.abs(game.global_vars.cur_time - arg_110_0.flLastPressTime) <= 0.25 then
					arg_110_0.vecPosition = draw.vec2(math.clamp(var_110_0.x + arg_110_0.vecLastCursourDelta.x, 0, arg_106_0.vecScreenSize.x - arg_110_1.x), math.clamp(var_110_0.y + arg_110_0.vecLastCursourDelta.y, 0, arg_106_0.vecScreenSize.y - arg_110_1.y))

					arg_110_0.pElementX:get_value():set(arg_110_0.vecPosition.x)
					arg_110_0.pElementY:get_value():set(arg_110_0.vecPosition.y)
				else
					arg_110_0.bAllowControl = false
				end
			end
		}
	})

	return arg_106_0.arrControllers[arg_106_1]
end

function slot_0_0_0.__index.ProcessInput(arg_111_0, arg_111_1, arg_111_2)
	if arg_111_1 == 256 then
		arg_111_0.arrVirtualKeyState[arg_111_2] = true
	elseif arg_111_1 == 257 then
		arg_111_0.arrVirtualKeyState[arg_111_2] = false
	elseif arg_111_1 == 513 then
		arg_111_0.arrVirtualKeyState[1] = true
	elseif arg_111_1 == 514 then
		arg_111_0.arrVirtualKeyState[1] = false
	elseif arg_111_1 == 516 then
		arg_111_0.arrVirtualKeyState[2] = true
	elseif arg_111_1 == 517 then
		arg_111_0.arrVirtualKeyState[2] = false
	elseif arg_111_1 == 519 then
		arg_111_0.arrVirtualKeyState[4] = true
	elseif arg_111_1 == 520 then
		arg_111_0.arrVirtualKeyState[4] = false
	elseif arg_111_1 == 523 then
		local var_111_0 = arg_111_0:GetXButtonWParam(arg_111_2)

		if var_111_0 == 1 then
			arg_111_0.arrVirtualKeyState[5] = true
		elseif var_111_0 == 2 then
			arg_111_0.arrVirtualKeyState[6] = true
		end
	elseif arg_111_1 == 524 then
		local var_111_1 = arg_111_0:GetXButtonWParam(arg_111_2)

		if var_111_1 == 1 then
			arg_111_0.arrVirtualKeyState[5] = false
		elseif var_111_1 == 2 then
			arg_111_0.arrVirtualKeyState[6] = false
		end
	end
end

function slot_0_0_0.__index.CreateElements(arg_112_0)
	arg_112_0.arrElements.pElementOfLuaA = gui.ctx:find("lua>elements a")
	arg_112_0.arrElements.pUIList = gui.combo_box(gui.control_id("UI LIST"))
	arg_112_0.arrElements.pFonts = gui.combo_box(gui.control_id("UI FONTS"))
	arg_112_0.arrElements.pLocalizeAll = gui.checkbox(gui.control_id("LOCALIZE ALL"))
	arg_112_0.arrElements.pWatermarkList = gui.combo_box(gui.control_id("WATERMARK LIST"))
	arg_112_0.arrElements.pWatermarkTitle = gui.text_input(gui.control_id("WATERMARK TEXT"))
	arg_112_0.arrElements.pSpectatorsOptions = gui.combo_box(gui.control_id("SPECTATORS OPTIONS"))
	arg_112_0.arrElements.pDrawSide = gui.checkbox(gui.control_id("UI DRAW BAR"))
	arg_112_0.arrElements.pRainbowColor = gui.checkbox(gui.control_id("UI RAINBOW ACCENT"))
	arg_112_0.arrElements.pRainbowSpeed = gui.slider(gui.control_id("UI: RAINBOW SPEED"), 0.01, 1, {
		"%.2f",
		[0] = nil
	}, 0.01)
	arg_112_0.arrElements.pBlurColor = gui.color_picker(gui.control_id("UI: BLUR COLOR"), true)
	arg_112_0.arrElements.pAccentColor = gui.color_picker(gui.control_id("UI: ACCENT COLOR"), true)
	arg_112_0.arrElements.pTextgroundBlurColor = gui.color_picker(gui.control_id("UI: TEXT BLUR COLOR"), true)
	arg_112_0.arrElements.pRounding = gui.slider(gui.control_id("UI: ROUNDING"), 0, 3, {
		"%.fpx",
		[0] = nil
	}, 1)
	arg_112_0.arrElements.pThickness = gui.slider(gui.control_id("UI: THICKNESS"), 1, 3, {
		"%.fpx",
		[0] = nil
	}, 1)
	arg_112_0.arrElements.pBlurStrength = gui.slider(gui.control_id("UI: BLUR STRENGTH"), 1, 15, {
		"%.1fpx",
		[0] = nil
	}, 0.1)
	arg_112_0.arrElements.pShadowThickness = gui.slider(gui.control_id("UI: SHADOW THICKNESS"), 0, 15, {
		"%.1fpx",
		[0] = nil
	}, 0.1)
	arg_112_0.arrElements.pAnimationSpeed = gui.slider(gui.control_id("UI: ANIMATION SPEED"), 1, 100, {
		"%.fper",
		[0] = nil
	}, 1)
	arg_112_0.arrElements.pControlAnimationSpeed = gui.slider(gui.control_id("UI: CONTROL ANIMATION SPEED"), 1, 100, {
		"%.fper",
		[0] = nil
	}, 1)

	for iter_112_0, iter_112_1 in pairs({
		"Watermark",
		"Hotkeys",
		"Spectators",
		[0] = nil
	}) do
		arg_112_0.arrElements.pUIList:add(gui.selectable(gui.control_id(("UI ITEM: %s"):format(iter_112_1)), iter_112_1))
	end

	for iter_112_2, iter_112_3 in pairs({
		"Default",
		"Chinese",
		"T-Chinese",
		"Japan",
		"Korea",
		[0] = nil
	}) do
		arg_112_0.arrElements.pFonts:add(gui.selectable(gui.control_id(("SPECTATORS: %s"):format(iter_112_3)), iter_112_3))
	end

	for iter_112_4, iter_112_5 in pairs({
		"Left Side Avatar",
		"Circle Avatar",
		[0] = nil
	}) do
		arg_112_0.arrElements.pSpectatorsOptions:add(gui.selectable(gui.control_id(("SPECTATORS: %s"):format(iter_112_5)), iter_112_5))
	end

	for iter_112_6, iter_112_7 in pairs({
		"User",
		"Time",
		"Framerate",
		"CPU Load",
		"GPU Load",
		"Latency / Server",
		"( Show All Items Icon )",
		[0] = nil
	}) do
		arg_112_0.arrElements.pWatermarkList:add(gui.selectable(gui.control_id(("WATERMARK: %s"):format(iter_112_7)), iter_112_7))
	end

	arg_112_0.arrElements.pUIList.allow_multiple = true
	arg_112_0.arrElements.pWatermarkList.allow_multiple = true
	arg_112_0.arrElements.pSpectatorsOptions.allow_multiple = true
	arg_112_0.arrElements.pFonts.tooltip = "fonts select, more language soon ..."
	arg_112_0.arrElements.pWatermarkTitle.tooltip = "watermark title text, this cannot empty"
	arg_112_0.arrElements.pUIListRow = gui.make_control("Solus UI", arg_112_0.arrElements.pUIList)
	arg_112_0.arrElements.pFontsRow = gui.make_control("Fonts", arg_112_0.arrElements.pFonts)
	arg_112_0.arrElements.pLocalizeAllRow = gui.make_control("Localize All", arg_112_0.arrElements.pLocalizeAll)
	arg_112_0.arrElements.pDrawSideRow = gui.make_control("Draw Bar", arg_112_0.arrElements.pDrawSide)
	arg_112_0.arrElements.pRainbowColorRow = gui.make_control("Rainbow", arg_112_0.arrElements.pRainbowColor)
	arg_112_0.arrElements.pRainbowSpeedRow = gui.make_control("Rainbow Speed", arg_112_0.arrElements.pRainbowSpeed)
	arg_112_0.arrElements.pAccentColorRow = gui.make_control("Accent Color", arg_112_0.arrElements.pAccentColor)
	arg_112_0.arrElements.pBlurColorRow = gui.make_control("Blur Background Color", arg_112_0.arrElements.pBlurColor)
	arg_112_0.arrElements.pTextgroundBlurColorRow = gui.make_control("Text Blurground Color", arg_112_0.arrElements.pTextgroundBlurColor)
	arg_112_0.arrElements.pWatermarkListRow = gui.make_control("Watermark Items", arg_112_0.arrElements.pWatermarkList)
	arg_112_0.arrElements.pWatermarkTitleRow = gui.make_control("Watermark Text", arg_112_0.arrElements.pWatermarkTitle)
	arg_112_0.arrElements.pRoundingRow = gui.make_control("Rounding", arg_112_0.arrElements.pRounding)
	arg_112_0.arrElements.pThicknessRow = gui.make_control("Thickness", arg_112_0.arrElements.pThickness)
	arg_112_0.arrElements.pBlurStrengthRow = gui.make_control("Blur Strength", arg_112_0.arrElements.pBlurStrength)
	arg_112_0.arrElements.pShadowThicknessRow = gui.make_control("Shadow Thickness", arg_112_0.arrElements.pShadowThickness)
	arg_112_0.arrElements.pSpectatorsOptionsRow = gui.make_control("Spectators Options", arg_112_0.arrElements.pSpectatorsOptions)
	arg_112_0.arrElements.pAnimationSpeedRow = gui.make_control("Animation", arg_112_0.arrElements.pAnimationSpeed)
	arg_112_0.arrElements.pControlAnimationSpeedRow = gui.make_control("Control Animation", arg_112_0.arrElements.pControlAnimationSpeed)

	if arg_112_0.arrElements.pRounding:get_value():get() <= 0 then
		arg_112_0.arrElements.pRounding:get_value():set(1)
		arg_112_0.arrElements.pDrawSide:get_value():set(true)
		arg_112_0.arrElements.pShadowThickness:get_value():set(10)
		arg_112_0.arrElements.pShadowThickness:reset()
		arg_112_0.arrElements.pRounding:reset()
		arg_112_0.arrElements.pDrawSide:reset()
	end

	if arg_112_0.arrElements.pThickness:get_value():get() <= 0 then
		arg_112_0.arrElements.pThickness:get_value():set(1)
		arg_112_0.arrElements.pThickness:reset()
	end

	if arg_112_0.arrElements.pBlurStrength:get_value():get() <= 0 then
		arg_112_0.arrElements.pBlurStrength:get_value():set(10)
		arg_112_0.arrElements.pBlurStrength:reset()
	end

	if arg_112_0.arrElements.pAnimationSpeed:get_value():get() <= 0 then
		arg_112_0.arrElements.pAnimationSpeed:get_value():set(50)
		arg_112_0.arrElements.pAnimationSpeed:reset()
	end

	if arg_112_0.arrElements.pControlAnimationSpeed:get_value():get() <= 0 then
		arg_112_0.arrElements.pControlAnimationSpeed:get_value():set(50)
		arg_112_0.arrElements.pControlAnimationSpeed:reset()
	end

	if arg_112_0.arrElements.pRainbowSpeed:get_value():get() <= 0 then
		arg_112_0.arrElements.pRainbowSpeed:get_value():set(0.2)
		arg_112_0.arrElements.pRainbowSpeed:reset()
	end

	if arg_112_0.arrElements.pBlurColor:get_value():get():rgba() == 0 then
		arg_112_0.arrElements.pBlurColor:get_value():set(draw.color(255, 255, 255, 255))
		arg_112_0.arrElements.pBlurColor:reset()
	end

	if arg_112_0.arrElements.pAccentColor:get_value():get():rgba() == 0 then
		arg_112_0.arrElements.pAccentColor:get_value():set(arg_112_0.clrAccent)
		arg_112_0.arrElements.pAccentColor:reset()
	end

	if arg_112_0.arrElements.pTextgroundBlurColor:get_value():get():rgba() == 0 then
		arg_112_0.arrElements.pTextgroundBlurColor:get_value():set(draw.color(255, 255, 255, 255))
		arg_112_0.arrElements.pTextgroundBlurColor:reset()
	end

	if arg_112_0.arrElements.pWatermarkTitle.value == "" then
		arg_112_0.arrElements.pWatermarkTitle:set_value("fatality")
		arg_112_0.arrElements.pWatermarkTitle:reset()
	end

	arg_112_0.nCompensateHeight = (draw.GetScale() - 1) * 2

	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pUIListRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pFontsRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pLocalizeAllRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pWatermarkListRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pWatermarkTitleRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pSpectatorsOptionsRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pDrawSideRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pRainbowColorRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pRainbowSpeedRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pAccentColorRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pBlurColorRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pTextgroundBlurColorRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pRoundingRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pThicknessRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pBlurStrengthRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pShadowThicknessRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pAnimationSpeedRow)
	arg_112_0.arrElements.pElementOfLuaA:add(arg_112_0.arrElements.pControlAnimationSpeedRow)
	arg_112_0.arrElements.pElementOfLuaA:reset()
end

function slot_0_0_0.__index.HandleElements(arg_113_0)
	local var_113_0 = arg_113_0:ContainUI(arg_113_0.arrElements.pUIList:get_value():get():get_raw(), 1)
	local var_113_1 = arg_113_0:ContainUI(arg_113_0.arrElements.pUIList:get_value():get():get_raw(), 3)
	local var_113_2 = arg_113_0:ContainUI(arg_113_0.arrElements.pUIList:get_value():get():get_raw(), 2)
	local var_113_3 = var_113_0 or var_113_2 or var_113_1

	arg_113_0.arrElements.pFontsRow:set_visible(var_113_3)
	arg_113_0.arrElements.pRoundingRow:set_visible(var_113_3)
	arg_113_0.arrElements.pDrawSideRow:set_visible(var_113_3)
	arg_113_0.arrElements.pBlurColorRow:set_visible(var_113_3)
	arg_113_0.arrElements.pThicknessRow:set_visible(var_113_3)
	arg_113_0.arrElements.pWatermarkListRow:set_visible(var_113_0)
	arg_113_0.arrElements.pWatermarkTitleRow:set_visible(var_113_0)
	arg_113_0.arrElements.pRainbowColorRow:set_visible(var_113_3)
	arg_113_0.arrElements.pBlurStrengthRow:set_visible(var_113_3)
	arg_113_0.arrElements.pAnimationSpeedRow:set_visible(var_113_3)
	arg_113_0.arrElements.pShadowThicknessRow:set_visible(var_113_3)
	arg_113_0.arrElements.pSpectatorsOptionsRow:set_visible(var_113_1)
	arg_113_0.arrElements.pControlAnimationSpeedRow:set_visible(var_113_3)
	arg_113_0.arrElements.pTextgroundBlurColorRow:set_visible(var_113_2 or var_113_1)
	arg_113_0.arrElements.pRainbowSpeedRow:set_visible(var_113_3 and arg_113_0.arrElements.pRainbowColor:get_value():get())
	arg_113_0.arrElements.pAccentColorRow:set_visible(var_113_3 and not arg_113_0.arrElements.pRainbowColor:get_value():get())
	arg_113_0.arrElements.pLocalizeAllRow:set_visible(var_113_3 and arg_113_0.arrElements.pFonts:get_value():get():get_raw() > 1)
end

function slot_0_0_0.__index.CreateGameInterface(arg_114_0)
	function __shutdown()
		for iter_115_0, iter_115_1 in pairs(arg_114_0.arrUnloadCallBacks) do
			iter_115_1()
		end
	end

	ffi.metatype("ID3D11Object", {
		__index = {
			frame_count = nil,
			Release = arg_114_0:Virtual(2, "int(__stdcall*)(void*)")
		}
	})
	ffi.metatype("ISteamUser", {
		__index = {
			["sol.02v%.user"] = nil,
			GetSteamID = arg_114_0:Virtual(2, "void(__thiscall*)(void*, CSteamID*)")
		}
	})
	ffi.metatype("ISteamClient", {
		["sol.V|Ju.♻"] = nil,
		__index = {
			get_observer_mode = nil,
			GetSteamUtils = arg_114_0:Virtual(9, "ISteamUtils*(__thiscall*)(void*, hSteamPipe*, const char*)"),
			GetSteamUser = arg_114_0:Virtual(5, "ISteamUser*(__thiscall*)(void*, hSteamUser*, hSteamPipe*, const char*)"),
			GetSteamFriends = arg_114_0:Virtual(8, "ISteamFriends*(__thiscall*)(void*, hSteamUser*, hSteamPipe*, const char*)")
		}
	})
	ffi.metatype("ISteamUtils", {
		["sol.VbCN"] = nil,
		__index = {
			tan = nil,
			GetImageRGBA = arg_114_0:Virtual(6, "bool(__thiscall*)(void*, int, uint8_t*, int)"),
			GetImageSize = arg_114_0:Virtual(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)")
		}
	})
	ffi.metatype("ISteamFriends", {
		[0] = nil,
		__index = {
			[0] = nil,
			GetPersonaName = arg_114_0:Virtual(0, "const char*(__thiscall*)(void*)"),
			GetSmallFriendAvatar = arg_114_0:Virtual(34, "int(__thiscall*)(void*, uint64_t)")
		}
	})
	ffi.metatype("IDXGISwapChain", {
		["sol.J{fQ.user"] = nil,
		__index = {
			MACHINEGUN = nil,
			GetDevice = arg_114_0:Virtual(7, "int(__stdcall*)(void*, const GUID&, ID3D11Device**)")
		}
	})
	ffi.metatype("ID3D11Device", {
		get_forwardmove = nil,
		__index = {
			IN_TURNLEFT = nil,
			CreateTexture2D = arg_114_0:Virtual(5, "int(__stdcall*)(void*, D3D11_TEXTURE2D_DESC*, D3D11_SUBRESOURCE_DATA*, ID3D11Object**)"),
			CreateShaderResourceView = arg_114_0:Virtual(7, "int(__stdcall*)(void*, ID3D11Object*, D3D11_SHADER_RESOURCE_VIEW_DESC*, ID3D11Object**)")
		}
	})
	ffi.metatype("CHandle", {
		[0] = nil,
		__gc = function(arg_116_0)
			if arg_116_0.hHandle == arg_114_0.NULLPTR or arg_116_0.hHandle == arg_114_0.INVALID_HANDLE_VALUE then
				return
			end

			arg_114_0:CallModuleExport("Kernel32.dll", "CloseHandle", "int(__stdcall*)(void*)", arg_116_0.hHandle)

			arg_116_0.hHandle = arg_114_0.NULLPTR
		end
	})
	ffi.metatype("CDataBuffer", {
		knife_falchion = nil,
		__call = function(arg_117_0, arg_117_1)
			return arg_117_0:Alloc(arg_117_1)
		end,
		__gc = function(arg_118_0)
			return arg_118_0:Release()
		end,
		__index = {
			Base = function(arg_119_0)
				return arg_119_0.pData
			end,
			Cast = function(arg_120_0, arg_120_1)
				if arg_120_0.pData == arg_114_0.NULLPTR then
					return nil
				end

				return ffi.cast(arg_120_1, arg_120_0.pData)
			end,
			Alloc = function(arg_121_0, arg_121_1)
				arg_121_0.nSize = arg_121_1
				arg_121_0.pData = ffi.cast("uint8_t*", arg_114_0:CallModuleExport("msvcrt.dll", "malloc", "void*(__cdecl*)(uint64_t)", arg_121_1))

				return arg_121_0
			end,
			Size = function(arg_122_0)
				return arg_122_0.nSize
			end,
			Reset = function(arg_123_0)
				if arg_123_0.pData == arg_114_0.NULLPTR then
					return arg_123_0
				end

				arg_114_0:CallModuleExport("msvcrt.dll", "memset", "void*(__cdecl*)(void*, int, uint64_t)", arg_123_0.pData, 0, arg_123_0.nSize)

				return arg_123_0
			end,
			Realloc = function(arg_124_0, arg_124_1)
				if arg_124_0.pData == arg_114_0.NULLPTR then
					return arg_124_0:Alloc(arg_124_1)
				end

				arg_124_0.nSize = arg_124_1
				arg_124_0.pData = ffi.cast("uint8_t*", arg_114_0:CallModuleExport("msvcrt.dll", "realloc", "void*(__cdecl*)(void*, uint64_t)", arg_124_0.pData, arg_124_1))

				return arg_124_0
			end,
			Release = function(arg_125_0)
				arg_125_0.nSize = 0

				local var_125_0 = arg_125_0.pData

				if var_125_0 ~= arg_114_0.NULLPTR then
					arg_125_0.pData = arg_114_0.NULLPTR

					arg_114_0:CallModuleExport("msvcrt.dll", "free", "void(__cdecl*)(void*)", var_125_0)
				end

				return var_125_0
			end
		}
	})

	slot_114_1_0 = ffi.new("ID3D11Device*[1]")
	arg_114_0.hSteamUser = arg_114_0:CallModuleExport("steam_api64.dll", "GetHSteamUser", "hSteamUser*(__fastcall*)()")
	arg_114_0.hSteamPipe = arg_114_0:CallModuleExport("steam_api64.dll", "GetHSteamPipe", "hSteamPipe*(__fastcall*)()")
	arg_114_0.pSteamClient = arg_114_0:CallModuleExport("steam_api64.dll", "SteamClient", "ISteamClient*(__fastcall*)()")
	arg_114_0.pRenderDevice = ffi.cast("CRenderDevice*", arg_114_0:ToAbsolute(arg_114_0:FindPattern("rendersystemdx11.dll", "48 89 2D ? ? ? ? 66 0F 7F 05"), 3, 0, 2))

	if arg_114_0.pRenderDevice.pSwapChain:GetDevice(arg_114_0:__uuidof("db6f6ddb-ac77-4e88-8253-819df9bbf140"), slot_114_1_0) >= 0 then
		arg_114_0.pDX11Device = slot_114_1_0[0]
	else
		assert(false, "Solus UI: error -> failed get d3d direct device！")
	end

	arg_114_0.pSteamUtils = arg_114_0.pSteamClient:GetSteamUtils(arg_114_0.hSteamPipe, "SteamUtils010")
	arg_114_0.pSteamUser = arg_114_0.pSteamClient:GetSteamUser(arg_114_0.hSteamUser, arg_114_0.hSteamPipe, "SteamUser016")
	arg_114_0.pSteamFriends = arg_114_0.pSteamClient:GetSteamFriends(arg_114_0.hSteamUser, arg_114_0.hSteamPipe, "SteamFriends017")

	arg_114_0.pSteamUser:GetSteamID(arg_114_0.pSteamID)

	arg_114_0.szUserName = ffi.string(arg_114_0.pSteamFriends:GetPersonaName())
end

function slot_0_0_0.__index.CreateResources(arg_126_0)
	arg_126_0.arrFonts.Default = arg_126_0:CreateGDIFont("Verdana", 13, bit.bor(draw.font_flags.shadow, draw.font_flags.anti_alias, draw.font_flags.no_dpi), 0, 255)
	arg_126_0.arrIcons.Clock = arg_126_0:LoadSvg("        <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Free v7.0.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path fill=\"#00afff\" d=\"M528 320C528 434.9 434.9 528 320 528C205.1 528 112 434.9 112 320C112 205.1 205.1 112 320 112C434.9 112 528 205.1 528 320zM64 320C64 461.4 178.6 576 320 576C461.4 576 576 461.4 576 320C576 178.6 461.4 64 320 64C178.6 64 64 178.6 64 320zM296 184L296 320C296 328 300 335.5 306.7 340L402.7 404C413.7 411.4 428.6 408.4 436 397.3C443.4 386.2 440.4 371.4 429.3 364L344 307.2L344 184C344 170.7 333.3 160 320 160C306.7 160 296 170.7 296 184z\"/></svg>\n    ", 17)
	arg_126_0.arrIcons.Desktop = arg_126_0:LoadSvg("        <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Pro v7.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2025 Fonticons, Inc.--><path fill=\"#00afff\" d=\"M128 96C92.7 96 64 124.7 64 160L64 416C64 451.3 92.7 480 128 480L272 480L256 528L184 528C170.7 528 160 538.7 160 552C160 565.3 170.7 576 184 576L456 576C469.3 576 480 565.3 480 552C480 538.7 469.3 528 456 528L384 528L368 480L512 480C547.3 480 576 451.3 576 416L576 160C576 124.7 547.3 96 512 96L128 96zM160 160L480 160C497.7 160 512 174.3 512 192L512 352C512 369.7 497.7 384 480 384L160 384C142.3 384 128 369.7 128 352L128 192C128 174.3 142.3 160 160 160z\"/></svg>\n    ", 18)
	arg_126_0.arrIcons.Fan = arg_126_0:LoadSvg("        [[<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Pro v7.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2025 Fonticons, Inc.--><path fill=\"#00afff\" d=\"M224 208C224 128.5 288.5 64 368 64C376.8 64 384 71.2 384 80L384 232.2C399 226.9 415.2 224 432 224C511.5 224 576 288.5 576 368C576 376.8 568.8 384 560 384L407.8 384C413.1 399 416 415.2 416 432C416 511.5 351.5 576 272 576C263.2 576 256 568.8 256 560L256 407.8C241 413.1 224.8 416 208 416C128.5 416 64 351.5 64 272C64 263.2 71.2 256 80 256L232.2 256C226.9 241 224 224.8 224 208zM320 352C337.7 352 352 337.7 352 320C352 302.3 337.7 288 320 288C302.3 288 288 302.3 288 320C288 337.7 302.3 352 320 352z\"/></svg>\n    ", 18)
	arg_126_0.arrIcons.User = arg_126_0:LoadSvg("        <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Free v7.0.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path fill=\"#00afff\" d=\"M240 192C240 147.8 275.8 112 320 112C364.2 112 400 147.8 400 192C400 236.2 364.2 272 320 272C275.8 272 240 236.2 240 192zM448 192C448 121.3 390.7 64 320 64C249.3 64 192 121.3 192 192C192 262.7 249.3 320 320 320C390.7 320 448 262.7 448 192zM144 544C144 473.3 201.3 416 272 416L368 416C438.7 416 496 473.3 496 544L496 552C496 565.3 506.7 576 520 576C533.3 576 544 565.3 544 552L544 544C544 446.8 465.2 368 368 368L272 368C174.8 368 96 446.8 96 544L96 552C96 565.3 106.7 576 120 576C133.3 576 144 565.3 144 552L144 544z\"/></svg>\n    ", 17)
	arg_126_0.arrIcons.Chart = arg_126_0:LoadSvg("        <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Free v7.0.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path fill=\"#00afff\" d=\"M112 120C112 106.7 101.3 96 88 96C74.7 96 64 106.7 64 120L64 464C64 508.2 99.8 544 144 544L552 544C565.3 544 576 533.3 576 520C576 506.7 565.3 496 552 496L144 496C126.3 496 112 481.7 112 464L112 120zM216 192L424 192C437.3 192 448 181.3 448 168C448 154.7 437.3 144 424 144L216 144C202.7 144 192 154.7 192 168C192 181.3 202.7 192 216 192zM216 256C202.7 256 192 266.7 192 280C192 293.3 202.7 304 216 304L360 304C373.3 304 384 293.3 384 280C384 266.7 373.3 256 360 256L216 256zM216 368C202.7 368 192 378.7 192 392C192 405.3 202.7 416 216 416L488 416C501.3 416 512 405.3 512 392C512 378.7 501.3 368 488 368L216 368z\"/></svg>\n    ", 17)
	arg_126_0.arrIcons.Wifi = arg_126_0:LoadSvg("        <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Free v7.0.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path fill=\"#00afff\" d=\"M320 160C229.1 160 146.8 196 86.3 254.6C73.6 266.9 53.3 266.6 41.1 253.9C28.9 241.2 29.1 220.9 41.8 208.7C113.7 138.9 211.9 96 320 96C428.1 96 526.3 138.9 598.3 208.7C611 221 611.3 241.3 599 253.9C586.7 266.5 566.4 266.9 553.8 254.6C493.2 196 410.9 160 320 160zM272 496C272 469.5 293.5 448 320 448C346.5 448 368 469.5 368 496C368 522.5 346.5 544 320 544C293.5 544 272 522.5 272 496zM200 390.2C188.3 403.5 168.1 404.7 154.8 393C141.5 381.3 140.3 361.1 152 347.8C193 301.4 253.1 272 320 272C386.9 272 447 301.4 488 347.8C499.7 361.1 498.4 381.3 485.2 393C472 404.7 451.7 403.4 440 390.2C410.6 356.9 367.8 336 320 336C272.2 336 229.4 356.9 200 390.2z\"/></svg>\n    ", 17)
	arg_126_0.arrIcons.Eye = arg_126_0:LoadSvg("        <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Free v7.0.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path fill=\"#00aaff\" d=\"M320 128C179.2 128 90.7 256 64 320C90.7 384 179.2 512 320 512C460.8 512 549.3 384 576 320C549.3 256 460.8 128 320 128zM127.4 176.6C174.5 132.8 239.2 96 320 96C400.8 96 465.5 132.8 512.6 176.6C559.4 220.1 590.7 272 605.6 307.7C608.9 315.6 608.9 324.4 605.6 332.3C590.7 368 559.4 420 512.6 463.4C465.5 507.1 400.8 544 320 544C239.2 544 174.5 507.2 127.4 463.4C80.6 419.9 49.3 368 34.4 332.3C31.1 324.4 31.1 315.6 34.4 307.7C49.3 272 80.6 220 127.4 176.6zM320 416C373 416 416 373 416 320C416 276.7 387.3 240.1 347.9 228.1C350.6 236.9 352 246.3 352 256C352 309 309 352 256 352C246.3 352 236.9 350.6 228.1 347.9C240 387.3 276.7 416 320 416zM192.2 327.8C192 325.2 192 322.6 192 320C192 307.8 193.7 296.1 196.9 285C197.2 284.1 197.4 283.2 197.7 282.3C210.1 241.9 242 210.1 282.4 197.6C294.3 193.9 307 192 320.1 192C322.6 192 325.1 192.1 327.5 192.2L327.9 192.2C395 196.2 448.1 251.9 448.1 320C448.1 390.7 390.8 448 320.1 448C252 448 196.3 394.8 192.3 327.8zM224.3 311.7C233.6 317 244.4 320.1 255.9 320.1C291.2 320.1 319.9 291.4 319.9 256.1C319.9 244.6 316.9 233.8 311.5 224.5C265.1 228.5 228.2 265.4 224.2 311.8z\"/></svg>\n    ", 18)
	arg_126_0.arrIcons.Keyboard = arg_126_0:LoadSvg("        <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\"><!--!Font Awesome Free v7.0.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path fill=\"#00aaff\" d=\"M96 160C78.3 160 64 174.3 64 192L64 448C64 465.7 78.3 480 96 480L544 480C561.7 480 576 465.7 576 448L576 192C576 174.3 561.7 160 544 160L96 160zM32 192C32 156.7 60.7 128 96 128L544 128C579.3 128 608 156.7 608 192L608 448C608 483.3 579.3 512 544 512L96 512C60.7 512 32 483.3 32 448L32 192zM120 200L136 200C144.8 200 152 207.2 152 216L152 232C152 240.8 144.8 248 136 248L120 248C111.2 248 104 240.8 104 232L104 216C104 207.2 111.2 200 120 200zM104 312C104 303.2 111.2 296 120 296L136 296C144.8 296 152 303.2 152 312L152 328C152 336.8 144.8 344 136 344L120 344C111.2 344 104 336.8 104 328L104 312zM216 200L232 200C240.8 200 248 207.2 248 216L248 232C248 240.8 240.8 248 232 248L216 248C207.2 248 200 240.8 200 232L200 216C200 207.2 207.2 200 216 200zM200 312C200 303.2 207.2 296 216 296L232 296C240.8 296 248 303.2 248 312L248 328C248 336.8 240.8 344 232 344L216 344C207.2 344 200 336.8 200 328L200 312zM312 200L328 200C336.8 200 344 207.2 344 216L344 232C344 240.8 336.8 248 328 248L312 248C303.2 248 296 240.8 296 232L296 216C296 207.2 303.2 200 312 200zM296 312C296 303.2 303.2 296 312 296L328 296C336.8 296 344 303.2 344 312L344 328C344 336.8 336.8 344 328 344L312 344C303.2 344 296 336.8 296 328L296 312zM408 200L424 200C432.8 200 440 207.2 440 216L440 232C440 240.8 432.8 248 424 248L408 248C399.2 248 392 240.8 392 232L392 216C392 207.2 399.2 200 408 200zM392 312C392 303.2 399.2 296 408 296L424 296C432.8 296 440 303.2 440 312L440 328C440 336.8 432.8 344 424 344L408 344C399.2 344 392 336.8 392 328L392 312zM504 200L520 200C528.8 200 536 207.2 536 216L536 232C536 240.8 528.8 248 520 248L504 248C495.2 248 488 240.8 488 232L488 216C488 207.2 495.2 200 504 200zM488 312C488 303.2 495.2 296 504 296L520 296C528.8 296 536 303.2 536 312L536 328C536 336.8 528.8 344 520 344L504 344C495.2 344 488 336.8 488 328L488 312zM208 400L432 400C440.8 400 448 407.2 448 416C448 424.8 440.8 432 432 432L208 432C199.2 432 192 424.8 192 416C192 407.2 199.2 400 208 400z\"/></svg>\n    ", 18)
end

function slot_0_0_0.__index.UnicodeExist(arg_127_0, arg_127_1)
	for iter_127_0 = 1, arg_127_1:len() do
		local var_127_0 = arg_127_1:sub(iter_127_0, iter_127_0):byte()

		if var_127_0 < 32 or var_127_0 > 126 then
			return true
		end
	end

	return false
end

function slot_0_0_0.__index.GetHeightOffset(arg_128_0, arg_128_1)
	if arg_128_0.arrElements.pFonts:get_value():get():get_raw() == 1 then
		return 0
	end

	return arg_128_0:UnicodeExist(arg_128_1) and 3 or 0
end

function slot_0_0_0.__index.FixupCharacters(arg_129_0, arg_129_1)
	if arg_129_0.arrElements.pFonts:get_value():get():get_raw() > 1 then
		return arg_129_1
	end

	local var_129_0 = 1
	local var_129_1 = ""
	local var_129_2 = arg_129_1:len()

	while var_129_0 <= var_129_2 do
		local var_129_3 = arg_129_1:sub(var_129_0, var_129_0)
		local var_129_4 = var_129_3:byte()

		if var_129_4 < 32 or var_129_4 > 126 then
			var_129_0 = var_129_0 + 2
			var_129_1 = ("%s?"):format(var_129_1)
		else
			var_129_1 = ("%s%s"):format(var_129_1, var_129_3)
		end

		var_129_0 = var_129_0 + 1
	end

	return var_129_1
end

function slot_0_0_0.__index.Rainbow(arg_130_0, arg_130_1)
	local var_130_0 = {
		1,
		1,
		1,
		1,
		[0] = nil
	}
	local var_130_1 = game.global_vars.cur_time * arg_130_1
	local var_130_2 = math.floor(var_130_1 * 6)
	local var_130_3 = var_130_2 % 6
	local var_130_4 = var_130_1 * 6 - var_130_2
	local var_130_5 = 1 - var_130_4
	local var_130_6 = 1 - (1 - var_130_4)

	if var_130_3 == 0 then
		var_130_0 = {
			1,
			var_130_6,
			0,
			1,
			[0] = nil
		}
	elseif var_130_3 == 1 then
		var_130_0 = {
			var_130_5,
			1,
			0,
			1,
			[0] = nil
		}
	elseif var_130_3 == 2 then
		var_130_0 = {
			0,
			1,
			var_130_6,
			1,
			[0] = nil
		}
	elseif var_130_3 == 3 then
		var_130_0 = {
			0,
			var_130_5,
			1,
			1,
			[0] = nil
		}
	elseif var_130_3 == 4 then
		var_130_0 = {
			var_130_6,
			0,
			1,
			1,
			[0] = nil
		}
	elseif var_130_3 == 5 then
		var_130_0 = {
			1,
			0,
			var_130_5,
			1,
			[0] = nil
		}
	end

	return draw.color(var_130_0[1] * 255, var_130_0[2] * 255, var_130_0[3] * 255, 255)
end

function slot_0_0_0.__index.Command(arg_131_0)
	arg_131_0:SetAntiAlias(true)

	arg_131_0.bPrevSkipDPI = draw.surface.skip_dpi
	arg_131_0.bPrevIgnoreScaling = draw.surface.g.ignore_scaling
	arg_131_0.flAnimation = arg_131_0.arrElements.pAnimationSpeed:get_value():get()
	arg_131_0.flCarryAnimation = arg_131_0.arrElements.pControlAnimationSpeed:get_value():get()
	draw.surface.skip_dpi = true
	draw.surface.g.ignore_scaling = true
end

function slot_0_0_0.__index.ResetCommand(arg_132_0)
	draw.surface.skip_dpi = arg_132_0.bPrevSkipDPI
	draw.surface.g.ignore_scaling = arg_132_0.bPrevIgnoreScaling
end

function slot_0_0_0.__index.WaterMark(arg_133_0)
	slot_133_1_0 = arg_133_0:ContainUI(arg_133_0.arrElements.pUIList:get_value():get():get_raw(), 1)
	slot_133_2_0 = arg_133_0:CreateStaticTargetAnimation(0, slot_133_1_0 and 1 or 0, arg_133_0.flAnimation, "Watermark")

	if slot_133_2_0 <= 0 then
		return
	end

	slot_133_3_0 = arg_133_0:GetGlobalFont()
	slot_133_4_0 = arg_133_0:GetSystemTime()
	slot_133_5_0 = game.global_vars.cur_time
	slot_133_6_0 = arg_133_0:RemoveIllegalString(arg_133_0.arrElements.pWatermarkTitle.value)
	slot_133_7_0 = slot_133_6_0
	slot_133_8_0 = arg_133_0.arrElements.pWatermarkList:get_value():get():get_raw()
	slot_133_9_0 = arg_133_0:ContainUI(slot_133_8_0, 7)
	slot_133_10_0 = arg_133_0:CreateRectMoveable("Watermark", draw.vec2(arg_133_0.vecScreenSize.x - 200, 15))

	if arg_133_0:ContainUI(slot_133_8_0, 1) then
		slot_133_7_0 = ("%s |%s%s"):format(slot_133_7_0, slot_133_9_0 and "      " or " ", arg_133_0.szUserName)
	end

	if arg_133_0:ContainUI(slot_133_8_0, 2) then
		slot_133_7_0 = ("%s |%s%s : %s %s"):format(slot_133_7_0, slot_133_9_0 and "      " or " ", slot_133_4_0.nHours > 12 and slot_133_4_0.nHours - 12 or slot_133_4_0.nHours, slot_133_4_0.nMinutes, arg_133_0:GetTimeLocalte(slot_133_4_0.nHours >= 12))
	end

	if arg_133_0:ContainUI(slot_133_8_0, 3) then
		if math.abs(slot_133_5_0 - arg_133_0.flLastFrameUpdateTime) > 1 and game.global_vars.frame_time > 0 then
			arg_133_0.flLastFrameUpdateTime = slot_133_5_0
			arg_133_0.nLastUpdateFrame = math.clamp(arg_133_0:Round(1 / game.global_vars.frame_time), 0, 1000)
		end

		slot_133_7_0 = ("%s |%s%s: %d"):format(slot_133_7_0, slot_133_9_0 and "      " or " ", arg_133_0:GetFramerateLocalte(), arg_133_0.nLastUpdateFrame)
	end

	slot_133_11_0 = arg_133_0:CreateStaticTargetAnimation(0, slot_133_10_0:IsCarry() and 0.75 or slot_133_10_0:InCursor() and 0.5 or 0, arg_133_0.flCarryAnimation, "Watermark Carry")
	slot_133_12_0 = draw.color(slot_133_11_0 * 255, slot_133_11_0 * 255, slot_133_11_0 * 255, 125)

	if arg_133_0:ContainUI(slot_133_8_0, 4) then
		if math.abs(slot_133_5_0 - arg_133_0.flLastCPULoadUpdateTime) > 1 then
			arg_133_0.flLastCPULoadUpdateTime = slot_133_5_0
			arg_133_0.nLastUpdateCPULoad = arg_133_0:Round(arg_133_0:GetCPULoad())
		end

		slot_133_7_0 = ("%s |%s%s: %d%s"):format(slot_133_7_0, slot_133_9_0 and "      " or " ", arg_133_0:GetCoreLocalte(), arg_133_0.nLastUpdateCPULoad, "%")
	end

	if arg_133_0:ContainUI(slot_133_8_0, 5) then
		if math.abs(slot_133_5_0 - arg_133_0.flLastGPULoadUpdateTime) > 1 then
			arg_133_0.flLastGPULoadUpdateTime = slot_133_5_0
			arg_133_0.nLastUpdateGPULoad = arg_133_0:Round(arg_133_0:GetGPULoad())
		end

		slot_133_7_0 = ("%s |%s%s: %d%s"):format(slot_133_7_0, slot_133_9_0 and "      " or " ", arg_133_0:GetGraphicsLocalte(), arg_133_0.nLastUpdateGPULoad, "%")
	end

	if arg_133_0:ContainUI(slot_133_8_0, 6) and game.engine:in_game() then
		slot_133_13_1 = game.engine:get_netchan()

		if slot_133_13_1 then
			if slot_133_13_1:is_null() then
				slot_133_7_0 = ("%s |%s%s"):format(slot_133_7_0, slot_133_9_0 and "      " or " ", arg_133_0:GetLocalServerLocalte())
			else
				slot_133_14_1 = arg_133_0:Round(slot_133_13_1:get_latency() * 1000)

				if slot_133_14_1 > 5 then
					slot_133_7_0 = ("%s |%s%d%s"):format(slot_133_7_0, slot_133_9_0 and "      " or " ", slot_133_14_1, arg_133_0:GetMilliSecondLocalte())
				end
			end
		end
	end

	arg_133_0:PushAlpha(slot_133_2_0)

	slot_133_13_0 = slot_133_10_0:Get()
	slot_133_14_0 = arg_133_0:MesureText(slot_133_7_0, slot_133_3_0)
	slot_133_15_0 = arg_133_0.arrElements.pBlurColor:get_value():get()
	slot_133_16_0 = arg_133_0.arrElements.pBlurStrength:get_value():get()
	slot_133_17_0 = arg_133_0.arrElements.pShadowThickness:get_value():get()
	slot_133_18_0 = draw.vec2(arg_133_0:CreateLinerAnimation(slot_133_14_0.x + 12, slot_133_14_0.x + 12, arg_133_0.flAnimation, "Watermark Width"), 21)
	slot_133_19_0 = arg_133_0.arrElements.pRainbowColor:get_value():get() and arg_133_0:Rainbow(arg_133_0.arrElements.pRainbowSpeed:get_value():get()) or arg_133_0.arrElements.pAccentColor:get_value():get()
	slot_133_20_0 = draw.vec2(slot_133_13_0.x + slot_133_18_0.x, slot_133_13_0.y + slot_133_18_0.y)

	arg_133_0:RoundingBoard(slot_133_13_0, slot_133_20_0, slot_133_19_0, slot_133_12_0, slot_133_15_0, slot_133_17_0, slot_133_16_0, arg_133_0.arrElements.pThickness:get_value():get(), arg_133_0.arrElements.pRounding:get_value():get(), arg_133_0.arrElements.pDrawSide:get_value():get())
	arg_133_0:PushClipRect(slot_133_13_0, slot_133_20_0)
	arg_133_0:Text(draw.vec2(slot_133_13_0.x + 7, slot_133_13_0.y + arg_133_0.nCompensateHeight + 5), slot_133_7_0, draw.color(255, 255, 255, 255), slot_133_3_0)

	if slot_133_9_0 then
		slot_133_21_0 = arg_133_0:GetIncreaseIconSize()
		slot_133_22_0 = arg_133_0:MesureText("      ", slot_133_3_0)
		slot_133_23_0 = arg_133_0:MesureText(("%s |"):format(slot_133_6_0), slot_133_3_0)
		slot_133_24_0 = slot_133_23_0.x

		if arg_133_0:ContainUI(slot_133_8_0, 1) then
			slot_133_25_5 = arg_133_0.arrIcons.User:get_size()
			slot_133_26_3 = arg_133_0:MesureText(("%s |"):format(arg_133_0.szUserName), slot_133_3_0)

			arg_133_0:Texture(arg_133_0.arrIcons.User, draw.vec2(slot_133_13_0.x + slot_133_23_0.x + slot_133_25_5.x + slot_133_21_0, slot_133_13_0.y + slot_133_18_0.y - slot_133_25_5.y / 2 - 2), slot_133_25_5, draw.color(255, 255, 255, 255))

			slot_133_24_0 = slot_133_24_0 + slot_133_26_3.x + slot_133_22_0.x
		end

		if arg_133_0:ContainUI(slot_133_8_0, 2) then
			slot_133_25_4 = arg_133_0.arrIcons.Clock:get_size()

			arg_133_0:Texture(arg_133_0.arrIcons.Clock, draw.vec2(slot_133_13_0.x + slot_133_24_0 + slot_133_25_4.x + slot_133_21_0 - 1, slot_133_13_0.y + slot_133_18_0.y - slot_133_25_4.y / 2 - 2), slot_133_25_4, draw.color(255, 255, 255, 255))

			slot_133_24_0 = slot_133_24_0 + arg_133_0:MesureText(("%s : %s %s |"):format(slot_133_4_0.nHours > 12 and slot_133_4_0.nHours - 12 or slot_133_4_0.nHours, slot_133_4_0.nMinutes, arg_133_0:GetTimeLocalte(slot_133_4_0.nHours >= 12)), slot_133_3_0).x + slot_133_22_0.x
		end

		if arg_133_0:ContainUI(slot_133_8_0, 3) then
			slot_133_25_3 = arg_133_0.arrIcons.Chart:get_size()
			slot_133_26_2 = arg_133_0:MesureText(("%s: %d |"):format(arg_133_0:GetFramerateLocalte(), arg_133_0.nLastUpdateFrame), slot_133_3_0)

			arg_133_0:Texture(arg_133_0.arrIcons.Chart, draw.vec2(slot_133_13_0.x + slot_133_24_0 + slot_133_25_3.x + slot_133_21_0, slot_133_13_0.y + slot_133_18_0.y - slot_133_25_3.y / 2 - 2), slot_133_25_3, draw.color(255, 255, 255, 255))

			slot_133_24_0 = slot_133_24_0 + slot_133_26_2.x + slot_133_22_0.x
		end

		if arg_133_0:ContainUI(slot_133_8_0, 4) then
			slot_133_25_2 = arg_133_0.arrIcons.Desktop:get_size()
			slot_133_26_1 = arg_133_0:MesureText(("%s: %d%s |"):format(arg_133_0:GetCoreLocalte(), arg_133_0.nLastUpdateCPULoad, "%"), slot_133_3_0)

			arg_133_0:Texture(arg_133_0.arrIcons.Desktop, draw.vec2(slot_133_13_0.x + slot_133_24_0 + slot_133_25_2.x + slot_133_21_0, slot_133_13_0.y + slot_133_18_0.y - slot_133_25_2.y / 2 - 2), slot_133_25_2, draw.color(255, 255, 255, 255))

			slot_133_24_0 = slot_133_24_0 + slot_133_26_1.x + slot_133_22_0.x
		end

		if arg_133_0:ContainUI(slot_133_8_0, 5) then
			slot_133_25_1 = arg_133_0.arrIcons.Fan:get_size()
			slot_133_26_0 = arg_133_0:MesureText(("%s: %d%s |"):format(arg_133_0:GetGraphicsLocalte(), arg_133_0.nLastUpdateGPULoad, "%"), slot_133_3_0)

			arg_133_0:Texture(arg_133_0.arrIcons.Fan, draw.vec2(slot_133_13_0.x + slot_133_24_0 + slot_133_25_1.x + slot_133_21_0, slot_133_13_0.y + slot_133_18_0.y - slot_133_25_1.y / 2 - 2), slot_133_25_1, draw.color(255, 255, 255, 255))

			slot_133_24_0 = slot_133_24_0 + slot_133_26_0.x + slot_133_22_0.x
		end

		if arg_133_0:ContainUI(slot_133_8_0, 6) and game.engine:in_game() then
			slot_133_25_0 = arg_133_0.arrIcons.Wifi:get_size()

			arg_133_0:Texture(arg_133_0.arrIcons.Wifi, draw.vec2(slot_133_13_0.x + slot_133_24_0 + slot_133_25_0.x + slot_133_21_0, slot_133_13_0.y + slot_133_18_0.y - slot_133_25_0.y / 2 - 2), slot_133_25_0, draw.color(255, 255, 255, 255))
		end
	end

	slot_133_10_0:Update(slot_133_18_0)
	arg_133_0:PopClipRect()
	arg_133_0:PopAlpha()
end

function slot_0_0_0.__index.Hotkeys(arg_134_0)
	slot_134_1_0 = arg_134_0:ContainUI(arg_134_0.arrElements.pUIList:get_value():get():get_raw(), 2)
	slot_134_2_0 = arg_134_0:CreateStaticTargetAnimation(0, slot_134_1_0 and 1 or 0, arg_134_0.flAnimation, "Hotkeys")

	if slot_134_2_0 <= 0 then
		return
	end

	slot_134_3_0 = 120
	slot_134_4_0 = 0
	slot_134_5_0 = -1
	slot_134_6_0 = 0
	slot_134_7_0 = arg_134_0:GetGlobalFont()
	slot_134_8_0 = arg_134_0.arrIcons.Keyboard
	slot_134_9_0 = arg_134_0:MesureText(("[%s]"):format(arg_134_0:GetToogleStateText(true)), slot_134_7_0)
	slot_134_10_0 = arg_134_0:MesureText(("[%s]"):format(arg_134_0:GetToogleStateText(false)), slot_134_7_0)

	if not arg_134_0.arrHotkeysData.Menu then
		arg_134_0.arrHotkeysData.Menu = {}
	end

	arg_134_0.arrHotkeysData.Menu.bHotkey = gui.is_visible()
	arg_134_0.arrHotkeysData.Menu.flAlpha = arg_134_0:CreateStaticTargetAnimation(0, arg_134_0.arrHotkeysData.Menu.bHotkey and 1 or 0, arg_134_0.flAnimation, "Menu Hotkey")

	if arg_134_0.arrHotkeysData.Menu.flAlpha > 0 then
		slot_134_4_0 = arg_134_0.arrHotkeysData.Menu.flAlpha
		slot_134_6_0 = slot_134_6_0 + slot_134_4_0 * 16
	end

	slot_134_11_0 = entities.get_local_pawn()

	if slot_134_11_0 and slot_134_11_0:is_alive() then
		slot_134_12_1 = slot_134_11_0:get_active_weapon()

		if slot_134_12_1 then
			slot_134_5_0 = slot_134_12_1:get_id()
		end
	end

	slot_134_12_0 = game.engine:in_game()

	for iter_134_0, iter_134_1 in pairs(arg_134_0.arrHotkeysReferences) do
		if slot_134_5_0 >= 0 and type(iter_134_1) == "string" then
			iter_134_1 = arg_134_0:GetWeaponCategoryElement(slot_134_5_0, iter_134_1)
		end

		if type(iter_134_1) ~= "userdata" then
			-- block empty
		else
			if not arg_134_0.arrHotkeysData[iter_134_0] then
				arg_134_0.arrHotkeysData[iter_134_0] = {
					bHotkey = false,
					flAlpha = 0,
					players = nil,
					szName = iter_134_0
				}
			end

			arg_134_0.arrHotkeysData[iter_134_0].bHotkey = slot_134_12_0 and iter_134_1:get_hotkey_state() and not arg_134_0.arrHotkeysData.Menu.bHotkey
			arg_134_0.arrHotkeysData[iter_134_0].flAlpha = arg_134_0:CreateStaticTargetAnimation(0, arg_134_0.arrHotkeysData[iter_134_0].bHotkey and slot_134_2_0 or 0, arg_134_0.flAnimation, ("Hotkey: %s"):format(iter_134_0))

			if arg_134_0.arrHotkeysData[iter_134_0].flAlpha > 0 then
				slot_134_18_1 = arg_134_0:MesureText(iter_134_0, slot_134_7_0)
				slot_134_4_0 = math.max(slot_134_4_0, arg_134_0.arrHotkeysData[iter_134_0].flAlpha)
				slot_134_6_0 = slot_134_6_0 + arg_134_0.arrHotkeysData[iter_134_0].flAlpha * 16
				slot_134_19_1 = slot_134_18_1.x + (arg_134_0.arrHotkeysData[iter_134_0].bHotkey and slot_134_9_0.x or slot_134_10_0.x) + 25
				slot_134_3_0 = math.max(slot_134_3_0, slot_134_19_1)
			end
		end
	end

	slot_134_13_0 = arg_134_0:CreateRectMoveable("Hotkeys", draw.vec2(arg_134_0.vecScreenSize.x / 2 - 150, 250))
	slot_134_14_0 = draw.vec2(arg_134_0:CreateLinerAnimation(slot_134_3_0, slot_134_3_0, arg_134_0.flAnimation, "Hotkeys Width"), 20)

	if slot_134_4_0 <= 0 then
		return
	end

	slot_134_15_0 = 0
	slot_134_16_0 = slot_134_13_0:Get()
	slot_134_17_0 = slot_134_8_0:get_size()
	slot_134_18_0 = arg_134_0:GetHotkeysTitleText()

	arg_134_0:PushAlpha(slot_134_4_0 * slot_134_2_0)

	slot_134_19_0 = arg_134_0:MesureText(slot_134_18_0, slot_134_7_0)
	slot_134_20_0 = arg_134_0.arrElements.pBlurColor:get_value():get()
	slot_134_21_0 = arg_134_0.arrElements.pBlurStrength:get_value():get()
	slot_134_22_0 = arg_134_0.arrElements.pShadowThickness:get_value():get()
	slot_134_23_0 = arg_134_0.arrElements.pRainbowColor:get_value():get() and arg_134_0:Rainbow(arg_134_0.arrElements.pRainbowSpeed:get_value():get()) or arg_134_0.arrElements.pAccentColor:get_value():get()
	slot_134_24_0 = arg_134_0:CreateStaticTargetAnimation(0, slot_134_13_0:IsCarry() and 0.75 or slot_134_13_0:InCursor() and 0.5 or 0, arg_134_0.flCarryAnimation, "Hotkeys Carry")
	slot_134_25_0 = draw.color(slot_134_24_0 * 255, slot_134_24_0 * 255, slot_134_24_0 * 255, 125)

	arg_134_0:RoundingBoard(slot_134_16_0, draw.vec2(slot_134_16_0.x + slot_134_14_0.x, slot_134_16_0.y + slot_134_14_0.y), slot_134_23_0, slot_134_25_0, slot_134_20_0, slot_134_22_0, slot_134_21_0, arg_134_0.arrElements.pThickness:get_value():get(), arg_134_0.arrElements.pRounding:get_value():get(), arg_134_0.arrElements.pDrawSide:get_value():get())
	arg_134_0:Texture(slot_134_8_0, draw.vec2(slot_134_16_0.x + slot_134_14_0.x / 2 - slot_134_19_0.x / 2 - slot_134_17_0.x / 2, slot_134_16_0.y + slot_134_14_0.y - slot_134_17_0.y / 2 - 1), slot_134_8_0:get_size(), draw.color(255, 255, 255, 255))
	arg_134_0:Text(draw.vec2(slot_134_16_0.x + slot_134_14_0.x / 2 - slot_134_19_0.x / 2 + 6, slot_134_16_0.y + arg_134_0.nCompensateHeight + arg_134_0:GetHeightOffset(slot_134_18_0) + 4), slot_134_18_0, draw.color(255, 255, 255, 255), slot_134_7_0)

	if slot_134_6_0 > 0 then
		arg_134_0:Blur(draw.vec2(slot_134_16_0.x, slot_134_16_0.y + 23), draw.vec2(slot_134_16_0.x + slot_134_14_0.x, slot_134_16_0.y + 28 + slot_134_6_0), slot_134_21_0, arg_134_0.arrElements.pTextgroundBlurColor:get_value():get())
	end

	for iter_134_2, iter_134_3 in pairs(arg_134_0.arrHotkeysData) do
		if iter_134_3.flAlpha > 0 then
			slot_134_31_0 = iter_134_3.flAlpha * 16
			slot_134_32_0 = iter_134_3.bHotkey and slot_134_9_0 or slot_134_10_0
			slot_134_33_0 = draw.vec2(slot_134_16_0.x, slot_134_16_0.y + 26 + slot_134_15_0)
			slot_134_34_0 = draw.vec2(slot_134_33_0.x + slot_134_14_0.x, slot_134_33_0.y + slot_134_31_0)
			slot_134_35_0 = arg_134_0:GetToogleStateText(iter_134_3.bHotkey)

			arg_134_0:PushClipRect(slot_134_33_0, slot_134_34_0)
			arg_134_0:Text(draw.vec2(slot_134_16_0.x + 4, slot_134_16_0.y + arg_134_0.nCompensateHeight + 28 + slot_134_15_0 + arg_134_0:GetHeightOffset(iter_134_3.szName)), iter_134_3.szName, draw.color(255, 255, 255, 255 * iter_134_3.flAlpha), slot_134_7_0)
			arg_134_0:Text(draw.vec2(slot_134_16_0.x + slot_134_14_0.x - slot_134_32_0.x - 3, slot_134_16_0.y + arg_134_0.nCompensateHeight + 28 + slot_134_15_0 + arg_134_0:GetHeightOffset(slot_134_35_0)), ("[%s]"):format(slot_134_35_0), draw.color(255, 255, 255, 255 * iter_134_3.flAlpha), slot_134_7_0)

			slot_134_15_0 = slot_134_15_0 + slot_134_31_0

			arg_134_0:PopClipRect()
		end
	end

	arg_134_0:PopAlpha()
	slot_134_13_0:Update(slot_134_14_0)
end

function slot_0_0_0.__index.Spectators(arg_135_0)
	slot_135_1_0 = arg_135_0:ContainUI(arg_135_0.arrElements.pUIList:get_value():get():get_raw(), 3)
	slot_135_2_0 = arg_135_0:CreateStaticTargetAnimation(0, slot_135_1_0 and 1 or 0, arg_135_0.flAnimation, "Spectators")

	if slot_135_2_0 <= 0 then
		return
	end

	slot_135_3_0 = 0
	slot_135_4_0 = 120
	slot_135_5_0 = 0
	slot_135_6_0 = 0
	slot_135_7_0 = {}
	slot_135_8_0 = arg_135_0.arrIcons.Eye
	slot_135_9_0 = arg_135_0:GetGlobalFont()
	slot_135_10_0 = entities.get_local_controller()
	slot_135_11_0 = arg_135_0.arrElements.pSpectatorsOptions:get_value():get():get_raw()

	if not arg_135_0.arrSpectatorsData.Preview then
		arg_135_0.arrSpectatorsData.Preview = {
			szName = "PREVIEW",
			flAlpha = 0,
			pAvatar = arg_135_0:GetSteamAvatar(arg_135_0.pSteamID.nSteam64)
		}
	end

	arg_135_0.arrSpectatorsData.Preview.flAlpha = arg_135_0:CreateStaticTargetAnimation(0, gui.is_visible() and 1 or 0, arg_135_0.flAnimation, "Spectators Hotkey")

	if arg_135_0.arrSpectatorsData.Preview.flAlpha > 0 then
		slot_135_5_0 = arg_135_0.arrSpectatorsData.Preview.flAlpha
		slot_135_6_0 = slot_135_6_0 + slot_135_5_0 * 17
	elseif game.engine:in_game() then
		slot_135_12_1 = {}
		slot_135_13_1 = slot_135_10_0:get_pawn()

		if not slot_135_13_1:is_alive() then
			slot_135_14_1 = slot_135_10_0:get_observer_mode()
			slot_135_15_1 = slot_135_10_0:get_observer_target()

			if slot_135_15_1 and slot_135_14_1 ~= observer_mode_t.none then
				slot_135_13_1 = slot_135_15_1
			end
		end

		entities.controllers:for_each(function(arg_136_0)
			local var_136_0 = arg_136_0.entity

			if var_136_0 == slot_135_10_0 then
				return
			end

			table.insert(slot_135_12_1, var_136_0)
		end)

		for iter_135_0, iter_135_1 in pairs(slot_135_12_1) do
			slot_135_19_2 = arg_135_0:GetSteamID(iter_135_1)

			if not slot_135_19_2 then
				-- block empty
			else
				table.insert(slot_135_7_0, ("%s"):format(slot_135_19_2))
			end
		end

		for iter_135_2, iter_135_3 in pairs(slot_135_12_1) do
			slot_135_19_1 = iter_135_3:get_pawn()
			slot_135_20_1 = arg_135_0:GetSteamID(iter_135_3)
			slot_135_21_1 = ("%s"):format(arg_135_0:GetEntIndex(iter_135_3))

			if not slot_135_20_1 or not slot_135_19_1 then
				if arg_135_0.arrSpectatorsData[slot_135_21_1] then
					arg_135_0.arrSpectatorsData[slot_135_21_1] = nil
				end
			else
				slot_135_22_1 = iter_135_3:get_name()
				slot_135_23_1 = ("%s%s"):format(slot_135_20_1 <= 0 and "[Bot] - " or "", slot_135_22_1)

				if not arg_135_0.arrSpectatorsData[slot_135_21_1] then
					arg_135_0.arrSpectatorsData[slot_135_21_1] = {
						flAlpha = 0,
						[0] = nil,
						szName = slot_135_23_1,
						nSteam64 = slot_135_20_1,
						bIsBot = slot_135_20_1 <= 0,
						pAvatar = slot_135_20_1 <= 0 and arg_135_0:GetSteamAvatar(arg_135_0.pSteamID.nSteam64) or arg_135_0:GetSteamAvatarFromPlayer(iter_135_3)
					}

					if not arg_135_0.arrSpectatorsData[slot_135_21_1].pAvatar then
						arg_135_0.arrSpectatorsData[slot_135_21_1].pAvatar = arg_135_0:GetSteamAvatar(arg_135_0.pSteamID.nSteam64)
					end
				end

				arg_135_0.arrSpectatorsData[slot_135_21_1].szName = slot_135_23_1
				slot_135_24_1 = iter_135_3:get_observer_mode()
				slot_135_25_1 = iter_135_3:get_observer_target()
				slot_135_26_1 = not slot_135_19_1:is_alive() and slot_135_13_1 and slot_135_25_1 == slot_135_13_1 and slot_135_24_1 ~= observer_mode_t.none
				arg_135_0.arrSpectatorsData[slot_135_21_1].flAlpha = arg_135_0:CreateStaticTargetAnimation(0, slot_135_26_1 and slot_135_2_0 or 0, arg_135_0.flAnimation, ("Observer: %s"):format(slot_135_21_1))

				if arg_135_0.arrSpectatorsData[slot_135_21_1].pAvatar and arg_135_0.arrSpectatorsData[slot_135_21_1].flAlpha > 0 then
					slot_135_27_0 = arg_135_0:MesureText(slot_135_23_1, slot_135_9_0)
					slot_135_5_0 = math.max(slot_135_5_0, arg_135_0.arrSpectatorsData[slot_135_21_1].flAlpha)
					slot_135_6_0 = slot_135_6_0 + arg_135_0.arrSpectatorsData[slot_135_21_1].flAlpha * 17
					slot_135_4_0 = math.max(slot_135_4_0, slot_135_27_0.x + 35)
				end
			end
		end
	end

	slot_135_12_0 = arg_135_0:CreateRectMoveable("Spectators", draw.vec2(arg_135_0.vecScreenSize.x / 2, 250))

	if slot_135_5_0 <= 0 then
		return
	end

	slot_135_13_0 = slot_135_12_0:Get()
	slot_135_14_0 = slot_135_8_0:get_size()
	slot_135_15_0 = arg_135_0:GetSpectatorsTitleText()
	slot_135_16_0 = draw.vec2(arg_135_0:CreateLinerAnimation(slot_135_4_0, slot_135_4_0, arg_135_0.flAnimation, "Spectators Width"), 20)

	arg_135_0:PushAlpha(slot_135_5_0 * slot_135_2_0)

	slot_135_17_0 = arg_135_0:MesureText(slot_135_15_0, slot_135_9_0)
	slot_135_18_0 = arg_135_0.arrElements.pBlurColor:get_value():get()
	slot_135_19_0 = arg_135_0.arrElements.pBlurStrength:get_value():get()
	slot_135_20_0 = arg_135_0.arrElements.pShadowThickness:get_value():get()
	slot_135_21_0 = arg_135_0.arrElements.pRainbowColor:get_value():get() and arg_135_0:Rainbow(arg_135_0.arrElements.pRainbowSpeed:get_value():get()) or arg_135_0.arrElements.pAccentColor:get_value():get()
	slot_135_22_0 = arg_135_0:CreateStaticTargetAnimation(0, slot_135_12_0:IsCarry() and 0.75 or slot_135_12_0:InCursor() and 0.5 or 0, arg_135_0.flCarryAnimation, "Spectators Carry")
	slot_135_23_0 = draw.color(slot_135_22_0 * 255, slot_135_22_0 * 255, slot_135_22_0 * 255, 125)

	arg_135_0:RoundingBoard(slot_135_13_0, draw.vec2(slot_135_13_0.x + slot_135_16_0.x, slot_135_13_0.y + slot_135_16_0.y), slot_135_21_0, slot_135_23_0, slot_135_18_0, slot_135_20_0, slot_135_19_0, arg_135_0.arrElements.pThickness:get_value():get(), arg_135_0.arrElements.pRounding:get_value():get(), arg_135_0.arrElements.pDrawSide:get_value():get())
	arg_135_0:Texture(slot_135_8_0, draw.vec2(slot_135_13_0.x + slot_135_16_0.x / 2 - slot_135_17_0.x / 2 - slot_135_14_0.x / 2, slot_135_13_0.y + slot_135_16_0.y - slot_135_14_0.y / 2 - 1), slot_135_8_0:get_size(), draw.color(255, 255, 255, 255))
	arg_135_0:Text(draw.vec2(slot_135_13_0.x + slot_135_16_0.x / 2 - slot_135_17_0.x / 2 + 4, slot_135_13_0.y + arg_135_0.nCompensateHeight + arg_135_0:GetHeightOffset(slot_135_15_0) + 4), slot_135_15_0, draw.color(255, 255, 255, 255), slot_135_9_0)

	if slot_135_6_0 > 0 then
		arg_135_0:Blur(draw.vec2(slot_135_13_0.x, slot_135_13_0.y + 23), draw.vec2(slot_135_13_0.x + slot_135_16_0.x, slot_135_13_0.y + 26 + slot_135_6_0), slot_135_19_0, arg_135_0.arrElements.pTextgroundBlurColor:get_value():get())
	end

	slot_135_24_0 = draw.vec2(14, 14)
	slot_135_25_0 = arg_135_0:ContainUI(slot_135_11_0, 1)
	slot_135_26_0 = arg_135_0:ContainUI(slot_135_11_0, 2)

	for iter_135_4, iter_135_5 in pairs(arg_135_0.arrSpectatorsData) do
		if iter_135_4 ~= "Preview" and not arg_135_0:Contains(slot_135_7_0, ("%s"):format(iter_135_5.nSteam64)) then
			arg_135_0.arrSpectatorsData[iter_135_4].flAlpha = arg_135_0:CreateStaticTargetAnimation(0, 0, arg_135_0.flAnimation, ("Observer: %s"):format(iter_135_4))

			if arg_135_0.arrSpectatorsData[iter_135_4].flAlpha <= 0 then
				arg_135_0.arrSpectatorsData[iter_135_4] = nil

				goto label_135_0
			end
		end

		if iter_135_5.pAvatar and iter_135_5.flAlpha > 0 then
			slot_135_32_0 = iter_135_5.flAlpha * 17
			slot_135_33_0 = arg_135_0:FixupCharacters(iter_135_5.szName)
			slot_135_34_0 = arg_135_0:GetHeightOffset(iter_135_5.szName)
			slot_135_35_0 = draw.vec2(slot_135_13_0.x, slot_135_13_0.y + 26 + slot_135_3_0)
			slot_135_36_0 = draw.vec2(slot_135_35_0.x + slot_135_16_0.x, slot_135_35_0.y + slot_135_32_0)

			arg_135_0:PushClipRect(slot_135_35_0, slot_135_36_0)

			if slot_135_26_0 and not iter_135_5.bIsBot then
				arg_135_0:Text(draw.vec2(slot_135_13_0.x + (slot_135_25_0 and 21 or 4), slot_135_13_0.y + 28 + arg_135_0.nCompensateHeight + slot_135_3_0 + slot_135_34_0), slot_135_33_0, draw.color(255, 255, 255, 255 * iter_135_5.flAlpha), slot_135_9_0)
				arg_135_0:CircleTexture(iter_135_5.pAvatar, draw.vec2(slot_135_13_0.x + (slot_135_25_0 and 10 or slot_135_16_0.x - slot_135_24_0.x / 2 - 4), slot_135_13_0.y + 33 + slot_135_3_0), slot_135_24_0.x / 2, draw.color(255, 255, 255, 255 * iter_135_5.flAlpha))
			else
				arg_135_0:Text(draw.vec2(slot_135_13_0.x + (slot_135_25_0 and 24 or 4), slot_135_13_0.y + 28 + arg_135_0.nCompensateHeight + slot_135_3_0 + slot_135_34_0), slot_135_33_0, draw.color(255, 255, 255, 255 * iter_135_5.flAlpha), slot_135_9_0)
				arg_135_0:Texture(iter_135_5.pAvatar, draw.vec2(slot_135_13_0.x + (slot_135_25_0 and 11 or slot_135_16_0.x - slot_135_24_0.x / 2 - 3), slot_135_13_0.y + 33 + slot_135_3_0), slot_135_24_0, draw.color(255, 255, 255, 255 * iter_135_5.flAlpha))
			end

			slot_135_3_0 = slot_135_3_0 + slot_135_32_0

			arg_135_0:PopClipRect()
		end

		::label_135_0::
	end

	arg_135_0:PopAlpha()
	slot_135_12_0:Update(slot_135_16_0)
end

function slot_0_0_0.__index.HandleRelease(arg_137_0)
	if arg_137_0.bADLControlCreated then
		arg_137_0.bADLControlCreated = false

		arg_137_0:CallModuleExport("atiadlxx.dll", "ADL_Main_Control_Destroy", "int(__stdcall*)()")
	end

	arg_137_0:FreeAllocateMemorys()
end

function slot_0_0_0.__index.Present(arg_138_0)
	arg_138_0:Command()
	arg_138_0:Hotkeys()
	arg_138_0:WaterMark()
	arg_138_0:Spectators()
	arg_138_0:ResetCommand()
end

function slot_0_0_0.__index.Input(arg_139_0, arg_139_1, arg_139_2, arg_139_3)
	arg_139_0:ProcessInput(arg_139_1, arg_139_2)
end

function slot_0_0_0.__index.Destroy(arg_140_0)
	arg_140_0:HandleRelease()
end

function slot_0_0_0.__index.Setup(arg_141_0)
	arg_141_0:CreateElements()
	arg_141_0:HandleElements()
	arg_141_0:CreateResources()
	arg_141_0:LoadTitleStorage()
	arg_141_0:HandleUpdateFont()
	arg_141_0:CreateGameInterface()
	arg_141_0:UpdatePreviewLocalize()
	arg_141_0:InitializePhysicalCPU()
	arg_141_0:InitializePhysicalGPU()
	events.input:add(arg_141_0:BindArgument(arg_141_0.Input))
	arg_141_0:PushUnloadCallBack(arg_141_0:BindArgument(arg_141_0.Destroy))
	events.present_queue:add(arg_141_0:BindArgument(arg_141_0.Present))
	arg_141_0.arrElements.pUIList:add_callback(arg_141_0:BindArgument(arg_141_0.HandleElements))
	arg_141_0.arrElements.pFonts:add_callback(arg_141_0:BindArgument(arg_141_0.HandleUpdateFont))
	arg_141_0.arrElements.pRainbowColor:add_callback(arg_141_0:BindArgument(arg_141_0.HandleElements))
	arg_141_0.arrElements.pWatermarkTitle:add_callback(arg_141_0:BindArgument(arg_141_0.SaveTitleStorage))
	arg_141_0.arrElements.pLocalizeAll:add_callback(arg_141_0:BindArgument(arg_141_0.UpdatePreviewLocalize))
end

slot_0_0_0:Setup()
