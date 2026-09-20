local reloaded_0_0 = false
local reloaded_0_1 = table.unpack or unpack
local reloaded_0_2 = table.concat
local reloaded_0_3 = string.byte
local reloaded_0_4 = string.char
local reloaded_0_5 = string.rep
local reloaded_0_6 = string.sub
local reloaded_0_7 = string.gsub
local reloaded_0_8 = string.gmatch
local reloaded_0_9 = string.format
local reloaded_0_10 = math.floor
local reloaded_0_11 = math.ceil
local reloaded_0_12 = math.min
local reloaded_0_13 = math.max
local reloaded_0_14 = tonumber
local reloaded_0_15 = type
local reloaded_0_16 = math.huge

local function reloaded_0_17(arg_1_0)
	local reloaded_1_0 = 0
	local reloaded_1_1 = arg_1_0
	local reloaded_1_2 = arg_1_0
	local reloaded_1_3

	while true do
		local reloaded_1_4

		reloaded_1_0, reloaded_1_4, reloaded_1_1, reloaded_1_2 = reloaded_1_0 + 1, reloaded_1_1, reloaded_1_1 + reloaded_1_1 + 1, reloaded_1_2 + reloaded_1_2 + reloaded_1_0 % 2

		if reloaded_1_0 > 256 or reloaded_1_1 - (reloaded_1_1 - 1) ~= 1 or reloaded_1_2 - (reloaded_1_2 - 1) ~= 1 or reloaded_1_1 == reloaded_1_2 then
			return reloaded_1_0, false
		elseif reloaded_1_1 == reloaded_1_4 then
			return reloaded_1_0, true
		end
	end
end

local reloaded_0_18 = 0.6666666666666666
local reloaded_0_19 = reloaded_0_18 * 5 > 3 and reloaded_0_18 * 4 < 3 and reloaded_0_17(1) >= 53

assert(reloaded_0_19, "at least 53-bit floating point numbers are required")

local reloaded_0_20, reloaded_0_21 = reloaded_0_17(1)
local reloaded_0_22 = reloaded_0_21 and reloaded_0_20 == 64
local reloaded_0_23 = reloaded_0_21 and reloaded_0_20 == 32

assert(reloaded_0_22 or reloaded_0_23 or not reloaded_0_21, "Lua integers must be either 32-bit or 64-bit")

local reloaded_0_24 = true
local reloaded_0_25 = true
local reloaded_0_26
local reloaded_0_27
local reloaded_0_28
local reloaded_0_29

if reloaded_0_24 then
	reloaded_0_28 = require("bit")
	reloaded_0_29 = "bit"

	local reloaded_0_30, reloaded_0_31 = pcall(require, "ffi")

	if reloaded_0_30 then
		reloaded_0_27 = reloaded_0_31
	end

	reloaded_0_26 = reloaded_0_15(jit) == "table" and jit.arch or reloaded_0_27 and reloaded_0_27.arch or nil
end

if reloaded_0_0 then
	print("Abilities:")
	print("   Lua version:               " .. (reloaded_0_24 and "LuaJIT " .. (reloaded_0_25 and "2.1 " or "2.0 ") .. (reloaded_0_26 or "") .. (reloaded_0_27 and " with FFI" or " without FFI") or _VERSION))
	print("   Integer bitwise operators: " .. (reloaded_0_22 and "int64" or reloaded_0_23 and "int32" or "no"))
	print("   32-bit bitwise library:    " .. (reloaded_0_29 or "not found"))
end

local reloaded_0_32
local reloaded_0_33
local reloaded_0_34

if reloaded_0_24 and reloaded_0_27 then
	reloaded_0_32 = "Using 'ffi' library of LuaJIT"
	reloaded_0_34 = "FFI"
elseif reloaded_0_24 then
	reloaded_0_32 = "Using special code for sandboxed LuaJIT (no FFI)"
	reloaded_0_34 = "LJ"
elseif reloaded_0_22 then
	reloaded_0_32 = "Using native int64 bitwise operators"
	reloaded_0_34 = "INT64"
elseif reloaded_0_23 then
	reloaded_0_32 = "Using native int32 bitwise operators"
	reloaded_0_34 = "INT32"
elseif reloaded_0_29 then
	reloaded_0_32 = "Using '" .. reloaded_0_29 .. "' library"
	reloaded_0_34 = "LIB32"
else
	reloaded_0_32 = "Emulating bitwise operators using look-up table"
	reloaded_0_34 = "EMUL"
end

if reloaded_0_0 then
	print("Implementation selected:")
	print("   " .. reloaded_0_32)
end

local reloaded_0_35
local reloaded_0_36
local reloaded_0_37
local reloaded_0_38
local reloaded_0_39
local reloaded_0_40
local reloaded_0_41
local reloaded_0_42
local reloaded_0_43
local reloaded_0_44
local reloaded_0_45

if reloaded_0_34 == "FFI" or reloaded_0_34 == "LJ" or reloaded_0_34 == "LIB32" then
	reloaded_0_35 = reloaded_0_28.band
	reloaded_0_36 = reloaded_0_28.bor
	reloaded_0_37 = reloaded_0_28.bxor
	reloaded_0_38 = reloaded_0_28.lshift
	reloaded_0_39 = reloaded_0_28.rshift
	reloaded_0_40 = reloaded_0_28.rol or reloaded_0_28.lrotate
	reloaded_0_41 = reloaded_0_28.ror or reloaded_0_28.rrotate
	reloaded_0_42 = reloaded_0_28.bnot
	reloaded_0_43 = reloaded_0_28.tobit
	reloaded_0_44 = reloaded_0_28.tohex

	assert(reloaded_0_35 and reloaded_0_36 and reloaded_0_37 and reloaded_0_38 and reloaded_0_39 and reloaded_0_40 and reloaded_0_41 and reloaded_0_42, "Library '" .. reloaded_0_29 .. "' is incomplete")

	reloaded_0_45 = reloaded_0_37
end

reloaded_0_44 = reloaded_0_44 or pcall(reloaded_0_9, "%x", 2147483648) and function(arg_2_0)
	return reloaded_0_9("%08x", arg_2_0 % 4294967296)
end or function(arg_3_0)
	return reloaded_0_9("%08x", (arg_3_0 + 2147483648) % 4294967296 - 2147483648)
end

local function reloaded_0_46(arg_4_0, arg_4_1)
	return reloaded_0_37(arg_4_0, arg_4_1 or 2779096485) % 4294967296
end

local function reloaded_0_47()
	return {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
end

local reloaded_0_48
local reloaded_0_49
local reloaded_0_50
local reloaded_0_51
local reloaded_0_52
local reloaded_0_53
local reloaded_0_54
local reloaded_0_55
local reloaded_0_56 = {}
local reloaded_0_57 = {}
local reloaded_0_58 = {}
local reloaded_0_59 = {}
local reloaded_0_60 = {}
local reloaded_0_61 = {}
local reloaded_0_62 = {
	[224] = {},
	[256] = reloaded_0_59
}
local reloaded_0_63 = {
	[384] = {},
	[512] = reloaded_0_58
}
local reloaded_0_64 = {
	[384] = {},
	[512] = reloaded_0_59
}
local reloaded_0_65 = {}
local reloaded_0_66 = {
	1732584193,
	4023233417,
	2562383102,
	271733878,
	3285377520
}
local reloaded_0_67
local reloaded_0_68
local reloaded_0_69 = {}
local reloaded_0_70 = reloaded_0_69
local reloaded_0_71 = reloaded_0_69
local reloaded_0_72 = {}
local reloaded_0_73 = 4294967296
local reloaded_0_74 = 0
local reloaded_0_75 = 0
local reloaded_0_76 = {
	{
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16
	},
	{
		15,
		11,
		5,
		9,
		10,
		16,
		14,
		7,
		2,
		13,
		1,
		3,
		12,
		8,
		6,
		4
	},
	{
		12,
		9,
		13,
		1,
		6,
		3,
		16,
		14,
		11,
		15,
		4,
		7,
		8,
		2,
		10,
		5
	},
	{
		8,
		10,
		4,
		2,
		14,
		13,
		12,
		15,
		3,
		7,
		6,
		11,
		5,
		1,
		16,
		9
	},
	{
		10,
		1,
		6,
		8,
		3,
		5,
		11,
		16,
		15,
		2,
		12,
		13,
		7,
		9,
		4,
		14
	},
	{
		3,
		13,
		7,
		11,
		1,
		12,
		9,
		4,
		5,
		14,
		8,
		6,
		16,
		15,
		2,
		10
	},
	{
		13,
		6,
		2,
		16,
		15,
		14,
		5,
		11,
		1,
		8,
		7,
		4,
		10,
		3,
		9,
		12
	},
	{
		14,
		12,
		8,
		15,
		13,
		2,
		4,
		10,
		6,
		1,
		16,
		5,
		9,
		7,
		3,
		11
	},
	{
		7,
		16,
		15,
		10,
		12,
		4,
		1,
		9,
		13,
		3,
		14,
		8,
		2,
		5,
		11,
		6
	},
	{
		11,
		3,
		9,
		5,
		8,
		7,
		2,
		6,
		16,
		12,
		10,
		15,
		4,
		13,
		14,
		1
	}
}

reloaded_0_76[11], reloaded_0_76[12] = reloaded_0_76[1], reloaded_0_76[2]

local reloaded_0_77 = {
	1,
	3,
	4,
	11,
	13,
	10,
	12,
	6,
	1,
	3,
	4,
	11,
	13,
	10,
	2,
	7,
	5,
	8,
	14,
	15,
	16,
	9,
	2,
	7,
	5,
	8,
	14,
	15
}

local function reloaded_0_78(arg_6_0)
	local reloaded_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs({
		1,
		9,
		13,
		17,
		18,
		21
	}) do
		reloaded_6_0[iter_6_1] = "<" .. reloaded_0_5(arg_6_0, iter_6_1)
	end

	return reloaded_6_0
end

if reloaded_0_34 == "FFI" then
	local reloaded_0_79 = reloaded_0_27.new("int32_t[?]", 80)

	reloaded_0_71 = reloaded_0_79
	reloaded_0_72 = reloaded_0_27.new("int32_t[?]", 16)
	reloaded_0_77 = reloaded_0_27.new("uint8_t[?]", #reloaded_0_77 + 1, 0, reloaded_0_1(reloaded_0_77))

	for iter_0_0 = 1, 10 do
		reloaded_0_76[iter_0_0] = reloaded_0_27.new("uint8_t[?]", #reloaded_0_76[iter_0_0] + 1, 0, reloaded_0_1(reloaded_0_76[iter_0_0]))
	end

	reloaded_0_76[11], reloaded_0_76[12] = reloaded_0_76[1], reloaded_0_76[2]

	function reloaded_0_48(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		local reloaded_7_0 = reloaded_0_79
		local reloaded_7_1 = reloaded_0_57

		for iter_7_0 = arg_7_2, arg_7_2 + arg_7_3 - 1, 64 do
			for iter_7_1 = 0, 15 do
				iter_7_0 = iter_7_0 + 4

				local reloaded_7_2, reloaded_7_3, reloaded_7_4, reloaded_7_5 = reloaded_0_3(arg_7_1, iter_7_0 - 3, iter_7_0)

				reloaded_7_0[iter_7_1] = reloaded_0_36(reloaded_0_38(reloaded_7_2, 24), reloaded_0_38(reloaded_7_3, 16), reloaded_0_38(reloaded_7_4, 8), reloaded_7_5)
			end

			for iter_7_2 = 16, 63 do
				local reloaded_7_6 = reloaded_7_0[iter_7_2 - 15]
				local reloaded_7_7 = reloaded_7_0[iter_7_2 - 2]

				reloaded_7_0[iter_7_2] = reloaded_0_43(reloaded_0_37(reloaded_0_41(reloaded_7_6, 7), reloaded_0_40(reloaded_7_6, 14), reloaded_0_39(reloaded_7_6, 3)) + reloaded_0_37(reloaded_0_40(reloaded_7_7, 15), reloaded_0_40(reloaded_7_7, 13), reloaded_0_39(reloaded_7_7, 10)) + reloaded_7_0[iter_7_2 - 7] + reloaded_7_0[iter_7_2 - 16])
			end

			local reloaded_7_8 = arg_7_0[1]
			local reloaded_7_9 = arg_7_0[2]
			local reloaded_7_10 = arg_7_0[3]
			local reloaded_7_11 = arg_7_0[4]
			local reloaded_7_12 = arg_7_0[5]
			local reloaded_7_13 = arg_7_0[6]
			local reloaded_7_14 = arg_7_0[7]
			local reloaded_7_15 = arg_7_0[8]

			for iter_7_3 = 0, 63, 8 do
				local reloaded_7_16 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3] + reloaded_7_1[iter_7_3 + 1] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_16)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_16)

				local reloaded_7_17 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3 + 1] + reloaded_7_1[iter_7_3 + 2] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_17)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_17)

				local reloaded_7_18 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3 + 2] + reloaded_7_1[iter_7_3 + 3] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_18)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_18)

				local reloaded_7_19 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3 + 3] + reloaded_7_1[iter_7_3 + 4] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_19)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_19)

				local reloaded_7_20 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3 + 4] + reloaded_7_1[iter_7_3 + 5] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_20)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_20)

				local reloaded_7_21 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3 + 5] + reloaded_7_1[iter_7_3 + 6] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_21)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_21)

				local reloaded_7_22 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3 + 6] + reloaded_7_1[iter_7_3 + 7] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_22)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_22)

				local reloaded_7_23 = reloaded_0_43(reloaded_0_37(reloaded_7_14, reloaded_0_35(reloaded_7_12, reloaded_0_37(reloaded_7_13, reloaded_7_14))) + reloaded_0_37(reloaded_0_41(reloaded_7_12, 6), reloaded_0_41(reloaded_7_12, 11), reloaded_0_40(reloaded_7_12, 7)) + (reloaded_7_0[iter_7_3 + 7] + reloaded_7_1[iter_7_3 + 8] + reloaded_7_15))

				reloaded_7_15, reloaded_7_14, reloaded_7_13, reloaded_7_12 = reloaded_7_14, reloaded_7_13, reloaded_7_12, reloaded_0_43(reloaded_7_11 + reloaded_7_23)
				reloaded_7_11, reloaded_7_10, reloaded_7_9, reloaded_7_8 = reloaded_7_10, reloaded_7_9, reloaded_7_8, reloaded_0_43(reloaded_0_37(reloaded_0_35(reloaded_7_8, reloaded_0_37(reloaded_7_9, reloaded_7_10)), reloaded_0_35(reloaded_7_9, reloaded_7_10)) + reloaded_0_37(reloaded_0_41(reloaded_7_8, 2), reloaded_0_41(reloaded_7_8, 13), reloaded_0_40(reloaded_7_8, 10)) + reloaded_7_23)
			end

			arg_7_0[1], arg_7_0[2], arg_7_0[3], arg_7_0[4] = reloaded_0_43(reloaded_7_8 + arg_7_0[1]), reloaded_0_43(reloaded_7_9 + arg_7_0[2]), reloaded_0_43(reloaded_7_10 + arg_7_0[3]), reloaded_0_43(reloaded_7_11 + arg_7_0[4])
			arg_7_0[5], arg_7_0[6], arg_7_0[7], arg_7_0[8] = reloaded_0_43(reloaded_7_12 + arg_7_0[5]), reloaded_0_43(reloaded_7_13 + arg_7_0[6]), reloaded_0_43(reloaded_7_14 + arg_7_0[7]), reloaded_0_43(reloaded_7_15 + arg_7_0[8])
		end
	end

	local reloaded_0_80 = reloaded_0_27.new("int64_t[?]", 80)

	reloaded_0_70 = reloaded_0_80

	local reloaded_0_81 = reloaded_0_27.typeof("int64_t")
	local reloaded_0_82 = reloaded_0_27.typeof("int32_t")
	local reloaded_0_83 = reloaded_0_27.typeof("uint32_t")

	reloaded_0_74 = reloaded_0_81(4294967296)

	if reloaded_0_25 then
		local reloaded_0_84 = reloaded_0_35
		local reloaded_0_85 = reloaded_0_36
		local reloaded_0_86 = reloaded_0_37
		local reloaded_0_87 = reloaded_0_42
		local reloaded_0_88 = reloaded_0_38
		local reloaded_0_89 = reloaded_0_39
		local reloaded_0_90 = reloaded_0_40
		local reloaded_0_91 = reloaded_0_41

		reloaded_0_67 = reloaded_0_44

		local reloaded_0_92 = reloaded_0_27.new("int64_t[?]", 16)
		local reloaded_0_93 = reloaded_0_70

		local function reloaded_0_94(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
			local reloaded_8_0 = reloaded_0_92[arg_8_0]
			local reloaded_8_1 = reloaded_0_92[arg_8_1]
			local reloaded_8_2 = reloaded_0_92[arg_8_2]
			local reloaded_8_3 = reloaded_0_92[arg_8_3]
			local reloaded_8_4 = reloaded_0_93[arg_8_4] + (reloaded_8_0 + reloaded_8_1)
			local reloaded_8_5 = reloaded_0_91(reloaded_0_86(reloaded_8_3, reloaded_8_4), 32)
			local reloaded_8_6 = reloaded_8_2 + reloaded_8_5
			local reloaded_8_7 = reloaded_0_91(reloaded_0_86(reloaded_8_1, reloaded_8_6), 24)
			local reloaded_8_8 = reloaded_0_93[arg_8_5] + (reloaded_8_4 + reloaded_8_7)
			local reloaded_8_9 = reloaded_0_91(reloaded_0_86(reloaded_8_5, reloaded_8_8), 16)
			local reloaded_8_10 = reloaded_8_6 + reloaded_8_9
			local reloaded_8_11 = reloaded_0_90(reloaded_0_86(reloaded_8_7, reloaded_8_10), 1)

			reloaded_0_92[arg_8_0], reloaded_0_92[arg_8_1], reloaded_0_92[arg_8_2], reloaded_0_92[arg_8_3] = reloaded_8_8, reloaded_8_11, reloaded_8_10, reloaded_8_9
		end

		function reloaded_0_54(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6, arg_9_7)
			local reloaded_9_0 = arg_9_0[1]
			local reloaded_9_1 = arg_9_0[2]
			local reloaded_9_2 = arg_9_0[3]
			local reloaded_9_3 = arg_9_0[4]
			local reloaded_9_4 = arg_9_0[5]
			local reloaded_9_5 = arg_9_0[6]
			local reloaded_9_6 = arg_9_0[7]
			local reloaded_9_7 = arg_9_0[8]

			for iter_9_0 = arg_9_3, arg_9_3 + arg_9_4 - 1, 128 do
				if arg_9_2 then
					for iter_9_1 = 1, 16 do
						iter_9_0 = iter_9_0 + 8

						local reloaded_9_8, reloaded_9_9, reloaded_9_10, reloaded_9_11, reloaded_9_12, reloaded_9_13, reloaded_9_14, reloaded_9_15 = reloaded_0_3(arg_9_2, iter_9_0 - 7, iter_9_0)

						reloaded_0_93[iter_9_1] = reloaded_0_86(reloaded_0_36(reloaded_0_38(reloaded_9_15, 24), reloaded_0_38(reloaded_9_14, 16), reloaded_0_38(reloaded_9_13, 8), reloaded_9_12) * reloaded_0_81(4294967296), reloaded_0_83(reloaded_0_82(reloaded_0_36(reloaded_0_38(reloaded_9_11, 24), reloaded_0_38(reloaded_9_10, 16), reloaded_0_38(reloaded_9_9, 8), reloaded_9_8))))
					end
				end

				reloaded_0_92[0], reloaded_0_92[1], reloaded_0_92[2], reloaded_0_92[3], reloaded_0_92[4], reloaded_0_92[5], reloaded_0_92[6], reloaded_0_92[7] = reloaded_9_0, reloaded_9_1, reloaded_9_2, reloaded_9_3, reloaded_9_4, reloaded_9_5, reloaded_9_6, reloaded_9_7
				reloaded_0_92[8], reloaded_0_92[9], reloaded_0_92[10], reloaded_0_92[11], reloaded_0_92[13], reloaded_0_92[14], reloaded_0_92[15] = reloaded_0_58[1], reloaded_0_58[2], reloaded_0_58[3], reloaded_0_58[4], reloaded_0_58[6], reloaded_0_58[7], reloaded_0_58[8]
				arg_9_5 = arg_9_5 + (arg_9_6 or 128)
				reloaded_0_92[12] = reloaded_0_86(reloaded_0_58[5], arg_9_5)

				if arg_9_6 then
					reloaded_0_92[14] = reloaded_0_87(reloaded_0_92[14])
				end

				if arg_9_7 then
					reloaded_0_92[15] = reloaded_0_87(reloaded_0_92[15])
				end

				for iter_9_2 = 1, 12 do
					local reloaded_9_16 = reloaded_0_76[iter_9_2]

					reloaded_0_94(0, 4, 8, 12, reloaded_9_16[1], reloaded_9_16[2])
					reloaded_0_94(1, 5, 9, 13, reloaded_9_16[3], reloaded_9_16[4])
					reloaded_0_94(2, 6, 10, 14, reloaded_9_16[5], reloaded_9_16[6])
					reloaded_0_94(3, 7, 11, 15, reloaded_9_16[7], reloaded_9_16[8])
					reloaded_0_94(0, 5, 10, 15, reloaded_9_16[9], reloaded_9_16[10])
					reloaded_0_94(1, 6, 11, 12, reloaded_9_16[11], reloaded_9_16[12])
					reloaded_0_94(2, 7, 8, 13, reloaded_9_16[13], reloaded_9_16[14])
					reloaded_0_94(3, 4, 9, 14, reloaded_9_16[15], reloaded_9_16[16])
				end

				reloaded_9_0 = reloaded_0_86(reloaded_9_0, reloaded_0_92[0], reloaded_0_92[8])
				reloaded_9_1 = reloaded_0_86(reloaded_9_1, reloaded_0_92[1], reloaded_0_92[9])
				reloaded_9_2 = reloaded_0_86(reloaded_9_2, reloaded_0_92[2], reloaded_0_92[10])
				reloaded_9_3 = reloaded_0_86(reloaded_9_3, reloaded_0_92[3], reloaded_0_92[11])
				reloaded_9_4 = reloaded_0_86(reloaded_9_4, reloaded_0_92[4], reloaded_0_92[12])
				reloaded_9_5 = reloaded_0_86(reloaded_9_5, reloaded_0_92[5], reloaded_0_92[13])
				reloaded_9_6 = reloaded_0_86(reloaded_9_6, reloaded_0_92[6], reloaded_0_92[14])
				reloaded_9_7 = reloaded_0_86(reloaded_9_7, reloaded_0_92[7], reloaded_0_92[15])
			end

			arg_9_0[1], arg_9_0[2], arg_9_0[3], arg_9_0[4], arg_9_0[5], arg_9_0[6], arg_9_0[7], arg_9_0[8] = reloaded_9_0, reloaded_9_1, reloaded_9_2, reloaded_9_3, reloaded_9_4, reloaded_9_5, reloaded_9_6, reloaded_9_7

			return arg_9_5
		end

		local reloaded_0_95 = reloaded_0_27.typeof("int64_t[?]")

		reloaded_0_68 = 0
		reloaded_0_75 = reloaded_0_81(4294967296)

		function reloaded_0_47()
			return reloaded_0_95(30)
		end

		function reloaded_0_52(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
			local reloaded_11_0 = reloaded_0_60
			local reloaded_11_1 = reloaded_0_39(arg_11_5, 3)

			for iter_11_0 = arg_11_3, arg_11_3 + arg_11_4 - 1, arg_11_5 do
				for iter_11_1 = 0, reloaded_11_1 - 1 do
					iter_11_0 = iter_11_0 + 8

					local reloaded_11_2, reloaded_11_3, reloaded_11_4, reloaded_11_5, reloaded_11_6, reloaded_11_7, reloaded_11_8, reloaded_11_9 = reloaded_0_3(arg_11_2, iter_11_0 - 7, iter_11_0)

					arg_11_0[iter_11_1] = reloaded_0_86(arg_11_0[iter_11_1], reloaded_0_85(reloaded_0_36(reloaded_0_38(reloaded_11_9, 24), reloaded_0_38(reloaded_11_8, 16), reloaded_0_38(reloaded_11_7, 8), reloaded_11_6) * reloaded_0_81(4294967296), reloaded_0_83(reloaded_0_82(reloaded_0_36(reloaded_0_38(reloaded_11_5, 24), reloaded_0_38(reloaded_11_4, 16), reloaded_0_38(reloaded_11_3, 8), reloaded_11_2)))))
				end

				for iter_11_2 = 1, 24 do
					for iter_11_3 = 0, 4 do
						arg_11_0[25 + iter_11_3] = reloaded_0_86(arg_11_0[iter_11_3], arg_11_0[iter_11_3 + 5], arg_11_0[iter_11_3 + 10], arg_11_0[iter_11_3 + 15], arg_11_0[iter_11_3 + 20])
					end

					local reloaded_11_10 = reloaded_0_86(arg_11_0[25], reloaded_0_90(arg_11_0[27], 1))

					arg_11_0[1], arg_11_0[6], arg_11_0[11], arg_11_0[16] = reloaded_0_90(reloaded_0_86(reloaded_11_10, arg_11_0[6]), 44), reloaded_0_90(reloaded_0_86(reloaded_11_10, arg_11_0[16]), 45), reloaded_0_90(reloaded_0_86(reloaded_11_10, arg_11_0[1]), 1), reloaded_0_90(reloaded_0_86(reloaded_11_10, arg_11_0[11]), 10)
					arg_11_0[21] = reloaded_0_90(reloaded_0_86(reloaded_11_10, arg_11_0[21]), 2)

					local reloaded_11_11 = reloaded_0_86(arg_11_0[26], reloaded_0_90(arg_11_0[28], 1))

					arg_11_0[2], arg_11_0[7], arg_11_0[12], arg_11_0[22] = reloaded_0_90(reloaded_0_86(reloaded_11_11, arg_11_0[12]), 43), reloaded_0_90(reloaded_0_86(reloaded_11_11, arg_11_0[22]), 61), reloaded_0_90(reloaded_0_86(reloaded_11_11, arg_11_0[7]), 6), reloaded_0_90(reloaded_0_86(reloaded_11_11, arg_11_0[2]), 62)
					arg_11_0[17] = reloaded_0_90(reloaded_0_86(reloaded_11_11, arg_11_0[17]), 15)

					local reloaded_11_12 = reloaded_0_86(arg_11_0[27], reloaded_0_90(arg_11_0[29], 1))

					arg_11_0[3], arg_11_0[8], arg_11_0[18], arg_11_0[23] = reloaded_0_90(reloaded_0_86(reloaded_11_12, arg_11_0[18]), 21), reloaded_0_90(reloaded_0_86(reloaded_11_12, arg_11_0[3]), 28), reloaded_0_90(reloaded_0_86(reloaded_11_12, arg_11_0[23]), 56), reloaded_0_90(reloaded_0_86(reloaded_11_12, arg_11_0[8]), 55)
					arg_11_0[13] = reloaded_0_90(reloaded_0_86(reloaded_11_12, arg_11_0[13]), 25)

					local reloaded_11_13 = reloaded_0_86(arg_11_0[28], reloaded_0_90(arg_11_0[25], 1))

					arg_11_0[4], arg_11_0[14], arg_11_0[19], arg_11_0[24] = reloaded_0_90(reloaded_0_86(reloaded_11_13, arg_11_0[24]), 14), reloaded_0_90(reloaded_0_86(reloaded_11_13, arg_11_0[19]), 8), reloaded_0_90(reloaded_0_86(reloaded_11_13, arg_11_0[4]), 27), reloaded_0_90(reloaded_0_86(reloaded_11_13, arg_11_0[14]), 39)
					arg_11_0[9] = reloaded_0_90(reloaded_0_86(reloaded_11_13, arg_11_0[9]), 20)

					local reloaded_11_14 = reloaded_0_86(arg_11_0[29], reloaded_0_90(arg_11_0[26], 1))

					arg_11_0[5], arg_11_0[10], arg_11_0[15], arg_11_0[20] = reloaded_0_90(reloaded_0_86(reloaded_11_14, arg_11_0[10]), 3), reloaded_0_90(reloaded_0_86(reloaded_11_14, arg_11_0[20]), 18), reloaded_0_90(reloaded_0_86(reloaded_11_14, arg_11_0[5]), 36), reloaded_0_90(reloaded_0_86(reloaded_11_14, arg_11_0[15]), 41)
					arg_11_0[0] = reloaded_0_86(reloaded_11_14, arg_11_0[0])
					arg_11_0[0], arg_11_0[1], arg_11_0[2], arg_11_0[3], arg_11_0[4] = reloaded_0_86(arg_11_0[0], reloaded_0_84(reloaded_0_87(arg_11_0[1]), arg_11_0[2]), reloaded_11_0[iter_11_2]), reloaded_0_86(arg_11_0[1], reloaded_0_84(reloaded_0_87(arg_11_0[2]), arg_11_0[3])), reloaded_0_86(arg_11_0[2], reloaded_0_84(reloaded_0_87(arg_11_0[3]), arg_11_0[4])), reloaded_0_86(arg_11_0[3], reloaded_0_84(reloaded_0_87(arg_11_0[4]), arg_11_0[0])), reloaded_0_86(arg_11_0[4], reloaded_0_84(reloaded_0_87(arg_11_0[0]), arg_11_0[1]))
					arg_11_0[5], arg_11_0[6], arg_11_0[7], arg_11_0[8], arg_11_0[9] = reloaded_0_86(arg_11_0[8], reloaded_0_84(reloaded_0_87(arg_11_0[9]), arg_11_0[5])), reloaded_0_86(arg_11_0[9], reloaded_0_84(reloaded_0_87(arg_11_0[5]), arg_11_0[6])), reloaded_0_86(arg_11_0[5], reloaded_0_84(reloaded_0_87(arg_11_0[6]), arg_11_0[7])), reloaded_0_86(arg_11_0[6], reloaded_0_84(reloaded_0_87(arg_11_0[7]), arg_11_0[8])), reloaded_0_86(arg_11_0[7], reloaded_0_84(reloaded_0_87(arg_11_0[8]), arg_11_0[9]))
					arg_11_0[10], arg_11_0[11], arg_11_0[12], arg_11_0[13], arg_11_0[14] = reloaded_0_86(arg_11_0[11], reloaded_0_84(reloaded_0_87(arg_11_0[12]), arg_11_0[13])), reloaded_0_86(arg_11_0[12], reloaded_0_84(reloaded_0_87(arg_11_0[13]), arg_11_0[14])), reloaded_0_86(arg_11_0[13], reloaded_0_84(reloaded_0_87(arg_11_0[14]), arg_11_0[10])), reloaded_0_86(arg_11_0[14], reloaded_0_84(reloaded_0_87(arg_11_0[10]), arg_11_0[11])), reloaded_0_86(arg_11_0[10], reloaded_0_84(reloaded_0_87(arg_11_0[11]), arg_11_0[12]))
					arg_11_0[15], arg_11_0[16], arg_11_0[17], arg_11_0[18], arg_11_0[19] = reloaded_0_86(arg_11_0[19], reloaded_0_84(reloaded_0_87(arg_11_0[15]), arg_11_0[16])), reloaded_0_86(arg_11_0[15], reloaded_0_84(reloaded_0_87(arg_11_0[16]), arg_11_0[17])), reloaded_0_86(arg_11_0[16], reloaded_0_84(reloaded_0_87(arg_11_0[17]), arg_11_0[18])), reloaded_0_86(arg_11_0[17], reloaded_0_84(reloaded_0_87(arg_11_0[18]), arg_11_0[19])), reloaded_0_86(arg_11_0[18], reloaded_0_84(reloaded_0_87(arg_11_0[19]), arg_11_0[15]))
					arg_11_0[20], arg_11_0[21], arg_11_0[22], arg_11_0[23], arg_11_0[24] = reloaded_0_86(arg_11_0[22], reloaded_0_84(reloaded_0_87(arg_11_0[23]), arg_11_0[24])), reloaded_0_86(arg_11_0[23], reloaded_0_84(reloaded_0_87(arg_11_0[24]), arg_11_0[20])), reloaded_0_86(arg_11_0[24], reloaded_0_84(reloaded_0_87(arg_11_0[20]), arg_11_0[21])), reloaded_0_86(arg_11_0[20], reloaded_0_84(reloaded_0_87(arg_11_0[21]), arg_11_0[22])), reloaded_0_86(arg_11_0[21], reloaded_0_84(reloaded_0_87(arg_11_0[22]), arg_11_0[23]))
				end
			end
		end

		local reloaded_0_96 = 2779096485 * reloaded_0_81(4294967297)

		function reloaded_0_46(arg_12_0, arg_12_1)
			return reloaded_0_86(arg_12_0, arg_12_1 or reloaded_0_96)
		end

		function reloaded_0_49(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
			local reloaded_13_0 = reloaded_0_80
			local reloaded_13_1 = reloaded_0_56

			for iter_13_0 = arg_13_3, arg_13_3 + arg_13_4 - 1, 128 do
				for iter_13_1 = 0, 15 do
					iter_13_0 = iter_13_0 + 8

					local reloaded_13_2, reloaded_13_3, reloaded_13_4, reloaded_13_5, reloaded_13_6, reloaded_13_7, reloaded_13_8, reloaded_13_9 = reloaded_0_3(arg_13_2, iter_13_0 - 7, iter_13_0)

					reloaded_13_0[iter_13_1] = reloaded_0_85(reloaded_0_36(reloaded_0_38(reloaded_13_2, 24), reloaded_0_38(reloaded_13_3, 16), reloaded_0_38(reloaded_13_4, 8), reloaded_13_5) * reloaded_0_81(4294967296), reloaded_0_83(reloaded_0_82(reloaded_0_36(reloaded_0_38(reloaded_13_6, 24), reloaded_0_38(reloaded_13_7, 16), reloaded_0_38(reloaded_13_8, 8), reloaded_13_9))))
				end

				for iter_13_2 = 16, 79 do
					local reloaded_13_10 = reloaded_13_0[iter_13_2 - 15]
					local reloaded_13_11 = reloaded_13_0[iter_13_2 - 2]

					reloaded_13_0[iter_13_2] = reloaded_0_86(reloaded_0_91(reloaded_13_10, 1), reloaded_0_91(reloaded_13_10, 8), reloaded_0_89(reloaded_13_10, 7)) + reloaded_0_86(reloaded_0_91(reloaded_13_11, 19), reloaded_0_90(reloaded_13_11, 3), reloaded_0_89(reloaded_13_11, 6)) + reloaded_13_0[iter_13_2 - 7] + reloaded_13_0[iter_13_2 - 16]
				end

				local reloaded_13_12 = arg_13_0[1]
				local reloaded_13_13 = arg_13_0[2]
				local reloaded_13_14 = arg_13_0[3]
				local reloaded_13_15 = arg_13_0[4]
				local reloaded_13_16 = arg_13_0[5]
				local reloaded_13_17 = arg_13_0[6]
				local reloaded_13_18 = arg_13_0[7]
				local reloaded_13_19 = arg_13_0[8]

				for iter_13_3 = 0, 79, 8 do
					local reloaded_13_20 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 1] + reloaded_13_0[iter_13_3]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_20 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_20

					local reloaded_13_21 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 2] + reloaded_13_0[iter_13_3 + 1]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_21 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_21

					local reloaded_13_22 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 3] + reloaded_13_0[iter_13_3 + 2]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_22 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_22

					local reloaded_13_23 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 4] + reloaded_13_0[iter_13_3 + 3]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_23 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_23

					local reloaded_13_24 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 5] + reloaded_13_0[iter_13_3 + 4]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_24 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_24

					local reloaded_13_25 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 6] + reloaded_13_0[iter_13_3 + 5]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_25 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_25

					local reloaded_13_26 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 7] + reloaded_13_0[iter_13_3 + 6]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_26 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_26

					local reloaded_13_27 = reloaded_0_86(reloaded_0_91(reloaded_13_16, 14), reloaded_0_91(reloaded_13_16, 18), reloaded_0_90(reloaded_13_16, 23)) + reloaded_0_86(reloaded_13_18, reloaded_0_84(reloaded_13_16, reloaded_0_86(reloaded_13_17, reloaded_13_18))) + reloaded_13_19 + reloaded_13_1[iter_13_3 + 8] + reloaded_13_0[iter_13_3 + 7]

					reloaded_13_19, reloaded_13_18, reloaded_13_17, reloaded_13_16 = reloaded_13_18, reloaded_13_17, reloaded_13_16, reloaded_13_27 + reloaded_13_15
					reloaded_13_15, reloaded_13_14, reloaded_13_13, reloaded_13_12 = reloaded_13_14, reloaded_13_13, reloaded_13_12, reloaded_0_86(reloaded_0_84(reloaded_0_86(reloaded_13_12, reloaded_13_13), reloaded_13_14), reloaded_0_84(reloaded_13_12, reloaded_13_13)) + reloaded_0_86(reloaded_0_91(reloaded_13_12, 28), reloaded_0_90(reloaded_13_12, 25), reloaded_0_90(reloaded_13_12, 30)) + reloaded_13_27
				end

				arg_13_0[1] = reloaded_13_12 + arg_13_0[1]
				arg_13_0[2] = reloaded_13_13 + arg_13_0[2]
				arg_13_0[3] = reloaded_13_14 + arg_13_0[3]
				arg_13_0[4] = reloaded_13_15 + arg_13_0[4]
				arg_13_0[5] = reloaded_13_16 + arg_13_0[5]
				arg_13_0[6] = reloaded_13_17 + arg_13_0[6]
				arg_13_0[7] = reloaded_13_18 + arg_13_0[7]
				arg_13_0[8] = reloaded_13_19 + arg_13_0[8]
			end
		end
	else
		local reloaded_0_97 = reloaded_0_27.new("union{int64_t i64; struct{int32_t " .. (reloaded_0_27.abi("le") and "lo, hi" or "hi, lo") .. ";} i32;}[3]")

		local function reloaded_0_98(arg_14_0)
			reloaded_0_97[0].i64 = arg_14_0

			local reloaded_14_0 = reloaded_0_97[0].i32.lo
			local reloaded_14_1 = reloaded_0_97[0].i32.hi
			local reloaded_14_2 = reloaded_0_37(reloaded_0_39(reloaded_14_0, 1), reloaded_0_38(reloaded_14_1, 31), reloaded_0_39(reloaded_14_0, 8), reloaded_0_38(reloaded_14_1, 24), reloaded_0_39(reloaded_14_0, 7), reloaded_0_38(reloaded_14_1, 25))

			return reloaded_0_37(reloaded_0_39(reloaded_14_1, 1), reloaded_0_38(reloaded_14_0, 31), reloaded_0_39(reloaded_14_1, 8), reloaded_0_38(reloaded_14_0, 24), reloaded_0_39(reloaded_14_1, 7)) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_14_2))
		end

		local function reloaded_0_99(arg_15_0)
			reloaded_0_97[0].i64 = arg_15_0

			local reloaded_15_0 = reloaded_0_97[0].i32.lo
			local reloaded_15_1 = reloaded_0_97[0].i32.hi
			local reloaded_15_2 = reloaded_0_37(reloaded_0_39(reloaded_15_0, 19), reloaded_0_38(reloaded_15_1, 13), reloaded_0_38(reloaded_15_0, 3), reloaded_0_39(reloaded_15_1, 29), reloaded_0_39(reloaded_15_0, 6), reloaded_0_38(reloaded_15_1, 26))

			return reloaded_0_37(reloaded_0_39(reloaded_15_1, 19), reloaded_0_38(reloaded_15_0, 13), reloaded_0_38(reloaded_15_1, 3), reloaded_0_39(reloaded_15_0, 29), reloaded_0_39(reloaded_15_1, 6)) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_15_2))
		end

		local function reloaded_0_100(arg_16_0)
			reloaded_0_97[0].i64 = arg_16_0

			local reloaded_16_0 = reloaded_0_97[0].i32.lo
			local reloaded_16_1 = reloaded_0_97[0].i32.hi
			local reloaded_16_2 = reloaded_0_37(reloaded_0_39(reloaded_16_0, 14), reloaded_0_38(reloaded_16_1, 18), reloaded_0_39(reloaded_16_0, 18), reloaded_0_38(reloaded_16_1, 14), reloaded_0_38(reloaded_16_0, 23), reloaded_0_39(reloaded_16_1, 9))

			return reloaded_0_37(reloaded_0_39(reloaded_16_1, 14), reloaded_0_38(reloaded_16_0, 18), reloaded_0_39(reloaded_16_1, 18), reloaded_0_38(reloaded_16_0, 14), reloaded_0_38(reloaded_16_1, 23), reloaded_0_39(reloaded_16_0, 9)) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_16_2))
		end

		local function reloaded_0_101(arg_17_0)
			reloaded_0_97[0].i64 = arg_17_0

			local reloaded_17_0 = reloaded_0_97[0].i32.lo
			local reloaded_17_1 = reloaded_0_97[0].i32.hi
			local reloaded_17_2 = reloaded_0_37(reloaded_0_39(reloaded_17_0, 28), reloaded_0_38(reloaded_17_1, 4), reloaded_0_38(reloaded_17_0, 30), reloaded_0_39(reloaded_17_1, 2), reloaded_0_38(reloaded_17_0, 25), reloaded_0_39(reloaded_17_1, 7))

			return reloaded_0_37(reloaded_0_39(reloaded_17_1, 28), reloaded_0_38(reloaded_17_0, 4), reloaded_0_38(reloaded_17_1, 30), reloaded_0_39(reloaded_17_0, 2), reloaded_0_38(reloaded_17_1, 25), reloaded_0_39(reloaded_17_0, 7)) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_17_2))
		end

		local function reloaded_0_102(arg_18_0, arg_18_1, arg_18_2)
			reloaded_0_97[0].i64 = arg_18_1
			reloaded_0_97[1].i64 = arg_18_2
			reloaded_0_97[2].i64 = arg_18_0

			local reloaded_18_0 = reloaded_0_97[0].i32.lo
			local reloaded_18_1 = reloaded_0_97[0].i32.hi
			local reloaded_18_2 = reloaded_0_97[1].i32.lo
			local reloaded_18_3 = reloaded_0_97[1].i32.hi
			local reloaded_18_4 = reloaded_0_97[2].i32.lo
			local reloaded_18_5 = reloaded_0_97[2].i32.hi
			local reloaded_18_6 = reloaded_0_37(reloaded_18_2, reloaded_0_35(reloaded_18_4, reloaded_0_37(reloaded_18_0, reloaded_18_2)))

			return reloaded_0_37(reloaded_18_3, reloaded_0_35(reloaded_18_5, reloaded_0_37(reloaded_18_1, reloaded_18_3))) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_18_6))
		end

		local function reloaded_0_103(arg_19_0, arg_19_1, arg_19_2)
			reloaded_0_97[0].i64 = arg_19_0
			reloaded_0_97[1].i64 = arg_19_1
			reloaded_0_97[2].i64 = arg_19_2

			local reloaded_19_0 = reloaded_0_97[0].i32.lo
			local reloaded_19_1 = reloaded_0_97[0].i32.hi
			local reloaded_19_2 = reloaded_0_97[1].i32.lo
			local reloaded_19_3 = reloaded_0_97[1].i32.hi
			local reloaded_19_4 = reloaded_0_97[2].i32.lo
			local reloaded_19_5 = reloaded_0_97[2].i32.hi
			local reloaded_19_6 = reloaded_0_37(reloaded_0_35(reloaded_0_37(reloaded_19_0, reloaded_19_2), reloaded_19_4), reloaded_0_35(reloaded_19_0, reloaded_19_2))

			return reloaded_0_37(reloaded_0_35(reloaded_0_37(reloaded_19_1, reloaded_19_3), reloaded_19_5), reloaded_0_35(reloaded_19_1, reloaded_19_3)) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_19_6))
		end

		local function reloaded_0_104(arg_20_0, arg_20_1, arg_20_2)
			reloaded_0_97[0].i64 = arg_20_0
			reloaded_0_97[1].i64 = arg_20_1

			local reloaded_20_0 = reloaded_0_97[0].i32.lo
			local reloaded_20_1 = reloaded_0_97[0].i32.hi
			local reloaded_20_2 = reloaded_0_97[1].i32.lo
			local reloaded_20_3 = reloaded_0_97[1].i32.hi
			local reloaded_20_4 = reloaded_0_37(reloaded_20_0, reloaded_20_2)
			local reloaded_20_5 = reloaded_0_37(reloaded_20_1, reloaded_20_3)
			local reloaded_20_6 = reloaded_0_37(reloaded_0_39(reloaded_20_4, arg_20_2), reloaded_0_38(reloaded_20_5, -arg_20_2))

			return reloaded_0_37(reloaded_0_39(reloaded_20_5, arg_20_2), reloaded_0_38(reloaded_20_4, -arg_20_2)) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_20_6))
		end

		local function reloaded_0_105(arg_21_0, arg_21_1)
			reloaded_0_97[0].i64 = arg_21_0
			reloaded_0_97[1].i64 = arg_21_1

			local reloaded_21_0 = reloaded_0_97[0].i32.lo
			local reloaded_21_1 = reloaded_0_97[0].i32.hi
			local reloaded_21_2 = reloaded_0_97[1].i32.lo
			local reloaded_21_3 = reloaded_0_97[1].i32.hi
			local reloaded_21_4 = reloaded_0_37(reloaded_21_0, reloaded_21_2)
			local reloaded_21_5 = reloaded_0_37(reloaded_21_1, reloaded_21_3)
			local reloaded_21_6 = reloaded_0_37(reloaded_0_38(reloaded_21_4, 1), reloaded_0_39(reloaded_21_5, 31))

			return reloaded_0_37(reloaded_0_38(reloaded_21_5, 1), reloaded_0_39(reloaded_21_4, 31)) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_21_6))
		end

		local function reloaded_0_106(arg_22_0, arg_22_1)
			reloaded_0_97[0].i64 = arg_22_0
			reloaded_0_97[1].i64 = arg_22_1

			local reloaded_22_0 = reloaded_0_97[0].i32.lo
			local reloaded_22_1 = reloaded_0_97[0].i32.hi
			local reloaded_22_2 = reloaded_0_97[1].i32.lo
			local reloaded_22_3 = reloaded_0_97[1].i32.hi
			local reloaded_22_4 = reloaded_0_37(reloaded_22_0, reloaded_22_2)
			local reloaded_22_5 = reloaded_0_37(reloaded_22_1, reloaded_22_3)

			return reloaded_22_4 * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_22_5))
		end

		local function reloaded_0_107(arg_23_0, arg_23_1)
			reloaded_0_97[0].i64 = arg_23_0
			reloaded_0_97[1].i64 = arg_23_1

			local reloaded_23_0 = reloaded_0_97[0].i32.lo
			local reloaded_23_1 = reloaded_0_97[0].i32.hi
			local reloaded_23_2 = reloaded_0_97[1].i32.lo
			local reloaded_23_3 = reloaded_0_97[1].i32.hi
			local reloaded_23_4 = reloaded_0_37(reloaded_23_0, reloaded_23_2)

			return reloaded_0_37(reloaded_23_1, reloaded_23_3) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_23_4))
		end

		local function reloaded_0_108(arg_24_0, arg_24_1, arg_24_2)
			reloaded_0_97[0].i64 = arg_24_0
			reloaded_0_97[1].i64 = arg_24_1
			reloaded_0_97[2].i64 = arg_24_2

			local reloaded_24_0 = reloaded_0_97[0].i32.lo
			local reloaded_24_1 = reloaded_0_97[0].i32.hi
			local reloaded_24_2 = reloaded_0_97[1].i32.lo
			local reloaded_24_3 = reloaded_0_97[1].i32.hi
			local reloaded_24_4 = reloaded_0_97[2].i32.lo
			local reloaded_24_5 = reloaded_0_97[2].i32.hi
			local reloaded_24_6 = reloaded_0_37(reloaded_24_0, reloaded_24_2, reloaded_24_4)

			return reloaded_0_37(reloaded_24_1, reloaded_24_3, reloaded_24_5) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_24_6))
		end

		function reloaded_0_46(arg_25_0, arg_25_1)
			reloaded_0_97[0].i64 = arg_25_0

			local reloaded_25_0 = reloaded_0_97[0].i32.lo
			local reloaded_25_1 = reloaded_0_97[0].i32.hi
			local reloaded_25_2 = 2779096485
			local reloaded_25_3 = 2779096485

			if arg_25_1 then
				reloaded_0_97[1].i64 = arg_25_1
				reloaded_25_2, reloaded_25_3 = reloaded_0_97[1].i32.lo, reloaded_0_97[1].i32.hi
			end

			local reloaded_25_4 = reloaded_0_37(reloaded_25_0, reloaded_25_2)

			return reloaded_0_37(reloaded_25_1, reloaded_25_3) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_25_4))
		end

		function reloaded_0_67(arg_26_0)
			reloaded_0_97[0].i64 = arg_26_0

			return reloaded_0_44(reloaded_0_97[0].i32.hi) .. reloaded_0_44(reloaded_0_97[0].i32.lo)
		end

		function reloaded_0_49(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
			local reloaded_27_0 = reloaded_0_80
			local reloaded_27_1 = reloaded_0_56

			for iter_27_0 = arg_27_3, arg_27_3 + arg_27_4 - 1, 128 do
				for iter_27_1 = 0, 15 do
					iter_27_0 = iter_27_0 + 8

					local reloaded_27_2, reloaded_27_3, reloaded_27_4, reloaded_27_5, reloaded_27_6, reloaded_27_7, reloaded_27_8, reloaded_27_9 = reloaded_0_3(arg_27_2, iter_27_0 - 7, iter_27_0)

					reloaded_27_0[iter_27_1] = reloaded_0_36(reloaded_0_38(reloaded_27_2, 24), reloaded_0_38(reloaded_27_3, 16), reloaded_0_38(reloaded_27_4, 8), reloaded_27_5) * reloaded_0_81(4294967296) + reloaded_0_83(reloaded_0_82(reloaded_0_36(reloaded_0_38(reloaded_27_6, 24), reloaded_0_38(reloaded_27_7, 16), reloaded_0_38(reloaded_27_8, 8), reloaded_27_9)))
				end

				for iter_27_2 = 16, 79 do
					reloaded_27_0[iter_27_2] = reloaded_0_98(reloaded_27_0[iter_27_2 - 15]) + reloaded_0_99(reloaded_27_0[iter_27_2 - 2]) + reloaded_27_0[iter_27_2 - 7] + reloaded_27_0[iter_27_2 - 16]
				end

				local reloaded_27_10 = arg_27_0[1]
				local reloaded_27_11 = arg_27_0[2]
				local reloaded_27_12 = arg_27_0[3]
				local reloaded_27_13 = arg_27_0[4]
				local reloaded_27_14 = arg_27_0[5]
				local reloaded_27_15 = arg_27_0[6]
				local reloaded_27_16 = arg_27_0[7]
				local reloaded_27_17 = arg_27_0[8]

				for iter_27_3 = 0, 79, 8 do
					local reloaded_27_18 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 1] + reloaded_27_0[iter_27_3]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_18 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_18

					local reloaded_27_19 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 2] + reloaded_27_0[iter_27_3 + 1]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_19 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_19

					local reloaded_27_20 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 3] + reloaded_27_0[iter_27_3 + 2]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_20 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_20

					local reloaded_27_21 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 4] + reloaded_27_0[iter_27_3 + 3]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_21 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_21

					local reloaded_27_22 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 5] + reloaded_27_0[iter_27_3 + 4]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_22 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_22

					local reloaded_27_23 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 6] + reloaded_27_0[iter_27_3 + 5]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_23 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_23

					local reloaded_27_24 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 7] + reloaded_27_0[iter_27_3 + 6]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_24 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_24

					local reloaded_27_25 = reloaded_0_100(reloaded_27_14) + reloaded_0_102(reloaded_27_14, reloaded_27_15, reloaded_27_16) + reloaded_27_17 + reloaded_27_1[iter_27_3 + 8] + reloaded_27_0[iter_27_3 + 7]

					reloaded_27_17, reloaded_27_16, reloaded_27_15, reloaded_27_14 = reloaded_27_16, reloaded_27_15, reloaded_27_14, reloaded_27_25 + reloaded_27_13
					reloaded_27_13, reloaded_27_12, reloaded_27_11, reloaded_27_10 = reloaded_27_12, reloaded_27_11, reloaded_27_10, reloaded_0_103(reloaded_27_10, reloaded_27_11, reloaded_27_12) + reloaded_0_101(reloaded_27_10) + reloaded_27_25
				end

				arg_27_0[1] = reloaded_27_10 + arg_27_0[1]
				arg_27_0[2] = reloaded_27_11 + arg_27_0[2]
				arg_27_0[3] = reloaded_27_12 + arg_27_0[3]
				arg_27_0[4] = reloaded_27_13 + arg_27_0[4]
				arg_27_0[5] = reloaded_27_14 + arg_27_0[5]
				arg_27_0[6] = reloaded_27_15 + arg_27_0[6]
				arg_27_0[7] = reloaded_27_16 + arg_27_0[7]
				arg_27_0[8] = reloaded_27_17 + arg_27_0[8]
			end
		end

		local reloaded_0_109 = reloaded_0_27.new("int64_t[?]", 16)
		local reloaded_0_110 = reloaded_0_70

		local function reloaded_0_111(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4, arg_28_5)
			local reloaded_28_0 = reloaded_0_109[arg_28_0]
			local reloaded_28_1 = reloaded_0_109[arg_28_1]
			local reloaded_28_2 = reloaded_0_109[arg_28_2]
			local reloaded_28_3 = reloaded_0_109[arg_28_3]
			local reloaded_28_4 = reloaded_0_110[arg_28_4] + (reloaded_28_0 + reloaded_28_1)
			local reloaded_28_5 = reloaded_0_106(reloaded_28_3, reloaded_28_4)
			local reloaded_28_6 = reloaded_28_2 + reloaded_28_5
			local reloaded_28_7 = reloaded_0_104(reloaded_28_1, reloaded_28_6, 24)
			local reloaded_28_8 = reloaded_0_110[arg_28_5] + (reloaded_28_4 + reloaded_28_7)
			local reloaded_28_9 = reloaded_0_104(reloaded_28_5, reloaded_28_8, 16)
			local reloaded_28_10 = reloaded_28_6 + reloaded_28_9
			local reloaded_28_11 = reloaded_0_105(reloaded_28_7, reloaded_28_10)

			reloaded_0_109[arg_28_0], reloaded_0_109[arg_28_1], reloaded_0_109[arg_28_2], reloaded_0_109[arg_28_3] = reloaded_28_8, reloaded_28_11, reloaded_28_10, reloaded_28_9
		end

		function reloaded_0_54(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4, arg_29_5, arg_29_6, arg_29_7)
			local reloaded_29_0 = arg_29_0[1]
			local reloaded_29_1 = arg_29_0[2]
			local reloaded_29_2 = arg_29_0[3]
			local reloaded_29_3 = arg_29_0[4]
			local reloaded_29_4 = arg_29_0[5]
			local reloaded_29_5 = arg_29_0[6]
			local reloaded_29_6 = arg_29_0[7]
			local reloaded_29_7 = arg_29_0[8]

			for iter_29_0 = arg_29_3, arg_29_3 + arg_29_4 - 1, 128 do
				if arg_29_2 then
					for iter_29_1 = 1, 16 do
						iter_29_0 = iter_29_0 + 8

						local reloaded_29_8, reloaded_29_9, reloaded_29_10, reloaded_29_11, reloaded_29_12, reloaded_29_13, reloaded_29_14, reloaded_29_15 = reloaded_0_3(arg_29_2, iter_29_0 - 7, iter_29_0)

						reloaded_0_110[iter_29_1] = reloaded_0_107(reloaded_0_36(reloaded_0_38(reloaded_29_15, 24), reloaded_0_38(reloaded_29_14, 16), reloaded_0_38(reloaded_29_13, 8), reloaded_29_12) * reloaded_0_81(4294967296), reloaded_0_83(reloaded_0_82(reloaded_0_36(reloaded_0_38(reloaded_29_11, 24), reloaded_0_38(reloaded_29_10, 16), reloaded_0_38(reloaded_29_9, 8), reloaded_29_8))))
					end
				end

				reloaded_0_109[0], reloaded_0_109[1], reloaded_0_109[2], reloaded_0_109[3], reloaded_0_109[4], reloaded_0_109[5], reloaded_0_109[6], reloaded_0_109[7] = reloaded_29_0, reloaded_29_1, reloaded_29_2, reloaded_29_3, reloaded_29_4, reloaded_29_5, reloaded_29_6, reloaded_29_7
				reloaded_0_109[8], reloaded_0_109[9], reloaded_0_109[10], reloaded_0_109[11], reloaded_0_109[13], reloaded_0_109[14], reloaded_0_109[15] = reloaded_0_58[1], reloaded_0_58[2], reloaded_0_58[3], reloaded_0_58[4], reloaded_0_58[6], reloaded_0_58[7], reloaded_0_58[8]
				arg_29_5 = arg_29_5 + (arg_29_6 or 128)
				reloaded_0_109[12] = reloaded_0_107(reloaded_0_58[5], arg_29_5)

				if arg_29_6 then
					reloaded_0_109[14] = -1 - reloaded_0_109[14]
				end

				if arg_29_7 then
					reloaded_0_109[15] = -1 - reloaded_0_109[15]
				end

				for iter_29_2 = 1, 12 do
					local reloaded_29_16 = reloaded_0_76[iter_29_2]

					reloaded_0_111(0, 4, 8, 12, reloaded_29_16[1], reloaded_29_16[2])
					reloaded_0_111(1, 5, 9, 13, reloaded_29_16[3], reloaded_29_16[4])
					reloaded_0_111(2, 6, 10, 14, reloaded_29_16[5], reloaded_29_16[6])
					reloaded_0_111(3, 7, 11, 15, reloaded_29_16[7], reloaded_29_16[8])
					reloaded_0_111(0, 5, 10, 15, reloaded_29_16[9], reloaded_29_16[10])
					reloaded_0_111(1, 6, 11, 12, reloaded_29_16[11], reloaded_29_16[12])
					reloaded_0_111(2, 7, 8, 13, reloaded_29_16[13], reloaded_29_16[14])
					reloaded_0_111(3, 4, 9, 14, reloaded_29_16[15], reloaded_29_16[16])
				end

				reloaded_29_0 = reloaded_0_108(reloaded_29_0, reloaded_0_109[0], reloaded_0_109[8])
				reloaded_29_1 = reloaded_0_108(reloaded_29_1, reloaded_0_109[1], reloaded_0_109[9])
				reloaded_29_2 = reloaded_0_108(reloaded_29_2, reloaded_0_109[2], reloaded_0_109[10])
				reloaded_29_3 = reloaded_0_108(reloaded_29_3, reloaded_0_109[3], reloaded_0_109[11])
				reloaded_29_4 = reloaded_0_108(reloaded_29_4, reloaded_0_109[4], reloaded_0_109[12])
				reloaded_29_5 = reloaded_0_108(reloaded_29_5, reloaded_0_109[5], reloaded_0_109[13])
				reloaded_29_6 = reloaded_0_108(reloaded_29_6, reloaded_0_109[6], reloaded_0_109[14])
				reloaded_29_7 = reloaded_0_108(reloaded_29_7, reloaded_0_109[7], reloaded_0_109[15])
			end

			arg_29_0[1], arg_29_0[2], arg_29_0[3], arg_29_0[4], arg_29_0[5], arg_29_0[6], arg_29_0[7], arg_29_0[8] = reloaded_29_0, reloaded_29_1, reloaded_29_2, reloaded_29_3, reloaded_29_4, reloaded_29_5, reloaded_29_6, reloaded_29_7

			return arg_29_5
		end
	end

	function reloaded_0_50(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
		local reloaded_30_0 = reloaded_0_79
		local reloaded_30_1 = reloaded_0_65

		for iter_30_0 = arg_30_2, arg_30_2 + arg_30_3 - 1, 64 do
			for iter_30_1 = 0, 15 do
				iter_30_0 = iter_30_0 + 4

				local reloaded_30_2, reloaded_30_3, reloaded_30_4, reloaded_30_5 = reloaded_0_3(arg_30_1, iter_30_0 - 3, iter_30_0)

				reloaded_30_0[iter_30_1] = reloaded_0_36(reloaded_0_38(reloaded_30_5, 24), reloaded_0_38(reloaded_30_4, 16), reloaded_0_38(reloaded_30_3, 8), reloaded_30_2)
			end

			local reloaded_30_6 = arg_30_0[1]
			local reloaded_30_7 = arg_30_0[2]
			local reloaded_30_8 = arg_30_0[3]
			local reloaded_30_9 = arg_30_0[4]

			for iter_30_2 = 0, 15, 4 do
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_9, reloaded_0_35(reloaded_30_7, reloaded_0_37(reloaded_30_8, reloaded_30_9))) + (reloaded_30_1[iter_30_2 + 1] + reloaded_30_0[iter_30_2] + reloaded_30_6), 7) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_9, reloaded_0_35(reloaded_30_7, reloaded_0_37(reloaded_30_8, reloaded_30_9))) + (reloaded_30_1[iter_30_2 + 2] + reloaded_30_0[iter_30_2 + 1] + reloaded_30_6), 12) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_9, reloaded_0_35(reloaded_30_7, reloaded_0_37(reloaded_30_8, reloaded_30_9))) + (reloaded_30_1[iter_30_2 + 3] + reloaded_30_0[iter_30_2 + 2] + reloaded_30_6), 17) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_9, reloaded_0_35(reloaded_30_7, reloaded_0_37(reloaded_30_8, reloaded_30_9))) + (reloaded_30_1[iter_30_2 + 4] + reloaded_30_0[iter_30_2 + 3] + reloaded_30_6), 22) + reloaded_30_7)
			end

			for iter_30_3 = 16, 31, 4 do
				local reloaded_30_10 = 5 * iter_30_3

				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_35(reloaded_30_9, reloaded_0_37(reloaded_30_7, reloaded_30_8))) + (reloaded_30_1[iter_30_3 + 1] + reloaded_30_0[reloaded_0_35(reloaded_30_10 + 1, 15)] + reloaded_30_6), 5) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_35(reloaded_30_9, reloaded_0_37(reloaded_30_7, reloaded_30_8))) + (reloaded_30_1[iter_30_3 + 2] + reloaded_30_0[reloaded_0_35(reloaded_30_10 + 6, 15)] + reloaded_30_6), 9) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_35(reloaded_30_9, reloaded_0_37(reloaded_30_7, reloaded_30_8))) + (reloaded_30_1[iter_30_3 + 3] + reloaded_30_0[reloaded_0_35(reloaded_30_10 - 5, 15)] + reloaded_30_6), 14) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_35(reloaded_30_9, reloaded_0_37(reloaded_30_7, reloaded_30_8))) + (reloaded_30_1[iter_30_3 + 4] + reloaded_30_0[reloaded_0_35(reloaded_30_10, 15)] + reloaded_30_6), 20) + reloaded_30_7)
			end

			for iter_30_4 = 32, 47, 4 do
				local reloaded_30_11 = 3 * iter_30_4

				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_7, reloaded_30_8, reloaded_30_9) + (reloaded_30_1[iter_30_4 + 1] + reloaded_30_0[reloaded_0_35(reloaded_30_11 + 5, 15)] + reloaded_30_6), 4) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_7, reloaded_30_8, reloaded_30_9) + (reloaded_30_1[iter_30_4 + 2] + reloaded_30_0[reloaded_0_35(reloaded_30_11 + 8, 15)] + reloaded_30_6), 11) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_7, reloaded_30_8, reloaded_30_9) + (reloaded_30_1[iter_30_4 + 3] + reloaded_30_0[reloaded_0_35(reloaded_30_11 - 5, 15)] + reloaded_30_6), 16) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_7, reloaded_30_8, reloaded_30_9) + (reloaded_30_1[iter_30_4 + 4] + reloaded_30_0[reloaded_0_35(reloaded_30_11 - 2, 15)] + reloaded_30_6), 23) + reloaded_30_7)
			end

			for iter_30_5 = 48, 63, 4 do
				local reloaded_30_12 = 7 * iter_30_5

				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_36(reloaded_30_7, reloaded_0_42(reloaded_30_9))) + (reloaded_30_1[iter_30_5 + 1] + reloaded_30_0[reloaded_0_35(reloaded_30_12, 15)] + reloaded_30_6), 6) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_36(reloaded_30_7, reloaded_0_42(reloaded_30_9))) + (reloaded_30_1[iter_30_5 + 2] + reloaded_30_0[reloaded_0_35(reloaded_30_12 + 7, 15)] + reloaded_30_6), 10) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_36(reloaded_30_7, reloaded_0_42(reloaded_30_9))) + (reloaded_30_1[iter_30_5 + 3] + reloaded_30_0[reloaded_0_35(reloaded_30_12 - 2, 15)] + reloaded_30_6), 15) + reloaded_30_7)
				reloaded_30_6, reloaded_30_9, reloaded_30_8, reloaded_30_7 = reloaded_30_9, reloaded_30_8, reloaded_30_7, reloaded_0_43(reloaded_0_40(reloaded_0_37(reloaded_30_8, reloaded_0_36(reloaded_30_7, reloaded_0_42(reloaded_30_9))) + (reloaded_30_1[iter_30_5 + 4] + reloaded_30_0[reloaded_0_35(reloaded_30_12 + 5, 15)] + reloaded_30_6), 21) + reloaded_30_7)
			end

			arg_30_0[1], arg_30_0[2], arg_30_0[3], arg_30_0[4] = reloaded_0_43(reloaded_30_6 + arg_30_0[1]), reloaded_0_43(reloaded_30_7 + arg_30_0[2]), reloaded_0_43(reloaded_30_8 + arg_30_0[3]), reloaded_0_43(reloaded_30_9 + arg_30_0[4])
		end
	end

	function reloaded_0_51(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
		local reloaded_31_0 = reloaded_0_79

		for iter_31_0 = arg_31_2, arg_31_2 + arg_31_3 - 1, 64 do
			for iter_31_1 = 0, 15 do
				iter_31_0 = iter_31_0 + 4

				local reloaded_31_1, reloaded_31_2, reloaded_31_3, reloaded_31_4 = reloaded_0_3(arg_31_1, iter_31_0 - 3, iter_31_0)

				reloaded_31_0[iter_31_1] = reloaded_0_36(reloaded_0_38(reloaded_31_1, 24), reloaded_0_38(reloaded_31_2, 16), reloaded_0_38(reloaded_31_3, 8), reloaded_31_4)
			end

			for iter_31_2 = 16, 79 do
				reloaded_31_0[iter_31_2] = reloaded_0_40(reloaded_0_37(reloaded_31_0[iter_31_2 - 3], reloaded_31_0[iter_31_2 - 8], reloaded_31_0[iter_31_2 - 14], reloaded_31_0[iter_31_2 - 16]), 1)
			end

			local reloaded_31_5 = arg_31_0[1]
			local reloaded_31_6 = arg_31_0[2]
			local reloaded_31_7 = arg_31_0[3]
			local reloaded_31_8 = arg_31_0[4]
			local reloaded_31_9 = arg_31_0[5]

			for iter_31_3 = 0, 19, 5 do
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_8, reloaded_0_35(reloaded_31_6, reloaded_0_37(reloaded_31_8, reloaded_31_7))) + (reloaded_31_0[iter_31_3] + 1518500249 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_8, reloaded_0_35(reloaded_31_6, reloaded_0_37(reloaded_31_8, reloaded_31_7))) + (reloaded_31_0[iter_31_3 + 1] + 1518500249 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_8, reloaded_0_35(reloaded_31_6, reloaded_0_37(reloaded_31_8, reloaded_31_7))) + (reloaded_31_0[iter_31_3 + 2] + 1518500249 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_8, reloaded_0_35(reloaded_31_6, reloaded_0_37(reloaded_31_8, reloaded_31_7))) + (reloaded_31_0[iter_31_3 + 3] + 1518500249 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_8, reloaded_0_35(reloaded_31_6, reloaded_0_37(reloaded_31_8, reloaded_31_7))) + (reloaded_31_0[iter_31_3 + 4] + 1518500249 + reloaded_31_9))
			end

			for iter_31_4 = 20, 39, 5 do
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_4] + 1859775393 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_4 + 1] + 1859775393 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_4 + 2] + 1859775393 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_4 + 3] + 1859775393 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_4 + 4] + 1859775393 + reloaded_31_9))
			end

			for iter_31_5 = 40, 59, 5 do
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_0_35(reloaded_31_8, reloaded_0_37(reloaded_31_6, reloaded_31_7)), reloaded_0_35(reloaded_31_6, reloaded_31_7)) + (reloaded_31_0[iter_31_5] + 2400959708 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_0_35(reloaded_31_8, reloaded_0_37(reloaded_31_6, reloaded_31_7)), reloaded_0_35(reloaded_31_6, reloaded_31_7)) + (reloaded_31_0[iter_31_5 + 1] + 2400959708 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_0_35(reloaded_31_8, reloaded_0_37(reloaded_31_6, reloaded_31_7)), reloaded_0_35(reloaded_31_6, reloaded_31_7)) + (reloaded_31_0[iter_31_5 + 2] + 2400959708 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_0_35(reloaded_31_8, reloaded_0_37(reloaded_31_6, reloaded_31_7)), reloaded_0_35(reloaded_31_6, reloaded_31_7)) + (reloaded_31_0[iter_31_5 + 3] + 2400959708 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_0_35(reloaded_31_8, reloaded_0_37(reloaded_31_6, reloaded_31_7)), reloaded_0_35(reloaded_31_6, reloaded_31_7)) + (reloaded_31_0[iter_31_5 + 4] + 2400959708 + reloaded_31_9))
			end

			for iter_31_6 = 60, 79, 5 do
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_6] + 3395469782 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_6 + 1] + 3395469782 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_6 + 2] + 3395469782 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_6 + 3] + 3395469782 + reloaded_31_9))
				reloaded_31_9, reloaded_31_8, reloaded_31_7, reloaded_31_6, reloaded_31_5 = reloaded_31_8, reloaded_31_7, reloaded_0_41(reloaded_31_6, 2), reloaded_31_5, reloaded_0_43(reloaded_0_40(reloaded_31_5, 5) + reloaded_0_37(reloaded_31_6, reloaded_31_7, reloaded_31_8) + (reloaded_31_0[iter_31_6 + 4] + 3395469782 + reloaded_31_9))
			end

			arg_31_0[1], arg_31_0[2], arg_31_0[3], arg_31_0[4], arg_31_0[5] = reloaded_0_43(reloaded_31_5 + arg_31_0[1]), reloaded_0_43(reloaded_31_6 + arg_31_0[2]), reloaded_0_43(reloaded_31_7 + arg_31_0[3]), reloaded_0_43(reloaded_31_8 + arg_31_0[4]), reloaded_0_43(reloaded_31_9 + arg_31_0[5])
		end
	end
end

if reloaded_0_34 == "FFI" and not reloaded_0_25 or reloaded_0_34 == "LJ" then
	if reloaded_0_34 == "FFI" then
		local reloaded_0_112 = reloaded_0_27.typeof("int32_t[?]")

		function reloaded_0_47()
			return reloaded_0_112(31)
		end
	end

	function reloaded_0_52(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4, arg_33_5)
		local reloaded_33_0 = reloaded_0_60
		local reloaded_33_1 = reloaded_0_61
		local reloaded_33_2 = reloaded_0_39(arg_33_5, 3)

		for iter_33_0 = arg_33_3, arg_33_3 + arg_33_4 - 1, arg_33_5 do
			for iter_33_1 = 1, reloaded_33_2 do
				local reloaded_33_3, reloaded_33_4, reloaded_33_5, reloaded_33_6 = reloaded_0_3(arg_33_2, iter_33_0 + 1, iter_33_0 + 4)

				arg_33_0[iter_33_1] = reloaded_0_37(arg_33_0[iter_33_1], reloaded_0_36(reloaded_0_38(reloaded_33_6, 24), reloaded_0_38(reloaded_33_5, 16), reloaded_0_38(reloaded_33_4, 8), reloaded_33_3))
				iter_33_0 = iter_33_0 + 8

				local reloaded_33_7, reloaded_33_8, reloaded_33_9, reloaded_33_10 = reloaded_0_3(arg_33_2, iter_33_0 - 3, iter_33_0)

				arg_33_1[iter_33_1] = reloaded_0_37(arg_33_1[iter_33_1], reloaded_0_36(reloaded_0_38(reloaded_33_10, 24), reloaded_0_38(reloaded_33_9, 16), reloaded_0_38(reloaded_33_8, 8), reloaded_33_7))
			end

			for iter_33_2 = 1, 24 do
				for iter_33_3 = 1, 5 do
					arg_33_0[25 + iter_33_3] = reloaded_0_37(arg_33_0[iter_33_3], arg_33_0[iter_33_3 + 5], arg_33_0[iter_33_3 + 10], arg_33_0[iter_33_3 + 15], arg_33_0[iter_33_3 + 20])
				end

				for iter_33_4 = 1, 5 do
					arg_33_1[25 + iter_33_4] = reloaded_0_37(arg_33_1[iter_33_4], arg_33_1[iter_33_4 + 5], arg_33_1[iter_33_4 + 10], arg_33_1[iter_33_4 + 15], arg_33_1[iter_33_4 + 20])
				end

				local reloaded_33_11 = reloaded_0_37(arg_33_0[26], reloaded_0_38(arg_33_0[28], 1), reloaded_0_39(arg_33_1[28], 31))
				local reloaded_33_12 = reloaded_0_37(arg_33_1[26], reloaded_0_38(arg_33_1[28], 1), reloaded_0_39(arg_33_0[28], 31))

				arg_33_0[2], arg_33_1[2], arg_33_0[7], arg_33_1[7], arg_33_0[12], arg_33_1[12], arg_33_0[17], arg_33_1[17] = reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_11, arg_33_0[7]), 20), reloaded_0_38(reloaded_0_37(reloaded_33_12, arg_33_1[7]), 12)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_12, arg_33_1[7]), 20), reloaded_0_38(reloaded_0_37(reloaded_33_11, arg_33_0[7]), 12)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_11, arg_33_0[17]), 19), reloaded_0_38(reloaded_0_37(reloaded_33_12, arg_33_1[17]), 13)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_12, arg_33_1[17]), 19), reloaded_0_38(reloaded_0_37(reloaded_33_11, arg_33_0[17]), 13)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_11, arg_33_0[2]), 1), reloaded_0_39(reloaded_0_37(reloaded_33_12, arg_33_1[2]), 31)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_12, arg_33_1[2]), 1), reloaded_0_39(reloaded_0_37(reloaded_33_11, arg_33_0[2]), 31)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_11, arg_33_0[12]), 10), reloaded_0_39(reloaded_0_37(reloaded_33_12, arg_33_1[12]), 22)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_12, arg_33_1[12]), 10), reloaded_0_39(reloaded_0_37(reloaded_33_11, arg_33_0[12]), 22))

				local reloaded_33_13 = reloaded_0_37(reloaded_33_11, arg_33_0[22])
				local reloaded_33_14 = reloaded_0_37(reloaded_33_12, arg_33_1[22])

				arg_33_0[22], arg_33_1[22] = reloaded_0_37(reloaded_0_38(reloaded_33_13, 2), reloaded_0_39(reloaded_33_14, 30)), reloaded_0_37(reloaded_0_38(reloaded_33_14, 2), reloaded_0_39(reloaded_33_13, 30))

				local reloaded_33_15 = reloaded_0_37(arg_33_0[27], reloaded_0_38(arg_33_0[29], 1), reloaded_0_39(arg_33_1[29], 31))
				local reloaded_33_16 = reloaded_0_37(arg_33_1[27], reloaded_0_38(arg_33_1[29], 1), reloaded_0_39(arg_33_0[29], 31))

				arg_33_0[3], arg_33_1[3], arg_33_0[8], arg_33_1[8], arg_33_0[13], arg_33_1[13], arg_33_0[23], arg_33_1[23] = reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_15, arg_33_0[13]), 21), reloaded_0_38(reloaded_0_37(reloaded_33_16, arg_33_1[13]), 11)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_16, arg_33_1[13]), 21), reloaded_0_38(reloaded_0_37(reloaded_33_15, arg_33_0[13]), 11)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_15, arg_33_0[23]), 3), reloaded_0_38(reloaded_0_37(reloaded_33_16, arg_33_1[23]), 29)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_16, arg_33_1[23]), 3), reloaded_0_38(reloaded_0_37(reloaded_33_15, arg_33_0[23]), 29)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_15, arg_33_0[8]), 6), reloaded_0_39(reloaded_0_37(reloaded_33_16, arg_33_1[8]), 26)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_16, arg_33_1[8]), 6), reloaded_0_39(reloaded_0_37(reloaded_33_15, arg_33_0[8]), 26)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_15, arg_33_0[3]), 2), reloaded_0_38(reloaded_0_37(reloaded_33_16, arg_33_1[3]), 30)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_16, arg_33_1[3]), 2), reloaded_0_38(reloaded_0_37(reloaded_33_15, arg_33_0[3]), 30))

				local reloaded_33_17, reloaded_33_18 = reloaded_0_37(reloaded_33_15, arg_33_0[18]), reloaded_0_37(reloaded_33_16, arg_33_1[18])

				arg_33_0[18], arg_33_1[18] = reloaded_0_37(reloaded_0_38(reloaded_33_17, 15), reloaded_0_39(reloaded_33_18, 17)), reloaded_0_37(reloaded_0_38(reloaded_33_18, 15), reloaded_0_39(reloaded_33_17, 17))

				local reloaded_33_19 = reloaded_0_37(arg_33_0[28], reloaded_0_38(arg_33_0[30], 1), reloaded_0_39(arg_33_1[30], 31))
				local reloaded_33_20 = reloaded_0_37(arg_33_1[28], reloaded_0_38(arg_33_1[30], 1), reloaded_0_39(arg_33_0[30], 31))

				arg_33_0[4], arg_33_1[4], arg_33_0[9], arg_33_1[9], arg_33_0[19], arg_33_1[19], arg_33_0[24], arg_33_1[24] = reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_19, arg_33_0[19]), 21), reloaded_0_39(reloaded_0_37(reloaded_33_20, arg_33_1[19]), 11)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_20, arg_33_1[19]), 21), reloaded_0_39(reloaded_0_37(reloaded_33_19, arg_33_0[19]), 11)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_19, arg_33_0[4]), 28), reloaded_0_39(reloaded_0_37(reloaded_33_20, arg_33_1[4]), 4)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_20, arg_33_1[4]), 28), reloaded_0_39(reloaded_0_37(reloaded_33_19, arg_33_0[4]), 4)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_19, arg_33_0[24]), 8), reloaded_0_38(reloaded_0_37(reloaded_33_20, arg_33_1[24]), 24)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_20, arg_33_1[24]), 8), reloaded_0_38(reloaded_0_37(reloaded_33_19, arg_33_0[24]), 24)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_19, arg_33_0[9]), 9), reloaded_0_38(reloaded_0_37(reloaded_33_20, arg_33_1[9]), 23)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_20, arg_33_1[9]), 9), reloaded_0_38(reloaded_0_37(reloaded_33_19, arg_33_0[9]), 23))

				local reloaded_33_21, reloaded_33_22 = reloaded_0_37(reloaded_33_19, arg_33_0[14]), reloaded_0_37(reloaded_33_20, arg_33_1[14])

				arg_33_0[14], arg_33_1[14] = reloaded_0_37(reloaded_0_38(reloaded_33_21, 25), reloaded_0_39(reloaded_33_22, 7)), reloaded_0_37(reloaded_0_38(reloaded_33_22, 25), reloaded_0_39(reloaded_33_21, 7))

				local reloaded_33_23 = reloaded_0_37(arg_33_0[29], reloaded_0_38(arg_33_0[26], 1), reloaded_0_39(arg_33_1[26], 31))
				local reloaded_33_24 = reloaded_0_37(arg_33_1[29], reloaded_0_38(arg_33_1[26], 1), reloaded_0_39(arg_33_0[26], 31))

				arg_33_0[5], arg_33_1[5], arg_33_0[15], arg_33_1[15], arg_33_0[20], arg_33_1[20], arg_33_0[25], arg_33_1[25] = reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_23, arg_33_0[25]), 14), reloaded_0_39(reloaded_0_37(reloaded_33_24, arg_33_1[25]), 18)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_24, arg_33_1[25]), 14), reloaded_0_39(reloaded_0_37(reloaded_33_23, arg_33_0[25]), 18)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_23, arg_33_0[20]), 8), reloaded_0_39(reloaded_0_37(reloaded_33_24, arg_33_1[20]), 24)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_24, arg_33_1[20]), 8), reloaded_0_39(reloaded_0_37(reloaded_33_23, arg_33_0[20]), 24)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_23, arg_33_0[5]), 27), reloaded_0_39(reloaded_0_37(reloaded_33_24, arg_33_1[5]), 5)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_24, arg_33_1[5]), 27), reloaded_0_39(reloaded_0_37(reloaded_33_23, arg_33_0[5]), 5)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_23, arg_33_0[15]), 25), reloaded_0_38(reloaded_0_37(reloaded_33_24, arg_33_1[15]), 7)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_24, arg_33_1[15]), 25), reloaded_0_38(reloaded_0_37(reloaded_33_23, arg_33_0[15]), 7))

				local reloaded_33_25, reloaded_33_26 = reloaded_0_37(reloaded_33_23, arg_33_0[10]), reloaded_0_37(reloaded_33_24, arg_33_1[10])

				arg_33_0[10], arg_33_1[10] = reloaded_0_37(reloaded_0_38(reloaded_33_25, 20), reloaded_0_39(reloaded_33_26, 12)), reloaded_0_37(reloaded_0_38(reloaded_33_26, 20), reloaded_0_39(reloaded_33_25, 12))

				local reloaded_33_27 = reloaded_0_37(arg_33_0[30], reloaded_0_38(arg_33_0[27], 1), reloaded_0_39(arg_33_1[27], 31))
				local reloaded_33_28 = reloaded_0_37(arg_33_1[30], reloaded_0_38(arg_33_1[27], 1), reloaded_0_39(arg_33_0[27], 31))

				arg_33_0[6], arg_33_1[6], arg_33_0[11], arg_33_1[11], arg_33_0[16], arg_33_1[16], arg_33_0[21], arg_33_1[21] = reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_27, arg_33_0[11]), 3), reloaded_0_39(reloaded_0_37(reloaded_33_28, arg_33_1[11]), 29)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_28, arg_33_1[11]), 3), reloaded_0_39(reloaded_0_37(reloaded_33_27, arg_33_0[11]), 29)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_27, arg_33_0[21]), 18), reloaded_0_39(reloaded_0_37(reloaded_33_28, arg_33_1[21]), 14)), reloaded_0_37(reloaded_0_38(reloaded_0_37(reloaded_33_28, arg_33_1[21]), 18), reloaded_0_39(reloaded_0_37(reloaded_33_27, arg_33_0[21]), 14)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_27, arg_33_0[6]), 28), reloaded_0_38(reloaded_0_37(reloaded_33_28, arg_33_1[6]), 4)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_28, arg_33_1[6]), 28), reloaded_0_38(reloaded_0_37(reloaded_33_27, arg_33_0[6]), 4)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_27, arg_33_0[16]), 23), reloaded_0_38(reloaded_0_37(reloaded_33_28, arg_33_1[16]), 9)), reloaded_0_37(reloaded_0_39(reloaded_0_37(reloaded_33_28, arg_33_1[16]), 23), reloaded_0_38(reloaded_0_37(reloaded_33_27, arg_33_0[16]), 9))
				arg_33_0[1], arg_33_1[1] = reloaded_0_37(reloaded_33_27, arg_33_0[1]), reloaded_0_37(reloaded_33_28, arg_33_1[1])
				arg_33_0[1], arg_33_0[2], arg_33_0[3], arg_33_0[4], arg_33_0[5] = reloaded_0_37(arg_33_0[1], reloaded_0_35(reloaded_0_42(arg_33_0[2]), arg_33_0[3]), reloaded_33_0[iter_33_2]), reloaded_0_37(arg_33_0[2], reloaded_0_35(reloaded_0_42(arg_33_0[3]), arg_33_0[4])), reloaded_0_37(arg_33_0[3], reloaded_0_35(reloaded_0_42(arg_33_0[4]), arg_33_0[5])), reloaded_0_37(arg_33_0[4], reloaded_0_35(reloaded_0_42(arg_33_0[5]), arg_33_0[1])), reloaded_0_37(arg_33_0[5], reloaded_0_35(reloaded_0_42(arg_33_0[1]), arg_33_0[2]))
				arg_33_0[6], arg_33_0[7], arg_33_0[8], arg_33_0[9], arg_33_0[10] = reloaded_0_37(arg_33_0[9], reloaded_0_35(reloaded_0_42(arg_33_0[10]), arg_33_0[6])), reloaded_0_37(arg_33_0[10], reloaded_0_35(reloaded_0_42(arg_33_0[6]), arg_33_0[7])), reloaded_0_37(arg_33_0[6], reloaded_0_35(reloaded_0_42(arg_33_0[7]), arg_33_0[8])), reloaded_0_37(arg_33_0[7], reloaded_0_35(reloaded_0_42(arg_33_0[8]), arg_33_0[9])), reloaded_0_37(arg_33_0[8], reloaded_0_35(reloaded_0_42(arg_33_0[9]), arg_33_0[10]))
				arg_33_0[11], arg_33_0[12], arg_33_0[13], arg_33_0[14], arg_33_0[15] = reloaded_0_37(arg_33_0[12], reloaded_0_35(reloaded_0_42(arg_33_0[13]), arg_33_0[14])), reloaded_0_37(arg_33_0[13], reloaded_0_35(reloaded_0_42(arg_33_0[14]), arg_33_0[15])), reloaded_0_37(arg_33_0[14], reloaded_0_35(reloaded_0_42(arg_33_0[15]), arg_33_0[11])), reloaded_0_37(arg_33_0[15], reloaded_0_35(reloaded_0_42(arg_33_0[11]), arg_33_0[12])), reloaded_0_37(arg_33_0[11], reloaded_0_35(reloaded_0_42(arg_33_0[12]), arg_33_0[13]))
				arg_33_0[16], arg_33_0[17], arg_33_0[18], arg_33_0[19], arg_33_0[20] = reloaded_0_37(arg_33_0[20], reloaded_0_35(reloaded_0_42(arg_33_0[16]), arg_33_0[17])), reloaded_0_37(arg_33_0[16], reloaded_0_35(reloaded_0_42(arg_33_0[17]), arg_33_0[18])), reloaded_0_37(arg_33_0[17], reloaded_0_35(reloaded_0_42(arg_33_0[18]), arg_33_0[19])), reloaded_0_37(arg_33_0[18], reloaded_0_35(reloaded_0_42(arg_33_0[19]), arg_33_0[20])), reloaded_0_37(arg_33_0[19], reloaded_0_35(reloaded_0_42(arg_33_0[20]), arg_33_0[16]))
				arg_33_0[21], arg_33_0[22], arg_33_0[23], arg_33_0[24], arg_33_0[25] = reloaded_0_37(arg_33_0[23], reloaded_0_35(reloaded_0_42(arg_33_0[24]), arg_33_0[25])), reloaded_0_37(arg_33_0[24], reloaded_0_35(reloaded_0_42(arg_33_0[25]), arg_33_0[21])), reloaded_0_37(arg_33_0[25], reloaded_0_35(reloaded_0_42(arg_33_0[21]), arg_33_0[22])), reloaded_0_37(arg_33_0[21], reloaded_0_35(reloaded_0_42(arg_33_0[22]), arg_33_0[23])), reloaded_0_37(arg_33_0[22], reloaded_0_35(reloaded_0_42(arg_33_0[23]), arg_33_0[24]))
				arg_33_1[1], arg_33_1[2], arg_33_1[3], arg_33_1[4], arg_33_1[5] = reloaded_0_37(arg_33_1[1], reloaded_0_35(reloaded_0_42(arg_33_1[2]), arg_33_1[3]), reloaded_33_1[iter_33_2]), reloaded_0_37(arg_33_1[2], reloaded_0_35(reloaded_0_42(arg_33_1[3]), arg_33_1[4])), reloaded_0_37(arg_33_1[3], reloaded_0_35(reloaded_0_42(arg_33_1[4]), arg_33_1[5])), reloaded_0_37(arg_33_1[4], reloaded_0_35(reloaded_0_42(arg_33_1[5]), arg_33_1[1])), reloaded_0_37(arg_33_1[5], reloaded_0_35(reloaded_0_42(arg_33_1[1]), arg_33_1[2]))
				arg_33_1[6], arg_33_1[7], arg_33_1[8], arg_33_1[9], arg_33_1[10] = reloaded_0_37(arg_33_1[9], reloaded_0_35(reloaded_0_42(arg_33_1[10]), arg_33_1[6])), reloaded_0_37(arg_33_1[10], reloaded_0_35(reloaded_0_42(arg_33_1[6]), arg_33_1[7])), reloaded_0_37(arg_33_1[6], reloaded_0_35(reloaded_0_42(arg_33_1[7]), arg_33_1[8])), reloaded_0_37(arg_33_1[7], reloaded_0_35(reloaded_0_42(arg_33_1[8]), arg_33_1[9])), reloaded_0_37(arg_33_1[8], reloaded_0_35(reloaded_0_42(arg_33_1[9]), arg_33_1[10]))
				arg_33_1[11], arg_33_1[12], arg_33_1[13], arg_33_1[14], arg_33_1[15] = reloaded_0_37(arg_33_1[12], reloaded_0_35(reloaded_0_42(arg_33_1[13]), arg_33_1[14])), reloaded_0_37(arg_33_1[13], reloaded_0_35(reloaded_0_42(arg_33_1[14]), arg_33_1[15])), reloaded_0_37(arg_33_1[14], reloaded_0_35(reloaded_0_42(arg_33_1[15]), arg_33_1[11])), reloaded_0_37(arg_33_1[15], reloaded_0_35(reloaded_0_42(arg_33_1[11]), arg_33_1[12])), reloaded_0_37(arg_33_1[11], reloaded_0_35(reloaded_0_42(arg_33_1[12]), arg_33_1[13]))
				arg_33_1[16], arg_33_1[17], arg_33_1[18], arg_33_1[19], arg_33_1[20] = reloaded_0_37(arg_33_1[20], reloaded_0_35(reloaded_0_42(arg_33_1[16]), arg_33_1[17])), reloaded_0_37(arg_33_1[16], reloaded_0_35(reloaded_0_42(arg_33_1[17]), arg_33_1[18])), reloaded_0_37(arg_33_1[17], reloaded_0_35(reloaded_0_42(arg_33_1[18]), arg_33_1[19])), reloaded_0_37(arg_33_1[18], reloaded_0_35(reloaded_0_42(arg_33_1[19]), arg_33_1[20])), reloaded_0_37(arg_33_1[19], reloaded_0_35(reloaded_0_42(arg_33_1[20]), arg_33_1[16]))
				arg_33_1[21], arg_33_1[22], arg_33_1[23], arg_33_1[24], arg_33_1[25] = reloaded_0_37(arg_33_1[23], reloaded_0_35(reloaded_0_42(arg_33_1[24]), arg_33_1[25])), reloaded_0_37(arg_33_1[24], reloaded_0_35(reloaded_0_42(arg_33_1[25]), arg_33_1[21])), reloaded_0_37(arg_33_1[25], reloaded_0_35(reloaded_0_42(arg_33_1[21]), arg_33_1[22])), reloaded_0_37(arg_33_1[21], reloaded_0_35(reloaded_0_42(arg_33_1[22]), arg_33_1[23])), reloaded_0_37(arg_33_1[22], reloaded_0_35(reloaded_0_42(arg_33_1[23]), arg_33_1[24]))
			end
		end
	end
end

if reloaded_0_34 == "FFI" or reloaded_0_34 == "LJ" then
	local reloaded_0_113 = reloaded_0_71
	local reloaded_0_114 = reloaded_0_72

	local function reloaded_0_115(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4, arg_34_5)
		local reloaded_34_0 = reloaded_0_114[arg_34_0]
		local reloaded_34_1 = reloaded_0_114[arg_34_1]
		local reloaded_34_2 = reloaded_0_114[arg_34_2]
		local reloaded_34_3 = reloaded_0_114[arg_34_3]
		local reloaded_34_4 = reloaded_0_43(reloaded_0_113[arg_34_4] + (reloaded_34_0 + reloaded_34_1))
		local reloaded_34_5 = reloaded_0_41(reloaded_0_37(reloaded_34_3, reloaded_34_4), 16)
		local reloaded_34_6 = reloaded_0_43(reloaded_34_2 + reloaded_34_5)
		local reloaded_34_7 = reloaded_0_41(reloaded_0_37(reloaded_34_1, reloaded_34_6), 12)
		local reloaded_34_8 = reloaded_0_43(reloaded_0_113[arg_34_5] + (reloaded_34_4 + reloaded_34_7))
		local reloaded_34_9 = reloaded_0_41(reloaded_0_37(reloaded_34_5, reloaded_34_8), 8)
		local reloaded_34_10 = reloaded_0_43(reloaded_34_6 + reloaded_34_9)
		local reloaded_34_11 = reloaded_0_41(reloaded_0_37(reloaded_34_7, reloaded_34_10), 7)

		reloaded_0_114[arg_34_0], reloaded_0_114[arg_34_1], reloaded_0_114[arg_34_2], reloaded_0_114[arg_34_3] = reloaded_34_8, reloaded_34_11, reloaded_34_10, reloaded_34_9
	end

	function reloaded_0_53(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4, arg_35_5, arg_35_6)
		local reloaded_35_0 = reloaded_0_43(arg_35_0[1])
		local reloaded_35_1 = reloaded_0_43(arg_35_0[2])
		local reloaded_35_2 = reloaded_0_43(arg_35_0[3])
		local reloaded_35_3 = reloaded_0_43(arg_35_0[4])
		local reloaded_35_4 = reloaded_0_43(arg_35_0[5])
		local reloaded_35_5 = reloaded_0_43(arg_35_0[6])
		local reloaded_35_6 = reloaded_0_43(arg_35_0[7])
		local reloaded_35_7 = reloaded_0_43(arg_35_0[8])

		for iter_35_0 = arg_35_2, arg_35_2 + arg_35_3 - 1, 64 do
			if arg_35_1 then
				for iter_35_1 = 1, 16 do
					iter_35_0 = iter_35_0 + 4

					local reloaded_35_8, reloaded_35_9, reloaded_35_10, reloaded_35_11 = reloaded_0_3(arg_35_1, iter_35_0 - 3, iter_35_0)

					reloaded_0_113[iter_35_1] = reloaded_0_36(reloaded_0_38(reloaded_35_11, 24), reloaded_0_38(reloaded_35_10, 16), reloaded_0_38(reloaded_35_9, 8), reloaded_35_8)
				end
			end

			reloaded_0_114[0], reloaded_0_114[1], reloaded_0_114[2], reloaded_0_114[3], reloaded_0_114[4], reloaded_0_114[5], reloaded_0_114[6], reloaded_0_114[7] = reloaded_35_0, reloaded_35_1, reloaded_35_2, reloaded_35_3, reloaded_35_4, reloaded_35_5, reloaded_35_6, reloaded_35_7
			reloaded_0_114[8], reloaded_0_114[9], reloaded_0_114[10], reloaded_0_114[11], reloaded_0_114[14], reloaded_0_114[15] = reloaded_0_43(reloaded_0_59[1]), reloaded_0_43(reloaded_0_59[2]), reloaded_0_43(reloaded_0_59[3]), reloaded_0_43(reloaded_0_59[4]), reloaded_0_43(reloaded_0_59[7]), reloaded_0_43(reloaded_0_59[8])
			arg_35_4 = arg_35_4 + (arg_35_5 or 64)

			local reloaded_35_12 = arg_35_4 % 4294967296
			local reloaded_35_13 = reloaded_0_10(arg_35_4 / 4294967296)

			reloaded_0_114[12] = reloaded_0_37(reloaded_0_59[5], reloaded_35_12)
			reloaded_0_114[13] = reloaded_0_37(reloaded_0_59[6], reloaded_35_13)

			if arg_35_5 then
				reloaded_0_114[14] = reloaded_0_42(reloaded_0_114[14])
			end

			if arg_35_6 then
				reloaded_0_114[15] = reloaded_0_42(reloaded_0_114[15])
			end

			for iter_35_2 = 1, 10 do
				local reloaded_35_14 = reloaded_0_76[iter_35_2]

				reloaded_0_115(0, 4, 8, 12, reloaded_35_14[1], reloaded_35_14[2])
				reloaded_0_115(1, 5, 9, 13, reloaded_35_14[3], reloaded_35_14[4])
				reloaded_0_115(2, 6, 10, 14, reloaded_35_14[5], reloaded_35_14[6])
				reloaded_0_115(3, 7, 11, 15, reloaded_35_14[7], reloaded_35_14[8])
				reloaded_0_115(0, 5, 10, 15, reloaded_35_14[9], reloaded_35_14[10])
				reloaded_0_115(1, 6, 11, 12, reloaded_35_14[11], reloaded_35_14[12])
				reloaded_0_115(2, 7, 8, 13, reloaded_35_14[13], reloaded_35_14[14])
				reloaded_0_115(3, 4, 9, 14, reloaded_35_14[15], reloaded_35_14[16])
			end

			reloaded_35_0 = reloaded_0_37(reloaded_35_0, reloaded_0_114[0], reloaded_0_114[8])
			reloaded_35_1 = reloaded_0_37(reloaded_35_1, reloaded_0_114[1], reloaded_0_114[9])
			reloaded_35_2 = reloaded_0_37(reloaded_35_2, reloaded_0_114[2], reloaded_0_114[10])
			reloaded_35_3 = reloaded_0_37(reloaded_35_3, reloaded_0_114[3], reloaded_0_114[11])
			reloaded_35_4 = reloaded_0_37(reloaded_35_4, reloaded_0_114[4], reloaded_0_114[12])
			reloaded_35_5 = reloaded_0_37(reloaded_35_5, reloaded_0_114[5], reloaded_0_114[13])
			reloaded_35_6 = reloaded_0_37(reloaded_35_6, reloaded_0_114[6], reloaded_0_114[14])
			reloaded_35_7 = reloaded_0_37(reloaded_35_7, reloaded_0_114[7], reloaded_0_114[15])
		end

		arg_35_0[1], arg_35_0[2], arg_35_0[3], arg_35_0[4], arg_35_0[5], arg_35_0[6], arg_35_0[7], arg_35_0[8] = reloaded_35_0, reloaded_35_1, reloaded_35_2, reloaded_35_3, reloaded_35_4, reloaded_35_5, reloaded_35_6, reloaded_35_7

		return arg_35_4
	end

	function reloaded_0_55(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7, arg_36_8)
		arg_36_8 = arg_36_8 or 64

		local reloaded_36_0 = reloaded_0_43(arg_36_5[1])
		local reloaded_36_1 = reloaded_0_43(arg_36_5[2])
		local reloaded_36_2 = reloaded_0_43(arg_36_5[3])
		local reloaded_36_3 = reloaded_0_43(arg_36_5[4])
		local reloaded_36_4 = reloaded_0_43(arg_36_5[5])
		local reloaded_36_5 = reloaded_0_43(arg_36_5[6])
		local reloaded_36_6 = reloaded_0_43(arg_36_5[7])
		local reloaded_36_7 = reloaded_0_43(arg_36_5[8])

		arg_36_6 = arg_36_6 or arg_36_5

		for iter_36_0 = arg_36_1, arg_36_1 + arg_36_2 - 1, 64 do
			if arg_36_0 then
				for iter_36_1 = 1, 16 do
					iter_36_0 = iter_36_0 + 4

					local reloaded_36_8, reloaded_36_9, reloaded_36_10, reloaded_36_11 = reloaded_0_3(arg_36_0, iter_36_0 - 3, iter_36_0)

					reloaded_0_113[iter_36_1] = reloaded_0_36(reloaded_0_38(reloaded_36_11, 24), reloaded_0_38(reloaded_36_10, 16), reloaded_0_38(reloaded_36_9, 8), reloaded_36_8)
				end
			end

			reloaded_0_114[0], reloaded_0_114[1], reloaded_0_114[2], reloaded_0_114[3], reloaded_0_114[4], reloaded_0_114[5], reloaded_0_114[6], reloaded_0_114[7] = reloaded_36_0, reloaded_36_1, reloaded_36_2, reloaded_36_3, reloaded_36_4, reloaded_36_5, reloaded_36_6, reloaded_36_7
			reloaded_0_114[8], reloaded_0_114[9], reloaded_0_114[10], reloaded_0_114[11] = reloaded_0_43(reloaded_0_59[1]), reloaded_0_43(reloaded_0_59[2]), reloaded_0_43(reloaded_0_59[3]), reloaded_0_43(reloaded_0_59[4])
			reloaded_0_114[12] = reloaded_0_43(arg_36_4 % 4294967296)
			reloaded_0_114[13] = reloaded_0_10(arg_36_4 / 4294967296)
			reloaded_0_114[14], reloaded_0_114[15] = arg_36_8, arg_36_3

			for iter_36_2 = 1, 7 do
				reloaded_0_115(0, 4, 8, 12, reloaded_0_77[iter_36_2], reloaded_0_77[iter_36_2 + 14])
				reloaded_0_115(1, 5, 9, 13, reloaded_0_77[iter_36_2 + 1], reloaded_0_77[iter_36_2 + 2])
				reloaded_0_115(2, 6, 10, 14, reloaded_0_77[iter_36_2 + 16], reloaded_0_77[iter_36_2 + 7])
				reloaded_0_115(3, 7, 11, 15, reloaded_0_77[iter_36_2 + 15], reloaded_0_77[iter_36_2 + 17])
				reloaded_0_115(0, 5, 10, 15, reloaded_0_77[iter_36_2 + 21], reloaded_0_77[iter_36_2 + 5])
				reloaded_0_115(1, 6, 11, 12, reloaded_0_77[iter_36_2 + 3], reloaded_0_77[iter_36_2 + 6])
				reloaded_0_115(2, 7, 8, 13, reloaded_0_77[iter_36_2 + 4], reloaded_0_77[iter_36_2 + 18])
				reloaded_0_115(3, 4, 9, 14, reloaded_0_77[iter_36_2 + 19], reloaded_0_77[iter_36_2 + 20])
			end

			if arg_36_7 then
				arg_36_6[9] = reloaded_0_37(reloaded_36_0, reloaded_0_114[8])
				arg_36_6[10] = reloaded_0_37(reloaded_36_1, reloaded_0_114[9])
				arg_36_6[11] = reloaded_0_37(reloaded_36_2, reloaded_0_114[10])
				arg_36_6[12] = reloaded_0_37(reloaded_36_3, reloaded_0_114[11])
				arg_36_6[13] = reloaded_0_37(reloaded_36_4, reloaded_0_114[12])
				arg_36_6[14] = reloaded_0_37(reloaded_36_5, reloaded_0_114[13])
				arg_36_6[15] = reloaded_0_37(reloaded_36_6, reloaded_0_114[14])
				arg_36_6[16] = reloaded_0_37(reloaded_36_7, reloaded_0_114[15])
			end

			reloaded_36_0 = reloaded_0_37(reloaded_0_114[0], reloaded_0_114[8])
			reloaded_36_1 = reloaded_0_37(reloaded_0_114[1], reloaded_0_114[9])
			reloaded_36_2 = reloaded_0_37(reloaded_0_114[2], reloaded_0_114[10])
			reloaded_36_3 = reloaded_0_37(reloaded_0_114[3], reloaded_0_114[11])
			reloaded_36_4 = reloaded_0_37(reloaded_0_114[4], reloaded_0_114[12])
			reloaded_36_5 = reloaded_0_37(reloaded_0_114[5], reloaded_0_114[13])
			reloaded_36_6 = reloaded_0_37(reloaded_0_114[6], reloaded_0_114[14])
			reloaded_36_7 = reloaded_0_37(reloaded_0_114[7], reloaded_0_114[15])
		end

		arg_36_6[1], arg_36_6[2], arg_36_6[3], arg_36_6[4], arg_36_6[5], arg_36_6[6], arg_36_6[7], arg_36_6[8] = reloaded_36_0, reloaded_36_1, reloaded_36_2, reloaded_36_3, reloaded_36_4, reloaded_36_5, reloaded_36_6, reloaded_36_7
	end
end

reloaded_0_37 = reloaded_0_37 or reloaded_0_46

local function reloaded_0_116(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local reloaded_37_0 = {}
	local reloaded_37_1 = 0
	local reloaded_37_2 = 0
	local reloaded_37_3 = 1

	for iter_37_0 = 1, arg_37_3 do
		for iter_37_1 = reloaded_0_13(1, iter_37_0 + 1 - #arg_37_1), reloaded_0_12(iter_37_0, #arg_37_0) do
			reloaded_37_1 = reloaded_37_1 + arg_37_2 * arg_37_0[iter_37_1] * arg_37_1[iter_37_0 + 1 - iter_37_1]
		end

		local reloaded_37_4 = reloaded_37_1 % 16777216

		reloaded_37_0[iter_37_0] = reloaded_0_10(reloaded_37_4)
		reloaded_37_1 = (reloaded_37_1 - reloaded_37_4) / 16777216
		reloaded_37_2 = reloaded_37_2 + reloaded_37_4 * reloaded_37_3
		reloaded_37_3 = reloaded_37_3 * 16777216
	end

	return reloaded_37_0, reloaded_37_2
end

local reloaded_0_117 = 0
local reloaded_0_118 = {
	4,
	1,
	2,
	-2,
	2
}
local reloaded_0_119 = 4
local reloaded_0_120 = {
	1
}
local reloaded_0_121 = reloaded_0_59
local reloaded_0_122 = reloaded_0_58

repeat
	reloaded_0_119 = reloaded_0_119 + reloaded_0_118[reloaded_0_119 % 6]

	local reloaded_0_123 = 1

	repeat
		reloaded_0_123 = reloaded_0_123 + reloaded_0_118[reloaded_0_123 % 6]

		if reloaded_0_119 < reloaded_0_123 * reloaded_0_123 then
			local reloaded_0_124 = reloaded_0_119^0.3333333333333333
			local reloaded_0_125 = reloaded_0_124 * 1099511627776
			local reloaded_0_126 = reloaded_0_116({
				reloaded_0_125 - reloaded_0_125 % 1
			}, reloaded_0_120, 1, 2)
			local reloaded_0_127, reloaded_0_128 = reloaded_0_116(reloaded_0_126, reloaded_0_116(reloaded_0_126, reloaded_0_126, 1, 4), -1, 4)
			local reloaded_0_129 = reloaded_0_126[2] % 65536 * 65536 + reloaded_0_10(reloaded_0_126[1] / 256)
			local reloaded_0_130 = reloaded_0_126[1] % 256 * 16777216 + reloaded_0_10(reloaded_0_128 * 4.625929269271485e-18 * reloaded_0_124 / reloaded_0_119)

			if reloaded_0_117 < 16 then
				local reloaded_0_131 = reloaded_0_119^0.5
				local reloaded_0_132 = reloaded_0_131 * 1099511627776
				local reloaded_0_133 = reloaded_0_116({
					reloaded_0_132 - reloaded_0_132 % 1
				}, reloaded_0_120, 1, 2)
				local reloaded_0_134, reloaded_0_135 = reloaded_0_116(reloaded_0_133, reloaded_0_133, -1, 2)
				local reloaded_0_136 = reloaded_0_133[2] % 65536 * 65536 + reloaded_0_10(reloaded_0_133[1] / 256)
				local reloaded_0_137 = reloaded_0_133[1] % 256 * 16777216 + reloaded_0_10(reloaded_0_135 * 7.62939453125e-06 / reloaded_0_131)
				local reloaded_0_138 = reloaded_0_117 % 8 + 1

				reloaded_0_62[224][reloaded_0_138] = reloaded_0_137
				reloaded_0_121[reloaded_0_138], reloaded_0_122[reloaded_0_138] = reloaded_0_136, reloaded_0_137 + reloaded_0_136 * reloaded_0_74

				if reloaded_0_138 > 7 then
					reloaded_0_121, reloaded_0_122 = reloaded_0_64[384], reloaded_0_63[384]
				end
			end

			reloaded_0_117 = reloaded_0_117 + 1
			reloaded_0_57[reloaded_0_117], reloaded_0_56[reloaded_0_117] = reloaded_0_129, reloaded_0_130 % reloaded_0_73 + reloaded_0_129 * reloaded_0_74

			break
		end
	until reloaded_0_119 % reloaded_0_123 == 0
until reloaded_0_117 > 79

for iter_0_1 = 224, 256, 32 do
	local reloaded_0_139 = {}
	local reloaded_0_140

	if reloaded_0_67 then
		for iter_0_2 = 1, 8 do
			reloaded_0_139[iter_0_2] = reloaded_0_46(reloaded_0_58[iter_0_2])
		end
	else
		reloaded_0_140 = {}

		for iter_0_3 = 1, 8 do
			reloaded_0_139[iter_0_3] = reloaded_0_46(reloaded_0_58[iter_0_3])
			reloaded_0_140[iter_0_3] = reloaded_0_46(reloaded_0_59[iter_0_3])
		end
	end

	reloaded_0_49(reloaded_0_139, reloaded_0_140, "SHA-512/" .. tostring(iter_0_1) .. "\x80" .. reloaded_0_5("\x00", 115) .. "X", 0, 128)

	reloaded_0_63[iter_0_1] = reloaded_0_139
	reloaded_0_64[iter_0_1] = reloaded_0_140
end

local reloaded_0_141 = math.sin
local reloaded_0_142 = math.abs
local reloaded_0_143 = math.modf

for iter_0_4 = 1, 64 do
	local reloaded_0_144, reloaded_0_145 = reloaded_0_143(reloaded_0_142(reloaded_0_141(iter_0_4)) * 65536)

	reloaded_0_65[iter_0_4] = reloaded_0_144 * 65536 + reloaded_0_10(reloaded_0_145 * 65536)
end

local reloaded_0_146 = 29

local function reloaded_0_147()
	local reloaded_38_0 = reloaded_0_146 % 2

	reloaded_0_146 = reloaded_0_45((reloaded_0_146 - reloaded_38_0) / 2, 142 * reloaded_38_0)

	return reloaded_38_0
end

for iter_0_5 = 1, 24 do
	local reloaded_0_148 = 0
	local reloaded_0_149

	for iter_0_6 = 1, 6 do
		reloaded_0_149 = reloaded_0_149 and reloaded_0_149 * reloaded_0_149 * 2 or 1
		reloaded_0_148 = reloaded_0_148 + reloaded_0_147() * reloaded_0_149
	end

	local reloaded_0_150 = reloaded_0_147() * reloaded_0_149

	reloaded_0_61[iter_0_5], reloaded_0_60[iter_0_5] = reloaded_0_150, reloaded_0_148 + reloaded_0_150 * reloaded_0_75
end

if reloaded_0_34 == "FFI" then
	reloaded_0_57 = reloaded_0_27.new("uint32_t[?]", #reloaded_0_57 + 1, 0, reloaded_0_1(reloaded_0_57))
	reloaded_0_56 = reloaded_0_27.new("int64_t[?]", #reloaded_0_56 + 1, 0, reloaded_0_1(reloaded_0_56))

	if reloaded_0_75 == 0 then
		reloaded_0_60 = reloaded_0_27.new("uint32_t[?]", #reloaded_0_60 + 1, 0, reloaded_0_1(reloaded_0_60))
		reloaded_0_61 = reloaded_0_27.new("uint32_t[?]", #reloaded_0_61 + 1, 0, reloaded_0_1(reloaded_0_61))
	else
		reloaded_0_60 = reloaded_0_27.new("int64_t[?]", #reloaded_0_60 + 1, 0, reloaded_0_1(reloaded_0_60))
	end
end

local function reloaded_0_151(arg_39_0, arg_39_1)
	local reloaded_39_0 = {
		reloaded_0_1(reloaded_0_62[arg_39_0])
	}
	local reloaded_39_1 = 0
	local reloaded_39_2 = ""

	local function reloaded_39_3(arg_40_0)
		if arg_40_0 then
			if reloaded_39_2 then
				reloaded_39_1 = reloaded_39_1 + #arg_40_0

				local reloaded_40_0 = 0

				if reloaded_39_2 ~= "" and #reloaded_39_2 + #arg_40_0 >= 64 then
					reloaded_40_0 = 64 - #reloaded_39_2

					reloaded_0_48(reloaded_39_0, reloaded_39_2 .. reloaded_0_6(arg_40_0, 1, reloaded_40_0), 0, 64)

					reloaded_39_2 = ""
				end

				local reloaded_40_1 = #arg_40_0 - reloaded_40_0
				local reloaded_40_2 = reloaded_40_1 % 64

				reloaded_0_48(reloaded_39_0, arg_40_0, reloaded_40_0, reloaded_40_1 - reloaded_40_2)

				reloaded_39_2 = reloaded_39_2 .. reloaded_0_6(arg_40_0, #arg_40_0 + 1 - reloaded_40_2)

				return reloaded_39_3
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_39_2 then
				local reloaded_40_3 = {
					reloaded_39_2,
					"\x80",
					reloaded_0_5("\x00", (-9 - reloaded_39_1) % 64 + 1)
				}

				reloaded_39_2 = nil
				reloaded_39_1 = reloaded_39_1 * 1.1102230246251565e-16

				for iter_40_0 = 4, 10 do
					reloaded_39_1 = reloaded_39_1 % 1 * 256
					reloaded_40_3[iter_40_0] = reloaded_0_4(reloaded_0_10(reloaded_39_1))
				end

				local reloaded_40_4 = reloaded_0_2(reloaded_40_3)

				reloaded_0_48(reloaded_39_0, reloaded_40_4, 0, #reloaded_40_4)

				local reloaded_40_5 = arg_39_0 / 32

				for iter_40_1 = 1, reloaded_40_5 do
					reloaded_39_0[iter_40_1] = reloaded_0_44(reloaded_39_0[iter_40_1])
				end

				reloaded_39_0 = reloaded_0_2(reloaded_39_0, "", 1, reloaded_40_5)
			end

			return reloaded_39_0
		end
	end

	if arg_39_1 then
		return reloaded_39_3(arg_39_1)()
	else
		return reloaded_39_3
	end
end

local function reloaded_0_152(arg_41_0, arg_41_1)
	local reloaded_41_0 = 0
	local reloaded_41_1 = ""
	local reloaded_41_2 = {
		reloaded_0_1(reloaded_0_63[arg_41_0])
	}
	local reloaded_41_3

	reloaded_41_3 = not reloaded_0_67 and {
		reloaded_0_1(reloaded_0_64[arg_41_0])
	}

	local function reloaded_41_4(arg_42_0)
		if arg_42_0 then
			if reloaded_41_1 then
				reloaded_41_0 = reloaded_41_0 + #arg_42_0

				local reloaded_42_0 = 0

				if reloaded_41_1 ~= "" and #reloaded_41_1 + #arg_42_0 >= 128 then
					reloaded_42_0 = 128 - #reloaded_41_1

					reloaded_0_49(reloaded_41_2, reloaded_41_3, reloaded_41_1 .. reloaded_0_6(arg_42_0, 1, reloaded_42_0), 0, 128)

					reloaded_41_1 = ""
				end

				local reloaded_42_1 = #arg_42_0 - reloaded_42_0
				local reloaded_42_2 = reloaded_42_1 % 128

				reloaded_0_49(reloaded_41_2, reloaded_41_3, arg_42_0, reloaded_42_0, reloaded_42_1 - reloaded_42_2)

				reloaded_41_1 = reloaded_41_1 .. reloaded_0_6(arg_42_0, #arg_42_0 + 1 - reloaded_42_2)

				return reloaded_41_4
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_41_1 then
				local reloaded_42_3 = {
					reloaded_41_1,
					"\x80",
					reloaded_0_5("\x00", (-17 - reloaded_41_0) % 128 + 9)
				}

				reloaded_41_1 = nil
				reloaded_41_0 = reloaded_41_0 * 1.1102230246251565e-16

				for iter_42_0 = 4, 10 do
					reloaded_41_0 = reloaded_41_0 % 1 * 256
					reloaded_42_3[iter_42_0] = reloaded_0_4(reloaded_0_10(reloaded_41_0))
				end

				local reloaded_42_4 = reloaded_0_2(reloaded_42_3)

				reloaded_0_49(reloaded_41_2, reloaded_41_3, reloaded_42_4, 0, #reloaded_42_4)

				local reloaded_42_5 = reloaded_0_11(arg_41_0 / 64)

				if reloaded_0_67 then
					for iter_42_1 = 1, reloaded_42_5 do
						reloaded_41_2[iter_42_1] = reloaded_0_67(reloaded_41_2[iter_42_1])
					end
				else
					for iter_42_2 = 1, reloaded_42_5 do
						reloaded_41_2[iter_42_2] = reloaded_0_44(reloaded_41_3[iter_42_2]) .. reloaded_0_44(reloaded_41_2[iter_42_2])
					end

					reloaded_41_3 = nil
				end

				reloaded_41_2 = reloaded_0_6(reloaded_0_2(reloaded_41_2, "", 1, reloaded_42_5), 1, arg_41_0 / 4)
			end

			return reloaded_41_2
		end
	end

	if arg_41_1 then
		return reloaded_41_4(arg_41_1)()
	else
		return reloaded_41_4
	end
end

local function reloaded_0_153(arg_43_0)
	local reloaded_43_0 = {
		reloaded_0_1(reloaded_0_66, 1, 4)
	}
	local reloaded_43_1 = 0
	local reloaded_43_2 = ""

	local function reloaded_43_3(arg_44_0)
		if arg_44_0 then
			if reloaded_43_2 then
				reloaded_43_1 = reloaded_43_1 + #arg_44_0

				local reloaded_44_0 = 0

				if reloaded_43_2 ~= "" and #reloaded_43_2 + #arg_44_0 >= 64 then
					reloaded_44_0 = 64 - #reloaded_43_2

					reloaded_0_50(reloaded_43_0, reloaded_43_2 .. reloaded_0_6(arg_44_0, 1, reloaded_44_0), 0, 64)

					reloaded_43_2 = ""
				end

				local reloaded_44_1 = #arg_44_0 - reloaded_44_0
				local reloaded_44_2 = reloaded_44_1 % 64

				reloaded_0_50(reloaded_43_0, arg_44_0, reloaded_44_0, reloaded_44_1 - reloaded_44_2)

				reloaded_43_2 = reloaded_43_2 .. reloaded_0_6(arg_44_0, #arg_44_0 + 1 - reloaded_44_2)

				return reloaded_43_3
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_43_2 then
				local reloaded_44_3 = {
					reloaded_43_2,
					"\x80",
					reloaded_0_5("\x00", (-9 - reloaded_43_1) % 64)
				}

				reloaded_43_2 = nil
				reloaded_43_1 = reloaded_43_1 * 8

				for iter_44_0 = 4, 11 do
					local reloaded_44_4 = reloaded_43_1 % 256

					reloaded_44_3[iter_44_0] = reloaded_0_4(reloaded_44_4)
					reloaded_43_1 = (reloaded_43_1 - reloaded_44_4) / 256
				end

				local reloaded_44_5 = reloaded_0_2(reloaded_44_3)

				reloaded_0_50(reloaded_43_0, reloaded_44_5, 0, #reloaded_44_5)

				for iter_44_1 = 1, 4 do
					reloaded_43_0[iter_44_1] = reloaded_0_44(reloaded_43_0[iter_44_1])
				end

				reloaded_43_0 = reloaded_0_7(reloaded_0_2(reloaded_43_0), "(..)(..)(..)(..)", "%4%3%2%1")
			end

			return reloaded_43_0
		end
	end

	if arg_43_0 then
		return reloaded_43_3(arg_43_0)()
	else
		return reloaded_43_3
	end
end

local function reloaded_0_154(arg_45_0)
	local reloaded_45_0 = {
		reloaded_0_1(reloaded_0_66)
	}
	local reloaded_45_1 = 0
	local reloaded_45_2 = ""

	local function reloaded_45_3(arg_46_0)
		if arg_46_0 then
			if reloaded_45_2 then
				reloaded_45_1 = reloaded_45_1 + #arg_46_0

				local reloaded_46_0 = 0

				if reloaded_45_2 ~= "" and #reloaded_45_2 + #arg_46_0 >= 64 then
					reloaded_46_0 = 64 - #reloaded_45_2

					reloaded_0_51(reloaded_45_0, reloaded_45_2 .. reloaded_0_6(arg_46_0, 1, reloaded_46_0), 0, 64)

					reloaded_45_2 = ""
				end

				local reloaded_46_1 = #arg_46_0 - reloaded_46_0
				local reloaded_46_2 = reloaded_46_1 % 64

				reloaded_0_51(reloaded_45_0, arg_46_0, reloaded_46_0, reloaded_46_1 - reloaded_46_2)

				reloaded_45_2 = reloaded_45_2 .. reloaded_0_6(arg_46_0, #arg_46_0 + 1 - reloaded_46_2)

				return reloaded_45_3
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_45_2 then
				local reloaded_46_3 = {
					reloaded_45_2,
					"\x80",
					reloaded_0_5("\x00", (-9 - reloaded_45_1) % 64 + 1)
				}

				reloaded_45_2 = nil
				reloaded_45_1 = reloaded_45_1 * 1.1102230246251565e-16

				for iter_46_0 = 4, 10 do
					reloaded_45_1 = reloaded_45_1 % 1 * 256
					reloaded_46_3[iter_46_0] = reloaded_0_4(reloaded_0_10(reloaded_45_1))
				end

				local reloaded_46_4 = reloaded_0_2(reloaded_46_3)

				reloaded_0_51(reloaded_45_0, reloaded_46_4, 0, #reloaded_46_4)

				for iter_46_1 = 1, 5 do
					reloaded_45_0[iter_46_1] = reloaded_0_44(reloaded_45_0[iter_46_1])
				end

				reloaded_45_0 = reloaded_0_2(reloaded_45_0)
			end

			return reloaded_45_0
		end
	end

	if arg_45_0 then
		return reloaded_45_3(arg_45_0)()
	else
		return reloaded_45_3
	end
end

local function reloaded_0_155(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	if reloaded_0_15(arg_47_1) ~= "number" then
		error("Argument 'digest_size_in_bytes' must be a number", 2)
	end

	local reloaded_47_0 = ""
	local reloaded_47_1 = reloaded_0_47()
	local reloaded_47_2 = reloaded_0_75 == 0 and reloaded_0_47()
	local reloaded_47_3

	local function reloaded_47_4(arg_48_0)
		if arg_48_0 then
			if reloaded_47_0 then
				local reloaded_48_0 = 0

				if reloaded_47_0 ~= "" and #reloaded_47_0 + #arg_48_0 >= arg_47_0 then
					reloaded_48_0 = arg_47_0 - #reloaded_47_0

					reloaded_0_52(reloaded_47_1, reloaded_47_2, reloaded_47_0 .. reloaded_0_6(arg_48_0, 1, reloaded_48_0), 0, arg_47_0, arg_47_0)

					reloaded_47_0 = ""
				end

				local reloaded_48_1 = #arg_48_0 - reloaded_48_0
				local reloaded_48_2 = reloaded_48_1 % arg_47_0

				reloaded_0_52(reloaded_47_1, reloaded_47_2, arg_48_0, reloaded_48_0, reloaded_48_1 - reloaded_48_2, arg_47_0)

				reloaded_47_0 = reloaded_47_0 .. reloaded_0_6(arg_48_0, #arg_48_0 + 1 - reloaded_48_2)

				return reloaded_47_4
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_47_0 then
				local reloaded_48_3 = arg_47_2 and 31 or 6

				reloaded_47_0 = reloaded_47_0 .. (#reloaded_47_0 + 1 == arg_47_0 and reloaded_0_4(reloaded_48_3 + 128) or reloaded_0_4(reloaded_48_3) .. reloaded_0_5("\x00", (-2 - #reloaded_47_0) % arg_47_0) .. "\x80")

				reloaded_0_52(reloaded_47_1, reloaded_47_2, reloaded_47_0, 0, #reloaded_47_0, arg_47_0)

				reloaded_47_0 = nil

				local reloaded_48_4 = 0
				local reloaded_48_5 = reloaded_0_10(arg_47_0 / 8)
				local reloaded_48_6 = {}

				local function reloaded_48_7(arg_49_0)
					if reloaded_48_4 >= reloaded_48_5 then
						reloaded_0_52(reloaded_47_1, reloaded_47_2, "\x00\x00\x00\x00\x00\x00\x00\x00", 0, 8, 8)

						reloaded_48_4 = 0
					end

					arg_49_0 = reloaded_0_10(reloaded_0_12(arg_49_0, reloaded_48_5 - reloaded_48_4))

					if reloaded_0_75 ~= 0 then
						for iter_49_0 = 1, arg_49_0 do
							reloaded_48_6[iter_49_0] = reloaded_0_67(reloaded_47_1[reloaded_48_4 + iter_49_0 - 1 + reloaded_0_68])
						end
					else
						for iter_49_1 = 1, arg_49_0 do
							reloaded_48_6[iter_49_1] = reloaded_0_44(reloaded_47_2[reloaded_48_4 + iter_49_1]) .. reloaded_0_44(reloaded_47_1[reloaded_48_4 + iter_49_1])
						end
					end

					reloaded_48_4 = reloaded_48_4 + arg_49_0

					return reloaded_0_7(reloaded_0_2(reloaded_48_6, "", 1, arg_49_0), "(..)(..)(..)(..)(..)(..)(..)(..)", "%8%7%6%5%4%3%2%1"), arg_49_0 * 8
				end

				local reloaded_48_8 = {}
				local reloaded_48_9 = ""
				local reloaded_48_10 = 0

				local function reloaded_48_11(arg_50_0)
					arg_50_0 = arg_50_0 or 1

					if arg_50_0 <= reloaded_48_10 then
						reloaded_48_10 = reloaded_48_10 - arg_50_0

						local reloaded_50_0 = arg_50_0 * 2
						local reloaded_50_1 = reloaded_0_6(reloaded_48_9, 1, reloaded_50_0)

						reloaded_48_9 = reloaded_0_6(reloaded_48_9, reloaded_50_0 + 1)

						return reloaded_50_1
					end

					local reloaded_50_2 = 0

					if reloaded_48_10 > 0 then
						reloaded_50_2 = 1
						reloaded_48_8[reloaded_50_2] = reloaded_48_9
						arg_50_0 = arg_50_0 - reloaded_48_10
					end

					while arg_50_0 >= 8 do
						local reloaded_50_3, reloaded_50_4 = reloaded_48_7(arg_50_0 / 8)

						reloaded_50_2 = reloaded_50_2 + 1
						reloaded_48_8[reloaded_50_2] = reloaded_50_3
						arg_50_0 = arg_50_0 - reloaded_50_4
					end

					if arg_50_0 > 0 then
						reloaded_48_9, reloaded_48_10 = reloaded_48_7(1)
						reloaded_50_2 = reloaded_50_2 + 1
						reloaded_48_8[reloaded_50_2] = reloaded_48_11(arg_50_0)
					else
						reloaded_48_9, reloaded_48_10 = "", 0
					end

					return reloaded_0_2(reloaded_48_8, "", 1, reloaded_50_2)
				end

				if arg_47_1 < 0 then
					reloaded_47_3 = reloaded_48_11
				else
					reloaded_47_3 = reloaded_48_11(arg_47_1)
				end
			end

			return reloaded_47_3
		end
	end

	if arg_47_3 then
		return reloaded_47_4(arg_47_3)()
	else
		return reloaded_47_4
	end
end

local reloaded_0_156
local reloaded_0_157
local reloaded_0_158
local reloaded_0_159

local function reloaded_0_160(arg_51_0)
	return (reloaded_0_7(arg_51_0, "%x%x", function(arg_52_0)
		return reloaded_0_4(reloaded_0_14(arg_52_0, 16))
	end))
end

local function reloaded_0_161(arg_53_0)
	return (reloaded_0_7(arg_53_0, ".", function(arg_54_0)
		return reloaded_0_9("%02x", reloaded_0_3(arg_54_0))
	end))
end

local reloaded_0_162 = {
	["/"] = 63,
	[63] = "/",
	[-1] = "=",
	_ = 63,
	["."] = -1,
	["-"] = 62,
	["+"] = 62,
	[62] = "+",
	["="] = -1
}
local reloaded_0_163 = 0

for iter_0_7, iter_0_8 in ipairs({
	"AZ",
	"az",
	"09"
}) do
	for iter_0_9 = reloaded_0_3(iter_0_8), reloaded_0_3(iter_0_8, 2) do
		local reloaded_0_164 = reloaded_0_4(iter_0_9)

		reloaded_0_162[reloaded_0_164] = reloaded_0_163
		reloaded_0_162[reloaded_0_163] = reloaded_0_164
		reloaded_0_163 = reloaded_0_163 + 1
	end
end

local function reloaded_0_165(arg_55_0)
	local reloaded_55_0 = {}

	for iter_55_0 = 1, #arg_55_0, 3 do
		local reloaded_55_1, reloaded_55_2, reloaded_55_3, reloaded_55_4 = reloaded_0_3(reloaded_0_6(arg_55_0, iter_55_0, iter_55_0 + 2) .. "\x00", 1, -1)

		reloaded_55_0[#reloaded_55_0 + 1] = reloaded_0_162[reloaded_0_10(reloaded_55_1 / 4)] .. reloaded_0_162[reloaded_55_1 % 4 * 16 + reloaded_0_10(reloaded_55_2 / 16)] .. reloaded_0_162[reloaded_55_3 and reloaded_55_2 % 16 * 4 + reloaded_0_10(reloaded_55_3 / 64) or -1] .. reloaded_0_162[reloaded_55_4 and reloaded_55_3 % 64 or -1]
	end

	return reloaded_0_2(reloaded_55_0)
end

local function reloaded_0_166(arg_56_0)
	local reloaded_56_0 = {}
	local reloaded_56_1 = 3

	for iter_56_0, iter_56_1 in reloaded_0_8(reloaded_0_7(arg_56_0, "%s+", ""), "()(.)") do
		local reloaded_56_2 = reloaded_0_162[iter_56_1]

		if reloaded_56_2 < 0 then
			reloaded_56_1 = reloaded_56_1 - 1
			reloaded_56_2 = 0
		end

		local reloaded_56_3 = iter_56_0 % 4

		if reloaded_56_3 > 0 then
			reloaded_56_0[-reloaded_56_3] = reloaded_56_2
		else
			local reloaded_56_4 = reloaded_56_0[-1] * 4 + reloaded_0_10(reloaded_56_0[-2] / 16)
			local reloaded_56_5 = reloaded_56_0[-2] % 16 * 16 + reloaded_0_10(reloaded_56_0[-3] / 4)
			local reloaded_56_6 = reloaded_56_0[-3] % 4 * 64 + reloaded_56_2

			reloaded_56_0[#reloaded_56_0 + 1] = reloaded_0_6(reloaded_0_4(reloaded_56_4, reloaded_56_5, reloaded_56_6), 1, reloaded_56_1)
		end
	end

	return reloaded_0_2(reloaded_56_0)
end

local reloaded_0_167

local function reloaded_0_168(arg_57_0, arg_57_1, arg_57_2)
	return reloaded_0_7(arg_57_0, ".", function(arg_58_0)
		return reloaded_0_4(reloaded_0_45(reloaded_0_3(arg_58_0), arg_57_2))
	end) .. reloaded_0_5(reloaded_0_4(arg_57_2), arg_57_1 - #arg_57_0)
end

local function reloaded_0_169(arg_59_0, arg_59_1, arg_59_2)
	local reloaded_59_0 = reloaded_0_167[arg_59_0]

	if not reloaded_59_0 then
		error("Unknown hash function", 2)
	end

	if reloaded_59_0 < #arg_59_1 then
		arg_59_1 = reloaded_0_160(arg_59_0(arg_59_1))
	end

	local reloaded_59_1 = arg_59_0()(reloaded_0_168(arg_59_1, reloaded_59_0, 54))
	local reloaded_59_2

	local function reloaded_59_3(arg_60_0)
		if not arg_60_0 then
			reloaded_59_2 = reloaded_59_2 or arg_59_0(reloaded_0_168(arg_59_1, reloaded_59_0, 92) .. reloaded_0_160(reloaded_59_1()))

			return reloaded_59_2
		elseif reloaded_59_2 then
			error("Adding more chunks is not allowed after receiving the result", 2)
		else
			reloaded_59_1(arg_60_0)

			return reloaded_59_3
		end
	end

	if arg_59_2 then
		return reloaded_59_3(arg_59_2)()
	else
		return reloaded_59_3
	end
end

local function reloaded_0_170(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	local reloaded_61_0 = arg_61_1 == "s" and 16 or 32
	local reloaded_61_1 = #arg_61_0

	if reloaded_61_0 < reloaded_61_1 then
		error(reloaded_0_9("For BLAKE2%s/BLAKE2%sp/BLAKE2X%s the 'salt' parameter length must not exceed %d bytes", arg_61_1, arg_61_1, arg_61_1, reloaded_61_0), 2)
	end

	if arg_61_2 then
		local reloaded_61_2 = 0
		local reloaded_61_3 = arg_61_1 == "s" and 4 or 8
		local reloaded_61_4 = arg_61_1 == "s" and reloaded_0_37 or reloaded_0_46

		for iter_61_0 = 5, 4 + reloaded_0_11(reloaded_61_1 / reloaded_61_3) do
			local reloaded_61_5
			local reloaded_61_6

			for iter_61_1 = 1, reloaded_61_3, 4 do
				reloaded_61_2 = reloaded_61_2 + 4

				local reloaded_61_7, reloaded_61_8, reloaded_61_9, reloaded_61_10 = reloaded_0_3(arg_61_0, reloaded_61_2 - 3, reloaded_61_2)
				local reloaded_61_11 = (((reloaded_61_10 or 0) * 256 + (reloaded_61_9 or 0)) * 256 + (reloaded_61_8 or 0)) * 256 + (reloaded_61_7 or 0)

				reloaded_61_5, reloaded_61_6 = reloaded_61_6, reloaded_61_11
			end

			arg_61_2[iter_61_0] = reloaded_61_4(arg_61_2[iter_61_0], reloaded_61_5 and reloaded_61_6 * reloaded_0_74 + reloaded_61_5 or reloaded_61_6)

			if arg_61_3 then
				arg_61_3[iter_61_0] = reloaded_61_4(arg_61_3[iter_61_0], reloaded_61_6)
			end
		end
	end
end

local function reloaded_0_171(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4, arg_62_5)
	arg_62_3 = arg_62_3 or 32

	if arg_62_3 < 1 or arg_62_3 > 32 then
		error("BLAKE2s digest length must be from 1 to 32 bytes", 2)
	end

	arg_62_1 = arg_62_1 or ""

	local reloaded_62_0 = #arg_62_1

	if reloaded_62_0 > 32 then
		error("BLAKE2s key length must not exceed 32 bytes", 2)
	end

	arg_62_2 = arg_62_2 or ""

	local reloaded_62_1 = 0
	local reloaded_62_2 = ""
	local reloaded_62_3 = {
		reloaded_0_1(reloaded_0_59)
	}

	if arg_62_5 then
		reloaded_62_3[1] = reloaded_0_37(reloaded_62_3[1], arg_62_3)
		reloaded_62_3[2] = reloaded_0_37(reloaded_62_3[2], 32)
		reloaded_62_3[3] = reloaded_0_37(reloaded_62_3[3], arg_62_5)
		reloaded_62_3[4] = reloaded_0_37(reloaded_62_3[4], 536870912 + arg_62_4)
	else
		reloaded_62_3[1] = reloaded_0_37(reloaded_62_3[1], 16842752 + reloaded_62_0 * 256 + arg_62_3)

		if arg_62_4 then
			reloaded_62_3[4] = reloaded_0_37(reloaded_62_3[4], arg_62_4)
		end
	end

	if arg_62_2 ~= "" then
		reloaded_0_170(arg_62_2, "s", reloaded_62_3)
	end

	local function reloaded_62_4(arg_63_0)
		if arg_63_0 then
			if reloaded_62_2 then
				local reloaded_63_0 = 0

				if reloaded_62_2 ~= "" and #reloaded_62_2 + #arg_63_0 > 64 then
					reloaded_63_0 = 64 - #reloaded_62_2
					reloaded_62_1 = reloaded_0_53(reloaded_62_3, reloaded_62_2 .. reloaded_0_6(arg_63_0, 1, reloaded_63_0), 0, 64, reloaded_62_1)
					reloaded_62_2 = ""
				end

				local reloaded_63_1 = #arg_63_0 - reloaded_63_0
				local reloaded_63_2 = reloaded_63_1 > 0 and (reloaded_63_1 - 1) % 64 + 1 or 0

				reloaded_62_1 = reloaded_0_53(reloaded_62_3, arg_63_0, reloaded_63_0, reloaded_63_1 - reloaded_63_2, reloaded_62_1)
				reloaded_62_2 = reloaded_62_2 .. reloaded_0_6(arg_63_0, #arg_63_0 + 1 - reloaded_63_2)

				return reloaded_62_4
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_62_2 then
				if arg_62_5 then
					reloaded_0_53(reloaded_62_3, nil, 0, 64, 0, 32)
				else
					reloaded_0_53(reloaded_62_3, reloaded_62_2 .. reloaded_0_5("\x00", 64 - #reloaded_62_2), 0, 64, reloaded_62_1, #reloaded_62_2)
				end

				reloaded_62_2 = nil

				if not arg_62_4 or arg_62_5 then
					local reloaded_63_3 = reloaded_0_11(arg_62_3 / 4)

					for iter_63_0 = 1, reloaded_63_3 do
						reloaded_62_3[iter_63_0] = reloaded_0_44(reloaded_62_3[iter_63_0])
					end

					reloaded_62_3 = reloaded_0_6(reloaded_0_7(reloaded_0_2(reloaded_62_3, "", 1, reloaded_63_3), "(..)(..)(..)(..)", "%4%3%2%1"), 1, arg_62_3 * 2)
				end
			end

			return reloaded_62_3
		end
	end

	if reloaded_62_0 > 0 then
		reloaded_62_4(arg_62_1 .. reloaded_0_5("\x00", 64 - reloaded_62_0))
	end

	if arg_62_5 then
		return reloaded_62_4()
	elseif arg_62_0 then
		return reloaded_62_4(arg_62_0)()
	else
		return reloaded_62_4
	end
end

local function reloaded_0_172(arg_64_0, arg_64_1, arg_64_2, arg_64_3, arg_64_4, arg_64_5)
	arg_64_3 = reloaded_0_10(arg_64_3 or 64)

	if arg_64_3 < 1 or arg_64_3 > 64 then
		error("BLAKE2b digest length must be from 1 to 64 bytes", 2)
	end

	arg_64_1 = arg_64_1 or ""

	local reloaded_64_0 = #arg_64_1

	if reloaded_64_0 > 64 then
		error("BLAKE2b key length must not exceed 64 bytes", 2)
	end

	arg_64_2 = arg_64_2 or ""

	local reloaded_64_1 = 0
	local reloaded_64_2 = ""
	local reloaded_64_3 = {
		reloaded_0_1(reloaded_0_58)
	}
	local reloaded_64_4

	reloaded_64_4 = not reloaded_0_67 and {
		reloaded_0_1(reloaded_0_59)
	}

	if arg_64_5 then
		if reloaded_64_4 then
			reloaded_64_3[1] = reloaded_0_46(reloaded_64_3[1], arg_64_3)
			reloaded_64_4[1] = reloaded_0_46(reloaded_64_4[1], 64)
			reloaded_64_3[2] = reloaded_0_46(reloaded_64_3[2], arg_64_5)
			reloaded_64_4[2] = reloaded_0_46(reloaded_64_4[2], arg_64_4)
		else
			reloaded_64_3[1] = reloaded_0_46(reloaded_64_3[1], 64 * reloaded_0_74 + arg_64_3)
			reloaded_64_3[2] = reloaded_0_46(reloaded_64_3[2], arg_64_4 * reloaded_0_74 + arg_64_5)
		end

		reloaded_64_3[3] = reloaded_0_46(reloaded_64_3[3], 16384)
	else
		reloaded_64_3[1] = reloaded_0_46(reloaded_64_3[1], 16842752 + reloaded_64_0 * 256 + arg_64_3)

		if arg_64_4 then
			if reloaded_64_4 then
				reloaded_64_4[2] = reloaded_0_46(reloaded_64_4[2], arg_64_4)
			else
				reloaded_64_3[2] = reloaded_0_46(reloaded_64_3[2], arg_64_4 * reloaded_0_74)
			end
		end
	end

	if arg_64_2 ~= "" then
		reloaded_0_170(arg_64_2, "b", reloaded_64_3, reloaded_64_4)
	end

	local function reloaded_64_5(arg_65_0)
		if arg_65_0 then
			if reloaded_64_2 then
				local reloaded_65_0 = 0

				if reloaded_64_2 ~= "" and #reloaded_64_2 + #arg_65_0 > 128 then
					reloaded_65_0 = 128 - #reloaded_64_2
					reloaded_64_1 = reloaded_0_54(reloaded_64_3, reloaded_64_4, reloaded_64_2 .. reloaded_0_6(arg_65_0, 1, reloaded_65_0), 0, 128, reloaded_64_1)
					reloaded_64_2 = ""
				end

				local reloaded_65_1 = #arg_65_0 - reloaded_65_0
				local reloaded_65_2 = reloaded_65_1 > 0 and (reloaded_65_1 - 1) % 128 + 1 or 0

				reloaded_64_1 = reloaded_0_54(reloaded_64_3, reloaded_64_4, arg_65_0, reloaded_65_0, reloaded_65_1 - reloaded_65_2, reloaded_64_1)
				reloaded_64_2 = reloaded_64_2 .. reloaded_0_6(arg_65_0, #arg_65_0 + 1 - reloaded_65_2)

				return reloaded_64_5
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_64_2 then
				if arg_64_5 then
					reloaded_0_54(reloaded_64_3, reloaded_64_4, nil, 0, 128, 0, 64)
				else
					reloaded_0_54(reloaded_64_3, reloaded_64_4, reloaded_64_2 .. reloaded_0_5("\x00", 128 - #reloaded_64_2), 0, 128, reloaded_64_1, #reloaded_64_2)
				end

				reloaded_64_2 = nil

				if arg_64_4 and not arg_64_5 then
					if reloaded_64_4 then
						for iter_65_0 = 8, 1, -1 do
							reloaded_64_3[iter_65_0 * 2] = reloaded_64_4[iter_65_0]
							reloaded_64_3[iter_65_0 * 2 - 1] = reloaded_64_3[iter_65_0]
						end

						return reloaded_64_3, 16
					end
				else
					local reloaded_65_3 = reloaded_0_11(arg_64_3 / 8)

					if reloaded_64_4 then
						for iter_65_1 = 1, reloaded_65_3 do
							reloaded_64_3[iter_65_1] = reloaded_0_44(reloaded_64_4[iter_65_1]) .. reloaded_0_44(reloaded_64_3[iter_65_1])
						end
					else
						for iter_65_2 = 1, reloaded_65_3 do
							reloaded_64_3[iter_65_2] = reloaded_0_67(reloaded_64_3[iter_65_2])
						end
					end

					reloaded_64_3 = reloaded_0_6(reloaded_0_7(reloaded_0_2(reloaded_64_3, "", 1, reloaded_65_3), "(..)(..)(..)(..)(..)(..)(..)(..)", "%8%7%6%5%4%3%2%1"), 1, arg_64_3 * 2)
				end

				reloaded_64_4 = nil
			end

			return reloaded_64_3
		end
	end

	if reloaded_64_0 > 0 then
		reloaded_64_5(arg_64_1 .. reloaded_0_5("\x00", 128 - reloaded_64_0))
	end

	if arg_64_5 then
		return reloaded_64_5()
	elseif arg_64_0 then
		return reloaded_64_5(arg_64_0)()
	else
		return reloaded_64_5
	end
end

local function reloaded_0_173(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	arg_66_3 = arg_66_3 or 32

	if arg_66_3 < 1 or arg_66_3 > 32 then
		error("BLAKE2sp digest length must be from 1 to 32 bytes", 2)
	end

	arg_66_1 = arg_66_1 or ""

	local reloaded_66_0 = #arg_66_1

	if reloaded_66_0 > 32 then
		error("BLAKE2sp key length must not exceed 32 bytes", 2)
	end

	arg_66_2 = arg_66_2 or ""

	local reloaded_66_1 = {}
	local reloaded_66_2 = 0
	local reloaded_66_3 = 34078720 + reloaded_66_0 * 256 + arg_66_3
	local reloaded_66_4

	for iter_66_0 = 1, 8 do
		local reloaded_66_5 = 0
		local reloaded_66_6 = ""
		local reloaded_66_7 = {
			reloaded_0_1(reloaded_0_59)
		}

		reloaded_66_1[iter_66_0] = {
			reloaded_66_5,
			reloaded_66_6,
			reloaded_66_7
		}
		reloaded_66_7[1] = reloaded_0_37(reloaded_66_7[1], reloaded_66_3)
		reloaded_66_7[3] = reloaded_0_37(reloaded_66_7[3], iter_66_0 - 1)
		reloaded_66_7[4] = reloaded_0_37(reloaded_66_7[4], 536870912)

		if arg_66_2 ~= "" then
			reloaded_0_170(arg_66_2, "s", reloaded_66_7)
		end
	end

	local function reloaded_66_8(arg_67_0)
		if arg_67_0 then
			if reloaded_66_1 then
				local reloaded_67_0 = 0

				while true do
					local reloaded_67_1 = reloaded_0_12(reloaded_67_0 + 64 - reloaded_66_2 % 64, #arg_67_0)

					if reloaded_67_0 < reloaded_67_1 then
						local reloaded_67_2 = reloaded_66_1[reloaded_0_10(reloaded_66_2 / 64) % 8 + 1]
						local reloaded_67_3 = reloaded_0_6(arg_67_0, reloaded_67_0 + 1, reloaded_67_1)

						reloaded_66_2, reloaded_67_0 = reloaded_66_2 + reloaded_67_1 - reloaded_67_0, reloaded_67_1

						local reloaded_67_4 = reloaded_67_2[1]
						local reloaded_67_5 = reloaded_67_2[2]

						if #reloaded_67_5 < 64 then
							reloaded_67_5 = reloaded_67_5 .. reloaded_67_3
						else
							local reloaded_67_6 = reloaded_67_2[3]

							reloaded_67_4 = reloaded_0_53(reloaded_67_6, reloaded_67_5, 0, 64, reloaded_67_4)
							reloaded_67_5 = reloaded_67_3
						end

						reloaded_67_2[1], reloaded_67_2[2] = reloaded_67_4, reloaded_67_5
					else
						break
					end
				end

				return reloaded_66_8
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_66_1 then
				local reloaded_67_7 = {
					reloaded_0_1(reloaded_0_59)
				}

				reloaded_67_7[1] = reloaded_0_37(reloaded_67_7[1], reloaded_66_3)
				reloaded_67_7[4] = reloaded_0_37(reloaded_67_7[4], 536936448)

				if arg_66_2 ~= "" then
					reloaded_0_170(arg_66_2, "s", reloaded_67_7)
				end

				for iter_67_0 = 1, 8 do
					local reloaded_67_8 = reloaded_66_1[iter_67_0]
					local reloaded_67_9 = reloaded_67_8[1]
					local reloaded_67_10 = reloaded_67_8[2]
					local reloaded_67_11 = reloaded_67_8[3]

					reloaded_0_53(reloaded_67_11, reloaded_67_10 .. reloaded_0_5("\x00", 64 - #reloaded_67_10), 0, 64, reloaded_67_9, #reloaded_67_10, iter_67_0 == 8)

					if iter_67_0 % 2 == 0 then
						local reloaded_67_12 = 0

						for iter_67_1 = iter_67_0 - 1, iter_67_0 do
							local reloaded_67_13 = reloaded_66_1[iter_67_1][3]

							for iter_67_2 = 1, 8 do
								reloaded_67_12 = reloaded_67_12 + 1
								reloaded_0_71[reloaded_67_12] = reloaded_67_13[iter_67_2]
							end
						end

						reloaded_0_53(reloaded_67_7, nil, 0, 64, 64 * (iter_67_0 / 2 - 1), iter_67_0 == 8 and 64, iter_67_0 == 8)
					end
				end

				reloaded_66_1 = nil

				local reloaded_67_14 = reloaded_0_11(arg_66_3 / 4)

				for iter_67_3 = 1, reloaded_67_14 do
					reloaded_67_7[iter_67_3] = reloaded_0_44(reloaded_67_7[iter_67_3])
				end

				reloaded_66_4 = reloaded_0_6(reloaded_0_7(reloaded_0_2(reloaded_67_7, "", 1, reloaded_67_14), "(..)(..)(..)(..)", "%4%3%2%1"), 1, arg_66_3 * 2)
			end

			return reloaded_66_4
		end
	end

	if reloaded_66_0 > 0 then
		arg_66_1 = arg_66_1 .. reloaded_0_5("\x00", 64 - reloaded_66_0)

		for iter_66_1 = 1, 8 do
			reloaded_66_8(arg_66_1)
		end
	end

	if arg_66_0 then
		return reloaded_66_8(arg_66_0)()
	else
		return reloaded_66_8
	end
end

local function reloaded_0_174(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
	arg_68_3 = arg_68_3 or 64

	if arg_68_3 < 1 or arg_68_3 > 64 then
		error("BLAKE2bp digest length must be from 1 to 64 bytes", 2)
	end

	arg_68_1 = arg_68_1 or ""

	local reloaded_68_0 = #arg_68_1

	if reloaded_68_0 > 64 then
		error("BLAKE2bp key length must not exceed 64 bytes", 2)
	end

	arg_68_2 = arg_68_2 or ""

	local reloaded_68_1 = {}
	local reloaded_68_2 = 0
	local reloaded_68_3 = 33816576 + reloaded_68_0 * 256 + arg_68_3
	local reloaded_68_4

	for iter_68_0 = 1, 4 do
		local reloaded_68_5 = 0
		local reloaded_68_6 = ""
		local reloaded_68_7 = {
			reloaded_0_1(reloaded_0_58)
		}
		local reloaded_68_8

		reloaded_68_8 = not reloaded_0_67 and {
			reloaded_0_1(reloaded_0_59)
		}
		reloaded_68_1[iter_68_0] = {
			reloaded_68_5,
			reloaded_68_6,
			reloaded_68_7,
			reloaded_68_8
		}
		reloaded_68_7[1] = reloaded_0_46(reloaded_68_7[1], reloaded_68_3)
		reloaded_68_7[2] = reloaded_0_46(reloaded_68_7[2], iter_68_0 - 1)
		reloaded_68_7[3] = reloaded_0_46(reloaded_68_7[3], 16384)

		if arg_68_2 ~= "" then
			reloaded_0_170(arg_68_2, "b", reloaded_68_7, reloaded_68_8)
		end
	end

	local function reloaded_68_9(arg_69_0)
		if arg_69_0 then
			if reloaded_68_1 then
				local reloaded_69_0 = 0

				while true do
					local reloaded_69_1 = reloaded_0_12(reloaded_69_0 + 128 - reloaded_68_2 % 128, #arg_69_0)

					if reloaded_69_0 < reloaded_69_1 then
						local reloaded_69_2 = reloaded_68_1[reloaded_0_10(reloaded_68_2 / 128) % 4 + 1]
						local reloaded_69_3 = reloaded_0_6(arg_69_0, reloaded_69_0 + 1, reloaded_69_1)

						reloaded_68_2, reloaded_69_0 = reloaded_68_2 + reloaded_69_1 - reloaded_69_0, reloaded_69_1

						local reloaded_69_4 = reloaded_69_2[1]
						local reloaded_69_5 = reloaded_69_2[2]

						if #reloaded_69_5 < 128 then
							reloaded_69_5 = reloaded_69_5 .. reloaded_69_3
						else
							local reloaded_69_6 = reloaded_69_2[3]
							local reloaded_69_7 = reloaded_69_2[4]

							reloaded_69_4 = reloaded_0_54(reloaded_69_6, reloaded_69_7, reloaded_69_5, 0, 128, reloaded_69_4)
							reloaded_69_5 = reloaded_69_3
						end

						reloaded_69_2[1], reloaded_69_2[2] = reloaded_69_4, reloaded_69_5
					else
						break
					end
				end

				return reloaded_68_9
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_68_1 then
				local reloaded_69_8 = {
					reloaded_0_1(reloaded_0_58)
				}
				local reloaded_69_9

				reloaded_69_9 = not reloaded_0_67 and {
					reloaded_0_1(reloaded_0_59)
				}
				reloaded_69_8[1] = reloaded_0_46(reloaded_69_8[1], reloaded_68_3)
				reloaded_69_8[3] = reloaded_0_46(reloaded_69_8[3], 16385)

				if arg_68_2 ~= "" then
					reloaded_0_170(arg_68_2, "b", reloaded_69_8, reloaded_69_9)
				end

				for iter_69_0 = 1, 4 do
					local reloaded_69_10 = reloaded_68_1[iter_69_0]
					local reloaded_69_11 = reloaded_69_10[1]
					local reloaded_69_12 = reloaded_69_10[2]
					local reloaded_69_13 = reloaded_69_10[3]
					local reloaded_69_14 = reloaded_69_10[4]

					reloaded_0_54(reloaded_69_13, reloaded_69_14, reloaded_69_12 .. reloaded_0_5("\x00", 128 - #reloaded_69_12), 0, 128, reloaded_69_11, #reloaded_69_12, iter_69_0 == 4)

					if iter_69_0 % 2 == 0 then
						local reloaded_69_15 = 0

						for iter_69_1 = iter_69_0 - 1, iter_69_0 do
							local reloaded_69_16 = reloaded_68_1[iter_69_1]
							local reloaded_69_17 = reloaded_69_16[3]
							local reloaded_69_18 = reloaded_69_16[4]

							for iter_69_2 = 1, 8 do
								reloaded_69_15 = reloaded_69_15 + 1
								reloaded_0_70[reloaded_69_15] = reloaded_69_17[iter_69_2]

								if reloaded_69_18 then
									reloaded_69_15 = reloaded_69_15 + 1
									reloaded_0_70[reloaded_69_15] = reloaded_69_18[iter_69_2]
								end
							end
						end

						reloaded_0_54(reloaded_69_8, reloaded_69_9, nil, 0, 128, 128 * (iter_69_0 / 2 - 1), iter_69_0 == 4 and 128, iter_69_0 == 4)
					end
				end

				reloaded_68_1 = nil

				local reloaded_69_19 = reloaded_0_11(arg_68_3 / 8)

				if reloaded_0_67 then
					for iter_69_3 = 1, reloaded_69_19 do
						reloaded_69_8[iter_69_3] = reloaded_0_67(reloaded_69_8[iter_69_3])
					end
				else
					for iter_69_4 = 1, reloaded_69_19 do
						reloaded_69_8[iter_69_4] = reloaded_0_44(reloaded_69_9[iter_69_4]) .. reloaded_0_44(reloaded_69_8[iter_69_4])
					end
				end

				reloaded_68_4 = reloaded_0_6(reloaded_0_7(reloaded_0_2(reloaded_69_8, "", 1, reloaded_69_19), "(..)(..)(..)(..)(..)(..)(..)(..)", "%8%7%6%5%4%3%2%1"), 1, arg_68_3 * 2)
			end

			return reloaded_68_4
		end
	end

	if reloaded_68_0 > 0 then
		arg_68_1 = arg_68_1 .. reloaded_0_5("\x00", 128 - reloaded_68_0)

		for iter_68_1 = 1, 4 do
			reloaded_68_9(arg_68_1)
		end
	end

	if arg_68_0 then
		return reloaded_68_9(arg_68_0)()
	else
		return reloaded_68_9
	end
end

local function reloaded_0_175(arg_70_0, arg_70_1, arg_70_2, arg_70_3, arg_70_4, arg_70_5, arg_70_6, arg_70_7)
	local reloaded_70_0 = 2^(arg_70_3 / 2) - 1
	local reloaded_70_1
	local reloaded_70_2

	if arg_70_4 == -1 then
		arg_70_4 = reloaded_0_16
		reloaded_70_1 = reloaded_0_10(reloaded_70_0)
		reloaded_70_2 = true
	else
		if arg_70_4 < 0 then
			arg_70_4 = -1 * arg_70_4
			reloaded_70_2 = true
		end

		reloaded_70_1 = reloaded_0_10(arg_70_4)

		if reloaded_70_0 <= reloaded_70_1 then
			error("Requested digest is too long.  BLAKE2X" .. arg_70_1 .. " finite digest is limited by (2^" .. reloaded_0_10(arg_70_3 / 2) .. ")-2 bytes.  Hint: you can generate infinite digest.", 2)
		end
	end

	arg_70_7 = arg_70_7 or ""

	if arg_70_7 ~= "" then
		reloaded_0_170(arg_70_7, arg_70_1)
	end

	local reloaded_70_3 = arg_70_0(nil, arg_70_6, arg_70_7, nil, reloaded_70_1)
	local reloaded_70_4

	local function reloaded_70_5(arg_71_0)
		if arg_71_0 then
			if reloaded_70_3 then
				reloaded_70_3(arg_71_0)

				return reloaded_70_5
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_70_3 then
				local reloaded_71_0, reloaded_71_1 = reloaded_70_3()
				local reloaded_71_2

				reloaded_71_2, reloaded_70_3 = reloaded_71_1 or 8

				local function reloaded_71_3(arg_72_0)
					local reloaded_72_0 = reloaded_0_12(arg_70_3, arg_70_4 - arg_72_0 * arg_70_3)

					if reloaded_72_0 <= 0 then
						return ""
					end

					for iter_72_0 = 1, reloaded_71_2 do
						arg_70_2[iter_72_0] = reloaded_71_0[iter_72_0]
					end

					for iter_72_1 = reloaded_71_2 + 1, 2 * reloaded_71_2 do
						arg_70_2[iter_72_1] = 0
					end

					return arg_70_0(nil, nil, arg_70_7, reloaded_72_0, reloaded_70_1, reloaded_0_10(arg_72_0))
				end

				local reloaded_71_4 = {}

				if reloaded_70_2 then
					local reloaded_71_5 = 0
					local reloaded_71_6 = arg_70_3 * 4294967296
					local reloaded_71_7
					local reloaded_71_8

					function reloaded_70_4(arg_73_0, arg_73_1)
						if arg_73_0 == "seek" then
							reloaded_71_5 = arg_73_1 % reloaded_71_6
						else
							local reloaded_73_0 = arg_73_0 or 1
							local reloaded_73_1 = 0

							while reloaded_73_0 > 0 do
								local reloaded_73_2 = reloaded_71_5 % arg_70_3
								local reloaded_73_3 = (reloaded_71_5 - reloaded_73_2) / arg_70_3
								local reloaded_73_4 = reloaded_0_12(reloaded_73_0, arg_70_3 - reloaded_73_2)

								if reloaded_71_7 ~= reloaded_73_3 then
									reloaded_71_7 = reloaded_73_3
									reloaded_71_8 = reloaded_71_3(reloaded_73_3)
								end

								reloaded_73_1 = reloaded_73_1 + 1
								reloaded_71_4[reloaded_73_1] = reloaded_0_6(reloaded_71_8, reloaded_73_2 * 2 + 1, (reloaded_73_2 + reloaded_73_4) * 2)
								reloaded_73_0 = reloaded_73_0 - reloaded_73_4
								reloaded_71_5 = (reloaded_71_5 + reloaded_73_4) % reloaded_71_6
							end

							return reloaded_0_2(reloaded_71_4, "", 1, reloaded_73_1)
						end
					end
				else
					for iter_71_0 = 1, reloaded_0_11(arg_70_4 / arg_70_3) do
						reloaded_71_4[iter_71_0] = reloaded_71_3(iter_71_0 - 1)
					end

					reloaded_70_4 = reloaded_0_2(reloaded_71_4)
				end
			end

			return reloaded_70_4
		end
	end

	if arg_70_5 then
		return reloaded_70_5(arg_70_5)()
	else
		return reloaded_70_5
	end
end

local function reloaded_0_176(arg_74_0, arg_74_1, arg_74_2, arg_74_3)
	return reloaded_0_175(reloaded_0_171, "s", reloaded_0_71, 32, arg_74_0, arg_74_1, arg_74_2, arg_74_3)
end

local function reloaded_0_177(arg_75_0, arg_75_1, arg_75_2, arg_75_3)
	return reloaded_0_175(reloaded_0_172, "b", reloaded_0_70, 64, arg_75_0, arg_75_1, arg_75_2, arg_75_3)
end

local function reloaded_0_178(arg_76_0, arg_76_1, arg_76_2, arg_76_3, arg_76_4, arg_76_5)
	arg_76_1 = arg_76_1 or ""
	arg_76_2 = arg_76_2 or 32
	arg_76_3 = arg_76_3 or 0

	if arg_76_1 == "" then
		arg_76_4 = arg_76_4 or reloaded_0_59
	else
		local reloaded_76_0 = #arg_76_1

		if reloaded_76_0 > 32 then
			error("BLAKE3 key length must not exceed 32 bytes", 2)
		end

		arg_76_1 = arg_76_1 .. reloaded_0_5("\x00", 32 - reloaded_76_0)
		arg_76_4 = {}

		for iter_76_0 = 1, 8 do
			local reloaded_76_1, reloaded_76_2, reloaded_76_3, reloaded_76_4 = reloaded_0_3(arg_76_1, 4 * iter_76_0 - 3, 4 * iter_76_0)

			arg_76_4[iter_76_0] = ((reloaded_76_4 * 256 + reloaded_76_3) * 256 + reloaded_76_2) * 256 + reloaded_76_1
		end

		arg_76_3 = arg_76_3 + 16
	end

	local reloaded_76_5 = ""
	local reloaded_76_6 = {}
	local reloaded_76_7 = 0
	local reloaded_76_8 = 0
	local reloaded_76_9 = 0
	local reloaded_76_10 = {}
	local reloaded_76_11 = arg_76_4
	local reloaded_76_12
	local reloaded_76_13
	local reloaded_76_14
	local reloaded_76_15
	local reloaded_76_16 = 3

	local function reloaded_76_17(arg_77_0, arg_77_1, arg_77_2)
		while arg_77_2 > 0 do
			local reloaded_77_0 = 1
			local reloaded_77_1 = 0
			local reloaded_77_2 = reloaded_76_6

			if reloaded_76_8 == 0 then
				reloaded_77_1 = 1
				reloaded_77_2, reloaded_76_11 = arg_76_4, reloaded_76_6
				reloaded_76_16 = 2
			elseif reloaded_76_8 == 15 then
				reloaded_77_1 = 2
				reloaded_76_16 = 3
				reloaded_76_11 = arg_76_4
			else
				reloaded_77_0 = reloaded_0_12(arg_77_2 / 64, 15 - reloaded_76_8)
			end

			local reloaded_77_3 = reloaded_77_0 * 64

			reloaded_0_55(arg_77_0, arg_77_1, reloaded_77_3, arg_76_3 + reloaded_77_1, reloaded_76_7, reloaded_77_2, reloaded_76_6)

			arg_77_1, arg_77_2 = arg_77_1 + reloaded_77_3, arg_77_2 - reloaded_77_3
			reloaded_76_8 = (reloaded_76_8 + reloaded_77_0) % 16

			if reloaded_76_8 == 0 then
				reloaded_76_7 = reloaded_76_7 + 1

				local reloaded_77_4 = 2

				while reloaded_76_7 % reloaded_77_4 == 0 do
					reloaded_77_4 = reloaded_77_4 * 2
					reloaded_76_9 = reloaded_76_9 - 8

					for iter_77_0 = 1, 8 do
						reloaded_0_71[iter_77_0] = reloaded_76_10[reloaded_76_9 + iter_77_0]
					end

					for iter_77_1 = 1, 8 do
						reloaded_0_71[iter_77_1 + 8] = reloaded_76_6[iter_77_1]
					end

					reloaded_0_55(nil, 0, 64, arg_76_3 + 4, 0, arg_76_4, reloaded_76_6)
				end

				for iter_77_2 = 1, 8 do
					reloaded_76_10[reloaded_76_9 + iter_77_2] = reloaded_76_6[iter_77_2]
				end

				reloaded_76_9 = reloaded_76_9 + 8
			end
		end
	end

	local function reloaded_76_18(arg_78_0)
		local reloaded_78_0 = reloaded_0_12(64, arg_76_2 - arg_78_0 * 64)

		if arg_78_0 < 0 or reloaded_78_0 <= 0 then
			return ""
		end

		if reloaded_76_13 then
			for iter_78_0 = 1, 16 do
				reloaded_0_71[iter_78_0] = reloaded_76_10[iter_78_0 + 16]
			end
		end

		reloaded_0_55(nil, 0, 64, reloaded_76_16, arg_78_0, reloaded_76_11, reloaded_76_10, reloaded_76_15, reloaded_76_12)

		if arg_76_5 then
			return reloaded_76_10
		end

		local reloaded_78_1 = reloaded_0_11(reloaded_78_0 / 4)

		for iter_78_1 = 1, reloaded_78_1 do
			reloaded_76_10[iter_78_1] = reloaded_0_44(reloaded_76_10[iter_78_1])
		end

		return reloaded_0_6(reloaded_0_7(reloaded_0_2(reloaded_76_10, "", 1, reloaded_78_1), "(..)(..)(..)(..)", "%4%3%2%1"), 1, reloaded_78_0 * 2)
	end

	local function reloaded_76_19(arg_79_0)
		if arg_79_0 then
			if reloaded_76_5 then
				local reloaded_79_0 = 0

				if reloaded_76_5 ~= "" and #reloaded_76_5 + #arg_79_0 > 64 then
					reloaded_79_0 = 64 - #reloaded_76_5

					reloaded_76_17(reloaded_76_5 .. reloaded_0_6(arg_79_0, 1, reloaded_79_0), 0, 64)

					reloaded_76_5 = ""
				end

				local reloaded_79_1 = #arg_79_0 - reloaded_79_0
				local reloaded_79_2 = reloaded_79_1 > 0 and (reloaded_79_1 - 1) % 64 + 1 or 0

				reloaded_76_17(arg_79_0, reloaded_79_0, reloaded_79_1 - reloaded_79_2)

				reloaded_76_5 = reloaded_76_5 .. reloaded_0_6(arg_79_0, #arg_79_0 + 1 - reloaded_79_2)

				return reloaded_76_19
			else
				error("Adding more chunks is not allowed after receiving the result", 2)
			end
		else
			if reloaded_76_5 then
				reloaded_76_12 = #reloaded_76_5
				reloaded_76_5 = reloaded_76_5 .. reloaded_0_5("\x00", 64 - #reloaded_76_5)

				if reloaded_0_71[0] then
					for iter_79_0 = 1, 16 do
						local reloaded_79_3, reloaded_79_4, reloaded_79_5, reloaded_79_6 = reloaded_0_3(reloaded_76_5, 4 * iter_79_0 - 3, 4 * iter_79_0)

						reloaded_0_71[iter_79_0] = reloaded_0_36(reloaded_0_38(reloaded_79_6, 24), reloaded_0_38(reloaded_79_5, 16), reloaded_0_38(reloaded_79_4, 8), reloaded_79_3)
					end
				else
					for iter_79_1 = 1, 16 do
						local reloaded_79_7, reloaded_79_8, reloaded_79_9, reloaded_79_10 = reloaded_0_3(reloaded_76_5, 4 * iter_79_1 - 3, 4 * iter_79_1)

						reloaded_0_71[iter_79_1] = ((reloaded_79_10 * 256 + reloaded_79_9) * 256 + reloaded_79_8) * 256 + reloaded_79_7
					end
				end

				reloaded_76_5 = nil

				for iter_79_2 = reloaded_76_9 - 8, 0, -8 do
					reloaded_0_55(nil, 0, 64, arg_76_3 + reloaded_76_16, reloaded_76_7, reloaded_76_11, reloaded_76_6, nil, reloaded_76_12)

					reloaded_76_7, reloaded_76_12, reloaded_76_11, reloaded_76_16 = 0, 64, arg_76_4, 4

					for iter_79_3 = 1, 8 do
						reloaded_0_71[iter_79_3] = reloaded_76_10[iter_79_2 + iter_79_3]
					end

					for iter_79_4 = 1, 8 do
						reloaded_0_71[iter_79_4 + 8] = reloaded_76_6[iter_79_4]
					end
				end

				reloaded_76_16 = arg_76_3 + reloaded_76_16 + 8

				if arg_76_2 < 0 then
					if arg_76_2 == -1 then
						arg_76_2 = reloaded_0_16
					else
						arg_76_2 = -1 * arg_76_2
					end

					reloaded_76_13 = true

					for iter_79_5 = 1, 16 do
						reloaded_76_10[iter_79_5 + 16] = reloaded_0_71[iter_79_5]
					end
				end

				arg_76_2 = reloaded_0_12(9007199254740992, arg_76_2)
				reloaded_76_15 = arg_76_2 > 32

				if reloaded_76_13 then
					local reloaded_79_11 = 0
					local reloaded_79_12
					local reloaded_79_13

					function reloaded_76_14(arg_80_0, arg_80_1)
						if arg_80_0 == "seek" then
							reloaded_79_11 = arg_80_1 * 1
						else
							local reloaded_80_0 = arg_80_0 or 1
							local reloaded_80_1 = 32

							while reloaded_80_0 > 0 do
								local reloaded_80_2 = reloaded_79_11 % 64
								local reloaded_80_3 = (reloaded_79_11 - reloaded_80_2) / 64
								local reloaded_80_4 = reloaded_0_12(reloaded_80_0, 64 - reloaded_80_2)

								if reloaded_79_12 ~= reloaded_80_3 then
									reloaded_79_12 = reloaded_80_3
									reloaded_79_13 = reloaded_76_18(reloaded_80_3)
								end

								reloaded_80_1 = reloaded_80_1 + 1
								reloaded_76_10[reloaded_80_1] = reloaded_0_6(reloaded_79_13, reloaded_80_2 * 2 + 1, (reloaded_80_2 + reloaded_80_4) * 2)
								reloaded_80_0 = reloaded_80_0 - reloaded_80_4
								reloaded_79_11 = reloaded_79_11 + reloaded_80_4
							end

							return reloaded_0_2(reloaded_76_10, "", 33, reloaded_80_1)
						end
					end
				elseif arg_76_2 <= 64 then
					reloaded_76_14 = reloaded_76_18(0)
				else
					local reloaded_79_14 = reloaded_0_11(arg_76_2 / 64) - 1

					for iter_79_6 = 0, reloaded_79_14 do
						reloaded_76_10[33 + iter_79_6] = reloaded_76_18(iter_79_6)
					end

					reloaded_76_14 = reloaded_0_2(reloaded_76_10, "", 33, 33 + reloaded_79_14)
				end
			end

			return reloaded_76_14
		end
	end

	if arg_76_0 then
		return reloaded_76_19(arg_76_0)()
	else
		return reloaded_76_19
	end
end

local function reloaded_0_179(arg_81_0, arg_81_1, arg_81_2)
	if reloaded_0_15(arg_81_1) ~= "string" then
		error("'context_string' parameter must be a Lua string", 2)
	end

	local reloaded_81_0 = reloaded_0_178(arg_81_1, nil, nil, 32, nil, true)

	return reloaded_0_178(arg_81_0, nil, arg_81_2, 64, reloaded_81_0)
end

local reloaded_0_180 = {
	md5 = reloaded_0_153,
	sha1 = reloaded_0_154,
	sha224 = function(arg_82_0)
		return reloaded_0_151(224, arg_82_0)
	end,
	sha256 = function(arg_83_0)
		return reloaded_0_151(256, arg_83_0)
	end,
	sha512_224 = function(arg_84_0)
		return reloaded_0_152(224, arg_84_0)
	end,
	sha512_256 = function(arg_85_0)
		return reloaded_0_152(256, arg_85_0)
	end,
	sha384 = function(arg_86_0)
		return reloaded_0_152(384, arg_86_0)
	end,
	sha512 = function(arg_87_0)
		return reloaded_0_152(512, arg_87_0)
	end,
	sha3_224 = function(arg_88_0)
		return reloaded_0_155(144, 28, false, arg_88_0)
	end,
	sha3_256 = function(arg_89_0)
		return reloaded_0_155(136, 32, false, arg_89_0)
	end,
	sha3_384 = function(arg_90_0)
		return reloaded_0_155(104, 48, false, arg_90_0)
	end,
	sha3_512 = function(arg_91_0)
		return reloaded_0_155(72, 64, false, arg_91_0)
	end,
	shake128 = function(arg_92_0, arg_92_1)
		return reloaded_0_155(168, arg_92_0, true, arg_92_1)
	end,
	shake256 = function(arg_93_0, arg_93_1)
		return reloaded_0_155(136, arg_93_0, true, arg_93_1)
	end,
	hmac = reloaded_0_169,
	hex_to_bin = reloaded_0_160,
	bin_to_hex = reloaded_0_161,
	base64_to_bin = reloaded_0_166,
	bin_to_base64 = reloaded_0_165,
	hex2bin = reloaded_0_160,
	bin2hex = reloaded_0_161,
	base642bin = reloaded_0_166,
	bin2base64 = reloaded_0_165,
	blake2b = reloaded_0_172,
	blake2s = reloaded_0_171,
	blake2bp = reloaded_0_174,
	blake2sp = reloaded_0_173,
	blake2xb = reloaded_0_177,
	blake2xs = reloaded_0_176,
	blake2 = reloaded_0_172,
	blake2b_160 = function(arg_94_0, arg_94_1, arg_94_2)
		return reloaded_0_172(arg_94_0, arg_94_1, arg_94_2, 20)
	end,
	blake2b_256 = function(arg_95_0, arg_95_1, arg_95_2)
		return reloaded_0_172(arg_95_0, arg_95_1, arg_95_2, 32)
	end,
	blake2b_384 = function(arg_96_0, arg_96_1, arg_96_2)
		return reloaded_0_172(arg_96_0, arg_96_1, arg_96_2, 48)
	end,
	blake2b_512 = reloaded_0_172,
	blake2s_128 = function(arg_97_0, arg_97_1, arg_97_2)
		return reloaded_0_171(arg_97_0, arg_97_1, arg_97_2, 16)
	end,
	blake2s_160 = function(arg_98_0, arg_98_1, arg_98_2)
		return reloaded_0_171(arg_98_0, arg_98_1, arg_98_2, 20)
	end,
	blake2s_224 = function(arg_99_0, arg_99_1, arg_99_2)
		return reloaded_0_171(arg_99_0, arg_99_1, arg_99_2, 28)
	end,
	blake2s_256 = reloaded_0_171,
	blake3 = reloaded_0_178,
	blake3_derive_key = reloaded_0_179
}

reloaded_0_167 = {
	[reloaded_0_180.md5] = 64,
	[reloaded_0_180.sha1] = 64,
	[reloaded_0_180.sha224] = 64,
	[reloaded_0_180.sha256] = 64,
	[reloaded_0_180.sha512_224] = 128,
	[reloaded_0_180.sha512_256] = 128,
	[reloaded_0_180.sha384] = 128,
	[reloaded_0_180.sha512] = 128,
	[reloaded_0_180.sha3_224] = 144,
	[reloaded_0_180.sha3_256] = 136,
	[reloaded_0_180.sha3_384] = 104,
	[reloaded_0_180.sha3_512] = 72
}

return reloaded_0_180
