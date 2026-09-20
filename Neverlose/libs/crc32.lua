local reloaded_0_0 = {
	_TYPE = "module",
	_VERSION = "0.3.20111128",
	_NAME = "crc32"
}
local reloaded_0_1 = type
local reloaded_0_2 = require
local reloaded_0_3 = setmetatable
local reloaded_0_4 = bit.bxor
local reloaded_0_5 = bit.bnot
local reloaded_0_6 = bit.band
local reloaded_0_7 = bit.rshift
local reloaded_0_8 = 3988292384
local reloaded_0_9 = (function(arg_1_0)
	local reloaded_1_0 = {}
	local reloaded_1_1 = reloaded_0_3({}, reloaded_1_0)

	function reloaded_1_0.__index(arg_2_0, arg_2_1)
		local reloaded_2_0 = arg_1_0(arg_2_1)

		reloaded_1_1[arg_2_1] = reloaded_2_0

		return reloaded_2_0
	end

	return reloaded_1_1
end)(function(arg_3_0)
	local reloaded_3_0 = arg_3_0

	for iter_3_0 = 1, 8 do
		local reloaded_3_1 = reloaded_0_6(reloaded_3_0, 1)

		reloaded_3_0 = reloaded_0_7(reloaded_3_0, 1)

		if reloaded_3_1 == 1 then
			reloaded_3_0 = reloaded_0_4(reloaded_3_0, reloaded_0_8)
		end
	end

	return reloaded_3_0
end)

function reloaded_0_0.crc32_byte(arg_4_0, arg_4_1)
	arg_4_1 = reloaded_0_5(arg_4_1 or 0)

	local reloaded_4_0 = reloaded_0_7(arg_4_1, 8)
	local reloaded_4_1 = reloaded_0_9[reloaded_0_4(arg_4_1 % 256, arg_4_0)]

	return reloaded_0_5(reloaded_0_4(reloaded_4_0, reloaded_4_1))
end

local reloaded_0_10 = reloaded_0_0.crc32_byte

function reloaded_0_0.crc32_string(arg_5_0, arg_5_1)
	arg_5_1 = arg_5_1 or 0

	for iter_5_0 = 1, #arg_5_0 do
		arg_5_1 = reloaded_0_10(arg_5_0:byte(iter_5_0), arg_5_1)
	end

	return arg_5_1
end

local reloaded_0_11 = reloaded_0_0.crc32_string

function reloaded_0_0.crc32(arg_6_0, arg_6_1)
	if reloaded_0_1(arg_6_0) == "string" then
		return reloaded_0_11(arg_6_0, arg_6_1)
	else
		return reloaded_0_10(arg_6_0, arg_6_1)
	end
end

return reloaded_0_0
