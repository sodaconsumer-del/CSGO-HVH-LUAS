--by scriptleaks https://discord.gg/kTHUpjVQPV t.me/scriptleakslol

slot_0_0_0 = require("neverlose/base64")
slot_0_1_0 = require("neverlose/clipboard")
slot_0_2_0 = require("neverlose/lagrecord")
slot_0_3_0 = " "
slot_0_4_1 = nil
slot_0_5_2 = 4095
slot_0_6_5 = 3
slot_0_7_5 = 18
slot_0_8_6 = "!"
slot_0_9_7 = 16777216
slot_0_10_8 = 65536
slot_0_11_9 = 256
slot_0_4_0 = {}

function slot_0_12_7(arg_1_0)
	local var_1_0, var_1_1 = pcall(slot_0_0_0.encode, arg_1_0)

	if not var_1_0 or type(var_1_1) ~= "string" or var_1_1 == "" then
		return nil
	end

	return var_1_1
end

function slot_0_13_5(arg_2_0)
	local var_2_0, var_2_1 = pcall(slot_0_0_0.decode, arg_2_0)

	if not var_2_0 or type(var_2_1) ~= "string" or var_2_1 == "" then
		return nil
	end

	return var_2_1
end

function slot_0_14_5(arg_3_0)
	local var_3_0, var_3_1 = pcall(json.parse, arg_3_0)

	if not var_3_0 or type(var_3_1) ~= "table" then
		return nil
	end

	return var_3_1
end

function slot_0_15_5(arg_4_0)
	return slot_0_14_5(arg_4_0)
end

function slot_0_16_5(arg_5_0)
	return string.char(math.floor(arg_5_0 / slot_0_9_7) % 256, math.floor(arg_5_0 / slot_0_10_8) % 256, math.floor(arg_5_0 / slot_0_11_9) % 256, arg_5_0 % 256)
end

function slot_0_17_6(arg_6_0)
	if type(arg_6_0) ~= "string" or #arg_6_0 < 4 then
		return nil
	end

	local var_6_0, var_6_1, var_6_2, var_6_3 = arg_6_0:byte(1, 4)

	if var_6_0 == nil or var_6_1 == nil or var_6_2 == nil or var_6_3 == nil then
		return nil
	end

	return ((var_6_0 * 256 + var_6_1) * 256 + var_6_2) * 256 + var_6_3
end

function slot_0_18_5(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1 - slot_0_5_2

	if var_7_0 < 1 then
		var_7_0 = 1
	end

	local var_7_1 = arg_7_2 - arg_7_1 + 1

	if var_7_1 > slot_0_7_5 then
		var_7_1 = slot_0_7_5
	end

	local var_7_2 = 0
	local var_7_3 = 0

	for iter_7_0 = arg_7_1 - 1, var_7_0, -1 do
		local var_7_4 = 0

		while var_7_4 < var_7_1 do
			if arg_7_0:byte(iter_7_0 + var_7_4) ~= arg_7_0:byte(arg_7_1 + var_7_4) then
				break
			end

			var_7_4 = var_7_4 + 1
		end

		if var_7_4 >= slot_0_6_5 and var_7_3 < var_7_4 then
			var_7_2 = arg_7_1 - iter_7_0
			var_7_3 = var_7_4

			if var_7_4 == var_7_1 then
				break
			end
		end
	end

	return var_7_2, var_7_3
end

function slot_0_19_7(arg_8_0)
	if type(arg_8_0) ~= "string" then
		return nil
	end

	if arg_8_0 == "" then
		return ""
	end

	local var_8_0 = {}
	local var_8_1 = 1
	local var_8_2 = #arg_8_0

	while var_8_1 <= var_8_2 do
		local var_8_3 = #var_8_0 + 1
		local var_8_4 = 0

		var_8_0[var_8_3] = "\x00"

		for iter_8_0 = 0, 7 do
			if var_8_2 < var_8_1 then
				break
			end

			local var_8_5, var_8_6 = slot_0_18_5(arg_8_0, var_8_1, var_8_2)

			if var_8_6 >= slot_0_6_5 then
				local var_8_7 = var_8_5 - 1
				local var_8_8 = math.floor(var_8_7 / 16)
				local var_8_9 = var_8_7 % 16

				var_8_0[#var_8_0 + 1] = string.char(var_8_8, var_8_9 * 16 + (var_8_6 - slot_0_6_5))
				var_8_1 = var_8_1 + var_8_6
			else
				var_8_4 = var_8_4 + 2^iter_8_0
				var_8_0[#var_8_0 + 1] = string.char(arg_8_0:byte(var_8_1))
				var_8_1 = var_8_1 + 1
			end
		end

		var_8_0[var_8_3] = string.char(var_8_4)
	end

	return table.concat(var_8_0)
end

function slot_0_20_7(arg_9_0, arg_9_1)
	return math.floor(arg_9_0 / 2^arg_9_1) % 2 == 1
end

function slot_0_21_7(arg_10_0)
	if type(arg_10_0) ~= "string" then
		return nil
	end

	if arg_10_0 == "" then
		return ""
	end

	local var_10_0 = {}
	local var_10_1 = 0
	local var_10_2 = 1
	local var_10_3 = #arg_10_0

	while var_10_2 <= var_10_3 do
		local var_10_4 = arg_10_0:byte(var_10_2)

		if var_10_4 == nil then
			return nil
		end

		var_10_2 = var_10_2 + 1

		for iter_10_0 = 0, 7 do
			if var_10_3 < var_10_2 then
				break
			end

			if slot_0_20_7(var_10_4, iter_10_0) then
				var_10_1 = var_10_1 + 1
				var_10_0[var_10_1] = arg_10_0:sub(var_10_2, var_10_2)
				var_10_2 = var_10_2 + 1
			else
				local var_10_5 = arg_10_0:byte(var_10_2)
				local var_10_6 = arg_10_0:byte(var_10_2 + 1)

				if var_10_5 == nil or var_10_6 == nil then
					return nil
				end

				var_10_2 = var_10_2 + 2

				local var_10_7 = var_10_5 * 16 + math.floor(var_10_6 / 16) + 1
				local var_10_8 = var_10_6 % 16 + slot_0_6_5
				local var_10_9 = var_10_1 - var_10_7 + 1

				if var_10_9 < 1 then
					return nil
				end

				for iter_10_1 = 0, var_10_8 - 1 do
					local var_10_10 = var_10_0[var_10_9 + iter_10_1]

					if var_10_10 == nil then
						return nil
					end

					var_10_1 = var_10_1 + 1
					var_10_0[var_10_1] = var_10_10
				end
			end
		end
	end

	return table.concat(var_10_0, "", 1, var_10_1)
end

function slot_0_22_7(arg_11_0)
	local var_11_0 = slot_0_13_5(arg_11_0)

	if var_11_0 == nil or #var_11_0 < 5 then
		return nil
	end

	local var_11_1 = slot_0_17_6(var_11_0)

	if type(var_11_1) ~= "number" then
		return nil
	end

	local var_11_2 = slot_0_21_7(var_11_0:sub(5))

	if type(var_11_2) ~= "string" then
		return nil
	end

	if #var_11_2 ~= var_11_1 then
		return nil
	end

	return slot_0_15_5(var_11_2)
end

function slot_0_4_0.encode(arg_12_0)
	if type(arg_12_0) ~= "table" then
		return nil
	end

	local var_12_0, var_12_1 = pcall(json.stringify, arg_12_0)

	if not var_12_0 or type(var_12_1) ~= "string" or var_12_1 == "" then
		return nil
	end

	local var_12_2 = slot_0_12_7(var_12_1)

	if var_12_2 == nil then
		return nil
	end

	local var_12_3 = slot_0_19_7(var_12_1)

	if type(var_12_3) == "string" and var_12_3 ~= "" then
		local var_12_4 = slot_0_16_5(#var_12_1) .. var_12_3
		local var_12_5 = slot_0_12_7(var_12_4)

		if var_12_5 ~= nil and #var_12_5 + 1 < #var_12_2 then
			return slot_0_8_6 .. var_12_5
		end
	end

	return var_12_2
end

function slot_0_4_0.decode(arg_13_0)
	if type(arg_13_0) ~= "string" or arg_13_0 == "" then
		return nil
	end

	if arg_13_0:sub(1, 1) == slot_0_8_6 then
		return slot_0_22_7(arg_13_0:sub(2))
	end

	local var_13_0 = slot_0_13_5(arg_13_0)

	if var_13_0 == nil then
		return nil
	end

	return slot_0_15_5(var_13_0)
end

slot_0_5_1 = nil
slot_0_5_0 = {}
slot_0_6_4 = color()
slot_0_7_4 = 0.4
slot_0_8_5 = 1
slot_0_9_6 = 3
slot_0_10_7 = math.pi * 2
slot_0_11_8 = {}
slot_0_12_6 = {}

function slot_0_13_4(arg_14_0)
	local var_14_0 = slot_0_11_8[arg_14_0]

	if var_14_0 then
		return var_14_0
	end

	local var_14_1 = {}

	for iter_14_0 in arg_14_0:gmatch("[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_14_1[#var_14_1 + 1] = iter_14_0
	end

	slot_0_11_8[arg_14_0] = var_14_1

	return var_14_1
end

function slot_0_14_4(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5)
	local var_15_0 = arg_15_3 + (arg_15_5 - 1) * arg_15_4 * math.pi
	local var_15_1 = (math.sin(var_15_0) + 1) * 0.5
	local var_15_2 = slot_0_7_4 + (slot_0_8_5 - slot_0_7_4) * var_15_1

	return arg_15_0:as_hsv(arg_15_1, arg_15_2, var_15_2, 1)
end

function slot_0_5_0.wave(arg_16_0, arg_16_1)
	if arg_16_0 == nil then
		return ""
	end

	if arg_16_0 == "" then
		return ""
	end

	local var_16_0, var_16_1 = arg_16_1:to_hsv()
	local var_16_2 = slot_0_13_4(arg_16_0)
	local var_16_3 = #var_16_2
	local var_16_4 = slot_0_12_6
	local var_16_5 = globals.realtime / slot_0_9_6 * slot_0_10_7
	local var_16_6 = 1 / var_16_3

	for iter_16_0 = 1, var_16_3 do
		var_16_4[iter_16_0] = "\a" .. slot_0_14_4(slot_0_6_4, var_16_0, var_16_1, var_16_5, var_16_6, iter_16_0):to_hex() .. var_16_2[iter_16_0]
	end

	for iter_16_1 = var_16_3 + 1, #var_16_4 do
		var_16_4[iter_16_1] = nil
	end

	return table.concat(var_16_4, "", 1, var_16_3)
end

slot_0_6_3 = "Andromeda"
slot_0_7_3 = "link"
slot_0_8_4 = #slot_0_6_3 + 1
slot_0_9_5 = {}

function slot_0_10_6(arg_17_0, arg_17_1)
	local var_17_0 = globals.realtime * (arg_17_1 or 1) % math.pi

	return math.abs(math.sin(var_17_0 + (arg_17_0 or 0)))
end

function slot_0_11_7()
	if ui.get_alpha() <= 0 then
		return
	end

	local var_18_0 = ui.get_style("Text Preview")
	local var_18_1 = ui.get_style("Link Active")

	if var_18_0 == nil or var_18_1 == nil then
		ui.sidebar(slot_0_6_3, slot_0_7_3)

		return
	end

	for iter_18_0 = 1, slot_0_8_4 do
		local var_18_2 = slot_0_6_3:sub(iter_18_0, iter_18_0)
		local var_18_3 = (iter_18_0 - 1) / slot_0_8_4
		local var_18_4 = var_18_1:lerp(var_18_0, slot_0_10_6(var_18_3 * 1.5, 1.5)):to_hex()

		slot_0_9_5[iter_18_0] = string.format("\a%s%s", var_18_4, var_18_2)
	end

	ui.sidebar(table.concat(slot_0_9_5), slot_0_7_3)
end

events.render(slot_0_11_7, true)

slot_0_6_2 = {}
slot_0_4_0.gdi_font_api = slot_0_6_2
slot_0_7_2 = nil
slot_0_8_3 = nil
slot_0_9_4 = false
slot_0_10_5 = 4
slot_0_11_6 = 1
slot_0_12_5 = 31
slot_0_13_3 = 2
slot_0_14_3 = 2
slot_0_15_4 = -32
slot_0_16_4 = 32
slot_0_17_5 = 128
slot_0_18_4 = 256
slot_0_19_6 = 30
slot_0_20_6 = 60
slot_0_21_6 = {
	quality = 6,
	outline = false,
	shadow = false,
	strike_out = false,
	underline = false,
	italic = false,
	weight_name = "700 Bold",
	weight = 700,
	spacing = 0,
	face = "Calibri",
	size = 24
}

function slot_0_22_6(arg_19_0)
	local var_19_0 = tonumber(arg_19_0)

	if type(var_19_0) ~= "number" then
		return slot_0_21_6.weight_name
	end

	local var_19_1 = math.floor(var_19_0 / 100)

	if var_19_1 == 1 then
		return "100 Thin"
	elseif var_19_1 == 2 then
		return "200 Extra Light"
	elseif var_19_1 == 3 then
		return "300 Light"
	elseif var_19_1 == 4 then
		return "400 Regular"
	elseif var_19_1 == 5 then
		return "500 Medium"
	elseif var_19_1 == 6 then
		return "600 Semi Bold"
	elseif var_19_1 == 7 then
		return "700 Bold"
	elseif var_19_1 == 8 then
		return "800 Extra Bold"
	elseif var_19_1 == 9 then
		return "900 Black"
	end

	return slot_0_21_6.weight_name
end

slot_0_23_7 = {}
slot_0_23_7.__index = slot_0_23_7

function slot_0_24_6()
	if slot_0_7_2 == nil then
		slot_0_7_2 = require("ffi")
	end

	if slot_0_8_3 == nil then
		slot_0_8_3 = slot_0_7_2.load("gdi32")
	end

	if slot_0_9_4 ~= true then
		pcall(slot_0_7_2.cdef, "                typedef void* HANDLE;\n                typedef HANDLE HGDIOBJ;\n                typedef HANDLE HBITMAP;\n                typedef HANDLE HDC;\n                typedef HANDLE HFONT;\n                typedef unsigned char BYTE;\n                typedef unsigned short WORD;\n                typedef unsigned int UINT;\n                typedef unsigned long DWORD;\n                typedef long LONG;\n                typedef int BOOL;\n                typedef const wchar_t* LPCWSTR;\n\n                typedef struct tagSIZE {\n                    LONG cx;\n                    LONG cy;\n                } SIZE;\n\n                typedef struct tagTEXTMETRICW {\n                    LONG tmHeight;\n                    LONG tmAscent;\n                    LONG tmDescent;\n                    LONG tmInternalLeading;\n                    LONG tmExternalLeading;\n                    LONG tmAveCharWidth;\n                    LONG tmMaxCharWidth;\n                    LONG tmWeight;\n                    LONG tmOverhang;\n                    LONG tmDigitizedAspectX;\n                    LONG tmDigitizedAspectY;\n                    wchar_t tmFirstChar;\n                    wchar_t tmLastChar;\n                    wchar_t tmDefaultChar;\n                    wchar_t tmBreakChar;\n                    BYTE tmItalic;\n                    BYTE tmUnderlined;\n                    BYTE tmStruckOut;\n                    BYTE tmPitchAndFamily;\n                    BYTE tmCharSet;\n                } TEXTMETRICW;\n\n                typedef struct tagBITMAPINFOHEADER {\n                    DWORD biSize;\n                    LONG biWidth;\n                    LONG biHeight;\n                    WORD biPlanes;\n                    WORD biBitCount;\n                    DWORD biCompression;\n                    DWORD biSizeImage;\n                    LONG biXPelsPerMeter;\n                    LONG biYPelsPerMeter;\n                    DWORD biClrUsed;\n                    DWORD biClrImportant;\n                } BITMAPINFOHEADER;\n\n                typedef struct tagRGBQUAD {\n                    BYTE rgbBlue;\n                    BYTE rgbGreen;\n                    BYTE rgbRed;\n                    BYTE rgbReserved;\n                } RGBQUAD;\n\n                typedef struct tagBITMAPINFO {\n                    BITMAPINFOHEADER bmiHeader;\n                    RGBQUAD bmiColors[1];\n                } BITMAPINFO;\n\n                typedef struct tagLOGFONTW {\n                    LONG lfHeight;\n                    LONG lfWidth;\n                    LONG lfEscapement;\n                    LONG lfOrientation;\n                    LONG lfWeight;\n                    BYTE lfItalic;\n                    BYTE lfUnderline;\n                    BYTE lfStrikeOut;\n                    BYTE lfCharSet;\n                    BYTE lfOutPrecision;\n                    BYTE lfClipPrecision;\n                    BYTE lfQuality;\n                    BYTE lfPitchAndFamily;\n                    wchar_t lfFaceName[32];\n                } LOGFONTW;\n\n                HDC CreateCompatibleDC(HDC hdc);\n                BOOL DeleteDC(HDC hdc);\n                BOOL DeleteObject(HGDIOBJ hObject);\n                HGDIOBJ SelectObject(HDC hdc, HGDIOBJ h);\n                DWORD SetTextColor(HDC hdc, DWORD colorref);\n                int SetBkMode(HDC hdc, int mode);\n                BOOL GetTextExtentPoint32W(HDC hdc, LPCWSTR lpString, int c, SIZE* psizl);\n                BOOL GetTextMetricsW(HDC hdc, TEXTMETRICW* lptm);\n                BOOL TextOutW(HDC hdc, int x, int y, LPCWSTR lpString, int c);\n                HFONT CreateFontIndirectW(const LOGFONTW* lplf);\n                HBITMAP CreateDIBSection(HDC hdc, const BITMAPINFO* pbmi, UINT usage, void** ppvBits, HANDLE hSection, DWORD offset);\n                BOOL GdiFlush(void);\n            ")

		slot_0_9_4 = true
	end

	return slot_0_7_2, slot_0_8_3
end

function slot_0_25_6(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0 < arg_21_1 then
		return arg_21_1
	end

	if arg_21_2 < arg_21_0 then
		return arg_21_2
	end

	return arg_21_0
end

function slot_0_26_8(arg_22_0)
	if type(arg_22_0) ~= "string" then
		return ""
	end

	return arg_22_0:match("^%s*(.-)%s*$")
end

function slot_0_27_10(arg_23_0)
	if arg_23_0 >= 0 then
		return math.floor(arg_23_0 + 0.5)
	end

	return math.ceil(arg_23_0 - 0.5)
end

function slot_0_28_9(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_2 <= 65535 then
		arg_24_0[arg_24_1] = arg_24_2

		return arg_24_1 + 1
	end

	arg_24_2 = arg_24_2 - 65536
	arg_24_0[arg_24_1] = 55296 + math.floor(arg_24_2 / 1024)
	arg_24_0[arg_24_1 + 1] = 56320 + arg_24_2 % 1024

	return arg_24_1 + 2
end

function slot_0_29_10(arg_25_0)
	return arg_25_0 ~= nil and arg_25_0 >= 128 and arg_25_0 < 192
end

function slot_0_30_13(arg_26_0)
	local var_26_0 = slot_0_24_6()
	local var_26_1 = #arg_26_0
	local var_26_2 = var_26_0.new("wchar_t[?]", var_26_1 + 1)
	local var_26_3 = 0
	local var_26_4 = 1

	while var_26_4 <= var_26_1 do
		local var_26_5 = arg_26_0:byte(var_26_4)
		local var_26_6 = 63
		local var_26_7 = 1

		if var_26_5 < 128 then
			var_26_6 = var_26_5
		elseif var_26_5 >= 194 and var_26_5 < 224 then
			local var_26_8 = arg_26_0:byte(var_26_4 + 1)

			if slot_0_29_10(var_26_8) then
				var_26_6 = (var_26_5 - 192) * 64 + (var_26_8 - 128)
				var_26_7 = 2
			end
		elseif var_26_5 >= 224 and var_26_5 < 240 then
			local var_26_9 = arg_26_0:byte(var_26_4 + 1)
			local var_26_10 = arg_26_0:byte(var_26_4 + 2)

			if slot_0_29_10(var_26_9) and (var_26_5 ~= 224 or not (var_26_9 < 160)) and (var_26_5 ~= 237 or not (var_26_9 >= 160)) and slot_0_29_10(var_26_10) then
				var_26_6 = (var_26_5 - 224) * 4096 + (var_26_9 - 128) * 64 + (var_26_10 - 128)
				var_26_7 = 3
			end
		elseif var_26_5 >= 240 and var_26_5 < 245 then
			local var_26_11 = arg_26_0:byte(var_26_4 + 1)
			local var_26_12 = arg_26_0:byte(var_26_4 + 2)
			local var_26_13 = arg_26_0:byte(var_26_4 + 3)

			if slot_0_29_10(var_26_11) and (var_26_5 ~= 240 or not (var_26_11 < 144)) and (var_26_5 ~= 244 or not (var_26_11 >= 144)) and slot_0_29_10(var_26_12) and slot_0_29_10(var_26_13) then
				var_26_6 = (var_26_5 - 240) * 262144 + (var_26_11 - 128) * 4096 + (var_26_12 - 128) * 64 + (var_26_13 - 128)
				var_26_7 = 4
			end
		end

		var_26_3 = slot_0_28_9(var_26_2, var_26_3, var_26_6)
		var_26_4 = var_26_4 + var_26_7
	end

	return var_26_2, var_26_3
end

function slot_0_31_16(arg_27_0, arg_27_1)
	local var_27_0 = slot_0_24_6()
	local var_27_1 = var_27_0.new("BITMAPINFO[1]")

	var_27_1[0].bmiHeader.biSize = var_27_0.sizeof("BITMAPINFOHEADER")
	var_27_1[0].bmiHeader.biWidth = arg_27_0
	var_27_1[0].bmiHeader.biHeight = -arg_27_1
	var_27_1[0].bmiHeader.biPlanes = 1
	var_27_1[0].bmiHeader.biBitCount = 32
	var_27_1[0].bmiHeader.biCompression = 0
	var_27_1[0].bmiHeader.biSizeImage = arg_27_0 * arg_27_1 * 4

	return var_27_1
end

function slot_0_32_15(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = slot_0_24_6()
	local var_28_1 = var_28_0.cast("uint8_t*", arg_28_0)
	local var_28_2 = arg_28_1 * arg_28_2
	local var_28_3 = var_28_0.new("uint8_t[?]", var_28_2 * 4)

	for iter_28_0 = 0, var_28_2 - 1 do
		local var_28_4 = iter_28_0 * 4
		local var_28_5 = iter_28_0 * 4

		var_28_3[var_28_5] = 255
		var_28_3[var_28_5 + 1] = 255
		var_28_3[var_28_5 + 2] = 255
		var_28_3[var_28_5 + 3] = var_28_1[var_28_4 + 1]
	end

	return var_28_0.string(var_28_3, var_28_2 * 4)
end

function slot_0_33_12(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:byte(arg_29_1)

	if var_29_0 == nil then
		return arg_29_1
	end

	if var_29_0 < 128 then
		return arg_29_1
	end

	if var_29_0 >= 194 and var_29_0 < 224 then
		local var_29_1 = arg_29_0:byte(arg_29_1 + 1)

		if slot_0_29_10(var_29_1) then
			return arg_29_1 + 1
		end

		return arg_29_1
	end

	if var_29_0 >= 224 and var_29_0 < 240 then
		local var_29_2 = arg_29_0:byte(arg_29_1 + 1)
		local var_29_3 = arg_29_0:byte(arg_29_1 + 2)

		if slot_0_29_10(var_29_2) and (var_29_0 ~= 224 or not (var_29_2 < 160)) and (var_29_0 ~= 237 or not (var_29_2 >= 160)) and slot_0_29_10(var_29_3) then
			return arg_29_1 + 2
		end

		return arg_29_1
	end

	if var_29_0 >= 240 and var_29_0 < 245 then
		local var_29_4 = arg_29_0:byte(arg_29_1 + 1)
		local var_29_5 = arg_29_0:byte(arg_29_1 + 2)
		local var_29_6 = arg_29_0:byte(arg_29_1 + 3)

		if slot_0_29_10(var_29_4) and (var_29_0 ~= 240 or not (var_29_4 < 144)) and (var_29_0 ~= 244 or not (var_29_4 >= 144)) and slot_0_29_10(var_29_5) and slot_0_29_10(var_29_6) then
			return arg_29_1 + 3
		end
	end

	return arg_29_1
end

function slot_0_34_10(arg_30_0)
	local var_30_0 = slot_0_21_6.weight

	if type(arg_30_0) == "number" then
		var_30_0 = arg_30_0
	end

	local var_30_1 = slot_0_25_6(slot_0_27_10(var_30_0), 100, 900)

	return slot_0_25_6(slot_0_27_10(var_30_1 / 100) * 100, 100, 900)
end

function slot_0_35_10(arg_31_0)
	return slot_0_22_6(slot_0_34_10(arg_31_0))
end

function slot_0_36_10(arg_32_0)
	if type(arg_32_0) ~= "string" then
		return nil
	end

	local var_32_0 = slot_0_26_8(arg_32_0)
	local var_32_1 = tonumber(var_32_0:match("^(%d+)"))

	if type(var_32_1) ~= "number" then
		return nil
	end

	local var_32_2 = slot_0_34_10(var_32_1)

	if slot_0_22_6(var_32_2) ~= var_32_0 then
		return nil
	end

	return var_32_2
end

function slot_0_37_10(arg_33_0)
	local var_33_0 = {
		face = slot_0_21_6.face,
		size = slot_0_21_6.size,
		spacing = slot_0_21_6.spacing,
		weight = slot_0_21_6.weight,
		italic = slot_0_21_6.italic,
		underline = slot_0_21_6.underline,
		strike_out = slot_0_21_6.strike_out,
		shadow = slot_0_21_6.shadow,
		outline = slot_0_21_6.outline,
		quality = slot_0_21_6.quality
	}

	if type(arg_33_0) == "table" then
		local var_33_1 = slot_0_26_8(arg_33_0.face)

		if var_33_1 ~= "" then
			var_33_0.face = var_33_1
		end

		if type(arg_33_0.size) == "number" then
			var_33_0.size = slot_0_25_6(slot_0_27_10(arg_33_0.size), 1, 128)
		end

		if type(arg_33_0.spacing) == "number" then
			var_33_0.spacing = slot_0_25_6(slot_0_27_10(arg_33_0.spacing), slot_0_15_4, slot_0_16_4)
		end

		local var_33_2 = slot_0_36_10(arg_33_0.weight_name)

		if var_33_2 ~= nil then
			var_33_0.weight = var_33_2
		elseif type(arg_33_0.weight) == "number" then
			var_33_0.weight = slot_0_34_10(arg_33_0.weight)
		end

		if type(arg_33_0.italic) == "boolean" then
			var_33_0.italic = arg_33_0.italic
		end

		if type(arg_33_0.underline) == "boolean" then
			var_33_0.underline = arg_33_0.underline
		end

		if type(arg_33_0.strike_out) == "boolean" then
			var_33_0.strike_out = arg_33_0.strike_out
		end

		if type(arg_33_0.shadow) == "boolean" then
			var_33_0.shadow = arg_33_0.shadow
		end

		if type(arg_33_0.outline) == "boolean" then
			var_33_0.outline = arg_33_0.outline
		end

		if type(arg_33_0.quality) == "number" then
			var_33_0.quality = slot_0_25_6(slot_0_27_10(arg_33_0.quality), 0, 255)
		end
	end

	var_33_0.weight_name = slot_0_35_10(var_33_0.weight)

	return var_33_0
end

function slot_0_38_9(arg_34_0)
	local var_34_0 = slot_0_37_10(arg_34_0)

	return table.concat({
		var_34_0.face,
		tostring(var_34_0.size),
		tostring(var_34_0.spacing),
		tostring(var_34_0.weight),
		var_34_0.italic and "1" or "0",
		var_34_0.underline and "1" or "0",
		var_34_0.strike_out and "1" or "0",
		var_34_0.shadow and "1" or "0",
		var_34_0.outline and "1" or "0",
		tostring(var_34_0.quality)
	}, "|")
end

function slot_0_39_9(arg_35_0)
	for iter_35_0 in pairs(arg_35_0.text_cache) do
		arg_35_0.text_cache[iter_35_0] = nil
	end

	arg_35_0.font_handle = nil
	arg_35_0.cached_glyph_count = 0
end

function slot_0_40_10(arg_36_0)
	local var_36_0, var_36_1 = slot_0_24_6()
	local var_36_2 = var_36_0.new("LOGFONTW[1]")
	local var_36_3 = arg_36_0.settings
	local var_36_4, var_36_5 = slot_0_30_13(var_36_3.face or "")
	local var_36_6 = math.min(slot_0_12_5, var_36_5)

	var_36_2[0].lfHeight = -var_36_3.size
	var_36_2[0].lfWeight = var_36_3.weight
	var_36_2[0].lfItalic = var_36_3.italic and 1 or 0
	var_36_2[0].lfUnderline = var_36_3.underline and 1 or 0
	var_36_2[0].lfStrikeOut = var_36_3.strike_out and 1 or 0
	var_36_2[0].lfCharSet = slot_0_11_6
	var_36_2[0].lfQuality = var_36_3.quality

	if var_36_6 > 0 then
		var_36_0.copy(var_36_2[0].lfFaceName, var_36_4, var_36_6 * var_36_0.sizeof("wchar_t"))
	end

	local var_36_7 = var_36_1.CreateFontIndirectW(var_36_2)

	if var_36_7 == nil or var_36_7 == var_36_0.NULL then
		return nil
	end

	return var_36_0.gc(var_36_7, var_36_1.DeleteObject)
end

function slot_0_41_9(arg_37_0)
	if arg_37_0.font_handle == nil then
		arg_37_0.font_handle = slot_0_40_10(arg_37_0)
	end

	return arg_37_0.font_handle
end

function slot_0_42_9(arg_38_0, arg_38_1)
	local var_38_0, var_38_1 = slot_0_24_6()
	local var_38_2 = slot_0_41_9(arg_38_0)

	if var_38_2 == nil then
		return nil
	end

	local var_38_3, var_38_4 = slot_0_30_13(arg_38_1)
	local var_38_5 = var_38_1.CreateCompatibleDC(nil)

	if var_38_5 == nil or var_38_5 == var_38_0.NULL then
		return nil
	end

	local var_38_6 = var_38_1.SelectObject(var_38_5, var_38_2)
	local var_38_7 = var_38_0.new("SIZE[1]")
	local var_38_8 = var_38_0.new("TEXTMETRICW[1]")
	local var_38_9 = var_38_1.GetTextExtentPoint32W(var_38_5, var_38_3, var_38_4, var_38_7) ~= 0
	local var_38_10 = var_38_1.GetTextMetricsW(var_38_5, var_38_8) ~= 0
	local var_38_11 = var_38_9 and math.max(1, var_38_7[0].cx) or 1
	local var_38_12 = var_38_10 and math.max(1, var_38_8[0].tmHeight) or 1
	local var_38_13 = var_38_11 + slot_0_13_3 * 2
	local var_38_14 = var_38_12 + slot_0_14_3 * 2
	local var_38_15 = slot_0_31_16(var_38_13, var_38_14)
	local var_38_16 = var_38_0.new("void*[1]")
	local var_38_17 = var_38_1.CreateDIBSection(var_38_5, var_38_15, 0, var_38_16, nil, 0)

	if var_38_17 == nil or var_38_17 == var_38_0.NULL or var_38_16[0] == nil or var_38_16[0] == var_38_0.NULL then
		var_38_1.SelectObject(var_38_5, var_38_6)
		var_38_1.DeleteDC(var_38_5)

		return nil
	end

	local var_38_18 = var_38_1.SelectObject(var_38_5, var_38_17)

	var_38_1.SetBkMode(var_38_5, 1)
	var_38_1.SetTextColor(var_38_5, 16777215)
	var_38_0.fill(var_38_16[0], var_38_13 * var_38_14 * 4, 0)
	var_38_1.TextOutW(var_38_5, slot_0_13_3, slot_0_14_3, var_38_3, var_38_4)
	var_38_1.GdiFlush()

	local var_38_19 = render.load_image_rgba(slot_0_32_15(var_38_16[0], var_38_13, var_38_14), vector(var_38_13, var_38_14, 0))

	var_38_1.SelectObject(var_38_5, var_38_18)
	var_38_1.SelectObject(var_38_5, var_38_6)
	var_38_1.DeleteObject(var_38_17)
	var_38_1.DeleteDC(var_38_5)

	if var_38_19 == nil then
		return nil
	end

	return {
		texture = var_38_19,
		draw_size = vector(var_38_13, var_38_14, 0),
		layout_size = vector(var_38_11, var_38_12, 0),
		last_used_frame = arg_38_0.frame_id,
		pad_x = slot_0_13_3,
		pad_y = slot_0_14_3
	}
end

function slot_0_43_8(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.text_cache[arg_39_1]

	if var_39_0 == nil then
		if arg_39_0.cached_glyph_count >= slot_0_18_4 then
			slot_0_39_9(arg_39_0)
		end

		var_39_0 = slot_0_42_9(arg_39_0, arg_39_1)

		if var_39_0 == nil then
			return nil
		end

		arg_39_0.text_cache[arg_39_1] = var_39_0
		arg_39_0.cached_glyph_count = arg_39_0.cached_glyph_count + 1
	end

	var_39_0.last_used_frame = arg_39_0.frame_id

	return var_39_0
end

function slot_0_44_8(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	local var_40_0 = vector(math.max(1, arg_40_1.draw_size.x * arg_40_4), math.max(1, arg_40_1.draw_size.y * arg_40_4), 0)
	local var_40_1 = arg_40_0.settings
	local var_40_2 = arg_40_3.a or 255

	if var_40_1.outline == true then
		local var_40_3 = color(1, 1, 1, var_40_2)

		render.texture(arg_40_1.texture, arg_40_2 + vector(-1, 0, 0), var_40_0, var_40_3)
		render.texture(arg_40_1.texture, arg_40_2 + vector(1, 0, 0), var_40_0, var_40_3)
		render.texture(arg_40_1.texture, arg_40_2 + vector(0, -1, 0), var_40_0, var_40_3)
		render.texture(arg_40_1.texture, arg_40_2 + vector(0, 1, 0), var_40_0, var_40_3)
	end

	if var_40_1.shadow == true then
		local var_40_4 = arg_40_0.shadow_alpha

		if var_40_4 <= 0 then
			var_40_4 = slot_0_17_5
		end

		local var_40_5 = color(1, 1, 1, math.min(var_40_2, var_40_4))

		render.texture(arg_40_1.texture, arg_40_2 + vector(1, 1, 0), var_40_0, var_40_5)
	end

	render.texture(arg_40_1.texture, arg_40_2, var_40_0, arg_40_3)
end

function slot_0_23_7.get_spacing(arg_41_0)
	return arg_41_0.settings.spacing or 0
end

function slot_0_23_7.set_frame_id(arg_42_0, arg_42_1)
	if type(arg_42_1) == "number" then
		arg_42_0.frame_id = arg_42_1
	else
		arg_42_0.frame_id = arg_42_0.frame_id + 1
	end

	arg_42_0:purge_cache()
end

function slot_0_23_7.purge_cache(arg_43_0)
	if arg_43_0.frame_id % slot_0_19_6 ~= 0 then
		return
	end

	for iter_43_0, iter_43_1 in pairs(arg_43_0.text_cache) do
		if arg_43_0.frame_id - (iter_43_1.last_used_frame or 0) > slot_0_20_6 then
			arg_43_0.text_cache[iter_43_0] = nil
		end
	end
end

function slot_0_23_7.measure_layout(arg_44_0, arg_44_1)
	if type(arg_44_1) ~= "string" then
		arg_44_1 = tostring(arg_44_1 or "")
	end

	local var_44_0 = #arg_44_1

	if var_44_0 == 0 then
		return render.measure_text(arg_44_0.fallback_font, nil, arg_44_1)
	end

	local var_44_1 = 0
	local var_44_2 = 0
	local var_44_3 = arg_44_0:get_spacing()
	local var_44_4 = false
	local var_44_5 = 1

	while var_44_5 <= var_44_0 do
		local var_44_6 = slot_0_33_12(arg_44_1, var_44_5)
		local var_44_7 = arg_44_1:sub(var_44_5, var_44_6)
		local var_44_8 = slot_0_43_8(arg_44_0, var_44_7)

		if var_44_8 == nil then
			return render.measure_text(arg_44_0.fallback_font, nil, arg_44_1)
		end

		if var_44_4 == true then
			var_44_1 = var_44_1 + var_44_3
		end

		var_44_1 = var_44_1 + var_44_8.layout_size.x
		var_44_2 = math.max(var_44_2, var_44_8.layout_size.y)
		var_44_4 = true
		var_44_5 = var_44_6 + 1
	end

	return vector(math.max(1, var_44_1), var_44_2, 0)
end

function slot_0_23_7.measure_draw(arg_45_0, arg_45_1)
	if type(arg_45_1) ~= "string" then
		arg_45_1 = tostring(arg_45_1 or "")
	end

	local var_45_0 = #arg_45_1

	if var_45_0 == 0 then
		return arg_45_0:measure_layout(arg_45_1)
	end

	local var_45_1 = 0
	local var_45_2 = 0
	local var_45_3 = arg_45_0:get_spacing()
	local var_45_4 = false
	local var_45_5 = 1

	while var_45_5 <= var_45_0 do
		local var_45_6 = slot_0_33_12(arg_45_1, var_45_5)
		local var_45_7 = arg_45_1:sub(var_45_5, var_45_6)
		local var_45_8 = slot_0_43_8(arg_45_0, var_45_7)

		if var_45_8 == nil then
			return arg_45_0:measure_layout(arg_45_1)
		end

		if var_45_4 == true then
			var_45_1 = var_45_1 + var_45_3
		end

		var_45_1 = var_45_1 + var_45_8.layout_size.x
		var_45_2 = math.max(var_45_2, var_45_8.draw_size.y)
		var_45_4 = true
		var_45_5 = var_45_6 + 1
	end

	return vector(math.max(1, var_45_1 + slot_0_13_3 * 2), var_45_2, 0)
end

function slot_0_23_7.draw_text(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	if type(arg_46_3) ~= "string" then
		arg_46_3 = tostring(arg_46_3 or "")
	end

	local var_46_0 = arg_46_4 or 1

	if var_46_0 <= 0 then
		return
	end

	local var_46_1 = arg_46_0:measure_draw(arg_46_3)
	local var_46_2 = vector((var_46_1.x - var_46_1.x * var_46_0) * 0.5, (var_46_1.y - var_46_1.y * var_46_0) * 0.5, 0)
	local var_46_3 = arg_46_1.x + var_46_2.x
	local var_46_4 = arg_46_1.y + var_46_2.y
	local var_46_5 = arg_46_0:get_spacing()
	local var_46_6 = false
	local var_46_7 = 1
	local var_46_8 = #arg_46_3

	while var_46_7 <= var_46_8 do
		local var_46_9 = slot_0_33_12(arg_46_3, var_46_7)
		local var_46_10 = arg_46_3:sub(var_46_7, var_46_9)
		local var_46_11 = slot_0_43_8(arg_46_0, var_46_10)

		if var_46_11 == nil then
			local var_46_12 = math.min(arg_46_2.a or 255, arg_46_0.shadow_alpha)

			render.text(arg_46_0.fallback_font, arg_46_1 + vector(1, 1, 0), color(0, 0, 0, var_46_12), "", arg_46_3)
			render.text(arg_46_0.fallback_font, arg_46_1, arg_46_2, "", arg_46_3)

			return
		end

		if var_46_6 == true then
			var_46_3 = var_46_3 + var_46_5 * var_46_0
		end

		slot_0_44_8(arg_46_0, var_46_11, vector(var_46_3 - var_46_11.pad_x * var_46_0, var_46_4, 0), arg_46_2, var_46_0)

		var_46_3 = var_46_3 + var_46_11.layout_size.x * var_46_0
		var_46_6 = true
		var_46_7 = var_46_9 + 1
	end
end

function slot_0_6_2.new_renderer(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = slot_0_37_10(arg_47_0)

	return setmetatable({
		frame_id = 0,
		cached_glyph_count = 0,
		settings = var_47_0,
		signature = slot_0_38_9(var_47_0),
		fallback_font = type(arg_47_1) == "number" and arg_47_1 or slot_0_10_5,
		shadow_alpha = type(arg_47_2) == "number" and arg_47_2 or slot_0_17_5,
		text_cache = {}
	}, slot_0_23_7)
end

slot_0_6_1 = nil
slot_0_7_1 = nil
slot_0_9_3 = "Р Р†Р С“РЎвЂќР вЂєРЎв„ўР Р†РІР‚в„–РІР‚В Р С—Р вЂ¦Р Р‹Р вЂ™Р’В°Р Р†РЎС™Р’В©Р Р†РІР‚С™Р вЂ° andromeda Р Р†РІР‚С™Р вЂ°Р Р†РЎС™Р’В©Р вЂ™Р’В°Р С—Р вЂ¦Р Р‹Р Р†РІР‚в„–РІР‚В Р вЂєРЎв„ўР Р†Р С“РЎвЂќ"
slot_0_8_2 = "andromeda"
slot_0_10_4 = 1
slot_0_11_5 = 1
slot_0_12_4 = 4
slot_0_13_2 = {
	"Default",
	"Small",
	"Console",
	"Bold"
}
slot_0_14_2 = 0.016666666666666666
slot_0_15_3 = "wmapi:"
slot_0_16_3 = "wm:"
slot_0_17_4 = 1
slot_0_18_3 = 2
slot_0_19_5 = 8
slot_0_20_5 = 0.5
slot_0_21_5 = 0.98
slot_0_22_5 = slot_0_8_2
slot_0_7_0 = {}
slot_0_23_6 = {
	last_measure_padding_x = 0,
	last_measure_padding_y = 0,
	last_measure_use_glyph_render = false,
	last_measure_cached_width = 0,
	bounds_max_y = 0,
	bounds_max_x = 0,
	bounds_min_y = 0,
	bounds_min_x = 0,
	text_size_y = 0,
	text_size_x = 0,
	was_right_down = false,
	was_left_down = false,
	drag_offset_y = 0,
	drag_offset_x = 0,
	dragging = false,
	hovered = false,
	callbacks_registered = false,
	hover_font_cycle_enabled = true,
	font_index = slot_0_10_4
}
slot_0_24_5 = {}
slot_0_25_5 = nil
slot_0_26_7 = {
	font_signature = "",
	use_text_runs = false,
	use_glyph_render = false,
	next_animated_update = 0,
	render_text = "",
	style_hex = "",
	uppercase_mode = false,
	measure_text = "",
	glyph_base_height = 0,
	glyph_base_width = 0,
	glyph_entry_count = 0,
	glyph_entries = {}
}
slot_0_27_9 = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"J",
	"K",
	"L",
	"M",
	"N",
	"P",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"2",
	"3",
	"4",
	"5",
	"7",
	"8",
	"9",
	"#",
	"$",
	"%",
	"&",
	"*",
	"+",
	"?",
	"@"
}
slot_0_28_8 = #slot_0_27_9
slot_0_29_9 = {
	1,
	1,
	0.95,
	0.86,
	0.72
}
slot_0_30_12 = {
	1,
	0.72,
	0.42,
	0.24,
	0.12
}
slot_0_31_15 = {
	0,
	0.5,
	0.25,
	0.75,
	0.125
}
slot_0_32_14 = 320
slot_0_33_11 = {}
slot_0_34_9 = {}
slot_0_35_9 = {}
slot_0_36_9 = {
	total_length = 0,
	samples = {}
}
slot_0_37_9 = nil
slot_0_38_8 = nil
slot_0_39_8 = nil
slot_0_40_9 = nil
slot_0_41_8 = nil
slot_0_42_8 = nil
slot_0_43_7 = nil

function slot_0_44_7(arg_48_0)
	if type(arg_48_0) ~= "string" then
		slot_0_22_5 = slot_0_8_2
		slot_0_23_6.api_profile = slot_0_39_8(slot_0_8_2)
		slot_0_23_6.font_index = slot_0_38_8()

		slot_0_40_9()

		slot_0_23_6.last_measure_font_key = nil
		slot_0_23_6.last_measure_text = nil

		slot_0_41_8()

		return
	end

	if arg_48_0 == slot_0_9_3 or string.find(arg_48_0, "andromeda", 1, true) ~= nil and string.find(arg_48_0, "Р ", 1, true) ~= nil then
		arg_48_0 = slot_0_8_2
	end

	slot_0_22_5 = arg_48_0
	slot_0_23_6.api_profile = slot_0_39_8(arg_48_0)
	slot_0_23_6.font_index = slot_0_38_8()

	slot_0_40_9()

	slot_0_23_6.last_measure_font_key = nil
	slot_0_23_6.last_measure_text = nil

	slot_0_41_8()
end

function slot_0_38_8()
	local var_49_0 = slot_0_23_6.api_profile

	if type(var_49_0) == "table" and type(var_49_0.font) == "number" then
		return slot_0_37_9(var_49_0.font)
	end

	return slot_0_37_9(slot_0_23_6.font_index)
end

function slot_0_45_7(arg_50_0)
	return "builtin:" .. tostring(arg_50_0)
end

function slot_0_46_6(arg_51_0, arg_51_1)
	return render.measure_text(arg_51_0, "c", arg_51_1)
end

function slot_0_40_9()
	slot_0_26_7.profile = nil
	slot_0_26_7.uppercase_mode = false
	slot_0_26_7.style_hex = ""
	slot_0_26_7.render_text = ""
	slot_0_26_7.measure_text = ""
	slot_0_26_7.next_animated_update = 0
	slot_0_26_7.use_glyph_render = false
	slot_0_26_7.use_text_runs = false
	slot_0_26_7.font_signature = ""
	slot_0_26_7.glyph_entry_count = 0
	slot_0_26_7.glyph_base_width = 0
	slot_0_26_7.glyph_base_height = 0
end

function slot_0_47_12(arg_53_0)
	if type(arg_53_0) ~= "string" then
		return ""
	end

	return arg_53_0:gsub("\\a", "\a")
end

function slot_0_48_11(arg_54_0)
	if type(arg_54_0) ~= "string" then
		return ""
	end

	return arg_54_0:match("^%s*(.-)%s*$")
end

function slot_0_49_12(arg_55_0, arg_55_1, arg_55_2)
	if arg_55_0 < arg_55_1 then
		return arg_55_1
	end

	if arg_55_2 < arg_55_0 then
		return arg_55_2
	end

	return arg_55_0
end

function slot_0_37_9(arg_56_0)
	if type(arg_56_0) ~= "number" then
		return slot_0_10_4
	end

	local var_56_0 = math.floor(arg_56_0 + 0.5)

	return slot_0_49_12(var_56_0, slot_0_11_5, slot_0_12_4)
end

function slot_0_6_0(arg_57_0)
	local var_57_0 = slot_0_37_9(arg_57_0)

	return slot_0_13_2[var_57_0] or slot_0_13_2[slot_0_10_4]
end

function slot_0_50_15(arg_58_0)
	local var_58_0 = {}
	local var_58_1 = 1

	while var_58_1 <= #arg_58_0 do
		local var_58_2 = string.byte(arg_58_0, var_58_1)
		local var_58_3 = 1

		if var_58_2 >= 240 then
			var_58_3 = 4
		elseif var_58_2 >= 224 then
			var_58_3 = 3
		elseif var_58_2 >= 192 then
			var_58_3 = 2
		end

		var_58_0[#var_58_0 + 1] = arg_58_0:sub(var_58_1, var_58_1 + var_58_3 - 1)
		var_58_1 = var_58_1 + var_58_3
	end

	return var_58_0
end

function slot_0_51_14(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	local var_59_0 = slot_0_49_12(math.floor(arg_59_0 + 0.5), 0, 255)
	local var_59_1 = slot_0_49_12(math.floor(arg_59_1 + 0.5), 0, 255)
	local var_59_2 = slot_0_49_12(math.floor(arg_59_2 + 0.5), 0, 255)
	local var_59_3 = slot_0_49_12(math.floor(arg_59_3 + 0.5), 0, 255)

	return string.format("%02X%02X%02X%02X", var_59_0, var_59_1, var_59_2, var_59_3)
end

function slot_0_52_19(arg_60_0)
	if type(arg_60_0) ~= "string" then
		return nil
	end

	local var_60_0 = slot_0_48_11(arg_60_0)

	if var_60_0 == "" then
		return nil
	end

	if var_60_0:sub(1, 1) == "#" then
		var_60_0 = var_60_0:sub(2)
	end

	if var_60_0:sub(1, 2) == "\a" then
		var_60_0 = var_60_0:sub(3)
	end

	if #var_60_0 == 6 then
		var_60_0 = var_60_0 .. "FF"
	end

	if #var_60_0 ~= 8 then
		return nil
	end

	if var_60_0:find("[^%x]") ~= nil then
		return nil
	end

	return var_60_0:upper()
end

function slot_0_53_18()
	local var_61_0 = ui.get_style()

	if type(var_61_0) == "table" then
		local var_61_1 = var_61_0["Link Active"]

		if var_61_1 ~= nil then
			local var_61_2, var_61_3 = pcall(var_61_1.to_hex, var_61_1)

			if var_61_2 then
				local var_61_4 = slot_0_52_19(var_61_3)

				if var_61_4 ~= nil then
					return var_61_4
				end
			end
		end
	end

	return "FFFFFFFF"
end

function slot_0_54_17(arg_62_0)
	local var_62_0 = slot_0_52_19(arg_62_0)

	if var_62_0 == nil then
		return nil
	end

	local var_62_1 = tonumber(var_62_0:sub(1, 2), 16)
	local var_62_2 = tonumber(var_62_0:sub(3, 4), 16)
	local var_62_3 = tonumber(var_62_0:sub(5, 6), 16)
	local var_62_4 = tonumber(var_62_0:sub(7, 8), 16)

	if var_62_1 == nil or var_62_2 == nil or var_62_3 == nil or var_62_4 == nil then
		return nil
	end

	return color(var_62_1, var_62_2, var_62_3, var_62_4)
end

function slot_0_55_18(arg_63_0)
	return vector(arg_63_0.x * slot_0_20_5, arg_63_0.y * slot_0_21_5)
end

function slot_0_56_16(arg_64_0)
	if type(slot_0_23_6.position_x) ~= "number" or type(slot_0_23_6.position_y) ~= "number" then
		local var_64_0 = slot_0_55_18(arg_64_0)

		slot_0_23_6.position_x = var_64_0.x
		slot_0_23_6.position_y = var_64_0.y
	end
end

function slot_0_57_18(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0:find("\a", 1, true)

	if var_65_0 ~= nil then
		local var_65_1 = arg_65_0:sub(1, var_65_0 - 1)
		local var_65_2 = arg_65_0:sub(var_65_0)

		if var_65_1 == "" then
			return arg_65_0
		end

		return slot_0_5_0.wave(var_65_1, arg_65_1) .. var_65_2
	end

	return slot_0_5_0.wave(arg_65_0, arg_65_1)
end

function slot_0_58_18(arg_66_0)
	return "static"
end

function slot_0_59_20(arg_67_0)
	if type(arg_67_0) ~= "string" then
		return nil
	end

	local var_67_0 = arg_67_0:lower()

	if var_67_0 == "color" or var_67_0 == "colour" then
		return "color"
	end

	if var_67_0 == "alpha" or var_67_0 == "opacity" or var_67_0 == "brightness" or var_67_0 == "monochrome" or var_67_0 == "mono" then
		return "alpha"
	end

	return nil
end

function slot_0_60_21(arg_68_0)
	if type(arg_68_0) ~= "string" then
		return nil
	end

	local var_68_0 = arg_68_0:lower()

	if var_68_0 == "loop" then
		return "loop"
	end

	if var_68_0 == "pingpong" or var_68_0 == "ping-pong" or var_68_0 == "bounce" then
		return "pingpong"
	end

	return nil
end

function slot_0_61_22(arg_69_0)
	if type(arg_69_0) ~= "string" then
		return nil
	end

	local var_69_0 = arg_69_0:lower()

	if var_69_0 == "forward" or var_69_0 == "normal" or var_69_0 == "left_to_right" or var_69_0 == "ltr" or var_69_0 == "center_out" or var_69_0 == "outward" then
		return "forward"
	end

	if var_69_0 == "reverse" or var_69_0 == "backward" or var_69_0 == "right_to_left" or var_69_0 == "rtl" or var_69_0 == "outside_in" or var_69_0 == "inward" then
		return "reverse"
	end

	return nil
end

function slot_0_62_22(arg_70_0)
	if type(arg_70_0) ~= "string" then
		return nil
	end

	local var_70_0 = arg_70_0:lower()

	if var_70_0 == "soft" or var_70_0 == "smooth" then
		return "soft"
	end

	if var_70_0 == "sharp" or var_70_0 == "hard" then
		return "sharp"
	end

	return nil
end

function slot_0_63_20(arg_71_0, arg_71_1)
	if type(arg_71_0) == "boolean" then
		return arg_71_0
	end

	if type(arg_71_0) == "number" then
		return arg_71_0 ~= 0
	end

	if type(arg_71_0) == "string" then
		local var_71_0 = arg_71_0:lower()

		if var_71_0 == "true" or var_71_0 == "yes" or var_71_0 == "on" or var_71_0 == "1" then
			return true
		end

		if var_71_0 == "false" or var_71_0 == "no" or var_71_0 == "off" or var_71_0 == "0" then
			return false
		end
	end

	return arg_71_1
end

function slot_0_64_21(arg_72_0)
	return "off"
end

function slot_0_65_21(arg_73_0)
	if type(arg_73_0) == "table" then
		local var_73_0 = slot_0_59_20(arg_73_0.channel)

		if var_73_0 ~= nil then
			return var_73_0
		end

		local var_73_1 = slot_0_58_18(arg_73_0.mode)

		if var_73_1 == "pulse" or var_73_1 == "gradient_pulse" or var_73_1 == "rainbow_pulse" or var_73_1 == "brightness_wave" or var_73_1 == "brightness_centered" then
			return "alpha"
		end
	end

	return "color"
end

function slot_0_66_21(arg_74_0)
	if type(arg_74_0) == "table" then
		local var_74_0 = slot_0_60_21(arg_74_0.repeat_mode or arg_74_0.playback or arg_74_0["repeat"])

		if var_74_0 ~= nil then
			return var_74_0
		end
	end

	return "loop"
end

function slot_0_67_21(arg_75_0)
	if type(arg_75_0) == "table" then
		local var_75_0 = slot_0_61_22(arg_75_0.direction)

		if var_75_0 ~= nil then
			return var_75_0
		end
	end

	return "forward"
end

function slot_0_68_18(arg_76_0)
	if type(arg_76_0) == "table" then
		return slot_0_63_20(arg_76_0.reverse, false)
	end

	return false
end

function slot_0_69_21(arg_77_0)
	if type(arg_77_0) == "table" then
		local var_77_0 = slot_0_62_22(arg_77_0.shape)

		if var_77_0 ~= nil then
			return var_77_0
		end
	end

	return "soft"
end

function slot_0_70_20(arg_78_0)
	return "off"
end

function slot_0_71_20(arg_79_0)
	return false
end

function slot_0_72_18(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	local var_80_0 = arg_80_0

	if type(var_80_0) ~= "number" then
		var_80_0 = arg_80_1
	end

	return slot_0_49_12(var_80_0, arg_80_2, arg_80_3)
end

function slot_0_73_18(arg_81_0)
	if type(arg_81_0) ~= "table" then
		return nil
	end

	local var_81_0 = arg_81_0.text

	if var_81_0 == nil then
		return nil
	end

	if type(var_81_0) ~= "string" then
		var_81_0 = tostring(var_81_0)
	end

	local var_81_1 = var_81_0:upper()
	local var_81_2 = slot_0_50_15(var_81_0)
	local var_81_3 = slot_0_50_15(var_81_1)
	local var_81_4 = slot_0_52_19(arg_81_0.color)

	if var_81_4 == nil then
		var_81_4 = slot_0_53_18()
	end

	local var_81_5 = {
		mode = "static",
		text = var_81_0,
		text_upper = var_81_1,
		chars = var_81_2,
		chars_upper = var_81_3,
		color_hex = var_81_4
	}

	var_81_5.has_color_animation = false
	var_81_5.has_glyph_animation = false
	var_81_5.is_animated = false

	return var_81_5
end

function slot_0_39_8(arg_82_0)
	if type(arg_82_0) ~= "string" then
		return nil
	end

	local var_82_0 = slot_0_48_11(arg_82_0)

	if var_82_0 == "" then
		return nil
	end

	local var_82_1
	local var_82_2 = var_82_0:lower()

	if var_82_2:sub(1, #slot_0_15_3) == slot_0_15_3 then
		var_82_1 = #slot_0_15_3
	elseif var_82_2:sub(1, #slot_0_16_3) == slot_0_16_3 then
		var_82_1 = #slot_0_16_3
	else
		return nil
	end

	local var_82_3 = slot_0_48_11(var_82_0:sub(var_82_1 + 1))

	if var_82_3 == "" then
		return nil
	end

	local var_82_4, var_82_5 = pcall(json.parse, var_82_3)

	if not var_82_4 or type(var_82_5) ~= "table" then
		return nil
	end

	local var_82_6 = {
		segments = {}
	}

	if type(var_82_5.font) == "number" then
		var_82_6.font = slot_0_37_9(var_82_5.font)
	end

	local var_82_7 = var_82_5.segments

	if type(var_82_7) == "table" then
		for iter_82_0 = 1, #var_82_7 do
			local var_82_8 = slot_0_73_18(var_82_7[iter_82_0])

			if var_82_8 ~= nil then
				var_82_6.segments[#var_82_6.segments + 1] = var_82_8
			end
		end
	end

	if #var_82_6.segments == 0 then
		local var_82_9 = slot_0_73_18({
			text = var_82_5.text,
			color = var_82_5.color
		})

		if var_82_9 ~= nil then
			var_82_6.segments[1] = var_82_9
		end
	end

	if #var_82_6.segments == 0 then
		return nil
	end

	local var_82_10 = false
	local var_82_11 = false
	local var_82_12 = false

	for iter_82_1 = 1, #var_82_6.segments do
		if var_82_6.segments[iter_82_1].is_animated == true then
			var_82_10 = true
		end

		if var_82_6.segments[iter_82_1].has_color_animation == true then
			var_82_11 = true
		end

		if var_82_6.segments[iter_82_1].has_glyph_animation == true then
			var_82_12 = true
		end
	end

	var_82_6.has_animated = var_82_10
	var_82_6.has_color_animation = var_82_11
	var_82_6.has_glyph_animation = var_82_12

	return var_82_6
end

function slot_0_74_17(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = {}
	local var_83_1 = {}
	local var_83_2 = arg_83_1:to_hex()

	for iter_83_0 = 1, #arg_83_0.segments do
		local var_83_3 = arg_83_0.segments[iter_83_0]
		local var_83_4 = arg_83_2 and var_83_3.text_upper or var_83_3.text
		local var_83_5 = var_83_3.color_hex

		if var_83_5 == nil then
			var_83_5 = var_83_2
		end

		local var_83_6 = "\a" .. var_83_5 .. var_83_4

		var_83_1[#var_83_1 + 1] = var_83_4
		var_83_0[#var_83_0 + 1] = var_83_6
		var_83_3.cached_render_text = var_83_6
	end

	return table.concat(var_83_0), table.concat(var_83_1)
end

function slot_0_75_14(arg_84_0, arg_84_1)
	local var_84_0 = string.byte(arg_84_0, arg_84_1)

	if var_84_0 == nil then
		return arg_84_1
	end

	if var_84_0 >= 240 then
		return arg_84_1 + 3
	end

	if var_84_0 >= 224 then
		return arg_84_1 + 2
	end

	if var_84_0 >= 192 then
		return arg_84_1 + 1
	end

	return arg_84_1
end

function slot_0_76_13(arg_85_0, arg_85_1)
	local var_85_0 = slot_0_33_11[arg_85_0]

	if var_85_0 == nil then
		var_85_0 = {}
		slot_0_33_11[arg_85_0] = var_85_0
	end

	local var_85_1 = var_85_0[arg_85_1]

	if var_85_1 ~= nil then
		return var_85_1
	end

	local var_85_2 = render.measure_text(arg_85_0, nil, arg_85_1).x

	var_85_0[arg_85_1] = var_85_2

	return var_85_2
end

function slot_0_77_12(arg_86_0)
	local var_86_0 = slot_0_52_19(arg_86_0)

	if var_86_0 == nil then
		var_86_0 = "FFFFFFFF"
	end

	local var_86_1 = slot_0_34_9[var_86_0]

	if var_86_1 ~= nil then
		return var_86_1
	end

	local var_86_2 = slot_0_54_17(var_86_0)

	if var_86_2 == nil then
		var_86_2 = color(255, 255, 255, 255)
	end

	slot_0_34_9[var_86_0] = var_86_2

	return var_86_2
end

function slot_0_78_12(arg_87_0)
	if arg_87_0 >= 82 then
		return 5
	end

	if arg_87_0 >= 64 then
		return 4
	end

	if arg_87_0 >= 46 then
		return 3
	end

	if arg_87_0 >= 30 then
		return 2
	end

	return 1
end

function slot_0_79_11(arg_88_0)
	local var_88_0 = arg_88_0 * math.pi * 2
	local var_88_1 = math.sin(var_88_0)
	local var_88_2 = 16 * var_88_1 * var_88_1 * var_88_1
	local var_88_3 = 13 * math.cos(var_88_0) - 5 * math.cos(var_88_0 * 2) - 2 * math.cos(var_88_0 * 3) - math.cos(var_88_0 * 4)

	return var_88_2 / 16, -((var_88_3 + 2) / 16)
end

function slot_0_80_10()
	if slot_0_36_9.total_length > 0 then
		return
	end

	local var_89_0 = slot_0_36_9.samples
	local var_89_1, var_89_2 = slot_0_79_11(0)
	local var_89_3 = 0

	var_89_0[1] = {
		distance = 0,
		x = var_89_1,
		y = var_89_2
	}

	for iter_89_0 = 1, slot_0_32_14 do
		local var_89_4 = iter_89_0 / slot_0_32_14
		local var_89_5, var_89_6 = slot_0_79_11(var_89_4)
		local var_89_7 = var_89_5 - var_89_1
		local var_89_8 = var_89_6 - var_89_2

		var_89_3 = var_89_3 + math.sqrt(var_89_7 * var_89_7 + var_89_8 * var_89_8)

		local var_89_9 = var_89_0[iter_89_0 + 1]

		if var_89_9 == nil then
			var_89_9 = {}
			var_89_0[iter_89_0 + 1] = var_89_9
		end

		var_89_9.x = var_89_5
		var_89_9.y = var_89_6
		var_89_9.distance = var_89_3
		var_89_1 = var_89_5
		var_89_2 = var_89_6
	end

	for iter_89_1 = slot_0_32_14 + 2, #var_89_0 do
		var_89_0[iter_89_1] = nil
	end

	slot_0_36_9.total_length = var_89_3
end

function slot_0_81_8(arg_90_0)
	slot_0_80_10()

	local var_90_0 = arg_90_0 - math.floor(arg_90_0)

	if var_90_0 <= 0 then
		local var_90_1 = slot_0_36_9.samples[1]

		return var_90_1.x, var_90_1.y
	end

	local var_90_2 = slot_0_36_9.samples
	local var_90_3 = var_90_0 * slot_0_36_9.total_length
	local var_90_4 = 2
	local var_90_5 = #var_90_2

	while var_90_4 < var_90_5 do
		local var_90_6 = math.floor((var_90_4 + var_90_5) * 0.5)

		if var_90_3 > var_90_2[var_90_6].distance then
			var_90_4 = var_90_6 + 1
		else
			var_90_5 = var_90_6
		end
	end

	local var_90_7 = var_90_2[var_90_4]
	local var_90_8 = var_90_2[var_90_4 - 1]
	local var_90_9 = var_90_7.distance - var_90_8.distance

	if var_90_9 <= 0 then
		return var_90_7.x, var_90_7.y
	end

	local var_90_10 = (var_90_3 - var_90_8.distance) / var_90_9

	return var_90_8.x + (var_90_7.x - var_90_8.x) * var_90_10, var_90_8.y + (var_90_7.y - var_90_8.y) * var_90_10
end

function slot_0_82_9(arg_91_0)
	local var_91_0 = slot_0_35_9[arg_91_0]

	if var_91_0 ~= nil then
		return var_91_0
	end

	local var_91_1 = {}

	slot_0_35_9[arg_91_0] = var_91_1

	if arg_91_0 <= 0 then
		return var_91_1
	end

	local var_91_2 = slot_0_78_12(arg_91_0)

	if arg_91_0 < var_91_2 then
		var_91_2 = arg_91_0
	end

	local var_91_3 = 0

	for iter_91_0 = 1, var_91_2 do
		var_91_3 = var_91_3 + slot_0_30_12[iter_91_0]
	end

	local var_91_4 = {}
	local var_91_5 = {}
	local var_91_6 = 0

	for iter_91_1 = 1, var_91_2 do
		local var_91_7 = arg_91_0 * slot_0_30_12[iter_91_1] / var_91_3
		local var_91_8 = math.floor(var_91_7)

		if var_91_8 < 1 then
			var_91_8 = 1
		end

		var_91_4[iter_91_1] = var_91_8
		var_91_5[iter_91_1] = var_91_7 - var_91_8
		var_91_6 = var_91_6 + var_91_8
	end

	while arg_91_0 < var_91_6 do
		for iter_91_2 = var_91_2, 1, -1 do
			if var_91_6 <= arg_91_0 then
				break
			end

			if var_91_4[iter_91_2] > 1 then
				var_91_4[iter_91_2] = var_91_4[iter_91_2] - 1
				var_91_6 = var_91_6 - 1
			end
		end
	end

	while var_91_6 < arg_91_0 do
		local var_91_9 = 1
		local var_91_10 = var_91_5[1] or 0

		for iter_91_3 = 2, var_91_2 do
			local var_91_11 = var_91_5[iter_91_3] or 0

			if var_91_10 < var_91_11 then
				var_91_9 = iter_91_3
				var_91_10 = var_91_11
			end
		end

		var_91_4[var_91_9] = var_91_4[var_91_9] + 1
		var_91_5[var_91_9] = (var_91_5[var_91_9] or 0) - 1
		var_91_6 = var_91_6 + 1
	end

	local var_91_12 = 0

	for iter_91_4 = 1, var_91_2 do
		local var_91_13 = var_91_4[iter_91_4]
		local var_91_14 = slot_0_29_9[iter_91_4]
		local var_91_15 = slot_0_31_15[iter_91_4] or 0

		for iter_91_5 = 1, var_91_13 do
			local var_91_16 = (iter_91_5 - 0.5 + var_91_15) / var_91_13
			local var_91_17, var_91_18 = slot_0_81_8(var_91_16)

			var_91_12 = var_91_12 + 1
			var_91_1[var_91_12] = {
				x = var_91_17 * var_91_14,
				y = var_91_18 * var_91_14
			}
		end
	end

	return var_91_1
end

function slot_0_83_8(arg_92_0, arg_92_1, arg_92_2, arg_92_3, arg_92_4, arg_92_5)
	if arg_92_2 < arg_92_1 then
		return
	end

	local var_92_0 = arg_92_2 - arg_92_1 + 1
	local var_92_1 = slot_0_82_9(var_92_0)
	local var_92_2 = arg_92_5 * (3.25 + math.min(var_92_0, 24) * 0.11)
	local var_92_3 = var_92_2 * 0.95
	local var_92_4 = var_92_2 * 1.08
	local var_92_5 = arg_92_3 + (arg_92_4 - arg_92_3) * 0.5

	for iter_92_0 = 1, var_92_0 do
		local var_92_6 = arg_92_0[arg_92_1 + iter_92_0 - 1]
		local var_92_7 = var_92_1[iter_92_0]

		if var_92_7 == nil then
			var_92_7 = {
				y = 0,
				x = 0
			}
		end

		var_92_6.heart_anchor_x = var_92_5 - var_92_6.base_x - var_92_6.width * 0.5
		var_92_6.heart_target_x = var_92_7.x * var_92_3
		var_92_6.heart_target_y = var_92_7.y * var_92_4
	end
end

function slot_0_84_7(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0 = slot_0_26_7.glyph_entries
	local var_93_1 = 0
	local var_93_2 = 0
	local var_93_3 = 0

	for iter_93_0 = 1, #arg_93_0.segments do
		local var_93_4 = arg_93_0.segments[iter_93_0]
		local var_93_5 = var_93_4.chars

		if arg_93_2 then
			var_93_5 = var_93_4.chars_upper
		end

		local var_93_6 = var_93_4.cached_render_text

		if type(var_93_6) ~= "string" then
			var_93_6 = ""
		end

		local var_93_7 = slot_0_70_20(var_93_4)
		local var_93_8 = slot_0_71_20(var_93_4)
		local var_93_9 = slot_0_72_18(var_93_4.glyph_amount, 4, 0, 24)
		local var_93_10 = slot_0_72_18(var_93_4.glyph_speed, 3, 0.01, 20)
		local var_93_11 = slot_0_72_18(var_93_4.glyph_span, 1, 0.1, 10)
		local var_93_12 = "FFFFFFFF"
		local var_93_13 = 1
		local var_93_14 = #var_93_5
		local var_93_15 = var_93_1 + 1
		local var_93_16 = var_93_2

		for iter_93_1 = 1, var_93_14 do
			while var_93_13 <= #var_93_6 do
				if string.byte(var_93_6, var_93_13) ~= 7 then
					break
				end

				local var_93_17 = slot_0_52_19(var_93_6:sub(var_93_13 + 1, var_93_13 + 8))

				if var_93_17 == nil then
					break
				end

				var_93_12 = var_93_17
				var_93_13 = var_93_13 + 9
			end

			local var_93_18 = slot_0_75_14(var_93_6, var_93_13)
			local var_93_19 = var_93_6:sub(var_93_13, var_93_18)

			if var_93_19 == "" then
				var_93_19 = var_93_5[iter_93_1]
			end

			var_93_1 = var_93_1 + 1

			local var_93_20 = var_93_0[var_93_1]

			if var_93_20 == nil then
				var_93_20 = {}
				var_93_0[var_93_1] = var_93_20
			end

			var_93_20.text = var_93_19
			var_93_20.color = slot_0_77_12(var_93_12)
			var_93_20.width = slot_0_76_13(arg_93_1, var_93_5[iter_93_1])
			var_93_20.base_x = var_93_2
			var_93_20.motion = var_93_7
			var_93_20.glitch = var_93_8
			var_93_20.motion_amount = var_93_9
			var_93_20.motion_speed = var_93_10
			var_93_20.motion_span = var_93_11
			var_93_20.motion_index = iter_93_1
			var_93_20.motion_count = var_93_14
			var_93_20.heart_anchor_x = 0
			var_93_20.heart_target_x = 0
			var_93_20.heart_target_y = 0
			var_93_2 = var_93_2 + var_93_20.width

			if iter_93_1 < var_93_14 then
				var_93_2 = var_93_2 + var_93_3
			end

			var_93_13 = var_93_18 + 1
		end

		if var_93_7 == "heart" then
			slot_0_83_8(var_93_0, var_93_15, var_93_1, var_93_16, var_93_2, var_93_9)
		end
	end

	for iter_93_2 = var_93_1 + 1, #var_93_0 do
		var_93_0[iter_93_2] = nil
	end

	slot_0_26_7.glyph_entry_count = var_93_1
	slot_0_26_7.glyph_base_width = var_93_2
end

function slot_0_85_7(arg_94_0, arg_94_1, arg_94_2)
	local var_94_0 = slot_0_26_7.glyph_entries
	local var_94_1 = slot_0_50_15(arg_94_1)
	local var_94_2 = 0
	local var_94_3 = 0
	local var_94_4 = 0
	local var_94_5 = "FFFFFFFF"
	local var_94_6 = 1

	for iter_94_0 = 1, #var_94_1 do
		while var_94_6 <= #arg_94_0 do
			if string.byte(arg_94_0, var_94_6) ~= 7 then
				break
			end

			local var_94_7 = slot_0_52_19(arg_94_0:sub(var_94_6 + 1, var_94_6 + 8))

			if var_94_7 == nil then
				break
			end

			var_94_5 = var_94_7
			var_94_6 = var_94_6 + 9
		end

		local var_94_8 = slot_0_75_14(arg_94_0, var_94_6)
		local var_94_9 = arg_94_0:sub(var_94_6, var_94_8)

		if var_94_9 == "" then
			var_94_9 = var_94_1[iter_94_0]
		end

		var_94_2 = var_94_2 + 1

		local var_94_10 = var_94_0[var_94_2]

		if var_94_10 == nil then
			var_94_10 = {}
			var_94_0[var_94_2] = var_94_10
		end

		var_94_10.text = var_94_9
		var_94_10.color = slot_0_77_12(var_94_5)
		var_94_10.width = slot_0_76_13(arg_94_2, var_94_1[iter_94_0])
		var_94_10.base_x = var_94_3
		var_94_10.motion = "off"
		var_94_10.glitch = false
		var_94_10.motion_amount = 0
		var_94_10.motion_speed = 0
		var_94_10.motion_span = 0
		var_94_10.motion_index = iter_94_0
		var_94_10.motion_count = #var_94_1
		var_94_10.heart_anchor_x = 0
		var_94_10.heart_target_x = 0
		var_94_10.heart_target_y = 0
		var_94_3 = var_94_3 + var_94_10.width

		if iter_94_0 < #var_94_1 then
			var_94_3 = var_94_3 + var_94_4
		end

		var_94_6 = var_94_8 + 1
	end

	for iter_94_1 = var_94_2 + 1, #var_94_0 do
		var_94_0[iter_94_1] = nil
	end

	slot_0_26_7.glyph_entry_count = var_94_2
	slot_0_26_7.glyph_base_width = var_94_3
end

function slot_0_86_6(arg_95_0, arg_95_1)
	if type(arg_95_0) ~= "string" or arg_95_0 == "" then
		return nil, nil
	end

	local var_95_0 = "FFFFFFFF"
	local var_95_1 = arg_95_0

	if string.byte(arg_95_0, 1) == 7 then
		local var_95_2 = slot_0_52_19(arg_95_0:sub(2, 9))

		if var_95_2 == nil then
			return nil, nil
		end

		var_95_0 = var_95_2
		var_95_1 = arg_95_0:sub(10)
	end

	if var_95_1 == "" and type(arg_95_1) == "string" then
		var_95_1 = arg_95_1
	end

	if type(var_95_1) ~= "string" or var_95_1 == "" or string.find(var_95_1, "\a", 1, true) ~= nil then
		return nil, nil
	end

	return var_95_0, var_95_1
end

function slot_0_87_7(arg_96_0, arg_96_1, arg_96_2)
	local var_96_0 = slot_0_26_7.glyph_entries
	local var_96_1 = 0
	local var_96_2 = 0

	for iter_96_0 = 1, #arg_96_0.segments do
		local var_96_3 = arg_96_0.segments[iter_96_0]
		local var_96_4 = var_96_3.cached_render_text
		local var_96_5 = arg_96_1 == true and var_96_3.text_upper or var_96_3.text
		local var_96_6, var_96_7 = slot_0_86_6(var_96_4, var_96_5)

		if var_96_7 ~= nil then
			local var_96_8 = var_96_0[var_96_1 + 1]

			if var_96_8 == nil then
				var_96_8 = {}
				var_96_0[var_96_1 + 1] = var_96_8
			end

			var_96_1 = var_96_1 + 1
			var_96_8.text = var_96_7
			var_96_8.color = slot_0_77_12(var_96_6)
			var_96_8.width = slot_0_76_13(arg_96_2, var_96_7)
			var_96_8.base_x = var_96_2
			var_96_8.motion = "off"
			var_96_8.glitch = false
			var_96_8.motion_amount = 0
			var_96_8.motion_speed = 0
			var_96_8.motion_span = 0
			var_96_8.motion_index = 1
			var_96_8.motion_count = 1
			var_96_8.heart_anchor_x = 0
			var_96_8.heart_target_x = 0
			var_96_8.heart_target_y = 0
			var_96_2 = var_96_2 + var_96_8.width
		end
	end

	for iter_96_1 = var_96_1 + 1, #var_96_0 do
		var_96_0[iter_96_1] = nil
	end

	slot_0_26_7.glyph_entry_count = var_96_1
	slot_0_26_7.glyph_base_width = var_96_2
end

function slot_0_88_7(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0, var_97_1 = slot_0_86_6(arg_97_0, arg_97_1)

	if var_97_1 == nil then
		slot_0_85_7(arg_97_0, arg_97_1, arg_97_2)

		return
	end

	local var_97_2 = slot_0_26_7.glyph_entries
	local var_97_3 = var_97_2[1]

	if var_97_3 == nil then
		var_97_3 = {}
		var_97_2[1] = var_97_3
	end

	var_97_3.text = var_97_1
	var_97_3.color = slot_0_77_12(var_97_0)
	var_97_3.width = slot_0_76_13(arg_97_2, var_97_1)
	var_97_3.base_x = 0
	var_97_3.motion = "off"
	var_97_3.glitch = false
	var_97_3.motion_amount = 0
	var_97_3.motion_speed = 0
	var_97_3.motion_span = 0
	var_97_3.motion_index = 1
	var_97_3.motion_count = 1
	var_97_3.heart_anchor_x = 0
	var_97_3.heart_target_x = 0
	var_97_3.heart_target_y = 0

	for iter_97_0 = 2, #var_97_2 do
		var_97_2[iter_97_0] = nil
	end

	slot_0_26_7.glyph_entry_count = 1
	slot_0_26_7.glyph_base_width = var_97_3.width
end

function slot_0_89_6(arg_98_0)
	local var_98_0 = slot_0_70_20(arg_98_0)
	local var_98_1 = slot_0_71_20(arg_98_0)

	if var_98_0 == "off" and var_98_1 ~= true then
		return 0, 0
	end

	local var_98_2 = slot_0_72_18(arg_98_0.glyph_amount, 4, 0, 24)

	if var_98_1 == true then
		return 0, 0
	end

	if var_98_0 == "orbit" then
		return var_98_2 * 0.8, var_98_2 * 0.7
	end

	if var_98_0 == "scatter" then
		return var_98_2 * 1.2, var_98_2 * 0.4
	end

	if var_98_0 == "heart" then
		local var_98_3 = 0

		if type(arg_98_0.chars) == "table" then
			var_98_3 = #arg_98_0.chars
		end

		local var_98_4 = var_98_2 * (3.25 + math.min(var_98_3, 24) * 0.11)

		return var_98_4 * 1.15, var_98_4 * 1.25
	end

	return var_98_2 * 0.2, var_98_2
end

function slot_0_90_6(arg_99_0)
	local var_99_0 = 0
	local var_99_1 = 0

	if type(arg_99_0) ~= "table" or type(arg_99_0.segments) ~= "table" then
		return var_99_0, var_99_1
	end

	for iter_99_0 = 1, #arg_99_0.segments do
		local var_99_2 = arg_99_0.segments[iter_99_0]
		local var_99_3, var_99_4 = slot_0_89_6(var_99_2)

		if var_99_0 < var_99_3 then
			var_99_0 = var_99_3
		end

		if var_99_1 < var_99_4 then
			var_99_1 = var_99_4
		end
	end

	return math.ceil(var_99_0 + 1), math.ceil(var_99_1 + 1)
end

function slot_0_91_5(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_0.motion

	if var_100_0 == "off" then
		return 0, 0
	end

	local var_100_1 = arg_100_0.motion_amount

	if var_100_1 <= 0 then
		return 0, 0
	end

	local var_100_2 = 0

	if arg_100_0.motion_count > 1 then
		var_100_2 = (arg_100_0.motion_index - 1) / (arg_100_0.motion_count - 1)
	end

	local var_100_3 = arg_100_1 * arg_100_0.motion_speed * math.pi * 2
	local var_100_4 = var_100_3 + var_100_2 * arg_100_0.motion_span * math.pi * 2

	if var_100_0 == "wave" then
		return 0, math.sin(var_100_4) * var_100_1
	end

	if var_100_0 == "orbit" then
		return math.cos(var_100_4) * var_100_1 * 0.8, math.sin(var_100_4) * var_100_1 * 0.65
	end

	if var_100_0 == "scatter" then
		local var_100_5 = var_100_2 - 0.5

		return (var_100_5 >= 0 and 1 or -1) * ((math.sin(var_100_4 - math.pi * 0.5) + 1) * 0.5) * var_100_1 * (0.55 + math.abs(var_100_5) * 0.9), math.cos(var_100_4 * 0.5) * var_100_1 * 0.35
	end

	if var_100_0 == "heart" then
		local var_100_6 = 0.86 + (math.sin(var_100_3 * 1.1 - math.pi * 0.5) + 1) * 0.5 * 0.24
		local var_100_7 = math.sin(var_100_4 * 0.45) * var_100_1 * 0.06
		local var_100_8 = math.cos(var_100_4 * 0.45) * var_100_1 * 0.08

		return (arg_100_0.heart_anchor_x or 0) + (arg_100_0.heart_target_x or 0) * var_100_6 + var_100_7, (arg_100_0.heart_target_y or 0) * var_100_6 + var_100_8
	end

	return 0, 0
end

function slot_0_92_5(arg_101_0, arg_101_1, arg_101_2)
	if arg_101_0.text == " " then
		return arg_101_0.text, 0
	end

	local var_101_0 = 0

	if arg_101_0.motion_count > 1 then
		var_101_0 = (arg_101_0.motion_index - 1) / (arg_101_0.motion_count - 1)
	end

	local var_101_1 = math.floor(arg_101_2 * arg_101_0.motion_speed * 18)
	local var_101_2 = arg_101_2 * arg_101_0.motion_speed * math.pi * 2 + var_101_0 * arg_101_0.motion_span * math.pi * 2

	if (math.sin(var_101_2) + 1) * 0.5 > 0.2 + slot_0_49_12(arg_101_0.motion_amount / 24, 0, 1) * 0.8 then
		return arg_101_0.text, 0
	end

	local var_101_3 = (arg_101_0.motion_index * 1103515245 + var_101_1 * 12345) % 2147483647
	local var_101_4 = slot_0_27_9[var_101_3 % slot_0_28_8 + 1]
	local var_101_5 = slot_0_76_13(arg_101_1, var_101_4)

	return var_101_4, (arg_101_0.width - var_101_5) * 0.5
end

function slot_0_93_5(arg_102_0, arg_102_1)
	local var_102_0 = slot_0_26_7.glyph_entry_count

	if var_102_0 <= 0 then
		return
	end

	local var_102_1 = arg_102_1.x - slot_0_26_7.glyph_base_width * 0.5
	local var_102_2 = arg_102_1.y - slot_0_26_7.glyph_base_height * 0.5
	local var_102_3 = globals.realtime

	for iter_102_0 = 1, var_102_0 do
		local var_102_4 = slot_0_26_7.glyph_entries[iter_102_0]
		local var_102_5, var_102_6 = slot_0_91_5(var_102_4, var_102_3)
		local var_102_7 = var_102_4.text
		local var_102_8 = 0

		if var_102_4.glitch == true then
			var_102_7, var_102_8 = slot_0_92_5(var_102_4, arg_102_0, var_102_3)
		end

		local var_102_9 = vector(var_102_1 + var_102_4.base_x + var_102_5 + var_102_8, var_102_2 + var_102_6, 0)

		render.text(arg_102_0, var_102_9, var_102_4.color, nil, var_102_7)
	end
end

function slot_0_94_5()
	local var_103_0 = math.max(1, slot_0_23_6.text_size_x * 0.5)
	local var_103_1 = math.max(1, slot_0_23_6.text_size_y * 0.5)

	slot_0_23_6.bounds_min_x = slot_0_23_6.position_x - var_103_0 - slot_0_19_5
	slot_0_23_6.bounds_min_y = slot_0_23_6.position_y - var_103_1 - slot_0_19_5
	slot_0_23_6.bounds_max_x = slot_0_23_6.position_x + var_103_0 + slot_0_19_5
	slot_0_23_6.bounds_max_y = slot_0_23_6.position_y + var_103_1 + slot_0_19_5
end

function slot_0_95_5(arg_104_0)
	if arg_104_0 == nil then
		return false
	end

	if arg_104_0.x < slot_0_23_6.bounds_min_x then
		return false
	end

	if arg_104_0.x > slot_0_23_6.bounds_max_x then
		return false
	end

	if arg_104_0.y < slot_0_23_6.bounds_min_y then
		return false
	end

	if arg_104_0.y > slot_0_23_6.bounds_max_y then
		return false
	end

	return true
end

function slot_0_96_5(arg_105_0)
	if arg_105_0 == nil then
		return false
	end

	local var_105_0 = ui.get_position()
	local var_105_1 = ui.get_size()

	if var_105_0 == nil or var_105_1 == nil then
		return false
	end

	if arg_105_0.x < var_105_0.x then
		return false
	end

	if arg_105_0.x > var_105_0.x + var_105_1.x then
		return false
	end

	if arg_105_0.y < var_105_0.y then
		return false
	end

	if arg_105_0.y > var_105_0.y + var_105_1.y then
		return false
	end

	return true
end

function slot_0_97_6(arg_106_0)
	local var_106_0 = math.max(1, slot_0_23_6.text_size_x * 0.5)
	local var_106_1 = math.max(1, slot_0_23_6.text_size_y * 0.5)

	slot_0_23_6.position_x = slot_0_49_12(slot_0_23_6.position_x, var_106_0, arg_106_0.x - var_106_0)
	slot_0_23_6.position_y = slot_0_49_12(slot_0_23_6.position_y, var_106_1, arg_106_0.y - var_106_1)
end

function slot_0_98_6()
	if slot_0_24_5.position_x ~= nil and type(slot_0_23_6.position_x) == "number" then
		pcall(slot_0_24_5.position_x.set, slot_0_24_5.position_x, math.floor(slot_0_23_6.position_x + 0.5))
	end

	if slot_0_24_5.position_y ~= nil and type(slot_0_23_6.position_y) == "number" then
		pcall(slot_0_24_5.position_y.set, slot_0_24_5.position_y, math.floor(slot_0_23_6.position_y + 0.5))
	end

	if slot_0_24_5.font ~= nil then
		pcall(slot_0_24_5.font.set, slot_0_24_5.font, slot_0_38_8())
	end
end

function slot_0_99_6()
	local var_108_0 = slot_0_22_5

	if type(slot_0_23_6.api_profile) == "table" or slot_0_38_8() ~= slot_0_10_4 then
		local var_108_1 = slot_0_43_7(slot_0_42_8())

		if type(var_108_1) == "string" and var_108_1 ~= "" then
			var_108_0 = var_108_1
		end
	end

	if type(var_108_0) ~= "string" then
		var_108_0 = ""
	end

	if var_108_0 ~= slot_0_22_5 then
		slot_0_44_7(var_108_0)
	end

	if slot_0_24_5.text == nil then
		return
	end

	local var_108_2, var_108_3 = pcall(slot_0_24_5.text.get, slot_0_24_5.text)

	if var_108_2 and var_108_3 == var_108_0 then
		return
	end

	slot_0_25_5 = var_108_0

	pcall(slot_0_24_5.text.set, slot_0_24_5.text, var_108_0)
end

function slot_0_100_5()
	if ui.get_alpha() <= 0 then
		if slot_0_23_6.dragging == true then
			slot_0_23_6.dragging = false

			slot_0_98_6()
		end

		slot_0_23_6.hovered = false
		slot_0_23_6.was_left_down = false
		slot_0_23_6.was_right_down = false

		return
	end

	local var_109_0 = ui.get_mouse_position()

	if var_109_0 == nil then
		return
	end

	local var_109_1 = common.is_button_down(slot_0_17_4) == true
	local var_109_2 = common.is_button_down(slot_0_18_3) == true

	if slot_0_96_5(var_109_0) then
		slot_0_23_6.hovered = false

		if slot_0_23_6.dragging == true and var_109_1 ~= true then
			slot_0_23_6.dragging = false

			slot_0_98_6()
		end

		slot_0_23_6.was_left_down = var_109_1
		slot_0_23_6.was_right_down = var_109_2

		return
	end

	local var_109_3 = slot_0_95_5(var_109_0)

	slot_0_23_6.hovered = var_109_3

	if var_109_1 and slot_0_23_6.was_left_down ~= true and var_109_3 then
		slot_0_23_6.dragging = true
		slot_0_23_6.drag_offset_x = var_109_0.x - slot_0_23_6.position_x
		slot_0_23_6.drag_offset_y = var_109_0.y - slot_0_23_6.position_y
	end

	if slot_0_23_6.dragging == true then
		if var_109_1 == true then
			local var_109_4 = render.screen_size()

			slot_0_56_16(var_109_4)

			local var_109_5 = var_109_0.x - slot_0_23_6.drag_offset_x
			local var_109_6 = var_109_0.y - slot_0_23_6.drag_offset_y

			slot_0_23_6.position_x = var_109_5
			slot_0_23_6.position_y = var_109_6

			slot_0_97_6(var_109_4)
		else
			slot_0_23_6.dragging = false

			slot_0_98_6()
		end
	end

	if var_109_2 and slot_0_23_6.was_right_down ~= true and slot_0_23_6.hover_font_cycle_enabled == true and var_109_3 and slot_0_23_6.dragging ~= true then
		local var_109_7 = slot_0_37_9(slot_0_23_6.font_index + 1)

		if var_109_7 == slot_0_23_6.font_index and slot_0_23_6.font_index >= slot_0_12_4 then
			var_109_7 = slot_0_11_5
		end

		slot_0_23_6.font_index = var_109_7

		if slot_0_24_5.font ~= nil then
			pcall(slot_0_24_5.font.set, slot_0_24_5.font, slot_0_23_6.font_index)
		end
	end

	slot_0_23_6.was_left_down = var_109_1
	slot_0_23_6.was_right_down = var_109_2

	if slot_0_23_6.hovered == true or slot_0_23_6.dragging == true then
		return false
	end
end

function slot_0_101_7()
	if slot_0_22_5 == "" then
		return
	end

	slot_110_0_0 = slot_0_47_12(slot_0_22_5)

	if slot_110_0_0 == "" then
		return
	end

	slot_110_2_0 = ui.get_style()["Link Active"]

	if slot_110_2_0 == nil then
		slot_110_2_0 = color(255, 255, 255, 255)
	end

	slot_110_3_0 = slot_0_37_9(slot_0_23_6.font_index)
	slot_0_23_6.font_index = slot_110_3_0
	slot_110_4_0 = slot_110_3_0
	slot_110_5_0 = nil
	slot_110_6_0 = nil
	slot_110_7_0 = false
	slot_110_8_0 = false
	slot_110_9_0 = 0
	slot_110_10_0 = 0
	slot_110_11_0 = slot_0_45_7(slot_110_4_0)
	slot_110_12_0 = slot_0_23_6.api_profile

	if slot_110_12_0 ~= nil then
		if type(slot_110_12_0.font) == "number" then
			slot_110_4_0 = slot_0_37_9(slot_110_12_0.font)
		end

		slot_110_11_0 = slot_0_45_7(slot_110_4_0)
		slot_110_13_2 = slot_110_4_0 == 2
		slot_110_14_3 = slot_110_2_0:to_hex()
		slot_110_15_3 = globals.realtime
		slot_110_7_0 = slot_110_12_0.has_glyph_animation == true

		if slot_110_12_0.has_glyph_animation == true then
			slot_110_9_0, slot_110_10_0 = slot_0_90_6(slot_110_12_0)
		end

		slot_110_16_0 = false

		if slot_0_26_7.profile ~= slot_110_12_0 then
			slot_110_16_0 = true
		end

		if slot_0_26_7.uppercase_mode ~= slot_110_13_2 then
			slot_110_16_0 = true
		end

		if slot_0_26_7.style_hex ~= slot_110_14_3 then
			slot_110_16_0 = true
		end

		if type(slot_0_26_7.measure_text) ~= "string" then
			slot_110_16_0 = true
		end

		if type(slot_0_26_7.render_text) ~= "string" then
			slot_110_16_0 = true
		end

		if slot_0_26_7.use_glyph_render ~= slot_110_7_0 then
			slot_110_16_0 = true
		end

		if slot_0_26_7.use_text_runs ~= slot_110_8_0 then
			slot_110_16_0 = true
		end

		if slot_0_26_7.font_signature ~= slot_110_11_0 then
			slot_110_16_0 = true
		end

		if slot_110_12_0.has_color_animation == true and slot_110_15_3 >= slot_0_26_7.next_animated_update then
			slot_110_16_0 = true
		end

		if slot_110_16_0 then
			slot_110_5_0, slot_110_6_0 = slot_0_74_17(slot_110_12_0, slot_110_2_0, slot_110_13_2)
			slot_0_26_7.profile = slot_110_12_0
			slot_0_26_7.uppercase_mode = slot_110_13_2
			slot_0_26_7.style_hex = slot_110_14_3
			slot_0_26_7.render_text = slot_110_5_0
			slot_0_26_7.measure_text = slot_110_6_0
			slot_0_26_7.use_glyph_render = slot_110_7_0
			slot_0_26_7.use_text_runs = slot_110_8_0
			slot_0_26_7.font_signature = slot_110_11_0

			if slot_110_7_0 == true then
				if slot_110_8_0 == true then
					slot_0_87_7(slot_110_12_0, slot_110_13_2, slot_110_4_0)
				else
					slot_0_84_7(slot_110_12_0, slot_110_4_0, slot_110_13_2)
				end
			else
				slot_0_26_7.glyph_entry_count = 0
				slot_0_26_7.glyph_base_width = 0
				slot_0_26_7.glyph_base_height = 0
			end

			if slot_110_12_0.has_color_animation == true then
				slot_0_26_7.next_animated_update = slot_110_15_3 + slot_0_14_2
			else
				slot_0_26_7.next_animated_update = 0
			end
		else
			slot_110_5_0 = slot_0_26_7.render_text
			slot_110_6_0 = slot_0_26_7.measure_text
		end
	else
		slot_110_13_1 = slot_110_0_0

		if slot_110_4_0 == 2 then
			slot_110_13_1 = slot_110_13_1:upper()
		end

		slot_110_5_0 = slot_0_57_18(slot_110_13_1, slot_110_2_0)
		slot_110_6_0 = slot_110_13_1

		if slot_110_7_0 == true then
			if slot_110_8_0 == true then
				slot_0_88_7(slot_110_5_0, slot_110_6_0, slot_110_4_0)
			else
				slot_0_85_7(slot_110_5_0, slot_110_6_0, slot_110_4_0)
			end
		else
			slot_0_26_7.glyph_entry_count = 0
			slot_0_26_7.glyph_base_width = 0
			slot_0_26_7.glyph_base_height = 0
		end
	end

	if type(slot_110_6_0) ~= "string" or slot_110_6_0 == "" then
		return
	end

	slot_110_13_0 = slot_110_7_0 == true and slot_0_26_7.glyph_base_width or 0

	if slot_0_23_6.last_measure_font_key ~= slot_110_11_0 or slot_0_23_6.last_measure_text ~= slot_110_6_0 or slot_0_23_6.last_measure_use_glyph_render ~= slot_110_7_0 or slot_0_23_6.last_measure_cached_width ~= slot_110_13_0 then
		slot_110_14_2 = slot_0_46_6(slot_110_4_0, slot_110_6_0)
		slot_110_15_2 = slot_110_14_2.x

		if slot_110_7_0 == true and slot_110_13_0 > 0 then
			slot_110_15_2 = slot_110_13_0
		end

		slot_0_23_6.text_size_x = slot_110_15_2 + slot_110_9_0 * 2
		slot_0_23_6.text_size_y = slot_110_14_2.y + slot_110_10_0 * 2
		slot_0_23_6.last_measure_font_key = slot_110_11_0
		slot_0_23_6.last_measure_text = slot_110_6_0
		slot_0_23_6.last_measure_padding_x = slot_110_9_0
		slot_0_23_6.last_measure_padding_y = slot_110_10_0
		slot_0_23_6.last_measure_use_glyph_render = slot_110_7_0
		slot_0_23_6.last_measure_cached_width = slot_110_13_0
		slot_0_26_7.glyph_base_height = slot_110_14_2.y
	elseif slot_0_23_6.last_measure_padding_x ~= slot_110_9_0 or slot_0_23_6.last_measure_padding_y ~= slot_110_10_0 then
		slot_110_14_1 = slot_0_46_6(slot_110_4_0, slot_110_6_0)
		slot_110_15_1 = slot_110_14_1.x

		if slot_110_7_0 == true and slot_110_13_0 > 0 then
			slot_110_15_1 = slot_110_13_0
		end

		slot_0_23_6.text_size_x = slot_110_15_1 + slot_110_9_0 * 2
		slot_0_23_6.text_size_y = slot_110_14_1.y + slot_110_10_0 * 2
		slot_0_23_6.last_measure_padding_x = slot_110_9_0
		slot_0_23_6.last_measure_padding_y = slot_110_10_0
		slot_0_23_6.last_measure_use_glyph_render = slot_110_7_0
		slot_0_23_6.last_measure_cached_width = slot_110_13_0
		slot_0_26_7.glyph_base_height = slot_110_14_1.y
	end

	slot_110_14_0 = render.screen_size()

	slot_0_56_16(slot_110_14_0)
	slot_0_97_6(slot_110_14_0)
	slot_0_94_5()

	slot_110_15_0 = vector(slot_0_23_6.position_x, slot_0_23_6.position_y)

	if slot_110_7_0 == true then
		slot_0_93_5(slot_110_4_0, slot_110_15_0)

		return
	end

	render.text(slot_110_4_0, slot_110_15_0, color(255, 255, 255, 255), "c", slot_110_5_0)
end

function slot_0_41_8()
	local var_111_0 = slot_0_22_5 ~= ""

	if slot_0_23_6.callbacks_registered == var_111_0 then
		return
	end

	events.mouse_input(slot_0_100_5, var_111_0)
	events.render(slot_0_101_7, var_111_0)

	slot_0_23_6.callbacks_registered = var_111_0

	if var_111_0 == true then
		return
	end

	slot_0_23_6.hovered = false
	slot_0_23_6.dragging = false
	slot_0_23_6.was_left_down = false
	slot_0_23_6.was_right_down = false
end

function slot_0_7_0.get_name()
	return slot_0_22_5
end

function slot_0_7_0.set_name(arg_113_0)
	slot_0_44_7(arg_113_0)
end

function slot_0_102_5(arg_114_0)
	local var_114_0 = {
		font = slot_0_10_4,
		segments = {}
	}

	if type(arg_114_0) ~= "table" then
		return var_114_0
	end

	if type(arg_114_0.font) == "number" then
		var_114_0.font = slot_0_37_9(arg_114_0.font)
	end

	local var_114_1 = arg_114_0.segments

	if type(var_114_1) ~= "table" then
		return var_114_0
	end

	for iter_114_0 = 1, #var_114_1 do
		local var_114_2 = var_114_1[iter_114_0]

		if type(var_114_2) == "table" then
			var_114_0.segments[#var_114_0.segments + 1] = {
				text = tostring(var_114_2.text or ""),
				mode = slot_0_58_18(var_114_2.mode),
				color = slot_0_52_19(var_114_2.color)
			}
		end
	end

	return var_114_0
end

function slot_0_103_6(arg_115_0)
	if type(arg_115_0) ~= "table" then
		return nil
	end

	return {
		text = tostring(arg_115_0.text or ""),
		mode = slot_0_58_18(arg_115_0.mode),
		color = slot_0_52_19(arg_115_0.color_hex) or slot_0_53_18()
	}
end

function slot_0_42_8()
	local var_116_0 = {
		font = slot_0_37_9(slot_0_23_6.font_index),
		segments = {}
	}

	if type(slot_0_23_6.api_profile) == "table" then
		if type(slot_0_23_6.api_profile.font) == "number" then
			var_116_0.font = slot_0_37_9(slot_0_23_6.api_profile.font)
		end

		local var_116_1 = slot_0_23_6.api_profile.segments

		if type(var_116_1) == "table" then
			for iter_116_0 = 1, #var_116_1 do
				local var_116_2 = slot_0_103_6(var_116_1[iter_116_0])

				if var_116_2 ~= nil then
					var_116_0.segments[#var_116_0.segments + 1] = var_116_2
				end
			end
		end
	end

	if #var_116_0.segments == 0 and slot_0_22_5 ~= "" then
		local var_116_3 = slot_0_47_12(slot_0_22_5)

		if var_116_3 == "" then
			var_116_3 = slot_0_8_2
		end

		var_116_0.segments[1] = {
			mode = "static",
			text = var_116_3,
			color = slot_0_53_18()
		}
	end

	return var_116_0
end

function slot_0_43_7(arg_117_0)
	local var_117_0 = slot_0_102_5(arg_117_0)

	if #var_117_0.segments == 0 then
		return ""
	end

	local var_117_1 = {
		font = slot_0_37_9(var_117_0.font),
		segments = {}
	}

	for iter_117_0 = 1, #var_117_0.segments do
		local var_117_2 = var_117_0.segments[iter_117_0]
		local var_117_3 = {
			text = tostring(var_117_2.text or ""),
			color = slot_0_52_19(var_117_2.color) or slot_0_53_18()
		}

		var_117_1.segments[#var_117_1.segments + 1] = var_117_3
	end

	local var_117_4, var_117_5 = pcall(json.stringify, var_117_1)

	if not var_117_4 or type(var_117_5) ~= "string" or var_117_5 == "" then
		return nil
	end

	return slot_0_15_3 .. var_117_5
end

function slot_0_7_0.get_profile_definition()
	return slot_0_102_5(slot_0_42_8())
end

function slot_0_7_0.get_segment_animation_key(arg_119_0)
	return slot_0_64_21(arg_119_0)
end

function slot_0_7_0.get_segment_animation_channel(arg_120_0)
	return slot_0_65_21(arg_120_0)
end

function slot_0_7_0.get_segment_animation_repeat(arg_121_0)
	return slot_0_66_21(arg_121_0)
end

function slot_0_7_0.get_segment_animation_direction(arg_122_0)
	return slot_0_67_21(arg_122_0)
end

function slot_0_7_0.get_segment_animation_reverse(arg_123_0)
	return slot_0_68_18(arg_123_0)
end

function slot_0_7_0.get_segment_animation_shape(arg_124_0)
	return slot_0_69_21(arg_124_0)
end

function slot_0_7_0.get_segment_glyph_animation_key(arg_125_0)
	return slot_0_70_20(arg_125_0)
end

function slot_0_7_0.get_segment_glyph_glitch_enabled(arg_126_0)
	return slot_0_71_20(arg_126_0)
end

function slot_0_7_0.apply_profile_definition(arg_127_0)
	local var_127_0 = slot_0_43_7(arg_127_0)

	if var_127_0 == nil then
		return nil
	end

	slot_0_7_0.set_name(var_127_0)

	return var_127_0
end

function slot_0_7_0.get_default_position()
	return slot_0_55_18(render.screen_size())
end

function slot_0_7_0.get_font()
	return slot_0_38_8()
end

function slot_0_7_0.hex_to_color(arg_130_0)
	return slot_0_54_17(arg_130_0)
end

function slot_0_7_0.color_to_hex(arg_131_0)
	if arg_131_0 == nil then
		return nil
	end

	return slot_0_51_14(arg_131_0.r or 255, arg_131_0.g or 255, arg_131_0.b or 255, arg_131_0.a or 255)
end

function slot_0_7_0.get_default_color_hex()
	return slot_0_53_18()
end

function slot_0_7_0.bind_config_refs(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	slot_0_24_5.text = arg_133_0
	slot_0_24_5.position_x = arg_133_1
	slot_0_24_5.position_y = arg_133_2
	slot_0_24_5.font = arg_133_3
end

function slot_0_7_0.consume_bound_text_ref_value(arg_134_0)
	if slot_0_25_5 == nil then
		return false
	end

	if slot_0_25_5 ~= arg_134_0 then
		slot_0_25_5 = nil

		return false
	end

	slot_0_25_5 = nil

	return true
end

function slot_0_7_0.set_position_x(arg_135_0)
	if type(arg_135_0) ~= "number" then
		return
	end

	slot_0_23_6.position_x = arg_135_0
end

function slot_0_7_0.set_position_y(arg_136_0)
	if type(arg_136_0) ~= "number" then
		return
	end

	slot_0_23_6.position_y = arg_136_0
end

function slot_0_7_0.set_font(arg_137_0)
	slot_0_23_6.font_index = slot_0_37_9(arg_137_0)

	if type(slot_0_23_6.api_profile) == "table" then
		slot_0_23_6.api_profile.font = slot_0_23_6.font_index
	end

	slot_0_99_6()
end

slot_0_41_8()

slot_0_8_1 = nil
slot_0_8_0 = {}
slot_0_9_2 = {}
slot_0_10_3 = {
	[0] = ""
}

function slot_0_11_4(arg_138_0)
	if type(arg_138_0) ~= "number" then
		return ""
	end

	if arg_138_0 <= 0 then
		return ""
	end

	local var_138_0 = math.floor(arg_138_0)
	local var_138_1 = arg_138_0 - var_138_0 >= 0.5
	local var_138_2 = tostring(var_138_0) .. ":" .. tostring(var_138_1)
	local var_138_3 = slot_0_10_3[var_138_2]

	if var_138_3 ~= nil then
		return var_138_3
	end

	local var_138_4 = ""

	if var_138_0 > 0 then
		var_138_4 = string.rep(" ", var_138_0)
	end

	if var_138_1 then
		var_138_4 = var_138_4 .. slot_0_3_0
	end

	slot_0_10_3[var_138_2] = var_138_4

	return var_138_4
end

function slot_0_12_3(arg_139_0)
	if arg_139_0 == nil then
		return ""
	end

	if arg_139_0 == "" then
		return ""
	end

	if arg_139_0:sub(1, 2) == "\a" then
		return arg_139_0
	end

	return "\a" .. arg_139_0
end

function slot_0_8_0.get(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	if arg_140_0 == nil then
		return "\aDEFAULT"
	end

	if arg_140_0 == "" then
		return "\aDEFAULT"
	end

	local var_140_0 = slot_0_9_2[arg_140_0]

	if var_140_0 == nil then
		var_140_0 = ui.get_icon(arg_140_0)
		slot_0_9_2[arg_140_0] = var_140_0
	end

	if arg_140_1 == nil then
		arg_140_1 = 0
	end

	if arg_140_2 == nil then
		arg_140_2 = 0
	end

	local var_140_1 = slot_0_11_4(arg_140_1)
	local var_140_2 = slot_0_11_4(arg_140_2)

	return slot_0_12_3(arg_140_3) .. var_140_1 .. var_140_0 .. var_140_2 .. "\aDEFAULT"
end

slot_0_8_0.menu_icon_animations = {
	callback_registered = false,
	items = {},
	active_items = {},
	active_item_types = {
		listable = true,
		selectable = true,
		combo = true,
		switch = true,
		slider = true
	},
	disabled_combo_values = {
		Disabled = true,
		Off = true,
		None = true
	}
}

function slot_0_8_0.menu_icon_animations.get_animation_speed()
	if slot_0_8_0.menu_icon_animations.animation_speed_ref == nil then
		local var_141_0, var_141_1 = pcall(ui.find, "Settings", "Animation Speed")

		if var_141_0 and var_141_1 ~= nil then
			slot_0_8_0.menu_icon_animations.animation_speed_ref = var_141_1
		else
			slot_0_8_0.menu_icon_animations.animation_speed_ref = false
		end
	end

	local var_141_2 = slot_0_8_0.menu_icon_animations.animation_speed_ref

	if var_141_2 == false then
		return 1
	end

	local var_141_3, var_141_4 = pcall(var_141_2.get, var_141_2)

	if var_141_3 and type(var_141_4) == "number" and var_141_4 > 0 then
		return var_141_4
	end

	return 1
end

function slot_0_8_0.menu_icon_animations.parse_name(arg_142_0)
	if type(arg_142_0) ~= "string" then
		return nil
	end

	if arg_142_0:sub(1, 2) ~= "\a" then
		return nil
	end

	local var_142_0

	if arg_142_0:sub(3, 3) == "{" then
		var_142_0 = arg_142_0:find("}", 4, true)
	else
		local var_142_1 = arg_142_0:match("^\a([A-Za-z0-9_]+)")

		if var_142_1 ~= nil then
			var_142_0 = 2 + #var_142_1
		end
	end

	if var_142_0 == nil then
		return nil
	end

	local var_142_2 = arg_142_0:find("\aDEFAULT", var_142_0 + 1, true)

	if var_142_2 == nil then
		return nil
	end

	local var_142_3 = arg_142_0:sub(var_142_0 + 1, var_142_2 - 1)

	if var_142_3 == "" then
		return nil
	end

	return {
		icon_body = var_142_3,
		tail = arg_142_0:sub(var_142_2 + #"\aDEFAULT")
	}
end

function slot_0_8_0.menu_icon_animations.get_icon_color_hex(arg_143_0)
	local var_143_0 = ui.get_style("Small Text")
	local var_143_1 = ui.get_style("Link Active")

	if var_143_0 == nil or var_143_1 == nil then
		return nil
	end

	return var_143_0:lerp(var_143_1, arg_143_0):to_hex()
end

function slot_0_8_0.menu_icon_animations.build_name(arg_144_0, arg_144_1)
	if arg_144_0 == nil then
		return nil
	end

	local var_144_0 = slot_0_8_0.menu_icon_animations.get_icon_color_hex(arg_144_1)

	if type(var_144_0) ~= "string" then
		return nil
	end

	return "\a" .. var_144_0 .. arg_144_0.icon_body .. "\aDEFAULT" .. arg_144_0.tail
end

function slot_0_8_0.menu_icon_animations.refresh_parts(arg_145_0)
	local var_145_0, var_145_1 = pcall(arg_145_0.item.name, arg_145_0.item)

	if not var_145_0 or type(var_145_1) ~= "string" then
		return false
	end

	if var_145_1 == arg_145_0.last_applied_name then
		return arg_145_0.parts ~= nil
	end

	arg_145_0.parts = slot_0_8_0.menu_icon_animations.parse_name(var_145_1)

	return arg_145_0.parts ~= nil
end

function slot_0_8_0.menu_icon_animations.apply_name(arg_146_0, arg_146_1)
	if slot_0_8_0.menu_icon_animations.refresh_parts(arg_146_0) ~= true then
		return false
	end

	local var_146_0 = slot_0_8_0.menu_icon_animations.build_name(arg_146_0.parts, arg_146_1)

	if type(var_146_0) ~= "string" then
		return false
	end

	arg_146_0.last_applied_name = var_146_0

	pcall(arg_146_0.item.name, arg_146_0.item, var_146_0)

	return true
end

function slot_0_8_0.menu_icon_animations.resolve_active_value(arg_147_0, arg_147_1)
	if arg_147_0 == "combo" then
		return type(arg_147_1) == "string" and slot_0_8_0.menu_icon_animations.disabled_combo_values[arg_147_1] ~= true
	end

	if arg_147_0 == "selectable" or arg_147_0 == "listable" then
		return type(arg_147_1) == "table" and next(arg_147_1) ~= nil
	end

	if arg_147_0 == "slider" then
		return type(arg_147_1) == "number" and arg_147_1 ~= 0
	end

	if type(arg_147_1) == "boolean" then
		return arg_147_1
	end

	if type(arg_147_1) == "number" then
		return arg_147_1 ~= 0
	end

	if type(arg_147_1) == "string" then
		return arg_147_1 ~= "" and slot_0_8_0.menu_icon_animations.disabled_combo_values[arg_147_1] ~= true
	end

	if type(arg_147_1) == "table" then
		return next(arg_147_1) ~= nil
	end

	return false
end

function slot_0_8_0.menu_icon_animations.get_target_progress(arg_148_0)
	local var_148_0, var_148_1 = pcall(arg_148_0.item.get, arg_148_0.item)

	if not var_148_0 then
		return 0
	end

	if slot_0_8_0.menu_icon_animations.resolve_active_value(arg_148_0.item_type, var_148_1) == true then
		return 1
	end

	return 0
end

function slot_0_8_0.menu_icon_animations.update_render_state(arg_149_0)
	if slot_0_8_0.menu_icon_animations.callback_registered == arg_149_0 then
		return
	end

	events.render(slot_0_8_0.menu_icon_animations.on_render, arg_149_0)

	slot_0_8_0.menu_icon_animations.callback_registered = arg_149_0
end

function slot_0_8_0.menu_icon_animations.mark_active(arg_150_0)
	if arg_150_0.is_animating == true then
		return
	end

	arg_150_0.is_animating = true
	slot_0_8_0.menu_icon_animations.active_items[#slot_0_8_0.menu_icon_animations.active_items + 1] = arg_150_0

	slot_0_8_0.menu_icon_animations.update_render_state(true)
end

function slot_0_8_0.menu_icon_animations.on_render()
	local var_151_0 = slot_0_8_0.menu_icon_animations.get_animation_speed()
	local var_151_1 = math.min(1, globals.frametime * 14 * var_151_0)
	local var_151_2 = slot_0_8_0.menu_icon_animations.active_items
	local var_151_3 = 1

	for iter_151_0 = 1, #var_151_2 do
		local var_151_4 = var_151_2[iter_151_0]

		if var_151_4 ~= nil then
			var_151_4.progress = var_151_4.progress + (var_151_4.target - var_151_4.progress) * var_151_1

			if math.abs(var_151_4.target - var_151_4.progress) <= 0.001 then
				var_151_4.progress = var_151_4.target
			end

			slot_0_8_0.menu_icon_animations.apply_name(var_151_4, var_151_4.progress)

			if var_151_4.progress ~= var_151_4.target then
				var_151_2[var_151_3] = var_151_4
				var_151_3 = var_151_3 + 1
			else
				var_151_4.is_animating = false
			end
		end
	end

	for iter_151_1 = var_151_3, #var_151_2 do
		var_151_2[iter_151_1] = nil
	end

	if var_151_3 == 1 then
		slot_0_8_0.menu_icon_animations.update_render_state(false)
	end
end

function slot_0_8_0.menu_icon_animations.track_item(arg_152_0, arg_152_1)
	if arg_152_0 == nil or slot_0_8_0.menu_icon_animations.active_item_types[arg_152_1] ~= true then
		return
	end

	if slot_0_8_0.menu_icon_animations.items[arg_152_0] ~= nil then
		return
	end

	local var_152_0, var_152_1 = pcall(arg_152_0.name, arg_152_0)

	if not var_152_0 or type(var_152_1) ~= "string" then
		return
	end

	local var_152_2 = slot_0_8_0.menu_icon_animations.parse_name(var_152_1)

	if var_152_2 == nil then
		return
	end

	local var_152_3 = {
		is_animating = false,
		progress = 0,
		target = 0,
		item = arg_152_0,
		item_type = arg_152_1,
		parts = var_152_2
	}

	slot_0_8_0.menu_icon_animations.items[arg_152_0] = var_152_3

	local function var_152_4()
		var_152_3.target = slot_0_8_0.menu_icon_animations.get_target_progress(var_152_3)

		if slot_0_8_0.menu_icon_animations.refresh_parts(var_152_3) ~= true then
			return
		end

		if var_152_3.progress == var_152_3.target then
			slot_0_8_0.menu_icon_animations.apply_name(var_152_3, var_152_3.progress)

			return
		end

		slot_0_8_0.menu_icon_animations.mark_active(var_152_3)
	end

	var_152_3.target = slot_0_8_0.menu_icon_animations.get_target_progress(var_152_3)
	var_152_3.progress = var_152_3.target

	slot_0_8_0.menu_icon_animations.apply_name(var_152_3, var_152_3.progress)
	pcall(arg_152_0.set_callback, arg_152_0, var_152_4)
end

slot_0_9_1 = nil
slot_0_9_0 = {
	press = "ui/csgo_ui_contract_type1.wav",
	confirm = "ui/csgo_ui_store_rollover.wav",
	back = "ui\\menu_back",
	success = "ui/menu_accept.wav",
	scroll = "ui/csgo_ui_page_scroll.wav",
	error = "ui/panorama/lobby_error_01.wav"
}
slot_0_10_2 = cvar.playvol
slot_0_11_3 = 1

function slot_0_9_0.play(arg_154_0)
	slot_0_10_2:call(arg_154_0, slot_0_11_3)
end

slot_0_10_1 = nil
slot_0_10_0 = {}
slot_0_11_2 = "\aCE4848FF"
slot_0_12_2 = "\aA0CE48FF"

function slot_0_10_0.error(arg_155_0)
	print_raw(slot_0_11_2 .. arg_155_0)
	print_dev(slot_0_11_2 .. arg_155_0)
	slot_0_9_0.play(slot_0_9_0.error)
end

function slot_0_10_0.success(arg_156_0)
	print_raw(slot_0_12_2 .. arg_156_0)
	print_dev(slot_0_12_2 .. arg_156_0)
	slot_0_9_0.play(slot_0_9_0.success)
end

slot_0_11_1 = nil
slot_0_11_0 = {
	rage = {
		main = {
			dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
			hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
			hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
			double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
			double_tap_lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
			peek_assist = {
				ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
				{
					ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style")
				},
				ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
				ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
			}
		},
		selection = {
			hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
			minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
		},
		safety = {
			body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
			safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
		}
	},
	aa = {
		angles = {
			enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
			pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
			yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
			yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
			yaw_add = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
			hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
			avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
			yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
			modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
			body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
			inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
			left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
			right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
			options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
			body_yaw_freestanding_desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
			freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
			disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
			body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
			extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
			extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
			extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
		},
		fake_lag = {
			enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
			limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
		},
		misc = {
			fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
			slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
			leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
		}
	},
	visuals = {
		world = {
			other = {}
		}
	},
	misc = {
		main = {
			movement = {
				air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"),
				strafe_assist = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist"),
				air_duck = ui.find("Miscellaneous", "Main", "Movement", "Air Duck"),
				quick_stop = ui.find("Miscellaneous", "Main", "Movement", "Quick Stop")
			},
			in_game = {
				clan_tag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
			},
			other = {
				windows = ui.find("Miscellaneous", "Main", "Other", "Windows"),
				log_events = ui.find("Miscellaneous", "Main", "Other", "Log Events"),
				fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
				weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
			}
		}
	}
}
slot_0_12_1 = nil

if slot_0_11_0 ~= nil and slot_0_11_0.aa ~= nil and slot_0_11_0.aa.angles ~= nil then
	slot_0_12_1 = slot_0_11_0.aa.angles.modifier_offset
end

if slot_0_12_1 ~= nil then
	slot_0_12_1:disabled(true)
end

slot_0_12_0 = {
	main = slot_0_8_0.get("house-blank", 0, 0, "{Link Active}"),
	angles = slot_0_8_0.get("shield", 0, 0, "{Link Active}"),
	misc = slot_0_8_0.get("tag", 0, 0, "{Link Active}"),
	ui_symbols = {
		prefix_dot = "\a{Link Active}•\aDEFAULT",
		prefix_arrow = "\a{Link Active}›\aDEFAULT"
	}
}
slot_0_13_1 = nil
slot_0_14_1 = "__andromeda_binds"
slot_0_15_2 = "__andromeda_raw"
slot_0_16_2 = "andromeda-new:"
slot_0_17_3 = "andromeda_cfg:"
slot_0_18_2 = "andromeda_cfg_store"
slot_0_19_4 = "andromeda_last_session_v1"
slot_0_20_4 = "andromeda"
slot_0_21_4 = slot_0_20_4 .. "/nl_remake_presets.dat"
slot_0_22_4 = "andromeda_cfg_legacy_purged_v1"
slot_0_13_0 = {
	_items = {}
}

if type(db) ~= "table" then
	db = {}
end

if db[slot_0_22_4] ~= true then
	slot_0_23_5 = db.config_list

	if type(slot_0_23_5) == "table" then
		for iter_0_0, iter_0_1 in ipairs(slot_0_23_5) do
			if type(iter_0_1) == "string" and iter_0_1 ~= "" then
				db[iter_0_1] = nil
			end
		end
	end

	db.config_list = nil
	db.config_meta = nil
	db[slot_0_22_4] = true
end

slot_0_23_4 = db[slot_0_18_2]

if type(slot_0_23_4) ~= "table" then
	slot_0_23_4 = {}
end

if type(slot_0_23_4.configs) ~= "table" then
	slot_0_23_4.configs = {}
end

if type(slot_0_23_4.list) ~= "table" then
	slot_0_23_4.list = {}
end

if type(slot_0_23_4.meta) ~= "table" then
	slot_0_23_4.meta = {}
end

slot_0_24_4 = nil
slot_0_25_4 = nil
slot_0_26_6 = nil
slot_0_27_7 = nil
slot_0_28_6 = nil
slot_0_29_8 = 0.35
slot_0_30_11 = {
	next_flush_time = 0,
	suppress = false,
	dirty = false
}
slot_0_31_14 = {}
slot_0_32_13 = nil

function slot_0_33_10()
	db[slot_0_18_2] = slot_0_23_4

	if slot_0_28_6 ~= nil then
		slot_0_28_6()
	end
end

function slot_0_34_8(arg_158_0, arg_158_1)
	for iter_158_0, iter_158_1 in ipairs(arg_158_0) do
		if iter_158_1 == arg_158_1 then
			return true
		end
	end

	return false
end

function slot_0_35_8()
	return slot_0_23_4.meta
end

function slot_0_36_8()
	local var_160_0 = slot_0_23_4.list

	if type(var_160_0) ~= "table" then
		var_160_0 = {}
	end

	local var_160_1 = {}

	for iter_160_0, iter_160_1 in ipairs(var_160_0) do
		local var_160_2 = type(iter_160_1) == "string"
		local var_160_3 = slot_0_23_4.configs[iter_160_1]
		local var_160_4 = type(var_160_3) == "string" and var_160_3 ~= ""

		if var_160_2 and var_160_4 then
			var_160_1[#var_160_1 + 1] = iter_160_1
		end
	end

	return var_160_1
end

function slot_0_37_8(arg_161_0)
	if slot_0_25_4 == nil then
		return
	end

	if slot_0_24_4 == nil then
		return
	end

	slot_0_25_4:set(arg_161_0)

	local var_161_0 = slot_0_24_4:list()

	if type(var_161_0) ~= "table" then
		return
	end

	for iter_161_0, iter_161_1 in ipairs(var_161_0) do
		if iter_161_1 == arg_161_0 then
			slot_0_24_4:set(iter_161_0)

			return
		end
	end
end

function slot_0_38_7(arg_162_0)
	local var_162_0 = {}
	local var_162_1 = arg_162_0:list()

	if type(var_162_1) ~= "table" then
		local var_162_2 = arg_162_0:get()

		var_162_0.default = {
			{
				r = var_162_2.r,
				g = var_162_2.g,
				b = var_162_2.b,
				a = var_162_2.a
			}
		}

		return var_162_0
	end

	if #var_162_1 == 0 then
		local var_162_3 = arg_162_0:get()

		var_162_0.default = {
			{
				r = var_162_3.r,
				g = var_162_3.g,
				b = var_162_3.b,
				a = var_162_3.a
			}
		}

		return var_162_0
	end

	for iter_162_0, iter_162_1 in ipairs(var_162_1) do
		local var_162_4, var_162_5 = pcall(arg_162_0.get, arg_162_0, iter_162_1)

		if var_162_4 and type(var_162_5) == "table" then
			var_162_0[iter_162_1] = {}

			for iter_162_2, iter_162_3 in ipairs(var_162_5) do
				var_162_0[iter_162_1][iter_162_2] = {
					r = iter_162_3.r,
					g = iter_162_3.g,
					b = iter_162_3.b,
					a = iter_162_3.a
				}
			end
		end
	end

	return var_162_0
end

function slot_0_39_7(arg_163_0, arg_163_1)
	if type(arg_163_1) ~= "table" then
		return
	end

	for iter_163_0, iter_163_1 in pairs(arg_163_1) do
		if type(iter_163_1) == "table" then
			local var_163_0 = {}

			for iter_163_2, iter_163_3 in ipairs(iter_163_1) do
				if type(iter_163_3) == "table" then
					var_163_0[iter_163_2] = color(iter_163_3.r or 0, iter_163_3.g or 0, iter_163_3.b or 0, iter_163_3.a or 255)
				end
			end

			arg_163_0:set(iter_163_0, var_163_0)
		end
	end
end

function slot_0_40_8(arg_164_0)
	local var_164_0, var_164_1 = pcall(arg_164_0.key, arg_164_0)

	if not var_164_0 then
		return nil
	end

	if type(var_164_1) ~= "number" then
		return nil
	end

	if var_164_1 == 0 then
		return nil
	end

	return var_164_1
end

function slot_0_41_7(arg_165_0, arg_165_1)
	if type(arg_165_1) ~= "table" then
		return
	end

	for iter_165_0, iter_165_1 in pairs(arg_165_1) do
		if type(iter_165_1) == "table" then
			local var_165_0 = iter_165_1.reference

			if var_165_0 ~= nil then
				arg_165_0[var_165_0] = {
					mode = iter_165_1.mode,
					value = iter_165_1.value
				}
			end
		end
	end
end

function slot_0_42_7()
	local var_166_0 = {}
	local var_166_1, var_166_2 = pcall(ui.get_binds)

	if var_166_1 then
		slot_0_41_7(var_166_0, var_166_2)
	end

	local var_166_3, var_166_4 = pcall(ui.get_binds, true)

	if var_166_3 then
		slot_0_41_7(var_166_0, var_166_4)
	end

	return var_166_0
end

function slot_0_43_6(arg_167_0, arg_167_1)
	local var_167_0 = slot_0_40_8(arg_167_0)
	local var_167_1
	local var_167_2
	local var_167_3 = arg_167_1[arg_167_0]

	if type(var_167_3) == "table" then
		var_167_1 = var_167_3.mode
		var_167_2 = var_167_3.value
	end

	if var_167_0 == nil and var_167_1 == nil and var_167_2 == nil then
		return nil
	end

	return {
		key = var_167_0,
		mode = var_167_1,
		value = var_167_2
	}
end

function slot_0_44_6(arg_168_0, arg_168_1)
	if type(arg_168_1) ~= "table" then
		return
	end

	local var_168_0 = arg_168_1.key

	if var_168_0 == nil and type(arg_168_1.value) == "number" then
		var_168_0 = arg_168_1.value
	end

	if var_168_0 == nil then
		return
	end

	if arg_168_1.mode ~= nil then
		if pcall(arg_168_0.key, arg_168_0, var_168_0, arg_168_1.mode) then
			return
		end

		if pcall(arg_168_0.key, arg_168_0, arg_168_1.mode, var_168_0) then
			return
		end
	end

	pcall(arg_168_0.key, arg_168_0, var_168_0)
end

slot_0_45_6 = {
	color_picker = {
		get = slot_0_38_7,
		set = slot_0_39_7
	},
	hotkey = {
		get = function(arg_169_0)
			local var_169_0, var_169_1 = pcall(arg_169_0.key, arg_169_0)

			if var_169_0 then
				return var_169_1
			end

			return arg_169_0:get()
		end,
		set = function(arg_170_0, arg_170_1)
			if pcall(arg_170_0.key, arg_170_0, arg_170_1) then
				return
			end

			arg_170_0:set(arg_170_1)
		end
	},
	default = {
		get = function(arg_171_0)
			return arg_171_0:get()
		end,
		set = function(arg_172_0, arg_172_1)
			arg_172_0:set(arg_172_1)
		end
	}
}

function slot_0_46_5(arg_173_0)
	return slot_0_4_0.encode(arg_173_0)
end

function slot_0_47_11(arg_174_0)
	return slot_0_4_0.decode(arg_174_0)
end

function slot_0_48_10(arg_175_0)
	if type(arg_175_0) ~= "string" or arg_175_0 == "" then
		return nil
	end

	local var_175_0, var_175_1 = pcall(json.parse, arg_175_0)

	if not var_175_0 or type(var_175_1) ~= "table" then
		return nil
	end

	return var_175_1
end

function slot_0_26_5(arg_176_0)
	local var_176_0 = slot_0_46_5(arg_176_0)

	if var_176_0 == nil then
		return nil
	end

	return slot_0_16_2 .. var_176_0
end

function slot_0_27_6(arg_177_0)
	if type(arg_177_0) ~= "string" then
		return nil
	end

	if arg_177_0 == "" then
		return nil
	end

	local var_177_0 = arg_177_0

	if arg_177_0:sub(1, #slot_0_16_2) == slot_0_16_2 then
		var_177_0 = arg_177_0:sub(#slot_0_16_2 + 1)

		if var_177_0 == "" then
			return nil
		end

		return slot_0_47_11(var_177_0)
	end

	if arg_177_0:sub(1, #slot_0_17_3) == slot_0_17_3 then
		var_177_0 = arg_177_0:sub(#slot_0_17_3 + 1)
	end

	if var_177_0 == "" then
		return nil
	end

	local var_177_1 = slot_0_47_11(var_177_0)

	if var_177_1 ~= nil then
		return var_177_1
	end

	return slot_0_48_10(var_177_0)
end

function slot_0_49_11(arg_178_0)
	local var_178_0 = {}

	if type(arg_178_0) ~= "table" then
		return var_178_0
	end

	for iter_178_0, iter_178_1 in pairs(arg_178_0) do
		var_178_0[iter_178_0] = iter_178_1
	end

	return var_178_0
end

function slot_0_50_14(arg_179_0)
	if type(arg_179_0) == "table" then
		return arg_179_0
	end

	return slot_0_27_6(arg_179_0)
end

slot_0_31_13 = slot_0_49_11(slot_0_50_14(db[slot_0_19_4]))

function slot_0_51_13(arg_180_0)
	if type(arg_180_0) ~= "table" or type(arg_180_0.configs) ~= "table" then
		return false
	end

	return next(arg_180_0.configs) ~= nil
end

function slot_0_52_18()
	if type(files) ~= "table" or type(files.read) ~= "function" then
		return nil
	end

	local var_181_0, var_181_1 = pcall(files.read, slot_0_21_4)

	if not var_181_0 or type(var_181_1) ~= "string" or var_181_1 == "" then
		return nil
	end

	return slot_0_27_6(var_181_1)
end

function slot_0_28_6()
	if type(files) ~= "table" or type(files.write) ~= "function" then
		return false
	end

	local var_182_0 = slot_0_26_5(slot_0_23_4)

	if type(var_182_0) ~= "string" or var_182_0 == "" then
		return false
	end

	if type(files.create_folder) == "function" then
		pcall(files.create_folder, slot_0_20_4)
	end

	local var_182_1, var_182_2 = pcall(files.write, slot_0_21_4, var_182_0)

	return var_182_1 and var_182_2 ~= false
end

if (function(arg_183_0)
	if slot_0_51_13(arg_183_0) ~= true then
		return false
	end

	local var_183_0 = false

	for iter_183_0, iter_183_1 in pairs(arg_183_0.configs) do
		if type(iter_183_0) == "string" and iter_183_0 ~= "" and type(iter_183_1) == "string" and iter_183_1 ~= "" and slot_0_23_4.configs[iter_183_0] == nil then
			slot_0_23_4.configs[iter_183_0] = iter_183_1
			var_183_0 = true
		end
	end

	if type(arg_183_0.meta) == "table" then
		for iter_183_2, iter_183_3 in pairs(arg_183_0.meta) do
			if type(iter_183_2) == "string" and slot_0_23_4.configs[iter_183_2] ~= nil and slot_0_23_4.meta[iter_183_2] == nil then
				slot_0_23_4.meta[iter_183_2] = iter_183_3
				var_183_0 = true
			end
		end
	end

	local var_183_1 = slot_0_36_8()

	if type(arg_183_0.list) == "table" then
		for iter_183_4, iter_183_5 in ipairs(arg_183_0.list) do
			if type(iter_183_5) == "string" and slot_0_23_4.configs[iter_183_5] ~= nil and slot_0_34_8(var_183_1, iter_183_5) ~= true then
				var_183_1[#var_183_1 + 1] = iter_183_5
				var_183_0 = true
			end
		end
	end

	for iter_183_6 in pairs(slot_0_23_4.configs) do
		if type(iter_183_6) == "string" and slot_0_34_8(var_183_1, iter_183_6) ~= true then
			var_183_1[#var_183_1 + 1] = iter_183_6
			var_183_0 = true
		end
	end

	slot_0_23_4.list = var_183_1

	return var_183_0
end)(slot_0_52_18()) == true then
	slot_0_33_10()
end

function slot_0_54_16()
	local var_184_0 = {}
	local var_184_1 = {}
	local var_184_2 = {}
	local var_184_3 = slot_0_42_7()

	for iter_184_0, iter_184_1 in ipairs(slot_0_13_0._items) do
		local var_184_4, var_184_5 = pcall(iter_184_1.get)

		if var_184_4 then
			var_184_0[iter_184_1.id] = var_184_5
		end

		local var_184_6, var_184_7 = pcall(iter_184_1.ref.export, iter_184_1.ref)

		if var_184_6 and var_184_7 ~= nil then
			var_184_2[iter_184_1.id] = var_184_7
		end

		local var_184_8 = slot_0_43_6(iter_184_1.ref, var_184_3)

		if var_184_8 ~= nil then
			var_184_1[iter_184_1.id] = var_184_8
		end
	end

	if next(var_184_2) ~= nil then
		var_184_0[slot_0_15_2] = var_184_2
	end

	if next(var_184_1) ~= nil then
		var_184_0[slot_0_14_1] = var_184_1
	end

	return var_184_0
end

function slot_0_13_0.bind_controls(arg_185_0, arg_185_1)
	slot_0_24_4 = arg_185_0
	slot_0_25_4 = arg_185_1
end

slot_0_55_17 = {
	main_home_watermark_font = true,
	main_home_watermark_position_y = true,
	main_home_watermark_position_x = true,
	main_home_watermark_text = true,
	main_rage_dormant_aimbot = true,
	main_rage_auto_unpeek_enabled = true,
	main_rage_ai_peek_enabled = true,
	angles_hotkeys_manual_direction = true,
	angles_hotkeys_freestanding_switch = true
}

function slot_0_56_15(arg_186_0)
	if arg_186_0 == nil then
		return false
	end

	local var_186_0
	local var_186_1, var_186_2 = pcall(arg_186_0.id, arg_186_0)

	if var_186_1 then
		var_186_0 = var_186_2
	end

	local var_186_3, var_186_4 = pcall(ui.get_binds, true)

	if not var_186_3 or type(var_186_4) ~= "table" then
		return false
	end

	for iter_186_0 = 1, #var_186_4 do
		local var_186_5 = var_186_4[iter_186_0]

		if type(var_186_5) == "table" then
			local var_186_6 = var_186_5.reference

			if var_186_6 ~= nil then
				local var_186_7 = var_186_6 == arg_186_0

				if not var_186_7 and var_186_0 ~= nil then
					local var_186_8, var_186_9 = pcall(var_186_6.id, var_186_6)

					if var_186_8 and var_186_9 == var_186_0 then
						var_186_7 = true
					end
				end

				if var_186_7 then
					return true
				end
			end
		end
	end

	return false
end

function slot_0_57_17(arg_187_0, arg_187_1, arg_187_2)
	if type(arg_187_2) == "string" and slot_0_55_17[arg_187_2] == true then
		return
	end

	local var_187_0 = slot_0_9_0.press

	if arg_187_1 == "slider" then
		var_187_0 = slot_0_9_0.scroll
	end

	local var_187_1 = false
	local var_187_2

	local function var_187_3()
		local var_188_0, var_188_1 = pcall(arg_187_0.get, arg_187_0)

		if not var_188_0 then
			slot_0_9_0.play(var_187_0)

			return
		end

		if not var_187_1 then
			var_187_1 = true
			var_187_2 = var_188_1

			slot_0_9_0.play(var_187_0)

			return
		end

		if var_188_1 == var_187_2 then
			return
		end

		var_187_2 = var_188_1

		if ui.get_alpha() <= 0 and slot_0_56_15(arg_187_0) then
			return
		end

		slot_0_9_0.play(var_187_0)
	end

	pcall(arg_187_0.set_callback, arg_187_0, var_187_3)
end

function slot_0_58_17(arg_189_0)
	if type(arg_189_0) ~= "string" then
		return false
	end

	return string.find(arg_189_0, "yaw_modifier_mode", 1, true) ~= nil
end

function slot_0_59_19(arg_190_0, arg_190_1)
	if type(arg_190_0) ~= "string" then
		return arg_190_1
	end

	if type(arg_190_1) ~= "string" then
		return arg_190_1
	end

	if string.find(arg_190_0, "yaw_modifier_mode", 1, true) ~= nil then
		if arg_190_1 == "Left Add" or arg_190_1 == "Left" or arg_190_1 == "Right Add" or arg_190_1 == "Right" or arg_190_1 == "Hybrid" or arg_190_1 == "Stair" then
			return "Offset"
		end

		if arg_190_1 == "3-way" then
			return "3-Way"
		end

		return arg_190_1
	end

	return arg_190_1
end

function slot_0_60_20()
	slot_0_31_13 = slot_0_54_16()
end

function slot_0_61_21()
	if type(slot_0_31_13) ~= "table" then
		return false
	end

	db[slot_0_19_4] = slot_0_31_13

	return true
end

function slot_0_62_21()
	if slot_0_30_11.dirty ~= true then
		if slot_0_32_13 ~= nil then
			events.render(slot_0_32_13, false)
		end

		return false
	end

	slot_0_30_11.dirty = false
	slot_0_30_11.next_flush_time = 0

	local var_193_0 = slot_0_61_21()

	if slot_0_32_13 ~= nil then
		events.render(slot_0_32_13, false)
	end

	return var_193_0
end

function slot_0_63_19(arg_194_0)
	if slot_0_30_11.suppress == true then
		return
	end

	if arg_194_0 == true then
		slot_0_30_11.dirty = true

		slot_0_62_21()

		return
	end

	slot_0_30_11.dirty = true
	slot_0_30_11.next_flush_time = (globals.realtime or 0) + slot_0_29_8

	if slot_0_32_13 ~= nil then
		events.render(slot_0_32_13, true)
	end
end

function slot_0_32_13()
	if slot_0_30_11.dirty ~= true then
		events.render(slot_0_32_13, false)

		return
	end

	if (globals.realtime or 0) < slot_0_30_11.next_flush_time then
		return
	end

	slot_0_62_21()
end

slot_0_64_20 = {
	menu_visible = false,
	menu_seen = false,
	idle_interval = 1.5,
	active_interval = 0.25,
	started = false,
	next_poll_time = 0,
	value_equal = function(arg_196_0, arg_196_1)
		if arg_196_0 == arg_196_1 then
			return true
		end

		if type(arg_196_0) ~= type(arg_196_1) then
			return false
		end

		if type(arg_196_0) ~= "table" then
			return false
		end

		for iter_196_0, iter_196_1 in pairs(arg_196_0) do
			if arg_196_1[iter_196_0] ~= iter_196_1 then
				return false
			end
		end

		for iter_196_2 in pairs(arg_196_1) do
			if arg_196_0[iter_196_2] == nil then
				return false
			end
		end

		return true
	end
}

function slot_0_64_20.bind_equal(arg_197_0, arg_197_1)
	if type(arg_197_0) ~= "table" or type(arg_197_1) ~= "table" then
		return arg_197_0 == arg_197_1
	end

	return arg_197_0.key == arg_197_1.key and arg_197_0.mode == arg_197_1.mode and slot_0_64_20.value_equal(arg_197_0.value, arg_197_1.value)
end

function slot_0_64_20.maps_equal(arg_198_0, arg_198_1)
	if arg_198_0 == arg_198_1 then
		return true
	end

	if type(arg_198_0) ~= "table" then
		arg_198_0 = nil
	end

	if type(arg_198_1) ~= "table" then
		arg_198_1 = nil
	end

	if arg_198_0 == nil then
		return arg_198_1 == nil or next(arg_198_1) == nil
	end

	if arg_198_1 == nil then
		return next(arg_198_0) == nil
	end

	for iter_198_0, iter_198_1 in pairs(arg_198_0) do
		if slot_0_64_20.bind_equal(iter_198_1, arg_198_1[iter_198_0]) ~= true then
			return false
		end
	end

	for iter_198_2 in pairs(arg_198_1) do
		if arg_198_0[iter_198_2] == nil then
			return false
		end
	end

	return true
end

function slot_0_64_20.collect()
	local var_199_0 = {}
	local var_199_1 = slot_0_42_7()

	for iter_199_0, iter_199_1 in ipairs(slot_0_13_0._items) do
		local var_199_2 = slot_0_43_6(iter_199_1.ref, var_199_1)

		if var_199_2 ~= nil then
			var_199_0[iter_199_1.id] = var_199_2
		end
	end

	if next(var_199_0) == nil then
		return nil
	end

	return var_199_0
end

function slot_0_64_20.sync(arg_200_0)
	if slot_0_30_11.suppress == true then
		return false
	end

	local var_200_0 = slot_0_64_20.collect()

	if var_200_0 == nil and slot_0_31_13[slot_0_14_1] ~= nil and arg_200_0 ~= true then
		return false
	end

	if slot_0_64_20.maps_equal(slot_0_31_13[slot_0_14_1], var_200_0) then
		return false
	end

	slot_0_31_13 = slot_0_54_16()

	slot_0_63_19(true)

	return true
end

function slot_0_64_20.on_render()
	local var_201_0 = globals.realtime or 0
	local var_201_1 = ui.get_alpha() > 0

	if var_201_1 then
		slot_0_64_20.menu_seen = true
	end

	if slot_0_64_20.menu_visible ~= var_201_1 then
		slot_0_64_20.menu_visible = var_201_1
		slot_0_64_20.next_poll_time = 0
	end

	if var_201_0 < slot_0_64_20.next_poll_time then
		return
	end

	if var_201_1 then
		slot_0_64_20.next_poll_time = var_201_0 + slot_0_64_20.active_interval
	else
		slot_0_64_20.next_poll_time = var_201_0 + slot_0_64_20.idle_interval
	end

	slot_0_64_20.sync(slot_0_64_20.menu_seen)
end

function slot_0_13_0.push(arg_202_0, arg_202_1)
	local var_202_0 = arg_202_0:type()
	local var_202_1 = slot_0_45_6[var_202_0]

	if var_202_1 == nil then
		var_202_1 = slot_0_45_6.default
	end

	slot_0_8_0.menu_icon_animations.track_item(arg_202_0, var_202_0)

	local var_202_2 = arg_202_1

	if var_202_2 == nil then
		local var_202_3, var_202_4 = pcall(arg_202_0.name, arg_202_0)

		if var_202_3 and type(var_202_4) == "string" then
			var_202_2 = var_202_4
		end
	end

	if var_202_2 == "" then
		local var_202_5, var_202_6 = pcall(arg_202_0.name, arg_202_0)

		if var_202_5 and type(var_202_6) == "string" then
			var_202_2 = var_202_6
		end
	end

	slot_0_57_17(arg_202_0, var_202_0, var_202_2)

	if var_202_2 == nil then
		return arg_202_0
	end

	if var_202_2 == "" then
		return arg_202_0
	end

	pcall(arg_202_0.set_callback, arg_202_0, function()
		if slot_0_30_11.suppress == true then
			return
		end

		local var_203_0, var_203_1 = pcall(var_202_1.get, arg_202_0)

		if var_203_0 == true then
			slot_0_31_13[var_202_2] = var_203_1
		end

		slot_0_63_19(false)
	end)

	slot_0_13_0._items[#slot_0_13_0._items + 1] = {
		id = var_202_2,
		ref = arg_202_0,
		get = function()
			return var_202_1.get(arg_202_0)
		end,
		set = function(arg_205_0)
			var_202_1.set(arg_202_0, arg_205_0)
		end
	}

	return arg_202_0
end

function slot_0_13_0.apply(arg_206_0, arg_206_1)
	if type(arg_206_0) ~= "table" then
		return
	end

	local var_206_0 = true
	local var_206_1 = true

	if type(arg_206_1) == "table" then
		if arg_206_1.allow_raw == false then
			var_206_0 = false
		end

		if arg_206_1.allow_binds == false then
			var_206_1 = false
		end
	end

	local var_206_2 = arg_206_0[slot_0_14_1]
	local var_206_3 = arg_206_0[slot_0_15_2]
	local var_206_4 = var_206_1 and type(var_206_2) == "table"
	local var_206_5 = var_206_0 and type(var_206_3) == "table"

	slot_0_30_11.suppress = true

	for iter_206_0, iter_206_1 in ipairs(slot_0_13_0._items) do
		local var_206_6 = false

		if var_206_5 then
			local var_206_7 = var_206_3[iter_206_1.id]

			if var_206_7 ~= nil and slot_0_58_17(iter_206_1.id) ~= true then
				var_206_6 = pcall(iter_206_1.ref.import, iter_206_1.ref, var_206_7)
			end
		end

		if not var_206_6 then
			local var_206_8 = arg_206_0[iter_206_1.id]

			if var_206_8 ~= nil then
				local var_206_9 = slot_0_59_19(iter_206_1.id, var_206_8)

				pcall(iter_206_1.set, var_206_9)
			end
		end

		if iter_206_1.id == "angles_hotkeys_manual_left" or iter_206_1.id == "angles_hotkeys_manual_forward" or iter_206_1.id == "angles_hotkeys_manual_right" then
			local var_206_10, var_206_11 = pcall(iter_206_1.ref.key, iter_206_1.ref)

			if var_206_10 and type(var_206_11) == "number" and var_206_11 ~= 0 and not pcall(iter_206_1.ref.key, iter_206_1.ref, var_206_11, 2) then
				pcall(iter_206_1.ref.key, iter_206_1.ref, 2, var_206_11)
			end
		end

		if var_206_4 then
			local var_206_12 = var_206_2[iter_206_1.id]

			if var_206_12 ~= nil then
				if (iter_206_1.id == "angles_hotkeys_manual_left" or iter_206_1.id == "angles_hotkeys_manual_forward" or iter_206_1.id == "angles_hotkeys_manual_right") and type(var_206_12) == "table" then
					var_206_12.mode = 2
				end

				slot_0_44_6(iter_206_1.ref, var_206_12)
			end
		end
	end

	slot_0_30_11.suppress = false
	slot_0_31_13 = slot_0_49_11(arg_206_0)

	slot_0_63_19(true)
end

function slot_0_13_0.update()
	slot_0_23_4.list = slot_0_36_8()

	slot_0_33_10()
end

function slot_0_13_0.save(arg_208_0)
	if arg_208_0 == nil then
		arg_208_0 = ""
	end

	arg_208_0 = tostring(arg_208_0)

	if arg_208_0 == "" then
		return slot_0_10_0.error("Config name cannot be empty!")
	end

	local var_208_0 = slot_0_26_5(slot_0_54_16())

	if var_208_0 == nil then
		return slot_0_10_0.error("Failed to encode config")
	end

	slot_0_23_4.configs[arg_208_0] = var_208_0

	local var_208_1 = slot_0_35_8()

	if type(var_208_1[arg_208_0]) ~= "table" then
		var_208_1[arg_208_0] = {}
	end

	var_208_1[arg_208_0].created_ts = common.get_unixtime()

	local var_208_2 = slot_0_36_8()

	if not slot_0_34_8(var_208_2, arg_208_0) then
		var_208_2[#var_208_2 + 1] = arg_208_0
	end

	slot_0_23_4.list = var_208_2

	slot_0_33_10()
	slot_0_37_8(arg_208_0)
	slot_0_10_0.success("Saved: " .. arg_208_0)
end

function slot_0_13_0.remove(arg_209_0)
	if type(arg_209_0) ~= "string" then
		return slot_0_10_0.error("Config not found: " .. tostring(arg_209_0))
	end

	if arg_209_0 == "" then
		return slot_0_10_0.error("Config not found: " .. tostring(arg_209_0))
	end

	if slot_0_23_4.configs[arg_209_0] == nil then
		return slot_0_10_0.error("Config not found: " .. tostring(arg_209_0))
	end

	slot_0_23_4.configs[arg_209_0] = nil
	slot_0_35_8()[arg_209_0] = nil

	local var_209_0 = slot_0_36_8()
	local var_209_1 = ""

	for iter_209_0, iter_209_1 in ipairs(var_209_0) do
		if iter_209_1 == arg_209_0 then
			table.remove(var_209_0, iter_209_0)

			var_209_1 = var_209_0[iter_209_0 - 1]

			if type(var_209_1) ~= "string" then
				var_209_1 = var_209_0[1]
			end

			if type(var_209_1) ~= "string" then
				var_209_1 = ""
			end

			break
		end
	end

	slot_0_23_4.list = var_209_0

	slot_0_33_10()
	slot_0_37_8(var_209_1)
	slot_0_10_0.success("Removed config: " .. arg_209_0)
end

function slot_0_13_0.rename(arg_210_0, arg_210_1)
	if type(arg_210_0) ~= "string" or arg_210_0 == "" then
		slot_0_10_0.error("Config not found: " .. tostring(arg_210_0))

		return false
	end

	if type(arg_210_1) ~= "string" or arg_210_1 == "" then
		slot_0_10_0.error("Config name cannot be empty!")

		return false
	end

	if arg_210_0 == arg_210_1 then
		return true
	end

	if type(slot_0_23_4.configs[arg_210_0]) ~= "string" then
		slot_0_10_0.error("Config not found: " .. tostring(arg_210_0))

		return false
	end

	if type(slot_0_23_4.configs[arg_210_1]) == "string" then
		slot_0_10_0.error("Config already exists: " .. tostring(arg_210_1))

		return false
	end

	slot_0_23_4.configs[arg_210_1] = slot_0_23_4.configs[arg_210_0]
	slot_0_23_4.configs[arg_210_0] = nil

	local var_210_0 = slot_0_35_8()

	if type(var_210_0[arg_210_0]) == "table" then
		var_210_0[arg_210_1] = var_210_0[arg_210_0]
		var_210_0[arg_210_0] = nil
	end

	local var_210_1 = slot_0_36_8()

	for iter_210_0, iter_210_1 in ipairs(var_210_1) do
		if iter_210_1 == arg_210_0 then
			var_210_1[iter_210_0] = arg_210_1

			break
		end
	end

	slot_0_23_4.list = var_210_1

	slot_0_33_10()
	slot_0_37_8(arg_210_1)
	slot_0_10_0.success("Renamed config: " .. arg_210_0 .. " -> " .. arg_210_1)

	return true
end

function slot_0_13_0.export()
	local var_211_0 = slot_0_26_5(slot_0_54_16())

	if var_211_0 == nil then
		return slot_0_10_0.error("Failed to encode config")
	end

	slot_0_1_0.set(var_211_0)
	slot_0_10_0.success("Copied config to clipboard")
end

function slot_0_65_20(arg_212_0)
	return (arg_212_0:gsub("﻿", ""):gsub(" ", " "):gsub("^%s+", ""):gsub("%s+$", ""))
end

function slot_0_66_20(arg_213_0)
	local var_213_0 = slot_0_27_6(arg_213_0)

	if var_213_0 ~= nil then
		return var_213_0
	end

	local var_213_1 = arg_213_0:gsub("\x00", ""):gsub("[\x01-\b\v\f\x0E-\x1F]", ""):gsub("​", ""):gsub("‌", ""):gsub("‍", ""):gsub("‎", ""):gsub("‏", "")

	if var_213_1 ~= arg_213_0 then
		local var_213_2 = slot_0_27_6(var_213_1)

		if var_213_2 ~= nil then
			return var_213_2
		end
	end

	local var_213_3 = var_213_1:gsub("[\x80-\xFF]", "?")

	if var_213_3 ~= var_213_1 then
		local var_213_4 = slot_0_27_6(var_213_3)

		if var_213_4 ~= nil then
			return var_213_4
		end
	end

	return nil
end

function slot_0_67_20(arg_214_0)
	local var_214_0 = slot_0_1_0.get()

	if type(var_214_0) ~= "string" then
		if arg_214_0 then
			slot_0_10_0.error("Invalid or empty clipboard data")
		end

		return nil
	end

	if var_214_0 == "" then
		if arg_214_0 then
			slot_0_10_0.error("Invalid or empty clipboard data")
		end

		return nil
	end

	local var_214_1 = slot_0_65_20(var_214_0)

	if var_214_1 == "" then
		if arg_214_0 then
			slot_0_10_0.error("Invalid or empty clipboard data")
		end

		return nil
	end

	local var_214_2 = slot_0_66_20(var_214_1)

	if var_214_2 == nil then
		if arg_214_0 then
			slot_0_10_0.error("Invalid or empty clipboard data")
		end

		return nil
	end

	return var_214_2
end

function slot_0_13_0.read(arg_215_0)
	if type(arg_215_0) ~= "string" then
		return nil
	end

	if arg_215_0 == "" then
		return nil
	end

	return slot_0_27_6(slot_0_23_4.configs[arg_215_0])
end

function slot_0_13_0.get_list()
	return slot_0_36_8()
end

function slot_0_13_0.decode_clipboard()
	return slot_0_67_20(true)
end

function slot_0_13_0.save_session()
	slot_0_60_20()

	slot_0_30_11.dirty = true

	return slot_0_62_21()
end

function slot_0_13_0.restore_session()
	local var_219_0 = slot_0_50_14(db[slot_0_19_4])

	if type(var_219_0) ~= "table" then
		return false
	end

	slot_0_13_0.apply(var_219_0, {
		allow_raw = false
	})

	return true
end

function slot_0_13_0.start_bind_autosave()
	if slot_0_64_20.started == true then
		return
	end

	slot_0_64_20.started = true
	slot_0_64_20.next_poll_time = 0

	events.render(slot_0_64_20.on_render, true)
end

events.shutdown(function()
	events.render(slot_0_64_20.on_render, false)
	slot_0_33_10()
	slot_0_13_0.save_session()
end, true)

slot_0_14_0 = nil
slot_0_15_1 = slot_0_12_0.ui_symbols
slot_0_16_1 = ui.create(slot_0_12_0.main, slot_0_8_0.get("floppy-disk", 1, 3, "{Link Active}") .. "Preset", 1)
slot_0_17_2 = slot_0_16_1:list("", {})
slot_0_18_1 = slot_0_16_1:input("", "")

slot_0_13_0.bind_controls(slot_0_17_2, slot_0_18_1)

slot_0_19_3 = ui.create(slot_0_12_0.main, slot_0_8_0.get("address-card", 1, 3, "{Link Active}") .. "watermark", 2)
slot_0_20_3 = {
	state = {
		sync = false,
		pending_item_values = {},
		pending_hidden_ref_values = {}
	},
	ref = {}
}
slot_0_21_3 = {
	"Off",
	"Wave",
	"Orbit",
	"Scatter",
	"Heart"
}
slot_0_22_3 = slot_0_13_0.push(slot_0_19_3:input("##Watermark", slot_0_7_0.get_name()), "main_home_watermark_text")

slot_0_22_3:visibility(false)

slot_0_23_3 = {
	"wmapi:{\"font\":1,\"segments\":[{\"text\":\"L U A\",\"color\":\"96C83CFF\"},{\"text\":\" S E N S E\"},{\"text\":\" [DEVELOPER]\",\"color\":\"EB6161FF\"}]}",
	"wmapi:{\"font\":2,\"segments\":[{\"text\":\"Static watermark example\",\"color\":\"FFFFFFFF\"}]}",
	"wmapi:{\"font\":3,\"segments\":[{\"text\":\"Custom watermark example\"}]}",
	"wmapi:{\"font\":4,\"segments\":[{\"text\":\"Dual color\",\"color\":\"FF5E5EFF\"},{\"text\":\" example\",\"color\":\"5EFFE0FF\"}]}",
	"wmapi:{\"font\":1,\"segments\":[{\"text\":\"Console\",\"color\":\"FFD966FF\"},{\"text\":\" style\",\"color\":\"8EC5FFFF\"}]}"
}

function slot_0_24_3()
	print_raw("\aA0CE48FF[Andromeda] Watermark API examples:")

	for iter_222_0 = 1, #slot_0_23_3 do
		print_raw("\aA0CE48FF" .. tostring(iter_222_0) .. ". \aDEFAULT" .. slot_0_23_3[iter_222_0])
	end
end

function slot_0_25_3(arg_223_0)
	if type(arg_223_0) ~= "string" then
		return
	end

	if arg_223_0:match("^%s*(.-)%s*$") == "watermark" then
		slot_0_24_3()

		return false
	end
end

events.console_input(slot_0_25_3, true)
slot_0_22_3:set_callback(function()
	local var_224_0, var_224_1 = pcall(slot_0_22_3.get, slot_0_22_3)

	if not var_224_0 then
		return
	end

	if slot_0_7_0.consume_bound_text_ref_value(var_224_1) then
		return
	end

	if type(slot_0_20_3.consume_pending_hidden_value) == "function" and slot_0_20_3:consume_pending_hidden_value("text", var_224_1) then
		return
	end

	slot_0_7_0.set_name(var_224_1)

	if slot_0_20_3.state.sync ~= true and type(slot_0_20_3.load_from_watermark) == "function" then
		slot_0_20_3:load_from_watermark()
	end
end, true)

slot_0_26_4 = slot_0_7_0.get_default_position()
slot_0_27_5 = slot_0_13_0.push(slot_0_19_3:slider("##Watermark Position X", 0, 7680, math.floor(slot_0_26_4.x + 0.5)), "main_home_watermark_position_x")
slot_0_28_5 = slot_0_13_0.push(slot_0_19_3:slider("##Watermark Position Y", 0, 4320, math.floor(slot_0_26_4.y + 0.5)), "main_home_watermark_position_y")
slot_0_29_7 = slot_0_13_0.push(slot_0_19_3:slider("##Watermark Font", 1, 4, slot_0_7_0.get_font()), "main_home_watermark_font")

slot_0_27_5:visibility(false)
slot_0_28_5:visibility(false)
slot_0_29_7:visibility(false)
slot_0_7_0.bind_config_refs(slot_0_22_3, slot_0_27_5, slot_0_28_5, slot_0_29_7)
slot_0_27_5:set_callback(function(arg_225_0)
	if arg_225_0 == nil then
		return
	end

	local var_225_0, var_225_1 = pcall(arg_225_0.get, arg_225_0)

	if not var_225_0 or type(var_225_1) ~= "number" then
		return
	end

	slot_0_7_0.set_position_x(var_225_1)
end, true)
slot_0_28_5:set_callback(function(arg_226_0)
	if arg_226_0 == nil then
		return
	end

	local var_226_0, var_226_1 = pcall(arg_226_0.get, arg_226_0)

	if not var_226_0 or type(var_226_1) ~= "number" then
		return
	end

	slot_0_7_0.set_position_y(var_226_1)
end, true)
slot_0_29_7:set_callback(function(arg_227_0)
	if arg_227_0 == nil then
		return
	end

	local var_227_0, var_227_1 = pcall(arg_227_0.get, arg_227_0)

	if not var_227_0 or type(var_227_1) ~= "number" then
		return
	end

	if type(slot_0_20_3.consume_pending_hidden_value) == "function" and slot_0_20_3:consume_pending_hidden_value("font", var_227_1) then
		return
	end

	slot_0_7_0.set_font(var_227_1)

	if slot_0_20_3.state.sync ~= true and type(slot_0_20_3.ensure_profile) == "function" and type(slot_0_20_3.sync_general_controls) == "function" then
		slot_0_20_3:ensure_profile()

		slot_0_20_3.state.profile.font = var_227_1

		slot_0_20_3:sync_general_controls()
	end
end, true)

function slot_0_20_3.get_segment_type(arg_228_0, arg_228_1)
	return "Solid"
end

function slot_0_20_3.get_segment_animation_label(arg_229_0, arg_229_1)
	local var_229_0 = slot_0_7_0.get_segment_animation_key(arg_229_1)

	if var_229_0 == "off" then
		return "Off"
	end

	if var_229_0 == "wave" then
		return "Wave"
	end

	if var_229_0 == "sweep" then
		return "Sweep"
	end

	if var_229_0 == "pulse" then
		return "Pulse"
	end

	if var_229_0 == "breath" then
		return "Breath"
	end

	if var_229_0 == "centered" then
		return "Centered"
	end

	return "Shift"
end

function slot_0_20_3.get_segment_animation_effect_label(arg_230_0, arg_230_1)
	if slot_0_7_0.get_segment_animation_channel(arg_230_1) == "alpha" then
		return "Alpha"
	end

	return "Color"
end

function slot_0_20_3.get_segment_animation_playback_label(arg_231_0, arg_231_1)
	if slot_0_7_0.get_segment_animation_repeat(arg_231_1) == "pingpong" then
		return "Ping-Pong"
	end

	return "Loop"
end

function slot_0_20_3.get_segment_animation_direction_label(arg_232_0, arg_232_1)
	if slot_0_7_0.get_segment_animation_direction(arg_232_1) == "reverse" then
		return "Reverse"
	end

	return "Forward"
end

function slot_0_20_3.get_segment_animation_reverse_label(arg_233_0, arg_233_1)
	if slot_0_7_0.get_segment_animation_reverse(arg_233_1) == true then
		return "On"
	end

	return "Off"
end

function slot_0_20_3.get_segment_animation_shape_label(arg_234_0, arg_234_1)
	if slot_0_7_0.get_segment_animation_shape(arg_234_1) == "sharp" then
		return "Sharp"
	end

	return "Soft"
end

function slot_0_20_3.get_segment_glyph_animation_label(arg_235_0, arg_235_1)
	local var_235_0 = slot_0_7_0.get_segment_glyph_animation_key(arg_235_1)

	if var_235_0 == "wave" then
		return "Wave"
	end

	if var_235_0 == "orbit" then
		return "Orbit"
	end

	if var_235_0 == "scatter" then
		return "Scatter"
	end

	if var_235_0 == "heart" then
		return "Heart"
	end

	return "Off"
end

function slot_0_20_3.get_segment_glyph_glitch_label(arg_236_0, arg_236_1)
	if slot_0_7_0.get_segment_glyph_glitch_enabled(arg_236_1) == true then
		return "On"
	end

	return "Off"
end

function slot_0_20_3.apply_segment_mode(arg_237_0, arg_237_1, arg_237_2, arg_237_3, arg_237_4)
	if type(arg_237_1) ~= "table" then
		return
	end

	arg_237_1.animation = nil
	arg_237_1.channel = nil
	arg_237_1.repeat_mode = nil
	arg_237_1.direction = nil
	arg_237_1.reverse = nil
	arg_237_1.shape = nil
	arg_237_1.min = nil
	arg_237_1.max = nil
	arg_237_1.speed = nil
	arg_237_1.animation_span = nil
	arg_237_1.glyph_animation = nil
	arg_237_1.glyph_glitch = nil
	arg_237_1.glyph_amount = nil
	arg_237_1.glyph_speed = nil
	arg_237_1.glyph_span = nil
	arg_237_1.mode = "static"
end

function slot_0_20_3.make_default_segment(arg_238_0, arg_238_1)
	return {
		mode = "static",
		text = arg_238_1 or "Text",
		color = slot_0_7_0.get_default_color_hex()
	}
end

function slot_0_20_3.get_style_color(arg_239_0)
	local var_239_0 = ui.get_style()

	if type(var_239_0) == "table" and var_239_0["Link Active"] ~= nil then
		return var_239_0["Link Active"]
	end

	return color(255, 255, 255, 255)
end

function slot_0_20_3.get_picker_color(arg_240_0, arg_240_1)
	local var_240_0 = slot_0_7_0.hex_to_color(arg_240_1)

	if var_240_0 ~= nil then
		return var_240_0
	end

	return arg_240_0:get_style_color()
end

function slot_0_20_3.normalize_slider_number(arg_241_0, arg_241_1, arg_241_2, arg_241_3, arg_241_4)
	local var_241_0 = arg_241_1

	if type(var_241_0) ~= "number" then
		var_241_0 = arg_241_2
	end

	if var_241_0 < arg_241_3 then
		return arg_241_3
	end

	if arg_241_4 < var_241_0 then
		return arg_241_4
	end

	return var_241_0
end

function slot_0_20_3.encode_unit_slider(arg_242_0, arg_242_1, arg_242_2)
	local var_242_0 = arg_242_0:normalize_slider_number(arg_242_1, arg_242_2, 0, 1)

	return math.floor(var_242_0 * 100 + 0.5)
end

function slot_0_20_3.decode_unit_slider(arg_243_0, arg_243_1, arg_243_2)
	if type(arg_243_1) ~= "number" then
		return arg_243_2
	end

	return arg_243_0:normalize_slider_number(arg_243_1 * 0.01, arg_243_2, 0, 1)
end

function slot_0_20_3.encode_speed_slider(arg_244_0, arg_244_1)
	local var_244_0 = arg_244_0:normalize_slider_number(arg_244_1, 2, 0.01, 20)

	return math.floor(var_244_0 * 100 + 0.5)
end

function slot_0_20_3.decode_speed_slider(arg_245_0, arg_245_1)
	if type(arg_245_1) ~= "number" then
		return 2
	end

	return arg_245_0:normalize_slider_number(arg_245_1 * 0.01, 2, 0.01, 20)
end

function slot_0_20_3.encode_waves_slider(arg_246_0, arg_246_1)
	local var_246_0 = arg_246_0:normalize_slider_number(arg_246_1, 1, 0.1, 10)

	return math.floor(var_246_0 * 10 + 0.5)
end

function slot_0_20_3.decode_waves_slider(arg_247_0, arg_247_1)
	if type(arg_247_1) ~= "number" then
		return 1
	end

	return arg_247_0:normalize_slider_number(arg_247_1 * 0.1, 1, 0.1, 10)
end

function slot_0_20_3.encode_glyph_amount_slider(arg_248_0, arg_248_1)
	local var_248_0 = arg_248_0:normalize_slider_number(arg_248_1, 4, 0, 24)

	return math.floor(var_248_0 * 10 + 0.5)
end

function slot_0_20_3.decode_glyph_amount_slider(arg_249_0, arg_249_1)
	if type(arg_249_1) ~= "number" then
		return 4
	end

	return arg_249_0:normalize_slider_number(arg_249_1 * 0.1, 4, 0, 24)
end

function slot_0_20_3.ensure_profile(arg_250_0)
	if type(arg_250_0.state.profile) ~= "table" then
		arg_250_0.state.profile = slot_0_7_0.get_profile_definition()
	end

	local var_250_0 = arg_250_0.state.profile.segments

	if type(var_250_0) ~= "table" then
		var_250_0 = {}
		arg_250_0.state.profile.segments = var_250_0
	end

	if type(arg_250_0.state.profile.font) ~= "number" then
		arg_250_0.state.profile.font = slot_0_7_0.get_font()
	end

	if #var_250_0 == 0 or type(var_250_0[1]) ~= "table" then
		var_250_0[1] = arg_250_0:make_default_segment("Text")
	end

	local var_250_1 = var_250_0[1]

	if type(var_250_1.color) ~= "string" or slot_0_7_0.hex_to_color(var_250_1.color) == nil then
		var_250_1.color = slot_0_7_0.get_default_color_hex()
	end

	if #var_250_0 > 1 then
		arg_250_0.state.profile.segments = {
			var_250_0[1]
		}
	end
end

function slot_0_20_3.get_selected_segment(arg_251_0)
	arg_251_0:ensure_profile()

	return arg_251_0.state.profile.segments[1]
end

function slot_0_20_3.get_value_signature(arg_252_0, arg_252_1)
	if arg_252_1 == nil then
		return "nil"
	end

	local var_252_0 = type(arg_252_1)

	if var_252_0 == "string" or var_252_0 == "number" or var_252_0 == "boolean" then
		return var_252_0 .. ":" .. tostring(arg_252_1)
	end

	if var_252_0 == "table" then
		if type(arg_252_1.r) == "number" or type(arg_252_1.g) == "number" or type(arg_252_1.b) == "number" then
			return "color:" .. tostring(slot_0_7_0.color_to_hex(arg_252_1))
		end

		local var_252_1 = {
			"table"
		}

		for iter_252_0 = 1, #arg_252_1 do
			var_252_1[#var_252_1 + 1] = arg_252_0:get_value_signature(arg_252_1[iter_252_0])
		end

		return table.concat(var_252_1, "|")
	end

	local var_252_2, var_252_3 = pcall(function()
		if arg_252_1.to_hex ~= nil then
			return arg_252_1:to_hex()
		end
	end)

	if var_252_2 and type(var_252_3) == "string" then
		return "color:" .. var_252_3
	end

	return var_252_0 .. ":" .. tostring(arg_252_1)
end

function slot_0_20_3.consume_pending_item_value(arg_254_0, arg_254_1, arg_254_2)
	if arg_254_1 == nil then
		return false
	end

	local var_254_0, var_254_1 = pcall(arg_254_1.id, arg_254_1)

	if not var_254_0 or type(var_254_1) ~= "number" then
		return false
	end

	local var_254_2 = arg_254_0.state.pending_item_values[var_254_1]

	if var_254_2 == nil then
		return false
	end

	if var_254_2 ~= arg_254_0:get_value_signature(arg_254_2) then
		arg_254_0.state.pending_item_values[var_254_1] = nil

		return false
	end

	arg_254_0.state.pending_item_values[var_254_1] = nil

	return true
end

function slot_0_20_3.consume_pending_hidden_value(arg_255_0, arg_255_1, arg_255_2)
	local var_255_0 = arg_255_0.state.pending_hidden_ref_values[arg_255_1]

	if var_255_0 == nil then
		return false
	end

	if var_255_0 ~= arg_255_0:get_value_signature(arg_255_2) then
		return false
	end

	arg_255_0.state.pending_hidden_ref_values[arg_255_1] = nil

	return true
end

function slot_0_20_3.set_item_value(arg_256_0, arg_256_1, arg_256_2)
	if arg_256_1 == nil then
		return
	end

	local var_256_0, var_256_1 = pcall(arg_256_1.id, arg_256_1)

	if var_256_0 and type(var_256_1) == "number" then
		arg_256_0.state.pending_item_values[var_256_1] = arg_256_0:get_value_signature(arg_256_2)
	end

	pcall(arg_256_1.set, arg_256_1, arg_256_2)
end

function slot_0_20_3.set_hidden_value(arg_257_0, arg_257_1, arg_257_2, arg_257_3)
	arg_257_0.state.pending_hidden_ref_values[arg_257_1] = arg_257_0:get_value_signature(arg_257_3)

	pcall(arg_257_2.set, arg_257_2, arg_257_3)
end

function slot_0_20_3.refresh_segment_list(arg_258_0)
	arg_258_0:ensure_profile()
end

function slot_0_20_3.update_editor_visibility(arg_259_0)
	local var_259_0 = arg_259_0:get_selected_segment()

	arg_259_0.ref.text_animation_group:visibility(false)
	arg_259_0.ref.animation_group:visibility(false)

	if var_259_0 == nil then
		arg_259_0.ref.segment_color:visibility(false)

		return
	end

	arg_259_0.ref.segment_color:visibility(true)
	arg_259_0.ref.segment_animation:visibility(false)
	arg_259_0.ref.segment_glyph_animation:visibility(false)
	arg_259_0.ref.segment_glyph_glitch:visibility(false)
	arg_259_0.ref.segment_glyph_amount:visibility(false)
	arg_259_0.ref.segment_glyph_speed:visibility(false)
	arg_259_0.ref.segment_glyph_span:visibility(false)
	arg_259_0.ref.segment_animation_effect:visibility(false)
	arg_259_0.ref.segment_animation_playback:visibility(false)
	arg_259_0.ref.segment_animation_direction:visibility(false)
	arg_259_0.ref.segment_animation_reverse:visibility(false)
	arg_259_0.ref.segment_animation_shape:visibility(false)
	arg_259_0.ref.segment_min:visibility(false)
	arg_259_0.ref.segment_max:visibility(false)
	arg_259_0.ref.segment_speed:visibility(false)
	arg_259_0.ref.segment_animation_span:visibility(false)
end

function slot_0_20_3.sync_general_controls(arg_260_0)
	arg_260_0.state.sync = true

	arg_260_0:set_item_value(arg_260_0.ref.general_font, arg_260_0.state.profile.font)

	arg_260_0.state.sync = false

	arg_260_0:update_editor_visibility()
end

function slot_0_20_3.sync_editor_controls(arg_261_0)
	local var_261_0 = arg_261_0:get_selected_segment()

	if var_261_0 == nil then
		arg_261_0:update_editor_visibility()

		return
	end

	local var_261_1 = arg_261_0:get_segment_animation_label(var_261_0)
	local var_261_2 = arg_261_0:get_segment_animation_effect_label(var_261_0)

	arg_261_0.state.sync = true

	arg_261_0:set_item_value(arg_261_0.ref.segment_text, var_261_0.text)
	arg_261_0:set_item_value(arg_261_0.ref.segment_animation, var_261_1)
	arg_261_0:set_item_value(arg_261_0.ref.segment_glyph_animation, arg_261_0:get_segment_glyph_animation_label(var_261_0))
	arg_261_0:set_item_value(arg_261_0.ref.segment_glyph_glitch, arg_261_0:get_segment_glyph_glitch_label(var_261_0) == "On")
	arg_261_0:set_item_value(arg_261_0.ref.segment_glyph_amount, arg_261_0:encode_glyph_amount_slider(var_261_0.glyph_amount))
	arg_261_0:set_item_value(arg_261_0.ref.segment_glyph_speed, arg_261_0:encode_speed_slider(var_261_0.glyph_speed))
	arg_261_0:set_item_value(arg_261_0.ref.segment_glyph_span, arg_261_0:encode_waves_slider(var_261_0.glyph_span))
	arg_261_0:set_item_value(arg_261_0.ref.segment_animation_effect, var_261_2)
	arg_261_0:set_item_value(arg_261_0.ref.segment_animation_playback, arg_261_0:get_segment_animation_playback_label(var_261_0))
	arg_261_0:set_item_value(arg_261_0.ref.segment_animation_direction, arg_261_0:get_segment_animation_direction_label(var_261_0))
	arg_261_0:set_item_value(arg_261_0.ref.segment_animation_reverse, arg_261_0:get_segment_animation_reverse_label(var_261_0))
	arg_261_0:set_item_value(arg_261_0.ref.segment_animation_shape, arg_261_0:get_segment_animation_shape_label(var_261_0))
	arg_261_0:set_item_value(arg_261_0.ref.segment_color, arg_261_0:get_picker_color(var_261_0.color))
	arg_261_0:set_item_value(arg_261_0.ref.segment_min, arg_261_0:encode_unit_slider(var_261_0.min, 0.3))
	arg_261_0:set_item_value(arg_261_0.ref.segment_max, arg_261_0:encode_unit_slider(var_261_0.max, 1))
	arg_261_0:set_item_value(arg_261_0.ref.segment_speed, arg_261_0:encode_speed_slider(var_261_0.speed))
	arg_261_0:set_item_value(arg_261_0.ref.segment_animation_span, arg_261_0:encode_waves_slider(var_261_0.animation_span))

	arg_261_0.state.sync = false

	arg_261_0:update_editor_visibility()
end

function slot_0_20_3.load_from_watermark(arg_262_0)
	arg_262_0.state.profile = slot_0_7_0.get_profile_definition()

	arg_262_0:ensure_profile()
	arg_262_0:sync_general_controls()
	arg_262_0:sync_editor_controls()
end

function slot_0_20_3.store_profile(arg_263_0)
	local var_263_0 = slot_0_7_0.apply_profile_definition(arg_263_0.state.profile)

	if type(var_263_0) ~= "string" then
		return false
	end

	arg_263_0:set_hidden_value("text", slot_0_22_3, var_263_0)
	arg_263_0:set_hidden_value("font", slot_0_29_7, arg_263_0.state.profile.font)

	return true
end

slot_0_20_3.ref.general_font = slot_0_19_3:slider(slot_0_15_1.prefix_arrow .. "   Font", 1, 4, slot_0_7_0.get_font(), nil, slot_0_6_0)
slot_0_20_3.ref.segment_text = slot_0_19_3:input(slot_0_15_1.prefix_dot .. "   Text", "")
slot_0_20_3.ref.segment_color = slot_0_19_3:color_picker(slot_0_15_1.prefix_dot .. "   Color", slot_0_20_3:get_style_color())
slot_0_20_3.ref.text_animation_group = ui.create(slot_0_12_0.main, slot_0_8_0.get("keyboard", 1, 3, "{Link Active}") .. "Text Animation", 2)

slot_0_20_3.ref.text_animation_group:visibility(false)

slot_0_20_3.ref.segment_glyph_animation = slot_0_20_3.ref.text_animation_group:combo(slot_0_15_1.prefix_dot .. "   Glyph", slot_0_21_3)
slot_0_30_10 = slot_0_20_3.ref.segment_glyph_animation:create()
slot_0_20_3.ref.segment_glyph_glitch = slot_0_30_10:switch(slot_0_15_1.prefix_dot .. "   Glitch", false)
slot_0_20_3.ref.segment_glyph_amount = slot_0_30_10:slider(slot_0_15_1.prefix_arrow .. "   Amount", 0, 240, 40, 0.1)
slot_0_20_3.ref.segment_glyph_speed = slot_0_30_10:slider(slot_0_15_1.prefix_arrow .. "   Speed", 1, 500, 300, 0.1)
slot_0_20_3.ref.segment_glyph_span = slot_0_30_10:slider(slot_0_15_1.prefix_arrow .. "   Spread", 1, 100, 10, 0.1)
slot_0_20_3.ref.animation_group = ui.create(slot_0_12_0.main, slot_0_8_0.get("wave-sine", 1, 3, "{Link Active}") .. "Animation", 2)

slot_0_20_3.ref.animation_group:visibility(false)

slot_0_20_3.ref.segment_animation = slot_0_20_3.ref.animation_group:combo(slot_0_15_1.prefix_dot .. "   Animation", {
	"Off",
	"Wave",
	"Sweep",
	"Pulse",
	"Breath",
	"Centered",
	"Shift"
})
slot_0_31_12 = slot_0_20_3.ref.segment_animation:create()
slot_0_20_3.ref.segment_animation_effect = slot_0_31_12:combo(slot_0_15_1.prefix_dot .. "   Channel", {
	"Color",
	"Alpha"
})
slot_0_20_3.ref.segment_animation_playback = slot_0_31_12:combo(slot_0_15_1.prefix_dot .. "   Playback", {
	"Loop",
	"Ping-Pong"
})
slot_0_20_3.ref.segment_animation_direction = slot_0_31_12:combo(slot_0_15_1.prefix_dot .. "   Direction", {
	"Forward",
	"Reverse"
})
slot_0_20_3.ref.segment_animation_reverse = slot_0_31_12:combo(slot_0_15_1.prefix_dot .. "   Reverse", {
	"Off",
	"On"
})
slot_0_20_3.ref.segment_animation_shape = slot_0_31_12:combo(slot_0_15_1.prefix_dot .. "   Shape", {
	"Soft",
	"Sharp"
})
slot_0_20_3.ref.segment_min = slot_0_20_3.ref.animation_group:slider(slot_0_15_1.prefix_arrow .. "   Min Strength", 0, 100, 30, 0.01)
slot_0_20_3.ref.segment_max = slot_0_20_3.ref.animation_group:slider(slot_0_15_1.prefix_arrow .. "   Max Strength", 0, 100, 100, 0.01)
slot_0_20_3.ref.segment_speed = slot_0_20_3.ref.animation_group:slider(slot_0_15_1.prefix_arrow .. "   Speed", 1, 2000, 200, 0.01)
slot_0_20_3.ref.segment_animation_span = slot_0_20_3.ref.animation_group:slider(slot_0_15_1.prefix_arrow .. "   Spread", 1, 100, 10, 0.1)

slot_0_20_3.ref.general_font:set_callback(function(arg_264_0)
	if arg_264_0 == nil then
		return
	end

	local var_264_0, var_264_1 = pcall(arg_264_0.get, arg_264_0)

	if not var_264_0 or type(var_264_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_264_0, var_264_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	slot_0_20_3:ensure_profile()

	slot_0_20_3.state.profile.font = var_264_1

	slot_0_20_3:update_editor_visibility()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_text:set_callback(function(arg_265_0)
	if arg_265_0 == nil then
		return
	end

	local var_265_0, var_265_1 = pcall(arg_265_0.get, arg_265_0)

	if not var_265_0 or type(var_265_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_265_0, var_265_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_265_2 = slot_0_20_3:get_selected_segment()

	if var_265_2 == nil then
		return
	end

	var_265_2.text = var_265_1

	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_animation:set_callback(function(arg_266_0)
	if arg_266_0 == nil then
		return
	end

	local var_266_0, var_266_1 = pcall(arg_266_0.get, arg_266_0)

	if not var_266_0 or type(var_266_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_266_0, var_266_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_266_2 = slot_0_20_3:get_selected_segment()

	if var_266_2 == nil then
		return
	end

	local var_266_3 = slot_0_20_3:get_segment_type(var_266_2)
	local var_266_4 = slot_0_20_3:get_segment_animation_effect_label(var_266_2)

	slot_0_20_3:apply_segment_mode(var_266_2, var_266_3, var_266_1, var_266_4)
	slot_0_20_3:update_editor_visibility()
	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_glyph_animation:set_callback(function(arg_267_0)
	if arg_267_0 == nil then
		return
	end

	local var_267_0, var_267_1 = pcall(arg_267_0.get, arg_267_0)

	if not var_267_0 or type(var_267_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_267_0, var_267_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_267_2 = slot_0_20_3:get_selected_segment()

	if var_267_2 == nil then
		return
	end

	if var_267_1 == "Wave" then
		var_267_2.glyph_animation = "wave"
	elseif var_267_1 == "Orbit" then
		var_267_2.glyph_animation = "orbit"
	elseif var_267_1 == "Scatter" then
		var_267_2.glyph_animation = "scatter"
	elseif var_267_1 == "Heart" then
		var_267_2.glyph_animation = "heart"
	else
		var_267_2.glyph_animation = "off"
	end

	slot_0_20_3:update_editor_visibility()
	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_glyph_glitch:set_callback(function(arg_268_0)
	if arg_268_0 == nil then
		return
	end

	local var_268_0, var_268_1 = pcall(arg_268_0.get, arg_268_0)

	if not var_268_0 or type(var_268_1) ~= "boolean" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_268_0, var_268_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_268_2 = slot_0_20_3:get_selected_segment()

	if var_268_2 == nil then
		return
	end

	var_268_2.glyph_glitch = var_268_1 == true

	slot_0_20_3:update_editor_visibility()
	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_glyph_amount:set_callback(function(arg_269_0)
	if arg_269_0 == nil then
		return
	end

	local var_269_0, var_269_1 = pcall(arg_269_0.get, arg_269_0)

	if not var_269_0 or type(var_269_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_269_0, var_269_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_269_2 = slot_0_20_3:get_selected_segment()

	if var_269_2 == nil then
		return
	end

	var_269_2.glyph_amount = slot_0_20_3:decode_glyph_amount_slider(var_269_1)

	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_glyph_speed:set_callback(function(arg_270_0)
	if arg_270_0 == nil then
		return
	end

	local var_270_0, var_270_1 = pcall(arg_270_0.get, arg_270_0)

	if not var_270_0 or type(var_270_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_270_0, var_270_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_270_2 = slot_0_20_3:get_selected_segment()

	if var_270_2 == nil then
		return
	end

	var_270_2.glyph_speed = slot_0_20_3:decode_speed_slider(var_270_1)

	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_glyph_span:set_callback(function(arg_271_0)
	if arg_271_0 == nil then
		return
	end

	local var_271_0, var_271_1 = pcall(arg_271_0.get, arg_271_0)

	if not var_271_0 or type(var_271_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_271_0, var_271_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_271_2 = slot_0_20_3:get_selected_segment()

	if var_271_2 == nil then
		return
	end

	var_271_2.glyph_span = slot_0_20_3:decode_waves_slider(var_271_1)

	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_animation_effect:set_callback(function(arg_272_0)
	if arg_272_0 == nil then
		return
	end

	local var_272_0, var_272_1 = pcall(arg_272_0.get, arg_272_0)

	if not var_272_0 or type(var_272_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_272_0, var_272_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_272_2 = slot_0_20_3:get_selected_segment()

	if var_272_2 == nil then
		return
	end

	local var_272_3 = slot_0_20_3:get_segment_type(var_272_2)
	local var_272_4 = slot_0_20_3:get_segment_animation_label(var_272_2)

	slot_0_20_3:apply_segment_mode(var_272_2, var_272_3, var_272_4, var_272_1)
	slot_0_20_3:update_editor_visibility()
	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_animation_playback:set_callback(function(arg_273_0)
	if arg_273_0 == nil then
		return
	end

	local var_273_0, var_273_1 = pcall(arg_273_0.get, arg_273_0)

	if not var_273_0 or type(var_273_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_273_0, var_273_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_273_2 = slot_0_20_3:get_selected_segment()

	if var_273_2 == nil then
		return
	end

	var_273_2.repeat_mode = var_273_1 == "Ping-Pong" and "pingpong" or "loop"

	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_animation_direction:set_callback(function(arg_274_0)
	if arg_274_0 == nil then
		return
	end

	local var_274_0, var_274_1 = pcall(arg_274_0.get, arg_274_0)

	if not var_274_0 or type(var_274_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_274_0, var_274_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_274_2 = slot_0_20_3:get_selected_segment()

	if var_274_2 == nil then
		return
	end

	var_274_2.direction = var_274_1 == "Reverse" and "reverse" or "forward"

	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_animation_reverse:set_callback(function(arg_275_0)
	if arg_275_0 == nil then
		return
	end

	local var_275_0, var_275_1 = pcall(arg_275_0.get, arg_275_0)

	if not var_275_0 or type(var_275_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_275_0, var_275_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_275_2 = slot_0_20_3:get_selected_segment()

	if var_275_2 == nil then
		return
	end

	var_275_2.reverse = var_275_1 == "On"

	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_animation_shape:set_callback(function(arg_276_0)
	if arg_276_0 == nil then
		return
	end

	local var_276_0, var_276_1 = pcall(arg_276_0.get, arg_276_0)

	if not var_276_0 or type(var_276_1) ~= "string" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_276_0, var_276_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_276_2 = slot_0_20_3:get_selected_segment()

	if var_276_2 == nil then
		return
	end

	var_276_2.shape = var_276_1 == "Sharp" and "sharp" or "soft"

	slot_0_20_3:refresh_segment_list()
	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_color:set_callback(function(arg_277_0)
	if arg_277_0 == nil then
		return
	end

	local var_277_0, var_277_1 = pcall(arg_277_0.get, arg_277_0)

	if not var_277_0 then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_277_0, var_277_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_277_2 = slot_0_20_3:get_selected_segment()

	if var_277_2 == nil then
		return
	end

	var_277_2.color = slot_0_7_0.color_to_hex(var_277_1)

	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_min:set_callback(function(arg_278_0)
	if arg_278_0 == nil then
		return
	end

	local var_278_0, var_278_1 = pcall(arg_278_0.get, arg_278_0)

	if not var_278_0 or type(var_278_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_278_0, var_278_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_278_2 = slot_0_20_3:get_selected_segment()

	if var_278_2 == nil then
		return
	end

	var_278_2.min = slot_0_20_3:decode_unit_slider(var_278_1, 0.3)

	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_max:set_callback(function(arg_279_0)
	if arg_279_0 == nil then
		return
	end

	local var_279_0, var_279_1 = pcall(arg_279_0.get, arg_279_0)

	if not var_279_0 or type(var_279_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_279_0, var_279_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_279_2 = slot_0_20_3:get_selected_segment()

	if var_279_2 == nil then
		return
	end

	var_279_2.max = slot_0_20_3:decode_unit_slider(var_279_1, 1)

	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_speed:set_callback(function(arg_280_0)
	if arg_280_0 == nil then
		return
	end

	local var_280_0, var_280_1 = pcall(arg_280_0.get, arg_280_0)

	if not var_280_0 or type(var_280_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_280_0, var_280_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_280_2 = slot_0_20_3:get_selected_segment()

	if var_280_2 == nil then
		return
	end

	var_280_2.speed = slot_0_20_3:decode_speed_slider(var_280_1)

	slot_0_20_3:store_profile()
end)
slot_0_20_3.ref.segment_animation_span:set_callback(function(arg_281_0)
	if arg_281_0 == nil then
		return
	end

	local var_281_0, var_281_1 = pcall(arg_281_0.get, arg_281_0)

	if not var_281_0 or type(var_281_1) ~= "number" then
		return
	end

	if slot_0_20_3:consume_pending_item_value(arg_281_0, var_281_1) then
		return
	end

	if slot_0_20_3.state.sync == true then
		return
	end

	local var_281_2 = slot_0_20_3:get_selected_segment()

	if var_281_2 == nil then
		return
	end

	var_281_2.animation_span = slot_0_20_3:decode_waves_slider(var_281_1)

	slot_0_20_3:store_profile()
end)

slot_0_32_12 = nil
slot_0_33_9 = nil
slot_0_34_7 = nil
slot_0_35_7 = {}
slot_0_36_7 = nil
slot_0_37_7 = nil
slot_0_38_6 = nil
slot_0_39_6 = 0
slot_0_40_7 = nil

function slot_0_41_6()
	slot_0_39_6 = 0
	slot_0_40_7 = nil
end

function slot_0_42_6(arg_283_0)
	local var_283_0 = slot_0_17_2:list()

	if type(var_283_0) ~= "table" then
		return false
	end

	for iter_283_0, iter_283_1 in ipairs(var_283_0) do
		if iter_283_1 == arg_283_0 then
			return true
		end
	end

	return false
end

function slot_0_43_5()
	slot_0_41_6()

	local var_284_0 = slot_0_13_0.get_list()

	if type(var_284_0) ~= "table" then
		var_284_0 = {}
	end

	if #var_284_0 == 0 then
		slot_0_17_2:update({
			slot_0_8_0.get("eye-slash", 0, 4, "{Link Active}") .. "I don't see any presets("
		})
		slot_0_17_2:set(1)
		slot_0_17_2:disabled(true)
		slot_0_18_1:set("")

		if slot_0_38_6 ~= nil then
			slot_0_38_6:disabled(true)
		end

		if slot_0_36_7 ~= nil then
			slot_0_36_7:disabled(true)
		end

		if slot_0_37_7 ~= nil then
			slot_0_37_7:disabled(true)
		end

		return
	end

	slot_0_17_2:update(var_284_0)

	local var_284_1 = slot_0_18_1:get()
	local var_284_2 = false

	for iter_284_0, iter_284_1 in ipairs(var_284_0) do
		if iter_284_1 == var_284_1 then
			slot_0_17_2:set(iter_284_0)

			var_284_2 = true

			break
		end
	end

	if not var_284_2 then
		slot_0_17_2:set(1)
		slot_0_18_1:set(var_284_0[1])
	end

	slot_0_17_2:disabled(false)

	if slot_0_38_6 ~= nil then
		slot_0_38_6:disabled(false)
	end

	if slot_0_36_7 ~= nil then
		slot_0_36_7:disabled(false)
	end

	if slot_0_37_7 ~= nil then
		slot_0_37_7:disabled(false)
	end
end

function slot_0_44_5(arg_285_0, arg_285_1, arg_285_2)
	slot_0_32_12 = arg_285_0
	slot_0_33_9 = arg_285_1
	slot_0_34_7 = arg_285_2

	for iter_285_0, iter_285_1 in ipairs(slot_0_35_7) do
		iter_285_1:disabled(true)
	end

	slot_0_17_2:disabled(true)
	slot_0_18_1:disabled(arg_285_0 == "load" or arg_285_0 == "import")
	slot_0_36_7:disabled(false)
	slot_0_37_7:disabled(false)
	slot_0_36_7:visibility(true)
	slot_0_37_7:visibility(true)
end

function slot_0_45_5()
	slot_0_32_12 = nil
	slot_0_33_9 = nil
	slot_0_34_7 = nil

	for iter_286_0, iter_286_1 in ipairs(slot_0_35_7) do
		iter_286_1:disabled(false)
	end

	slot_0_36_7:visibility(false)
	slot_0_37_7:visibility(false)
	slot_0_18_1:disabled(false)
	slot_0_43_5()
end

function slot_0_46_4()
	local var_287_0 = slot_0_18_1:get()

	if not slot_0_42_6(var_287_0) then
		return slot_0_10_0.error("Config not found: " .. tostring(var_287_0))
	end

	local var_287_1 = slot_0_13_0.read(var_287_0)

	if type(var_287_1) ~= "table" then
		return slot_0_10_0.error("Config not found: " .. tostring(var_287_0))
	end

	slot_0_44_5("load", var_287_1, var_287_0)
end

slot_0_17_2:set_callback(function()
	if slot_0_17_2:disabled() then
		return
	end

	local var_288_0 = slot_0_17_2:get()
	local var_288_1 = slot_0_17_2:list()[var_288_0]

	if var_288_1 == nil then
		return
	end

	slot_0_18_1:set(var_288_1)
	slot_0_9_0.play(slot_0_9_0.press)

	local var_288_2 = globals.realtime

	if var_288_1 == slot_0_40_7 and var_288_2 - slot_0_39_6 < 0.3 then
		slot_0_41_6()
		slot_0_46_4()

		return
	end

	slot_0_39_6 = var_288_2
	slot_0_40_7 = var_288_1
end)

slot_0_47_10 = slot_0_16_1:button(slot_0_8_0.get("floppy-disk", 2.5, 2.5, "{Link Active}") .. "Save  ", function()
	slot_0_9_0.play(slot_0_9_0.press)

	local var_289_0 = slot_0_18_1:get()

	if var_289_0 == "" then
		return slot_0_10_0.error("Config name cannot be empty!")
	end

	if slot_0_42_6(var_289_0) then
		slot_0_44_5("save", nil, var_289_0)

		return
	end

	slot_0_13_0.save(var_289_0)
	slot_0_43_5()
end, true)
slot_0_48_9 = slot_0_16_1:button(slot_0_8_0.get("copy", 2.5, 2.5, "{Link Active}") .. "Copy  ", function()
	slot_0_9_0.play(slot_0_9_0.press)
	slot_0_13_0.export()
end, true)
slot_0_49_10 = slot_0_16_1:button(slot_0_8_0.get("download", 2.5, 2.5, "{Link Active}") .. "Paste  ", function()
	slot_0_9_0.play(slot_0_9_0.press)

	local var_291_0 = slot_0_13_0.decode_clipboard()

	if var_291_0 == nil then
		return
	end

	slot_0_44_5("import", var_291_0, nil)
end, true)
slot_0_38_6 = slot_0_16_1:button(slot_0_8_0.get("trash-xmark", 0.5, 0.5, "FF6B6BFF"), function()
	slot_0_9_0.play(slot_0_9_0.press)

	local var_292_0 = slot_0_18_1:get()

	if not slot_0_42_6(var_292_0) then
		return slot_0_10_0.error("Config not found: " .. var_292_0)
	end

	slot_0_44_5("remove", nil, var_292_0)
end, true)
slot_0_37_7 = slot_0_16_1:button(string.format("%s\aDB6361FF%s    \a{Text Preview}%s%s", string.rep(" ", 9), ui.get_icon("xmark"), "Cancel", string.rep(" ", 9)), function()
	slot_0_9_0.play(slot_0_9_0.back)
	slot_0_45_5()
end, true)
slot_0_36_7 = slot_0_16_1:button(string.format("%s\a{Link Active}%s    \a{Text Preview}%s%s", string.rep(" ", 8), ui.get_icon("check"), "Confirm", string.rep(" ", 9)), function()
	slot_0_9_0.play(slot_0_9_0.confirm)

	if slot_0_32_12 == "save" then
		local var_294_0 = slot_0_18_1:get()
		local var_294_1 = slot_0_34_7

		if var_294_1 ~= nil and var_294_1 ~= "" and var_294_1 ~= var_294_0 and not slot_0_13_0.rename(var_294_1, var_294_0) then
			return
		end

		slot_0_13_0.save(var_294_0)
		slot_0_45_5()

		return
	end

	if slot_0_32_12 == "remove" then
		local var_294_2 = slot_0_18_1:get()

		slot_0_13_0.remove(var_294_2)
		slot_0_45_5()

		return
	end

	if slot_0_32_12 == "load" then
		slot_0_13_0.apply(slot_0_33_9)
		slot_0_10_0.success("Loaded config: " .. tostring(slot_0_34_7))
		slot_0_45_5()

		return
	end

	if slot_0_32_12 == "import" then
		slot_0_13_0.apply(slot_0_33_9)
		slot_0_10_0.success("Config loaded from clipboard")
		slot_0_45_5()
	end
end, true)

slot_0_36_7:visibility(false)
slot_0_37_7:visibility(false)

slot_0_35_7 = {
	slot_0_47_10,
	slot_0_48_9,
	slot_0_49_10,
	slot_0_38_6
}

slot_0_13_0.update()
slot_0_43_5()
slot_0_20_3:load_from_watermark()

slot_0_15_0 = {
	manual_yaw_refs = {}
}
slot_0_15_0.manual_yaw_mode_ref = nil
slot_0_15_0.manual_yaw_arrows_ref = nil
slot_0_15_0.manual_yaw_arrows_offset_ref = nil
slot_0_15_0.manual_yaw_arrows_simple_color_ref = nil
slot_0_15_0.manual_yaw_toggle_state = {
	left = false,
	right = false,
	forward = false
}
slot_0_15_0.freestanding_refs = {}
slot_0_15_0.other_aa_refs = {}
slot_0_15_0.other_aa_state = {
	yaw_spin = 0,
	pitch_switch_packets = 0,
	pitch_switch_flip = false,
	pitch_last_time = 0,
	pitch_spin_direction = 1,
	pitch_spin = -89,
	pitch_random_packet = -1,
	pitch_random = 0,
	last_packet = -1,
	is_overriding = false,
	round_end_active = false,
	yaw_random_packet = -1,
	yaw_random = 180,
	yaw_last_time = 0
}
slot_0_15_0.fake_lag_limit_override_state = {}
slot_0_15_0.fake_lag_enabled_override_state = {}

function slot_0_15_0.apply_fake_lag_enabled_override()
	local var_295_0 = slot_0_11_0.aa and slot_0_11_0.aa.fake_lag and slot_0_11_0.aa.fake_lag.enabled

	if var_295_0 == nil then
		return
	end

	local var_295_1 = slot_0_15_0.fake_lag_enabled_override_state

	if var_295_1 == nil then
		var_295_0:override()

		return
	end

	if var_295_1.disable_fake_lag == false or var_295_1.other_aa == false then
		var_295_0:override(false)

		return
	end

	var_295_0:override()
end

function slot_0_15_0.apply_fake_lag_limit_override()
	local var_296_0 = slot_0_11_0.aa and slot_0_11_0.aa.fake_lag and slot_0_11_0.aa.fake_lag.limit

	if var_296_0 == nil then
		return
	end

	local var_296_1 = slot_0_15_0.fake_lag_limit_override_state

	if var_296_1 == nil then
		var_296_0:override()

		return
	end

	local var_296_2 = var_296_1.fluctuate

	if var_296_1.fix_recharge_delay ~= nil then
		var_296_2 = var_296_1.fix_recharge_delay
	end

	if var_296_2 == nil then
		var_296_0:override()

		return
	end

	var_296_0:override(var_296_2)
end

slot_0_15_0.freestanding_toggle_state = false
slot_0_15_0.freestanding_requested = false
slot_0_15_0.freestanding_active = false
slot_0_15_0.freestanding_static = false
slot_0_15_0.safe_head_refs = {}
slot_0_16_0 = false
slot_0_17_1 = nil
slot_0_18_0 = nil
slot_0_19_2 = slot_0_12_0.ui_symbols
slot_0_20_2 = {
	air = 6,
	running = 2,
	crouching = 4,
	slow_walking = 3,
	standing = 1,
	crouch_running = 5,
	air_crouching = 7
}
slot_0_21_2 = {
	ct = 1
}
slot_0_22_2 = {
	static = 3,
	meta = 2,
	jitter = 1
}
slot_0_23_2 = {
	"Fake Yaw",
	"L/R"
}

function slot_0_24_2(arg_297_0)
	return arg_297_0 == 2 or arg_297_0 == "L/R"
end

function slot_0_25_2(arg_298_0)
	return arg_298_0 == 1 or arg_298_0 == "Fake Yaw" or slot_0_24_2(arg_298_0)
end

function slot_0_26_3(arg_299_0, arg_299_1, arg_299_2, arg_299_3)
	local var_299_0 = arg_299_3 and arg_299_1 or arg_299_2

	if slot_0_24_2(arg_299_0) then
		return var_299_0
	end

	return var_299_0 - (arg_299_3 and arg_299_2 or arg_299_1) * 0.35
end

function slot_0_27_4(arg_300_0, arg_300_1, arg_300_2)
	if arg_300_0 == nil then
		return
	end

	local var_300_0 = slot_0_25_2(arg_300_0:get())

	if arg_300_1 ~= nil then
		arg_300_1:visibility(var_300_0)
		arg_300_1:disabled(not var_300_0)
	end

	if arg_300_2 ~= nil then
		arg_300_2:visibility(var_300_0)
		arg_300_2:disabled(not var_300_0)
	end
end

function slot_0_28_4(arg_301_0)
	return arg_301_0 == slot_0_22_2.meta or arg_301_0 == "Meta"
end

slot_0_29_6 = {
	on_ground_flag = 1,
	moving_speed_threshold = 3.63,
	max_yaw_variation = 15
}
slot_0_30_9 = {
	1,
	3,
	5,
	7,
	10,
	15,
	16
}
slot_0_31_11 = {
	1,
	3,
	5,
	7,
	10,
	15,
	20
}
slot_0_32_11 = {
	weapon_incgrenade = true,
	weapon_smokegrenade = true,
	weapon_hegrenade = true,
	weapon_flashbang = true,
	weapon_decoy = true,
	weapon_molotov = true
}
slot_0_33_8 = {
	"Standing",
	"Crouch",
	"Air Crouch",
	"Air Crouch Knife",
	"Air Crouch Taser",
	"Distance"
}
slot_0_34_6 = {
	"States"
}
slot_0_35_6 = {
	"Standing",
	"Running",
	"Slow Walking",
	"Crouching",
	"Crouch Moving",
	"Air",
	"Air Crouching"
}
slot_0_36_6 = "Forward"
slot_0_37_6 = {
	{
		name = "Forward-Right",
		key = "forward_right"
	},
	{
		name = "Forward-Left",
		key = "forward_left"
	},
	{
		name = "Left",
		key = "left"
	},
	{
		name = "Right",
		key = "right"
	},
	{
		name = "Backward-Right",
		key = "backward_right"
	},
	{
		name = "Backward-Left",
		key = "backward_left"
	},
	{
		name = "Backward",
		key = "backward"
	}
}
slot_0_38_5 = {}

for iter_0_2 = 1, #slot_0_37_6 do
	slot_0_38_5[iter_0_2] = slot_0_37_6[iter_0_2].name
end

slot_0_39_5 = {
	names = {
		"Builder",
		"Hotkeys",
		"Features"
	},
	icons = {
		"gear",
		"key",
		"bars-staggered"
	}
}

function slot_0_40_6(arg_302_0)
	local var_302_0 = {}

	for iter_302_0 = 1, #slot_0_39_5.names do
		local var_302_1 = "{Text Preview}"

		if iter_302_0 == arg_302_0 then
			var_302_1 = "{Link Active}"
		end

		var_302_0[iter_302_0] = slot_0_8_0.get(slot_0_39_5.icons[iter_302_0], 1, 5, var_302_1) .. slot_0_39_5.names[iter_302_0]
	end

	return var_302_0
end

slot_0_41_5 = ui.create(slot_0_12_0.angles, slot_0_8_0.get("layer-group", 1, 3, "{Link Active}") .. "Sections", 1)
slot_0_42_4 = slot_0_41_5:list("", slot_0_40_6(1))

function slot_0_15_0.get_section_list()
	return slot_0_42_4
end

function slot_0_15_0.update_section_items(arg_304_0)
	if slot_0_42_4 == nil then
		return
	end

	slot_0_42_4:update(slot_0_40_6(arg_304_0))
end

function slot_0_43_4(arg_305_0, arg_305_1, arg_305_2)
	return "angles_builder_t" .. arg_305_0 .. "_c" .. arg_305_1 .. "_" .. arg_305_2
end

function slot_0_44_4(arg_306_0, arg_306_1, arg_306_2, arg_306_3)
	return "angles_builder_t" .. arg_306_0 .. "_c" .. arg_306_1 .. "_p" .. arg_306_2 .. "_" .. arg_306_3
end

function slot_0_45_4(arg_307_0, arg_307_1, arg_307_2, arg_307_3)
	local var_307_0 = arg_307_3

	if type(var_307_0) ~= "string" or var_307_0 == "" then
		var_307_0 = "team_toggle"
	end

	if arg_307_0 == true then
		return slot_0_8_0.get("check", 1, 1, "A0CE48FF") .. "##" .. var_307_0 .. "_" .. arg_307_1 .. "_" .. arg_307_2
	end

	return slot_0_8_0.get("xmark", 1.5, 1.5, "CE4848FF") .. "##" .. var_307_0 .. "_" .. arg_307_1 .. "_" .. arg_307_2
end

function slot_0_46_3(arg_308_0)
	if arg_308_0 == 2 or arg_308_0 == "Ways" then
		return "Ways"
	end

	return "Default"
end

function slot_0_47_9(arg_309_0)
	local var_309_0 = math.floor(tonumber(arg_309_0) or 2)

	if var_309_0 < 2 then
		var_309_0 = 2
	elseif var_309_0 > 22 then
		var_309_0 = 22
	end

	if var_309_0 == 2 then
		return "Sharp"
	end

	if var_309_0 == 22 then
		return "Smooth"
	end

	return tostring(var_309_0) .. " t"
end

function slot_0_48_8(arg_310_0, arg_310_1, arg_310_2, arg_310_3, arg_310_4, arg_310_5)
	slot_310_6_0 = {
		break_lc_tickbase_slot_refs = {}
	}

	for iter_310_0 = 1, 8 do
		slot_310_6_0["break_lc_tickbase_" .. iter_310_0 .. "_ref"] = nil
	end

	if arg_310_0 == nil or arg_310_1 == nil then
		return slot_310_6_0
	end

	slot_310_7_0 = arg_310_4

	if type(slot_310_7_0) ~= "function" then
		function slot_310_7_0(arg_311_0)
			return slot_0_43_4(arg_310_2, arg_310_3, arg_311_0)
		end
	end

	slot_310_8_0 = tostring(arg_310_2 or 1)
	slot_310_9_0 = tostring(arg_310_3 or 1)

	if type(arg_310_5) == "string" and arg_310_5 ~= "" then
		slot_310_9_0 = slot_310_9_0 .. "_" .. arg_310_5
	end

	slot_310_6_0.break_lc_custom_tickbase_enabled_ref = slot_0_13_0.push(arg_310_0:switch("##builder_break_lc_custom_tickbase_" .. slot_310_8_0 .. "_" .. slot_310_9_0, false), slot_310_7_0("break_lc_custom_tickbase_enabled"))

	slot_310_6_0.break_lc_custom_tickbase_enabled_ref:visibility(false)

	slot_310_10_0 = arg_310_1:create()

	if slot_310_10_0 == nil then
		return slot_310_6_0
	end

	slot_310_11_0 = slot_310_10_0:label(slot_0_19_2.prefix_dot .. "   Custom Tickbase")
	slot_310_12_0 = slot_310_10_0:button(slot_0_45_4(slot_310_6_0.break_lc_custom_tickbase_enabled_ref:get() == true, slot_310_8_0, slot_310_9_0, "break_lc_tickbase"), function()
		slot_310_6_0.break_lc_custom_tickbase_enabled_ref:set(slot_310_6_0.break_lc_custom_tickbase_enabled_ref:get() ~= true)
	end, true)
	slot_310_6_0.break_lc_tickbase_randomize_ref = slot_0_13_0.push(slot_310_10_0:switch(slot_0_19_2.prefix_dot .. "   Randomize", true), slot_310_7_0("break_lc_tickbase_randomize"))
	slot_310_6_0.break_lc_tickbase_choke_ref = slot_0_13_0.push(slot_310_10_0:slider(slot_0_19_2.prefix_arrow .. "   Choke", 2, 22, 16, nil, slot_0_47_9), slot_310_7_0("break_lc_tickbase_choke"))
	slot_310_6_0.break_lc_tickbase_type_ref = slot_0_13_0.push(slot_310_10_0:combo(slot_0_19_2.prefix_dot .. "   Type", {
		"Default",
		"Ways"
	}), slot_310_7_0("break_lc_tickbase_type"))
	slot_310_6_0.break_lc_tickbase_random_min_ref = slot_0_13_0.push(slot_310_10_0:slider(slot_0_19_2.prefix_arrow .. "   [1]", 2, 22, 16, nil, slot_0_47_9), slot_310_7_0("break_lc_tickbase_random_min"))
	slot_310_6_0.break_lc_tickbase_random_max_ref = slot_0_13_0.push(slot_310_10_0:slider(slot_0_19_2.prefix_arrow .. "   [2]", 2, 22, 16, nil, slot_0_47_9), slot_310_7_0("break_lc_tickbase_random_max"))
	slot_310_6_0.break_lc_tickbase_sliders_ref = slot_0_13_0.push(slot_310_10_0:slider(slot_0_19_2.prefix_dot .. "   Sliders", 2, 8, 3), slot_310_7_0("break_lc_tickbase_sliders"))

	for iter_310_1 = 1, 8 do
		slot_310_17_0 = "break_lc_tickbase_" .. iter_310_1 .. "_ref"
		slot_310_18_0 = slot_0_13_0.push(slot_310_10_0:slider(slot_0_19_2.prefix_arrow .. "   " .. iter_310_1, 2, 22, 2, nil, slot_0_47_9), slot_310_7_0("break_lc_tickbase_" .. iter_310_1))
		slot_310_6_0[slot_310_17_0] = slot_310_18_0
		slot_310_6_0.break_lc_tickbase_slot_refs[iter_310_1] = slot_310_18_0
	end

	slot_310_13_0 = slot_310_10_0:button(slot_0_8_0.get("rotate-left", 1, 1, "{Link Active}") .. "Reset", function()
		slot_310_6_0.break_lc_tickbase_sliders_ref:set(3)

		for iter_313_0 = 1, 8 do
			local var_313_0 = slot_310_6_0.break_lc_tickbase_slot_refs[iter_313_0]

			if var_313_0 ~= nil then
				var_313_0:set(2)
			end
		end
	end, true)
	slot_310_14_0 = slot_310_10_0:button(slot_0_8_0.get("shuffle", 1, 1, "{Link Active}") .. "Randomize", function()
		local var_314_0 = slot_310_6_0.break_lc_tickbase_sliders_ref:get()

		if type(var_314_0) ~= "number" then
			var_314_0 = 3
		end

		local var_314_1 = math.floor(var_314_0)

		if var_314_1 < 2 then
			var_314_1 = 2
		elseif var_314_1 > 8 then
			var_314_1 = 8
		end

		for iter_314_0 = 1, var_314_1 do
			local var_314_2 = slot_310_6_0.break_lc_tickbase_slot_refs[iter_314_0]

			if var_314_2 ~= nil then
				var_314_2:set(math.random(2, 22))
			end
		end
	end, true)

	function slot_310_15_0()
		local var_315_0 = slot_310_6_0.break_lc_custom_tickbase_enabled_ref:get() == true
		local var_315_1 = slot_310_6_0.break_lc_tickbase_randomize_ref:get() == true
		local var_315_2 = slot_0_46_3(slot_310_6_0.break_lc_tickbase_type_ref:get())
		local var_315_3 = var_315_1 == true and var_315_2 == "Ways"
		local var_315_4 = slot_310_6_0.break_lc_tickbase_sliders_ref:get()

		if type(var_315_4) ~= "number" then
			var_315_4 = 3
		end

		local var_315_5 = math.floor(var_315_4)

		if var_315_5 < 2 then
			var_315_5 = 2
		elseif var_315_5 > 8 then
			var_315_5 = 8
		end

		slot_310_11_0:disabled(false)
		slot_310_12_0:name(slot_0_45_4(var_315_0, slot_310_8_0, slot_310_9_0, "break_lc_tickbase"))
		slot_310_6_0.break_lc_tickbase_randomize_ref:disabled(not var_315_0)
		slot_310_6_0.break_lc_tickbase_choke_ref:visibility(not var_315_1)
		slot_310_6_0.break_lc_tickbase_choke_ref:disabled(not var_315_0)
		slot_310_6_0.break_lc_tickbase_type_ref:visibility(var_315_1)
		slot_310_6_0.break_lc_tickbase_type_ref:disabled(not var_315_0)
		slot_310_6_0.break_lc_tickbase_random_min_ref:visibility(var_315_1 and not var_315_3)
		slot_310_6_0.break_lc_tickbase_random_min_ref:disabled(not var_315_0)
		slot_310_6_0.break_lc_tickbase_random_max_ref:visibility(var_315_1 and not var_315_3)
		slot_310_6_0.break_lc_tickbase_random_max_ref:disabled(not var_315_0)
		slot_310_6_0.break_lc_tickbase_sliders_ref:visibility(var_315_3)
		slot_310_6_0.break_lc_tickbase_sliders_ref:disabled(not var_315_0)

		for iter_315_0 = 1, 8 do
			local var_315_6 = slot_310_6_0.break_lc_tickbase_slot_refs[iter_315_0]

			if var_315_6 ~= nil then
				var_315_6:visibility(var_315_3 and iter_315_0 <= var_315_5)
				var_315_6:disabled(not var_315_0)
			end
		end

		slot_310_13_0:visibility(var_315_3)
		slot_310_13_0:disabled(not var_315_0)
		slot_310_14_0:visibility(var_315_3)
		slot_310_14_0:disabled(not var_315_0)
	end

	slot_310_6_0.break_lc_custom_tickbase_enabled_ref:set_callback(slot_310_15_0, true)
	slot_310_6_0.break_lc_tickbase_randomize_ref:set_callback(slot_310_15_0)
	slot_310_6_0.break_lc_tickbase_type_ref:set_callback(slot_310_15_0)
	slot_310_6_0.break_lc_tickbase_sliders_ref:set_callback(slot_310_15_0)

	return slot_310_6_0
end

slot_0_49_9 = {
	active_condition_index = 1,
	active_team_index = 1,
	is_condition_menu_open = false,
	is_builder_visible = false
}
slot_0_50_13 = {
	condition_index = 1,
	base_condition_index = 1,
	sent_packets = 0,
	is_throwing_grenade = false,
	is_defensive_active = false,
	team_index = 1
}
slot_0_51_12 = nil
slot_0_52_17 = {
	last_defensive_view = false,
	hidden_static_active = false
}
slot_0_53_17 = ui.create(slot_0_12_0.angles, slot_0_8_0.get("door-open", 1, 3, "{Link Active}") .. "Portal", 2)
slot_0_54_15 = {
	hidden_yaw_modifier_runtime = true,
	body_yaw_runtime = true,
	jitter_runtime = true,
	condition_views = true,
	team_groups = true
}
slot_0_55_16 = setmetatable({
	initialized = true
}, {
	__index = function(arg_316_0, arg_316_1)
		if slot_0_54_15[arg_316_1] ~= true then
			return nil
		end

		local var_316_0 = {}

		rawset(arg_316_0, arg_316_1, var_316_0)

		return var_316_0
	end
})
slot_0_56_14 = {
	mode_items = {
		"2-Way",
		"3-Way",
		"5-Way"
	},
	scales = {
		["2-Way"] = {
			-0.5,
			0.5
		},
		["3-Way"] = {
			-0.5,
			0,
			0.5
		},
		["5-Way"] = {
			-0.75,
			1,
			0,
			0.4,
			-0.25
		}
	}
}
slot_0_57_16 = {
	mode_items = {
		"2-Way",
		"3-Way",
		"5-Way"
	},
	scales = {
		["2-Way"] = {
			0.75,
			1.25
		},
		["3-Way"] = {
			0.75,
			1,
			1.25
		},
		["5-Way"] = {
			0.5,
			1.5,
			1,
			1.25,
			0.75
		}
	}
}
slot_0_58_16 = {
	syncing = false,
	enabled = false,
	touched = false
}
slot_0_59_18 = 0.45
slot_0_60_19 = 0.2
slot_0_61_20 = {
	impact_threshold = 72,
	miss_timeout = 0.2,
	phase_max = 10,
	condition_phase_views = {},
	team_selector_refs = {},
	runtime_state = {
		phase_indices = {},
		pending_shots = {},
		last_impact_tick = {}
	},
	hitboxes = {
		0,
		2,
		3,
		4,
		5,
		6
	}
}

function slot_0_62_20(arg_317_0, arg_317_1)
	local var_317_0 = tonumber(arg_317_0) or 0

	if var_317_0 >= slot_0_59_18 then
		return true
	end

	return arg_317_1 == true and var_317_0 >= slot_0_60_19
end

slot_0_63_18 = nil

function slot_0_64_19(arg_318_0)
	local var_318_0 = tonumber(arg_318_0) or 2
	local var_318_1 = math.floor(var_318_0)

	if var_318_1 < 2 then
		return 2
	end

	if var_318_1 > slot_0_61_20.phase_max then
		return slot_0_61_20.phase_max
	end

	return var_318_1
end

function slot_0_65_19(arg_319_0)
	return "Phase[" .. tostring(arg_319_0) .. "]"
end

function slot_0_66_19(arg_320_0)
	local var_320_0 = {
		"Current"
	}
	local var_320_1 = math.max(1, math.min(slot_0_61_20.phase_max, math.floor(tonumber(arg_320_0) or 1)))

	for iter_320_0 = 2, var_320_1 do
		var_320_0[#var_320_0 + 1] = slot_0_65_19(iter_320_0)
	end

	return var_320_0
end

function slot_0_67_19(arg_321_0)
	if type(arg_321_0) == "number" then
		return math.max(1, math.floor(arg_321_0))
	end

	if type(arg_321_0) ~= "string" then
		return 1
	end

	if arg_321_0 == "Current" then
		return 1
	end

	local var_321_0 = arg_321_0:match("^Phase%[(%d+)%]$")

	if var_321_0 ~= nil then
		return math.max(1, math.floor(tonumber(var_321_0) or 1))
	end

	return 1
end

function slot_0_68_17(arg_322_0, arg_322_1)
	local var_322_0 = slot_0_55_16.condition_views[arg_322_0]

	if var_322_0 == nil then
		return nil
	end

	return var_322_0[arg_322_1]
end

function slot_0_69_20(arg_323_0)
	if type(arg_323_0) ~= "table" then
		return false
	end

	if arg_323_0.jitter_mode_ref ~= nil then
		local var_323_0 = arg_323_0.jitter_mode_ref:get()

		if var_323_0 ~= slot_0_22_2.jitter and var_323_0 ~= "Jitter" then
			return false
		end
	end

	if arg_323_0.jitter_delay_target_ref == nil then
		return false
	end

	local var_323_1 = arg_323_0.jitter_delay_target_ref:get()

	return var_323_1 == 2 or var_323_1 == "Hidden"
end

function slot_0_61_20.copy_ref_value(arg_324_0, arg_324_1)
	if arg_324_0 == nil or arg_324_1 == nil then
		return
	end

	local var_324_0, var_324_1 = pcall(arg_324_0.get, arg_324_0)

	if var_324_0 ~= true then
		return
	end

	if type(var_324_1) == "table" then
		local var_324_2 = table.unpack or unpack

		if var_324_2 ~= nil and pcall(arg_324_1.set, arg_324_1, var_324_2(var_324_1)) == true then
			return
		end
	end

	pcall(arg_324_1.set, arg_324_1, var_324_1)
end

function slot_0_61_20.copy_view_values(arg_325_0, arg_325_1)
	if type(arg_325_0) ~= "table" or type(arg_325_1) ~= "table" then
		return
	end

	for iter_325_0, iter_325_1 in pairs(arg_325_0) do
		local var_325_0 = arg_325_1[iter_325_0]

		if var_325_0 ~= nil then
			if type(iter_325_0) == "string" and iter_325_0:sub(-4) == "_ref" then
				slot_0_61_20.copy_ref_value(iter_325_1, var_325_0)
			elseif type(iter_325_1) == "table" and type(var_325_0) == "table" then
				slot_0_61_20.copy_view_values(iter_325_1, var_325_0)
			end
		end
	end
end

function slot_0_70_19(arg_326_0)
	local var_326_0 = slot_0_61_20.team_selector_refs[arg_326_0]

	if var_326_0 ~= nil and var_326_0.state_combo_ref ~= nil then
		return slot_0_63_18(var_326_0.state_combo_ref:get())
	end

	if slot_0_49_9.active_team_index == arg_326_0 then
		return slot_0_49_9.active_condition_index
	end

	return 1
end

function slot_0_71_19(arg_327_0)
	local var_327_0 = slot_0_61_20.team_selector_refs[arg_327_0]

	if var_327_0 == nil then
		return 1
	end

	local var_327_1 = var_327_0.active_phase_index

	if type(var_327_1) ~= "number" or var_327_1 < 1 then
		return 1
	end

	return math.floor(var_327_1)
end

function slot_0_72_17(arg_328_0, arg_328_1)
	local var_328_0 = slot_0_61_20.team_selector_refs[arg_328_0]

	if var_328_0 == nil then
		return
	end

	var_328_0.active_phase_index = math.max(1, math.floor(tonumber(arg_328_1) or 1))
end

function slot_0_73_17(arg_329_0)
	if type(arg_329_0) ~= "function" then
		return
	end

	for iter_329_0 = 1, #slot_0_55_16.condition_views do
		local var_329_0 = slot_0_55_16.condition_views[iter_329_0]

		if var_329_0 ~= nil then
			for iter_329_1 = 1, #var_329_0 do
				local var_329_1 = var_329_0[iter_329_1]

				if var_329_1 ~= nil then
					arg_329_0(var_329_1, iter_329_0, iter_329_1, 1)
				end

				local var_329_2 = slot_0_61_20.condition_phase_views[iter_329_0]
				local var_329_3 = var_329_2 ~= nil and var_329_2[iter_329_1] or nil

				if type(var_329_3) == "table" then
					for iter_329_2, iter_329_3 in pairs(var_329_3) do
						if type(iter_329_2) == "number" and iter_329_2 >= 2 and iter_329_3 ~= nil then
							arg_329_0(iter_329_3, iter_329_0, iter_329_1, iter_329_2)
						end
					end
				end
			end
		end
	end
end

function slot_0_74_16(arg_330_0, arg_330_1)
	local var_330_0 = slot_0_68_17(arg_330_0, arg_330_1)

	if var_330_0 == nil or var_330_0.antibruteforce_switch_ref == nil then
		return false
	end

	return var_330_0.antibruteforce_switch_ref:get() == true
end

function slot_0_61_20.get_phase_count(arg_331_0, arg_331_1)
	if slot_0_74_16(arg_331_0, arg_331_1) ~= true then
		return 1
	end

	local var_331_0 = slot_0_68_17(arg_331_0, arg_331_1)

	if var_331_0 == nil or var_331_0.antibruteforce_phases_ref == nil then
		return 2
	end

	return slot_0_64_19(var_331_0.antibruteforce_phases_ref:get())
end

function slot_0_75_13(arg_332_0, arg_332_1)
	local var_332_0 = slot_0_61_20.runtime_state.phase_indices[arg_332_0]

	if type(var_332_0) ~= "table" then
		var_332_0 = {}
		slot_0_61_20.runtime_state.phase_indices[arg_332_0] = var_332_0
	end

	local var_332_1 = var_332_0[arg_332_1]

	if type(var_332_1) ~= "table" then
		var_332_1 = {
			index = 1
		}
		var_332_0[arg_332_1] = var_332_1
	end

	return var_332_1
end

function slot_0_76_12(arg_333_0, arg_333_1)
	slot_0_75_13(arg_333_0, arg_333_1).index = 1
end

function slot_0_77_11()
	slot_0_61_20.runtime_state.pending_shots = {}
	slot_0_61_20.runtime_state.last_impact_tick = {}

	for iter_334_0 = 1, #slot_0_55_16.condition_views do
		local var_334_0 = slot_0_55_16.condition_views[iter_334_0]

		if var_334_0 ~= nil then
			for iter_334_1 = 1, #var_334_0 do
				slot_0_76_12(iter_334_0, iter_334_1)
			end
		end

		slot_0_72_17(iter_334_0, 1)

		if type(slot_0_61_20.update_team_controls) == "function" then
			slot_0_61_20.update_team_controls(iter_334_0)
		end
	end
end

function slot_0_61_20.get_runtime_phase_index(arg_335_0, arg_335_1)
	local var_335_0 = slot_0_61_20.get_phase_count(arg_335_0, arg_335_1)

	if var_335_0 <= 1 then
		return 1
	end

	local var_335_1 = slot_0_75_13(arg_335_0, arg_335_1)
	local var_335_2 = tonumber(var_335_1.index) or 1

	if var_335_2 < 1 or var_335_0 < var_335_2 then
		var_335_2 = 1
		var_335_1.index = 1
	end

	return math.floor(var_335_2)
end

function slot_0_78_11(arg_336_0, arg_336_1)
	local var_336_0 = slot_0_61_20.get_phase_count(arg_336_0, arg_336_1)

	if var_336_0 <= 1 then
		return 1
	end

	local var_336_1 = slot_0_75_13(arg_336_0, arg_336_1)
	local var_336_2 = tonumber(var_336_1.index) or 1
	local var_336_3 = math.floor(var_336_2)

	var_336_3 = (var_336_3 < 1 or var_336_0 <= var_336_3) and 1 or var_336_3 + 1
	var_336_1.index = var_336_3

	return var_336_3
end

function slot_0_79_10(arg_337_0)
	if arg_337_0 == nil then
		return false
	end

	if arg_337_0.hidden_yaw_switch_ref ~= nil and arg_337_0.hidden_yaw_switch_ref:get() == true then
		return true
	end

	if arg_337_0.hidden_yaw_modifier_switch_ref ~= nil and arg_337_0.hidden_yaw_modifier_switch_ref:get() == true then
		return true
	end

	if slot_0_69_20(arg_337_0) == true then
		return true
	end

	return false
end

function slot_0_80_9()
	local var_338_0 = false

	slot_0_73_17(function(arg_339_0)
		if var_338_0 ~= true and slot_0_79_10(arg_339_0) == true then
			var_338_0 = true
		end
	end)

	return var_338_0
end

function slot_0_81_7()
	local var_340_0 = slot_0_11_0 and slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.hidden

	if var_340_0 == nil then
		return
	end

	local var_340_1 = slot_0_80_9()

	if var_340_0.override ~= nil then
		local var_340_2

		if var_340_0.get_override ~= nil then
			var_340_2 = var_340_0:get_override()
		end

		if var_340_1 == true then
			if var_340_2 ~= true then
				slot_0_58_16.syncing = true

				var_340_0:override(true)

				slot_0_58_16.syncing = false
			end

			slot_0_58_16.enabled = true
			slot_0_58_16.touched = true
		else
			if var_340_2 ~= false then
				slot_0_58_16.syncing = true

				var_340_0:override(false)

				slot_0_58_16.syncing = false
			end

			slot_0_58_16.enabled = false
			slot_0_58_16.touched = true
		end

		return
	end

	if var_340_0.set == nil then
		return
	end

	if (var_340_0.get ~= nil and var_340_0:get() == true) == var_340_1 then
		return
	end

	var_340_0:set(var_340_1)
end

slot_0_82_8 = slot_0_11_0 and slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.hidden

if slot_0_82_8 ~= nil and slot_0_82_8.set_callback ~= nil then
	slot_0_82_8:set_callback(function()
		if slot_0_58_16.syncing == true then
			return
		end

		slot_0_81_7()
	end)
end

function slot_0_61_20.get_view_for_phase(arg_342_0, arg_342_1, arg_342_2, arg_342_3)
	if arg_342_2 == nil or arg_342_2 <= 1 then
		return slot_0_68_17(arg_342_0, arg_342_1)
	end

	local var_342_0 = slot_0_61_20.get_phase_count(arg_342_0, arg_342_1)

	if var_342_0 < arg_342_2 then
		return slot_0_68_17(arg_342_0, arg_342_1)
	end

	if arg_342_3 == true then
		slot_0_61_20.ensure_phase_views(arg_342_0, arg_342_1, var_342_0)
	end

	local var_342_1 = slot_0_61_20.condition_phase_views[arg_342_0]

	if var_342_1 == nil then
		return slot_0_68_17(arg_342_0, arg_342_1)
	end

	local var_342_2 = var_342_1[arg_342_1]

	if var_342_2 == nil then
		return slot_0_68_17(arg_342_0, arg_342_1)
	end

	return var_342_2[arg_342_2] or slot_0_68_17(arg_342_0, arg_342_1)
end

function slot_0_61_20.get_layout_view(arg_343_0, arg_343_1)
	local var_343_0 = slot_0_71_19(arg_343_0)

	return slot_0_61_20.get_view_for_phase(arg_343_0, arg_343_1, var_343_0, true)
end

function slot_0_61_20.get_runtime_view(arg_344_0, arg_344_1)
	local var_344_0 = slot_0_61_20.get_runtime_phase_index(arg_344_0, arg_344_1)

	return slot_0_61_20.get_view_for_phase(arg_344_0, arg_344_1, var_344_0, true)
end

function slot_0_82_7(arg_345_0, arg_345_1)
	if arg_345_0 == nil then
		return
	end

	if arg_345_0.yaw_group ~= nil then
		arg_345_0.yaw_group:visibility(arg_345_1)
	end

	if arg_345_0.side_group ~= nil then
		arg_345_0.side_group:visibility(arg_345_1)
	end

	if arg_345_0.hidden_group ~= nil then
		arg_345_0.hidden_group:visibility(arg_345_1)
	end

	if arg_345_0.exploits_group ~= nil then
		arg_345_0.exploits_group:visibility(arg_345_1)
	end

	if arg_345_0.body_group ~= nil then
		arg_345_0.body_group:visibility(arg_345_1)
	end

	if arg_345_0.yaw_modify_group ~= nil then
		arg_345_0.yaw_modify_group:visibility(arg_345_1)
	end
end

function slot_0_83_7(arg_346_0)
	slot_0_82_7(arg_346_0, false)
end

function slot_0_84_6()
	slot_0_73_17(function(arg_348_0)
		slot_0_83_7(arg_348_0)
	end)
end

function slot_0_85_6(arg_349_0, arg_349_1, arg_349_2)
	local var_349_0 = slot_0_68_17(arg_349_0, arg_349_1)

	if var_349_0 ~= nil and var_349_0 ~= arg_349_2 then
		slot_0_83_7(var_349_0)
	end

	local var_349_1 = slot_0_61_20.condition_phase_views[arg_349_0]
	local var_349_2 = var_349_1 ~= nil and var_349_1[arg_349_1] or nil

	if type(var_349_2) ~= "table" then
		return
	end

	for iter_349_0, iter_349_1 in pairs(var_349_2) do
		if type(iter_349_0) == "number" and iter_349_0 >= 2 and iter_349_1 ~= nil and iter_349_1 ~= arg_349_2 then
			slot_0_83_7(iter_349_1)
		end
	end
end

function slot_0_86_5(arg_350_0, arg_350_1)
	slot_0_84_6()

	local var_350_0 = slot_0_61_20.get_layout_view(arg_350_0, arg_350_1)

	if var_350_0 == nil then
		return
	end

	slot_0_82_7(var_350_0, slot_0_49_9.is_builder_visible)
	slot_0_85_6(arg_350_0, arg_350_1, var_350_0)
end

function slot_0_87_6()
	for iter_351_0 = 1, #slot_0_55_16.team_groups do
		local var_351_0 = slot_0_49_9.is_builder_visible and slot_0_49_9.is_condition_menu_open ~= true

		slot_0_55_16.team_groups[iter_351_0]:visibility(var_351_0)
	end
end

function slot_0_88_6()
	slot_0_49_9.is_condition_menu_open = false

	slot_0_53_17:visibility(false)
	slot_0_41_5:visibility(true)
	slot_0_87_6()
	slot_0_86_5(slot_0_49_9.active_team_index, slot_0_49_9.active_condition_index)
end

function slot_0_89_5(arg_353_0, arg_353_1)
	local var_353_0 = slot_0_61_20.get_layout_view(arg_353_0, arg_353_1)

	if var_353_0 == nil then
		return
	end

	slot_0_49_9.active_team_index = arg_353_0
	slot_0_49_9.active_condition_index = arg_353_1
	slot_0_49_9.is_condition_menu_open = true

	slot_0_41_5:visibility(true)
	slot_0_87_6()
	slot_0_84_6()
	slot_0_53_17:visibility(slot_0_49_9.is_builder_visible)
	slot_0_82_7(var_353_0, slot_0_49_9.is_builder_visible)
	slot_0_85_6(arg_353_0, arg_353_1, var_353_0)
end

function slot_0_63_18(arg_354_0)
	if type(arg_354_0) == "number" then
		if slot_0_35_6[arg_354_0] ~= nil then
			return arg_354_0
		end

		return 1
	end

	if type(arg_354_0) == "string" then
		for iter_354_0 = 1, #slot_0_35_6 do
			if slot_0_35_6[iter_354_0] == arg_354_0 then
				return iter_354_0
			end
		end
	end

	return 1
end

function slot_0_90_5(arg_355_0, arg_355_1)
	return "\a{Link Active}" .. tostring(arg_355_0) .. "\aDEFAULT##" .. tostring(arg_355_1)
end

slot_0_53_17:button(slot_0_8_0.get("arrow-right", 32, 5, "{Link Active}") .. "Back                                   ", function()
	slot_0_9_0.play(slot_0_9_0.back)
	slot_0_88_6()
end, true)

function slot_0_91_4(arg_357_0, arg_357_1, arg_357_2, arg_357_3, arg_357_4)
	if arg_357_0 == nil or arg_357_3 == nil or type(arg_357_4) ~= "string" then
		return nil, nil
	end

	local var_357_0 = arg_357_0:create()

	if var_357_0 == nil then
		return nil, nil
	end

	local var_357_1 = slot_0_13_0.push(var_357_0:selectable(slot_0_19_2.prefix_dot .. "   Directions", slot_0_38_5), arg_357_3(arg_357_4 .. "_yaw_crouch_directions"))
	local var_357_2 = {}

	for iter_357_0 = 1, #slot_0_37_6 do
		local var_357_3 = slot_0_37_6[iter_357_0]

		var_357_2[var_357_3.name] = slot_0_13_0.push(var_357_0:slider(slot_0_19_2.prefix_arrow .. "   " .. var_357_3.name, arg_357_1, arg_357_2, 0), arg_357_3(arg_357_4 .. "_yaw_crouch_" .. var_357_3.key))
	end

	local function var_357_4(arg_358_0)
		if var_357_1 == nil then
			return false
		end

		local var_358_0, var_358_1 = pcall(var_357_1.get, var_357_1, arg_358_0)

		if var_358_0 and type(var_358_1) == "boolean" then
			return var_358_1
		end

		local var_358_2, var_358_3 = pcall(var_357_1.get, var_357_1)

		if not var_358_2 or type(var_358_3) ~= "table" then
			return false
		end

		for iter_358_0 = 1, #var_358_3 do
			if var_358_3[iter_358_0] == arg_358_0 then
				return true
			end
		end

		return false
	end

	local function var_357_5()
		for iter_359_0 = 1, #slot_0_37_6 do
			local var_359_0 = slot_0_37_6[iter_359_0]
			local var_359_1 = var_357_2[var_359_0.name]

			if var_359_1 ~= nil then
				var_359_1:visibility(var_357_4(var_359_0.name))
			end
		end
	end

	if var_357_1 ~= nil then
		var_357_1:set_callback(var_357_5, true)
	end

	return var_357_1, var_357_2
end

function slot_0_92_4(arg_360_0, arg_360_1, arg_360_2, arg_360_3)
	if type(arg_360_0) ~= "table" or type(arg_360_1) ~= "string" then
		return
	end

	arg_360_0[arg_360_1 .. "_yaw_crouch_dirs_ref"] = arg_360_2
	arg_360_0[arg_360_1 .. "_yaw_crouch_dir_refs"] = arg_360_3

	for iter_360_0 = 1, #slot_0_37_6 do
		local var_360_0 = slot_0_37_6[iter_360_0]
		local var_360_1

		if type(arg_360_3) == "table" then
			var_360_1 = arg_360_3[var_360_0.name]
		end

		arg_360_0[arg_360_1 .. "_yaw_crouch_" .. var_360_0.key .. "_ref"] = var_360_1
	end
end

function slot_0_93_4(arg_361_0, arg_361_1)
	if arg_361_0 == 2 or arg_361_0 == "Double" then
		return 2
	end

	if arg_361_0 == 3 or arg_361_0 == "Custom" then
		local var_361_0 = math.floor(arg_361_1 or 2)

		if var_361_0 < 2 then
			var_361_0 = 2
		elseif var_361_0 > 10 then
			var_361_0 = 10
		end

		return var_361_0
	end

	return 1
end

function slot_0_56_14.format_delay_cycle(arg_362_0)
	local var_362_0 = math.floor(tonumber(arg_362_0) or 0)

	if var_362_0 <= 0 then
		return "Off"
	end

	return tostring(math.max(5, var_362_0)) .. "t"
end

function slot_0_56_14.format_delay_time(arg_363_0)
	return tostring(math.floor(tonumber(arg_363_0) or 5)) .. "t"
end

function slot_0_56_14.format_randomize(arg_364_0)
	local var_364_0 = math.floor(tonumber(arg_364_0) or 0)

	if var_364_0 <= 0 then
		return "Off"
	end

	return tostring(var_364_0) .. "%"
end

slot_0_57_16.format_delay_cycle = slot_0_56_14.format_delay_cycle
slot_0_57_16.format_delay_time = slot_0_56_14.format_delay_time

function slot_0_57_16.format_offset(arg_365_0)
	return tostring(math.floor(tonumber(arg_365_0) or 1)) .. " t"
end

slot_0_94_4 = {}
slot_0_95_4 = {}

function slot_0_96_4(arg_366_0)
	if type(arg_366_0) ~= "string" or arg_366_0 == "" then
		return
	end

	if arg_366_0 == "Disabled" then
		return
	end

	if slot_0_95_4[arg_366_0] ~= nil then
		return
	end

	slot_0_94_4[#slot_0_94_4 + 1] = arg_366_0
	slot_0_95_4[arg_366_0] = #slot_0_94_4
end

slot_0_97_5 = nil

if slot_0_11_0 ~= nil and slot_0_11_0.aa ~= nil and slot_0_11_0.aa.angles ~= nil then
	slot_0_97_5 = slot_0_11_0.aa.angles.yaw_modifier
end

if slot_0_97_5 ~= nil and slot_0_97_5.list ~= nil then
	slot_0_98_5, slot_0_99_5 = pcall(slot_0_97_5.list, slot_0_97_5)

	if slot_0_98_5 and type(slot_0_99_5) == "table" then
		for iter_0_3 = 1, #slot_0_99_5 do
			slot_0_96_4(slot_0_99_5[iter_0_3])
		end
	end
end

if #slot_0_94_4 == 0 then
	slot_0_96_4("Center")
	slot_0_96_4("Offset")
	slot_0_96_4("Random")
	slot_0_96_4("Spin")
	slot_0_96_4("3-Way")
	slot_0_96_4("5-Way")
end

slot_0_56_14.mode_combo_items = {}

for iter_0_4 = 1, #slot_0_94_4 do
	slot_0_56_14.mode_combo_items[iter_0_4] = slot_0_94_4[iter_0_4]
end

slot_0_56_14.mode_combo_items[#slot_0_56_14.mode_combo_items + 1] = "Meta"

function slot_0_97_4()
	return slot_0_94_4[1]
end

function slot_0_98_4()
	if slot_0_95_4.Offset ~= nil then
		return "Offset"
	end

	return slot_0_97_4()
end

function slot_0_99_4(arg_369_0)
	if type(arg_369_0) == "string" then
		if slot_0_95_4[arg_369_0] ~= nil then
			return arg_369_0
		end

		local var_369_0 = arg_369_0:lower()

		if var_369_0 == "left add" or var_369_0 == "left" or var_369_0 == "right add" or var_369_0 == "right" or var_369_0 == "hybrid" or var_369_0 == "stair" then
			return slot_0_98_4()
		end

		if var_369_0 == "center" and slot_0_95_4.Center ~= nil then
			return "Center"
		end

		if var_369_0 == "3-way" and slot_0_95_4["3-Way"] ~= nil then
			return "3-Way"
		end

		if var_369_0 == "spin" and slot_0_95_4.Spin ~= nil then
			return "Spin"
		end

		if var_369_0 == "random" and slot_0_95_4.Random ~= nil then
			return "Random"
		end

		if var_369_0 == "disabled" then
			return slot_0_97_4()
		end
	elseif type(arg_369_0) == "number" then
		local var_369_1 = math.floor(arg_369_0)

		if var_369_1 >= 1 and var_369_1 <= #slot_0_94_4 then
			return slot_0_94_4[var_369_1]
		end

		if var_369_1 == 1 or var_369_1 == 2 or var_369_1 == 6 or var_369_1 == 7 then
			return slot_0_98_4()
		end

		if var_369_1 == 3 and slot_0_95_4.Center ~= nil then
			return "Center"
		end

		if var_369_1 == 4 and slot_0_95_4["3-Way"] ~= nil then
			return "3-Way"
		end

		if var_369_1 == 5 and slot_0_95_4.Spin ~= nil then
			return "Spin"
		end
	end

	return slot_0_97_4()
end

function slot_0_100_4(arg_370_0)
	local var_370_0 = slot_0_99_4(arg_370_0)

	return slot_0_95_4[var_370_0] or 1
end

function slot_0_101_5(arg_371_0)
	if arg_371_0 == 1 then
		return "yaw_modifier_value"
	end

	return "yaw_modifier_" .. tostring(arg_371_0)
end

function slot_0_102_4(arg_372_0)
	if arg_372_0 == 1 then
		return "hidden_yaw_modifier_value"
	end

	return "hidden_yaw_modifier_" .. tostring(arg_372_0)
end

function slot_0_103_4(arg_373_0)
	if type(arg_373_0) ~= "table" then
		return
	end

	local var_373_0 = arg_373_0.yaw_modifier_switch_ref or arg_373_0.switch_ref

	if var_373_0 == nil then
		return
	end

	local var_373_1 = arg_373_0.hidden_yaw_modifier_switch_ref ~= nil and arg_373_0.hidden_yaw_modifier_switch_ref:get() == true

	var_373_0:disabled(var_373_1)

	if var_373_1 == true and var_373_0:get() == true then
		var_373_0:set(false)
	end

	local var_373_2 = var_373_1 ~= true and var_373_0:get() == true
	local var_373_3 = arg_373_0.yaw_modifier_group_ref or arg_373_0.group_ref

	if var_373_3 ~= nil then
		var_373_3:visibility(var_373_2)
	end

	local var_373_4 = arg_373_0.yaw_modifier_values_mode_ref or arg_373_0.values_mode_ref
	local var_373_5 = arg_373_0.yaw_modifier_sliders_ref or arg_373_0.sliders_ref
	local var_373_6 = "Solo"

	if var_373_4 ~= nil then
		var_373_6 = var_373_4:get()
	end

	local var_373_7 = var_373_6 == 3 or var_373_6 == "Custom"
	local var_373_8 = 2

	if var_373_5 ~= nil then
		local var_373_9 = var_373_5:get()

		if type(var_373_9) == "number" then
			var_373_8 = var_373_9
		end
	end

	local var_373_10 = slot_0_93_4(var_373_6, var_373_8)
	local var_373_11 = arg_373_0.yaw_modifier_mode_ref or arg_373_0.mode_ref

	if var_373_11 ~= nil then
		var_373_11:disabled(not var_373_2)
	end

	if var_373_4 ~= nil then
		var_373_4:disabled(not var_373_2)
	end

	if var_373_5 ~= nil then
		var_373_5:visibility(var_373_2 and var_373_7)
		var_373_5:disabled(not var_373_2 or not var_373_7)
	end

	local var_373_12 = arg_373_0.yaw_modifier_slot_refs or arg_373_0.slot_refs

	if type(var_373_12) == "table" then
		for iter_373_0 = 1, 10 do
			local var_373_13 = var_373_12[iter_373_0]

			if var_373_13 ~= nil then
				local var_373_14 = var_373_2 and iter_373_0 <= var_373_10

				var_373_13:visibility(var_373_14)
				var_373_13:disabled(not var_373_14)
			end
		end
	end

	local var_373_15 = arg_373_0.yaw_modifier_variability_ref or arg_373_0.variability_ref

	if var_373_15 ~= nil then
		var_373_15:disabled(not var_373_2)
	end

	var_373_0:disabled(var_373_1)
end

function slot_0_104_4(arg_374_0, arg_374_1, arg_374_2)
	slot_374_3_0 = {
		pitch = {},
		yaw = {},
		yaw_modifier = {}
	}

	function slot_374_4_0(arg_375_0)
		return arg_374_1("hidden_builder_" .. tostring(arg_375_0))
	end

	slot_374_3_0.yaw.switch_ref = slot_0_13_0.push(arg_374_0:switch(slot_0_19_2.prefix_dot .. "   Yaw", false), slot_374_4_0("yaw_enabled"))
	slot_374_3_0.yaw.group_ref = slot_374_3_0.yaw.switch_ref:create()
	slot_374_3_0.yaw.mode_ref = slot_0_13_0.push(slot_374_3_0.yaw.group_ref:combo(slot_0_19_2.prefix_dot .. "   Mode", {
		"Static",
		"Side",
		"Side Reworked"
	}), slot_374_4_0("yaw_mode"))
	slot_374_3_0.yaw.static_ref = slot_0_13_0.push(slot_374_3_0.yaw.group_ref:slider(slot_0_19_2.prefix_arrow .. "   Static", -180, 180, 0), slot_374_4_0("yaw_static"))
	slot_374_3_0.yaw.left_ref = slot_0_13_0.push(slot_374_3_0.yaw.group_ref:slider(slot_0_19_2.prefix_arrow .. "   Left", -180, 180, 0), slot_374_4_0("left_yaw"))
	slot_374_3_0.yaw.right_ref = slot_0_13_0.push(slot_374_3_0.yaw.group_ref:slider(slot_0_19_2.prefix_arrow .. "   Right", -180, 180, 0), slot_374_4_0("right_yaw"))
	slot_374_3_0.yaw_modifier.switch_ref = slot_0_13_0.push(arg_374_0:switch(slot_0_19_2.prefix_dot .. "   Yaw Modifier", false), slot_374_4_0("yaw_modifier_enabled"))
	slot_374_3_0.yaw_modifier.group_ref = slot_374_3_0.yaw_modifier.switch_ref:create()
	slot_374_3_0.yaw_modifier.mode_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.group_ref:combo(slot_0_19_2.prefix_dot .. "   Type", slot_0_56_14.mode_combo_items), slot_374_4_0("yaw_modifier_mode"))
	slot_374_3_0.yaw_modifier.mode_group = slot_374_3_0.yaw_modifier.group_ref
	slot_374_3_0.yaw_modifier.values_mode_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:combo(slot_0_19_2.prefix_dot .. "   Values", {
		"Solo",
		"Double",
		"Custom"
	}), slot_374_4_0("yaw_modifier_values_mode"))
	slot_374_3_0.yaw_modifier.sliders_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:slider(slot_0_19_2.prefix_dot .. "   Sliders", 2, 10, 3), slot_374_4_0("yaw_modifier_sliders"))
	slot_374_3_0.yaw_modifier.slot_refs = {}

	for iter_374_0 = 1, 10 do
		slot_374_9_0 = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:slider(slot_0_19_2.prefix_arrow .. "   [" .. tostring(iter_374_0) .. "]", -180, 180, 0), slot_374_4_0(slot_0_102_4(iter_374_0)))
		slot_374_3_0.yaw_modifier.slot_refs[iter_374_0] = slot_374_9_0
	end

	slot_374_3_0.yaw_modifier.value_ref = slot_374_3_0.yaw_modifier.slot_refs[1]
	slot_374_3_0.yaw_modifier.meta_mode_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:combo(slot_0_19_2.prefix_dot .. "   Mode", slot_0_56_14.mode_items), slot_374_4_0("yaw_modifier_meta_mode"))
	slot_374_3_0.yaw_modifier.meta_offset_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:slider(slot_0_19_2.prefix_arrow .. "   Offset", -180, 180, 0), slot_374_4_0("yaw_modifier_meta_offset"))
	slot_374_3_0.yaw_modifier.variability_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, slot_0_56_14.format_randomize), slot_374_4_0("yaw_modifier_variability"))
	slot_374_3_0.yaw_modifier.meta_delay_cycle_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:slider(slot_0_19_2.prefix_dot .. "   Delay Cycle", 0, 200, 12, 1, slot_0_56_14.format_delay_cycle), slot_374_4_0("yaw_modifier_meta_delay_cycle"))
	slot_374_3_0.yaw_modifier.meta_delay_time_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:slider(slot_0_19_2.prefix_dot .. "   Delay Time", 5, 30, 15, 1, slot_0_56_14.format_delay_time), slot_374_4_0("yaw_modifier_meta_delay_time"))
	slot_374_3_0.yaw_modifier.meta_safe_yaw_ref = slot_0_13_0.push(slot_374_3_0.yaw_modifier.mode_group:switch(slot_0_19_2.prefix_dot .. "   Safe Yaw", true), slot_374_4_0("yaw_modifier_meta_safe_yaw"))

	function slot_374_5_0()
		slot_376_0_0 = slot_374_3_0.yaw.switch_ref:get() == true
		slot_376_1_0 = slot_374_3_0.yaw.mode_ref:get()
		slot_376_2_0 = slot_376_1_0 == 1 or slot_376_1_0 == "Static"
		slot_376_3_0 = slot_376_1_0 == 2 or slot_376_1_0 == "Side" or slot_376_1_0 == 3 or slot_376_1_0 == "Side Reworked"
		slot_376_4_0 = slot_374_3_0.yaw_modifier.switch_ref:get() == true
		slot_376_5_0 = slot_374_3_0.yaw_modifier.mode_ref:get()
		slot_376_6_0 = slot_376_5_0 == "Meta" or slot_376_5_0 == #slot_0_56_14.mode_combo_items
		slot_376_7_0 = slot_374_3_0.yaw_modifier.values_mode_ref:get()
		slot_376_8_0 = slot_376_7_0 == 3 or slot_376_7_0 == "Custom"
		slot_376_9_0 = slot_0_93_4(slot_376_7_0, slot_374_3_0.yaw_modifier.sliders_ref:get())

		slot_374_3_0.yaw.group_ref:visibility(slot_376_0_0)
		slot_374_3_0.yaw.mode_ref:visibility(slot_376_0_0)
		slot_374_3_0.yaw.mode_ref:disabled(not slot_376_0_0)
		slot_374_3_0.yaw.static_ref:visibility(slot_376_0_0 and slot_376_2_0)
		slot_374_3_0.yaw.static_ref:disabled(not slot_376_0_0 or not slot_376_2_0)
		slot_374_3_0.yaw.left_ref:visibility(slot_376_0_0 and slot_376_3_0)
		slot_374_3_0.yaw.left_ref:disabled(not slot_376_0_0 or not slot_376_3_0)
		slot_374_3_0.yaw.right_ref:visibility(slot_376_0_0 and slot_376_3_0)
		slot_374_3_0.yaw.right_ref:disabled(not slot_376_0_0 or not slot_376_3_0)
		slot_374_3_0.yaw_modifier.group_ref:visibility(slot_376_4_0)
		slot_374_3_0.yaw_modifier.mode_ref:visibility(slot_376_4_0)
		slot_374_3_0.yaw_modifier.mode_ref:disabled(not slot_376_4_0)
		slot_374_3_0.yaw_modifier.mode_group:visibility(slot_376_4_0)
		slot_374_3_0.yaw_modifier.values_mode_ref:visibility(slot_376_4_0 and not slot_376_6_0)
		slot_374_3_0.yaw_modifier.values_mode_ref:disabled(not slot_376_4_0 or slot_376_6_0)
		slot_374_3_0.yaw_modifier.sliders_ref:visibility(slot_376_4_0 and slot_376_8_0 and not slot_376_6_0)
		slot_374_3_0.yaw_modifier.sliders_ref:disabled(not slot_376_4_0 or not slot_376_8_0 or slot_376_6_0)

		for iter_376_0 = 1, 10 do
			slot_376_14_0 = slot_374_3_0.yaw_modifier.slot_refs[iter_376_0]

			if slot_376_14_0 ~= nil then
				slot_376_15_0 = slot_376_4_0 and not slot_376_6_0 and iter_376_0 <= slot_376_9_0

				slot_376_14_0:visibility(slot_376_15_0)
				slot_376_14_0:disabled(not slot_376_15_0)
			end
		end

		slot_374_3_0.yaw_modifier.variability_ref:visibility(slot_376_4_0)
		slot_374_3_0.yaw_modifier.variability_ref:disabled(not slot_376_4_0)
		slot_374_3_0.yaw_modifier.meta_mode_ref:visibility(slot_376_4_0 and slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_mode_ref:disabled(not slot_376_4_0 or not slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_offset_ref:visibility(slot_376_4_0 and slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_offset_ref:disabled(not slot_376_4_0 or not slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_delay_cycle_ref:visibility(slot_376_4_0 and slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_delay_cycle_ref:disabled(not slot_376_4_0 or not slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_delay_time_ref:visibility(slot_376_4_0 and slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_delay_time_ref:disabled(not slot_376_4_0 or not slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_safe_yaw_ref:visibility(slot_376_4_0 and slot_376_6_0)
		slot_374_3_0.yaw_modifier.meta_safe_yaw_ref:disabled(not slot_376_4_0 or not slot_376_6_0)
		slot_0_81_7()

		if type(arg_374_2) == "function" then
			arg_374_2()
		end
	end

	slot_374_3_0.yaw.switch_ref:set_callback(slot_374_5_0, true)
	slot_374_3_0.yaw.mode_ref:set_callback(slot_374_5_0)
	slot_374_3_0.yaw_modifier.switch_ref:set_callback(slot_374_5_0)
	slot_374_3_0.yaw_modifier.mode_ref:set_callback(slot_374_5_0)
	slot_374_3_0.yaw_modifier.values_mode_ref:set_callback(slot_374_5_0)
	slot_374_3_0.yaw_modifier.sliders_ref:set_callback(slot_374_5_0)

	return slot_374_3_0
end

function slot_0_105_4(arg_377_0)
	if arg_377_0 == 1 then
		return "jitter_delay"
	end

	return "jitter_delay_" .. tostring(arg_377_0)
end

function slot_0_106_4(arg_378_0, arg_378_1, arg_378_2, arg_378_3, arg_378_4, arg_378_5, arg_378_6, arg_378_7, arg_378_8, arg_378_9)
	slot_378_10_0 = slot_0_13_0.push(arg_378_0:combo(slot_0_19_2.prefix_dot .. "   Type", slot_0_23_2), arg_378_5("fake_yaw_mode"))
	slot_378_11_0 = slot_0_13_0.push(arg_378_0:slider(slot_0_19_2.prefix_arrow .. "   Left", -60, 60, 0), arg_378_5("left_yaw"))
	slot_378_12_0 = slot_0_13_0.push(slot_378_11_0:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), arg_378_5("left_yaw_randomize"))
	slot_378_13_0 = slot_0_13_0.push(arg_378_0:slider(slot_0_19_2.prefix_arrow .. "   Right", -60, 60, 0), arg_378_5("right_yaw"))
	slot_378_14_0 = slot_0_13_0.push(slot_378_13_0:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), arg_378_5("right_yaw_randomize"))
	slot_378_15_0 = nil
	slot_378_16_0 = nil
	slot_378_17_0 = nil
	slot_378_18_0 = nil

	if arg_378_6 == slot_0_20_2.crouch_running then
		slot_378_15_0, slot_378_16_0 = slot_0_91_4(slot_378_11_0, -60, 60, arg_378_5, "left")
		slot_378_17_0, slot_378_18_0 = slot_0_91_4(slot_378_13_0, -60, 60, arg_378_5, "right")
	end

	function slot_378_19_0()
		slot_0_27_4(slot_378_10_0, slot_378_11_0, slot_378_13_0)
	end

	slot_378_10_0:set_callback(slot_378_19_0, true)

	slot_378_20_0 = slot_0_13_0.push(arg_378_1:combo(slot_0_19_2.prefix_dot .. "   Mode", {
		"Jitter",
		"Meta",
		"Static"
	}), arg_378_5("jitter_mode"))
	slot_378_21_0 = slot_0_13_0.push(arg_378_1:selectable(slot_0_19_2.prefix_dot .. "   Break LC", {
		"Double Tap",
		"Hide Shots"
	}), arg_378_5("break_lc_mode"))
	slot_378_22_0 = slot_0_48_8(arg_378_2, slot_378_21_0, arg_378_7, arg_378_6, arg_378_5, arg_378_8)
	slot_378_23_0 = slot_378_20_0:create()

	function slot_378_24_0(arg_380_0)
		local var_380_0 = math.floor(arg_380_0 or 1)

		if var_380_0 <= 1 then
			return "Jitter"
		end

		return tostring(var_380_0) .. " t"
	end

	slot_378_25_0 = {
		target_ref = slot_0_13_0.push(slot_378_23_0:combo(slot_0_19_2.prefix_dot .. "   Type", {
			"Default",
			"Hidden"
		}), arg_378_5("jitter_delay_target"))
	}
	slot_378_26_0 = slot_0_13_0.push(slot_378_23_0:combo(slot_0_19_2.prefix_dot .. "   Delay", {
		"Solo",
		"Double",
		"Custom"
	}), arg_378_5("jitter_delay_mode"))
	slot_378_27_0 = slot_0_13_0.push(slot_378_23_0:slider(slot_0_19_2.prefix_dot .. "   Sliders", 2, 10, 3), arg_378_5("jitter_delay_sliders"))
	slot_378_28_0 = slot_0_13_0.push(slot_378_23_0:slider(slot_0_19_2.prefix_arrow .. "   [1]", 1, 16, 1, nil, slot_378_24_0), arg_378_5("jitter_delay"))
	slot_378_29_0 = {
		slot_378_28_0
	}

	for iter_378_0 = 2, 10 do
		slot_378_29_0[iter_378_0] = slot_0_13_0.push(slot_378_23_0:slider(slot_0_19_2.prefix_arrow .. "   [" .. tostring(iter_378_0) .. "]", 1, 16, 1, nil, slot_378_24_0), arg_378_5(slot_0_105_4(iter_378_0)))
	end

	slot_378_30_0 = slot_0_13_0.push(slot_378_23_0:slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), arg_378_5("jitter_delay_variability"))
	slot_378_25_0.mode_ref = slot_0_13_0.push(slot_378_23_0:combo(slot_0_19_2.prefix_dot .. "   Mode", slot_0_57_16.mode_items), arg_378_5("jitter_delay_meta_mode"))
	slot_378_25_0.offset_ref = slot_0_13_0.push(slot_378_23_0:slider(slot_0_19_2.prefix_arrow .. "   Offset", 1, 16, 4, nil, slot_0_57_16.format_offset), arg_378_5("jitter_delay_meta_offset"))
	slot_378_25_0.cycle_ref = slot_0_13_0.push(slot_378_23_0:slider(slot_0_19_2.prefix_dot .. "   Delay Cycle", 0, 200, 12, 1, slot_0_57_16.format_delay_cycle), arg_378_5("jitter_delay_meta_cycle"))
	slot_378_25_0.time_ref = slot_0_13_0.push(slot_378_23_0:slider(slot_0_19_2.prefix_dot .. "   Delay Time", 5, 30, 15, 1, slot_0_57_16.format_delay_time), arg_378_5("jitter_delay_meta_time"))
	slot_378_25_0.safe_ref = slot_0_13_0.push(slot_378_23_0:switch(slot_0_19_2.prefix_dot .. "   Safe Delay", true), arg_378_5("jitter_delay_meta_safe"))
	slot_378_31_0 = slot_0_13_0.push(arg_378_1:switch(slot_0_19_2.prefix_arrow .. "   Inverter", false), arg_378_5("static_inverter"))

	function slot_378_32_0()
		local var_381_0 = "Solo"

		if slot_378_26_0 ~= nil then
			var_381_0 = slot_378_26_0:get()
		end

		local var_381_1 = 2

		if slot_378_27_0 ~= nil then
			local var_381_2 = slot_378_27_0:get()

			if type(var_381_2) == "number" then
				var_381_1 = var_381_2
			end
		end

		return slot_0_93_4(var_381_0, var_381_1)
	end

	function slot_378_33_0()
		local var_382_0 = slot_378_20_0:get()
		local var_382_1 = var_382_0 == slot_0_22_2.jitter or var_382_0 == "Jitter"
		local var_382_2 = slot_0_28_4(var_382_0)
		local var_382_3 = var_382_0 == slot_0_22_2.static or var_382_0 == "Static"
		local var_382_4 = var_382_1
		local var_382_5 = slot_378_26_0:get()
		local var_382_6 = var_382_5 == 3 or var_382_5 == "Custom"
		local var_382_7 = var_382_2
		local var_382_8 = var_382_4
		local var_382_9 = var_382_4 and var_382_6
		local var_382_10 = var_382_1 or var_382_2
		local var_382_11 = slot_378_32_0()

		slot_378_23_0:visibility(var_382_1 or var_382_2)
		slot_378_25_0.target_ref:visibility(var_382_1)
		slot_378_25_0.target_ref:disabled(not var_382_1)
		slot_378_28_0:visibility(var_382_8)
		slot_378_28_0:disabled(not var_382_8)
		slot_378_26_0:disabled(not var_382_4)
		slot_378_26_0:visibility(var_382_4)
		slot_378_27_0:visibility(var_382_9)
		slot_378_27_0:disabled(not var_382_9)
		slot_378_30_0:visibility(var_382_10)
		slot_378_30_0:disabled(not var_382_10)
		slot_378_25_0.mode_ref:visibility(var_382_7)
		slot_378_25_0.mode_ref:disabled(not var_382_7)
		slot_378_25_0.offset_ref:visibility(var_382_7)
		slot_378_25_0.offset_ref:disabled(not var_382_7)
		slot_378_25_0.cycle_ref:visibility(var_382_7)
		slot_378_25_0.cycle_ref:disabled(not var_382_7)
		slot_378_25_0.time_ref:visibility(var_382_7)
		slot_378_25_0.time_ref:disabled(not var_382_7)
		slot_378_25_0.safe_ref:visibility(var_382_7)
		slot_378_25_0.safe_ref:disabled(not var_382_7)

		for iter_382_0 = 2, 10 do
			local var_382_12 = slot_378_29_0[iter_382_0]

			if var_382_12 ~= nil then
				local var_382_13 = var_382_8 and iter_382_0 <= var_382_11

				var_382_12:visibility(var_382_13)
				var_382_12:disabled(not var_382_13)
			end
		end

		slot_378_31_0:visibility(var_382_3)
		slot_0_81_7()
	end

	slot_378_20_0:set_callback(slot_378_33_0, true)
	slot_378_25_0.target_ref:set_callback(slot_378_33_0)
	slot_378_28_0:set_callback(slot_378_33_0)
	slot_378_26_0:set_callback(slot_378_33_0)
	slot_378_27_0:set_callback(slot_378_33_0)
	slot_378_25_0.mode_ref:set_callback(slot_378_33_0)
	slot_378_25_0.offset_ref:set_callback(slot_378_33_0)
	slot_378_25_0.cycle_ref:set_callback(slot_378_33_0)
	slot_378_25_0.time_ref:set_callback(slot_378_33_0)
	slot_378_25_0.safe_ref:set_callback(slot_378_33_0)

	for iter_378_1 = 2, 10 do
		slot_378_38_1 = slot_378_29_0[iter_378_1]

		if slot_378_38_1 ~= nil then
			slot_378_38_1:set_callback(slot_378_33_0)
		end
	end

	slot_378_34_0 = slot_0_13_0.push(arg_378_3:switch(slot_0_19_2.prefix_dot .. "   Body Yaw", true), arg_378_5("body_yaw_enabled"))
	slot_378_35_0 = slot_378_34_0:create()
	slot_378_36_0 = slot_0_13_0.push(slot_378_35_0:slider(slot_0_19_2.prefix_arrow .. "   Delay", 0, 20, 0, nil, function(arg_383_0)
		local var_383_0 = math.floor(arg_383_0 or 0)

		if var_383_0 <= 0 then
			return "Off"
		end

		return tostring(var_383_0) .. " t"
	end), arg_378_5("body_switch_delay"))
	slot_378_37_0 = slot_0_13_0.push(slot_378_35_0:slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), arg_378_5("body_switch_variability"))
	slot_378_38_0 = slot_0_13_0.push(arg_378_3:slider(slot_0_19_2.prefix_arrow .. "   Left", 0, 60, 60), arg_378_5("body_left"))
	slot_378_39_0 = slot_0_13_0.push(slot_378_38_0:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), arg_378_5("body_left_variability"))
	slot_378_40_0 = slot_0_13_0.push(arg_378_3:slider(slot_0_19_2.prefix_arrow .. "   Right", 0, 60, 60), arg_378_5("body_right"))
	slot_378_41_0 = slot_0_13_0.push(slot_378_40_0:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), arg_378_5("body_right_variability"))

	function slot_378_42_0()
		local var_384_0 = slot_378_34_0:get() == true

		slot_378_35_0:visibility(var_384_0)
		slot_378_38_0:disabled(not var_384_0)
		slot_378_39_0:disabled(not var_384_0)
		slot_378_40_0:disabled(not var_384_0)
		slot_378_41_0:disabled(not var_384_0)
	end

	slot_378_34_0:set_callback(slot_378_42_0, true)

	slot_378_43_0 = {
		switch_ref = slot_0_13_0.push(arg_378_0:switch(slot_0_19_2.prefix_dot .. "   Yaw Modifier", false), arg_378_5("yaw_modifier_enabled"))
	}
	slot_378_43_0.group_ref = slot_378_43_0.switch_ref:create()
	slot_378_43_0.mode_ref = slot_0_13_0.push(slot_378_43_0.group_ref:combo(slot_0_19_2.prefix_dot .. "   Mode", slot_0_94_4), arg_378_5("yaw_modifier_mode"))
	slot_378_43_0.mode_group = slot_378_43_0.group_ref
	slot_378_43_0.values_mode_ref = slot_0_13_0.push(slot_378_43_0.mode_group:combo(slot_0_19_2.prefix_dot .. "   Values", {
		"Solo",
		"Double",
		"Custom"
	}), arg_378_5("yaw_modifier_values_mode"))
	slot_378_43_0.sliders_ref = slot_0_13_0.push(slot_378_43_0.mode_group:slider(slot_0_19_2.prefix_dot .. "   Sliders", 2, 10, 3), arg_378_5("yaw_modifier_sliders"))
	slot_378_43_0.slot_refs = {}

	for iter_378_2 = 1, 10 do
		slot_378_48_0 = slot_0_13_0.push(slot_378_43_0.mode_group:slider(slot_0_19_2.prefix_arrow .. "   [" .. tostring(iter_378_2) .. "]", -180, 180, 0), arg_378_5(slot_0_101_5(iter_378_2)))
		slot_378_43_0.slot_refs[iter_378_2] = slot_378_48_0
	end

	slot_378_43_0.variability_ref = slot_0_13_0.push(slot_378_43_0.mode_group:slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), arg_378_5("yaw_modifier_variability"))
	slot_378_43_0.hidden_yaw_modifier_switch_ref = arg_378_9

	function slot_378_44_0()
		slot_0_103_4(slot_378_43_0)
	end

	slot_378_43_0.switch_ref:set_callback(slot_378_44_0, true)
	slot_378_43_0.mode_ref:set_callback(slot_378_44_0)
	slot_378_43_0.values_mode_ref:set_callback(slot_378_44_0)
	slot_378_43_0.sliders_ref:set_callback(slot_378_44_0)

	slot_378_45_0 = {
		fake_yaw_mode_ref = slot_378_10_0,
		left_yaw_ref = slot_378_11_0,
		right_yaw_ref = slot_378_13_0,
		left_yaw_randomize_ref = slot_378_12_0,
		right_yaw_randomize_ref = slot_378_14_0,
		jitter_mode_ref = slot_378_20_0,
		jitter_delay_target_ref = slot_378_25_0.target_ref,
		jitter_delay_ref = slot_378_28_0,
		jitter_delay_mode_ref = slot_378_26_0,
		jitter_delay_sliders_ref = slot_378_27_0,
		jitter_delay_slot_refs = slot_378_29_0,
		jitter_delay_variability_ref = slot_378_30_0,
		jitter_delay_meta_mode_ref = slot_378_25_0.mode_ref,
		jitter_delay_meta_offset_ref = slot_378_25_0.offset_ref,
		jitter_delay_meta_cycle_ref = slot_378_25_0.cycle_ref,
		jitter_delay_meta_time_ref = slot_378_25_0.time_ref,
		jitter_delay_meta_safe_ref = slot_378_25_0.safe_ref,
		static_inverter_ref = slot_378_31_0,
		break_lc_mode_ref = slot_378_21_0,
		body_yaw_switch_ref = slot_378_34_0,
		body_yaw_switch_delay_ref = slot_378_36_0,
		body_yaw_switch_var_ref = slot_378_37_0,
		body_left_ref = slot_378_38_0,
		body_right_ref = slot_378_40_0,
		body_left_var_ref = slot_378_39_0,
		body_right_var_ref = slot_378_41_0,
		yaw_modifier_switch_ref = slot_378_43_0.switch_ref,
		yaw_modifier_group_ref = slot_378_43_0.group_ref,
		yaw_modifier_mode_ref = slot_378_43_0.mode_ref,
		yaw_modifier_values_mode_ref = slot_378_43_0.values_mode_ref,
		yaw_modifier_sliders_ref = slot_378_43_0.sliders_ref,
		yaw_modifier_slot_refs = slot_378_43_0.slot_refs,
		yaw_modifier_value_ref = slot_378_43_0.slot_refs[1],
		yaw_modifier_variability_ref = slot_378_43_0.variability_ref
	}

	if type(slot_378_22_0) == "table" then
		for iter_378_3, iter_378_4 in pairs(slot_378_22_0) do
			slot_378_45_0[iter_378_3] = iter_378_4
		end
	end

	slot_0_92_4(slot_378_45_0, "left", slot_378_15_0, slot_378_16_0)
	slot_0_92_4(slot_378_45_0, "right", slot_378_17_0, slot_378_18_0)

	return slot_378_45_0
end

function slot_0_61_20.create_phase_view(arg_386_0, arg_386_1, arg_386_2)
	if arg_386_2 == nil or arg_386_2 <= 1 then
		return slot_0_68_17(arg_386_0, arg_386_1)
	end

	local var_386_0 = slot_0_68_17(arg_386_0, arg_386_1)
	local var_386_1 = slot_0_61_20.condition_phase_views[arg_386_0]

	if type(var_386_1) ~= "table" then
		var_386_1 = {}
		slot_0_61_20.condition_phase_views[arg_386_0] = var_386_1
	end

	local var_386_2 = var_386_1[arg_386_1]

	if type(var_386_2) ~= "table" then
		var_386_2 = {}
		var_386_1[arg_386_1] = var_386_2
	end

	local var_386_3 = var_386_2[arg_386_2]

	if var_386_3 ~= nil then
		return var_386_3
	end

	local var_386_4 = tostring(arg_386_0) .. "_" .. tostring(arg_386_1) .. "_" .. tostring(arg_386_2)

	local function var_386_5(arg_387_0)
		return slot_0_44_4(arg_386_0, arg_386_1, arg_386_2, arg_387_0)
	end

	local var_386_6 = ui.create(slot_0_12_0.angles, slot_0_90_5("Yaw", "state_yaw_phase_" .. var_386_4), 2)
	local var_386_7 = ui.create(slot_0_12_0.angles, slot_0_90_5("Feature", "state_feature_phase_" .. var_386_4), 2)
	local var_386_8 = ui.create(slot_0_12_0.angles, slot_0_90_5("Hidden", "state_hidden_phase_" .. var_386_4), 2)
	local var_386_9 = ui.create(slot_0_12_0.angles, slot_0_90_5("Body Yaw", "state_body_yaw_phase_" .. var_386_4), 1)
	local var_386_10
	local var_386_11 = slot_0_104_4(var_386_8, var_386_5, function()
		slot_0_103_4(var_386_10)
	end)

	var_386_10 = slot_0_106_4(var_386_6, var_386_7, var_386_7, var_386_9, nil, var_386_5, arg_386_1, arg_386_0, "phase_" .. tostring(arg_386_2), var_386_11.yaw_modifier.switch_ref)
	var_386_10.yaw_group = var_386_6
	var_386_10.side_group = var_386_7
	var_386_10.hidden_group = var_386_8
	var_386_10.body_group = var_386_9
	var_386_10.yaw_modify_group = nil
	var_386_10.hidden_yaw_switch_ref = var_386_11.yaw.switch_ref
	var_386_10.hidden_yaw_mode_ref = var_386_11.yaw.mode_ref
	var_386_10.hidden_yaw_static_ref = var_386_11.yaw.static_ref
	var_386_10.hidden_left_yaw_ref = var_386_11.yaw.left_ref
	var_386_10.hidden_right_yaw_ref = var_386_11.yaw.right_ref
	var_386_10.hidden_yaw_modifier_switch_ref = var_386_11.yaw_modifier.switch_ref
	var_386_10.hidden_yaw_modifier_mode_ref = var_386_11.yaw_modifier.mode_ref
	var_386_10.hidden_yaw_modifier_values_mode_ref = var_386_11.yaw_modifier.values_mode_ref
	var_386_10.hidden_yaw_modifier_sliders_ref = var_386_11.yaw_modifier.sliders_ref
	var_386_10.hidden_yaw_modifier_slot_refs = var_386_11.yaw_modifier.slot_refs
	var_386_10.hidden_yaw_modifier_value_ref = var_386_11.yaw_modifier.value_ref
	var_386_10.hidden_yaw_modifier_variability_ref = var_386_11.yaw_modifier.variability_ref
	var_386_10.hidden_yaw_modifier_meta_mode_ref = var_386_11.yaw_modifier.meta_mode_ref
	var_386_10.hidden_yaw_modifier_meta_offset_ref = var_386_11.yaw_modifier.meta_offset_ref
	var_386_10.hidden_yaw_modifier_meta_delay_cycle_ref = var_386_11.yaw_modifier.meta_delay_cycle_ref
	var_386_10.hidden_yaw_modifier_meta_delay_time_ref = var_386_11.yaw_modifier.meta_delay_time_ref
	var_386_10.hidden_yaw_modifier_meta_safe_yaw_ref = var_386_11.yaw_modifier.meta_safe_yaw_ref

	slot_0_61_20.copy_view_values(var_386_0, var_386_10)
	slot_0_103_4(var_386_10)
	var_386_6:visibility(false)
	var_386_7:visibility(false)
	var_386_8:visibility(false)
	var_386_9:visibility(false)

	var_386_2[arg_386_2] = var_386_10

	slot_0_81_7()

	return var_386_10
end

function slot_0_61_20.ensure_phase_views(arg_389_0, arg_389_1, arg_389_2)
	local var_389_0 = slot_0_64_19(arg_389_2)

	for iter_389_0 = 2, var_389_0 do
		slot_0_61_20.create_phase_view(arg_389_0, arg_389_1, iter_389_0)
	end
end

function slot_0_107_4()
	for iter_390_0 = 1, #slot_0_55_16.condition_views do
		local var_390_0 = slot_0_55_16.condition_views[iter_390_0]

		if var_390_0 ~= nil then
			for iter_390_1 = 1, #var_390_0 do
				if slot_0_74_16(iter_390_0, iter_390_1) == true then
					return true
				end
			end
		end
	end

	return false
end

function slot_0_108_4(arg_391_0, arg_391_1, arg_391_2)
	if arg_391_0 == nil or arg_391_1 == nil or arg_391_2 == nil then
		return false
	end

	local var_391_0 = arg_391_0:get_eye_position()

	if var_391_0 == nil then
		return false
	end

	local var_391_1

	local function var_391_2(arg_392_0)
		if arg_392_0 == nil then
			return false
		end

		local var_392_0 = arg_392_0:closest_ray_point(var_391_0, arg_391_1)

		if var_392_0 == nil then
			return false
		end

		local var_392_1 = var_392_0:dist(arg_392_0)

		if type(var_392_1) ~= "number" then
			return false
		end

		if var_391_1 == nil or var_392_1 < var_391_1 then
			var_391_1 = var_392_1
		end

		return var_392_1 <= slot_0_61_20.impact_threshold
	end

	for iter_391_0 = 1, #slot_0_61_20.hitboxes do
		local var_391_3 = slot_0_61_20.hitboxes[iter_391_0]

		if var_391_2(arg_391_2:get_hitbox_position(var_391_3)) == true then
			return true
		end
	end

	if var_391_2(arg_391_2:get_eye_position()) == true then
		return true
	end

	if var_391_2(arg_391_2:get_origin()) == true then
		return true
	end

	return false
end

function slot_0_109_5(arg_393_0, arg_393_1, arg_393_2, arg_393_3)
	if type(arg_393_0) ~= "number" then
		return
	end

	local var_393_0 = tonumber(arg_393_3)

	if type(var_393_0) == "number" then
		if slot_0_61_20.runtime_state.last_impact_tick[arg_393_0] == var_393_0 then
			return
		end

		slot_0_61_20.runtime_state.last_impact_tick[arg_393_0] = var_393_0
	end

	local var_393_1 = slot_0_61_20.runtime_state.pending_shots

	var_393_1[#var_393_1 + 1] = {
		attacker_index = arg_393_0,
		team_index = arg_393_1,
		condition_index = arg_393_2,
		expires_at = (globals.realtime or 0) + slot_0_61_20.miss_timeout
	}

	if #var_393_1 > 64 then
		table.remove(var_393_1, 1)
	end
end

function slot_0_110_5(arg_394_0)
	if arg_394_0 == nil or type(arg_394_0.userid) ~= "number" then
		return
	end

	local var_394_0 = entity.get_local_player()

	if var_394_0 == nil or var_394_0:is_alive() ~= true then
		return
	end

	local var_394_1 = entity.get(arg_394_0.userid, true)

	if var_394_1 == var_394_0 or var_394_1 == nil or var_394_1:is_player() ~= true or var_394_1:is_alive() ~= true then
		return
	end

	if var_394_1.m_iTeamNum == var_394_0.m_iTeamNum then
		return
	end

	local var_394_2 = var_394_1:get_index()

	if type(var_394_2) ~= "number" then
		return
	end

	local var_394_3 = slot_0_50_13.team_index

	if type(var_394_3) ~= "number" then
		var_394_3 = 1
	end

	local var_394_4 = slot_0_50_13.base_condition_index

	if type(var_394_4) ~= "number" then
		var_394_4 = slot_0_20_2.standing
	end

	if slot_0_61_20.get_phase_count(var_394_3, var_394_4) <= 1 then
		return
	end

	local var_394_5 = vector(arg_394_0.x, arg_394_0.y, arg_394_0.z)

	if slot_0_108_4(var_394_1, var_394_5, var_394_0) ~= true then
		return
	end

	slot_0_109_5(var_394_2, var_394_3, var_394_4, globals.tickcount)
end

function slot_0_111_5(arg_395_0)
	if arg_395_0 == nil or type(arg_395_0.userid) ~= "number" or type(arg_395_0.attacker) ~= "number" then
		return
	end

	local var_395_0 = entity.get_local_player()

	if var_395_0 == nil then
		return
	end

	if entity.get(arg_395_0.userid, true) ~= var_395_0 then
		return
	end

	local var_395_1 = entity.get(arg_395_0.attacker, true)

	if var_395_1 == nil or var_395_1.get_index == nil then
		return
	end

	local var_395_2 = var_395_1:get_index()

	if type(var_395_2) ~= "number" then
		return
	end

	local var_395_3 = slot_0_61_20.runtime_state.pending_shots

	for iter_395_0 = #var_395_3, 1, -1 do
		local var_395_4 = var_395_3[iter_395_0]

		if var_395_4 ~= nil and var_395_4.attacker_index == var_395_2 then
			table.remove(var_395_3, iter_395_0)

			break
		end
	end
end

function slot_0_112_6()
	local var_396_0 = slot_0_61_20.runtime_state.pending_shots

	if #var_396_0 == 0 then
		return
	end

	local var_396_1 = entity.get_local_player()

	if var_396_1 == nil or var_396_1:is_alive() ~= true then
		slot_0_61_20.runtime_state.pending_shots = {}

		return
	end

	local var_396_2 = globals.realtime or 0

	for iter_396_0 = #var_396_0, 1, -1 do
		local var_396_3 = var_396_0[iter_396_0]

		if var_396_3 ~= nil and var_396_2 >= (var_396_3.expires_at or 0) then
			slot_0_78_11(var_396_3.team_index, var_396_3.condition_index)
			table.remove(var_396_0, iter_396_0)
		end
	end
end

function slot_0_113_6()
	slot_0_77_11()
end

function slot_0_114_6(arg_398_0)
	if arg_398_0 == nil or type(arg_398_0.userid) ~= "number" then
		return
	end

	local var_398_0 = entity.get_local_player()

	if var_398_0 == nil then
		return
	end

	if entity.get(arg_398_0.userid, true) == var_398_0 then
		slot_0_77_11()
	end
end

function slot_0_61_20.update_callbacks()
	local var_399_0 = slot_0_107_4()

	events.bullet_impact(slot_0_110_5, var_399_0)
	events.player_hurt(slot_0_111_5, var_399_0)
	events.createmove_run(slot_0_112_6, var_399_0)
	events.round_prestart(slot_0_113_6, var_399_0)
	events.round_start(slot_0_113_6, var_399_0)
	events.level_init(slot_0_113_6, var_399_0)
	events.player_death(slot_0_114_6, var_399_0)

	if var_399_0 ~= true then
		slot_0_77_11()
	end
end

function slot_0_61_20.update_team_controls(arg_400_0)
	local var_400_0 = slot_0_61_20.team_selector_refs[arg_400_0]

	if var_400_0 == nil then
		return
	end

	local var_400_1 = slot_0_55_16.condition_views[arg_400_0]

	if var_400_1 == nil then
		return
	end

	local var_400_2 = slot_0_70_19(arg_400_0)
	local var_400_3 = slot_0_68_17(arg_400_0, var_400_2)
	local var_400_4 = slot_0_74_16(arg_400_0, var_400_2)
	local var_400_5 = slot_0_61_20.get_phase_count(arg_400_0, var_400_2)

	for iter_400_0 = 1, #var_400_1 do
		local var_400_6 = var_400_1[iter_400_0]
		local var_400_7 = iter_400_0 == var_400_2

		if var_400_6 ~= nil and var_400_6.antibruteforce_switch_ref ~= nil then
			var_400_6.antibruteforce_switch_ref:visibility(var_400_7)
			var_400_6.antibruteforce_switch_ref:disabled(not var_400_7)
		end

		if var_400_6 ~= nil and var_400_6.antibruteforce_phases_ref ~= nil then
			local var_400_8 = var_400_7 and var_400_4 == true

			var_400_6.antibruteforce_phases_ref:visibility(var_400_8)
			var_400_6.antibruteforce_phases_ref:disabled(not var_400_8)
		end
	end

	if var_400_4 == true then
		slot_0_61_20.ensure_phase_views(arg_400_0, var_400_2, var_400_5)
	else
		var_400_5 = 1

		slot_0_72_17(arg_400_0, 1)
		slot_0_76_12(arg_400_0, var_400_2)
	end

	local var_400_9 = slot_0_66_19(var_400_5)
	local var_400_10 = slot_0_71_19(arg_400_0)

	if var_400_5 < var_400_10 then
		var_400_10 = 1

		slot_0_72_17(arg_400_0, 1)
	end

	if var_400_0.phase_combo_ref ~= nil then
		var_400_0.phase_combo_ref:update(var_400_9)
		var_400_0.phase_combo_ref:visibility(var_400_4 == true)

		var_400_0.syncing_phase_combo = true

		var_400_0.phase_combo_ref:set(var_400_9[var_400_10] or "Current")

		var_400_0.syncing_phase_combo = false
	end

	if slot_0_49_9.active_team_index == arg_400_0 and slot_0_49_9.active_condition_index == var_400_2 and slot_0_49_9.is_condition_menu_open ~= true then
		slot_0_88_6()
	elseif var_400_3 ~= nil and slot_0_49_9.active_team_index == arg_400_0 and slot_0_49_9.active_condition_index == var_400_2 and slot_0_49_9.is_condition_menu_open == true then
		slot_0_89_5(arg_400_0, var_400_2)
	end
end

for iter_0_5 = 1, #slot_0_34_6 do
	slot_0_113_5 = ui.create(slot_0_12_0.angles, slot_0_90_5(slot_0_34_6[iter_0_5], "state_selector_group_" .. iter_0_5), 1)
	slot_0_114_5 = {}
	slot_0_115_5 = slot_0_113_5:combo(slot_0_19_2.prefix_dot .. "   Current##state_selector_" .. iter_0_5, slot_0_35_6)
	slot_0_116_5 = slot_0_113_5:combo(slot_0_19_2.prefix_dot .. "   Phase##anti_bruteforce_phase_selector_" .. iter_0_5, slot_0_66_19(2))

	slot_0_116_5:visibility(false)

	slot_0_61_20.team_selector_refs[iter_0_5] = {
		active_phase_index = 1,
		syncing_phase_combo = false,
		state_combo_ref = slot_0_115_5,
		phase_combo_ref = slot_0_116_5
	}

	for iter_0_6 = 1, #slot_0_35_6 do
		slot_0_121_5 = ui.create(slot_0_12_0.angles, slot_0_90_5("Yaw", "state_yaw_" .. iter_0_5 .. "_" .. iter_0_6), 2)
		slot_0_122_5 = nil
		slot_0_123_5 = ui.create(slot_0_12_0.angles, slot_0_90_5("Feature", "state_feature_" .. iter_0_5 .. "_" .. iter_0_6), 2)
		slot_0_124_5 = ui.create(slot_0_12_0.angles, slot_0_90_5("Hidden", "state_hidden_" .. iter_0_5 .. "_" .. iter_0_6), 2)
		slot_0_125_5 = ui.create(slot_0_12_0.angles, slot_0_90_5("Body Yaw", "state_body_yaw_" .. iter_0_5 .. "_" .. iter_0_6), 1)
		slot_0_126_5 = slot_0_13_0.push(slot_0_121_5:combo(slot_0_19_2.prefix_dot .. "   Type", slot_0_23_2), slot_0_43_4(iter_0_5, iter_0_6, "fake_yaw_mode"))
		slot_0_127_5 = slot_0_13_0.push(slot_0_121_5:slider(slot_0_19_2.prefix_arrow .. "   Left", -60, 60, 0), slot_0_43_4(iter_0_5, iter_0_6, "left_yaw"))
		slot_0_128_5 = slot_0_13_0.push(slot_0_127_5:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), slot_0_43_4(iter_0_5, iter_0_6, "left_yaw_randomize"))
		slot_0_129_4 = slot_0_13_0.push(slot_0_121_5:slider(slot_0_19_2.prefix_arrow .. "   Right", -60, 60, 0), slot_0_43_4(iter_0_5, iter_0_6, "right_yaw"))
		slot_0_130_3 = slot_0_13_0.push(slot_0_129_4:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), slot_0_43_4(iter_0_5, iter_0_6, "right_yaw_randomize"))
		slot_0_131_3 = slot_0_13_0.push(slot_0_113_5:switch(slot_0_19_2.prefix_dot .. "   Phase Builder", false), slot_0_43_4(iter_0_5, iter_0_6, "anti_bruteforce_enabled"))

		slot_0_131_3:visibility(false)

		slot_0_132_3 = slot_0_131_3:create()
		slot_0_133_3 = slot_0_13_0.push(slot_0_132_3:slider(slot_0_19_2.prefix_arrow .. "   Phases", 2, 10, 2), slot_0_43_4(iter_0_5, iter_0_6, "anti_bruteforce_phases"))

		slot_0_133_3:visibility(false)

		slot_0_134_3 = nil
		slot_0_135_3 = nil
		slot_0_136_3 = nil
		slot_0_137_3 = nil

		if iter_0_6 == slot_0_20_2.crouch_running then
			slot_0_134_3, slot_0_135_3 = slot_0_91_4(slot_0_127_5, -60, 60, function(arg_401_0)
				return slot_0_43_4(iter_0_5, iter_0_6, arg_401_0)
			end, "left")
			slot_0_136_3, slot_0_137_3 = slot_0_91_4(slot_0_129_4, -60, 60, function(arg_402_0)
				return slot_0_43_4(iter_0_5, iter_0_6, arg_402_0)
			end, "right")
		end

		function slot_0_138_3()
			slot_0_27_4(slot_0_126_5, slot_0_127_5, slot_0_129_4)
		end

		slot_0_126_5:set_callback(slot_0_138_3, true)

		slot_0_139_3 = slot_0_13_0.push(slot_0_123_5:combo(slot_0_19_2.prefix_dot .. "   Mode", {
			"Jitter",
			"Meta",
			"Static"
		}), slot_0_43_4(iter_0_5, iter_0_6, "jitter_mode"))
		slot_0_140_3 = slot_0_13_0.push(slot_0_123_5:selectable(slot_0_19_2.prefix_dot .. "   Break LC", {
			"Double Tap",
			"Hide Shots"
		}), slot_0_43_4(iter_0_5, iter_0_6, "break_lc_mode"))
		slot_0_141_3 = slot_0_48_8(slot_0_123_5, slot_0_140_3, iter_0_5, iter_0_6)
		slot_0_142_3 = slot_0_139_3:create()

		function slot_0_143_2(arg_404_0)
			local var_404_0 = math.floor(arg_404_0 or 1)

			if var_404_0 <= 1 then
				return "Jitter"
			end

			return tostring(var_404_0) .. " t"
		end

		slot_0_144_2 = {
			target_ref = slot_0_13_0.push(slot_0_142_3:combo(slot_0_19_2.prefix_dot .. "   Type", {
				"Default",
				"Hidden"
			}), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_target"))
		}
		slot_0_145_2 = slot_0_13_0.push(slot_0_142_3:combo(slot_0_19_2.prefix_dot .. "   Delay", {
			"Solo",
			"Double",
			"Custom"
		}), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_mode"))
		slot_0_146_2 = slot_0_13_0.push(slot_0_142_3:slider(slot_0_19_2.prefix_dot .. "   Sliders", 2, 10, 3), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_sliders"))
		slot_0_147_2 = slot_0_13_0.push(slot_0_142_3:slider(slot_0_19_2.prefix_arrow .. "   [1]", 1, 16, 1, nil, slot_0_143_2), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay"))
		slot_0_148_2 = {
			slot_0_147_2
		}

		for iter_0_7 = 2, 10 do
			slot_0_148_2[iter_0_7] = slot_0_13_0.push(slot_0_142_3:slider(slot_0_19_2.prefix_arrow .. "   [" .. tostring(iter_0_7) .. "]", 1, 16, 1, nil, slot_0_143_2), slot_0_43_4(iter_0_5, iter_0_6, slot_0_105_4(iter_0_7)))
		end

		slot_0_149_2 = slot_0_13_0.push(slot_0_142_3:slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_variability"))
		slot_0_144_2.mode_ref = slot_0_13_0.push(slot_0_142_3:combo(slot_0_19_2.prefix_dot .. "   Mode", slot_0_57_16.mode_items), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_meta_mode"))
		slot_0_144_2.offset_ref = slot_0_13_0.push(slot_0_142_3:slider(slot_0_19_2.prefix_arrow .. "   Offset", 1, 16, 4, nil, slot_0_57_16.format_offset), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_meta_offset"))
		slot_0_144_2.cycle_ref = slot_0_13_0.push(slot_0_142_3:slider(slot_0_19_2.prefix_dot .. "   Delay Cycle", 0, 200, 12, 1, slot_0_57_16.format_delay_cycle), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_meta_cycle"))
		slot_0_144_2.time_ref = slot_0_13_0.push(slot_0_142_3:slider(slot_0_19_2.prefix_dot .. "   Delay Time", 5, 30, 15, 1, slot_0_57_16.format_delay_time), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_meta_time"))
		slot_0_144_2.safe_ref = slot_0_13_0.push(slot_0_142_3:switch(slot_0_19_2.prefix_dot .. "   Safe Delay", true), slot_0_43_4(iter_0_5, iter_0_6, "jitter_delay_meta_safe"))
		slot_0_150_2 = slot_0_13_0.push(slot_0_123_5:switch(slot_0_19_2.prefix_arrow .. "   Inverter", false), slot_0_43_4(iter_0_5, iter_0_6, "static_inverter"))

		function slot_0_151_2()
			local var_405_0 = "Solo"

			if slot_0_145_2 ~= nil then
				var_405_0 = slot_0_145_2:get()
			end

			local var_405_1 = 2

			if slot_0_146_2 ~= nil then
				local var_405_2 = slot_0_146_2:get()

				if type(var_405_2) == "number" then
					var_405_1 = var_405_2
				end
			end

			return slot_0_93_4(var_405_0, var_405_1)
		end

		function slot_0_152_2()
			local var_406_0 = slot_0_139_3:get()
			local var_406_1 = var_406_0 == slot_0_22_2.jitter or var_406_0 == "Jitter"
			local var_406_2 = slot_0_28_4(var_406_0)
			local var_406_3 = var_406_0 == slot_0_22_2.static or var_406_0 == "Static"
			local var_406_4 = var_406_1
			local var_406_5 = slot_0_145_2:get()
			local var_406_6 = var_406_5 == 3 or var_406_5 == "Custom"
			local var_406_7 = var_406_2
			local var_406_8 = var_406_4
			local var_406_9 = var_406_4 and var_406_6
			local var_406_10 = var_406_1 or var_406_2
			local var_406_11 = slot_0_151_2()

			slot_0_142_3:visibility(var_406_1 or var_406_2)
			slot_0_144_2.target_ref:visibility(var_406_1)
			slot_0_144_2.target_ref:disabled(not var_406_1)
			slot_0_147_2:visibility(var_406_8)
			slot_0_147_2:disabled(not var_406_8)
			slot_0_145_2:disabled(not var_406_4)
			slot_0_145_2:visibility(var_406_4)
			slot_0_146_2:visibility(var_406_9)
			slot_0_146_2:disabled(not var_406_9)
			slot_0_149_2:visibility(var_406_10)
			slot_0_149_2:disabled(not var_406_10)
			slot_0_144_2.mode_ref:visibility(var_406_7)
			slot_0_144_2.mode_ref:disabled(not var_406_7)
			slot_0_144_2.offset_ref:visibility(var_406_7)
			slot_0_144_2.offset_ref:disabled(not var_406_7)
			slot_0_144_2.cycle_ref:visibility(var_406_7)
			slot_0_144_2.cycle_ref:disabled(not var_406_7)
			slot_0_144_2.time_ref:visibility(var_406_7)
			slot_0_144_2.time_ref:disabled(not var_406_7)
			slot_0_144_2.safe_ref:visibility(var_406_7)
			slot_0_144_2.safe_ref:disabled(not var_406_7)

			for iter_406_0 = 2, 10 do
				local var_406_12 = slot_0_148_2[iter_406_0]

				if var_406_12 ~= nil then
					local var_406_13 = var_406_8 and iter_406_0 <= var_406_11

					var_406_12:visibility(var_406_13)
					var_406_12:disabled(not var_406_13)
				end
			end

			slot_0_150_2:visibility(var_406_3)
			slot_0_81_7()
		end

		slot_0_139_3:set_callback(slot_0_152_2, true)
		slot_0_144_2.target_ref:set_callback(slot_0_152_2)
		slot_0_147_2:set_callback(slot_0_152_2)
		slot_0_145_2:set_callback(slot_0_152_2)
		slot_0_146_2:set_callback(slot_0_152_2)
		slot_0_144_2.mode_ref:set_callback(slot_0_152_2)
		slot_0_144_2.offset_ref:set_callback(slot_0_152_2)
		slot_0_144_2.cycle_ref:set_callback(slot_0_152_2)
		slot_0_144_2.time_ref:set_callback(slot_0_152_2)
		slot_0_144_2.safe_ref:set_callback(slot_0_152_2)

		for iter_0_8 = 2, 10 do
			slot_0_157_3 = slot_0_148_2[iter_0_8]

			if slot_0_157_3 ~= nil then
				slot_0_157_3:set_callback(slot_0_152_2)
			end
		end

		slot_0_153_2 = nil
		slot_0_154_2 = slot_0_104_4(slot_0_124_5, function(arg_407_0)
			return slot_0_43_4(iter_0_5, iter_0_6, arg_407_0)
		end, function()
			slot_0_103_4(slot_0_153_2)
		end)
		slot_0_155_2 = slot_0_13_0.push(slot_0_125_5:switch(slot_0_19_2.prefix_dot .. "   Body Yaw", true), slot_0_43_4(iter_0_5, iter_0_6, "body_yaw_enabled"))
		slot_0_156_2 = slot_0_155_2:create()
		slot_0_157_2 = slot_0_13_0.push(slot_0_156_2:slider(slot_0_19_2.prefix_arrow .. "   Delay", 0, 20, 0, nil, function(arg_409_0)
			local var_409_0 = math.floor(arg_409_0 or 0)

			if var_409_0 <= 0 then
				return "Off"
			end

			return tostring(var_409_0) .. " t"
		end), slot_0_43_4(iter_0_5, iter_0_6, "body_switch_delay"))
		slot_0_158_2 = slot_0_13_0.push(slot_0_156_2:slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), slot_0_43_4(iter_0_5, iter_0_6, "body_switch_variability"))
		slot_0_159_2 = slot_0_13_0.push(slot_0_125_5:slider(slot_0_19_2.prefix_arrow .. "   Left", 0, 60, 60), slot_0_43_4(iter_0_5, iter_0_6, "body_left"))
		slot_0_160_2 = slot_0_13_0.push(slot_0_159_2:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), slot_0_43_4(iter_0_5, iter_0_6, "body_left_variability"))
		slot_0_161_2 = slot_0_13_0.push(slot_0_125_5:slider(slot_0_19_2.prefix_arrow .. "   Right", 0, 60, 60), slot_0_43_4(iter_0_5, iter_0_6, "body_right"))
		slot_0_162_1 = slot_0_13_0.push(slot_0_161_2:create():slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), slot_0_43_4(iter_0_5, iter_0_6, "body_right_variability"))

		function slot_0_163_1()
			local var_410_0 = slot_0_155_2:get() == true

			slot_0_156_2:visibility(var_410_0)
			slot_0_159_2:disabled(not var_410_0)
			slot_0_160_2:disabled(not var_410_0)
			slot_0_161_2:disabled(not var_410_0)
			slot_0_162_1:disabled(not var_410_0)
		end

		slot_0_155_2:set_callback(slot_0_163_1, true)

		slot_0_164_1 = {
			switch_ref = slot_0_13_0.push(slot_0_121_5:switch(slot_0_19_2.prefix_dot .. "   Yaw Modifier", false), slot_0_43_4(iter_0_5, iter_0_6, "yaw_modifier_enabled"))
		}
		slot_0_164_1.group_ref = slot_0_164_1.switch_ref:create()
		slot_0_164_1.mode_ref = slot_0_13_0.push(slot_0_164_1.group_ref:combo(slot_0_19_2.prefix_dot .. "   Mode", slot_0_94_4), slot_0_43_4(iter_0_5, iter_0_6, "yaw_modifier_mode"))
		slot_0_164_1.mode_group = slot_0_164_1.group_ref
		slot_0_164_1.values_mode_ref = slot_0_13_0.push(slot_0_164_1.mode_group:combo(slot_0_19_2.prefix_dot .. "   Values", {
			"Solo",
			"Double",
			"Custom"
		}), slot_0_43_4(iter_0_5, iter_0_6, "yaw_modifier_values_mode"))
		slot_0_164_1.sliders_ref = slot_0_13_0.push(slot_0_164_1.mode_group:slider(slot_0_19_2.prefix_dot .. "   Sliders", 2, 10, 3), slot_0_43_4(iter_0_5, iter_0_6, "yaw_modifier_sliders"))
		slot_0_164_1.slot_refs = {}

		for iter_0_9 = 1, 10 do
			slot_0_169_1 = slot_0_13_0.push(slot_0_164_1.mode_group:slider(slot_0_19_2.prefix_arrow .. "   [" .. tostring(iter_0_9) .. "]", -180, 180, 0), slot_0_43_4(iter_0_5, iter_0_6, slot_0_101_5(iter_0_9)))
			slot_0_164_1.slot_refs[iter_0_9] = slot_0_169_1
		end

		slot_0_164_1.variability_ref = slot_0_13_0.push(slot_0_164_1.mode_group:slider(slot_0_19_2.prefix_dot .. "   Randomize", 0, 100, 0, nil, "%"), slot_0_43_4(iter_0_5, iter_0_6, "yaw_modifier_variability"))
		slot_0_164_1.hidden_yaw_modifier_switch_ref = slot_0_154_2.yaw_modifier.switch_ref

		function slot_0_165_1()
			slot_0_103_4(slot_0_164_1)
		end

		slot_0_164_1.switch_ref:set_callback(slot_0_165_1, true)
		slot_0_164_1.mode_ref:set_callback(slot_0_165_1)
		slot_0_164_1.values_mode_ref:set_callback(slot_0_165_1)
		slot_0_164_1.sliders_ref:set_callback(slot_0_165_1)
		slot_0_121_5:visibility(false)
		slot_0_123_5:visibility(false)
		slot_0_124_5:visibility(false)
		slot_0_125_5:visibility(false)

		slot_0_153_2 = {
			yaw_group = slot_0_121_5,
			side_group = slot_0_123_5,
			hidden_group = slot_0_124_5,
			body_group = slot_0_125_5,
			yaw_modify_group = slot_0_122_5,
			antibruteforce_switch_ref = slot_0_131_3,
			antibruteforce_phases_ref = slot_0_133_3,
			fake_yaw_mode_ref = slot_0_126_5,
			left_yaw_ref = slot_0_127_5,
			right_yaw_ref = slot_0_129_4,
			left_yaw_randomize_ref = slot_0_128_5,
			right_yaw_randomize_ref = slot_0_130_3,
			hidden_yaw_switch_ref = slot_0_154_2.yaw.switch_ref,
			hidden_yaw_mode_ref = slot_0_154_2.yaw.mode_ref,
			hidden_yaw_static_ref = slot_0_154_2.yaw.static_ref,
			hidden_left_yaw_ref = slot_0_154_2.yaw.left_ref,
			hidden_right_yaw_ref = slot_0_154_2.yaw.right_ref,
			hidden_yaw_modifier_switch_ref = slot_0_154_2.yaw_modifier.switch_ref,
			hidden_yaw_modifier_mode_ref = slot_0_154_2.yaw_modifier.mode_ref,
			hidden_yaw_modifier_values_mode_ref = slot_0_154_2.yaw_modifier.values_mode_ref,
			hidden_yaw_modifier_sliders_ref = slot_0_154_2.yaw_modifier.sliders_ref,
			hidden_yaw_modifier_slot_refs = slot_0_154_2.yaw_modifier.slot_refs,
			hidden_yaw_modifier_value_ref = slot_0_154_2.yaw_modifier.value_ref,
			hidden_yaw_modifier_variability_ref = slot_0_154_2.yaw_modifier.variability_ref,
			hidden_yaw_modifier_meta_mode_ref = slot_0_154_2.yaw_modifier.meta_mode_ref,
			hidden_yaw_modifier_meta_offset_ref = slot_0_154_2.yaw_modifier.meta_offset_ref,
			hidden_yaw_modifier_meta_delay_cycle_ref = slot_0_154_2.yaw_modifier.meta_delay_cycle_ref,
			hidden_yaw_modifier_meta_delay_time_ref = slot_0_154_2.yaw_modifier.meta_delay_time_ref,
			hidden_yaw_modifier_meta_safe_yaw_ref = slot_0_154_2.yaw_modifier.meta_safe_yaw_ref,
			jitter_mode_ref = slot_0_139_3,
			jitter_delay_target_ref = slot_0_144_2.target_ref,
			jitter_delay_ref = slot_0_147_2,
			jitter_delay_mode_ref = slot_0_145_2,
			jitter_delay_sliders_ref = slot_0_146_2,
			jitter_delay_slot_refs = slot_0_148_2,
			jitter_delay_variability_ref = slot_0_149_2,
			jitter_delay_meta_mode_ref = slot_0_144_2.mode_ref,
			jitter_delay_meta_offset_ref = slot_0_144_2.offset_ref,
			jitter_delay_meta_cycle_ref = slot_0_144_2.cycle_ref,
			jitter_delay_meta_time_ref = slot_0_144_2.time_ref,
			jitter_delay_meta_safe_ref = slot_0_144_2.safe_ref,
			static_inverter_ref = slot_0_150_2,
			break_lc_mode_ref = slot_0_140_3,
			body_yaw_switch_ref = slot_0_155_2,
			body_yaw_switch_delay_ref = slot_0_157_2,
			body_yaw_switch_var_ref = slot_0_158_2,
			body_left_ref = slot_0_159_2,
			body_right_ref = slot_0_161_2,
			body_left_var_ref = slot_0_160_2,
			body_right_var_ref = slot_0_162_1,
			yaw_modifier_switch_ref = slot_0_164_1.switch_ref,
			yaw_modifier_group_ref = slot_0_164_1.group_ref,
			yaw_modifier_mode_ref = slot_0_164_1.mode_ref,
			yaw_modifier_values_mode_ref = slot_0_164_1.values_mode_ref,
			yaw_modifier_sliders_ref = slot_0_164_1.sliders_ref,
			yaw_modifier_slot_refs = slot_0_164_1.slot_refs,
			yaw_modifier_value_ref = slot_0_164_1.slot_refs[1],
			yaw_modifier_variability_ref = slot_0_164_1.variability_ref
		}

		if type(slot_0_141_3) == "table" then
			for iter_0_10, iter_0_11 in pairs(slot_0_141_3) do
				slot_0_153_2[iter_0_10] = iter_0_11
			end
		end

		slot_0_92_4(slot_0_153_2, "left", slot_0_134_3, slot_0_135_3)
		slot_0_92_4(slot_0_153_2, "right", slot_0_136_3, slot_0_137_3)

		function slot_0_166_1()
			local var_412_0 = slot_0_131_3:get() == true
			local var_412_1 = slot_0_64_19(slot_0_133_3:get())

			if var_412_0 == true then
				slot_0_61_20.ensure_phase_views(iter_0_5, iter_0_6, var_412_1)
			else
				slot_0_76_12(iter_0_5, iter_0_6)
			end

			if var_412_1 < slot_0_71_19(iter_0_5) then
				slot_0_72_17(iter_0_5, 1)
			end

			slot_0_61_20.update_team_controls(iter_0_5)
			slot_0_61_20.update_callbacks()
		end

		slot_0_131_3:set_callback(slot_0_166_1)
		slot_0_133_3:set_callback(slot_0_166_1)

		slot_0_114_5[iter_0_6] = slot_0_153_2

		slot_0_103_4(slot_0_153_2)
		slot_0_81_7()
	end

	slot_0_116_5:set_callback(function(arg_413_0)
		local var_413_0 = slot_0_61_20.team_selector_refs[iter_0_5]

		if var_413_0 ~= nil and var_413_0.syncing_phase_combo == true then
			return
		end

		local var_413_1 = slot_0_67_19(arg_413_0:get())

		slot_0_72_17(iter_0_5, var_413_1)

		if slot_0_49_9.active_team_index == iter_0_5 then
			if slot_0_49_9.is_condition_menu_open == true then
				slot_0_89_5(iter_0_5, slot_0_49_9.active_condition_index)
			else
				slot_0_88_6()
			end
		end
	end)

	if slot_0_115_5 ~= nil then
		slot_0_115_5:set_callback(function(arg_414_0)
			slot_0_49_9.active_team_index = iter_0_5
			slot_0_49_9.active_condition_index = slot_0_63_18(arg_414_0:get())

			slot_0_72_17(iter_0_5, 1)
			slot_0_61_20.update_team_controls(iter_0_5)

			if slot_0_49_9.is_condition_menu_open ~= true then
				slot_0_88_6()
			end
		end, true)
	end

	slot_0_55_16.team_groups[iter_0_5] = slot_0_113_5
	slot_0_55_16.condition_views[iter_0_5] = slot_0_114_5

	slot_0_61_20.update_team_controls(iter_0_5)
	slot_0_81_7()
end

slot_0_61_20.update_callbacks()
slot_0_81_7()
slot_0_53_17:visibility(false)
slot_0_41_5:visibility(true)
slot_0_84_6()

function slot_0_109_4(arg_415_0, arg_415_1, arg_415_2)
	if arg_415_0 < arg_415_1 then
		return arg_415_1
	end

	if arg_415_2 < arg_415_0 then
		return arg_415_2
	end

	return arg_415_0
end

slot_0_110_4 = nil

function slot_0_111_4(arg_416_0, arg_416_1)
	local var_416_0 = slot_0_55_16.jitter_runtime[arg_416_0]

	if type(var_416_0) ~= "table" then
		var_416_0 = {}
		slot_0_55_16.jitter_runtime[arg_416_0] = var_416_0
	end

	local var_416_1 = slot_0_110_4(arg_416_0, arg_416_1)
	local var_416_2 = var_416_0[var_416_1]

	if type(var_416_2) ~= "table" then
		var_416_2 = {
			switch_count = 0,
			side = rage.antiaim:inverter() == true,
			next_switch_packet = slot_0_50_13.sent_packets + 1
		}
		var_416_0[var_416_1] = var_416_2
	end

	return var_416_2
end

function slot_0_112_4(arg_417_0, arg_417_1)
	local var_417_0 = slot_0_55_16.body_yaw_runtime[arg_417_0]

	if type(var_417_0) ~= "table" then
		var_417_0 = {}
		slot_0_55_16.body_yaw_runtime[arg_417_0] = var_417_0
	end

	local var_417_1 = slot_0_110_4(arg_417_0, arg_417_1)
	local var_417_2 = var_417_0[var_417_1]

	if type(var_417_2) ~= "table" then
		var_417_2 = {
			switch_packets = 0,
			switch_state = false,
			switch_last_flip = 0
		}
		var_417_0[var_417_1] = var_417_2
	end

	return var_417_2
end

function slot_0_113_4(arg_418_0)
	local var_418_0 = 1
	local var_418_1 = math.huge

	for iter_418_0 = 1, #slot_0_31_11 do
		local var_418_2 = math.abs(arg_418_0 - slot_0_31_11[iter_418_0])

		if var_418_2 < var_418_1 then
			var_418_1 = var_418_2
			var_418_0 = iter_418_0
		end
	end

	return var_418_0
end

function slot_0_114_4(arg_419_0, arg_419_1)
	local var_419_0 = slot_0_109_4(math.floor(arg_419_0 or 1), 1, 20)
	local var_419_1 = slot_0_109_4(arg_419_1 or 0, 0, 100)

	if var_419_0 <= 1 or var_419_1 <= 0 then
		return var_419_0
	end

	local var_419_2 = slot_0_113_4(var_419_0)
	local var_419_3 = #slot_0_31_11
	local var_419_4 = math.floor(var_419_3 * var_419_1 / 200 + 0.5)
	local var_419_5 = math.max(1, var_419_2 - var_419_4)
	local var_419_6 = math.min(var_419_3, var_419_2 + var_419_4)

	return slot_0_31_11[math.random(var_419_5, var_419_6)]
end

function slot_0_115_4(arg_420_0, arg_420_1, arg_420_2, arg_420_3, arg_420_4)
	local var_420_0 = arg_420_1 .. "_state"
	local var_420_1 = arg_420_1 .. "_packets"
	local var_420_2 = arg_420_1 .. "_last_flip"

	if type(arg_420_0[var_420_0]) ~= "boolean" then
		arg_420_0[var_420_0] = false
	end

	if type(arg_420_0[var_420_1]) ~= "number" then
		arg_420_0[var_420_1] = 0
	end

	if type(arg_420_0[var_420_2]) ~= "number" then
		arg_420_0[var_420_2] = 0
	end

	if arg_420_4 == true or globals.choked_commands ~= 0 then
		return arg_420_0[var_420_0] == true
	end

	arg_420_0[var_420_1] = arg_420_0[var_420_1] + 1

	local var_420_3 = slot_0_109_4(math.floor(arg_420_2 or 1), 1, 20)

	if (arg_420_3 or 0) > 0 then
		var_420_3 = slot_0_114_4(var_420_3, arg_420_3)
	end

	if var_420_3 <= arg_420_0[var_420_1] - arg_420_0[var_420_2] then
		arg_420_0[var_420_0] = not arg_420_0[var_420_0]
		arg_420_0[var_420_2] = arg_420_0[var_420_1]
	end

	return arg_420_0[var_420_0] == true
end

function slot_0_116_4(arg_421_0)
	local var_421_0 = 1
	local var_421_1 = math.huge

	for iter_421_0 = 1, #slot_0_30_9 do
		local var_421_2 = math.abs(arg_421_0 - slot_0_30_9[iter_421_0])

		if var_421_2 < var_421_1 then
			var_421_1 = var_421_2
			var_421_0 = iter_421_0
		end
	end

	return var_421_0
end

function slot_0_117_4(arg_422_0, arg_422_1)
	local var_422_0 = slot_0_109_4(math.floor(arg_422_0), 1, 16)
	local var_422_1 = 0

	if type(arg_422_1) == "number" then
		var_422_1 = slot_0_109_4(arg_422_1, 0, 100)
	end

	if var_422_0 <= 1 or var_422_1 <= 0 then
		return var_422_0
	end

	local var_422_2 = slot_0_116_4(var_422_0)
	local var_422_3 = #slot_0_30_9
	local var_422_4 = math.floor(var_422_3 * var_422_1 / 200 + 0.5)
	local var_422_5 = math.max(1, var_422_2 - var_422_4)
	local var_422_6 = math.min(var_422_3, var_422_2 + var_422_4)

	return slot_0_109_4(slot_0_30_9[math.random(var_422_5, var_422_6)], 1, 16)
end

function slot_0_57_16.normalize_mode(arg_423_0)
	if arg_423_0 == "3-Way" or arg_423_0 == 2 then
		return "3-Way"
	end

	if arg_423_0 == "5-Way" or arg_423_0 == 3 then
		return "5-Way"
	end

	return "2-Way"
end

function slot_0_57_16.get_ref_number(arg_424_0, arg_424_1)
	if arg_424_0 == nil or arg_424_0.get == nil then
		return arg_424_1
	end

	local var_424_0 = arg_424_0:get()

	if type(var_424_0) ~= "number" then
		return arg_424_1
	end

	return var_424_0
end

function slot_0_57_16.get_delay(arg_425_0, arg_425_1, arg_425_2, arg_425_3)
	if type(arg_425_0) ~= "table" or type(arg_425_1) ~= "table" then
		return 1
	end

	local var_425_0 = slot_0_57_16.normalize_mode(arg_425_1.jitter_delay_meta_mode_ref ~= nil and arg_425_1.jitter_delay_meta_mode_ref:get() or nil)
	local var_425_1 = slot_0_57_16.scales[var_425_0] or slot_0_57_16.scales["2-Way"]
	local var_425_2 = slot_0_109_4(math.floor(slot_0_57_16.get_ref_number(arg_425_1.jitter_delay_meta_offset_ref, 4)), 1, 16)
	local var_425_3 = math.floor(slot_0_57_16.get_ref_number(arg_425_1.jitter_delay_meta_cycle_ref, 0))
	local var_425_4 = slot_0_109_4(math.floor(slot_0_57_16.get_ref_number(arg_425_1.jitter_delay_meta_time_ref, 15)), 5, 30)
	local var_425_5 = arg_425_1.jitter_delay_meta_safe_ref ~= nil and arg_425_1.jitter_delay_meta_safe_ref:get() == true
	local var_425_6 = arg_425_3 ~= true and globals.choked_commands == 0

	if var_425_3 > 0 then
		var_425_3 = slot_0_109_4(var_425_3, 5, 200)
	end

	if var_425_6 == true then
		if var_425_3 > 0 then
			if arg_425_0.meta_delay_active == true then
				arg_425_0.meta_delay_ticks = (arg_425_0.meta_delay_ticks or 0) + 1

				if var_425_4 >= arg_425_0.meta_delay_ticks then
					return var_425_5 == true and 1 or slot_0_109_4(arg_425_0.meta_last_delay or 1, 1, 16)
				end

				arg_425_0.meta_delay_active = false
				arg_425_0.meta_delay_ticks = 0
				arg_425_0.meta_cycle_ticks = 0
			else
				arg_425_0.meta_cycle_ticks = (arg_425_0.meta_cycle_ticks or 0) + 1

				if var_425_3 <= arg_425_0.meta_cycle_ticks then
					arg_425_0.meta_delay_active = true
					arg_425_0.meta_delay_ticks = 0

					return var_425_5 == true and 1 or slot_0_109_4(arg_425_0.meta_last_delay or 1, 1, 16)
				end
			end
		else
			arg_425_0.meta_delay_active = false
			arg_425_0.meta_delay_ticks = 0
			arg_425_0.meta_cycle_ticks = 0
		end
	end

	local var_425_7 = math.floor(tonumber(arg_425_2) or 0)

	if arg_425_0.meta_last_switch_count ~= var_425_7 then
		arg_425_0.meta_last_switch_count = var_425_7
		arg_425_0.meta_way_index = (arg_425_0.meta_way_index or 0) + 1

		if arg_425_0.meta_way_index > #var_425_1 then
			arg_425_0.meta_way_index = 1
		end
	end

	local var_425_8 = arg_425_0.meta_way_index

	if type(var_425_8) ~= "number" or var_425_8 < 1 or var_425_8 > #var_425_1 then
		var_425_8 = 1
		arg_425_0.meta_way_index = var_425_8
	end

	local var_425_9 = slot_0_109_4(math.floor(var_425_2 * (var_425_1[var_425_8] or 1) + 0.5), 1, 16)

	arg_425_0.meta_last_delay = var_425_9

	return var_425_9
end

function slot_0_118_4(arg_426_0)
	if type(arg_426_0) ~= "table" then
		return 1
	end

	local var_426_0

	if arg_426_0.jitter_mode_ref ~= nil then
		var_426_0 = arg_426_0.jitter_mode_ref:get()
	end

	if slot_0_28_4(var_426_0) == true then
		return 1
	end

	local var_426_1 = "Solo"

	if arg_426_0.jitter_delay_mode_ref ~= nil then
		local var_426_2 = arg_426_0.jitter_delay_mode_ref:get()

		if var_426_2 ~= nil then
			var_426_1 = var_426_2
		end
	end

	local var_426_3 = 2

	if arg_426_0.jitter_delay_sliders_ref ~= nil then
		local var_426_4 = arg_426_0.jitter_delay_sliders_ref:get()

		if type(var_426_4) == "number" then
			var_426_3 = var_426_4
		end
	end

	return slot_0_93_4(var_426_1, var_426_3)
end

function slot_0_119_4(arg_427_0, arg_427_1, arg_427_2, arg_427_3, arg_427_4)
	local var_427_0 = slot_0_109_4(math.floor(arg_427_2 or 1), 1, 16)

	if type(arg_427_0) ~= "table" then
		return var_427_0
	end

	local var_427_1

	if arg_427_0.jitter_mode_ref ~= nil then
		var_427_1 = arg_427_0.jitter_mode_ref:get()
	end

	if slot_0_28_4(var_427_1) == true then
		return slot_0_57_16.get_delay(arg_427_3, arg_427_0, arg_427_1, arg_427_4)
	end

	local var_427_2

	if arg_427_0.jitter_delay_mode_ref ~= nil then
		local var_427_3 = arg_427_0.jitter_delay_mode_ref:get()
	end

	local var_427_4 = arg_427_0.jitter_delay_slot_refs

	if type(var_427_4) ~= "table" then
		return var_427_0
	end

	local var_427_5 = slot_0_118_4(arg_427_0)
	local var_427_6 = math.floor(tonumber(arg_427_1) or 0)

	if var_427_6 < 0 then
		var_427_6 = 0
	end

	local var_427_7 = var_427_4[var_427_6 % math.max(1, var_427_5) + 1] or var_427_4[1]

	if var_427_7 == nil then
		return var_427_0
	end

	local var_427_8 = var_427_7:get()

	if type(var_427_8) ~= "number" then
		return var_427_0
	end

	return slot_0_109_4(math.floor(var_427_8), 1, 16)
end

function slot_0_120_4()
	slot_0_52_17.hidden_static_active = false
	slot_0_52_17.hidden_static_side = nil
	slot_0_52_17.hidden_static_source = nil
	slot_0_52_17.last_team_index = nil
	slot_0_52_17.last_condition_index = nil
	slot_0_52_17.last_defensive_view = false

	if rage ~= nil and rage.antiaim ~= nil and rage.antiaim.inverter ~= nil then
		slot_0_52_17.last_side = rage.antiaim:inverter() == true

		return
	end

	slot_0_52_17.last_side = nil
end

function slot_0_121_4(arg_429_0, arg_429_1, arg_429_2, arg_429_3)
	if arg_429_0 == nil then
		return
	end

	local var_429_0 = slot_0_110_4(arg_429_1, arg_429_2)

	if (slot_0_52_17.last_team_index ~= arg_429_1 or slot_0_52_17.last_condition_index ~= var_429_0 or slot_0_52_17.last_defensive_view ~= arg_429_3) ~= true then
		return
	end

	local var_429_1 = slot_0_22_2.jitter

	if arg_429_0.jitter_mode_ref ~= nil then
		var_429_1 = arg_429_0.jitter_mode_ref:get()
	end

	if var_429_1 == slot_0_22_2.static or var_429_1 == "Static" then
		return
	end

	local var_429_2 = slot_0_52_17.last_side

	if type(var_429_2) ~= "boolean" then
		var_429_2 = rage.antiaim:inverter() == true
	end

	local var_429_3 = 1

	if arg_429_0.jitter_delay_ref ~= nil then
		local var_429_4 = arg_429_0.jitter_delay_ref:get()

		if type(var_429_4) == "number" then
			var_429_3 = var_429_4
		end
	end

	local var_429_5 = 0

	if arg_429_0.jitter_delay_variability_ref ~= nil then
		local var_429_6 = arg_429_0.jitter_delay_variability_ref:get()

		if type(var_429_6) == "number" then
			var_429_5 = var_429_6
		end
	end

	local var_429_7 = slot_0_111_4(arg_429_1, arg_429_2)

	var_429_7.side = var_429_2
	var_429_7.switch_count = 0

	local var_429_8 = slot_0_119_4(arg_429_0, var_429_7.switch_count, var_429_3, var_429_7, false)
	local var_429_9 = slot_0_117_4(var_429_8, var_429_5)

	var_429_7.next_switch_packet = slot_0_50_13.sent_packets + var_429_9
end

function slot_0_122_4()
	local var_430_0 = slot_0_11_0.aa and slot_0_11_0.aa.angles

	if var_430_0 == nil then
		return
	end

	if var_430_0.body_yaw ~= nil then
		var_430_0.body_yaw:override()
	end

	if var_430_0.left_limit ~= nil then
		var_430_0.left_limit:override()
	end

	if var_430_0.right_limit ~= nil then
		var_430_0.right_limit:override()
	end
end

function slot_0_123_4()
	local var_431_0 = slot_0_11_0.rage and slot_0_11_0.rage.main

	if var_431_0 == nil then
		return
	end

	if var_431_0.double_tap_lag_options ~= nil then
		var_431_0.double_tap_lag_options:override()
	end

	if var_431_0.hide_shots_options ~= nil then
		var_431_0.hide_shots_options:override()
	end
end

function slot_0_124_4(arg_432_0, arg_432_1, arg_432_2, arg_432_3)
	if arg_432_0 == nil then
		return rage.antiaim:inverter() == true, nil
	end

	local var_432_0 = slot_0_22_2.jitter

	if arg_432_0.jitter_mode_ref ~= nil then
		var_432_0 = arg_432_0.jitter_mode_ref:get()
	end

	if var_432_0 == slot_0_22_2.static or var_432_0 == "Static" then
		if arg_432_0.static_inverter_ref ~= nil then
			return arg_432_0.static_inverter_ref:get() == true, nil
		end

		return rage.antiaim:inverter() == true, nil
	end

	local var_432_1 = 1

	if arg_432_0.jitter_delay_ref ~= nil then
		local var_432_2 = arg_432_0.jitter_delay_ref:get()

		if type(var_432_2) == "number" then
			var_432_1 = var_432_2
		end
	end

	local var_432_3 = 0

	if arg_432_0.jitter_delay_variability_ref ~= nil then
		local var_432_4 = arg_432_0.jitter_delay_variability_ref:get()

		if type(var_432_4) == "number" then
			var_432_3 = var_432_4
		end
	end

	local var_432_5 = slot_0_111_4(arg_432_1, arg_432_2)

	if arg_432_3 == true or globals.choked_commands ~= 0 then
		return var_432_5.side == true, nil
	end

	if slot_0_50_13.sent_packets >= var_432_5.next_switch_packet then
		var_432_5.side = not var_432_5.side
		var_432_5.switch_count = var_432_5.switch_count + 1

		local var_432_6 = slot_0_119_4(arg_432_0, var_432_5.switch_count, var_432_1, var_432_5, arg_432_3)
		local var_432_7 = slot_0_117_4(var_432_6, var_432_3)

		var_432_5.next_switch_packet = slot_0_50_13.sent_packets + var_432_7
	end

	return var_432_5.side == true, nil
end

function slot_0_125_4(arg_433_0)
	return slot_0_21_2.ct
end

function slot_0_126_4(arg_434_0)
	if type(arg_434_0) ~= "number" then
		return false
	end

	if bit ~= nil and bit.band ~= nil then
		return bit.band(arg_434_0, slot_0_29_6.on_ground_flag) == slot_0_29_6.on_ground_flag
	end

	return arg_434_0 % 2 == 1
end

function slot_0_127_4()
	local var_435_0 = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.slow_walk

	if var_435_0 == nil then
		return false
	end

	return var_435_0:get() == true
end

function slot_0_128_4(arg_436_0)
	if arg_436_0 == nil then
		return false
	end

	local var_436_0 = arg_436_0:get_player_weapon()

	if var_436_0 == nil then
		return false
	end

	local var_436_1 = var_436_0:get_weapon_info()

	if var_436_1 == nil then
		return false
	end

	local var_436_2 = var_436_1.console_name

	if type(var_436_2) ~= "string" then
		return false
	end

	if slot_0_32_11[var_436_2] ~= true then
		return false
	end

	local var_436_3 = var_436_0.m_fThrowTime

	if type(var_436_3) ~= "number" then
		return false
	end

	return var_436_3 > 0
end

function slot_0_129_3(arg_437_0, arg_437_1)
	if arg_437_0 == nil then
		return slot_0_20_2.standing
	end

	local var_437_0 = arg_437_0.m_vecVelocity
	local var_437_1 = 0

	if var_437_0 ~= nil and var_437_0.length2d ~= nil then
		var_437_1 = var_437_0:length2d()
	end

	local var_437_2 = false
	local var_437_3 = false
	local var_437_4 = false

	if arg_437_1 ~= nil then
		local var_437_5 = arg_437_1.in_jump

		if var_437_5 == true then
			var_437_2 = true
		elseif type(var_437_5) == "number" and var_437_5 ~= 0 then
			var_437_2 = true
		end

		local var_437_6 = arg_437_1.in_duck

		if var_437_6 == true then
			var_437_3 = true
		elseif type(var_437_6) == "number" and var_437_6 ~= 0 then
			var_437_3 = true
		end

		local var_437_7 = arg_437_1.forwardmove

		if type(var_437_7) == "number" and math.abs(var_437_7) > 5 then
			var_437_4 = true
		end

		local var_437_8 = arg_437_1.sidemove

		if type(var_437_8) == "number" and math.abs(var_437_8) > 5 then
			var_437_4 = true
		end

		if var_437_4 ~= true then
			local var_437_9 = arg_437_1.in_forward
			local var_437_10 = arg_437_1.in_back
			local var_437_11 = arg_437_1.in_moveleft
			local var_437_12 = arg_437_1.in_moveright

			var_437_4 = var_437_9 == true or var_437_10 == true or var_437_11 == true or var_437_12 == true or type(var_437_9) == "number" and var_437_9 ~= 0 or type(var_437_10) == "number" and var_437_10 ~= 0 or type(var_437_11) == "number" and var_437_11 ~= 0 or type(var_437_12) == "number" and var_437_12 ~= 0
		end
	end

	local var_437_13 = slot_0_50_13.base_condition_index
	local var_437_14 = var_437_13 == slot_0_20_2.crouching or var_437_13 == slot_0_20_2.crouch_running or var_437_13 == slot_0_20_2.air_crouching
	local var_437_15 = var_437_3 == true or slot_0_62_20(arg_437_0.m_flDuckAmount, var_437_14)
	local var_437_16 = var_437_1 > slot_0_29_6.moving_speed_threshold or var_437_4
	local var_437_17 = slot_0_126_4(arg_437_0.m_fFlags)

	if var_437_2 then
		var_437_17 = var_437_17 and false
	end

	if var_437_17 then
		if var_437_15 or var_437_3 then
			if var_437_16 then
				return slot_0_20_2.crouch_running
			end

			return slot_0_20_2.crouching
		end

		if slot_0_127_4() then
			return slot_0_20_2.slow_walking
		end

		if not var_437_16 then
			return slot_0_20_2.standing
		end

		return slot_0_20_2.running
	end

	if var_437_15 or var_437_3 then
		return slot_0_20_2.air_crouching
	end

	return slot_0_20_2.air
end

function slot_0_130_2(arg_438_0)
	local var_438_0 = entity.get_local_player()

	if var_438_0 == nil or not var_438_0:is_alive() then
		slot_0_50_13.team_index = slot_0_49_9.active_team_index
		slot_0_50_13.condition_index = slot_0_20_2.standing
		slot_0_50_13.base_condition_index = slot_0_20_2.standing
		slot_0_50_13.is_defensive_active = false
		slot_0_50_13.is_throwing_grenade = false

		return
	end

	slot_0_50_13.team_index = slot_0_125_4(var_438_0.m_iTeamNum)
	slot_0_50_13.base_condition_index = slot_0_129_3(var_438_0, arg_438_0)
	slot_0_50_13.is_throwing_grenade = slot_0_128_4(var_438_0)
	slot_0_50_13.condition_index = slot_0_50_13.base_condition_index
end

function slot_0_110_4(arg_439_0, arg_439_1)
	local var_439_0 = arg_439_1

	if arg_439_1 == slot_0_20_2.crouching or arg_439_1 == slot_0_20_2.crouch_running then
		var_439_0 = slot_0_20_2.crouching
	end

	local var_439_1 = slot_0_61_20.get_runtime_phase_index(arg_439_0, arg_439_1)

	if var_439_1 > 1 then
		return var_439_0 * 16 + var_439_1
	end

	return var_439_0
end

function slot_0_131_2(arg_440_0)
	local var_440_0 = math.sin(arg_440_0 * 12.9898 + 78.233) * 43758.5453

	return var_440_0 - math.floor(var_440_0)
end

function slot_0_132_2(arg_441_0, arg_441_1, arg_441_2, arg_441_3, arg_441_4, arg_441_5)
	if type(arg_441_2) ~= "number" or arg_441_2 <= 0 then
		return 0
	end

	local var_441_0 = math.max(0, math.min(100, arg_441_2)) * 0.01
	local var_441_1 = math.abs(arg_441_1 - arg_441_0)
	local var_441_2 = math.min(slot_0_29_6.max_yaw_variation, math.max(3, var_441_1 * 0.35))
	local var_441_3 = math.max(1, 8 - math.floor(var_441_0 * 7))
	local var_441_4 = math.floor(slot_0_50_13.sent_packets / var_441_3)
	local var_441_5 = arg_441_5 and 17 or 29
	local var_441_6 = var_441_4 * 97 + arg_441_3 * 31 + arg_441_4 * 13 + var_441_5
	local var_441_7 = slot_0_50_13.sent_packets * (0.04 + var_441_0 * 0.11) + arg_441_3 * 0.7 + arg_441_4 * 0.37 + (arg_441_5 and 0 or 1.9)
	local var_441_8 = math.sin(var_441_7)
	local var_441_9 = slot_0_131_2(var_441_6) * 2 - 1
	local var_441_10 = 0.2 + var_441_0 * 0.5

	return (var_441_8 * (1 - var_441_10) + var_441_9 * var_441_10) * var_441_2 * var_441_0
end

function slot_0_133_2(arg_442_0)
	if arg_442_0 ~= nil then
		local var_442_0 = arg_442_0.tick_count

		if type(var_442_0) == "number" then
			return var_442_0
		end
	end

	if type(globals.tickcount) == "number" then
		return globals.tickcount
	end

	return slot_0_50_13.sent_packets
end

function slot_0_134_2(arg_443_0, arg_443_1, arg_443_2, arg_443_3, arg_443_4, arg_443_5)
	local var_443_0 = slot_0_109_4(arg_443_0 or 0, -180, 180)

	if type(arg_443_1) ~= "number" or arg_443_1 <= 0 then
		return var_443_0
	end

	local var_443_1 = slot_0_109_4(arg_443_1, 0, 100) * 0.01
	local var_443_2 = math.abs(var_443_0)

	if var_443_2 <= 0 then
		return var_443_0
	end

	local var_443_3 = math.max(1, 7 - math.floor(var_443_1 * 6))
	local var_443_4 = math.floor(arg_443_5 / var_443_3) * 101 + arg_443_2 * 37 + arg_443_3 * 19 + arg_443_4 * 13
	local var_443_5 = math.sin(arg_443_5 * (0.05 + var_443_1 * 0.16) + arg_443_2 * 0.71 + arg_443_3 * 0.43 + arg_443_4 * 1.29)
	local var_443_6 = slot_0_131_2(var_443_4) * 2 - 1
	local var_443_7 = var_443_0 + (var_443_5 * (0.7 - var_443_1 * 0.2) + var_443_6 * (0.3 + var_443_1 * 0.2)) * (var_443_2 * var_443_1)

	return slot_0_109_4(var_443_7, -180, 180)
end

function slot_0_135_2(arg_444_0, arg_444_1, arg_444_2)
	local var_444_0 = slot_0_109_4(arg_444_1 or 0, -180, 180)

	if type(arg_444_0.three_way_state) ~= "number" then
		arg_444_0.three_way_state = 2
	end

	if arg_444_2 == true then
		arg_444_0.three_way_state = arg_444_0.three_way_state + 1

		if arg_444_0.three_way_state > 3 then
			arg_444_0.three_way_state = 1
		end
	end

	local var_444_1 = arg_444_0.three_way_state

	if var_444_1 == 1 then
		return -var_444_0
	end

	if var_444_1 == 2 then
		return 0
	end

	return var_444_0
end

function slot_0_136_2(arg_445_0, arg_445_1, arg_445_2, arg_445_3)
	local var_445_0 = slot_0_109_4(math.floor(arg_445_3 or 0), 0, 20)
	local var_445_1 = slot_0_109_4(math.floor(arg_445_2 or 1), 1, 10)

	if var_445_1 <= 1 or type(arg_445_0) ~= "table" then
		return var_445_0
	end

	local var_445_2 = arg_445_0[(slot_0_109_4(math.floor(arg_445_1 or 1), 1, 10) - 1) % var_445_1 + 1]

	if var_445_2 == nil then
		var_445_2 = arg_445_0[1]
	end

	if var_445_2 == nil then
		return var_445_0
	end

	local var_445_3 = var_445_2:get()

	if type(var_445_3) ~= "number" then
		return var_445_0
	end

	return slot_0_109_4(math.floor(var_445_3), 0, 20)
end

function get_yaw_modifier_slot_value(arg_446_0, arg_446_1)
	if type(arg_446_0) ~= "table" then
		return 0
	end

	local var_446_0 = arg_446_0[arg_446_1]

	if var_446_0 == nil then
		var_446_0 = arg_446_0[1]
	end

	if var_446_0 == nil then
		return 0
	end

	local var_446_1 = var_446_0:get()

	if type(var_446_1) ~= "number" then
		return 0
	end

	return slot_0_109_4(var_446_1, -180, 180)
end

function slot_0_137_2(arg_447_0)
	arg_447_0.yaw_modifier_cycle_index = 1
	arg_447_0.yaw_modifier_cycle_packets = 0
	arg_447_0.yaw_modifier_cycle_last_flip = 0
end

function get_yaw_modifier_cycle_index(arg_448_0, arg_448_1, arg_448_2, arg_448_3, arg_448_4, arg_448_5, arg_448_6, arg_448_7)
	local var_448_0 = slot_0_109_4(math.floor(arg_448_1 or 1), 1, 10)

	if type(arg_448_0.yaw_modifier_cycle_index) ~= "number" then
		slot_0_137_2(arg_448_0)
	end

	if arg_448_4 == true or var_448_0 <= 1 then
		slot_0_137_2(arg_448_0)

		return 1
	end

	local var_448_1 = slot_0_136_2(arg_448_5, arg_448_0.yaw_modifier_cycle_index or 1, arg_448_6, arg_448_2)

	if var_448_1 <= 0 then
		slot_0_137_2(arg_448_0)

		return 1
	end

	if arg_448_7 == true or globals.choked_commands ~= 0 then
		return slot_0_109_4(math.floor(arg_448_0.yaw_modifier_cycle_index or 1), 1, var_448_0)
	end

	arg_448_0.yaw_modifier_cycle_packets = arg_448_0.yaw_modifier_cycle_packets + 1

	local var_448_2 = var_448_1

	if (arg_448_3 or 0) > 0 then
		var_448_2 = slot_0_114_4(var_448_1, arg_448_3)
	end

	if var_448_2 <= arg_448_0.yaw_modifier_cycle_packets - arg_448_0.yaw_modifier_cycle_last_flip then
		arg_448_0.yaw_modifier_cycle_index = arg_448_0.yaw_modifier_cycle_index + 1

		if var_448_0 < arg_448_0.yaw_modifier_cycle_index then
			arg_448_0.yaw_modifier_cycle_index = 1
		end

		arg_448_0.yaw_modifier_cycle_last_flip = arg_448_0.yaw_modifier_cycle_packets
	end

	return slot_0_109_4(math.floor(arg_448_0.yaw_modifier_cycle_index or 1), 1, var_448_0)
end

function slot_0_138_2(arg_449_0, arg_449_1)
	local var_449_0 = slot_0_55_16.hidden_yaw_modifier_runtime[arg_449_0]

	if type(var_449_0) ~= "table" then
		var_449_0 = {}
		slot_0_55_16.hidden_yaw_modifier_runtime[arg_449_0] = var_449_0
	end

	local var_449_1 = slot_0_110_4(arg_449_0, arg_449_1)
	local var_449_2 = var_449_0[var_449_1]

	if type(var_449_2) ~= "table" then
		var_449_2 = {
			last_add = 0,
			three_way_state = 2,
			bobro_step = 1
		}
		var_449_0[var_449_1] = var_449_2
	end

	return var_449_2
end

function slot_0_139_2()
	local var_450_0 = slot_0_80_9()

	if rage ~= nil and rage.antiaim ~= nil then
		if rage.antiaim.override_hidden_yaw_offset ~= nil then
			rage.antiaim:override_hidden_yaw_offset(0)
		end

		if rage.antiaim.override_hidden_pitch ~= nil then
			rage.antiaim:override_hidden_pitch(var_450_0 == true and 89 or 0)
		end
	end
end

function slot_0_140_2(arg_451_0)
	arg_451_0.mode = nil
	arg_451_0.three_way_state = 2
	arg_451_0.random_add = nil
	arg_451_0.bobro_step = 1
	arg_451_0.meta_way_index = 0
	arg_451_0.meta_cycle_ticks = 0
	arg_451_0.meta_delay_ticks = 0
	arg_451_0.meta_delay_active = false
	arg_451_0.last_add = 0
end

function slot_0_56_14.is_meta_value(arg_452_0)
	if arg_452_0 == "Meta" then
		return true
	end

	if type(arg_452_0) ~= "number" then
		return false
	end

	return math.floor(arg_452_0) == #slot_0_56_14.mode_combo_items
end

function slot_0_56_14.normalize_mode(arg_453_0)
	if arg_453_0 == "3-Way" or arg_453_0 == 2 then
		return "3-Way"
	end

	if arg_453_0 == "5-Way" or arg_453_0 == 3 then
		return "5-Way"
	end

	return "2-Way"
end

function slot_0_56_14.get_ref_number(arg_454_0, arg_454_1)
	if arg_454_0 == nil or arg_454_0.get == nil then
		return arg_454_1
	end

	local var_454_0 = arg_454_0:get()

	if type(var_454_0) ~= "number" then
		return arg_454_1
	end

	return var_454_0
end

function slot_0_56_14.get_add(arg_455_0, arg_455_1, arg_455_2, arg_455_3, arg_455_4, arg_455_5, arg_455_6)
	local var_455_0 = slot_0_56_14.normalize_mode(arg_455_1.hidden_yaw_modifier_meta_mode_ref ~= nil and arg_455_1.hidden_yaw_modifier_meta_mode_ref:get() or nil)
	local var_455_1 = slot_0_56_14.scales[var_455_0] or slot_0_56_14.scales["2-Way"]
	local var_455_2 = slot_0_56_14.get_ref_number(arg_455_1.hidden_yaw_modifier_meta_offset_ref, 0)
	local var_455_3 = slot_0_56_14.get_ref_number(arg_455_1.hidden_yaw_modifier_meta_delay_cycle_ref, 0)
	local var_455_4 = slot_0_56_14.get_ref_number(arg_455_1.hidden_yaw_modifier_meta_delay_time_ref, 15)
	local var_455_5 = arg_455_1.hidden_yaw_modifier_meta_safe_yaw_ref ~= nil and arg_455_1.hidden_yaw_modifier_meta_safe_yaw_ref:get() == true
	local var_455_6 = arg_455_5 ~= true and globals.choked_commands == 0
	local var_455_7 = math.floor(var_455_3 or 0)

	if var_455_7 > 0 then
		var_455_7 = slot_0_109_4(var_455_7, 5, 200)
	end

	local var_455_8 = slot_0_109_4(math.floor(var_455_4 or 15), 5, 30)

	if var_455_6 == true then
		if var_455_7 > 0 then
			if arg_455_0.meta_delay_active == true then
				arg_455_0.meta_delay_ticks = (arg_455_0.meta_delay_ticks or 0) + 1

				if var_455_8 >= arg_455_0.meta_delay_ticks then
					local var_455_9 = var_455_5 == true and 0 or arg_455_0.last_add or 0

					arg_455_0.last_add = slot_0_109_4(var_455_9, -180, 180)

					return arg_455_0.last_add
				end

				arg_455_0.meta_delay_active = false
				arg_455_0.meta_delay_ticks = 0
				arg_455_0.meta_cycle_ticks = 0
			else
				arg_455_0.meta_cycle_ticks = (arg_455_0.meta_cycle_ticks or 0) + 1

				if var_455_7 <= arg_455_0.meta_cycle_ticks then
					arg_455_0.meta_delay_active = true
					arg_455_0.meta_delay_ticks = 0

					local var_455_10 = var_455_5 == true and 0 or arg_455_0.last_add or 0

					arg_455_0.last_add = slot_0_109_4(var_455_10, -180, 180)

					return arg_455_0.last_add
				end
			end
		else
			arg_455_0.meta_delay_active = false
			arg_455_0.meta_delay_ticks = 0
			arg_455_0.meta_cycle_ticks = 0
		end

		arg_455_0.meta_way_index = (arg_455_0.meta_way_index or 0) + 1

		if arg_455_0.meta_way_index > #var_455_1 then
			arg_455_0.meta_way_index = 1
		end
	end

	local var_455_11 = arg_455_0.meta_way_index

	if type(var_455_11) ~= "number" or var_455_11 < 1 or var_455_11 > #var_455_1 then
		var_455_11 = 1
		arg_455_0.meta_way_index = var_455_11
	end

	local var_455_12 = 91 + #var_455_1 * 11
	local var_455_13 = slot_0_134_2(var_455_2, arg_455_6, arg_455_2, arg_455_3, var_455_12, arg_455_4)
	local var_455_14 = slot_0_109_4(var_455_13 * (var_455_1[var_455_11] or 0), -180, 180)

	arg_455_0.last_add = var_455_14

	return var_455_14
end

function slot_0_141_2(arg_456_0, arg_456_1, arg_456_2)
	local var_456_0 = slot_0_109_4(arg_456_1 or 0, -180, 180)
	local var_456_1 = arg_456_0.bobro_step

	if type(var_456_1) ~= "number" then
		var_456_1 = 1
	end

	if arg_456_2 == true then
		var_456_1 = var_456_1 + 1

		if var_456_1 > 5 then
			var_456_1 = 1
		end
	end

	arg_456_0.bobro_step = var_456_1

	local var_456_2 = {
		-1,
		-0.5,
		0,
		0.5,
		1
	}

	return slot_0_109_4(var_456_0 * (var_456_2[var_456_1] or 0), -180, 180)
end

function slot_0_142_2(arg_457_0, arg_457_1, arg_457_2, arg_457_3, arg_457_4, arg_457_5)
	slot_457_6_0 = slot_0_138_2(arg_457_2, arg_457_3)

	if (arg_457_0 ~= nil and arg_457_0.hidden_yaw_modifier_switch_ref ~= nil and arg_457_0.hidden_yaw_modifier_switch_ref:get() == true) ~= true then
		slot_0_140_2(slot_457_6_0)

		return 0
	end

	slot_457_8_0 = slot_0_97_4()
	slot_457_9_0 = false
	slot_457_10_0 = "Solo"
	slot_457_11_0 = 2
	slot_457_12_0 = 0
	slot_457_13_0 = 0

	if arg_457_0.hidden_yaw_modifier_mode_ref ~= nil then
		slot_457_14_5 = arg_457_0.hidden_yaw_modifier_mode_ref:get()

		if type(slot_457_14_5) == "number" or type(slot_457_14_5) == "string" then
			if slot_0_56_14.is_meta_value(slot_457_14_5) == true then
				slot_457_8_0 = "Meta"
				slot_457_9_0 = true
			else
				slot_457_8_0 = slot_0_99_4(slot_457_14_5)
			end
		end
	end

	if arg_457_0.hidden_yaw_modifier_values_mode_ref ~= nil then
		slot_457_14_4 = arg_457_0.hidden_yaw_modifier_values_mode_ref:get()

		if type(slot_457_14_4) == "number" or type(slot_457_14_4) == "string" then
			slot_457_10_0 = slot_457_14_4
		end
	end

	if arg_457_0.hidden_yaw_modifier_sliders_ref ~= nil then
		slot_457_14_3 = arg_457_0.hidden_yaw_modifier_sliders_ref:get()

		if type(slot_457_14_3) == "number" then
			slot_457_11_0 = slot_457_14_3
		end
	end

	if arg_457_0.hidden_yaw_modifier_value_ref ~= nil then
		slot_457_14_2 = arg_457_0.hidden_yaw_modifier_value_ref:get()

		if type(slot_457_14_2) == "number" then
			slot_457_12_0 = slot_457_14_2
		end
	end

	if arg_457_0.hidden_yaw_modifier_variability_ref ~= nil then
		slot_457_14_1 = arg_457_0.hidden_yaw_modifier_variability_ref:get()

		if type(slot_457_14_1) == "number" then
			slot_457_13_0 = slot_457_14_1
		end
	end

	slot_457_14_0 = slot_0_93_4(slot_457_10_0, slot_457_11_0)
	slot_457_15_0 = nil

	if slot_457_9_0 == true then
		slot_457_15_0 = "Meta" .. "|" .. tostring(arg_457_0.hidden_yaw_modifier_meta_mode_ref ~= nil and arg_457_0.hidden_yaw_modifier_meta_mode_ref:get() or "2-Way") .. "|" .. tostring(slot_0_56_14.get_ref_number(arg_457_0.hidden_yaw_modifier_meta_offset_ref, 0)) .. "|" .. tostring(slot_0_56_14.get_ref_number(arg_457_0.hidden_yaw_modifier_meta_delay_cycle_ref, 0)) .. "|" .. tostring(slot_0_56_14.get_ref_number(arg_457_0.hidden_yaw_modifier_meta_delay_time_ref, 15)) .. "|" .. tostring(arg_457_0.hidden_yaw_modifier_meta_safe_yaw_ref ~= nil and arg_457_0.hidden_yaw_modifier_meta_safe_yaw_ref:get() == true)
	else
		slot_457_15_0 = tostring(slot_457_8_0) .. "|" .. tostring(slot_457_10_0) .. "|" .. tostring(slot_457_14_0)
	end

	if slot_457_6_0.mode ~= slot_457_15_0 then
		slot_0_140_2(slot_457_6_0)

		slot_457_6_0.mode = slot_457_15_0
	end

	if arg_457_5 == true and type(slot_457_6_0.last_add) == "number" then
		return slot_0_109_4(slot_457_6_0.last_add, -180, 180)
	end

	if slot_457_9_0 == true then
		return slot_0_56_14.get_add(slot_457_6_0, arg_457_0, arg_457_2, arg_457_3, arg_457_4, arg_457_5, slot_457_13_0)
	end

	slot_457_16_0 = slot_457_12_0

	if slot_457_14_0 > 1 then
		slot_457_17_1 = get_yaw_modifier_cycle_index(slot_457_6_0, slot_457_14_0, 1, 0, false, nil, 1, arg_457_5)
		slot_457_16_0 = get_yaw_modifier_slot_value(arg_457_0.hidden_yaw_modifier_slot_refs, slot_457_17_1)
	end

	slot_457_17_0 = slot_0_99_4(slot_457_8_0)
	slot_457_18_0 = slot_0_100_4(slot_457_17_0)
	slot_457_19_0 = slot_0_134_2(slot_457_16_0, slot_457_13_0, arg_457_2, arg_457_3, slot_457_18_0 + 17, arg_457_4)
	slot_457_20_0 = arg_457_5 ~= true and globals.choked_commands == 0
	slot_457_21_1 = 0

	if slot_457_17_0 == "Center" then
		slot_457_21_1 = (arg_457_1 and -1 or 1) * slot_0_109_4(slot_457_19_0, -180, 180)
	elseif slot_457_17_0 == "Offset" then
		slot_457_21_1 = slot_0_109_4(slot_457_19_0, -180, 180)
	elseif slot_457_17_0 == "3-Way" then
		slot_457_21_1 = slot_0_135_2(slot_457_6_0, slot_457_19_0, slot_457_20_0)
	elseif slot_457_17_0 == "5-Way" then
		slot_457_21_1 = slot_0_141_2(slot_457_6_0, slot_457_19_0, slot_457_20_0)
	elseif slot_457_17_0 == "Random" then
		if slot_457_20_0 == true or type(slot_457_6_0.random_add) ~= "number" then
			slot_457_22_1 = math.abs(slot_0_109_4(slot_457_19_0, -180, 180))
			slot_457_6_0.random_add = utils.random_float(-slot_457_22_1, slot_457_22_1)
		end

		slot_457_21_1 = slot_457_6_0.random_add or 0
	elseif slot_457_17_0 == "Spin" then
		slot_457_22_0 = arg_457_4 + arg_457_2 * 31 + arg_457_3 * 17
		slot_457_21_1 = math.sin(slot_457_22_0 * 0.05) * math.abs(slot_0_109_4(slot_457_19_0, -180, 180))
	end

	slot_457_21_0 = slot_0_109_4(slot_457_21_1, -180, 180)
	slot_457_6_0.last_add = slot_457_21_0

	return slot_457_21_0
end

function slot_0_143_1(arg_458_0, arg_458_1, arg_458_2, arg_458_3, arg_458_4, arg_458_5, arg_458_6, arg_458_7)
	local var_458_0 = slot_0_11_0.aa and slot_0_11_0.aa.angles
	local var_458_1 = arg_458_0 ~= nil and arg_458_0.hidden_yaw_switch_ref ~= nil and arg_458_0.hidden_yaw_switch_ref:get() == true
	local var_458_2 = arg_458_0 ~= nil and arg_458_0.hidden_yaw_modifier_switch_ref ~= nil and arg_458_0.hidden_yaw_modifier_switch_ref:get() == true
	local var_458_3 = slot_0_69_20(arg_458_0)
	local var_458_4 = var_458_1 == true or var_458_2 == true or var_458_3 == true

	if arg_458_0 == nil or var_458_4 ~= true or var_458_0 == nil or var_458_0.hidden == nil or rage == nil or rage.antiaim == nil or rage.antiaim.override_hidden_pitch == nil or rage.antiaim.override_hidden_yaw_offset == nil then
		slot_0_139_2()

		return
	end

	local var_458_5 = 89
	local var_458_6 = "Static"

	if var_458_1 == true and arg_458_0.hidden_yaw_mode_ref ~= nil then
		local var_458_7 = arg_458_0.hidden_yaw_mode_ref:get()

		if type(var_458_7) == "string" and var_458_7 ~= "" then
			var_458_6 = var_458_7
		elseif var_458_7 == 2 then
			var_458_6 = "Side"
		elseif var_458_7 == 3 then
			var_458_6 = "Side Reworked"
		end
	end

	local var_458_8 = arg_458_1 == true
	local var_458_9 = 0
	local var_458_10 = var_458_3 == true and var_458_1 ~= true and arg_458_6 ~= true and type(arg_458_7) == "number"
	local var_458_11 = var_458_3 == true and arg_458_6 ~= true and var_458_10 ~= true

	if var_458_10 == true then
		var_458_9 = arg_458_7
	elseif var_458_11 ~= true then
		var_458_11 = var_458_1 == true and (var_458_6 == "Side" or var_458_6 == "Side Reworked")
	end

	if var_458_11 == true then
		local var_458_12 = 0
		local var_458_13 = 0

		if arg_458_0.hidden_left_yaw_ref ~= nil then
			local var_458_14 = arg_458_0.hidden_left_yaw_ref:get()

			if type(var_458_14) == "number" then
				var_458_12 = var_458_14
			end
		end

		if arg_458_0.hidden_right_yaw_ref ~= nil then
			local var_458_15 = arg_458_0.hidden_right_yaw_ref:get()

			if type(var_458_15) == "number" then
				var_458_13 = var_458_15
			end
		end

		local var_458_16 = slot_0_109_4(var_458_12, -180, 180)
		local var_458_17 = slot_0_109_4(var_458_13, -180, 180)

		var_458_9 = var_458_8 and var_458_16 or var_458_17

		if var_458_1 == true and var_458_6 == "Side Reworked" and arg_458_6 ~= true then
			var_458_9 = var_458_9 + slot_0_132_2(var_458_16, var_458_17, 13, arg_458_2, arg_458_3, var_458_8)
		end
	elseif var_458_1 == true and arg_458_0.hidden_yaw_static_ref ~= nil then
		local var_458_18 = arg_458_0.hidden_yaw_static_ref:get()

		if type(var_458_18) == "number" then
			var_458_9 = slot_0_109_4(var_458_18, -180, 180)
		end
	end

	if var_458_2 == true and arg_458_6 ~= true then
		var_458_9 = var_458_9 + slot_0_142_2(arg_458_0, var_458_8, arg_458_2, arg_458_3, arg_458_4, arg_458_5)
	end

	local var_458_19 = slot_0_109_4(var_458_9, -180, 180)

	if var_458_19 ~= 180 and var_458_19 ~= -180 then
		var_458_19 = math.normalize_yaw(var_458_19)
	end

	rage.antiaim:override_hidden_yaw_offset(var_458_19)
	rage.antiaim:override_hidden_pitch(slot_0_109_4(var_458_5, -89, 89))
end

function slot_0_144_1()
	if rage == nil or rage.antiaim == nil or rage.antiaim.get_max_desync == nil then
		return nil
	end

	local var_459_0 = rage.antiaim:get_max_desync()

	if type(var_459_0) ~= "number" then
		return nil
	end

	return slot_0_109_4(var_459_0, 0, 60)
end

function slot_0_145_1(arg_460_0, arg_460_1)
	local var_460_0 = slot_0_109_4(arg_460_0 or 0, 0, 60)

	if type(arg_460_1) ~= "number" then
		return var_460_0
	end

	if arg_460_1 <= var_460_0 then
		return arg_460_1
	end

	return var_460_0
end

function slot_0_146_1(arg_461_0, arg_461_1)
	local var_461_0 = slot_0_109_4(arg_461_0 or 0, 0, 60)

	if type(arg_461_1) ~= "number" then
		return 60
	end

	if arg_461_1 <= var_461_0 then
		return arg_461_1
	end

	return 60
end

function slot_0_147_1(arg_462_0, arg_462_1, arg_462_2, arg_462_3, arg_462_4)
	if type(arg_462_1) ~= "number" or arg_462_1 <= 0 then
		return 0
	end

	local var_462_0 = math.max(0, math.min(100, arg_462_1)) * 0.01
	local var_462_1 = slot_0_109_4(arg_462_0 or 0, 0, 60)

	if var_462_1 <= 0 then
		return 0
	end

	local var_462_2 = 0.08 + var_462_0 * 0.16
	local var_462_3 = var_462_0^1.35
	local var_462_4 = math.min(1, var_462_2 + var_462_3 * 0.84)
	local var_462_5 = math.max(1, var_462_1 * var_462_4)
	local var_462_6 = math.min(var_462_1, var_462_5)
	local var_462_7 = math.max(1, 10 - math.floor(var_462_0 * 8))
	local var_462_8 = math.max(1, 4 - math.floor(var_462_0 * 3))
	local var_462_9 = math.floor(slot_0_50_13.sent_packets / var_462_7)
	local var_462_10 = math.floor(slot_0_50_13.sent_packets / var_462_8)
	local var_462_11 = math.sin(slot_0_50_13.sent_packets * (0.035 + var_462_0 * 0.12) + arg_462_2 * 0.61 + arg_462_3 * 0.37 + arg_462_4 * 1.33)
	local var_462_12 = math.sin(slot_0_50_13.sent_packets * (0.11 + var_462_0 * 0.19) + arg_462_2 * 0.23 + arg_462_3 * 0.53 + arg_462_4 * 2.07)
	local var_462_13 = var_462_11 * 0.65 + var_462_12 * 0.35
	local var_462_14 = var_462_9 * 97 + arg_462_2 * 31 + arg_462_3 * 17 + arg_462_4 * 13
	local var_462_15 = var_462_10 * 131 + arg_462_2 * 19 + arg_462_3 * 43 + arg_462_4 * 29
	local var_462_16 = slot_0_131_2(var_462_14) * 2 - 1
	local var_462_17 = slot_0_131_2(var_462_15) * 2 - 1
	local var_462_18 = var_462_16 * 0.55 + var_462_17 * 0.45
	local var_462_19 = 0.34 + var_462_0 * 0.48
	local var_462_20 = var_462_13 * (1 - var_462_19) + var_462_18 * var_462_19
	local var_462_21 = math.abs(var_462_20)
	local var_462_22 = 0.72 - var_462_0 * 0.22
	local var_462_23 = var_462_21^math.max(0.35, var_462_22)

	if var_462_20 < 0 then
		var_462_23 = -var_462_23
	end

	local var_462_24 = var_462_10 * 149 + arg_462_2 * 41 + arg_462_3 * 23 + arg_462_4 * 59
	local var_462_25 = slot_0_131_2(var_462_24)
	local var_462_26 = 0.985 - var_462_0 * 0.26
	local var_462_27 = 1

	if var_462_26 < var_462_25 then
		var_462_27 = 1.15 + var_462_0 * 0.75
	end

	return var_462_23 * var_462_6 * var_462_27
end

function slot_0_148_1(arg_463_0, arg_463_1)
	if arg_463_0 == nil or type(arg_463_1) ~= "string" then
		return false
	end

	local var_463_0, var_463_1 = pcall(arg_463_0.get, arg_463_0, arg_463_1)

	if var_463_0 and type(var_463_1) == "boolean" then
		return var_463_1
	end

	local var_463_2, var_463_3 = pcall(arg_463_0.get, arg_463_0)

	if not var_463_2 or type(var_463_3) ~= "table" then
		return false
	end

	for iter_463_0 = 1, #var_463_3 do
		if var_463_3[iter_463_0] == arg_463_1 then
			return true
		end
	end

	return false
end

slot_0_149_1 = slot_0_15_0.other_aa_state

function slot_0_150_1()
	slot_0_149_1.is_overriding = false
	slot_0_149_1.last_packet = -1
	slot_0_149_1.pitch_random = 0
	slot_0_149_1.pitch_random_packet = -1
	slot_0_149_1.pitch_spin = -89
	slot_0_149_1.pitch_spin_direction = 1
	slot_0_149_1.pitch_last_time = 0
	slot_0_149_1.pitch_switch_flip = false
	slot_0_149_1.pitch_switch_packets = 0
	slot_0_149_1.yaw_spin = 0
	slot_0_149_1.yaw_last_time = 0
	slot_0_149_1.yaw_random = 180
	slot_0_149_1.yaw_random_packet = -1
end

function slot_0_151_1()
	slot_0_150_1()

	local var_465_0 = slot_0_11_0.aa and slot_0_11_0.aa.angles

	if var_465_0 ~= nil then
		if var_465_0.pitch ~= nil then
			var_465_0.pitch:override()
		end

		if var_465_0.yaw ~= nil then
			var_465_0.yaw:override()
		end

		if var_465_0.yaw_add ~= nil then
			var_465_0.yaw_add:override()
		end

		if var_465_0.yaw_base ~= nil then
			var_465_0.yaw_base:override()
		end

		if var_465_0.yaw_modifier ~= nil then
			var_465_0.yaw_modifier:override()
		end

		if var_465_0.modifier_offset ~= nil then
			var_465_0.modifier_offset:override()
		end

		if var_465_0.options ~= nil then
			var_465_0.options:override()
		end
	end

	slot_0_122_4()

	local var_465_1 = slot_0_15_0.fake_lag_enabled_override_state

	if var_465_1 ~= nil then
		var_465_1.other_aa = nil
	end

	if slot_0_15_0.apply_fake_lag_enabled_override ~= nil then
		slot_0_15_0.apply_fake_lag_enabled_override()
	end
end

function slot_0_152_1()
	local var_466_0 = entity.get_local_player()

	if var_466_0 == nil then
		return false
	end

	local var_466_1 = var_466_0.m_iTeamNum

	if type(var_466_1) ~= "number" then
		return false
	end

	local var_466_2 = entity.get_player_resource()

	if var_466_2 ~= nil then
		for iter_466_0 = 1, globals.max_players do
			local var_466_3 = var_466_2.m_bConnected[iter_466_0]

			if var_466_3 == true or var_466_3 == 1 then
				local var_466_4 = var_466_2.m_iTeam[iter_466_0]
				local var_466_5 = var_466_2.m_iHealth[iter_466_0]

				if (var_466_4 == 2 or var_466_4 == 3) and var_466_4 ~= var_466_1 and type(var_466_5) == "number" and var_466_5 > 0 then
					return true
				end
			end
		end

		return false
	end

	local var_466_6 = false

	entity.get_players(true, true, function(arg_467_0)
		if var_466_6 == true or arg_467_0 == nil then
			return
		end

		if arg_467_0:is_alive() == true then
			var_466_6 = true
		end
	end)

	return var_466_6
end

function slot_0_153_1()
	local var_468_0 = slot_0_15_0.other_aa_refs

	if var_468_0.disable_on == nil then
		return false
	end

	local var_468_1 = entity.get_local_player()

	if var_468_1 == nil or var_468_1:is_alive() ~= true then
		return false
	end

	local var_468_2 = entity.get_game_rules()

	if var_468_2 == nil then
		return false
	end

	if slot_0_148_1(var_468_0.disable_on, "Warmup") and var_468_2.m_bWarmupPeriod == true then
		return true
	end

	if slot_0_148_1(var_468_0.disable_on, "Round End") and var_468_2.m_bWarmupPeriod ~= true and slot_0_149_1.round_end_active == true and slot_0_152_1() ~= true then
		return true
	end

	return false
end

function slot_0_154_1()
	local var_469_0 = slot_0_15_0.other_aa_refs
	local var_469_1 = "Spin"

	if var_469_0.yaw_mode ~= nil then
		local var_469_2 = var_469_0.yaw_mode:get()

		if type(var_469_2) == "string" and var_469_2 ~= "" then
			var_469_1 = var_469_2
		end
	end

	if var_469_1 == "Disabled" then
		return nil
	end

	if var_469_1 == "Static" then
		if var_469_0.yaw_static ~= nil then
			local var_469_3 = var_469_0.yaw_static:get()

			if type(var_469_3) == "number" then
				return slot_0_109_4(var_469_3, -180, 180)
			end
		end

		return 180
	end

	if var_469_1 == "Random" then
		local var_469_4 = slot_0_50_13.sent_packets

		if type(var_469_4) ~= "number" then
			var_469_4 = 0
		end

		if slot_0_149_1.yaw_random_packet ~= var_469_4 then
			slot_0_149_1.yaw_random_packet = var_469_4

			local var_469_5 = -180
			local var_469_6 = 180

			if var_469_0.yaw_random_min ~= nil then
				local var_469_7 = var_469_0.yaw_random_min:get()

				if type(var_469_7) == "number" then
					var_469_5 = slot_0_109_4(var_469_7, -180, 180)
				end
			end

			if var_469_0.yaw_random_max ~= nil then
				local var_469_8 = var_469_0.yaw_random_max:get()

				if type(var_469_8) == "number" then
					var_469_6 = slot_0_109_4(var_469_8, -180, 180)
				end
			end

			if var_469_6 < var_469_5 then
				var_469_5, var_469_6 = var_469_6, var_469_5
			end

			slot_0_149_1.yaw_random = utils.random_int(var_469_5, var_469_6)
		end

		return math.normalize_yaw(slot_0_149_1.yaw_random)
	end

	local var_469_9 = 1000

	if var_469_0.yaw_spin_speed ~= nil then
		local var_469_10 = var_469_0.yaw_spin_speed:get()

		if type(var_469_10) == "number" then
			var_469_9 = slot_0_109_4(var_469_10, 1, 2000)
		end
	end

	local var_469_11 = globals.realtime

	if type(var_469_11) ~= "number" then
		var_469_11 = slot_0_149_1.yaw_last_time
	end

	local var_469_12 = var_469_11 - slot_0_149_1.yaw_last_time

	slot_0_149_1.yaw_last_time = var_469_11

	if var_469_12 < 0 or var_469_12 > 0.25 then
		var_469_12 = 0
	end

	slot_0_149_1.yaw_spin = math.normalize_yaw(slot_0_149_1.yaw_spin + var_469_9 * var_469_12)

	return slot_0_149_1.yaw_spin
end

function slot_0_155_1(arg_470_0, arg_470_1)
	slot_470_2_0 = slot_0_15_0.other_aa_refs

	if arg_470_0 ~= "Random" then
		slot_0_149_1.pitch_random_packet = -1
	end

	if arg_470_0 ~= "Spin" then
		slot_0_149_1.pitch_last_time = 0
		slot_0_149_1.pitch_spin = -89
		slot_0_149_1.pitch_spin_direction = 1
	end

	if arg_470_0 ~= "Switch" then
		slot_0_149_1.pitch_switch_flip = false
		slot_0_149_1.pitch_switch_packets = 0
	end

	if arg_470_0 == "Static" then
		slot_470_3_3 = 0

		if slot_470_2_0.pitch_static ~= nil then
			slot_470_4_3 = slot_470_2_0.pitch_static:get()

			if type(slot_470_4_3) == "number" then
				slot_470_3_3 = slot_470_4_3
			end
		end

		return slot_0_109_4(slot_470_3_3, -89, 89)
	end

	if arg_470_0 == "Random" then
		slot_470_3_2 = slot_0_50_13.sent_packets

		if type(slot_470_3_2) ~= "number" then
			slot_470_3_2 = 0
		end

		if slot_0_149_1.pitch_random_packet ~= slot_470_3_2 then
			slot_0_149_1.pitch_random_packet = slot_470_3_2
			slot_470_4_2 = -89
			slot_470_5_4 = 89

			if slot_470_2_0.pitch_random_min ~= nil then
				slot_470_6_6 = slot_470_2_0.pitch_random_min:get()

				if type(slot_470_6_6) == "number" then
					slot_470_4_2 = slot_0_109_4(slot_470_6_6, -89, 89)
				end
			end

			if slot_470_2_0.pitch_random_max ~= nil then
				slot_470_6_5 = slot_470_2_0.pitch_random_max:get()

				if type(slot_470_6_5) == "number" then
					slot_470_5_4 = slot_0_109_4(slot_470_6_5, -89, 89)
				end
			end

			if slot_470_5_4 < slot_470_4_2 then
				slot_470_4_2, slot_470_5_4 = slot_470_5_4, slot_470_4_2
			end

			slot_0_149_1.pitch_random = utils.random_float(slot_470_4_2, slot_470_5_4)
		end

		return slot_0_109_4(slot_0_149_1.pitch_random, -89, 89)
	end

	if arg_470_0 == "Spin" then
		slot_470_3_1 = -89
		slot_470_4_1 = 89

		if slot_470_2_0.pitch_spin_min ~= nil then
			slot_470_5_3 = slot_470_2_0.pitch_spin_min:get()

			if type(slot_470_5_3) == "number" then
				slot_470_3_1 = slot_0_109_4(slot_470_5_3, -89, 89)
			end
		end

		if slot_470_2_0.pitch_spin_max ~= nil then
			slot_470_5_2 = slot_470_2_0.pitch_spin_max:get()

			if type(slot_470_5_2) == "number" then
				slot_470_4_1 = slot_0_109_4(slot_470_5_2, -89, 89)
			end
		end

		if slot_470_4_1 < slot_470_3_1 then
			slot_470_3_1, slot_470_4_1 = slot_470_4_1, slot_470_3_1
		end

		slot_470_5_1 = 260

		if slot_470_2_0.pitch_spin_speed ~= nil then
			slot_470_6_4 = slot_470_2_0.pitch_spin_speed:get()

			if type(slot_470_6_4) == "number" then
				slot_470_5_1 = slot_0_109_4(slot_470_6_4, 1, 720)
			end
		end

		slot_470_6_3 = globals.realtime

		if type(slot_470_6_3) ~= "number" then
			slot_470_6_3 = slot_0_149_1.pitch_last_time
		end

		if slot_470_3_1 == slot_470_4_1 then
			slot_0_149_1.pitch_last_time = slot_470_6_3
			slot_0_149_1.pitch_spin = slot_470_3_1
			slot_0_149_1.pitch_spin_direction = 1

			return slot_0_149_1.pitch_spin
		end

		if slot_0_149_1.pitch_last_time == 0 or slot_470_3_1 > slot_0_149_1.pitch_spin or slot_470_4_1 < slot_0_149_1.pitch_spin then
			slot_0_149_1.pitch_last_time = slot_470_6_3
			slot_0_149_1.pitch_spin = slot_470_3_1
			slot_0_149_1.pitch_spin_direction = 1

			return slot_0_149_1.pitch_spin
		end

		slot_470_7_0 = slot_470_6_3 - slot_0_149_1.pitch_last_time
		slot_0_149_1.pitch_last_time = slot_470_6_3

		if slot_470_7_0 < 0 or slot_470_7_0 > 0.25 then
			slot_470_7_0 = 0
		end

		slot_470_8_0 = slot_0_149_1.pitch_spin + slot_0_149_1.pitch_spin_direction * slot_470_5_1 * slot_470_7_0

		while slot_470_4_1 < slot_470_8_0 or slot_470_8_0 < slot_470_3_1 do
			if slot_470_4_1 < slot_470_8_0 then
				slot_470_8_0 = slot_470_4_1 - (slot_470_8_0 - slot_470_4_1)
				slot_0_149_1.pitch_spin_direction = -1
			elseif slot_470_8_0 < slot_470_3_1 then
				slot_470_8_0 = slot_470_3_1 + (slot_470_3_1 - slot_470_8_0)
				slot_0_149_1.pitch_spin_direction = 1
			end
		end

		slot_0_149_1.pitch_spin = slot_0_109_4(slot_470_8_0, -89, 89)

		return slot_0_149_1.pitch_spin
	end

	if arg_470_0 == "Switch" then
		slot_470_3_0 = -89
		slot_470_4_0 = 89
		slot_470_5_0 = 1

		if slot_470_2_0.pitch_switch_first ~= nil then
			slot_470_6_2 = slot_470_2_0.pitch_switch_first:get()

			if type(slot_470_6_2) == "number" then
				slot_470_3_0 = slot_0_109_4(slot_470_6_2, -89, 89)
			end
		end

		if slot_470_2_0.pitch_switch_second ~= nil then
			slot_470_6_1 = slot_470_2_0.pitch_switch_second:get()

			if type(slot_470_6_1) == "number" then
				slot_470_4_0 = slot_0_109_4(slot_470_6_1, -89, 89)
			end
		end

		if slot_470_2_0.pitch_switch_delay ~= nil then
			slot_470_6_0 = slot_470_2_0.pitch_switch_delay:get()

			if type(slot_470_6_0) == "number" then
				slot_470_5_0 = slot_0_109_4(math.floor(slot_470_6_0), 1, 16)
			end
		end

		if arg_470_1 then
			slot_0_149_1.pitch_switch_packets = slot_0_149_1.pitch_switch_packets + 1

			if slot_470_5_0 < slot_0_149_1.pitch_switch_packets then
				slot_0_149_1.pitch_switch_packets = 1
				slot_0_149_1.pitch_switch_flip = not slot_0_149_1.pitch_switch_flip
			end
		end

		if slot_0_149_1.pitch_switch_flip == true then
			return slot_470_4_0
		end

		return slot_470_3_0
	end

	return nil
end

function slot_0_156_1(arg_471_0)
	if slot_0_153_1() ~= true then
		slot_0_151_1()

		return false
	end

	local var_471_0 = slot_0_11_0.aa and slot_0_11_0.aa.angles

	if var_471_0 == nil then
		slot_0_151_1()

		return false
	end

	local var_471_1 = slot_0_50_13.sent_packets

	if type(var_471_1) ~= "number" then
		var_471_1 = 0
	end

	local var_471_2 = slot_0_149_1.last_packet ~= var_471_1

	slot_0_149_1.last_packet = var_471_1

	local var_471_3 = "Disabled"

	if slot_0_15_0.other_aa_refs.pitch_mode ~= nil then
		local var_471_4 = slot_0_15_0.other_aa_refs.pitch_mode:get()

		if type(var_471_4) == "string" and var_471_4 ~= "" then
			var_471_3 = var_471_4
		end
	end

	if var_471_3 == "Fake Down" then
		var_471_3 = "Down"
	end

	local var_471_5 = var_471_3 ~= "Disabled" and var_471_3 ~= "Down"

	if var_471_0.pitch ~= nil then
		if var_471_5 == true then
			var_471_0.pitch:override("Disabled")
		else
			var_471_0.pitch:override(var_471_3)
		end
	end

	if var_471_5 == true then
		local var_471_6 = slot_0_155_1(var_471_3, var_471_2)

		if type(var_471_6) == "number" and arg_471_0 ~= nil and arg_471_0.view_angles ~= nil then
			local var_471_7 = entity.get_local_player()

			if var_471_7 ~= nil and var_471_7:is_alive() == true then
				local var_471_8 = var_471_7.m_MoveType

				if var_471_8 ~= 8 and var_471_8 ~= 9 and arg_471_0.in_attack ~= true and arg_471_0.in_use ~= true then
					arg_471_0.view_angles.x = slot_0_109_4(var_471_6, -89, 89)
					arg_471_0.upmove = 0
				end
			end
		end
	else
		slot_0_149_1.pitch_random = 0
		slot_0_149_1.pitch_random_packet = -1
		slot_0_149_1.pitch_spin = -89
		slot_0_149_1.pitch_spin_direction = 1
		slot_0_149_1.pitch_last_time = 0
		slot_0_149_1.pitch_switch_flip = false
		slot_0_149_1.pitch_switch_packets = 0
	end

	local var_471_9 = slot_0_154_1()

	if var_471_9 == nil then
		if var_471_0.yaw ~= nil then
			var_471_0.yaw:override("Disabled")
		end

		if var_471_0.yaw_add ~= nil then
			var_471_0.yaw_add:override()
		end

		if var_471_0.yaw_base ~= nil then
			var_471_0.yaw_base:override()
		end
	else
		if var_471_0.yaw ~= nil then
			var_471_0.yaw:override("Backward")
		end

		if var_471_0.yaw_add ~= nil then
			var_471_0.yaw_add:override(math.normalize_yaw(var_471_9))
		end

		if var_471_0.yaw_base ~= nil then
			var_471_0.yaw_base:override("Local View")
		end
	end

	if var_471_0.yaw_modifier ~= nil then
		var_471_0.yaw_modifier:override("Disabled")
	end

	if var_471_0.modifier_offset ~= nil then
		var_471_0.modifier_offset:override()
	end

	if var_471_0.options ~= nil then
		var_471_0.options:override({})
	end

	if slot_0_148_1(slot_0_15_0.other_aa_refs.disablers, "Body Yaw") then
		if var_471_0.body_yaw ~= nil then
			var_471_0.body_yaw:override(false)
		end

		if var_471_0.left_limit ~= nil then
			var_471_0.left_limit:override()
		end

		if var_471_0.right_limit ~= nil then
			var_471_0.right_limit:override()
		end
	else
		slot_0_122_4()
	end

	local var_471_10 = slot_0_148_1(slot_0_15_0.other_aa_refs.disablers, "Fakelag") or slot_0_148_1(slot_0_15_0.other_aa_refs.disablers, "Fake Lags")
	local var_471_11 = slot_0_15_0.fake_lag_enabled_override_state

	if var_471_11 ~= nil then
		if var_471_10 == true then
			var_471_11.other_aa = false
		else
			var_471_11.other_aa = nil
		end
	end

	if slot_0_15_0.apply_fake_lag_enabled_override ~= nil then
		slot_0_15_0.apply_fake_lag_enabled_override()
	end

	slot_0_149_1.is_overriding = true

	return true
end

function slot_0_157_1(arg_472_0, arg_472_1, arg_472_2, arg_472_3)
	if type(arg_472_1) ~= "string" then
		return arg_472_0
	end

	if arg_472_1 == slot_0_36_6 then
		return arg_472_0
	end

	if slot_0_148_1(arg_472_2, arg_472_1) ~= true then
		return arg_472_0
	end

	if type(arg_472_3) ~= "table" then
		return arg_472_0
	end

	local var_472_0 = arg_472_3[arg_472_1]

	if var_472_0 == nil then
		return arg_472_0
	end

	local var_472_1 = var_472_0:get()

	if type(var_472_1) ~= "number" then
		return arg_472_0
	end

	return var_472_1
end

slot_0_158_1 = {
	is_item_enabled = function(arg_473_0)
		if arg_473_0 == nil then
			return false
		end

		local var_473_0, var_473_1 = pcall(arg_473_0.get_override, arg_473_0)

		if var_473_0 and var_473_1 ~= nil then
			return var_473_1 == true
		end

		local var_473_2, var_473_3 = pcall(arg_473_0.get, arg_473_0)

		if not var_473_2 then
			return false
		end

		return var_473_3 == true
	end,
	is_revolver_weapon = function(arg_474_0)
		if arg_474_0 == nil then
			return false
		end

		local var_474_0 = arg_474_0:get_weapon_info()

		if var_474_0 == nil then
			return false
		end

		return var_474_0.is_revolver == true
	end
}

function slot_0_158_1.is_disabled(arg_475_0)
	return slot_0_158_1.is_revolver_weapon(arg_475_0) == true
end

function slot_0_158_1.is_custom_tickbase_enabled(arg_476_0)
	if type(arg_476_0) ~= "table" then
		return false
	end

	local var_476_0 = arg_476_0.break_lc_custom_tickbase_enabled_ref

	if var_476_0 == nil then
		return false
	end

	return var_476_0:get() == true
end

function slot_0_158_1.uses_custom_advanced_tickbase(arg_477_0)
	return slot_0_158_1.is_custom_tickbase_enabled(arg_477_0) == true
end

function slot_0_159_1(arg_478_0, arg_478_1)
	local var_478_0 = arg_478_1

	if arg_478_0 ~= nil and arg_478_0.get ~= nil then
		local var_478_1, var_478_2 = pcall(arg_478_0.get, arg_478_0)

		if var_478_1 and type(var_478_2) == "number" then
			var_478_0 = var_478_2
		end
	end

	if type(var_478_0) ~= "number" then
		var_478_0 = arg_478_1
	end

	if type(var_478_0) ~= "number" then
		return 0
	end

	return math.floor(var_478_0)
end

function slot_0_160_1(arg_479_0, arg_479_1, arg_479_2, arg_479_3, arg_479_4, arg_479_5)
	local var_479_0 = math.min(arg_479_4, arg_479_5)
	local var_479_1 = math.max(arg_479_4, arg_479_5)

	if var_479_1 <= var_479_0 then
		return var_479_0
	end

	local var_479_2 = tonumber(arg_479_0) or 0
	local var_479_3 = (tonumber(arg_479_1) or 0) * 37 + (tonumber(arg_479_2) or 0) * 17 + (tonumber(arg_479_3) or 0) * 11
	local var_479_4 = math.sin(var_479_2 * 12.9898 + var_479_3 * 78.233) * 43758.5453
	local var_479_5 = var_479_4 - math.floor(var_479_4)

	return var_479_0 + math.floor(var_479_5 * (var_479_1 - var_479_0 + 1))
end

function slot_0_158_1.get_custom_tickbase_interval(arg_480_0, arg_480_1, arg_480_2, arg_480_3)
	if type(arg_480_0) ~= "table" then
		return nil
	end

	local var_480_0 = slot_0_109_4(slot_0_159_1(arg_480_0.break_lc_tickbase_choke_ref, 16), 2, 22)
	local var_480_1 = arg_480_0.break_lc_tickbase_randomize_ref

	if var_480_1 == nil or var_480_1:get() ~= true then
		return var_480_0
	end

	if slot_0_46_3(arg_480_0.break_lc_tickbase_type_ref ~= nil and arg_480_0.break_lc_tickbase_type_ref:get() or nil) == "Ways" then
		local var_480_2 = slot_0_109_4(slot_0_159_1(arg_480_0.break_lc_tickbase_sliders_ref, 3), 2, 8)
		local var_480_3 = slot_0_160_1(arg_480_1, arg_480_2, arg_480_3, 1, 1, var_480_2)
		local var_480_4 = arg_480_0["break_lc_tickbase_" .. var_480_3 .. "_ref"]

		return slot_0_109_4(slot_0_159_1(var_480_4, 2), 2, 22)
	end

	local var_480_5 = slot_0_109_4(slot_0_159_1(arg_480_0.break_lc_tickbase_random_min_ref, 16), 2, 22)
	local var_480_6 = slot_0_109_4(slot_0_159_1(arg_480_0.break_lc_tickbase_random_max_ref, 16), 2, 22)

	return slot_0_160_1(arg_480_1, arg_480_2, arg_480_3, 2, var_480_5, var_480_6)
end

function slot_0_158_1.should_force_custom_defensive(arg_481_0, arg_481_1, arg_481_2, arg_481_3)
	if slot_0_158_1.uses_custom_advanced_tickbase(arg_481_0) ~= true then
		return false
	end

	if slot_0_158_1.is_item_enabled(slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.double_tap) ~= true then
		return false
	end

	if arg_481_1 == nil or type(arg_481_1.command_number) ~= "number" then
		return false
	end

	local var_481_0 = slot_0_158_1.get_custom_tickbase_interval(arg_481_0, arg_481_1.command_number, arg_481_2, arg_481_3)

	if type(var_481_0) ~= "number" or var_481_0 < 2 then
		return false
	end

	return arg_481_1.command_number % var_481_0 == 0
end

slot_0_161_1 = {
	get_command_value = function(arg_482_0, arg_482_1)
		if arg_482_0 == nil then
			return false
		end

		local var_482_0 = arg_482_0[arg_482_1]

		if var_482_0 == true then
			return true
		end

		if type(var_482_0) == "number" then
			return var_482_0 ~= 0
		end

		return false
	end
}

function slot_0_162_0(arg_483_0)
	return slot_0_161_1.get_command_value(arg_483_0, "in_use")
end

function slot_0_161_1.get_crouch_move_direction(arg_484_0)
	local var_484_0 = 0
	local var_484_1 = 0

	if arg_484_0 ~= nil then
		if type(arg_484_0.forwardmove) == "number" then
			var_484_0 = arg_484_0.forwardmove
		end

		if type(arg_484_0.sidemove) == "number" then
			var_484_1 = arg_484_0.sidemove
		end
	end

	local var_484_2 = var_484_0 > 1
	local var_484_3 = var_484_0 < -1

	if var_484_2 ~= true and var_484_3 ~= true then
		var_484_2 = slot_0_161_1.get_command_value(arg_484_0, "in_forward")
		var_484_3 = slot_0_161_1.get_command_value(arg_484_0, "in_back")
	end

	if var_484_2 == var_484_3 then
		var_484_2 = false
		var_484_3 = false
	end

	local var_484_4 = var_484_1 > 1
	local var_484_5 = var_484_1 < -1

	if var_484_4 ~= true and var_484_5 ~= true then
		var_484_4 = slot_0_161_1.get_command_value(arg_484_0, "in_moveright")
		var_484_5 = slot_0_161_1.get_command_value(arg_484_0, "in_moveleft")
	end

	if var_484_4 == var_484_5 then
		var_484_4 = false
		var_484_5 = false
	end

	local var_484_6

	if var_484_2 then
		var_484_6 = "Forward"
	elseif var_484_3 then
		var_484_6 = "Backward"
	end

	if var_484_4 then
		if var_484_6 ~= nil then
			return var_484_6 .. "-Right"
		end

		return "Right"
	end

	if var_484_5 then
		if var_484_6 ~= nil then
			return var_484_6 .. "-Left"
		end

		return "Left"
	end

	if var_484_6 ~= nil then
		return var_484_6
	end

	return slot_0_36_6
end

function slot_0_161_1.is_fake_duck_active()
	local var_485_0 = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.fake_duck

	if var_485_0 == nil then
		return false
	end

	return var_485_0:get() == true
end

slot_0_15_0.manual_yaw = slot_0_15_0.manual_yaw or {}

function slot_0_15_0.manual_yaw.update_toggle_state()
	local var_486_0 = "Disabled"
	local var_486_1 = slot_0_15_0.manual_yaw_refs.direction

	if var_486_1 ~= nil then
		local var_486_2 = var_486_1:get()

		if type(var_486_2) == "string" and var_486_2 ~= "" then
			var_486_0 = var_486_2
		end
	end

	slot_0_15_0.manual_yaw_toggle_state.left = var_486_0 == "Left"
	slot_0_15_0.manual_yaw_toggle_state.forward = var_486_0 == "Forward"
	slot_0_15_0.manual_yaw_toggle_state.right = var_486_0 == "Right"
end

function slot_0_15_0.manual_yaw.get_offset()
	if slot_0_15_0.manual_yaw_toggle_state.left == true then
		return -90
	end

	if slot_0_15_0.manual_yaw_toggle_state.forward == true then
		return 180
	end

	if slot_0_15_0.manual_yaw_toggle_state.right == true then
		return 90
	end

	return nil
end

function slot_0_15_0.manual_yaw.is_active()
	return slot_0_15_0.manual_yaw.get_offset() ~= nil
end

slot_0_163_0 = {
	update_requested = function()
		local var_489_0 = slot_0_15_0.freestanding_refs.hotkey

		if var_489_0 == nil then
			slot_0_15_0.freestanding_toggle_state = false
			slot_0_15_0.freestanding_requested = false

			return
		end

		local var_489_1 = var_489_0:get() == true

		slot_0_15_0.freestanding_requested = var_489_1 == true
	end,
	is_disabler_active = function(arg_490_0, arg_490_1)
		local var_490_0 = slot_0_15_0.freestanding_refs

		if var_490_0.disablers == nil then
			return false
		end

		local var_490_1 = arg_490_0.m_vecVelocity
		local var_490_2 = 0

		if var_490_1 ~= nil and var_490_1.length ~= nil then
			var_490_2 = var_490_1:length()
		end

		local var_490_3 = not slot_0_126_4(arg_490_0.m_fFlags) or slot_0_161_1.get_command_value(arg_490_1, "in_jump")
		local var_490_4 = slot_0_161_1.is_fake_duck_active()
		local var_490_5 = arg_490_0.m_flDuckAmount or 0
		local var_490_6 = (var_490_2 <= 1.1001 and var_490_5 ~= 0 or var_490_2 > 1.1001 and var_490_5 == 1) and not var_490_4
		local var_490_7 = var_490_2 <= 1.1001 and not var_490_6 and not var_490_3
		local var_490_8 = slot_0_127_4() and var_490_2 >= 1.1001 and not var_490_3 and not var_490_6

		if slot_0_148_1(var_490_0.disablers, "Standing") and var_490_7 then
			return true
		end

		if slot_0_148_1(var_490_0.disablers, "Jumping") and var_490_3 then
			return true
		end

		if slot_0_148_1(var_490_0.disablers, "Fake Duck") and var_490_4 then
			return true
		end

		if slot_0_148_1(var_490_0.disablers, "Crouching") and var_490_6 then
			return true
		end

		if slot_0_148_1(var_490_0.disablers, "Slow-Motion") and var_490_8 then
			return true
		end

		return false
	end
}

function slot_0_163_0.update(arg_491_0)
	local var_491_0 = slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.freestanding
	local var_491_1 = slot_0_15_0.freestanding_refs

	if var_491_1.hotkey == nil or var_491_1.disablers == nil or var_491_1.tweaks == nil then
		slot_0_15_0.freestanding_toggle_state = false
		slot_0_15_0.freestanding_requested = false
		slot_0_15_0.freestanding_active = false
		slot_0_15_0.freestanding_static = false

		if var_491_0 ~= nil then
			var_491_0:override()
		end

		return
	end

	slot_0_163_0.update_requested()

	local var_491_2 = slot_0_15_0.manual_yaw.is_active()

	if slot_0_50_13.is_throwing_grenade == true or var_491_2 then
		if slot_0_50_13.is_throwing_grenade ~= true and var_491_2 and slot_0_148_1(var_491_1.tweaks, "Prefer on Manual") then
			slot_0_15_0.freestanding_toggle_state = false
		end

		slot_0_15_0.freestanding_requested = false
	end

	local var_491_3 = entity.get_local_player()
	local var_491_4 = slot_0_15_0.freestanding_requested == true

	if var_491_3 == nil or var_491_3:is_alive() ~= true then
		var_491_4 = false
	end

	if var_491_4 and slot_0_163_0.is_disabler_active(var_491_3, arg_491_0) then
		var_491_4 = false
	end

	if var_491_0 ~= nil then
		var_491_0:override(var_491_4)
	end

	slot_0_15_0.freestanding_static = false

	if var_491_4 and rage ~= nil and rage.antiaim ~= nil and rage.antiaim.get_target ~= nil then
		local var_491_5, var_491_6 = pcall(rage.antiaim.get_target, rage.antiaim, true)

		slot_0_15_0.freestanding_active = var_491_5 and var_491_6 ~= nil

		if slot_0_15_0.freestanding_active and slot_0_148_1(var_491_1.tweaks, "Static") and type(var_491_6) == "number" then
			slot_0_15_0.freestanding_static = true
		end
	else
		slot_0_15_0.freestanding_active = false
	end
end

slot_0_17_0 = (function()
	local var_492_0 = false
	local var_492_1 = false
	local var_492_2
	local var_492_3 = false

	local function var_492_4()
		var_492_1 = false
		var_492_2 = nil
		var_492_3 = false
	end

	local function var_492_5(arg_494_0)
		if arg_494_0 == "Air Crouch Knife" then
			return 37
		end

		return 0
	end

	local function var_492_6(arg_495_0)
		local var_495_0 = slot_0_15_0.safe_head_refs.states

		if var_495_0 == nil then
			return false
		end

		local var_495_1, var_495_2 = pcall(var_495_0.get, var_495_0)

		if not var_495_1 or type(var_495_2) ~= "table" then
			return false
		end

		if #var_495_2 == 0 then
			return true
		end

		return slot_0_148_1(var_495_0, arg_495_0)
	end

	local function var_492_7(arg_496_0)
		return arg_496_0 ~= nil and arg_496_0:is_alive() == true and arg_496_0:is_dormant() ~= true and arg_496_0:is_enemy() == true
	end

	local function var_492_8(arg_497_0)
		local var_497_0 = entity.get_threat(true)

		if var_492_7(var_497_0) == true then
			return var_497_0
		end

		local var_497_1 = entity.get_threat()

		if var_492_7(var_497_1) == true then
			return var_497_1
		end

		local var_497_2 = arg_497_0 ~= nil and arg_497_0:get_origin() or nil
		local var_497_3 = entity.get_players(true, false)
		local var_497_4
		local var_497_5 = math.huge

		for iter_497_0 = 1, #var_497_3 do
			local var_497_6 = var_497_3[iter_497_0]

			if var_492_7(var_497_6) == true then
				if var_497_2 == nil then
					return var_497_6
				end

				local var_497_7 = var_497_6:get_origin()

				if var_497_7 ~= nil then
					local var_497_8 = var_497_2:dist2dsqr(var_497_7)

					if var_497_8 < var_497_5 then
						var_497_5 = var_497_8
						var_497_4 = var_497_6
					end
				end
			end
		end

		return var_497_4
	end

	local function var_492_9(arg_498_0, arg_498_1)
		if arg_498_0 == nil or arg_498_1 == nil or arg_498_0.entity ~= arg_498_1 then
			return false
		end

		local var_498_0 = arg_498_0.hitbox

		if type(var_498_0) == "number" then
			return var_498_0 >= 2 and var_498_0 <= 6
		end

		local var_498_1 = arg_498_0.hitgroup

		return var_498_1 == 2 or var_498_1 == 3
	end

	local function var_492_10(arg_499_0, arg_499_1)
		if arg_499_0 == nil or arg_499_1 == nil or utils == nil or utils.trace_bullet == nil then
			return false
		end

		if arg_499_1:is_alive() ~= true or arg_499_1:is_dormant() == true or arg_499_1:is_enemy() ~= true then
			return false
		end

		local var_499_0 = arg_499_0.m_iHealth

		if type(var_499_0) ~= "number" or var_499_0 <= 0 then
			return false
		end

		local var_499_1 = arg_499_1:get_eye_position()

		if var_499_1 == nil then
			return false
		end

		local var_499_2 = arg_499_1:get_player_weapon()

		if var_499_2 == nil or var_499_2:is_weapon() ~= true then
			return false
		end

		local var_499_3 = var_499_2:get_weapon_info()

		if var_499_3 == nil then
			return false
		end

		local var_499_4 = var_499_3.weapon_type

		if var_499_4 == 0 or var_499_4 == 9 then
			return false
		end

		if var_499_2:get_weapon_reload() ~= -1 then
			return false
		end

		if var_499_2.m_iClip1 ~= nil and var_499_2.m_iClip1 <= 0 then
			return false
		end

		local var_499_5 = globals.curtime
		local var_499_6 = var_499_2.m_flNextPrimaryAttack or 0

		if var_499_3.is_revolver == true then
			if var_499_5 < var_499_6 then
				return false
			end
		elseif var_499_5 < (arg_499_1.m_flNextAttack or 0) or var_499_5 < var_499_6 then
			return false
		end

		local function var_499_7(arg_500_0)
			local var_500_0 = arg_499_0:get_hitbox_position(arg_500_0)

			if var_500_0 == nil then
				return false
			end

			local var_500_1, var_500_2 = utils.trace_bullet(arg_499_1, var_499_1, var_500_0)

			if type(var_500_1) ~= "number" or var_500_1 < var_499_0 then
				return false
			end

			return var_492_9(var_500_2, arg_499_0)
		end

		return var_499_7(2) or var_499_7(3) or var_499_7(4) or var_499_7(5) or var_499_7(6)
	end

	local function var_492_11(arg_501_0, arg_501_1)
		local var_501_0 = slot_0_15_0.safe_head_refs.disable_on

		if var_501_0 == nil then
			return false
		end

		if slot_0_148_1(var_501_0, "Freestanding") and (slot_0_15_0.freestanding_requested == true or slot_0_15_0.freestanding_active == true) then
			return true
		end

		if slot_0_148_1(var_501_0, "Manuals") and slot_0_15_0.manual_yaw.is_active() then
			return true
		end

		if slot_0_148_1(var_501_0, "Lethal") and var_492_10(arg_501_0, arg_501_1) == true then
			return true
		end

		return false
	end

	local function var_492_12(arg_502_0, arg_502_1)
		if arg_502_1 == 31 then
			return false
		end

		if arg_502_0 == nil then
			return false
		end

		if arg_502_0.weapon_type == 0 then
			return true
		end

		local var_502_0 = arg_502_0.console_name

		if type(var_502_0) ~= "string" then
			return false
		end

		return var_502_0:find("knife", 1, true) ~= nil or var_502_0:find("bayonet", 1, true) ~= nil
	end

	local function var_492_13(arg_503_0)
		return arg_503_0 == 31
	end

	local function var_492_14(arg_504_0, arg_504_1)
		if arg_504_0 == nil then
			return nil
		end

		local var_504_0 = arg_504_0:get_player_weapon()

		if var_504_0 == nil then
			return nil
		end

		local var_504_1 = var_504_0:get_weapon_info()

		if var_504_1 == nil then
			return nil
		end

		local var_504_2 = var_504_0:get_weapon_index()
		local var_504_3 = var_492_13(var_504_2)
		local var_504_4 = var_492_12(var_504_1, var_504_2)
		local var_504_5 = arg_504_0.m_vecVelocity
		local var_504_6 = 0

		if var_504_5 ~= nil and var_504_5.length2d ~= nil then
			var_504_6 = var_504_5:length2d()
		end

		local var_504_7 = arg_504_0.m_flDuckAmount or 0
		local var_504_8 = var_492_2 == "Air Crouch" or var_492_2 == "Air Crouch Knife" or var_492_2 == "Air Crouch Taser"
		local var_504_9 = slot_0_62_20(var_504_7, var_504_8)
		local var_504_10 = var_504_6 > slot_0_29_6.moving_speed_threshold

		if slot_0_126_4(arg_504_0.m_fFlags) ~= true then
			if var_504_9 ~= true then
				return nil
			end

			if var_504_3 then
				return "Air Crouch Taser"
			end

			if var_504_4 then
				return "Air Crouch Knife"
			end

			return "Air Crouch"
		end

		if arg_504_1 == nil then
			return nil
		end

		local var_504_11 = arg_504_0:get_origin()
		local var_504_12 = arg_504_1:get_origin()

		if var_504_11 == nil or var_504_12 == nil then
			return nil
		end

		local var_504_13 = var_504_11.z - var_504_12.z
		local var_504_14 = var_504_11:dist2dsqr(var_504_12)

		if (not var_504_10 or var_504_9) and var_504_13 >= 10 and var_504_14 > 1000000 then
			return "Distance"
		end

		if var_504_9 then
			if var_504_13 >= 48 then
				return "Crouch"
			end
		elseif not var_504_10 and var_504_13 >= 24 then
			return "Standing"
		end

		return nil
	end

	local function var_492_15()
		if var_492_0 ~= true then
			var_492_4()

			return
		end

		local var_505_0 = entity.get_local_player()

		if var_505_0 == nil or var_505_0:is_alive() ~= true then
			var_492_4()

			return
		end

		local var_505_1 = var_492_8(var_505_0)

		if var_492_11(var_505_0, var_505_1) == true then
			var_492_4()

			return
		end

		local var_505_2 = var_492_14(var_505_0, var_505_1)

		if var_505_2 == nil or var_492_6(var_505_2) ~= true then
			var_492_4()

			return
		end

		var_492_2 = var_505_2
		var_492_1 = true
		var_492_3 = var_492_7(var_505_1)

		local var_505_3 = slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.freestanding

		if var_505_3 ~= nil then
			var_505_3:override(false)
		end
	end

	local function var_492_16()
		if var_492_1 ~= true or var_492_2 == nil then
			return false
		end

		if slot_0_11_0.aa == nil or slot_0_11_0.aa.angles == nil then
			var_492_4()

			return false
		end

		local var_506_0 = var_492_5(var_492_2)
		local var_506_1 = 0
		local var_506_2 = 0

		if var_492_2 == "Air Crouch Knife" then
			var_506_1 = 30
			var_506_2 = 30
		end

		if rage ~= nil and rage.antiaim ~= nil and rage.antiaim.inverter ~= nil then
			rage.antiaim:inverter(false)
		end

		slot_0_11_0.aa.angles.pitch:override("Down")
		slot_0_11_0.aa.angles.yaw:override("Backward")
		slot_0_11_0.aa.angles.yaw_add:override(var_506_0)
		slot_0_11_0.aa.angles.inverter:override(false)
		slot_0_11_0.aa.angles.yaw_modifier:override("Disabled")
		slot_0_11_0.aa.angles.modifier_offset:override(0)
		slot_0_11_0.aa.angles.options:override({})

		if slot_0_11_0.aa.angles.yaw_base ~= nil then
			if var_492_3 == true then
				slot_0_11_0.aa.angles.yaw_base:override("At Target")
			else
				slot_0_11_0.aa.angles.yaw_base:override("Local View")
			end
		end

		if slot_0_11_0.aa.angles.left_limit ~= nil then
			slot_0_11_0.aa.angles.left_limit:override(var_506_1)
		end

		if slot_0_11_0.aa.angles.right_limit ~= nil then
			slot_0_11_0.aa.angles.right_limit:override(var_506_2)
		end

		if slot_0_11_0.aa.angles.body_yaw ~= nil then
			slot_0_11_0.aa.angles.body_yaw:override(true)
		end

		if slot_0_11_0.aa.angles.body_freestanding ~= nil then
			slot_0_11_0.aa.angles.body_freestanding:override(false)
		end

		if slot_0_11_0.aa.angles.freestanding ~= nil then
			slot_0_11_0.aa.angles.freestanding:override(false)
		end

		return true
	end

	return {
		get_states = function()
			return slot_0_33_8
		end,
		set_enabled = function(arg_508_0)
			var_492_0 = arg_508_0 == true

			if var_492_0 ~= true then
				var_492_4()
			end
		end,
		update = function()
			var_492_15()
		end,
		apply = function()
			return var_492_16()
		end,
		is_active = function()
			return var_492_1 == true
		end,
		shutdown = function()
			var_492_4()

			var_492_0 = false
		end
	}
end)()

function slot_0_164_0(arg_513_0)
	if slot_0_16_0 == true then
		slot_0_120_4()

		if slot_0_11_0.aa.angles.pitch ~= nil then
			slot_0_11_0.aa.angles.pitch:override("Disabled")
		end

		if slot_0_11_0.aa.angles.yaw ~= nil then
			slot_0_11_0.aa.angles.yaw:override("Disabled")
		end

		slot_0_11_0.aa.angles.yaw_add:override()
		slot_0_11_0.aa.angles.inverter:override()
		slot_0_11_0.aa.angles.options:override()
		slot_0_11_0.aa.angles.yaw_modifier:override()
		slot_0_11_0.aa.angles.modifier_offset:override()

		if slot_0_11_0.aa.angles.yaw_base ~= nil then
			slot_0_11_0.aa.angles.yaw_base:override()
		end

		if slot_0_11_0.aa.angles.body_yaw ~= nil then
			slot_0_11_0.aa.angles.body_yaw:override(true)
		end

		if slot_0_11_0.aa.angles.left_limit ~= nil then
			slot_0_11_0.aa.angles.left_limit:override(0)
		end

		if slot_0_11_0.aa.angles.right_limit ~= nil then
			slot_0_11_0.aa.angles.right_limit:override(0)
		end

		slot_0_139_2()
		slot_0_123_4()
		slot_0_150_1()

		return
	end

	if slot_0_156_1(arg_513_0) == true then
		slot_0_120_4()

		slot_0_52_17.last_side = nil

		slot_0_139_2()
		slot_0_123_4()

		return
	end

	slot_513_1_1 = 0
	slot_513_2_0 = -20
	slot_513_3_0 = 40
	slot_513_4_0 = 0
	slot_513_5_0 = 0
	slot_513_6_0 = false
	slot_513_7_0 = slot_0_97_4()
	slot_513_8_0 = "Solo"
	slot_513_9_0 = 2
	slot_513_10_1 = 1
	slot_513_11_0 = 0
	slot_513_12_0 = 0
	slot_513_13_0 = "Disabled"
	slot_513_14_0 = nil
	slot_513_15_0 = false
	slot_513_16_0 = false
	slot_513_17_0 = false
	slot_513_18_0 = 0
	slot_513_19_0 = 0
	slot_513_20_0 = 60
	slot_513_21_0 = 60
	slot_513_22_0 = 0
	slot_513_23_0 = 0
	slot_513_24_0 = slot_0_50_13.team_index
	slot_513_25_0 = slot_0_50_13.condition_index
	slot_513_26_0 = slot_0_110_4(slot_513_24_0, slot_513_25_0)
	slot_513_27_0 = nil
	slot_513_28_0 = nil

	if slot_513_25_0 ~= nil then
		slot_513_27_0 = slot_0_55_16.condition_views[slot_513_24_0]
		slot_513_28_0 = slot_0_61_20.get_runtime_view(slot_513_24_0, slot_513_25_0)
	end

	if slot_0_17_0.apply(arg_513_0) == true == true then
		slot_513_30_1 = entity.get_local_player()
		slot_513_31_1 = nil

		if slot_513_30_1 ~= nil then
			slot_513_31_1 = slot_513_30_1:get_player_weapon()
		end

		slot_513_32_1 = slot_513_28_0
		slot_513_33_1 = false
		slot_513_34_2 = false

		if slot_513_32_1 ~= nil and slot_513_32_1.break_lc_mode_ref ~= nil and slot_0_158_1.is_disabled(slot_513_31_1) ~= true then
			slot_513_33_1 = slot_0_148_1(slot_513_32_1.break_lc_mode_ref, "Double Tap")
			slot_513_34_2 = slot_0_148_1(slot_513_32_1.break_lc_mode_ref, "Hide Shots")
			slot_513_35_2 = slot_513_32_1.break_lc_mode_ref:get()

			if type(slot_513_35_2) == "string" then
				if slot_513_35_2 == "Double Tap" then
					slot_513_33_1 = true
				elseif slot_513_35_2 == "Hide Shots" then
					slot_513_34_2 = true
				end
			elseif type(slot_513_35_2) == "number" then
				if slot_513_35_2 == 1 then
					slot_513_33_1 = true
				elseif slot_513_35_2 == 2 then
					slot_513_34_2 = true
				end
			end
		end

		slot_513_35_1 = slot_513_33_1

		if (slot_513_33_1 == true or slot_513_34_2 == true) == true and slot_0_158_1.should_force_custom_defensive(slot_513_32_1, arg_513_0, slot_513_24_0, slot_513_25_0) then
			arg_513_0.force_defensive = true
		end

		if slot_513_33_1 == true and slot_0_158_1.uses_custom_advanced_tickbase(slot_513_32_1) == true then
			slot_513_35_1 = false
		end

		slot_513_37_1 = slot_0_11_0.rage and slot_0_11_0.rage.main

		if slot_513_37_1 ~= nil and slot_0_50_13.is_defensive_active ~= true then
			if slot_513_37_1.double_tap_lag_options ~= nil then
				if slot_513_35_1 then
					slot_513_37_1.double_tap_lag_options:override("Always On")
				else
					slot_513_37_1.double_tap_lag_options:override()
				end
			end

			if slot_513_37_1.hide_shots_options ~= nil then
				if slot_513_34_2 then
					slot_513_37_1.hide_shots_options:override("Break LC")
				else
					slot_513_37_1.hide_shots_options:override()
				end
			end
		end

		slot_0_52_17.last_side = false

		slot_0_150_1()
		slot_0_139_2()

		return
	end

	if slot_513_25_0 == nil then
		slot_0_120_4()
		slot_0_11_0.aa.angles.yaw_add:override()
		slot_0_11_0.aa.angles.inverter:override()
		slot_0_11_0.aa.angles.options:override()
		slot_0_11_0.aa.angles.pitch:override()
		slot_0_11_0.aa.angles.yaw:override()
		slot_0_11_0.aa.angles.yaw_modifier:override()
		slot_0_11_0.aa.angles.modifier_offset:override()

		if slot_0_11_0.aa.angles.yaw_base ~= nil then
			slot_0_11_0.aa.angles.yaw_base:override()
		end

		slot_0_122_4()
		slot_0_123_4()
		slot_0_151_1()
		slot_0_139_2()

		return
	end

	if slot_513_27_0 == nil then
		slot_0_120_4()
		slot_0_11_0.aa.angles.yaw_add:override()
		slot_0_11_0.aa.angles.inverter:override()
		slot_0_11_0.aa.angles.options:override()
		slot_0_11_0.aa.angles.pitch:override()
		slot_0_11_0.aa.angles.yaw:override()
		slot_0_11_0.aa.angles.yaw_modifier:override()
		slot_0_11_0.aa.angles.modifier_offset:override()

		if slot_0_11_0.aa.angles.yaw_base ~= nil then
			slot_0_11_0.aa.angles.yaw_base:override()
		end

		slot_0_122_4()
		slot_0_123_4()
		slot_0_151_1()
		slot_0_139_2()

		return
	end

	slot_513_30_0 = slot_513_28_0

	if slot_513_30_0 == nil then
		slot_0_120_4()
		slot_0_11_0.aa.angles.yaw_add:override()
		slot_0_11_0.aa.angles.inverter:override()
		slot_0_11_0.aa.angles.options:override()
		slot_0_11_0.aa.angles.pitch:override()
		slot_0_11_0.aa.angles.yaw:override()
		slot_0_11_0.aa.angles.yaw_modifier:override()
		slot_0_11_0.aa.angles.modifier_offset:override()

		if slot_0_11_0.aa.angles.yaw_base ~= nil then
			slot_0_11_0.aa.angles.yaw_base:override()
		end

		slot_0_122_4()
		slot_0_123_4()
		slot_0_151_1()
		slot_0_139_2()

		return
	end

	slot_0_11_0.aa.angles.pitch:override("Down")
	slot_0_11_0.aa.angles.yaw:override("Backward")
	slot_0_11_0.aa.angles.yaw_modifier:override("Disabled")
	slot_0_11_0.aa.angles.modifier_offset:override()
	slot_0_121_4(slot_513_30_0, slot_513_24_0, slot_513_25_0, false)

	slot_513_31_0 = slot_0_162_0(arg_513_0)
	slot_513_32_0 = slot_0_124_4(slot_513_30_0, slot_513_24_0, slot_513_25_0, slot_513_31_0)
	slot_513_33_0 = "Fake Yaw"

	if slot_513_30_0.fake_yaw_mode_ref ~= nil then
		slot_513_34_1 = slot_513_30_0.fake_yaw_mode_ref:get()

		if type(slot_513_34_1) == "string" or type(slot_513_34_1) == "number" then
			slot_513_33_0 = slot_513_34_1
		end
	end

	slot_513_34_0 = slot_0_24_2(slot_513_33_0)
	slot_513_35_0 = slot_0_25_2(slot_513_33_0)

	if slot_513_35_0 == true then
		if slot_513_30_0.left_yaw_ref ~= nil then
			slot_513_36_5 = slot_513_30_0.left_yaw_ref:get()

			if type(slot_513_36_5) == "number" then
				slot_513_2_0 = slot_513_36_5
			end
		end

		if slot_513_30_0.right_yaw_ref ~= nil then
			slot_513_36_4 = slot_513_30_0.right_yaw_ref:get()

			if type(slot_513_36_4) == "number" then
				slot_513_3_0 = slot_513_36_4
			end
		end

		if slot_513_25_0 == slot_0_20_2.crouch_running then
			slot_513_36_3 = slot_0_161_1.get_crouch_move_direction(arg_513_0)
			slot_513_2_0 = slot_0_157_1(slot_513_2_0, slot_513_36_3, slot_513_30_0.left_yaw_crouch_dirs_ref, slot_513_30_0.left_yaw_crouch_dir_refs)
			slot_513_3_0 = slot_0_157_1(slot_513_3_0, slot_513_36_3, slot_513_30_0.right_yaw_crouch_dirs_ref, slot_513_30_0.right_yaw_crouch_dir_refs)
		end

		if slot_513_30_0.left_yaw_randomize_ref ~= nil then
			slot_513_36_2 = slot_513_30_0.left_yaw_randomize_ref:get()

			if type(slot_513_36_2) == "number" then
				slot_513_4_0 = slot_513_36_2
			end
		end

		if slot_513_30_0.right_yaw_randomize_ref ~= nil then
			slot_513_36_1 = slot_513_30_0.right_yaw_randomize_ref:get()

			if type(slot_513_36_1) == "number" then
				slot_513_5_0 = slot_513_36_1
			end
		end
	end

	slot_513_36_0 = slot_513_32_0

	if slot_513_34_0 ~= true and rage ~= nil and rage.antiaim ~= nil then
		slot_513_36_0 = rage.antiaim:inverter() == true
	end

	slot_513_37_0 = entity.get_local_player()
	slot_513_38_0 = nil

	if slot_513_37_0 ~= nil then
		slot_513_38_0 = slot_513_37_0:get_player_weapon()
	end

	slot_513_39_0 = slot_513_28_0

	if slot_513_39_0 ~= nil and slot_513_39_0.break_lc_mode_ref ~= nil and slot_0_158_1.is_disabled(slot_513_38_0) ~= true then
		slot_513_15_0 = slot_0_148_1(slot_513_39_0.break_lc_mode_ref, "Double Tap")
		slot_513_16_0 = slot_0_148_1(slot_513_39_0.break_lc_mode_ref, "Hide Shots")
		slot_513_40_1 = slot_513_39_0.break_lc_mode_ref:get()

		if type(slot_513_40_1) == "string" then
			if slot_513_40_1 == "Double Tap" then
				slot_513_15_0 = true
			elseif slot_513_40_1 == "Hide Shots" then
				slot_513_16_0 = true
			end
		elseif type(slot_513_40_1) == "number" then
			if slot_513_40_1 == 1 then
				slot_513_15_0 = true
			elseif slot_513_40_1 == 2 then
				slot_513_16_0 = true
			end
		end
	end

	slot_513_40_0 = slot_513_15_0
	slot_513_41_0 = slot_513_15_0 == true or slot_513_16_0 == true
	slot_513_42_0 = false

	if slot_513_41_0 == true and slot_0_158_1.should_force_custom_defensive(slot_513_39_0, arg_513_0, slot_513_24_0, slot_513_25_0) then
		slot_513_42_0 = true
	end

	if slot_513_15_0 == true and slot_0_158_1.uses_custom_advanced_tickbase(slot_513_39_0) == true then
		slot_513_40_0 = false
	end

	if slot_513_42_0 == true and arg_513_0 ~= nil then
		arg_513_0.force_defensive = true
	end

	if slot_513_30_0.body_yaw_switch_ref ~= nil then
		slot_513_17_0 = slot_513_30_0.body_yaw_switch_ref:get() == true
	end

	if slot_513_30_0.body_yaw_switch_delay_ref ~= nil then
		slot_513_43_11 = slot_513_30_0.body_yaw_switch_delay_ref:get()

		if type(slot_513_43_11) == "number" then
			slot_513_18_0 = slot_513_43_11
		end
	end

	if slot_513_30_0.body_yaw_switch_var_ref ~= nil then
		slot_513_43_10 = slot_513_30_0.body_yaw_switch_var_ref:get()

		if type(slot_513_43_10) == "number" then
			slot_513_19_0 = slot_513_43_10
		end
	end

	if slot_513_30_0.body_left_ref ~= nil then
		slot_513_43_9 = slot_513_30_0.body_left_ref:get()

		if type(slot_513_43_9) == "number" then
			slot_513_20_0 = slot_513_43_9
		end
	end

	if slot_513_30_0.body_right_ref ~= nil then
		slot_513_43_8 = slot_513_30_0.body_right_ref:get()

		if type(slot_513_43_8) == "number" then
			slot_513_21_0 = slot_513_43_8
		end
	end

	if slot_513_30_0.body_left_var_ref ~= nil then
		slot_513_43_7 = slot_513_30_0.body_left_var_ref:get()

		if type(slot_513_43_7) == "number" then
			slot_513_22_0 = slot_513_43_7
		end
	end

	if slot_513_30_0.body_right_var_ref ~= nil then
		slot_513_43_6 = slot_513_30_0.body_right_var_ref:get()

		if type(slot_513_43_6) == "number" then
			slot_513_23_0 = slot_513_43_6
		end
	end

	if slot_513_30_0.hidden_yaw_modifier_switch_ref ~= nil and slot_513_30_0.hidden_yaw_modifier_switch_ref:get() == true then
		slot_513_6_0 = false
	elseif slot_513_30_0.yaw_modifier_switch_ref ~= nil then
		slot_513_6_0 = slot_513_30_0.yaw_modifier_switch_ref:get() == true
	end

	if slot_513_30_0.yaw_modifier_mode_ref ~= nil then
		slot_513_43_5 = slot_513_30_0.yaw_modifier_mode_ref:get()

		if type(slot_513_43_5) == "number" or type(slot_513_43_5) == "string" then
			slot_513_7_0 = slot_0_99_4(slot_513_43_5)
		end
	end

	if slot_513_30_0.yaw_modifier_values_mode_ref ~= nil then
		slot_513_43_4 = slot_513_30_0.yaw_modifier_values_mode_ref:get()

		if type(slot_513_43_4) == "number" or type(slot_513_43_4) == "string" then
			slot_513_8_0 = slot_513_43_4
		end
	end

	if slot_513_30_0.yaw_modifier_sliders_ref ~= nil then
		slot_513_43_3 = slot_513_30_0.yaw_modifier_sliders_ref:get()

		if type(slot_513_43_3) == "number" then
			slot_513_9_0 = slot_513_43_3
		end
	end

	slot_513_10_0 = slot_0_93_4(slot_513_8_0, slot_513_9_0)

	if slot_513_30_0.yaw_modifier_value_ref ~= nil then
		slot_513_43_2 = slot_513_30_0.yaw_modifier_value_ref:get()

		if type(slot_513_43_2) == "number" then
			slot_513_11_0 = slot_513_43_2
		end
	end

	if slot_513_30_0.yaw_modifier_variability_ref ~= nil then
		slot_513_43_1 = slot_513_30_0.yaw_modifier_variability_ref:get()

		if type(slot_513_43_1) == "number" then
			slot_513_12_0 = slot_513_43_1
		end
	end

	slot_513_43_0 = slot_0_133_2(arg_513_0)
	slot_513_44_0 = slot_0_15_0.manual_yaw.get_offset()
	slot_513_45_0 = "Default"

	if slot_0_15_0.manual_yaw_mode_ref ~= nil then
		slot_513_46_1 = slot_0_15_0.manual_yaw_mode_ref:get()

		if type(slot_513_46_1) == "string" and slot_513_46_1 ~= "" then
			slot_513_45_0 = slot_513_46_1
		end
	end

	slot_513_46_0 = false

	if slot_513_44_0 ~= nil then
		slot_513_46_0 = slot_513_45_0 == "Static"
	end

	slot_513_47_0 = slot_0_15_0.freestanding_static == true
	slot_513_48_0 = slot_513_46_0 or slot_513_47_0

	if slot_513_48_0 ~= true then
		rage.antiaim:inverter(slot_513_32_0)
	end

	slot_513_49_1 = slot_513_2_0
	slot_513_50_1 = slot_513_3_0
	slot_513_51_0 = 0
	slot_513_52_0 = slot_0_112_4(slot_513_24_0, slot_513_25_0)
	slot_513_53_0 = tostring(slot_513_7_0) .. "|" .. tostring(slot_513_8_0) .. "|" .. tostring(slot_513_10_0)
	slot_513_54_0 = slot_513_52_0.mode ~= slot_513_53_0
	slot_513_52_0.mode = slot_513_53_0

	if slot_513_54_0 == true then
		slot_0_137_2(slot_513_52_0)

		slot_513_52_0.last_applied_yaw_modifier = nil
		slot_513_52_0.last_applied_modifier_offset = nil
	end

	if slot_513_6_0 and slot_513_44_0 == nil then
		if (slot_513_31_0 == true and type(slot_513_52_0.last_applied_yaw_modifier) == "string") == true then
			slot_513_13_0 = slot_513_52_0.last_applied_yaw_modifier
			slot_513_14_0 = slot_513_52_0.last_applied_modifier_offset
		else
			slot_513_56_3 = slot_513_11_0
			slot_513_57_1 = 1

			if slot_513_10_0 > 1 then
				slot_513_57_1 = get_yaw_modifier_cycle_index(slot_513_52_0, slot_513_10_0, 1, 0, slot_513_54_0, nil, 1, slot_513_31_0)
				slot_513_56_3 = get_yaw_modifier_slot_value(slot_513_30_0.yaw_modifier_slot_refs, slot_513_57_1)
			end

			slot_513_58_1 = slot_0_99_4(slot_513_7_0)
			slot_513_59_3 = slot_0_100_4(slot_513_58_1)
			slot_513_60_1 = slot_0_134_2(slot_513_56_3, slot_513_12_0, slot_513_24_0, slot_513_25_0, slot_513_59_3 + slot_513_57_1 * 17, slot_513_43_0)

			if slot_513_58_1 == "Center" then
				slot_513_51_0 = slot_0_109_4((slot_513_32_0 and -1 or 1) * slot_0_109_4(slot_513_60_1, -180, 180), -180, 180)
				slot_513_13_0 = "Disabled"
				slot_513_14_0 = nil
			elseif slot_513_58_1 == "Spin" then
				slot_513_13_0 = slot_513_58_1
				slot_513_14_0 = math.abs(slot_0_109_4(slot_513_60_1, -180, 180))
			elseif slot_513_58_1 ~= "Disabled" then
				slot_513_13_0 = slot_513_58_1
				slot_513_14_0 = slot_0_109_4(slot_513_60_1, -180, 180)
			end

			slot_513_52_0.last_applied_yaw_modifier = slot_513_13_0
			slot_513_52_0.last_applied_modifier_offset = slot_513_14_0
		end
	else
		slot_0_137_2(slot_513_52_0)

		slot_513_52_0.last_applied_yaw_modifier = "Disabled"
		slot_513_52_0.last_applied_modifier_offset = nil
	end

	slot_513_49_0 = slot_0_109_4(slot_513_49_1, -180, 180)
	slot_513_50_0 = slot_0_109_4(slot_513_50_1, -180, 180)
	slot_513_55_0 = slot_513_32_0
	slot_513_56_2 = 0

	if slot_513_35_0 == true then
		slot_513_56_2 = slot_0_26_3(slot_513_33_0, slot_513_49_0, slot_513_50_0, slot_513_55_0)
	end

	slot_513_57_0 = slot_513_55_0 and slot_513_4_0 or slot_513_5_0

	if slot_513_44_0 ~= nil then
		slot_513_56_2 = slot_513_44_0
	elseif slot_513_35_0 == true and slot_513_57_0 > 0 then
		slot_513_56_2 = slot_513_56_2 + slot_0_132_2(slot_513_49_0, slot_513_50_0, slot_513_57_0, slot_513_24_0, slot_513_25_0, slot_513_55_0)
	end

	slot_513_56_1 = slot_513_56_2 + slot_513_51_0
	slot_513_56_0 = math.max(-180, math.min(180, slot_513_56_1))
	slot_513_1_0 = slot_513_1_1 + slot_513_56_0

	if slot_0_11_0.aa.angles.yaw_base ~= nil then
		if slot_513_44_0 ~= nil then
			slot_0_11_0.aa.angles.yaw_base:override("Local View")
		else
			slot_0_11_0.aa.angles.yaw_base:override()
		end
	end

	slot_0_11_0.aa.angles.yaw_modifier:override(slot_513_13_0)

	if slot_513_14_0 ~= nil then
		slot_0_11_0.aa.angles.modifier_offset:override(slot_513_14_0)
	else
		slot_0_11_0.aa.angles.modifier_offset:override()
	end

	slot_0_11_0.aa.angles.yaw_add:override(slot_513_1_0)

	if slot_513_48_0 ~= true and slot_513_34_0 == true then
		slot_0_11_0.aa.angles.inverter:override(slot_513_32_0)
	else
		slot_0_11_0.aa.angles.inverter:override()
	end

	slot_513_58_0 = slot_513_36_0

	if slot_513_46_0 == true then
		slot_513_59_2 = "manual:" .. tostring(slot_513_44_0)

		if slot_513_44_0 == -90 then
			slot_513_58_0 = true
		elseif slot_513_44_0 == 90 then
			slot_513_58_0 = false
		elseif slot_0_52_17.hidden_static_source ~= slot_513_59_2 then
			slot_0_52_17.hidden_static_side = slot_513_36_0
		end

		slot_0_52_17.hidden_static_active = true
		slot_0_52_17.hidden_static_source = slot_513_59_2

		if slot_513_44_0 == -90 or slot_513_44_0 == 90 then
			slot_0_52_17.hidden_static_side = slot_513_58_0
		else
			slot_513_58_0 = slot_0_52_17.hidden_static_side
		end
	elseif slot_513_47_0 == true then
		if slot_0_52_17.hidden_static_active ~= true or slot_0_52_17.hidden_static_source ~= "freestanding" then
			slot_0_52_17.hidden_static_side = slot_513_36_0
		end

		slot_0_52_17.hidden_static_active = true
		slot_0_52_17.hidden_static_source = "freestanding"
		slot_513_58_0 = slot_0_52_17.hidden_static_side
	else
		slot_0_52_17.hidden_static_active = false
		slot_0_52_17.hidden_static_side = nil
		slot_0_52_17.hidden_static_source = nil
	end

	slot_0_143_1(slot_513_30_0, slot_513_58_0, slot_513_24_0, slot_513_25_0, slot_513_43_0, slot_513_31_0, slot_513_48_0, slot_513_56_0)

	slot_0_52_17.last_team_index = slot_513_24_0
	slot_0_52_17.last_condition_index = slot_513_26_0
	slot_0_52_17.last_defensive_view = false
	slot_0_52_17.last_side = slot_513_36_0

	slot_0_11_0.aa.angles.options:override({})

	if slot_513_48_0 == true then
		slot_0_122_4()
	else
		slot_513_59_1 = slot_513_17_0
		slot_513_60_0 = slot_513_20_0
		slot_513_61_0 = slot_513_21_0
		slot_513_62_0 = slot_0_112_4(slot_513_24_0, slot_513_25_0)

		if slot_513_17_0 ~= true then
			slot_513_62_0.switch_state = false
			slot_513_62_0.switch_packets = 0
			slot_513_62_0.switch_last_flip = 0
		else
			slot_513_63_0 = slot_0_109_4(math.floor(slot_513_18_0), 0, 20)
			slot_513_64_0 = slot_0_109_4(slot_513_19_0, 0, 100)
			slot_513_59_1 = slot_513_63_0 == 0 and true or slot_0_115_4(slot_513_62_0, "switch", slot_513_63_0, slot_513_64_0, slot_513_31_0)
			slot_513_65_0 = slot_0_109_4(slot_513_22_0, 0, 100)
			slot_513_66_0 = slot_0_109_4(slot_513_23_0, 0, 100)

			if slot_513_65_0 > 0 or slot_513_66_0 > 0 then
				slot_513_67_0 = slot_0_144_1()

				if slot_513_65_0 > 0 then
					slot_513_68_1 = slot_0_145_1(slot_513_20_0, slot_513_67_0)
					slot_513_69_1 = slot_0_146_1(slot_513_20_0, slot_513_67_0)
					slot_513_60_0 = slot_0_109_4(slot_513_68_1 + slot_0_147_1(slot_513_68_1, slot_513_65_0, slot_513_24_0, slot_513_25_0, 1), 0, slot_513_69_1)
				else
					slot_513_60_0 = slot_0_109_4(slot_513_20_0, 0, 60)
				end

				if slot_513_66_0 > 0 then
					slot_513_68_0 = slot_0_145_1(slot_513_21_0, slot_513_67_0)
					slot_513_69_0 = slot_0_146_1(slot_513_21_0, slot_513_67_0)
					slot_513_61_0 = slot_0_109_4(slot_513_68_0 + slot_0_147_1(slot_513_68_0, slot_513_66_0, slot_513_24_0, slot_513_25_0, 2), 0, slot_513_69_0)
				else
					slot_513_61_0 = slot_0_109_4(slot_513_21_0, 0, 60)
				end
			else
				slot_513_60_0 = slot_0_109_4(slot_513_20_0, 0, 60)
				slot_513_61_0 = slot_0_109_4(slot_513_21_0, 0, 60)
			end
		end

		if slot_0_11_0.aa.angles.body_yaw ~= nil then
			slot_0_11_0.aa.angles.body_yaw:override(slot_513_59_1)
		end

		if slot_513_59_1 == true then
			if slot_0_11_0.aa.angles.left_limit ~= nil then
				slot_0_11_0.aa.angles.left_limit:override(slot_0_109_4(math.floor(slot_513_60_0), 0, 60))
			end

			if slot_0_11_0.aa.angles.right_limit ~= nil then
				slot_0_11_0.aa.angles.right_limit:override(slot_0_109_4(math.floor(slot_513_61_0), 0, 60))
			end
		else
			if slot_0_11_0.aa.angles.left_limit ~= nil then
				slot_0_11_0.aa.angles.left_limit:override()
			end

			if slot_0_11_0.aa.angles.right_limit ~= nil then
				slot_0_11_0.aa.angles.right_limit:override()
			end
		end
	end

	slot_513_59_0 = slot_0_11_0.rage and slot_0_11_0.rage.main

	if slot_513_59_0 ~= nil and slot_0_50_13.is_defensive_active ~= true then
		if slot_513_59_0.double_tap_lag_options ~= nil then
			if slot_513_40_0 then
				slot_513_59_0.double_tap_lag_options:override("Always On")
			else
				slot_513_59_0.double_tap_lag_options:override()
			end
		end

		if slot_513_59_0.hide_shots_options ~= nil then
			if slot_513_16_0 then
				slot_513_59_0.hide_shots_options:override("Break LC")
			else
				slot_513_59_0.hide_shots_options:override()
			end
		end
	end
end

slot_0_165_0 = {
	update_player = function(arg_514_0)
		local var_514_0

		if arg_514_0 ~= nil then
			var_514_0 = arg_514_0.choked_commands
		end

		if type(var_514_0) ~= "number" then
			var_514_0 = globals.choked_commands
		end

		if type(var_514_0) ~= "number" then
			var_514_0 = 0
		end

		if var_514_0 == 0 and slot_0_162_0(arg_514_0) ~= true then
			slot_0_50_13.sent_packets = slot_0_50_13.sent_packets + 1
		end
	end
}

function slot_0_165_0.on_createmove(arg_515_0)
	slot_0_165_0.update_player(arg_515_0)
	slot_0_130_2(arg_515_0)
	slot_0_163_0.update(arg_515_0)

	if slot_0_51_12 ~= nil then
		slot_0_51_12(arg_515_0)
	end

	slot_0_17_0.update(arg_515_0)
	slot_0_164_0(arg_515_0)
end

function slot_0_165_0.on_shutdown()
	local var_516_0 = slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.freestanding

	if var_516_0 ~= nil then
		var_516_0:override()
	end

	local var_516_1 = slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.avoid_backstab

	if var_516_1 ~= nil then
		var_516_1:override()
	end

	slot_0_151_1()
	slot_0_17_0.shutdown()
end

events.createmove(slot_0_165_0.on_createmove)
events.round_end(function()
	slot_0_149_1.round_end_active = true
end, true)
events.round_prestart(function()
	slot_0_149_1.round_end_active = false
end, true)
events.round_start(function()
	slot_0_149_1.round_end_active = false
end, true)

slot_0_166_0 = {
	sv_maxcmds = cvar.sv_maxusrcmdprocessticks,
	data = {
		last_spawn_time = 0,
		last_alive = false,
		ticks_processed = 0,
		tickbase_diff = 0,
		max_tickbase = 0
	}
}

function slot_0_166_0.reset()
	local var_520_0 = slot_0_166_0.data

	var_520_0.max_tickbase = 0
	var_520_0.tickbase_diff = 0
	var_520_0.ticks_processed = 0
	var_520_0.last_alive = false
	var_520_0.last_spawn_time = 0
	slot_0_50_13.is_defensive_active = false
end

function slot_0_51_12(arg_521_0)
	local var_521_0 = slot_0_166_0.data
	local var_521_1 = entity.get_local_player()

	if var_521_1 == nil then
		slot_0_166_0.reset()

		return
	end

	local var_521_2 = var_521_1:is_alive() == true

	if var_521_2 ~= var_521_0.last_alive then
		var_521_0.max_tickbase = 0
		var_521_0.tickbase_diff = 0
		var_521_0.ticks_processed = 0
		var_521_0.last_alive = var_521_2
		slot_0_50_13.is_defensive_active = false

		return
	end

	if var_521_2 ~= true then
		slot_0_50_13.is_defensive_active = false

		return
	end

	local var_521_3 = var_521_1.m_flSpawnTime

	if var_521_3 ~= var_521_0.last_spawn_time then
		var_521_0.max_tickbase = 0
		var_521_0.tickbase_diff = 0
		var_521_0.ticks_processed = 0
		var_521_0.last_spawn_time = var_521_3
		slot_0_50_13.is_defensive_active = false

		return
	end

	local var_521_4 = var_521_1.m_nTickBase

	if type(var_521_4) ~= "number" then
		slot_0_166_0.reset()

		return
	end

	local var_521_5 = 0

	if arg_521_0 ~= nil and type(arg_521_0.choked_commands) == "number" then
		var_521_5 = arg_521_0.choked_commands
	elseif type(globals.choked_commands) == "number" then
		var_521_5 = globals.choked_commands
	end

	local var_521_6 = 0

	if slot_0_166_0.sv_maxcmds ~= nil then
		local var_521_7 = slot_0_166_0.sv_maxcmds:int()

		if type(var_521_7) == "number" then
			var_521_6 = math.abs(var_521_7) - 1
		end
	end

	if var_521_6 <= 1 then
		var_521_0.tickbase_diff = 0
		var_521_0.ticks_processed = 0
		slot_0_50_13.is_defensive_active = false

		return
	end

	if var_521_4 > var_521_0.max_tickbase and var_521_5 == 0 then
		if var_521_6 < math.abs(var_521_4 - var_521_0.max_tickbase) then
			var_521_0.max_tickbase = var_521_4
			var_521_0.tickbase_diff = 0
			var_521_0.ticks_processed = 0
			slot_0_50_13.is_defensive_active = false

			return
		end

		var_521_0.max_tickbase = var_521_4
	end

	var_521_0.tickbase_diff = math.max(var_521_0.max_tickbase - var_521_4, 0)
	var_521_0.ticks_processed = math.min(var_521_0.tickbase_diff, var_521_6 - var_521_5)
	slot_0_50_13.is_defensive_active = var_521_0.ticks_processed > 1 and var_521_6 > var_521_0.ticks_processed
end

events.level_init(function()
	slot_0_149_1.round_end_active = false

	slot_0_166_0.reset()
	slot_0_151_1()
end)
events.shutdown(slot_0_165_0.on_shutdown, true)

function slot_0_15_0.set_visibility(arg_523_0)
	slot_0_49_9.is_builder_visible = arg_523_0 == true

	if slot_0_49_9.is_builder_visible ~= true then
		slot_0_41_5:visibility(true)
		slot_0_53_17:visibility(false)
		slot_0_84_6()
		slot_0_87_6()

		return
	end

	if slot_0_49_9.is_condition_menu_open == true then
		slot_0_41_5:visibility(true)
		slot_0_87_6()
		slot_0_84_6()
		slot_0_53_17:visibility(true)

		local var_523_0 = slot_0_61_20.get_layout_view(slot_0_49_9.active_team_index, slot_0_49_9.active_condition_index)

		if var_523_0 ~= nil then
			slot_0_82_7(var_523_0, true)
		end

		return
	end

	slot_0_88_6()
end

slot_0_19_1 = nil
slot_0_20_1 = slot_0_12_0.ui_symbols
slot_0_21_1 = slot_0_15_0.get_section_list()
slot_0_22_1 = false
slot_0_19_0 = {}
slot_0_23_1 = ui.create(slot_0_12_0.angles, slot_0_8_0.get("key", 1, 3, "{Link Active}") .. "Additionals", 2)
slot_0_24_1 = ui.create(slot_0_12_0.angles, slot_0_8_0.get("puzzle-piece", 1, 3, "{Link Active}") .. "Other", 1)
slot_0_25_1 = ui.create(slot_0_12_0.angles, slot_0_8_0.get("shield", 1, 3, "{Link Active}") .. "Defense", 2)
slot_0_26_2 = ui.create(slot_0_12_0.angles, slot_0_8_0.get("flask", 1, 3, "{Link Active}") .. "Exploits", 2)
slot_0_27_3 = nil
slot_0_28_3 = nil
slot_0_29_5 = nil
slot_0_15_0.manual_yaw_refs.direction = slot_0_13_0.push(slot_0_23_1:combo(slot_0_20_1.prefix_dot .. "   Manuals", {
	"Disabled",
	"Left",
	"Right",
	"Forward"
}), "angles_hotkeys_manual_direction")
slot_0_30_8 = nil

if slot_0_15_0.manual_yaw_refs.direction ~= nil then
	slot_0_30_8 = slot_0_15_0.manual_yaw_refs.direction:create()
end

if slot_0_30_8 ~= nil then
	slot_0_15_0.manual_yaw_mode_ref = slot_0_13_0.push(slot_0_30_8:combo(slot_0_20_1.prefix_dot .. "   Mode", {
		"Default",
		"Static"
	}), "angles_hotkeys_manual_mode")
	slot_0_15_0.manual_yaw_arrows_ref = slot_0_13_0.push(slot_0_30_8:combo(slot_0_20_1.prefix_dot .. "   Arrows", {
		"Disabled",
		"Classic",
		"Modern"
	}), "angles_hotkeys_manual_arrows")
end

if slot_0_30_8 ~= nil and slot_0_15_0.manual_yaw_arrows_ref ~= nil then
	slot_0_15_0.manual_yaw_arrows_offset_ref = slot_0_13_0.push(slot_0_30_8:slider(slot_0_20_1.prefix_arrow .. "   Offset", 10, 300, 40, 1), "angles_hotkeys_manual_arrows_offset")
	slot_0_31_10 = slot_0_30_8:label(slot_0_20_1.prefix_dot .. "   Color")
	slot_0_15_0.manual_yaw_arrows_simple_color_ref = slot_0_13_0.push(slot_0_31_10:color_picker(color(175, 255, 55, 255)), "angles_hotkeys_manual_arrows_simple_color")
end

slot_0_15_0.freestanding_refs.hotkey = slot_0_13_0.push(slot_0_23_1:switch(slot_0_20_1.prefix_dot .. "   Freestanding"), "angles_hotkeys_freestanding_switch")
slot_0_30_7 = nil

if slot_0_15_0.freestanding_refs.hotkey ~= nil then
	slot_0_30_7 = slot_0_15_0.freestanding_refs.hotkey:create()
end

if slot_0_30_7 ~= nil then
	slot_0_15_0.freestanding_refs.disablers = slot_0_13_0.push(slot_0_30_7:selectable(slot_0_20_1.prefix_dot .. "   Disablers", {
		"Standing",
		"Jumping",
		"Fake Duck",
		"Crouching",
		"Slow-Motion"
	}), "angles_hotkeys_freestanding_disablers")
	slot_0_15_0.freestanding_refs.tweaks = slot_0_13_0.push(slot_0_30_7:selectable(slot_0_20_1.prefix_dot .. "   Tweaks", {
		"Prefer on Manual",
		"Static"
	}), "angles_hotkeys_freestanding_tweaks")
end

slot_0_15_0.manual_yaw_arrows_style = "Disabled"
slot_0_15_0.manual_yaw_arrows_padding = 40
slot_0_15_0.manual_yaw_arrows_font_classic = render.load_font("Verdana", 14, "a")
slot_0_15_0.manual_yaw_arrows_font_modern = render.load_font("Verdana", 27, "ab")

function slot_0_15_0.manual_arrows_render()
	slot_524_0_0 = entity.get_local_player()

	if slot_524_0_0 == nil or not slot_524_0_0:is_alive() then
		return
	end

	slot_524_1_0 = slot_0_15_0.manual_yaw_arrows_style

	if slot_524_1_0 == "Disabled" then
		return
	end

	slot_524_2_0 = slot_0_15_0.manual_yaw_toggle_state.left == true
	slot_524_3_0 = slot_0_15_0.manual_yaw_toggle_state.right == true
	slot_524_4_0 = slot_0_15_0.manual_yaw_toggle_state.forward == true

	if slot_524_2_0 ~= true and slot_524_3_0 ~= true and slot_524_4_0 ~= true then
		return
	end

	slot_524_6_0 = render.screen_size() * 0.5
	slot_524_7_0 = color(175, 255, 55, 255)

	if slot_0_15_0.manual_yaw_arrows_simple_color_ref ~= nil then
		slot_524_8_1 = slot_0_15_0.manual_yaw_arrows_simple_color_ref:get()

		if slot_524_8_1 ~= nil then
			slot_524_7_0 = slot_524_8_1
		end
	end

	slot_524_8_0 = slot_0_15_0.manual_yaw_arrows_padding

	if slot_0_15_0.manual_yaw_arrows_offset_ref ~= nil then
		slot_524_9_6 = slot_0_15_0.manual_yaw_arrows_offset_ref:get()

		if type(slot_524_9_6) == "number" then
			slot_524_8_0 = slot_524_9_6
		end
	end

	if slot_524_1_0 == "Classic" then
		if slot_524_2_0 then
			slot_524_9_5 = "<"
			slot_524_10_5 = render.measure_text(slot_0_15_0.manual_yaw_arrows_font_classic, "s", slot_524_9_5)
			slot_524_11_5 = vector(slot_524_6_0.x - slot_524_10_5.x - slot_524_8_0 + 1, slot_524_6_0.y - slot_524_10_5.y * 0.5 - 1)

			render.text(slot_0_15_0.manual_yaw_arrows_font_classic, slot_524_11_5, slot_524_7_0, "s", slot_524_9_5)
		end

		if slot_524_3_0 then
			slot_524_9_4 = ">"
			slot_524_10_4 = render.measure_text(slot_0_15_0.manual_yaw_arrows_font_classic, "s", slot_524_9_4)
			slot_524_11_4 = vector(slot_524_6_0.x + slot_524_8_0, slot_524_6_0.y - slot_524_10_4.y * 0.5 - 1)

			render.text(slot_0_15_0.manual_yaw_arrows_font_classic, slot_524_11_4, slot_524_7_0, "s", slot_524_9_4)
		end

		if slot_524_4_0 then
			slot_524_9_3 = "^"
			slot_524_10_3 = render.measure_text(slot_0_15_0.manual_yaw_arrows_font_classic, "s", slot_524_9_3)
			slot_524_11_3 = vector(slot_524_6_0.x - slot_524_10_3.x * 0.5, slot_524_6_0.y - slot_524_8_0)

			render.text(slot_0_15_0.manual_yaw_arrows_font_classic, slot_524_11_3, slot_524_7_0, "s", slot_524_9_3)
		end

		return
	end

	if slot_524_1_0 == "Modern" then
		if slot_524_2_0 then
			slot_524_9_2 = "⮜"
			slot_524_10_2 = render.measure_text(slot_0_15_0.manual_yaw_arrows_font_modern, "s", slot_524_9_2)
			slot_524_11_2 = vector(slot_524_6_0.x - slot_524_10_2.x - slot_524_8_0 + 1, slot_524_6_0.y - slot_524_10_2.y * 0.5 - 1)

			render.text(slot_0_15_0.manual_yaw_arrows_font_modern, slot_524_11_2, slot_524_7_0, "s", slot_524_9_2)
		end

		if slot_524_3_0 then
			slot_524_9_1 = "⮞"
			slot_524_10_1 = render.measure_text(slot_0_15_0.manual_yaw_arrows_font_modern, "s", slot_524_9_1)
			slot_524_11_1 = vector(slot_524_6_0.x + slot_524_8_0, slot_524_6_0.y - slot_524_10_1.y * 0.5 - 1)

			render.text(slot_0_15_0.manual_yaw_arrows_font_modern, slot_524_11_1, slot_524_7_0, "s", slot_524_9_1)
		end

		if slot_524_4_0 then
			slot_524_9_0 = "⮝"
			slot_524_10_0 = render.measure_text(slot_0_15_0.manual_yaw_arrows_font_modern, "s", slot_524_9_0)
			slot_524_11_0 = vector(slot_524_6_0.x - slot_524_10_0.x * 0.5, slot_524_6_0.y - slot_524_8_0)

			render.text(slot_0_15_0.manual_yaw_arrows_font_modern, slot_524_11_0, slot_524_7_0, "s", slot_524_9_0)
		end

		return
	end
end

function slot_0_15_0.update_manual_arrows_event()
	local var_525_0 = false
	local var_525_1 = "Disabled"

	if slot_0_15_0.manual_yaw_arrows_ref ~= nil then
		local var_525_2 = slot_0_15_0.manual_yaw_arrows_ref:get()

		if type(var_525_2) == "string" and var_525_2 ~= "" then
			var_525_1 = var_525_2
		end
	end

	if var_525_1 ~= "Disabled" and var_525_1 ~= "Classic" and var_525_1 ~= "Modern" then
		var_525_1 = "Disabled"
	end

	local var_525_3 = var_525_1 ~= "Disabled"

	slot_0_15_0.manual_yaw_arrows_style = var_525_1

	events.render(slot_0_15_0.manual_arrows_render, var_525_3)
end

if slot_0_15_0.manual_yaw_arrows_ref ~= nil then
	slot_0_15_0.manual_yaw_arrows_ref:set_callback(slot_0_15_0.update_manual_arrows_event, true)
end

if slot_0_15_0.manual_yaw_refs.direction ~= nil then
	slot_0_15_0.manual_yaw_refs.direction:set_callback(slot_0_15_0.manual_yaw.update_toggle_state, true)
end

slot_0_27_2 = slot_0_13_0.push(slot_0_24_1:switch("##unlock_fast_fake_duck", false), "angles_features_unlock_fake_duck_speed")

if slot_0_27_2 ~= nil then
	slot_0_27_2:visibility(false)
end

slot_0_28_2 = slot_0_13_0.push(slot_0_24_1:switch("##unlock_freezetime_fake_duck", false), "angles_features_freezetime_aa")

if slot_0_28_2 ~= nil then
	slot_0_28_2:visibility(false)
end

slot_0_29_4 = slot_0_24_1:selectable(slot_0_20_1.prefix_dot .. "   Unlockers", {
	"Fast Fake Duck",
	"Freezetime Fake Duck"
})

function slot_0_30_6(arg_526_0, arg_526_1)
	if arg_526_0 == nil then
		return false
	end

	local var_526_0 = arg_526_0:get(arg_526_1)

	if type(var_526_0) == "boolean" then
		return var_526_0
	end

	local var_526_1 = arg_526_0:get()

	if type(var_526_1) ~= "table" then
		return false
	end

	return contains(var_526_1, arg_526_1)
end

function slot_0_31_9()
	local var_527_0 = {}

	if slot_0_27_2 ~= nil and slot_0_27_2:get() == true then
		var_527_0[#var_527_0 + 1] = "Fast Fake Duck"
	end

	if slot_0_28_2 ~= nil and slot_0_28_2:get() == true then
		var_527_0[#var_527_0 + 1] = "Freezetime Fake Duck"
	end

	return var_527_0
end

function slot_0_32_10(arg_528_0)
	if arg_528_0 == nil then
		return
	end

	if slot_0_27_2 ~= nil then
		slot_0_27_2:set(slot_0_30_6(arg_528_0, "Fast Fake Duck"))
	end

	if slot_0_28_2 ~= nil then
		slot_0_28_2:set(slot_0_30_6(arg_528_0, "Freezetime Fake Duck"))
	end
end

if slot_0_29_4 ~= nil then
	slot_0_29_4:set(slot_0_31_9())
	slot_0_29_4:set_callback(slot_0_32_10, true)
end

slot_0_30_5 = slot_0_15_0.other_aa_refs
slot_0_30_5.disable_on = slot_0_13_0.push(slot_0_24_1:selectable(slot_0_20_1.prefix_dot .. "   Disablers", {
	"Warmup",
	"Round End"
}), "angles_features_other_disable_on")

if slot_0_30_5.disable_on ~= nil then
	slot_0_31_8 = slot_0_30_5.disable_on:create()
	slot_0_30_5.pitch_mode = slot_0_13_0.push(slot_0_31_8:combo(slot_0_20_1.prefix_dot .. "   Pitch", {
		"Disabled",
		"Down",
		"Static",
		"Random",
		"Spin",
		"Switch"
	}), "angles_features_other_pitch_mode")
	slot_0_30_5.pitch_static = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Static Pitch", -89, 89, 0), "angles_features_other_pitch_static")
	slot_0_30_5.pitch_random_min = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Random Min", -89, 89, -89), "angles_features_other_pitch_random_min")
	slot_0_30_5.pitch_random_max = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Random Max", -89, 89, 89), "angles_features_other_pitch_random_max")
	slot_0_30_5.pitch_spin_min = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Spin Min", -89, 89, -89), "angles_features_other_pitch_spin_min")
	slot_0_30_5.pitch_spin_max = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Spin Max", -89, 89, 89), "angles_features_other_pitch_spin_max")
	slot_0_30_5.pitch_spin_speed = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Spin Speed", 1, 720, 260, nil, " deg"), "angles_features_other_pitch_spin_speed")
	slot_0_30_5.pitch_switch_first = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Switch First", -89, 89, -89), "angles_features_other_pitch_switch_first")
	slot_0_30_5.pitch_switch_second = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Switch Second", -89, 89, 89), "angles_features_other_pitch_switch_second")
	slot_0_30_5.pitch_switch_delay = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Delay", 1, 16, 1, nil, " t"), "angles_features_other_pitch_switch_delay")
	slot_0_30_5.yaw_mode = slot_0_13_0.push(slot_0_31_8:combo(slot_0_20_1.prefix_dot .. "   Yaw", {
		"Disabled",
		"Spin",
		"Static",
		"Random"
	}), "angles_features_other_yaw_mode")

	if slot_0_30_5.yaw_mode ~= nil then
		slot_0_32_9 = slot_0_30_5.yaw_mode:get()

		if type(slot_0_32_9) ~= "string" or slot_0_32_9 == "" then
			slot_0_30_5.yaw_mode:set("Disabled")
		end
	end

	slot_0_30_5.yaw_static = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Static Yaw", -180, 180, 180), "angles_features_other_yaw_static")
	slot_0_30_5.yaw_random_min = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Random Min", -180, 180, -180), "angles_features_other_yaw_random_min")
	slot_0_30_5.yaw_random_max = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Random Max", -180, 180, 180), "angles_features_other_yaw_random_max")
	slot_0_30_5.yaw_spin_speed = slot_0_13_0.push(slot_0_31_8:slider(slot_0_20_1.prefix_arrow .. "   Spin Speed", 1, 2000, 1000, nil, " deg"), "angles_features_other_yaw_spin_speed")
	slot_0_30_5.disablers = slot_0_13_0.push(slot_0_31_8:selectable(slot_0_20_1.prefix_dot .. "   Disablers", {
		"Body Yaw",
		"Fakelag"
	}), "angles_features_other_disablers")
end

function slot_0_31_7()
	local var_529_0 = "Disabled"
	local var_529_1 = "Disabled"

	if slot_0_30_5.pitch_mode ~= nil then
		local var_529_2 = slot_0_30_5.pitch_mode:get()

		if type(var_529_2) == "string" and var_529_2 ~= "" then
			var_529_0 = var_529_2
		end
	end

	if slot_0_30_5.yaw_mode ~= nil then
		local var_529_3 = slot_0_30_5.yaw_mode:get()

		if type(var_529_3) == "string" and var_529_3 ~= "" then
			var_529_1 = var_529_3
		end
	end

	local var_529_4 = var_529_0 == "Static"
	local var_529_5 = var_529_0 == "Random"
	local var_529_6 = var_529_0 == "Spin"
	local var_529_7 = var_529_0 == "Switch"
	local var_529_8 = var_529_1 == "Static"
	local var_529_9 = var_529_1 == "Random"
	local var_529_10 = var_529_1 == "Spin"

	if slot_0_30_5.pitch_static ~= nil then
		slot_0_30_5.pitch_static:visibility(var_529_4)
	end

	if slot_0_30_5.pitch_random_min ~= nil then
		slot_0_30_5.pitch_random_min:visibility(var_529_5)
	end

	if slot_0_30_5.pitch_random_max ~= nil then
		slot_0_30_5.pitch_random_max:visibility(var_529_5)
	end

	if slot_0_30_5.pitch_spin_min ~= nil then
		slot_0_30_5.pitch_spin_min:visibility(var_529_6)
	end

	if slot_0_30_5.pitch_spin_max ~= nil then
		slot_0_30_5.pitch_spin_max:visibility(var_529_6)
	end

	if slot_0_30_5.pitch_spin_speed ~= nil then
		slot_0_30_5.pitch_spin_speed:visibility(var_529_6)
	end

	if slot_0_30_5.pitch_switch_first ~= nil then
		slot_0_30_5.pitch_switch_first:visibility(var_529_7)
	end

	if slot_0_30_5.pitch_switch_second ~= nil then
		slot_0_30_5.pitch_switch_second:visibility(var_529_7)
	end

	if slot_0_30_5.pitch_switch_delay ~= nil then
		slot_0_30_5.pitch_switch_delay:visibility(var_529_7)
	end

	if slot_0_30_5.yaw_static ~= nil then
		slot_0_30_5.yaw_static:visibility(var_529_8)
	end

	if slot_0_30_5.yaw_random_min ~= nil then
		slot_0_30_5.yaw_random_min:visibility(var_529_9)
	end

	if slot_0_30_5.yaw_random_max ~= nil then
		slot_0_30_5.yaw_random_max:visibility(var_529_9)
	end

	if slot_0_30_5.yaw_spin_speed ~= nil then
		slot_0_30_5.yaw_spin_speed:visibility(var_529_10)
	end
end

if slot_0_30_5.pitch_mode ~= nil then
	slot_0_30_5.pitch_mode:set_callback(slot_0_31_7, true)
end

if slot_0_30_5.yaw_mode ~= nil then
	slot_0_30_5.yaw_mode:set_callback(slot_0_31_7, true)
end

slot_0_30_4 = nil

function slot_0_31_6(arg_530_0)
	local var_530_0 = entity.get_local_player()

	if var_530_0 == nil then
		return
	end

	local var_530_1 = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.fake_duck

	if var_530_1 == nil or var_530_1:get() ~= true then
		return
	end

	local var_530_2 = arg_530_0.forwardmove
	local var_530_3 = arg_530_0.sidemove

	if math.abs(var_530_2) <= 5 and math.abs(var_530_3) <= 5 then
		return
	end

	if var_530_0.m_flDuckAmount == 1 then
		return
	end

	local var_530_4 = 140 / (var_530_2 * var_530_2 + var_530_3 * var_530_3)^0.5

	arg_530_0.forwardmove = var_530_2 * var_530_4
	arg_530_0.sidemove = var_530_3 * var_530_4
end

slot_0_32_8 = nil

function slot_0_33_7(arg_531_0)
	local var_531_0 = false

	if arg_531_0 ~= nil then
		local var_531_1, var_531_2 = pcall(arg_531_0.get, arg_531_0)

		var_531_0 = var_531_1 and var_531_2 == true
	end

	events.createmove_run(slot_0_31_6, var_531_0)
end

if slot_0_27_2 ~= nil then
	slot_0_27_2:set_callback(slot_0_33_7, true)
end

slot_0_31_5 = nil
slot_0_32_7 = false

function slot_0_33_6()
	if slot_0_32_7 ~= true then
		return
	end

	local var_532_0 = entity.get_game_rules()

	if var_532_0 ~= nil then
		var_532_0.m_bFreezePeriod = true
	end

	local var_532_1 = slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.enabled

	if var_532_1 ~= nil then
		var_532_1:override()
	end

	slot_0_32_7 = false
end

function slot_0_34_5()
	local var_533_0 = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.fake_duck

	if var_533_0 == nil or var_533_0:get() ~= true then
		return
	end

	local var_533_1 = entity.get_game_rules()

	if var_533_1 == nil then
		return
	end

	if var_533_1.m_bFreezePeriod ~= true then
		return
	end

	var_533_1.m_bFreezePeriod = false

	local var_533_2 = slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.enabled

	if var_533_2 ~= nil then
		var_533_2:override(false)
	end

	slot_0_32_7 = true
end

function slot_0_35_5()
	slot_0_33_6()
end

slot_0_36_5 = nil

function slot_0_37_5(arg_535_0)
	local var_535_0 = false

	if arg_535_0 ~= nil then
		local var_535_1, var_535_2 = pcall(arg_535_0.get, arg_535_0)

		var_535_0 = var_535_1 and var_535_2 == true
	end

	events.createmove(slot_0_34_5, var_535_0)
	events.createmove_run(slot_0_35_5, var_535_0)

	if var_535_0 ~= true then
		slot_0_33_6()
	end
end

if slot_0_28_2 ~= nil then
	slot_0_28_2:set_callback(slot_0_37_5, true)
end

events.shutdown(slot_0_33_6, true)

function slot_0_32_6(arg_536_0)
	local var_536_0 = slot_0_11_0.aa and slot_0_11_0.aa.angles and slot_0_11_0.aa.angles.avoid_backstab

	if var_536_0 == nil then
		return
	end

	if arg_536_0 == true then
		var_536_0:override(true)

		return
	end

	var_536_0:override()
end

slot_0_33_5 = false

function slot_0_34_4()
	slot_0_33_5 = false

	local var_537_0 = slot_0_15_0.fake_lag_limit_override_state

	if var_537_0 ~= nil then
		var_537_0.fluctuate = nil
	end

	if slot_0_15_0.apply_fake_lag_limit_override ~= nil then
		slot_0_15_0.apply_fake_lag_limit_override()
	end
end

function slot_0_35_4()
	if rage == nil or rage.exploit == nil then
		return false
	end

	local var_538_0, var_538_1 = pcall(rage.exploit.get, rage.exploit)

	if not var_538_0 or type(var_538_1) ~= "number" then
		return false
	end

	return var_538_1 >= 1
end

function slot_0_36_4(arg_539_0)
	if arg_539_0 == nil then
		return false
	end

	local var_539_0 = arg_539_0:get_weapon_info()

	if var_539_0 == nil then
		return false
	end

	return var_539_0.is_revolver == true
end

function slot_0_37_4(arg_540_0)
	local var_540_0 = slot_0_15_0.fake_lag_limit_override_state

	if var_540_0 == nil or slot_0_15_0.apply_fake_lag_limit_override == nil then
		return
	end

	local var_540_1 = entity.get_local_player()

	if var_540_1 ~= nil then
		local var_540_2 = var_540_1:get_player_weapon()

		if slot_0_36_4(var_540_2) then
			slot_0_34_4()

			return
		end
	end

	if slot_0_35_4() then
		if slot_0_33_5 then
			slot_0_34_4()
		else
			var_540_0.fluctuate = nil

			slot_0_15_0.apply_fake_lag_limit_override()
		end

		return
	end

	var_540_0.fluctuate = nil

	local var_540_3 = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.fake_duck

	if var_540_3 ~= nil and var_540_3:get() == true then
		slot_0_15_0.apply_fake_lag_limit_override()

		return
	end

	local var_540_4 = 0

	if arg_540_0 ~= nil then
		local var_540_5 = arg_540_0.choked_commands

		if type(var_540_5) == "number" then
			var_540_4 = var_540_5
		end
	end

	if var_540_4 == 0 then
		slot_0_33_5 = not slot_0_33_5
	end

	if slot_0_33_5 then
		var_540_0.fluctuate = 1
	end

	slot_0_15_0.apply_fake_lag_limit_override()
end

slot_0_38_4 = slot_0_13_0.push(slot_0_25_1:switch(slot_0_20_1.prefix_dot .. "   Avoid Backstab", false), "angles_features_avoid_backstab")

if slot_0_38_4 ~= nil then
	slot_0_38_4:set_callback(function(arg_541_0)
		slot_0_32_6(arg_541_0:get() == true)
	end, true)
end

slot_0_39_4 = slot_0_13_0.push(slot_0_25_1:switch(slot_0_20_1.prefix_dot .. "   Safe Head", false), "angles_features_safe_head")

if slot_0_39_4 ~= nil then
	slot_0_40_5 = slot_0_39_4:create()

	if slot_0_40_5 ~= nil then
		slot_0_41_4 = slot_0_40_5:selectable(slot_0_20_1.prefix_dot .. "   States", slot_0_17_0.get_states())
		slot_0_15_0.safe_head_refs.states = slot_0_13_0.push(slot_0_41_4, "angles_features_safe_head_states")
		slot_0_42_3 = slot_0_40_5:selectable("", {
			"Freestanding",
			"Manuals",
			"Lethal"
		})
		slot_0_15_0.safe_head_refs.disable_on = slot_0_13_0.push(slot_0_42_3, "angles_features_safe_head_disable_on")
	end

	slot_0_39_4:set_callback(function(arg_542_0)
		slot_0_17_0.set_enabled(arg_542_0:get() == true)
	end, true)
end

slot_0_40_4 = slot_0_13_0.push(slot_0_25_1:switch(slot_0_20_1.prefix_dot .. "   Fluctuate Fakelag", false), "angles_features_fluctuate_fake_lags")

if slot_0_40_4 ~= nil then
	slot_0_40_4:set_callback(function(arg_543_0)
		local var_543_0 = false

		if arg_543_0 ~= nil then
			local var_543_1, var_543_2 = pcall(arg_543_0.get, arg_543_0)

			var_543_0 = var_543_1 and var_543_2 == true
		end

		events.createmove(slot_0_37_4, var_543_0)

		if var_543_0 ~= true then
			slot_0_34_4()
		end
	end, true)
end

;(function()
	local function var_544_0(arg_545_0, arg_545_1)
		if arg_545_0 == nil or type(arg_545_1) ~= "string" then
			return false
		end

		local var_545_0, var_545_1 = pcall(arg_545_0.get, arg_545_0, arg_545_1)

		if var_545_0 == true and type(var_545_1) == "boolean" then
			return var_545_1
		end

		local var_545_2, var_545_3 = pcall(arg_545_0.get, arg_545_0)

		if var_545_2 ~= true or type(var_545_3) ~= "table" then
			return false
		end

		for iter_545_0 = 1, #var_545_3 do
			if var_545_3[iter_545_0] == arg_545_1 then
				return true
			end
		end

		return false
	end

	local function var_544_1(arg_546_0)
		if arg_546_0 == nil then
			return false
		end

		local var_546_0, var_546_1 = pcall(arg_546_0.get, arg_546_0)

		return var_546_0 == true and type(var_546_1) == "table" and #var_546_1 > 0
	end

	local function var_544_2(arg_547_0)
		if arg_547_0 == nil then
			return false
		end

		local var_547_0 = arg_547_0.m_vecVelocity
		local var_547_1 = 0

		if var_547_0 ~= nil and var_547_0.length2d ~= nil then
			var_547_1 = var_547_0:length2d()
		end

		local var_547_2 = arg_547_0.m_fFlags
		local var_547_3 = false

		if type(var_547_2) == "number" then
			if bit ~= nil and bit.band ~= nil then
				var_547_3 = bit.band(var_547_2, 1) == 1
			else
				var_547_3 = var_547_2 % 2 == 1
			end
		end

		return var_547_1 < 2 and var_547_3 == true
	end

	local function var_544_3(arg_548_0)
		local var_548_0 = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.double_tap
		local var_548_1 = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.hide_shots
		local var_548_2 = var_548_0 ~= nil and var_548_0:get() == true
		local var_548_3 = var_548_1 ~= nil and var_548_1:get() == true

		if var_544_0(arg_548_0, "Double Tap") == true and var_548_2 == true then
			return true
		end

		if var_544_0(arg_548_0, "Hide Shots") == true and var_548_3 == true then
			return true
		end

		local var_548_4 = entity.get_local_player()

		if var_548_4 == nil or var_548_4:is_alive() ~= true then
			return false
		end

		return var_544_0(arg_548_0, "Standing") == true and var_544_2(var_548_4) == true
	end

	local function var_544_4(arg_549_0)
		local var_549_0 = slot_0_15_0.fake_lag_enabled_override_state

		if var_549_0 ~= nil then
			if arg_549_0 == true then
				var_549_0.disable_fake_lag = false
			else
				var_549_0.disable_fake_lag = nil
			end
		end

		if slot_0_15_0.apply_fake_lag_enabled_override ~= nil then
			slot_0_15_0.apply_fake_lag_enabled_override()
		end
	end

	local function var_544_5()
		var_544_4(false)
	end

	local var_544_6 = slot_0_13_0.push(slot_0_25_1:selectable(slot_0_20_1.prefix_dot .. "   Disable Fake Lag", {
		"Double Tap",
		"Hide Shots",
		"Standing"
	}), "angles_features_disable_fake_lag")

	local function var_544_7()
		var_544_4(var_544_3(var_544_6))
	end

	if var_544_6 ~= nil then
		var_544_6:set_callback(function(arg_552_0)
			local var_552_0 = var_544_1(arg_552_0)

			events.createmove(var_544_7, var_552_0)

			if var_552_0 ~= true then
				var_544_5()
			end
		end, true)
	end

	events.shutdown(var_544_5, true)
end)()
events.shutdown(slot_0_34_4, true)

function slot_0_32_5(arg_553_0)
	slot_0_19_0.applied_index = arg_553_0

	local var_553_0 = arg_553_0 == 1
	local var_553_1 = arg_553_0 == 2
	local var_553_2 = arg_553_0 == 3

	if slot_0_15_0 ~= nil and slot_0_15_0.set_visibility ~= nil then
		slot_0_15_0.set_visibility(var_553_0)
	end

	slot_0_23_1:visibility(var_553_1)
	slot_0_24_1:visibility(var_553_2)
	slot_0_25_1:visibility(var_553_2)
	slot_0_26_2:visibility(var_553_2)
end

function slot_0_33_4()
	local var_554_0 = slot_0_21_1:get()

	slot_0_22_1 = true

	slot_0_15_0.update_section_items(var_554_0)
	slot_0_21_1:set(var_554_0)

	slot_0_22_1 = false

	slot_0_32_5(var_554_0)
end

slot_0_21_1:set_callback(function()
	if slot_0_22_1 then
		return
	end

	slot_0_33_4()
end, true)

slot_0_20_0 = {}
slot_0_21_0 = {
	dormant_aimbot = {},
	force_shot = {},
	ai_peek = {
		active = false
	},
	auto_unpeek = {}
}
slot_0_22_0 = {}
slot_0_23_0 = {}
slot_0_24_0 = "HITCHANCE OVR"
slot_0_25_0 = {
	position_max = 4000,
	position = 350,
	shadow_alpha = 50
}
slot_0_26_1 = nil
slot_0_27_1 = {
	"A",
	"B",
	"C",
	"D",
	"E"
}

function slot_0_28_1(arg_556_0, arg_556_1)
	local var_556_0 = #arg_556_0.variants + 1

	if var_556_0 > #slot_0_27_1 then
		return
	end

	local var_556_1 = {
		name = slot_0_27_1[var_556_0],
		path = "models/player/custom_player/legacy/" .. arg_556_1 .. ".mdl"
	}

	arg_556_0.variants[#arg_556_0.variants + 1] = var_556_1
	arg_556_0.variant_names[#arg_556_0.variant_names + 1] = var_556_1.name
end

function slot_0_29_3(arg_557_0, arg_557_1, arg_557_2, arg_557_3, arg_557_4, arg_557_5)
	local var_557_0 = {
		name = arg_557_2,
		variants = {},
		variant_names = {}
	}

	if arg_557_5 == true then
		slot_0_28_1(var_557_0, arg_557_3)
	end

	for iter_557_0 = 1, #arg_557_4 do
		slot_0_28_1(var_557_0, arg_557_3 .. "_" .. arg_557_4[iter_557_0])
	end

	arg_557_0[#arg_557_0 + 1] = var_557_0
	arg_557_1[#arg_557_1 + 1] = var_557_0.name
end

slot_0_26_0 = {
	t_families = {},
	ct_families = {},
	t_family_names = {},
	ct_family_names = {}
}

function slot_0_26_0.get_families(arg_558_0)
	if arg_558_0 == "t" then
		return slot_0_26_0.t_families
	end

	if arg_558_0 == "ct" then
		return slot_0_26_0.ct_families
	end

	return {}
end

function slot_0_26_0.get_family_names(arg_559_0)
	if arg_559_0 == "t" then
		return slot_0_26_0.t_family_names
	end

	if arg_559_0 == "ct" then
		return slot_0_26_0.ct_family_names
	end

	return {}
end

function slot_0_26_0.get_variant_names(arg_560_0, arg_560_1)
	local var_560_0 = slot_0_26_0.get_families(arg_560_0)[arg_560_1]

	if var_560_0 == nil or type(var_560_0.variant_names) ~= "table" then
		return {
			"A"
		}
	end

	return var_560_0.variant_names
end

slot_0_29_3(slot_0_26_0.t_families, slot_0_26_0.t_family_names, "Jumpsuit", "tm_jumpsuit", {
	"varianta",
	"variantb",
	"variantc"
}, false)
slot_0_29_3(slot_0_26_0.t_families, slot_0_26_0.t_family_names, "Pirate", "tm_pirate", {
	"varianta",
	"variantb",
	"variantc",
	"variantd"
}, true)
slot_0_29_3(slot_0_26_0.t_families, slot_0_26_0.t_family_names, "Professional", "tm_professional", {
	"var1",
	"var2",
	"var3",
	"var4",
	"varf",
	"varf1",
	"varf2",
	"varf3",
	"varf4",
	"varf5",
	"varg",
	"varh",
	"vari",
	"varj"
}, true)
slot_0_29_3(slot_0_26_0.ct_families, slot_0_26_0.ct_family_names, "FBI", "ctm_fbi", {
	"varianta",
	"variantb",
	"variantc",
	"variantd",
	"variante",
	"variantf",
	"variantg",
	"varianth"
}, true)
slot_0_29_3(slot_0_26_0.ct_families, slot_0_26_0.ct_family_names, "GIGIN", "ctm_gign", {
	"varianta",
	"variantb",
	"variantc",
	"variantd"
}, true)
slot_0_29_3(slot_0_26_0.ct_families, slot_0_26_0.ct_family_names, "GSG9", "ctm_gsg9", {
	"varianta",
	"variantb",
	"variantc",
	"variantd"
}, true)
slot_0_29_3(slot_0_26_0.ct_families, slot_0_26_0.ct_family_names, "SWAT", "ctm_swat", {
	"varianta",
	"variantb",
	"variantc",
	"variantd",
	"variante",
	"variantf",
	"variantg",
	"varianth",
	"varianti",
	"variantj",
	"variantk"
}, true)

slot_0_27_0 = {}
slot_0_28_0 = {}
slot_0_29_2 = false
slot_0_30_3 = false
slot_0_31_4 = false

function slot_0_32_4()
	local var_561_0 = slot_0_29_2 == true or slot_0_30_3 == true

	if slot_0_31_4 == var_561_0 then
		return
	end

	slot_0_31_4 = var_561_0
end

function slot_0_28_0.set_super_toss_active(arg_562_0)
	local var_562_0 = arg_562_0 == true

	if slot_0_29_2 == var_562_0 then
		return
	end

	slot_0_29_2 = var_562_0

	slot_0_32_4()
end

function slot_0_28_0.set_grenade_release_active(arg_563_0)
	local var_563_0 = arg_563_0 == true

	if slot_0_30_3 == var_563_0 then
		return
	end

	slot_0_30_3 = var_563_0

	slot_0_32_4()
end

function slot_0_28_0.is_active()
	return slot_0_31_4 == true
end

slot_0_29_1 = nil
slot_0_30_2 = slot_0_12_0.ui_symbols
slot_0_31_3 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("layer-group", 1, 3, "{Link Active}") .. "Sections", 1)
slot_0_32_3 = {
	"Rage",
	"Visuals",
	"Misc"
}
slot_0_33_3 = {
	"shield-xmark",
	"sparkles",
	"gear"
}

function slot_0_34_3(arg_565_0)
	local var_565_0 = {}

	for iter_565_0 = 1, #slot_0_32_3 do
		local var_565_1 = "{Text Preview}"

		if iter_565_0 == arg_565_0 then
			var_565_1 = "{Link Active}"
		end

		var_565_0[iter_565_0] = slot_0_8_0.get(slot_0_33_3[iter_565_0], 1, 5, var_565_1) .. slot_0_32_3[iter_565_0]
	end

	return var_565_0
end

slot_0_35_3 = slot_0_31_3:list("", slot_0_34_3(1))
slot_0_36_3 = false
slot_0_29_0 = {
	token = 0,
	delay = 0.14
}
slot_0_37_3 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("comments", 1, 3, "{Link Active}") .. "Aimbot Logs##Rage", 1)
slot_0_38_3 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("block-brick-fire", 1, 3, "{Link Active}") .. "Rage##Rage", 2)
slot_0_39_3 = slot_0_38_3
slot_0_40_3 = slot_0_38_3
slot_0_41_3 = slot_0_38_3
slot_0_42_2 = slot_0_38_3
slot_0_43_3 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("rectangles-mixed", 1, 3, "{Link Active}") .. "Indications", 2)
slot_0_44_3 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("sliders", 1, 3, "{Link Active}") .. "Tweaks", 2)
slot_0_45_3 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("gear", 1, 3, "{Link Active}") .. "Model Changer", 1)
slot_0_46_2 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("person-walking", 1, 3, "{Link Active}") .. "Movement", 2)
slot_0_47_8 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("bomb", 1, 3, "{Link Active}") .. "Weapons", 2)
slot_0_48_7 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("house-blank", 1, 3, "{Link Active}") .. "Other##Misc", 2)
slot_0_49_8 = ui.create(slot_0_12_0.misc, slot_0_8_0.get("house-blank", 1, 3, "{Link Active}") .. "Other", 1)
slot_0_21_0.dormant_aimbot.native_ref = slot_0_11_0.rage.main.dormant_aimbot
slot_0_21_0.dormant_aimbot.enabled = slot_0_13_0.push(slot_0_39_3:switch(slot_0_30_2.prefix_dot .. "   Dormant Aimbot", false), "main_rage_dormant_aimbot")
slot_0_50_12 = nil

if slot_0_21_0.dormant_aimbot.enabled ~= nil then
	slot_0_50_12 = slot_0_21_0.dormant_aimbot.enabled:create()
end

if slot_0_50_12 ~= nil then
	slot_0_21_0.dormant_aimbot.hitbox = slot_0_13_0.push(slot_0_50_12:selectable(slot_0_30_2.prefix_dot .. "   Hitbox", {
		"Head",
		"Chest",
		"Stomach",
		"Legs"
	}), "main_rage_dormant_aimbot_hitbox")

	function slot_0_51_11(arg_566_0)
		if arg_566_0 == 0 then
			return "Auto"
		end

		return ("%d%%"):format(arg_566_0)
	end

	slot_0_21_0.dormant_aimbot.accuracy = slot_0_13_0.push(slot_0_50_12:slider(slot_0_30_2.prefix_arrow .. "   Accuracy", 50, 100, 90, 1, "%"), "main_rage_dormant_aimbot_accuracy")
	slot_0_21_0.dormant_aimbot.head_scale = slot_0_13_0.push(slot_0_50_12:slider(slot_0_30_2.prefix_arrow .. "   Head Scale", 0, 100, 0, 1, slot_0_51_11), "main_rage_dormant_aimbot_head_scale")
	slot_0_21_0.dormant_aimbot.body_scale = slot_0_13_0.push(slot_0_50_12:slider(slot_0_30_2.prefix_arrow .. "   Body Scale", 0, 100, 0, 1, slot_0_51_11), "main_rage_dormant_aimbot_body_scale")
end

slot_0_11_0.rage.main.dormant_aimbot = slot_0_21_0.dormant_aimbot.enabled
slot_0_21_0.force_shot.enabled = slot_0_13_0.push(slot_0_40_3:switch(slot_0_30_2.prefix_dot .. "   Force Shoot", false), "main_rage_force_shot_enabled")
slot_0_50_11 = nil

if slot_0_21_0.force_shot.enabled ~= nil then
	slot_0_50_11 = slot_0_21_0.force_shot.enabled:create()
end

if slot_0_50_11 ~= nil then
	slot_0_21_0.force_shot.hit_chance = slot_0_13_0.push(slot_0_50_11:slider(slot_0_30_2.prefix_arrow .. "   Hit Chance", 0, 100, 20, 1, "%"), "main_rage_force_shot_hit_chance")
end

function slot_0_50_10(arg_567_0)
	return string.format("%.2fs", arg_567_0 * 0.01)
end

slot_0_21_0.ai_peek.enabled = slot_0_13_0.push(slot_0_41_3:switch(slot_0_30_2.prefix_dot .. "   AI Peek", false), "main_rage_ai_peek_enabled")
slot_0_51_10 = nil

if slot_0_21_0.ai_peek.enabled ~= nil then
	slot_0_51_10 = slot_0_21_0.ai_peek.enabled:create()
end

if slot_0_51_10 ~= nil then
	slot_0_21_0.ai_peek.weapons = slot_0_13_0.push(slot_0_51_10:selectable(slot_0_30_2.prefix_dot .. "   Weapons", {
		"SSG 08",
		"AWP",
		"Pistol",
		"Desert Eagle"
	}), "main_rage_ai_peek_weapons")
	slot_0_21_0.ai_peek.simulation = slot_0_13_0.push(slot_0_51_10:slider(slot_0_30_2.prefix_arrow .. "   Simulation", 25, 35, 30, 1, slot_0_50_10), "main_rage_ai_peek_simulation")
	slot_0_21_0.ai_peek.rate_limit = slot_0_13_0.push(slot_0_51_10:slider(slot_0_30_2.prefix_arrow .. "   Limit", 0, 30, 9, 1, slot_0_50_10), "main_rage_ai_peek_rate_limit")
	slot_0_21_0.ai_peek.hit_chance = slot_0_13_0.push(slot_0_51_10:slider(slot_0_30_2.prefix_arrow .. "   Hit Chance", 25, 100, 45, 1, "%"), "main_rage_ai_peek_hit_chance")
	slot_0_21_0.ai_peek.ignore_limbs = slot_0_13_0.push(slot_0_51_10:switch(slot_0_30_2.prefix_dot .. "   Ignore Limbs", false), "main_rage_ai_peek_ignore_limbs")
	slot_0_21_0.ai_peek.color = slot_0_13_0.push(slot_0_51_10:color_picker(slot_0_30_2.prefix_dot .. "   Color", color(255, 255, 0, 255)), "main_rage_ai_peek_color")
end

slot_0_21_0.auto_unpeek.enabled = slot_0_13_0.push(slot_0_41_3:switch(slot_0_30_2.prefix_dot .. "   Авто отжималка", false), "main_rage_auto_unpeek_enabled")
slot_0_50_9 = nil

if slot_0_21_0.auto_unpeek.enabled ~= nil then
	slot_0_50_9 = slot_0_21_0.auto_unpeek.enabled:create()
end

function slot_0_51_9(arg_568_0)
	return string.format("%du", arg_568_0)
end

if slot_0_50_9 ~= nil then
	slot_0_21_0.auto_unpeek.mode = slot_0_13_0.push(slot_0_50_9:combo(slot_0_30_2.prefix_dot .. "   Mode", {
		"Aggressive",
		"Legit Safe"
	}), "main_rage_auto_unpeek_mode")
	slot_0_21_0.auto_unpeek.weapons = slot_0_13_0.push(slot_0_50_9:selectable(slot_0_30_2.prefix_dot .. "   Weapons", {
		"SSG 08",
		"Pistol",
		"Desert Eagle"
	}), "main_rage_auto_unpeek_weapons")
	slot_0_21_0.auto_unpeek.options = slot_0_13_0.push(slot_0_50_9:selectable(slot_0_30_2.prefix_dot .. "   Options", {
		"Active with running",
		"Strict anti-bait",
		"Retreat on shot",
		"Vital hitboxes only",
		"Debug overlay",
		"Disable on Peek Assist"
	}), "main_rage_auto_unpeek_options")

	if slot_0_21_0.auto_unpeek.options ~= nil then
		slot_0_52_16, slot_0_53_16 = pcall(slot_0_21_0.auto_unpeek.options.get, slot_0_21_0.auto_unpeek.options)

		if not slot_0_52_16 or type(slot_0_53_16) ~= "table" or next(slot_0_53_16) == nil then
			pcall(slot_0_21_0.auto_unpeek.options.set, slot_0_21_0.auto_unpeek.options, {
				"Active with running",
				"Strict anti-bait",
				"Debug overlay"
			})
		end
	end

	slot_0_21_0.auto_unpeek.simulation = slot_0_13_0.push(slot_0_50_9:slider(slot_0_30_2.prefix_arrow .. "   Simulation", 25, 35, 30, 1, format_ai_peek_time), "main_rage_auto_unpeek_simulation")
	slot_0_21_0.auto_unpeek.rate_limit = slot_0_13_0.push(slot_0_50_9:slider(slot_0_30_2.prefix_arrow .. "   Limit", 0, 3, 2, 1, format_ai_peek_time), "main_rage_auto_unpeek_rate_limit")
	slot_0_21_0.auto_unpeek.radius = slot_0_13_0.push(slot_0_50_9:slider(slot_0_30_2.prefix_arrow .. "   Radius", 18, 120, 42, 1, slot_0_51_9), "main_rage_auto_unpeek_radius")
end

slot_0_21_0.fix_recharge_delay = slot_0_13_0.push(slot_0_42_2:switch(slot_0_30_2.prefix_dot .. "   Fix Recharge Delay", false), "main_rage_fix_recharge_delay")
slot_0_21_0.unlock_ping_spike = slot_0_13_0.push(slot_0_42_2:switch(slot_0_30_2.prefix_dot .. "   Unlock Ping Spike", false), "main_rage_unlock_ping_spike")
slot_0_21_0.logs = slot_0_13_0.push(slot_0_37_3:selectable(slot_0_30_2.prefix_dot .. "   Aimbot Logs", {
	"Damage Dealt",
	"Purchase"
}), "main_rage_logs")

if slot_0_21_0.logs ~= nil then
	slot_0_21_0.logs_accent = slot_0_13_0.push(slot_0_21_0.logs:color_picker(color(255, 0, 0, 255)), "main_rage_logs_accent")
end

slot_0_23_0.gamesense_side_enabled = slot_0_13_0.push(slot_0_43_3:switch(slot_0_30_2.prefix_dot .. "   Feature", false), "main_visuals_indications_gamesense_side")

if slot_0_23_0.gamesense_side_enabled ~= nil then
	slot_0_52_15 = slot_0_23_0.gamesense_side_enabled:create()
	slot_0_23_0.gamesense_side_shadow_alpha = slot_0_13_0.push(slot_0_52_15:slider(slot_0_30_2.prefix_arrow .. "   Shadow", 0, 255, slot_0_25_0.shadow_alpha), "main_visuals_indications_gamesense_side_shadow_alpha")

	slot_0_52_15:button("Reset", function()
		if slot_0_23_0.gamesense_side_shadow_alpha ~= nil then
			slot_0_23_0.gamesense_side_shadow_alpha:set(slot_0_25_0.shadow_alpha)
		end
	end, true)

	slot_0_23_0.gamesense_side_list = slot_0_13_0.push(slot_0_52_15:listable("##Features", {
		"Fake Duck",
		"Double Tap",
		"Hide Shots",
		"Fake Latency",
		"Bomb Information",
		"Freestanding",
		"Dormant Aimbot",
		"Minimum Damage",
		"Force Body Aim",
		"Force Safe Point",
		"Minimum Hitchance"
	}), "main_visuals_indications_gamesense_side_list")
end

slot_0_23_0.min_damage_indicator_enabled = slot_0_13_0.push(slot_0_43_3:switch(slot_0_30_2.prefix_dot .. "   Minimum Damage", false), "main_visuals_indications_min_damage_indicator_enabled")

if slot_0_23_0.min_damage_indicator_enabled ~= nil then
	slot_0_52_14 = slot_0_23_0.min_damage_indicator_enabled:create()
	slot_0_23_0.min_damage_indicator_font = slot_0_13_0.push(slot_0_52_14:combo(slot_0_30_2.prefix_dot .. "   Font", {
		"Default",
		"Small",
		"Bold"
	}), "main_visuals_indications_min_damage_indicator_font")
	slot_0_23_0.min_damage_indicator_color = slot_0_13_0.push(slot_0_52_14:color_picker(slot_0_30_2.prefix_dot .. "   Color", {
		Active = {
			color(255, 255, 255, 255)
		},
		Inactive = {
			color(255, 255, 255, 150)
		}
	}), "main_visuals_indications_min_damage_indicator_color")
	slot_0_23_0.min_damage_indicator_offset = slot_0_13_0.push(slot_0_52_14:slider(slot_0_30_2.prefix_arrow .. "   Offset", 1, 24, 4, nil, "px"), "main_visuals_indications_min_damage_indicator_offset")
end

slot_0_23_0.aspect_ratio_enabled = slot_0_13_0.push(slot_0_44_3:switch(slot_0_30_2.prefix_dot .. "   Aspect Ratio", false), "main_visuals_tweaks_aspect_ratio_enabled")

if slot_0_23_0.aspect_ratio_enabled ~= nil then
	slot_0_52_13 = slot_0_23_0.aspect_ratio_enabled:create()
	slot_0_53_15 = {
		"16:9",
		"16:10",
		"4:3",
		"5:4",
		"3:2"
	}
	slot_0_54_14 = {
		["3:2"] = 150,
		["5:4"] = 125,
		["4:3"] = 133,
		["16:10"] = 160,
		["16:9"] = 177
	}
	slot_0_55_15 = {}

	for iter_0_12 = 1, #slot_0_53_15 do
		slot_0_60_18 = slot_0_53_15[iter_0_12]
		slot_0_55_15[slot_0_54_14[slot_0_60_18]] = slot_0_60_18
	end

	function slot_0_56_13(arg_570_0)
		if arg_570_0 == 0 then
			return "Off"
		end

		local var_570_0 = slot_0_55_15[arg_570_0]

		if var_570_0 == nil then
			return nil
		end

		return "\a{Link Active}" .. var_570_0
	end

	slot_0_23_0.aspect_ratio_proportion = slot_0_13_0.push(slot_0_52_13:slider("##Proportion", 0, 300, 0, 0.01, slot_0_56_13), "main_visuals_tweaks_aspect_ratio_proportion")

	function slot_0_57_15(arg_571_0)
		local var_571_0 = math.ceil(#arg_571_0 * 1.34)

		if var_571_0 <= #arg_571_0 then
			return arg_571_0
		end

		local var_571_1 = var_571_0 - #arg_571_0
		local var_571_2 = math.floor(var_571_1 * 0.5)
		local var_571_3 = var_571_1 - var_571_2

		return string.rep(" ", var_571_2) .. arg_571_0 .. string.rep(" ", var_571_3)
	end

	if slot_0_23_0.aspect_ratio_proportion ~= nil then
		for iter_0_13 = 1, #slot_0_53_15 do
			slot_0_62_19 = slot_0_53_15[iter_0_13]
			slot_0_63_17 = slot_0_54_14[slot_0_62_19]
			slot_0_64_18 = slot_0_57_15(slot_0_62_19)

			slot_0_52_13:button(slot_0_64_18, function()
				slot_0_23_0.aspect_ratio_proportion:set(slot_0_63_17)
			end, true)
		end
	end
end

slot_0_23_0.viewmodel_enabled = slot_0_13_0.push(slot_0_44_3:switch(slot_0_30_2.prefix_dot .. "   Viewmodel", false), "main_visuals_tweaks_viewmodel_enabled")

if slot_0_23_0.viewmodel_enabled ~= nil then
	slot_0_52_12 = slot_0_23_0.viewmodel_enabled:create()
	slot_0_23_0.viewmodel_fov = slot_0_13_0.push(slot_0_52_12:slider(slot_0_30_2.prefix_arrow .. "   FOV", 0, 1000, 600, 0.1), "main_visuals_tweaks_viewmodel_fov")
	slot_0_23_0.viewmodel_offset_x = slot_0_13_0.push(slot_0_52_12:slider(slot_0_30_2.prefix_arrow .. "   X", -100, 100, 10, 0.1), "main_visuals_tweaks_viewmodel_offset_x")
	slot_0_23_0.viewmodel_offset_y = slot_0_13_0.push(slot_0_52_12:slider(slot_0_30_2.prefix_arrow .. "   Y", -100, 100, 10, 0.1), "main_visuals_tweaks_viewmodel_offset_y")
	slot_0_23_0.viewmodel_offset_z = slot_0_13_0.push(slot_0_52_12:slider(slot_0_30_2.prefix_arrow .. "   Z", -100, 100, -10, 0.1), "main_visuals_tweaks_viewmodel_offset_z")
	slot_0_23_0.viewmodel_options = slot_0_13_0.push(slot_0_52_12:selectable("##Options", {
		"Legacy animation",
		"Scope down sight",
		"Opposite knife hand"
	}), "main_visuals_tweaks_viewmodel_options")
end

slot_0_23_0.scope_overlay_enabled = slot_0_13_0.push(slot_0_44_3:switch(slot_0_30_2.prefix_dot .. "   Scope Overlay", false), "main_visuals_other_scope_overlay_enabled")

if slot_0_23_0.scope_overlay_enabled ~= nil then
	slot_0_52_11 = slot_0_23_0.scope_overlay_enabled:create()
	slot_0_23_0.scope_overlay_color = slot_0_13_0.push(slot_0_52_11:label(slot_0_30_2.prefix_dot .. "   Color"):color_picker(color(255, 255, 255, 200)), "main_visuals_other_scope_overlay_color")
	slot_0_23_0.scope_overlay_position = slot_0_13_0.push(slot_0_52_11:slider(slot_0_30_2.prefix_arrow .. "   Position", 0, 500, 105), "main_visuals_other_scope_overlay_position")
	slot_0_23_0.scope_overlay_offset = slot_0_13_0.push(slot_0_52_11:slider(slot_0_30_2.prefix_arrow .. "   Offset", 0, 30, 10), "main_visuals_other_scope_overlay_offset")
	slot_0_23_0.scope_overlay_start_fade = slot_0_13_0.push(slot_0_52_11:slider(slot_0_30_2.prefix_arrow .. "   Start Fade", 0, 50, 50, 1, function(arg_573_0)
		if arg_573_0 == 0 then
			return "Off"
		end

		return arg_573_0 .. "%"
	end), "main_visuals_other_scope_overlay_start_fade")
end

slot_0_23_0.other_features = slot_0_13_0.push(slot_0_48_7:selectable(slot_0_30_2.prefix_dot .. "   Removal", {
	"Sleeves",
	"Arms"
}), "main_visuals_other_features")
slot_0_20_0.preserve_animated_tick_enabled = slot_0_13_0.push(slot_0_48_7:switch(slot_0_30_2.prefix_dot .. "   Preserve Animated Tick", false), "main_misc_preserve_animated_tick")

function slot_0_52_10(arg_574_0, arg_574_1, arg_574_2)
	local var_574_0 = slot_0_13_0.push(slot_0_45_3:switch(slot_0_30_2.prefix_dot .. "   " .. arg_574_1, false), arg_574_2 .. "_enabled")

	if var_574_0 == nil then
		return nil, nil, nil
	end

	local var_574_1 = var_574_0:create()
	local var_574_2 = slot_0_26_0.get_family_names(arg_574_0)
	local var_574_3 = slot_0_13_0.push(var_574_1:list("##Family", var_574_2), arg_574_2 .. "_family")
	local var_574_4 = slot_0_13_0.push(var_574_1:combo(slot_0_30_2.prefix_dot .. "   Variant", slot_0_26_0.get_variant_names(arg_574_0, 1)), arg_574_2 .. "_variant")

	return var_574_0, var_574_3, var_574_4
end

slot_0_23_0.t_agent_enabled, slot_0_23_0.t_agent_family, slot_0_23_0.t_agent_variant = slot_0_52_10("t", "T Agent", "main_visuals_model_changer_t_agent")
slot_0_23_0.ct_agent_enabled, slot_0_23_0.ct_agent_family, slot_0_23_0.ct_agent_variant = slot_0_52_10("ct", "CT Agent", "main_visuals_model_changer_ct_agent")
slot_0_20_0.no_fall_damage_enabled = slot_0_13_0.push(slot_0_46_2:switch(slot_0_30_2.prefix_dot .. "   No Fall Damage", false), "main_misc_no_fall_enabled")

if slot_0_20_0.no_fall_damage_enabled ~= nil then
	-- block empty
end

slot_0_20_0.fast_ladder_move = slot_0_13_0.push(slot_0_46_2:switch(slot_0_30_2.prefix_dot .. "   Fast Ladder", false), "main_misc_fast_ladder_move")

if slot_0_20_0.fast_ladder_move ~= nil then
	slot_0_53_14 = slot_0_20_0.fast_ladder_move:create()
	slot_0_20_0.fast_ladder_jump_fix = slot_0_13_0.push(slot_0_53_14:switch(slot_0_30_2.prefix_dot .. "   Jump Fix", true), "main_misc_fast_ladder_jump_fix")

	if slot_0_20_0.fast_ladder_jump_fix ~= nil then
		-- block empty
	end
end

slot_0_22_0.enabled = slot_0_13_0.push(slot_0_49_8:switch(slot_0_30_2.prefix_dot .. "   Fps Optimizer", false), "main_misc_fps_optimize_enabled")

if slot_0_22_0.enabled ~= nil then
	slot_0_53_13 = slot_0_22_0.enabled:create()
	slot_0_22_0.select = slot_0_13_0.push(slot_0_53_13:listable("##Optimizations", {
		"Fog",
		"Blood",
		"Bloom",
		"Decals",
		"Shadows",
		"Sprites",
		"Particles",
		"Ropes",
		"Dynamic lights",
		"Map details",
		"Weapon effects"
	}), "main_misc_fps_optimize_select")

	if slot_0_22_0.select ~= nil then
		-- block empty
	end
end

slot_0_27_0.super_toss_enabled = slot_0_13_0.push(slot_0_46_2:switch(slot_0_30_2.prefix_dot .. "   Super Toss", false), "main_misc_weapons_super_toss_enabled")

if slot_0_27_0.super_toss_enabled ~= nil then
	-- block empty
end

slot_0_27_0.grenade_release_enabled = slot_0_13_0.push(slot_0_47_8:switch(slot_0_30_2.prefix_dot .. "   Grenade Release", false), "main_misc_weapons_grenade_release_enabled")

if slot_0_27_0.grenade_release_enabled ~= nil then
	slot_0_53_12 = slot_0_27_0.grenade_release_enabled:create()

	function slot_0_54_13(arg_575_0)
		if arg_575_0 == 0 then
			return "Off"
		end

		return string.format("%dhp", arg_575_0)
	end

	function slot_0_55_14(arg_576_0)
		if arg_576_0 == 0 then
			return "Off"
		end

		return string.format("%.1fm", arg_576_0 / 10)
	end

	slot_0_27_0.grenade_release_he_damage = slot_0_13_0.push(slot_0_53_12:slider(slot_0_30_2.prefix_arrow .. "   HE Damage", 0, 50, 25, 1, slot_0_54_13), "main_misc_weapons_grenade_release_he_damage")
	slot_0_27_0.grenade_release_molotov_range = slot_0_13_0.push(slot_0_53_12:slider(slot_0_30_2.prefix_arrow .. "   Molotov Range", 0, 20, 10, 1, slot_0_55_14), "main_misc_weapons_grenade_release_molotov_range")
	slot_0_27_0.grenade_release_predict_molotov = slot_0_13_0.push(slot_0_53_12:switch(slot_0_30_2.prefix_dot .. "   Predict Molotov", true), "main_misc_weapons_grenade_release_predict_molotov")

	if slot_0_27_0.grenade_release_predict_molotov ~= nil then
		-- block empty
	end
end

slot_0_27_0.quick_switch_enabled = slot_0_13_0.push(slot_0_47_8:switch(slot_0_30_2.prefix_dot .. "   Quick Switch", false), "main_misc_weapons_quick_switch_enabled")

if slot_0_27_0.quick_switch_enabled ~= nil then
	-- block empty
end

slot_0_20_0.trash_talk_enabled = slot_0_13_0.push(slot_0_49_8:switch(slot_0_30_2.prefix_dot .. "   Trash Talk", false), "main_misc_trash_talk_enabled")
slot_0_20_0.game_focus_enabled = slot_0_13_0.push(slot_0_49_8:switch(slot_0_30_2.prefix_dot .. "   Game Focus", false), "main_misc_game_focus_enabled")

if slot_0_20_0.game_focus_enabled ~= nil then
	-- block empty
end

slot_0_53_11 = "sv_cheats 1;mp_roundtime_defuse 99999;mp_warmup_end;mp_buytime 99999999;mp_buy_anywhere 1;sv_infinite_ammo 1;impulse 101;sv_airaccelerate 100;sv_regeneration_force_on 1;mp_respawn_on_death_ct 1;mp_respawn_on_death_t 1;bot_stop 1;mp_roundtime_hostage 10000"
slot_0_54_12 = "ui/armsrace_level_up.wav"
slot_0_55_13 = " "
slot_0_57_14 = (function(arg_577_0)
	local var_577_0 = 64
	local var_577_1 = math.max(0, var_577_0 - #arg_577_0)
	local var_577_2 = math.floor(var_577_1 * 0.5)
	local var_577_3 = var_577_1 - var_577_2

	return string.rep(slot_0_55_13, var_577_2) .. arg_577_0 .. string.rep(slot_0_55_13, var_577_3)
end)("Warmup Config")

slot_0_49_8:button(slot_0_57_14, function()
	slot_0_9_0.play(slot_0_54_12)
	utils.console_exec(slot_0_53_11)
end, true)

function slot_0_58_15(arg_579_0)
	slot_0_29_0.applied_index = arg_579_0

	slot_0_37_3:visibility(arg_579_0 == 1)
	slot_0_39_3:visibility(arg_579_0 == 1)
	slot_0_40_3:visibility(arg_579_0 == 1)
	slot_0_42_2:visibility(arg_579_0 == 1)
	slot_0_43_3:visibility(arg_579_0 == 2)
	slot_0_44_3:visibility(arg_579_0 == 2)
	slot_0_45_3:visibility(arg_579_0 == 2)
	slot_0_46_2:visibility(arg_579_0 == 3)
	slot_0_47_8:visibility(arg_579_0 == 3)
	slot_0_48_7:visibility(arg_579_0 == 3)
	slot_0_49_8:visibility(arg_579_0 == 3)
end

function slot_0_59_16()
	slot_0_37_3:visibility(false)
	slot_0_39_3:visibility(false)
	slot_0_40_3:visibility(false)
	slot_0_42_2:visibility(false)
	slot_0_43_3:visibility(false)
	slot_0_44_3:visibility(false)
	slot_0_48_7:visibility(false)
	slot_0_45_3:visibility(false)
	slot_0_46_2:visibility(false)
	slot_0_47_8:visibility(false)
	slot_0_49_8:visibility(false)
end

function slot_0_60_17(arg_581_0, arg_581_1)
	if slot_0_29_0.token ~= arg_581_0 then
		return
	end

	slot_0_58_15(arg_581_1)
end

function slot_0_61_18()
	local var_582_0 = slot_0_35_3:get()

	slot_0_29_0.token = slot_0_29_0.token + 1
	slot_0_36_3 = true

	slot_0_35_3:update(slot_0_34_3(var_582_0))
	slot_0_35_3:set(var_582_0)

	slot_0_36_3 = false

	if slot_0_29_0.applied_index == nil then
		slot_0_58_15(var_582_0)

		return
	end

	if slot_0_29_0.applied_index == var_582_0 then
		slot_0_58_15(var_582_0)

		return
	end

	slot_0_59_16()
	utils.execute_after(slot_0_29_0.delay, slot_0_60_17, slot_0_29_0.token, var_582_0)
end

slot_0_35_3:set_callback(function()
	if slot_0_36_3 then
		return
	end

	slot_0_61_18()
end, true)

slot_0_30_1 = slot_0_21_0.force_shot
slot_0_31_2 = {
	target_hitbox_index = 0,
	ssg08_weapon_index = 40,
	default_hit_chance = 50,
	accuracy_threshold = 0.023,
	trace_length = 8192,
	trace_count = 128
}
slot_0_32_2 = {
	hit_chance_overridden = false
}
slot_0_33_2 = slot_0_11_0.rage.selection.hit_chance

function slot_0_34_2(arg_584_0)
	if arg_584_0 == nil then
		return nil
	end

	local var_584_0, var_584_1 = pcall(arg_584_0.get_override, arg_584_0)

	if var_584_0 and var_584_1 ~= nil then
		return var_584_1
	end

	local var_584_2, var_584_3 = pcall(arg_584_0.get, arg_584_0)

	if not var_584_2 then
		return nil
	end

	return var_584_3
end

function slot_0_35_2()
	local var_585_0 = slot_0_34_2(slot_0_33_2)

	if type(var_585_0) ~= "number" then
		return slot_0_31_2.default_hit_chance
	end

	local var_585_1 = math.floor(var_585_0 + 0.5)

	if var_585_1 < 0 then
		return 0
	end

	if var_585_1 > 100 then
		return 100
	end

	return var_585_1
end

function slot_0_36_2()
	if slot_0_33_2 == nil then
		return
	end

	if slot_0_32_2.hit_chance_overridden ~= true then
		return
	end

	slot_0_33_2:override()

	slot_0_32_2.hit_chance_overridden = false
end

function slot_0_37_2()
	if slot_0_33_2 == nil then
		return
	end

	slot_0_33_2:override(0)

	slot_0_32_2.hit_chance_overridden = true
end

function slot_0_38_2()
	if slot_0_30_1 == nil or slot_0_30_1.hit_chance == nil then
		return slot_0_35_2()
	end

	local var_588_0 = slot_0_30_1.hit_chance:get()

	if type(var_588_0) ~= "number" then
		return slot_0_35_2()
	end

	return var_588_0
end

function slot_0_39_2(arg_589_0)
	if arg_589_0 == nil then
		return false
	end

	local var_589_0 = arg_589_0:get_weapon_index()

	if type(var_589_0) ~= "number" then
		return false
	end

	return var_589_0 == slot_0_31_2.ssg08_weapon_index
end

function slot_0_40_2(arg_590_0, arg_590_1, arg_590_2)
	if arg_590_0 == nil or arg_590_1 == nil or arg_590_2 == nil then
		return nil
	end

	local var_590_0 = arg_590_0:get_eye_position()

	if var_590_0 == nil then
		return nil
	end

	local var_590_1 = arg_590_2:get_hitbox_position(slot_0_31_2.target_hitbox_index)

	if var_590_1 == nil then
		var_590_1 = arg_590_2:get_origin()
	end

	if var_590_1 == nil then
		return nil
	end

	local var_590_2 = var_590_0:to(var_590_1)

	if var_590_2:lengthsqr() <= 0 then
		return nil
	end

	local var_590_3, var_590_4 = var_590_2:vectors()

	if var_590_3 == nil or var_590_4 == nil then
		return nil
	end

	local var_590_5 = arg_590_1:get_spread()
	local var_590_6 = arg_590_1:get_inaccuracy()

	if type(var_590_5) ~= "number" or type(var_590_6) ~= "number" then
		return nil
	end

	local var_590_7 = arg_590_2:get_index()

	if type(var_590_7) ~= "number" then
		return nil
	end

	local var_590_8 = 0

	for iter_590_0 = 1, slot_0_31_2.trace_count do
		local var_590_9 = utils.random_float(0, math.pi * 2)
		local var_590_10 = utils.random_float(0, var_590_5)
		local var_590_11 = utils.random_float(0, math.pi * 2)
		local var_590_12 = utils.random_float(0, var_590_6)
		local var_590_13 = math.cos(var_590_9) * var_590_10 + math.cos(var_590_11) * var_590_12
		local var_590_14 = math.sin(var_590_9) * var_590_10 + math.sin(var_590_11) * var_590_12
		local var_590_15 = vector(var_590_2.x + var_590_13 * var_590_3.x + var_590_14 * var_590_4.x, var_590_2.y + var_590_13 * var_590_3.y + var_590_14 * var_590_4.y, var_590_2.z + var_590_13 * var_590_3.z + var_590_14 * var_590_4.z):normalized()
		local var_590_16 = vector(var_590_0.x + var_590_15.x * slot_0_31_2.trace_length, var_590_0.y + var_590_15.y * slot_0_31_2.trace_length, var_590_0.z + var_590_15.z * slot_0_31_2.trace_length)
		local var_590_17, var_590_18 = utils.trace_bullet(arg_590_0, var_590_0, var_590_16)

		if type(var_590_17) == "number" and var_590_17 > 0 and var_590_18 ~= nil and var_590_18.entity ~= nil then
			local var_590_19 = var_590_18.entity:get_index()

			if type(var_590_19) == "number" and var_590_19 == var_590_7 then
				var_590_8 = var_590_8 + 1
			end
		end
	end

	return math.floor(var_590_8 / slot_0_31_2.trace_count * 100 + 0.5)
end

function slot_0_41_2()
	if slot_0_33_2 == nil then
		return
	end

	local var_591_0 = entity.get_local_player()

	if var_591_0 == nil or var_591_0:is_alive() ~= true then
		slot_0_36_2()

		return
	end

	local var_591_1 = var_591_0:get_player_weapon()

	if var_591_1 == nil then
		slot_0_36_2()

		return
	end

	if not slot_0_39_2(var_591_1) then
		slot_0_36_2()

		return
	end

	local var_591_2 = entity.get_threat()

	if var_591_2 == nil or var_591_2:is_alive() ~= true or var_591_2:is_dormant() == true then
		slot_0_36_2()

		return
	end

	local var_591_3 = var_591_1:get_inaccuracy()

	if type(var_591_3) ~= "number" then
		slot_0_36_2()

		return
	end

	if var_591_3 > slot_0_31_2.accuracy_threshold then
		slot_0_36_2()

		return
	end

	local var_591_4 = slot_0_38_2()

	if var_591_4 == 0 then
		slot_0_37_2()

		return
	end

	local var_591_5 = slot_0_40_2(var_591_0, var_591_1, var_591_2)

	if type(var_591_5) ~= "number" then
		slot_0_36_2()

		return
	end

	if var_591_4 <= var_591_5 then
		slot_0_37_2()

		return
	end

	slot_0_36_2()
end

if slot_0_30_1 ~= nil and slot_0_30_1.enabled ~= nil then
	slot_0_30_1.enabled:set_callback(function(arg_592_0)
		local var_592_0 = arg_592_0 ~= nil and arg_592_0:get() == true

		events.createmove_run(slot_0_41_2, var_592_0)

		if var_592_0 ~= true then
			slot_0_36_2()
		end
	end, true)
end

events.shutdown(slot_0_36_2, true)

slot_0_30_0 = {}
slot_0_31_1 = slot_0_2_0^slot_0_2_0.SIGNED
slot_0_32_1 = {}
slot_0_33_1 = {
	"Desert Eagle",
	"Pistol",
	"Pistol",
	"Pistol",
	nil,
	nil,
	"Rifle",
	"Rifle",
	"AWP",
	"Rifle",
	"Autosniper",
	nil,
	"Rifle",
	"Machine Gun",
	nil,
	"Rifle",
	"SMG",
	nil,
	"SMG",
	nil,
	nil,
	nil,
	"SMG",
	"SMG",
	"Shotgun",
	"SMG",
	"Shotgun",
	"Machine Gun",
	"Shotgun",
	"Pistol",
	"Zeus x27",
	"Pistol",
	"SMG",
	"SMG",
	"Shotgun",
	"Pistol",
	nil,
	"Autosniper",
	"Rifle",
	"SSG 08",
	nil,
	nil,
	"Nades",
	"Nades",
	"Nades",
	"Nades",
	"Nades",
	"Nades",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"Rifle",
	"Pistol",
	nil,
	"Pistol",
	"R8 Revolver"
}
slot_0_34_1 = 17
slot_0_35_1 = 3
slot_0_36_1 = 2

function slot_0_37_1(arg_593_0)
	return slot_0_33_1[arg_593_0] or "Other"
end

function slot_0_38_1(arg_594_0)
	return (arg_594_0 + 180) % -360 + 180
end

function slot_0_39_1(arg_595_0)
	for iter_595_0 in pairs(arg_595_0) do
		arg_595_0[iter_595_0] = nil
	end
end

function slot_0_40_1(arg_596_0)
	return arg_596_0 ~= nil and arg_596_0.get_index ~= nil and arg_596_0:get_index() ~= nil
end

function slot_0_41_1(arg_597_0, arg_597_1)
	if type(arg_597_0) ~= "string" then
		return
	end

	local var_597_0 = tonumber(arg_597_1)

	if var_597_0 == nil or var_597_0 <= 0 then
		slot_0_32_1[arg_597_0] = nil

		return
	end

	slot_0_32_1[arg_597_0] = var_597_0
end

function slot_0_42_1(arg_598_0)
	if arg_598_0 == entity.get_local_player() then
		return true
	end

	if not slot_0_40_1(arg_598_0) then
		return false
	end

	local var_598_0 = arg_598_0:get_index()

	for iter_598_0, iter_598_1 in pairs(slot_0_32_1) do
		if var_598_0 == iter_598_1 then
			return true
		end
	end

	return false
end

function slot_0_43_2(arg_599_0, arg_599_1)
	if arg_599_0 <= 21 then
		arg_599_0 = 20
	end

	if arg_599_0 > 100 then
		arg_599_0 = arg_599_1 + (arg_599_0 - 100)
	end

	return arg_599_0
end

function slot_0_44_2(arg_600_0, arg_600_1, arg_600_2)
	if not slot_0_40_1(arg_600_0) or arg_600_0:is_dormant() then
		return math.huge
	end

	local var_600_0 = arg_600_0:get_eye_position()

	if var_600_0 == nil then
		return math.huge
	end

	local var_600_1 = vector(arg_600_2.x, arg_600_2.y, arg_600_2.z + 48)
	local var_600_2 = vector(arg_600_2.x, arg_600_2.y, arg_600_2.z + 36)
	local var_600_3 = utils.trace_bullet(arg_600_0, var_600_0, arg_600_1)
	local var_600_4 = utils.trace_bullet(arg_600_0, var_600_0, var_600_1)
	local var_600_5 = utils.trace_bullet(arg_600_0, var_600_0, var_600_2)

	return math.max(var_600_3 or 0, var_600_4 or 0, var_600_5 or 0)
end

function slot_0_45_2(arg_601_0, arg_601_1, arg_601_2, arg_601_3)
	if arg_601_0 == nil then
		return
	end

	render.circle(arg_601_0, arg_601_3, arg_601_1 + 1, 0, 1)
	render.circle(arg_601_0, arg_601_2, arg_601_1, 0, 1)
end

function slot_0_46_1(arg_602_0, arg_602_1, arg_602_2, arg_602_3)
	if arg_602_0 == nil or arg_602_1 == nil then
		return
	end

	render.line(arg_602_0 + vector(1, 1), arg_602_1 + vector(1, 1), arg_602_3)
	render.line(arg_602_0, arg_602_1, arg_602_2)
end

slot_0_30_0.lag_record = slot_0_31_1
slot_0_30_0.get_weapon_type = slot_0_37_1
slot_0_30_0.normalize_yaw = slot_0_38_1
slot_0_30_0.table_clear = slot_0_39_1
slot_0_30_0.is_entity_valid = slot_0_40_1
slot_0_30_0.set_lag_record_target = slot_0_41_1
slot_0_30_0.should_update_lag_record = slot_0_42_1
slot_0_30_0.get_adjusted_min_damage = slot_0_43_2
slot_0_30_0.get_enemy_damage_on_point = slot_0_44_2
slot_0_30_0.draw_shadow_circle = slot_0_45_2
slot_0_30_0.draw_shadow_line = slot_0_46_1
slot_0_30_0.min_move_dist = slot_0_34_1
slot_0_30_0.sample_rate = slot_0_35_1
slot_0_30_0.direction_steps = slot_0_36_1

if slot_0_31_1 ~= nil and slot_0_31_1.set_update_callback ~= nil then
	slot_0_31_1.set_update_callback(slot_0_42_1)
end

slot_0_31_0 = slot_0_30_0.lag_record
slot_0_32_0 = slot_0_30_0.min_move_dist
slot_0_33_0 = slot_0_30_0.sample_rate
slot_0_34_0 = slot_0_30_0.direction_steps
slot_0_35_0 = slot_0_30_0.get_weapon_type
slot_0_36_0 = slot_0_30_0.normalize_yaw
slot_0_37_0 = slot_0_30_0.table_clear
slot_0_38_0 = slot_0_30_0.is_entity_valid
slot_0_39_0 = slot_0_30_0.get_adjusted_min_damage
slot_0_40_0 = slot_0_30_0.get_enemy_damage_on_point
slot_0_41_0 = slot_0_30_0.draw_shadow_circle
slot_0_42_0 = slot_0_30_0.draw_shadow_line
slot_0_43_1 = nil
slot_0_44_1 = nil
slot_0_45_1 = nil
slot_0_46_0 = nil

if ffi ~= nil then
	slot_0_43_0 = ffi.typeof("        struct {\n            char pad_0000[100];\n            int index;\n        }\n    ")
	slot_0_47_7 = {
		__index = {}
	}
	slot_0_47_7.__newindex = slot_0_47_7.__index

	ffi.metatype(slot_0_43_0, slot_0_47_7)

	slot_0_48_6 = ffi.typeof("        struct {\n            int id;\n            int version;\n            int checksum;\n            char name[64];\n        }\n    ")
	slot_0_44_0 = ffi.typeof("        struct {\n            $ *studio_hdr;\n        }\n    ", slot_0_48_6)
	slot_0_49_7 = {
		__index = {}
	}
	slot_0_49_7.__newindex = slot_0_49_7.__index

	ffi.metatype(slot_0_44_0, slot_0_49_7)

	slot_0_45_0 = ffi.typeof("        struct {\n            float layer_anim_time;\n            float layer_fade_out_time;\n            $ *dispatched_studio_hdr;\n            int dispatched_src;\n            int dispatched_dst;\n            int order;\n            int sequence;\n            float prev_cycle;\n            float weight;\n            float weight_delta_rate;\n            float playback_rate;\n            float cycle;\n            $ *owner;\n            int invalidate_physics_bits;\n        }\n    ", slot_0_44_0, slot_0_43_0)
	slot_0_50_8 = {
		__index = {}
	}
	slot_0_50_8.__newindex = slot_0_50_8.__index

	ffi.metatype(slot_0_45_0, slot_0_50_8)

	slot_0_43_0.get_model_ptr = ffi.cast(ffi.typeof("$ *(__thiscall*)($ *)", slot_0_44_0, slot_0_43_0), utils.opcode_scan("client.dll", "56 8B F1 83 BE ? ? ? ? ? 75 ? 8B 46 ? 8D 4E ? FF 50 ? 85 C0 74 ? 8B CE E8 ? ? ? ? 8B 86 ? ? ? ? 85 C0 74 ? 83 38 ? 75 ? 33 C0 5E") or error("AI Peek::C_BaseAnimating::GetModelPtr"))
	slot_0_44_0.get_sequence_activity = ffi.cast(ffi.typeof("int(__fastcall*)($ *, int)", slot_0_44_0), utils.opcode_scan("client.dll", "53 8B D9 56 57 8B FA 83 7B") or error("AI Peek::CStudioHdr::GetSequenceActivity"))
	slot_0_43_0.get_anim_overlay = ffi.cast(ffi.typeof("$ *(__thiscall*)($ *, int, bool)", slot_0_45_0, slot_0_43_0), utils.opcode_scan("client.dll", "55 8B EC 57 8B F9 8B 97 ? ? ? ? 85 D2") or error("AI Peek::C_BaseAnimatingOverlay::GetAnimOverlay"))
	slot_0_46_0 = ffi.typeof("$ *", slot_0_43_0)
end

slot_0_47_6 = slot_0_21_0.ai_peek
slot_0_48_5 = {
	preferred_support = 2,
	default_rate_limit = 0.09,
	sample_rate = 2,
	min_move_dist = 14,
	default_hit_chance = 45,
	default_simulation_time = 0.3,
	live_verify_interval = 0.025,
	live_verify_distance = 34,
	max_target_hitbox_delta = 22,
	max_target_origin_delta = 42,
	default_draw_color = color(255, 255, 0, 255),
	scan_yaw_offsets = {
		-205,
		-180,
		-155,
		-25,
		0,
		25
	}
}
slot_0_49_6 = {
	slow_walk = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.slow_walk,
	double_tap = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.double_tap,
	peek_assist = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.peek_assist and slot_0_11_0.rage.main.peek_assist[1] or nil,
	retreat_mode = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.peek_assist and slot_0_11_0.rage.main.peek_assist[4] or nil,
	hit_chance = slot_0_11_0.rage and slot_0_11_0.rage.selection and slot_0_11_0.rage.selection.hit_chance,
	minimum_damage = slot_0_11_0.rage and slot_0_11_0.rage.selection and slot_0_11_0.rage.selection.minimum_damage,
	hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
	body_aim = slot_0_11_0.rage and slot_0_11_0.rage.safety and slot_0_11_0.rage.safety.body_aim,
	body_aim_disablers = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers"),
	force_body_aim_on_peek = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Force on Peek"),
	head_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"),
	body_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"),
	ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety"),
	safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
}
slot_0_50_7 = {
	teleport_tick = 0,
	last_live_check_time = 0,
	ticks_to_move = 0,
	is_moving_closer = false,
	should_retreat = false,
	random_path_index = 0,
	needs_reset = false,
	last_calc_time = 0,
	is_peeking = false,
	ignore_limbs = false,
	callbacks_registered = false,
	simulation_time = slot_0_48_5.default_simulation_time,
	rate_limit = slot_0_48_5.default_rate_limit,
	hit_chance = slot_0_48_5.default_hit_chance,
	draw_color = slot_0_48_5.default_draw_color,
	scan_hitboxes = {},
	sample_points = {},
	last_dist = math.huge,
	ai_state = {
		pct = 0,
		last_dmg = 0,
		entindex = -1,
		state = 0,
		last_hitbox_id = -1
	}
}
slot_0_51_8 = {
	line = color(194, 194, 194, 235),
	soft_line = color(194, 194, 194, 150),
	shadow = color(0, 0, 0, 120)
}
slot_0_52_9 = {
	default = color(180, 180, 180, 180),
	selected = color(120, 235, 120, 255),
	pending = color(255, 210, 90, 245),
	risky = color(235, 90, 90, 210),
	radius = color(255, 165, 70, 210),
	support = color(245, 225, 120, 210),
	dmg = color(170, 215, 255, 210),
	gray = color(160, 160, 160, 160),
	chosen_alt = color(110, 190, 255, 245)
}
slot_0_53_10 = {
	z2 = vector(0, 0, 2),
	z72 = vector(0, 0, 72),
	z36 = vector(0, 0, 36),
	z3 = vector(0, 0, 3),
	z4 = vector(0, 0, 4),
	x_pos = vector(1, 0, 0),
	x_neg = vector(-1, 0, 0),
	y_pos = vector(0, 1, 0),
	y_neg = vector(0, -1, 0),
	shadow_offset = vector(1, 1)
}

function slot_0_54_11(arg_603_0)
	if arg_603_0 == nil then
		return nil
	end

	if arg_603_0.get_override ~= nil then
		local var_603_0, var_603_1 = pcall(arg_603_0.get_override, arg_603_0)

		if var_603_0 and var_603_1 ~= nil then
			return var_603_1
		end
	end

	if arg_603_0.get == nil then
		return nil
	end

	local var_603_2, var_603_3 = pcall(arg_603_0.get, arg_603_0)

	if not var_603_2 then
		return nil
	end

	return var_603_3
end

function slot_0_55_12(arg_604_0)
	if arg_604_0 == nil then
		return nil
	end

	if arg_604_0.get_override ~= nil then
		local var_604_0, var_604_1 = pcall(arg_604_0.get_override, arg_604_0)

		if var_604_0 and var_604_1 then
			return var_604_1
		end
	end

	if arg_604_0.get == nil then
		return nil
	end

	local var_604_2, var_604_3 = pcall(arg_604_0.get, arg_604_0)

	if not var_604_2 then
		return nil
	end

	return var_604_3
end

function slot_0_56_12(arg_605_0)
	if arg_605_0 == nil or arg_605_0.get == nil then
		return nil
	end

	local var_605_0, var_605_1 = pcall(arg_605_0.get, arg_605_0)

	if not var_605_0 then
		return nil
	end

	return var_605_1
end

function slot_0_57_13(arg_606_0, arg_606_1)
	if arg_606_0 == nil or arg_606_0.override == nil then
		return
	end

	if arg_606_1 == nil then
		pcall(arg_606_0.override, arg_606_0)

		return
	end

	pcall(arg_606_0.override, arg_606_0, arg_606_1)
end

function slot_0_58_14(arg_607_0, arg_607_1)
	if arg_607_0 == nil or type(arg_607_1) ~= "string" then
		return false
	end

	local var_607_0, var_607_1 = pcall(arg_607_0.get, arg_607_0, arg_607_1)

	if var_607_0 and type(var_607_1) == "boolean" then
		return var_607_1
	end

	local var_607_2, var_607_3 = pcall(arg_607_0.get, arg_607_0)

	if not var_607_2 or type(var_607_3) ~= "table" then
		return false
	end

	for iter_607_0 = 1, #var_607_3 do
		if var_607_3[iter_607_0] == arg_607_1 then
			return true
		end
	end

	return false
end

function slot_0_59_15()
	return slot_0_47_6 ~= nil and slot_0_47_6.enabled ~= nil and slot_0_47_6.enabled:get() == true
end

function slot_0_60_16(arg_609_0)
	return slot_0_58_14(slot_0_47_6.weapons, arg_609_0)
end

function slot_0_61_17()
	slot_0_57_13(slot_0_49_6.slow_walk, nil)
	slot_0_57_13(slot_0_49_6.hit_chance, nil)
	slot_0_57_13(slot_0_49_6.retreat_mode, nil)
	slot_0_57_13(slot_0_49_6.force_body_aim_on_peek, nil)
	slot_0_57_13(slot_0_49_6.head_scale, nil)
	slot_0_57_13(slot_0_49_6.body_scale, nil)
	slot_0_57_13(slot_0_49_6.ensure_hitbox_safety, nil)
	slot_0_57_13(slot_0_49_6.body_aim, nil)
	slot_0_57_13(slot_0_49_6.safe_points, nil)
end

function slot_0_62_18()
	slot_0_61_17()
	slot_0_30_0.set_lag_record_target("ai_peek", nil)
	slot_0_37_0(slot_0_50_7.sample_points)

	slot_0_50_7.should_retreat = false
	slot_0_50_7.is_peeking = false
	slot_0_47_6.active = false
	slot_0_50_7.current_point = nil
	slot_0_50_7.last_dist = math.huge
	slot_0_50_7.needs_reset = false
	slot_0_50_7.random_path_index = 0
	slot_0_50_7.ticks_to_move = 0
	slot_0_50_7.teleport_tick = 0
	slot_0_50_7.is_moving_closer = false
	slot_0_50_7.last_live_check_time = 0
	slot_0_50_7.ai_state.state = 0
	slot_0_50_7.ai_state.pct = 0
	slot_0_50_7.ai_state.last_hitbox_id = -1
	slot_0_50_7.ai_state.last_dmg = 0
	slot_0_50_7.ai_state.entindex = -1
end

function slot_0_63_16(arg_612_0)
	return arg_612_0 ~= nil and arg_612_0:is_alive() == true and arg_612_0.m_bGunGameImmunity ~= true
end

function slot_0_64_17(arg_613_0)
	return arg_613_0 ~= nil and (tonumber(arg_613_0.m_flDuckAmount) or 0) >= 0.45
end

function slot_0_65_18(arg_614_0)
	return arg_614_0 == 7 or arg_614_0 == 8 or arg_614_0 == 9 or arg_614_0 == 10 or arg_614_0 == 15 or arg_614_0 == 17
end

function slot_0_66_18(arg_615_0)
	return arg_615_0 == 2 or arg_615_0 == 3 or arg_615_0 == 4 or arg_615_0 == 5 or arg_615_0 == 6
end

function slot_0_67_18(arg_616_0, arg_616_1, arg_616_2)
	if slot_0_64_17(arg_616_0) ~= true then
		return false
	end

	if slot_0_65_18(arg_616_1) == true then
		return true
	end

	if arg_616_2 == nil then
		return false
	end

	local var_616_0 = tonumber(arg_616_2.hitbox)

	if var_616_0 == nil then
		return false
	end

	if arg_616_1 == 0 then
		return var_616_0 ~= 0
	end

	if arg_616_1 == 3 or arg_616_1 == 5 then
		return slot_0_66_18(var_616_0) ~= true
	end

	return slot_0_65_18(var_616_0)
end

function slot_0_68_16(arg_617_0, arg_617_1)
	if arg_617_0 == arg_617_1 then
		return true
	end

	if arg_617_0 == nil or arg_617_1 == nil or arg_617_0.get_index == nil or arg_617_1.get_index == nil then
		return false
	end

	local var_617_0 = arg_617_0:get_index()
	local var_617_1 = arg_617_1:get_index()

	return type(var_617_0) == "number" and type(var_617_1) == "number" and var_617_0 == var_617_1
end

function slot_0_69_19(arg_618_0)
	if arg_618_0 == nil or slot_0_38_0(arg_618_0.player) ~= true then
		return true
	end

	local var_618_0 = arg_618_0.player

	if var_618_0:is_alive() ~= true or var_618_0:is_dormant() == true or var_618_0.m_bGunGameImmunity == true then
		return true
	end

	local var_618_1 = var_618_0:get_origin()

	if var_618_1 == nil or arg_618_0.player_origin == nil or var_618_1:dist(arg_618_0.player_origin) > slot_0_48_5.max_target_origin_delta then
		return true
	end

	local var_618_2 = arg_618_0.target_hitbox_pos
	local var_618_3 = tonumber(arg_618_0.hitbox_id)

	if var_618_2 ~= nil and var_618_3 ~= nil and var_618_3 >= 0 then
		local var_618_4 = var_618_0:get_hitbox_position(var_618_3)

		if var_618_4 == nil or var_618_4:dist(var_618_2) > slot_0_48_5.max_target_hitbox_delta then
			return true
		end
	end

	return false
end

function slot_0_70_18(arg_619_0, arg_619_1)
	if utils.trace_bullet == nil or arg_619_0 == nil or arg_619_1 == nil or arg_619_1.eye_pos == nil or slot_0_69_19(arg_619_1) == true then
		return false
	end

	local var_619_0 = arg_619_1.player
	local var_619_1 = tonumber(arg_619_1.hitbox_id) or -1
	local var_619_2 = var_619_1 >= 0 and var_619_0:get_hitbox_position(var_619_1) or nil

	if var_619_2 == nil then
		var_619_2 = arg_619_1.target_hitbox_pos
	end

	if var_619_2 == nil then
		return false
	end

	local var_619_3, var_619_4 = utils.trace_bullet(arg_619_0, arg_619_1.eye_pos, var_619_2)

	if type(var_619_3) ~= "number" or var_619_4 == nil or slot_0_68_16(var_619_4.entity, var_619_0) ~= true or slot_0_67_18(var_619_0, var_619_1, var_619_4) == true then
		return false
	end

	local var_619_5 = tonumber(var_619_0.m_iHealth) or 0

	return var_619_3 >= (tonumber(arg_619_1.required_damage) or 0) or var_619_5 <= var_619_3
end

function slot_0_71_18(arg_620_0)
	local var_620_0 = arg_620_0 ~= nil and tonumber(arg_620_0.enemy_dmg) or nil

	if var_620_0 == nil or var_620_0 < 0 or var_620_0 == math.huge then
		return nil
	end

	return var_620_0
end

function slot_0_72_16(arg_621_0)
	if arg_621_0 == 5 then
		return 18
	end

	if arg_621_0 == 3 then
		return 16
	end

	if arg_621_0 == 0 then
		return 10
	end

	if slot_0_65_18(arg_621_0) == true then
		return -24
	end

	return 0
end

function slot_0_73_16(arg_622_0, arg_622_1)
	local var_622_0 = slot_0_71_18(arg_622_0)

	if var_622_0 == nil then
		return false
	end

	local var_622_1 = math.max(tonumber(arg_622_0 ~= nil and arg_622_0.dmg) or 0, 0)
	local var_622_2 = math.max(tonumber(arg_622_0 ~= nil and arg_622_0.support) or 0, 0)

	if arg_622_1 <= var_622_0 then
		return true
	end

	if var_622_2 <= 1 and var_622_0 >= math.max(arg_622_1 * 0.78, 64) then
		return true
	end

	if var_622_2 <= 1 and var_622_0 >= var_622_1 + 24 then
		return true
	end

	if slot_0_65_18(arg_622_0 ~= nil and arg_622_0.hitbox_id or -1) == true and var_622_0 >= math.max(arg_622_1 * 0.5, 38) then
		return true
	end

	return false
end

function slot_0_74_15(arg_623_0)
	local var_623_0 = math.max(tonumber(arg_623_0 ~= nil and arg_623_0.support) or 0, 0)
	local var_623_1 = math.max(tonumber(arg_623_0 ~= nil and arg_623_0.dmg) or 0, 0)
	local var_623_2 = slot_0_71_18(arg_623_0)
	local var_623_3 = math.max(tonumber(arg_623_0 ~= nil and arg_623_0.ticks_to_move) or 0, 0)
	local var_623_4 = var_623_0 * 34 + math.min(var_623_1, 130) + slot_0_72_16(arg_623_0 ~= nil and arg_623_0.hitbox_id or -1) - math.max(tonumber(arg_623_0 ~= nil and arg_623_0.dist) or 0, 0) * 0.45 - var_623_3 * 1.6

	if var_623_2 == nil then
		var_623_4 = var_623_4 - 8
	else
		var_623_4 = var_623_4 - var_623_2 * 1.15
		var_623_4 = var_623_4 + math.max(var_623_1 - var_623_2, -48) * 0.9
	end

	if var_623_0 <= 1 then
		var_623_4 = var_623_4 - 14
	end

	return var_623_4
end

function slot_0_75_12(arg_624_0)
	local var_624_0 = arg_624_0 ~= nil and arg_624_0:get() or 30

	slot_0_50_7.simulation_time = (var_624_0 or 30) * 0.01
end

function slot_0_76_11(arg_625_0)
	local var_625_0 = arg_625_0 ~= nil and arg_625_0:get() or 9

	slot_0_50_7.rate_limit = (var_625_0 or 9) * 0.01
end

function slot_0_77_10(arg_626_0)
	local var_626_0 = arg_626_0 ~= nil and arg_626_0:get() or slot_0_48_5.default_hit_chance

	slot_0_50_7.hit_chance = var_626_0 or slot_0_48_5.default_hit_chance
end

function slot_0_78_10(arg_627_0)
	local var_627_0 = arg_627_0 ~= nil and arg_627_0:get() or slot_0_48_5.default_draw_color

	slot_0_50_7.draw_color = var_627_0 or slot_0_48_5.default_draw_color
end

function slot_0_79_9(arg_628_0)
	if arg_628_0 == nil then
		return
	end

	slot_628_1_0 = slot_0_55_12(slot_0_49_6.double_tap) == true
	slot_628_2_0 = slot_0_55_12(slot_0_49_6.peek_assist) == true

	if slot_628_1_0 ~= true or slot_628_2_0 ~= true then
		return
	end

	if slot_0_50_7.needs_reset == true then
		slot_0_50_7.is_peeking = false
		slot_0_50_7.current_point = nil
		slot_0_50_7.needs_reset = false
		slot_0_47_6.active = false
	end

	if slot_0_59_15() ~= true then
		slot_0_50_7.needs_reset = true

		return
	end

	if slot_0_46_0 == nil then
		return
	end

	slot_628_3_0 = entity.get_local_player()

	if slot_628_3_0 == nil then
		slot_0_50_7.needs_reset = true

		return
	end

	slot_628_4_0 = ffi.cast(slot_0_46_0, slot_628_3_0[0])

	if slot_628_4_0 == nil then
		return
	end

	slot_628_5_0 = slot_628_4_0:get_model_ptr()

	if slot_628_5_0 == nil then
		return
	end

	slot_628_6_0 = slot_628_4_0:get_anim_overlay(10, true)

	if slot_628_6_0 ~= nil and slot_628_5_0:get_sequence_activity(slot_628_6_0.sequence) == 982 and slot_628_6_0.weight > 0 then
		slot_0_50_7.needs_reset = true

		return
	end

	if slot_628_3_0:is_alive() ~= true then
		slot_0_50_7.needs_reset = true
		slot_0_50_7.should_retreat = false

		return
	end

	slot_628_7_0 = slot_628_3_0:get_player_weapon()

	if slot_628_7_0 == nil then
		slot_0_50_7.needs_reset = true

		return
	end

	slot_628_8_0 = slot_0_35_0(slot_628_7_0:get_weapon_index())

	if slot_0_60_16(slot_628_8_0) ~= true then
		slot_0_50_7.needs_reset = true

		return
	end

	slot_0_50_7.ai_state.state = 3
	slot_0_47_6.active = false
	slot_628_9_0 = slot_0_56_12(slot_0_49_6.double_tap) == true and rage.exploit:get() < 1

	slot_0_61_17()

	slot_628_10_1 = math.max(slot_628_7_0.m_flNextPrimaryAttack, slot_628_3_0.m_flNextAttack)
	slot_628_11_0 = false
	slot_628_12_0 = entity.get_threat(true)
	slot_628_13_0 = slot_0_50_7.simulation_time
	slot_628_14_1 = slot_0_56_12(slot_0_49_6.minimum_damage) or 0

	if globals.realtime - slot_0_50_7.last_calc_time >= slot_0_50_7.rate_limit and slot_0_50_7.is_peeking ~= true and slot_628_12_0 == nil and slot_628_9_0 ~= true then
		slot_0_37_0(slot_0_50_7.scan_hitboxes)

		slot_628_15_2 = slot_0_54_11(slot_0_49_6.body_aim_disablers)

		if type(slot_628_15_2) ~= "table" then
			slot_628_15_2 = {}
		end

		slot_628_16_3 = slot_0_55_12(slot_0_49_6.body_aim) == "Force" and #slot_628_15_2 == 0

		if slot_628_16_3 ~= true and slot_0_49_6.hitboxes ~= nil and slot_0_49_6.hitboxes:get("Head") then
			slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 0
		end

		if slot_0_49_6.hitboxes ~= nil and slot_0_49_6.hitboxes:get("Chest") then
			slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 5
		end

		if slot_0_49_6.hitboxes ~= nil and slot_0_49_6.hitboxes:get("Stomach") then
			slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 3
		end

		if slot_628_16_3 ~= true and slot_0_50_7.ignore_limbs ~= true and slot_0_49_6.hitboxes ~= nil then
			if slot_0_49_6.hitboxes:get("Legs") then
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 7
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 8
			end

			if slot_0_49_6.hitboxes:get("Feet") then
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 9
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 10
			end

			if slot_0_49_6.hitboxes:get("Arms") then
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 15
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 17
			end
		end

		slot_0_50_7.current_point = nil

		slot_0_37_0(slot_0_50_7.sample_points)

		slot_628_17_2 = render.camera_position()
		slot_628_18_2 = render.camera_angles()

		if slot_628_17_2 == nil or slot_628_18_2 == nil then
			return
		end

		slot_628_19_1 = vector():angles(slot_628_18_2)
		slot_628_20_2 = entity.get_players(true, false)
		slot_628_21_2 = math.huge
		slot_628_22_1 = nil

		for iter_628_0, iter_628_1 in ipairs(slot_628_20_2) do
			if slot_0_63_16(iter_628_1) == true then
				slot_628_28_1 = iter_628_1:get_origin()

				if slot_628_28_1 ~= nil then
					slot_628_28_1.z = slot_628_28_1.z + iter_628_1.m_vecMaxs.z * 0.5
					slot_628_29_1 = slot_628_28_1:dist_to_ray(slot_628_17_2, slot_628_19_1)

					if slot_628_29_1 < slot_628_21_2 then
						slot_628_21_2 = slot_628_29_1
						slot_628_22_1 = iter_628_1
					end
				end
			end
		end

		if slot_628_22_1 == nil then
			return
		end

		slot_0_50_7.ai_state.entindex = slot_628_22_1:get_index()

		slot_0_30_0.set_lag_record_target("ai_peek", slot_0_50_7.ai_state.entindex)

		slot_628_23_0 = slot_0_31_0 ~= nil and slot_0_31_0.get_snapshot ~= nil and slot_0_31_0.get_snapshot(slot_628_22_1) or nil

		if slot_628_23_0 ~= nil and slot_628_23_0.command ~= nil and slot_628_23_0.command.no_entry ~= nil and slot_628_23_0.command.no_entry.y > 0 then
			slot_0_50_7.last_calc_time = globals.realtime - slot_0_50_7.rate_limit

			return
		end

		if (slot_628_8_0 == "SSG 08" or slot_628_8_0 == "AWP") and slot_628_3_0.m_bIsScoped ~= true then
			return
		end

		if slot_628_8_0 == "AWP" then
			slot_628_13_0 = slot_628_13_0 * 2
		end

		slot_628_24_0 = slot_628_3_0.m_vecVelocity

		if slot_628_24_0 == nil or slot_628_24_0:length2d() >= 65 then
			return
		end

		slot_628_25_0 = math.max(tonumber(slot_628_22_1.m_iHealth) or 0, 0)
		slot_628_26_1 = {}

		for iter_628_2, iter_628_3 in ipairs(slot_0_50_7.scan_hitboxes) do
			slot_628_26_1[#slot_628_26_1 + 1] = slot_628_22_1:get_hitbox_position(iter_628_3)
		end

		slot_628_14_0 = slot_0_39_0(tonumber(slot_628_14_1) or 0, slot_628_25_0)
		slot_628_27_1 = arg_628_0.view_angles.y
		slot_628_28_0 = arg_628_0.forwardmove
		slot_628_29_0 = arg_628_0.sidemove
		slot_628_30_0 = arg_628_0.buttons
		slot_628_31_0 = slot_628_3_0:get_eye_position()
		slot_628_32_0 = slot_628_22_1:get_origin()

		if slot_628_31_0 == nil or slot_628_32_0 == nil then
			return
		end

		slot_628_33_0 = slot_628_31_0:to(slot_628_32_0):angles().y
		slot_628_34_0 = math.normalize_yaw or slot_0_36_0
		arg_628_0.forwardmove = 450
		arg_628_0.sidemove = 0
		arg_628_0.buttons = 0

		for iter_628_4 = -180, 179, 360 / slot_0_34_0 do
			arg_628_0.view_angles.y = slot_628_34_0(slot_628_33_0 + iter_628_4 + 90)
			slot_628_39_0 = slot_628_3_0:simulate_movement()

			if slot_628_39_0 == nil or slot_628_39_0.origin == nil or slot_628_39_0.velocity == nil then
				break
			end

			slot_628_40_0 = slot_628_39_0.origin:clone()
			slot_628_41_0 = 0

			for iter_628_5 = 1, slot_628_13_0 / globals.tickinterval do
				slot_628_46_0 = slot_628_39_0.velocity:length2d()

				slot_628_39_0:think()

				slot_628_47_0 = slot_628_39_0.velocity:length2d()

				if bit.band(slot_628_39_0.flags, 1) == 1 and slot_628_46_0 <= slot_628_47_0 then
					slot_628_48_0 = slot_628_39_0.origin:dist2d(slot_628_40_0)

					if slot_628_48_0 >= slot_0_32_0 then
						if slot_628_41_0 % slot_0_33_0 == 0 then
							slot_628_49_0 = slot_628_39_0.origin:clone()
							slot_628_50_0 = slot_628_49_0:clone()
							slot_628_50_0.z = slot_628_50_0.z + slot_628_39_0.view_offset
							slot_628_51_0 = -1
							slot_628_52_0 = nil
							slot_628_53_0 = nil

							for iter_628_6, iter_628_7 in ipairs(slot_628_26_1) do
								if iter_628_7 ~= nil then
									slot_628_59_1, slot_628_60_0 = utils.trace_bullet(slot_628_3_0, slot_628_50_0, iter_628_7)
									slot_628_59_0 = tonumber(slot_628_59_1) or 0

									if slot_628_60_0 ~= nil then
										slot_628_53_0 = slot_628_60_0.end_pos

										if (slot_628_14_0 <= slot_628_59_0 or slot_628_25_0 <= slot_628_59_0) and slot_628_60_0.entity == slot_628_22_1 then
											slot_628_51_0 = slot_628_59_0
											slot_628_11_0 = true
											slot_628_52_0 = slot_0_50_7.scan_hitboxes[iter_628_6]
											slot_0_50_7.ai_state.last_hitbox_id = slot_628_52_0
											slot_0_50_7.ai_state.last_dmg = slot_628_51_0

											break
										end
									end
								end
							end

							slot_0_50_7.sample_points[#slot_0_50_7.sample_points + 1] = {
								player = slot_628_22_1,
								player_origin = slot_628_22_1:get_origin(),
								hitbox_id = slot_628_52_0 or -1,
								start_pos = slot_628_40_0,
								pos = slot_628_49_0,
								eye_pos = slot_628_50_0,
								dmg = slot_628_51_0,
								test = slot_628_41_0 % slot_0_33_0,
								dist = slot_628_48_0,
								ticks_to_move = iter_628_5,
								yaw = arg_628_0.view_angles.y,
								tr_end_pos = slot_628_53_0
							}

							if slot_628_14_0 <= slot_628_51_0 then
								break
							end
						end

						slot_628_41_0 = slot_628_41_0 + 1
					end
				else
					break
				end
			end
		end

		arg_628_0.view_angles.y = slot_628_27_1
		arg_628_0.forwardmove = slot_628_28_0
		arg_628_0.sidemove = slot_628_29_0
		arg_628_0.buttons = slot_628_30_0
		slot_0_50_7.last_calc_time = globals.realtime
	end

	if #slot_0_50_7.sample_points > 0 and utils.random_int ~= nil then
		slot_0_50_7.random_path_index = utils.random_int(1, #slot_0_50_7.sample_points)
	end

	if slot_628_11_0 == true then
		slot_628_15_1 = math.huge
		slot_628_16_2 = nil

		for iter_628_8, iter_628_9 in ipairs(slot_0_50_7.sample_points) do
			if iter_628_9.dmg ~= -1 and slot_628_15_1 > iter_628_9.dist then
				slot_628_15_1 = iter_628_9.dist
				slot_628_16_2 = iter_628_9
			end
		end

		if slot_628_16_2 ~= nil then
			slot_628_10_1 = slot_628_10_1 - slot_628_16_2.ticks_to_move * globals.tickinterval

			if slot_628_10_1 <= globals.curtime then
				slot_0_50_7.is_peeking = true
				slot_0_50_7.current_point = slot_628_16_2
				slot_0_50_7.ticks_to_move = slot_628_16_2.ticks_to_move
			end
		end
	end

	slot_628_15_0 = slot_628_3_0:simulate_movement()

	if slot_628_15_0 == nil or slot_628_15_0.origin == nil then
		return
	end

	slot_628_15_0:think()

	if slot_0_50_7.is_peeking == true then
		slot_0_47_6.active = true

		slot_0_57_13(slot_0_49_6.retreat_mode, nil)

		if slot_0_50_7.current_point == nil then
			slot_0_62_18()

			return
		end

		slot_628_16_1 = slot_0_50_7.current_point.player:get_origin()

		if slot_628_16_1 ~= nil and slot_0_50_7.current_point.player_origin ~= nil and slot_628_16_1:dist(slot_0_50_7.current_point.player_origin) > 64 then
			slot_0_50_7.should_retreat = true
		end

		slot_628_17_1 = slot_628_15_0.origin:clone()
		slot_628_17_1.z = slot_628_17_1.z + slot_628_15_0.view_offset
		slot_628_18_1 = slot_628_17_1:dist(slot_0_50_7.current_point.eye_pos)
		arg_628_0.move_yaw = slot_0_50_7.current_point.yaw
		arg_628_0.forwardmove = 450
		arg_628_0.sidemove = 0
		arg_628_0.buttons = 0
		arg_628_0.jitter_move = false

		slot_0_57_13(slot_0_49_6.slow_walk, false)
		slot_0_57_13(slot_0_49_6.retreat_mode, "On Shot")
		slot_0_57_13(slot_0_49_6.hit_chance, slot_0_50_7.hit_chance)

		slot_0_50_7.ai_state.state = 1
		slot_628_19_0 = slot_0_50_7.current_point.start_pos:dist(slot_0_50_7.current_point.pos)
		slot_628_20_0 = slot_628_19_0 > 0 and slot_628_18_1 / slot_628_19_0 or 0
		slot_628_21_0 = nil
		slot_628_22_0 = math.huge

		for iter_628_10, iter_628_11 in ipairs(slot_0_50_7.sample_points) do
			if iter_628_11.dmg ~= -1 and slot_628_22_0 > iter_628_11.dist then
				slot_628_22_0 = iter_628_11.dist
				slot_628_21_0 = iter_628_11
			end
		end

		slot_628_10_1 = slot_628_10_1 - globals.tickinterval
		slot_0_50_7.ai_state.pct = slot_628_20_0

		if slot_628_20_0 < 0.14 or slot_628_10_1 >= globals.curtime or slot_628_9_0 == true or slot_628_21_0 == nil or slot_628_21_0.player:is_dormant() == true then
			slot_0_50_7.should_retreat = true
		end
	else
		slot_0_50_7.should_retreat = false
	end

	if slot_0_50_7.should_retreat == true then
		slot_0_47_6.active = true

		if slot_0_50_7.current_point == nil then
			slot_0_62_18()

			return
		end

		slot_628_16_0 = slot_628_15_0.origin:dist(slot_0_50_7.current_point.start_pos)
		arg_628_0.move_yaw = slot_628_15_0.origin:to(slot_0_50_7.current_point.start_pos):angles().y
		arg_628_0.forwardmove = 450
		arg_628_0.sidemove = 0
		arg_628_0.buttons = 0
		arg_628_0.jitter_move = false

		slot_0_57_13(slot_0_49_6.slow_walk, false)
		slot_0_57_13(slot_0_49_6.retreat_mode, "On Shot")

		slot_628_17_0 = slot_0_50_7.current_point.start_pos:dist(slot_0_50_7.current_point.pos)
		slot_628_18_0 = slot_628_17_0 > 0 and slot_628_16_0 / slot_628_17_0 or 0

		if slot_628_9_0 == true and slot_628_18_0 > 1 then
			slot_0_50_7.should_retreat = false
			slot_0_50_7.is_peeking = false
			slot_0_50_7.current_point = nil
			slot_0_47_6.active = false
		end

		slot_628_10_0 = slot_628_10_1 - globals.tickinterval

		if slot_628_9_0 == true and slot_628_10_0 >= globals.curtime then
			slot_0_50_7.is_peeking = false
			slot_0_47_6.active = false
		end

		if slot_628_9_0 == true and (slot_628_8_0 == "SSG 08" or slot_628_8_0 == "AWP") and slot_628_3_0.m_bIsScoped ~= true then
			slot_0_50_7.is_peeking = false
			slot_0_47_6.active = false
		end

		if slot_628_18_0 < 0.25 then
			slot_0_50_7.should_retreat = false
			slot_0_50_7.is_peeking = false
			slot_0_50_7.current_point = nil
			slot_0_47_6.active = false
		end

		if slot_628_16_0 < slot_0_50_7.last_dist then
			if slot_0_50_7.is_moving_closer ~= true then
				slot_0_50_7.teleport_tick = globals.tickcount + 4
			end

			slot_0_50_7.is_moving_closer = true
		else
			slot_0_50_7.is_moving_closer = false
		end

		slot_0_50_7.last_dist = slot_628_16_0
		slot_0_50_7.ai_state.state = 2
		slot_0_50_7.ai_state.pct = slot_628_18_0
	else
		slot_0_50_7.last_dist = -math.huge
		slot_0_50_7.is_moving_closer = false
	end

	if slot_628_1_0 == true and globals.tickcount == slot_0_50_7.teleport_tick then
		rage.exploit:force_teleport()
	end
end

function slot_0_80_8(arg_629_0)
	slot_0_79_9(arg_629_0)

	do return end

	if arg_629_0 == nil then
		return
	end

	if not slot_0_59_15() then
		slot_0_62_18()

		return
	end

	slot_629_1_0 = slot_0_55_12(slot_0_49_6.double_tap) == true
	slot_629_2_0 = slot_0_55_12(slot_0_49_6.peek_assist) == true

	if not slot_629_1_0 or not slot_629_2_0 then
		slot_0_62_18()

		return
	end

	if slot_0_46_0 == nil then
		return
	end

	slot_629_3_1 = slot_0_54_11(slot_0_49_6.minimum_damage) or 0
	slot_629_4_0 = entity.get_local_player()

	if slot_629_4_0 == nil or slot_629_4_0:is_alive() ~= true then
		slot_0_62_18()

		return
	end

	slot_629_5_0 = ffi.cast(slot_0_46_0, slot_629_4_0[0])

	if slot_629_5_0 == nil then
		return
	end

	slot_629_6_0 = slot_629_5_0:get_model_ptr()

	if slot_629_6_0 == nil then
		return
	end

	slot_629_7_0 = slot_629_5_0:get_anim_overlay(10, true)

	if slot_629_7_0 ~= nil and slot_629_6_0:get_sequence_activity(slot_629_7_0.sequence) == 982 and slot_629_7_0.weight > 0 then
		slot_0_62_18()

		return
	end

	slot_629_8_0 = slot_629_4_0:get_player_weapon()

	if slot_629_8_0 == nil then
		slot_0_62_18()

		return
	end

	slot_629_9_0 = slot_0_35_0(slot_629_8_0:get_weapon_index())

	if not slot_0_60_16(slot_629_9_0) then
		slot_0_62_18()

		return
	end

	slot_0_50_7.ai_state.state = 3
	slot_0_47_6.active = false
	slot_629_10_0 = slot_0_54_11(slot_0_49_6.double_tap) == true and rage.exploit:get() < 1

	slot_0_61_17()

	slot_629_11_1 = math.max(slot_629_8_0.m_flNextPrimaryAttack, slot_629_4_0.m_flNextAttack)
	slot_629_12_0 = false
	slot_629_13_0 = entity.get_threat(true)

	if globals.realtime - slot_0_50_7.last_calc_time >= slot_0_50_7.rate_limit and slot_0_50_7.is_peeking ~= true and slot_629_13_0 == nil and slot_629_10_0 ~= true then
		slot_0_50_7.last_calc_time = globals.realtime

		slot_0_37_0(slot_0_50_7.scan_hitboxes)

		slot_629_14_2 = slot_0_54_11(slot_0_49_6.body_aim_disablers)

		if type(slot_629_14_2) ~= "table" then
			slot_629_14_2 = {}
		end

		slot_629_15_3 = slot_0_54_11(slot_0_49_6.body_aim) == "Force" and #slot_629_14_2 == 0

		if slot_629_15_3 ~= true and slot_0_49_6.hitboxes ~= nil and slot_0_49_6.hitboxes:get("Head") then
			slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 0
		end

		if slot_0_49_6.hitboxes ~= nil and slot_0_49_6.hitboxes:get("Chest") then
			slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 5
		end

		if slot_0_49_6.hitboxes ~= nil and slot_0_49_6.hitboxes:get("Stomach") then
			slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 3
		end

		if slot_629_15_3 ~= true and slot_0_49_6.hitboxes ~= nil then
			if slot_0_49_6.hitboxes:get("Legs") then
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 7
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 8
			end

			if slot_0_49_6.hitboxes:get("Feet") then
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 9
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 10
			end

			if slot_0_49_6.hitboxes:get("Arms") then
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 15
				slot_0_50_7.scan_hitboxes[#slot_0_50_7.scan_hitboxes + 1] = 17
			end
		end

		slot_0_50_7.current_point = nil

		slot_0_37_0(slot_0_50_7.sample_points)

		slot_629_16_3 = render.camera_position()
		slot_629_17_3 = render.camera_angles()
		slot_629_18_2 = vector():angles(slot_629_17_3)
		slot_629_19_1 = entity.get_players(true, false)
		slot_629_20_0 = math.huge
		slot_629_21_0 = nil

		for iter_629_0 = 1, #slot_629_19_1 do
			slot_629_26_1 = slot_629_19_1[iter_629_0]

			if slot_0_63_16(slot_629_26_1) == true then
				slot_629_27_1 = slot_629_26_1:get_origin()
				slot_629_27_1.z = slot_629_27_1.z + slot_629_26_1.m_vecMaxs.z * 0.5
				slot_629_28_1 = slot_629_27_1:dist_to_ray(slot_629_16_3, slot_629_18_2)

				if slot_629_28_1 < slot_629_20_0 then
					slot_629_20_0 = slot_629_28_1
					slot_629_21_0 = slot_629_26_1
				end
			end
		end

		if slot_629_21_0 == nil then
			return
		end

		slot_0_50_7.ai_state.entindex = slot_629_21_0:get_index()

		slot_0_30_0.set_lag_record_target("ai_peek", slot_0_50_7.ai_state.entindex)

		slot_629_22_1 = slot_0_31_0 ~= nil and slot_0_31_0.get_snapshot ~= nil and slot_0_31_0.get_snapshot(slot_629_21_0) or nil

		if slot_629_22_1 ~= nil and slot_629_22_1.command ~= nil and slot_629_22_1.command.no_entry ~= nil and slot_629_22_1.command.no_entry.y > 0 then
			slot_0_50_7.last_calc_time = globals.realtime - slot_0_50_7.rate_limit

			return
		end

		if slot_629_9_0 == "SSG 08" and slot_629_4_0.m_bIsScoped ~= true then
			return
		end

		slot_629_23_1 = slot_629_4_0.m_vecVelocity

		if slot_629_23_1 == nil or slot_629_23_1:length2d() >= 65 then
			return
		end

		slot_629_24_1 = math.max(tonumber(slot_629_21_0.m_iHealth) or 0, 0)
		slot_629_25_0 = {}

		for iter_629_1 = 1, #slot_0_50_7.scan_hitboxes do
			slot_629_25_0[iter_629_1] = slot_629_21_0:get_hitbox_position(slot_0_50_7.scan_hitboxes[iter_629_1])
		end

		slot_629_3_0 = slot_0_39_0(tonumber(slot_629_3_1) or 0, slot_629_24_1)
		slot_629_26_0 = arg_629_0.view_angles.y
		slot_629_27_0 = arg_629_0.forwardmove
		slot_629_28_0 = arg_629_0.sidemove
		slot_629_29_0 = arg_629_0.buttons
		slot_629_30_0 = slot_629_4_0:get_eye_position()
		slot_629_31_0 = slot_629_21_0:get_origin()

		if slot_629_30_0 == nil or slot_629_31_0 == nil then
			return
		end

		slot_629_32_0 = slot_629_30_0:to(slot_629_31_0):angles().y
		arg_629_0.forwardmove = 450
		arg_629_0.sidemove = 0
		arg_629_0.buttons = 0

		for iter_629_2 = 1, #slot_0_48_5.scan_yaw_offsets do
			slot_629_37_0 = slot_0_48_5.scan_yaw_offsets[iter_629_2]
			arg_629_0.view_angles.y = slot_0_36_0(slot_629_32_0 + slot_629_37_0 + 90)
			slot_629_38_0 = slot_629_4_0:simulate_movement()

			if slot_629_38_0 == nil or slot_629_38_0.origin == nil or slot_629_38_0.velocity == nil then
				break
			end

			slot_629_39_0 = slot_629_38_0.origin:clone()
			slot_629_40_0 = 0
			slot_629_41_0 = 0

			for iter_629_3 = 1, slot_0_50_7.simulation_time / globals.tickinterval do
				slot_629_46_0 = slot_629_38_0.velocity:length2d()

				slot_629_38_0:think()

				slot_629_47_0 = slot_629_38_0.velocity:length2d()

				if bit.band(slot_629_38_0.flags, 1) == 1 and slot_629_46_0 <= slot_629_47_0 then
					slot_629_48_0 = slot_629_38_0.origin:dist2d(slot_629_39_0)

					if slot_629_48_0 >= slot_0_48_5.min_move_dist then
						if slot_629_40_0 % slot_0_48_5.sample_rate == 0 then
							slot_629_49_0 = slot_629_38_0.origin:clone()
							slot_629_50_0 = slot_629_49_0:clone()
							slot_629_50_0.z = slot_629_50_0.z + slot_629_38_0.view_offset
							slot_629_51_0 = -1
							slot_629_52_0 = -1
							slot_629_53_0 = nil
							slot_629_54_0 = nil

							for iter_629_4 = 1, #slot_629_25_0 do
								slot_629_59_0 = slot_629_25_0[iter_629_4]

								if slot_629_59_0 ~= nil then
									slot_629_60_0 = slot_0_50_7.scan_hitboxes[iter_629_4] or -1
									slot_629_61_0, slot_629_62_0 = utils.trace_bullet(slot_629_4_0, slot_629_50_0, slot_629_59_0)

									if slot_629_62_0 ~= nil then
										slot_629_54_0 = slot_629_62_0.end_pos

										if (slot_629_3_0 <= slot_629_61_0 or slot_629_24_1 <= slot_629_61_0) and slot_0_67_18(slot_629_21_0, slot_629_60_0, slot_629_62_0) ~= true and slot_0_68_16(slot_629_62_0.entity, slot_629_21_0) == true then
											slot_629_63_0 = tonumber(slot_629_62_0.hitbox)

											if slot_629_63_0 ~= nil and slot_629_63_0 >= 0 then
												slot_629_52_0 = slot_629_63_0
												slot_629_53_0 = slot_629_21_0:get_hitbox_position(slot_629_63_0) or slot_629_59_0
											else
												slot_629_52_0 = slot_629_60_0
												slot_629_53_0 = slot_629_59_0
											end

											slot_629_51_0 = slot_629_61_0
											slot_629_12_0 = true

											break
										end
									end
								end
							end

							if slot_629_51_0 ~= -1 then
								slot_629_41_0 = slot_629_41_0 + 1
							else
								slot_629_41_0 = 0
							end

							slot_0_50_7.sample_points[#slot_0_50_7.sample_points + 1] = {
								player = slot_629_21_0,
								player_origin = slot_629_21_0:get_origin(),
								hitbox_id = slot_629_52_0,
								target_hitbox_pos = slot_629_53_0,
								start_pos = slot_629_39_0,
								pos = slot_629_49_0,
								eye_pos = slot_629_50_0,
								dmg = slot_629_51_0,
								required_damage = slot_629_3_0,
								dist = slot_629_48_0,
								ticks_to_move = iter_629_3,
								yaw = arg_629_0.view_angles.y,
								tr_end_pos = slot_629_54_0,
								support = slot_629_41_0,
								enemy_dmg = slot_629_51_0 ~= -1 and slot_0_40_0(slot_629_21_0, slot_629_50_0, slot_629_49_0) or math.huge
							}
						end

						slot_629_40_0 = slot_629_40_0 + 1
					end
				else
					break
				end
			end
		end

		arg_629_0.view_angles.y = slot_629_26_0
		arg_629_0.forwardmove = slot_629_27_0
		arg_629_0.sidemove = slot_629_28_0
		arg_629_0.buttons = slot_629_29_0
	end

	if slot_629_12_0 then
		slot_629_14_1 = math.max(tonumber(slot_629_4_0.m_iHealth) or 100, 1)
		slot_629_15_2 = -math.huge
		slot_629_16_2 = nil
		slot_629_17_2 = -math.huge
		slot_629_18_1 = nil

		for iter_629_5 = 1, #slot_0_50_7.sample_points do
			slot_629_23_0 = slot_0_50_7.sample_points[iter_629_5]

			if slot_629_23_0.dmg ~= -1 and slot_0_73_16(slot_629_23_0, slot_629_14_1) ~= true then
				slot_629_24_0 = slot_0_74_15(slot_629_23_0)

				if math.max(tonumber(slot_629_23_0.support) or 0, 0) >= slot_0_48_5.preferred_support then
					if slot_629_15_2 < slot_629_24_0 then
						slot_629_15_2 = slot_629_24_0
						slot_629_16_2 = slot_629_23_0
					end
				elseif slot_629_17_2 < slot_629_24_0 then
					slot_629_17_2 = slot_629_24_0
					slot_629_18_1 = slot_629_23_0
				end
			end
		end

		if slot_629_16_2 == nil then
			slot_629_16_2 = slot_629_18_1
		end

		if slot_629_16_2 ~= nil then
			slot_0_50_7.ai_state.last_hitbox_id = slot_629_16_2.hitbox_id or -1
			slot_0_50_7.ai_state.last_dmg = slot_629_16_2.dmg or 0
			slot_629_11_1 = slot_629_11_1 - slot_629_16_2.ticks_to_move * globals.tickinterval

			if slot_629_11_1 <= globals.curtime and slot_0_70_18(slot_629_4_0, slot_629_16_2) == true then
				slot_0_50_7.is_peeking = true
				slot_0_50_7.current_point = slot_629_16_2
				slot_0_50_7.last_live_check_time = 0
			end
		end
	end

	slot_629_14_0 = slot_629_4_0:simulate_movement()

	if slot_629_14_0 == nil or slot_629_14_0.origin == nil or slot_629_14_0.velocity == nil then
		slot_0_62_18()

		return
	end

	slot_629_14_0:think()

	if slot_0_50_7.is_peeking then
		slot_0_47_6.active = true

		slot_0_57_13(slot_0_49_6.retreat_mode, nil)

		if slot_0_50_7.current_point == nil then
			slot_0_62_18()

			return
		end

		slot_629_15_1 = slot_0_38_0(slot_0_50_7.current_point.player)

		if slot_629_15_1 ~= true then
			slot_0_50_7.should_retreat = true
		elseif slot_0_69_19(slot_0_50_7.current_point) == true then
			slot_0_50_7.should_retreat = true
		end

		slot_629_16_1 = slot_629_14_0.origin:clone()
		slot_629_16_1.z = slot_629_16_1.z + slot_629_14_0.view_offset
		slot_629_17_1 = slot_629_16_1:dist(slot_0_50_7.current_point.eye_pos)

		if slot_629_17_1 <= slot_0_48_5.live_verify_distance and globals.realtime - slot_0_50_7.last_live_check_time >= slot_0_48_5.live_verify_interval then
			slot_0_50_7.last_live_check_time = globals.realtime

			if slot_0_70_18(slot_629_4_0, slot_0_50_7.current_point) ~= true then
				slot_0_50_7.should_retreat = true
			end
		end

		arg_629_0.move_yaw = slot_0_50_7.current_point.yaw
		arg_629_0.forwardmove = 450
		arg_629_0.sidemove = 0
		arg_629_0.buttons = 0
		arg_629_0.jitter_move = false
		arg_629_0.force_defensive = true

		slot_0_57_13(slot_0_49_6.slow_walk, false)
		slot_0_57_13(slot_0_49_6.retreat_mode, "On Shot")
		slot_0_57_13(slot_0_49_6.hit_chance, slot_0_50_7.hit_chance)

		slot_0_50_7.ai_state.state = 1
		slot_629_18_0 = slot_0_50_7.current_point.start_pos:dist(slot_0_50_7.current_point.pos)
		slot_629_19_0 = slot_629_18_0 > 0 and slot_629_17_1 / slot_629_18_0 or 0
		slot_629_11_1 = slot_629_11_1 - globals.tickinterval
		slot_0_50_7.ai_state.pct = slot_629_19_0

		if slot_629_19_0 < 0.14 or slot_629_11_1 >= globals.curtime or slot_629_10_0 or slot_629_15_1 and slot_0_50_7.current_point.player:is_dormant() then
			slot_0_50_7.should_retreat = true
		end
	else
		slot_0_50_7.should_retreat = false
	end

	if slot_0_50_7.should_retreat then
		slot_0_47_6.active = true

		if slot_0_50_7.current_point == nil then
			slot_0_62_18()

			return
		end

		slot_629_15_0 = slot_629_14_0.origin:dist(slot_0_50_7.current_point.start_pos)
		arg_629_0.move_yaw = slot_629_14_0.origin:to(slot_0_50_7.current_point.start_pos):angles().y
		arg_629_0.forwardmove = 450
		arg_629_0.sidemove = 0
		arg_629_0.buttons = 0
		arg_629_0.jitter_move = false

		slot_0_57_13(slot_0_49_6.slow_walk, false)
		slot_0_57_13(slot_0_49_6.retreat_mode, "On Shot")

		slot_629_16_0 = slot_0_50_7.current_point.start_pos:dist(slot_0_50_7.current_point.pos)
		slot_629_17_0 = slot_629_16_0 > 0 and slot_629_15_0 / slot_629_16_0 or 0

		if slot_629_10_0 and slot_629_17_0 > 1 then
			slot_0_50_7.should_retreat = false
			slot_0_50_7.is_peeking = false
			slot_0_50_7.current_point = nil
		end

		slot_629_11_0 = slot_629_11_1 - globals.tickinterval

		if slot_629_10_0 and slot_629_11_0 >= globals.curtime then
			slot_0_50_7.is_peeking = false
		end

		if slot_629_10_0 and slot_629_9_0 == "SSG 08" and slot_629_4_0.m_bIsScoped ~= true then
			slot_0_50_7.is_peeking = false
		end

		if slot_629_17_0 < 0.25 then
			slot_0_50_7.should_retreat = false
			slot_0_50_7.is_peeking = false
			slot_0_50_7.current_point = nil
		end

		if slot_629_15_0 < slot_0_50_7.last_dist then
			if slot_0_50_7.is_moving_closer ~= true then
				slot_0_50_7.teleport_tick = globals.tickcount + 4
			end

			slot_0_50_7.is_moving_closer = true
		else
			slot_0_50_7.is_moving_closer = false
		end

		slot_0_50_7.last_dist = slot_629_15_0
		slot_0_50_7.ai_state.state = 2
		slot_0_50_7.ai_state.pct = slot_629_17_0
	else
		slot_0_50_7.last_dist = -math.huge
		slot_0_50_7.is_moving_closer = false
	end

	if slot_629_1_0 and globals.tickcount == slot_0_50_7.teleport_tick then
		arg_629_0.force_defensive = true

		if rage.exploit.force_charge ~= nil then
			pcall(rage.exploit.force_charge, rage.exploit)
		end

		rage.exploit:force_teleport()

		slot_0_50_7.teleport_tick = 0
	end
end

function slot_0_81_6()
	if not slot_0_59_15() or slot_0_50_7.current_point == nil or slot_0_50_7.is_peeking ~= true then
		return
	end

	slot_630_0_0 = entity.get_local_player()

	if slot_630_0_0 == nil or slot_630_0_0:is_alive() ~= true then
		return
	end

	slot_630_1_0 = slot_0_55_12(slot_0_49_6.double_tap) == true
	slot_630_2_0 = slot_0_55_12(slot_0_49_6.peek_assist) == true

	if not slot_630_1_0 or not slot_630_2_0 then
		return
	end

	slot_630_3_0 = render.get_offscreen(slot_0_50_7.current_point.eye_pos, 1, true)
	slot_630_4_0 = render.get_offscreen(slot_0_50_7.current_point.tr_end_pos, 1, true)
	slot_630_5_0 = render.get_offscreen(slot_0_50_7.current_point.start_pos, 1, true)
	slot_630_6_0 = render.get_offscreen(slot_0_50_7.current_point.pos, 1, true)
	slot_630_7_0 = slot_0_50_7.current_point.pos + slot_0_53_10.z2
	slot_630_8_0 = slot_0_50_7.current_point.pos + slot_0_53_10.z72
	slot_630_9_0 = slot_0_50_7.current_point.pos + slot_0_53_10.z36
	slot_630_10_0 = slot_0_50_7.draw_color:alpha_modulate(255)
	slot_630_11_0 = slot_0_51_8.line
	slot_630_12_0 = slot_0_51_8.soft_line
	slot_630_13_0 = slot_0_51_8.shadow
	slot_630_14_0 = 18

	render.circle_3d_outline(slot_630_7_0, slot_630_13_0, slot_630_14_0, 0, 1, 2.4)
	render.circle_3d_outline(slot_630_8_0, slot_630_13_0, slot_630_14_0, 0, 1, 2.4)
	render.circle_3d_outline(slot_630_7_0, slot_630_11_0, slot_630_14_0, 0, 1, 1.2)
	render.circle_3d_outline(slot_630_8_0, slot_630_11_0, slot_630_14_0, 0, 1, 1.2)

	slot_630_15_0 = render.world_to_screen(slot_630_7_0)
	slot_630_16_0 = render.world_to_screen(slot_630_8_0)
	slot_630_17_0 = render.world_to_screen(slot_630_9_0)
	slot_630_18_0 = render.world_to_screen(slot_630_7_0 + vector(slot_630_14_0, 0, 0))
	slot_630_19_0 = render.world_to_screen(slot_630_8_0 + vector(slot_630_14_0, 0, 0))
	slot_630_20_0 = render.world_to_screen(slot_630_7_0 + vector(-slot_630_14_0, 0, 0))
	slot_630_21_0 = render.world_to_screen(slot_630_8_0 + vector(-slot_630_14_0, 0, 0))
	slot_630_22_0 = render.world_to_screen(slot_630_7_0 + vector(0, slot_630_14_0, 0))
	slot_630_23_0 = render.world_to_screen(slot_630_8_0 + vector(0, slot_630_14_0, 0))
	slot_630_24_0 = render.world_to_screen(slot_630_7_0 + vector(0, -slot_630_14_0, 0))
	slot_630_25_0 = render.world_to_screen(slot_630_8_0 + vector(0, -slot_630_14_0, 0))

	slot_0_42_0(slot_630_18_0, slot_630_19_0, slot_630_12_0, slot_630_13_0)
	slot_0_42_0(slot_630_20_0, slot_630_21_0, slot_630_12_0, slot_630_13_0)
	slot_0_42_0(slot_630_22_0, slot_630_23_0, slot_630_12_0, slot_630_13_0)
	slot_0_42_0(slot_630_24_0, slot_630_25_0, slot_630_12_0, slot_630_13_0)
	slot_0_41_0(slot_630_15_0, 3, slot_630_10_0, slot_630_13_0)
	slot_0_41_0(slot_630_17_0, 3, slot_630_10_0, slot_630_13_0)
	slot_0_41_0(slot_630_16_0, 3, slot_630_10_0, slot_630_13_0)
	slot_0_41_0(slot_630_3_0, 3, slot_630_10_0, slot_630_13_0)
	slot_0_41_0(slot_630_4_0, 3, slot_630_10_0, slot_630_13_0)
	slot_0_41_0(slot_630_5_0, 3, slot_630_10_0, slot_630_13_0)
	slot_0_41_0(slot_630_6_0, 3, slot_630_10_0, slot_630_13_0)
	slot_0_42_0(slot_630_3_0, slot_630_4_0, slot_630_12_0, slot_630_13_0)
	slot_0_42_0(slot_630_5_0, slot_630_6_0, slot_630_12_0, slot_630_13_0)
	render.highlight_hitbox(slot_0_50_7.current_point.player, slot_0_50_7.current_point.hitbox_id, slot_0_50_7.draw_color)
end

function slot_0_82_6(arg_631_0)
	if arg_631_0 == slot_0_50_7.callbacks_registered then
		return
	end

	events.createmove(slot_0_80_8, arg_631_0)
	events.render(slot_0_81_6, arg_631_0)

	slot_0_50_7.callbacks_registered = arg_631_0
end

function slot_0_83_6(arg_632_0)
	local var_632_0 = arg_632_0 ~= nil and arg_632_0:get() == true

	if var_632_0 ~= true then
		slot_0_62_18()
	end

	slot_0_82_6(var_632_0)
end

if slot_0_47_6.simulation ~= nil then
	slot_0_47_6.simulation:set_callback(slot_0_75_12, true)
end

if slot_0_47_6.rate_limit ~= nil then
	slot_0_47_6.rate_limit:set_callback(slot_0_76_11, true)
end

if slot_0_47_6.hit_chance ~= nil then
	slot_0_47_6.hit_chance:set_callback(slot_0_77_10, true)
end

if slot_0_47_6.ignore_limbs ~= nil then
	slot_0_47_6.ignore_limbs:set_callback(function(arg_633_0)
		slot_0_50_7.ignore_limbs = arg_633_0 ~= nil and arg_633_0:get() == true
	end, true)
end

if slot_0_47_6.color ~= nil then
	slot_0_47_6.color:set_callback(slot_0_78_10, true)
end

if slot_0_47_6.enabled ~= nil then
	slot_0_47_6.enabled:set_callback(slot_0_83_6, true)
end

events.shutdown(function()
	slot_0_82_6(false)
	slot_0_62_18()
end, true)

slot_0_47_5 = slot_0_21_0.auto_unpeek
slot_0_48_4 = {
	live_eye_delta = 22,
	fail_attackable_retreat_ticks = 2,
	default_peek_distance = 42,
	default_rate_limit = 0.02,
	default_simulation_time = 0.3,
	attackable_confirm_ticks = 3,
	bait_rearm_cooldown = 0.8,
	attackable_commit_pct = 0.06,
	max_target_hitbox_delta = 18,
	max_target_origin_delta = 24,
	stop_distance = 10,
	stall_tick_limit = 12,
	running_anchor_max_trail = 72,
	min_peek_distance = 18,
	strict_target_speed = 85,
	strict_target_origin_delta = 8,
	strict_target_hitbox_delta = 6,
	sample_support_points = 2,
	strict_sample_support_points = 3,
	strict_attackable_probe_min_delta = 10,
	strict_pending_support_bonus = 0,
	strict_pending_point_scans = 1,
	strict_pending_point_delta = 14,
	strict_live_eye_delta = 14,
	strict_fail_attackable_retreat_ticks = 2,
	strict_attackable_commit_pct = 0.11,
	strict_attackable_confirm_ticks = 4,
	rearm_target_origin_delta = 64,
	peek_target_origin_delta = 96,
	post_shot_rearm_cooldown = 0.1,
	pending_support_bonus = 0,
	pending_point_scans = 1,
	pending_point_delta = 20,
	max_stationary_start_speed = 14,
	max_stationary_scan_speed = 65,
	max_running_start_speed = 260,
	max_running_scan_speed = 260,
	max_rate_limit = 0.03
}
slot_0_49_5 = {
	double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap") or slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.double_tap,
	peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
	body_aim = slot_0_11_0.rage and slot_0_11_0.rage.safety and slot_0_11_0.rage.safety.body_aim,
	body_aim_disablers = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers"),
	hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
	minimum_damage = slot_0_11_0.rage and slot_0_11_0.rage.selection and slot_0_11_0.rage.selection.minimum_damage,
	retreat_mode = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.peek_assist and slot_0_11_0.rage.main.peek_assist[4] or nil,
	slow_walk = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.slow_walk
}
slot_0_50_6 = {
	callbacks_registered = false,
	last_scan_time = 0,
	status_reason = "waiting for scan",
	attackable_ticks = 0,
	vital_hitboxes_only = false,
	should_retreat = false,
	is_peeking = false,
	strict_antibait = true,
	retreat_on_shot = false,
	status_title = "NO PEEK",
	debug_overlay = true,
	active_with_running = true,
	stalled_ticks = 0,
	shot_fired = false,
	running_anchor_locked = false,
	rearm_cooldown_until = 0,
	pending_point_scans = 0,
	mode = "Aggressive",
	failed_attackable_ticks = 0,
	disable_on_peek_assist = false,
	blocked_target_index = -1,
	last_dist = math.huge,
	sample_points = {},
	scan_hitboxes = {}
}
slot_0_51_7 = nil
slot_0_52_8 = {
	default = color(180, 180, 180, 180),
	selected = color(120, 235, 120, 255),
	pending = color(255, 210, 90, 245),
	risky = color(235, 90, 90, 210),
	radius = color(255, 165, 70, 210),
	support = color(245, 225, 120, 210),
	dmg = color(170, 215, 255, 210),
	gray = color(160, 160, 160, 160),
	chosen_alt = color(110, 190, 255, 245)
}
slot_0_53_9 = {
	z2 = vector(0, 0, 2),
	z72 = vector(0, 0, 72),
	z36 = vector(0, 0, 36),
	z3 = vector(0, 0, 3),
	z4 = vector(0, 0, 4),
	x_pos = vector(1, 0, 0),
	x_neg = vector(-1, 0, 0),
	y_pos = vector(0, 1, 0),
	y_neg = vector(-1, 0, 0),
	shadow_offset = vector(1, 1)
}
slot_0_54_10 = {
	line = color(194, 194, 194, 235),
	soft_line = color(194, 194, 194, 150),
	shadow = color(0, 0, 0, 120)
}

function slot_0_55_11(arg_635_0, arg_635_1)
	if arg_635_0 == nil or arg_635_0.override == nil then
		return
	end

	if arg_635_1 == nil then
		pcall(arg_635_0.override, arg_635_0)

		return
	end

	pcall(arg_635_0.override, arg_635_0, arg_635_1)
end

function slot_0_56_11(arg_636_0)
	if arg_636_0 == nil then
		return false
	end

	local var_636_0 = arg_636_0.in_duck

	return var_636_0 == true or type(var_636_0) == "number" and var_636_0 ~= 0
end

function slot_0_57_12(arg_637_0, arg_637_1)
	if arg_637_0 == nil then
		return false
	end

	if slot_0_56_11(arg_637_1) == true then
		return true
	end

	return (tonumber(arg_637_0.m_flDuckAmount) or 0) >= 0.45
end

function slot_0_58_13()
	return slot_0_47_5 ~= nil and slot_0_47_5.enabled ~= nil and slot_0_47_5.enabled:get() == true
end

function slot_0_59_14()
	if rage == nil or rage.exploit == nil or rage.exploit.get == nil then
		return nil
	end

	local var_639_0, var_639_1 = pcall(rage.exploit.get, rage.exploit)

	if not var_639_0 or type(var_639_1) ~= "number" then
		return nil
	end

	return var_639_1
end

function slot_0_60_15(arg_640_0)
	if arg_640_0 == nil or arg_640_0.get == nil then
		return nil
	end

	local var_640_0, var_640_1 = pcall(arg_640_0.get, arg_640_0)

	if not var_640_0 then
		return nil
	end

	return var_640_1
end

function slot_0_61_16(arg_641_0)
	if rage == nil or rage.exploit == nil or rage.exploit.allow_charge == nil then
		return
	end

	pcall(rage.exploit.allow_charge, rage.exploit, arg_641_0)
end

function slot_0_62_17(arg_642_0)
	return string.format("%.2fs", math.max(tonumber(arg_642_0) or 0, 0))
end

function slot_0_63_15(arg_643_0, arg_643_1)
	slot_0_50_6.status_title = type(arg_643_0) == "string" and arg_643_0 or "NO PEEK"
	slot_0_50_6.status_reason = type(arg_643_1) == "string" and arg_643_1 or ""
end

function slot_0_64_16(arg_644_0)
	slot_0_63_15("NO PEEK", arg_644_0)
end

function slot_0_65_17(arg_645_0)
	slot_0_63_15("CAN PEEK", arg_645_0)
end

function slot_0_66_17(arg_646_0)
	slot_0_63_15("PEEKING", arg_646_0)
end

function slot_0_67_17(arg_647_0)
	slot_0_63_15("RETURNING", arg_647_0)
end

function slot_0_68_15()
	slot_0_37_0(slot_0_50_6.sample_points)

	slot_0_50_6.last_best_point = nil
	slot_0_50_6.last_scan_target = nil
end

function slot_0_69_18()
	return slot_0_50_6.mode == "Legit Safe"
end

function slot_0_70_17()
	return slot_0_69_18() ~= true
end

function slot_0_71_17()
	return slot_0_69_18() == true
end

function slot_0_72_15(arg_652_0)
	if arg_652_0 == nil then
		return slot_0_52_8.default
	end

	if arg_652_0 == slot_0_50_6.current_point or arg_652_0.selected == true then
		return slot_0_52_8.selected
	end

	if arg_652_0 == slot_0_50_6.pending_point then
		return slot_0_52_8.pending
	end

	local var_652_0 = arg_652_0.reject_reason

	if var_652_0 == "risky" then
		return slot_0_52_8.risky
	end

	if var_652_0 == "radius" then
		return slot_0_52_8.radius
	end

	if var_652_0 == "support" then
		return slot_0_52_8.support
	end

	if arg_652_0.dmg ~= -1 then
		return slot_0_52_8.dmg
	end

	return slot_0_52_8.gray
end

function slot_0_73_15(arg_653_0)
	if arg_653_0 == nil or arg_653_0.pos == nil then
		return
	end

	local var_653_0 = render.world_to_screen(arg_653_0.pos + slot_0_53_9.z4)

	if var_653_0 == nil then
		return
	end

	local var_653_1 = slot_0_72_15(arg_653_0)

	slot_0_41_0(var_653_0, (arg_653_0 == slot_0_50_6.current_point or arg_653_0.selected == true) and 4 or 2, var_653_1, slot_0_54_10.shadow)
end

function slot_0_74_14()
	if slot_0_50_6.debug_overlay ~= true then
		return
	end

	local var_654_0 = entity.get_local_player()

	if var_654_0 == nil or var_654_0:is_alive() ~= true then
		return
	end

	for iter_654_0 = 1, #slot_0_50_6.sample_points do
		slot_0_73_15(slot_0_50_6.sample_points[iter_654_0])
	end

	local var_654_1 = slot_0_50_6.current_point or slot_0_50_6.last_best_point

	if var_654_1 == nil or var_654_1.pos == nil then
		return
	end

	local var_654_2 = var_654_1 == slot_0_50_6.current_point and slot_0_52_8.selected or slot_0_52_8.chosen_alt
	local var_654_3 = var_654_1.pos + slot_0_53_9.z3

	render.circle_3d_outline(var_654_3, slot_0_54_10.shadow, 14, 0, 1, 2.4)
	render.circle_3d_outline(var_654_3, var_654_2, 14, 0, 1, 1.2)

	local var_654_4 = var_654_1.start_pos ~= nil and render.world_to_screen(var_654_1.start_pos + slot_0_53_9.z2) or nil
	local var_654_5 = render.world_to_screen(var_654_3)

	if var_654_4 ~= nil and var_654_5 ~= nil then
		slot_0_42_0(var_654_4, var_654_5, var_654_2, slot_0_54_10.shadow)
	end

	if var_654_1.eye_pos ~= nil and var_654_1.tr_end_pos ~= nil then
		local var_654_6 = render.world_to_screen(var_654_1.eye_pos)
		local var_654_7 = render.world_to_screen(var_654_1.tr_end_pos)

		if var_654_6 ~= nil and var_654_7 ~= nil then
			slot_0_42_0(var_654_6, var_654_7, var_654_2:alpha_modulate(200), slot_0_54_10.shadow)
		end
	end

	if slot_0_38_0(var_654_1.player) == true and var_654_1.hitbox_id ~= nil and var_654_1.hitbox_id >= 0 and var_654_1.hitbox_id <= 18 then
		pcall(render.highlight_hitbox, var_654_1.player, var_654_1.hitbox_id, var_654_2)
	end
end

function slot_0_75_11()
	if slot_0_51_7() ~= true then
		return
	end

	local var_655_0 = entity.get_local_player()

	if ui.get_alpha() > 0 ~= true and (var_655_0 == nil or var_655_0:is_alive() ~= true) then
		return
	end

	slot_0_74_14()
end

function slot_0_51_7()
	return slot_0_58_13() == true
end

function slot_0_76_10(arg_657_0)
	if arg_657_0 == nil then
		return nil
	end

	if arg_657_0.get_override ~= nil then
		local var_657_0, var_657_1 = pcall(arg_657_0.get_override, arg_657_0)

		if var_657_0 and var_657_1 ~= nil then
			return var_657_1
		end
	end

	if arg_657_0.get == nil then
		return nil
	end

	local var_657_2, var_657_3 = pcall(arg_657_0.get, arg_657_0)

	if not var_657_2 then
		return nil
	end

	return var_657_3
end

function slot_0_77_9(arg_658_0, arg_658_1)
	if arg_658_0 == nil or type(arg_658_1) ~= "string" then
		return false
	end

	local var_658_0, var_658_1 = pcall(arg_658_0.get, arg_658_0, arg_658_1)

	if var_658_0 and type(var_658_1) == "boolean" then
		return var_658_1
	end

	local var_658_2, var_658_3 = pcall(arg_658_0.get, arg_658_0)

	if not var_658_2 or type(var_658_3) ~= "table" then
		return false
	end

	for iter_658_0 = 1, #var_658_3 do
		if var_658_3[iter_658_0] == arg_658_1 then
			return true
		end
	end

	return false
end

function slot_0_78_9()
	local var_659_0 = slot_0_21_0.ai_peek

	if var_659_0 == nil then
		return false
	end

	if slot_0_76_10(var_659_0.enabled) == true then
		return true
	end

	if var_659_0.active == true then
		return true
	end

	if ui.get_binds == nil or var_659_0.enabled == nil then
		return false
	end

	local var_659_1, var_659_2 = pcall(ui.get_binds)

	if not var_659_1 or type(var_659_2) ~= "table" then
		return false
	end

	for iter_659_0 = 1, #var_659_2 do
		local var_659_3 = var_659_2[iter_659_0]

		if var_659_3 ~= nil and var_659_3.reference == var_659_0.enabled and var_659_3.active == true then
			return true
		end
	end

	return false
end

function slot_0_79_8(arg_660_0)
	local var_660_0 = slot_0_47_5 ~= nil and slot_0_47_5.weapons or nil

	if var_660_0 == nil and slot_0_21_0.ai_peek ~= nil then
		var_660_0 = slot_0_21_0.ai_peek.weapons
	end

	if var_660_0 == nil then
		return true
	end

	local var_660_1, var_660_2 = pcall(var_660_0.get, var_660_0)

	if var_660_1 and type(var_660_2) == "table" and #var_660_2 == 0 then
		return true
	end

	return slot_0_77_9(var_660_0, arg_660_0)
end

function slot_0_80_7()
	local var_661_0 = slot_0_47_5 ~= nil and slot_0_47_5.simulation or nil
	local var_661_1 = slot_0_47_5 ~= nil and slot_0_47_5.rate_limit or nil
	local var_661_2 = slot_0_47_5 ~= nil and slot_0_47_5.radius or nil

	if var_661_0 == nil and slot_0_21_0.ai_peek ~= nil then
		var_661_0 = slot_0_21_0.ai_peek.simulation
	end

	if var_661_1 == nil and slot_0_21_0.ai_peek ~= nil then
		var_661_1 = slot_0_21_0.ai_peek.rate_limit
	end

	local var_661_3 = var_661_0 ~= nil and var_661_0:get() or nil
	local var_661_4 = var_661_1 ~= nil and var_661_1:get() or nil
	local var_661_5 = var_661_2 ~= nil and var_661_2:get() or nil
	local var_661_6 = (tonumber(var_661_3) or 30) * 0.01
	local var_661_7 = (tonumber(var_661_4) or 2) * 0.01
	local var_661_8 = tonumber(var_661_5) or slot_0_48_4.default_peek_distance
	local var_661_9 = slot_0_34_0

	if var_661_6 <= 0 then
		var_661_6 = slot_0_48_4.default_simulation_time
	end

	if var_661_7 < 0 then
		var_661_7 = slot_0_48_4.default_rate_limit
	end

	if var_661_7 > slot_0_48_4.max_rate_limit then
		var_661_7 = slot_0_48_4.max_rate_limit
	end

	if slot_0_70_17() == true then
		var_661_7 = math.min(var_661_7, 0.005)
	end

	if var_661_8 < slot_0_48_4.min_peek_distance then
		var_661_8 = slot_0_48_4.min_peek_distance
	end

	local var_661_10 = 0.22 + var_661_8 * 0.0014

	if var_661_6 < var_661_10 then
		var_661_6 = var_661_10
	end

	if var_661_8 >= 72 then
		var_661_9 = 8
	elseif var_661_8 >= 60 then
		var_661_9 = 6
	elseif var_661_8 >= 36 then
		var_661_9 = 4
	end

	return var_661_6, var_661_7, var_661_8, var_661_9
end

function slot_0_81_5(arg_662_0)
	local var_662_0 = arg_662_0 ~= nil and tonumber(arg_662_0.enemy_dmg) or nil

	if var_662_0 == nil or var_662_0 < 0 or var_662_0 == math.huge then
		return nil
	end

	return var_662_0
end

function slot_0_82_5(arg_663_0, arg_663_1, arg_663_2)
	local var_663_0 = slot_0_81_5(arg_663_0)

	if var_663_0 == nil then
		return false
	end

	if arg_663_1 <= var_663_0 then
		return true
	end

	local var_663_1 = math.max(tonumber(arg_663_0 ~= nil and arg_663_0.dmg) or 0, 0)
	local var_663_2 = math.max(tonumber(arg_663_0 ~= nil and arg_663_0.support) or 0, 0)

	if slot_0_71_17() ~= true then
		if var_663_0 >= var_663_1 + 52 and var_663_2 <= arg_663_2 then
			return true
		end

		if var_663_2 <= arg_663_2 and var_663_0 >= math.max(arg_663_1 * 0.88, 78) then
			return true
		end

		return false
	end

	if var_663_0 >= var_663_1 + 18 and var_663_2 <= arg_663_2 then
		return true
	end

	if var_663_2 <= arg_663_2 and var_663_0 >= math.max(arg_663_1 * 0.65, 48) then
		return true
	end

	return false
end

function slot_0_83_5(arg_664_0, arg_664_1)
	local var_664_0 = math.max(tonumber(arg_664_0 ~= nil and arg_664_0.support) or 0, 0)
	local var_664_1 = tonumber(arg_664_0 ~= nil and arg_664_0.peek_dist) or tonumber(arg_664_0 ~= nil and arg_664_0.dist) or 0
	local var_664_2 = math.max(tonumber(arg_664_0 ~= nil and arg_664_0.dmg) or 0, 0)
	local var_664_3 = slot_0_81_5(arg_664_0)
	local var_664_4 = math.max(arg_664_1 - var_664_1, 0)
	local var_664_5 = math.max(var_664_1 - arg_664_1, 0)
	local var_664_6 = math.abs(var_664_1 - arg_664_1)
	local var_664_7 = math.max(tonumber(arg_664_0 ~= nil and arg_664_0.ticks_to_move) or 0, 0)
	local var_664_8 = slot_0_71_17()
	local var_664_9 = var_664_0 * (var_664_8 == true and 28 or 18) + math.min(var_664_2, 130) - var_664_4 * (var_664_8 == true and 4.2 or 3.1) - var_664_5 * (var_664_8 == true and 1.6 or 0.9) - var_664_7 * (var_664_8 == true and 2.1 or 1)

	if var_664_3 == nil then
		var_664_9 = var_664_9 - (var_664_8 == true and 16 or 6)
	else
		var_664_9 = var_664_9 - var_664_3 * (var_664_8 == true and 1.15 or 0.65)
		var_664_9 = var_664_9 + math.max(var_664_2 - var_664_3, -48) * (var_664_8 == true and 0.7 or 0.95)
	end

	return var_664_9, var_664_6, var_664_0, var_664_1
end

function slot_0_84_5(arg_665_0, arg_665_1, arg_665_2, arg_665_3, arg_665_4, arg_665_5, arg_665_6, arg_665_7)
	local var_665_0 = math.abs(arg_665_1 - arg_665_7)
	local var_665_1 = arg_665_0 - arg_665_3
	local var_665_2 = var_665_0 - arg_665_6

	if var_665_1 > 6 then
		return true, var_665_0
	end

	if var_665_1 < -6 then
		return false, var_665_0
	end

	if math.abs(var_665_2) <= 4 then
		if arg_665_4 < arg_665_2 then
			return true, var_665_0
		end

		if arg_665_2 < arg_665_4 then
			return false, var_665_0
		end

		if math.abs(var_665_1) > 1 then
			return arg_665_3 < arg_665_0, var_665_0
		end

		return arg_665_5 < arg_665_1, var_665_0
	end

	if var_665_0 < arg_665_6 then
		return true, var_665_0
	end

	if arg_665_6 < var_665_0 then
		return false, var_665_0
	end

	if arg_665_4 < arg_665_2 then
		return true, var_665_0
	end

	if arg_665_2 < arg_665_4 then
		return false, var_665_0
	end

	if arg_665_0 ~= arg_665_3 then
		return arg_665_3 < arg_665_0, var_665_0
	end

	return arg_665_5 < arg_665_1, var_665_0
end

function slot_0_85_5()
	if slot_0_50_6.active_with_running == true then
		return slot_0_48_4.max_running_scan_speed
	end

	return slot_0_48_4.max_stationary_scan_speed
end

function slot_0_86_4()
	if slot_0_50_6.active_with_running == true then
		return slot_0_48_4.max_running_start_speed
	end

	return slot_0_48_4.max_stationary_start_speed
end

function slot_0_87_5()
	slot_0_50_6.attackable_ticks = 0
	slot_0_50_6.attackable_origin = nil
	slot_0_50_6.attackable_hitbox_pos = nil
end

function slot_0_88_5()
	if slot_0_71_17() == true then
		return slot_0_48_4.strict_fail_attackable_retreat_ticks
	end

	return slot_0_48_4.fail_attackable_retreat_ticks
end

function slot_0_89_4()
	if slot_0_71_17() == true then
		return slot_0_48_4.strict_attackable_confirm_ticks
	end

	return slot_0_48_4.attackable_confirm_ticks
end

function slot_0_90_4()
	if slot_0_71_17() == true then
		return slot_0_48_4.strict_sample_support_points
	end

	return slot_0_48_4.sample_support_points
end

function slot_0_91_3()
	if slot_0_71_17() == true then
		return slot_0_48_4.strict_attackable_commit_pct
	end

	return slot_0_48_4.attackable_commit_pct
end

function slot_0_92_3(arg_673_0)
	local var_673_0 = slot_0_91_3()

	if arg_673_0 == nil then
		return var_673_0
	end

	local var_673_1 = math.max(tonumber(arg_673_0.support) or 0, 0)
	local var_673_2 = slot_0_90_4()
	local var_673_3 = slot_0_71_17()

	if var_673_1 <= var_673_2 then
		return var_673_0 + (var_673_3 == true and 0.05 or 0.02)
	end

	if var_673_1 >= var_673_2 + 2 then
		return math.max(var_673_0 - 0.02, 0.06)
	end

	return var_673_0
end

function slot_0_93_3(arg_674_0)
	local var_674_0 = slot_0_89_4()

	if arg_674_0 == nil then
		return var_674_0
	end

	local var_674_1 = math.max(tonumber(arg_674_0.support) or 0, 0)
	local var_674_2 = slot_0_90_4()

	if var_674_1 <= var_674_2 then
		return var_674_0 + (slot_0_71_17() == true and 1 or 0)
	end

	if var_674_1 >= var_674_2 + 2 then
		return math.max(var_674_0 - 1, 2)
	end

	return var_674_0
end

function slot_0_94_3()
	if slot_0_71_17() == true then
		return slot_0_48_4.strict_pending_point_scans
	end

	return slot_0_48_4.pending_point_scans
end

function slot_0_95_3()
	if slot_0_71_17() == true then
		return slot_0_48_4.strict_pending_point_delta
	end

	return slot_0_48_4.pending_point_delta
end

function slot_0_96_3()
	local var_677_0 = slot_0_90_4()

	if slot_0_71_17() == true then
		var_677_0 = var_677_0 + slot_0_48_4.strict_pending_support_bonus
	else
		var_677_0 = var_677_0 + slot_0_48_4.pending_support_bonus
	end

	return var_677_0
end

function slot_0_97_3(arg_678_0)
	local var_678_0 = slot_0_94_3()

	if var_678_0 <= 1 then
		return 1
	end

	if math.max(tonumber(arg_678_0 ~= nil and arg_678_0.support) or 0, 0) >= slot_0_96_3() + 1 then
		return var_678_0 - 1
	end

	return var_678_0
end

function slot_0_98_3(arg_679_0)
	if arg_679_0 == nil then
		return nil
	end

	if arg_679_0.anchor_pos ~= nil then
		return arg_679_0.anchor_pos
	end

	return arg_679_0.start_pos
end

function slot_0_99_3()
	slot_0_50_6.pending_point = nil
	slot_0_50_6.pending_point_scans = 0
end

function slot_0_100_3(arg_681_0)
	local var_681_0 = arg_681_0 ~= nil and arg_681_0.player or nil

	if var_681_0 == nil or var_681_0.get_index == nil then
		return nil
	end

	local var_681_1 = var_681_0:get_index()

	if type(var_681_1) ~= "number" then
		return nil
	end

	return var_681_1
end

function slot_0_101_4(arg_682_0)
	local var_682_0 = slot_0_50_6.pending_point

	if arg_682_0 == nil or var_682_0 == nil then
		return false
	end

	if slot_0_100_3(arg_682_0) ~= slot_0_100_3(var_682_0) then
		return false
	end

	if arg_682_0.pos == nil or var_682_0.pos == nil then
		return false
	end

	local var_682_1 = slot_0_95_3()

	if var_682_1 < arg_682_0.pos:dist2d(var_682_0.pos) then
		return false
	end

	if arg_682_0.eye_pos ~= nil and var_682_0.eye_pos ~= nil and var_682_1 < arg_682_0.eye_pos:dist(var_682_0.eye_pos) then
		return false
	end

	return true
end

function slot_0_102_3(arg_683_0)
	if arg_683_0 == nil then
		slot_0_99_3()

		return false
	end

	if math.max(tonumber(arg_683_0.support) or 0, 0) < slot_0_96_3() then
		slot_0_99_3()

		return false
	end

	local var_683_0 = slot_0_97_3(arg_683_0)

	if var_683_0 <= 1 then
		slot_0_50_6.pending_point = arg_683_0
		slot_0_50_6.pending_point_scans = var_683_0

		return true
	end

	if slot_0_101_4(arg_683_0) ~= true then
		slot_0_50_6.pending_point = arg_683_0
		slot_0_50_6.pending_point_scans = 1

		return false
	end

	slot_0_50_6.pending_point = arg_683_0
	slot_0_50_6.pending_point_scans = slot_0_50_6.pending_point_scans + 1

	return var_683_0 <= slot_0_50_6.pending_point_scans
end

function slot_0_103_3(arg_684_0)
	if arg_684_0 == nil then
		return 0
	end

	local var_684_0 = arg_684_0.m_vecVelocity

	if var_684_0 == nil or var_684_0.length2d == nil then
		return 0
	end

	return var_684_0:length2d()
end

function slot_0_104_3(arg_685_0, arg_685_1, arg_685_2)
	if arg_685_0 == nil or type(arg_685_1) ~= "number" or arg_685_1 < 0 then
		return arg_685_2
	end

	local var_685_0 = arg_685_0:get_hitbox_position(arg_685_1)

	if var_685_0 ~= nil then
		return var_685_0
	end

	return arg_685_2
end

function slot_0_105_3(arg_686_0)
	return arg_686_0 == 7 or arg_686_0 == 8 or arg_686_0 == 9 or arg_686_0 == 10
end

function slot_0_106_3(arg_687_0)
	return arg_687_0 == 2 or arg_687_0 == 3 or arg_687_0 == 4 or arg_687_0 == 5 or arg_687_0 == 6
end

function slot_0_107_3(arg_688_0)
	return arg_688_0 == 5 or arg_688_0 == 6
end

function slot_0_108_3(arg_689_0)
	if arg_689_0 == nil then
		return false
	end

	return (tonumber(arg_689_0.m_flDuckAmount) or 0) >= 0.45
end

function slot_0_109_3(arg_690_0, arg_690_1)
	return slot_0_108_3(arg_690_0) == true and slot_0_105_3(arg_690_1) == true
end

function slot_0_110_3(arg_691_0, arg_691_1)
	return slot_0_108_3(arg_691_0) == true and type(arg_691_1) == "number" and arg_691_1 ~= 0 and slot_0_106_3(arg_691_1) ~= true and slot_0_105_3(arg_691_1) ~= true
end

function slot_0_111_3(arg_692_0, arg_692_1, arg_692_2)
	if slot_0_108_3(arg_692_0) ~= true or arg_692_2 == nil then
		return false
	end

	local var_692_0 = tonumber(arg_692_2.hitbox)

	if var_692_0 == nil then
		return true
	end

	if arg_692_1 == 0 then
		return var_692_0 ~= 0
	end

	if slot_0_106_3(arg_692_1) == true then
		return false
	end

	return var_692_0 ~= 0
end

function slot_0_112_3(arg_693_0, arg_693_1, arg_693_2)
	if slot_0_108_3(arg_693_0) ~= true or slot_0_106_3(arg_693_1) ~= true or arg_693_2 == nil then
		return false
	end

	local var_693_0 = tonumber(arg_693_2.hitbox)

	if var_693_0 == nil then
		return true
	end

	return slot_0_107_3(var_693_0) ~= true
end

function slot_0_113_3(arg_694_0)
	return arg_694_0 ~= nil and slot_0_108_3(arg_694_0.player) == true and slot_0_106_3(arg_694_0.hitbox_id) == true
end

function slot_0_114_3(arg_695_0, arg_695_1)
	if slot_0_71_17() ~= true then
		return true
	end

	if arg_695_0 == nil or arg_695_1 == nil then
		return false
	end

	if slot_0_103_3(arg_695_0) > slot_0_48_4.strict_target_speed then
		return false
	end

	local var_695_0 = arg_695_0:get_origin()

	if var_695_0 == nil then
		return false
	end

	local var_695_1 = slot_0_104_3(arg_695_0, arg_695_1.hitbox_id, arg_695_1.eye_pos)

	if var_695_1 == nil then
		return false
	end

	if slot_0_50_6.attackable_origin == nil or slot_0_50_6.attackable_hitbox_pos == nil then
		slot_0_50_6.attackable_origin = var_695_0:clone()
		slot_0_50_6.attackable_hitbox_pos = var_695_1:clone()

		return true
	end

	if var_695_0:dist(slot_0_50_6.attackable_origin) > slot_0_48_4.strict_target_origin_delta then
		return false
	end

	if var_695_1:dist(slot_0_50_6.attackable_hitbox_pos) > slot_0_48_4.strict_target_hitbox_delta then
		return false
	end

	return true
end

function slot_0_115_3()
	slot_0_50_6.blocked_target_index = -1
	slot_0_50_6.blocked_target_origin = nil
	slot_0_50_6.rearm_cooldown_until = 0
end

function slot_0_116_3(arg_697_0, arg_697_1)
	slot_0_50_6.rearm_cooldown_until = globals.realtime + math.max(tonumber(arg_697_1) or 0, 0)

	local var_697_0 = arg_697_0 ~= nil and arg_697_0.player or nil

	if var_697_0 == nil or var_697_0.get_index == nil then
		slot_0_50_6.blocked_target_index = -1
		slot_0_50_6.blocked_target_origin = nil

		return
	end

	local var_697_1 = var_697_0:get_index()

	slot_0_50_6.blocked_target_index = type(var_697_1) == "number" and var_697_1 or -1

	local var_697_2 = var_697_0:get_origin()

	slot_0_50_6.blocked_target_origin = var_697_2 ~= nil and var_697_2:clone() or nil
end

function slot_0_117_3(arg_698_0)
	if slot_0_50_6.rearm_cooldown_until <= globals.realtime then
		slot_0_115_3()

		return false
	end

	if arg_698_0 == nil or arg_698_0.get_index == nil then
		return false
	end

	local var_698_0 = slot_0_50_6.blocked_target_index
	local var_698_1 = arg_698_0:get_index()

	if type(var_698_0) ~= "number" or type(var_698_1) ~= "number" or var_698_1 ~= var_698_0 then
		return false
	end

	local var_698_2 = slot_0_50_6.blocked_target_origin

	if var_698_2 ~= nil then
		local var_698_3 = arg_698_0:get_origin()

		if var_698_3 ~= nil and var_698_3:dist(var_698_2) > slot_0_48_4.rearm_target_origin_delta then
			slot_0_115_3()

			return false
		end
	end

	return true
end

function slot_0_118_3(arg_699_0)
	return slot_0_31_0 ~= nil and slot_0_31_0.get_snapshot ~= nil and slot_0_31_0.get_snapshot(arg_699_0) or nil
end

function slot_0_119_3(arg_700_0)
	if slot_0_117_3(arg_700_0) then
		return true
	end

	if slot_0_69_18() ~= true then
		return false
	end

	local var_700_0 = slot_0_118_3(arg_700_0)

	return var_700_0 ~= nil and var_700_0.command ~= nil and var_700_0.command.no_entry ~= nil and var_700_0.command.no_entry.y > 0
end

function slot_0_120_3(arg_701_0)
	slot_0_55_11(slot_0_49_5.double_tap, nil)
	slot_0_55_11(slot_0_49_5.retreat_mode, nil)
	slot_0_55_11(slot_0_49_5.slow_walk, nil)
	slot_0_68_15()
	slot_0_37_0(slot_0_50_6.scan_hitboxes)
	slot_0_87_5()

	slot_0_50_6.current_point = nil
	slot_0_50_6.failed_attackable_ticks = 0
	slot_0_50_6.is_peeking = false
	slot_0_50_6.last_dist = math.huge
	slot_0_50_6.last_scan_time = 0

	slot_0_99_3()

	slot_0_50_6.shot_fired = false
	slot_0_50_6.running_anchor_locked = false
	slot_0_50_6.stalled_ticks = 0
	slot_0_50_6.should_retreat = false

	if arg_701_0 == true then
		slot_0_50_6.anchor_pos = nil

		slot_0_115_3()
	end
end

function slot_0_121_3(arg_702_0)
	local var_702_0 = slot_0_49_5.minimum_damage ~= nil and slot_0_49_5.minimum_damage:get() or 0
	local var_702_1 = arg_702_0 ~= nil and arg_702_0.m_iHealth or 0

	return slot_0_39_0(var_702_0 or 0, var_702_1 or 0)
end

function slot_0_122_3()
	slot_0_37_0(slot_0_50_6.scan_hitboxes)

	local var_703_0 = slot_0_76_10(slot_0_49_5.body_aim_disablers)

	if type(var_703_0) ~= "table" then
		var_703_0 = {}
	end

	local var_703_1 = slot_0_76_10(slot_0_49_5.body_aim) == "Force" and #var_703_0 == 0

	if var_703_1 ~= true and slot_0_49_5.hitboxes ~= nil and slot_0_49_5.hitboxes:get("Head") then
		slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 0
	end

	if slot_0_49_5.hitboxes ~= nil and slot_0_49_5.hitboxes:get("Chest") then
		slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 5
	end

	if slot_0_49_5.hitboxes ~= nil and slot_0_49_5.hitboxes:get("Stomach") then
		slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 3
	end

	if slot_0_50_6.vital_hitboxes_only == true then
		return
	end

	if var_703_1 ~= true and slot_0_49_5.hitboxes ~= nil then
		if slot_0_49_5.hitboxes:get("Legs") then
			slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 7
			slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 8
		end

		if slot_0_49_5.hitboxes:get("Feet") then
			slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 9
			slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 10
		end

		if slot_0_49_5.hitboxes:get("Arms") then
			slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 15
			slot_0_50_6.scan_hitboxes[#slot_0_50_6.scan_hitboxes + 1] = 17
		end
	end

	if #slot_0_50_6.scan_hitboxes == 0 then
		slot_0_50_6.scan_hitboxes[1] = 0
		slot_0_50_6.scan_hitboxes[2] = 5
		slot_0_50_6.scan_hitboxes[3] = 3
	end
end

function slot_0_123_3(arg_704_0)
	return arg_704_0 ~= nil and arg_704_0:is_alive() == true and arg_704_0:is_dormant() ~= true and arg_704_0.m_bGunGameImmunity ~= true
end

function slot_0_124_3(arg_705_0, arg_705_1, arg_705_2, arg_705_3)
	local var_705_0 = arg_705_0 ~= nil and arg_705_0:get_origin() or nil

	if var_705_0 == nil then
		return nil
	end

	var_705_0.z = var_705_0.z + arg_705_0.m_vecMaxs.z * 0.5

	local var_705_1 = var_705_0:dist_to_ray(arg_705_1, arg_705_2)
	local var_705_2 = math.min(slot_0_103_3(arg_705_0), 260)
	local var_705_3 = arg_705_3 ~= nil and arg_705_3:dist2d(var_705_0) or 0
	local var_705_4 = var_705_1 + math.min(var_705_3, 2400) * 0.01

	if slot_0_71_17() == true then
		var_705_4 = var_705_4 + var_705_2 * 0.12

		if var_705_2 > slot_0_48_4.strict_target_speed then
			var_705_4 = var_705_4 + 6
		end
	else
		var_705_4 = var_705_4 + var_705_2 * 0.05
	end

	return var_705_4
end

function slot_0_125_3(arg_706_0)
	local var_706_0 = render.camera_position()
	local var_706_1 = render.camera_angles()

	if var_706_0 == nil or var_706_1 == nil then
		return nil
	end

	local var_706_2 = vector():angles(var_706_1)
	local var_706_3 = entity.get_players(true, false)
	local var_706_4 = math.huge
	local var_706_5

	for iter_706_0 = 1, #var_706_3 do
		local var_706_6 = var_706_3[iter_706_0]

		if slot_0_123_3(var_706_6) == true and slot_0_119_3(var_706_6) ~= true then
			local var_706_7 = slot_0_124_3(var_706_6, var_706_0, var_706_2, arg_706_0)

			if var_706_7 ~= nil and var_706_7 < var_706_4 then
				var_706_4 = var_706_7
				var_706_5 = var_706_6
			end
		end
	end

	return var_706_5
end

function slot_0_126_3(arg_707_0, arg_707_1)
	if slot_0_123_3(arg_707_1) == true and slot_0_119_3(arg_707_1) ~= true then
		return arg_707_1
	end

	local var_707_0 = entity.get_threat(true)

	if slot_0_123_3(var_707_0) == true and slot_0_119_3(var_707_0) ~= true then
		return var_707_0
	end

	return slot_0_125_3(arg_707_0)
end

function slot_0_127_3(arg_708_0, arg_708_1)
	if arg_708_0 == nil or arg_708_1 == nil then
		return false
	end

	local var_708_0 = arg_708_0.get_index ~= nil and arg_708_0:get_index() or nil
	local var_708_1 = arg_708_1.get_index ~= nil and arg_708_1:get_index() or nil

	return type(var_708_0) == "number" and type(var_708_1) == "number" and var_708_0 == var_708_1
end

function slot_0_128_3()
	local var_709_0 = slot_0_50_6.pending_point ~= nil and slot_0_50_6.pending_point.player or nil

	if slot_0_123_3(var_709_0) == true and slot_0_119_3(var_709_0) ~= true then
		return var_709_0
	end

	local var_709_1 = slot_0_50_6.last_scan_target

	if slot_0_123_3(var_709_1) == true and slot_0_119_3(var_709_1) ~= true then
		return var_709_1
	end

	local var_709_2 = slot_0_50_6.last_best_point ~= nil and slot_0_50_6.last_best_point.player or nil

	if slot_0_123_3(var_709_2) == true and slot_0_119_3(var_709_2) ~= true then
		return var_709_2
	end

	return nil
end

function slot_0_129_2(arg_710_0, arg_710_1, arg_710_2)
	if utils.trace_bullet == nil or arg_710_0 == nil or arg_710_1 == nil or arg_710_2 == nil then
		return false
	end

	local var_710_0 = arg_710_2.player

	if var_710_0 == nil or var_710_0:is_alive() ~= true or var_710_0:is_dormant() == true or var_710_0.m_bGunGameImmunity == true then
		return false
	end

	local var_710_1 = arg_710_2.hitbox_id

	if slot_0_110_3(var_710_0, var_710_1) == true or slot_0_109_3(var_710_0, var_710_1) == true then
		return false
	end

	local var_710_2 = type(var_710_1) == "number" and var_710_1 >= 0 and var_710_0:get_hitbox_position(var_710_1) or nil

	if var_710_2 == nil then
		var_710_2 = arg_710_2.eye_pos
	end

	if var_710_2 == nil then
		return false
	end

	local var_710_3 = var_710_0:get_origin()

	if var_710_3 == nil or var_710_3:dist(arg_710_2.player_origin) > slot_0_48_4.max_target_origin_delta then
		return false
	end

	local var_710_4 = arg_710_2.target_hitbox_pos

	if var_710_4 ~= nil and var_710_2:dist(var_710_4) > slot_0_48_4.max_target_hitbox_delta then
		return false
	end

	local var_710_5, var_710_6 = utils.trace_bullet(arg_710_0, arg_710_1, var_710_2)
	local var_710_7 = var_710_0.m_iHealth or 0
	local var_710_8 = arg_710_2.required_damage or 0

	return type(var_710_5) == "number" and var_710_6 ~= nil and slot_0_127_3(var_710_6.entity, var_710_0) and slot_0_111_3(var_710_0, var_710_1, var_710_6) ~= true and slot_0_112_3(var_710_0, var_710_1, var_710_6) ~= true and (var_710_8 <= var_710_5 or var_710_7 <= var_710_5)
end

function slot_0_130_1(arg_711_0, arg_711_1, arg_711_2)
	if slot_0_129_2(arg_711_0, arg_711_1, arg_711_2) ~= true then
		return false
	end

	local var_711_0 = slot_0_113_3(arg_711_2)

	if slot_0_71_17() ~= true and var_711_0 ~= true then
		return true
	end

	local var_711_1 = arg_711_2.eye_pos

	if var_711_1 == nil then
		return false
	end

	if var_711_0 == true then
		return slot_0_129_2(arg_711_0, var_711_1, arg_711_2)
	end

	if arg_711_1:dist(var_711_1) < slot_0_48_4.strict_attackable_probe_min_delta then
		return true
	end

	return slot_0_129_2(arg_711_0, var_711_1, arg_711_2)
end

function slot_0_131_1(arg_712_0, arg_712_1)
	if arg_712_0 == nil or arg_712_1 == nil or arg_712_1.eye_pos == nil then
		return false
	end

	return (slot_0_71_17() == true and slot_0_48_4.strict_live_eye_delta or slot_0_48_4.live_eye_delta) >= arg_712_0:dist(arg_712_1.eye_pos)
end

function slot_0_132_1(arg_713_0, arg_713_1, arg_713_2, arg_713_3, arg_713_4, arg_713_5, arg_713_6, arg_713_7)
	slot_0_68_15()

	if arg_713_0.m_vecVelocity:length2d() > slot_0_85_5() then
		slot_0_64_16("scan speed is too high")

		return nil
	end

	if arg_713_2 == "SSG 08" and arg_713_0.m_bIsScoped ~= true then
		slot_0_64_16("ssg08 is not scoped")

		return nil
	end

	slot_713_8_0 = arg_713_0:get_eye_position()
	slot_713_9_0 = arg_713_0:get_origin()

	if slot_713_8_0 == nil or slot_713_9_0 == nil then
		slot_0_64_16("local eye position is unavailable")

		return nil
	end

	slot_713_10_0 = slot_0_126_3(slot_713_9_0, arg_713_7)

	if slot_713_10_0 == nil then
		slot_0_64_16("no target for scan")

		return nil
	end

	slot_0_50_6.last_scan_target = slot_713_10_0

	if slot_0_119_3(slot_713_10_0) then
		slot_0_64_16("target is blocked for re-peek")

		return nil
	end

	slot_0_122_3()

	if #slot_0_50_6.scan_hitboxes == 0 then
		slot_0_64_16("no hitboxes selected")

		return nil
	end

	slot_713_11_0 = slot_0_121_3(slot_713_10_0)
	slot_713_12_0 = slot_713_10_0.m_iHealth or 0
	slot_713_13_0 = {}

	for iter_713_0 = 1, #slot_0_50_6.scan_hitboxes do
		slot_713_13_0[iter_713_0] = slot_713_10_0:get_hitbox_position(slot_0_50_6.scan_hitboxes[iter_713_0])
	end

	slot_713_14_0 = slot_713_10_0:get_origin()

	if slot_713_8_0 == nil or slot_713_9_0 == nil or slot_713_14_0 == nil then
		slot_0_64_16("target origin is unavailable")

		return nil
	end

	slot_713_15_0 = slot_0_50_6.anchor_pos ~= nil and slot_0_50_6.anchor_pos:clone() or slot_713_9_0:clone()
	slot_713_16_0 = slot_713_8_0:to(slot_713_14_0):angles().y
	slot_713_17_0 = arg_713_3.view_angles.y
	slot_713_18_0 = arg_713_3.forwardmove
	slot_713_19_0 = arg_713_3.sidemove
	slot_713_20_0 = arg_713_3.buttons
	slot_713_21_0 = false
	arg_713_3.forwardmove = 450
	arg_713_3.sidemove = 0
	arg_713_3.buttons = 0

	for iter_713_1 = -180, 179, 360 / arg_713_6 do
		arg_713_3.view_angles.y = slot_0_36_0(slot_713_16_0 + iter_713_1 + 90)
		slot_713_26_1 = arg_713_0:simulate_movement()

		if slot_713_26_1 == nil or slot_713_26_1.origin == nil or slot_713_26_1.velocity == nil then
			break
		end

		slot_713_27_1 = slot_713_26_1.origin:clone()
		slot_713_28_1 = 0
		slot_713_29_1 = 0

		for iter_713_2 = 1, arg_713_4 / globals.tickinterval do
			slot_713_34_1 = slot_713_26_1.velocity:length2d()

			slot_713_26_1:think()

			slot_713_35_1 = slot_713_26_1.velocity:length2d()

			if bit.band(slot_713_26_1.flags, 1) ~= 1 or slot_713_35_1 < slot_713_34_1 then
				break
			end

			slot_713_36_0 = slot_713_26_1.origin:dist2d(slot_713_27_1)

			if slot_713_36_0 >= slot_0_32_0 then
				if slot_713_28_1 % slot_0_33_0 == 0 then
					slot_713_37_0 = slot_713_26_1.origin:clone()
					slot_713_38_0 = slot_713_37_0:clone()
					slot_713_38_0.z = slot_713_38_0.z + slot_713_26_1.view_offset
					slot_713_39_1 = -1
					slot_713_40_1 = nil
					slot_713_41_1 = -1
					slot_713_42_1 = nil
					slot_713_43_1 = nil

					for iter_713_3 = 1, #slot_713_13_0 do
						slot_713_48_0 = slot_713_13_0[iter_713_3]

						if slot_713_48_0 ~= nil then
							slot_713_49_0 = slot_0_50_6.scan_hitboxes[iter_713_3] or -1

							if slot_0_110_3(slot_713_10_0, slot_713_49_0) ~= true and slot_0_109_3(slot_713_10_0, slot_713_49_0) ~= true then
								slot_713_50_0, slot_713_51_0 = utils.trace_bullet(arg_713_0, slot_713_38_0, slot_713_48_0)

								if slot_713_51_0 ~= nil then
									slot_713_43_1 = slot_713_51_0.end_pos

									if slot_713_51_0.entity == slot_713_10_0 and slot_0_111_3(slot_713_10_0, slot_713_49_0, slot_713_51_0) ~= true and slot_0_112_3(slot_713_10_0, slot_713_49_0, slot_713_51_0) ~= true and (slot_713_11_0 <= slot_713_50_0 or slot_713_12_0 <= slot_713_50_0) then
										slot_713_52_0 = tonumber(slot_713_51_0.hitbox)

										if slot_713_52_0 ~= nil and slot_713_52_0 >= 0 then
											slot_713_41_1 = slot_713_52_0
											slot_713_42_1 = slot_0_104_3(slot_713_10_0, slot_713_52_0, slot_713_48_0)
										else
											slot_713_41_1 = slot_713_49_0
											slot_713_42_1 = slot_713_48_0
										end

										slot_713_39_1 = slot_713_50_0
										slot_713_42_1 = slot_713_42_1 ~= nil and slot_713_42_1:clone() or nil
										slot_713_21_0 = true

										break
									end
								end
							end
						end
					end

					if slot_713_39_1 ~= -1 then
						slot_713_29_1 = slot_713_29_1 + 1
						slot_713_40_1 = slot_0_40_0(slot_713_10_0, slot_713_38_0, slot_713_37_0)

						if slot_713_40_1 == math.huge then
							slot_713_40_1 = nil
						end
					else
						slot_713_29_1 = 0
					end

					slot_0_50_6.sample_points[#slot_0_50_6.sample_points + 1] = {
						radius_softened = false,
						radius_ok = false,
						selected = false,
						player = slot_713_10_0,
						player_origin = slot_713_10_0:get_origin(),
						hitbox_id = slot_713_41_1,
						pos = slot_713_37_0,
						eye_pos = slot_713_38_0,
						dmg = slot_713_39_1,
						dist = slot_713_36_0,
						peek_dist = slot_713_15_0:dist2d(slot_713_37_0),
						required_damage = slot_713_11_0,
						anchor_pos = slot_713_15_0,
						start_pos = slot_713_27_1,
						support = slot_713_29_1,
						target_hitbox_pos = slot_713_42_1,
						ticks_to_move = iter_713_2,
						yaw = arg_713_3.view_angles.y,
						tr_end_pos = slot_713_43_1,
						enemy_dmg = slot_713_40_1,
						reject_reason = slot_713_39_1 ~= -1 and "support" or "damage",
						score = -math.huge
					}
				end

				slot_713_28_1 = slot_713_28_1 + 1
			end
		end
	end

	arg_713_3.view_angles.y = slot_713_17_0
	arg_713_3.forwardmove = slot_713_18_0
	arg_713_3.sidemove = slot_713_19_0
	arg_713_3.buttons = slot_713_20_0
	slot_713_22_1 = math.max(arg_713_1.m_flNextPrimaryAttack, arg_713_0.m_flNextAttack)
	slot_713_23_0 = math.max(tonumber(arg_713_0.m_iHealth) or 100, 1)
	slot_713_24_0 = nil
	slot_713_25_0 = -math.huge
	slot_713_26_0 = slot_0_90_4()
	slot_713_27_0 = -1
	slot_713_28_0 = 0
	slot_713_29_0 = math.huge
	slot_713_30_0 = nil
	slot_713_31_0 = -math.huge
	slot_713_32_0 = -1
	slot_713_33_0 = 0
	slot_713_34_0 = math.huge
	slot_713_35_0 = false

	for iter_713_4 = 1, #slot_0_50_6.sample_points do
		slot_713_40_0 = slot_0_50_6.sample_points[iter_713_4]

		if slot_713_40_0.dmg ~= -1 then
			slot_713_41_0, slot_713_42_0, slot_713_43_0, slot_713_44_0 = slot_0_83_5(slot_713_40_0, arg_713_5)
			slot_713_40_0.score = slot_713_41_0
			slot_713_40_0.radius_ok = slot_713_44_0 >= slot_0_48_4.min_peek_distance
			slot_713_40_0.radius_delta = slot_713_42_0
			slot_713_40_0.selected = false

			if slot_713_40_0.radius_ok ~= true then
				slot_713_40_0.reject_reason = "radius"
			elseif slot_0_82_5(slot_713_40_0, slot_713_23_0, slot_713_26_0) == true then
				slot_713_40_0.reject_reason = "risky"
				slot_713_35_0 = true
			elseif slot_713_26_0 <= slot_713_43_0 then
				slot_713_45_1, slot_713_46_1 = slot_0_84_5(slot_713_41_0, slot_713_44_0, slot_713_43_0, slot_713_25_0, slot_713_27_0, slot_713_28_0, slot_713_29_0, arg_713_5)

				if slot_713_45_1 then
					slot_713_40_0.reject_reason = nil
					slot_713_25_0 = slot_713_41_0
					slot_713_27_0 = slot_713_43_0
					slot_713_28_0 = slot_713_44_0
					slot_713_29_0 = slot_713_46_1
					slot_713_24_0 = slot_713_40_0
				end
			elseif slot_0_71_17() ~= true then
				slot_713_40_0.reject_reason = "support"
				slot_713_45_0, slot_713_46_0 = slot_0_84_5(slot_713_41_0, slot_713_44_0, slot_713_43_0, slot_713_31_0, slot_713_32_0, slot_713_33_0, slot_713_34_0, arg_713_5)

				if slot_713_45_0 then
					slot_713_31_0 = slot_713_41_0
					slot_713_32_0 = slot_713_43_0
					slot_713_33_0 = slot_713_44_0
					slot_713_34_0 = slot_713_46_0
					slot_713_30_0 = slot_713_40_0
				end
			else
				slot_713_40_0.reject_reason = "support"
			end
		end
	end

	if slot_713_24_0 == nil then
		slot_713_24_0 = slot_713_30_0
	end

	if slot_713_21_0 ~= true then
		slot_0_64_16("no attackable scan point")

		return nil
	end

	if slot_713_24_0 == nil then
		if slot_713_35_0 == true then
			slot_0_64_16("all scan points are too risky")
		else
			slot_0_64_16("scan found no valid point")
		end

		return nil
	end

	slot_713_22_0 = slot_713_22_1 - slot_713_24_0.ticks_to_move * globals.tickinterval

	if slot_713_22_0 > globals.curtime then
		slot_0_64_16("weapon cooldown " .. slot_0_62_17(slot_713_22_0 - globals.curtime))

		return nil
	end

	slot_713_24_0.selected = true
	slot_0_50_6.last_best_point = slot_713_24_0

	return slot_713_24_0
end

function slot_0_133_1(arg_714_0)
	if arg_714_0 == nil then
		return
	end

	if not slot_0_51_7() then
		slot_0_61_16(true)
		slot_0_120_3(true)

		return
	end

	if slot_0_78_9() then
		slot_0_64_16("AI Peek is active")
		slot_0_120_3(true)

		return
	end

	slot_714_1_0 = entity.get_local_player()

	if slot_714_1_0 == nil or slot_714_1_0:is_alive() ~= true then
		slot_0_64_16("local player is dead")
		slot_0_120_3(true)

		return
	end

	slot_714_2_0 = slot_714_1_0:get_origin()

	if slot_714_2_0 == nil then
		slot_0_64_16("local origin is unavailable")
		slot_0_120_3(true)

		return
	end

	slot_714_3_0 = slot_714_1_0:get_player_weapon()

	if slot_714_3_0 == nil then
		slot_0_64_16("no active weapon")
		slot_0_120_3(true)

		return
	end

	if slot_0_46_0 ~= nil then
		slot_714_4_1 = ffi.cast(slot_0_46_0, slot_714_1_0[0])

		if slot_714_4_1 == nil then
			slot_0_64_16("player pointer is unavailable")
			slot_0_120_3(true)

			return
		end

		slot_714_5_1 = slot_714_4_1:get_model_ptr()

		if slot_714_5_1 == nil then
			slot_0_64_16("model pointer is unavailable")
			slot_0_120_3(true)

			return
		end

		slot_714_6_1 = slot_714_4_1:get_anim_overlay(10, true)

		if slot_714_6_1 ~= nil and slot_714_5_1:get_sequence_activity(slot_714_6_1.sequence) == 982 and slot_714_6_1.weight > 0 then
			slot_0_64_16("landing animation is active")
			slot_0_120_3(true)

			return
		end
	end

	slot_714_4_0 = slot_0_35_0(slot_714_3_0:get_weapon_index())

	if not slot_0_79_8(slot_714_4_0) then
		slot_0_64_16("weapon is filtered")
		slot_0_120_3(true)

		return
	end

	slot_714_5_0 = bit.band(slot_714_1_0.m_fFlags or 0, 1) == 1
	slot_714_6_0 = slot_714_1_0.m_vecVelocity
	slot_714_7_0 = slot_714_6_0 ~= nil and slot_714_6_0:length2d() or 0
	slot_714_8_0 = slot_0_86_4()
	slot_714_9_0 = slot_0_59_14()

	if slot_0_60_15(slot_0_49_5.double_tap) == true ~= true then
		slot_0_64_16("double tap is disabled")
		slot_0_61_16(true)
		slot_0_120_3(true)

		return
	end

	if slot_0_50_6.disable_on_peek_assist == true and slot_0_76_10(slot_0_49_5.peek_assist) == true then
		slot_0_64_16("peek assist is active")
		slot_0_120_3(true)

		return
	end

	slot_714_12_0 = slot_0_76_10(slot_0_49_5.double_tap) == true == true and type(slot_714_9_0) == "number" and slot_714_9_0 < 1
	slot_714_13_0 = slot_0_50_6.is_peeking ~= true and slot_0_57_12(slot_714_1_0, arg_714_0) == true

	if slot_714_5_0 and (slot_714_7_0 <= slot_0_48_4.max_stationary_start_speed or slot_714_13_0 == true) then
		slot_0_50_6.anchor_pos = slot_714_2_0:clone()
		slot_0_50_6.running_anchor_locked = false
	elseif slot_714_5_0 and slot_0_50_6.active_with_running == true and slot_714_7_0 <= slot_714_8_0 then
		slot_714_14_1 = slot_0_50_6.anchor_pos == nil or slot_0_50_6.running_anchor_locked ~= true

		if slot_714_14_1 ~= true and slot_714_2_0:dist2d(slot_0_50_6.anchor_pos) > slot_0_48_4.running_anchor_max_trail then
			slot_714_14_1 = true
		end

		if slot_714_14_1 == true then
			slot_0_50_6.anchor_pos = slot_714_2_0:clone()
		end

		slot_0_50_6.running_anchor_locked = true
	elseif slot_0_50_6.anchor_pos == nil and slot_714_5_0 then
		slot_0_50_6.anchor_pos = slot_714_2_0:clone()
	elseif slot_714_5_0 ~= true then
		slot_0_50_6.running_anchor_locked = false
	end

	slot_714_14_0 = slot_714_1_0:simulate_movement()

	if slot_714_14_0 == nil or slot_714_14_0.origin == nil or slot_714_14_0.velocity == nil then
		slot_0_68_15()
		slot_0_64_16("movement simulation failed")

		return
	end

	slot_714_14_0:think()

	if slot_0_50_6.is_peeking then
		if slot_0_50_6.current_point == nil then
			slot_0_120_3(true)

			return
		end

		slot_0_55_11(slot_0_49_5.retreat_mode, nil)

		slot_714_15_2 = slot_0_50_6.current_point.player
		slot_714_16_2 = slot_0_38_0(slot_714_15_2) and slot_714_15_2:get_origin():dist(slot_0_50_6.current_point.player_origin) <= slot_0_48_4.peek_target_origin_delta

		if slot_714_16_2 ~= true then
			slot_0_50_6.should_retreat = true
		end

		slot_714_17_2 = slot_714_14_0.origin:clone()
		slot_714_17_2.z = slot_714_17_2.z + slot_714_14_0.view_offset
		slot_714_18_2 = slot_0_98_3(slot_0_50_6.current_point)

		if slot_714_18_2 == nil then
			slot_0_120_3(true)

			return
		end

		slot_714_19_1 = slot_714_17_2:dist(slot_0_50_6.current_point.eye_pos)
		slot_714_20_1 = slot_714_18_2:dist(slot_0_50_6.current_point.pos)
		slot_714_21_1 = slot_714_20_1 > 0 and slot_714_19_1 / slot_714_20_1 or 0
		slot_714_22_0 = slot_0_92_3(slot_0_50_6.current_point)
		slot_714_23_0 = slot_0_131_1(slot_714_17_2, slot_0_50_6.current_point)
		slot_714_25_0 = math.max(slot_714_3_0.m_flNextPrimaryAttack, slot_714_1_0.m_flNextAttack) <= globals.curtime and slot_714_22_0 <= slot_714_21_1 and slot_714_23_0 and slot_0_130_1(slot_714_1_0, slot_714_17_2, slot_0_50_6.current_point)
		arg_714_0.move_yaw = slot_0_50_6.current_point.yaw or slot_714_14_0.origin:to(slot_0_50_6.current_point.pos):angles().y
		arg_714_0.forwardmove = 450
		arg_714_0.sidemove = 0
		arg_714_0.buttons = 0
		arg_714_0.jitter_move = false

		slot_0_55_11(slot_0_49_5.double_tap, false)
		slot_0_55_11(slot_0_49_5.slow_walk, false)

		if slot_714_25_0 then
			slot_0_50_6.failed_attackable_ticks = 0

			if slot_0_114_3(slot_714_15_2, slot_0_50_6.current_point) == true then
				slot_0_50_6.attackable_ticks = slot_0_50_6.attackable_ticks + 1
			else
				slot_0_87_5()
			end
		else
			slot_0_87_5()

			if slot_714_23_0 == true and slot_714_22_0 <= slot_714_21_1 then
				slot_0_50_6.failed_attackable_ticks = slot_0_50_6.failed_attackable_ticks + 1
			else
				slot_0_50_6.failed_attackable_ticks = 0
			end
		end

		slot_714_26_0 = slot_0_50_6.retreat_on_shot ~= true

		if slot_0_50_6.shot_fired == true or slot_714_26_0 == true and slot_0_50_6.attackable_ticks >= slot_0_93_3(slot_0_50_6.current_point) or slot_0_50_6.failed_attackable_ticks >= slot_0_88_5() or slot_714_21_1 < 0.04 and slot_714_25_0 ~= true or slot_714_12_0 or slot_714_16_2 and slot_714_15_2:is_dormant() then
			slot_0_50_6.should_retreat = true
		end

		if slot_0_50_6.should_retreat ~= true then
			if slot_714_25_0 then
				slot_0_66_17("attack window is open")
			else
				slot_0_66_17("moving to the peek point")
			end

			return
		end
	else
		slot_0_50_6.should_retreat = false
	end

	if slot_0_50_6.should_retreat == true then
		if slot_0_50_6.current_point == nil then
			slot_0_64_16("no active point to return from")
			slot_0_120_3(true)

			return
		end

		slot_714_15_1 = slot_0_50_6.current_point
		slot_714_16_1 = slot_0_50_6.shot_fired == true
		slot_714_17_1 = slot_0_98_3(slot_0_50_6.current_point)

		if slot_714_17_1 == nil then
			slot_0_64_16("retreat point is unavailable")
			slot_0_120_3(true)

			return
		end

		slot_714_18_1 = slot_714_14_0.origin:dist(slot_714_17_1)
		arg_714_0.move_yaw = slot_714_14_0.origin:to(slot_714_17_1):angles().y
		arg_714_0.forwardmove = 450
		arg_714_0.sidemove = 0
		arg_714_0.buttons = 0
		arg_714_0.jitter_move = false

		slot_0_55_11(slot_0_49_5.double_tap, false)
		slot_0_55_11(slot_0_49_5.retreat_mode, "On Shot")
		slot_0_55_11(slot_0_49_5.slow_walk, false)
		slot_0_67_17("going back to the anchor")

		if slot_714_18_1 + 0.5 < slot_0_50_6.last_dist then
			slot_0_50_6.stalled_ticks = 0
		else
			slot_0_50_6.stalled_ticks = slot_0_50_6.stalled_ticks + 1
		end

		slot_0_50_6.last_dist = slot_714_18_1

		if slot_714_18_1 <= slot_0_48_4.stop_distance or slot_714_5_0 ~= true or slot_0_50_6.stalled_ticks >= slot_0_48_4.stall_tick_limit then
			if slot_714_5_0 == true then
				slot_0_50_6.anchor_pos = slot_714_2_0:clone()
				slot_0_50_6.running_anchor_locked = false
			end

			slot_0_120_3(false)

			if slot_714_16_1 == true then
				slot_0_116_3(slot_714_15_1, slot_0_48_4.post_shot_rearm_cooldown)
			else
				slot_0_116_3(slot_714_15_1, slot_0_48_4.bait_rearm_cooldown)
			end
		end

		return
	end

	slot_0_50_6.last_dist = math.huge
	slot_0_50_6.stalled_ticks = 0

	slot_0_55_11(slot_0_49_5.double_tap, nil)
	slot_0_55_11(slot_0_49_5.retreat_mode, nil)
	slot_0_55_11(slot_0_49_5.slow_walk, nil)

	if slot_714_5_0 ~= true then
		slot_0_68_15()
		slot_0_64_16("in air")

		return
	end

	if slot_0_50_6.anchor_pos == nil then
		slot_0_68_15()
		slot_0_64_16("anchor point is not ready")

		return
	end

	if slot_714_8_0 < slot_714_7_0 then
		slot_0_68_15()
		slot_0_64_16(string.format("move speed %.0f > %.0f", slot_714_7_0, slot_714_8_0))

		return
	end

	if slot_714_12_0 then
		slot_0_68_15()
		slot_0_64_16("double tap is charging")

		return
	end

	slot_714_15_0, slot_714_16_0, slot_714_17_0, slot_714_18_0 = slot_0_80_7()

	if slot_714_16_0 > globals.realtime - slot_0_50_6.last_scan_time then
		slot_0_68_15()
		slot_0_64_16("waiting limit " .. slot_0_62_17(slot_714_16_0 - (globals.realtime - slot_0_50_6.last_scan_time)))

		return
	end

	slot_0_50_6.last_scan_time = globals.realtime
	slot_714_19_0 = slot_0_132_1(slot_714_1_0, slot_714_3_0, slot_714_4_0, arg_714_0, slot_714_15_0, slot_714_17_0, slot_714_18_0, slot_0_128_3())

	if slot_714_19_0 == nil then
		slot_0_99_3()

		return
	end

	slot_714_20_0 = slot_0_98_3(slot_714_19_0)

	if slot_714_20_0 == nil then
		slot_0_64_16("best point has no retreat path")
		slot_0_99_3()

		return
	end

	slot_714_21_0 = slot_714_20_0:dist2d(slot_714_19_0.pos)

	if slot_714_21_0 < slot_0_48_4.min_peek_distance then
		slot_0_64_16("best point is too close")
		slot_0_99_3()

		return
	end

	if slot_0_102_3(slot_714_19_0) ~= true then
		slot_0_64_16(string.format("pending confirm %d/%d", slot_0_50_6.pending_point_scans, slot_0_97_3(slot_714_19_0)))

		return
	end

	slot_0_99_3()

	slot_0_50_6.current_point = slot_714_19_0
	slot_0_50_6.is_peeking = true
	slot_0_50_6.failed_attackable_ticks = 0

	slot_0_87_5()

	slot_0_50_6.shot_fired = false
	slot_0_50_6.should_retreat = false

	slot_0_65_17(string.format("point found | %.0fu | support %d", slot_714_21_0, math.max(tonumber(slot_714_19_0.support) or 0, 0)))

	arg_714_0.move_yaw = slot_0_50_6.current_point.yaw or slot_714_14_0.origin:to(slot_0_50_6.current_point.pos):angles().y
	arg_714_0.forwardmove = 450
	arg_714_0.sidemove = 0
	arg_714_0.buttons = 0
	arg_714_0.jitter_move = false

	slot_0_55_11(slot_0_49_5.double_tap, false)
	slot_0_55_11(slot_0_49_5.slow_walk, false)
end

function slot_0_134_1(arg_715_0)
	if arg_715_0 == nil or slot_0_50_6.is_peeking ~= true or slot_0_50_6.current_point == nil then
		return
	end

	if slot_0_127_3(arg_715_0.target, slot_0_50_6.current_point.player) then
		slot_0_50_6.shot_fired = true
		slot_0_50_6.should_retreat = true
	end
end

function slot_0_135_1(arg_716_0)
	if arg_716_0 == nil then
		return
	end

	local var_716_0 = entity.get_local_player()

	if var_716_0 == nil then
		slot_0_120_3(true)

		return
	end

	local var_716_1 = entity.get(arg_716_0.userid, true)

	if var_716_1 == nil then
		return
	end

	local var_716_2 = var_716_1:get_index()
	local var_716_3 = var_716_0:get_index()

	if type(var_716_2) ~= "number" or type(var_716_3) ~= "number" then
		return
	end

	if var_716_2 == var_716_3 then
		slot_0_120_3(true)
	end
end

function slot_0_136_1()
	slot_0_120_3(true)
end

function slot_0_137_1()
	slot_0_120_3(true)
end

function slot_0_138_1()
	slot_0_120_3(true)
end

function slot_0_139_1(arg_720_0)
	local var_720_0 = arg_720_0 ~= nil and arg_720_0:get() or nil

	if var_720_0 ~= "Legit Safe" then
		var_720_0 = "Aggressive"
	end

	slot_0_50_6.mode = var_720_0

	slot_0_87_5()
	slot_0_99_3()

	slot_0_50_6.last_best_point = nil
	slot_0_50_6.last_scan_target = nil
end

function slot_0_140_1(arg_721_0)
	local var_721_0 = arg_721_0 or slot_0_47_5.options
	local var_721_1 = true
	local var_721_2 = true
	local var_721_3 = false
	local var_721_4 = false
	local var_721_5 = true
	local var_721_6 = false

	if var_721_0 ~= nil then
		var_721_1 = slot_0_77_9(var_721_0, "Active with running")
		var_721_2 = slot_0_77_9(var_721_0, "Strict anti-bait")
		var_721_3 = slot_0_77_9(var_721_0, "Retreat on shot")
		var_721_4 = slot_0_77_9(var_721_0, "Vital hitboxes only")
		var_721_5 = slot_0_77_9(var_721_0, "Debug overlay")
		var_721_6 = slot_0_77_9(var_721_0, "Disable on Peek Assist")
	end

	if slot_0_50_6.strict_antibait ~= var_721_2 then
		slot_0_87_5()
	end

	if slot_0_50_6.vital_hitboxes_only ~= var_721_4 then
		slot_0_37_0(slot_0_50_6.scan_hitboxes)
		slot_0_37_0(slot_0_50_6.sample_points)
	end

	slot_0_50_6.active_with_running = var_721_1
	slot_0_50_6.strict_antibait = var_721_2
	slot_0_50_6.retreat_on_shot = var_721_3
	slot_0_50_6.vital_hitboxes_only = var_721_4
	slot_0_50_6.debug_overlay = var_721_5
	slot_0_50_6.disable_on_peek_assist = var_721_6
end

function slot_0_141_1(arg_722_0)
	if arg_722_0 == slot_0_50_6.callbacks_registered then
		return
	end

	events.aim_fire(slot_0_134_1, arg_722_0)
	events.createmove(slot_0_133_1, arg_722_0)
	events.render(slot_0_75_11, arg_722_0)
	events.player_death(slot_0_135_1, arg_722_0)
	events.round_prestart(slot_0_137_1, arg_722_0)
	events.round_start(slot_0_136_1, arg_722_0)
	events.level_init(slot_0_138_1, arg_722_0)

	slot_0_50_6.callbacks_registered = arg_722_0
end

function slot_0_142_1(arg_723_0)
	local var_723_0 = slot_0_51_7()

	if var_723_0 ~= true then
		slot_0_120_3(true)
	else
		slot_0_64_16("waiting for scan")
	end

	slot_0_141_1(var_723_0)
end

if slot_0_47_5.enabled ~= nil then
	slot_0_47_5.enabled:set_callback(slot_0_142_1, true)
end

if slot_0_47_5.mode ~= nil then
	slot_0_47_5.mode:set_callback(slot_0_139_1, true)
end

if slot_0_47_5.options ~= nil then
	slot_0_47_5.options:set_callback(slot_0_140_1, true)
end

events.shutdown(function()
	slot_0_141_1(false)
	slot_0_61_16(true)
	slot_0_120_3(true)
end, true)

slot_0_47_4 = {
	attack_inaccuracy = 0.01,
	on_ground = 1,
	unsupported_weapon_types = {
		[0] = true,
		[9] = true
	},
	point_templates = {
		{
			scale = 5,
			hitbox = "Stomach",
			offset = vector(0, 0, 40)
		},
		{
			scale = 6,
			hitbox = "Chest",
			offset = vector(0, 0, 50)
		},
		{
			scale = 3,
			hitbox = "Head",
			offset = vector(0, 0, 58)
		},
		{
			scale = 4,
			hitbox = "Legs",
			offset = vector(0, 0, 20)
		}
	}
}
slot_0_48_3 = slot_0_21_0.dormant_aimbot
slot_0_49_4 = false

function slot_0_50_5(arg_725_0, arg_725_1)
	if arg_725_0 == nil then
		return arg_725_1
	end

	local var_725_0 = arg_725_0:get_override()

	if var_725_0 == nil then
		var_725_0 = arg_725_0:get()
	end

	local var_725_1 = tonumber(var_725_0)

	if var_725_1 == nil then
		return arg_725_1
	end

	return var_725_1
end

function slot_0_51_6(arg_726_0, arg_726_1)
	if arg_726_0 == nil then
		return false
	end

	for iter_726_0 = 1, #arg_726_0 do
		if arg_726_0[iter_726_0] == arg_726_1 then
			return true
		end
	end

	return false
end

function slot_0_52_7(arg_727_0, arg_727_1)
	if arg_727_0 == nil or not arg_727_0:is_weapon() or arg_727_1 == nil then
		return false
	end

	if slot_0_47_4.unsupported_weapon_types[arg_727_1.weapon_type] then
		return false
	end

	if arg_727_0:get_weapon_reload() ~= -1 then
		return false
	end

	if arg_727_0.m_iClip1 ~= nil and arg_727_0.m_iClip1 <= 0 then
		return false
	end

	return true
end

function slot_0_53_8(arg_728_0, arg_728_1, arg_728_2)
	local var_728_0 = globals.curtime
	local var_728_1 = arg_728_1.m_flNextPrimaryAttack or 0

	if arg_728_2 ~= nil and arg_728_2.is_revolver == true then
		return var_728_1 <= var_728_0
	end

	if var_728_0 < (arg_728_0.m_flNextAttack or 0) then
		return false
	end

	if var_728_0 < var_728_1 then
		return false
	end

	return true
end

function slot_0_54_9(arg_729_0)
	local var_729_0 = math.max(0, slot_0_50_5(slot_0_11_0.rage.selection.minimum_damage, 0))

	if var_729_0 > 100 then
		var_729_0 = (arg_729_0.m_iHealth or 100) + var_729_0 - 100
	end

	if var_729_0 < 1 then
		return 1
	end

	return var_729_0
end

function slot_0_55_10(arg_730_0)
	local var_730_0 = 0

	if arg_730_0.hitbox == "Head" then
		if slot_0_48_3.head_scale ~= nil then
			var_730_0 = slot_0_48_3.head_scale:get()
		end
	elseif slot_0_48_3.body_scale ~= nil then
		var_730_0 = slot_0_48_3.body_scale:get()
	end

	if var_730_0 == 0 then
		return arg_730_0.scale
	end

	return arg_730_0.scale * var_730_0 * 0.01
end

function slot_0_56_10(arg_731_0, arg_731_1, arg_731_2)
	local var_731_0 = arg_731_0:to(arg_731_1):angles()
	local var_731_1 = math.rad(var_731_0.y + 90)
	local var_731_2 = vector(math.cos(var_731_1), math.sin(var_731_1), 0) * arg_731_2

	return {
		{
			vec = arg_731_1
		},
		{
			vec = arg_731_1 + var_731_2
		},
		{
			vec = arg_731_1 - var_731_2
		}
	}
end

function slot_0_57_11(arg_732_0, arg_732_1, arg_732_2, arg_732_3)
	local var_732_0, var_732_1 = utils.trace_bullet(arg_732_0, arg_732_1, arg_732_2, function(arg_733_0)
		return arg_733_0 == arg_732_3
	end)

	if var_732_1 ~= nil then
		local var_732_2 = var_732_1.entity

		if var_732_2 == nil then
			return 0, var_732_1
		end

		if var_732_2:is_player() and not var_732_2:is_enemy() then
			return 0, var_732_1
		end
	end

	return var_732_0, var_732_1
end

function slot_0_58_12(arg_734_0, arg_734_1)
	local var_734_0 = math.sqrt(arg_734_0.forwardmove * arg_734_0.forwardmove + arg_734_0.sidemove * arg_734_0.sidemove)

	if arg_734_1 <= 0 or var_734_0 <= 0 then
		return
	end

	if arg_734_0.in_duck == 1 then
		arg_734_1 = arg_734_1 * 2.94117647
	end

	if var_734_0 <= arg_734_1 then
		return
	end

	local var_734_1 = arg_734_1 / var_734_0

	arg_734_0.forwardmove = arg_734_0.forwardmove * var_734_1
	arg_734_0.sidemove = arg_734_0.sidemove * var_734_1
end

function slot_0_59_13(arg_735_0, arg_735_1)
	local var_735_0 = slot_0_48_3.hitbox:get()
	local var_735_1 = slot_0_48_3.accuracy:get()
	local var_735_2 = var_735_0 ~= nil and #var_735_0 or 0
	local var_735_3

	entity.get_players(true, true, function(arg_736_0)
		if var_735_3 ~= nil then
			return
		end

		if arg_736_0 == nil or not arg_736_0:is_alive() or not arg_736_0:is_dormant() then
			return
		end

		if arg_736_0:is_visible() then
			return
		end

		if arg_736_0:get_network_state() == 5 then
			return
		end

		local var_736_0 = arg_736_0:get_bbox()

		if var_736_0 == nil then
			return
		end

		local var_736_1 = var_736_0.alpha or 0
		local var_736_2 = math.floor(var_736_1 * 100) + 5

		if var_736_1 == 0 or var_736_2 <= var_735_1 then
			return
		end

		local var_736_3 = arg_736_0:get_origin()

		if var_736_3 == nil then
			return
		end

		local var_736_4 = slot_0_54_9(arg_736_0)

		for iter_736_0 = 1, #slot_0_47_4.point_templates do
			local var_736_5 = slot_0_47_4.point_templates[iter_736_0]

			if var_735_2 == 0 or slot_0_51_6(var_735_0, var_736_5.hitbox) then
				local var_736_6 = var_736_3 + var_736_5.offset
				local var_736_7 = slot_0_56_10(arg_735_1, var_736_6, slot_0_55_10(var_736_5))

				for iter_736_1 = 1, #var_736_7 do
					local var_736_8 = var_736_7[iter_736_1]
					local var_736_9 = slot_0_57_11(arg_735_0, arg_735_1, var_736_8.vec, arg_736_0)

					if var_736_9 ~= 0 and var_736_4 < var_736_9 then
						var_735_3 = {
							point = var_736_8.vec
						}

						return
					end
				end
			end
		end
	end)

	return var_735_3
end

function slot_0_60_14()
	if slot_0_48_3.native_ref ~= nil then
		slot_0_48_3.native_ref:override()
	end
end

function slot_0_61_15(arg_738_0)
	local var_738_0 = entity.get_local_player()

	if var_738_0 == nil or not var_738_0:is_alive() then
		return
	end

	local var_738_1 = var_738_0:get_player_weapon()

	if var_738_1 == nil then
		return
	end

	local var_738_2 = var_738_1:get_weapon_info()

	if not slot_0_52_7(var_738_1, var_738_2) then
		return
	end

	if not slot_0_53_8(var_738_0, var_738_1, var_738_2) then
		return
	end

	local var_738_3 = bit.band(var_738_0.m_fFlags or 0, slot_0_47_4.on_ground) ~= 0

	if (arg_738_0.in_jump == 1 or arg_738_0.in_jump == true) and not var_738_3 then
		return
	end

	local var_738_4 = var_738_0:get_eye_position()

	if var_738_4 == nil then
		return
	end

	local var_738_5 = slot_0_59_13(var_738_0, var_738_4)

	if var_738_5 == nil then
		return
	end

	local var_738_6 = var_738_0.m_bIsScoped or var_738_0.m_bResumeZoom
	local var_738_7 = var_738_6 and var_738_2.max_player_speed_alt or var_738_2.max_player_speed

	if var_738_7 ~= nil then
		slot_0_58_12(arg_738_0, var_738_7 * 0.33)
	end

	if not var_738_6 and var_738_2.weapon_type == 5 and var_738_3 then
		arg_738_0.in_attack2 = true
	end

	if var_738_1:get_inaccuracy() >= slot_0_47_4.attack_inaccuracy then
		return
	end

	local var_738_8 = var_738_4:to(var_738_5.point):angles()

	arg_738_0.view_angles.x = var_738_8.x
	arg_738_0.view_angles.y = var_738_8.y
	arg_738_0.in_attack = true
end

function slot_0_62_16(arg_739_0)
	local var_739_0 = arg_739_0 ~= nil and arg_739_0:get() == true

	if var_739_0 == slot_0_49_4 then
		return
	end

	if var_739_0 then
		if slot_0_48_3.native_ref ~= nil then
			slot_0_48_3.native_ref:override(false)
		end

		events.createmove(slot_0_61_15, true)

		slot_0_49_4 = true

		return
	end

	events.createmove(slot_0_61_15, false)
	slot_0_60_14()

	slot_0_49_4 = false
end

if slot_0_48_3.enabled ~= nil then
	slot_0_48_3.enabled:set_callback(slot_0_62_16, true)
end

events.shutdown(slot_0_60_14, true)

slot_0_47_3 = 1
slot_0_48_2 = cvar.sv_maxunlag
slot_0_49_3 = nil

function slot_0_50_4(arg_740_0)
	if arg_740_0 == nil then
		return false
	end

	local var_740_0 = arg_740_0:get_weapon_info()

	if var_740_0 == nil then
		return false
	end

	return var_740_0.is_revolver == true
end

function slot_0_51_5()
	local var_741_0 = slot_0_15_0.fake_lag_limit_override_state

	if var_741_0 ~= nil then
		var_741_0.fix_recharge_delay = nil
	end

	if slot_0_15_0.apply_fake_lag_limit_override ~= nil then
		slot_0_15_0.apply_fake_lag_limit_override()
	end
end

function slot_0_52_6()
	if rage == nil or rage.exploit == nil then
		return nil
	end

	local var_742_0, var_742_1 = pcall(rage.exploit.get, rage.exploit)

	if not var_742_0 or type(var_742_1) ~= "number" then
		return nil
	end

	return var_742_1
end

function slot_0_53_7()
	local var_743_0 = slot_0_15_0.fake_lag_limit_override_state

	if var_743_0 == nil or slot_0_15_0.apply_fake_lag_limit_override == nil then
		return
	end

	local var_743_1 = entity.get_local_player()

	if var_743_1 == nil or var_743_1:is_alive() ~= true then
		slot_0_51_5()

		return
	end

	local var_743_2 = var_743_1:get_player_weapon()

	if slot_0_50_4(var_743_2) then
		slot_0_51_5()

		return
	end

	local var_743_3 = var_743_1.m_fFlags

	if type(var_743_3) ~= "number" or bit.band(var_743_3, slot_0_47_3) ~= 0 then
		slot_0_51_5()

		return
	end

	local var_743_4 = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.double_tap
	local var_743_5 = slot_0_11_0.rage and slot_0_11_0.rage.main and slot_0_11_0.rage.main.hide_shots
	local var_743_6 = var_743_4 ~= nil and var_743_4:get() == true
	local var_743_7 = var_743_5 ~= nil and var_743_5:get() == true

	if not var_743_6 and not var_743_7 then
		slot_0_51_5()

		return
	end

	local var_743_8 = slot_0_11_0.aa and slot_0_11_0.aa.misc and slot_0_11_0.aa.misc.fake_duck

	if var_743_8 ~= nil and var_743_8:get() == true then
		slot_0_51_5()

		return
	end

	local var_743_9 = slot_0_52_6()

	if var_743_9 == nil or var_743_9 >= 1 then
		slot_0_51_5()

		return
	end

	var_743_0.fix_recharge_delay = 1

	slot_0_15_0.apply_fake_lag_limit_override()
end

function slot_0_54_8()
	if slot_0_48_2 == nil or slot_0_49_3 == nil then
		return
	end

	slot_0_48_2:float(slot_0_49_3, true)

	slot_0_49_3 = nil
end

function slot_0_55_9()
	if slot_0_48_2 == nil then
		return
	end

	if slot_0_49_3 == nil then
		slot_0_49_3 = slot_0_48_2:float()
	end

	slot_0_48_2:float(0.4, true)
end

if slot_0_21_0.fix_recharge_delay ~= nil then
	slot_0_21_0.fix_recharge_delay:set_callback(function(arg_746_0)
		local var_746_0 = arg_746_0 ~= nil and arg_746_0:get() == true

		events.createmove(slot_0_53_7, var_746_0)

		if var_746_0 ~= true then
			slot_0_51_5()
		end
	end, true)
end

if slot_0_21_0.unlock_ping_spike ~= nil then
	slot_0_21_0.unlock_ping_spike:set_callback(function(arg_747_0)
		if (arg_747_0 ~= nil and arg_747_0:get() == true) ~= true then
			slot_0_54_8()

			return
		end

		slot_0_55_9()
	end, true)
end

events.shutdown(slot_0_51_5, true)
events.shutdown(slot_0_54_8, true)

slot_0_47_2 = "\aF2F2F2FF"
slot_0_48_1 = color(214, 120, 120, 255):to_hex()
slot_0_49_2 = color(255, 255, 255, 150):to_hex()
slot_0_50_3 = "cart-shopping"
slot_0_51_4 = ui.get_icon(slot_0_50_3)
slot_0_52_5 = {
	[0] = "generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck",
	"generic",
	"gear"
}

if type(slot_0_51_4) ~= "string" or slot_0_51_4 == "" then
	slot_0_51_4 = "$"
end

slot_0_53_6 = false
slot_0_54_7 = false
slot_0_55_8 = color(255, 0, 0, 255):to_hex()
slot_0_56_9 = color(255, 0, 0, 255):to_hex()

function slot_0_57_10(arg_748_0, arg_748_1)
	return "\a" .. arg_748_0 .. arg_748_1 .. slot_0_47_2
end

function slot_0_58_11(arg_749_0)
	return slot_0_57_10(slot_0_55_8, arg_749_0)
end

function slot_0_59_12(arg_750_0)
	return slot_0_57_10(slot_0_56_9, arg_750_0)
end

function slot_0_60_13(arg_751_0)
	return slot_0_57_10(slot_0_49_2, arg_751_0)
end

function slot_0_61_14(arg_752_0)
	return slot_0_57_10(slot_0_48_1, arg_752_0)
end

function slot_0_62_15(arg_753_0)
	return slot_0_52_5[arg_753_0] or slot_0_52_5[0]
end

function slot_0_63_14(arg_754_0)
	if arg_754_0 == "" then
		return arg_754_0
	end

	return arg_754_0:sub(1, 1):upper() .. arg_754_0:sub(2):lower()
end

function slot_0_64_15(arg_755_0, arg_755_1)
	local var_755_0 = arg_755_1
	local var_755_1 = arg_755_0

	if arg_755_0 == "purchase" then
		var_755_0 = slot_0_58_11(slot_0_51_4) .. " " .. arg_755_1
		var_755_1 = slot_0_50_3
	end

	print_raw(var_755_0)
	common.add_event(arg_755_1, var_755_1)
end

function slot_0_65_16(arg_756_0)
	if type(arg_756_0) ~= "number" then
		return "?"
	end

	return string.format("%.0f%%", arg_756_0)
end

function slot_0_66_16(arg_757_0)
	if type(arg_757_0) ~= "number" then
		return "?"
	end

	return string.format("%dt", arg_757_0)
end

function slot_0_67_16(arg_758_0)
	if type(arg_758_0) ~= "number" then
		return "?"
	end

	return tostring(arg_758_0)
end

function slot_0_68_14(arg_759_0)
	if type(arg_759_0) ~= "number" then
		return "?"
	end

	return string.format("%.2f", arg_759_0)
end

function slot_0_69_17(arg_760_0, arg_760_1)
	if arg_760_1 == nil or arg_760_1 == "" then
		return arg_760_0
	end

	return arg_760_0 .. slot_0_60_13("(") .. slot_0_59_12(arg_760_1) .. slot_0_60_13(")")
end

function slot_0_70_16(arg_761_0, arg_761_1)
	local var_761_0 = slot_0_67_16(arg_761_0)

	if type(arg_761_0) == "number" and type(arg_761_1) == "number" and arg_761_1 <= arg_761_0 then
		return var_761_0
	end

	if type(arg_761_1) ~= "number" then
		return var_761_0
	end

	return slot_0_69_17(var_761_0, slot_0_67_16(arg_761_1))
end

function slot_0_71_16(arg_762_0, arg_762_1)
	local var_762_0 = slot_0_62_15(arg_762_0)
	local var_762_1 = slot_0_62_15(arg_762_1)

	if var_762_1 == "generic" or var_762_0 == var_762_1 then
		return slot_0_58_11(var_762_0)
	end

	return slot_0_58_11(slot_0_69_17(var_762_0, var_762_1))
end

function slot_0_72_14(arg_763_0, arg_763_1, arg_763_2)
	return " " .. slot_0_60_13(string.format("[hc: %s  /  bt: %s  /  sp: %s]", arg_763_0, arg_763_1, arg_763_2))
end

function slot_0_73_14(arg_764_0)
	if type(arg_764_0) ~= "string" then
		return "Unknown"
	end

	return (arg_764_0:lower():gsub("^weapon_", ""):gsub("^item_", ""):gsub("_", " "):gsub("%S+", slot_0_63_14))
end

function slot_0_74_13(arg_765_0)
	if type(arg_765_0) ~= "string" then
		return nil
	end

	local var_765_0 = arg_765_0:lower()

	if var_765_0 == "inferno" then
		return "molotov"
	end

	if var_765_0 == "hegrenade" then
		return "grenade"
	end

	if var_765_0:find("knife", 1, true) ~= nil or var_765_0:find("bayonet", 1, true) ~= nil then
		return "knife"
	end

	return nil
end

slot_0_75_10 = nil
slot_0_76_9 = nil
slot_0_77_8 = nil

function slot_0_78_8()
	events.aim_ack(slot_0_75_10, slot_0_53_6)
	events.player_hurt(slot_0_76_9, slot_0_53_6)
	events.item_purchase(slot_0_77_8, slot_0_54_7)
end

function slot_0_75_10(arg_767_0)
	if slot_0_53_6 ~= true or arg_767_0 == nil then
		return
	end

	local var_767_0 = arg_767_0.target

	if var_767_0 == nil or var_767_0:is_player() ~= true then
		return
	end

	local var_767_1 = slot_0_58_11(var_767_0:get_name())
	local var_767_2 = slot_0_65_16(arg_767_0.hitchance)
	local var_767_3 = slot_0_66_16(arg_767_0.backtrack)
	local var_767_4 = slot_0_68_14(arg_767_0.spread)
	local var_767_5 = slot_0_72_14(var_767_2, var_767_3, var_767_4)

	if arg_767_0.state ~= nil then
		local var_767_6 = slot_0_62_15(arg_767_0.wanted_hitgroup)

		if var_767_6 == "generic" then
			slot_0_64_15("xmark", "Miss " .. var_767_1 .. " due to " .. slot_0_61_14(arg_767_0.state) .. " " .. var_767_5)

			return
		end

		slot_0_64_15("xmark", "Miss " .. var_767_1 .. " in " .. slot_0_58_11(var_767_6) .. " due to " .. slot_0_61_14(arg_767_0.state) .. " " .. var_767_5)

		return
	end

	local var_767_7 = slot_0_62_15(arg_767_0.hitgroup)
	local var_767_8 = slot_0_62_15(arg_767_0.wanted_hitgroup)
	local var_767_9 = slot_0_70_16(arg_767_0.damage, arg_767_0.wanted_damage)

	if var_767_7 == "generic" then
		slot_0_64_15("check", "Hit " .. var_767_1 .. " for " .. slot_0_58_11(var_767_9) .. " damage " .. var_767_5)

		return
	end

	if var_767_8 == "generic" then
		slot_0_64_15("check", "Hit " .. var_767_1 .. " in " .. slot_0_58_11(var_767_7) .. " for " .. slot_0_58_11(var_767_9) .. " damage " .. var_767_5)

		return
	end

	slot_0_64_15("check", "Hit " .. var_767_1 .. " in " .. slot_0_71_16(arg_767_0.hitgroup, arg_767_0.wanted_hitgroup) .. " for " .. slot_0_58_11(var_767_9) .. " damage " .. var_767_5)
end

function slot_0_76_9(arg_768_0)
	if slot_0_53_6 ~= true or arg_768_0 == nil then
		return
	end

	if type(arg_768_0.userid) ~= "number" or type(arg_768_0.attacker) ~= "number" then
		return
	end

	local var_768_0 = entity.get_local_player()

	if var_768_0 == nil then
		return
	end

	if entity.get(arg_768_0.attacker, true) ~= var_768_0 then
		return
	end

	local var_768_1 = entity.get(arg_768_0.userid, true)

	if var_768_1 == nil or var_768_1 == var_768_0 or var_768_1:is_player() ~= true then
		return
	end

	local var_768_2 = slot_0_74_13(arg_768_0.weapon)

	if var_768_2 == nil then
		return
	end

	local var_768_3 = slot_0_58_11(var_768_1:get_name())
	local var_768_4 = slot_0_62_15(arg_768_0.hitgroup)
	local var_768_5 = slot_0_58_11(slot_0_67_16(arg_768_0.dmg_health))
	local var_768_6 = slot_0_58_11(var_768_2)

	if var_768_4 == "generic" then
		slot_0_64_15("check", "Hit " .. var_768_3 .. " for " .. var_768_5 .. " damage " .. " " .. slot_0_60_13("[") .. var_768_6 .. slot_0_60_13("]"))

		return
	end

	slot_0_64_15("check", "Hit " .. var_768_3 .. " in " .. slot_0_58_11(var_768_4) .. " for " .. var_768_5 .. " damage " .. " " .. slot_0_60_13("[") .. var_768_6 .. slot_0_60_13("]"))
end

function slot_0_77_8(arg_769_0)
	if slot_0_54_7 ~= true then
		return
	end

	if type(arg_769_0.userid) ~= "number" or type(arg_769_0.weapon) ~= "string" then
		return
	end

	if arg_769_0.weapon == "weapon_unknown" then
		return
	end

	if entity.get_local_player() == nil then
		return
	end

	local var_769_0 = entity.get(arg_769_0.userid, true)

	if var_769_0 == nil or var_769_0:is_enemy() ~= true then
		return
	end

	slot_0_64_15("purchase", slot_0_58_11(var_769_0:get_name()) .. " bought " .. slot_0_58_11(slot_0_73_14(arg_769_0.weapon)))
end

function slot_0_79_7(arg_770_0)
	if arg_770_0 == nil then
		slot_0_53_6 = false
		slot_0_54_7 = false

		slot_0_78_8()

		return
	end

	slot_0_53_6 = arg_770_0:get(1) == true
	slot_0_54_7 = arg_770_0:get(2) == true

	slot_0_78_8()
end

function slot_0_80_6(arg_771_0)
	if arg_771_0 == nil then
		return
	end

	local var_771_0 = arg_771_0:get()

	if var_771_0 == nil then
		return
	end

	slot_0_55_8 = var_771_0:to_hex()
	slot_0_56_9 = color(math.max(math.floor(var_771_0.r * 0.78), 0), math.max(math.floor(var_771_0.g * 0.78), 0), math.max(math.floor(var_771_0.b * 0.78), 0), var_771_0.a):to_hex()
end

if slot_0_21_0.logs ~= nil then
	slot_0_21_0.logs:set_callback(slot_0_79_7, true)
end

if slot_0_21_0.logs_accent ~= nil then
	slot_0_21_0.logs_accent:set_callback(slot_0_80_6, true)
end

events.shutdown(function()
	slot_0_53_6 = false
	slot_0_54_7 = false

	slot_0_78_8()
end, true)

slot_0_47_1 = nil
slot_0_47_0 = {
	override_active = false,
	active = false,
	bind_active = false,
	updated_at = 0
}
slot_0_48_0 = nil
slot_0_49_1 = slot_0_4_0.gdi_font_api
slot_0_50_2 = {
	gamesense_side = slot_0_23_0.gamesense_side_enabled,
	gamesense_side_shadow_alpha = slot_0_23_0.gamesense_side_shadow_alpha,
	gamesense_side_list = slot_0_23_0.gamesense_side_list
}
slot_0_51_3 = "Calibri"
slot_0_52_4 = 24
slot_0_53_5 = 700
slot_0_54_6 = 6
slot_0_55_7 = 4
slot_0_56_8 = 128
slot_0_57_9 = 1
slot_0_58_10 = slot_0_25_0.position
slot_0_59_11 = slot_0_25_0.shadow_alpha
slot_0_60_12 = slot_0_25_0.position_max
slot_0_61_13 = 4
slot_0_62_14 = 21
slot_0_63_13 = 4
slot_0_64_14 = 0.1
slot_0_65_15 = 0.1
slot_0_66_15 = 0.1
slot_0_67_15 = 0.1
slot_0_68_13 = 0.82
slot_0_69_16 = 0.01
slot_0_70_15 = 6
slot_0_71_15 = -2
slot_0_72_13 = vector(32, 29, 0)
slot_0_73_13 = 4
slot_0_74_12 = 3372220415
slot_0_75_9 = 4279616143
slot_0_76_8 = slot_0_11_0.rage.main.dormant_aimbot
slot_0_77_7 = slot_0_11_0.rage.main.double_tap
slot_0_78_7 = slot_0_11_0.rage.main.hide_shots
slot_0_79_6 = slot_0_11_0.rage.safety.body_aim
slot_0_80_5 = slot_0_11_0.rage.safety.safe_points
slot_0_81_4 = slot_0_11_0.rage.selection.minimum_damage
slot_0_82_4 = slot_0_11_0.rage.selection.hit_chance
slot_0_83_4 = slot_0_11_0.aa.misc.fake_duck
slot_0_84_4 = slot_0_11_0.aa.angles.freestanding
slot_0_85_4 = slot_0_11_0.misc.main.other.fake_latency
slot_0_86_3 = utils.get_vfunc("engine.dll", "VEngineClient014", 91, "float(__thiscall*)(void*)")
slot_0_87_4 = nil
slot_0_87_3 = {}

function slot_0_88_4(arg_773_0)
	if type(arg_773_0) == "boolean" then
		return arg_773_0 and 1 or 0
	end

	return arg_773_0 or 0
end

function slot_0_89_3(arg_774_0, arg_774_1, arg_774_2, arg_774_3)
	if arg_774_3 <= 0 then
		return arg_774_1 + arg_774_2
	end

	return arg_774_1 + arg_774_2 * (arg_774_0 / arg_774_3)
end

function slot_0_90_3()
	local var_775_0 = globals.frametime

	if type(var_775_0) ~= "number" or var_775_0 <= 0 then
		return 0
	end

	local var_775_1 = slot_0_86_3()

	if type(var_775_1) == "number" and var_775_1 > 0 then
		var_775_0 = var_775_0 / var_775_1
	end

	return var_775_0
end

function slot_0_87_3.new(arg_776_0, arg_776_1)
	local var_776_0 = slot_0_88_4(arg_776_0)
	local var_776_1 = {}
	local var_776_2 = {
		duration = 0,
		elapsed = 0,
		value = var_776_0,
		start_value = var_776_0,
		target_value = var_776_0,
		easing = arg_776_1 or slot_0_89_3
	}

	function var_776_1.update(arg_777_0, arg_777_1, arg_777_2, arg_777_3)
		local var_777_0 = slot_0_88_4(arg_777_2)
		local var_777_1 = arg_777_1 or 0

		if var_777_1 <= 0 then
			arg_777_0.value = var_777_0
			arg_777_0.start_value = var_777_0
			arg_777_0.target_value = var_777_0
			arg_777_0.elapsed = 0
			arg_777_0.duration = 0

			return arg_777_0.value
		end

		if arg_777_0.target_value ~= var_777_0 then
			arg_777_0.start_value = arg_777_0.value
			arg_777_0.target_value = var_777_0
			arg_777_0.elapsed = 0
		end

		arg_777_0.duration = var_777_1

		if arg_777_0.value == arg_777_0.target_value then
			return arg_777_0.value
		end

		local var_777_2 = slot_0_90_3()

		if var_777_2 <= 0 then
			return arg_777_0.value
		end

		arg_777_0.elapsed = arg_777_0.elapsed + var_777_2

		local var_777_3 = arg_777_3 or arg_777_0.easing
		local var_777_4 = math.min(arg_777_0.elapsed, arg_777_0.duration)

		arg_777_0.value = var_777_3(var_777_4, arg_777_0.start_value, arg_777_0.target_value - arg_777_0.start_value, arg_777_0.duration)

		if var_777_4 >= arg_777_0.duration then
			arg_777_0.value = arg_777_0.target_value
			arg_777_0.start_value = arg_777_0.target_value
			arg_777_0.elapsed = 0
		end

		return arg_777_0.value
	end

	return setmetatable(var_776_1, {
		__metatable = false,
		__call = var_776_1.update,
		__index = var_776_2
	})
end

slot_0_88_3 = render.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32, 0))
slot_0_89_2 = {
	drag_bottom_offset = 0,
	drag_top_offset = 0,
	drag_base_y = 0,
	drag_bounds_max_y = 0,
	drag_bounds_max_x = 0,
	drag_bounds_min_y = 0,
	drag_bounds_min_x = 0,
	drag_has_bounds = false,
	drag_was_left_down = false,
	drag_hovered = false,
	global_alpha_scale = 1,
	animate_enabled = false,
	enabled = false,
	drag_offset_y = 0,
	dragging = false,
	frame_id = 0,
	zone_offset = slot_0_58_10,
	shadow_alpha = slot_0_59_11,
	animation_entries = {},
	animation_draw_list = {},
	animation_remove_keys = {}
}
slot_0_90_2 = slot_0_49_1.new_renderer({
	shadow = true,
	face = slot_0_51_3,
	size = slot_0_52_4,
	weight = slot_0_53_5,
	quality = slot_0_54_6
}, slot_0_55_7, slot_0_56_8)
slot_0_91_2 = {}
slot_0_92_2 = {}
slot_0_93_2 = {}
slot_0_94_2 = {}
slot_0_95_2 = {}
slot_0_96_2 = {}
slot_0_97_2 = {}
slot_0_98_2 = {}
slot_0_99_2 = 0
slot_0_100_2 = {
	min_damage = {
		inferred = false,
		by_name = false,
		by_id = false,
		active = false
	},
	hit_chance = {
		inferred = false,
		by_name = false,
		by_id = false,
		active = false
	}
}
slot_0_101_3 = nil

function slot_0_102_2(arg_778_0)
	if arg_778_0 == nil then
		return false
	end

	return arg_778_0:get() == true
end

function slot_0_103_2(arg_779_0)
	if arg_779_0 == nil then
		return nil
	end

	local var_779_0 = arg_779_0:get_override()

	if var_779_0 ~= nil then
		return var_779_0
	end

	return arg_779_0:get()
end

slot_0_104_2 = nil

function slot_0_105_2(arg_780_0, arg_780_1, arg_780_2)
	if arg_780_0 < arg_780_1 then
		return arg_780_1
	end

	if arg_780_2 < arg_780_0 then
		return arg_780_2
	end

	return arg_780_0
end

function slot_0_106_2(arg_781_0)
	if type(arg_781_0) ~= "number" then
		slot_0_89_2.zone_offset = slot_0_58_10

		return
	end

	slot_0_89_2.zone_offset = slot_0_105_2(math.floor(arg_781_0 + 0.5), 0, slot_0_60_12)
end

function slot_0_107_2()
	if slot_0_50_2.gamesense_side_position == nil then
		return
	end

	pcall(slot_0_50_2.gamesense_side_position.set, slot_0_50_2.gamesense_side_position, slot_0_89_2.zone_offset)
end

function slot_0_108_2()
	slot_0_89_2.drag_has_bounds = false
	slot_0_89_2.drag_bounds_min_x = 0
	slot_0_89_2.drag_bounds_min_y = 0
	slot_0_89_2.drag_bounds_max_x = 0
	slot_0_89_2.drag_bounds_max_y = 0
	slot_0_89_2.drag_base_y = 0
	slot_0_89_2.drag_top_offset = 0
	slot_0_89_2.drag_bottom_offset = 0

	if slot_0_89_2.dragging ~= true then
		slot_0_89_2.drag_hovered = false
	end
end

function slot_0_109_2(arg_784_0)
	slot_0_89_2.dragging = false
	slot_0_89_2.drag_hovered = false
	slot_0_89_2.drag_was_left_down = false

	if arg_784_0 == true then
		slot_0_107_2()
	end
end

function slot_0_110_2(arg_785_0, arg_785_1, arg_785_2, arg_785_3)
	if type(arg_785_0) ~= "number" or type(arg_785_1) ~= "number" or type(arg_785_2) ~= "number" or type(arg_785_3) ~= "number" then
		slot_0_108_2()

		return
	end

	slot_0_89_2.drag_has_bounds = true
	slot_0_89_2.drag_bounds_min_x = slot_0_70_15
	slot_0_89_2.drag_bounds_min_y = arg_785_0
	slot_0_89_2.drag_bounds_max_x = slot_0_70_15 + math.max(1, arg_785_2)
	slot_0_89_2.drag_bounds_max_y = arg_785_1
	slot_0_89_2.drag_base_y = arg_785_3
	slot_0_89_2.drag_top_offset = math.max(0, arg_785_3 - arg_785_0)
	slot_0_89_2.drag_bottom_offset = math.max(0, arg_785_1 - arg_785_3)
end

function slot_0_111_2(arg_786_0)
	if slot_0_89_2.drag_has_bounds ~= true or arg_786_0 == nil then
		return false
	end

	if arg_786_0.x < slot_0_89_2.drag_bounds_min_x then
		return false
	end

	if arg_786_0.x > slot_0_89_2.drag_bounds_max_x then
		return false
	end

	if arg_786_0.y < slot_0_89_2.drag_bounds_min_y then
		return false
	end

	if arg_786_0.y > slot_0_89_2.drag_bounds_max_y then
		return false
	end

	return true
end

function slot_0_112_2(arg_787_0)
	if arg_787_0 == nil then
		return false
	end

	local var_787_0 = ui.get_position()
	local var_787_1 = ui.get_size()

	if var_787_0 == nil or var_787_1 == nil then
		return false
	end

	if arg_787_0.x < var_787_0.x then
		return false
	end

	if arg_787_0.x > var_787_0.x + var_787_1.x then
		return false
	end

	if arg_787_0.y < var_787_0.y then
		return false
	end

	if arg_787_0.y > var_787_0.y + var_787_1.y then
		return false
	end

	return true
end

function slot_0_113_2()
	if slot_0_104_2 == nil then
		return
	end

	if slot_0_89_2.dragging == true then
		slot_0_109_2(true)
	end

	events.mouse_input(slot_0_104_2, false)
end

function slot_0_114_2(arg_789_0)
	if slot_0_50_2.gamesense_side_list == nil then
		return true
	end

	local var_789_0 = slot_0_50_2.gamesense_side_list:get(arg_789_0)

	if type(var_789_0) == "boolean" then
		return var_789_0
	end

	local var_789_1 = slot_0_50_2.gamesense_side_list:get()

	if type(var_789_1) ~= "table" then
		return true
	end

	for iter_789_0 = 1, #var_789_1 do
		if var_789_1[iter_789_0] == arg_789_0 then
			return true
		end
	end

	return false
end

function slot_0_101_2()
	return slot_0_24_0
end

function slot_0_115_2()
	local var_791_0 = slot_0_89_2.animation_entries
	local var_791_1 = slot_0_89_2.animation_draw_list
	local var_791_2 = slot_0_89_2.animation_remove_keys

	for iter_791_0 in pairs(var_791_0) do
		var_791_0[iter_791_0] = nil
	end

	for iter_791_1 = 1, #var_791_1 do
		var_791_1[iter_791_1] = nil
	end

	for iter_791_2 = 1, #var_791_2 do
		var_791_2[iter_791_2] = nil
	end
end

function slot_0_116_2()
	return
end

function slot_0_117_2()
	for iter_793_0 = 1, slot_0_99_2 do
		slot_0_91_2[iter_793_0] = nil
		slot_0_92_2[iter_793_0] = nil
		slot_0_93_2[iter_793_0] = nil
		slot_0_94_2[iter_793_0] = nil
		slot_0_95_2[iter_793_0] = nil
		slot_0_96_2[iter_793_0] = nil
		slot_0_97_2[iter_793_0] = nil
		slot_0_98_2[iter_793_0] = nil
	end

	slot_0_99_2 = 0
end

function slot_0_118_2(arg_794_0)
	return slot_0_90_2:measure_layout(arg_794_0)
end

function slot_0_119_2(arg_795_0)
	return slot_0_90_2:measure_draw(arg_795_0)
end

function slot_0_120_2(arg_796_0, arg_796_1, arg_796_2, arg_796_3)
	slot_0_90_2:draw_text(arg_796_0, arg_796_1, arg_796_2, arg_796_3)
end

function slot_0_121_2(arg_797_0, arg_797_1, arg_797_2)
	local var_797_0
	local var_797_1
	local var_797_2 = arg_797_0

	if type(arg_797_2) == "table" then
		var_797_0 = arg_797_2.icon

		if type(arg_797_2.progress) == "number" then
			var_797_1 = math.clamp(arg_797_2.progress, 0, 1)
		end

		if type(arg_797_2.key) == "string" and arg_797_2.key ~= "" then
			var_797_2 = arg_797_2.key
		end
	end

	local var_797_3 = slot_0_118_2(arg_797_0)
	local var_797_4 = var_797_3.x + 50
	local var_797_5 = var_797_3.y + slot_0_63_13 * 2

	if var_797_0 ~= nil then
		var_797_4 = var_797_4 + slot_0_72_13.x + 5
	end

	if var_797_1 ~= nil then
		var_797_4 = var_797_4 + 30
	end

	local var_797_6 = render.screen_size().y - slot_0_89_2.zone_offset

	if slot_0_99_2 > 0 then
		var_797_6 = slot_0_93_2[slot_0_99_2] - slot_0_61_13 - var_797_5
	end

	slot_0_99_2 = slot_0_99_2 + 1
	slot_0_91_2[slot_0_99_2] = arg_797_0
	slot_0_92_2[slot_0_99_2] = arg_797_1
	slot_0_93_2[slot_0_99_2] = var_797_6
	slot_0_94_2[slot_0_99_2] = var_797_4
	slot_0_95_2[slot_0_99_2] = var_797_5
	slot_0_96_2[slot_0_99_2] = var_797_0
	slot_0_97_2[slot_0_99_2] = var_797_1
	slot_0_98_2[slot_0_99_2] = var_797_2
end

function slot_0_122_2(arg_798_0, arg_798_1)
	if arg_798_1 >= 0.999 then
		return arg_798_0
	end

	return color(arg_798_0.r or 255, arg_798_0.g or 255, arg_798_0.b or 255, math.floor((arg_798_0.a or 255) * arg_798_1 + 0.5))
end

function slot_0_123_2(arg_799_0, arg_799_1, arg_799_2)
	return arg_799_0 + (arg_799_1 - arg_799_0) * arg_799_2
end

function slot_0_124_2()
	local var_800_0 = slot_0_89_2.animation_entries
	local var_800_1 = slot_0_89_2.frame_id

	for iter_800_0 = 1, slot_0_99_2 do
		local var_800_2 = slot_0_98_2[iter_800_0]

		if type(var_800_2) ~= "string" or var_800_2 == "" then
			var_800_2 = slot_0_91_2[iter_800_0]
		end

		local var_800_3 = var_800_0[var_800_2]

		if var_800_3 == nil then
			var_800_3 = {
				target_scale = 1,
				target_alpha = 1,
				draw_alpha = 0,
				move = slot_0_87_3.new(1),
				start_y = slot_0_93_2[iter_800_0],
				target_y = slot_0_93_2[iter_800_0],
				size = slot_0_87_3.new(1),
				start_width = slot_0_94_2[iter_800_0],
				target_width = slot_0_94_2[iter_800_0],
				start_height = slot_0_95_2[iter_800_0],
				target_height = slot_0_95_2[iter_800_0],
				alpha = slot_0_87_3.new(0),
				scale = slot_0_87_3.new(0),
				label = slot_0_91_2[iter_800_0],
				color = slot_0_92_2[iter_800_0],
				icon = slot_0_96_2[iter_800_0],
				progress = slot_0_97_2[iter_800_0],
				draw_y = slot_0_93_2[iter_800_0],
				draw_width = slot_0_94_2[iter_800_0],
				draw_height = slot_0_95_2[iter_800_0],
				draw_scale = slot_0_68_13,
				sort_index = iter_800_0,
				seen_frame = var_800_1
			}
			var_800_0[var_800_2] = var_800_3
		else
			if var_800_3.target_y ~= slot_0_93_2[iter_800_0] then
				if slot_0_89_2.dragging == true then
					var_800_3.move = slot_0_87_3.new(1)
					var_800_3.start_y = slot_0_93_2[iter_800_0]
					var_800_3.draw_y = slot_0_93_2[iter_800_0]
				else
					var_800_3.move = slot_0_87_3.new(0)
					var_800_3.start_y = var_800_3.draw_y
				end

				var_800_3.target_y = slot_0_93_2[iter_800_0]
			end

			if var_800_3.target_width ~= slot_0_94_2[iter_800_0] or var_800_3.target_height ~= slot_0_95_2[iter_800_0] then
				var_800_3.size = slot_0_87_3.new(0)
				var_800_3.start_width = var_800_3.draw_width
				var_800_3.target_width = slot_0_94_2[iter_800_0]
				var_800_3.start_height = var_800_3.draw_height
				var_800_3.target_height = slot_0_95_2[iter_800_0]
			end

			var_800_3.target_alpha = 1
			var_800_3.target_scale = 1
			var_800_3.label = slot_0_91_2[iter_800_0]
			var_800_3.color = slot_0_92_2[iter_800_0]
			var_800_3.icon = slot_0_96_2[iter_800_0]
			var_800_3.progress = slot_0_97_2[iter_800_0]
			var_800_3.sort_index = iter_800_0
			var_800_3.seen_frame = var_800_1
		end
	end

	for iter_800_1, iter_800_2 in pairs(var_800_0) do
		if iter_800_2.seen_frame ~= var_800_1 then
			iter_800_2.move = slot_0_87_3.new(1)
			iter_800_2.start_y = iter_800_2.draw_y
			iter_800_2.target_y = iter_800_2.draw_y
			iter_800_2.size = slot_0_87_3.new(1)
			iter_800_2.start_width = iter_800_2.draw_width
			iter_800_2.target_width = iter_800_2.draw_width
			iter_800_2.start_height = iter_800_2.draw_height
			iter_800_2.target_height = iter_800_2.draw_height
			iter_800_2.target_alpha = 0
			iter_800_2.target_scale = slot_0_68_13
		end
	end
end

function slot_0_125_2(arg_801_0, arg_801_1)
	if arg_801_0.draw_y == arg_801_1.draw_y then
		return (arg_801_0.sort_index or 0) < (arg_801_1.sort_index or 0)
	end

	return arg_801_0.draw_y < arg_801_1.draw_y
end

function slot_0_126_2()
	local var_802_0 = slot_0_89_2.animation_entries
	local var_802_1 = slot_0_89_2.animation_draw_list
	local var_802_2 = slot_0_89_2.animation_remove_keys
	local var_802_3 = 0
	local var_802_4 = 0

	for iter_802_0, iter_802_1 in pairs(var_802_0) do
		local var_802_5 = iter_802_1.move(slot_0_64_14, 1)
		local var_802_6 = iter_802_1.size(slot_0_66_15, 1)
		local var_802_7 = iter_802_1.target_scale <= slot_0_68_13 and 0 or 1

		iter_802_1.draw_y = slot_0_123_2(iter_802_1.start_y, iter_802_1.target_y, var_802_5)
		iter_802_1.draw_width = slot_0_123_2(iter_802_1.start_width, iter_802_1.target_width, var_802_6)
		iter_802_1.draw_height = slot_0_123_2(iter_802_1.start_height, iter_802_1.target_height, var_802_6)
		iter_802_1.draw_alpha = math.clamp(iter_802_1.alpha(slot_0_65_15, iter_802_1.target_alpha), 0, 1)
		iter_802_1.draw_scale = slot_0_68_13 + (1 - slot_0_68_13) * math.clamp(iter_802_1.scale(slot_0_67_15, var_802_7), 0, 1)

		if iter_802_1.target_alpha <= slot_0_69_16 and iter_802_1.draw_alpha <= slot_0_69_16 then
			var_802_4 = var_802_4 + 1
			var_802_2[var_802_4] = iter_802_0
		else
			var_802_3 = var_802_3 + 1
			var_802_1[var_802_3] = iter_802_1
		end
	end

	for iter_802_2 = var_802_3 + 1, #var_802_1 do
		var_802_1[iter_802_2] = nil
	end

	for iter_802_3 = 1, var_802_4 do
		var_802_0[var_802_2[iter_802_3]] = nil
		var_802_2[iter_802_3] = nil
	end

	for iter_802_4 = var_802_4 + 1, #var_802_2 do
		var_802_2[iter_802_4] = nil
	end

	if var_802_3 > 1 then
		table.sort(var_802_1, slot_0_125_2)
	end

	return var_802_3
end

function slot_0_127_2(arg_803_0)
	arg_803_0.active = false
	arg_803_0.value = nil
	arg_803_0.by_id = false
	arg_803_0.by_name = false
	arg_803_0.inferred = false
	arg_803_0.mode = nil
end

function slot_0_128_2(arg_804_0)
	if arg_804_0 == nil then
		return nil
	end

	return arg_804_0:id()
end

function slot_0_129_1(arg_805_0, arg_805_1)
	if type(arg_805_0) ~= "string" then
		return false
	end

	if arg_805_1 == "min_damage" then
		return string.find(arg_805_0, "Min. Damage", 1, true) ~= nil or string.find(arg_805_0, "Min Damage", 1, true) ~= nil or string.find(arg_805_0, "Minimum Damage", 1, true) ~= nil
	end

	if arg_805_1 == "hit_chance" then
		return string.find(arg_805_0, "Hit Chance", 1, true) ~= nil or string.find(arg_805_0, "Hit chance", 1, true) ~= nil or string.find(arg_805_0, "Hitchance", 1, true) ~= nil or string.find(arg_805_0, "Minimum Hitchance", 1, true) ~= nil
	end

	return false
end

function slot_0_130_0(arg_806_0, arg_806_1)
	local var_806_0, var_806_1 = pcall(function()
		return arg_806_0[arg_806_1]
	end)

	if not var_806_0 then
		return nil
	end

	if type(var_806_1) == "function" then
		local var_806_2, var_806_3 = pcall(var_806_1, arg_806_0)

		if var_806_2 then
			return var_806_3
		end
	end

	return var_806_1
end

function slot_0_131_0(arg_808_0, arg_808_1)
	for iter_808_0 = 1, #arg_808_1 do
		local var_808_0 = slot_0_130_0(arg_808_0, arg_808_1[iter_808_0])

		if var_808_0 ~= nil then
			return var_808_0
		end
	end

	return nil
end

function slot_0_132_0(arg_809_0)
	local var_809_0 = slot_0_131_0(arg_809_0, {
		"name",
		"label",
		"title"
	})

	if type(var_809_0) == "string" and var_809_0 ~= "" then
		return var_809_0
	end

	local var_809_1 = tostring(arg_809_0)

	if type(var_809_1) ~= "string" then
		return nil
	end

	local var_809_2 = var_809_1:match("^bind%((.*)%)$")

	if type(var_809_2) == "string" and var_809_2 ~= "" then
		return var_809_2
	end

	return var_809_1
end

function slot_0_133_0(arg_810_0)
	local var_810_0 = slot_0_131_0(arg_810_0, {
		"active",
		"is_active",
		"enabled",
		"state",
		"get"
	})

	if var_810_0 == true or var_810_0 == 1 then
		return true
	end

	if var_810_0 == false or var_810_0 == 0 then
		return false
	end

	local var_810_1 = slot_0_130_0(arg_810_0, "state")

	if var_810_1 == true or var_810_1 == 1 then
		return true
	end

	return false
end

function slot_0_134_0(arg_811_0)
	return slot_0_131_0(arg_811_0, {
		"value",
		"val",
		"bind_value",
		"get_value"
	})
end

function slot_0_135_0(arg_812_0)
	return slot_0_131_0(arg_812_0, {
		"mode",
		"bind_mode",
		"type",
		"get_mode"
	})
end

function slot_0_136_0(arg_813_0)
	return slot_0_131_0(arg_813_0, {
		"reference",
		"ref",
		"item",
		"menu_item",
		"get_reference"
	})
end

function slot_0_137_0(arg_814_0, arg_814_1, arg_814_2, arg_814_3)
	local var_814_0 = false
	local var_814_1 = false
	local var_814_2 = slot_0_136_0(arg_814_1)

	if var_814_2 ~= nil and arg_814_3 ~= nil then
		local var_814_3 = slot_0_128_2(var_814_2)

		var_814_0 = var_814_3 ~= nil and var_814_3 == arg_814_3
	end

	local var_814_4 = slot_0_132_0(arg_814_1)

	if slot_0_129_1(var_814_4, arg_814_2) then
		var_814_1 = true
	end

	if not var_814_0 and not var_814_1 then
		return
	end

	arg_814_0.by_id = arg_814_0.by_id or var_814_0
	arg_814_0.by_name = arg_814_0.by_name or var_814_1

	if arg_814_0.value == nil then
		arg_814_0.value = slot_0_134_0(arg_814_1)
	end

	local var_814_5 = slot_0_135_0(arg_814_1)
	local var_814_6 = slot_0_134_0(arg_814_1)

	if arg_814_0.mode == nil and var_814_5 ~= nil then
		arg_814_0.mode = var_814_5
	end

	if slot_0_133_0(arg_814_1) then
		arg_814_0.active = true
		arg_814_0.inferred = false
		arg_814_0.value = var_814_6

		return
	end

	if arg_814_0.active then
		return
	end

	arg_814_0.value = var_814_6
end

function slot_0_138_0(arg_815_0, arg_815_1, arg_815_2)
	if type(arg_815_0) ~= "table" then
		return
	end

	for iter_815_0 = 1, #arg_815_0 do
		local var_815_0 = arg_815_0[iter_815_0]

		slot_0_137_0(slot_0_100_2.min_damage, var_815_0, "min_damage", arg_815_1)
		slot_0_137_0(slot_0_100_2.hit_chance, var_815_0, "hit_chance", arg_815_2)
	end
end

function slot_0_139_0()
	slot_0_127_2(slot_0_100_2.min_damage)
	slot_0_127_2(slot_0_100_2.hit_chance)

	local var_816_0 = slot_0_128_2(slot_0_81_4)
	local var_816_1 = slot_0_128_2(slot_0_82_4)

	slot_0_138_0(ui.get_binds(), var_816_0, var_816_1)
end

function slot_0_140_0(arg_817_0)
	local var_817_0 = slot_0_100_2[arg_817_0]

	return type(var_817_0) == "table" and var_817_0.active == true
end

function slot_0_141_0(arg_818_0)
	if arg_818_0 == nil then
		return false
	end

	local var_818_0 = arg_818_0:get_override()

	if var_818_0 == nil then
		return false
	end

	return var_818_0 ~= arg_818_0:get()
end

function slot_0_142_0()
	if slot_0_47_0 == nil then
		return
	end

	local var_819_0 = slot_0_140_0("hit_chance")
	local var_819_1 = slot_0_141_0(slot_0_82_4)

	slot_0_47_0.bind_active = var_819_0
	slot_0_47_0.override_active = var_819_1
	slot_0_47_0.active = var_819_0 or var_819_1
	slot_0_47_0.updated_at = globals.realtime
end

function slot_0_143_0(arg_820_0)
	local var_820_0 = arg_820_0 % 256
	local var_820_1 = math.floor(arg_820_0 / 256) % 256
	local var_820_2 = math.floor(arg_820_0 / 65536) % 256
	local var_820_3 = math.floor(arg_820_0 / 16777216) % 256

	return var_820_0, var_820_1, var_820_2, var_820_3
end

function slot_0_144_0(arg_821_0, arg_821_1, arg_821_2, arg_821_3)
	return arg_821_0 + arg_821_1 * 256 + arg_821_2 * 65536 + arg_821_3 * 16777216
end

function slot_0_145_0(arg_822_0)
	if arg_822_0 ~= arg_822_0 or arg_822_0 < 0 then
		return 0
	end

	if arg_822_0 > 255 then
		return 255
	end

	return math.floor(arg_822_0)
end

function slot_0_146_0(arg_823_0)
	local var_823_0, var_823_1, var_823_2 = slot_0_143_0(arg_823_0)
	local var_823_3 = var_823_0 / 255
	local var_823_4 = var_823_1 / 255
	local var_823_5 = var_823_2 / 255
	local var_823_6 = math.min(var_823_3, var_823_4, var_823_5)
	local var_823_7 = math.max(var_823_3, var_823_4, var_823_5)
	local var_823_8 = var_823_7 - var_823_6
	local var_823_9 = 0
	local var_823_10 = 0
	local var_823_11 = var_823_7

	if var_823_8 < 1e-05 then
		return var_823_9, var_823_10, var_823_11
	end

	if var_823_7 > 0 then
		var_823_10 = var_823_8 / var_823_7
	else
		return 0 / 0, var_823_10, var_823_11
	end

	if var_823_7 <= var_823_3 then
		var_823_9 = (var_823_4 - var_823_5) / var_823_8
	elseif var_823_7 <= var_823_4 then
		var_823_9 = (var_823_5 - var_823_3) / var_823_8 + 2
	else
		var_823_9 = (var_823_3 - var_823_4) / var_823_8 + 4
	end

	local var_823_12 = var_823_9 * 60

	if var_823_12 < 0 then
		var_823_12 = var_823_12 + 360
	end

	return var_823_12, var_823_10, var_823_11
end

function slot_0_147_0(arg_824_0, arg_824_1, arg_824_2)
	local var_824_0 = arg_824_2
	local var_824_1 = arg_824_2
	local var_824_2 = arg_824_2

	if arg_824_1 > 0 then
		if arg_824_0 >= 360 then
			arg_824_0 = 0
		end

		arg_824_0 = arg_824_0 / 60

		local var_824_3 = math.floor(arg_824_0)
		local var_824_4 = arg_824_0 - var_824_3
		local var_824_5 = arg_824_2 * (1 - arg_824_1)
		local var_824_6 = arg_824_2 * (1 - arg_824_1 * var_824_4)
		local var_824_7 = arg_824_2 * (1 - arg_824_1 * (1 - var_824_4))

		if var_824_3 == 0 then
			var_824_0 = arg_824_2
			var_824_1 = var_824_7
			var_824_2 = var_824_5
		elseif var_824_3 == 1 then
			var_824_0 = var_824_6
			var_824_1 = arg_824_2
			var_824_2 = var_824_5
		elseif var_824_3 == 2 then
			var_824_0 = var_824_5
			var_824_1 = arg_824_2
			var_824_2 = var_824_7
		elseif var_824_3 == 3 then
			var_824_0 = var_824_5
			var_824_1 = var_824_6
			var_824_2 = arg_824_2
		elseif var_824_3 == 4 then
			var_824_0 = var_824_7
			var_824_1 = var_824_5
			var_824_2 = arg_824_2
		else
			var_824_0 = arg_824_2
			var_824_1 = var_824_5
			var_824_2 = var_824_6
		end
	end

	return slot_0_144_0(slot_0_145_0(var_824_0 * 255), slot_0_145_0(var_824_1 * 255), slot_0_145_0(var_824_2 * 255), 255)
end

function slot_0_148_0(arg_825_0, arg_825_1, arg_825_2)
	if arg_825_1 <= 0 then
		return arg_825_0
	end

	if arg_825_1 >= 1 then
		return arg_825_2
	end

	local var_825_0, var_825_1, var_825_2 = slot_0_146_0(arg_825_0)
	local var_825_3, var_825_4, var_825_5 = slot_0_146_0(arg_825_2)

	return slot_0_147_0((var_825_3 - var_825_0) * arg_825_1 + var_825_0, (var_825_4 - var_825_1) * arg_825_1 + var_825_1, (var_825_5 - var_825_2) * arg_825_1 + var_825_2)
end

function slot_0_149_0(arg_826_0)
	if type(arg_826_0) ~= "number" or arg_826_0 <= 0 then
		return nil
	end

	local var_826_0 = utils.net_channel()

	if var_826_0 == nil or var_826_0.latency == nil then
		return nil
	end

	local var_826_1 = (var_826_0.latency[0] or 0) + (var_826_0.latency[1] or 0)
	local var_826_2 = math.clamp(arg_826_0 * 0.001, 0.001, 0.2)
	local var_826_3 = math.clamp(var_826_1 / var_826_2, 0, 1)
	local var_826_4 = slot_0_148_0(slot_0_74_12, var_826_3, slot_0_75_9)
	local var_826_5, var_826_6, var_826_7, var_826_8 = slot_0_143_0(var_826_4)

	return color(var_826_5, var_826_6, var_826_7, var_826_8)
end

function slot_0_150_0(arg_827_0, arg_827_1)
	local var_827_0 = 0.5
	local var_827_1 = 0.5

	if arg_827_1 > 0 then
		local var_827_2 = arg_827_0 * var_827_0

		if arg_827_1 < (arg_827_0 - var_827_2) * var_827_1 then
			var_827_2 = arg_827_0 - arg_827_1 * (1 / var_827_1)
		end

		arg_827_0 = var_827_2
	end

	return arg_827_0
end

function slot_0_151_0(arg_828_0, arg_828_1)
	local var_828_0 = 500
	local var_828_1 = var_828_0 * 3.5
	local var_828_2 = arg_828_0:get_eye_position():dist(arg_828_1:get_origin())
	local var_828_3 = var_828_1 / 3
	local var_828_4 = math.exp(-var_828_2 * var_828_2 / (2 * var_828_3 * var_828_3))

	return slot_0_150_0(var_828_0 * var_828_4, arg_828_0.m_ArmorValue or 0)
end

function slot_0_152_0(arg_829_0)
	if entity.get_game_rules() == nil then
		return
	end

	slot_829_2_0 = entity.get_player_resource()

	if slot_829_2_0 == nil then
		return
	end

	if slot_0_114_2("Bomb Information") then
		slot_829_3_1 = slot_829_2_0.m_iPlayerC4

		if type(slot_829_3_1) == "number" and slot_829_3_1 > 0 then
			slot_829_4_1 = entity.get(slot_829_3_1)

			if slot_829_4_1 ~= nil then
				slot_829_5_1 = slot_829_4_1:get_player_weapon()

				if slot_829_5_1 ~= nil and slot_829_5_1.m_bStartedArming == true and type(slot_829_5_1.m_fArmedTime) == "number" then
					slot_829_6_1 = slot_829_5_1.m_fArmedTime - globals.curtime

					if slot_829_6_1 > 0 then
						slot_829_7_1 = "A"
						slot_829_8_2 = slot_829_4_1:get_origin()
						slot_829_9_2 = slot_829_2_0.m_bombsiteCenterA
						slot_829_10_1 = slot_829_2_0.m_bombsiteCenterB

						if slot_829_8_2 ~= nil and slot_829_9_2 ~= nil and slot_829_10_1 ~= nil then
							slot_829_7_1 = slot_829_8_2:distsqr(slot_829_9_2) < slot_829_8_2:distsqr(slot_829_10_1) and "A" or "B"
						end

						slot_0_121_2(string.format("%s - %.1fs", slot_829_7_1, slot_829_6_1), color(252, 243, 105, 255), {
							key = "bomb_arming_timer",
							icon = slot_0_88_3,
							progress = 1 - math.clamp(slot_829_6_1 / 3, 0, 1)
						})
					end
				end
			end
		end
	end

	slot_829_3_0 = entity.get_entities("CPlantedC4", true)

	if type(slot_829_3_0) ~= "table" or #slot_829_3_0 == 0 then
		return
	end

	slot_829_4_0 = slot_829_3_0[1]

	if slot_829_4_0 == nil or slot_829_4_0.m_bBombDefused == true or slot_829_4_0.m_bBombTicking ~= true then
		return
	end

	slot_829_5_0 = globals.curtime
	slot_829_6_0 = slot_829_4_0.m_flC4Blow

	if type(slot_829_6_0) ~= "number" then
		return
	end

	slot_829_7_0 = slot_829_6_0 - slot_829_5_0

	if slot_829_7_0 < 0 then
		return
	end

	if slot_0_114_2("Bomb Information") then
		slot_829_8_1 = slot_829_4_0.m_nBombSite == 1 and "B" or "A"

		slot_0_121_2(string.format("%s - %.1fs", slot_829_8_1, slot_829_7_0), color(255, 255, 255, 200), {
			key = "bomb_planted_timer",
			icon = slot_0_88_3
		})

		slot_829_9_1 = math.floor(slot_0_151_0(arg_829_0, slot_829_4_0))

		if slot_829_9_1 >= 1 then
			if slot_829_9_1 < (arg_829_0.m_iHealth or 0) then
				slot_0_121_2(string.format("-%d HP", slot_829_9_1), color(252, 243, 105, 255), {
					key = "bomb_damage"
				})
			else
				slot_0_121_2("FATAL", color(255, 0, 50, 255), {
					key = "bomb_damage"
				})
			end
		end
	end

	if slot_0_114_2("Bomb Information") and slot_829_4_0.m_hBombDefuser ~= nil then
		slot_829_8_0 = slot_829_4_0.m_flDefuseCountDown

		if type(slot_829_8_0) == "number" then
			slot_829_9_0 = slot_829_8_0 - slot_829_5_0

			if slot_829_9_0 > 0 then
				slot_829_10_0 = math.clamp(slot_829_9_0 / 10, 0, 1)

				if slot_829_10_0 > 0 and slot_829_10_0 < 1 then
					slot_829_11_1 = render.screen_size()
					slot_829_12_0 = slot_829_6_0 < slot_829_8_0 and color(235, 50, 75, 125) or color(50, 235, 75, 125)
					slot_829_13_0 = (slot_829_11_1.y - 2) * slot_829_10_0

					render.rect(vector(0, 0, 0), vector(20, slot_829_11_1.y, 0), color(0, 0, 0, 115))
					render.rect(vector(1, 1 + slot_829_13_0, 0), vector(19, slot_829_11_1.y - 1, 0), slot_829_12_0)
				end

				slot_829_11_0 = slot_829_6_0 < slot_829_8_0 and color(255, 0, 0, 255) or color(252, 243, 105, 255)

				slot_0_121_2(string.format("DEF - %.1fs", slot_829_9_0), slot_829_11_0, {
					key = "bomb_defuse_timer",
					icon = slot_0_88_3,
					progress = 1 - slot_829_10_0
				})
			end
		end
	end
end

function slot_0_153_0(arg_830_0)
	local var_830_0 = slot_0_103_2(slot_0_83_4) == true
	local var_830_1 = slot_0_103_2(slot_0_77_7) == true and not var_830_0
	local var_830_2 = slot_0_103_2(slot_0_78_7) == true and not var_830_0 and not var_830_1
	local var_830_3 = slot_0_103_2(slot_0_76_8) == true
	local var_830_4 = slot_0_103_2(slot_0_79_6) == "Force"
	local var_830_5 = slot_0_103_2(slot_0_80_5) == "Force"
	local var_830_6 = slot_0_103_2(slot_0_84_4) == true
	local var_830_7 = slot_0_140_0("min_damage") or slot_0_141_0(slot_0_81_4)
	local var_830_8 = slot_0_140_0("hit_chance") or slot_0_141_0(slot_0_82_4)
	local var_830_9 = slot_0_103_2(slot_0_85_4)

	if type(var_830_9) == "number" and var_830_9 > 0 and slot_0_114_2("Fake Latency") then
		local var_830_10 = slot_0_149_0(var_830_9)

		if var_830_10 ~= nil then
			slot_0_121_2("PING", var_830_10, {
				key = "fake_latency"
			})
		end
	end

	if var_830_2 and slot_0_114_2("Hide Shots") then
		slot_0_121_2("OSAA", color(255, 255, 255, 200), {
			key = "hide_shots"
		})
	end

	if var_830_1 and slot_0_114_2("Double Tap") then
		local var_830_11 = color(255, 0, 50, 255)

		if rage.exploit:get() == 1 then
			var_830_11 = color(255, 255, 255, 200)
		end

		slot_0_121_2("DT", var_830_11, {
			key = "double_tap"
		})
	end

	if var_830_3 and slot_0_114_2("Dormant Aimbot") then
		slot_0_121_2("DA", color(255, 255, 255, 200), {
			key = "dormant_aimbot"
		})
	end

	if var_830_0 and slot_0_114_2("Fake Duck") then
		slot_0_121_2("DUCK", color(255, 255, 255, 200), {
			key = "fake_duck"
		})
	end

	if var_830_5 and slot_0_114_2("Force Safe Point") then
		slot_0_121_2("SAFE", color(255, 255, 255, 200), {
			key = "force_safe_point"
		})
	end

	if var_830_4 and slot_0_114_2("Force Body Aim") then
		slot_0_121_2("BODY", color(255, 255, 255, 200), {
			key = "force_body_aim"
		})
	end

	if var_830_7 and slot_0_114_2("Minimum Damage") then
		slot_0_121_2("MD", color(255, 255, 255, 200), {
			key = "minimum_damage"
		})
	end

	if var_830_8 and slot_0_114_2("Minimum Hitchance") then
		slot_0_121_2(slot_0_101_2(), color(255, 255, 255, 200), {
			key = "minimum_hitchance"
		})
	end

	if var_830_6 and slot_0_114_2("Freestanding") then
		slot_0_121_2("FS", color(255, 255, 255, 200), {
			key = "freestanding"
		})
	end
end

function slot_0_154_0(arg_831_0, arg_831_1, arg_831_2)
	arg_831_2 = arg_831_2 or 1

	if arg_831_2 <= 0 then
		return
	end

	local var_831_0 = vector(arg_831_1.x, math.max(arg_831_0.y + 1, arg_831_1.y - slot_0_73_13), 0)
	local var_831_1 = (arg_831_0 + var_831_0) / 2
	local var_831_2 = color(0, 0, 0, 0)
	local var_831_3 = color(0, 0, 0, math.floor(slot_0_89_2.shadow_alpha * arg_831_2 + 0.5))

	render.gradient(arg_831_0, vector(var_831_1.x, var_831_0.y, 0), var_831_2, var_831_3, var_831_2, var_831_3)
	render.gradient(var_831_0, vector(var_831_1.x, arg_831_0.y, 0), var_831_2, var_831_3, var_831_2, var_831_3)
end

function slot_0_155_0(arg_832_0, arg_832_1, arg_832_2, arg_832_3, arg_832_4, arg_832_5)
	arg_832_5 = arg_832_5 or 1

	render.circle_outline(arg_832_0, color(0, 0, 0, math.floor(255 * arg_832_5 + 0.5)), arg_832_2, 0, 1, arg_832_4)
	render.circle_outline(arg_832_0, arg_832_1, arg_832_2 - 1, 0, arg_832_3, arg_832_4 - 2)
end

function slot_0_156_0(arg_833_0, arg_833_1, arg_833_2, arg_833_3, arg_833_4, arg_833_5, arg_833_6, arg_833_7, arg_833_8)
	local var_833_0 = vector(slot_0_70_15, arg_833_0, 0)
	local var_833_1 = slot_0_118_2(arg_833_1)
	local var_833_2 = slot_0_119_2(arg_833_1)
	local var_833_3 = vector(arg_833_3, arg_833_4, 0)
	local var_833_4 = slot_0_105_2((arg_833_7 or 1) * slot_0_89_2.global_alpha_scale, 0, 1)

	arg_833_8 = arg_833_8 or 1

	local var_833_5 = var_833_4 < 0.999 and slot_0_122_2(arg_833_2, var_833_4) or arg_833_2
	local var_833_6 = vector(var_833_0.x + slot_0_62_14, var_833_0.y + (var_833_3.y - var_833_2.y) * 0.5 + slot_0_71_15, 0)

	slot_0_154_0(var_833_0, var_833_0 + var_833_3, var_833_4)

	if arg_833_5 ~= nil then
		local var_833_7 = vector(math.max(1, slot_0_72_13.x * arg_833_8), math.max(1, slot_0_72_13.y * arg_833_8), 0)
		local var_833_8 = var_833_0 + vector(slot_0_62_14 + (slot_0_72_13.x - var_833_7.x) * 0.5, (var_833_3.y - slot_0_72_13.y) * 0.5 + (slot_0_72_13.y - var_833_7.y) * 0.5, 0)

		render.texture(arg_833_5, var_833_8, var_833_7, var_833_5, "f")

		var_833_6.x = var_833_6.x + slot_0_72_13.x + 5
	end

	slot_0_120_2(var_833_6, var_833_5, arg_833_1, arg_833_8)

	if arg_833_6 ~= nil then
		local var_833_9 = 10 * arg_833_8
		local var_833_10 = vector(var_833_6.x + var_833_1.x * arg_833_8 + 12 + var_833_9 * 0.5, var_833_0.y + var_833_3.y * 0.5, 0)

		slot_0_155_0(var_833_10, color(255, 255, 255, math.floor(200 * var_833_4 + 0.5)), var_833_9, arg_833_6, math.max(2, 5 * arg_833_8), var_833_4)
	end
end

function slot_0_157_0()
	if slot_0_89_2.animate_enabled then
		slot_0_124_2()

		local var_834_0 = slot_0_126_2()

		if var_834_0 <= 0 then
			slot_0_108_2()

			return
		end

		local var_834_1 = slot_0_89_2.animation_draw_list
		local var_834_2 = var_834_1[1].draw_y
		local var_834_3 = var_834_1[1].draw_y + var_834_1[1].draw_height
		local var_834_4 = var_834_1[1].draw_width
		local var_834_5 = var_834_1[1].draw_y

		for iter_834_0 = 1, var_834_0 do
			local var_834_6 = var_834_1[iter_834_0]
			local var_834_7 = var_834_6.draw_y + var_834_6.draw_height

			if var_834_3 < var_834_7 then
				var_834_3 = var_834_7
			end

			if var_834_4 < var_834_6.draw_width then
				var_834_4 = var_834_6.draw_width
			end

			if var_834_5 < var_834_6.draw_y then
				var_834_5 = var_834_6.draw_y
			end

			slot_0_156_0(var_834_6.draw_y, var_834_6.label, var_834_6.color, var_834_6.draw_width, var_834_6.draw_height, var_834_6.icon, var_834_6.progress, var_834_6.draw_alpha, var_834_6.draw_scale)
		end

		slot_0_110_2(var_834_2, var_834_3, var_834_4, var_834_5)

		return
	end

	if slot_0_99_2 <= 0 then
		slot_0_108_2()

		return
	end

	local var_834_8 = slot_0_93_2[1]
	local var_834_9 = slot_0_93_2[1] + slot_0_95_2[1]
	local var_834_10 = slot_0_94_2[1]
	local var_834_11 = slot_0_93_2[1]

	for iter_834_1 = 1, slot_0_99_2 do
		local var_834_12 = slot_0_93_2[iter_834_1] + slot_0_95_2[iter_834_1]

		if var_834_8 > slot_0_93_2[iter_834_1] then
			var_834_8 = slot_0_93_2[iter_834_1]
		end

		if var_834_9 < var_834_12 then
			var_834_9 = var_834_12
		end

		if var_834_10 < slot_0_94_2[iter_834_1] then
			var_834_10 = slot_0_94_2[iter_834_1]
		end

		slot_0_156_0(slot_0_93_2[iter_834_1], slot_0_91_2[iter_834_1], slot_0_92_2[iter_834_1], slot_0_94_2[iter_834_1], slot_0_95_2[iter_834_1], slot_0_96_2[iter_834_1], slot_0_97_2[iter_834_1], 1, 1)
	end

	slot_0_110_2(var_834_8, var_834_9, var_834_10, var_834_11)
end

function slot_0_104_2()
	if slot_0_89_2.enabled ~= true then
		if slot_0_89_2.dragging == true then
			slot_0_109_2(true)
		end

		return
	end

	if ui.get_alpha() <= 0 then
		if slot_0_89_2.dragging == true then
			slot_0_109_2(true)
		end

		slot_0_89_2.drag_hovered = false
		slot_0_89_2.drag_was_left_down = false

		return
	end

	local var_835_0 = ui.get_mouse_position()

	if var_835_0 == nil then
		return
	end

	local var_835_1 = common.is_button_down(slot_0_57_9) == true

	if slot_0_112_2(var_835_0) then
		slot_0_89_2.drag_hovered = false

		if slot_0_89_2.dragging == true and var_835_1 ~= true then
			slot_0_109_2(true)
		end

		slot_0_89_2.drag_was_left_down = var_835_1

		return
	end

	local var_835_2 = slot_0_111_2(var_835_0)

	slot_0_89_2.drag_hovered = var_835_2

	if var_835_1 and slot_0_89_2.drag_was_left_down ~= true and var_835_2 and slot_0_89_2.drag_has_bounds == true then
		slot_0_89_2.dragging = true
		slot_0_89_2.drag_offset_y = var_835_0.y - slot_0_89_2.drag_base_y
	end

	if slot_0_89_2.dragging == true then
		if var_835_1 == true then
			local var_835_3 = render.screen_size()
			local var_835_4 = var_835_0.y - slot_0_89_2.drag_offset_y
			local var_835_5 = slot_0_105_2(var_835_4, slot_0_89_2.drag_top_offset, var_835_3.y - slot_0_89_2.drag_bottom_offset)

			slot_0_106_2(var_835_3.y - var_835_5)
		else
			slot_0_109_2(true)
		end
	end

	slot_0_89_2.drag_was_left_down = var_835_1

	if slot_0_89_2.drag_hovered == true or slot_0_89_2.dragging == true then
		return false
	end
end

function slot_0_158_0()
	slot_0_89_2.frame_id = slot_0_89_2.frame_id + 1

	slot_0_90_2:set_frame_id(slot_0_89_2.frame_id)

	if not slot_0_89_2.enabled then
		slot_0_117_2()
		slot_0_108_2()
		slot_0_116_2()

		return
	end

	slot_0_139_0()
	slot_0_142_0()

	local var_836_0 = entity.get_local_player()

	if var_836_0 == nil or var_836_0:is_alive() ~= true then
		slot_0_157_0()
		slot_0_117_2()
		slot_0_116_2()

		return
	end

	slot_0_153_0(var_836_0)
	slot_0_152_0(var_836_0)
	slot_0_157_0()
	slot_0_117_2()
	slot_0_116_2()
end

slot_0_159_0 = nil

function slot_0_160_0()
	local var_837_0 = slot_0_103_2(slot_0_50_2.gamesense_side_shadow_alpha)

	if type(var_837_0) ~= "number" then
		var_837_0 = slot_0_59_11
	end

	slot_0_89_2.shadow_alpha = slot_0_105_2(math.floor(var_837_0 + 0.5), 0, 255)
end

function slot_0_161_0()
	local var_838_0 = slot_0_102_2(slot_0_50_2.gamesense_side)

	slot_0_89_2.enabled = var_838_0

	events.render(slot_0_158_0, var_838_0)
	slot_0_113_2()

	if not var_838_0 then
		if slot_0_47_0 ~= nil then
			slot_0_47_0.active = false
			slot_0_47_0.bind_active = false
			slot_0_47_0.override_active = false
			slot_0_47_0.updated_at = globals.realtime
		end

		slot_0_109_2(false)
		slot_0_115_2()
		slot_0_117_2()
		slot_0_108_2()
	end
end

if slot_0_50_2.gamesense_side_shadow_alpha ~= nil then
	slot_0_50_2.gamesense_side_shadow_alpha:set_callback(slot_0_160_0, true)
end

if slot_0_50_2.gamesense_side ~= nil then
	slot_0_50_2.gamesense_side:set_callback(slot_0_161_0, true)
end

if slot_0_50_2.gamesense_side_list ~= nil then
	slot_0_50_2.gamesense_side_list:set_callback(function()
		slot_0_117_2()
	end, true)
end

slot_0_49_0 = nil
slot_0_50_1 = {
	enabled = slot_0_23_0.min_damage_indicator_enabled,
	font = slot_0_23_0.min_damage_indicator_font,
	color = slot_0_23_0.min_damage_indicator_color,
	offset = slot_0_23_0.min_damage_indicator_offset
}
slot_0_51_2 = {
	Small = 2,
	Default = 1,
	Bold = 4
}
slot_0_52_3 = "Default"
slot_0_53_4 = color(255, 255, 255, 255)
slot_0_54_5 = color(255, 255, 255, 150)
slot_0_55_6 = "0"
slot_0_56_7 = 8
slot_0_57_8 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
slot_0_58_9 = {
	enabled = false,
	active = false,
	text = slot_0_55_6,
	font_name = slot_0_52_3,
	offset = slot_0_56_7,
	active_color = slot_0_53_4,
	inactive_color = slot_0_54_5
}

function slot_0_59_10(arg_840_0)
	if arg_840_0 == nil then
		return false
	end

	return arg_840_0:get() == true
end

function slot_0_60_11(arg_841_0)
	if arg_841_0 == nil then
		return nil
	end

	local var_841_0, var_841_1 = pcall(arg_841_0.id, arg_841_0)

	if not var_841_0 or type(var_841_1) ~= "number" then
		return nil
	end

	return var_841_1
end

function slot_0_61_12(arg_842_0, arg_842_1)
	local var_842_0, var_842_1 = pcall(function()
		return arg_842_0[arg_842_1]
	end)

	if not var_842_0 then
		return nil
	end

	if type(var_842_1) == "function" then
		local var_842_2, var_842_3 = pcall(var_842_1, arg_842_0)

		if var_842_2 then
			return var_842_3
		end
	end

	return var_842_1
end

function slot_0_62_13(arg_844_0, arg_844_1)
	for iter_844_0 = 1, #arg_844_1 do
		local var_844_0 = slot_0_61_12(arg_844_0, arg_844_1[iter_844_0])

		if var_844_0 ~= nil then
			return var_844_0
		end
	end

	return nil
end

function slot_0_63_12(arg_845_0)
	local var_845_0 = slot_0_62_13(arg_845_0, {
		"name",
		"label",
		"title"
	})

	if type(var_845_0) == "string" and var_845_0 ~= "" then
		return var_845_0
	end

	local var_845_1 = tostring(arg_845_0)

	if type(var_845_1) ~= "string" then
		return nil
	end

	local var_845_2 = var_845_1:match("^bind%((.*)%)$")

	if type(var_845_2) == "string" and var_845_2 ~= "" then
		return var_845_2
	end

	return var_845_1
end

function slot_0_64_13(arg_846_0)
	local var_846_0 = slot_0_62_13(arg_846_0, {
		"active",
		"is_active",
		"enabled",
		"state",
		"get"
	})

	if var_846_0 == true or var_846_0 == 1 then
		return true
	end

	if var_846_0 == false or var_846_0 == 0 then
		return false
	end

	local var_846_1 = slot_0_61_12(arg_846_0, "state")

	if var_846_1 == true or var_846_1 == 1 then
		return true
	end

	return false
end

function slot_0_65_14(arg_847_0)
	return slot_0_62_13(arg_847_0, {
		"reference",
		"ref",
		"item",
		"menu_item",
		"get_reference"
	})
end

function slot_0_66_14(arg_848_0)
	if type(arg_848_0) ~= "string" then
		return false
	end

	return string.find(arg_848_0, "Min. Damage", 1, true) ~= nil or string.find(arg_848_0, "Min Damage", 1, true) ~= nil or string.find(arg_848_0, "Minimum Damage", 1, true) ~= nil
end

function slot_0_67_14()
	local var_849_0, var_849_1 = pcall(ui.get_binds)

	if not var_849_0 or type(var_849_1) ~= "table" then
		return false
	end

	local var_849_2 = slot_0_60_11(slot_0_57_8)

	for iter_849_0, iter_849_1 in pairs(var_849_1) do
		if iter_849_1 ~= nil and slot_0_64_13(iter_849_1) then
			local var_849_3 = slot_0_65_14(iter_849_1)

			if var_849_3 ~= nil and var_849_2 ~= nil then
				local var_849_4 = slot_0_60_11(var_849_3)

				if var_849_4 ~= nil and var_849_4 == var_849_2 then
					return true
				end
			end

			if slot_0_66_14(slot_0_63_12(iter_849_1)) then
				return true
			end
		end
	end

	return false
end

function slot_0_68_12()
	if slot_0_57_8 == nil then
		return false
	end

	return slot_0_57_8:get_override() ~= nil
end

function slot_0_69_15()
	if slot_0_57_8 == nil then
		return 0
	end

	local var_851_0 = slot_0_57_8:get_override()

	if var_851_0 ~= nil then
		return var_851_0
	end

	return slot_0_57_8:get()
end

function slot_0_70_14()
	local var_852_0 = slot_0_69_15()

	if type(var_852_0) == "number" then
		slot_0_58_9.text = string.format("%d", math.floor(var_852_0 + 0.5))

		return
	end

	slot_0_58_9.text = tostring(var_852_0 or slot_0_55_6)
end

function slot_0_71_14(arg_853_0, arg_853_1)
	if slot_0_50_1.color == nil then
		return arg_853_1
	end

	local var_853_0, var_853_1 = pcall(slot_0_50_1.color.get, slot_0_50_1.color, arg_853_0)

	if var_853_0 and type(var_853_1) == "table" and var_853_1[1] ~= nil then
		return var_853_1[1]
	end

	return arg_853_1
end

function slot_0_72_12()
	local var_854_0 = slot_0_52_3

	if slot_0_50_1.font ~= nil then
		local var_854_1 = slot_0_50_1.font:get()

		if slot_0_51_2[var_854_1] ~= nil then
			var_854_0 = var_854_1
		end
	end

	slot_0_58_9.font_name = var_854_0
end

function slot_0_73_12()
	slot_0_58_9.active_color = slot_0_71_14("Active", slot_0_53_4)
	slot_0_58_9.inactive_color = slot_0_71_14("Inactive", slot_0_54_5)
end

function slot_0_74_11()
	local var_856_0 = slot_0_56_7

	if slot_0_50_1.offset ~= nil then
		local var_856_1 = slot_0_50_1.offset:get()

		if type(var_856_1) == "number" then
			var_856_0 = var_856_1
		end
	end

	slot_0_58_9.offset = var_856_0
end

function slot_0_75_8()
	slot_0_70_14()

	local var_857_0 = entity.get_local_player()

	if var_857_0 == nil or var_857_0:is_alive() ~= true then
		slot_0_58_9.active = false

		return
	end

	slot_0_58_9.active = slot_0_67_14() or slot_0_68_12()
end

function slot_0_76_7()
	local var_858_0 = entity.get_local_player()

	if not (ui.get_alpha() > 0) and (var_858_0 == nil or var_858_0:is_alive() ~= true) then
		return
	end

	local var_858_1 = slot_0_51_2[slot_0_58_9.font_name] or slot_0_51_2[slot_0_52_3]
	local var_858_2 = slot_0_58_9.text

	if type(var_858_2) ~= "string" or var_858_2 == "" then
		var_858_2 = slot_0_55_6
	end

	local var_858_3 = render.screen_size()
	local var_858_4 = render.measure_text(var_858_1, nil, var_858_2)
	local var_858_5 = var_858_3 * 0.5
	local var_858_6 = slot_0_58_9.offset
	local var_858_7 = slot_0_58_9.active and slot_0_58_9.active_color or slot_0_58_9.inactive_color

	var_858_5.x = var_858_5.x + var_858_6
	var_858_5.y = var_858_5.y - var_858_6 - var_858_4.y

	render.text(var_858_1, var_858_5, var_858_7, "", var_858_2)
end

slot_0_77_6 = nil

function slot_0_78_6(arg_859_0, arg_859_1, arg_859_2)
	if arg_859_0 == nil then
		return
	end

	if arg_859_2 then
		arg_859_0:set_callback(arg_859_1, true)

		return
	end

	arg_859_0:unset_callback(arg_859_1)
end

function slot_0_79_5()
	local var_860_0 = slot_0_59_10(slot_0_50_1.enabled)

	slot_0_58_9.enabled = var_860_0

	if not var_860_0 then
		slot_0_58_9.active = false
	end

	slot_0_78_6(slot_0_50_1.font, slot_0_72_12, var_860_0)
	slot_0_78_6(slot_0_50_1.color, slot_0_73_12, var_860_0)
	slot_0_78_6(slot_0_50_1.offset, slot_0_74_11, var_860_0)
	slot_0_78_6(slot_0_57_8, slot_0_70_14, var_860_0)

	if var_860_0 then
		slot_0_72_12()
		slot_0_73_12()
		slot_0_74_11()
		slot_0_70_14()
	end

	events.render(slot_0_76_7, var_860_0)
	events.createmove(slot_0_75_8, var_860_0)
end

if slot_0_50_1.enabled ~= nil then
	slot_0_50_1.enabled:set_callback(slot_0_79_5, true)
end

slot_0_50_0 = nil
slot_0_51_1 = slot_0_12_0.ui_symbols
slot_0_52_2 = color(255, 220, 120, 255)
slot_0_53_3 = color(255, 80, 80, 255)
slot_0_54_4 = 0.4
slot_0_55_5 = 0.04
slot_0_56_6 = 0.2
slot_0_57_7 = 1
slot_0_58_8 = bit.band
slot_0_59_9 = {}
slot_0_60_10 = nil
slot_0_61_11 = nil

function slot_0_62_12(arg_861_0)
	local var_861_0 = tonumber(arg_861_0.dmg_health) or 0

	if var_861_0 < 0 then
		var_861_0 = 0
	end

	local var_861_1 = 0.06 + math.min(0.4, var_861_0 * 0.0065)

	if (tonumber(arg_861_0.hitgroup) or 0) == 1 then
		var_861_1 = var_861_1 + 0.06
	end

	if var_861_1 > 0.7 then
		var_861_1 = 0.7
	end

	return var_861_1
end

function slot_0_63_11(arg_862_0)
	if arg_862_0 == nil then
		return false
	end

	local var_862_0 = arg_862_0.m_fFlags

	if type(var_862_0) ~= "number" then
		return false
	end

	return slot_0_58_8(var_862_0, slot_0_57_7) ~= 0
end

function slot_0_64_12(arg_863_0, arg_863_1)
	if arg_863_0 == nil then
		return 0
	end

	local var_863_0 = arg_863_0:get_index()

	if type(var_863_0) ~= "number" then
		return 0
	end

	local var_863_1 = slot_0_59_9[var_863_0]

	if var_863_1 == nil then
		return 0
	end

	local var_863_2 = var_863_1.value

	if type(var_863_2) ~= "number" then
		slot_0_59_9[var_863_0] = nil

		return 0
	end

	local var_863_3 = var_863_1.last_time

	if type(var_863_3) ~= "number" then
		var_863_3 = arg_863_1
	end

	if slot_0_63_11(arg_863_0) then
		local var_863_4 = arg_863_1 - var_863_3

		if var_863_4 > 0 then
			var_863_2 = var_863_2 - var_863_4 * slot_0_54_4
		end
	end

	if var_863_2 <= 0 then
		slot_0_59_9[var_863_0] = nil

		return 0
	end

	var_863_1.value = var_863_2
	var_863_1.last_time = arg_863_1

	return var_863_2
end

function slot_0_65_13(arg_864_0)
	local var_864_0 = entity.get(arg_864_0.userid, true)

	if var_864_0 == nil or var_864_0:is_enemy() ~= true or var_864_0:is_alive() ~= true then
		return
	end

	local var_864_1 = var_864_0:get_index()

	if type(var_864_1) ~= "number" then
		return
	end

	local var_864_2 = globals.curtime
	local var_864_3 = slot_0_64_12(var_864_0, var_864_2)
	local var_864_4 = slot_0_62_12(arg_864_0)

	if var_864_4 < var_864_3 then
		var_864_4 = var_864_3
	end

	slot_0_59_9[var_864_1] = {
		value = var_864_4,
		last_time = var_864_2
	}
end

function slot_0_66_13(arg_865_0)
	local var_865_0 = entity.get(arg_865_0.userid, true)

	if var_865_0 == nil then
		return
	end

	local var_865_1 = var_865_0:get_index()

	if type(var_865_1) ~= "number" then
		return
	end

	slot_0_59_9[var_865_1] = nil
end

function slot_0_67_13()
	slot_0_59_9 = {}
end

if esp ~= nil and esp.enemy ~= nil and esp.enemy.new_text ~= nil then
	slot_0_68_11 = esp.enemy:new_text("Slowed", "SLOWED", function(arg_867_0)
		if arg_867_0 == nil or arg_867_0:is_alive() ~= true then
			return nil
		end

		local var_867_0 = slot_0_64_12(arg_867_0, globals.curtime)

		if var_867_0 < slot_0_55_5 then
			return nil
		end

		local var_867_1 = slot_0_52_2

		if slot_0_60_10 ~= nil then
			local var_867_2 = slot_0_60_10:get()

			if var_867_2 ~= nil then
				var_867_1 = var_867_2
			end
		end

		local var_867_3 = slot_0_53_3

		if slot_0_61_11 ~= nil then
			local var_867_4 = slot_0_61_11:get()

			if var_867_4 ~= nil then
				var_867_3 = var_867_4
			end
		end

		local var_867_5 = var_867_0 / slot_0_56_6

		if var_867_5 < 0 then
			var_867_5 = 0
		elseif var_867_5 > 1 then
			var_867_5 = 1
		end

		local var_867_6 = var_867_3:lerp(var_867_1, var_867_5)

		return "\a" .. var_867_6:to_hex() .. "Slowed\aDEFAULT"
	end)

	if slot_0_68_11 ~= nil then
		slot_0_69_14 = slot_0_68_11:create()

		if slot_0_69_14 ~= nil then
			slot_0_60_10 = slot_0_13_0.push(slot_0_69_14:color_picker(slot_0_51_1.prefix_dot .. "   Low", slot_0_52_2), "main_visuals_esp_slowed_low_color")
			slot_0_61_11 = slot_0_13_0.push(slot_0_69_14:color_picker(slot_0_51_1.prefix_dot .. "   Full", slot_0_53_3), "main_visuals_esp_slowed_full_color")
		end
	end
end

events.player_hurt(slot_0_65_13, true)
events.player_death(slot_0_66_13, true)
events.round_start(slot_0_67_13, true)

slot_0_51_0 = nil
slot_0_52_1 = {
	enabled = slot_0_23_0.aspect_ratio_enabled,
	proportion = slot_0_23_0.aspect_ratio_proportion
}
slot_0_53_2 = cvar.r_aspectratio

function slot_0_54_3()
	if slot_0_53_2 == nil then
		return
	end

	local var_868_0 = tonumber(slot_0_53_2:string())

	if type(var_868_0) ~= "number" then
		var_868_0 = 0
	end

	slot_0_53_2:float(var_868_0, true)
end

function slot_0_55_4(arg_869_0)
	if slot_0_53_2 == nil then
		return
	end

	slot_0_53_2:float(arg_869_0, true)
end

function slot_0_56_5()
	slot_0_54_3()
end

slot_0_57_6 = nil

function slot_0_58_7(arg_871_0)
	if arg_871_0 == nil then
		return
	end

	local var_871_0, var_871_1 = pcall(arg_871_0.get, arg_871_0)

	if not var_871_0 or type(var_871_1) ~= "number" then
		return
	end

	slot_0_55_4(var_871_1 * 0.01)
end

function slot_0_59_8(arg_872_0)
	local var_872_0 = false

	if arg_872_0 ~= nil then
		local var_872_1, var_872_2 = pcall(arg_872_0.get, arg_872_0)

		var_872_0 = var_872_1 and var_872_2 == true
	end

	if slot_0_52_1.proportion ~= nil then
		if var_872_0 then
			slot_0_52_1.proportion:set_callback(slot_0_58_7, true)
		else
			slot_0_52_1.proportion:unset_callback(slot_0_58_7)
			slot_0_54_3()
		end
	elseif not var_872_0 then
		slot_0_54_3()
	end

	events.shutdown(slot_0_56_5, var_872_0)
end

if slot_0_52_1.enabled ~= nil then
	slot_0_52_1.enabled:set_callback(slot_0_59_8, true)
end

slot_0_52_0 = nil
slot_0_53_1 = {
	enabled = slot_0_23_0.viewmodel_enabled,
	fov = slot_0_23_0.viewmodel_fov,
	offset_x = slot_0_23_0.viewmodel_offset_x,
	offset_y = slot_0_23_0.viewmodel_offset_y,
	offset_z = slot_0_23_0.viewmodel_offset_z,
	options = slot_0_23_0.viewmodel_options
}
slot_0_54_2 = 0
slot_0_55_3 = cvar.cl_bobup
slot_0_56_4 = cvar.cl_bobamt_lat
slot_0_57_5 = cvar.cl_bobamt_vert
slot_0_58_6 = cvar.cl_righthand
slot_0_59_7 = cvar.viewmodel_fov
slot_0_60_9 = cvar.viewmodel_offset_x
slot_0_61_10 = cvar.viewmodel_offset_y
slot_0_62_11 = cvar.viewmodel_offset_z
slot_0_63_10 = ui.find("Visuals", "World", "Main", "Override Zoom", "Force Viewmodel")
slot_0_64_11 = 0
slot_0_65_12 = 0

function slot_0_66_12(arg_873_0, arg_873_1)
	if arg_873_0 == nil then
		return false
	end

	local var_873_0, var_873_1 = pcall(arg_873_0.get, arg_873_0, arg_873_1)

	if var_873_0 and type(var_873_1) == "boolean" then
		return var_873_1
	end

	local var_873_2, var_873_3 = pcall(arg_873_0.get, arg_873_0)

	if not var_873_2 or type(var_873_3) ~= "table" then
		return false
	end

	local var_873_4
	local var_873_5, var_873_6 = pcall(arg_873_0.list, arg_873_0)

	if var_873_5 and type(var_873_6) == "table" then
		var_873_4 = var_873_6
	end

	for iter_873_0 = 1, #var_873_3 do
		local var_873_7 = var_873_3[iter_873_0]

		if var_873_7 == arg_873_1 then
			return true
		end

		if type(var_873_7) == "number" and var_873_4 ~= nil and var_873_4[var_873_7] == arg_873_1 then
			return true
		end
	end

	return false
end

function slot_0_67_12(arg_874_0, arg_874_1)
	if arg_874_0 == nil then
		return arg_874_1
	end

	local var_874_0, var_874_1 = pcall(arg_874_0.get, arg_874_0)

	if not var_874_0 or type(var_874_1) ~= "number" then
		return arg_874_1
	end

	return var_874_1
end

function slot_0_68_10(arg_875_0, arg_875_1)
	if arg_875_0 == nil then
		return arg_875_1
	end

	local var_875_0 = tonumber(arg_875_0:string())

	if type(var_875_0) ~= "number" then
		return arg_875_1
	end

	return var_875_0
end

function slot_0_69_13(arg_876_0, arg_876_1, arg_876_2)
	return arg_876_0 + (arg_876_1 - arg_876_0) * arg_876_2
end

function slot_0_70_13(arg_877_0)
	if slot_0_58_6 == nil then
		return
	end

	if slot_0_58_6:string() == "1" then
		slot_0_58_6:int(arg_877_0 and 0 or 1, true)
	else
		slot_0_58_6:int(arg_877_0 and 1 or 0, true)
	end
end

function slot_0_71_13()
	if slot_0_63_10 ~= nil then
		slot_0_63_10:override()
	end

	if slot_0_55_3 ~= nil then
		slot_0_55_3:float(slot_0_68_10(slot_0_55_3, 0), false)
	end

	if slot_0_56_4 ~= nil then
		slot_0_56_4:float(slot_0_68_10(slot_0_56_4, 0), false)
	end

	if slot_0_57_5 ~= nil then
		slot_0_57_5:float(slot_0_68_10(slot_0_57_5, 0), false)
	end

	if slot_0_59_7 ~= nil then
		slot_0_59_7:float(slot_0_68_10(slot_0_59_7, 68), false)
	end

	if slot_0_60_9 ~= nil then
		slot_0_60_9:float(slot_0_68_10(slot_0_60_9, 0), false)
	end

	if slot_0_61_10 ~= nil then
		slot_0_61_10:float(slot_0_68_10(slot_0_61_10, 0), false)
	end

	if slot_0_62_11 ~= nil then
		slot_0_62_11:float(slot_0_68_10(slot_0_62_11, 0), false)
	end

	if slot_0_58_6 ~= nil then
		slot_0_58_6:int(slot_0_58_6:string() == "1" and 1 or 0, false)
	end

	slot_0_65_12 = 0
end

function slot_0_72_11()
	local var_879_0 = entity.get_local_player()

	if var_879_0 == nil or not var_879_0:is_alive() then
		return nil, nil, nil
	end

	if var_879_0:get_player_weapon() == nil then
		return nil, nil, nil
	end

	local var_879_1 = slot_0_67_12(slot_0_53_1.offset_x, 25) * 0.1
	local var_879_2 = slot_0_67_12(slot_0_53_1.offset_y, 25) * 0.1
	local var_879_3 = slot_0_67_12(slot_0_53_1.offset_z, 25) * 0.1
	local var_879_4 = slot_0_66_12(slot_0_53_1.options, "Scope down sight")

	if slot_0_66_12(slot_0_53_1.options, "Legacy animation") then
		local var_879_5 = var_879_0.m_vecVelocity
		local var_879_6 = 0

		if var_879_5 ~= nil then
			var_879_6 = var_879_5:length()
		end

		local var_879_7 = math.min(1, var_879_6 / 300)

		if slot_0_55_3 ~= nil then
			slot_0_55_3:int(0, true)
		end

		if slot_0_56_4 ~= nil then
			slot_0_56_4:float(0, true)
		end

		if slot_0_57_5 ~= nil then
			slot_0_57_5:float(0, true)
		end

		if slot_0_61_10 ~= nil then
			slot_0_61_10:float(var_879_2, true)
		end

		if slot_0_62_11 ~= nil then
			slot_0_62_11:float(var_879_3, true)
		end

		var_879_2 = var_879_2 + math.sin(globals.realtime * 6) * var_879_7 * 0.8
		var_879_3 = var_879_3 + math.sin(globals.realtime * 3) * var_879_7 * 0.2
	end

	if var_879_4 then
		local var_879_8 = var_879_0.m_bIsScoped == true and 1 or 0

		slot_0_65_12 = slot_0_65_12 + (var_879_8 - slot_0_65_12) * 0.05
		var_879_1 = slot_0_69_13(var_879_1, -4.75, slot_0_65_12)
		var_879_2 = slot_0_69_13(var_879_2, -5, slot_0_65_12)
		var_879_3 = slot_0_69_13(var_879_3, -2, slot_0_65_12)
	else
		slot_0_65_12 = 0
	end

	if slot_0_63_10 ~= nil then
		if var_879_4 then
			slot_0_63_10:override(true)
		else
			slot_0_63_10:override()
		end
	end

	return var_879_1, var_879_2, var_879_3
end

function slot_0_73_11()
	slot_0_71_13()
end

function slot_0_74_10()
	local var_881_0, var_881_1, var_881_2 = slot_0_72_11()

	if var_881_0 == nil or var_881_1 == nil or var_881_2 == nil then
		return
	end

	if slot_0_60_9 ~= nil then
		slot_0_60_9:float(var_881_0, true)
	end

	if slot_0_61_10 ~= nil then
		slot_0_61_10:float(var_881_1, true)
	end

	if slot_0_62_11 ~= nil then
		slot_0_62_11:float(var_881_2, true)
	end
end

function slot_0_75_7()
	local var_882_0 = entity.get_local_player()

	if var_882_0 == nil then
		return
	end

	local var_882_1 = var_882_0:get_player_weapon()

	if var_882_1 == nil then
		return
	end

	local var_882_2 = var_882_1:get_weapon_info()

	if var_882_2 == nil then
		return
	end

	local var_882_3 = var_882_1:get_weapon_index()

	if var_882_3 == nil then
		return
	end

	if slot_0_64_11 ~= var_882_3 then
		slot_0_64_11 = var_882_3

		slot_0_70_13(var_882_2.weapon_type == slot_0_54_2)
	end
end

function slot_0_76_6(arg_883_0)
	if not arg_883_0 then
		slot_0_71_13()
		events.pre_render(slot_0_75_7, false)
	end

	events.shutdown(slot_0_73_11, arg_883_0)
	events.pre_render(slot_0_74_10, arg_883_0)
end

slot_0_77_5 = nil

function slot_0_78_5(arg_884_0)
	if arg_884_0 == nil or slot_0_59_7 == nil then
		return
	end

	local var_884_0, var_884_1 = pcall(arg_884_0.get, arg_884_0)

	if not var_884_0 or type(var_884_1) ~= "number" then
		return
	end

	slot_0_59_7:float(var_884_1 * 0.1, true)
end

function slot_0_79_4(arg_885_0)
	local var_885_0 = slot_0_66_12(arg_885_0, "Opposite knife hand")

	if not var_885_0 and slot_0_58_6 ~= nil then
		local var_885_1 = slot_0_58_6:string() == "1"

		slot_0_58_6:int(var_885_1 and 1 or 0, false)
	end

	slot_0_64_11 = 0

	events.pre_render(slot_0_75_7, var_885_0)
end

function slot_0_80_4(arg_886_0)
	local var_886_0 = false

	if arg_886_0 ~= nil then
		local var_886_1, var_886_2 = pcall(arg_886_0.get, arg_886_0)

		var_886_0 = var_886_1 and var_886_2 == true
	end

	if var_886_0 then
		if slot_0_53_1.fov ~= nil then
			slot_0_53_1.fov:set_callback(slot_0_78_5, true)
		end

		if slot_0_53_1.options ~= nil then
			slot_0_53_1.options:set_callback(slot_0_79_4, true)
		end
	else
		if slot_0_53_1.fov ~= nil then
			slot_0_53_1.fov:unset_callback(slot_0_78_5)
		end

		if slot_0_53_1.options ~= nil then
			slot_0_53_1.options:unset_callback(slot_0_79_4)
		end
	end

	slot_0_76_6(var_886_0)
end

if slot_0_53_1.enabled ~= nil then
	slot_0_53_1.enabled:set_callback(slot_0_80_4, true)
end

slot_0_53_0 = nil
slot_0_54_1 = {
	enabled = slot_0_23_0.scope_overlay_enabled,
	color = slot_0_23_0.scope_overlay_color,
	position = slot_0_23_0.scope_overlay_position,
	offset = slot_0_23_0.scope_overlay_offset,
	start_fade = slot_0_23_0.scope_overlay_start_fade
}
slot_0_55_2 = 40
slot_0_56_3 = 0.000925925925925926
slot_0_57_4 = math.floor
slot_0_58_5 = math.clamp
slot_0_59_6 = 0
slot_0_60_8 = {
	a = color(255, 255, 255, 200),
	b = color(255, 255, 255, 0)
}
slot_0_61_9 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")

function slot_0_62_10(arg_887_0, arg_887_1)
	if arg_887_0 == nil then
		return arg_887_1
	end

	local var_887_0, var_887_1 = pcall(arg_887_0.get, arg_887_0)

	if var_887_0 and type(var_887_1) == "number" then
		return var_887_1
	end

	return arg_887_1
end

function slot_0_63_9(arg_888_0)
	if slot_0_61_9 == nil then
		return
	end

	if arg_888_0 == true then
		slot_0_61_9:override("Remove All")

		return
	end

	slot_0_61_9:override()
end

function slot_0_64_10(arg_889_0, arg_889_1, arg_889_2, arg_889_3, arg_889_4, arg_889_5, arg_889_6)
	if arg_889_6 then
		if arg_889_2 < arg_889_0 then
			arg_889_2, arg_889_0 = arg_889_0, arg_889_2
			arg_889_5, arg_889_4 = arg_889_4, arg_889_5
		end

		render.gradient(vector(arg_889_0, arg_889_1), vector(arg_889_2, arg_889_3), arg_889_4, arg_889_5, arg_889_4, arg_889_5)

		return
	end

	if arg_889_3 < arg_889_1 then
		arg_889_3, arg_889_1 = arg_889_1, arg_889_3
		arg_889_5, arg_889_4 = arg_889_4, arg_889_5
	end

	render.gradient(vector(arg_889_0, arg_889_1), vector(arg_889_2, arg_889_3), arg_889_4, arg_889_4, arg_889_5, arg_889_5)
end

function slot_0_65_11(arg_890_0, arg_890_1, arg_890_2, arg_890_3, arg_890_4, arg_890_5, arg_890_6, arg_890_7)
	if arg_890_6 then
		local var_890_0 = arg_890_0 + arg_890_2 * arg_890_7 * 0.5
		local var_890_1 = arg_890_0 + arg_890_2

		slot_0_64_10(arg_890_0, arg_890_1, var_890_0, arg_890_1 + arg_890_3, arg_890_5, arg_890_4, true)
		slot_0_64_10(var_890_0, arg_890_1, var_890_1, arg_890_1 + arg_890_3, arg_890_4, arg_890_5, true)

		return
	end

	local var_890_2 = arg_890_1 + arg_890_3 * arg_890_7 * 0.5
	local var_890_3 = arg_890_1 + arg_890_3

	slot_0_64_10(arg_890_0, arg_890_1, arg_890_0 + arg_890_2, var_890_2, arg_890_5, arg_890_4, false)
	slot_0_64_10(arg_890_0, var_890_2, arg_890_0 + arg_890_2, var_890_3, arg_890_4, arg_890_5, false)
end

function slot_0_66_11(arg_891_0)
	arg_891_0 = slot_0_58_5(arg_891_0, 0, 1)

	return arg_891_0 * arg_891_0 * (3 - arg_891_0 * 2)
end

function slot_0_67_11(arg_892_0, arg_892_1)
	local var_892_0 = slot_0_57_4(arg_892_0 * arg_892_1 + 0.5)

	if var_892_0 < 0 then
		return 0
	end

	return var_892_0
end

function slot_0_68_9(arg_893_0, arg_893_1, arg_893_2, arg_893_3, arg_893_4, arg_893_5, arg_893_6, arg_893_7, arg_893_8)
	local var_893_0 = arg_893_3 - arg_893_2

	if var_893_0 > 0 then
		slot_0_65_11(arg_893_0, arg_893_1 - arg_893_2 + 1, 1, -var_893_0, arg_893_6, arg_893_7, false, arg_893_8)
		slot_0_65_11(arg_893_0, arg_893_1 + arg_893_2, 1, var_893_0, arg_893_6, arg_893_7, false, arg_893_8)
	end

	local var_893_1 = arg_893_5 - arg_893_4

	if var_893_1 > 0 then
		slot_0_65_11(arg_893_0 - arg_893_4 + 1, arg_893_1, -var_893_1, 1, arg_893_6, arg_893_7, true, arg_893_8)
		slot_0_65_11(arg_893_0 + arg_893_4, arg_893_1, var_893_1, 1, arg_893_6, arg_893_7, true, arg_893_8)
	end
end

function slot_0_69_12()
	local var_894_0 = entity.get_local_player()

	if var_894_0 == nil or not var_894_0:is_alive() then
		slot_0_59_6 = 0

		return
	end

	local var_894_1 = var_894_0.m_bIsScoped == true

	slot_0_59_6 = slot_0_59_6 + ((var_894_1 and 1 or 0) - slot_0_59_6) * (1 / slot_0_55_2)
	slot_0_59_6 = slot_0_58_5(slot_0_59_6, 0, 1)

	if slot_0_59_6 <= 0.001 then
		slot_0_59_6 = 0

		return
	end

	local var_894_2 = render.screen_size()

	if var_894_2 == nil then
		return
	end

	local var_894_3 = var_894_2 * 0.5
	local var_894_4 = slot_0_57_4(var_894_3.x + 0.5)
	local var_894_5 = slot_0_57_4(var_894_3.y + 0.5)
	local var_894_6 = slot_0_62_10(slot_0_54_1.offset, 10) * var_894_2.y * slot_0_56_3
	local var_894_7 = slot_0_62_10(slot_0_54_1.position, 105) * var_894_2.y * slot_0_56_3
	local var_894_8 = slot_0_57_4(var_894_6)
	local var_894_9 = slot_0_57_4(var_894_7)

	if var_894_9 < var_894_8 + 1 then
		var_894_9 = var_894_8 + 1
	end

	if var_894_9 - var_894_8 <= 0 then
		return
	end

	local var_894_10 = slot_0_66_11(slot_0_58_5(slot_0_59_6 * 1.12, 0, 1))
	local var_894_11 = slot_0_66_11(slot_0_58_5((slot_0_59_6 - 0.14) / 0.86, 0, 1))
	local var_894_12 = var_894_10

	if var_894_12 < var_894_11 then
		var_894_12 = var_894_11
	end

	local var_894_13 = 0.1 + var_894_10 * 0.9
	local var_894_14 = var_894_13
	local var_894_15 = 0.1 + var_894_11 * 0.9
	local var_894_16 = var_894_15
	local var_894_17 = slot_0_67_11(var_894_8, var_894_13)
	local var_894_18 = slot_0_67_11(var_894_9, var_894_14)

	if var_894_18 < var_894_17 + 1 then
		var_894_18 = var_894_17 + 1
	end

	local var_894_19 = slot_0_67_11(var_894_8, var_894_15)
	local var_894_20 = slot_0_67_11(var_894_9, var_894_16)

	if var_894_20 < var_894_19 + 1 then
		var_894_20 = var_894_19 + 1
	end

	local var_894_21 = slot_0_62_10(slot_0_54_1.start_fade, 50) * 0.01 * 2
	local var_894_22 = slot_0_58_5(var_894_21, 0, 1)
	local var_894_23 = slot_0_60_8.a

	if slot_0_54_1.color ~= nil then
		local var_894_24, var_894_25 = pcall(slot_0_54_1.color.get, slot_0_54_1.color)

		if var_894_24 and var_894_25 ~= nil then
			var_894_23 = var_894_25
		end
	end

	local var_894_26 = slot_0_60_8.a
	local var_894_27 = slot_0_60_8.b
	local var_894_28 = var_894_12

	var_894_26.r = var_894_23.r
	var_894_26.g = var_894_23.g
	var_894_26.b = var_894_23.b
	var_894_26.a = var_894_23.a * var_894_28
	var_894_27.a = 0

	slot_0_68_9(var_894_4, var_894_5, var_894_17, var_894_18, var_894_19, var_894_20, var_894_26, var_894_27, var_894_22)
end

function slot_0_70_12()
	slot_0_59_6 = 0

	slot_0_63_9(false)
end

function slot_0_71_12(arg_896_0)
	local var_896_0 = false

	if arg_896_0 ~= nil then
		local var_896_1, var_896_2 = pcall(arg_896_0.get, arg_896_0)

		var_896_0 = var_896_1 and var_896_2 == true
	end

	if var_896_0 ~= true then
		slot_0_59_6 = 0
	end

	slot_0_63_9(var_896_0)
	events.render(slot_0_69_12, var_896_0)
	events.shutdown(slot_0_70_12, var_896_0)
end

if slot_0_54_1.enabled ~= nil then
	slot_0_54_1.enabled:set_callback(slot_0_71_12, true)
end

slot_0_54_0 = nil
slot_0_55_1 = {
	features = slot_0_23_0.other_features
}
slot_0_56_2 = "Sleeves"
slot_0_57_3 = "Arms"
slot_0_58_4 = "models/weapons"
slot_0_59_5 = "v_models"
slot_0_60_7 = "sleeve"
slot_0_61_8 = "glove"
slot_0_62_9 = "arms"
slot_0_63_8 = "hand"
slot_0_64_9 = false
slot_0_65_10 = {}
slot_0_66_10 = {
	remove_arms = false,
	remove_sleeves = false
}
slot_0_67_10 = false

function slot_0_68_8(arg_897_0)
	if slot_0_55_1.features == nil then
		return false
	end

	local var_897_0, var_897_1 = pcall(slot_0_55_1.features.get, slot_0_55_1.features, arg_897_0)

	if var_897_0 and type(var_897_1) == "boolean" then
		return var_897_1
	end

	local var_897_2, var_897_3 = pcall(slot_0_55_1.features.get, slot_0_55_1.features)

	if not var_897_2 or type(var_897_3) ~= "table" then
		return false
	end

	local var_897_4
	local var_897_5, var_897_6 = pcall(slot_0_55_1.features.list, slot_0_55_1.features)

	if var_897_5 and type(var_897_6) == "table" then
		var_897_4 = var_897_6
	end

	for iter_897_0 = 1, #var_897_3 do
		local var_897_7 = var_897_3[iter_897_0]

		if var_897_7 == arg_897_0 then
			return true
		end

		if type(var_897_7) == "number" and var_897_4 ~= nil and var_897_4[var_897_7] == arg_897_0 then
			return true
		end
	end

	return false
end

function slot_0_69_11()
	if slot_0_55_1.features == nil then
		return nil
	end

	local var_898_0, var_898_1 = pcall(slot_0_55_1.features.list, slot_0_55_1.features)

	if not var_898_0 or type(var_898_1) ~= "table" then
		return nil
	end

	return var_898_1
end

function slot_0_70_11(arg_899_0)
	local var_899_0 = slot_0_69_11()

	if var_899_0 == nil then
		return nil
	end

	for iter_899_0 = 1, #var_899_0 do
		if var_899_0[iter_899_0] == arg_899_0 then
			return iter_899_0
		end
	end

	return nil
end

function slot_0_71_11(arg_900_0)
	local var_900_0 = {}
	local var_900_1 = slot_0_69_11()

	if type(arg_900_0) ~= "table" then
		return var_900_0
	end

	for iter_900_0 = 1, #arg_900_0 do
		local var_900_2 = arg_900_0[iter_900_0]

		if type(var_900_2) == "number" then
			var_900_0[var_900_2] = true
		elseif type(var_900_2) == "string" and var_900_1 ~= nil then
			for iter_900_1 = 1, #var_900_1 do
				if var_900_1[iter_900_1] == var_900_2 then
					var_900_0[iter_900_1] = true

					break
				end
			end
		end
	end

	return var_900_0
end

function slot_0_72_10(arg_901_0)
	local var_901_0 = {}
	local var_901_1 = slot_0_69_11()

	if var_901_1 == nil then
		return var_901_0
	end

	for iter_901_0 = 1, #var_901_1 do
		if arg_901_0[iter_901_0] == true then
			var_901_0[#var_901_0 + 1] = var_901_1[iter_901_0]
		end
	end

	return var_901_0
end

function slot_0_73_10(arg_902_0)
	local var_902_0 = slot_0_71_11(arg_902_0)
	local var_902_1 = slot_0_70_11(slot_0_56_2)
	local var_902_2 = slot_0_70_11(slot_0_57_3)

	if var_902_1 == nil or var_902_2 == nil then
		return var_902_0
	end

	local var_902_3 = var_902_0[var_902_1] == true
	local var_902_4 = var_902_0[var_902_2] == true

	if var_902_3 and var_902_4 then
		local var_902_5 = slot_0_66_10.remove_sleeves ~= true
		local var_902_6 = slot_0_66_10.remove_arms ~= true

		if var_902_5 and not var_902_6 then
			var_902_0[var_902_2] = nil
		else
			var_902_0[var_902_1] = nil
		end
	end

	slot_0_66_10.remove_sleeves = var_902_0[var_902_1] == true
	slot_0_66_10.remove_arms = var_902_0[var_902_2] == true

	return var_902_0
end

function slot_0_74_9()
	if slot_0_55_1.features == nil or slot_0_64_9 then
		return
	end

	local var_903_0 = slot_0_73_10(slot_0_55_1.features:get())

	slot_0_64_9 = true

	slot_0_55_1.features:set(slot_0_72_10(var_903_0))

	slot_0_64_9 = false
end

function slot_0_75_6()
	if slot_0_67_10 ~= true and #slot_0_65_10 == 0 then
		return
	end

	for iter_904_0 = 1, #slot_0_65_10 do
		local var_904_0 = slot_0_65_10[iter_904_0]

		if var_904_0 ~= nil and var_904_0:is_valid() then
			var_904_0:reset()
		end
	end

	slot_0_65_10 = {}
	slot_0_67_10 = false
end

function slot_0_76_5(arg_905_0)
	if arg_905_0 == nil or not arg_905_0:is_valid() then
		return false
	end

	local var_905_0 = arg_905_0:get_name()

	if type(var_905_0) ~= "string" then
		return false
	end

	if var_905_0:find(slot_0_61_8, 1, true) ~= nil then
		return false
	end

	if var_905_0:find(slot_0_62_9, 1, true) ~= nil then
		return true
	end

	return var_905_0:find(slot_0_63_8, 1, true) ~= nil
end

function slot_0_77_4()
	slot_0_75_6()
	materials.get_materials(slot_0_58_4, true, function(arg_907_0)
		if not slot_0_76_5(arg_907_0) then
			return
		end

		arg_907_0:alpha_modulate(0)

		slot_0_65_10[#slot_0_65_10 + 1] = arg_907_0
	end)

	slot_0_67_10 = true
end

function slot_0_78_4()
	slot_0_77_4()
end

function slot_0_79_3()
	local var_909_0 = entity.get_local_player()

	if var_909_0 == nil or not var_909_0:is_alive() then
		slot_0_75_6()

		return
	end

	if common.is_in_thirdperson ~= nil and common.is_in_thirdperson() == true then
		slot_0_75_6()

		return
	end

	if slot_0_67_10 ~= true then
		slot_0_77_4()
	end
end

function slot_0_80_3(arg_910_0)
	if arg_910_0 == nil then
		return false
	end

	local var_910_0 = arg_910_0.name

	if type(var_910_0) ~= "string" then
		return false
	end

	if var_910_0:find(slot_0_59_5, 1, true) == nil then
		return false
	end

	return var_910_0:find(slot_0_60_7, 1, true) ~= nil
end

function slot_0_81_3(arg_911_0)
	local var_911_0 = entity.get_local_player()

	if var_911_0 == nil or not var_911_0:is_alive() then
		return
	end

	if slot_0_80_3(arg_911_0) then
		return false
	end
end

function slot_0_82_3()
	slot_0_75_6()
end

function slot_0_83_3(arg_913_0)
	if arg_913_0 ~= true then
		slot_0_75_6()
	end

	events.level_init(slot_0_78_4, arg_913_0)
	events.pre_render(slot_0_79_3, arg_913_0)

	if arg_913_0 == true then
		slot_0_79_3()
	end
end

function slot_0_84_3(arg_914_0)
	events.draw_model(slot_0_81_3, arg_914_0)
end

function slot_0_85_3()
	if slot_0_64_9 then
		return
	end

	slot_0_74_9()

	local var_915_0 = slot_0_68_8(slot_0_57_3)
	local var_915_1 = slot_0_68_8(slot_0_56_2)

	slot_0_83_3(var_915_0)
	slot_0_84_3(var_915_1)
	events.shutdown(slot_0_82_3, var_915_0 or var_915_1)
end

if slot_0_55_1.features ~= nil then
	slot_0_55_1.features:set_callback(slot_0_85_3, true)
end

slot_0_55_0 = nil
slot_0_56_1 = {
	t_enabled = slot_0_23_0.t_agent_enabled,
	t_family = slot_0_23_0.t_agent_family,
	t_variant = slot_0_23_0.t_agent_variant,
	ct_enabled = slot_0_23_0.ct_agent_enabled,
	ct_family = slot_0_23_0.ct_agent_family,
	ct_variant = slot_0_23_0.ct_agent_variant
}
slot_0_57_2, slot_0_58_3 = pcall(require, "ffi")
slot_0_59_4 = slot_0_57_2 and slot_0_58_3 ~= nil
slot_0_60_6 = nil
slot_0_61_7 = nil
slot_0_62_8 = nil
slot_0_63_7 = nil
slot_0_64_8 = nil

if slot_0_59_4 then
	slot_0_65_9, slot_0_66_9 = pcall(utils.get_vfunc, "engine.dll", "VEngineClientStringTable001", 3, "void*(__thiscall*)(void*, const char*)")

	if slot_0_65_9 then
		slot_0_60_6 = slot_0_66_9
	end

	slot_0_67_9, slot_0_68_7 = pcall(utils.get_vfunc, 8, "int(__thiscall*)(void*, bool, const char*, int, const void*)")

	if slot_0_67_9 then
		slot_0_61_7 = slot_0_68_7
	end

	slot_0_69_10, slot_0_70_10 = pcall(utils.get_vfunc, "engine.dll", "VModelInfoClient004", 39, "void*(__thiscall*)(void*, const char*)")

	if slot_0_69_10 then
		slot_0_62_8 = slot_0_70_10
	end

	slot_0_71_10, slot_0_72_9 = pcall(utils.get_vfunc, "engine.dll", "VModelInfoClient004", 2, "int(__thiscall*)(void*, const char*)")

	if slot_0_71_10 then
		slot_0_63_7 = slot_0_72_9
	end

	slot_0_73_9, slot_0_74_8 = pcall(utils.get_vfunc, 75, "void(__thiscall*)(void*, int)")

	if slot_0_73_9 then
		slot_0_64_8 = slot_0_74_8
	end
end

slot_0_65_8 = 1
slot_0_66_8 = false
slot_0_67_8 = {}
slot_0_68_6 = {
	t = false,
	ct = false
}
slot_0_69_9 = nil
slot_0_70_9 = nil

function slot_0_71_9(arg_916_0)
	if arg_916_0 == 2 then
		return "t"
	end

	if arg_916_0 == 3 then
		return "ct"
	end

	return nil
end

function slot_0_72_8(arg_917_0)
	if arg_917_0 == 2 then
		return slot_0_56_1.t_enabled, slot_0_56_1.t_family, slot_0_56_1.t_variant, slot_0_26_0.t_families, "t"
	end

	if arg_917_0 == 3 then
		return slot_0_56_1.ct_enabled, slot_0_56_1.ct_family, slot_0_56_1.ct_variant, slot_0_26_0.ct_families, "ct"
	end

	return nil, nil, nil, nil, nil
end

function slot_0_73_8(arg_918_0, arg_918_1)
	if arg_918_0 == nil or type(arg_918_1) ~= "table" or #arg_918_1 == 0 then
		return 1
	end

	local var_918_0 = arg_918_0:get()

	if type(var_918_0) ~= "number" then
		var_918_0 = 1
	end

	local var_918_1 = math.min(math.max(var_918_0, 1), #arg_918_1)

	if var_918_1 ~= var_918_0 then
		arg_918_0:set(var_918_1)
	end

	return var_918_1
end

function slot_0_74_7(arg_919_0, arg_919_1)
	if type(arg_919_1) ~= "table" or #arg_919_1 == 0 then
		return 1
	end

	if type(arg_919_0) == "number" and arg_919_1[arg_919_0] ~= nil then
		return arg_919_0
	end

	if type(arg_919_0) == "string" then
		for iter_919_0 = 1, #arg_919_1 do
			if arg_919_1[iter_919_0] == arg_919_0 then
				return iter_919_0
			end
		end
	end

	return nil
end

function slot_0_75_5()
	return slot_0_56_1.t_enabled ~= nil and slot_0_56_1.t_enabled:get() == true or slot_0_56_1.ct_enabled ~= nil and slot_0_56_1.ct_enabled:get() == true
end

function slot_0_76_4(arg_921_0)
	local var_921_0, var_921_1, var_921_2, var_921_3 = slot_0_72_8(arg_921_0)

	if var_921_0 == nil or var_921_1 == nil or var_921_2 == nil or var_921_3 == nil then
		return nil
	end

	if var_921_0:get() ~= true then
		return nil
	end

	local var_921_4 = var_921_3[slot_0_73_8(var_921_1, var_921_3)]

	if var_921_4 == nil or type(var_921_4.variants) ~= "table" then
		return nil
	end

	local var_921_5 = slot_0_74_7(var_921_2:get(), var_921_4.variant_names)

	if type(var_921_5) ~= "number" or var_921_4.variants[var_921_5] == nil then
		var_921_5 = 1
	end

	return var_921_4.variants[var_921_5]
end

function slot_0_77_3()
	slot_0_69_9 = nil

	events.render(slot_0_70_9, false)
end

function slot_0_78_3()
	local var_923_0 = globals.realtime

	if type(var_923_0) ~= "number" then
		var_923_0 = 0
	end

	slot_0_69_9 = var_923_0 + slot_0_65_8

	events.render(slot_0_70_9, true)
end

function slot_0_70_9()
	if type(slot_0_69_9) ~= "number" then
		events.render(slot_0_70_9, false)

		return
	end

	local var_924_0 = globals.realtime

	if type(var_924_0) ~= "number" or var_924_0 < slot_0_69_9 then
		return
	end

	slot_0_69_9 = nil

	events.render(slot_0_70_9, false)

	local var_924_1 = entity.get_local_player()

	if var_924_1 == nil then
		return
	end

	if slot_0_76_4(var_924_1.m_iTeamNum) == nil then
		return
	end

	common.force_full_update()
end

function slot_0_79_2(arg_925_0)
	if not slot_0_59_4 or slot_0_63_7 == nil then
		return nil
	end

	if type(arg_925_0) ~= "string" or arg_925_0 == "" then
		return nil
	end

	local var_925_0, var_925_1 = pcall(slot_0_63_7, arg_925_0)

	if var_925_0 and type(var_925_1) == "number" and var_925_1 ~= -1 then
		return var_925_1
	end

	if slot_0_60_6 == nil or slot_0_61_7 == nil or slot_0_62_8 == nil then
		return nil
	end

	local var_925_2, var_925_3 = pcall(slot_0_60_6, "modelprecache")

	if not var_925_2 or var_925_3 == nil then
		return nil
	end

	local var_925_4 = slot_0_58_3.cast("void***", var_925_3)

	if var_925_4 == nil then
		return nil
	end

	pcall(slot_0_62_8, arg_925_0)

	if not pcall(slot_0_61_7, var_925_4, false, arg_925_0, -1, nil) then
		return nil
	end

	local var_925_5, var_925_6 = pcall(slot_0_63_7, arg_925_0)
	local var_925_7 = var_925_6

	if not var_925_5 or type(var_925_7) ~= "number" or var_925_7 == -1 then
		return nil
	end

	return var_925_7
end

function slot_0_80_2(arg_926_0)
	slot_0_77_3()

	if arg_926_0 and slot_0_66_8 then
		common.force_full_update()
	end

	slot_0_66_8 = false
end

function slot_0_81_2()
	local var_927_0 = entity.get_local_player()

	if var_927_0 == nil then
		slot_0_66_8 = false

		return
	end

	if slot_0_71_9(var_927_0.m_iTeamNum) == nil then
		slot_0_80_2(slot_0_66_8)

		return
	end

	local var_927_1 = slot_0_76_4(var_927_0.m_iTeamNum)

	if var_927_1 == nil then
		slot_0_80_2(slot_0_66_8)

		return
	end

	local var_927_2 = slot_0_79_2(var_927_1.path)

	if type(var_927_2) ~= "number" then
		return
	end

	if var_927_0.m_nModelIndex ~= var_927_2 then
		if slot_0_64_8 ~= nil then
			if pcall(slot_0_64_8, var_927_0[0], var_927_2) ~= true then
				var_927_0.m_nModelIndex = var_927_2
			end
		else
			var_927_0.m_nModelIndex = var_927_2
		end
	end

	slot_0_66_8 = true
end

slot_0_82_2 = nil

function slot_0_83_2()
	slot_0_80_2(true)
end

function slot_0_84_2(arg_929_0)
	local var_929_0 = slot_0_75_5()

	if not var_929_0 then
		slot_0_80_2(true)
	end

	events.net_update_end(slot_0_81_2, var_929_0)
	events.shutdown(slot_0_83_2, var_929_0)

	if var_929_0 ~= true then
		return
	end

	slot_0_66_8 = false

	slot_0_82_2("t")
	slot_0_82_2("ct")

	local var_929_1 = entity.get_local_player()

	if var_929_1 == nil then
		return
	end

	if slot_0_76_4(var_929_1.m_iTeamNum) == nil then
		slot_0_80_2(true)

		return
	end

	slot_0_78_3()
end

function slot_0_85_2(arg_930_0)
	if arg_930_0 == "t" then
		return slot_0_56_1.t_family, slot_0_56_1.t_variant
	end

	if arg_930_0 == "ct" then
		return slot_0_56_1.ct_family, slot_0_56_1.ct_variant
	end

	return nil, nil
end

function slot_0_82_2(arg_931_0)
	local var_931_0, var_931_1 = slot_0_85_2(arg_931_0)

	if var_931_0 == nil or var_931_1 == nil then
		return
	end

	local var_931_2 = slot_0_26_0.get_families(arg_931_0)
	local var_931_3 = slot_0_73_8(var_931_0, var_931_2)
	local var_931_4 = slot_0_26_0.get_variant_names(arg_931_0, var_931_3)

	if type(var_931_4) ~= "table" or #var_931_4 == 0 then
		var_931_4 = {
			"A"
		}
	end

	slot_0_68_6[arg_931_0] = true

	var_931_1:update(var_931_4)

	local var_931_5 = slot_0_74_7(var_931_1:get(), var_931_4)

	if type(var_931_5) ~= "number" then
		var_931_1:set(var_931_4[1] or "A")
	end

	slot_0_68_6[arg_931_0] = false
end

function slot_0_86_2(arg_932_0)
	local var_932_0, var_932_1 = slot_0_85_2(arg_932_0)

	if var_932_0 == nil or var_932_1 == nil then
		return nil
	end

	return string.format("%s:%s", tostring(var_932_0:get()), tostring(var_932_1:get()))
end

function slot_0_87_2(arg_933_0)
	local var_933_0 = slot_0_86_2(arg_933_0)

	if var_933_0 == nil then
		return
	end

	if slot_0_67_8[arg_933_0] == nil then
		slot_0_67_8[arg_933_0] = var_933_0

		return
	end

	if slot_0_67_8[arg_933_0] == var_933_0 then
		return
	end

	slot_0_67_8[arg_933_0] = var_933_0
	slot_0_66_8 = false

	local var_933_1 = entity.get_local_player()

	if var_933_1 == nil then
		return
	end

	if slot_0_71_9(var_933_1.m_iTeamNum) ~= arg_933_0 then
		return
	end

	if slot_0_76_4(var_933_1.m_iTeamNum) == nil then
		slot_0_80_2(true)

		return
	end

	slot_0_78_3()
end

function slot_0_88_2(arg_934_0)
	local var_934_0, var_934_1 = slot_0_85_2(arg_934_0)

	if var_934_0 ~= nil then
		var_934_0:set_callback(function(arg_935_0)
			slot_0_82_2(arg_934_0)
			slot_0_87_2(arg_934_0)
		end, true)
	end

	if var_934_1 ~= nil then
		var_934_1:set_callback(function(arg_936_0)
			if slot_0_68_6[arg_934_0] == true then
				return
			end

			slot_0_87_2(arg_934_0)
		end, true)
	end
end

slot_0_88_2("t")
slot_0_88_2("ct")

if slot_0_56_1.t_enabled ~= nil then
	slot_0_56_1.t_enabled:set_callback(slot_0_84_2, true)
end

if slot_0_56_1.ct_enabled ~= nil then
	slot_0_56_1.ct_enabled:set_callback(slot_0_84_2, true)
end

slot_0_56_0 = nil
slot_0_57_1 = slot_0_20_0.game_focus_enabled
slot_0_58_2 = "reserved"
slot_0_59_3 = 1
slot_0_60_5, slot_0_61_6 = pcall(require, "ffi")
slot_0_62_7 = slot_0_60_5 and slot_0_61_6 ~= nil
slot_0_63_6 = false

if slot_0_62_7 then
	pcall(slot_0_61_6.cdef, "      void* GetForegroundWindow();\n      void* SetForegroundWindow(void* window);\n      void* SetFocus(void* window);\n      bool ShowWindow(void* window, int state);\n    ")

	slot_0_64_7 = pcall(function()
		return slot_0_61_6.C.GetForegroundWindow
	end)
	slot_0_65_7 = pcall(function()
		return slot_0_61_6.C.SetForegroundWindow
	end)
	slot_0_66_7 = pcall(function()
		return slot_0_61_6.C.SetFocus
	end)
	slot_0_67_7 = pcall(function()
		return slot_0_61_6.C.ShowWindow
	end)
	slot_0_63_6 = slot_0_64_7 and slot_0_65_7 and slot_0_66_7 and slot_0_67_7
end

slot_0_64_6 = nil

if slot_0_62_7 then
	slot_0_65_6, slot_0_66_6 = pcall(utils.get_vfunc, "engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)")

	if slot_0_65_6 then
		slot_0_64_6 = slot_0_66_6
	end
end

slot_0_65_5 = nil
slot_0_66_5 = nil
slot_0_67_6 = 0

function slot_0_68_5()
	if slot_0_64_6 == nil then
		return false
	end

	local var_941_0, var_941_1 = pcall(slot_0_64_6)

	return var_941_0 and var_941_1 == true
end

function slot_0_69_8()
	local var_942_0 = panorama.PartyListAPI

	if var_942_0 == nil then
		return nil
	end

	local var_942_1, var_942_2 = pcall(var_942_0.GetPartySessionSetting, "game/mmqueue")

	if not var_942_1 then
		return nil
	end

	if type(var_942_2) ~= "string" then
		return nil
	end

	return var_942_2
end

function slot_0_70_8()
	if not slot_0_62_7 or not slot_0_63_6 then
		return nil
	end

	if slot_0_65_5 ~= nil then
		local var_943_0, var_943_1 = pcall(function()
			return slot_0_65_5[0]
		end)

		if var_943_0 and var_943_1 ~= nil then
			return var_943_1
		end

		slot_0_65_5 = nil
	end

	local var_943_2 = utils.opcode_scan("engine.dll", "8B 0D ? ? ? ? 85 C9 74 16 8B 01 8B", 2)

	if var_943_2 == nil then
		return nil
	end

	local var_943_3, var_943_4 = pcall(function()
		local var_945_0 = slot_0_61_6.cast("void***", var_943_2)

		if var_945_0 == nil then
			return nil
		end

		local var_945_1 = var_945_0[0]

		if var_945_1 == nil then
			return nil
		end

		local var_945_2 = var_945_1[0]

		if var_945_2 == nil then
			return nil
		end

		return slot_0_61_6.cast("void**", slot_0_61_6.cast("char*", var_945_2) + 8)
	end)

	if not var_943_3 or var_943_4 == nil then
		return nil
	end

	slot_0_65_5 = var_943_4

	return slot_0_65_5[0]
end

function slot_0_71_8()
	if not slot_0_62_7 or not slot_0_63_6 then
		return false
	end

	local var_946_0 = slot_0_70_8()

	if var_946_0 == nil then
		return false
	end

	local var_946_1, var_946_2 = pcall(slot_0_61_6.C.GetForegroundWindow)

	if not var_946_1 or var_946_2 == nil then
		return false
	end

	if var_946_2 == var_946_0 then
		return false
	end

	pcall(slot_0_61_6.C.ShowWindow, var_946_0, 6)
	pcall(slot_0_61_6.C.ShowWindow, var_946_0, 9)
	pcall(slot_0_61_6.C.SetForegroundWindow, var_946_0)
	pcall(slot_0_61_6.C.SetFocus, var_946_0)

	if slot_0_68_5() and cvar.toggleconsole ~= nil then
		cvar.toggleconsole:call()
	end

	return true
end

function slot_0_72_7()
	if globals.realtime < slot_0_67_6 then
		return
	end

	slot_0_67_6 = globals.realtime + slot_0_59_3

	local var_947_0 = slot_0_69_8()

	if var_947_0 == nil then
		return
	end

	if var_947_0 ~= slot_0_66_5 then
		if var_947_0 == slot_0_58_2 then
			slot_0_71_8()
		end

		slot_0_66_5 = var_947_0
	end
end

function slot_0_73_7()
	local var_948_0 = entity.get_local_player()

	if var_948_0 == nil then
		return
	end

	local var_948_1 = entity.get_game_rules()

	if var_948_1 == nil then
		return
	end

	if var_948_1.m_bWarmupPeriod == true then
		return
	end

	local var_948_2 = var_948_0.m_iTeamNum

	if var_948_2 ~= 2 and var_948_2 ~= 3 then
		return
	end

	slot_0_71_8()
end

slot_0_74_6 = nil

function slot_0_75_4(arg_949_0)
	local var_949_0 = false

	if arg_949_0 ~= nil then
		local var_949_1, var_949_2 = pcall(arg_949_0.get, arg_949_0)

		var_949_0 = var_949_1 and var_949_2 == true
	end

	slot_0_67_6 = 0
	slot_0_66_5 = nil

	events.render(slot_0_72_7, var_949_0)
	events.round_start(slot_0_73_7, var_949_0)
end

if slot_0_57_1 ~= nil then
	slot_0_57_1:set_callback(slot_0_75_4, true)
end

slot_0_57_0 = nil
slot_0_58_1 = {
	super_toss_enabled = slot_0_27_0.super_toss_enabled,
	quick_switch_enabled = slot_0_27_0.quick_switch_enabled,
	grenade_release_enabled = slot_0_27_0.grenade_release_enabled,
	grenade_release_he_damage = slot_0_27_0.grenade_release_he_damage,
	grenade_release_molotov_range = slot_0_27_0.grenade_release_molotov_range,
	grenade_release_predict_molotov = slot_0_27_0.grenade_release_predict_molotov
}
slot_0_59_2 = {
	unlock_tick = 0
}
slot_0_60_4 = {}
slot_0_61_5 = {}
slot_0_62_6 = nil

function slot_0_63_5(arg_950_0)
	if arg_950_0 == nil then
		return false
	end

	local var_950_0, var_950_1 = pcall(arg_950_0.get, arg_950_0)

	return var_950_0 and var_950_1 == true
end

function slot_0_64_5(arg_951_0, arg_951_1)
	if arg_951_0 == nil then
		return arg_951_1
	end

	local var_951_0, var_951_1 = pcall(arg_951_0.get, arg_951_0)

	if not var_951_0 or type(var_951_1) ~= "number" then
		return arg_951_1
	end

	return var_951_1
end

function slot_0_65_4()
	if slot_0_58_1.grenade_release_predict_molotov == nil then
		return true
	end

	local var_952_0, var_952_1 = pcall(slot_0_58_1.grenade_release_predict_molotov.get, slot_0_58_1.grenade_release_predict_molotov)

	if not var_952_0 then
		return true
	end

	return var_952_1 == true
end

slot_0_66_4 = {
	enabled_item = {
		get = function()
			return slot_0_63_5(slot_0_58_1.grenade_release_enabled)
		end
	},
	he_damage_item = {
		get = function()
			return slot_0_64_5(slot_0_58_1.grenade_release_he_damage, 25)
		end
	},
	molotov_range_item = {
		get = function()
			return slot_0_64_5(slot_0_58_1.grenade_release_molotov_range, 10)
		end
	},
	pin_pulled_only_item = {
		get = function()
			return true
		end
	},
	predict_molotov_item = {
		get = function()
			return slot_0_65_4()
		end
	},
	super_toss_item = {
		get = function()
			return slot_0_63_5(slot_0_58_1.super_toss_enabled)
		end
	},
	quick_switch_item = {
		get = function()
			return slot_0_63_5(slot_0_58_1.quick_switch_enabled)
		end
	}
}
slot_0_67_5 = {}
slot_0_67_4 = {
	air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"),
	air_duck = ui.find("Miscellaneous", "Main", "Movement", "Air Duck"),
	quick_stop = ui.find("Miscellaneous", "Main", "Movement", "Quick Stop"),
	strafe_assist = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist"),
	slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk")
}
slot_0_68_4 = {}
slot_0_69_7 = false
slot_0_70_7 = false
slot_0_68_4.list = {}

function slot_0_68_4.add_line(arg_960_0, arg_960_1, arg_960_2)
	if slot_0_69_7 ~= true then
		return
	end

	slot_0_68_4.list[#slot_0_68_4.list + 1] = {
		type = "line",
		vector1 = arg_960_0:clone(),
		vector2 = arg_960_1:clone(),
		color = arg_960_2:clone(),
		add_time = globals.realtime
	}
end

function slot_0_68_4.add_radius(arg_961_0, arg_961_1, arg_961_2)
	if slot_0_69_7 ~= true then
		return
	end

	slot_0_68_4.list[#slot_0_68_4.list + 1] = {
		type = "radius",
		vector1 = arg_961_0:clone(),
		radius = arg_961_1,
		color = arg_961_2:clone(),
		add_time = globals.realtime
	}
end

function slot_0_71_7()
	if slot_0_69_7 ~= true then
		return
	end

	for iter_962_0 = #slot_0_68_4.list, 1, -1 do
		local var_962_0 = slot_0_68_4.list[iter_962_0]

		if globals.realtime - var_962_0.add_time > globals.frametime then
			table.remove(slot_0_68_4.list, iter_962_0)
		elseif var_962_0.type == "line" then
			render.line(render.world_to_screen(var_962_0.vector1), render.world_to_screen(var_962_0.vector2), var_962_0.color)
		elseif var_962_0.type == "radius" then
			render.circle_3d_outline(var_962_0.vector1, var_962_0.color, var_962_0.radius, 0, 1)
		end
	end
end

function slot_0_72_6(arg_963_0)
	local var_963_0 = arg_963_0 == true

	if slot_0_70_7 == var_963_0 then
		return
	end

	events.render(slot_0_71_7, var_963_0)

	slot_0_70_7 = var_963_0
end

function slot_0_68_4.set_enabled(arg_964_0)
	slot_0_69_7 = arg_964_0 == true

	if slot_0_69_7 ~= true then
		slot_0_68_4.list = {}
	end

	slot_0_72_6(slot_0_69_7)
end

slot_0_68_4.set_enabled(slot_0_69_7)

function slot_0_68_4.print(...)
	if slot_0_69_7 ~= true then
		return
	end

	print_dev(...)
end

slot_0_69_6 = slot_0_11_0.misc.main.other.weapon_actions
slot_0_70_6 = nil
slot_0_71_6 = false
slot_0_72_5 = false
slot_0_73_6 = nil

function slot_0_74_5()
	if slot_0_69_6 == nil then
		return nil
	end

	local var_966_0 = slot_0_69_6:list()

	if var_966_0 == nil then
		return nil
	end

	for iter_966_0 = 1, #var_966_0 do
		if var_966_0[iter_966_0] == "Quick Switch" then
			return iter_966_0
		end
	end

	return nil
end

function slot_0_75_3(arg_967_0)
	local var_967_0 = entity.get_local_player()

	if var_967_0 == nil then
		return false
	end

	local var_967_1 = entity.get(arg_967_0, true)

	if var_967_1 == nil then
		return false
	end

	return var_967_1 == var_967_0
end

function slot_0_76_3()
	utils.console_exec("slot3; slot2; slot1")
end

function slot_0_77_2(arg_969_0)
	if slot_0_69_6 == nil then
		return
	end

	if arg_969_0 ~= true then
		slot_0_69_6:override()

		return
	end

	local var_969_0 = slot_0_69_6:type()

	if var_969_0 ~= "listable" and var_969_0 ~= "selectable" then
		slot_0_69_6:override()

		return
	end

	local var_969_1 = slot_0_69_6:get()

	if type(var_969_1) ~= "table" then
		slot_0_69_6:override()

		return
	end

	if #var_969_1 == 0 then
		slot_0_69_6:override({})

		return
	end

	local var_969_2 = {}
	local var_969_3 = 0

	if type(var_969_1[1]) == "string" then
		for iter_969_0 = 1, #var_969_1 do
			local var_969_4 = var_969_1[iter_969_0]

			if var_969_4 == "Quick Switch" then
				-- block empty
			else
				var_969_3 = var_969_3 + 1
				var_969_2[var_969_3] = var_969_4
			end
		end

		slot_0_69_6:override(var_969_2)

		return
	end

	local var_969_5 = slot_0_70_6

	if var_969_5 == nil then
		var_969_5 = slot_0_74_5()
		slot_0_70_6 = var_969_5
	end

	if var_969_5 == nil then
		slot_0_69_6:override()

		return
	end

	for iter_969_1 = 1, #var_969_1 do
		local var_969_6 = var_969_1[iter_969_1]

		if var_969_6 == var_969_5 then
			-- block empty
		else
			var_969_3 = var_969_3 + 1
			var_969_2[var_969_3] = var_969_6
		end
	end

	slot_0_69_6:override(var_969_2)
end

function slot_0_73_5()
	if slot_0_66_4.quick_switch_item:get() ~= true then
		return
	end

	if slot_0_71_6 == true then
		return
	end

	slot_0_71_6 = true

	slot_0_77_2(true)

	slot_0_71_6 = false
end

function slot_0_78_2(arg_971_0)
	if slot_0_69_6 == nil then
		slot_0_72_5 = false

		return
	end

	if arg_971_0 == slot_0_72_5 then
		return
	end

	if arg_971_0 then
		slot_0_69_6:set_callback(slot_0_73_5)
	else
		slot_0_69_6:unset_callback(slot_0_73_5)
	end

	slot_0_72_5 = arg_971_0
end

function slot_0_61_5.on_grenade_thrown(arg_972_0)
	if slot_0_66_4.quick_switch_item:get() ~= true then
		return
	end

	if arg_972_0 == nil or slot_0_75_3(arg_972_0.userid) ~= true then
		return
	end

	utils.execute_after(globals.tickinterval, slot_0_76_3)
end

function slot_0_61_5.on_weapon_fire(arg_973_0)
	if slot_0_66_4.quick_switch_item:get() ~= true then
		return
	end

	if arg_973_0 == nil or slot_0_75_3(arg_973_0.userid) ~= true then
		return
	end

	local var_973_0 = arg_973_0.weapon

	if var_973_0 ~= "weapon_taser" and var_973_0 ~= "taser" then
		return
	end

	if cvar.sv_infinite_ammo ~= nil and cvar.sv_infinite_ammo:int() == 1 then
		return
	end

	slot_0_76_3()
end

function slot_0_61_5.on_shutdown()
	slot_0_77_2(false)
end

function slot_0_61_5.set_enabled(arg_975_0)
	slot_0_77_2(arg_975_0)
	slot_0_78_2(arg_975_0)
end

function slot_0_61_5.reset_state()
	slot_0_78_2(false)
	slot_0_77_2(false)
end

slot_0_60_4.is_enabled = false
slot_0_69_5 = slot_0_67_4.air_strafe
slot_0_70_5 = slot_0_67_4.strafe_assist
slot_0_71_5 = false

function slot_0_72_4()
	if slot_0_69_5 ~= nil then
		slot_0_69_5:override()
	end

	if slot_0_70_5 ~= nil then
		slot_0_70_5:override()
	end

	slot_0_71_5 = false

	slot_0_28_0.set_super_toss_active(false)
end

function slot_0_73_4()
	if slot_0_69_5 ~= nil then
		slot_0_69_5:override(false)
	end

	if slot_0_70_5 ~= nil then
		slot_0_70_5:override(false)
	end

	slot_0_71_5 = true

	slot_0_28_0.set_super_toss_active(true)
end

function slot_0_74_4(arg_979_0, arg_979_1, arg_979_2, arg_979_3)
	local var_979_0 = vector():angles(arg_979_0)
	local var_979_1 = arg_979_3 * 1.25
	local var_979_2 = math.clamp(arg_979_1 * 0.9, 15, 750) * (math.clamp(arg_979_2, 0, 1) * 0.7 + 0.3)
	local var_979_3 = var_979_1 - var_979_0 * var_979_0:dot(var_979_1)
	local var_979_4 = var_979_3:lengthsqr()

	if var_979_4 < var_979_2 * var_979_2 then
		return (var_979_0 * math.sqrt(var_979_2 * var_979_2 - var_979_4) - var_979_3):normalized():angles()
	end

	local var_979_5 = (var_979_0 * 0.001 - var_979_3):normalized()
	local var_979_6 = 1 - var_979_2 * var_979_2 / var_979_4

	return var_979_5:lerp(var_979_0, var_979_6):normalized():angles()
end

slot_0_60_4.resolve_grenade_throw = slot_0_74_4

function slot_0_62_5(arg_980_0)
	if slot_0_60_4.is_enabled ~= true then
		return
	end

	local var_980_0 = entity.get_local_player()

	if var_980_0 == nil then
		return
	end

	local var_980_1 = var_980_0:get_player_weapon()

	if var_980_1 == nil then
		return
	end

	local var_980_2 = var_980_1:get_weapon_info()

	if var_980_2 == nil then
		return
	end

	arg_980_0.angles = slot_0_74_4(arg_980_0.angles, var_980_2.throw_velocity, var_980_1.m_flThrowStrength, arg_980_0.velocity)
end

function slot_0_60_4.on_createmove(arg_981_0)
	if slot_0_71_5 == true then
		slot_0_72_4()
	end

	if slot_0_60_4.is_enabled ~= true then
		return
	end

	local var_981_0 = entity.get_local_player()

	if var_981_0 == nil then
		return
	end

	if var_981_0:is_alive() ~= true then
		return
	end

	local var_981_1 = var_981_0:get_player_weapon()

	if var_981_1 == nil then
		return
	end

	local var_981_2 = var_981_1:get_weapon_info()

	if var_981_2 == nil then
		return
	end

	if var_981_2.weapon_type ~= 9 then
		return
	end

	local var_981_3 = 0.1 * rage.exploit:get()
	local var_981_4 = var_981_1.m_fThrowTime
	local var_981_5 = var_981_4 > 0 and var_981_4 - var_981_3 <= globals.curtime

	if slot_0_59_2.unlock_tick <= globals.tickcount and arg_981_0.jitter_move ~= true then
		return
	end

	if var_981_5 ~= true then
		return
	end

	slot_0_73_4()

	local var_981_6 = var_981_0:simulate_movement()

	var_981_6:think()

	local var_981_7 = var_981_6.velocity

	if var_981_0.m_MoveType == 9 then
		arg_981_0.in_moveleft = 0
		arg_981_0.in_moveright = 0
		arg_981_0.in_forward = 0
		arg_981_0.in_back = 0
		var_981_7 = vector(0, 0, 0)
	end

	arg_981_0.view_angles = slot_0_74_4(arg_981_0.view_angles, var_981_2.throw_velocity, var_981_1.m_flThrowStrength, var_981_7)
end

function slot_0_60_4.reset_state()
	slot_0_60_4.is_enabled = false

	if slot_0_71_5 ~= true then
		slot_0_28_0.set_super_toss_active(false)

		return
	end

	slot_0_72_4()
end

slot_0_59_2.is_ui_locked = false
slot_0_59_2.locked_command = {}
slot_0_59_2.unlock_tick = 0

slot_0_28_0.set_grenade_release_active(false)

function slot_0_59_2.lock_command(arg_983_0, arg_983_1)
	slot_0_67_4.air_strafe:override(false)
	slot_0_67_4.air_duck:override(false)
	slot_0_67_4.quick_stop:override(false)
	slot_0_67_4.strafe_assist:override(false)
	slot_0_67_4.slow_walk:override(false)
	slot_0_28_0.set_grenade_release_active(true)

	slot_0_59_2.is_ui_locked = true
	arg_983_0.jitter_move = false
	arg_983_0.in_attack = false
	arg_983_0.in_attack2 = false
	arg_983_0.in_moveleft = false
	arg_983_0.in_moveright = false
	arg_983_0.in_forward = false
	arg_983_0.in_back = false

	local var_983_0 = slot_0_59_2.locked_command

	var_983_0.view_angles = arg_983_0.view_angles:clone()
	var_983_0.move_yaw = arg_983_0.move_yaw
	var_983_0.forwardmove = arg_983_0.forwardmove
	var_983_0.sidemove = arg_983_0.sidemove
	var_983_0.upmove = arg_983_0.upmove
	var_983_0.in_jump = arg_983_0.in_jump
	var_983_0.in_duck = arg_983_0.in_duck
	var_983_0.in_walk = arg_983_0.in_walk
	var_983_0.in_speed = arg_983_0.in_speed
	var_983_0.in_left = arg_983_0.in_left
	var_983_0.in_right = arg_983_0.in_right
	var_983_0.in_bullrush = arg_983_0.in_bullrush

	local var_983_1 = math.clamp(arg_983_1, 1, 2)

	slot_0_59_2.unlock_tick = globals.tickcount + var_983_1
end

function slot_0_59_2.handle_command_lock(arg_984_0)
	if slot_0_59_2.unlock_tick <= globals.tickcount then
		if slot_0_59_2.is_ui_locked == true then
			slot_0_67_4.air_strafe:override()
			slot_0_67_4.air_duck:override()
			slot_0_67_4.quick_stop:override()
			slot_0_67_4.strafe_assist:override()
			slot_0_67_4.slow_walk:override()
			slot_0_28_0.set_grenade_release_active(false)

			slot_0_59_2.is_ui_locked = false
		end

		return
	end

	slot_0_67_4.air_strafe:override(false)
	slot_0_67_4.air_duck:override(false)
	slot_0_67_4.quick_stop:override(false)
	slot_0_67_4.strafe_assist:override(false)
	slot_0_67_4.slow_walk:override(false)
	slot_0_28_0.set_grenade_release_active(true)

	local var_984_0 = slot_0_59_2.locked_command

	arg_984_0.jitter_move = false
	arg_984_0.view_angles = var_984_0.view_angles:clone()
	arg_984_0.move_yaw = var_984_0.move_yaw
	arg_984_0.forwardmove = var_984_0.forwardmove
	arg_984_0.sidemove = var_984_0.sidemove
	arg_984_0.upmove = var_984_0.upmove
	arg_984_0.in_attack = false
	arg_984_0.in_attack2 = false
	arg_984_0.in_jump = var_984_0.in_jump
	arg_984_0.in_duck = var_984_0.in_duck
	arg_984_0.in_walk = var_984_0.in_walk
	arg_984_0.in_speed = var_984_0.in_speed
	arg_984_0.in_moveleft = false
	arg_984_0.in_moveright = false
	arg_984_0.in_forward = false
	arg_984_0.in_back = false
	arg_984_0.in_left = var_984_0.in_left
	arg_984_0.in_right = var_984_0.in_right
	arg_984_0.in_bullrush = var_984_0.in_bullrush
end

slot_0_59_2.is_weapon_allowed = {
	[44] = function()
		return slot_0_66_4.he_damage_item:get() > 0
	end,
	[45] = function()
		return slot_0_66_4.predict_molotov_item:get() == true
	end,
	[46] = function()
		return slot_0_66_4.molotov_range_item:get() > 0
	end
}
slot_0_69_4 = 34095115
slot_0_70_4 = 44100
slot_0_71_4 = 1112
slot_0_72_3 = -64
slot_0_73_3 = 120
slot_0_74_3 = 22500
slot_0_75_2 = 72
slot_0_76_2 = 18
slot_0_77_1 = 5.42534722222
slot_0_78_1 = 0.90957763236
slot_0_79_1 = 1.5
slot_0_80_1 = 0.2
slot_0_81_1 = 512
slot_0_82_1 = slot_0_81_1 * slot_0_81_1
slot_0_83_1 = 166
slot_0_84_1 = (slot_0_83_1 * 4)^2
slot_0_85_1 = slot_0_83_1
slot_0_86_1 = 30
slot_0_87_1 = 80
slot_0_88_1 = slot_0_87_1 * 0.5
slot_0_89_1 = 2 * slot_0_86_1 + 4
slot_0_90_1 = slot_0_86_1 * 2
slot_0_91_1 = slot_0_90_1 * slot_0_90_1
slot_0_92_1 = 120
slot_0_93_1 = 100
slot_0_94_1 = 150
slot_0_95_1 = 128
slot_0_96_1 = 0
slot_0_97_1 = 16
slot_0_98_1 = 90
slot_0_99_1 = slot_0_98_1 * slot_0_98_1
slot_0_100_1 = -60
slot_0_101_1 = 120
slot_0_102_1 = 7

function slot_0_103_1(arg_988_0)
	return not arg_988_0:is_player()
end

slot_0_104_1 = {
	tick = -1
}

function slot_0_105_1()
	slot_0_104_1.tick = globals.tickcount
	slot_0_104_1.infernos = nil
	slot_0_104_1.smokes = nil
	slot_0_104_1.inferno_points = nil
end

function slot_0_106_1()
	if slot_0_104_1.tick == globals.tickcount then
		return
	end

	slot_0_105_1()
end

function slot_0_107_1()
	slot_0_59_2.unlock_tick = 0

	slot_0_105_1()
end

function slot_0_108_1()
	slot_0_106_1()

	if slot_0_104_1.infernos == nil then
		slot_0_104_1.infernos = entity.get_entities("CInferno")
	end

	return slot_0_104_1.infernos
end

function slot_0_109_1(arg_993_0)
	local var_993_0 = arg_993_0.m_vecOrigin

	if var_993_0 == nil then
		return {}
	end

	local var_993_1 = arg_993_0.m_fireCount
	local var_993_2 = arg_993_0.m_fireXDelta
	local var_993_3 = arg_993_0.m_fireYDelta
	local var_993_4 = arg_993_0.m_fireZDelta
	local var_993_5 = arg_993_0.m_bFireIsBurning

	if type(var_993_1) ~= "number" or var_993_1 <= 0 then
		return {
			var_993_0
		}
	end

	if (var_993_2 ~= nil and var_993_3 ~= nil and var_993_4 ~= nil) ~= true then
		return {
			var_993_0
		}
	end

	local var_993_6 = {}

	for iter_993_0 = 0, var_993_1 - 1 do
		local var_993_7 = true

		if var_993_5 ~= nil then
			local var_993_8, var_993_9 = pcall(function()
				return var_993_5[iter_993_0]
			end)

			if var_993_8 and var_993_9 == false then
				var_993_7 = false
			end
		end

		if var_993_7 == true then
			local var_993_10
			local var_993_11
			local var_993_12
			local var_993_13, var_993_14 = pcall(function()
				return var_993_2[iter_993_0]
			end)
			local var_993_15, var_993_16 = pcall(function()
				return var_993_3[iter_993_0]
			end)
			local var_993_17, var_993_18 = pcall(function()
				return var_993_4[iter_993_0]
			end)

			if var_993_13 and var_993_15 and var_993_17 then
				var_993_10 = var_993_14
				var_993_11 = var_993_16
				var_993_12 = var_993_18
			end

			if type(var_993_10) == "number" and type(var_993_11) == "number" and type(var_993_12) == "number" then
				var_993_6[#var_993_6 + 1] = var_993_0 + vector(var_993_10, var_993_11, var_993_12)
			end
		end
	end

	if #var_993_6 == 0 then
		var_993_6[1] = var_993_0
	end

	return var_993_6
end

function slot_0_110_1()
	slot_0_106_1()

	if slot_0_104_1.inferno_points ~= nil then
		return slot_0_104_1.inferno_points
	end

	local var_998_0 = slot_0_108_1()
	local var_998_1 = {}

	for iter_998_0 = 1, #var_998_0 do
		var_998_1[iter_998_0] = slot_0_109_1(var_998_0[iter_998_0])
	end

	slot_0_104_1.inferno_points = var_998_1

	return var_998_1
end

function slot_0_111_1()
	slot_0_106_1()

	if slot_0_104_1.smokes == nil then
		local var_999_0 = {}

		entity.get_entities("CSmokeGrenadeProjectile", true, function(arg_1000_0)
			local var_1000_0 = arg_1000_0.m_nSmokeEffectTickBegin

			if var_1000_0 ~= nil and var_1000_0 > 0 then
				var_999_0[#var_999_0 + 1] = arg_1000_0
			end
		end)

		slot_0_104_1.smokes = var_999_0
	end

	return slot_0_104_1.smokes
end

function slot_0_112_1()
	return math.floor(globals.client_tick + globals.clock_offset + 0.5)
end

function slot_0_113_1(arg_1002_0, arg_1002_1, arg_1002_2)
	if arg_1002_0 < arg_1002_1 then
		return math.min(arg_1002_0 + arg_1002_2, arg_1002_1)
	end

	if arg_1002_1 < arg_1002_0 then
		return math.max(arg_1002_0 - arg_1002_2, arg_1002_1)
	end

	return arg_1002_0
end

function slot_0_114_1(arg_1003_0, arg_1003_1)
	local var_1003_0 = math.clamp(arg_1003_0.m_flThrowStrength or 0, 0, 1)
	local var_1003_1 = math.max(1, arg_1003_1 or 1)
	local var_1003_2 = globals.tickinterval * 1.3 * var_1003_1

	return slot_0_113_1(var_1003_0, 0.5, var_1003_2)
end

function slot_0_115_1(arg_1004_0)
	local var_1004_0 = 1

	if arg_1004_0 ~= nil and type(arg_1004_0.choked_commands) == "number" and arg_1004_0.choked_commands > 0 then
		var_1004_0 = var_1004_0 + math.min(arg_1004_0.choked_commands, 2)
	end

	if rage ~= nil and rage.exploit ~= nil and rage.exploit:get() == 1 then
		var_1004_0 = var_1004_0 + 1
	end

	return math.clamp(var_1004_0, 1, 3)
end

function slot_0_116_1(arg_1005_0, arg_1005_1)
	local var_1005_0 = arg_1005_0.m_nSmokeEffectTickBegin

	if var_1005_0 == nil or var_1005_0 <= 0 then
		return false
	end

	if arg_1005_1 < var_1005_0 then
		return false
	end

	if arg_1005_1 - var_1005_0 >= slot_0_71_4 then
		return false
	end

	return true
end

function slot_0_117_1()
	local var_1006_0 = cvar.weapon_smokegrenade_detonate_time

	if var_1006_0 ~= nil then
		local var_1006_1 = var_1006_0:float()

		if var_1006_1 ~= nil and var_1006_1 > 0 then
			return var_1006_1
		end
	end

	return slot_0_79_1
end

function slot_0_118_1(arg_1007_0)
	local var_1007_0 = slot_0_74_3

	if arg_1007_0 > slot_0_75_2 then
		var_1007_0 = var_1007_0 - slot_0_77_1 * (arg_1007_0 - slot_0_75_2)^2
	elseif arg_1007_0 < slot_0_76_2 then
		var_1007_0 = var_1007_0 - slot_0_78_1 * (slot_0_76_2 - arg_1007_0)^2
	end

	return var_1007_0
end

function slot_0_119_1(arg_1008_0, arg_1008_1, arg_1008_2, arg_1008_3, arg_1008_4)
	if arg_1008_1 == arg_1008_2 then
		return arg_1008_3
	end

	local var_1008_0 = (arg_1008_0 - arg_1008_1) / (arg_1008_2 - arg_1008_1)
	local var_1008_1 = math.clamp(var_1008_0, 0, 1)

	return arg_1008_3 + (arg_1008_4 - arg_1008_3) * var_1008_1
end

function slot_0_120_1(arg_1009_0, arg_1009_1)
	local var_1009_0 = arg_1009_0.z - arg_1009_1.z
	local var_1009_1 = arg_1009_1:dist2dsqr(arg_1009_0)

	if var_1009_0 < -slot_0_89_1 then
		return false, var_1009_0, 0, var_1009_1
	end

	if var_1009_0 > slot_0_92_1 then
		return false, var_1009_0, 0, var_1009_1
	end

	local var_1009_2 = slot_0_94_1 * slot_0_94_1

	if var_1009_0 > slot_0_92_1 * 0.6 then
		local var_1009_3 = slot_0_119_1(var_1009_0, slot_0_92_1 * 0.6, slot_0_92_1, 0, 1)
		local var_1009_4 = var_1009_3 * var_1009_3

		var_1009_2 = slot_0_119_1(var_1009_4, 0, 1, var_1009_2, slot_0_93_1 * slot_0_93_1)
	elseif var_1009_0 < slot_0_92_1 * 0.15 then
		local var_1009_5 = slot_0_119_1(var_1009_0, slot_0_92_1 * 0.1, -slot_0_89_1, 0, 1)
		local var_1009_6 = var_1009_5 * var_1009_5

		var_1009_2 = slot_0_119_1(var_1009_6, 0, 1, var_1009_2, slot_0_95_1 * slot_0_95_1)
	end

	return var_1009_1 <= var_1009_2, var_1009_0, var_1009_2, var_1009_1
end

function slot_0_121_1(arg_1010_0, arg_1010_1, arg_1010_2)
	local var_1010_0, var_1010_1, var_1010_2, var_1010_3 = slot_0_120_1(arg_1010_0, arg_1010_1)

	if var_1010_0 ~= true then
		return false, var_1010_1, var_1010_2, var_1010_3
	end

	local var_1010_4 = slot_0_96_1

	if type(arg_1010_2) == "number" then
		var_1010_4 = arg_1010_2
	end

	if var_1010_4 <= 0 then
		return true, var_1010_1, var_1010_2, var_1010_3
	end

	local var_1010_5 = math.sqrt(var_1010_2) - var_1010_4

	if var_1010_5 <= 0 then
		return false, var_1010_1, var_1010_2, var_1010_3
	end

	return var_1010_3 <= var_1010_5 * var_1010_5, var_1010_1, var_1010_2, var_1010_3
end

function slot_0_122_1(arg_1011_0, arg_1011_1, arg_1011_2)
	if arg_1011_1 == nil then
		return false, 0, 0, 0
	end

	local var_1011_0, var_1011_1, var_1011_2, var_1011_3 = slot_0_121_1(arg_1011_1, arg_1011_0, arg_1011_2)

	if arg_1011_0:distsqr(arg_1011_1) > slot_0_84_1 then
		return false, var_1011_1, var_1011_2, var_1011_3
	end

	return var_1011_0, var_1011_1, var_1011_2, var_1011_3
end

function slot_0_123_1(arg_1012_0)
	if arg_1012_0 == nil then
		return nil
	end

	local var_1012_0 = arg_1012_0.m_flSpawnTime

	if type(var_1012_0) ~= "number" then
		return nil
	end

	local var_1012_1 = slot_0_102_1
	local var_1012_2 = cvar.inferno_flame_lifetime

	if var_1012_2 ~= nil then
		local var_1012_3 = var_1012_2:float()

		if var_1012_3 ~= nil and var_1012_3 > 0 then
			var_1012_1 = var_1012_3
		end
	end

	return var_1012_0 + var_1012_1 - globals.curtime
end

function slot_0_124_1(arg_1013_0, arg_1013_1, arg_1013_2, arg_1013_3)
	if arg_1013_0 == nil or arg_1013_1 == nil then
		return false
	end

	local var_1013_0 = arg_1013_1.m_vecOrigin

	if var_1013_0 == nil then
		return false
	end

	if arg_1013_3 ~= nil then
		local var_1013_1 = slot_0_123_1(arg_1013_1)

		if var_1013_1 ~= nil and var_1013_1 <= arg_1013_3 then
			return false
		end
	end

	if arg_1013_0:distsqr(var_1013_0) > slot_0_84_1 then
		return false
	end

	if slot_0_121_1(var_1013_0, arg_1013_0, slot_0_97_1) ~= true then
		return false
	end

	return true
end

function slot_0_125_1(arg_1014_0)
	local var_1014_0 = utils.trace_line(arg_1014_0, arg_1014_0 - vector(0, 0, slot_0_85_1), slot_0_103_1, slot_0_69_4)

	if var_1014_0.fraction >= 1 then
		return nil
	end

	if var_1014_0.fraction > 0.001 then
		return var_1014_0.end_pos
	end

	return arg_1014_0
end

function slot_0_126_1(arg_1015_0, arg_1015_1, arg_1015_2)
	local var_1015_0 = slot_0_125_1(arg_1015_0)

	if var_1015_0 == nil then
		return false, nil
	end

	for iter_1015_0 = 1, #arg_1015_1 do
		local var_1015_1 = arg_1015_1[iter_1015_0]

		if var_1015_1 == nil then
			-- block empty
		else
			local var_1015_2 = var_1015_1.m_vecOrigin

			if var_1015_2 ~= nil and arg_1015_0:distsqr(var_1015_2) > slot_0_82_1 then
				-- block empty
			else
				local var_1015_3 = arg_1015_2[iter_1015_0]

				if var_1015_3 ~= nil then
					local var_1015_4 = false

					for iter_1015_1 = 1, #var_1015_3 do
						local var_1015_5 = var_1015_3[iter_1015_1] + vector(0, 0, slot_0_88_1)

						if var_1015_0:distsqr(var_1015_5) <= slot_0_91_1 then
							local var_1015_6 = true
							local var_1015_7 = utils.trace_line(var_1015_5 + vector(0, 0, slot_0_86_1), var_1015_0, slot_0_103_1, slot_0_69_4).fraction == 1

							if var_1015_7 ~= true then
								var_1015_7 = utils.trace_line(var_1015_5, var_1015_0, slot_0_103_1, slot_0_69_4).fraction == 1
							end

							if var_1015_7 == true then
								return true, var_1015_0, var_1015_2, iter_1015_0
							end
						end
					end
				end
			end
		end
	end

	return false, var_1015_0
end

function slot_0_59_2.simulate_throw(arg_1016_0, arg_1016_1, arg_1016_2, arg_1016_3, arg_1016_4)
	slot_1016_5_0 = arg_1016_1:simulate_movement()

	if arg_1016_1.m_MoveType ~= 9 then
		slot_1016_5_0:think(arg_1016_2)
	end

	slot_1016_6_0 = slot_1016_5_0.origin
	slot_1016_7_0 = slot_1016_5_0.velocity

	if arg_1016_1.m_MoveType == 9 then
		slot_1016_6_0 = arg_1016_1.m_vecOrigin
		slot_1016_7_0 = vector(0, 0, 0)
	end

	slot_0_68_4.add_line(arg_1016_1.m_vecOrigin, slot_1016_6_0, color(255, 255, 255, 255))
	slot_0_68_4.add_radius(slot_1016_6_0, 4, color(255, 255, 255, 255))
	slot_0_68_4.add_line(slot_1016_6_0, slot_1016_6_0 + vector(0, 0, slot_1016_5_0.view_offset), color(255, 255, 255, 255))
	slot_0_68_4.add_radius(slot_1016_6_0 + vector(0, 0, slot_1016_5_0.view_offset), 4, color(255, 255, 255, 255))

	slot_1016_8_0 = slot_0_114_1(arg_1016_3, arg_1016_2)

	if slot_0_60_4.is_enabled == true then
		arg_1016_0 = slot_0_60_4.resolve_grenade_throw(arg_1016_0, arg_1016_4.throw_velocity, slot_1016_8_0, slot_1016_7_0)
	end

	slot_1016_9_0 = vector():angles(vector(arg_1016_0.x - (90 - math.abs(arg_1016_0.x)) / 9, arg_1016_0.y))
	slot_1016_10_1 = slot_1016_6_0
	slot_1016_10_1.z = slot_1016_10_1.z + slot_1016_5_0.view_offset - 12 * (1 - slot_1016_8_0)
	slot_1016_10_0 = utils.trace_hull(slot_1016_10_1, slot_1016_10_1 + slot_1016_9_0 * 22, vector(-2, -2, -2), vector(2, 2, 2), slot_0_103_1, slot_0_69_4).end_pos - slot_1016_9_0 * 6
	slot_1016_11_0 = slot_1016_9_0 * math.clamp(arg_1016_4.throw_velocity * 0.9, 15, 750) * (slot_1016_8_0 * 0.7 + 0.3) + slot_1016_7_0 * 1.25

	slot_0_68_4.add_line(slot_1016_10_0 + vector(0, 0, 2), slot_1016_10_0 - vector(0, 0, 2), color(255, 0, 0, 255))
	slot_0_68_4.add_line(slot_1016_10_0 + vector(0, 2, 0), slot_1016_10_0 - vector(0, 2, 0), color(255, 0, 0, 255))
	slot_0_68_4.add_line(slot_1016_10_0 + vector(2, 0, 0), slot_1016_10_0 - vector(2, 0, 0), color(255, 0, 0, 255))

	return slot_1016_10_0, slot_1016_11_0
end

slot_0_59_2.check_flight_duration = {
	[44] = function(arg_1017_0)
		return (arg_1017_0 - 1) * globals.tickinterval > 1.5 and arg_1017_0 % math.floor(0.2 / globals.tickinterval + 0.5) == 0
	end,
	[45] = function()
		return false
	end,
	[46] = function(arg_1019_0, arg_1019_1)
		return arg_1019_1 < (arg_1019_0 - 1) * globals.tickinterval
	end
}
slot_0_59_2.teleport_distance = {
	[45] = 0,
	[46] = 128,
	[44] = 24
}

function slot_0_59_2.simulate_projectile(arg_1020_0, arg_1020_1, arg_1020_2)
	slot_1020_3_0 = cvar.sv_gravity:float() * 0.4
	slot_1020_4_0 = cvar.molotov_throw_detonate_time:float()
	slot_1020_5_0 = math.cos(math.rad(cvar.weapon_molotov_maxdetonateslope:float()))
	slot_1020_6_0 = false

	if arg_1020_2 ~= 46 then
		slot_1020_6_0 = true
	end

	slot_1020_7_0 = false
	slot_1020_8_0 = nil
	slot_1020_9_0 = nil

	if arg_1020_2 == 45 then
		slot_1020_8_0 = slot_0_108_1()
		slot_1020_9_0 = slot_0_110_1()
	end

	slot_1020_10_0 = nil
	slot_1020_11_0 = nil
	slot_1020_12_0 = nil
	slot_1020_13_0 = nil
	slot_1020_14_0 = 0
	slot_1020_15_0 = globals.tickinterval
	slot_1020_16_0 = 256

	if arg_1020_2 == 46 then
		slot_1020_16_0 = math.min(256, math.floor(slot_1020_4_0 / slot_1020_15_0 + 1.5))
	elseif arg_1020_2 == 45 then
		slot_1020_17_2 = slot_0_117_1()
		slot_1020_10_0 = math.max(1, math.floor(slot_1020_17_2 / slot_1020_15_0 + 0.5))
		slot_1020_11_0 = math.max(1, math.floor(slot_0_80_1 / slot_1020_15_0 + 0.5))
	end

	for iter_1020_0 = 1, slot_1020_16_0 do
		slot_1020_21_1 = arg_1020_1 * slot_1020_15_0
		slot_1020_22_0 = arg_1020_1.z - slot_1020_3_0 * slot_1020_15_0
		slot_1020_21_1.z = (arg_1020_1.z + slot_1020_22_0) / 2 * slot_1020_15_0
		arg_1020_1.z = slot_1020_22_0
		slot_1020_23_0 = arg_1020_0 + slot_1020_21_1
		slot_1020_24_0 = utils.trace_hull(arg_1020_0, slot_1020_23_0, vector(-2, -2, -2), vector(2, 2, 2), slot_0_103_1, slot_0_69_4)

		if slot_1020_24_0.fraction < 1 then
			if arg_1020_2 == 45 and slot_1020_8_0 ~= nil and slot_1020_9_0 ~= nil then
				if slot_1020_13_0 == nil or iter_1020_0 - slot_1020_13_0 > 3 then
					slot_1020_13_0 = iter_1020_0
					slot_1020_25_1 = slot_1020_24_0.end_pos

					slot_0_68_4.add_radius(slot_1020_25_1, 3, color(255, 127, 0, 255))

					slot_1020_26_1, slot_1020_27_1, slot_1020_28_0, slot_1020_29_0 = slot_0_126_1(slot_1020_25_1, slot_1020_8_0, slot_1020_9_0)

					if slot_1020_27_1 ~= nil then
						slot_0_68_4.add_radius(slot_1020_27_1, 4, color(255, 200, 0, 255))
					end

					if slot_1020_26_1 == true then
						if slot_1020_27_1 ~= nil then
							arg_1020_0:init(slot_1020_27_1:unpack())
						else
							arg_1020_0:init(slot_1020_25_1:unpack())
						end

						if slot_1020_27_1 ~= nil then
							slot_1020_30_0 = false

							if slot_1020_29_0 ~= nil then
								slot_1020_31_0 = iter_1020_0 * slot_1020_15_0
								slot_1020_30_0 = slot_0_124_1(slot_1020_27_1, slot_1020_8_0[slot_1020_29_0], slot_1020_9_0[slot_1020_29_0], slot_1020_31_0)
							elseif slot_1020_28_0 ~= nil then
								slot_1020_30_0 = slot_0_122_1(slot_1020_27_1, slot_1020_28_0, slot_0_97_1)
							end

							if slot_1020_30_0 == true then
								slot_1020_7_0 = true
							end
						end

						slot_1020_14_0 = iter_1020_0

						goto label_1020_0
					end
				end
			elseif arg_1020_2 == 45 then
				slot_0_68_4.add_radius(slot_1020_24_0.end_pos, 3, color(255, 127, 0, 255))
			end

			slot_1020_25_0 = slot_1020_24_0.plane.normal

			if arg_1020_2 == 46 and slot_1020_5_0 < slot_1020_25_0.z then
				arg_1020_0:init(slot_1020_24_0.end_pos:unpack())

				return true, iter_1020_0, false
			end

			arg_1020_1 = arg_1020_1 - slot_1020_25_0 * arg_1020_1:dot(slot_1020_25_0) * 2

			if math.abs(arg_1020_1.x) < 0.1 then
				arg_1020_1.x = 0
			end

			if math.abs(arg_1020_1.y) < 0.1 then
				arg_1020_1.y = 0
			end

			if math.abs(arg_1020_1.z) < 0.1 then
				arg_1020_1.z = 0
			end

			arg_1020_1 = arg_1020_1 * 0.45
			slot_1020_26_0 = arg_1020_1:lengthsqr()

			if slot_1020_25_0.z > 0.7 and slot_1020_26_0 > 96000 then
				slot_1020_27_0 = arg_1020_1:normalized():dot(slot_1020_25_0)

				if slot_1020_27_0 > 0.5 then
					arg_1020_1 = arg_1020_1 * (1.5 - slot_1020_27_0)
				end
			end

			if slot_1020_26_0 < 400 then
				arg_1020_1 = vector(0, 0, 0)
			end

			slot_1020_23_0 = utils.trace_hull(slot_1020_24_0.end_pos, slot_1020_24_0.end_pos + arg_1020_1 * (1 - slot_1020_24_0.fraction) * slot_1020_15_0, vector(-2, -2, -2), vector(2, 2, 2), slot_0_103_1, slot_0_69_4).end_pos
		end

		slot_0_68_4.add_line(arg_1020_0, slot_1020_23_0, color(0, 255, 0, 255))
		arg_1020_0:init(slot_1020_23_0:unpack())

		if slot_1020_10_0 ~= nil and slot_1020_10_0 <= iter_1020_0 then
			if arg_1020_1:lengthsqr() <= 0.01 then
				slot_1020_12_0 = arg_1020_0:clone()
				slot_1020_14_0 = iter_1020_0

				break
			end

			if slot_1020_11_0 ~= nil and (iter_1020_0 - slot_1020_10_0) % slot_1020_11_0 == 0 then
				slot_1020_14_0 = iter_1020_0
			end
		end

		if slot_0_59_2.check_flight_duration[arg_1020_2](iter_1020_0, slot_1020_4_0) == true then
			slot_1020_14_0 = iter_1020_0

			break
		end

		if iter_1020_0 == slot_1020_16_0 then
			slot_1020_14_0 = iter_1020_0
		end
	end

	if slot_1020_12_0 ~= nil then
		arg_1020_0:init(slot_1020_12_0:unpack())
	end

	if arg_1020_2 == 45 and slot_1020_8_0 ~= nil then
		slot_1020_17_1 = slot_1020_14_0 * slot_1020_15_0

		for iter_1020_1 = 1, #slot_1020_8_0 do
			if slot_0_124_1(arg_1020_0, slot_1020_8_0[iter_1020_1], slot_1020_9_0[iter_1020_1], slot_1020_17_1) == true then
				slot_1020_7_0 = true

				break
			end
		end
	end

	::label_1020_0::

	slot_1020_17_0 = utils.trace_line(arg_1020_0, arg_1020_0 - vector(0, 0, slot_0_59_2.teleport_distance[arg_1020_2]), slot_0_103_1, slot_0_69_4)

	if slot_1020_17_0.fraction < 1 then
		slot_0_68_4.add_line(arg_1020_0, slot_1020_17_0.end_pos, color(0, 255, 0, 255))
		arg_1020_0:init(slot_1020_17_0.end_pos:unpack())

		slot_1020_6_0 = true
	end

	return slot_1020_6_0, slot_1020_14_0, slot_1020_7_0
end

slot_0_59_2.check_network_state = {
	[0] = true,
	true,
	true,
	true,
	true
}
slot_0_59_2.simulate_impact = {
	[44] = function(arg_1021_0)
		arg_1021_0.z = arg_1021_0.z + 1

		local var_1021_0 = slot_0_66_4.he_damage_item:get()
		local var_1021_1 = entity.get_player_resource()
		local var_1021_2 = entity.get_players(true, true)

		for iter_1021_0 = 1, #var_1021_2 do
			local var_1021_3 = var_1021_2[iter_1021_0]

			if var_1021_1.m_bConnected[var_1021_3:get_index()] ~= true then
				-- block empty
			elseif var_1021_3:is_alive() ~= true then
				-- block empty
			elseif slot_0_59_2.check_network_state[var_1021_3:get_network_state()] ~= true then
				-- block empty
			elseif var_1021_3:get_bbox().alpha <= 0 then
				-- block empty
			else
				local var_1021_4 = var_1021_0
				local var_1021_5 = var_1021_3.m_iHealth

				if var_1021_5 ~= nil and var_1021_5 > 0 and var_1021_5 < var_1021_4 then
					var_1021_4 = var_1021_5
				end

				local var_1021_6 = arg_1021_0:dist(var_1021_3:get_origin() + var_1021_3.m_vecViewOffset)

				if var_1021_6 > 350 then
					-- block empty
				else
					local var_1021_7 = var_1021_3:get_origin()
					local var_1021_8 = var_1021_7 + vector(0, 0, 71)
					local var_1021_9 = var_1021_7 + var_1021_3.m_vecViewOffset
					local var_1021_10 = vector():angles(vector(0, var_1021_3.m_angEyeAngles.y + 90)) * 16
					local var_1021_11 = var_1021_9 - var_1021_10
					local var_1021_12 = var_1021_9 + var_1021_10

					slot_0_68_4.add_line(var_1021_7, var_1021_8, color(127, 127, 255, 255))
					slot_0_68_4.add_line(var_1021_11, var_1021_12, color(127, 127, 255, 255))

					local var_1021_13 = {
						0.2,
						0.4,
						0.1,
						0.1,
						0.2
					}
					local var_1021_14 = {
						var_1021_8,
						var_1021_9,
						var_1021_11,
						var_1021_12,
						var_1021_7
					}
					local var_1021_15 = 0

					for iter_1021_1 = 1, #var_1021_14 do
						local var_1021_16 = var_1021_14[iter_1021_1]

						if utils.trace_line(arg_1021_0, var_1021_16, slot_0_103_1, 1174421507).fraction == 1 then
							slot_0_68_4.add_line(arg_1021_0, var_1021_16, color(255, 127, 127, 255))

							var_1021_15 = var_1021_15 + var_1021_13[iter_1021_1]
						end
					end

					if var_1021_15 > 0 then
						local var_1021_17 = math.exp(-var_1021_6 * var_1021_6 / 27222.2222222) * 99 * var_1021_15
						local var_1021_18 = var_1021_3.m_ArmorValue

						if var_1021_18 > 0 then
							local var_1021_19 = var_1021_17 * 0.6

							if var_1021_18 < (var_1021_17 - var_1021_19) * 0.5 then
								var_1021_19 = var_1021_17 - var_1021_18 * 2
							end

							var_1021_17 = var_1021_19
						end

						slot_0_68_4.print("damage: ", var_1021_17)

						if var_1021_4 <= var_1021_17 then
							return true
						end
					end
				end
			end
		end
	end,
	[45] = function()
		return false
	end,
	[46] = function(arg_1023_0, arg_1023_1)
		slot_1023_2_0 = slot_0_112_1() + arg_1023_1
		slot_1023_3_0 = slot_0_111_1()

		for iter_1023_0 = 1, #slot_1023_3_0 do
			slot_1023_8_1 = slot_1023_3_0[iter_1023_0]

			if slot_0_116_1(slot_1023_8_1, slot_1023_2_0) ~= true then
				-- block empty
			else
				slot_1023_9_0 = slot_1023_8_1.m_vecOrigin

				if arg_1023_0:distsqr(slot_1023_9_0) > slot_0_70_4 then
					-- block empty
				else
					slot_1023_10_1 = arg_1023_0.z - slot_1023_9_0.z

					if slot_1023_10_1 > slot_0_72_3 and slot_1023_10_1 < slot_0_73_3 then
						slot_1023_11_1 = slot_0_118_1(slot_1023_10_1)

						if slot_1023_11_1 >= arg_1023_0:dist2dsqr(slot_1023_9_0) then
							slot_0_68_4.add_radius(slot_1023_9_0 + vector(0, 0, slot_1023_10_1), math.sqrt(slot_1023_11_1), color(127, 127, 255, 255))

							return
						end
					end
				end
			end
		end

		slot_0_68_4.add_radius(arg_1023_0, 60, color(255, 127, 127, 255))

		slot_1023_4_0 = (slot_0_66_4.molotov_range_item:get() / 10 * 50.85)^2
		slot_1023_5_0 = entity.get_player_resource()
		slot_1023_6_0 = {}

		entity.get_players(true, true, function(arg_1024_0)
			if slot_1023_5_0.m_bConnected[arg_1024_0:get_index()] == true and arg_1024_0:is_alive() == true and slot_0_59_2.check_network_state[arg_1024_0:get_network_state()] == true and arg_1024_0:get_bbox().alpha > 0 and arg_1023_0:distsqr(arg_1024_0:get_origin()) <= 14400 then
				slot_1023_6_0[#slot_1023_6_0 + 1] = arg_1024_0
			end
		end)

		for iter_1023_1 = 1, #slot_1023_6_0 do
			slot_1023_11_0 = slot_1023_6_0[iter_1023_1]:get_origin()
			slot_1023_12_2 = arg_1023_0:dist2dsqr(slot_1023_11_0)

			if slot_1023_12_2 <= slot_0_99_1 and slot_1023_11_0.z - arg_1023_0.z <= slot_0_101_1 and slot_1023_11_0.z - arg_1023_0.z >= slot_0_100_1 then
				slot_0_68_4.print("distance: ", string.format("%.2f", math.sqrt(slot_1023_12_2) / 50.85))

				if slot_1023_12_2 <= slot_1023_4_0 then
					return true
				end
			end
		end

		slot_1023_7_0 = {}
		slot_1023_8_0 = utils.random_float(0, 0.785)

		for iter_1023_2 = slot_1023_8_0, 5.495 + slot_1023_8_0, 0.785 do
			slot_1023_13_1 = arg_1023_0 + vector(math.cos(iter_1023_2), math.sin(iter_1023_2), 0) * 60
			slot_1023_13_1.z = utils.trace_line(slot_1023_13_1 + vector(0, 0, 50), slot_1023_13_1 - vector(0, 0, 200), slot_0_103_1, 16387).end_pos.z
			slot_1023_14_0 = false

			for iter_1023_3 = 1, #slot_1023_3_0 do
				slot_1023_19_0 = slot_1023_3_0[iter_1023_3]

				if slot_0_116_1(slot_1023_19_0, slot_1023_2_0) ~= true then
					-- block empty
				else
					slot_1023_20_0 = slot_1023_19_0.m_vecOrigin
					slot_1023_21_0 = slot_1023_13_1.z - slot_1023_20_0.z

					if slot_1023_21_0 > slot_0_72_3 and slot_1023_21_0 < slot_0_73_3 then
						slot_1023_22_0 = slot_0_118_1(slot_1023_21_0)

						if slot_1023_22_0 >= slot_1023_13_1:dist2dsqr(slot_1023_20_0) then
							slot_0_68_4.add_radius(slot_1023_20_0 + vector(0, 0, slot_1023_21_0), math.sqrt(slot_1023_22_0), color(127, 127, 255, 255))

							slot_1023_14_0 = true

							break
						end
					end
				end
			end

			if slot_1023_14_0 ~= true and utils.trace_line(arg_1023_0 + vector(0, 0, 30), slot_1023_13_1 + vector(0, 0, 30), slot_0_103_1, 33570819).fraction == 1 then
				slot_0_68_4.add_radius(slot_1023_13_1, 60, color(255, 127, 127, 255))

				slot_1023_7_0[#slot_1023_7_0 + 1] = slot_1023_13_1
			end
		end

		for iter_1023_4 = 1, #slot_1023_6_0 do
			slot_1023_13_0 = slot_1023_6_0[iter_1023_4]:get_origin()

			for iter_1023_5 = 1, #slot_1023_7_0 do
				slot_1023_18_0 = slot_1023_7_0[iter_1023_5]

				if slot_1023_18_0:dist2dsqr(slot_1023_13_0) <= slot_0_99_1 and slot_1023_13_0.z - slot_1023_18_0.z <= slot_0_101_1 and slot_1023_13_0.z - slot_1023_18_0.z >= slot_0_100_1 then
					slot_0_68_4.print("distance: ", string.format("%.2f", arg_1023_0:dist2d(slot_1023_13_0) / 50.85))

					if slot_1023_4_0 >= arg_1023_0:dist2dsqr(slot_1023_13_0) then
						return true
					end
				end
			end
		end
	end
}

function slot_0_59_2.on_createmove(arg_1025_0)
	slot_0_59_2.handle_command_lock(arg_1025_0)

	if slot_0_66_4.enabled_item:get() ~= true then
		slot_0_28_0.set_grenade_release_active(false)

		return
	end

	if arg_1025_0.jitter_move ~= true then
		return
	end

	local var_1025_0 = entity.get_local_player()

	if var_1025_0 == nil then
		return
	end

	if var_1025_0:is_alive() ~= true then
		return
	end

	local var_1025_1 = var_1025_0:get_player_weapon()

	if var_1025_1 == nil then
		return
	end

	if var_1025_1.m_bPinPulled ~= true then
		return
	end

	if arg_1025_0.in_attack ~= true and arg_1025_0.in_attack2 ~= true then
		return
	end

	local var_1025_2 = var_1025_1.m_iItemDefinitionIndex

	if var_1025_2 == 48 then
		var_1025_2 = 46
	end

	if slot_0_59_2.is_weapon_allowed[var_1025_2] == nil then
		return
	end

	if slot_0_59_2.is_weapon_allowed[var_1025_2]() ~= true then
		return
	end

	local var_1025_3 = var_1025_1:get_weapon_info()

	if var_1025_3 == nil then
		return
	end

	if var_1025_3.weapon_type ~= 9 then
		return
	end

	local var_1025_4 = slot_0_115_1(arg_1025_0)

	arg_1025_0.jitter_move = false

	slot_0_67_4.air_strafe:override(false)
	slot_0_67_4.air_duck:override(false)
	slot_0_67_4.quick_stop:override(false)
	slot_0_67_4.strafe_assist:override(false)
	slot_0_67_4.slow_walk:override(false)
	slot_0_28_0.set_grenade_release_active(true)

	local var_1025_5, var_1025_6 = slot_0_59_2.simulate_throw(arg_1025_0.view_angles, var_1025_0, var_1025_4, var_1025_1, var_1025_3)

	arg_1025_0.jitter_move = true

	slot_0_67_4.air_strafe:override()
	slot_0_67_4.air_duck:override()
	slot_0_67_4.quick_stop:override()
	slot_0_67_4.strafe_assist:override()
	slot_0_67_4.slow_walk:override()
	slot_0_28_0.set_grenade_release_active(false)

	local var_1025_7, var_1025_8, var_1025_9 = slot_0_59_2.simulate_projectile(var_1025_5, var_1025_6, var_1025_2)

	if var_1025_7 == false and var_1025_9 == false then
		return
	end

	if var_1025_2 ~= 45 then
		slot_0_68_4.add_radius(var_1025_5, 4, color(255, 0, 0, 255))
		slot_0_68_4.add_radius(var_1025_5, 5, color(255, 0, 0, 255))
		slot_0_68_4.add_radius(var_1025_5, 6, color(255, 0, 0, 255))
	end

	if slot_0_59_2.simulate_impact[var_1025_2](var_1025_5, var_1025_4 + var_1025_8) ~= true and var_1025_9 ~= true then
		return
	end

	slot_0_59_2.lock_command(arg_1025_0, var_1025_4)
end

function slot_0_127_1()
	slot_0_67_4.air_strafe:override()
	slot_0_67_4.air_duck:override()
	slot_0_67_4.quick_stop:override()
	slot_0_67_4.strafe_assist:override()
	slot_0_67_4.slow_walk:override()
	slot_0_28_0.set_grenade_release_active(false)

	slot_0_59_2.is_ui_locked = false
	slot_0_59_2.unlock_tick = 0

	slot_0_105_1()
end

slot_0_128_1 = nil

function slot_0_129_0()
	local var_1027_0 = slot_0_66_4.super_toss_item:get()
	local var_1027_1 = slot_0_66_4.quick_switch_item:get()
	local var_1027_2 = slot_0_66_4.enabled_item:get()

	slot_0_60_4.is_enabled = var_1027_0

	events.grenade_thrown(slot_0_61_5.on_grenade_thrown, var_1027_1)
	events.weapon_fire(slot_0_61_5.on_weapon_fire, var_1027_1)
	events.shutdown(slot_0_61_5.on_shutdown, var_1027_1)
	events.createmove(slot_0_59_2.on_createmove, false)
	events.createmove(slot_0_60_4.on_createmove, false)

	if var_1027_2 == true then
		events.createmove(slot_0_59_2.on_createmove, true)
	end

	if var_1027_0 == true then
		events.createmove(slot_0_60_4.on_createmove, true)
	end

	events.level_init(slot_0_107_1, var_1027_2)
	events.grenade_override_view(slot_0_62_5, false)

	if var_1027_0 == true then
		events.grenade_override_view(slot_0_62_5, true)
	end

	slot_0_61_5.set_enabled(var_1027_1)

	if var_1027_2 ~= true then
		slot_0_127_1()
	end

	if var_1027_0 ~= true then
		slot_0_60_4.reset_state()
	end

	if var_1027_1 ~= true then
		slot_0_61_5.reset_state()
	end
end

if slot_0_58_1.super_toss_enabled ~= nil then
	slot_0_58_1.super_toss_enabled:set_callback(slot_0_129_0, true)
end

if slot_0_58_1.quick_switch_enabled ~= nil then
	slot_0_58_1.quick_switch_enabled:set_callback(slot_0_129_0, true)
end

if slot_0_58_1.grenade_release_enabled ~= nil then
	slot_0_58_1.grenade_release_enabled:set_callback(slot_0_129_0, true)
end

slot_0_58_0 = nil
slot_0_59_1 = {
	enabled = slot_0_22_0.enabled,
	select = slot_0_22_0.select
}
slot_0_60_3 = {}

function slot_0_61_4(arg_1028_0, arg_1028_1)
	return {
		convar = arg_1028_0,
		new_value = arg_1028_1
	}
end

slot_0_60_3.Fog = {
	slot_0_61_4(cvar.fog_enable, 0),
	slot_0_61_4(cvar.fog_enable_water_fog, 0)
}
slot_0_60_3.Blood = {
	slot_0_61_4(cvar.violence_hblood, 0)
}
slot_0_60_3.Bloom = {
	slot_0_61_4(cvar.mat_disable_bloom, 1)
}
slot_0_60_3.Decals = {
	slot_0_61_4(cvar.r_drawdecals, 0)
}
slot_0_60_3.Shadows = {
	slot_0_61_4(cvar.r_shadows, 0),
	slot_0_61_4(cvar.cl_csm_static_prop_shadows, 0),
	slot_0_61_4(cvar.cl_csm_shadows, 0),
	slot_0_61_4(cvar.cl_csm_world_shadows, 0),
	slot_0_61_4(cvar.cl_foot_contact_shadows, 0),
	slot_0_61_4(cvar.cl_csm_viewmodel_shadows, 0),
	slot_0_61_4(cvar.cl_csm_rope_shadows, 0),
	slot_0_61_4(cvar.cl_csm_sprite_shadows, 0),
	slot_0_61_4(cvar.cl_csm_translucent_shadows, 0),
	slot_0_61_4(cvar.cl_csm_entity_shadows, 0),
	slot_0_61_4(cvar.cl_csm_world_shadows_in_viewmodelcascad, 0)
}
slot_0_60_3.Sprites = {
	slot_0_61_4(cvar.r_drawsprites, 0)
}
slot_0_60_3.Particles = {
	slot_0_61_4(cvar.r_drawparticles, 0)
}
slot_0_60_3.Ropes = {
	slot_0_61_4(cvar.r_drawropes, 0)
}
slot_0_60_3["Dynamic lights"] = {
	slot_0_61_4(cvar.mat_disable_fancy_blending, 1)
}
slot_0_60_3["Map details"] = {
	slot_0_61_4(cvar.func_break_max_pieces, 0),
	slot_0_61_4(cvar.props_break_max_pieces, 0)
}
slot_0_60_3["Weapon effects"] = {
	slot_0_61_4(cvar.muzzleflash_light, 0),
	slot_0_61_4(cvar.r_drawtracers_firstperson, 0)
}
slot_0_62_4 = {}

function slot_0_63_4()
	for iter_1029_0 in pairs(slot_0_62_4) do
		slot_0_62_4[iter_1029_0] = nil
	end
end

function slot_0_64_4()
	if slot_0_59_1.enabled == nil then
		return false
	end

	local var_1030_0, var_1030_1 = pcall(slot_0_59_1.enabled.get, slot_0_59_1.enabled)

	if not var_1030_0 or var_1030_1 ~= true then
		return false
	end

	return true
end

function slot_0_65_3()
	for iter_1031_0, iter_1031_1 in pairs(slot_0_60_3) do
		for iter_1031_2 = 1, #iter_1031_1 do
			local var_1031_0 = iter_1031_1[iter_1031_2]
			local var_1031_1 = var_1031_0.convar
			local var_1031_2 = var_1031_0.old_value

			if var_1031_1 ~= nil and var_1031_2 ~= nil then
				var_1031_1:int(var_1031_2)
			end

			var_1031_0.old_value = nil
		end
	end
end

function slot_0_66_3()
	if slot_0_59_1.select == nil then
		return
	end

	local var_1032_0, var_1032_1 = pcall(slot_0_59_1.select.get, slot_0_59_1.select)

	if not var_1032_0 or type(var_1032_1) ~= "table" then
		var_1032_1 = {}
	end

	local var_1032_2
	local var_1032_3, var_1032_4 = pcall(slot_0_59_1.select.list, slot_0_59_1.select)

	if var_1032_3 and type(var_1032_4) == "table" then
		var_1032_2 = var_1032_4
	end

	slot_0_63_4()

	for iter_1032_0 = 1, #var_1032_1 do
		local var_1032_5 = var_1032_1[iter_1032_0]

		if type(var_1032_5) == "string" then
			slot_0_62_4[var_1032_5] = true
		elseif type(var_1032_5) == "number" and var_1032_2 ~= nil then
			local var_1032_6 = var_1032_2[var_1032_5]

			if type(var_1032_6) == "string" then
				slot_0_62_4[var_1032_6] = true
			end
		end
	end

	for iter_1032_1, iter_1032_2 in pairs(slot_0_60_3) do
		local var_1032_7 = slot_0_62_4[iter_1032_1] == true

		for iter_1032_3 = 1, #iter_1032_2 do
			local var_1032_8 = iter_1032_2[iter_1032_3]
			local var_1032_9 = var_1032_8.convar

			if var_1032_9 == nil then
				-- block empty
			elseif var_1032_7 then
				if var_1032_8.old_value == nil then
					var_1032_8.old_value = var_1032_9:int()
				end

				var_1032_9:int(var_1032_8.new_value)
			elseif var_1032_8.old_value ~= nil then
				var_1032_9:int(var_1032_8.old_value)

				var_1032_8.old_value = nil
			end
		end
	end
end

function slot_0_67_3()
	if not slot_0_64_4() then
		slot_0_65_3()

		return
	end

	slot_0_66_3()
end

function slot_0_68_3()
	slot_0_65_3()
end

slot_0_69_3 = nil

function slot_0_70_3()
	slot_0_67_3()
end

function slot_0_71_3(arg_1036_0)
	local var_1036_0 = false

	if arg_1036_0 ~= nil then
		local var_1036_1, var_1036_2 = pcall(arg_1036_0.get, arg_1036_0)

		var_1036_0 = var_1036_1 and var_1036_2 == true
	end

	if slot_0_59_1.select ~= nil then
		if var_1036_0 then
			slot_0_59_1.select:set_callback(slot_0_70_3, true)
		else
			slot_0_59_1.select:unset_callback(slot_0_70_3)
		end
	end

	if not var_1036_0 then
		slot_0_65_3()
	end

	events.shutdown(slot_0_68_3, var_1036_0)
end

if slot_0_59_1.enabled ~= nil then
	slot_0_59_1.enabled:set_callback(slot_0_71_3, true)
end

slot_0_59_0 = nil
slot_0_60_2 = slot_0_20_0.trash_talk_enabled
slot_0_61_3 = 10
slot_0_62_3 = 0.35
slot_0_63_3 = {
	"e1",
	"у1"
}
slot_0_64_3 = nil
slot_0_65_2 = 0
slot_0_66_2 = {}

function slot_0_67_2()
	slot_0_64_3 = nil
	slot_0_65_2 = 0

	for iter_1037_0 = 1, #slot_0_66_2 do
		slot_0_66_2[iter_1037_0] = nil
	end
end

function slot_0_68_2()
	if utils.random_int(1, 100) <= slot_0_61_3 then
		local var_1038_0 = utils.random_int(1, #slot_0_63_3)

		return slot_0_63_3[var_1038_0]
	end

	return "1"
end

function slot_0_69_2()
	slot_0_66_2[#slot_0_66_2 + 1] = slot_0_68_2()
end

function slot_0_70_2()
	slot_0_64_3 = nil
end

function slot_0_71_2(arg_1041_0)
	if arg_1041_0 == nil then
		return
	end

	if type(arg_1041_0.userid) ~= "number" then
		return
	end

	if type(arg_1041_0.attacker) ~= "number" then
		return
	end

	local var_1041_0 = entity.get_local_player()

	if var_1041_0 == nil then
		return
	end

	local var_1041_1 = entity.get(arg_1041_0.userid, true)

	if var_1041_1 == nil then
		return
	end

	local var_1041_2 = entity.get(arg_1041_0.attacker, true)
	local var_1041_3 = var_1041_0:get_index()
	local var_1041_4 = var_1041_1:get_index()
	local var_1041_5 = 0

	if var_1041_2 ~= nil then
		var_1041_5 = var_1041_2:get_index()
	end

	if var_1041_5 == var_1041_3 and var_1041_4 ~= var_1041_3 then
		slot_0_69_2()

		if slot_0_64_3 ~= nil and var_1041_4 == slot_0_64_3 then
			slot_0_64_3 = nil
		end

		return
	end

	if var_1041_4 == var_1041_3 then
		if var_1041_5 > 0 and var_1041_5 ~= var_1041_3 then
			slot_0_64_3 = var_1041_5
		else
			slot_0_64_3 = nil
		end

		return
	end

	if slot_0_64_3 ~= nil and var_1041_4 == slot_0_64_3 then
		if var_1041_5 > 0 and var_1041_5 ~= var_1041_3 and var_1041_5 ~= var_1041_4 then
			slot_0_69_2()
		end

		slot_0_64_3 = nil
	end
end

function slot_0_72_2()
	local var_1042_0 = slot_0_66_2[1]

	if type(var_1042_0) ~= "string" then
		return
	end

	if globals.realtime < slot_0_65_2 then
		return
	end

	utils.console_exec("say " .. var_1042_0)
	table.remove(slot_0_66_2, 1)

	slot_0_65_2 = globals.realtime + slot_0_62_3
end

slot_0_73_2 = nil

function slot_0_74_2(arg_1043_0)
	local var_1043_0 = false

	if arg_1043_0 ~= nil then
		local var_1043_1, var_1043_2 = pcall(arg_1043_0.get, arg_1043_0)

		var_1043_0 = var_1043_1 and var_1043_2 == true
	end

	if not var_1043_0 then
		slot_0_67_2()
	end

	events.round_start(slot_0_70_2, var_1043_0)
	events.player_death(slot_0_71_2, var_1043_0)
	events.net_update_start(slot_0_72_2, var_1043_0)
end

if slot_0_60_2 ~= nil then
	slot_0_60_2:set_callback(slot_0_74_2, true)
end

slot_0_60_1 = {
	last_tickbase = 0
}
slot_0_61_2 = math.abs

function slot_0_62_2()
	slot_0_60_1.last_tickbase = 0
end

function slot_0_63_2(arg_1045_0)
	if arg_1045_0 == nil then
		return
	end

	local var_1045_0 = entity.get_local_player()

	if var_1045_0 == nil or not var_1045_0:is_alive() then
		slot_0_62_2()

		return
	end

	local var_1045_1 = var_1045_0.m_nTickBase

	if type(var_1045_1) ~= "number" then
		slot_0_62_2()

		return
	end

	if slot_0_61_2(var_1045_1 - slot_0_60_1.last_tickbase) > 64 then
		slot_0_60_1.last_tickbase = 0
	end

	if var_1045_1 > slot_0_60_1.last_tickbase then
		slot_0_60_1.last_tickbase = var_1045_1

		return
	end

	if var_1045_1 < slot_0_60_1.last_tickbase then
		arg_1045_0.skip_animation_this_tick = true
	end
end

function slot_0_64_2(arg_1046_0)
	local var_1046_0 = false

	if arg_1046_0 ~= nil then
		local var_1046_1, var_1046_2 = pcall(arg_1046_0.get, arg_1046_0)

		var_1046_0 = var_1046_1 and var_1046_2 == true
	end

	events.createmove(slot_0_63_2, var_1046_0)
	events.shutdown(slot_0_62_2, var_1046_0)

	if not var_1046_0 then
		slot_0_62_2()
	end
end

if slot_0_20_0.preserve_animated_tick_enabled ~= nil then
	slot_0_20_0.preserve_animated_tick_enabled:set_callback(slot_0_64_2, true)
end

slot_0_60_0 = nil
slot_0_61_1 = -500
slot_0_62_1 = 15
slot_0_63_1 = 75
slot_0_64_1 = 10
slot_0_65_1 = 8
slot_0_66_1 = math.pi * 2
slot_0_67_1 = slot_0_66_1 / slot_0_65_1
slot_0_68_1 = math.sin
slot_0_69_1 = math.cos
slot_0_70_1 = {
	state = false
}

function slot_0_71_1()
	local var_1047_0 = slot_0_20_0.no_fall_damage_enabled

	if var_1047_0 == nil then
		return false
	end

	local var_1047_1, var_1047_2 = pcall(var_1047_0.get, var_1047_0)

	if not var_1047_1 then
		return false
	end

	return var_1047_2 == true
end

function slot_0_70_1.trace_fall(arg_1048_0, arg_1048_1, arg_1048_2)
	if arg_1048_1 == nil then
		return false
	end

	local var_1048_0 = arg_1048_1:get_origin()

	if var_1048_0 == nil then
		return false
	end

	for iter_1048_0 = 0, slot_0_66_1, slot_0_67_1 do
		local var_1048_1 = slot_0_68_1(iter_1048_0)
		local var_1048_2 = slot_0_69_1(iter_1048_0)
		local var_1048_3 = var_1048_0.x + var_1048_2 * slot_0_64_1
		local var_1048_4 = var_1048_0.y + var_1048_1 * slot_0_64_1
		local var_1048_5 = vector(var_1048_3, var_1048_4, var_1048_0.z)
		local var_1048_6 = vector(var_1048_3, var_1048_4, var_1048_0.z - arg_1048_2)
		local var_1048_7 = utils.trace_line(var_1048_5, var_1048_6, arg_1048_1)

		if var_1048_7 ~= nil and var_1048_7.fraction ~= 1 then
			return true
		end
	end

	return false
end

function slot_0_70_1.update_default(arg_1049_0, arg_1049_1, arg_1049_2, arg_1049_3)
	if arg_1049_3 >= slot_0_61_1 then
		arg_1049_0.state = false

		return
	end

	if arg_1049_0:trace_fall(arg_1049_2, slot_0_62_1) then
		arg_1049_0.state = false
	elseif arg_1049_0:trace_fall(arg_1049_2, slot_0_63_1) then
		arg_1049_0.state = true
	end

	arg_1049_1.in_duck = arg_1049_0.state and 1 or 0
end

function slot_0_70_1.update(arg_1050_0, arg_1050_1)
	if not slot_0_71_1() then
		arg_1050_0.state = false

		return
	end

	if arg_1050_1 == nil then
		arg_1050_0.state = false

		return
	end

	local var_1050_0 = entity.get_local_player()

	if var_1050_0 == nil or not var_1050_0:is_alive() then
		arg_1050_0.state = false

		return
	end

	if slot_0_28_0.is_active() == true then
		arg_1050_0.state = false

		return
	end

	local var_1050_1 = var_1050_0.m_vecVelocity

	if var_1050_1 == nil then
		arg_1050_0.state = false

		return
	end

	local var_1050_2 = var_1050_1.z

	if type(var_1050_2) ~= "number" then
		arg_1050_0.state = false

		return
	end

	arg_1050_0:update_default(arg_1050_1, var_1050_0, var_1050_2)
end

slot_0_72_1 = false

function slot_0_73_1(arg_1051_0)
	slot_0_70_1:update(arg_1051_0)
end

function slot_0_74_1(arg_1052_0)
	local var_1052_0 = arg_1052_0 == true

	if slot_0_72_1 == var_1052_0 then
		return
	end

	events.createmove(slot_0_73_1, var_1052_0)

	slot_0_72_1 = var_1052_0

	if not var_1052_0 then
		slot_0_70_1.state = false
	end
end

function slot_0_75_1()
	slot_0_74_1(slot_0_71_1())
end

function slot_0_76_1()
	slot_0_75_1()
end

if slot_0_20_0.no_fall_damage_enabled ~= nil then
	slot_0_20_0.no_fall_damage_enabled:set_callback(slot_0_76_1, true)
end

slot_0_61_0 = nil
slot_0_62_0 = 9
slot_0_63_0 = 9
slot_0_64_0 = 33570827
slot_0_65_0 = 536870912
slot_0_66_0 = 2
slot_0_67_0 = 4
slot_0_68_0 = 0.1
slot_0_69_0 = 3
slot_0_70_0 = 15
slot_0_71_0 = 1.5
slot_0_72_0 = 2
slot_0_73_0 = 6
slot_0_74_0 = 120
slot_0_75_0 = 4
slot_0_76_0 = 14
slot_0_77_0 = 8
slot_0_78_0 = 2
slot_0_79_0 = 1
slot_0_80_0 = 2
slot_0_81_0 = 4
slot_0_82_0 = 14
slot_0_83_0 = 2
slot_0_84_0 = 24
slot_0_85_0 = 45
slot_0_86_0 = false
slot_0_87_0 = bit.band
slot_0_88_0 = math.abs
slot_0_89_0 = math.floor
slot_0_90_0 = math.clamp
slot_0_91_0 = math.max
slot_0_92_0 = math.normalize_yaw
slot_0_93_0 = math.sqrt
slot_0_94_0 = string.format
slot_0_95_0 = 0
slot_0_96_0 = 0
slot_0_97_0 = 0
slot_0_98_0 = 0
slot_0_99_0 = false
slot_0_100_0 = 0
slot_0_101_0 = 0
slot_0_102_0 = 0
slot_0_103_0 = nil
slot_0_104_0 = false
slot_0_105_0 = true
slot_0_106_0 = {
	exit_command_number = 0,
	arm_command_number = 0,
	was_armed = false,
	post_exit_command_number = 0
}

function slot_0_107_0(arg_1055_0)
	if arg_1055_0 == true or arg_1055_0 == 1 then
		return 1
	end

	return 0
end

function slot_0_108_0(arg_1056_0)
	if arg_1056_0 == nil then
		return 0
	end

	local var_1056_0 = arg_1056_0.command_number

	if type(var_1056_0) ~= "number" then
		return 0
	end

	return var_1056_0
end

function slot_0_109_0(arg_1057_0, ...)
	if slot_0_86_0 ~= true then
		return
	end

	local var_1057_0 = slot_0_94_0("[ladder dbg] " .. arg_1057_0, ...)

	print(var_1057_0)
end

function slot_0_110_0()
	slot_0_95_0 = 0
	slot_0_96_0 = 0
	slot_0_97_0 = 0
	slot_0_98_0 = 0
	slot_0_99_0 = false
	slot_0_100_0 = 0
	slot_0_101_0 = 0
	slot_0_102_0 = 0
	slot_0_103_0 = nil
	slot_0_104_0 = false
	slot_0_106_0.was_armed = false
	slot_0_106_0.arm_command_number = 0
	slot_0_106_0.exit_command_number = 0
	slot_0_106_0.post_exit_command_number = 0
end

function slot_0_111_0(arg_1059_0)
	if arg_1059_0 == nil then
		return false
	end

	local var_1059_0 = arg_1059_0:get_weapon_info()

	if var_1059_0 == nil or var_1059_0.weapon_type ~= slot_0_63_0 then
		return false
	end

	local var_1059_1 = arg_1059_0.m_fThrowTime

	if var_1059_1 == nil or var_1059_1 == 0 then
		return false
	end

	return true
end

function slot_0_112_0(arg_1060_0)
	if arg_1060_0 == true then
		return true
	end

	if type(arg_1060_0) == "number" and arg_1060_0 ~= 0 then
		return true
	end

	return false
end

function slot_0_113_0(arg_1061_0, arg_1061_1, arg_1061_2)
	if type(arg_1061_2) == "number" and arg_1061_2 ~= 0 then
		return arg_1061_2
	end

	if arg_1061_0 and not arg_1061_1 then
		return 1
	end

	if arg_1061_1 and not arg_1061_0 then
		return -1
	end

	return 0
end

function slot_0_114_0(arg_1062_0, arg_1062_1)
	if arg_1062_0.view_angles ~= nil then
		arg_1062_0.view_angles.y = slot_0_89_0(0.5 + arg_1062_0.view_angles.y)
	end

	local var_1062_0 = arg_1062_1.m_vecLadderNormal

	if var_1062_0 == nil or var_1062_0:lengthsqr() == 0 then
		return
	end

	local var_1062_1 = render.camera_angles()

	if var_1062_1 == nil then
		return
	end

	local var_1062_2 = var_1062_0:angles()
	local var_1062_3 = slot_0_92_0(var_1062_2.y - var_1062_1.y + 180)
	local var_1062_4 = slot_0_90_0(var_1062_2.x - var_1062_1.x, -89, 89)
	local var_1062_5 = slot_0_88_0(var_1062_3)
	local var_1062_6 = 89
	local var_1062_7 = -90
	local var_1062_8 = var_1062_4 < -45
	local var_1062_9 = var_1062_3 > 0
	local var_1062_10 = slot_0_113_0(slot_0_112_0(arg_1062_0.in_forward), slot_0_112_0(arg_1062_0.in_back), arg_1062_0.forwardmove)
	local var_1062_11 = slot_0_113_0(slot_0_112_0(arg_1062_0.in_moveright), slot_0_112_0(arg_1062_0.in_moveleft), arg_1062_0.sidemove)

	if var_1062_10 == 0 and var_1062_11 == 0 then
		return
	end

	if var_1062_5 > 70 and var_1062_5 < 135 then
		if var_1062_10 ~= 0 or var_1062_11 == 0 then
			return
		end

		local var_1062_12 = var_1062_11 > 0

		if not var_1062_9 then
			var_1062_7 = -var_1062_7
		end

		if var_1062_9 then
			var_1062_12 = not var_1062_12
		end

		arg_1062_0.in_back = var_1062_12 and 1 or 0
		arg_1062_0.in_forward = var_1062_12 and 0 or 1

		if var_1062_9 then
			var_1062_12 = not var_1062_12
		end

		arg_1062_0.in_moveleft = var_1062_12 and 1 or 0
		arg_1062_0.in_moveright = var_1062_12 and 0 or 1
		arg_1062_0.view_angles.x = var_1062_6
		arg_1062_0.view_angles.y = slot_0_92_0(var_1062_2.y + var_1062_7)

		return
	end

	if var_1062_11 ~= 0 or var_1062_10 == 0 then
		return
	end

	local var_1062_13 = var_1062_10 > 0

	if not var_1062_9 then
		var_1062_7 = -var_1062_7
	end

	if not var_1062_8 then
		var_1062_13 = not var_1062_13
	end

	arg_1062_0.in_back = var_1062_13 and 0 or 1
	arg_1062_0.in_forward = var_1062_13 and 1 or 0

	if not var_1062_9 then
		var_1062_13 = not var_1062_13
	end

	arg_1062_0.in_moveleft = var_1062_13 and 1 or 0
	arg_1062_0.in_moveright = var_1062_13 and 0 or 1
	arg_1062_0.view_angles.x = var_1062_6
	arg_1062_0.view_angles.y = slot_0_92_0(var_1062_2.y + var_1062_7)
end

function slot_0_115_0()
	if rage == nil or rage.exploit == nil then
		return false
	end

	local var_1063_0, var_1063_1 = pcall(rage.exploit.get, rage.exploit)

	if not var_1063_0 or type(var_1063_1) ~= "number" then
		return false
	end

	return var_1063_1 > 0
end

function slot_0_116_0(arg_1064_0)
	if arg_1064_0 == nil then
		return 0
	end

	local var_1064_0 = arg_1064_0.choked_commands

	if type(var_1064_0) ~= "number" then
		return 0
	end

	return slot_0_90_0(var_1064_0, 0, 62)
end

function slot_0_117_0(arg_1065_0)
	if arg_1065_0 == nil then
		return 0
	end

	local var_1065_0 = arg_1065_0:lengthsqr()

	if type(var_1065_0) ~= "number" or var_1065_0 <= 0 then
		return 0
	end

	return slot_0_93_0(var_1065_0)
end

function slot_0_118_0(arg_1066_0, arg_1066_1)
	local var_1066_0 = slot_0_67_0

	if not slot_0_115_0() then
		var_1066_0 = var_1066_0 + slot_0_90_0(slot_0_116_0(arg_1066_0), 0, slot_0_73_0)
		var_1066_0 = var_1066_0 + slot_0_90_0(slot_0_89_0(slot_0_117_0(arg_1066_1) / slot_0_74_0), 0, slot_0_75_0)
	end

	return slot_0_90_0(var_1066_0, 1, slot_0_76_0)
end

function slot_0_119_0()
	local var_1067_0 = globals.tickinterval

	if type(var_1067_0) ~= "number" or var_1067_0 <= 0 then
		return slot_0_69_0
	end

	local var_1067_1 = slot_0_89_0(slot_0_68_0 / var_1067_0 + 0.5)

	if not slot_0_115_0() then
		var_1067_1 = var_1067_1 + slot_0_90_0(slot_0_101_0 - slot_0_67_0 + 1, 1, slot_0_77_0)
	end

	return slot_0_90_0(var_1067_1, 1, 32)
end

function slot_0_120_0(arg_1068_0, arg_1068_1)
	if arg_1068_1 ~= nil then
		local var_1068_0 = arg_1068_1.obb_mins
		local var_1068_1 = arg_1068_1.obb_maxs

		if var_1068_0 ~= nil and var_1068_1 ~= nil then
			return var_1068_0, var_1068_1
		end
	end

	local var_1068_2 = arg_1068_0.m_vecMins
	local var_1068_3 = arg_1068_0.m_vecMaxs

	if var_1068_2 == nil or var_1068_3 == nil then
		return nil, nil
	end

	return var_1068_2, var_1068_3
end

function slot_0_121_0(arg_1069_0, arg_1069_1, arg_1069_2, arg_1069_3)
	if arg_1069_0 == nil or arg_1069_1 == nil or arg_1069_3 == nil then
		return false
	end

	if arg_1069_3:lengthsqr() == 0 then
		return false
	end

	local var_1069_0, var_1069_1 = slot_0_120_0(arg_1069_0, arg_1069_2)

	if var_1069_0 == nil or var_1069_1 == nil then
		return false
	end

	local var_1069_2 = utils.trace_hull(arg_1069_1, arg_1069_1 - arg_1069_3 * slot_0_66_0, var_1069_0, var_1069_1, arg_1069_0, slot_0_64_0)

	if var_1069_2 == nil then
		return false
	end

	local var_1069_3 = var_1069_2.contents

	if type(var_1069_3) ~= "number" then
		return false
	end

	return slot_0_87_0(var_1069_3, slot_0_65_0) ~= 0
end

function slot_0_122_0(arg_1070_0, arg_1070_1)
	if arg_1070_0 == nil then
		return false, 0, 0
	end

	local var_1070_0 = arg_1070_0.m_vecVelocity

	if var_1070_0 == nil then
		return false, 0, 0
	end

	local var_1070_1 = var_1070_0.z

	if type(var_1070_1) ~= "number" or var_1070_1 <= slot_0_70_0 then
		return false, 0, 0
	end

	local var_1070_2 = slot_0_118_0(arg_1070_1, var_1070_0)
	local var_1070_3 = arg_1070_0.m_vecLadderNormal

	if var_1070_3 == nil or var_1070_3:lengthsqr() == 0 then
		return false, var_1070_2, 0
	end

	local var_1070_4 = arg_1070_0:get_origin()

	if var_1070_4 == nil then
		return false, var_1070_2, 0
	end

	local var_1070_5 = var_1070_4.z

	if type(var_1070_5) ~= "number" then
		return false, var_1070_2, 0
	end

	if not slot_0_121_0(arg_1070_0, var_1070_4, nil, var_1070_3) then
		return true, var_1070_2, 1
	end

	local var_1070_6 = globals.tickinterval

	if type(var_1070_6) ~= "number" or var_1070_6 <= 0 then
		var_1070_6 = 0.015625
	end

	for iter_1070_0 = 1, var_1070_2 do
		local var_1070_7 = var_1070_4 + var_1070_0 * (var_1070_6 * iter_1070_0)
		local var_1070_8 = var_1070_7.z

		if type(var_1070_8) == "number" and var_1070_8 >= var_1070_5 + slot_0_71_0 and not slot_0_121_0(arg_1070_0, var_1070_7, nil, var_1070_3) then
			return true, var_1070_2, iter_1070_0
		end
	end

	return false, var_1070_2, 0
end

function slot_0_123_0(arg_1071_0)
	local var_1071_0 = slot_0_95_0 > 0

	if slot_0_95_0 > 0 then
		slot_0_95_0 = slot_0_95_0 - 1
		arg_1071_0.in_speed = 1
	end

	if slot_0_96_0 > 0 then
		slot_0_96_0 = slot_0_96_0 - 1
		arg_1071_0.in_jump = 0
		arg_1071_0.upmove = 0
	end

	if slot_0_97_0 > 0 then
		slot_0_97_0 = slot_0_97_0 - 1
		arg_1071_0.forwardmove = 0
		arg_1071_0.sidemove = 0
		arg_1071_0.in_forward = 0
		arg_1071_0.in_back = 0
		arg_1071_0.in_moveleft = 0
		arg_1071_0.in_moveright = 0
	end

	if var_1071_0 then
		local var_1071_1 = slot_0_108_0(arg_1071_0)

		if slot_0_106_0.post_exit_command_number ~= var_1071_1 then
			slot_0_109_0("post cmd=%d shift_left=%d jump_suppress=%d stop_left=%d jump=%d up=%.1f fwd=%.1f side=%.1f block=%d", var_1071_1, slot_0_95_0, slot_0_96_0, slot_0_97_0, slot_0_107_0(arg_1071_0.in_jump), arg_1071_0.upmove or 0, arg_1071_0.forwardmove or 0, arg_1071_0.sidemove or 0, arg_1071_0.block_movement or 0)

			slot_0_106_0.post_exit_command_number = var_1071_1
		end
	end
end

function slot_0_124_0(arg_1072_0)
	if slot_0_105_0 ~= true then
		slot_0_104_0 = false

		return
	end

	local var_1072_0 = entity.get_local_player()

	if var_1072_0 == nil or not var_1072_0:is_alive() then
		slot_0_110_0()

		return
	end

	local var_1072_1 = var_1072_0.m_MoveType == slot_0_62_0

	if slot_0_104_0 and not var_1072_1 then
		local var_1072_2 = slot_0_99_0
		local var_1072_3 = slot_0_108_0(arg_1072_0)
		local var_1072_4 = var_1072_0.m_vecVelocity
		local var_1072_5 = 0

		if var_1072_4 ~= nil and type(var_1072_4.z) == "number" then
			var_1072_5 = var_1072_4.z
		end

		local var_1072_6 = var_1072_0:get_origin()
		local var_1072_7

		if var_1072_6 ~= nil and type(var_1072_6.z) == "number" then
			var_1072_7 = var_1072_6.z
		end

		local var_1072_8 = 0

		if type(var_1072_7) == "number" and type(slot_0_103_0) == "number" then
			var_1072_8 = var_1072_7 - slot_0_103_0
		end

		local var_1072_9 = type(var_1072_7) == "number" and type(slot_0_103_0) == "number" and var_1072_8 >= slot_0_84_0 and slot_0_88_0(var_1072_5) <= slot_0_85_0

		if var_1072_3 ~= 0 and slot_0_102_0 ~= 0 then
			var_1072_2 = var_1072_3 <= slot_0_102_0
		end

		local var_1072_10 = var_1072_2 and var_1072_9

		if var_1072_10 then
			slot_0_95_0 = slot_0_119_0()
			slot_0_96_0 = slot_0_78_0

			if not slot_0_115_0() then
				slot_0_97_0 = slot_0_83_0
			end
		end

		if slot_0_106_0.exit_command_number ~= var_1072_3 then
			slot_0_109_0("exit cmd=%d matched=%d post=%d jump_suppress=%d predict=%d exit_tick=%d speed=%.1f velz=%.1f top=%d dz=%.1f", var_1072_3, slot_0_107_0(var_1072_10), slot_0_95_0, slot_0_96_0, slot_0_101_0, slot_0_100_0, slot_0_117_0(var_1072_4), var_1072_5, slot_0_107_0(var_1072_9), var_1072_8)

			slot_0_106_0.exit_command_number = var_1072_3
		end
	end

	slot_0_104_0 = var_1072_1

	if not var_1072_1 then
		slot_0_99_0 = false
		slot_0_100_0 = 0
		slot_0_101_0 = 0
		slot_0_102_0 = 0
		slot_0_103_0 = nil
		slot_0_98_0 = 0
		slot_0_106_0.was_armed = false
	end
end

function slot_0_125_0(arg_1073_0)
	local var_1073_0 = entity.get_local_player()

	if var_1073_0 == nil or not var_1073_0:is_alive() then
		slot_0_110_0()

		return
	end

	if slot_0_28_0.is_active() == true then
		return
	end

	if var_1073_0.m_MoveType ~= slot_0_62_0 then
		if slot_0_105_0 then
			slot_0_123_0(arg_1073_0)
		else
			slot_0_95_0 = 0
			slot_0_96_0 = 0
			slot_0_97_0 = 0
		end

		slot_0_98_0 = 0

		return
	end

	slot_0_104_0 = true
	slot_0_95_0 = 0
	slot_0_96_0 = 0
	slot_0_97_0 = 0

	local var_1073_1 = var_1073_0:get_origin()

	if var_1073_1 ~= nil and type(var_1073_1.z) == "number" then
		local var_1073_2 = var_1073_1.z

		if type(slot_0_103_0) ~= "number" or var_1073_2 < slot_0_103_0 then
			slot_0_103_0 = var_1073_2
		end
	end

	local var_1073_3 = slot_0_108_0(arg_1073_0)

	if slot_0_105_0 then
		local var_1073_4 = 0
		local var_1073_5 = 0
		local var_1073_6 = false
		local var_1073_7 = var_1073_3 ~= 0 and slot_0_102_0 ~= 0 and var_1073_3 <= slot_0_102_0
		local var_1073_8 = var_1073_3 ~= 0 and slot_0_98_0 ~= 0 and var_1073_3 <= slot_0_98_0
		local var_1073_9, var_1073_10, var_1073_11 = slot_0_122_0(var_1073_0, arg_1073_0)
		local var_1073_12 = var_1073_11
		local var_1073_13 = var_1073_10

		if var_1073_9 then
			slot_0_99_0 = true
			slot_0_100_0 = var_1073_12
			slot_0_101_0 = var_1073_13

			if var_1073_12 > 0 and var_1073_12 <= slot_0_80_0 then
				slot_0_98_0 = slot_0_91_0(slot_0_98_0, var_1073_3 + slot_0_91_0(var_1073_13 + slot_0_82_0, slot_0_81_0))
			end

			if var_1073_3 ~= 0 then
				slot_0_102_0 = slot_0_91_0(slot_0_102_0, var_1073_3 + var_1073_13 + slot_0_72_0)
			else
				slot_0_102_0 = 0
			end
		elseif var_1073_7 or var_1073_8 then
			slot_0_99_0 = true
			slot_0_100_0 = 0
		else
			slot_0_100_0 = 0
			slot_0_99_0 = false
			slot_0_101_0 = 0
			slot_0_102_0 = 0
			slot_0_98_0 = 0
		end
	else
		slot_0_99_0 = false
		slot_0_100_0 = 0
		slot_0_101_0 = 0
		slot_0_102_0 = 0
		slot_0_98_0 = 0
	end

	if slot_0_99_0 then
		if slot_0_106_0.was_armed ~= true then
			local var_1073_14 = var_1073_0.m_vecVelocity
			local var_1073_15 = 0

			if var_1073_14 ~= nil and type(var_1073_14.z) == "number" then
				var_1073_15 = var_1073_14.z
			end

			slot_0_109_0("arm cmd=%d choke=%d predict=%d exit_tick=%d jump=%d speed=%.1f velz=%.1f fwd=%.1f side=%.1f", var_1073_3, slot_0_116_0(arg_1073_0), slot_0_101_0, slot_0_100_0, slot_0_107_0(arg_1073_0.in_jump), slot_0_117_0(var_1073_14), var_1073_15, arg_1073_0.forwardmove or 0, arg_1073_0.sidemove or 0)

			slot_0_106_0.arm_command_number = var_1073_3
		end
	elseif slot_0_106_0.was_armed == true and slot_0_106_0.arm_command_number ~= var_1073_3 then
		slot_0_109_0("disarm cmd=%d choke=%d jump=%d up=%.1f fwd=%.1f side=%.1f", var_1073_3, slot_0_116_0(arg_1073_0), slot_0_107_0(arg_1073_0.in_jump), arg_1073_0.upmove or 0, arg_1073_0.forwardmove or 0, arg_1073_0.sidemove or 0)
	end

	slot_0_106_0.was_armed = slot_0_99_0

	local var_1073_16 = var_1073_3 ~= 0 and slot_0_98_0 ~= 0 and var_1073_3 <= slot_0_98_0

	if not var_1073_16 and var_1073_3 ~= 0 then
		slot_0_98_0 = 0
	end

	local var_1073_17 = var_1073_16 or slot_0_100_0 > 0 and slot_0_100_0 <= slot_0_79_0
	local var_1073_18 = var_1073_0:get_player_weapon()

	if var_1073_18 == nil then
		if var_1073_17 then
			arg_1073_0.in_speed = 1
		end

		return
	end

	if slot_0_111_0(var_1073_18) then
		if var_1073_17 then
			arg_1073_0.in_speed = 1
		end

		return
	end

	if var_1073_17 then
		arg_1073_0.in_speed = 1
	end

	slot_0_114_0(arg_1073_0, var_1073_0)
end

slot_0_126_0 = nil

function slot_0_127_0(arg_1074_0)
	local var_1074_0 = true

	if arg_1074_0 ~= nil then
		local var_1074_1, var_1074_2 = pcall(arg_1074_0.get, arg_1074_0)

		var_1074_0 = var_1074_1 and var_1074_2 == true
	end

	slot_0_105_0 = var_1074_0

	if not var_1074_0 then
		slot_0_110_0()
	end
end

function slot_0_128_0(arg_1075_0)
	local var_1075_0 = false

	if arg_1075_0 ~= nil then
		local var_1075_1, var_1075_2 = pcall(arg_1075_0.get, arg_1075_0)

		var_1075_0 = var_1075_1 and var_1075_2 == true
	end

	events.createmove(slot_0_125_0, var_1075_0)
	events.createmove_run(slot_0_124_0, var_1075_0)

	if not var_1075_0 then
		slot_0_110_0()
	end
end

if slot_0_20_0.fast_ladder_move ~= nil then
	slot_0_20_0.fast_ladder_move:set_callback(slot_0_128_0, true)
end

if slot_0_20_0.fast_ladder_jump_fix ~= nil then
	slot_0_20_0.fast_ladder_jump_fix:set_callback(slot_0_127_0, true)
end

if slot_0_13_0 ~= nil and type(slot_0_13_0.restore_session) == "function" then
	slot_0_13_0.restore_session()
end

if slot_0_13_0 ~= nil and type(slot_0_13_0.start_bind_autosave) == "function" then
	slot_0_13_0.start_bind_autosave()
end
