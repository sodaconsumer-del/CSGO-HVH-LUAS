local reloaded_0_0 = {}

local function reloaded_0_1(arg_1_0)
	if type(arg_1_0) ~= "table" then
		return type(arg_1_0)
	end

	local reloaded_1_0 = 1

	for iter_1_0 in pairs(arg_1_0) do
		if arg_1_0[reloaded_1_0] ~= nil then
			reloaded_1_0 = reloaded_1_0 + 1
		else
			return "table"
		end
	end

	if reloaded_1_0 == 1 then
		return "table"
	else
		return "array"
	end
end

local function reloaded_0_2(arg_2_0)
	local reloaded_2_0 = {
		"\\",
		"\"",
		"/",
		"\b",
		"\f",
		"\n",
		"\r",
		"\t"
	}
	local reloaded_2_1 = {
		"\\",
		"\"",
		"/",
		"b",
		"f",
		"n",
		"r",
		"t"
	}

	for iter_2_0, iter_2_1 in ipairs(reloaded_2_0) do
		arg_2_0 = arg_2_0:gsub(iter_2_1, "\\" .. reloaded_2_1[iter_2_0])
	end

	return arg_2_0
end

local function reloaded_0_3(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_1 = arg_3_1 + #arg_3_0:match("^%s*", arg_3_1)

	if arg_3_0:sub(arg_3_1, arg_3_1) ~= arg_3_2 then
		if arg_3_3 then
			error("Expected " .. arg_3_2 .. " near position " .. arg_3_1)
		end

		return arg_3_1, false
	end

	return arg_3_1 + 1, true
end

local function reloaded_0_4(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2 = arg_4_2 or ""

	local reloaded_4_0 = "End of input found while parsing string."

	if arg_4_1 > #arg_4_0 then
		error(reloaded_4_0)
	end

	local reloaded_4_1 = arg_4_0:sub(arg_4_1, arg_4_1)

	if reloaded_4_1 == "\"" then
		return arg_4_2, arg_4_1 + 1
	end

	if reloaded_4_1 ~= "\\" then
		return reloaded_0_4(arg_4_0, arg_4_1 + 1, arg_4_2 .. reloaded_4_1)
	end

	local reloaded_4_2 = {
		f = "\f",
		b = "\b",
		t = "\t",
		n = "\n",
		r = "\r"
	}
	local reloaded_4_3 = arg_4_0:sub(arg_4_1 + 1, arg_4_1 + 1)

	if not reloaded_4_3 then
		error(reloaded_4_0)
	end

	return reloaded_0_4(arg_4_0, arg_4_1 + 2, arg_4_2 .. (reloaded_4_2[reloaded_4_3] or reloaded_4_3))
end

local function reloaded_0_5(arg_5_0, arg_5_1)
	local reloaded_5_0 = arg_5_0:match("^-?%d+%.?%d*[eE]?[+-]?%d*", arg_5_1)
	local reloaded_5_1 = tonumber(reloaded_5_0)

	if not reloaded_5_1 then
		error("Error parsing number at position " .. arg_5_1 .. ".")
	end

	return reloaded_5_1, arg_5_1 + #reloaded_5_0
end

function reloaded_0_0.stringify(arg_6_0, arg_6_1)
	local reloaded_6_0 = {}
	local reloaded_6_1 = reloaded_0_1(arg_6_0)

	if reloaded_6_1 == "array" then
		if arg_6_1 then
			error("Can't encode array as key.")
		end

		reloaded_6_0[#reloaded_6_0 + 1] = "["

		for iter_6_0, iter_6_1 in ipairs(arg_6_0) do
			if iter_6_0 > 1 then
				reloaded_6_0[#reloaded_6_0 + 1] = ", "
			end

			reloaded_6_0[#reloaded_6_0 + 1] = reloaded_0_0.stringify(iter_6_1)
		end

		reloaded_6_0[#reloaded_6_0 + 1] = "]"
	elseif reloaded_6_1 == "table" then
		if arg_6_1 then
			error("Can't encode table as key.")
		end

		reloaded_6_0[#reloaded_6_0 + 1] = "{"

		for iter_6_2, iter_6_3 in pairs(arg_6_0) do
			if #reloaded_6_0 > 1 then
				reloaded_6_0[#reloaded_6_0 + 1] = ", "
			end

			reloaded_6_0[#reloaded_6_0 + 1] = reloaded_0_0.stringify(iter_6_2, true)
			reloaded_6_0[#reloaded_6_0 + 1] = ":"
			reloaded_6_0[#reloaded_6_0 + 1] = reloaded_0_0.stringify(iter_6_3)
		end

		reloaded_6_0[#reloaded_6_0 + 1] = "}"
	elseif reloaded_6_1 == "string" then
		return "\"" .. reloaded_0_2(arg_6_0) .. "\""
	elseif reloaded_6_1 == "number" then
		if arg_6_1 then
			return "\"" .. tostring(arg_6_0) .. "\""
		end

		return tostring(arg_6_0)
	elseif reloaded_6_1 == "boolean" then
		return tostring(arg_6_0)
	elseif reloaded_6_1 == "nil" then
		return "null"
	else
		error("Unjsonifiable type: " .. reloaded_6_1 .. ".")
	end

	return table.concat(reloaded_6_0)
end

reloaded_0_0.null = {}

function reloaded_0_0.parse(arg_7_0, arg_7_1, arg_7_2)
	arg_7_1 = arg_7_1 or 1

	if arg_7_1 > #arg_7_0 then
		error("Reached unexpected end of input.")
	end

	local reloaded_7_0 = arg_7_1 + #arg_7_0:match("^%s*", arg_7_1)
	local reloaded_7_1 = arg_7_0:sub(reloaded_7_0, reloaded_7_0)

	if reloaded_7_1 == "{" then
		local reloaded_7_2 = {}
		local reloaded_7_3 = true
		local reloaded_7_4 = true

		reloaded_7_0 = reloaded_7_0 + 1

		while true do
			local reloaded_7_5

			reloaded_7_5, reloaded_7_0 = reloaded_0_0.parse(arg_7_0, reloaded_7_0, "}")

			if reloaded_7_5 == nil then
				return reloaded_7_2, reloaded_7_0
			end

			if not reloaded_7_4 then
				error("Comma missing between object items.")
			end

			reloaded_7_0 = reloaded_0_3(arg_7_0, reloaded_7_0, ":", true)
			reloaded_7_2[reloaded_7_5], reloaded_7_0 = reloaded_0_0.parse(arg_7_0, reloaded_7_0)
			reloaded_7_0, reloaded_7_4 = reloaded_0_3(arg_7_0, reloaded_7_0, ",")
		end
	elseif reloaded_7_1 == "[" then
		local reloaded_7_6 = {}
		local reloaded_7_7 = true
		local reloaded_7_8 = true

		reloaded_7_0 = reloaded_7_0 + 1

		while true do
			local reloaded_7_9

			reloaded_7_9, reloaded_7_0 = reloaded_0_0.parse(arg_7_0, reloaded_7_0, "]")

			if reloaded_7_9 == nil then
				return reloaded_7_6, reloaded_7_0
			end

			if not reloaded_7_8 then
				error("Comma missing between array items.")
			end

			reloaded_7_6[#reloaded_7_6 + 1] = reloaded_7_9
			reloaded_7_0, reloaded_7_8 = reloaded_0_3(arg_7_0, reloaded_7_0, ",")
		end
	elseif reloaded_7_1 == "\"" then
		return reloaded_0_4(arg_7_0, reloaded_7_0 + 1)
	elseif reloaded_7_1 == "-" or reloaded_7_1:match("%d") then
		return reloaded_0_5(arg_7_0, reloaded_7_0)
	elseif reloaded_7_1 == arg_7_2 then
		return nil, reloaded_7_0 + 1
	else
		local reloaded_7_10 = {
			["true"] = true,
			["false"] = false,
			null = reloaded_0_0.null
		}

		for iter_7_0, iter_7_1 in pairs(reloaded_7_10) do
			local reloaded_7_11 = reloaded_7_0 + #iter_7_0 - 1

			if arg_7_0:sub(reloaded_7_0, reloaded_7_11) == iter_7_0 then
				return iter_7_1, reloaded_7_11 + 1
			end
		end

		local reloaded_7_12 = "position " .. reloaded_7_0 .. ": " .. arg_7_0:sub(reloaded_7_0, reloaded_7_0 + 10)

		error("Invalid json syntax starting at " .. reloaded_7_12)
	end
end

return reloaded_0_0
