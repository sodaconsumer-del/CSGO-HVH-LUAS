local reloaded_0_0 = {}
local reloaded_0_1 = require("ffi")
local reloaded_0_2 = require("bit")

local function reloaded_0_3(arg_1_0, arg_1_1, arg_1_2)
	return reloaded_0_1.cast(arg_1_2, reloaded_0_1.cast("void***", arg_1_0)[0][arg_1_1])
end

local function reloaded_0_4(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local reloaded_2_0 = utils.create_interface(arg_2_0, arg_2_1) or error("invalid interface")
	local reloaded_2_1, reloaded_2_2 = pcall(reloaded_0_1.typeof, arg_2_3)

	if not reloaded_2_1 then
		error(reloaded_2_2, 2)
	end

	local reloaded_2_3 = reloaded_0_3(reloaded_2_0, arg_2_2, reloaded_2_2) or error("invalid vtable")

	return function(...)
		return reloaded_2_3(reloaded_2_0, ...)
	end
end

local reloaded_0_5 = reloaded_0_1.typeof("char[?]")
local reloaded_0_6 = reloaded_0_1.typeof("int[1]")
local reloaded_0_7 = reloaded_0_1.typeof("wchar_t[?]")
local reloaded_0_8 = reloaded_0_4("localize.dll", "Localize_001", 15, "int(__thiscall*)(void*, const char*, wchar_t*, int)")
local reloaded_0_9 = reloaded_0_4("localize.dll", "Localize_001", 16, "int(__thiscall*)(void*, wchar_t*, char*, int)")
local reloaded_0_10 = reloaded_0_4("localize.dll", "Localize_001", 12, "wchar_t*(__thiscall*)(void*, const char*)")
local reloaded_0_11 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 15, "void(__thiscall*)(void*, int, int, int, int)")
local reloaded_0_12 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 16, "void(__thiscall*)(void*, int, int, int, int)")
local reloaded_0_13 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 18, "void(__thiscall*)(void*, int, int, int, int)")
local reloaded_0_14 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 19, "void(__thiscall*)(void*, int, int, int, int)")
local reloaded_0_15 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 20, "void(__thiscall*)(void*, int*, int*, int)")
local reloaded_0_16 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 23, "void(__thiscall*)(void*, unsigned long)")
local reloaded_0_17 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 25, "void(__thiscall*)(void*, int, int, int, int)")
local reloaded_0_18 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 26, "void(__thiscall*)(void*, int, int)")
local reloaded_0_19 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 28, "void(__thiscall*)(void*, const wchar_t*, int, int)")
local reloaded_0_20 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 34, "int(__thiscall*)(void*, const char*)")
local reloaded_0_21 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 35, "bool(__thiscall*)(void*, int, char*, int)")
local reloaded_0_22 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 36, "void(__thiscall*)(void*, int, const char*, int, bool)")
local reloaded_0_23 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 37, "void(__thiscall*)(void*, int, const wchar_t*, int, int)")
local reloaded_0_24 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 38, "void(__thiscall*)(void*, int)")
local reloaded_0_25 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 39, "void(__thiscall*)(void*, int)")
local reloaded_0_26 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 40, "void(__thiscall*)(void*, int, int&, int&)")
local reloaded_0_27 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 41, "void(__thiscall*)(void*, int, int, int, int)")
local reloaded_0_28 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 42, "bool(__thiscall*)(void*, int)")
local reloaded_0_29 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 43, "int(__thiscall*)(void*, bool)")
local reloaded_0_30 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 66, "void(__thiscall*)(void*)")
local reloaded_0_31 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 67, "void(__thiscall*)(void*)")
local reloaded_0_32 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 71, "unsigned int(__thiscall*)(void*)")
local reloaded_0_33 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 72, "void(__thiscall*)(void*, unsigned long, const char*, int, int, int, int, unsigned long, int, int)")
local reloaded_0_34 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 79, "void(__thiscall*)(void*, unsigned long, const wchar_t*, int&, int&)")
local reloaded_0_35 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 100, "unsigned int(__thiscall*)(void*, int*, int*)")
local reloaded_0_36 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 101, "unsigned int(__thiscall*)(void*, int, int)")
local reloaded_0_37 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 103, "void(__thiscall*)(void*, int, int, int, int)")
local reloaded_0_38 = reloaded_0_4("vguimatsurface.dll", "VGUI_Surface031", 123, "void(__thiscall*)(void*, int, int, int, int, unsigned int, unsigned int, bool)")

local function reloaded_0_39(arg_4_0, arg_4_1)
	if arg_4_1 then
		local reloaded_4_0 = 1024
		local reloaded_4_1 = reloaded_0_5(reloaded_4_0)

		reloaded_0_9(arg_4_0, reloaded_4_1, reloaded_4_0)

		local reloaded_4_2 = reloaded_0_1.string(reloaded_4_1)

		return reloaded_0_19(arg_4_0, reloaded_4_2:len(), 0)
	else
		local reloaded_4_3 = 1024
		local reloaded_4_4 = reloaded_0_7(reloaded_4_3)

		reloaded_0_8(arg_4_0, reloaded_4_4, reloaded_4_3)

		return reloaded_0_19(reloaded_4_4, arg_4_0:len(), 0)
	end
end

local function reloaded_0_40(arg_5_0, arg_5_1)
	local reloaded_5_0 = reloaded_0_7(1024)
	local reloaded_5_1 = reloaded_0_6()
	local reloaded_5_2 = reloaded_0_6()

	reloaded_0_8(arg_5_1, reloaded_5_0, 1024)
	reloaded_0_34(arg_5_0, reloaded_5_0, reloaded_5_1, reloaded_5_2)

	local reloaded_5_3 = tonumber(reloaded_5_1[0])
	local reloaded_5_4 = tonumber(reloaded_5_2[0])

	return reloaded_5_3, reloaded_5_4
end

local reloaded_0_41 = {}

function reloaded_0_0.create_font(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local reloaded_6_0 = 0
	local reloaded_6_1 = type(arg_6_3)

	if reloaded_6_1 == "number" then
		reloaded_6_0 = arg_6_3
	elseif reloaded_6_1 == "table" then
		for iter_6_0 = 1, #arg_6_3 do
			reloaded_6_0 = reloaded_6_0 + arg_6_3[iter_6_0]
		end
	else
		error("invalid flags type, has to be number or table")
	end

	local reloaded_6_2 = string.format("%s\x00%d\x00%d\x00%d", arg_6_0, arg_6_1, arg_6_2, reloaded_6_0)

	if reloaded_0_41[reloaded_6_2] == nil then
		reloaded_0_41[reloaded_6_2] = reloaded_0_32()

		reloaded_0_33(reloaded_0_41[reloaded_6_2], arg_6_0, arg_6_1, arg_6_2, 0, 0, reloaded_0_2.bor(reloaded_6_0), 0, 0)
	end

	return reloaded_0_41[reloaded_6_2]
end

function reloaded_0_0.localize_string(arg_7_0, arg_7_1)
	local reloaded_7_0 = reloaded_0_10(arg_7_0)
	local reloaded_7_1 = reloaded_0_5(arg_7_1 or 1024)

	reloaded_0_9(reloaded_7_0, reloaded_7_1, arg_7_1 or 1024)

	return reloaded_7_1 and reloaded_0_1.string(reloaded_7_1) or nil
end

function reloaded_0_0.draw_text(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5, arg_8_6, arg_8_7)
	reloaded_0_18(arg_8_0, arg_8_1)
	reloaded_0_16(arg_8_6)
	reloaded_0_17(arg_8_2, arg_8_3, arg_8_4, arg_8_5)

	return reloaded_0_39(arg_8_7, false)
end

function reloaded_0_0.draw_localized_text(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6, arg_9_7)
	reloaded_0_18(arg_9_0, arg_9_1)
	reloaded_0_16(arg_9_6)
	reloaded_0_17(arg_9_2, arg_9_3, arg_9_4, arg_9_5)

	local reloaded_9_0 = reloaded_0_10(arg_9_7)

	return reloaded_0_39(reloaded_9_0, true)
end

function reloaded_0_0.draw_line(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6, arg_10_7)
	reloaded_0_11(arg_10_4, arg_10_5, arg_10_6, arg_10_7)

	return reloaded_0_14(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
end

function reloaded_0_0.draw_filled_rect(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6, arg_11_7)
	reloaded_0_11(arg_11_4, arg_11_5, arg_11_6, arg_11_7)

	return reloaded_0_12(arg_11_0, arg_11_1, arg_11_0 + arg_11_2, arg_11_1 + arg_11_3)
end

function reloaded_0_0.draw_outlined_rect(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6, arg_12_7)
	reloaded_0_11(arg_12_4, arg_12_5, arg_12_6, arg_12_7)

	return reloaded_0_13(arg_12_0, arg_12_1, arg_12_0 + arg_12_2, arg_12_1 + arg_12_3)
end

function reloaded_0_0.draw_filled_outlined_rect(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5, arg_13_6, arg_13_7, arg_13_8, arg_13_9, arg_13_10, arg_13_11)
	reloaded_0_11(arg_13_4, arg_13_5, arg_13_6, arg_13_7)
	reloaded_0_12(arg_13_0, arg_13_1, arg_13_0 + arg_13_2, arg_13_1 + arg_13_3)
	reloaded_0_11(arg_13_8, arg_13_9, arg_13_10, arg_13_11)

	return reloaded_0_13(arg_13_0, arg_13_1, arg_13_0 + arg_13_2, arg_13_1 + arg_13_3)
end

function reloaded_0_0.draw_filled_gradient_rect(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4, arg_14_5, arg_14_6, arg_14_7, arg_14_8, arg_14_9, arg_14_10, arg_14_11, arg_14_12)
	reloaded_0_11(arg_14_4, arg_14_5, arg_14_6, arg_14_7)
	reloaded_0_38(arg_14_0, arg_14_1, arg_14_0 + arg_14_2, arg_14_1 + arg_14_3, 255, 255, arg_14_12)
	reloaded_0_11(arg_14_8, arg_14_9, arg_14_10, arg_14_11)

	return reloaded_0_38(arg_14_0, arg_14_1, arg_14_0 + arg_14_2, arg_14_1 + arg_14_3, 0, 255, arg_14_12)
end

function reloaded_0_0.draw_outlined_circle(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5, arg_15_6, arg_15_7)
	reloaded_0_11(arg_15_2, arg_15_3, arg_15_4, arg_15_5)

	return reloaded_0_37(arg_15_0, arg_15_1, arg_15_6, arg_15_7)
end

function reloaded_0_0.draw_poly_line(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5, arg_16_6)
	reloaded_0_11(arg_16_2, arg_16_3, arg_16_4, arg_16_5)

	return reloaded_0_15(reloaded_0_6(arg_16_0), reloaded_0_6(arg_16_1), arg_16_6)
end

function reloaded_0_0.test_font(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5, arg_17_6)
	local reloaded_17_0, reloaded_17_1 = reloaded_0_40(arg_17_6, "a b c d e f g h i j k l m n o p q r s t u v w x y z")

	reloaded_0_0.draw_text(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5, arg_17_6, "a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 \xC3\x9F + # \xC3\xA4 \xC3\xB6 \xC3\xBC , . -")
	reloaded_0_0.draw_text(arg_17_0, arg_17_1 + reloaded_17_1, arg_17_2, arg_17_3, arg_17_4, arg_17_5, arg_17_6, "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z = ! \" \xC2\xA7 $ % & / ( ) = ? { [ ] } \\ * ' _ : ; ~ ")
end

function reloaded_0_0.get_text_size(arg_18_0, arg_18_1)
	return reloaded_0_40(arg_18_0, arg_18_1)
end

function reloaded_0_0.set_mouse_pos(arg_19_0, arg_19_1)
	return reloaded_0_36(arg_19_0, arg_19_1)
end

function reloaded_0_0.get_mouse_pos()
	local reloaded_20_0 = reloaded_0_6()
	local reloaded_20_1 = reloaded_0_6()

	reloaded_0_35(reloaded_20_0, reloaded_20_1)

	local reloaded_20_2 = tonumber(reloaded_20_0[0])
	local reloaded_20_3 = tonumber(reloaded_20_1[0])

	return reloaded_20_2, reloaded_20_3
end

function reloaded_0_0.unlock_cursor()
	return reloaded_0_30()
end

function reloaded_0_0.lock_cursor()
	return reloaded_0_31()
end

function reloaded_0_0.load_texture(arg_23_0)
	local reloaded_23_0 = reloaded_0_29(false)

	reloaded_0_22(reloaded_23_0, arg_23_0, true, true)

	local reloaded_23_1 = reloaded_0_6()
	local reloaded_23_2 = reloaded_0_6()

	reloaded_0_26(reloaded_23_0, reloaded_23_1, reloaded_23_2)

	local reloaded_23_3 = tonumber(reloaded_23_1[0])
	local reloaded_23_4 = tonumber(reloaded_23_2[0])

	return reloaded_23_0, reloaded_23_3, reloaded_23_4
end

setmetatable(reloaded_0_0, {
	__index = renderer
})

return reloaded_0_0
