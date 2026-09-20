local ffi = require('ffi')

local file do
    local native = {
        ReadFile = utils.get_vfunc('filesystem_stdio.dll', 'VBaseFileSystem011', 0, 'int (__thiscall*)(void*, void*, int, void*)'),
        WriteFile = utils.get_vfunc('filesystem_stdio.dll', 'VBaseFileSystem011', 1, 'int (__thiscall*)(void*, void const*, int, void*)'),

        OpenFile = utils.get_vfunc('filesystem_stdio.dll', 'VBaseFileSystem011', 2, 'void* (__thiscall*)(void*, const char*, const char*, const char*)'),
        CloseFile = utils.get_vfunc('filesystem_stdio.dll', 'VBaseFileSystem011', 3, 'void (__thiscall*)(void*, void*)'),

        GetFileSize = utils.get_vfunc('filesystem_stdio.dll', 'VBaseFileSystem011', 7, 'unsigned int (__thiscall*)(void*, void*)'),
        FileExists = utils.get_vfunc('filesystem_stdio.dll', 'VBaseFileSystem011', 10, 'bool (__thiscall*)(void*, const char*, const char*)'),
        GetFileTime = utils.get_vfunc('filesystem_stdio.dll', 'VBaseFileSystem011', 13, 'int (__thiscall*)(void*, const char*, const char*)'),

        AddSearchPath = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 11, 'void (__thiscall*)(void*, const char*, const char*, int)'),
        RemoveSearchPath = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 12, 'bool (__thiscall*)(void*, const char*, const char*)'),

        RemoveFile = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 20, 'void (__thiscall*)(void*, const char*, const char*)'),
        RenameFile = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 21, 'bool (__thiscall*)(void*, const char*, const char*, const char*)'),
        CreateDirHierarchy = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 22, 'void (__thiscall*)(void*, const char*, const char*)'),
        IsDirectory = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 23, 'bool (__thiscall*)(void*, const char*, const char*)'),

        FindFirst = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 32, 'const char* (__thiscall*)(void*, const char*, int*)'),
        FindNext = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 33, 'const char* (__thiscall*)(void*, int)'),
        FindIsDirectory = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 34, 'bool (__thiscall*)(void*, int)'),
        FindClose = utils.get_vfunc('filesystem_stdio.dll', 'VFileSystem017', 35, 'void (__thiscall*)(void*, int)'),

        GetGameDirectory = utils.get_vfunc('engine.dll', 'VEngineClient014', 36, 'const char*(__thiscall*)(void*)')
    }

    local modes = {
        ['r'] = 'r',
        ['w'] = 'w',
        ['a'] = 'a',
        ['r+'] = 'r+',
        ['w+'] = 'w+',
        ['a+'] = 'a+',
        ['rb'] = 'rb',
        ['wb'] = 'wb',
        ['ab'] = 'ab',
        ['rb+'] = 'rb+',
        ['wb+'] = 'wb+',
        ['ab+'] = 'ab+'
    }

    file = {
        read = function(self)
            local size = self:get_size()
            local array = ffi.new('char[?]', size + 1)
            native.ReadFile(array, size, self.handle)
            return ffi.string(array, size)
        end,
        write = function(self, ...)
            local string = tostring(table.concat({...}))
            native.WriteFile(string, string:len(), self.handle)
        end,
    
        open = function(path, mode, path_id)
            if not modes[mode] then
                return nil
            end
    
            return setmetatable({
                path = path,
                mode = mode,
                path_id = path_id,
                handle = native.OpenFile(path, mode, path_id)
            }, { __index = file })
        end,
        close = function(self)
            native.CloseFile(self.handle)
        end,
    
        get_size = function(self)
            return native.GetFileSize(self.handle)
        end,
        exists = function(path, path_id)
            return native.FileExists(path, path_id)
        end,
        get_time = function(path, path_id)
            return native.GetFileTime(path, path_id)
        end,

        add_search_path = function(path, path_id, type)
            native.AddSearchPath(path, path_id, type)
        end,
        remove_search_path = function(path, path_id)
            native.RemoveSearchPath(path, path_id)
        end,

        remove = function(path, path_id)
            native.RemoveFile(path, path_id)
        end,
        rename = function(old_path, new_path, path_id)
            native.RenameFile(old_path, new_path, path_id)
        end,
        create_directory = function(path, path_id)
            native.CreateDirHierarchy(path, path_id)
        end,
        is_directory = function(path, path_id)
            return native.IsDirectory(path, path_id)
        end,
    
        find_first = function(path)
            local handle = ffi.new('int[1]')
            local found_file = native.FindFirst(path, handle)
            if found_file == ffi.NULL then
                return nil
            end
            return handle, ffi.string(found_file)
        end,
        find_next = function(handle)
            local found_file = native.FindNext(handle)
            if found_file == ffi.NULL then
                return nil
            end
            return ffi.string(found_file)
        end,
        find_is_directory = function(handle)
            return native.FindIsDirectory(handle)
        end,
        find_close = function(handle)
            native.FindClose(handle)
        end,
    
        get_game_directory = function()
            return ffi.string(native.GetGameDirectory()):sub(1, -5)
        end
    }
end

return file

-- usage example | for path_id use either ROOT_PATH or GAME

--local file = require('neverlose/filesystem')

--file.add_search_path(file.get_game_directory(), 'ROOT_PATH', 0)
--events['shutdown']:set(function()
--    file.remove_search_path(file.get_game_directory(), 'ROOT_PATH')
--end)

--file.create_directory('my_lua', 'ROOT_PATH')

--local function writefile(path, ...)
--    local file = file.open(path, 'w', 'ROOT_PATH')
--    file:write(...)
--    file:close()
--end

--local function readfile(path)
--    local file = file.open(path, 'r', 'ROOT_PATH')
--    local contents = file:read()
--    file:close()
--    return contents
--end

--local function listfiles(path)
--    local names = {}
--    local handle, name = file.find_first(('%s\\%s\\*'):format(file.get_game_directory(), path))

--    if not handle then
--        return names
--    end

--    repeat
--        if not file.find_is_directory(handle[0]) then
--            table.insert(names, name)
--        end

--        name = file.find_next(handle[0])
--    until not name

--    file.find_close(handle[0])
--    return names
--end

--writefile('my_lua\\test.txt', 'this is a test')
--print(readfile('my_lua\\test.txt'))
--print(table.concat(listfiles('my_lua'), ', '))