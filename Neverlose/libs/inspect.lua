local reloaded_0_0 = {
	_DESCRIPTION = "human-readable representations of tables",
	_URL = "http://github.com/kikito/inspect.lua",
	_LICENSE = "\t\tMIT LICENSE\n\n\t\tCopyright (c) 2013 Enrique Garc\xC3\xADa Cota\n\n\t\tPermission is hereby granted, free of charge, to any person obtaining a\n\t\tcopy of this software and associated documentation files (the\n\t\t\"Software\"), to deal in the Software without restriction, including\n\t\twithout limitation the rights to use, copy, modify, merge, publish,\n\t\tdistribute, sublicense, and/or sell copies of the Software, and to\n\t\tpermit persons to whom the Software is furnished to do so, subject to\n\t\tthe following conditions:\n\n\t\tThe above copyright notice and this permission notice shall be included\n\t\tin all copies or substantial portions of the Software.\n\n\t\tTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n\t\tOR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n\t\tMERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n\t\tIN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n\t\tCLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n\t\tTORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n\t\tSOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\t",
	_VERSION = "inspect.lua 3.1.0"
}
local reloaded_0_1 = tostring

reloaded_0_0.KEY = setmetatable({}, {
	__tostring = function()
		return "inspect.KEY"
	end
})
reloaded_0_0.METATABLE = setmetatable({}, {
	__tostring = function()
		return "inspect.METATABLE"
	end
})

local function reloaded_0_2(arg_3_0)
	return next, arg_3_0, nil
end

local function reloaded_0_3(arg_4_0)
	if arg_4_0:match("\"") and not arg_4_0:match("'") then
		return "'" .. arg_4_0 .. "'"
	end

	return "\"" .. arg_4_0:gsub("\"", "\\\"") .. "\""
end

local reloaded_0_4 = {
	["\a"] = "\\a",
	["\r"] = "\\r",
	["\b"] = "\\b",
	["\f"] = "\\f",
	["\v"] = "\\v",
	["\n"] = "\\n",
	["\t"] = "\\t"
}
local reloaded_0_5 = {}

for iter_0_0 = 0, 31 do
	local reloaded_0_6 = string.char(iter_0_0)

	if not reloaded_0_4[reloaded_0_6] then
		reloaded_0_4[reloaded_0_6] = "\\" .. iter_0_0
		reloaded_0_5[reloaded_0_6] = string.format("\\%03d", iter_0_0)
	end
end

local function reloaded_0_7(arg_5_0)
	return (arg_5_0:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", reloaded_0_5):gsub("%c", reloaded_0_4))
end

local function reloaded_0_8(arg_6_0)
	return type(arg_6_0) == "string" and arg_6_0:match("^[_%a][_%a%d]*$")
end

local function reloaded_0_9(arg_7_0, arg_7_1)
	return type(arg_7_0) == "number" and arg_7_0 >= 1 and arg_7_0 <= arg_7_1 and math.floor(arg_7_0) == arg_7_0
end

local reloaded_0_10 = {
	table = 4,
	["function"] = 5,
	userdata = 6,
	thread = 7,
	string = 3,
	number = 1,
	boolean = 2
}

local function reloaded_0_11(arg_8_0, arg_8_1)
	local reloaded_8_0 = type(arg_8_0)
	local reloaded_8_1 = type(arg_8_1)

	if reloaded_8_0 == reloaded_8_1 and (reloaded_8_0 == "string" or reloaded_8_0 == "number") then
		return arg_8_0 < arg_8_1
	end

	local reloaded_8_2 = reloaded_0_10[reloaded_8_0]
	local reloaded_8_3 = reloaded_0_10[reloaded_8_1]

	if reloaded_8_2 and reloaded_8_3 then
		return reloaded_0_10[reloaded_8_0] < reloaded_0_10[reloaded_8_1]
	elseif reloaded_8_2 then
		return true
	elseif reloaded_8_3 then
		return false
	end

	return reloaded_8_0 < reloaded_8_1
end

local function reloaded_0_12(arg_9_0)
	local reloaded_9_0 = 1
	local reloaded_9_1 = rawget(arg_9_0, reloaded_9_0)

	while reloaded_9_1 ~= nil do
		reloaded_9_0 = reloaded_9_0 + 1
		reloaded_9_1 = rawget(arg_9_0, reloaded_9_0)
	end

	return reloaded_9_0 - 1
end

local function reloaded_0_13(arg_10_0)
	local reloaded_10_0 = {}
	local reloaded_10_1 = 0
	local reloaded_10_2 = reloaded_0_12(arg_10_0)

	for iter_10_0, iter_10_1 in reloaded_0_2(arg_10_0) do
		if not reloaded_0_9(iter_10_0, reloaded_10_2) then
			reloaded_10_1 = reloaded_10_1 + 1
			reloaded_10_0[reloaded_10_1] = iter_10_0
		end
	end

	table.sort(reloaded_10_0, reloaded_0_11)

	return reloaded_10_0, reloaded_10_1, reloaded_10_2
end

local function reloaded_0_14(arg_11_0, arg_11_1)
	arg_11_1 = arg_11_1 or {}

	if type(arg_11_0) == "table" then
		if not arg_11_1[arg_11_0] then
			arg_11_1[arg_11_0] = 1

			for iter_11_0, iter_11_1 in reloaded_0_2(arg_11_0) do
				reloaded_0_14(iter_11_0, arg_11_1)
				reloaded_0_14(iter_11_1, arg_11_1)
			end

			reloaded_0_14(getmetatable(arg_11_0), arg_11_1)
		else
			arg_11_1[arg_11_0] = arg_11_1[arg_11_0] + 1
		end
	end

	return arg_11_1
end

local function reloaded_0_15(arg_12_0)
	local reloaded_12_0 = {}
	local reloaded_12_1 = #arg_12_0

	for iter_12_0 = 1, reloaded_12_1 do
		reloaded_12_0[iter_12_0] = arg_12_0[iter_12_0]
	end

	return reloaded_12_0, reloaded_12_1
end

local function reloaded_0_16(arg_13_0, ...)
	local reloaded_13_0 = {
		...
	}
	local reloaded_13_1, reloaded_13_2 = reloaded_0_15(arg_13_0)

	for iter_13_0 = 1, #reloaded_13_0 do
		reloaded_13_1[reloaded_13_2 + iter_13_0] = reloaded_13_0[iter_13_0]
	end

	return reloaded_13_1
end

local function reloaded_0_17(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if arg_14_1 == nil then
		return nil
	end

	if arg_14_3[arg_14_1] then
		return arg_14_3[arg_14_1]
	end

	local reloaded_14_0 = arg_14_0(arg_14_1, arg_14_2)

	if type(reloaded_14_0) == "table" then
		local reloaded_14_1 = {}

		arg_14_3[arg_14_1] = reloaded_14_1

		local reloaded_14_2

		for iter_14_0, iter_14_1 in reloaded_0_2(reloaded_14_0) do
			local reloaded_14_3 = reloaded_0_17(arg_14_0, iter_14_0, reloaded_0_16(arg_14_2, iter_14_0, reloaded_0_0.KEY), arg_14_3)

			if reloaded_14_3 ~= nil then
				reloaded_14_1[reloaded_14_3] = reloaded_0_17(arg_14_0, iter_14_1, reloaded_0_16(arg_14_2, reloaded_14_3), arg_14_3)
			end
		end

		local reloaded_14_4 = reloaded_0_17(arg_14_0, getmetatable(reloaded_14_0), reloaded_0_16(arg_14_2, reloaded_0_0.METATABLE), arg_14_3)

		if type(reloaded_14_4) ~= "table" then
			reloaded_14_4 = nil
		end

		setmetatable(reloaded_14_1, reloaded_14_4)

		reloaded_14_0 = reloaded_14_1
	end

	return reloaded_14_0
end

local reloaded_0_18 = {}
local reloaded_0_19 = {
	__index = reloaded_0_18
}

function reloaded_0_18.puts(arg_15_0, ...)
	local reloaded_15_0 = {
		...
	}
	local reloaded_15_1 = arg_15_0.buffer
	local reloaded_15_2 = #reloaded_15_1

	for iter_15_0 = 1, #reloaded_15_0 do
		reloaded_15_2 = reloaded_15_2 + 1
		reloaded_15_1[reloaded_15_2] = reloaded_15_0[iter_15_0]
	end
end

function reloaded_0_18.down(arg_16_0, arg_16_1)
	arg_16_0.level = arg_16_0.level + 1

	arg_16_1()

	arg_16_0.level = arg_16_0.level - 1
end

function reloaded_0_18.tabify(arg_17_0)
	arg_17_0:puts(arg_17_0.newline, string.rep(arg_17_0.indent, arg_17_0.level))
end

function reloaded_0_18.alreadyVisited(arg_18_0, arg_18_1)
	return arg_18_0.ids[arg_18_1] ~= nil
end

function reloaded_0_18.getId(arg_19_0, arg_19_1)
	local reloaded_19_0 = arg_19_0.ids[arg_19_1]

	if not reloaded_19_0 then
		local reloaded_19_1 = type(arg_19_1)

		reloaded_19_0 = (arg_19_0.maxIds[reloaded_19_1] or 0) + 1
		arg_19_0.maxIds[reloaded_19_1] = reloaded_19_0
		arg_19_0.ids[arg_19_1] = reloaded_19_0
	end

	return reloaded_0_1(reloaded_19_0)
end

function reloaded_0_18.putKey(arg_20_0, arg_20_1)
	if reloaded_0_8(arg_20_1) then
		return arg_20_0:puts(arg_20_1)
	end

	arg_20_0:puts("[")
	arg_20_0:putValue(arg_20_1)
	arg_20_0:puts("]")
end

function reloaded_0_18.putTable(arg_21_0, arg_21_1)
	if arg_21_1 == reloaded_0_0.KEY or arg_21_1 == reloaded_0_0.METATABLE then
		arg_21_0:puts(reloaded_0_1(arg_21_1))
	elseif arg_21_0:alreadyVisited(arg_21_1) then
		arg_21_0:puts("<table ", arg_21_0:getId(arg_21_1), ">")
	elseif arg_21_0.level >= arg_21_0.depth then
		arg_21_0:puts("{...}")
	else
		if arg_21_0.tableAppearances[arg_21_1] > 1 then
			arg_21_0:puts("<", arg_21_0:getId(arg_21_1), ">")
		end

		local reloaded_21_0, reloaded_21_1, reloaded_21_2 = reloaded_0_13(arg_21_1)
		local reloaded_21_3 = getmetatable(arg_21_1)

		arg_21_0:puts("{")
		arg_21_0:down(function()
			local reloaded_22_0 = 0

			for iter_22_0 = 1, reloaded_21_2 do
				if reloaded_22_0 > 0 then
					arg_21_0:puts(",")
				end

				arg_21_0:puts(" ")
				arg_21_0:putValue(arg_21_1[iter_22_0])

				reloaded_22_0 = reloaded_22_0 + 1
			end

			for iter_22_1 = 1, reloaded_21_1 do
				local reloaded_22_1 = reloaded_21_0[iter_22_1]

				if reloaded_22_0 > 0 then
					arg_21_0:puts(",")
				end

				arg_21_0:tabify()
				arg_21_0:putKey(reloaded_22_1)
				arg_21_0:puts(" = ")
				arg_21_0:putValue(arg_21_1[reloaded_22_1])

				reloaded_22_0 = reloaded_22_0 + 1
			end

			if type(reloaded_21_3) == "table" then
				if reloaded_22_0 > 0 then
					arg_21_0:puts(",")
				end

				arg_21_0:tabify()
				arg_21_0:puts("<metatable> = ")
				arg_21_0:putValue(reloaded_21_3)
			end
		end)

		if reloaded_21_1 > 0 or type(reloaded_21_3) == "table" then
			arg_21_0:tabify()
		elseif reloaded_21_2 > 0 then
			arg_21_0:puts(" ")
		end

		arg_21_0:puts("}")
	end
end

function reloaded_0_18.putValue(arg_23_0, arg_23_1)
	local reloaded_23_0 = type(arg_23_1)

	if reloaded_23_0 == "string" then
		arg_23_0:puts(reloaded_0_3(reloaded_0_7(arg_23_1)))
	elseif reloaded_23_0 == "number" or reloaded_23_0 == "boolean" or reloaded_23_0 == "nil" or reloaded_23_0 == "cdata" or reloaded_23_0 == "ctype" then
		arg_23_0:puts(reloaded_0_1(arg_23_1))
	elseif reloaded_23_0 == "table" then
		arg_23_0:putTable(arg_23_1)
	else
		arg_23_0:puts("<", reloaded_23_0, " ", arg_23_0:getId(arg_23_1), ">")
	end
end

function reloaded_0_0.inspect(arg_24_0, arg_24_1)
	arg_24_1 = arg_24_1 or {}

	local reloaded_24_0 = arg_24_1.depth or math.huge
	local reloaded_24_1 = arg_24_1.newline or "\n"
	local reloaded_24_2 = arg_24_1.indent or "\t"
	local reloaded_24_3 = arg_24_1.process

	if reloaded_24_3 then
		arg_24_0 = reloaded_0_17(reloaded_24_3, arg_24_0, {}, {})
	end

	local reloaded_24_4 = setmetatable({
		level = 0,
		depth = reloaded_24_0,
		buffer = {},
		ids = {},
		maxIds = {},
		newline = reloaded_24_1,
		indent = reloaded_24_2,
		tableAppearances = reloaded_0_14(arg_24_0)
	}, reloaded_0_19)

	reloaded_24_4:putValue(arg_24_0)

	return table.concat(reloaded_24_4.buffer)
end

setmetatable(reloaded_0_0, {
	__call = function(arg_25_0, ...)
		return reloaded_0_0.inspect(...)
	end
})

return reloaded_0_0
