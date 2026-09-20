local reloaded_0_0 = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298
}
local reloaded_0_1 = {
	blocksize = 64
}
local reloaded_0_2 = {
	get_key_xord = function(arg_1_0, arg_1_1, arg_1_2)
		local reloaded_1_0 = {}

		for iter_1_0 = 1, #arg_1_0 do
			reloaded_1_0[iter_1_0] = string.char(bit.bxor(arg_1_1, arg_1_0:byte(iter_1_0, iter_1_0)))
		end

		return table.concat(reloaded_1_0) .. string.rep(string.char(arg_1_1), arg_1_2 - #arg_1_0)
	end,
	string_tohex = function(arg_2_0)
		return (arg_2_0:gsub(".", function(arg_3_0)
			return string.format("%02x", string.byte(arg_3_0))
		end))
	end,
	num2s = function(arg_4_0, arg_4_1)
		local reloaded_4_0 = ""

		for iter_4_0 = 1, arg_4_1 do
			local reloaded_4_1 = arg_4_0 % 256

			reloaded_4_0 = string.char(reloaded_4_1) .. reloaded_4_0
			arg_4_0 = (arg_4_0 - reloaded_4_1) / 256
		end

		return reloaded_4_0
	end,
	s232num = function(arg_5_0, arg_5_1)
		local reloaded_5_0 = 0

		for iter_5_0 = arg_5_1, arg_5_1 + 3 do
			reloaded_5_0 = reloaded_5_0 * 256 + string.byte(arg_5_0, iter_5_0)
		end

		return reloaded_5_0
	end
}

function reloaded_0_1.preproc(arg_6_0, arg_6_1)
	local reloaded_6_0 = 64 - (arg_6_1 + 9) % 64

	arg_6_1 = reloaded_0_2.num2s(8 * arg_6_1, 8)
	arg_6_0 = arg_6_0 .. "\x80" .. string.rep("\x00", reloaded_6_0) .. arg_6_1

	assert(#arg_6_0 % 64 == 0)

	return arg_6_0
end

function reloaded_0_1.initH256(arg_7_0)
	arg_7_0[1] = 1779033703
	arg_7_0[2] = 3144134277
	arg_7_0[3] = 1013904242
	arg_7_0[4] = 2773480762
	arg_7_0[5] = 1359893119
	arg_7_0[6] = 2600822924
	arg_7_0[7] = 528734635
	arg_7_0[8] = 1541459225

	return arg_7_0
end

function reloaded_0_1.digestblock(arg_8_0, arg_8_1, arg_8_2)
	local reloaded_8_0 = {}

	for iter_8_0 = 1, 16 do
		reloaded_8_0[iter_8_0] = reloaded_0_2.s232num(arg_8_0, arg_8_1 + (iter_8_0 - 1) * 4)
	end

	for iter_8_1 = 17, 64 do
		local reloaded_8_1 = reloaded_8_0[iter_8_1 - 15]
		local reloaded_8_2 = bit.bxor(bit.ror(reloaded_8_1, 7), bit.ror(reloaded_8_1, 18), bit.rshift(reloaded_8_1, 3))
		local reloaded_8_3 = reloaded_8_0[iter_8_1 - 2]

		reloaded_8_0[iter_8_1] = reloaded_8_0[iter_8_1 - 16] + reloaded_8_2 + reloaded_8_0[iter_8_1 - 7] + bit.bxor(bit.ror(reloaded_8_3, 17), bit.ror(reloaded_8_3, 19), bit.rshift(reloaded_8_3, 10))
	end

	local reloaded_8_4 = arg_8_2[1]
	local reloaded_8_5 = arg_8_2[2]
	local reloaded_8_6 = arg_8_2[3]
	local reloaded_8_7 = arg_8_2[4]
	local reloaded_8_8 = arg_8_2[5]
	local reloaded_8_9 = arg_8_2[6]
	local reloaded_8_10 = arg_8_2[7]
	local reloaded_8_11 = arg_8_2[8]

	for iter_8_2 = 1, 64 do
		local reloaded_8_12 = bit.bxor(bit.ror(reloaded_8_4, 2), bit.ror(reloaded_8_4, 13), bit.ror(reloaded_8_4, 22)) + bit.bxor(bit.band(reloaded_8_4, reloaded_8_5), bit.band(reloaded_8_4, reloaded_8_6), bit.band(reloaded_8_5, reloaded_8_6))
		local reloaded_8_13 = bit.bxor(bit.ror(reloaded_8_8, 6), bit.ror(reloaded_8_8, 11), bit.ror(reloaded_8_8, 25))
		local reloaded_8_14 = bit.bxor(bit.band(reloaded_8_8, reloaded_8_9), bit.band(bit.bnot(reloaded_8_8), reloaded_8_10))
		local reloaded_8_15 = reloaded_8_11 + reloaded_8_13 + reloaded_8_14 + reloaded_0_0[iter_8_2] + reloaded_8_0[iter_8_2]

		reloaded_8_11, reloaded_8_10, reloaded_8_9, reloaded_8_8, reloaded_8_7, reloaded_8_6, reloaded_8_5, reloaded_8_4 = reloaded_8_10, reloaded_8_9, reloaded_8_8, reloaded_8_7 + reloaded_8_15, reloaded_8_6, reloaded_8_5, reloaded_8_4, reloaded_8_15 + reloaded_8_12
	end

	arg_8_2[1] = bit.band(arg_8_2[1] + reloaded_8_4, 4294967295)
	arg_8_2[2] = bit.band(arg_8_2[2] + reloaded_8_5, 4294967295)
	arg_8_2[3] = bit.band(arg_8_2[3] + reloaded_8_6, 4294967295)
	arg_8_2[4] = bit.band(arg_8_2[4] + reloaded_8_7, 4294967295)
	arg_8_2[5] = bit.band(arg_8_2[5] + reloaded_8_8, 4294967295)
	arg_8_2[6] = bit.band(arg_8_2[6] + reloaded_8_9, 4294967295)
	arg_8_2[7] = bit.band(arg_8_2[7] + reloaded_8_10, 4294967295)
	arg_8_2[8] = bit.band(arg_8_2[8] + reloaded_8_11, 4294967295)
end

local function reloaded_0_3(arg_9_0)
	return arg_9_0:gsub("..", function(arg_10_0)
		return string.char(tonumber(arg_10_0, 16))
	end)
end

function reloaded_0_1.sha256(arg_11_0)
	arg_11_0 = reloaded_0_1.preproc(arg_11_0, #arg_11_0)

	local reloaded_11_0 = reloaded_0_1.initH256({})

	for iter_11_0 = 1, #arg_11_0, 64 do
		reloaded_0_1.digestblock(arg_11_0, iter_11_0, reloaded_11_0)
	end

	return reloaded_0_2.string_tohex(reloaded_0_2.num2s(reloaded_11_0[1], 4) .. reloaded_0_2.num2s(reloaded_11_0[2], 4) .. reloaded_0_2.num2s(reloaded_11_0[3], 4) .. reloaded_0_2.num2s(reloaded_11_0[4], 4) .. reloaded_0_2.num2s(reloaded_11_0[5], 4) .. reloaded_0_2.num2s(reloaded_11_0[6], 4) .. reloaded_0_2.num2s(reloaded_11_0[7], 4) .. reloaded_0_2.num2s(reloaded_11_0[8], 4))
end

function reloaded_0_1.sha256_binary(arg_12_0)
	return reloaded_0_3(reloaded_0_1.sha256(arg_12_0))
end

function reloaded_0_1.hmac_sha256(arg_13_0, arg_13_1)
	assert(type(arg_13_0) == "string", "Key passed to hmac_sha256 should be a string")
	assert(type(arg_13_1) == "string", "Text passed to hmac_sha256 should be a string")

	if #arg_13_0 > reloaded_0_1.blocksize then
		arg_13_0 = reloaded_0_1.sha256_binary(arg_13_0)
	end

	local reloaded_13_0 = reloaded_0_2.get_key_xord(arg_13_0, 54, reloaded_0_1.blocksize)
	local reloaded_13_1 = reloaded_0_2.get_key_xord(arg_13_0, 92, reloaded_0_1.blocksize)

	return reloaded_0_1.sha256(reloaded_13_1 .. reloaded_0_1.sha256_binary(reloaded_13_0 .. arg_13_1))
end

return reloaded_0_1
