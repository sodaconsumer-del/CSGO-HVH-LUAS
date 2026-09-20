local reloaded_0_0 = require("neverlose/utils")
local reloaded_0_1 = require("neverlose/hashing")
local reloaded_0_2 = require("neverlose/enum")
local reloaded_0_3 = require("neverlose/inspect")
local reloaded_0_4 = require("neverlose/sauron_color")
local reloaded_0_5 = {
	log_level = 5,
	config_handler = function(arg_1_0)
		return
	end
}
local reloaded_0_6 = {}
local reloaded_0_7 = {
	__metatable = "uix"
}

reloaded_0_7.__index = reloaded_0_7

local reloaded_0_8 = {}
local reloaded_0_9 = 0
local reloaded_0_10 = {}
local reloaded_0_11 = reloaded_0_2.enum({
	ERROR = 4,
	WARNING = 3,
	INFO = 2,
	DEBUG = 1,
	NOTSET = 0,
	CRITICAL = 5
})
local reloaded_0_12 = {
	[reloaded_0_11.NOTSET.value] = reloaded_0_4("FFFFFF"),
	[reloaded_0_11.DEBUG.value] = reloaded_0_4("FFB8B8"),
	[reloaded_0_11.INFO.value] = reloaded_0_4("7A73FF"),
	[reloaded_0_11.WARNING.value] = reloaded_0_4("FF7878"),
	[reloaded_0_11.ERROR.value] = reloaded_0_4("FF0000"),
	[reloaded_0_11.CRITICAL.value] = reloaded_0_4("FF5E00")
}

local function reloaded_0_13(arg_2_0)
	local reloaded_2_0 = {}
	local reloaded_2_1 = false

	while true do
		if arg_2_0 == nil then
			break
		end

		local reloaded_2_2 = reloaded_0_0.get_value_type(arg_2_0)

		if not reloaded_2_1 and reloaded_2_2 == "lua::LuaGroup" then
			reloaded_2_1 = true
		end

		local reloaded_2_3 = arg_2_0:name()

		if #reloaded_2_3 == 0 then
			break
		end

		if reloaded_2_2 ~= "lua::LuaVar" or not reloaded_2_1 then
			table.insert(reloaded_2_0, 1, reloaded_2_3)
		end

		arg_2_0 = arg_2_0:parent()
	end

	return reloaded_2_0
end

local function reloaded_0_14(arg_3_0)
	return reloaded_0_1.sha1(table.concat(reloaded_0_13(arg_3_0), ","))
end

function reloaded_0_5.log(arg_4_0, arg_4_1)
	if arg_4_0.value >= reloaded_0_5.log_level then
		local reloaded_4_0 = reloaded_0_12[arg_4_0.value]

		print_raw(("\aFFFFFFUIX \a%s[%s]\aFFFFFF: %s"):format(reloaded_4_0:hex(), arg_4_0.name, arg_4_1))
	end
end

function reloaded_0_5.new(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	reloaded_0_9 = reloaded_0_9 + 1
	reloaded_0_6[reloaded_0_9] = {}

	local reloaded_5_0 = reloaded_0_0.table_deep_copy(arg_5_1)

	table.insert(reloaded_5_0, arg_5_2 or arg_5_0:name())

	local reloaded_5_1 = {
		visible = true,
		obj = arg_5_0,
		path = reloaded_5_0,
		type = arg_5_0:type(),
		idx = reloaded_0_9,
		childrens = {},
		parents = {},
		callbacks = {},
		events = {}
	}
	local reloaded_5_2 = setmetatable(reloaded_5_1, reloaded_0_7)

	if not arg_5_3 then
		reloaded_0_5.config_handler(reloaded_5_2)
	end

	return reloaded_5_2
end

function reloaded_0_5.find(...)
	reloaded_0_5.log(reloaded_0_11.INFO, ("Trying to find item, args: %s"):format(reloaded_0_3({
		...
	})))

	local reloaded_6_0 = {
		ui.find(...)
	}
	local reloaded_6_1 = {}

	for iter_6_0, iter_6_1 in ipairs(reloaded_6_0) do
		local reloaded_6_2 = iter_6_1.__type.name

		if reloaded_6_2 == "lua::LuaVar" then
			table.insert(reloaded_6_1, reloaded_0_5.new(iter_6_1, {
				...
			}, nil, true))
		elseif reloaded_6_2 == "lua::LuaGroup" then
			table.insert(reloaded_6_1, reloaded_0_5.meta_create(iter_6_1, {
				...
			}))
		end
	end

	return unpack(reloaded_6_1)
end

function reloaded_0_5.meta_create(arg_7_0, arg_7_1)
	return {
		obj = arg_7_0,
		switch = function(arg_8_0, ...)
			local reloaded_8_0 = arg_7_0:switch(...)

			return reloaded_0_5.new(reloaded_8_0, arg_7_1)
		end,
		button = function(arg_9_0, ...)
			local reloaded_9_0 = arg_7_0:button(...)

			return reloaded_0_5.new(reloaded_9_0, arg_7_1)
		end,
		combo = function(arg_10_0, ...)
			local reloaded_10_0 = arg_7_0:combo(...)

			return reloaded_0_5.new(reloaded_10_0, arg_7_1)
		end,
		hotkey = function(arg_11_0, ...)
			local reloaded_11_0 = arg_7_0:hotkey(...)

			return reloaded_0_5.new(reloaded_11_0, arg_7_1)
		end,
		input = function(arg_12_0, ...)
			local reloaded_12_0 = arg_7_0:input(...)

			return reloaded_0_5.new(reloaded_12_0, arg_7_1)
		end,
		label = function(arg_13_0, ...)
			local reloaded_13_0 = arg_7_0:label(...)

			return reloaded_0_5.new(reloaded_13_0, arg_7_1)
		end,
		list = function(arg_14_0, ...)
			local reloaded_14_0 = arg_7_0:list(...)

			return reloaded_0_5.new(reloaded_14_0, arg_7_1)
		end,
		listable = function(arg_15_0, ...)
			local reloaded_15_0 = arg_7_0:listable(...)

			return reloaded_0_5.new(reloaded_15_0, arg_7_1)
		end,
		selectable = function(arg_16_0, ...)
			local reloaded_16_0 = arg_7_0:selectable(...)

			return reloaded_0_5.new(reloaded_16_0, arg_7_1)
		end,
		color_picker = function(arg_17_0, ...)
			local reloaded_17_0 = arg_7_0:color_picker(...)

			return reloaded_0_5.new(reloaded_17_0, arg_7_1)
		end,
		slider = function(arg_18_0, ...)
			local reloaded_18_0 = arg_7_0:slider(...)

			return reloaded_0_5.new(reloaded_18_0, arg_7_1)
		end,
		texture = function(arg_19_0, ...)
			local reloaded_19_0 = arg_7_0:texture(...)

			return reloaded_0_5.new(reloaded_19_0, arg_7_1)
		end
	}
end

function reloaded_0_5.create(...)
	local reloaded_20_0 = ui.create(...)

	return reloaded_0_5.meta_create(reloaded_20_0, {
		...
	})
end

local function reloaded_0_15(arg_21_0)
	return getmetatable(arg_21_0) == "uix"
end

function reloaded_0_7.__eq(arg_22_0, arg_22_1)
	if reloaded_0_15(arg_22_0) and reloaded_0_15(arg_22_1) then
		return arg_22_0:get_hash() == arg_22_1:get_hash()
	else
		return false
	end
end

function reloaded_0_7.get(arg_23_0)
	return arg_23_0.obj:get()
end

function reloaded_0_7.id(arg_24_0)
	return arg_24_0.obj:id()
end

function reloaded_0_7.get_list(arg_25_0)
	return arg_25_0.obj:get_list()
end

function reloaded_0_7.type(arg_26_0)
	return arg_26_0.obj:type()
end

function reloaded_0_7.name(arg_27_0, ...)
	return arg_27_0.obj:name(...)
end

function reloaded_0_7.get_visible(arg_28_0)
	return arg_28_0.obj:get_visible()
end

function reloaded_0_7.override(arg_29_0, ...)
	return arg_29_0.obj:override(...)
end

function reloaded_0_7.get_override(arg_30_0)
	return arg_30_0.obj:get_override()
end

function reloaded_0_7.update(arg_31_0, ...)
	return arg_31_0.obj:update(...)
end

function reloaded_0_7.set(arg_32_0, ...)
	return arg_32_0.obj:set(...)
end

function reloaded_0_7.tooltip(arg_33_0, arg_33_1)
	if arg_33_1 == nil then
		return arg_33_0.obj:tooltip()
	else
		arg_33_0.obj:tooltip(arg_33_1)

		return arg_33_0
	end
end

function reloaded_0_7.visibility(arg_34_0, arg_34_1)
	arg_34_0.obj:visibility(arg_34_1)

	arg_34_0.visible = arg_34_1

	if arg_34_0.childrens_handler ~= nil then
		arg_34_0.childrens_handler()
	end
end

function reloaded_0_7.disabled(arg_35_0, arg_35_1)
	return arg_35_0.obj:disabled(arg_35_1)
end

function reloaded_0_7.set_callback(arg_36_0, ...)
	return arg_36_0.obj:set_callback(...)
end

function reloaded_0_7.unset_callback(arg_37_0, ...)
	return arg_37_0.obj:unset_callback(...)
end

function reloaded_0_7.color_picker(arg_38_0, ...)
	local reloaded_38_0 = arg_38_0.obj:color_picker(...)

	return reloaded_0_5.new(reloaded_38_0, arg_38_0.path, ("%s col"):format(arg_38_0:name()))
end

function reloaded_0_7.create(arg_39_0)
	local reloaded_39_0 = arg_39_0.obj:create()
	local reloaded_39_1 = reloaded_0_0.table_deep_copy(arg_39_0.path)

	table.insert(reloaded_39_1, "Childs")

	return reloaded_0_5.meta_create(reloaded_39_0, reloaded_39_1)
end

function reloaded_0_7.parent(arg_40_0)
	return arg_40_0.obj:parent()
end

function reloaded_0_7.destroy(arg_41_0)
	return arg_41_0.obj:destroy()
end

function reloaded_0_7.smart_override(arg_42_0, arg_42_1, arg_42_2)
	local reloaded_42_0 = arg_42_0:get_hash()
	local reloaded_42_1 = reloaded_0_8[reloaded_42_0]

	if reloaded_42_1 == nil and arg_42_1 ~= nil or reloaded_42_1 ~= nil and reloaded_42_1.hidden ~= arg_42_2 then
		reloaded_0_8[reloaded_42_0] = {
			obj = arg_42_0,
			hidden = arg_42_2
		}
	elseif reloaded_42_1 ~= nil and arg_42_1 == nil then
		reloaded_0_8[reloaded_42_0] = nil
	end

	return arg_42_0:override(arg_42_1)
end

function reloaded_0_7.get_children_visibility(arg_43_0)
	local reloaded_43_0 = reloaded_0_6[arg_43_0.idx]

	for iter_43_0, iter_43_1 in ipairs(reloaded_43_0) do
		local reloaded_43_1 = iter_43_1.obj
		local reloaded_43_2 = reloaded_43_1:get()

		if reloaded_0_10[reloaded_43_1.type] ~= nil then
			reloaded_43_2 = reloaded_0_10[reloaded_43_1.type](reloaded_43_1, reloaded_43_2)
		end

		if not reloaded_43_1.visible and not iter_43_1.ignore_vis or not iter_43_1.check_func(reloaded_43_2) then
			return false
		end
	end

	return true
end

function reloaded_0_7.add_children(arg_44_0, ...)
	if arg_44_0.childrens_handler == nil then
		function arg_44_0.childrens_handler()
			for iter_45_0, iter_45_1 in ipairs(arg_44_0.childrens) do
				local reloaded_45_0 = iter_45_1:get_children_visibility()

				iter_45_1:visibility(reloaded_45_0)
			end
		end

		arg_44_0:set_callback(arg_44_0.childrens_handler)
	end

	local reloaded_44_0 = {
		...
	}
	local reloaded_44_1 = type(reloaded_44_0[#reloaded_44_0]) == "boolean"
	local reloaded_44_2 = reloaded_44_1 and reloaded_44_0[#reloaded_44_0] or false
	local reloaded_44_3 = reloaded_44_1 and #reloaded_44_0 - 1 or #reloaded_44_0
	local reloaded_44_4 = type(reloaded_44_0[reloaded_44_3]) == "function"
	local reloaded_44_5 = reloaded_44_4 and reloaded_44_0[reloaded_44_3] or function(arg_46_0)
		return arg_46_0 == true
	end

	if reloaded_44_1 then
		reloaded_44_0[#reloaded_44_0] = nil
	end

	if reloaded_44_4 ~= false then
		reloaded_44_0[reloaded_44_3] = nil
	end

	local reloaded_44_6 = type(reloaded_44_0[1]) == "table" and getmetatable(reloaded_44_0[1]) == nil and reloaded_44_0[1] or reloaded_44_0

	for iter_44_0, iter_44_1 in pairs(reloaded_44_6) do
		if iter_44_1 == arg_44_0 then
			-- block empty
		else
			local reloaded_44_7 = iter_44_1.idx

			if reloaded_0_0.icontains(arg_44_0.childrens, reloaded_44_7) then
				error(("Can`t add children with %s id, it already exists"):format(reloaded_44_7), 3)
			end

			table.insert(arg_44_0.childrens, iter_44_1)
			table.insert(reloaded_0_6[reloaded_44_7], {
				obj = arg_44_0,
				check_func = reloaded_44_5,
				ignore_vis = reloaded_44_2
			})
		end
	end

	arg_44_0.childrens_handler()
end

function reloaded_0_7.register(arg_47_0, ...)
	if arg_47_0.events_handler == nil then
		function arg_47_0.events_handler()
			for iter_48_0, iter_48_1 in ipairs(arg_47_0.events) do
				if iter_48_1.check_func(arg_47_0) then
					iter_48_1.mt:set(iter_48_1.callback, iter_48_1.name)
				else
					iter_48_1.mt:unset(iter_48_1.callback)
				end
			end
		end

		arg_47_0:set_callback(arg_47_0.events_handler)
	end

	local reloaded_47_0 = {
		...
	}
	local reloaded_47_1 = type(reloaded_47_0[1]) == "table" and getmetatable(reloaded_47_0[1]) == nil
	local reloaded_47_2 = (reloaded_47_1 or #reloaded_47_0 ~= 3) and type(reloaded_47_0[#reloaded_47_0]) == "function"
	local reloaded_47_3 = reloaded_47_2 and reloaded_47_0[#reloaded_47_0] or function(arg_49_0)
		return arg_49_0:get() == true
	end

	if reloaded_47_2 ~= false then
		reloaded_47_0[#reloaded_47_0] = nil
	end

	local reloaded_47_4 = reloaded_47_1 and reloaded_47_0 or {
		reloaded_47_0
	}

	for iter_47_0, iter_47_1 in pairs(reloaded_47_4) do
		table.insert(arg_47_0.events, {
			mt = iter_47_1[1],
			name = iter_47_1[2],
			callback = iter_47_1[3],
			check_func = reloaded_47_3
		})
	end

	arg_47_0.events_handler()
end

function reloaded_0_7.register_animated_event(arg_50_0, arg_50_1)
	local reloaded_50_0 = type(arg_50_1)

	if reloaded_50_0 ~= "table" then
		error(("Invalid params type, table expected, got: %s"):format(reloaded_50_0), 2)
	end

	if arg_50_1.check_func == nil then
		function arg_50_1.check_func(arg_51_0)
			return arg_51_0:get() == true
		end
	end

	local reloaded_50_1 = {
		is_active = false,
		is_processing = false,
		anim = arg_50_1.anim
	}

	function reloaded_50_1.process()
		reloaded_50_1.is_processing = true

		local reloaded_52_0 = arg_50_1:get_animated_value(reloaded_50_1.is_active)
		local reloaded_52_1 = {
			force_processing = false,
			anim_value = reloaded_52_0
		}

		arg_50_1.callback(reloaded_52_1)

		if arg_50_1.anim.time == 0 and not reloaded_52_1.force_processing then
			arg_50_1.event:unset(reloaded_50_1.process)

			reloaded_50_1.is_processing = false
		end
	end

	function reloaded_50_1.handle()
		reloaded_50_1.is_active = arg_50_1.check_func(arg_50_0)

		if reloaded_50_1.is_active and not reloaded_50_1.is_processing then
			arg_50_1.event:set(reloaded_50_1.process, arg_50_1.name)
		end
	end

	arg_50_0:set_callback(reloaded_50_1.handle, true)

	return reloaded_50_1
end

function reloaded_0_7.get_hash(arg_54_0)
	return reloaded_0_14(arg_54_0)
end

events.shutdown:set(function()
	for iter_55_0, iter_55_1 in pairs(reloaded_0_8) do
		iter_55_1.obj:override(nil)
	end
end)

return reloaded_0_5
