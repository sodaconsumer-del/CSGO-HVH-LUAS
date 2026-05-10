--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

if not ffi or not ws.test_capability("ffi") then
	game.engine:client_cmd("showconsole")
	gui.notify:add(gui.notification("[Weapon] Model Changer", "Error: make sure \"allow insecure is open\""))
	assert(ffi, "model changer error: ffi is invalid, please open \"allow insecure\"")
end

ffi.cdef("    typedef struct {\n        float x, y, z;\n    } Vector;\n\n    typedef struct {\n        int32_t nSize;\n        char pad_0x4[0x4];\n        void* pData;\n    } CNetworkUtlVectorBase;\n\n    typedef struct {\n        char pad_01[0x8];\n        const char* szName;\n        char pad_02[0x68];\n    } CSchemaClassInfoData;\n    \n    typedef struct {\n        int nTotalCount;\n        int nAllocated;\n        union {\n            char* pString;\n            char szString[200];\n        } pMemory;\n    } CBufferString;\n\n    typedef struct {\n        CBufferString strName;\n        uint64_t nExtension;\n        uint64_t nExtension2;\n    } TypedResourceName;\n    \n    typedef struct CInterfaceLinkList {\n        void*(*Create)();\n        const char* szName;\n        struct CInterfaceLinkList* pNext;\n    } CInterfaceLinkList;\n\n    typedef struct {\n        void* pData;\n        const char** szResourceName;\n        uint32_t nFlags;\n        uint8_t nResourceType;\n        char pad_0x18[0x8];\n        uint32_t nRefCount;\n    } CResourceBinding;\n\n    typedef struct {\n        CResourceBinding* pBinding;\n    } CStrongHandle;\n    \n    typedef struct {\n        char pad_01[0x10];\n        uint16_t nDefIndex;\n    } CEconItemDefinition;\n")

slot_0_0_0 = {
	ENT_ENTRY_MASK = 32767,
	INVALID_EHANDLE_INDEX = 4294967295,
	FILE_ATTRIBUTE_DIRECTORY = 16,
	szSettingsFile = "weapon model settings.json",
	M4A1_SILENCER = nil,
	arrExport = {},
	arrTypedefs = {},
	arrPrecache = {},
	arrElements = {},
	arrFileExist = {},
	arrWeaponItems = {},
	arrAllocMemory = {},
	arrVirtualTable = {},
	arrUnloadCallBacks = {},
	arrLastModelFilePath = {},
	arrTypedResourceHandle = {},
	NULLPTR = ffi.cast("void*", 0),
	INVALID_HANDLE = ffi.cast("void*", -1),
	INVALID_FILE_SIZE = ffi.cast("uint32_t", -1),
	arrAnimationCorrectModels = {
		baisi_m9 = utils.murmur2(tostring(weapon_id.knife_m9bayonet)),
		bkh_bayonet = utils.murmur2(tostring(weapon_id.knife_bayonet)),
		baiyuxiubi = utils.murmur2(tostring(weapon_id.knife_karambit)),
		bayonet_prs = utils.murmur2(tostring(weapon_id.knife_bayonet)),
		karambit_mfsn = utils.murmur2(tostring(weapon_id.knife_karambit)),
		galaxykarambit = utils.murmur2(tostring(weapon_id.knife_karambit)),
		sakuraaya_knife = utils.murmur2(tostring(weapon_id.knife_bayonet)),
		bkh_butterfly = utils.murmur2(tostring(weapon_id.knife_butterfly)),
		butterfly_anime = utils.murmur2(tostring(weapon_id.knife_butterfly))
	},
	arrSchema = {
		nSubClassID = 904,
		hMyWeapons = 72,
		pWeaponServices = 5080,
		vecMaxs = 76,
		hHudModelArms = 9216,
		hOwnerEntity = 1320,
		pCollision = 840,
		pOwner = 48,
		pChild = 64,
		pGameSceneNode = 824,
		pVData = 912,
		iItemDefinitionIndex = 442,
		pItem = 80,
		pAttributeManager = 4984,
		nWeaponType = 1088,
		vecMins = 64,
		szModelName = 168,
		hModelState = 352,
		pNextSibling = 72,
		[0] = nil
	}
}
slot_0_0_0.__index = setmetatable(slot_0_0_0, {})

function slot_0_0_0.__index.AddUnloadEvent(arg_1_0, arg_1_1)
	table.insert(arg_1_0.arrUnloadCallBacks, arg_1_1)
end

function slot_0_0_0.__index.GetFieldOffset(arg_2_0, arg_2_1)
	return arg_2_0.arrSchema[arg_2_1]
end

function slot_0_0_0.__index.FreeAllocMemorys(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(arg_3_0.arrAllocMemory) do
		arg_3_0:VirtualFree(iter_3_1)
	end
end

function slot_0_0_0.__index.BindArgument(arg_4_0, arg_4_1, arg_4_2)
	return function(...)
		return arg_4_1(arg_4_2 or arg_4_0, ...)
	end
end

function slot_0_0_0.__index.GetFieldPtr(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_0:GetFieldOffset(arg_6_2)

	if not var_6_0 then
		return false
	end

	return ffi.cast(("%s*"):format(arg_6_3), ffi.cast("uintptr_t", arg_6_1) + var_6_0)
end

function slot_0_0_0.__index.GetField(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_0:GetFieldPtr(arg_7_1, arg_7_2, arg_7_3)

	if not var_7_0 then
		return false
	end

	return var_7_0[0]
end

function slot_0_0_0.__index.PlayErrorSound(arg_8_0)
	arg_8_0.fnPlaySound("sounds/ui/weapon_cant_buy.vsnd")
end

function slot_0_0_0.__index.RemoveSpace(arg_9_0, arg_9_1)
	while arg_9_1:find(" ") do
		arg_9_1 = arg_9_1:gsub(" ", "")
	end

	return arg_9_1
end

function slot_0_0_0.__index.SetSubClassId(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0:GetClientEntity(arg_10_1)

	if not var_10_0 or var_10_0 == arg_10_0.NULLPTR then
		return
	end

	arg_10_0:GetFieldPtr(var_10_0, "nSubClassID", "uint32_t")[0] = arg_10_2

	arg_10_0.fnUpdateSubClass(var_10_0)
	arg_10_0.fnUpdateVData(var_10_0)
end

function slot_0_0_0.__index.GetEntityBounding(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:GetField(arg_11_1, "pCollision", "void*")

	if not var_11_0 or var_11_0 == arg_11_0.NULLPTR then
		return nil, nil
	end

	local var_11_1 = arg_11_0:GetField(var_11_0, "vecMins", "Vector")
	local var_11_2 = arg_11_0:GetField(var_11_0, "vecMaxs", "Vector")

	if not var_11_1 or not var_11_2 then
		return nil, nil
	end

	return vector(var_11_1.x, var_11_1.y, var_11_1.z), vector(var_11_2.x, var_11_2.y, var_11_2.z)
end

function slot_0_0_0.__index.SetEntityBounding(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	if not arg_12_2 or not arg_12_3 then
		return
	end

	local var_12_0 = arg_12_0:GetField(arg_12_1, "pCollision", "void*")

	if not var_12_0 or var_12_0 == arg_12_0.NULLPTR then
		return
	end

	local var_12_1 = arg_12_0:GetFieldPtr(var_12_0, "vecMins", "Vector")
	local var_12_2 = arg_12_0:GetFieldPtr(var_12_0, "vecMaxs", "Vector")

	if not var_12_1 or not var_12_2 then
		return
	end

	var_12_1[0].x = arg_12_2.x
	var_12_1[0].y = arg_12_2.y
	var_12_1[0].z = arg_12_2.z
	var_12_2[0].x = arg_12_3.x
	var_12_2[0].y = arg_12_3.y
	var_12_2[0].z = arg_12_3.z
end

function slot_0_0_0.__index.SetModel(arg_13_0, arg_13_1, arg_13_2)
	if not arg_13_0:IsPrecached(arg_13_2) then
		return
	end

	local var_13_0 = arg_13_0:GetClientEntity(arg_13_1)

	if not var_13_0 or var_13_0 == arg_13_0.NULLPTR then
		return
	end

	local var_13_1, var_13_2 = arg_13_0:GetEntityBounding(var_13_0)

	arg_13_0.fnSetModel(var_13_0, arg_13_2)
	arg_13_0:SetEntityBounding(var_13_0, var_13_1, var_13_2)
end

function slot_0_0_0.__index.FixupResourcePath(arg_14_0, arg_14_1)
	arg_14_1 = arg_14_0:RemoveSpace(arg_14_1)

	while arg_14_1:find("\"") do
		arg_14_1 = arg_14_1:gsub("\"", "")
	end

	while arg_14_1:find("\\") do
		arg_14_1 = arg_14_1:gsub("\\", "/")
	end

	if arg_14_1:len() > 7 and arg_14_1:sub(-7) == ".vmdl_c" then
		arg_14_1 = arg_14_1:gsub(".vmdl_c", ".vmdl")
	end

	return arg_14_1
end

function slot_0_0_0.__index.IsValidatePath(arg_15_0, arg_15_1)
	if arg_15_1:len() < 8 then
		return false
	end

	return (arg_15_1:sub(0, 7) == "weapons" or arg_15_1:sub(0, 6) == "phase2") and arg_15_1:sub(-5) == ".vmdl"
end

function slot_0_0_0.__index.FileExist(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1:sub(-5) == ".vmdl" and ("%s_c"):format(arg_16_1) or arg_16_1

	if arg_16_0.arrFileExist[var_16_0] == nil then
		arg_16_0.arrFileExist[var_16_0] = arg_16_0.pFileSystem:Exists(var_16_0)
	end

	return arg_16_0.arrFileExist[var_16_0]
end

function slot_0_0_0.__index.IsSameEntity(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0:GetClientEntity(arg_17_1)
	local var_17_1 = arg_17_0:GetClientEntity(arg_17_2)

	if var_17_0 == arg_17_0.NULLPTR or var_17_1 == arg_17_0.NULLPTR then
		return false
	end

	return var_17_0 == var_17_1
end

function slot_0_0_0.__index.GetClientEntity(arg_18_0, arg_18_1)
	if type(arg_18_1) == "cdata" then
		return arg_18_1
	elseif type(arg_18_1) == "userdata" then
		return ffi.cast("void**", arg_18_1)[0]
	end

	return arg_18_0.NULLPTR
end

function slot_0_0_0.__index.CallVirtual(arg_19_0, arg_19_1, arg_19_2, arg_19_3, ...)
	if arg_19_1 == arg_19_0.NULLPTR then
		return nil
	end

	local var_19_0 = ffi.cast("void***", arg_19_1)[0][arg_19_2]
	local var_19_1 = ("VFuncOf: %02X"):format(ffi.cast("uintptr_t", var_19_0))

	if not arg_19_0.arrVirtualTable[var_19_1] then
		arg_19_0.arrVirtualTable[var_19_1] = ffi.cast(arg_19_3, var_19_0)
	end

	return arg_19_0.arrVirtualTable[var_19_1](arg_19_1, ...)
end

function slot_0_0_0.__index.FindPattern(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = ffi.cast("uintptr_t", utils.find_pattern(arg_20_1, arg_20_2))

	if var_20_0 == 0ULL then
		gui.notify:add(gui.notification("[Weapon] Model Changer", "script outdated need be fix, please wait dev update."))
		assert(false, "model changer error: outdated pattern")

		return nil
	end

	return arg_20_0:CPtr(var_20_0)
end

function slot_0_0_0.__index.FindSignature(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = ffi.cast("uint8_t*", arg_21_1)

	for iter_21_0 = 0, arg_21_2 - 1 do
		local var_21_1 = true

		for iter_21_1 = 1, #arg_21_3 do
			if var_21_0[iter_21_0 + iter_21_1] ~= arg_21_3[iter_21_1] then
				var_21_1 = false

				break
			end
		end

		if var_21_1 then
			return var_21_0 + iter_21_0
		end
	end

	return nil
end

function slot_0_0_0.__index.GetModuleProc(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_1:lower()

	if not arg_22_0.arrExport[var_22_0] then
		arg_22_0.arrExport[var_22_0] = {}
	end

	if not arg_22_0.arrExport[var_22_0][arg_22_2] or arg_22_0.arrExport[var_22_0][arg_22_2] == arg_22_0.NULLPTR then
		arg_22_0.arrExport[var_22_0][arg_22_2] = ffi.cast("void*", utils.find_export(var_22_0, arg_22_2))
	end

	if arg_22_0.arrExport[var_22_0][arg_22_2] == arg_22_0.NULLPTR then
		return nil
	end

	return arg_22_0:CPtr(arg_22_0.arrExport[var_22_0][arg_22_2])
end

function slot_0_0_0.__index.FindInterface(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0:GetModuleProc(arg_23_1, "CreateInterface")

	if not var_23_0 or var_23_0 == arg_23_0.NULLPTR then
		return false
	end

	local var_23_1 = var_23_0:ToRelative(3, 7):Dereference():Get("struct CInterfaceLinkList*")

	while var_23_1 and var_23_1 ~= arg_23_0.NULLPTR do
		if ffi.string(var_23_1.szName) == arg_23_2 then
			local var_23_2 = var_23_1.Create()

			return arg_23_0:CPtr(ffi.cast("void*", var_23_2))
		end

		var_23_1 = var_23_1.pNext
	end

	assert(false, "model changer: outdated interface")

	return false
end

function slot_0_0_0.__index.SetTypeof(arg_24_0, arg_24_1, arg_24_2)
	if not arg_24_0.arrTypedefs[arg_24_1] then
		arg_24_0.arrTypedefs[arg_24_1] = arg_24_2
	end

	return arg_24_0.arrTypedefs[arg_24_1]
end

function slot_0_0_0.__index.CallModuleExport(arg_25_0, arg_25_1, arg_25_2, arg_25_3, ...)
	local var_25_0 = arg_25_0:GetModuleProc(arg_25_1:lower(), arg_25_2)

	if not var_25_0 then
		return nil
	end

	return var_25_0:Get(arg_25_3)(...)
end

function slot_0_0_0.__index.GetGameDirectory(arg_26_0)
	local var_26_0 = ffi.new("char[260]")

	arg_26_0:CallModuleExport("Kernel32.dll", "GetCurrentDirectoryA", "int(__stdcall*)(uint32_t, char*)", ffi.sizeof(var_26_0), var_26_0)

	local var_26_1 = ffi.string(var_26_0)

	return var_26_1:sub(0, var_26_1:len() - 10)
end

function slot_0_0_0.__index.VirtualFree(arg_27_0, arg_27_1)
	if arg_27_1 == arg_27_0.NULLPTR then
		return
	end

	arg_27_0:CallModuleExport("Kernel32.dll", "VirtualFree", "int(__stdcall*)(void*, uint64_t, uint32_t)", arg_27_1, 0, 32768)
end

function slot_0_0_0.__index.VirtualAlloc(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0:CallModuleExport("Kernel32.dll", "VirtualAlloc", "void*(__stdcall*)(void*, uint64_t, uint32_t, uint32_t)", arg_28_1, arg_28_2, bit.bor(4096, 8192), 64)

	table.insert(arg_28_0.arrAllocMemory, var_28_0)

	return var_28_0
end

function slot_0_0_0.__index.CreateShellCode(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = ffi.new("uint8_t[?]", #arg_29_1, arg_29_1)
	local var_29_1 = arg_29_0:VirtualAlloc(arg_29_0.NULLPTR, #arg_29_1)

	ffi.copy(var_29_1, var_29_0, #arg_29_1)

	return ffi.cast(arg_29_2, var_29_1), #arg_29_1
end

function slot_0_0_0.__index.GetWeaponItemFromName(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.arrWeaponItems) do
		if iter_30_1.szWeaponName == arg_30_1 then
			return iter_30_1
		end
	end

	return false
end

function slot_0_0_0.__index.GetIndexFromBits(arg_31_0, arg_31_1, arg_31_2)
	for iter_31_0 = 0, arg_31_1 - 1 do
		if arg_31_0.fnBitLeftShift(1, iter_31_0) == arg_31_2 then
			return iter_31_0 + 1
		end
	end

	return 0
end

function slot_0_0_0.__index.HandleElements(arg_32_0)
	local var_32_0 = arg_32_0:GetIndexFromBits(#arg_32_0.arrWeaponItems, arg_32_0.arrElements.pWeaponList:get_value():get():get_raw())

	for iter_32_0, iter_32_1 in pairs(arg_32_0.arrElements.arrWeaponModelPath) do
		iter_32_1.pOverrideModelRow:set_visible(var_32_0 == iter_32_0)
		iter_32_1.pCustomModelPathRow:set_visible(var_32_0 == iter_32_0 and iter_32_1.pOverrideModel:get_value():get())
	end
end

function slot_0_0_0.__index.CUtlMapToArray(arg_33_0, arg_33_1)
	local var_33_0 = {}

	for iter_33_0 = 0, arg_33_1.nSize - 1 do
		table.insert(var_33_0, arg_33_1.arrData[iter_33_0].Value)
	end

	return var_33_0
end

function slot_0_0_0.__index.GetOwnerEntity(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetClientEntity(arg_34_1)

	if not var_34_0 then
		return false
	end

	local var_34_1 = arg_34_0:GetField(var_34_0, "hOwnerEntity", "uint32_t")

	if var_34_1 == arg_34_0.INVALID_EHANDLE_INDEX then
		return false
	end

	return arg_34_0.pGameEntitySystem:GetBaseEntity(bit.band(var_34_1, arg_34_0.ENT_ENTRY_MASK))
end

function slot_0_0_0.__index.GetProjectiles(arg_35_0, arg_35_1)
	local var_35_0 = {}
	local var_35_1 = arg_35_0:GetClientEntity(arg_35_1)

	entities.projectiles:for_each(function(arg_36_0)
		local var_36_0 = arg_35_0:GetOwnerEntity(arg_36_0.entity)

		if not var_36_0 or var_36_0 == arg_35_0.NULLPTR then
			return
		end

		if var_36_0 == var_35_1 then
			table.insert(var_35_0, arg_36_0.entity)
		end
	end)

	return var_35_0
end

function slot_0_0_0.__index.IsFileExist(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:CallModuleExport("Kernel32.dll", "GetFileAttributesA", "uint32_t(__stdcall*)(const char*)", arg_37_1)

	return var_37_0 ~= 4294967295 and bit.band(var_37_0, arg_37_0.FILE_ATTRIBUTE_DIRECTORY) <= 0
end

function slot_0_0_0.__index.ReadFile(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0:CallModuleExport("Kernel32.dll", "CreateFileA", "void*(__stdcall*)(const char*, uint32_t, uint32_t, void*, uint32_t, uint32_t, void*)", arg_38_1, 2147483648, 1, arg_38_0.NULLPTR, 3, 128, arg_38_0.NULLPTR)

	if var_38_0 == arg_38_0.NULLPTR or var_38_0 == arg_38_0.INVALID_HANDLE then
		return false
	end

	local var_38_1 = arg_38_0:CallModuleExport("Kernel32.dll", "GetFileSize", "uint32_t(__stdcall*)(void*, uint32_t*)", var_38_0, arg_38_0.NULLPTR)

	if var_38_1 == 0 or var_38_1 == arg_38_0.INVALID_FILE_SIZE then
		arg_38_0:CallModuleExport("Kernel32.dll", "CloseHandle", "bool(__stdcall*)(void*)", var_38_0)

		return false
	end

	local var_38_2 = 0
	local var_38_3 = var_38_1
	local var_38_4 = ffi.new("char[?]", var_38_1)

	while var_38_3 > 0 do
		local var_38_5 = ffi.new("uint32_t[1]")

		if not arg_38_0:CallModuleExport("Kernel32.dll", "ReadFile", "bool(__stdcall*)(void*, void*, uint32_t, uint32_t*, void*)", var_38_0, var_38_4 + var_38_2, var_38_3, var_38_5, arg_38_0.NULLPTR) or var_38_5[0] <= 0 then
			break
		end

		var_38_2 = var_38_2 + var_38_5[0]
		var_38_3 = var_38_3 - var_38_5[0]
	end

	arg_38_0:CallModuleExport("Kernel32.dll", "CloseHandle", "bool(__stdcall*)(void*)", var_38_0)

	return ffi.string(var_38_4, var_38_2)
end

function slot_0_0_0.__index.WriteFile(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0:CallModuleExport("Kernel32.dll", "CreateFileA", "void*(__stdcall*)(const char*, uint32_t, uint32_t, void*, uint32_t, uint32_t, void*)", arg_39_1, 1073741824, 2, arg_39_0.NULLPTR, 2, 128, arg_39_0.NULLPTR)

	if var_39_0 == arg_39_0.NULLPTR or var_39_0 == arg_39_0.INVALID_HANDLE then
		return false
	end

	local var_39_1 = 0
	local var_39_2 = arg_39_2:len()
	local var_39_3 = ffi.new("char[?]", var_39_2)

	ffi.copy(var_39_3, ffi.cast("const char*", arg_39_2), var_39_2)

	while var_39_2 > 0 do
		local var_39_4 = ffi.new("uint32_t[1]")

		if not arg_39_0:CallModuleExport("Kernel32.dll", "WriteFile", "bool(__stdcall*)(void*, const void*, uint32_t, uint32_t*, void*)", var_39_0, var_39_3 + var_39_1, var_39_2, var_39_4, nil) or var_39_4[0] <= 0 then
			break
		end

		var_39_1 = var_39_1 + var_39_4[0]
		var_39_2 = var_39_2 - var_39_4[0]
	end

	arg_39_0:CallModuleExport("Kernel32.dll", "CloseHandle", "bool(__stdcall*)(void*)", var_39_0)
end

function slot_0_0_0.__index.FindSettings(arg_40_0, arg_40_1)
	for iter_40_0, iter_40_1 in pairs(arg_40_0.arrElements.arrWeaponModelPath) do
		if iter_40_1.szName == arg_40_1 then
			return iter_40_1
		end
	end

	return false
end

function slot_0_0_0.__index.FindSettingsByIndex(arg_41_0, arg_41_1)
	for iter_41_0, iter_41_1 in pairs(arg_41_0.arrElements.arrWeaponModelPath) do
		if iter_41_1.nDefIndex == arg_41_1 then
			return iter_41_1
		end
	end

	return false
end

function slot_0_0_0.__index.GetWeaponType(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0:GetField(arg_42_1, "pVData", "void*")

	if var_42_0 == arg_42_0.NULLPTR then
		return -1
	end

	return arg_42_0:GetField(var_42_0, "nWeaponType", "int")
end

function slot_0_0_0.__index.GetWeaponIndex(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0:GetFieldPtr(arg_43_1, "pAttributeManager", "void")

	if not var_43_0 then
		return -1
	end

	local var_43_1 = arg_43_0:GetFieldPtr(var_43_0, "pItem", "void")

	if not var_43_1 then
		return -1
	end

	return arg_43_0:GetField(var_43_1, "iItemDefinitionIndex", "uint16_t")
end

function slot_0_0_0.__index.GetMetaWeaponType(arg_44_0, arg_44_1)
	return type(arg_44_1) == "userdata" and arg_44_1:get_type() or arg_44_0:GetWeaponType(arg_44_1)
end

function slot_0_0_0.__index.GetMetaWeaponIndex(arg_45_0, arg_45_1)
	return type(arg_45_1) == "userdata" and arg_45_1:get_id() or arg_45_0:GetWeaponIndex(arg_45_1)
end

function slot_0_0_0.__index.GetWeaponConfig(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0:GetMetaWeaponType(arg_46_1)
	local var_46_1 = arg_46_0:GetMetaWeaponIndex(arg_46_1)

	if var_46_0 == 0 then
		return arg_46_0:FindSettings("Knifes")
	elseif var_46_1 == weapon_id.c4 then
		return arg_46_0:FindSettings("C4")
	elseif var_46_1 == weapon_id.taser then
		return arg_46_0:FindSettings("Taser Zeus")
	elseif var_46_1 == weapon_id.healthshot then
		return arg_46_0:FindSettings("Healthshot")
	elseif var_46_0 == 9 then
		return arg_46_0:FindSettings(var_46_1 == weapon_id.decoy and "Decoy" or var_46_1 == weapon_id.hegrenade and "Grenade" or var_46_1 == weapon_id.flashbang and "FlashBang" or (var_46_1 == weapon_id.molotov or var_46_1 == weapon_id.incgrenade) and "Molotov Grenade" or "Smoke Grenade")
	else
		return arg_46_0:FindSettingsByIndex(var_46_1)
	end
end

function slot_0_0_0.__index.GetMyWeapons(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:GetClientEntity(arg_47_1)

	if var_47_0 == arg_47_0.NULLPTR then
		return {}
	end

	local var_47_1 = arg_47_0:GetField(var_47_0, "pWeaponServices", "void*")

	if var_47_1 == arg_47_0.NULLPTR then
		return {}
	end

	local var_47_2 = arg_47_0:GetField(var_47_1, "hMyWeapons", "CNetworkUtlVectorBase")

	if not var_47_2 or var_47_2.nSize <= 0 then
		return {}
	end

	local var_47_3 = {}
	local var_47_4 = ffi.cast("uint32_t*", var_47_2.pData)

	for iter_47_0 = 0, var_47_2.nSize - 1 do
		local var_47_5 = var_47_4[iter_47_0]

		if var_47_5 == arg_47_0.INVALID_EHANDLE_INDEX then
			-- block empty
		else
			local var_47_6 = arg_47_0.pGameEntitySystem:GetBaseEntity(bit.band(var_47_5, arg_47_0.ENT_ENTRY_MASK))

			if var_47_6 == arg_47_0.NULLPTR then
				-- block empty
			else
				table.insert(var_47_3, var_47_6)
			end
		end
	end

	return var_47_3
end

function slot_0_0_0.__index.IGameEntitySystem(arg_48_0, arg_48_1)
	return setmetatable({
		pGameEntitySystem = arg_48_1
	}, {
		__index = {
			Get = function(arg_49_0)
				return arg_49_0.pGameEntitySystem
			end,
			IsValidate = function(arg_50_0)
				return arg_50_0.pGameEntitySystem ~= arg_48_0.NULLPTR
			end,
			GetBaseEntity = function(arg_51_0, arg_51_1)
				if not arg_51_0:IsValidate() then
					return arg_48_0.NULLPTR
				end

				return arg_48_0.fnGetBaseEntity(arg_51_0:Get(), arg_51_1)
			end
		}
	})
end

function slot_0_0_0.__index.CEconItemSchema(arg_52_0, arg_52_1)
	return setmetatable({
		pEconItemSchema = arg_52_1
	}, {
		AddShadowLine = nil,
		__index = {
			Get = function(arg_53_0)
				return arg_53_0.pEconItemSchema
			end,
			IsValidate = function(arg_54_0)
				return arg_54_0.pEconItemSchema ~= arg_52_0.NULLPTR
			end,
			GetSortedItemDefinitionMap = function(arg_55_0)
				if not arg_55_0:IsValidate() then
					return nil
				end

				return arg_52_0:CPtr(arg_55_0:Get()):Field(296):Get(arg_52_0:CUtlMapPointer("int", "CEconItemDefinition*"))[0]
			end
		}
	})
end

function slot_0_0_0.__index.CEconItemSystem(arg_56_0, arg_56_1)
	return setmetatable({
		pEconItemSystem = arg_56_1
	}, {
		[0] = nil,
		__index = {
			Get = function(arg_57_0)
				return arg_57_0.pEconItemSystem
			end,
			IsValidate = function(arg_58_0)
				return arg_58_0.pEconItemSystem ~= arg_56_0.NULLPTR
			end,
			GetEconItemSchema = function(arg_59_0)
				if not arg_59_0:IsValidate() then
					return false
				end

				local var_59_0 = ffi.cast("void**", ffi.cast("uintptr_t", arg_59_0:Get()) + 8)[0]

				if var_59_0 == arg_56_0.NULLPTR then
					return false
				end

				return arg_56_0:CEconItemSchema(var_59_0)
			end
		}
	})
end

function slot_0_0_0.__index.ISource2Client(arg_60_0, arg_60_1)
	return setmetatable({
		pSource2Client = arg_60_1
	}, {
		__index = {
			Get = function(arg_61_0)
				return arg_61_0.pSource2Client
			end,
			IsValidate = function(arg_62_0)
				return arg_62_0.pSource2Client ~= arg_60_0.NULLPTR
			end,
			GetEconItemSystem = function(arg_63_0)
				if not arg_63_0:IsValidate() then
					return false
				end

				return arg_60_0:CEconItemSystem(arg_60_0:CallVirtual(arg_63_0:Get(), 127, "void*(__thiscall*)(void*)"))
			end,
			GetEconItemSchema = function(arg_64_0)
				if not arg_64_0:IsValidate() then
					return false
				end

				local var_64_0 = arg_64_0:GetEconItemSystem()

				if not var_64_0:IsValidate() then
					return false
				end

				return var_64_0:GetEconItemSchema()
			end
		}
	})
end

function slot_0_0_0.__index.CBaseFileSystem(arg_65_0, arg_65_1)
	return setmetatable({
		pBaseFileSystem = arg_65_1
	}, {
		__index = {
			Get = function(arg_66_0)
				return arg_66_0.pBaseFileSystem
			end,
			IsValidate = function(arg_67_0)
				return arg_67_0.pBaseFileSystem ~= arg_65_0.NULLPTR
			end,
			Exists = function(arg_68_0, arg_68_1)
				if not arg_68_0:IsValidate() then
					return false
				end

				return arg_65_0:CallVirtual(arg_68_0:Get(), 21, "bool(__thiscall*)(void*, const char*, const char*)", arg_68_1, arg_65_0.NULLPTR)
			end
		}
	})
end

function slot_0_0_0.__index.IMemAlloc(arg_69_0, arg_69_1)
	return setmetatable({
		pMemAlloc = arg_69_1
	}, {
		Get = function(arg_70_0)
			return arg_70_0.pMemAlloc
		end,
		IsValidate = function(arg_71_0)
			return arg_71_0.pMemAlloc ~= arg_69_0.NULLPTR
		end,
		Free = function(arg_72_0, arg_72_1)
			if not arg_72_0:IsValidate() then
				return
			end

			arg_69_0:CallVirtual(arg_72_0:Get(), 3, "void(__thiscall*)(void*, void*)", arg_72_1)
		end
	})
end

function slot_0_0_0.__index.IResourceSystem(arg_73_0, arg_73_1)
	return setmetatable({
		pResourceSystem = arg_73_1,
		pResourceHandleUtils = arg_73_0:CallVirtual(arg_73_1, 2, "void*(__thiscall*)(void*, const char*)", "ResourceHandleUtils001")
	}, {
		[0] = nil,
		__index = {
			[0] = nil,
			Get = function(arg_74_0)
				return arg_74_0.pResourceSystem
			end,
			IsValidate = function(arg_75_0)
				return arg_75_0.pResourceSystem ~= arg_73_0.NULLPTR
			end,
			DeleteResource = function(arg_76_0, arg_76_1)
				if arg_76_0.pResourceHandleUtils == arg_73_0.NULLPTR then
					return
				end

				arg_73_0:CallVirtual(arg_76_0.pResourceHandleUtils, 2, "void(__thiscall*)(void*, CResourceBinding*)", arg_76_1)
			end,
			IsLoaded = function(arg_77_0, arg_77_1)
				if not arg_77_0:IsValidate() then
					return false
				end

				local var_77_0 = ffi.new("TypedResourceName")

				arg_73_0:InitTypedResourceName(var_77_0, arg_77_1)

				return arg_73_0:CallVirtual(arg_77_0:Get(), 51, "uint32_t(__thiscall*)(void*, TypedResourceName*)", var_77_0) > 0
			end,
			FindResource = function(arg_78_0, arg_78_1)
				if not arg_78_0:IsValidate() then
					return false
				end

				local var_78_0 = ffi.new("TypedResourceName")

				arg_73_0:InitTypedResourceName(var_78_0, arg_78_1)

				local var_78_1 = arg_73_0:CStrongHandle(arg_73_0:CallVirtual(arg_78_0:Get(), 79, "CStrongHandle(__thiscall*)(void*, TypedResourceName*, bool)", var_78_0, false))

				if var_78_1:IsValidate() then
					return var_78_1
				end

				return false
			end,
			Load = function(arg_79_0, arg_79_1)
				if not arg_79_0:IsValidate() then
					return false
				end

				if arg_79_0:IsLoaded(arg_79_1) then
					return arg_79_0:FindResource(arg_79_1)
				end

				local var_79_0 = ffi.new("TypedResourceName")

				arg_73_0:InitTypedResourceName(var_79_0, arg_79_1)
				arg_73_0:CallVirtual(arg_79_0:Get(), 41, "CStrongHandle(__thiscall*)(void*, TypedResourceName*, const char*)", var_79_0, "")

				local var_79_1 = arg_73_0:CStrongHandle(arg_73_0:CallVirtual(arg_79_0:Get(), 40, "CStrongHandle(__thiscall*)(void*, TypedResourceName*, const char*)", var_79_0, ""))

				if var_79_1:IsValidate() then
					if var_79_1:GetRefCount() <= 0 then
						var_79_1:AddRefCount()
						table.insert(arg_73_0.arrTypedResourceHandle, var_79_1)
					end

					return var_79_1
				end

				return false
			end
		}
	})
end

function slot_0_0_0.__index.CStrongHandle(arg_80_0, arg_80_1)
	return setmetatable({
		bIsValidate = true,
		pHandle = arg_80_1
	}, {
		[0] = nil,
		__index = {
			Get = function(arg_81_0)
				return arg_81_0.pHandle
			end,
			IsValidate = function(arg_82_0)
				return arg_82_0.bIsValidate and arg_82_0.pHandle.pBinding ~= arg_80_0.NULLPTR and arg_82_0.pHandle.pBinding.pData ~= arg_80_0.NULLPTR
			end,
			GetRefCount = function(arg_83_0)
				if not arg_83_0:IsValidate() then
					return -1
				end

				return arg_83_0.pHandle.pBinding.nRefCount
			end,
			AddRefCount = function(arg_84_0)
				if not arg_84_0:IsValidate() then
					return
				end

				arg_84_0.pHandle.pBinding.nRefCount = arg_84_0.pHandle.pBinding.nRefCount + 1

				return arg_84_0.pHandle.pBinding.nRefCount
			end,
			ReleaseRef = function(arg_85_0)
				if not arg_85_0:IsValidate() then
					return false
				end

				arg_85_0.pHandle.pBinding.nRefCount = arg_85_0.pHandle.pBinding.nRefCount - 1

				return arg_85_0.pHandle.pBinding.nRefCount
			end,
			GarbageCollection = function(arg_86_0)
				if not arg_86_0:IsValidate() then
					return
				end

				arg_86_0.bIsValidate = false

				arg_80_0.pResourceSystem:DeleteResource(arg_86_0.pHandle.pBinding)
			end
		}
	})
end

function slot_0_0_0.__index.CPtr(arg_87_0, arg_87_1)
	return setmetatable({
		pBase = ffi.cast("uintptr_t", arg_87_1)
	}, {
		__call = function(arg_88_0, arg_88_1)
			if not arg_88_0:IsValidate() then
				return nil
			end

			return ffi.cast(arg_88_1 or "void*", arg_88_0.pBase)
		end,
		__index = {
			IsValidate = function(arg_89_0)
				return arg_89_0.pBase > 4096 and arg_89_0.pBase < 140737488289791
			end,
			GetAddress = function(arg_90_0)
				return arg_90_0.pBase
			end,
			Get = function(arg_91_0, arg_91_1)
				if not arg_91_0:IsValidate() then
					return nil
				end

				return ffi.cast(arg_91_1 or "void*", arg_91_0.pBase)
			end,
			Copy = function(arg_92_0, arg_92_1)
				if arg_92_0:IsValidate() and type(arg_92_1) == "cdata" or type(arg_92_1) == "number" then
					return arg_87_0:CPtr(arg_92_0.pBase + tonumber(arg_92_1))
				end

				return arg_87_0:CPtr(arg_92_0.pBase)
			end,
			Field = function(arg_93_0, arg_93_1)
				if not arg_93_0:IsValidate() then
					return arg_93_0
				end

				arg_93_0.pBase = arg_93_0.pBase + arg_93_1

				return arg_93_0
			end,
			FieldOf = function(arg_94_0, arg_94_1)
				if not arg_94_0:IsValidate() then
					return arg_94_0:Copy()
				end

				return arg_87_0:CPtr(arg_94_0.pBase + arg_94_1)
			end,
			ToAbsolute = function(arg_95_0, arg_95_1, arg_95_2)
				if not arg_95_0:IsValidate() then
					return arg_95_0
				end

				arg_95_0:Field(arg_95_1 or 1)
				arg_95_0:Field(ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_95_0.pBase)[0]))
				arg_95_0:Field(arg_95_2 or 0)

				return arg_95_0
			end,
			ToRelative = function(arg_96_0, arg_96_1, arg_96_2)
				if not arg_96_0:IsValidate() then
					return arg_96_0
				end

				arg_96_0:Field(ffi.cast("uint32_t*", arg_96_0.pBase + (arg_96_1 or 3))[0] + (arg_96_2 or 7))

				return arg_96_0
			end,
			Dereference = function(arg_97_0, arg_97_1)
				if not arg_97_0:IsValidate() then
					return arg_97_0
				end

				for iter_97_0 = 1, arg_97_1 or 1 do
					arg_97_0.pBase = ffi.cast("uintptr_t*", arg_97_0.pBase)[0]
				end

				return arg_97_0
			end,
			GetByteArray = function(arg_98_0, arg_98_1)
				local var_98_0 = arg_98_1 or 16

				if not arg_98_0:IsValidate() or var_98_0 <= 0 then
					return nil
				end

				local var_98_1 = ""
				local var_98_2 = ffi.cast("uint8_t*", arg_98_0.pBase)

				for iter_98_0 = 0, var_98_0 - 1 do
					var_98_1 = (iter_98_0 == var_98_0 - 1 and "%s%02X" or "%s%02X "):format(var_98_1, var_98_2[iter_98_0])
				end

				return var_98_1
			end
		}
	})
end

function slot_0_0_0.__index.ClearPrecached(arg_99_0)
	arg_99_0.arrPrecache = {}
end

function slot_0_0_0.__index.GarbageCollectionResources(arg_100_0)
	for iter_100_0, iter_100_1 in pairs(arg_100_0.arrTypedResourceHandle) do
		iter_100_1:GarbageCollection()
	end

	arg_100_0.arrTypedResourceHandle = {}
end

function slot_0_0_0.__index.IsPrecached(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_0.arrPrecache[arg_101_1]

	if not var_101_0 or not var_101_0:IsValidate() then
		return false
	end

	return true
end

function slot_0_0_0.__index.AddResource(arg_102_0, arg_102_1)
	arg_102_0.arrPrecache[arg_102_1] = arg_102_0.pResourceSystem:Load(arg_102_1)
end

function slot_0_0_0.__index.Precache(arg_103_0, arg_103_1)
	if arg_103_0:IsPrecached(arg_103_1) then
		return
	end

	arg_103_0:AddResource(arg_103_1)
end

function slot_0_0_0.__index.InitTypedResourceName(arg_104_0, arg_104_1, arg_104_2)
	arg_104_1.strName.nTotalCount = 0
	arg_104_1.strName.nAllocated = bit.bor(bit.bor(bit.lshift(1, 30), bit.lshift(1, 31)), bit.band(200, bit.lshift(1, 30) - 1))

	arg_104_0.fnInitTypedResourceName(arg_104_1, arg_104_2)
end

function slot_0_0_0.__index.FindIncludedAnimationCorrectModel(arg_105_0, arg_105_1)
	for iter_105_0, iter_105_1 in pairs(arg_105_0.arrAnimationCorrectModels) do
		if arg_105_1:find(iter_105_0) then
			return iter_105_1
		end
	end

	return false
end

function slot_0_0_0.__index.FixupWeaponName(arg_106_0, arg_106_1)
	arg_106_1 = arg_106_1:gsub("weapon_", "")

	local var_106_0 = arg_106_1:find("_")

	if var_106_0 then
		local var_106_1 = arg_106_1:sub(0, var_106_0 - 1)
		local var_106_2 = arg_106_1:sub(var_106_0 + 1, arg_106_1:len())

		arg_106_1 = ("%s%s %s%s"):format(var_106_1:sub(1, 1):upper(), var_106_1:sub(2, var_106_1:len()), var_106_2:sub(1, 1):upper(), var_106_2:sub(2, var_106_2:len()))
	else
		arg_106_1 = ("%s%s"):format(arg_106_1:sub(1, 1):upper(), arg_106_1:sub(2, arg_106_1:len()))
	end

	return arg_106_1
end

function slot_0_0_0.__index.GetClassName(arg_107_0, arg_107_1)
	if not arg_107_1 or arg_107_1 == arg_107_0.NULLPTR then
		return false
	end

	local var_107_0 = ffi.new("CSchemaClassInfoData*[1]")

	arg_107_0:CallVirtual(arg_107_1, 44, "void(__thiscall*)(void*, CSchemaClassInfoData**)", var_107_0)

	if var_107_0[0] == arg_107_0.NULLPTR or var_107_0[0].szName == arg_107_0.NULLPTR then
		return false
	end

	return ffi.string(var_107_0[0].szName)
end

function slot_0_0_0.__index.GetHudModelArms(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_0:GetClientEntity(arg_108_1)

	if not var_108_0 then
		return false
	end

	local var_108_1 = arg_108_0:GetField(var_108_0, "hHudModelArms", "uint32_t")

	if var_108_1 == arg_108_0.INVALID_EHANDLE_INDEX then
		return false
	end

	return arg_108_0.pGameEntitySystem:GetBaseEntity(bit.band(var_108_1, arg_108_0.ENT_ENTRY_MASK))
end

function slot_0_0_0.__index.GetHudModelWeapon(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_1:get_active_weapon()
	local var_109_1 = arg_109_0:GetHudModelArms(arg_109_1)

	if not var_109_0 or not var_109_1 or var_109_1 == arg_109_0.NULLPTR then
		return false
	end

	local var_109_2 = arg_109_0:GetClientEntity(var_109_0)
	local var_109_3 = arg_109_0:GetField(var_109_1, "pGameSceneNode", "void*")

	if var_109_2 == arg_109_0.NULLPTR or var_109_3 == arg_109_0.NULLPTR then
		return false
	end

	local var_109_4 = arg_109_0:GetField(var_109_3, "pChild", "void*")

	while var_109_4 ~= arg_109_0.NULLPTR do
		local var_109_5 = arg_109_0:GetField(var_109_4, "pOwner", "void*")

		if var_109_5 ~= arg_109_0.NULLPTR then
			local var_109_6 = arg_109_0:GetClassName(var_109_5)

			if var_109_6 and var_109_6 == "C_CS2HudModelWeapon" then
				local var_109_7 = arg_109_0:GetOwnerEntity(var_109_5)

				if var_109_7 and var_109_7 == var_109_2 then
					return var_109_5
				end
			end
		end

		var_109_4 = arg_109_0:GetField(var_109_4, "pNextSibling", "void*")
	end

	return false
end

function slot_0_0_0.__index.CUtlMapPointer(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0 = ("CUtlMap Pointer: %s -> %s"):format(arg_110_1, arg_110_2)

	if arg_110_0.arrTypedefs[var_110_0] then
		return arg_110_0.arrTypedefs[var_110_0]
	end

	local var_110_1 = ffi.typeof(arg_110_1)
	local var_110_2 = ffi.typeof(arg_110_2)
	local var_110_3 = ffi.typeof("        struct {\n            int32_t nLeft;\n            int32_t nRight;\n            int32_t nParent;\n            int32_t nTag;\n            $ Key;\n            $ Value;\n        }\n    ", var_110_1, var_110_2)
	local var_110_4 = ffi.typeof("        struct {\n            int32_t nSize;\n            int32_t nUnknown;\n            $* arrData;\n            int32_t nRoot;\n        } *\n    ", var_110_3)

	return arg_110_0:SetTypeof(var_110_0, var_110_4)
end

function slot_0_0_0.__index.CollectWeapons(arg_111_0)
	local var_111_0 = arg_111_0.pSource2Client:GetEconItemSchema()

	if not var_111_0 then
		return
	end

	arg_111_0.arrWeaponItems = {
		{
			szWeaponName = "Knifes",
			nDefIndex = -1,
			szElementName = "Knifes"
		},
		{
			szWeaponName = "Healthshot",
			nDefIndex = -1,
			szElementName = "Healthshot"
		},
		{
			szWeaponName = "Grenade",
			nDefIndex = -1,
			szElementName = "Grenade"
		},
		{
			szWeaponName = "Smoke Grenade",
			nDefIndex = -1,
			szElementName = "Smoke Grenade"
		},
		{
			szWeaponName = "Molotov Grenade",
			nDefIndex = -1,
			szElementName = "Molotov Grenade"
		}
	}

	for iter_111_0, iter_111_1 in pairs(arg_111_0:CUtlMapToArray(var_111_0:GetSortedItemDefinitionMap())) do
		local var_111_1 = ffi.cast("const char**", ffi.cast("uintptr_t", iter_111_1) + 128)[0]
		local var_111_2 = ffi.cast("const char**", ffi.cast("uintptr_t", iter_111_1) + 608)[0]

		if ffi.cast("int*", ffi.cast("uintptr_t", iter_111_1) + 360)[0] < 4 or var_111_1 == arg_111_0.NULLPTR or var_111_2 == arg_111_0.NULLPTR then
			-- block empty
		else
			local var_111_3 = ffi.string(var_111_1)
			local var_111_4 = ffi.string(var_111_2)

			if var_111_3 ~= "#CSGO_Type_SMG" and var_111_3 ~= "#CSGO_Type_Rifle" and var_111_3 ~= "#CSGO_Type_Pistol" and var_111_3 ~= "#CSGO_Type_Shotgun" and var_111_3 ~= "#CSGO_Type_Machinegun" and var_111_3 ~= "#CSGO_Type_SniperRifle" then
				-- block empty
			else
				table.insert(arg_111_0.arrWeaponItems, {
					["sol.D$1J"] = nil,
					szWeaponName = var_111_4,
					nDefIndex = iter_111_1.nDefIndex,
					szElementName = arg_111_0:FixupWeaponName(var_111_4)
				})
			end
		end
	end

	table.insert(arg_111_0.arrWeaponItems, {
		szWeaponName = "C4",
		nDefIndex = -1,
		szElementName = "C4",
		CHEST = nil
	})
	table.insert(arg_111_0.arrWeaponItems, {
		szWeaponName = "Decoy",
		nDefIndex = -1,
		szElementName = "Decoy"
	})
	table.insert(arg_111_0.arrWeaponItems, {
		szWeaponName = "FlashBang",
		nDefIndex = -1,
		szElementName = "FlashBang"
	})
	table.insert(arg_111_0.arrWeaponItems, {
		szWeaponName = "Taser Zeus",
		nDefIndex = -1,
		szElementName = "Taser Zeus",
		game = nil
	})
end

function slot_0_0_0.__index.Save(arg_112_0)
	local var_112_0 = {}
	local var_112_1 = arg_112_0:GetGameDirectory()
	local var_112_2 = ("%s\\csgo\\fatality\\%s"):format(var_112_1, arg_112_0.szSettingsFile)

	for iter_112_0, iter_112_1 in pairs(arg_112_0.arrElements.arrWeaponModelPath) do
		var_112_0[iter_112_1.szName] = {
			[0] = nil,
			szCustomModelPath = iter_112_1.pCustomModelPath.value,
			bOverride = iter_112_1.pOverrideModel:get_value():get()
		}
	end

	local var_112_3 = utils.json_encode(var_112_0)

	arg_112_0:WriteFile(var_112_2, var_112_3)
	gui.notify:add(gui.notification("[Weapon] Model Changer", "Configs Saved !"))
end

function slot_0_0_0.__index.Load(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_0:GetGameDirectory()
	local var_113_1 = type(arg_113_1) ~= "boolean" or not arg_113_1
	local var_113_2 = ("%s\\csgo\\fatality\\%s"):format(var_113_0, arg_113_0.szSettingsFile)

	if not arg_113_0:IsFileExist(var_113_2) then
		if var_113_1 then
			arg_113_0:PlayErrorSound()
			gui.notify:add(gui.notification("[Weapon] Model Changer", "Failed Load Configs, Config File Not Exist !"))
		end

		return
	end

	local var_113_3 = arg_113_0:ReadFile(var_113_2)

	if not var_113_3 or var_113_3:len() <= 0 then
		if var_113_1 then
			arg_113_0:PlayErrorSound()
			gui.notify:add(gui.notification("[Weapon] Model Changer", "Failed Load Configs, Config File Is Invalidate, Make Sure Your Config File Is Correct !"))
		end

		return
	end

	local var_113_4, var_113_5 = xpcall(function()
		return utils.json_decode(arg_113_0:RemoveSpace(var_113_3))
	end, print)

	if not var_113_4 or not var_113_5 then
		if var_113_1 then
			arg_113_0:PlayErrorSound()
			gui.notify:add(gui.notification("[Weapon] Model Changer", "Failed Load Configs, Config File Is Invalidate, Make Sure Your Config File Is Correct !"))
		end

		return
	end

	for iter_113_0, iter_113_1 in pairs(arg_113_0.arrElements.arrWeaponModelPath) do
		local var_113_6 = var_113_5[iter_113_1.szName]

		if not var_113_6 then
			-- block empty
		else
			iter_113_1.pOverrideModel:get_value():set(var_113_6.bOverride)
			iter_113_1.pCustomModelPath:set_value(var_113_6.szCustomModelPath)
		end
	end

	arg_113_0:HandleElements()
	arg_113_0.arrElements.pElementOfLuaA:reset()

	if var_113_1 then
		gui.notify:add(gui.notification("[Weapon] Model Changer", "Configs Loaded !"))
	end
end

function slot_0_0_0.__index.Export(arg_115_0)
	local var_115_0 = {}

	for iter_115_0, iter_115_1 in pairs(arg_115_0.arrElements.arrWeaponModelPath) do
		var_115_0[iter_115_1.szName] = {
			szCustomModelPath = iter_115_1.pCustomModelPath.value,
			bOverride = iter_115_1.pOverrideModel:get_value():get()
		}
	end

	local var_115_1 = utils.json_encode(var_115_0)

	utils.clipboard_set(var_115_1)
	gui.notify:add(gui.notification("[Weapon] Model Changer", "Configs Exported !"))
end

function slot_0_0_0.__index.Import(arg_116_0)
	local var_116_0 = utils.clipboard_get()

	if not var_116_0 or var_116_0:len() < 64 then
		arg_116_0:PlayErrorSound()
		gui.notify:add(gui.notification("[Weapon] Model Changer", "Failed Import Configs, Make Sure Your Clipboard Text Is Correct !"))

		return
	end

	local var_116_1, var_116_2 = xpcall(function()
		return utils.json_decode(arg_116_0:RemoveSpace(var_116_0))
	end, print)

	if not var_116_1 or not var_116_2 then
		arg_116_0:PlayErrorSound()
		gui.notify:add(gui.notification("[Weapon] Model Changer", "Failed Import Configs, Make Sure Your Clipboard Text Is Correct !"))

		return
	end

	for iter_116_0, iter_116_1 in pairs(arg_116_0.arrElements.arrWeaponModelPath) do
		local var_116_3 = var_116_2[iter_116_1.szName]

		if not var_116_3 then
			-- block empty
		else
			iter_116_1.pOverrideModel:get_value():set(var_116_3.bOverride)
			iter_116_1.pCustomModelPath:set_value(var_116_3.szCustomModelPath)
		end
	end

	arg_116_0:HandleElements()
	arg_116_0.arrElements.pElementOfLuaA:reset()
	gui.notify:add(gui.notification("[Weapon] Model Changer", "Configs Imported !"))
end

function slot_0_0_0.__index.SetupLocaltionConfig(arg_118_0)
	local var_118_0 = arg_118_0:GetGameDirectory()
	local var_118_1 = ("%s\\csgo\\fatality\\%s"):format(var_118_0, arg_118_0.szSettingsFile)

	if not arg_118_0:IsFileExist(var_118_1) then
		arg_118_0:WriteFile(var_118_1, "")

		return
	end

	arg_118_0:Load(true)
end

function slot_0_0_0.__index.CreateElements(arg_119_0)
	arg_119_0.arrElements.arrWeaponModelPath = {}
	arg_119_0.arrElements.pElementOfLuaA = gui.ctx:find("lua>elements a")
	arg_119_0.arrElements.pWeaponList = gui.combo_box(gui.control_id("MODEL: WEAPONS"))

	for iter_119_0, iter_119_1 in pairs(arg_119_0.arrWeaponItems) do
		arg_119_0.arrElements.pWeaponList:add(gui.selectable(gui.control_id(("WEAPON MODEL: %s"):format(iter_119_1.szWeaponName)), iter_119_1.szElementName))
	end

	arg_119_0.arrElements.pWeaponListRow = gui.make_control("[ Model ]: Weapon List", arg_119_0.arrElements.pWeaponList)

	arg_119_0.arrElements.pElementOfLuaA:add(arg_119_0.arrElements.pWeaponListRow)

	for iter_119_2, iter_119_3 in pairs(arg_119_0.arrWeaponItems) do
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2] = {}
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].nDefIndex = iter_119_3.nDefIndex
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].szName = iter_119_3.szWeaponName
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pOverrideModel = gui.checkbox(gui.control_id(("OVERRIDE: %s"):format(iter_119_3.szWeaponName)))
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pCustomModelPath = gui.text_input(gui.control_id(("WEAPON MODEL PATH: %s"):format(iter_119_3.szWeaponName)))
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pOverrideModelRow = gui.make_control(("[ %s ]: Override Model"):format(iter_119_3.szWeaponName), arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pOverrideModel)
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pCustomModelPathRow = gui.make_control("Model Path :", arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pCustomModelPath)

		arg_119_0.arrElements.pElementOfLuaA:add(arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pOverrideModelRow)
		arg_119_0.arrElements.pElementOfLuaA:add(arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pCustomModelPathRow)
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pOverrideModel:add_callback(arg_119_0:BindArgument(arg_119_0.HandleElements))

		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pOverrideModel.tooltip = ("enabled \"%s\" item custom model"):format(iter_119_3.szWeaponName)
		arg_119_0.arrElements.arrWeaponModelPath[iter_119_2].pCustomModelPath.tooltip = ("custom \"%s\" item model file path, start with \"phase2/\", end with \".vmdl\" or \".vmdl_c\", make sure path is correct and model file is valid"):format(iter_119_3.szWeaponName)
	end

	arg_119_0.arrElements.pSharedSettingsLabel = gui.label(gui.control_id("MODEL: SHARED"), "---------------")
	arg_119_0.arrElements.pForceOverrideAll = gui.checkbox(gui.control_id("MODEL: FORCE OVERRIDE ALL"))
	arg_119_0.arrElements.pOverrideProjectilesModel = gui.checkbox(gui.control_id("MODEL: OVERRIDE PROJECTILES MODEL"))
	arg_119_0.arrElements.pLoadButton = gui.button(gui.control_id("MODEL: LOAD"), "Load")
	arg_119_0.arrElements.pSaveButton = gui.button(gui.control_id("MODEL: SAVE"), "Save")
	arg_119_0.arrElements.pImportButton = gui.button(gui.control_id("MODEL: IMPORT"), "Import")
	arg_119_0.arrElements.pExportButton = gui.button(gui.control_id("MODEL: EXPORT"), "Export")
	arg_119_0.arrElements.pDelimiterLabel = gui.label(gui.control_id("MODEL: DELIMITER"), "---------------")
	arg_119_0.arrElements.pSaveButton.tooltip = "save config settings to localtion"
	arg_119_0.arrElements.pLoadButton.tooltip = "load config settings from localtion"
	arg_119_0.arrElements.pWeaponList.tooltip = "select your want custom model weapon"
	arg_119_0.arrElements.pExportButton.tooltip = "export config settings to you clipboard"
	arg_119_0.arrElements.pImportButton.tooltip = "import config settings from you clipboard copyed, make sure you clipboard text is correct"
	arg_119_0.arrElements.pOverrideProjectilesModel.tooltip = "override grenades projectiles world model, warning !: this option maybe drop your fps"
	arg_119_0.arrElements.pForceOverrideAll.tooltip = "force override all exist weapon model, not just active weapon, warning !: this option maybe drop your fps, you can just disable it"

	arg_119_0.arrElements.pLoadButton:add_callback(arg_119_0:BindArgument(arg_119_0.Load))
	arg_119_0.arrElements.pSaveButton:add_callback(arg_119_0:BindArgument(arg_119_0.Save))
	arg_119_0.arrElements.pImportButton:add_callback(arg_119_0:BindArgument(arg_119_0.Import))
	arg_119_0.arrElements.pExportButton:add_callback(arg_119_0:BindArgument(arg_119_0.Export))
	arg_119_0.arrElements.pWeaponList:add_callback(arg_119_0:BindArgument(arg_119_0.HandleElements))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("---------------           Other", arg_119_0.arrElements.pSharedSettingsLabel))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("[ Model ]: Force Override All Weapon", arg_119_0.arrElements.pForceOverrideAll))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("[ Model ]: Override Projectiles Model", arg_119_0.arrElements.pOverrideProjectilesModel))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("---------------   Configuration", arg_119_0.arrElements.pDelimiterLabel))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("[ Local ]: Load", arg_119_0.arrElements.pLoadButton))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("[ Local ]: Save", arg_119_0.arrElements.pSaveButton))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("[ Clipboard ]: Import", arg_119_0.arrElements.pImportButton))
	arg_119_0.arrElements.pElementOfLuaA:add(gui.make_control("[ Clipboard ]: Export", arg_119_0.arrElements.pExportButton))
	arg_119_0.arrElements.pElementOfLuaA:reset()
end

function slot_0_0_0.__index.MakeInterface(arg_120_0)
	local var_120_0 = arg_120_0:GetGameDirectory()

	arg_120_0:CallModuleExport("Kernel32.dll", "CreateDirectoryA", "int(__stdcall*)(const char*, void*)", ("%s\\csgo\\models"):format(var_120_0), arg_120_0.NULLPTR)
	arg_120_0:CallModuleExport("Kernel32.dll", "CreateDirectoryA", "int(__stdcall*)(const char*, void*)", ("%s\\csgo\\weapons"):format(var_120_0), arg_120_0.NULLPTR)
	arg_120_0:CallModuleExport("Kernel32.dll", "CreateDirectoryA", "int(__stdcall*)(const char*, void*)", ("%s\\csgo\\models\\weapons"):format(var_120_0), arg_120_0.NULLPTR)

	function __shutdown()
		for iter_121_0, iter_121_1 in pairs(arg_120_0.arrUnloadCallBacks) do
			xpcall(iter_121_1, print)
		end
	end

	ffi.metatype("TypedResourceName", {
		[0] = nil,
		__gc = function(arg_122_0)
			arg_120_0.fnPurgeBufferString(arg_122_0.strName, 0)
		end
	})

	arg_120_0.pMemAlloc = arg_120_0:IMemAlloc(arg_120_0:GetModuleProc("tier0.dll", "g_pMemAlloc"):Dereference():Get())
	arg_120_0.pSource2Client = arg_120_0:ISource2Client(arg_120_0:FindInterface("client.dll", "Source2Client002"):Get())
	arg_120_0.pFileSystem = arg_120_0:CBaseFileSystem(arg_120_0:FindInterface("filesystem_stdio.dll", "VFileSystem017"):Get())
	arg_120_0.pResourceSystem = arg_120_0:IResourceSystem(arg_120_0:FindInterface("resourcesystem.dll", "ResourceSystem013"):Get())
	arg_120_0.fnGetBaseEntity = arg_120_0:FindPattern("client.dll", "4C 8D 49 10 81 FA FE 7F"):Get("void*(__fastcall*)(void*, int)")
	arg_120_0.fnUpdateSubClass = arg_120_0:FindPattern("client.dll", "4C 8B DC 53 48 81 EC ? ? ? ? 48 8B 41"):Get("void(__fastcall*)(void*)")
	arg_120_0.fnPurgeBufferString = arg_120_0:GetModuleProc("tier0.dll", "?Purge@CBufferString@@QEAAXH@Z"):Get("void(__fastcall*)(CBufferString*, int)")
	arg_120_0.pGameEntitySystem = arg_120_0:IGameEntitySystem(arg_120_0:FindInterface("engine2.dll", "GameResourceServiceClientV001"):Field(88):Dereference():Get())
	arg_120_0.fnSetModel = arg_120_0:FindPattern("client.dll", "40 53 48 83 ? ? 48 8B ? 4C 8B ? 48 8B ? ? ? ? ? 48 8D ? ? ? 48 8B"):Get("void(__fastcall*)(void*, const char*)")
	arg_120_0.fnPlaySound = arg_120_0:FindPattern("soundsystem.dll", "48 89 5C 24 ? 48 89 74 24 ? 48 89 7C 24 ? 55 48 8D 6C 24 ? 48 81 EC ? ? ? ? 33 F6 C7 45 B4 C8"):Get("void(__fastcall*)(const char*)")
	arg_120_0.fnUpdateVData = arg_120_0:FindPattern("client.dll", "48 8B 89 40 03 ? ? 48 85 ? ? ? ? ? ? FF C3 ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? 48 89 6C 24 18 48 89 7C 24 20"):Get("void(__fastcall*)(void*)")
	arg_120_0.fnInitTypedResourceName = arg_120_0:FindPattern("client.dll", "E8 ? ? ? ? 48 8B 0D ? ? ? ? 48 8D ? ? ? ? ? 4C 8B ? E8 ? ? ? ? ? ? 48 8D"):ToAbsolute(1, 0):Get("void(__fastcall*)(TypedResourceName*, const char*)")
	arg_120_0.fnBitLeftShift = arg_120_0:CreateShellCode({
		72,
		139,
		193,
		72,
		139,
		202,
		72,
		211,
		224,
		195,
		[0] = nil
	}, "uint64_t(__fastcall*)(uint64_t, uint64_t)")
end

function slot_0_0_0.__index.UpdateWorldProjectiles(arg_123_0, arg_123_1)
	if not arg_123_0.arrElements.pOverrideProjectilesModel:get_value():get() then
		return
	end

	for iter_123_0, iter_123_1 in pairs(arg_123_0:GetProjectiles(arg_123_1)) do
		local var_123_0 = iter_123_1:get_class_name()
		local var_123_1 = arg_123_0:FindSettings(var_123_0 == "C_DecoyProjectile" and "Decoy" or var_123_0 == "C_HEGrenadeProjectile" and "Grenade" or var_123_0 == "C_FlashbangProjectile" and "FlashBang" or var_123_0 == "C_MolotovProjectile" and "Molotov Grenade" or "Smoke Grenade")

		if not var_123_1 or not var_123_1.pOverrideModel:get_value():get() then
			-- block empty
		else
			local var_123_2 = arg_123_0:FixupResourcePath(var_123_1.pCustomModelPath.value)

			if not arg_123_0:IsValidatePath(var_123_2) or not arg_123_0:FileExist(var_123_2) then
				-- block empty
			elseif not arg_123_0:IsPrecached(var_123_2) then
				arg_123_0:Precache(var_123_2)
			else
				local var_123_3 = arg_123_0:GetModelName(iter_123_1)

				if var_123_3 and var_123_3 ~= var_123_2 then
					arg_123_0:SetModel(iter_123_1, var_123_2)
				end
			end
		end
	end
end

function slot_0_0_0.__index.GetModelName(arg_124_0, arg_124_1)
	local var_124_0 = arg_124_0:GetClientEntity(arg_124_1)

	if var_124_0 == arg_124_0.NULLPTR then
		return false
	end

	local var_124_1 = arg_124_0:GetField(var_124_0, "pGameSceneNode", "void*")

	if var_124_1 == arg_124_0.NULLPTR then
		return false
	end

	local var_124_2 = arg_124_0:GetFieldPtr(var_124_1, "hModelState", "void*")
	local var_124_3 = arg_124_0:GetField(var_124_2, "szModelName", "const char*")

	if not var_124_3 or var_124_3 == arg_124_0.NULLPTR or var_124_3[0] == 0 then
		return false
	end

	return ffi.string(var_124_3)
end

function slot_0_0_0.__index.IsValidateKnifeModelName(arg_125_0, arg_125_1, arg_125_2)
	if not arg_125_2 or arg_125_1 ~= 0 then
		return true
	end

	local var_125_0 = arg_125_0:GetModelName(arg_125_2)

	if not var_125_0 then
		return true
	end

	if not var_125_0:find("phase2/weapons/models/knife/knife_") then
		return true
	end

	return var_125_0:find("weapon_knife_default") ~= nil
end

function slot_0_0_0.__index.UpdateCustomWeaponModel(arg_126_0, arg_126_1)
	slot_126_2_0 = arg_126_0:GetHudModelWeapon(arg_126_1)

	if not slot_126_2_0 or slot_126_2_0 == arg_126_0.NULLPTR then
		return
	end

	if not arg_126_0.arrElements.pForceOverrideAll:get_value():get() then
		slot_126_4_0 = arg_126_1:get_active_weapon()

		if not slot_126_4_0 then
			return
		end

		slot_126_5_0 = arg_126_0:GetWeaponConfig(slot_126_4_0)
		slot_126_6_0 = arg_126_0:GetMetaWeaponType(slot_126_4_0)

		if not slot_126_5_0 or not slot_126_5_0.pOverrideModel:get_value():get() then
			return
		end

		slot_126_7_1 = arg_126_0:GetMetaWeaponIndex(slot_126_4_0)
		slot_126_8_1 = arg_126_0:FixupResourcePath(slot_126_5_0.pCustomModelPath.value)

		if not arg_126_0:IsValidatePath(slot_126_8_1) then
			return
		end

		slot_126_9_1 = arg_126_0:FileExist(slot_126_8_1)
		slot_126_10_1 = arg_126_0:IsValidateKnifeModelName(slot_126_6_0, slot_126_4_0)

		if not arg_126_0.arrLastModelFilePath[slot_126_7_1] then
			arg_126_0.arrLastModelFilePath[slot_126_7_1] = ""
		elseif arg_126_0.arrLastModelFilePath[slot_126_7_1] ~= slot_126_8_1 then
			arg_126_0.arrLastModelFilePath[slot_126_7_1] = slot_126_8_1

			if not slot_126_9_1 then
				arg_126_0:PlayErrorSound()
				gui.notify:add(gui.notification("[Weapon] Model Changer Warning", ("Model: %s file not exist, please make sure path are correct !"):format(slot_126_8_1)))
			end

			if not slot_126_10_1 then
				arg_126_0:PlayErrorSound()
				game.engine:client_cmd("showconsole")
				print("weapon model changer error: please equipment default knife before you custom knife model !")
				gui.notify:add(gui.notification("[Weapon] Model Changer Error !", "please equipment default knife before you custom knife model !"))
			end
		end

		if not slot_126_9_1 or not slot_126_10_1 then
			return
		end

		if not arg_126_0:IsPrecached(slot_126_8_1) then
			arg_126_0:Precache(slot_126_8_1)

			return
		end

		slot_126_11_1 = arg_126_0:GetModelName(slot_126_4_0)
		slot_126_12_1 = arg_126_0:GetModelName(slot_126_2_0)
		slot_126_13_1 = arg_126_0:GetOwnerEntity(slot_126_2_0)
		slot_126_14_1 = arg_126_0:FindIncludedAnimationCorrectModel(slot_126_8_1)

		if slot_126_6_0 == 0 and slot_126_14_1 and arg_126_0:IsSameEntity(slot_126_4_0, slot_126_13_1) then
			arg_126_0:SetSubClassId(slot_126_4_0, slot_126_14_1)
		end

		if slot_126_11_1 ~= slot_126_8_1 or slot_126_12_1 ~= slot_126_8_1 then
			arg_126_0:SetModel(slot_126_4_0, slot_126_8_1)
			arg_126_0:SetModel(slot_126_2_0, slot_126_8_1)
		end
	else
		for iter_126_0, iter_126_1 in pairs(arg_126_0:GetMyWeapons(arg_126_1)) do
			slot_126_9_0 = arg_126_0:GetWeaponConfig(iter_126_1)

			if not slot_126_9_0 or not slot_126_9_0.pOverrideModel:get_value():get() then
				-- block empty
			else
				slot_126_10_0 = arg_126_0:GetMetaWeaponType(iter_126_1)
				slot_126_11_0 = arg_126_0:GetMetaWeaponIndex(iter_126_1)
				slot_126_12_0 = arg_126_0:FixupResourcePath(slot_126_9_0.pCustomModelPath.value)

				if not arg_126_0:IsValidatePath(slot_126_12_0) then
					-- block empty
				else
					slot_126_13_0 = arg_126_0:FileExist(slot_126_12_0)
					slot_126_14_0 = arg_126_0:IsValidateKnifeModelName(slot_126_10_0, iter_126_1)

					if not arg_126_0.arrLastModelFilePath[slot_126_11_0] then
						arg_126_0.arrLastModelFilePath[slot_126_11_0] = ""
					end

					if arg_126_0.arrLastModelFilePath[slot_126_11_0] ~= slot_126_12_0 then
						arg_126_0.arrLastModelFilePath[slot_126_11_0] = slot_126_12_0

						if not slot_126_13_0 then
							gui.notify:add(gui.notification("[Weapon] Model Changer Warning", ("Model: %s file not exist, please make sure you enter correct path"):format(slot_126_12_0)))
						end

						if not slot_126_14_0 then
							game.engine:client_cmd("showconsole")
							print("weapon model changer error: please equipment default knife before you custom knife model !")
							gui.notify:add(gui.notification("[Weapon] Model Changer Error !", "please equipment default knife before you custom knife model !"))
						end
					end

					if not slot_126_13_0 or not slot_126_14_0 then
						-- block empty
					elseif not arg_126_0:IsPrecached(slot_126_12_0) then
						arg_126_0:Precache(slot_126_12_0)
					else
						slot_126_15_0 = arg_126_0:GetModelName(iter_126_1)
						slot_126_16_0 = arg_126_0:GetOwnerEntity(slot_126_2_0)
						slot_126_17_0 = arg_126_0:GetModelName(slot_126_2_0)
						slot_126_18_0 = arg_126_0:FindIncludedAnimationCorrectModel(slot_126_12_0)

						if slot_126_10_0 == 0 and slot_126_18_0 then
							arg_126_0:SetSubClassId(iter_126_1, slot_126_18_0)
						end

						if slot_126_15_0 ~= slot_126_12_0 then
							arg_126_0:SetModel(iter_126_1, slot_126_12_0)
						end

						if arg_126_0:IsSameEntity(iter_126_1, slot_126_16_0) and slot_126_17_0 ~= slot_126_12_0 then
							arg_126_0:SetModel(slot_126_2_0, slot_126_12_0)
						end
					end
				end
			end
		end
	end
end

function slot_0_0_0.__index.FrameStageNotify(arg_127_0, arg_127_1)
	if not game.engine:in_game() or arg_127_1 ~= client_frame_stage.net_update_end then
		return
	end

	local var_127_0 = entities.get_local_pawn()

	if not var_127_0 or not var_127_0:is_alive() then
		return
	end

	arg_127_0:UpdateWorldProjectiles(var_127_0)
	arg_127_0:UpdateCustomWeaponModel(var_127_0)
end

function slot_0_0_0.__index.FireGameEvent(arg_128_0, arg_128_1)
	local var_128_0 = arg_128_1:get_name()

	if var_128_0 == "game_newmap" then
		arg_128_0:ClearPrecached()
		arg_128_0:GarbageCollectionResources()
	elseif var_128_0 == "player_connect_full" then
		local var_128_1 = arg_128_1:get_controller("userid")

		if not var_128_1 or not var_128_1.m_bIsLocalPlayerController:get() then
			return
		end

		arg_128_0:ClearPrecached()
		arg_128_0:GarbageCollectionResources()
	end
end

function slot_0_0_0.__index.ShutDown(arg_129_0)
	arg_129_0:FreeAllocMemorys()
	arg_129_0:GarbageCollectionResources()
end

function slot_0_0_0.__index.Setup(arg_130_0)
	arg_130_0:MakeInterface()
	arg_130_0:CollectWeapons()
	arg_130_0:CreateElements()
	arg_130_0:HandleElements()
	arg_130_0:SetupLocaltionConfig()
	mods.events:add_listener("game_newmap")
	mods.events:add_listener("player_connect_full")
	arg_130_0:AddUnloadEvent(arg_130_0:BindArgument(arg_130_0.ShutDown))
	events.event:add(arg_130_0:BindArgument(arg_130_0.FireGameEvent))
	events.frame_stage_notify:add(arg_130_0:BindArgument(arg_130_0.FrameStageNotify))
end

slot_0_0_0:Setup()
