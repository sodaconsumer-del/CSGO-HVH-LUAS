ffi.cdef("    typedef struct\n    {\n        void* steam_client;\n        void* steam_user;\n        void* steam_friends;\n        void* steam_utils;\n        void* steam_matchmaking;\n        void* steam_user_stats;\n        void* steam_apps;\n        void* steam_matchmakingservers;\n        void* steam_networking;\n        void* steam_remotestorage;\n        void* steam_screenshots;\n        void* steam_http;\n        void* steam_unidentifiedmessages;\n        void* steam_controller;\n        void* steam_ugc;\n        void* steam_applist;\n        void* steam_music;\n        void* steam_musicremote;\n        void* steam_htmlsurface;\n        void* steam_inventory;\n        void* steam_video;\n    } S_steamApiCtx_t;\n")

local reloaded_0_0 = ffi.cast("S_steamApiCtx_t**", ffi.cast("char*", utils.opcode_scan("client.dll", "FF 15 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A")) + 7)[0] or error("invalid interface", 2)
local reloaded_0_1 = ffi.cast("void***", reloaded_0_0.steam_friends)
local reloaded_0_2 = ffi.cast("void***", reloaded_0_0.steam_utils)
local reloaded_0_3 = ffi.cast("int(__thiscall*)(void*, uint64_t)", reloaded_0_1[0][34])
local reloaded_0_4 = ffi.cast("bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)", reloaded_0_2[0][5])
local reloaded_0_5 = ffi.cast("bool(__thiscall*)(void*, int, unsigned char*, int)", reloaded_0_2[0][6])
local reloaded_0_6 = ffi.typeof("unsigned char[?]")
local reloaded_0_7 = ffi.typeof("unsigned int[?]")
local reloaded_0_8 = panorama.GameStateAPI
local reloaded_0_9 = {}

reloaded_0_9.__index = reloaded_0_9

local reloaded_0_10 = 65535

local function reloaded_0_11(arg_1_0, arg_1_1, arg_1_2)
	for iter_1_0 = 0, 3 do
		arg_1_1[arg_1_2 + iter_1_0] = bit.band(bit.rshift(arg_1_0, (3 - iter_1_0) * 8), 255)
	end
end

function reloaded_0_9.writeBytes(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_2 = arg_2_2 or 1
	arg_2_3 = arg_2_3 or #arg_2_1

	for iter_2_0 = arg_2_2, arg_2_2 + arg_2_3 - 1 do
		table.insert(arg_2_0.output, string.char(arg_2_1[iter_2_0]))
	end
end

function reloaded_0_9.write(arg_3_0, arg_3_1)
	local reloaded_3_0 = #arg_3_1
	local reloaded_3_1 = 1

	while reloaded_3_0 > 0 do
		if arg_3_0.positionY >= arg_3_0.height then
			error("All image pixels already written")
		end

		if arg_3_0.deflateFilled == 0 then
			local reloaded_3_2 = reloaded_0_10

			if reloaded_3_2 > arg_3_0.uncompRemain then
				reloaded_3_2 = arg_3_0.uncompRemain
			end

			local reloaded_3_3 = {
				bit.band(arg_3_0.uncompRemain <= reloaded_0_10 and 1 or 0, 255),
				bit.band(bit.rshift(reloaded_3_2, 0), 255),
				bit.band(bit.rshift(reloaded_3_2, 8), 255),
				bit.band(bit.bxor(bit.rshift(reloaded_3_2, 0), 255), 255),
				bit.band(bit.bxor(bit.rshift(reloaded_3_2, 8), 255), 255)
			}

			arg_3_0:writeBytes(reloaded_3_3)
			arg_3_0:crc32(reloaded_3_3, 1, #reloaded_3_3)
		end

		assert(arg_3_0.positionX < arg_3_0.lineSize and arg_3_0.deflateFilled < reloaded_0_10)

		if arg_3_0.positionX == 0 then
			local reloaded_3_4 = {
				0
			}

			arg_3_0:writeBytes(reloaded_3_4)
			arg_3_0:crc32(reloaded_3_4, 1, 1)
			arg_3_0:adler32(reloaded_3_4, 1, 1)

			arg_3_0.positionX = arg_3_0.positionX + 1
			arg_3_0.uncompRemain = arg_3_0.uncompRemain - 1
			arg_3_0.deflateFilled = arg_3_0.deflateFilled + 1
		else
			local reloaded_3_5 = reloaded_0_10 - arg_3_0.deflateFilled

			if reloaded_3_5 > arg_3_0.lineSize - arg_3_0.positionX then
				reloaded_3_5 = arg_3_0.lineSize - arg_3_0.positionX
			end

			if reloaded_3_0 < reloaded_3_5 then
				reloaded_3_5 = reloaded_3_0
			end

			assert(reloaded_3_5 > 0)
			arg_3_0:writeBytes(arg_3_1, reloaded_3_1, reloaded_3_5)
			arg_3_0:crc32(arg_3_1, reloaded_3_1, reloaded_3_5)
			arg_3_0:adler32(arg_3_1, reloaded_3_1, reloaded_3_5)

			reloaded_3_0 = reloaded_3_0 - reloaded_3_5
			reloaded_3_1 = reloaded_3_1 + reloaded_3_5
			arg_3_0.positionX = arg_3_0.positionX + reloaded_3_5
			arg_3_0.uncompRemain = arg_3_0.uncompRemain - reloaded_3_5
			arg_3_0.deflateFilled = arg_3_0.deflateFilled + reloaded_3_5
		end

		if arg_3_0.deflateFilled >= reloaded_0_10 then
			arg_3_0.deflateFilled = 0
		end

		if arg_3_0.positionX == arg_3_0.lineSize then
			arg_3_0.positionX = 0
			arg_3_0.positionY = arg_3_0.positionY + 1

			if arg_3_0.positionY == arg_3_0.height then
				local reloaded_3_6 = {
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					0,
					73,
					69,
					78,
					68,
					174,
					66,
					96,
					130
				}

				reloaded_0_11(arg_3_0.adler, reloaded_3_6, 1)
				arg_3_0:crc32(reloaded_3_6, 1, 4)
				reloaded_0_11(arg_3_0.crc, reloaded_3_6, 5)
				arg_3_0:writeBytes(reloaded_3_6)

				arg_3_0.done = true
			end
		end
	end
end

function reloaded_0_9.crc32(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0.crc = bit.bnot(arg_4_0.crc)

	for iter_4_0 = arg_4_2, arg_4_2 + arg_4_3 - 1 do
		local reloaded_4_0 = arg_4_1[iter_4_0]

		for iter_4_1 = 0, 7 do
			local reloaded_4_1 = bit.band(bit.bxor(arg_4_0.crc, bit.rshift(reloaded_4_0, iter_4_1)), 1)

			arg_4_0.crc = bit.bxor(bit.rshift(arg_4_0.crc, 1), bit.band(-reloaded_4_1, 3988292384))
		end
	end

	arg_4_0.crc = bit.bnot(arg_4_0.crc)
end

function reloaded_0_9.adler32(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local reloaded_5_0 = bit.band(arg_5_0.adler, 65535)
	local reloaded_5_1 = bit.rshift(arg_5_0.adler, 16)

	for iter_5_0 = arg_5_2, arg_5_2 + arg_5_3 - 1 do
		reloaded_5_0 = (reloaded_5_0 + arg_5_1[iter_5_0]) % 65521
		reloaded_5_1 = (reloaded_5_1 + reloaded_5_0) % 65521
	end

	arg_5_0.adler = bit.bor(bit.lshift(reloaded_5_1, 16), reloaded_5_0)
end

local function reloaded_0_12(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2 = arg_6_2 or "rgb"

	local reloaded_6_0
	local reloaded_6_1

	if arg_6_2 == "rgb" then
		reloaded_6_0, reloaded_6_1 = 3, 2
	elseif arg_6_2 == "rgba" then
		reloaded_6_0, reloaded_6_1 = 4, 6
	else
		error("Invalid colorMode")
	end

	local reloaded_6_2 = setmetatable({
		done = false,
		width = arg_6_0,
		height = arg_6_1,
		output = {}
	}, reloaded_0_9)

	reloaded_6_2.lineSize = arg_6_0 * reloaded_6_0 + 1
	reloaded_6_2.uncompRemain = reloaded_6_2.lineSize * arg_6_1

	local reloaded_6_3 = math.ceil(reloaded_6_2.uncompRemain / reloaded_0_10) * 5 + 6 + reloaded_6_2.uncompRemain
	local reloaded_6_4 = {
		137,
		80,
		78,
		71,
		13,
		10,
		26,
		10,
		0,
		0,
		0,
		13,
		73,
		72,
		68,
		82,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		8,
		reloaded_6_1,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		73,
		68,
		65,
		84,
		8,
		29
	}

	reloaded_0_11(arg_6_0, reloaded_6_4, 17)
	reloaded_0_11(arg_6_1, reloaded_6_4, 21)
	reloaded_0_11(reloaded_6_3, reloaded_6_4, 34)

	reloaded_6_2.crc = 0

	reloaded_6_2:crc32(reloaded_6_4, 13, 17)
	reloaded_0_11(reloaded_6_2.crc, reloaded_6_4, 30)
	reloaded_6_2:writeBytes(reloaded_6_4)

	reloaded_6_2.crc = 0

	reloaded_6_2:crc32(reloaded_6_4, 38, 6)

	reloaded_6_2.adler = 1
	reloaded_6_2.positionX = 0
	reloaded_6_2.positionY = 0
	reloaded_6_2.deflateFilled = 0

	return reloaded_6_2
end

local reloaded_0_13 = {
	data = {},
	default_image = render.load_image("\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x01\x00\x00\x01\x00\x01\x00\x00\xFF\xFE\x00;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 80\n\xFF\xDB\x00C\x00\x06\x04\x05\x06\x05\x04\x06\x06\x05\x06\a\a\x06\b\n\x10\n\n\t\t\n\x14\x0E\x0F\f\x10\x17\x14\x18\x18\x17\x14\x16\x16\x1A\x1D%\x1F\x1A\x1B#\x1C\x16\x16 , #&')*)\x19\x1F-0-(0%()(\xFF\xDB\x00C\x01\a\a\a\n\b\n\x13\n\n\x13(\x1A\x16\x1A((((((((((((((((((((((((((((((((((((((((((((((((((\xFF\xC0\x00\x11\b\x00@\x00@\x03\x01\"\x00\x02\x11\x01\x03\x11\x01\xFF\xC4\x00\x1F\x00\x00\x01\x05\x01\x01\x01\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x01\x02\x03\x04\x05\x06\a\b\t\n\v\xFF\xC4\x00\xB5\x10\x00\x02\x01\x03\x03\x02\x04\x03\x05\x05\x04\x04\x00\x00\x01}\x01\x02\x03\x00\x04\x11\x05\x12!1A\x06\x13Qa\a\"q\x142\x81\x91\xA1\b#B\xB1\xC1\x15R\xD1\xF0$3br\x82\t\n\x16\x17\x18\x19\x1A%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\x83\x84\x85\x86\x87\x88\x89\x8A\x92\x93\x94\x95\x96\x97\x98\x99\x9A\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xB2\xB3\xB4\xB5\xB6\xB7\xB8\xB9\xBA\xC2\xC3\xC4\xC5\xC6\xC7\xC8\xC9\xCA\xD2\xD3\xD4\xD5\xD6\xD7\xD8\xD9\xDA\xE1\xE2\xE3\xE4\xE5\xE6\xE7\xE8\xE9\xEA\xF1\xF2\xF3\xF4\xF5\xF6\xF7\xF8\xF9\xFA\xFF\xC4\x00\x1F\x01\x00\x03\x01\x01\x01\x01\x01\x01\x01\x01\x01\x00\x00\x00\x00\x00\x00\x01\x02\x03\x04\x05\x06\a\b\t\n\v\xFF\xC4\x00\xB5\x11\x00\x02\x01\x02\x04\x04\x03\x04\a\x05\x04\x04\x00\x01\x02w\x00\x01\x02\x03\x11\x04\x05!1\x06\x12AQ\aaq\x13\"2\x81\b\x14B\x91\xA1\xB1\xC1\t#3R\xF0\x15br\xD1\n\x16$4\xE1%\xF1\x17\x18\x19\x1A&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\x82\x83\x84\x85\x86\x87\x88\x89\x8A\x92\x93\x94\x95\x96\x97\x98\x99\x9A\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xB2\xB3\xB4\xB5\xB6\xB7\xB8\xB9\xBA\xC2\xC3\xC4\xC5\xC6\xC7\xC8\xC9\xCA\xD2\xD3\xD4\xD5\xD6\xD7\xD8\xD9\xDA\xE2\xE3\xE4\xE5\xE6\xE7\xE8\xE9\xEA\xF2\xF3\xF4\xF5\xF6\xF7\xF8\xF9\xFA\xFF\xDA\x00\f\x03\x01\x00\x02\x11\x03\x11\x00?\x00\xF0\x89\xE6\x93\xCF\x93\xF7\x8F\xF7\x8F\xF1\x1FZg\x9D'\xFC\xF4\x7F\xFB\xE8\xD1?\xFA\xF9?\xDE?\xCE\x99@\x0F\xF3\xA4\xFF\x00\x9E\x8F\xFF\x00}\x1A<\xE9?\xE7\xA3\xFF\x00\xDFF\x99Z:.\x87\xAA\xEB\x934Z>\x9Duz\xEB\xF7\x84\x11\x17\xDB\xF5#\xA7\xE3@\x14|\xE9?\xE7\xA3\xFF\x00\xDFF\x8F:O\xF9\xE8\xFF\x00\xF7\xD1\xAD\x1Do\xC3\xBA\xCE\x86W\xFBcK\xBC\xB2\x0F\xC2\xB4\xD1\x15V\xFA\x1E\x86\xB2\xE8\x01\xFEt\x9F\xF3\xD1\xFF\x00\xEF\xA3O\x82i<\xF8\xFF\x00x\xFF\x00x\x7F\x11\xF5\xA8i\xF0\x7F\xAF\x8F\xFD\xE1\xFC\xE8\x00\x9F\xFD|\x9F\xEF\x1F\xE7L\xA7\xCF\xFE\xBEO\xF7\x8F\xF3\xA6P\x05\xDD\x13O}[Y\xB0\xD3\xA2`\xB2]\xCF\x1C\nOb\xCC\x14\x1F\xD6\xBE\xA8\xF1w\x88t\x8F\x84^\x12\xD3\xED4\xDD<J\xD2\x13\x1C\x10\x06\xD9\xBC\x807H\xED\x8E\xBC\x8C\xFA\x93_'[\xCF-\xB5\xC4s\xDB\xC8\xF1M\x13\aI\x11\x8A\xB2\xB09\x04\x11\xD0\x83V\xF5MgS\xD5\xFC\xBF\xED]F\xF2\xF7\xCB\xCE\xCF\xB4L\xD2m\xCF\\d\x9Ct\x14\x01\xF5\x17\xC3\xEF\x1C\xE9\x9F\x14t\xDDGK\xD5t\xC4\x8ATL\xCDl\xED\xE6$\x88N7)\xC0 \x83\xF9q\x83_4\xF8\xDBD\x1E\x1C\xF1f\xA9\xA4\xAB\x17KY\xCA#\x1E\xA5\x0F+\x9F|\x11_B|\x16\xF0\xA4^\x06\xF0\x9D\xDF\x88\xBC@\xE2\xDA\xE6\xE6\x11,\x9Eg\x1ED#\x90\x0F\xFBG\xA9\x1FA\xD6\xBEz\xF1\xAE\xB7\xFF\x00\t\x1F\x8A\xF5MX!D\xBA\x98\xBA)\xEA\x13\xA2\x83\xEF\x80(\x03\x16\x9F\a\xFA\xF8\xFF\x00\xDE\x1F\xCE\x99O\x83\xFD|\x7F\xEF\x0F\xE7@\x04\xFF\x00\xEB\xE4\xFF\x00x\xFF\x00:e>\x7F\xF5\xF2\x7F\xBC\x7F\x9D2\x80\n\xED\xFE\vi\x96\xDA\xBF\xC4\xAD\x1E\xDA\xF61$\n\xCF1F\x19\fQ\x19\x86}\xB2\x05q\x15\xD3\xFC6\xD3uM_\xC6\x16vZ\x0E\xA0t\xEDBE\x90\xC7r\x19\x97h\bI\xE5y\xE4\x02?\x1A\x00\xF5\x1F\xDAo\xC4\xF7b\xFE\xCF\xC3p1\x8E\xCF\xCA[\xA9\xF1\xD6F,\xC1A\xF6\x1Bs\xF5>\xD5\xE0\xF5\xD8\xFCV\xD1\xF5\xAD\x13\xC4\xE9k\xE2=P\xEA\x97\xA6\xDD\x1CN]\x9B\bKar\xDC\xF5\a\xF3\xAE:\x80\n|\x1F\xEB\xE3\xFF\x00x\x7F:e>\x0F\xF5\xF1\xFF\x00\xBC?\x9D\x00\x13\xFF\x00\xAF\x93\xFD\xE3\xFC\xE9\x954\xF0\xC9\xE7\xC9\xFB\xB7\xFB\xC7\xF8O\xAD3\xC9\x93\xFEy\xBF\xFD\xF2h\x01\x95{C\xD5\xEF\xF4-J-CI\xB8kk\xC8\xC1\t\"\x80H\xC8 \xF5\x04t&\xAAy2\x7F\xCF7\xFF\x00\xBEM\x1EL\x9F\xF3\xCD\xFF\x00\xEF\x93@\x1A\x1E!\xD7\xB5?\x11_\x8B\xDDj\xED\xAE\xEE\x82\b\xC4\x8C\xA0\x1D\xA0\x92\a\x00z\x9A\xCC\xA7\xF92\x7F\xCF7\xFF\x00\xBEM\x1EL\x9F\xF3\xCD\xFF\x00\xEF\x93@\f\xA7\xC1\xFE\xBE?\xF7\x87\xF3\xA3\xC9\x93\xFEy\xBF\xFD\xF2i\xF0C'\x9F\x1F\xEE\xDF\xEF\x0F\xE1>\xB4\x01\xFF\xD9"),
	get_avatar = function(arg_7_0)
		if arg_7_0 == nil then
			return
		end

		local reloaded_7_0 = 4
		local reloaded_7_1 = {}
		local reloaded_7_2
		local reloaded_7_3 = reloaded_0_3(reloaded_0_1, tonumber(arg_7_0:sub(4, -1)) + 76500000000000000ULL)
		local reloaded_7_4 = ""

		if reloaded_7_3 > 0 then
			local reloaded_7_5 = reloaded_0_7(1)
			local reloaded_7_6 = reloaded_0_7(1)

			if reloaded_0_4(reloaded_0_2, reloaded_7_3, reloaded_7_5, reloaded_7_6) and reloaded_7_5[0] > 0 and reloaded_7_6[0] > 0 then
				local reloaded_7_7 = reloaded_7_5[0] * reloaded_7_6[0] * 4
				local reloaded_7_8 = reloaded_0_6(reloaded_7_7)

				if reloaded_0_5(reloaded_0_2, reloaded_7_3, reloaded_7_8, reloaded_7_7) then
					local reloaded_7_9 = reloaded_0_12(reloaded_7_5[0], reloaded_7_6[0], "rgba")

					for iter_7_0 = 0, reloaded_7_5[0] - 1 do
						for iter_7_1 = 0, reloaded_7_6[0] - 1 do
							local reloaded_7_10 = iter_7_0 * (reloaded_7_6[0] * 4) + iter_7_1 * 4

							reloaded_7_9:write({
								reloaded_7_8[reloaded_7_10],
								reloaded_7_8[reloaded_7_10 + 1],
								reloaded_7_8[reloaded_7_10 + 2],
								reloaded_7_8[reloaded_7_10 + 3]
							})
						end
					end

					reloaded_7_2 = reloaded_7_9.output
				end
			end
		elseif reloaded_7_3 ~= -1 then
			reloaded_7_2 = nil
		end

		function transform(arg_8_0)
			local reloaded_8_0 = string.format("%x", arg_8_0)

			return "\\x" .. string.upper(reloaded_8_0)
		end

		if not reloaded_7_2 then
			return
		end

		for iter_7_2 = 1, #reloaded_7_2 do
			reloaded_7_4 = reloaded_7_4 .. reloaded_7_2[iter_7_2]
		end

		return (render.load_image(reloaded_7_4))
	end
}

function reloaded_0_13.create_item(arg_9_0)
	reloaded_0_13.data[arg_9_0] = {}
	reloaded_0_13.data[arg_9_0].image = nil
	reloaded_0_13.data[arg_9_0].loaded = false
end

function reloaded_0_13.cached_avatar(arg_10_0, arg_10_1)
	if reloaded_0_13.data[arg_10_0] and reloaded_0_13.data[arg_10_0].loaded then
		return reloaded_0_13.data[arg_10_0].image
	end

	if reloaded_0_13.data[arg_10_0] == nil then
		reloaded_0_13.create_item(arg_10_0)

		if arg_10_1 == nil or #arg_10_1 < 5 or reloaded_0_13.default_image == nil then
			return
		end

		reloaded_0_13.data[arg_10_0].image = reloaded_0_13.get_avatar(arg_10_1)
		reloaded_0_13.data[arg_10_0].loaded = true
	end

	return reloaded_0_13.default_image
end

function reloaded_0_13.get_steamid(arg_11_0, arg_11_1)
	return arg_11_1 and reloaded_0_8.GetPlayerXuidFromUserID(arg_11_0) or reloaded_0_8.GetPlayerXuidStringFromEntIndex(arg_11_0)
end

return {
	get_steam_avatar = reloaded_0_13.get_avatar,
	get_steam_avatar_cached = reloaded_0_13.cached_avatar,
	get_steamid = reloaded_0_13.get_steamid
}
