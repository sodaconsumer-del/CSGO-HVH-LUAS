local reloaded_0_0

;(function()
	local reloaded_1_0
	local reloaded_1_1
	local reloaded_1_2
	local reloaded_1_3 = " "
	local reloaded_1_4 = "\xE2\x80\x8A"
	local reloaded_1_5 = {
		"switch",
		"slider",
		"combo",
		"selectable",
		"color_picker",
		"button",
		"hotkey",
		"input",
		"list",
		"listable",
		"label",
		"texture",
		"value"
	}
	local reloaded_1_6 = {
		tooltip = "tooltip",
		list = "list",
		key = "key",
		name = "name",
		disabled = "disabled",
		visibility = "visibility",
		type = "type"
	}
	local reloaded_1_7 = {
		tooltip = "tooltip",
		list = "update",
		name = "name",
		disabled = "disabled",
		visibility = "visibility"
	}

	local function reloaded_1_8(arg_2_0, ...)
		if not arg_2_0 then
			error(table.concat({
				...
			}), 0)
		end
	end

	local function reloaded_1_9(...)
		local reloaded_3_0 = 2166136261
		local reloaded_3_1 = table.concat({
			...
		})

		for iter_3_0 = 1, #reloaded_3_1 do
			reloaded_3_0 = bit.bxor(reloaded_3_0, string.byte(reloaded_3_1, iter_3_0))
			reloaded_3_0 = reloaded_3_0 + bit.lshift(reloaded_3_0, 1) + bit.lshift(reloaded_3_0, 4) + bit.lshift(reloaded_3_0, 7) + bit.lshift(reloaded_3_0, 8) + bit.lshift(reloaded_3_0, 24)
		end

		return reloaded_3_0 % 4294967296
	end

	local function reloaded_1_10(arg_4_0)
		local reloaded_4_0 = "##LOC"
		local reloaded_4_1 = arg_4_0 .. reloaded_4_0

		return function(arg_5_0)
			reloaded_1_8(type(arg_5_0) == "table", "invalid localization")

			for iter_5_0, iter_5_1 in pairs(arg_5_0) do
				if type(iter_5_0) ~= "number" then
					ui.localize(iter_5_0, reloaded_4_1, iter_5_1 .. reloaded_4_0)
				end
			end

			return reloaded_4_1
		end
	end

	local function reloaded_1_11(arg_6_0)
		local reloaded_6_0 = 0
		local reloaded_6_1 = 0

		while arg_6_0 >= 6 do
			reloaded_6_0 = reloaded_6_0 + 1
			arg_6_0 = arg_6_0 - 3
		end

		while arg_6_0 >= 4 do
			reloaded_6_1 = reloaded_6_1 + 1
			arg_6_0 = arg_6_0 - 2
		end

		if arg_6_0 == 3 then
			reloaded_6_0 = reloaded_6_0 + 1
		end

		if arg_6_0 == 2 then
			reloaded_6_1 = reloaded_6_1 + 1
		end

		return reloaded_6_0, reloaded_6_1
	end

	local function reloaded_1_12(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
		arg_7_2, arg_7_3, arg_7_4 = arg_7_2 or 0, arg_7_3 or 0, arg_7_4 or 0

		local reloaded_7_0 = 0
		local reloaded_7_1 = 0
		local reloaded_7_2 = 0
		local reloaded_7_3 = 0
		local reloaded_7_4 = 0
		local reloaded_7_5 = 0

		if arg_7_2 >= 2 then
			reloaded_7_0, reloaded_7_1 = reloaded_1_11(arg_7_2)
		end

		if arg_7_3 >= 2 then
			reloaded_7_2, reloaded_7_3 = reloaded_1_11(arg_7_3)
		end

		if arg_7_4 >= 2 then
			reloaded_7_4, reloaded_7_5 = reloaded_1_11(arg_7_4)
		end

		return table.concat({
			reloaded_7_0 > 0 and string.rep(reloaded_1_3, reloaded_7_0) or "",
			reloaded_7_1 > 0 and string.rep(reloaded_1_4, reloaded_7_1) or "",
			arg_7_0 and string.format("\a{Link Active}%s", ui.get_icon(arg_7_0) or ""),
			reloaded_7_2 > 0 and string.rep(reloaded_1_3, reloaded_7_2) or "",
			reloaded_7_3 > 0 and string.rep(reloaded_1_4, reloaded_7_3) or "",
			string.format("\aDEFAULT%s", arg_7_1 or ""),
			reloaded_7_4 > 0 and string.rep(reloaded_1_3, reloaded_7_4) or "",
			reloaded_7_5 > 0 and string.rep(reloaded_1_4, reloaded_7_5) or ""
		})
	end

	function item_raw_callback(arg_8_0, arg_8_1)
		arg_8_1:set_callback(function(arg_9_0)
			local reloaded_9_0 = {
				arg_9_0:get()
			}
			local reloaded_9_1 = #reloaded_9_0 > 1 and reloaded_9_0 or reloaded_9_0[1]

			arg_8_0.raw[arg_8_1.varname] = reloaded_9_1
		end, true)

		return arg_8_1
	end

	local function reloaded_1_13(arg_10_0)
		reloaded_1_8(type(arg_10_0) == "table" and arg_10_0.parent and arg_10_0.group and arg_10_0.reference, "item initialization failed")

		local reloaded_10_0
		local reloaded_10_1 = arg_10_0.reference
		local reloaded_10_2 = reloaded_10_1:type()
		local reloaded_10_3
		local reloaded_10_4 = arg_10_0.saveable or true

		if reloaded_10_2 == "label" or reloaded_10_2 == "button" then
			reloaded_10_4 = false
		end

		local reloaded_10_5 = {
			parent = arg_10_0.parent,
			group = arg_10_0.group,
			reference = arg_10_0.reference,
			hash = arg_10_0.hash,
			varname = arg_10_0.varname,
			id = reloaded_10_1:id(),
			type = reloaded_10_1:type(),
			saveable = reloaded_10_4
		}
		local reloaded_10_6 = {}

		if arg_10_0.subgroup ~= true then
			local reloaded_10_7, reloaded_10_8 = pcall(reloaded_10_1.create, reloaded_10_1)

			if reloaded_10_7 then
				local reloaded_10_9, reloaded_10_10 = pcall(reloaded_1_1, arg_10_0.parent, reloaded_10_8, reloaded_10_5.varname .. "\xC2\xBBsubgroup", true)

				if reloaded_10_9 then
					reloaded_10_5.subgroup = reloaded_10_10
				end
			end
		end

		if reloaded_10_1.color_picker ~= nil then
			function reloaded_10_5.color_picker(arg_11_0, arg_11_1)
				reloaded_1_8(type(arg_11_1) == "string" and #arg_11_1 > 0, "invalid var name")

				return function(...)
					local reloaded_12_0 = reloaded_1_9(arg_11_1)
					local reloaded_12_1 = arg_11_0.parent.items[reloaded_12_0]

					reloaded_1_8(reloaded_12_1 == nil, string.format("the \xC2\xAB%s\xC2\xBB var already exists", reloaded_12_1 and reloaded_12_1.varname or ""))

					local reloaded_12_2 = arg_11_0.reference:color_picker(...)
					local reloaded_12_3, reloaded_12_4 = reloaded_1_13({
						subgroup = true,
						parent = arg_11_0.parent,
						group = arg_11_0.group,
						reference = reloaded_12_2,
						varname = arg_11_1,
						hash = reloaded_12_0
					})

					arg_11_0.parent.items[reloaded_12_0] = item_raw_callback(arg_11_0.parent, reloaded_12_3)

					return reloaded_12_3
				end
			end
		end

		local reloaded_10_11 = {
			"get",
			"get_override",
			"export",
			"set",
			"override",
			"import",
			"reset",
			"set_callback",
			"unset_callback",
			"add_style"
		}

		for iter_10_0, iter_10_1 in ipairs(reloaded_10_11) do
			reloaded_10_5[iter_10_1] = function(arg_13_0, ...)
				local reloaded_13_0 = {
					arg_13_0.reference[iter_10_1](arg_13_0.reference, ...)
				}

				if iter_10_1 ~= "get" and iter_10_1 ~= "get_override" and iter_10_1 ~= "export" then
					return reloaded_10_0
				end

				return unpack(reloaded_13_0)
			end
		end

		function reloaded_10_6.__newindex(arg_14_0, arg_14_1, arg_14_2)
			local reloaded_14_0 = arg_14_2 == true and true or false

			if arg_14_1 == "saveable" then
				reloaded_10_5.saveable = reloaded_14_0
			elseif reloaded_1_7[arg_14_1] then
				if arg_14_1 == "visibility" or arg_14_1 == "disabled" or arg_14_1 == "active" then
					arg_14_2 = reloaded_14_0
				end

				arg_14_0.reference[reloaded_1_7[arg_14_1]](arg_14_0.reference, arg_14_2)
			end

			return arg_14_0
		end

		function reloaded_10_6.__index(arg_15_0, arg_15_1)
			if arg_15_1 == "saveable" then
				return reloaded_10_5.saveable
			elseif reloaded_1_6[arg_15_1] then
				return arg_15_0.reference[reloaded_1_6[arg_15_1]](arg_15_0.reference)
			end

			return nil
		end

		function reloaded_10_6.__tostring(arg_16_0)
			return string.format("uix:%s \xC2\xBB %s", arg_16_0.parent.product:lower(), arg_16_0.varname)
		end

		reloaded_10_0 = setmetatable(reloaded_10_5, reloaded_10_6)

		return reloaded_10_0, reloaded_10_0.subgroup
	end

	function reloaded_1_1(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
		local reloaded_17_0 = {
			parent = arg_17_0,
			group = arg_17_1,
			groupname = arg_17_2 or arg_17_1:get_name()
		}
		local reloaded_17_1 = {
			__newindex = function(arg_18_0, arg_18_1, arg_18_2)
				if arg_18_1 == "name" then
					arg_18_0.group:name(arg_18_2)
				end

				if arg_18_1 == "disabled" then
					arg_18_0.group:disabled(arg_18_2)
				end

				if arg_18_1 == "visibility" then
					arg_18_0.group:visibility(arg_18_2)
				end

				return arg_18_0
			end,
			__index = function(arg_19_0, arg_19_1)
				if arg_19_1 == "name" then
					return arg_19_0.group:name()
				end

				if arg_19_1 == "disabled" then
					return arg_19_0.group:disabled()
				end

				if arg_19_1 == "visibility" then
					return arg_19_0.group:visibility()
				end

				for iter_19_0, iter_19_1 in ipairs(reloaded_1_5) do
					if iter_19_1 == arg_19_1 then
						reloaded_1_8(type(arg_19_1) == "string", "invalid function name")

						return function(arg_20_0, arg_20_1)
							reloaded_1_8(type(arg_20_1) == "string" and #arg_20_1 > 0, "invalid var name")

							return function(...)
								local reloaded_21_0 = reloaded_1_9(arg_20_1)
								local reloaded_21_1 = arg_19_0.parent.items[reloaded_21_0]

								reloaded_1_8(reloaded_21_1 == nil, string.format("the \xC2\xAB%s\xC2\xBB var already exists", reloaded_21_1 and reloaded_21_1.varname or ""))

								local reloaded_21_2, reloaded_21_3 = pcall(arg_19_0.group[arg_19_1], arg_19_0.group, ...)

								reloaded_1_8(reloaded_21_2, string.format("unable to cast \xC2\xAB%s\xC2\xBB item", arg_20_1))

								local reloaded_21_4, reloaded_21_5 = reloaded_1_13({
									parent = arg_19_0.parent,
									group = arg_19_0.group,
									reference = reloaded_21_3,
									varname = arg_20_1,
									hash = reloaded_21_0,
									subgroup = arg_17_3,
									rules = rules
								})

								arg_19_0.parent.items[reloaded_21_0] = item_raw_callback(arg_19_0.parent, reloaded_21_4)

								return reloaded_21_4, reloaded_21_5
							end
						end
					end
				end

				return nil
			end,
			__tostring = function(arg_22_0)
				return string.format("uix:%s \xC2\xBB %s", arg_22_0.parent.product:lower(), arg_22_0.groupname)
			end
		}

		return setmetatable(reloaded_17_0, reloaded_17_1)
	end

	local function reloaded_1_14(arg_23_0, ...)
		local reloaded_23_0
		local reloaded_23_1
		local reloaded_23_2
		local reloaded_23_3

		for iter_23_0, iter_23_1 in ipairs({
			...
		}) do
			local reloaded_23_4 = type(iter_23_1)

			if reloaded_23_4 == "number" then
				reloaded_23_2 = iter_23_1
			end

			if reloaded_23_4 == "function" then
				reloaded_23_3 = iter_23_1
			end

			if reloaded_23_4 == "string" then
				if reloaded_23_0 ~= nil then
					reloaded_23_1, reloaded_23_0 = reloaded_23_0, iter_23_1
				end

				reloaded_23_0 = reloaded_23_0 or iter_23_1
			end
		end

		reloaded_1_8(reloaded_23_3 ~= nil, "invalid callback")

		local reloaded_23_5
		local reloaded_23_6 = reloaded_23_1 ~= nil and ui.create(ui.localize("en", reloaded_23_1) or reloaded_23_1, ui.localize("en", reloaded_23_0) or reloaded_23_0, reloaded_23_2) or ui.create(ui.localize("en", reloaded_23_0) or reloaded_23_0, nil, reloaded_23_2)

		if reloaded_23_6 ~= nil then
			local reloaded_23_7 = reloaded_1_1(arg_23_0, reloaded_23_6, reloaded_23_0)

			reloaded_23_3(reloaded_23_7)

			return reloaded_23_7
		end
	end

	local function reloaded_1_15(arg_24_0)
		local reloaded_24_0 = ""

		for iter_24_0, iter_24_1 in pairs(arg_24_0.items) do
			if not iter_24_1.saveable then
				-- block empty
			else
				local reloaded_24_1 = iter_24_1:get()

				if type(reloaded_24_1) == "table" then
					local reloaded_24_2 = "{"

					for iter_24_2, iter_24_3 in ipairs(reloaded_24_1) do
						reloaded_24_2 = reloaded_24_2 .. iter_24_3 .. (iter_24_2 ~= #reloaded_24_1 and "," or "")
					end

					reloaded_24_1 = reloaded_24_2 .. "}"
				end

				if type(reloaded_24_1) == "userdata" and reloaded_24_1.r and reloaded_24_1.g and reloaded_24_1.b and reloaded_24_1.a then
					reloaded_24_1 = reloaded_24_1:to_hex()
				end

				reloaded_24_0 = reloaded_24_0 .. iter_24_0 .. ":" .. tostring(reloaded_24_1) .. ";"
			end
		end

		return reloaded_24_0
	end

	local function reloaded_1_16(arg_25_0, arg_25_1)
		if type(arg_25_1) ~= "string" or arg_25_1 == "" then
			return
		end

		for iter_25_0, iter_25_1 in arg_25_1:gmatch("([^:]+):([^;]+);") do
			local reloaded_25_0 = arg_25_0.items[tonumber(iter_25_0)]

			if reloaded_25_0 ~= nil then
				if reloaded_25_0.type == "switch" then
					iter_25_1 = iter_25_1 == "true" and true or false
				end

				if reloaded_25_0.type == "selectable" then
					local reloaded_25_1 = {}

					for iter_25_2 in iter_25_1:gmatch("[^{^}^,]+") do
						reloaded_25_1[#reloaded_25_1 + 1] = iter_25_2
					end

					iter_25_1 = reloaded_25_1
				end

				if reloaded_25_0.type == "slider" then
					iter_25_1 = tonumber(iter_25_1)
				end

				if reloaded_25_0.type == "list" then
					iter_25_1 = tonumber(iter_25_1)
				end

				local reloaded_25_2, reloaded_25_3 = pcall(reloaded_25_0.set, reloaded_25_0, iter_25_1)

				if not reloaded_25_2 then
					print(string.format("failed to write to [%s] -> %s", reloaded_25_0, reloaded_25_3))
				end
			end
		end
	end

	reloaded_0_0 = {}

	function reloaded_0_0.initialize(arg_26_0)
		reloaded_1_8(type(arg_26_0) == "string" and #arg_26_0 > 0, "invalid name")

		local reloaded_26_0 = {
			raw = {},
			items = {},
			product = arg_26_0,
			export = reloaded_1_15,
			import = reloaded_1_16,
			new_group = reloaded_1_14,
			reference = function(arg_27_0, arg_27_1)
				local reloaded_27_0 = arg_27_0.items
				local reloaded_27_1 = reloaded_27_0[arg_27_1] or reloaded_27_0[reloaded_1_9(arg_27_1)]

				if reloaded_27_1 == nil then
					return nil
				end

				return reloaded_27_1, reloaded_27_1.subgroup
			end,
			get_raw = function(arg_28_0)
				return arg_28_0.raw
			end
		}

		return setmetatable(reloaded_26_0, {
			__index = {},
			__tostring = function(arg_29_0)
				return string.format("uix:%s", arg_29_0.product:lower())
			end
		})
	end

	reloaded_0_0.name = reloaded_1_12
	reloaded_0_0.localize = reloaded_1_10
end)()

return reloaded_0_0
