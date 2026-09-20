local reloaded_0_0 = bit.band
local reloaded_0_1 = bit.lshift
local reloaded_0_2 = bit.rshift
local reloaded_0_3 = pcall
local reloaded_0_4 = error
local reloaded_0_5 = string.byte
local reloaded_0_6 = string.gsub
local reloaded_0_7 = string.dump
local reloaded_0_8 = type
local reloaded_0_9 = setmetatable
local reloaded_0_10 = string.char
local reloaded_0_11 = string.format
local reloaded_0_12 = string.sub
local reloaded_0_13 = table.concat
local reloaded_0_14 = tostring
local reloaded_0_15 = {
	{
		reloaded_0_8
	},
	{
		reloaded_0_14
	},
	{
		reloaded_0_12
	},
	{
		reloaded_0_6
	},
	{
		reloaded_0_5
	},
	{
		reloaded_0_10
	},
	{
		reloaded_0_13
	},
	{
		reloaded_0_9
	}
}

for iter_0_0 = 1, #reloaded_0_15 do
	local reloaded_0_16 = reloaded_0_15[iter_0_0]
end

local reloaded_0_17 = reloaded_0_9({}, {
	__call = function(arg_1_0, arg_1_1)
		local reloaded_1_0 = {}
		local reloaded_1_1 = {}
		local reloaded_1_2 = {
			reloaded_0_5(arg_1_1, 1, 65)
		}

		for iter_1_0 = 0, #reloaded_1_2 - 1 do
			local reloaded_1_3 = reloaded_1_2[iter_1_0 + 1]

			reloaded_1_0[iter_1_0], reloaded_1_1[reloaded_1_3] = reloaded_1_3, iter_1_0
		end

		return {
			reloaded_1_0,
			reloaded_1_1
		}
	end,
	__index = function(arg_2_0, arg_2_1)
		if reloaded_0_8(arg_2_1) ~= "string" or #arg_2_1 == 64 and #arg_2_1 == 65 then
			print_error("invalid alphabet: ", arg_2_1)

			return arg_2_0.base64
		end

		local reloaded_2_0 = arg_2_0(arg_2_1)

		arg_2_0[arg_2_1] = reloaded_2_0

		return reloaded_2_0
	end
})

reloaded_0_17.base64 = reloaded_0_17("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=")
reloaded_0_17.base64url = reloaded_0_17("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_")

local function reloaded_0_18(arg_3_0, arg_3_1, arg_3_2)
	return reloaded_0_0(reloaded_0_2(arg_3_0, arg_3_1), reloaded_0_1(1, arg_3_2) - 1)
end

local reloaded_0_19 = {
	encode = function(arg_4_0, arg_4_1)
		arg_4_0, arg_4_1 = reloaded_0_14(arg_4_0), reloaded_0_17[arg_4_1 or "base64"][1]

		local reloaded_4_0 = {}
		local reloaded_4_1 = {}
		local reloaded_4_2 = 1
		local reloaded_4_3 = #arg_4_0
		local reloaded_4_4 = reloaded_4_3 % 3

		for iter_4_0 = 1, reloaded_4_3 - reloaded_4_4, 3 do
			local reloaded_4_5, reloaded_4_6, reloaded_4_7 = reloaded_0_5(arg_4_0, iter_4_0, iter_4_0 + 2)
			local reloaded_4_8 = reloaded_4_5 * 65536 + reloaded_4_6 * 256 + reloaded_4_7
			local reloaded_4_9 = reloaded_4_1[reloaded_4_8]

			if not reloaded_4_9 then
				reloaded_4_9 = reloaded_0_10(arg_4_1[reloaded_0_18(reloaded_4_8, 18, 6)], arg_4_1[reloaded_0_18(reloaded_4_8, 12, 6)], arg_4_1[reloaded_0_18(reloaded_4_8, 6, 6)], arg_4_1[reloaded_0_18(reloaded_4_8, 0, 6)])
				reloaded_4_1[reloaded_4_8] = reloaded_4_9
			end

			reloaded_4_0[reloaded_4_2], reloaded_4_2 = reloaded_4_9, reloaded_4_2 + 1
		end

		if reloaded_4_4 == 2 then
			local reloaded_4_10, reloaded_4_11 = reloaded_0_5(arg_4_0, reloaded_4_3 - 1, reloaded_4_3)
			local reloaded_4_12 = reloaded_4_10 * 65536 + reloaded_4_11 * 256

			reloaded_4_0[reloaded_4_2] = reloaded_0_10(arg_4_1[reloaded_0_18(reloaded_4_12, 18, 6)], arg_4_1[reloaded_0_18(reloaded_4_12, 12, 6)], arg_4_1[reloaded_0_18(reloaded_4_12, 6, 6)], arg_4_1[64])
		elseif reloaded_4_4 == 1 then
			local reloaded_4_13 = reloaded_0_5(arg_4_0, reloaded_4_3) * 65536

			reloaded_4_0[reloaded_4_2] = reloaded_0_10(arg_4_1[reloaded_0_18(reloaded_4_13, 18, 6)], arg_4_1[reloaded_0_18(reloaded_4_13, 12, 6)], arg_4_1[64], arg_4_1[64])
		end

		return reloaded_0_13(reloaded_4_0)
	end,
	decode = function(arg_5_0, arg_5_1)
		if reloaded_0_8(arg_5_0) ~= "string" then
			reloaded_0_4("Not a string: " .. reloaded_0_14(arg_5_0), 2)
		end

		arg_5_1 = arg_5_1 or "base64"

		local reloaded_5_0 = reloaded_0_17[arg_5_1][2]
		local reloaded_5_1 = "[^%w%+%/%=]"

		if arg_5_1 ~= "base64" then
			local reloaded_5_2 = reloaded_0_17[arg_5_1][1]

			reloaded_5_1 = reloaded_0_11("[^%%w%%%s%%%s%%=]", reloaded_0_10(reloaded_5_2[62]), reloaded_0_10(reloaded_5_2[63]))
		end

		arg_5_0 = reloaded_0_6(arg_5_0, reloaded_5_1, "")

		local reloaded_5_3 = {}
		local reloaded_5_4 = {}
		local reloaded_5_5 = 1
		local reloaded_5_6 = #arg_5_0
		local reloaded_5_7 = reloaded_0_12(arg_5_0, -2) == "==" and 2 or reloaded_0_12(arg_5_0, -1) == "=" and 1 or 0

		for iter_5_0 = 1, reloaded_5_7 > 0 and reloaded_5_6 - 4 or reloaded_5_6, 4 do
			local reloaded_5_8, reloaded_5_9, reloaded_5_10, reloaded_5_11 = reloaded_0_5(arg_5_0, iter_5_0, iter_5_0 + 3)
			local reloaded_5_12 = reloaded_5_8 * 16777216 + reloaded_5_9 * 65536 + reloaded_5_10 * 256 + reloaded_5_11
			local reloaded_5_13 = reloaded_5_4[reloaded_5_12]

			if not reloaded_5_13 then
				local reloaded_5_14 = reloaded_5_0[reloaded_5_8] * 262144 + reloaded_5_0[reloaded_5_9] * 4096 + reloaded_5_0[reloaded_5_10] * 64 + reloaded_5_0[reloaded_5_11]

				reloaded_5_13 = reloaded_0_10(reloaded_0_18(reloaded_5_14, 16, 8), reloaded_0_18(reloaded_5_14, 8, 8), reloaded_0_18(reloaded_5_14, 0, 8))
				reloaded_5_4[reloaded_5_12] = reloaded_5_13
			end

			reloaded_5_3[reloaded_5_5], reloaded_5_5 = reloaded_5_13, reloaded_5_5 + 1
		end

		if reloaded_5_7 == 1 then
			local reloaded_5_15, reloaded_5_16, reloaded_5_17 = reloaded_0_5(arg_5_0, reloaded_5_6 - 3, reloaded_5_6 - 1)
			local reloaded_5_18 = reloaded_5_0[reloaded_5_15] * 262144 + reloaded_5_0[reloaded_5_16] * 4096 + reloaded_5_0[reloaded_5_17] * 64

			reloaded_5_3[reloaded_5_5] = reloaded_0_10(reloaded_0_18(reloaded_5_18, 16, 8), reloaded_0_18(reloaded_5_18, 8, 8))
		elseif reloaded_5_7 == 2 then
			local reloaded_5_19, reloaded_5_20 = reloaded_0_5(arg_5_0, reloaded_5_6 - 3, reloaded_5_6 - 2)
			local reloaded_5_21 = reloaded_5_0[reloaded_5_19] * 262144 + reloaded_5_0[reloaded_5_20] * 4096

			reloaded_5_3[reloaded_5_5] = reloaded_0_10(reloaded_0_18(reloaded_5_21, 16, 8))
		end

		return reloaded_0_13(reloaded_5_3)
	end
}

return reloaded_0_9({}, {
	__metatable = false,
	__index = reloaded_0_19,
	__newindex = {}
})
