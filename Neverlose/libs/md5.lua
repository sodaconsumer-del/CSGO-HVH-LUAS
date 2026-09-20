local reloaded_0_0 = string.char
local reloaded_0_1 = string.byte
local reloaded_0_2 = string.format
local reloaded_0_3 = string.rep
local reloaded_0_4 = string.sub
local reloaded_0_5 = bit.bor
local reloaded_0_6 = bit.band
local reloaded_0_7 = bit.bnot
local reloaded_0_8 = bit.bxor
local reloaded_0_9 = bit.rshift
local reloaded_0_10 = bit.lshift

local function reloaded_0_11(arg_1_0)
	local function reloaded_1_0(arg_2_0)
		return reloaded_0_0(reloaded_0_6(reloaded_0_9(arg_1_0, arg_2_0), 255))
	end

	return reloaded_1_0(0) .. reloaded_1_0(8) .. reloaded_1_0(16) .. reloaded_1_0(24)
end

local function reloaded_0_12(arg_3_0)
	local reloaded_3_0 = 0

	for iter_3_0 = 1, #arg_3_0 do
		reloaded_3_0 = reloaded_3_0 * 256 + reloaded_0_1(arg_3_0, iter_3_0)
	end

	return reloaded_3_0
end

local function reloaded_0_13(arg_4_0)
	local reloaded_4_0 = 0

	for iter_4_0 = #arg_4_0, 1, -1 do
		reloaded_4_0 = reloaded_4_0 * 256 + reloaded_0_1(arg_4_0, iter_4_0)
	end

	return reloaded_4_0
end

local function reloaded_0_14(arg_5_0, ...)
	local reloaded_5_0 = 1
	local reloaded_5_1 = {}
	local reloaded_5_2 = {
		...
	}

	for iter_5_0 = 1, #reloaded_5_2 do
		table.insert(reloaded_5_1, reloaded_0_13(reloaded_0_4(arg_5_0, reloaded_5_0, reloaded_5_0 + reloaded_5_2[iter_5_0] - 1)))

		reloaded_5_0 = reloaded_5_0 + reloaded_5_2[iter_5_0]
	end

	return reloaded_5_1
end

local reloaded_0_15 = {
	3614090360,
	3905402710,
	606105819,
	3250441966,
	4118548399,
	1200080426,
	2821735955,
	4249261313,
	1770035416,
	2336552879,
	4294925233,
	2304563134,
	1804603682,
	4254626195,
	2792965006,
	1236535329,
	4129170786,
	3225465664,
	643717713,
	3921069994,
	3593408605,
	38016083,
	3634488961,
	3889429448,
	568446438,
	3275163606,
	4107603335,
	1163531501,
	2850285829,
	4243563512,
	1735328473,
	2368359562,
	4294588738,
	2272392833,
	1839030562,
	4259657740,
	2763975236,
	1272893353,
	4139469664,
	3200236656,
	681279174,
	3936430074,
	3572445317,
	76029189,
	3654602809,
	3873151461,
	530742520,
	3299628645,
	4096336452,
	1126891415,
	2878612391,
	4237533241,
	1700485571,
	2399980690,
	4293915773,
	2240044497,
	1873313359,
	4264355552,
	2734768916,
	1309151649,
	4149444226,
	3174756917,
	718787259,
	3951481745,
	1732584193,
	4023233417,
	2562383102,
	271733878
}

local function reloaded_0_16(arg_6_0, arg_6_1, arg_6_2)
	return reloaded_0_5(reloaded_0_6(arg_6_0, arg_6_1), reloaded_0_6(-arg_6_0 - 1, arg_6_2))
end

local function reloaded_0_17(arg_7_0, arg_7_1, arg_7_2)
	return reloaded_0_5(reloaded_0_6(arg_7_0, arg_7_2), reloaded_0_6(arg_7_1, -arg_7_2 - 1))
end

local function reloaded_0_18(arg_8_0, arg_8_1, arg_8_2)
	return reloaded_0_8(arg_8_0, reloaded_0_8(arg_8_1, arg_8_2))
end

local function reloaded_0_19(arg_9_0, arg_9_1, arg_9_2)
	return reloaded_0_8(arg_9_1, reloaded_0_5(arg_9_0, -arg_9_2 - 1))
end

local function reloaded_0_20(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6, arg_10_7)
	arg_10_1 = reloaded_0_6(arg_10_1 + arg_10_0(arg_10_2, arg_10_3, arg_10_4) + arg_10_5 + arg_10_7, 4294967295)

	return reloaded_0_5(reloaded_0_10(reloaded_0_6(arg_10_1, reloaded_0_9(4294967295, arg_10_6)), arg_10_6), reloaded_0_9(arg_10_1, 32 - arg_10_6)) + arg_10_2
end

local function reloaded_0_21(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local reloaded_11_0 = arg_11_0
	local reloaded_11_1 = arg_11_1
	local reloaded_11_2 = arg_11_2
	local reloaded_11_3 = arg_11_3
	local reloaded_11_4 = reloaded_0_15
	local reloaded_11_5 = reloaded_0_20(reloaded_0_16, reloaded_11_0, reloaded_11_1, reloaded_11_2, reloaded_11_3, arg_11_4[0], 7, reloaded_11_4[1])
	local reloaded_11_6 = reloaded_0_20(reloaded_0_16, reloaded_11_3, reloaded_11_5, reloaded_11_1, reloaded_11_2, arg_11_4[1], 12, reloaded_11_4[2])
	local reloaded_11_7 = reloaded_0_20(reloaded_0_16, reloaded_11_2, reloaded_11_6, reloaded_11_5, reloaded_11_1, arg_11_4[2], 17, reloaded_11_4[3])
	local reloaded_11_8 = reloaded_0_20(reloaded_0_16, reloaded_11_1, reloaded_11_7, reloaded_11_6, reloaded_11_5, arg_11_4[3], 22, reloaded_11_4[4])
	local reloaded_11_9 = reloaded_0_20(reloaded_0_16, reloaded_11_5, reloaded_11_8, reloaded_11_7, reloaded_11_6, arg_11_4[4], 7, reloaded_11_4[5])
	local reloaded_11_10 = reloaded_0_20(reloaded_0_16, reloaded_11_6, reloaded_11_9, reloaded_11_8, reloaded_11_7, arg_11_4[5], 12, reloaded_11_4[6])
	local reloaded_11_11 = reloaded_0_20(reloaded_0_16, reloaded_11_7, reloaded_11_10, reloaded_11_9, reloaded_11_8, arg_11_4[6], 17, reloaded_11_4[7])
	local reloaded_11_12 = reloaded_0_20(reloaded_0_16, reloaded_11_8, reloaded_11_11, reloaded_11_10, reloaded_11_9, arg_11_4[7], 22, reloaded_11_4[8])
	local reloaded_11_13 = reloaded_0_20(reloaded_0_16, reloaded_11_9, reloaded_11_12, reloaded_11_11, reloaded_11_10, arg_11_4[8], 7, reloaded_11_4[9])
	local reloaded_11_14 = reloaded_0_20(reloaded_0_16, reloaded_11_10, reloaded_11_13, reloaded_11_12, reloaded_11_11, arg_11_4[9], 12, reloaded_11_4[10])
	local reloaded_11_15 = reloaded_0_20(reloaded_0_16, reloaded_11_11, reloaded_11_14, reloaded_11_13, reloaded_11_12, arg_11_4[10], 17, reloaded_11_4[11])
	local reloaded_11_16 = reloaded_0_20(reloaded_0_16, reloaded_11_12, reloaded_11_15, reloaded_11_14, reloaded_11_13, arg_11_4[11], 22, reloaded_11_4[12])
	local reloaded_11_17 = reloaded_0_20(reloaded_0_16, reloaded_11_13, reloaded_11_16, reloaded_11_15, reloaded_11_14, arg_11_4[12], 7, reloaded_11_4[13])
	local reloaded_11_18 = reloaded_0_20(reloaded_0_16, reloaded_11_14, reloaded_11_17, reloaded_11_16, reloaded_11_15, arg_11_4[13], 12, reloaded_11_4[14])
	local reloaded_11_19 = reloaded_0_20(reloaded_0_16, reloaded_11_15, reloaded_11_18, reloaded_11_17, reloaded_11_16, arg_11_4[14], 17, reloaded_11_4[15])
	local reloaded_11_20 = reloaded_0_20(reloaded_0_16, reloaded_11_16, reloaded_11_19, reloaded_11_18, reloaded_11_17, arg_11_4[15], 22, reloaded_11_4[16])
	local reloaded_11_21 = reloaded_0_20(reloaded_0_17, reloaded_11_17, reloaded_11_20, reloaded_11_19, reloaded_11_18, arg_11_4[1], 5, reloaded_11_4[17])
	local reloaded_11_22 = reloaded_0_20(reloaded_0_17, reloaded_11_18, reloaded_11_21, reloaded_11_20, reloaded_11_19, arg_11_4[6], 9, reloaded_11_4[18])
	local reloaded_11_23 = reloaded_0_20(reloaded_0_17, reloaded_11_19, reloaded_11_22, reloaded_11_21, reloaded_11_20, arg_11_4[11], 14, reloaded_11_4[19])
	local reloaded_11_24 = reloaded_0_20(reloaded_0_17, reloaded_11_20, reloaded_11_23, reloaded_11_22, reloaded_11_21, arg_11_4[0], 20, reloaded_11_4[20])
	local reloaded_11_25 = reloaded_0_20(reloaded_0_17, reloaded_11_21, reloaded_11_24, reloaded_11_23, reloaded_11_22, arg_11_4[5], 5, reloaded_11_4[21])
	local reloaded_11_26 = reloaded_0_20(reloaded_0_17, reloaded_11_22, reloaded_11_25, reloaded_11_24, reloaded_11_23, arg_11_4[10], 9, reloaded_11_4[22])
	local reloaded_11_27 = reloaded_0_20(reloaded_0_17, reloaded_11_23, reloaded_11_26, reloaded_11_25, reloaded_11_24, arg_11_4[15], 14, reloaded_11_4[23])
	local reloaded_11_28 = reloaded_0_20(reloaded_0_17, reloaded_11_24, reloaded_11_27, reloaded_11_26, reloaded_11_25, arg_11_4[4], 20, reloaded_11_4[24])
	local reloaded_11_29 = reloaded_0_20(reloaded_0_17, reloaded_11_25, reloaded_11_28, reloaded_11_27, reloaded_11_26, arg_11_4[9], 5, reloaded_11_4[25])
	local reloaded_11_30 = reloaded_0_20(reloaded_0_17, reloaded_11_26, reloaded_11_29, reloaded_11_28, reloaded_11_27, arg_11_4[14], 9, reloaded_11_4[26])
	local reloaded_11_31 = reloaded_0_20(reloaded_0_17, reloaded_11_27, reloaded_11_30, reloaded_11_29, reloaded_11_28, arg_11_4[3], 14, reloaded_11_4[27])
	local reloaded_11_32 = reloaded_0_20(reloaded_0_17, reloaded_11_28, reloaded_11_31, reloaded_11_30, reloaded_11_29, arg_11_4[8], 20, reloaded_11_4[28])
	local reloaded_11_33 = reloaded_0_20(reloaded_0_17, reloaded_11_29, reloaded_11_32, reloaded_11_31, reloaded_11_30, arg_11_4[13], 5, reloaded_11_4[29])
	local reloaded_11_34 = reloaded_0_20(reloaded_0_17, reloaded_11_30, reloaded_11_33, reloaded_11_32, reloaded_11_31, arg_11_4[2], 9, reloaded_11_4[30])
	local reloaded_11_35 = reloaded_0_20(reloaded_0_17, reloaded_11_31, reloaded_11_34, reloaded_11_33, reloaded_11_32, arg_11_4[7], 14, reloaded_11_4[31])
	local reloaded_11_36 = reloaded_0_20(reloaded_0_17, reloaded_11_32, reloaded_11_35, reloaded_11_34, reloaded_11_33, arg_11_4[12], 20, reloaded_11_4[32])
	local reloaded_11_37 = reloaded_0_20(reloaded_0_18, reloaded_11_33, reloaded_11_36, reloaded_11_35, reloaded_11_34, arg_11_4[5], 4, reloaded_11_4[33])
	local reloaded_11_38 = reloaded_0_20(reloaded_0_18, reloaded_11_34, reloaded_11_37, reloaded_11_36, reloaded_11_35, arg_11_4[8], 11, reloaded_11_4[34])
	local reloaded_11_39 = reloaded_0_20(reloaded_0_18, reloaded_11_35, reloaded_11_38, reloaded_11_37, reloaded_11_36, arg_11_4[11], 16, reloaded_11_4[35])
	local reloaded_11_40 = reloaded_0_20(reloaded_0_18, reloaded_11_36, reloaded_11_39, reloaded_11_38, reloaded_11_37, arg_11_4[14], 23, reloaded_11_4[36])
	local reloaded_11_41 = reloaded_0_20(reloaded_0_18, reloaded_11_37, reloaded_11_40, reloaded_11_39, reloaded_11_38, arg_11_4[1], 4, reloaded_11_4[37])
	local reloaded_11_42 = reloaded_0_20(reloaded_0_18, reloaded_11_38, reloaded_11_41, reloaded_11_40, reloaded_11_39, arg_11_4[4], 11, reloaded_11_4[38])
	local reloaded_11_43 = reloaded_0_20(reloaded_0_18, reloaded_11_39, reloaded_11_42, reloaded_11_41, reloaded_11_40, arg_11_4[7], 16, reloaded_11_4[39])
	local reloaded_11_44 = reloaded_0_20(reloaded_0_18, reloaded_11_40, reloaded_11_43, reloaded_11_42, reloaded_11_41, arg_11_4[10], 23, reloaded_11_4[40])
	local reloaded_11_45 = reloaded_0_20(reloaded_0_18, reloaded_11_41, reloaded_11_44, reloaded_11_43, reloaded_11_42, arg_11_4[13], 4, reloaded_11_4[41])
	local reloaded_11_46 = reloaded_0_20(reloaded_0_18, reloaded_11_42, reloaded_11_45, reloaded_11_44, reloaded_11_43, arg_11_4[0], 11, reloaded_11_4[42])
	local reloaded_11_47 = reloaded_0_20(reloaded_0_18, reloaded_11_43, reloaded_11_46, reloaded_11_45, reloaded_11_44, arg_11_4[3], 16, reloaded_11_4[43])
	local reloaded_11_48 = reloaded_0_20(reloaded_0_18, reloaded_11_44, reloaded_11_47, reloaded_11_46, reloaded_11_45, arg_11_4[6], 23, reloaded_11_4[44])
	local reloaded_11_49 = reloaded_0_20(reloaded_0_18, reloaded_11_45, reloaded_11_48, reloaded_11_47, reloaded_11_46, arg_11_4[9], 4, reloaded_11_4[45])
	local reloaded_11_50 = reloaded_0_20(reloaded_0_18, reloaded_11_46, reloaded_11_49, reloaded_11_48, reloaded_11_47, arg_11_4[12], 11, reloaded_11_4[46])
	local reloaded_11_51 = reloaded_0_20(reloaded_0_18, reloaded_11_47, reloaded_11_50, reloaded_11_49, reloaded_11_48, arg_11_4[15], 16, reloaded_11_4[47])
	local reloaded_11_52 = reloaded_0_20(reloaded_0_18, reloaded_11_48, reloaded_11_51, reloaded_11_50, reloaded_11_49, arg_11_4[2], 23, reloaded_11_4[48])
	local reloaded_11_53 = reloaded_0_20(reloaded_0_19, reloaded_11_49, reloaded_11_52, reloaded_11_51, reloaded_11_50, arg_11_4[0], 6, reloaded_11_4[49])
	local reloaded_11_54 = reloaded_0_20(reloaded_0_19, reloaded_11_50, reloaded_11_53, reloaded_11_52, reloaded_11_51, arg_11_4[7], 10, reloaded_11_4[50])
	local reloaded_11_55 = reloaded_0_20(reloaded_0_19, reloaded_11_51, reloaded_11_54, reloaded_11_53, reloaded_11_52, arg_11_4[14], 15, reloaded_11_4[51])
	local reloaded_11_56 = reloaded_0_20(reloaded_0_19, reloaded_11_52, reloaded_11_55, reloaded_11_54, reloaded_11_53, arg_11_4[5], 21, reloaded_11_4[52])
	local reloaded_11_57 = reloaded_0_20(reloaded_0_19, reloaded_11_53, reloaded_11_56, reloaded_11_55, reloaded_11_54, arg_11_4[12], 6, reloaded_11_4[53])
	local reloaded_11_58 = reloaded_0_20(reloaded_0_19, reloaded_11_54, reloaded_11_57, reloaded_11_56, reloaded_11_55, arg_11_4[3], 10, reloaded_11_4[54])
	local reloaded_11_59 = reloaded_0_20(reloaded_0_19, reloaded_11_55, reloaded_11_58, reloaded_11_57, reloaded_11_56, arg_11_4[10], 15, reloaded_11_4[55])
	local reloaded_11_60 = reloaded_0_20(reloaded_0_19, reloaded_11_56, reloaded_11_59, reloaded_11_58, reloaded_11_57, arg_11_4[1], 21, reloaded_11_4[56])
	local reloaded_11_61 = reloaded_0_20(reloaded_0_19, reloaded_11_57, reloaded_11_60, reloaded_11_59, reloaded_11_58, arg_11_4[8], 6, reloaded_11_4[57])
	local reloaded_11_62 = reloaded_0_20(reloaded_0_19, reloaded_11_58, reloaded_11_61, reloaded_11_60, reloaded_11_59, arg_11_4[15], 10, reloaded_11_4[58])
	local reloaded_11_63 = reloaded_0_20(reloaded_0_19, reloaded_11_59, reloaded_11_62, reloaded_11_61, reloaded_11_60, arg_11_4[6], 15, reloaded_11_4[59])
	local reloaded_11_64 = reloaded_0_20(reloaded_0_19, reloaded_11_60, reloaded_11_63, reloaded_11_62, reloaded_11_61, arg_11_4[13], 21, reloaded_11_4[60])
	local reloaded_11_65 = reloaded_0_20(reloaded_0_19, reloaded_11_61, reloaded_11_64, reloaded_11_63, reloaded_11_62, arg_11_4[4], 6, reloaded_11_4[61])
	local reloaded_11_66 = reloaded_0_20(reloaded_0_19, reloaded_11_62, reloaded_11_65, reloaded_11_64, reloaded_11_63, arg_11_4[11], 10, reloaded_11_4[62])
	local reloaded_11_67 = reloaded_0_20(reloaded_0_19, reloaded_11_63, reloaded_11_66, reloaded_11_65, reloaded_11_64, arg_11_4[2], 15, reloaded_11_4[63])
	local reloaded_11_68 = reloaded_0_20(reloaded_0_19, reloaded_11_64, reloaded_11_67, reloaded_11_66, reloaded_11_65, arg_11_4[9], 21, reloaded_11_4[64])

	return reloaded_0_6(arg_11_0 + reloaded_11_65, 4294967295), reloaded_0_6(arg_11_1 + reloaded_11_68, 4294967295), reloaded_0_6(arg_11_2 + reloaded_11_67, 4294967295), reloaded_0_6(arg_11_3 + reloaded_11_66, 4294967295)
end

local function reloaded_0_22(arg_12_0, arg_12_1)
	arg_12_0.pos = arg_12_0.pos + #arg_12_1
	arg_12_1 = arg_12_0.buf .. arg_12_1

	for iter_12_0 = 1, #arg_12_1 - 63, 64 do
		local reloaded_12_0 = reloaded_0_14(reloaded_0_4(arg_12_1, iter_12_0, iter_12_0 + 63), 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)

		assert(#reloaded_12_0 == 16)

		reloaded_12_0[0] = table.remove(reloaded_12_0, 1)
		arg_12_0.a, arg_12_0.b, arg_12_0.c, arg_12_0.d = reloaded_0_21(arg_12_0.a, arg_12_0.b, arg_12_0.c, arg_12_0.d, reloaded_12_0)
	end

	arg_12_0.buf = reloaded_0_4(arg_12_1, math.floor(#arg_12_1 / 64) * 64 + 1, #arg_12_1)

	return arg_12_0
end

local function reloaded_0_23(arg_13_0)
	local reloaded_13_0 = arg_13_0.pos
	local reloaded_13_1 = 56 - reloaded_13_0 % 64

	if reloaded_13_0 % 64 > 56 then
		reloaded_13_1 = reloaded_13_1 + 64
	end

	if reloaded_13_1 == 0 then
		reloaded_13_1 = 64
	end

	local reloaded_13_2 = reloaded_0_0(128) .. reloaded_0_3(reloaded_0_0(0), reloaded_13_1 - 1) .. reloaded_0_11(reloaded_0_6(8 * reloaded_13_0, 4294967295)) .. reloaded_0_11(math.floor(reloaded_13_0 / 536870912))

	reloaded_0_22(arg_13_0, reloaded_13_2)
	assert(arg_13_0.pos % 64 == 0)

	return reloaded_0_11(arg_13_0.a) .. reloaded_0_11(arg_13_0.b) .. reloaded_0_11(arg_13_0.c) .. reloaded_0_11(arg_13_0.d)
end

local reloaded_0_24 = {
	new = function()
		return {
			pos = 0,
			buf = "",
			a = reloaded_0_15[65],
			b = reloaded_0_15[66],
			c = reloaded_0_15[67],
			d = reloaded_0_15[68],
			update = reloaded_0_22,
			finish = reloaded_0_23
		}
	end,
	tohex = function(arg_15_0)
		return reloaded_0_2("%08x%08x%08x%08x", reloaded_0_12(reloaded_0_4(arg_15_0, 1, 4)), reloaded_0_12(reloaded_0_4(arg_15_0, 5, 8)), reloaded_0_12(reloaded_0_4(arg_15_0, 9, 12)), reloaded_0_12(reloaded_0_4(arg_15_0, 13, 16)))
	end
}

function reloaded_0_24.sum(arg_16_0)
	return reloaded_0_24.new():update(arg_16_0):finish()
end

function reloaded_0_24.sumhexa(arg_17_0)
	return reloaded_0_24.tohex(reloaded_0_24.sum(arg_17_0))
end

return reloaded_0_24
