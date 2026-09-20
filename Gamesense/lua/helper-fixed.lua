client.color_log(140, 120, 255, "[ScriptLeaks] https://discord.gg/GycDxWHUx5") -- only retards change this links

local database_cloud = {
	-- {
	-- 	name = "idk pseudo cloud :nerd:",
	-- 	url = "raw url example: https://raw.githubusercontent.com/wyscigufa9/nade_helper/main/locations/index.json",
	-- 	description = "optional",
	-- 	id = "optional", 
	-- },
}

local http = require "gamesense/http"
local weapons = require "gamesense/csgo_weapons"

if weapons.weapon_wallbang == nil then
	weapons.weapon_wallbang = {
		console_name = "weapon_wallbang",
		name = "Wallbang",
		type = "wallbang",
	}
end

local function resolve_weapon(name)
	if name == "weapon_wallbang" then
		return weapons.weapon_wallbang
	end

	return weapons[name]
end

local easing = require "gamesense/easing"
local pretty_json = require "gamesense/pretty_json"
local images = require "gamesense/images"
local table_gen = require "gamesense/table_gen"

local table_clear = require "table.clear"
local vector = require "vector"

local DEBUG
if false then
	DEBUG = {
		inspect = require("gamesense/inspect")
	}

	client.set_event_callback("paint_ui", function()
		if DEBUG.debug_text ~= nil then
			renderer.text(150, 150, 255, 255, 255, 255, "+", 0, DEBUG.debug_text)
		end
	end)
end

local SOURCE_TYPE_NAMES = {
	["remote"] = "Remote",
	["local"] = "Local",
	["local_file"] = "Local file"
}

local LOCATION_TYPE_NAMES = {
	grenade = "Grenade",
	wallbang = "Wallbang",
	movement = "Movement",
	location = "Location",
	area = "Area"
}

local LOCATION_TYPE_FROM_UI = {
	Grenade = "grenade",
	Movement = "movement",
	Location = "location",
	Area = "area"
}

local YAW_DIRECTION_OFFSETS = {
	Forward = 0,
	Back = 180,
	Left = 90,
	Right = -90
}

local MOVEMENT_BUTTONS_CHARS = {
	["in_attack"] = "A",
	["in_jump"] = "J",
	["in_duck"] = "D",
	["in_forward"] = "F",
	["in_moveleft"] = "L",
	["in_moveright"] = "R",
	["in_back"] = "B",
	["in_use"] = "U",
	["in_attack2"] = "Z",
	["in_speed"] = "S"
}

local MOVEMENT_ROTATION_KEYS = {
	"in_forward",
	"in_moveright",
	"in_back",
	"in_moveleft"
}

local GRENADE_WEAPON_NAMES = setmetatable({
	[weapons.weapon_smokegrenade] = "Smoke",
	[weapons.weapon_flashbang] = "Flashbang",
	[weapons.weapon_hegrenade] = "HE",
	[weapons.weapon_molotov] = "Molotov",
}, {
	__index = function(tbl, key)
		if type(key) == "table" and key.name ~= nil then
			tbl[key] = key.name
			return tbl[key]
		end
	end
})

local GRENADE_WEAPON_NAMES_UI = setmetatable({
	[weapons.weapon_smokegrenade] = "Smoke",
	[weapons.weapon_flashbang] = "Flashbang",
	[weapons.weapon_hegrenade] = "High Explosive",
	[weapons.weapon_molotov] = "Molotov",
}, {
	__index = GRENADE_WEAPON_NAMES
})

local WEAPON_ICONS = setmetatable({}, {
	__index = function(tbl, key)
		if key == nil then
			return
		end

		tbl[key] = images.get_weapon_icon(key)
		return tbl[key]
	end
})

local WEPAON_ICONS_OFFSETS = setmetatable({
	[WEAPON_ICONS["weapon_smokegrenade"]] = {0.2, -0.1, 0.35, 0},
	[WEAPON_ICONS["weapon_hegrenade"]] = {0.1, -0.12, 0.2, 0},
	[WEAPON_ICONS["weapon_molotov"]] = {0, -0.04, 0, 0},
}, {
	__index = function(tbl, key)
		tbl[key] = {0, 0, 0, 0}
		return tbl[key]
	end
})

local WEAPON_ALIASES = {
	[weapons["weapon_incgrenade"]] = weapons["weapon_molotov"],
	[weapons["weapon_firebomb"]] = weapons["weapon_molotov"],
	[weapons["weapon_frag_grenade"]] = weapons["weapon_hegrenade"],
}
for idx, weapon in pairs(weapons) do
	if weapon.type == "knife" then
		WEAPON_ALIASES[weapon] = weapons["weapon_knife"]
	end
end

local vector_index_i, vector_index_lookup = 1, {}
local VECTOR_INDEX = setmetatable({}, {
	__index = function(self, key)
		local id = string.format("%.2f %.2f %.2f", key:unpack())
		local index = vector_index_lookup[id]

		if index == nil then
			index = vector_index_i
			vector_index_lookup[id] = index
			vector_index_i = index + 1
		end

		self[key] = index
		return index
	end,
	__mode = "k"
})

local DEFAULTS = {
	visibility_offset = vector(0, 0, 24),
	fov = 0.7,
	fov_movement = 0.1,
	select_fov_rage = 25,
	max_dist = 6,
	destroy_text = "Break the object",
	source_ttl = 5
}

local limits = {
	ICON = 1500,
	TEXT = 650,
	CLOSE = 28,
	CLOSE_DRAW = 15,
	CORRECT = 0.12,
	WORLD_OFFSET = vector(0, 0, 8),
	WORLD_TOP_SIZE = 6,
}
limits.ICON_SQR = limits.ICON * limits.ICON
limits.COMBINE_SQR = 20 * 20

local INF = 1/0
local NULL_VECTOR = vector(0, 0, 0)
local FL_ONGROUND = 1

local CLR_TEXT_EDIT = {255, 16, 16}

local approach = {
	Z_OFFSET = 20,
	PLAYER_RADIUS = 16,
	OFFSETS_START = {
		vector(16*0.7, 0, 20),
		vector(-16*0.7, 0, 20),
		vector(0, 16*0.7, 20),
		vector(0, -16*0.7, 20),
	},
	OFFSETS_END = {
		vector(32, 0, 0),
		vector(0, 32, 0),
		vector(-32, 0, 0),
		vector(0, -32, 0),
	},
	INACCURATE_OFFSETS = {
		vector(0, 0, 0),
		vector(8, 0, 0),
		vector(-8, 0, 0),
		vector(0, 8, 0),
		vector(0, -8, 0),
	},
}

local benchmark = {
	start_times = {},
	measure = function(name, callback, ...)
		if not DEBUG then return end

		local start = client.timestamp()
		local values = {callback(...)}
		client.log(string.format("%s took %fms", name, client.timestamp()-start))

		return unpack(values)
	end,
	start = function(self, name)
		if not DEBUG then return end

		if self.start_times[name] ~= nil then
			client.error_log("benchmark: " .. name .. " wasn't finished before starting again")
		end
		self.start_times[name] = client.timestamp()
	end,
	finish = function(self, name)
		if not DEBUG then return end

		if self.start_times[name] == nil then
			return
		end

		client.log(string.format("%s took %fms", name, client.timestamp()-self.start_times[name]))
		self.start_times[name] = nil
	end
}

local icons = {}

-- bhop icon
icons.bhop = images.load_svg([[
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 158 200" height="200mm" width="158mm">
	<g style="mix-blend-mode:normal">
		<path d="m 27.692726,195.58287 c -2.00307,-2.00307 -2.362731,-5.63696 -1.252001,-12.64982 0.51631,-3.25985 0.938744,-6.15692 0.938744,-6.43794 0,-0.28102 -1.054647,-0.68912 -2.343659,-0.9069 -1.289012,-0.21778 -2.343659,-0.46749 -2.343659,-0.55491 0,-0.0874 0.894568,-2.10761 1.987932,-4.48934 4.178194,-9.10153 7.386702,-22.1671 7.386702,-30.07983 v -3.57114 l -3.439063,-0.65356 c -7.509422,-1.42712 -14.810239,-6.3854 -17.132592,-11.63547 -0.617114,-1.39509 -1.6652612,-5.2594 -2.3292172,-8.58736 -0.894299,-4.48252 -1.742757,-6.93351 -3.273486,-9.45625 -2.296839,-3.78538 -2.316583,-5.11371 -0.151099,-10.165583 0.632785,-1.47622 2.428356,-7.85932 3.990157,-14.18467 2.3650332,-9.578444 3.4874882,-12.902312 6.7157522,-19.887083 5.153317,-11.149867 5.357987,-11.987895 3.936721,-16.118875 -1.318135,-3.831228 -1.056436,-5.345174 1.69769,-9.821193 0.98924,-1.607722 2.121218,-4.129295 2.515508,-5.6035 C 25.28429,28.210324 25.23258,27.949807 23.35135,24.502898 21.710552,21.496527 21.306782,19.993816 20.889474,15.340532 20.614927,12.279129 20.380889,8.4556505 20.369393,6.8439185 l -0.02091,-2.930428 9.333915,0.83216 9.333914,0.832161 0.415652,4.4356115 c 0.228605,2.439587 0.232248,9.481725 0.0081,15.649196 l -0.407561,11.213581 3.401641,0.387936 c 1.8709,0.213363 4.456285,0.528941 5.745297,0.701283 l 2.343658,0.31335 0.01922,-4.58462 c 0.01523,-3.630049 0.300834,-5.120017 1.371678,-7.156027 3.087768,-5.870826 9.893488,-10.61208 17.039741,-11.87087 2.720173,-0.479148 4.160963,-0.409507 7.136663,0.344951 8.66897,2.197927 13.98192,9.621168 13.98192,19.535491 0,3.495649 -0.1404,3.901096 -1.99211,5.752805 -1.24394,1.243942 -2.56423,1.992111 -3.51549,1.992111 -1.49731,0 -1.52337,0.07107 -1.52337,4.153986 v 4.15399 l 8.9352,-0.237138 c 5.2858,-0.140285 11.170779,-0.674802 14.408789,-1.308719 l 5.4736,-1.071577 -0.38275,-2.552314 c -0.37145,-2.476984 -0.33603,-2.552315 1.19984,-2.552315 0.87041,0 1.91062,-0.448636 2.31157,-0.996969 0.68332,-0.93449 1.27483,-0.910186 9.43922,0.387872 4.86768,0.773912 12.32893,1.486871 16.91304,1.616118 4.51154,0.127203 8.93123,0.513358 9.82152,0.858128 2.24255,0.86843 2.71036,3.071333 1.03169,4.858196 -2.36272,2.515004 -4.22494,2.914196 -9.65444,2.069567 -6.49602,-1.010535 -9.48434,-0.608226 -12.89073,1.735433 -1.51944,1.045409 -3.78166,2.037422 -5.02716,2.204478 -2.12756,0.285364 -2.24441,0.404325 -1.93193,1.966706 0.54423,2.721143 -0.2472,4.489222 -3.68173,8.225132 -3.77119,4.102112 -4.63155,5.89093 -5.49449,11.423793 -0.94965,6.08886 -1.57396,7.52473 -5.32281,12.24226 -5.48499,6.90229 -11.865029,11.373083 -16.271159,11.401983 -2.96514,0.0195 -5.44164,-1.427403 -10.64598,-6.219683 -6.09285,-5.61044 -11.509723,-9.58715 -13.059111,-9.58715 -0.74413,0 -2.728788,1.56375 -5.069514,3.99435 -2.115662,2.19689 -4.279795,4.24027 -4.809188,4.54084 -0.873942,0.49619 -0.888303,0.97152 -0.156034,5.16456 0.443574,2.539953 1.213393,5.239093 1.710714,5.998093 1.234397,1.88393 4.464204,3.43033 10.249847,4.90755 11.894956,3.03704 24.227356,12.17082 28.700056,21.25618 3.277059,6.65665 3.756559,14.90456 1.06537,18.32585 -2.00495,2.54888 -4.71703,3.29933 -13.73034,3.79931 -12.02449,0.66702 -11.43259,0.30042 -25.191149,15.60203 -3.539415,3.93635 -4.947788,5.02545 -9.098134,7.03552 -6.030466,2.92066 -8.127669,5.18229 -9.759102,10.52427 -1.407053,4.60727 -3.889283,7.93618 -7.163048,9.60633 -3.066476,1.56439 -5.550268,1.48363 -7.270304,-0.2364 z M 99.119321,71.201503 c 3.729129,-4.724307 6.662059,-8.707839 6.517599,-8.852305 -0.14446,-0.144451 -2.7777,1.571678 -5.851649,3.813635 -4.38891,3.20102 -6.56642,4.363275 -10.1411,5.412849 -2.50365,0.73511 -4.68393,1.459682 -4.84506,1.610152 -0.31664,0.295703 6.47662,6.567603 7.13899,6.591103 0.22054,0.008 3.4521,-3.85113 7.18122,-8.575434 z" style="fill:#ffffff;fill-opacity:1;stroke:none;stroke-width:0.585916;stroke-opacity:1" />
	</g>
</svg>
]])

local function hsv_to_rgb(h, s, v)
	if s == 0 then
		return v, v, v
	end

	h = h / 60

	local hue_sector = math.floor(h)
	local hue_sector_offset = h - hue_sector

	local p = v * (1 - s)
	local q = v * (1 - s * hue_sector_offset)
	local t = v * (1 - s * (1 - hue_sector_offset))

	if hue_sector == 0 then
		return v, t, p
	elseif hue_sector == 1 then
		return q, v, p
	elseif hue_sector == 2 then
		return p, v, t
	elseif hue_sector == 3 then
		return p, q, v
	elseif hue_sector == 4 then
		return t, p, v
	elseif hue_sector == 5 then
		return v, p, q
	end
end

local function rgb_to_hsv(r, g, b)
	local v = math.max(r, g, b)
	local d = v - math.min(r, g, b)

	if 1 > d then
		return 0, 0, v
	end

	if v == 0 then
		return -1, 0, v
	end

	local s = d / v

	local h
	if r == v then
		h = (g - b) / d
	elseif g == v then
		h = 2 + (b - r) / d
	else
		h = 4 + (r - g) / d
	end

	h = h * 60
	if h < 0 then
		h = h + 360
	end

	return h, s, v
end

local function lerp(a, b, percentage)
	return a + (b - a) * percentage
end

local function table_contains(tbl, val)
	for i = 1, #tbl do
		if tbl[i] == val then
			return true
		end
	end
	return false
end

local function lerp_color(r1, g1, b1, a1, r2, g2, b2, a2, percentage)
	if percentage == 0 then
		return r1, g1, b1, a1
	elseif percentage == 1 then
		return r2, g2, b2, a2
	end

	local h1, s1, v1 = rgb_to_hsv(r1, g1, b1)
	local h2, s2, v2 = rgb_to_hsv(r2, g2, b2)

	local r, g, b = hsv_to_rgb(lerp(h1, h2, percentage), lerp(s1, s2, percentage), lerp(v1, v2, percentage))
	local a = lerp(a1, a2, percentage)

	return r, g, b, a
end

local function normalize_angles(pitch, yaw)
	if yaw ~= yaw or yaw == INF then
		yaw = 0
		yaw = yaw
	elseif not (yaw > -180 and yaw <= 180) then
		yaw = math.fmod(math.fmod(yaw + 360, 360), 360)
		yaw = yaw > 180 and yaw-360 or yaw
	end

	return math.max(-89, math.min(89, pitch)), yaw
end

local function deep_flatten(tbl, ignore_arr, out, prefix)
	if out == nil then
		out = {}
		prefix = ""
	end

	for key, value in pairs(tbl) do
		if type(value) == "table" and (not ignore_arr or #value == 0) then
			deep_flatten(value, ignore_arr, out, prefix .. key .. ".")
		else
			out[prefix .. key] = value
		end
	end

	return out
end

local function deep_compare(tbl1, tbl2)
	if tbl1 == tbl2 then
		return true
	elseif type(tbl1) == "table" and type(tbl2) == "table" then
		for key1, value1 in pairs(tbl1) do
			local value2 = tbl2[key1]

			if value2 == nil then
				return false
			elseif value1 ~= value2 then
				if type(value1) == "table" and type(value2) == "table" then
					if not deep_compare(value1, value2) then
						return false
					end
				else
					return false
				end
			end
		end

		for key2, _ in pairs(tbl2) do
			if tbl1[key2] == nil then
				return false
			end
		end

		return true
	end

	return false
end

local function rectangle_outline(x, y, w, h, r, g, b, a, s)
	s = s or 1
	renderer.rectangle(x, y, w, s, r, g, b, a) -- top
	renderer.rectangle(x, y+h-s, w, s, r, g, b, a) -- bottom
	renderer.rectangle(x, y+s, s, h-s*2, r, g, b, a) -- left
	renderer.rectangle(x+w-s, y+s, s, h-s*2, r, g, b, a) -- right
end

local function vector2_rotate(angle, x, y)
	local sin = math.sin(angle)
	local cos = math.cos(angle)

	local x_n = x * cos - y * sin
	local y_n = x * sin + y * cos

	return x_n, y_n
end

local function vector2_dist(x1, y1, x2, y2)
	local dx = x2-x1
	local dy = y2-y1

	return math.sqrt(dx*dx + dy*dy)
end

local function reset_cvar(cvar)
	local val = tonumber(cvar:get_string())
	cvar:set_raw_int(val)
	cvar:set_raw_float(val)
end

local function triangle_rotated(x, y, width, height, angle, r, g, b, a)
	local a_x, a_y = vector2_rotate(angle, width/2, 0)
	local b_x, b_y = vector2_rotate(angle, 0, height)
	local c_x, c_y = vector2_rotate(angle, width, height)

	local o_x, o_y = vector2_rotate(angle, -width/2, -height/2)
	x, y = x + o_x, y + o_y

	renderer.triangle(x+a_x,y+a_y, x+b_x,y+b_y, x+c_x,y+c_y, r, g, b, a)
end

local function randomid(size)
	local str = ""
	for i=1, (size or 32) do
		str = str .. string.char(client.random_int(97, 122))
	end
	return str
end

local crc32_lt = {}
local function crc32(s, lt)
	lt = lt or crc32_lt
	local b, crc, mask
	if not lt[1] then
		for i = 1, 256 do
			crc = i - 1
			for _ = 1, 8 do
				mask = -bit.band(crc, 1)
				crc = bit.bxor(bit.rshift(crc, 1), bit.band(0xedb88320, mask))
			end
			lt[i] = crc
		end
	end

	crc = 0xffffffff
	for i = 1, #s do
		b = string.byte(s, i)
		crc = bit.bxor(bit.rshift(crc, 8), lt[bit.band(bit.bxor(crc, b), 0xFF) + 1])
	end
	return bit.band(bit.bnot(crc), 0xffffffff)
end

local function table_map(tbl, callback)
	local new = {}
	for key, value in pairs(tbl) do
		new[key] = callback(value)
	end
	return new
end

local function table_map_assoc(tbl, callback)
	local new = {}
	for key, value in pairs(tbl) do
		local new_key, new_value = callback(key, value)
		new[new_key] = new_value
	end
	return new
end

local function format_duration(secs, ignore_seconds, max_parts)
	local units, dur, part = {"day", "hour", "minute"}, "", 1
	max_parts = max_parts or 4

	for i, v in ipairs({86400, 3600, 60}) do
		if part > max_parts then
			break
		end

		if secs >= v then
			dur = dur .. math.floor(secs / v) .. " " .. units[i] .. (math.floor(secs / v) > 1 and "s" or "") .. ", "
			secs = secs % v
			part = part + 1
		end
	end

	if secs == 0 or ignore_seconds or part > max_parts then
		return dur:sub(1, -3)
	else
		secs = math.floor(secs)
		return dur .. secs .. (secs > 1 and " seconds" or " second")
	end
end

local function console_log_json(str)
end

local function is_grenade_being_thrown(weapon, cmd)
	local pin_pulled = entity.get_prop(weapon, "m_bPinPulled")
	if pin_pulled ~= nil then
		if pin_pulled == 0 or cmd.in_attack == 1 or cmd.in_attack2 == 1 then
			local throw_time = entity.get_prop(weapon, "m_fThrowTime")
			if throw_time ~= nil and throw_time > 0 and throw_time < globals.curtime() then
				return true
			end
		end
	end
	return false
end

local function trace_line_debug(entindex_skip, sx, sy, sz, tx, ty, tz)
	-- print(string.format("called trace_line with source=%s %s %s, target=%s %s %s", sx, sy, sz, tx, ty, tz))
	return client.trace_line(entindex_skip, sx, sy, sz, tx, ty, tz)
end

local function trace_line_skip_entities(start, target, max_traces)
	max_traces = max_traces or 10
	local fraction, entindex_hit = 0, -1
	local hit = start

	local i = 0
	while max_traces >= i and fraction < 1 and (entindex_hit > -1 or i == 0) do
		local hx, hy, hz = hit:unpack()
		fraction, entindex_hit = client.trace_line(entindex_hit, hx, hy, hz, target:unpack())

		hit = hit:lerp(target, fraction)
		i = i + 1
	end

	fraction = start:dist(hit) / start:dist(target)

	return fraction, entindex_hit, hit
end

local native_GetWorldToScreenMatrix = vtable_bind("engine.dll", "VEngineClient014", 37, "struct {float m[4][4];}&(__thiscall*)(void*)")

local function world_to_screen_offscreen(x, y, z, matrix, screen_width, screen_height)
	matrix = matrix or native_GetWorldToScreenMatrix()

	local wx = matrix.m[0][0] * x + matrix.m[0][1] * y + matrix.m[0][2] * z + matrix.m[0][3]
	local wy = matrix.m[1][0] * x + matrix.m[1][1] * y + matrix.m[1][2] * z + matrix.m[1][3]
	local ww = matrix.m[3][0] * x + matrix.m[3][1] * y + matrix.m[3][2] * z + matrix.m[3][3]

	local in_front
	if ww < 0.001 then
		local invw = -1.0 / ww
		in_front = false
		wx = wx * invw
		wy = wy * invw
	else
		local invw = 1.0 / ww
		in_front = true
		wx = wx * invw
		wy = wy * invw
	end

	if type(wx) ~= "number" or type(wy) ~= "number" then
	  return
	end

	if screen_width == nil then
		screen_width, screen_height = client.screen_size()
	end

	wx = screen_width / 2 + (0.5 * wx * screen_width + 0.5)
	wy = screen_height / 2 - (0.5 * wy * screen_height + 0.5)

	return wx, wy, in_front, ww
end

local function world_to_screen_offscreen_circle(x, y, z, matrix, screen_width, screen_height, cd)
	local wx, wy, in_front = world_to_screen_offscreen(x, y, z, matrix, screen_width, screen_height)

	if wx == nil then
		return
	end

	if cd > wx or wx > screen_width-cd or cd > wy or wy > screen_height-cd or not in_front then
		local cx, cy = screen_width/2, screen_height/2

		local angle = math.atan2(wy-cy, wx-cx)

		local radius = math.min(screen_width, screen_height) / 2 - cd
		local wx_n = cx + radius * math.cos(angle)
		local wy_n = cy + radius * math.sin(angle)

		return wx_n, wy_n, true
	else
		return wx, wy, false
	end
end

local function line_intersection(a_s_x, a_s_y, a_e_x, a_e_y, b_s_x, b_s_y, b_e_x, b_e_y)
	local d = (a_s_x - a_e_x) * (b_s_y - b_e_y) - (a_s_y - a_e_y) * (b_s_x - b_e_x)
	local a = a_s_x * a_e_y - a_s_y * a_e_x
	local b = b_s_x * b_e_y - b_s_y * b_e_x
	local x = (a * (b_s_x - b_e_x) - (a_s_x - a_e_x) * b) / d
	local y = (a * (b_s_y - b_e_y) - (a_s_y - a_e_y) * b) / d
	return x, y
end

local function world_to_screen_offscreen_rect(x, y, z, matrix, screen_width, screen_height, cd)
	local wx, wy, in_front = world_to_screen_offscreen(x, y, z, matrix, screen_width, screen_height)

	if wx == nil then
		return
	end

	if not in_front or cd > wx or wx > screen_width-cd or cd > wy or wy > screen_height-cd then
		local cx, cy = screen_width/2, screen_height/2
		if not in_front then
			local angle = math.atan2(wy-cy, wx-cx)
			local radius = math.max(screen_width, screen_height)
			wx = cx + radius * math.cos(angle)
			wy = cy + radius * math.sin(angle)
		end

		local border_vectors = {
			cd, cd, screen_width-cd, cd,
			screen_width-cd, cd, screen_width-cd, screen_height-cd,
			cd, cd, cd, screen_height-cd,
			cd, screen_height-cd, screen_width-cd, screen_height-cd
		}

		for i=1, #border_vectors, 4 do
			local s_x, s_y, e_x, e_y = border_vectors[i], border_vectors[i+1], border_vectors[i+2], border_vectors[i+3]
			local i_x, i_y = line_intersection(s_x, s_y, e_x, e_y, cx, cy, wx, wy)

			if (i == 1 and wy < cd and i_x >= cd and i_x <= screen_width-cd) or
				 (i == 5 and wx > screen_width-cd and i_y >= cd and i_y <= screen_height-cd) or
				 (i == 9 and wx < cd and i_y >= cd and i_y <= screen_height-cd) or
				 (i == 13 and wy > screen_height-cd and i_x >= cd and i_x <= screen_width-cd) then
				return i_x, i_y, false
			end
		end

		return wx, wy, false
	end

	return wx, wy, true
end

local function world_to_screen_offscreen_rect_2(x, y, z, matrix, screen_width, screen_height, cd)
	local wx, wy, in_front = world_to_screen_offscreen(x, y, z, matrix, screen_width, screen_height)

	if wx == nil then
		return
	end

	if not in_front or cd > wx or wx > screen_width-cd or cd > wy or wy > screen_height-cd then
		local cx, cy = screen_width/2, screen_height/2

		if not in_front then
			local angle = math.atan2(wy-cy, wx-cx)

			local radius = math.max(screen_width, screen_height)
			wx = cx + radius * math.cos(angle)
			wy = cy + radius * math.sin(angle)
		end

		local border_vectors = {
			cd, cd, screen_width-cd, cd,
			screen_width-cd, cd, screen_width-cd, screen_height-cd
		}

		for i=1, #border_vectors, 4 do
			local s_x, s_y, e_x, e_y = border_vectors[i], border_vectors[i+1], border_vectors[i+2], border_vectors[i+3]
			local i_x, i_y = line_intersection(s_x, s_y, e_x, e_y, cx, cy, wx, wy)

			renderer.rectangle(i_x-4, i_y-4, 8, 8, 255, 0, 0, 255)

			if (i == 1 and wy < cd and i_x >= cd and i_x <= screen_width-cd) or
				 (i == 5 and wx > screen_width-cd and i_y >= cd and i_y <= screen_height-cd) then
				return i_x, i_y, false
			elseif (i == 1 and false) then
			end
		end

		return wx, wy, false
	end

	return wx, wy, true
end

local MOVEMENT_BUTTONS_CHARS_INV = table_map_assoc(MOVEMENT_BUTTONS_CHARS, function(k, v) return v, k end)

local function parse_buttons_str(str)
	local buttons_down, buttons_up = {}, {}

	for c in str:gmatch(".") do
		if c:lower() == c then
			table.insert(buttons_up, MOVEMENT_BUTTONS_CHARS_INV[c:upper()] or false)
		else
			table.insert(buttons_down, MOVEMENT_BUTTONS_CHARS_INV[c] or false)
		end
	end

	return buttons_down, buttons_up
end

local function sanitize_string(str)
	str = tostring(str)
	str = str:gsub('[%c]', '')

	return str
end

local js_api = panorama.loadstring([[
	var _GetTimestamp = function() {
		return Date.now()/1000
	}

	var _FormatTimestamp = function(timestamp) {
		var date = new Date(timestamp * 1000)

		return `${date.getMonth() + 1}/${date.getDate()}/${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}`
	}

	return {
		get_timestamp: _GetTimestamp,
		format_timestamp: _FormatTimestamp
	}
]])()

local format_timestamp = setmetatable({}, {
	__index = function(tbl, ts)
		tbl[ts] = js_api.format_timestamp(ts)
		return tbl[ts]
	end
})

local realtime_offset = js_api.get_timestamp() - globals.realtime()

local function get_unix_timestamp()
	return globals.realtime() + realtime_offset
end

local function format_unix_timestamp(timestamp, allow_future, ignore_seconds, max_parts)
	local secs = timestamp - get_unix_timestamp()

	if secs < 0 or allow_future then
		local duration = format_duration(math.abs(secs), ignore_seconds, max_parts)
		return secs > 0 and ("In " .. duration) or (duration .. " ago")
	else
		return format_timestamp[timestamp]
	end
end

local get_clipboard_text, set_clipboard_text, get_weapon_icon

do
	if pcall(client.create_interface) then
		local ffi = require "ffi"
		local function vmt_entry(instance, index, type)
			return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])
		end
		local function vmt_bind(module, interface, index, typestring)
			local instance = client.create_interface(module, interface) or error("invalid interface")
			local fnptr = vmt_entry(instance, index, ffi.typeof(typestring)) or error("invalid vtable")
			return function(...)
				return fnptr(instance, ...)
			end
		end

		local native_GetClipboardTextCount = vmt_bind("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
		local native_SetClipboardText = vmt_bind("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)")
		local native_GetClipboardText = vmt_bind("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")

		local new_char_arr = ffi.typeof("char[?]")

		function get_clipboard_text()
			local len = native_GetClipboardTextCount()
			if len > 0 then
				local char_arr = new_char_arr(len)
				native_GetClipboardText(0, char_arr, len)
				return ffi.string(char_arr, len-1)
			end
		end

		function set_clipboard_text(text)
			native_SetClipboardText(text, text:len())
		end
	end
end


local function calculate_move(btn1, btn2)
	return btn1 and 450 or (btn2 and -450 or 0)
end

local function compute_move(forwardmove, sidemove, from_pitch, from_yaw, to_pitch, to_yaw)
	local eps = 1e-12

	if eps > math.abs(forwardmove) and eps > math.abs(sidemove) then
		return forwardmove, sidemove
	end

	local from_fwd = vector():init_from_angles(from_pitch, from_yaw)
	local from_right = from_fwd:vectors()

	from_fwd.z = 0
	from_right.z = 0
	from_fwd:normalize()
	from_right:normalize()

	local to_fwd = vector():init_from_angles(to_pitch, to_yaw)
	local to_right = to_fwd:vectors()

	to_fwd.z = 0
	to_right.z = 0
	to_fwd:normalize()
	to_right:normalize()

	local wish = vector(
		to_fwd.x * forwardmove + to_right.x * sidemove,
		to_fwd.y * forwardmove + to_right.y * sidemove,
		0
	)

	local det = from_fwd.x * from_right.y - from_right.x * from_fwd.y
	local new_forward = (from_right.y * wish.x - from_right.x * wish.y) / det
	local new_side = (from_fwd.x * wish.y - from_fwd.y * wish.x) / det

	new_forward = math.min(math.max(new_forward, -450), 450)
	new_side = math.min(math.max(new_side, -450), 450)

	if eps > math.abs(new_forward) then
		new_forward = 0
	end

	if eps > math.abs(new_side) then
		new_side = 0
	end

	return new_forward, new_side
end

local function compress_usercmds(usercmds)
	local frames = {}

	local current = {
		viewangles = {pitch=usercmds[1].pitch, yaw=usercmds[1].yaw},
		buttons = {}
	}

	for key, char in pairs(MOVEMENT_BUTTONS_CHARS) do
		current.buttons[key] = false
	end

	local empty_count = 0
	for i, cmd in ipairs(usercmds) do
		local buttons = ""

		for btn, value_prev in pairs(current.buttons) do
			if cmd[btn] and not value_prev then
				buttons = buttons .. MOVEMENT_BUTTONS_CHARS[btn]
			elseif not cmd[btn] and value_prev then
				buttons = buttons .. MOVEMENT_BUTTONS_CHARS[btn]:lower()
			end
			current.buttons[btn] = cmd[btn]
		end

		local frame = {cmd.pitch-current.viewangles.pitch, cmd.yaw-current.viewangles.yaw, buttons, cmd.forwardmove, cmd.sidemove}
		current.viewangles = {pitch=cmd.pitch, yaw=cmd.yaw}

		if frame[#frame] == calculate_move(cmd.in_moveright, cmd.in_moveleft) then
			frame[#frame] = nil

			if frame[#frame] == calculate_move(cmd.in_forward, cmd.in_back) then
				frame[#frame] = nil

				if frame[#frame] == "" then
					frame[#frame] = nil

					if frame[#frame] == 0 then
						frame[#frame] = nil

						if frame[#frame] == 0 then
							frame[#frame] = nil
						end
					end
				end
			end
		end

		if #frame > 0 then
			if empty_count > 0 then
				table.insert(frames, empty_count)
				empty_count = 0
			end

			table.insert(frames, frame)
		else
			empty_count = empty_count + 1
		end
	end

	if empty_count > 0 then
		table.insert(frames, empty_count)
		empty_count = 0
	end

	return frames
end

local function count_movement_frames(frames)
	if type(frames) ~= "table" then
		return 0
	end

	local count = 0
	for i = 1, #frames do
		local frame = frames[i]
		count = count + (type(frame) == "number" and frame or 1)
	end

	return count
end

local function steps_to_usercmds(steps)
	local usercmds = {}

	for i = 1, #steps do
		local step = steps[i]
		local buttons = step.buttons or {}
		local viewangles = step.viewangles or {}

		usercmds[i] = {
			pitch = viewangles[1] or 0,
			yaw = viewangles[2] or 0,
			move_yaw = step.move_yaw or viewangles[2] or 0,
			forwardmove = step.forwardmove or 0,
			sidemove = step.sidemove or 0,
			in_forward = buttons.in_forward == true,
			in_back = buttons.in_back == true,
			in_moveleft = buttons.in_moveleft == true,
			in_moveright = buttons.in_moveright == true,
			in_jump = buttons.in_jump == true,
			in_duck = buttons.in_duck == true,
			in_attack = buttons.in_attack == true,
			in_attack2 = buttons.in_attack2 == true,
			in_speed = buttons.in_speed == true,
			in_use = buttons.in_use == true,
		}
	end

	return usercmds
end

local function steps_to_movement_commands(steps)
	local commands = {}

	for i = 1, #steps do
		local step = steps[i]
		local buttons = step.buttons or {}
		local viewangles = step.viewangles or {}
		local pitch, yaw = viewangles[1] or 0, viewangles[2] or 0

		commands[i] = {
			pitch = pitch,
			yaw = yaw,
			move_yaw = step.move_yaw or yaw,
			forwardmove = step.forwardmove or calculate_move(buttons.in_forward, buttons.in_back),
			sidemove = step.sidemove or calculate_move(buttons.in_moveright, buttons.in_moveleft),
			in_forward = buttons.in_forward == true,
			in_back = buttons.in_back == true,
			in_moveleft = buttons.in_moveleft == true,
			in_moveright = buttons.in_moveright == true,
			in_jump = buttons.in_jump == true,
			in_duck = buttons.in_duck == true,
			in_attack = buttons.in_attack == true,
			in_attack2 = buttons.in_attack2 == true,
			in_speed = buttons.in_speed == true,
			in_use = buttons.in_use == true,
		}
	end

	return commands
end

local function location_tbl_for_edit_display(location)
	if type(location) ~= "table" or type(location.movement) ~= "table" then
		return location
	end

	if type(location.movement.frames) ~= "table" and type(location.movement.steps) ~= "table" then
		return location
	end

	local display, movement = {}, {}
	for key, value in pairs(location) do
		display[key] = value
	end
	for key, value in pairs(location.movement) do
		if key ~= "frames" and key ~= "steps" then
			movement[key] = value
		end
	end

	if type(location.movement.steps) == "table" then
		movement.frames = string.format("%d frames", #location.movement.steps)
	else
		movement.frames = string.format("%d frames", count_movement_frames(location.movement.frames))
	end

	display.movement = movement
	return display
end

local function get_map_pattern()
	local world = 0

	local mins = vector(entity.get_prop(world, "m_WorldMins"))
	local maxs = vector(entity.get_prop(world, "m_WorldMaxs"))

	local str
	if mins ~= NULL_VECTOR or maxs ~= NULL_VECTOR then
		str = string.format("bomb_%.2f_%.2f_%.2f %.2f_%.2f_%.2f", mins.x, mins.y, mins.z, maxs.x, maxs.y, maxs.z)
	end

	if str ~= nil then
		return crc32(str)
	end

	return nil
end

local MAP_PATTERNS = {
	[-2011174878] = "de_train",
	[-1890957714] = "ar_shoots",
	[-1768287648] = "dz_blacksite",
	[-1752602089] = "de_inferno",
	[-1639993233] = "de_mirage",
	[-1621571143] = "de_dust",
	[-1541779215] = "de_sugarcane",
	[-1439577949] = "de_canals",
	[-1411074561] = "de_tulip",
	[-1348292803] = "cs_apollo",
	[-1218081885] = "de_guard",
	[-923663825]  = "dz_frostbite",
	[-768791216]  = "de_dust2",
	[-692592072]  = "cs_italy",
	[-542128589]  = "ar_monastery",
	[-222265935]  = "ar_baggage",
	[-182586077]  = "de_aztec",
	[371013699]   = "de_stmarc",
	[405708653]   = "de_overpass",
	[549370830]   = "de_lake",
	[790893427]   = "dz_sirocco",
	[792319475]   = "de_ancient",
	[878725495]   = "de_bank",
	[899765791]   = "de_safehouse",
	[1014664118]  = "cs_office",
	[1238495690]  = "ar_dizzy",
	[1364328969]  = "cs_militia",
	[1445192006]  = "de_engage",
	[1463756432]  = "cs_assault",
	[1476824995]  = "de_vertigo",
	[1507960924]  = "cs_agency",
	[1563115098]  = "de_nuke",
	[1722587796]  = "de_dust2_old",
	[1850283081]  = "de_anubis",
	[1900771637]  = "de_cache",
	[1964982021]  = "de_elysion",
	[2041417734]  = "de_cbble",
	[2056138930]  = "gd_rialto"
}

local MAP_LOOKUP = {
	de_shortnuke = "de_nuke",
	de_shortdust = "de_shortdust",
}

local mapname_cache = {}
local function get_mapname()
	local mapname_raw = globals.mapname()

	if mapname_raw == nil then
		return
	end

	if mapname_cache[mapname_raw] == nil then
		local mapname = mapname_raw:gsub("_scrimmagemap$", "")

		if MAP_LOOKUP[mapname] ~= nil then
			mapname = MAP_LOOKUP[mapname]
		else
			local is_first_party_map = false
			for key, value in pairs(MAP_PATTERNS) do
				if value == mapname then
					is_first_party_map = true
					break
				end
			end

			if not is_first_party_map then
				local pattern = get_map_pattern()

				if MAP_PATTERNS[pattern] ~= nil then
					mapname = MAP_PATTERNS[pattern]
				end
			end
		end

		mapname_cache[mapname_raw] = mapname
	end

	return mapname_cache[mapname_raw]
end

if DEBUG then
	ui.new_label("LUA", "A", "Helper: Debug")
	ui.new_button("LUA", "A", "Create helper map patterns", function()
		local maps = {
			"de_cache",
			"de_mirage",
			"de_dust2",
			"de_inferno",
			"de_overpass",
			"de_canals",
			"de_train",
			"cs_office",
			"cs_agency",
			"de_vertigo",
			"de_lake",
			"de_nuke",
			"de_safehouse",
			"dz_blacksite",
			"cs_assault",
			"ar_monastery",
			"de_cbble",
			"cs_italy",
			"cs_militia",
			"de_stmarc",
			"ar_baggage",
			"ar_shoots",
			"de_sugarcane",
			"ar_dizzy",
			"de_dust",
			"de_bank",

			"de_tulip",
			"de_aztec",
			"gd_rialto",
			"de_dust2_old",

			"dz_sirocco",
			"de_anubis",

			"cs_apollo",
			"de_ancient",
			"de_elysion",
			"de_engage",
			"dz_frostbite",
			"de_guard"
		}

		MAP_PATTERNS = {}

		DEBUG.create_map_patterns_count = #maps
		DEBUG.create_map_patterns_next = {}
		DEBUG.create_map_patterns_index = {}
		DEBUG.create_map_patterns_failed = {}
		for i=1, #maps do
			local map = maps[i]
			if DEBUG.create_map_patterns_next[map] ~= nil then
				error("Duplicate map " .. map)
			end
			DEBUG.create_map_patterns_next[map] = maps[i+1]
			DEBUG.create_map_patterns_index[map] = i
		end

		-- print(DEBUG.inspect(DEBUG.create_map_patterns_next))

		DEBUG.create_map_patterns = true
		DEBUG.debug_text = "create_map_patterns progress: " .. 1 .. " / " .. DEBUG.create_map_patterns_count
		client.delay_call(0.5, client.exec, "map ", maps[1])
	end)
end


benchmark:start("db_read")
local db = database.read("helper") or {}
db.sources = db.sources or {}
benchmark:finish("db_read")

if DEBUG and readfile("helper_data.json") then
	table.insert(db.sources, {
		name = "helper_data.json",
		id = "builtin_local_file",
		type = "local_file",
		filename = "helper_data.json",
		description = "Local file for testing",
		builtin = true
	})

	local store_db = (database.read("helper_store") or {})
	store_db.locations = store_db.locations or {}
	store_db.locations["builtin_local_file"] = {}
end

local rt = {}
rt.sources_locations = {}
rt.map_locations = {}
rt.active_locations = nil
rt.location_set_closest = nil
rt.location_selected = nil
rt.location_playback = nil
rt.weapon_prev = nil
rt.last_vischeck = 0
rt.active_locations_in_range = nil
rt.populate_seen_fingerprints = {}

local pb = {
	PREPARE = 1,
	RUN = 2,
	THROW = 3,
	THROWN = 4,
	FINISHED = 5,
	state = nil,
	begin = nil,
	sensitivity_set = nil,
	weapon = nil,
	data = {},
	ui_restore = {},
	movetype_prev = nil,
	waterlevel_prev = nil,
}

do 

local function flush_active_locations(reason)
	rt.active_locations = nil
	table_clear(rt.map_locations)
	-- print("flush_active_locations(", reason, ")")
end

local tickrates_mt = {
	__index = function(tbl, key)
		if tbl.tickrate ~= nil then
			return key / tbl.tickrate
		end
	end
}

local location_mt = {
	__index = {
		get_type_string = function(self)
			if self.type == "grenade" then
				local names = table_map(self.weapons, function(weapon) return GRENADE_WEAPON_NAMES[weapon] end)
				return table.concat(names, "/")
			else
				return LOCATION_TYPE_NAMES[self.type] or self.type
			end
		end,
		get_export_tbl = function(self)
			local tbl = {
				name = (self.name == self.full_name) and self.name or {self.full_name:match("^(.*) to (.*)$")},
				description = self.description,
				weapon = #self.weapons == 1 and self.weapons[1].console_name or table_map(self.weapons, function(weapon) return weapon.console_name end),
				position = {self.position.x, self.position.y, self.position.z},
				viewangles = {self.viewangles.pitch, self.viewangles.yaw},
			}

			if getmetatable(self.tickrates) == tickrates_mt then
				if self.tickrates.tickrate_set then
					tbl.tickrate = self.tickrates.tickrate
				end
			elseif self.tickrates.orig ~= nil then
				tbl.tickrate = self.tickrates.orig
			end

			if self.approach_accurate ~= nil then
				tbl.approach_accurate = self.approach_accurate
			end

			if self.type == "location" or self.type == "area" then
				tbl.type = self.type
			end

			if self.duckamount ~= 0 then
				tbl.duck = self.duckamount == 1 and true or self.duckamount
			end

			if self.position_visibility_different then
				tbl.position_visibility = {
					self.position_visibility.x-self.position.x,
					self.position_visibility.y-self.position.y,
					self.position_visibility.z-self.position.z
				}
			end

			if self.type == "grenade" then
				tbl.grenade = {
					fov = self.fov ~= DEFAULTS.fov and self.fov or nil,
					jump = self.jump and true or nil,
					strength = self.throw_strength ~= 1 and self.throw_strength or nil,
					run = self.run_duration ~= nil and self.run_duration or nil,
					run_yaw = self.run_yaw ~= self.viewangles.yaw and self.run_yaw-self.viewangles.yaw or nil,
					run_speed = self.run_speed ~= nil and self.run_speed or nil,
					recovery_yaw = self.recovery_yaw ~= nil and self.recovery_yaw-self.run_yaw or nil,
					recovery_jump = self.recovery_jump and true or nil,
					delay = self.delay > 0 and self.delay or nil
				}

				if next(tbl.grenade) == nil then
					tbl.grenade = nil
				end
			elseif self.type == "movement" then
				local frames = {}
				tbl.movement = {
					frames = compress_usercmds(self.movement_commands)
				}
			end

			if self.destroy_text ~= nil then
				tbl.destroy = {
					["start"] = self.destroy_start and {self.destroy_start:unpack()} or nil,
					["end"] = {self.destroy_end:unpack()},
					["text"] = self.destroy_text ~= DEFAULTS.destroy_text and self.destroy_text or nil,
				}
			end

			return tbl
		end,
		get_export = function(self, fancy)
			local tbl = self:get_export_tbl()
			local indent = "  "

			local json_str
			if fancy then
				local default_keys, default_fancy, seen = {"name", "description", "weapon", "position", "viewangles", "position_visibility", "grenade"}, {["grenade"] = 1}, {}
				local result = {}

				for i=1, #default_keys do
					local key = default_keys[i]
					local value = tbl[key]
					if value ~= nil then
						local str = default_fancy[key] == 1 and pretty_json.stringify(value, "\n", indent) or json.stringify(value)

						if type(value[1]) == "number" and type(value[2]) == "number" and (value[3] == nil or type(value[3]) == "number") then
							str = str:gsub(",", ", ")
						else
							str = str:gsub("\",\"", "\", \"")
						end

						table.insert(result, string.format("\"%s\": %s", key, str))
						tbl[key] = nil
					end
				end

				for key, value in pairs(tbl) do
					table.insert(result, string.format("\"%s\": %s", key, pretty_json.stringify(tbl[key], "\n", indent)))
				end

				json_str = "{\n" .. indent .. table.concat(result, ",\n"):gsub("\n", "\n" .. indent) .. "\n}"
			else
				json_str = json.stringify(tbl)
			end

			return json_str
		end
	}
}

local function editing_location_is_previewable(tbl)
	if type(tbl) ~= "table" then
		return false
	end

	local name = tbl.name
	if type(name) == "string" then
		if name:len() == 0 then
			return false
		end
	elseif type(name) == "table" then
		if #name ~= 2 then
			return false
		end
	else
		return false
	end

	if type(tbl.position) ~= "table" or #tbl.position ~= 3 then
		return false
	end

	local x, y, z = tbl.position[1], tbl.position[2], tbl.position[3]
	if type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number" then
		return false
	end

	if type(tbl.viewangles) ~= "table" or #tbl.viewangles ~= 2 then
		return false
	end

	local pitch, yaw = tbl.viewangles[1], tbl.viewangles[2]
	if type(pitch) ~= "number" or type(yaw) ~= "number" then
		return false
	end

	local weapon = tbl.weapon
	if type(weapon) == "string" then
		return resolve_weapon(weapon) ~= nil
	elseif type(weapon) == "table" and #weapon > 0 then
		for i=1, #weapon do
			if resolve_weapon(weapon[i]) == nil then
				return false
			end
		end
		return true
	end

	return false
end

local function create_location(location_parsed)
	if type(location_parsed) ~= "table" then
		return "wrong type, expected table"
	end

	if getmetatable(location_parsed) == location_mt then
		return "trying to create an already created location"
	end

	local location = {}

	if type(location_parsed.name) == "string" and location_parsed.name:len() > 0 then
		location.name = sanitize_string(location_parsed.name)
		location.full_name = location.name
	elseif type(location_parsed.name) == "table" and #location_parsed.name == 2 then
		location.name = sanitize_string(location_parsed.name[2])
		location.full_name = sanitize_string(string.format("%s to %s", location_parsed.name[1], location_parsed.name[2]))
	else
		-- print(DEBUG.inspect(location.name))
		return "invalid name, expected string or table of length 2"
	end

	if type(location_parsed.description) == "string" and location_parsed.description:len() > 0 then
		location.description = location_parsed.description
	elseif location_parsed.description ~= nil then
		return "invalid description, expected nil or non-empty string"
	end

	if type(location_parsed.weapon) == "string" then
		local weapon = resolve_weapon(location_parsed.weapon)
		if weapon == nil then
			return string.format("invalid weapon (%s)", tostring(location_parsed.weapon))
		end

		location.weapons = {weapon}
		location.weapons_assoc = {[weapon] = true}
	elseif type(location_parsed.weapon) == "table" and #location_parsed.weapon > 0 then
		location.weapons = {}
		location.weapons_assoc = {}

		for i=1, #location_parsed.weapon do
			local weapon = resolve_weapon(location_parsed.weapon[i])
			if weapon ~= nil then
				if location.weapons_assoc[weapon] then
					return "duplicate weapon: " .. location_parsed.weapon[i]
				else
					location.weapons[i] = weapon
					location.weapons_assoc[weapon] = true
				end
			else
				return "invalid weapon: " .. location_parsed.weapon[i]
			end
		end
	else
		return string.format("invalid weapon (%s)", tostring(location_parsed.weapon))
	end

	if type(location_parsed.strafer) == "table" then
		location.strafer = location_parsed.strafer
	end

	if type(location_parsed.position) == "table" and #location_parsed.position == 3 then
		local x, y, z = unpack(location_parsed.position)

		if type(x) == "number" and type(y) == "number" and type(z) == "number" then
			location.position = vector(x, y, z)
			location.position_visibility = location.position + DEFAULTS.visibility_offset
			location.position_id = VECTOR_INDEX[location.position]
		else
			return "invalid type in position"
		end
	else
		return "invalid position"
	end

	if type(location_parsed.position_visibility) == "table" and #location_parsed.position_visibility == 3 then
		local x, y, z = unpack(location_parsed.position_visibility)

		if type(x) == "number" and type(y) == "number" and type(z) == "number" then
			local origin = location.position
			location.position_visibility = vector(origin.x+x, origin.y+y, origin.z+z)
			location.position_visibility_different = true
		else
			return "invalid type in position_visibility"
		end
	elseif location_parsed.position_visibility ~= nil then
		return "invalid position_visibility"
	end

	if type(location_parsed.viewangles) == "table" and #location_parsed.viewangles == 2 then
		local pitch, yaw = unpack(location_parsed.viewangles)

		if type(pitch) == "number" and type(yaw) == "number" then
			location.viewangles = {
				pitch = pitch,
				yaw = yaw
			}
			location.viewangles_forward = vector():init_from_angles(pitch, yaw)
		else
			return "invalid type in viewangles"
		end
	else
		return "invalid viewangles"
	end

	if type(location_parsed.approach_accurate) == "boolean" then
		location.approach_accurate = location_parsed.approach_accurate
	elseif location_parsed.approach_accurate ~= nil then
		return "invalid approach_accurate"
	end

	if location_parsed.duck == nil or type(location_parsed.duck) == "boolean" then
		location.duckamount = location_parsed.duck and 1 or 0
	else
		return string.format("invalid duck value (%s)", tostring(location_parsed.duck))
	end
	location.eye_pos = location.position + vector(0, 0, 64-location.duckamount*18)

	if (type(location_parsed.tickrate) == "number" and location_parsed.tickrate > 0) or location_parsed.tickrate == nil then
		location.tickrates = setmetatable({
			tickrate = location_parsed.tickrate or 64,
			tickrate_set = location_parsed.tickrate ~= nil
		}, tickrates_mt)
	elseif type(location_parsed.tickrate) == "table" and #location_parsed.tickrate > 0 then
		location.tickrates = {
			orig = location_parsed.tickrate
		}

		local orig_tickrate

		for i=1, #location_parsed.tickrate do
			local tickrate = location_parsed.tickrate[i]
			if type(tickrate) == "number" and tickrate > 0 then
				if orig_tickrate == nil then
					orig_tickrate = tickrate
					location.tickrates[tickrate] = 1
				else
					location.tickrates[tickrate] = orig_tickrate/tickrate
				end
			else
				return "invalid tickrate: " .. tostring(location_parsed.tickrate[i])
			end
		end
	else
		return string.format("invalid tickrate (%s)", tostring(location_parsed.tickrate))
	end

	if type(location_parsed.target) == "table" then
		local x, y, z = unpack(location_parsed.target)

		if type(x) == "number" and type(y) == "number" and type(z) == "number" then
			location.target = vector(x, y, z)
		else
			return "invalid type in target"
		end
	elseif location_parsed.target ~= nil then
		return "invalid target"
	end

	local has_grenade, has_non_grenade
	for i=1, #location.weapons do
		if location.weapons[i].type == "grenade" then
			has_grenade = true
		else
			has_non_grenade = true
		end
	end

	if has_grenade and has_non_grenade then
		return "can't have grenade and non-grenade in one location"
	end

	local explicit_type = type(location_parsed.type) == "string" and location_parsed.type or nil
	if explicit_type ~= nil and LOCATION_TYPE_NAMES[explicit_type] == nil then
		return string.format("invalid type (%s)", tostring(explicit_type))
	end

	if location_parsed.movement ~= nil then
		location.type = "movement"
		location.fov = DEFAULTS.fov_movement
	elseif explicit_type == "location" or explicit_type == "area" then
		location.type = explicit_type
		location.fov = DEFAULTS.fov_movement
	elseif has_grenade then
		location.type = "grenade"
		location.throw_strength = 1
		location.fov = DEFAULTS.fov
		location.delay = 0
		location.jump = false
		location.run_yaw = location.viewangles.yaw
	elseif has_non_grenade then
		location.type = "wallbang"
	else
		return "invalid type"
	end

	if location.viewangles_forward ~= nil and location.eye_pos ~= nil then
		local viewangles_target = location.eye_pos + location.viewangles_forward * 700
		local fraction, entindex_hit, vec_hit = trace_line_skip_entities(location.eye_pos, viewangles_target, 2)
		location.viewangles_target = fraction > 0.05 and vec_hit or viewangles_target
	end

	if location.type == "grenade" and type(location_parsed.grenade) == "table" then
		local grenade = location_parsed.grenade
		-- location.throw_strength = 1
		-- location.fov = 0.3
		-- location.jump = false
		-- location.run = false
		-- location.run_yaw = 0

		if type(grenade.strength) == "number" and grenade.strength >= 0 and grenade.strength <= 1 then
			location.throw_strength = grenade.strength
		elseif grenade.strength ~= nil then
			return string.format("invalid grenade.strength (%s)", tostring(grenade.strength))
		end

		if type(grenade.delay) == "number" and grenade.delay > 0 then
			location.delay = grenade.delay
		elseif grenade.delay ~= nil then
			return string.format("invalid grenade.delay (%s)", tostring(grenade.delay))
		end

		if type(grenade.fov) == "number" and grenade.fov >= 0 and grenade.fov <= 180 then
			location.fov = grenade.fov
		elseif grenade.fov ~= nil then
			return string.format("invalid grenade.fov (%s)", tostring(grenade.fov))
		end

		if type(grenade.jump) == "boolean" then
			location.jump = grenade.jump
		elseif grenade.jump ~= nil then
			return string.format("invalid grenade.jump (%s)", tostring(grenade.jump))
		end

		if type(grenade.run) == "number" and grenade.run > 0 and grenade.run < 512 then
			location.run_duration = grenade.run
		elseif grenade.run ~= nil then
			return string.format("invalid grenade.run (%s)", tostring(grenade.run))
		end

		if type(grenade.run_yaw) == "number" and grenade.run_yaw >= -180 and grenade.run_yaw <= 180 then
			location.run_yaw = location.viewangles.yaw + grenade.run_yaw
		elseif grenade.run_yaw ~= nil then
			return string.format("invalid grenade.run_yaw (%s)", tostring(grenade.run_yaw))
		end

		if type(grenade.run_speed) == "boolean" then
			location.run_speed = grenade.run_speed
		elseif grenade.run_speed ~= nil then
			return "invalid grenade.run_speed"
		end

		if type(grenade.recovery_yaw) == "number" then
			location.recovery_yaw = location.run_yaw + grenade.recovery_yaw
		elseif grenade.recovery_yaw ~= nil then
			return "invalid grenade.recovery_yaw"
		end

		if type(grenade.recovery_jump) == "boolean" then
			location.recovery_jump = grenade.recovery_jump
		elseif grenade.recovery_jump ~= nil then
			return "invalid grenade.recovery_jump"
		end
	elseif location.type == "grenade" and location_parsed.grenade ~= nil then
		return "invalid grenade"
	end

	if location.type == "movement" and type(location_parsed.movement) == "table" then
		local movement = location_parsed.movement

		if type(movement.fov) == "number" and movement.fov > 0 and movement.fov < 360 then
			location.fov = movement.fov
		end

		if type(movement.frames) == "table" then
			location.movement = {frames = movement.frames}
			local frames = {}

			for i, frame in ipairs(movement.frames) do
				if type(frame) == "number" then
					if movement.frames[i] > 0 then
						for j=1, frame do
							table.insert(frames, {})
						end
					else
						return "invalid frame " .. tostring(i)
					end
				elseif type(frame) == "table" then
					table.insert(frames, frame)
				end
			end

			local current = {
				viewangles = {pitch=location.viewangles.pitch, yaw=location.viewangles.yaw},
				buttons = {}
			}

			for key, char in pairs(MOVEMENT_BUTTONS_CHARS) do
				current.buttons[key] = false
			end

			for i, value in ipairs(frames) do
				local pitch, yaw, buttons, forwardmove, sidemove = unpack(value)

				if pitch ~= nil and type(pitch) ~= "number" then
					return string.format("invalid pitch in frame #%d", i)
				elseif yaw ~= nil and type(yaw) ~= "number" then
					return string.format("invalid yaw in frame #%d", i)
				end

				current.viewangles.pitch = current.viewangles.pitch + (pitch or 0)
				current.viewangles.yaw = current.viewangles.yaw + (yaw or 0)

				if type(buttons) == "string" then
					local buttons_down, buttons_up = parse_buttons_str(buttons)

					local buttons_seen = {}
					for _, btn in ipairs(buttons_down) do
						if btn == false then
							return string.format("invalid button in frame #%d", i)
						elseif buttons_seen[btn] then
							return string.format("invalid frame #%d: duplicate button %s", i, btn)
						end
						buttons_seen[btn] = true

						current.buttons[btn] = true
					end

					for _, btn in ipairs(buttons_up) do
						if btn == false then
							return string.format("invalid button in frame #%d", i)
						elseif buttons_seen[btn] then
							return string.format("invalid frame #%d: duplicate button %s", i, btn)
						end
						buttons_seen[btn] = true

						current.buttons[btn] = false
					end
				elseif buttons ~= nil then
					return string.format("invalid buttons in frame #%d", i)
				end

				if type(forwardmove) == "number" and forwardmove >= -450 and forwardmove <= 450 then
					current.forwardmove = forwardmove
				elseif forwardmove ~= nil then
					return string.format("invalid forwardmove in frame #%d: %s", i, tostring(forwardmove))
				else
					current.forwardmove = calculate_move(current.buttons.in_forward, current.buttons.in_back)
				end

				if type(sidemove) == "number" and sidemove >= -450 and sidemove <= 450 then
					current.sidemove = sidemove
				elseif sidemove ~= nil then
					return string.format("invalid sidemove in frame #%d: %s", i, tostring(sidemove))
				else
					current.sidemove = calculate_move(current.buttons.in_moveright, current.buttons.in_moveleft)
				end

				frames[i] = {
					pitch = current.viewangles.pitch,
					yaw = current.viewangles.yaw,
					move_yaw = current.viewangles.yaw,
					forwardmove = current.forwardmove,
					sidemove = current.sidemove
				}

				for btn, value in pairs(current.buttons) do
					frames[i][btn] = value
				end
			end

			location.movement_commands = frames
		elseif type(movement.steps) == "table" then
			location.movement = {steps = movement.steps}
			location.movement_commands = steps_to_movement_commands(movement.steps)
			location.movement_steps = movement.steps
		else
			return "invalid movement.frames"
		end
	elseif location_parsed.movement ~= nil then
		return "invalid movement"
	end

	if type(location_parsed.destroy) == "table" then
		local destroy = location_parsed.destroy
		location.destroy_text = "Break the object"

		if type(destroy.start) == "table" then
			local x, y, z = unpack(destroy.start)

			if type(x) == "number" and type(y) == "number" and type(z) == "number" then
				location.destroy_start = vector(x, y, z)
			else
				return "invalid type in destroy.start"
			end
		elseif destroy.start ~= nil then
			return "invalid destroy.start"
		end

		if type(destroy["end"]) == "table" then
			local x, y, z = unpack(destroy["end"])

			if type(x) == "number" and type(y) == "number" and type(z) == "number" then
				location.destroy_end = vector(x, y, z)
			else
				return "invalid type in destroy.end"
			end
		else
			return "invalid destroy.end"
		end

		if type(destroy.text) == "string" and destroy.text:len() > 0 then
			location.destroy_text = destroy.text
		elseif destroy.text ~= nil then
			return "invalid destroy.text"
		end
	elseif location_parsed.destroy ~= nil then
		return "invalid destroy"
	end

	return setmetatable(location, location_mt)
end

local function parse_and_create_locations(table_or_json, mapname)
	local locations_parsed
	if type(table_or_json) == "string" then
		local success
		success, locations_parsed = pcall(json.parse, table_or_json)

		if not success then
			error(locations_parsed)
			return
		end
	elseif type(table_or_json) == "table" then
		locations_parsed = table_or_json
	else
		assert(false)
	end

	if type(locations_parsed) ~= "table" then
		error(string.format("invalid type %s, expected table", type(locations_parsed)))
		return
	end

	local locations = {}
	for i=1, #locations_parsed do
		local location = create_location(locations_parsed[i])

		if type(location) == "table" then
			table.insert(locations, location)
		else
			error(location or "failed to parse")
			return
		end
	end

	return locations
end

local function export_locations(tbl, fancy)
	local indent = "  "
	local result = {}

	for i=1, #tbl do
		local str = tbl[i]:get_export(fancy)
		if fancy then
			str = indent .. str:gsub("\n", "\n" .. indent)
		end
		table.insert(result, str)
	end

	return (fancy and "[\n" or "[") .. table.concat(result, fancy and ",\n" or ",") .. (fancy and "\n]" or "]")
end

local function sort_by_distsqr(a, b)
	return a.distsqr > b.distsqr
end

local function sort_by_distsqr_reverse(a, b)
	return b.distsqr > a.distsqr
end

local function source_get_index_data(url, callback)
	http.get(url:gsub("^https://raw.githubusercontent.com/", "https://combinatronics.com/"), {absolute_timeout = 10, network_timeout = 5, params={ts=get_unix_timestamp()}}, function(success, response)
		local data = {}
		if not success or response.status ~= 200 or response.body == "404: Not Found" then
			if response.body == "404: Not Found" then
				callback("404 - Not Found")
			else
				callback(string.format("%s - %s", response.status, response.status_message))
			end

			return
		end

		local valid_json, jso = pcall(json.parse, response.body)
		if not valid_json then
			callback("Invalid JSON: " .. jso)
			return
		end

		if type(jso.name) == "string" then
			data.name = jso.name
		else
			callback("Invalid name")
			return
		end

		if jso.description == nil or type(jso.description) == "string" then
			data.description = jso.description
		else
			callback("Invalid description")
			return
		end

		if jso.update_timestamp == nil or type(jso.update_timestamp) == "number" then
			data.update_timestamp = jso.update_timestamp
		else
			callback("Invalid update_timestamp")
			return
		end

		if jso.url_format ~= nil then
			if type(jso.url_format) ~= "string" or not jso.url_format:match("^https?://.+$") then
				callback("Invalid url_format")
				return
			end

			if not jso.url_format:find("%%map%%") then
				callback("Invalid url_format - %map% is required")
				return
			end

			data.url_format = jso.url_format
		else
			data.url_format = nil
		end

		data.location_aliases = {}
		data.locations = {}
		if type(jso.locations) == "table" then
			for map, map_data in pairs(jso.locations) do
				if type(map) ~= "string" then
					callback("Invalid key in locations")
					return
				end

				if type(map_data) == "string" then
					data.location_aliases[map] = map_data
				elseif type(map_data) == "table" then
					data.locations[map] = map_data
				elseif jso.url_format ~= nil then
					callback("Location data is forbidden for split locations")
					return
				end
			end
		elseif jso.locations ~= nil then
			callback("Invalid locations")
			return
		end

		if next(data.location_aliases) == nil then
			data.location_aliases = nil
		end

		if next(data.locations) == nil then
			data.locations = nil
		end

		data.last_updated = get_unix_timestamp()

		callback(nil, data)
	end)
end

local source_mt = {
	__index = {
		update_remote_data = function(self)
			if not self.type == "remote" or self.url == nil then
				return
			end

			self.remote_status = "Loading index data..."
			source_get_index_data(self.url, function(err, data)
				if err ~= nil then
					self.remote_status = string.format("Error: %s", err)
					update_sources_ui()
					return
				end

				self.last_updated = data.last_updated

				if self.last_updated == nil then
					self.remote_status = "Index data refreshed"
					update_sources_ui()
					self.remote_status = nil
				else
					self.remote_status = nil
					update_sources_ui()
				end

				local keys = {"name", "description", "update_timestamp", "url_format"}
				for i=1, #keys do
					-- print(string.format("setting %s to %s", keys[i], data[keys[i]]))
					self[keys[i]] = data[keys[i]]
				end

				if data.url ~= nil and data.url ~= self.url then
					self.url = data.url
					self:update_remote_data()
					return
				end

				local current_map_name = get_mapname()

				-- todo: find a better way to do this
				rt.sources_locations[self] = nil
				local store_db_locations = (database.read("helper_store") or {})["locations"]
				if store_db_locations ~= nil and type(store_db_locations[self.id]) == "table" then
					store_db_locations[self.id] = {}
				end
				flush_active_locations("update_remote_data")

				if data.locations ~= nil then
					rt.sources_locations[self] = {}
					for map, locations_unparsed in pairs(data.locations) do
						-- print("parse_and_create_locations: ", inspect(locations_unparsed))
						local success, locations = pcall(parse_and_create_locations, locations_unparsed, map)
						if not success then
							self.remote_status = string.format("Invalid map data: %s", locations)
							client.error_log(string.format("Failed to load map data for %s (%s): %s", self.name, map, locations))
							update_sources_ui()
							return
						end

						rt.sources_locations[self][map] = locations

						self:store_write(map)

						if map == current_map_name then
							flush_active_locations("B")
						else
							rt.sources_locations[self][map] = nil
						end
					end
				end
			end)
		end,
		store_read = function(self, mapname)
			if mapname == nil then
				local store_db_locations = (database.read("helper_store") or {})["locations"]
				if store_db_locations ~= nil and type(store_db_locations[self.id]) == "table" then
					for mapname, _ in pairs(store_db_locations[self.id]) do
						self:store_read(mapname)
					end
				end
				return
			end

			local store_db_locations = (database.read("helper_store") or {})["locations"]
			if store_db_locations ~= nil and type(store_db_locations[self.id]) == "table" and type(store_db_locations[self.id][mapname]) == "string" then
				local success, locations = pcall(parse_and_create_locations, store_db_locations[self.id][mapname], mapname)

				if not success then
					self.remote_status = string.format("Invalid map data for %s in database: %s", mapname, locations)
					client.error_log(string.format("Invalid map data for %s (%s) in database: %s", self.name, mapname, locations))
					update_sources_ui()
				else
					rt.sources_locations[self][mapname] = locations
				end
			end
		end,
		store_write = function(self, mapname)
			if mapname == nil then
				if rt.sources_locations[self] ~= nil then
					for mapname, _ in pairs(rt.sources_locations[self]) do
						self:store_write(mapname)
					end
				end
				return
			end

			-- print("write for ", self.id, " ", mapname)

			local store_db = (database.read("helper_store") or {})
			store_db.locations = store_db.locations or {}
			store_db.locations[self.id] = store_db.locations[self.id] or {}

			store_db.locations[self.id][mapname] = export_locations(rt.sources_locations[self][mapname])

			-- print(inspect(rt.sources_locations[self]))
			-- print(inspect(store_db))

			database.write("helper_store", store_db)
		end,
		get_locations = function(self, mapname, allow_fetch)
			if rt.sources_locations[self] == nil then
				rt.sources_locations[self] = {}
			end

			if rt.sources_locations[self][mapname] == nil then
				self:store_read(mapname)
				local locations = rt.sources_locations[self][mapname]

				if self.type == "remote" and allow_fetch and (self.last_updated == nil or get_unix_timestamp()-self.last_updated > (self.ttl or DEFAULTS.source_ttl)) then
					-- print("fetching index data for ", self.name, " (", tostring(self.last_updated), ")")
					self:update_remote_data()
				end

				if self.type == "local_file" and mapname ~= nil then
					client.delay_call(0.5, function()
						benchmark:start("readfile")
						local contents_raw = readfile(self.filename)
						local contents = json.parse(contents_raw)

						local current_map_name = get_mapname()

						for mapname, map_locations in pairs(contents) do
							local success, locations = pcall(parse_and_create_locations, map_locations, mapname)
							if not success then
								self.remote_status = string.format("Invalid map data: %s", locations)
								client.error_log(string.format("Failed to load map data for %s (%s): %s", self.name, mapname, locations))
								update_sources_ui()
								return
							end

							if DEBUG then
								local keys_to_remove = {"viewangles", "position"}

								for i=1, #map_locations do
									local location = create_location(map_locations[i])
									if type(location) ~= "table" then
										-- print(inspect(map_locations[i]))
										client.log("failed to create! ", location)
									else
										local export_tbl = location:get_export_tbl()

										for j=1, #keys_to_remove do
											export_tbl[keys_to_remove[j]] = nil
											map_locations[i][keys_to_remove[j]] = nil
										end

										if export_tbl.destroy ~= nil then
											export_tbl.destroy["start"] = nil
											export_tbl.destroy["end"] = nil
										end
										if map_locations[i].destroy ~= nil then
											map_locations[i].destroy["start"] = nil
											map_locations[i].destroy["end"] = nil
										end

										local json_str_export = json.stringify(export_tbl)
										local json_str_orig = json.stringify(map_locations[i])

										if json_str_orig:len() ~= json_str_export:len() then
											client.log("  orig: ", json_str_orig)
											client.log("export: ", json_str_export)
										end
									end
								end
							end

							-- client.log("read locations: ", inspect(locations):sub(0, 500))

							rt.sources_locations[self][mapname] = locations

							flush_active_locations()

							self:store_write(mapname)

							-- print("wrote successfully")

							if mapname ~= current_map_name then
								rt.sources_locations[self][mapname] = nil
							end
						end

						benchmark:finish("readfile")
					end)
				elseif locations == nil and allow_fetch and self.type == "remote" and self.url_format ~= nil then
					-- print("Fetching missing data for ", self.name, " - ", mapname)

					local url = self.url_format:gsub("%%map%%", mapname):gsub("^https://raw.githubusercontent.com/", "https://combinatronics.com/")

					self.remote_status = string.format("Loading map data for %s...", mapname)
					update_sources_ui()

					http.get(url, {network_timeout=10, absolute_timeout=15, params={ts=get_unix_timestamp()}}, function(success, response)
						if not success or response.status ~= 200 or response.body == "404: Not Found" then
							if response.status == 404 or response.body == "404: Not Found" then
								self.remote_status = string.format("No locations found for %s.", mapname)
							else
								self.remote_status = string.format("Failed to fetch %s: %s %s", mapname, response.status, response.status_message)
							end
							update_sources_ui()
							return
						end

						local success, locations = pcall(parse_and_create_locations, response.body, mapname)
						if not success then
							self.remote_status = string.format("Invalid map data: %s", locations)
							update_sources_ui()
							client.error_log(string.format("Failed to load map data for %s (%s): %s", self.name, mapname, locations))
							return
						end

						rt.sources_locations[self][mapname] = locations

						self:store_write(mapname)

						self.remote_status = nil
						update_sources_ui()
						flush_active_locations("C")
					end)
				else
					if locations == nil then
						-- print("failed to fetch locations for: ", inspect(self))
					end
				end

				rt.sources_locations[self][mapname] = locations or {}
			end

			return rt.sources_locations[self][mapname]
		end,
		get_all_locations = function(self)
			local locations = {}

			local store_db_locations = (database.read("helper_store") or {})["locations"]
			if store_db_locations ~= nil and type(store_db_locations[self.id]) == "table" then
				for mapname, _ in pairs(store_db_locations[self.id]) do
					locations[mapname] = self:get_locations(mapname)
				end
			end

			return locations
		end,
		cleanup = function(self)
			self.remote_status = nil
			setmetatable(self, nil)
		end
	}
}

for i=1, #db.sources do
	setmetatable(db.sources[i], source_mt)
end


local sources_config_reference = ui.new_string("Helper: config", "{}")

local function get_sources_config()
	local sources_config = json.parse(ui.get(sources_config_reference) or "{}")

	local source_ids_assoc = {}
	sources_config.enabled = sources_config.enabled or {}
	for i=1, #db.sources do
		local source = db.sources[i]
		source_ids_assoc[source.id] = true
		if sources_config.enabled[source.id] == nil then
			sources_config.enabled[source.id] = true
		end
	end

	for id, enabled in pairs(sources_config.enabled) do
		if source_ids_assoc[id] == nil then
			sources_config.enabled[id] = nil
		end
	end

	return sources_config
end

local function set_sources_config(sources_config)
	ui.set(sources_config_reference, json.stringify(sources_config))
end

local function button_with_confirmation(tab, container, name, callback, callback_visibility)
	local button_open, button_cancel, button_confirm
	local ts_open

	button_open = ui.new_button(tab, container, name, function()
		ui.set_visible(button_open, false)
		ui.set_visible(button_cancel, true)
		ui.set_visible(button_confirm, true)

		local realtime = globals.realtime()
		ts_open = realtime
		client.delay_call(5, function()
			if ts_open == realtime then
				ui.set_visible(button_open, true)
				ui.set_visible(button_cancel, false)
				ui.set_visible(button_confirm, false)

				if callback_visibility ~= nil then
					callback_visibility()
				end
			end
		end)
	end)

	button_cancel = ui.new_button(tab, container, name .. " (CANCEL)", function()
		ui.set_visible(button_open, true)
		ui.set_visible(button_cancel, false)
		ui.set_visible(button_confirm, false)

		if callback_visibility ~= nil then
			callback_visibility()
		end

		ts_open = nil
	end)

	button_confirm = ui.new_button(tab, container, name .. " (CONFIRM)", function()
		ui.set_visible(button_open, true)
		ui.set_visible(button_cancel, false)
		ui.set_visible(button_confirm, false)

		ts_open = nil
		callback()

		if callback_visibility ~= nil then
			callback_visibility()
		end
	end)

	return button_open, button_cancel, button_confirm
end

local refs = {
	dpi_scale = ui.reference("MISC", "Settings", "DPI scale"),
	airstrafe = ui.reference("MISC", "Movement", "Air strafe"),
	faster_grenade_toss = ui.reference("MISC", "Settings", "Faster grenade toss"),
	supertoss = ui.reference("MISC", "Miscellaneous", "Super toss"),
	auto_release = ui.reference("MISC", "Miscellaneous", "Automatic grenade release"),
	easy_strafe = ui.reference("MISC", "Movement", "Easy strafe"),
	standalone_quick_stop = ui.reference("MISC", "Movement", "Standalone quick stop"),
	air_strafe_direction = ui.reference("MISC", "Movement", "Air strafe direction"),
	air_strafe_smoothing = ui.reference("MISC", "Movement", "Air strafe smoothing"),
	jump_at_edge = ui.reference("MISC", "Movement", "Jump at edge"),
	avoid_collisions = ui.reference("MISC", "Movement", "Avoid collisions"),
	air_duck = ui.reference("MISC", "Movement", "Air duck"),
	infinite_duck = ui.reference("MISC", "Movement", "Infinite duck"),
	aa_enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
	aa_pitch = ui.reference("AA", "Anti-aimbot angles", "Pitch"),
	aa_yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
	slow_motion = ui.reference("AA", "Other", "Slow motion"),
	enabled = ui.new_checkbox("VISUALS", "Other ESP", "Helper"),
	hotkey = ui.new_hotkey("VISUALS", "Other ESP", "Helper hotkey", true),
	color = ui.new_color_picker("VISUALS", "Other ESP", "Helper color", 120, 120, 255, 255),
	types = ui.new_multiselect("VISUALS", "Other ESP", "\nHelper types", {
		"Smoke", "Flashbang", "High Explosive", "Molotov", "Movement", "Location", "Area"
	}),
	hide_duplicates = ui.new_checkbox("VISUALS", "Other ESP", "Hide duplicate nades"),
	disable_doubletap = ui.new_checkbox("VISUALS", "Other ESP", "Disable doubletap on use"),
	behind_walls = ui.new_checkbox("VISUALS", "Other ESP", "Show locations behind walls"),
}
refs.doubletap, refs.doubletap_hotkey = ui.reference("RAGE", "Aimbot", "Double tap")
refs.on_shot_aa, refs.on_shot_aa_hotkey = ui.reference("AA", "Other", "On shot anti-aim")
refs.aa_yaw, refs.aa_yaw_offset = ui.reference("AA", "Anti-aimbot angles", "Yaw")


local sources_list_ui = {
	title = ui.new_checkbox("LUA", "A", "Helper: Manage sources"),
	list = ui.new_listbox("LUA", "A", "Helper sources", {}),
	source_label1 = ui.new_label("LUA", "A", "Source label 1"),
	enabled = ui.new_checkbox("LUA", "A", "Enabled"),
	source_label2 = ui.new_label("LUA", "A", "Source label 2"),
	source_label3 = ui.new_label("LUA", "A", "Source label 3"),
	name = ui.new_textbox("LUA", "A", "New source name"),
}

local edit_ui = {
	list = ui.new_listbox("LUA", "A", "Selected source locations", {}),
	show_all = ui.new_checkbox("LUA", "A", "Show all maps"),
	sort_by = ui.new_combobox("LUA", "A", "Sort by", {"Creation date", "Type", "Alphabetically"}),
	type_label = ui.new_label("LUA", "B", "Creating new location"),
	type = ui.new_combobox("LUA", "B", "\nLocation Type", {"Grenade", "Movement", "Location", "Area"}),
	from_label = ui.new_label("LUA", "B", "From"),
	from = ui.new_textbox("LUA", "B", "From"),
	to_label = ui.new_label("LUA", "B", "To"),
	to = ui.new_textbox("LUA", "B", "To"),
	description_label = ui.new_label("LUA", "B", "Description (Optional)"),
	description = ui.new_textbox("LUA", "B", "To"),
	grenade_properties = ui.new_multiselect("LUA", "B", "Grenade Properties", {
		"Jump",
		"Run",
		"Walk (Shift)",
		"Throw strength",
		"Force-enable recovery",
		"Tickrate dependent",
		"Destroy breakable object",
		"Delayed throw"
	}),
	throw_strength = ui.new_combobox("LUA", "B", "Throw strength", {"Left Click", "Left / Right Click", "Right Click"}),
	run_direction = ui.new_combobox("LUA", "B", "Run duration / direction", {"Forward", "Left", "Right", "Back", "Custom"}),
	run_direction_custom = ui.new_slider("LUA", "B", "\nCustom run direction", -180, 180, 0, true, "°"),
	run_duration = ui.new_slider("LUA", "B", "\nRun duration", 1, 256, 20, true, "t"),
	delay = ui.new_slider("LUA", "B", "Throw delay", 1, 40, 0, true, "t"),
	recovery_direction = ui.new_combobox("LUA", "B", "Recovery (after throw) direction", {"Back", "Forward", "Left", "Right", "Custom"}),
	recovery_direction_custom = ui.new_slider("LUA", "B", "\nCustom recovery direction", -180, 180, 0, true, "°"),
	recovery_jump = ui.new_checkbox("LUA", "B", "Recovery bunny-hop"),
	set = ui.new_button("LUA", "B", "Set location", function() on_edit_set() end),
	set_hotkey = ui.new_hotkey("LUA", "B", "Helper set location hotkey", true),
	record_hotkey = ui.new_hotkey("LUA", "B", "Record movement (hold)", true),
	record = ui.new_button("LUA", "B", "Record movement", function()
		edit.recording.active = not edit.recording.active
	end),
	teleport = ui.new_button("LUA", "B", "Teleport", function() on_edit_teleport() end),
	teleport_hotkey = ui.new_hotkey("LUA", "B", "Helper teleport hotkey", true),
	export = ui.new_button("LUA", "B", "Export to clipboard", function() on_edit_export() end),
	save = ui.new_button("LUA", "B", "Save", function() on_edit_save() end),
}
edit_ui.delete, edit_ui.delete_cancel, edit_ui.delete_confirm = button_with_confirmation("LUA", "B", "Delete", function() on_edit_delete() end, update_sources_ui)
edit_ui.delete_hotkey = ui.new_hotkey("LUA", "B", "Helper delete hotkey", true)

local edit = {
	list = {},
	ignore_callbacks = false,
	different_map_selected = false,
	selected = nil,
	recording = {
		active = false,
		prev_hotkey = false,
		start_at = nil,
		movement = nil,
		ui_restore = nil,
	},
}

sources_list_ui.edit = ui.new_button("LUA", "A", "Edit", function() on_source_edit() end)
sources_list_ui.update = ui.new_button("LUA", "A", "Update", function() on_source_update() end)
sources_list_ui.delete, sources_list_ui.delete_cancel, sources_list_ui.delete_confirm = button_with_confirmation("LUA", "A", "Delete", function() on_source_delete() end, update_sources_ui)
sources_list_ui.create = ui.new_button("LUA", "A", "Create", function() on_source_create() end)
sources_list_ui.import = ui.new_button("LUA", "A", "Import from clipboard", function() on_source_import() end)
sources_list_ui.export = ui.new_button("LUA", "A", "Export all to clipboard", function() on_source_export() end)
sources_list_ui.back = ui.new_button("LUA", "A", "Back", function() on_source_edit_back() end)

sources_list_ui.source_label4 = ui.new_label("LUA", "A", "Ready.")

local src = {
	list = {},
	ignore_callback = false,
	editing = false,
	selected = nil,
	remote_add_status = nil,
	editing_modified = setmetatable({}, {__mode = "k"}),
	editing_has_changed = setmetatable({}, {__mode = "k"}),
	editing_hotkeys_prev = {
	[edit_ui.set_hotkey] = false,
	[edit_ui.teleport_hotkey] = false,
	[edit_ui.delete_hotkey] = false
},
}


local function set_source_selected(source_selected_new)
	source_selected_new = source_selected_new or "add_local"

	if source_selected_new == src.selected then
		return false
	end

	for i=1, #src.list do
		if src.list[i] == source_selected_new then
			ui.set(sources_list_ui.list, i-1)
			src.editing = false
			return true
		end
	end

	return false
end

local function add_source(name_or_source, typ, source_text)
	local source
	if type(name_or_source) == "string" then
		source = {
			name = name_or_source,
			type = typ,
			id = randomid(8)
		}
	elseif type(name_or_source) == "table" then
		source = name_or_source
		source.type = typ
	else
		assert(false)
	end
	setmetatable(source, source_mt)

	local existing_ids = table_map_assoc(db.sources, function(key, source) return source.id, true end)
	while existing_ids[source.id] do
		source.id = randomid(8)
	end

	table.insert(db.sources, source)

	set_sources_config(get_sources_config())

	return source
end

local function sync_database_cloud_sources()
	local known_builtin_remote_ids = {
		builtin_legit = true,
		builtin_sothatwemaybefree = true,
		builtin_movement = true,
		builtin_hvh = true,
		sigma_hvh = true,
	}

	for i = #db.sources, 1, -1 do
		local source = db.sources[i]
		if source ~= nil and source.type == "remote" and (known_builtin_remote_ids[source.id] or source.builtin or not source.cloud) then
			table.remove(db.sources, i)
		end
	end

	local cloud_ids = {}

	for i = 1, #database_cloud do
		local entry = database_cloud[i]
		if type(entry) == "table" and type(entry.url) == "string" and entry.url:match("^https?://") then
			local id = entry.id or ("cloud_" .. tostring(crc32(entry.url)))
			cloud_ids[id] = true

			local existing
			for j = 1, #db.sources do
				if db.sources[j].id == id then
					existing = db.sources[j]
					break
				end
			end

			if existing ~= nil then
				existing.name = entry.name or existing.name
				existing.url = entry.url
				existing.description = entry.description
				existing.cloud = true
			else
				local source = add_source(entry.name or ("Cloud " .. i), "remote")
				source.id = id
				source.url = entry.url
				source.description = entry.description
				source.cloud = true
			end
		end
	end

	for i = #db.sources, 1, -1 do
		local source = db.sources[i]
		if source ~= nil and source.cloud and not cloud_ids[source.id] then
			table.remove(db.sources, i)
		end
	end

	set_sources_config(get_sources_config())
end

sync_database_cloud_sources()

local function get_sorted_locations(locations, sorting)
	if sorting == "Creation date" then
		return locations
	elseif sorting == "Type" or sorting == "Alphabetically" then
		local new_tbl = {}

		for i=1, #locations do
			table.insert(new_tbl, locations[i])
		end

		table.sort(new_tbl, function(a, b)
			if sorting == "Type" then
				return a:get_type_string() < b:get_type_string()
			elseif sorting == "Alphabetically" then
				return a.name < b.name
			else
				return true
			end
		end)

		return new_tbl
	else
		return locations
	end
end

function update_sources_ui()
	local ui_visibility = {}

	for name, reference in pairs(sources_list_ui) do
		if name ~= "title" then
			ui_visibility[reference] = false
		end
	end

	edit.different_map_selected = true

	for name, reference in pairs(edit_ui) do
		ui_visibility[reference] = false
	end

	if ui.get(refs.enabled) and ui.get(sources_list_ui.title) then
		if src.editing and src.selected ~= nil then
			-- print(inspect(src.selected))
			local mapname = get_mapname()
			local show_all = ui.get(edit_ui.show_all)

			if mapname == nil then
				show_all = true
			end

			ui_visibility[sources_list_ui.source_label1] = true
			ui_visibility[sources_list_ui.source_label2] = true
			ui.set(sources_list_ui.source_label1, string.format("Editing %s source: %s", (SOURCE_TYPE_NAMES[src.selected.type] or src.selected.type):lower(), src.selected.name))
			ui.set(sources_list_ui.source_label2, show_all and "Locations on all maps: " or string.format("Locations on %s:", mapname))
			ui_visibility[sources_list_ui.import] = true
			ui_visibility[sources_list_ui.export] = true
			ui_visibility[sources_list_ui.back] = true
			ui_visibility[edit_ui.list] = true
			ui_visibility[edit_ui.show_all] = true
			ui_visibility[edit_ui.sort_by] = true

			local edit_listbox, edit_maps, edit_listbox_i = {}, {}
			table_clear(edit.list)

			local sorting = ui.get(edit_ui.sort_by)

			if show_all then
				local all_locations = src.selected:get_all_locations()
				local j = 1

				for map, locations in pairs(all_locations) do
					locations = get_sorted_locations(locations, sorting)
					for i=1, #locations do
						local location = locations[i]
						edit.list[j] = location

						local type_str = location:get_type_string()
						edit_listbox[j] = string.format("[%s] %s: %s", map, type_str, location.name)

						edit_maps[j] = map

						j = j + 1
					end
				end
			else
				local locations = src.selected:get_locations(mapname)

				locations = get_sorted_locations(locations, sorting)

				for i=1, #locations do
					local location = locations[i]
					edit.list[i] = location

					local type_str = location:get_type_string()
					edit_listbox[i] = string.format("%s: %s", type_str, location.full_name)

					edit_maps[i] = mapname
				end
			end

			table.insert(edit_listbox, "＋  Create new")
			table.insert(edit.list, "create_new")

			ui.update(edit_ui.list, edit_listbox)

			if edit.selected == nil then
				-- edit.selected = "create_new"
				-- print("setting to ", tostring(edit.selected), " ", i-1)

				edit.selected = "create_new"
				edit_set_ui_values(true)

				-- print("set to ", edit.selected)
			end

			if edit.selected == "create_new" then
				edit.different_map_selected = false
			end

			for i=1, #edit.list do
				if edit.list[i] == edit.selected then
					ui.set(edit_ui.list, i-1)

					if edit_maps[i] == mapname and mapname ~= nil then
						edit.different_map_selected = false
					end
				end
			end

			-- if edit.selected ~= nil then
			ui_visibility[edit_ui.type_label] = true
			ui_visibility[edit_ui.type] = true
			ui_visibility[edit_ui.from_label] = true
			ui_visibility[edit_ui.from] = true
			ui_visibility[edit_ui.to_label] = true
			ui_visibility[edit_ui.to] = true
			ui_visibility[edit_ui.description_label] = true
			ui_visibility[edit_ui.description] = true
			ui_visibility[edit_ui.grenade_properties] = true

			local location_type_ui = ui.get(edit_ui.type)
			ui_visibility[edit_ui.set] = true
			ui_visibility[edit_ui.set_hotkey] = true
			if location_type_ui == "Movement" then
				ui_visibility[edit_ui.record] = true
				ui_visibility[edit_ui.record_hotkey] = true
			end

			ui_visibility[edit_ui.teleport] = true
			ui_visibility[edit_ui.teleport_hotkey] = true
			ui_visibility[edit_ui.export] = true
			ui_visibility[edit_ui.save] = true

			local properties = table_map_assoc(ui.get(edit_ui.grenade_properties), function(i, property) return property, true end)

			if location_type_ui == "Grenade" then
			if properties["Run"] then
				ui_visibility[edit_ui.run_direction] = true
				ui_visibility[edit_ui.run_duration] = true

				if ui.get(edit_ui.run_direction) == "Custom" then
					ui_visibility[edit_ui.run_direction_custom] = true
				end
			end

			if properties["Jump"] or properties["Force-enable recovery"] then
				ui_visibility[edit_ui.recovery_direction] = true
				ui_visibility[edit_ui.recovery_jump] = true

				if ui.get(edit_ui.recovery_direction) == "Custom" then
					ui_visibility[edit_ui.recovery_direction_custom] = true
				end
			end

			if properties["Delayed throw"] then
				ui_visibility[edit_ui.delay] = true
			end

			if properties["Throw strength"] then
				ui_visibility[edit_ui.throw_strength] = true
			end
			end

			if edit.selected ~= nil and edit.selected ~= "create_new" then
				ui_visibility[edit_ui.delete] = true
				ui_visibility[edit_ui.delete_hotkey] = true
			end
			-- end
		else
			local sources_config = get_sources_config()

			local sources_listbox, sources_listbox_i = {}
			table_clear(src.list)

			for i=1, #db.sources do
				local source = db.sources[i]
				src.list[i] = source
				table.insert(sources_listbox, string.format("%s  %s: %s", sources_config.enabled[source.id] and "☑" or "☐", SOURCE_TYPE_NAMES[source.type] or source.type, source.name))

				if source == src.selected then
					sources_listbox_i = i
				end
			end

			table.insert(sources_listbox, "＋  Create local")
			table.insert(src.list, "add_local")
			if src.selected == "add_local" then
				sources_listbox_i = #src.list
			end

			if sources_listbox_i == nil then
				src.selected = src.list[1]
				sources_listbox_i = 1
			end

			ui.update(sources_list_ui.list, sources_listbox)
			if sources_listbox_i ~= nil then
				ui.set(sources_list_ui.list, sources_listbox_i-1)
			end

			ui_visibility[sources_list_ui.list] = true
			if src.selected ~= nil then
				ui_visibility[sources_list_ui.source_label1] = true

				if src.selected == "add_remote" then
					ui.set(sources_list_ui.source_label1, "Add new remote source")
					ui_visibility[sources_list_ui.import] = true

					if src.remote_add_status ~= nil then
						ui.set(sources_list_ui.source_label4, src.remote_add_status)
						ui_visibility[sources_list_ui.source_label4] = true
					end
				elseif src.selected == "add_local" then
					ui.set(sources_list_ui.source_label1, "New source name:")
					ui_visibility[sources_list_ui.name] = true
					ui_visibility[sources_list_ui.create] = true
				elseif src.selected ~= nil then
					ui_visibility[sources_list_ui.enabled] = true
					ui_visibility[sources_list_ui.edit] = src.selected.type == "local" and not src.selected.builtin
					ui_visibility[sources_list_ui.update] = src.selected.type == "remote"
					ui_visibility[sources_list_ui.delete] = not src.selected.builtin

					src.ignore_callback = true

					ui.set(sources_list_ui.source_label1, string.format("%s source: %s", SOURCE_TYPE_NAMES[src.selected.type] or src.selected.type, src.selected.name))

					if src.selected.description ~= nil then
						ui_visibility[sources_list_ui.source_label2] = true
						ui.set(sources_list_ui.source_label2, string.format("%s", src.selected.description))
					end

					if src.selected.remote_status ~= nil then
						ui_visibility[sources_list_ui.source_label3] = true
						ui.set(sources_list_ui.source_label3, src.selected.remote_status)
					elseif src.selected.update_timestamp ~= nil then
						ui_visibility[sources_list_ui.source_label3] = true
						-- format_unix_timestamp(timestamp, allow_future, ignore_seconds, max_parts)
						ui.set(sources_list_ui.source_label3, string.format("Last updated: %s", format_unix_timestamp(src.selected.update_timestamp, false, false, 1)))
					end

					ui.set(sources_list_ui.enabled, sources_config.enabled[src.selected.id] == true)

					src.ignore_callback = false
				end
			end
		end
	end

	for reference, visible in pairs(ui_visibility) do
		ui.set_visible(reference, visible)
	end
end

ui.set_callback(sources_list_ui.title, function()
	if not ui.get(sources_list_ui.title) then
		src.editing = false
	end

	update_sources_ui()
end)

ui.set_callback(sources_list_ui.list, function()
	local source_selected_prev = src.selected
	local i = ui.get(sources_list_ui.list)

	if i ~= nil then
		src.selected = src.list[i+1]

		if src.selected ~= source_selected_prev then
			src.editing = false
			src.remote_add_status = nil
			update_sources_ui()
		end
	-- else
	-- 	error("ui.get on listbox returned nil!")
	end
end)

ui.set_callback(sources_list_ui.enabled, function()
	if type(src.selected) == "table" and not src.ignore_callback then
		local sources_config = get_sources_config()
		sources_config.enabled[src.selected.id] = ui.get(sources_list_ui.enabled)
		set_sources_config(sources_config)
		update_sources_ui()

		flush_active_locations("D")
	end
end)

ui.set_callback(refs.types, flush_active_locations)
ui.set_callback(refs.hide_duplicates, flush_active_locations)

ui.set_callback(edit_ui.show_all, function()
	update_sources_ui()
end)
ui.set_callback(edit_ui.sort_by, function()
	update_sources_ui()
end)

local url_fixers = {
	function(url)
		local match = url:match("^https://pastebin.com/(%w+)/?$")

		if match ~= nil then
			return string.format("https://pastebin.com/raw/%s", match)
		end
	end,
	function(url)
		local user, repo, branch, path = url:match("^https://github.com/(%w+)/(%w+)/blob/(%w+)/(.+)$")

		if user ~= nil then
			return string.format("https://github.com/%s/%s/raw/%s/%s", user, repo, branch, path)
		end
	end,
}

function on_source_delete()
	if type(src.selected) == "table" and not src.selected.builtin then
		for i=1, #db.sources do
			if db.sources[i] == src.selected then
				table.remove(db.sources, i)
				break
			end
		end

		set_sources_config(get_sources_config())

		flush_active_locations("source deleted")

		set_source_selected()
	end
end

function on_source_update()
	if type(src.selected) == "table" and src.selected.type == "remote" then
		src.selected:update_remote_data()
		update_sources_ui()
	end
end

function on_source_create()
	if src.selected == "add_local" then
		local name = ui.get(sources_list_ui.name)

		if name:gsub(" ", "") == "" then
			return
		end

		local existing_names = table_map_assoc(db.sources, function(i, source) return source.name, source.type == "local" end)
		local name_new, i = name, 2

		while existing_names[name_new] do
			name_new = string.format("%s (%d)", name, i)
			i = i + 1
		end

		name = name_new

		local source = add_source(name, "local")

		update_sources_ui()
		set_source_selected(source)
		ui.set(sources_list_ui.name, "")
	end
end

local function source_import_arr(tbl, mapname)
	local locations = {}
	for i=1, #tbl do
		local location = create_location(tbl[i])
		if type(location) ~= "table" then
			local err = string.format("invalid location #%d: %s", i, location)
			client.error_log("Failed to import " .. tostring(mapname) .. ", " .. err)
			src.remote_add_status = err
			update_sources_ui()
			return
		end
		locations[i] = location
	end

	if #locations == 0 then
		client.error_log("Failed to import: No locations to import")
		src.remote_add_status = "No locations to import"
		update_sources_ui()
		return
	end

	local source_locations = src.selected:get_locations(mapname)
	if source_locations == nil then
		source_locations = {}
		rt.sources_locations[src.selected][mapname] = source_locations
	end

	for i=1, #locations do
		table.insert(source_locations, locations[i])
	end

	update_sources_ui()
	src.selected:store_write()
	flush_active_locations()
end

function on_source_import()
	if src.editing and type(src.selected) == "table" and src.selected.type == "local" and get_clipboard_text then
		local text = get_clipboard_text()

		if text == nil then
			local err = "No text copied to clipboard"
			client.error_log("Failed to import: " .. err)
			src.remote_add_status = err
			update_sources_ui()
			return
		end

		local success, tbl = pcall(json.parse, text)

		if success and text:sub(1, 1) ~= "[" and text:sub(1, 1) ~= "{" then
			success, tbl = false, "Expected object or array"
		end

		if not success then
			local err = string.format("Invalid JSON: %s", tbl)
			client.error_log("Failed to import: " .. err)
			src.remote_add_status = err
			update_sources_ui()
			return
		end

		local is_arr = text:sub(1, 1) == "["

		if not is_arr then
			if tbl["name"] ~= nil or tbl["grenade"] ~= nil or tbl["location"] ~= nil then
				tbl = {tbl}
				is_arr = true
			end
		end

		if is_arr then
			local mapname = get_mapname()

			if mapname == nil then
				client.error_log("Failed to import: You need to be in-game")
				src.remote_add_status = "You need to be in-game"
				update_sources_ui()
				return
			end

			source_import_arr(tbl, mapname)
		else
			for mapname, locations in pairs(tbl) do
				if type(mapname) ~= "string" or mapname:find(" ") then
					client.error_log("Failed to import: Invalid map name")
					src.remote_add_status = "Invalid map name"
					update_sources_ui()
					return
				end
			end

			for mapname, locations in pairs(tbl) do
				source_import_arr(locations, mapname)
			end
		end
	elseif src.selected == "add_remote" and get_clipboard_text then
		local text = get_clipboard_text()
		if text == nil then
			client.error_log("Failed to import: Clipboard is empty")
			src.remote_add_status = "Clipboard is empty"
			update_sources_ui()
			return
		end

		local url = sanitize_string(text):gsub(" ", "")

		if not url:match("^https?://.+$") then
			client.error_log("Failed to import: Invalid URL")
			src.remote_add_status = "Invalid URL"
			update_sources_ui()
			return
		end

		for i=1, #url_fixers do
			url = url_fixers[i](url) or url
		end

		for i=1, #db.sources do
			local source = db.sources[i]
			if source.type == "remote" and source.url == url then
				client.error_log("Failed to import: A source with that URL already exists")
				src.remote_add_status = "A source with that URL already exists"
				update_sources_ui()
				return
			end
		end

		src.remote_add_status = "Loading index data..."
		update_sources_ui()
		source_get_index_data(url, function(err, data)
			if src.selected ~= "add_remote" then
				return
			end

			if err ~= nil then
				client.error_log(string.format("Failed to import: %s", err))
				src.remote_add_status = err
				update_sources_ui()
				return
			end
			local source = add_source(data.name, "remote")

			source.url = data.url or url
			source.url_format = data.url_format
			source.description = data.description
			source.update_timestamp = data.update_timestamp
			source.last_updated = data.last_updated

			src.remote_add_status = string.format("Successfully imported %s", source.name)
			update_sources_ui()

			src.selected = nil
			set_source_selected("add_remote")
			update_sources_ui()
		end)
	end
end

function on_source_export()
	if src.editing and type(src.selected) == "table" and src.selected.type == "local" then
		local indent = "  "
		local mapname = get_mapname()
		local show_all = ui.get(edit_ui.show_all)

		if mapname == nil then
			show_all = true
		end

		local export_str
		if show_all then
			local all_locations = src.selected:get_all_locations()

			local maps = {}
			for map, _ in pairs(all_locations) do
				table.insert(maps, map)
			end
			table.sort(maps)

			local tbl = {}
			for i=1, #maps do
				local map = maps[i]
				local locations = all_locations[map]
				local tbl_map = {}
				for i=1, #locations do
					local str = locations[i]:get_export(true)
					table.insert(tbl_map, indent .. (str:gsub("\n", "\n" .. indent .. indent)))
				end

				table.insert(tbl, json.stringify(map) .. ": [\n" .. indent .. table.concat(tbl_map, ",\n" .. indent) .. "\n" .. indent .. "]")
			end

			export_str = "{\n" .. indent .. table.concat(tbl, ",\n" .. indent) .. "\n}"
		else
			local locations = src.selected:get_locations(mapname)

			local tbl = {}
			for i=1, #locations do
				tbl[i] = locations[i]:get_export(true):gsub("\n", "\n" .. indent)
			end

			export_str = "[\n" .. indent .. table.concat(tbl, ",\n" .. indent) .. "\n]"
		end

		if export_str ~= nil then
			if set_clipboard_text ~= nil then
				set_clipboard_text(export_str)
				client.log("Exported location (Copied to clipboard):")
			else
				client.log("Exported location:")
			end
			pretty_json.print_highlighted(export_str)
		end
	end
end

local function edit_update_has_changed()
	if src.editing and edit.selected ~= nil and src.editing_modified[edit.selected] ~= nil then
		if type(edit.selected) == "table" then
			local old = edit.selected:get_export_tbl()
			src.editing_has_changed[edit.selected] = not deep_compare(old, src.editing_modified[edit.selected])
		else
			src.editing_has_changed[edit.selected] = true
		end
	end

	return src.editing_has_changed[edit.selected] == true
end

function edit_set_ui_values(force)
	local location_tbl = {}
	if src.editing and edit.selected ~= nil and src.editing_modified[edit.selected] ~= nil then
		location_tbl = src.editing_modified[edit.selected]
	end

	if edit.different_map_selected and not force then
		location_tbl = {}
	end

	local yaw_to_name = table_map_assoc(YAW_DIRECTION_OFFSETS, function(k, v) return v, k end)

	edit.ignore_callbacks = true
	ui.set(edit_ui.from, location_tbl.name and location_tbl.name[1] or "")
	ui.set(edit_ui.to, location_tbl.name and location_tbl.name[2] or "")
	ui.set(edit_ui.grenade_properties, {})

	ui.set(edit_ui.description, location_tbl.description or "")

	if edit.different_map_selected then
		ui.set(edit_ui.type_label, "Can't edit location on a different map")
	else
		ui.set(edit_ui.type_label, edit.selected == "create_new" and "Creating new location" or string.format("Editing %s to %s", location_tbl.name and location_tbl.name[1] or "Unnamed", location_tbl.name and location_tbl.name[2] or "Unnamed"))
	end

	if location_tbl.type == "area" then
		ui.set(edit_ui.type, "Area")
	elseif location_tbl.type == "location" then
		ui.set(edit_ui.type, "Location")
	elseif location_tbl.movement ~= nil then
		ui.set(edit_ui.type, "Movement")
	elseif location_tbl.grenade ~= nil then
		ui.set(edit_ui.type, "Grenade")
		ui.set(edit_ui.recovery_direction, yaw_to_name[180])
		ui.set(edit_ui.recovery_direction_custom, 0)
		ui.set(edit_ui.recovery_jump, false)

		ui.set(edit_ui.run_duration, 20)
		ui.set(edit_ui.run_direction, yaw_to_name[0])
		ui.set(edit_ui.run_direction_custom, 0)
		ui.set(edit_ui.delay, 1)

		local properties = {}
		if location_tbl.grenade.jump then
			table.insert(properties, "Jump")
		end

		if location_tbl.grenade.recovery_yaw ~= nil then
			if not location_tbl.grenade.jump then
				table.insert(properties, "Force-enable recovery")
			end

			if yaw_to_name[location_tbl.grenade.recovery_yaw] ~= nil then
				ui.set(edit_ui.recovery_direction, yaw_to_name[location_tbl.grenade.recovery_yaw])
			else
				ui.set(edit_ui.recovery_direction, "Custom")
				ui.set(edit_ui.recovery_direction_custom, location_tbl.grenade.recovery_yaw)
			end
		end

		if location_tbl.grenade.recovery_jump then
			ui.set(edit_ui.recovery_jump, true)
		end

		if location_tbl.grenade.strength ~= nil and location_tbl.grenade.strength ~= 1 then
			table.insert(properties, "Throw strength")

			ui.set(edit_ui.throw_strength, location_tbl.grenade.strength == 0.5 and "Left / Right Click" or "Left Click")
		end

		if location_tbl.grenade.delay ~= nil then
			table.insert(properties, "Delayed throw")
			ui.set(edit_ui.delay, location_tbl.grenade.delay)
		end

		if location_tbl.grenade.run ~= nil then
			table.insert(properties, "Run")

			if location_tbl.grenade.run ~= 20 then
				ui.set(edit_ui.run_duration, location_tbl.grenade.run)
			end

			if location_tbl.grenade.run_yaw ~= nil then
				if yaw_to_name[location_tbl.grenade.run_yaw] ~= nil then
					ui.set(edit_ui.run_direction, yaw_to_name[location_tbl.grenade.run_yaw])
				else
					ui.set(edit_ui.run_direction, "Custom")
					ui.set(edit_ui.run_direction_custom, location_tbl.grenade.run_yaw)
				end
			end

			if location_tbl.grenade.run_speed then
				table.insert(properties, "Walk (Shift)")
			end
		end

		ui.set(edit_ui.grenade_properties, properties)
	else
		ui.set(edit_ui.type, "Grenade")
		ui.set(edit_ui.grenade_properties, {})
	end

	edit.ignore_callbacks = false
end

local function apply_location_type_to_tbl(location, type_ui)
	local typ = LOCATION_TYPE_FROM_UI[type_ui]
	if typ == nil or location == nil then
		return
	end

	location.type = typ

	if typ == "grenade" then
		location.movement = nil
	elseif typ == "movement" then
		location.grenade = nil
		location.movement = location.movement or {}
	elseif typ == "location" or typ == "area" then
		location.grenade = nil
		location.movement = nil
	end
end

local function restore_recording_ui()
	if edit.recording.ui_restore == nil then
		return
	end

	for key, value in pairs(edit.recording.ui_restore) do
		ui.set(key, value)
	end

	edit.recording.ui_restore = nil
end

local function apply_recording_ui_overrides()
	if edit.recording.ui_restore == nil then
		edit.recording.ui_restore = {}
	end

	if edit.recording.ui_restore[refs.air_duck] == nil then
		edit.recording.ui_restore[refs.air_duck] = ui.get(refs.air_duck)
	end
	ui.set(refs.air_duck, "Off")

	if edit.recording.ui_restore[refs.easy_strafe] == nil then
		edit.recording.ui_restore[refs.easy_strafe] = ui.get(refs.easy_strafe)
	end
	ui.set(refs.easy_strafe, true)

	if edit.recording.ui_restore[refs.jump_at_edge] == nil then
		edit.recording.ui_restore[refs.jump_at_edge] = ui.get(refs.jump_at_edge)
	end
	ui.set(refs.jump_at_edge, false)
end

local function finish_movement_recording(location)
	local steps = type(location.movement) == "table" and location.movement.steps
	return type(steps) == "table" and #steps > 0
end

local function process_movement_recording(cmd)
	if not src.editing or edit.selected == nil then
		edit.recording.prev_hotkey = false
		edit.recording.start_at = nil
		edit.recording.movement = nil
		restore_recording_ui()
		return
	end

	if ui.get(edit_ui.type) ~= "Movement" then
		edit.recording.start_at = nil
		edit.recording.movement = nil
		restore_recording_ui()
		return
	end

	local local_player = entity.get_local_player()
	if local_player == nil or not entity.is_alive(local_player) then
		edit.recording.start_at = nil
		edit.recording.movement = nil
		restore_recording_ui()
		return
	end

	local record_on = ui.get(edit_ui.record_hotkey) or edit.recording.active

	if not record_on then
		if edit.recording.movement ~= nil then
			if src.editing_modified[edit.selected] == nil then
				src.editing_modified[edit.selected] = {}
			end

			local location = src.editing_modified[edit.selected]
			location.movement = edit.recording.movement

			local step_count = #edit.recording.movement.steps
			if finish_movement_recording(location) then
				client.log(string.format("[helper] Recorded movement (%d ticks)", step_count))
				edit_update_has_changed()
				flush_active_locations("movement_recorded")
			else
				client.error_log("[helper] No movement recorded")
			end

			update_sources_ui()
		end

		edit.recording.start_at = nil
		edit.recording.movement = nil
		edit.recording.active = false
		restore_recording_ui()
		return
	end

	if src.editing_modified[edit.selected] == nil then
		src.editing_modified[edit.selected] = {}
	end

	local location = src.editing_modified[edit.selected]
	apply_location_type_to_tbl(location, "Movement")

	if location.name == nil then
		local from = ui.get(edit_ui.from)
		local to = ui.get(edit_ui.to)
		if from:gsub(" ", "") == "" then from = "Unnamed" end
		if to:gsub(" ", "") == "" then to = "Unnamed" end
		location.name = {from, to}
	end

	local origin = vector(entity.get_prop(local_player, "m_vecAbsOrigin"))
	local pitch, yaw = client.camera_angles()
	local speed2d = vector(entity.get_prop(local_player, "m_vecAbsVelocity")):length2d()
	local start_at = edit.recording.start_at
	local movement = edit.recording.movement

	if start_at == nil and speed2d < 2 then
		local weapon_ent = entity.get_player_weapon(local_player)
		local weapon = weapons[entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")]

		location.position = {origin.x, origin.y, origin.z}
		location.viewangles = {pitch, yaw}
		location.weapon = weapon ~= nil and (WEAPON_ALIASES[weapon] or weapon).console_name or weapons.weapon_knife.console_name

		if location.strafer == nil then
			location.strafer = {
				quick_stop = ui.get(refs.standalone_quick_stop),
				air_strafe = ui.get(refs.airstrafe),
				wasd_strafer = ui.get(refs.air_strafe_direction),
				strafer_smoothing = ui.get(refs.air_strafe_smoothing),
			}
		end

		edit.recording.start_at = cmd.command_number
		edit.recording.movement = {steps = {}}
		start_at = edit.recording.start_at
		movement = edit.recording.movement
	end

	local tick = start_at == nil and 0 or cmd.command_number - edit.recording.start_at
	if tick == 0 then
		return
	end

	apply_recording_ui_overrides()

	local buttons = nil
	local function press_button(key)
		if cmd[key] == 1 then
			if buttons == nil then
				buttons = {}
			end
			buttons[key] = true
		end
	end

	press_button("in_forward")
	press_button("in_moveleft")
	press_button("in_moveright")
	press_button("in_back")
	press_button("in_duck")
	press_button("in_attack")
	press_button("in_attack2")
	press_button("in_jump")
	press_button("in_use")
	press_button("in_speed")

	if movement ~= nil then
		local forwardmove = cmd.forwardmove
		local sidemove = cmd.sidemove

		table.insert(movement.steps, {
			move_yaw = cmd.move_yaw,
			forwardmove = forwardmove ~= 0 and forwardmove or nil,
			sidemove = sidemove ~= 0 and sidemove or nil,
			buttons = buttons,
			viewangles = {pitch, yaw},
		})
	end
end

local function edit_read_ui_values()
	if edit.ignore_callbacks or edit.different_map_selected or edit.recording.movement ~= nil then
		return
	end

	if src.editing and src.editing_modified[edit.selected] == nil then
		-- print("is nil!")
		if edit.selected == "create_new" then
			-- src.editing_modified[edit.selected] = {}

			-- print("created new!")
		elseif edit.selected ~= nil then
			src.editing_modified[edit.selected] = edit.selected:get_export_tbl()
			edit_set_ui_values()

			-- print("cloned!")
		end
	end

	if src.editing and edit.selected ~= nil and src.editing_modified[edit.selected] ~= nil then
		local location = src.editing_modified[edit.selected]

		local prev = json.stringify(location)

		-- todo: get location names here
		local from = ui.get(edit_ui.from)
		if from:gsub(" ", "") == "" then
			from = "Unnamed"
		end

		local to = ui.get(edit_ui.to)
		if to:gsub(" ", "") == "" then
			to = "Unnamed"
		end

		location.name = {from, to}

		local description = ui.get(edit_ui.description)
		if description:gsub(" ", "") ~= "" then
			location.description = description:gsub("^%s+", ""):gsub("%s+$", "")
		else
			location.description = nil
		end

		local location_type_ui = ui.get(edit_ui.type)
		apply_location_type_to_tbl(location, location_type_ui)

		if location_type_ui == "Grenade" then
		location.grenade = location.grenade or {}
		local properties = table_map_assoc(ui.get(edit_ui.grenade_properties), function(i, property) return property, true end)

		if properties["Jump"] then
			location.grenade.jump = true
		else
			location.grenade.jump = nil
		end

		if properties["Jump"] or properties["Force-enable recovery"] then
			local recovery_yaw_offset
			local recovery_yaw_option = ui.get(edit_ui.recovery_direction)

			if recovery_yaw_option == "Custom" then
				recovery_yaw_offset = ui.get(edit_ui.recovery_direction_custom)

				if recovery_yaw_offset == -180 then
					recovery_yaw_offset = 180
				end
			else
				recovery_yaw_offset = YAW_DIRECTION_OFFSETS[recovery_yaw_option]
			end

			location.grenade.recovery_yaw = (recovery_yaw_offset ~= nil and recovery_yaw_offset ~= 180) and recovery_yaw_offset or (not properties["Jump"] and 180 or nil)
			location.grenade.recovery_jump = ui.get(edit_ui.recovery_jump) and true or nil

			-- print("saved: ", location.grenade.recovery_yaw)
		else
			location.grenade.recovery_yaw = nil
			location.grenade.recovery_jump = nil
		end

		if properties["Run"] then
			location.grenade.run = ui.get(edit_ui.run_duration)

			local run_yaw_offset
			local run_yaw_option = ui.get(edit_ui.run_direction)
			if run_yaw_option == "Custom" then
				run_yaw_offset = ui.get(edit_ui.run_direction_custom)
			else
				run_yaw_offset = YAW_DIRECTION_OFFSETS[run_yaw_option]
			end

			location.grenade.run_yaw = (run_yaw_offset ~= nil and run_yaw_offset ~= 0) and run_yaw_offset or nil

			if properties["Walk (Shift)"] then
				location.grenade.run_speed = true
			else
				location.grenade.run_speed = nil
			end
		else
			location.grenade.run = nil
			location.grenade.run_yaw = nil
			location.grenade.run_speed = nil
		end

		if properties["Delayed throw"] then
			location.grenade.delay = ui.get(edit_ui.delay)
		else
			location.grenade.delay = nil
		end

		if properties["Throw strength"] then
			local strength = ui.get(edit_ui.throw_strength)
			if strength == "Left / Right Click" then
				location.grenade.strength = 0.5
			elseif strength == "Right Click" then
				location.grenade.strength = 0
			else
				location.grenade.strength = nil
			end
		else
			location.grenade.strength = nil
		end

		if location.grenade ~= nil and next(location.grenade) == nil then
			location.grenade = nil
		end
		end

		if edit_update_has_changed() and editing_location_is_previewable(location) then
			flush_active_locations("edit_update_has_changed")
		end
	end
	update_sources_ui()
end
ui.set_callback(edit_ui.grenade_properties, edit_read_ui_values)
ui.set_callback(edit_ui.run_direction, edit_read_ui_values)
ui.set_callback(edit_ui.run_direction_custom, edit_read_ui_values)
ui.set_callback(edit_ui.run_duration, edit_read_ui_values)
ui.set_callback(edit_ui.recovery_direction, edit_read_ui_values)
ui.set_callback(edit_ui.recovery_direction_custom, edit_read_ui_values)
ui.set_callback(edit_ui.recovery_jump, edit_read_ui_values)
ui.set_callback(edit_ui.delay, edit_read_ui_values)
ui.set_callback(edit_ui.throw_strength, edit_read_ui_values)
ui.set_callback(edit_ui.type, function()
	if edit.ignore_callbacks or edit.different_map_selected then
		return
	end

	if src.editing and edit.selected ~= nil then
		if src.editing_modified[edit.selected] == nil then
			src.editing_modified[edit.selected] = {}
		end

		apply_location_type_to_tbl(src.editing_modified[edit.selected], ui.get(edit_ui.type))
		edit_read_ui_values()
	end

	update_sources_ui()
end)

client.delay_call(0, update_sources_ui)

function on_source_edit()
	if type(src.selected) == "table" and src.selected.type == "local" and not src.selected.builtin then
		src.editing = true
		update_sources_ui()
		flush_active_locations("on_source_edit")
	end
end

function on_source_edit_back()
	src.editing = false
	edit.selected = nil

	edit.recording.active = false
	edit.recording.prev_hotkey = false
	edit.recording.start_at = nil
	edit.recording.movement = nil
	restore_recording_ui()

	table_clear(src.editing_modified)
	table_clear(src.editing_has_changed)

	flush_active_locations("on_source_edit_back")
	update_sources_ui()
end

function on_edit_teleport()
	if not edit.different_map_selected and edit.selected ~= nil and (edit.selected == "create_new" or src.editing_modified[edit.selected] ~= nil) then
		if client.get_cvar("sv_cheats") == 0 then
			return
		end

		local location = src.editing_modified[edit.selected]

		if location ~= nil then
			client.exec(string.format("use %s; setpos_exact %f %f %f", location.weapon, unpack(location.position)))
			client.camera_angles(unpack(location.viewangles))

			client.delay_call(0.1, function()
				if entity.get_prop(entity.get_local_player(), "m_MoveType") == 8 then
					local x, y, z = unpack(location.position)
					client.exec(string.format("noclip off; setpos_exact %f %f %f", x, y, z+64))
				end
			end)
		end
	end
end

function on_edit_set()
	if not edit.different_map_selected and edit.selected ~= nil then
		if src.editing_modified[edit.selected] == nil then
			src.editing_modified[edit.selected] = {}
			edit_read_ui_values()
		end

		local local_player = entity.get_local_player()
		local weapon_ent = entity.get_player_weapon(local_player)
		local weapon = weapons[entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")]

		weapon = WEAPON_ALIASES[weapon] or weapon

		local location = src.editing_modified[edit.selected]

		local x, y, z = entity.get_prop(local_player, "m_vecAbsOrigin")
		location.position = {x, y, z}

		local pitch, yaw = client.camera_angles()
		location.viewangles = {pitch, yaw}

		local duckamount = entity.get_prop(local_player, "m_flDuckAmount")
		if duckamount ~= 0 then
			location.duck = duckamount == 1
		else
			location.duck = nil
		end

		apply_location_type_to_tbl(location, ui.get(edit_ui.type))
		location.weapon = weapon.console_name

		-- if weapon.type == "grenade" then
		-- 	local throw_strength = entity.get_prop(weapon_ent, "m_flThrowStrength")

		-- 	if throw_strength ~= 1 then
		-- 		location.grenade = location.grenade or {}

		-- 		if throw_strength == 0 then
		-- 			location.grenade.strength = 0
		-- 		else
		-- 			location.grenade.strength = 0.5
		-- 		end
		-- 	elseif location.grenade ~= nil then
		-- 		location.grenade.strength = nil
		-- 	end

		-- 	if location.grenade ~= nil and next(location.grenade) == nil then
		-- 		location.grenade = nil
		-- 	end
		-- end

		if edit_update_has_changed() and editing_location_is_previewable(location) then
			flush_active_locations("edit_update_has_changed")
		end
	end
end

function on_edit_save()
	if not edit.different_map_selected and edit.selected ~= nil and src.editing_modified[edit.selected] ~= nil then
		-- print("saving to ", edit.selected)

		local location = create_location(src.editing_modified[edit.selected])

		if type(location) ~= "table" then
			client.error_log("failed to save: " .. location)
			return
		end

		if location.type == "movement" and (location.movement_commands == nil or #location.movement_commands == 0) then
			client.error_log("failed to save: record movement first (Movement type needs frames)")
			return
		end

		local mapname = get_mapname()

		if mapname == nil then
			return
		end

		local source_locations = rt.sources_locations[src.selected][mapname]
		if source_locations == nil then
			source_locations = {}
			rt.sources_locations[src.selected][mapname] = source_locations
		end
		if edit.selected == "create_new" then
			table.insert(source_locations, location)
			src.selected:store_write()
			flush_active_locations()

			edit.selected = location
			src.editing_modified[edit.selected] = src.editing_modified["create_new"]
			src.editing_modified["create_new"] = nil
		elseif type(edit.selected) == "table" then
			for i=1, #source_locations do
				if source_locations[i] == edit.selected then
					src.editing_modified[location] = src.editing_modified[source_locations[i]]
					src.editing_modified[source_locations[i]] = nil
					edit.selected = location

					source_locations[i] = location

					src.selected:store_write()
					flush_active_locations()
					break
				end
			end
		end

		database.flush()

		edit_set_ui_values()

		update_sources_ui()
		flush_active_locations()
	end
end

function on_edit_export()
	if type(edit.selected) == "table" or src.editing_modified[edit.selected] ~= nil then
		local location = create_location(src.editing_modified[edit.selected]) or edit.selected

		if type(location) == "table" then
			local export_str = location:get_export(true)

			if set_clipboard_text ~= nil then
				set_clipboard_text(export_str)
				client.log("Exported location (Copied to clipboard):")
			else
				client.log("Exported location:")
			end
			pretty_json.print_highlighted(export_str)
		else
			client.error_log(location)
		end
	end
end

function on_edit_delete()
	if not edit.different_map_selected and edit.selected ~= nil and type(edit.selected) == "table" then
		local mapname = get_mapname()
		if mapname == nil then
			return
		end

		local source_locations = rt.sources_locations[src.selected][mapname]

		for i=1, #source_locations do
			if source_locations[i] == edit.selected then
				table.remove(source_locations, i)
				src.editing_modified[edit.selected] = nil
				edit.selected = nil
				update_sources_ui()
				src.selected:store_write()
				database.flush()
				flush_active_locations()
				break
			end
		end
	end
end

ui.set_callback(edit_ui.list, function()
	local edit_selected_prev = edit.selected
	local i = ui.get(edit_ui.list)

	if i ~= nil then
		edit.selected = edit.list[i+1]
	else
		edit.selected = "create_new"
		-- error("ui.get on edit listbox returned nil!")
	end

	-- print("prev: ", tostring(edit_selected_prev))
	-- print("cur: ", tostring(edit.selected))

	update_sources_ui()
	if edit.selected ~= edit_selected_prev and not edit.different_map_selected then
		-- print("edit.selected changed to ", tostring(edit.selected))

		if type(edit.selected) == "table" and src.editing_modified[edit.selected] == nil then
			src.editing_modified[edit.selected] = edit.selected:get_export_tbl()
		end

		edit_set_ui_values()
		update_sources_ui()
		flush_active_locations()
	elseif edit.selected ~= edit_selected_prev then
		edit_set_ui_values()
	end
end)

local vec3 = { dist = vector().dist, distsqr = vector().distsqr }

update_sources_ui()
client.delay_call(0, update_sources_ui)

icons.edit = images.get_panorama_image("icons/ui/edit.svg")
icons.warning = images.get_panorama_image("icons/ui/warning.svg")

local function on_paint_editing()
	local hotkeys = {
		set_hotkey = on_edit_set,
		teleport_hotkey = on_edit_teleport,
		delete_hotkey = on_edit_delete
	}

	for key, callback in pairs(hotkeys) do
		local value = ui.get(edit_ui[key])

		if src.editing_hotkeys_prev[key] == nil then
			src.editing_hotkeys_prev[key] = value
		end

		if value and not src.editing_hotkeys_prev[key] then
			callback()
		end

		src.editing_hotkeys_prev[key] = value
	end

	local location = src.editing_modified[edit.selected]
	if location ~= nil then
		local from = ui.get(edit_ui.from)
		local to = ui.get(edit_ui.to)

		if from:gsub(" ", "") == "" then
			from = "Unnamed"
		end

		if to:gsub(" ", "") == "" then
			to = "Unnamed"
		end

		local name_from, name_to
		if type(location.name) == "table" then
			name_from, name_to = location.name[1], location.name[2]
		elseif type(location.name) == "string" then
			name_from, name_to = location.name, location.name
		end

		if (from ~= name_from) or (to ~= name_to) then
			edit_read_ui_values()
		end

		local description = ui.get(edit_ui.description)
		if description:gsub(" ", "") ~= "" then
			description = description:gsub("^%s+", ""):gsub("%s+$", "")
		else
			description = nil
		end

		if location.description ~= description then
			edit_read_ui_values()
		end

		local location_orig = type(edit.selected) == "table" and edit.selected:get_export_tbl() or {}
		local location_orig_flattened = deep_flatten(location_tbl_for_edit_display(location_orig), true)

		local has_changes = src.editing_has_changed[edit.selected]
		local key_values = deep_flatten(location_tbl_for_edit_display(location), true)
		local key_values_arr = {}
		for key, value in pairs(key_values) do
			local changed = false
			local val_new = json.stringify(value)

			if has_changes then
				local val_old = json.stringify(location_orig_flattened[key])

				changed = val_new ~= val_old
			end

			local val_new_fancy = pretty_json.highlight(val_new, changed and {244, 147, 134} or {221, 221, 221}, changed and {223, 57, 35} or {218, 230, 30}, changed and {209, 42, 62} or {180, 230, 30}, changed and {209, 42, 62} or {96, 160, 220})
			local text_new = ""
			for i=1, #val_new_fancy do
				local r, g, b, text = unpack(val_new_fancy[i])
				text_new = text_new .. string.format("\a%02X%02X%02XFF%s", r, g, b, text)
			end

			table.insert(key_values_arr, {key, text_new, changed})
		end

		local lookup = {
			name = "\1",
			weapon = "\2",
			position = "\3",
			viewangles = "\4",
		}
		table.sort(key_values_arr, function(a, b)
			return (lookup[b[1]] or b[1]) > (lookup[a[1]] or a[1])
		end)

		local lines = {
			{{icons.edit, 0, 0, 12, 12}, 255, 255, 255, 220, "b", 0, " Editing Location:"}
		}

		for i=1, #key_values_arr do
			local key, value, changed = unpack(key_values_arr[i])

			table.insert(lines, {255, 255, 255, 220, "", 0, key, ": ", changed and "\aF21A3EFF" or "\aFFFFFFDC", value})
		end

		local size_prev = #lines
		if has_changes then
			table.insert(lines, {{icons.warning, 0, 0, 12, 12, 255, 54, 0, 255}, 234, 64, 18, 220, "", 0, "You have unsaved changes! Make sure to click Save."})
		end

		if ui.get(edit_ui.type) == "Grenade" then
			local weapon = weapons[location.weapon]
			if weapon ~= nil and weapon.type == "grenade" then
				local types_enabled = table_map_assoc(ui.get(refs.types), function(i, typ) return typ, true end)
				local weapon_name = GRENADE_WEAPON_NAMES_UI[weapon]
				if not types_enabled[weapon_name] then
					table.insert(lines, {{icons.warning, 0, 0, 12, 12, 255, 54, 0, 255}, 234, 64, 18, 220, "", 0, "Location not shown because type \"", tostring(weapon_name), "\" is not enabled."})
				end
			end
		elseif ui.get(edit_ui.type) == "Location" then
			local types_enabled = table_map_assoc(ui.get(refs.types), function(i, typ) return typ, true end)
			if not types_enabled["Location"] then
				table.insert(lines, {{icons.warning, 0, 0, 12, 12, 255, 54, 0, 255}, 234, 64, 18, 220, "", 0, "Location not shown because type \"Location\" is not enabled."})
			end
		elseif ui.get(edit_ui.type) == "Area" then
			local types_enabled = table_map_assoc(ui.get(refs.types), function(i, typ) return typ, true end)
			if not types_enabled["Area"] then
				table.insert(lines, {{icons.warning, 0, 0, 12, 12, 255, 54, 0, 255}, 234, 64, 18, 220, "", 0, "Location not shown because type \"Area\" is not enabled."})
			end
		end

		local sources_config = get_sources_config()

		if src.selected ~= nil and not sources_config.enabled[src.selected.id] then
			table.insert(lines, {{icons.warning, 0, 0, 12, 12, 255, 54, 0, 255}, 234, 64, 18, 220, "", 0, "Location not shown because source \"", tostring(src.selected.name), "\" is not enabled."})
		end

		if #lines > size_prev then
			table.insert(lines, size_prev+1, {255, 255, 255, 0, "", 0, " "})
		end

		local width, height, line_y = 0, 0, {}
		for i=1, #lines do
			local line = lines[i]
			local has_icon = type(line[1]) == "table"
			local w, h = renderer.measure_text(select(has_icon and 7 or 6, unpack(line)))

			if has_icon then
				w = w + line[1][4]
			end

			if w > width then
				width = w
			end

			line_y[i] = height
			height = height + h

			if i == 1 then
				height = height + 2
			end
		end

		local screen_width, screen_height = client.screen_size()
		local x = screen_width/2-math.floor(width/2)
		local y = 140

		-- draw background
		renderer.rectangle(x-4, y-3, width+8, height+6, 16, 16, 16, 150*0.7)
		rectangle_outline(x-5, y-4, width+10, height+8, 16, 16, 16, 170*0.7)
		rectangle_outline(x-6, y-5, width+12, height+10, 16, 16, 16, 195*0.7)
		rectangle_outline(x-7, y-6, width+14, height+12, 16, 16, 16, 40*0.7)

		icons.edit:draw(x, y, 12, 12)
		renderer.rectangle(x+15, y, 1, 12, 255, 255, 255, 255)

		for i=1, #lines do
			local line = lines[i]
			local has_icon = type(line[1]) == "table"

			local icon, ix, iy, iw, ih, ir, ig, ib, ia
			if has_icon then
				icon, ix, iy, iw, ih, ir, ig, ib, ia = unpack(line[1])
				icon:draw(x+ix, y+iy+line_y[i], iw, ih, ir, ig, ib, ia)
			end

			renderer.text(x+(iw or -3)+3, y+line_y[i], select(has_icon and 2 or 1, unpack(lines[i])))
		end
	end
end

local function process_movement_record_hotkey(cmd)
	process_movement_recording(cmd)
end

local function get_location_fingerprint(location)
	if location.type ~= "grenade" then
		return nil
	end

	local weapon_name = location.weapons[1] and location.weapons[1].console_name or ""
	return string.format("%s|%.0f|%.0f|%.0f|%.1f|%.1f",
		weapon_name,
		location.position.x, location.position.y, location.position.z,
		location.viewangles.pitch, location.viewangles.yaw)
end

local function populate_map_locations(local_player, weapon)
	rt.map_locations[weapon] = {}
	rt.active_locations = rt.map_locations[weapon]

	local tickrate = 1/globals.tickinterval()
	local mapname = get_mapname()
	local sources_config = get_sources_config()
	local types_enabled = table_map_assoc(ui.get(refs.types), function(i, typ) return typ, true end)
	local hide_duplicates = ui.get(refs.hide_duplicates)

	table_clear(rt.populate_seen_fingerprints)

	for i=1, #db.sources do
		local source = db.sources[i]
		if sources_config.enabled[source.id] then
			local source_locations = source:get_locations(mapname, true)

			local editing_current_source = src.editing and src.selected == source

			if editing_current_source then
				local source_locations_new = {}

				-- print("editing_current_source!")
				-- print(tostring(edit.selected))

				for i=1, #source_locations do
					if source_locations[i] == edit.selected and src.editing_modified[source_locations[i]] == nil then
						-- print("src.editing_modified[source_locations[i]] is nil")
					end

					if source_locations[i] == edit.selected and src.editing_modified[source_locations[i]] ~= nil then
						local edit_tbl = src.editing_modified[source_locations[i]]
						local location = editing_location_is_previewable(edit_tbl) and create_location(edit_tbl) or nil

						-- print("create!")

						if type(location) == "table" then
							location.editing = src.editing and src.editing_has_changed[source_locations[i]]
							source_locations_new[i] = location
						else
							client.error_log("Failed to initialize editing location: " .. tostring(location))
							source_locations_new[i] = source_locations[i]
						end
					else
						source_locations_new[i] = source_locations[i]
					end
				end

				if edit.selected == "create_new" and src.editing_modified["create_new"] ~= nil then
					local edit_tbl = src.editing_modified["create_new"]
					if editing_location_is_previewable(edit_tbl) then
						local location = create_location(edit_tbl)

						if type(location) == "table" then
							location.editing = src.editing and src.editing_has_changed[edit.selected]
							table.insert(source_locations_new, location)
						else
							client.error_log("Failed to initialize new editing location: " .. tostring(location))
						end
					end
				end

				source_locations = source_locations_new
			end

			for i=1, #source_locations do
				local location = source_locations[i]

				if location ~= nil then
				local include = false
				if location.type == "grenade" then
					if location.tickrates[tickrate] ~= nil then
						for wi=1, #location.weapons do
							local weapon_name = GRENADE_WEAPON_NAMES_UI[location.weapons[wi]]
							if types_enabled[weapon_name] then
								include = true
							end
						end
					end
				elseif location.type == "movement" then
					if types_enabled["Movement"] then
						include = true
					end
				elseif location.type == "location" then
					if types_enabled["Location"] then
						include = true
					end
				elseif location.type == "area" then
					if types_enabled["Area"] then
						include = true
					end
				elseif location.type == "wallbang" then
					include = false
				else
					client.error_log("[helper] unknown location type: " .. tostring(location.type))
				end

				if include and hide_duplicates then
					local fingerprint = get_location_fingerprint(location)
					if fingerprint ~= nil then
						if rt.populate_seen_fingerprints[fingerprint] then
							include = false
						else
							rt.populate_seen_fingerprints[fingerprint] = true
						end
					end
				end

				if include and location.weapons_assoc[weapon] then
					local location_set = rt.active_locations[location.position_id]
					if location_set == nil then
						location_set = {
							position=location.position,
							position_approach=location.position,
							position_visibility=location.position_visibility,
							visible_alpha = 0,
							distance_alpha = 0,
							distance_width_mp = 0,
							in_range_draw_mp = 0,
							position_world_bottom = location.position+limits.WORLD_OFFSET,
						}
						rt.active_locations[location.position_id] = location_set
					end

					location.in_fov_select_mp = 0
					location.in_fov_mp = 0
					location.on_screen_mp = 0
					table.insert(location_set, location)

					location.set = location_set

					if location.position_visibility_different then
						location_set.position_visibility = location.position_visibility
					end

					if location.duckamount ~= 1 then
						location_set.has_only_duck = false
					elseif location.duckamount == 1 and location_set.has_only_duck == nil then
						location_set.has_only_duck = true
					end

					if location.approach_accurate ~= nil then
						if location_set.approach_accurate == nil or location_set.approach_accurate == location.approach_accurate then
							location_set.approach_accurate = location.approach_accurate
						else
							client.error_log("approach_accurate conflict found")
						end
					end
				end
				end
			end
		end
	end

	local count = 0

	for key, value in pairs(rt.active_locations) do
		if key > count then
			count = key
		end
	end

	for position_id_1=1, count do
		local locations_1 = rt.active_locations[position_id_1]

		if locations_1 ~= nil then
			local pos_1 = locations_1.position

			for position_id_2=position_id_1+1, count do
				local locations_2 = rt.active_locations[position_id_2]

				if locations_2 ~= nil then
					local pos_2 = locations_2.position

					if vec3.distsqr(pos_1, pos_2) < limits.COMBINE_SQR then
						local main = #locations_2 > #locations_1 and position_id_2 or position_id_1
						local other = main == position_id_1 and position_id_2 or position_id_1

						local main_locations = rt.active_locations[main]
						local other_locations = rt.active_locations[other]

						if main_locations ~= nil and other_locations ~= nil then
							local main_count = #main_locations
							for i=1, #other_locations do
								local location = other_locations[i]
								main_locations[main_count+i] = location

								location.set = main_locations

								if location.duckamount ~= 1 then
									main_locations.has_only_duck = false
								elseif location.duckamount == 1 and main_locations.has_only_duck == nil then
									main_locations.has_only_duck = true
								end
							end

							-- print("combining:")
							-- print(inspect(main_locations))
							-- print(inspect(other_locations))

							local sum_x, sum_y, sum_z = 0, 0, 0
							local new_len = #main_locations
							for i=1, new_len do
								local position = main_locations[i].position
								sum_x = sum_x + position.x
								sum_y = sum_y + position.y
								sum_z = sum_z + position.z
							end
							main_locations.position = vector(sum_x/new_len, sum_y/new_len, sum_z/new_len)
							main_locations.position_world_bottom = main_locations.position+limits.WORLD_OFFSET

							rt.active_locations[other] = nil
						end
					end
				end
			end
		end
	end

	local sort_by_yaw_fn = function(a, b)
		return a.viewangles.yaw > b.viewangles.yaw
	end

	for _, location_set in pairs(rt.active_locations) do
		if #location_set > 1 then
			table.sort(location_set, sort_by_yaw_fn)
		end

		if location_set.approach_accurate == nil then
			local count_accurate_move = 0

			for i=1, #approach.OFFSETS_END do
				if count_accurate_move > 1 then
					break
				end

				local end_offset = approach.OFFSETS_END[i]

				for i=1, #approach.OFFSETS_START do
					local start = location_set.position + approach.OFFSETS_START[i]
					local start_x, start_y, start_z = start:unpack()

					local target = start + end_offset
					local target_x, target_y, target_z = target:unpack()
					-- client.draw_debug_text(start_x, start_y, start_z, 0, 5, 255, 255, 255, 255, "S", i)

					local fraction, entindex_hit = client.trace_line(local_player, start_x, start_y, start_z, target_x, target_y, target_z)
					local end_pos = start + end_offset
					-- client.draw_debug_text(target_x, target_y, target_z, 0, 5, 255, 255, 255, 255, "E", i)

					if entindex_hit == 0 and fraction > 0.45 and fraction < 0.6 then
						count_accurate_move = count_accurate_move + 1
						-- client.draw_debug_text(target_x, target_y, target_z, 1, 5, 0, 255, 0, 100, "HIT ", fraction)
						break
					end
				end
			end

			-- client.draw_debug_text(location.pos.x, location.pos.y, location.pos.z, 0, 5, 255, 255, 255, 255, "hit ", count_accurate_move, " times")
			location_set.approach_accurate = count_accurate_move > 1
		end
	end
end

local function ui_set_restore(key, value)
	if pb.ui_restore[key] == nil then
		pb.ui_restore[key] = ui.get(key)
	end

	ui.set(key, value)
end

local function restore_disabled()
	for key, value in pairs(pb.ui_restore) do
		ui.set(key, value)
	end

	if pb.sensitivity_set then
		cvar.sensitivity:set_raw_float(tonumber(cvar.sensitivity:get_string()))
		pb.sensitivity_set = nil
	end

	table_clear(pb.ui_restore)
end

local function on_paint()
	rt.location_set_closest = nil
	rt.location_selected = nil

	local local_player = entity.get_local_player()
	if local_player == nil then
		rt.active_locations = nil

		if rt.location_playback ~= nil then
			rt.location_playback = nil
			restore_disabled()
		end

		return
	end

	local weapon_entindex = entity.get_player_weapon(local_player)
	if weapon_entindex == nil then
		rt.active_locations = nil

		if rt.location_playback ~= nil then
			rt.location_playback = nil
			restore_disabled()
		end

		return
	end

	local weapon = weapons[entity.get_prop(weapon_entindex, "m_iItemDefinitionIndex")]
	if weapon == nil then
		rt.active_locations = nil

		if rt.location_playback ~= nil then
			rt.location_playback = nil
			restore_disabled()
		end

		return
	end

	if WEAPON_ALIASES[weapon] ~= nil then
		weapon = WEAPON_ALIASES[weapon]
	end

	local weapon_changed = rt.weapon_prev ~= weapon
	if weapon_changed then
		rt.active_locations = nil
		rt.weapon_prev = weapon
	end

	local dpi_scale = tonumber(ui.get(refs.dpi_scale):sub(1, -2)/100)

	local hotkey = ui.get(refs.hotkey)
	local aimbot_is_silent = true

	local screen_width, screen_height = client.screen_size()
	local min_height, max_height = math.floor(screen_height*0.012)*dpi_scale, screen_height*0.018*dpi_scale
	local realtime = globals.realtime()
	local frametime = globals.frametime()

	local cam_pitch, cam_yaw = client.camera_angles()
	local cam_pos = vector(client.camera_position())
	local cam_up = vector():init_from_angles(cam_pitch-90, cam_yaw)

	local local_origin = vector(entity.get_prop(local_player, "m_vecAbsOrigin"))

	local position_world_top_offset = cam_up * limits.WORLD_TOP_SIZE

	local r_m, g_m, b_m, a_m = ui.get(refs.color)

	-- for i=0, 600 do
	-- 	local value = i/600

	-- 	local r, g, b = lerp_color(CIRCLE_RED_R, CIRCLE_RED_G, CIRCLE_RED_B, 0, CIRCLE_GREEN_R, CIRCLE_GREEN_G, CIRCLE_GREEN_B, 0, value)
	-- 	renderer.rectangle(screen_width/2-300+i, 1200, 1, 40, r, g, b, 255)
	-- end

	if rt.location_playback ~= nil and (not hotkey or not entity.is_alive(local_player) or entity.get_prop(local_player, "m_MoveType") == 8) then
		rt.location_playback = nil
		restore_disabled()
	end

	if src.editing then
		on_paint_editing()
	end

	if rt.active_locations == nil then
		benchmark:start("create rt.active_locations")
		rt.active_locations = {}
		rt.active_locations_in_range = {}
		rt.last_vischeck = 0

		if rt.map_locations[weapon] == nil then
			populate_map_locations(local_player, weapon)
		else
			rt.active_locations = rt.map_locations[weapon]

			if weapon_changed then
				for _, location_set in pairs(rt.active_locations) do
					location_set.visible_alpha = 0
					location_set.distance_alpha = 0
					location_set.distance_width_mp = 0
					location_set.in_range_draw_mp = 0

					for i=1, #location_set do
						location_set[i].set = location_set
					end
				end
			end
		end

		benchmark:finish("create rt.active_locations")
	end

	if rt.active_locations ~= nil then
		-- benchmark:start("[helper] frame")
		if realtime > rt.last_vischeck+0.07 then
			table_clear(rt.active_locations_in_range)
			rt.last_vischeck = realtime

			for _, location_set in pairs(rt.active_locations) do
				location_set.distsqr = vec3.distsqr(local_origin, location_set.position)
				location_set.in_range = location_set.distsqr <= limits.ICON_SQR
				if location_set.in_range then
					location_set.distance = math.sqrt(location_set.distsqr)
					local sx, sy, sz = cam_pos:unpack()
					local fraction, entindex_hit = trace_line_debug(local_player, sx, sy, sz, location_set.position_visibility:unpack())

					location_set.visible = entindex_hit == -1 or fraction > 0.99
					location_set.in_range_text = location_set.distance <= limits.TEXT

					table.insert(rt.active_locations_in_range, location_set)
				else
					location_set.distance_alpha = 0
					location_set.in_range_text = false
					location_set.distance_width_mp = 0
				end
			end

			table.sort(rt.active_locations_in_range, sort_by_distsqr)
		end

		if #rt.active_locations_in_range == 0 then
			return
		end

		for i=1, #rt.active_locations_in_range do
			local location_set = rt.active_locations_in_range[i]

			if rt.location_set_closest == nil or location_set.distance < rt.location_set_closest.distance then
				rt.location_set_closest = location_set
			end
		end

		local location_playback_set = rt.location_playback ~= nil and rt.location_playback.set or nil

		local closest_mp = 1
		if location_playback_set ~= nil then
			rt.location_set_closest = location_playback_set
			closest_mp = 1
		elseif rt.location_set_closest.distance < limits.CLOSE then
			closest_mp = 0.4+easing.quad_in_out(rt.location_set_closest.distance, 0, 0.6, limits.CLOSE)
		else
			rt.location_set_closest = nil
		end

		local behind_walls = ui.get(refs.behind_walls)

		local boxes_drawn_aabb = {}
		for i=1, #rt.active_locations_in_range do
			local location_set = rt.active_locations_in_range[i]
			local is_closest = location_set == rt.location_set_closest

			location_set.distance = local_origin:dist(location_set.position)
			location_set.distance_alpha = location_playback_set == location_set and 1 or easing.quart_out(1 - location_set.distance / limits.ICON, 0, 1, 1)

			local display_full_width = location_set.in_range_text and (closest_mp > 0.5 or is_closest)
			if display_full_width and location_set.distance_width_mp < 1 then
				location_set.distance_width_mp = math.min(1, location_set.distance_width_mp + frametime*7.5)
			elseif not display_full_width and location_set.distance_width_mp > 0 then
				location_set.distance_width_mp = math.max(0, location_set.distance_width_mp - frametime*7.5)
			end
			local distance_width_mp = easing.quad_in_out(location_set.distance_width_mp, 0, 1, 1)

			local invisible_alpha = (behind_walls and location_set.distance_width_mp > 0) and 0.45 or 0
			local invisible_fade_mp = (behind_walls and location_set.distance_width_mp > 0 and not location_set.visible) and 0.33 or 1

			if (location_set.visible and location_set.visible_alpha < 1) or (location_set.visible_alpha < invisible_alpha) then
				location_set.visible_alpha = math.min(1, location_set.visible_alpha + frametime*5.5*invisible_fade_mp)
			elseif not location_set.visible and location_set.visible_alpha > invisible_alpha then
				location_set.visible_alpha = math.max(invisible_alpha, location_set.visible_alpha - frametime*7.5*invisible_fade_mp)
			end
			local visible_alpha = easing.sine_in_out(location_set.visible_alpha, 0, 1, 1) * (is_closest and 1 or closest_mp) * location_set.distance_alpha

			if not is_closest then
				location_set.in_range_draw_mp = 0
			end

			if visible_alpha > 0 then
				local position_bottom = location_set.position_world_bottom
				local wx_bot, wy_bot = renderer.world_to_screen(position_bottom:unpack())

				if wx_bot ~= nil then
					local wx_top, wy_top = renderer.world_to_screen((position_bottom + position_world_top_offset):unpack())

					if wx_top ~= nil then
						local width_text, height_text = 0, 0
						local lines = {}

						for i=1, #location_set do
							local location = location_set[i]
							local name = location.name
							local r, g, b, a = r_m, g_m, b_m, a_m*visible_alpha

							if location.editing then
								r, g, b = unpack(CLR_TEXT_EDIT)
							end

							table.insert(lines, {r, g, b, a, "d", name})
						end

						for i=1, #lines do
							local r, g, b, a, flags, text = unpack(lines[i])
							local lw, lh = renderer.measure_text(flags, text)
							lh = lh - 1
							if lw > width_text then
								width_text = lw
							end
							lines[i].y_o = height_text-1
							height_text = height_text + lh
							lines[i].width = lw
							lines[i].height = lh
						end

						if location_set.distance_width_mp < 1 then
							width_text = width_text * location_set.distance_width_mp
							height_text = math.max(lines[1] and lines[1].height or 0, height_text * math.min(1, location_set.distance_width_mp * 1))

							for i=1, #lines do
								local r, g, b, a, flags, text = unpack(lines[i])

								for j=text:len(), 0, -1 do
									local text_modified = text:sub(1, j)
									local lw = renderer.measure_text(flags, text_modified)

									if width_text >= lw then
										lines[i][6] = text_modified
										lines[i].width = lw
										break
									end
								end
							end
						end

						if location_set.distance_width_mp > 0 then
							width_text = width_text + 2
						else
							width_text = 0
						end

						local wx_icon, wy_icon, width_icon, height_icon, width_icon_orig, height_icon_orig
						local icon

						local location = location_set[1]
						if location.type == "movement" and location.weapons[1].type ~= "grenade" then
							icon = icons.bhop
						else
							icon = WEAPON_ICONS[location_set[1].weapons[1]]
						end

						local ox, oy, ow, oh
						if icon ~= nil then
							ox, oy, ow, oh = unpack(WEPAON_ICONS_OFFSETS[icon])
							local _height = math.min(max_height, math.max(min_height, height_text+2, math.abs(wy_bot-wy_top)))
							width_icon_orig, height_icon_orig = icon:measure(nil, _height)
							-- wx_icon, wy_icon = wx_bot-width_icon/2, wy_top+(wy_bot-wy_top)/2-_height/2

							ox = ox * width_icon_orig
							oy = oy * height_icon_orig
							width_icon = width_icon_orig + ow * width_icon_orig
							height_icon = height_icon_orig + oh * height_icon_orig
						end

						local full_width, full_height = width_text, height_text
						if width_icon ~= nil then
							full_width = full_width+(location_set.distance_width_mp*8*dpi_scale)+width_icon
							full_height = math.max(height_icon, height_text)
						else
							full_height = math.max(math.floor(15*dpi_scale), height_text)
						end

						local wx_topleft, wy_topleft = math.floor(wx_top-full_width/2), math.floor(wy_bot-full_height)

						for i=1, #boxes_drawn_aabb do
							local x2, y2, w2, h2 = unpack(boxes_drawn_aabb[i])

							-- while wx_topleft < x2+w2 and x2 < wx_bot and wy_topleft < y2+h2 and y2 < wy_bot do
							-- 	wy_bot = wy_bot-1
							-- 	wy_topleft = wy_topleft-1
							-- end

							-- if wx_topleft < x2+w2 and x2 < wx_bot and wy_topleft < y2+h2 and y2 < wy_bot then
							-- 	visible_alpha = visible_alpha * 0.1
							-- end
						end

						if width_icon ~= nil then
							wx_icon = wx_bot-full_width/2+ox
							wy_icon = wy_bot-full_height+oy

							if height_text > height_icon then
								wy_icon = wy_icon + (height_text-height_icon)/2
							end
						end

						renderer.rectangle(wx_topleft-2, wy_topleft-2, full_width+4, full_height+4, 16, 16, 16, 180*visible_alpha)
						rectangle_outline(wx_topleft-3, wy_topleft-3, full_width+6, full_height+6, 16, 16, 16, 170*visible_alpha)
						rectangle_outline(wx_topleft-4, wy_topleft-4, full_width+8, full_height+8, 16, 16, 16, 195*visible_alpha)
						rectangle_outline(wx_topleft-5, wy_topleft-5, full_width+10, full_height+10, 16, 16, 16, 40*visible_alpha)

						local r_m, g_m, b_m = r_m, g_m, b_m
						if location_set[1].editing and #location_set == 1 then
							r_m, g_m, b_m = unpack(CLR_TEXT_EDIT)
						end

						if location_set.distance_width_mp > 0 then
							if width_icon ~= nil then
								renderer.rectangle(wx_topleft+width_icon+3, wy_topleft+2, 1, full_height-3, r_m, g_m, b_m, a_m*visible_alpha)
							end

							local wx_text, wy_text = wx_topleft+(width_icon == nil and 0 or width_icon+8*dpi_scale), wy_topleft
							if full_height > height_text then
								wy_text = wy_text + math.floor((full_height-height_text) / 2)
							end

							for i=1, #lines do
								local r, g, b, a, flags, text = unpack(lines[i])
								local _x, _y = wx_text, wy_text+lines[i].y_o

								if lines[i].y_o+lines[i].height-4 > height_text then
									break
								end

								renderer.text(_x, _y, r, g, b, a, flags, 0, text)
							end
						end

						if icon ~= nil then
							local outline_size = math.min(2, full_height*0.03)

							local outline_a_mp = 1
							if outline_size > 0.6 and outline_size < 1 then
								outline_a_mp = (outline_size-0.6)/0.4
								outline_size = 1
							else
								outline_size = math.floor(outline_size)
							end

							local outline_r, outline_g, outline_b, outline_a = 0, 0, 0, 80*outline_a_mp*visible_alpha
							if outline_size > 0 then
								icon:draw(wx_icon-outline_size, wy_icon, width_icon_orig, height_icon_orig, outline_r, outline_g, outline_b, outline_a, true)
								icon:draw(wx_icon+outline_size, wy_icon, width_icon_orig, height_icon_orig, outline_r, outline_g, outline_b, outline_a, true)
								icon:draw(wx_icon, wy_icon-outline_size, width_icon_orig, height_icon_orig, outline_r, outline_g, outline_b, outline_a, true)
								icon:draw(wx_icon, wy_icon+outline_size, width_icon_orig, height_icon_orig, outline_r, outline_g, outline_b, outline_a, true)
							end

							-- renderer.rectangle(wx_icon, wy_icon, width_icon, height_icon, 255, 0, 0, 180)
							icon:draw(wx_icon, wy_icon, width_icon_orig, height_icon_orig, r_m, g_m, b_m, a_m*visible_alpha, true)

							-- local o = client.random_int(-10, 10)
							-- renderer.line(wx+o, wy, wx_top+o, wy_top, 255, 0, 0, 255)
						end

						-- renderer.line(wx_top, wy_top, wx_bot, wy_bot, 255, 0, 0, 255)
						-- renderer.text(wx_top, wy_top-6, 255, 0, 0, 255, "c", 0, math.abs(wy_bot-wy_top))

						table.insert(boxes_drawn_aabb, {wx_topleft-10, wy_topleft-10, full_width+10, full_height+10})
					end
				end
			end
		end

		if rt.location_set_closest ~= nil then
			if rt.location_set_closest.distance == nil then
				rt.location_set_closest.distance = local_origin:dist(rt.location_set_closest.position)
			end
			local in_range_draw = rt.location_set_closest.distance < limits.CLOSE_DRAW

			if rt.location_set_closest == location_playback_set then
				rt.location_set_closest.in_range_draw_mp = 1
			elseif in_range_draw and rt.location_set_closest.in_range_draw_mp < 1 then
				rt.location_set_closest.in_range_draw_mp = math.min(1, rt.location_set_closest.in_range_draw_mp + frametime*8)
			elseif not in_range_draw and rt.location_set_closest.in_range_draw_mp > 0 then
				rt.location_set_closest.in_range_draw_mp = math.max(0, rt.location_set_closest.in_range_draw_mp - frametime*8)
			end

			if rt.location_set_closest.in_range_draw_mp > 0 then
				local matrix = native_GetWorldToScreenMatrix()

				local location_closest
				for i=1, #rt.location_set_closest do
					local location = rt.location_set_closest[i]

					if location.viewangles_target ~= nil then
						local pitch, yaw = location.viewangles.pitch, location.viewangles.yaw
						local dp, dy = normalize_angles(cam_pitch - pitch, cam_yaw - yaw)
						location.viewangles_dist = math.sqrt(dp*dp + dy*dy)

						if location_closest == nil or location_closest.viewangles_dist > location.viewangles_dist then
							location_closest = location
						end

						location.is_in_fov_select = location.viewangles_dist <= (location.fov_select or DEFAULTS.select_fov_rage)

						local dist = local_origin:dist(location.position)
						local dist2d = local_origin:dist2d(location.position)
						if dist2d < 1.5 then
							dist = dist2d
						end

						location.is_position_correct = dist < limits.CORRECT
							and entity.get_prop(local_player, "m_flDuckAmount") == location.duckamount
							and vector(entity.get_prop(local_player, "m_vecAbsVelocity")):length2d() < 8

						if location.fov ~= nil then
							location.is_in_fov = location.is_in_fov_select and aimbot_is_silent
						end
					end
				end

				-- local visible_alpha = easing.sine_in_out(location_set.visible_alpha, 0, 1, 1) * (is_closest and 1 or closest_mp)

				local in_range_draw_mp = easing.cubic_in(rt.location_set_closest.in_range_draw_mp, 0, 1, 1)

				for i=1, #rt.location_set_closest do
					local location = rt.location_set_closest[i]

					if location.viewangles_target ~= nil then
						local is_closest = location == location_closest
						local is_selected = is_closest and location.is_in_fov_select
						local is_in_fov = is_selected and location.is_in_fov

						local in_fov_select_mp = 1
						if location.is_in_fov_select ~= nil then
							if is_selected and location.in_fov_select_mp < 1 then
								location.in_fov_select_mp = math.min(1, location.in_fov_select_mp + frametime*2.5*(is_in_fov and 2 or 1))
							elseif not is_selected and location.in_fov_select_mp > 0 then
								location.in_fov_select_mp = math.max(0, location.in_fov_select_mp - frametime*4.5)
							end

							in_fov_select_mp = location.in_fov_select_mp
						end

						local in_fov_mp = 1
						if location.is_in_fov ~= nil then
							if is_in_fov and location.in_fov_mp < 1 then
								location.in_fov_mp = math.min(1, location.in_fov_mp + frametime*6.5)
							elseif not is_in_fov and location.in_fov_mp > 0 then
								location.in_fov_mp = math.max(0, location.in_fov_mp - frametime*5.5)
							end

							in_fov_mp = (location.is_position_correct or location == rt.location_playback) and location.in_fov_mp or location.in_fov_mp * 0.5
						end

						if is_selected then
							rt.location_selected = location
						end

						local t_x, t_y, t_z = location.viewangles_target:unpack()
						local wx, wy, on_screen = world_to_screen_offscreen_rect(t_x, t_y, t_z, matrix, screen_width, screen_height, 40)

						if wx ~= nil then
							wx, wy = math.floor(wx+0.5), math.floor(wy+0.5)

							-- local _wx, _wy = wx, wy

							if on_screen and location.on_screen_mp < 1 then
								location.on_screen_mp = math.min(1, location.on_screen_mp + frametime*3.5)
							elseif not on_screen and location.on_screen_mp > 0 then
								location.on_screen_mp = math.max(0, location.on_screen_mp - frametime*4.5)
							end

							local visible_alpha = (0.5 + location.on_screen_mp * 0.5) * in_range_draw_mp

							local name = "»" .. location.name
							local description

							local title_width, title_height = renderer.measure_text("bd", name)
							local description_width, description_height = 0, 0

							if location.description ~= nil then
								description = location.description:upper():gsub(" ", "  ")
								description_width, description_height = renderer.measure_text("d-", description .. " ")
								description_width = description_width
							end
							local extra_target_width = math.floor(description_height/2)
							extra_target_width = extra_target_width - extra_target_width % 2

							local full_width, full_height = math.max(title_width, description_width), title_height+description_height

							local r_m, g_m, b_m = r_m, g_m, b_m

							if location.editing then
								r_m, g_m, b_m = unpack(CLR_TEXT_EDIT)
							end

							local circle_size = math.floor(title_height / 2 - 1) * 2
							local target_size = 0
							if location.on_screen_mp > 0 then
								target_size = math.floor((circle_size + 8*dpi_scale) * location.on_screen_mp) + extra_target_width

								full_width = full_width + target_size
							end

							wx, wy = wx-circle_size/2-extra_target_width/2, wy-full_height/2

							local wx_topleft = math.min(wx, screen_width-40-full_width)
							local wy_topleft = wy

							local background_mp = easing.sine_out(visible_alpha, 0, 1, 1)

							renderer.rectangle(wx_topleft-2, wy_topleft-2, full_width+4, full_height+4, 16, 16, 16, 150*background_mp)
							rectangle_outline(wx_topleft-3, wy_topleft-3, full_width+6, full_height+6, 16, 16, 16, 170*background_mp)
							rectangle_outline(wx_topleft-4, wy_topleft-4, full_width+8, full_height+8, 16, 16, 16, 195*background_mp)
							rectangle_outline(wx_topleft-5, wy_topleft-5, full_width+10, full_height+10, 16, 16, 16, 40*background_mp)

							if not on_screen then
								local triangle_alpha = 1 - location.on_screen_mp

								if triangle_alpha > 0 then
									local cx, cy = screen_width/2, screen_height/2

									local angle = math.atan2(wy_topleft+full_height/2-cy, wx_topleft+full_width/2-cx)
									local triangle_angle = angle+math.rad(90)
									local offset_x, offset_y = vector2_rotate(triangle_angle, 0, -screen_height/2+100)

									local tx, ty = screen_width/2+offset_x, screen_height/2+offset_y

									local dist_triangle_text = vector2_dist(tx, ty, wx_topleft+full_width/2, wy_topleft+full_height/2)
									local dist_center_triangle = vector2_dist(tx, ty, cx, cy)
									local dist_center_text = vector2_dist(cx, cy, wx_topleft+full_width/2, wy_topleft+full_height/2)

									local a_mp_dist = 1
									if 40 > dist_triangle_text then
										a_mp_dist = (dist_triangle_text-30)/10
									end

									if dist_center_text > dist_center_triangle and a_mp_dist > 0 then
										local height = math.floor(title_height*1.5)

										local realtime_alpha_mp = 0.2 + math.abs(math.sin(globals.realtime()*math.pi*0.8 + i * 0.1)) * 0.8

										triangle_rotated(tx, ty, height*1.66, height, triangle_angle, r_m, g_m, b_m, a_m*math.min(1, visible_alpha*1.5)*triangle_alpha*a_mp_dist*realtime_alpha_mp)
										-- renderer.text(screen_width/2+offset_x, screen_height/2+offset_y, 255, 255, 255, 255, "c", 0, triangle_alpha)
									end
								end
							end

							if location.on_screen_mp > 0.5 and in_range_draw_mp > 0 then
								local c_a = 255*1*in_range_draw_mp*easing.expo_in(location.on_screen_mp, 0, 1, 1)
								local red_r, red_g, red_b = 255, 10, 10
								local green_r, green_g, green_b = 20, 236, 0
								local white_r, white_g, white_b = 140, 140, 140

								local sel_r, sel_g, sel_b = lerp_color(red_r, red_g, red_b, 0, green_r, green_g, green_b, 0, in_fov_mp)

								local c_r, c_g, c_b = lerp_color(white_r, white_g, white_b, 0, sel_r, sel_g, sel_b, 0, in_fov_select_mp)

								local c_x, c_y = wx+circle_size/2 + extra_target_width/2, wy+full_height/2
								local c_radius = circle_size/2

								-- outline
								renderer.circle_outline(c_x, c_y, 16, 16, 16, c_a*0.6, c_radius+1, 0, 1, 2)

								-- circle
								renderer.circle(c_x, c_y, c_r, c_g, c_b, c_a, c_radius, 0, 1)

								-- gradient (kind of)
								renderer.circle_outline(c_x, c_y, 16, 16, 16, c_a*0.3, c_radius+1, 0, 1, 2)
								renderer.circle_outline(c_x, c_y, 16, 16, 16, c_a*0.2, c_radius, 0, 1, 2)
								renderer.circle_outline(c_x, c_y, 16, 16, 16, c_a*0.1, c_radius-1, 0, 1, 2)

								-- -- crosshair
								-- renderer.rectangle(wx-1, wy-5, 2, 10, 0, 0, 0, 120*in_fov_select_mp)
								-- renderer.rectangle(wx-5, wy-1, 4, 2, 0, 0, 0, 120*in_fov_select_mp)
								-- renderer.rectangle(wx+1, wy-1, 4, 2, 0, 0, 0, 120*in_fov_select_mp)
							end

							if target_size > 1 then
								renderer.rectangle(wx_topleft+target_size-4*dpi_scale, wy_topleft+1, 1, full_height-1, r_m, g_m, b_m, a_m*visible_alpha*location.on_screen_mp)
							end

							renderer.text(wx_topleft+target_size, wy, r_m, g_m, b_m, a_m*visible_alpha, "bd", 0, name)

							if description ~= nil then
								renderer.text(wx_topleft+target_size, wy+title_height, math.min(255, r_m*1.2), math.min(255, g_m*1.2), math.min(255, b_m*1.2), a_m*visible_alpha*0.92, "-d", 0, description)
							end

							-- renderer.rectangle(_wx-2, _wy-2, 4, 4, 255, 255, 255, 255)
						end
					end
				end
			end
		end

	end
end

local function cmd_remove_user_input(cmd)
	cmd.in_forward = 0
	cmd.in_back = 0
	cmd.in_moveleft = 0
	cmd.in_moveright = 0

	cmd.forwardmove = 0
	cmd.sidemove = 0

	cmd.in_jump = 0
	cmd.in_speed = 0
	cmd.in_duck = 0
end

-- local i = 0
-- client.set_event_callback("setup_command", function(cmd)
-- 	if cmd.in_jump == 1 then
-- 		local origin = vector(entity.get_prop(entity.get_local_player(), "m_vecAbsOrigin"))
-- 		print(i, " ", origin.z)

-- 		i = i + 1
-- 	else
-- 		i = 0
-- 	end
-- end)

local function cmd_location_playback_grenade(cmd, local_player, weapon)
	local tickrate = 1/globals.tickinterval()
	local tickrate_mp = rt.location_playback.tickrates[tickrate]

	if pb.state == nil then
		pb.state = pb.PREPARE
		table_clear(pb.data)

		local begin = pb.begin

		client.delay_call((rt.location_playback.run_duration or 0)*tickrate_mp*2+2, function()
			if rt.location_playback ~= nil and pb.begin == begin then
				client.error_log("[helper] playback timed out")

				rt.location_playback = nil
				restore_disabled()
			end
		end)
	end

	if weapon ~= pb.weapon and pb.state ~= pb.FINISHED then
		rt.location_playback = nil

		restore_disabled()

		return
	end

	if pb.state ~= pb.FINISHED then
		cmd_remove_user_input(cmd)

		cmd.in_duck = rt.location_playback.duckamount == 1 and 1 or 0
		cmd.move_yaw = rt.location_playback.run_yaw
	elseif pb.sensitivity_set then
		cvar.sensitivity:set_raw_float(tonumber(cvar.sensitivity:get_string()))
		pb.sensitivity_set = nil
	end

	if pb.state == pb.PREPARE or pb.state == pb.RUN or pb.state == pb.THROWN then
		if rt.location_playback.throw_strength == 1 then
			cmd.in_attack = 1
			cmd.in_attack2 = 0
		elseif rt.location_playback.throw_strength == 0.5 then
			cmd.in_attack = 1
			cmd.in_attack2 = 1
		elseif rt.location_playback.throw_strength == 0 then
			cmd.in_attack = 0
			cmd.in_attack2 = 1
		end
	end

	if pb.state == pb.PREPARE and entity.get_prop(weapon, "m_flThrowStrength") == rt.location_playback.throw_strength then
		pb.state = pb.RUN
		pb.data.start_at = cmd.command_number
	end

	if pb.state == pb.RUN or pb.state == pb.THROW or pb.state == pb.THROWN then
		local step = cmd.command_number-pb.data.start_at

		if rt.location_playback.run_duration ~= nil and step < rt.location_playback.run_duration*tickrate_mp then
		elseif pb.state == pb.RUN then
			pb.state = pb.THROW
		end

		if rt.location_playback.run_duration ~= nil then
			cmd.forwardmove = 450
			cmd.in_forward = 1
			cmd.in_speed = rt.location_playback.run_speed and 1 or 0

			if ui.get(refs.aa_enabled) and ui.get(refs.aa_pitch) ~= "Off" then
				pb.waterlevel_prev = entity.get_prop(local_player, "m_nWaterLevel")
				entity.set_prop(local_player, "m_nWaterLevel", 2)

				pb.movetype_prev = entity.get_prop(local_player, "m_MoveType")
				entity.set_prop(local_player, "m_MoveType", 1)
			end
		end
	end

	if pb.state == pb.THROW then
		if rt.location_playback.jump then
			cmd.in_jump = 1
		end

		pb.state = pb.THROWN
		pb.data.throw_at = cmd.command_number
	end

	if pb.state == pb.THROWN then
		if cmd.command_number - pb.data.throw_at >= rt.location_playback.delay then
			cmd.in_attack = 0
			cmd.in_attack2 = 0
		end
	end

	if pb.state == pb.FINISHED then
		if rt.location_playback.jump then
			local onground = bit.band(entity.get_prop(local_player, "m_fFlags"), FL_ONGROUND) == FL_ONGROUND

			if onground then
				-- print("was onground at ", globals.tickcount())
				pb.state = nil
				rt.location_playback = nil

				restore_disabled()
			else
				if cmd.in_forward == 0 and cmd.in_back == 0 and cmd.in_moveleft == 0 and cmd.in_moveright == 0 and cmd.in_jump == 0 then
					cmd_remove_user_input(cmd)

					cmd.move_yaw = rt.location_playback.recovery_yaw or rt.location_playback.run_yaw-180
					cmd.forwardmove = 450
					cmd.in_forward = 1
					cmd.in_jump = rt.location_playback.recovery_jump and 1 or 0
				end

				if pb.ui_restore[refs.airstrafe] then
					pb.ui_restore[refs.airstrafe] = nil

					client.delay_call(cvar.sv_airaccelerate:get_float() > 50 and 0 or 0.05, ui.set, refs.airstrafe, true)
				end
			end
		elseif rt.location_playback.recovery_yaw ~= nil then
			if cmd.in_forward == 0 and cmd.in_back == 0 and cmd.in_moveleft == 0 and cmd.in_moveright == 0 and cmd.in_jump == 0 then
				if pb.data.recovery_start_at == nil then
					pb.data.recovery_start_at = cmd.command_number
				end

				local recovery_duration = math.min(32, rt.location_playback.run_duration or 16) + 13 + (rt.location_playback.recovery_jump and 10 or 0)

				if pb.data.recovery_start_at+recovery_duration >= cmd.command_number then
					cmd.move_yaw = rt.location_playback.recovery_yaw
					cmd.forwardmove = 450
					cmd.in_forward = 1
					cmd.in_jump = rt.location_playback.recovery_jump and 1 or 0
				end
			else
				rt.location_playback = nil

				restore_disabled()
			end
		end
	end

	if pb.state == pb.THROWN then
		if rt.location_playback.jump and ui.get(refs.airstrafe) then
			pb.ui_restore[refs.airstrafe] = true
			--ui.set(refs.airstrafe, false)
		end

		if ui.get(refs.auto_release) then
			pb.ui_restore[refs.auto_release] = true
			ui.set(refs.auto_release, false)
		end

		if ui.get(refs.easy_strafe) then
			pb.ui_restore[refs.easy_strafe] = true
			ui.set(refs.easy_strafe, false)
		end

		if ui.get(refs.avoid_collisions) then
			pb.ui_restore[refs.avoid_collisions] = true
			ui.set(refs.avoid_collisions, false)
		end

		if ui.get(refs.air_duck) ~= "Off" then
			pb.ui_restore[refs.air_duck] = ui.get(refs.air_duck)
			ui.set(refs.air_duck, "Off")
		end

		if ui.get(refs.supertoss) then
			pb.ui_restore[refs.supertoss] = true
			ui.set(refs.supertoss, false)
		end

		if is_grenade_being_thrown(weapon, cmd) then
			pb.data.thrown_at = cmd.command_number

			cmd.pitch = rt.location_playback.viewangles.pitch
			cmd.yaw = rt.location_playback.viewangles.yaw
			cmd.allow_send_packet = false

			client.delay_call(0.8, restore_disabled)
		elseif entity.get_prop(weapon, "m_fThrowTime") == 0 and pb.data.thrown_at ~= nil and pb.data.thrown_at > pb.data.throw_at then
			pb.state = pb.FINISHED

			local begin = pb.begin
			client.delay_call(0.6, function()
				if pb.state == pb.FINISHED and pb.begin == begin then
					rt.location_playback = nil
					restore_disabled()
				end
			end)
		end
	end
end

local function apply_movement_playback_preamble(cmd)
	ui_set_restore(refs.air_duck, "Off")
	ui_set_restore(refs.airstrafe, true)
	ui_set_restore(refs.easy_strafe, true)
	ui_set_restore(refs.jump_at_edge, false)
	ui_set_restore(refs.slow_motion, false)
end

local function movement_playback_finish()
	rt.location_playback = nil
	pb.data.frames = nil
	pb.data.start_at = nil
	pb.data.is_attack = nil
	pb.data.playback_begin = nil
	pb.data.last_offset = nil
	pb.data.last_offset_swap = nil
	pb.data.set_pitch = nil
	restore_disabled()
end

local function movement_apply_viewangles(cmd, local_player, pitch, yaw, force_recorded_angles)
	if force_recorded_angles then
		cmd.pitch = pitch
		cmd.yaw = yaw
		return
	end

	local weapon_ent = entity.get_player_weapon(local_player)
	local weapon = weapon_ent ~= nil and weapons[entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")] or nil
	weapon = WEAPON_ALIASES[weapon] or weapon

	if weapon ~= nil and weapon.type == "grenade" then
		cmd.pitch = pitch
		cmd.yaw = yaw
		return
	end

	local aa_enabled = ui.get(refs.aa_enabled) and ui.get(refs.aa_pitch) ~= "Off"

	if not aa_enabled then
		cmd.pitch = pitch
		cmd.yaw = yaw
		return
	end

	local onground = bit.band(entity.get_prop(local_player, "m_fFlags"), FL_ONGROUND) == FL_ONGROUND

	if cmd.in_jump == 1 or not onground then
		return
	end

	pb.waterlevel_prev = entity.get_prop(local_player, "m_nWaterLevel")
	entity.set_prop(local_player, "m_nWaterLevel", 2)

	pb.movetype_prev = entity.get_prop(local_player, "m_MoveType")
	entity.set_prop(local_player, "m_MoveType", 1)
end

local function movement_decompress_frames(location)
	if pb.data.frames ~= nil then
		return pb.data.frames
	end

	local raw_frames = location.movement.frames
	if type(raw_frames) ~= "table" then
		return nil
	end

	local expanded = {}
	for i = 1, #raw_frames do
		local frame = raw_frames[i]

		if type(frame) == "number" then
			if frame > 0 then
				for _ = 1, frame do
					table.insert(expanded, {})
				end
			end
		elseif type(frame) == "table" then
			table.insert(expanded, frame)
		end
	end

	local current = {
		viewangles = {
			pitch = location.viewangles.pitch,
			yaw = location.viewangles.yaw,
		},
		buttons = {},
	}

	for key, _ in pairs(MOVEMENT_BUTTONS_CHARS) do
		current.buttons[key] = false
	end

	local frames = {}

	for i = 1, #expanded do
		local value = expanded[i]
		local pitch, yaw, buttons, forwardmove, sidemove = unpack(value)

		current.viewangles.pitch = current.viewangles.pitch + (pitch or 0)
		current.viewangles.yaw = current.viewangles.yaw + (yaw or 0)

		if type(buttons) == "string" then
			local buttons_down, buttons_up = parse_buttons_str(buttons)

			for j = 1, #buttons_down do
				local btn = buttons_down[j]
				if btn ~= false then
					current.buttons[btn] = true
				end
			end

			for j = 1, #buttons_up do
				local btn = buttons_up[j]
				if btn ~= false then
					current.buttons[btn] = false
				end
			end
		end

		if type(forwardmove) == "number" and forwardmove >= -450 and forwardmove <= 450 then
			current.forwardmove = forwardmove
		else
			current.forwardmove = current.buttons.in_forward and 450 or current.buttons.in_back and -450 or 0
		end

		if type(sidemove) == "number" and sidemove >= -450 and sidemove <= 450 then
			current.sidemove = sidemove
		else
			current.sidemove = current.buttons.in_moveright and 450 or current.buttons.in_moveleft and -450 or 0
		end

		frames[i] = {
			pitch = current.viewangles.pitch,
			yaw = current.viewangles.yaw,
			move_yaw = current.viewangles.yaw,
			forwardmove = current.forwardmove,
			sidemove = current.sidemove,
		}

		for btn, btn_value in pairs(current.buttons) do
			frames[i][btn] = btn_value
		end
	end

	pb.data.frames = frames
	return frames
end

local function movement_playback_v509(cmd, location, local_player)
	if pb.data.start_at == nil then
		pb.data.start_at = cmd.command_number
	end

	local frames = movement_decompress_frames(location)
	local frame = frames ~= nil and frames[cmd.command_number - pb.data.start_at + 1] or nil

	if frame == nil then
		movement_playback_finish()
		return
	end

	cmd_remove_user_input(cmd)

	cmd.move_yaw = frame.move_yaw
	cmd.forwardmove = frame.forwardmove
	cmd.sidemove = frame.sidemove
	cmd.in_attack = frame.in_attack and 1 or 0
	cmd.in_attack2 = frame.in_attack2 and 1 or 0
	cmd.in_speed = frame.in_speed and 1 or 0
	cmd.in_duck = frame.in_duck and 1 or 0
	cmd.in_use = frame.in_use and 1 or 0
	cmd.in_jump = frame.in_jump and 1 or 0

	local movement_weapon = location.weapons and location.weapons[1] or nil
	local force_recorded_angles = movement_weapon ~= nil and movement_weapon.type == "grenade"

	movement_apply_viewangles(cmd, local_player, frame.pitch, frame.yaw, force_recorded_angles)
end

local function movement_playback_v510(cmd, location, local_player)
	if pb.data.start_at == nil then
		pb.data.start_at = cmd.command_number
	end

	local steps = location.movement.steps or location.movement_steps

	if steps == nil then
		movement_playback_finish()
		return
	end

	local step = steps[cmd.command_number - pb.data.start_at + 1]

	if step == nil then
		movement_playback_finish()
		return
	end

	cmd_remove_user_input(cmd)

	ui_set_restore(refs.air_duck, "Off")

	if pb.ui_restore[refs.airstrafe] ~= nil then
		--ui.set(refs.airstrafe, pb.ui_restore[refs.airstrafe])
	end

	ui_set_restore(refs.easy_strafe, true)
	ui_set_restore(refs.jump_at_edge, false)

	local strafer = location.strafer
	if strafer ~= nil then
		if strafer.quick_stop ~= nil then
			ui_set_restore(refs.standalone_quick_stop, strafer.quick_stop)
		end

		if strafer.air_strafe ~= nil then
			--ui_set_restore(refs.airstrafe, strafer.air_strafe)
		end

		if strafer.wasd_strafer ~= nil then
			ui_set_restore(refs.air_strafe_direction, strafer.wasd_strafer)
		end

		if strafer.strafer_smoothing ~= nil then
			ui_set_restore(refs.air_strafe_smoothing, strafer.strafer_smoothing)
		end
	end

	local viewangles = step.viewangles or {}
	local pitch, yaw = viewangles[1] or 0, viewangles[2] or 0

	cmd.move_yaw = step.move_yaw

	if step.forwardmove then
		cmd.forwardmove = step.forwardmove
	end

	if step.sidemove then
		cmd.sidemove = step.sidemove
	end

	local buttons = step.buttons or {}
	local movement_weapon = location.weapons and location.weapons[1] or nil
	local grenade_movement = movement_weapon ~= nil and movement_weapon.type == "grenade"

	if cmd.in_attack == 1 or cmd.in_attack2 == 1 or buttons.in_attack or buttons.in_attack2 then
		pb.data.is_attack = true
	end

	if grenade_movement then
		cmd.in_attack = buttons.in_attack and 1 or 0
		cmd.in_attack2 = buttons.in_attack2 and 1 or 0
	elseif pb.data.is_attack then
		cmd.in_attack = buttons.in_attack and 1 or 0
		cmd.in_attack2 = buttons.in_attack2 and 1 or 0
	end

	cmd.in_forward = buttons.in_forward and 1 or 0
	cmd.in_moveleft = buttons.in_moveleft and 1 or 0
	cmd.in_moveright = buttons.in_moveright and 1 or 0
	cmd.in_back = buttons.in_back and 1 or 0
	cmd.in_speed = buttons.in_speed and 1 or 0
	cmd.in_duck = buttons.in_duck and 1 or 0
	cmd.in_use = buttons.in_use and 1 or 0
	cmd.in_jump = buttons.in_jump and 1 or 0

	movement_apply_viewangles(cmd, local_player, pitch, yaw, grenade_movement)
end

local function movement_playback_v512(cmd, location, local_player)
	apply_movement_playback_preamble(cmd)

	if location.movement.frames ~= nil then
		movement_playback_v509(cmd, location, local_player)
	else
		movement_playback_v510(cmd, location, local_player)
	end
end

local function cmd_location_playback_movement(cmd, local_player, weapon)
	local location = rt.location_playback

	if location == nil or location.movement == nil then
		return
	end

	if pb.data.playback_begin ~= pb.begin then
		pb.data.playback_begin = pb.begin
		pb.data.frames = nil
		pb.data.start_at = nil
		pb.data.is_attack = nil
		pb.data.last_offset = nil
		pb.data.last_offset_swap = 0
		pb.data.set_pitch = nil
	end

	movement_playback_v512(cmd, location, local_player)
end

local function cmd_location_playback(cmd, local_player, weapon)
	if rt.location_playback.type == "grenade" then
		cmd_location_playback_grenade(cmd, local_player, weapon)
	elseif rt.location_playback.type == "movement" then
		cmd_location_playback_movement(cmd, local_player, weapon)
	end
end

local function on_run_command(e)
	if pb.movetype_prev ~= nil or pb.waterlevel_prev ~= nil then
		local local_player = entity.get_local_player()

		if pb.waterlevel_prev ~= nil then
			entity.set_prop(local_player, "m_nWaterLevel", pb.waterlevel_prev)
			pb.waterlevel_prev = false
		end

		if pb.movetype_prev ~= nil then
			entity.set_prop(local_player, "m_MoveType", pb.movetype_prev)
			pb.movetype_prev = nil
		end
	end

end

local function on_setup_command(cmd)
	ui.set(refs.faster_grenade_toss, true)

	local local_player = entity.get_local_player()
	local local_origin = vector(entity.get_prop(local_player, "m_vecAbsOrigin"))
	local hotkey = ui.get(refs.hotkey)
	local weapon = entity.get_player_weapon(local_player)

	if rt.location_playback ~= nil then
		ui.set(refs.faster_grenade_toss, false)

		cmd_location_playback(cmd, local_player, weapon)
	elseif rt.location_selected ~= nil and hotkey and rt.location_selected.is_in_fov and rt.location_selected.is_position_correct then
		local speed = vector(entity.get_prop(local_player, "m_vecAbsVelocity")):length()
		local pin_pulled = entity.get_prop(weapon, "m_bPinPulled") == 1

		if rt.location_selected.duckamount == 1 or rt.location_set_closest.has_only_duck then
			cmd.in_duck = 1
		end

		ui.set(refs.faster_grenade_toss, false)

		local is_grenade = rt.location_selected.weapons[1].type == "grenade"
		local is_in_attack = cmd.in_attack == 1 or cmd.in_attack2 == 1
		local duck_matches = rt.location_selected.duckamount == entity.get_prop(local_player, "m_flDuckAmount")
		local can_start = (
			(rt.location_selected.type == "movement" and speed < 2 and (is_in_attack or pin_pulled))
			or (rt.location_selected.type == "grenade" and pin_pulled and is_in_attack and speed < 2)
		) and duck_matches

		local started_playback = false

		if can_start then
			rt.location_playback = rt.location_selected
			pb.state = nil
			pb.weapon = weapon
			pb.begin = cmd.command_number

			if rt.location_selected.type == "movement" then
				cmd.in_attack = 0
				cmd.in_attack2 = 0
			end
			cmd_location_playback(cmd, local_player, weapon)
			started_playback = true
		elseif not pin_pulled and (cmd.in_attack == 1 or cmd.in_attack2 == 1) then
			if rt.location_selected.throw_strength == 1 then
				cmd.in_attack = 1
				cmd.in_attack2 = 0
			elseif rt.location_selected.throw_strength == 0.5 then
				cmd.in_attack = 1
				cmd.in_attack2 = 1
			elseif rt.location_selected.throw_strength == 0 then
				cmd.in_attack = 0
				cmd.in_attack2 = 1
			end
		end

		if not started_playback and rt.location_selected.weapon ~= "weapon_wallbang" and rt.location_selected.movement ~= nil and (cmd.in_attack == 1 or cmd.in_attack2 == 1) then
			cmd.in_attack = 0
			cmd.in_attack2 = 0
		end
	elseif rt.location_set_closest ~= nil and hotkey then
		local target_position = (rt.location_selected ~= nil and rt.location_selected.is_in_fov) and rt.location_selected.position or rt.location_set_closest.position_approach
		local distance = local_origin:dist(target_position)
		local distance_2d = local_origin:dist2d(target_position)

		if (distance_2d < 0.5 and distance > 0.08 and distance < 5) or (rt.location_set_closest.inaccurate_position and distance < 40) then
			distance = distance_2d
		end

		if ((rt.location_selected ~= nil and rt.location_selected.duckamount == 1) or rt.location_set_closest.has_only_duck) and distance < 10 then
			cmd.in_duck = 1
		end

		local vel = vector(entity.get_prop(local_player, "m_vecAbsVelocity")):length2d()
		local onground = bit.band(entity.get_prop(local_player, "m_fFlags"), FL_ONGROUND) == FL_ONGROUND
		local on_ladder = entity.get_prop(local_player, "m_MoveType") == 9
		local has_user_input = cmd.in_forward == 1 or cmd.in_back == 1 or cmd.in_moveleft == 1 or cmd.in_moveright == 1 or cmd.in_jump == 1 or (not on_ladder and not onground)

		if not has_user_input then
			if distance < 32 and distance >= limits.CORRECT*0.5 then
				local fwd1 = target_position - local_origin

				local pos1 = target_position + fwd1:normalized()*10

				local fwd = pos1 - local_origin
				local pitch, yaw = fwd:angles()

				if yaw == nil then
					return
				end

				cmd.move_yaw = yaw
				cmd.in_speed = 0

				cmd.in_moveleft, cmd.in_moveright = 0, 0
				cmd.sidemove = 0

				if on_ladder then
					local delta_z = target_position.z - local_origin.z
					local delta_y = target_position.y - local_origin.y
					local move_z = delta_z > 0.5 or delta_z < -0.5
					local move_y = delta_y > 0.5 or delta_y < -0.5

					if move_z then
						cmd.buttons = delta_z > 0 and bit.bor(cmd.buttons or 0, 8) or bit.bor(cmd.buttons or 0, 16)
					end

					if move_y then
						cmd.buttons = delta_y > 0 and bit.bor(cmd.buttons or 0, 512) or bit.bor(cmd.buttons or 0, 1024)
					end

					if move_z or move_y then
						cmd.in_speed = 1
						cmd.in_duck = 1
					end
				else
					if distance > 14 then
						cmd.forwardmove = 450
					else
						local wishspeed = math.min(450, math.max(1.1+entity.get_prop(local_player, "m_flDuckAmount")*10, distance * 9))
						if vel >= math.min(250, wishspeed)+15 then
							cmd.forwardmove = 0
							cmd.in_forward = 0
						else
							cmd.forwardmove = math.max(6, vel >= math.min(250, wishspeed) and wishspeed*0.9 or wishspeed)
							cmd.in_forward = 1

							if distance < 1 then
								ui_set_restore(refs.standalone_quick_stop, false)
							end
						end
					end
				end
			end
		end
	end

	if ui.get(refs.disable_doubletap) then
		local using_helper = ui.get(refs.hotkey) and (
			rt.location_playback ~= nil
			or rt.location_selected ~= nil
			or rt.location_set_closest ~= nil
		)

		if using_helper then
			if pb.ui_restore[refs.doubletap] == nil then
				pb.ui_restore[refs.doubletap] = ui.get(refs.doubletap)
			end

			if ui.get(refs.doubletap) then
				ui.set(refs.doubletap, false)
			end
		elseif pb.ui_restore[refs.doubletap] ~= nil and rt.location_playback == nil then
			ui.set(refs.doubletap, pb.ui_restore[refs.doubletap])
			pb.ui_restore[refs.doubletap] = nil
		end
	elseif pb.ui_restore[refs.doubletap] ~= nil and rt.location_playback == nil then
		ui.set(refs.doubletap, pb.ui_restore[refs.doubletap])
		pb.ui_restore[refs.doubletap] = nil
	end
end

local function on_console_input(text)
	-- if not src.editing then
	-- 	return
	-- end

	if text == "helper" or text:match("^helper .*$") then
		if not ui.get(sources_list_ui.title) then
			return
		end

		local log_help = false
		if text:match("^helper map_pattern%s*") then
			if globals.mapname() ~= nil then
				client.log("Raw map name: ", globals.mapname())
				client.log("Resolved map name: ", get_mapname())
				client.log("Map pattern: ", get_map_pattern())
			else
				client.error_log("You need to be in-game to use this command")
			end
		elseif text == "helper" or text:match("^helper %s*$") or text:match("^helper help%s*$") or text:match("^helper %?%s*$") then
			client.log("Helper console command system")
			log_help = true
		elseif text:match("^helper source stats%s*") then
			if type(src.selected) == "table" then
				local all_locations = src.selected:get_all_locations()
				local maps = {}
				for map, map_spots in pairs(all_locations) do
					table.insert(maps, map)
				end
				table.sort(maps)

				local rows = {}
				local headings = {"MAP", "Smoke", "Flash", "Molotov", "HE Grenade", "Movement", "Location", "Area", " TOTAL "}
				local total_row = {"TOTAL", 0, 0, 0, 0, 0, 0, 0, 0}

				for i=1, #maps do
					local row = {maps[i], 0, 0, 0, 0, 0, 0, 0, 0}
					local map_locations = all_locations[maps[i]]
					for i=1, #rt.map_locations do
						local location = rt.map_locations[i]
						local index = 7

						if location.type == "grenade" then
							for i=1, #location.weapons do
								local weapon = location.weapons[i]
								if weapon.console_name == "weapon_smokegrenade" then
									index = 2
								elseif weapon.console_name == "weapon_flashbang" then
									index = 3
								elseif weapon.console_name == "weapon_molotov" then
									index = 4
								elseif weapon.console_name == "weapon_hegrenade" then
									index = 5
								end
							end
						elseif location.type == "movement" then
							index = 6
						elseif location.type == "location" then
							index = 7
						elseif location.type == "area" then
							index = 8
						end

						row[index] = row[index] + 1
						total_row[index] = total_row[index] + 1
						row[9] = row[9] + 1
						total_row[9] = total_row[9] + 1
					end

					table.insert(rows, row)
				end

				table.insert(rows, {})
				table.insert(rows, total_row)

				for i=#total_row, 2, -1 do
					if total_row[i] == 0 then
						table.remove(headings, i)
						for j=1, #rows do
							table.remove(rows[j], i)
						end
					end
				end

				local tbl_result = table_gen(rows, headings, {style="Unicode"})
				-- client.log("Locations loaded:")
				-- for s in tbl_result:gmatch("[^\r\n]+") do
				-- 	client_color_log(210, 210, 210, s)
				-- end

				client.log("Statistics for ", src.selected.name, src.selected.description ~= nil and string.format(" - %s", src.selected.description) or "", ": \n", tbl_result, "\n")
			else
				client.error_log("No source selected")
			end
		elseif text:match("^helper source export_repo%s*") then
			if type(src.selected) == "table" then
				if src.selected.type == "local" then
					client.error_log("Not yet implemented")
				else
					client.error_log("You can only export a local source")
				end
			else
				client.error_log("No source selected")
			end
		elseif text:match("^helper source%s*$") then
			if type(src.selected) == "table" then
				print("Selected source: ", src.selected.name, " (", src.selected.type, ")")
				print("Description: ", tostring(src.selected.description))
				print("Last updated: ", src.selected.update_timestamp and string.format("%s (unix ts: %s)", format_unix_timestamp(src.selected.update_timestamp, false, false, 1), src.selected.update_timestamp) or "Not set")
			else
				client.error_log("No source selected")
			end
		else
			client.error_log("Unknown helper command: " .. text:gsub("^helper ", ""))
			log_help = true
		end

		if log_help then
			local commands = {
				{"help", "Displays this help info"},
				{"map_pattern", "Displays map pattern debug info"},
				{"source", "Displays information about the current source"},
				{"source stats", "Displays statistics for the currently selected source"},
				{"source export_repo", "Exports a local source into a repository file structure"}
			}

			local text = "\tKnown commands:"
			for i=1, #commands do
				local command, help = unpack(commands[i])
				text = text .. string.format("\n\thelper %s - %s", command, help)
			end

			client.color_log(215, 215, 215, text)
		end

		return true
	end
end

local function update_basic_ui()
	local enabled = ui.get(refs.enabled)
	if enabled then
		client.set_event_callback("paint", on_paint)
		client.set_event_callback("setup_command", on_setup_command)
		client.set_event_callback("run_command", on_run_command)
		client.set_event_callback("console_input", on_console_input)
	else
		client.unset_event_callback("paint", on_paint)
		client.unset_event_callback("setup_command", on_setup_command)
		client.unset_event_callback("run_command", on_run_command)
		client.unset_event_callback("console_input", on_console_input)
		ui.set(refs.faster_grenade_toss, true)
	end

	ui.set_visible(refs.types, enabled)
	ui.set_visible(refs.hide_duplicates, enabled)
	ui.set_visible(refs.disable_doubletap, enabled)
	ui.set_visible(refs.color, enabled)
	ui.set_visible(refs.behind_walls, enabled)
	ui.set_visible(sources_list_ui.title, enabled)

	update_sources_ui()
end

ui.set(refs.disable_doubletap, true)
ui.set_callback(refs.enabled, update_basic_ui)
update_basic_ui()

client.set_event_callback("setup_command", function(cmd)
	process_movement_record_hotkey(cmd)
end)

client.set_event_callback("level_init", function()
	src.selected = nil

	src.editing = false
	edit.selected = nil

	table_clear(src.editing_modified)
	table_clear(src.editing_has_changed)

	update_sources_ui()
	flush_active_locations()

	if DEBUG and DEBUG.create_map_patterns then
		local mapname = globals.mapname()
		local pattern = get_map_pattern()

		DEBUG.debug_text = "create_map_patterns progress: " .. DEBUG.create_map_patterns_index[globals.mapname()] .. " / " .. DEBUG.create_map_patterns_count

		if pattern ~= nil then
			if MAP_PATTERNS[pattern] ~= nil then
				local text = "collision: " .. mapname .. " has the same pattern as " .. MAP_PATTERNS[pattern]
				DEBUG.debug_text = text
				error(text)
				return
			end

			print("created pattern for ", mapname, ": ", tostring(pattern))

			MAP_PATTERNS[pattern] = mapname

			-- if mapname == "de_aztec" then
			-- 	client.log("landed on aztec")
			-- 	print(DEBUG.inspect(MAP_PATTERNS))
			-- 	return
			-- end

			if DEBUG.create_map_patterns_next[mapname] ~= nil then
				client.log("If you can read this, the map ", DEBUG.create_map_patterns_next[mapname], " failed to load")
				client.delay_call(2, client.exec, "map ", DEBUG.create_map_patterns_next[mapname])
			else
				DEBUG.debug_text = "DONE!"
				client.log("Done!")
				client.log(DEBUG.inspect(MAP_PATTERNS))
				client.log("failed: ", DEBUG.inspect(DEBUG.create_map_patterns_failed))
				DEBUG.create_map_patterns = false
			end
		else
			table.insert(DEBUG.create_map_patterns_failed, mapname)
			client.error_log("failed to create pattern for ", mapname)

			DEBUG.debug_text = "failed to create pattern for " .. mapname
		end
	end
end)

client.set_event_callback("round_end", function()
	rt.location_playback = nil
	restore_disabled()
end)

client.set_event_callback("shutdown", function()
	for i=1, #db.sources do
		if db.sources[i].cleanup ~= nil then
			db.sources[i]:cleanup()
		end
	end

	restore_disabled()

	benchmark:start("db_write")
	database.write("helper", db)
	benchmark:finish("db_write")
end)

end