local reloaded_0_0 = require("ffi")
local reloaded_0_1 = {
	file = utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")
}

reloaded_0_1.filesystem_class = reloaded_0_0.cast(reloaded_0_0.typeof("void***"), reloaded_0_1.file)
reloaded_0_1.filesystem_vftbl = reloaded_0_1.filesystem_class[0]
reloaded_0_1.read_file = reloaded_0_0.cast("int (__thiscall*)(void*, void*, int, void*)", reloaded_0_1.filesystem_vftbl[0])
reloaded_0_1.write_file = reloaded_0_0.cast("int (__thiscall*)(void*, void const*, int, void*)", reloaded_0_1.filesystem_vftbl[1])
reloaded_0_1.open_file = reloaded_0_0.cast("void* (__thiscall*)(void*, const char*, const char*, const char*)", reloaded_0_1.filesystem_vftbl[2])
reloaded_0_1.close_file = reloaded_0_0.cast("void (__thiscall*)(void*, void*)", reloaded_0_1.filesystem_vftbl[3])
reloaded_0_1.get_file_size = reloaded_0_0.cast("unsigned int (__thiscall*)(void*, void*)", reloaded_0_1.filesystem_vftbl[7])
reloaded_0_1.file_exists = reloaded_0_0.cast("bool (__thiscall*)(void*, const char*, const char*)", reloaded_0_1.filesystem_vftbl[10])
reloaded_0_1.full_filesystem = utils.create_interface("filesystem_stdio.dll", "VFileSystem017")
reloaded_0_1.full_filesystem_class = reloaded_0_0.cast(reloaded_0_0.typeof("void***"), reloaded_0_1.full_filesystem)
reloaded_0_1.full_filesystem_vftbl = reloaded_0_1.full_filesystem_class[0]
reloaded_0_1.add_search_path = reloaded_0_0.cast("void (__thiscall*)(void*, const char*, const char*, int)", reloaded_0_1.full_filesystem_vftbl[11])
reloaded_0_1.remove_search_path = reloaded_0_0.cast("bool (__thiscall*)(void*, const char*, const char*)", reloaded_0_1.full_filesystem_vftbl[12])
reloaded_0_1.remove_file = reloaded_0_0.cast("void (__thiscall*)(void*, const char*, const char*)", reloaded_0_1.full_filesystem_vftbl[20])
reloaded_0_1.rename_file = reloaded_0_0.cast("bool (__thiscall*)(void*, const char*, const char*, const char*)", reloaded_0_1.full_filesystem_vftbl[21])
reloaded_0_1.create_dir_hierarchy = reloaded_0_0.cast("void (__thiscall*)(void*, const char*, const char*)", reloaded_0_1.full_filesystem_vftbl[22])
reloaded_0_1.is_directory = reloaded_0_0.cast("bool (__thiscall*)(void*, const char*, const char*)", reloaded_0_1.full_filesystem_vftbl[23])
reloaded_0_1.find_first = reloaded_0_0.cast("const char* (__thiscall*)(void*, const char*, int*)", reloaded_0_1.full_filesystem_vftbl[32])
reloaded_0_1.find_next = reloaded_0_0.cast("const char* (__thiscall*)(void*, int)", reloaded_0_1.full_filesystem_vftbl[33])
reloaded_0_1.find_is_directory = reloaded_0_0.cast("bool (__thiscall*)(void*, int)", reloaded_0_1.full_filesystem_vftbl[34])
reloaded_0_1.find_close = reloaded_0_0.cast("void (__thiscall*)(void*, int)", reloaded_0_1.full_filesystem_vftbl[35])

local reloaded_0_2 = {
	modes = {
		["a+"] = "a+",
		w = "w",
		ab = "ab",
		rb = "rb",
		["wb+"] = "wb+",
		["rb+"] = "rb+",
		wb = "wb",
		a = "a",
		["w+"] = "w+",
		["r+"] = "r+",
		r = "r",
		["ab+"] = "ab+"
	},
	handle = {},
	exists = function(arg_1_0)
		return reloaded_0_1.file_exists(reloaded_0_1.filesystem_class, arg_1_0, nil)
	end,
	rename = function(arg_2_0, arg_2_1)
		reloaded_0_1.rename_file(reloaded_0_1.full_filesystem_class, arg_2_0, arg_2_1, nil)
	end,
	remove = function(arg_3_0)
		reloaded_0_1.remove_file(reloaded_0_1.full_filesystem_class, arg_3_0, nil)
	end,
	create_directory = function(arg_4_0)
		reloaded_0_1.create_dir_hierarchy(reloaded_0_1.full_filesystem_class, arg_4_0, nil)
	end,
	is_directory = function(arg_5_0)
		return reloaded_0_1.is_directory(reloaded_0_1.full_filesystem_class, arg_5_0, nil)
	end,
	find_first = function(arg_6_0)
		local reloaded_6_0 = reloaded_0_0.new("int[1]")
		local reloaded_6_1 = reloaded_0_1.find_first(reloaded_0_1.full_filesystem_class, arg_6_0, reloaded_6_0)

		if reloaded_6_1 == reloaded_0_0.NULL then
			return nil
		end

		return reloaded_6_0, reloaded_0_0.string(reloaded_6_1)
	end,
	find_next = function(arg_7_0)
		local reloaded_7_0 = reloaded_0_1.find_next(reloaded_0_1.full_filesystem_class, arg_7_0)

		if reloaded_7_0 == reloaded_0_0.NULL then
			return nil
		end

		return reloaded_0_0.string(reloaded_7_0)
	end,
	find_is_directory = function(arg_8_0)
		return reloaded_0_1.find_is_directory(reloaded_0_1.full_filesystem_class, arg_8_0)
	end,
	find_close = function(arg_9_0)
		reloaded_0_1.find_close(reloaded_0_1.full_filesystem_class, arg_9_0)
	end,
	add_search_path = function(arg_10_0, arg_10_1)
		reloaded_0_1.add_search_path(reloaded_0_1.full_filesystem_class, arg_10_0, arg_10_1)
	end,
	remove_search_path = function(arg_11_0)
		reloaded_0_1.remove_search_path(reloaded_0_1.full_filesystem_class, arg_11_0, nil)
	end
}

function reloaded_0_2.open(arg_12_0, arg_12_1)
	if not reloaded_0_2.modes[arg_12_1] then
		error("Invalid mode!")
	end

	reloaded_0_2.handle = reloaded_0_1.open_file(reloaded_0_1.filesystem_class, arg_12_0, arg_12_1, nil)
end

function reloaded_0_2.get_size()
	return reloaded_0_1.get_file_size(reloaded_0_1.filesystem_class, reloaded_0_2.handle)
end

function reloaded_0_2.write(arg_14_0)
	reloaded_0_1.write_file(reloaded_0_1.filesystem_class, arg_14_0, #arg_14_0, reloaded_0_2.handle)
end

function reloaded_0_2.read()
	local reloaded_15_0 = reloaded_0_1.get_file_size(reloaded_0_1.filesystem_class, reloaded_0_2.handle)
	local reloaded_15_1 = reloaded_0_0.new("char[?]", reloaded_15_0 + 1)

	reloaded_0_1.read_file(reloaded_0_1.filesystem_class, reloaded_15_1, reloaded_15_0, reloaded_0_2.handle)

	return reloaded_0_0.string(reloaded_15_1)
end

function reloaded_0_2.close()
	reloaded_0_1.close_file(reloaded_0_1.filesystem_class, reloaded_0_2.handle)
end

return reloaded_0_2
