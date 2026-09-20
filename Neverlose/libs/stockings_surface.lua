--#region surface---------------------------------------
local ffi = require 'ffi'
local bit = require 'bit'
local bor = bit.bor

ffi.cdef [[
    typedef unsigned char wchar_t;
    typedef int(__thiscall* ConvertAnsiToUnicode_t)(void*, const char*, wchar_t*, int);
    typedef int(__thiscall* ConvertUnicodeToAnsi_t)(void*, const wchar_t*, char*, int);
    typedef wchar_t*(__thiscall* FindSafe_t)(void*, const char*);
    typedef void(__thiscall* draw_set_color_t)(void*, int, int, int, int);
    typedef void(__thiscall* draw_filled_rect_t)(void*, int, int, int, int);
    typedef void(__thiscall* draw_outlined_rect_t)(void*, int, int, int, int);
    typedef void(__thiscall* draw_line_t)(void*, int, int, int, int);
    typedef void(__thiscall* draw_poly_line_t)(void*, int*, int*, int);
    typedef void(__thiscall* draw_outlined_circle_t)(void*, int, int, int, int);
    typedef void(__thiscall* draw_filled_rect_fade_t)(void*, int, int, int, int, unsigned int, unsigned int, bool);
    typedef void(__thiscall* draw_set_text_font_t)(void*, unsigned long);
    typedef void(__thiscall* draw_set_text_color_t)(void*, int, int, int, int);
    typedef void(__thiscall* draw_set_text_pos_t)(void*, int, int);
    typedef void(__thiscall* draw_print_text_t)(void*, const wchar_t*, int, int);
    typedef unsigned int(__thiscall* create_font_t)(void*);
    typedef void(__thiscall* set_font_glyph_t)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int);
    typedef void(__thiscall* get_text_size_t)(void*, unsigned long, const wchar_t*, int&, int&);
    typedef unsigned int(__thiscall* get_cursor_pos_t)(void*, int*, int*);
    typedef unsigned int(__thiscall* set_cursor_pos_t)(void*, int, int);
    typedef unsigned int(__thiscall* unlock_cursor_t)(void*);
    typedef unsigned int(__thiscall* lock_cursor_t)(void*);
]]

local function uuid(len)
    local res, len = "", len or 32

    for i = 1, len do
        res = res .. string.char(math.random(97, 122))
    end

    return res
end

local interface_mt = {}

function interface_mt.get_function(self, index, ret, args)
    local ct = uuid() .. "_t"

    args = args or {}
    if type(args) == "table" then
        table.insert(args, 1, "void*")
    else
        return error("args has to be of type table", 2)
    end

    local success, res = pcall(
        ffi.cdef,
        "typedef " .. ret .. " (__thiscall* " .. ct .. ")(" .. table.concat(args, ", ") .. ");"
    )

    if not success then
        error("invalid typedef: " .. res, 2)
    end

    local interface = self[1]
    local success, func = pcall(ffi.cast, ct, interface[0][index])

    if not success then
        return error("failed to cast: " .. func, 2)
    end

    return function(...)
        ---@diagnostic disable-next-line: param-type-mismatch
        local success, res = pcall(func, interface, ...)

        if not success then
            return error("call: " .. res, 2)
        end

        if ret == "const char*" then
            return res ~= nil and ffi.string(res) or nil
        end
        return res
    end
end

local function create_interface(dll, interface_name)
    local interface = (type(dll) == "string" and type(interface_name) == "string") and
        utils.create_interface(dll, interface_name) or dll
    return setmetatable({ ffi.cast(ffi.typeof("void***"), interface) }, { __index = interface_mt })
end


local localize                      = create_interface("localize.dll", "Localize_001")
local convert_ansi_to_unicode       = localize:get_function(15, "int", { "const char*", "wchar_t*", "int" })
local convert_unicode_to_ansi       = localize:get_function(16, "int", { "const wchar_t*", "char*", "int" })
local find_safe                     = localize:get_function(12, "wchar_t*", { "const char*" })

-- set up surface metatable
local surface_mt                    = {}
surface_mt.__index                  = surface_mt

surface_mt.isurface                 = create_interface("vguimatsurface.dll", "VGUI_Surface031")

surface_mt.fn_draw_set_color        = surface_mt.isurface:get_function(15, "void", { "int", "int", "int", "int" })
surface_mt.fn_draw_filled_rect      = surface_mt.isurface:get_function(16, "void", { "int", "int", "int", "int" })
surface_mt.fn_draw_outlined_rect    = surface_mt.isurface:get_function(18, "void", { "int", "int", "int", "int" })
surface_mt.fn_draw_line             = surface_mt.isurface:get_function(19, "void", { "int", "int", "int", "int" })
surface_mt.fn_draw_poly_line        = surface_mt.isurface:get_function(20, "void", { "int*", "int*", "int", })
surface_mt.fn_draw_set_text_font    = surface_mt.isurface:get_function(23, "void", { "unsigned long" })
surface_mt.fn_draw_set_text_color   = surface_mt.isurface:get_function(25, "void", { "int", "int", "int", "int" })
surface_mt.fn_draw_set_text_pos     = surface_mt.isurface:get_function(26, "void", { "int", "int" })
surface_mt.fn_draw_print_text       = surface_mt.isurface:get_function(28, "void", { "const wchar_t*", "int", "int" })

surface_mt.fn_draw_get_texture_id   = surface_mt.isurface:get_function(34, "int", { "const char*" })          -- new
surface_mt.fn_draw_get_texture_file = surface_mt.isurface:get_function(35, "bool", { "int", "char*", "int" }) -- new
surface_mt.fn_draw_set_texture_file = surface_mt.isurface:get_function(36, "void",
    { "int", "const char*", "int", "bool" })                                                                  -- new
surface_mt.fn_draw_set_texture_rgba = surface_mt.isurface:get_function(37, "void",
    { "int", "const unsigned char*", "int", "int" })                                                          -- new
surface_mt.fn_draw_set_texture      = surface_mt.isurface:get_function(38, "void", { "int" })                 -- new
surface_mt.fn_delete_texture_by_id  = surface_mt.isurface:get_function(39, "void", { "int" })                 -- new
surface_mt.fn_draw_get_texture_size = surface_mt.isurface:get_function(40, "void", { "int", "int&", "int&" }) -- new
surface_mt.fn_draw_textured_rect    = surface_mt.isurface:get_function(41, "void", { "int", "int", "int", "int" })
surface_mt.fn_is_texture_id_valid   = surface_mt.isurface:get_function(42, "bool", { "int" })                 -- new
surface_mt.fn_create_new_texture_id = surface_mt.isurface:get_function(43, "int", { "bool" })                 -- new

surface_mt.fn_unlock_cursor         = surface_mt.isurface:get_function(66, "void")
surface_mt.fn_lock_cursor           = surface_mt.isurface:get_function(67, "void")
surface_mt.fn_create_font           = surface_mt.isurface:get_function(71, "unsigned int")
surface_mt.fn_set_font_glyph        = surface_mt.isurface:get_function(72, "void",
    { "unsigned long", "const char*", "int", "int", "int", "int", "unsigned long", "int", "int" })
surface_mt.fn_get_text_size         = surface_mt.isurface:get_function(79, "void",
    { "unsigned long", "const wchar_t*", "int&", "int&" })
surface_mt.fn_get_cursor_pos        = surface_mt.isurface:get_function(100, "unsigned int", { "int*", "int*" })
surface_mt.fn_set_cursor_pos        = surface_mt.isurface:get_function(101, "unsigned int", { "int", "int" })
surface_mt.fn_draw_outlined_circle  = surface_mt.isurface:get_function(103, "void", { "int", "int", "int", "int" })
surface_mt.fn_draw_filled_rect_fade = surface_mt.isurface:get_function(123, "void",
    { "int", "int", "int", "int", "unsigned int", "unsigned int", "bool" })

function surface_mt:draw_set_color(r, g, b, a)
    self.fn_draw_set_color(r, g, b, a)
end

function surface_mt:draw_filled_rect(x0, y0, x1, y1)
    self.fn_draw_filled_rect(x0, y0, x1, y1)
end

function surface_mt:draw_outlined_rect(x0, y0, x1, y1)
    self.fn_draw_outlined_rect(x0, y0, x1, y1)
end

function surface_mt:draw_line(x0, y0, x1, y1)
    self.fn_draw_line(x0, y0, x1, y1)
end

function surface_mt:draw_poly_line(x, y, count)
    local int_ptr = ffi.typeof("int[1]")
    local x1 = ffi.new(int_ptr, x)
    local y1 = ffi.new(int_ptr, y)
    self.fn_draw_poly_line(x1, y1, count)
end

function surface_mt:draw_outlined_circle(x, y, radius, segments)
    self.fn_draw_outlined_circle(x, y, radius, segments)
end

function surface_mt:draw_filled_rect_fade(x0, y0, x1, y1, alpha0, alpha1, horizontal)
    self.fn_draw_filled_rect_fade(x0, y0, x1, y1, alpha0, alpha1, horizontal)
end

function surface_mt:draw_set_text_font(font)
    self.fn_draw_set_text_font(font)
end

function surface_mt:draw_set_text_color(r, g, b, a)
    self.fn_draw_set_text_color(r, g, b, a)
end

function surface_mt:draw_set_text_pos(x, y)
    self.fn_draw_set_text_pos(x, y)
end

function surface_mt:draw_print_text(text, localized)
    if localized then
        local char_buffer = ffi.new('char[1024]')
        ---@diagnostic disable-next-line: need-check-nil
        convert_unicode_to_ansi(text, char_buffer, 1024)
        local test = ffi.string(char_buffer)
        self.fn_draw_print_text(text, test:len(), 0)
    else
        local wide_buffer = ffi.new('wchar_t[1024]')
        ---@diagnostic disable-next-line: need-check-nil
        convert_ansi_to_unicode(text, wide_buffer, 1024)
        self.fn_draw_print_text(wide_buffer, text:len(), 0)
    end
end

function surface_mt:draw_get_texture_id(filename)
    return (self.fn_draw_get_texture_id(filename))
end

function surface_mt:draw_get_texture_file(id, filename, maxlen)
    return (self.fn_draw_get_texture_file(id, filename, maxlen))
end

function surface_mt:draw_set_texture_file(id, filename, hardwarefilter, forcereload)
    self.fn_draw_set_texture_file(id, filename, hardwarefilter, forcereload)
end

function surface_mt:draw_set_texture_rgba(id, rgba, wide, tall)
    self.fn_draw_set_texture_rgba(id, rgba, wide, tall)
end

function surface_mt:draw_set_texture(id)
    self.fn_draw_set_texture(id)
end

function surface_mt:delete_texture_by_id(id)
    self.fn_delete_texture_by_id(id)
end

function surface_mt:draw_get_texture_size(id)
    local int_ptr = ffi.typeof("int[1]")
    local wide_ptr = int_ptr()
    local tall_ptr = int_ptr()
    self.fn_draw_get_texture_size(id, wide_ptr, tall_ptr)
    local wide = tonumber(ffi.cast("int", wide_ptr[0]))
    local tall = tonumber(ffi.cast("int", tall_ptr[0]))
    return wide, tall
end

function surface_mt:draw_textured_rect(x0, y0, x1, y1)
    self.fn_draw_textured_rect(x0, y0, x1, y1)
end

function surface_mt:is_texture_id_valid(id)
    return (self.fn_is_texture_id_valid(id))
end

function surface_mt:create_new_texture_id(id)
    return (self.fn_create_new_texture_id(id))
end

function surface_mt:create_font()
    return (self.fn_create_font())
end

function surface_mt:set_font_glyph(font, font_name, tall, weight, flags)
    local x = 0
    if type(flags) == "number" then
        x = flags
    elseif type(flags) == "table" then
        for i = 1, #flags do
            x = x + flags[i]
        end
    end

    ---@diagnostic disable-next-line: missing-parameter
    self.fn_set_font_glyph(font, font_name, tall, weight, 0, 0, bor(x), 0, 0)
end

function surface_mt:get_text_size(font, text)
    local wide_buffer = ffi.new('wchar_t[1024]')
    local int_ptr = ffi.typeof("int[1]")
    local wide_ptr = int_ptr()
    local tall_ptr = int_ptr()

    ---@diagnostic disable-next-line: need-check-nil
    convert_ansi_to_unicode(text, wide_buffer, 1024)
    self.fn_get_text_size(font, wide_buffer, wide_ptr, tall_ptr)
    local wide = tonumber(ffi.cast("int", wide_ptr[0]))
    local tall = tonumber(ffi.cast("int", tall_ptr[0]))
    return wide, tall
end

function surface_mt:get_cursor_pos()
    local int_ptr = ffi.typeof("int[1]")
    local x_ptr = int_ptr()
    local y_ptr = int_ptr()
    self.fn_get_cursor_pos(x_ptr, y_ptr)
    local x = tonumber(ffi.cast("int", x_ptr[0]))
    local y = tonumber(ffi.cast("int", y_ptr[0]))
    return x, y
end

function surface_mt:set_cursor_pos(x, y)
    self.fn_set_cursor_pos(x, y)
end

function surface_mt:unlock_cursor()
    self.fn_unlock_cursor()
end

function surface_mt:lock_cursor()
    self.fn_lock_cursor()
end

--#endregion--------------------------------------------
--#region surface funcs---------------------------------
local surface = {}

function surface.create_font(windows_font_name, tall, weight, flags)
    local font = surface_mt:create_font()

    if type(flags) == "nil" then
        flags = 0
    end

    surface_mt:set_font_glyph(font, windows_font_name, tall, weight, flags)
    return font
end

function surface.localize_string(text)
    ---@diagnostic disable-next-line: need-check-nil
    local localized_string = find_safe(text)
    local char_buffer = ffi.new('char[1024]')
    ---@diagnostic disable-next-line: need-check-nil
    convert_unicode_to_ansi(localized_string, char_buffer, 1024)
    return ffi.string(char_buffer)
end

function surface.draw_text(x, y, clr, font, text)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    surface_mt:draw_set_text_pos(x, y)
    surface_mt:draw_set_text_font(font)
    surface_mt:draw_set_text_color(unpack(clr))
    surface_mt:draw_print_text(tostring(text), false)
end

function surface.draw_localized_text(x, y, clr, font, text)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    surface_mt:draw_set_text_pos(x, y)
    surface_mt:draw_set_text_font(font)
    surface_mt:draw_set_text_color(unpack(clr))
    ---@diagnostic disable-next-line: need-check-nil
    local localized_string = find_safe(text)

    surface_mt:draw_print_text(localized_string, true)
end

function surface.draw_line(x0, y0, x1, y1, clr)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    surface_mt:draw_set_color(unpack(clr))
    surface_mt:draw_line(x0, y0, x1, y1)
end

function surface.draw_filled_rect(x, y, w, h, clr)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    surface_mt:draw_set_color(unpack(clr))
    surface_mt:draw_filled_rect(x, y, x + w, y + h)
end

function surface.draw_outlined_rect(x, y, w, h, clr)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    surface_mt:draw_set_color(unpack(clr))
    surface_mt:draw_outlined_rect(x, y, x + w, y + h)
end

function surface.draw_filled_outlined_rect(x, y, w, h, clr0, clr1)
    if type(clr0) == "userdata" then clr0 = { clr0.r, clr0.g, clr0.b, clr0.a } end
    if type(clr1) == "userdata" then clr1 = { clr1.r, clr1.g, clr1.b, clr1.a } end

    surface_mt:draw_set_color(unpack(clr0))
    surface_mt:draw_filled_rect(x, y, x + w, y + h)
    surface_mt:draw_set_color(unpack(clr1))
    surface_mt:draw_outlined_rect(x, y, x + w, y + h)
end

function surface.draw_filled_gradient_rect(x, y, w, h, clr0, clr1, horizontal)
    if type(clr0) == "userdata" then clr0 = { clr0.r, clr0.g, clr0.b, clr0.a } end
    if type(clr1) == "userdata" then clr1 = { clr1.r, clr1.g, clr1.b, clr1.a } end

    surface_mt:draw_set_color(unpack(clr0))
    surface_mt:draw_filled_rect_fade(x, y, x + w, y + h, 255, 255, horizontal)

    surface_mt:draw_set_color(unpack(clr1))
    surface_mt:draw_filled_rect_fade(x, y, x + w, y + h, 0, 255, horizontal)
end

function surface.draw_outlined_circle(x, y, clr, radius, segments)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    surface_mt:draw_set_color(unpack(clr))
    surface_mt:draw_outlined_circle(x, y, radius, segments)
end

function surface.draw_poly_line(x, y, clr, count)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    surface_mt:draw_set_color(unpack(clr))
    surface_mt:draw_poly_line(x, y, count)
end

function surface.test_font(x, y, clr, font)
    if type(clr) == "userdata" then clr = { clr.r, clr.g, clr.b, clr.a } end

    local _, height_offset = surface_mt:get_text_size(font, "a b c d e f g h i j k l m n o p q r s t u v w x y z")

    surface.draw_text(x, y, unpack(clr), font,
        "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 ß + # ä ö ü , . -")
    surface.draw_text(x, y + height_offset, unpack(clr), font,
        "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z = ! \" § $ % & / ( ) = ? { [ ] } \\ * ' _ : ; ~ ")
end

function surface.get_text_size(font, text)
    return surface_mt:get_text_size(font, text)
end

function surface.set_mouse_pos(x, y)
    surface_mt:set_cursor_pos(x, y)
end

function surface.get_mouse_pos()
    return surface_mt:get_cursor_pos()
end

function surface.unlock_cursor()
    surface_mt:unlock_cursor()
end

function surface.lock_cursor()
    surface_mt:lock_cursor()
end

function surface.load_texture(filename)
    local texture = surface_mt:create_new_texture_id(false)
    surface_mt:draw_set_texture_file(texture, filename, true, true)
    local _w, _h = surface_mt:draw_get_texture_size(texture)
    return texture
end

--#endregion--------------------------------------------
--#region vmt-------------------------------------------
ffi.cdef [[
    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);
    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);
    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);
]]

local get_panel_name_type = ffi.typeof("const char*(__thiscall*)(void*, uint32_t)")

surface.vmt_hook = { hooks = {} }
local target = utils.create_interface("vgui2.dll", "VGUI_Panel009")
local interface_type = ffi.typeof("void***")
local buff = { free = {} }

local panel_interface = ffi.cast(interface_type, target)                 --
local panel_interface_vtbl = panel_interface[0]                          --
local get_panel_name_raw = panel_interface_vtbl[36]                      --
local get_panel_name = ffi.cast(get_panel_name_type, get_panel_name_raw) -- credits to alphanine

local function copy(dst, src, len)
    return ffi.copy(ffi.cast('void*', dst), ffi.cast('const void*', src), len)
end

local function VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect)
    ---@diagnostic disable-next-line: undefined-field
    return ffi.C.VirtualProtect(ffi.cast('void*', lpAddress), dwSize, flNewProtect, lpflOldProtect)
end

local function VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect, blFree)
    ---@diagnostic disable-next-line: undefined-field
    local alloc = ffi.C.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
    if blFree then
        table.insert(buff.free, function()
            ---@diagnostic disable-next-line: undefined-field
            ffi.C.VirtualFree(alloc, 0, 0x8000)
        end)
    end
    return ffi.cast('intptr_t', alloc)
end

function surface.vmt_hook.new(vt)
    local new_hook = {}
    local org_func = {}
    local old_prot = ffi.new('unsigned long[1]')
    local virtual_table = ffi.cast('intptr_t**', vt)[0]

    new_hook.this = virtual_table

    new_hook.hook = function(cast, func, method)
        org_func[method] = virtual_table[method]
        VirtualProtect(virtual_table + method, 4, 0x4, old_prot)

        virtual_table[method] = ffi.cast('intptr_t', ffi.cast(cast, func))
        VirtualProtect(virtual_table + method, 4, old_prot[0], old_prot)

        return ffi.cast(cast, org_func[method])
    end

    new_hook.unhook = function(method)
        VirtualProtect(virtual_table + method, 4, 0x4, old_prot)
        local alloc_addr = VirtualAlloc(nil, 5, 0x1000, 0x40, false)
        local trampoline_bytes = ffi.new('uint8_t[?]', 5, 0x90)
        trampoline_bytes[0] = 0xE9

        ffi.cast('int32_t*', trampoline_bytes + 1)[0] = org_func[method] - tonumber(alloc_addr) - 5

        copy(alloc_addr, trampoline_bytes, 5)
        virtual_table[method] = ffi.cast('intptr_t', alloc_addr)

        VirtualProtect(virtual_table + method, 4, old_prot[0], old_prot)
        org_func[method] = nil
    end

    new_hook.unhook_all = function()
        for method in pairs(org_func) do
            new_hook.unhook(method)
        end
    end

    table.insert(surface.vmt_hook.hooks, new_hook.unhook_all)
    return new_hook
end

--#endregion--------------------------------------------
--#region misc funcs------------------------------------
local flags = setmetatable({
    ["i"] = 0x001,
    ["_"] = 0x002,
    ["-"] = 0x004,
    ["a"] = 0x010,
    ["r"] = 0x040,
    ["s"] = 0x080,
    ["o"] = 0x200
}, {
    __index = function(_, key)
        print_error("stockings_surface: invalid font flag: ", key)
        return 0
    end
})

surface.flags = function(str)
    local num = 0

    for _, symbol in string.gmatch(str, ".") do
        num = num + flags[symbol]
    end

    return num
end
--#endregion--------------------------------------------
--#region painttraverse---------------------------------
surface.callbacks = {}

surface.set_draw_callback = function(fun)
    table.insert(surface.callbacks, fun)
end

local orig = nil

local VGUI_Panel009 = surface.vmt_hook.new(target)
local function painttraverse_hk(one, two, three, four)
    local panel = two
    local panel_name = ffi.string(get_panel_name(one, panel))

    if (panel_name == "FocusOverlayPanel") then
        for _, fn in pairs(surface.callbacks) do fn() end
    end

    ---@diagnostic disable-next-line: need-check-nil
    orig(one, two, three, four)
end

orig = VGUI_Panel009.hook("void(__thiscall*)(void*, unsigned int, bool, bool)", painttraverse_hk, 41)

surface.unload_func = function()
    for _, to_unhook in ipairs(surface.vmt_hook.hooks) do
        to_unhook()
    end
end
--#endregion--------------------------------------------

return surface
