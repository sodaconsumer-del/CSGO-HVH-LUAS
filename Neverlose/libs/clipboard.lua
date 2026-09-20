local char_array = ffi.typeof 'char[?]'

local native_GetClipboardTextCount = utils.get_vfunc('vgui2.dll', 'VGUI_System010', 7, 'int(__thiscall*)(void*)')
local native_SetClipboardText = utils.get_vfunc('vgui2.dll', 'VGUI_System010', 9, 'void(__thiscall*)(void*, const char*, int)')
local native_GetClipboardText = utils.get_vfunc('vgui2.dll', 'VGUI_System010', 11, 'int(__thiscall*)(void*, int, const char*, int)')

local function get()
	local len = native_GetClipboardTextCount()

	if len > 0 then
		local char_arr = char_array(len)

		native_GetClipboardText(0, char_arr, len)
		return ffi.string(char_arr, len - 1)
	end
end

local function set(...)
	local text = tostring(table.concat({ ... }))

	native_SetClipboardText(text, string.len(text))
end

return {
	set = set,
	get = get
}