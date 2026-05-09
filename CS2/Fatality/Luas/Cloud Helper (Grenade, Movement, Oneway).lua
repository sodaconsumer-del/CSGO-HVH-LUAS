--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

if not ws.TestCapability("ffi") or not ws.TestCapability("clipboard") or not ws.TestCapability("http") then
	return error("[Helper] Please grant all permissions for the script.")
end

slot_0_0_0 = game.input
slot_0_1_0 = slot_0_0_0.GetViewAngles
slot_0_2_0 = game.engine
slot_0_3_0 = draw.Color
slot_0_4_0 = slot_0_3_0.Interpolate
slot_0_5_0 = draw.Vec2
slot_0_6_0 = draw.Rect
slot_0_7_0 = Vector
slot_0_8_0 = slot_0_7_0()
slot_0_9_0 = slot_0_8_0.Dist
slot_0_10_0 = slot_0_8_0.Dist2d
slot_0_11_0 = slot_0_8_0.Length
slot_0_12_0 = slot_0_8_0.Length2d
slot_0_13_0 = slot_0_8_0.GetForward
slot_0_14_0 = draw.surface
slot_0_15_0 = slot_0_14_0.g
slot_0_16_0 = slot_0_15_0.SetTexture
slot_0_17_0 = slot_0_14_0.AddRect
slot_0_18_0 = slot_0_14_0.AddRectFilled
slot_0_19_0 = slot_0_14_0.OverrideClipRect
slot_0_20_0 = slot_0_14_0.AddText
slot_0_21_0 = slot_0_14_0.AddCircleFilled
slot_0_22_0 = math.WorldToScreen
slot_0_23_0 = math.AngleNormalize
slot_0_24_0 = math.VectorAngles
slot_0_25_0 = entities.GetLocalPawn
slot_0_26_0 = math.min
slot_0_27_0 = math.max
slot_0_28_0 = math.floor
slot_0_29_0 = math.pow
slot_0_30_0 = math.cos
slot_0_31_0 = math.sin
slot_0_32_0 = math.atan2
slot_0_33_0 = math.abs
slot_0_34_0 = math.rad
slot_0_35_0 = math.pi
slot_0_36_0 = string.gsub
slot_0_37_0 = string.sub
slot_0_38_0 = string.format
slot_0_39_0 = string.find
slot_0_40_0 = string.char
slot_0_41_0 = string.upper
slot_0_42_0 = string.byte
slot_0_43_0 = string.rep
slot_0_44_0 = table.remove
slot_0_45_0 = table.sort
slot_0_46_0 = table.concat
slot_0_47_0 = table.insert
slot_0_48_0 = ipairs
slot_0_49_0 = pairs
slot_0_50_0 = type
slot_0_51_0 = tostring
slot_0_52_0 = tonumber
slot_0_53_0 = ffi.cast
slot_0_54_0 = ffi.new
slot_0_55_0 = ffi.copy
slot_0_56_0 = bit.band
slot_0_57_0 = ffi.typeof("    struct {\n        float x;\n        float y;\n        float z;\n    }\n")
slot_0_58_0 = ffi.typeof("    struct {\n        float x;\n        float y;\n        float z;\n        float w;\n    }\n")
slot_0_59_0 = InputBitMask_t.IN_ATTACK
slot_0_60_0 = InputBitMask_t.IN_ATTACK2
slot_0_61_0 = InputBitMask_t.IN_JUMP
slot_0_62_0 = InputBitMask_t.IN_DUCK
slot_0_63_0 = InputBitMask_t.IN_FORWARD
slot_0_64_0 = InputBitMask_t.IN_BACK
slot_0_65_0 = InputBitMask_t.IN_TURNLEFT
slot_0_66_0 = InputBitMask_t.IN_TURNRIGHT
slot_0_67_0 = InputBitMask_t.IN_MOVELEFT
slot_0_68_0 = InputBitMask_t.IN_MOVERIGHT
slot_0_69_0 = InputBitMask_t.IN_SPEED
slot_0_70_0 = {
	slot_0_59_0,
	slot_0_60_0,
	slot_0_61_0,
	slot_0_62_0,
	slot_0_63_0,
	slot_0_64_0,
	slot_0_65_0,
	slot_0_66_0,
	slot_0_67_0,
	slot_0_68_0,
	slot_0_69_0
}
slot_0_71_0 = gui.ctx.user.username
slot_0_72_1 = nil
slot_0_73_2 = utils.FindExport("shell32.dll", "ShellExecuteA")
slot_0_73_1 = slot_0_53_0("int(__thiscall*)(void*, const char*, const char*, const char*, const char*, int)", slot_0_73_2)

function slot_0_72_0(arg_1_0)
	slot_0_73_1(nil, "open", arg_1_0, nil, nil, 1)
end

function slot_0_73_0(arg_2_0, arg_2_1)
	local var_2_0 = utils.FindPattern(arg_2_0, arg_2_1)

	if var_2_0 == 0 then
		return
	end

	return var_2_0
end

function slot_0_74_0(arg_3_0)
	local var_3_0 = gui.Notification("Helper", arg_3_0)

	gui.notify:Add(var_3_0)
end

slot_0_75_1 = nil
slot_0_76_3 = {}

function slot_0_75_0(arg_4_0)
	slot_0_76_3[#slot_0_76_3 + 1] = arg_4_0
end

function __shutdown()
	for iter_5_0, iter_5_1 in slot_0_48_0(slot_0_76_3) do
		iter_5_1()
	end
end

slot_0_76_2 = nil
slot_0_77_2 = nil
slot_0_76_1 = utils.FindExport("kernel32.dll", "GetModuleHandleA")
slot_0_76_0 = slot_0_53_0("void*(__thiscall*)(const char*)", slot_0_76_1)
slot_0_77_1 = utils.FindExport("kernel32.dll", "GetProcAddress")
slot_0_77_0 = slot_0_53_0("void*(__thiscall*)(void*, const char*)", slot_0_77_1)
slot_0_78_1 = nil
slot_0_79_1 = nil
slot_0_80_1 = nil
slot_0_81_1 = nil

function slot_0_78_0(arg_6_0, arg_6_1)
	local var_6_0 = slot_0_76_0(arg_6_0)

	if var_6_0 == nil then
		return
	end

	local var_6_1 = slot_0_77_0(var_6_0, "CreateInterface")

	if var_6_1 == nil then
		return
	end

	return slot_0_53_0("void*(__thiscall*)(const char*, int)", var_6_1)(arg_6_1, 0)
end

slot_0_82_3 = {}

function slot_0_79_0(arg_7_0, arg_7_1, ...)
	slot_0_82_3[#slot_0_82_3 + 1] = {
		delay = arg_7_0,
		callback = arg_7_1,
		args = {
			...
		}
	}
end

events.presentQueue:Add(function()
	local var_8_0 = game.globalVars.m_flRenderFrameTime

	for iter_8_0 = #slot_0_82_3, 1, -1 do
		local var_8_1 = slot_0_82_3[iter_8_0]

		var_8_1.delay = var_8_1.delay - var_8_0

		if var_8_1.delay <= 0 then
			var_8_1.callback(unpack(var_8_1.args))
			table.remove(slot_0_82_3, iter_8_0)
		end
	end
end)

function slot_0_80_0(arg_9_0, arg_9_1, arg_9_2)
	arg_9_2 = arg_9_2 or 0
	arg_9_0 = arg_9_0 + arg_9_1
	arg_9_0 = arg_9_0 + slot_0_53_0("int32_t*", arg_9_0)[0] + 4
	arg_9_0 = arg_9_0 + arg_9_2

	return arg_9_0
end

slot_0_82_2 = game.physicsQueryInterface
slot_0_83_2 = slot_0_82_2.TraceRay
slot_0_84_2 = Ray_t

function slot_0_81_0(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = slot_0_84_2()

	return slot_0_83_2(slot_0_82_2, var_10_0, arg_10_0, arg_10_1)
end

slot_0_82_1 = nil
slot_0_83_1 = nil
slot_0_84_1 = nil
slot_0_85_1 = nil
slot_0_86_1 = nil
slot_0_82_0 = (function()
	local var_11_0 = slot_0_53_0("void(__thiscall*)(void*)", utils.FindExport("msvcrt.dll", "free"))
	local var_11_1 = slot_0_53_0("void*(__thiscall*)(void*, size_t)", utils.FindExport("msvcrt.dll", "realloc"))
	local var_11_2 = slot_0_53_0("void*(__thiscall*)(size_t)", utils.FindExport("msvcrt.dll", "malloc"))
	local var_11_3 = bit.bor
	local var_11_4 = slot_0_56_0
	local var_11_5 = bit.rshift
	local var_11_6 = slot_0_54_0("unsigned char[8]")
	local var_11_7 = slot_0_54_0("unsigned char[8]")
	local var_11_8 = ffi.typeof("unsigned char[?]")
	local var_11_9 = ffi.abi("le")

	local function var_11_10(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = arg_12_2 - 1

		for iter_12_0 = 0, var_12_0 do
			arg_12_0[iter_12_0] = arg_12_1[var_12_0 - iter_12_0]
		end
	end

	local var_11_11 = 8192
	local var_11_12 = {}

	local function var_11_13(arg_13_0)
		arg_13_0.size = 0
		arg_13_0.alloc = var_11_11
		arg_13_0.data = slot_0_53_0("unsigned char *", var_11_2(var_11_11))
	end

	local function var_11_14(arg_14_0)
		var_11_0(var_11_12.data)
	end

	local function var_11_15(arg_15_0, arg_15_1)
		if arg_15_1 > arg_15_0.alloc - arg_15_0.size then
			local var_15_0 = arg_15_0.alloc * 2

			while var_15_0 < arg_15_0.alloc + arg_15_1 do
				var_15_0 = var_15_0 * 2
			end

			arg_15_0.data = slot_0_53_0("unsigned char *", var_11_1(arg_15_0.data, var_15_0))
			arg_15_0.alloc = var_15_0
		end
	end

	local function var_11_16(arg_16_0, arg_16_1, arg_16_2)
		var_11_15(arg_16_0, arg_16_2)
		slot_0_55_0(arg_16_0.data + arg_16_0.size, arg_16_1, arg_16_2)

		arg_16_0.size = arg_16_0.size + arg_16_2
	end

	local function var_11_17(arg_17_0, arg_17_1)
		var_11_15(arg_17_0, 1)

		arg_17_0.data[arg_17_0.size] = arg_17_1
		arg_17_0.size = arg_17_0.size + 1
	end

	local function var_11_18(arg_18_0, arg_18_1)
		local var_18_0 = #arg_18_1

		var_11_15(arg_18_0, var_18_0)

		local var_18_1 = arg_18_0.data + arg_18_0.size - 1

		for iter_18_0 = 1, var_18_0 do
			var_18_1[iter_18_0] = arg_18_1[iter_18_0]
		end

		arg_18_0.size = arg_18_0.size + var_18_0
	end

	local var_11_19
	local var_11_20

	if var_11_9 then
		function var_11_19(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
			local var_19_0 = {
				arg_19_3
			}

			for iter_19_0 = arg_19_2 - 8, 8, -8 do
				var_19_0[#var_19_0 + 1] = var_11_4(var_11_5(arg_19_1, iter_19_0), 255)
			end

			var_19_0[#var_19_0 + 1] = var_11_4(arg_19_1, 255)

			var_11_18(arg_19_0, var_19_0)
		end

		function var_11_20(arg_20_0, arg_20_1, arg_20_2)
			local var_20_0 = slot_0_28_0(arg_20_1 / 4294967296)
			local var_20_1 = arg_20_1 % 4294967296
			local var_20_2 = {
				arg_20_2
			}

			for iter_20_0 = 24, 8, -8 do
				var_20_2[#var_20_2 + 1] = var_11_4(var_11_5(var_20_0, iter_20_0), 255)
			end

			var_20_2[5] = var_11_4(var_20_0, 255)

			for iter_20_1 = 24, 8, -8 do
				var_20_2[#var_20_2 + 1] = var_11_4(var_11_5(var_20_1, iter_20_1), 255)
			end

			var_20_2[9] = var_11_4(var_20_1, 255)

			var_11_18(arg_20_0, var_20_2)
		end
	else
		function var_11_19(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
			local var_21_0 = {
				arg_21_3,
				var_11_4(arg_21_1, 255)
			}

			for iter_21_0 = 8, arg_21_2 - 8, 8 do
				var_21_0[#var_21_0 + 1] = var_11_4(var_11_5(arg_21_1, iter_21_0), 255)
			end

			var_11_18(arg_21_0, var_21_0)
		end

		function var_11_20(arg_22_0, arg_22_1, arg_22_2)
			local var_22_0 = slot_0_28_0(arg_22_1 / 4294967296)
			local var_22_1 = arg_22_1 % 4294967296
			local var_22_2 = {
				arg_22_2,
				var_11_4(var_22_1, 255)
			}

			for iter_22_0 = 8, 24, 8 do
				var_22_2[#var_22_2 + 1] = var_11_4(var_11_5(var_22_1, iter_22_0), 255)
			end

			var_22_2[6] = var_11_4(var_22_0, 255)

			for iter_22_1 = 8, 24, 8 do
				var_22_2[#var_22_2 + 1] = var_11_4(var_11_5(var_22_0, iter_22_1), 255)
			end

			var_11_18(arg_22_0, var_22_2)
		end
	end

	local var_11_21 = {}

	function var_11_21.dynamic(arg_23_0)
		return var_11_21[slot_0_50_0(arg_23_0)](arg_23_0)
	end

	var_11_21["nil"] = function()
		var_11_17(var_11_12, 192)
	end

	function var_11_21.boolean(arg_25_0)
		if arg_25_0 then
			var_11_17(var_11_12, 195)
		else
			var_11_17(var_11_12, 194)
		end
	end

	;(function(arg_26_0)
		local var_26_0
		local var_26_1
		local var_26_2
		local var_26_3
		local var_26_4

		if arg_26_0 == "double" then
			var_26_1, var_26_0 = 203, ffi.typeof("double *")
			var_26_2 = {
				var_26_1,
				127,
				240,
				0,
				0,
				0,
				0,
				0,
				0
			}
			var_26_3 = {
				var_26_1,
				255,
				240,
				0,
				0,
				0,
				0,
				0,
				0
			}
			var_26_4 = {
				var_26_1,
				255,
				248,
				0,
				0,
				0,
				0,
				0,
				0
			}
		elseif arg_26_0 == "float" then
			var_26_1, var_26_0 = 202, ffi.typeof("float *")
			var_26_2 = {
				var_26_1,
				127,
				128,
				0,
				0
			}
			var_26_3 = {
				var_26_1,
				255,
				128,
				0,
				0
			}
			var_26_4 = {
				var_26_1,
				255,
				136,
				0,
				0
			}
		else
			return nil
		end

		local var_26_5 = ffi.sizeof(arg_26_0)

		if var_11_9 then
			function var_11_21.fpnum(arg_27_0)
				slot_0_53_0(var_26_0, var_11_7)[0] = arg_27_0

				var_11_10(var_11_6, var_11_7, var_26_5)
				var_11_17(var_11_12, var_26_1)
				var_11_16(var_11_12, var_11_6, var_26_5)
			end
		else
			function var_11_21.fpnum(arg_28_0)
				slot_0_53_0(var_26_0, var_11_6)[0] = arg_28_0

				var_11_17(var_11_12, var_26_1)
				var_11_16(var_11_12, var_11_6, var_26_5)
			end
		end

		function var_11_21.posinf()
			var_11_18(var_11_12, var_26_2)
		end

		function var_11_21.neginf()
			var_11_18(var_11_12, var_26_3)
		end

		function var_11_21.nan()
			var_11_18(var_11_12, var_26_4)
		end

		return true
	end)("double")

	function var_11_21.number(arg_32_0)
		if slot_0_28_0(arg_32_0) == arg_32_0 then
			if arg_32_0 >= 0 then
				if arg_32_0 < 128 then
					var_11_17(var_11_12, arg_32_0)
				elseif arg_32_0 < 256 then
					var_11_18(var_11_12, {
						204,
						arg_32_0
					})
				elseif arg_32_0 < 65536 then
					var_11_19(var_11_12, arg_32_0, 16, 205)
				elseif arg_32_0 < 4294967296 then
					var_11_19(var_11_12, arg_32_0, 32, 206)
				elseif arg_32_0 == math.huge then
					var_11_21.posinf()
				else
					var_11_20(var_11_12, arg_32_0, 207)
				end
			elseif arg_32_0 >= -32 then
				var_11_17(var_11_12, var_11_3(224, arg_32_0))
			elseif arg_32_0 >= -128 then
				var_11_18(var_11_12, {
					208,
					arg_32_0
				})
			elseif arg_32_0 >= -32768 then
				var_11_19(var_11_12, arg_32_0, 16, 209)
			elseif arg_32_0 >= -2147483648 then
				var_11_19(var_11_12, arg_32_0, 32, 210)
			elseif arg_32_0 == -math.huge then
				var_11_21.neginf()
			else
				var_11_20(var_11_12, arg_32_0, 211)
			end
		elseif arg_32_0 ~= arg_32_0 then
			var_11_21.nan()
		else
			var_11_21.fpnum(arg_32_0)
		end
	end

	function var_11_21.string(arg_33_0)
		local var_33_0 = #arg_33_0

		if var_33_0 < 32 then
			var_11_17(var_11_12, var_11_3(160, var_33_0))
		elseif var_33_0 < 65536 then
			var_11_19(var_11_12, var_33_0, 16, 218)
		elseif var_33_0 < 4294967296 then
			var_11_19(var_11_12, var_33_0, 32, 219)
		else
			error("overflow")
		end

		var_11_16(var_11_12, arg_33_0, var_33_0)
	end

	var_11_21["function"] = function(arg_34_0)
		error("unimplemented", arg_34_0)
	end

	function var_11_21.userdata(arg_35_0)
		return var_11_21.cdata(arg_35_0)
	end

	function var_11_21.thread(arg_36_0)
		error("unimplemented", arg_36_0)
	end

	function var_11_21.array(arg_37_0, arg_37_1)
		arg_37_1 = arg_37_1 or #arg_37_0

		if arg_37_1 < 16 then
			var_11_17(var_11_12, var_11_3(144, arg_37_1))
		elseif arg_37_1 < 65536 then
			var_11_19(var_11_12, arg_37_1, 16, 220)
		elseif arg_37_1 < 4294967296 then
			var_11_19(var_11_12, arg_37_1, 32, 221)
		else
			error("overflow")
		end

		for iter_37_0 = 1, arg_37_1 do
			var_11_21[slot_0_50_0(arg_37_0[iter_37_0])](arg_37_0[iter_37_0])
		end
	end

	function var_11_21.map(arg_38_0, arg_38_1)
		if not arg_38_1 then
			arg_38_1 = 0

			for iter_38_0 in slot_0_49_0(arg_38_0) do
				arg_38_1 = arg_38_1 + 1
			end
		end

		if arg_38_1 < 16 then
			var_11_17(var_11_12, var_11_3(128, arg_38_1))
		elseif arg_38_1 < 65536 then
			var_11_19(var_11_12, arg_38_1, 16, 222)
		elseif arg_38_1 < 4294967296 then
			var_11_19(var_11_12, arg_38_1, 32, 223)
		else
			error("overflow")
		end

		for iter_38_1, iter_38_2 in slot_0_49_0(arg_38_0) do
			var_11_21[slot_0_50_0(iter_38_1)](iter_38_1)
			var_11_21[slot_0_50_0(iter_38_2)](iter_38_2)
		end
	end

	local function var_11_22(arg_39_0)
		function var_11_21.table(arg_40_0)
			local var_40_0, var_40_1 = arg_39_0(arg_40_0)

			var_11_21[var_40_0](arg_40_0, var_40_1)
		end
	end

	local function var_11_23(arg_41_0)
		local var_41_0 = false
		local var_41_1 = 0
		local var_41_2 = 0

		for iter_41_0, iter_41_1 in slot_0_49_0(arg_41_0) do
			if slot_0_50_0(iter_41_0) == "number" and iter_41_0 > 0 and slot_0_28_0(iter_41_0) == iter_41_0 then
				if var_41_2 < iter_41_0 then
					var_41_2 = iter_41_0
				end
			else
				var_41_0 = true
			end

			var_41_1 = var_41_1 + 1
		end

		if var_41_2 ~= var_41_1 then
			var_41_0 = true
		end

		return var_41_0 and "map" or "array", var_41_1
	end

	var_11_22(var_11_23)

	function var_11_21.cdata(arg_42_0)
		local var_42_0 = ffi.sizeof(arg_42_0)

		if not var_42_0 then
			error("cannot pack cdata of unknown size")
		elseif var_42_0 < 65536 then
			var_11_19(var_11_12, var_42_0, 16, 216)
		elseif var_42_0 < 4294967296 then
			var_11_19(var_11_12, var_42_0, 32, 217)
		else
			error("overflow")
		end

		var_11_16(var_11_12, arg_42_0, var_42_0)
	end

	local var_11_24 = {
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

	local function var_11_25(arg_43_0)
		if var_11_24[arg_43_0] then
			return var_11_24[arg_43_0]
		elseif arg_43_0 < 192 then
			if arg_43_0 < 128 then
				return "fixnum_pos"
			elseif arg_43_0 < 144 then
				return "fixmap"
			elseif arg_43_0 < 160 then
				return "fixarray"
			else
				return "fixraw"
			end
		elseif arg_43_0 > 223 then
			return "fixnum_neg"
		else
			return "undefined"
		end
	end

	local var_11_26 = {
		uint32 = 4,
		uint16 = 2,
		double = 8,
		float = 4,
		int32 = 4,
		int16 = 2,
		int64 = 8,
		uint64 = 8
	}
	local var_11_27 = {}
	local var_11_28

	if var_11_9 then
		function var_11_28(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
			var_11_10(var_11_6, arg_44_0.data + arg_44_1 + 1, arg_44_3)

			return slot_0_52_0(slot_0_53_0(arg_44_2, var_11_6)[0])
		end
	else
		function var_11_28(arg_45_0, arg_45_1, arg_45_2)
			return slot_0_52_0(slot_0_53_0(arg_45_2, arg_45_0.data + arg_45_1 + 1)[0])
		end
	end

	local function var_11_29(arg_46_0, arg_46_1)
		local var_46_0 = var_11_25(arg_46_0.data[arg_46_1])
		local var_46_1 = var_11_26[var_46_0]
		local var_46_2

		if var_46_0 == "float" or var_46_0 == "double" then
			var_46_2 = var_46_0 .. " *"
		else
			var_46_2 = var_46_0 .. "_t *"
		end

		if arg_46_1 + var_46_1 >= arg_46_0.size then
			return nil, nil
		end

		return arg_46_1 + var_46_1 + 1, var_11_28(arg_46_0, arg_46_1, var_46_2, var_46_1)
	end

	local function var_11_30(arg_47_0, arg_47_1, arg_47_2)
		local var_47_0 = {}
		local var_47_1
		local var_47_2

		for iter_47_0 = 1, arg_47_2 do
			local var_47_3

			arg_47_1, var_47_3 = var_11_27.dynamic(arg_47_0, arg_47_1)

			if not arg_47_1 then
				return nil, var_47_0
			end

			local var_47_4

			arg_47_1, var_47_4 = var_11_27.dynamic(arg_47_0, arg_47_1)

			if not arg_47_1 then
				return nil, var_47_0
			end

			var_47_0[var_47_3] = var_47_4
		end

		return arg_47_1, var_47_0
	end

	local function var_11_31(arg_48_0, arg_48_1, arg_48_2)
		local var_48_0 = {}

		for iter_48_0 = 1, arg_48_2 do
			arg_48_1, var_48_0[iter_48_0] = var_11_27.dynamic(arg_48_0, arg_48_1)

			if not arg_48_1 then
				return nil, var_48_0
			end
		end

		return arg_48_1, var_48_0
	end

	function var_11_27.dynamic(arg_49_0, arg_49_1)
		assert(arg_49_1, "non nil offset is expected")

		if arg_49_1 >= arg_49_0.size then
			return nil, nil
		end

		local var_49_0 = var_11_25(arg_49_0.data[arg_49_1])

		return var_11_27[var_49_0](arg_49_0, arg_49_1)
	end

	function var_11_27.undefined(arg_50_0, arg_50_1)
		error("unimplemented", arg_50_0, arg_50_1)
	end

	var_11_27["nil"] = function(arg_51_0, arg_51_1)
		return arg_51_1 + 1, nil
	end
	var_11_27["false"] = function(arg_52_0, arg_52_1)
		return arg_52_1 + 1, false
	end
	var_11_27["true"] = function(arg_53_0, arg_53_1)
		return arg_53_1 + 1, true
	end

	function var_11_27.fixnum_pos(arg_54_0, arg_54_1)
		return arg_54_1 + 1, arg_54_0.data[arg_54_1]
	end

	function var_11_27.uint8(arg_55_0, arg_55_1)
		if arg_55_1 + 1 >= arg_55_0.size then
			return nil, nil
		end

		return arg_55_1 + 2, arg_55_0.data[arg_55_1 + 1]
	end

	var_11_27.uint16 = var_11_29
	var_11_27.uint32 = var_11_29
	var_11_27.uint64 = var_11_29

	function var_11_27.fixnum_neg(arg_56_0, arg_56_1)
		return arg_56_1 + 1, slot_0_53_0("int8_t *", arg_56_0.data)[arg_56_1]
	end

	function var_11_27.int8(arg_57_0, arg_57_1)
		if arg_57_1 + 1 >= arg_57_0.size then
			return nil, nil
		end

		return arg_57_1 + 2, slot_0_53_0("int8_t *", arg_57_0.data + arg_57_1 + 1)[0]
	end

	var_11_27.int16 = var_11_29
	var_11_27.int32 = var_11_29
	var_11_27.int64 = var_11_29
	var_11_27.float = var_11_29
	var_11_27.double = var_11_29

	function var_11_27.fixraw(arg_58_0, arg_58_1)
		local var_58_0 = var_11_4(arg_58_0.data[arg_58_1], 31)

		if arg_58_1 + var_58_0 >= arg_58_0.size then
			return nil, nil
		end

		return arg_58_1 + var_58_0 + 1, ffi.string(arg_58_0.data + arg_58_1 + 1, var_58_0)
	end

	function var_11_27.buf16(arg_59_0, arg_59_1)
		if arg_59_1 + 2 >= arg_59_0.size then
			return nil, nil
		end

		local var_59_0 = var_11_28(arg_59_0, arg_59_1, "uint16_t *", 2)

		if arg_59_1 + var_59_0 + 2 >= arg_59_0.size then
			return nil, nil
		end

		local var_59_1 = var_11_8(var_59_0)

		slot_0_55_0(var_59_1, arg_59_0.data + arg_59_1 + 3, var_59_0)

		return arg_59_1 + var_59_0 + 3, var_59_1
	end

	function var_11_27.buf32(arg_60_0, arg_60_1)
		if arg_60_1 + 4 >= arg_60_0.size then
			return nil, nil
		end

		local var_60_0 = var_11_28(arg_60_0, arg_60_1, "uint32_t *", 4)

		if arg_60_1 + var_60_0 + 4 >= arg_60_0.size then
			return nil, nil
		end

		local var_60_1 = var_11_8(var_60_0)

		slot_0_55_0(var_60_1, arg_60_0.data + arg_60_1 + 5, var_60_0)

		return arg_60_1 + var_60_0 + 5, var_60_1
	end

	function var_11_27.raw16(arg_61_0, arg_61_1)
		if arg_61_1 + 2 >= arg_61_0.size then
			return nil, nil
		end

		local var_61_0 = var_11_28(arg_61_0, arg_61_1, "uint16_t *", 2)

		if arg_61_1 + var_61_0 + 2 >= arg_61_0.size then
			return nil, nil
		end

		return arg_61_1 + var_61_0 + 3, ffi.string(arg_61_0.data + arg_61_1 + 3, var_61_0)
	end

	function var_11_27.raw32(arg_62_0, arg_62_1)
		if arg_62_1 + 4 >= arg_62_0.size then
			return nil, nil
		end

		local var_62_0 = var_11_28(arg_62_0, arg_62_1, "uint32_t *", 4)

		if arg_62_1 + var_62_0 + 4 >= arg_62_0.size then
			return nil, nil
		end

		return arg_62_1 + var_62_0 + 5, ffi.string(arg_62_0.data + arg_62_1 + 5, var_62_0)
	end

	function var_11_27.fixarray(arg_63_0, arg_63_1)
		local var_63_0 = var_11_4(arg_63_0.data[arg_63_1], 15)

		return var_11_31(arg_63_0, arg_63_1 + 1, var_63_0)
	end

	function var_11_27.array16(arg_64_0, arg_64_1)
		if arg_64_1 + 2 >= arg_64_0.size then
			return nil, nil
		end

		local var_64_0 = var_11_28(arg_64_0, arg_64_1, "uint16_t *", 2)

		return var_11_31(arg_64_0, arg_64_1 + 3, var_64_0)
	end

	function var_11_27.array32(arg_65_0, arg_65_1)
		if arg_65_1 + 4 >= arg_65_0.size then
			return nil, nil
		end

		local var_65_0 = var_11_28(arg_65_0, arg_65_1, "uint32_t *", 4)

		return var_11_31(arg_65_0, arg_65_1 + 5, var_65_0)
	end

	function var_11_27.fixmap(arg_66_0, arg_66_1)
		local var_66_0 = var_11_4(arg_66_0.data[arg_66_1], 15)

		return var_11_30(arg_66_0, arg_66_1 + 1, var_66_0)
	end

	function var_11_27.map16(arg_67_0, arg_67_1)
		if arg_67_1 + 2 >= arg_67_0.size then
			return nil, nil
		end

		local var_67_0 = var_11_28(arg_67_0, arg_67_1, "uint16_t *", 2)

		return var_11_30(arg_67_0, arg_67_1 + 3, var_67_0)
	end

	function var_11_27.map32(arg_68_0, arg_68_1)
		if arg_68_1 + 4 >= arg_68_0.size then
			return nil, nil
		end

		local var_68_0 = var_11_28(arg_68_0, arg_68_1, "uint32_t *", 4)

		return var_11_30(arg_68_0, arg_68_1 + 5, var_68_0)
	end

	local function var_11_32(arg_69_0)
		var_11_13(var_11_12)
		var_11_21.dynamic(arg_69_0)

		local var_69_0 = ffi.string(var_11_12.data, var_11_12.size)

		var_11_14(var_11_12)

		return var_69_0
	end

	local function var_11_33(arg_70_0, arg_70_1)
		if arg_70_1 == nil then
			arg_70_1 = 0
		end

		if slot_0_50_0(arg_70_0) ~= "string" then
			return false, "invalid argument"
		end

		var_11_13(var_11_12)
		var_11_16(var_11_12, arg_70_0, #arg_70_0)

		local var_70_0
		local var_70_1

		arg_70_1, var_70_1 = var_11_27.dynamic(var_11_12, arg_70_1)

		var_11_14(var_11_12)

		return var_70_1
	end

	return {
		pack = var_11_32,
		unpack = var_11_33
	}
end)()
slot_0_83_0 = (function()
	slot_71_0_0 = bit.band
	slot_71_1_0 = bit.bor
	slot_71_2_0 = bit.bxor
	slot_71_3_0 = bit.lshift
	slot_71_4_0 = bit.rshift
	slot_71_5_0 = bit.rol
	slot_71_6_0 = bit.ror
	slot_71_7_0 = bit.tobit
	slot_71_8_0 = bit.tohex
	slot_71_9_1 = nil
	slot_71_10_1 = {}
	slot_71_11_0 = {}
	slot_71_12_0 = {}
	slot_71_13_0 = {}
	slot_71_14_0 = {
		[224] = {},
		[256] = slot_71_13_0
	}
	slot_71_15_0 = {
		[384] = {},
		[512] = slot_71_12_0
	}
	slot_71_16_0 = {
		[384] = {},
		[512] = slot_71_13_0
	}
	slot_71_17_0 = 4294967296
	slot_71_18_1 = 0
	slot_71_19_0 = ffi.new("int32_t[?]", 64)

	function slot_71_9_0(arg_72_0, arg_72_1, arg_72_2, arg_72_3)
		slot_72_4_0 = slot_71_19_0
		slot_72_5_0 = slot_71_11_0

		for iter_72_0 = arg_72_2, arg_72_2 + arg_72_3 - 1, 64 do
			for iter_72_1 = 0, 15 do
				iter_72_0 = iter_72_0 + 4
				slot_72_14_2, slot_72_15_2, slot_72_16_1, slot_72_17_1 = slot_0_42_0(arg_72_1, iter_72_0 - 3, iter_72_0)
				slot_72_4_0[iter_72_1] = slot_71_1_0(slot_71_3_0(slot_72_14_2, 24), slot_71_3_0(slot_72_15_2, 16), slot_71_3_0(slot_72_16_1, 8), slot_72_17_1)
			end

			for iter_72_2 = 16, 63 do
				slot_72_14_1 = slot_72_4_0[iter_72_2 - 15]
				slot_72_15_1 = slot_72_4_0[iter_72_2 - 2]
				slot_72_4_0[iter_72_2] = slot_71_7_0(slot_71_2_0(slot_71_6_0(slot_72_14_1, 7), slot_71_5_0(slot_72_14_1, 14), slot_71_4_0(slot_72_14_1, 3)) + slot_71_2_0(slot_71_5_0(slot_72_15_1, 15), slot_71_5_0(slot_72_15_1, 13), slot_71_4_0(slot_72_15_1, 10)) + slot_72_4_0[iter_72_2 - 7] + slot_72_4_0[iter_72_2 - 16])
			end

			slot_72_10_0 = arg_72_0[1]
			slot_72_11_0 = arg_72_0[2]
			slot_72_12_0 = arg_72_0[3]
			slot_72_13_0 = arg_72_0[4]
			slot_72_14_0 = arg_72_0[5]
			slot_72_15_0 = arg_72_0[6]
			slot_72_16_0 = arg_72_0[7]
			slot_72_17_0 = arg_72_0[8]

			for iter_72_3 = 0, 63, 8 do
				slot_72_22_7 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3] + slot_72_5_0[iter_72_3 + 1] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_7)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_7)
				slot_72_22_6 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3 + 1] + slot_72_5_0[iter_72_3 + 2] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_6)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_6)
				slot_72_22_5 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3 + 2] + slot_72_5_0[iter_72_3 + 3] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_5)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_5)
				slot_72_22_4 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3 + 3] + slot_72_5_0[iter_72_3 + 4] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_4)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_4)
				slot_72_22_3 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3 + 4] + slot_72_5_0[iter_72_3 + 5] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_3)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_3)
				slot_72_22_2 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3 + 5] + slot_72_5_0[iter_72_3 + 6] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_2)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_2)
				slot_72_22_1 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3 + 6] + slot_72_5_0[iter_72_3 + 7] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_1)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_1)
				slot_72_22_0 = slot_71_7_0(slot_71_2_0(slot_72_16_0, slot_71_0_0(slot_72_14_0, slot_71_2_0(slot_72_15_0, slot_72_16_0))) + slot_71_2_0(slot_71_6_0(slot_72_14_0, 6), slot_71_6_0(slot_72_14_0, 11), slot_71_5_0(slot_72_14_0, 7)) + (slot_72_4_0[iter_72_3 + 7] + slot_72_5_0[iter_72_3 + 8] + slot_72_17_0))
				slot_72_17_0, slot_72_16_0, slot_72_15_0, slot_72_14_0 = slot_72_16_0, slot_72_15_0, slot_72_14_0, slot_71_7_0(slot_72_13_0 + slot_72_22_0)
				slot_72_13_0, slot_72_12_0, slot_72_11_0, slot_72_10_0 = slot_72_12_0, slot_72_11_0, slot_72_10_0, slot_71_7_0(slot_71_2_0(slot_71_0_0(slot_72_10_0, slot_71_2_0(slot_72_11_0, slot_72_12_0)), slot_71_0_0(slot_72_11_0, slot_72_12_0)) + slot_71_2_0(slot_71_6_0(slot_72_10_0, 2), slot_71_6_0(slot_72_10_0, 13), slot_71_5_0(slot_72_10_0, 10)) + slot_72_22_0)
			end

			arg_72_0[1], arg_72_0[2], arg_72_0[3], arg_72_0[4] = slot_71_7_0(slot_72_10_0 + arg_72_0[1]), slot_71_7_0(slot_72_11_0 + arg_72_0[2]), slot_71_7_0(slot_72_12_0 + arg_72_0[3]), slot_71_7_0(slot_72_13_0 + arg_72_0[4])
			arg_72_0[5], arg_72_0[6], arg_72_0[7], arg_72_0[8] = slot_71_7_0(slot_72_14_0 + arg_72_0[5]), slot_71_7_0(slot_72_15_0 + arg_72_0[6]), slot_71_7_0(slot_72_16_0 + arg_72_0[7]), slot_71_7_0(slot_72_17_0 + arg_72_0[8])
		end
	end

	slot_71_20_0 = ffi.typeof("int64_t")
	slot_71_18_0 = slot_71_20_0(4294967296)
	slot_71_21_0 = 2779096485 * slot_71_20_0(4294967297)

	function slot_71_22_0(arg_73_0, arg_73_1)
		return slot_71_2_0(arg_73_0, arg_73_1 or slot_71_21_0)
	end

	function slot_71_23_0(arg_74_0, arg_74_1, arg_74_2, arg_74_3)
		local var_74_0 = {}
		local var_74_1 = 0
		local var_74_2 = 0
		local var_74_3 = 1

		for iter_74_0 = 1, arg_74_3 do
			for iter_74_1 = slot_0_27_0(1, iter_74_0 + 1 - #arg_74_1), slot_0_26_0(iter_74_0, #arg_74_0) do
				var_74_1 = var_74_1 + arg_74_2 * arg_74_0[iter_74_1] * arg_74_1[iter_74_0 + 1 - iter_74_1]
			end

			local var_74_4 = var_74_1 % 16777216

			var_74_0[iter_74_0] = slot_0_28_0(var_74_4)
			var_74_1 = (var_74_1 - var_74_4) / 16777216
			var_74_2 = var_74_2 + var_74_4 * var_74_3
			var_74_3 = var_74_3 * 16777216
		end

		return var_74_0, var_74_2
	end

	slot_71_24_0 = 0
	slot_71_25_0 = {
		4,
		1,
		2,
		-2,
		2
	}
	slot_71_26_1 = 4
	slot_71_27_1 = {
		1
	}
	slot_71_28_1 = slot_71_13_0
	slot_71_29_0 = slot_71_12_0

	repeat
		slot_71_26_1 = slot_71_26_1 + slot_71_25_0[slot_71_26_1 % 6]
		slot_71_30_0 = 1

		repeat
			slot_71_30_0 = slot_71_30_0 + slot_71_25_0[slot_71_30_0 % 6]

			if slot_71_26_1 < slot_71_30_0 * slot_71_30_0 then
				slot_71_31_1 = slot_71_26_1^0.3333333333333333
				slot_71_32_4 = slot_71_31_1 * 1099511627776
				slot_71_32_3 = slot_71_23_0({
					slot_71_32_4 - slot_71_32_4 % 1
				}, slot_71_27_1, 1, 2)
				slot_71_33_1, slot_71_34_1 = slot_71_23_0(slot_71_32_3, slot_71_23_0(slot_71_32_3, slot_71_32_3, 1, 4), -1, 4)
				slot_71_35_0 = slot_71_32_3[2] % 65536 * 65536 + slot_0_28_0(slot_71_32_3[1] / 256)
				slot_71_36_0 = slot_71_32_3[1] % 256 * 16777216 + slot_0_28_0(slot_71_34_1 * 4.625929269271485e-18 * slot_71_31_1 / slot_71_26_1)

				if slot_71_24_0 < 16 then
					slot_71_31_0 = slot_71_26_1^0.5
					slot_71_32_2 = slot_71_31_0 * 1099511627776
					slot_71_32_1 = slot_71_23_0({
						slot_71_32_2 - slot_71_32_2 % 1
					}, slot_71_27_1, 1, 2)
					slot_71_33_0, slot_71_34_0 = slot_71_23_0(slot_71_32_1, slot_71_32_1, -1, 2)
					slot_71_37_0 = slot_71_32_1[2] % 65536 * 65536 + slot_0_28_0(slot_71_32_1[1] / 256)
					slot_71_38_0 = slot_71_32_1[1] % 256 * 16777216 + slot_0_28_0(slot_71_34_0 * 7.62939453125e-06 / slot_71_31_0)
					slot_71_39_0 = slot_71_24_0 % 8 + 1
					slot_71_14_0[224][slot_71_39_0] = slot_71_38_0
					slot_71_28_1[slot_71_39_0], slot_71_29_0[slot_71_39_0] = slot_71_37_0, slot_71_38_0 + slot_71_37_0 * slot_71_18_0

					if slot_71_39_0 > 7 then
						slot_71_28_1, slot_71_29_0 = slot_71_16_0[384], slot_71_15_0[384]
					end
				end

				slot_71_24_0 = slot_71_24_0 + 1
				slot_71_11_0[slot_71_24_0], slot_71_10_1[slot_71_24_0] = slot_71_35_0, slot_71_36_0 % slot_71_17_0 + slot_71_35_0 * slot_71_18_0

				break
			end
		until slot_71_26_1 % slot_71_30_0 == 0
	until slot_71_24_0 > 79

	for iter_71_0 = 224, 256, 32 do
		slot_71_27_0 = {}
		slot_71_28_0 = nil

		for iter_71_1 = 1, 8 do
			slot_71_27_0[iter_71_1] = slot_71_22_0(slot_71_12_0[iter_71_1])
		end

		slot_71_15_0[iter_71_0] = slot_71_27_0
		slot_71_16_0[iter_71_0] = slot_71_28_0
	end

	slot_71_11_0 = ffi.new("uint32_t[?]", #slot_71_11_0 + 1, 0, unpack(slot_71_11_0))
	slot_71_10_0 = ffi.new("int64_t[?]", #slot_71_10_1 + 1, 0, unpack(slot_71_10_1))

	return function(arg_75_0)
		local var_75_0 = {
			unpack(slot_71_14_0[256])
		}
		local var_75_1 = 0
		local var_75_2 = ""

		local function var_75_3(arg_76_0)
			if arg_76_0 then
				if var_75_2 then
					var_75_1 = var_75_1 + #arg_76_0

					local var_76_0 = 0

					if var_75_2 ~= "" and #var_75_2 + #arg_76_0 >= 64 then
						var_76_0 = 64 - #var_75_2

						slot_71_9_0(var_75_0, var_75_2 .. slot_0_37_0(arg_76_0, 1, var_76_0), 0, 64)

						var_75_2 = ""
					end

					local var_76_1 = #arg_76_0 - var_76_0
					local var_76_2 = var_76_1 % 64

					slot_71_9_0(var_75_0, arg_76_0, var_76_0, var_76_1 - var_76_2)

					var_75_2 = var_75_2 .. slot_0_37_0(arg_76_0, #arg_76_0 + 1 - var_76_2)

					return var_75_3
				else
					error("Adding more chunks is not allowed after receiving the result", 2)
				end
			else
				if var_75_2 then
					local var_76_3 = {
						var_75_2,
						"\x80",
						slot_0_43_0("\x00", (-9 - var_75_1) % 64 + 1)
					}

					var_75_2 = nil
					var_75_1 = var_75_1 * 1.1102230246251565e-16

					for iter_76_0 = 4, 10 do
						var_75_1 = var_75_1 % 1 * 256
						var_76_3[iter_76_0] = slot_0_40_0(slot_0_28_0(var_75_1))
					end

					local var_76_4 = slot_0_46_0(var_76_3)

					slot_71_9_0(var_75_0, var_76_4, 0, #var_76_4)

					local var_76_5 = 8

					for iter_76_1 = 1, var_76_5 do
						var_75_0[iter_76_1] = slot_71_8_0(var_75_0[iter_76_1])
					end

					var_75_0 = slot_0_46_0(var_75_0, "", 1, var_76_5)
				end

				return var_75_0
			end
		end

		if arg_75_0 then
			return var_75_3(arg_75_0)()
		else
			return var_75_3
		end
	end
end)()
slot_0_87_2 = slot_0_78_0("filesystem_stdio.dll", "VFileSystem017")
slot_0_88_2 = slot_0_53_0("void***", slot_0_87_2)[0]
slot_0_89_1 = slot_0_53_0("void*(__thiscall*)(void*, const char*, const char*, int, const char*)", slot_0_88_2[78])
slot_0_90_2 = slot_0_53_0("void(__thiscall*)(void*, void*)", slot_0_88_2[14])
slot_0_91_2 = slot_0_53_0("void(__thiscall*)(void*, const char*, uint64_t, void*)", slot_0_88_2[12])
slot_0_92_2 = slot_0_53_0("void(__thiscall*)(void*, void*, int, int, void*)", slot_0_88_2[79])
slot_0_93_2 = slot_0_53_0("uint64_t(__thiscall*)(void*, void*)", slot_0_88_2[18])

function slot_0_84_0(arg_77_0)
	local var_77_0 = slot_0_89_1(slot_0_87_2, arg_77_0, "rb", 0, "game")

	if var_77_0 == nil then
		return
	end

	local var_77_1 = slot_0_93_2(slot_0_87_2, var_77_0)

	if var_77_1 == 0 then
		return slot_0_90_2(slot_0_87_2, var_77_0)
	end

	local var_77_2 = slot_0_54_0("char[?]", var_77_1 + 1)

	slot_0_92_2(slot_0_87_2, var_77_2, var_77_1, var_77_1, var_77_0)
	slot_0_90_2(slot_0_87_2, var_77_0)

	return ffi.string(var_77_2, var_77_1)
end

function slot_0_85_0(arg_78_0, arg_78_1)
	local var_78_0 = slot_0_89_1(slot_0_87_2, arg_78_0, "wb", 0, "game")

	if var_78_0 == nil then
		print("failed to open file: " .. arg_78_0)

		return
	end

	local var_78_1 = #arg_78_1

	slot_0_91_2(slot_0_87_2, arg_78_1, var_78_1, var_78_0)
	slot_0_90_2(slot_0_87_2, var_78_0)
end

function slot_0_87_1(arg_79_0, arg_79_1)
	return slot_0_42_0(arg_79_0, arg_79_1 + 1) + slot_0_42_0(arg_79_0, arg_79_1 + 2) * 256
end

function slot_0_86_0(arg_80_0)
	local var_80_0 = slot_0_84_0(arg_80_0)
	local var_80_1 = slot_0_87_1(var_80_0, 32) + 38

	return slot_0_37_0(var_80_0, var_80_1 + 1)
end

function slot_0_87_0(arg_81_0, arg_81_1)
	local var_81_0 = slot_0_83_0(arg_81_0 .. arg_81_1)
	local var_81_1 = arg_81_0 .. var_81_0 .. arg_81_0

	return slot_0_83_0(var_81_1)
end

slot_0_88_1 = nil

function slot_0_88_0(arg_82_0)
	if slot_0_50_0(arg_82_0) ~= "table" then
		return arg_82_0
	end

	local var_82_0 = {}

	for iter_82_0, iter_82_1 in next, arg_82_0 do
		var_82_0[iter_82_0] = slot_0_88_0(iter_82_1)
	end

	return var_82_0
end

slot_0_89_0 = {
	["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36"
}
slot_0_90_1 = nil
slot_0_91_1 = nil
slot_0_92_1 = nil
slot_0_93_1 = nil
slot_0_94_2 = "particles/entity/spectator_utility_trail.vpcf"

if slot_0_84_0("spectator_utility_trail_custom.vpcf_c") ~= nil then
	slot_0_94_2 = "spectator_utility_trail_custom.vpcf"
else
	http.Get("https://github.com/arsenic23/fatality-helper/raw/refs/heads/main/spectator_utility_trail_custom.vpcf_c", {
		headers = slot_0_89_0
	}, function(arg_83_0, arg_83_1)
		if arg_83_0 ~= 200 or arg_83_1 == nil or #arg_83_1 ~= 4295 then
			slot_0_74_0("Failed to download particle. Try to load with VPN!")
			http.Get("https://github.com/v1pix/cs2-fatality-helper/raw/refs/heads/main/spectator_utility_trail_custom.vpcf_c", {
				headers = slot_0_89_0
			}, function(arg_84_0, arg_84_1)
				if arg_84_0 ~= 200 or arg_84_1 == nil or #arg_84_1 ~= 4295 then
					slot_0_74_0("[2] Failed to download particle. Try to load with VPN!")
				else
					slot_0_85_0("spectator_utility_trail_custom.vpcf_c", arg_84_1)

					slot_0_94_2 = "spectator_utility_trail_custom.vpcf"
				end
			end)
		else
			slot_0_85_0("spectator_utility_trail_custom.vpcf_c", arg_83_1)

			slot_0_94_2 = "spectator_utility_trail_custom.vpcf"
		end
	end)
end

slot_0_95_2 = slot_0_73_0("client.dll", "4C 8B 15 ? ? ? ? 83 FB FF")

function slot_0_96_2()
	if slot_0_95_2 == nil then
		return
	end

	local var_85_0 = slot_0_80_0(slot_0_95_2, 3)

	if var_85_0 == nil then
		return
	end

	return slot_0_53_0("void**", var_85_0)[0]
end

slot_0_97_2 = slot_0_96_2()

function slot_0_93_0()
	slot_0_97_2 = slot_0_96_2()
end

slot_0_98_2 = false
slot_0_99_2 = nil
slot_0_100_2 = nil
slot_0_101_2 = nil
slot_0_102_2 = nil
slot_0_103_2 = nil
slot_0_104_3 = nil
slot_0_105_4 = nil
slot_0_106_3 = nil

;(function()
	if slot_0_97_2 == nil then
		return slot_0_74_0("Failed to find 'particle_manager'.")
	end

	local var_87_0 = slot_0_53_0("void***", slot_0_97_2)[0]

	if var_87_0 == nil then
		return slot_0_74_0("Failed to find 'particle_manager_address'.")
	end

	slot_0_99_2 = slot_0_73_0("client.dll", "4C 8B DC 53 48 81 EC 90 00 00 00 F2")

	if slot_0_99_2 == nil then
		return slot_0_74_0("Failed to find 'particle_manager_create_particle'.")
	end

	slot_0_99_2 = slot_0_53_0("void(__fastcall*)(void*, unsigned int*, const char*, int, __int64, __int64, __int64, int)", slot_0_99_2)
	slot_0_100_2 = slot_0_73_0("client.dll", "48 89 5C 24 08 48 89 74 24 10 57 48 83 EC 50 F3 0F 10 1D ? ? ? ? 41 8B F8 8B DA 4C")

	if slot_0_100_2 == nil then
		return slot_0_74_0("Failed to find 'particle_manager_set_control_point'.")
	end

	slot_0_100_2 = slot_0_53_0("void(__fastcall*)(void*, unsigned int, int, void*, int)", slot_0_100_2)
	slot_0_101_2 = slot_0_73_0("client.dll", "40 56 48 83 EC 20 41 8B F0")

	if slot_0_101_2 == nil then
		return slot_0_74_0("Failed to find 'particle_manager_init_snapshot'.")
	end

	slot_0_101_2 = slot_0_53_0("void(*)(void*, int, unsigned int, void*)", slot_0_101_2)
	slot_0_102_2 = slot_0_73_0("client.dll", "83 FA FF 0F 84 D5 01")

	if slot_0_102_2 == nil then
		return slot_0_74_0("Failed to find 'particle_manager_release_particle'.")
	end

	slot_0_102_2 = slot_0_53_0("void(__fastcall*)(void*, int, bool, bool)", slot_0_102_2)
	slot_0_103_2 = slot_0_53_0("void(__fastcall*)(void*, int)", var_87_0[3])

	if slot_0_103_2 == nil then
		return slot_0_74_0("Failed to find 'particle_manager_release_particle_index'.")
	end

	slot_0_104_3 = slot_0_78_0("particles.dll", "ParticleSystemMgr003")

	if slot_0_104_3 == nil then
		return slot_0_74_0("Failed to find 'particle_system_manager'.")
	end

	slot_0_104_3 = slot_0_53_0("void*", slot_0_104_3)

	local var_87_1 = slot_0_53_0("void***", slot_0_104_3)[0]

	if var_87_1 == nil then
		return slot_0_74_0("Failed to find 'particle_system_manager_vtable'.")
	end

	slot_0_105_4 = slot_0_53_0("void(__fastcall*)(void*, void*, uintptr_t*)", var_87_1[41])

	if slot_0_105_4 == nil then
		return slot_0_74_0("Failed to find 'particle_system_manager_create_snapshot'.")
	end

	slot_0_106_3 = slot_0_53_0("void(__fastcall*)(void*, void*, int, void*)", var_87_1[42])

	if slot_0_106_3 == nil then
		return slot_0_74_0("Failed to find 'particle_system_manager_draw_snapshot'.")
	end

	slot_0_98_2 = true
end)()

slot_0_107_3 = ffi.typeof("        struct {\n            float time;\n            float width;\n            float alpha;\n        }\n    ")
slot_0_108_3 = ffi.typeof("        struct {\n            $* positions;\n            char pad[0x148];\n        }\n    ", slot_0_57_0)
slot_0_109_4 = ffi.typeof("        struct {\n            float r, g, b;\n        }\n    ")
slot_0_110_5 = slot_0_54_0(slot_0_109_4)
slot_0_111_6 = ffi.typeof("$[?]", slot_0_57_0)
slot_0_112_8 = slot_0_54_0(slot_0_107_3)
slot_0_112_8.time = 2
slot_0_112_8.width = 3
slot_0_112_8.alpha = 1

function slot_0_90_0(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
	if not slot_0_98_2 then
		return
	end

	local var_88_0 = slot_0_54_0("unsigned int[1]")

	slot_0_99_2(slot_0_97_2, var_88_0, slot_0_94_2, 2, 0, 0, 0, 0)

	local var_88_1 = var_88_0[0]

	slot_0_110_5.r = arg_88_1
	slot_0_110_5.g = arg_88_2
	slot_0_110_5.b = arg_88_3

	slot_0_100_2(slot_0_97_2, var_88_1, 16, slot_0_110_5, 0)
	slot_0_100_2(slot_0_97_2, var_88_1, 3, slot_0_112_8, 0)

	local var_88_2 = slot_0_54_0(slot_0_108_3)
	local var_88_3 = #arg_88_0
	local var_88_4 = slot_0_54_0(slot_0_111_6, var_88_3 * 2)
	local var_88_5 = 0

	for iter_88_0 = 1, var_88_3 do
		local var_88_6 = arg_88_0[iter_88_0]
		local var_88_7 = slot_0_57_0(var_88_6.x, var_88_6.y, var_88_6.z)

		var_88_4[var_88_5] = var_88_7
		var_88_4[var_88_5 + 1] = var_88_7
		var_88_5 = var_88_5 + 2
	end

	var_88_2.positions = var_88_4

	local var_88_8 = slot_0_54_0("uint64_t[1]")
	local var_88_9 = slot_0_54_0("void*[1]")

	slot_0_105_4(slot_0_104_3, var_88_9, var_88_8)
	slot_0_101_2(slot_0_97_2, var_88_1, 0, var_88_9[0])
	slot_0_106_3(slot_0_104_3, var_88_9[0], var_88_5, var_88_2)

	return var_88_1
end

function slot_0_91_0(arg_89_0, arg_89_1, arg_89_2, arg_89_3, arg_89_4)
	if not slot_0_98_2 then
		return
	end

	local var_89_0 = {}
	local var_89_1 = arg_89_0.x
	local var_89_2 = arg_89_0.y
	local var_89_3 = arg_89_0.z

	for iter_89_0 = 0, 420, 3 do
		local var_89_4 = slot_0_34_0(iter_89_0)

		var_89_0[#var_89_0 + 1] = slot_0_7_0(arg_89_1 * slot_0_30_0(var_89_4) + var_89_1, arg_89_1 * slot_0_31_0(var_89_4) + var_89_2, var_89_3)
	end

	return slot_0_90_0(var_89_0, arg_89_2, arg_89_3, arg_89_4)
end

function slot_0_92_0(arg_90_0)
	slot_0_102_2(slot_0_97_2, arg_90_0, true, true)
	slot_0_103_2(slot_0_97_2, arg_90_0)
end

slot_0_94_1 = nil
slot_0_95_1 = nil
slot_0_94_0 = {}

function slot_0_95_0()
	for iter_91_0, iter_91_1 in slot_0_49_0(slot_0_94_0) do
		slot_0_92_0(iter_91_0)

		slot_0_94_0[iter_91_0] = nil
		iter_91_1.particle_indexes = nil
	end
end

slot_0_75_0(slot_0_95_0)

slot_0_96_1 = nil
slot_0_97_1 = nil
slot_0_98_1 = nil
slot_0_99_1 = nil
slot_0_100_1 = nil
slot_0_101_1 = nil

function slot_0_96_0(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	arg_92_0 = arg_92_0 / arg_92_3 * 2

	if arg_92_0 < 1 then
		return arg_92_2 * 0.5 * slot_0_29_0(arg_92_0, 2) + arg_92_1
	end

	return -arg_92_2 * 0.5 * ((arg_92_0 - 1) * (arg_92_0 - 3) - 1) + arg_92_1
end

function slot_0_97_0(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	arg_93_0 = arg_93_0 / arg_93_3 - 1

	return -arg_93_2 * (slot_0_29_0(arg_93_0, 4) - 1) + arg_93_1
end

function slot_0_98_0(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	return -arg_94_2 * 0.5 * (slot_0_30_0(slot_0_35_0 * arg_94_0 / arg_94_3) - 1) + arg_94_1
end

function slot_0_99_0(arg_95_0, arg_95_1, arg_95_2, arg_95_3)
	arg_95_0 = arg_95_0 / arg_95_3

	return arg_95_2 * slot_0_29_0(arg_95_0, 3) + arg_95_1
end

function slot_0_100_0(arg_96_0, arg_96_1, arg_96_2, arg_96_3)
	return arg_96_2 * slot_0_31_0(arg_96_0 / arg_96_3 * (slot_0_35_0 * 0.5)) + arg_96_1
end

function slot_0_101_0(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	if arg_97_0 == 0 then
		return arg_97_1
	end

	return arg_97_2 * slot_0_29_0(2, 10 * (arg_97_0 / arg_97_3 - 1)) + arg_97_1 - arg_97_2 * 0.001
end

slot_0_102_1 = nil
slot_0_103_1 = nil
slot_0_104_2 = "fatality\\grenade_helper"
slot_0_105_3 = "fatality\\grenade_helper_cloud"

function slot_0_102_0(arg_98_0)
	local var_98_0 = arg_98_0 and slot_0_105_3 or slot_0_104_2
	local var_98_1 = slot_0_84_0(var_98_0)
	local var_98_2 = {}

	if var_98_1 ~= nil then
		var_98_2 = slot_0_82_0.unpack(var_98_1)
	end

	if var_98_2.sources == nil then
		if arg_98_0 then
			var_98_2.sources = {}
		else
			var_98_2.sources = {
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

	return var_98_2
end

function slot_0_103_0(arg_99_0, arg_99_1)
	if slot_0_50_0(arg_99_0) ~= "table" then
		return
	end

	local var_99_0 = arg_99_1 and slot_0_105_3 or slot_0_104_2

	arg_99_0 = slot_0_82_0.pack(arg_99_0)

	slot_0_85_0(var_99_0, arg_99_0)
end

slot_0_104_1 = nil
slot_0_104_0 = {}
slot_0_105_2 = gui.GetMainWindow()
slot_0_106_2 = gui.ControlID
slot_0_107_2 = gui.Group

function slot_0_108_2(arg_100_0)
	local var_100_0 = 0

	while arg_100_0 > 1 do
		arg_100_0 = bit.rshift(arg_100_0, 1)
		var_100_0 = var_100_0 + 1
	end

	return var_100_0 + 1
end

slot_0_109_3 = nil
slot_0_109_2 = {}
slot_0_110_4 = 0

events.presentQueue:Add(function()
	for iter_101_0, iter_101_1 in slot_0_49_0(slot_0_109_2) do
		local var_101_0 = iter_101_1.previous_value
		local var_101_1 = iter_101_0:get()

		if var_101_0 ~= var_101_1 then
			iter_101_1.previous_value = var_101_1

			local var_101_2 = iter_101_1.callbacks

			for iter_101_2, iter_101_3 in slot_0_48_0(var_101_2) do
				iter_101_3()
			end
		end
	end
end)

slot_0_110_3 = nil
slot_0_111_5 = nil
slot_0_112_7 = nil
slot_0_112_6 = {
	__newindex = function(arg_102_0, arg_102_1, arg_102_2)
		arg_102_0.item[arg_102_1] = arg_102_2
	end
}
slot_0_112_6.__index = slot_0_112_6

function slot_0_112_6.group(arg_103_0)
	local var_103_0 = gui.Settings(arg_103_0.name .. "group")

	arg_103_0.control:Add(var_103_0)

	return setmetatable({
		is_settings = true,
		group = var_103_0
	}, slot_0_110_3)
end

function slot_0_112_6.get(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_0.item

	if arg_104_0.type == 22 then
		return var_104_0.value
	end

	if var_104_0.GetValue == nil then
		return
	end

	local var_104_1 = var_104_0:GetValue()

	if var_104_1 == nil then
		return
	end

	local var_104_2 = var_104_1:Get()
	local var_104_3 = arg_104_0.type

	if var_104_3 == 5 then
		if arg_104_1 ~= nil then
			arg_104_1 = arg_104_1 - 1

			return var_104_2:Get(arg_104_1)
		end

		local var_104_4 = var_104_2:GetRaw()

		if not arg_104_0.allow_multiple then
			return slot_0_108_2(var_104_4)
		end

		return var_104_4
	end

	if var_104_3 == 12 then
		if arg_104_1 ~= nil then
			arg_104_1 = arg_104_1 - 1

			return var_104_2:Get(arg_104_1)
		end

		return var_104_2:GetRaw()
	end

	return var_104_2
end

function slot_0_112_6.get_direct(arg_105_0)
	local var_105_0 = arg_105_0.item

	if var_105_0.GetValue == nil then
		return
	end

	local var_105_1 = var_105_0:GetValue()

	if var_105_1 == nil then
		return
	end

	local var_105_2 = arg_105_0.type
	local var_105_3 = var_105_1:GetDirect()

	if var_105_2 == 5 then
		local var_105_4 = var_105_3:GetRaw()

		if not arg_105_0.allow_multiple then
			return slot_0_108_2(var_105_4)
		end

		return var_105_4
	end

	return var_105_3
end

function slot_0_112_6.get_hotkey_state(arg_106_0)
	return arg_106_0.item:GetHotkeyState()
end

function slot_0_112_6.set(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_0.item
	local var_107_1 = arg_107_0.type

	if var_107_1 == 22 then
		return var_107_0:SetValue(arg_107_1)
	end

	if var_107_0.GetValue == nil then
		return
	end

	local var_107_2 = var_107_0:GetValue()

	if var_107_2 == nil then
		return
	end

	if var_107_1 == 5 then
		local var_107_3 = var_107_2:Get()

		if arg_107_0.allow_multiple then
			var_107_3:SetRaw(arg_107_1)
		else
			arg_107_1 = bit.lshift(1, arg_107_1 - 1)

			var_107_3:SetRaw(arg_107_1)
		end

		var_107_2:Set(var_107_3)
	elseif var_107_1 == 12 then
		local var_107_4 = var_107_2:Get()

		var_107_4:SetRaw(arg_107_1)
		var_107_2:Set(var_107_4)
	else
		var_107_2:Set(arg_107_1)
	end

	local var_107_5 = arg_107_0.control

	if var_107_5 ~= nil then
		slot_0_79_0(0.01, var_107_5.Reset, var_107_5)
	end

	local var_107_6 = arg_107_0.callbacks

	for iter_107_0, iter_107_1 in slot_0_48_0(var_107_6) do
		slot_0_79_0(0.1, iter_107_1)
	end
end

function slot_0_112_6.update(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_0.items

	if var_108_0 == nil then
		return
	end

	local var_108_1 = arg_108_0.control

	if var_108_1 == nil then
		return
	end

	local var_108_2 = arg_108_0.name
	local var_108_3 = arg_108_0.item
	local var_108_4 = arg_108_0.type
	local var_108_5
	local var_108_6 = false

	if var_108_4 == 12 or var_108_4 == 5 then
		local var_108_7 = var_108_3.size

		var_108_5 = slot_0_5_0(var_108_7.x, var_108_7.y)
		var_108_6 = var_108_3.unlimitedMode or false
	end

	for iter_108_0 = #var_108_0, 1, -1 do
		var_108_3:Remove(var_108_0[iter_108_0])

		var_108_0[iter_108_0] = nil
	end

	var_108_1:Remove(var_108_3)

	local var_108_8

	if var_108_4 == 5 then
		var_108_8 = gui.ComboBox(slot_0_106_2(var_108_2 .. "_combo_box"))
		var_108_8.allowMultiple = arg_108_0.allow_multiple
		var_108_8.size.x = var_108_5.x
	end

	if var_108_4 == 12 then
		var_108_8 = gui.List(slot_0_106_2(var_108_2 .. "_list"), var_108_5)
		var_108_8.allowMultiple = arg_108_0.allow_multiple
		var_108_8.unlimitedMode = var_108_6 or false
	end

	if var_108_8 == nil then
		return
	end

	local var_108_9 = {}

	for iter_108_1, iter_108_2 in slot_0_48_0(arg_108_1) do
		local var_108_10 = gui.Selectable(slot_0_106_2(iter_108_2 .. "_selectable:" .. iter_108_1), iter_108_2)

		var_108_9[#var_108_9 + 1] = var_108_10

		var_108_8:Add(var_108_10)
	end

	var_108_1:Add(var_108_8)

	arg_108_0.item = var_108_8
	arg_108_0.items = var_108_9

	local var_108_11 = arg_108_0.callbacks

	for iter_108_3, iter_108_4 in slot_0_48_0(var_108_11) do
		var_108_8:AddCallback(iter_108_4)
	end
end

function slot_0_112_6.set_callback(arg_109_0, arg_109_1, arg_109_2)
	local function var_109_0()
		arg_109_1(arg_109_0)
	end

	if arg_109_0.type == 22 then
		local var_109_1 = slot_0_109_2[arg_109_0]

		if var_109_1 == nil then
			var_109_1 = {
				previous_value = nil,
				callbacks = {}
			}
			slot_0_109_2[arg_109_0] = var_109_1
		end

		local var_109_2 = var_109_1.callbacks

		var_109_2[#var_109_2 + 1] = var_109_0

		return
	end

	if arg_109_2 then
		var_109_0()
	end

	local var_109_3 = arg_109_0.callbacks

	var_109_3[#var_109_3 + 1] = var_109_0

	arg_109_0.item:AddCallback(var_109_0)
end

function slot_0_112_6.disable_hotkeys(arg_111_0)
	local var_111_0 = arg_111_0.item

	if var_111_0.GetValue == nil then
		return
	end

	local var_111_1 = var_111_0:GetValue()

	if var_111_1 == nil then
		return
	end

	var_111_1:DisableHotkeys()
end

function slot_0_112_6.visibility(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0.control

	if var_112_0 == nil then
		return
	end

	var_112_0:SetVisible(arg_112_1)
	arg_112_0.__group:__update_size()
end

function slot_0_112_6.reset(arg_113_0)
	local var_113_0 = arg_113_0.type

	if var_113_0 == 2 then
		return arg_113_0:set(false)
	end

	if var_113_0 == 5 then
		return arg_113_0:set(1)
	end

	if var_113_0 == 12 then
		return arg_113_0:set(0)
	end

	if var_113_0 == 22 then
		return arg_113_0:set("")
	end

	if var_113_0 == 17 then
		return arg_113_0:set(arg_113_0.min)
	end
end

function slot_0_112_6.input(arg_114_0, arg_114_1)
	local var_114_0 = gui.TextInput(slot_0_106_2(arg_114_1))

	arg_114_0.control:Add(var_114_0)

	return slot_0_111_5(arg_114_0.__group, arg_114_1, var_114_0, var_114_0)
end

function slot_0_112_6.button(arg_115_0, arg_115_1)
	local var_115_0 = gui.Button(slot_0_106_2(arg_115_1), arg_115_1)

	arg_115_0.control:Add(var_115_0)

	return slot_0_111_5(arg_115_0.__group, arg_115_1, var_115_0, var_115_0)
end

function slot_0_112_6.color(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = gui.ColorPicker(slot_0_106_2(arg_116_1))
	local var_116_1 = gui.MakeControl(arg_116_1, var_116_0, arg_116_2)

	arg_116_0.control:Add(var_116_0)

	return slot_0_111_5(arg_116_0.__group, arg_116_1, var_116_0, var_116_1)
end

function slot_0_111_5(arg_117_0, arg_117_1, arg_117_2, arg_117_3, arg_117_4, arg_117_5, arg_117_6)
	local var_117_0 = {
		__group = arg_117_0,
		name = arg_117_1,
		item = arg_117_2,
		control = arg_117_3,
		type = arg_117_2.type,
		allow_multiple = arg_117_2.allowMultiple,
		items = arg_117_4,
		callbacks = {}
	}

	return setmetatable(var_117_0, slot_0_112_6)
end

slot_0_112_5 = nil
slot_0_110_3 = {}
slot_0_110_3.__index = slot_0_110_3

function slot_0_110_3.switch(arg_118_0, arg_118_1)
	local var_118_0 = gui.Checkbox(slot_0_106_2(arg_118_1))
	local var_118_1 = gui.MakeControl(arg_118_1, var_118_0)

	arg_118_0.group:Add(var_118_1)

	local var_118_2 = slot_0_111_5(arg_118_0, arg_118_1, var_118_0, var_118_1)

	if arg_118_0.is_settings then
		return var_118_2
	end

	arg_118_0.items[#arg_118_0.items + 1] = var_118_2

	arg_118_0:__update_size()

	return var_118_2
end

function slot_0_110_3.combo(arg_119_0, arg_119_1, arg_119_2)
	local var_119_0 = gui.ComboBox(slot_0_106_2(arg_119_1 .. "_combo_box"))

	var_119_0.allowMultiple = false

	local var_119_1 = {}

	for iter_119_0, iter_119_1 in slot_0_48_0(arg_119_2) do
		local var_119_2 = gui.Selectable(slot_0_106_2(iter_119_1 .. "_selectable:" .. iter_119_0), iter_119_1)

		var_119_1[#var_119_1 + 1] = var_119_2

		var_119_0:Add(var_119_2)
	end

	local var_119_3 = gui.MakeControl(arg_119_1, var_119_0)

	arg_119_0.group:Add(var_119_3)

	local var_119_4 = slot_0_111_5(arg_119_0, arg_119_1, var_119_0, var_119_3, var_119_1)

	if arg_119_0.is_settings then
		return var_119_4
	end

	arg_119_0.items[#arg_119_0.items + 1] = var_119_4

	arg_119_0:__update_size()

	return var_119_4
end

function slot_0_110_3.selectable(arg_120_0, arg_120_1, arg_120_2)
	local var_120_0 = gui.ComboBox(slot_0_106_2(arg_120_1 .. "_combo_box"))

	var_120_0.allowMultiple = true

	local var_120_1 = {}

	for iter_120_0, iter_120_1 in slot_0_48_0(arg_120_2) do
		local var_120_2 = gui.Selectable(slot_0_106_2(iter_120_1 .. "_selectable:" .. iter_120_0), iter_120_1)

		var_120_1[#var_120_1 + 1] = var_120_2

		var_120_0:Add(var_120_2)
	end

	local var_120_3 = gui.MakeControl(arg_120_1, var_120_0)

	arg_120_0.group:Add(var_120_3)

	local var_120_4 = slot_0_111_5(arg_120_0, arg_120_1, var_120_0, var_120_3, var_120_1)

	if arg_120_0.is_settings then
		return var_120_4
	end

	arg_120_0.items[#arg_120_0.items + 1] = var_120_4

	arg_120_0:__update_size()

	return var_120_4
end

function slot_0_110_3.slider(arg_121_0, arg_121_1, arg_121_2, arg_121_3, arg_121_4, arg_121_5)
	local var_121_0 = gui.Slider(slot_0_106_2(arg_121_1), arg_121_2, arg_121_3, arg_121_4, arg_121_5)
	local var_121_1 = gui.MakeControl(arg_121_1, var_121_0)

	arg_121_0.group:Add(var_121_1)

	local var_121_2 = slot_0_111_5(arg_121_0, arg_121_1, var_121_0, var_121_1, nil, arg_121_2, arg_121_3)

	if arg_121_0.is_settings then
		return var_121_2
	end

	arg_121_0.items[#arg_121_0.items + 1] = var_121_2

	arg_121_0:__update_size()

	return var_121_2
end

function slot_0_110_3.color(arg_122_0, arg_122_1, arg_122_2)
	local var_122_0 = gui.ColorPicker(slot_0_106_2(arg_122_1))
	local var_122_1 = gui.MakeControl(arg_122_1, var_122_0, arg_122_2)

	arg_122_0.group:Add(var_122_1)

	local var_122_2 = slot_0_111_5(arg_122_0, arg_122_1, var_122_0, var_122_1)

	if arg_122_0.is_settings then
		return var_122_2
	end

	arg_122_0.items[#arg_122_0.items + 1] = var_122_2

	arg_122_0:__update_size()

	return var_122_2
end

function slot_0_110_3.multilist(arg_123_0, arg_123_1, arg_123_2, arg_123_3, arg_123_4)
	local var_123_0 = gui.List(slot_0_106_2(arg_123_1 .. "_list"), arg_123_4)

	var_123_0.allowMultiple = true
	var_123_0.unlimitedMode = arg_123_3 or false

	local var_123_1 = {}

	for iter_123_0, iter_123_1 in slot_0_48_0(arg_123_2) do
		local var_123_2 = gui.Selectable(slot_0_106_2(iter_123_1 .. "_selectable:" .. iter_123_0), iter_123_1)

		var_123_1[#var_123_1 + 1] = var_123_2

		var_123_0:Add(var_123_2)
	end

	local var_123_3 = gui.MakeControl(arg_123_1, var_123_0)

	arg_123_0.group:Add(var_123_3)

	local var_123_4 = slot_0_111_5(arg_123_0, arg_123_1, var_123_0, var_123_3, var_123_1)

	if arg_123_0.is_settings then
		return var_123_4
	end

	arg_123_0.items[#arg_123_0.items + 1] = var_123_4

	arg_123_0:__update_size()

	return var_123_4
end

function slot_0_110_3.list(arg_124_0, arg_124_1, arg_124_2, arg_124_3, arg_124_4)
	local var_124_0 = gui.List(slot_0_106_2(arg_124_1 .. "_list"), arg_124_4)

	var_124_0.allowMultiple = false
	var_124_0.unlimitedMode = arg_124_3 or false

	local var_124_1 = {}

	for iter_124_0, iter_124_1 in slot_0_48_0(arg_124_2) do
		local var_124_2 = gui.Selectable(slot_0_106_2(iter_124_1 .. "_selectable:" .. iter_124_0), iter_124_1)

		var_124_1[#var_124_1 + 1] = var_124_2

		var_124_0:Add(var_124_2)
	end

	local var_124_3 = gui.MakeControl(arg_124_1, var_124_0)

	arg_124_0.group:Add(var_124_3)

	local var_124_4 = slot_0_111_5(arg_124_0, arg_124_1, var_124_0, var_124_3, var_124_1)

	if arg_124_0.is_settings then
		return var_124_4
	end

	arg_124_0.items[#arg_124_0.items + 1] = var_124_4

	arg_124_0:__update_size()

	return var_124_4
end

function slot_0_110_3.button(arg_125_0, arg_125_1, arg_125_2)
	local var_125_0 = arg_125_2 or arg_125_1
	local var_125_1 = gui.Button(slot_0_106_2(var_125_0 .. "_button"), var_125_0)
	local var_125_2 = gui.MakeControl(arg_125_1, var_125_1)

	arg_125_0.group:Add(var_125_2)

	local var_125_3 = slot_0_111_5(arg_125_0, arg_125_1, var_125_1, var_125_2)

	if arg_125_0.is_settings then
		return var_125_3
	end

	arg_125_0.items[#arg_125_0.items + 1] = var_125_3

	arg_125_0:__update_size()

	return var_125_3
end

function slot_0_110_3.input(arg_126_0, arg_126_1)
	local var_126_0 = gui.TextInput(slot_0_106_2(arg_126_1))
	local var_126_1 = gui.MakeControl(arg_126_1, var_126_0)

	arg_126_0.group:Add(var_126_1)

	local var_126_2 = slot_0_111_5(arg_126_0, arg_126_1, var_126_0, var_126_1)

	if arg_126_0.is_settings then
		return var_126_2
	end

	arg_126_0.items[#arg_126_0.items + 1] = var_126_2

	arg_126_0:__update_size()

	return var_126_2
end

function slot_0_110_3.label(arg_127_0, arg_127_1)
	local var_127_0 = gui.Label(slot_0_106_2(arg_127_1), arg_127_1)

	arg_127_0.group:Add(var_127_0)

	local var_127_1 = slot_0_111_5(arg_127_0, arg_127_1, var_127_0, var_127_0)

	if arg_127_0.is_settings then
		return var_127_1
	end

	arg_127_0.items[#arg_127_0.items + 1] = var_127_1

	arg_127_0:__update_size()

	return var_127_1
end

function slot_0_110_3.visibility(arg_128_0, arg_128_1)
	arg_128_0.visible = arg_128_1

	arg_128_0.group:SetVisible(arg_128_1)
end

function slot_0_110_3.init(arg_129_0)
	arg_129_0.group:reset()
end

function slot_0_110_3.__update_size(arg_130_0)
	if arg_130_0.is_settings then
		return
	end

	local var_130_0 = 0
	local var_130_1 = arg_130_0.all_groups

	for iter_130_0 = 1, #var_130_1 do
		local var_130_2 = var_130_1[iter_130_0]

		if var_130_2.visible then
			local var_130_3 = var_130_2.items
			local var_130_4 = 20
			local var_130_5 = var_130_2.group.margin:Height()

			if var_130_5 == 0 then
				var_130_5 = 10
			end

			local var_130_6 = var_130_5 + var_130_2.offset

			for iter_130_1 = 1, #var_130_3 do
				local var_130_7 = var_130_3[iter_130_1]
				local var_130_8 = var_130_7.control

				if var_130_8 ~= nil and var_130_8.isVisible then
					local var_130_9 = var_130_7.name

					var_130_4 = var_130_4 + var_130_7.item.size.y + var_130_6
				end
			end

			var_130_2.group:SetDimensions(slot_0_5_0(0, var_130_0), slot_0_5_0(265, var_130_4))

			var_130_0 = var_130_0 + var_130_4 + 20
		end
	end
end

function slot_0_112_4(arg_131_0, arg_131_1, arg_131_2)
	local var_131_0 = slot_0_107_2(slot_0_106_2(arg_131_0), arg_131_0, 1024, arg_131_2)

	var_131_0:SetDimensions(slot_0_5_0(), slot_0_5_0(265, 1))

	return setmetatable({
		visible = true,
		group = var_131_0,
		offset = arg_131_1,
		items = {}
	}, slot_0_110_3)
end

slot_0_113_3 = nil

function slot_0_113_2(arg_132_0, arg_132_1, arg_132_2)
	local var_132_0 = {}

	for iter_132_0 = 1, #arg_132_1 do
		local var_132_1 = arg_132_1[iter_132_0]

		var_132_0[#var_132_0 + 1] = var_132_1.group
		var_132_1.all_groups = arg_132_1
	end

	local var_132_2 = gui.MakeStackedGroups(slot_0_106_2(arg_132_2), slot_0_5_0(265, 1024), var_132_0)

	arg_132_0:Add(var_132_2)

	return unpack(arg_132_1)
end

slot_0_114_4 = nil
slot_0_114_3 = {}
slot_0_114_3.__index = slot_0_114_3

function slot_0_114_3.groups(arg_133_0, ...)
	local var_133_0 = {
		...
	}
	local var_133_1 = #var_133_0 / 3
	local var_133_2 = {}
	local var_133_3 = ""

	for iter_133_0 = 1, var_133_1 do
		local var_133_4 = 3 * (iter_133_0 - 1) + 1
		local var_133_5 = var_133_0[var_133_4]
		local var_133_6 = var_133_0[var_133_4 + 1]
		local var_133_7 = var_133_0[var_133_4 + 2]

		var_133_3 = var_133_3 .. var_133_5
		var_133_2[#var_133_2 + 1] = slot_0_112_4(var_133_5, var_133_6, var_133_7)
	end

	return slot_0_113_2(arg_133_0.tab, var_133_2, var_133_3)
end

slot_0_115_2 = draw.SvgTexture("<svg width=\"24px\" height=\"24px\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 640 640\" fill=\"none\"><path d=\"M512 48c6.9 0 13 4.4 15.2 10.9l13.5 40.4 40.4 13.5c6.5 2.2 10.9 8.3 10.9 15.2s-4.4 13-10.9 15.2l-40.4 13.5-13.5 40.4c-2.2 6.5-8.3 10.9-15.2 10.9s-13-4.4-15.2-10.9l-13.5-40.4-40.4-13.5c-6.5-2.2-10.9-8.3-10.9-15.2s4.4-13 10.9-15.2l40.4-13.5 13.5-40.4C499 52.4 505.1 48 512 48M353.4 161.4c12.5-12.5 32.8-12.5 45.3 0l80 80c12.5 12.5 12.5 32.8 0 45.3l-10.9 10.9c7.9 22 12.2 45.7 12.2 70.5 0 114.9-93.1 208-208 208S64 482.9 64 368s93.1-208 208-208c24.7 0 48.5 4.3 70.5 12.3zM176 368c0-53 43-96 96-96 13.3 0 24-10.7 24-24s-10.7-24-24-24c-79.5 0-144 64.5-144 144 0 13.3 10.7 24 24 24s24-10.7 24-24\" fill=\"#ffffff\"/></svg>")

slot_0_115_2:Create()

draw.textures.helper_icon = slot_0_115_2

function slot_0_104_0.tab(arg_134_0)
	local var_134_0 = slot_0_105_2:AddTab(slot_0_106_2(arg_134_0), draw.textures.helper_icon, arg_134_0, gui.TabLayoutMode.DEFAULT)

	return setmetatable({
		tab = var_134_0
	}, slot_0_114_3)
end

function slot_0_104_0.find(arg_135_0)
	local var_135_0 = gui.ctx:Find(arg_135_0)

	return slot_0_111_5(nil, nil, var_135_0, var_135_0)
end

slot_0_105_1 = nil
slot_0_105_0 = {}
slot_0_106_1 = slot_0_104_0.tab("HELPER")
slot_0_107_1, slot_0_108_1, slot_0_109_1, slot_0_110_2 = slot_0_106_1:groups("Master", -2, gui.GroupWidthMode.DEFAULT, "Settings", -6, gui.GroupWidthMode.DEFAULT, "Active Sources", -6, gui.GroupWidthMode.DEFAULT, "Cloud Sources", -6, gui.GroupWidthMode.DEFAULT)
slot_0_105_0.hotkey = slot_0_107_1:switch("Hotkey (Bind)")
slot_0_105_0.throw_without_mouse1 = slot_0_105_0.hotkey:group():switch("Throw Without Mouse1")

slot_0_105_0.hotkey:set_callback(function(arg_136_0)
	if arg_136_0:get() and not arg_136_0:get_hotkey_state() then
		arg_136_0:set(false)
		slot_0_74_0("Please bind 'Hotkey (Bind)'")
	end
end, true)

slot_0_105_0.aimbot = slot_0_107_1:combo("Aimbot", {
	"Rage",
	"Legit"
})
slot_0_111_4 = slot_0_105_0.aimbot:group()
slot_0_105_0.aimbot_fov = slot_0_111_4:slider("Field Of View", 40, 180)
slot_0_105_0.aimbot_smooth = slot_0_111_4:slider("Smooth", 1, 100)
slot_0_105_0.types = slot_0_108_1:selectable("Types", {
	"Smoke",
	"Flashbang",
	"Decoy",
	"High Explosive",
	"Molotov",
	"Wallbang",
	"Movement"
})
slot_0_105_0.color = slot_0_105_0.types:color("Color", true)

slot_0_105_0.color:set_callback(function(arg_137_0)
	local var_137_0 = arg_137_0:get()
	local var_137_1 = var_137_0:GetR()
	local var_137_2 = var_137_0:GetG()
	local var_137_3 = var_137_0:GetB()

	if var_137_1 == 0 and var_137_2 == 0 and var_137_3 == 0 then
		local var_137_4 = draw.color.White()

		arg_137_0:set(var_137_4)
	end
end, true)

slot_0_105_0.options = slot_0_108_1:selectable("Options", {
	"Show Behind Walls",
	"Hide Duplicates",
	"Hide Icon With Text",
	"Hide Playback Preview"
})
slot_0_105_0.active_sources = slot_0_109_1:multilist("Active Sources", {}, false, slot_0_5_0(222, 215))
slot_0_105_0.cloud_sources = slot_0_110_2:multilist("Cloud Sources", {
	"Reworking..."
}, false, slot_0_5_0(222, 20))

slot_0_107_1:init()
slot_0_108_1:init()
slot_0_109_1:init()
slot_0_110_2:init()

slot_0_111_3, slot_0_112_3, slot_0_113_1 = slot_0_106_1:groups("Editing Source", -6, gui.GroupWidthMode.DEFAULT, "Discord", 0, gui.GroupWidthMode.DEFAULT, "Locations", 0, gui.GroupWidthMode.DEFAULT)
slot_0_105_0.editing_sources = slot_0_111_3:combo("editing_sources", {
	"Create New"
})
slot_0_105_0.editing_sources.item.size.x = 220

slot_0_105_0.editing_sources:reset()

slot_0_105_0.create_source = slot_0_111_3:button("", "Create Source")
slot_0_105_0.new_source_name = slot_0_105_0.create_source:input("Source Name")
slot_0_105_0.new_source_name.placeholder = "Start typing name..."
slot_0_105_0.new_source_name.item.size.x = 115
slot_0_105_0.import_source = slot_0_111_3:button("Import", "Import")
slot_0_105_0.import_source.tooltip = "Import locations"
slot_0_105_0.import_source.item.size.x = 220
slot_0_105_0.export_source = slot_0_111_3:button("Export", "Export")
slot_0_105_0.export_source.tooltip = "Export source"
slot_0_105_0.export_source.item.size.x = 220
slot_0_105_0.delete_source = slot_0_111_3:button("Delete", "Delete")
slot_0_105_0.delete_source.tooltip = "Delete source"
slot_0_105_0.delete_source.item.size.x = 220
slot_0_105_0.delete_source_confirm = slot_0_111_3:button("\fFF0000FFDelete ", "\fFF0000FFDelete (Confirm)")
slot_0_105_0.delete_source_confirm.tooltip = "\fFF0000FFDelete (Confirm) source"
slot_0_105_0.delete_source_confirm.item.size.x = 220

slot_0_105_0.editing_sources:set_callback(function(arg_138_0)
	local var_138_0 = arg_138_0:get() == 1
	local var_138_1 = not var_138_0

	slot_0_105_0.create_source:visibility(var_138_0)
	slot_0_105_0.new_source_name:visibility(var_138_0)
	slot_0_105_0.import_source:visibility(var_138_1)
	slot_0_105_0.export_source:visibility(var_138_1)
	slot_0_105_0.delete_source:visibility(var_138_1)
	slot_0_105_0.delete_source_confirm:visibility(false)
end, true)
slot_0_79_0(1, function()
	slot_0_105_0.delete_source:set_callback(function()
		slot_0_79_0(0.1, function()
			slot_0_105_0.delete_source:visibility(false)
			slot_0_105_0.delete_source_confirm:visibility(true)
		end)
		slot_0_79_0(3, function()
			slot_0_105_0.editing_sources:set(slot_0_105_0.editing_sources:get())
		end)
	end)
	slot_0_105_0.delete_source_confirm:set_callback(function()
		slot_0_79_0(0.1, function()
			slot_0_105_0.editing_sources:set(slot_0_105_0.editing_sources:get())
		end)
	end)
end)

slot_0_114_2 = slot_0_112_3:button("", "Discord Server")
slot_0_114_2.item.size.x = 220

slot_0_114_2:set_callback(function()
	slot_0_72_0("https://discord.gg/n4DpEunxbj")
end)

slot_0_105_0.source_locations = slot_0_113_1:list("Locations", {}, true, slot_0_5_0(222, 200))

slot_0_105_0.source_locations:reset()

slot_0_105_0.location_teleport_hotkey = slot_0_113_1:switch("Teleport")
slot_0_105_0.location_teleport_hotkey.tooltip = "Teleport Hotkey"
slot_0_105_0.location_teleport = slot_0_105_0.location_teleport_hotkey:button("     Teleport")
slot_0_105_0.location_teleport.item.size.x = 202
slot_0_105_0.location_export = slot_0_113_1:button("Export ", "Export ")
slot_0_105_0.location_export.tooltip = "Export selected location"
slot_0_105_0.location_export.item.size.x = 220
slot_0_105_0.location_delete = slot_0_113_1:button("Delete ", "Delete ")
slot_0_105_0.location_delete.tooltip = "Delete selected location"
slot_0_105_0.location_delete.item.size.x = 220
slot_0_105_0.location_delete_confirm = slot_0_113_1:button("\fFF0000FFDelete  ", "\fFF0000FFDelete (Confirm) ")
slot_0_105_0.location_delete_confirm.tooltip = "\fFF0000FFDelete (Confirm) selected location"
slot_0_105_0.location_delete_confirm.item.size.x = 220

slot_0_105_0.source_locations:set_callback(function(arg_146_0)
	slot_0_79_0(0.1, function()
		slot_0_105_0.location_delete:visibility(true)
		slot_0_105_0.location_delete_confirm:visibility(false)
	end)
end, true)
slot_0_79_0(1, function()
	slot_0_105_0.location_delete:set_callback(function()
		slot_0_79_0(0.1, function()
			slot_0_105_0.location_delete:visibility(false)
			slot_0_105_0.location_delete_confirm:visibility(true)
		end)
		slot_0_79_0(3, function()
			slot_0_105_0.source_locations:set(slot_0_105_0.source_locations:get())
		end)
	end)
	slot_0_105_0.location_delete_confirm:set_callback(function()
		slot_0_79_0(0.1, function()
			slot_0_105_0.source_locations:set(slot_0_105_0.source_locations:get())
		end)
	end)
end)
slot_0_111_3:init()
slot_0_113_1:init()

slot_0_114_1 = slot_0_106_1:groups("Location", 0, gui.GroupWidthMode.DEFAULT)
slot_0_105_0.location_type = slot_0_114_1:combo("Type", {
	"Grenade",
	"Wallbang",
	"Movement"
})
slot_0_105_0.location_name = slot_0_114_1:input("Name")
slot_0_105_0.location_name.placeholder = "Start typing..."
slot_0_105_0.location_description = slot_0_114_1:input("Description")
slot_0_105_0.location_description.placeholder = "Optional. Start typing..."
slot_0_105_0.location_jump = slot_0_114_1:switch("Jump")
slot_0_105_0.location_strafe_boost = slot_0_114_1:slider("Strafe Boost", 0, 100, {
	"%.0f%%"
})
slot_0_105_0.location_strafe_boost.tooltip = "0 - Off"

slot_0_105_0.location_jump:set_callback(function(arg_154_0)
	slot_0_105_0.location_strafe_boost:visibility(arg_154_0:get())
end, true)

slot_0_105_0.location_run = slot_0_114_1:combo("Run", {
	"Disabled",
	"Forward",
	"Left",
	"Right",
	"Back",
	"Custom"
})
slot_0_105_0.location_run_custom = slot_0_114_1:slider("Run Direction", -180, 180, {
	"%.0f°"
})
slot_0_105_0.location_run_duration = slot_0_114_1:slider("Run Duration", 0, 256, {
	"%.0ft"
})
slot_0_105_0.location_run_walk = slot_0_114_1:switch("Walk (Shift)")

slot_0_105_0.location_run:set_callback(function(arg_155_0)
	local var_155_0 = arg_155_0:get()
	local var_155_1 = var_155_0 > 1
	local var_155_2 = var_155_0 == 6

	slot_0_105_0.location_run_custom:visibility(var_155_2)
	slot_0_105_0.location_run_duration:visibility(var_155_1)
	slot_0_105_0.location_run_walk:visibility(var_155_1)
end, true)

slot_0_105_0.location_recovery = slot_0_114_1:combo("Recovery", {
	"Disabled",
	"Forward",
	"Left",
	"Right",
	"Back",
	"Custom"
})
slot_0_105_0.location_recovery_custom = slot_0_114_1:slider("Recovery Direction", -180, 180, {
	"%.0f°"
})
slot_0_105_0.location_recovery_bunnyhop = slot_0_114_1:switch("Recovery Bunny Hop")

slot_0_105_0.location_recovery:set_callback(function(arg_156_0)
	local var_156_0 = arg_156_0:get()
	local var_156_1 = var_156_0 > 1
	local var_156_2 = var_156_0 == 6

	slot_0_105_0.location_recovery_custom:visibility(var_156_2)
	slot_0_105_0.location_recovery_bunnyhop:visibility(var_156_1)
end, true)

slot_0_105_0.location_strength = slot_0_114_1:combo("Strength", {
	"Left",
	"Left / Right",
	"Right"
})
slot_0_115_1 = slot_0_105_0.location_strength:group()
slot_0_105_0.location_super_toss = slot_0_115_1:switch("Straight Throw")
slot_0_105_0.location_delay = slot_0_114_1:slider("Delay", 0, 64, {
	"%.0ft"
})
slot_0_105_0.location_recording = slot_0_114_1:switch("Recording")
slot_0_105_0.location_recording.tooltip = "Recording Hotkey"
slot_0_105_0.location_set_position_hotkey = slot_0_114_1:switch("Set Position")
slot_0_105_0.location_set_position = slot_0_105_0.location_set_position_hotkey:button("       Set Position")
slot_0_105_0.location_set_position.item.size.x = 202
slot_0_105_0.location_set_position_hotkey.tooltip = "Set Position Hotkey"

slot_0_105_0.location_type:set_callback(function(arg_157_0)
	local var_157_0 = arg_157_0:get()
	local var_157_1 = var_157_0 == 1
	local var_157_2 = var_157_0 == 2
	local var_157_3 = var_157_0 == 3

	slot_0_105_0.location_jump:visibility(var_157_1)
	slot_0_105_0.location_run:visibility(var_157_1)
	slot_0_105_0.location_recovery:visibility(var_157_1)
	slot_0_105_0.location_strength:visibility(var_157_1)
	slot_0_105_0.location_delay:visibility(var_157_1)
	slot_0_105_0.location_recording:visibility(var_157_3)
	slot_0_105_0.location_set_position_hotkey:visibility(var_157_1 or var_157_2)
end, true)

slot_0_105_0.location_save = slot_0_114_1:button("", "Save")
slot_0_105_0.location_save.item.size.x = 220

slot_0_114_1:init()
slot_0_105_0.editing_sources:set_callback(function(arg_158_0)
	local var_158_0 = arg_158_0:get() > 1

	slot_0_112_3:visibility(not var_158_0)
	slot_0_113_1:visibility(var_158_0)
	slot_0_114_1:visibility(var_158_0)
end, true)

slot_0_106_0 = draw.FontGDI("Verdana", 12, bit.bor(draw.FontFlags.ANTI_ALIAS, draw.FontFlags.NO_KERN, draw.FontFlags.SHADOW, draw.FontFlags.NO_DPI))

slot_0_106_0:Create()

slot_0_106_0.lineGap = 4
slot_0_107_0 = draw.FontGDI("Verdana", 12, bit.bor(draw.FontFlags.ANTI_ALIAS, draw.FontFlags.NO_KERN, draw.FontFlags.SHADOW, draw.FontFlags.NO_DPI), 0, 255, 700)

slot_0_107_0:Create()

slot_0_108_0 = draw.Font("smallest_pixel-7.ttf", 10, draw.FontFlags.NO_DPI, draw.FontFlags.OUTLINE)

if slot_0_84_0("..\\bin\\win64\\smallest_pixel-7.ttf") ~= nil then
	slot_0_108_0:Create()
else
	http.Get("https://github.com/arsenic23/fatality-helper/raw/refs/heads/main/smallest_pixel-7.ttf", {
		headers = slot_0_89_0
	}, function(arg_159_0, arg_159_1)
		if arg_159_0 ~= 200 or arg_159_1 == nil or #arg_159_1 ~= 25600 then
			slot_0_74_0("Failed to download font. Try to load with VPN!")
			http.Get("https://github.com/v1pix/cs2-fatality-helper/raw/refs/heads/main/smallest_pixel-7.ttf", {
				headers = slot_0_89_0
			}, function(arg_160_0, arg_160_1)
				if arg_160_0 ~= 200 or arg_160_1 == nil or #arg_160_1 ~= 25600 then
					slot_0_74_0("[2] Failed to download font. Try to load with VPN!")
				else
					slot_0_85_0("..\\bin\\win64\\smallest_pixel-7.ttf", arg_160_1)
					slot_0_108_0:Create()
				end
			end)
		else
			slot_0_85_0("..\\bin\\win64\\smallest_pixel-7.ttf", arg_159_1)
			slot_0_108_0:Create()
		end
	end)
end

slot_0_109_0 = nil
slot_0_110_1 = nil
slot_0_111_2 = {}

function slot_0_110_0(arg_161_0)
	slot_0_111_2[#slot_0_111_2 + 1] = arg_161_0
end

function slot_0_112_2(arg_162_0)
	if arg_162_0:GetName() ~= "game_newmap" then
		return
	end

	slot_0_109_0 = arg_162_0:GetString("mapname")

	if slot_0_109_0 == "<empty>" then
		slot_0_109_0 = nil
	end

	for iter_162_0, iter_162_1 in slot_0_48_0(slot_0_111_2) do
		iter_162_1()
	end
end

if slot_0_2_0:InGame() then
	slot_0_109_0 = game.globalVars.m_szMapName
end

mods.events:AddListener("game_newmap")
events.event:Add(slot_0_112_2)
slot_0_110_0(slot_0_93_0)

slot_0_111_1 = nil
slot_0_112_1 = {
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

function slot_0_111_0(arg_163_0)
	local var_163_0 = arg_163_0:GetDefIndex()
	local var_163_1 = slot_0_112_1[var_163_0]

	if var_163_1 ~= nil then
		return var_163_1
	end

	local var_163_2 = arg_163_0:GetData()

	if var_163_2 ~= nil and var_163_2.m_bMeleeWeapon:Get() then
		return "weapon_knife"
	end
end

slot_0_112_0 = {}
slot_0_113_0 = nil
slot_0_114_0 = nil
slot_0_115_0 = {}
slot_0_116_0 = nil
slot_0_117_0 = nil
slot_0_118_0 = nil
slot_0_119_0 = nil
slot_0_120_0 = slot_0_104_0.find("misc>misc>grenades>straight throw")
slot_0_121_0 = slot_0_104_0.find("misc>misc>grenades>quick switch")
slot_0_122_0 = slot_0_104_0.find("misc>movement>jumpbug")
slot_0_123_0 = slot_0_104_0.find("misc>movement>edge jump")
slot_0_124_0 = slot_0_104_0.find("misc>movement>autostrafer")
slot_0_125_0 = slot_0_104_0.find("misc>movement>autostrafer>turn angle")
slot_0_126_0 = slot_0_104_0.find("misc>movement>autostrafer>boost")
slot_0_127_0 = slot_0_104_0.find("misc>movement>standalone quick stop")
slot_0_128_0 = slot_0_104_0.find("misc>movement>slowwalk")
slot_0_129_0 = slot_0_104_0.find("misc>movement>slowwalk speed")
slot_0_130_0 = slot_0_104_0.find("misc>misc>grenades>auto release")
slot_0_131_0 = nil
slot_0_132_0 = nil
slot_0_133_0 = nil
slot_0_134_0 = nil

slot_0_105_0.aimbot:set_callback(function(arg_164_0)
	slot_0_131_0 = arg_164_0:get()
end, true)
slot_0_105_0.aimbot_fov:set_callback(function(arg_165_0)
	slot_0_132_0 = arg_165_0:get()
end, true)
slot_0_105_0.aimbot_smooth:set_callback(function(arg_166_0)
	slot_0_133_0 = arg_166_0:get() * 0.3
end, true)
slot_0_105_0.throw_without_mouse1:set_callback(function(arg_167_0)
	slot_0_134_0 = arg_167_0:get()
end, true)

slot_0_135_1 = nil
slot_0_136_1 = nil
slot_0_137_4 = {}

function slot_0_135_0(arg_168_0, arg_168_1)
	if arg_168_1 == nil then
		local var_168_0 = slot_0_137_4[arg_168_0]

		if var_168_0 ~= nil then
			arg_168_0:set(var_168_0)

			slot_0_137_4[arg_168_0] = nil
		end

		return
	end

	if slot_0_137_4[arg_168_0] == nil then
		slot_0_137_4[arg_168_0] = arg_168_0:get_direct()
	end

	arg_168_0:set(arg_168_1)
	arg_168_0:disable_hotkeys()
end

function slot_0_136_0()
	for iter_169_0, iter_169_1 in slot_0_49_0(slot_0_137_4) do
		iter_169_0:set(iter_169_1)

		slot_0_137_4[iter_169_0] = nil
	end
end

slot_0_137_3 = nil

function slot_0_138_3(arg_170_0)
	arg_170_0:RemoveButton(slot_0_63_0)
	arg_170_0:RemoveButton(slot_0_64_0)
	arg_170_0:RemoveButton(slot_0_67_0)
	arg_170_0:RemoveButton(slot_0_68_0)
	arg_170_0:SetLeftMove(0)
	arg_170_0:SetForwardMove(0)
	arg_170_0:RemoveButton(slot_0_61_0)
	arg_170_0:RemoveButton(slot_0_69_0)
	arg_170_0:RemoveButton(slot_0_62_0)
end

slot_0_139_4 = 1
slot_0_140_5 = 2
slot_0_141_5 = 3
slot_0_142_5 = 4
slot_0_143_5 = 5

function slot_0_144_6(arg_171_0, arg_171_1, arg_171_2, arg_171_3, arg_171_4)
	slot_171_5_0 = arg_171_1.commandNumber
	slot_171_6_0 = slot_0_119_0.data

	if slot_171_6_0 == nil then
		slot_171_6_0 = {}
		slot_0_119_0.data = slot_171_6_0
	end

	slot_171_7_0 = slot_171_6_0.state

	if slot_171_7_0 == nil then
		slot_171_7_0 = slot_0_139_4
		slot_171_6_0.state = slot_171_7_0
	end

	slot_171_8_0 = arg_171_0.viewangles

	if slot_0_131_0 == 1 then
		arg_171_1:SetViewangles(slot_171_8_0)
	elseif slot_171_6_0.state ~= slot_0_143_5 then
		arg_171_1:SetViewangles(slot_171_8_0)
		arg_171_1:LockAngles()
	end

	slot_171_9_0 = arg_171_0.grenade
	slot_171_10_0 = slot_171_9_0 ~= nil and slot_171_9_0.strength or 1

	if slot_171_7_0 == slot_0_139_4 or slot_171_7_0 == slot_0_140_5 or slot_171_7_0 == slot_0_142_5 then
		if slot_171_10_0 == 0 then
			arg_171_1:RemoveButton(slot_0_59_0)
			arg_171_1:SetButton(slot_0_60_0)
		elseif slot_171_10_0 == 0.5 then
			arg_171_1:SetButton(slot_0_59_0)
			arg_171_1:SetButton(slot_0_60_0)
		else
			arg_171_1:SetButton(slot_0_59_0)
			arg_171_1:RemoveButton(slot_0_60_0)
		end
	end

	slot_171_11_0 = arg_171_0.duck

	if slot_171_7_0 ~= slot_0_143_5 then
		if arg_171_4 ~= arg_171_0.weapon then
			slot_0_119_0 = nil
		end

		slot_0_138_3(arg_171_1)

		if slot_171_11_0 then
			arg_171_1:SetButton(slot_0_62_0)
		end
	end

	slot_171_13_0 = arg_171_2.m_pMovementServices:Get().m_flDuckAmount:Get()

	if slot_171_11_0 and slot_171_13_0 ~= 1 or not slot_171_11_0 and slot_171_13_0 ~= 0 then
		return
	end

	slot_171_14_0 = arg_171_3.m_flThrowStrength
	slot_171_14_0 = slot_171_14_0 and slot_171_14_0:Get()
	slot_171_15_0 = arg_171_3.m_bPinPulled or false
	slot_171_15_0 = slot_171_15_0 and slot_171_15_0:Get()

	if slot_171_7_0 == slot_0_139_4 and slot_171_14_0 == slot_171_10_0 and slot_171_15_0 then
		slot_171_7_0 = slot_0_140_5
		slot_171_6_0.state = slot_171_7_0
		slot_171_6_0.start_at = slot_171_5_0
	end

	slot_171_16_0 = slot_171_9_0 ~= nil and slot_171_9_0.strafe_boost

	if slot_171_16_0 then
		if slot_171_16_0 == true then
			slot_171_16_0 = 36
		end

		slot_0_135_0(slot_0_124_0, 10)
		slot_0_135_0(slot_0_125_0, 0)
		slot_0_135_0(slot_0_126_0, slot_171_16_0)
	end

	if slot_171_9_0 ~= nil and slot_171_9_0.super_toss then
		slot_0_135_0(slot_0_120_0, true)
	end

	if slot_171_7_0 == slot_0_143_5 then
		slot_171_18_2 = slot_171_6_0.recovery_yaw

		if slot_171_18_2 == nil then
			slot_0_119_0 = nil

			return
		end

		slot_171_19_2 = slot_171_6_0.recovery_start_at

		if slot_171_19_2 == nil then
			slot_171_19_2 = slot_171_5_0
			slot_171_6_0.recovery_start_at = slot_171_19_2
		end

		if arg_171_1:GetButton(slot_0_63_0) or arg_171_1:GetButton(slot_0_64_0) or arg_171_1:GetButton(slot_0_67_0) or arg_171_1:GetButton(slot_0_68_0) or arg_171_1:GetButton(slot_0_61_0) then
			slot_0_119_0 = nil

			return
		end

		slot_171_21_1 = slot_171_9_0 ~= nil and slot_171_9_0.recovery_jump
		slot_171_22_0 = slot_0_26_0(32, slot_171_6_0.run or 16) + 13 + (slot_171_16_0 and 10 or 0)

		slot_0_135_0(slot_0_124_0, 10)
		slot_0_135_0(slot_0_125_0, 0)
		slot_0_135_0(slot_0_126_0, 100)

		if slot_171_5_0 <= slot_171_19_2 + slot_171_22_0 then
			slot_0_138_3(arg_171_1)
			arg_171_1:SetForwardMove(1)

			slot_171_23_0 = arg_171_2.m_fFlags:Get()

			if not (slot_0_56_0(slot_171_23_0, 1) == 1) or slot_171_21_1 then
				arg_171_1:SetButton(slot_0_61_0)
			end

			slot_171_25_0 = slot_171_8_0.y + slot_171_18_2 + slot_171_6_0.run_yaw

			arg_171_1:RotateMovement(slot_171_25_0)
		else
			slot_0_119_0 = nil
		end
	end

	if slot_171_7_0 == slot_0_140_5 or slot_171_7_0 == slot_0_141_5 or slot_171_7_0 == slot_0_142_5 then
		slot_171_18_1 = slot_171_5_0 - slot_171_6_0.start_at
		slot_171_19_1 = slot_171_9_0 ~= nil and slot_171_9_0.run
		slot_171_20_1 = slot_171_9_0 ~= nil and slot_171_9_0.run_yaw or 0
		slot_171_6_0.run, slot_171_6_0.run_yaw = slot_171_19_1, slot_171_20_1

		if slot_171_19_1 and slot_171_18_1 < slot_171_19_1 then
			-- block empty
		elseif slot_171_7_0 == slot_0_140_5 then
			slot_171_7_0 = slot_0_141_5
			slot_171_6_0.state = slot_171_7_0
		end

		if slot_171_19_1 then
			if slot_171_9_0 ~= nil and slot_171_9_0.run_speed then
				arg_171_1:SetButton(slot_0_69_0)
			end

			arg_171_1:SetButton(slot_0_63_0)
			arg_171_1:SetForwardMove(1)

			slot_171_21_0 = slot_171_8_0.y + slot_171_20_1

			arg_171_1:RotateMovement(slot_171_21_0)
		end
	end

	if slot_171_7_0 == slot_0_141_5 then
		if slot_171_9_0 ~= nil and slot_171_9_0.jump then
			arg_171_1:SetButton(slot_0_61_0)
		end

		slot_171_7_0 = slot_0_142_5
		slot_171_6_0.state = slot_171_7_0
		slot_171_6_0.throw_at = slot_171_5_0
	end

	slot_171_18_0 = slot_171_9_0 ~= nil and slot_171_9_0.delay or 0

	if slot_171_16_0 then
		slot_171_18_0 = 12 + slot_171_18_0 * 2
	end

	if slot_171_7_0 == slot_0_142_5 then
		slot_171_19_0 = slot_171_5_0 - slot_171_6_0.throw_at

		if slot_171_18_0 <= slot_171_19_0 then
			arg_171_1:RemoveButton(slot_0_59_0)
			arg_171_1:RemoveButton(slot_0_60_0)

			slot_171_6_0.recovery_yaw = slot_171_9_0 and slot_171_9_0.recovery_yaw and slot_171_9_0.recovery_yaw or slot_171_9_0 and (slot_171_9_0.recovery_jump or slot_171_9_0.jump) and 180
		end

		if slot_171_18_0 < slot_171_19_0 then
			slot_171_6_0.thrown_at = slot_171_5_0
		end

		slot_171_20_0 = arg_171_3.m_fThrowTime

		if slot_171_20_0 then
			slot_171_20_0 = slot_171_20_0:Get()
			slot_171_20_0 = slot_171_20_0.value
		end

		if slot_171_20_0 == 0 and not slot_171_15_0 and slot_171_6_0.thrown_at and slot_171_6_0.thrown_at > slot_171_6_0.throw_at then
			slot_171_6_0.state = slot_0_143_5
		end
	end
end

function slot_0_145_10(arg_172_0, arg_172_1, arg_172_2, arg_172_3, arg_172_4)
	local var_172_0 = slot_0_119_0.data

	if var_172_0 == nil then
		var_172_0 = {}
		slot_0_119_0.data = var_172_0
	end

	if var_172_0.start_at == nil then
		var_172_0.start_at = arg_172_1.commandNumber
	end

	local var_172_1 = arg_172_1.commandNumber - var_172_0.start_at + 1
	local var_172_2 = arg_172_0.movement
	local var_172_3 = var_172_2[var_172_1]

	if var_172_3 == nil then
		slot_0_119_0 = nil

		return
	end

	local var_172_4 = arg_172_0.weapon ~= "weapon_knife"
	local var_172_5 = var_172_0.start_step_with_attack

	if var_172_4 and var_172_5 == nil then
		local var_172_6 = #var_172_2

		for iter_172_0 = 1, var_172_6 do
			local var_172_7 = var_172_2[iter_172_0].buttons or 0

			if slot_0_56_0(var_172_7, slot_0_59_0) ~= 0 or slot_0_56_0(var_172_7, slot_0_60_0) ~= 0 then
				var_172_5 = iter_172_0
				var_172_0.start_step_with_attack = var_172_5

				break
			end

			if var_172_6 == iter_172_0 then
				var_172_5 = false
				var_172_0.start_step_with_attack = var_172_5
			end
		end
	end

	local var_172_8 = arg_172_0.settings

	slot_0_135_0(slot_0_124_0, var_172_8.autostrafer or 0)
	slot_0_135_0(slot_0_125_0, var_172_8.autostrafer_turn_angle or 50)
	slot_0_135_0(slot_0_126_0, var_172_8.autostrafer_boost or 100)
	slot_0_135_0(slot_0_127_0, var_172_8.standalone_quick_stop or false)
	slot_0_135_0(slot_0_122_0, var_172_8.jumpbug or false)
	slot_0_135_0(slot_0_123_0, var_172_8.edge_jump or false)

	local var_172_9 = var_172_3.viewangles
	local var_172_10 = slot_0_7_0(var_172_9[1], var_172_9[2], 0)

	if slot_0_131_0 == 1 then
		arg_172_1:SetViewangles(var_172_10)
	else
		arg_172_1:SetViewangles(var_172_10)
		arg_172_1:LockAngles()
	end

	local var_172_11 = var_172_3.forwardmove or 0
	local var_172_12 = var_172_3.leftmove or 0

	arg_172_1:SetForwardMove(var_172_11)
	arg_172_1:SetLeftMove(var_172_12)

	if var_172_4 and var_172_5 then
		arg_172_1:SetButton(slot_0_59_0)
		arg_172_1:SetButton(slot_0_60_0)
	end

	local var_172_13 = var_172_3.buttons or 0

	for iter_172_1 = 1, #slot_0_70_0 do
		local var_172_14 = slot_0_70_0[iter_172_1]

		if slot_0_56_0(var_172_13, var_172_14) ~= 0 then
			arg_172_1:SetButton(var_172_14)
		elseif var_172_5 and var_172_5 <= var_172_1 and (var_172_14 == slot_0_59_0 or var_172_14 == slot_0_60_0) then
			arg_172_1:RemoveButton(var_172_14)
		end
	end
end

function slot_0_137_2(arg_173_0, arg_173_1, arg_173_2, arg_173_3)
	if slot_0_119_0 == nil then
		slot_0_136_0()

		return
	end

	slot_0_135_0(slot_0_130_0, 0)
	slot_0_135_0(slot_0_120_0, false)
	slot_0_135_0(slot_0_121_0, false)
	slot_0_135_0(slot_0_122_0, false)
	slot_0_135_0(slot_0_123_0, false)
	slot_0_135_0(slot_0_124_0, 0)
	slot_0_135_0(slot_0_127_0, false)
	slot_0_135_0(slot_0_128_0, false)

	local var_173_0 = slot_0_119_0.location

	if var_173_0 == nil then
		return
	end

	if var_173_0.movement ~= nil then
		return slot_0_145_10(var_173_0, arg_173_0, arg_173_1, arg_173_2, arg_173_3)
	end

	slot_0_144_6(var_173_0, arg_173_0, arg_173_1, arg_173_2, arg_173_3)
end

slot_0_138_2 = nil

events.overrideView:Add(function(arg_174_0)
	slot_0_138_2 = arg_174_0.m_vecOrigin
end)

slot_0_139_3 = nil
slot_0_140_4 = slot_0_7_0(0, 0, 61)
slot_0_141_4 = slot_0_7_0(0, 0, 6)

function slot_0_142_4(arg_175_0, arg_175_1)
	local var_175_0 = slot_0_105_0.editing_sources:get() > 1
	local var_175_1 = slot_0_105_0.options:get(2) and not var_175_0
	local var_175_2 = {}

	for iter_175_0 = arg_175_1, 1, -1 do
		local var_175_3 = arg_175_0[iter_175_0]
		local var_175_4 = var_175_3.name

		if slot_0_50_0(var_175_4) == "table" then
			var_175_3.name = var_175_4[2] or var_175_4
		end

		local var_175_5 = var_175_3.position

		if slot_0_50_0(var_175_5) == "table" then
			var_175_5 = slot_0_7_0(var_175_5[1], var_175_5[2], var_175_5[3])
			var_175_3.position = var_175_5
			var_175_3.render_position = slot_0_7_0(var_175_5.x, var_175_5.y, var_175_5.z)
		end

		local var_175_6 = var_175_3.viewangles

		if slot_0_50_0(var_175_6) == "table" then
			var_175_6 = slot_0_7_0(var_175_6[1], var_175_6[2], 0)
			var_175_3.viewangles = var_175_6
			var_175_3.viewangles_forward = var_175_5 + slot_0_140_4 + slot_0_13_0(var_175_6) * slot_0_7_0(700, 700, 700)
		end

		local var_175_7 = var_175_3.throw_points or var_175_3.points

		if var_175_7 ~= nil and #var_175_7 > 4 then
			for iter_175_1, iter_175_2 in slot_0_48_0(var_175_7) do
				if slot_0_50_0(iter_175_2) == "table" then
					var_175_7[iter_175_1] = slot_0_7_0(iter_175_2[1], iter_175_2[2], iter_175_2[3])
				end
			end

			var_175_3.points = var_175_7
			var_175_3.detonate_position = var_175_7[#var_175_7]
		else
			var_175_3.points = nil
			var_175_3.detonate_position = nil
		end

		local var_175_8 = var_175_3.end_position

		if slot_0_50_0(var_175_8) == "table" then
			var_175_3.end_position = slot_0_7_0(var_175_8[1], var_175_8[2], var_175_8[3])
		end

		var_175_3.in_fov_select = 0
		var_175_3.on_screen = 0

		local var_175_9 = var_175_3.movement

		if var_175_9 ~= nil and var_175_3.settings == nil or var_175_9 ~= nil and (slot_0_50_0(var_175_9) ~= "table" or #var_175_9 == 0) then
			slot_0_44_0(arg_175_0, iter_175_0)
		elseif var_175_1 then
			local var_175_10 = slot_0_38_0("%s:%s:%s::%s:%s", var_175_5.x, var_175_5.y, var_175_5.z, var_175_6.x, var_175_6.y)

			if var_175_2[var_175_10] ~= nil then
				slot_0_44_0(arg_175_0, iter_175_0)
			else
				var_175_2[var_175_10] = true
			end
		end
	end
end

function slot_0_139_2(arg_176_0, arg_176_1, arg_176_2)
	if slot_0_115_0[arg_176_2] ~= nil then
		return
	end

	slot_0_142_4(arg_176_0, arg_176_1)

	for iter_176_0 = 1, arg_176_1 do
		local var_176_0 = arg_176_0[iter_176_0]

		if var_176_0 ~= nil then
			local var_176_1 = var_176_0.render_position
			local var_176_2 = var_176_1
			local var_176_3 = {
				var_176_0
			}

			for iter_176_1 = arg_176_1, iter_176_0 + 1, -1 do
				local var_176_4 = arg_176_0[iter_176_1]

				if var_176_4 ~= nil then
					local var_176_5 = var_176_4.render_position

					if slot_0_9_0(var_176_1, var_176_5) <= 20 then
						var_176_2 = var_176_2 + var_176_5
						var_176_3[#var_176_3 + 1] = var_176_4

						slot_0_44_0(arg_176_0, iter_176_1)
					end
				end
			end

			local var_176_6 = #var_176_3
			local var_176_7 = var_176_2 / slot_0_7_0(var_176_6, var_176_6, var_176_6)
			local var_176_8 = {
				visible_alpha = 0,
				viewangles_alpha = 0,
				distance_width = 0,
				weapon = var_176_0.weapon,
				position = var_176_7,
				world_position = var_176_7 + slot_0_141_4
			}
			local var_176_9 = {}
			local var_176_10 = false
			local var_176_11 = false

			for iter_176_2 = 1, var_176_6 do
				local var_176_12 = var_176_3[iter_176_2]
				local var_176_13 = var_176_12.name

				if var_176_12.editing then
					var_176_11 = true

					if var_176_6 == 1 then
						var_176_9[#var_176_9 + 1] = var_176_13
						var_176_10 = true
					else
						var_176_9[#var_176_9 + 1] = "<editing>" .. var_176_13
					end
				else
					var_176_9[#var_176_9 + 1] = var_176_13
				end

				var_176_8[iter_176_2] = var_176_12
			end

			local var_176_14 = slot_0_46_0(var_176_9, "\b\n")
			local var_176_15 = slot_0_36_0(var_176_14, "<editing>", "")
			local var_176_16 = slot_0_106_0:GetTextSize(var_176_15)

			var_176_8.text = var_176_14
			var_176_8.width, var_176_8.height = var_176_16.x, var_176_16.y
			var_176_8.is_one_editing, var_176_8.is_have_editing = var_176_10, var_176_11
			arg_176_0[iter_176_0] = var_176_8
		end
	end

	slot_0_115_0[arg_176_2] = true
end

slot_0_140_3 = nil
slot_0_141_3 = {}
slot_0_142_3 = nil
slot_0_143_4 = 0

function slot_0_144_5(arg_177_0, arg_177_1)
	return arg_177_0.distance > arg_177_1.distance
end

function slot_0_145_9(arg_178_0, arg_178_1, arg_178_2)
	slot_0_45_0(arg_178_0, slot_0_144_5)

	slot_0_116_0, slot_0_117_0 = arg_178_0[arg_178_1], 1

	if slot_0_116_0 == nil then
		return
	end

	local var_178_0 = slot_0_9_0(arg_178_2, slot_0_116_0.position)

	if var_178_0 > 65 then
		slot_0_116_0 = nil

		return
	end

	slot_0_117_0 = 0.4 + slot_0_96_0(var_178_0, 0, 0.6, 65)
end

function slot_0_140_2(arg_179_0, arg_179_1, arg_179_2)
	if slot_0_142_3 ~= arg_179_2 then
		slot_0_142_3 = arg_179_2
		slot_0_113_0 = nil

		slot_0_95_0()
	end

	if slot_0_113_0 == nil then
		slot_0_113_0, slot_0_114_0 = slot_0_112_0[arg_179_2] or false, {}

		if slot_0_113_0 then
			for iter_179_0, iter_179_1 in slot_0_48_0(slot_0_113_0) do
				iter_179_1.visible_alpha = 0
				iter_179_1.distance_width = 0
				iter_179_1.viewangles_alpha = 0
			end
		end

		slot_0_143_4 = 0
	end

	if not slot_0_113_0 then
		return
	end

	local var_179_0 = #slot_0_113_0

	if var_179_0 == 0 then
		return
	end

	slot_0_139_2(slot_0_113_0, var_179_0, arg_179_2)

	local var_179_1 = #slot_0_113_0
	local var_179_2 = game.globalVars.m_flRealTime

	if var_179_2 > slot_0_143_4 + 0.2 then
		slot_0_143_4 = var_179_2
		slot_0_114_0, slot_0_141_3 = {}, {}

		for iter_179_2 = 1, var_179_1 do
			local var_179_3 = slot_0_113_0[iter_179_2]
			local var_179_4 = slot_0_9_0(arg_179_1, var_179_3.position)

			var_179_3.distance = var_179_4

			if var_179_4 <= 1250 then
				slot_0_114_0[#slot_0_114_0 + 1] = var_179_3

				if var_179_4 <= 75 then
					slot_0_141_3[#slot_0_141_3 + 1] = var_179_3
				end

				local var_179_5 = slot_0_81_0(slot_0_138_2, var_179_3.world_position)

				var_179_3.distance_alpha = slot_0_97_0(1 - var_179_4 / 1250, 0, 1, 1)
				var_179_3.is_visible = var_179_5.fraction > 0.97
				var_179_3.in_range = var_179_4 <= 650
			else
				var_179_3.distance_width = 0
				var_179_3.in_range = false
			end
		end

		return slot_0_145_9(slot_0_141_3, #slot_0_141_3, arg_179_1)
	end

	local var_179_6 = #slot_0_141_3

	if var_179_6 == 0 then
		return
	end

	for iter_179_3 = 1, var_179_6 do
		local var_179_7 = slot_0_141_3[iter_179_3]

		if var_179_7.distance > 65 then
			var_179_7.distance = slot_0_9_0(arg_179_1, var_179_7.position)

			for iter_179_4 = 1, #var_179_7 do
				local var_179_8 = var_179_7[iter_179_4]

				var_179_8.in_fov_select = 0
				var_179_8.on_screen = 0
			end
		end
	end

	if slot_0_119_0 ~= nil then
		return
	end

	slot_0_145_9(slot_0_141_3, var_179_6, arg_179_1)
end

slot_0_141_2 = game.cvar:Find("sv_quantize_movement_input")
slot_0_142_2 = slot_0_105_0.hotkey

function slot_0_143_3(arg_180_0)
	if slot_0_138_2 == nil then
		slot_0_113_0 = nil
		slot_0_119_0 = nil

		slot_0_136_0()

		return
	end

	slot_180_1_0 = slot_0_25_0()

	if slot_180_1_0 == nil or not slot_180_1_0:IsAlive() then
		slot_0_113_0 = nil
		slot_0_119_0 = nil

		slot_0_136_0()

		return
	end

	slot_180_2_0 = slot_180_1_0:GetActiveWeapon()

	if slot_180_2_0 == nil then
		slot_0_113_0 = nil
		slot_0_119_0 = nil

		slot_0_136_0()

		return
	end

	slot_180_3_0 = slot_0_111_0(slot_180_2_0)
	slot_180_4_0 = slot_180_1_0:GetAbsOrigin()

	slot_0_140_2(slot_180_2_0, slot_180_4_0, slot_180_3_0)

	if not slot_0_142_2:get_hotkey_state() then
		slot_0_119_0 = nil

		slot_0_136_0()

		return
	end

	slot_0_137_2(arg_180_0, slot_180_1_0, slot_180_2_0, slot_180_3_0)

	if slot_0_118_0 ~= nil and slot_0_119_0 == nil then
		slot_180_6_0 = slot_180_1_0.m_fFlags:Get()
		slot_180_7_0 = slot_0_56_0(slot_180_6_0, 1) == 1
		slot_180_8_0 = slot_0_118_0.on_position
		slot_180_9_0 = arg_180_0:GetButton(slot_0_63_0) or arg_180_0:GetButton(slot_0_64_0) or arg_180_0:GetButton(slot_0_67_0) or arg_180_0:GetButton(slot_0_68_0) or arg_180_0:GetButton(slot_0_61_0)

		if not slot_180_8_0 and not slot_180_9_0 then
			slot_0_135_0(slot_0_127_0, false)
			slot_0_135_0(slot_0_128_0, false)

			slot_180_10_1 = slot_0_118_0.position
			slot_180_11_3 = slot_0_9_0(slot_180_4_0, slot_180_10_1)
			slot_180_12_0 = slot_0_10_0(slot_180_4_0, slot_180_10_1)

			if slot_180_12_0 < 1.5 then
				slot_180_11_3 = slot_180_12_0
			end

			arg_180_0:SetLeftMove(0)
			arg_180_0:RemoveButton(slot_0_67_0)
			arg_180_0:RemoveButton(slot_0_68_0)

			slot_180_13_1 = slot_180_10_1 - slot_180_4_0
			slot_180_13_1.z = 0
			slot_180_14_1 = slot_0_24_0(slot_180_13_1)

			if slot_0_141_2.value then
				if slot_180_11_3 < 14 then
					slot_0_135_0(slot_0_128_0, true)
					slot_0_135_0(slot_0_129_0, slot_0_26_0(100, slot_0_27_0(26, slot_180_11_3 * 10)))

					if slot_180_11_3 < 0.65 and slot_180_11_3 > 0.05 then
						arg_180_0:SetButton(slot_0_62_0)
					end
				end

				arg_180_0:SetForwardMove(1)
			else
				slot_180_15_2 = 245
				slot_180_16_2 = 0

				if slot_180_11_3 < 1.5 then
					slot_180_16_2 = slot_180_11_3 * 20
				else
					slot_180_17_1 = slot_180_1_0:GetAbsVelocity()
					slot_180_18_2 = 4
					slot_180_19_1 = slot_180_4_0 + slot_180_17_1 * slot_0_7_0(0.015625 * slot_180_18_2, 0.015625 * slot_180_18_2, 0.015625 * slot_180_18_2)
					slot_180_20_1 = slot_0_9_0(slot_180_19_1, slot_180_10_1)
					slot_180_21_1 = slot_0_10_0(slot_180_19_1, slot_180_10_1)

					if slot_180_21_1 < 1.5 then
						slot_180_20_1 = slot_180_21_1
					end

					slot_180_16_2 = slot_180_20_1 * 50

					if slot_180_20_1 < 2 then
						slot_180_16_2 = slot_180_16_2 * 0.33
					end

					slot_180_22_1 = slot_180_10_1 - slot_180_19_1
					slot_180_22_1.z = 0
					slot_180_14_1 = slot_0_24_0(slot_180_22_1)
				end

				slot_180_18_1 = slot_180_1_0.m_pMovementServices:Get().m_flDuckAmount:Get()
				slot_180_16_1 = slot_0_27_0(1.1, slot_0_26_0(slot_180_15_2, slot_180_16_2 + slot_180_18_1 * 50))

				arg_180_0:SetForwardMove(slot_180_16_1 / slot_180_15_2)
			end

			slot_180_15_1 = slot_180_14_1.y

			arg_180_0:RotateMovement(slot_180_15_1)
		end

		if slot_0_118_0.weapon ~= "weapon_wallbang" then
			slot_180_10_0 = arg_180_0:GetButton(slot_0_59_0) or arg_180_0:GetButton(slot_0_60_0)

			if slot_180_10_0 then
				slot_180_11_2 = slot_0_118_0.grenade and slot_0_118_0.grenade.strength

				if slot_180_11_2 == 0 then
					arg_180_0:RemoveButton(slot_0_59_0)
					arg_180_0:SetButton(slot_0_60_0)
				elseif slot_180_11_2 == 0.5 then
					arg_180_0:SetButton(slot_0_59_0)
					arg_180_0:SetButton(slot_0_60_0)
				else
					arg_180_0:SetButton(slot_0_59_0)
					arg_180_0:RemoveButton(slot_0_60_0)
				end
			end

			slot_180_11_1 = slot_180_1_0:GetAbsVelocity()
			slot_180_11_0 = slot_0_12_0(slot_180_11_1)
			slot_180_13_0 = slot_180_1_0.m_pWeaponServices:Get().m_flNextAttack:Get().value
			slot_180_14_0 = slot_180_2_0.m_bPinPulled or false
			slot_180_14_0 = slot_180_14_0 and slot_180_14_0:Get()
			slot_180_15_0 = slot_0_118_0.movement ~= nil

			if slot_180_15_0 and not slot_180_10_0 then
				arg_180_0:RemoveButton(slot_0_59_0)
				arg_180_0:RemoveButton(slot_0_60_0)
			end

			slot_180_16_0 = slot_0_134_0 and slot_180_13_0 < game.globalVars.m_flCurTime or slot_180_15_0 and slot_180_10_0 or slot_180_14_0

			if slot_180_8_0 and slot_180_16_0 and slot_180_11_0 < 2 then
				slot_180_17_0 = slot_0_1_0(slot_0_0_0)
				slot_180_18_0 = slot_180_17_0 - slot_0_118_0.viewangles
				slot_180_18_0.y = slot_0_23_0(slot_180_18_0.y)
				slot_180_19_0 = slot_180_18_0.x
				slot_180_20_0 = slot_180_18_0.y
				slot_180_21_0 = slot_0_11_0(slot_180_18_0)
				slot_180_22_0 = slot_0_132_0

				if slot_0_131_0 ~= 1 then
					slot_180_22_0 = 0.3
				end

				slot_180_23_0 = slot_180_21_0 <= slot_180_22_0

				if not slot_180_23_0 and slot_0_131_0 == 2 then
					slot_180_24_0 = slot_0_26_0(1, slot_180_21_0 / 3) * 0.5
					slot_180_25_0 = (slot_180_24_0 + slot_0_33_0(slot_180_21_0 * (1 - slot_180_24_0))) * game.globalVars.m_flRenderFrameTime * slot_0_133_0
					slot_180_26_0 = slot_0_7_0(slot_180_17_0.x - slot_180_19_0 / slot_180_21_0 * slot_180_25_0, slot_180_17_0.y - slot_180_20_0 / slot_180_21_0 * slot_180_25_0, 0)

					arg_180_0:SetViewangles(slot_180_26_0)
					arg_180_0:LockAngles()
				end

				if slot_180_23_0 then
					slot_0_119_0 = {
						location = slot_0_118_0
					}
				end
			end
		end
	end
end

events.createMove:Add(slot_0_143_3)

slot_0_137_1, slot_0_138_1 = slot_0_2_0:GetScreenSize()
slot_0_139_1 = slot_0_137_1 * 0.5
slot_0_140_1 = slot_0_138_1 * 0.5
slot_0_141_1 = slot_0_3_0(255, 245, 5, 255)
slot_0_142_1 = slot_0_3_0(20, 236, 0, 255)
slot_0_143_2 = slot_0_3_0(140, 140, 140, 255)
slot_0_144_4 = nil
slot_0_145_8 = nil
slot_0_144_3 = {
	weapon_smokegrenade = draw.SvgTexture(slot_0_86_0("panorama\\images\\icons\\equipment\\smokegrenade.vsvg_c")),
	weapon_flashbang = draw.SvgTexture(slot_0_86_0("panorama\\images\\icons\\equipment\\flashbang.vsvg_c")),
	weapon_decoy = draw.SvgTexture(slot_0_86_0("panorama\\images\\icons\\equipment\\decoy.vsvg_c")),
	weapon_hegrenade = draw.SvgTexture(slot_0_86_0("panorama\\images\\icons\\equipment\\hegrenade.vsvg_c")),
	weapon_molotov = draw.SvgTexture(slot_0_86_0("panorama\\images\\icons\\equipment\\molotov.vsvg_c")),
	weapon_wallbang = draw.SvgTexture(slot_0_86_0("panorama\\images\\icons\\ui\\bullet.vsvg_c")),
	weapon_knife = draw.SvgTexture(slot_0_86_0("panorama\\images\\hud\\deathnotice\\inairkill.vsvg_c"))
}

for iter_0_0, iter_0_1 in slot_0_49_0(slot_0_144_3) do
	iter_0_1:Create()
end

slot_0_146_8 = {
	0.1,
	0,
	0.2,
	0
}
slot_0_145_7 = setmetatable({}, {
	__index = function(arg_181_0, arg_181_1)
		arg_181_0[arg_181_1] = setmetatable({}, {
			__index = function(arg_182_0, arg_182_1)
				local var_182_0 = arg_181_1:GetSize()
				local var_182_1 = var_182_0.x * arg_182_1 / var_182_0.y
				local var_182_2 = arg_182_1
				local var_182_3 = slot_0_146_8[1] * var_182_1
				local var_182_4 = slot_0_146_8[2] * var_182_2
				local var_182_5 = var_182_1 + slot_0_146_8[3] * var_182_1
				local var_182_6 = var_182_2 + slot_0_146_8[4] * var_182_2
				local var_182_7 = {
					var_182_5,
					var_182_6,
					var_182_3,
					var_182_4,
					slot_0_7_0(var_182_1, var_182_2, 0)
				}

				if slot_0_51_0(var_182_7[1]) ~= "nan" then
					arg_182_0[arg_182_1] = var_182_7
				end

				return var_182_7
			end
		})

		return arg_181_0[arg_181_1]
	end
})

function slot_0_146_7(arg_183_0, arg_183_1)
	return arg_183_0.fov > arg_183_1.fov
end

slot_0_147_5 = nil
slot_0_148_4 = ffi.typeof("            struct {\n                float matrix[4][4];\n            }\n        ")
slot_0_149_6 = slot_0_73_0("client.dll", "48 8D 0D ? ? ? ? 48 C1 E0 06") or error("Failed to find 'viewmatrix'. Please wait for script update!")
slot_0_149_5 = slot_0_80_0(slot_0_149_6, 3)
slot_0_149_4 = slot_0_53_0(ffi.typeof("$*", slot_0_148_4), slot_0_149_5)[0]

function slot_0_150_5(arg_184_0, arg_184_1, arg_184_2, arg_184_3, arg_184_4, arg_184_5, arg_184_6, arg_184_7)
	local var_184_0 = arg_184_0 * arg_184_3 - arg_184_1 * arg_184_2
	local var_184_1 = arg_184_4 * arg_184_7 - arg_184_5 * arg_184_6
	local var_184_2 = (arg_184_0 - arg_184_2) * (arg_184_5 - arg_184_7) - (arg_184_1 - arg_184_3) * (arg_184_4 - arg_184_6)

	return (var_184_0 * (arg_184_4 - arg_184_6) - (arg_184_0 - arg_184_2) * var_184_1) / var_184_2, (var_184_0 * (arg_184_5 - arg_184_7) - (arg_184_1 - arg_184_3) * var_184_1) / var_184_2
end

function slot_0_147_4(arg_185_0, arg_185_1)
	local var_185_0 = arg_185_0.x
	local var_185_1 = arg_185_0.y
	local var_185_2 = arg_185_0.z
	local var_185_3 = slot_0_149_4.matrix
	local var_185_4 = var_185_3[0]
	local var_185_5 = var_185_3[1]
	local var_185_6 = var_185_3[3]
	local var_185_7, var_185_8, var_185_9 = var_185_4[0] * var_185_0 + var_185_4[1] * var_185_1 + var_185_4[2] * var_185_2 + var_185_4[3], var_185_5[0] * var_185_0 + var_185_5[1] * var_185_1 + var_185_5[2] * var_185_2 + var_185_5[3], var_185_6[0] * var_185_0 + var_185_6[1] * var_185_1 + var_185_6[2] * var_185_2 + var_185_6[3]
	local var_185_10 = var_185_9 >= 0.001
	local var_185_11 = (var_185_10 and 1 or -1) / var_185_9
	local var_185_12, var_185_13 = var_185_7 * var_185_11, var_185_8 * var_185_11
	local var_185_14, var_185_15 = slot_0_139_1 + (0.5 * var_185_12 * slot_0_137_1 + 0.5), slot_0_140_1 - (0.5 * var_185_13 * slot_0_138_1 + 0.5)

	if not var_185_10 or var_185_14 < arg_185_1 or var_185_14 > slot_0_137_1 - arg_185_1 or var_185_15 < arg_185_1 or var_185_15 > slot_0_138_1 - arg_185_1 then
		if not var_185_10 then
			local var_185_16 = slot_0_32_0(var_185_15 - slot_0_140_1, var_185_14 - slot_0_139_1)
			local var_185_17 = slot_0_27_0(slot_0_137_1, slot_0_138_1)

			var_185_14, var_185_15 = slot_0_139_1 + var_185_17 * slot_0_30_0(var_185_16), slot_0_140_1 + var_185_17 * slot_0_31_0(var_185_16)
		end

		local var_185_18 = {
			arg_185_1,
			arg_185_1,
			slot_0_137_1 - arg_185_1,
			arg_185_1,
			slot_0_137_1 - arg_185_1,
			arg_185_1,
			slot_0_137_1 - arg_185_1,
			slot_0_138_1 - arg_185_1,
			arg_185_1,
			arg_185_1,
			arg_185_1,
			slot_0_138_1 - arg_185_1,
			arg_185_1,
			slot_0_138_1 - arg_185_1,
			slot_0_137_1 - arg_185_1,
			slot_0_138_1 - arg_185_1
		}

		for iter_185_0 = 1, 16, 4 do
			local var_185_19 = var_185_18[iter_185_0]
			local var_185_20 = var_185_18[iter_185_0 + 1]
			local var_185_21 = var_185_18[iter_185_0 + 2]
			local var_185_22 = var_185_18[iter_185_0 + 3]
			local var_185_23, var_185_24 = slot_0_150_5(var_185_19, var_185_20, var_185_21, var_185_22, slot_0_139_1, slot_0_140_1, var_185_14, var_185_15)

			if iter_185_0 == 1 and var_185_15 < arg_185_1 and arg_185_1 <= var_185_23 and var_185_23 <= slot_0_137_1 - arg_185_1 or iter_185_0 == 5 and var_185_14 > slot_0_137_1 - arg_185_1 and arg_185_1 <= var_185_24 and var_185_24 <= slot_0_138_1 - arg_185_1 or iter_185_0 == 9 and var_185_14 < arg_185_1 and arg_185_1 <= var_185_24 and var_185_24 <= slot_0_138_1 - arg_185_1 or iter_185_0 == 13 and var_185_15 > slot_0_138_1 - arg_185_1 and arg_185_1 <= var_185_23 and var_185_23 <= slot_0_137_1 - arg_185_1 then
				return slot_0_5_0(var_185_23, var_185_24), false
			end
		end

		return slot_0_5_0(var_185_14, var_185_15), false
	end

	return slot_0_5_0(var_185_14, var_185_15), true
end

slot_0_148_3 = nil
slot_0_149_3 = nil
slot_0_150_4 = nil
slot_0_151_3 = nil
slot_0_152_3 = nil
slot_0_153_4 = nil
slot_0_154_5 = nil

slot_0_105_0.color:set_callback(function(arg_186_0)
	local var_186_0 = arg_186_0:get()

	slot_0_148_3 = var_186_0:GetR()
	slot_0_149_3 = var_186_0:GetG()
	slot_0_150_4 = var_186_0:GetB()
	slot_0_151_3 = slot_0_27_0(135, var_186_0:GetA()) / 255
end, true)
slot_0_105_0.options:set_callback(function(arg_187_0)
	slot_0_152_3 = arg_187_0:get(1)
	slot_0_153_4 = arg_187_0:get(3)
	slot_0_154_5 = arg_187_0:get(4)
end, true)

function slot_0_155_5(arg_188_0, arg_188_1)
	if slot_0_116_0 == nil then
		slot_0_95_0()

		return
	end

	slot_188_2_0 = nil

	if slot_0_119_0 ~= nil then
		slot_188_2_0 = slot_0_119_0.location
	end

	slot_188_3_0 = slot_0_116_0.viewangles_alpha

	if slot_0_116_0 == slot_188_2_0 then
		slot_188_3_0 = 1
		slot_0_116_0.viewangles_alpha = slot_188_3_0
		slot_188_3_0 = slot_0_99_0(slot_188_3_0, 0, 1, 1)
	elseif slot_188_3_0 < 1 then
		slot_188_3_0 = slot_0_26_0(1, slot_188_3_0 + arg_188_1 * 6)
		slot_0_116_0.viewangles_alpha = slot_188_3_0
		slot_188_3_0 = slot_0_99_0(slot_188_3_0, 0, 1, 1)
	end

	if slot_188_3_0 == 0 then
		slot_0_95_0()

		return
	end

	slot_188_4_0 = arg_188_0:GetAbsOrigin()
	slot_188_5_0 = slot_0_1_0(slot_0_0_0)
	slot_188_7_0 = arg_188_0.m_pMovementServices:Get().m_flDuckAmount:Get()
	slot_188_8_0 = #slot_0_116_0

	for iter_188_0 = 1, slot_188_8_0 do
		slot_188_13_2 = slot_0_116_0[iter_188_0]
		slot_188_14_2 = slot_188_5_0 - slot_188_13_2.viewangles
		slot_188_14_2.y = slot_0_23_0(slot_188_14_2.y)
		slot_188_15_1 = slot_0_11_0(slot_188_14_2)
		slot_188_16_1 = slot_188_13_2.position
		slot_188_17_1 = slot_0_9_0(slot_188_4_0, slot_188_16_1)
		slot_188_18_1 = slot_0_10_0(slot_188_4_0, slot_188_16_1)

		if slot_188_18_1 < 1.5 then
			slot_188_17_1 = slot_188_18_1
		end

		slot_188_13_2.fov, slot_188_13_2.is_on_fov = slot_188_15_1, slot_188_15_1 <= slot_0_132_0
		slot_188_13_2.distance = slot_188_17_1
		slot_188_13_2.on_position = slot_188_17_1 <= 0.1
	end

	slot_0_45_0(slot_0_116_0, slot_0_146_7)

	slot_0_118_0 = slot_0_116_0[slot_188_8_0]
	slot_188_9_0 = nil

	for iter_188_1 = 1, slot_188_8_0 do
		slot_188_14_1 = slot_0_116_0[iter_188_1]
		slot_188_15_0 = slot_188_14_1 == slot_0_118_0
		slot_188_16_0 = slot_188_14_1.is_on_fov
		slot_188_17_0 = slot_188_15_0 and slot_188_16_0
		slot_188_18_0 = slot_188_14_1.on_position or slot_188_14_1 == slot_188_2_0
		slot_188_19_0, slot_188_20_0 = slot_0_147_4(slot_188_14_1.viewangles_forward, 40)
		slot_188_21_0 = slot_188_14_1.on_screen

		if slot_188_20_0 and slot_188_21_0 < 1 then
			slot_188_21_0 = slot_0_26_0(1, slot_188_21_0 + arg_188_1 * 4.5)
			slot_188_14_1.on_screen = slot_188_21_0
		elseif not slot_188_20_0 and slot_188_21_0 > 0 then
			slot_188_21_0 = slot_0_27_0(0, slot_188_21_0 - arg_188_1 * 5.5)
			slot_188_14_1.on_screen = slot_188_21_0
		end

		slot_188_22_1 = (0.5 + slot_188_21_0 * 0.5) * slot_188_3_0
		slot_188_22_0 = slot_0_151_3 * slot_188_22_1
		slot_188_23_0 = slot_0_148_3
		slot_188_24_0 = slot_0_149_3
		slot_188_25_0 = slot_0_150_4

		if slot_188_14_1.editing then
			slot_188_23_0, slot_188_24_0, slot_188_25_0 = 255, 16, 16
		end

		slot_188_27_0 = 255 * slot_188_22_0
		slot_188_28_0 = "»" .. slot_188_14_1.name
		slot_188_29_0 = slot_188_14_1.description

		if slot_188_29_0 ~= nil then
			slot_188_29_0 = slot_0_36_0(slot_0_41_0(slot_188_29_0), " ", "  ")
		end

		slot_188_30_0 = slot_0_107_0:GetTextSize(slot_188_28_0)
		slot_188_31_0 = slot_0_5_0()

		if slot_188_29_0 ~= nil then
			slot_188_31_0 = slot_0_108_0:GetTextSize(slot_188_29_0)
		end

		slot_188_32_0 = slot_0_28_0(slot_188_31_0.y * 0.5)
		slot_188_33_0 = slot_0_27_0(slot_188_30_0.x, slot_188_31_0.x)
		slot_188_34_0 = slot_188_30_0.y + slot_188_31_0.y
		slot_188_35_1 = slot_0_28_0(slot_188_30_0.y * 0.5 - 1) * 2.25
		slot_188_36_0 = 0

		if slot_188_21_0 > 0 then
			slot_188_36_0 = slot_0_28_0((slot_188_35_1 + 7) * slot_188_21_0) + slot_188_32_0
			slot_188_33_0 = slot_188_33_0 + slot_188_36_0
		end

		slot_188_37_1 = slot_0_26_0(slot_188_19_0.x - slot_188_35_1 * 0.5 - slot_188_32_0 * 0.5, slot_0_137_1 - 40 - slot_188_33_0)
		slot_188_38_0 = slot_188_19_0.y - slot_188_34_0 * 0.5
		slot_188_39_0 = slot_188_37_1 + slot_188_33_0
		slot_188_40_0 = slot_188_38_0 + slot_188_34_0
		slot_188_41_0 = slot_0_100_0(slot_188_22_0, 0, 1, 1)

		slot_0_18_0(slot_0_14_0, slot_0_6_0(slot_188_37_1 - 2, slot_188_38_0 - 2, slot_188_39_0 + 2, slot_188_40_0 + 2), slot_0_3_0(16, 16, 16, 120 * slot_188_41_0))
		slot_0_17_0(slot_0_14_0, slot_0_6_0(slot_188_37_1 - 3, slot_188_38_0 - 3, slot_188_39_0 + 3, slot_188_40_0 + 3), slot_0_3_0(16, 16, 16, 110 * slot_188_41_0))
		slot_0_17_0(slot_0_14_0, slot_0_6_0(slot_188_37_1 - 4, slot_188_38_0 - 4, slot_188_39_0 + 4, slot_188_40_0 + 4), slot_0_3_0(16, 16, 16, 120 * slot_188_41_0))
		slot_0_17_0(slot_0_14_0, slot_0_6_0(slot_188_37_1 - 5, slot_188_38_0 - 5, slot_188_39_0 + 5, slot_188_40_0 + 5), slot_0_3_0(16, 16, 16, 40 * slot_188_41_0))

		if slot_188_21_0 > 0.5 then
			slot_188_42_3 = slot_188_14_1.in_fov_select

			if slot_188_17_0 and slot_188_42_3 < 1 then
				slot_188_42_3 = slot_0_26_0(1, slot_188_42_3 + arg_188_1 * 2.5 * (slot_188_16_0 and 2 or 1))
				slot_188_14_1.in_fov_select = slot_188_42_3
			elseif not slot_188_17_0 and slot_188_42_3 > 0 then
				slot_188_42_3 = slot_0_27_0(0, slot_188_42_3 - arg_188_1 * 4.5)
				slot_188_14_1.in_fov_select = slot_188_42_3
			end

			slot_188_35_0 = slot_188_35_1 * 0.5
			slot_188_43_3 = slot_0_5_0(slot_188_37_1 + slot_188_35_0 + slot_188_32_0 * 0.5, slot_188_38_0 + slot_188_34_0 * 0.5)

			if slot_188_2_0 == slot_188_14_1 then
				slot_0_21_0(slot_0_14_0, slot_188_43_3, slot_188_35_0, slot_0_3_0(slot_188_23_0, slot_188_24_0, slot_188_25_0, slot_188_27_0))
			else
				slot_188_44_1 = slot_0_4_0(slot_0_141_1, slot_0_142_1, slot_188_18_0 and 1 or 0)
				slot_188_45_3 = slot_0_4_0(slot_0_143_2, slot_188_44_1, slot_188_42_3)
				slot_188_46_3 = slot_188_27_0 * slot_0_101_0(slot_188_21_0, 0, 1, 1)
				slot_188_45_2 = slot_188_45_3:a(slot_188_46_3 / 255)

				slot_0_21_0(slot_0_14_0, slot_188_43_3, slot_188_35_0, slot_188_45_2)
			end
		end

		slot_188_37_0 = slot_188_37_1 + slot_188_36_0

		if slot_188_36_0 > 1 then
			slot_0_17_0(slot_0_14_0, slot_0_6_0(slot_188_37_0 - 4, slot_188_38_0, slot_188_37_0 - 3, slot_188_38_0 + slot_188_34_0), slot_0_3_0(slot_188_23_0, slot_188_24_0, slot_188_25_0, slot_188_27_0 * slot_188_21_0))
		end

		slot_0_14_0.font = slot_0_107_0

		slot_0_20_0(slot_0_14_0, slot_0_5_0(slot_188_37_0 + 1, slot_188_38_0), slot_188_28_0, slot_0_3_0(slot_188_23_0, slot_188_24_0, slot_188_25_0, slot_188_27_0))

		if slot_188_29_0 ~= nil then
			slot_0_14_0.font = slot_0_108_0

			slot_0_20_0(slot_0_14_0, slot_0_5_0(slot_188_37_0 + 1, slot_188_38_0 + slot_188_30_0.y + 2), slot_188_29_0, slot_0_3_0(slot_188_23_0, slot_188_24_0, slot_188_25_0, slot_188_27_0))
		end

		slot_0_14_0.font = slot_0_106_0

		if not slot_0_154_5 then
			slot_188_42_2 = slot_188_14_1.points
			slot_188_43_2 = slot_188_14_1.detonate_position

			if slot_188_42_2 ~= nil and slot_188_43_2 ~= nil and slot_188_14_1.in_fov_select > 0 and slot_188_21_0 > 0 then
				if slot_188_14_1.particle_indexes == nil then
					slot_188_45_1 = {}
					slot_188_46_2 = slot_0_90_0(slot_188_42_2, slot_188_23_0, slot_188_24_0, slot_188_25_0)

					if slot_188_46_2 ~= nil then
						slot_188_45_1[#slot_188_45_1 + 1] = slot_188_46_2
						slot_0_94_0[slot_188_46_2] = slot_188_14_1
						slot_188_46_1 = slot_0_91_0(slot_188_43_2, 30, slot_188_23_0, slot_188_24_0, slot_188_25_0)
						slot_188_45_1[#slot_188_45_1 + 1] = slot_188_46_1
						slot_0_94_0[slot_188_46_1] = slot_188_14_1
					end

					slot_188_14_1.particle_indexes = slot_188_45_1
				else
					slot_188_9_0 = slot_188_14_1
				end
			end
		end

		slot_188_42_1 = slot_188_14_1.end_position

		if slot_188_42_1 ~= nil then
			slot_188_43_1 = slot_188_14_1.position + slot_0_7_0(0, 0, 61)
			slot_188_44_0 = slot_188_42_1 - slot_188_43_1
			slot_188_43_0 = slot_188_43_1 + slot_188_44_0 * slot_0_7_0(0.1, 0.1, 0.1)
			slot_188_42_0 = slot_188_42_1 - slot_188_44_0 * slot_0_7_0(0.06, 0.06, 0.06)
			slot_188_45_0 = {
				slot_188_43_0,
				slot_188_42_0
			}

			if slot_188_14_1.particle_indexes == nil then
				slot_188_46_0 = {}
				slot_188_47_0 = slot_0_90_0(slot_188_45_0, slot_188_23_0, slot_188_24_0, slot_188_25_0)

				if slot_188_47_0 ~= nil then
					slot_188_46_0[#slot_188_46_0 + 1] = slot_188_47_0
					slot_0_94_0[slot_188_47_0] = slot_188_14_1
				end

				slot_188_14_1.particle_indexes = slot_188_46_0
			else
				slot_188_9_0 = slot_188_14_1
			end
		end
	end

	if slot_188_9_0 == nil then
		return
	end

	for iter_188_2, iter_188_3 in slot_0_49_0(slot_0_94_0) do
		if iter_188_3 ~= slot_188_9_0 then
			slot_0_92_0(iter_188_2)

			slot_0_94_0[iter_188_2] = nil
			iter_188_3.particle_indexes = nil
		end
	end
end

function slot_0_156_6()
	slot_0_118_0 = nil
	slot_189_0_0 = slot_0_25_0()

	if slot_189_0_0 == nil or not slot_189_0_0:IsAlive() then
		slot_0_95_0()

		return
	end

	if not slot_0_113_0 then
		slot_0_95_0()

		return
	end

	slot_189_1_0 = #slot_0_114_0

	if slot_189_1_0 == 0 then
		slot_0_95_0()

		return
	end

	slot_0_14_0.font = slot_0_106_0

	if slot_0_154_5 then
		slot_0_95_0()
	end

	slot_189_2_0 = game.globalVars.m_flRenderFrameTime

	for iter_189_0 = 1, slot_189_1_0 do
		slot_189_7_0 = slot_0_114_0[iter_189_0]
		slot_189_8_0 = slot_189_7_0 == slot_0_116_0

		if not slot_189_8_0 then
			slot_189_7_0.viewangles_alpha = 0
		end

		slot_189_9_0 = slot_189_7_0.in_range and (slot_0_117_0 > 0.5 or slot_189_8_0)
		slot_189_10_0 = slot_189_7_0.distance_width

		if slot_189_9_0 and slot_189_10_0 < 1 then
			slot_189_10_0 = slot_0_26_0(1, slot_189_10_0 + slot_189_2_0 * 6)
			slot_189_7_0.distance_width = slot_189_10_0
			slot_189_10_0 = slot_0_96_0(slot_189_10_0, 0, 1, 1)
		elseif not slot_189_9_0 and slot_189_10_0 > 0 then
			slot_189_10_0 = slot_0_27_0(0, slot_189_10_0 - slot_189_2_0 * 6)
			slot_189_7_0.distance_width = slot_189_10_0
			slot_189_10_0 = slot_0_96_0(slot_189_10_0, 0, 1, 1)
		end

		slot_189_11_2 = slot_189_7_0.visible_alpha
		slot_189_12_0 = slot_189_7_0.is_visible
		slot_189_13_0 = slot_0_152_3 and slot_189_10_0 > 0 and 0.45 or 0
		slot_189_14_0 = slot_0_152_3 and slot_189_10_0 > 0 and not slot_189_12_0 and 0.33 or 1

		if slot_189_12_0 and slot_189_11_2 < 1 or slot_189_11_2 < slot_189_13_0 then
			slot_189_11_2 = slot_0_26_0(1, slot_189_11_2 + slot_189_2_0 * 5.5 * slot_189_14_0)
			slot_189_7_0.visible_alpha = slot_189_11_2
			slot_189_11_2 = slot_0_98_0(slot_189_11_2, 0, 1, 1)
		elseif not slot_189_12_0 and slot_189_13_0 < slot_189_11_2 then
			slot_189_11_2 = slot_0_27_0(slot_189_13_0, slot_189_11_2 - slot_189_2_0 * 7.5 * slot_189_14_0)
			slot_189_7_0.visible_alpha = slot_189_11_2
			slot_189_11_2 = slot_0_98_0(slot_189_11_2, 0, 1, 1)
		end

		slot_189_11_1 = slot_189_11_2 * (slot_189_8_0 and 1 or slot_0_117_0) * slot_189_7_0.distance_alpha

		if slot_189_11_1 > 0 then
			slot_189_16_0 = slot_0_22_0(slot_189_7_0.world_position)
			slot_189_17_1 = slot_189_16_0.x
			slot_189_18_1 = slot_189_16_0.y

			if slot_189_17_1 > -100000 and slot_189_17_1 < 100000 and slot_189_18_1 > -100000 and slot_189_18_1 < 100000 then
				slot_189_11_0 = slot_0_151_3 * slot_189_11_1
				slot_189_20_0 = slot_0_148_3
				slot_189_21_0 = slot_0_149_3
				slot_189_22_0 = slot_0_150_4
				slot_189_23_0 = slot_189_11_0 * 255
				slot_189_24_0 = slot_189_7_0.is_have_editing
				slot_189_25_0 = slot_189_7_0.is_one_editing

				if slot_189_24_0 and slot_189_25_0 then
					slot_189_20_0, slot_189_21_0, slot_189_22_0 = 255, 16, 16
				end

				slot_189_26_0 = slot_189_7_0.width
				slot_189_27_0 = slot_189_7_0.height
				slot_189_28_0 = slot_189_7_0.text

				if slot_189_28_0 == nil then
					slot_189_26_0 = 0
					slot_189_27_0 = 0
					slot_189_10_0 = 0
				end

				if slot_189_10_0 < 1 then
					slot_189_26_0, slot_189_27_0 = slot_189_26_0 * slot_189_10_0, slot_189_27_0 * slot_189_10_0
				end

				slot_189_29_0 = slot_0_144_3[slot_189_7_0.weapon]
				slot_189_30_0 = nil
				slot_189_31_0 = nil
				slot_189_32_1 = nil
				slot_189_33_0 = nil

				if slot_0_153_4 and slot_189_10_0 > 0 then
					slot_189_29_0 = nil
				end

				slot_189_34_0 = slot_189_27_0

				if slot_189_29_0 ~= nil then
					slot_189_35_1 = slot_189_7_0.distance - 60
					slot_189_36_1 = slot_0_26_0(17, slot_0_28_0(slot_0_27_0(13, slot_189_27_0 + 2, slot_189_35_1 < 0 and -slot_189_35_1 or 0)))
					slot_189_37_1 = slot_0_145_7[slot_189_29_0][slot_189_36_1]
					slot_189_33_0 = slot_189_37_1[5]
					slot_189_31_0, slot_189_32_0 = slot_189_37_1[1], slot_189_37_1[2]
					slot_189_38_1 = 1 - slot_189_10_0
					slot_189_39_2 = 5 * slot_189_38_1
					slot_189_26_0 = slot_189_26_0 + slot_189_31_0 + 8 * slot_189_10_0 + slot_189_39_2
					slot_189_27_0 = slot_0_27_0(slot_189_32_0, slot_189_27_0) + slot_189_39_2
					slot_189_40_2 = slot_189_17_1 - slot_189_26_0 * 0.5 + slot_189_37_1[3]
					slot_189_41_0 = slot_189_18_1 - slot_189_27_0 + slot_189_37_1[4]

					if slot_189_32_0 < slot_189_34_0 then
						slot_189_41_0 = slot_189_41_0 + (slot_189_34_0 - slot_189_32_0) * 0.5
					end

					slot_189_30_0 = slot_0_7_0(slot_0_28_0(slot_189_40_2) + 3 * slot_189_38_1, slot_0_28_0(slot_189_41_0) + 2 * slot_189_38_1, 0)
				end

				slot_189_17_0, slot_189_18_0 = slot_189_17_1 - slot_189_26_0 * 0.5, slot_189_18_1 - slot_189_27_0
				slot_189_35_0 = slot_189_17_0 + slot_189_26_0 + 1
				slot_189_36_0 = slot_189_18_0 + slot_189_27_0 - 1
				slot_189_37_0 = 3 * slot_189_10_0
				slot_189_38_0 = 4 * slot_189_10_0

				slot_0_18_0(slot_0_14_0, slot_0_6_0(slot_189_17_0 - slot_189_37_0, slot_189_18_0 - slot_189_37_0, slot_189_35_0 + slot_189_37_0, slot_189_36_0 + slot_189_37_0), slot_0_3_0(16, 16, 16, 100 * slot_189_11_0))
				slot_0_17_0(slot_0_14_0, slot_0_6_0(slot_189_17_0 - slot_189_38_0, slot_189_18_0 - slot_189_38_0, slot_189_35_0 + slot_189_38_0, slot_189_36_0 + slot_189_38_0), slot_0_3_0(16, 16, 16, 115 * slot_189_11_0))

				if slot_189_29_0 ~= nil then
					slot_0_16_0(slot_0_15_0, slot_189_29_0)

					slot_189_39_1 = slot_189_30_0.x
					slot_189_40_1 = slot_189_30_0.y

					slot_0_18_0(slot_0_14_0, slot_0_6_0(slot_189_39_1, slot_189_40_1, slot_189_39_1 + slot_189_33_0.x, slot_189_40_1 + slot_189_33_0.y), slot_0_3_0(slot_189_20_0, slot_189_21_0, slot_189_22_0, slot_189_23_0))
					slot_0_16_0(slot_0_15_0, nil)
				end

				if slot_189_10_0 > 0 then
					if slot_189_31_0 ~= nil then
						slot_189_39_0 = slot_189_17_0 + slot_189_31_0 * slot_189_10_0
						slot_189_40_0 = slot_189_18_0 + 2

						slot_0_17_0(slot_0_14_0, slot_0_6_0(slot_189_39_0 + 3, slot_189_40_0 - 2, slot_189_39_0 + 4, slot_189_40_0 + slot_189_27_0 - 3), slot_0_3_0(slot_189_20_0, slot_189_21_0, slot_189_22_0, 220 * slot_189_11_0 * slot_189_10_0))

						slot_189_17_0 = slot_189_17_0 + slot_189_31_0 + 8 * slot_189_10_0
					end

					if slot_189_34_0 < slot_189_27_0 then
						slot_189_18_0 = slot_189_18_0 + (slot_189_27_0 - slot_189_34_0) * 0.5
					end

					if slot_189_24_0 and not slot_189_25_0 then
						slot_189_28_0 = slot_0_36_0(slot_189_28_0, "<editing>", slot_0_38_0("\fFF1010%x", slot_189_23_0 * slot_189_10_0))
					end

					slot_0_19_0(slot_0_14_0, slot_0_6_0(slot_189_17_0, slot_189_18_0, slot_189_35_0 + 2, slot_189_36_0), false)
					slot_0_20_0(slot_0_14_0, slot_0_5_0(slot_189_17_0 + 2, slot_189_18_0), slot_189_28_0, slot_0_3_0(slot_189_20_0, slot_189_21_0, slot_189_22_0, slot_189_23_0 * slot_189_10_0))

					slot_0_15_0.clipRect = nil
				end
			end
		end
	end

	slot_0_155_5(slot_189_0_0, slot_189_2_0)
end

events.presentQueue:Add(slot_0_156_6)

slot_0_137_0 = nil
slot_0_138_0 = nil
slot_0_139_0 = nil
slot_0_140_0 = nil
slot_0_141_0 = nil
slot_0_142_0 = nil

slot_0_105_0.editing_sources:set_callback(function(arg_190_0)
	slot_0_105_0.source_locations:reset()

	slot_0_137_0 = nil
	slot_0_138_0 = nil
	slot_0_139_0 = nil
	slot_0_140_0 = arg_190_0:get()

	if slot_0_140_0 == 1 then
		slot_0_140_0 = nil
		slot_0_141_0 = nil
		slot_0_142_0 = nil

		return
	end

	slot_0_140_0 = slot_0_140_0 - 1
	slot_0_140_0 = slot_0_140_0 + 3

	if slot_0_141_0 == nil then
		slot_0_141_0 = slot_0_102_0()
	end

	slot_0_142_0 = slot_0_141_0.sources[slot_0_140_0]
end)

slot_0_143_1 = nil
slot_0_144_2 = {}
slot_0_145_6 = {
	"weapon_smokegrenade",
	"weapon_flashbang",
	"weapon_decoy",
	"weapon_hegrenade",
	"weapon_molotov",
	"weapon_wallbang",
	"weapon_knife"
}

slot_0_105_0.types:set_callback(function(arg_191_0)
	for iter_191_0, iter_191_1 in slot_0_48_0(slot_0_145_6) do
		slot_0_144_2[iter_191_1] = arg_191_0:get(iter_191_0)
	end
end, true)

function slot_0_145_5(arg_192_0, arg_192_1, arg_192_2)
	for iter_192_0, iter_192_1 in slot_0_49_0(arg_192_0) do
		if slot_0_109_0 == iter_192_0 then
			for iter_192_2, iter_192_3 in slot_0_48_0(iter_192_1) do
				local var_192_0 = iter_192_3.weapon

				if slot_0_144_2[var_192_0] then
					local var_192_1 = slot_0_112_0[var_192_0]

					if var_192_1 == nil then
						var_192_1 = {}
						slot_0_112_0[var_192_0] = var_192_1
					end

					if arg_192_1 == slot_0_140_0 and iter_192_2 == slot_0_139_0 then
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

function slot_0_143_0(arg_193_0, arg_193_1)
	slot_0_112_0, slot_0_113_0 = {}
	slot_0_115_0 = {}

	if slot_0_109_0 == nil then
		return
	end

	if arg_193_0 == nil or arg_193_0.sources == nil then
		arg_193_0 = slot_0_102_0()
	end

	local var_193_0 = arg_193_0.sources

	for iter_193_0, iter_193_1 in slot_0_48_0(var_193_0) do
		local var_193_1 = slot_0_105_0.active_sources:get(iter_193_0)

		if arg_193_1 then
			var_193_1 = slot_0_140_0 == iter_193_0
		end

		if var_193_1 then
			local var_193_2 = iter_193_1.locations

			if var_193_2 ~= nil then
				slot_0_145_5(var_193_2, iter_193_0, arg_193_1)
			end
		elseif not arg_193_1 then
			var_193_0[iter_193_0] = nil
		end
	end

	if slot_0_137_0 == nil then
		return
	end

	if not (slot_0_137_0.position ~= nil and slot_0_137_0.viewangles ~= nil and slot_0_137_0.weapon ~= nil) then
		return
	end

	local var_193_3 = slot_0_137_0.weapon
	local var_193_4 = slot_0_112_0[var_193_3]

	if var_193_4 == nil then
		var_193_4 = {}
		slot_0_112_0[var_193_3] = var_193_4
	end

	local var_193_5 = slot_0_88_0(slot_0_137_0)

	var_193_5.editing = true
	var_193_4[#var_193_4 + 1] = var_193_5
end

slot_0_79_0(0.5, slot_0_143_0)
slot_0_110_0(slot_0_143_0)
slot_0_79_0(0.5, function()
	slot_0_105_0.active_sources:set_callback(slot_0_143_0)
	slot_0_105_0.types:set_callback(function()
		if slot_0_141_0 == nil then
			return slot_0_143_0()
		end

		slot_0_143_0(slot_0_141_0, true)
	end)
	slot_0_105_0.editing_sources:set_callback(function(arg_196_0)
		if slot_0_141_0 == nil then
			return slot_0_143_0()
		end

		slot_0_143_0(slot_0_141_0, true)
	end)

	local var_194_0 = slot_0_105_0.options:get(2)

	slot_0_105_0.options:set_callback(function(arg_197_0)
		if slot_0_141_0 ~= nil then
			return
		end

		local var_197_0 = slot_0_105_0.options:get(2)

		if var_194_0 == var_197_0 then
			return
		end

		var_194_0 = var_197_0

		slot_0_143_0()
	end)
end)

slot_0_144_1 = nil

function slot_0_144_0(arg_198_0)
	if arg_198_0 == nil then
		arg_198_0 = slot_0_102_0()
	end

	local var_198_0 = arg_198_0.sources
	local var_198_1 = {}
	local var_198_2 = {
		"Create New"
	}

	for iter_198_0, iter_198_1 in slot_0_48_0(var_198_0) do
		local var_198_3 = iter_198_1.name

		var_198_1[#var_198_1 + 1] = var_198_3

		if iter_198_0 > 3 then
			var_198_2[#var_198_2 + 1] = var_198_3
		end
	end

	slot_0_105_0.active_sources:update(var_198_1)
	slot_0_105_0.editing_sources:update(var_198_2)
end

slot_0_144_0()

slot_0_145_4 = slot_0_105_0.active_sources
slot_0_146_6 = {
	"grenades.json",
	"movements.json",
	"wallbangs.json"
}
slot_0_147_3 = {
	"https://github.com/arsenic23/fatality-helper/raw/refs/heads/main/grenade_helper/%s",
	"https://github.com/v1pix/cs2-fatality-helper/raw/refs/heads/main/grenade_helper/%s"
}
slot_0_148_2 = slot_0_102_0()
slot_0_149_2 = slot_0_148_2.sources
slot_0_150_3 = 0
slot_0_151_2 = 0
slot_0_152_2 = false
slot_0_153_3 = 0
slot_0_154_4 = {}

events.presentQueue:Add(function()
	if not slot_0_152_2 then
		return
	end

	for iter_199_0, iter_199_1 in slot_0_49_0(slot_0_154_4) do
		iter_199_1 = utils.JsonDecode(iter_199_1)

		if slot_0_50_0(iter_199_1) == "table" then
			slot_0_149_2[iter_199_0].locations = iter_199_1
		end
	end

	if slot_0_151_2 > 0 then
		slot_0_103_0(slot_0_148_2)
	end

	local var_199_0 = false

	for iter_199_2 = 1, 3 do
		if slot_0_145_4:get(iter_199_2) then
			var_199_0 = true

			break
		end
	end

	if var_199_0 then
		slot_0_143_0(slot_0_148_2)
	end

	slot_0_148_2 = nil
	slot_0_149_2 = nil
	slot_0_152_2 = false
end)

function slot_0_155_4(arg_200_0, arg_200_1, arg_200_2)
	slot_0_153_3 = slot_0_153_3 + 1

	local var_200_0 = slot_0_147_3[arg_200_2]

	if var_200_0 == nil then
		return
	end

	local var_200_1 = slot_0_38_0(var_200_0, arg_200_1)

	http.Get(var_200_1, {
		headers = slot_0_89_0
	}, function(arg_201_0, arg_201_1)
		local var_201_0 = false

		if arg_201_0 == 200 and arg_201_1 ~= nil then
			local var_201_1 = #arg_201_1
			local var_201_2 = slot_0_37_0(arg_201_1, 1, 1)
			local var_201_3 = slot_0_37_0(arg_201_1, var_201_1, var_201_1)

			if (var_201_2 == "[" or var_201_2 == "{") and (var_201_3 == "]" or var_201_3 == "}") then
				slot_0_154_4[arg_200_0] = arg_201_1
				var_201_0 = true
			end
		end

		if var_201_0 then
			slot_0_151_2 = slot_0_151_2 + 1
			slot_0_150_3 = slot_0_150_3 + 1
		elseif arg_200_2 < #slot_0_147_3 then
			slot_0_79_0(slot_0_153_3, function()
				slot_0_155_4(arg_200_0, arg_200_1, arg_200_2 + 1)
			end)

			return
		else
			slot_0_74_0(slot_0_38_0("Failed to download: %s. Try to load with VPN", arg_200_1))

			slot_0_150_3 = slot_0_150_3 + 1
		end

		if slot_0_150_3 == #slot_0_146_6 then
			slot_0_152_2 = true
		end
	end)
end

for iter_0_2, iter_0_3 in slot_0_48_0(slot_0_146_6) do
	slot_0_79_0(slot_0_153_3, function()
		slot_0_155_4(iter_0_2, iter_0_3, 1)
	end)
end

function slot_0_145_3(arg_204_0)
	local var_204_0 = {}

	for iter_204_0, iter_204_1 in slot_0_48_0(arg_204_0) do
		var_204_0[iter_204_1.name] = true
	end

	return var_204_0
end

function slot_0_146_5()
	local var_205_0 = slot_0_105_0.new_source_name:get()

	if slot_0_36_0(var_205_0, " ", "") == "" then
		var_205_0 = "Unnamed"
	end

	local var_205_1 = slot_0_102_0()
	local var_205_2 = var_205_1.sources
	local var_205_3 = var_205_0
	local var_205_4 = 2
	local var_205_5 = slot_0_145_3(var_205_2)

	while var_205_5[var_205_3] do
		var_205_3 = slot_0_38_0("%s (%d)", var_205_0, var_205_4)
		var_205_4 = var_205_4 + 1
	end

	var_205_2[#var_205_2 + 1] = {
		name = var_205_3,
		locations = {}
	}

	slot_0_103_0(var_205_1)
	slot_0_144_0(var_205_1)
	slot_0_74_0(slot_0_38_0("Source '%s' Created!", var_205_0))
end

slot_0_105_0.create_source:set_callback(slot_0_146_5)
slot_0_105_0.delete_source_confirm:set_callback(function()
	if slot_0_140_0 == nil then
		return
	end

	local var_206_0 = slot_0_102_0()
	local var_206_1 = var_206_0.sources
	local var_206_2 = var_206_1[slot_0_140_0].name

	slot_0_44_0(var_206_1, slot_0_140_0)
	slot_0_103_0(var_206_0)
	slot_0_79_0(0.05, function()
		slot_0_144_0(var_206_0)
		slot_0_79_0(0.05, slot_0_105_0.editing_sources.reset, slot_0_105_0.editing_sources)
	end)
	slot_0_74_0(slot_0_38_0("Source '%s' Deleted!", var_206_2))
end)

slot_0_145_2 = nil
slot_0_146_4 = {}

for iter_0_4 = 128, 255 do
	slot_0_146_4[#slot_0_146_4 + 1] = slot_0_40_0(iter_0_4)
end

slot_0_146_3 = slot_0_46_0(slot_0_146_4)
slot_0_146_2 = slot_0_38_0("[%s]", slot_0_146_3)

function slot_0_145_1(arg_208_0)
	return slot_0_36_0(arg_208_0, slot_0_146_2, "")
end

function slot_0_146_1(arg_209_0)
	if slot_0_50_0(arg_209_0) ~= "table" then
		return false, "wrong type, expected table"
	end

	local var_209_0 = arg_209_0.name

	if (slot_0_50_0(var_209_0) ~= "string" or not (#var_209_0 > 0)) and (slot_0_50_0(var_209_0) ~= "table" or #var_209_0 ~= 2) then
		return false, "invalid name, expected string or table of length 2"
	end

	local var_209_1 = arg_209_0.description

	if var_209_1 ~= nil and (slot_0_50_0(var_209_1) ~= "string" or #var_209_1 == 0) then
		return false, "invalid description, expected nil or non-empty string"
	end

	local var_209_2 = arg_209_0.weapon

	if slot_0_50_0(var_209_2) ~= "string" or #var_209_2 == 0 then
		return false, "invalid weapon"
	end

	local var_209_3 = arg_209_0.position

	if slot_0_50_0(var_209_3) == "table" and #var_209_3 == 3 then
		if slot_0_50_0(var_209_3[1]) ~= "number" or slot_0_50_0(var_209_3[2]) ~= "number" or slot_0_50_0(var_209_3[3]) ~= "number" then
			return false, "invalid type in position"
		end
	else
		return false, "invalid position"
	end

	local var_209_4 = arg_209_0.viewangles

	if slot_0_50_0(var_209_4) == "table" or #var_209_4 == 2 then
		if slot_0_50_0(var_209_4[1]) ~= "number" or slot_0_50_0(var_209_4[2]) ~= "number" then
			return false, "invalid type in viewangles"
		end
	else
		return false, "invalid viewangles"
	end

	local var_209_5 = arg_209_0.duck

	if var_209_5 ~= nil and slot_0_50_0(var_209_5) ~= "boolean" then
		return false, "invalid duck"
	end

	local var_209_6 = arg_209_0.movement

	if var_209_6 ~= nil and arg_209_0.settings == nil or var_209_6 ~= nil and (slot_0_50_0(var_209_6) ~= "table" or #var_209_6 == 0) then
		return false, "invalid movement"
	end

	return true
end

function slot_0_147_2(arg_210_0, arg_210_1, arg_210_2, arg_210_3, arg_210_4)
	if slot_0_50_0(arg_210_2) ~= "string" or slot_0_39_0(arg_210_2, " ") ~= nil then
		return slot_0_74_0(slot_0_38_0("Failed to import: Invalid map name (%s)", arg_210_2))
	end

	if arg_210_1 == nil then
		return
	end

	local var_210_0 = arg_210_0[arg_210_2]

	if var_210_0 == nil then
		var_210_0 = {}
		arg_210_0[arg_210_2] = var_210_0
	end

	local var_210_1 = 0

	for iter_210_0 = 1, #arg_210_1 do
		local var_210_2 = arg_210_1[iter_210_0]
		local var_210_3 = var_210_2.position
		local var_210_4 = var_210_2.viewangles
		local var_210_5 = arg_210_2 .. var_210_2.weapon .. var_210_3[1] .. var_210_3[2] .. var_210_3[3] .. var_210_4[1] .. var_210_4[2]

		if arg_210_3[var_210_5] == nil then
			local var_210_6, var_210_7 = slot_0_146_1(var_210_2)

			if var_210_6 then
				var_210_0[#var_210_0 + 1] = var_210_2
			else
				var_210_1 = var_210_1 + 1
			end

			arg_210_3[var_210_5] = iter_210_0
		elseif not arg_210_4 then
			var_210_1 = var_210_1 + 1
		end
	end

	return var_210_1
end

slot_0_105_0.import_source:set_callback(function()
	if slot_0_140_0 == nil then
		return
	end

	local var_211_0 = utils.ClipboardGet()

	if var_211_0 == nil or var_211_0 == "" then
		return slot_0_74_0("Failed to import: Clipboard is empty")
	end

	local var_211_1 = slot_0_37_0(var_211_0, 1, 1)

	if not (var_211_1 == "[" or var_211_1 == "{") then
		return slot_0_74_0("Failed to import: Invalid JSON")
	end

	local var_211_2 = slot_0_145_1(var_211_0)
	local var_211_3 = utils.JsonDecode(var_211_2)

	if slot_0_50_0(var_211_3) ~= "table" then
		return slot_0_74_0("Failed to import: Invalid JSON")
	end

	local var_211_4 = slot_0_37_0(var_211_2, 1, 1) == "["

	if not var_211_4 and (var_211_3.name ~= nil or var_211_3.grenade ~= nil or var_211_3.weapon ~= nil) then
		var_211_3 = {
			var_211_3
		}
		var_211_4 = true
	end

	local var_211_5 = slot_0_102_0()
	local var_211_6 = var_211_5.sources[slot_0_140_0].locations
	local var_211_7 = {}

	for iter_211_0, iter_211_1 in slot_0_49_0(var_211_6) do
		for iter_211_2, iter_211_3 in slot_0_48_0(iter_211_1) do
			local var_211_8 = iter_211_1[iter_211_2]
			local var_211_9 = var_211_8.position
			local var_211_10 = var_211_8.viewangles

			var_211_7[iter_211_0 .. var_211_8.weapon .. var_211_9[1] .. var_211_9[2] .. var_211_9[3] .. var_211_10[1] .. var_211_10[2]] = iter_211_2
		end
	end

	local var_211_11 = 0

	if var_211_4 then
		var_211_11 = var_211_11 + slot_0_147_2(var_211_6, var_211_3, slot_0_109_0, var_211_7)
	else
		for iter_211_4, iter_211_5 in slot_0_49_0(var_211_3) do
			var_211_11 = var_211_11 + slot_0_147_2(var_211_6, iter_211_5, iter_211_4, var_211_7)
		end
	end

	slot_0_74_0("Import Successful!")

	if var_211_11 > 0 then
		slot_0_74_0(slot_0_38_0("Skipped '%d' Locations", var_211_11))
	end

	slot_0_103_0(var_211_5)

	local var_211_12 = slot_0_142_0.locations
	local var_211_13 = {}

	for iter_211_6, iter_211_7 in slot_0_49_0(var_211_12) do
		for iter_211_8, iter_211_9 in slot_0_48_0(iter_211_7) do
			local var_211_14 = iter_211_7[iter_211_8]
			local var_211_15 = var_211_14.position
			local var_211_16 = var_211_14.viewangles

			if slot_0_50_0(var_211_15) == "userdata" then
				var_211_15 = {
					var_211_15.x,
					var_211_15.y,
					var_211_15.z
				}
			end

			if slot_0_50_0(var_211_16) == "userdata" then
				var_211_16 = {
					var_211_16.x,
					var_211_16.y
				}
			end

			var_211_13[iter_211_6 .. var_211_14.weapon .. var_211_15[1] .. var_211_15[2] .. var_211_15[3] .. var_211_16[1] .. var_211_16[2]] = iter_211_8
		end
	end

	if var_211_4 then
		slot_0_147_2(var_211_12, var_211_3, slot_0_109_0, var_211_13, true)
	else
		for iter_211_10, iter_211_11 in slot_0_49_0(var_211_3) do
			slot_0_147_2(var_211_12, iter_211_11, iter_211_10, var_211_13, true)
		end
	end

	slot_0_143_0(slot_0_141_0, true)
end)
slot_0_105_0.export_source:set_callback(function()
	if slot_0_140_0 == nil then
		return
	end

	local var_212_0 = slot_0_102_0().sources[slot_0_140_0].locations
	local var_212_1 = utils.JsonEncode(var_212_0)

	utils.ClipboardSet(var_212_1)
	slot_0_74_0("Source Copied to Clipboard!")
end)

slot_0_145_0 = {}
slot_0_146_0 = false
slot_0_147_1 = nil
slot_0_148_1 = nil
slot_0_147_0 = {
	[0] = 2,
	[-90] = 4,
	[90] = 3,
	[180] = 5
}
slot_0_148_0 = {
	nil,
	0,
	90,
	-90,
	180
}
slot_0_149_1 = nil
slot_0_150_1 = nil
slot_0_149_0 = {
	[0] = 3,
	1,
	[0.5] = 2
}
slot_0_150_0 = {
	1,
	0.5,
	0
}
slot_0_151_1 = nil
slot_0_152_1 = nil
slot_0_153_2 = false

function slot_0_151_0(arg_213_0)
	if slot_0_153_2 and arg_213_0 ~= nil then
		return
	end

	if slot_0_138_0 == nil then
		slot_0_137_0 = nil

		return
	end

	if slot_0_137_0 == nil then
		slot_0_137_0 = {}
	end

	local var_213_0 = slot_0_105_0.location_type:get()
	local var_213_1 = slot_0_105_0.location_name:get()

	if slot_0_36_0(var_213_1, " ", "") == "" then
		var_213_1 = "Unnamed"
	end

	slot_0_137_0.name = var_213_1

	local var_213_2 = slot_0_105_0.location_description:get()

	if slot_0_36_0(var_213_2, " ", "") == "" then
		var_213_2 = nil
	end

	slot_0_137_0.description = var_213_2

	local var_213_3

	if var_213_0 == 1 then
		if slot_0_105_0.location_jump:get() then
			var_213_3 = var_213_3 or {}
			var_213_3.jump = true
		end

		local var_213_4 = slot_0_105_0.location_strafe_boost:get()

		if var_213_4 > 0 then
			var_213_3 = var_213_3 or {}
			var_213_3.strafe_boost = var_213_4
		end

		local var_213_5 = slot_0_105_0.location_run:get()

		if var_213_5 ~= 1 then
			local var_213_6 = var_213_5 == 6 and slot_0_105_0.location_run_custom:get() or slot_0_148_0[var_213_5]

			var_213_3 = var_213_3 or {}
			var_213_3.run = slot_0_105_0.location_run_duration:get()
			var_213_3.run_yaw = var_213_6 ~= 0 and var_213_6 or nil
			var_213_3.run_speed = slot_0_105_0.location_run_walk:get() or nil
		end

		local var_213_7 = slot_0_105_0.location_recovery:get()

		if var_213_7 ~= 1 then
			var_213_3.recovery_yaw, var_213_3 = var_213_7 == 6 and slot_0_105_0.location_recovery_custom:get() or slot_0_148_0[var_213_7], var_213_3 or {}
			var_213_3.recovery_jump = slot_0_105_0.location_recovery_bunnyhop:get() or nil
		end

		local var_213_8 = slot_0_105_0.location_strength:get()

		if var_213_8 ~= 1 then
			var_213_3 = var_213_3 or {}
			var_213_3.strength = slot_0_150_0[var_213_8]
		end

		if slot_0_105_0.location_super_toss:get() then
			var_213_3 = var_213_3 or {}
			var_213_3.super_toss = true
		end

		local var_213_9 = slot_0_105_0.location_delay:get()

		if var_213_9 > 0 then
			var_213_3 = var_213_3 or {}
			var_213_3.delay = var_213_9
		end
	end

	slot_0_137_0.grenade = var_213_3

	local var_213_10 = false
	local var_213_11 = slot_0_138_0.grenade or {}

	grenade = grenade or {}

	for iter_213_0, iter_213_1 in slot_0_49_0(grenade) do
		if iter_213_0 ~= "recovery_yaw" and iter_213_0 ~= "recovery_jump" and iter_213_1 ~= var_213_11[iter_213_0] then
			var_213_10 = true
		end
	end

	for iter_213_2, iter_213_3 in slot_0_49_0(var_213_11) do
		if iter_213_2 ~= "recovery_yaw" and iter_213_2 ~= "recovery_jump" and iter_213_3 ~= grenade[iter_213_2] then
			var_213_10 = true
		end
	end

	if var_213_10 then
		slot_0_137_0.points = nil
	end

	slot_0_143_0(slot_0_141_0, true)

	slot_0_146_0 = true
end

slot_0_154_3 = {
	slot_0_105_0.location_type,
	slot_0_105_0.location_name,
	slot_0_105_0.location_description,
	slot_0_105_0.location_jump,
	slot_0_105_0.location_strafe_boost,
	slot_0_105_0.location_run,
	slot_0_105_0.location_run_custom,
	slot_0_105_0.location_run_duration,
	slot_0_105_0.location_run_walk,
	slot_0_105_0.location_recovery,
	slot_0_105_0.location_recovery_custom,
	slot_0_105_0.location_recovery_bunnyhop,
	slot_0_105_0.location_strength,
	slot_0_105_0.location_super_toss,
	slot_0_105_0.location_delay
}

slot_0_79_0(0.05, function()
	for iter_214_0, iter_214_1 in slot_0_48_0(slot_0_154_3) do
		iter_214_1:set_callback(slot_0_151_0)
	end
end)

function slot_0_152_0(arg_215_0)
	slot_0_153_2 = not arg_215_0
end

slot_0_155_3 = nil

events.createMove:Add(function(arg_216_0)
	if slot_0_142_0 == nil then
		slot_0_155_3 = nil

		return
	end

	if slot_0_105_0.location_type:get() ~= 3 then
		slot_0_155_3 = nil

		return
	end

	local var_216_0 = slot_0_25_0()

	if var_216_0 == nil or not var_216_0:IsAlive() then
		slot_0_155_3 = nil

		return
	end

	if not slot_0_105_0.location_recording:get_hotkey_state() then
		if slot_0_155_3 ~= nil then
			local var_216_1 = slot_0_155_3.movement
			local var_216_2 = slot_0_155_3.settings
			local var_216_3 = slot_0_155_3.points

			if var_216_1 ~= nil and var_216_2 ~= nil and var_216_3 ~= nil then
				slot_0_137_0.movement = var_216_1
				slot_0_137_0.settings = var_216_2
				slot_0_137_0.points = var_216_3

				slot_0_143_0(slot_0_141_0, true)

				local var_216_4 = {}

				for iter_216_0, iter_216_1 in slot_0_48_0(var_216_3) do
					var_216_4[iter_216_0] = {
						iter_216_1.x,
						iter_216_1.y,
						iter_216_1.z
					}
				end

				slot_0_137_0.points = var_216_4
			end
		end

		slot_0_155_3 = nil

		return
	end

	if slot_0_155_3 == nil then
		slot_0_155_3 = {}
	end

	local var_216_5 = slot_0_155_3.movement
	local var_216_6 = var_216_0:GetAbsVelocity()
	local var_216_7 = slot_0_12_0(var_216_6)
	local var_216_8 = arg_216_0:GetViewangles()

	if var_216_5 == nil and var_216_7 < 2 then
		local var_216_9 = var_216_0:GetActiveWeapon()

		if var_216_9 == nil then
			slot_0_155_3 = nil

			return
		end

		local var_216_10 = slot_0_111_0(var_216_9)

		if var_216_10 == nil then
			slot_0_155_3 = nil

			return
		end

		local var_216_11 = var_216_0:GetAbsOrigin()

		slot_0_137_0.position = {
			var_216_11.x,
			var_216_11.y,
			var_216_11.z
		}
		slot_0_137_0.viewangles = {
			var_216_8.x,
			var_216_8.y
		}
		slot_0_137_0.weapon = var_216_10

		local var_216_12 = {
			autostrafer = slot_0_124_0:get(),
			autostrafer_turn_angle = slot_0_125_0:get(),
			autostrafer_boost = slot_0_126_0:get(),
			standalone_quick_stop = slot_0_127_0:get(),
			jumpbug = slot_0_122_0:get(),
			edge_jump = slot_0_123_0:get()
		}

		var_216_5 = {}
		slot_0_155_3.movement = var_216_5
		slot_0_155_3.settings = var_216_12
	end

	if var_216_5 == nil then
		return
	end

	local var_216_13 = 0

	for iter_216_2 = 1, #slot_0_70_0 do
		local var_216_14 = slot_0_70_0[iter_216_2]

		if arg_216_0:GetButton(var_216_14) then
			var_216_13 = var_216_13 + var_216_14
		end
	end

	if var_216_13 == 0 then
		var_216_13 = nil
	end

	local var_216_15 = slot_0_155_3.start_at

	if var_216_15 == nil and var_216_13 ~= nil then
		var_216_15 = arg_216_0.commandNumber
		slot_0_155_3.start_at = var_216_15
	end

	if var_216_15 == nil then
		return
	end

	local var_216_16 = arg_216_0.commandNumber - var_216_15 + 1
	local var_216_17 = arg_216_0:GetForwardMove()
	local var_216_18 = arg_216_0:GetLeftMove()

	var_216_5[#var_216_5 + 1] = {
		viewangles = {
			var_216_8.x,
			var_216_8.y
		},
		forwardmove = var_216_17 ~= 0 and var_216_17 or nil,
		leftmove = var_216_18 ~= 0 and var_216_18 or nil,
		buttons = var_216_13
	}

	local var_216_19 = slot_0_155_3.points

	if var_216_19 == nil then
		var_216_19 = {}
		slot_0_155_3.points = var_216_19
	end

	local var_216_20 = var_216_0:GetAbsOrigin()

	var_216_19[#var_216_19 + 1] = var_216_20
end)

slot_0_153_1 = nil

function slot_0_154_2()
	slot_0_105_0.location_type:reset()
	slot_0_105_0.location_name:reset()
	slot_0_105_0.location_description:reset()
	slot_0_105_0.location_jump:reset()
	slot_0_105_0.location_strafe_boost:reset()
	slot_0_105_0.location_run:reset()
	slot_0_105_0.location_run_custom:reset()
	slot_0_105_0.location_run_duration:reset()
	slot_0_105_0.location_run_walk:reset()
	slot_0_105_0.location_recovery:reset()
	slot_0_105_0.location_recovery_custom:reset()
	slot_0_105_0.location_recovery_bunnyhop:reset()
	slot_0_105_0.location_strength:reset()
	slot_0_105_0.location_super_toss:reset()
	slot_0_105_0.location_delay:reset()
end

slot_0_154_2()

function slot_0_153_0()
	slot_0_152_0(false)

	if slot_0_140_0 == nil then
		return
	end

	slot_0_154_2()

	if slot_0_138_0 == nil or slot_0_138_0 == "create_new" then
		slot_0_137_0 = nil

		slot_0_151_0()
		slot_0_79_0(0.3, slot_0_152_0, true)

		return
	end

	if slot_0_138_0.movement ~= nil then
		slot_0_105_0.location_type:set(3)
	elseif slot_0_138_0.weapon == "weapon_wallbang" then
		slot_0_105_0.location_type:set(2)
	else
		slot_0_105_0.location_type:set(1)
	end

	slot_218_1_0 = slot_0_138_0.name
	slot_218_1_0 = slot_0_50_0(slot_218_1_0) == "table" and slot_218_1_0[2] or slot_218_1_0

	slot_0_105_0.location_name:set(slot_218_1_0)

	slot_218_2_0 = slot_0_138_0.description or ""

	slot_0_105_0.location_description:set(slot_218_2_0)

	slot_218_3_0 = slot_0_138_0.grenade or {}
	slot_218_4_0 = slot_218_3_0.jump or false

	slot_0_105_0.location_jump:set(slot_218_4_0)

	slot_218_5_0 = slot_218_3_0.strafe_boost or 0

	if slot_218_5_0 == true then
		slot_218_5_0 = 36
	end

	slot_0_105_0.location_strafe_boost:set(slot_218_5_0)

	slot_218_6_0 = slot_218_3_0.run
	slot_218_7_0 = slot_218_3_0.run_yaw
	slot_218_8_0 = slot_218_3_0.run_speed or false
	slot_218_9_0 = slot_218_6_0 == nil and 1 or slot_218_7_0 == nil and 2 or slot_0_147_0[slot_218_7_0] or 6

	slot_0_105_0.location_run:set(slot_218_9_0)
	slot_0_105_0.location_run_custom:set(slot_218_7_0 or 0)
	slot_0_105_0.location_run_duration:set(slot_218_6_0 or 0)
	slot_0_105_0.location_run_walk:set(slot_218_8_0)

	slot_218_10_0 = slot_218_3_0.recovery_yaw
	slot_218_11_0 = slot_218_3_0.recovery_jump or false
	slot_218_12_0 = slot_218_10_0 == nil and 1 or slot_0_147_0[slot_218_10_0] or 6

	slot_0_105_0.location_recovery:set(slot_218_12_0)
	slot_0_105_0.location_recovery_custom:set(slot_218_10_0 or 0)
	slot_0_105_0.location_recovery_bunnyhop:set(slot_218_11_0)

	slot_218_13_0 = slot_0_149_0[slot_218_3_0.strength or 1]

	slot_0_105_0.location_strength:set(slot_218_13_0)
	slot_0_105_0.location_super_toss:set(slot_218_3_0.super_toss or false)

	slot_218_14_0 = slot_218_3_0.delay or 0

	slot_0_105_0.location_delay:set(slot_218_14_0)

	if slot_0_137_0 == nil then
		slot_0_137_0 = {}
	end

	slot_218_15_0 = slot_0_138_0.position
	slot_218_16_0 = slot_0_50_0(slot_218_15_0)

	if slot_218_16_0 == "table" then
		slot_0_137_0.position = {
			slot_218_15_0[1],
			slot_218_15_0[2],
			slot_218_15_0[3]
		}
	elseif slot_218_16_0 == "userdata" then
		slot_0_137_0.position = {
			slot_218_15_0.x,
			slot_218_15_0.y,
			slot_218_15_0.z
		}
	end

	slot_218_17_0 = slot_0_138_0.viewangles
	slot_218_18_0 = slot_0_50_0(slot_218_17_0)

	if slot_218_18_0 == "table" then
		slot_0_137_0.viewangles = {
			slot_218_17_0[1],
			slot_218_17_0[2]
		}
	elseif slot_218_18_0 == "userdata" then
		slot_0_137_0.viewangles = {
			slot_218_17_0.x,
			slot_218_17_0.y
		}
	end

	slot_0_137_0.weapon = slot_0_138_0.weapon
	slot_0_137_0.duck = slot_0_138_0.duck
	slot_218_19_0 = slot_0_138_0.throw_points or slot_0_138_0.points

	if slot_218_19_0 ~= nil and #slot_218_19_0 > 4 then
		for iter_218_0, iter_218_1 in slot_0_48_0(slot_218_19_0) do
			if slot_0_50_0(iter_218_1) == "userdata" then
				slot_218_19_0[iter_218_0] = {
					iter_218_1.x,
					iter_218_1.y,
					iter_218_1.z
				}
			end
		end
	end

	slot_0_137_0.points = slot_0_138_0.points
	slot_0_137_0.end_position = slot_0_138_0.end_position
	slot_0_137_0.movement = slot_0_138_0.movement
	slot_0_137_0.settings = slot_0_138_0.settings

	slot_0_151_0()
	slot_0_79_0(0.3, slot_0_152_0, true)
end

slot_0_154_1 = nil
slot_0_155_2 = {
	weapon_flashbang = "slot7",
	weapon_smokegrenade = "slot8",
	weapon_knife = "slot3",
	weapon_hegrenade = "slot6",
	weapon_molotov = "slot10",
	weapon_wallbang = "slot2; slot1",
	weapon_decoy = "slot9"
}
slot_0_156_5 = nil

function slot_0_154_0(arg_219_0)
	local var_219_0 = slot_0_25_0()

	if var_219_0 == nil or not var_219_0:IsAlive() then
		return
	end

	local var_219_1 = var_219_0:GetActiveWeapon()

	if var_219_1 == nil then
		return
	end

	local var_219_2 = slot_0_111_0(var_219_1)

	arg_219_0 = slot_0_50_0(arg_219_0) == "table" and arg_219_0.position ~= nil and arg_219_0 or slot_0_137_0

	if arg_219_0 == nil then
		return
	end

	local var_219_3 = arg_219_0.position
	local var_219_4 = arg_219_0.viewangles
	local var_219_5 = arg_219_0.weapon

	if var_219_3 == nil or var_219_4 == nil or var_219_5 == nil then
		return
	end

	if slot_0_156_5 == nil then
		slot_0_156_5 = slot_0_127_0:get()
	end

	slot_0_127_0:set(false)
	slot_0_79_0(0.05, function()
		slot_0_2_0:ClientCmd("sv_cheats true; sv_maxspeed 0")
		slot_0_2_0:ClientCmd(slot_0_38_0("noclip off; setpos %s %s %s 100 0; setang %s %s 0 0;", var_219_3[1], var_219_3[2], var_219_3[3] + 10, var_219_4[1], var_219_4[2]))

		if var_219_2 ~= var_219_5 then
			local var_220_0 = slot_0_155_2[var_219_5] or ""

			slot_0_79_0(0.05, slot_0_2_0.ClientCmd, slot_0_2_0, var_220_0)
		end

		slot_0_79_0(0.05, function()
			slot_0_2_0:ClientCmd("sv_maxspeed 320")

			if slot_0_156_5 ~= nil then
				slot_0_127_0:set(slot_0_156_5)

				slot_0_156_5 = nil
			end
		end)
	end)
end

slot_0_105_0.location_teleport:set_callback(slot_0_154_0)
slot_0_105_0.location_teleport_hotkey:set_callback(function(arg_222_0)
	if not arg_222_0:get_hotkey_state() then
		return
	end

	slot_0_154_0()
end)

slot_0_155_1 = nil
slot_0_156_4 = nil

function slot_0_157_2()
	slot_0_155_1 = nil
	slot_0_156_4 = nil

	if slot_0_137_0 == nil then
		return
	end

	local var_223_0 = slot_0_25_0()

	if var_223_0 == nil or not var_223_0:IsAlive() then
		return
	end

	local var_223_1 = var_223_0:GetActiveWeapon()

	if var_223_1 == nil then
		return
	end

	local var_223_2 = slot_0_111_0(var_223_1)

	if var_223_2 == nil then
		return
	end

	local var_223_3 = var_223_0:GetAbsOrigin()
	local var_223_4 = slot_0_1_0(slot_0_0_0)
	local var_223_5 = var_223_0.m_pMovementServices:Get().m_flDuckAmount:Get()

	if var_223_2 == "weapon_wallbang" then
		if var_223_1:GetDefIndex() ~= 9 then
			return slot_0_74_0("Wallbangs can only be created with AWP")
		end

		local var_223_6 = var_223_1:GetData().m_flRange:Get()

		slot_0_155_1 = var_223_0:GetEyePos()
		slot_0_156_4 = slot_0_155_1 + slot_0_13_0(var_223_4) * slot_0_7_0(var_223_6, var_223_6, var_223_6)
	end

	slot_0_137_0.position = {
		var_223_3.x,
		var_223_3.y,
		var_223_3.z
	}
	slot_0_137_0.viewangles = {
		var_223_4.x,
		var_223_4.y
	}
	slot_0_137_0.weapon = var_223_2
	slot_0_137_0.duck = var_223_5 == 1 or nil
	slot_0_137_0.points = nil
	slot_0_137_0.end_position = nil

	if var_223_2 == "weapon_wallbang" then
		slot_0_105_0.location_type:set(2)
	else
		slot_0_105_0.location_type:set(1)
	end

	slot_0_143_0(slot_0_141_0, true)
end

events.createMove:Add(function(arg_224_0)
	if slot_0_155_1 == nil or slot_0_156_4 == nil then
		return
	end

	local var_224_0 = slot_0_25_0()

	if var_224_0 == nil or not var_224_0:IsAlive() then
		slot_0_155_1 = nil
		slot_0_156_4 = nil

		return
	end

	local var_224_1 = var_224_0:GetActiveWeapon()

	if var_224_1 == nil then
		slot_0_155_1 = nil
		slot_0_156_4 = nil

		return
	end

	local var_224_2 = var_224_1:GetData()
	local var_224_3, var_224_4 = mods.penetration.FireBullet(slot_0_155_1, slot_0_156_4 - slot_0_155_1, var_224_1, nil)
	local var_224_5 = var_224_4:GetHitPosCount()

	if var_224_5 == 0 then
		slot_0_155_1 = nil
		slot_0_156_4 = nil

		return
	end

	local var_224_6 = var_224_4:GetHitPos(var_224_5 - 1)

	if var_224_6 == nil then
		slot_0_155_1 = nil
		slot_0_156_4 = nil

		return
	end

	slot_0_137_0.end_position = {
		var_224_6.x,
		var_224_6.y,
		var_224_6.z
	}
	slot_0_155_1 = nil
	slot_0_156_4 = nil
end)
slot_0_105_0.location_set_position:set_callback(slot_0_157_2)
slot_0_105_0.location_set_position_hotkey:set_callback(function(arg_225_0)
	if not arg_225_0:get_hotkey_state() then
		return
	end

	slot_0_157_2()
end)

slot_0_155_0 = 0

slot_0_105_0.location_export:set_callback(function()
	if slot_0_142_0 == nil or slot_0_140_0 == nil or slot_0_139_0 == nil then
		return
	end

	local var_226_0 = slot_0_102_0().sources[slot_0_140_0].locations[slot_0_109_0]

	if var_226_0 == nil then
		return
	end

	local var_226_1 = var_226_0[slot_0_139_0]

	if var_226_1 == nil then
		return
	end

	local var_226_2 = utils.JsonEncode(var_226_1)

	utils.ClipboardSet(var_226_2)
	slot_0_74_0("Location Copied to Clipboard!")
end)
slot_0_105_0.location_delete_confirm:set_callback(function()
	if slot_0_142_0 == nil or slot_0_140_0 == nil or slot_0_139_0 == nil then
		return
	end

	if slot_0_137_0 == nil then
		return
	end

	local var_227_0 = slot_0_137_0.name
	local var_227_1 = slot_0_102_0()
	local var_227_2 = var_227_1.sources[slot_0_140_0].locations[slot_0_109_0]

	slot_0_44_0(var_227_2, slot_0_139_0)
	slot_0_103_0(var_227_1)

	local var_227_3 = slot_0_142_0.locations[slot_0_109_0]

	slot_0_44_0(var_227_3, slot_0_139_0)

	slot_0_155_0 = 0
	slot_0_146_0 = false

	slot_0_105_0.source_locations:reset()
	slot_0_74_0(slot_0_38_0("Location '%s' Deleted!", var_227_0))
end)

slot_0_156_3 = game.cvar:Find("sv_airaccelerate")

slot_0_105_0.location_save:set_callback(function()
	if slot_0_137_0 == nil then
		return
	end

	local var_228_0 = slot_0_137_0.position
	local var_228_1 = slot_0_137_0.viewangles
	local var_228_2 = slot_0_137_0.weapon

	if var_228_0 == nil or var_228_1 == nil or var_228_2 == nil then
		return
	end

	if slot_0_140_0 == nil then
		return
	end

	if slot_0_137_0.movement ~= nil then
		slot_0_137_0.description = slot_0_38_0("sv_airaccelerate %s", slot_0_156_3.value)
	end

	local var_228_3 = slot_0_102_0()
	local var_228_4 = var_228_3.sources[slot_0_140_0].locations

	if slot_0_139_0 == nil then
		local var_228_5 = var_228_4[slot_0_109_0]

		if var_228_5 == nil then
			var_228_5 = {}
			var_228_4[slot_0_109_0] = var_228_5
		end

		var_228_5[#var_228_5 + 1] = slot_0_137_0
	else
		var_228_4[slot_0_109_0][slot_0_139_0] = slot_0_137_0
	end

	slot_0_103_0(var_228_3)

	local var_228_6 = slot_0_142_0.locations
	local var_228_7 = slot_0_88_0(slot_0_137_0)

	if slot_0_139_0 == nil then
		local var_228_8 = var_228_6[slot_0_109_0]

		if var_228_8 == nil then
			var_228_8 = {}
			var_228_6[slot_0_109_0] = var_228_8
		end

		var_228_8[#var_228_8 + 1] = var_228_7
	else
		var_228_6[slot_0_109_0][slot_0_139_0] = var_228_7
	end

	slot_0_138_0 = var_228_7
	slot_0_155_0 = 0
	slot_0_146_0 = false

	slot_0_105_0.source_locations:reset()
	slot_0_74_0(slot_0_38_0("Location '%s' Saved!", slot_0_137_0.name))
end)

function slot_0_156_2(arg_229_0, arg_229_1)
	return arg_229_0.distance < arg_229_1.distance
end

function slot_0_157_1(arg_230_0, arg_230_1, arg_230_2)
	return arg_230_0.x >= arg_230_1.x and arg_230_0.x <= arg_230_1.x + arg_230_2.x and arg_230_0.y >= arg_230_1.y and arg_230_0.y <= arg_230_1.y + arg_230_2.y
end

function slot_0_158_1()
	local var_231_0 = gui.input:Cursor()
	local var_231_1 = slot_0_105_0.source_locations.item
	local var_231_2 = var_231_1:GetPosAbs()
	local var_231_3 = var_231_1.size

	return slot_0_157_1(var_231_0, var_231_2, var_231_3)
end

function slot_0_159_1()
	if slot_0_140_0 == nil or slot_0_142_0 == nil then
		slot_0_137_0 = nil
		slot_0_138_0 = nil
		slot_0_139_0 = nil

		return
	end

	if slot_0_109_0 == nil then
		slot_0_137_0 = nil
		slot_0_138_0 = nil
		slot_0_139_0 = nil

		return
	end

	local var_232_0 = game.globalVars.m_flRenderFrameTime

	slot_0_155_0 = slot_0_155_0 - var_232_0

	if slot_0_155_0 > 0 then
		return
	end

	slot_0_155_0 = 0.2

	if slot_0_158_1() or slot_0_105_0.source_locations:get() > 0 then
		return
	end

	local var_232_1 = slot_0_25_0()

	if var_232_1 == nil or not var_232_1:IsAlive() then
		return
	end

	local var_232_2 = var_232_1:GetActiveWeapon()

	if var_232_2 == nil then
		return
	end

	local var_232_3 = slot_0_111_0(var_232_2)
	local var_232_4 = slot_0_142_0.locations[slot_0_109_0]

	if var_232_4 == nil then
		var_232_4 = {}
	end

	local var_232_5 = {}

	for iter_232_0, iter_232_1 in slot_0_48_0(var_232_4) do
		if iter_232_1.weapon == var_232_3 then
			var_232_5[#var_232_5 + 1] = iter_232_1
		end

		iter_232_1.index = iter_232_0
	end

	local var_232_6 = var_232_1:GetAbsOrigin()

	for iter_232_2, iter_232_3 in slot_0_48_0(var_232_5) do
		local var_232_7 = iter_232_3.position

		if slot_0_50_0(var_232_7) == "table" then
			var_232_7 = slot_0_7_0(var_232_7[1], var_232_7[2], var_232_7[3])
		end

		iter_232_3.distance = slot_0_9_0(var_232_6, var_232_7)
	end

	slot_0_45_0(var_232_5, slot_0_156_2)

	local var_232_8 = #var_232_5
	local var_232_9 = {}

	var_232_9[1] = "+ Create New"
	slot_0_145_0 = {}
	slot_0_145_0[1] = "create_new"

	for iter_232_4 = 1, var_232_8 do
		local var_232_10 = var_232_5[iter_232_4]
		local var_232_11 = var_232_10.name

		var_232_11 = slot_0_50_0(var_232_11) == "table" and var_232_11[2] or var_232_11
		var_232_9[#var_232_9 + 1] = var_232_11
		slot_0_145_0[#slot_0_145_0 + 1] = var_232_10
	end

	slot_0_105_0.source_locations:update(var_232_9)
end

events.createMove:Add(slot_0_159_1)

function slot_0_156_1(arg_233_0)
	slot_0_146_0 = false

	local var_233_0 = slot_0_105_0.source_locations:get() + 1

	slot_0_138_0 = slot_0_145_0[var_233_0]

	if slot_0_138_0 == nil then
		return
	end

	if slot_0_138_0 == "create_new" then
		slot_0_139_0 = nil
	else
		slot_0_139_0 = slot_0_138_0.index
	end

	slot_0_153_0()
end

slot_0_105_0.source_locations:set_callback(function()
	slot_0_79_0(0.01, slot_0_156_1)
end)
slot_0_105_0.editing_sources:set_callback(function()
	slot_0_79_0(0.01, slot_0_156_1)
end)

slot_0_156_0 = nil
slot_0_157_0 = nil
slot_0_158_0 = nil
slot_0_159_0 = nil
slot_0_160_0 = false
slot_0_161_0 = false
slot_0_162_0 = false
slot_0_163_0 = false
slot_0_164_0 = false
slot_0_165_0 = false
slot_0_166_0 = {
	weapon_flashbang = 1,
	weapon_smokegrenade = 4,
	weapon_molotov = 2,
	weapon_hegrenade = 0,
	weapon_decoy = 3
}

function slot_0_167_0()
	slot_0_156_0 = nil
	slot_0_157_0 = nil
	slot_0_158_0 = nil
	slot_0_159_0 = nil
	slot_0_160_0 = false
	slot_0_161_0 = false
	slot_0_162_0 = false
	slot_0_163_0 = false
	slot_0_164_0 = false
	slot_0_165_0 = false
end

events.createMove:Add(function(arg_237_0)
	local var_237_0 = slot_0_25_0()

	if var_237_0 == nil or not var_237_0:IsAlive() then
		return slot_0_167_0()
	end

	if slot_0_140_0 == nil or slot_0_142_0 == nil then
		return slot_0_167_0()
	end

	if slot_0_109_0 == nil then
		return slot_0_167_0()
	end

	if slot_0_137_0 == nil then
		return slot_0_167_0()
	end

	if slot_0_157_0 == nil then
		if slot_0_119_0 == nil then
			return slot_0_167_0()
		end

		slot_0_157_0 = slot_0_119_0.location

		local var_237_1 = slot_0_157_0.position
		local var_237_2 = slot_0_137_0.position

		if var_237_2 == nil then
			slot_0_157_0 = nil

			return
		end

		if slot_0_50_0(var_237_2) == "table" then
			var_237_2 = slot_0_7_0(var_237_2[1], var_237_2[2], var_237_2[3])
		end

		if var_237_1.x ~= var_237_2.x or var_237_1.y ~= var_237_2.y or var_237_1.z ~= var_237_2.z then
			slot_0_157_0 = nil

			return
		end

		local var_237_3 = slot_0_157_0.viewangles
		local var_237_4 = slot_0_137_0.viewangles

		if slot_0_50_0(var_237_4) == "table" then
			var_237_4 = slot_0_7_0(var_237_4[1], var_237_4[2], 0)
		end

		if var_237_4 == nil then
			slot_0_157_0 = nil

			return
		end

		if var_237_3.x ~= var_237_4.x or var_237_3.y ~= var_237_4.y then
			slot_0_157_0 = nil

			return
		end
	end

	if slot_0_159_0 == nil then
		local var_237_5 = slot_0_157_0.weapon
		local var_237_6 = slot_0_166_0[var_237_5]
		local var_237_7 = game.globalVars.m_flCurTime

		entities.projectiles:ForEach(function(arg_238_0)
			local var_238_0 = arg_238_0.entity

			if var_238_0:GetGrenadeType() == var_237_6 then
				slot_0_158_0 = var_237_6

				local var_238_1 = var_238_0.m_flCreateTime:Get().value

				if var_237_7 - var_238_1 == 0.015625 then
					slot_0_159_0 = arg_238_0.handle
				end
			end
		end)

		if slot_0_159_0 == nil then
			return
		end
	end

	local var_237_8 = slot_0_159_0 ~= nil and slot_0_159_0:Get() or nil

	if slot_0_158_0 == 0 and slot_0_164_0 then
		var_237_8 = nil
		slot_0_159_0 = nil
	end

	if slot_0_158_0 == 1 and slot_0_163_0 then
		var_237_8 = nil
		slot_0_159_0 = nil
	end

	if slot_0_158_0 == 3 and slot_0_162_0 then
		var_237_8 = nil
		slot_0_159_0 = nil
	end

	if slot_0_158_0 == 4 and slot_0_161_0 then
		var_237_8 = nil
		slot_0_159_0 = nil
	end

	if var_237_8 == nil then
		if slot_0_158_0 == 2 and not slot_0_160_0 then
			slot_0_156_0 = nil
		end

		if slot_0_156_0 ~= nil then
			for iter_237_0 = #slot_0_156_0 - 1, 1, -1 do
				if iter_237_0 % 2 == 1 then
					slot_0_44_0(slot_0_156_0, iter_237_0)
				end
			end

			slot_0_157_0.points = slot_0_156_0
			slot_0_157_0.detonate_position = slot_0_156_0[#slot_0_156_0]

			local var_237_9 = {}
			local var_237_10 = #slot_0_156_0

			for iter_237_1 = 1, var_237_10 do
				local var_237_11 = slot_0_156_0[iter_237_1]

				var_237_9[iter_237_1] = {
					var_237_11.x,
					var_237_11.y,
					var_237_11.z
				}
			end

			slot_0_137_0.points = var_237_9
		end

		return slot_0_167_0()
	end

	if slot_0_156_0 == nil then
		slot_0_156_0 = {}
	end

	local var_237_12 = slot_0_157_0.position
	local var_237_13 = var_237_8:GetAbsOrigin()

	if slot_0_9_0(var_237_12, var_237_13) > 75 then
		slot_0_156_0[#slot_0_156_0 + 1] = var_237_13
	end
end)
mods.events:AddListener("inferno_startburn")
mods.events:AddListener("smokegrenade_detonate")
mods.events:AddListener("decoy_started")
mods.events:AddListener("flashbang_detonate")
mods.events:AddListener("hegrenade_detonate")
events.event:Add(function(arg_239_0)
	local var_239_0 = arg_239_0:GetName()

	if var_239_0 == "inferno_startburn" and slot_0_156_0 ~= nil then
		slot_0_156_0[#slot_0_156_0 + 1] = slot_0_7_0(arg_239_0:GetFloat("x"), arg_239_0:GetFloat("y"), arg_239_0:GetFloat("z"))
		slot_0_160_0 = true
	end

	if var_239_0 == "smokegrenade_detonate" and slot_0_156_0 ~= nil then
		slot_0_161_0 = true
	end

	if var_239_0 == "decoy_started" and slot_0_156_0 ~= nil then
		slot_0_162_0 = true
	end

	if var_239_0 == "flashbang_detonate" and slot_0_156_0 ~= nil then
		slot_0_163_0 = true
	end

	if var_239_0 == "hegrenade_detonate" and slot_0_156_0 ~= nil then
		slot_0_164_0 = true
	end
end)
