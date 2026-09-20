local reloaded_0_0 = require("neverlose/utils")
local reloaded_0_1 = {}

local function reloaded_0_2(arg_1_0)
	assert(type(arg_1_0) == "table", "Enum must be a table")
end

local function reloaded_0_3(arg_2_0, arg_2_1)
	if type(arg_2_0) == "string" and type(arg_2_1) == "number" then
		return arg_2_0, arg_2_1
	elseif type(arg_2_0) == "number" and type(arg_2_1) == "string" then
		return arg_2_1, arg_2_0
	end

	error(("Invalid enum format. %s type for key and %s for value is not supported"):format(arg_2_0, arg_2_1))
end

local function reloaded_0_4(arg_3_0, arg_3_1)
	return {
		__index = {
			name = arg_3_0,
			value = arg_3_1
		},
		__newindex = function()
			error("Cannot set fields in enum value", 2)
		end,
		__tostring = function()
			return ("<enum.%s: %d>"):format(arg_3_0, arg_3_1)
		end,
		__le = function()
			error("Unsupported operation")
		end,
		__lt = function()
			error("Unsupported operation")
		end,
		__eq = function(arg_8_0, arg_8_1)
			return arg_8_0.value == arg_8_1.value
		end
	}
end

function reloaded_0_1.new(arg_9_0)
	reloaded_0_2(arg_9_0)

	local reloaded_9_0 = {}

	setmetatable(reloaded_9_0, {
		__index = function(arg_10_0, arg_10_1)
			local reloaded_10_0 = rawget(arg_10_0, arg_10_1)

			if reloaded_10_0 == nil then
				error("Invalid enum member: " .. arg_10_1, 2)
			end

			return reloaded_10_0
		end
	})

	for iter_9_0, iter_9_1 in pairs(arg_9_0) do
		local reloaded_9_1 = {}
		local reloaded_9_2, reloaded_9_3 = reloaded_0_3(iter_9_0, iter_9_1)

		setmetatable(reloaded_9_1, reloaded_0_4(reloaded_9_2, reloaded_9_3))

		reloaded_9_0[reloaded_9_2] = reloaded_9_1
		reloaded_9_0[reloaded_9_3] = reloaded_9_1
	end

	local reloaded_9_4 = {
		len = function()
			return reloaded_0_0.get_tbl_keys_count(arg_9_0)
		end
	}

	setmetatable(reloaded_9_4, {
		__index = reloaded_9_0,
		__newindex = function()
			error("Cannot set enum value")
		end,
		__tostring = function()
			return "<enum>"
		end
	})

	return reloaded_9_4
end

reloaded_0_1.enum = reloaded_0_1.new

return setmetatable(reloaded_0_1, {
	__call = function(arg_14_0, ...)
		return reloaded_0_1.new(...)
	end
})
