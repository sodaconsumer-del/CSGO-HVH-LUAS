


-- perfect user interface
----- neverlose



--------------------------------------------------------------------------------
-- #region :: Header


--
-- #region : Definitions

local _PUIVERSION = 1

--#region: localization

local print, require, print_raw, print_error, color, next, vector, type, pairs, ipairs, getmetatable, setmetatable, assert, rawget, rawset, rawequal, rawlen, unpack, select, tonumber, tostring, error, pcall, xpcall, print_dev =
	  print, require, print_raw, print_error, color, next, vector, type, pairs, ipairs, getmetatable, setmetatable, assert, rawget, rawset, rawequal, rawlen, unpack, select, tonumber, tostring, error, pcall, xpcall, print_dev


local C = function (t) local c = {} for k, v in next, t do c[k] = v end return c end

local table, math, string, ui = C(table), C(math), C(string), C(ui)

--#endregion

--#region: global table

table.find = function (t, j)  for k, v in next, t do if v == j then return k end end return false  end
table.ifind = function (t, j)  for i = 1, table.maxn(t) do if t[i] == j then return i end end  end
table.ihas = function (t, ...) local arg = {...} for i = 1, table.maxn(t) do for j = 1, #arg do if t[i] == arg[j] then return true end end end return false end

table.filter = function (t)  local res = {} for i = 1, table.maxn(t) do if t[i] ~= nil then res[#res+1] = t[i] end end return res  end
table.append = function (t, ...)  for i, v in ipairs{...} do table.insert(t, v) end  end
table.appendf = function (t, ...)  local arg = {...} for i = 1, table.maxn(arg) do local v = arg[i] if v ~= nil then t[#t+1] = v end end  end
table.range = function (t, i, j)  local r = {} for l = i or 0, j or #t do r[#r+1] = t[l] end return r  end
table.copy = function (o) if type(o) ~= "table" then return o end local r = {} for k, v in next, o do r[table.copy(k)] = table.copy(v) end return r end

math.round = function (value)  return math.floor (value + 0.5)  end
math.lerp = function (a, b, w)  return a + (b - a) * w  end

local ternary = function (c, a, b)  if c then return a else return b end  end
local aserror = function (a, msg, level) if not a then error(msg, level and level + 1 or 4) end end
local contend = function (func, callback, ...)
	local t = { pcall(func, ...) }
	if not t[1] then if type(callback) == "function" then return callback(t[2]) else error(t[2], callback or 2) end end
	return unpack(t, 2)
end

local debug = setmetatable({
	warning = function (...)
		print_raw("[\ae09334ffpui", "] ", ...)
	end,
	error = function (...)
		print_raw("[\aef6060ffpui", "] ", ...)
		cvar.play:call("ui/menu_invalid.wav")
		error()
	end
}, {
	__call = function (self, ...)
		if _IS_MARKET then return end
		print_raw("\a74a6a9ffpui - ", ...)
		print_dev(...)
	end
})

--#endregion

--#region: directory tools

local dirs = {
	execute = function (t, path, func)
		local p, k for _, s in ipairs(path) do
			k, p, t = s, t, t[s]
			if t == nil then return end
		end
		if p[k] ~= nil then func(p[k], p) end
	end,
	replace = function (t, path, value)
		local p, k for _, s in ipairs(path) do
			k, p, t = s, t, t[s]
			if t == nil then return end
		end
		p[k] = value
	end,
	find = function (t, path)
		local p, k
		for _, s in ipairs(path) do
			k, p, t = s, t, t[s]
			if type(t) ~= "table" then break end
		end
		return p[k]
	end,
}

dirs.pave = function (t, place, path)
	local p = t for i, v in ipairs(path) do
		if type(p[v]) == "table" then p = p[v]
		else p[v] = (i < #path) and {} or place  p = p[v]  end
	end return t
end

dirs.extract = function (t, path)
	if not path or #path == 0 then return t end
	local j = dirs.find(t, path)
	return dirs.pave({}, j, path)
end

--#endregion

local pui, pui_mt, methods_mt = {}, {}, { element = {}, group = {} }
local tools, elemence = {}, {}
local config, is_setup = {}, false

local stringlist

--
local dpi = render.get_scale(1)

-- #endregion
--

--
-- #region : Elements

--#region: definitions

local elements = {
	switch					= { type = "boolean",	arg = 2 },
	slider					= { type = "number",	arg = 6 },
	combo					= { type = "string",	arg = 2, variable = true },
	language				= { type = "string",	arg = 2, variable = true },
	selectable				= { type = "table",		arg = 2, variable = true },
	button					= { type = "function",	arg = 3, unsavable = true },
    list					= { type = "number",	arg = 2, variable = true },
    listable				= { type = "table",		arg = 2, variable = true },
    label					= { type = "string",	arg = 1, unsavable = true },
    texture					= { type = "userdata",	arg = 5, unsavable = true },
    image					= { type = "userdata",	arg = 5, unsavable = true },
    hotkey					= { type = "number",	arg = 2 },
    input					= { type = "string",	arg = 2 },
    textbox					= { type = "string",	arg = 2 },
    color_picker			= { type = "userdata",	arg = 2 },
    value					= { type = "any",		arg = 2 },
	["sol.lua::LuaVarClr"]	= { type = "userdata",	arg = 2 },
	[""]					= { type = "any",		arg = 2 },
}

--#endregion

--#region: methods parsing

local __mt = {
	group = {}, wrp_group = {},
	element = {}, wrp_element = {},
	events = {}
} do
	local element = ui.find("Miscellaneous", "Main", "Movement", "Air Duck")
    local group = element:parent()

	local element_keys, group_keys = { "__eq", "__index", "__name", "__type", "color_picker", "create", "disabled", "export", "get", "get_override", "id", "import", "key", "list", "name", "new", "override", "parent", "reset", "set", "set_callback", "tooltip", "type", "unset_callback", "update", "visibility",
	}, { "__eq", "__index", "__name", "__type", "button", "color_picker", "combo", "create", "disabled", "export", "hotkey", "import", "input", "label", "list", "listable", "name", "parent", "selectable", "slider", "switch", "texture", "value", "visibility", }

	--

	for i = 1, #element_keys do
		local k = element_keys[i]
		local v = element[k]
		__mt.element[k], __mt.wrp_element[k] = v, function (self, ...) return v(self.ref, ...) end
	end

	for i = 1, #group_keys do
		local k = group_keys[i]
		local v = group[k]
		__mt.group[k], __mt.wrp_group[k] = v, function (self, ...) return v(self.ref, ...) end
	end
end

--#endregion

--#region: weak tables

local icons = setmetatable({}, {
    __mode = "k",
    __index = function (self, name)
        local icon = ui.get_icon(name)
		if #icon == 0 then
			debug.warning(icon, ("<%s> icon not found"):format(name))
			return "[?]"
		end
        self[name] = icon
        return self[name]
    end
})

local groups = setmetatable({}, {
	__mode = "k",
	__index = function (self, raw)
		local key, group
		local kind = type(raw)

		if kind == "table" then
			if raw.__name == "pui::group" then return raw.ref end
			for i = 1, #raw do  raw[i] = tools.format(raw[i])  end

			key, group = raw[1] .."-".. (raw[2] or ""), ui.create(unpack(raw))
		elseif kind == "userdata" and raw.__name == "sol.lua::LuaGroup" then
			key, group = tostring(raw), raw
		else
			raw = tools.format(raw)
			key, group = tostring(raw), ui.create(raw)
		end

		self[key] = group

		return self[key]
	end
})

--#endregion

-- #endregion
--

--
-- #region : Utils

--#region: tools

do
	local fmethods = {
		gradients = function (col, text)
			local colors = {}; for w in string.gmatch(col, "\b%x+") do
				colors[#colors+1] = color(string.sub(w, 2))
			end
			if #colors > 0 then return tools.gradient(text, colors) end
		end,
		colors = function (col)
			-- debug.warning("\ae09334ff\"\\a[...]\"\aDEFAULT is obsolete. Update to \ae09334ff\\b<...>\aDEFAULT and \ae09334ffpui.macros")
			return pui.colors[col] and ("\a".. pui.colors[col]:to_hex()) or "\aDEFAULT"
		end,
		macros = setmetatable({}, {
			__newindex = function (self, key, value)
				local kv = type(value)
		
				if kv == "string" then
				elseif kv == "userdata" and value.__name == "sol.ImColor" then
					value = "\a" .. value:to_hex()
				else
					value = tostring(value)
				end
		
				rawset(self, tostring(key), value)
			end,
			__index = function (self, key) return rawget(self, key) end
		})
	}

	pui.macros = fmethods.macros

	tools.format = function (s)
		if type(s) == "string" then
			if stringlist then stringlist[s] = true end
			s = string.gsub(s, "\b<(.-)>", fmethods.macros)
			s = string.gsub(s, "[\v\r]", { ["\v"] = "\a{Link Active}", ["\r"] = "\aDEFAULT" })
			s = string.gsub(s, "([\b%x]-)%[(.-)%]", fmethods.gradients)
			s = string.gsub(s, "\a%[(.-)%]", fmethods.colors)
			s = string.gsub(s, "\f<(.-)>", icons)
		end

		return s
	end

	tools.gradient = function (text, colors)
		local symbols, length = {}, #(text:gsub(".[\128-\191]*", "a"))
		local s = 1 / (#colors - 1)

		local i = 0
		for letter in string.gmatch(text, ".[\128-\191]*") do
			i = i + 1

			local weight = i / length
			local cw = weight / s
			local j = math.ceil(cw)
			local w = (cw / j)
			local L, R = colors[j], colors[j+1]

			local r = L.r + (R.r - L.r) * w
			local g = L.g + (R.g - L.g) * w
			local b = L.b + (R.b - L.b) * w
			local a = L.a + (R.a - L.a) * w

			symbols[#symbols+1] = ("\a%02x%02x%02x%02x%s"):format(r, g, b, a, letter)
		end

		symbols[#symbols+1] = "\aDEFAULT"

		return table.concat(symbols)
	end
end

--#endregion

--#region: elemence

do
	elemence.new = function (ref)
		local this = { ref = ref }
		--

		this.__depend = { {}, {} }
		this[0], this[1] = {
			type = __mt.element.type(this.ref),
			events = {}, callbacks = {},
		}, {}

		this[0].savable = not elements[this[0].type].unsavable == true
		--

		if this[0].type ~= "button" then
			local v1, v2 = __mt.element.get(this.ref)
			if v2 ~= nil then
				this.value = { v1, v2 }
				__mt.element.set_callback(this.ref, function (self)
					this.value = { __mt.element.get(self) }
				end)
			else
				this.value = v1
				__mt.element.set_callback(this.ref, function (self)
					this.value = __mt.element.get(self)
				end)
			end
		end

		return setmetatable(this, methods_mt.element)
	end

	elemence.group = function (ref)
		return setmetatable({
			ref = ref, par = ref:parent(),
			__depend = { {}, {} }
		}, methods_mt.group)
	end

	elemence.dispense = function (key, ...)
		local args, ctx = {...}, elements[key]

		args.n = table.maxn(args)

		local variable, counter = (ctx and ctx.variable) and type(args[2]) == "string", 1
		args.req, args.misc = (ctx and not variable) and ctx.arg or args.n, {}

		for i = 1, args.n do
            local v = args[i]
            local kind = type(v)

			if i == 2 and ctx.variable and not variable then
				for j = 1, #v do
					v[j] = tools.format(v[j])
				end
			else
				args[i] = tools.format(v)
			end

            if kind == "userdata" and v.__name == "sol.Vector" then  args[i] = v * dpi  end

			if i > args.req then
				args.misc[counter], counter = v, counter + 1
			end
		end

		return args
	end

	elemence.memorize = function (self, path, location)
		if type(self) ~= "table" or self.__name ~= "pui::element" or self[0].skipsave then return end

		location = location or config
		local main = false
		if self[0].savable then
			dirs.pave(location, self.ref, path)
			main = true
		end

		if rawget(self, "color") then
			local pathc = table.copy(path)
			pathc[#pathc] = (main and "*" or "") .. path[#path]
			dirs.pave(location, self.color.ref, pathc)
		elseif next(self[1]) then
			local pathc, gear = table.copy(path), {}
			pathc[#pathc] = (main and "~" or "") .. path[#path]
			for k, v in next, self[1] do
				if v[0].savable and not v[0].skipsave then
					gear[k] = v.ref
					if rawget(v, "color") then gear["*"..k] = v.color.ref end
				end
			end
			dirs.pave(location, gear, pathc)
		end
	end

	elemence.features = function (self, args)
		if self[0].type == "image" or self[0].type == "value" then return end

		local had_child, had_tooltip = false, false

		for i = 1, table.maxn(args) do
			local v = args[i]
			local t = type(v)

			if not had_child and t == "function" then
				local c
				methods_mt.element.create(self)
				self[1], c = v(self[0].gear, self)
				if c ~= nil then self[0].gear:depend{self, c} end
				had_child = true

			elseif not had_child and (t == "userdata" and v.__name == "sol.ImColor") or (t == "table" and (v[1] and v[1].__name == "sol.ImColor" or v[next(v)] and v[next(v)][1].__name == "sol.ImColor")) then
				local im = t == "table"
				local g = im and v[1] or v
				local d = v[2]

				methods_mt.element.color_picker(self, g)
				if d ~= nil then self.color:depend{self, d} end
				had_child = true

			elseif not had_tooltip and t == "string" or (t == "table" and type(v[1]) == "string") then
				__mt.element.tooltip(self.ref, tools.format(v))
				had_tooltip = true
			elseif i == 2 and v == false then
				self[0].skipsave = true
			end
		end
	end

	--#region: .depend

	local cases = {
		combo = function (v)
			if v[3] == true then
				return v[1].value ~= v[2]
			else
				for i = 2, #v do
					if v[1].value == v[i] then return true end
				end
			end
			return false
		end,
		list = function (v)
			if v[3] == true then
				return v[1].value ~= v[2]
			else
				for i = 2, #v do
					if v[1].value == v[i] then return true end
				end
			end
			return false
		end,
		selectable = function (v)
			if v[2] == true then
				return #v[1].value > 0
			elseif v[3] == true then
				return not table.ihas(v[1].value, unpack(v, 2))
			else
				return table.ihas(v[1].value, unpack(v, 2))
			end
		end,
		listable = function (v)
			if v[2] == true then
				return #v[1].value > 0
			elseif v[3] == true then
				return not table.ihas(v[1].value, unpack(v, 2))
			else
				return table.ihas(v[1].value, unpack(v, 2))
			end
		end,
		slider = function (v)
			return v[2] <= v[1].value and v[1].value <= (v[3] or v[2])
		end,
	}

	local depend = function (v)
		local condition = false

		if type(v[2]) == "function" then
			condition = v[2]( v[1] )
		else
			local f = cases[v[1][0].type]
			if f then condition = f(v)
			else condition = v[1].value == v[2] end
		end

		return condition and true or false
	end

	elemence.dependant = function (__depend, dependant, disabler)
		local count = 0

		for i = 1, #__depend do
			count = count + ( depend(__depend[i]) and 1 or 0 )
		end

		local eligible = count >= #__depend
		local kind = dependant.__name == "sol.lua::LuaGroup" and "group" or "element"
		__mt[kind][disabler and "disabled" or "visibility"](dependant, ternary(disabler, not eligible, eligible))
	end

	--#endregion
end

--#endregion

-- #endregion
--


-- #endregion ------------------------------------------------------------------
--



--------------------------------------------------------------------------------
-- #region :: PUI


--
-- #region : pui

--#region: variables

pui.version = _PUIVERSION

pui.colors = {}
pui.accent, pui.alpha = ui.get_style("Link Active"), ui.get_alpha()
pui.menu_position, pui.menu_size = ui.get_position(), ui.get_size()

events.render:set(function ()
	pui.accent, pui.alpha = ui.get_style("Link Active"), ui.get_alpha()
	pui.menu_position, pui.menu_size = ui.get_position(), ui.get_size()
end)

--#endregion

--#region: features

pui.string = tools.format

pui.create = function (tab, name, align)
	if type(name) == "table" then
		local collection = {}
		for k, v in ipairs(name) do
			collection[ v[1] or k ] = elemence.group( groups[{tab, v[2], v[3]}] )
		end
		return collection
	else
		return elemence.group( groups[name and {tab, name, align} or tab] )
	end
end

pui.find = function (...)
	local arg = {...}
	local children for i, v in ipairs(arg) do
		if type(v) == "table" then
			children, arg[i] = v, nil
		break end
	end

	local found = { ui.find( unpack(arg) ) }

	for i, v in ipairs(found) do
		found[i] = elemence[v.__name == "sol.lua::LuaGroup" and "group" or "new"](v)
	end

	if found[2] and found[2].ref.__name == "sol.lua::LuaVar" then
		found[1].color, found[2] = found[2], nil
	elseif children and found[1] then
		for k, v in next, children do
			local path = {...}
			path[#path] = v
			found[1][1][k] = pui.find( unpack(path) )
		end
	end


	return found[1]
end

pui.sidebar = function (name, icon)
	name, icon = tools.format(name), icon and tools.format(icon) or nil

	ui.sidebar(name, icon)
end

pui.get_icon = function (name)
	return icons[name]
end

pui.traverse = function (t, f, p)
	p = p or {}

	if type(t) == "table" and (t.__name ~= "pui::element" and t.__name ~= "pui::group") and t[#t] ~= "~" then
		for k, v in next, t do
			local np = table.copy(p); np[#np+1] = k
			pui.traverse(v, f, np)
		end
	else
		f(t, p)
	end
end

pui.translate = function (original, translations)
	original = tools.format(original)
	for k, v in next, translations or {} do
		ui.localize(k, original, tools.format(v))
	end
	return original
end

do -- categories
	local mt = {
		create = function (self, name, align)
			return elemence.group(__mt.group.create(self[1], tools.format(name), align))
		end
	}	mt.__index = mt

	local sidebar = ui.find("Aimbot", "Anti Aim"):parent():parent()
	local cats = {}

	pui.category = function (name, tab)
		name, tab = tostring(tools.format(name)), tostring(tools.format(tab))
		local ref = contend(ui.find, function () end, name, tab)

		if not cats[name] then
			cats[name] = {}
			if not ref then cats[name][0] = sidebar:create(name) end
		end
		if not cats[name][tab] then
			if ref then cats[name][tab] = ref
			else cats[name][tab] = cats[name][0]:create(tab) end
		end

		return setmetatable({cats[name][tab]}, mt)
	end
end

pui.string_recorder = {
	open = function () stringlist = {} end,
	close = function ()
		if stringlist then
			local list, count = {}, 0
			for k, v in next, stringlist do
				count = count + 1
				list[count] = k
			end
			stringlist = nil
			return list
		end
	end
}

--#endregion

--#region: config system

do
	pui.is_loading_config, pui.is_saving_config = false, false

	local function traverse_b (t, f, p)
		p = p or {}

		if type(t) == "table" and t._S == nil then
			for k, v in next, t do
				local np = table.copy(p); np[#np+1] = k
				traverse_b(v, f, np)
			end
		else
			f(t, p)
		end
	end

	local convert = function (t)
		local new = {}
		traverse_b(t, function (v, p)
			if type(v) == "table" and v._S ~= nil then
				if v._C then
					local col = table.copy(p)
					col[#col] = "*" .. col[#col]
					dirs.pave(new, v._C, col)
					dirs.pave(new, v._S, p)
				else
					local gear = table.copy(v)
					gear._S = nil
					for gk, gv in next, gear do
						if type(gv) == "table" and gv._C then
							gear["*"..gk], gear[gk] = gv._C, gv._S
						end
					end

					local gearpath = table.copy(p)
					gearpath[#gearpath] = "~" .. gearpath[#gearpath]
					dirs.pave(new, gear, gearpath)
					dirs.pave(new, v._S, p)
				end
			else
				dirs.pave(new, v, p)
			end
		end)
		return new
	end

	local locate = function (init, arg)
		if type(arg[1]) == "table" then
			local r = {}
			for i, v in ipairs(arg) do
				local d = dirs.find(init, v)
				dirs.pave(r, d, v)
			end
			
			return r
		else
			return dirs.extract(init, arg)
		end
	end

	local save = function (location, ...)
		pui.is_saving_config = true

		local arg, packed = {...}, {}

		pui.traverse(locate(location, arg), function (ref, path)
			local etype = __mt.element.type(ref)
			local value, value2 = __mt.element[etype == "hotkey" and "key" or "get"](ref)
			local vtype, v2type = type(value), type(value2)

			if etype == "color_picker" then
				if vtype == "table" then
					value2, v2type = value, vtype
					value, vtype = __mt.element.list(ref)[1], "string"
				end

				if value2 then
					value = { value }
					if v2type == "table" then
						for i = 1, #value2 do
							value[#value+1] = "#".. value2[i]:to_hex()
						end
					else
						value[2] = "#".. value2:to_hex()
					end
					value[#value+1] = "~"
				else
					value = "#".. value:to_hex()
				end
			elseif vtype == "table" then
				value[#value+1] = "~"
			end

			dirs.pave(packed, value, path)
		end)

		pui.is_saving_config = false
		return packed
	end
	local load = function (location, data, ...)
		if not data then return end

		local arg, reset = {...}, true
		if arg[1] == false then table.remove(arg, 1); reset = false end

		pui.is_loading_config = true

		local packed = convert(locate(data, arg))
		pui.traverse(locate(location, arg), function (ref, path)
			local value = dirs.find(packed, path)

			local multicolor
			local vtype, etype = type(value), __mt.element.type(ref)
			local object = elements[etype] or elements[ref.__name]

			if etype == "color_picker" then
				if vtype == "string" and value:sub(1, 1) == "#" then
					value = color(value)
					vtype = "userdata"
				elseif vtype == "table" then
					value[#value] = nil
					for i = 2, #value do value[i] = color(value[i]) end
					multicolor = true
					vtype = "userdata"
				end
			elseif vtype == "table" and value[#value] == "~" then
				value[#value] = nil
			end

			--
			if not object or (object.type ~= "any" and object.type ~= vtype) then
				return reset and __mt.element.reset(ref) or nil
			end

			pcall(function ()
				if etype == "hotkey" then
					__mt.element.key(ref, value)
				elseif etype == "color_picker" and multicolor then
					__mt.element.set(ref, value[1])
					__mt.element.set(ref, value[1], table.range(value, 2))
				else
					__mt.element.set(ref, value)
				end
			end)
		end)

		pui.is_loading_config = false
	end

	local package_mt = {
		__type = "pui::package", __metatable = false,
		__call = function (self, raw, ...)
			return (type(raw) == "table" and load or save)(self[0], raw, ...)
		end,
		save = function (self, ...) return save(self[0], ...) end,
		load = function (self, ...) load(self[0], ...) end,
	}	package_mt.__index = package_mt

	pui.setup = function (t, isolate)
		if isolate == true then
			local package = { [0] = {} }
			pui.traverse(t, function (r, p) elemence.memorize(r, p, package[0]) end)
			return setmetatable(package, package_mt)
		else
			if is_setup then return debug.warning("config is already setup by this or another script") end
			pui.traverse(t, elemence.memorize)
			is_setup = true
			return t
		end
	end

	pui.save = function (...) return save(config, ...) end
	pui.load = function (...) load(config, ...) end
end

--#endregion

-- #endregion
--

--
-- #region : methods

methods_mt.element = {
	__metatable = false,
	__type = "pui::element", __name = "pui::element",
	__tostring = function (self) return string.format("pui::element.%s \"%s\"", self[0].type, self.ref:name()) end,
	__eq = function (a, b) return __mt.element.__eq(a.ref, b.ref) end,
	__index = function (self, key)
		return rawget(methods_mt.element, key) or rawget(__mt.wrp_element, key) or rawget(self[1], key)
	end,
	__call = function (self, ...)
		return (#{...} == 0 and __mt.element.get or __mt.element.set)(self.ref, ...)
	end,

	--

	create = function (self)
		self[0].gear = self[0].gear or elemence.group(__mt.element.create(self.ref))
		return self[0].gear
	end,

	depend = function (self, ...)
		local arg = {...}
		local disabler = arg[1] == true

		local __depend = self.__depend[disabler and 2 or 1]
		for i = disabler and 2 or 1, table.maxn(arg) do
			local v = arg[i]
			if v then
				if v.__name == "pui::element" then v = {v, true} end

				v[0] = false
				__depend[#__depend+1] = v

				local check = function () elemence.dependant(__depend, self.ref, disabler) end
				check()

				__mt.element.set_callback(v[1].ref, check)
			end
		end

		return self
	end,

	--

	name = function (self, s)
		if s then	__mt.element.name(self.ref, tools.format(s))
		else		return __mt.element.name(self.ref) end
	end,
	set_name = function (self, s)
		__mt.element.name(self.ref, tools.format(s))
	end,
	get_name = function (self)
		return __mt.element.name(self.ref)
	end,

	type = function (self) return self[0].type end,
	get_type = function (self) return self[0].type end,

	list = function (self)
		return __mt.element.list(self.ref)
	end,
	get_list = function (self)
		return __mt.element.list(self.ref)
	end,
	update = function (self, ...)
		__mt.element.update(self.ref, ...)

		if self[0].type == "list" or self[0].type == "listable" then
			local value, list = __mt.element.get(self.ref), __mt.element.list(self.ref)
			if not list then return end
			local max = #list
	
			if type(value) == "number" then
				if value > max then
					__mt.element.set(self.ref, max)
					self.value = max
				end
			else
				local id = table.ifind(list, value)
	
				if id == nil or id > max then
					__mt.element.set(self.ref, list[max])
					self.value = list[max]
				end
			end
		end
	end,

	tooltip = function (self, t)
		if t then	__mt.element.tooltip(self.ref, tools.format(t))
		else		return __mt.element.tooltip(self.ref) end
	end,
	set_tooltip = function (self, t)
		__mt.element.tooltip(self.ref, tools.format(t))
	end,
	get_tooltip = function (self)
		return __mt.element.tooltip(self.ref)
	end,

	set_visible = function (self, v)
		__mt.element.visibility(self.ref, v)
	end,
	get_visible = function (self)
		__mt.element.visibility(self.ref)
	end,

	set_disabled = function (self, v)
		__mt.element.disabled(self.ref, v)
	end,
	get_disabled = function (self)
		__mt.element.disabled(self.ref)
	end,

	get_color = function (self)
		return rawget(self, "color") and self.color.value
	end,
	color_picker = function (self, default)
		self.color = elemence.new(__mt.element.color_picker(self.ref, default))

		return self.color
	end,

	set_event = function (self, event, fn, condition)
		if condition == nil then condition = true end
		local fncond, latest = type(condition) == "function", fn

		self[0].events[fn] = function ()
			local permission

			if fncond then permission = condition(self) and true or false
			else permission = self.value == condition end

			if latest ~= permission then
				events[event](fn, permission)
				latest = permission
			end
		end
		self[0].events[fn]()
		__mt.element.set_callback(self.ref, self[0].events[fn])
	end,
	unset_event = function (self, event, fn)
		events[event].unset(events[event], fn)
		__mt.element.unset_callback(self.ref, self[0].events[fn])
		self[0].events[fn] = nil
	end,

	set_callback = function (self, fn, once)
		self[0].callbacks[fn] = function () fn(self) end
		__mt.element.set_callback(self.ref, self[0].callbacks[fn], once)
	end,
	unset_callback = function (self, fn)
		if self[0].callbacks[fn] then
			__mt.element.unset_callback(self.ref, self[0].callbacks[fn])
			self[0].callbacks[fn] = nil
		end
	end,

	override = function (self, ...)
		__mt.element.override(self.ref, ...)
	end,
	get_override = function (self)
		return __mt.element.get_override(self.ref)
	end,
}

methods_mt.group = {
	__name = "pui::group", __metatable = false,
	__index = function (self, key)
		return methods_mt.group[key] or (elements[key] and pui_mt.__index(self, key) or __mt.wrp_group[key])
	end,

	name = function (self, s, t)
		local ref = t == true and self.par or self.ref
		if s then	__mt.group.name(ref, tools.format(s))
		else		return __mt.group.name(ref) end
	end,
	set_name = function (self, s, t)
		__mt.group.name(t == true and self.par or self.ref, tools.format(s))
	end,
	get_name = function (self, t)
		return __mt.group.name(t == true and self.par or self.ref)
	end,

	disabled = function (self, b, t)
		local ref = t == true and self.par or self.ref
		if b ~= nil then   __mt.group.disabled(ref, b)
		else		return __mt.group.disabled(ref) end
	end,
	set_disabled = function (self, b, t)
		__mt.group.disabled(t == true and self.par or self.ref, b and true or false)
	end,
	get_disabled = function (self, t)
		return __mt.group.disabled(t == true and self.par or self.ref)
	end,

	set_visible = function (self, b)
		__mt.group.visibility(self.ref, b and true or false)
	end,
	get_visible = function (self)
		return __mt.group.visibility(self.ref)
	end,

	depend = methods_mt.element.depend
}

-- #endregion
--

--
-- #region : pui_mt

do
	local cached = {} for key in next, elements do
		cached[key] = function (origin, ...)
			local is_child = origin.__name == "pui::group"
			local group = is_child and origin.ref or groups[origin]

			local args = elemence.dispense(key, ...)
			local this = elemence.new( __mt.group[key]( group, unpack(args, 1, args.n < args.req and args.n or args.req) ) )

			elemence.features(this, args.misc)

			return this
		end
	end

	pui_mt.__metatable = false
	pui_mt.__name = "pui::basement"
	pui_mt.__index = function (self, key)
		if not elements[key] then return ui[key] end
		return cached[key]
	end
end

-- #endregion
--


-- #endregion ------------------------------------------------------------------
--




return setmetatable(pui, pui_mt) ---------------------------<  enQ • 1927  >----