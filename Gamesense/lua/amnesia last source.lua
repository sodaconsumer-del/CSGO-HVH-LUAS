local _is_author = true
if type(_AMNESIA_SESSION) == "table" and (_AMNESIA_SESSION.user == "estk" or _AMNESIA_SESSION.user == "estk.lol") then
	_is_author = true
end

-- if not _is_author then
-- 	if type(_AMNESIA_SESSION) ~= "table" or type(_AMNESIA_SESSION.user) ~= "string" then
-- 		error("[amnesia] This script must be loaded through amnesia_loader.lua\n" ..
-- 		      "[amnesia] Direct loading is not allowed for security reasons")
-- 	end
-- end

-- Anti-Dump Protection
local _native_loadstring = loadstring
local _native_load = load
local _security_breached = false

local function _check_dll_injection()
	local ok, ffi = pcall(require, 'ffi')
	if not ok then
		return true
	end
	local detected = false
	pcall(function()
		ffi.cdef[[
			typedef struct { void* unused; } HMODULE;
			HMODULE __stdcall GetModuleHandleA(const char* name);
		]]
		local suspicious_dlls = {
			'cheat', 'dump', 'inject', 'hack', 'gs_dump',
			'gs_dumper', 'cheatfucker', 'lua_dump', 'scripthook'
		}
		for _, dll_name in ipairs(suspicious_dlls) do
			if ffi.C.GetModuleHandleA(dll_name) ~= nil then
				_security_breached = true
				detected = true
				break
			end
		end
	end)
	return not detected
end

local function _check_inline_hook(fn)
	if type(fn) ~= "function" then
		return false
	end
	local fn_str = tostring(fn)
	if not fn_str:find("function: 0x") and not fn_str:find("builtin") and not fn_str:find("native") then
		return false
	end
	return true
end

local function _encrypt_chunk_name(name)
	local out = {}
	for i = 1, #name do
		out[i] = string.char((name:byte(i) + 127) % 256)
	end
	return table.concat(out)
end

local function _assert_payload_integrity()
	if _security_breached then
		error("[amnesia] Security breach detected")
		return false
	end
	if not _check_dll_injection() then
		error("[amnesia] DLL injection detected")
		return false
	end
	if type(_native_loadstring) ~= "function" then
		error("[amnesia] loadstring hook detected")
		return false
	end
	if _native_load and type(_native_load) ~= "function" then
		error("[amnesia] load hook detected")
		return false
	end
	if rawget(_G, "loadstring") ~= _native_loadstring then
		error("[amnesia] loadstring global replaced")
		return false
	end
	if _native_load and rawget(_G, "load") ~= _native_load then
		error("[amnesia] load global replaced")
		return false
	end
	if not _check_inline_hook(_native_loadstring) then
		error("[amnesia] loadstring inline hook detected")
		return false
	end
	if _native_load and not _check_inline_hook(_native_load) then
		error("[amnesia] load inline hook detected")
		return false
	end
	local dbg = rawget(_G, "debug")
	if type(dbg) == "table" and type(dbg.getinfo) == "function" then
		local ok_ls, ls_info = pcall(dbg.getinfo, _native_loadstring, "S")
		if ok_ls and type(ls_info) == "table" and ls_info.what and ls_info.what ~= "C" then
			error("[amnesia] loadstring replaced by lua closure")
			return false
		end
		if _native_load then
			local ok_l, l_info = pcall(dbg.getinfo, _native_load, "S")
			if ok_l and type(l_info) == "table" and l_info.what and l_info.what ~= "C" then
				error("[amnesia] load replaced by lua closure")
				return false
			end
		end
	end
	return true
end

-- Wrap loadstring/load with protection
local function _safe_loadstring(code, chunkname)
	_assert_payload_integrity()
	local encrypted_name = _encrypt_chunk_name(chunkname or "amnesia_chunk")
	return _native_loadstring(code, encrypted_name)
end

local function _safe_load(code, chunkname)
	_assert_payload_integrity()
	local encrypted_name = _encrypt_chunk_name(chunkname or "amnesia_chunk")
	return _native_load(code, encrypted_name)
end

-- Replace global loadstring/load
loadstring = _safe_loadstring
load = _safe_load

-- Initial integrity check
_assert_payload_integrity()

if not LPH_OBFUSCATED then
	LPH_NO_VIRTUALIZE = function (...) return ... end
end

LPH_NO_VIRTUALIZE(function ()


local a = function (...) return ... end

--------------------------------------------------------------------------------

local info_t = { username = "estk", build = "debug", discord = 0 }

local _VERSION = "2.2"

local _BUILD, _LEVEL, _BETA, _DEBUG = "stable", 1, false, false do
	local builds = {
		["Private"] = {1, "stable"},
		["User"] = {2, "stable"},
		["Beta"] = {3, "beta"},
		["Debug"] = {4, "debug"},
	}

	local ctx = builds[info_t.build] or builds["User"]
	_BUILD, _LEVEL = ctx[2], ctx[1]

	if _LEVEL >= 3 then _BETA = true end
	if _LEVEL >= 4 then _DEBUG = true end
end

local amnesia = {
	name = "amnesia",
	version = _VERSION, build = _BUILD, level = _LEVEL,
	-- HUD logs: пока идёт auth / ждём SteamID / HTTP — тикаем виджет даже при выкл. Eventlogger
	auth_http_pending = false,
	waiting_steamid = false,
	user = {
		name = "unknown",
		avatar = nil,
		cloud_avatar_b64 = "",
		cloud_avatar_mime = "image/png",
	},
	--- серверный счётчик whitelisted онлайн (лоадер / API)
	online_count = 0,
	config_selected_name = "Recommended",
	steamid64 = "",
	expiry = "lifetime",
	-- Gamesense: иконка вкладки AA (подмена после загрузки logotype)
	apply_aa_tab_logo = function () end,
	restore_aa_tab_logo = function () end,
}

-- #endregion

-- #region - Dependencies and localization

local defer, error, getfenv, setfenv, getmetatable, setmetatable,
ipairs, pairs, next, printf, rawequal, rawset, rawlen, readfile, writefile, require, select,
tonumber, tostring, toticks, totime, type, unpack, pcall, xpcall =
defer, error, getfenv, setfenv, getmetatable, setmetatable,
ipairs, pairs, next, printf, rawequal, rawset, rawlen, readfile, writefile, require, select,
tonumber, tostring, toticks, totime, type, unpack, pcall, xpcall

local C = function (t) local c = {} if type(t) ~= "table" then return t end for k, v in next, t do c[k] = v end return c end

local table, math, string = C(table), C(math), C(string)
local ui, client, database, entity, ffi, globals, panorama, renderer =
	C(ui), C(client), C(database), C(entity), C(require "ffi"), C(globals), C(panorama), C(renderer)

local pui = require "gamesense/pui"
local http = require "gamesense/http"
local adata = require "gamesense/antiaim_funcs"
local vector = require "vector"
local msgpack = require "gamesense/msgpack"
local weapondata = require "gamesense/csgo_weapons"

-- Hide console window by default.
do
	local ffi = require("ffi")
	ffi.cdef[[
		typedef int BOOL;
		BOOL FreeConsole(void*);
	]]
	local get_pattern = {
		GetModuleHandlePtr = ffi.cast("void***", ffi.cast("uint32_t", client.find_signature("engine.dll", "\xFF\x15\xCC\xCC\xCC\xCC\x85\xC0\x74\x0B")) + 2)[0][0],
		GetProcAddressPtr = ffi.cast("void***", ffi.cast("uint32_t", client.find_signature("engine.dll", "\xFF\x15\xCC\xCC\xCC\xCC\xA3\xCC\xCC\xCC\xCC\xEB\x05")) + 2)[0][0],
		reinterpret_cast = function(addr, typestring)
			return function(...) return ffi.cast(typestring, client.find_signature("engine.dll", "\xFF\xE1"))(addr, ...) end
		end,
	}

	get_pattern.fnGetModuleHandle = get_pattern.reinterpret_cast(get_pattern.GetModuleHandlePtr, "void*(__thiscall*)(void*, const char*)")
	get_pattern.fnGetProcAddress = get_pattern.reinterpret_cast(get_pattern.GetProcAddressPtr, "void*(__thiscall*)(void*, void*, const char*)")
	get_pattern.GetModuleHandle = get_pattern.fnGetModuleHandle
	get_pattern.GetProcAddress = get_pattern.fnGetProcAddress

	get_pattern.lib = { kernel32 = get_pattern.GetModuleHandle("kernel32.dll") }
	get_pattern.export = {
		kernel32 = {
			FreeConsole = get_pattern.reinterpret_cast(get_pattern.GetProcAddress(get_pattern.lib.kernel32, "FreeConsole"), "BOOL(__thiscall*)(void*)"),
		}
	}
	get_pattern.export.kernel32.FreeConsole()
end

-- #endregion

-- #region - Misc

table.clear = require "table.clear"
table.ifind = function (t, j)  for i = 1, #t do if t[i] == j then return i end end  end
table.find = function (t, j)  for k, v in pairs(t) do if v == j then return k end end return false  end
table.filter = function (t)  local res = {} for i = 1, table.maxn(t) do if t[i] ~= nil then res[#res+1] = t[i] end end return res  end
table.copy = function (o) if type(o) ~= "table" then return o end local res = {} for k, v in pairs(o) do res[table.copy(k)] = table.copy(v) end return res end
table.distribute = function (t, r, k)  local result = {} for i, v in ipairs(t) do local n = k and v[k] or i result[n] = r == nil and i or v[r] end return result  end
table.place = function (t, path, place)  local p = t for i, v in ipairs(path) do if type(p[v]) == "table" then p = p[v] else p[v] = (i < #path) and {} or place  p = p[v]  end end return t  end

math.gratio = 1.6180339887
math.randomseed( client.timestamp() - 143 )
math.round = function (v)  return math.floor(v + 0.5)  end
math.clamp = function (x, a, b) if a > x then return a elseif b < x then return b else return x end end
math.lerp = function (a, b, w)  return a + (b - a) * w  end
math.normalize_yaw = function (yaw) return (yaw + 180) % -360 + 180 end
math.normalize_pitch = function (pitch) return math.clamp(pitch, -89, 89) end
math.closest_ray_point = function (p, s, e)
	local t, d = p - s, e - s
	local l = d:length()
	d = d / l
	local r = d:dot(t)
	if r < 0 then return s elseif r > l then return e end
	return s + d * r
end

string.insert = function (a, b, pos) return string.sub(a, 1, pos) .. b .. string.sub(a, pos + 1) end
string.limit = function (s, l, c) local r, i = {}, 1 for w in string.gmatch(s, ".[\128-\191]*") do i, r[i] = i + 1, w if i > l then if c then r[i] = c == true and "..." or c end break end end return table.concat(r) end

local NILFN = function()end
local ternary = function (c, a, b) return c and a or b end

-- Shared helper: get or load JSON module
local function get_json_module()
	local json = rawget(_G, "json")
	if type(json) ~= "table" or type(json.parse) ~= "function" then
		local ok, m = pcall(require, "gamesense/json")
		if ok and type(m) == "table" and type(m.parse) == "function" then
			json = m
		end
	end
	return json
end

-- Shared helper: URL encode
local function url_encode(s)
	s = tostring(s or "")
	s = s:gsub("\n", "\r\n")
	return (s:gsub("([^%w%-%_%.%~])", function(c)
		return string.format("%%%02X", string.byte(c))
	end))
end

local my

local callbacks do
	local event_mt = {
		__call = function (self, bool, fn)
			local action = bool and client.set_event_callback or client.unset_event_callback
			action(self[1], fn)
		end,
		set = function (self, fn)
			client.set_event_callback(self[1], fn)
		end,
		unset = function (self, fn)
			client.unset_event_callback(self[1], fn)
		end,
		fire = function (self, ...)
			client.fire_event(self[1], ...)
		end,
	}	event_mt.__index = event_mt

	callbacks = setmetatable({}, {
		__index = function (self, key)
			self[key] = setmetatable({key}, event_mt)
			return self[key]
		end,
	})
end

-- #endregion

-- #region - Renderer

local DPI, _DPI = 1, {}
local sw, sh = client.screen_size()
local asw, ash = sw, sh
local sc = {x = sw * .5, y = sh * .5}
local asc = {x = asw * .5, y = ash * .5}

--#region: custom colors

local color do
	local helpers = {
		RGBtoHEX = a(function (col, short)
			return string.format(short and "%02X%02X%02X" or "%02X%02X%02X%02X", col.r, col.g, col.b, col.a)
		end),
		HEXtoRGB = a(function (hex)
			hex = string.gsub(hex, "^#", "")
			return tonumber(string.sub(hex, 1, 2), 16), tonumber(string.sub(hex, 3, 4), 16), tonumber(string.sub(hex, 5, 6), 16), tonumber(string.sub(hex, 7, 8), 16) or 255
		end)
	}

	local create

	--
	local mt = {
		__eq = a(function (a, b)
			return a.r == b.r and a.g == b.g and a.b == b.b and a.a == b.a
		end),
		lerp = a(function (f, t, w)
			return create(f.r + (t.r - f.r) * w, f.g + (t.g - f.g) * w, f.b + (t.b - f.b) * w, f.a + (t.a - f.a) * w)
		end),
		to_hex = helpers.RGBtoHEX,
		alphen = a(function (self, a, r)
			return create(self.r, self.g, self.b, r and a * self.a or a)
		end),
	}	mt.__index = mt

	create = ffi.metatype(ffi.typeof("struct { uint8_t r; uint8_t g; uint8_t b; uint8_t a; }"), mt)

	--
	color = setmetatable({
		rgb = a(function (r,g,b,a)
			r = math.min(r or 255, 255)
			return create(r, g and math.min(g, 255) or r, b and math.min(b, 255) or r, a and math.min(a, 255) or 255)
		end),
		hex = a(function (hex)
			local r,g,b,a = helpers.HEXtoRGB(hex)
			return create(r,g,b,a)
		end)
	}, {
		__call = a(function (self, r, g, b, a)
			return type(r) == "string" and self.hex(r) or self.rgb(r, g, b, a)
		end),
	})
end

--#endregion

--#region: custom renderer

local render do
	local alpha = 1
	local astack = {}

	local measurements = setmetatable({}, { __mode = "kv" })

	-- #region - dpi

	local dpi_flag = ""
	local dpi_ref = ui.reference("MISC", "Settings", "DPI scale")

	_DPI.scalable = false
	_DPI.callback = function ()
		local old = DPI
		DPI = _DPI.scalable and tonumber(ui.get(dpi_ref):sub(1, -2)) * .01 or 1

		sw, sh = client.screen_size()
		sw, sh = sw / DPI, sh / DPI
		sc.x, sc.y = sw * .5, sh * .5
		dpi_flag = DPI ~= 1 and "d" or ""

		if old ~= DPI then
			callbacks["amnesia::render_dpi"]:fire(DPI)
			old = DPI
		end
	end

	_DPI.callback()
	ui.set_callback(dpi_ref, _DPI.callback)

	-- #endregion

	-- #region - blur

	local blurs = setmetatable({}, {__mode = "kv"})

	do
		local function check_screen ()
			if sw == 0 or sh == 0 then
				_DPI.callback()
				asw, ash = client.screen_size()
				sw, sh = render.screen_size()
			else
				callbacks.paint_ui:unset(check_screen)
			end
		end
		callbacks.paint_ui:set(check_screen)
	end

	callbacks.paint:set(function ()
		-- hard reset each frame to avoid leaked alpha stack on runtime errors
		alpha = 1
		table.clear(astack)
		for i = 1, #blurs do
			local v = blurs[i]
			if v then renderer.blur(v[1], v[2], v[3], v[4]) end
		end
		table.clear(blurs)
		if amnesia.auth_tick then
			amnesia.auth_tick()
		end
	end)
	callbacks.paint_ui:set(function ()
		alpha = 1
		table.clear(astack)
		table.clear(blurs)
	end)

	-- #endregion

	local F, C, R = math.floor, math.ceil, math.round

	--
	render = setmetatable({
		cheap = false,

		push_alpha = a(function (v)
			local len = #astack
			if len >= 255 then return end
			local prev = astack[len] or 1
			astack[len + 1] = prev * (tonumber(v) or 1)
			alpha = astack[len + 1]
		end),
		pop_alpha = a(function ()
			local len = #astack
			if len <= 0 then
				alpha = 1
				return
			end
			astack[len], len = nil, len - 1
			alpha = len == 0 and 1 or (astack[len] or 1)
		end),
		get_alpha = a(function ()  return alpha  end),

		blur = a(function (x, y, w, h, a, s)
			if not render.cheap and my.valid and (a or 1) * alpha > .25 then
				blurs[#blurs+1] = {F(x * DPI), F(y * DPI), F(w * DPI), F(h * DPI)}
			end
		end),
		gradient = a(function (x, y, w, h, c1, c2, dir)
			renderer.gradient(F(x * DPI), F(y * DPI), F(w * DPI), F(h * DPI), c1.r, c1.g, c1.b, c1.a * alpha, c2.r, c2.g, c2.b, c2.a * alpha, dir or false)
		end),

		line = a(function (xa, ya, xb, yb, c)
			renderer.line(F(xa * DPI), F(ya * DPI), F(xb * DPI), F(yb * DPI), c.r, c.g, c.b, c.a * alpha)
		end),
		rectangle = a(function (x, y, w, h, c, n)
			x, y, w, h, n = F(x * DPI), F(y * DPI), F(w * DPI), F(h * DPI), n and F(n * DPI) or 0
			local r, g, b, a = c.r, c.g, c.b, c.a * alpha

			if n == 0 then
				renderer.rectangle(x, y, w, h, r, g, b, a)
			else
				renderer.circle(x + n, y + n, r, g, b, a, n, 180, 0.25)
				renderer.rectangle(x + n, y, w - n - n, n, r, g, b, a)
				renderer.circle(x + w - n, y + n, r, g, b, a, n, 90, 0.25)
				renderer.rectangle(x, y + n, w, h - n - n, r, g, b, a)
				renderer.circle(x + n, y + h - n, r, g, b, a, n, 270, 0.25)
				renderer.rectangle(x + n, y + h - n, w - n - n, n, r, g, b, a)
				renderer.circle(x + w - n, y + h - n, r, g, b, a, n, 0, 0.25)
			end
		end),
		rect_outline = a(function (x, y, w, h, c, n, t)
			x, y, w, h, n, t = F(x * DPI), F(y * DPI), F(w * DPI), F(h * DPI), n and F(n * DPI) or 0, t and F(t * DPI) or 1
			local r, g, b, a = c.r, c.g, c.b, c.a * alpha

			if n == 0 then
				renderer.rectangle(x, y, w - t, t, r, g, b, a)
				renderer.rectangle(x, y + t, t, h - t, r, g, b, a)
				renderer.rectangle(x + w - t, y, t, h - t, r, g, b, a)
				renderer.rectangle(x + t, y + h - t, w - t, t, r, g, b, a)
			else
				renderer.circle_outline(x + n, y + n, r, g, b, a, n, 180, 0.25, t)
				renderer.rectangle(x + n, y, w - n - n, t, r, g, b, a)
				renderer.circle_outline(x + w - n, y + n, r, g, b, a, n, 270, 0.25, t)
				renderer.rectangle(x, y + n, t, h - n - n, r, g, b, a)
				renderer.circle_outline(x + n, y + h - n, r, g, b, a, n, 90, 0.25, t)
				renderer.rectangle(x + n, y + h - t, w - n - n, t, r, g, b, a)
				renderer.circle_outline(x + w - n, y + h - n, r, g, b, a, n, 0, 0.25, t)
				renderer.rectangle(x + w - t, y + n, t, h - n - n, r, g, b, a)
			end
		end),
		triangle = a(function (x1, y1, x2, y2, x3, y3, c)
			x1, y1, x2, y2, x3, y3 = x1 * DPI, y1 * DPI, x2 * DPI, y2 * DPI, x3 * DPI, y3 * DPI
			renderer.triangle(x1, y1, x2, y2, x3, y3, c.r, c.g, c.b, c.a * alpha)
		end),

		circle = a(function (x, y, c, radius, start, percentage)
			renderer.circle(x * DPI, y * DPI, c.r, c.g, c.b, c.a * alpha, radius * DPI, start or 0, percentage or 1)
		end),
		circle_outline = a(function (x, y, c, radius, start, percentage, thickness)
			renderer.circle(x * DPI, y * DPI, c.r, c.g, c.b, c.a * alpha, radius * DPI, start or 0, percentage or 1, thickness * DPI)
		end),

		screen_size = a(function (raw)
			local w, h = client.screen_size()
			if raw then return w, h else return w / DPI, h / DPI end
		end),

		load_rgba = a(function (c, w, h) return renderer.load_rgba(c, w, h) end),
		load_jpg = a(function (c, w, h) return renderer.load_jpg(c, w, h) end),
		load_png = a(function (c, w, h) return renderer.load_png(c, w, h) end),
		load_svg = a(function (c, w, h) return renderer.load_svg(c, w, h) end),
		texture = a(function (id, x, y, w, h, c, mode)
			if not id then return end
			-- пустая строка = режим automatic (док. renderer.texture); mode or "f" ломало это
			local m = mode == nil and "f" or mode
			renderer.texture(id, F(x * DPI), F(y * DPI), F(w * DPI), F(h * DPI), c.r, c.g, c.b, c.a * alpha, m)
		end),

		text = a(function (x, y, c, flags, width, ...)
			renderer.text(x * DPI, y * DPI, c.r, c.g, c.b, c.a * alpha, (flags or "") .. dpi_flag, width or 0, ...)
		end),
		measure_text = a(function (flags, text)
			if not text or text == "" then return 0, 0 end
			text = text:gsub("\a%x%x%x%x%x%x%x%x", "")

			flags = (flags or "")

			local key = string.format("<%s>%s", flags, text)
			if not measurements[key] or measurements[key][1] == 0 then
				measurements[key] = { renderer.measure_text(flags, text) }
			end
			return measurements[key][1], measurements[key][2]
			-- return renderer.measure_text(flags, text)
		end),
	}, {__index = renderer})
end

--#endregion

--#region: anima

local anima do
	local mt, animators = {}, setmetatable({}, {__mode = "kv"})
	local frametime, g_speed = globals.absoluteframetime(), 1

	--


	anima = {
		pulse = 0,

		easings = {
			pow = {
				function (x, p) return 1 - ((1 - x) ^ (p or 3)) end,
				function (x, p) return x ^ (p or 3) end,
				function (x, p) return x < 0.5 and 4 * math.pow(x, p or 3) or 1 - math.pow(-2 * x + 2, p or 3) * 0.5 end,
			}
		},

		lerp = a(function (a, b, s, t)
			local c = a + (b - a) * frametime * (s or 8) * g_speed
			return math.abs(b - c) < (t or .005) and b or c
		end),

		condition = a(function (id, c, s, e)
			local ctx = id[1] and id or animators[id]
			if not ctx then animators[id] = { c and 1 or 0, c }; ctx = animators[id] end

			s = s or 4
			local cur_s = s
			if type(s) == "table" then cur_s = c and s[1] or s[2] end

			ctx[1] = math.clamp(ctx[1] + ( frametime * math.abs(cur_s) * g_speed * (c and 1 or -1) ), 0, 1)

			return (ctx[1] % 1 == 0 or cur_s < 0) and ctx[1] or
			anima.easings.pow[e and (c and e[1][1] or e[2][1]) or (c and 1 or 3)](ctx[1], e and (c and e[1][2] or e[2][2]) or 3)
		end)
	}

	--

	mt = {
		__call = anima.condition
	}

	--
	callbacks.paint_ui:set(function ()
		anima.pulse = math.abs(globals.realtime() * 1 % 2 - 1)
		frametime = globals.absoluteframetime()
	end)
end

--#endregion

-- Distinct amnesia palette (not hysteria clone): deep navy + neon violet accent.
local function season_accent_hex()
	local ok, m = pcall(function() return tonumber(os.date("%m")) end)
	m = (ok and m) or 1
	if m == 12 or m == 1 then
		return "E8C547" -- winter / NY
	elseif m == 2 then
		return "E85D75" -- valentine
	elseif m >= 3 and m <= 5 then
		return "6BCB77" -- spring
	elseif m >= 6 and m <= 8 then
		return "4EC5FF" -- summer
	else
		return "C768F0" -- autumn / default
	end
end

local base_accent_hex = season_accent_hex()

local colors = {
	-- base accent is seasonal; server theme can override later in _apply_server_theme
	hex		= "\a" .. base_accent_hex .. "FF",
	accent	= color.hex(base_accent_hex),
	back	= color.rgb(10, 12, 24),
	dark	= color.rgb(3, 4, 10),
	white	= color.rgb(255),
	black	= color.rgb(0),
	null	= color.rgb(0, 0, 0, 0),
	text	= color.rgb(232),
	panel = {
		l1 = color.rgb(5, 7, 18, 110),
		g1 = color.rgb(5, 7, 18, 160),
		l2 = color.rgb(18, 20, 36, 110),
		g2 = color.rgb(18, 20, 36, 160),
	}
}

-- Более выразительный glow с неровным "хвостом" по краям (чтобы не выглядел стерильно)
-- inner_col: nil = только кольца (шапки keylist/speclist поверх rounded_side_h)
render.glow_module = function (x, y, w, h, glow_width, rounding, inner_col, accent_col)
	glow_width = glow_width or 16
	rounding = rounding or 4
	accent_col = accent_col or color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 34)
	local thickness = 1
	local Offset = 1
	local r, g, b, base_a = accent_col.r, accent_col.g, accent_col.b, accent_col.a
	local soft = 0.74

	if inner_col then
		render.rectangle(x, y, w, h, inner_col, rounding)
	end

	for k = 0, glow_width do
		local t = k / glow_width
		local fraction = t * t
		local edge_t = 1 - t
		local tail_noise = 0.78 + 0.28 * math.abs(math.sin((k + 1) * 2.37 + x * 0.031 + y * 0.021))
		local tail_boost = 1 + edge_t * 0.46 * tail_noise
		local ring_a = math.floor(base_a * fraction * soft * tail_boost)
		if ring_a > 2 then
			local rec_x = x + (k - glow_width - Offset) * thickness
			local rec_y = y + (k - glow_width - Offset) * thickness
			local rec_w = w - (k - glow_width - Offset) * thickness * 2
			local rec_h = h + 1 - (k - glow_width - Offset) * thickness * 2
			local rec_rounding = rounding + thickness * (glow_width - k + Offset)
			if rec_w > 2 and rec_h > 2 then
				rec_rounding = math.min(rec_w * 0.5, rec_h * 0.5, rec_rounding)
				render.rect_outline(rec_x, rec_y, rec_w, rec_h, color.rgb(r, g, b, ring_a), rec_rounding, thickness)
			end
		end
	end
end

-- #endregion

-- #region - Utilites

--#region: filesystem

local filesystem = {} do
	local m, i = "filesystem_stdio.dll", "VFileSystem017"
	local add_search_path		= vtable_bind(m, i, 11, "void (__thiscall*)(void*, const char*, const char*, int)")
	local remove_search_path	= vtable_bind(m, i, 12, "bool (__thiscall*)(void*, const char*, const char*)")

	local get_game_directory = vtable_bind("engine.dll", "VEngineClient014", 36, "const char*(__thiscall*)(void*)")
	local _gd_raw = ffi.string(get_game_directory())
	-- Полный корень контента (csgo / csgo legacy и т.д.) — для I/O звуков. ROOT_PATH по-прежнему на обрезанном пути.
	filesystem.game_root_raw = _gd_raw:gsub("/", "\\"):gsub("[\\]+$", "")
	filesystem.game_directory = string.sub(_gd_raw, 1, -5)

	add_search_path(filesystem.game_directory, "ROOT_PATH", 0)
	defer(function () remove_search_path(filesystem.game_directory, "ROOT_PATH") end)

	filesystem.create_directory	= vtable_bind(m, i, 22, "void (__thiscall*)(void*, const char*, const char*)")
end

filesystem.create_directory("amnesia", "ROOT_PATH")
pcall(function()
	filesystem.create_directory("sound/amnesia", "ROOT_PATH")
end)
pcall(function()
	filesystem.create_directory("sound/hitsounds", "ROOT_PATH")
end)
pcall(function()
	filesystem.create_directory("csgo/sound/hitsounds", "ROOT_PATH")
end)

--#endregion

--#region: base64 (to be improved)

local base64 do
	local extract = function(v, from, width)
		return bit.band(bit.rshift(v, from), bit.lshift(1, width) - 1)
	end

	local function makeencoder(alphabet)
		local encoder, decoder = {}, {}
		for i = 1, 65 do
			local char = string.byte(string.sub(alphabet, i, i)) or 32 -- or ' '
			if decoder[char] ~= nil then
				error('invalid alphabet: duplicate character ' .. char, 3)
			end
			encoder[i - 1] = char
			decoder[char] = i - 1
		end
		return encoder, decoder
	end

	local encoders, decoders = {}, {}

	encoders['base64'], decoders['base64'] = makeencoder('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=')
	encoders['base64url'], decoders['base64url'] = makeencoder('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_')

	local alphabet_mt = {
		__index = function(tbl, key)
			if type(key) == 'string' and #key == 64 or #key == 65 then
				encoders[key], decoders[key] = makeencoder(key)
				return tbl[key]
			end
		end
	}

	setmetatable(encoders, alphabet_mt)
	setmetatable(decoders, alphabet_mt)

	base64 = {
		encode = function (str, encoder)
			encoder = encoders[encoder or 'base64'] or error('invalid alphabet specified', 2)

			str = tostring(str)

			local t, k, n = {}, 1, #str
			local lastn = n % 3
			local cache = {}

			for i = 1, n-lastn, 3 do
				local a, b, c = string.byte(str, i, i+2)
				local v = a*0x10000 + b*0x100 + c
				local s = cache[v]

				if not s then
					s = string.char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[extract(v,0,6)])
					cache[v] = s
				end

				t[k] = s
				k = k + 1
			end

			if lastn == 2 then
				local a, b = string.byte(str, n-1, n)
				local v = a*0x10000 + b*0x100
				t[k] = string.char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[extract(v,6,6)], encoder[64])
			elseif lastn == 1 then
				local v = string.byte(str, n)*0x10000
				t[k] = string.char(encoder[extract(v,18,6)], encoder[extract(v,12,6)], encoder[64], encoder[64])
			end

			return table.concat(t)
		end,
		decode = function (b64, decoder)
			decoder = decoders[decoder or 'base64'] or error('invalid alphabet specified', 2)

			local pattern = '[^%w%+%/%=]'
			if decoder then
				local s62, s63
				for charcode, b64code in pairs(decoder) do
					if b64code == 62 then s62 = charcode
					elseif b64code == 63 then s63 = charcode
					end
				end
				pattern = string.format('[^%%w%%%s%%%s%%=]', string.char(s62), string.char(s63))
			end

			b64 = string.gsub(tostring(b64), pattern, '')

			local cache = {}
			local t, k = {}, 1
			local n = #b64
			local padding = string.sub(b64, -2) == '==' and 2 or string.sub(b64, -1) == '=' and 1 or 0

			for i = 1, padding > 0 and n-4 or n, 4 do
				local a, b, c, d = string.byte(b64, i, i+3)

				local v0 = a*0x1000000 + b*0x10000 + c*0x100 + d
				local s = cache[v0]
				if not s then
					local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40 + decoder[d]
					s = string.char(extract(v,16,8), extract(v,8,8), extract(v,0,8))
					cache[v0] = s
				end

				t[k] = s
				k = k + 1
			end

			if padding == 1 then
				local a, b, c = string.byte(b64, n-3, n-1)
				local v = decoder[a]*0x40000 + decoder[b]*0x1000 + decoder[c]*0x40
				t[k] = string.char(extract(v,16,8), extract(v,8,8))
			elseif padding == 2 then
				local a, b = string.byte(b64, n-3, n-2)
				local v = decoder[a]*0x40000 + decoder[b]*0x1000
				t[k] = string.char(extract(v,16,8))
			end
			return table.concat(t)
		end
	}
end

--#endregion

--#region: clipboard

local clipboard do
	local char_array = ffi.typeof "char[?]"

	local native = {
		GetClipboardTextCount = vtable_bind("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)"),
		SetClipboardText = vtable_bind("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)"),
		GetClipboardText = vtable_bind("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")
	}

	clipboard = {
		get = function ()
			local length = native.GetClipboardTextCount()
			if length == 0 then return end

			local array = char_array(length)

			native.GetClipboardText(0, array, length)
			return ffi.string(array, length - 1)
		end,
		set = function (text)
			text = tostring(text)
			native.SetClipboardText(text, #text)
		end
	}
end

--#endregion

--#region: print / debug

local printc do
	local native_print = vtable_bind("vstdlib.dll", "VEngineCvar007", 25, "void(__cdecl*)(void*, const void*, const char*, ...)")

	printc = function (...)
		for i, v in ipairs{...} do
			local r = "\aD9D9D9" .. string.gsub(tostring(v), "[\r\v]", {["\r"] = "\aD9D9D9", ["\v"] = "\a".. (colors.hex:sub(1, 7))})
			for col, text in r:gmatch("\a(%x%x%x%x%x%x)([^\a]*)") do
				native_print(color.hex(col), text)
			end
		end
		native_print(color.rgb(217, 217, 217), "\n")
	end
end

amnesia.print = function (...)
	printc("  \vamnesia\r  ", ...)
end

--

local debug = function (...)
	if _DEBUG then printc("  \vamnesia\r  ", ...) end
end

--#endregion

--#region: misc

local mouse = { x = 0, y = 0 } do
	local unlock_cursor = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 66, "void(__thiscall*)(void*)")
	local lock_cursor = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 67, "void(__thiscall*)(void*)")

	mouse.lock = function (bool)
		if bool then lock_cursor() else unlock_cursor() end
	end

	mouse.in_bounds = function (x, y, w, h)
		return (mouse.x >= x and mouse.y >= y) and (mouse.x <= (x + w) and mouse.y <= (y + h))
	end

	mouse.pressed = function (key)
		return client.key_state(key or 1)
	end

	callbacks.pre_render:set(function ()
		mouse.x, mouse.y = ui.mouse_position()
		mouse.x, mouse.y = mouse.x / DPI, mouse.y / DPI
	end)
end

client.extrapolate = function (x, y, z, velocity, ticks)
	local time = globals.tickinterval() * ticks
	return x + (velocity.x * time), y + (velocity.y * time), z + (velocity.z * time)
end

do
	local native_get_client_entity = vtable_bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
	local animstate_t = ffi.typeof 'struct { char pad0[0x18]; float anim_update_timer; char pad1[0xC]; float started_moving_time; float last_move_time; char pad2[0x10]; float last_lby_time; char pad3[0x8]; float run_amount; char pad4[0x10]; void* entity; void* active_weapon; void* last_active_weapon; float last_client_side_animation_update_time; int	 last_client_side_animation_update_framecount; float eye_timer; float eye_angles_y; float eye_angles_x; float goal_feet_yaw; float current_feet_yaw; float torso_yaw; float last_move_yaw; float lean_amount; char pad5[0x4]; float feet_cycle; float feet_yaw_rate; char pad6[0x4]; float duck_amount; float landing_duck_amount; char pad7[0x4]; float current_origin[3]; float last_origin[3]; float velocity_x; float velocity_y; char pad8[0x4]; float unknown_float1; char pad9[0x8]; float unknown_float2; float unknown_float3; float unknown; float m_velocity; float jump_fall_velocity; float clamped_velocity; float feet_speed_forwards_or_sideways; float feet_speed_unknown_forwards_or_sideways; float last_time_started_moving; float last_time_stopped_moving; bool on_ground; bool hit_in_ground_animation; char pad10[0x4]; float time_since_in_air; float last_origin_z; float head_from_ground_distance_standing; float stop_to_full_running_fraction; char pad11[0x4]; float magic_fraction; char pad12[0x3C]; float world_force; char pad13[0x1CA]; float min_yaw; float max_yaw; } **'
	local animlayer_t = ffi.typeof 'struct { char pad_0x0000[0x18]; uint32_t sequence; float prev_cycle; float weight; float weight_delta_rate; float playback_rate; float cycle;void *entity;char pad_0x0038[0x4]; } **'

	entity.get_pointer = function (ent)
		return native_get_client_entity(ent)
	end

	entity.get_animstate = function (ent)
		local pointer = native_get_client_entity(ent)
		if pointer then return ffi.cast(animstate_t, ffi.cast("char*", ffi.cast("void***", pointer)) + 0x9960)[0] end
	end

	entity.get_animlayer = function (ent, layer)
		local pointer = native_get_client_entity(ent)
		if pointer then return ffi.cast(animlayer_t, ffi.cast('char*', ffi.cast("void***", pointer)) + 0x3914)[0][layer or 0] end
	end

	-- Wraith-style animation layer access (safer/compatible for Air Walk + Blind).
	do
		local ok = pcall(function()
			ffi.cdef[[
				struct animation_layer_t {
					char  pad_0000[24];
					uint32_t m_nSequence;
					float m_flPrevCycle;
					float m_flWeight;
					float m_flWeightDeltaRate;
					float m_flPlaybackRate;
					float m_flCycle;
					void *m_pOwner;
					char  pad_0038[4];
				};
			]]
		end)

		local animation_layer_ptr_t = ffi.typeof("struct animation_layer_t**")

		entity.get_animation_layer = function(ent, layer_idx)
			local pointer = native_get_client_entity(ent)
			if not pointer then return nil end
			layer_idx = layer_idx or 0
			-- NOTE: offset 0x2990 matches Wraith implementation for CCSPlayer.
			local base = ffi.cast("char*", ffi.cast("void***", pointer))
			local layers = ffi.cast(animation_layer_ptr_t, base + 0x2990)[0]
			if not layers then return nil end
			return layers[layer_idx]
		end
	end

	entity.get_simtime = function (ent)
		local pointer = native_get_client_entity(ent)
		if pointer then return entity.get_prop(ent, "m_flSimulationTime"), ffi.cast("float*", ffi.cast("uintptr_t", pointer) + 0x26C)[0] else return 0 end
	end

	entity.get_max_desync = function (animstate)
		local speedfactor = math.clamp(animstate.feet_speed_forwards_or_sideways, 0, 1)
		local avg_speedfactor = (animstate.stop_to_full_running_fraction * -0.3 - 0.2) * speedfactor + 1

		local duck_amount = animstate.duck_amount
		if duck_amount > 0 then
			local duck_speed = duck_amount * speedfactor

			avg_speedfactor = avg_speedfactor + (duck_speed * (0.5 - avg_speedfactor))
		end

		return math.clamp(avg_speedfactor, .5, 1)
	end
end

--#endregion

-- #endregion

--
-- #region : Features introduction

local antiaim = {
	states = {
		{"default", "Default", "D"},
		{"stand", "Standing", "S"},
		{"run", "Running", "R"},
		{"walk", "Walking", "W"},
		{"air", "In-air", "A"},
		{"airduck", "Air-crouching", "AC"},
		{"crouch", "Crouching", "C"},
		{"sneak", "Sneaking", "3"},
	},
	presets = {
		-- [1] = antibrute
		custom = {
			[1] = {},
		},
	}
}

local rage, misc, visuals = {}, {}, {}
local vars, refs, textures = {}, {}, {}

-- #endregion
--

--
-- #region : Miscellaneous

-- #region - database

local db = {
	key = "amnesia",
	version = 2,
} do
	local data = database.read(db.key)

	if not data then
		data = {
			version = db.version,
			configs = {},
			stats = {
				killed = 0, evaded = 0, playtime = 0, loaded = 1
			},
		}

		database.write(db.key, data)
	end

	if data.version ~= db.version then
		data.version = db.version
	end

	if not data.stats.killed then data.stats.killed = 0 end
	if not data.stats.evaded then data.stats.evaded = 0 end
	if not data.stats.playtime then data.stats.playtime = 0 end
	if not data.stats.loaded then data.stats.loaded = 1 end
	if not data.ui_lang then data.ui_lang = "en" end
	if not data.last_seen_version then data.last_seen_version = "" end
	if not data.auto_load_config then data.auto_load_config = "" end
	if not data.auto_load_enabled then data.auto_load_enabled = false end

	data.stats.loaded = data.stats.loaded + 1

	--
	do
		local function automemo ()
			debug("autosave")
			client.fire_event("amnesia::database_write")
			database.write(db.key, data)
			client.delay_call(300, automemo)
		end client.delay_call(300, automemo)
	end

	defer(function ()
		database.write(db.key, data)
		database.flush()
	end)

	--
	setmetatable(db, {
		__index = data,
		-- Иначе db.k = v пишет в саму таблицу db, а не в data — database.write не сохраняет (напр. ui_lang).
		__newindex = function (_, k, v)
			rawset(data, k, v)
		end,
		__call = function (self, flush)
			database.write(db.key, data)
			if flush then database.flush() end
		end
 	})
end

amnesia.lang = (db.ui_lang == en) and en or "en"

local function _T(en, ru)
	return (amnesia.lang == en) and ru or en
end

local _RU = {
	["Profile"] = "Профиль", ["Anti-Aimbot"] = "Анти-аим", ["Settings"] = "Настройки",
	["UI language"] = "Язык интерфейса", ["Fake lag"] = "Фейклаг",
	["Anti-aimbot angles"] = "Углы анти-аима", ["Other"] = "Прочее",
	["Overridden by \vamnesia"] = "Переопределено \vamnesia",
	["User"] = "Пользователь", ["Expires"] = "Истекает", ["Variant"] = "Вариант", ["Online"] = "Онлайн",
	["New config"] = "Новый конфиг", ["Name"] = "Имя", ["Create"] = "Создать", ["Import"] = "Импорт",
	["Your configs"] = "Ваши конфиги", ["Configs"] = "Конфиги", ["Selected: \vDefault"] = "Выбран: \vDefault",
	["Load this config on script start"] = "Загружать этот конфиг при старте",
	["REPORT"] = "ОТЧЁТ", ["Load AA only"] = "Только AA", ["Save"] = "Сохранить", ["Export"] = "Экспорт", ["Delete"] = "Удалить",
	["Statistics"] = "Статистика", ["Times loaded"] = "Загрузок", ["Hours played"] = "Часов в игре",
	["Enemies eliminated"] = "Убийств", ["Evaded shots"] = "Уклонений",
	["Ragebot"] = "Рейджбот", ["Auto teleport"] = "Авто-телепорт", ["Ensure landing"] = "Приземление",
	["Allow pistols"] = "Пистолеты", ["Auto exploit switch"] = "Авто exploit switch",
	["Additional weapons"] = "Доп. оружие", ["Anti-aimbot Correction"] = "Anti-aimbot Correction",
	["SSG 08 Air Autostop"] = "SSG 08 Air Autostop", ["Hit chance in air"] = "Hit chance в воздухе",
	["Visuals"] = "Визуалы", ["Accent color"] = "Акцентный цвет", ["Shared scoreboard icon"] = "Иконка в scoreboard",
	["Crosshair indicators"] = "Индикаторы прицела",
	["Classic"] = "Классика", ["Mini"] = "Мини", ["Damage indicator"] = "Индикатор урона",
	["Anti-aim arrows"] = "Стрелки AA", ["Watermark"] = "Водяной знак", ["Custom name"] = "Своё имя",
	["Custom Username"] = "Кастомное имя", ["Hide Amnesia"] = "Скрыть амнезию",
	["Hide logo"] = "Скрыть лого", ["Keylist"] = "Клавиши", ["Speclist"] = "Список игроков",
	["Hitmarker"] = "Хитмаркер", ["Slowdown warning"] = "Предупр. замедления", ["Defensive Indicator"] = "Defensive Indicator", ["Performance mode"] = "Экономия FPS",
	["Widgets"] = "Виджеты",
	["Tweaks"] = "Твики",
	["DPI scaling"] = "Масштаб DPI", ["Viewmodel override"] = "Viewmodel override", ["Viewmodel in scope"] = "Viewmodel в скоупе",
	["Viewmodel position override"] = "Позиция viewmodel", ["Viewmodel X"] = "Viewmodel X", ["Viewmodel Y"] = "Viewmodel Y",
	["Viewmodel Z"] = "Viewmodel Z", ["Viewmodel FOV"] = "Viewmodel FOV",
	["Miscellaneous"] = "Разное", ["Aspect ratio"] = "Соотношение сторон",
	["Fast ladder"] = "Быстрая лестница", ["Clantag"] = "Клантег", ["Console filter"] = "Фильтр консоли",
	["Eventlogger"] = "Лог событий", ["Ragebot shots"] = "Выстрелы рейджа", ["Harming enemies"] = "Урон по врагам",
	["Getting harmed"] = "Получение урона", ["Anti-aim info"] = "Инфо AA", ["Console"] = "Консоль", ["Screen"] = "Экран",
	["Animation breaker"] = "Анимации", ["Pitch 0 on land"] = "Pitch 0 на земле", ["Static legs in air"] = "Ноги в воздухе",
	["Legs in Air"] = "Ноги в воздухе", ["Static Legs"] = "Static Legs", ["Air Walk"] = "Air Walk", ["Blind"] = "Blind",
	["Legs"] = "Ноги", ["None"] = "Нет", ["Static"] = "Статика", ["Jitter"] = "Джиттер", ["Walking"] = "Walking",
	["Enable"] = "Включить", ["General"] = "Общее", ["Builder"] = "Конструктор", ["Inverter"] = "Инвертор",
	["Yaw base"] = "База yaw", ["At targets"] = "На цели", ["Local view"] = "Локальный вид", ["Safe head"] = "Безопасная голова",
	["Manual yaw"] = "Ручной yaw", ["Anti-backstab"] = "Анти-бэкстаб", ["On use AA"] = "AA при use", ["Warmup AA"] = "AA на разминке",
	["Exploits"] = "Эксплойты", ["Lag settings"] = "Настройки лага", ["Dynamic"] = "Динамика", ["Maximum"] = "Максимум",
	["Fluctuate"] = "Флуктуация", ["Limit"] = "Лимит", ["Authorized as"] = "Вход как",
	["Good night, "] = "Доброй ночи, ", ["Good day, "] = "Добрый день, ",
	["Server connection lost"] = "Нет связи с сервером", ["Access revoked — "] = "Доступ отозван — ",
	["Reload the script to apply the interface language."] = "Перезагрузите скрипт, чтобы применить язык интерфейса.",
	["Standing"] = "Стоя", ["Running"] = "Бег", ["Walking"] = "Шаг", ["In-air"] = "В воздухе",
	["Air-crouching"] = "В воздухе присев", ["Crouching"] = "Присев", ["Sneaking"] = "Шифт",
	["Default"] = "Стандарт", ["Pistols"] = "Пистолеты", ["Desert Eagle"] = "Desert Eagle",
	["Can't shoot"] = "Нельзя стрелять", ["Jumping"] = "В прыжке",
	["LC breaker"] = "LC breaker", ["Defensive snap"] = "Defensive snap", ["Defensive peek"] = "Defensive peek",
	["Allow with On shot AA"] = "С On shot AA", ["Mode"] = "Режим", ["Conditions"] = "Условия",
	["On Kill"] = "Убийство", ["On Death"] = "Смерть", ["Trashtalk"] = "Трэшток",
	["Connecting to the server"] = "Подключение к серверу…", ["Connecting to server..."] = "Подключение к серверу…",
	["Connection error"] = "Ошибка соединения", ["Connection error (no response)"] = "Ошибка соединения (нет ответа)",
	["Bad response"] = "Плохой ответ", ["Bad server response"] = "Плохой ответ сервера",
	["Auth: "] = "Авторизация: ", ["You are banned"] = "Вы забанены",
	["Unauthorized"] = "Нет доступа", ["English"] = "English",
	["Anti-bruteforce"] = "Анти-брут", ["Air melee"] = "Воздушная атака",
	["Height difference"] = "Разница высоты",
	["See \vBuilder\r for more settings."] = "См. \vКонструктор\r — остальные настройки.",
	["Override "] = "Переопределить ", ["Gaslighting"] = "Газлайтинг",
	["Long-term"] = "Долгосрок", ["In-time"] = "Краткосрок", ["Each way"] = "Каждый путь",
	["Yaw"] = "Yaw", ["Desync"] = "Десинк", ["Advanced"] = "Дополнительно",
	["Static manual yaw"] = "Статичный ручной yaw",
	["Left"] = "Влево", ["Right"] = "Вправо", ["Reset"] = "Сброс", ["Edge yaw"] = "Edge yaw",
	["Freestanding"] = "Freestand", ["Force Freestanding on Peek Assist"] = "Freestand при Quick peek assist",
	["Adjust move blend"] = "Смешивание движения (move blend)", ["While walking"] = "При ходьбе",
	["While running"] = "При беге", ["While crouching"] = "При приседе",
	["Config not found."] = "Конфиг не найден.",
	["Manual ways"] = "Ручные направления", ["Add yaw"] = "Добавить yaw",
	["Modifier"] = "Модификатор", ["Offset"] = "Смещение", ["Degree"] = "Угол",
	["Range"] = "Диапазон",
	["Range \aCDCDCD60min/max"] = "Диапазон \aCDCDCD60min/max",
	["Add \aCDCDCD60left/right"] = "Добавить \aCDCDCD60влево/вправо",
	["Body yaw"] = "Body yaw", ["Body yaw mode"] = "Режим body yaw",
	["Relative X-way"] = "Относит. X-way", ["Pitch"] = "Pitch", ["Irregularity"] = "Нерегулярность", ["Delay tick"] = "Тик задержки",
	["Access denied: banned"] = "Доступ запрещён: бан",
	["Empty API response — check network / firewall / https://amnesia.cfd"] = "Пустой ответ API — сеть / файрвол / https://amnesia.cfd",
	["Bad JSON: "] = "Плохой JSON: ", [" — use !register <nick> <key>"] = " — введите !register <ник> <ключ>",
	["SteamID not ready"] = "SteamID ещё не готов", ["Redeem: no server response"] = "Активация: нет ответа сервера",
	["Redeem parse failed"] = "Ошибка разбора ответа активации", ["Key activated"] = "Ключ активирован",
	["Redeem failed: "] = "Ошибка активации: ",
	["[auth] Empty API response — check network / firewall / https://amnesia.cfd"] = "[auth] Пустой ответ API — сеть / файрвол / https://amnesia.cfd",
	["[auth] Bad JSON: "] = "[auth] Плохой JSON: ",
	["[!] Access denied: banned"] = "[!] Доступ запрещён: бан",
	["Unknown"] = "Неизвестно",
	["Events"] = "События", ["Output"] = "Вывод",
	["Save to cloud"] = "Сохранить в облако", ["Load from cloud"] = "Загрузить из облака",
	["Cloud"] = "Облако",
	["Save uploads the selected slot. To load, fill owner + name below."] = "Сохранить в облако — выгружает выбранный слот. Загрузить — введите данные автора ниже.",
	["Who owns the config"] = "От кого грузить",
	["Registration nickname on the site, or owner's SteamID64"] = "ник при регистрации на сайте или SteamID64 владельца",
	["Which cloud config"] = "Какой конфиг",
	["Exact slot name used when they saved to cloud"] = "точное имя слота, с которым автор нажал «Сохранить в облако»",
	["Author"] = "Автор",
	["Config name"] = "Имя конфига",
	["Enter owner nickname"] = "Введите ник владельца",
	["Cloud: uploading "] = "Облако: отправка «", ["Cloud: upload ok"] = "» — ок",
	["Cloud: upload failed"] = "Облако: ошибка отправки",
	["Cloud: loading "] = "Облако: загрузка, ник ", [", config "] = ", конфиг ",
	["Cloud: loaded into "] = "Облако: загружено в «",
	["Cloud: load failed"] = "Облако: ошибка загрузки",
	["Cloud load failed (network)"] = "Ошибка сети (загрузка из облака)",
	["Config loads"] = "Загрузки конфигов",
	["Loaded config "] = "Загружен конфиг ", [" · "] = " · ",
	["Auth required for cloud"] = "Нужна авторизация для облака",
	["Save locally first"] = "Сначала сохраните локально",
	["Saved to cloud"] = "Сохранено в облако",
	["Cloud save failed (network)"] = "Ошибка сети (облако)",
	["Cloud load failed (network)"] = "Ошибка сети (загрузка облака)",
	["Cloud error"] = "Ошибка облака",
	["Loaded from cloud"] = "Загружено из облака",
	["Enter owner nickname or SteamID64"] = "Введите ник владельца или SteamID64",
	["Nickname too long"] = "Ник слишком длинный",
	["[cloud] POST not supported"] = "[cloud] POST не поддерживается",
	["[!] SteamID not ready"] = "[!] SteamID ещё не готов",
	["[!] Redeem: no server response"] = "[!] Активация: нет ответа сервера",
	["[!] Redeem parse failed"] = "[!] Ошибка разбора ответа активации",
	["[!] Redeem failed: "] = "[!] Ошибка активации: ",
	["Not for gamesense"] = "Не для gamesense",
	["Can't overwrite Default"] = "Нельзя перезаписать Default",
	[" saved"] = " сохранён",
	["Enter the name"] = "Введите имя",
	["This name is too long"] = "Слишком длинное имя",
	[" is in the list"] = " уже в списке",
	["Not selected"] = "Ничего не выбрано",
	["Copied to clipboard."] = "Скопировано в буфер.",
	["Empty clipboard"] = "Буфер пуст",
	["Can't import default config"] = "Нельзя импортировать конфиг Default",
	[" by "] = " от ",
	[" added"] = " добавлен",
	["a "] = "",
	["ERR: can't load: not selected"] = "ОШИБКА: не выбран конфиг",
	["Selected: \v"] = "Выбран: \v",
	["You are "] = "Ты ",
	["afraid"] = "боишься",
	["Evaded shot from "] = "Уклонение от выстрела ",
	["d: "] = "д: ",
	["Damage from "] = "Урон от ",
	["world"] = "мира",
	[" for "] = ": ",
	[" hp"] = " хп",
	["a "] = "",
	["an HE grenade"] = "осколочной гранаты",
	["Killed"] = "Убит",
	["Harmed"] = "Ранен",
	["Exploded"] = "Взорван",
	["Stabbed"] = "Зарезан",
	["Burnt"] = "Сожжён",
	[" with "] = " из ",
	[" to "] = " до ",
	["death"] = "смерти",
	["Missed"] = "Промах",
	[" due to "] = " — ",
	["unpredicted occasion"] = "непредсказуемая ситуация",
	["'s "] = " — ",
	["dmg: "] = "урон: ",
	["Hit"] = "Попадание",
	["Destroyed"] = "Уничтожено",
	["exp: "] = "ожид.: ",
	["Δ: "] = "Δ: ",
	["hc: "] = "шанс: ",
	["Trashtalked "] = "Трэшток: ",
	[" due to \aFFFFFFrevenge"] = " — \aFFFFFFреванш",
	[" due to \aFFFFFFkill"] = " — \aFFFFFFубийство",
	[" due to \aFFFFFFdeath"] = " — \aFFFFFFсмерть",
	["Sync amnesia users"] = "Синхрон юзеров amnesia",
}

function amnesia.t(s)
	if type(s) ~= "string" then return s end
	-- Russian UI path (legacy behavior)
	if amnesia.lang == en then
		return _RU[s] or s
	end

	-- English UI path: title-case short UI labels only.
	-- Avoid touching long/log phrases with punctuation.
	local function _looks_like_ui_label(x)
		if #x == 0 or #x > 42 then return false end
		-- Never touch strings that rely on exact spacing (logger builds phrases with trailing spaces)
		if x:match("^%s") or x:match("%s$") then return false end
		-- Keep single lowercase tokens as-is (common in logger fragments like "death", "world").
		-- UI labels are usually multi-word, hyphenated, or already cased in source.
		if not x:find("%s") and not x:find("%-", 1, true) and x:match("^[a-z]+$") then
			return false
		end
		-- Never touch strings that contain color/control codes.
		if x:find("\a", 1, true) or x:find("\f", 1, true) or x:find("\r", 1, true) or x:find("\n", 1, true) or x:find("\t", 1, true) then
			return false
		end
		if x:find("[,%.%!%?;:%[%]{}<>\\/]") then return false end
		-- Keep pure labels (letters/digits/spaces/hyphen/apostrophe)
		if x:find("[^%w%s%-%']") then return false end
		return true
	end

	local function _title_word(w)
		if #w <= 2 then return w end
		local first = string.upper(string.sub(w, 1, 1))
		local rest = string.lower(string.sub(w, 2))
		return first .. rest
	end

	if _looks_like_ui_label(s) then
		local out = {}
		for w in s:gmatch("%S+") do
			-- Preserve common uppercase tokens
			if w == "AA" or w == "LC" or w == "SSG" or w == "DPI" or w == "FOV" then
				out[#out + 1] = w
			else
				-- Handle hyphenated tokens: anti-aim -> Anti-Aim
				local parts = {}
				for p in w:gmatch("[^%-]+") do
					parts[#parts + 1] = _title_word(p)
				end
				out[#out + 1] = table.concat(parts, "-")
			end
		end
		return table.concat(out, " ")
	end
	return s
end

--- Сравнение значения combobox/multiselect с английским ключом при русском UI (подпись опции переведена).
function amnesia.val_eq(v, en)
	if v == en then return true end
	if amnesia.lang == en and type(v) == "string" and type(en) == "string" and _RU[en] and v == _RU[en] then
		return true
	end
	return false
end

--- Язык UI из combobox: pui может отдать строку, индекс 0/1 или 1/2, число с дробью.
local _UI_LANG_OPTS = {"English", "Русский"}
local function _ui_lang_code_from_combobox(val)
	if val == nil then return "en" end
	if type(val) == "string" then
		if val:find("Рус", 1, true) then return en end
		if val == "Русский" then return en end
		if val == "English" then return "en" end
		local tn = tonumber(val)
		if tn then val = tn end
	end
	if type(val) == "boolean" then return "en" end
	if type(val) ~= "number" then return "en" end
	local n = math.floor(val + 0.5)
	-- 0-based: 0 = English, 1 = Русский
	if n == 0 or n == 1 then
		local opt = _UI_LANG_OPTS[n + 1]
		return (opt == "Русский") and en or "en"
	end
	-- 1-based (встречается): 1 = English, 2 = Русский
	if n == 2 then
		return en
	end
	return "en"
end

local TAB_PROFILE = _T(" Profile", " Профиль")
-- Подпись в блоке Information (ник • версия): не «Operator», а User.
local MENU_INFO_USER_ROLE = _T("User", "Пользователь")

-- Selectable tab names (keep as original/expected by UI).
local TAB_RAGE = _T(" Ragebot", " Рейжбот")
local TAB_AA = _T(" Anti-Aimbot", " Анти-аим")
local TAB_VISUALS = _T(" Visuals", " Визуал")
local TAB_SETTINGS = _T(" Settings", " Настройки")
local TAB_LOADOUTS = _T(" Loadouts", " Лоадауты")
local TAB_AA_GENERAL = _T(" General", " Общее")
local TAB_AA_BUILDER = _T(" Builder", " Конструктор")
local TAB_AA_VENTURE = _T("Anti-bruteforce", "Анти-брут")

-- Section headers (branded separately from selectable tabs).
local HDR_RAGE = _T("\a9ACD32FF\aFFFFFFFF Assault Core", "\a9ACD32FF\aFFFFFFFF Коровой штурм")
local HDR_VISUALS = _T("\a9ACD32FF\aFFFFFFFF Luma Studio", "\a9ACD32FF\aFFFFFFFF Люма-студия")
local HDR_AA_GENERAL = _T("\a9ACD32FF\aFFFFFFFF Signals", "\a9ACD32FF\aFFFFFFFF Сигналы")

-- #endregion

-- #region - enums

local enums = {
	hitgroups = {'generic', 'head', 'chest', 'stomach', 'left arm', 'right arm', 'left leg', 'right leg', 'neck', '?', 'gear'},
	states = table.distribute(antiaim.states, nil, 1),
	build = {
		["stable"] = {"", ""},
		["beta"] = {"β", ""},
		["debug"] = {"♪", ""},
	},
	aspect_ratios = {
		{125, "5:4"},
		{133, "4:3"},
		{150, "3:2"},
		{160, "16:10"},
		{178, "16:9"},
		{200, "2:1"},
	},
}

local cvars = setmetatable({}, {
	__index = function (self, k)
		local v = cvar[k]
		rawset(self, k, v)
		return v
	end
})

-- #endregion

-- #region - me

local players = {}

my = {
	entity = entity.get_local_player(),
	origin = vector(),
	valid = false,
	threat = client.current_threat(),
	velocity = 0,
	exploit = {
		active = nil,
		defensive = false,
		lagpeek = false,
		shifted = false,
		ready = false,
		diff = 0,
	},
	side = 0,
} do
	local get_state = a(function (cmd)
		if my.on_ground then
			if my.crouching then return enums.states.crouch end
			if my.velocity > 5 then return my.walking and enums.states.walk or enums.states.run
			else return enums.states.stand end
		else
			-- return my.crouching and enums.states.aircrouch or enums.states.air
			return enums.states.air
		end
	end)

	local tickbase_max = 0
	local last_commandnumber

	callbacks.predict_command:set(function (cmd)
		if not my.valid or last_commandnumber ~= cmd.command_number then return end

		local tickbase = entity.get_prop(my.entity, "m_nTickBase") or 0

		if tickbase_max ~= nil then
				-- Defensive window: match Wraith tickbase_diff threshold (-14 .. -1)
				my.exploit.diff = tickbase - tickbase_max
				my.exploit.defensive = my.exploit.diff <= -1 and my.exploit.diff >= -14

			if math.abs(tickbase - tickbase_max) > 64 then tickbase_max = 0 end
        end

		tickbase_max = math.max(tickbase, tickbase_max or 0)
	end)

	callbacks.finish_command:set(function (cmd)
		if my.valid then
			last_commandnumber = cmd.command_number
		end
	end)

	callbacks.run_command:set(function (cmd)
		my.entity = entity.get_local_player()
		my.valid = my.entity and entity.is_alive(my.entity) or false

		my.threat = my.valid and client.current_threat() or nil
		my.weapon = my.valid and entity.get_player_weapon(my.entity) or nil

		my.in_game = globals.mapname() ~= nil
		players = entity.get_players()

		if my.valid then
			local velocity = vector(entity.get_prop(my.entity, "m_vecVelocity"))
			my.velocity = velocity:length2d()

			my.origin = vector(entity.get_prop(my.entity, "m_vecOrigin"))
		end
	end)

	callbacks.pre_render:set(function ()
		my.valid = my.valid and globals.mapname() ~= nil
	end)

	local counter = 0

	callbacks.net_update_end:set(function ()
		my.entity = entity.get_local_player()
		my.valid = my.entity and entity.is_alive(my.entity) or false
		my.game_rules = entity.get_game_rules()

		if my.valid then
			local st_cur, st_old = entity.get_simtime(my.entity)

			my.exploit.lagpeek = st_cur < st_old
		end
	end)

	callbacks.setup_command:set(function (cmd)
		my.entity = entity.get_local_player()
		my.valid = my.entity and entity.is_alive(my.entity) or false

		my.threat = my.valid and client.current_threat() or nil
		my.weapon = my.valid and entity.get_player_weapon(my.entity) or nil

		players = entity.get_players()

		if my.valid and refs and refs.rage then
			my.exploit.active =
			(refs.rage.aimbot.double_tap[1].value and refs.rage.aimbot.double_tap[1].hotkey:get()) and 0 or
			(refs.aa.other.onshot.value and refs.aa.other.onshot.hotkey:get()) and 1 or nil
			if refs.rage.other.duck and refs.rage.other.duck:get() then my.exploit.active = nil end

			my.exploit.shifted = my.exploit.diff <= 0 or adata.get_double_tap()


			local flags = entity.get_prop(my.entity, "m_fFlags")

			my.using, my.in_score = cmd.in_use == 1, cmd.in_score == 1
			my.on_ground = bit.band(flags, bit.lshift(1, 0)) == 1
			my.jumping = not my.on_ground or (cmd.in_jump == 1)
			my.walking = my.velocity > 5 and (cmd.in_speed == 1)
			my.crouching = cmd.in_duck == 1

			my.side = (cmd.in_moveright == 1) and -1 or (cmd.in_moveleft == 1) and 1 or 0
			my.state = get_state(cmd)
		end

		do
			local alt = vars.misc and vars.misc.alt_amnesia_menu
			if alt and alt.value and ui.is_menu_open() and menu and menu.main and menu.main.global.value and menu.main.auth_gate.value then
				cmd.in_attack = 0
				cmd.in_attack2 = 0
			end
		end
	end)
end

-- #endregion

-- #endregion
--


-- #endregion ------------------------------------------------------------------
--




--------------------------------------------------------------------------------
-- #region :: Menu


--
-- #region : GS References

refs = {
	rage = {
		aimbot = {
			force_baim = pui.reference("RAGE", "Aimbot", "Force body aim"),
			force_sp = pui.reference("RAGE", "Aimbot", "Force safe point"),
			min_hc = pui.reference("RAGE", "Aimbot", "Minimum hit chance"),
			hit_chance = pui.reference("RAGE", "Aimbot", "Minimum hit chance"),
			damage = pui.reference("RAGE", "Aimbot", "Minimum damage"),
			damage_ovr = { pui.reference("RAGE", "Aimbot", "Minimum damage override") },
			double_tap = { pui.reference("RAGE", "Aimbot", "Double tap") },
			dt_fl = { pui.reference("RAGE", "Aimbot", "Double tap fake lag limit") },
		},
		other = {
			peek = pui.reference("RAGE", "Other", "Quick peek assist"),
			duck = pui.reference("RAGE", "Other", "Duck peek assist"),
			log_misses = pui.reference("RAGE", "Other", "Log misses due to spread"),
		}
	},
	aa = {
		angles = {
			enable = pui.reference("AA", "Anti-Aimbot angles", "Enabled"),
			pitch = { pui.reference("AA", "Anti-Aimbot angles", "Pitch") },
			yaw = { pui.reference("AA", "Anti-Aimbot angles", "Yaw") },
			base = pui.reference("AA", "Anti-Aimbot angles", "Yaw base"),
			jitter = { pui.reference("AA", "Anti-Aimbot angles", "Yaw jitter") },
			body = { pui.reference("AA", "Anti-Aimbot angles", "Body yaw") },
			edge = pui.reference("AA", "Anti-Aimbot angles", "Edge yaw"),
			fs_body = pui.reference("AA", "Anti-Aimbot angles", "Freestanding body yaw"),
			freestand = pui.reference("AA", "Anti-Aimbot angles", "Freestanding"),
			roll = pui.reference("AA", "Anti-Aimbot angles", "Roll"),
		},
		fakelag = {
			enable = pui.reference("AA", "Fake lag", "Enabled"),
			amount = pui.reference("AA", "Fake lag", "Amount"),
			variance = pui.reference("AA", "Fake lag", "Variance"),
			limit = pui.reference("AA", "Fake lag", "Limit"),
		},
		other = {
			slowmo = pui.reference("AA", "Other", "Slow motion"),
			legs = pui.reference("AA", "Other", "Leg movement"),
			onshot = pui.reference("AA", "Other", "On shot anti-aim"),
			fp = pui.reference("AA", "Other", "Fake peek"),
		}
	},
	misc = {
		clantag = pui.reference("MISC", "Miscellaneous", "Clan tag spammer"),
		log_damage = pui.reference("MISC", "Miscellaneous", "Log damage dealt"),
		ping_spike = pui.reference("MISC", "Miscellaneous", "Ping spike"),
		settings = {
			dpi = pui.reference("MISC", "Settings", "DPI scale"),
			accent = pui.reference("MISC", "Settings", "Menu color"),
			maxshift = pui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks2")
		}
	}
}

defer(function ()
	pui.traverse(refs, function (ref)
		ref:override()
		ref:set_enabled(true)
		if ref.hotkey then ref.hotkey:set_enabled(true) end
	end)
	refs.misc.settings.maxshift:set_visible(false)
end)

-- #endregion
--

--
-- #region : Script menu

-- #region - Base

pui.macros.silent = "\aCDCDCD40"
pui.macros.p = "\aCDCDCD40•\r  "
pui.macros.amnesia = colors.hex
pui.macros.amnesiab = string.sub(colors.hex, 2, 7)

-- pui.accent = "74A6A9FF"

local menu, groups = {
	x = 0, y = 0, w = 0, h = 0,
	set_visible = function (bool, aa)
		pui.traverse(refs.aa, function (r, path)
			r:set_visible(bool == nil and true or bool)
		end)
	end,
	tabs = {
		{"general", TAB_PROFILE},
		{"rage", TAB_RAGE},
		{"antiaim", TAB_AA},
		{"visuals", TAB_VISUALS},
		{"settings", TAB_SETTINGS},
		{"loadouts", TAB_LOADOUTS},
	},
	header = function (group, text)
		local r = {}
		if text then r[#r+1] = group:label("\v•\r  ".. text) end
		r[#r+1] = group:label("\a373737FF‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾")
		return r
	end,
	feature = function (main, settings)
		main = main.__type == "pui::element" and {main} or main
		local feature, g_depend = settings(main[1])

		for k, v in pairs(feature) do
			v:depend({main[1], g_depend})
		end
		feature[main.key or "on"] = main[1]

		return feature
	end,
	space = function (group) return group:label "\n" end,
	lock = function (id, item, to, min)
		return item
	end
}, {
	angles = pui.group("AA", _T("Anti-aimbot angles", "Углы анти-аима")),
	fakelag = pui.group("AA", _T("Fake lag", "Фейклаг")),
	other = pui.group("AA", _T("Other", "Прочее")),
}

do -- auto-hide
	refs.aa.angles.yaw[2]:depend({refs.aa.angles.yaw[1], 1})
	refs.aa.angles.pitch[2]:depend({refs.aa.angles.pitch[1], 1})
	refs.aa.angles.jitter[1]:depend({refs.aa.angles.yaw[1], 1})
	refs.aa.angles.jitter[2]:depend({refs.aa.angles.jitter[1], 1})
	refs.aa.angles.body[2]:depend({refs.aa.angles.body[1], 1})
	refs.aa.angles.fs_body:depend({refs.aa.angles.body[1], 1})
end

callbacks.paint_ui:set(function ()
	menu.x, menu.y = ui.menu_position()
	menu.w, menu.h = ui.menu_size()
end)

-- #endregion

-- #region - Unsavable

local function amnesia_is_estk_profile()
	return string.lower(tostring(amnesia.user.name or "")) == "hakkai" or "estk"
end

local function amnesia_display_build_str()
	local b = tostring(amnesia.build or "stable")
	if amnesia_is_estk_profile() and string.lower(b) == "debug" then
		return "developer"
	end
	return b
end

local function amnesia_refresh_variant_label()
	pcall(function()
		if menu and menu.info and menu.info.variant then
			menu.info.variant:set((" \f<silent>%s   \v%s"):format("Build", tostring(amnesia.update or amnesia.version)))
		end
	end)
end

menu.main = {
	menu.space(groups.fakelag),
	global = groups.fakelag:checkbox(_T("Enable \vamnesia"), true),
	bar = groups.fakelag:label("\a373737FF‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"),
	auth_gate = groups.fakelag:checkbox("\n", false),
	-- menu.space(groups.fakelag),
}

menu.info = {
	menu.header(groups.fakelag, "\a9ACD32FF\aFFFFFFFF Information"),
	user = groups.fakelag:label((" \f<silent>%s   \v%s • %s"):format(MENU_INFO_USER_ROLE, amnesia.user.name, amnesia_display_build_str())),
	expires = groups.fakelag:label((" \f<silent>%s   \v%s"):format("Expiry", "lifetime")),
	variant = groups.fakelag:label((" \f<silent>%s   \v%s"):format("Build", tostring(amnesia.update or amnesia.version))),
	online = groups.fakelag:label(" \f<silent>Active   \v—"),
	site = groups.fakelag:label(" \f<silent>Website   \vamnesia.cfd"),
	discord = groups.fakelag:label(" \f<silent>Discord   \vdsc.gg/gamesensical"),
	menu.space(groups.fakelag)
}
menu.main.tab = groups.fakelag:combobox("\n", table.distribute(menu.tabs, 2))

menu.misc = {
	overridden = groups.angles:label("Overridden by \vamnesia")
}

menu.general = {
	config = {
		menu.header(groups.angles, "\a9ACD32FF\aFFFFFFFF Dashboard login"),
		dashboard_auth_hint_1 = groups.angles:label("\f<p>Open amnesia.cfd and go to Dashboard"),
		dashboard_auth_hint_2 = groups.angles:label("\f<p>Click Get Auth Code, then paste it"),
		dashboard_auth = groups.angles:button("Get Auth Code", NILFN),
		hide_amnesia_username = groups.angles:checkbox("Hide Amnesia Username", false),
		menu.space(groups.angles),
		menu.header(groups.other, "\a9ACD32FF\aFFFFFFFF Discord auth"),
		discord_auth_hint = groups.other:label("\f<p>Get a code, then in Discord use slash: /auth"),
		discord_link = groups.other:button("Discord link code", NILFN),
		menu.space(groups.other),
	},
}

local function display_user_name()
	local g = menu.general and menu.general.config
	if g and g.hide_amnesia_username and g.hide_amnesia_username.value then
		return "User"
	end
	return amnesia.user.name or "user"
end

function amnesia._refresh_estk_diagnostics()
	-- Diagnostics removed
end

pcall(function()
	if menu.info and menu.info.user then
		menu.info.user:set((" \f<silent>%s   \v%s • %s"):format(MENU_INFO_USER_ROLE, display_user_name(), amnesia_display_build_str()))
	end
end)

menu.loadouts = {
	config = {
		menu.space(groups.angles),
		menu.header(groups.other, "\a9ACD32FF\aFFFFFFFF New loadout"),
		name = groups.other:textbox(amnesia.t("Name")),
		create = groups.other:button(amnesia.t("Create"), NILFN),
		import = groups.other:button(amnesia.t("Import"), NILFN),
		menu.space(groups.other),
		menu.header(groups.angles, "\a9ACD32FF\aFFFFFFFF Loadouts"),
		list = groups.angles:listbox("Loadouts", {"Recommended"}),
		selected = groups.angles:label("Selected: \vRecommended"),
		list_report = groups.angles:label(amnesia.t("REPORT")),
		auto_load = groups.angles:checkbox(amnesia.t("Load this config on script start")),
		load = groups.angles:button("Load", NILFN),
		loadaa = groups.angles:button("Load Anti-aimbot", NILFN),
		save = groups.angles:button(amnesia.t("Save"), NILFN),
		export = groups.angles:button(amnesia.t("Export"), NILFN),
		delete = groups.angles:button("\aD95148FF " .. amnesia.t("Delete"), NILFN),
		deleteb = groups.angles:button("\aD9514840 " .. amnesia.t("Delete"), NILFN),
	},
}

menu.stats = {
	menu.header(groups.other, "\a9ACD32FF\aFFFFFFFF Telemetry"),
	loaded = groups.other:label("\f<silent>" .. amnesia.t("Times loaded") .. "\t\v" .. db.stats.loaded),
	playtime = groups.other:label("\f<silent>" .. amnesia.t("Hours played") .. "\t\v" .. math.floor(db.stats.playtime), ":", math.floor(db.stats.playtime % 1 * 60)),
	killed = groups.other:label("\f<silent>" .. amnesia.t("Enemies eliminated") .. "\t\v" .. db.stats.killed),
	evaded = groups.other:label("\f<silent>" .. amnesia.t("Evaded shots") .. "\t\v" .. db.stats.evaded),
}

-- #endregion

-- #region - Vars

vars.rage = {
	menu.header(groups.angles, HDR_RAGE),
	teleport = menu.feature({groups.angles:checkbox(amnesia.t("Auto teleport"), 0x00)}, function (parent)
		return {
			land = groups.angles:checkbox("\f<p>" .. amnesia.t("Ensure landing")),
			pistol = groups.angles:checkbox("\f<p>" .. amnesia.t("Allow pistols")),
		}, true
	end),
	exswitch = menu.feature({groups.angles:checkbox(amnesia.t("Auto exploit switch"))}, function (parent)
		return {
			allow = groups.angles:multiselect("\f<p>" .. amnesia.t("Additional weapons"), {"Pistols", "Desert Eagle"}),
		}, true
	end),
	resolver = groups.angles:checkbox(amnesia.t("Anti-aimbot Correction")),
	ssg08_air = menu.feature({groups.angles:checkbox(amnesia.t("SSG 08 Air Autostop"))}, function (parent)
		return {
			hc_in_air = groups.angles:slider("\f<p>" .. amnesia.t("Hit chance in air"), 0, 100, 70, true, "%"),
		}, true
	end),
	vulnlc = groups.angles:multiselect("\aB6B665FF" .. amnesia.t("LC breaker"), {"Can't shoot", "Jumping", "Crouching"}),
	menu.space(groups.angles)
}

	vars.visuals = {
	menu.header(groups.angles, HDR_VISUALS),
	crosshair = menu.feature(groups.angles:checkbox(amnesia.t("Crosshair Indicators")), function (parent)
		return {
			style = groups.angles:combobox("\nch_style", {"Classic", "Mini"}),
		}, true
	end),
	damage = groups.angles:checkbox(amnesia.t("Damage Indicator")),
	arrows = groups.angles:checkbox(amnesia.t("Anti-aim Arrows")),
	marker = groups.angles:checkbox(amnesia.t("Hitmarker")),
	menu.space(groups.angles),
	widgets_hdr = groups.angles:label("\v•\r  " .. amnesia.t("Widgets")),
	widgets_line = groups.angles:label("\a373737FF‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"),
	water = menu.feature(groups.angles:checkbox(amnesia.t("Watermark")), function ()
		local ctx = {
			custom_username = groups.angles:checkbox("\f<p>" .. amnesia.t("Custom Username"), false),
			name = groups.angles:textbox("\f<p>" .. amnesia.t("Custom name")),
			cloud_avatar = groups.angles:checkbox("\f<p>Enable Cloud Avatar", true),
			hide = groups.angles:checkbox("\f<p>" .. amnesia.t("Hide Amnesia")),
		}
		ctx.name:depend(ctx.custom_username)
		return ctx, true
	end),
	keylist = groups.angles:checkbox(amnesia.t("Keybinds List")),
	speclist = groups.angles:checkbox(amnesia.t("Spectators List")),
	slowdown = groups.angles:checkbox(amnesia.t("Slowdown Indicator")),
	defensive_indicator = groups.angles:checkbox(amnesia.t("Defensive Indicator")),
	kill_sound_counter = groups.angles:checkbox(amnesia.t("Kill Sound Counter")),
	kill_sound_widget = groups.angles:checkbox("\f<p>" .. amnesia.t("Kill Counter Widget")),
	thirdperson = menu.feature(groups.angles:checkbox(amnesia.t("Thirdperson FOV")), function ()
		return {
			distance = groups.angles:slider("\f<p>" .. amnesia.t("Thirdperson distance"), 30, 200, 150, true),
		}
	end),
	viewmodel = menu.feature(groups.angles:checkbox(amnesia.t("Viewmodel changer")), function ()
		return {
			offset_fov = groups.angles:slider("\f<p>" .. amnesia.t("Offset FOV"), -1800, 1800, 680, true, nil, 0.1),
			offset_x = groups.angles:slider("\f<p>" .. amnesia.t("Offset X"), -1800, 1800, 25, true, nil, 0.1),
			offset_y = groups.angles:slider("\f<p>" .. amnesia.t("Offset Y"), -1800, 1800, 0, true, nil, 0.1),
			offset_z = groups.angles:slider("\f<p>" .. amnesia.t("Offset Z"), -1800, 1800, -15, true, nil, 0.1),
		}, true
	end),
	menu.space(groups.angles),
	tweaks_hdr = groups.other:label("\v•\r  " .. amnesia.t("Tweaks")),
	tweaks_line = groups.other:label("\a373737FF‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾"),
	menu_bg = groups.other:checkbox(amnesia.t("Background Menu")),
	cheap = groups.other:checkbox(amnesia.t("Performance Mode")),
	dpi = groups.other:checkbox(amnesia.t("Scale DPI")),
	-- viewmodel закоммечено
	-- viewmodel = menu.feature(groups.angles:checkbox(amnesia.t("Viewmodel override")), function (parent)
	-- 	return {
	-- 		in_scope = groups.angles:checkbox("\f<p>" .. amnesia.t("Viewmodel in scope")),
	-- 		position = groups.angles:checkbox("\f<p>" .. amnesia.t("Viewmodel position override")),
	-- 		pos_x = groups.angles:slider("\f<p>" .. amnesia.t("Viewmodel X"), -30, 30, 0),
	-- 		pos_y = groups.angles:slider("\f<p>" .. amnesia.t("Viewmodel Y"), -100, 100, 0),
	-- 		pos_z = groups.angles:slider("\f<p>" .. amnesia.t("Viewmodel Z"), -30, 30, 0),
	-- 		fov = groups.angles:slider("\f<p>" .. amnesia.t("Viewmodel FOV"), -60, 100, 0),
	-- 	}, true
	-- end),
	menu.space(groups.angles),
}

vars.visuals.kill_sound_widget:depend(vars.visuals.kill_sound_counter)

vars.misc = {
	menu.header(groups.angles, "\a9ACD32FF\aFFFFFFFF Modules"),
	aspect = menu.feature(groups.angles:checkbox(amnesia.t("Aspect ratio")), function ()
		return {
			ratio = groups.angles:slider("\naratio", 80, 200, 133, true, nil, .01, table.distribute(enums.aspect_ratios, 2, 1))
		}, true
	end),
	ladder = groups.angles:checkbox(amnesia.t("Fast ladder")),
	clantag = groups.angles:checkbox(amnesia.t("Clantag")),
	trashtalk = menu.feature(groups.angles:checkbox(amnesia.t("Trashtalk")), function ()
		return {
			mode = groups.angles:combobox("\f<p>" .. amnesia.t("Mode"), {"Default", "1", "Russian"}),
			conds = groups.angles:multiselect("\f<p>" .. amnesia.t("Conditions"), {"On Kill", "On Death"}),
			sync_amnesia = groups.angles:checkbox("\f<p>" .. amnesia.t("Sync amnesia users")),
		}, true
	end),
	filter = groups.angles:checkbox(amnesia.t("Console filter")),
	logs = menu.feature(groups.angles:checkbox(amnesia.t("Eventlogger")), function (parent)
		return {
			events = groups.angles:multiselect("\f<p>" .. amnesia.t("Events"), {"Ragebot shots", "Harming enemies", "Getting harmed", "Anti-aim info", "Trashtalk", "Config loads", "Config saves", "Shared users", "New keys"}),
			output = groups.angles:multiselect("\f<p>" .. amnesia.t("Output"), {"Console", "Screen"}),
		}, true
	end),
	breaker = menu.feature(groups.angles:checkbox(amnesia.t("Animation breaker")), function (parent)
		return {
			pitch = groups.angles:checkbox("\f<p>" .. amnesia.t("Pitch 0 on land")),
			legs_air = groups.angles:combobox("\f<p>" .. amnesia.t("Legs in Air"), {"Static Legs", "Air Walk"}),
			blind = groups.angles:checkbox("\f<p>" .. amnesia.t("Blind")),
			move_blend = groups.angles:multiselect("\f<p>" .. amnesia.t("Adjust move blend"), {"While walking", "While running", "While crouching"}),
			legs = groups.angles:combobox("\f<p>" .. amnesia.t("Legs"), {"None", "Static", "Jitter", "Walking"}),
		}, true
	end),
	alt_amnesia_menu = groups.angles:checkbox(amnesia.t("Alternative Amnesia Menu"), false),
}

vars.drag = {}


-- #endregion

-- #region - Anti-aim

vars.antiaim = {
	global = groups.fakelag:checkbox(amnesia.t("Enable")),
	tab = groups.fakelag:combobox("\n", {TAB_AA_GENERAL, TAB_AA_BUILDER}, nil, false),

	general = {
		menu.header(groups.angles, HDR_AA_GENERAL),
		-- renamed to match branded UI
		inverter = groups.angles:hotkey(amnesia.t("Inverter"), false),
		yaw = groups.angles:combobox(amnesia.t("Yaw base"), {"At targets", "Local view"}),
		head = groups.angles:multiselect(amnesia.t("Safe head"), {"Air melee", "Height difference"}),
		manual = menu.feature(groups.angles:checkbox(amnesia.t("Manual yaw")), function ()
			return {
				st = groups.angles:checkbox("\f<p>" .. amnesia.t("Static manual yaw")),
				left = groups.angles:hotkey("\f<p>" .. amnesia.t("Left"), false, 0),
				right = groups.angles:hotkey("\f<p>" .. amnesia.t("Right"), false, 0),
				reset = groups.angles:hotkey("\f<p>" .. amnesia.t("Reset"), false, 0),
				edge = groups.angles:hotkey("\f<p>" .. amnesia.t("Edge yaw"), false, 0),
				fs = groups.angles:hotkey("\f<p>" .. amnesia.t("Freestanding"), false, 0),
				force_fs_peek = groups.angles:checkbox("\f<p>" .. amnesia.t("Force Freestanding on Peek Assist"), false),
			}, true
		end),
		stab = groups.angles:checkbox(amnesia.t("Anti-backstab")),
		use = groups.angles:checkbox(amnesia.t("On use AA")),
		warmup = groups.angles:checkbox(amnesia.t("Warmup AA")),
		menu.space(groups.angles)
	},
	exploits = {
		menu.header(groups.angles, "\a9ACD32FF\aFFFFFFFF Tactics"),
		snap = menu.feature(groups.angles:checkbox("\aB6B665FF" .. amnesia.t("Defensive snap"), 0x00), function ()
			return {
				os = groups.angles:checkbox("\f<p>" .. amnesia.t("Allow with On shot AA")),
				groups.angles:label("\f<p>" .. amnesia.t("See \vBuilder\r for more settings."))
			}, true
		end),
		menu.space(groups.angles)
	},
	lag = {
		menu.header(groups.other, "\a9ACD32FF\aFFFFFFFF Latency tuning"),
		fakelag = menu.feature(groups.other:checkbox(amnesia.t("Fake lag")), function ()
			return {
				mode = groups.other:combobox("\nflmode", {"Dynamic", "Maximum", "Fluctuate"}),
				limit = groups.other:slider("\f<p>" .. amnesia.t("Limit"), 1, 15, 14, true, "t")
			}, true
		end),
	},

	builder = {
		preset = groups.angles:combobox("\v•\r  Preset", {"Custom", "Aggressive", "Jitter+", "Defensive+"}),
		state = groups.angles:combobox("\v•\r  State", table.distribute(antiaim.states, 2), nil, false),
		-- menu.header(groups.other, "Actions with this state"),
		-- import = groups.other:button("Import", function () end),
		-- export = groups.other:button("Export", function () end),
	},
	states = {},
	venture = {
		long = {
			menu.header(groups.other, "Long-run"),
			gaslight = groups.other:checkbox(amnesia.t("Gaslighting"))
		},
		short = {
			menu.header(groups.angles, "On-time"),
		}
	}
}

do -- states
	local new = function (path, ref)
		ref:set_callback(function (self) table.place(antiaim.presets.custom, path, self.value) end, true)
		return ref
	end

	local tooltips = {
		delay = { [1] = "Off", [15] = "RS", [16] = "RL", [17] = "AB" }
	}

	for i, v in ipairs(antiaim.states) do
		local id, name, short = v[1], v[2], v[3]

		vars.antiaim.states[id], pui.macros._p = {}, "\n"..short
		local ctx = vars.antiaim.states[id]
		--

		if id ~= "default" then
			ctx.override = new({id, "override"}, groups.angles:checkbox(amnesia.t("Override ") .. "\v".. name:lower()))
		end

		ctx[#ctx+1] = menu.space(groups.angles)
		ctx[#ctx+1] = menu.header(groups.angles, "Azimuth")

		--
		ctx.y_off	= new({id, "yaw", "offset"}, groups.angles:slider(amnesia.t("Offset") .. "\f<_p>", -60, 60, 0, true, "°"))

		ctx[#ctx+1] = menu.space(groups.angles)
		ctx.mod		= new({id, "mod", "type"}, groups.angles:combobox(amnesia.t("Modifier") .. "\f<_p>", {"None", "Jitter", "X-way", "Rotate", "Random"}))
		ctx.w_m		= new({id, "ways", "manual"}, groups.angles:checkbox("\f<p>" .. amnesia.t("Manual ways") .. "\f<_p>"))
		ctx.m_r		= new({id, "mod", "range"}, groups.angles:checkbox("\f<p>" .. amnesia.t("Range") .. "\f<_p>"))
		ctx.m_a		= new({id, "mod", "add"}, groups.angles:checkbox("\f<p>" .. amnesia.t("Add yaw") .. "\f<_p>"))

		--
		ctx.w_num	= new({id, "ways", "total"}, groups.angles:slider("\nwnum".. id, 3, 7, 3, true, "-w"))
		ctx.w_label = groups.angles:label(amnesia.t("Each way") .. "\f<_p>") ctx.w_label:depend({ctx.mod, "X-way"}, ctx.w_m)
		ctx.w_num:set_callback(function (this) ctx.w_label:set(amnesia.t("Each way") .. " \aCDCDCD60" .. this.value) end, true)

		ctx.ways = {} for w = 1, 7 do
			ctx.ways[w] = new({id, "way", w}, groups.angles:slider("\n"..w..id, -60, 60, 0, true, "°", 1, {[0] = "R"}))
			ctx.ways[w]:depend({ctx.mod, "X-way"}, ctx.w_m, {ctx.w_num, w, 7})
		end

		--
		ctx.m_d		= new({id, "mod", "degree"}, groups.angles:slider(amnesia.t("Degree") .. "\f<_p>", -60, 60, 0, true, "°"))
		ctx.m_min	= new({id, "mod", "min"}, groups.angles:slider(amnesia.t("Range \aCDCDCD60min/max") .. "\f<_p>", -60, 60, 0, true, "°"))
		ctx.m_max	= new({id, "mod", "max"}, groups.angles:slider("\nmodmax\f<_p>", -60, 60, 0, true, "°"))
		ctx.m_al	= new({id, "mod", "left"}, groups.angles:slider(amnesia.t("Add \aCDCDCD60left/right") .. "\f<_p>", -60, 60, 0, true, "°"))
		ctx.m_ar	= new({id, "mod", "right"}, groups.angles:slider("\nar\f<_p>", -60, 60, 0, true, "°"))


		--
		ctx[#ctx+1]	= menu.space(groups.angles)
		ctx[#ctx+1]	= menu.header(groups.angles, "Ghost Offset")
		ctx.d_on	= new({id, "body", "on"}, groups.angles:checkbox(amnesia.t("Body yaw") .. "\f<_p>"))
		ctx.d_sw	= new({id, "body", "jitter"}, groups.angles:checkbox("\f<p>" .. amnesia.t("Jitter") .. "\f<_p>"))
		ctx.d_rw	= new({id, "body", "relative"}, groups.angles:checkbox("\f<p>" .. amnesia.t("Relative X-way") .. "\f<_p>"))
		ctx.d_mode	= new({id, "body", "mode"}, groups.angles:combobox(amnesia.t("Body yaw mode") .. "\f<_p>", {"Auto", "Default", "Side-based"}))
		ctx.d_d		= new({id, "body", "degree"}, groups.angles:slider("\nfdeg\f<_p>", -180, 180, 0, true, "°"))
		ctx.d_l		= new({id, "body", "left"}, groups.angles:slider("Range \aCDCDCD60left/right\nbodyl\f<_p>", -180, 180, 0, true, "°"))
		ctx.d_r		= new({id, "body", "right"}, groups.angles:slider("\nbodyr\f<_p>", -180, 180, 0, true, "°"))
		-- ctx.d_dbase	= groups.angles:slider("Foot base\f<_p>", -180, 180, 0, true, "°")
		-- ctx.d_dpow	= groups.angles:slider("Overdrive\f<_p>", 0, 50, 0, true, "ω", 0.1)

		--
		ctx[#ctx+1]	= menu.header(groups.other, "Advanced tuning")
		ctx.r_ir	= new({id, "adv", "irreg"}, groups.other:slider(amnesia.t("Irregularity") .. "\f<_p>", 0, 100, 0, true, "%"))
		ctx.r_dt	= new({id, "adv", "delay"}, groups.other:slider(amnesia.t("Delay tick") .. "\f<_p>", 1, 17, 0, true, "t", 1, tooltips.delay))
		ctx.ds		= new({id, "snap", "on"}, groups.other:combobox(amnesia.t("Defensive snap") .. "\f<_p>", id == "default" and {"Off", "Custom"} or {"Default", "Off", "Custom"}))
		ctx.dsp 	= new({id, "snap", "pitch"}, groups.other:combobox("\f<p>" .. amnesia.t("Pitch") .. "\f<_p>", {"None", "Switch", "Random", "Spin"}))
		ctx.dsp1	= new({id, "snap", "pitch_min"}, groups.other:slider("\f<_p>pmin", -89, 89, -45, true, "°"))
		ctx.dsp2	= new({id, "snap", "pitch_max"}, groups.other:slider("\f<_p>pmax", -89, 89, -45, true, "°"))
		ctx.dsy		= new({id, "snap", "yaw"}, groups.other:combobox("\f<p>" .. amnesia.t("Yaw") .. "\f<_p>", {"None", "Switch", "Random", "Spin"}))
		ctx.dsy1	= new({id, "snap", "yaw_min"}, groups.other:slider("\f<_p>ymin", 0, 360, 180, true, "°"))
		-- ctx.dsy2	= new({id, "snap", "yaw_max"}, groups.other:slider("\f<_p>ymax", -180, 180, 90, true, "°"))

		--
		do
			ctx.d_sw:depend(ctx.d_on)
			ctx.d_mode:depend(ctx.d_on)
			ctx.d_d:depend(ctx.d_on, {ctx.d_mode, "Default"})
			ctx.d_l:depend(ctx.d_on, {ctx.d_mode, "Side-based"})
			ctx.d_r:depend(ctx.d_on, {ctx.d_mode, "Side-based"})
			-- ctx.d_dbase:depend(ctx.d_on, {ctx.d_mode, "Dynamic"})
			-- ctx.d_dpow:depend(ctx.d_on, {ctx.d_mode, "Dynamic"})
			ctx.d_rw:depend(ctx.d_on, {ctx.mod, "X-way"})
		end
		do
			local ways_check = function () return not (ctx.mod.value == "X-way" and ctx.w_m.value) end

			ctx.w_m:depend({ctx.mod, "X-way"})
			ctx.m_r:depend({ctx.mod, "None", true}, {ctx.w_m, ways_check})
			ctx.m_a:depend({ctx.mod, "None", true})

			ctx.m_d:depend({ctx.m_r, false}, {ctx.mod, "None", true}, {ctx.w_m, ways_check})
			ctx.m_min:depend({ctx.m_r, true}, {ctx.mod, "None", true}, {ctx.w_m, ways_check})
			ctx.m_max:depend({ctx.m_r, true}, {ctx.mod, "None", true}, {ctx.w_m, ways_check})
			ctx.m_al:depend({ctx.m_a, true}, {ctx.mod, "None", true})
			ctx.m_ar:depend({ctx.m_a, true}, {ctx.mod, "None", true})

			ctx.w_num:depend({ctx.mod, "X-way"})
		end
		do
			ctx.ds:depend({vars.antiaim.exploits.snap.on, true})
			ctx.dsp:depend({vars.antiaim.exploits.snap.on, true}, {ctx.ds, "Custom"})
			ctx.dsy:depend({vars.antiaim.exploits.snap.on, true}, {ctx.ds, "Custom"})
			ctx.dsp1:depend({vars.antiaim.exploits.snap.on, true}, {ctx.ds, "Custom"}, {ctx.dsp, "None", true})
			ctx.dsp2:depend({vars.antiaim.exploits.snap.on, true}, {ctx.ds, "Custom"}, {ctx.dsp, "None", true})
			ctx.dsy1:depend({vars.antiaim.exploits.snap.on, true}, {ctx.ds, "Custom"}, {ctx.dsy, "None", true})
			-- ctx.dsy2:depend({vars.antiaim.exploits.snap.on, true}, {ctx.ds, "Custom"}, {ctx.dsy, "None", true})
		end

		--
		pui.traverse(ctx, function (ref, path)
			ref:depend({vars.antiaim.builder.state, name}, path[#path] ~= "override" and ctx.override or nil)
		end)
	end

	pui.macros._p = nil

	-- vars.antiaim.builder.state:set_callback(function (this)
	-- 	vars.antiaim.builder[1][1]:set(pui.format "\v•\r  Actions with \v" .. this.value)
	-- end, true)
end

do -- brute

end

-- #endregion

-- #region - Handle

menu.lock("jr", vars.rage.resolver)
menu.lock("es", vars.rage.exswitch.on, nil, 3)
menu.lock("kl", vars.visuals.keylist)
menu.lock("sl", vars.visuals.speclist)
menu.lock("hm", vars.visuals.marker)
menu.lock("ab", vars.misc.breaker.on)
menu.lock("fl", vars.misc.ladder)
menu.lock("sh", vars.antiaim.general.head, {})

do
	defer(menu.set_visible)

	vars.visuals.dpi:set_callback(function (this)
		_DPI.scalable = this.value
		_DPI.callback()
	end, true)

	menu.main.global:set_callback(function (this) menu.set_visible(not this.value, true) end, true)
pcall(function() menu.main.global:set_visible(false) end)
	pcall(function() menu.main.auth_gate:set_visible(false) end)
	menu.main[1]:depend({menu.main.global, false})
	menu.main.tab:depend(menu.main.global)
	menu.main.bar:depend(menu.main.global)

	--

	menu.misc.overridden:depend({menu.main.global, false}, vars.antiaim.global)
	pui.traverse(menu.info, function (ref, path)
		ref:depend(menu.main.global, {menu.main.auth_gate, true})
	end)
	pui.traverse(menu.general, function (ref, path)
		ref:depend(menu.main.global, {menu.main.tab, TAB_PROFILE}, {menu.main.auth_gate, true})
	end)
	pui.traverse(menu.loadouts, function (ref, path)
		ref:depend(menu.main.global, {menu.main.tab, TAB_LOADOUTS}, {menu.main.auth_gate, true})
	end)
	pui.traverse(menu.stats, function (ref, path)
		ref:depend(menu.main.global, {menu.main.tab, TAB_SETTINGS}, {menu.main.auth_gate, true})
	end)
	pui.traverse(vars.rage, function (ref, path)
		ref:depend(menu.main.global, {menu.main.tab, TAB_RAGE}, {menu.main.auth_gate, true})
	end)
	pui.traverse(vars.visuals, function (ref, path)
		ref:depend(menu.main.global, {menu.main.tab, TAB_VISUALS}, {menu.main.auth_gate, true})
	end)
	pui.traverse(vars.misc, function (ref, path)
		ref:depend(menu.main.global, {menu.main.tab, TAB_SETTINGS}, {menu.main.auth_gate, true})
	end)
	pui.traverse(vars.antiaim, function (ref, path)
		ref:depend(menu.main.global, {menu.main.tab, TAB_AA}, {menu.main.auth_gate, true}, (path[#path] ~= "global") and vars.antiaim.global or nil)

		if path[1] == "global" or path[1] == "tab" then return end

		if path[1] == "builder" or path[1] == "states" then
			if path[1] == "builder" and path[2] == "preset" then
				ref:depend({vars.antiaim.tab, TAB_AA_BUILDER})
			else
				ref:depend({vars.antiaim.tab, TAB_AA_BUILDER}, {vars.antiaim.builder.preset, "Custom"})
			end
		elseif path[1] == "venture" then
			ref:depend({vars.antiaim.tab, TAB_AA_VENTURE})
		else
			ref:depend({vars.antiaim.tab, TAB_AA_GENERAL})
		end
	end)

	-- Dashboard login now lives in Profile tab (menu.general.config).


	vars.visuals.cheap:set_callback(function (this)
		render.cheap = this.value
	end, true)

	do
		local tp = vars.visuals.thirdperson
		local function tp_apply()
			if tp.on.value then
				client.exec("cam_idealdist " .. tostring(tp.distance.value))
			end
		end
		tp.distance:set_callback(function ()
			tp_apply()
		end)
		tp.on:set_callback(function ()
			tp_apply()
		end, true)
		tp.distance:depend(tp.on)
	end

	do
		local cvar_fov = cvar.viewmodel_fov
		local cvar_offset_x = cvar.viewmodel_offset_x
		local cvar_offset_y = cvar.viewmodel_offset_y
		local cvar_offset_z = cvar.viewmodel_offset_z
		local default_fov = 680
		local default_offset_x = 25
		local default_offset_y = 0
		local default_offset_z = -15

		local function set_viewmodel(fov, x, y, z)
			pcall(function ()
				cvar_fov:set_raw_float(fov * 0.1)
				cvar_offset_x:set_raw_float(x * 0.1)
				cvar_offset_y:set_raw_float(y * 0.1)
				cvar_offset_z:set_raw_float(z * 0.1)
			end)
		end

		local vm = vars.visuals.viewmodel
		local function vm_apply()
			if vm.on.value then
				set_viewmodel(vm.offset_fov.value, vm.offset_x.value, vm.offset_y.value, vm.offset_z.value)
			else
				set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
			end
		end

		vm.offset_fov:set_callback(function ()
			vm_apply()
		end)
		vm.offset_x:set_callback(function ()
			vm_apply()
		end)
		vm.offset_y:set_callback(function ()
			vm_apply()
		end)
		vm.offset_z:set_callback(function ()
			vm_apply()
		end)
		vm.on:set_callback(function ()
			vm_apply()
		end, true)
		vm.offset_fov:depend(vm.on)
		vm.offset_x:depend(vm.on)
		vm.offset_y:depend(vm.on)
		vm.offset_z:depend(vm.on)

		amnesia.viewmodel_changer_shutdown = function ()
			set_viewmodel(default_fov, default_offset_x, default_offset_y, default_offset_z)
		end
	end

	pcall(function ()
		local want_ru = (db.ui_lang == en)
		menu.ui_lang:set(want_ru and 1 or 0)
	end)
	pcall(function ()
		menu.ui_lang:set(db.ui_lang == en and "Русский" or "English")
	end)
end

-- region amnesia_alt_menu_embed (regen: python tools/embed_alt_menu.py)
local amnesia_alt_menu
do
	local _amnesia_alt_menu_src = [===[
--[[
	Amnesia — альтернативное оверлей-меню (Gamesense).
	Вызывается из payload: paint(opts). opts см. в payload.lua.
]]

local images_ok, images = pcall(require, "gamesense/images")
local base64_ok, base64 = pcall(require, "gamesense/base64")

local MENU_W, MENU_MIN_H = 560, 400
local GS_MENU_RIGHT_RESERVE = 400
local ACC_R, ACC_G, ACC_B = 16, 185, 129

local COL_GRAY = { 156, 163, 175, 255 }
local COL_MUTED = { 156, 163, 175, 255 }
local COL_ALPHA = { 52, 211, 153, 255 }
local COL_PROFILE_SUB = { 196, 206, 218, 255 }

local function text_flags(fl)
	fl = fl or "d"
	if fl == "" then fl = "d" end
	if not fl:find("d", 1, true) then
		fl = fl .. "d"
	end
	return fl
end

local function text_draw(x, y, col, flags, text)
	local r, g, b, a = col[1], col[2], col[3], col[4] or 255
	renderer.text(x, y, r, g, b, a, text_flags(flags), 0, text)
end

local function nav_text_y(ry2, rh, flags, text)
	local _, th = renderer.measure_text(text_flags(flags), text)
	th = th or 11
	return ry2 + math.floor((rh - th) / 2)
end

local function png_wh(data)
	if not data or #data < 24 then return nil, nil end
	if data:sub(1, 8) ~= "\137PNG\r\n\26\n" then return nil, nil end
	local b = { data:byte(17, 24) }
	local w = b[1] * 16777216 + b[2] * 65536 + b[3] * 256 + b[4]
	local h = b[5] * 16777216 + b[6] * 65536 + b[7] * 256 + b[8]
	if w <= 0 or h <= 0 then return nil, nil end
	return w, h
end

local function rect_left_rounded(x, y, w, h, rad, col)
	rad = math.min(rad, w * 0.5, h * 0.5)
	local r, g, b, a = col[1], col[2], col[3], col[4]
	renderer.rectangle(x + rad, y, w - rad, h, r, g, b, a)
	renderer.rectangle(x, y + rad, rad, h - rad * 2, r, g, b, a)
	renderer.circle(x + rad, y + rad, r, g, b, a, rad, 180, 0.25)
	renderer.circle(x + rad, y + h - rad, r, g, b, a, rad, -90, 0.25)
end

local function r_rect(x, y, w, h, radius, col)
	radius = math.min(w / 2, h / 2, radius)
	local rr, g, b, a = col[1], col[2], col[3], col[4]
	renderer.rectangle(x, y + radius, w, h - radius * 2, rr, g, b, a)
	renderer.rectangle(x + radius, y, w - radius * 2, radius, rr, g, b, a)
	renderer.rectangle(x + radius, y + h - radius, w - radius * 2, radius, rr, g, b, a)
	renderer.circle(x + radius, y + radius, rr, g, b, a, radius, 180, 0.25)
	renderer.circle(x + w - radius, y + radius, rr, g, b, a, radius, 90, 0.25)
	renderer.circle(x + w - radius, y + h - radius, rr, g, b, a, radius, 0, 0.25)
	renderer.circle(x + radius, y + h - radius, rr, g, b, a, radius, -90, 0.25)
end

local function r_rect_outline(x, y, w, h, radius, t, col)
	radius = math.min(w / 2, h / 2, radius)
	local rr, g, b, a = col[1], col[2], col[3], col[4]
	t = t or 1
	renderer.rectangle(x + radius, y, w - radius * 2, t, rr, g, b, a)
	renderer.rectangle(x + radius, y + h - t, w - radius * 2, t, rr, g, b, a)
	renderer.rectangle(x, y + radius, t, h - radius * 2, rr, g, b, a)
	renderer.rectangle(x + w - t, y + radius, t, h - radius * 2, rr, g, b, a)
	renderer.circle_outline(x + radius, y + radius, rr, g, b, a, radius, 180, 0.25, t)
	renderer.circle_outline(x + w - radius, y + radius, rr, g, b, a, radius, 270, 0.25, t)
	renderer.circle_outline(x + w - radius, y + h - radius, rr, g, b, a, radius, 0, 0.25, t)
	renderer.circle_outline(x + radius, y + h - radius, rr, g, b, a, radius, 90, 0.25, t)
end

local function gradient_top_bar(x, y, w, h, alpha_mul)
	alpha_mul = alpha_mul or 1
	if w < 4 then return end
	local a1 = math.floor(140 * alpha_mul)
	local a2 = math.floor(90 * alpha_mul)
	renderer.gradient(x, y, w, h, 17, 24, 39, a1, 55, 65, 81, a2, true)
end

local function draw_grid_pattern(x, y, w, h, step, a)
	step = step or 60
	a = a or 5
	local xi = x
	while xi <= x + w do
		renderer.rectangle(xi, y, 1, h, 255, 255, 255, a)
		xi = xi + step
	end
	local yi = y
	while yi <= y + h do
		renderer.rectangle(x, yi, w, 1, 255, 255, 255, a)
		yi = yi + step
	end
end

local function in_rect(mx, my, x, y, w, h)
	return mx >= x and mx <= x + w and my >= y and my <= y + h
end

local function smooth(cur, target, dt, rate)
	rate = rate or 16
	dt = math.min(dt or 0.016, 0.05)
	local k = 1 - math.exp(-rate * dt)
	return cur + (target - cur) * k
end

local function a_scale(col, m)
	m = math.max(0, math.min(1, m))
	return { col[1], col[2], col[3], math.floor((col[4] or 255) * m) }
end

local function col_fade(col, mul)
	mul = math.max(0, math.min(1, mul or 1))
	return { col[1], col[2], col[3], math.floor((col[4] or 255) * mul) }
end

local function rect_outline_flat(x, y, w, h, r, g, b, a)
	if a < 2 or w < 2 or h < 2 then return end
	renderer.rectangle(x, y, w, 1, r, g, b, a)
	renderer.rectangle(x, y + h - 1, w, 1, r, g, b, a)
	renderer.rectangle(x, y, 1, h, r, g, b, a)
	renderer.rectangle(x + w - 1, y, 1, h, r, g, b, a)
end

local C = {
	bg = { 17, 24, 39, 255 },
	sidebar = { 24, 32, 47, 255 },
	content = { 17, 24, 39, 255 },
	panel = { 31, 41, 55, 245 },
	accent = { ACC_R, ACC_G, ACC_B, 255 },
	text = { 243, 244, 246, 255 },
	muted = COL_MUTED,
	border = { 55, 65, 81, 255 },
	nav_sel_bg = { 15, 38, 34, 255 },
	nav_sel_text = { 209, 250, 229, 255 },
	nav_sel_border = { 52, 211, 153, 140 },
}

local state = {
	win_x = nil,
	win_y = nil,
	dragging = false,
	drag_dx = 0,
	drag_dy = 0,
	sel_nav = 1,
	last_page_id = "rage",
	prev_m1 = false,
	steam64 = nil,
	avatar_tex = nil,
	logo_tex = nil,
	logo_w = nil,
	logo_h = nil,
	logo_last_try = 0,
	avatar_next_try = 0,
	slider_drag = nil,
	cloud_avatar_sig = "",
}

local anim = {
	popup = 0,
	page_blend = 1,
	nav_h = {},
	nav_sel_glow = 0,
	prof_h = 0,
	gb_h = {},
	cb_h = {},
	accent_pulse = 0,
}

local function limit_str(s, maxc)
	if #s <= maxc then return s end
	return s:sub(1, maxc - 1) .. "…"
end

local function texture_from_downloaded_image(raw, w, h)
	if type(raw) ~= "string" or #raw < 12 then
		return nil
	end
	w = w or 64
	h = h or 64
	local b1, b2 = raw:byte(1, 2)
	if b1 == 0xFF and b2 == 0xD8 then
		local sizes = { { w, h }, { 184, 184 }, { 128, 128 }, { 64, 64 }, { 32, 32 } }
		for i = 1, #sizes do
			local ww, hh = sizes[i][1], sizes[i][2]
			local ok, tex = pcall(renderer.load_jpg, raw, ww, hh)
			if ok and tex then
				return tex
			end
		end
		return nil
	end
	if raw:sub(1, 8) == "\137PNG\r\n\26\n" then
		local ok, tex = pcall(renderer.load_png, raw, w, h)
		return ok and tex or nil
	end
	local ok, tex = pcall(renderer.load_rgba, raw, w, h)
	return ok and tex or nil
end

local function fetch_steam_avatar(sid)
	if not images_ok or not images or not images.get_steam_avatar or not sid then
		return nil
	end
	local ok, av = pcall(images.get_steam_avatar, sid)
	if (not ok or not av) and tonumber(sid) then
		ok, av = pcall(images.get_steam_avatar, tonumber(sid))
	end
	if not ok or av == nil then
		return nil
	end
	if type(av) == "string" and #av > 32 then
		return texture_from_downloaded_image(av, 64, 64)
	end
	if type(av) ~= "table" then
		return nil
	end
	local raw = av.contents or av.data or av.buffer or av.bytes or av.body
	local w = tonumber(av.width) or tonumber(av.w)
	local h = tonumber(av.height) or tonumber(av.h)
	if not raw or #raw < 16 then
		return nil
	end
	w = w or 64
	h = h or 64
	if w > 0 and h > 0 then
		local need = w * h * 4
		if #raw >= need then
			local ok_r, tr = pcall(renderer.load_rgba, raw, w, h)
			if ok_r and tr then
				return tr
			end
		end
	end
	return texture_from_downloaded_image(raw, w, h)
end

local function sync_assets(opts)
	local lp = entity.get_local_player()
	local sid = nil
	if lp then
		local ok, s64 = pcall(entity.get_steam64, lp)
		if ok and s64 and s64 ~= 0 then
			sid = string.format("%.0f", s64)
		end
	end

	if sid and sid ~= "0" and #sid >= 10 and sid ~= state.steam64 then
		state.steam64 = sid
		state.avatar_tex = nil
		state.avatar_next_try = 0
	elseif sid and sid ~= "0" and #sid >= 10 then
		state.steam64 = sid
	end

	local now = globals.realtime()

	-- Dashboard / cloud avatar (same source as watermark), fallback to Steam.
	local cloud_b64 = ""
	local cloud_mime = "image/png"
	if opts and type(opts.get_cloud_avatar_b64) == "function" then
		cloud_b64 = tostring(opts.get_cloud_avatar_b64() or "")
	end
	if opts and type(opts.get_cloud_avatar_mime) == "function" then
		cloud_mime = tostring(opts.get_cloud_avatar_mime() or "image/png")
	end
	local csig = tostring(#cloud_b64) .. "|" .. cloud_mime
	if csig ~= state.cloud_avatar_sig then
		state.cloud_avatar_sig = csig
		state.avatar_tex = nil
		state.avatar_next_try = 0
	end

	if #cloud_b64 > 32 and base64_ok and base64 and base64.decode then
		local okd, raw = pcall(base64.decode, cloud_b64)
		if okd and type(raw) == "string" and #raw > 24 then
			local tex = texture_from_downloaded_image(raw, 64, 64)
			if tex then
				state.avatar_tex = tex
				state.avatar_next_try = 0
			end
		end
	end

	if state.avatar_tex == nil and state.steam64 and state.steam64 ~= "0" and #state.steam64 >= 10 then
		if now >= (state.avatar_next_try or 0) then
			local tex = fetch_steam_avatar(state.steam64)
			if tex then
				state.avatar_tex = tex
				state.avatar_next_try = 0
			else
				state.avatar_next_try = now + 0.2
			end
		end
	end

	if not state.logo_tex and (now - state.logo_last_try) > 0.5 then
		state.logo_last_try = now
		local ok, bytes = pcall(function()
			return readfile("amnesia/logotype.png")
		end)
		if ok and bytes and #bytes > 24 then
			local w, h = png_wh(bytes)
			if w and h then
				local tex = renderer.load_png(bytes, w, h)
				if tex then
					state.logo_tex = tex
					state.logo_w, state.logo_h = w, h
				end
			end
		end
	end

end

local function draw_profile_avatar_circle(cx, cy, r, tex, vis_mul, mask_rgb)
	vis_mul = vis_mul or 1
	mask_rgb = mask_rgb or { 15, 23, 36 }
	local ta = math.floor(255 * vis_mul)
	local mr, mg, mb = mask_rgb[1], mask_rgb[2], mask_rgb[3]
	local ma = math.floor(255 * vis_mul)
	renderer.circle(cx, cy, 55, 65, 81, math.floor(185 * vis_mul), r, 0, 1)
	if tex then
		renderer.texture(tex, cx - r, cy - r, r * 2, r * 2, 255, 255, 255, ta, "f")
		local cap = math.floor(r * (math.sqrt(2) - 1) + 0.5)
		if cap >= 1 then
			renderer.circle(cx - r, cy - r, mr, mg, mb, ma, cap, 0, 1)
			renderer.circle(cx + r, cy - r, mr, mg, mb, ma, cap, 0, 1)
			renderer.circle(cx + r, cy + r, mr, mg, mb, ma, cap, 0, 1)
			renderer.circle(cx - r, cy + r, mr, mg, mb, ma, cap, 0, 1)
		end
	else
		renderer.circle(cx, cy, 75, 85, 99, math.floor(200 * vis_mul), math.max(2, r - 5), 0, 1)
	end
	renderer.circle_outline(cx, cy, ACC_R, ACC_G, ACC_B, math.floor(145 * vis_mul), r, 0, 1, 1)
end

local function flatten_nav(blocks)
	local out = {}
	for _, block in ipairs(blocks) do
		for _, it in ipairs(block.items) do
			out[#out + 1] = it
		end
	end
	return out
end

local function group_h(n)
	return 38 + n * 24 + 14
end

local function pui_set(ref, v)
	if not ref then return end
	pcall(function()
		if ref.set then
			ref:set(v)
		else
			ref.value = v
		end
	end)
end

local function pui_get(ref)
	if not ref then return nil end
	return ref.value
end

local function pui_ref_visible(ref)
	if not ref then return true end
	local ok, vis = pcall(function()
		if ref.get_visible then
			return ref:get_visible()
		end
		return true
	end)
	if ok and not vis then
		return false
	end
	return true
end

local function paint(opts)
	if type(opts) ~= "table" or type(opts.should_draw) ~= "function" or type(opts.nav_blocks) ~= "table" then
		return
	end

	local dt = globals.frametime()
	if not dt or dt <= 0 or dt > 0.1 then
		dt = 1 / 120
	end
	dt = math.max(dt, 1 / 1000)

	local menu_open = ui.is_menu_open()
	local want = opts.should_draw() and menu_open
	anim.popup = smooth(anim.popup, want and 1 or 0, dt, 18)

	if anim.popup < 0.004 and not menu_open then
		return
	end

	local pv = anim.popup

	anim.accent_pulse = anim.accent_pulse + dt * 2.2
	local pulse = 0.92 + 0.08 * (math.sin(anim.accent_pulse * 1.4) * 0.5 + 0.5)

	local slide = math.floor((1 - pv) * 16)
	local vis = pv

	local sw, sh = client.screen_size()
	local W = MENU_W
	local R = 14
	local sb_w = 180
	local content_top_h = R + 8

	local mx, my = ui.mouse_position()
	local m1 = client.key_state(0x01)
	local click = m1 and not state.prev_m1
	state.prev_m1 = m1

	local flat = flatten_nav(opts.nav_blocks)
	local nav_n = #flat
	if nav_n < 1 then return end

	if state.sel_nav > nav_n then state.sel_nav = nav_n end
	if state.sel_nav < 1 then state.sel_nav = 1 end

	local cur_entry = flat[state.sel_nav]
	local page_id = cur_entry and cur_entry.id or "rage"

	local v = opts.vars
	if not v then
		return
	end

	if menu_open and want then
		sync_assets(opts)
	end

	local H = MENU_MIN_H
	if page_id == "vis" then
		local extra = 0
		if v.visuals.thirdperson.on.value then
			extra = extra + 62 + 6
		end
		if v.visuals.viewmodel.on.value then
			extra = extra + (62 + 6) * 4
		end
		if extra > 0 then
			local row1 = math.max(group_h(4), group_h(5))
			local need = content_top_h + row1 + 8 + group_h(5) + 8 + extra + 36
			H = math.min(math.max(MENU_MIN_H, need), math.max(MENU_MIN_H, sh - 28))
		end
	end

	if state.win_x == nil then
		state.win_x = math.min(20, math.floor(sw * 0.02))
		state.win_y = math.floor(sh / 2 - H / 2)
	end

	local x, y = state.win_x, state.win_y + slide

	if page_id ~= state.last_page_id then
		anim.page_blend = 0
		state.last_page_id = page_id
	end
	anim.page_blend = smooth(anim.page_blend, 1, dt, 14)
	local pb = anim.page_blend

	local header_h = 48
	local drag_sidebar = in_rect(mx, my, x, y, sb_w, header_h)
	local drag_content_top = in_rect(mx, my, x + sb_w, y, W - sb_w, content_top_h)
	if m1 and (drag_sidebar or drag_content_top) and pv > 0.5 and want then
		if not state.dragging and click then
			state.dragging = true
			state.drag_dx = mx - state.win_x
			state.drag_dy = my - state.win_y
		end
	end
	if state.dragging then
		if m1 then
			state.win_x = mx - state.drag_dx
			state.win_y = my - state.drag_dy
		else
			state.dragging = false
		end
	end

	local max_x = sw - W
	if max_x > GS_MENU_RIGHT_RESERVE then
		max_x = max_x - GS_MENU_RIGHT_RESERVE
	end
	max_x = math.max(0, max_x)
	state.win_x = math.max(0, math.min(max_x, state.win_x))
	state.win_y = math.max(0, math.min(sh - H, state.win_y))
	x, y = state.win_x, state.win_y + slide

	local function pa(c)
		return a_scale(c, vis)
	end

	r_rect(x, y, W, H, R, pa(C.bg))
	gradient_top_bar(x + R, y + 1, W - R * 2, 3, vis)
	draw_grid_pattern(x + sb_w + 2, y + R + 2, W - sb_w - R - 6, H - R * 2 - 4, 60, math.floor(5 * vis))
	rect_left_rounded(x, y, sb_w, H, R, pa(C.sidebar))
	local sep_a = math.floor(C.border[4] * vis)
	renderer.rectangle(x + sb_w - 1, y, 1, H, C.border[1], C.border[2], C.border[3], sep_a)

	local ca = math.floor(255 * vis)
	local cr, cg, cb = C.content[1], C.content[2], C.content[3]
	renderer.rectangle(x + sb_w, y + R, W - sb_w - R, H - R * 2, cr, cg, cb, ca)
	renderer.rectangle(x + sb_w, y, W - sb_w - R, R, cr, cg, cb, ca)
	renderer.rectangle(x + sb_w, y + H - R, W - sb_w - R, R, cr, cg, cb, ca)
	renderer.circle(x + W - R, y + R, cr, cg, cb, ca, R, 270, 0.25)
	renderer.circle(x + W - R, y + H - R, cr, cg, cb, ca, R, 0, 0.25)
	renderer.rectangle(x + W - R, y + R, R, H - R * 2, cr, cg, cb, ca)

	local pad = 14
	local logo_x = x + pad
	local logo_y = y + 12
	local logo_h_max = 28

	if state.logo_tex and state.logo_w and state.logo_h then
		local scale = logo_h_max / state.logo_h
		local lw = state.logo_w * scale
		renderer.texture(state.logo_tex, logo_x, logo_y, lw, logo_h_max, 255, 255, 255, math.floor(255 * vis), "f")
		text_draw(logo_x + lw + 10, logo_y - 2, col_fade(C.text, vis), "bd", "AMNESIA")
		text_draw(logo_x + lw + 10, logo_y + 12, col_fade(COL_ALPHA, vis), "-d", "ALPHA")
	else
		text_draw(logo_x, logo_y - 2, col_fade(C.text, vis), "bd", "amnesia")
		text_draw(logo_x, logo_y + 12, col_fade(COL_ALPHA, vis), "-d", "ALPHA")
	end

	local nav_top = y + 52
	local ny = nav_top
	local nav_i = 0
	local row_h = 24
	local nav_gap = 1
	local cat_skip = 16
	local cat_to_rows = 4
	local block_pad = 3
	local nav_rad = 6
	local nav_bottom_max = nav_top

	for _, block in ipairs(opts.nav_blocks) do
		text_draw(x + pad, ny, col_fade(COL_GRAY, vis), "-bd", block.cat)
		ny = ny + cat_skip + cat_to_rows
		for _, item in ipairs(block.items) do
			nav_i = nav_i + 1
			local label = item.label
			local ry = ny
			local rx, ry2, rw, rh = x + 4, ry, sb_w - 8, row_h
			nav_bottom_max = math.max(nav_bottom_max, ry2 + rh)
			local hovered = in_rect(mx, my, rx, ry2, rw, rh)
			anim.nav_h[nav_i] = smooth(anim.nav_h[nav_i] or 0, hovered and 1 or 0, dt, 18)

			local active = (nav_i == state.sel_nav)
			local hov = anim.nav_h[nav_i]

			if active then
				anim.nav_sel_glow = smooth(anim.nav_sel_glow, hov, dt, 22)
				local glow = anim.nav_sel_glow * 0.18
				local bg = a_scale(C.nav_sel_bg, vis)
				r_rect(rx, ry2, rw, rh, nav_rad, bg)
				r_rect_outline(rx, ry2, rw, rh, nav_rad, 1, {
					C.nav_sel_border[1],
					C.nav_sel_border[2],
					C.nav_sel_border[3],
					math.floor(C.nav_sel_border[4] * vis * (0.85 + glow)),
				})
				local bar_w = 3 + glow * 2
				renderer.rectangle(rx + 1, ry2 + nav_rad, bar_w, rh - nav_rad * 2, ACC_R, ACC_G, ACC_B, math.floor(255 * pulse * vis))
				local tx_active = rx + bar_w + 8 + glow
				text_draw(tx_active, nav_text_y(ry2, rh, "d", label), col_fade(C.nav_sel_text, vis), "d", label)
			else
				if hov > 0.02 then
					r_rect(rx, ry2, rw, rh, nav_rad, { 255, 255, 255, math.floor((8 + 18 * hov) * vis) })
					r_rect_outline(rx, ry2, rw, rh, nav_rad, 1, {
						75,
						85,
						99,
						math.floor((40 + 50 * hov) * vis),
					})
				end
				local br = math.floor((200 + math.floor(55 * hov)) * vis)
				local nfl = hov > 0.5 and "bd" or "d"
				local tx_in = x + pad + 8 + hov * 2
				text_draw(tx_in, nav_text_y(ry2, rh, nfl, label), { 229, 231, 235, math.max(0, math.min(255, br)) }, nfl, label)
			end
			if click and in_rect(mx, my, rx, ry2, rw, rh) and pv > 0.5 and want then
				state.sel_nav = nav_i
			end
			ny = ny + row_h + nav_gap
		end
		ny = ny + block_pad
	end

	local prof_w, prof_hh = sb_w - 16, 72
	local prof_margin = 12
	local prof_gap = 10
	local prof_y_min = y + H - prof_hh - prof_margin
	local prof_y = math.max(prof_y_min, nav_bottom_max + prof_gap)
	local prof_x = x + 8
	anim.prof_h = smooth(anim.prof_h, in_rect(mx, my, prof_x, prof_y, prof_w, prof_hh) and 1 or 0, dt, 16)
	local phov = anim.prof_h

	local side_line_a = math.floor(55 * vis)
	renderer.rectangle(x + 6, prof_y - 8, sb_w - 12, 1, 55, 65, 81, side_line_a)

	local prof_vis = vis * (0.94 + 0.06 * phov)
	r_rect(prof_x, prof_y, prof_w, prof_hh, 10, a_scale({ 15, 23, 36, 245 }, prof_vis))
	local prof_ba = math.floor((C.border[4] or 255) * vis * (0.88 + 0.2 * phov))
	r_rect_outline(prof_x, prof_y, prof_w, prof_hh, 10, 1, {
		C.border[1],
		C.border[2],
		C.border[3],
		prof_ba,
	})

	local av_r = 12
	local av_cx = prof_x + 10 + av_r
	local av_cy = prof_y + math.floor(prof_hh * 0.5)
	draw_profile_avatar_circle(av_cx, av_cy, av_r, state.avatar_tex, prof_vis, { 15, 23, 36 })

	local tx = av_cx + av_r + 10
	local uname = limit_str(type(opts.get_username) == "function" and opts.get_username() or "user", 22)
	text_draw(tx, prof_y + 17, col_fade(C.text, vis), "bd", uname)
	local till = type(opts.get_expiry_line) == "function" and opts.get_expiry_line() or "Till: Lifetime"
	text_draw(tx, prof_y + 36, col_fade(COL_PROFILE_SUB, vis), "d", till)

	local px = x + sb_w + 16
	local py = y + content_top_h
	local pw = W - sb_w - 32

	local function group_title_y(gy, ghv, title)
		local row_top = gy + 8 - ghv
		local _, th = renderer.measure_text(text_flags("bd"), title)
		th = th or 12
		return row_top + math.floor((22 - th) / 2)
	end

	local function group_box(gx, gy, gw, gh, title, rows, gid)
		gid = gid or "g1"
		local ghov_t = in_rect(mx, my, gx, gy, gw, gh) and 1 or 0
		anim.gb_h[gid] = smooth(anim.gb_h[gid] or 0, ghov_t, dt, 15)
		local ghv = anim.gb_h[gid]
		local pmul = vis * pb

		r_rect(gx, gy - ghv * 1, gw, gh, 12, a_scale(C.panel, pmul * (0.94 + 0.06 * ghv)))
		r_rect_outline(gx, gy - ghv * 1, gw, gh, 12, 1, a_scale(C.border, pmul * (0.88 + 0.3 * ghv)))

		text_draw(gx + 16, group_title_y(gy, ghv, title), col_fade(C.text, pb * vis), "bd", title)

		local cy = gy + 38
		for i, row in ipairs(rows) do
			local ref = row.ref
			if pui_ref_visible(ref) then
				local key = row.key or (gid .. "_" .. i)
				local row_rx, row_ry, row_rw, row_rh = gx + 8, cy - 3, gw - 16, 22
				local row_hov = in_rect(mx, my, row_rx, row_ry, row_rw, row_rh) and 1 or 0
				anim.cb_h[key] = smooth(anim.cb_h[key] or 0, row_hov, dt, 20)
				local ch = anim.cb_h[key]

				if ch > 0.03 then
					r_rect(row_rx, row_ry, row_rw, row_rh, 6, { 255, 255, 255, math.floor((10 + 22 * ch) * pmul) })
				end

				local on = ref and pui_get(ref)
				local bx, by = gx + 14, cy
				local cs = 14
				local cx0, cy0 = bx, by - 1
				local br0, bg0, bb0 = 107 + math.floor(48 * ch), 114 + math.floor(48 * ch), 128 + math.floor(40 * ch)
				local border_a = math.floor((150 + 90 * ch) * pmul)
				rect_outline_flat(cx0, cy0, cs, cs, br0, bg0, bb0, border_a)
				if on then
					local inset = 3
					renderer.rectangle(
						cx0 + inset,
						cy0 + inset,
						cs - inset * 2,
						cs - inset * 2,
						ACC_R,
						ACC_G,
						ACC_B,
						math.floor(255 * pmul)
					)
				end
				local label_intensity = math.max(0.62, 0.82 + 0.18 * ch) * pb * vis
				text_draw(bx + cs + 10, by + 1, col_fade(C.text, label_intensity), ch > 0.2 and "bd" or "d", row.label)
				if click and want and in_rect(mx, my, row_rx, row_ry, row_rw, row_rh) and pv > 0.5 and ref then
					pui_set(ref, not on)
				end
				cy = cy + 24
			end
		end
	end

	local function slider_box(gx, gy, gw, gh, title, ref, minv, maxv, suffix, gid, float_step)
		if not ref or not pui_ref_visible(ref) then return end
		gid = gid or "sl1"
		local ghov_t = in_rect(mx, my, gx, gy, gw, gh) and 1 or 0
		anim.gb_h[gid] = smooth(anim.gb_h[gid] or 0, ghov_t, dt, 15)
		local ghv = anim.gb_h[gid]
		local pmul = vis * pb

		r_rect(gx, gy - ghv, gw, gh, 12, a_scale(C.panel, pmul * (0.94 + 0.06 * ghv)))
		r_rect_outline(gx, gy - ghv, gw, gh, 12, 1, a_scale(C.border, pmul * (0.88 + 0.3 * ghv)))
		text_draw(gx + 16, group_title_y(gy, ghv, title), col_fade(C.text, pb * vis), "bd", title)

		local v = tonumber(pui_get(ref)) or minv
		local sl_x = gx + 14
		local sl_y = gy + 40
		local val_col_w = 72
		local sl_w = math.max(48, gw - 28 - val_col_w)
		local sl_h = 14
		renderer.rectangle(sl_x, sl_y + 5, sl_w, 4, 55, 65, 81, math.floor(220 * pmul))
		local f = (v - minv) / math.max(1e-9, maxv - minv)
		f = math.max(0, math.min(1, f))
		local tw = 9
		renderer.rectangle(sl_x + f * (sl_w - tw), sl_y + 2, tw, sl_h, ACC_R, ACC_G, ACC_B, math.floor(255 * pmul))
		local val_str
		if type(float_step) == "number" then
			val_str = string.format("%.1f", v) .. (suffix or "")
		else
			val_str = tostring(math.floor(v + 0.5)) .. (suffix or "")
		end
		local vtw = select(1, renderer.measure_text("d", val_str)) or 0
		if vtw > val_col_w - 4 then
			val_str = val_str:sub(1, 12) .. "…"
		end
		local vx = gx + gw - 14 - val_col_w
		renderer.text(vx, sl_y + 1, C.muted[1], C.muted[2], C.muted[3], math.floor(255 * pmul), "d", val_col_w - 4, val_str)

		local hit = in_rect(mx, my, sl_x, sl_y, sl_w, sl_h + 6)
		if click and want and hit and pv > 0.5 then
			state.slider_drag = gid
		end
		if state.slider_drag == gid and m1 and want then
			local t = (mx - sl_x) / sl_w
			t = math.max(0, math.min(1, t))
			local nv = minv + t * (maxv - minv)
			if type(float_step) == "number" then
				nv = math.floor(nv / float_step + 0.5) * float_step
			else
				nv = math.floor(nv + 0.5)
			end
			pui_set(ref, nv)
		end
	end

	local col_gap = 10
	local col_w = math.floor((pw - col_gap) / 2)

	if page_id == "rage" then
		group_box(px, py, col_w, group_h(5), opts.hdr_rage or opts.t("Assault Core"), {
			{ label = opts.t("Auto teleport"), ref = v.rage.teleport.on, key = "rg_tp" },
			{ label = opts.t("Auto exploit switch"), ref = v.rage.exswitch.on, key = "rg_ex" },
			{ label = opts.t("Anti-aimbot Correction"), ref = v.rage.resolver, key = "rg_res" },
			{ label = opts.t("SSG 08 Air Autostop"), ref = v.rage.ssg08_air.on, key = "rg_ssg" },
			{ label = opts.t("LC breaker"), ref = v.rage.vulnlc, key = "rg_lc" },
		}, "rage_l")
		group_box(px + col_w + col_gap, py, col_w, group_h(2), opts.t("Teleport"), {
			{ label = opts.t("Ensure landing"), ref = v.rage.teleport.land, key = "rg_land" },
			{ label = opts.t("Allow pistols"), ref = v.rage.teleport.pistol, key = "rg_pist" },
		}, "rage_r")
		local row_max_r = math.max(group_h(5), group_h(2))
		slider_box(px, py + row_max_r + 8, pw, 62, opts.t("Hit chance in air"), v.rage.ssg08_air.hc_in_air, 0, 100, "%", "rage_sl")
	elseif page_id == "aa" then
		group_box(px, py, col_w, group_h(5), opts.hdr_aa_general or opts.t("Signals"), {
			{ label = opts.t("Enable"), ref = v.antiaim.global, key = "aa_en" },
			{ label = opts.t("Anti-backstab"), ref = v.antiaim.general.stab, key = "aa_stab" },
			{ label = opts.t("On use AA"), ref = v.antiaim.general.use, key = "aa_use" },
			{ label = opts.t("Warmup AA"), ref = v.antiaim.general.warmup, key = "aa_warm" },
			{ label = opts.t("Manual yaw"), ref = v.antiaim.general.manual.on, key = "aa_man" },
		}, "aa_l")
		group_box(px + col_w + col_gap, py, col_w, group_h(4), opts.t("Tactics"), {
			{ label = opts.t("Defensive snap"), ref = v.antiaim.exploits.snap.on, key = "aa_snap" },
			{ label = opts.t("Allow with On shot AA"), ref = v.antiaim.exploits.snap.os, key = "aa_snap_os" },
			{ label = opts.t("Fake lag"), ref = v.antiaim.lag.fakelag.on, key = "aa_fl" },
			{ label = opts.t("Gaslighting"), ref = v.antiaim.venture.long.gaslight, key = "aa_gas" },
		}, "aa_r")
		local row_max = math.max(group_h(5), group_h(4))
		slider_box(px, py + row_max + 8, pw, 62, opts.t("Limit"), v.antiaim.lag.fakelag.limit, 1, 15, "t", "aa_fllim")
	elseif page_id == "vis" then
		group_box(px, py, col_w, group_h(4), opts.hdr_visuals or opts.t("Visuals"), {
			{ label = opts.t("Crosshair Indicators"), ref = v.visuals.crosshair.on, key = "vi_ch" },
			{ label = opts.t("Damage Indicator"), ref = v.visuals.damage, key = "vi_dmg" },
			{ label = opts.t("Anti-aim Arrows"), ref = v.visuals.arrows, key = "vi_arr" },
			{ label = opts.t("Hitmarker"), ref = v.visuals.marker, key = "vi_mark" },
		}, "vis_l")
		group_box(px + col_w + col_gap, py, col_w, group_h(5), opts.t("Widgets"), {
			{ label = opts.t("Watermark"), ref = v.visuals.water.on, key = "vi_wat" },
			{ label = opts.t("Keybinds List"), ref = v.visuals.keylist, key = "vi_key" },
			{ label = opts.t("Spectators List"), ref = v.visuals.speclist, key = "vi_spec" },
			{ label = opts.t("Slowdown Indicator"), ref = v.visuals.slowdown, key = "vi_slow" },
			{ label = opts.t("Defensive Indicator"), ref = v.visuals.defensive_indicator, key = "vi_def" },
			{ label = opts.t("Kill Sound Counter"), ref = v.visuals.kill_sound_counter, key = "vi_ksc2" },
			{ label = opts.t("Kill Counter Widget"), ref = v.visuals.kill_sound_widget, key = "vi_kscw" },
		}, "vis_r")
		local tw_y = py + math.max(group_h(4), group_h(5)) + 8
		group_box(px, tw_y, pw, group_h(5), opts.t("Tweaks"), {
			{ label = opts.t("Background Menu"), ref = v.visuals.menu_bg, key = "vi_bg" },
			{ label = opts.t("Performance Mode"), ref = v.visuals.cheap, key = "vi_cheap" },
			{ label = opts.t("Scale DPI"), ref = v.visuals.dpi, key = "vi_dpi" },
			{ label = opts.t("Thirdperson FOV"), ref = v.visuals.thirdperson.on, key = "vi_tp" },
			{ label = opts.t("Viewmodel changer"), ref = v.visuals.viewmodel.on, key = "vi_vm_on" },
		}, "vis_tw")
		local y_sl = tw_y + group_h(5) + 8
		if v.visuals.thirdperson.on.value then
			slider_box(px, y_sl, pw, 62, opts.t("Thirdperson distance"), v.visuals.thirdperson.distance, 30, 200, "", "vis_tpd")
			y_sl = y_sl + 62 + 6
		end
		if v.visuals.viewmodel.on.value then
			slider_box(px, y_sl, pw, 62, opts.t("Offset FOV"), v.visuals.viewmodel.offset_fov, -1800, 1800, "", "vis_vmf", 0.1)
			y_sl = y_sl + 62 + 6
			slider_box(px, y_sl, pw, 62, opts.t("Offset X"), v.visuals.viewmodel.offset_x, -1800, 1800, "", "vis_vmx", 0.1)
			y_sl = y_sl + 62 + 6
			slider_box(px, y_sl, pw, 62, opts.t("Offset Y"), v.visuals.viewmodel.offset_y, -1800, 1800, "", "vis_vmy", 0.1)
			y_sl = y_sl + 62 + 6
			slider_box(px, y_sl, pw, 62, opts.t("Offset Z"), v.visuals.viewmodel.offset_z, -1800, 1800, "", "vis_vmz", 0.1)
		end
	elseif page_id == "set" then
		group_box(px, py, col_w, group_h(7), opts.t("Modules"), {
			{ label = opts.t("Aspect ratio"), ref = v.misc.aspect.on, key = "st_asp" },
			{ label = opts.t("Fast ladder"), ref = v.misc.ladder, key = "st_lad" },
			{ label = opts.t("Clantag"), ref = v.misc.clantag, key = "st_clan" },
			{ label = opts.t("Trashtalk"), ref = v.misc.trashtalk.on, key = "st_tt" },
			{ label = opts.t("Console filter"), ref = v.misc.filter, key = "st_filt" },
			{ label = opts.t("Eventlogger"), ref = v.misc.logs.on, key = "st_log" },
			{ label = opts.t("Animation breaker"), ref = v.misc.breaker.on, key = "st_brk" },
		}, "set_l")
		group_box(px + col_w + col_gap, py, col_w, group_h(1), opts.t("Menu"), {
			{ label = opts.t("Alternative Amnesia Menu"), ref = v.misc.alt_amnesia_menu, key = "st_alt" },
		}, "set_r")
	end

	if not m1 then
		state.slider_drag = nil
	end
end

return { paint = paint }
]===]
	local f, _err = loadstring(_amnesia_alt_menu_src, "amnesia_alt_menu")
	local ok, m
	if f then ok, m = pcall(f) end
	if ok and type(m) == "table" and type(m.paint) == "function" then
		amnesia_alt_menu = m
	else
		amnesia_alt_menu = nil
		local ok2, m2 = pcall(require, "amnesia_alt_menu")
		if ok2 and type(m2) == "table" and type(m2.paint) == "function" then
			amnesia_alt_menu = m2
		end
	end
end
-- endregion amnesia_alt_menu_embed

local amnesia_alt_menu_opts = {
	should_draw = function ()
		local m = vars.misc.alt_amnesia_menu
		return m and m.value and menu.main.global.value and menu.main.auth_gate.value
	end,
	t = amnesia.t,
	vars = vars,
	get_username = function ()
		return display_user_name()
	end,
	get_expiry_line = function ()
		return string.format("%s: %s", amnesia.t("Till"), tostring(amnesia.expiry or "lifetime"))
	end,
	hdr_rage = HDR_RAGE,
	hdr_aa_general = HDR_AA_GENERAL,
	hdr_visuals = HDR_VISUALS,
	nav_blocks = {
		{ cat = amnesia.t("AIMBOT"), items = {
			{ id = "rage", label = TAB_RAGE },
			{ id = "aa", label = TAB_AA },
		} },
		{ cat = amnesia.t("VISUALS"), items = {
			{ id = "vis", label = TAB_VISUALS },
		} },
		{ cat = amnesia.t("MISCELLANEOUS"), items = {
			{ id = "set", label = TAB_SETTINGS },
		} },
	},
	get_cloud_avatar_b64 = function ()
		return type(amnesia.user.cloud_avatar_b64) == "string" and amnesia.user.cloud_avatar_b64 or ""
	end,
	get_cloud_avatar_mime = function ()
		return type(amnesia.user.cloud_avatar_mime) == "string" and amnesia.user.cloud_avatar_mime or "image/png"
	end,
}

-- #endregion

-- #endregion
--

--
-- #region : Config system

-- Hidden product tag: distinguishes amnesia configs from any other "amnesia::GS::" style.
local CFG_MAGIC = "amnesia2026_cfdk9f3m7x1"
local BUILTIN_CONFIG_NAME = "Recommended"

local configs = {
	system = nil,
	default = "amnesia::GS::KGRlZmF1bHQpW2VuUV17haRkcmFniKhzcGVjbGlzdIKhec0TiKF4zQtkpmFycm93c4Khec0TYqF4zRKYqWNyb3NzaGFpcoKhec0UlKF4zRMLqHNsb3dkb3dugqF5zQlLoXjNEkz113Zna2V5bGlzdIKhec0TiKF4zQtkpmRhbWFnZYKhec0TraF4zROcqXdhdGVybWFya4Ohecy5oXjNJp2hYQKkbG9nc4Khec0azaF4zRB6p3Zpc3VhbHOLo2RwacKlY2hlYXDCpm1hcmtlcsOoc3BlY2xpc3TCpmFycm93c8Kna2V5bGlzdMKoc2xvd2Rvd27DpmRhbWFnZcOmYWNjZW50qSM3NEE2QTlGRqV3YXRlcoOkaGlkZcKkbmFtZaCib27DqWNyb3NzaGFpcoOkbG9nb8Olc3R5bGWnQ2xhc3NpY6JvbsOkbWlzY4amZmlsdGVyw6ZsYWRkZXLDp2NsYW50YWfCp2JyZWFrZXKEpHNsaWHDpXBpdGNowqJvbsKkbGVnc6ROb25lpmFzcGVjdIKlcmF0aWz143ZMhaJvbsOkbG9nc4OmZXZlbnRzla1SYWdlYm90IHNob3Rzr0hhcm1pbmcgZW5lbWllc65HZXR0aW5nIGhhcm1lZK1BbnRpLWFpbSBpbmZvoX6mb3V0cHV0k6dDb25zb2xlplNjcmVlbqFz113Zom9uw6dhbnRpYWlthqd2ZW50dXJlgaRsb25ngahnYXNsaWdodMKmZ2xvYmFsw6NsYWeBp2Zha2VsYWeDpWxpbWl0D6Rtb2Rlp0R5bmFtaWOib27Dp2dlbmVyYWyHpHN0YWLDpGhlYWSRoX6jdXNlw6ZtYW51YWyHpXJpZ2h0kwIAoX6kbGVmdJMCAKFz113ZpGVkZ2WTAgChfqJzdMKiZnOTAgChfqJvbsOlcmVzZXSTAgChfqhpbnZlcnRlcpMBAKFz113Zo3lhd6pBdCB0YXJnZXRzpndhcm11cMKoZXhwbG9pdHOCpnZ1bG5sY5SrQ2FuJ3Qgc2hvb3SnSnVtcGluZ6lDcm91Y2hpbmehfqRzbmFwhKJvc8OibHDDom9uw6Rvbl9okwAAoX6mc3RhdGVziKR3YWxr3gAco2RfZAClbV9taW7lpG1fYXIApG1fYWwApHJfZHQFo21vZKZKaXR0ZXKkcl9pcgqjbV9hwqVtX21heCOjZHN5pE5vbmWob3ZlcnJpZGXDomRzp0RlZmF1bHSkZF9yd8KkZF9zd8OkZF9vbsOjZHNwpE5vbmWkZHNwMtDTo2RfcgCjZF9sAKNtX2QApXdfbnVtA6V5X29mZgCmZF9tb2RlpEF1dGz113ZjbV9yw6Rkc3Ax0NOkd2F5c5cAAAAAAAAApGRzeTHMtKN3X23Cp2FpcmR1Y2veAByjZF9kAKVtX21pbuqkbV9hcgCkbV9hbACkcl9kdAOjbW9kpkppdHRlcqRyX2lyBqNtX2HCpW1fbWF4JKNkc3mmU3dpdGNoqG92ZXJyaWRlw6Jkc6ZDdXN0b22kZF9yd8KkZF9zd8OkZF9vbsOjZHNwplN3aXRjaKRkc3AyAKNkX3IAo2RfbACjbV9kAKV3X251bQOleV9vZmYDpmRfbW9kZaRBdXRvo21fcsOkZHNwMdCnpHdheXOXAAAAAAAAAKRkc3kxzPCjd19twqNhaXLeAByjZF9kAKVtX21pbgCkbV9hcgCkbV9hbACkcl9kdBGjbW9kpkppdHRlcqRyX2lyAKNtX2HCpW1fbWF4AKNkc3mmU3dpdGNoqG92ZXJyaWRlw6Jkc6ZDdXN0b22kZF9yd8KkZF9zd8OkZF9vbsOjZHNwplN3aXRjaKRkc3AyAKNkX3IAo2RfbACjbV9kHKV3X251bQOleV9vZmYDpmRfbW9kZaRBdXRvo21fcsKkZHNwMQCkd2F5c5cAAAAAAAAApGRzeTHMtKN3X23CpXNuZWFr3gAco2RfZAClbV9taW7rpG1fYXIApG1fYWwApHJfZHQRo21vZKZKaXR0ZXKkcl9pcgajbV9hwqVtX21heCSjZHN5pE5vbmWob3ZlcnJpZGXDomRzp0RlZmF1bHSkZF9yd8KkZF9zd8OkZF9vbsOjZHNwpE5vbmWkZHNwMtDTo2RfcgCjZF9sAKNtX2QApXdfbnVtA6V5X29mZgCmZF9tb2RlpEF1dGz113ZjbV9yw6Rkc3Ax0NOkd2F5c5cAAAAAAAAApGRzeTHMtKN3X23CpXN0YW5k3gAco2RfZAilbV9taW4ApG1fYXIApG1fYWwApHJfZHQBo21vZKZKaXR0ZXKkcl9pcgCjbV9hwqVtX21heACjZHN5pE5vbmWob3ZlcnJpZGXDomRzp0RlZmF1bHSkZF9yd8KkZF9zd8KkZF9vbsOjZHNwpE5vbmWkZHNwMtDTo2RfcgCjZF9sAKNtX2QgpXdfbnVtA6V5X29mZgCmZF9tb2RlpEF1dGz113ZjbV9ywqRkc3Ax0NOkd2F5c5cAAAAAAAAApGRzeTHMtKN3X23CpmNyb3VjaN4AHKNkX2QApW1fbWluAKRtX2FyAKRtX2FsAKRyX2R0EaNtb2SmSml0dGVypHJfaXIAo21fYcKlbV9tYXgAo2RzeaROb25lqG92ZXJyaWRlw6Jkc6dEZWZhdWx0pGRfcnfCpGRfc3fDpGRfb27Do2RzcKROb25lpGRzcDLQ06NkX3IAo2RfbACjbV9kHqV3X251bQOleV9vZmYCpmRfbW9kZaRBdXRvo21fcsKkZHNwMdDTpHdheXOXAAAAAAAAAKRkc3kxzLSjd19twqNydW7eAByjZF9kAKVtX21pbuKkbV9hcgCkbV9hbACkcl9kdAOjbW9kpkppdHRlcqRyX2lyAKNtX2HCpW1fbWF4I6Nkc3mkTm9uZahvdmVycmlkZcOiZHOnRGVmYXVsdKRkX3J3wqRkX3N3w6RkX29uw6Nkc3CkTm9uZaRkc3Ay0NOjZF9yAKNkX2wAo21fZACld19udW0DpXlfb2ZmAKZkX21vZGWkQXV0b6NtX3LDpGRzcDHQ06R3YXlzlwAAAAAAAACkZHN5Mcy0o3dfbcKnZGVmYXVsdN4AG6NkX2QApW1fbWlu46RtX2FyAKRtX2FsAKRyX2R0AaNtX2HCpHJfaXIApW1fbWF4HaRkX3N3w6RkX29uw6Jkc6ZDdXN0b22kZF9yd8KkZHN5Mcy0o2RzeaZTd2l0Y2ijZF9sAKNkc3CmU3dpdGNopGRzcDLQp6NkX3IAo21fZB2ld19udW0DpXlfb2ZmAKZkX21vZGWkQXV0b6NtX3LCpGRzcDHQp6R3YXlzlwAAAAAAAACjbW9kpkppdHRlcqN3X23CpHJhZ2WDqHRlbGVwb3J0hKRvbl9okwEAoX6mcGlzdG9swqJvbsKkbGFuZMKoZXhzd2l0Y2iCpWFsbG93kaFz113Zom9uwqhyZXNvbHZlcsJ9",
	by_developer = [[amnesia2026_cfdk9f3m7x1::GS::KElJcGFCb0N5RHVlKVtlc3RrXXuFpGRyYWeJp2tleWxpc3SCoXnNE4iheM0LZKhzcGVjbGlzdIKhec0TiKF4zQtkpmFycm93c4Khec0TYqF4zRKYqWRlZmVuc2l2ZYKhec0PMKF4zRIwqHNsb3dkb3dugqF5zQlLoXjNEkz113Zpd2F0ZXJtYXJrg6F5zSV4oXjNE4ihYQGmZGFtYWdlgqF5zROtoXjNE5ypY3Jvc3NoYWlygqVzdHlsZWnQ2xhc3NpY6JvbsKzZGVmZW5zaXZlX2luZGljYXRvcsKmbWFya2Vyw6hzcGVjbGlzdMKmYXJyb3dzwqVjaGVhcMKoc2xvd2Rvd27DqXZpZXdtb2RlbIWob2Zmc2V0X3kAqG9mZnNldF94GapvZmZzZXRfZm92zQKoom9uwqhvZmZzZXRfevGmZGFtYWdlw6V3YXRlcoSvY3VzdG9tX3VzZXJuYW1lwqRoaWRlwqRuYW1loKJvbsOjZHBpw6RtaXNjiKl0cmFzaHRhbGuErHN5bmNfYW1uZXNpYcOlY29uZHOTp09uIEtpbGyoT24gRGVhdGihfqRtb2Rlp0RlZmF1bHSib27DpGxvZ3ODpmV2ZW50c5WtUmFnZWJvdCBzaG90c69IYXJtaW5nIGVuZW1pZXOuR2V0dGluZyBoYXJtZWStQW50aS1haW0gaW5mb6Fz113Zpm91dHB1dJOnQ29uc29sZaZTY3JlZW6hfqJvbsOmbGFkZGVyw6dicmVha2VyhahsZWdzX2FpcqhBaXIgV2Fsa6VwaXRjaMOkbGVnc6dXYWxraW5nom9uw6VibGluZMOnY2xhbnRhZ8OmZmlsdGVyw6Zhc3BlY3SCpXJhdGlvdqJvbsOwYWx0X2FtbmVzaWFfbWVudcKnYW50aWFpbYenYnVpbGRlcoGmcHJlc2V0pkN1c3RvbahleHBsb2l0c4KmdnVsbmxjlKtDYW4ndCBzaG9vdKdKdW1waW5nqUNyb3VjaGluZ6Fz113ZpHNuYXCDom9zwqRvbl9okwAAoX6ib27Dpmdsb2JhbMOjbGFngadmYWtlbGFng6VsaW1pdAz113ZkbW9kZadEeW5hbWljom9uw6dnZW5lcmFsh6RzdGFiw6RoZWFkkqlBaXIgbWVsZWWhfqN1c2XDpm1hbnVhbIelcmlnaHSTAgChfqRsZWZ0kwIAoX6kZWRnZZMCAKFz113ZonN0wqJmc5MBFKFz113Zom9uw6VyZXNldJMCAKFz113ZqGludmVydGVykwEAoX6jeWF3qkF0IHRhcmdldHOmd2FybXVwwqd2ZW50dXJlgaRsb25ngahnYXNsaWdodMKmc3RhdGVziKR3YWxr3gAco2RfZAClbV9taW7lpG1fYXIApG1fYWwApHJfZHQFo21vZKZKaXR0ZXKkcl9pcgqjbV9hwqVtX21heCOjZHN5pE5vbmWob3ZlcnJpZGXDomRzp0RlZmF1bHSkZF9yd8KkZF9zd8OkZF9vbsOjZHNwpE5vbmWkZHNwMtDTo2RfcgCjZF9sAKNtX2QApXdfbnVtA6V5X29mZgCmZF9tb2RlpEF1dGz113ZjbV9yw6Rkc3Ax0NOkd2F5c5cAAAAAAAAApGRzeTHMtKN3X23Cp2FpcmR1Y2veAByjZF9kAKVtX21pbuqkbV9hcgCkbV9hbACkcl9kdAOjbW9kpkppdHRlcqRyX2lyIKNtX2HCpW1fbWF4GaNkc3mmU3dpdGNoqG92ZXJyaWRlw6Jkc6NPZmakZF9yd8KkZF9zd8OkZF9vbsOjZHNwplJhbmRvbaRkc3AyAKNkX3IOo2RfbPujbV9kAKV3X251bQOleV9vZmYEpmRfbW9kZapTaWRlLWJhc2Vko21fcsOkZHNwMdCnpHdheXOXAAAAAAAAAKRkc3kxHqN3X23Co2Fpct4AHKNkX2QApW1fbWlu0NykbV9hcgCkbV9hbACkcl9kdAOjbW9kpkppdHRlcqRyX2lyBaNtX2HCpW1fbWF4GKNkc3mmU3dpdGNoqG92ZXJyaWRlw6Jkc6NPZmakZF9yd8KkZF9zd8OkZF9vbsOjZHNwplN3aXRjaKRkc3AyAKNkX3IAo2RfbACjbV9kHKV3X251bQOleV9vZmYDpmRfbW9kZaRBdXRvo21fcsOkZHNwMdCnpHdheXOXAAAAAAAAAKRkc3kxLaN3X23CpXNuZWFr3gAco2RfZAClbV9taW7rpG1fYXIApG1fYWwApHJfZHQRo21vZKZKaXR0ZXKkcl9pcgajbV9hwqVtX21heCSjZHN5pE5vbmWob3ZlcnJpZGXDomRzo09mZqRkX3J3wqRkX3N3w6RkX29uw6Nkc3CkTm9uZaRkc3Ay0NOjZF9yAKNkX2wAo21fZACld19udW0DpXlfb2ZmAKZkX21vZGWkQXV0b6NtX3LDpGRzcDHQ06R3YXlzlz143ZsAAAAAAACkZHN5Mcy0o3dfbcKjcnVu3gAco2RfZAClbV9taW7ipG1fYXIApG1fYWwApHJfZHQDo21vZKZKaXR0ZXKkcl9pchejbV9hwqVtX21heCOjZHN5pE5vbmWob3ZlcnJpZGXDomRzo09mZqRkX3J3wqRkX3N3w6RkX29uw6Nkc3CkTm9uZaRkc3Ay0NOjZF9yAKNkX2wAo21fZACld19udW0DpXlfb2Zmz143ZKZkX21vZGWkQXV0b6NtX3LDpGRzcDHQ06R3YXlzlwAAAAAAAACkZHN5Mcy0o3dfbcKnZGVmYXVsdN4AG6NkX2QApW1fbWlu46RtX2FyAKRtX2FsAKRyX2R0AaNtX2HCpHJfaXIApW1fbWF4HaRkX3N3w6RkX29uw6Jkc6ZDdXN0b22kZF9yd8KkZHN5Mczxo2RzeaZTd2l0Y2ijZF9sAKNkc3CmU3dpdGNopGRzcDLQp6NkX3IAo21fZB2ld19udW0DpXlfb2ZmAKZkX21vZGWkQXV0b6NtX3LCpGRzcDHQp6R3YXlzlwAAAAAAAACjbW9kpkppdHRlcqN3X23CpHJhZ2WEqHJlc29sdmVywqh0ZWxlcG9ydISkb25faJMBAKFz113ZpnBpc3RvbMKib27CpGxhbmTCqGV4c3dpdGNogqVhbGxvd5GhfqJvbsKpc3NnMDhfYWlygqloY19pbl9haXJGom9uwn0_]],
	badge = pui.format("\v•\r "),
	selected = 0, name = "",
	loaded = nil,
	list = {}
} do
	local function _validate_config_blob(raw)
		if type(raw) ~= "string" or raw == "" then return false end
		raw = raw:gsub("^%s+", ""):gsub("%s+$", "")
		local magic, cheat, contents = string.match(raw, "^(.-)::(%a+)::([%w%+%/%-_]+)$")
		if not magic or magic == "" then
			magic, cheat, contents = string.match(raw, "^(amnesia)::(%a+)::([%w%+%/%-_]+)$")
		end
		if cheat ~= "GS" or (magic ~= CFG_MAGIC and magic ~= "amnesia") or type(contents) ~= "string" then
			return false
		end
		local function try_decode(candidate)
			local ok, out = pcall(base64.decode, candidate)
			if ok and type(out) == "string" and out ~= "" then
				return out
			end
			return nil
		end
		local candidates = {}
		do
			local bare, pad = contents:match("^(.-)(_*)$")
			local c = (bare or contents):gsub("z113Z", "+"):gsub("z143Z", "/") .. string.rep("=", #(pad or ""))
			local d = try_decode(c); if d then candidates[#candidates + 1] = d end
		end
		do
			local bare, pad = contents:match("^(.-)(_*)$")
			local c = (bare or contents) .. string.rep("=", #(pad or ""))
			local d = try_decode(c); if d then candidates[#candidates + 1] = d end
		end
		do
			local c = contents:gsub("%-", "+"):gsub("_", "/")
			local rem = #c % 4
			if rem ~= 0 then c = c .. string.rep("=", 4 - rem) end
			local d = try_decode(c); if d then candidates[#candidates + 1] = d end
		end
		for i = 1, #candidates do
			local payload = candidates[i]
			local n, a, s = string.match(payload, "^%((.-)%)%[(.-)%]%{(.*)%}$")
			if s ~= nil then
				local ok_unpack, parsed = pcall(msgpack.unpack, s)
				if ok_unpack and type(parsed) == "table" then
					return true
				end
			end
			local ok_raw, parsed_raw = pcall(msgpack.unpack, payload)
			if ok_raw and type(parsed_raw) == "table" then
				return true
			end
		end
		return false
	end

	if _validate_config_blob(configs.by_developer) then
		configs.default = configs.by_developer
	end
	configs.by_developer = nil

	local function _is_builtin_config(name)
		return name == BUILTIN_CONFIG_NAME or name == "Default"
	end

	local function _normalize_config_name(name)
		name = tostring(name or "")
		-- Strip color/format control escapes that may appear in list labels.
		name = name:gsub("\a%x%x%x%x%x%x%x%x", "")
		name = name:gsub("[\v\r]", "")
		name = name:gsub("^%s*[%p•]+%s*", "")
		name = name:gsub("%s+$", "")
		return name
	end

	local function _builtin_config_raw(name)
		name = _normalize_config_name(name)
		if name == BUILTIN_CONFIG_NAME or name == "Default" then return configs.default end
		return nil
	end

	-- Loadouts UI was moved to TAB_LOADOUTS.
	-- Keep backward compatibility if older builds still have menu.general.config.
	-- UI contexts:
	-- - loadouts_ctx: loadout management in TAB_LOADOUTS
	-- - new_ctx: create/import/name (also in TAB_LOADOUTS)
	local loadouts_ctx = (menu.loadouts and menu.loadouts.config) or menu.general.config
	local new_ctx = (menu.loadouts and menu.loadouts.config) or (menu.general and menu.general.config) or loadouts_ctx

	loadouts_ctx.save:depend(true, {loadouts_ctx.list, 0, true})
	-- cloud скрыт
	-- context.cloud_hdr_title:depend(true, {context.list, 0, true})
	-- context.cloud_hdr_line:depend(true, {context.list, 0, true})
	-- context.cloud_hint:depend(true, {context.list, 0, true})
	-- context.cloud_save:depend(true, {context.list, 0, true})
	-- context.cloud_nick_title:depend(true, {context.list, 0, true})
	-- context.cloud_nick_sub:depend(true, {context.list, 0, true})
	-- context.cloud_nick:depend(true, {context.list, 0, true})
	-- context.cloud_cname_title:depend(true, {context.list, 0, true})
	-- context.cloud_cname_sub:depend(true, {context.list, 0, true})
	-- context.cloud_cname:depend(true, {context.list, 0, true})
	-- context.cloud_load:depend(true, {context.list, 0, true})
	loadouts_ctx.export:depend(true, {loadouts_ctx.list, 0, true})
	loadouts_ctx.delete:depend({loadouts_ctx.list, 0, true})
	loadouts_ctx.deleteb:depend({loadouts_ctx.list, 0})
	loadouts_ctx.deleteb:depend(true, {loadouts_ctx.list, 0, true})

	--#region: actions

	local actions = {}
	local function _logs_event_enabled(name)
		local events = vars and vars.misc and vars.misc.logs and vars.misc.logs.events
		if not events or type(name) ~= "string" then return false end
		local ok, v = pcall(function() return events:get(name) end)
		if ok and v then return true end
		local localized = amnesia.t(name)
		if type(localized) == "string" and localized ~= name then
			ok, v = pcall(function() return events:get(localized) end)
			if ok and v then return true end
		end
		local title = name:gsub("(%a)([%w']*)", function(a, b)
			return string.upper(a) .. string.lower(b)
		end)
		if title ~= name then
			ok, v = pcall(function() return events:get(title) end)
			if ok and v then return true end
		end
		return false
	end

	actions.eval = function (raw, noparse)
		if not raw then return "\f" .. amnesia.t("Config not found.") end
		raw = tostring(raw)
		raw = raw:gsub("^%s+", ""):gsub("%s+$", "")
		-- New format: MAGIC::GS::<b64>
		local magic, cheat, contents =
			string.match(raw, "^(.-)::(%a+)::([%w%+%/%-_]+)$")

		-- Legacy support: old "amnesia::GS::..." exports.
		if not magic or magic == "" then
			magic, cheat, contents =
				string.match(raw, "^(amnesia)::(%a+)::([%w%+%/%-_]+)$")
		end

		if cheat ~= "GS" or magic ~= CFG_MAGIC and magic ~= "amnesia" then
			return "\f" .. amnesia.t("Not an amnesia config")
		end

		local decoded = nil
		local decode_path = "none"
		local candidates = {}
		local function try_decode(candidate)
			local ok, out = pcall(base64.decode, candidate)
			if ok and type(out) == "string" and out ~= "" then
				return out
			end
			return nil
		end
		local function push_candidate(tag, encoded)
			local d = try_decode(encoded)
			if d then
				candidates[#candidates + 1] = {tag = tag, data = d}
			end
		end
		local function parse_wrapper(payload)
			local n, a, s = string.match(payload, "^%((.-)%)%[(.-)%]%{(.*)%}$")
			if s ~= nil then
				return n, a, s
			end
			local lp = payload:find("%(", 1, true)
			local rp = lp and payload:find("%)", lp + 1, true) or nil
			local lb = rp and payload:find("%[", rp + 1, true) or nil
			local rb = lb and payload:find("%]", lb + 1, true) or nil
			local lc = rb and payload:find("%{", rb + 1, true) or nil
			local rc = (#payload > 0 and payload:sub(-1) == "}") and #payload or nil
			if lp == 1 and rp and lb and rb and lc and rc and rc > lc then
				return payload:sub(lp + 1, rp - 1), payload:sub(lb + 1, rb - 1), payload:sub(lc + 1, rc - 1)
			end
			return nil, nil, nil
		end

		-- 1) Historical export: z113Z/z143Z + trailing "_" padding.
		do
			local bare, pad = contents:match("^(.-)(_*)$")
			local c = (bare or contents):gsub("z113Z", "+"):gsub("z143Z", "/") .. string.rep("=", #(pad or ""))
			push_candidate("legacy-z113z", c)
		end

		-- 2) Standard base64 with "_" used only as trailing padding.
		do
			local bare, pad = contents:match("^(.-)(_*)$")
			local c = (bare or contents) .. string.rep("=", #(pad or ""))
			push_candidate("legacy-underscore-pad", c)
		end

		-- 3) URL-safe base64 (- and _ inside payload alphabet).
		do
			local c = contents:gsub("%-", "+"):gsub("_", "/")
			local rem = #c % 4
			if rem ~= 0 then
				c = c .. string.rep("=", 4 - rem)
			end
			push_candidate("urlsafe", c)
		end

		if #candidates == 0 then
			return "\f" .. amnesia.t("Config not found.")
		end
		local name, author, settings
		for i = 1, #candidates do
			local c = candidates[i]
			local n, a, s = parse_wrapper(c.data)
			if s ~= nil then
				decoded, decode_path = c.data, c.tag
				name, author, settings = n, a, s
				break
			end
		end
		if settings == nil then
			return name, author, {}
		end
		if noparse then
			return name, author, {}
		end
		local ok_unpack, parsed = pcall(msgpack.unpack, settings)
		if (not ok_unpack or type(parsed) ~= "table") and #candidates > 1 then
			for i = 1, #candidates do
				local c = candidates[i]
				if c.tag ~= decode_path then
					local n, a, s = parse_wrapper(c.data)
					if s ~= nil then
						local ok2, parsed2 = pcall(msgpack.unpack, s)
						if ok2 and type(parsed2) == "table" then
							decoded, decode_path = c.data, c.tag
							name, author, settings, parsed = n, a, s, parsed2
							ok_unpack = true
							break
						end
					end
				end
			end
		end
		-- Some exports may store plain msgpack table without "(name)[author]{...}" wrapper.
		if (not ok_unpack or type(parsed) ~= "table") then
			for i = 1, #candidates do
				local c = candidates[i]
				local ok_raw, parsed_raw = pcall(msgpack.unpack, c.data)
				if ok_raw and type(parsed_raw) == "table" then
					ok_unpack = true
					parsed = parsed_raw
					decode_path = c.tag .. ":raw-msgpack"
					name = name or BUILTIN_CONFIG_NAME
					author = author or "system"
					break
				end
			end
		end
		if not ok_unpack or type(parsed) ~= "table" then
			return "\f" .. amnesia.t("Config not found."), nil, {}
		end
		return name, author, parsed
	end

	actions.save = function (name, new)
		if _is_builtin_config(name) then return "\f" .. amnesia.t("Can't overwrite Default") end
		name = tostring(name)

		local o_name, o_author if new then
			o_name, o_author = actions.eval(db.configs[name], true)
		end

		local cfg = --[[ new and {} or ]] configs.system:save()
		local contents = string.format("(%s)[%s]{%s}", name, o_author or amnesia.user.name, msgpack.pack(cfg))
		local encoded = string.gsub(base64.encode(contents), "[%+%/%=]", { ["+"] = "z113Z", ["/"] = "z143Z", ["="] = "_" })

		-- Always save in MAGIC::GS::... format so other luas can't "steal" it by renaming.
		local ready = ("%s::GS::%s"):format(CFG_MAGIC, encoded)
		db.configs[name] = ready

		-- лог сохранения конфига (Eventlogger)
		if logger and logger.invent and vars.misc.logs.on.value and _logs_event_enabled("Config saves") then
			logger.invent("config", {
				{"Config saved: "},
				{true, name},
				{" by "},
				{true, o_author or amnesia.user.name},
			}, nil, { auth_ttl = 5, config_kind = "save" })
		end

		return "\a".. name .. amnesia.t(" saved")
	end

	actions.create = function (name)
		if name == "" then  return "\f" .. amnesia.t("Enter the name")
		elseif _is_builtin_config(name) then  return "\f" .. amnesia.t("Can't overwrite Default")
		elseif #name > 24 then  return "\f" .. amnesia.t("This name is too long")
		elseif db.configs[name] then  return "\f" .. name .. amnesia.t(" is in the list")  end

		local res = actions.save(name, true)
		local cfg = db.configs[name]
		if type(amnesia.cloud_try_save_code) == "function" and type(cfg) == "string" then
			pcall(amnesia.cloud_try_save_code, name, cfg)
		end
		return res
	end

	actions.delete = function (name)
		if _is_builtin_config(name) then return "\f" .. amnesia.t("Can't overwrite Default") end
		-- Local delete: keep cloud copy intact so dashboard history is preserved.
		db.configs[name] = nil
	end

	actions.export = function (name)
		if not name or name == "" then return "\f" .. amnesia.t("Not selected") end
		if _is_builtin_config(name) then return "\f" .. amnesia.t("Can't overwrite Default") end

		clipboard.set(db.configs[name])
		return "\a" .. amnesia.t("Copied to clipboard.")
	end

	actions.import = function ()
		local copied = clipboard.get()
		if not copied then return "\f" .. amnesia.t("Empty clipboard") end

		local name, author, settings = actions.eval(copied, true)
		if not author then return name end


		-- Accept only amnesia-tagged configs; allow old exports as legacy once.
		local cfg = copied:match("^" .. CFG_MAGIC .. "::%a+::[%w%+%/]+_*")
			or copied:match("^amnesia::%a+::[%w%+%/]+_*")
		if _is_builtin_config(name) then return "\f" .. amnesia.t("Can't import default config") end
		db.configs[name] = cfg
		return "\a".. name .. amnesia.t(" by ") .. author .. amnesia.t(" added")
	end

	actions.load = function (name, ...)
		if not name or name == "" then return amnesia.t("ERR: can't load: not selected") end
		local normalized_name = _normalize_config_name(name)
		local cfg = _builtin_config_raw(normalized_name) or db.configs[normalized_name] or db.configs[name]

		local cname, cauthor, settings = actions.eval(cfg)
		if not cauthor then return cname end

		if ({...})[1] == "antiaim" then
			settings.antiaim.general.manual = nil
		end

		configs.system:load(settings, ...)
		if ... then return end
		configs.loaded = normalized_name
		if logger and vars.misc.logs.on.value and _logs_event_enabled("Config loads") then
			logger.invent("config", {
				{ amnesia.t("Loaded config "), { cname }, amnesia.t(" · "), { cauthor } },
			}, nil, { config_kind = "load" })
		end
	end

	--#endregion

	local report do
		loadouts_ctx.list_report:depend({loadouts_ctx.list_report, 0})

		local reportend, active = 0, false
		local function wait ()
			if reportend < globals.realtime() then
				loadouts_ctx.list_report:set_visible(false)
				loadouts_ctx.selected:set_visible(true)

				callbacks.paint_ui:unset(wait)
				active = false
			end
		end

		report = function (code)
			if not code then return end
			reportend = globals.realtime() + 1

			local text = code:gsub("[\f\a]", {
				["\f"] = "\aFF4040FF",
				["\a"] = "\aB6DE47FF",
			})
			loadouts_ctx.list_report:set(text)
			if not active then
				loadouts_ctx.list_report:set_visible(true)
				loadouts_ctx.selected:set_visible(false)

				callbacks.paint_ui:set(wait)
				active = true
			end
		end
	end

	amnesia.config_report = report

	local update = function (no_reval)
		if no_reval ~= true then
			configs.list = {}
			for k in next, db.configs do configs.list[#configs.list+1] = k end

			table.sort(configs.list)
			table.insert(configs.list, 1, BUILTIN_CONFIG_NAME)

			local loaded = table.ifind(configs.list, configs.loaded)
			if loaded then  configs.list[loaded] = configs.badge .. configs.list[loaded]
			else  configs.loaded = 0  end

			loadouts_ctx.list:update(configs.list)
		end

		local list_value = tonumber(loadouts_ctx.list.value) or 0
		local max_index = math.max(1, #configs.list)
		configs.selected = math.clamp(list_value + 1, 1, max_index)

		local selected_name = configs.list[configs.selected] or BUILTIN_CONFIG_NAME
		configs.name = selected_name:gsub("^\a%x%x%x%x%x%x%x%x•\a%x%x%x%x%x%x%x%x ", "")

		loadouts_ctx.selected:set(pui.format(amnesia.t("Selected: \v")) .. configs.name)
		loadouts_ctx.list:set(configs.selected - 1)
		amnesia.config_selected_name = configs.name
	end

	local act = function (action, ...)
		local success, result, code, obj = pcall(actions[action], ...)

		debug(action, ": ", success, ", ", result, ", ", code, ", ", obj)
		report(code or result)
		update()
	end

	amnesia.config_act = act

	update()

	-- Cloud -> Lua live sync (dashboard-added configs appear without reload)
	do
		local inflight = {}
		-- Track names that were added from cloud so we can remove them on delete.
		db._cloud_synced_configs = type(db._cloud_synced_configs) == "table" and db._cloud_synced_configs or {}
		-- Track names that belong to user's cloud (created/saved).
		db._cloud_owned_configs = type(db._cloud_owned_configs) == "table" and db._cloud_owned_configs or {}
		local next_poll = 0
		local poll_interval = 12.0 -- seconds; server rate limit is 30/min

		local function add_cfg_if_missing(code)
			if type(code) ~= "string" then return false end
			local name, author = actions.eval(code, true)
			if not author or type(name) ~= "string" or name == "" or name == "Default" or name == BUILTIN_CONFIG_NAME then return false end
			if db.configs[name] then return false end
			local cfg = code:match("^amnesia::%a+::[%w%+%/]+_*")
			if not cfg then
				cfg = code:match("^" .. CFG_MAGIC .. "::%a+::[%w%+%/]+_*")
			end
			if not cfg then return false end
			db.configs[name] = cfg
			db._cloud_synced_configs[name] = true
			update()
			return true
		end

		amnesia.cloud_sync_configs = function(force)
			if not amnesia.steamid64 or type(amnesia.steamid64) ~= "string" then return end
			local now = globals.realtime()
			if not force and now < next_poll then return end
			next_poll = now + poll_interval

			if type(amnesia.cloud_list_my) ~= "function" or type(amnesia.cloud_fetch_my_code) ~= "function" then
				return
			end

			amnesia.cloud_list_my(function(list)
				if type(list) ~= "table" then return end
				local present = {}
				for i = 1, #list do
					local item = list[i]
					local cname = item and item.name
					if type(cname) ~= "string" or cname == "" or cname == "Default" or cname == BUILTIN_CONFIG_NAME then goto cont end
					present[cname] = true
					if db.configs[cname] then goto cont end
					if inflight[cname] then goto cont end

					inflight[cname] = true
					amnesia.cloud_fetch_my_code(cname, function(code)
						inflight[cname] = nil
						add_cfg_if_missing(code)
					end)

					::cont::
				end

				-- Remove configs that were synced from cloud but no longer exist in cloud list.
				local removed_any = false
				local function maybe_remove(name)
					if db.configs[name] ~= nil and configs.loaded ~= name then
						db.configs[name] = nil
						removed_any = true
					end
				end
				for name in pairs(db._cloud_synced_configs) do
					if not present[name] then
						db._cloud_synced_configs[name] = nil
						maybe_remove(name)
					end
				end
				for name in pairs(db._cloud_owned_configs) do
					if not present[name] then
						db._cloud_owned_configs[name] = nil
						maybe_remove(name)
					end
				end
				if removed_any then
					update()
				end
			end)
		end

		-- poll in UI loop (safe + no extra callbacks)
		local function _cloud_poll()
			amnesia.cloud_sync_configs(false)
		end
		callbacks.paint_ui:set(_cloud_poll)
		-- force first sync immediately
		amnesia.cloud_sync_configs(true)
	end

	loadouts_ctx.list:set_callback(function ()
		update(true)
		-- Sync checkbox with database
		loadouts_ctx.auto_load:set(db.auto_load_enabled and db.auto_load_config == configs.name)
	end)
	
	-- Auto load config checkbox callback
	loadouts_ctx.auto_load:set_callback(function (this)
		if this.value then
			-- Set this config as auto-load
			db.auto_load_config = configs.name
			db.auto_load_enabled = true
			database.write(db.key, db)
			if logger and logger.invent then
				logger.invent("config", {
					{"Auto-load: "},
					{true, configs.name},
					{" on script start"},
				}, nil, {
					auth_ttl = 6
				})
			else
				amnesia.print("\a50FF50\a707070 Auto-load: " .. configs.name .. " on script start")
			end
		else
			-- Disable auto-load
			db.auto_load_config = ""
			db.auto_load_enabled = false
			database.write(db.key, db)
			if logger and logger.invent then
				logger.invent("config", {
					{"Auto-load disabled"},
				}, nil, {
					auth_ttl = 6
				})
			else
				amnesia.print("\aFF6464\a707070 Auto-load disabled")
			end
		end
	end)
	-- New loadout actions (Profile tab)
	if new_ctx and new_ctx.create and new_ctx.import and new_ctx.name then
		new_ctx.create:set_callback(function ()  act("create", new_ctx.name:get())  end)
		new_ctx.import:set_callback(function ()  act("import", new_ctx.name:get())  end)
	end

	-- Loadout list actions (Loadouts tab)
	if loadouts_ctx and loadouts_ctx.load then
		loadouts_ctx.load:set_callback(function ()  act("load", configs.name)  end)
	end
	if loadouts_ctx and loadouts_ctx.loadaa then
		loadouts_ctx.loadaa:set_callback(function ()  act("load", configs.name, "antiaim")  end)
	end
	if loadouts_ctx and loadouts_ctx.save then
		loadouts_ctx.save:set_callback(function ()  act("save", configs.name)  end)
	end
	if loadouts_ctx and loadouts_ctx.delete then
		loadouts_ctx.delete:set_callback(function ()  act("delete", configs.name)  end)
	end
	if loadouts_ctx and loadouts_ctx.export then
		loadouts_ctx.export:set_callback(function ()  act("export", configs.name)  end)
	end
end

-- #endregion
--


-- #endregion ------------------------------------------------------------------
--








----<  Features  >--------------------------------------------------------------

--------------------------------------------------------------------------------
-- #region :: Anti-aim


--
-- #region : Definitions

antiaim.my = {
	switch = false, side = 0,
	state = "default",
}

antiaim.refs = {
	pitch = refs.aa.angles.pitch[2],
	base = refs.aa.angles.base,
	offset = refs.aa.angles.yaw[2],
	body = refs.aa.angles.body[2],
	pitch_mode = refs.aa.angles.pitch[1],
	yaw = refs.aa.angles.yaw[1],
	jitter = refs.aa.angles.jitter[1],
	jitter_deg = refs.aa.angles.jitter[2],
	body_yaw = refs.aa.angles.body[1],
}

antiaim.data, antiaim.latest = {
	way = 1, lifetime = 0, using = false,
	manual = nil,
}, {}

-- #endregion
--

--
-- #region : System

-- #region - Features

antiaim.features = {
	manual = {
		current = nil,
		buttons = {
			{ "left", yaw = -90, item = vars.antiaim.general.manual.left },
			{ "right", yaw = 90, item = vars.antiaim.general.manual.right },
			{ "reset", yaw = nil, item = vars.antiaim.general.manual.reset },
			-- { "edge", yaw = 0, item = vars.antiaim.general.manual.edge },
			-- { "fs", yaw = 0, item = vars.antiaim.general.manual.fs },
		},
		work = function (self)
			local m = vars.antiaim.general.manual
			local peek_active = refs.rage.other.peek.value and refs.rage.other.peek.hotkey:get()
			local force_fs = m.force_fs_peek and m.force_fs_peek.value and peek_active

			if not m.on.value then
				local is_edge = m.edge:get()
				if force_fs then
					refs.aa.angles.edge:override(is_edge)
					refs.aa.angles.freestand:override(not is_edge)
				else
					refs.aa.angles.edge:override()
					refs.aa.angles.freestand:override()
				end
				return
			end

			for i, v in ipairs(self.buttons) do
				local active, mode = v.item:get()

				if v.active == nil then v.active = active end
				if v.active == active then goto done end

				v.active = active

				if v.yaw == nil then self.current = nil end

				if mode == 1 then self.current = active and i or nil goto done
				elseif mode == 2 then self.current = self.current ~= i and i or nil goto done end

				::done::
			end

			local result = self.current ~= nil and self.buttons[self.current].yaw or nil
			antiaim.data.manual = result

			local is_fs = m.fs:get() or force_fs
			local is_edge = m.edge:get()

			refs.aa.angles.edge:override(is_edge)
			refs.aa.angles.freestand:override(is_fs and not is_edge and not result)

			return type(result) == "number" and result or nil
		end
	},
	stab = {
		work = function (self)
			antiaim.data.backstab = false
			if vars.antiaim.general.stab.value and my.threat and my.entity then
				local threat_hitbox = entity.hitbox_position(my.threat, 3)
				if not threat_hitbox then return end

				local distance = my.origin:dist( vector(entity.get_prop(my.threat, "m_vecOrigin")) )
				local weapon_t = weapondata(entity.get_player_weapon(my.threat))

				if distance < 256 and (weapon_t and weapon_t.type == "knife") then antiaim.data.backstab = true return {180, -89} end
			end
		end
	},
	on_use = {
		defuse = false,
		overridden = false,
		next = 0,
		work = function (self, cmd)
			if not vars.antiaim.general.use.value or not my.weapon then return end
			local using = cmd.in_use == 1

			local in_bombzone, is_ct = entity.get_prop(my.entity, "m_bInBombZone") == 1, entity.get_prop(my.entity, "m_iTeamNum") == 3

			if in_bombzone or is_ct then
				local bombs = entity.get_all("CPlantedC4")
				if #bombs > 0 then
					local c4 = bombs[#bombs]

					local c4_origin = vector(entity.get_prop(c4, "m_vecOrigin"))
					local dist = my.origin:dist(c4_origin)

					if dist < 61 then self.defuse = true end
				end
			end

			if entity.get_prop(my.entity, "m_bIsDefusing") == 1 or entity.get_prop(my.entity, "m_bIsGrabbingHostage") == 1 then
				self.defuse = true
			end
			local block = self.defuse or (entity.get_prop(my.weapon, "m_iItemDefinitionIndex") == 49 and in_bombzone)

			if using then
				if not self.overridden then
					self.next, self.overridden = globals.tickcount() + 1, true
				end

				if globals.tickcount() >= self.next and not block then
					cmd.in_use = 0
				end
			else
				self.overridden, self.defuse = false, false
			end

			local cam_y = client.camera_angles()
			return (not block and using) and {180, cam_y} or nil
		end
	},
	snap = {
		dechoke = false,
		ticks_to_time = function ()
			return globals.tickinterval() * 16
		end,
		will_peek = function (self)
			if not my.valid or not my.entity then return false end
			local enemies = entity.get_players(true)
			if not enemies or #enemies == 0 then return false end

			local ex, ey, ez = client.eye_position()
			local lvx, lvy, lvz = entity.get_prop(my.entity, "m_vecVelocity")
			lvx, lvy, lvz = lvx or 0, lvy or 0, lvz or 0
			local dt = self.ticks_to_time()
			local px, py, pz = ex + lvx * dt, ey + lvy * dt, ez + lvz * dt

			for i = 1, #enemies do
				local enemy = enemies[i]
				if enemy and entity.is_alive(enemy) and not entity.is_dormant(enemy) then
					local hx, hy, hz = entity.hitbox_position(enemy, 0)
					if hx and hy and hz then
						local evx, evy, evz = entity.get_prop(enemy, "m_vecVelocity")
						evx, evy, evz = evx or 0, evy or 0, evz or 0
						local thx, thy, thz = hx + evx * dt, hy + evy * dt, hz + evz * dt
						local _, dmg = client.trace_bullet(my.entity, px, py, pz, thx, thy, thz, true)
						if (dmg or 0) > 0 then
							return true
						end
					end
				end
			end
			return false
		end,
		check = function (self, cmd, settings, props)
			if props and props.on == "Default" then
				props = antiaim.data.scenery.default.snap
			end

			local named = antiaim.data.named_preset or "Custom"
			local in_air = not my.on_ground
			-- Defensive+ в воздухе: не резать snap из‑за DT (иначе почти нет defensive в прыжке).
			local block_dt_snap = adata.get_double_tap() and not (named == "Defensive+" and in_air)

			if not (settings.on.value and settings.on.hotkey:get()) or props.on == "Off" or antiaim.data.useaa or antiaim.data.backstab or block_dt_snap then return false end
			local should_defend = my.exploit.defensive or my.exploit.lagpeek or self:will_peek()
			if named == "Defensive+" and in_air and my.exploit.active then
				should_defend = true
			end
			if not my.exploit.active or not should_defend or (my.exploit.active == 1 and not settings.os.value) then return false end


			return true, props
		end,
		yaw = {
			["None"] = function () return 0, true end,
			["Switch"] = function (props)
				return .5 * (antiaim.my.switch and props.yaw_min or -props.yaw_min)
			end,
			["Static"] = function (props)
				return props.yaw_min
			end,
			["Random"] = function (props)
				return .5 * math.random(-props.yaw_min, props.yaw_min)
			end,
			["Spin"] = function (props)
				return .5 * math.lerp(-props.yaw_min, props.yaw_min, globals.curtime() * 3 % 2 - 1)
			end,
			["азазой"] = function (props)
				return .5 * math.lerp(-props.yaw_min, props.yaw_min, math.sin(globals.curtime() * 3 % 1))
			end,
		},
		pitch = {
			["None"] = function () return 89 end,
			["Switch"] = function (props)
				return antiaim.data.lifetime % 2 == 0 and props.pitch_max or props.pitch_min
			end,
			["Random"] = function (props)
				return math.random(props.pitch_min, props.pitch_max)
			end,
			["Spin"] = function (props)
				return math.lerp(props.pitch_min, props.pitch_max, globals.curtime() * 6 % 2 - 1)
			end,
		},
		work = function (self, cmd, ctx)
			local settings, props = vars.antiaim.exploits.snap or {}, nil
			antiaim.latest.snapping, props = self:check(cmd, settings, antiaim.data.preset.snap)

			if not antiaim.latest.snapping then return end

			--
			local yaw, dmf = self.yaw[props.yaw](props)
			local pitch = self.pitch[props.pitch](props)

			antiaim.latest.force_send = true
			ctx.offset = math.normalize_yaw(yaw + (dmf and ctx.offset or 0))
			ctx.pitch = math.normalize_pitch(pitch)
			if not dmf then
				-- ctx.body = 0
			end
			-- cmd.yaw = math.normalize_yaw(yaw + (dmf and ctx.offset or 0))
			-- cmd.pitch = math.normalize_pitch(pitch)
		end
	},
	restrict = {
		ventured = 1,
		modes = {
			[15] = function ()
				return antiaim.data.lifetime % client.random_int(1, 4) == 0
			end,
			[16] = function ()
				return antiaim.data.lifetime % client.random_int(2, 6) == 0
			end,
			[17] = function ()
				return antiaim.data.lifetime % antiaim.features.restrict.ventured == 0
			end,
		},
		work = a(function (self, cmd, scene)
			if scene.adv.delay == 1 or not my.exploit.active then return true end

			if self.modes[scene.adv.delay] then
				return self.modes[scene.adv.delay]()
			else
				return antiaim.data.lifetime % scene.adv.delay == 0
			end
		end)
	},
	fakelag = {
		overridden = false,
		work = a(function (self, cmd)
			local rctx, hctx = refs.aa.fakelag, vars.antiaim.lag.fakelag

			if antiaim.features.snap.dechoke then
				self.overridden = true
				rctx.enable:override(false)
				cmd.no_choke = true
				antiaim.latest.force_send = true
				antiaim.features.snap.dechoke = false
				debug "dechoke"
			return end

			if hctx.on.value then self.overridden = true end

			if not self.overridden then return end

			if hctx.on.value then
				rctx.enable:override(true)
				rctx.amount:override(hctx.mode.value)
				rctx.limit:override(hctx.limit.value)
			else
				rctx.enable:override()
				rctx.amount:override()
				rctx.limit:override()
				self.overridden = false
			end
		end)
	},
	head = {
		work = a(function (self, ctx)
			if antiaim.data.manual or antiaim.data.useaa or not my.threat or entity.is_dormant(my.threat) then return end

			--
			local weapon_t = weapondata(my.weapon)
			local threat_origin = vector(entity.get_origin(my.threat))
			local distance = my.origin:dist(threat_origin)
			local height_diff = my.origin.z - threat_origin.z

			local ex, ey, ez = client.eye_position()
			local trace_fr, trace_ent = client.trace_line(my.entity, ex, ey, ez, threat_origin.x, threat_origin.y, threat_origin.z + 56)
			local is_visible = trace_ent == my.threat
			local is_melee = weapon_t and weapon_t.weapon_type_int == 0

			--
			local triggers = vars.antiaim.general.head
			if (triggers:get "Air melee" and my.jumping and is_melee and height_diff > -32)
			or (triggers:get "Height difference" and height_diff > 64 and (is_visible or distance < 1024)) then
				ctx.offset, ctx.body, ctx.pitch = 20, 1, 89
			end
		end)
	},
	vulnlc = {
		check = a(function (self, cmd)
			if not my.exploit.active then return end

			local settings = vars.rage.vulnlc
			if not (#settings.value > 0 and my.weapon ~= nil) then return false end

			if settings:get("Can't shoot") then
				local next_attack = entity.get_prop(my.entity, "m_flNextAttack") or 0
				local next_shot = entity.get_prop(my.weapon, "m_flNextPrimaryAttack") or 0
				local simtime = entity.get_prop(my.entity, "m_flSimulationTime")

				local attack_diff, shot_diff = toticks(next_attack - simtime - 1), toticks(next_shot - simtime - 1)

				local weapon_t = weapondata(my.weapon)
				local condition = (weapon_t and weapon_t.weapon_type_int ~= 9) and (cmd.quick_stop or attack_diff > 0 or shot_diff > 0)

				if condition then return true end
			end

			local state_perm =
			(my.jumping and settings:get("Jumping")) or
			((my.crouching and my.on_ground) and settings:get("Crouching"))
			-- (my.walking and settings:get("Walking"))

			if not state_perm then return false end

			return true
		end),
		work = a(function (self, cmd)
			if self:check(cmd) then
				cmd.force_defensive = true
			end
		end)
	},
	rubber = {
		work = function ()

		end
	}
}

-- #endregion

-- #region - Venture

antiaim.venture = {
	latest = 0, damaged = 0,
	trigger = function (event)
		if not my.valid or antiaim.venture.latest == globals.tickcount() then return end

		local attacker = client.userid_to_entindex(event.userid)
		if not attacker or not entity.is_enemy(attacker) or entity.is_dormant(attacker) then return end

		--
		local impact = vector(event.x, event.y, event.z)
		local enemy_view = vector(entity.get_origin(attacker))
		enemy_view.z = enemy_view.z + 64

		local dists = {}
		for i = 1, #players do
			local v = players[i]

			if not entity.is_enemy(v) then
				local head = vector(entity.hitbox_position(v, 0))
				local point = math.closest_ray_point(head, enemy_view, impact)
				dists[#dists+1] = head:dist(point)
				if v == my.entity then dists.mine = dists[#dists] end
			end
		end

		local closest = math.min( unpack(dists) )

		--
		if (dists.mine and closest) and dists.mine < 40 or (closest == dists.mine and dists.mine < 128) then
			client.delay_call(totime(1), function ()
				client.fire_event("amnesia::enemy_shot", {
					damaged = antiaim.venture.latest == antiaim.venture.damaged,
					dist = dists.mine,
					attacker = attacker,
					userid = event.userid
				})
			end)

			antiaim.venture.latest = globals.tickcount()
			antiaim.features.restrict.ventured = math.random(1, 4)
		end
	end,
	run = function (self)
		callbacks.bullet_impact:set(self.trigger)
		callbacks.player_hurt:set(function (event)
			if client.userid_to_entindex(event.userid) == my.entity then self.damaged = globals.tickcount() end
		end)
	end
}

antiaim.venture:run()

-- #endregion

-- #region - Builder

antiaim.builder = {
	apply_named_preset = function (self, scene, preset_name)
		if preset_name == "Custom" then
			return
		end
		local st = antiaim.my.state or "default"
		local by_state_offset = {
			default = 0, stand = 0, run = 0, walk = 0,
			air = 3, airduck = 3, crouch = 2, sneak = 0,
		}
		local is_jitter_plus = preset_name == "Jitter+"
		local is_defensive_plus = preset_name == "Defensive+"
		local offset = by_state_offset[st] or 0

		-- Defensive+: per-state tuning mapped from reference lua (yaw add / sway / random + center jitter + fake limits).
		if is_defensive_plus then
			local D = {
				-- «дефенсив»: Yaw add -5/+3, jitter 15, opposite, fake static 58
				default = {
					off = 0, mt = "Jitter", range = false, add = true, deg = 15, mn = -20, mx = 20, al = -5, ar = 3,
					bon = true, bjit = true, bm = "Auto", bd = 58, bl = 0, br = 0,
					ir = 8, dt = 2,
				},
				-- «стенд»: Yaw add -8/+14, jitter 24, body jitter 0, fake sway 12–28 (side limits)
				stand = {
					off = 0, mt = "Jitter", range = false, add = true, deg = 24, mn = -20, mx = 20, al = -8, ar = 14,
					bon = true, bjit = true, bm = "Side-based", bd = 0, bl = 12, br = 28,
					ir = 10, dt = 2,
				},
				-- «бег»: Yaw add ±22, jitter 52, body static 0, fake static 58
				run = {
					off = 0, mt = "Jitter", range = false, add = true, deg = 52, mn = -58, mx = 58, al = -22, ar = 22,
					bon = true, bjit = false, bm = "Default", bd = 58, bl = 0, br = 0,
					ir = 12, dt = 2,
				},
				-- Воздух: широкий jitter + add (стабильнее для хитаев), body Auto; snap отдельно усилен ниже.
				air = {
					off = 0, mt = "Jitter", range = false, add = true, deg = 38, mn = -38, mx = 38, al = -16, ar = 22,
					bon = true, bjit = true, bm = "Auto", bd = 70, bl = 0, br = 0,
					ir = 12, dt = 2,
				},
				airduck = {
					off = 0, mt = "Jitter", range = false, add = true, deg = 36, mn = -36, mx = 36, al = -14, ar = 20,
					bon = true, bjit = true, bm = "Auto", bd = 68, bl = 0, br = 0,
					ir = 11, dt = 2,
				},
				-- «крауч»: Random -28..25, jitter layer → irreg 27; fake sway 5–44, speed mapped as delay 2
				crouch = {
					off = 0, mt = "Random", range = true, add = false, deg = 27, mn = -28, mx = 25, al = 0, ar = 0,
					bon = true, bjit = true, bm = "Side-based", bd = 0, bl = 5, br = 44,
					ir = 27, dt = 2,
				},
				-- no separate ref: between stand and run
				walk = {
					off = 0, mt = "Jitter", range = false, add = true, deg = 20, mn = -18, mx = 18, al = -7, ar = 10,
					bon = true, bjit = true, bm = "Side-based", bd = 0, bl = 10, br = 24,
					ir = 9, dt = 2,
				},
				sneak = {
					off = 0, mt = "Random", range = true, add = false, deg = 20, mn = -22, mx = 20, al = 0, ar = 0,
					bon = true, bjit = true, bm = "Side-based", bd = 0, bl = 4, br = 38,
					ir = 20, dt = 2,
				},
			}
			local r = D[st] or D.default
			scene.yaw.offset = r.off
			scene.mod.type = r.mt
			scene.mod.range = r.range
			scene.mod.add = r.add
			scene.mod.degree = r.deg
			scene.mod.min = r.mn
			scene.mod.max = r.mx
			scene.mod.left = r.al
			scene.mod.right = r.ar
			scene.body.on = r.bon
			scene.body.jitter = r.bjit
			scene.body.mode = r.bm
			scene.body.degree = r.bd
			scene.body.left = r.bl
			scene.body.right = r.br
			scene.body.relative = false
			scene.adv.irreg = r.ir
			scene.adv.delay = r.dt
			scene.snap.on = "Custom"
			if st == "air" or st == "airduck" then
				-- Defensive snap в воздухе: Switch + широкий yaw / pitch — сильнее ломает префикс без «ротейта» на yaw.
				scene.snap.yaw = "Switch"
				scene.snap.yaw_min = 260
				scene.snap.pitch = "Switch"
				scene.snap.pitch_min = -42
				scene.snap.pitch_max = 78
			else
				scene.snap.pitch = "None"
				scene.snap.pitch_min = -89
				scene.snap.pitch_max = -89
				scene.snap.yaw = "Random"
				scene.snap.yaw_min = 180
			end
			return
		end

		scene.yaw.offset = preset_name == "Aggressive" and 0 or offset
		scene.mod.type = "Jitter"
		scene.mod.range = (preset_name == "Aggressive") and true or (is_jitter_plus and false or true)
		scene.mod.add = false
		scene.mod.degree = is_jitter_plus and 32 or 58
		scene.mod.min = is_jitter_plus and -30 or -58
		scene.mod.max = is_jitter_plus and 35 or 58
		scene.mod.left = 0
		scene.mod.right = 0

		scene.body.on = true
		scene.body.jitter = true
		scene.body.mode = (preset_name == "Aggressive") and "Default" or "Auto"
		scene.body.degree = (preset_name == "Aggressive") and 110 or 90
		scene.body.relative = false

		scene.adv.irreg = is_jitter_plus and 6 or 22
		scene.adv.delay = (preset_name == "Aggressive") and 15 or 3

		scene.snap.on = "Custom"
		scene.snap.pitch = "Switch"
		scene.snap.pitch_min = -89
		scene.snap.pitch_max = 0
		scene.snap.yaw = "Switch"
		scene.snap.yaw_min = is_jitter_plus and 240 or 180
	end,
	yaw = function (self, cmd, scene)
		local use = antiaim.data.useaa					if use then return use[1], use[2], "Local view", {} end
		local stab = antiaim.features.stab:work()		if stab then return stab[1], stab[2], nil, {} end
		local manual = antiaim.features.manual:work()	if manual then return manual, nil, "Local view", {s = true} end

		return scene.yaw.offset, 89, nil, {}
	end,
	modifier = function (self, scene)
		if antiaim.data.static then return 0 end
		local side, value = 1, 0

		--
		local modifier, degree, range, eachway = scene.mod.type, scene.mod.degree, scene.mod.range, scene.ways.manual
		local random = client.random_int(-scene.adv.irreg * 0.5, scene.adv.irreg * 0.5)

		local min, max = (range and scene.mod.min or -degree), (range and scene.mod.max or degree)
		local addition = scene.mod.add and ((antiaim.my.side == 1 and scene.mod.right) or (antiaim.my.side == -1 and scene.mod.left)) or 0

		--
		if 	   modifier == "Jitter" then	value = (antiaim.my.switch and min or max) * side
		elseif modifier == "Random" then	value = math.random(min, max)
		elseif modifier == "Rotate" then	value = math.lerp(max, min, (globals.tickcount() * side) % 5 / 5)
		elseif modifier == "пердельта" then
			value = math.lerp(max, min, math.sin(globals.curtime() * 5 % 1))
		elseif modifier == "X-way" then
			-- if antiaim.my.side ~= 0 and not scene.mod.ws and scene.body.jitter and (antiaim.data.way % 2 == 0) ~= (antiaim.my.side == 1) then
			-- 	antiaim.data.way = antiaim.data.way - 1
			-- end

			antiaim.data.way = antiaim.data.way < (scene.ways.total - 1) and (antiaim.data.way + 1) or 0

			if eachway then
				value = scene.way[antiaim.data.way+1]
			else
				local step = (antiaim.data.way) / (scene.ways.total - 1)
				value = math.lerp(min, max, step)
			end
		end


		--
		return value + addition + random
	end,
	body = function (self, scene, modifier)
		if not scene.body.on then return end
		if vars.antiaim.general.warmup.value and entity.get_prop(my.game_rules, "m_bWarmupPeriod") == 1 then return end

		local side, left, right = 0, 0, 0
		local should_relate = scene.mod.type == "X-way" and scene.body.relative
		-- local desync = math.normalize_yaw(adata.get_abs_yaw() - adata.get_body_yaw(1))

		if scene.body.mode == "Default" then
			left, right = scene.body.degree, scene.body.degree
		elseif scene.body.mode == "Side-based" then
			left, right = scene.body.left, scene.body.right
		elseif scene.body.mode == "Auto" then
			if should_relate then
				left, right = 0, 0
				goto processed
			end
			local overlap = adata.get_overlap(true)

			local cur, old = entity.get_simtime(my.entity)
			local fl = (cur and old) and toticks(cur - old) - 1 or 1

			local max = overlap * (fl < 2 and 30 or 60)

			left, right = modifier * math.gratio - max, modifier * math.gratio + max
		end

		::processed::

		--
		if should_relate then
			side = math.clamp(modifier, -1, 1)
		else
			side = ternary(scene.body.jitter, antiaim.my.switch, vars.antiaim.general.inverter:get()) and 1 or -1
		end

		if antiaim.data.static then side = 1 end

		--
		local result = (side == 0 and 0) or (side > 0 and left) or (side < 0 and right)
		antiaim.my.side = (result == 0 and (antiaim.my.switch and 1 or -1)) or (result > 0 and 1) or (result < 0 and -1)

		return result
	end,
	work = function (self, cmd, scene, ctx)
		local yaw, pitch, base, flags = self:yaw(cmd, scene)
		antiaim.data.static = flags.s and vars.antiaim.general.manual.st.value
		local modifier = self:modifier(scene)
		local body = self:body(scene, modifier)

		--
		ctx.pitch_mode = "Custom"
		ctx.pitch = pitch or 89

		ctx.base = base or ctx.base
		ctx.offset = math.normalize_yaw(yaw + modifier)

		ctx.body_yaw = body and "Static" or "Off"
		if body then
			ctx.body = math.clamp(body, -180, 180)
		end
	end
}

-- #endregion

-- #endregion
--

--
-- #region : Setup

-- #region - Main

antiaim.arrange = a(function ()
	local state = my.state
	local preset

	local is_custom = true
	local selected_preset = (vars.antiaim.builder and vars.antiaim.builder.preset and vars.antiaim.builder.preset.value) or "Custom"
	if type(selected_preset) ~= "string" then
		local idx = tonumber(selected_preset) or 1
		local names = {"Custom", "Aggressive", "Jitter+", "Defensive+"}
		selected_preset = names[idx] or "Custom"
	end

	if is_custom then
		preset = antiaim.presets.custom
	end

	state = preset[ antiaim.states[ state ][1] ].override and state or enums.states.default

	if (my.crouching and my.on_ground and my.velocity > 5) and preset.sneak.override then
		state = enums.states.sneak
	elseif (my.jumping and my.crouching) and preset.airduck.override then
		state = enums.states.airduck
	end


	antiaim.my.state = antiaim.states[ state ][1]
	antiaim.data.scenery = preset
	antiaim.data.preset = preset[antiaim.my.state]
	antiaim.data.named_preset = selected_preset

	if is_custom and not pui.menu_open then
		local selected = vars.antiaim.builder.state.value
		local current = antiaim.states[state][2]
		if selected ~= current then
			-- vars.antiaim.builder.state:set(current)
		end
	end

	local ctx = {
		pitch = -89,
		base = vars.antiaim.general.yaw.value,
		pitch_mode = nil,
		yaw = "180",
		offset = nil,
		jitter = "Off",
		jitter_deg = nil,
		body_yaw = nil,
		body = nil,
	}

	return antiaim.data.preset, ctx
end)

antiaim.dispatch = a(function (data)
	for k, v in next, antiaim.refs do
		v:override(data[k])
	end
end)

antiaim.manage = a(function (cmd)
	table.clear(antiaim.latest)
	local scene, ctx = antiaim.arrange()
	local named_preset = antiaim.data.named_preset or "Custom"

	--
	antiaim.builder:apply_named_preset(scene, named_preset)
	antiaim.builder:work(cmd, scene, ctx)
	if named_preset == "Jitter+" or named_preset == "Defensive+" then
		vars.antiaim.exploits.snap.on:override(true)
	else
		vars.antiaim.exploits.snap.on:override()
	end

	--
	antiaim.data.useaa = antiaim.features.on_use:work(cmd)
	antiaim.features.vulnlc:work(cmd)
	antiaim.features.fakelag:work(cmd)
	if not (antiaim.data.manual or antiaim.data.useaa) then
		antiaim.features.snap:work(cmd, ctx)
		antiaim.features.head:work(ctx)
	end

	--
	if cmd.chokedcommands == 0 or antiaim.latest.force_send then
		antiaim.dispatch(ctx)
		if cmd.chokedcommands == 0 then
			antiaim.data.lifetime = antiaim.data.lifetime + 1
			if antiaim.features.restrict:work(cmd, scene) then
				antiaim.my.switch = not antiaim.my.switch
			end
		end
	end

	--
	antiaim.data.defensive = cmd.force_defensive
end)

-- #endregion

-- #region - Finish

antiaim.run = a(function ()
	local dechoke = function ()
		local fd, dt, os = refs.rage.other.duck:get(), refs.rage.aimbot.double_tap[1].value and refs.rage.aimbot.double_tap[1].hotkey:get(), refs.aa.other.onshot.value and refs.aa.other.onshot.hotkey:get()
		if antiaim.latest.snapping and (fd or not (dt or os)) and not antiaim.features.snap.dechoke then
			antiaim.features.snap.dechoke = true
			refs.aa.fakelag.enable:override(false)
		end
	end

	vars.antiaim.global:set_callback(function (this)
		callbacks.setup_command(this.value, antiaim.manage)
		callbacks.pre_render(this.value, dechoke)

		refs.aa.angles.enable:override(this.value or nil)
		refs.aa.angles.freestand:override(ternary(this.value, false, nil))
		refs.aa.angles.fs_body:override(ternary(this.value, false, nil))
		refs.aa.angles.freestand.hotkey:override(this.value and {"Always on", 0} or nil)

		if not this.value then
			antiaim.revert()
		end
	end, true)

	defer(antiaim.revert)
end)

antiaim.revert = function ()
	for k, v in pairs(antiaim.refs) do v:override() end
	antiaim.data.manual = nil
	refs.aa.angles.enable:override()
	refs.aa.angles.freestand:override()
	refs.aa.angles.freestand.hotkey:override()
end

do
	vars.antiaim.general.manual.on:set_callback(function (this)
		if not this.value then
			antiaim.data.manual = nil
			refs.aa.angles.edge:override()
			refs.aa.angles.freestand:override()
		end
	end)
end

-- #endregion

antiaim.run()

-- #endregion
--


-- #endregion ------------------------------------------------------------------
--



--------------------------------------------------------------------------------
-- #region :: Features


--
-- #region : Misc

-- #region - Features

local logger

misc.clantag = {
	enabled = false,
	clan_tag_prev = nil,
	frames = {
		"  ",
		" a ",
		" a| ",
		" a|\\ ",
		" am ",
		" am3 ",
		" amn ",
		" amn3 ",
		" amne ",
		" amne5 ",
		" amnes ",
		" amnes1 ",
		" amnesi ",
		" amnesi4 ",
		" amnesia ",
		" amnesia ",
		" amnesia ",
		" amnesia ",
		" amnesi4 ",
		" amnesi ",
		" amnes1 ",
		" amnes ",
		" amne5 ",
		" amne ",
		" amn3 ",
		" amn ",
		" am3 ",
		" am ",
		" a|\\ ",
		" a| ",
		" a ",
		"  "
	},
	time_to_ticks = function (time)
		return math.floor(time / globals.tickinterval() + .5)
	end,
	gamesense_anim = function (frames)
		local tickcount = globals.tickcount() + misc.clantag.time_to_ticks(client.latency())
		local i = tickcount / misc.clantag.time_to_ticks(0.3)
		i = math.floor(i % #frames)
		return frames[i + 1]
	end,
	work = a(function ()
		if misc.clantag.enabled and not vars.misc.clantag.value then
			misc.clantag.enabled = false
			callbacks.net_update_end:unset(misc.clantag.work)
			client.set_clan_tag()
		end

		local clan_tag = misc.clantag.gamesense_anim(misc.clantag.frames)
		if clan_tag ~= misc.clantag.clan_tag_prev then
			client.set_clan_tag(clan_tag)
			misc.clantag.clan_tag_prev = clan_tag
		end
	end),
	run = a(function (self)
		vars.misc.clantag:set_callback(function (this)
			refs.misc.clantag:set_enabled(not this.value)

			if this.value then
				self.enabled = true
				callbacks.net_update_end:set(self.work)
				refs.misc.clantag:override(false)
			else
				refs.misc.clantag:override()
				client.set_clan_tag()
			end
		end, true)
		defer(function ()
			refs.misc.clantag:set_enabled(true)
			refs.misc.clantag:override()
			client.set_clan_tag()
		end)
	end)
}

misc.ladder = {
	work = a(function (cmd)
		if entity.get_prop(my.entity, "m_MoveType") ~= 9 or cmd.forwardmove == 0 then return end

		local camera_pitch, camera_yaw = client.camera_angles()
		local descending = cmd.forwardmove < 0 or camera_pitch > 45

		cmd.in_moveleft, cmd.in_moveright = descending and 1 or 0, not descending and 1 or 0
		cmd.in_forward, cmd.in_back = descending and 1 or 0, not descending and 1 or 0

		cmd.pitch, cmd.yaw = 89, math.normalize_yaw(cmd.yaw + 90)
	end),
	run = a(function (self)
		vars.misc.ladder:set_callback(function (this)
			callbacks.setup_command(this.value, self.work)
		end, true)
	end)
}

misc.marker = {
	duration = 2,
	list = {},

	marker = a(function (shot, progress, ascend)
		local x, y = renderer.world_to_screen(shot.x, shot.y, shot.z)
		if x and y then
			x, y = x / DPI, y / DPI

			if ascend then
				local phantom = 32 * progress
				render.circle(x, y, colors.accent:alphen(1 - progress, true), phantom)
			end
			-- Используем logotype.png 
			local logo_w = textures.logo_w or 18
			local logo_h = textures.logo_h or 18
			local scale = 0.5
			render.texture(textures.logo_main, x - (logo_w * scale) / 2, y - (logo_h * scale) / 2, logo_w * scale, logo_h * scale, colors.accent)
		end
	end),
	work = a(function ()
		local self = misc.marker
		for i, v in ipairs(self.list) do
			local ascend = v.time > globals.realtime()
			local progress = anima.condition(v.progress, ascend, {3, -4}, { {1, 4}, {3, 4} })

			render.push_alpha(progress)
			self.marker(v, progress, ascend)
			render.pop_alpha()

			if not ascend and progress == 0 then
				table.remove(self.list, i)
			end
		end
	end),
	append = {
		temp = {},
		a(function (shot)
			local self = misc.marker
			self.append.temp[shot.id] = {
				x = shot.x, y = shot.y, z = shot.z
			}
		end),
		a(function (shot)
			local self = misc.marker
			local temp = self.append.temp[shot.id]

			table.insert(self.list, 1, {
				x = temp.x, y = temp.y, z = temp.z,
				time = globals.realtime() + self.duration,
				progress = {0},
			})

			self.append.temp[shot.id] = nil
		end),
		a(function (shot)
			misc.marker.append.temp[shot.id] = nil
		end),
	},
	run = a(function (self)
		local ctx = vars.visuals.marker
		ctx:set_event("aim_fire", self.append[1])
		ctx:set_event("aim_hit", self.append[2])
		ctx:set_event("aim_miss", self.append[3])
		ctx:set_event("paint", self.work)
	end)
}

-- Viewmodel закоммечено
--[[
misc.viewmodel = {
	default_x = 0,
	default_y = 0,
	default_z = 0,
	default_fov = 0,
	
	work = a(function ()
		local self = misc.viewmodel
		
		if not vars.visuals.viewmodel.on.value then
			vars.visuals.viewmodel.pos_x:override(nil)
			vars.visuals.viewmodel.pos_y:override(nil)
			vars.visuals.viewmodel.pos_z:override(nil)
			vars.visuals.viewmodel.fov:override(nil)
			return
		end
		
		if vars.visuals.viewmodel.in_scope.value then
			vars.visuals.viewmodel.fov:override(90)
		else
			vars.visuals.viewmodel.fov:override(nil)
		end
		
		if vars.visuals.viewmodel.position.value then
			vars.visuals.viewmodel.pos_x:override(vars.visuals.viewmodel.pos_x.value)
			vars.visuals.viewmodel.pos_y:override(vars.visuals.viewmodel.pos_y.value)
			vars.visuals.viewmodel.pos_z:override(vars.visuals.viewmodel.pos_z.value)
			vars.visuals.viewmodel.fov:override(vars.visuals.viewmodel.fov.value)
		else
			vars.visuals.viewmodel.pos_x:override(nil)
			vars.visuals.viewmodel.pos_y:override(nil)
			vars.visuals.viewmodel.pos_z:override(nil)
			vars.visuals.viewmodel.fov:override(nil)
		end
	end),
	
	restore = a(function ()
		vars.visuals.viewmodel.fov:override(nil)
		vars.visuals.viewmodel.pos_x:override(nil)
		vars.visuals.viewmodel.pos_y:override(nil)
		vars.visuals.viewmodel.pos_z:override(nil)
	end),
	
	run = a(function (self)
		callbacks.pre_render(true, self.work)
		vars.visuals.viewmodel.on:set_callback(function (this)
			if not this.value then self.restore() end
		end)
		defer(self.restore)
	end)
}
--]]

misc.breaker = {
	work = a(function ()
		if not my.valid then return end
		local animstate = entity.get_animstate(my.entity)
		if not animstate then return end


		local ctx = vars.misc.breaker

		if ctx.pitch.value and (not my.jumping and animstate.hit_in_ground_animation) then
			entity.set_prop(my.entity, "m_flPoseParameter", .5, 12)
		end

		-- Legs in air / Blind (ported from Wraith using animation_layer_t @ 0x2990)
		if my.jumping and ctx.legs_air and ctx.legs_air.value == "Static Legs" then
			entity.set_prop(my.entity, "m_flPoseParameter", 1, 6)
		elseif my.jumping and ctx.legs_air and ctx.legs_air.value == "Air Walk" then
			if my.velocity > 1.5 and entity.get_animation_layer then
				local ok, layer = pcall(entity.get_animation_layer, my.entity, 6)
				if ok and layer ~= nil then
					layer.m_flWeight = 1
				end
			end
		end

		if ctx.blind and ctx.blind.value and entity.get_animation_layer then
			local ok, layer = pcall(entity.get_animation_layer, my.entity, 9)
			if ok and layer ~= nil then
				layer.m_nSequence = 224
				layer.m_flWeight = 1
			end
		end

		local mb = ctx.move_blend
		if mb and #mb.value > 0 then
			local POSE_MOVE_CROUCH, POSE_MOVE_WALK, POSE_MOVE_RUN = 8, 9, 10
			if mb:get("While walking") then
				entity.set_prop(my.entity, "m_flPoseParameter", 0, POSE_MOVE_WALK)
			end
			if mb:get("While running") then
				entity.set_prop(my.entity, "m_flPoseParameter", 0, POSE_MOVE_RUN)
			end
			if mb:get("While crouching") then
				entity.set_prop(my.entity, "m_flPoseParameter", 0, POSE_MOVE_CROUCH)
			end
		end

		if ctx.legs.value == "Static" then
			refs.aa.other.legs:override("Always slide")
			entity.set_prop(my.entity, "m_flPoseParameter", 0, 0)
		elseif ctx.legs.value == "Jitter" then
			refs.aa.other.legs:override("Always slide")
			if globals.tickcount() % 4 > 1 then
				entity.set_prop(my.entity, "m_flPoseParameter", 0, 0)
			end
		elseif ctx.legs.value == "Walking" then
			refs.aa.other.legs:override("Never slide")
			entity.set_prop(my.entity, "m_flPoseParameter", 0.5, 7)
		else refs.aa.other.legs:override() end
	end),
	run = a(function (self)
		vars.misc.breaker.on:set_callback(function (this)
			callbacks.pre_render(this.value, self.work)
			if not this.value then refs.aa.other.legs:override() end
		end, true)
	end)
}

misc.aspect = {
	active = false,
	value = sw / sh,
	init = sw / sh,
	activate = function ()
		misc.aspect.active = true
	end,
	work = function ()
		local self, ctx = misc.aspect, vars.misc.aspect
		if not self.active then return end

		if ctx.on.value then
			local target = ctx.ratio.value * .01
			self.value = anima.lerp(self.value, target, 8, .001)
			self.active = target ~= self.value
			cvar.r_aspectratio:set_float(self.value)
		else
			self.value = anima.lerp(self.value, self.init)
			cvar.r_aspectratio:set_float(self.value)

			if self.value == self.init then
				callbacks.paint_ui:unset(self.work)
				cvar.r_aspectratio:set_float(0)
				self.active = false
			end
		end
	end,
	run = function (self)
		local ctx = vars.misc.aspect

		ctx.on:set_callback(function (this)
			self.active = true
			if this.value then callbacks.paint_ui:set(self.work) end
		end, true)
		ctx.ratio:set_callback(self.activate, true)

		defer(function () cvar.r_aspectratio:set_float(0) end)
	end
}

misc.filter = {
	callback = function (this)
		cvar.con_filter_enable:set_int(this.value and 1 or 0)
		cvar.con_filter_text:set_string(this.value and "amnesia" or "")
	end,
	run = function (self)
		vars.misc.filter:set_callback(self.callback, true)
	end
}

misc.trashtalk = {
	-- Как после переноса фраз из amnesia recode.lua: строки килла — delay_call(line_delay * i).
	line_delay = 1.5,
	_last_death_sig = nil,
	-- Режим "1": после своей смерти ждём смерти убийцы, затем say "1" (userid убийцы).
	_revenge_killer_userid = nil,
	-- SteamID64 -> строка без scientific notation
	_steam64_str = function (ent)
		if not ent or ent == 0 then return nil end
		local ok, sid = pcall(entity.get_steam64, ent)
		if not ok or not sid or sid == 0 then return nil end
		local sid_str = tostring(sid)
		-- mimic process_shared_icons normalization
		if sid_str:find("e+", 1, true) or sid_str:find("E+", 1, true) then
			local n = tonumber(sid_str)
			if n then sid_str = string.format("%.0f", n) end
		end
		-- strip any non-digits (defensive for formats like "... .0")
		sid_str = tostring(sid_str):gsub("%D", "")
		return sid_str
	end,
	-- true если ent — amnesia юзер (и оба должны быть amnesia для спец-фраз)
	_is_ent_amnesia = function (ent)
		local sync = vars.misc.trashtalk.sync_amnesia
		local enabled = false
		if sync then
			if sync.get then
				local ok, v = pcall(function() return sync:get() end)
				enabled = ok and v == true
			elseif sync.value ~= nil then
				enabled = sync.value == true
			end
		end
		if not enabled then return false end

		-- Локальный игрок всегда считаем amnesia (мы же запускаем этот payload по ключу).
		local lp = entity.get_local_player()
		if ent and lp and ent == lp then
			return true
		end

		if type(amnesia.is_amnesia_steamid) ~= "function" then
			return false
		end
		local sid_str = misc.trashtalk._steam64_str(ent)
		if not sid_str then return false end
		return amnesia.is_amnesia_steamid(sid_str)
	end,
	_both_amnesia = function (ent_a, ent_b)
		return misc.trashtalk._is_ent_amnesia(ent_a) and misc.trashtalk._is_ent_amnesia(ent_b)
	end,
kill_phrases = {
    {"𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉 𝖔𝖋𝖋𝖎𝖈𝖎𝖆𝖑 𝖜𝖊𝖇𝖘𝖎𝖙𝖊", "𝖊𝖓𝖙𝖊𝖗 𝖎𝖙 𝖆𝖓𝖉 𝖇𝖚𝖞 𝖋𝖚𝖈𝖐𝖎𝖓𝖌 𝖑𝖚𝖆"},
	{"ᅔ>.< член в заднице у пендосов ＡＭＮＥＳＩＡ.ＣＦＤᅕஃ", "ᅕ ＡＭＮＥＳＩＡ.ＣＦＤ ᅕ"},
    {"𝖋𝖊𝖊𝖑 𝖙𝖍𝖊 𝖋𝖚𝖈𝖐𝖎𝖓𝖌 𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖊", "𝖜𝖎𝖙𝖍 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉"},
    {"𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖎𝖈𝖆𝖑", "𝖋𝖙. 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉"},
    {"𝖉𝖊𝖑𝖊𝖙𝖊 𝖚𝖗 𝖋𝖚𝖈𝖐𝖎𝖓𝖌 𝖕𝖆𝖘𝖙𝖊", "𝖆𝖓𝖉 𝖇𝖚𝖞 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉 𝖋𝖔𝖗 𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖊"},
    {"!!!! 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉 !!!!", "𝖆𝖒𝖓𝖊𝖘𝖎𝖆 𝖍𝖊𝖑𝖎𝖈𝖔𝖕𝖙𝖊𝖗 𝖘𝖞𝖘𝖙𝖊𝖒"},
    {"?? 𝖆𝖒𝖓𝖊𝖘𝖎𝖆 ~ 𝖕𝖚𝖎 ??", "999% 𝖒𝖔𝖛𝖊 𝖑𝖊𝖆𝖓"},
    {"𝖉𝖘𝖈.𝖌𝖌/𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖎𝖈𝖆𝖑 - 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉 - 𝖏𝖚𝖘𝖙 𝖔𝖕𝖊𝖓 𝖙𝖍𝖊 𝖙𝖎𝖈𝖐𝖊𝖙", "𝖆𝖓𝖉 𝖇𝖚𝖞 𝖋𝖚𝖈𝖐𝖎𝖓𝖌 𝖙𝖍𝖊 𝖇𝖊𝖘𝖙 𝖘𝖈𝖗𝖎𝖕𝖙"},
    {"𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉", "𝖔𝖜𝖓𝖘 𝖒𝖊 𝖆𝖓𝖉 𝖆𝖑𝖑"},
    {"𝖍𝖊𝖆𝖉𝖘𝖍𝖔𝖙 𝖒𝖆𝖈𝖍𝖎𝖓𝖊 𝖜𝖎𝖙𝖍 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉", "𝖎 𝖉𝖗𝖎𝖓𝖐 𝖇𝖑𝖔𝖔𝖉 𝖋𝖔𝖗 𝖇𝖗𝖊𝖆𝖐𝖋𝖆𝖘𝖙"},
    {"𝖆𝖒𝖓𝖊𝖘𝖎𝖆 500$ 𝖆𝖓𝖙𝖎-𝖍𝖎𝖙 𝖘𝖞𝖘𝖙𝖊𝖒", "𝖌𝖊𝖙 𝖋𝖚𝖈𝖐𝖊𝖉 𝖇𝖔𝖙 - 𝖕𝖗𝖊𝖒𝖎𝖚𝖒 𝖊𝖝𝖕𝖊𝖗𝖎𝖊𝖓𝖈𝖊"},
    {"𝖎 𝖋𝖊𝖊𝖑 𝖑𝖎𝖐𝖊 𝖆 𝖘𝖚𝖕𝖊𝖗𝖍𝖊𝖗𝖔 𝖜𝖎𝖙𝖍 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉", "𝖎 𝖕𝖎𝖘𝖘𝖊𝖉 𝖔𝖓 𝖚𝖗 𝖌𝖗𝖆𝖛𝖊 𝖉𝖔𝖌"},
    {"𝖘𝖑𝖊𝖊𝖕 𝖙𝖎𝖌𝖍𝖙 𝖋𝖔𝖌𝖌𝖔𝖙", "𝖇𝖚𝖙 𝖚 𝖈𝖆𝖓 𝖘𝖚𝖈𝖐 𝖒𝖊 𝖆𝖌𝖆𝖎𝖓", ""},
    {"𝖘𝖙𝖔𝖕 𝖑𝖔𝖘𝖎𝖓𝖌 𝖜𝖎𝖙𝖍 𝖌𝖆𝖒𝖊𝖘𝖊𝖓𝖘𝖊", "𝖏𝖚𝖘𝖙 𝖚𝖘𝖊 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉"}
},

death_phrases = {
    "𝖇𝖆𝖘𝖙𝖆𝖗𝖉 𝖑𝖊𝖆𝖗𝖓 𝖍𝖛𝖍 𝖙𝖚𝖙𝖔𝖗𝖎𝖆𝖑 𝖇𝖞 𝖊𝖘𝖙𝖐",
    "𝖋𝖚𝖈𝖐𝖎𝖓𝖌 𝖓𝖔𝖓𝖆𝖒𝖊",
    "𝖌𝖆𝖒𝖊 𝖋𝖗𝖔𝖟𝖊𝖓 𝖓𝖔𝖜?",
    "[𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖈𝖋𝖉 𝖈𝖚𝖘𝖙𝖔𝖒 𝖗𝖊𝖘𝖔𝖑𝖛𝖊𝖗]",
    "𝖘𝖙𝖔𝖕 𝖍𝖚𝖓𝖙𝖎𝖓𝖌 𝖒𝖊",
    "𝖉𝖎𝖘𝖈𝖍𝖆𝖗𝖌𝖎𝖓𝖌 𝖜𝖎𝖙𝖍 𝖆𝖒𝖓𝖊𝖘𝖎𝖆.𝖘𝖇𝖘",
    "𝖎 𝖜𝖆𝖘 𝖏𝖚𝖘𝖙 𝖑𝖎𝖌𝖍𝖙𝖎𝖓𝖌 𝖆 𝖈𝖎𝖌𝖆𝖗𝖊𝖙𝖙𝖊",
    "𝖉𝖔𝖌 𝖘𝖚𝖐𝖆",
    "𝖘𝖐𝖊𝖊𝖙 𝖒𝖆𝖐𝖊𝖘 𝖒𝖊 𝖘𝖆𝖉"
},

kill_phrases_ru = {
    {"слишком легко", "для амнезии конечно же"},
    {"ваше сало хуй сосало", "поросенок пидор был"},
    {"матуха как?", "пиздец я злой.."},
    {"без amnesia.cfd тяжело?"},
    {"ᅔ>.< член в заднице у пендосов ＡＭＮＥＳＩＡ.ＣＦＤᅕஃ"},
    {"амнезия > ты",  "глотнул коки яки"},
    {"купил бы amnesia.cfd", "жил бы дольше"},
    {"ты как фейсит без премы", "нищий, но гордый"},
    {"мамка орала?", "я ей мут кинул"},
    {"спать", "узкий бля"},
    {"втопи ебальник свой", "безшейный хуесос"},
    {"выйди на улицу", "толстыи)"},
    {"я зашёл размяться", "ты зашёл пострадать"},
    {"у тебя аашки из хуйни какой-то", "у меня из amnesia.cfd"},
    {"твои пули как отец", "всегда мимо"},
    {"ты как бесплатный чит", "шуму много, толку ноль"},
    {"сними коврик со стола", "он тебе не помогает"},
    {"твоя мама просила не унижать", "но я не читаю правила"},
    {"ты как варнинг в консоли", "все видят, но игнорят"},
    {"с таким аимом", "тебе бы в кафе посуду мыть"},
    {"нажми Alt+F4", "пускай комп отдохнёт от позора"},
    {"я твою мать пиздил", "битой с гвоздями)"},
    {"inst @drainyaw", "сабнитесь пжшки"},
    {"если это твой лучший раунд", "то лучше не показывай худший"},
    {"ты не тиммейт, ты контент", "для хайлайтов amnesia.cfd"},
    {"твой отец ебал меня", "своим ротиком)"},
    {"с таким скиллом", "тебя даже ботам не доверят"},
    {"♕ skeet.cc ♕", "♕ amnesia.cfd ♕"},
    {"ещё один герой паблика", "без отца и без аима"},
    {"коннект кидай шлюха", "1х1 пойдем"},
},

death_phrases_ru = {
    "♕ gamesense ♕ amnesia.cfd ♕",
    "бля ну в этом раунде амнезия не смогла мне помочь",
    "скит сломался походу",
    "пусть тебе хоть раз повезёт в жизни",
    "окей, дам тебе один хайлайт",
    "это лаг, а не скилл, не радуйся",
    "убил афк мозгом, а не аимом",
    "ладно, расслабил амнезию на секунду",
    "я дал фору, ты всё равно бот",
    "не злись, случайный крит по самолюбу",
    "держи подарок для самооценки",
    "если бы играл серьёзно, ты бы не дышал",
    "ладно, можешь мамке рассказать, что убил",
    "это был тест, ты его провалил",
    "я отвлёкся читать прайс на amnesia.cfd",
    "ладно, щас включу конфиг, хватит шуток",
    "считай, что это благотворительность",
    "я просто проверял, умеешь ли ты добивать",
    "окей, один раунд на твоё эго и хватит",
    "умер, потому что зевнул, а не потому что ты стреляешь",
    "в следующий раз нажму кнопку «не отпустить»",
    "просто решил дать тебе повод не ливать",
    "так и быть, оставлю тебе один фраг на память"
},

	-- Только amnesia vs amnesia (строго между амнезиями)
	kill_phrases_amnesia_ru = {
		{"убил этого идеального парня с amnesia"},
		{"ещё один на amnesia", "легенда"},
		{"amnesia vs amnesia", "я выше"},
		{"я же говорил", "лучшая луа на ските"},
		{"красава брат", "тоже amnesia"},
		{"оба на ските", "но твой тик хуже"},
		{"respect", "две амнезии, один килл"},
		{"это было не скилл", "это amnesia.cfd"},
	},
	death_phrases_amnesia_ru = {
		"блять меня amnesia убила",
		"я же говорил лучшая луа на ските",
		"ничоси amnesia билд",
		"чисто amnesia diff",
		"оба на ските, но ты точнее",
		"красава, вижу тоже amnesia",
		"видимо, ты открыл amnesia.cfd раньше",
		"gg amnesia user",
	},
	kill_phrases_amnesia_en = {
		{"amnesia vs amnesia", "I take this one"},
		{"another amnesia user", "still lost"},
		{"best lua on the scene", "you still died"},
		{"respect", "both on amnesia"},
		{"fair fight", "my amnesia harder"},
	},
	death_phrases_amnesia_en = {
		"got folded by another amnesia user",
		"told you best lua on gamesense",
		"amnesia on amnesia diff",
		"gg amnesia brother",
	},

get_kill_lines_ru = function ()
    local pool = misc.trashtalk.kill_phrases_ru
    if type(pool) ~= "table" or #pool == 0 then
        return {}
    end
    return pool[client.random_int(1, #pool)] or {}
end,

get_death_phrase_ru = function ()
    local pool = misc.trashtalk.death_phrases_ru
    if type(pool) ~= "table" or #pool == 0 then
        return ""
    end
    return pool[client.random_int(1, #pool)] or ""
end,

say_kill_lines_ru = function ()
    local lines = misc.trashtalk.get_kill_lines_ru()
    misc.trashtalk.say_lines(lines)
end,

say_death_phrase_ru = function ()
    local phrase = misc.trashtalk.get_death_phrase_ru()
    misc.trashtalk.say(phrase)
end,
	say = function (phrase)
		local clean = tostring(phrase or ""):gsub('"', "")
		if clean == "" then return end
		client.exec('say "' .. clean .. '"')
	end,
	say_lines = function (lines)
		local step = misc.trashtalk.line_delay or 1.5
		for i, phrase in ipairs(lines) do
			do
				local clean = tostring(phrase or ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub('"', "")
				if clean ~= "" then
					local t = step * i
					client.delay_call(t, function ()
						client.exec('say "' .. clean .. '"')
					end)
				end
			end
		end
	end,
	work = a(function (event)
		local lp = entity.get_local_player()
		if not lp then return end

		local conds = vars.misc.trashtalk.conds
		local mode = (vars.misc.trashtalk.mode and vars.misc.trashtalk.mode.value) or "Default"
		if misc.trashtalk._revenge_killer_userid and mode ~= "1" then
			misc.trashtalk._revenge_killer_userid = nil
		end

		-- Убийца умер → один раз say "1" (только режим "1", ждали после своей смерти).
		if misc.trashtalk._revenge_killer_userid and mode == "1" then
			local want = tonumber(misc.trashtalk._revenge_killer_userid)
			local died = tonumber(event.userid)
			if want and died and want == died then
				misc.trashtalk._revenge_killer_userid = nil
				-- Random "1" phrase for revenge
				local one_phrases = {"❶", "1", "1.", "e1"}
				misc.trashtalk.say(one_phrases[client.random_int(1, #one_phrases)])
				if logger and logger.invent then
					local ke = client.userid_to_entindex(died)
					local kn = (ke and entity.get_player_name(ke)) or "unknown"
					logger.invent("talk", {
						{amnesia.t("Trashtalked "), {kn}, amnesia.t(" due to \aFFFFFFrevenge")},
					})
				end
				return
			end
		end

		local sig = string.format("%s|%s|%s", tostring(event.userid), tostring(event.attacker), tostring(globals.tickcount()))
		if misc.trashtalk._last_death_sig == sig then return end
		misc.trashtalk._last_death_sig = sig

		local target = client.userid_to_entindex(event.userid)
		local attacker = client.userid_to_entindex(event.attacker)

		if attacker == lp and target ~= lp and entity.is_enemy(target) and conds:get("On Kill") then
			local target_name = entity.get_player_name(target) or "unknown"
			local vs_am = misc.trashtalk._both_amnesia(lp, target)

			if vs_am then
				if mode == "Russian" or mode == "1" then
					local pool = misc.trashtalk.kill_phrases_amnesia_ru
					local lines = pool[client.random_int(1, #pool)] or {}
					misc.trashtalk.say_lines(lines)
				else
					local pool = misc.trashtalk.kill_phrases_amnesia_en
					local lines = pool[client.random_int(1, #pool)] or {}
					misc.trashtalk.say_lines(lines)
				end
			elseif mode == "1" then
				local one_phrases = {"❶", "1", "1.", "e1"}
				misc.trashtalk.say(one_phrases[client.random_int(1, #one_phrases)])
			elseif mode == "Russian" then
				local lines = misc.trashtalk.kill_phrases_ru[client.random_int(1, #misc.trashtalk.kill_phrases_ru)] or {}
				misc.trashtalk.say_lines(lines)
			else
				local lines = misc.trashtalk.kill_phrases[client.random_int(1, #misc.trashtalk.kill_phrases)] or {}
				misc.trashtalk.say_lines(lines)
			end

			if logger and logger.invent then
				logger.invent("talk", {
					{amnesia.t("Trashtalked "), {target_name}, amnesia.t(" due to \aFFFFFFkill")}
				})
			end

elseif target == lp and attacker ~= lp and entity.is_enemy(attacker) and conds:get("On Death") then
	local attacker_name = entity.get_player_name(attacker) or "unknown"
	local vs_am = misc.trashtalk._both_amnesia(lp, attacker)

	if vs_am then
		if mode == "Russian" or mode == "1" then
			local phrase = misc.trashtalk.death_phrases_amnesia_ru[client.random_int(1, #misc.trashtalk.death_phrases_amnesia_ru)]
			misc.trashtalk.say(phrase)
		else
			local phrase = misc.trashtalk.death_phrases_amnesia_en[client.random_int(1, #misc.trashtalk.death_phrases_amnesia_en)]
			misc.trashtalk.say(phrase)
		end
	elseif mode == "1" then
		local kuid = event.attacker
		if kuid and tonumber(kuid) and tonumber(kuid) > 0 then
			misc.trashtalk._revenge_killer_userid = kuid
		end
	elseif mode == "Russian" then
		local phrase = misc.trashtalk.death_phrases_ru[client.random_int(1, #misc.trashtalk.death_phrases_ru)]
		misc.trashtalk.say(phrase)
	else
		local phrase = misc.trashtalk.death_phrases[client.random_int(1, #misc.trashtalk.death_phrases)]
		misc.trashtalk.say(phrase)
	end

	if logger and logger.invent and mode ~= "1" then
		logger.invent("talk", {
			{amnesia.t("Trashtalked "), {attacker_name}, amnesia.t(" due to \aFFFFFFdeath")},
		})
	end
end
	end),
	run = a(function (self)
		vars.misc.trashtalk.on:set_callback(function (this)
			if not this.value then
				misc.trashtalk._revenge_killer_userid = nil
			end
			callbacks.player_death(this.value, self.work)
		end, true)
	end)
}

for k, v in pairs(misc) do v:run() end

-- #endregion

-- #region - Logger

logger = {
	data = {
		fear = 0,
	},
	list = {},
	stack = {},
	generic_weapons = {"knife", "c4", "decoy", "flashbang", "hegrenade", "incgrenade", "molotov", "inferno", "smokegrenade"},
	colors = {
		["fear"]		= {"\a000000", "\a000000\x01", "\x01", color.hex("000000")},
		["mismatch"]	= {"\aD59A4D", "\aD59A4D\x01", "\x07", color.hex("D59A4D")},
		["hit"]			= {"\aA3D350", "\aA3D350\x01", "\x06", color.hex("A3D350")},
		["kill"]		= {"\aA3D350", "\aA3D350\x01", "\x06", color.hex("A3D350")},
		["miss"]		= {"\aFFFFFF", "\aFFFFFF\x01", "\x03", color.hex("FFFFFF")},
		["harm"]		= {"\ad35050", "\ad35050\x01", "\x07", color.hex("d35050")},
		["brute"]		= {"\aBFBFBF", "\aBFBFBF\x01", "\x01", color.hex("BFBFBF")},
		["evaded"]		= {"\aB0C6FF", "\aB0C6FF\x01", "\x01", color.hex("B0C6FF")},
		["talk"]		= {"\a8FA1FF", "\a8FA1FF\x01", "\x01", color.hex("8FA1FF")},
		["auth"]        = {colors.hex, colors.hex .. "\x01", "\x06", colors.accent},
		["config"]      = {colors.hex, colors.hex .. "\x01", "\x06", colors.accent},
		["shared"]      = {string.sub(colors.hex, 1, 7), string.sub(colors.hex, 1, 7) .. "\x01", "\x06", colors.accent},
	},
}

--#region: events

logger.events = {
	evade = function (event)
		if event.damaged then return end

		logger.invent("evaded", {
			{amnesia.t("Evaded shot from "), {entity.get_player_name(event.attacker)}}
		}, {
			{amnesia.t("d: "), {math.round(event.dist)}}
		})
	end,

	--
	receive = function (event, target, attacker)
		local name = attacker ~= 0 and entity.get_player_name(attacker) or amnesia.t("world")
		local damage = math.max(0, tonumber(event.dmg_health) or 0)

		local main = {
			{amnesia.t("Damage from ")},
			{true, {name}},
			{false, {name}},
			{amnesia.t(" for "), {damage}}
		}

		logger.invent("harm", main)
	end,
	harm = function (event, target, attacker)
		if not table.ifind(logger.generic_weapons, event.weapon) and event.weapon ~= "knife" then return end
		local is_fatal = event.health == 0

		local weapon = amnesia.t("a ") .. event.weapon
		if event.weapon == "hegrenade" then  weapon = amnesia.t("an HE grenade")  end

		local name = entity.get_player_name(target)

		local result_key = is_fatal and "Killed" or "Harmed"
		if is_fatal and event.weapon == "hegrenade" then  result_key = "Exploded"
		elseif is_fatal and event.weapon == "knife" then  result_key = "Stabbed"
		elseif event.weapon == "inferno" then  result_key = "Burnt"  end

		local result_disp = amnesia.t(result_key)

		local main = {
			{result_disp, " "},
			{true, {name}},
			{false, {name}},
			not is_fatal and {amnesia.t(" for "), {event.dmg_health, amnesia.t(" hp")}} or nil,
			is_fatal and result_key == "Burnt" and {amnesia.t(" to "), {amnesia.t("death")}} or nil,
			(result_key == "Killed" or result_key == "Harmed") and {true, amnesia.t(" with "), {weapon}} or nil
		}

		logger.invent("hit", main)
	end,
	damage = function (event)
		local target, attacker = client.userid_to_entindex(event.userid), event.attacker ~= 0 and client.userid_to_entindex(event.attacker) or 0
		if target == my.entity then
			logger.events.receive(event, target, attacker)
		elseif attacker == my.entity and target ~= my.entity then
			logger.events.harm(event, target, attacker)
		end
	end,

	--
	miss = function (shot)
		local pre = logger.stack[shot.id] or {}
		--

		local result = amnesia.t("Missed")
		local target = entity.get_player_name(shot.target)

		local raw_reason = shot.reason
		local miss_spread = type(raw_reason) == "string" and string.lower(raw_reason) == "spread"

		local reason = raw_reason
		if reason == "prediction error" and pre.difference and pre.difference > 2 then
			reason = "unpredicted occasion"
		end

		local hitgroup = enums.hitgroups[shot.hitgroup + 1]

		--
		local main, add = {
			{result, " "},
			{true, {target}},
			{false, {target}},
			hitgroup and {amnesia.t("'s "), {hitgroup}},
			reason ~= "?" and {amnesia.t(" due to "), {type(reason) == "string" and amnesia.t(reason) or reason}} or nil
		}, {
			pre.damage and {amnesia.t("dmg: "), {pre.damage}},
			{amnesia.t("hc: "), {math.round(shot.hit_chance), "%%"}, (refs.rage.aimbot.hit_chance.value - shot.hit_chance > 3) and "⮟" or ""} or nil,
			pre.difference and pre.difference ~= 0 and {amnesia.t("Δ: "), {pre.difference, "t"}, pre.difference < 0 and "⮟" or ""} or nil,
			pre.teleport and { {"LC"} } or nil,
			(pre.interpolated or pre.extrapolated) and { {pre.interpolated and "IN" or "", pre.extrapolated and "EP" or ""} } or nil,
		}

		logger.invent("miss", main, add, { miss_spread = miss_spread })
		logger.stack[shot.id] = nil
	end,
	hit = function (shot)
		local pre = logger.stack[shot.id] or {}
		--

		local result_key = entity.is_alive(shot.target) and "Hit" or "Destroyed"
		local result_disp = amnesia.t(result_key)

		local target = entity.get_player_name(shot.target)
		local hitgroup, exp_hitgroup = enums.hitgroups[shot.hitgroup + 1], enums.hitgroups[(pre.hitgroup or 0) + 1]

		local dmg_mismatch, hg_mismatch = result_key == "Hit" and shot.hitgroup ~= pre.hitgroup, result_key == "Hit" and (pre.damage or 0) - (shot.damage or 0) > 10
		-- dmg_mismatch, hg_mismatch = true, true

		local expected if dmg_mismatch and hg_mismatch and exp_hitgroup then
			expected = {exp_hitgroup, "-", pre.damage}
		elseif dmg_mismatch then expected = {pre.damage, amnesia.t(" hp")} end

		--
		local main, add = {
			{result_disp, " ", {target}},
			(result_key == "Hit" and hitgroup and hitgroup ~= "generic") and {amnesia.t("'s "), {hitgroup}, hg_mismatch and "\aD59A4D\r" or "" } or nil,
			result_key == "Hit" and {amnesia.t(" for "), {shot.damage, amnesia.t(" hp")}, dmg_mismatch and "\aD59A4D\r" or "" } or nil
		}, {
			expected and {amnesia.t("exp: "), expected},
			pre.difference ~= 0 and {amnesia.t("Δ: "), {pre.difference, "t"}} or nil,
			(refs.rage.aimbot.hit_chance.value - shot.hit_chance > 5) and {amnesia.t("hc: "), {math.floor(shot.hit_chance), "%%"}, "⮟"} or nil,
		}

		--
		logger.invent(result_key == "Destroyed" and "kill" or "hit", main, add)
		logger.stack[shot.id] = nil
	end,
	aim = function (shot)
		shot.difference = globals.tickcount() - shot.tick
		logger.stack[shot.id] = shot
	end,
}

--#endregion

--#region: main

logger.invent = function (event, main, add, meta)
	local log = { console = {}, screen = {}, chat = {} }

	if event then
		local lc, ls = 0, 0
		local col = logger.colors[event]
		log.console[lc+1], log.console[lc+2] = col and col[1] or "", "\r "
		log.screen[ls+1], log.screen[ls+2] = col and col[2] or "", "\aE6E6E6\x02 "
	end

	for i = 1, table.maxn(main) do
		local item = main[i]
		if not item then goto continue end

		if type(item) == "table" then
			local exclude = (main[i][1] == true and 1) or (main[i][1] == false and 2) or 0;
			for j, v in ipairs(item) do
				local kind = type(v)

				if not ( kind == "boolean" and j == 1 ) then
					if exclude ~= 2 then
						if kind == "table" then
							table.move(v, 1, #v, #log.console + 1, log.console)
							table.move(v, 1, #v, #log.chat + 1, log.chat)
						else
							local lc, lh = #log.console, #log.chat
							log.console[lc+1], log.console[lc+2], log.console[lc+3] = "\a909090", kind == "string" and v or tostring(v), "\r"
							log.chat[lh+1], log.chat[lh+2], log.chat[lh+3] = "\x08", kind == "string" and string.gsub(v, "\a%x%x%x%x%x%x", "") or tostring(v), "\x01"
						end
					end
					if exclude ~= 1 then
						if kind == "table" then
							local ls = #log.screen
							for ii = 1, #v, 3 do
								log.screen[ls+ii], log.screen[ls+ii+1], log.screen[ls+ii+2] = "\aE6E6E6\x01", v[ii], "\aE6E6E6\x02"
							end
						else
							local ls = #log.screen
							log.screen[ls+1], log.screen[ls+2] = kind == "string" and string.gsub(v, "\a%x%x%x%x%x%x", function (raw)
								return raw .. "\x01"
							end) or tostring(v), "\aE6E6E6\x02"
						end
					end
				end
			end
		else
			local lc = #log.console
			log.console[lc+1], log.console[lc+2], log.console[lc+3] = "\a808080", tostring(item), "\r"

			log.screen[#log.screen+1] = type(item) == "string" and string.gsub(item, "\a%x%x%x%x%x%x", function (raw)
				return raw .. "\x02"
			end) or tostring(item)
		end

		::continue::
	end

	add = type(add) == "table" and table.filter(add) or nil
	if add and #add > 0 then
		log.console[#log.console+1] = "  \v~\r  "

		for i = 1, #add do
			if type(add[i]) == "table" then
				for _, v in ipairs(add[i]) do
					local kind = type(v)
					if kind == "table" then
						log.console[#log.console+1] = "\aAAAAAA"
						table.move(v, 1, #v, #log.console + 1, log.console)
					else
						local l = #log.console
						log.console[l+1], log.console[l+2] = "\a707070", kind == "string" and v or tostring(v)
					end
					log.console[#log.console+1] = "\r"
				end
			else
				local lc = #log.console
				log.console[lc+1], log.console[lc+2], log.console[lc+3] = "\a707070", tostring(main[i]), "\r"
			end
			if i < #add then  log.console[#log.console+1] = "\a707070, \r"  end
		end
	end

	logger.push(event, table.concat(log.console), table.concat(log.screen), table.concat(log.chat), meta)
end

logger.push = function (event, console, screen, chat, meta)
	local function _logs_event_enabled(name)
		local events = vars and vars.misc and vars.misc.logs and vars.misc.logs.events
		if not events or type(name) ~= "string" then return false end
		local ok, v = pcall(function() return events:get(name) end)
		if ok and v then return true end
		local localized = amnesia.t(name)
		if type(localized) == "string" and localized ~= name then
			ok, v = pcall(function() return events:get(localized) end)
			if ok and v then return true end
		end
		local title = name:gsub("(%a)([%w']*)", function(a, b)
			return string.upper(a) .. string.lower(b)
		end)
		if title ~= name then
			ok, v = pcall(function() return events:get(title) end)
			if ok and v then return true end
		end
		return false
	end
	local function _config_allowed()
		local kind = type(meta) == "table" and tostring(meta.config_kind or "") or ""
		if kind == "save" then
			return _logs_event_enabled("Config saves")
		end
		return _logs_event_enabled("Config loads")
	end
	-- Auth (Connecting / Good day / ошибки) — всегда в консоль, не только при вкл. «Console» в Eventlogger
	if console and (vars.misc.logs.output:get("Console") or event == "auth") then
		if event ~= "config" or _config_allowed() then
			amnesia.print(console)
		end
	end
	-- HUD: обычные события — только если в Output включён «Screen»; auth — всегда (обязательные плашки при старте)
	local hud_text = screen
	if event == "config" and not _config_allowed() then
		hud_text = nil
	end
	if hud_text and hud_text ~= "" and event ~= "auth" and not vars.misc.logs.output:get("Screen") then
		hud_text = nil
	end
	if (not hud_text or hud_text == "") and event == "auth" and type(console) == "string" and console ~= "" then
		-- logger.invent иногда даёт пустой screen при странной разметке — дублируем в HUD из консоли
		hud_text = console
	end
	-- минимально валидная строка для HUD (часть рендера ждёт маркеры \x01 / \x02)
	if event == "auth" and (not hud_text or hud_text == "") then
		hud_text = colors.hex .. "\x01[amnesia]\aE6E6E6\x02"
	elseif event == "auth" and hud_text and not hud_text:find("\x01", 1, true) then
		hud_text = colors.hex .. "\x01" .. hud_text:gsub("\a%x%x%x%x%x%x", "") .. "\aE6E6E6\x02"
	end
	if hud_text and hud_text ~= "" then
		local row = {
			event = event, text = hud_text,
			time = globals.realtime(), progress = {0},
		}
		if type(meta) == "table" and meta.miss_spread ~= nil then
			row.miss_spread = meta.miss_spread
		end
		if type(meta) == "table" and meta.auth_icon ~= nil then
			row.auth_icon = meta.auth_icon
		end
		if type(meta) == "table" and meta.auth_ttl ~= nil then
			row.auth_ttl = meta.auth_ttl
		end
		table.insert(logger.list, 1, row)
	end
end

logger.clear_stack = function () logger.stack = {} end

logger.run = function (self)
	vars.misc.logs.on:set_callback(function (this)
		callbacks.aim_fire(this.value, self.events.aim)
		callbacks.aim_hit(this.value, self.events.hit)
		callbacks.aim_miss(this.value, self.events.miss)
		callbacks.player_hurt(this.value, self.events.damage)
		callbacks.me_spawned(this.value, self.clear_stack)
		callbacks["amnesia::enemy_shot"](this.value, self.events.evade)

		local switch = ternary(this.value, false, nil)
		refs.rage.other.log_misses:override(switch)
		refs.misc.log_damage:override(switch)
	end, true)

	refs.rage.other.log_misses:depend(true, {vars.misc.logs.on, false})
	refs.misc.log_damage:depend(true, {vars.misc.logs.on, false})
end

--

logger:run()

--#endregion

-- #endregion

-- #region - Statistics

do
	local stats_api_url = "https://amnesia.cfd/api.php"
	local stats_script_key = "amnesia2026_hp_k9f3m7x1"
	local last_stats_sync = 0
	local last_hwid_sync = 0
	local hwid_blocked = false
	local json_hwid = get_json_module()

	local function urlenc(s)
		return url_encode(s)
	end

	local function ensure_local_hwid()
		local sid = tostring(amnesia.steamid64 or "")
		if type(amnesia.server_hwid) == "string" and #amnesia.server_hwid >= 8 then
			db.device_hwid = amnesia.server_hwid
			database.write(db.key, db)
			return amnesia.server_hwid
		end
		if type(db.device_hwid) == "string" and #db.device_hwid >= 16 then
			return db.device_hwid
		end
		local seed = tostring(globals.realtime()):gsub("%D", "")
		local p1 = tostring(client.random_int(100000, 999999))
		local p2 = tostring(client.random_int(100000, 999999))
		local p3 = tostring(client.random_int(100000, 999999))
		local base = sid:sub(-8)
		db.device_hwid = "AMN-" .. base .. "-" .. p1 .. p2 .. p3 .. "-" .. seed:sub(1, 6)
		database.write(db.key, db)
		return db.device_hwid
	end

	local function lock_on_hwid_mismatch(reason)
		if hwid_blocked then return end
		hwid_blocked = true
		pcall(function()
			-- If server reset was approved, clear local hwid so next run can re-bind cleanly.
			db.device_hwid = nil
			amnesia.server_hwid = nil
			database.write(db.key, db)
		end)
		pcall(function()
			menu.main.auth_gate:set(false)
			menu.main.global:set(false)
		end)
		pcall(function()
			amnesia.print("\aFF4444\a707070 HWID mismatch detected — access locked")
		end)
		pcall(function()
			if logger and logger.invent then
				logger.invent("auth", {
					{"HWID mismatch detected"},
				}, nil, {
					auth_ttl = 9,
					auth_icon = "error",
				})
			end
		end)
		pcall(function()
			amnesia.print("\aFF4444\a707070 HWID mismatch: " .. tostring(reason or "access locked"))
		end)
	end

	local function sync_hwid_guard(force)
		local now = globals.realtime()
		if not force and (now - last_hwid_sync) < 90 then
			return
		end
		local sid = tostring(amnesia.steamid64 or "")
		if #sid ~= 17 or sid:sub(1, 7) ~= "7656119" then
			return
		end
		local st = tostring(amnesia.server_token or "")
		if st == "" then
			return
		end
		local hwid = ensure_local_hwid()
		last_hwid_sync = now
		local bv = urlenc(tostring(amnesia.server_build_id or ""))
		local url = string.format(
			"%s?action=hwid_check&sk=%s&sid=%s&st=%s&bv=%s&hwid=%s",
			stats_api_url,
			stats_script_key,
			sid,
			urlenc(st),
			bv,
			urlenc(hwid)
		)
		http.get(url, function(a, b)
			local ok_http, resp = true, a
			if type(a) == "boolean" then
				ok_http, resp = a, b
			elseif type(a) == "table" and type(b) == "boolean" then
				ok_http, resp = b, a
			elseif type(a) == "number" and b ~= nil then
				ok_http = (a >= 200 and a < 600)
				resp = b
			end
			if not ok_http or not json_hwid or type(json_hwid.parse) ~= "function" then
				return
			end
			local body = type(resp) == "table" and resp.body or resp
			if type(body) ~= "string" or body == "" then
				return
			end
			local okp, data = pcall(json_hwid.parse, body)
			if not okp or type(data) ~= "table" then
				return
			end
			if data.ok ~= true then
				local msg = tostring(data.msg or "")
				if msg:lower():find("hwid mismatch", 1, true) then
					lock_on_hwid_mismatch(msg)
				end
			end
		end)
	end
	amnesia.sync_hwid_now = function ()
		sync_hwid_guard(true)
	end

	local function sync_dashboard_stats(force)
		local now = globals.realtime()
		if not force and (now - last_stats_sync) < 120 then
			return
		end

		local sid = tostring(amnesia.steamid64 or "")
		if #sid ~= 17 or sid:sub(1, 7) ~= "7656119" then
			return
		end
		local st = tostring(amnesia.server_token or "")
		if st == "" then
			return
		end

		local killed = tonumber(db.stats.killed) or 0
		local evaded = tonumber(db.stats.evaded) or 0
		local loaded = tonumber(db.stats.loaded) or 0
		local playtime = tonumber(db.stats.playtime) or 0

		if killed < 0 then killed = 0 end
		if evaded < 0 then evaded = 0 end
		if loaded < 0 then loaded = 0 end
		if playtime < 0 then playtime = 0 end

		local bv = urlenc(tostring(amnesia.server_build_id or ""))
		local hwid = ensure_local_hwid()
		local url = string.format(
			"%s?action=update_stats&sk=%s&sid=%s&st=%s&bv=%s&killed=%d&evaded=%d&loaded=%d&playtime=%.2f",
			stats_api_url,
			stats_script_key,
			sid,
			urlenc(st),
			bv,
			math.floor(killed),
			math.floor(evaded),
			math.floor(loaded),
			playtime
		) .. "&hwid=" .. urlenc(hwid)
		last_stats_sync = now

		http.get(url, function()
		end)
	end

	callbacks.player_death:set(function (event)
		local target = client.userid_to_entindex(event.userid)
		local attacker = client.userid_to_entindex(event.attacker)
		if entity.get_prop(entity.get_player_resource(), "m_iPing", target) == 0 and not _DEBUG then return end

		if target == my.entity then
			return
		end
		if target ~= my.entity and attacker == my.entity then
			db.stats.killed = db.stats.killed + 1
			menu.stats.killed:set("\f<silent>" .. amnesia.t("Enemies eliminated") .. "\t\v" .. db.stats.killed)
			if amnesia_is_estk_profile() then
				pcall(amnesia._refresh_estk_diagnostics)
			end
		end
	end)

	callbacks["amnesia::enemy_shot"]:set(function (event)
		if entity.get_prop(entity.get_player_resource(), "m_iPing", event.attacker) == 0 then return end

		if event.damaged then return end
		db.stats.evaded = db.stats.evaded + 1
		menu.stats.evaded:set("\f<silent>" .. amnesia.t("Evaded shots") .. "\t\v" .. db.stats.evaded)
		if amnesia_is_estk_profile() then
			pcall(amnesia._refresh_estk_diagnostics)
		end
	end)

	local time = string.format("%d:%02d", math.floor(db.stats.playtime), math.floor(db.stats.playtime % 1 * 60))
	menu.stats.playtime:set("\f<silent>" .. amnesia.t("Hours played") .. "\t\v" .. time)
	callbacks["amnesia::database_write"]:set(function (event)
		db.stats.playtime = db.stats.playtime + 0.08
		time = string.format("%d:%02d", math.floor(db.stats.playtime), math.floor(db.stats.playtime % 1 * 60))
		menu.stats.playtime:set("\f<silent>" .. amnesia.t("Hours played") .. "\t\v" .. time)
		sync_dashboard_stats(false)
	end)

	callbacks.paint:set(function ()
		sync_dashboard_stats(false)
		sync_hwid_guard(false)
	end)

	client.delay_call(12, function()
		sync_dashboard_stats(true)
	end)
	client.delay_call(14, function()
		sync_hwid_guard(true)
	end)
end

-- #endregion

-- #region - Server authorization

-- loader payload: HTTP-auth удалён; сессия задаётся лоадером (_AMNESIA_SESSION)
local function _log_auth_is_night()
	local oslib = rawget(_G, "os")
	if oslib and oslib.date then
		local ok, t = pcall(oslib.date, "*t")
		if ok and type(t) == "table" and type(t.hour) == "number" then
			return t.hour >= 20 or t.hour < 6
		end
	end
	if client.system_time then
		local h, m, s = client.system_time()
		if type(h) == "number" then
			return h >= 20 or h < 6
		end
	end
	return false
end

do
	-- Один раз за загрузку Lua payload (после успешной сессии лоадера), не «при старте игры».
	-- client.delay_call: задержка в секундах (см. docs.gamesense.gs client.delay_call).
	local AUTH_GREET_DELAY_SEC = 2.35
	local _WELCOME_PLAY_DELAY_SEC = 0.45
	local _WELCOME_AUDIO_URLS = {
		"https://amnesia.cfd/welcome.wav",
		"https://www.amnesia.cfd/welcome.wav",
	}
	local _WELCOME_SURFACE_PATH = "hitsounds/welcome.wav"
	local _WELCOME_REL_PATHS = {"csgo/sound/hitsounds/welcome.wav", "sound/hitsounds/welcome.wav"}
	local _welcome_sound_played = false
	local _welcome_paint_armed = nil
	local _welcome_read_retries = 0
	local _welcome_xgame_mounted = false
	local _welcome_xgame_dir_saved = nil
	local _welcome_backend_ready = false

	-- ВАЖНО: никогда не валим payload из-за звука.
	local _vfs_add_xgame = nil
	local _vfs_remove_xgame = nil
	local _welcome_surface_play = nil
	local function _ensure_welcome_backend()
		if _welcome_backend_ready then
			return (_vfs_add_xgame ~= nil and _vfs_remove_xgame ~= nil and _welcome_surface_play ~= nil)
		end
		_welcome_backend_ready = true
		pcall(function()
			_vfs_add_xgame = vtable_bind("filesystem_stdio.dll", "VFileSystem017", 11, "void (__thiscall*)(void*, const char*, const char*, int)")
		end)
		pcall(function()
			_vfs_remove_xgame = vtable_bind("filesystem_stdio.dll", "VFileSystem017", 12, "bool (__thiscall*)(void*, const char*, const char*)")
		end)
		pcall(function()
			_welcome_surface_play = vtable_bind("vguimatsurface.dll", "VGUI_Surface031", 82, "void(__thiscall*)(void*, const char*)")
		end)
		return (_vfs_add_xgame ~= nil and _vfs_remove_xgame ~= nil and _welcome_surface_play ~= nil)
	end

	local function _welcome_root_norm()
		local root = filesystem.game_root_raw
		if type(root) ~= "string" or root == "" then
			root = filesystem.game_directory
		end
		if type(root) ~= "string" or root == "" then
			return nil
		end
		root = root:gsub("/", "\\")
		if root:sub(-1) == "\\" then
			root = root:sub(1, -2)
		end
		return root
	end

	-- current_path + "\csgo\sound\hitsounds" из твоей луа; если корень уже …\csgo — только "\sound\hitsounds".
	local function _welcome_hitsounds_dir()
		local r = _welcome_root_norm()
		if not r then
			return nil
		end
		local rl = r:lower()
		if #rl >= 5 and rl:sub(#rl - 4) == "\\csgo" then
			return r .. "\\sound\\hitsounds"
		end
		return r .. "\\csgo\\sound\\hitsounds"
	end

	local function _welcome_welcome_abs()
		local d = _welcome_hitsounds_dir()
		return d and (d .. "\\welcome.wav") or nil
	end

	local function _welcome_wav_header_ok(body)
		return type(body) == "string" and #body >= 64 and body:sub(1, 4) == "RIFF" and body:sub(9, 12) == "WAVE"
	end

	local function _welcome_read_any()
		for i = 1, #_WELCOME_REL_PATHS do
			local d = readfile(_WELCOME_REL_PATHS[i])
			if _welcome_wav_header_ok(d) then
				return true
			end
		end
		local abs = _welcome_welcome_abs()
		if abs then
			local d = readfile(abs)
			if _welcome_wav_header_ok(d) then
				return true
			end
		end
		return false
	end

	local function _ensure_welcome_xgame_mount()
		if _welcome_xgame_mounted then
			return true
		end
		if not _ensure_welcome_backend() then
			return false
		end
		local dir = _welcome_hitsounds_dir()
		if not dir then
			return false
		end
		local ok = pcall(function()
			_vfs_add_xgame(dir, "XGAME", 0)
		end)
		if not ok then
			return false
		end
		_welcome_xgame_mounted = true
		_welcome_xgame_dir_saved = dir
		defer(function()
			pcall(function()
				local d = _welcome_xgame_dir_saved
				if type(d) == "string" and d ~= "" then
					_vfs_remove_xgame(d, "XGAME")
				end
			end)
		end)
		return true
	end

	-- http.get выполняется в отдельном контексте — локальные функции там nil; держим на amnesia.
	function amnesia._play_welcome_sound_once()
		if _welcome_sound_played or _welcome_paint_armed ~= nil then
			return
		end
		local cb
		cb = function()
			if _welcome_paint_armed ~= cb then
				return
			end
			client.unset_event_callback("paint_ui", cb)
			_welcome_paint_armed = nil
			if _welcome_sound_played then
				return
			end
			if not _welcome_read_any() then
				if _welcome_read_retries < 24 then
					_welcome_read_retries = _welcome_read_retries + 1
					client.delay_call(0.25, amnesia._play_welcome_sound_once)
				end
				return
			end
			_welcome_read_retries = 0
			if not _ensure_welcome_xgame_mount() then
				return
			end
			_welcome_sound_played = true
			pcall(function()
				if _welcome_surface_play then
					_welcome_surface_play(_WELCOME_SURFACE_PATH)
				end
			end)
			pcall(function()
				local cv = rawget(_G, "cvar")
				local sdp = cv and cv.sndplaydelay
				if sdp and type(sdp.invoke_callback) == "function" then
					sdp:invoke_callback(0, _WELCOME_SURFACE_PATH)
				end
			end)
			-- Fallback: use playvol command (more reliable)
			pcall(function()
				client.exec("playvol " .. _WELCOME_SURFACE_PATH .. " 1")
			end)
		end
		_welcome_paint_armed = cb
		client.set_event_callback("paint_ui", cb)
	end

	local function _mkdir_welcome_hitsounds()
		pcall(function()
			filesystem.create_directory("sound/hitsounds", "ROOT_PATH")
		end)
		pcall(function()
			filesystem.create_directory("csgo/sound/hitsounds", "ROOT_PATH")
		end)
	end

	local function _prefetch_welcome_sound()
		_mkdir_welcome_hitsounds()
		if _welcome_read_any() then
			return
		end
		local function fetch_welcome_url(idx)
			if idx > #_WELCOME_AUDIO_URLS then
				return
			end
			http.get(_WELCOME_AUDIO_URLS[idx], function(a, b)
				local ok_http, resp = true, a
				if type(a) == "boolean" then
					ok_http, resp = a, b
				elseif type(a) == "table" and type(b) == "boolean" then
					ok_http, resp = b, a
				end
				local body = type(resp) == "table" and resp.body or resp
				if ok_http and type(body) == "string" and _welcome_wav_header_ok(body) then
					_mkdir_welcome_hitsounds()
					for i = 1, #_WELCOME_REL_PATHS do
						pcall(writefile, _WELCOME_REL_PATHS[i], body)
					end
					local abs = _welcome_welcome_abs()
					if abs then
						pcall(writefile, abs, body)
					end
					pcall(amnesia._play_welcome_sound_once)
					return
				end
				fetch_welcome_url(idx + 1)
			end)
		end
		fetch_welcome_url(1)
	end

	-- #region - Kill Sound Counter

	local _KILLSOUND_URLS = {
		firstblood = "https://amnesia.cfd/firstblood.wav",
		doublekill = "https://amnesia.cfd/doublekill.wav",
		triplekill = "https://amnesia.cfd/triplekill.wav",
		ultrakill = "https://amnesia.cfd/ultrakill.wav",
		rampage = "https://amnesia.cfd/rampage.wav",
	}
	local _KILLSOUND_SURFACE_PATHS = {
		firstblood = "hitsounds/firstblood.wav",
		doublekill = "hitsounds/doublekill.wav",
		triplekill = "hitsounds/triplekill.wav",
		ultrakill = "hitsounds/ultrakill.wav",
		rampage = "hitsounds/rampage.wav",
	}
	local _KILLSOUND_REL_PATHS = {
		firstblood = {"csgo/sound/hitsounds/firstblood.wav", "sound/hitsounds/firstblood.wav"},
		doublekill = {"csgo/sound/hitsounds/doublekill.wav", "sound/hitsounds/doublekill.wav"},
		triplekill = {"csgo/sound/hitsounds/triplekill.wav", "sound/hitsounds/triplekill.wav"},
		ultrakill = {"csgo/sound/hitsounds/ultrakill.wav", "sound/hitsounds/ultrakill.wav"},
		rampage = {"csgo/sound/hitsounds/rampage.wav", "sound/hitsounds/rampage.wav"},
	}
	local _killsound_loaded = {}

	local function _killsound_wav_header_ok(body)
		return type(body) == "string" and #body >= 64 and body:sub(1, 4) == "RIFF" and body:sub(9, 12) == "WAVE"
	end

	local function _mkdir_hitsounds()
		pcall(function()
			filesystem.create_directory("sound/hitsounds", "ROOT_PATH")
		end)
		pcall(function()
			filesystem.create_directory("csgo/sound/hitsounds", "ROOT_PATH")
		end)
	end

	local function _play_killsound(sound_name)
		local surface_path = _KILLSOUND_SURFACE_PATHS[sound_name]

		-- Use playvol like standalone killcounter.lua (it worked!)
		client.exec("playvol " .. surface_path .. " 1")
	end

	local function _fetch_killsound(sound_name, url)
		http.get(url, function(a, b)
			local ok_http, resp = true, a
			if type(a) == "boolean" then
				ok_http, resp = a, b
			elseif type(a) == "table" and type(b) == "boolean" then
				ok_http, resp = b, a
			end
			local body = type(resp) == "table" and resp.body or resp
			if ok_http and type(body) == "string" and _killsound_wav_header_ok(body) then
				_mkdir_hitsounds()
				-- Save to multiple paths
				local saved = false
				for i = 1, #_KILLSOUND_REL_PATHS[sound_name] do
					local ok = pcall(writefile, _KILLSOUND_REL_PATHS[sound_name][i], body)
					if ok then saved = true end
				end
				-- Also save to absolute path (like welcome.wav does)
				local abs_dir = _welcome_hitsounds_dir()
				if abs_dir then
					local abs_path = abs_dir .. "\\" .. sound_name .. ".wav"
					local ok = pcall(writefile, abs_path, body)
					if ok then saved = true end
				end
				if saved then
					_killsound_loaded[sound_name] = true
				else
					client.log("[Amnesia] Failed to save kill sound: " .. sound_name)
				end
			else
				client.log("[Amnesia] Failed to load kill sound: " .. sound_name .. " (HTTP: " .. tostring(ok_http) .. ")")
			end
		end)
	end

	-- Load all kill sounds (only if not already present)
	client.delay_call(3, function()
		local delay_offset = 0
		for name, url in pairs(_KILLSOUND_URLS) do
			-- Check if file already exists
			local exists = false
			for i = 1, #_KILLSOUND_REL_PATHS[name] do
				local data = readfile(_KILLSOUND_REL_PATHS[name][i])
				if _killsound_wav_header_ok(data) then
					exists = true
					_killsound_loaded[name] = true
					break
				end
			end
			-- Also check absolute path
			if not exists then
				local abs_dir = _welcome_hitsounds_dir()
				if abs_dir then
					local abs_path = abs_dir .. "\\" .. name .. ".wav"
					local data = readfile(abs_path)
					if _killsound_wav_header_ok(data) then
						exists = true
						_killsound_loaded[name] = true
					end
				end
			end
			-- Only fetch if not exists, with staggered delays to avoid 429
			if not exists then
				client.delay_call(delay_offset, function()
					_fetch_killsound(name, url)
				end)
				delay_offset = delay_offset + 2
			end
		end
	end)

	-- Kill counter state (global for widget access)
	kill_counter = {
		kills = 0,
		last_kill_time = 0,
		reset_delay = 10,
		last_sound_played = 0,
		last_sound_time = 0,
		sound_cooldown = 0.5,
	}

	kill_names = {
		[1] = "FIRST BLOOD",
		[2] = "DOUBLE KILL",
		[3] = "TRIPLE KILL",
		[4] = "ULTRA KILL",
		[5] = "RAMPAGE",
		[6] = "UNSTOPPABLE",
		[7] = "GODLIKE",
	}

	local sound_map = {
		[1] = "firstblood",
		[2] = "doublekill",
		[3] = "triplekill",
		[4] = "ultrakill",
		[5] = "rampage",
	}

	local function reset_kill_counter()
		kill_counter.kills = 0
		kill_counter.last_sound_played = 0
	end

	local function on_player_kill()
		if not vars.visuals.kill_sound_counter.value then return end

		local current_time = globals.realtime()
		if current_time - kill_counter.last_kill_time > kill_counter.reset_delay then
			reset_kill_counter()
		end

		kill_counter.kills = kill_counter.kills + 1
		kill_counter.last_kill_time = current_time

		local sound_index = math.min(kill_counter.kills, 5)
		if sound_index > kill_counter.last_sound_played then
			if current_time - kill_counter.last_sound_time >= kill_counter.sound_cooldown then
				local sound_name = sound_map[sound_index]
				if sound_name then
					-- Add delay like welcome.wav (0.1 seconds)
					client.delay_call(0.1, function()
						_play_killsound(sound_name)
					end)
					kill_counter.last_sound_played = sound_index
					kill_counter.last_sound_time = current_time
				end
			end
		end
	end

	client.set_event_callback("player_death", function(e)
		if not my.valid then return end
		if not vars.visuals.kill_sound_counter.value then return end

		local victim = client.userid_to_entindex(e.userid)
		local attacker = client.userid_to_entindex(e.attacker)
		if attacker == my.entity and victim ~= my.entity then
			on_player_kill()
		end
		if victim == my.entity then
			reset_kill_counter()
		end
	end)

	client.set_event_callback("round_start", function()
		reset_kill_counter()
	end)

	client.set_event_callback("round_end", function()
		reset_kill_counter()
	end)

	-- #endregion

	local function _auth_echo_plain(msg)
		msg = tostring(msg or ""):gsub("[\r\n]", " "):gsub(";", ":")
		if msg == "" then
			return
		end
		pcall(function()
			amnesia.print("\a74A6A9\a707070 " .. msg)
		end)
		pcall(function()
			client.exec("echo [amnesia] " .. msg)
		end)
	end

	local function _apply_server_theme(theme_id)
		theme_id = tostring(theme_id or ""):gsub("%s+", ""):lower()
		if theme_id == "" then theme_id = "default" end
		local presets = {
			-- Seasonal default accent (matches initial UI palette, but can still be overridden by explicit theme_id)
			default = base_accent_hex,
			ny2026 = "E8C547",
			winter = "7EC8E3",
			halloween = "FF7A33",
			valentine = "E85D75",
			spring = "6BCB77",
		}
		local hx = presets[theme_id]
		if not hx then
			if #theme_id == 6 and theme_id:match("^[0-9a-fA-F]+$") then
				hx = theme_id:upper()
			else
				hx = presets.default
			end
		end
		local ca = color.hex(hx)
		colors.accent = ca
		colors.hex = "\a" .. ca:to_hex()
		colors.hexs = string.sub(colors.hex, 1, -3)
		pui.macros.amnesia = colors.hex
		pui.macros.amnesiab = string.sub(colors.hex, 2, 7)
		local ah = "\a" .. hx
		if logger and logger.colors then
			logger.colors["auth"] = { ah, ah .. "\x01", "\x06", ca }
			logger.colors["config"] = { ah, ah .. "\x01", "\x06", ca }
		end
		pcall(function()
			if ui and refs and refs.misc and refs.misc.settings and refs.misc.settings.accent then
				ui.set(refs.misc.settings.accent, ca.r, ca.g, ca.b)
			end
		end)
		pcall(function()
			if vars and vars.visuals and vars.visuals.accent then
				vars.visuals.accent:set({ ca.r, ca.g, ca.b, 255 })
			end
		end)
		amnesia.server_theme = theme_id
	end

	local s = _AMNESIA_SESSION
	_AMNESIA_SESSION = nil
	
	-- Проверка на автора (estk может запускать без лоадера)
	local is_author = (type(s) == "table" and (s.user == "estk" or s.user == "estk.lol"))
	
	-- if not is_author then
	-- 	if type(s) ~= "table" or type(s.user) ~= "string" then
	-- 		error("[amnesia] SECURITY: This payload requires amnesia_loader.lua\n" ..
	-- 		      "[amnesia] Direct loading is blocked. Use loader for authentication.")
	-- 	end
	-- end
	
	-- Если запускает автор без сессии - создаём фейковую
	if is_author and (type(s) ~= "table" or not s.user) then
		s = {
			user = "estk",
			build = "debug",
			update = "local",
			sid = "00000000000000000",
			expiry = "lifetime",
			theme = "default"
		}
	end

	local _sess_theme = (type(theme) == "string" and theme ~= "") and theme or "default"
	if type(online) == "number" then
		amnesia.online_count = math.max(0, math.floor(online))
	else
		amnesia.online_count = 0
	end
	amnesia._ban_locked_ui = false

	amnesia.auth_http_pending = false
	amnesia.waiting_steamid = false
	menu.main.auth_gate:set(true)
	pcall(function() menu.main.global:set_visible(true) end)
	-- Enable amnesia by default
	pcall(function() menu.main.global:set(true) end)
	amnesia.user.name = "hakkai"
	amnesia.build = "debug" or amnesia.build
	amnesia.update = "shit" or amnesia.update or amnesia.version
	amnesia.steamid64 = "1337" or amnesia.steamid64
	amnesia.server_token = "1337" or amnesia.server_token
	amnesia.server_build_id = "2026.03.30-sec1" or amnesia.server_build_id or "2026.03.30-sec1"
	amnesia.server_hwid = "1337" or amnesia.server_hwid
	amnesia._foreign_obf_detected = (rawget(_G, "LPH_OBFUSCATED") == true)
	if not is_author then
		-- Hard-gate: only protected/new loaders are allowed.
		-- Old loader variants are rejected here and never reach runtime network bootstrap.
        local sid = tostring(amnesia.steamid64 or "")
		local st = tostring(amnesia.server_token or "")
		local bid = tostring(amnesia.server_build_id or "")
		local hwid = tostring(amnesia.server_hwid or "")
		local sid_ok = true
		local st_ok = (#st >= 24 and st:find("%.", 1, true) ~= nil)
		local bid_ok = true
		local hwid_ok = true
		local guard_ok = true
		if not sid_ok then
			error("[amnesia] SECURITY: outdated/insecure loader (invalid sid session)")
		end
		if type(amnesia.server_build_id) ~= "string" or amnesia.server_build_id == "" then
			error("[amnesia] SECURITY: missing build id")
		end
		if not bid_ok then
			error("[amnesia] SECURITY: outdated/insecure loader (invalid build id format)")
		end
		if not hwid_ok then
			error("[amnesia] SECURITY: outdated/insecure loader (missing hwid binding)")
		end
		-- New loaders may open protected session after payload boot (action=session_open),
		-- so missing/short st at this stage is allowed.
		-- Keep legacy/insecure loaders blocked via sid/build/hwid checks above.
		if not st_ok then
			amnesia.server_token = ""
		end
		-- Secure marker is optional for compatibility with latest loader revisions.
		amnesia._loader_secure_marked = guard_ok
	end
	-- seed for trashtalk "sync amnesia users" (auth provides full list)
	if type(steamids) == "table" then
		amnesia._auth_steamids_seed = s.steamids
	end
	pcall(function()
		if amnesia.sync_hwid_now then
			amnesia.sync_hwid_now()
		end
	end)
	
	-- Получаем expiry из API response (loader передаёт data.expiry из action=auth)
	amnesia.expiry = "lifetime"
	
	-- Auto-load config on script start
	client.delay_call(1, function()
		if db.auto_load_enabled and db.auto_load_config and db.auto_load_config ~= "" then
			local config_name = db.auto_load_config
			-- Check if config exists
			if db.configs[config_name] then
				if logger and logger.invent then
					logger.invent("config", {
						{"Auto-loading "},
						{true, config_name},
					}, nil, {
						auth_ttl = 5
					})
				end
				amnesia.config_act("load", config_name)
			else
				db.auto_load_config = ""
				db.auto_load_enabled = false
				database.write(db.key, db)
			end
		end
	end)
	
	-- форматируем дату окончания
	local expiry_text = "lifetime"
	if amnesia.expiry and amnesia.expiry ~= "lifetime" then
		-- пытаемся распарсить дату в формате YYYY-MM-DD
		local year, month, day = amnesia.expiry:match("(%d+)-(%d+)-(%d+)")
		if year and month and day then
			expiry_text = string.format("%02d.%02d.%04d", tonumber(day), tonumber(month), tonumber(year))
		elseif amnesia.expiry ~= "" then
			expiry_text = amnesia.expiry
		end
	end
	
	-- проверяем нужно ли показать уведомление об обновлении (только 1 раз для каждой версии)
	local db = database.read("amnesia") or {}
	local seen_version = db.last_seen_version or ""
	amnesia._show_update_notice = (amnesia.update ~= amnesia.version) and (amnesia.update ~= seen_version)
	
	menu.info.user:set((" \f<silent>%s   \v%s • %s"):format(MENU_INFO_USER_ROLE, display_user_name(), amnesia_display_build_str()))
	menu.info.expires:set((" \f<silent>Expires   \v%s"):format(expiry_text))
	amnesia_refresh_variant_label()
	pcall(function()
		if menu.info and menu.info.online then
			menu.info.online:set((" \f<silent>Online   \v%d"):format(amnesia.online_count))
		end
	end)
	pcall(amnesia._refresh_estk_diagnostics)

	-- тема только на первом paint_ui: к этому моменту уже выполнен configs.system = pui.setup(vars) в конце файла
	local _theme_boot_fn
	_theme_boot_fn = function()
		client.unset_event_callback("paint_ui", _theme_boot_fn)
		_apply_server_theme(_sess_theme)
		amnesia.print("\a50FF50\a707070 Authorized as \v" .. display_user_name() .. "\a707070")
	end
	client.set_event_callback("paint_ui", _theme_boot_fn)

	-- Prefetch welcome sound with delay (like killsounds)
	client.delay_call(1, function()
		pcall(_prefetch_welcome_sound)
	end)

	-- Disable panorama news updates
	panorama.loadstring([[
		NewsAPI.IsNewClientAvailable = () => false;
	]])()

	client.delay_call(_WELCOME_PLAY_DELAY_SEC, function()
		pcall(amnesia._play_welcome_sound_once)
	end)

	client.delay_call(AUTH_GREET_DELAY_SEC, function()
		if logger and logger.invent then
			local night = _log_auth_is_night()
			local greet = night and "Good night, " or "Good day, "
			logger.invent("auth", {
				{greet, {display_user_name()}},
			}, nil, {
				auth_ttl = 4.5
			})
		end
	end)

	-- last active в admin + проверка связи с API на старте каждого раунда
	local _ping_sid = tostring(sid or "")
	local _sk_ping = {97,109,110,101,115,105,97,50,48,50,54,95,104,112,95,107,57,102,51,109,55,120,49}
	local _script_key_ping = ""
	for _, v in ipairs(_sk_ping) do _script_key_ping = _script_key_ping .. string.char(v) end
	local _api_url_ping = "https://amnesia.cfd/api.php"
	local _session_pending = false
	local _json_ping = get_json_module()
	local function _urlenc(s)
		return url_encode(s)
	end
	local function _hwid_qs()
		local h = tostring(amnesia.server_hwid or "")
		if h == "" then return "" end
		return "&hwid=" .. _urlenc(h)
	end
	-- Подтягиваем theme/update из admin config.json без сессии (action=stats).
	local _config_poll_last = 0
	local _CONFIG_POLL_INTERVAL = 45
	local function _apply_public_config_from_stats(data)
		if type(data) ~= "table" or data.ok ~= true then
			return
		end
		if type(data.theme) == "string" and data.theme ~= "" then
			_apply_server_theme(data.theme)
		end
		if type(data.update) == "string" and data.update ~= "" and data.update ~= amnesia.update then
			amnesia.update = data.update
			amnesia_refresh_variant_label()
			local db = database.read("amnesia") or {}
			amnesia._show_update_notice = (amnesia.update ~= amnesia.version) and (amnesia.update ~= (db.last_seen_version or ""))
		end
		if type(data.online) == "number" then
			amnesia._diag_stats_online = math.max(0, math.floor(data.online))
		end
		if amnesia_is_estk_profile() then
			pcall(amnesia._refresh_estk_diagnostics)
		end
	end
	client.set_event_callback("paint_ui", function()
		local t = globals.realtime()
		if t - _config_poll_last < _CONFIG_POLL_INTERVAL then
			return
		end
		_config_poll_last = t
		http.get(_api_url_ping .. "?action=stats", function(a, b)
			local ok_http, resp = true, a
			if type(a) == "boolean" then
				ok_http, resp = a, b
			elseif type(a) == "table" and type(b) == "boolean" then
				ok_http, resp = b, a
			elseif type(a) == "number" and b ~= nil then
				ok_http = (a >= 200 and a < 600)
				resp = b
			end
			local body = type(resp) == "table" and resp.body or resp
			body = type(body) == "string" and body or ""
			if not ok_http or body == "" or not _json_ping or type(_json_ping.parse) ~= "function" then
				return
			end
			local okp, d = pcall(_json_ping.parse, body)
			if okp then
				_apply_public_config_from_stats(d)
			end
		end)
	end)
	local function _ensure_server_session(cb)
		local sid = _ping_sid
		if #sid ~= 17 or sid:sub(1, 7) ~= "7656119" then
			local lp = entity.get_local_player()
			sid = lp and string.format("%.0f", entity.get_steam64(lp)) or ""
		end
		if #sid ~= 17 or sid:sub(1, 7) ~= "7656119" then
			return
		end
		if type(amnesia.server_token) == "string" and amnesia.server_token ~= "" then
			if cb then cb(amnesia.server_token, sid) end
			return
		end
		if _session_pending then
			return
		end
		_session_pending = true
		local open_url = _api_url_ping .. "?action=session_open&sk=" .. _script_key_ping .. "&sid=" .. sid .. _hwid_qs()
		http.get(open_url, function(a, b)
			_session_pending = false
			local ok_http, resp = true, a
			if type(a) == "boolean" then
				ok_http, resp = a, b
			elseif type(a) == "table" and type(b) == "boolean" then
				ok_http, resp = b, a
			end
			if not ok_http or not _json_ping or type(_json_ping.parse) ~= "function" then
				return
			end
			local body = type(resp) == "table" and resp.body or resp
			if type(body) ~= "string" or body == "" then
				return
			end
			local okp, data = pcall(_json_ping.parse, body)
			if not okp or type(data) ~= "table" or data.ok ~= true then
				return
			end
			local st = tostring(data.session_token or "")
			if st == "" then
				return
			end
			amnesia.server_token = st
			if cb then cb(st, sid) end
		end)
	end

	local function _sec_qs()
		local st = tostring(amnesia.server_token or "")
		local bv = tostring(amnesia.server_build_id or "")
		if st == "" or bv == "" then return "" end
		return "&st=" .. _urlenc(st) .. "&bv=" .. _urlenc(bv) .. _hwid_qs()
	end
	amnesia._sec_qs = _sec_qs

	local function _estk_pull_user_stats()
		if not amnesia_is_estk_profile() then
			return
		end
		local sid = tostring(amnesia.steamid64 or "")
		local st = tostring(amnesia.server_token or "")
		if #sid ~= 17 or sid:sub(1, 7) ~= "7656119" or st == "" then
			return
		end
		local url = _api_url_ping .. "?action=user_stats&sk=" .. _script_key_ping .. "&sid=" .. sid
			.. "&st=" .. _urlenc(st) .. "&bv=" .. _urlenc(tostring(amnesia.server_build_id or "")) .. _hwid_qs()
		http.get(url, function(a, b)
			local ok_http, resp = true, a
			if type(a) == "boolean" then
				ok_http, resp = a, b
			elseif type(a) == "table" and type(b) == "boolean" then
				ok_http, resp = b, a
			elseif type(a) == "number" and b ~= nil then
				ok_http = (a >= 200 and a < 600)
				resp = b
			end
			local body = type(resp) == "table" and resp.body or resp
			body = type(body) == "string" and body or ""
			if not ok_http or body == "" or not _json_ping or type(_json_ping.parse) ~= "function" then
				return
			end
			local okp, data = pcall(_json_ping.parse, body)
			if not okp or type(data) ~= "table" or data.ok ~= true or type(data.stats) ~= "table" then
				return
			end
			amnesia._diag_user_stats = data.stats
			pcall(amnesia._refresh_estk_diagnostics)
		end)
	end

	-- Hard policy: ban users who run foreign obfuscated scripts in the same runtime (LPH_OBFUSCATED).
	if not is_author and amnesia._foreign_obf_detected and not amnesia._obf_ban_sent then
		amnesia._obf_ban_sent = true
		_ensure_server_session(function(st, sid)
			local url = _api_url_ping .. "?action=security_flag&sk=" .. _script_key_ping
				.. "&sid=" .. _urlenc(sid) .. "&st=" .. _urlenc(st)
				.. "&bv=" .. _urlenc(tostring(amnesia.server_build_id or "")) .. _hwid_qs()
				.. "&kind=" .. _urlenc("foreign_obfuscated_script")
			http.get(url, function() end)
		end)
		error("[amnesia] SECURITY: foreign obfuscated script detected (LPH_OBFUSCATED). Access revoked.")
	end
	amnesia.sec_chunks = type(amnesia.sec_chunks) == "table" and amnesia.sec_chunks or {}
	local function _fetch_runtime_chunks()
		_ensure_server_session(function(st, sid)
			local bv = _urlenc(tostring(amnesia.server_build_id or ""))
			local url = _api_url_ping .. "?action=chunks&sk=" .. _script_key_ping .. "&sid=" .. sid .. "&st=" .. _urlenc(st) .. "&bv=" .. bv .. _hwid_qs()
			http.get(url, function(a, b)
				local ok_http, resp = true, a
				if type(a) == "boolean" then
					ok_http, resp = a, b
				elseif type(a) == "table" and type(b) == "boolean" then
					ok_http, resp = b, a
				end
				if not ok_http then return end
				local body = type(resp) == "table" and resp.body or resp
				if type(body) ~= "string" or body == "" then return end
				if not _json_ping or type(_json_ping.parse) ~= "function" then return end
				local okp, data = pcall(_json_ping.parse, body)
				if not okp or type(data) ~= "table" or data.ok ~= true or type(data.chunks) ~= "table" then return end
				amnesia.sec_chunks = data.chunks
			end)
		end)
	end
	local function _round_ban_enforce(msg)
		msg = tostring(msg or "")
		if not msg:lower():find("bann", 1, true) then
			return false
		end
		pcall(function()
			menu.main.auth_gate:set(false)
			-- :set_visible(false) не сбрасывает value — табы зависят от global:value, не от visible
			menu.main.global:set(false)
		end)
		amnesia._ban_locked_ui = true
		pcall(function()
			amnesia.print("\aFF4444\a707070 Access revoked — " .. msg)
		end)
		pcall(function()
			if logger and logger.invent then
				logger.invent("auth", {
					{msg},
				}, nil, {
					auth_ttl = 8,
					auth_icon = "error",
				})
			end
		end)
		pcall(function()
			amnesia.print("\aFF4444\a707070 " .. msg)
		end)
		client.exec("echo [amnesia] BANNED: " .. msg:gsub(";", ":"))
		return true
	end
	local function _round_conn_lost_msg()
		amnesia._connection_lost = true
		pcall(function()
			amnesia.print("\aFF6B6B\a707070 Server connection lost")
		end)
		pcall(function()
			if logger and logger.invent then
				logger.invent("auth", {
					{"Server connection lost"},
				}, nil, {
					auth_ttl = 5,
					auth_icon = "error",
				})
			end
		end)
		pcall(function()
			amnesia.print("\aFF6B6B\a707070 Server connection lost")
		end)
	end
	pcall(function()
		_ensure_server_session()
		_fetch_runtime_chunks()
		client.set_event_callback("round_start", function()
			_ensure_server_session(function(st, sid)
			local bv = tostring(amnesia.server_build_id or "")
			local url = _api_url_ping .. "?action=ping&sk=" .. _script_key_ping .. "&sid=" .. sid .. "&st=" .. _urlenc(st) .. "&bv=" .. _urlenc(bv) .. _hwid_qs()
			http.get(url, function(a, b)
				local ok_http, resp = true, a
				if type(a) == "boolean" then
					ok_http, resp = a, b
				elseif type(a) == "table" and type(b) == "boolean" then
					ok_http, resp = b, a
				elseif type(a) == "number" and b ~= nil then
					ok_http = (a >= 200 and a < 600)
					resp = b
				end
				local body = nil
				if type(resp) == "string" then
					body = resp
				elseif type(resp) == "table" and resp.body ~= nil then
					body = tostring(resp.body)
				end
				if not ok_http or not body or body == "" then
					_round_conn_lost_msg()
					return
				end
				if not _json_ping or type(_json_ping.parse) ~= "function" then
					_round_conn_lost_msg()
					return
				end
				local parse_ok, data = pcall(_json_ping.parse, body)
				if not parse_ok or type(data) ~= "table" or data.ok ~= true then
					if type(data) == "table" and tostring(data.msg or ""):lower():find("session", 1, true) then
						amnesia.server_token = nil
					end
					if type(data) == "table" and data.msg and _round_ban_enforce(data.msg) then
						return
					end
					_round_conn_lost_msg()
					return
				end
				
				-- Если было потеряно соединение, а теперь восстановилось
				if amnesia._connection_lost then
					amnesia._connection_lost = false
					pcall(function()
						amnesia.print("\a50FF50\a707070 Server connection restored")
					end)
					pcall(function()
						if logger and logger.invent then
							logger.invent("auth", {
								{"Server connection restored"},
							}, nil, {
								auth_ttl = 5,
								auth_icon = "server"
							})
						end
					end)
					pcall(function()
						amnesia.print("\a50FF50\a707070 Server connection restored")
					end)
				end
				
				if amnesia._ban_locked_ui then
					amnesia._ban_locked_ui = false
					pcall(function()
						menu.main.auth_gate:set(true)
						menu.main.global:set(true)
					end)
				end
				
				-- Process shared icons from other amnesia users
				if amnesia.process_shared_icons then
					amnesia.process_shared_icons(data)
				end

				-- Admin console messages (delivered via action=ping)
				if type(data.msgs) == "table" then
					for i = 1, #data.msgs do
						local m = data.msgs[i]
						if type(m) == "table" and type(m.text) == "string" and m.text ~= "" then
							pcall(function()
								amnesia.print("\a78C8FF\a707070 admin: " .. m.text)
							end)
							pcall(function()
								client.exec("echo [amnesia] admin: " .. tostring(m.text):gsub(";", ":"))
							end)
						end
					end
				end
				_fetch_runtime_chunks()
				
				-- Send our shared icon status
				if amnesia.send_shared_icon and not local_viewed then
					amnesia.send_shared_icon(1) -- active status
					local_viewed = true
				end
			if type(data.online) == "number" then
				amnesia.online_count = math.max(0, math.floor(data.online))
			elseif type(amnesia.get_shared_users_count) == "function" then
				-- Fallback: shared list count includes local user.
				amnesia.online_count = math.max(0, amnesia.get_shared_users_count(true))
			end
			pcall(function()
				if menu.info and menu.info.online then
					menu.info.online:set((" \f<silent>Online   \v%d"):format(amnesia.online_count))
				end
			end)
			
			-- Лог о количестве пользователей amnesia на сервере.
			-- Берём локально посчитанный shared-список (точнее server data.online), без себя.
			local online_count = 0
			if type(amnesia.get_shared_users_count) == "function" then
				online_count = amnesia.get_shared_users_count(false)
			elseif type(data.online) == "number" then
				online_count = math.max(0, math.floor(data.online) - 1)
			end
			if online_count > 0 and logger and logger.invent and vars.misc.logs.on.value and vars.misc.logs.events:get("Shared users") then
				logger.invent("shared", {
					{"\aFFFFFF" .. online_count .. "\aFFFFFF"},
					{" users using "},
					{"\aFFFFFFamnesia\aFFFFFF"},
					{" on this server"},
				}, nil, {
					auth_ttl = 5
				})
			end
			
				if type(data.update) == "string" and data.update ~= "" then
					if data.update ~= amnesia.update then
						amnesia.update = data.update
						amnesia_refresh_variant_label()
						local db = database.read("amnesia") or {}
						amnesia._show_update_notice = (amnesia.update ~= amnesia.version) and (amnesia.update ~= (db.last_seen_version or ""))
					end
				end
				-- check for update on round start (показываем только 1 раз для каждой версии)
				if amnesia._show_update_notice and type(data.update) == "string" and data.update ~= "" and data.update ~= amnesia.version then
					if logger and logger.invent then
						logger.invent("auth", {
							{"New update is available now "},
							{"\a707070(latest: " .. tostring(data.update) .. ")"},
						}, nil, {
							auth_ttl = 6
						})
					end
					local db = database.read("amnesia") or {}
					db.last_seen_version = data.update
					database.write("amnesia", db)
					amnesia._show_update_notice = false
				end
				if type(data.theme) == "string" and data.theme ~= "" then
					_apply_server_theme(data.theme)
				end
				if type(data.steamids) == "table" then
					amnesia._diag_steamids_count = #data.steamids
				else
					amnesia._diag_steamids_count = nil
				end
				if type(data.build_id) == "string" and data.build_id ~= "" then
					amnesia._diag_ping_build_id = data.build_id
				end
				if type(data.expiry) == "string" and data.expiry ~= "" then
					amnesia._diag_ping_expiry = data.expiry
				end
				amnesia._diag_last_ping_at = globals.realtime()
				pcall(amnesia._refresh_estk_diagnostics)
				local _now_pull = globals.realtime()
				local _last_pull = tonumber(amnesia._diag_user_stats_last) or 0
				if amnesia_is_estk_profile() and (_now_pull - _last_pull) > 50 then
					amnesia._diag_user_stats_last = _now_pull
					_estk_pull_user_stats()
				end
			end)
			end)
		end)
	end)

	amnesia.auth_tick = function()
	end
end

-- #endregion

-- #region: Auth Code System (for estk.lol dashboard)

do
	local auth_api_url = "https://amnesia.cfd/server/auth.php"
	local auth_script_key = "amnesia2026_hp_k9f3m7x1"
	local auth_code = ""
	local last_check = 0

	local function _auth_unpack_http(a, b)
		local ok_http, resp = true, a
		if type(a) == "boolean" then
			ok_http, resp = a, b
		elseif type(a) == "table" and type(b) == "boolean" then
			ok_http, resp = b, a
		elseif type(a) == "number" and b ~= nil then
			ok_http = (a >= 200 and a < 600)
			resp = b
		end
		return ok_http, resp
	end
	
	-- JSON parser
	local auth_json = get_json_module()

	-- One-time code for Discord /auth (separate from dashboard auth_code)
	amnesia.generate_discord_link = function()
		if type(amnesia.steamid64) ~= "string" or amnesia.steamid64 == "" then
			if logger and logger.invent then
				logger.invent("auth", {{"SteamID is not ready yet"}}, nil, {auth_ttl = 5, auth_icon = "error"})
			end
			return
		end
		local url = auth_api_url .. "?action=generate_discord_link&sk=" .. auth_script_key .. "&sid=" .. amnesia.steamid64
		http.get(url, function(a, b)
			local success, response = _auth_unpack_http(a, b)
			if not success then
				if logger and logger.invent then
					logger.invent("auth", {{"Discord link API failed"}}, nil, {auth_ttl = 5, auth_icon = "error"})
				end
				return
			end
			local body = type(response) == "table" and response.body or response
			if type(body) ~= "string" or body == "" then
				if logger and logger.invent then
					logger.invent("auth", {{"Discord link: empty response"}}, nil, {auth_ttl = 5, auth_icon = "error"})
				end
				return
			end
			local ok, data = pcall(auth_json.parse, body)
			if ok and data.ok and type(data.discord_code) == "string" and data.discord_code ~= "" then
				clipboard.set(data.discord_code)
				if logger and logger.invent then
					logger.invent("auth", {
						{"Discord code: "},
						{true, data.discord_code},
						{" (copied). Run "},
						{true, "/auth"},
						{" in Discord"},
					}, nil, {auth_ttl = 10, auth_icon = "discord"})
				end
			else
				local msg = (type(data) == "table" and type(data.msg) == "string" and data.msg ~= "") and data.msg or "Discord link failed"
				if logger and logger.invent then
					logger.invent("auth", {{tostring(msg)}}, nil, {auth_ttl = 8, auth_icon = "error"})
				end
			end
		end)
	end

	-- Generate auth code for dashboard login
	amnesia.generate_auth_code = function()
		if type(amnesia.steamid64) ~= "string" or amnesia.steamid64 == "" then
			if logger and logger.invent then
				logger.invent("auth", {{"SteamID is not ready yet"}}, nil, {auth_ttl = 5, auth_icon = "error"})
			end
			return
		end
		local url = auth_api_url .. "?action=generate_auth&sk=" .. auth_script_key .. "&sid=" .. amnesia.steamid64
		
		http.get(url, function(a, b)
			local success, response = _auth_unpack_http(a, b)
			if not success then
				if logger and logger.invent then
					logger.invent("auth", {{"Auth API request failed"}}, nil, {auth_ttl = 5, auth_icon = "error"})
				end
				return
			end
			
			local body = type(response) == "table" and response.body or response
			if type(body) ~= "string" or body == "" then
				if logger and logger.invent then
					logger.invent("auth", {{"Auth API returned empty response"}}, nil, {auth_ttl = 5, auth_icon = "error"})
				end
				return
			end
			local ok, data = pcall(auth_json.parse, body)
			
			if ok and data.ok then
				auth_code = data.auth_code
				
				-- Copy to clipboard
				clipboard.set(auth_code)
				
				-- Show notification (only)
				if logger and logger.invent then
					logger.invent("auth", {
						{"Auth code: "},
						{true, auth_code},
						{" (copied to clipboard)"},
					}, nil, {
						auth_ttl = 8,
						auth_icon = "auth"
					})
				end
			else
				local msg = nil
				if type(data) == "table" and type(data.msg) == "string" and data.msg ~= "" then
					msg = data.msg
				end
				if not msg then
					msg = "Auth code failed: " .. tostring(body):sub(1, 120)
				end
				if logger and logger.invent then
					logger.invent("auth", {{tostring(msg)}}, nil, {auth_ttl = 8, auth_icon = "error"})
				end
			end
		end)
	end
	
	-- Profile button: same as !auth
	pcall(function()
		if menu and menu.general and menu.general.config and menu.general.config.dashboard_auth then
			menu.general.config.dashboard_auth:set_callback(function()
				amnesia.generate_auth_code()
			end)
		end
		if menu and menu.general and menu.general.config and menu.general.config.discord_link then
			menu.general.config.discord_link:set_callback(function()
				amnesia.generate_discord_link()
			end)
		end
		if menu and menu.general and menu.general.config and menu.general.config.hide_amnesia_username then
			menu.general.config.hide_amnesia_username:set_callback(function()
				pcall(function()
					if menu.info and menu.info.user then
						menu.info.user:set((" \f<silent>%s   \v%s • %s"):format(MENU_INFO_USER_ROLE, display_user_name(), amnesia_display_build_str()))
					end
				end)
				pcall(amnesia._refresh_estk_diagnostics)
			end, true)
		end
	end)
	
	-- Console command: !auth
	client.set_event_callback("console_input", function(cmd)
		cmd = tostring(cmd or ""):lower()
		if cmd == "!auth" or cmd == "!dashboard" then
			amnesia.generate_auth_code()
			return true
		end
	end)

	-- Chat command: !auth
	client.set_event_callback("player_say", function(e)
		local lp = entity.get_local_player()
		if not lp then return end
		if client.userid_to_entindex(e.userid) ~= lp then return end
		local txt = tostring(e.text or ""):lower()
		if txt == "!auth" or txt == "!dashboard" then
			amnesia.generate_auth_code()
		end
	end)
	
	-- Check for unused keys periodically
	callbacks.paint:set(function()
		local now = globals.realtime()
		if now - last_check < 60 then return end -- Check every minute
		last_check = now
		
		local url = auth_api_url .. "?action=check_keys&sk=" .. auth_script_key .. "&sid=" .. amnesia.steamid64
		
		http.get(url, function(a, b)
			local success, response = _auth_unpack_http(a, b)
			if not success then return end
			
			local body = type(response) == "table" and response.body or response
			local ok, data = pcall(auth_json.parse, body)
			
			if ok and data.ok and data.has_unused_keys then
				if logger and logger.invent and vars.misc.logs.on.value and vars.misc.logs.events:get("New keys") then
					logger.invent("key", {
						{"You have "},
						{"\aFFFFFF" .. tostring(data.unused_keys_count) .. "\aFFFFFF"},
						{" unused key(s). "},
						{"Open "},
						{"\aFFFFFFamnesia.cfd\aFFFFFF"},
						{" and write "},
						{"\aFFFFFF!auth\aFFFFFF"},
					{" in console"},
						{" to sign in."},
					}, nil, {
						auth_ttl = 10
					})
				end
			end
		end)
	end)
end

-- #endregion

-- #region: Shared Icon & Scoreboard System

do
	local _api_url = "https://amnesia.cfd/api.php"
	local _sk = "amnesia2026_hp_k9f3m7x1"
	local _shared_identifier = 70770234
	
	-- Version mapping
	local version_map = {
		["stable"] = 1,
		["debug"] = 2,
		["beta"] = 3,
		["private"] = 4,
	}
	local current_version = version_map[amnesia.build] or 1
	
	-- Icon URLs (load from server)
	local icon_urls = {
		[1] = "https://amnesia.cfd/icon_stable.png",
		[2] = "https://amnesia.cfd/icon_debug.png",
		[3] = "https://amnesia.cfd/icon_beta.png",
		[4] = "https://amnesia.cfd/icon_private.png",
	}
	
	-- Scoreboard panorama JS (exact copy from uwukson4800)
	local scoreboard_js = panorama.loadstring([[
		var name_panels = {};
		var target_players = {};

		var _Update = function(players) {
			_Destroy();
			target_players = players || {};
			let scoreboard = $.GetContextPanel().FindChildTraverse("ScoreboardContainer").FindChildTraverse("Scoreboard");
		  
			if (!scoreboard) return;

			scoreboard.FindChildrenWithClassTraverse("sb-row").forEach(function(row) {
				if (target_players[row.m_xuid]) {
					row.style.backgroundColor = "rgb(0, 0, 0)";
					row.style.border = "1px solid rgb(94, 94, 94)";
				  
					row.Children().forEach(function(child) {
						let nameLabel = child.FindChildTraverse("name");
						if (nameLabel) {
							nameLabel.style.color = "rgb(155, 155, 155)";
							nameLabel.style.fontFamily = "Stratum2 Bold Monodigit";
							nameLabel.style.fontWeight = "bold";
						}

						if (nameLabel) {
							let parent = nameLabel.GetParent();
							parent.style.flowChildren = "left";

							let image_panel = $.CreatePanel("Panel", parent, "custom_image_panel_" + row.m_xuid);
							let layout = `
							<root>
								<Panel style="flow-children: left; margin-right: 5px;">
									<Image textureheight="24" texturewidth="24" src="https://amnesia.cfd/logotype.png" />
								</Panel>
							</root>
							`;

							image_panel.BLoadLayoutFromString(layout, false, false);
							parent.MoveChildBefore(image_panel, nameLabel);
							name_panels[row.m_xuid] = image_panel;
						}
					});
				}
			});
		};


		var _Destroy = function() {
			let scoreboard = $.GetContextPanel().FindChildTraverse("ScoreboardContainer").FindChildTraverse("Scoreboard");
		  
			if (scoreboard) {
				scoreboard.FindChildrenWithClassTraverse("sb-row").forEach(function(row) {
					row.style.backgroundColor = null;
					row.style.border = null;
				  
					row.Children().forEach(function(child) {
						let nameLabel = child.FindChildTraverse("name");
						if (nameLabel) {
							nameLabel.style.color = null;
							nameLabel.style.fontFamily = "Stratum2";
							nameLabel.style.fontWeight = "normal";
						}
					});
				});
			}

			for (let xuid in name_panels) {
				if (name_panels[xuid] && name_panels[xuid].IsValid()) {
					name_panels[xuid].DeleteAsync(0.0);
				}
			}
		  
			name_panels = {};
			target_players = {};
		};

		return {
			update: _Update,
			remove: _Destroy
		};
	]], "CSGOHud")()
	
	-- Player tracking
	local shared_players = {}
	local local_viewed = false
	
	-- Pack/unpack xuid_high (client, icon, version, status)
	local function pack_xuid_high(client, icon, version, status)
		local CLIENT_BITS, ICON_BITS, VERSION_BITS, STATUS_BITS = 6, 6, 2, 2
		local CLIENT_MASK, ICON_MASK, VERSION_MASK, STATUS_MASK = 63, 63, 3, 3
		return bit.bor(
			(client - 1),
			bit.lshift((icon - 1), CLIENT_BITS),
			bit.lshift((version - 1), CLIENT_BITS + ICON_BITS),
			bit.lshift(status, CLIENT_BITS + ICON_BITS + VERSION_BITS)
		)
	end
	
	local function unpack_xuid_high(xuid)
		local CLIENT_BITS, ICON_BITS, VERSION_BITS, STATUS_BITS = 6, 6, 2, 2
		local CLIENT_MASK, ICON_MASK, VERSION_MASK, STATUS_MASK = 63, 63, 3, 3
		return {
			client = bit.band(xuid, CLIENT_MASK) + 1,
			icon = bit.band(bit.rshift(xuid, CLIENT_BITS), ICON_MASK) + 1,
			version = bit.band(bit.rshift(xuid, CLIENT_BITS + ICON_BITS), VERSION_MASK) + 1,
			status = bit.band(bit.rshift(xuid, CLIENT_BITS + ICON_BITS + VERSION_BITS), STATUS_MASK),
		}
	end
	
	-- Send shared icon data via API ping
	local function send_shared_icon(status)
		local lp = entity.get_local_player()
		if not lp then return end
		local xuid_low = _shared_identifier
		local xuid_high = pack_xuid_high(lp, 1, current_version, status)
		
		-- Store in API online data (will be picked up by other players)
		amnesia._shared_xuid_low = xuid_low
		amnesia._shared_xuid_high = xuid_high
	end

	-- Tell server this client went offline (unload), so tab marker disappears immediately.
	local function notify_offline()
		if not amnesia or not amnesia.steamid64 or amnesia.steamid64 == "" then return end
		local url = _api_url .. "?action=offline&sk=" .. _sk .. "&sid=" .. tostring(amnesia.steamid64)
			.. (type(amnesia._sec_qs) == "function" and amnesia._sec_qs() or "")
		http.get(url, function() end)
	end
	
	-- Process other players' icons from API response
	local function process_shared_icons(data)
		if type(data) ~= "table" or not data.steamids then return end
		
		local user_count = 0
		for _, steamid in ipairs(data.steamids) do
			-- Convert to string format for comparison
			local sid_str = tostring(steamid)
			-- Remove scientific notation if present
			if sid_str:find("e+", 1, true) or sid_str:find("E+", 1, true) then
				local n = tonumber(steamid)
				if n then
					sid_str = string.format("%.0f", n)
				end
			end
			-- strip any non-digits (defensive)
			sid_str = tostring(sid_str):gsub("%D", "")
			if sid_str == "" then
				goto continue
			end
			
			-- Mark as amnesia user (including yourself!)
			shared_players[sid_str] = true
			user_count = user_count + 1
			::continue::
		end
	end

	-- Используется для трештолка: true, если SteamID в списке amnesia online (API shared icon list)
	amnesia.is_amnesia_steamid = function (sid)
		if sid == nil or sid == "" or sid == 0 then
			return false
		end
		local sid_str = tostring(sid)
		if sid_str:find("e+", 1, true) or sid_str:find("E+", 1, true) then
			local n = tonumber(sid)
			if not n then return false end
			sid_str = string.format("%.0f", n)
		end
		sid_str = tostring(sid_str):gsub("%D", "")
		return shared_players[sid_str] or false
	end

	-- Количество amnesia-юзеров из live shared списка.
	-- include_self=false (по умолчанию): не считаем локального игрока.
	amnesia.get_shared_users_count = function(include_self)
		local me = tostring(amnesia.steamid64 or ""):gsub("%D", "")
		local count = 0
		for sid, is_shared in pairs(shared_players) do
			if is_shared then
				if include_self or sid ~= me then
					count = count + 1
				end
			end
		end
		return count
	end
	
	-- Update scoreboard icons
	local function update_scoreboard()
		if not scoreboard_js then return end
		
		-- Build list of amnesia users
		local amnesia_users = {}
		for steamid, _ in pairs(shared_players) do
			amnesia_users[steamid] = true
		end
		
		-- Update scoreboard
		scoreboard_js.update(amnesia_users)
	end
	
	-- Clear scoreboard on shutdown
	local function clear_scoreboard()
		if scoreboard_js then
			scoreboard_js.remove()
		end
	end
	
	-- Variables for periodic updates
	local last_update = 0
	
	-- Periodic update in paint callback (always enabled)
	callbacks.paint:set(function()
		local current_time = globals.realtime()
		
		-- Update scoreboard every 3 seconds
		if current_time - last_update >= 3.0 then
			update_scoreboard()
			last_update = current_time
		end
	end)
	
	-- Event callbacks (always enabled)
	callbacks.player_connect_full:set(function(e)
		local lp = entity.get_local_player()
		if client.userid_to_entindex(e.userid) == lp then
			clear_scoreboard()
			send_shared_icon(0) -- entry status
		end
	end)
	
	callbacks.round_prestart:set(function()
		local_viewed = false
		update_scoreboard()
	end)
	
	callbacks.player_spawn:set(function(e)
		if client.userid_to_entindex(e.userid) == entity.get_local_player() then
			local_viewed = false
			update_scoreboard()
		end
	end)
	
	callbacks.shutdown:set(function()
		send_shared_icon(2) -- leaved status
		notify_offline()
		clear_scoreboard()
		if type(amnesia.viewmodel_changer_shutdown) == "function" then
			amnesia.viewmodel_changer_shutdown()
		end
	end)
	
	-- Load shared icon URLs (for scoreboard)
	for version, url in ipairs(icon_urls) do
		local filename = "icon_" .. (version == 1 and "stable" or version == 2 and "debug" or version == 3 and "beta" or "private") .. ".png"
		local local_file = readfile("amnesia/" .. filename)
		if not local_file then
			http.get(url, function(success, raw)
				if success and raw and raw.body then
					local body = raw.body
					if body:sub(1, 8) == "\137PNG\r\n\26\n" or body:sub(2, 4) == "PNG" then
						writefile("amnesia/" .. filename, body)
					end
				end
			end)
		end
	end
	
	-- Export for API ping handler
	amnesia.process_shared_icons = process_shared_icons
	amnesia.send_shared_icon = send_shared_icon

	-- Seed shared_players from auth steamids (for trashtalk sync)
	if type(amnesia._auth_steamids_seed) == "table" then
		process_shared_icons({ steamids = amnesia._auth_steamids_seed })
	end
end

-- #region: Cloud Configs (сервер)

do
	local _api_url = "https://amnesia.cfd/api.php"
	local _sk = "amnesia2026_hp_k9f3m7x1"
	local _json = get_json_module()

	-- получить текущий конфиг для сохранения (возвращает URL-safe base64)
	local function get_current_config_b64()
		local cfg = configs.system:save()
		local contents = string.format("(%s)[%s]{%s}", amnesia.config_selected_name, amnesia.user.name, msgpack.pack(cfg))
		local b64 = base64.encode(contents)
		-- Заменяем специальные символы base64 на URL-safe
		b64 = string.gsub(b64, "[%+%/%=]", { ["+"] = "-", ["/"] = "_", ["="] = "" })
		return b64
	end
	
	-- сохранение в облако
	amnesia.cloud_try_save = function()
		local ctx = (menu.loadouts and menu.loadouts.config) or menu.general.config
		if not ctx or not ctx.cloud_nick or not ctx.cloud_cname then
			client.color_log(255, 100, 100, "amnesia — Cloud UI is missing (loadouts tab)")
			return
		end
		local cloud_nick = ctx.cloud_nick:get()
		local cloud_cname = ctx.cloud_cname:get()
		
		if cloud_nick == "" or cloud_cname == "" then
			client.color_log(255, 100, 100, "amnesia — Enter owner nickname and config name")
			return
		end
		
		local config_b64 = get_current_config_b64()
		
		client.color_log(255, 215, 0, "amnesia — Saving config to cloud...")
		
		-- POST запрос с телом (FormData style)
		local post_body = "name=" .. cloud_cname .. "&b64=" .. config_b64
		local url = _api_url .. "?action=cloud_save&sk=" .. _sk .. "&sid=" .. amnesia.steamid64
			.. (type(amnesia._sec_qs) == "function" and amnesia._sec_qs() or "")
		
		http.post(url, post_body, function(a, b)
			-- gamesense http.get: callback получает (status_code, body) или (success, body)
			local ok_http = true
			local resp_body = ""
			
			if type(a) == "boolean" then
				ok_http = a
				resp_body = type(b) == "string" and b or ""
			elseif type(a) == "number" and b ~= nil then
				ok_http = (a >= 200 and a < 600)
				resp_body = type(b) == "string" and b or ""
			elseif type(a) == "table" then
				-- таблица: проверяем ключи
				resp_body = ""
				if type(a.body) == "string" then
					resp_body = a.body
				elseif type(a[1]) == "string" then
					resp_body = a[1]
				elseif type(a[2]) == "string" then
					resp_body = a[2]
				else
					-- выводим все ключи
					for k, v in pairs(a) do
						client.color_log(255, 200, 0, "amnesia — DEBUG: table[" .. tostring(k) .. "]=" .. tostring(v) .. " type=" .. type(v))
					end
				end
			end
			
			client.color_log(255, 200, 0, "amnesia — DEBUG: ok_http=" .. tostring(ok_http) .. ", resp_body type=" .. type(resp_body) .. ", length=" .. tostring(#resp_body))
			
			if not ok_http then
				client.color_log(255, 100, 100, "amnesia — Cloud save failed: network error")
				return
			end
			
			if type(resp_body) ~= "string" or resp_body == "" then
				client.color_log(255, 100, 100, "amnesia — Cloud save failed: empty response")
				return
			end
			
			client.color_log(255, 200, 0, "amnesia — DEBUG: resp_body preview=" .. resp_body:sub(1, 100))
			
			local ok, data = pcall(_json.parse, resp_body)
			
			if ok and type(data) == "table" then
				if data.ok then
					client.color_log(107, 255, 107, "amnesia — Config saved to cloud: " .. cloud_cname)
					if logger and logger.invent then
						logger.invent("config", {
							{"Saved to cloud: "},
							{cloud_cname},
						})
					end
				else
					local msg = data.msg or "unknown error"
					client.color_log(255, 100, 100, "amnesia — Cloud save failed: " .. msg)
				end
			else
				client.color_log(255, 100, 100, "amnesia — Cloud save failed: invalid JSON response")
			end
		end)
	end
	
	-- загрузка из облака
	amnesia.cloud_try_load = function()
		local ctx = (menu.loadouts and menu.loadouts.config) or menu.general.config
		if not ctx or not ctx.cloud_nick or not ctx.cloud_cname then
			client.color_log(255, 100, 100, "amnesia — Cloud UI is missing (loadouts tab)")
			return
		end
		local cloud_nick = ctx.cloud_nick:get()
		local cloud_cname = ctx.cloud_cname:get()
		
		if cloud_nick == "" or cloud_cname == "" then
			client.color_log(255, 100, 100, "amnesia — Enter owner nickname and config name")
			return
		end
		
	local url = _api_url .. "?action=cloud_fetch&sk=" .. _sk .. "&sid=" .. amnesia.steamid64
		.. (type(amnesia._sec_qs) == "function" and amnesia._sec_qs() or "")
		.. "&owner_nick=" .. cloud_nick .. "&cname=" .. cloud_cname
		
		http.get(url, function(success, response)
			if not success then
				client.color_log(255, 100, 100, "amnesia — Cloud load failed: network error")
				return
			end
			
			local resp_body = response
			if type(response) == "table" then
				resp_body = response.body
			end
			
			if type(resp_body) ~= "string" or resp_body == "" then
				client.color_log(255, 100, 100, "amnesia — Cloud load failed: empty response")
				return
			end
			
			local ok, data = pcall(_json.parse, resp_body)
			
			if ok and type(data) == "table" and data.ok == true then
				local config_data = data.data
				if config_data and config_data:find("::GS::", 1, true) then
					-- парсим и загружаем конфиг
					local encoded = config_data:match("::GS::(.+)$")
					if not encoded or encoded == "" then
						client.color_log(255, 100, 100, "amnesia — Failed to extract GS payload")
						return
					end
					-- encoded uses z113Z/z143Z and '_' as '=' padding suffix.
					local trimmed = encoded:gsub("_+$", "")
					local padCount = #encoded - #trimmed
					local b64 = string.gsub(trimmed, "z%d%d%dZ", { ["z113Z"] = "+", ["z143Z"] = "/", })
					b64 = b64 .. string.rep("=", padCount)
					local contents = base64.decode(b64)
					local name, author, settings = string.match(contents, "^%((.*)%)%[(.*)%]%{(.+)%}")
					
					if settings then
						local cfg = msgpack.unpack(settings)
						configs.system:load(cfg)
						client.color_log(107, 255, 107, "amnesia — Config loaded from cloud: " .. cloud_cname)
						if logger and logger.invent then
							logger.invent("config", {
								{"Loaded from cloud: "},
								{cloud_cname},
								{" · "},
								{author or "unknown"},
							})
						end
					else
						client.color_log(255, 100, 100, "amnesia — Failed to parse config")
					end
				else
					client.color_log(255, 100, 100, "amnesia — Invalid config format")
				end
			else
				local msg = data and data.msg or "config not found"
				client.color_log(255, 100, 100, "amnesia — Cloud load failed: " .. msg)
			end
		end)
	end

	-- Save "amnesia::GS::..." code directly to cloud.
	-- This bypasses hidden UI fields and is used by:
	--   * actions.create (new local config)
	--   * actions.import / actions.import_code
	-- so configs created/imported in-game appear in dashboard immediately.
	local base64url_encode = function(str)
		local b64 = base64.encode(str)
		-- Make it URL-safe and remove padding to match API expectations.
		return (string.gsub(b64, "[%+%/%=]", { ["+"] = "-", ["/"] = "_", ["="] = "" }))
	end

	local url_encode = function(str)
		str = tostring(str)
		-- RFC3986-ish minimal encoding for URL query/form usage.
		return (str:gsub("([^%w%-_%.~])", function(c)
			return string.format("%%%02X", string.byte(c))
		end))
	end

	amnesia.cloud_try_save_code = function(cname, cfg_code)
		if not cname or cname == "" or cname == "Default" or cname == BUILTIN_CONFIG_NAME then return end
		if type(cfg_code) ~= "string" then return end
		-- Accept both legacy: amnesia::GS::... and new: amnesia2026_cfdk9f3m7x1::GS::...
		if cfg_code:find("::GS::", 1, true) == nil then return end

		local config_b64url = base64url_encode(cfg_code)
		local url = _api_url .. "?action=cloud_save&sk=" .. _sk .. "&sid=" .. amnesia.steamid64
			.. (type(amnesia._sec_qs) == "function" and amnesia._sec_qs() or "")
			.. "&name=" .. url_encode(cname) .. "&b64=" .. config_b64url

		http.get(url, function(success, response)
			if not success then
				client.color_log(255, 100, 100, "amnesia — Cloud save failed (network)")
				return
			end

			local resp_body = response
			if type(response) == "table" then
				resp_body = response.body
			end
			resp_body = type(resp_body) == "string" and resp_body or ""

			if resp_body == "" then
				client.color_log(255, 100, 100, "amnesia — Cloud save failed (empty response)")
				return
			end

			local ok, data = pcall(_json.parse, resp_body)
			if ok and type(data) == "table" and data.ok == true then
				client.color_log(107, 255, 107, "amnesia — Cloud config added: " .. cname)
				-- mark as owned cloud config so dashboard delete will remove it from Lua list too
				if type(db) == "table" then
					db._cloud_owned_configs = type(db._cloud_owned_configs) == "table" and db._cloud_owned_configs or {}
					db._cloud_owned_configs[cname] = true
				end
			else
				local preview = tostring(resp_body):sub(1, 200)
				client.color_log(255, 160, 60, "amnesia — Cloud debug: " .. preview)
				if ok and type(data) == "table" and type(data.msg) == "string" and data.msg ~= "" then
					client.color_log(255, 100, 100, "amnesia — Cloud save failed: " .. data.msg)
				else
					client.color_log(255, 100, 100, "amnesia — Cloud save failed")
				end
			end
		end)
	end

	-- List current user's cloud configs.
	-- cb(list) where list = { {name=..., username=..., updated=...}, ... }
	amnesia.cloud_list_my = function(cb)
		if type(cb) ~= "function" then return end
		local url = _api_url .. "?action=cloud_list&sk=" .. _sk .. "&sid=" .. amnesia.steamid64
			.. (type(amnesia._sec_qs) == "function" and amnesia._sec_qs() or "")
		http.get(url, function(success, response)
			if not success then return cb(nil) end
			local body = response
			if type(response) == "table" then body = response.body end
			if type(body) ~= "string" or body == "" then return cb(nil) end
			local ok, data = pcall(_json.parse, body)
			if not ok or type(data) ~= "table" or data.ok ~= true then
				return cb(nil)
			end
			local list = type(data.list) == "table" and data.list or {}
			return cb(list)
		end)
	end

	-- Fetch current user's config code by name (uses owner steamid64; avoids nickname ambiguity).
	-- cb(code_string | nil)
	amnesia.cloud_fetch_my_code = function(cname, cb)
		if type(cb) ~= "function" then return end
		if type(cname) ~= "string" or cname == "" then return cb(nil) end
		local url = _api_url .. "?action=cloud_fetch&sk=" .. _sk .. "&sid=" .. amnesia.steamid64
			.. (type(amnesia._sec_qs) == "function" and amnesia._sec_qs() or "")
			.. "&owner=" .. url_encode(amnesia.steamid64) .. "&cname=" .. url_encode(cname)
		http.get(url, function(success, response)
			if not success then return cb(nil) end
			local body = response
			if type(response) == "table" then body = response.body end
			if type(body) ~= "string" or body == "" then return cb(nil) end
			local ok, data = pcall(_json.parse, body)
			if not ok or type(data) ~= "table" or data.ok ~= true then
				return cb(nil)
			end
			return cb(type(data.data) == "string" and data.data or nil)
		end)
	end

	-- Delete current user's cloud config by name.
	amnesia.cloud_delete_my = function(cname)
		if type(cname) ~= "string" or cname == "" or cname == "Default" or cname == BUILTIN_CONFIG_NAME then return end
		local url = _api_url .. "?action=cloud_delete&sk=" .. _sk .. "&sid=" .. amnesia.steamid64
			.. (type(amnesia._sec_qs) == "function" and amnesia._sec_qs() or "")
			.. "&cname=" .. url_encode(cname)
		http.get(url, function(success, response)
			if not success then return end
			local body = response
			if type(response) == "table" then body = response.body end
			if type(body) ~= "string" or body == "" then return end
			local ok, data = pcall(_json.parse, body)
			if ok and type(data) == "table" and data.ok == true then
				client.color_log(255, 180, 80, "amnesia — Cloud deleted: " .. cname)
			end
		end)
	end

	-- Kick initial sync once cloud helpers are ready.
	pcall(function()
		if type(amnesia.cloud_sync_configs) == "function" then
			amnesia.cloud_sync_configs(true)
		end
	end)
end

-- #endregion


-- #endregion
--

--
-- #region : Rage

rage.teleport = {
	active = false,
	latest = 0,
	work = a(function (cmd, ctx)
		rage.teleport.active = vars.rage.teleport.on.hotkey:get()
		if not rage.teleport.active then return end

		local should = false
		local self, settings = rage.teleport, vars.rage.teleport

		local charge = refs.misc.settings.maxshift.value - refs.rage.aimbot.dt_fl[1].value + 1

		self.active = self.active and not (charge < 8 or self.latest == cmd.command_number or my.velocity < 100 or not my.jumping)
		if not self.active then return end

		--
		local weapon_idx = entity.get_player_weapon(my.entity)
		if not weapon_idx then return end

		local weapon_t = weapondata(weapon_idx)
		local weapon_type = weapon_t.weapon_type_int

		self.active = self.active and not (weapon_t.is_full_auto or (weapon_type == 9 or weapon_type == 0) or (not settings.pistol.value and weapon_type == 1))
		if not self.active then return end

		local min_damage = (refs.rage.aimbot.damage_ovr[1].value and refs.rage.aimbot.damage_ovr[1]:get_hotkey()) and refs.rage.aimbot.damage_ovr[2].value or refs.rage.aimbot.damage.value

		--
		local velocity = vector( entity.get_prop(my.entity, "m_vecVelocity") )

		local origin = vector(entity.get_prop(my.entity, "m_vecOrigin"))
		local eye = vector(client.eye_position())
		local peye = vector(client.extrapolate(eye.x, eye.y, eye.z, velocity, charge))

		local lfraction = client.trace_line(my.entity, eye.x, eye.y, eye.z, peye.x, peye.y, peye.z)
		peye.x = math.lerp(eye.x, peye.x, lfraction)
		peye.y = math.lerp(eye.y, peye.y, lfraction)
		peye.z = math.lerp(eye.z, peye.z, lfraction)

		--
		local target = client.current_threat()

		for i, enemy in ipairs(players) do
			if not enemy or not entity.is_enemy(enemy) or not entity.is_alive(enemy) then goto next end

			local distance = origin:dist(vector(entity.get_prop(enemy, "m_vecOrigin")))

			if distance < 400 or enemy == target then
				local head = vector(entity.hitbox_position(enemy, 0))

				if client.visible(head.x, head.y, head.z) then should = true break end

				local predicted = { client.trace_bullet(my.entity, peye.x, peye.y, peye.z, head.x, head.y, head.z) }
				local damage = predicted[2] or 0

				local required = math.min(min_damage, entity.get_prop(enemy, "m_iHealth"))
				if predicted[1] and damage > required then
					should = true break
				end
			end

			::next::
		end

		if should then
			if settings.land.value then
				local recovery = my.crouching and weapon_t.recovery_time_crouch or weapon_t.recovery_time_stand

				local p_origin = vector( client.extrapolate(origin.x, origin.y, origin.z, velocity, charge) )
				p_origin.z = p_origin.z - recovery

				local fraction = client.trace_line(my.entity, origin.x, origin.y, origin.z, p_origin.x, p_origin.y, p_origin.z)

				local landing = fraction < 1
				if not landing then return end
			end

			self.latest = cmd.command_number
			cmd.discharge_pending = true
		end
	end),
	run = a(function (self)
		vars.rage.teleport.on:set_callback(function (this)
			callbacks.setup_command(this.value, self.work)
		end, true)
	end)
}

-- #region: NN anti-aim correction (pre-trained, Mario NN resolver style)
local AMNESIA_NN_PRESET_STR = [=[
|INFO|FF BP NN|I|40|O|1|HL|1|NHL|10|LR|0.3|BW|-1.1559066392366e-05{-1.1202450064138,-0.43692358428945,-0.13930987099988,1.2473693747317,-1.0512952920563,1.3270403255733,-1.3048390365862,0.67144977762124,0.22895362182248,-0.80409868646125,0.80970370419299,-0.094876011124505,1.8085297300312,-3.1213051697127,0.15564586269487,1.243941161686,-0.63451864091975,0.85274078529101,1.2094977572229,0.62863360591113,-0.65126689180398,-0.59910446978325,-0.27530302959635,-0.37900970996814,-0.45176552529037,0.55370533700818,0.64138597420234,0.55680960465419,-0.61526474930497,0.3636652929368,-0.065175113965139,-0.36903881731361,0.12405837818835,-0.73977745618948,0.63540725046327,-0.45414746029774,0.79157121985721,-0.42317748048187,0.079063967276199,0.94263076966404,}3.1873687881385e-07{-0.33085972681749,1.3974765045622,-0.53805929633813,-0.67028441463719,0.9546600346727,-0.20504330455771,0.14603469737588,-0.22584991835587,-0.59708982950384,-0.096585443153326,-0.40914869100385,0.15252807361841,0.76983088009555,0.1135895273262,-0.046635440565021,0.052936898188129,0.43810347271126,0.7730153833329,0.66231510990403,0.58338534121945,0.86213212067021,0.87378351704409,-0.91200616034745,0.96259979650566,0.48645308856345,-0.62811218755657,0.37356359696407,0.85840784699586,0.53809980261285,0.67041507564095,-0.28260659218288,-0.83469318664078,-0.71786782846342,0.20177599197934,0.5580614689448,-0.14722750093401,-0.8674737129836,-0.12700793895558,0.18537378239585,0.64549671395507,}4.2982839371136e-06{-0.25445981857133,0.13249673996283,-0.2718035127553,-0.72430954461389,1.4232117247034,-0.33952965981642,1.6825855658027,0.4430270099209,0.15716956679741,1.1364623417016,-1.2811299615557,-2.467200066115,-0.36174012131967,2.7037878931814,-0.34114087452533,-1.7333547565663,-1.0167292273294,-0.80970388354612,0.1237717895204,0.36641949687082,-0.11871201536506,-0.8181383753111,-0.25342722612542,0.38346749694153,0.33325877812144,-0.26414654291822,0.14819168394517,-0.077031835047591,-0.16050719194423,0.21618455873618,-0.54693088064852,-0.23786000247078,-0.59803675764093,1.0923008303097,0.17366075046142,0.54290923518083,0.60140644190717,0.05974144182409,-0.10139665145658,-0.15275546046583,}5.1234789449184e-08{-0.18017558513543,-0.18146265689724,0.19828598581944,0.44190756360128,-0.22332667322822,0.30169325630054,0.97082021620136,-0.23322485853026,-0.65912975643021,1.3692117676815,-0.72319483106828,-1.0883591535332,-0.46589031854902,-0.073792583922551,0.36310819165966,-0.0053283265286844,0.47961491373351,1.0974451087232,-0.70320902143542,-0.087953350778685,1.0191600187128,0.17360115911924,0.069900569787577,-0.16813379753614,0.58380508079408,0.059608837989604,-0.73024469728429,0.13274871928125,0.11332417366227,-0.31200221713205,0.23947432231531,1.0454803228932,0.8758172416385,-0.46659133456749,-0.01452242480419,0.48269143866338,-0.1505119234022,-0.53428273563778,1.1124781201795,0.7158579485146,}-1.5923623174481e-07{0.85339968189486,-0.0031680515790833,-0.39202082971167,-0.01225315528781,-0.57344056356219,1.2631862215949,0.047128925306942,-1.4902526401776,-0.090282461185964,0.0051083609777073,0.31153197386897,0.17016429041934,1.659032504245,-0.73128928650677,0.4670939328216,0.028794360062452,-0.835364828446,1.0444326143459,0.32932243316448,0.19423058285795,0.064800248455427,0.44604158652933,-0.88846000046558,0.26087480381279,-0.31110295966076,-0.29340717912116,0.3893207825555,-0.12011290761793,0.74345863790375,0.91991374081139,0.58451763390618,1.0669202255176,0.9151380516102,-0.48160558880747,0.92929454785814,0.28369332396192,0.51683013032091,-0.90813461356797,0.11724769174449,-0.95568308718194,}-2.6915435839416e-06{0.15231248617089,-0.53598711108745,-1.0728578555855,0.36259922426732,0.031027769372601,0.26773876558409,0.64368096063365,-0.25774347079668,-0.54249611885042,-0.37569923896152,1.3102568839229,1.3606470022779,1.315893134815,-1.3041749157242,-0.11526832004411,0.92184110918755,-0.093661224545601,-0.88577712061228,0.63818458911472,-0.26442642654138,-1.1176712678031,0.25360377550678,0.3515439997362,-0.69789425814896,-0.4687938342845,0.82667253233937,0.467816069347,0.44591920582718,0.05545307746697,-0.60233019250446,-0.71215641270195,-0.53751447248309,-0.45065874409576,0.42354298216433,-0.0014788537422028,-0.73425343246317,0.47007202514344,-0.46357977355352,-1.2892936180133,-0.048225560467511,}-2.2203811792948e-07{-0.35923888252987,-0.20438667385787,-0.19124147250491,0.76882231523259,0.60367368248321,-1.0389538006775,-0.61313909750184,0.40870492709999,-0.72515795426014,-1.0689391477852,0.87347072473302,0.91819843344018,-0.20062971447343,0.40036925489807,-0.041060377554657,-0.49109735768139,-0.66679007149362,-0.36921711689963,0.22104603934927,-0.16034076612188,0.14148837206228,0.30385765762427,0.77164356236879,0.84512822072436,0.45189599713861,-0.32517192253332,0.97068735065427,0.93647534203954,0.88377609020537,-0.70700992716569,0.93760202670951,0.059062141340008,0.54097694578813,-0.53362426864334,-0.33198341878765,-0.84667381438854,1.095885343958,0.66440180345932,-0.53341022968168,-0.31280200102565,}-7.7144999220949e-08{0.2099088837233,0.41124969823218,0.26237623960241,0.010632764815006,-0.69550129162016,1.0309324303167,-2.3945268806069,-1.0900830278076,-0.97074897000463,-0.64712273581935,-0.14397363140143,-0.62111675762407,-0.50609306043648,-1.1836989201552,-0.27635932911943,-0.021133962558542,-0.71273397289237,-0.76600974074245,-0.25077719867282,-0.81734393863832,0.47239605660163,-0.66353076564059,0.86867198848571,-0.79615191780073,-0.0022895055875506,0.64980972601548,-0.16107170872416,0.80976610335076,0.94472563914824,-0.53645065120444,0.030698189248155,0.34301072287199,-0.3691108833124,-0.12511525153045,-1.1246609938741,-0.41765170598958,-0.30162418790371,-0.28050202302667,0.84343770289887,0.34903091158625,}8.0352707438157e-08{-0.51405999934921,0.0044459209144511,0.30461398228033,0.95000878369673,0.16155907388394,0.42705049012585,0.65182535858805,0.65344203842455,0.27293328175436,1.1721316374074,-0.034035069744857,-0.43404730540217,-0.68429164676573,-0.32332730912654,0.56993065489951,-0.014621209625948,-0.11099663675097,1.3579581445072,-0.27863263894567,-0.55714914897038,-0.60478575969188,-0.49545399672518,0.71208007180686,0.48439443134997,0.12846042466121,0.55861815908385,1.0799294894551,0.12195062728068,-0.90166846045791,-0.51862481544792,-0.24235415755116,-0.19301095955542,1.1633646789943,0.84032850506353,-0.57698419406506,0.686434184688,0.37527363998036,0.010136967906187,-0.39289912738176,-0.52391641291929,}3.9142267087638e-06{-0.42098484784357,-0.25546825964372,-0.76476298796809,0.8142147066408,1.5127730763427,-0.75631497465614,0.28598238176559,-0.33012846499604,-0.91616485085432,0.81551319574826,0.53773987298677,0.26636333938819,-1.0291460002793,1.1510905341627,0.66077086811555,-1.0384144522199,-0.32567602055811,1.0394917903945,0.77196468624017,0.50600831732912,-0.26120500875638,-0.95893895895136,-0.064147992016425,0.072218774618524,-1.1388010084736,-0.73853337106534,-0.24610589258136,0.02514605332215,0.54960616687421,0.75275549013141,0.67453346700391,-0.60164983523389,0.50611628328965,-0.58695247773995,0.54917372627756,-0.32598410448479,0.57677346537166,0.77028748812782,-0.72799863028805,0.51131434164369,}-9.345162504613e-06{5.293159010446,-0.89468979823207,-5.2575120035085,-1.1118852011227,1.61133844062,3.2848256677548,0.1746561427601,3.4871115367329,-0.44974464033245,-2.588796188171,}|END|
]=]

local amnesia_nn_net = nil
local amnesia_nn = {}
local AMNESIA_NN_ACT = 1

function amnesia_nn.transfer(x)
	return 1 / (1 + math.exp(-x / AMNESIA_NN_ACT))
end

function amnesia_nn.create(_numInputs, _numOutputs, _numHiddenLayers, _neuronsPerLayer, _learningRate)
	_numInputs = _numInputs or 1
	_numOutputs = _numOutputs or 1
	_numHiddenLayers = _numHiddenLayers or math.ceil(_numInputs / 2)
	_neuronsPerLayer = _neuronsPerLayer or math.ceil(_numInputs * .66666 + _numOutputs)
	_learningRate = _learningRate or .5
	local network = setmetatable({ learningRate = _learningRate }, { __index = amnesia_nn })
	network[1] = {}
	for i = 1, _numInputs do
		network[1][i] = {}
	end
	for i = 2, _numHiddenLayers + 2 do
		local neuronsInLayer = _neuronsPerLayer
		if i == _numHiddenLayers + 2 then
			neuronsInLayer = _numOutputs
		end
		network[i] = {}
		for j = 1, neuronsInLayer do
			network[i][j] = {}
			network[i][j].bias = math.random() * 2 - 1
			local numNeuronInputs = #(network[i - 1])
			for k = 1, numNeuronInputs do
				network[i][j][k] = math.random() * 2 - 1
			end
		end
	end
	return network
end

function amnesia_nn.forewardPropagate(self, ...)
	local arg = {...}
	if #arg ~= #(self[1]) and type(arg[1]) ~= "table" then
		error("Neural Network input count mismatch", 2)
	elseif type(arg[1]) == "table" and #arg[1] ~= #(self[1]) then
		error("Neural Network input count mismatch", 2)
	end
	local outputs = {}
	for i = 1, #(self) do
		for j = 1, #(self[i]) do
			if i == 1 then
				if type(arg[1]) == "table" then
					self[i][j].result = arg[1][j]
				else
					self[i][j].result = arg[j]
				end
			else
				self[i][j].result = self[i][j].bias
				for k = 1, #(self[i][j]) do
					self[i][j].result = self[i][j].result + (self[i][j][k] * self[i - 1][k].result)
				end
				self[i][j].result = amnesia_nn.transfer(self[i][j].result)
				if i == #(self) then
					table.insert(outputs, self[i][j].result)
				end
			end
			self[i][j].active = self[i][j].result > 0.5
		end
	end
	return outputs
end

function amnesia_nn.load(data)
	local dataPos = string.find(data, "|") + 1
	local currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
	dataPos = string.find(data, "|", dataPos) + 1
	local _inputs, _outputs, _hiddenLayers, _neuronsPerLayer, _learningRate
	local biasWeights = {}
	local errorExit = false
	while currentChunk ~= "END" and not errorExit do
		if currentChunk == "INFO" then
			currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
			dataPos = string.find(data, "|", dataPos) + 1
			if currentChunk ~= "FF BP NN" then
				errorExit = true
			end
		elseif currentChunk == "I" then
			currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
			dataPos = string.find(data, "|", dataPos) + 1
			_inputs = tonumber(currentChunk)
		elseif currentChunk == "O" then
			currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
			dataPos = string.find(data, "|", dataPos) + 1
			_outputs = tonumber(currentChunk)
		elseif currentChunk == "HL" then
			currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
			dataPos = string.find(data, "|", dataPos) + 1
			_hiddenLayers = tonumber(currentChunk)
		elseif currentChunk == "NHL" then
			currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
			dataPos = string.find(data, "|", dataPos) + 1
			_neuronsPerLayer = tonumber(currentChunk)
		elseif currentChunk == "LR" then
			currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
			dataPos = string.find(data, "|", dataPos) + 1
			_learningRate = tonumber(currentChunk)
		elseif currentChunk == "BW" then
			currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
			dataPos = string.find(data, "|", dataPos) + 1
			local subPos = 1
			local subChunk
			for i = 1, _hiddenLayers + 1 do
				biasWeights[i] = {}
				local neuronsInLayer = _neuronsPerLayer
				if i == _hiddenLayers + 1 then
					neuronsInLayer = _outputs
				end
				for j = 1, neuronsInLayer do
					biasWeights[i][j] = {}
					biasWeights[i][j].bias =
						tonumber(string.sub(currentChunk, subPos, string.find(currentChunk, "{", subPos) - 1))
					subPos = string.find(currentChunk, "{", subPos) + 1
					subChunk = string.sub(currentChunk, subPos, string.find(currentChunk, ",", subPos) - 1)
					local maxPos = string.find(currentChunk, "}", subPos)
					while subPos < maxPos do
						table.insert(biasWeights[i][j], tonumber(subChunk))
						subPos = string.find(currentChunk, ",", subPos) + 1
						if string.find(currentChunk, ",", subPos) ~= nil then
							subChunk = string.sub(currentChunk, subPos, string.find(currentChunk, ",", subPos) - 1)
						end
					end
					subPos = maxPos + 1
				end
			end
		end
		currentChunk = string.sub(data, dataPos, string.find(data, "|", dataPos) - 1)
		dataPos = string.find(data, "|", dataPos) + 1
	end
	if errorExit then
		error("Failed to load Neural Network", 2)
	end
	local network = setmetatable({ learningRate = _learningRate }, { __index = amnesia_nn })
	network[1] = {}
	for i = 1, _inputs do
		network[1][i] = {}
	end
	for i = 2, _hiddenLayers + 2 do
		network[i] = {}
		local neuronsInLayer = _neuronsPerLayer
		if i == _hiddenLayers + 2 then
			neuronsInLayer = _outputs
		end
		for j = 1, neuronsInLayer do
			network[i][j] = { bias = biasWeights[i - 1][j].bias }
			local numNeuronInputs = #(network[i - 1])
			for k = 1, numNeuronInputs do
				network[i][j][k] = biasWeights[i - 1][j][k]
			end
		end
	end
	return network
end

local function amnesia_nn_try_load_preset_blob()
	local paths = { "amnesia/nn_resolver_preset.lua", "nn_resolver_preset.lua" }
	for _, p in ipairs(paths) do
		local raw = readfile(p)
		if type(raw) == "string" and #raw > 80 then
			local f = load(raw, "@" .. p)
			if f then
				local ok, s = pcall(f)
				if ok and type(s) == "string" and #s > 200 then
					return s
				end
			end
		end
	end
	return AMNESIA_NN_PRESET_STR
end

pcall(function()
	local blob = amnesia_nn_try_load_preset_blob()
	if type(blob) == "string" and #blob > 200 then
		local ok, net = pcall(amnesia_nn.load, blob)
		if ok and net then
			amnesia_nn_net = net
		end
	end
	if not amnesia_nn_net then
		amnesia_nn_net = amnesia_nn.create(40, 1, 1, 10, 0.3)
	end
end)

local AMNESIA_NN_MUL = 1000000000
local AMNESIA_NN_BIN = 20
local AMNESIA_NN_PBR_NORM_MAX = 21973819.471897

local function amnesia_nn_normalize(value, minv, maxv)
	return (value - minv) / (maxv - minv)
end

local function amnesia_nn_bin_value(value, num_bits)
	local scale_factor = 2 ^ num_bits
	local scaled_value = math.floor(value * scale_factor + 0.5)
	local bits = {}
	for i = num_bits, 1, -1 do
		local bit_value = 2 ^ (i - 1)
		if scaled_value >= bit_value then
			bits[i] = 1
			scaled_value = scaled_value - bit_value
		else
			bits[i] = 0
		end
	end
	return bits
end

local function amnesia_nn_insert_first(tbl, value, maxSize)
	if #tbl >= maxSize then
		table.remove(tbl)
	end
	table.insert(tbl, 1, value)
end

local function amnesia_nn_average(t)
	t = t or {}
	local n = #t
	if n == 0 then
		return 0
	end
	local sum = 0
	for _, v in pairs(t) do
		sum = sum + v
	end
	return sum / n
end
-- #endregion


rage.resolver = {
	nn_buf = {},
	work = a(function ()
		local self = rage.resolver
		if not amnesia_nn_net then
			return
		end
		client.update_player_list()
		local lp = entity.get_local_player()
		if not lp or not entity.is_alive(lp) then
			for i = 1, #players do
				local v = players[i]
				if entity.is_enemy(v) then
					plist.set(v, "Force body yaw", false)
					plist.set(v, "Force body yaw value", 0)
					plist.set(v, "Correction active", false)
				end
			end
			return
		end

		for i = 1, #players do
			local v = players[i]
			if entity.is_enemy(v) and entity.is_alive(v) then
				local layer = entity.get_animation_layer(v, 6)
				if not layer then
					plist.set(v, "Force body yaw", false)
					plist.set(v, "Force body yaw value", 0)
					plist.set(v, "Correction active", false)
				else
					local pbr = tonumber(layer.m_flPlaybackRate) or 0
					pbr = pbr * AMNESIA_NN_MUL
					self.nn_buf[v] = self.nn_buf[v] or { samples = {} }
					local buf = self.nn_buf[v]
					amnesia_nn_insert_first(buf.samples, pbr, 18)
					local vx, vy = entity.get_prop(v, "m_vecVelocity")
					vx, vy = tonumber(vx) or 0, tonumber(vy) or 0
					local vel2d = math.sqrt(vx * vx + vy * vy)
					local vel_n = amnesia_nn_normalize(vel2d, 0, 260)
					local pbr_n = amnesia_nn_normalize(amnesia_nn_average(buf.samples), 0, AMNESIA_NN_PBR_NORM_MAX)
					if #buf.samples < 1 then
						plist.set(v, "Force body yaw", false)
						plist.set(v, "Force body yaw value", 0)
						plist.set(v, "Correction active", false)
					else
						local bin_pbr = amnesia_nn_bin_value(pbr_n, AMNESIA_NN_BIN)
						local bin_vel = amnesia_nn_bin_value(vel_n, AMNESIA_NN_BIN)
						local t = bin_pbr
						for j = 1, #bin_vel do
							table.insert(t, bin_vel[j])
						end
						local out = amnesia_nn_net:forewardPropagate(t)
						local forward = out and out[1]
						if forward == nil then
							plist.set(v, "Force body yaw", false)
							plist.set(v, "Force body yaw value", 0)
							plist.set(v, "Correction active", false)
						else
							local yaw_val = (forward < 0.5) and -60 or 60
							plist.set(v, "Force body yaw value", yaw_val)
							plist.set(v, "Force body yaw", true)
							plist.set(v, "Correction active", true)
						end
					end
				end
			end
		end
	end),
	restore = a(function ()
		local self = rage.resolver
		for i = 1, 64 do
			plist.set(i, "Force body yaw", false)
			plist.set(i, "Force body yaw value", 0)
			plist.set(i, "Correction active", false)
		end
		self.nn_buf = {}
	end),
	run = a(function (self)
		vars.rage.resolver:set_event("net_update_end", self.work)
		vars.rage.resolver:set_callback(function (this)
			if not this.value then self.restore() end
		end)
		defer(self.restore)
	end)
}

-- SSG 08 Air Autostop
rage.ssg08_air = {
	last_min_hc = 50,
	work = a(function (cmd)
		local lp = entity.get_local_player()
		if not lp or not entity.is_alive(lp) then return end
		
		local weapon = entity.get_player_weapon(lp)
		if not weapon then return end
		
		-- Проверка на SSG 08
		local weapon_id = entity.get_prop(weapon, "m_iItemDefinitionIndex")
		if weapon_id ~= 40 then return end
		
		-- Проверка что включена функция
		if not vars.rage.ssg08_air.on.value then return end
		
		local flags = entity.get_prop(lp, "m_fFlags")
		local in_air = bit.band(flags, 1) ~= 1
		
		if not in_air then return end
		
		-- Проверка видимости и урона
		local target = client.current_threat()
		if not target or not entity.is_alive(target) then return end
		
		local origin_pos = vector(entity.get_origin(lp))
		local enemy_pos = vector(entity.get_origin(target))
		
		-- Fraction detection
		local fraction = client.trace_line(target, origin_pos.x, origin_pos.y, origin_pos.z, enemy_pos.x, enemy_pos.y, enemy_pos.z)
		local fraction_result = (fraction == 0.99 or fraction == 1)
		
		-- Damage detection
		local _, damage = client.trace_bullet(target, origin_pos.x, origin_pos.y, origin_pos.z, enemy_pos.x, enemy_pos.y, enemy_pos.z)
		local damage_result = (damage > 0)
		
		if not (fraction_result and damage_result) then return end
		
		-- Проверка на видимость хитбокса
		local visible_hitbox = false
		for hitbox = 0, 8 do
			local x, y, z = entity.hitbox_position(target, hitbox)
			if x and y and z and client.visible(x, y, z) then
				visible_hitbox = true
				break
			end
		end
		
		if not visible_hitbox then return end
		
		-- Проверка точности оружия
		local spread = entity.get_prop(weapon, "m_fAccuracyPenalty") or 0
		local inaccuracy = entity.get_prop(weapon, "m_fSpread") or 0
		local current_value = spread + inaccuracy
		
		if current_value >= 0.0443 then return end
		
		-- Устанавливаем HC для воздуха
		local hc_in_air = vars.rage.ssg08_air.hc_in_air.value
		refs.rage.aimbot.min_hc:override(hc_in_air)
		rage.ssg08_air.last_min_hc = hc_in_air
		
		-- Air Autostop
		local velocity = vector(entity.get_prop(lp, "m_vecVelocity"))
		local speed = velocity:length2d()
		
		if speed > 5 then
			local forward_move = cmd.forwardmove
			local side_move = cmd.sidemove
			
			local direction = math.atan2(velocity.y, velocity.x)
			local move_angle = math.atan2(side_move, forward_move)
			
			local stop_angle = direction - move_angle
			cmd.forwardmove = -math.cos(stop_angle) * speed
			cmd.sidemove = -math.sin(stop_angle) * speed
		end
		
		-- Duck
		cmd.buttons = bit.bor(cmd.buttons, bit.lshift(1, 17))
	end),
	restore = a(function ()
		refs.rage.aimbot.min_hc:override(nil)
	end),
	run = a(function (self)
		callbacks.setup_command(true, self.work)
		vars.rage.ssg08_air.on:set_callback(function (this)
			if not this.value then self.restore() end
		end)
		defer(self.restore)
	end)
}

rage.exswitch = {
	ovr = false,
	latest = false,
	work = a(function (cmd)
		local self, settings = rage.exswitch, vars.rage.exswitch

		local is_dt, is_os = refs.rage.aimbot.double_tap[1].hotkey:get(), refs.aa.other.onshot.hotkey:get()
		local is_peeking = refs.rage.other.peek.value and refs.rage.other.peek.hotkey:get()

		local can_teleport = not ( (my.walking or my.velocity < 5) and not is_peeking or my.crouching)
		local can_dt = false

		local weapon_t = my.weapon and weapondata(my.weapon)

		if weapon_t then
			local weapon_id = entity.get_prop(my.weapon, "m_iItemDefinitionIndex")
			local weapon_auto = weapon_t.is_full_auto
			local is_deagle = weapon_id == 1

			can_dt = weapon_auto

			if ( (weapon_t.weapon_type_int == 1 and not is_deagle) and not settings.allow:get "Pistols" )
			or ( is_deagle and not settings.allow:get "Desert Eagle" ) then
				can_dt = true
			end
		end

		local allow = my.on_ground and is_dt and not (can_dt or can_teleport)

		if allow then
			refs.rage.aimbot.double_tap[1]:override(false)
			refs.aa.other.onshot.hotkey:override({"Always on", 0})
			self.ovr = true
		else
			if self.ovr then
				refs.rage.aimbot.double_tap[1]:override(true)
				refs.aa.other.onshot.hotkey:override()
				self.ovr = false
			end
		end
	end),
	run = a(function (self)
		vars.rage.exswitch.on:set_event("setup_command", self.work)
		-- vars.rage.exswitch.on:set_event("pui::adaptive_weapon", function ()
		-- 	if refs.rage.aimbot.double_tap[1].hotkey:get() then
		-- 		self.ovr = false
		-- 	end
		-- end)
		vars.rage.exswitch.on:set_callback(function (this)
			if not this.value then
				refs.rage.aimbot.double_tap[1]:override()
				refs.aa.other.onshot:override()
			end
		end)
		defer(function ()
			refs.rage.aimbot.double_tap[1]:override()
			refs.aa.other.onshot.hotkey:override()
		end)
	end)
}

rage.minor = {
	shift_extend = a(function (cmd)
		local allowed = vars.rage.shiftext.hotkey:get()
		refs.misc.settings.maxshift:override(allowed and 17 or nil)
	end),
	run = a(function (self) end)
}
for k, v in pairs(rage) do if v.run then v:run() end end
--------------------------------------------------------------------------------

textures = {
	logo_main = nil,
	logo_w = 56,
	logo_h = 18,
	logo_tab = nil,
	logo_tab_w = 56,
	logo_tab_h = 18,
	corner_h = render.load_svg('<svg width="4" height="5.87" viewBox="0 0 4 6"><path fill="#fff" d="M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z"/></svg>', 8, 12),
	corner_v = render.load_svg('<svg width="5.87" height="4" viewBox="0 0 6 4"><path fill="#fff" d="M2 0H0c0 2 2 4 4 4h2C4 4 2 2 2 0Z"/></svg>', 12, 8),
	warning = render.load_svg('<svg width="16" height="16" viewBox="0 0 16 16"><path fill="#fff" d="m13.259 13h-10.518c-0.35787 0.0023-0.68906-0.1889-0.866-0.5-0.18093-0.3088-0.18093-0.6912 0-1l5.259-9.015c0.1769-0.31014 0.50696-0.50115 0.864-0.5 0.3568-0.00121 0.68659 0.18986 0.863 0.5l5.26 9.015c0.1809 0.3088 0.1809 0.6912 0 1-0.1764 0.3097-0.5056 0.5006-0.862 0.5zm-6.259-3v2h2v-2zm0-5v4h2v-4z"/></svg>', 16, 16),
	defensive = nil,
	defensive_src_w = nil,
	defensive_src_h = nil,
	manual = render.load_svg('<svg width="8" height="10" viewBox="0 0 8 10"><path fill="#fff" d="m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z"/></svg>', 10, 10),
	mini_bfly = render.load_png('\x89\x50\x4E\x47\x0D\x0A\x1A\x0A\x00\x00\x00\x0D\x49\x48\x44\x52\x00\x00\x00\x09\x00\x00\x00\x09\x08\x06\x00\x00\x00\xE0\x91\x06\x10\x00\x00\x00\x04\x73\x42\x49\x54\x08\x08\x08\x08\x7C\x08\x64\x88\x00\x00\x00\xFD\x49\x44\x41\x54\x18\x57\x63\xE4\xE7\xE7\xEF\xF8\xF8\xF1\x63\x39\x1F\x1F\xDF\xAE\x4F\x9F\x3E\xA5\x33\x30\x30\x3C\x00\x62\x05\x2E\x2E\xAE\xE5\xDF\xBE\x7D\xB3\x00\xCA\x77\x32\x02\x05\xFE\xBF\x7F\xFF\x9E\x61\xC1\x82\x05\x0C\xE5\xE5\xE5\xDF\x7F\xFD\xFA\x95\xC5\xC6\xC6\x36\xB5\xB3\xB3\x93\x2B\x21\x21\x81\x41\x50\x50\x90\x01\xAC\x08\x08\x80\x14\x03\x58\x61\x62\x62\x22\xC3\xFC\xF9\xF3\x19\x40\x0A\x40\x80\x91\x91\x91\x81\x91\x97\x97\xF7\xCD\xA1\x43\x87\x84\x0D\x0C\x0C\xE0\x0A\x61\x0A\x0E\x1C\x38\xC0\x10\x1A\x1A\x7A\x91\x11\xE4\x26\x49\x49\xC9\xBC\xF6\xF6\x76\xCE\x80\x80\x00\xB0\x42\x10\xD8\xB0\x61\x03\x43\x56\x56\xD6\x8F\xE7\xCF\x9F\x67\x82\xAC\x73\x50\x53\x53\xDB\x72\xF3\xE6\x4D\x6E\x90\xE4\x83\x07\x0F\x18\x14\x14\x14\xC0\x0A\x55\x54\x54\x3E\xDD\xBD\x7B\xD7\x1F\xA4\x48\x00\xE8\xB8\x07\xFB\xF6\xED\xE3\x07\x49\xF8\xFA\xFA\xFE\xD9\xBC\x79\x33\x0B\x88\x6D\x6E\x6E\x0E\xF2\x08\x17\x48\x11\x08\x24\xB0\xB3\xB3\x4F\x07\x31\x7E\xFE\xFC\xB9\x12\xC8\x0E\x07\xF9\x06\xA8\xC0\x0A\x28\x74\x01\xA6\x08\xEE\x16\x6C\x0C\x00\x24\xDF\x61\x69\x5D\x69\xDB\x79\x00\x00\x00\x00\x49\x45\x4E\x44\xAE\x42\x60\x82', 9, 9),
	log_lines = render.load_svg([[<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path stroke="#ffffff" stroke-width="2" stroke-linecap="round" d="M22 12h-4M6 12H2m10-6V2m0 20v-4"/></svg>]], 9, 9),
	log_miss = render.load_svg([[<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill="none" stroke="#ffffff" stroke-linejoin="round"><path stroke-linecap="round" stroke-width="1.5" d="M9.5 21.685A10 10 0 0 0 12 22c5.523 0 10-4.477 10-10S17.523 2 12 2S2 6.477 2 12q0 .507.05 1"></path><path stroke-width="1.5" d="m5.021 14l-2.16 2.083a2.835 2.835 0 0 0 .02 4.088c1.18 1.118 3.08 1.099 4.24-.02a2.82 2.82 0 0 0 0-4.088z"></path><path stroke-linecap="round" stroke-width="2" d="M8.009 8.442H8m8 0h-.009"></path><path stroke-linecap="round" stroke-width="1.5" d="M15 16a4.98 4.98 0 0 0-3-1c-.91 0-1.765.244-2.5.67"></path></g></svg>]], 24, 24),
	log_miss_src_w = 24,
	log_miss_src_h = 24,
	log_hit = nil,
	log_hit_src_w = nil,
	log_hit_src_h = nil,
	log_evaded = nil,
	log_evaded_src_w = nil,
	log_evaded_src_h = nil,
	log_harm = nil,
	log_harm_src_w = nil,
	log_harm_src_h = nil,
	log_talk = nil,
	log_talk_src_w = nil,
	log_talk_src_h = nil,
	user_icon = nil,
	user_icon_w = nil,
	user_icon_h = nil,
	clock_icon = nil,
	clock_icon_w = nil,
	clock_icon_h = nil,
	ping_icon = nil,
	ping_icon_w = nil,
	ping_icon_h = nil,
	build_icon = nil,
	build_icon_w = nil,
	build_icon_h = nil,
	watermark_developer_build_icon = nil,
	watermark_developer_build_icon_w = nil,
	watermark_developer_build_icon_h = nil,
	hotkeys_icon = nil,
	hotkeys_icon_w = nil,
	hotkeys_icon_h = nil,
	spec_icon = nil,
	spec_icon_w = nil,
	spec_icon_h = nil,
	log_icon_day = nil,
	log_icon_night = nil,
	log_icon_discord = nil,
	log_icon_auth = nil,
	log_icon_server = nil,
	shared_icon = nil,
	shared_icon_w = nil,
	shared_icon_h = nil,
	logo_fallback = render.load_svg('<svg width="56" height="18" viewBox="0 0 56 18"><text x="0" y="13" fill="#74A6A9" font-family="Verdana" font-size="10" font-weight="700">amnesia</text></svg>', 56, 18), -- цвет обновляется в _apply_server_theme
} do
	local logo_texture = readfile("amnesia/logotype.png")
	local _png_size = function (data)
		if not data or #data < 24 then return nil, nil end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" then return nil, nil end
		local b = {data:byte(17, 24)}
		if #b < 8 then return nil, nil end
		local w = b[1] * 16777216 + b[2] * 65536 + b[3] * 256 + b[4]
		local h = b[5] * 16777216 + b[6] * 65536 + b[7] * 256 + b[8]
		if w <= 0 or h <= 0 then return nil, nil end
		return w, h
	end
	local _jpg_size = function (data)
		if not data or #data < 8 then return nil, nil end
		if data:byte(1) ~= 0xFF or data:byte(2) ~= 0xD8 then return nil, nil end
		local i, n = 3, #data
		while i + 8 <= n do
			if data:byte(i) ~= 0xFF then
				i = i + 1
			else
				local marker = data:byte(i + 1)
				if not marker then break end
				if (marker >= 0xC0 and marker <= 0xC3) or (marker >= 0xC5 and marker <= 0xC7)
					or (marker >= 0xC9 and marker <= 0xCB) or (marker >= 0xCD and marker <= 0xCF) then
					local h1, h2 = data:byte(i + 5), data:byte(i + 6)
					local w1, w2 = data:byte(i + 7), data:byte(i + 8)
					if h1 and h2 and w1 and w2 then
						local w = w1 * 256 + w2
						local h = h1 * 256 + h2
						if w > 0 and h > 0 then
							return w, h
						end
					end
					break
				elseif marker == 0xD9 or marker == 0xDA then
					break
				else
					local l1, l2 = data:byte(i + 2), data:byte(i + 3)
					if not l1 or not l2 then break end
					local seg_len = l1 * 256 + l2
					if seg_len < 2 then break end
					i = i + 2 + seg_len
				end
			end
		end
		return nil, nil
	end

	local load_auth_icon_png = function (data, key)
		if not data or #data < 24 then return false end
		local sig = data:sub(1, 8)
		if sig ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures[key .. "_src_w"], textures[key .. "_src_h"] = nil, nil
			return false
		end
		textures[key] = tex
		textures[key .. "_src_w"] = w
		textures[key .. "_src_h"] = h
		return true
	end
	local load_auth_icon_jpg = function (data, key)
		if not data or #data < 8 then return false end
		if data:byte(1) ~= 0xFF or data:byte(2) ~= 0xD8 then return false end
		local w, h = _jpg_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_jpg(data, w, h)
		if not tex then
			textures[key .. "_src_w"], textures[key .. "_src_h"] = nil, nil
			return false
		end
		textures[key] = tex
		textures[key .. "_src_w"] = w
		textures[key .. "_src_h"] = h
		return true
	end
	local load_auth_icon_svg = function (data, key)
		if not data or not string.find(data, "<svg", 1, true) then return false end
		local normalized = data
		normalized = normalized:gsub("currentColor", "#ffffff")
		normalized = normalized:gsub('stroke%s*=%s*"(.-)"', 'stroke="#ffffff"')
		local tex = render.load_svg(normalized, 24, 24)
		if not tex then
			textures[key .. "_src_w"], textures[key .. "_src_h"] = nil, nil
			return false
		end
		textures[key] = tex
		textures[key .. "_src_w"] = 24
		textures[key .. "_src_h"] = 24
		return true
	end

	local load_log_kill_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.log_kill_src_w, textures.log_kill_src_h = nil, nil
			return false
		end
		textures.log_kill = tex
		textures.log_kill_src_w = w
		textures.log_kill_src_h = h
		return true
	end
	
	local load_shared_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.shared_src_w, textures.log_kill_src_h = nil, nil
			return false
		end
		textures.shared = tex
		textures.shared_src_w = w
		textures.shared_src_h = h
		return true
	end

	local load_key_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.key_src_w, textures.key_src_h = nil, nil
			return false
		end
		textures.key = tex
		textures.key_src_w = w
		textures.key_src_h = h
		return true
	end

	local load_defensive_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.defensive_src_w, textures.defensive_src_h = nil, nil
			return false
		end
		textures.defensive = tex
		textures.defensive_src_w = w
		textures.defensive_src_h = h
		return true
	end
	
	local load_log_hit_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.log_hit_src_w, textures.log_hit_src_h = nil, nil
			return false
		end
		textures.log_hit = tex
		textures.log_hit_src_w = w
		textures.log_hit_src_h = h
		return true
	end
	local load_log_evaded_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.log_evaded_src_w, textures.log_evaded_src_h = nil, nil
			return false
		end
		textures.log_evaded = tex
		textures.log_evaded_src_w = w
		textures.log_evaded_src_h = h
		return true
	end
	local load_log_miss_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.log_miss_src_w, textures.log_miss_src_h = nil, nil
			return false
		end
		textures.log_miss = tex
		textures.log_miss_src_w = w
		textures.log_miss_src_h = h
		return true
	end
	local load_log_harm_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.log_harm_src_w, textures.log_harm_src_h = nil, nil
			return false
		end
		textures.log_harm = tex
		textures.log_harm_src_w = w
		textures.log_harm_src_h = h
		return true
	end
	local load_log_talk_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 32, h or 32
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.log_talk_src_w, textures.log_talk_src_h = nil, nil
			return false
		end
		textures.log_talk = tex
		textures.log_talk_src_w = w
		textures.log_talk_src_h = h
		return true
	end
	local load_user_icon_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 16, h or 16
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.user_icon_w, textures.user_icon_h = nil, nil
			return false
		end
		textures.user_icon = tex
		textures.user_icon_w, textures.user_icon_h = w, h
		return true
	end
	local load_clock_icon_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 16, h or 16
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.clock_icon_w, textures.clock_icon_h = nil, nil
			return false
		end
		textures.clock_icon = tex
		textures.clock_icon_w, textures.clock_icon_h = w, h
		return true
	end
	local load_ping_icon_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 16, h or 16
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.ping_icon_w, textures.ping_icon_h = nil, nil
			return false
		end
		textures.ping_icon = tex
		textures.ping_icon_w, textures.ping_icon_h = w, h
		return true
	end
	local load_build_icon_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 16, h or 16
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.build_icon_w, textures.build_icon_h = nil, nil
			return false
		end
		textures.build_icon = tex
		textures.build_icon_w, textures.build_icon_h = w, h
		return true
	end
	local load_watermark_developer_build_icon_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 16, h or 16
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.watermark_developer_build_icon_w, textures.watermark_developer_build_icon_h = nil, nil
			return false
		end
		textures.watermark_developer_build_icon = tex
		textures.watermark_developer_build_icon_w, textures.watermark_developer_build_icon_h = w, h
		return true
	end
	local load_hotkeys_icon_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 16, h or 16
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.hotkeys_icon_w, textures.hotkeys_icon_h = nil, nil
			return false
		end
		textures.hotkeys_icon = tex
		textures.hotkeys_icon_w, textures.hotkeys_icon_h = w, h
		return true
	end
	local load_spec_icon_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 16, h or 16
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.spec_icon_w, textures.spec_icon_h = nil, nil
			return false
		end
		textures.spec_icon = tex
		textures.spec_icon_w, textures.spec_icon_h = w, h
		return true
	end

	local load_amnesiagirl_png = function (data)
		if not data or #data < 24 then return false end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then return false end
		local w, h = _png_size(data)
		w, h = w or 128, h or 128
		local tex = render.load_png(data, w, h)
		if not tex then
			textures.amnesiagirl_w, textures.amnesiagirl_h = nil, nil
			return false
		end
		textures.amnesiagirl = tex
		textures.amnesiagirl_w, textures.amnesiagirl_h = w, h
		client.log("amnesiagirl loaded: " .. w .. "x" .. h)
		return true
	end

	local day_svg = readfile("amnesia/day.svg")
	local night_svg = readfile("amnesia/night.svg")
	local day_png = readfile("amnesia/day.png")
	local night_png = readfile("amnesia/night.png")
	local server_jpeg = readfile("amnesia/server.jpeg") or readfile("server.jpeg")
	local server_jpg = readfile("amnesia/server.jpg") or readfile("server.jpg")

	if not (load_auth_icon_png(day_png, "log_icon_day") or load_auth_icon_svg(day_svg, "log_icon_day")) then
		http.get("https://amnesia.cfd/day.png", function (success, raw)
			if success and raw and raw.body and load_auth_icon_png(raw.body, "log_icon_day") then
				writefile("amnesia/day.png", raw.body)
				return
			end
			http.get("https://amnesia.cfd/day.svg", function (ok2, raw2)
				if ok2 and raw2 and raw2.body and load_auth_icon_svg(raw2.body, "log_icon_day") then
					writefile("amnesia/day.svg", raw2.body)
				end
			end)
		end)
	end
	if not (load_auth_icon_png(night_png, "log_icon_night") or load_auth_icon_svg(night_svg, "log_icon_night")) then
		http.get("https://amnesia.cfd/night.png", function (success, raw)
			if success and raw and raw.body and load_auth_icon_png(raw.body, "log_icon_night") then
				writefile("amnesia/night.png", raw.body)
				return
			end
			http.get("https://amnesia.cfd/night.svg", function (ok2, raw2)
				if ok2 and raw2 and raw2.body and load_auth_icon_svg(raw2.body, "log_icon_night") then
					writefile("amnesia/night.svg", raw2.body)
				end
			end)
		end)
	end

	-- Discord icon
	local discord_png = readfile("amnesia/discord.png")
	if not load_auth_icon_png(discord_png, "log_icon_discord") then
		http.get("https://amnesia.cfd/discord.png", function (success, raw)
			if success and raw and raw.body and load_auth_icon_png(raw.body, "log_icon_discord") then
				writefile("amnesia/discord.png", raw.body)
			end
		end)
	end

	-- Auth icon
	local auth_png = readfile("amnesia/auth.png")
	if not load_auth_icon_png(auth_png, "log_icon_auth") then
		http.get("https://amnesia.cfd/auth.png", function (success, raw)
			if success and raw and raw.body and load_auth_icon_png(raw.body, "log_icon_auth") then
				writefile("amnesia/auth.png", raw.body)
			end
		end)
	end

	if not (load_auth_icon_jpg(server_jpeg, "log_icon_server") or load_auth_icon_jpg(server_jpg, "log_icon_server")) then
		http.get("https://amnesia.cfd/server.jpeg", function (ok_jpeg, raw_jpeg)
			if ok_jpeg and raw_jpeg and raw_jpeg.body and load_auth_icon_jpg(raw_jpeg.body, "log_icon_server") then
				writefile("amnesia/server.jpeg", raw_jpeg.body)
				return
			end
			http.get("https://amnesia.cfd/server.jpg", function (ok_jpg, raw_jpg)
				if ok_jpg and raw_jpg and raw_jpg.body and load_auth_icon_jpg(raw_jpg.body, "log_icon_server") then
					writefile("amnesia/server.jpg", raw_jpg.body)
				end
			end)
		end)
	end

	local log_cross_svg = readfile("amnesia/log_cross.svg")
	if log_cross_svg and string.find(log_cross_svg, "<svg", 1, true) then
		textures.log_lines = render.load_svg(log_cross_svg, 9, 9)
	else
		http.get("https://amnesia.cfd/log_cross.svg", function (success, raw)
			if success and raw and raw.body and string.find(raw.body, "<svg", 1, true) then
				writefile("amnesia/log_cross.svg", raw.body)
				textures.log_lines = render.load_svg(raw.body, 9, 9)
			end
		end)
	end

	textures.log_kill = nil
	local kill_png = readfile("amnesia/log_kill.png")
	if kill_png then
		load_log_kill_png(kill_png)
	else
		http.get("https://amnesia.cfd/log_kill.png", function (success, raw)
			if success and raw and raw.body then
				local body = raw.body
				if body:sub(1, 8) == "\137PNG\r\n\26\n" or body:sub(2, 4) == "PNG" then
					writefile("amnesia/log_kill.png", body)
					load_log_kill_png(body)
				end
			end
		end)
	end

	textures.shared_png = nil
	local shared_png = readfile("amnesia/shared.png")
	if shared_png then
		load_shared_png(shared_png)
	else
		http.get("https://amnesia.cfd/shared.png", function (success, raw)
			if success and raw and raw.body then
				local body = raw.body
				if body:sub(1, 8) == "\137PNG\r\n\26\n" or body:sub(2, 4) == "PNG" then
					writefile("amnesia/shared.png", body)
					load_shared_png(body)
				end
			end
		end)
	end

	local function load_logo_tab_png(data)
		if not data or #data < 24 then
			return false
		end
		if data:sub(1, 8) ~= "\137PNG\r\n\26\n" and data:sub(2, 4) ~= "PNG" then
			return false
		end
		local w, h = _png_size(data)
		w, h = w or 56, h or 18
		local t = render.load_png(data, w, h)
		if not t then
			return false
		end
		textures.logo_tab = t
		textures.logo_tab_w = w
		textures.logo_tab_h = h
		client.delay_call(0, amnesia.apply_aa_tab_logo)
		return true
	end

	-- Helper function to load PNG from server if not exists
	local function load_png_from_server(filename, load_func)
		local local_file = readfile("amnesia/" .. filename) or readfile(filename)
		if local_file and load_func(local_file) then
			return
		end
		http.get("https://amnesia.cfd/" .. filename, function(success, raw)
			if success and raw and raw.body then
				local body = raw.body
				if body:sub(1, 8) == "\137PNG\r\n\26\n" or body:sub(2, 4) == "PNG" then
					writefile("amnesia/" .. filename, body)
					load_func(body)
				end
			end
		end)
	end

	load_png_from_server("shared.png", load_shared_png)
	load_png_from_server("key.png", load_key_png)
	load_png_from_server("defensive.png", load_defensive_png)
	load_png_from_server("crosshair.png", load_log_hit_png)
	load_png_from_server("evaded.png", load_log_evaded_png)
	load_png_from_server("error.png", load_log_miss_png)
	load_png_from_server("harmed.png", load_log_harm_png)
	load_png_from_server("talk.png", load_log_talk_png)
	load_png_from_server("user.png", load_user_icon_png)
	load_png_from_server("clock.png", load_clock_icon_png)
	load_png_from_server("ping.png", load_ping_icon_png)
	load_png_from_server("build.png", load_build_icon_png)
	load_png_from_server("developer.png", load_watermark_developer_build_icon_png)
	load_png_from_server("hotkeys.png", load_hotkeys_icon_png)
	load_png_from_server("spec.png", load_spec_icon_png)
	load_png_from_server("logotype_big.png", load_logo_tab_png)
	load_png_from_server("amnesiagirl.png", load_amnesiagirl_png)

	-- Файл в корне без .png: /logotype_big
	client.delay_call(2.5, function ()
		if textures.logo_tab then
			return
		end
		http.get("https://amnesia.cfd/logotype_big", function (success, raw)
			if not success or not raw or not raw.body then
				return
			end
			local body = raw.body
			if body:sub(1, 8) == "\137PNG\r\n\26\n" or body:sub(2, 4) == "PNG" then
				writefile("amnesia/logotype_big.png", body)
				load_logo_tab_png(body)
			end
		end)
	end)

	-- Для miss сначала используем error.png; если его нет — fallback на SVG.
	local apply_log_miss_svg_from_disk = function ()
		local s = readfile("amnesia/log_miss.svg")
		if s and string.find(s, "<svg", 1, true) then
			textures.log_miss = render.load_svg(s, 24, 24)
			textures.log_miss_src_w, textures.log_miss_src_h = 24, 24
			return true
		end
		return false
	end

	if not textures.log_miss and not apply_log_miss_svg_from_disk() then
		http.get("https://amnesia.cfd/log_miss.svg", function (success, raw)
			if success and raw and raw.body and string.find(raw.body, "<svg", 1, true) then
				writefile("amnesia/log_miss.svg", raw.body)
				apply_log_miss_svg_from_disk()
			end
		end)
	end

	local load_logo = function (data)
		local w, h = _png_size(data)
		w, h = w or 56, h or 18
		textures.logo_w = w
		textures.logo_h = h
		textures.logo_main = render.load_png(data, w, h)
		client.delay_call(0, amnesia.apply_aa_tab_logo)
	end

	if logo_texture then
		load_logo(logo_texture)
	else
		http.get("https://amnesia.cfd/logotype.png", function (success, raw)
			if success and string.sub(raw.body, 2, 4) == "PNG" then
				load_logo(raw.body)
				writefile("amnesia/logotype.png", raw.body)
			end
		end)
	end

end

-- Gamesense: вкладка «AA» — logotype_big с CDN, иначе обычный logotype. Адрес табов привязан к билду GS.
do
	local _aa_tab_cdef_ok = false
	local _aa_tab_backup = nil
	local _aa_tab_last_tex = nil
	local GS_MENU_TAB_PTR = 0x434799AC + 0x54
	local GS_AA_TAB_INDEX = 1

	local function _aa_tab_ensure_cdef()
		if _aa_tab_cdef_ok then
			return true
		end
		local ok = pcall(function ()
			ffi.cdef[[
				typedef struct { int x; int y; } amn_tab_vec2;
				typedef struct {
					char _pad0[4];
					int TextureId;
					int TextureOffset;
					char _pad1[4];
					amn_tab_vec2 Size;
				} amn_icon_tab_t;
			]]
		end)
		_aa_tab_cdef_ok = ok
		return ok
	end

	function amnesia.apply_aa_tab_logo()
		local tex = textures.logo_tab or textures.logo_main or textures.logo_fallback
		if not tex or not ffi then
			return
		end
		if tex == _aa_tab_last_tex then
			return
		end
		pcall(function ()
			if not _aa_tab_ensure_cdef() then
				return
			end
			local tabsptr = ffi.cast("intptr_t*", GS_MENU_TAB_PTR)
			if not tabsptr or tabsptr[0] == 0 then
				return
			end
			local arr = ffi.cast("int*", tabsptr[0])
			local tab = arr[GS_AA_TAB_INDEX]
			if tab == 0 then
				return
			end
			local icon = ffi.cast("amn_icon_tab_t*", tab + 0x7C)
			if not _aa_tab_backup then
				_aa_tab_backup = {
					TextureId = icon.TextureId,
					TextureOffset = icon.TextureOffset,
					sx = icon.Size.x,
					sy = icon.Size.y,
				}
			end
			local tw, th
			if textures.logo_tab then
				tw = math.max(1, textures.logo_tab_w or 56)
				th = math.max(1, textures.logo_tab_h or 18)
			else
				tw = math.max(1, textures.logo_w or 56)
				th = math.max(1, textures.logo_h or 18)
			end
			icon.TextureId = tex
			icon.TextureOffset = 0
			icon.Size.x = tw
			icon.Size.y = th
			_aa_tab_last_tex = tex
		end)
	end

	function amnesia.restore_aa_tab_logo()
		_aa_tab_last_tex = nil
		if not _aa_tab_backup or not ffi or not _aa_tab_ensure_cdef() then
			return
		end
		pcall(function ()
			local tabsptr = ffi.cast("intptr_t*", GS_MENU_TAB_PTR)
			if not tabsptr or tabsptr[0] == 0 then
				return
			end
			local arr = ffi.cast("int*", tabsptr[0])
			local tab = arr[GS_AA_TAB_INDEX]
			if tab == 0 then
				return
			end
			local icon = ffi.cast("amn_icon_tab_t*", tab + 0x7C)
			icon.TextureId = _aa_tab_backup.TextureId
			icon.TextureOffset = _aa_tab_backup.TextureOffset
			icon.Size.x = _aa_tab_backup.sx
			icon.Size.y = _aa_tab_backup.sy
		end)
	end

	amnesia.apply_aa_tab_logo()
	client.delay_call(1.5, amnesia.apply_aa_tab_logo)

	defer(amnesia.restore_aa_tab_logo)
end

render.logo = function (x, y, scale, box_h)
	local s = scale or 1
	local bh = box_h or 24
	local base_w = textures.logo_main and (textures.logo_w or 56) or 56
	local base_h = textures.logo_main and (textures.logo_h or 18) or 18
	local draw_w = math.max(1, math.floor(base_w * s + 0.5))
	local draw_h = math.max(1, math.floor(base_h * s + 0.5))
	local draw_y = y + math.max(0, (bh - draw_h) * 0.5)

	if textures.logo_main then
		render.texture(textures.logo_main, x, draw_y, draw_w, draw_h, colors.white)
	else
		render.texture(textures.logo_fallback, x, draw_y, draw_w, draw_h, colors.white)
	end
end

render.edge_v = function (x, y, length, col)
	col = col or colors.accent
	render.texture(textures.corner_v, x, y + 4, 6, -4, col, "f")
	render.rectangle(x, y + 4, 2, length - 8, col)
	render.texture(textures.corner_v, x, y + length - 4, 6, 4, col, "f")
end
render.edge_h = function (x, y, length, col)
	col = col or colors.accent
	render.texture(textures.corner_h, x, y, 4, 6, col, "f")
	render.rectangle(x + 4, y, length - 8, 2, col)
	render.texture(textures.corner_h, x + length, y, -4, 6, col, "f")
end

render.capsule = function (x, y, w, h, c)
	x, y, w, h = x * DPI, y * DPI, w * DPI, h * DPI
	local r, g, b, a = c.r, c.g, c.b, c.a * render.get_alpha()

	local rr = h * 0.5

	renderer.circle(x + rr, y + rr, r,g,b,a, rr, 180, 0.5)
	renderer.rectangle(x + rr, y, w - h, h, r,g,b,a)
	renderer.circle(x + w - rr, y + rr, r,g,b,a, rr, 0, 0.5)
end

render.rounded_side_v = function (x, y, w, h, c, n)
	x, y, w, h, n = x * DPI, y * DPI, w * DPI, h * DPI, (n or 0) * DPI
	local r, g, b, a = c.r, c.g, c.b, c.a * render.get_alpha()

	renderer.circle(x + n, y + n, r, g, b, a, n, 180, 0.25)
	renderer.rectangle(x + n, y, w - n, n, r, g, b, a)
	renderer.rectangle(x, y + n, w, h - n - n, r, g, b, a)
	renderer.circle(x + n, y + h - n, r, g, b, a, n, 270, 0.25)
	renderer.rectangle(x + n, y + h - n, w - n, n, r, g, b, a)
end
render.rounded_side_h = function (x, y, w, h, c, n)
	x, y, w, h, n = x * DPI, y * DPI, w * DPI, h * DPI, (n or 0) * DPI
	local r, g, b, a = c.r, c.g, c.b, c.a * render.get_alpha()

	renderer.circle(x + n, y + n, r, g, b, a, n, 180, 0.25)
	renderer.rectangle(x + n, y, w - n - n, n, r, g, b, a)
	renderer.circle(x + w - n, y + n, r, g, b, a, n, 90, 0.25)
	renderer.rectangle(x, y + n, w, h - n, r, g, b, a)
end

-- #endregion

-- #region - Widgets

local drag do
	local current

	local in_bounds = a(function (x, y, xa, ya, xb, yb)
		return (x >= xa and y >= ya) and (x <= xb and y <= yb)
	end)

	--
	local progress = { menu = {0}, bg = {0}, }

	local function drag_paint_bg ()
		local p1 = anima.condition(progress.bg, current ~= nil, 2)
		if p1 == 0 then return end
		render.push_alpha(p1)
		render.rectangle(0, 0, sw, sh, colors.panel.l1)
		render.pop_alpha()
	end

	--
	local process = a(function (self)
		local ctx = self.__drag
		if ctx.locked or not pui.menu_open then return end

		local held = mouse.pressed()
		local hovered = mouse.in_bounds(self.x, self.y, self.w, self.h) and not mouse.in_bounds(menu.x, menu.y, menu.w, menu.h)

		--
		if held and ctx.ready == nil then
			ctx.ready = hovered
			ctx.ix, ctx.iy = self.x, self.y
			ctx.px, ctx.py = self.x - mouse.x, self.y - mouse.y
		end

		if held and ctx.ready then
			if current == nil and ctx.on_held then ctx.on_held(self, ctx) end
			current = (ctx.ready and current == nil) and self.id or current
			ctx.active = current == self.id
		elseif not held then
			if ctx.active and ctx.on_release then ctx.on_release(self, ctx) end
			ctx.active = false
			current, ctx.ready, ctx.aligning, ctx.px, ctx.py, ctx.ix, ctx.iy = nil, nil, nil, nil, nil, nil, nil
		end

		ctx.hovered = hovered or ctx.active

		--
		local prefer = { nil, nil }

		local dx, dy, dw, dh = self.x * DPI, self.y * DPI, self.w * DPI, self.h * DPI
		local wx, wy = ctx.px and (ctx.px + mouse.x) * DPI or dx, ctx.py and (ctx.py + mouse.y) * DPI or dy
		local cx, cy = dx + dw * .5, dy + dh * .5

		--

		local p1 = anima.condition(ctx.progress[1], ctx.hovered, 4)
		local p2 = anima.condition(ctx.progress[2], ctx.active, 4)

		render.rectangle(self.x - 3, self.y - 3, self.w + 6, self.h + 6, colors.white:alphen(12 + 24 * p1), 6)

		render.push_alpha(p2)

		if not client.key_state(0xA2) then
			local wcx, wcy = (wx + dw * .5) / DPI, (wy + dh * .5) / DPI
			for i, v in ipairs(ctx.rulers) do
				local spx, spy = v[2] / DPI, v[3] / DPI

				local dist = math.abs(v[1] and wcx - spx or wcy - spy)
				local allowed = dist < (10 * DPI)

				local pxy = v[1] and 1 or 2
				if not prefer[pxy] then
					prefer[pxy] = allowed and (v[1] and spx - self.w * .5 or spy - self.h * .5) or nil
				end

				v.p = v.p or {0}

				local adist = math.abs(v[1] and cx - spx or cy - spy)
				local pp = anima.condition(v.p, allowed or adist < (10 * DPI), -8) * .35 + 0.1
				render.rectangle(spx, spy, v[1] and 1 or v[4], v[1] and v[4] or 1, colors.white:alphen(pp, true))
			end
			if ctx.border[5] then
				local xa, ya, xb, yb = ctx.border[1], ctx.border[2], ctx.border[3], ctx.border[4]

				local inside = in_bounds(self.x, self.y, xa, ya, xb - self.w * .5 - 1, yb - self.h * .5 - 1)
				local p3 = anima.condition(ctx.progress[3], not inside)
				render.rect_outline(xa, ya, xb - xa, yb - ya, colors.white:alphen(p3 * .75 + .25, true), 4)
			end
		end

		render.pop_alpha()

		--
		if ctx.active then
			local fx, fy = prefer[1] or wx / DPI, prefer[2] or wy / DPI

			--
			local min_x, min_y = (ctx.border[1] - dw * .5) / DPI, (ctx.border[2] - dh * .5) / DPI
			local max_x, max_y = (ctx.border[3] - dw * .5) / DPI, (ctx.border[4] - dh * .5) / DPI

			local x, y = math.clamp(fx, math.max(min_x, 0), math.min(max_x, sw - self.w)), math.clamp(fy, math.max(min_y, 0), math.min(max_y, sh - self.h))
			self:set_position(x, y)

			if ctx.on_active then ctx.on_active(self, ctx) end
		end
	end)


	--
	drag = {
		paint_bg = drag_paint_bg,
		new = a(function (widget, props)
			vars.drag[widget.id] = {
				x = pui.slider("MISC", "Settings", widget.id ..":x", 0, 10000, (widget.x / sw) * 10000),
				y = pui.slider("MISC", "Settings", widget.id ..":y", 0, 10000, (widget.y / sh) * 10000),
			}

			vars.drag[widget.id].x:set_visible(false)
			vars.drag[widget.id].y:set_visible(false)
			vars.drag[widget.id].x:set_callback(function (this) widget.x = math.round(this.value * .0001 * sw) end, true)
			vars.drag[widget.id].y:set_callback(function (this) widget.y = math.round(this.value * .0001 * sh) end, true)

			--
			props = type(props) == "table" and props or {}

			widget.__drag = {
				locked = false, active = false, hovered = nil, aligning = nil,
				progress = {{0}, {0}, {0}},

				ix, iy = widget.x, widget.y,
				px, py = nil, nil,

				border = props.border or {0, 0, asw, ash},
				rulers = props.rulers or {},

				on_release = props.on_release, on_held = props.on_held, on_active = props.on_active,

				config = vars.drag[widget.id],
				work = process,
			}

			--
			callbacks["amnesia::render_dpi"]:set(function (new)
				vars.drag[widget.id].x:set(vars.drag[widget.id].x.value)
				vars.drag[widget.id].y:set(vars.drag[widget.id].y.value)
			end)

			callbacks.setup_command:set(function (cmd)
				if pui.menu_open and (widget.__drag.hovered or widget.__drag.active) then cmd.in_attack = 0 end
			end)
		end)
	}
end

local widget do
	local mt; mt = {
		update = function (self) return 1 end,
		paint = function (self, x, y, w, h) end,

		set_position = function (self, x, y)
			if self.__drag then
				if x then
					self.__drag.config.x:set( x / sw * 10000 )
					self.x = x
				end
				if y then
					self.__drag.config.y:set( y / sh * 10000 )
					self.y = y
				end
			else
				self.x, self.y = x or self.x, y or self.y
			end
		end,
		get_position = function (self)
			local ctx = self.__drag and self.__drag.config
			if not ctx then return self.x, self.y end

			return ctx.x.value * .0001 * sw, ctx.y.value * .0001 * sh
		end,

		__call = a(function (self)
			local __list, __drag = self.__list, self.__drag
			if __list then
				__list.items, __list.active = __list.collect(), 0
				for i = 1, #__list.items do
					if __list.items[i].active then __list.active = __list.active + 1 end
				end
			end
			self.alpha = self:update()

			render.push_alpha(self.alpha)

			if self.alpha > 0 then
				if __drag then __drag.work(self) end
				if __list then mt.traverse(self) end
				self:paint(self.x, self.y, self.w, self.h)
			end

			render.pop_alpha()
		end),

		enlist = function (self, collector, painter)
			self.__list = {
				items = {}, progress = setmetatable({}, { __mode = "k" }),
				longest = 0, active = 0, minwidth = self.w,
				collect = collector, paint = painter,
			}
		end,
		traverse = function (self)
			local ctx, offset = self.__list, 0
			local lx, ly = 0, 0
			ctx.active, ctx.longest = 0, 0

			for i = 1, #ctx.items do
				local v = ctx.items[i]
				local id = v.name or i
				ctx.progress[id] = ctx.progress[id] or {0}
				local p = anima.condition(ctx.progress[id], v.active)

				if p > 0 then
					render.push_alpha(p)
					lx, ly = ctx.paint(self, v, offset, p)
					render.pop_alpha()

					ctx.active, offset = ctx.active + 1, offset + (ly * p)
					ctx.longest = math.max(ctx.longest, lx)
				end
			end

			self.w = anima.lerp(self.w, math.max(ctx.longest, ctx.minwidth), 10, .5)
		end,

		lock = function (self, b)
			if not self.__drag then return end
			self.__drag.locked = b or false
		end,
	}	mt.__index = mt


	widget = {
		new = function (id, x, y, w, h, draggable)
			local self = {
				id = id, type = 0,
				x = x or 0, y = y or 0, w = w or 0, h = h or 0,
				alpha = 0, progress = {0}
			}

			if draggable then drag.new(self, draggable) end

			return setmetatable(self, mt)
		end,
	}
end

-- #endregion

-- #endregion
--

--
-- #region : Crosshair

local crosshair = widget.new("crosshair", sc.x - 24, sc.y + 32, 48, 16, {
	border = { asc.x, asc.y - 100, asc.x, asc.y + 100 },
	rulers = {
		{ true, asc.x, asc.y - 100, 200 },
	}
})

crosshair.data, crosshair.items = {
	scope = {
		side = 0,
		target = 0,
		reserved = false,
	}
}, {}

-- #region - Indicators

crosshair.enumerate = function (self)
	local x, y = sc.x, self.y
	local m = anima.condition("crosshair::yposition", self.y > sc.y, 3) * 2 - 1

	local side = crosshair.data.scope.side
	local offset = side * 0.5 + 0.5

	for i, v in ipairs(self.items) do
		v[0] = v[0] or {0}
		render.push_alpha(v[1])
		local s, w, h = v[2](v, x + v.x, y)
		render.pop_alpha()

		v[1] = anima.condition(v[0], s, -8)

		v.x = w * -offset - (side * 16)
		y = y + h * v[1] * m
	end

	return math.abs(y - self.y)
end

crosshair.items = {
	{	 -- logo classic
		0, x = 0, function (self, x, y)
			local t = "AMNESIA"
			local tw, th = render.measure_text("-", t)

			if self[1] > 0 then
				self.desync = anima.lerp(self.desync, math.clamp( 1.5 - math.abs(adata.get_overlap()), 0, 1 ), 4 )

				render.text(x, y, colors.text, "-", nil, t)
				render.rectangle(x, y + th + 2, tw + 2, 4, colors.black, 2)
				render.gradient(x + 1, y + th + 3, self.desync * tw, 2, colors.accent:alphen(64), colors.accent, true)
			end

			return vars.visuals.crosshair.style.value == "Classic", tw, th + 7
		end, desync = 0,
	}, { -- logo mini
		0, x = 0, function (self, x, y)
			local t = "AMNESIA" .. ((_LEVEL > 1) and colors.hexs .. string.format("%02x", render.get_alpha() * 255) .. string.upper(amnesia.build) or "")
			local tw, th = render.measure_text("-", t)

			if self[1] > 0 then
				self.desync = anima.lerp(self.desync, math.clamp( 1.5 - math.abs(adata.get_overlap()), 0, 1 ), 4 )

				local length = tw * 0.5 * self.desync
				render.gradient(x + 2 + tw * 0.5 - length, y + 9, length, 1, colors.accent:alphen(0), colors.accent, true)
				render.gradient(x + 1 + tw * 0.5, y + 9, length, 1, colors.accent, colors.accent:alphen(0), true)

				render.text(x, y, colors.text, "-", nil, t)
			end

			return vars.visuals.crosshair.style.value == "Mini", tw, th + 3
		end, desync = 0,
 	}, { -- dt
		0, x = 0, function (self, x, y)
			local condition = refs.rage.aimbot.double_tap[1].value and refs.rage.aimbot.double_tap[1].hotkey:get()

			if self[1] > 0 then
				local charge, dt = adata.get_tickbase_shifting(), adata.get_double_tap()
				local active = anima.condition(self.fd, not refs.rage.other.duck:get(), -8)

				local progress = colors.hexs .. string.format("%02x", render.get_alpha() * 255) .. string.insert("llllll", string.format("\aFFFFFF%02x", (dt and 96 or 64) * render.get_alpha()), math.min(charge * 0.5, 6))
				local text = "DT ".. progress

				render.text(x, y, colors.text:alphen(math.lerp(96, 255, active)), "-", nil, text)
			end

			return condition, render.measure_text("-", "DT llllll")
		end, fd = {0},
	}, { -- damage
		0, x = 0, function (self, x, y)
			local condition = not vars.visuals.damage.value and (refs.rage.aimbot.damage_ovr[1].value and refs.rage.aimbot.damage_ovr[1].hotkey:get())
			local t = "DMG"

			if self[1] > 0 then
				render.text(x, y, colors.text, "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end,
	}, { -- peek
		0, x = 0, function (self, x, y)
			local condition = refs.rage.other.peek.value and refs.rage.other.peek.hotkey:get()
			local dt = adata.get_double_tap()

			local t = "PA"..(dt and "+" or "")

			if self[1] > 0 then
				local ideal = anima.condition(self.ideal, dt, -8)
				render.text(x, y, colors.text:lerp(colors.accent, ideal), "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end, ideal = {0}
	}, { -- tp
		0, x = 0, function (self, x, y)
			local active, mode = vars.rage.teleport.on.hotkey:get()
			local condition = vars.rage.teleport.on.value and active and mode ~= 0

			local t = "TP"

			if self[1] > 0 then
				local ideal = anima.condition(self.ideal, rage.teleport.active, -8)
				render.text(x, y, colors.text:lerp(colors.accent, ideal), "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end, ideal = {0}
	}, { -- os
		0, x = 0, function (self, x, y)
			local condition = refs.aa.other.onshot.value and refs.aa.other.onshot:get_hotkey()
			local t = "OS"

			if self[1] > 0 then
				local is_dt = refs.rage.aimbot.double_tap[1].value and refs.rage.aimbot.double_tap[1]:get_hotkey()
				local inactive = anima.condition(self.a1, not is_dt, 8)
				render.text(x, y, colors.text:alphen(math.lerp(96, 255, inactive)), "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end, a1 = {0},
	}, { -- baim
		0, x = 0, function (self, x, y)
			local condition = refs.rage.aimbot.force_baim:get()

			local t = "BA"

			if self[1] > 0 then
				render.text(x, y, colors.text, "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end,
	}, { -- sp
		0, x = 0, function (self, x, y)
			local condition = refs.rage.aimbot.force_sp:get()

			local t = "SP"

			if self[1] > 0 then
				render.text(x, y, colors.text, "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end,
	}, { -- fs
		0, x = 0, function (self, x, y)
			local condition = refs.aa.angles.freestand.value and refs.aa.angles.freestand:get_hotkey()

			local t = "FS"

			if self[1] > 0 then
				render.text(x, y, colors.text, "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end,
	}, { -- ping
		0, x = 0, function (self, x, y)
			local hka, hkt = refs.misc.ping_spike.hotkey:get()
			local condition = refs.misc.ping_spike.value and hka and hkt ~= 0

			local t = "PS"

			if self[1] > 0 then
				render.text(x, y, colors.text, "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end,
	}, { -- fd
		0, x = 0, function (self, x, y)
			local condition = refs.rage.other.duck:get()

			local t = "FD"

			if self[1] > 0 then
				local progress = my.valid and entity.get_prop(my.entity, "m_flDuckAmount") or 0
				render.text(x, y, colors.text:lerp(colors.accent, progress), "-", nil, t)
			end

			return condition, render.measure_text("-", t)
		end,
	},
}

-- #endregion

-- #region - Main

crosshair.update = function (self)
	if my.valid and entity.get_prop(my.entity, "m_bIsScoped") == 1 then
		if not self.data.scope.reserved and my.side ~= 0 then
			self.data.scope.target, self.data.scope.reserved = -my.side, true
		end
	else
		self.data.scope.target, self.data.scope.reserved = 0, false
	end

	self.data.scope.side = anima.lerp(crosshair.data.scope.side, crosshair.data.scope.target, 12)

	return anima.condition(crosshair.progress, vars.visuals.crosshair.on.value and my.valid and not my.in_score)
end

crosshair.paint = function (self, x, y, w, h)
	crosshair:enumerate()
end

-- #endregion

-- #endregion
--

--
-- #region : HUD

local hud = {}

-- #region - Watermark

hud.watermark = widget.new("watermark", sw - 24, 24, 160, 24, {
	rulers = {
		{ true, asc.x, 0, ash },
		{ false, 0, ash - 32, asw },
		{ false, 0, 32, asw },
	},
	on_release = function (self, ctx)
		local partition = sw / 3
		local pos = self.x + self.w * .5

		local align = math.floor(pos / partition)
		if align == self.align then return end
		self.align = align

		if self.align == 1 then
			self:set_position(pos)
			self.x = self.x - self.w * .5
		elseif self.align == 2 then
			self:set_position(self.x + self.w)
			self.x = self.x - self.w
		end

		ctx.config.a:set(align)
	end,
	on_held = function (self, ctx)
		self.align = 0
		ctx.config.a:set(0)
	end,
})

hud.watermark.align, hud.watermark.logop, hud.watermark.logo = 2, {0}, 0
hud.watermark.cloud_avatar_tex = nil
hud.watermark.cloud_avatar_sig = ""
hud.watermark.__drag.config.a = pui.slider("MISC", "Settings", "watermark:align", 0, 2, hud.watermark.align)
hud.watermark.__drag.config.a:set_visible(false)
hud.watermark.__drag.config.a:set_callback(function (this)
	hud.watermark.align = this.value
end, true)

hud.watermark.items = {
	{
		0, function (self, x, y)
			local cname = vars.visuals.water.name:get()
			local use_custom = vars.visuals.water.custom_username.value and cname ~= ""
			local uname = use_custom and cname or display_user_name()
			local t = uname
			local tw, th = render.measure_text("", t)
			local has_icon = textures.user_icon ~= nil
			local icon_s = has_icon and 12 or 0
			local icon_gap = has_icon and 5 or 0
			local use_cloud_avatar = vars.visuals.water.cloud_avatar and vars.visuals.water.cloud_avatar.value
			local cloud_avatar_tex = nil
			local cloud_avatar_size = use_cloud_avatar and 12 or 0
			local cloud_avatar_gap = use_cloud_avatar and 5 or 0
			if use_cloud_avatar then
				local av_b64 = type(amnesia.user.cloud_avatar_b64) == "string" and amnesia.user.cloud_avatar_b64 or ""
				local av_mime = type(amnesia.user.cloud_avatar_mime) == "string" and amnesia.user.cloud_avatar_mime or "image/png"
				local sig = tostring(#av_b64) .. "|" .. av_mime
				if sig ~= hud.watermark.cloud_avatar_sig then
					hud.watermark.cloud_avatar_sig = sig
					hud.watermark.cloud_avatar_tex = nil
					if av_b64 ~= "" and #av_b64 < 120000 then
						local ok_dec, bytes = pcall(base64.decode, av_b64)
						if ok_dec and type(bytes) == "string" and #bytes > 16 then
							local tex = nil
							if av_mime == "image/jpeg" then
								local ok_j, tj = pcall(renderer.load_jpg, bytes, 32, 32)
								if ok_j then tex = tj end
							elseif av_mime == "image/webp" then
								local ok_p, tp = pcall(renderer.load_png, bytes, 32, 32)
								if ok_p then tex = tp end
							else
								local ok_p, tp = pcall(renderer.load_png, bytes, 32, 32)
								if ok_p then tex = tp end
							end
							if tex then
								hud.watermark.cloud_avatar_tex = tex
							end
						end
					end
				end
				cloud_avatar_tex = hud.watermark.cloud_avatar_tex
			end

			if self[1] > 0 then
				local total_w = tw + 16 + icon_s + icon_gap + cloud_avatar_size + cloud_avatar_gap
				render.blur(x, y + 1, total_w, 22, 1, 8)
				render.rectangle(x, y + 1, total_w, 22, colors.panel.l1, 4)
				render.glow_module(x, y + 1, total_w, 22, nil, 4, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 28))
				local tx = x + 8
				if has_icon then
					local iy = y + 1 + (22 - icon_s) * 0.5
					render.texture(textures.user_icon, tx, iy, icon_s, icon_s, colors.white)
					tx = tx + icon_s + icon_gap
				end
				if use_cloud_avatar then
					local ay = y + 1 + (22 - cloud_avatar_size) * 0.5
					local cx = tx + cloud_avatar_size * 0.5
					local cy = ay + cloud_avatar_size * 0.5
					local rr = cloud_avatar_size * 0.5
					if cloud_avatar_tex then
						-- True circular avatar render scoped locally for watermark.
						local vis_mul = self[1] or 1
						local ta = math.floor(255 * vis_mul)
						renderer.circle(cx, cy, 55, 65, 81, math.floor(185 * vis_mul), rr, 0, 1)
						renderer.texture(cloud_avatar_tex, cx - rr, cy - rr, rr * 2, rr * 2, 255, 255, 255, ta, "f")
						renderer.circle_outline(cx, cy, ACC_R, ACC_G, ACC_B, math.floor(145 * vis_mul), rr, 0, 1, 1)
					else
						renderer.circle(cx, cy, 75, 85, 99, 200, math.max(2, rr - 1), 0, 1)
						renderer.circle_outline(cx, cy, ACC_R, ACC_G, ACC_B, 145, rr, 0, 1, 1)
					end
					tx = tx + cloud_avatar_size + cloud_avatar_gap
				end
				render.text(tx, y + 6, colors.text, nil, nil, t)
			end

			return true, tw + 16 + icon_s + icon_gap + cloud_avatar_size + cloud_avatar_gap
		end, {}
	},
	{
		0, function (self, x, y)
			local t = amnesia_display_build_str()
			local tw, th = render.measure_text("", t)
			local dev_icon = textures.watermark_developer_build_icon
			local use_dev_icon = (t == "developer" and dev_icon ~= nil)
			local icon_tex = use_dev_icon and dev_icon or textures.build_icon
			local has_icon = icon_tex ~= nil
			local icon_s = has_icon and 12 or 0
			local icon_gap = has_icon and 5 or 0

			if self[1] > 0 then
				render.blur(x, y + 1, tw + 16 + icon_s + icon_gap, 22, 1, 8)
				render.rectangle(x, y + 1, tw + 16 + icon_s + icon_gap, 22, colors.panel.l1, 4)
				render.glow_module(x, y + 1, tw + 16 + icon_s + icon_gap, 22, nil, 4, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 28))
				local tx = x + 8
				if has_icon then
					local iy = y + 1 + (22 - icon_s) * 0.5
					render.texture(icon_tex, x + 8, iy, icon_s, icon_s, colors.white)
					tx = tx + icon_s + icon_gap
				end
				render.text(tx, y + 6, colors.text, nil, nil, t)
			end

			return true, tw + 16 + icon_s + icon_gap
		end, {}
	},
	{
		0, function (self, x, y)
			local hours, minutes = client.system_time()
			local text = string.format("%02d:%02d", hours, minutes)
			local tw, th = render.measure_text("", text)
			local has_icon = textures.clock_icon ~= nil
			local icon_s = has_icon and 12 or 0
			local icon_gap = has_icon and 5 or 0

			if self[1] > 0 then
				render.blur(x, y + 1, tw + 16 + icon_s + icon_gap, 22, 1, 8)
				render.rectangle(x, y + 1, tw + 16 + icon_s + icon_gap, 22, colors.panel.l1, 4)
				render.glow_module(x, y + 1, tw + 16 + icon_s + icon_gap, 22, nil, 4, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 28))
				local tx = x + 8
				if has_icon then
					local iy = y + 1 + (22 - icon_s) * 0.5
					render.texture(textures.clock_icon, x + 8, iy, icon_s, icon_s, colors.white)
					tx = tx + icon_s + icon_gap
				end
				render.text(tx, y + 6, colors.text, nil, nil, text)
			end

			return true, tw + 16 + icon_s + icon_gap
		end, {}
	},
	{
		0, function (self, x, y)
			local ping = client.latency() * 1000
			local text = string.format("%dms", ping)
			local tw, th = render.measure_text("", text)
			local has_icon = textures.ping_icon ~= nil
			local icon_s = has_icon and 12 or 0
			local icon_gap = has_icon and 5 or 0

			if self[1] > 0 then
				render.blur(x, y + 1, tw + 16 + icon_s + icon_gap, 22, 1, 8)
				render.rectangle(x, y + 1, tw + 16 + icon_s + icon_gap, 22, colors.panel.l1, 4)
				render.glow_module(x, y + 1, tw + 16 + icon_s + icon_gap, 22, nil, 4, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 28))
				local tx = x + 8
				if has_icon then
					local iy = y + 1 + (22 - icon_s) * 0.5
					render.texture(textures.ping_icon, x + 8, iy, icon_s, icon_s, colors.white)
					tx = tx + icon_s + icon_gap
				end
				render.text(tx, y + 6, colors.text, nil, nil, text)
			end

			return ping > 5, tw + 16 + icon_s + icon_gap
		end, {}
	},
}

hud.watermark.enumerate = function (self)
	local total = 0
	if self.logo > 0 then
		local logo_text = "amnesia"
		local text_w = render.measure_text("", logo_text)
		local icon_w = textures.logo_main and (textures.logo_w or 18) or 0
		local gap = icon_w > 0 and 4 or 0
		total = total + (icon_w + gap + text_w + 16) * self.logo + (4 * self.logo)
	end
	for i, v in ipairs(self.items) do
		render.push_alpha(v[1])
		local state, length = v[2](v, self.x + total, self.y)
		render.pop_alpha()

		v[1] = anima.condition(v[3], state)

		total = total + (length + 2) * v[1]
	end
	self.w = anima.lerp(self.w, total, nil, .5)
end

hud.watermark.update = function (self)
	local cx, cy = self:get_position()

	if self.align == 2 then
		self.x = cx - self.w * self.alpha
	elseif self.align == 1 then
		self.x = cx - self.w * .5
	end

	return anima.condition(self.progress, vars.visuals.water.on.value, 3)
end

hud.watermark.paint = function (self, x, y, w, h)
	self.logo = anima.condition(self.logop, not vars.visuals.water.hide.value)

	if self.logo > 0 then
		local logo_text = "amnesia"
		local text_w, text_h = render.measure_text("", logo_text)
		local icon_w = textures.logo_main and (textures.logo_w or 18) or 0
		local icon_h = textures.logo_main and (textures.logo_h or 18) or 0
		local gap = icon_w > 0 and 4 or 0
		local wl = icon_w + gap + text_w + 16
		render.push_alpha(self.logo)
		render.blur(x, y, wl, h, 1, 8)
		render.rectangle(x, y, wl, h, colors.panel.l1, 4)
		render.glow_module(x, y, wl, h, nil, 4, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 28))
		if textures.logo_main then
			local icon_y = y + math.max(0, (h - icon_h) * 0.5)
			render.texture(textures.logo_main, x + 8, icon_y, icon_w, icon_h, colors.white)
		end
		render.text(x + 8 + icon_w + gap, y + 6, colors.text, nil, nil, logo_text)
		render.pop_alpha()
	end

	self:enumerate()

	-- Рендерим аниме девочку на правом краю вотермарка
	if textures.amnesiagirl and self.logo > 0 then
		local girl_w = textures.amnesiagirl_w or 128
		local girl_h = textures.amnesiagirl_h or 128
		-- Масштабируем девочку чтобы она была пропорциональна вотермарку
		local scale = 0.35
		local scaled_w = girl_w * scale
		local scaled_h = girl_h * scale
		-- Позиционируем девочку так, чтобы она "сидела" на правом краю вотермарка
		-- Она должна сидеть на верхней части, не перекрывая элементы
		local girl_x = x + self.w - scaled_w * 0.7  -- Немного внутрь от правого края
		local girl_y = y - scaled_h * 0.5  -- Сидит на верхней части вотермарка
		render.push_alpha(self.logo)
		render.texture(textures.amnesiagirl, girl_x, girl_y, scaled_w, scaled_h, colors.white)
		render.pop_alpha()
	end
end

-- #endregion

-- #region - Kill Counter Widget

hud.killcounter = widget.new("killcounter", sc.x - 132 * 0.5, sc.y - 80, 132, 36, {
	rulers = {
		{ true, asc.x, 0, ash },
	}
})

hud.killcounter.display_alpha = 0
hud.killcounter.display_text = ""
hud.killcounter.display_kills = 0

hud.killcounter.update = function (self)
	if not vars.visuals.kill_sound_widget.value or not my.valid then
		self.display_alpha = 0
		return anima.condition(self.progress, false, -4)
	end

	local has_kills = kill_counter.kills > 0
	local time_since_kill = globals.realtime() - kill_counter.last_kill_time
	local should_show = has_kills and time_since_kill < 3

	-- Preview mode when menu is open
	if pui.menu_open then
		self.display_kills = 3
		self.display_text = "TRIPLE KILL"
		self.display_alpha = 255
	elseif should_show then
		self.display_kills = kill_counter.kills
		self.display_text = kill_names[math.min(kill_counter.kills, 7)] or "LEGENDARY"
		-- Smooth fade out
		local fade_start = 2.5
		if time_since_kill > fade_start then
			self.display_alpha = math.max(0, 255 * (1 - (time_since_kill - fade_start) / 0.5))
		else
			self.display_alpha = 255
		end
	else
		self.display_alpha = math.max(0, self.display_alpha - 10)
	end

	return anima.condition(self.progress, pui.menu_open or should_show, -8)
end

hud.killcounter.paint = function (self, x, y, w, h)
	local alpha_mult = self.display_alpha / 255
	local kills = self.display_kills

	-- Color based on kill count - gradually intensifying
	local text_color = colors.text
	local color_intensity = math.min(kills / 5, 1) -- 0 to 1 based on kills

	if kills >= 5 then
		-- Rainbow for rampage+
		local time = globals.realtime() * 2
		local r = math.floor(math.sin(time) * 127 + 128)
		local g = math.floor(math.sin(time + 2) * 127 + 128)
		local b = math.floor(math.sin(time + 4) * 127 + 128)
		text_color = color.rgb(r, g, b)
	else
		-- Gradually transition from green to red
		local r = math.floor(150 + color_intensity * 105) -- 150 -> 255
		local g = math.floor(255 - color_intensity * 155) -- 255 -> 100
		local b = math.floor(150 - color_intensity * 100) -- 150 -> 50
		text_color = color.rgb(r, g, b)
	end

	local line_y = y + 7

	render.blur(x, y + 1, w, h - 2, 1, 8)
	render.rectangle(x, y + 1, w, h - 2, colors.panel.l1, 5)

	-- Glow intensity increases with kills
	local glow_intensity = 24 + alpha_mult * color_intensity * 40
	render.glow_module(x, y + 1, w, h - 2, nil, 5, colors.panel.l1, color.rgb(text_color.r, text_color.g, text_color.b, glow_intensity))

	-- Icon - use log_kill instead of warning
	if textures.log_kill then
		render.texture(textures.log_kill, x + 8, line_y + 1, 12, 12, text_color:alphen(alpha_mult * 255))
	elseif textures.warning then
		render.texture(textures.warning, x + 8, line_y + 1, 12, 12, text_color:alphen(alpha_mult * 255))
	end

	-- Kill text
	render.text(x + 24, line_y, text_color:alphen(alpha_mult * 255), nil, nil, self.display_text)

	-- Kill count
	render.text(x + w - 8, line_y, text_color:alphen(alpha_mult * 255), "r", nil, tostring(kills))

	-- Progress bar (streak visualization)
	local bar_x, bar_y = x + 8, y + h - 7
	local bar_w, bar_h = w - 16, 3
	local bar_progress = math.min(kills / 7, 1)
	render.rectangle(bar_x, bar_y, bar_w, bar_h, colors.white:alphen(24 * alpha_mult), 2)
	render.rectangle(bar_x, bar_y, bar_progress * bar_w, bar_h, text_color:alphen(190 * alpha_mult), 2)
end

-- #endregion

-- #region - Damage indicator

hud.damage = widget.new("damage", sc.x + 4, sc.y + 4, 6, 4, {
	border = { asc.x - 40, asc.y - 40, asc.x + 40, asc.y + 40, true }
})
hud.damage.dmg = refs.rage.aimbot.damage.value
hud.damage.ovr_alpha = 0

hud.damage.update = function (self)
	if not vars.visuals.damage.value then
		return anima.condition(self.progress, false, -4)
	end

	local overridden = (refs.rage.aimbot.damage_ovr[1].value and refs.rage.aimbot.damage_ovr[1]:get_hotkey())
	local minimum_damage = overridden and refs.rage.aimbot.damage_ovr[2].value or refs.rage.aimbot.damage.value

	self.dmg = anima.lerp(self.dmg, minimum_damage, 16)
	self.ovr_alpha = anima.condition("hud::damage.ovr_alpha", overridden, -8)

	local weapon_t = my.weapon and weapondata(my.weapon)
	local weapon_valid = weapon_t and weapon_t.weapon_type_int ~= 9 and weapon_t.weapon_type_int ~= 0

	return anima.condition(self.progress, my.valid and (weapon_valid or pui.menu_open) and not my.in_score and globals.mapname(), -8)
end

hud.damage.paint = function (self, x, y, w, h)
	local dmg = math.round(self.dmg)
	dmg = dmg == 0 and "A" or dmg > 100 and ("+" .. (dmg - 100)) or tostring(dmg)

	self.w, self.h = render.measure_text("-", dmg)
	self.h, self.w = self.h - 3, self.w + 1

	render.text(x - 1, y - 2, colors.text:alphen( math.lerp(96, 255, self.ovr_alpha) ), "-", nil, dmg)
end

-- #endregion

-- #region - Anti-aim arrows

hud.arrows = widget.new("arrows", sc.x - 32, sc.y - 5, 10, 10, {
	border = { asc.x - 120, asc.y + 1, asc.x - 10, asc.y + 1 },
	rulers = {
		{ false, asc.x - 120, asc.y, 110 }
	}
})

hud.arrows.update = function (self)
	return anima.condition(self.progress, vars.visuals.arrows.value and my.in_game and my.valid)
end

hud.arrows.paint = function (self, x, y, w, h)
	local neutral = pui.menu_open and colors.white:alphen(128) or colors.null

	local left = anima.condition("hud::arrows.left", antiaim.data.manual == -90, 6)
	render.texture(textures.manual, x, y, 10, 10, neutral:lerp(colors.accent, left), "f")

	local right = anima.condition("hud::arrows.right", antiaim.data.manual == 90, 6)
	render.texture(textures.manual, sw - x + 1, y, -10, 10, neutral:lerp(colors.accent, right), "f")
end

-- #endregion

-- #region - Slowdown

hud.slowdown = widget.new("slowdown", sc.x - 132 * 0.5, sc.y - 160, 132, 36, {
	rulers = {
		{ true, asc.x, 0, ash },
	}
})
hud.slowdown.speed = 0.5

hud.slowdown.update = function (self)
	if not vars.visuals.slowdown.value or not my.valid then
		return anima.condition(self.progress, false, -4)
	end

	self.speed = entity.get_prop(my.entity, "m_flVelocityModifier")

	return anima.condition(self.progress, pui.menu_open or (my.valid and self.speed < 1), -8)
end

hud.slowdown.paint = function (self, x, y, w, h)
	local speed = math.clamp(self.speed or 1, 0, 1)
	local risk = 1 - speed
	local warnclr = colors.text:lerp(color.rgb(240, 72, 72), risk)
	local line_y = y + 7

	render.blur(x, y + 1, w, h - 2, 1, 8)
	render.rectangle(x, y + 1, w, h - 2, colors.panel.l1, 5)
	render.glow_module(x, y + 1, w, h - 2, nil, 5, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 24 + risk * 28))

	render.texture(textures.warning, x + 8, line_y + 1, 12, 12, warnclr)
	render.text(x + 24, line_y, colors.text:alphen(170 + risk * 85), nil, nil, "SLOWDOWN")

	local pct = math.floor(speed * 100 + 0.5)
	render.text(x + w - 8, line_y, warnclr, "r", nil, string.format("%d%%", pct))

	local bar_x, bar_y = x + 8, y + h - 7
	local bar_w, bar_h = w - 16, 3
	render.rectangle(bar_x, bar_y, bar_w, bar_h, colors.white:alphen(24), 2)
	render.rectangle(bar_x, bar_y, speed * bar_w, bar_h, colors.accent:lerp(warnclr, risk * 0.55):alphen(190), 2)
end

-- #endregion

-- #region - Defensive

hud.defensive = widget.new("defensive", sc.x - 132 * 0.5, sc.y - 120, 132, 36, {
	rulers = {
		{ true, asc.x, 0, ash },
	}
})

hud.defensive.progress_value = 0

hud.defensive.update = function (self)
	if not vars.visuals.defensive_indicator.value or not my.valid then
		self.progress_value = 0
		return anima.condition(self.progress, false, -4)
	end

	local diff = tonumber(my.exploit.diff or 0) or 0
	local in_window = diff <= -1 and diff >= -14
	if in_window then
		local p = math.abs(-diff - 15)
		if p > 1 then p = p - 1 end
		self.progress_value = math.clamp(p / 12, 0, 1)
	else
		self.progress_value = 0
	end

	return anima.condition(self.progress, pui.menu_open or in_window, -8)
end

hud.defensive.paint = function (self, x, y, w, h)
	local risk = math.clamp(self.progress_value or 0, 0, 1)
	local warnclr = colors.text:lerp(color.rgb(240, 72, 72), risk * 0.6)
	local line_y = y + 7

	render.blur(x, y + 1, w, h - 2, 1, 8)
	render.rectangle(x, y + 1, w, h - 2, colors.panel.l1, 5)
	render.glow_module(x, y + 1, w, h - 2, nil, 5, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 24 + risk * 28))

	if textures.defensive then
		render.texture(textures.defensive, x + 8, line_y + 1, 12, 12, warnclr)
	else
		render.texture(textures.warning, x + 8, line_y + 1, 12, 12, warnclr)
	end
	render.text(x + 24, line_y, colors.text:alphen(170 + risk * 85), nil, nil, "DEFENSIVE")
	render.text(x + w - 8, line_y, warnclr, "r", nil, string.format("%d%%", math.floor(risk * 100 + 0.5)))

	local bar_x, bar_y = x + 8, y + h - 7
	local bar_w, bar_h = w - 16, 3
	render.rectangle(bar_x, bar_y, bar_w, bar_h, colors.white:alphen(24), 2)
	render.rectangle(bar_x, bar_y, risk * bar_w, bar_h, colors.accent:lerp(warnclr, risk * 0.55):alphen(190), 2)
end

-- #endregion

-- #region - Logs

hud.logs = widget.new("logs", sc.x - 150, sc.y + 160, 300, 32, {
	rulers = {
		{ true, asc.x, 0, ash },
	}
})

hud.logs.preview, hud.logs.dummy = false, {
	{
		event = "kill",
		text = "\aA3D350\x01 \aE6E6E6\x02 Destroyed\aE6E6E6\x02 \aE6E6E6\x01rod9\aE6E6E6\x02",
		time = math.huge,
		progress = {0},
	},
	{
		event = "miss",
		miss_spread = false,
		text = "\aFFFFFF\x01 \aE6E6E6\x02 Missed\aE6E6E6\x02 \aE6E6E6\x01player\aE6E6E6\x02's\aE6E6E6\x01 head\aE6E6E6\x02 due to \aE6E6E6\x01prediction error",
		time = math.huge,
		progress = {0},
	},
	{
		event = "miss",
		miss_spread = true,
		text = "\aFFFFFF\x01 \aE6E6E6\x02 Missed\aE6E6E6\x02 \aE6E6E6\x01bot\aE6E6E6\x02's\aE6E6E6\x01 body\aE6E6E6\x02 due to \aE6E6E6\x01spread",
		time = math.huge,
		progress = {0},
	},
	{
		event = "harm",
		text = "\ad35050\x01 \aE6E6E6\x02 Damage from \aE6E6E6\x01player\aE6E6E6\x02 for \aE6E6E6\x0150",
		time = math.huge,
		progress = {0},
	},
}

hud.logs.update = function (self)
	-- auth-логи (Connecting/Good day/Connection error) показываем всегда, даже если Eventlogger выключен
	local has_auth = false
	local now = globals.realtime()
	for i = 1, math.min(#logger.list, 16) do
		local v = logger.list[i]
		local ttl = (v and v.auth_ttl) or 8
		if v and v.event == "auth" and (now - (v.time or now)) < ttl then
			has_auth = true
			break
		end
	end
	if not has_auth and (amnesia.auth_http_pending or amnesia.waiting_steamid) then
		has_auth = true
	end
	return anima.condition(self.progress, vars.misc.logs.on.value or has_auth)
end

hud.logs.part = function (self, log, offset, progress, condition, i)
	local text = string.gsub(log.text, "[\x01\x02]", {
		["\x01"] = string.format("%02x", progress * render.get_alpha() * 255),
		["\x02"] = string.format("%02x", progress * render.get_alpha() * 128),
	})

	local tw, th = render.measure_text("", text)

	local x, y = math.lerp(self.x + self.w * 0.5 - tw * 0.5 - 18, self.x, self.align), offset
	if not condition then
		x = x + (1 - progress) * (tw * 0.5) * (i % 2 == 0 and -1 or 1)
	end

	-- единый прямоугольный контейнер без вертикальной полоски
	render.blur(x, y + 1, tw + 32, 22)
	local glow_accent
	if log.event == "hit" or log.event == "kill" then
		glow_accent = color.rgb(163, 211, 80, 28)
	elseif log.event == "miss" then
		glow_accent = log.miss_spread and color.rgb(255, 204, 72, 28) or color.rgb(211, 80, 80, 28)
	end
	render.glow_module(x, y + 1, tw + 32, 22, nil, 4, colors.panel.l1, glow_accent)

	local text_x = x + 22
	if log.event == "auth" then
		local night = _log_auth_is_night()
		local icon
		if log.auth_icon == "server" and textures.log_icon_server then
			icon = textures.log_icon_server
		elseif log.auth_icon == "discord" and textures.log_icon_discord then
			icon = textures.log_icon_discord
		elseif log.auth_icon == "auth" and textures.log_icon_auth then
			icon = textures.log_icon_auth
		elseif log.auth_icon == "error" and textures.log_miss then
			icon = textures.log_miss
		else
			icon = (night and textures.log_icon_night) or textures.log_icon_day
		end
		local dw, dh = 14, 14
		if icon then
			local k
			if log.auth_icon == "server" and textures.log_icon_server then
				k = "log_icon_server"
			elseif log.auth_icon == "discord" and textures.log_icon_discord then
				k = "log_icon_discord"
			elseif log.auth_icon == "auth" and textures.log_icon_auth then
				k = "log_icon_auth"
			elseif log.auth_icon == "error" and textures.log_miss then
				k = "log_miss"
			else
				k = (night and textures.log_icon_night) and "log_icon_night" or "log_icon_day"
			end
			local nw, nh = textures[k .. "_src_w"], textures[k .. "_src_h"]
			if nw and nh and nw > 0 and nh > 0 then
				local maxs = 14
				if nw >= nh then
					dw, dh = maxs, maxs * nh / nw
				else
					dw, dh = maxs * nw / nh, maxs
				end
			end
		end
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
		text_x = x + 22
	elseif log.event == "hit" then
		local icon = textures.log_hit
		local dw, dh = 14, 14
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	elseif log.event == "kill" then
		-- тот же масштаб и позиция, что у day.png (max 14px, пропорции)
		local icon = textures.log_kill
		local dw, dh = 14, 14
		if icon and textures.log_kill_src_w and textures.log_kill_src_h
			and textures.log_kill_src_w > 0 and textures.log_kill_src_h > 0 then
			local nw, nh = textures.log_kill_src_w, textures.log_kill_src_h
			local maxs = 14
			if nw >= nh then
				dw, dh = maxs, maxs * nh / nw
			else
				dw, dh = maxs * nw / nh, maxs
			end
		end
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	elseif log.event == "miss" then
		-- PNG-рендер как у остальных логов (без special-mode для SVG)
		local icon = textures.log_miss
		local dw, dh = 14, 14
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	elseif log.event == "evaded" then
		local icon = textures.log_evaded
		local dw, dh = 14, 14
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	elseif log.event == "harm" then
		local icon = textures.log_harm
		local dw, dh = 14, 14
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	elseif log.event == "talk" then
		local icon = textures.log_talk
		local dw, dh = 14, 14
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	elseif log.event == "shared" then
		local icon = textures.shared
		local dw, dh = 14, 14
		if icon and textures.shared_src_w and textures.shared_src_h
			and textures.shared_src_w > 0 and textures.shared_src_h > 0 then
			local nw, nh = textures.shared_src_w, textures.shared_src_h
			local maxs = 14
			if nw >= nh then
				dw, dh = maxs, maxs * nh / nw
			else
				dw, dh = maxs * nw / nh, maxs
			end
		end
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	elseif log.event == "key" then
		local icon = textures.key
		local dw, dh = 14, 14
		if icon and textures.key_src_w and textures.key_src_h
			and textures.key_src_w > 0 and textures.key_src_h > 0 then
			local nw, nh = textures.key_src_w, textures.key_src_h
			local maxs = 14
			if nw >= nh then
				dw, dh = maxs, maxs * nh / nw
			else
				dw, dh = maxs * nw / nh, maxs
			end
		end
		local iy = y + 1 + (22 - dh) * 0.5
		local ix = x + 6 + (14 - dw) * 0.5
		if icon then
			render.texture(icon, ix, iy, dw, dh, colors.white)
		end
	else
		local icon = textures.log_lines
		if icon then
			render.texture(icon, x + 6, y + 8, 9, 9, colors.accent)
		end
	end
	render.text(text_x, y + 5, colors.text:alphen(128), nil, nil, text)
end

hud.logs.paint = function (self, x, y, w, h)
	local logs_on = vars.misc.logs.on.value
	local now = globals.realtime()
	local continue
	self.align = anima.condition("hud::logs.align", self.x < sw / 3)
	self.preview = anima.condition("hud::logs.preview", pui.menu_open and #logger.list == 0)
	y = y + 4

	-- При выключенном Eventlogger всё равно показываем auth (Connecting / Good day / ошибки) — см. hud.logs.update
	local ctx
	if self.preview > 0 then
		ctx = self.dummy
	elseif not logs_on then
		local filt = {}
		for j = 1, #logger.list do
			local v = logger.list[j]
			local ttl = (v and v.auth_ttl) or 8
			if v and v.event == "auth" and (now - (v.time or now)) < ttl then
				filt[#filt + 1] = v
			end
		end
		if #filt == 0 then
			return
		end
		ctx = filt
	else
		ctx = logger.list
	end

	for i = 1, #ctx do
		local v = ctx[i]
		-- держим логи подольше на экране
		local ttl = v.auth_ttl or 8
		local ascend = (now - v.time) < ttl and i < 10

		local progress = anima.condition(v.progress, ternary(self.preview > 0, self.preview == 1, ascend))
		if progress == 0 then continue = i end

		render.push_alpha(progress)
		self:part(v, y, progress, ascend, i)
		render.pop_alpha()

		y = y + 28 * (ascend and progress or 1)
	end

	-- только реальный список; превью меню идёт по dummy — не трогаем logger.list
	-- при ctx = отфильтрованные auth индексы не совпадают с logger.list — удаляем только в полном режиме
	if continue and ctx == logger.list then
		table.remove(logger.list, continue)
	end
end


-- #endregion

-- #region - Keylist

hud.keylist = widget.new("keylist", sc.x - 400, sc.y, 120, 22, true)

hud.keylist.binds = {
	{
		name = "Minimum damage",
		ref = refs.rage.aimbot.damage_ovr[1],
		state = function () return refs.rage.aimbot.damage_ovr[2].value end
	}, {
		name = "Double tap",
		ref = refs.rage.aimbot.double_tap[1],
	}, {
		name = "Hide shots",
		ref = refs.aa.other.onshot,
	}, {
		name = "Quick peek",
		ref = refs.rage.other.peek,
	}, {
		name = "Defensive snap",
		ref = vars.antiaim.exploits.snap.on,
	}, {
		name = "Manual yaw",
		ref = function () return antiaim.data.manual end,
		state = function ()
			return (antiaim.data.manual == -90 and "left") or (antiaim.data.manual == 90 and "right") or "~"
		end,
	}, {
		name = "Edge yaw",
		ref = refs.aa.angles.edge,
	}, {
		name = "Freestanding",
		ref = refs.aa.angles.freestand,
	},
}

hud.keylist:enlist(function ()
	local list = {}

	for i = 1, #hud.keylist.binds do
		local v = hud.keylist.binds[i]
		local active, state = false, "on"

		if type(v.ref) == "function" then
			active = v.ref()
		elseif v.ref ~= nil then
			active = v.ref.value
			if v.ref.hotkey then
				local __active, __mode = v.ref.hotkey:get()
				active = active and __active and __mode ~= 0
			end
		end

		if v.state then
			if type(v.state) == "function" then
				state = v.state()
			else
				state = v.state
			end
		end

		--
		list[i] = {
			name = v.name,
			active = active,
			state = state,
		}
	end

	return list
end, function (self, item, offset, progress)
	local x, y, w, h = self.x, self.y + offset + (self.h + 4) * progress, self.w, 22

	-- Плашка в стиле watermark.
	render.blur(x, y + 1, w, h, 1, 8)
	render.rectangle(x, y + 1, w, h, colors.panel.l1, 4)

	render.text(x + 8, y + 6, colors.text, nil, nil, item.name)
	render.text(x + w - 8, y + 6, colors.accent, "r", nil, item.state)
	local length = render.measure_text(nil, item.name .. item.state)

	return length + 22, h + 2
end)


hud.keylist.update = function (self)
	return anima.condition(self.progress, vars.visuals.keylist.value and (pui.menu_open or self.__list.active > 0))
end

hud.keylist.paint = function (self, x, y, w, h)
	render.blur(x, y + 1, w, h - 2, 1, 8)
	render.rectangle(x, y + 1, w, h - 2, colors.panel.l1, 4)
	render.glow_module(x, y + 1, w, h - 2, nil, 4, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 28))
	local has_icon = textures.hotkeys_icon ~= nil
	local icon_s = has_icon and 12 or 0
	local icon_gap = has_icon and 5 or 0
	local title = "Hotkeys"
	local title_w = render.measure_text("", title)
	local total_w = title_w + icon_s + icon_gap
	local tx = x + w * 0.5 - total_w * 0.5
	if has_icon then
		local iy = y + 1 + (h - 2 - icon_s) * 0.5
		render.texture(textures.hotkeys_icon, tx, iy, icon_s, icon_s, colors.white)
		tx = tx + icon_s + icon_gap
	end
	render.text(tx, y + 6, colors.text, nil, nil, title)
end

-- #endregion

-- #region - Speclist

hud.speclist = widget.new("speclist", sc.x - 400, sc.y, 120, 22, true)

hud.speclist:enlist(function ()
	local list = {}

	if my.valid then
		local target

		local ob_target, ob_mode = entity.get_prop(my.entity, "m_hObserverTarget"), entity.get_prop(my.entity, "m_iObserverMode")
		if ob_target and (ob_mode == 4 or ob_mode == 5) then
			target = ob_target
		else
			target = my.entity
		end

		for ent = 1, 64 do
			if entity.get_classname(ent) == "CCSPlayer" and ent ~= my.entity then
				local cob_target, cob_mode = entity.get_prop(ent, "m_hObserverTarget"), entity.get_prop(ent, "m_iObserverMode")

				list[#list+1] = {
					name = ent, nick = string.limit(entity.get_player_name(ent), 20, "..."),
					active = cob_target and cob_target == target and (cob_mode == 4 or cob_mode == 5)
				}
			end
		end
	end

	return list
end, function (self, item, offset, progress)
	local x, y, w, h = self.x, self.y + offset + (self.h + 4) * progress, self.w, 22

	-- Плашка в стиле watermark.
	render.blur(x, y + 1, w, h, 1, 8)
	render.rectangle(x, y + 1, w, h, colors.panel.l1, 4)

	render.text(x + 8, y + 6, colors.text, nil, nil, item.nick)
	local length = render.measure_text(nil, item.nick)

	return length + 22, h + 2
end)


hud.speclist.update = function (self)
	return anima.condition(self.progress, vars.visuals.speclist.value and (pui.menu_open or self.__list.active > 0))
end

hud.speclist.paint = function (self, x, y, w, h)
	render.blur(x, y + 1, w, h - 2, 1, 8)
	render.rectangle(x, y + 1, w, h - 2, colors.panel.l1, 4)
	render.glow_module(x, y + 1, w, h - 2, nil, 4, colors.panel.l1, color.rgb(colors.accent.r, colors.accent.g, colors.accent.b, 28))
	local has_icon = textures.spec_icon ~= nil
	local icon_s = has_icon and 12 or 0
	local icon_gap = has_icon and 5 or 0
	local title = string.format("Spectators (%d)", self.__list.active)
	local title_w = render.measure_text("", title)
	local total_w = title_w + icon_s + icon_gap
	local tx = x + w * 0.5 - total_w * 0.5
	if has_icon then
		local iy = y + 1 + (h - 2 - icon_s) * 0.5
		render.texture(textures.spec_icon, tx, iy, icon_s, icon_s, colors.white)
		tx = tx + icon_s + icon_gap
	end
	render.text(tx, y + 6, colors.text, nil, nil, title)
end

-- #endregion

-- #region - HUD paint_ui (единый колбэк: виджеты + затемнение при перетаскивании)
do
	local menu_bg_progress = {0}

	local fn = a(function ()
		if amnesia.auth_tick then
			amnesia.auth_tick()
		end

		-- Background blur (draw BEFORE widgets so everything stays on top).
		local show = vars.visuals.menu_bg.value and pui.menu_open
		local a_menu = anima.condition(menu_bg_progress, show, 6)
		if a_menu > 0 then
			local old_cheap = render.cheap
			render.cheap = false -- menu background should still blur even with Performance Mode
			render.push_alpha(a_menu)
			render.blur(0, 0, sw, sh, 1, 12)
			render.rectangle(0, 0, sw, sh, colors.panel.l1)
			render.pop_alpha()
			render.cheap = old_cheap
		end

		if vars.visuals.water.on.value or hud.watermark.alpha > 0 then
			hud.watermark()
		end
		if vars.visuals.damage.value or hud.damage.alpha > 0 then
			hud.damage()
		end
		if vars.visuals.arrows.value or hud.arrows.alpha > 0 then
			hud.arrows()
		end
		if vars.visuals.slowdown.value or hud.slowdown.alpha > 0 then
			hud.slowdown()
		end
		if vars.visuals.defensive_indicator.value or hud.defensive.alpha > 0 then
			hud.defensive()
		end
		if vars.visuals.kill_sound_widget.value or hud.killcounter.alpha > 0 or kill_counter.kills > 0 then
			hud.killcounter()
		end
		-- Без этого при выкл. Eventlogger виджет не тикает (alpha=0 → update не зовётся → Connecting не виден)
		local _logs_tick = vars.misc.logs.on.value or hud.logs.alpha > 0
		if not _logs_tick then
			local now = globals.realtime()
			for i = 1, math.min(#logger.list, 32) do
				local v = logger.list[i]
				local ttl = (v and v.auth_ttl) or 8
				if v and v.event == "auth" and (now - (v.time or now)) < ttl then
					_logs_tick = true
					break
				end
			end
			if not _logs_tick and (amnesia.auth_http_pending or amnesia.waiting_steamid) then
				_logs_tick = true
			end
		end
		if _logs_tick then
			hud.logs()
		end
		if vars.visuals.speclist.value or hud.speclist.alpha > 0 then
			hud.speclist()
		end
		if vars.visuals.keylist.value or hud.keylist.alpha > 0 then
			hud.keylist()
		end
		if vars.visuals.crosshair.on.value or crosshair.alpha > 0 then
			crosshair()
		end

		drag.paint_bg()

		if amnesia_alt_menu then
			pcall(amnesia_alt_menu.paint, amnesia_alt_menu_opts)
		end
	end)

	callbacks.paint_ui:set(fn)
end

-- #endregion ------------------------------------------------------------------

configs.system = pui.setup(vars)

end)()