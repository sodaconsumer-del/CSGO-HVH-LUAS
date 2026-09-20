ffi.cdef[[
    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);
    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);
    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);
]]

--- @region: create library
local library = {}
library.list = {}

library.copy = function(void, source, length)
    return ffi.copy(ffi.cast("void*", void), ffi.cast("const void*", source), length)
end

library.virtual_protect = function(point, size, new_protect, old_protect)
    return ffi.C.VirtualProtect(ffi.cast("void*", point), size, new_protect, old_protect)
end

library.virtual_alloc = function(point, size, allocation_type, protect)
    local alloc = ffi.C.VirtualAlloc(point, size, allocation_type, protect)
    return ffi.cast("intptr_t", alloc)
end

library.new = function(address)
    local cache = {
        data = {},
        org_func = {},

        old_protection = ffi.new("unsigned long[1]"),
        virtual_table = ffi.cast("intptr_t**", address)[0]
    }

    cache.data.hook = function(cast, __function, method)
        cache.org_func[method] = cache.virtual_table[method]
        library.virtual_protect(cache.virtual_table + method, 4, 0x4, cache.old_protection)

        cache.virtual_table[method] = ffi.cast("intptr_t", ffi.cast(cast, __function))
        library.virtual_protect(cache.virtual_table + method, 4, cache.old_protection[0], cache.old_protection)

        return ffi.cast(cast, cache.org_func[method])
    end

    cache.data.unhook = function(method)
        library.virtual_protect(cache.virtual_table + method, 4, 0x4, cache.old_protection)

        local alloc_addr = library.virtual_alloc(nil, 5, 0x1000, 0x40)
        local trampoline_bytes = ffi.new("uint8_t[?]", 5, 0x90)

        trampoline_bytes[0] = 0xE9
        ffi.cast("int32_t*", trampoline_bytes + 1)[0] = cache.org_func[method] - tonumber(alloc_addr) - 5

        library.copy(alloc_addr, trampoline_bytes, 5)
        cache.virtual_table[method] = ffi.cast("intptr_t", alloc_addr)

        library.virtual_protect(cache.virtual_table + method, 4, cache.old_protection[0], cache.old_protection)
        cache.org_func[method] = nil
    end

    cache.data.unhook_all = function()
        for method, _ in pairs(cache.org_func) do
            cache.data.unhook(method)
        end
    end

    table.insert(library.list, cache.data.unhook_all)
    return cache.data
end

events.shutdown:set(function()
    for _, reset_function in ipairs(library.list) do
        reset_function()
    end
end)
--- @endregion

--- @region: example: updateCSA
--ffi.cdef[[
    --typedef void*(__thiscall* get_client_entity_t)(void*, int);
--]]

--[[
local uintptr_t = ffi.typeof("uintptr_t**")
local this_call = function(call_function, parameters)
    return function(...)
        return call_function(parameters, ...)
    end
end

local entity_list_003 = ffi.cast(uintptr_t, utils.create_interface("client.dll", "VClientEntityList003"))
local get_entity_address = this_call(ffi.cast("get_client_entity_t", entity_list_003[0][3]), entity_list_003)

local hooked_function = nil
local inside_updateCSA = function(thisptr, edx)
    hooked_function(thisptr, edx)
    print("We are inside updateCSA function!")
end

local update_hook = function()
    local self = entity.get_local_player()
    if not self or not self:is_alive() then
        return
    end

    local self_index = self:get_index()
    local self_address = get_entity_address(self_index)

    if not self_address or hooked_function then
        return
    end

    local new_point = library.new(self_address)
    hooked_function = new_point.hook("void(__fastcall*)(void*, void*)", inside_updateCSA, 224)
end

events.createmove_run:set(update_hook) ]]
--- @endregion

return library