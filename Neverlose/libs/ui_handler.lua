local reloaded_0_0 = require("neverlose/base64")
local reloaded_0_1 = panorama.loadstring("    return {\n        stringify: JSON.stringify,\n        parse: JSON.parse\n    };\n")()
local reloaded_0_2 = {
	list = {}
}

function reloaded_0_2.push(arg_1_0)
	assert(arg_1_0.element, "Element is nil")
	assert(arg_1_0.index, "Index is nil")
	assert(type(arg_1_0.index) == "string", "Invalid type of index")

	reloaded_0_2.list[arg_1_0.index] = {}
	reloaded_0_2.list[arg_1_0.index].element = arg_1_0.element
	reloaded_0_2.list[arg_1_0.index].flags = arg_1_0.flags or ""
	reloaded_0_2.list[arg_1_0.index].visible_state = function()
		if not arg_1_0.conditions then
			return true
		end

		for iter_2_0, iter_2_1 in pairs(arg_1_0.conditions) do
			if not iter_2_1() then
				return false
			end
		end

		return true
	end

	reloaded_0_2.list[arg_1_0.index].element:set_callback(reloaded_0_2.visibility_handle, true)
end

function reloaded_0_2.get(arg_3_0)
	return reloaded_0_2.list[arg_3_0] and reloaded_0_2.list[arg_3_0].element:get()
end

function reloaded_0_2.get_element(arg_4_0)
	return reloaded_0_2.list[arg_4_0] and reloaded_0_2.list[arg_4_0].element
end

function reloaded_0_2.contains(arg_5_0, arg_5_1)
	arg_5_0 = reloaded_0_2.get(arg_5_0)

	if type(arg_5_0) ~= "table" then
		return false
	end

	for iter_5_0 = 1, #arg_5_0 do
		if arg_5_0[iter_5_0] == arg_5_1 then
			return true
		end
	end

	return false
end

function reloaded_0_2.visibility_handle()
	for iter_6_0, iter_6_1 in pairs(reloaded_0_2.list) do
		iter_6_1.element:visibility(iter_6_1.visible_state())
	end
end

local reloaded_0_3 = {
	export = function()
		local reloaded_7_0 = {}

		for iter_7_0, iter_7_1 in pairs(reloaded_0_2.list) do
			if iter_7_1.flags == "c" then
				reloaded_7_0[iter_7_0] = {
					reloaded_0_2.list[iter_7_0].element:get().r,
					reloaded_0_2.list[iter_7_0].element:get().g,
					reloaded_0_2.list[iter_7_0].element:get().b,
					reloaded_0_2.list[iter_7_0].element:get().a
				}
			elseif iter_7_1.flags == "-" then
				-- block empty
			else
				reloaded_7_0[iter_7_0] = reloaded_0_2.list[iter_7_0].element:get()
			end
		end

		return string.match(reloaded_0_0.encode(reloaded_0_1.stringify(reloaded_7_0)), "[%w%+%/]+%=*"):gsub("=", "_"):gsub("+", "dick")
	end,
	import = function(arg_8_0)
		local function reloaded_8_0()
			if arg_8_0 == nil then
				print_dev("Nil config!")

				return
			end

			if arg_8_0 == "" or arg_8_0 == " " then
				print_dev("Nil config!")

				return
			end

			arg_8_0 = arg_8_0:gsub("_", "="):gsub("dick", "+")
			arg_8_0 = reloaded_0_1.parse(reloaded_0_0.decode(arg_8_0))

			for iter_9_0, iter_9_1 in pairs(arg_8_0) do
				if reloaded_0_2.get_element(iter_9_0) == nil or reloaded_0_2.list[iter_9_0].flags == "-" then
					-- block empty
				elseif reloaded_0_2.list[iter_9_0].flags == "c" then
					reloaded_0_2.get_element(iter_9_0):set(color(iter_9_1[1], iter_9_1[2], iter_9_1[3], iter_9_1[4]))
				else
					reloaded_0_2.get_element(iter_9_0):set(iter_9_1)
				end
			end

			print_dev("Successfully loaded config")
		end

		local reloaded_8_1, reloaded_8_2 = pcall(reloaded_8_0)

		if not reloaded_8_1 then
			print_dev("Failed to load config due to ?")

			return
		end
	end
}

return {
	menu = reloaded_0_2,
	config = reloaded_0_3
}
