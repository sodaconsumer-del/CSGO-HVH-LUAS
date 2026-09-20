ffi.cdef[[
    typedef struct
    {
        uint8_t r;
        uint8_t g;
        uint8_t b;
        uint8_t a;
    } color_struct_t;
    typedef void (__cdecl* print_function)(void*, color_struct_t&, const char* text, ...);
]]

local uintptr_t = ffi.typeof("uintptr_t**")
local color_struct_t = ffi.typeof("color_struct_t")

local color_print = function(text, color)
    text = tostring(text)

    local create_interface = ffi.cast(uintptr_t, utils.create_interface("vstdlib.dll", "VEngineCvar007"))
    local print_function = ffi.cast("print_function", create_interface[0][25])

    print_function(create_interface, color_struct_t(color.r, color.g, color.b, color.a), text)
end

return color_print