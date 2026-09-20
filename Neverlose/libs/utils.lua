local reloaded_0_0 = require("neverlose/inspect")

local function reloaded_0_1(arg_1_0)
	local reloaded_1_0 = type(arg_1_0)
	local reloaded_1_1

	if reloaded_1_0 == "table" then
		reloaded_1_1 = {}

		for iter_1_0, iter_1_1 in next, arg_1_0 do
			reloaded_1_1[reloaded_0_1(iter_1_0)] = reloaded_0_1(iter_1_1)
		end

		setmetatable(reloaded_1_1, reloaded_0_1(getmetatable(arg_1_0)))
	else
		reloaded_1_1 = arg_1_0
	end

	return reloaded_1_1
end

local reloaded_0_2 = reloaded_0_1(utils or {})

function reloaded_0_2.icontains(arg_2_0, arg_2_1)
	if type(arg_2_0) ~= "table" then
		error(("Invalid argument for icontans, table expected, got: %s, value: %s: "):format(type(arg_2_0), reloaded_0_0(arg_2_1)), 2)
	end

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		if iter_2_1 == arg_2_1 then
			return true
		end
	end

	return false
end

function reloaded_0_2.ifind(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
		if iter_3_1 == arg_3_1 then
			return iter_3_0
		end
	end
end

function reloaded_0_2.format_error(arg_4_0)
	local reloaded_4_0 = "FF4040"
	local reloaded_4_1 = arg_4_0:find(reloaded_4_0)

	if reloaded_4_1 == nil then
		error("Failed to format error, error start not found", 3)

		return
	end

	return arg_4_0:sub(reloaded_4_1 + #reloaded_4_0, #arg_4_0)
end

function reloaded_0_2.delete_error_colors(arg_5_0)
	if type(arg_5_0) ~= "string" then
		error(("Invalid error_text type, string expected, got: %s"):format(type(arg_5_0)))
	end

	arg_5_0 = arg_5_0:gsub("\a%x%x%x%x%x%x", "")
	arg_5_0 = arg_5_0:gsub("\"", "")

	return arg_5_0
end

function reloaded_0_2.next_value(arg_6_0, arg_6_1)
	return arg_6_0 % arg_6_1 + 1
end

function reloaded_0_2.table_deep_copy(arg_7_0)
	return reloaded_0_1(arg_7_0)
end

function reloaded_0_2.get_average_value(arg_8_0)
	local reloaded_8_0 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_0) do
		reloaded_8_0 = reloaded_8_0 + iter_8_1
	end

	return reloaded_8_0 / #arg_8_0
end

function reloaded_0_2.to_bool_tbl(arg_9_0)
	local reloaded_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		reloaded_9_0[iter_9_1] = true
	end

	return reloaded_9_0
end

function reloaded_0_2.ticks_to_time(arg_10_0)
	return arg_10_0 * globals.tickinterval
end

function reloaded_0_2.time_to_ticks(arg_11_0)
	return math.floor(0.5 + arg_11_0 / globals.tickinterval)
end

function reloaded_0_2.get_tbl_keys_count(arg_12_0)
	local reloaded_12_0 = 0

	for iter_12_0, iter_12_1 in pairs(arg_12_0 or {}) do
		if iter_12_1 ~= nil then
			reloaded_12_0 = reloaded_12_0 + 1
		end
	end

	return reloaded_12_0
end

function reloaded_0_2.get_value_type(arg_13_0)
	if getmetatable(arg_13_0) ~= nil then
		return arg_13_0.__type ~= nil and arg_13_0.__type.name or type(arg_13_0)
	else
		return type(arg_13_0)
	end
end

function reloaded_0_2.swap_values(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0[arg_14_2], arg_14_0[arg_14_1] = arg_14_0[arg_14_1], arg_14_0[arg_14_2]

	return arg_14_0
end

return reloaded_0_2
