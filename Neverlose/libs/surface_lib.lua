local bit = require "bit"
-- region vmt hook funcs
ffi.cdef[[
    typedef unsigned long ULONG;
    int VirtualProtect(void* lpAddress, ULONG dwSize, ULONG flNewProtect, ULONG* lpflOldProtect);
    void* VirtualAlloc(void* lpAddress, ULONG dwSize, ULONG  flAllocationType, ULONG flProtect);
    int VirtualFree(void* lpAddress, ULONG dwSize, ULONG dwFreeType);
]]

local vmt_hook = {hooks = {}}
local buff = {free = {}}

function copy(dst, src, len)
    return ffi.copy(ffi.cast('void*', dst), ffi.cast('const void*', src), len)
end

function VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect)
    return ffi.C.VirtualProtect(ffi.cast('void*', lpAddress), dwSize, flNewProtect, lpflOldProtect)
end

function VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect, blFree)
    local alloc = ffi.C.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
    if blFree then
        table.insert(buff.free, function()
            ffi.C.VirtualFree(alloc, 0, 0x8000)
        end)
    end
    return ffi.cast('intptr_t', alloc)
end

function vmt_hook.new(virtualTbl)
    local new_hook = {}
    local org_func = {}
    local old_prot = ffi.new('ULONG[1]')
    local virtual_table = ffi.cast('intptr_t**', virtualTbl)[0]

    new_hook.this = virtual_table
    new_hook.hookMethod = function(cast, func, method)
        org_func[method] = virtual_table[method]
        VirtualProtect(virtual_table + method, 4, 0x4, old_prot)

        virtual_table[method] = ffi.cast('intptr_t', ffi.cast(cast, func))
        VirtualProtect(virtual_table + method, 4, old_prot[0], old_prot)
        
        return ffi.cast(cast, org_func[method])
    end

    new_hook.unHookMethod = function(method)
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

    new_hook.unHookAll = function()
        for method, func in pairs(org_func) do
            new_hook.unHookMethod(method)
        end
    end

    table.insert(vmt_hook.hooks, new_hook.unHookAll)
    return new_hook
end
-- endregion

local function __thiscall(arguments, this, index, ...) -- wrapper for thiscall funcs
    local args = {...}
    local type = "void"
    if args[1] then type = args[1] end
    arguments = arguments:len() == 0 and "" or "void*, "..arguments
    local func = ffi.cast(type.."(__thiscall*)("..arguments..")", this[0][index])
    return function(...)
        if(arguments:len() == 0)then
            return func()
        else
            return func(this, ...)
        end
    end
end

-- region localize funcs
local Localize                          = ffi.cast("void***", utils.create_interface("localize.dll", "Localize_001"))
local FindSafe                          = __thiscall("const char*", Localize, 12, "wchar_t*")
local ConvertANSIToUnicode              = __thiscall("const char*, wchar_t*, int", Localize, 15, "int")
local ConvertUnicodeToANSI              = __thiscall("const wchar_t*, char*, int", Localize, 16, "int")
-- endregion

-- region surface funcs
local surface_mt = {}
local ISurface                          = ffi.cast("void***", utils.create_interface("vguimatsurface.dll", "VGUI_Surface031"))

surface_mt.VGUIPanel                    = utils.create_interface("vgui2.dll", "VGUI_Panel009")
surface_mt.GetPanelName                 = ffi.cast("const char*(__thiscall*)(void*, uint32_t)", ffi.cast("void***", surface_mt.VGUIPanel)[0][36])

surface_mt.DrawSetColor         = __thiscall("int, int, int, int", ISurface, 15)
surface_mt.DrawFilledRect       = __thiscall("int, int, int, int", ISurface, 16)
surface_mt.DrawOutlinedRect     = __thiscall("int, int, int, int", ISurface, 18)
surface_mt.DrawLine             = __thiscall("int, int, int, int", ISurface, 19)
surface_mt.DrawOutlinedCircle   = __thiscall("int, int, int, int", ISurface, 103)

surface_mt.DrawSetTextFont      = __thiscall("ULONG", ISurface, 23)
surface_mt.DrawSetTextColor     = __thiscall("int, int, int, int", ISurface, 25)
surface_mt.DrawSetTextPos       = __thiscall("int, int", ISurface, 26)
surface_mt.DrawPrintText        = __thiscall("const wchar_t*, int, int", ISurface, 28)
surface_mt.CreateFont           = __thiscall("", ISurface, 71, "ULONG")
surface_mt.SetFontGlyphSet      = __thiscall("ULONG, const char*, int, int, int, int, ULONG, int, int", ISurface, 72)
surface_mt.GetTextSize          = __thiscall("ULONG, const wchar_t*, int&, int&", ISurface, 79)

surface_mt.DrawGetTextureId     = __thiscall("char const*", ISurface, 34, "int")
surface_mt.DrawSetTextureRGBA   = __thiscall("int, const unsigned char*, int, int", ISurface, 37)
surface_mt.DrawSetTexture       = __thiscall("int", ISurface, 38)
surface_mt.DeleteTextureByID    = __thiscall("int", ISurface, 39, "bool")
surface_mt.DrawGetTextureSize   = __thiscall("int, int&, int&", ISurface, 40)
surface_mt.DrawTexturedRect     = __thiscall("int, int, int, int", ISurface, 41)
surface_mt.CreateNewTextureID   = __thiscall("bool", ISurface, 43, "int")

-- endregion

-- region lib funcs
local surface = {
    callfuncs = {},
    image = {}
}

function surface:createFont(fontname, size, weights, flags)
    local font = surface_mt.CreateFont()
    local flag = 0
    weights = weights or 0
    if type(flags) == "number" then
        flag = flags
    elseif type(flags) == "table" then
        for i=1, #flags do
            flag = flag + flags[i]
        end
    end
    surface_mt.SetFontGlyphSet(font, fontname, size, weights, 0, 0, bit.bor(flag), 0, 0)
    return font
end

function surface:text(text, font, position, color)
    local buf = ffi.new("wchar_t[1024]")
    ConvertANSIToUnicode(text, buf, 1024)
    surface_mt.DrawSetTextFont(font)
    surface_mt.DrawSetTextPos(position.x, position.y)
    surface_mt.DrawSetTextColor(color.r, color.g, color.b, color.a)
    surface_mt.DrawPrintText(buf, 1024, 0)
end

function surface:getTextSize(font, text)
    local buf = ffi.new("wchar_t[1024]")
    local pwide = ffi.new("int[1]")
    local ptall = ffi.new("int[1]")
    ConvertANSIToUnicode(text, buf, 1024)
    surface_mt.GetTextSize(font, buf, pwide, ptall)
    local wide = tonumber(ffi.cast("int", pwide[0]))
    local tall = tonumber(ffi.cast("int", ptall[0]))
    return vector(wide, tall)
end

function surface:rect(pos1, pos2, col)
    surface_mt.DrawSetColor(col.r, col.g, col.b, col.a)
    surface_mt.DrawOutlinedRect(pos1.x, pos1.y, pos2.x, pos2.y)
end

function surface:rectFilled(startPos, endPos, clr)
    surface_mt.DrawSetColor(clr.r, clr.g, clr.b, clr.a)
    surface_mt.DrawFilledRect(startPos.x, startPos.y, endPos.x, endPos.y)
end

function surface:circle(position, clr, radius, segments)
    surface_mt.DrawSetColor(clr.r, clr.g, clr.b, clr.a)
    surface_mt.DrawOutlinedCircle(position.x, position.y, radius, segments)
end

function surface:call(func)
    self.callfuncs[#self.callfuncs + 1] = func
end

-- endregion

-- region hook surface
local orig = nil
local VGUI_Panel009 = vmt_hook.new(surface_mt.VGUIPanel)
function painttraverse_hk(thisptr, vguiPanel, forceRepaint, allowForce)
    local panelName = ffi.string(surface_mt.GetPanelName(thisptr, vguiPanel))
    if(panelName == "FocusOverlayPanel") then
        for _, func in pairs(surface.callfuncs)do
            func()
        end
    end
    orig(thisptr, vguiPanel, forceRepaint, allowForce)
end
orig = VGUI_Panel009.hookMethod("void(__thiscall*)(void*, unsigned int, bool, bool)", painttraverse_hk, 41)
-- endregion

-- region unload
events.shutdown:set(function()
    for _, unHookFunc in ipairs(vmt_hook.hooks) do
        unHookFunc()
    end
    for _, free in ipairs(buff.free) do
        free()
    end
end)
-- endregion
return surface

-- example
-- [[
-- local surface = require "neverlose/surface_lib"
-- local verdanaSur = surface:createFont("Verdana", 13, 600, {0x010})
-- function surfacePaint()
--     surface:rectFilled(vector(300, 300), vector(700, 700), color(255, 255, 255, 255))
--     surface:rect(vector(400, 400), vector(600, 600), color(255, 0, 0, 255))
--     surface:circle(vector(500, 500), color(0, 0, 255, 255),30, 30)
--     surface:text("you paint on surface now!!!", verdanaSur, vector(440, 400), color(255, 0, 0, 255))
-- end

-- surface:call(surfacePaint)
-- ]]
