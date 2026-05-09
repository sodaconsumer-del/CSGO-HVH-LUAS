--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

slot_0_0_1 = nil
slot_0_0_0 = ws.GetBuildID() == 0 and 0 or ws.GetTitle():find("%[alpha%]") and 2 or 1
slot_0_1_0 = 0.015625
slot_0_2_0 = {
	healthshot_offset = 5776,
	jb = gui.ctx:Find("misc>movement>jumpbug"),
	rb = gui.ctx:Find("rage>aimbot>general>aimbot"),
	ns = gui.ctx:Find("rage>aimbot>nospread"),
	fns = gui.ctx:Find("rage>aimbot>nospread>settings>force"),
	es = gui.ctx:Find("misc>movement>easy strafe"),
	ej = gui.ctx:Find("misc>movement>edge jump")
}

ffi.cdef("    typedef void* (__cdecl *InstantiateInterfaceFn_t)();\n \n    typedef struct CInterfaceRegister {\n        InstantiateInterfaceFn_t fnCreate;\n        const char* szName;\n        struct CInterfaceRegister* pNext;\n    } CInterfaceRegister;\n")

slot_0_3_0 = {
	vtable_entry = function(arg_1_0, arg_1_1, arg_1_2)
		return ffi.cast(arg_1_2, ffi.cast("void***", arg_1_0)[0][arg_1_1])
	end,
	create_interface = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		local var_2_0 = utils.FindExport(arg_2_0, "CreateInterface")
		local var_2_1 = ffi.cast("void*", var_2_0)

		return (ffi.cast("void*(__cdecl*)(const char*, void*)", var_2_1)(arg_2_1, nil))
	end,
	find_pattern_cast = function(arg_3_0, arg_3_1, arg_3_2)
		local var_3_0 = ffi.cast("uintptr_t", utils.FindPattern(arg_3_0, arg_3_1))

		return ffi.cast(arg_3_2 or "void*", var_3_0)
	end,
	absolute = function(arg_4_0, arg_4_1, arg_4_2)
		assert(arg_4_0 ~= 545ULL, "Outdated Base!")

		arg_4_0 = ffi.cast("uintptr_t", arg_4_0)
		arg_4_0 = arg_4_0 + (arg_4_1 or 1)
		arg_4_0 = arg_4_0 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_4_0)[0])
		arg_4_0 = arg_4_0 + (arg_4_2 or 0)

		return arg_4_0
	end,
	to_relative_address = function(arg_5_0, arg_5_1, arg_5_2)
		local var_5_0 = ffi.cast("int32_t*", arg_5_0 + arg_5_1)[0]
		local var_5_1 = ffi.cast("uintptr_t", arg_5_0) + arg_5_2

		return ffi.cast("uint8_t*", var_5_1 + var_5_0)
	end
}

function slot_0_3_0.get_register_list(arg_6_0)
	local var_6_0 = utils.FindExport(arg_6_0, "CreateInterface")

	if var_6_0 == 0 then
		return
	end

	return ffi.cast("CInterfaceRegister**", slot_0_3_0.to_relative_address(var_6_0, 3, 7))[0]
end

function slot_0_3_0.get_interface_from_register(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0

	while var_7_0 do
		if ffi.string(var_7_0.szName):find(arg_7_1, 1, true) then
			return var_7_0.fnCreate()
		end

		var_7_0 = var_7_0.pNext
	end
end

function slot_0_3_0.vtable_thunk(arg_8_0, arg_8_1)
	local var_8_0 = ffi.typeof(arg_8_1)

	return function(arg_9_0, ...)
		if arg_9_0 then
			return slot_0_3_0.vtable_entry(arg_9_0, arg_8_0, var_8_0)(arg_9_0, ...)
		end
	end
end

function slot_0_3_0.vtable_bind(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = slot_0_3_0.create_interface(arg_10_0, arg_10_1)
	local var_10_1 = slot_0_3_0.vtable_thunk(arg_10_2, arg_10_3)

	return function(...)
		return var_10_1(var_10_0, ...)
	end
end

slot_0_3_0.virtual_alloc = ffi.cast("void*(__stdcall*)(void*, size_t, uint32_t, uint32_t)", utils.FindExport("kernel32.dll", "VirtualAlloc"))
slot_0_3_0.virtual_protect = ffi.cast("bool(__stdcall*)(void*, size_t, uint32_t, uint32_t*)", utils.FindExport("kernel32.dll", "VirtualProtect"))

function slot_0_3_0.allocate_near_call(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0 + 5
	local var_12_1 = 2147483647

	for iter_12_0 = 4096, var_12_1, 65536 do
		local var_12_2 = var_12_0 - iter_12_0

		if var_12_2 > 0 then
			local var_12_3 = slot_0_3_0.virtual_alloc(ffi.cast("void*", var_12_2), arg_12_1, 12288, 64)

			if var_12_3 ~= ffi.NULL then
				return var_12_3, true
			end
		end

		local var_12_4 = var_12_0 + iter_12_0
		local var_12_5 = slot_0_3_0.virtual_alloc(ffi.cast("void*", var_12_4), arg_12_1, 12288, 64)

		if var_12_5 ~= ffi.NULL then
			return var_12_5, false
		end
	end

	error("WARNING: Could not allocate near call, relative jump may fail")

	return slot_0_3_0.virtual_alloc(nil, arg_12_1, 12288, 64), nil
end

slot_0_4_1 = nil
slot_0_5_1 = ffi.cast("void*(__cdecl*)(void*, unsigned int, const char*, ...)", slot_0_3_0.absolute(utils.FindPattern("client.dll", "E8 ? ? ? ? 49 8B 4E ? BA ? ? ? ? 48 83 C1 ? E8")))
slot_0_6_1 = ffi.cast("void*(__fastcall*)(const char*)", utils.FindPattern("client.dll", "4C 8B DC 53 48 83 EC 50 48 8B 05"))

function slot_0_4_0(arg_13_0)
	local var_13_0 = slot_0_6_1("HudChatDelegate")

	if not var_13_0 then
		return
	end

	slot_0_5_1(var_13_0, -1, tostring(arg_13_0))
end

slot_0_5_0 = {
	print = print
}

function print(arg_14_0)
	slot_0_5_0.print(tostring(arg_14_0))
	slot_0_4_0(string.format("\x12\fcelerity \x01| %s", tostring(arg_14_0)))
end

ffi.cdef("    typedef struct {\n        const char* szName;\n        void* m_pNext;\n        char pad1[0x10];\n        const char* szDescription;\n        uint32_t nType;\n        uint32_t nRegistered;\n        uint32_t nFlags;\n        char pad2[0x15];\n        union {\n            bool i1;\n            short i16;\n            uint16_t u16;\n            int i32;\n            uint32_t u32;\n            int64_t i64;\n            uint64_t u64;\n            float fl;\n            double db;\n            const char* sz;\n        } value;\n    } CConVar;\n \n    typedef struct {\n        CConVar* element;\n        unsigned short prev;\n        unsigned short next;\n    } UtlLinkedListElement_t;\n \n    typedef struct {\n        int size;\n        UtlLinkedListElement_t* data;\n    } CUtlLeanVector;\n \n    typedef struct \n    {\n        CUtlLeanVector memory;\n        unsigned short iHead;\n        unsigned short iTail;\n        unsigned short iFirstFree;\n        unsigned short nElementCount;\n        unsigned short nAllocated;\n        UtlLinkedListElement_t* pElements;\n    } CUtlLinkedList;\n \n    typedef struct {\n        char pad[0x40];\n        CUtlLinkedList listConvars;\n    } IEngineCVar;\n")

slot_0_6_0 = {
	flags = {
		FCVAR_CLIENTDLL = 8,
		FCVAR_LINKED_CONCOMMAND = 1,
		FCVAR_HIDDEN = 16,
		FCVAR_GAMEDLL = 4,
		FCVAR_MENUBAR_ITEM = 1048576,
		FCVAR_EXECUTE_PER_TICK = 536870912,
		FCVAR_DONTRECORD = 131072,
		FCVAR_DEVELOPMENTONLY = 2,
		FCVAR_DEMO = 65536,
		FCVAR_CLIENT_CAN_EXECUTE = 33554432,
		FCVAR_CLIENTCMD_CAN_EXECUTE = 268435456,
		FCVAR_CHEAT = 16384,
		FCVAR_ARCHIVE = 128,
		FCVAR_VCONSOLE_SET_FOCUS = 134217728,
		FCVAR_VCONSOLE_FUZZY_MATCHING = 8388608,
		FCVAR_USERINFO = 512,
		FCVAR_UNLOGGED = 2048,
		FCVAR_SPONLY = 64,
		FCVAR_SERVER_CAN_EXECUTE = 16777216,
		FCVAR_SERVER_CANNOT_QUERY = 67108864,
		FCVAR_REPLICATED = 8192,
		FCVAR_RELEASE = 524288,
		FCVAR_PROTECTED = 32,
		FCVAR_PER_USER = 32768,
		FCVAR_NOT_CONNECTED = 4194304,
		FCVAR_NOTIFY = 256,
		FCVAR_NONE = 0,
		FCVAR_MISSING3 = 2097152,
		FCVAR_MISSING2 = 262144,
		FCVAR_MISSING1 = 4096,
		FCVAR_MISSING0 = 1024
	},
	tier0 = slot_0_3_0.get_register_list("tier0.dll")
}

if not slot_0_6_0.tier0 then
	error("#1")
end

slot_0_6_0.CVarEngine = ffi.cast("IEngineCVar*", slot_0_3_0.get_interface_from_register(slot_0_6_0.tier0, "VEngineCvar00"))

if not slot_0_6_0.CVarEngine then
	error("#2")
end

function slot_0_6_0.get_convar(arg_15_0)
	for iter_15_0 = slot_0_6_0.CVarEngine.listConvars.iHead, slot_0_6_0.CVarEngine.listConvars.iTail do
		local var_15_0 = slot_0_6_0.CVarEngine.listConvars.memory.data[iter_15_0].element

		if not var_15_0 or not var_15_0.szName then
			-- block empty
		elseif ffi.string(var_15_0.szName) == arg_15_0 then
			return var_15_0
		end
	end
end

ffi.cdef("    typedef struct {\n        char m_strName;\n        uint64_t m_nExtension;\n        uint64_t m_nExtension2;\n    } TypedResourceName;\n")

slot_0_7_0 = {
	fnPreCache = slot_0_3_0.vtable_bind("resourcesystem.dll", "ResourceSystem013", 41, "void**(__thiscall*)(void*, TypedResourceName*, const char*)"),
	fnLoadResource = slot_0_3_0.vtable_bind("resourcesystem.dll", "ResourceSystem013", 40, "void**(__thiscall*)(void*, TypedResourceName*, const char*)")
}

function slot_0_7_0.load(arg_16_0)
	local var_16_0 = ffi.new("TypedResourceName[1]")

	slot_0_7_0.fnPreCache(var_16_0, arg_16_0)

	local var_16_1 = slot_0_7_0.fnLoadResource(var_16_0, "")

	if var_16_1 ~= nil and var_16_1[0] == nil then
		local var_16_2 = ffi.cast("uint32_t*", ffi.cast("uintptr_t", var_16_1) + 24)

		if var_16_2[0] == 0 then
			var_16_2[0] = 1
		end
	end
end

ffi.cdef("    typedef struct CParticleColor {\n        float r, g, b;\n    } CParticleColor;\n\n    typedef struct CParticleInformation {\n        float m_flTime;\n        float m_flWidth;\n        float m_flAlpha;\n    } CParticleInformation;\n")

slot_0_8_0 = {}
slot_0_9_1 = ffi.cast("void**", slot_0_3_0.absolute(slot_0_3_0.find_pattern_cast("client.dll", "4C 8B 15 ? ? ? ? 83 FB FF"), 3))
slot_0_10_1 = slot_0_9_1[0]
slot_0_11_1 = slot_0_3_0.find_pattern_cast("client.dll", "4C 8B DC 53 48 81 EC 90 00 00 00 F2", "void(__fastcall*)(void*, unsigned int*, const char*, int, __int64, __int64, __int64, int)")
slot_0_12_1 = slot_0_3_0.find_pattern_cast("client.dll", "48 89 5C 24 08 48 89 74 24 10 57 48 83 EC 50 F3 0F 10 1D ? ? ? ? 41 8B F8 8B DA 4C", "void(__fastcall*)(void*, unsigned int, int, void*, int)")
slot_0_13_1 = slot_0_3_0.find_pattern_cast("client.dll", "48 89 74 24 10 57 48 83 EC 30 4C 8B D9 49 8B F9 33 C9 41 8B F0 83 FA FF 0F", "void(__fastcall*)(void*, int, unsigned int, void*)")
slot_0_14_1 = slot_0_3_0.find_pattern_cast("client.dll", "83 FA ? 0F 84 ? ? ? ? 41 54", "void(__fastcall*)(void*, int, bool, bool)")
slot_0_15_2 = slot_0_3_0.create_interface("particles.dll", "ParticleSystemMgr003")
slot_0_16_3 = slot_0_3_0.vtable_entry(slot_0_15_2, 41, "void(__fastcall*)(void*, void*, uintptr_t*)")
slot_0_17_3 = slot_0_3_0.vtable_entry(slot_0_15_2, 42, "void(__fastcall*)(void*, void*, int, void*)")
slot_0_18_2 = slot_0_3_0.vtable_entry(slot_0_10_1, 3, "void(__fastcall*)(void*, int)")
slot_0_19_2 = ffi.typeof("struct { float x, y, z; }")
slot_0_20_2 = ffi.typeof("struct {$* m_vecPositions; char pad[0x148]; }", slot_0_19_2)
slot_0_21_2 = {}

function slot_0_8_0.release(arg_17_0)
	slot_0_14_1(slot_0_10_1, arg_17_0, true, true)
	slot_0_18_2(slot_0_10_1, arg_17_0)
end

function slot_0_8_0.update()
	slot_0_10_1 = slot_0_9_1[0]
end

function slot_0_8_0.clean()
	for iter_19_0, iter_19_1 in pairs(slot_0_21_2) do
		slot_0_8_0.release(iter_19_0)
	end
end

function slot_0_8_0.create(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5, arg_20_6, arg_20_7)
	local var_20_0 = ffi.new("uint32_t[1]")
	local var_20_1 = ffi.new("struct CParticleColor[1]")

	var_20_1[0].r = arg_20_2
	var_20_1[0].g = arg_20_3
	var_20_1[0].b = arg_20_4

	slot_0_11_1(slot_0_10_1, var_20_0, arg_20_1, 2, 0, 0, 0, 0)

	local var_20_2 = var_20_0[0]

	slot_0_12_1(slot_0_10_1, var_20_2, 16, var_20_1, 0)

	local var_20_3 = ffi.new("struct CParticleInformation[1]")

	var_20_3[0].m_flTime = arg_20_6
	var_20_3[0].m_flWidth = arg_20_7
	var_20_3[0].m_flAlpha = arg_20_5 / 255

	slot_0_12_1(slot_0_10_1, var_20_2, 3, var_20_3, 0)

	local var_20_4 = ffi.new(slot_0_20_2)
	local var_20_5 = ffi.typeof("$[?]", slot_0_19_2)
	local var_20_6 = ffi.new(var_20_5, #arg_20_0 * 2)
	local var_20_7 = 0

	for iter_20_0 = 1, #arg_20_0 do
		local var_20_8 = arg_20_0[iter_20_0]
		local var_20_9 = slot_0_19_2(var_20_8.x, var_20_8.y, var_20_8.z)

		var_20_6[var_20_7] = var_20_9
		var_20_6[var_20_7 + 1] = var_20_9
		var_20_7 = var_20_7 + 2
	end

	var_20_4.m_vecPositions = var_20_6

	local var_20_10 = ffi.new("void*[1]")
	local var_20_11 = ffi.new("int64_t[1]")

	slot_0_16_3(slot_0_15_2, var_20_10, var_20_11)
	slot_0_13_1(slot_0_10_1, var_20_2, 0, var_20_10)
	slot_0_17_3(slot_0_15_2, var_20_10, var_20_7, var_20_4)

	slot_0_21_2[var_20_2] = {
		index = var_20_2
	}

	Delay(arg_20_6, function()
		slot_0_8_0.release(var_20_2)
	end)

	return var_20_2
end

slot_0_9_0 = {
	max_points = 4,
	table = {}
}

function slot_0_9_0.create(arg_22_0, arg_22_1)
	slot_0_9_0.table[#slot_0_9_0.table + 1] = {
		time = game.globalVars.m_flRealTime + arg_22_0,
		text = arg_22_1
	}

	if #slot_0_9_0.table > slot_0_9_0.max_points then
		table.remove(slot_0_9_0.table, 1)
	end
end

function slot_0_9_0.listener()
	for iter_23_0 = 1, #slot_0_9_0.table do
		if slot_0_9_0.table[iter_23_0].time < game.globalVars.m_flRealTime then
			table.remove(slot_0_9_0.table[iter_23_0])
		end
	end
end

slot_0_10_0 = {}
slot_0_10_0.valid_and_alive = false
slot_0_10_0.position = Vector(0, 0, 0)
slot_0_10_0.player = nil

function slot_0_10_0.func()
	slot_0_10_0.player = entities.GetLocalPawn()

	if slot_0_10_0.player and slot_0_10_0.player:IsAlive() then
		slot_0_10_0.position = slot_0_10_0.player:GetAbsOrigin()
		slot_0_10_0.valid_and_alive = true
	else
		slot_0_10_0.position = Vector(0, 0, 0)
		slot_0_10_0.valid_and_alive = false
	end
end

events.presentQueue:Add(slot_0_10_0.func)

slot_0_11_0 = {
	mouse_speed_limit = {
		enabled = false,
		MAX_CHANGE = Vector(1, 4, 0)
	},
	trails = {
		enabled = false,
		thickness = 2,
		lifetime = 1,
		color = draw.Color(255, 255, 255, 255)
	},
	features = {
		autoalign = {
			aj_speed = 240,
			bwd_al = false,
			enabled = false,
			silent = false,
			effect = false,
			fov = 45,
			autojump = false,
			dist_rec = false,
			al_type = slot_0_0_0 and 0 or 0
		},
		null_strafe = {
			enabled = false
		},
		hide_hud = {
			enabled = false
		},
		clantag = {
			enabled = false
		},
		dlight = {
			enabled = false,
			color = draw.Color(255, 255, 255, 255)
		}
	},
	visuals = {
		graph = {
			enabled = false,
			position = 0,
			fade = 0
		},
		watermark = {
			enabled = false,
			position = Vector(20, 30, 0)
		},
		spectator_list = {
			enabled = false
		},
		velocity = {
			enabled = false,
			position = 0,
			color = draw.Color(255, 255, 255, 255),
			color_slower = draw.Color(255, 155, 155, 255),
			color_faster = draw.Color(155, 255, 155, 255)
		},
		binds = {
			hide_ns = false,
			enabled = false,
			position = 0,
			color = draw.Color(255, 255, 255, 255),
			color_act = draw.Color(255, 200, 200, 255)
		},
		keystrokes = {
			layout = 0,
			position = 0,
			enabled = false
		}
	},
	jump_types = {
		minijump = false,
		longjump = false
	},
	practice = {
		render_ui = false
	},
	jumpstats = {
		enabled = false,
		edgebug = false,
		healthshot = {
			jumpstats = false,
			edgebug = false
		}
	},
	esp_addons = {
		distance = false,
		velocity = false,
		surfing = false
	},
	effect_set = {
		healthshot = false,
		molotov = false,
		taser = false,
		sparks = false
	}
}

ffi.cdef("    typedef long long int64_t;\n    typedef int int32_t;\n    typedef unsigned long long uint64_t;\n    typedef unsigned int uint32_t;\n\n    typedef void (__fastcall *PlayEffect_t)(\n        const char* pEffectName,\n        int nSplitScreenSlot,\n        uintptr_t hEntity,\n        char bRemove,\n        int nMagnitude,\n        char bNoColorCorrection,\n        unsigned int nAttachment,\n        int nFlags,\n        char bFromPuppet\n    );\n")

slot_0_12_0 = {
	fn_playeffect = slot_0_3_0.find_pattern_cast("client.dll", "48 89 5C 24 ? 48 89 74 24 ? 55 57 41 57 48 8D 6C 24 ? 48 81 EC ? ? ? ? 48 8B", "PlayEffect_t")
}

function slot_0_12_0.playeffect(arg_25_0, arg_25_1)
	slot_0_12_0.fn_playeffect(arg_25_1, 5, ffi.cast("uintptr_t*", arg_25_0)[0], 0, 0, 0, 0, 0, 0)
end

function slot_0_12_0.sparks(arg_26_0)
	slot_0_12_0.playeffect(arg_26_0, "particles/inferno_fx/explosion_incend_air_falling.vpcf")
end

function slot_0_12_0.molotov(arg_27_0)
	slot_0_12_0.playeffect(arg_27_0, "particles/inferno_fx/molotov_explosion.vpcf")
end

function slot_0_12_0.taser(arg_28_0)
	slot_0_12_0.playeffect(arg_28_0, "particles/blood_impact/impact_taser_bodyfx.vpcf")
end

function slot_0_12_0.healthshot(arg_29_0, arg_29_1)
	local var_29_0 = ffi.cast("uintptr_t*", arg_29_1)

	if var_29_0 == ffi.cast("void*", 0) then
		return
	end

	ffi.cast("float*", var_29_0[0] + slot_0_2_0.healthshot_offset)[0] = game.globalVars.m_flCurTime + arg_29_0
end

function slot_0_12_0.play_effect_set(arg_30_0)
	if slot_0_11_0.effect_set.healthshot then
		slot_0_12_0.healthshot(1, arg_30_0)
	end

	if slot_0_11_0.effect_set.sparks then
		slot_0_12_0.sparks(arg_30_0)
	end

	if slot_0_11_0.effect_set.molotov then
		slot_0_12_0.molotov(arg_30_0)
	end

	if slot_0_11_0.effect_set.taser then
		slot_0_12_0.taser(arg_30_0)
	end
end

slot_0_13_0 = {
	tahoma_bold = draw.FontGDI("Tahoma Bold", 24, 5),
	tahoma_bold_small = draw.FontGDI("Tahoma Bold", 12, 5),
	tahoma_small = draw.FontGDI("Tahoma", 14, 5),
	segoe_ui = draw.FontGDI("Segoe UI", 12, 6)
}
slot_0_13_0.tahoma_small.kerningGap = 0

table.foreach(slot_0_13_0, function(arg_31_0, arg_31_1)
	arg_31_1:Create()
end)

slot_0_14_0 = {
	accent_color = draw.Color(255, 255, 255, 255)
}

function slot_0_14_0.create_watermark_window(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.font = slot_0_13_0.tahoma_small

	arg_32_0:AddRectFilled(draw.Rect(arg_32_1, arg_32_2), draw.Color(0, 0, 0, 100))

	local var_32_0 = (arg_32_2.x - arg_32_1.x) / 2

	arg_32_0:AddLineMulticolor(arg_32_1, draw.Vec2(arg_32_2.x - var_32_0, arg_32_1.y), slot_0_14_0.accent_color:A(0), slot_0_14_0.accent_color, 1)
	arg_32_0:AddLineMulticolor(draw.Vec2(arg_32_2.x - var_32_0, arg_32_1.y), draw.Vec2(arg_32_2.x, arg_32_1.y), slot_0_14_0.accent_color, slot_0_14_0.accent_color:A(0), 1)
end

function slot_0_14_0.create_window(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	arg_33_0.font = slot_0_13_0.tahoma_small

	arg_33_0:AddRectFilledMulticolor(draw.Rect(arg_33_1, arg_33_2), {
		draw.Color(15, 25, 30, 255),
		draw.Color(15, 25, 30, 255),
		draw.Color(10, 10, 10, 255),
		draw.Color(10, 10, 10, 255)
	})

	local var_33_0 = (arg_33_2.x - arg_33_1.x) / 2

	arg_33_0:AddLineMulticolor(draw.Vec2(arg_33_1.x, arg_33_1.y + 22), draw.Vec2(arg_33_2.x - var_33_0, arg_33_1.y + 22), slot_0_14_0.accent_color:A(0), slot_0_14_0.accent_color, 1)
	arg_33_0:AddLineMulticolor(draw.Vec2(arg_33_2.x - var_33_0, arg_33_1.y + 22), draw.Vec2(arg_33_2.x, arg_33_1.y + 22), slot_0_14_0.accent_color, slot_0_14_0.accent_color:A(0), 1)
	arg_33_0:AddText(draw.Vec2(arg_33_1.x + (arg_33_2.x - arg_33_1.x) / 2, arg_33_1.y + 7), arg_33_3, draw.Color.White(), draw.TextParams.WithH(draw.TextAlignment.CENTER))
end

slot_0_15_1 = nil
slot_0_15_0 = gui.LuaControlProto()
slot_0_16_2 = "celerity - " .. gui.ctx.user.username

function slot_0_15_0.onRender(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	if not slot_0_11_0.visuals.watermark.enabled then
		return
	end

	slot_0_14_0.create_watermark_window(arg_34_1, arg_34_3, arg_34_4)

	arg_34_1.font = slot_0_13_0.tahoma_small

	arg_34_1:AddText(draw.Vec2(arg_34_3.x + 9, arg_34_3.y + 5), slot_0_16_2, draw.Color.White())
end

slot_0_17_2 = gui.LuaWidgetControl("celerity2>watermark", slot_0_15_0, draw.Vec2(), draw.Vec2(slot_0_13_0.tahoma_small:GetTextSize(slot_0_16_2).x + 16, 18))

slot_0_17_2:ToggleVisibility(true)

slot_0_17_2.renderBackground = false

gui.ctx:Add(slot_0_17_2)

slot_0_16_1 = nil
slot_0_16_0 = gui.LuaControlProto()

function slot_0_16_0.onRender(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	if not slot_0_11_0.visuals.spectator_list.enabled then
		return
	end

	local var_35_0 = 100
	local var_35_1 = 18

	entities.controllers:ForEach(function(arg_36_0)
		if arg_36_0.entity:GetObserverTarget() and arg_36_0.entity:GetName() ~= arg_36_0.entity:GetObserverTarget():GetName() and not arg_36_0.entity:GetPawn():IsAlive() then
			local var_36_0 = arg_36_0.entity:GetName()
			local var_36_1 = arg_36_0.entity:GetObserverTarget():GetName()
			local var_36_2 = var_36_0 .. "->" .. var_36_1

			if slot_0_13_0.tahoma_small:GetTextSize(var_36_2).x > var_35_0 - 16 then
				var_35_0 = slot_0_13_0.tahoma_small:GetTextSize(var_36_2).x + 16
			end

			var_35_1 = var_35_1 + 16
		end
	end)

	if var_35_1 == 18 and not gui.IsVisible() then
		return
	end

	arg_35_4.x = arg_35_3.x + var_35_0
	arg_35_4.y = arg_35_3.y + var_35_1 + 10
	arg_35_1.font = slot_0_13_0.tahoma_small

	slot_0_14_0.create_window(arg_35_1, arg_35_3, arg_35_4, "spectators")

	local var_35_2 = 22

	entities.controllers:ForEach(function(arg_37_0)
		if arg_37_0.entity:GetObserverTarget() and arg_37_0.entity:GetName() ~= arg_37_0.entity:GetObserverTarget():GetName() and not arg_37_0.entity:GetPawn():IsAlive() then
			local var_37_0 = arg_37_0.entity:GetName()
			local var_37_1 = arg_37_0.entity:GetObserverTarget():GetName()

			arg_35_1:AddText(draw.Vec2(arg_35_3.x + 9, arg_35_3.y + var_35_2 + 5), var_37_0:lower() .. "->" .. var_37_1:lower(), draw.Color(115, 115, 115, 255))

			var_35_2 = var_35_2 + 16
		end
	end)
end

slot_0_17_1 = gui.LuaWidgetControl("celerity2>spectator_list", slot_0_16_0, draw.Vec2(), draw.Vec2(100, 22))

slot_0_17_1:ToggleVisibility(true)

slot_0_17_1.renderBackground = false

gui.ctx:Add(slot_0_17_1)

slot_0_17_0 = {
	icon = draw.CreatePanoramaSvgTexture("hud/deathnotice/inairkill", 26) or draw.CreatePanoramaSvgTexture("icons/equipment/inferno", 26) or draw.textures.icon_keys,
	tabname = slot_0_0_0 == 0 and "celerity indev" or slot_0_0_0 == 1 and "celerity" or slot_0_0_0 == 2 and "celerity alpha" or "celerity",
	wnd = gui.GetMainWindow()
}
slot_0_17_0.instance = slot_0_17_0.wnd:AddTab("celerity2", slot_0_17_0.icon, slot_0_17_0.tabname, gui.TabLayoutMode.SUBTABS)
slot_0_17_0.visuals = {}
slot_0_17_0.visuals.tab = slot_0_17_0.instance:AddTab("celerity2>visuals", "visuals", gui.TabLayoutMode.DEFAULT, true)
slot_0_17_0.visuals.items = {
	velocity = gui.Checkbox(gui.ControlID("celerity2>visuals>visuals>velocity")),
	binds = gui.Checkbox(gui.ControlID("celerity2>visuals>visuals>binds")),
	keystrokes = gui.Checkbox(gui.ControlID("celerity2>visuals>visuals>keystrokes")),
	graph = gui.Checkbox(gui.ControlID("celerity2>visuals>visuals>graph")),
	jumpstats = gui.Checkbox(gui.ControlID("celerity2>visuals>notifications>jumpstats")),
	edgebug = gui.Checkbox(gui.ControlID("celerity2>visuals>notifications>edgebug")),
	watermark = gui.Checkbox(gui.ControlID("celerity2>visuals>visuals>watermark")),
	spectator_list = gui.Checkbox(gui.ControlID("celerity2>visuals>visuals>spectator list")),
	position_velocity = gui.Slider(gui.ControlID("celerity2>visuals>visuals>velocity>settings>position"), 0, 100, {
		"%.f"
	}),
	color_velocity = gui.ColorPicker(gui.ControlID("celerity2>visuals>visuals>velocity>settings>color"), true),
	color_velocity_slower = gui.ColorPicker(gui.ControlID("celerity2>visuals>visuals>velocity>settings>color slower"), true),
	color_velocity_faster = gui.ColorPicker(gui.ControlID("celerity2>visuals>visuals>velocity>settings>color faster"), true),
	position_binds = gui.Slider(gui.ControlID("celerity2>visuals>visuals>binds>settings>position"), 0, 100, {
		"%.f"
	}),
	position_keystrokes = gui.Slider(gui.ControlID("celerity2>visuals>visuals>keystrokes>settings>position"), 0, 100, {
		"%.f"
	}),
	position_graph = gui.Slider(gui.ControlID("celerity2>visuals>visuals>graph>settings>position"), 0, 100, {
		"%.f"
	}),
	hide_nospread_binds = gui.Checkbox(gui.ControlID("celerity2>visuals>visuals>binds>settings>hide nospread")),
	color_binds = gui.ColorPicker(gui.ControlID("celerity2>visuals>visuals>binds>settings>color"), true),
	color_act_binds = gui.ColorPicker(gui.ControlID("celerity2>visuals>visuals>binds>settings>color active"), true),
	effect_edgebug = gui.Checkbox(gui.ControlID("celerity2>visuals>notifications>edgebug>settings>effect")),
	effect_jumpstats = gui.Checkbox(gui.ControlID("celerity2>visuals>notifications>jumpstats>settings>effect")),
	layout_keystrokes = gui.Slider(gui.ControlID("celerity2>visuals>visuals>keystrokes>settings>layout"), 0, 2, {
		"%.f"
	}),
	fade_graph = gui.Slider(gui.ControlID("celerity2>visuals>visuals>graph>settings>fade"), 0, 100, {
		"%.f"
	}),
	esp_addon_velocity = gui.Checkbox(gui.ControlID("celerity2>visuals>esp addons>velocity")),
	esp_addon_surfing = gui.Checkbox(gui.ControlID("celerity2>visuals>esp addons>surfing")),
	esp_addon_distance = gui.Checkbox(gui.ControlID("celerity2>visuals>esp addons>distance"))
}
slot_0_17_0.visuals.settings = {
	velocity = gui.Settings("celerity2>visuals>visuals>velocity>settings"),
	binds = gui.Settings("celerity2>visuals>visuals>binds>settings"),
	keystrokes = gui.Settings("celerity2>visuals>visuals>keystrokes>settings"),
	graph = gui.Settings("celerity2>visuals>visuals>graph>settings"),
	jumpstats = gui.Settings("celerity2>visuals>notifications>jumpstats>settings"),
	edgebug = gui.Settings("celerity2>visuals>notifications>edgebug>settings")
}
slot_0_17_0.visuals.containers = {
	velocity = gui.MakeControl("velocity:", slot_0_17_0.visuals.items.velocity),
	binds = gui.MakeControl("binds:", slot_0_17_0.visuals.items.binds),
	keystrokes = gui.MakeControl("keystrokes:", slot_0_17_0.visuals.items.keystrokes),
	graph = gui.MakeControl("graph:", slot_0_17_0.visuals.items.graph),
	jumpstats = gui.MakeControl("jumpstats:", slot_0_17_0.visuals.items.jumpstats),
	edgebug = gui.MakeControl("edgebug detection:", slot_0_17_0.visuals.items.edgebug),
	watermark = gui.MakeControl("watermark:", slot_0_17_0.visuals.items.watermark),
	spectator_list = gui.MakeControl("spectator list:", slot_0_17_0.visuals.items.spectator_list),
	position_velocity = gui.MakeControl("position:", slot_0_17_0.visuals.items.position_velocity),
	color_velocity = gui.MakeControl("color:", slot_0_17_0.visuals.items.color_velocity),
	color_velocity_slower = gui.MakeControl("slower:", slot_0_17_0.visuals.items.color_velocity_slower),
	color_velocity_faster = gui.MakeControl("faster:", slot_0_17_0.visuals.items.color_velocity_faster),
	position_binds = gui.MakeControl("position:", slot_0_17_0.visuals.items.position_binds),
	position_keystrokes = gui.MakeControl("position:", slot_0_17_0.visuals.items.position_keystrokes),
	position_graph = gui.MakeControl("position:", slot_0_17_0.visuals.items.position_graph),
	hide_nospread_binds = gui.MakeControl("hide nospread:", slot_0_17_0.visuals.items.hide_nospread_binds),
	color_binds = gui.MakeControl("color:", slot_0_17_0.visuals.items.color_binds),
	color_act_binds = gui.MakeControl("color active:", slot_0_17_0.visuals.items.color_act_binds),
	effect_jumpstats = gui.MakeControl("effect:", slot_0_17_0.visuals.items.effect_jumpstats),
	effect_edgebug = gui.MakeControl("effect:", slot_0_17_0.visuals.items.effect_edgebug),
	layout_keystrokes = gui.MakeControl("layout:", slot_0_17_0.visuals.items.layout_keystrokes),
	fade_graph = gui.MakeControl("fade size:", slot_0_17_0.visuals.items.fade_graph),
	esp_addon_velocity = gui.MakeControl("velocity:", slot_0_17_0.visuals.items.esp_addon_velocity),
	esp_addon_surfing = gui.MakeControl("surfing:", slot_0_17_0.visuals.items.esp_addon_surfing),
	esp_addon_distance = gui.MakeControl("distance:", slot_0_17_0.visuals.items.esp_addon_distance)
}
slot_0_17_0.visuals.groups = {
	visuals = gui.Group("celerity2>visuals>visuals", "visuals", 480, gui.GroupWidthMode.REDUCED),
	notifications = gui.Group("celerity2>visuals>notifications", "notifications", 480, gui.GroupWidthMode.REDUCED),
	esp_addons = gui.Group("celerity2>visuals>esp addons", "esp addons", 480, gui.GroupWidthMode.REDUCED)
}

slot_0_17_0.visuals.tab:Add(slot_0_17_0.visuals.groups.visuals)
slot_0_17_0.visuals.tab:Add(slot_0_17_0.visuals.groups.notifications)
slot_0_17_0.visuals.tab:Add(slot_0_17_0.visuals.groups.esp_addons)
slot_0_17_0.visuals.groups.esp_addons:Add(slot_0_17_0.visuals.containers.esp_addon_velocity)
slot_0_17_0.visuals.groups.esp_addons:Add(slot_0_17_0.visuals.containers.esp_addon_distance)
slot_0_17_0.visuals.groups.visuals:Add(slot_0_17_0.visuals.containers.watermark)
slot_0_17_0.visuals.groups.visuals:Add(slot_0_17_0.visuals.containers.spectator_list)
slot_0_17_0.visuals.groups.visuals:Add(slot_0_17_0.visuals.containers.velocity)
slot_0_17_0.visuals.groups.visuals:Add(slot_0_17_0.visuals.containers.binds)
slot_0_17_0.visuals.groups.visuals:Add(slot_0_17_0.visuals.containers.keystrokes)
slot_0_17_0.visuals.groups.visuals:Add(slot_0_17_0.visuals.containers.graph)
slot_0_17_0.visuals.groups.notifications:Add(slot_0_17_0.visuals.containers.jumpstats)
slot_0_17_0.visuals.groups.notifications:Add(slot_0_17_0.visuals.containers.edgebug)
slot_0_17_0.visuals.containers.velocity:Add(slot_0_17_0.visuals.settings.velocity)
slot_0_17_0.visuals.containers.binds:Add(slot_0_17_0.visuals.settings.binds)
slot_0_17_0.visuals.containers.keystrokes:Add(slot_0_17_0.visuals.settings.keystrokes)
slot_0_17_0.visuals.containers.graph:Add(slot_0_17_0.visuals.settings.graph)
slot_0_17_0.visuals.containers.jumpstats:Add(slot_0_17_0.visuals.settings.jumpstats)
slot_0_17_0.visuals.containers.edgebug:Add(slot_0_17_0.visuals.settings.edgebug)
slot_0_17_0.visuals.settings.velocity:Add(slot_0_17_0.visuals.containers.position_velocity)
slot_0_17_0.visuals.settings.velocity:Add(slot_0_17_0.visuals.containers.color_velocity)
slot_0_17_0.visuals.settings.velocity:Add(slot_0_17_0.visuals.containers.color_velocity_slower)
slot_0_17_0.visuals.settings.velocity:Add(slot_0_17_0.visuals.containers.color_velocity_faster)
slot_0_17_0.visuals.settings.binds:Add(slot_0_17_0.visuals.containers.position_binds)
slot_0_17_0.visuals.settings.keystrokes:Add(slot_0_17_0.visuals.containers.position_keystrokes)
slot_0_17_0.visuals.settings.graph:Add(slot_0_17_0.visuals.containers.position_graph)
slot_0_17_0.visuals.settings.binds:Add(slot_0_17_0.visuals.containers.hide_nospread_binds)
slot_0_17_0.visuals.settings.binds:Add(slot_0_17_0.visuals.containers.color_binds)
slot_0_17_0.visuals.settings.binds:Add(slot_0_17_0.visuals.containers.color_act_binds)
slot_0_17_0.visuals.settings.jumpstats:Add(slot_0_17_0.visuals.containers.effect_jumpstats)
slot_0_17_0.visuals.settings.edgebug:Add(slot_0_17_0.visuals.containers.effect_edgebug)
slot_0_17_0.visuals.settings.keystrokes:Add(slot_0_17_0.visuals.containers.layout_keystrokes)
slot_0_17_0.visuals.settings.graph:Add(slot_0_17_0.visuals.containers.fade_graph)
slot_0_17_0.visuals.items.watermark:AddCallback(function()
	slot_0_11_0.visuals.watermark.enabled = slot_0_17_0.visuals.items.watermark:GetValue():Get()
end)
slot_0_17_0.visuals.items.spectator_list:AddCallback(function()
	slot_0_11_0.visuals.spectator_list.enabled = slot_0_17_0.visuals.items.spectator_list:GetValue():Get()
end)
slot_0_17_0.visuals.items.velocity:AddCallback(function()
	slot_0_11_0.visuals.velocity.enabled = slot_0_17_0.visuals.items.velocity:GetValue():Get()
end)
slot_0_17_0.visuals.items.binds:AddCallback(function()
	slot_0_11_0.visuals.binds.enabled = slot_0_17_0.visuals.items.binds:GetValue():Get()
end)
slot_0_17_0.visuals.items.keystrokes:AddCallback(function()
	slot_0_11_0.visuals.keystrokes.enabled = slot_0_17_0.visuals.items.keystrokes:GetValue():Get()
end)
slot_0_17_0.visuals.items.graph:AddCallback(function()
	slot_0_11_0.visuals.graph.enabled = slot_0_17_0.visuals.items.graph:GetValue():Get()
end)
slot_0_17_0.visuals.items.jumpstats:AddCallback(function()
	slot_0_11_0.jumpstats.enabled = slot_0_17_0.visuals.items.jumpstats:GetValue():Get()
end)
slot_0_17_0.visuals.items.edgebug:AddCallback(function()
	slot_0_11_0.jumpstats.edgebug = slot_0_17_0.visuals.items.edgebug:GetValue():Get()
end)
slot_0_17_0.visuals.items.position_velocity:AddCallback(function()
	slot_0_11_0.visuals.velocity.position = slot_0_17_0.visuals.items.position_velocity:GetValue():Get()
end)
slot_0_17_0.visuals.items.color_velocity:AddCallback(function()
	slot_0_11_0.visuals.velocity.color = slot_0_17_0.visuals.items.color_velocity:GetValue():Get()
end)
slot_0_17_0.visuals.items.color_velocity_slower:AddCallback(function()
	slot_0_11_0.visuals.velocity.color_slower = slot_0_17_0.visuals.items.color_velocity_slower:GetValue():Get()
end)
slot_0_17_0.visuals.items.color_velocity_faster:AddCallback(function()
	slot_0_11_0.visuals.velocity.color_faster = slot_0_17_0.visuals.items.color_velocity_faster:GetValue():Get()
end)
slot_0_17_0.visuals.items.position_binds:AddCallback(function()
	slot_0_11_0.visuals.binds.position = slot_0_17_0.visuals.items.position_binds:GetValue():Get()
end)
slot_0_17_0.visuals.items.position_keystrokes:AddCallback(function()
	slot_0_11_0.visuals.keystrokes.position = slot_0_17_0.visuals.items.position_keystrokes:GetValue():Get()
end)
slot_0_17_0.visuals.items.position_graph:AddCallback(function()
	slot_0_11_0.visuals.graph.position = slot_0_17_0.visuals.items.position_graph:GetValue():Get()
end)
slot_0_17_0.visuals.items.hide_nospread_binds:AddCallback(function()
	slot_0_11_0.visuals.binds.hide_ns = slot_0_17_0.visuals.items.hide_nospread_binds:GetValue():Get()
end)
slot_0_17_0.visuals.items.color_binds:AddCallback(function()
	slot_0_11_0.visuals.binds.color = slot_0_17_0.visuals.items.color_binds:GetValue():Get()
end)
slot_0_17_0.visuals.items.color_act_binds:AddCallback(function()
	slot_0_11_0.visuals.binds.color_act = slot_0_17_0.visuals.items.color_act_binds:GetValue():Get()
end)
slot_0_17_0.visuals.items.effect_jumpstats:AddCallback(function()
	slot_0_11_0.jumpstats.healthshot.jumpstats = slot_0_17_0.visuals.items.effect_jumpstats:GetValue():Get()
end)
slot_0_17_0.visuals.items.effect_edgebug:AddCallback(function()
	slot_0_11_0.jumpstats.healthshot.edgebug = slot_0_17_0.visuals.items.effect_edgebug:GetValue():Get()
end)
slot_0_17_0.visuals.items.layout_keystrokes:AddCallback(function()
	slot_0_11_0.visuals.keystrokes.layout = slot_0_17_0.visuals.items.layout_keystrokes:GetValue():Get()
end)
slot_0_17_0.visuals.items.fade_graph:AddCallback(function()
	slot_0_11_0.visuals.graph.fade = slot_0_17_0.visuals.items.fade_graph:GetValue():Get()
end)
slot_0_17_0.visuals.items.esp_addon_velocity:AddCallback(function()
	slot_0_11_0.esp_addons.velocity = slot_0_17_0.visuals.items.esp_addon_velocity:GetValue():Get()
end)
slot_0_17_0.visuals.items.esp_addon_surfing:AddCallback(function()
	slot_0_11_0.esp_addons.surfing = slot_0_17_0.visuals.items.esp_addon_surfing:GetValue():Get()
end)
slot_0_17_0.visuals.items.esp_addon_distance:AddCallback(function()
	slot_0_11_0.esp_addons.distance = slot_0_17_0.visuals.items.esp_addon_distance:GetValue():Get()
end)

slot_0_11_0.visuals.watermark.enabled = slot_0_17_0.visuals.items.watermark:GetValue():Get()
slot_0_11_0.visuals.spectator_list.enabled = slot_0_17_0.visuals.items.spectator_list:GetValue():Get()
slot_0_11_0.visuals.velocity.enabled = slot_0_17_0.visuals.items.velocity:GetValue():Get()
slot_0_11_0.visuals.velocity.position = slot_0_17_0.visuals.items.position_velocity:GetValue():Get()
slot_0_11_0.visuals.velocity.color = slot_0_17_0.visuals.items.color_velocity:GetValue():Get()
slot_0_11_0.visuals.velocity.color_slower = slot_0_17_0.visuals.items.color_velocity_slower:GetValue():Get()
slot_0_11_0.visuals.velocity.color_faster = slot_0_17_0.visuals.items.color_velocity_faster:GetValue():Get()
slot_0_11_0.visuals.binds.enabled = slot_0_17_0.visuals.items.binds:GetValue():Get()
slot_0_11_0.visuals.binds.position = slot_0_17_0.visuals.items.position_binds:GetValue():Get()
slot_0_11_0.visuals.binds.hide_ns = slot_0_17_0.visuals.items.hide_nospread_binds:GetValue():Get()
slot_0_11_0.visuals.binds.color = slot_0_17_0.visuals.items.color_binds:GetValue():Get()
slot_0_11_0.visuals.binds.color_act = slot_0_17_0.visuals.items.color_act_binds:GetValue():Get()
slot_0_11_0.visuals.keystrokes.enabled = slot_0_17_0.visuals.items.keystrokes:GetValue():Get()
slot_0_11_0.visuals.keystrokes.position = slot_0_17_0.visuals.items.position_keystrokes:GetValue():Get()
slot_0_11_0.visuals.keystrokes.layout = slot_0_17_0.visuals.items.layout_keystrokes:GetValue():Get()
slot_0_11_0.visuals.graph.enabled = slot_0_17_0.visuals.items.graph:GetValue():Get()
slot_0_11_0.visuals.graph.position = slot_0_17_0.visuals.items.position_graph:GetValue():Get()
slot_0_11_0.visuals.graph.fade = slot_0_17_0.visuals.items.fade_graph:GetValue():Get()
slot_0_11_0.jumpstats.enabled = slot_0_17_0.visuals.items.jumpstats:GetValue():Get()
slot_0_11_0.jumpstats.healthshot.jumpstats = slot_0_17_0.visuals.items.effect_jumpstats:GetValue():Get()
slot_0_11_0.jumpstats.edgebug = slot_0_17_0.visuals.items.edgebug:GetValue():Get()
slot_0_11_0.jumpstats.healthshot.edgebug = slot_0_17_0.visuals.items.effect_edgebug:GetValue():Get()
slot_0_11_0.esp_addons.velocity = slot_0_17_0.visuals.items.esp_addon_velocity:GetValue():Get()
slot_0_11_0.esp_addons.surfing = slot_0_17_0.visuals.items.esp_addon_surfing:GetValue():Get()
slot_0_11_0.esp_addons.distance = slot_0_17_0.visuals.items.esp_addon_distance:GetValue():Get()

table.foreach(slot_0_17_0.visuals.groups, function(arg_63_0, arg_63_1)
	arg_63_1:Reset()
end)

slot_0_17_0.features = {}
slot_0_17_0.features.tab = slot_0_17_0.instance:AddTab("celerity2>features", "features", gui.TabLayoutMode.DEFAULT, false)
slot_0_17_0.features.items = {
	clantag = gui.Checkbox(gui.ControlID("celerity2>features>visuals>clantag")),
	hide_hud_visuals = gui.Checkbox(gui.ControlID("celerity2>features>visuals>hide hud")),
	mouse_speed_limit = gui.Checkbox(gui.ControlID("celerity2>features>visuals>mouse speed limit")),
	trails = gui.Checkbox(gui.ControlID("celerity2>features>visuals>trails")),
	mouse_speed_limit_pitch = gui.Slider(gui.ControlID("celerity2>features>visuals>mouse speed limit>settings>pitch"), 0, 10, {
		"%.f"
	}),
	mouse_speed_limit_yaw = gui.Slider(gui.ControlID("celerity2>features>visuals>mouse speed limit>settings>yaw"), 0, 10, {
		"%.f"
	}),
	dlight_visuals = gui.Checkbox(gui.ControlID("celerity2>features>visuals>dlight")),
	color_dlight = gui.ColorPicker(gui.ControlID("celerity2>features>visuals>dlight>settings>color"), true),
	lifetime_trails = gui.Slider(gui.ControlID("celerity2>features>visuals>trails>settings>lifetime"), 0, 10, {
		"%.f"
	}),
	thickness_trails = gui.Slider(gui.ControlID("celerity2>features>visuals>trails>settings>thickness"), 0, 5, {
		"%.f"
	}),
	color_trails = gui.ColorPicker(gui.ControlID("celerity2>features>visuals>trails>settings>color"), true),
	null_strafe_features = gui.Checkbox(gui.ControlID("celerity2>features>features>null strafes")),
	longjump_features = gui.Checkbox(gui.ControlID("celerity2>features>features>long jump")),
	minijump_features = gui.Checkbox(gui.ControlID("celerity2>features>features>mini jump")),
	autoalign = gui.Checkbox(gui.ControlID("celerity2>features>features>autoalign")),
	auto_jump_autoalign = gui.Checkbox(gui.ControlID("celerity2>features>features>autoalign>settings>auto jump")),
	backwards_align_autoalign = gui.Checkbox(gui.ControlID("celerity2>features>features>autoalign>settings>backwards align")),
	distance_recorder_autoalign = gui.Checkbox(gui.ControlID("celerity2>features>features>autoalign>settings>distance recorder")),
	silent_autoalign = gui.Checkbox(gui.ControlID("celerity2>features>features>autoalign>settings>silent")),
	effect_autoalign = gui.Checkbox(gui.ControlID("celerity2>features>features>autoalign>settings>effect")),
	effect_sparks = gui.Checkbox(gui.ControlID("celerity2>features>effects>sparks")),
	effect_molotov = gui.Checkbox(gui.ControlID("celerity2>features>effects>molotov")),
	effect_taser = gui.Checkbox(gui.ControlID("celerity2>features>effects>taser")),
	effect_healthshot = gui.Checkbox(gui.ControlID("celerity2>features>effects>healthshot")),
	fov_autoalign = gui.Slider(gui.ControlID("celerity2>visuals>visuals>graph>settings>fov"), 1, 89, {
		"%.f"
	}),
	auto_jump_speed_autoalign = gui.Slider(gui.ControlID("celerity2>visuals>visuals>graph>settings>auto jump speed"), 1, 250, {
		"%.f"
	})
}
slot_0_17_0.features.containers = {
	clantag = gui.MakeControl("clantag:", slot_0_17_0.features.items.clantag),
	hide_hud_visuals = gui.MakeControl("hide hud:", slot_0_17_0.features.items.hide_hud_visuals),
	mouse_speed_limit = gui.MakeControl("mouse speed limit:", slot_0_17_0.features.items.mouse_speed_limit),
	trails = gui.MakeControl("trails:", slot_0_17_0.features.items.trails),
	mouse_speed_limit_pitch = gui.MakeControl("pitch:", slot_0_17_0.features.items.mouse_speed_limit_pitch),
	mouse_speed_limit_yaw = gui.MakeControl("yaw:", slot_0_17_0.features.items.mouse_speed_limit_yaw),
	dlight_visuals = gui.MakeControl("dlight:", slot_0_17_0.features.items.dlight_visuals),
	color_dlight = gui.MakeControl("color:", slot_0_17_0.features.items.color_dlight),
	lifetime_trails = gui.MakeControl("trails lifetime:", slot_0_17_0.features.items.lifetime_trails),
	thickness_trails = gui.MakeControl("trails thickness:", slot_0_17_0.features.items.thickness_trails),
	color_trails = gui.MakeControl("color:", slot_0_17_0.features.items.color_trails),
	null_strafe_features = gui.MakeControl("null strafes:", slot_0_17_0.features.items.null_strafe_features),
	longjump_features = gui.MakeControl("long jump:", slot_0_17_0.features.items.longjump_features),
	minijump_features = gui.MakeControl("mini jump:", slot_0_17_0.features.items.minijump_features),
	autoalign = gui.MakeControl("autoalign:", slot_0_17_0.features.items.autoalign),
	fov_autoalign = gui.MakeControl("fov:", slot_0_17_0.features.items.fov_autoalign),
	auto_jump_autoalign = gui.MakeControl("auto jump:", slot_0_17_0.features.items.auto_jump_autoalign),
	auto_jump_speed_autoalign = gui.MakeControl("auto jump speed:", slot_0_17_0.features.items.auto_jump_speed_autoalign),
	backwards_align_autoalign = gui.MakeControl("backwards align:", slot_0_17_0.features.items.backwards_align_autoalign),
	distance_recorder_autoalign = gui.MakeControl("distance recorder:", slot_0_17_0.features.items.distance_recorder_autoalign),
	effect_autoalign = gui.MakeControl("effect:", slot_0_17_0.features.items.effect_autoalign),
	silent_autoalign = gui.MakeControl("silent:", slot_0_17_0.features.items.silent_autoalign),
	effect_sparks = gui.MakeControl("sparks:", slot_0_17_0.features.items.effect_sparks),
	effect_molotov = gui.MakeControl("molotov:", slot_0_17_0.features.items.effect_molotov),
	effect_taser = gui.MakeControl("taser:", slot_0_17_0.features.items.effect_taser),
	effect_healthshot = gui.MakeControl("healthshot:", slot_0_17_0.features.items.effect_healthshot)
}
slot_0_17_0.features.settings = {
	autoalign = gui.Settings("celerity2>features>features>autoalign>settings"),
	trails = gui.Settings("celerity2>features>features>trails>settings"),
	mouse_speed_limit = gui.Settings("celerity2>features>visuals>mouse speed limit>settings"),
	dlight = gui.Settings("celerity2>features>visuals>dlight>settings")
}
slot_0_17_0.features.groups = {
	visuals = gui.Group("celerity2>features>visuals", "visuals", 480, gui.GroupWidthMode.REDUCED),
	features = gui.Group("celerity2>features>features", "features", 480, gui.GroupWidthMode.REDUCED),
	effects = gui.Group("celerity2>features>effects", "effects", 480, gui.GroupWidthMode.REDUCED)
}

slot_0_17_0.features.tab:Add(slot_0_17_0.features.groups.features)
slot_0_17_0.features.tab:Add(slot_0_17_0.features.groups.visuals)
slot_0_17_0.features.tab:Add(slot_0_17_0.features.groups.effects)
slot_0_17_0.features.groups.effects:Add(slot_0_17_0.features.containers.effect_sparks)
slot_0_17_0.features.groups.effects:Add(slot_0_17_0.features.containers.effect_molotov)
slot_0_17_0.features.groups.effects:Add(slot_0_17_0.features.containers.effect_taser)
slot_0_17_0.features.groups.effects:Add(slot_0_17_0.features.containers.effect_healthshot)
slot_0_17_0.features.groups.visuals:Add(slot_0_17_0.features.containers.clantag)
slot_0_17_0.features.groups.visuals:Add(slot_0_17_0.features.containers.hide_hud_visuals)
slot_0_17_0.features.groups.visuals:Add(slot_0_17_0.features.containers.dlight_visuals)
slot_0_17_0.features.groups.visuals:Add(slot_0_17_0.features.containers.trails)
slot_0_17_0.features.containers.dlight_visuals:Add(slot_0_17_0.features.settings.dlight)
slot_0_17_0.features.settings.dlight:Add(slot_0_17_0.features.containers.color_dlight)
slot_0_17_0.features.containers.mouse_speed_limit:Add(slot_0_17_0.features.settings.mouse_speed_limit)
slot_0_17_0.features.settings.mouse_speed_limit:Add(slot_0_17_0.features.containers.mouse_speed_limit_pitch)
slot_0_17_0.features.settings.mouse_speed_limit:Add(slot_0_17_0.features.containers.mouse_speed_limit_yaw)
slot_0_17_0.features.groups.features:Add(slot_0_17_0.features.containers.autoalign)
slot_0_17_0.features.groups.features:Add(slot_0_17_0.features.containers.mouse_speed_limit)
slot_0_17_0.features.groups.features:Add(slot_0_17_0.features.containers.null_strafe_features)
slot_0_17_0.features.groups.features:Add(slot_0_17_0.features.containers.longjump_features)
slot_0_17_0.features.groups.features:Add(slot_0_17_0.features.containers.minijump_features)
slot_0_17_0.features.containers.autoalign:Add(slot_0_17_0.features.settings.autoalign)
slot_0_17_0.features.containers.trails:Add(slot_0_17_0.features.settings.trails)
slot_0_17_0.features.settings.trails:Add(slot_0_17_0.features.containers.lifetime_trails)
slot_0_17_0.features.settings.trails:Add(slot_0_17_0.features.containers.thickness_trails)
slot_0_17_0.features.settings.trails:Add(slot_0_17_0.features.containers.color_trails)
slot_0_17_0.features.settings.autoalign:Add(slot_0_17_0.features.containers.fov_autoalign)
slot_0_17_0.features.settings.autoalign:Add(slot_0_17_0.features.containers.auto_jump_autoalign)
slot_0_17_0.features.settings.autoalign:Add(slot_0_17_0.features.containers.auto_jump_speed_autoalign)
slot_0_17_0.features.settings.autoalign:Add(slot_0_17_0.features.containers.backwards_align_autoalign)
slot_0_17_0.features.settings.autoalign:Add(slot_0_17_0.features.containers.distance_recorder_autoalign)
slot_0_17_0.features.settings.autoalign:Add(slot_0_17_0.features.containers.silent_autoalign)
slot_0_17_0.features.settings.autoalign:Add(slot_0_17_0.features.containers.effect_autoalign)
slot_0_17_0.features.items.clantag:AddCallback(function()
	slot_0_11_0.features.clantag.enabled = slot_0_17_0.features.items.clantag:GetValue():Get()
end)
slot_0_17_0.features.items.hide_hud_visuals:AddCallback(function()
	slot_0_11_0.features.hide_hud.enabled = slot_0_17_0.features.items.hide_hud_visuals:GetValue():Get()
end)
slot_0_17_0.features.items.mouse_speed_limit:AddCallback(function()
	slot_0_11_0.mouse_speed_limit.enabled = slot_0_17_0.features.items.mouse_speed_limit:GetValue():Get()
end)
slot_0_17_0.features.items.mouse_speed_limit_pitch:AddCallback(function()
	slot_0_11_0.mouse_speed_limit.MAX_CHANGE.x = slot_0_17_0.features.items.mouse_speed_limit_pitch:GetValue():Get()
end)
slot_0_17_0.features.items.mouse_speed_limit_yaw:AddCallback(function()
	slot_0_11_0.mouse_speed_limit.MAX_CHANGE.y = slot_0_17_0.features.items.mouse_speed_limit_yaw:GetValue():Get()
end)
slot_0_17_0.features.items.dlight_visuals:AddCallback(function()
	slot_0_11_0.features.dlight.enabled = slot_0_17_0.features.items.dlight_visuals:GetValue():Get()
end)
slot_0_17_0.features.items.color_dlight:AddCallback(function()
	slot_0_11_0.features.dlight.color = slot_0_17_0.features.items.color_dlight:GetValue():Get()
end)
slot_0_17_0.features.items.null_strafe_features:AddCallback(function()
	slot_0_11_0.features.null_strafe.enabled = slot_0_17_0.features.items.null_strafe_features:GetValue():Get()
end)
slot_0_17_0.features.items.longjump_features:AddCallback(function()
	slot_0_11_0.jump_types.longjump = slot_0_17_0.features.items.longjump_features:GetValue():Get()
end)
slot_0_17_0.features.items.minijump_features:AddCallback(function()
	slot_0_11_0.jump_types.minijump = slot_0_17_0.features.items.minijump_features:GetValue():Get()
end)
slot_0_17_0.features.items.autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.enabled = slot_0_17_0.features.items.autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.fov_autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.fov = slot_0_17_0.features.items.fov_autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.auto_jump_autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.autojump = slot_0_17_0.features.items.auto_jump_autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.auto_jump_speed_autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.aj_speed = slot_0_17_0.features.items.auto_jump_speed_autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.backwards_align_autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.bwd_al = slot_0_17_0.features.items.backwards_align_autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.distance_recorder_autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.dist_rec = slot_0_17_0.features.items.distance_recorder_autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.silent_autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.silent = slot_0_17_0.features.items.silent_autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.effect_autoalign:AddCallback(function()
	slot_0_11_0.features.autoalign.effect = slot_0_17_0.features.items.effect_autoalign:GetValue():Get()
end)
slot_0_17_0.features.items.effect_sparks:AddCallback(function()
	slot_0_11_0.effect_set.sparks = slot_0_17_0.features.items.effect_sparks:GetValue():Get()
end)
slot_0_17_0.features.items.effect_molotov:AddCallback(function()
	slot_0_11_0.effect_set.molotov = slot_0_17_0.features.items.effect_molotov:GetValue():Get()
end)
slot_0_17_0.features.items.effect_taser:AddCallback(function()
	slot_0_11_0.effect_set.taser = slot_0_17_0.features.items.effect_taser:GetValue():Get()
end)
slot_0_17_0.features.items.effect_healthshot:AddCallback(function()
	slot_0_11_0.effect_set.healthshot = slot_0_17_0.features.items.effect_healthshot:GetValue():Get()
end)
slot_0_17_0.features.items.trails:AddCallback(function()
	slot_0_11_0.trails.enabled = slot_0_17_0.features.items.trails:GetValue():Get()
end)
slot_0_17_0.features.items.lifetime_trails:AddCallback(function()
	slot_0_11_0.trails.lifetime = slot_0_17_0.features.items.lifetime_trails:GetValue():Get()
end)
slot_0_17_0.features.items.thickness_trails:AddCallback(function()
	slot_0_11_0.trails.thickness = slot_0_17_0.features.items.thickness_trails:GetValue():Get()
end)
slot_0_17_0.features.items.color_trails:AddCallback(function()
	slot_0_11_0.trails.color = slot_0_17_0.features.items.color_trails:GetValue():Get()
end)

if slot_0_17_0.features.items.fov_autoalign:GetValue():Get() == 0 then
	slot_0_17_0.features.items.fov_autoalign:GetValue():Set(45)
end

if slot_0_17_0.features.items.auto_jump_speed_autoalign:GetValue():Get() == 0 then
	slot_0_17_0.features.items.auto_jump_speed_autoalign:GetValue():Set(240)
end

if slot_0_17_0.features.items.mouse_speed_limit_pitch:GetValue():Get() == 0 then
	slot_0_17_0.features.items.mouse_speed_limit_pitch:GetValue():Set(1)
end

if slot_0_17_0.features.items.mouse_speed_limit_yaw:GetValue():Get() == 0 then
	slot_0_17_0.features.items.mouse_speed_limit_yaw:GetValue():Set(4)
end

slot_0_11_0.features.clantag.enabled = slot_0_17_0.features.items.clantag:GetValue():Get()
slot_0_11_0.features.hide_hud.enabled = slot_0_17_0.features.items.hide_hud_visuals:GetValue():Get()
slot_0_11_0.mouse_speed_limit.enabled = slot_0_17_0.features.items.mouse_speed_limit:GetValue():Get()
slot_0_11_0.mouse_speed_limit.MAX_CHANGE.x = slot_0_17_0.features.items.mouse_speed_limit_pitch:GetValue():Get()
slot_0_11_0.mouse_speed_limit.MAX_CHANGE.y = slot_0_17_0.features.items.mouse_speed_limit_yaw:GetValue():Get()
slot_0_11_0.features.dlight.enabled = slot_0_17_0.features.items.dlight_visuals:GetValue():Get()
slot_0_11_0.features.dlight.color = slot_0_17_0.features.items.color_dlight:GetValue():Get()
slot_0_11_0.features.null_strafe.enabled = slot_0_17_0.features.items.null_strafe_features:GetValue():Get()
slot_0_11_0.jump_types.longjump = slot_0_17_0.features.items.longjump_features:GetValue():Get()
slot_0_11_0.jump_types.minijump = slot_0_17_0.features.items.minijump_features:GetValue():Get()
slot_0_11_0.features.autoalign.enabled = slot_0_17_0.features.items.autoalign:GetValue():Get()
slot_0_11_0.features.autoalign.fov = slot_0_17_0.features.items.fov_autoalign:GetValue():Get()
slot_0_11_0.features.autoalign.autojump = slot_0_17_0.features.items.auto_jump_autoalign:GetValue():Get()
slot_0_11_0.features.autoalign.aj_speed = slot_0_17_0.features.items.auto_jump_speed_autoalign:GetValue():Get()
slot_0_11_0.features.autoalign.bwd_al = slot_0_17_0.features.items.backwards_align_autoalign:GetValue():Get()
slot_0_11_0.features.autoalign.dist_rec = slot_0_17_0.features.items.distance_recorder_autoalign:GetValue():Get()
slot_0_11_0.features.autoalign.silent = slot_0_17_0.features.items.silent_autoalign:GetValue():Get()
slot_0_11_0.features.autoalign.effect = slot_0_17_0.features.items.effect_autoalign:GetValue():Get()
slot_0_11_0.effect_set.sparks = slot_0_17_0.features.items.effect_sparks:GetValue():Get()
slot_0_11_0.effect_set.molotov = slot_0_17_0.features.items.effect_molotov:GetValue():Get()
slot_0_11_0.effect_set.taser = slot_0_17_0.features.items.effect_taser:GetValue():Get()
slot_0_11_0.effect_set.healthshot = slot_0_17_0.features.items.effect_healthshot:GetValue():Get()
slot_0_11_0.trails.enabled = slot_0_17_0.features.items.trails:GetValue():Get()
slot_0_11_0.trails.lifetime = slot_0_17_0.features.items.lifetime_trails:GetValue():Get()
slot_0_11_0.trails.thickness = slot_0_17_0.features.items.thickness_trails:GetValue():Get()
slot_0_11_0.trails.color = slot_0_17_0.features.items.color_trails:GetValue():Get()

table.foreach(slot_0_17_0.features.groups, function(arg_90_0, arg_90_1)
	arg_90_1:Reset()
end)

slot_0_17_0.practice = {}
slot_0_17_0.practice.tab = slot_0_17_0.instance:AddTab("celerity2>practice", "practice", gui.TabLayoutMode.DEFAULT, false)
slot_0_17_0.practice.items = {
	render_ui = gui.Checkbox(gui.ControlID("celerity2>practice>render ui")),
	set_checkpoint = gui.Checkbox(gui.ControlID("celerity2>practice>set checkpoint")),
	remove_checkpoint = gui.Checkbox(gui.ControlID("celerity2>practice>remove checkpoint")),
	tp_to_checkpoint = gui.Checkbox(gui.ControlID("celerity2>practice>tp to checkpoint")),
	next_checkpoint = gui.Checkbox(gui.ControlID("celerity2>practice>next checkpoint")),
	last_checkpoint = gui.Checkbox(gui.ControlID("celerity2>practice>last checkpoint"))
}
slot_0_17_0.practice.containers = {
	render_ui = gui.MakeControl("render practice ui:", slot_0_17_0.practice.items.render_ui),
	set_checkpoint = gui.MakeControl("set checkpoint:", slot_0_17_0.practice.items.set_checkpoint),
	remove_checkpoint = gui.MakeControl("remove checkpoint:", slot_0_17_0.practice.items.remove_checkpoint),
	tp_to_checkpoint = gui.MakeControl("tp to checkpoint:", slot_0_17_0.practice.items.tp_to_checkpoint),
	next_checkpoint = gui.MakeControl("next checkpoint:", slot_0_17_0.practice.items.next_checkpoint),
	last_checkpoint = gui.MakeControl("last checkpoint:", slot_0_17_0.practice.items.last_checkpoint)
}
slot_0_17_0.practice.groups = {
	main = gui.Group("celerity2>practice>main", "practice", 480, gui.GroupWidthMode.REDUCED)
}

slot_0_17_0.practice.tab:Add(slot_0_17_0.practice.groups.main)
slot_0_17_0.practice.groups.main:Add(slot_0_17_0.practice.containers.render_ui)
slot_0_17_0.practice.groups.main:Add(slot_0_17_0.practice.containers.set_checkpoint)
slot_0_17_0.practice.groups.main:Add(slot_0_17_0.practice.containers.remove_checkpoint)
slot_0_17_0.practice.groups.main:Add(slot_0_17_0.practice.containers.tp_to_checkpoint)
slot_0_17_0.practice.groups.main:Add(slot_0_17_0.practice.containers.next_checkpoint)
slot_0_17_0.practice.groups.main:Add(slot_0_17_0.practice.containers.last_checkpoint)
slot_0_17_0.practice.items.render_ui:AddCallback(function()
	slot_0_11_0.practice.render_ui = slot_0_17_0.practice.items.render_ui:GetValue():Get()
end)

slot_0_11_0.practice.render_ui = slot_0_17_0.practice.items.render_ui:GetValue():Get()

table.foreach(slot_0_17_0.practice.groups, function(arg_92_0, arg_92_1)
	arg_92_1:Reset()
end)

slot_0_17_0.hide = {}
slot_0_17_0.hide.tab = slot_0_17_0.instance:AddTab("celerity2>hide", "hide", gui.TabLayoutMode.DEFAULT, false)
slot_0_18_1 = nil
slot_0_19_1 = 2
slot_0_20_1 = {}
slot_0_21_1 = {}
slot_0_22_1 = nil

function slot_0_18_0()
	if slot_0_10_0.valid_and_alive and slot_0_11_0.trails.enabled then
		local var_93_0 = slot_0_10_0.position
		local var_93_1 = Vector(var_93_0.x, var_93_0.y, var_93_0.z + 2)

		if not slot_0_22_1 or slot_0_22_1:dist(var_93_1) > slot_0_19_1 then
			table.insert(slot_0_21_1, var_93_1)

			slot_0_22_1 = var_93_1

			if #slot_0_21_1 > 2 then
				table.remove(slot_0_21_1, 1)
			end

			if #slot_0_21_1 >= 2 then
				local var_93_2 = slot_0_11_0.trails.color:GetR()
				local var_93_3 = slot_0_11_0.trails.color:GetG()
				local var_93_4 = slot_0_11_0.trails.color:GetB()
				local var_93_5 = slot_0_11_0.trails.color:GetA()

				slot_0_20_1[1] = slot_0_21_1[#slot_0_21_1 - 1]
				slot_0_20_1[2] = slot_0_21_1[#slot_0_21_1]

				slot_0_8_0.create(slot_0_20_1, "particles/entity/spectator_utility_trail.vpcf", var_93_2, var_93_3, var_93_4, var_93_5, slot_0_11_0.trails.lifetime, slot_0_11_0.trails.thickness)
			end
		end
	else
		for iter_93_0 = #slot_0_21_1, 1, -1 do
			slot_0_21_1[iter_93_0] = nil
		end

		slot_0_22_1 = nil
	end
end

slot_0_19_0 = {
	yaw_offset = 0.05,
	trace_frac = 0,
	is_surfing = false,
	old_is_surfing = false,
	px_status = 0,
	current_side = "",
	is_active = false,
	dist_rec_info = {
		start_tick = 0,
		active = false,
		start_time = 0
	},
	deltas = {
		max = 89,
		min = 360
	},
	latest_wall_data = {
		side = 0,
		yaw = 0,
		distance = 0
	}
}

function slot_0_19_0.update_surf_state(arg_94_0)
	if not arg_94_0 then
		return
	end

	if not (bit.band(arg_94_0.m_fFlags:Get(), 1) ~= 0) then
		local var_94_0 = arg_94_0:GetAbsVelocity()
		local var_94_1 = var_94_0 and var_94_0.z or 0

		if slot_0_11_0.features.autoalign.enabled and var_94_1 >= -15 and var_94_1 <= -6 then
			slot_0_19_0.is_surfing = true
		else
			slot_0_19_0.is_surfing = false
		end
	else
		slot_0_19_0.is_surfing = false
	end
end

function slot_0_19_0.do_px_dist_rec(arg_95_0)
	local var_95_0 = entities.GetLocalPawn()

	if not var_95_0 then
		return
	end

	local var_95_1 = var_95_0:GetAbsOrigin()

	if not var_95_1 then
		return
	end

	if slot_0_19_0.is_surfing and not slot_0_19_0.dist_rec_info.active then
		slot_0_19_0.dist_rec_info.active = true
		slot_0_19_0.dist_rec_info.start_pos = Vector(var_95_1.x, var_95_1.y, var_95_1.z)
		slot_0_19_0.dist_rec_info.start_tick = game.globalVars.m_iTickCount
		slot_0_19_0.dist_rec_info.start_time = game.globalVars.m_flCurTime
		slot_0_19_0.px_status = 1
	elseif slot_0_19_0.is_surfing then
		if slot_0_11_0.features.autoalign.effect then
			slot_0_12_0.play_effect_set(var_95_0)
		end

		slot_0_19_0.px_status = 2
	elseif not slot_0_19_0.is_surfing and slot_0_19_0.dist_rec_info.active then
		local var_95_2 = var_95_1.x - slot_0_19_0.dist_rec_info.start_pos.x
		local var_95_3 = var_95_1.y - slot_0_19_0.dist_rec_info.start_pos.y
		local var_95_4 = math.sqrt(var_95_2 * var_95_2 + var_95_3 * var_95_3)
		local var_95_5 = game.globalVars.m_iTickCount - slot_0_19_0.dist_rec_info.start_tick
		local var_95_6 = game.globalVars.m_flCurTime - slot_0_19_0.dist_rec_info.start_time

		if var_95_5 > 1 and slot_0_11_0.features.autoalign.dist_rec then
			print(string.format("pixelsurf | distance: %.2fu | ticks: %dt | time: %.2fs", var_95_4, var_95_5, var_95_6))
		end

		slot_0_19_0.px_status = 3
		slot_0_19_0.dist_rec_info.active = false
		slot_0_19_0.dist_rec_info.start_pos = nil
	else
		slot_0_19_0.px_status = 0
	end
end

function slot_0_19_0.backwards_check(arg_96_0, arg_96_1)
	if not arg_96_0 or not slot_0_11_0.features.autoalign.bwd_al then
		return false
	end

	if arg_96_0:Length2d() < 5 then
		return false
	end

	local var_96_0 = math.AngleNormalize(math.deg(math.atan2(arg_96_0.y, arg_96_0.x)))
	local var_96_1 = math.AngleNormalize(var_96_0 - arg_96_1)

	return math.abs(var_96_1) > 90
end

function slot_0_19_0.get_turn_direction(arg_97_0, arg_97_1, arg_97_2)
	if not arg_97_0 or not arg_97_1 or not arg_97_2 then
		return 0, "none"
	end

	local var_97_0 = math.AngleNormalize(arg_97_0 + 90)
	local var_97_1 = math.AngleNormalize(arg_97_0 - 90)
	local var_97_2 = arg_97_1.x - arg_97_2.x
	local var_97_3 = arg_97_1.y - arg_97_2.y
	local var_97_4 = math.rad(arg_97_0)
	local var_97_5 = math.cos(var_97_4)

	if var_97_2 * math.sin(var_97_4) - var_97_3 * var_97_5 > 0 then
		return var_97_0, "left"
	else
		return var_97_1, "right"
	end
end

function slot_0_19_0.do_wall_detect(arg_98_0, arg_98_1, arg_98_2, arg_98_3, arg_98_4)
	local var_98_0 = entities.GetLocalPawn()

	if not game.engine:IsConnected() or not var_98_0 or not arg_98_0 or not arg_98_3 then
		return nil
	end

	local var_98_1 = math.rad(arg_98_2)
	local var_98_2

	slot_0_19_0.deltas.min = 360

	local var_98_3 = Vector(arg_98_0.x, arg_98_0.y, arg_98_0.z)
	local var_98_4 = slot_0_19_0.backwards_check(arg_98_4, arg_98_3.y)

	for iter_98_0 = 0, math.pi * 2, var_98_1 do
		local var_98_5 = Vector(math.cos(iter_98_0) * arg_98_1 + var_98_3.x, math.sin(iter_98_0) * arg_98_1 + var_98_3.y, var_98_3.z)
		local var_98_6 = Ray_t()
		local var_98_7 = game.physicsQueryInterface:TraceMovement(var_98_6, var_98_3, var_98_5)

		slot_0_19_0.trace_frac = var_98_7.m_flFraction

		if var_98_7.m_flFraction < 0.97 and math.abs(var_98_7.m_Plane.normal.z) <= 0.1 then
			local var_98_8 = math.AngleNormalize(math.deg(math.atan2(var_98_7.m_Plane.normal.y, var_98_7.m_Plane.normal.x)))
			local var_98_9 = (var_98_7.m_vEndPos - arg_98_0):Length2d() - 16
			local var_98_10, var_98_11 = slot_0_19_0.get_turn_direction(var_98_8, var_98_7.m_vEndPos, var_98_3)

			if var_98_10 and var_98_11 ~= "none" then
				local var_98_12 = 0

				if not var_98_4 then
					if var_98_11 == "right" then
						var_98_12 = math.AngleNormalize(var_98_10 - slot_0_19_0.yaw_offset)
					else
						var_98_12 = math.AngleNormalize(var_98_10 + slot_0_19_0.yaw_offset)
					end
				elseif var_98_11 == "right" then
					var_98_12 = math.AngleNormalize(var_98_10 + slot_0_19_0.yaw_offset)
				else
					var_98_12 = math.AngleNormalize(var_98_10 - slot_0_19_0.yaw_offset)
				end

				local var_98_13 = math.abs(math.AngleNormalize(var_98_12 - arg_98_3.y))

				if var_98_13 <= slot_0_19_0.deltas.max and var_98_13 < slot_0_19_0.deltas.min then
					slot_0_19_0.deltas.min = var_98_13
					var_98_2 = {
						yaw = var_98_12,
						side = var_98_11,
						distance = var_98_9
					}
				end
			end
		end
	end

	return var_98_2
end

function slot_0_19_0.func(arg_99_0)
	slot_99_1_0 = entities.GetLocalPawn()

	if not slot_99_1_0 then
		return
	end

	slot_0_19_0.update_surf_state(slot_99_1_0)
	slot_0_19_0.do_px_dist_rec(arg_99_0)

	if not slot_0_11_0.features.autoalign.enabled then
		slot_0_19_0.is_active = false
		slot_0_19_0.current_side = ""

		return
	end

	slot_99_2_0 = game.input:GetViewAngles()
	slot_99_3_0 = arg_99_0:GetViewangles()
	slot_99_4_0 = slot_99_1_0:GetAbsVelocity()
	slot_99_5_0 = slot_99_1_0:GetAbsOrigin()
	slot_99_6_0 = slot_0_19_0.do_wall_detect(slot_99_5_0, 17, slot_0_19_0.yaw_offset * 5, slot_99_3_0, slot_99_4_0)
	slot_99_7_3 = 0

	if not slot_99_6_0 then
		slot_0_19_0.is_active = false
		slot_0_19_0.current_side = ""
		slot_99_7_2 = slot_0_19_0.latest_wall_data.side == "left" and 1 or -1
		slot_99_8_1 = slot_0_19_0.latest_wall_data.side == "left" and slot_0_19_0.latest_wall_data.distance or slot_0_19_0.latest_wall_data.distance - 0.43

		if slot_0_19_0.is_surfing and slot_0_11_0.features.autoalign.al_type == 1 then
			arg_99_0:SetViewangles(Vector(slot_99_3_0.x, slot_0_19_0.latest_wall_data.yaw - slot_99_8_1 * 10 * slot_99_7_2, slot_99_3_0.z))
			arg_99_0:SetLeftMove(-slot_99_7_2)
			arg_99_0:SetForwardMove(1)

			if game.globalVars.m_iTickCount - slot_0_19_0.dist_rec_info.start_tick - 30 == 0 then
				arg_99_0:SetViewangles(Vector(slot_99_3_0.x, slot_0_19_0.latest_wall_data.yaw + slot_99_8_1 * 10 * slot_99_7_2, slot_99_3_0.z))
				arg_99_0:SetLeftMove(slot_99_7_2)
			end

			arg_99_0:LockAngles()
		elseif slot_0_19_0.is_surfing and slot_0_11_0.features.autoalign.al_type == 0 and slot_0_11_0.features.autoalign.silent then
			arg_99_0:SetViewangles(Vector(slot_99_3_0.x, slot_0_19_0.latest_wall_data.yaw, slot_99_3_0.z))
		end

		return
	end

	slot_99_7_1 = slot_99_6_0.side == "left" and 1 or -1
	slot_0_19_0.is_active = true
	slot_0_19_0.current_side = slot_99_6_0.side
	slot_0_19_0.latest_wall_data = slot_99_6_0
	slot_99_8_0 = slot_99_6_0.distance or 0
	slot_99_9_0 = math.AngleNormalize(slot_99_6_0.yaw - slot_99_3_0.y)

	if math.abs(slot_99_9_0) > 90 then
		slot_99_6_0.yaw = math.AngleNormalize(slot_99_6_0.yaw + 180)
		slot_99_9_0 = math.AngleNormalize(slot_99_6_0.yaw - slot_99_3_0.y)
	end

	if slot_99_6_0.side == "right" then
		slot_99_8_0 = slot_99_8_0 - 0.43
	end

	if math.abs(slot_99_9_0) < slot_0_11_0.features.autoalign.fov and slot_99_8_0 < 0.12 then
		arg_99_0:SetViewangles(Vector(slot_99_3_0.x, slot_99_6_0.yaw, slot_99_3_0.z))

		slot_99_10_1 = slot_0_6_0.get_convar("sv_quantize_movement_input")

		if slot_99_10_1 and slot_99_10_1.value.i1 == 0 then
			arg_99_0:SetLeftMove(math.sin(math.rad(slot_99_6_0.yaw)) * 450)
		else
			arg_99_0:SetLeftMove(0)
		end
	end

	if slot_0_11_0.features.autoalign.autojump then
		slot_99_10_0 = bit.band(slot_99_1_0.m_fFlags:Get(), 1) ~= 0
		slot_99_11_0 = slot_99_1_0:IsAlive()
		slot_99_12_0 = slot_99_4_0:Length2d()

		if slot_99_10_0 and slot_99_11_0 and slot_99_12_0 >= slot_0_11_0.features.autoalign.aj_speed and slot_99_8_0 < slot_0_19_0.yaw_offset then
			arg_99_0:SetButton(InputBitMask_t.IN_JUMP)
			arg_99_0:SetButton(InputBitMask_t.IN_DUCK)
			arg_99_0:SetLeftMove(1)

			slot_99_7_0 = (slot_99_6_0.side == "right" and 0 or 1) * slot_99_7_1

			arg_99_0:SetViewangles(Vector(slot_99_3_0.x, slot_99_6_0.yaw + 3.14 * slot_99_7_0, slot_99_3_0.z))
		end
	end

	arg_99_0:LockAngles()

	slot_0_19_0.old_is_surfing = slot_0_19_0.is_surfing

	if slot_0_11_0.features.autoalign.silent then
		game.input:SetViewAngles(slot_99_2_0)
	end
end

slot_0_20_0 = {
	last_vel = 0,
	MAX_POINTS = 600,
	FALL_RATE = 0.3,
	CLIMB_RATE = 0.3,
	MAX_VELOCITY = 600,
	SAMPLE_RATE = 0.003,
	last_sample_time = 0,
	current_smoothed_velocity = 0,
	velocity_points = {},
	raw_velocities = {},
	binds = {},
	in_jump = {},
	px_status = {},
	config = {
		width = 300,
		x = 100,
		y = 100,
		height = 150,
		padding = 5
	},
	smooth_velocity = function(arg_100_0, arg_100_1)
		if #arg_100_0 < 1 then
			return 0
		end

		if #arg_100_0 == 1 then
			return arg_100_0[1]
		end

		local var_100_0 = 0
		local var_100_1 = math.min(3, #arg_100_0)

		for iter_100_0 = #arg_100_0 - var_100_1 + 1, #arg_100_0 do
			if arg_100_0[iter_100_0] then
				var_100_0 = var_100_0 + arg_100_0[iter_100_0]
			end
		end

		return var_100_0 / var_100_1
	end
}

function slot_0_20_0.func()
	if not slot_0_11_0.visuals.graph.enabled or not game.engine:InGame() then
		slot_0_20_0.velocity_points = {}
		slot_0_20_0.raw_velocities = {}
		slot_0_20_0.last_pos = nil
		slot_0_20_0.current_smoothed_velocity = 0

		return
	end

	slot_101_0_0, slot_101_1_0 = game.engine:GetScreenSize()
	slot_0_20_0.config.x = slot_101_0_0 / 2 - 150
	slot_0_20_0.config.y = slot_101_1_0 / 100 * slot_0_11_0.visuals.graph.position
	slot_101_2_0 = entities.GetLocalPawn()

	if not slot_101_2_0 then
		return
	end

	slot_101_3_0 = game.globalVars.m_flCurTime
	slot_101_4_0 = slot_0_20_0.config.x
	slot_101_5_0 = slot_0_20_0.config.y
	slot_101_6_0 = slot_0_20_0.config.width
	slot_101_7_0 = slot_0_20_0.config.height
	slot_101_8_0 = slot_0_20_0.config.padding
	slot_101_9_0 = slot_101_2_0:GetAbsOrigin()

	if not slot_101_9_0 then
		return
	end

	if slot_101_3_0 - slot_0_20_0.last_sample_time >= slot_0_20_0.SAMPLE_RATE and slot_0_20_0.last_pos then
		slot_101_11_0 = slot_101_9_0.x - slot_0_20_0.last_pos.x
		slot_101_12_0 = slot_101_9_0.y - slot_0_20_0.last_pos.y
		slot_101_13_0 = math.sqrt(slot_101_11_0 * slot_101_11_0 + slot_101_12_0 * slot_101_12_0)
		slot_101_13_0 = slot_101_13_0 > slot_0_20_0.MAX_VELOCITY and 0 or slot_101_13_0 / game.globalVars.m_flRenderFrameTime

		table.insert(slot_0_20_0.raw_velocities, slot_101_13_0)

		if #slot_0_20_0.raw_velocities > 5 then
			table.remove(slot_0_20_0.raw_velocities, 1)
		end

		slot_101_14_1 = slot_0_20_0.smooth_velocity(slot_0_20_0.raw_velocities, 0.7)

		if slot_101_14_1 > slot_0_20_0.current_smoothed_velocity then
			slot_0_20_0.current_smoothed_velocity = slot_0_20_0.current_smoothed_velocity + (slot_101_14_1 - slot_0_20_0.current_smoothed_velocity) * slot_0_20_0.CLIMB_RATE
		else
			slot_0_20_0.current_smoothed_velocity = slot_0_20_0.current_smoothed_velocity + (slot_101_14_1 - slot_0_20_0.current_smoothed_velocity) * slot_0_20_0.FALL_RATE
		end

		table.insert(slot_0_20_0.velocity_points, slot_0_20_0.current_smoothed_velocity)

		if #slot_0_20_0.velocity_points > slot_0_20_0.MAX_POINTS then
			table.remove(slot_0_20_0.velocity_points, 1)
		end

		if slot_0_2_0.jb:GetValue():Get() then
			table.insert(slot_0_20_0.binds, 1)
		else
			table.insert(slot_0_20_0.binds, 0)
		end

		if #slot_0_20_0.binds > slot_0_20_0.MAX_POINTS then
			table.remove(slot_0_20_0.binds, 1)
		end

		slot_101_15_1 = slot_101_2_0:GetAbsVelocity().z > 0 and slot_0_20_0.last_vel <= 0

		table.insert(slot_0_20_0.in_jump, slot_101_15_1)

		if #slot_0_20_0.in_jump > slot_0_20_0.MAX_POINTS then
			table.remove(slot_0_20_0.in_jump, 1)
		end

		table.insert(slot_0_20_0.px_status, slot_0_19_0.px_status)

		if #slot_0_20_0.px_status > slot_0_20_0.MAX_POINTS then
			table.remove(slot_0_20_0.px_status, 1)
		end

		slot_0_20_0.last_sample_time = slot_101_3_0
		slot_0_20_0.last_vel = slot_101_2_0:GetAbsVelocity().z
	end

	slot_0_20_0.last_pos = slot_101_9_0

	if #slot_0_20_0.velocity_points >= 2 then
		for iter_101_0 = 2, #slot_0_20_0.velocity_points do
			slot_101_15_0 = slot_101_4_0 + slot_101_8_0 + (iter_101_0 - 2) * ((slot_101_6_0 - slot_101_8_0 * 2) / slot_0_20_0.MAX_POINTS)
			slot_101_16_0 = slot_101_4_0 + slot_101_8_0 + (iter_101_0 - 1) * ((slot_101_6_0 - slot_101_8_0 * 2) / slot_0_20_0.MAX_POINTS)
			slot_101_17_0 = slot_101_5_0 + slot_101_7_0 - slot_101_8_0 - math.min(slot_0_20_0.velocity_points[iter_101_0 - 1], slot_0_20_0.MAX_VELOCITY) / slot_0_20_0.MAX_VELOCITY * (slot_101_7_0 - slot_101_8_0 * 2)
			slot_101_18_0 = slot_101_5_0 + slot_101_7_0 - slot_101_8_0 - math.min(slot_0_20_0.velocity_points[iter_101_0], slot_0_20_0.MAX_VELOCITY) / slot_0_20_0.MAX_VELOCITY * (slot_101_7_0 - slot_101_8_0 * 2)
			slot_101_19_0 = slot_101_15_0 - slot_0_20_0.config.x
			slot_101_20_0 = slot_0_11_0.visuals.graph.fade * 3
			slot_101_21_0 = 255 * math.min(slot_101_19_0 / slot_101_20_0, (300 - slot_101_19_0) / slot_101_20_0, 1)
			slot_101_22_0 = draw.Color(255, 255, 255, slot_101_21_0)

			if slot_0_20_0.px_status[iter_101_0] ~= 0 then
				slot_101_22_0 = draw.Color(255, 155, 155, slot_101_21_0)
			end

			if slot_0_20_0.px_status[iter_101_0] == 1 or slot_0_20_0.px_status[iter_101_0] == 3 then
				draw.surface:AddCircle(draw.Vec2(slot_101_16_0, slot_101_18_0), 2, slot_101_22_0)
			end

			draw.surface.font = slot_0_13_0.tahoma_bold_small or draw.surface.font

			if slot_0_20_0.binds[iter_101_0] ~= 0 and slot_0_20_0.in_jump[iter_101_0] and not slot_0_20_0.in_jump[iter_101_0 - 1] then
				draw.surface:AddText(draw.Vec2(slot_101_16_0, slot_101_18_0 - 24), "jb", draw.Color(255, 255, 255, slot_101_21_0))
			end

			draw.surface:AddLine(draw.Vec2(slot_101_15_0, slot_101_17_0), draw.Vec2(slot_101_16_0, slot_101_18_0), slot_101_22_0, 1)
		end
	end
end

slot_0_21_0 = {
	this_tick = false
}

function slot_0_21_0.func(arg_102_0)
	if not slot_0_11_0.jumpstats.edgebug then
		return
	end

	local var_102_0 = entities.GetLocalPawn()
	local var_102_1 = entities.GetLocalController()

	if not var_102_0 then
		return
	end

	if not var_102_1 then
		return
	end

	if not slot_0_21_0.previous_velocity then
		slot_0_21_0.previous_velocity = entities.GetLocalPawn():GetAbsVelocity()

		return
	end

	local var_102_2 = entities.GetLocalPawn():GetAbsVelocity()
	local var_102_3 = arg_102_0:GetViewangles().y
	local var_102_4 = false
	local var_102_5 = ffi.cast("uintptr_t*", var_102_1)[0]
	local var_102_6 = ffi.cast("int*", var_102_5 + 1929)[0]

	if var_102_2.z >= -7 and var_102_2.z < 0 and slot_0_21_0.previous_velocity.z <= -7 and var_102_6 ~= 1 then
		if not slot_0_19_0.is_surfing then
			print("edgebugged")
		end

		if slot_0_11_0.jumpstats.healthshot.edgebug and not slot_0_19_0.is_surfing then
			slot_0_12_0.play_effect_set(var_102_0)
		end

		var_102_4 = true
	end

	slot_0_21_0.this_tick = var_102_4
	slot_0_21_0.previous_velocity = var_102_2
end

slot_0_22_0 = {
	val = false
}

function slot_0_22_0.func(arg_103_0)
	if arg_103_0:get_name() == "round_start" then
		slot_0_22_0.val = true
		slot_0_20_0.velocity_points = {}
		slot_0_20_0.raw_velocities = {}
		slot_0_20_0.last_pos = nil
		slot_0_20_0.current_smoothed_velocity = 0
		slot_0_20_0.binds = {}
		slot_0_20_0.in_jump = {}
		slot_0_20_0.px_status = {}
	end
end

slot_0_23_0 = {
	jump_count = 0,
	sync_max = 0,
	was_jumpbug = false,
	edgebugged = false,
	sync = 0,
	previous_vec_velocity = Vector(0, 0, 0),
	jump_position = Vector(0, 0, 0),
	last_tick_pos = Vector(0, 0, 0)
}

function slot_0_23_0.func(arg_104_0)
	if not slot_0_11_0.jumpstats.enabled then
		slot_0_23_0.jump_position = Vector(0, 0, 0)
		slot_104_1_1 = entities.GetLocalPawn()
		slot_0_23_0.last_tick_pos = slot_104_1_1:GetAbsOrigin()
		slot_0_23_0.was_jumpbug = slot_0_2_0.jb:GetValue():Get()
		slot_0_23_0.sync = 0
		slot_0_23_0.sync_max = 0
		slot_0_23_0.edgebugged = false
		slot_0_23_0.jump_count = 0
		slot_0_23_0.previous_vec_velocity = slot_104_1_1:GetAbsVelocity()

		return
	end

	slot_104_1_0 = entities.GetLocalPawn()
	slot_104_2_0 = entities.GetLocalController()

	if not slot_104_1_0 then
		return
	end

	if not slot_104_2_0 then
		return
	end

	slot_104_3_0 = slot_104_1_0:GetAbsVelocity()
	slot_104_4_0 = slot_104_1_0:GetAbsOrigin()
	slot_104_5_1 = 0
	slot_104_6_0 = ffi.cast("uintptr_t*", slot_104_2_0)[0]
	slot_104_7_0 = ffi.cast("int*", slot_104_6_0 + 1929)[0]

	if slot_0_21_0.this_tick or slot_104_7_0 == 1 then
		slot_0_23_0.edgebugged = true
	end

	if slot_0_23_0.previous_vec_velocity.z <= 0 and slot_104_3_0.z > 1 then
		slot_0_23_0.jump_position = slot_0_23_0.last_tick_pos
		slot_0_23_0.was_jumpbug = slot_0_2_0.jb:GetValue():Get()
		slot_0_23_0.sync = 0
		slot_0_23_0.sync_max = 0
		slot_0_23_0.edgebugged = false
		slot_0_22_0.val = false
		slot_0_23_0.jump_count = slot_0_23_0.jump_count + 1
	elseif slot_0_23_0.previous_vec_velocity.z ~= 0 and slot_104_3_0.z == 0 then
		slot_104_5_0 = slot_104_4_0:Dist2d(slot_0_23_0.jump_position) - math.abs(slot_0_23_0.jump_position.z - slot_104_4_0.z)

		if slot_104_5_0 >= 200 and not slot_0_23_0.edgebugged and not slot_0_22_0.val then
			slot_104_8_0 = slot_0_23_0.sync / slot_0_23_0.sync_max * 100
			slot_104_9_0 = {
				distance = "",
				sync = ""
			}

			if slot_104_5_0 >= 250 then
				slot_104_9_0.distance = "\a"
			elseif slot_104_5_0 >= 220 then
				slot_104_9_0.distance = "\f"
			else
				slot_104_9_0.distance = "\x01"
			end

			if slot_104_8_0 >= 90 then
				slot_104_9_0.sync = "\a"
			elseif slot_104_8_0 >= 70 then
				slot_104_9_0.sync = "\f"
			else
				slot_104_9_0.sync = "\x01"
			end

			if slot_0_23_0.jump_count == 1 then
				print(string.format("lj: %s%d\x01, sync: %s%d\x01$", slot_104_9_0.distance, slot_104_5_0, slot_104_9_0.sync, slot_104_8_0))
			elseif slot_0_23_0.jump_count == 2 then
				if slot_0_23_0.was_jumpbug then
					print(string.format("jb: %s%d\x01, sync: %s%d\x01$", slot_104_9_0.distance, slot_104_5_0, slot_104_9_0.sync, slot_104_8_0))
				else
					print(string.format("bh: %s%d\x01, sync: %s%d\x01$", slot_104_9_0.distance, slot_104_5_0, slot_104_9_0.sync, slot_104_8_0))
				end
			elseif slot_0_23_0.jump_count == 3 then
				print(string.format("mbh: %s%d\x01, sync %s%d\x01$", slot_104_9_0.distance, slot_104_5_0, slot_104_9_0.sync, slot_104_8_0))
			elseif slot_0_23_0.jump_count > 0 and slot_0_23_0.jump_count < 6 then
				print(string.format("%dbh: %s%d\x01, sync %s%d\x01$", slot_0_23_0.jump_count, slot_104_9_0.distance, slot_104_5_0, slot_104_9_0.sync, slot_104_8_0))
			end

			if slot_0_23_0.jump_count > 0 and slot_0_23_0.jump_count < 6 and slot_0_11_0.jumpstats.healthshot.jumpstats then
				slot_0_12_0.play_effect_set(slot_104_1_0)
			end
		end

		slot_0_23_0.was_jumpbug = false
		slot_0_23_0.sync = 0
		slot_0_23_0.sync_max = 0
		slot_0_23_0.edgebugged = false
		slot_0_23_0.jump_count = 0
	elseif slot_0_23_0.previous_vec_velocity.z ~= 0 and slot_104_3_0.z ~= 0 then
		if slot_0_23_0.previous_vec_velocity.z ~= 0 and math.sqrt(slot_104_3_0.x * slot_104_3_0.x + slot_104_3_0.y * slot_104_3_0.y) - math.sqrt(slot_0_23_0.previous_vec_velocity.x * slot_0_23_0.previous_vec_velocity.x + slot_0_23_0.previous_vec_velocity.y * slot_0_23_0.previous_vec_velocity.y) > 0.0001 then
			slot_0_23_0.sync = slot_0_23_0.sync + 1
		end

		slot_0_23_0.sync_max = slot_0_23_0.sync_max + 1
	else
		slot_0_23_0.sync = 0
		slot_0_23_0.sync_max = 0
	end

	slot_0_23_0.last_tick_pos = slot_104_1_0:GetAbsOrigin()
	slot_0_23_0.previous_vec_velocity = slot_104_3_0
end

slot_0_24_0 = {
	detect_key = "　",
	last_time = 0,
	last_tag = "",
	last_pos = 0,
	setinfo_addr = utils.FindPattern("engine2.dll", "48 89 5C 24 ? 48 89 6C 24 ? 48 89 74 24 ? 57 41 56 41 57 48 83 EC ? 83 49"),
	call_addr = utils.FindPattern("engine2.dll", "E8 ? ? ? ? 48 8B 8B F0 00 00 00 48 8D 55 B7 41 B0 FF"),
	fnSetInfo = slot_0_3_0.find_pattern_cast("engine2.dll", "48 89 5C 24 ? 48 89 6C 24 ? 48 89 74 24 ? 57 41 56 41 57 48 83 EC ? 83 49", "void(__fastcall*)(void*, const char*, const char*)"),
	shellcode = ffi.new("uint8_t[12]", {
		72,
		184,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		255,
		224
	}),
	preset = {
		"$ c",
		"$ ce",
		"$ cel",
		"$ cele",
		"$ celer",
		"$ celeri",
		"$ celerit",
		"$ celerity",
		"$ celerity",
		"$ celerity",
		"$ celerity",
		"$ celerity",
		"$ elerity",
		"$ lerity",
		"$ erity",
		"$ rity",
		"$ ity",
		"$ ty",
		"$ y",
		"$ ",
		"$ ",
		"$ ",
		"$ ",
		"$ "
	},
	backup = {
		done = false,
		name = ""
	}
}

function slot_0_24_0.proxy(arg_105_0, arg_105_1, arg_105_2)
	local var_105_0 = ffi.string(arg_105_2):gsub(slot_0_24_0.detect_key, " "):gsub("\\n", "\n")

	return (slot_0_24_0.fnSetInfo(arg_105_0, arg_105_1, var_105_0))
end

slot_0_24_0.c_proxy = ffi.cast("void*(__fastcall*)(void*, const char*, const char*)", function(arg_106_0, arg_106_1, arg_106_2)
	return slot_0_24_0.proxy(arg_106_0, arg_106_1, arg_106_2)
end)
ffi.cast("void**", slot_0_24_0.shellcode + 2)[0] = ffi.cast("void*(__fastcall*)(void*, const char*, const char*)", slot_0_24_0.c_proxy)
slot_0_25_1, slot_0_26_1 = slot_0_3_0.allocate_near_call(slot_0_24_0.call_addr, 12)

if not slot_0_25_1 then
	error("ERROR: Could not allocate memory")

	return
end

slot_0_24_0.alloc_addr = slot_0_25_1

function slot_0_24_0.init()
	ffi.copy(slot_0_24_0.alloc_addr, slot_0_24_0.shellcode, 12)

	local var_107_0 = ffi.cast("int32_t*", ffi.cast("uintptr_t", slot_0_24_0.call_addr) + 1)[0]
	local var_107_1 = ffi.cast("int32_t", ffi.cast("uint8_t*", slot_0_24_0.alloc_addr) - (ffi.cast("uintptr_t", slot_0_24_0.call_addr) + 5))
	local var_107_2 = ffi.new("uint32_t[1]")

	slot_0_3_0.virtual_protect(ffi.cast("void*", ffi.cast("uintptr_t", slot_0_24_0.call_addr)), 5, 64, var_107_2)

	ffi.cast("int32_t*", ffi.cast("uintptr_t", slot_0_24_0.call_addr) + 1)[0] = var_107_1
	slot_0_6_0.get_convar("name").nFlags = 33408
end

function slot_0_24_0.set_clan_tag(arg_108_0, arg_108_1)
	local var_108_0 = entities.GetLocalController()

	if not var_108_0 then
		return
	end

	if not slot_0_24_0.backup.done then
		slot_0_24_0.backup.done = true
		slot_0_24_0.backup.name = var_108_0:GetName() or slot_0_10_0.player:GetName()

		return
	end

	local var_108_1 = ffi.string(slot_0_24_0.backup.name):gsub(" ", slot_0_24_0.detect_key)
	local var_108_2 = ffi.string(arg_108_0):gsub(" ", slot_0_24_0.detect_key)
	local var_108_3 = ffi.string(arg_108_1):gsub(" ", slot_0_24_0.detect_key)
	local var_108_4 = ""

	if (arg_108_1 == "" or arg_108_1 == slot_0_24_0.detect_key) and (arg_108_0 == "" or arg_108_0 == slot_0_24_0.detect_key) then
		var_108_4 = ("%s"):format(var_108_1)
	elseif arg_108_0 == "" or arg_108_0 == slot_0_24_0.detect_key then
		var_108_4 = ("%s%s%s"):format(var_108_1, slot_0_24_0.detect_key, var_108_3)
	elseif arg_108_1 == "" or arg_108_1 == slot_0_24_0.detect_key then
		var_108_4 = ("%s%s%s"):format(var_108_2, slot_0_24_0.detect_key, var_108_1)
	else
		var_108_4 = ("%s%s%s%s%s"):format(var_108_2, slot_0_24_0.detect_key, var_108_1, slot_0_24_0.detect_key, var_108_3)
	end

	game.engine:ClientCmd(("setinfo name %s"):format(var_108_4))
end

function slot_0_24_0.func()
	local var_109_0 = ""

	if not entities.GetLocalController() then
		return
	end

	local var_109_1 = ""
	local var_109_2 = slot_0_1_0 * 16
	local var_109_3 = math.abs(game.globalVars.m_flCurTime - slot_0_24_0.last_time or 0)
	local var_109_4 = slot_0_24_0.last_pos or 0

	if var_109_2 < var_109_3 then
		slot_0_24_0.last_time = game.globalVars.m_flCurTime
		var_109_4 = var_109_4 + 1

		if var_109_4 > #slot_0_24_0.preset then
			var_109_4 = 1
		end
	end

	local var_109_5 = slot_0_24_0.preset[var_109_4]

	if not slot_0_11_0.features.clantag.enabled then
		var_109_5 = ""
	end

	if slot_0_24_0.last_pos ~= var_109_4 then
		slot_0_24_0.set_clan_tag(var_109_5, var_109_0)

		slot_0_24_0.last_tag = var_109_5
		slot_0_24_0.last_pos = var_109_4
	end
end

slot_0_24_0.init()

slot_0_25_0 = {
	previous_velocity = 0,
	jump_velocity = 0,
	previous_vertical_velocity = 0,
	was_on_ground = false
}

function slot_0_25_0.func()
	if not slot_0_11_0.visuals.velocity.enabled or not game.engine:InGame() then
		return
	end

	local var_110_0 = entities.GetLocalPawn()

	if not var_110_0 then
		return
	end

	local var_110_1, var_110_2 = game.engine:GetScreenSize()
	local var_110_3 = draw.surface

	var_110_3.font = slot_0_13_0.tahoma_bold or var_110_3.font

	local var_110_4 = bit.band(var_110_0.m_fFlags:Get(), 1) ~= 0
	local var_110_5 = var_110_0:GetAbsVelocity()
	local var_110_6 = math.floor(math.sqrt(var_110_5.x * var_110_5.x + var_110_5.y * var_110_5.y) + 0.5)
	local var_110_7 = slot_0_11_0.visuals.velocity.color

	if var_110_6 < slot_0_25_0.jump_velocity then
		var_110_7 = slot_0_11_0.visuals.velocity.color_slower
	elseif var_110_6 > slot_0_25_0.jump_velocity then
		var_110_7 = slot_0_11_0.visuals.velocity.color_faster
	end

	if var_110_4 then
		var_110_3:AddText(draw.Vec2(var_110_1 / 2, var_110_2 / 100 * slot_0_11_0.visuals.velocity.position), string.format("%d", var_110_6), var_110_7, draw.TextParams.WithH(draw.TextAlignment.CENTER))
	else
		var_110_3:AddText(draw.Vec2(var_110_1 / 2, var_110_2 / 100 * slot_0_11_0.visuals.velocity.position), string.format("%d (%d)", var_110_6, slot_0_25_0.jump_velocity), var_110_7, draw.TextParams.WithH(draw.TextAlignment.CENTER))
	end

	if slot_0_25_0.was_on_ground and var_110_4 then
		slot_0_25_0.jump_velocity = 0
	end

	if slot_0_25_0.previous_vertical_velocity <= 0 and var_110_5.z > 0 then
		slot_0_25_0.jump_velocity = slot_0_25_0.previous_velocity
	end

	slot_0_25_0.was_on_ground = var_110_4
	slot_0_25_0.previous_velocity = var_110_6
	slot_0_25_0.previous_vertical_velocity = var_110_5.z
end

slot_0_26_0 = {
	last_start_x = 0,
	last_active_count = 0,
	lerp = {
		jb = {
			val = 0,
			amount = 0
		},
		ns = {
			val = 0,
			amount = 0
		},
		mj = {
			val = 0,
			amount = 0
		},
		lj = {
			val = 0,
			amount = 0
		},
		ej = {
			val = 0,
			amount = 0
		},
		al = {
			val = 0,
			amount = 0
		}
	},
	previous_positions = {
		al = 0,
		ej = 0,
		lj = 0,
		mj = 0,
		jb = 0,
		ns = 0
	}
}

function slot_0_26_0.create_move()
	if slot_0_2_0.jb:GetValue():Get() then
		slot_0_26_0.lerp.jb.amount = math.Clamp(slot_0_26_0.lerp.jb.amount + 0.15, 0, 1)
	else
		slot_0_26_0.lerp.jb.amount = math.Clamp(slot_0_26_0.lerp.jb.amount - 0.15, 0, 1)
	end

	slot_0_26_0.lerp.jb.val = math.Lerp(0, 255, slot_0_26_0.lerp.jb.amount)

	if slot_0_2_0.rb:GetValue():Get() and slot_0_2_0.ns:GetValue():Get() and slot_0_2_0.fns:GetValue():Get() and not slot_0_11_0.visuals.binds.hide_ns then
		slot_0_26_0.lerp.ns.amount = math.Clamp(slot_0_26_0.lerp.ns.amount + 0.15, 0, 1)
	else
		slot_0_26_0.lerp.ns.amount = math.Clamp(slot_0_26_0.lerp.ns.amount - 0.15, 0, 1)
	end

	slot_0_26_0.lerp.ns.val = math.Lerp(0, 255, slot_0_26_0.lerp.ns.amount)

	if slot_0_11_0.jump_types.minijump then
		slot_0_26_0.lerp.mj.amount = math.Clamp(slot_0_26_0.lerp.mj.amount + 0.15, 0, 1)
	else
		slot_0_26_0.lerp.mj.amount = math.Clamp(slot_0_26_0.lerp.mj.amount - 0.15, 0, 1)
	end

	slot_0_26_0.lerp.mj.val = math.Lerp(0, 255, slot_0_26_0.lerp.mj.amount)

	if slot_0_11_0.jump_types.longjump then
		slot_0_26_0.lerp.lj.amount = math.Clamp(slot_0_26_0.lerp.lj.amount + 0.15, 0, 1)
	else
		slot_0_26_0.lerp.lj.amount = math.Clamp(slot_0_26_0.lerp.lj.amount - 0.15, 0, 1)
	end

	slot_0_26_0.lerp.lj.val = math.Lerp(0, 255, slot_0_26_0.lerp.lj.amount)

	if slot_0_2_0.ej:GetValue():Get() then
		slot_0_26_0.lerp.ej.amount = math.Clamp(slot_0_26_0.lerp.ej.amount + 0.15, 0, 1)
	else
		slot_0_26_0.lerp.ej.amount = math.Clamp(slot_0_26_0.lerp.ej.amount - 0.15, 0, 1)
	end

	slot_0_26_0.lerp.ej.val = math.Lerp(0, 255, slot_0_26_0.lerp.ej.amount)

	if slot_0_11_0.features.autoalign.enabled then
		slot_0_26_0.lerp.al.amount = math.Clamp(slot_0_26_0.lerp.al.amount + 0.15, 0, 1)
	else
		slot_0_26_0.lerp.al.amount = math.Clamp(slot_0_26_0.lerp.al.amount - 0.15, 0, 1)
	end

	slot_0_26_0.lerp.al.val = math.Lerp(0, 255, slot_0_26_0.lerp.al.amount)
end

function slot_0_26_0.func()
	if not slot_0_11_0.visuals.binds.enabled or not game.engine:InGame() then
		return
	end

	slot_112_0_0, slot_112_1_0 = game.engine:GetScreenSize()
	slot_112_2_0 = draw.surface
	slot_112_2_0.font = slot_0_13_0.tahoma_bold or slot_112_2_0.font
	slot_112_3_0 = 48
	slot_112_4_0 = {}

	table.insert(slot_112_4_0, {
		type = "jb",
		alpha = slot_0_26_0.lerp.jb.val,
		active = slot_0_2_0.jb:GetValue():Get()
	})
	table.insert(slot_112_4_0, {
		type = "ns",
		alpha = slot_0_26_0.lerp.ns.val,
		active = slot_0_2_0.rb:GetValue():Get() and slot_0_2_0.ns:GetValue():Get() and slot_0_2_0.fns:GetValue():Get() and not slot_0_11_0.visuals.binds.hide_ns
	})
	table.insert(slot_112_4_0, {
		type = "lj",
		alpha = slot_0_26_0.lerp.lj.val,
		active = slot_0_11_0.jump_types.longjump
	})
	table.insert(slot_112_4_0, {
		type = "mj",
		alpha = slot_0_26_0.lerp.mj.val,
		active = slot_0_11_0.jump_types.minijump
	})
	table.insert(slot_112_4_0, {
		type = "ej",
		alpha = slot_0_26_0.lerp.ej.val,
		active = slot_0_2_0.ej:GetValue():Get()
	})
	table.insert(slot_112_4_0, {
		type = "al",
		alpha = slot_0_26_0.lerp.al.val,
		active = slot_0_11_0.features.autoalign.enabled
	})

	slot_112_5_0 = 0

	for iter_112_0, iter_112_1 in ipairs(slot_112_4_0) do
		if iter_112_1.active then
			slot_112_5_0 = slot_112_5_0 + 1
		end
	end

	slot_112_6_0 = (slot_112_5_0 - 1) * slot_112_3_0
	slot_112_7_0 = slot_112_0_0 / 2 - slot_112_6_0 / 2

	if math.abs(slot_112_7_0 - slot_0_26_0.last_start_x) > 0.1 then
		slot_0_26_0.last_start_x = math.Lerp(slot_0_26_0.last_start_x, slot_112_7_0, 0.15)
	else
		slot_0_26_0.last_start_x = slot_112_7_0
	end

	slot_0_26_0.last_active_count = slot_112_5_0
	slot_112_8_0 = 0
	slot_112_9_0 = slot_112_1_0 / 100 * slot_0_11_0.visuals.binds.position

	for iter_112_2, iter_112_3 in ipairs(slot_112_4_0) do
		slot_112_15_0 = slot_0_11_0.visuals.binds.color
		slot_112_16_0 = {
			jb = (function()
				local var_113_0 = Ray_t()
				local var_113_1 = game.physicsQueryInterface:TraceMovement(var_113_0, entities.GetLocalPawn():GetAbsOrigin(), entities.GetLocalPawn():GetAbsOrigin() - Vector(0, 0, 64))

				return {
					active = var_113_1.m_flFraction >= 0.97,
					multiplier = math.Clamp(1 - var_113_1.m_flFraction, slot_112_15_0:GetA() / 255, 1),
					frac = var_113_1.m_flFraction
				}
			end)(),
			al = {
				multiplier = 1,
				active = slot_0_19_0.is_surfing
			}
		}
		slot_112_17_0 = bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) ~= 0

		if iter_112_3.type == "jb" and not slot_112_17_0 then
			slot_112_15_0 = draw.Color(math.Lerp(slot_112_15_0:GetR(), slot_0_11_0.visuals.binds.color_act:GetR(), 1 - slot_112_16_0.jb.frac), math.Lerp(slot_112_15_0:GetG(), slot_0_11_0.visuals.binds.color_act:GetG(), 1 - slot_112_16_0.jb.frac), math.Lerp(slot_112_15_0:GetB(), slot_0_11_0.visuals.binds.color_act:GetB(), 1 - slot_112_16_0.jb.frac), math.Lerp(slot_112_15_0:GetA(), slot_0_11_0.visuals.binds.color_act:GetA(), 1 - slot_112_16_0.jb.frac))
		elseif iter_112_3.type == "al" and slot_112_16_0.al.active then
			slot_112_15_0 = slot_0_11_0.visuals.binds.color_act
		end

		if iter_112_3.alpha > 0 then
			slot_112_18_0 = nil

			if iter_112_3.active then
				slot_112_18_0 = slot_0_26_0.last_start_x + slot_112_8_0 * slot_112_3_0
				slot_112_8_0 = slot_112_8_0 + 1
			else
				slot_112_19_1 = 0

				for iter_112_4 = 1, iter_112_2 - 1 do
					if slot_112_4_0[iter_112_4].active then
						slot_112_19_1 = slot_112_19_1 + 1
					end
				end

				slot_112_18_0 = slot_0_26_0.last_start_x + slot_112_19_1 * slot_112_3_0
			end

			if math.abs(slot_112_18_0 - slot_0_26_0.previous_positions[iter_112_3.type]) > 0.1 then
				slot_0_26_0.previous_positions[iter_112_3.type] = math.Lerp(slot_0_26_0.previous_positions[iter_112_3.type], slot_112_18_0, 0.15)
			else
				slot_0_26_0.previous_positions[iter_112_3.type] = slot_112_18_0
			end

			slot_112_19_0 = slot_0_26_0.previous_positions[iter_112_3.type]

			slot_112_2_0:AddText(draw.Vec2(slot_112_19_0, slot_112_9_0), iter_112_3.type, draw.Color(slot_112_15_0:GetR(), slot_112_15_0:GetG(), slot_112_15_0:GetB(), iter_112_3.alpha * (slot_112_15_0:GetA() / 255)), draw.TextParams.WithH(draw.TextAlignment.CENTER))
		else
			slot_0_26_0.previous_positions[iter_112_3.type] = slot_112_0_0 / 2
		end
	end
end

slot_0_27_0 = {
	buttons = {
		back = false,
		forward = false,
		duck = false,
		left = false,
		jump = false,
		right = false
	}
}

function slot_0_27_0.create_move(arg_114_0)
	slot_0_27_0.buttons.forward = arg_114_0:GetButton(InputBitMask_t.IN_FORWARD)
	slot_0_27_0.buttons.back = arg_114_0:GetButton(InputBitMask_t.IN_BACK)
	slot_0_27_0.buttons.left = arg_114_0:GetButton(InputBitMask_t.IN_MOVELEFT)
	slot_0_27_0.buttons.right = arg_114_0:GetButton(InputBitMask_t.IN_MOVERIGHT)
	slot_0_27_0.buttons.jump = arg_114_0:GetButton(InputBitMask_t.IN_JUMP)
	slot_0_27_0.buttons.duck = arg_114_0:GetButton(InputBitMask_t.IN_DUCK)
end

function slot_0_27_0.func()
	if not slot_0_11_0.visuals.keystrokes.enabled or not game.engine:InGame() then
		return
	end

	slot_115_0_0, slot_115_1_0 = game.engine:GetScreenSize()
	slot_115_2_0 = draw.surface
	slot_115_2_0.font = slot_0_13_0.tahoma_bold or slot_115_2_0.font
	slot_115_3_0 = {
		"",
		""
	}
	slot_115_4_0 = slot_0_27_0.buttons

	if slot_0_11_0.visuals.keystrokes.layout == 0 then
		if slot_115_4_0.duck then
			slot_115_3_0[1] = slot_115_3_0[1] .. "C "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.forward then
			slot_115_3_0[1] = slot_115_3_0[1] .. "W "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.jump then
			slot_115_3_0[1] = slot_115_3_0[1] .. "J"
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_"
		end

		if slot_115_4_0.left then
			slot_115_3_0[2] = slot_115_3_0[2] .. "A "
		else
			slot_115_3_0[2] = slot_115_3_0[2] .. "_ "
		end

		if slot_115_4_0.back then
			slot_115_3_0[2] = slot_115_3_0[2] .. "S "
		else
			slot_115_3_0[2] = slot_115_3_0[2] .. "_ "
		end

		if slot_115_4_0.right then
			slot_115_3_0[2] = slot_115_3_0[2] .. "D"
		else
			slot_115_3_0[2] = slot_115_3_0[2] .. "_"
		end
	elseif slot_0_11_0.visuals.keystrokes.layout == 1 then
		if slot_115_4_0.forward then
			slot_115_3_0[1] = slot_115_3_0[1] .. "W "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.left then
			slot_115_3_0[1] = slot_115_3_0[1] .. "A "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.back then
			slot_115_3_0[1] = slot_115_3_0[1] .. "S "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.right then
			slot_115_3_0[1] = slot_115_3_0[1] .. "D   "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_   "
		end

		if slot_115_4_0.jump then
			slot_115_3_0[1] = slot_115_3_0[1] .. "J "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.duck then
			slot_115_3_0[1] = slot_115_3_0[1] .. "C"
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end
	elseif slot_0_11_0.visuals.keystrokes.layout == 2 then
		if slot_115_4_0.jump then
			slot_115_3_0[2] = slot_115_3_0[2] .. "J "
		else
			slot_115_3_0[2] = slot_115_3_0[2] .. "_ "
		end

		if slot_115_4_0.duck then
			slot_115_3_0[2] = slot_115_3_0[2] .. "C"
		else
			slot_115_3_0[2] = slot_115_3_0[2] .. "_"
		end

		if slot_115_4_0.forward then
			slot_115_3_0[1] = slot_115_3_0[1] .. "W "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.left then
			slot_115_3_0[1] = slot_115_3_0[1] .. "A "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.back then
			slot_115_3_0[1] = slot_115_3_0[1] .. "S "
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_ "
		end

		if slot_115_4_0.right then
			slot_115_3_0[1] = slot_115_3_0[1] .. "D"
		else
			slot_115_3_0[1] = slot_115_3_0[1] .. "_"
		end
	end

	slot_115_2_0:AddText(draw.Vec2(slot_115_0_0 / 2, slot_115_1_0 / 100 * slot_0_11_0.visuals.keystrokes.position), string.format(slot_115_3_0[1]), draw.Color(255, 255, 255, 255), draw.TextParams.WithH(draw.TextAlignment.CENTER))
	slot_115_2_0:AddText(draw.Vec2(slot_115_0_0 / 2, slot_115_1_0 / 100 * slot_0_11_0.visuals.keystrokes.position + 32), string.format(slot_115_3_0[2]), draw.Color(255, 255, 255, 255), draw.TextParams.WithH(draw.TextAlignment.CENTER))
end

slot_0_28_0 = {}
slot_0_29_1 = nil

function slot_0_28_0.func(arg_116_0)
	if not slot_0_11_0.mouse_speed_limit.enabled then
		slot_0_29_1 = nil

		return
	end

	if not slot_0_29_1 then
		slot_0_29_1 = arg_116_0:GetViewangles()

		return
	end

	local var_116_0 = slot_0_11_0.mouse_speed_limit.MAX_CHANGE
	local var_116_1 = arg_116_0:GetViewangles()
	local var_116_2 = math.AngleNormalize(var_116_1.x - slot_0_29_1.x)
	local var_116_3 = math.AngleNormalize(var_116_1.y - slot_0_29_1.y)

	if math.abs(var_116_3) >= var_116_0.y then
		var_116_1.y = slot_0_29_1.y + math.Clamp(var_116_3, -var_116_0.y, var_116_0.y)
	end

	if math.abs(var_116_2) >= var_116_0.x then
		var_116_1.x = slot_0_29_1.x + math.Clamp(var_116_2, -var_116_0.x, var_116_0.x)
	end

	game.input:SetViewAngles(var_116_1)
	arg_116_0:SetViewangles(var_116_1)
	arg_116_0:LockAngles()

	slot_0_29_1 = var_116_1
end

slot_0_29_0 = {
	func = function()
		if not slot_0_11_0.features.null_strafe.enabled then
			return
		end

		local var_117_0 = entities.GetLocalPawn()

		if not var_117_0 then
			return
		end

		local var_117_1 = bit.band(var_117_0.m_fFlags:Get(), 1) ~= 0

		slot_0_2_0.es:GetValue():Set(not var_117_1)
	end
}
slot_0_30_0 = {
	get_dlight_idx = nil,
	dlight_manager_pre = slot_0_3_0.find_pattern_cast("client.dll", "45 33 C0 48 8B 0D ? ? ? ? BA 01 00 00 00 E8", "int64_t")
}

if slot_0_30_0.dlight_manager_pre == 0 then
	error("couldnt find dlight_manager_pre")
end

slot_0_30_0.dlight_manager = ffi.cast("void**", slot_0_3_0.absolute(slot_0_30_0.dlight_manager_pre, 6))
slot_0_30_0.get_dlight_idx_pre = slot_0_3_0.absolute(slot_0_30_0.dlight_manager_pre, 16, 0)

if not slot_0_30_0.get_dlight_idx_pre or slot_0_30_0.get_dlight_idx_pre < 268435456 or slot_0_30_0.get_dlight_idx_pre > 140737488355327 then
	error("invalid get_dlight_idx_pre pointer")
end

slot_0_30_0.get_dlight_idx = ffi.cast("uint8_t*(__fastcall*)(void*, uint32_t, int32_t)", slot_0_30_0.get_dlight_idx_pre)

function slot_0_30_0.func()
	if not slot_0_11_0.features.dlight.enabled or not game.engine:InGame() then
		return
	end

	local var_118_0 = slot_0_30_0.dlight_manager[0]
	local var_118_1 = tonumber(ffi.cast("uint64_t", var_118_0))

	if not var_118_1 or var_118_1 < 268435456 or var_118_1 > 140737488355327 then
		return
	end

	local var_118_2 = entities.GetLocalPawn()

	if not var_118_2 then
		return
	end

	local var_118_3 = var_118_2:GetAbsOrigin()
	local var_118_4 = slot_0_30_0.get_dlight_idx(var_118_0, 1, 0)
	local var_118_5 = tonumber(ffi.cast("uint64_t", var_118_4))

	if not var_118_5 or var_118_5 < 268435456 or var_118_5 > 140737488355327 then
		return
	end

	local var_118_6 = slot_0_11_0.features.dlight.color
	local var_118_7 = var_118_6:GetR()
	local var_118_8 = var_118_6:GetG()
	local var_118_9 = var_118_6:GetB()
	local var_118_10 = var_118_6:GetA() / 255 * 6

	ffi.cast("float*", var_118_4 + 4)[0] = var_118_3.x
	ffi.cast("float*", var_118_4 + 8)[0] = var_118_3.y
	ffi.cast("float*", var_118_4 + 12)[0] = var_118_3.z + 10
	ffi.cast("float*", var_118_4 + 16)[0] = 10
	ffi.cast("uint32_t*", var_118_4 + 20)[0] = bit.bor(var_118_7, bit.lshift(var_118_8, 8), bit.lshift(var_118_9, 16), bit.lshift(var_118_10, 24))
	ffi.cast("float*", var_118_4 + 24)[0] = game.globalVars.m_flCurTime + slot_0_1_0
	ffi.cast("float*", var_118_4 + 28)[0] = 42
end

events.presentQueue:Add(slot_0_30_0.func)

function slot_0_31_0(arg_119_0)
	local var_119_0 = entities.GetLocalPawn()

	if not var_119_0 then
		return
	end

	local var_119_1 = bit.band(var_119_0.m_fFlags:Get(), 1) ~= 0

	if var_119_1 and slot_0_11_0.jump_types.longjump then
		arg_119_0:SetButton(InputBitMask_t.IN_JUMP)
		arg_119_0:SetButton(InputBitMask_t.IN_DUCK)
		arg_119_0:RemoveButton(InputBitMask_t.IN_FORWARD)
		arg_119_0:RemoveButton(InputBitMask_t.IN_BACK)
	elseif slot_0_11_0.jump_types.longjump then
		arg_119_0:RemoveButton(InputBitMask_t.IN_FORWARD)
		arg_119_0:RemoveButton(InputBitMask_t.IN_BACK)
	elseif var_119_1 and slot_0_11_0.jump_types.minijump then
		arg_119_0:SetButton(InputBitMask_t.IN_JUMP)
		arg_119_0:SetButton(InputBitMask_t.IN_DUCK)
	elseif slot_0_11_0.jump_types.minijump then
		arg_119_0:SetButton(InputBitMask_t.IN_DUCK)
	end
end

slot_0_32_0 = {
	index = 0,
	position = {},
	angles = {},
	binds = {
		remove_checkpoint = false,
		tp_to_checkpoint = false,
		next_checkpoint = false,
		last_checkpoint = false,
		set_checkpoint = false
	}
}

slot_0_17_0.practice.items.set_checkpoint:AddCallback(function()
	if not slot_0_17_0.practice.items.set_checkpoint:GetValue():Get() then
		return
	end

	slot_0_32_0.binds.set_checkpoint = true

	slot_0_17_0.practice.items.set_checkpoint:SetValue(false)
end)
slot_0_17_0.practice.items.remove_checkpoint:AddCallback(function()
	if not slot_0_17_0.practice.items.remove_checkpoint:GetValue():Get() then
		return
	end

	slot_0_32_0.binds.remove_checkpoint = true

	slot_0_17_0.practice.items.remove_checkpoint:SetValue(false)
end)
slot_0_17_0.practice.items.tp_to_checkpoint:AddCallback(function()
	if not slot_0_17_0.practice.items.tp_to_checkpoint:GetValue():Get() then
		return
	end

	slot_0_32_0.binds.tp_to_checkpoint = true

	slot_0_17_0.practice.items.tp_to_checkpoint:SetValue(false)
end)
slot_0_17_0.practice.items.next_checkpoint:AddCallback(function()
	if not slot_0_17_0.practice.items.next_checkpoint:GetValue():Get() then
		return
	end

	slot_0_32_0.binds.next_checkpoint = true

	slot_0_17_0.practice.items.next_checkpoint:SetValue(false)
end)
slot_0_17_0.practice.items.last_checkpoint:AddCallback(function()
	if not slot_0_17_0.practice.items.last_checkpoint:GetValue():Get() then
		return
	end

	slot_0_32_0.binds.last_checkpoint = true

	slot_0_17_0.practice.items.last_checkpoint:SetValue(false)
end)

function slot_0_32_0.func(arg_125_0)
	slot_125_1_0 = entities.GetLocalPawn()

	if not slot_125_1_0 or not slot_125_1_0:IsAlive() then
		slot_0_32_0.binds.set_checkpoint = false
		slot_0_32_0.binds.remove_checkpoint = false
		slot_0_32_0.binds.tp_to_checkpoint = false
		slot_0_32_0.binds.next_checkpoint = false
		slot_0_32_0.binds.last_checkpoint = false

		return
	end

	if slot_0_32_0.binds.set_checkpoint then
		slot_125_2_4 = #slot_0_32_0.position + 1
		slot_0_32_0.angles[slot_125_2_4] = arg_125_0:GetViewangles()
		slot_0_32_0.position[slot_125_2_4] = slot_125_1_0:GetAbsOrigin()
		slot_0_32_0.index = slot_125_2_4

		print(string.format("checkpoint %d saved (total: %d)", slot_0_32_0.index, #slot_0_32_0.position))

		slot_0_32_0.binds.set_checkpoint = false
	end

	if slot_0_32_0.binds.next_checkpoint then
		slot_125_2_3 = #slot_0_32_0.position

		if slot_125_2_3 > 0 then
			if slot_0_32_0.index == 0 then
				slot_0_32_0.index = 1
			else
				slot_0_32_0.index = slot_0_32_0.index % slot_125_2_3 + 1
			end

			print(string.format("selected checkpoint %d of %d", slot_0_32_0.index, slot_125_2_3))
		else
			print("no checkpoints available")
		end

		slot_0_32_0.binds.next_checkpoint = false
	end

	if slot_0_32_0.binds.last_checkpoint then
		slot_125_2_2 = #slot_0_32_0.position

		if slot_125_2_2 > 0 then
			if slot_0_32_0.index == 0 then
				slot_0_32_0.index = slot_125_2_2
			else
				slot_0_32_0.index = (slot_0_32_0.index - 2) % slot_125_2_2 + 1
			end

			print(string.format("selected checkpoint %d of %d", slot_0_32_0.index, slot_125_2_2))
		else
			print("no checkpoints available")
		end

		slot_0_32_0.binds.last_checkpoint = false
	end

	if slot_0_32_0.binds.tp_to_checkpoint then
		slot_125_2_1 = slot_0_32_0.index
		slot_125_3_0 = slot_125_2_1 > 0 and slot_0_32_0.position[slot_125_2_1] or nil
		slot_125_4_0 = slot_125_2_1 > 0 and slot_0_32_0.angles[slot_125_2_1] or nil

		if slot_125_3_0 and slot_125_4_0 then
			game.engine:ClientCmd(string.format("setang_exact %f %f;setpos_exact %f %f %f", slot_125_4_0.x, slot_125_4_0.y, slot_125_3_0.x, slot_125_3_0.y, slot_125_3_0.z))
			print(string.format("teleported to checkpoint %d", slot_125_2_1))
		else
			print("no checkpoint selected/available")
		end

		slot_0_32_0.binds.tp_to_checkpoint = false
	end

	if slot_0_32_0.binds.remove_checkpoint then
		slot_125_2_0 = slot_0_32_0.index

		if slot_125_2_0 > 0 and slot_0_32_0.position[slot_125_2_0] and slot_0_32_0.angles[slot_125_2_0] then
			table.remove(slot_0_32_0.position, slot_125_2_0)
			table.remove(slot_0_32_0.angles, slot_125_2_0)

			if #slot_0_32_0.position == 0 then
				slot_0_32_0.index = 0
			elseif slot_0_32_0.index > #slot_0_32_0.position then
				slot_0_32_0.index = #slot_0_32_0.position
			end

			print(string.format("checkpoint %d removed (remaining: %d)", slot_125_2_0, #slot_0_32_0.position))
		else
			print("no checkpoint to remove")
		end

		slot_0_32_0.binds.remove_checkpoint = false
	end
end

slot_0_32_0.render_ui = gui.LuaControlProto()

function slot_0_32_0.render_ui.onRender(arg_126_0, arg_126_1, arg_126_2, arg_126_3, arg_126_4)
	if not slot_0_11_0.practice.render_ui then
		return
	end

	local var_126_0 = game.cvar:Find("sv_cheats") and game.cvar:Find("sv_cheats").value

	if var_126_0 then
		arg_126_4.y = arg_126_4.y + 18
	end

	slot_0_14_0.create_window(arg_126_1, arg_126_3, arg_126_4, "practice")

	local var_126_1 = {
		x = 9,
		y = 27
	}

	if var_126_0 then
		arg_126_1:AddText(draw.Vec2(arg_126_3.x + var_126_1.x, arg_126_3.y + var_126_1.y), "current checkpoint: " .. tostring(slot_0_32_0.index), draw.Color(115, 115, 115, 255))

		var_126_1.y = var_126_1.y + 18

		arg_126_1:AddText(draw.Vec2(arg_126_3.x + var_126_1.x, arg_126_3.y + var_126_1.y), "checkpoints amount: " .. tostring(#slot_0_32_0.position), draw.Color(115, 115, 115, 255))

		var_126_1.y = var_126_1.y + 18
	else
		arg_126_1:AddText(draw.Vec2(arg_126_3.x + (arg_126_4.x - arg_126_3.x) / 2, arg_126_3.y + var_126_1.y), "set sv_cheats to true", draw.Color(115, 115, 115, 255), draw.TextParams.WithH(draw.TextAlignment.CENTER))
	end
end

slot_0_33_2 = gui.LuaWidgetControl("celerity2>practice_ui", slot_0_32_0.render_ui, draw.Vec2(), draw.Vec2(150, 44))

slot_0_33_2:ToggleVisibility(true)

slot_0_33_2.renderBackground = false

gui.ctx:Add(slot_0_33_2)

slot_0_33_1 = nil
slot_0_34_1 = nil

function slot_0_33_0(arg_127_0)
	if arg_127_0.entry.entity:GetActiveWeapon() then
		local var_127_0 = entities.GetLocalPawn()
		local var_127_1 = var_127_0:GetEyePos()
		local var_127_2 = var_127_0:GetActiveWeapon()
		local var_127_3 = arg_127_0.entry.entity

		if not var_127_3 then
			return
		end

		local var_127_4 = var_127_3:GetAbsVelocity()
		local var_127_5 = var_127_4.z

		if slot_0_11_0.esp_addons.distance then
			arg_127_0:AddText(EspItemPos.LEFT, draw.Color.White(), string.format("%du ", var_127_0:GetAbsOrigin():Dist2d(var_127_3:GetAbsOrigin())))
		end

		if slot_0_11_0.esp_addons.velocity then
			arg_127_0:AddText(EspItemPos.LEFT, draw.Color.White(), string.format("%du ", var_127_4:Length2d()))
		end
	end
end

;({}).func = function()
	if not slot_0_0_0 == 0 then
		return
	end

	local var_128_0 = draw.surface

	var_128_0.font = slot_0_13_0.tahoma_bold or draw.fonts.gui_main or var_128_0.font

	local var_128_1 = entities.GetLocalPawn()

	if not var_128_1 then
		return
	end

	local var_128_2, var_128_3 = game.engine:GetScreenSize()
	local var_128_4 = ""

	if var_128_1.m_iHealth then
		var_128_4 = var_128_4 .. tostring(var_128_1.m_iHealth:Get()) .. "hp"
	end

	var_128_0:AddText(draw.Vec2(var_128_2 / 2, var_128_3 / 10 * 9), var_128_4, draw.Color.White(), draw.TextParams.WithH(draw.TextAlignment.CENTER))

	for iter_128_0 = 1, #slot_0_9_0.table do
		var_128_0:AddText(draw.Vec2(var_128_2 / 2, var_128_3 / 100 * (89 - iter_128_0 * 4)), slot_0_9_0.table[iter_128_0].text, draw.Color.White(), draw.TextParams.WithH(draw.TextAlignment.CENTER))
	end
end
slot_0_35_0 = {
	state = false
}

function slot_0_35_0.func()
	slot_0_6_0.get_convar("cl_drawhud").nFlags = slot_0_6_0.flags.FCVAR_CLIENTDLL

	if slot_0_35_0.state == false and slot_0_11_0.features.hide_hud.enabled then
		game.engine:ClientCmd(("cl_drawhud %s"):format(tostring(slot_0_35_0.state)))

		slot_0_35_0.state = true
	elseif slot_0_35_0.state == true and not slot_0_11_0.features.hide_hud.enabled then
		game.engine:ClientCmd(("cl_drawhud %s"):format(tostring(slot_0_35_0.state)))

		slot_0_35_0.state = false
	end
end

events.createMove:Add(slot_0_28_0.func)
events.createMove:Add(slot_0_29_0.func)
events.createMove:Add(slot_0_19_0.func)
events.createMove:Add(slot_0_26_0.create_move)
events.createMove:Add(slot_0_27_0.create_move)
events.createMove:Add(slot_0_21_0.func)
events.createMove:Add(slot_0_23_0.func)
events.createMove:Add(slot_0_31_0)
events.createMove:Add(slot_0_32_0.func)
events.createMove:Add(slot_0_35_0.func)
events.createMove:Add(slot_0_29_0.func)
events.presentQueue:Add(slot_0_20_0.func)
events.presentQueue:Add(slot_0_24_0.func)
events.presentQueue:Add(slot_0_25_0.func)
events.presentQueue:Add(slot_0_26_0.func)
events.presentQueue:Add(slot_0_27_0.func)
events.presentQueue:Add(slot_0_18_0)
events.presentQueue:Add(slot_0_9_0.listener)
events.event:Add(slot_0_22_0.func)
events.playerInfoPre:Add(slot_0_33_0)

function slot_0_36_0()
	print("loaded recode")
end

function __shutdown()
	slot_0_11_0.features.clantag.enabled = false

	game.engine:ClientCmd("cl_drawhud true")
end

slot_0_36_0()
