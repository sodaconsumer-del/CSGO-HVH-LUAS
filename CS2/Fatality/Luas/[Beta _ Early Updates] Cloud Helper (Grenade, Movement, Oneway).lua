--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

if not ws.TestCapability("ffi") or not ws.TestCapability("clipboard") or not ws.TestCapability("http") then
	return error("[Helper] Please grant all permissions for the script.")
end

slot_0_0_0 = ws.GetBuildID() == 0 and "fatality/resource/__helper__" or ws.GetResourceDir()
slot_0_1_0 = game.input
slot_0_2_0 = slot_0_1_0.GetViewAngles
slot_0_3_0 = game.engine
slot_0_4_0 = draw.Color
slot_0_5_0 = slot_0_4_0.Interpolate
slot_0_6_0 = draw.Vec2
slot_0_7_0 = draw.Rect
slot_0_8_0 = Vector
slot_0_9_0 = slot_0_8_0()
slot_0_10_0 = slot_0_9_0.Dist
slot_0_11_0 = slot_0_9_0.Dist2d
slot_0_12_0 = slot_0_9_0.Length
slot_0_13_0 = slot_0_9_0.Length2d
slot_0_14_0 = slot_0_9_0.GetForward
slot_0_15_0 = draw.surface
slot_0_16_0 = slot_0_15_0.g
slot_0_17_0 = slot_0_16_0.SetTexture
slot_0_18_0 = slot_0_15_0.AddRect
slot_0_19_0 = slot_0_15_0.AddRectFilled
slot_0_20_0 = slot_0_15_0.OverrideClipRect
slot_0_21_0 = slot_0_15_0.AddText
slot_0_22_0 = slot_0_15_0.AddCircleFilled
slot_0_23_0 = math.WorldToScreen
slot_0_24_0 = math.AngleNormalize
slot_0_25_0 = math.VectorAngles
slot_0_26_0 = entities.GetLocalPawn
slot_0_27_0 = math.min
slot_0_28_0 = math.max
slot_0_29_0 = math.floor
slot_0_30_0 = math.pow
slot_0_31_0 = math.cos
slot_0_32_0 = math.sin
slot_0_33_0 = math.atan2
slot_0_34_0 = math.abs
slot_0_35_0 = math.rad
slot_0_36_0 = math.pi
slot_0_37_0 = string.gsub
slot_0_38_0 = string.sub
slot_0_39_0 = string.format
slot_0_40_0 = string.find
slot_0_41_0 = string.char
slot_0_42_0 = string.upper
slot_0_43_0 = string.byte
slot_0_44_0 = string.rep
slot_0_45_0 = table.remove
slot_0_46_0 = table.sort
slot_0_47_0 = table.concat
slot_0_48_0 = table.insert
slot_0_49_0 = ipairs
slot_0_50_0 = pairs
slot_0_51_0 = type
slot_0_52_0 = tostring
slot_0_53_0 = tonumber
slot_0_54_0 = ffi.cast
slot_0_55_0 = ffi.new
slot_0_56_0 = ffi.copy
slot_0_57_0 = bit.band
slot_0_58_0 = ffi.typeof("    struct {\n        float x;\n        float y;\n        float z;\n    }\n")
slot_0_59_0 = ffi.typeof("    struct {\n        float x;\n        float y;\n        float z;\n        float w;\n    }\n")
slot_0_60_0 = InputBitMask_t.IN_ATTACK
slot_0_61_0 = InputBitMask_t.IN_ATTACK2
slot_0_62_0 = InputBitMask_t.IN_JUMP
slot_0_63_0 = InputBitMask_t.IN_DUCK
slot_0_64_0 = InputBitMask_t.IN_FORWARD
slot_0_65_0 = InputBitMask_t.IN_BACK
slot_0_66_0 = InputBitMask_t.IN_TURNLEFT
slot_0_67_0 = InputBitMask_t.IN_TURNRIGHT
slot_0_68_0 = InputBitMask_t.IN_MOVELEFT
slot_0_69_0 = InputBitMask_t.IN_MOVERIGHT
slot_0_70_0 = InputBitMask_t.IN_SPEED
slot_0_71_0 = {
	slot_0_60_0,
	slot_0_61_0,
	slot_0_62_0,
	slot_0_63_0,
	slot_0_64_0,
	slot_0_65_0,
	slot_0_66_0,
	slot_0_67_0,
	slot_0_68_0,
	slot_0_69_0,
	slot_0_70_0
}
slot_0_72_0 = gui.ctx.user.username
slot_0_73_1 = nil
slot_0_74_2 = utils.FindExport("shell32.dll", "ShellExecuteA")
slot_0_74_1 = slot_0_54_0("int(__thiscall*)(void*, const char*, const char*, const char*, const char*, int)", slot_0_74_2)

function slot_0_73_0(arg_1_0)
	slot_0_74_1(nil, "open", arg_1_0, nil, nil, 1)
end

function slot_0_74_0(arg_2_0, arg_2_1)
	local var_2_0 = utils.FindPattern(arg_2_0, arg_2_1)

	if var_2_0 == 0 then
		return
	end

	return var_2_0
end

function slot_0_75_0(arg_3_0)
	local var_3_0 = gui.Notification("Helper", arg_3_0)

	gui.notify:Add(var_3_0)
end

slot_0_76_1 = nil
slot_0_77_3 = {}

function slot_0_76_0(arg_4_0)
	slot_0_77_3[#slot_0_77_3 + 1] = arg_4_0
end

function __shutdown()
	for iter_5_0, iter_5_1 in slot_0_49_0(slot_0_77_3) do
		iter_5_1()
	end
end

slot_0_77_2 = nil
slot_0_78_2 = nil
slot_0_77_1 = utils.FindExport("kernel32.dll", "GetModuleHandleA")
slot_0_77_0 = slot_0_54_0("void*(__thiscall*)(const char*)", slot_0_77_1)
slot_0_78_1 = utils.FindExport("kernel32.dll", "GetProcAddress")
slot_0_78_0 = slot_0_54_0("void*(__thiscall*)(void*, const char*)", slot_0_78_1)
slot_0_79_1 = nil
slot_0_80_1 = nil
slot_0_81_2 = {}

function slot_0_79_0(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {
		fn = arg_6_2
	}

	http.Get(arg_6_0, arg_6_1, function(arg_7_0, arg_7_1)
		var_6_0.status = arg_7_0
		var_6_0.data = arg_7_1
	end)

	slot_0_81_2[#slot_0_81_2 + 1] = var_6_0
end

function slot_0_80_0(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = {
		fn = arg_8_2
	}

	http.Post(arg_8_0, arg_8_1, function(arg_9_0, arg_9_1)
		var_8_0.status = arg_9_0
		var_8_0.data = arg_9_1
	end)

	slot_0_81_2[#slot_0_81_2 + 1] = var_8_0
end

events.presentQueue:Add(function()
	for iter_10_0 = #slot_0_81_2, 1, -1 do
		local var_10_0 = slot_0_81_2[iter_10_0]

		if var_10_0.status ~= nil then
			var_10_0.fn(var_10_0.status, var_10_0.data)
			slot_0_45_0(slot_0_81_2, iter_10_0)
		end
	end
end)

slot_0_81_1 = nil
slot_0_82_1 = nil
slot_0_83_1 = nil
slot_0_84_1 = nil

function slot_0_81_0(arg_11_0, arg_11_1)
	local var_11_0 = slot_0_77_0(arg_11_0)

	if var_11_0 == nil then
		return
	end

	local var_11_1 = slot_0_78_0(var_11_0, "CreateInterface")

	if var_11_1 == nil then
		return
	end

	return slot_0_54_0("void*(__thiscall*)(const char*, int)", var_11_1)(arg_11_1, 0)
end

slot_0_85_3 = {}

function slot_0_82_0(arg_12_0, arg_12_1, ...)
	slot_0_85_3[#slot_0_85_3 + 1] = {
		delay = arg_12_0,
		callback = arg_12_1,
		args = {
			...
		}
	}
end

events.presentQueue:Add(function()
	local var_13_0 = game.globalVars.m_flRenderFrameTime

	for iter_13_0 = #slot_0_85_3, 1, -1 do
		local var_13_1 = slot_0_85_3[iter_13_0]

		var_13_1.delay = var_13_1.delay - var_13_0

		if var_13_1.delay <= 0 then
			var_13_1.callback(unpack(var_13_1.args))
			table.remove(slot_0_85_3, iter_13_0)
		end
	end
end)

function slot_0_83_0(arg_14_0, arg_14_1, arg_14_2)
	arg_14_2 = arg_14_2 or 0
	arg_14_0 = arg_14_0 + arg_14_1
	arg_14_0 = arg_14_0 + slot_0_54_0("int32_t*", arg_14_0)[0] + 4
	arg_14_0 = arg_14_0 + arg_14_2

	return arg_14_0
end

slot_0_85_2 = game.physicsQueryInterface
slot_0_86_2 = slot_0_85_2.TraceRay
slot_0_87_2 = Ray_t

function slot_0_84_0(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = slot_0_87_2()

	return slot_0_86_2(slot_0_85_2, var_15_0, arg_15_0, arg_15_1)
end

slot_0_85_1 = nil
slot_0_86_1 = nil
slot_0_87_1 = nil
slot_0_88_1 = nil
slot_0_85_0 = (function()
	local var_16_0 = slot_0_54_0("void(__thiscall*)(void*)", utils.FindExport("msvcrt.dll", "free"))
	local var_16_1 = slot_0_54_0("void*(__thiscall*)(void*, size_t)", utils.FindExport("msvcrt.dll", "realloc"))
	local var_16_2 = slot_0_54_0("void*(__thiscall*)(size_t)", utils.FindExport("msvcrt.dll", "malloc"))
	local var_16_3 = bit.bor
	local var_16_4 = slot_0_57_0
	local var_16_5 = bit.rshift
	local var_16_6 = slot_0_55_0("unsigned char[8]")
	local var_16_7 = slot_0_55_0("unsigned char[8]")
	local var_16_8 = ffi.typeof("unsigned char[?]")
	local var_16_9 = ffi.abi("le")

	local function var_16_10(arg_17_0, arg_17_1, arg_17_2)
		local var_17_0 = arg_17_2 - 1

		for iter_17_0 = 0, var_17_0 do
			arg_17_0[iter_17_0] = arg_17_1[var_17_0 - iter_17_0]
		end
	end

	local var_16_11 = 8192
	local var_16_12 = {}

	local function var_16_13(arg_18_0)
		arg_18_0.size = 0
		arg_18_0.alloc = var_16_11
		arg_18_0.data = slot_0_54_0("unsigned char *", var_16_2(var_16_11))
	end

	local function var_16_14(arg_19_0)
		var_16_0(var_16_12.data)
	end

	local function var_16_15(arg_20_0, arg_20_1)
		if arg_20_1 > arg_20_0.alloc - arg_20_0.size then
			local var_20_0 = arg_20_0.alloc * 2

			while var_20_0 < arg_20_0.alloc + arg_20_1 do
				var_20_0 = var_20_0 * 2
			end

			arg_20_0.data = slot_0_54_0("unsigned char *", var_16_1(arg_20_0.data, var_20_0))
			arg_20_0.alloc = var_20_0
		end
	end

	local function var_16_16(arg_21_0, arg_21_1, arg_21_2)
		var_16_15(arg_21_0, arg_21_2)
		slot_0_56_0(arg_21_0.data + arg_21_0.size, arg_21_1, arg_21_2)

		arg_21_0.size = arg_21_0.size + arg_21_2
	end

	local function var_16_17(arg_22_0, arg_22_1)
		var_16_15(arg_22_0, 1)

		arg_22_0.data[arg_22_0.size] = arg_22_1
		arg_22_0.size = arg_22_0.size + 1
	end

	local function var_16_18(arg_23_0, arg_23_1)
		local var_23_0 = #arg_23_1

		var_16_15(arg_23_0, var_23_0)

		local var_23_1 = arg_23_0.data + arg_23_0.size - 1

		for iter_23_0 = 1, var_23_0 do
			var_23_1[iter_23_0] = arg_23_1[iter_23_0]
		end

		arg_23_0.size = arg_23_0.size + var_23_0
	end

	local var_16_19
	local var_16_20

	if var_16_9 then
		function var_16_19(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
			local var_24_0 = {
				arg_24_3
			}

			for iter_24_0 = arg_24_2 - 8, 8, -8 do
				var_24_0[#var_24_0 + 1] = var_16_4(var_16_5(arg_24_1, iter_24_0), 255)
			end

			var_24_0[#var_24_0 + 1] = var_16_4(arg_24_1, 255)

			var_16_18(arg_24_0, var_24_0)
		end

		function var_16_20(arg_25_0, arg_25_1, arg_25_2)
			local var_25_0 = slot_0_29_0(arg_25_1 / 4294967296)
			local var_25_1 = arg_25_1 % 4294967296
			local var_25_2 = {
				arg_25_2
			}

			for iter_25_0 = 24, 8, -8 do
				var_25_2[#var_25_2 + 1] = var_16_4(var_16_5(var_25_0, iter_25_0), 255)
			end

			var_25_2[5] = var_16_4(var_25_0, 255)

			for iter_25_1 = 24, 8, -8 do
				var_25_2[#var_25_2 + 1] = var_16_4(var_16_5(var_25_1, iter_25_1), 255)
			end

			var_25_2[9] = var_16_4(var_25_1, 255)

			var_16_18(arg_25_0, var_25_2)
		end
	else
		function var_16_19(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
			local var_26_0 = {
				arg_26_3,
				var_16_4(arg_26_1, 255)
			}

			for iter_26_0 = 8, arg_26_2 - 8, 8 do
				var_26_0[#var_26_0 + 1] = var_16_4(var_16_5(arg_26_1, iter_26_0), 255)
			end

			var_16_18(arg_26_0, var_26_0)
		end

		function var_16_20(arg_27_0, arg_27_1, arg_27_2)
			local var_27_0 = slot_0_29_0(arg_27_1 / 4294967296)
			local var_27_1 = arg_27_1 % 4294967296
			local var_27_2 = {
				arg_27_2,
				var_16_4(var_27_1, 255)
			}

			for iter_27_0 = 8, 24, 8 do
				var_27_2[#var_27_2 + 1] = var_16_4(var_16_5(var_27_1, iter_27_0), 255)
			end

			var_27_2[6] = var_16_4(var_27_0, 255)

			for iter_27_1 = 8, 24, 8 do
				var_27_2[#var_27_2 + 1] = var_16_4(var_16_5(var_27_0, iter_27_1), 255)
			end

			var_16_18(arg_27_0, var_27_2)
		end
	end

	local var_16_21 = {}

	function var_16_21.dynamic(arg_28_0)
		return var_16_21[slot_0_51_0(arg_28_0)](arg_28_0)
	end

	var_16_21["nil"] = function()
		var_16_17(var_16_12, 192)
	end

	function var_16_21.boolean(arg_30_0)
		if arg_30_0 then
			var_16_17(var_16_12, 195)
		else
			var_16_17(var_16_12, 194)
		end
	end

	;(function(arg_31_0)
		local var_31_0
		local var_31_1
		local var_31_2
		local var_31_3
		local var_31_4

		if arg_31_0 == "double" then
			var_31_1, var_31_0 = 203, ffi.typeof("double *")
			var_31_2 = {
				var_31_1,
				127,
				240,
				0,
				0,
				0,
				0,
				0,
				0
			}
			var_31_3 = {
				var_31_1,
				255,
				240,
				0,
				0,
				0,
				0,
				0,
				0
			}
			var_31_4 = {
				var_31_1,
				255,
				248,
				0,
				0,
				0,
				0,
				0,
				0
			}
		elseif arg_31_0 == "float" then
			var_31_1, var_31_0 = 202, ffi.typeof("float *")
			var_31_2 = {
				var_31_1,
				127,
				128,
				0,
				0
			}
			var_31_3 = {
				var_31_1,
				255,
				128,
				0,
				0
			}
			var_31_4 = {
				var_31_1,
				255,
				136,
				0,
				0
			}
		else
			return nil
		end

		local var_31_5 = ffi.sizeof(arg_31_0)

		if var_16_9 then
			function var_16_21.fpnum(arg_32_0)
				slot_0_54_0(var_31_0, var_16_7)[0] = arg_32_0

				var_16_10(var_16_6, var_16_7, var_31_5)
				var_16_17(var_16_12, var_31_1)
				var_16_16(var_16_12, var_16_6, var_31_5)
			end
		else
			function var_16_21.fpnum(arg_33_0)
				slot_0_54_0(var_31_0, var_16_6)[0] = arg_33_0

				var_16_17(var_16_12, var_31_1)
				var_16_16(var_16_12, var_16_6, var_31_5)
			end
		end

		function var_16_21.posinf()
			var_16_18(var_16_12, var_31_2)
		end

		function var_16_21.neginf()
			var_16_18(var_16_12, var_31_3)
		end

		function var_16_21.nan()
			var_16_18(var_16_12, var_31_4)
		end

		return true
	end)("double")

	function var_16_21.number(arg_37_0)
		if slot_0_29_0(arg_37_0) == arg_37_0 then
			if arg_37_0 >= 0 then
				if arg_37_0 < 128 then
					var_16_17(var_16_12, arg_37_0)
				elseif arg_37_0 < 256 then
					var_16_18(var_16_12, {
						204,
						arg_37_0
					})
				elseif arg_37_0 < 65536 then
					var_16_19(var_16_12, arg_37_0, 16, 205)
				elseif arg_37_0 < 4294967296 then
					var_16_19(var_16_12, arg_37_0, 32, 206)
				elseif arg_37_0 == math.huge then
					var_16_21.posinf()
				else
					var_16_20(var_16_12, arg_37_0, 207)
				end
			elseif arg_37_0 >= -32 then
				var_16_17(var_16_12, var_16_3(224, arg_37_0))
			elseif arg_37_0 >= -128 then
				var_16_18(var_16_12, {
					208,
					arg_37_0
				})
			elseif arg_37_0 >= -32768 then
				var_16_19(var_16_12, arg_37_0, 16, 209)
			elseif arg_37_0 >= -2147483648 then
				var_16_19(var_16_12, arg_37_0, 32, 210)
			elseif arg_37_0 == -math.huge then
				var_16_21.neginf()
			else
				var_16_20(var_16_12, arg_37_0, 211)
			end
		elseif arg_37_0 ~= arg_37_0 then
			var_16_21.nan()
		else
			var_16_21.fpnum(arg_37_0)
		end
	end

	function var_16_21.string(arg_38_0)
		local var_38_0 = #arg_38_0

		if var_38_0 < 32 then
			var_16_17(var_16_12, var_16_3(160, var_38_0))
		elseif var_38_0 < 65536 then
			var_16_19(var_16_12, var_38_0, 16, 218)
		elseif var_38_0 < 4294967296 then
			var_16_19(var_16_12, var_38_0, 32, 219)
		else
			error("overflow")
		end

		var_16_16(var_16_12, arg_38_0, var_38_0)
	end

	var_16_21["function"] = function(arg_39_0)
		error("unimplemented", arg_39_0)
	end

	function var_16_21.userdata(arg_40_0)
		return var_16_21.cdata(arg_40_0)
	end

	function var_16_21.thread(arg_41_0)
		error("unimplemented", arg_41_0)
	end

	function var_16_21.array(arg_42_0, arg_42_1)
		arg_42_1 = arg_42_1 or #arg_42_0

		if arg_42_1 < 16 then
			var_16_17(var_16_12, var_16_3(144, arg_42_1))
		elseif arg_42_1 < 65536 then
			var_16_19(var_16_12, arg_42_1, 16, 220)
		elseif arg_42_1 < 4294967296 then
			var_16_19(var_16_12, arg_42_1, 32, 221)
		else
			error("overflow")
		end

		for iter_42_0 = 1, arg_42_1 do
			var_16_21[slot_0_51_0(arg_42_0[iter_42_0])](arg_42_0[iter_42_0])
		end
	end

	function var_16_21.map(arg_43_0, arg_43_1)
		if not arg_43_1 then
			arg_43_1 = 0

			for iter_43_0 in slot_0_50_0(arg_43_0) do
				arg_43_1 = arg_43_1 + 1
			end
		end

		if arg_43_1 < 16 then
			var_16_17(var_16_12, var_16_3(128, arg_43_1))
		elseif arg_43_1 < 65536 then
			var_16_19(var_16_12, arg_43_1, 16, 222)
		elseif arg_43_1 < 4294967296 then
			var_16_19(var_16_12, arg_43_1, 32, 223)
		else
			error("overflow")
		end

		for iter_43_1, iter_43_2 in slot_0_50_0(arg_43_0) do
			var_16_21[slot_0_51_0(iter_43_1)](iter_43_1)
			var_16_21[slot_0_51_0(iter_43_2)](iter_43_2)
		end
	end

	local function var_16_22(arg_44_0)
		function var_16_21.table(arg_45_0)
			local var_45_0, var_45_1 = arg_44_0(arg_45_0)

			var_16_21[var_45_0](arg_45_0, var_45_1)
		end
	end

	local function var_16_23(arg_46_0)
		local var_46_0 = false
		local var_46_1 = 0
		local var_46_2 = 0

		for iter_46_0, iter_46_1 in slot_0_50_0(arg_46_0) do
			if slot_0_51_0(iter_46_0) == "number" and iter_46_0 > 0 and slot_0_29_0(iter_46_0) == iter_46_0 then
				if var_46_2 < iter_46_0 then
					var_46_2 = iter_46_0
				end
			else
				var_46_0 = true
			end

			var_46_1 = var_46_1 + 1
		end

		if var_46_2 ~= var_46_1 then
			var_46_0 = true
		end

		return var_46_0 and "map" or "array", var_46_1
	end

	var_16_22(var_16_23)

	function var_16_21.cdata(arg_47_0)
		local var_47_0 = ffi.sizeof(arg_47_0)

		if not var_47_0 then
			error("cannot pack cdata of unknown size")
		elseif var_47_0 < 65536 then
			var_16_19(var_16_12, var_47_0, 16, 216)
		elseif var_47_0 < 4294967296 then
			var_16_19(var_16_12, var_47_0, 32, 217)
		else
			error("overflow")
		end

		var_16_16(var_16_12, arg_47_0, var_47_0)
	end

	local var_16_24 = {
		[203] = "double",
		[216] = "buf16",
		[219] = "raw32",
		[218] = "raw16",
		[196] = "nil",
		[194] = "false",
		[209] = "int16",
		[195] = "true",
		[208] = "int8",
		[211] = "int64",
		[192] = "nil",
		[210] = "int32",
		[206] = "uint32",
		[221] = "array32",
		[207] = "uint64",
		[220] = "array16",
		[204] = "uint8",
		[223] = "map32",
		[205] = "uint16",
		[222] = "map16",
		[202] = "float",
		[217] = "buf32"
	}

	local function var_16_25(arg_48_0)
		if var_16_24[arg_48_0] then
			return var_16_24[arg_48_0]
		elseif arg_48_0 < 192 then
			if arg_48_0 < 128 then
				return "fixnum_pos"
			elseif arg_48_0 < 144 then
				return "fixmap"
			elseif arg_48_0 < 160 then
				return "fixarray"
			else
				return "fixraw"
			end
		elseif arg_48_0 > 223 then
			return "fixnum_neg"
		else
			return "undefined"
		end
	end

	local var_16_26 = {
		int16 = 2,
		int64 = 8,
		int32 = 4,
		float = 4,
		double = 8,
		uint64 = 8,
		uint32 = 4,
		uint16 = 2
	}
	local var_16_27 = {}
	local var_16_28

	if var_16_9 then
		function var_16_28(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
			var_16_10(var_16_6, arg_49_0.data + arg_49_1 + 1, arg_49_3)

			return slot_0_53_0(slot_0_54_0(arg_49_2, var_16_6)[0])
		end
	else
		function var_16_28(arg_50_0, arg_50_1, arg_50_2)
			return slot_0_53_0(slot_0_54_0(arg_50_2, arg_50_0.data + arg_50_1 + 1)[0])
		end
	end

	local function var_16_29(arg_51_0, arg_51_1)
		local var_51_0 = var_16_25(arg_51_0.data[arg_51_1])
		local var_51_1 = var_16_26[var_51_0]
		local var_51_2

		if var_51_0 == "float" or var_51_0 == "double" then
			var_51_2 = var_51_0 .. " *"
		else
			var_51_2 = var_51_0 .. "_t *"
		end

		if arg_51_1 + var_51_1 >= arg_51_0.size then
			return nil, nil
		end

		return arg_51_1 + var_51_1 + 1, var_16_28(arg_51_0, arg_51_1, var_51_2, var_51_1)
	end

	local function var_16_30(arg_52_0, arg_52_1, arg_52_2)
		local var_52_0 = {}
		local var_52_1
		local var_52_2

		for iter_52_0 = 1, arg_52_2 do
			local var_52_3

			arg_52_1, var_52_3 = var_16_27.dynamic(arg_52_0, arg_52_1)

			if not arg_52_1 then
				return nil, var_52_0
			end

			local var_52_4

			arg_52_1, var_52_4 = var_16_27.dynamic(arg_52_0, arg_52_1)

			if not arg_52_1 then
				return nil, var_52_0
			end

			var_52_0[var_52_3] = var_52_4
		end

		return arg_52_1, var_52_0
	end

	local function var_16_31(arg_53_0, arg_53_1, arg_53_2)
		local var_53_0 = {}

		for iter_53_0 = 1, arg_53_2 do
			arg_53_1, var_53_0[iter_53_0] = var_16_27.dynamic(arg_53_0, arg_53_1)

			if not arg_53_1 then
				return nil, var_53_0
			end
		end

		return arg_53_1, var_53_0
	end

	function var_16_27.dynamic(arg_54_0, arg_54_1)
		assert(arg_54_1, "non nil offset is expected")

		if arg_54_1 >= arg_54_0.size then
			return nil, nil
		end

		local var_54_0 = var_16_25(arg_54_0.data[arg_54_1])

		return var_16_27[var_54_0](arg_54_0, arg_54_1)
	end

	function var_16_27.undefined(arg_55_0, arg_55_1)
		error("unimplemented", arg_55_0, arg_55_1)
	end

	var_16_27["nil"] = function(arg_56_0, arg_56_1)
		return arg_56_1 + 1, nil
	end
	var_16_27["false"] = function(arg_57_0, arg_57_1)
		return arg_57_1 + 1, false
	end
	var_16_27["true"] = function(arg_58_0, arg_58_1)
		return arg_58_1 + 1, true
	end

	function var_16_27.fixnum_pos(arg_59_0, arg_59_1)
		return arg_59_1 + 1, arg_59_0.data[arg_59_1]
	end

	function var_16_27.uint8(arg_60_0, arg_60_1)
		if arg_60_1 + 1 >= arg_60_0.size then
			return nil, nil
		end

		return arg_60_1 + 2, arg_60_0.data[arg_60_1 + 1]
	end

	var_16_27.uint16 = var_16_29
	var_16_27.uint32 = var_16_29
	var_16_27.uint64 = var_16_29

	function var_16_27.fixnum_neg(arg_61_0, arg_61_1)
		return arg_61_1 + 1, slot_0_54_0("int8_t *", arg_61_0.data)[arg_61_1]
	end

	function var_16_27.int8(arg_62_0, arg_62_1)
		if arg_62_1 + 1 >= arg_62_0.size then
			return nil, nil
		end

		return arg_62_1 + 2, slot_0_54_0("int8_t *", arg_62_0.data + arg_62_1 + 1)[0]
	end

	var_16_27.int16 = var_16_29
	var_16_27.int32 = var_16_29
	var_16_27.int64 = var_16_29
	var_16_27.float = var_16_29
	var_16_27.double = var_16_29

	function var_16_27.fixraw(arg_63_0, arg_63_1)
		local var_63_0 = var_16_4(arg_63_0.data[arg_63_1], 31)

		if arg_63_1 + var_63_0 >= arg_63_0.size then
			return nil, nil
		end

		return arg_63_1 + var_63_0 + 1, ffi.string(arg_63_0.data + arg_63_1 + 1, var_63_0)
	end

	function var_16_27.buf16(arg_64_0, arg_64_1)
		if arg_64_1 + 2 >= arg_64_0.size then
			return nil, nil
		end

		local var_64_0 = var_16_28(arg_64_0, arg_64_1, "uint16_t *", 2)

		if arg_64_1 + var_64_0 + 2 >= arg_64_0.size then
			return nil, nil
		end

		local var_64_1 = var_16_8(var_64_0)

		slot_0_56_0(var_64_1, arg_64_0.data + arg_64_1 + 3, var_64_0)

		return arg_64_1 + var_64_0 + 3, var_64_1
	end

	function var_16_27.buf32(arg_65_0, arg_65_1)
		if arg_65_1 + 4 >= arg_65_0.size then
			return nil, nil
		end

		local var_65_0 = var_16_28(arg_65_0, arg_65_1, "uint32_t *", 4)

		if arg_65_1 + var_65_0 + 4 >= arg_65_0.size then
			return nil, nil
		end

		local var_65_1 = var_16_8(var_65_0)

		slot_0_56_0(var_65_1, arg_65_0.data + arg_65_1 + 5, var_65_0)

		return arg_65_1 + var_65_0 + 5, var_65_1
	end

	function var_16_27.raw16(arg_66_0, arg_66_1)
		if arg_66_1 + 2 >= arg_66_0.size then
			return nil, nil
		end

		local var_66_0 = var_16_28(arg_66_0, arg_66_1, "uint16_t *", 2)

		if arg_66_1 + var_66_0 + 2 >= arg_66_0.size then
			return nil, nil
		end

		return arg_66_1 + var_66_0 + 3, ffi.string(arg_66_0.data + arg_66_1 + 3, var_66_0)
	end

	function var_16_27.raw32(arg_67_0, arg_67_1)
		if arg_67_1 + 4 >= arg_67_0.size then
			return nil, nil
		end

		local var_67_0 = var_16_28(arg_67_0, arg_67_1, "uint32_t *", 4)

		if arg_67_1 + var_67_0 + 4 >= arg_67_0.size then
			return nil, nil
		end

		return arg_67_1 + var_67_0 + 5, ffi.string(arg_67_0.data + arg_67_1 + 5, var_67_0)
	end

	function var_16_27.fixarray(arg_68_0, arg_68_1)
		local var_68_0 = var_16_4(arg_68_0.data[arg_68_1], 15)

		return var_16_31(arg_68_0, arg_68_1 + 1, var_68_0)
	end

	function var_16_27.array16(arg_69_0, arg_69_1)
		if arg_69_1 + 2 >= arg_69_0.size then
			return nil, nil
		end

		local var_69_0 = var_16_28(arg_69_0, arg_69_1, "uint16_t *", 2)

		return var_16_31(arg_69_0, arg_69_1 + 3, var_69_0)
	end

	function var_16_27.array32(arg_70_0, arg_70_1)
		if arg_70_1 + 4 >= arg_70_0.size then
			return nil, nil
		end

		local var_70_0 = var_16_28(arg_70_0, arg_70_1, "uint32_t *", 4)

		return var_16_31(arg_70_0, arg_70_1 + 5, var_70_0)
	end

	function var_16_27.fixmap(arg_71_0, arg_71_1)
		local var_71_0 = var_16_4(arg_71_0.data[arg_71_1], 15)

		return var_16_30(arg_71_0, arg_71_1 + 1, var_71_0)
	end

	function var_16_27.map16(arg_72_0, arg_72_1)
		if arg_72_1 + 2 >= arg_72_0.size then
			return nil, nil
		end

		local var_72_0 = var_16_28(arg_72_0, arg_72_1, "uint16_t *", 2)

		return var_16_30(arg_72_0, arg_72_1 + 3, var_72_0)
	end

	function var_16_27.map32(arg_73_0, arg_73_1)
		if arg_73_1 + 4 >= arg_73_0.size then
			return nil, nil
		end

		local var_73_0 = var_16_28(arg_73_0, arg_73_1, "uint32_t *", 4)

		return var_16_30(arg_73_0, arg_73_1 + 5, var_73_0)
	end

	local function var_16_32(arg_74_0)
		var_16_13(var_16_12)
		var_16_21.dynamic(arg_74_0)

		local var_74_0 = ffi.string(var_16_12.data, var_16_12.size)

		var_16_14(var_16_12)

		return var_74_0
	end

	local function var_16_33(arg_75_0, arg_75_1)
		if arg_75_1 == nil then
			arg_75_1 = 0
		end

		if slot_0_51_0(arg_75_0) ~= "string" then
			return false, "invalid argument"
		end

		var_16_13(var_16_12)
		var_16_16(var_16_12, arg_75_0, #arg_75_0)

		local var_75_0
		local var_75_1

		arg_75_1, var_75_1 = var_16_27.dynamic(var_16_12, arg_75_1)

		var_16_14(var_16_12)

		return var_75_1
	end

	return {
		pack = var_16_32,
		unpack = var_16_33
	}
end)()
slot_0_86_0 = (function()
	slot_76_0_0 = bit.band
	slot_76_1_0 = bit.bor
	slot_76_2_0 = bit.bxor
	slot_76_3_0 = bit.lshift
	slot_76_4_0 = bit.rshift
	slot_76_5_0 = bit.rol
	slot_76_6_0 = bit.ror
	slot_76_7_0 = bit.tobit
	slot_76_8_0 = bit.tohex
	slot_76_9_1 = nil
	slot_76_10_1 = {}
	slot_76_11_0 = {}
	slot_76_12_0 = {}
	slot_76_13_0 = {}
	slot_76_14_0 = {
		[224] = {},
		[256] = slot_76_13_0
	}
	slot_76_15_0 = {
		[384] = {},
		[512] = slot_76_12_0
	}
	slot_76_16_0 = {
		[384] = {},
		[512] = slot_76_13_0
	}
	slot_76_17_0 = 4294967296
	slot_76_18_1 = 0
	slot_76_19_0 = ffi.new("int32_t[?]", 64)

	function slot_76_9_0(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
		slot_77_4_0 = slot_76_19_0
		slot_77_5_0 = slot_76_11_0

		for iter_77_0 = arg_77_2, arg_77_2 + arg_77_3 - 1, 64 do
			for iter_77_1 = 0, 15 do
				iter_77_0 = iter_77_0 + 4
				slot_77_14_2, slot_77_15_2, slot_77_16_1, slot_77_17_1 = slot_0_43_0(arg_77_1, iter_77_0 - 3, iter_77_0)
				slot_77_4_0[iter_77_1] = slot_76_1_0(slot_76_3_0(slot_77_14_2, 24), slot_76_3_0(slot_77_15_2, 16), slot_76_3_0(slot_77_16_1, 8), slot_77_17_1)
			end

			for iter_77_2 = 16, 63 do
				slot_77_14_1 = slot_77_4_0[iter_77_2 - 15]
				slot_77_15_1 = slot_77_4_0[iter_77_2 - 2]
				slot_77_4_0[iter_77_2] = slot_76_7_0(slot_76_2_0(slot_76_6_0(slot_77_14_1, 7), slot_76_5_0(slot_77_14_1, 14), slot_76_4_0(slot_77_14_1, 3)) + slot_76_2_0(slot_76_5_0(slot_77_15_1, 15), slot_76_5_0(slot_77_15_1, 13), slot_76_4_0(slot_77_15_1, 10)) + slot_77_4_0[iter_77_2 - 7] + slot_77_4_0[iter_77_2 - 16])
			end

			slot_77_10_0 = arg_77_0[1]
			slot_77_11_0 = arg_77_0[2]
			slot_77_12_0 = arg_77_0[3]
			slot_77_13_0 = arg_77_0[4]
			slot_77_14_0 = arg_77_0[5]
			slot_77_15_0 = arg_77_0[6]
			slot_77_16_0 = arg_77_0[7]
			slot_77_17_0 = arg_77_0[8]

			for iter_77_3 = 0, 63, 8 do
				slot_77_22_7 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3] + slot_77_5_0[iter_77_3 + 1] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_7)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_7)
				slot_77_22_6 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3 + 1] + slot_77_5_0[iter_77_3 + 2] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_6)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_6)
				slot_77_22_5 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3 + 2] + slot_77_5_0[iter_77_3 + 3] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_5)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_5)
				slot_77_22_4 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3 + 3] + slot_77_5_0[iter_77_3 + 4] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_4)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_4)
				slot_77_22_3 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3 + 4] + slot_77_5_0[iter_77_3 + 5] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_3)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_3)
				slot_77_22_2 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3 + 5] + slot_77_5_0[iter_77_3 + 6] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_2)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_2)
				slot_77_22_1 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3 + 6] + slot_77_5_0[iter_77_3 + 7] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_1)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_1)
				slot_77_22_0 = slot_76_7_0(slot_76_2_0(slot_77_16_0, slot_76_0_0(slot_77_14_0, slot_76_2_0(slot_77_15_0, slot_77_16_0))) + slot_76_2_0(slot_76_6_0(slot_77_14_0, 6), slot_76_6_0(slot_77_14_0, 11), slot_76_5_0(slot_77_14_0, 7)) + (slot_77_4_0[iter_77_3 + 7] + slot_77_5_0[iter_77_3 + 8] + slot_77_17_0))
				slot_77_17_0, slot_77_16_0, slot_77_15_0, slot_77_14_0 = slot_77_16_0, slot_77_15_0, slot_77_14_0, slot_76_7_0(slot_77_13_0 + slot_77_22_0)
				slot_77_13_0, slot_77_12_0, slot_77_11_0, slot_77_10_0 = slot_77_12_0, slot_77_11_0, slot_77_10_0, slot_76_7_0(slot_76_2_0(slot_76_0_0(slot_77_10_0, slot_76_2_0(slot_77_11_0, slot_77_12_0)), slot_76_0_0(slot_77_11_0, slot_77_12_0)) + slot_76_2_0(slot_76_6_0(slot_77_10_0, 2), slot_76_6_0(slot_77_10_0, 13), slot_76_5_0(slot_77_10_0, 10)) + slot_77_22_0)
			end

			arg_77_0[1], arg_77_0[2], arg_77_0[3], arg_77_0[4] = slot_76_7_0(slot_77_10_0 + arg_77_0[1]), slot_76_7_0(slot_77_11_0 + arg_77_0[2]), slot_76_7_0(slot_77_12_0 + arg_77_0[3]), slot_76_7_0(slot_77_13_0 + arg_77_0[4])
			arg_77_0[5], arg_77_0[6], arg_77_0[7], arg_77_0[8] = slot_76_7_0(slot_77_14_0 + arg_77_0[5]), slot_76_7_0(slot_77_15_0 + arg_77_0[6]), slot_76_7_0(slot_77_16_0 + arg_77_0[7]), slot_76_7_0(slot_77_17_0 + arg_77_0[8])
		end
	end

	slot_76_20_0 = ffi.typeof("int64_t")
	slot_76_18_0 = slot_76_20_0(4294967296)
	slot_76_21_0 = 2779096485 * slot_76_20_0(4294967297)

	function slot_76_22_0(arg_78_0, arg_78_1)
		return slot_76_2_0(arg_78_0, arg_78_1 or slot_76_21_0)
	end

	function slot_76_23_0(arg_79_0, arg_79_1, arg_79_2, arg_79_3)
		local var_79_0 = {}
		local var_79_1 = 0
		local var_79_2 = 0
		local var_79_3 = 1

		for iter_79_0 = 1, arg_79_3 do
			for iter_79_1 = slot_0_28_0(1, iter_79_0 + 1 - #arg_79_1), slot_0_27_0(iter_79_0, #arg_79_0) do
				var_79_1 = var_79_1 + arg_79_2 * arg_79_0[iter_79_1] * arg_79_1[iter_79_0 + 1 - iter_79_1]
			end

			local var_79_4 = var_79_1 % 16777216

			var_79_0[iter_79_0] = slot_0_29_0(var_79_4)
			var_79_1 = (var_79_1 - var_79_4) / 16777216
			var_79_2 = var_79_2 + var_79_4 * var_79_3
			var_79_3 = var_79_3 * 16777216
		end

		return var_79_0, var_79_2
	end

	slot_76_24_0 = 0
	slot_76_25_0 = {
		4,
		1,
		2,
		-2,
		2
	}
	slot_76_26_1 = 4
	slot_76_27_1 = {
		1
	}
	slot_76_28_1 = slot_76_13_0
	slot_76_29_0 = slot_76_12_0

	repeat
		slot_76_26_1 = slot_76_26_1 + slot_76_25_0[slot_76_26_1 % 6]
		slot_76_30_0 = 1

		repeat
			slot_76_30_0 = slot_76_30_0 + slot_76_25_0[slot_76_30_0 % 6]

			if slot_76_26_1 < slot_76_30_0 * slot_76_30_0 then
				slot_76_31_1 = slot_76_26_1^0.3333333333333333
				slot_76_32_4 = slot_76_31_1 * 1099511627776
				slot_76_32_3 = slot_76_23_0({
					slot_76_32_4 - slot_76_32_4 % 1
				}, slot_76_27_1, 1, 2)
				slot_76_33_1, slot_76_34_1 = slot_76_23_0(slot_76_32_3, slot_76_23_0(slot_76_32_3, slot_76_32_3, 1, 4), -1, 4)
				slot_76_35_0 = slot_76_32_3[2] % 65536 * 65536 + slot_0_29_0(slot_76_32_3[1] / 256)
				slot_76_36_0 = slot_76_32_3[1] % 256 * 16777216 + slot_0_29_0(slot_76_34_1 * 4.625929269271485e-18 * slot_76_31_1 / slot_76_26_1)

				if slot_76_24_0 < 16 then
					slot_76_31_0 = slot_76_26_1^0.5
					slot_76_32_2 = slot_76_31_0 * 1099511627776
					slot_76_32_1 = slot_76_23_0({
						slot_76_32_2 - slot_76_32_2 % 1
					}, slot_76_27_1, 1, 2)
					slot_76_33_0, slot_76_34_0 = slot_76_23_0(slot_76_32_1, slot_76_32_1, -1, 2)
					slot_76_37_0 = slot_76_32_1[2] % 65536 * 65536 + slot_0_29_0(slot_76_32_1[1] / 256)
					slot_76_38_0 = slot_76_32_1[1] % 256 * 16777216 + slot_0_29_0(slot_76_34_0 * 7.62939453125e-06 / slot_76_31_0)
					slot_76_39_0 = slot_76_24_0 % 8 + 1
					slot_76_14_0[224][slot_76_39_0] = slot_76_38_0
					slot_76_28_1[slot_76_39_0], slot_76_29_0[slot_76_39_0] = slot_76_37_0, slot_76_38_0 + slot_76_37_0 * slot_76_18_0

					if slot_76_39_0 > 7 then
						slot_76_28_1, slot_76_29_0 = slot_76_16_0[384], slot_76_15_0[384]
					end
				end

				slot_76_24_0 = slot_76_24_0 + 1
				slot_76_11_0[slot_76_24_0], slot_76_10_1[slot_76_24_0] = slot_76_35_0, slot_76_36_0 % slot_76_17_0 + slot_76_35_0 * slot_76_18_0

				break
			end
		until slot_76_26_1 % slot_76_30_0 == 0
	until slot_76_24_0 > 79

	for iter_76_0 = 224, 256, 32 do
		slot_76_27_0 = {}
		slot_76_28_0 = nil

		for iter_76_1 = 1, 8 do
			slot_76_27_0[iter_76_1] = slot_76_22_0(slot_76_12_0[iter_76_1])
		end

		slot_76_15_0[iter_76_0] = slot_76_27_0
		slot_76_16_0[iter_76_0] = slot_76_28_0
	end

	slot_76_11_0 = ffi.new("uint32_t[?]", #slot_76_11_0 + 1, 0, unpack(slot_76_11_0))
	slot_76_10_0 = ffi.new("int64_t[?]", #slot_76_10_1 + 1, 0, unpack(slot_76_10_1))

	return function(arg_80_0)
		local var_80_0 = {
			unpack(slot_76_14_0[256])
		}
		local var_80_1 = 0
		local var_80_2 = ""

		local function var_80_3(arg_81_0)
			if arg_81_0 then
				if var_80_2 then
					var_80_1 = var_80_1 + #arg_81_0

					local var_81_0 = 0

					if var_80_2 ~= "" and #var_80_2 + #arg_81_0 >= 64 then
						var_81_0 = 64 - #var_80_2

						slot_76_9_0(var_80_0, var_80_2 .. slot_0_38_0(arg_81_0, 1, var_81_0), 0, 64)

						var_80_2 = ""
					end

					local var_81_1 = #arg_81_0 - var_81_0
					local var_81_2 = var_81_1 % 64

					slot_76_9_0(var_80_0, arg_81_0, var_81_0, var_81_1 - var_81_2)

					var_80_2 = var_80_2 .. slot_0_38_0(arg_81_0, #arg_81_0 + 1 - var_81_2)

					return var_80_3
				else
					error("Adding more chunks is not allowed after receiving the result", 2)
				end
			else
				if var_80_2 then
					local var_81_3 = {
						var_80_2,
						"\x80",
						slot_0_44_0("\x00", (-9 - var_80_1) % 64 + 1)
					}

					var_80_2 = nil
					var_80_1 = var_80_1 * 1.1102230246251565e-16

					for iter_81_0 = 4, 10 do
						var_80_1 = var_80_1 % 1 * 256
						var_81_3[iter_81_0] = slot_0_41_0(slot_0_29_0(var_80_1))
					end

					local var_81_4 = slot_0_47_0(var_81_3)

					slot_76_9_0(var_80_0, var_81_4, 0, #var_81_4)

					local var_81_5 = 8

					for iter_81_1 = 1, var_81_5 do
						var_80_0[iter_81_1] = slot_76_8_0(var_80_0[iter_81_1])
					end

					var_80_0 = slot_0_47_0(var_80_0, "", 1, var_81_5)
				end

				return var_80_0
			end
		end

		if arg_80_0 then
			return var_80_3(arg_80_0)()
		else
			return var_80_3
		end
	end
end)()
slot_0_89_1 = slot_0_81_0("filesystem_stdio.dll", "VFileSystem017")
slot_0_90_2 = slot_0_54_0("void***", slot_0_89_1)[0]
slot_0_91_1 = slot_0_54_0("void*(__thiscall*)(void*, const char*, const char*, int, const char*)", slot_0_90_2[78])
slot_0_92_2 = slot_0_54_0("void(__thiscall*)(void*, void*)", slot_0_90_2[14])
slot_0_93_2 = slot_0_54_0("void(__thiscall*)(void*, const char*, uint64_t, void*)", slot_0_90_2[12])
slot_0_94_2 = slot_0_54_0("void(__thiscall*)(void*, void*, int, int, void*)", slot_0_90_2[79])
slot_0_95_2 = slot_0_54_0("uint64_t(__thiscall*)(void*, void*)", slot_0_90_2[18])

function slot_0_87_0(arg_82_0)
	local var_82_0 = slot_0_91_1(slot_0_89_1, arg_82_0, "rb", 0, "game")

	if var_82_0 == nil then
		return
	end

	local var_82_1 = slot_0_95_2(slot_0_89_1, var_82_0)

	if var_82_1 == 0 then
		return slot_0_92_2(slot_0_89_1, var_82_0)
	end

	local var_82_2 = slot_0_55_0("char[?]", var_82_1 + 1)

	slot_0_94_2(slot_0_89_1, var_82_2, var_82_1, var_82_1, var_82_0)
	slot_0_92_2(slot_0_89_1, var_82_0)

	return ffi.string(var_82_2, var_82_1)
end

function slot_0_88_0(arg_83_0, arg_83_1)
	local var_83_0 = slot_0_91_1(slot_0_89_1, arg_83_0, "wb", 0, "game")

	if var_83_0 == nil then
		print("failed to open file: " .. arg_83_0)

		return
	end

	local var_83_1 = #arg_83_1

	slot_0_93_2(slot_0_89_1, arg_83_1, var_83_1, var_83_0)
	slot_0_92_2(slot_0_89_1, var_83_0)
end

function slot_0_89_0(arg_84_0, arg_84_1)
	return slot_0_86_0(arg_84_1 .. arg_84_0)
end

slot_0_90_1 = nil

function slot_0_90_0(arg_85_0)
	if slot_0_51_0(arg_85_0) ~= "table" then
		return arg_85_0
	end

	local var_85_0 = {}

	for iter_85_0, iter_85_1 in next, arg_85_0 do
		var_85_0[iter_85_0] = slot_0_90_0(iter_85_1)
	end

	return var_85_0
end

slot_0_91_0 = {
	["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"
}
slot_0_92_1 = nil
slot_0_93_1 = nil
slot_0_94_1 = nil
slot_0_95_1 = nil
slot_0_96_2 = slot_0_0_0 .. "/trail.vpcf"
slot_0_97_2 = slot_0_74_0("client.dll", "4C 8B 15 ? ? ? ? 83 FB FF")

function slot_0_98_2()
	if slot_0_97_2 == nil then
		return
	end

	local var_86_0 = slot_0_83_0(slot_0_97_2, 3)

	if var_86_0 == nil then
		return
	end

	return slot_0_54_0("void**", var_86_0)[0]
end

slot_0_99_2 = slot_0_98_2()

function slot_0_95_0()
	slot_0_99_2 = slot_0_98_2()
end

slot_0_100_2 = false
slot_0_101_2 = nil
slot_0_102_2 = nil
slot_0_103_2 = nil
slot_0_104_2 = nil
slot_0_105_2 = nil
slot_0_106_3 = nil
slot_0_107_4 = nil
slot_0_108_3 = nil

;(function()
	if slot_0_99_2 == nil then
		return slot_0_75_0("Failed to find 'particle_manager'.")
	end

	local var_88_0 = slot_0_54_0("void***", slot_0_99_2)[0]

	if var_88_0 == nil then
		return slot_0_75_0("Failed to find 'particle_manager_address'.")
	end

	slot_0_101_2 = slot_0_74_0("client.dll", "4C 8B DC 53 48 81 EC 90 00 00 00 F2")

	if slot_0_101_2 == nil then
		return slot_0_75_0("Failed to find 'particle_manager_create_particle'.")
	end

	slot_0_101_2 = slot_0_54_0("void(__fastcall*)(void*, unsigned int*, const char*, int, __int64, __int64, __int64, int)", slot_0_101_2)
	slot_0_102_2 = slot_0_74_0("client.dll", "48 89 5C 24 08 48 89 74 24 10 57 48 83 EC 50 F3 0F 10 1D ? ? ? ? 41 8B F8 8B DA 4C")

	if slot_0_102_2 == nil then
		return slot_0_75_0("Failed to find 'particle_manager_set_control_point'.")
	end

	slot_0_102_2 = slot_0_54_0("void(__fastcall*)(void*, unsigned int, int, void*, int)", slot_0_102_2)
	slot_0_103_2 = slot_0_74_0("client.dll", "40 56 48 83 EC 20 41 8B F0")

	if slot_0_103_2 == nil then
		return slot_0_75_0("Failed to find 'particle_manager_init_snapshot'.")
	end

	slot_0_103_2 = slot_0_54_0("void(*)(void*, int, unsigned int, void*)", slot_0_103_2)
	slot_0_104_2 = slot_0_74_0("client.dll", "83 FA FF 0F 84 D5 01")

	if slot_0_104_2 == nil then
		return slot_0_75_0("Failed to find 'particle_manager_release_particle'.")
	end

	slot_0_104_2 = slot_0_54_0("void(__fastcall*)(void*, int, bool, bool)", slot_0_104_2)
	slot_0_105_2 = slot_0_54_0("void(__fastcall*)(void*, int)", var_88_0[3])

	if slot_0_105_2 == nil then
		return slot_0_75_0("Failed to find 'particle_manager_release_particle_index'.")
	end

	slot_0_106_3 = slot_0_81_0("particles.dll", "ParticleSystemMgr003")

	if slot_0_106_3 == nil then
		return slot_0_75_0("Failed to find 'particle_system_manager'.")
	end

	slot_0_106_3 = slot_0_54_0("void*", slot_0_106_3)

	local var_88_1 = slot_0_54_0("void***", slot_0_106_3)[0]

	if var_88_1 == nil then
		return slot_0_75_0("Failed to find 'particle_system_manager_vtable'.")
	end

	slot_0_107_4 = slot_0_54_0("void(__fastcall*)(void*, void*, uintptr_t*)", var_88_1[41])

	if slot_0_107_4 == nil then
		return slot_0_75_0("Failed to find 'particle_system_manager_create_snapshot'.")
	end

	slot_0_108_3 = slot_0_54_0("void(__fastcall*)(void*, void*, int, void*)", var_88_1[42])

	if slot_0_108_3 == nil then
		return slot_0_75_0("Failed to find 'particle_system_manager_draw_snapshot'.")
	end

	slot_0_100_2 = true
end)()

slot_0_109_3 = ffi.typeof("        struct {\n            float time;\n            float width;\n            float alpha;\n        }\n    ")
slot_0_110_3 = ffi.typeof("        struct {\n            $* positions;\n            char pad[0x148];\n        }\n    ", slot_0_58_0)
slot_0_111_4 = ffi.typeof("        struct {\n            float r, g, b;\n        }\n    ")
slot_0_112_5 = slot_0_55_0(slot_0_111_4)
slot_0_113_5 = ffi.typeof("$[?]", slot_0_58_0)
slot_0_114_8 = slot_0_55_0(slot_0_109_3)
slot_0_114_8.time = 2
slot_0_114_8.width = 3
slot_0_114_8.alpha = 1

function slot_0_92_0(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	if not slot_0_100_2 then
		return
	end

	local var_89_0 = slot_0_55_0("unsigned int[1]")

	slot_0_101_2(slot_0_99_2, var_89_0, slot_0_96_2, 2, 0, 0, 0, 0)

	local var_89_1 = var_89_0[0]

	slot_0_112_5.r = arg_89_1
	slot_0_112_5.g = arg_89_2
	slot_0_112_5.b = arg_89_3

	slot_0_102_2(slot_0_99_2, var_89_1, 16, slot_0_112_5, 0)
	slot_0_102_2(slot_0_99_2, var_89_1, 3, slot_0_114_8, 0)

	local var_89_2 = slot_0_55_0(slot_0_110_3)
	local var_89_3 = #arg_89_0
	local var_89_4 = slot_0_55_0(slot_0_113_5, var_89_3 * 2)
	local var_89_5 = 0

	for iter_89_0 = 1, var_89_3 do
		local var_89_6 = arg_89_0[iter_89_0]
		local var_89_7 = slot_0_58_0(var_89_6.x, var_89_6.y, var_89_6.z)

		var_89_4[var_89_5] = var_89_7
		var_89_4[var_89_5 + 1] = var_89_7
		var_89_5 = var_89_5 + 2
	end

	var_89_2.positions = var_89_4

	local var_89_8 = slot_0_55_0("uint64_t[1]")
	local var_89_9 = slot_0_55_0("void*[1]")

	slot_0_107_4(slot_0_106_3, var_89_9, var_89_8)
	slot_0_103_2(slot_0_99_2, var_89_1, 0, var_89_9[0])
	slot_0_108_3(slot_0_106_3, var_89_9[0], var_89_5, var_89_2)

	return var_89_1
end

function slot_0_93_0(arg_90_0, arg_90_1, arg_90_2, arg_90_3, arg_90_4)
	if not slot_0_100_2 then
		return
	end

	local var_90_0 = {}
	local var_90_1 = arg_90_0.x
	local var_90_2 = arg_90_0.y
	local var_90_3 = arg_90_0.z

	for iter_90_0 = 0, 420, 3 do
		local var_90_4 = slot_0_35_0(iter_90_0)

		var_90_0[#var_90_0 + 1] = slot_0_8_0(arg_90_1 * slot_0_31_0(var_90_4) + var_90_1, arg_90_1 * slot_0_32_0(var_90_4) + var_90_2, var_90_3)
	end

	return slot_0_92_0(var_90_0, arg_90_2, arg_90_3, arg_90_4)
end

function slot_0_94_0(arg_91_0)
	slot_0_104_2(slot_0_99_2, arg_91_0, true, true)
	slot_0_105_2(slot_0_99_2, arg_91_0)
end

slot_0_96_1 = nil
slot_0_97_1 = nil
slot_0_96_0 = {}

function slot_0_97_0()
	for iter_92_0, iter_92_1 in slot_0_50_0(slot_0_96_0) do
		slot_0_94_0(iter_92_0)

		slot_0_96_0[iter_92_0] = nil
		iter_92_1.particle_indexes = nil
	end
end

slot_0_76_0(slot_0_97_0)

slot_0_98_1 = nil
slot_0_99_1 = nil
slot_0_100_1 = nil
slot_0_101_1 = nil
slot_0_102_1 = nil
slot_0_103_1 = nil

function slot_0_98_0(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	arg_93_0 = arg_93_0 / arg_93_3 * 2

	if arg_93_0 < 1 then
		return arg_93_2 * 0.5 * slot_0_30_0(arg_93_0, 2) + arg_93_1
	end

	return -arg_93_2 * 0.5 * ((arg_93_0 - 1) * (arg_93_0 - 3) - 1) + arg_93_1
end

function slot_0_99_0(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	arg_94_0 = arg_94_0 / arg_94_3 - 1

	return -arg_94_2 * (slot_0_30_0(arg_94_0, 4) - 1) + arg_94_1
end

function slot_0_100_0(arg_95_0, arg_95_1, arg_95_2, arg_95_3)
	return -arg_95_2 * 0.5 * (slot_0_31_0(slot_0_36_0 * arg_95_0 / arg_95_3) - 1) + arg_95_1
end

function slot_0_101_0(arg_96_0, arg_96_1, arg_96_2, arg_96_3)
	arg_96_0 = arg_96_0 / arg_96_3

	return arg_96_2 * slot_0_30_0(arg_96_0, 3) + arg_96_1
end

function slot_0_102_0(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	return arg_97_2 * slot_0_32_0(arg_97_0 / arg_97_3 * (slot_0_36_0 * 0.5)) + arg_97_1
end

function slot_0_103_0(arg_98_0, arg_98_1, arg_98_2, arg_98_3)
	if arg_98_0 == 0 then
		return arg_98_1
	end

	return arg_98_2 * slot_0_30_0(2, 10 * (arg_98_0 / arg_98_3 - 1)) + arg_98_1 - arg_98_2 * 0.001
end

slot_0_104_1 = nil
slot_0_105_1 = nil
slot_0_106_2 = "fatality/grenade_helper"
slot_0_107_3 = "fatality/grenade_helper_cloud"

function slot_0_104_0(arg_99_0)
	local var_99_0 = arg_99_0 and slot_0_107_3 or slot_0_106_2
	local var_99_1 = slot_0_87_0(var_99_0)
	local var_99_2 = {}

	if var_99_1 ~= nil then
		var_99_2 = slot_0_85_0.unpack(var_99_1)
	end

	if var_99_2.sources == nil then
		if arg_99_0 then
			var_99_2.sources = {}
		else
			var_99_2.sources = {
				{
					name = "Default: Grenades",
					locations = {}
				},
				{
					name = "Default: Movements",
					locations = {}
				},
				{
					name = "Default: Wallbangs",
					locations = {}
				}
			}
		end
	end

	return var_99_2
end

function slot_0_105_0(arg_100_0, arg_100_1)
	if slot_0_51_0(arg_100_0) ~= "table" then
		return
	end

	local var_100_0 = arg_100_1 and slot_0_107_3 or slot_0_106_2

	arg_100_0 = slot_0_85_0.pack(arg_100_0)

	slot_0_88_0(var_100_0, arg_100_0)
end

slot_0_106_1 = nil
slot_0_106_0 = {}
slot_0_107_2 = gui.GetMainWindow()
slot_0_108_2 = gui.ControlID
slot_0_109_2 = gui.Group

function slot_0_110_2(arg_101_0)
	local var_101_0 = 0

	while arg_101_0 > 1 do
		arg_101_0 = bit.rshift(arg_101_0, 1)
		var_101_0 = var_101_0 + 1
	end

	return var_101_0 + 1
end

slot_0_111_3 = nil
slot_0_111_2 = {}
slot_0_112_4 = 0

events.presentQueue:Add(function()
	for iter_102_0, iter_102_1 in slot_0_50_0(slot_0_111_2) do
		local var_102_0 = iter_102_1.previous_value
		local var_102_1 = iter_102_0:get()

		if var_102_0 ~= var_102_1 then
			iter_102_1.previous_value = var_102_1

			local var_102_2 = iter_102_1.callbacks

			for iter_102_2, iter_102_3 in slot_0_49_0(var_102_2) do
				iter_102_3()
			end
		end
	end
end)

slot_0_112_3 = nil
slot_0_113_4 = nil
slot_0_114_7 = nil
slot_0_114_6 = {
	__newindex = function(arg_103_0, arg_103_1, arg_103_2)
		arg_103_0.item[arg_103_1] = arg_103_2
	end
}
slot_0_114_6.__index = slot_0_114_6

function slot_0_114_6.group(arg_104_0)
	local var_104_0 = gui.Settings(arg_104_0.name .. "group")

	arg_104_0.control:Add(var_104_0)

	return setmetatable({
		is_settings = true,
		group = var_104_0
	}, slot_0_112_3)
end

function slot_0_114_6.get(arg_105_0, arg_105_1)
	local var_105_0 = arg_105_0.item

	if arg_105_0.type == 22 then
		return var_105_0.value
	end

	if var_105_0.GetValue == nil then
		return
	end

	local var_105_1 = var_105_0:GetValue()

	if var_105_1 == nil then
		return
	end

	local var_105_2 = var_105_1:Get()
	local var_105_3 = arg_105_0.type

	if var_105_3 == 5 then
		if arg_105_1 ~= nil then
			arg_105_1 = arg_105_1 - 1

			return var_105_2:Get(arg_105_1)
		end

		local var_105_4 = var_105_2:GetRaw()

		if not arg_105_0.allow_multiple then
			return slot_0_110_2(var_105_4)
		end

		return var_105_4
	end

	if var_105_3 == 12 then
		if arg_105_1 ~= nil then
			arg_105_1 = arg_105_1 - 1

			return var_105_2:Get(arg_105_1)
		end

		return var_105_2:GetRaw()
	end

	return var_105_2
end

function slot_0_114_6.get_direct(arg_106_0)
	local var_106_0 = arg_106_0.item

	if var_106_0.GetValue == nil then
		return
	end

	local var_106_1 = var_106_0:GetValue()

	if var_106_1 == nil then
		return
	end

	local var_106_2 = arg_106_0.type
	local var_106_3 = var_106_1:GetDirect()

	if var_106_2 == 5 then
		local var_106_4 = var_106_3:GetRaw()

		if not arg_106_0.allow_multiple then
			return slot_0_110_2(var_106_4)
		end

		return var_106_4
	end

	return var_106_3
end

function slot_0_114_6.get_hotkey_state(arg_107_0)
	return arg_107_0.item:GetHotkeyState()
end

function slot_0_114_6.set(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_0.item
	local var_108_1 = arg_108_0.type

	if var_108_1 == 22 then
		return var_108_0:SetValue(arg_108_1)
	end

	if var_108_0.GetValue == nil then
		return
	end

	local var_108_2 = var_108_0:GetValue()

	if var_108_2 == nil then
		return
	end

	if var_108_1 == 5 then
		local var_108_3 = var_108_2:Get()

		if arg_108_0.allow_multiple then
			var_108_3:SetRaw(arg_108_1)
		else
			arg_108_1 = bit.lshift(1, arg_108_1 - 1)

			var_108_3:SetRaw(arg_108_1)
		end

		var_108_2:Set(var_108_3)
	elseif var_108_1 == 12 then
		local var_108_4 = var_108_2:Get()

		var_108_4:SetRaw(arg_108_1)
		var_108_2:Set(var_108_4)
	else
		var_108_2:Set(arg_108_1)
	end

	local var_108_5 = arg_108_0.control

	if var_108_5 ~= nil then
		slot_0_82_0(0.01, var_108_5.Reset, var_108_5)
	end

	local var_108_6 = arg_108_0.callbacks

	for iter_108_0, iter_108_1 in slot_0_49_0(var_108_6) do
		slot_0_82_0(0.1, iter_108_1)
	end
end

function slot_0_114_6.update(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_0.items

	if var_109_0 == nil then
		return
	end

	local var_109_1 = arg_109_0.control

	if var_109_1 == nil then
		return
	end

	local var_109_2 = arg_109_0.name
	local var_109_3 = arg_109_0.item
	local var_109_4 = arg_109_0.type
	local var_109_5
	local var_109_6 = false

	if var_109_4 == 12 or var_109_4 == 5 then
		local var_109_7 = var_109_3.size

		var_109_5 = slot_0_6_0(var_109_7.x, var_109_7.y)
		var_109_6 = var_109_3.unlimitedMode or false
	end

	for iter_109_0 = #var_109_0, 1, -1 do
		var_109_3:Remove(var_109_0[iter_109_0])

		var_109_0[iter_109_0] = nil
	end

	var_109_1:Remove(var_109_3)

	local var_109_8

	if var_109_4 == 5 then
		var_109_8 = gui.ComboBox(slot_0_108_2(var_109_2 .. "_combo_box"))
		var_109_8.allowMultiple = arg_109_0.allow_multiple
		var_109_8.size.x = var_109_5.x
	end

	if var_109_4 == 12 then
		var_109_8 = gui.List(slot_0_108_2(var_109_2 .. "_list"), var_109_5)
		var_109_8.allowMultiple = arg_109_0.allow_multiple
		var_109_8.unlimitedMode = var_109_6 or false
	end

	if var_109_8 == nil then
		return
	end

	local var_109_9 = {}

	for iter_109_1, iter_109_2 in slot_0_49_0(arg_109_1) do
		local var_109_10 = gui.Selectable(slot_0_108_2(iter_109_2 .. "_selectable:" .. iter_109_1), iter_109_2)

		var_109_9[#var_109_9 + 1] = var_109_10

		var_109_8:Add(var_109_10)
	end

	var_109_1:Add(var_109_8)

	arg_109_0.item = var_109_8
	arg_109_0.items = var_109_9

	local var_109_11 = arg_109_0.callbacks

	for iter_109_3, iter_109_4 in slot_0_49_0(var_109_11) do
		var_109_8:AddCallback(iter_109_4)
	end
end

function slot_0_114_6.set_callback(arg_110_0, arg_110_1, arg_110_2)
	local function var_110_0()
		arg_110_1(arg_110_0)
	end

	if arg_110_0.type == 22 then
		local var_110_1 = slot_0_111_2[arg_110_0]

		if var_110_1 == nil then
			var_110_1 = {
				callbacks = {}
			}
			slot_0_111_2[arg_110_0] = var_110_1
		end

		local var_110_2 = var_110_1.callbacks

		var_110_2[#var_110_2 + 1] = var_110_0

		return
	end

	if arg_110_2 then
		var_110_0()
	end

	local var_110_3 = arg_110_0.callbacks

	var_110_3[#var_110_3 + 1] = var_110_0

	arg_110_0.item:AddCallback(var_110_0)
end

function slot_0_114_6.disable_hotkeys(arg_112_0)
	local var_112_0 = arg_112_0.item

	if var_112_0.GetValue == nil then
		return
	end

	local var_112_1 = var_112_0:GetValue()

	if var_112_1 == nil then
		return
	end

	var_112_1:DisableHotkeys()
end

function slot_0_114_6.visibility(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_0.control

	if var_113_0 == nil then
		return
	end

	var_113_0:SetVisible(arg_113_1)
	arg_113_0.__group:__update_size()
end

function slot_0_114_6.reset(arg_114_0)
	local var_114_0 = arg_114_0.type

	if var_114_0 == 2 then
		return arg_114_0:set(false)
	end

	if var_114_0 == 5 then
		return arg_114_0:set(1)
	end

	if var_114_0 == 12 then
		return arg_114_0:set(0)
	end

	if var_114_0 == 22 then
		return arg_114_0:set("")
	end

	if var_114_0 == 17 then
		return arg_114_0:set(arg_114_0.min)
	end
end

function slot_0_114_6.input(arg_115_0, arg_115_1)
	local var_115_0 = gui.TextInput(slot_0_108_2(arg_115_1))

	arg_115_0.control:Add(var_115_0)

	return slot_0_113_4(arg_115_0.__group, arg_115_1, var_115_0, var_115_0)
end

function slot_0_114_6.button(arg_116_0, arg_116_1)
	local var_116_0 = gui.Button(slot_0_108_2(arg_116_1), arg_116_1)

	arg_116_0.control:Add(var_116_0)

	return slot_0_113_4(arg_116_0.__group, arg_116_1, var_116_0, var_116_0)
end

function slot_0_114_6.color(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = gui.ColorPicker(slot_0_108_2(arg_117_1))
	local var_117_1 = gui.MakeControl(arg_117_1, var_117_0, arg_117_2)

	arg_117_0.control:Add(var_117_0)

	return slot_0_113_4(arg_117_0.__group, arg_117_1, var_117_0, var_117_1)
end

function slot_0_113_4(arg_118_0, arg_118_1, arg_118_2, arg_118_3, arg_118_4, arg_118_5, arg_118_6)
	local var_118_0 = {
		__group = arg_118_0,
		name = arg_118_1,
		item = arg_118_2,
		control = arg_118_3,
		type = arg_118_2.type,
		allow_multiple = arg_118_2.allowMultiple,
		items = arg_118_4,
		callbacks = {}
	}

	return setmetatable(var_118_0, slot_0_114_6)
end

slot_0_114_5 = nil
slot_0_112_3 = {}
slot_0_112_3.__index = slot_0_112_3

function slot_0_112_3.switch(arg_119_0, arg_119_1)
	local var_119_0 = gui.Checkbox(slot_0_108_2(arg_119_1))
	local var_119_1 = gui.MakeControl(arg_119_1, var_119_0)

	arg_119_0.group:Add(var_119_1)

	local var_119_2 = slot_0_113_4(arg_119_0, arg_119_1, var_119_0, var_119_1)

	if arg_119_0.is_settings then
		return var_119_2
	end

	arg_119_0.items[#arg_119_0.items + 1] = var_119_2

	arg_119_0:__update_size()

	return var_119_2
end

function slot_0_112_3.combo(arg_120_0, arg_120_1, arg_120_2)
	local var_120_0 = gui.ComboBox(slot_0_108_2(arg_120_1 .. "_combo_box"))

	var_120_0.allowMultiple = false

	local var_120_1 = {}

	for iter_120_0, iter_120_1 in slot_0_49_0(arg_120_2) do
		local var_120_2 = gui.Selectable(slot_0_108_2(iter_120_1 .. "_selectable:" .. iter_120_0), iter_120_1)

		var_120_1[#var_120_1 + 1] = var_120_2

		var_120_0:Add(var_120_2)
	end

	local var_120_3 = gui.MakeControl(arg_120_1, var_120_0)

	arg_120_0.group:Add(var_120_3)

	local var_120_4 = slot_0_113_4(arg_120_0, arg_120_1, var_120_0, var_120_3, var_120_1)

	if arg_120_0.is_settings then
		return var_120_4
	end

	arg_120_0.items[#arg_120_0.items + 1] = var_120_4

	arg_120_0:__update_size()

	return var_120_4
end

function slot_0_112_3.selectable(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = gui.ComboBox(slot_0_108_2(arg_121_1 .. "_combo_box"))

	var_121_0.allowMultiple = true

	local var_121_1 = {}

	for iter_121_0, iter_121_1 in slot_0_49_0(arg_121_2) do
		local var_121_2 = gui.Selectable(slot_0_108_2(iter_121_1 .. "_selectable:" .. iter_121_0), iter_121_1)

		var_121_1[#var_121_1 + 1] = var_121_2

		var_121_0:Add(var_121_2)
	end

	local var_121_3 = gui.MakeControl(arg_121_1, var_121_0)

	arg_121_0.group:Add(var_121_3)

	local var_121_4 = slot_0_113_4(arg_121_0, arg_121_1, var_121_0, var_121_3, var_121_1)

	if arg_121_0.is_settings then
		return var_121_4
	end

	arg_121_0.items[#arg_121_0.items + 1] = var_121_4

	arg_121_0:__update_size()

	return var_121_4
end

function slot_0_112_3.slider(arg_122_0, arg_122_1, arg_122_2, arg_122_3, arg_122_4, arg_122_5)
	local var_122_0 = gui.Slider(slot_0_108_2(arg_122_1), arg_122_2, arg_122_3, arg_122_4, arg_122_5)
	local var_122_1 = gui.MakeControl(arg_122_1, var_122_0)

	arg_122_0.group:Add(var_122_1)

	local var_122_2 = slot_0_113_4(arg_122_0, arg_122_1, var_122_0, var_122_1, nil, arg_122_2, arg_122_3)

	if arg_122_0.is_settings then
		return var_122_2
	end

	arg_122_0.items[#arg_122_0.items + 1] = var_122_2

	arg_122_0:__update_size()

	return var_122_2
end

function slot_0_112_3.color(arg_123_0, arg_123_1, arg_123_2)
	local var_123_0 = gui.ColorPicker(slot_0_108_2(arg_123_1))
	local var_123_1 = gui.MakeControl(arg_123_1, var_123_0, arg_123_2)

	arg_123_0.group:Add(var_123_1)

	local var_123_2 = slot_0_113_4(arg_123_0, arg_123_1, var_123_0, var_123_1)

	if arg_123_0.is_settings then
		return var_123_2
	end

	arg_123_0.items[#arg_123_0.items + 1] = var_123_2

	arg_123_0:__update_size()

	return var_123_2
end

function slot_0_112_3.multilist(arg_124_0, arg_124_1, arg_124_2, arg_124_3, arg_124_4)
	local var_124_0 = gui.List(slot_0_108_2(arg_124_1 .. "_list"), arg_124_4)

	var_124_0.allowMultiple = true
	var_124_0.unlimitedMode = arg_124_3 or false

	local var_124_1 = {}

	for iter_124_0, iter_124_1 in slot_0_49_0(arg_124_2) do
		local var_124_2 = gui.Selectable(slot_0_108_2(iter_124_1 .. "_selectable:" .. iter_124_0), iter_124_1)

		var_124_1[#var_124_1 + 1] = var_124_2

		var_124_0:Add(var_124_2)
	end

	local var_124_3 = gui.MakeControl(arg_124_1, var_124_0)

	arg_124_0.group:Add(var_124_3)

	local var_124_4 = slot_0_113_4(arg_124_0, arg_124_1, var_124_0, var_124_3, var_124_1)

	if arg_124_0.is_settings then
		return var_124_4
	end

	arg_124_0.items[#arg_124_0.items + 1] = var_124_4

	arg_124_0:__update_size()

	return var_124_4
end

function slot_0_112_3.list(arg_125_0, arg_125_1, arg_125_2, arg_125_3, arg_125_4)
	local var_125_0 = gui.List(slot_0_108_2(arg_125_1 .. "_list"), arg_125_4)

	var_125_0.allowMultiple = false
	var_125_0.unlimitedMode = arg_125_3 or false

	local var_125_1 = {}

	for iter_125_0, iter_125_1 in slot_0_49_0(arg_125_2) do
		local var_125_2 = gui.Selectable(slot_0_108_2(iter_125_1 .. "_selectable:" .. iter_125_0), iter_125_1)

		var_125_1[#var_125_1 + 1] = var_125_2

		var_125_0:Add(var_125_2)
	end

	local var_125_3 = gui.MakeControl(arg_125_1, var_125_0)

	arg_125_0.group:Add(var_125_3)

	local var_125_4 = slot_0_113_4(arg_125_0, arg_125_1, var_125_0, var_125_3, var_125_1)

	if arg_125_0.is_settings then
		return var_125_4
	end

	arg_125_0.items[#arg_125_0.items + 1] = var_125_4

	arg_125_0:__update_size()

	return var_125_4
end

function slot_0_112_3.button(arg_126_0, arg_126_1, arg_126_2)
	local var_126_0 = arg_126_2 or arg_126_1
	local var_126_1 = gui.Button(slot_0_108_2(var_126_0 .. "_button"), var_126_0)
	local var_126_2 = gui.MakeControl(arg_126_1, var_126_1)

	arg_126_0.group:Add(var_126_2)

	local var_126_3 = slot_0_113_4(arg_126_0, arg_126_1, var_126_1, var_126_2)

	if arg_126_0.is_settings then
		return var_126_3
	end

	arg_126_0.items[#arg_126_0.items + 1] = var_126_3

	arg_126_0:__update_size()

	return var_126_3
end

function slot_0_112_3.input(arg_127_0, arg_127_1)
	local var_127_0 = gui.TextInput(slot_0_108_2(arg_127_1))
	local var_127_1 = gui.MakeControl(arg_127_1, var_127_0)

	arg_127_0.group:Add(var_127_1)

	local var_127_2 = slot_0_113_4(arg_127_0, arg_127_1, var_127_0, var_127_1)

	if arg_127_0.is_settings then
		return var_127_2
	end

	arg_127_0.items[#arg_127_0.items + 1] = var_127_2

	arg_127_0:__update_size()

	return var_127_2
end

function slot_0_112_3.label(arg_128_0, arg_128_1)
	local var_128_0 = gui.Label(slot_0_108_2(arg_128_1), arg_128_1)

	arg_128_0.group:Add(var_128_0)

	local var_128_1 = slot_0_113_4(arg_128_0, arg_128_1, var_128_0, var_128_0)

	if arg_128_0.is_settings then
		return var_128_1
	end

	arg_128_0.items[#arg_128_0.items + 1] = var_128_1

	arg_128_0:__update_size()

	return var_128_1
end

function slot_0_112_3.visibility(arg_129_0, arg_129_1)
	arg_129_0.visible = arg_129_1

	arg_129_0.group:SetVisible(arg_129_1)
end

function slot_0_112_3.init(arg_130_0)
	arg_130_0.group:reset()
end

function slot_0_112_3.__update_size(arg_131_0)
	if arg_131_0.is_settings then
		return
	end

	local var_131_0 = 0
	local var_131_1 = arg_131_0.all_groups

	for iter_131_0 = 1, #var_131_1 do
		local var_131_2 = var_131_1[iter_131_0]

		if var_131_2.visible then
			local var_131_3 = var_131_2.items
			local var_131_4 = 20
			local var_131_5 = var_131_2.group.margin:Height()

			if var_131_5 == 0 then
				var_131_5 = 10
			end

			local var_131_6 = var_131_5 + var_131_2.offset

			for iter_131_1 = 1, #var_131_3 do
				local var_131_7 = var_131_3[iter_131_1]
				local var_131_8 = var_131_7.control

				if var_131_8 ~= nil and var_131_8.isVisible then
					local var_131_9 = var_131_7.name

					var_131_4 = var_131_4 + var_131_7.item.size.y + var_131_6
				end
			end

			var_131_2.group:SetDimensions(slot_0_6_0(0, var_131_0), slot_0_6_0(265, var_131_4))

			var_131_0 = var_131_0 + var_131_4 + 20
		end
	end
end

function slot_0_114_4(arg_132_0, arg_132_1, arg_132_2)
	local var_132_0 = slot_0_109_2(slot_0_108_2(arg_132_0), arg_132_0, 1024, arg_132_2)

	var_132_0:SetDimensions(slot_0_6_0(), slot_0_6_0(265, 1))

	return setmetatable({
		visible = true,
		group = var_132_0,
		offset = arg_132_1,
		items = {}
	}, slot_0_112_3)
end

slot_0_115_3 = nil

function slot_0_115_2(arg_133_0, arg_133_1, arg_133_2)
	local var_133_0 = {}

	for iter_133_0 = 1, #arg_133_1 do
		local var_133_1 = arg_133_1[iter_133_0]

		var_133_0[#var_133_0 + 1] = var_133_1.group
		var_133_1.all_groups = arg_133_1
	end

	local var_133_2 = gui.MakeStackedGroups(slot_0_108_2(arg_133_2), slot_0_6_0(265, 1024), var_133_0)

	arg_133_0:Add(var_133_2)

	return unpack(arg_133_1)
end

slot_0_116_4 = nil
slot_0_116_3 = {}
slot_0_116_3.__index = slot_0_116_3

function slot_0_116_3.groups(arg_134_0, ...)
	local var_134_0 = {
		...
	}
	local var_134_1 = #var_134_0 / 3
	local var_134_2 = {}
	local var_134_3 = ""

	for iter_134_0 = 1, var_134_1 do
		local var_134_4 = 3 * (iter_134_0 - 1) + 1
		local var_134_5 = var_134_0[var_134_4]
		local var_134_6 = var_134_0[var_134_4 + 1]
		local var_134_7 = var_134_0[var_134_4 + 2]

		var_134_3 = var_134_3 .. var_134_5
		var_134_2[#var_134_2 + 1] = slot_0_114_4(var_134_5, var_134_6, var_134_7)
	end

	return slot_0_115_2(arg_134_0.tab, var_134_2, var_134_3)
end

slot_0_117_2 = draw.SvgTexture("<svg width=\"24px\" height=\"24px\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\" fill=\"none\"><path d=\"M512 48c6.9 0 13 4.4 15.2 10.9l13.5 40.4 40.4 13.5c6.5 2.2 10.9 8.3 10.9 15.2s-4.4 13-10.9 15.2l-40.4 13.5-13.5 40.4c-2.2 6.5-8.3 10.9-15.2 10.9s-13-4.4-15.2-10.9l-13.5-40.4-40.4-13.5c-6.5-2.2-10.9-8.3-10.9-15.2s4.4-13 10.9-15.2l40.4-13.5 13.5-40.4C499 52.4 505.1 48 512 48M353.4 161.4c12.5-12.5 32.8-12.5 45.3 0l80 80c12.5 12.5 12.5 32.8 0 45.3l-10.9 10.9c7.9 22 12.2 45.7 12.2 70.5 0 114.9-93.1 208-208 208S64 482.9 64 368s93.1-208 208-208c24.7 0 48.5 4.3 70.5 12.3zM176 368c0-53 43-96 96-96 13.3 0 24-10.7 24-24s-10.7-24-24-24c-79.5 0-144 64.5-144 144 0 13.3 10.7 24 24 24s24-10.7 24-24\" fill=\"#ffffff\"/></svg>")

slot_0_117_2:Create()

draw.textures.helper_icon = slot_0_117_2

function slot_0_106_0.tab(arg_135_0)
	local var_135_0 = slot_0_107_2:AddTab(slot_0_108_2(arg_135_0), draw.textures.helper_icon, arg_135_0, gui.TabLayoutMode.DEFAULT)

	return setmetatable({
		tab = var_135_0
	}, slot_0_116_3)
end

function slot_0_106_0.find(arg_136_0)
	local var_136_0 = gui.ctx:Find(arg_136_0)

	return slot_0_113_4(nil, nil, var_136_0, var_136_0)
end

slot_0_107_1 = nil
slot_0_107_0 = {}
slot_0_108_1 = slot_0_106_0.tab("HELPER")
slot_0_109_1, slot_0_110_1, slot_0_111_1 = slot_0_108_1:groups("Master", -2, gui.GroupWidthMode.DEFAULT, "Settings", -6, gui.GroupWidthMode.DEFAULT, "Active Sources", -8, gui.GroupWidthMode.DEFAULT)
slot_0_107_0.hotkey = slot_0_109_1:switch("Hotkey (Bind)")
slot_0_107_0.throw_without_mouse1 = slot_0_107_0.hotkey:group():switch("Throw Without Mouse1")

slot_0_107_0.hotkey:set_callback(function(arg_137_0)
	if arg_137_0:get() and not arg_137_0:get_hotkey_state() then
		arg_137_0:set(false)
		slot_0_75_0("Please bind 'Hotkey (Bind)'")
	end
end, true)

slot_0_107_0.aimbot = slot_0_109_1:combo("Aimbot", {
	"Rage",
	"Legit"
})
slot_0_107_0.aimbot_fov = slot_0_109_1:slider("Maximum FOV", 40, 180)
slot_0_107_0.aimbot_smooth = slot_0_109_1:slider("Smooth", 1, 100)
slot_0_107_0.types = slot_0_110_1:selectable("Types", {
	"Smoke",
	"Flashbang",
	"Decoy",
	"High Explosive",
	"Molotov",
	"Wallbang",
	"Movement"
})
slot_0_107_0.color = slot_0_107_0.types:color("Color", true)

slot_0_107_0.color:set_callback(function(arg_138_0)
	local var_138_0 = arg_138_0:get()
	local var_138_1 = var_138_0:GetR()
	local var_138_2 = var_138_0:GetG()
	local var_138_3 = var_138_0:GetB()

	if var_138_1 == 0 and var_138_2 == 0 and var_138_3 == 0 then
		local var_138_4 = draw.color.White()

		arg_138_0:set(var_138_4)
	end
end, true)

slot_0_107_0.options = slot_0_110_1:selectable("Options", {
	"Show Behind Walls",
	"Hide Duplicates",
	"Hide Icon With Text",
	"Hide Playback Preview"
})
slot_0_107_0.active_sources = slot_0_111_1:multilist("Active Sources", {}, false, slot_0_6_0(222, 225))

slot_0_109_1:init()
slot_0_110_1:init()
slot_0_111_1:init()

slot_0_112_2, slot_0_113_3, slot_0_114_3, slot_0_115_1 = slot_0_108_1:groups("Editing Source", -6, gui.GroupWidthMode.DEFAULT, "Discord", 0, gui.GroupWidthMode.DEFAULT, "Cloud Sources", -8, gui.GroupWidthMode.DEFAULT, "Locations", 0, gui.GroupWidthMode.DEFAULT)
slot_0_107_0.editing_sources = slot_0_112_2:combo("editing_sources", {
	"Create New"
})
slot_0_107_0.editing_sources.item.size.x = 220

slot_0_107_0.editing_sources:reset()

slot_0_107_0.create_source = slot_0_112_2:button("", "Create Source")
slot_0_107_0.new_source_name = slot_0_107_0.create_source:input("Source Name")
slot_0_107_0.new_source_name.placeholder = "Start typing name..."
slot_0_107_0.new_source_name.item.size.x = 115
slot_0_107_0.import_source = slot_0_112_2:button("Import", "Import")
slot_0_107_0.import_source.tooltip = "Import locations"
slot_0_107_0.import_source.item.size.x = 220
slot_0_107_0.export_source = slot_0_112_2:button("Export", "Export")
slot_0_107_0.export_source.tooltip = "Export source"
slot_0_107_0.export_source.item.size.x = 220
slot_0_107_0.delete_source = slot_0_112_2:button("Delete", "Delete")
slot_0_107_0.delete_source.tooltip = "Delete source"
slot_0_107_0.delete_source.item.size.x = 220
slot_0_107_0.delete_source_confirm = slot_0_112_2:button("\fFF0000FFDelete ", "\fFF0000FFDelete (Confirm)")
slot_0_107_0.delete_source_confirm.tooltip = "\fFF0000FFDelete (Confirm) source"
slot_0_107_0.delete_source_confirm.item.size.x = 220

slot_0_107_0.editing_sources:set_callback(function(arg_139_0)
	local var_139_0 = arg_139_0:get() == 1
	local var_139_1 = not var_139_0

	slot_0_107_0.create_source:visibility(var_139_0)
	slot_0_107_0.new_source_name:visibility(var_139_0)
	slot_0_107_0.import_source:visibility(var_139_1)
	slot_0_107_0.export_source:visibility(var_139_1)
	slot_0_107_0.delete_source:visibility(var_139_1)
	slot_0_107_0.delete_source_confirm:visibility(false)
end, true)
slot_0_82_0(1, function()
	slot_0_107_0.delete_source:set_callback(function()
		slot_0_82_0(0.1, function()
			slot_0_107_0.delete_source:visibility(false)
			slot_0_107_0.delete_source_confirm:visibility(true)
		end)
		slot_0_82_0(3, function()
			slot_0_107_0.editing_sources:set(slot_0_107_0.editing_sources:get())
		end)
	end)
	slot_0_107_0.delete_source_confirm:set_callback(function()
		slot_0_82_0(0.1, function()
			slot_0_107_0.editing_sources:set(slot_0_107_0.editing_sources:get())
		end)
	end)
end)

slot_0_116_2 = slot_0_113_3:button("", "Discord Server")
slot_0_116_2.item.size.x = 220

slot_0_116_2:set_callback(function()
	slot_0_73_0("https://discord.gg/n4DpEunxbj")
end)

slot_0_107_0.cloud_sources = slot_0_114_3:list("Cloud Sources", {}, true, slot_0_6_0(222, 200))
slot_0_107_0.cloud_sources.control.showSpinner = true
slot_0_107_0.cloud_sources_upload_source = slot_0_114_3:combo("Source", {})
slot_0_107_0.cloud_sources_upload = slot_0_114_3:button("", "Upload")
slot_0_107_0.cloud_sources_upload.item.size.x = 220
slot_0_107_0.cloud_sources_delete = slot_0_114_3:button("", "Delete")
slot_0_107_0.cloud_sources_delete.item.size.x = 108
slot_0_107_0.cloud_sources_update = slot_0_107_0.cloud_sources_delete:button("Update")
slot_0_107_0.cloud_sources_update.item.size.x = 108
slot_0_107_0.cloud_sources_get = slot_0_114_3:button("", "Get")
slot_0_107_0.cloud_sources_get.item.size.x = 220
slot_0_107_0.source_locations = slot_0_115_1:list("Locations", {}, true, slot_0_6_0(222, 200))

slot_0_107_0.source_locations:reset()

slot_0_107_0.location_teleport_hotkey = slot_0_115_1:switch("Teleport")
slot_0_107_0.location_teleport_hotkey.tooltip = "Teleport Hotkey"
slot_0_107_0.location_teleport = slot_0_107_0.location_teleport_hotkey:button("     Teleport")
slot_0_107_0.location_teleport.item.size.x = 202
slot_0_107_0.location_export = slot_0_115_1:button("Export ", "Export ")
slot_0_107_0.location_export.tooltip = "Export selected location"
slot_0_107_0.location_export.item.size.x = 220
slot_0_107_0.location_delete = slot_0_115_1:button("Delete ", "Delete ")
slot_0_107_0.location_delete.tooltip = "Delete selected location"
slot_0_107_0.location_delete.item.size.x = 220
slot_0_107_0.location_delete_confirm = slot_0_115_1:button("\fFF0000FFDelete  ", "\fFF0000FFDelete (Confirm) ")
slot_0_107_0.location_delete_confirm.tooltip = "\fFF0000FFDelete (Confirm) selected location"
slot_0_107_0.location_delete_confirm.item.size.x = 220

slot_0_107_0.source_locations:set_callback(function(arg_147_0)
	slot_0_82_0(0.1, function()
		slot_0_107_0.location_delete:visibility(true)
		slot_0_107_0.location_delete_confirm:visibility(false)
	end)
end, true)
slot_0_82_0(1, function()
	slot_0_107_0.location_delete:set_callback(function()
		slot_0_82_0(0.1, function()
			slot_0_107_0.location_delete:visibility(false)
			slot_0_107_0.location_delete_confirm:visibility(true)
		end)
		slot_0_82_0(3, function()
			slot_0_107_0.source_locations:set(slot_0_107_0.source_locations:get())
		end)
	end)
	slot_0_107_0.location_delete_confirm:set_callback(function()
		slot_0_82_0(0.1, function()
			slot_0_107_0.source_locations:set(slot_0_107_0.source_locations:get())
		end)
	end)
end)
slot_0_112_2:init()
slot_0_114_3:init()
slot_0_115_1:init()

slot_0_116_1 = slot_0_108_1:groups("Location", 0, gui.GroupWidthMode.DEFAULT)
slot_0_107_0.location_type = slot_0_116_1:combo("Type", {
	"Grenade",
	"Wallbang",
	"Movement"
})
slot_0_107_0.location_name = slot_0_116_1:input("Name")
slot_0_107_0.location_name.placeholder = "Start typing..."
slot_0_107_0.location_description = slot_0_116_1:input("Description")
slot_0_107_0.location_description.placeholder = "Optional. Start typing..."
slot_0_107_0.location_jump = slot_0_116_1:switch("Jump")
slot_0_107_0.location_strafe_boost = slot_0_116_1:slider("Strafe Boost", 0, 100, {
	"%.0f%%"
})
slot_0_107_0.location_strafe_boost.tooltip = "0 - Off"

slot_0_107_0.location_jump:set_callback(function(arg_155_0)
	slot_0_107_0.location_strafe_boost:visibility(arg_155_0:get())
end, true)

slot_0_107_0.location_run = slot_0_116_1:combo("Run", {
	"Disabled",
	"Forward",
	"Left",
	"Right",
	"Back",
	"Custom"
})
slot_0_107_0.location_run_custom = slot_0_116_1:slider("Run Direction", -180, 180, {
	"%.0f°"
})
slot_0_107_0.location_run_duration = slot_0_116_1:slider("Run Duration", 0, 256, {
	"%.0ft"
})
slot_0_107_0.location_run_walk = slot_0_116_1:switch("Walk (Shift)")

slot_0_107_0.location_run:set_callback(function(arg_156_0)
	local var_156_0 = arg_156_0:get()
	local var_156_1 = var_156_0 > 1
	local var_156_2 = var_156_0 == 6

	slot_0_107_0.location_run_custom:visibility(var_156_2)
	slot_0_107_0.location_run_duration:visibility(var_156_1)
	slot_0_107_0.location_run_walk:visibility(var_156_1)
end, true)

slot_0_107_0.location_recovery = slot_0_116_1:combo("Recovery", {
	"Disabled",
	"Forward",
	"Left",
	"Right",
	"Back",
	"Custom"
})
slot_0_107_0.location_recovery_custom = slot_0_116_1:slider("Recovery Direction", -180, 180, {
	"%.0f°"
})
slot_0_107_0.location_recovery_bunnyhop = slot_0_116_1:switch("Recovery Bunny Hop")

slot_0_107_0.location_recovery:set_callback(function(arg_157_0)
	local var_157_0 = arg_157_0:get()
	local var_157_1 = var_157_0 > 1
	local var_157_2 = var_157_0 == 6

	slot_0_107_0.location_recovery_custom:visibility(var_157_2)
	slot_0_107_0.location_recovery_bunnyhop:visibility(var_157_1)
end, true)

slot_0_107_0.location_strength = slot_0_116_1:combo("Strength", {
	"Left",
	"Left / Right",
	"Right"
})
slot_0_117_1 = slot_0_107_0.location_strength:group()
slot_0_107_0.location_super_toss = slot_0_117_1:switch("Straight Throw")
slot_0_107_0.location_delay = slot_0_116_1:slider("Delay", 0, 64, {
	"%.0ft"
})
slot_0_107_0.location_recording = slot_0_116_1:switch("Recording")
slot_0_107_0.location_recording.tooltip = "Recording Hotkey"
slot_0_107_0.location_set_position_hotkey = slot_0_116_1:switch("Set Position")
slot_0_107_0.location_set_position = slot_0_107_0.location_set_position_hotkey:button("       Set Position")
slot_0_107_0.location_set_position.item.size.x = 202
slot_0_107_0.location_set_position_hotkey.tooltip = "Set Position Hotkey"

slot_0_107_0.location_type:set_callback(function(arg_158_0)
	local var_158_0 = arg_158_0:get()
	local var_158_1 = var_158_0 == 1
	local var_158_2 = var_158_0 == 2
	local var_158_3 = var_158_0 == 3

	slot_0_107_0.location_jump:visibility(var_158_1)
	slot_0_107_0.location_run:visibility(var_158_1)
	slot_0_107_0.location_recovery:visibility(var_158_1)
	slot_0_107_0.location_strength:visibility(var_158_1)
	slot_0_107_0.location_delay:visibility(var_158_1)
	slot_0_107_0.location_recording:visibility(var_158_3)
	slot_0_107_0.location_set_position_hotkey:visibility(var_158_1 or var_158_2)
end, true)

slot_0_107_0.location_save = slot_0_116_1:button("", "Save")
slot_0_107_0.location_save.item.size.x = 220

slot_0_116_1:init()

slot_0_107_0.locations_group = slot_0_115_1
slot_0_107_0.location_builder_group = slot_0_116_1

slot_0_107_0.editing_sources:set_callback(function(arg_159_0)
	local var_159_0 = arg_159_0:get() > 1

	slot_0_113_3:visibility(not var_159_0)
	slot_0_114_3:visibility(not var_159_0)
	slot_0_115_1:visibility(var_159_0)
	slot_0_116_1:visibility(var_159_0)
end, true)

slot_0_108_0 = draw.FontGDI("Verdana", 12, bit.bor(draw.FontFlags.ANTI_ALIAS, draw.FontFlags.NO_KERN, draw.FontFlags.SHADOW, draw.FontFlags.NO_DPI))

slot_0_108_0:Create()

slot_0_108_0.lineGap = 4
slot_0_109_0 = draw.FontGDI("Verdana", 12, bit.bor(draw.FontFlags.ANTI_ALIAS, draw.FontFlags.NO_KERN, draw.FontFlags.SHADOW, draw.FontFlags.NO_DPI), 0, 255, 700)

slot_0_109_0:Create()

slot_0_110_0 = draw.Font(slot_0_0_0 .. "/smallest.ttf", 10, draw.FontFlags.NO_DPI, draw.FontFlags.OUTLINE)

slot_0_110_0:Create()

slot_0_111_0 = nil
slot_0_112_1 = nil
slot_0_113_2 = {}

function slot_0_112_0(arg_160_0)
	slot_0_113_2[#slot_0_113_2 + 1] = arg_160_0
end

function slot_0_114_2(arg_161_0)
	if arg_161_0:GetName() ~= "game_newmap" then
		return
	end

	slot_0_111_0 = arg_161_0:GetString("mapname")

	if slot_0_111_0 == "<empty>" then
		slot_0_111_0 = nil
	end

	for iter_161_0, iter_161_1 in slot_0_49_0(slot_0_113_2) do
		iter_161_1()
	end
end

if slot_0_3_0:InGame() then
	slot_0_111_0 = game.globalVars.m_szMapName
end

mods.events:AddListener("game_newmap")
events.event:Add(slot_0_114_2)
slot_0_112_0(slot_0_95_0)

slot_0_113_1 = nil
slot_0_114_1 = {
	[11] = "weapon_wallbang",
	[64] = "weapon_wallbang",
	[47] = "weapon_decoy",
	[9] = "weapon_wallbang",
	[43] = "weapon_flashbang",
	[45] = "weapon_smokegrenade",
	[46] = "weapon_molotov",
	[48] = "weapon_molotov",
	[44] = "weapon_hegrenade",
	[1] = "weapon_wallbang",
	[40] = "weapon_wallbang",
	[38] = "weapon_wallbang"
}

function slot_0_113_0(arg_162_0)
	local var_162_0 = arg_162_0:GetDefIndex()
	local var_162_1 = slot_0_114_1[var_162_0]

	if var_162_1 ~= nil then
		return var_162_1
	end

	local var_162_2 = arg_162_0:GetData()

	if var_162_2 ~= nil and var_162_2.m_bMeleeWeapon:Get() then
		return "weapon_knife"
	end
end

slot_0_114_0 = {}
slot_0_115_0 = nil
slot_0_116_0 = nil
slot_0_117_0 = {}
slot_0_118_0 = nil
slot_0_119_0 = nil
slot_0_120_0 = nil
slot_0_121_0 = nil
slot_0_122_0 = slot_0_106_0.find("misc>misc>grenades>straight throw")
slot_0_123_0 = slot_0_106_0.find("misc>misc>grenades>quick switch")
slot_0_124_0 = slot_0_106_0.find("misc>movement>jumpbug")
slot_0_125_0 = slot_0_106_0.find("misc>movement>edge jump")
slot_0_126_0 = slot_0_106_0.find("misc>movement>autostrafer")
slot_0_127_0 = slot_0_106_0.find("misc>movement>autostrafer>turn angle")
slot_0_128_0 = slot_0_106_0.find("misc>movement>autostrafer>boost")
slot_0_129_0 = slot_0_106_0.find("misc>movement>standalone quick stop")
slot_0_130_0 = slot_0_106_0.find("misc>movement>slowwalk")
slot_0_131_0 = slot_0_106_0.find("misc>movement>slowwalk speed")
slot_0_132_0 = slot_0_106_0.find("misc>misc>grenades>auto release")
slot_0_133_0 = nil
slot_0_134_0 = nil
slot_0_135_0 = nil
slot_0_136_0 = nil

slot_0_107_0.aimbot:set_callback(function(arg_163_0)
	slot_0_133_0 = arg_163_0:get()
end, true)
slot_0_107_0.aimbot_fov:set_callback(function(arg_164_0)
	slot_0_134_0 = arg_164_0:get()
end, true)
slot_0_107_0.aimbot_smooth:set_callback(function(arg_165_0)
	slot_0_135_0 = arg_165_0:get() * 0.3
end, true)
slot_0_107_0.throw_without_mouse1:set_callback(function(arg_166_0)
	slot_0_136_0 = arg_166_0:get()
end, true)

slot_0_137_1 = nil
slot_0_138_1 = nil
slot_0_139_4 = {}

function slot_0_137_0(arg_167_0, arg_167_1)
	if arg_167_1 == nil then
		local var_167_0 = slot_0_139_4[arg_167_0]

		if var_167_0 ~= nil then
			arg_167_0:set(var_167_0)

			slot_0_139_4[arg_167_0] = nil
		end

		return
	end

	if slot_0_139_4[arg_167_0] == nil then
		slot_0_139_4[arg_167_0] = arg_167_0:get_direct()
	end

	arg_167_0:set(arg_167_1)
	arg_167_0:disable_hotkeys()
end

function slot_0_138_0()
	for iter_168_0, iter_168_1 in slot_0_50_0(slot_0_139_4) do
		iter_168_0:set(iter_168_1)

		slot_0_139_4[iter_168_0] = nil
	end
end

slot_0_139_3 = nil

function slot_0_140_4(arg_169_0)
	arg_169_0:RemoveButton(slot_0_64_0)
	arg_169_0:RemoveButton(slot_0_65_0)
	arg_169_0:RemoveButton(slot_0_68_0)
	arg_169_0:RemoveButton(slot_0_69_0)
	arg_169_0:SetLeftMove(0)
	arg_169_0:SetForwardMove(0)
	arg_169_0:RemoveButton(slot_0_62_0)
	arg_169_0:RemoveButton(slot_0_70_0)
	arg_169_0:RemoveButton(slot_0_63_0)
end

slot_0_141_5 = 1
slot_0_142_6 = 2
slot_0_143_6 = 3
slot_0_144_9 = 4
slot_0_145_4 = 5

function slot_0_146_4(arg_170_0, arg_170_1, arg_170_2, arg_170_3, arg_170_4)
	slot_170_5_0 = arg_170_1.commandNumber
	slot_170_6_0 = slot_0_121_0.data

	if slot_170_6_0 == nil then
		slot_170_6_0 = {}
		slot_0_121_0.data = slot_170_6_0
	end

	slot_170_7_0 = slot_170_6_0.state

	if slot_170_7_0 == nil then
		slot_170_7_0 = slot_0_141_5
		slot_170_6_0.state = slot_170_7_0
	end

	slot_170_8_0 = arg_170_0.viewangles

	if slot_0_133_0 == 1 then
		arg_170_1:SetViewangles(slot_170_8_0)
	elseif slot_170_6_0.state ~= slot_0_145_4 then
		arg_170_1:SetViewangles(slot_170_8_0)
		arg_170_1:LockAngles()
	end

	slot_170_9_0 = arg_170_0.grenade
	slot_170_10_0 = slot_170_9_0 ~= nil and slot_170_9_0.strength or 1

	if slot_170_7_0 == slot_0_141_5 or slot_170_7_0 == slot_0_142_6 or slot_170_7_0 == slot_0_144_9 then
		if slot_170_10_0 == 0 then
			arg_170_1:RemoveButton(slot_0_60_0)
			arg_170_1:SetButton(slot_0_61_0)
		elseif slot_170_10_0 == 0.5 then
			arg_170_1:SetButton(slot_0_60_0)
			arg_170_1:SetButton(slot_0_61_0)
		else
			arg_170_1:SetButton(slot_0_60_0)
			arg_170_1:RemoveButton(slot_0_61_0)
		end
	end

	slot_170_11_0 = arg_170_0.duck

	if slot_170_7_0 ~= slot_0_145_4 then
		if arg_170_4 ~= arg_170_0.weapon then
			slot_0_121_0 = nil
		end

		slot_0_140_4(arg_170_1)

		if slot_170_11_0 then
			arg_170_1:SetButton(slot_0_63_0)
		end
	end

	slot_170_13_0 = arg_170_2.m_pMovementServices:Get().m_flDuckAmount:Get()

	if slot_170_11_0 and slot_170_13_0 ~= 1 or not slot_170_11_0 and slot_170_13_0 ~= 0 then
		return
	end

	slot_170_14_0 = arg_170_3.m_flThrowStrength
	slot_170_14_0 = slot_170_14_0 and slot_170_14_0:Get()
	slot_170_15_0 = arg_170_3.m_bPinPulled or false
	slot_170_15_0 = slot_170_15_0 and slot_170_15_0:Get()

	if slot_170_7_0 == slot_0_141_5 and slot_170_14_0 == slot_170_10_0 and slot_170_15_0 then
		slot_170_7_0 = slot_0_142_6
		slot_170_6_0.state = slot_170_7_0
		slot_170_6_0.start_at = slot_170_5_0
	end

	slot_170_16_0 = slot_170_9_0 ~= nil and slot_170_9_0.strafe_boost

	if slot_170_16_0 then
		if slot_170_16_0 == true then
			slot_170_16_0 = 36
		end

		slot_0_137_0(slot_0_126_0, 10)
		slot_0_137_0(slot_0_127_0, 0)
		slot_0_137_0(slot_0_128_0, slot_170_16_0)
	end

	if slot_170_9_0 ~= nil and slot_170_9_0.super_toss then
		slot_0_137_0(slot_0_122_0, true)
	end

	if slot_170_7_0 == slot_0_145_4 then
		slot_170_18_2 = slot_170_6_0.recovery_yaw

		if slot_170_18_2 == nil then
			slot_0_121_0 = nil

			return
		end

		slot_170_19_2 = slot_170_6_0.recovery_start_at

		if slot_170_19_2 == nil then
			slot_170_19_2 = slot_170_5_0
			slot_170_6_0.recovery_start_at = slot_170_19_2
		end

		if arg_170_1:GetButton(slot_0_64_0) or arg_170_1:GetButton(slot_0_65_0) or arg_170_1:GetButton(slot_0_68_0) or arg_170_1:GetButton(slot_0_69_0) or arg_170_1:GetButton(slot_0_62_0) then
			slot_0_121_0 = nil

			return
		end

		slot_170_21_1 = slot_170_9_0 ~= nil and slot_170_9_0.recovery_jump
		slot_170_22_0 = slot_0_27_0(32, slot_170_6_0.run or 16) + 13 + (slot_170_16_0 and 10 or 0)

		slot_0_137_0(slot_0_126_0, 10)
		slot_0_137_0(slot_0_127_0, 0)
		slot_0_137_0(slot_0_128_0, 100)

		if slot_170_5_0 <= slot_170_19_2 + slot_170_22_0 then
			slot_0_140_4(arg_170_1)
			arg_170_1:SetForwardMove(1)

			slot_170_23_0 = arg_170_2.m_fFlags:Get()

			if not (slot_0_57_0(slot_170_23_0, 1) == 1) or slot_170_21_1 then
				arg_170_1:SetButton(slot_0_62_0)
			end

			slot_170_25_0 = slot_170_8_0.y + slot_170_18_2 + slot_170_6_0.run_yaw

			arg_170_1:RotateMovement(slot_170_25_0)
		else
			slot_0_121_0 = nil
		end
	end

	if slot_170_7_0 == slot_0_142_6 or slot_170_7_0 == slot_0_143_6 or slot_170_7_0 == slot_0_144_9 then
		slot_170_18_1 = slot_170_5_0 - slot_170_6_0.start_at
		slot_170_19_1 = slot_170_9_0 ~= nil and slot_170_9_0.run
		slot_170_20_1 = slot_170_9_0 ~= nil and slot_170_9_0.run_yaw or 0
		slot_170_6_0.run, slot_170_6_0.run_yaw = slot_170_19_1, slot_170_20_1

		if slot_170_19_1 and slot_170_18_1 < slot_170_19_1 then
			-- block empty
		elseif slot_170_7_0 == slot_0_142_6 then
			slot_170_7_0 = slot_0_143_6
			slot_170_6_0.state = slot_170_7_0
		end

		if slot_170_19_1 then
			if slot_170_9_0 ~= nil and slot_170_9_0.run_speed then
				arg_170_1:SetButton(slot_0_70_0)
			end

			arg_170_1:SetButton(slot_0_64_0)
			arg_170_1:SetForwardMove(1)

			slot_170_21_0 = slot_170_8_0.y + slot_170_20_1

			arg_170_1:RotateMovement(slot_170_21_0)
		end
	end

	if slot_170_7_0 == slot_0_143_6 then
		if slot_170_9_0 ~= nil and slot_170_9_0.jump then
			arg_170_1:SetButton(slot_0_62_0)
		end

		slot_170_7_0 = slot_0_144_9
		slot_170_6_0.state = slot_170_7_0
		slot_170_6_0.throw_at = slot_170_5_0
	end

	slot_170_18_0 = slot_170_9_0 ~= nil and slot_170_9_0.delay or 0

	if slot_170_16_0 then
		slot_170_18_0 = 12 + slot_170_18_0 * 2
	end

	if slot_170_7_0 == slot_0_144_9 then
		slot_170_19_0 = slot_170_5_0 - slot_170_6_0.throw_at

		if slot_170_18_0 <= slot_170_19_0 then
			arg_170_1:RemoveButton(slot_0_60_0)
			arg_170_1:RemoveButton(slot_0_61_0)

			slot_170_6_0.recovery_yaw = slot_170_9_0 and slot_170_9_0.recovery_yaw and slot_170_9_0.recovery_yaw or slot_170_9_0 and (slot_170_9_0.recovery_jump or slot_170_9_0.jump) and 180
		end

		if slot_170_18_0 < slot_170_19_0 then
			slot_170_6_0.thrown_at = slot_170_5_0
		end

		slot_170_20_0 = arg_170_3.m_fThrowTime

		if slot_170_20_0 then
			slot_170_20_0 = slot_170_20_0:Get()
			slot_170_20_0 = slot_170_20_0.value
		end

		if slot_170_20_0 == 0 and not slot_170_15_0 and slot_170_6_0.thrown_at and slot_170_6_0.thrown_at > slot_170_6_0.throw_at then
			slot_170_6_0.state = slot_0_145_4
		end
	end
end

function slot_0_147_5(arg_171_0, arg_171_1, arg_171_2, arg_171_3, arg_171_4)
	local var_171_0 = slot_0_121_0.data

	if var_171_0 == nil then
		var_171_0 = {}
		slot_0_121_0.data = var_171_0
	end

	if var_171_0.start_at == nil then
		var_171_0.start_at = arg_171_1.commandNumber
	end

	local var_171_1 = arg_171_1.commandNumber - var_171_0.start_at + 1
	local var_171_2 = arg_171_0.movement
	local var_171_3 = var_171_2[var_171_1]

	if var_171_3 == nil then
		slot_0_121_0 = nil

		return
	end

	local var_171_4 = arg_171_0.weapon ~= "weapon_knife"
	local var_171_5 = var_171_0.start_step_with_attack

	if var_171_4 and var_171_5 == nil then
		local var_171_6 = #var_171_2

		for iter_171_0 = 1, var_171_6 do
			local var_171_7 = var_171_2[iter_171_0].buttons or 0

			if slot_0_57_0(var_171_7, slot_0_60_0) ~= 0 or slot_0_57_0(var_171_7, slot_0_61_0) ~= 0 then
				var_171_5 = iter_171_0
				var_171_0.start_step_with_attack = var_171_5

				break
			end

			if var_171_6 == iter_171_0 then
				var_171_5 = false
				var_171_0.start_step_with_attack = var_171_5
			end
		end
	end

	local var_171_8 = arg_171_0.settings

	slot_0_137_0(slot_0_126_0, var_171_8.autostrafer or 0)
	slot_0_137_0(slot_0_127_0, var_171_8.autostrafer_turn_angle or 50)
	slot_0_137_0(slot_0_128_0, var_171_8.autostrafer_boost or 100)
	slot_0_137_0(slot_0_129_0, var_171_8.standalone_quick_stop or false)
	slot_0_137_0(slot_0_124_0, var_171_8.jumpbug or false)
	slot_0_137_0(slot_0_125_0, var_171_8.edge_jump or false)

	local var_171_9 = var_171_3.viewangles
	local var_171_10 = slot_0_8_0(var_171_9[1], var_171_9[2], 0)

	if slot_0_133_0 == 1 then
		arg_171_1:SetViewangles(var_171_10)
	else
		arg_171_1:SetViewangles(var_171_10)
		arg_171_1:LockAngles()
	end

	local var_171_11 = var_171_3.forwardmove or 0
	local var_171_12 = var_171_3.leftmove or 0

	arg_171_1:SetForwardMove(var_171_11)
	arg_171_1:SetLeftMove(var_171_12)

	if var_171_4 and var_171_5 then
		arg_171_1:SetButton(slot_0_60_0)
		arg_171_1:SetButton(slot_0_61_0)
	end

	local var_171_13 = var_171_3.buttons or 0

	for iter_171_1 = 1, #slot_0_71_0 do
		local var_171_14 = slot_0_71_0[iter_171_1]

		if slot_0_57_0(var_171_13, var_171_14) ~= 0 then
			arg_171_1:SetButton(var_171_14)
		elseif var_171_5 and var_171_5 <= var_171_1 and (var_171_14 == slot_0_60_0 or var_171_14 == slot_0_61_0) then
			arg_171_1:RemoveButton(var_171_14)
		end
	end
end

function slot_0_139_2(arg_172_0, arg_172_1, arg_172_2, arg_172_3)
	if slot_0_121_0 == nil then
		slot_0_138_0()

		return
	end

	slot_0_137_0(slot_0_132_0, 0)
	slot_0_137_0(slot_0_122_0, false)
	slot_0_137_0(slot_0_123_0, false)
	slot_0_137_0(slot_0_124_0, false)
	slot_0_137_0(slot_0_125_0, false)
	slot_0_137_0(slot_0_126_0, 0)
	slot_0_137_0(slot_0_129_0, false)
	slot_0_137_0(slot_0_130_0, false)

	local var_172_0 = slot_0_121_0.location

	if var_172_0 == nil then
		return
	end

	if var_172_0.movement ~= nil then
		return slot_0_147_5(var_172_0, arg_172_0, arg_172_1, arg_172_2, arg_172_3)
	end

	slot_0_146_4(var_172_0, arg_172_0, arg_172_1, arg_172_2, arg_172_3)
end

slot_0_140_3 = nil

events.overrideView:Add(function(arg_173_0)
	slot_0_140_3 = arg_173_0.m_vecOrigin
end)

slot_0_141_4 = nil
slot_0_142_5 = slot_0_8_0(0, 0, 61)
slot_0_143_5 = slot_0_8_0(0, 0, 6)

function slot_0_144_8(arg_174_0, arg_174_1)
	local var_174_0 = slot_0_107_0.editing_sources:get() > 1
	local var_174_1 = slot_0_107_0.options:get(2) and not var_174_0
	local var_174_2 = {}

	for iter_174_0 = arg_174_1, 1, -1 do
		local var_174_3 = arg_174_0[iter_174_0]
		local var_174_4 = var_174_3.name

		if slot_0_51_0(var_174_4) == "table" then
			var_174_3.name = var_174_4[2] or var_174_4
		end

		local var_174_5 = var_174_3.position

		if slot_0_51_0(var_174_5) == "table" then
			var_174_5 = slot_0_8_0(var_174_5[1], var_174_5[2], var_174_5[3])
			var_174_3.position = var_174_5
			var_174_3.render_position = slot_0_8_0(var_174_5.x, var_174_5.y, var_174_5.z)
		end

		local var_174_6 = var_174_3.viewangles

		if slot_0_51_0(var_174_6) == "table" then
			var_174_6 = slot_0_8_0(var_174_6[1], var_174_6[2], 0)
			var_174_3.viewangles = var_174_6
			var_174_3.viewangles_forward = var_174_5 + slot_0_142_5 + slot_0_14_0(var_174_6) * slot_0_8_0(700, 700, 700)
		end

		local var_174_7 = var_174_3.throw_points or var_174_3.points

		if var_174_7 ~= nil and #var_174_7 > 4 then
			for iter_174_1, iter_174_2 in slot_0_49_0(var_174_7) do
				if slot_0_51_0(iter_174_2) == "table" then
					var_174_7[iter_174_1] = slot_0_8_0(iter_174_2[1], iter_174_2[2], iter_174_2[3])
				end
			end

			var_174_3.points = var_174_7
			var_174_3.detonate_position = var_174_7[#var_174_7]
		else
			var_174_3.points = nil
			var_174_3.detonate_position = nil
		end

		local var_174_8 = var_174_3.end_position

		if slot_0_51_0(var_174_8) == "table" then
			var_174_3.end_position = slot_0_8_0(var_174_8[1], var_174_8[2], var_174_8[3])
		end

		var_174_3.in_fov_select = 0
		var_174_3.on_screen = 0

		local var_174_9 = var_174_3.movement

		if var_174_9 ~= nil and var_174_3.settings == nil or var_174_9 ~= nil and (slot_0_51_0(var_174_9) ~= "table" or #var_174_9 == 0) then
			slot_0_45_0(arg_174_0, iter_174_0)
		elseif var_174_1 then
			local var_174_10 = slot_0_39_0("%s:%s:%s::%s:%s", var_174_5.x, var_174_5.y, var_174_5.z, var_174_6.x, var_174_6.y)

			if var_174_2[var_174_10] ~= nil then
				slot_0_45_0(arg_174_0, iter_174_0)
			else
				var_174_2[var_174_10] = true
			end
		end
	end
end

function slot_0_141_3(arg_175_0, arg_175_1, arg_175_2)
	if slot_0_117_0[arg_175_2] ~= nil then
		return
	end

	slot_0_144_8(arg_175_0, arg_175_1)

	for iter_175_0 = 1, arg_175_1 do
		local var_175_0 = arg_175_0[iter_175_0]

		if var_175_0 ~= nil then
			local var_175_1 = var_175_0.render_position
			local var_175_2 = var_175_1
			local var_175_3 = {
				var_175_0
			}

			for iter_175_1 = arg_175_1, iter_175_0 + 1, -1 do
				local var_175_4 = arg_175_0[iter_175_1]

				if var_175_4 ~= nil then
					local var_175_5 = var_175_4.render_position

					if slot_0_10_0(var_175_1, var_175_5) <= 20 then
						var_175_2 = var_175_2 + var_175_5
						var_175_3[#var_175_3 + 1] = var_175_4

						slot_0_45_0(arg_175_0, iter_175_1)
					end
				end
			end

			local var_175_6 = #var_175_3
			local var_175_7 = var_175_2 / slot_0_8_0(var_175_6, var_175_6, var_175_6)
			local var_175_8 = {
				viewangles_alpha = 0,
				distance_width = 0,
				visible_alpha = 0,
				weapon = var_175_0.weapon,
				position = var_175_7,
				world_position = var_175_7 + slot_0_143_5
			}
			local var_175_9 = {}
			local var_175_10 = false
			local var_175_11 = false

			for iter_175_2 = 1, var_175_6 do
				local var_175_12 = var_175_3[iter_175_2]
				local var_175_13 = var_175_12.name

				if var_175_12.editing then
					var_175_11 = true

					if var_175_6 == 1 then
						var_175_9[#var_175_9 + 1] = var_175_13
						var_175_10 = true
					else
						var_175_9[#var_175_9 + 1] = "<editing>" .. var_175_13
					end
				else
					var_175_9[#var_175_9 + 1] = var_175_13
				end

				var_175_8[iter_175_2] = var_175_12
			end

			local var_175_14 = slot_0_47_0(var_175_9, "\b\n")
			local var_175_15 = slot_0_37_0(var_175_14, "<editing>", "")
			local var_175_16 = slot_0_108_0:GetTextSize(var_175_15)

			var_175_8.text = var_175_14
			var_175_8.width, var_175_8.height = var_175_16.x, var_175_16.y
			var_175_8.is_one_editing, var_175_8.is_have_editing = var_175_10, var_175_11
			arg_175_0[iter_175_0] = var_175_8
		end
	end

	slot_0_117_0[arg_175_2] = true
end

slot_0_142_4 = nil
slot_0_143_4 = {}
slot_0_144_7 = nil
slot_0_145_3 = 0

function slot_0_146_3(arg_176_0, arg_176_1)
	return arg_176_0.distance > arg_176_1.distance
end

function slot_0_147_4(arg_177_0, arg_177_1, arg_177_2)
	slot_0_46_0(arg_177_0, slot_0_146_3)

	slot_0_118_0, slot_0_119_0 = arg_177_0[arg_177_1], 1

	if slot_0_118_0 == nil then
		return
	end

	local var_177_0 = slot_0_10_0(arg_177_2, slot_0_118_0.position)

	if var_177_0 > 65 then
		slot_0_118_0 = nil

		return
	end

	slot_0_119_0 = 0.4 + slot_0_98_0(var_177_0, 0, 0.6, 65)
end

function slot_0_142_3(arg_178_0, arg_178_1, arg_178_2)
	if slot_0_144_7 ~= arg_178_2 then
		slot_0_144_7 = arg_178_2
		slot_0_115_0 = nil

		slot_0_97_0()
	end

	if slot_0_115_0 == nil then
		slot_0_115_0, slot_0_116_0 = slot_0_114_0[arg_178_2] or false, {}

		if slot_0_115_0 then
			for iter_178_0, iter_178_1 in slot_0_49_0(slot_0_115_0) do
				iter_178_1.visible_alpha = 0
				iter_178_1.distance_width = 0
				iter_178_1.viewangles_alpha = 0
			end
		end

		slot_0_145_3 = 0
	end

	if not slot_0_115_0 then
		return
	end

	local var_178_0 = #slot_0_115_0

	if var_178_0 == 0 then
		return
	end

	slot_0_141_3(slot_0_115_0, var_178_0, arg_178_2)

	local var_178_1 = #slot_0_115_0
	local var_178_2 = game.globalVars.m_flRealTime

	if var_178_2 > slot_0_145_3 + 0.2 then
		slot_0_145_3 = var_178_2
		slot_0_116_0, slot_0_143_4 = {}, {}

		for iter_178_2 = 1, var_178_1 do
			local var_178_3 = slot_0_115_0[iter_178_2]
			local var_178_4 = slot_0_10_0(arg_178_1, var_178_3.position)

			var_178_3.distance = var_178_4

			if var_178_4 <= 1250 then
				slot_0_116_0[#slot_0_116_0 + 1] = var_178_3

				if var_178_4 <= 75 then
					slot_0_143_4[#slot_0_143_4 + 1] = var_178_3
				end

				local var_178_5 = slot_0_84_0(slot_0_140_3, var_178_3.world_position)

				var_178_3.distance_alpha = slot_0_99_0(1 - var_178_4 / 1250, 0, 1, 1)
				var_178_3.is_visible = var_178_5.fraction > 0.97
				var_178_3.in_range = var_178_4 <= 650
			else
				var_178_3.distance_width = 0
				var_178_3.in_range = false
			end
		end

		return slot_0_147_4(slot_0_143_4, #slot_0_143_4, arg_178_1)
	end

	local var_178_6 = #slot_0_143_4

	if var_178_6 == 0 then
		return
	end

	for iter_178_3 = 1, var_178_6 do
		local var_178_7 = slot_0_143_4[iter_178_3]

		if var_178_7.distance > 65 then
			var_178_7.distance = slot_0_10_0(arg_178_1, var_178_7.position)

			for iter_178_4 = 1, #var_178_7 do
				local var_178_8 = var_178_7[iter_178_4]

				var_178_8.in_fov_select = 0
				var_178_8.on_screen = 0
			end
		end
	end

	if slot_0_121_0 ~= nil then
		return
	end

	slot_0_147_4(slot_0_143_4, var_178_6, arg_178_1)
end

slot_0_143_3 = game.cvar:Find("sv_quantize_movement_input")
slot_0_144_6 = slot_0_107_0.hotkey

function slot_0_145_2(arg_179_0)
	if slot_0_140_3 == nil then
		slot_0_115_0 = nil
		slot_0_121_0 = nil

		slot_0_138_0()

		return
	end

	slot_179_1_0 = slot_0_26_0()

	if slot_179_1_0 == nil or not slot_179_1_0:IsAlive() then
		slot_0_115_0 = nil
		slot_0_121_0 = nil

		slot_0_138_0()

		return
	end

	slot_179_2_0 = slot_179_1_0:GetActiveWeapon()

	if slot_179_2_0 == nil then
		slot_0_115_0 = nil
		slot_0_121_0 = nil

		slot_0_138_0()

		return
	end

	slot_179_3_0 = slot_0_113_0(slot_179_2_0)
	slot_179_4_0 = slot_179_1_0:GetAbsOrigin()

	slot_0_142_3(slot_179_2_0, slot_179_4_0, slot_179_3_0)

	if not slot_0_144_6:get_hotkey_state() then
		slot_0_121_0 = nil

		slot_0_138_0()

		return
	end

	slot_0_139_2(arg_179_0, slot_179_1_0, slot_179_2_0, slot_179_3_0)

	if slot_0_120_0 ~= nil and slot_0_121_0 == nil then
		slot_179_6_0 = slot_179_1_0.m_fFlags:Get()
		slot_179_7_0 = slot_0_57_0(slot_179_6_0, 1) == 1
		slot_179_8_0 = slot_0_120_0.on_position
		slot_179_9_0 = arg_179_0:GetButton(slot_0_64_0) or arg_179_0:GetButton(slot_0_65_0) or arg_179_0:GetButton(slot_0_68_0) or arg_179_0:GetButton(slot_0_69_0) or arg_179_0:GetButton(slot_0_62_0)

		if not slot_179_8_0 and not slot_179_9_0 then
			slot_0_137_0(slot_0_129_0, false)
			slot_0_137_0(slot_0_130_0, false)

			slot_179_10_1 = slot_0_120_0.position
			slot_179_11_3 = slot_0_10_0(slot_179_4_0, slot_179_10_1)
			slot_179_12_0 = slot_0_11_0(slot_179_4_0, slot_179_10_1)

			if slot_179_12_0 < 1.5 then
				slot_179_11_3 = slot_179_12_0
			end

			arg_179_0:SetLeftMove(0)
			arg_179_0:RemoveButton(slot_0_68_0)
			arg_179_0:RemoveButton(slot_0_69_0)

			slot_179_13_1 = slot_179_10_1 - slot_179_4_0
			slot_179_13_1.z = 0
			slot_179_14_1 = slot_0_25_0(slot_179_13_1)

			if slot_0_143_3.value then
				if slot_179_11_3 < 14 then
					slot_0_137_0(slot_0_130_0, true)
					slot_0_137_0(slot_0_131_0, slot_0_27_0(100, slot_0_28_0(26, slot_179_11_3 * 10)))

					if slot_179_11_3 < 0.65 and slot_179_11_3 > 0.05 then
						arg_179_0:SetButton(slot_0_63_0)
					end
				end

				arg_179_0:SetForwardMove(1)
			else
				slot_179_15_2 = 245
				slot_179_16_2 = 0

				if slot_179_11_3 < 1.5 then
					slot_179_16_2 = slot_179_11_3 * 20
				else
					slot_179_17_1 = slot_179_1_0:GetAbsVelocity()
					slot_179_18_2 = 4
					slot_179_19_1 = slot_179_4_0 + slot_179_17_1 * slot_0_8_0(0.015625 * slot_179_18_2, 0.015625 * slot_179_18_2, 0.015625 * slot_179_18_2)
					slot_179_20_1 = slot_0_10_0(slot_179_19_1, slot_179_10_1)
					slot_179_21_1 = slot_0_11_0(slot_179_19_1, slot_179_10_1)

					if slot_179_21_1 < 1.5 then
						slot_179_20_1 = slot_179_21_1
					end

					slot_179_16_2 = slot_179_20_1 * 50

					if slot_179_20_1 < 2 then
						slot_179_16_2 = slot_179_16_2 * 0.33
					end

					slot_179_22_1 = slot_179_10_1 - slot_179_19_1
					slot_179_22_1.z = 0
					slot_179_14_1 = slot_0_25_0(slot_179_22_1)
				end

				slot_179_18_1 = slot_179_1_0.m_pMovementServices:Get().m_flDuckAmount:Get()
				slot_179_16_1 = slot_0_28_0(1.1, slot_0_27_0(slot_179_15_2, slot_179_16_2 + slot_179_18_1 * 50))

				arg_179_0:SetForwardMove(slot_179_16_1 / slot_179_15_2)
			end

			slot_179_15_1 = slot_179_14_1.y

			arg_179_0:RotateMovement(slot_179_15_1)
		end

		if slot_0_120_0.weapon ~= "weapon_wallbang" then
			slot_179_10_0 = arg_179_0:GetButton(slot_0_60_0) or arg_179_0:GetButton(slot_0_61_0)

			if slot_179_10_0 then
				slot_179_11_2 = slot_0_120_0.grenade and slot_0_120_0.grenade.strength

				if slot_179_11_2 == 0 then
					arg_179_0:RemoveButton(slot_0_60_0)
					arg_179_0:SetButton(slot_0_61_0)
				elseif slot_179_11_2 == 0.5 then
					arg_179_0:SetButton(slot_0_60_0)
					arg_179_0:SetButton(slot_0_61_0)
				else
					arg_179_0:SetButton(slot_0_60_0)
					arg_179_0:RemoveButton(slot_0_61_0)
				end
			end

			slot_179_11_1 = slot_179_1_0:GetAbsVelocity()
			slot_179_11_0 = slot_0_13_0(slot_179_11_1)
			slot_179_13_0 = slot_179_1_0.m_pWeaponServices:Get().m_flNextAttack:Get().value
			slot_179_14_0 = slot_179_2_0.m_bPinPulled or false
			slot_179_14_0 = slot_179_14_0 and slot_179_14_0:Get()
			slot_179_15_0 = slot_0_120_0.movement ~= nil

			if slot_179_15_0 and not slot_179_10_0 then
				arg_179_0:RemoveButton(slot_0_60_0)
				arg_179_0:RemoveButton(slot_0_61_0)
			end

			slot_179_16_0 = slot_0_136_0 and slot_179_13_0 < game.globalVars.m_flCurTime or slot_179_15_0 and slot_179_10_0 or slot_179_14_0

			if slot_179_8_0 and slot_179_16_0 and slot_179_11_0 < 2 then
				slot_179_17_0 = slot_0_2_0(slot_0_1_0)
				slot_179_18_0 = slot_179_17_0 - slot_0_120_0.viewangles
				slot_179_18_0.y = slot_0_24_0(slot_179_18_0.y)
				slot_179_19_0 = slot_179_18_0.x
				slot_179_20_0 = slot_179_18_0.y
				slot_179_21_0 = slot_0_12_0(slot_179_18_0)
				slot_179_22_0 = slot_0_134_0

				if slot_0_133_0 ~= 1 then
					slot_179_22_0 = 0.3
				end

				slot_179_23_0 = slot_179_21_0 <= slot_179_22_0

				if not slot_179_23_0 and slot_0_133_0 == 2 then
					slot_179_24_0 = slot_0_27_0(1, slot_179_21_0 / 3) * 0.5
					slot_179_25_0 = (slot_179_24_0 + slot_0_34_0(slot_179_21_0 * (1 - slot_179_24_0))) * game.globalVars.m_flRenderFrameTime * slot_0_135_0
					slot_179_26_0 = slot_0_8_0(slot_179_17_0.x - slot_179_19_0 / slot_179_21_0 * slot_179_25_0, slot_179_17_0.y - slot_179_20_0 / slot_179_21_0 * slot_179_25_0, 0)

					arg_179_0:SetViewangles(slot_179_26_0)
					arg_179_0:LockAngles()
				end

				if slot_179_23_0 then
					slot_0_121_0 = {
						location = slot_0_120_0
					}
				end
			end
		end
	end
end

events.createMove:Add(slot_0_145_2)

slot_0_139_1, slot_0_140_2 = slot_0_3_0:GetScreenSize()
slot_0_141_2 = slot_0_139_1 * 0.5
slot_0_142_2 = slot_0_140_2 * 0.5
slot_0_143_2 = slot_0_4_0(255, 245, 5, 255)
slot_0_144_5 = slot_0_4_0(20, 236, 0, 255)
slot_0_145_1 = slot_0_4_0(140, 140, 140, 255)
slot_0_146_2 = nil
slot_0_147_3 = nil
slot_0_146_1 = {
	weapon_smokegrenade = draw.CreatePanoramaSvgTexture("icons/equipment/smokegrenade", 16),
	weapon_flashbang = draw.CreatePanoramaSvgTexture("icons/equipment/flashbang", 16),
	weapon_decoy = draw.CreatePanoramaSvgTexture("icons/equipment/decoy", 16),
	weapon_hegrenade = draw.CreatePanoramaSvgTexture("icons/equipment/hegrenade", 16),
	weapon_molotov = draw.CreatePanoramaSvgTexture("icons/equipment/molotov", 16),
	weapon_wallbang = draw.CreatePanoramaSvgTexture("icons/ui/bullet", 16),
	weapon_knife = draw.CreatePanoramaSvgTexture("hud/deathnotice/inairkill", 16)
}

for iter_0_0, iter_0_1 in slot_0_50_0(slot_0_146_1) do
	iter_0_1:Create()
end

slot_0_148_7 = {
	0.1,
	0,
	0.2,
	0
}
slot_0_147_2 = setmetatable({}, {
	__index = function(arg_180_0, arg_180_1)
		arg_180_0[arg_180_1] = setmetatable({}, {
			__index = function(arg_181_0, arg_181_1)
				local var_181_0 = arg_180_1:GetSize()
				local var_181_1 = var_181_0.x * arg_181_1 / var_181_0.y
				local var_181_2 = arg_181_1
				local var_181_3 = slot_0_148_7[1] * var_181_1
				local var_181_4 = slot_0_148_7[2] * var_181_2
				local var_181_5 = var_181_1 + slot_0_148_7[3] * var_181_1
				local var_181_6 = var_181_2 + slot_0_148_7[4] * var_181_2
				local var_181_7 = {
					var_181_5,
					var_181_6,
					var_181_3,
					var_181_4,
					slot_0_8_0(var_181_1, var_181_2, 0)
				}

				if slot_0_52_0(var_181_7[1]) ~= "nan" then
					arg_181_0[arg_181_1] = var_181_7
				end

				return var_181_7
			end
		})

		return arg_180_0[arg_180_1]
	end
})

function slot_0_148_6(arg_182_0, arg_182_1)
	return arg_182_0.fov > arg_182_1.fov
end

slot_0_149_9 = nil
slot_0_150_5 = ffi.typeof("            struct {\n                float matrix[4][4];\n            }\n        ")
slot_0_151_6 = slot_0_74_0("client.dll", "48 8D 0D ? ? ? ? 48 C1 E0 06") or error("Failed to find 'viewmatrix'. Please wait for script update!")
slot_0_151_5 = slot_0_83_0(slot_0_151_6, 3)
slot_0_151_4 = slot_0_54_0(ffi.typeof("$*", slot_0_150_5), slot_0_151_5)[0]

function slot_0_152_4(arg_183_0, arg_183_1, arg_183_2, arg_183_3, arg_183_4, arg_183_5, arg_183_6, arg_183_7)
	local var_183_0 = arg_183_0 * arg_183_3 - arg_183_1 * arg_183_2
	local var_183_1 = arg_183_4 * arg_183_7 - arg_183_5 * arg_183_6
	local var_183_2 = (arg_183_0 - arg_183_2) * (arg_183_5 - arg_183_7) - (arg_183_1 - arg_183_3) * (arg_183_4 - arg_183_6)

	return (var_183_0 * (arg_183_4 - arg_183_6) - (arg_183_0 - arg_183_2) * var_183_1) / var_183_2, (var_183_0 * (arg_183_5 - arg_183_7) - (arg_183_1 - arg_183_3) * var_183_1) / var_183_2
end

function slot_0_149_8(arg_184_0, arg_184_1)
	local var_184_0 = arg_184_0.x
	local var_184_1 = arg_184_0.y
	local var_184_2 = arg_184_0.z
	local var_184_3 = slot_0_151_4.matrix
	local var_184_4 = var_184_3[0]
	local var_184_5 = var_184_3[1]
	local var_184_6 = var_184_3[3]
	local var_184_7, var_184_8, var_184_9 = var_184_4[0] * var_184_0 + var_184_4[1] * var_184_1 + var_184_4[2] * var_184_2 + var_184_4[3], var_184_5[0] * var_184_0 + var_184_5[1] * var_184_1 + var_184_5[2] * var_184_2 + var_184_5[3], var_184_6[0] * var_184_0 + var_184_6[1] * var_184_1 + var_184_6[2] * var_184_2 + var_184_6[3]
	local var_184_10 = var_184_9 >= 0.001
	local var_184_11 = (var_184_10 and 1 or -1) / var_184_9
	local var_184_12, var_184_13 = var_184_7 * var_184_11, var_184_8 * var_184_11
	local var_184_14, var_184_15 = slot_0_141_2 + (0.5 * var_184_12 * slot_0_139_1 + 0.5), slot_0_142_2 - (0.5 * var_184_13 * slot_0_140_2 + 0.5)

	if not var_184_10 or var_184_14 < arg_184_1 or var_184_14 > slot_0_139_1 - arg_184_1 or var_184_15 < arg_184_1 or var_184_15 > slot_0_140_2 - arg_184_1 then
		if not var_184_10 then
			local var_184_16 = slot_0_33_0(var_184_15 - slot_0_142_2, var_184_14 - slot_0_141_2)
			local var_184_17 = slot_0_28_0(slot_0_139_1, slot_0_140_2)

			var_184_14, var_184_15 = slot_0_141_2 + var_184_17 * slot_0_31_0(var_184_16), slot_0_142_2 + var_184_17 * slot_0_32_0(var_184_16)
		end

		local var_184_18 = {
			arg_184_1,
			arg_184_1,
			slot_0_139_1 - arg_184_1,
			arg_184_1,
			slot_0_139_1 - arg_184_1,
			arg_184_1,
			slot_0_139_1 - arg_184_1,
			slot_0_140_2 - arg_184_1,
			arg_184_1,
			arg_184_1,
			arg_184_1,
			slot_0_140_2 - arg_184_1,
			arg_184_1,
			slot_0_140_2 - arg_184_1,
			slot_0_139_1 - arg_184_1,
			slot_0_140_2 - arg_184_1
		}

		for iter_184_0 = 1, 16, 4 do
			local var_184_19 = var_184_18[iter_184_0]
			local var_184_20 = var_184_18[iter_184_0 + 1]
			local var_184_21 = var_184_18[iter_184_0 + 2]
			local var_184_22 = var_184_18[iter_184_0 + 3]
			local var_184_23, var_184_24 = slot_0_152_4(var_184_19, var_184_20, var_184_21, var_184_22, slot_0_141_2, slot_0_142_2, var_184_14, var_184_15)

			if iter_184_0 == 1 and var_184_15 < arg_184_1 and arg_184_1 <= var_184_23 and var_184_23 <= slot_0_139_1 - arg_184_1 or iter_184_0 == 5 and var_184_14 > slot_0_139_1 - arg_184_1 and arg_184_1 <= var_184_24 and var_184_24 <= slot_0_140_2 - arg_184_1 or iter_184_0 == 9 and var_184_14 < arg_184_1 and arg_184_1 <= var_184_24 and var_184_24 <= slot_0_140_2 - arg_184_1 or iter_184_0 == 13 and var_184_15 > slot_0_140_2 - arg_184_1 and arg_184_1 <= var_184_23 and var_184_23 <= slot_0_139_1 - arg_184_1 then
				return slot_0_6_0(var_184_23, var_184_24), false
			end
		end

		return slot_0_6_0(var_184_14, var_184_15), false
	end

	return slot_0_6_0(var_184_14, var_184_15), true
end

slot_0_150_4 = nil
slot_0_151_3 = nil
slot_0_152_3 = nil
slot_0_153_4 = nil
slot_0_154_3 = nil
slot_0_155_3 = nil
slot_0_156_3 = nil

slot_0_107_0.color:set_callback(function(arg_185_0)
	local var_185_0 = arg_185_0:get()

	slot_0_150_4 = var_185_0:GetR()
	slot_0_151_3 = var_185_0:GetG()
	slot_0_152_3 = var_185_0:GetB()
	slot_0_153_4 = slot_0_28_0(135, var_185_0:GetA()) / 255
end, true)
slot_0_107_0.options:set_callback(function(arg_186_0)
	slot_0_154_3 = arg_186_0:get(1)
	slot_0_155_3 = arg_186_0:get(3)
	slot_0_156_3 = arg_186_0:get(4)
end, true)

function slot_0_157_4(arg_187_0, arg_187_1)
	if slot_0_118_0 == nil then
		slot_0_97_0()

		return
	end

	slot_187_2_0 = nil

	if slot_0_121_0 ~= nil then
		slot_187_2_0 = slot_0_121_0.location
	end

	slot_187_3_0 = slot_0_118_0.viewangles_alpha

	if slot_0_118_0 == slot_187_2_0 then
		slot_187_3_0 = 1
		slot_0_118_0.viewangles_alpha = slot_187_3_0
		slot_187_3_0 = slot_0_101_0(slot_187_3_0, 0, 1, 1)
	elseif slot_187_3_0 < 1 then
		slot_187_3_0 = slot_0_27_0(1, slot_187_3_0 + arg_187_1 * 6)
		slot_0_118_0.viewangles_alpha = slot_187_3_0
		slot_187_3_0 = slot_0_101_0(slot_187_3_0, 0, 1, 1)
	end

	if slot_187_3_0 == 0 then
		slot_0_97_0()

		return
	end

	slot_187_4_0 = arg_187_0:GetAbsOrigin()
	slot_187_5_0 = slot_0_2_0(slot_0_1_0)
	slot_187_7_0 = arg_187_0.m_pMovementServices:Get().m_flDuckAmount:Get()
	slot_187_8_0 = #slot_0_118_0

	for iter_187_0 = 1, slot_187_8_0 do
		slot_187_13_2 = slot_0_118_0[iter_187_0]
		slot_187_14_2 = slot_187_5_0 - slot_187_13_2.viewangles
		slot_187_14_2.y = slot_0_24_0(slot_187_14_2.y)
		slot_187_15_1 = slot_0_12_0(slot_187_14_2)
		slot_187_16_1 = slot_187_13_2.position
		slot_187_17_1 = slot_0_10_0(slot_187_4_0, slot_187_16_1)
		slot_187_18_1 = slot_0_11_0(slot_187_4_0, slot_187_16_1)

		if slot_187_18_1 < 1.5 then
			slot_187_17_1 = slot_187_18_1
		end

		slot_187_13_2.fov, slot_187_13_2.is_on_fov = slot_187_15_1, slot_187_15_1 <= slot_0_134_0
		slot_187_13_2.distance = slot_187_17_1
		slot_187_13_2.on_position = slot_187_17_1 <= 0.1
	end

	slot_0_46_0(slot_0_118_0, slot_0_148_6)

	slot_0_120_0 = slot_0_118_0[slot_187_8_0]
	slot_187_9_0 = nil

	for iter_187_1 = 1, slot_187_8_0 do
		slot_187_14_1 = slot_0_118_0[iter_187_1]
		slot_187_15_0 = slot_187_14_1 == slot_0_120_0
		slot_187_16_0 = slot_187_14_1.is_on_fov
		slot_187_17_0 = slot_187_15_0 and slot_187_16_0
		slot_187_18_0 = slot_187_14_1.on_position or slot_187_14_1 == slot_187_2_0
		slot_187_19_0, slot_187_20_0 = slot_0_149_8(slot_187_14_1.viewangles_forward, 40)
		slot_187_21_0 = slot_187_14_1.on_screen

		if slot_187_20_0 and slot_187_21_0 < 1 then
			slot_187_21_0 = slot_0_27_0(1, slot_187_21_0 + arg_187_1 * 4.5)
			slot_187_14_1.on_screen = slot_187_21_0
		elseif not slot_187_20_0 and slot_187_21_0 > 0 then
			slot_187_21_0 = slot_0_28_0(0, slot_187_21_0 - arg_187_1 * 5.5)
			slot_187_14_1.on_screen = slot_187_21_0
		end

		slot_187_22_1 = (0.5 + slot_187_21_0 * 0.5) * slot_187_3_0
		slot_187_22_0 = slot_0_153_4 * slot_187_22_1
		slot_187_23_0 = slot_0_150_4
		slot_187_24_0 = slot_0_151_3
		slot_187_25_0 = slot_0_152_3

		if slot_187_14_1.editing then
			slot_187_23_0, slot_187_24_0, slot_187_25_0 = 255, 16, 16
		end

		slot_187_27_0 = 255 * slot_187_22_0
		slot_187_28_0 = "»" .. slot_187_14_1.name
		slot_187_29_0 = slot_187_14_1.description

		if slot_187_29_0 ~= nil then
			slot_187_29_0 = slot_0_37_0(slot_0_42_0(slot_187_29_0), " ", "  ")
		end

		slot_187_30_0 = slot_0_109_0:GetTextSize(slot_187_28_0)
		slot_187_31_0 = slot_0_6_0()

		if slot_187_29_0 ~= nil then
			slot_187_31_0 = slot_0_110_0:GetTextSize(slot_187_29_0)
		end

		slot_187_32_0 = slot_0_29_0(slot_187_31_0.y * 0.5)
		slot_187_33_0 = slot_0_28_0(slot_187_30_0.x, slot_187_31_0.x)
		slot_187_34_0 = slot_187_30_0.y + slot_187_31_0.y
		slot_187_35_1 = slot_0_29_0(slot_187_30_0.y * 0.5 - 1) * 2.25
		slot_187_36_0 = 0

		if slot_187_21_0 > 0 then
			slot_187_36_0 = slot_0_29_0((slot_187_35_1 + 7) * slot_187_21_0) + slot_187_32_0
			slot_187_33_0 = slot_187_33_0 + slot_187_36_0
		end

		slot_187_37_1 = slot_0_27_0(slot_187_19_0.x - slot_187_35_1 * 0.5 - slot_187_32_0 * 0.5, slot_0_139_1 - 40 - slot_187_33_0)
		slot_187_38_0 = slot_187_19_0.y - slot_187_34_0 * 0.5
		slot_187_39_0 = slot_187_37_1 + slot_187_33_0
		slot_187_40_0 = slot_187_38_0 + slot_187_34_0
		slot_187_41_0 = slot_0_102_0(slot_187_22_0, 0, 1, 1)

		slot_0_19_0(slot_0_15_0, slot_0_7_0(slot_187_37_1 - 2, slot_187_38_0 - 2, slot_187_39_0 + 2, slot_187_40_0 + 2), slot_0_4_0(16, 16, 16, 120 * slot_187_41_0))
		slot_0_18_0(slot_0_15_0, slot_0_7_0(slot_187_37_1 - 3, slot_187_38_0 - 3, slot_187_39_0 + 3, slot_187_40_0 + 3), slot_0_4_0(16, 16, 16, 110 * slot_187_41_0))
		slot_0_18_0(slot_0_15_0, slot_0_7_0(slot_187_37_1 - 4, slot_187_38_0 - 4, slot_187_39_0 + 4, slot_187_40_0 + 4), slot_0_4_0(16, 16, 16, 120 * slot_187_41_0))
		slot_0_18_0(slot_0_15_0, slot_0_7_0(slot_187_37_1 - 5, slot_187_38_0 - 5, slot_187_39_0 + 5, slot_187_40_0 + 5), slot_0_4_0(16, 16, 16, 40 * slot_187_41_0))

		if slot_187_21_0 > 0.5 then
			slot_187_42_3 = slot_187_14_1.in_fov_select

			if slot_187_17_0 and slot_187_42_3 < 1 then
				slot_187_42_3 = slot_0_27_0(1, slot_187_42_3 + arg_187_1 * 2.5 * (slot_187_16_0 and 2 or 1))
				slot_187_14_1.in_fov_select = slot_187_42_3
			elseif not slot_187_17_0 and slot_187_42_3 > 0 then
				slot_187_42_3 = slot_0_28_0(0, slot_187_42_3 - arg_187_1 * 4.5)
				slot_187_14_1.in_fov_select = slot_187_42_3
			end

			slot_187_35_0 = slot_187_35_1 * 0.5
			slot_187_43_3 = slot_0_6_0(slot_187_37_1 + slot_187_35_0 + slot_187_32_0 * 0.5, slot_187_38_0 + slot_187_34_0 * 0.5)

			if slot_187_2_0 == slot_187_14_1 then
				slot_0_22_0(slot_0_15_0, slot_187_43_3, slot_187_35_0, slot_0_4_0(slot_187_23_0, slot_187_24_0, slot_187_25_0, slot_187_27_0))
			else
				slot_187_44_1 = slot_0_5_0(slot_0_143_2, slot_0_144_5, slot_187_18_0 and 1 or 0)
				slot_187_45_3 = slot_0_5_0(slot_0_145_1, slot_187_44_1, slot_187_42_3)
				slot_187_46_3 = slot_187_27_0 * slot_0_103_0(slot_187_21_0, 0, 1, 1)
				slot_187_45_2 = slot_187_45_3:a(slot_187_46_3 / 255)

				slot_0_22_0(slot_0_15_0, slot_187_43_3, slot_187_35_0, slot_187_45_2)
			end
		end

		slot_187_37_0 = slot_187_37_1 + slot_187_36_0

		if slot_187_36_0 > 1 then
			slot_0_18_0(slot_0_15_0, slot_0_7_0(slot_187_37_0 - 4, slot_187_38_0, slot_187_37_0 - 3, slot_187_38_0 + slot_187_34_0), slot_0_4_0(slot_187_23_0, slot_187_24_0, slot_187_25_0, slot_187_27_0 * slot_187_21_0))
		end

		slot_0_15_0.font = slot_0_109_0

		slot_0_21_0(slot_0_15_0, slot_0_6_0(slot_187_37_0 + 1, slot_187_38_0), slot_187_28_0, slot_0_4_0(slot_187_23_0, slot_187_24_0, slot_187_25_0, slot_187_27_0))

		if slot_187_29_0 ~= nil then
			slot_0_15_0.font = slot_0_110_0

			slot_0_21_0(slot_0_15_0, slot_0_6_0(slot_187_37_0 + 1, slot_187_38_0 + slot_187_30_0.y + 2), slot_187_29_0, slot_0_4_0(slot_187_23_0, slot_187_24_0, slot_187_25_0, slot_187_27_0))
		end

		slot_0_15_0.font = slot_0_108_0

		if not slot_0_156_3 then
			slot_187_42_2 = slot_187_14_1.points
			slot_187_43_2 = slot_187_14_1.detonate_position

			if slot_187_42_2 ~= nil and slot_187_43_2 ~= nil and slot_187_14_1.in_fov_select > 0 and slot_187_21_0 > 0 then
				if slot_187_14_1.particle_indexes == nil then
					slot_187_45_1 = {}
					slot_187_46_2 = slot_0_92_0(slot_187_42_2, slot_187_23_0, slot_187_24_0, slot_187_25_0)

					if slot_187_46_2 ~= nil then
						slot_187_45_1[#slot_187_45_1 + 1] = slot_187_46_2
						slot_0_96_0[slot_187_46_2] = slot_187_14_1
						slot_187_46_1 = slot_0_93_0(slot_187_43_2, 30, slot_187_23_0, slot_187_24_0, slot_187_25_0)
						slot_187_45_1[#slot_187_45_1 + 1] = slot_187_46_1
						slot_0_96_0[slot_187_46_1] = slot_187_14_1
					end

					slot_187_14_1.particle_indexes = slot_187_45_1
				else
					slot_187_9_0 = slot_187_14_1
				end
			end
		end

		slot_187_42_1 = slot_187_14_1.end_position

		if slot_187_42_1 ~= nil then
			slot_187_43_1 = slot_187_14_1.position + slot_0_8_0(0, 0, 61)
			slot_187_44_0 = slot_187_42_1 - slot_187_43_1
			slot_187_43_0 = slot_187_43_1 + slot_187_44_0 * slot_0_8_0(0.1, 0.1, 0.1)
			slot_187_42_0 = slot_187_42_1 - slot_187_44_0 * slot_0_8_0(0.06, 0.06, 0.06)
			slot_187_45_0 = {
				slot_187_43_0,
				slot_187_42_0
			}

			if slot_187_14_1.particle_indexes == nil then
				slot_187_46_0 = {}
				slot_187_47_0 = slot_0_92_0(slot_187_45_0, slot_187_23_0, slot_187_24_0, slot_187_25_0)

				if slot_187_47_0 ~= nil then
					slot_187_46_0[#slot_187_46_0 + 1] = slot_187_47_0
					slot_0_96_0[slot_187_47_0] = slot_187_14_1
				end

				slot_187_14_1.particle_indexes = slot_187_46_0
			else
				slot_187_9_0 = slot_187_14_1
			end
		end
	end

	if slot_187_9_0 == nil then
		return
	end

	for iter_187_2, iter_187_3 in slot_0_50_0(slot_0_96_0) do
		if iter_187_3 ~= slot_187_9_0 then
			slot_0_94_0(iter_187_2)

			slot_0_96_0[iter_187_2] = nil
			iter_187_3.particle_indexes = nil
		end
	end
end

function slot_0_158_4()
	slot_0_120_0 = nil
	slot_188_0_0 = slot_0_26_0()

	if slot_188_0_0 == nil or not slot_188_0_0:IsAlive() then
		slot_0_97_0()

		return
	end

	if not slot_0_115_0 then
		slot_0_97_0()

		return
	end

	slot_188_1_0 = #slot_0_116_0

	if slot_188_1_0 == 0 then
		slot_0_97_0()

		return
	end

	slot_0_15_0.font = slot_0_108_0

	if slot_0_156_3 then
		slot_0_97_0()
	end

	slot_188_2_0 = game.globalVars.m_flRenderFrameTime

	for iter_188_0 = 1, slot_188_1_0 do
		slot_188_7_0 = slot_0_116_0[iter_188_0]
		slot_188_8_0 = slot_188_7_0 == slot_0_118_0

		if not slot_188_8_0 then
			slot_188_7_0.viewangles_alpha = 0
		end

		slot_188_9_0 = slot_188_7_0.in_range and (slot_0_119_0 > 0.5 or slot_188_8_0)
		slot_188_10_0 = slot_188_7_0.distance_width

		if slot_188_9_0 and slot_188_10_0 < 1 then
			slot_188_10_0 = slot_0_27_0(1, slot_188_10_0 + slot_188_2_0 * 6)
			slot_188_7_0.distance_width = slot_188_10_0
			slot_188_10_0 = slot_0_98_0(slot_188_10_0, 0, 1, 1)
		elseif not slot_188_9_0 and slot_188_10_0 > 0 then
			slot_188_10_0 = slot_0_28_0(0, slot_188_10_0 - slot_188_2_0 * 6)
			slot_188_7_0.distance_width = slot_188_10_0
			slot_188_10_0 = slot_0_98_0(slot_188_10_0, 0, 1, 1)
		end

		slot_188_11_2 = slot_188_7_0.visible_alpha
		slot_188_12_0 = slot_188_7_0.is_visible
		slot_188_13_0 = slot_0_154_3 and slot_188_10_0 > 0 and 0.45 or 0
		slot_188_14_0 = slot_0_154_3 and slot_188_10_0 > 0 and not slot_188_12_0 and 0.33 or 1

		if slot_188_12_0 and slot_188_11_2 < 1 or slot_188_11_2 < slot_188_13_0 then
			slot_188_11_2 = slot_0_27_0(1, slot_188_11_2 + slot_188_2_0 * 5.5 * slot_188_14_0)
			slot_188_7_0.visible_alpha = slot_188_11_2
			slot_188_11_2 = slot_0_100_0(slot_188_11_2, 0, 1, 1)
		elseif not slot_188_12_0 and slot_188_13_0 < slot_188_11_2 then
			slot_188_11_2 = slot_0_28_0(slot_188_13_0, slot_188_11_2 - slot_188_2_0 * 7.5 * slot_188_14_0)
			slot_188_7_0.visible_alpha = slot_188_11_2
			slot_188_11_2 = slot_0_100_0(slot_188_11_2, 0, 1, 1)
		end

		slot_188_11_1 = slot_188_11_2 * (slot_188_8_0 and 1 or slot_0_119_0) * slot_188_7_0.distance_alpha

		if slot_188_11_1 > 0 then
			slot_188_16_0 = slot_0_23_0(slot_188_7_0.world_position)
			slot_188_17_1 = slot_188_16_0.x
			slot_188_18_1 = slot_188_16_0.y

			if slot_188_17_1 > -100000 and slot_188_17_1 < 100000 and slot_188_18_1 > -100000 and slot_188_18_1 < 100000 then
				slot_188_11_0 = slot_0_153_4 * slot_188_11_1
				slot_188_20_0 = slot_0_150_4
				slot_188_21_0 = slot_0_151_3
				slot_188_22_0 = slot_0_152_3
				slot_188_23_0 = slot_188_11_0 * 255
				slot_188_24_0 = slot_188_7_0.is_have_editing
				slot_188_25_0 = slot_188_7_0.is_one_editing

				if slot_188_24_0 and slot_188_25_0 then
					slot_188_20_0, slot_188_21_0, slot_188_22_0 = 255, 16, 16
				end

				slot_188_26_0 = slot_188_7_0.width
				slot_188_27_0 = slot_188_7_0.height
				slot_188_28_0 = slot_188_7_0.text

				if slot_188_28_0 == nil then
					slot_188_26_0 = 0
					slot_188_27_0 = 0
					slot_188_10_0 = 0
				end

				if slot_188_10_0 < 1 then
					slot_188_26_0, slot_188_27_0 = slot_188_26_0 * slot_188_10_0, slot_188_27_0 * slot_188_10_0
				end

				slot_188_29_0 = slot_0_146_1[slot_188_7_0.weapon]
				slot_188_30_0 = nil
				slot_188_31_0 = nil
				slot_188_32_1 = nil
				slot_188_33_0 = nil

				if slot_0_155_3 and slot_188_10_0 > 0 then
					slot_188_29_0 = nil
				end

				slot_188_34_0 = slot_188_27_0

				if slot_188_29_0 ~= nil then
					slot_188_35_1 = slot_188_7_0.distance - 60
					slot_188_36_1 = slot_0_27_0(17, slot_0_29_0(slot_0_28_0(13, slot_188_27_0 + 2, slot_188_35_1 < 0 and -slot_188_35_1 or 0)))
					slot_188_37_1 = slot_0_147_2[slot_188_29_0][slot_188_36_1]
					slot_188_33_0 = slot_188_37_1[5]
					slot_188_31_0, slot_188_32_0 = slot_188_37_1[1], slot_188_37_1[2]
					slot_188_38_1 = 1 - slot_188_10_0
					slot_188_39_2 = 5 * slot_188_38_1
					slot_188_26_0 = slot_188_26_0 + slot_188_31_0 + 8 * slot_188_10_0 + slot_188_39_2
					slot_188_27_0 = slot_0_28_0(slot_188_32_0, slot_188_27_0) + slot_188_39_2
					slot_188_40_2 = slot_188_17_1 - slot_188_26_0 * 0.5 + slot_188_37_1[3]
					slot_188_41_0 = slot_188_18_1 - slot_188_27_0 + slot_188_37_1[4]

					if slot_188_32_0 < slot_188_34_0 then
						slot_188_41_0 = slot_188_41_0 + (slot_188_34_0 - slot_188_32_0) * 0.5
					end

					slot_188_30_0 = slot_0_8_0(slot_0_29_0(slot_188_40_2) + 3 * slot_188_38_1, slot_0_29_0(slot_188_41_0) + 2 * slot_188_38_1, 0)
				end

				slot_188_17_0, slot_188_18_0 = slot_188_17_1 - slot_188_26_0 * 0.5, slot_188_18_1 - slot_188_27_0
				slot_188_35_0 = slot_188_17_0 + slot_188_26_0 + 1
				slot_188_36_0 = slot_188_18_0 + slot_188_27_0 - 1
				slot_188_37_0 = 3 * slot_188_10_0
				slot_188_38_0 = 4 * slot_188_10_0

				slot_0_19_0(slot_0_15_0, slot_0_7_0(slot_188_17_0 - slot_188_37_0, slot_188_18_0 - slot_188_37_0, slot_188_35_0 + slot_188_37_0, slot_188_36_0 + slot_188_37_0), slot_0_4_0(16, 16, 16, 100 * slot_188_11_0))
				slot_0_18_0(slot_0_15_0, slot_0_7_0(slot_188_17_0 - slot_188_38_0, slot_188_18_0 - slot_188_38_0, slot_188_35_0 + slot_188_38_0, slot_188_36_0 + slot_188_38_0), slot_0_4_0(16, 16, 16, 115 * slot_188_11_0))

				if slot_188_29_0 ~= nil then
					slot_0_17_0(slot_0_16_0, slot_188_29_0)

					slot_188_39_1 = slot_188_30_0.x
					slot_188_40_1 = slot_188_30_0.y

					slot_0_19_0(slot_0_15_0, slot_0_7_0(slot_188_39_1, slot_188_40_1, slot_188_39_1 + slot_188_33_0.x, slot_188_40_1 + slot_188_33_0.y), slot_0_4_0(slot_188_20_0, slot_188_21_0, slot_188_22_0, slot_188_23_0))
					slot_0_17_0(slot_0_16_0, nil)
				end

				if slot_188_10_0 > 0 then
					if slot_188_31_0 ~= nil then
						slot_188_39_0 = slot_188_17_0 + slot_188_31_0 * slot_188_10_0
						slot_188_40_0 = slot_188_18_0 + 2

						slot_0_18_0(slot_0_15_0, slot_0_7_0(slot_188_39_0 + 3, slot_188_40_0 - 2, slot_188_39_0 + 4, slot_188_40_0 + slot_188_27_0 - 3), slot_0_4_0(slot_188_20_0, slot_188_21_0, slot_188_22_0, 220 * slot_188_11_0 * slot_188_10_0))

						slot_188_17_0 = slot_188_17_0 + slot_188_31_0 + 8 * slot_188_10_0
					end

					if slot_188_34_0 < slot_188_27_0 then
						slot_188_18_0 = slot_188_18_0 + (slot_188_27_0 - slot_188_34_0) * 0.5
					end

					if slot_188_24_0 and not slot_188_25_0 then
						slot_188_28_0 = slot_0_37_0(slot_188_28_0, "<editing>", slot_0_39_0("\fFF1010%x", slot_188_23_0 * slot_188_10_0))
					end

					slot_0_20_0(slot_0_15_0, slot_0_7_0(slot_188_17_0, slot_188_18_0, slot_188_35_0 + 2, slot_188_36_0), false)
					slot_0_21_0(slot_0_15_0, slot_0_6_0(slot_188_17_0 + 2, slot_188_18_0), slot_188_28_0, slot_0_4_0(slot_188_20_0, slot_188_21_0, slot_188_22_0, slot_188_23_0 * slot_188_10_0))

					slot_0_16_0.clipRect = nil
				end
			end
		end
	end

	slot_0_157_4(slot_188_0_0, slot_188_2_0)
end

events.presentQueue:Add(slot_0_158_4)

function slot_0_139_0(arg_189_0)
	local var_189_0 = {}

	for iter_189_0, iter_189_1 in slot_0_49_0(arg_189_0) do
		var_189_0[iter_189_1.name] = true
	end

	return var_189_0
end

slot_0_140_1 = nil
slot_0_141_1 = nil
slot_0_142_1 = nil
slot_0_143_1 = nil
slot_0_144_4 = nil
slot_0_145_0 = nil
slot_0_146_0 = nil

slot_0_107_0.editing_sources:set_callback(function(arg_190_0)
	slot_0_107_0.source_locations:reset()

	slot_0_141_1 = nil
	slot_0_142_1 = nil
	slot_0_143_1 = nil
	slot_0_144_4 = arg_190_0:get()

	if slot_0_144_4 == 1 then
		slot_0_144_4 = nil
		slot_0_145_0 = nil
		slot_0_146_0 = nil

		return
	end

	slot_0_144_4 = slot_0_144_4 - 1
	slot_0_144_4 = slot_0_144_4 + 3

	if slot_0_145_0 == nil then
		slot_0_145_0 = slot_0_104_0()
	end

	slot_0_146_0 = slot_0_145_0.sources[slot_0_144_4]

	if slot_0_146_0.author ~= nil then
		slot_0_107_0.import_source:visibility(false)
		slot_0_107_0.export_source:visibility(false)
		slot_0_107_0.location_builder_group:visibility(false)
		slot_0_107_0.locations_group:visibility(false)
	end
end)

slot_0_147_1 = nil
slot_0_148_5 = {}
slot_0_149_7 = {
	"weapon_smokegrenade",
	"weapon_flashbang",
	"weapon_decoy",
	"weapon_hegrenade",
	"weapon_molotov",
	"weapon_wallbang",
	"weapon_knife"
}

slot_0_107_0.types:set_callback(function(arg_191_0)
	for iter_191_0, iter_191_1 in slot_0_49_0(slot_0_149_7) do
		slot_0_148_5[iter_191_1] = arg_191_0:get(iter_191_0)
	end
end, true)

function slot_0_149_6(arg_192_0, arg_192_1, arg_192_2)
	for iter_192_0, iter_192_1 in slot_0_50_0(arg_192_0) do
		if slot_0_111_0 == iter_192_0 then
			for iter_192_2, iter_192_3 in slot_0_49_0(iter_192_1) do
				local var_192_0 = iter_192_3.weapon

				if slot_0_148_5[var_192_0] then
					local var_192_1 = slot_0_114_0[var_192_0]

					if var_192_1 == nil then
						var_192_1 = {}
						slot_0_114_0[var_192_0] = var_192_1
					end

					if arg_192_1 == slot_0_144_4 and iter_192_2 == slot_0_143_1 then
						-- block empty
					else
						var_192_1[#var_192_1 + 1] = iter_192_3
					end
				elseif not arg_192_2 then
					arg_192_0[iter_192_2] = nil
				end
			end
		elseif not arg_192_2 then
			arg_192_0[iter_192_0] = nil
		end
	end
end

function slot_0_147_0(arg_193_0, arg_193_1)
	slot_0_114_0, slot_0_115_0 = {}
	slot_0_117_0 = {}

	if slot_0_111_0 == nil then
		return
	end

	if arg_193_0 == nil or arg_193_0.sources == nil then
		arg_193_0 = slot_0_104_0()
	end

	local var_193_0 = arg_193_0.sources

	for iter_193_0, iter_193_1 in slot_0_49_0(var_193_0) do
		local var_193_1 = slot_0_107_0.active_sources:get(iter_193_0)

		if arg_193_1 then
			var_193_1 = slot_0_144_4 == iter_193_0
		end

		if var_193_1 then
			local var_193_2 = iter_193_1.locations

			if var_193_2 ~= nil then
				slot_0_149_6(var_193_2, iter_193_0, arg_193_1)
			end
		elseif not arg_193_1 then
			var_193_0[iter_193_0] = nil
		end
	end

	if slot_0_141_1 == nil then
		return
	end

	if not (slot_0_141_1.position ~= nil and slot_0_141_1.viewangles ~= nil and slot_0_141_1.weapon ~= nil) then
		return
	end

	local var_193_3 = slot_0_141_1.weapon
	local var_193_4 = slot_0_114_0[var_193_3]

	if var_193_4 == nil then
		var_193_4 = {}
		slot_0_114_0[var_193_3] = var_193_4
	end

	local var_193_5 = slot_0_90_0(slot_0_141_1)

	var_193_5.editing = true
	var_193_4[#var_193_4 + 1] = var_193_5
end

slot_0_82_0(0.5, slot_0_147_0)
slot_0_112_0(slot_0_147_0)
slot_0_82_0(0.5, function()
	slot_0_107_0.active_sources:set_callback(slot_0_147_0)
	slot_0_107_0.types:set_callback(function()
		if slot_0_145_0 == nil then
			return slot_0_147_0()
		end

		slot_0_147_0(slot_0_145_0, true)
	end)
	slot_0_107_0.editing_sources:set_callback(function(arg_196_0)
		if slot_0_145_0 == nil then
			return slot_0_147_0()
		end

		slot_0_147_0(slot_0_145_0, true)
	end)

	local var_194_0 = slot_0_107_0.options:get(2)

	slot_0_107_0.options:set_callback(function(arg_197_0)
		if slot_0_145_0 ~= nil then
			return
		end

		local var_197_0 = slot_0_107_0.options:get(2)

		if var_194_0 == var_197_0 then
			return
		end

		var_194_0 = var_197_0

		slot_0_147_0()
	end)
end)

function slot_0_140_0(arg_198_0)
	if arg_198_0 == nil then
		arg_198_0 = slot_0_104_0()
	end

	local var_198_0 = arg_198_0.sources
	local var_198_1 = {}
	local var_198_2 = {
		"Create New"
	}

	for iter_198_0, iter_198_1 in slot_0_49_0(var_198_0) do
		local var_198_3 = iter_198_1.name
		local var_198_4 = iter_198_1.author

		if var_198_4 ~= nil then
			var_198_3 = slot_0_39_0("Cloud / %s / %s", var_198_3, var_198_4)
		end

		var_198_1[#var_198_1 + 1] = var_198_3

		if iter_198_0 > 3 then
			var_198_2[#var_198_2 + 1] = var_198_3
		end
	end

	slot_0_107_0.active_sources:update(var_198_1)
	slot_0_107_0.editing_sources:update(var_198_2)
	slot_0_45_0(var_198_2, 1)
	slot_0_107_0.cloud_sources_upload_source:update(var_198_2)
end

slot_0_140_0()

slot_0_148_4 = {
	"grenades.json",
	"movements.json",
	"wallbangs.json"
}
slot_0_149_5 = "https://github.com/arsenic23/fatality-helper/raw/refs/heads/main/beta/%s" --"https://vhelper.xyz/ft-cs2/helper/%s"
slot_0_150_3 = slot_0_104_0()
slot_0_151_2 = slot_0_150_3.sources
slot_0_152_2 = 0
slot_0_153_3 = 0

function slot_0_154_2(arg_199_0, arg_199_1)
	slot_0_152_2 = slot_0_152_2 + 1

	if not arg_199_0 then
		slot_0_75_0(slot_0_39_0("Failed to download: %s. Try to load with VPN", slot_0_37_0(arg_199_1, ".json", "")))
	end

	if slot_0_152_2 ~= #slot_0_148_4 then
		return
	end

	slot_0_105_0(slot_0_150_3)

	local var_199_0 = false

	for iter_199_0 = 1, 3 do
		if slot_0_107_0.active_sources:get(iter_199_0) then
			var_199_0 = true

			break
		end
	end

	if var_199_0 then
		slot_0_147_0(slot_0_150_3)
	end

	slot_0_150_3 = nil
	slot_0_151_2 = nil
end

function slot_0_155_2(arg_200_0, arg_200_1)
	slot_0_153_3 = slot_0_153_3 + 1

	local var_200_0 = slot_0_39_0(slot_0_149_5, arg_200_1)

	slot_0_79_0(var_200_0, {
		headers = slot_0_91_0
	}, function(arg_201_0, arg_201_1)
		if arg_201_0 ~= 200 or arg_201_1 == nil then
			return slot_0_154_2(false, arg_200_1)
		end

		local var_201_0 = #arg_201_1
		local var_201_1 = slot_0_38_0(arg_201_1, 1, 1)
		local var_201_2 = slot_0_38_0(arg_201_1, var_201_0, var_201_0)

		if (var_201_1 == "[" or var_201_1 == "{") and (var_201_2 == "]" or var_201_2 == "}") then
			local var_201_3 = utils.JsonDecode(arg_201_1)

			if slot_0_51_0(var_201_3) == "table" then
				slot_0_151_2[arg_200_0].locations = var_201_3

				return slot_0_154_2(true, arg_200_1)
			end
		end

		slot_0_154_2(false, arg_200_1)
	end)
end

for iter_0_2, iter_0_3 in slot_0_49_0(slot_0_148_4) do
	slot_0_82_0(slot_0_153_3, function()
		slot_0_155_2(iter_0_2, iter_0_3)
	end)
end

function slot_0_148_3()
	local var_203_0 = slot_0_107_0.new_source_name:get()

	if slot_0_37_0(var_203_0, " ", "") == "" then
		var_203_0 = "Unnamed"
	end

	local var_203_1 = slot_0_104_0()
	local var_203_2 = var_203_1.sources
	local var_203_3 = var_203_0
	local var_203_4 = 2
	local var_203_5 = slot_0_139_0(var_203_2)

	while var_203_5[var_203_3] do
		var_203_3 = slot_0_39_0("%s (%d)", var_203_0, var_203_4)
		var_203_4 = var_203_4 + 1
	end

	var_203_2[#var_203_2 + 1] = {
		name = var_203_3,
		locations = {}
	}

	slot_0_105_0(var_203_1)
	slot_0_140_0(var_203_1)
	slot_0_75_0(slot_0_39_0("Source '%s' Created!", var_203_0))
end

slot_0_107_0.create_source:set_callback(slot_0_148_3)
slot_0_107_0.delete_source_confirm:set_callback(function()
	if slot_0_144_4 == nil then
		return
	end

	local var_204_0 = slot_0_104_0()
	local var_204_1 = var_204_0.sources
	local var_204_2 = var_204_1[slot_0_144_4].name

	slot_0_45_0(var_204_1, slot_0_144_4)
	slot_0_105_0(var_204_0)
	slot_0_82_0(0.05, function()
		slot_0_140_0(var_204_0)
		slot_0_82_0(0.05, slot_0_107_0.editing_sources.reset, slot_0_107_0.editing_sources)
	end)
	slot_0_75_0(slot_0_39_0("Source '%s' Deleted!", var_204_2))
end)

slot_0_148_2 = nil
slot_0_149_4 = {}

for iter_0_4 = 128, 255 do
	slot_0_149_4[#slot_0_149_4 + 1] = slot_0_41_0(iter_0_4)
end

slot_0_149_3 = slot_0_47_0(slot_0_149_4)
slot_0_149_2 = slot_0_39_0("[%s]", slot_0_149_3)

function slot_0_148_1(arg_206_0)
	return slot_0_37_0(arg_206_0, slot_0_149_2, "")
end

function slot_0_149_1(arg_207_0)
	if slot_0_51_0(arg_207_0) ~= "table" then
		return false, "wrong type, expected table"
	end

	local var_207_0 = arg_207_0.name

	if (slot_0_51_0(var_207_0) ~= "string" or not (#var_207_0 > 0)) and (slot_0_51_0(var_207_0) ~= "table" or #var_207_0 ~= 2) then
		return false, "invalid name, expected string or table of length 2"
	end

	local var_207_1 = arg_207_0.description

	if var_207_1 ~= nil and (slot_0_51_0(var_207_1) ~= "string" or #var_207_1 == 0) then
		return false, "invalid description, expected nil or non-empty string"
	end

	local var_207_2 = arg_207_0.weapon

	if slot_0_51_0(var_207_2) ~= "string" or #var_207_2 == 0 then
		return false, "invalid weapon"
	end

	local var_207_3 = arg_207_0.position

	if slot_0_51_0(var_207_3) == "table" and #var_207_3 == 3 then
		if slot_0_51_0(var_207_3[1]) ~= "number" or slot_0_51_0(var_207_3[2]) ~= "number" or slot_0_51_0(var_207_3[3]) ~= "number" then
			return false, "invalid type in position"
		end
	else
		return false, "invalid position"
	end

	local var_207_4 = arg_207_0.viewangles

	if slot_0_51_0(var_207_4) == "table" or #var_207_4 == 2 then
		if slot_0_51_0(var_207_4[1]) ~= "number" or slot_0_51_0(var_207_4[2]) ~= "number" then
			return false, "invalid type in viewangles"
		end
	else
		return false, "invalid viewangles"
	end

	local var_207_5 = arg_207_0.duck

	if var_207_5 ~= nil and slot_0_51_0(var_207_5) ~= "boolean" then
		return false, "invalid duck"
	end

	local var_207_6 = arg_207_0.movement

	if var_207_6 ~= nil and arg_207_0.settings == nil or var_207_6 ~= nil and (slot_0_51_0(var_207_6) ~= "table" or #var_207_6 == 0) then
		return false, "invalid movement"
	end

	return true
end

function slot_0_150_2(arg_208_0, arg_208_1, arg_208_2, arg_208_3, arg_208_4)
	if slot_0_51_0(arg_208_2) ~= "string" or slot_0_40_0(arg_208_2, " ") ~= nil then
		return slot_0_75_0(slot_0_39_0("Failed to import: Invalid map name (%s)", arg_208_2))
	end

	if arg_208_1 == nil then
		return
	end

	local var_208_0 = arg_208_0[arg_208_2]

	if var_208_0 == nil then
		var_208_0 = {}
		arg_208_0[arg_208_2] = var_208_0
	end

	local var_208_1 = 0

	for iter_208_0 = 1, #arg_208_1 do
		local var_208_2 = arg_208_1[iter_208_0]
		local var_208_3 = var_208_2.position
		local var_208_4 = var_208_2.viewangles
		local var_208_5 = arg_208_2 .. var_208_2.weapon .. var_208_3[1] .. var_208_3[2] .. var_208_3[3] .. var_208_4[1] .. var_208_4[2]

		if arg_208_3[var_208_5] == nil then
			local var_208_6, var_208_7 = slot_0_149_1(var_208_2)

			if var_208_6 then
				var_208_0[#var_208_0 + 1] = var_208_2
			else
				var_208_1 = var_208_1 + 1
			end

			arg_208_3[var_208_5] = iter_208_0
		elseif not arg_208_4 then
			var_208_1 = var_208_1 + 1
		end
	end

	return var_208_1
end

slot_0_107_0.import_source:set_callback(function()
	if slot_0_144_4 == nil then
		return
	end

	local var_209_0 = utils.ClipboardGet()

	if var_209_0 == nil or var_209_0 == "" then
		return slot_0_75_0("Failed to import: Clipboard is empty")
	end

	local var_209_1 = slot_0_38_0(var_209_0, 1, 1)

	if not (var_209_1 == "[" or var_209_1 == "{") then
		return slot_0_75_0("Failed to import: Invalid JSON")
	end

	local var_209_2 = slot_0_148_1(var_209_0)
	local var_209_3 = utils.JsonDecode(var_209_2)

	if slot_0_51_0(var_209_3) ~= "table" then
		return slot_0_75_0("Failed to import: Invalid JSON")
	end

	local var_209_4 = slot_0_38_0(var_209_2, 1, 1) == "["

	if not var_209_4 and (var_209_3.name ~= nil or var_209_3.grenade ~= nil or var_209_3.weapon ~= nil) then
		var_209_3 = {
			var_209_3
		}
		var_209_4 = true
	end

	local var_209_5 = slot_0_104_0()
	local var_209_6 = var_209_5.sources[slot_0_144_4].locations
	local var_209_7 = {}

	for iter_209_0, iter_209_1 in slot_0_50_0(var_209_6) do
		for iter_209_2, iter_209_3 in slot_0_49_0(iter_209_1) do
			local var_209_8 = iter_209_1[iter_209_2]
			local var_209_9 = var_209_8.position
			local var_209_10 = var_209_8.viewangles

			var_209_7[iter_209_0 .. var_209_8.weapon .. var_209_9[1] .. var_209_9[2] .. var_209_9[3] .. var_209_10[1] .. var_209_10[2]] = iter_209_2
		end
	end

	local var_209_11 = 0

	if var_209_4 then
		var_209_11 = var_209_11 + slot_0_150_2(var_209_6, var_209_3, slot_0_111_0, var_209_7)
	else
		for iter_209_4, iter_209_5 in slot_0_50_0(var_209_3) do
			var_209_11 = var_209_11 + slot_0_150_2(var_209_6, iter_209_5, iter_209_4, var_209_7)
		end
	end

	slot_0_75_0("Import Successful!")

	if var_209_11 > 0 then
		slot_0_75_0(slot_0_39_0("Skipped '%d' Locations", var_209_11))
	end

	slot_0_105_0(var_209_5)

	local var_209_12 = slot_0_146_0.locations
	local var_209_13 = {}

	for iter_209_6, iter_209_7 in slot_0_50_0(var_209_12) do
		for iter_209_8, iter_209_9 in slot_0_49_0(iter_209_7) do
			local var_209_14 = iter_209_7[iter_209_8]
			local var_209_15 = var_209_14.position
			local var_209_16 = var_209_14.viewangles

			if slot_0_51_0(var_209_15) == "userdata" then
				var_209_15 = {
					var_209_15.x,
					var_209_15.y,
					var_209_15.z
				}
			end

			if slot_0_51_0(var_209_16) == "userdata" then
				var_209_16 = {
					var_209_16.x,
					var_209_16.y
				}
			end

			var_209_13[iter_209_6 .. var_209_14.weapon .. var_209_15[1] .. var_209_15[2] .. var_209_15[3] .. var_209_16[1] .. var_209_16[2]] = iter_209_8
		end
	end

	if var_209_4 then
		slot_0_150_2(var_209_12, var_209_3, slot_0_111_0, var_209_13, true)
	else
		for iter_209_10, iter_209_11 in slot_0_50_0(var_209_3) do
			slot_0_150_2(var_209_12, iter_209_11, iter_209_10, var_209_13, true)
		end
	end

	slot_0_147_0(slot_0_145_0, true)
end)
slot_0_107_0.export_source:set_callback(function()
	if slot_0_144_4 == nil then
		return
	end

	local var_210_0 = slot_0_104_0().sources[slot_0_144_4].locations
	local var_210_1 = utils.JsonEncode(var_210_0)

	utils.ClipboardSet(var_210_1)
	slot_0_75_0("Source Copied to Clipboard!")
end)

slot_0_148_0 = {}
slot_0_149_0 = false
slot_0_150_1 = nil
slot_0_151_1 = nil
slot_0_150_0 = {
	[0] = 2,
	[-90] = 4,
	[90] = 3,
	[180] = 5
}
slot_0_151_0 = {
	nil,
	0,
	90,
	-90,
	180
}
slot_0_152_1 = nil
slot_0_153_1 = nil
slot_0_152_0 = {
	[0] = 3,
	1,
	[0.5] = 2
}
slot_0_153_0 = {
	1,
	0.5,
	0
}
slot_0_154_1 = nil
slot_0_155_1 = nil
slot_0_156_2 = false

function slot_0_154_0(arg_211_0)
	if slot_0_156_2 and arg_211_0 ~= nil then
		return
	end

	if slot_0_142_1 == nil then
		slot_0_141_1 = nil

		return
	end

	if slot_0_141_1 == nil then
		slot_0_141_1 = {}
	end

	local var_211_0 = slot_0_107_0.location_type:get()
	local var_211_1 = slot_0_107_0.location_name:get()

	if slot_0_37_0(var_211_1, " ", "") == "" then
		var_211_1 = "Unnamed"
	end

	slot_0_141_1.name = var_211_1

	local var_211_2 = slot_0_107_0.location_description:get()

	if slot_0_37_0(var_211_2, " ", "") == "" then
		var_211_2 = nil
	end

	slot_0_141_1.description = var_211_2

	local var_211_3

	if var_211_0 == 1 then
		if slot_0_107_0.location_jump:get() then
			var_211_3 = var_211_3 or {}
			var_211_3.jump = true
		end

		local var_211_4 = slot_0_107_0.location_strafe_boost:get()

		if var_211_4 > 0 then
			var_211_3 = var_211_3 or {}
			var_211_3.strafe_boost = var_211_4
		end

		local var_211_5 = slot_0_107_0.location_run:get()

		if var_211_5 ~= 1 then
			local var_211_6 = var_211_5 == 6 and slot_0_107_0.location_run_custom:get() or slot_0_151_0[var_211_5]

			var_211_3 = var_211_3 or {}
			var_211_3.run = slot_0_107_0.location_run_duration:get()
			var_211_3.run_yaw = var_211_6 ~= 0 and var_211_6 or nil
			var_211_3.run_speed = slot_0_107_0.location_run_walk:get() or nil
		end

		local var_211_7 = slot_0_107_0.location_recovery:get()

		if var_211_7 ~= 1 then
			var_211_3.recovery_yaw, var_211_3 = var_211_7 == 6 and slot_0_107_0.location_recovery_custom:get() or slot_0_151_0[var_211_7], var_211_3 or {}
			var_211_3.recovery_jump = slot_0_107_0.location_recovery_bunnyhop:get() or nil
		end

		local var_211_8 = slot_0_107_0.location_strength:get()

		if var_211_8 ~= 1 then
			var_211_3 = var_211_3 or {}
			var_211_3.strength = slot_0_153_0[var_211_8]
		end

		if slot_0_107_0.location_super_toss:get() then
			var_211_3 = var_211_3 or {}
			var_211_3.super_toss = true
		end

		local var_211_9 = slot_0_107_0.location_delay:get()

		if var_211_9 > 0 then
			var_211_3 = var_211_3 or {}
			var_211_3.delay = var_211_9
		end
	end

	slot_0_141_1.grenade = var_211_3

	local var_211_10 = false
	local var_211_11 = slot_0_142_1.grenade or {}

	grenade = grenade or {}

	for iter_211_0, iter_211_1 in slot_0_50_0(grenade) do
		if iter_211_0 ~= "recovery_yaw" and iter_211_0 ~= "recovery_jump" and iter_211_1 ~= var_211_11[iter_211_0] then
			var_211_10 = true
		end
	end

	for iter_211_2, iter_211_3 in slot_0_50_0(var_211_11) do
		if iter_211_2 ~= "recovery_yaw" and iter_211_2 ~= "recovery_jump" and iter_211_3 ~= grenade[iter_211_2] then
			var_211_10 = true
		end
	end

	if var_211_10 then
		slot_0_141_1.points = nil
	end

	slot_0_147_0(slot_0_145_0, true)

	slot_0_149_0 = true
end

slot_0_157_3 = {
	slot_0_107_0.location_type,
	slot_0_107_0.location_name,
	slot_0_107_0.location_description,
	slot_0_107_0.location_jump,
	slot_0_107_0.location_strafe_boost,
	slot_0_107_0.location_run,
	slot_0_107_0.location_run_custom,
	slot_0_107_0.location_run_duration,
	slot_0_107_0.location_run_walk,
	slot_0_107_0.location_recovery,
	slot_0_107_0.location_recovery_custom,
	slot_0_107_0.location_recovery_bunnyhop,
	slot_0_107_0.location_strength,
	slot_0_107_0.location_super_toss,
	slot_0_107_0.location_delay
}

slot_0_82_0(0.05, function()
	for iter_212_0, iter_212_1 in slot_0_49_0(slot_0_157_3) do
		iter_212_1:set_callback(slot_0_154_0)
	end
end)

function slot_0_155_0(arg_213_0)
	slot_0_156_2 = not arg_213_0
end

slot_0_158_3 = nil

events.createMove:Add(function(arg_214_0)
	if slot_0_146_0 == nil then
		slot_0_158_3 = nil

		return
	end

	if slot_0_107_0.location_type:get() ~= 3 then
		slot_0_158_3 = nil

		return
	end

	local var_214_0 = slot_0_26_0()

	if var_214_0 == nil or not var_214_0:IsAlive() then
		slot_0_158_3 = nil

		return
	end

	if not slot_0_107_0.location_recording:get_hotkey_state() then
		if slot_0_158_3 ~= nil then
			local var_214_1 = slot_0_158_3.movement
			local var_214_2 = slot_0_158_3.settings
			local var_214_3 = slot_0_158_3.points

			if var_214_1 ~= nil and var_214_2 ~= nil and var_214_3 ~= nil then
				slot_0_141_1.movement = var_214_1
				slot_0_141_1.settings = var_214_2
				slot_0_141_1.points = var_214_3

				slot_0_147_0(slot_0_145_0, true)

				local var_214_4 = {}

				for iter_214_0, iter_214_1 in slot_0_49_0(var_214_3) do
					var_214_4[iter_214_0] = {
						iter_214_1.x,
						iter_214_1.y,
						iter_214_1.z
					}
				end

				slot_0_141_1.points = var_214_4
			end
		end

		slot_0_158_3 = nil

		return
	end

	if slot_0_158_3 == nil then
		slot_0_158_3 = {}
	end

	local var_214_5 = slot_0_158_3.movement
	local var_214_6 = var_214_0:GetAbsVelocity()
	local var_214_7 = slot_0_13_0(var_214_6)
	local var_214_8 = arg_214_0:GetViewangles()

	if var_214_5 == nil and var_214_7 < 2 then
		local var_214_9 = var_214_0:GetActiveWeapon()

		if var_214_9 == nil then
			slot_0_158_3 = nil

			return
		end

		local var_214_10 = slot_0_113_0(var_214_9)

		if var_214_10 == nil then
			slot_0_158_3 = nil

			return
		end

		local var_214_11 = var_214_0:GetAbsOrigin()

		slot_0_141_1.position = {
			var_214_11.x,
			var_214_11.y,
			var_214_11.z
		}
		slot_0_141_1.viewangles = {
			var_214_8.x,
			var_214_8.y
		}
		slot_0_141_1.weapon = var_214_10

		local var_214_12 = {
			autostrafer = slot_0_126_0:get(),
			autostrafer_turn_angle = slot_0_127_0:get(),
			autostrafer_boost = slot_0_128_0:get(),
			standalone_quick_stop = slot_0_129_0:get(),
			jumpbug = slot_0_124_0:get(),
			edge_jump = slot_0_125_0:get()
		}

		var_214_5 = {}
		slot_0_158_3.movement = var_214_5
		slot_0_158_3.settings = var_214_12
	end

	if var_214_5 == nil then
		return
	end

	local var_214_13 = 0

	for iter_214_2 = 1, #slot_0_71_0 do
		local var_214_14 = slot_0_71_0[iter_214_2]

		if arg_214_0:GetButton(var_214_14) then
			var_214_13 = var_214_13 + var_214_14
		end
	end

	if var_214_13 == 0 then
		var_214_13 = nil
	end

	local var_214_15 = slot_0_158_3.start_at

	if var_214_15 == nil and var_214_13 ~= nil then
		var_214_15 = arg_214_0.commandNumber
		slot_0_158_3.start_at = var_214_15
	end

	if var_214_15 == nil then
		return
	end

	local var_214_16 = arg_214_0.commandNumber - var_214_15 + 1
	local var_214_17 = arg_214_0:GetForwardMove()
	local var_214_18 = arg_214_0:GetLeftMove()

	var_214_5[#var_214_5 + 1] = {
		viewangles = {
			var_214_8.x,
			var_214_8.y
		},
		forwardmove = var_214_17 ~= 0 and var_214_17 or nil,
		leftmove = var_214_18 ~= 0 and var_214_18 or nil,
		buttons = var_214_13
	}

	local var_214_19 = slot_0_158_3.points

	if var_214_19 == nil then
		var_214_19 = {}
		slot_0_158_3.points = var_214_19
	end

	local var_214_20 = var_214_0:GetAbsOrigin()

	var_214_19[#var_214_19 + 1] = var_214_20
end)

slot_0_156_1 = nil

function slot_0_157_2()
	slot_0_107_0.location_type:reset()
	slot_0_107_0.location_name:reset()
	slot_0_107_0.location_description:reset()
	slot_0_107_0.location_jump:reset()
	slot_0_107_0.location_strafe_boost:reset()
	slot_0_107_0.location_run:reset()
	slot_0_107_0.location_run_custom:reset()
	slot_0_107_0.location_run_duration:reset()
	slot_0_107_0.location_run_walk:reset()
	slot_0_107_0.location_recovery:reset()
	slot_0_107_0.location_recovery_custom:reset()
	slot_0_107_0.location_recovery_bunnyhop:reset()
	slot_0_107_0.location_strength:reset()
	slot_0_107_0.location_super_toss:reset()
	slot_0_107_0.location_delay:reset()
end

slot_0_157_2()

function slot_0_156_0()
	slot_0_155_0(false)

	if slot_0_144_4 == nil then
		return
	end

	slot_0_157_2()

	if slot_0_142_1 == nil or slot_0_142_1 == "create_new" then
		slot_0_141_1 = nil

		slot_0_154_0()
		slot_0_82_0(0.3, slot_0_155_0, true)

		return
	end

	if slot_0_142_1.movement ~= nil then
		slot_0_107_0.location_type:set(3)
	elseif slot_0_142_1.weapon == "weapon_wallbang" then
		slot_0_107_0.location_type:set(2)
	else
		slot_0_107_0.location_type:set(1)
	end

	slot_216_1_0 = slot_0_142_1.name
	slot_216_1_0 = slot_0_51_0(slot_216_1_0) == "table" and slot_216_1_0[2] or slot_216_1_0

	slot_0_107_0.location_name:set(slot_216_1_0)

	slot_216_2_0 = slot_0_142_1.description or ""

	slot_0_107_0.location_description:set(slot_216_2_0)

	slot_216_3_0 = slot_0_142_1.grenade or {}
	slot_216_4_0 = slot_216_3_0.jump or false

	slot_0_107_0.location_jump:set(slot_216_4_0)

	slot_216_5_0 = slot_216_3_0.strafe_boost or 0

	if slot_216_5_0 == true then
		slot_216_5_0 = 36
	end

	slot_0_107_0.location_strafe_boost:set(slot_216_5_0)

	slot_216_6_0 = slot_216_3_0.run
	slot_216_7_0 = slot_216_3_0.run_yaw
	slot_216_8_0 = slot_216_3_0.run_speed or false
	slot_216_9_0 = slot_216_6_0 == nil and 1 or slot_216_7_0 == nil and 2 or slot_0_150_0[slot_216_7_0] or 6

	slot_0_107_0.location_run:set(slot_216_9_0)
	slot_0_107_0.location_run_custom:set(slot_216_7_0 or 0)
	slot_0_107_0.location_run_duration:set(slot_216_6_0 or 0)
	slot_0_107_0.location_run_walk:set(slot_216_8_0)

	slot_216_10_0 = slot_216_3_0.recovery_yaw
	slot_216_11_0 = slot_216_3_0.recovery_jump or false
	slot_216_12_0 = slot_216_10_0 == nil and 1 or slot_0_150_0[slot_216_10_0] or 6

	slot_0_107_0.location_recovery:set(slot_216_12_0)
	slot_0_107_0.location_recovery_custom:set(slot_216_10_0 or 0)
	slot_0_107_0.location_recovery_bunnyhop:set(slot_216_11_0)

	slot_216_13_0 = slot_0_152_0[slot_216_3_0.strength or 1]

	slot_0_107_0.location_strength:set(slot_216_13_0)
	slot_0_107_0.location_super_toss:set(slot_216_3_0.super_toss or false)

	slot_216_14_0 = slot_216_3_0.delay or 0

	slot_0_107_0.location_delay:set(slot_216_14_0)

	if slot_0_141_1 == nil then
		slot_0_141_1 = {}
	end

	slot_216_15_0 = slot_0_142_1.position
	slot_216_16_0 = slot_0_51_0(slot_216_15_0)

	if slot_216_16_0 == "table" then
		slot_0_141_1.position = {
			slot_216_15_0[1],
			slot_216_15_0[2],
			slot_216_15_0[3]
		}
	elseif slot_216_16_0 == "userdata" then
		slot_0_141_1.position = {
			slot_216_15_0.x,
			slot_216_15_0.y,
			slot_216_15_0.z
		}
	end

	slot_216_17_0 = slot_0_142_1.viewangles
	slot_216_18_0 = slot_0_51_0(slot_216_17_0)

	if slot_216_18_0 == "table" then
		slot_0_141_1.viewangles = {
			slot_216_17_0[1],
			slot_216_17_0[2]
		}
	elseif slot_216_18_0 == "userdata" then
		slot_0_141_1.viewangles = {
			slot_216_17_0.x,
			slot_216_17_0.y
		}
	end

	slot_0_141_1.weapon = slot_0_142_1.weapon
	slot_0_141_1.duck = slot_0_142_1.duck
	slot_216_19_0 = slot_0_142_1.throw_points or slot_0_142_1.points

	if slot_216_19_0 ~= nil and #slot_216_19_0 > 4 then
		for iter_216_0, iter_216_1 in slot_0_49_0(slot_216_19_0) do
			if slot_0_51_0(iter_216_1) == "userdata" then
				slot_216_19_0[iter_216_0] = {
					iter_216_1.x,
					iter_216_1.y,
					iter_216_1.z
				}
			end
		end
	end

	slot_0_141_1.points = slot_0_142_1.points
	slot_0_141_1.end_position = slot_0_142_1.end_position
	slot_0_141_1.movement = slot_0_142_1.movement
	slot_0_141_1.settings = slot_0_142_1.settings

	slot_0_154_0()
	slot_0_82_0(0.3, slot_0_155_0, true)
end

slot_0_157_1 = nil
slot_0_158_2 = {
	weapon_molotov = "slot10",
	weapon_flashbang = "slot7",
	weapon_wallbang = "slot2; slot1",
	weapon_hegrenade = "slot6",
	weapon_decoy = "slot9",
	weapon_knife = "slot3",
	weapon_smokegrenade = "slot8"
}
slot_0_159_5 = nil

function slot_0_157_0(arg_217_0)
	local var_217_0 = slot_0_26_0()

	if var_217_0 == nil or not var_217_0:IsAlive() then
		return
	end

	local var_217_1 = var_217_0:GetActiveWeapon()

	if var_217_1 == nil then
		return
	end

	local var_217_2 = slot_0_113_0(var_217_1)

	arg_217_0 = slot_0_51_0(arg_217_0) == "table" and arg_217_0.position ~= nil and arg_217_0 or slot_0_141_1

	if arg_217_0 == nil then
		return
	end

	local var_217_3 = arg_217_0.position
	local var_217_4 = arg_217_0.viewangles
	local var_217_5 = arg_217_0.weapon

	if var_217_3 == nil or var_217_4 == nil or var_217_5 == nil then
		return
	end

	if slot_0_159_5 == nil then
		slot_0_159_5 = slot_0_129_0:get()
	end

	slot_0_129_0:set(false)
	slot_0_82_0(0.05, function()
		slot_0_3_0:ClientCmd("sv_cheats true; sv_maxspeed 0")
		slot_0_3_0:ClientCmd(slot_0_39_0("noclip off; setpos %s %s %s 100 0; setang %s %s 0 0;", var_217_3[1], var_217_3[2], var_217_3[3] + 10, var_217_4[1], var_217_4[2]))

		if var_217_2 ~= var_217_5 then
			local var_218_0 = slot_0_158_2[var_217_5] or ""

			slot_0_82_0(0.05, slot_0_3_0.ClientCmd, slot_0_3_0, var_218_0)
		end

		slot_0_82_0(0.05, function()
			slot_0_3_0:ClientCmd("sv_maxspeed 320")

			if slot_0_159_5 ~= nil then
				slot_0_129_0:set(slot_0_159_5)

				slot_0_159_5 = nil
			end
		end)
	end)
end

slot_0_107_0.location_teleport:set_callback(slot_0_157_0)
slot_0_107_0.location_teleport_hotkey:set_callback(function(arg_220_0)
	if not arg_220_0:get_hotkey_state() then
		return
	end

	slot_0_157_0()
end)

slot_0_158_1 = nil
slot_0_159_4 = nil

function slot_0_160_2()
	slot_0_158_1 = nil
	slot_0_159_4 = nil

	if slot_0_141_1 == nil then
		return
	end

	local var_221_0 = slot_0_26_0()

	if var_221_0 == nil or not var_221_0:IsAlive() then
		return
	end

	local var_221_1 = var_221_0:GetActiveWeapon()

	if var_221_1 == nil then
		return
	end

	local var_221_2 = slot_0_113_0(var_221_1)

	if var_221_2 == nil then
		return
	end

	local var_221_3 = var_221_0:GetAbsOrigin()
	local var_221_4 = slot_0_2_0(slot_0_1_0)
	local var_221_5 = var_221_0.m_pMovementServices:Get().m_flDuckAmount:Get()

	if var_221_2 == "weapon_wallbang" then
		if var_221_1:GetDefIndex() ~= 9 then
			return slot_0_75_0("Wallbangs can only be created with AWP")
		end

		local var_221_6 = var_221_1:GetData().m_flRange:Get()

		slot_0_158_1 = var_221_0:GetEyePos()
		slot_0_159_4 = slot_0_158_1 + slot_0_14_0(var_221_4) * slot_0_8_0(var_221_6, var_221_6, var_221_6)
	end

	slot_0_141_1.position = {
		var_221_3.x,
		var_221_3.y,
		var_221_3.z
	}
	slot_0_141_1.viewangles = {
		var_221_4.x,
		var_221_4.y
	}
	slot_0_141_1.weapon = var_221_2
	slot_0_141_1.duck = var_221_5 == 1 or nil
	slot_0_141_1.points = nil
	slot_0_141_1.end_position = nil

	if var_221_2 == "weapon_wallbang" then
		slot_0_107_0.location_type:set(2)
	else
		slot_0_107_0.location_type:set(1)
	end

	slot_0_147_0(slot_0_145_0, true)
end

events.createMove:Add(function(arg_222_0)
	if slot_0_158_1 == nil or slot_0_159_4 == nil then
		return
	end

	local var_222_0 = slot_0_26_0()

	if var_222_0 == nil or not var_222_0:IsAlive() then
		slot_0_158_1 = nil
		slot_0_159_4 = nil

		return
	end

	local var_222_1 = var_222_0:GetActiveWeapon()

	if var_222_1 == nil then
		slot_0_158_1 = nil
		slot_0_159_4 = nil

		return
	end

	local var_222_2 = var_222_1:GetData()
	local var_222_3, var_222_4 = mods.penetration.FireBullet(slot_0_158_1, slot_0_159_4 - slot_0_158_1, var_222_1, nil)
	local var_222_5 = var_222_4:GetHitPosCount()

	if var_222_5 == 0 then
		slot_0_158_1 = nil
		slot_0_159_4 = nil

		return
	end

	local var_222_6 = var_222_4:GetHitPos(var_222_5 - 1)

	if var_222_6 == nil then
		slot_0_158_1 = nil
		slot_0_159_4 = nil

		return
	end

	slot_0_141_1.end_position = {
		var_222_6.x,
		var_222_6.y,
		var_222_6.z
	}
	slot_0_158_1 = nil
	slot_0_159_4 = nil
end)
slot_0_107_0.location_set_position:set_callback(slot_0_160_2)
slot_0_107_0.location_set_position_hotkey:set_callback(function(arg_223_0)
	if not arg_223_0:get_hotkey_state() then
		return
	end

	slot_0_160_2()
end)

slot_0_158_0 = 0

slot_0_107_0.location_export:set_callback(function()
	if slot_0_146_0 == nil or slot_0_144_4 == nil or slot_0_143_1 == nil then
		return
	end

	local var_224_0 = slot_0_104_0().sources[slot_0_144_4].locations[slot_0_111_0]

	if var_224_0 == nil then
		return
	end

	local var_224_1 = var_224_0[slot_0_143_1]

	if var_224_1 == nil then
		return
	end

	local var_224_2 = utils.JsonEncode(var_224_1)

	utils.ClipboardSet(var_224_2)
	slot_0_75_0("Location Copied to Clipboard!")
end)
slot_0_107_0.location_delete_confirm:set_callback(function()
	if slot_0_146_0 == nil or slot_0_144_4 == nil or slot_0_143_1 == nil then
		return
	end

	if slot_0_141_1 == nil then
		return
	end

	local var_225_0 = slot_0_141_1.name
	local var_225_1 = slot_0_104_0()
	local var_225_2 = var_225_1.sources[slot_0_144_4].locations[slot_0_111_0]

	slot_0_45_0(var_225_2, slot_0_143_1)
	slot_0_105_0(var_225_1)

	local var_225_3 = slot_0_146_0.locations[slot_0_111_0]

	slot_0_45_0(var_225_3, slot_0_143_1)

	slot_0_158_0 = 0
	slot_0_149_0 = false

	slot_0_107_0.source_locations:reset()
	slot_0_75_0(slot_0_39_0("Location '%s' Deleted!", var_225_0))
end)

slot_0_159_3 = game.cvar:Find("sv_airaccelerate")

slot_0_107_0.location_save:set_callback(function()
	if slot_0_141_1 == nil then
		return
	end

	local var_226_0 = slot_0_141_1.position
	local var_226_1 = slot_0_141_1.viewangles
	local var_226_2 = slot_0_141_1.weapon

	if var_226_0 == nil or var_226_1 == nil or var_226_2 == nil then
		return
	end

	if slot_0_144_4 == nil then
		return
	end

	if slot_0_141_1.movement ~= nil then
		slot_0_141_1.description = slot_0_39_0("sv_airaccelerate %s", slot_0_159_3.value)
	end

	local var_226_3 = slot_0_104_0()
	local var_226_4 = var_226_3.sources[slot_0_144_4].locations

	if slot_0_143_1 == nil then
		local var_226_5 = var_226_4[slot_0_111_0]

		if var_226_5 == nil then
			var_226_5 = {}
			var_226_4[slot_0_111_0] = var_226_5
		end

		var_226_5[#var_226_5 + 1] = slot_0_141_1
	else
		var_226_4[slot_0_111_0][slot_0_143_1] = slot_0_141_1
	end

	slot_0_105_0(var_226_3)

	local var_226_6 = slot_0_146_0.locations
	local var_226_7 = slot_0_90_0(slot_0_141_1)

	if slot_0_143_1 == nil then
		local var_226_8 = var_226_6[slot_0_111_0]

		if var_226_8 == nil then
			var_226_8 = {}
			var_226_6[slot_0_111_0] = var_226_8
		end

		var_226_8[#var_226_8 + 1] = var_226_7
	else
		var_226_6[slot_0_111_0][slot_0_143_1] = var_226_7
	end

	slot_0_142_1 = var_226_7
	slot_0_158_0 = 0
	slot_0_149_0 = false

	slot_0_107_0.source_locations:reset()
	slot_0_75_0(slot_0_39_0("Location '%s' Saved!", slot_0_141_1.name))
end)

function slot_0_159_2(arg_227_0, arg_227_1)
	return arg_227_0.distance < arg_227_1.distance
end

function slot_0_160_1(arg_228_0, arg_228_1, arg_228_2)
	return arg_228_0.x >= arg_228_1.x and arg_228_0.x <= arg_228_1.x + arg_228_2.x and arg_228_0.y >= arg_228_1.y and arg_228_0.y <= arg_228_1.y + arg_228_2.y
end

function slot_0_161_1()
	local var_229_0 = gui.input:Cursor()
	local var_229_1 = slot_0_107_0.source_locations.item
	local var_229_2 = var_229_1:GetPosAbs()
	local var_229_3 = var_229_1.size

	return slot_0_160_1(var_229_0, var_229_2, var_229_3)
end

function slot_0_162_1()
	if slot_0_144_4 == nil or slot_0_146_0 == nil then
		slot_0_141_1 = nil
		slot_0_142_1 = nil
		slot_0_143_1 = nil

		return
	end

	if slot_0_111_0 == nil then
		slot_0_141_1 = nil
		slot_0_142_1 = nil
		slot_0_143_1 = nil

		return
	end

	local var_230_0 = game.globalVars.m_flRenderFrameTime

	slot_0_158_0 = slot_0_158_0 - var_230_0

	if slot_0_158_0 > 0 then
		return
	end

	slot_0_158_0 = 0.2

	if slot_0_161_1() or slot_0_107_0.source_locations:get() > 0 then
		return
	end

	local var_230_1 = slot_0_26_0()

	if var_230_1 == nil or not var_230_1:IsAlive() then
		return
	end

	local var_230_2 = var_230_1:GetActiveWeapon()

	if var_230_2 == nil then
		return
	end

	local var_230_3 = slot_0_113_0(var_230_2)
	local var_230_4 = slot_0_146_0.locations[slot_0_111_0]

	if var_230_4 == nil then
		var_230_4 = {}
	end

	local var_230_5 = {}

	for iter_230_0, iter_230_1 in slot_0_49_0(var_230_4) do
		if iter_230_1.weapon == var_230_3 then
			var_230_5[#var_230_5 + 1] = iter_230_1
		end

		iter_230_1.index = iter_230_0
	end

	local var_230_6 = var_230_1:GetAbsOrigin()

	for iter_230_2, iter_230_3 in slot_0_49_0(var_230_5) do
		local var_230_7 = iter_230_3.position

		if slot_0_51_0(var_230_7) == "table" then
			var_230_7 = slot_0_8_0(var_230_7[1], var_230_7[2], var_230_7[3])
		end

		iter_230_3.distance = slot_0_10_0(var_230_6, var_230_7)
	end

	slot_0_46_0(var_230_5, slot_0_159_2)

	local var_230_8 = #var_230_5
	local var_230_9 = {}

	var_230_9[1] = "+ Create New"
	slot_0_148_0 = {}
	slot_0_148_0[1] = "create_new"

	for iter_230_4 = 1, var_230_8 do
		local var_230_10 = var_230_5[iter_230_4]
		local var_230_11 = var_230_10.name

		var_230_11 = slot_0_51_0(var_230_11) == "table" and var_230_11[2] or var_230_11
		var_230_9[#var_230_9 + 1] = var_230_11
		slot_0_148_0[#slot_0_148_0 + 1] = var_230_10
	end

	slot_0_107_0.source_locations:update(var_230_9)
end

events.createMove:Add(slot_0_162_1)

function slot_0_159_1(arg_231_0)
	slot_0_149_0 = false

	local var_231_0 = slot_0_107_0.source_locations:get() + 1

	slot_0_142_1 = slot_0_148_0[var_231_0]

	if slot_0_142_1 == nil then
		return
	end

	if slot_0_142_1 == "create_new" then
		slot_0_143_1 = nil
	else
		slot_0_143_1 = slot_0_142_1.index
	end

	slot_0_156_0()
end

slot_0_107_0.source_locations:set_callback(function()
	slot_0_82_0(0.01, slot_0_159_1)
end)
slot_0_107_0.editing_sources:set_callback(function()
	slot_0_82_0(0.01, slot_0_159_1)
end)

slot_0_159_0 = nil
slot_0_160_0 = nil
slot_0_161_0 = nil
slot_0_162_0 = nil
slot_0_163_0 = false
slot_0_164_0 = false
slot_0_165_0 = false
slot_0_166_0 = false
slot_0_167_0 = false
slot_0_168_0 = false
slot_0_169_0 = {
	weapon_molotov = 2,
	weapon_hegrenade = 0,
	weapon_decoy = 3,
	weapon_flashbang = 1,
	weapon_smokegrenade = 4
}

function slot_0_170_0()
	slot_0_159_0 = nil
	slot_0_160_0 = nil
	slot_0_161_0 = nil
	slot_0_162_0 = nil
	slot_0_163_0 = false
	slot_0_164_0 = false
	slot_0_165_0 = false
	slot_0_166_0 = false
	slot_0_167_0 = false
	slot_0_168_0 = false
end

events.createMove:Add(function(arg_235_0)
	local var_235_0 = slot_0_26_0()

	if var_235_0 == nil or not var_235_0:IsAlive() then
		return slot_0_170_0()
	end

	if slot_0_144_4 == nil or slot_0_146_0 == nil then
		return slot_0_170_0()
	end

	if slot_0_111_0 == nil then
		return slot_0_170_0()
	end

	if slot_0_141_1 == nil then
		return slot_0_170_0()
	end

	if slot_0_160_0 == nil then
		if slot_0_121_0 == nil then
			return slot_0_170_0()
		end

		slot_0_160_0 = slot_0_121_0.location

		local var_235_1 = slot_0_160_0.position
		local var_235_2 = slot_0_141_1.position

		if var_235_2 == nil then
			slot_0_160_0 = nil

			return
		end

		if slot_0_51_0(var_235_2) == "table" then
			var_235_2 = slot_0_8_0(var_235_2[1], var_235_2[2], var_235_2[3])
		end

		if var_235_1.x ~= var_235_2.x or var_235_1.y ~= var_235_2.y or var_235_1.z ~= var_235_2.z then
			slot_0_160_0 = nil

			return
		end

		local var_235_3 = slot_0_160_0.viewangles
		local var_235_4 = slot_0_141_1.viewangles

		if slot_0_51_0(var_235_4) == "table" then
			var_235_4 = slot_0_8_0(var_235_4[1], var_235_4[2], 0)
		end

		if var_235_4 == nil then
			slot_0_160_0 = nil

			return
		end

		if var_235_3.x ~= var_235_4.x or var_235_3.y ~= var_235_4.y then
			slot_0_160_0 = nil

			return
		end
	end

	if slot_0_162_0 == nil then
		local var_235_5 = slot_0_160_0.weapon
		local var_235_6 = slot_0_169_0[var_235_5]
		local var_235_7 = game.globalVars.m_flCurTime

		entities.projectiles:ForEach(function(arg_236_0)
			local var_236_0 = arg_236_0.entity

			if var_236_0:GetGrenadeType() == var_235_6 then
				slot_0_161_0 = var_235_6

				local var_236_1 = var_236_0.m_flCreateTime:Get().value

				if var_235_7 - var_236_1 == 0.015625 then
					slot_0_162_0 = arg_236_0.handle
				end
			end
		end)

		if slot_0_162_0 == nil then
			return
		end
	end

	local var_235_8 = slot_0_162_0 ~= nil and slot_0_162_0:Get() or nil

	if slot_0_161_0 == 0 and slot_0_167_0 then
		var_235_8 = nil
		slot_0_162_0 = nil
	end

	if slot_0_161_0 == 1 and slot_0_166_0 then
		var_235_8 = nil
		slot_0_162_0 = nil
	end

	if slot_0_161_0 == 3 and slot_0_165_0 then
		var_235_8 = nil
		slot_0_162_0 = nil
	end

	if slot_0_161_0 == 4 and slot_0_164_0 then
		var_235_8 = nil
		slot_0_162_0 = nil
	end

	if var_235_8 == nil then
		if slot_0_161_0 == 2 and not slot_0_163_0 then
			slot_0_159_0 = nil
		end

		if slot_0_159_0 ~= nil then
			for iter_235_0 = #slot_0_159_0 - 1, 1, -1 do
				if iter_235_0 % 2 == 1 then
					slot_0_45_0(slot_0_159_0, iter_235_0)
				end
			end

			slot_0_160_0.points = slot_0_159_0
			slot_0_160_0.detonate_position = slot_0_159_0[#slot_0_159_0]

			local var_235_9 = {}
			local var_235_10 = #slot_0_159_0

			for iter_235_1 = 1, var_235_10 do
				local var_235_11 = slot_0_159_0[iter_235_1]

				var_235_9[iter_235_1] = {
					var_235_11.x,
					var_235_11.y,
					var_235_11.z
				}
			end

			slot_0_141_1.points = var_235_9
		end

		return slot_0_170_0()
	end

	if slot_0_159_0 == nil then
		slot_0_159_0 = {}
	end

	local var_235_12 = slot_0_160_0.position
	local var_235_13 = var_235_8:GetAbsOrigin()

	if slot_0_10_0(var_235_12, var_235_13) > 75 then
		slot_0_159_0[#slot_0_159_0 + 1] = var_235_13
	end
end)
mods.events:AddListener("inferno_startburn")
mods.events:AddListener("smokegrenade_detonate")
mods.events:AddListener("decoy_started")
mods.events:AddListener("flashbang_detonate")
mods.events:AddListener("hegrenade_detonate")
events.event:Add(function(arg_237_0)
	local var_237_0 = arg_237_0:GetName()

	if var_237_0 == "inferno_startburn" and slot_0_159_0 ~= nil then
		slot_0_159_0[#slot_0_159_0 + 1] = slot_0_8_0(arg_237_0:GetFloat("x"), arg_237_0:GetFloat("y"), arg_237_0:GetFloat("z"))
		slot_0_163_0 = true
	end

	if var_237_0 == "smokegrenade_detonate" and slot_0_159_0 ~= nil then
		slot_0_164_0 = true
	end

	if var_237_0 == "decoy_started" and slot_0_159_0 ~= nil then
		slot_0_165_0 = true
	end

	if var_237_0 == "flashbang_detonate" and slot_0_159_0 ~= nil then
		slot_0_166_0 = true
	end

	if var_237_0 == "hegrenade_detonate" and slot_0_159_0 ~= nil then
		slot_0_167_0 = true
	end
end)

slot_0_141_0 = "https://vhelper.xyz/ft-cs2/helper/api"
slot_0_142_0 = {}

function slot_0_143_0()
	slot_0_79_0(slot_0_141_0 .. "/products", {
		headers = slot_0_91_0
	}, function(arg_239_0, arg_239_1)
		print(arg_239_0)

		if arg_239_0 ~= 200 or arg_239_1 == nil then
			return
		end

		slot_0_142_0 = utils.JsonDecode(arg_239_1)

		local var_239_0 = {}

		var_239_0[#var_239_0 + 1] = "+ Upload New"

		for iter_239_0 = 1, #slot_0_142_0 do
			local var_239_1 = slot_0_142_0[iter_239_0]
			local var_239_2 = var_239_1.author

			if var_239_2 == slot_0_72_0 then
				var_239_2 = "\fFFFFFFFF" .. var_239_2
			end

			var_239_0[#var_239_0 + 1] = slot_0_39_0("%s / %s\b / %d locations", var_239_1.name, var_239_2, var_239_1.total_locations)
		end

		slot_0_107_0.cloud_sources:update(var_239_0)

		slot_0_107_0.cloud_sources.control.showSpinner = false

		slot_0_107_0.cloud_sources:set(slot_0_107_0.cloud_sources:get())
	end)
end

slot_0_143_0()
slot_0_107_0.cloud_sources:set_callback(function(arg_240_0)
	local var_240_0 = arg_240_0:get()
	local var_240_1 = var_240_0 == 0
	local var_240_2 = slot_0_142_0[var_240_0]
	local var_240_3 = var_240_2 ~= nil and var_240_2.author == slot_0_72_0 or false

	slot_0_82_0(0.15, function()
		slot_0_107_0.cloud_sources_upload_source:visibility(var_240_1 or var_240_3)
		slot_0_107_0.cloud_sources_upload:visibility(var_240_1)
		slot_0_107_0.cloud_sources_delete:visibility(not var_240_1 and var_240_3)
		slot_0_107_0.cloud_sources_get:visibility(not var_240_1)
	end)
end, true)

slot_0_144_3 = 0

slot_0_107_0.cloud_sources_upload:set_callback(function()
	local var_242_0 = utils.GetUnixTime()

	if var_242_0 - slot_0_144_3 < 5 then
		return slot_0_75_0("Too many requests")
	end

	slot_0_144_3 = var_242_0

	local var_242_1 = slot_0_107_0.cloud_sources_upload_source:get() + 3
	local var_242_2 = slot_0_104_0().sources[var_242_1]

	if var_242_2 == nil then
		return
	end

	local var_242_3 = {
		author = slot_0_72_0,
		name = var_242_2.name,
		locations = var_242_2.locations
	}
	local var_242_4 = slot_0_85_0.pack(var_242_3)
	local var_242_5 = slot_0_89_0("upload", var_242_4)
	local var_242_6 = {
		["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
		["helper-signature"] = var_242_5
	}

	slot_0_80_0(slot_0_141_0 .. "/upload", {
		contentType = "application/msgpack",
		headers = var_242_6,
		data = var_242_4
	}, function(arg_243_0, arg_243_1)
		if arg_243_0 ~= 200 or arg_243_1 == nil then
			return
		end

		local var_243_0 = utils.JsonDecode(arg_243_1)

		if slot_0_51_0(var_243_0) ~= "table" then
			return
		end

		if var_243_0.success then
			slot_0_75_0("Upload: " .. var_243_0.text)

			return slot_0_143_0()
		end

		slot_0_75_0("Upload error: " .. var_243_0.text)
	end)
end)

slot_0_144_2 = 0

slot_0_107_0.cloud_sources_delete:set_callback(function()
	local var_244_0 = utils.GetUnixTime()

	if var_244_0 - slot_0_144_2 < 5 then
		return slot_0_75_0("Too many requests")
	end

	slot_0_144_2 = var_244_0

	local var_244_1 = slot_0_107_0.cloud_sources:get()

	if var_244_1 == 0 then
		return
	end

	local var_244_2 = slot_0_142_0[var_244_1]

	if var_244_2 == nil then
		return
	end

	if not (var_244_2.author == slot_0_72_0) then
		return
	end

	local var_244_3 = var_244_2.id
	local var_244_4 = {
		id = var_244_3,
		author = slot_0_72_0,
		name = var_244_2.name
	}
	local var_244_5 = slot_0_85_0.pack(var_244_4)
	local var_244_6 = slot_0_89_0("delete", var_244_5)
	local var_244_7 = {
		["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
		["helper-signature"] = var_244_6
	}

	slot_0_80_0(slot_0_141_0 .. "/delete", {
		contentType = "application/msgpack",
		headers = var_244_7,
		data = var_244_5
	}, function(arg_245_0, arg_245_1)
		if arg_245_0 ~= 200 or arg_245_1 == nil then
			return
		end

		local var_245_0 = utils.JsonDecode(arg_245_1)

		if slot_0_51_0(var_245_0) ~= "table" then
			return
		end

		if var_245_0.success then
			slot_0_75_0("Delete: " .. var_245_0.text)

			return slot_0_143_0()
		end

		slot_0_75_0("Delete error: " .. var_245_0.text)
	end)
end)

slot_0_144_1 = 0

slot_0_107_0.cloud_sources_update:set_callback(function()
	local var_246_0 = utils.GetUnixTime()

	if var_246_0 - slot_0_144_1 < 5 then
		return slot_0_75_0("Too many requests")
	end

	slot_0_144_1 = var_246_0

	local var_246_1 = slot_0_107_0.cloud_sources:get()

	if var_246_1 == 0 then
		return
	end

	local var_246_2 = slot_0_142_0[var_246_1]

	if var_246_2 == nil then
		return
	end

	if not (var_246_2.author == slot_0_72_0) then
		return
	end

	local var_246_3 = var_246_2.id
	local var_246_4 = slot_0_107_0.cloud_sources_upload_source:get() + 3
	local var_246_5 = slot_0_104_0().sources[var_246_4]

	if var_246_5 == nil then
		return
	end

	local var_246_6 = {
		id = var_246_3,
		author = slot_0_72_0,
		name = var_246_5.name,
		locations = var_246_5.locations
	}
	local var_246_7 = slot_0_85_0.pack(var_246_6)
	local var_246_8 = slot_0_89_0("update", var_246_7)
	local var_246_9 = {
		["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36",
		["helper-signature"] = var_246_8
	}

	slot_0_80_0(slot_0_141_0 .. "/update", {
		contentType = "application/msgpack",
		headers = var_246_9,
		data = var_246_7
	}, function(arg_247_0, arg_247_1)
		if arg_247_0 ~= 200 or arg_247_1 == nil then
			return
		end

		local var_247_0 = utils.JsonDecode(arg_247_1)

		if slot_0_51_0(var_247_0) ~= "table" then
			return
		end

		if var_247_0.success then
			slot_0_75_0("Update: " .. var_247_0.text)

			return slot_0_143_0()
		end

		slot_0_75_0("Update error: " .. var_247_0.text)
	end)
end)

slot_0_144_0 = 0

slot_0_107_0.cloud_sources_get:set_callback(function()
	local var_248_0 = utils.GetUnixTime()

	if var_248_0 - slot_0_144_0 < 5 then
		return slot_0_75_0("Too many requests")
	end

	slot_0_144_0 = var_248_0

	local var_248_1 = slot_0_107_0.cloud_sources:get()

	if var_248_1 == 0 then
		return
	end

	local var_248_2 = slot_0_142_0[var_248_1]

	if var_248_2 == nil then
		return
	end

	slot_0_79_0(slot_0_141_0 .. "/product?id=" .. var_248_2.id, {
		headers = slot_0_91_0
	}, function(arg_249_0, arg_249_1)
		if arg_249_0 ~= 200 or arg_249_1 == nil then
			return
		end

		local var_249_0 = utils.JsonDecode(arg_249_1)

		if slot_0_51_0(var_249_0) ~= "table" then
			return
		end

		if var_249_0.success then
			local var_249_1 = var_249_0.source
			local var_249_2 = slot_0_104_0()
			local var_249_3 = var_249_2.sources
			local var_249_4 = var_249_1.name
			local var_249_5 = var_249_4
			local var_249_6 = 2
			local var_249_7 = slot_0_139_0(var_249_3)

			while var_249_7[var_249_5] do
				var_249_5 = slot_0_39_0("%s (%d)", var_249_4, var_249_6)
				var_249_6 = var_249_6 + 1
			end

			var_249_3[#var_249_3 + 1] = {
				name = var_249_5,
				locations = var_249_1.locations,
				author = var_249_1.author
			}

			slot_0_105_0(var_249_2)
			slot_0_140_0(var_249_2)

			return
		end

		slot_0_75_0("Get error: " .. var_249_0.text)
	end)
end)
