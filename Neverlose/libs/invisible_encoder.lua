local reloaded_0_0 = error
local reloaded_0_1 = ipairs
local reloaded_0_2 = string
local reloaded_0_3 = table
local reloaded_0_4 = unpack
local reloaded_0_5 = print
local reloaded_0_6 = bit or bit32

if reloaded_0_6 == nil then
	reloaded_0_6 = {}

	local reloaded_0_7 = 4294967296
	local reloaded_0_8 = reloaded_0_7 - 1

	function reloaded_0_6.bxor(arg_1_0, arg_1_1)
		local reloaded_1_0 = 1
		local reloaded_1_1 = 0

		while arg_1_0 > 0 and arg_1_1 > 0 do
			local reloaded_1_2 = arg_1_0 % 2
			local reloaded_1_3 = arg_1_1 % 2

			if reloaded_1_2 ~= reloaded_1_3 then
				reloaded_1_1 = reloaded_1_1 + reloaded_1_0
			end

			arg_1_0, arg_1_1, reloaded_1_0 = (arg_1_0 - reloaded_1_2) / 2, (arg_1_1 - reloaded_1_3) / 2, reloaded_1_0 * 2
		end

		if arg_1_0 < arg_1_1 then
			arg_1_0 = arg_1_1
		end

		while arg_1_0 > 0 do
			local reloaded_1_4 = arg_1_0 % 2

			if reloaded_1_4 > 0 then
				reloaded_1_1 = reloaded_1_1 + reloaded_1_0
			end

			arg_1_0, reloaded_1_0 = (arg_1_0 - reloaded_1_4) / 2, reloaded_1_0 * 2
		end

		return reloaded_1_1
	end

	function reloaded_0_6.band(arg_2_0, arg_2_1)
		return (arg_2_0 + arg_2_1 - reloaded_0_6.bxor(arg_2_0, arg_2_1)) / 2
	end

	function reloaded_0_6.bor(arg_3_0, arg_3_1)
		return reloaded_0_8 - reloaded_0_6.band(reloaded_0_8 - arg_3_0, reloaded_0_8 - arg_3_1)
	end

	function reloaded_0_6.lshift(arg_4_0, arg_4_1)
		if arg_4_1 < 0 then
			return reloaded_0_6.rshift(arg_4_0, -arg_4_1)
		end

		return arg_4_0 * 2^arg_4_1 % 4294967296
	end

	function reloaded_0_6.rshift(arg_5_0, arg_5_1)
		if arg_5_1 < 0 then
			return reloaded_0_6.lshift(arg_5_0, -arg_5_1)
		end

		return math.floor(arg_5_0 % 4294967296 / 2^arg_5_1)
	end
end

local reloaded_0_9 = utf8

if reloaded_0_9 == nil then
	reloaded_0_9 = {
		char = function(...)
			local reloaded_6_0 = {}

			for iter_6_0, iter_6_1 in reloaded_0_1({
				...
			}) do
				if iter_6_1 < 0 or iter_6_1 > 1114111 then
					reloaded_0_0("bad argument #" .. iter_6_0 .. " to char (out of range)", 2)
				end

				local reloaded_6_1
				local reloaded_6_2
				local reloaded_6_3
				local reloaded_6_4

				if iter_6_1 < 128 then
					reloaded_0_3.insert(reloaded_6_0, reloaded_0_2.char(iter_6_1))
				elseif iter_6_1 < 2048 then
					local reloaded_6_5 = reloaded_0_6.bor(192, reloaded_0_6.band(reloaded_0_6.rshift(iter_6_1, 6), 31))
					local reloaded_6_6 = reloaded_0_6.bor(128, reloaded_0_6.band(iter_6_1, 63))

					reloaded_0_3.insert(reloaded_6_0, reloaded_0_2.char(reloaded_6_5, reloaded_6_6))
				elseif iter_6_1 < 65536 then
					local reloaded_6_7 = reloaded_0_6.bor(224, reloaded_0_6.band(reloaded_0_6.rshift(iter_6_1, 12), 15))
					local reloaded_6_8 = reloaded_0_6.bor(128, reloaded_0_6.band(reloaded_0_6.rshift(iter_6_1, 6), 63))
					local reloaded_6_9 = reloaded_0_6.bor(128, reloaded_0_6.band(iter_6_1, 63))

					reloaded_0_3.insert(reloaded_6_0, reloaded_0_2.char(reloaded_6_7, reloaded_6_8, reloaded_6_9))
				else
					local reloaded_6_10 = reloaded_0_6.bor(240, reloaded_0_6.band(reloaded_0_6.rshift(iter_6_1, 18), 7))
					local reloaded_6_11 = reloaded_0_6.bor(128, reloaded_0_6.band(reloaded_0_6.rshift(iter_6_1, 12), 63))
					local reloaded_6_12 = reloaded_0_6.bor(128, reloaded_0_6.band(reloaded_0_6.rshift(iter_6_1, 6), 63))
					local reloaded_6_13 = reloaded_0_6.bor(128, reloaded_0_6.band(iter_6_1, 63))

					reloaded_0_3.insert(reloaded_6_0, reloaded_0_2.char(reloaded_6_10, reloaded_6_11, reloaded_6_12, reloaded_6_13))
				end
			end

			return reloaded_0_3.concat(reloaded_6_0, "")
		end
	}
end

local reloaded_0_10 = {
	StringToBytes = function(arg_7_0)
		local reloaded_7_0 = {
			arg_7_0:byte(1, -1)
		}

		for iter_7_0 = 1, #reloaded_7_0 do
			reloaded_7_0[iter_7_0] = reloaded_7_0[iter_7_0] + 12
		end

		return reloaded_0_3.concat(reloaded_7_0, "'")
	end,
	StringSplit = function(arg_8_0)
		local reloaded_8_0 = {}

		arg_8_0:gsub(".", function(arg_9_0)
			reloaded_8_0[#reloaded_8_0 + 1] = arg_9_0
		end)

		return reloaded_8_0
	end,
	SplitBytes = function(arg_10_0)
		local reloaded_10_0 = 0
		local reloaded_10_1 = {}

		arg_10_0 = arg_10_0:gsub("255'172", "")

		local reloaded_10_2 = ""

		for iter_10_0 in reloaded_0_2.gmatch(arg_10_0, "([^']+)") do
			if reloaded_10_0 == 1 then
				reloaded_10_0 = 0
				reloaded_10_2 = reloaded_10_2 .. "'" .. iter_10_0

				reloaded_0_3.insert(reloaded_10_1, reloaded_10_2)
			else
				reloaded_10_2 = iter_10_0
				reloaded_10_0 = reloaded_10_0 + 1
			end
		end

		return reloaded_10_1
	end,
	ToBytes = function(arg_11_0)
		return arg_11_0:gsub(".", function(arg_12_0)
			return "\\" .. arg_12_0:byte()
		end)
	end,
	ToString = function(arg_13_0)
		return (arg_13_0:gsub("\\(%d+)", function(arg_14_0)
			return arg_14_0:char()
		end):gsub("\\", ""))
	end
}
local reloaded_0_11 = {
	"\\",
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9"
}
local reloaded_0_12 = {
	917536,
	917537,
	917538,
	917539,
	917540,
	917541,
	917542,
	917543,
	917544,
	917545,
	917546
}
local reloaded_0_13 = {
	characters = {},
	reverse = {}
}

for iter_0_0, iter_0_1 in reloaded_0_1(reloaded_0_11) do
	reloaded_0_13.characters[iter_0_1] = reloaded_0_12[iter_0_0]

	local reloaded_0_14 = reloaded_0_10.StringToBytes(reloaded_0_9.char(reloaded_0_12[iter_0_0])):gsub("255'172'", "")

	reloaded_0_13.reverse[reloaded_0_14] = iter_0_1
end

return {
	encode = function(arg_15_0)
		arg_15_0 = reloaded_0_10.ToBytes(arg_15_0)

		local reloaded_15_0 = {}

		for iter_15_0, iter_15_1 in reloaded_0_1(reloaded_0_10.StringSplit(arg_15_0)) do
			reloaded_15_0[iter_15_0] = reloaded_0_9.char(reloaded_0_13.characters[iter_15_1])
		end

		return reloaded_0_3.concat(reloaded_15_0, "")
	end,
	decode = function(arg_16_0)
		local reloaded_16_0 = {}
		local reloaded_16_1 = reloaded_0_10.SplitBytes(reloaded_0_10.StringToBytes(arg_16_0))

		for iter_16_0, iter_16_1 in reloaded_0_1(reloaded_16_1) do
			reloaded_16_0[iter_16_0] = reloaded_0_13.reverse[iter_16_1]
		end

		return reloaded_0_10.ToString(reloaded_0_3.concat(reloaded_16_0, ""))
	end,
	helpers = reloaded_0_10
}
