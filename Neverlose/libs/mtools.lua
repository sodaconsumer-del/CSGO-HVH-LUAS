local reloaded_0_0 = require("neverlose/vmt_hook")
local reloaded_0_1

pcall(function()
	ffi.cdef("        bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n        void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n        bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    ")
end)
pcall(function()
	ffi.cdef("        typedef uint16_t WORD;\n        typedef struct _SYSTEMTIME {\n            WORD wYear;\n            WORD wMonth;\n            WORD wDayOfWeek;\n            WORD wDay;\n            WORD wHour;\n            WORD wMinute;\n            WORD wSecond;\n            WORD wMilliseconds;\n        } SYSTEMTIME, *PSYSTEMTIME, *LPSYSTEMTIME;\n        void GetLocalTime(LPSYSTEMTIME lpSystemTime);\n    ")
end)
pcall(function()
	local reloaded_3_0 = utils.opcode_scan("engine.dll", "FF E1")
	local reloaded_3_1 = ffi.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, const char*)", reloaded_3_0)
	local reloaded_3_2 = ffi.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, uint32_t, const char*)", reloaded_3_0)
	local reloaded_3_3 = ffi.cast("uint32_t**", ffi.cast("uint32_t", utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? 85 C0 74 0B")) + 2)[0][0]
	local reloaded_3_4 = ffi.cast("uint32_t**", ffi.cast("uint32_t", utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? A3 ? ? ? ? EB 05")) + 2)[0][0]

	function BindExports(arg_4_0, arg_4_1, arg_4_2)
		local reloaded_4_0 = ffi.typeof(arg_4_2)

		return function(...)
			return ffi.cast(reloaded_4_0, reloaded_3_0)(reloaded_3_2(reloaded_3_4, 0, reloaded_3_1(reloaded_3_3, 0, arg_4_0), arg_4_1), 0, ...)
		end
	end

	local reloaded_3_5 = BindExports("user32.dll", "EnumDisplaySettingsA", "int(__fastcall*)(unsigned int, unsigned int, unsigned int, unsigned long, void*)")

	reloaded_0_1 = ffi.new("struct { char pad_0[120]; unsigned long dmDisplayFrequency; char pad_2[32]; }[1]")

	reloaded_3_5(0, 4294967295, reloaded_0_1[0])
end)
pcall(function()
	ffi.cdef("        struct vec3_t { \n            float x, y, z;\n        };\n        typedef struct {\n            float x;\n            float y;\n            float z;\n        } Vector;\n        typedef void(__fastcall*FX_ElectricSparkFn)(const Vector*,int,int,const Vector*);\n    ")
end)
pcall(function()
	ffi.cdef("        typedef struct {\n            float x;\n            float y;\n            float z;\n        } vec3_struct;\n        typedef void*(__thiscall* c_entity_list_get_client_entity_t)(void*, int);\n        typedef void*(__thiscall* c_entity_list_get_client_entity_from_handle_t)(void*, uintptr_t);\n        typedef int(__thiscall* c_weapon_get_muzzle_attachLPnt_index_first_person_t)(void*, void*);\n        typedef int(__thiscall* c_weapon_get_muzzle_attachLPnt_index_third_person_t)(void*);\n        typedef bool(__thiscall* c_entity_get_attachLPnt_t)(void*, int, vec3_struct*);\n    ")
end)
pcall(function()
	ffi.cdef("        short GetAsyncKeyState(int vKey);\n    ")
end)
pcall(function()
	ffi.cdef("        void*GetModuleHandleA(const char*);\n        void*GetProcAddress(void*,const char*);\n        bool TerminateThread(void*,unsigned long);\n        bool GetExitCodeThread(void*,unsigned long*);\n\n        typedef struct {\n            void* flink;\n            void* blink;\n        } list_entry_t;\n\n        typedef struct {\n            unsigned short type;\n            unsigned short creator_back_trace_index;\n            void* critical_section;\n            list_entry_t process_lock_list;\n            unsigned long entry_count;\n            unsigned long contention_count;\n            unsigned long flags;\n            unsigned short creator_back_trace_index_high;\n            unsigned short spare_word;\n        } critical_section_debug_t;\n\n        typedef struct {\n            critical_section_debug_t debug_info;\n            long lock_count;\n            long recursion_count;\n            int owning_thread;\n            void* lock_semaphore;\n            unsigned long spin_count;\n        } critical_section_t;\n\n        void InitializeCriticalSection(critical_section_t*);\n        void DeleteCriticalSection(critical_section_t*);\n        void EnterCriticalSection(critical_section_t*);\n        void LeaveCriticalSection(critical_section_t*);\n    ")
end)
pcall(function()
	ffi.cdef("        bool DeleteFileA(const char* lpFileName);\n        #pragma pack(push)\n        #pragma pack(1)\n            struct WIN32_FIND_DATAA {\n                uint32_t dwFileAttributes;\n                uint64_t ftCreationTime;\n                uint64_t ftLastAccessTime;\n                uint64_t ftLastWriteTime;\n                struct {\n                    union {\n                        uint64_t packed;\n                        struct {\n                            uint32_t high;\n                            uint32_t low;\n                        };\n                    };\n                } nFileSize;\n                uint32_t dwReserved[2];\n                char cFileName[260];\n                char cAlternateFileName[14];\n            };\n        #pragma pack(pop)\n            void* FindFirstFileA(const char* pattern, struct WIN32_FIND_DATAA* fd);\n            bool FindNextFileA(void* ff, struct WIN32_FIND_DATAA* fd);\n            bool FindClose(void* ff);\n    ")
end)
pcall(function()
	ffi.cdef("        typedef void*(__thiscall* get_client_entity_t)(void*, int);\n        typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n        typedef struct {\n            char pad20[24];\n            uint32_t m_nSequence;\n            float m_flPrevCycle;\n            float m_flWeight;\n            char pad20[8];\n            float m_flCycle;\n            void *m_pOwner;\n            char pad_0038[ 4 ];\n        } animation_layer_t_12389890123890321890089123;\n\n        typedef struct {\n            float x;\n            float y;\n            float z;\n        } Vector_t;\n    \n        typedef struct {\n            char     pad0[0x60];\n            void*    pEntity;\n            void*    pActiveWeapon;\n            void*    pLastActiveWeapon;\n            float    flLastUpdateTime;\n            int      iLastUpdateFrame;\n            float    flLastUpdateIncrement;\n            float    flEyeYaw;\n            float    flEyePitch;\n            float    flGoalFeetYaw;\n            float    flLastFeetYaw;\n            float    flMoveYaw;\n            float    flLastMoveYaw;\n            float    flLeanAmount;\n            char     pad1[0x4];\n            float    flFeetCycle;\n            float    flMoveWeight;\n            float    flMoveWeightSmoothed;\n            float    flDuckAmount;\n            float    flHitGroundCycle;\n            float    flRecrouchWeight;\n            Vector_t vecOrigin;\n            Vector_t vecLastOrigin;\n            Vector_t vecVelocity;\n            Vector_t vecVelocityNormalized;\n            Vector_t vecVelocityNormalizedNonZero;\n            float    flVelocityLenght2D;\n            float    flJumpFallVelocity;\n            float    flSpeedNormalized;\n            float    flRunningSpeed;\n            float    flDuckingSpeed;\n            float    flDurationMoving;\n            float    flDurationStill;\n            bool     bOnGround;\n            bool     bHitGroundAnimation;\n            char     pad2[0x2];\n            float    flNextLowerBodyYawUpdateTime;\n            float    flDurationInAir;\n            float    flLeftGroundHeight;\n            float    flHitGroundWeight;\n            float    flWalkToRunTransition;\n            char     pad3[0x4];\n            float    flAffectedFraction;\n            char     pad4[0x208];\n            float    flMinBodyYaw;\n            float    flMaxBodyYaw;\n            float    flMinPitch;\n            float    flMaxPitch;\n            int      iAnimsetVersion;\n        } CCSGOPlayerAnimationState_534535_t;\n    ")
end)

local reloaded_0_2 = {
	VTable_Bind = function(arg_12_0, arg_12_1, arg_12_2)
		local reloaded_12_0 = ffi.cast("void***", arg_12_0)
		local reloaded_12_1 = ffi.typeof(arg_12_1)

		return function(...)
			return ffi.cast(reloaded_12_1, reloaded_12_0[0][arg_12_2])(reloaded_12_0, ...)
		end
	end,
	VTable_Thunk = function(arg_14_0, arg_14_1)
		local reloaded_14_0 = ffi.typeof(arg_14_0)

		return function(arg_15_0, ...)
			local reloaded_15_0 = ffi.cast("void***", arg_15_0)

			return ffi.cast(reloaded_14_0, reloaded_15_0[0][arg_14_1])(reloaded_15_0, ...)
		end
	end,
	VTable_Arg = function(arg_16_0, arg_16_1)
		return function(...)
			return arg_16_0(arg_16_1, ...)
		end
	end
}
local reloaded_0_3 = {
	Vec3 = ffi.typeof("struct vec3_t"),
	Null = ffi.cast("const char*", 0)
}
local reloaded_0_4 = utils.create_interface("client.dll", "IEffects001")
local reloaded_0_5 = reloaded_0_2.VTable_Bind(reloaded_0_4, "void(__thiscall*)(void*, const struct vec3_t&, const struct vec3_t&, bool)", 7)
local reloaded_0_6 = utils.create_interface("materialsystem.dll", "VMaterialSystem080")
local reloaded_0_7 = reloaded_0_2.VTable_Bind(reloaded_0_6, "void*(__thiscall*)(void*, const char*, const char*, bool, const char*)", 84)
local reloaded_0_8 = reloaded_0_2.VTable_Thunk("void(__thiscall*)(void*, float)", 27)
local reloaded_0_9 = reloaded_0_2.VTable_Thunk("void(__thiscall*)(void*, float, float, float)", 28)
local reloaded_0_10 = {
	ST1 = 468,
	Index = 84,
	RD3 = 469
}
local reloaded_0_11 = ffi.typeof("uintptr_t**")
local reloaded_0_12 = ffi.cast(reloaded_0_11, utils.create_interface("client.dll", "VClientEntityList003"))
local reloaded_0_13 = reloaded_0_2.VTable_Arg(ffi.cast("c_entity_list_get_client_entity_t", reloaded_0_12[0][3]), reloaded_0_12)
local reloaded_0_14 = ffi.cast("void*(__cdecl*)(intptr_t, intptr_t, size_t)", ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("tier0.dll"), "CreateSimpleThread"))
local reloaded_0_15 = ffi.cast("bool(__cdecl*)(void*)", ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("tier0.dll"), "ReleaseThreadHandle"))
local reloaded_0_16 = ffi.typeof("struct WIN32_FIND_DATAA")
local reloaded_0_17 = ffi.cast("void*", -1)
local reloaded_0_18 = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"))
local reloaded_0_19 = reloaded_0_2.VTable_Arg(ffi.cast("get_client_entity_t", reloaded_0_18[0][3]), reloaded_0_18)
local reloaded_0_20 = {
	FPSO = 0,
	Screen = render.screen_size(),
	IsKeyDown = function(arg_18_0)
		return common.is_button_down(arg_18_0)
	end,
	UrlMon = ffi.load("UrlMon"),
	WinInet = ffi.load("WinInet"),
	HZ = reloaded_0_1 and reloaded_0_1[0].dmDisplayFrequency or 0,
	Panorama = panorama.MyPersonaAPI,
	Animation = {
		Speed = 7.5,
		List = {},
		Easing = {},
		Clamp = function(arg_19_0, arg_19_1, arg_19_2)
			return arg_19_2 < arg_19_0 and arg_19_2 or arg_19_0 < arg_19_1 and arg_19_1 or arg_19_0
		end
	},
	AntiAims = {
		Condition = {
			Crouch = false,
			["Slow Walk"] = false,
			Walk = false,
			Stand = false,
			Priority = "S",
			Delay = 0,
			Velocity = 0,
			["No Exploits"] = false,
			["Air Crouch"] = false,
			Air = false
		},
		Other = {
			["Air Delay"] = 0,
			Difference = 0
		}
	},
	Tick = {
		Num = 1,
		Check = false
	},
	AnimLayers = {
		Reset = false,
		Sequence = 7
	},
	Ways = {}
}
local reloaded_0_21 = {
	AntiShot = false,
	Active = "",
	Inventory = {}
}
local reloaded_0_22 = {
	Threads = {},
	Criticals = {}
}

reloaded_0_21.__index = reloaded_0_21

local reloaded_0_23 = {
	Trim = function(arg_20_0)
		return arg_20_0:match("^%s*(.*)"):match("(.-)%s*$")
	end,
	FirstUpper = function(arg_21_0)
		return (arg_21_0:gsub("^%l", string.upper))
	end,
	FirstLower = function(arg_22_0)
		return (arg_22_0:gsub("^%l", string.lower))
	end,
	Cut = function(arg_23_0, arg_23_1)
		if arg_23_1 > 0 then
			return (arg_23_0:sub(arg_23_1 + 1))
		else
			local reloaded_23_0 = string.reverse(arg_23_0):sub(-arg_23_1 + 1)

			return (string.reverse(reloaded_23_0))
		end
	end
}
local reloaded_0_24 = {
	Round = function(arg_24_0)
		if arg_24_0 - arg_24_0 % 0.1 - (arg_24_0 - arg_24_0 % 1) < 0.5 then
			arg_24_0 = arg_24_0 - arg_24_0 % 1
		else
			arg_24_0 = arg_24_0 - arg_24_0 % 1 + 1
		end

		return arg_24_0
	end,
	Fixed = function(arg_25_0, arg_25_1)
		arg_25_0 = arg_25_0 or 0.123 or arg_25_0
		arg_25_1 = arg_25_1 or 1 or arg_25_1

		return tonumber(string.sub(arg_25_0, 1, string.find(arg_25_0, ".") + (arg_25_1 + 1))) or arg_25_0
	end
}
local reloaded_0_25 = {
	GetAUIList = function(arg_26_0)
		local reloaded_26_0 = {}

		for iter_26_0, iter_26_1 in pairs(arg_26_0) do
			table.insert(reloaded_26_0, iter_26_0)
		end

		return reloaded_26_0
	end,
	Find = function(arg_27_0, arg_27_1)
		for iter_27_0, iter_27_1 in pairs(arg_27_0) do
			if iter_27_1 == arg_27_1 then
				return iter_27_0
			end
		end

		return 0
	end
}
local reloaded_0_26 = {
	CreateDir = function(arg_28_0)
		pcall(function()
			ffi.C.CreateDirectoryA(arg_28_0, nil)

			return "The directory was successfully created."
		end)

		return "An error occurred while creating the directory."
	end,
	GetGameDirectory = function()
		local reloaded_30_0 = common.get_game_directory()
		local reloaded_30_1 = string.reverse(reloaded_30_0):sub(6)

		return string.reverse(reloaded_30_1) .. "\\"
	end,
	DeleteFile = function(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
		if arg_31_3 then
			arg_31_1 = arg_31_0.GetGameDirectory() .. arg_31_1
		end

		pcall(function()
			ffi.C.DeleteFileA(arg_31_1 .. arg_31_2)

			return "The file has been successfully deleted."
		end)

		return "An error occurred when deleting the file."
	end,
	ReadFolder = function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_2 then
			arg_33_1 = arg_33_0.GetGameDirectory() .. arg_33_1 .. "\\*"
		end

		local reloaded_33_0 = {}
		local reloaded_33_1 = ffi.new(reloaded_0_16)
		local reloaded_33_2 = ffi.C.FindFirstFileA(arg_33_1, reloaded_33_1)

		if reloaded_33_2 ~= reloaded_0_17 then
			repeat
				table.insert(reloaded_33_0, ffi.string(reloaded_33_1.cFileName))
			until not ffi.C.FindNextFileA(reloaded_33_2, reloaded_33_1)

			ffi.C.FindClose(ffi.gc(reloaded_33_2, nil))
		end

		local reloaded_33_3 = {}

		for iter_33_0, iter_33_1 in pairs(reloaded_33_0) do
			if "" .. iter_33_1 ~= "." and "" .. iter_33_1 ~= ".." then
				table.insert(reloaded_33_3, iter_33_1)
			end
		end

		return reloaded_33_3
	end
}
local reloaded_0_27 = {
	Download = function(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
		if arg_34_2 then
			arg_34_3 = arg_34_3 or 999999999999

			local reloaded_34_0 = files.read(arg_34_1)

			if arg_34_3 == true then
				print_raw("[~] '" .. arg_34_1 .. "'. the right Weight: " .. #reloaded_34_0)
			end

			if reloaded_34_0 == nil or tonumber(#reloaded_34_0) ~= tonumber(arg_34_3) then
				reloaded_0_20.WinInet.DeleteUrlCacheEntryA(arg_34_0)
				reloaded_0_20.UrlMon.URLDownloadToFileA(nil, arg_34_0, arg_34_1, 0, 0)
			end
		else
			reloaded_0_20.WinInet.DeleteUrlCacheEntryA(arg_34_0)
			reloaded_0_20.UrlMon.URLDownloadToFileA(nil, arg_34_0, arg_34_1, 0, 0)
		end
	end
}
local reloaded_0_28 = {
	GetFPS = function(arg_35_0)
		local reloaded_35_0 = 0

		if arg_35_0 then
			for iter_35_0 = 1, 15 do
				reloaded_0_20.FPSO = 0.9 * reloaded_0_20.FPSO + 0.09999999999999998 * globals.absoluteframetime
				reloaded_35_0 = math.floor(1 / reloaded_0_20.FPSO + 0.5)
			end
		else
			reloaded_0_20.FPSO = 0.9 * reloaded_0_20.FPSO + 0.09999999999999998 * globals.absoluteframetime
			reloaded_35_0 = math.floor(1 / reloaded_0_20.FPSO + 0.5)
		end

		return reloaded_35_0
	end,
	GetPing = function()
		local reloaded_36_0 = utils.net_channel()

		if reloaded_36_0 == nil then
			return "0"
		end

		local reloaded_36_1 = reloaded_36_0.latency[1]

		return string.format("%1.f", math.max(0, reloaded_36_1) * 1000)
	end,
	GetDAT = function()
		local reloaded_37_0 = common.get_system_time()
		local reloaded_37_1 = ffi.new("SYSTEMTIME")

		ffi.C.GetLocalTime(reloaded_37_1)

		return {
			seconds = string.len(reloaded_37_0.seconds) == 1 and "0" .. reloaded_37_0.seconds or reloaded_37_0.seconds,
			minutes = string.len(reloaded_37_0.minutes) == 1 and "0" .. reloaded_37_0.minutes or reloaded_37_0.minutes,
			hours = string.len(reloaded_37_0.hours) == 1 and "0" .. reloaded_37_0.hours or reloaded_37_0.hours,
			day = string.len(reloaded_37_1.wDay) == 1 and "0" .. reloaded_37_1.wDay or reloaded_37_1.wDay,
			month = string.len(reloaded_37_1.wMonth) == 1 and "0" .. reloaded_37_1.wMonth or reloaded_37_1.wMonth,
			year = string.len(reloaded_37_1.wYear) == 1 and "0" .. reloaded_37_1.wYear or reloaded_37_1.wYear
		}
	end,
	GetHZ = function()
		return reloaded_0_20.HZ
	end,
	GetAvatar = function(arg_39_0, arg_39_1, arg_39_2)
		local reloaded_39_0 = {
			".jpg",
			"_medium.jpg",
			"_full.jpg"
		}

		arg_39_0 = arg_39_0 or 1
		arg_39_2 = arg_39_2 or vector(16, 16)

		local reloaded_39_1 = network.get("https://steamcommunity.com/profiles/" .. reloaded_0_20.Panorama.GetXuid() .. "/?xml=1")

		if reloaded_39_1 == nil then
			return
		end

		local reloaded_39_2 = {
			Texture = "",
			Link = "",
			End = "",
			Start = "",
			Start = string.find(reloaded_39_1, "<avatarMedium>")
		}

		if reloaded_39_2.Start == nil then
			return
		end

		reloaded_39_2.End = string.find(reloaded_39_1, "</avatarMedium>")

		if reloaded_39_2.End == nil then
			return
		end

		reloaded_39_2.Link = reloaded_39_1:sub(reloaded_39_2.Start + 23, reloaded_39_2.End - 15) .. "" .. reloaded_39_0[arg_39_0]

		if arg_39_1 then
			return reloaded_39_2.Link
		else
			reloaded_39_2.Texture = network.get(reloaded_39_2.Link)

			return render.load_image(reloaded_39_2.Texture, arg_39_2)
		end
	end,
	GetIP = function(arg_40_0, arg_40_1)
		local reloaded_40_0 = tostring(network.get("https://api.ipify.org/"))

		if arg_40_1 then
			reloaded_40_0 = network.get("https://ipapi.co/" .. reloaded_40_0 .. "/country_name")
		end

		return reloaded_40_0
	end,
	GetChokeTick = function(arg_41_0, arg_41_1)
		reloaded_0_20.Tick.Check = arg_41_1

		return reloaded_0_20.Tick.Num
	end,
	Anim = {
		Overlay = function(arg_42_0, arg_42_1, arg_42_2)
			arg_42_2 = arg_42_2 or 12

			if entity.get_local_player() == nil or ffi.cast("uintptr_t**", arg_42_1) == nil then
				return
			end

			return ffi.cast("animation_layer_t_12389890123890321890089123**", ffi.cast("char*", arg_42_1) + 10640)[0][arg_42_2]
		end,
		State = function(arg_43_0, arg_43_1)
			if entity.get_local_player() == nil or ffi.cast("uintptr_t**", arg_43_1) == nil then
				return
			end

			return ffi.cast("CCSGOPlayerAnimationState_534535_t**", ffi.cast("char*", arg_43_1) + 39264)[0]
		end
	}
}
local reloaded_0_29 = {
	Box_Outline = function(arg_44_0, arg_44_1, arg_44_2)
		local reloaded_44_0 = {
			arg_44_2[1] == true and 5 or 0,
			arg_44_2[2] == true and 5 or 0,
			arg_44_2[3] == true and 5 or 0,
			arg_44_2[4] == true and 5 or 0
		}

		if reloaded_44_0[1] ~= 0 then
			render.circle_outline(vector(arg_44_0[1].x + reloaded_44_0[1], arg_44_0[1].y + reloaded_44_0[1]), arg_44_1[1], 5, 180, 0.25)
		end

		render.gradient(vector(arg_44_0[1].x + reloaded_44_0[1], arg_44_0[1].y), vector(arg_44_0[2].x - reloaded_44_0[2], arg_44_0[1].y + 1), arg_44_1[1], arg_44_1[2], arg_44_1[1], arg_44_1[2])

		if reloaded_44_0[2] ~= 0 then
			render.circle_outline(vector(arg_44_0[2].x - reloaded_44_0[2], arg_44_0[1].y + reloaded_44_0[2]), arg_44_1[2], 5, 270, 0.25)
		end

		render.gradient(vector(arg_44_0[2].x, arg_44_0[1].y + reloaded_44_0[2]), vector(arg_44_0[2].x - 1, arg_44_0[2].y - reloaded_44_0[3]), arg_44_1[2], arg_44_1[2], arg_44_1[3], arg_44_1[3])

		if reloaded_44_0[3] ~= 0 then
			render.circle_outline(vector(arg_44_0[2].x - reloaded_44_0[3], arg_44_0[2].y - reloaded_44_0[3]), arg_44_1[3], 5, 0, 0.25)
		end

		render.gradient(vector(arg_44_0[1].x + reloaded_44_0[4], arg_44_0[2].y), vector(arg_44_0[2].x - reloaded_44_0[3], arg_44_0[2].y - 1), arg_44_1[4], arg_44_1[3], arg_44_1[4], arg_44_1[3])

		if reloaded_44_0[4] ~= 0 then
			render.circle_outline(vector(arg_44_0[1].x + reloaded_44_0[4], arg_44_0[2].y - reloaded_44_0[4]), arg_44_1[4], 5, 90, 0.25)
		end

		render.gradient(vector(arg_44_0[1].x, arg_44_0[1].y + reloaded_44_0[1]), vector(arg_44_0[1].x + 1, arg_44_0[2].y - reloaded_44_0[4]), arg_44_1[1], arg_44_1[1], arg_44_1[4], arg_44_1[4])
	end,
	Box_Outline_Glow = function(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
		for iter_45_0 = 1, arg_45_2 / 3.25 do
			render.rect_outline(vector(arg_45_0[1].x - iter_45_0, arg_45_0[1].y - iter_45_0), vector(arg_45_0[2].x + iter_45_0, arg_45_0[2].y + iter_45_0), color(arg_45_1.r, arg_45_1.g, arg_45_1.b, (arg_45_2 - arg_45_2 / 10 * iter_45_0) * (arg_45_1.a / 255 * 1 / 255) * 255), 1, arg_45_3)
		end
	end,
	Histogram = function(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
		local reloaded_46_0 = arg_46_0[1]
		local reloaded_46_1 = arg_46_0[2]
		local reloaded_46_2 = {}
		local reloaded_46_3 = 1

		if arg_46_1[1] == nil then
			for iter_46_0 = 1, #arg_46_2 do
				table.insert(reloaded_46_2, arg_46_1)
			end
		else
			reloaded_46_2 = arg_46_1
		end

		if reloaded_46_1.x == 0 then
			reloaded_46_1.x = #arg_46_2 * (#arg_46_2 / (#arg_46_2 / 3))
		end

		if reloaded_46_1.y == 0 then
			reloaded_46_1.y = #arg_46_2 * (#arg_46_2 / (#arg_46_2 / 3))
		end

		for iter_46_1 = 1, #arg_46_2 do
			local reloaded_46_4 = {
				vector(math.floor(reloaded_46_0.x + reloaded_46_1.x / #arg_46_2 * (iter_46_1 - 1)), math.floor(reloaded_46_0.y + reloaded_46_1.y - reloaded_46_1.y * arg_46_2[iter_46_1] / math.max(unpack(arg_46_2)) - math.min(unpack(arg_46_2)))),
				vector(math.floor(reloaded_46_0.x + reloaded_46_1.x / #arg_46_2 * iter_46_1), math.floor(reloaded_46_0.y + reloaded_46_1.y))
			}

			reloaded_46_3 = reloaded_46_3 + 1

			if reloaded_46_2[reloaded_46_3] == nil then
				reloaded_46_3 = 1
			end

			render.rect(reloaded_46_4[1], reloaded_46_4[2], reloaded_46_2[reloaded_46_3], arg_46_3 == nil and 0 or arg_46_3)
		end
	end,
	Graphic = function(arg_47_0, arg_47_1, arg_47_2)
		local reloaded_47_0 = arg_47_0[1]
		local reloaded_47_1 = arg_47_0[2]
		local reloaded_47_2 = {}
		local reloaded_47_3 = 1

		if arg_47_1[1] == nil then
			for iter_47_0 = 1, #arg_47_2 do
				table.insert(reloaded_47_2, arg_47_1)
			end
		else
			reloaded_47_2 = arg_47_1
		end

		if reloaded_47_1.x == 0 then
			reloaded_47_1.x = #arg_47_2 * (#arg_47_2 / (#arg_47_2 / 3))
		end

		if reloaded_47_1.y == 0 then
			reloaded_47_1.y = #arg_47_2 * (#arg_47_2 / (#arg_47_2 / 3))
		end

		for iter_47_1 = 1, #arg_47_2 do
			local reloaded_47_4 = {
				vector(reloaded_47_0.x + reloaded_47_1.x / #arg_47_2 * (iter_47_1 - 1), reloaded_47_0.y + reloaded_47_1.y - reloaded_47_1.y * arg_47_2[iter_47_1] / math.max(unpack(arg_47_2)) - math.min(unpack(arg_47_2))),
				vector(reloaded_47_0.x + reloaded_47_1.x / #arg_47_2 * iter_47_1, reloaded_47_0.y + reloaded_47_1.y - reloaded_47_1.y * arg_47_2[iter_47_1 < #arg_47_2 and iter_47_1 + 1 or iter_47_1] / math.max(unpack(arg_47_2)) - math.min(unpack(arg_47_2)))
			}

			reloaded_47_3 = reloaded_47_3 + 1

			if reloaded_47_2[reloaded_47_3] == nil then
				reloaded_47_3 = 1
			end

			for iter_47_2 = 1, 2 do
				render.line(vector(reloaded_47_4[1].x, reloaded_47_4[1].y + iter_47_2 - 1 + 8), vector(reloaded_47_4[2].x, reloaded_47_4[2].y + iter_47_2 - 1 + 8), reloaded_47_2[reloaded_47_3])
			end
		end
	end,
	Modern = {
		Box = function(arg_48_0, arg_48_1, arg_48_2)
			local reloaded_48_0 = arg_48_0[1].x
			local reloaded_48_1 = arg_48_0[1].y
			local reloaded_48_2 = arg_48_0[2].x - reloaded_48_0
			local reloaded_48_3 = arg_48_0[2].y - reloaded_48_1

			arg_48_1[1] = arg_48_1[1] or 0
			arg_48_1[2] = arg_48_1[2] or 0
			arg_48_1[3] = arg_48_1[3] or 0
			arg_48_1[4] = arg_48_1[4] or 0
			arg_48_2 = arg_48_2 or color(16, 16, 16, 255)

			render.push_clip_rect(vector(reloaded_48_0, reloaded_48_1), vector(reloaded_48_0 + reloaded_48_2 / 2, reloaded_48_1 + reloaded_48_3 / 2))
			render.rect(vector(reloaded_48_0, reloaded_48_1), vector(reloaded_48_0 + reloaded_48_2, reloaded_48_1 + reloaded_48_3), arg_48_2, arg_48_1[1])
			render.pop_clip_rect()
			render.push_clip_rect(vector(reloaded_48_0 + reloaded_48_2 / 2, reloaded_48_1), vector(reloaded_48_0 + reloaded_48_2, reloaded_48_1 + reloaded_48_3 / 2))
			render.rect(vector(reloaded_48_0, reloaded_48_1), vector(reloaded_48_0 + reloaded_48_2, reloaded_48_1 + reloaded_48_3), arg_48_2, arg_48_1[2])
			render.pop_clip_rect()
			render.push_clip_rect(vector(reloaded_48_0, reloaded_48_1 + reloaded_48_3 / 2), vector(reloaded_48_0 + reloaded_48_2 / 2, reloaded_48_1 + reloaded_48_3))
			render.rect(vector(reloaded_48_0, reloaded_48_1), vector(reloaded_48_0 + reloaded_48_2, reloaded_48_1 + reloaded_48_3), arg_48_2, arg_48_1[3])
			render.pop_clip_rect()
			render.push_clip_rect(vector(reloaded_48_0 + reloaded_48_2 / 2, reloaded_48_1 + reloaded_48_3 / 2), vector(reloaded_48_0 + reloaded_48_2, reloaded_48_1 + reloaded_48_3))
			render.rect(vector(reloaded_48_0, reloaded_48_1), vector(reloaded_48_0 + reloaded_48_2, reloaded_48_1 + reloaded_48_3), arg_48_2, arg_48_1[4])
			render.pop_clip_rect()
		end,
		Box_Outline = function(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
			local reloaded_49_0 = arg_49_0[1].x
			local reloaded_49_1 = arg_49_0[1].y
			local reloaded_49_2 = arg_49_0[2].x - reloaded_49_0
			local reloaded_49_3 = arg_49_0[2].y - reloaded_49_1

			arg_49_1[1] = arg_49_1[1] or 0
			arg_49_1[2] = arg_49_1[2] or 0
			arg_49_1[3] = arg_49_1[3] or 0
			arg_49_1[4] = arg_49_1[4] or 0
			arg_49_2 = arg_49_2 or color(255, 255, 255, 255)
			arg_49_3 = arg_49_3 or 1

			render.push_clip_rect(vector(reloaded_49_0, reloaded_49_1), vector(reloaded_49_0 + reloaded_49_2 / 2, reloaded_49_1 + reloaded_49_3 / 2))
			render.rect_outline(vector(reloaded_49_0, reloaded_49_1), vector(reloaded_49_0 + reloaded_49_2, reloaded_49_1 + reloaded_49_3), arg_49_2, arg_49_3, arg_49_1[1])
			render.pop_clip_rect()
			render.push_clip_rect(vector(reloaded_49_0 + reloaded_49_2 / 2, reloaded_49_1), vector(reloaded_49_0 + reloaded_49_2, reloaded_49_1 + reloaded_49_3 / 2))
			render.rect_outline(vector(reloaded_49_0, reloaded_49_1), vector(reloaded_49_0 + reloaded_49_2, reloaded_49_1 + reloaded_49_3), arg_49_2, arg_49_3, arg_49_1[2])
			render.pop_clip_rect()
			render.push_clip_rect(vector(reloaded_49_0, reloaded_49_1 + reloaded_49_3 / 2), vector(reloaded_49_0 + reloaded_49_2 / 2, reloaded_49_1 + reloaded_49_3))
			render.rect_outline(vector(reloaded_49_0, reloaded_49_1), vector(reloaded_49_0 + reloaded_49_2, reloaded_49_1 + reloaded_49_3), arg_49_2, arg_49_3, arg_49_1[3])
			render.pop_clip_rect()
			render.push_clip_rect(vector(reloaded_49_0 + reloaded_49_2 / 2, reloaded_49_1 + reloaded_49_3 / 2), vector(reloaded_49_0 + reloaded_49_2, reloaded_49_1 + reloaded_49_3))
			render.rect_outline(vector(reloaded_49_0, reloaded_49_1), vector(reloaded_49_0 + reloaded_49_2, reloaded_49_1 + reloaded_49_3), arg_49_2, arg_49_3, arg_49_1[4])
			render.pop_clip_rect()
		end
	}
}
local reloaded_0_30 = {
	Particle = function(arg_50_0, arg_50_1)
		if not reloaded_0_3.Material then
			reloaded_0_3.Material = reloaded_0_7("effects/spark", reloaded_0_3.Null, true, reloaded_0_3.Null)
		else
			reloaded_0_8(reloaded_0_3.Material, arg_50_1.a / 255)
			reloaded_0_9(reloaded_0_3.Material, arg_50_1.r / 255, arg_50_1.g / 255, arg_50_1.b / 255)
		end

		reloaded_0_5(reloaded_0_3.Vec3(arg_50_0:unpack()), reloaded_0_3.Vec3(), false)
	end,
	Muzzle = function()
		local reloaded_51_0 = entity.get_local_player()

		if not reloaded_51_0 or reloaded_51_0.m_iHealth < 1 then
			return
		end

		local reloaded_51_1 = entity.get(reloaded_51_0.m_hActiveWeapon)

		if not reloaded_51_1 then
			return
		end

		if not reloaded_0_13(reloaded_51_0:get_index()) then
			return
		end

		local reloaded_51_2 = reloaded_0_13(reloaded_51_1:get_index())

		if not reloaded_51_2 then
			return
		end

		local reloaded_51_3 = entity.get(reloaded_51_0.m_hViewModel[0])

		if not reloaded_51_3 then
			return
		end

		local reloaded_51_4 = reloaded_0_13(reloaded_51_3:get_index())

		if not reloaded_51_4 then
			return
		end

		local reloaded_51_5 = entity.get(reloaded_51_1.m_hWeaponWorldModel)

		if not reloaded_51_5 then
			return
		end

		local reloaded_51_6 = reloaded_0_13(reloaded_51_5:get_index())

		if not reloaded_51_6 then
			return
		end

		local reloaded_51_7 = ffi.cast(reloaded_0_11, reloaded_51_4)[0]
		local reloaded_51_8 = ffi.cast(reloaded_0_11, reloaded_51_6)[0]
		local reloaded_51_9 = ffi.cast(reloaded_0_11, reloaded_51_2)[0]
		local reloaded_51_10 = ffi.cast("c_entity_get_attachLPnt_t", reloaded_51_7[reloaded_0_10.Index])
		local reloaded_51_11 = ffi.cast("c_entity_get_attachLPnt_t", reloaded_51_8[reloaded_0_10.Index])
		local reloaded_51_12 = ffi.cast("c_weapon_get_muzzle_attachLPnt_index_first_person_t", reloaded_51_9[reloaded_0_10.ST1])
		local reloaded_51_13 = ffi.cast("c_weapon_get_muzzle_attachLPnt_index_third_person_t", reloaded_51_9[reloaded_0_10.RD3])
		local reloaded_51_14 = reloaded_51_12(reloaded_51_2, reloaded_51_4)
		local reloaded_51_15 = reloaded_51_13(reloaded_51_2)
		local reloaded_51_16 = ffi.new("vec3_struct[1]")

		if common.is_in_thirdperson() then
			State = reloaded_51_11(reloaded_51_6, reloaded_51_15, reloaded_51_16)
		else
			State = reloaded_51_10(reloaded_51_4, reloaded_51_14, reloaded_51_16)
		end

		return {
			State = State,
			Pos = vector(reloaded_51_16[0].x, reloaded_51_16[0].y, reloaded_51_16[0].z)
		}
	end,
	AnimLayers = {
		Settings = function(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
			reloaded_0_20.AnimLayers.Weight = arg_52_2 or nil
			reloaded_0_20.AnimLayers.Sequence = arg_52_3 or 7
			reloaded_0_20.AnimLayers.Reset = arg_52_1 == nil and true or arg_52_1
		end,
		Update = function(arg_53_0, arg_53_1, arg_53_2)
			local reloaded_53_0 = reloaded_0_20.AnimLayers.Weight
			local reloaded_53_1 = reloaded_0_20.AnimLayers.Sequence

			if entity.get_local_player() == nil or ffi.cast("uintptr_t**", arg_53_1) == nil or reloaded_53_0 == nil or reloaded_53_1 == nil then
				return
			end

			local reloaded_53_2 = ffi.cast("animation_layer_t_12389890123890321890089123**", ffi.cast("char*", arg_53_1) + 10640)[0][12]

			if arg_53_2 then
				if reloaded_53_2.m_flWeight ~= 0 then
					reloaded_53_2.m_flWeight = reloaded_53_0 > 100 and reloaded_53_2.m_flWeight * reloaded_53_0 / 100 or reloaded_53_0
				end
			else
				reloaded_53_2.m_flWeight = reloaded_53_0 > 100 and reloaded_53_2.m_flWeight * reloaded_53_0 / 100 or reloaded_53_0
			end

			reloaded_53_2.m_nSequence = reloaded_53_1
		end
	},
	Ways = function(arg_54_0, arg_54_1)
		if reloaded_0_20.Ways[arg_54_0] == nil then
			reloaded_0_20.Ways[arg_54_0] = {
				Init = 1
			}
		end

		if globals.choked_commands == 0 then
			reloaded_0_20.Ways[arg_54_0].Init = reloaded_0_20.Ways[arg_54_0].Init + 1
		end

		if reloaded_0_20.Ways[arg_54_0].Init > #arg_54_1 then
			reloaded_0_20.Ways[arg_54_0].Init = 1
		end

		return arg_54_1[reloaded_0_20.Ways[arg_54_0].Init]
	end
}
local reloaded_0_31 = {
	Register = function(arg_55_0, arg_55_1, arg_55_2)
		if arg_55_2 == true or arg_55_2 == nil and reloaded_0_20.Animation.List[arg_55_1] == nil then
			reloaded_0_20.Animation.List[arg_55_1] = {
				Speed = 7.5,
				MultiNum = 0,
				Storage = {},
				Active = {},
				RealTime = globals.realtime,
				PRealTime = globals.realtime
			}
		end
	end,
	Update = function(arg_56_0, arg_56_1, arg_56_2)
		reloaded_0_20.Animation.List[arg_56_1].PRealTime = reloaded_0_20.Animation.List[arg_56_1].RealTime
		reloaded_0_20.Animation.List[arg_56_1].RealTime = globals.realtime
		reloaded_0_20.Animation.List[arg_56_1].Speed = arg_56_2
		reloaded_0_20.Animation.List[arg_56_1].MultiNum = (reloaded_0_20.Animation.List[arg_56_1].RealTime - reloaded_0_20.Animation.List[arg_56_1].PRealTime) * (arg_56_2 or reloaded_0_20.Animation.List[arg_56_1].Speed)

		for iter_56_0, iter_56_1 in pairs(reloaded_0_20.Animation.List[arg_56_1].Storage) do
			if reloaded_0_20.Animation.List[arg_56_1].Active[iter_56_0] ~= nil then
				-- block empty
			else
				reloaded_0_20.Animation.List[arg_56_1].Storage[iter_56_0] = nil
			end
		end

		reloaded_0_20.Animation.List[arg_56_1].Active = {}
	end,
	Lerp = function(arg_57_0, arg_57_1, arg_57_2, arg_57_3, arg_57_4, arg_57_5, arg_57_6)
		local reloaded_57_0 = type(arg_57_4)

		if reloaded_57_0 == "userdata" then
			if arg_57_4.r ~= nil and arg_57_4.g ~= nil and arg_57_4.b ~= nil then
				reloaded_57_0 = "color"
			end

			if arg_57_4.x ~= nil and arg_57_4.y ~= nil and arg_57_4.z ~= nil then
				reloaded_57_0 = "vector"
			end
		else
			reloaded_57_0 = reloaded_57_0 == "table" and "table" or "number"
		end

		arg_57_3 = arg_57_3 or false
		arg_57_6 = arg_57_6 or reloaded_0_20.Animation.List[arg_57_1].Speed

		if reloaded_57_0 == "color" then
			arg_57_5 = arg_57_5 and (type(arg_57_5) ~= "userdata" and color(255, 255, 255) or arg_57_5) or color(255, 255, 255)

			if arg_57_3 then
				if reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] ~= nil then
					arg_57_4 = reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2]
				end
			elseif reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] ~= nil then
				arg_57_5 = reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2]
			end

			local reloaded_57_1 = {
				0,
				0,
				0
			}

			for iter_57_0, iter_57_1 in pairs({
				"r",
				"g",
				"b",
				"a"
			}) do
				if arg_57_3 then
					reloaded_57_1[iter_57_0] = arg_57_0:OldLerp(arg_57_4[iter_57_1], arg_57_5[iter_57_1], arg_57_6)
				else
					reloaded_57_1[iter_57_0] = arg_57_0:OldLerp(arg_57_5[iter_57_1], arg_57_4[iter_57_1], arg_57_6)
				end
			end

			reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] = color(unpack(reloaded_57_1))
			reloaded_0_20.Animation.List[arg_57_1].Active[arg_57_2] = true

			return color(unpack(reloaded_57_1))
		end

		if reloaded_57_0 == "vector" then
			arg_57_5 = arg_57_5 and (type(arg_57_5) ~= "userdata" and vector(0, 0, 0) or arg_57_5) or vector(100, 100, 100)

			if arg_57_3 then
				if reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] ~= nil then
					arg_57_4 = reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2]
				end
			elseif reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] ~= nil then
				arg_57_5 = reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2]
			end

			local reloaded_57_2 = {
				0,
				0,
				0
			}

			for iter_57_2, iter_57_3 in pairs({
				"x",
				"y",
				"z"
			}) do
				if arg_57_3 then
					reloaded_57_2[iter_57_2] = arg_57_0:OldLerp(arg_57_4[iter_57_3], arg_57_5[iter_57_3], arg_57_6)
				else
					reloaded_57_2[iter_57_2] = arg_57_0:OldLerp(arg_57_5[iter_57_3], arg_57_4[iter_57_3], arg_57_6)
				end
			end

			reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] = vector(unpack(reloaded_57_2))
			reloaded_0_20.Animation.List[arg_57_1].Active[arg_57_2] = true

			return vector(unpack(reloaded_57_2))
		end

		if reloaded_57_0 == "table" then
			arg_57_5 = arg_57_5 and (type(arg_57_5) ~= "table" and {
				1,
				2,
				3
			} or arg_57_5) or {
				1,
				2,
				3
			}

			if arg_57_3 then
				if reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] ~= nil then
					arg_57_4 = reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2]
				end
			elseif reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] ~= nil then
				arg_57_5 = reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2]
			end

			local reloaded_57_3 = {}

			for iter_57_4 = 1, #arg_57_4 do
				if arg_57_3 then
					reloaded_57_3[iter_57_4] = arg_57_0:OldLerp(arg_57_4[iter_57_4], arg_57_5[iter_57_4], arg_57_6)
				else
					reloaded_57_3[iter_57_4] = arg_57_0:OldLerp(arg_57_5[iter_57_4], arg_57_4[iter_57_4], arg_57_6)
				end
			end

			reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] = reloaded_57_3
			reloaded_0_20.Animation.List[arg_57_1].Active[arg_57_2] = true

			return reloaded_57_3
		end

		if reloaded_57_0 == "number" then
			arg_57_4 = arg_57_4 or 0
			arg_57_5 = arg_57_5 or 1

			local reloaded_57_4 = reloaded_0_20.Animation.List[arg_57_1].MultiNum * (arg_57_3 and -1 or 1)
			local reloaded_57_5 = reloaded_0_20.Animation.Clamp(reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] and reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] or 0, arg_57_4, arg_57_5)
			local reloaded_57_6 = reloaded_0_20.Animation.Clamp(reloaded_57_5 + reloaded_57_4, 0, arg_57_5)

			reloaded_0_20.Animation.List[arg_57_1].Storage[arg_57_2] = reloaded_57_6
			reloaded_0_20.Animation.List[arg_57_1].Active[arg_57_2] = true

			return reloaded_57_6
		end
	end,
	OldLerp = function(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
		return arg_58_1 + (arg_58_2 - arg_58_1) * globals.frametime * (arg_58_3 or reloaded_0_20.Animation.Speed)
	end,
	Easing = {
		Register = function(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4, arg_59_5)
			arg_59_3 = arg_59_3 or 1
			arg_59_4 = arg_59_4 or 0.5
			arg_59_5 = arg_59_5 or 512

			if reloaded_0_20.Animation.Easing[arg_59_2] == nil and arg_59_1 == "Dynamic" then
				local reloaded_59_0 = math.pi * arg_59_3
				local reloaded_59_1 = 2 * reloaded_59_0
				local reloaded_59_2 = arg_59_4 / reloaded_59_0
				local reloaded_59_3 = 1 / (reloaded_59_1 * reloaded_59_1)
				local reloaded_59_4 = 0 * arg_59_4 / reloaded_59_1

				reloaded_0_20.Animation.Easing[arg_59_2] = {
					NewPos = 0,
					Type = arg_59_1,
					Calculation = reloaded_59_2,
					Umnations = reloaded_59_3,
					Prerequisite = reloaded_59_4,
					Pixel = arg_59_5,
					Position = arg_59_5
				}
			end
		end,
		Update = function(arg_60_0, arg_60_1, arg_60_2)
			local reloaded_60_0 = reloaded_0_20.Animation.Easing[arg_60_1]

			if reloaded_60_0 == nil then
				return
			end

			local reloaded_60_1 = (arg_60_2 - reloaded_60_0.Pixel) / globals.frametime

			reloaded_60_0.Pixel = arg_60_2
			reloaded_60_0.Position = reloaded_60_0.Position + globals.frametime * reloaded_60_0.NewPos
			reloaded_60_0.NewPos = reloaded_60_0.NewPos + globals.frametime * (arg_60_2 + reloaded_60_0.Prerequisite * reloaded_60_1 - reloaded_60_0.Position - reloaded_60_0.Calculation * reloaded_60_0.NewPos) / reloaded_60_0.Umnations
		end,
		Get = function(arg_61_0, arg_61_1)
			local reloaded_61_0 = reloaded_0_20.Animation.Easing[arg_61_1]

			if reloaded_61_0 == nil then
				return
			end

			return reloaded_0_24.Round(reloaded_61_0.Position + 0.5)
		end
	}
}
local reloaded_0_32 = {
	Condition = {
		Update = function()
			local reloaded_62_0 = entity.get_local_player()

			if reloaded_62_0 == nil then
				reloaded_0_20.AntiAims.Condition.Priority = "D"
				reloaded_0_20.AntiAims.Condition.Delay = 0
				reloaded_0_20.AntiAims.Other["Air Delay"] = 0

				return
			end

			if bit.band(reloaded_62_0.m_fFlags, 1) == 1 then
				if reloaded_0_20.AntiAims.Condition.Delay == 0 then
					reloaded_0_20.AntiAims.Condition.Delay = globals.curtime
				end

				if globals.curtime - reloaded_0_20.AntiAims.Condition.Delay > 0.06 then
					reloaded_0_20.AntiAims.Condition.Air = false
					reloaded_0_20.AntiAims.Condition.Delay = 0
					reloaded_0_20.AntiAims.Other.Difference = 0
				end
			else
				reloaded_0_20.AntiAims.Condition.Air = true
				reloaded_0_20.AntiAims.Condition.Delay = 0
				reloaded_0_20.AntiAims.Other["Air Delay"] = globals.curtime
			end

			local reloaded_62_1 = reloaded_62_0.m_vecVelocity
			local reloaded_62_2 = math.sqrt(reloaded_62_1.x * reloaded_62_1.x + reloaded_62_1.y * reloaded_62_1.y)
			local reloaded_62_3 = math.floor(math.max(reloaded_0_20.AntiAims.Condition.Velocity, reloaded_62_2) - math.min(reloaded_0_20.AntiAims.Condition.Velocity, reloaded_62_2))

			if reloaded_62_3 > reloaded_0_20.AntiAims.Other.Difference and reloaded_62_3 < 64 and globals.curtime - reloaded_0_20.AntiAims.Other["Air Delay"] < 0.5 then
				reloaded_0_20.AntiAims.Other.Difference = reloaded_62_3
			end

			reloaded_0_20.AntiAims.Condition.Stand = reloaded_0_20.AntiAims.Condition.Velocity <= 1 or reloaded_0_20.AntiAims.Other.Difference > 16
			reloaded_0_20.AntiAims.Condition.Walk = reloaded_0_20.AntiAims.Condition.Velocity > 2 and reloaded_0_20.AntiAims.Other.Difference <= 16
			reloaded_0_20.AntiAims.Condition["Slow Walk"] = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() and not reloaded_0_20.AntiAims.Condition.Stand
			reloaded_0_20.AntiAims.Condition.Crouch = reloaded_62_0.m_flDuckAmount > 0.75 or ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get()
			reloaded_0_20.AntiAims.Condition["Air Crouch"] = reloaded_0_20.AntiAims.Condition.Air and reloaded_0_20.AntiAims.Condition.Crouch
			reloaded_0_20.AntiAims.Condition["No Exploits"] = not ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get()
			reloaded_0_20.AntiAims.Condition.Velocity = math.floor(reloaded_62_2)

			if reloaded_0_20.AntiAims.Condition.Stand then
				reloaded_0_20.AntiAims.Condition.Priority = "S"
			end

			if reloaded_0_20.AntiAims.Condition.Walk then
				reloaded_0_20.AntiAims.Condition.Priority = "W"
			end

			if reloaded_0_20.AntiAims.Condition["Slow Walk"] then
				reloaded_0_20.AntiAims.Condition.Priority = "SW"
			end

			if reloaded_0_20.AntiAims.Condition.Air then
				reloaded_0_20.AntiAims.Condition.Priority = "A"
			end

			if reloaded_0_20.AntiAims.Condition.Crouch then
				reloaded_0_20.AntiAims.Condition.Priority = "C"
			end

			if reloaded_0_20.AntiAims.Condition["Air Crouch"] then
				reloaded_0_20.AntiAims.Condition.Priority = "AC"
			end

			if reloaded_0_20.AntiAims.Condition["No Exploits"] then
				reloaded_0_20.AntiAims.Condition.Priority = "NE"
			end
		end,
		Get = function(arg_63_0, arg_63_1)
			if type(arg_63_0) ~= "table" then
				arg_63_1 = arg_63_0
			end

			local function reloaded_63_0(arg_64_0, arg_64_1, arg_64_2)
				if arg_64_0 then
					return arg_64_1
				else
					return arg_64_2
				end
			end

			local reloaded_63_1 = {}

			if arg_63_1 then
				reloaded_63_1 = {
					S = reloaded_0_25.Find(arg_63_1, "S") ~= 0,
					W = reloaded_0_25.Find(arg_63_1, "W") ~= 0,
					SW = reloaded_0_25.Find(arg_63_1, "SW") ~= 0,
					C = reloaded_0_25.Find(arg_63_1, "C") ~= 0,
					A = reloaded_0_25.Find(arg_63_1, "A") ~= 0,
					AC = reloaded_0_25.Find(arg_63_1, "AC") ~= 0,
					NE = reloaded_0_25.Find(arg_63_1, "NE") ~= 0
				}
			else
				reloaded_63_1 = {
					A = true,
					NE = true,
					C = true,
					AC = true,
					S = true,
					SW = true,
					W = true
				}
			end

			if not reloaded_63_1.NE then
				if reloaded_0_20.AntiAims.Condition.Stand then
					reloaded_0_20.AntiAims.Condition.Priority = "S"
				end

				if reloaded_0_20.AntiAims.Condition.Walk then
					reloaded_0_20.AntiAims.Condition.Priority = "W"
				end

				if reloaded_0_20.AntiAims.Condition["Slow Walk"] then
					reloaded_0_20.AntiAims.Condition.Priority = "SW"
				end

				if reloaded_0_20.AntiAims.Condition.Air then
					reloaded_0_20.AntiAims.Condition.Priority = "A"
				end

				if reloaded_0_20.AntiAims.Condition.Crouch then
					reloaded_0_20.AntiAims.Condition.Priority = "C"
				end

				if reloaded_0_20.AntiAims.Condition["Air Crouch"] then
					reloaded_0_20.AntiAims.Condition.Priority = "AC"
				end
			else
				reloaded_0_20.AntiAims.Condition["No Exploits"] = reloaded_0_20.AntiAims.Condition["No Exploits"] and reloaded_63_1.NE
			end

			local reloaded_63_2 = arg_63_1 and "G" or "S"

			if reloaded_63_1.S and reloaded_0_20.AntiAims.Condition.Priority == "S" then
				reloaded_63_2 = "S"
			end

			if reloaded_63_1.W and reloaded_0_20.AntiAims.Condition.Priority == "W" then
				reloaded_63_2 = "W"
			end

			if reloaded_63_1.SW and reloaded_0_20.AntiAims.Condition.Priority == "SW" then
				reloaded_63_2 = "SW"
			end

			if reloaded_63_1.C and reloaded_0_20.AntiAims.Condition.Priority == "C" then
				reloaded_63_2 = "C"
			end

			if reloaded_63_1.A and reloaded_0_20.AntiAims.Condition.Priority == "A" then
				reloaded_63_2 = "A"
			end

			if reloaded_63_1.AC and reloaded_0_20.AntiAims.Condition.Priority == "AC" then
				reloaded_63_2 = "AC"
			end

			if reloaded_63_1.NE and reloaded_0_20.AntiAims.Condition.Priority == "NE" then
				reloaded_63_2 = "NE"
			end

			return reloaded_63_2
		end,
		GetDev = function(arg_65_0, arg_65_1)
			if type(arg_65_0) ~= "table" then
				arg_65_1 = arg_65_0
			end

			if arg_65_1 then
				if reloaded_0_20.AntiAims.Condition[arg_65_1] == nil then
					return nil
				else
					return reloaded_0_20.AntiAims.Condition[arg_65_1]
				end
			else
				return reloaded_0_20.AntiAims.Condition
			end
		end
	}
}
local reloaded_0_33 = {
	Register = function(arg_66_0)
		if reloaded_0_20.DiscordRPC == nil then
			reloaded_0_20.DiscordRPC = {}

			local reloaded_66_0 = ffi.load("C:\\Windows\\SysWOW64\\discord-rpc")

			ffi.cdef("                typedef struct DiscordRichPresence {\n                    const char* state;\n                    const char* details;\n                    int64_t startTimestamp;\n                    int64_t endTimestamp;\n                    const char* largeImageKey;\n                    const char* largeImageText;\n                    const char* smallImageKey;\n                    const char* smallImageText;\n                    const char* partyId;\n                    int partySize;\n                    int partyMax;\n                    const char* matchSecret;\n                    const char* joinSecret;\n                    const char* spectateSecret;\n                    int8_t instance;\n                } DiscordRichPresence;\n                typedef struct DiscordUser {\n                    const char* userId;\n                    const char* username;\n                    const char* discriminator;\n                    const char* avatar;\n                } DiscordUser;\n                typedef void (*readyPtr)(const DiscordUser* request);\n                typedef void (*disconnectedPtr)(int errorCode, const char* message);\n                typedef void (*erroredPtr)(int errorCode, const char* message);\n                typedef void (*joinGamePtr)(const char* joinSecret);\n                typedef void (*spectateGamePtr)(const char* spectateSecret);\n                typedef void (*joinRequestPtr)(const DiscordUser* request);\n                typedef struct DiscordEventHandlers {\n                    readyPtr ready;\n                    disconnectedPtr disconnected;\n                    erroredPtr errored;\n                    joinGamePtr joinGame;\n                    spectateGamePtr spectateGame;\n                    joinRequestPtr joinRequest;\n                } DiscordEventHandlers;\n                void Discord_Initialize(const char* applicationId,\n                                        DiscordEventHandlers* handlers,\n                                        int autoRegister,\n                                        const char* optionalSteamId);\n                void Discord_Shutdown(void);\n                void Discord_RunCallbacks(void);\n                void Discord_UpdatePresence(const DiscordRichPresence* presence);\n                void Discord_ClearPresence(void);\n                void Discord_Respond(const char* userid, int reply);\n                void Discord_UpdateHandlers(DiscordEventHandlers* handlers);\n            ")

			local function reloaded_66_1(arg_67_0, arg_67_1, arg_67_2, arg_67_3, arg_67_4)
				assert(type(arg_67_0) == arg_67_1 or arg_67_4 and arg_67_0 == nil, string.format("Argument \"%s\" to function \"%s\" has to be of type \"%s\"", arg_67_2, arg_67_3, arg_67_1))
			end

			local function reloaded_66_2(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4)
				if arg_68_1 then
					assert(type(arg_68_0) == "string" and arg_68_1 >= arg_68_0:len() or arg_68_4 and arg_68_0 == nil, string.format("Argument \"%s\" of function \"%s\" has to be of type string with maximum length %d", arg_68_2, arg_68_3, arg_68_1))
				else
					reloaded_66_1(arg_68_0, "string", arg_68_2, arg_68_3, true)
				end
			end

			local function reloaded_66_3(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4)
				arg_69_1 = math.min(arg_69_1 or 32, 52)

				local reloaded_69_0 = 2^(arg_69_1 - 1)

				assert(type(arg_69_0) == "number" and math.floor(arg_69_0) == arg_69_0 and arg_69_0 < reloaded_69_0 and arg_69_0 >= -reloaded_69_0 or arg_69_4 and arg_69_0 == nil, string.format("Argument \"%s\" of function \"%s\" has to be a whole number <= %d", arg_69_2, arg_69_3, reloaded_69_0))
			end

			function reloaded_0_20.DiscordRPC.initialize(arg_70_0, arg_70_1, arg_70_2)
				local reloaded_70_0 = "Auxiliary.DiscordRPC.Initialize"

				reloaded_66_2(arg_70_0, nil, "applicationId", reloaded_70_0)
				reloaded_66_1(arg_70_1, "boolean", "autoRegister", reloaded_70_0)

				if arg_70_2 ~= nil then
					reloaded_66_2(arg_70_2, nil, "optionalSteamId", reloaded_70_0)
				end

				local reloaded_70_1 = ffi.new("struct DiscordEventHandlers")

				reloaded_66_0.Discord_Initialize(arg_70_0, reloaded_70_1, arg_70_1 and 1 or 0, arg_70_2)
			end

			function reloaded_0_20.DiscordRPC.shutdown()
				reloaded_66_0.Discord_Shutdown()
			end

			function reloaded_0_20.DiscordRPC.updatePresence(arg_72_0)
				local reloaded_72_0 = "Auxiliary.DiscordRPC.updatePresence"

				reloaded_66_1(arg_72_0, "table", "presence", reloaded_72_0)
				reloaded_66_2(arg_72_0.state, 320, "presence.state", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.details, 320, "presence.details", reloaded_72_0, true)
				reloaded_66_3(arg_72_0.startTimestamp, 64, "presence.startTimestamp", reloaded_72_0, true)
				reloaded_66_3(arg_72_0.endTimestamp, 64, "presence.endTimestamp", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.largeImageKey, 320, "presence.largeImageKey", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.largeImageText, 320, "presence.largeImageText", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.smallImageKey, 320, "presence.smallImageKey", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.smallImageText, 320, "presence.smallImageText", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.partyId, 127, "presence.partyId", reloaded_72_0, true)
				reloaded_66_3(arg_72_0.partySize, 32, "presence.partySize", reloaded_72_0, true)
				reloaded_66_3(arg_72_0.partyMax, 32, "presence.partyMax", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.matchSecret, 127, "presence.matchSecret", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.joinSecret, 127, "presence.joinSecret", reloaded_72_0, true)
				reloaded_66_2(arg_72_0.spectateSecret, 127, "presence.spectateSecret", reloaded_72_0, true)
				reloaded_66_3(arg_72_0.instance, 8, "presence.instance", reloaded_72_0, true)

				local reloaded_72_1 = ffi.new("struct DiscordRichPresence")

				reloaded_72_1.state = arg_72_0.state
				reloaded_72_1.details = arg_72_0.details
				reloaded_72_1.startTimestamp = arg_72_0.startTimestamp or 0
				reloaded_72_1.endTimestamp = arg_72_0.endTimestamp or 0
				reloaded_72_1.largeImageKey = arg_72_0.largeImageKey
				reloaded_72_1.largeImageText = arg_72_0.largeImageText
				reloaded_72_1.smallImageKey = arg_72_0.smallImageKey
				reloaded_72_1.smallImageText = arg_72_0.smallImageText
				reloaded_72_1.partyId = arg_72_0.partyId
				reloaded_72_1.partySize = arg_72_0.partySize or 0
				reloaded_72_1.partyMax = arg_72_0.partyMax or 0
				reloaded_72_1.matchSecret = arg_72_0.matchSecret
				reloaded_72_1.joinSecret = arg_72_0.joinSecret
				reloaded_72_1.spectateSecret = arg_72_0.spectateSecret
				reloaded_72_1.instance = arg_72_0.instance or 0

				reloaded_66_0.Discord_UpdatePresence(reloaded_72_1)
			end

			function reloaded_0_20.DiscordRPC.clearPresence()
				reloaded_66_0.Discord_ClearPresence()
			end

			reloaded_0_20.DiscordRPC.initialize("835071507943129119", true)
		end
	end,
	Update = function(arg_74_0, arg_74_1, arg_74_2)
		local reloaded_74_0 = entity.get_local_player()

		arg_74_2 = arg_74_2 or 1

		if arg_74_1 == nil then
			return
		end

		if reloaded_0_20.DiscordRPC.Time == nil then
			reloaded_0_20.DiscordRPC.Time = globals.curtime
		end

		if reloaded_74_0 == nil then
			if reloaded_0_20.DiscordRPC.LP == true then
				reloaded_0_20.DiscordRPC.Time = globals.curtime
				reloaded_0_20.DiscordRPC.LP = false
			end
		else
			reloaded_0_20.DiscordRPC.LP = true
		end

		if arg_74_2 < globals.curtime - reloaded_0_20.DiscordRPC.Time then
			reloaded_0_20.DiscordRPC.updatePresence(arg_74_1)

			reloaded_0_20.DiscordRPC.Time = globals.curtime
		end
	end,
	Destroy = function()
		reloaded_0_20.DiscordRPC.clearPresence()
		panorama.loadstring("            if (waitForUpdateEventHandler_Upd != null) {\n                $.UnregisterForUnhandledEvent(\"PanoramaComponent_Lobby_MatchmakingSessionUpdate\", waitForUpdateEventHandler_Upd);\n            }\n        ")
	end
}
local reloaded_0_34 = {
	OpenLink = function(arg_76_0, arg_76_1)
		panorama.SteamOverlayAPI.OpenExternalBrowserURL(arg_76_1)
	end,
	GetName = function()
		return panorama.MyPersonaAPI.GetName()
	end,
	Blur = function(arg_78_0, arg_78_1)
		arg_78_1 = arg_78_1 == false and 1 or 0

		local reloaded_78_0 = cvar["@panorama_disable_blur"]

		if reloaded_78_0:int() ~= arg_78_1 then
			reloaded_78_0:int(arg_78_1)
		end
	end
}
local reloaded_0_35 = {
	Spectators = {
		List = {}
	}
}

network.get("http://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_medium.jpg", {}, function(arg_79_0)
	print("reloaded_debug: trying to load image " .. tostring(arg_79_0))
	reloaded_0_35.Spectators.Undefined = render.load_image(arg_79_0, vector(128, 128))
end)

local function reloaded_0_36()
	local reloaded_80_0 = entity.get_local_player()

	if reloaded_80_0 == nil then
		reloaded_0_35.Spectators.List = {}

		return
	end

	if reloaded_0_35.Spectators.List == nil then
		reloaded_0_35.Spectators.List = {}
	end

	for iter_80_0, iter_80_1 in pairs(reloaded_0_35.Spectators.List) do
		iter_80_1.active = false
	end

	if reloaded_80_0:is_alive() then
		if reloaded_80_0:get_spectators() == nil then
			return
		end

		for iter_80_2, iter_80_3 in pairs(reloaded_80_0:get_spectators()) do
			local reloaded_80_1 = 0

			if reloaded_0_35.Spectators.List == nil then
				reloaded_0_35.Spectators.List = {}
			end

			for iter_80_4, iter_80_5 in pairs(reloaded_0_35.Spectators.List) do
				local reloaded_80_2 = "" .. iter_80_3:get_name()

				if iter_80_5.name == reloaded_80_2 then
					reloaded_80_1 = iter_80_4
				end
			end

			if reloaded_80_1 == 0 then
				local reloaded_80_3 = "" .. iter_80_3:get_name()

				table.insert(reloaded_0_35.Spectators.List, {
					active = false,
					user = iter_80_3,
					name = reloaded_80_3,
					avatar = iter_80_3:get_steam_avatar()
				})
			else
				reloaded_0_35.Spectators.List[reloaded_80_1].active = true
			end
		end
	elseif reloaded_80_0.m_hObserverTarget ~= nil then
		if entity.get(reloaded_80_0.m_hObserverTarget:get_index()):get_spectators() == nil then
			return
		end

		for iter_80_6, iter_80_7 in pairs(entity.get(reloaded_80_0.m_hObserverTarget:get_index()):get_spectators()) do
			local reloaded_80_4 = 0

			if reloaded_0_35.Spectators.List == nil then
				reloaded_0_35.Spectators.List = {}
			end

			for iter_80_8, iter_80_9 in pairs(reloaded_0_35.Spectators.List) do
				local reloaded_80_5 = "" .. iter_80_7:get_name()

				if iter_80_9.name == reloaded_80_5 then
					reloaded_80_4 = iter_80_8
				end
			end

			if reloaded_80_4 == 0 then
				local reloaded_80_6 = "" .. iter_80_7:get_name()

				table.insert(reloaded_0_35.Spectators.List, {
					active = false,
					user = iter_80_7,
					name = reloaded_80_6,
					avatar = iter_80_7:get_steam_avatar()
				})
			else
				reloaded_0_35.Spectators.List[reloaded_80_4].active = true
			end
		end
	end
end

function reloaded_0_21.Register(arg_81_0, arg_81_1, arg_81_2, arg_81_3)
	if type(arg_81_2) == "function" then
		arg_81_3 = arg_81_2
		arg_81_2 = {
			12,
			0
		}
	end

	local reloaded_81_0 = {
		Widgetging = false,
		Size = vector(arg_81_1[3], arg_81_1[4]),
		Position = vector(arg_81_1[1]:get(), arg_81_1[2]:get()),
		Shot = {
			Status = true,
			Limit = (arg_81_2 ~= nil and (arg_81_2[1] ~= nil and arg_81_2[1] or 12) or 12) + (arg_81_2 ~= nil and (arg_81_2[2] ~= nil and arg_81_2[2] or 0) or 0),
			Widget = arg_81_2 ~= nil and (arg_81_2[2] ~= nil and arg_81_2[2] or 0) or 0
		},
		PWidget = vector(),
		Callback = arg_81_3,
		Index = #reloaded_0_21.Inventory + 1,
		Other = {
			x = arg_81_1[1],
			y = arg_81_1[2]
		}
	}

	table.insert(reloaded_0_21.Inventory, reloaded_81_0)

	return setmetatable(reloaded_81_0, reloaded_0_21)
end

function reloaded_0_21.Restrictions(arg_82_0)
	if arg_82_0.Position.x <= 0 then
		arg_82_0.Position.x = 0
	end

	if arg_82_0.Position.x + arg_82_0.Size.x >= reloaded_0_20.Screen.x then
		arg_82_0.Position.x = reloaded_0_20.Screen.x - arg_82_0.Size.x
	end

	if arg_82_0.Position.y <= 0 then
		arg_82_0.Position.y = 0
	end

	if arg_82_0.Position.y + arg_82_0.Size.y >= reloaded_0_20.Screen.y then
		arg_82_0.Position.y = reloaded_0_20.Screen.y - arg_82_0.Size.y
	end
end

function reloaded_0_21.Location(arg_83_0, arg_83_1)
	if arg_83_1.x >= arg_83_0.Position.x - arg_83_0.Shot.Limit and arg_83_1.x <= arg_83_0.Position.x + arg_83_0.Size.x + arg_83_0.Shot.Limit and arg_83_1.y >= arg_83_0.Position.y - arg_83_0.Shot.Limit and arg_83_1.y <= arg_83_0.Position.y + arg_83_0.Size.y + arg_83_0.Shot.Limit then
		arg_83_0.Shot.Status = false
	end

	return arg_83_1.x >= arg_83_0.Position.x - arg_83_0.Shot.Widget and arg_83_1.x <= arg_83_0.Position.x + arg_83_0.Size.x + arg_83_0.Shot.Widget and arg_83_1.y >= arg_83_0.Position.y - arg_83_0.Shot.Widget and arg_83_1.y <= arg_83_0.Position.y + arg_83_0.Size.y + arg_83_0.Shot.Widget
end

function reloaded_0_21.Update(arg_84_0, ...)
	if common.is_button_released(1) then
		arg_84_0.Shot.Status = true
	end

	if ui.get_alpha() > 0.5 then
		local reloaded_84_0 = ui.get_mouse_position()
		local reloaded_84_1 = arg_84_0:Location(reloaded_84_0)
		local reloaded_84_2 = reloaded_0_20.IsKeyDown(1)

		if (reloaded_84_1 or arg_84_0.Widgetging) and reloaded_84_2 and (reloaded_0_21.Active == "" or reloaded_0_21.Active == arg_84_0.Index) then
			reloaded_0_21.Active = arg_84_0.Index

			if not arg_84_0.Widgetging then
				arg_84_0.Widgetging = true
				arg_84_0.PWidget = reloaded_84_0 - arg_84_0.Position
			else
				arg_84_0.Position = reloaded_84_0 - arg_84_0.PWidget

				arg_84_0:Restrictions()
				arg_84_0.Other.x:set(reloaded_0_24.Round(arg_84_0.Position.x))
				arg_84_0.Other.y:set(reloaded_0_24.Round(arg_84_0.Position.y))
			end
		elseif not reloaded_84_2 then
			reloaded_0_21.Active = ""
			arg_84_0.Widgetging = false
			arg_84_0.PWidget = vector()
		end
	end

	arg_84_0.Callback(arg_84_0, ...)
end

function reloaded_0_21.Template(arg_85_0, arg_85_1)
	local reloaded_85_0 = {
		Index = arg_85_1.Index or "1",
		Name = arg_85_1.Name or nil,
		Position = arg_85_1.Position or {
			0,
			0
		},
		Size = arg_85_1.Size or {
			0,
			0
		},
		Speed = arg_85_1.Speed or 7.5,
		Mode = arg_85_1.Mode or {
			"[",
			"]",
			"holding",
			"toggled"
		},
		Length = arg_85_1.Length or 120,
		Alpha = arg_85_1.Alpha or 1,
		Edges = arg_85_1.Edges or 3,
		Between = arg_85_1.Between or 10,
		FirstIndent = arg_85_1.FirstIndent or 20,
		Indent = arg_85_1.Indent or 12.5,
		ColorLeft = arg_85_1.ColorLeft or color(255, 255, 255, 255),
		ColorRight = arg_85_1.ColorRight or color(255, 255, 255, 255),
		Font = arg_85_1.Font or 1,
		Flag = arg_85_1.Flag or "o",
		Extended = arg_85_1.Extended or false,
		LowerLeft = arg_85_1.LowerLeft or false,
		LowerRight = arg_85_1.LowerRight or false,
		UpperLeft = arg_85_1.UpperLeft or false,
		UpperRight = arg_85_1.UpperRight or false,
		List = arg_85_1.List or reloaded_0_35.Spectators.List,
		AVASize = arg_85_1.AVASize or 12.5,
		NameLimit = arg_85_1.NameLimit or 1000
	}

	if arg_85_1 == nil then
		return "[MTools.Widget.Template] The arguments are not specified."
	end

	reloaded_85_0.Name = arg_85_1.Name or nil

	if reloaded_85_0.Name == nil then
		return "[MTools.Widget.Template] The name argument is not specified."
	end

	reloaded_85_0.Position = reloaded_85_0.Position == nil and {
		x = reloaded_85_0.Position[1],
		y = reloaded_85_0.Position[2]
	} or reloaded_85_0.Position
	reloaded_85_0.Size = reloaded_85_0.Size == nil and {
		x = reloaded_85_0.Position[3],
		y = reloaded_85_0.Position[4]
	} or reloaded_85_0.Size

	if reloaded_85_0.Position == nil or reloaded_85_0.Size == nil then
		return "[MTools.Widget.Template] No position or size argument is specified."
	end

	if string.lower(reloaded_85_0.Name) == "keybinds" then
		reloaded_0_31:Register("MTools.Auto.Template.Keybinds." .. reloaded_85_0.Index)
		reloaded_0_31:Update("MTools.Auto.Template.Keybinds." .. reloaded_85_0.Index, reloaded_85_0.Speed)

		local reloaded_85_1 = {
			Alpha = false,
			Y = reloaded_85_0.FirstIndent,
			Binds = ui.get_binds()
		}

		for iter_85_0, iter_85_1 in pairs(reloaded_85_1.Binds) do
			local reloaded_85_2 = iter_85_1.name
			local reloaded_85_3 = ""

			local function reloaded_85_4(arg_86_0, arg_86_1)
				local reloaded_86_0 = ""

				for iter_86_0, iter_86_1 in pairs(arg_86_0) do
					if arg_86_1 ~= nil then
						reloaded_86_0 = reloaded_86_0 .. ", " .. string.sub(iter_86_1, 1, arg_86_1)
					else
						reloaded_86_0 = reloaded_86_0 .. ", " .. iter_86_1
					end
				end

				local reloaded_86_1 = reloaded_86_0:sub(3)

				if #arg_86_0 == 0 then
					reloaded_86_1 = "nothing"
				end

				if reloaded_85_0.LowerRight then
					reloaded_86_1 = string.lower(reloaded_86_1)
				end

				if reloaded_85_0.UpperRight then
					reloaded_86_1 = string.upper(reloaded_86_1)
				end

				return reloaded_86_1
			end

			if reloaded_85_0.LowerLeft then
				reloaded_85_2 = string.lower(reloaded_85_2)
			end

			if reloaded_85_0.UpperLeft then
				reloaded_85_2 = string.upper(reloaded_85_2)
			end

			if reloaded_85_0.Extended ~= false then
				local reloaded_85_5 = iter_85_1.value

				if type(reloaded_85_5) == "table" then
					reloaded_85_5 = reloaded_85_4(iter_85_1.value, tonumber(reloaded_85_0.Extended) == nil and 1 or reloaded_85_0.Extended)
				end

				if reloaded_85_0.LowerRight then
					reloaded_85_0.Mode[1] = string.lower(reloaded_85_0.Mode[1])
					reloaded_85_0.Mode[2] = string.lower(reloaded_85_0.Mode[2])

					if #reloaded_85_0.Mode > 2 then
						reloaded_85_0.Mode[3] = string.lower(reloaded_85_0.Mode[3])
						reloaded_85_0.Mode[4] = string.lower(reloaded_85_0.Mode[4])
					end
				end

				if reloaded_85_0.UpperRight then
					reloaded_85_0.Mode[1] = string.upper(reloaded_85_0.Mode[1])
					reloaded_85_0.Mode[2] = string.upper(reloaded_85_0.Mode[2])

					if #reloaded_85_0.Mode > 2 then
						reloaded_85_0.Mode[3] = string.upper(reloaded_85_0.Mode[3])
						reloaded_85_0.Mode[4] = string.upper(reloaded_85_0.Mode[4])
					end
				end

				if reloaded_85_5 == false then
					if #reloaded_85_0.Mode == 2 then
						reloaded_85_3 = iter_85_1.mode == 1 and reloaded_85_0.Mode[1] or reloaded_85_0.Mode[2]
					else
						reloaded_85_3 = iter_85_1.mode == 1 and reloaded_85_0.Mode[1] .. reloaded_85_0.Mode[3] .. reloaded_85_0.Mode[2] or reloaded_85_0.Mode[1] .. reloaded_85_0.Mode[4] .. reloaded_85_0.Mode[2]
					end
				elseif #reloaded_85_0.Mode == 2 then
					reloaded_85_3 = reloaded_85_5 ~= true and reloaded_85_5 or iter_85_1.mode == 1 and reloaded_85_0.Mode[1] or reloaded_85_0.Mode[2]
				else
					reloaded_85_3 = reloaded_85_5 ~= true and reloaded_85_0.Mode[1] .. reloaded_85_5 .. reloaded_85_0.Mode[2] or iter_85_1.mode == 1 and reloaded_85_0.Mode[1] .. reloaded_85_0.Mode[3] .. reloaded_85_0.Mode[2] or reloaded_85_0.Mode[1] .. reloaded_85_0.Mode[4] .. reloaded_85_0.Mode[2]
				end
			elseif #reloaded_85_0.Mode == 2 then
				if iter_85_1.mode == 1 then
					reloaded_85_3 = reloaded_85_0.Mode[1]
				elseif iter_85_1.mode == 2 then
					reloaded_85_3 = reloaded_85_0.Mode[2]
				else
					reloaded_85_3 = reloaded_85_0.Mode[1]
				end
			elseif iter_85_1.mode == 1 then
				reloaded_85_3 = reloaded_85_0.Mode[1] .. reloaded_85_0.Mode[3] .. reloaded_85_0.Mode[2]
			elseif iter_85_1.mode == 2 then
				reloaded_85_3 = reloaded_85_0.Mode[1] .. reloaded_85_0.Mode[4] .. reloaded_85_0.Mode[2]
			else
				reloaded_85_3 = reloaded_85_0.Mode[1] .. reloaded_85_0.Mode[3] .. reloaded_85_0.Mode[2]
			end

			local reloaded_85_6 = {
				Name = render.measure_text(reloaded_85_0.Font, reloaded_85_0.Flag, reloaded_85_2).x,
				Mode = render.measure_text(reloaded_85_0.Font, reloaded_85_0.Flag, reloaded_85_3).x
			}

			if iter_85_1.active then
				reloaded_85_1.Alpha = true
			end

			if reloaded_85_6.Name + reloaded_85_6.Mode + reloaded_85_0.Between + reloaded_85_0.Edges * 2 > reloaded_85_0.Length then
				reloaded_85_0.Length = reloaded_85_6.Name + reloaded_85_6.Mode + reloaded_85_0.Between + reloaded_85_0.Edges * 2
			end

			local reloaded_85_7 = reloaded_0_31:Lerp("MTools.Auto.Template.Keybinds." .. reloaded_85_0.Index, reloaded_85_2, not iter_85_1.active) * reloaded_85_0.Alpha

			render.text(reloaded_85_0.Font, vector(reloaded_85_0.Position.x + reloaded_85_0.Edges, reloaded_85_0.Position.y + reloaded_85_1.Y), reloaded_85_0.ColorLeft * color(255, 255, 255, 255 * reloaded_85_7), reloaded_85_0.Flag, reloaded_85_2)
			render.text(reloaded_85_0.Font, vector(reloaded_85_0.Position.x + reloaded_85_0.Size.x - reloaded_85_6.Mode - reloaded_85_0.Edges, reloaded_85_0.Position.y + reloaded_85_1.Y), reloaded_85_0.ColorRight * color(255, 255, 255, 255 * reloaded_85_7), reloaded_85_0.Flag, reloaded_85_3)

			reloaded_85_1.Y = reloaded_85_1.Y + reloaded_85_0.Indent * reloaded_85_7
		end

		return {
			Alpha = reloaded_85_1.Alpha,
			Length = reloaded_85_0.Length,
			Height = reloaded_85_1.Y
		}
	end

	if string.lower(reloaded_85_0.Name) == "spectators" then
		reloaded_0_36()
		reloaded_0_31:Register("MTools.Auto.Template.Spectators." .. reloaded_85_0.Index)
		reloaded_0_31:Update("MTools.Auto.Template.Spectators." .. reloaded_85_0.Index, reloaded_85_0.Speed)

		local reloaded_85_8 = {
			Alpha = false,
			Y = reloaded_85_0.FirstIndent,
			List = reloaded_85_0.List
		}

		for iter_85_2, iter_85_3 in pairs(reloaded_85_8.List) do
			local reloaded_85_9 = iter_85_3.name

			if iter_85_3.avatar == nil or iter_85_3.avatar.width <= 5 then
				iter_85_3.avatar = reloaded_0_35.Spectators.Undefined
			end

			if iter_85_3.active then
				reloaded_85_8.Alpha = true
			end

			if reloaded_85_0.LowerLeft then
				reloaded_85_9 = string.lower(reloaded_85_9)
			end

			if reloaded_85_0.UpperLeft then
				reloaded_85_9 = string.upper(reloaded_85_9)
			end

			reloaded_85_9 = string.len(reloaded_85_9) > reloaded_85_0.NameLimit and string.sub(reloaded_85_9, 0, reloaded_85_0.NameLimit) .. "..." or reloaded_85_9

			local reloaded_85_10 = reloaded_0_31:Lerp("MTools.Auto.Template.Spectators." .. reloaded_85_0.Index, reloaded_85_9, not iter_85_3.active) * reloaded_85_0.Alpha
			local reloaded_85_11 = render.measure_text(reloaded_85_0.Font, reloaded_85_0.Flag, reloaded_85_9).x

			if reloaded_85_11 + (reloaded_85_0.Between + reloaded_85_0.Edges * 2) + 8 > reloaded_85_0.Length and iter_85_3.active then
				reloaded_85_0.Length = reloaded_85_11 + (reloaded_85_0.Between + reloaded_85_0.Edges * 2) + 8
			end

			render.text(reloaded_85_0.Font, vector(reloaded_85_0.Position.x + reloaded_85_0.Edges, reloaded_85_0.Position.y + reloaded_85_8.Y + 1), reloaded_85_0.ColorLeft * color(255, 255, 255, 255 * reloaded_85_10), reloaded_85_0.Flag, reloaded_85_9)

			if iter_85_3.avatar ~= nil then
				render.texture(iter_85_3.avatar, vector(reloaded_85_0.Position.x + reloaded_85_0.Size.x - reloaded_85_0.AVASize - reloaded_85_0.Edges, reloaded_85_0.Position.y + reloaded_85_8.Y + 2), vector(math.floor(reloaded_85_0.AVASize), math.floor(reloaded_85_0.AVASize)), reloaded_85_0.ColorRight * color(255, 255, 255, 255 * reloaded_85_10), "f", 2)
			end

			reloaded_85_8.Y = reloaded_85_8.Y + reloaded_85_0.Indent * reloaded_85_10
		end

		return {
			Alpha = reloaded_85_8.Alpha,
			Length = reloaded_85_0.Length,
			Height = reloaded_85_8.Y
		}
	end
end

function reloaded_0_21.GetAntiShot()
	local reloaded_87_0 = true

	for iter_87_0, iter_87_1 in pairs(reloaded_0_21.Inventory) do
		reloaded_87_0 = reloaded_87_0 and iter_87_1.Shot.Status
	end

	reloaded_0_21.AntiShot = true

	return reloaded_87_0
end

function reloaded_0_21.GetDev()
	return reloaded_0_35
end

function reloaded_0_22.Register(arg_89_0, arg_89_1, arg_89_2, ...)
	if arg_89_1 and type(arg_89_1) == "function" then
		local reloaded_89_0 = {
			...
		}
		local reloaded_89_1

		local function reloaded_89_2()
			pcall(arg_89_1, reloaded_89_0)

			if arg_89_2 and type(arg_89_2) == "userdata" then
				ffi.C.LeaveCriticalSection(arg_89_2)
			end

			reloaded_0_15(reloaded_89_1)
		end

		local reloaded_89_3 = tonumber(ffi.cast("intptr_t", ffi.cast("void*", ffi.cast("void*(*)()", reloaded_89_2))))
		local reloaded_89_4 = {
			Handle = reloaded_0_14(reloaded_89_3, 0, 0),
			Destroy = function(arg_91_0)
				if arg_89_2 and type(arg_89_2) == "userdata" then
					ffi.C.LeaveCriticalSection(arg_89_2)
				end

				ffi.C.TerminateThread(arg_91_0.Handle, 0)
				reloaded_0_15(reloaded_89_1)

				arg_91_0.Handle = nil
			end
		}

		reloaded_89_1 = reloaded_89_4.Handle

		table.insert(arg_89_0.Threads, reloaded_89_4)

		return reloaded_89_4
	end
end

function reloaded_0_22.Destroy(arg_92_0)
	for iter_92_0 = 1, #arg_92_0.Threads do
		arg_92_0.Threads[iter_92_0]:Destroy()
	end

	for iter_92_1 = 1, #arg_92_0.Criticals do
		arg_92_0.Criticals[iter_92_1]:Destroy()
	end
end

events.render:set(function()
	if #reloaded_0_21.Inventory > 0 then
		for iter_93_0, iter_93_1 in pairs(reloaded_0_21.Inventory) do
			if ui.get_alpha() > 0.5 and not iter_93_1.Shot.Status and reloaded_0_21.AntiShot then
				utils.console_exec("-attack")
				utils.console_exec("-attack2")
			end

			iter_93_1.Position.x = reloaded_0_24.Round(iter_93_1.Other.x:get())
			iter_93_1.Position.y = reloaded_0_24.Round(iter_93_1.Other.y:get())

			iter_93_1:Restrictions()
		end
	end

	reloaded_0_21.AntiShot = false
	reloaded_0_20.Tick.Check = false
end)
events.shutdown:set(function()
	reloaded_0_22:Destroy()
end)
events.createmove:set(function(arg_95_0)
	if reloaded_0_20.Tick.Check ~= false then
		local reloaded_95_0 = false
		local reloaded_95_1 = (arg_95_0.send_packet == false or globals.choked_commands > 1) and true or false

		if arg_95_0.command_number % reloaded_0_20.Tick.Check > 0 and reloaded_95_1 == false then
			reloaded_0_20.Tick.Num = reloaded_0_20.Tick.Num + 1

			if reloaded_0_20.Tick.Num > reloaded_0_20.Tick.Check then
				reloaded_0_20.Tick.Num = 1
			end
		end
	end

	if reloaded_0_20.AnimLayers.Reset then
		arg_95_0.animate_move_lean = true
	end
end)

return {
	Auxiliary = reloaded_0_20,
	Table = reloaded_0_25,
	String = reloaded_0_23,
	Number = reloaded_0_24,
	FileSystem = reloaded_0_26,
	Network = reloaded_0_27,
	Client = reloaded_0_28,
	Render = reloaded_0_29,
	Secret = reloaded_0_30,
	Animation = reloaded_0_31,
	AntiAims = reloaded_0_32,
	Widget = reloaded_0_21,
	Threading = reloaded_0_22,
	DiscordRPC = reloaded_0_33,
	Panorama = reloaded_0_34
}
