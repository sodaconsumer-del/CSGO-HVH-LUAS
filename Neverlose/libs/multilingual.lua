local reloaded_0_0 = ui.find("Settings", "Language")
local reloaded_0_1 = {}
local reloaded_0_2 = 0

local function reloaded_0_3(arg_1_0)
	table.insert(reloaded_0_1, arg_1_0)
end

events.render:set(function()
	local reloaded_2_0 = reloaded_0_0:get()

	if reloaded_0_2 ~= reloaded_2_0 then
		reloaded_0_2 = reloaded_2_0

		for iter_2_0, iter_2_1 in pairs(reloaded_0_1) do
			iter_2_1(reloaded_0_0)
		end
	end
end)

local reloaded_0_4 = {}
local reloaded_0_5 = {
	listable = "combo",
	switch = "basic",
	input = "basic",
	list = "combo",
	selectable = "combo",
	combo = "combo",
	label = "basic",
	hotkey = "basic",
	button = "basic",
	color_picker = "basic",
	slider = "basic"
}

function reloaded_0_4.basic(arg_3_0, arg_3_1)
	local reloaded_3_0 = arg_3_0:name()

	if arg_3_1 then
		reloaded_0_3(function(arg_4_0)
			local reloaded_4_0 = arg_4_0:get()

			arg_3_0:name(arg_3_1[reloaded_4_0] or reloaded_3_0)
		end)
	end

	return arg_3_0
end

function reloaded_0_4.combo(arg_5_0, arg_5_1)
	local reloaded_5_0 = arg_5_0:name()
	local reloaded_5_1 = arg_5_0:list()

	if arg_5_1 then
		reloaded_0_3(function(arg_6_0)
			local reloaded_6_0 = arg_6_0:get()

			arg_5_0:name(arg_5_1[reloaded_6_0] and arg_5_1[reloaded_6_0][1] or reloaded_5_0)
			arg_5_0:update(arg_5_1[reloaded_6_0] and arg_5_1[reloaded_6_0][2] or reloaded_5_1)
		end)
	end

	return arg_5_0
end

return {
	item = function(arg_7_0, arg_7_1)
		assert(arg_7_0 and arg_7_1)

		return reloaded_0_4[reloaded_0_5[arg_7_0:type()]](arg_7_0, arg_7_1)
	end,
	tooltip = function(arg_8_0, arg_8_1)
		assert(arg_8_0 and arg_8_1 and arg_8_1[0])
		arg_8_0:tooltip(arg_8_1[0])
		reloaded_0_3(function(arg_9_0)
			local reloaded_9_0 = arg_9_0:get()

			arg_8_0:tooltip(arg_8_1[reloaded_9_0] or arg_8_1[0])
		end)
	end
}
