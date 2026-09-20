local ffi = require("ffi")
local fs = require("neverlose/file")

local filesystem = utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")
local filesystem_class = ffi.cast(ffi.typeof("void***"), filesystem)
local func_read_file = ffi.cast("int (__thiscall*)(void*, void*, int, void*)", filesystem_class[0][0])

local utilities
utilities = {
	read_file_bytes = function(file)
		local size = file:get_size()
		local output = ffi.new("int8_t[?]", size + 1)
		func_read_file(filesystem_class, output, size, file.handle)

		return output
	end,
	get_byte = function(bytes, idx)
		return bit.band(bytes[idx], 0xFF)
	end,
	get_bytes = function(bytes, idx, amt)
		local out, n = 0, 0
		for i = idx, idx + amt - 1 do
			local byte = utilities.get_byte(bytes, i)
			out = bit.bor(out, bit.lshift(byte, n))
			n = n + 8
		end
		return out
	end,
	get_bytes_table = function(bytes, idx, amt)
		local out = {}
		for i = idx, idx + amt - 1 do
			local byte = utilities.get_byte(bytes, i)
			table.insert(out, byte)
		end
		return out
	end,
	get_short = function(bytes, idx)
		local short = utilities.get_bytes(bytes, idx, 2)

		return tonumber(ffi.cast("uint16_t", short))
	end,
	get_int = function(bytes, idx)
		local dword = utilities.get_bytes(bytes, idx, 4)

		return tonumber(ffi.cast("int32_t", dword))
	end,
	get_uint = function(bytes, idx)
		local dword = utilities.get_int(bytes, idx)

		return tonumber(ffi.cast("uint32_t", dword))
	end,
	get_float = function(bytes, idx)
		local dword = utilities.get_int(bytes, idx)
		local intptr = ffi.new("int[1]", dword)
		local floatptr = ffi.new("float[1]", 0.0)
		ffi.copy(floatptr, intptr, 4)

		local float = floatptr[0]
		return tonumber(float)
	end,
	get_vector = function(bytes, idx)
		local x = utilities.get_float(bytes, idx)
		local y = utilities.get_float(bytes, idx + 4)
		local z = utilities.get_float(bytes, idx + 8)
		return vector(x, y, z)
	end,
	get_string = function(bytes, idx, length)
		local out = ""

		for i = idx, idx + length - 2 do -- -2 cuz of strings being \0 terminated
			local char = utilities.get_byte(bytes, i)
			out = out .. string.char(char)
		end

		return out
	end,
}

local function get_nav_path(map)
	return common.get_game_directory() .. "\\maps\\" .. map .. ".nav"
end

local function get_current_map_nav_path()
	local map_data = common.get_map_data()
	if map_data == nil then
		return nil
	end

	local name = map_data["shortname"]
	if name == nil then
		return nil
	end

	return get_nav_path(name)
end

local navfile_t = {
	has_unnamed_areas = false, -- bool
	is_analyzed = false,    -- bool

	place_count = 0,        -- ushort

	magic = 0,              -- uint32
	version = 0,            -- uint32
	sub_version = 0,        -- uint32
	save_bsp_file = 0,      -- uint32
	area_count = 0,         -- uint32

	place_names = {},       -- table<string>
	areas = {},             -- table<navarea_t>
}
do                          -- navfile_t
	function navfile_t:new(file_path)
		_self = {}
		setmetatable(_self, self)
		self.__index = self

		local file = fs.open(file_path, "rb")
		local bytes = utilities.read_file_bytes(file)
		local n = 0

		self.magic = utilities.get_uint(bytes, n)
		n = n + 4
		if self.magic ~= 0xFEEDFACE then
			error("File couldn't be verified.")

			return
		end

		self.version = utilities.get_uint(bytes, n)
		n = n + 4
		if self.version ~= 16 then
			error("File version isn't 16.")

			return
		end

		self.sub_version = utilities.get_uint(bytes, n)
		n = n + 4

		self.save_bsp_file = utilities.get_uint(bytes, n)
		n = n + 4

		self.is_analyzed = utilities.get_byte(bytes, n)
		n = n + 1

		self.place_count = utilities.get_short(bytes, n)
		n = n + 2
		for i = 1, self.place_count do
			local length = utilities.get_short(bytes, n)
			n = n + 2

			local name = utilities.get_string(bytes, n, length)
			n = n + length

			table.insert(self.place_names, name)
		end

		self.has_unnamed_areas = utilities.get_byte(bytes, n)
		n = n + 1

		self.area_count = utilities.get_uint(bytes, n)
		n = n + 4
		for i = 0, self.area_count - 1 do
			local area = {}

			area.id = utilities.get_uint(bytes, n)
			n = n + 4
			area.attribute_flags = utilities.get_uint(bytes, n)
			n = n + 4

			area.nw_corner = utilities.get_vector(bytes, n)
			n = n + 12
			area.se_corner = utilities.get_vector(bytes, n)
			n = n + 12

			area.center = (area.nw_corner + area.se_corner) / 2

			local corner_delta = area.se_corner - area.nw_corner
			if corner_delta.x > 0.0 and corner_delta.y > 0.0 then
				area.inv_dx_corners = 1.0 / corner_delta.x
				area.inv_dy_corners = 1.0 / corner_delta.y
			else
				area.inv_dx_corners = 0.0
				area.inv_dy_corners = 0.0
			end

			area.ne_z = utilities.get_float(bytes, n)
			n = n + 4
			area.sw_z = utilities.get_float(bytes, n)
			n = n + 4

			area.connections = {}
			for j = 0, 3 do
				local connection_count = utilities.get_uint(bytes, n)
				n = n + 4

				for j = 0, connection_count - 1 do
					local id = utilities.get_uint(bytes, n)
					n = n + 4
					if area.id ~= id then
						table.insert(area.connections, id)
					end
				end
			end

			area.hiding_spots = {}
			area.hiding_spot_count = utilities.get_byte(bytes, n)
			n = n + 1
			for j = 0, area.hiding_spot_count - 1 do
				local spot = {}

				spot.id = utilities.get_uint(bytes, n)
				n = n + 4
				spot.pos = utilities.get_vector(bytes, n)
				n = n + 12
				spot.flags = utilities.get_byte(bytes, n)
				n = n + 1

				table.insert(area.hiding_spots, spot)
			end

			area.spot_encounters = {}
			area.encounter_path_count = utilities.get_uint(bytes, n)
			n = n + 4
			for j = 0, area.encounter_path_count - 1 do
				local spot_encounter = {
					from = {},
					to = {},
					spot_order = {}
				}

				spot_encounter.from.id = utilities.get_uint(bytes, n)
				n = n + 4
				spot_encounter.from_direction = utilities.get_byte(bytes, n)
				n = n + 1

				spot_encounter.to.id = utilities.get_uint(bytes, n)
				n = n + 4
				spot_encounter.to_direction = utilities.get_byte(bytes, n)
				n = n + 1

				local spot_count = utilities.get_byte(bytes, n)
				n = n + 1

				for k = 0, spot_count - 1 do
					local spot_order = {}
					spot_order.id = utilities.get_uint(bytes, n)
					n = n + 4
					spot_order.t = utilities.get_byte(bytes, n) / 255
					n = n + 1

					table.insert(spot_encounter.spot_order, spot_order)
				end
				
				table.insert(area.spot_encounters, spot_encounter)
			end

			area.place = utilities.get_short(bytes, n) - 1
			n = n + 2

			for j = 0, 1 do
				local ladder_count = utilities.get_uint(bytes, n)
				n = n + 4

				area.ladder_connections = {
					[0] = {},
					[1] = {},
				}
				for k = 0, ladder_count - 1 do
					local ladder_connect = {}
					ladder_connect.id = utilities.get_uint(bytes, n)
					n = n + 4

					local skip = false
					for l = 1, #area.ladder_connections[j] do
						if area.ladder_connections[j][l] == ladder_connect.id then
							skip = true
							break
						end
					end

					if not skip then
						table.insert(area.ladder_connections[j], ladder_connect)
					end
				end
			end

			area.earliest_occupy_time = {}
			for j = 0, 1 do
				area.earliest_occupy_time[j] = utilities.get_float(bytes, n)
				n = n + 4
			end

			area.light_intensity = {}
			for j = 0, 3 do
				area.light_intensity[j] = utilities.get_float(bytes, n)
				n = n + 4
			end

			area.potentially_visible_areas = {}
			area.visible_area_count = utilities.get_uint(bytes, n)
			n = n + 4
			for j = 0, area.visible_area_count - 1 do
				local area_bind_info = {}

				area_bind_info.id = utilities.get_uint(bytes, n)
				n = n + 4
				area_bind_info.attributes = utilities.get_byte(bytes, n)
				n = n + 1

				table.insert(area.potentially_visible_areas, area_bind_info)
			end

			area.inherit_visibility_from = {}
			area.inherit_visibility_from.id = utilities.get_uint(bytes, n)
			n = n + 4

			area.unknown_count = utilities.get_byte(bytes, n)
			n = n + 1
			for j = 0, area.unknown_count - 1 do
				n = n + 0xE
			end

			table.insert(self.areas, area)
		end

		return _self
	end
end

return {
	parse_current_map_navfile = function()
		local path = get_current_map_nav_path()
		return navfile_t:new(path)
	end,
	parse_navfile = function(path)
		return navfile_t:new(path)
	end,
}