local neverlose_base64 = require("neverlose/base64")
local neverlose_smoothy = require("neverlose/smoothy")
local neverlose_inspect = require("neverlose/inspect")
local var1 = " "
local var2
local var3 = {}

var3.name = "Spectral"
var3.build = "Dev"
var3.date = "01.01.25"
var3.user = common.get_username()

local function var4(arg1)
	return math.floor(0.5 + arg1)
end

local var5
local var6 = {}
local ________struct_______________float_x__y__z_______________ = ffi.typeof("        struct {\n            float x, y, z;\n        }\n    ")
local ________struct_______________uint8_t_r__g__b__a_______________ = ffi.typeof("        struct {\n            uint8_t r, g, b, a;\n        }\n    ")
local var7 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 1, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, int r, int g, int b, int a, float duration)", ________struct_______________float_x__y__z_______________, ________struct_______________float_x__y__z_______________, ________struct_______________float_x__y__z_______________, ________struct_______________float_x__y__z_______________))
local var8 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 20, ffi.typeof("void(__thiscall*)(void *thisptr, const $ &origin, const $ &dest, int r, int g, int b, int a, bool noDepthTest, float duration)", ________struct_______________float_x__y__z_______________, ________struct_______________float_x__y__z_______________))
local var9 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, "void(__thiscall*)(void *thisptr, const $ &origin, const $ &mins, const $ &maxs, const $ &angles, $ *face_color, $ *edge_color, float duration)", ________struct_______________float_x__y__z_______________, ________struct_______________float_x__y__z_______________, ________struct_______________float_x__y__z_______________, ________struct_______________float_x__y__z_______________, ________struct_______________uint8_t_r__g__b__a_______________, ________struct_______________uint8_t_r__g__b__a_______________)

function var6.box(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
	arg1 = ________struct_______________float_x__y__z_______________(arg1:unpack())
	arg2 = ________struct_______________float_x__y__z_______________(arg2:unpack())
	arg3 = ________struct_______________float_x__y__z_______________(arg3:unpack())
	arg4 = ________struct_______________float_x__y__z_______________(arg4:unpack())

	var7(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
end

function var6.line(arg1, arg2, arg3, arg4, arg5)
	arg1 = ________struct_______________float_x__y__z_______________(arg1:unpack())
	arg2 = ________struct_______________float_x__y__z_______________(arg2:unpack())

	var8(arg1, arg2, arg3.r, arg3.g, arg3.b, arg3.a, arg4, arg5)
end

function var6.box_new(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
	arg1 = ________struct_______________float_x__y__z_______________(arg1:unpack())
	arg2 = ________struct_______________float_x__y__z_______________(arg2:unpack())
	arg3 = ________struct_______________float_x__y__z_______________(arg3:unpack())
	arg4 = ________struct_______________float_x__y__z_______________(arg4:unpack())
	arg5 = ________struct_______________uint8_t_r__g__b__a_______________(arg5:unpack())
	arg6 = ________struct_______________uint8_t_r__g__b__a_______________(arg6:unpack())

	var9(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
end

local var10
local var11 = {
	rage = {
		main = {
			enabled = {
				ui.find("Aimbot", "Ragebot", "Main", "Enabled"),
				ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
			},
			hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
			double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
			hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
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
			min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
			minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
		}
	},
	aa = {
		angles = {
			enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
			pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
			yaw = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
			},
			yaw_modifier = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
			},
			body_yaw = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
			},
			freestanding = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
			},
			extended_angles = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
			}
		},
		misc = {
			fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
			slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
			leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
		}
	},
	visuals = {
		world = {
			main = {
				force_thirdperson = {
					ui.find("Visuals", "World", "Main", "Force Thirdperson"),
					ui.find("Visuals", "World", "Main", "Force Thirdperson", "Distance")
				},
				scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
			},
			other = {
				world_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "3D Marker"),
				damage_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "Damage Marker"),
				grenade_prediction = {
					color = ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color"),
					color_hit = {
						ui.find("Visuals", "World", "Other", "Grenade Prediction", "Color Hit")
					}
				}
			}
		}
	},
	misc = {
		main = {
			in_game = {
				clan_tag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
			},
			other = {
				weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
			}
		}
	}
}
local var12
local var13 = {}
local char = ffi.typeof("char[?]")
local var14 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
local var15 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)")
local var16 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")

function var13.get()
	local var1 = var14()

	if var1 > 0 then
		local var2 = char(var1)

		var16(0, var2, var1)

		return ffi.string(var2, var1 - 1)
	end


	return ""
end

function var13.set(...)
	local var1 = table.concat({
		...
	})
	local var2 = string.len(var1)

	var15(var1, var2)
end

local var17
local var18 = {}

local function var19(arg1)
	local var1 = {}
	local var2 = 0

	for iter1 in arg1:gmatch(".[\x80-\xBF]*") do
		var2 = var2 + 1
		var1[var2] = iter1
	end


	return var1, var2
end

function var18.wave(arg1, arg2, arg3, arg4)
	arg4 = arg4 or globals.realtime

	local var1 = {}
	local var2, var3 = var19(arg1)
	local var4 = 1 / (var3 - 1)
	local var5 = arg3.r - arg2.r
	local var6 = arg3.g - arg2.g
	local var7 = arg3.b - arg2.b
	local var8 = arg3.a - arg2.a
	local var9 = color():alpha_modulate(255)

	for iter1 = 1, var3 do
		local var10 = math.abs((arg4 - 1) % 2 - 1)

		var9.r = arg2.r + var5 * var10
		var9.g = arg2.g + var6 * var10
		var9.b = arg2.b + var7 * var10
		var9.a = arg2.a + var8 * var10

		local var11 = "\a" .. var9:to_hex() .. var2[iter1]

		table.insert(var1, var11)

		arg4 = arg4 + var4
	end


	return table.concat(var1)
end

local var20
local var21 = {}
local var22 = var3.name:lower()
local var23 = "ui/beepclear.wav"
local var24 = "resource/warning.wav"
local var25 = cvar.playvol

local function var26(arg1)
	if arg1 == nil then
		arg1 = "{Link Active}"
	end


	return "[" .. "\a" .. arg1 .. var22 .. "\aDEFAULT" .. "]"
end

function var21.err(arg1, ...)
	local var1 = table.concat({
		var26(),
		"",
		arg1,
		...
	})

	print_raw(var1)
	var25:call(var24, 1)
end

function var21.msg(arg1, ...)
	local var1 = table.concat({
		var26(),
		" ",
		arg1,
		...
	})

	print_raw(var1)
	var25:call(var23, 1)
end

function var21.raw(arg1, ...)
	local var1 = table.concat({
		var26(),
		" ",
		arg1,
		...
	})

	print_raw(var1)
end

local var27
local var28 = {}
local var29 = var3.name:lower() .. "-db"
local var30 = db[var29] or {}

function var28.get(arg1)
	return var30[arg1]
end

function var28.set(arg1, arg2)
	var30[arg1] = arg2
end

function var28.flush()
	var30 = {}
	db[var29] = {}
end

local function var31()
	db[var29] = var30
end

events.shutdown(var31)

local var32
local var33 = {}
local var34 = 0
local var35 = 0

var33.is_onground = false
var33.is_moving = false
var33.is_crouched = false
var33.abs_body_yaw = 0
var33.velocity2d = 0
var33.duck_amount = 0
var33.eye_position = vector()
var33.team_num = 0
var33.sent_packets = 0

local function var36(arg1, arg2)
	local var1 = arg1:get_anim_state()

	if var1 == nil then
		return 0
	end


	local var2 = math.normalize_yaw(var1.eye_yaw - var1.abs_yaw)

	if arg2 ~= nil then
		var2 = math.clamp(var2, -arg2, arg2)
	end


	return var2
end

local function var37(arg1)
	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	var34 = var1.m_fFlags
	var33.velocity2d = var1.m_vecVelocity:length2d()

	if arg1.choked_commands == 0 then
		local var2 = rage.antiaim:get_max_desync()

		var33.max_body_yaw = var2
		var33.abs_body_yaw = var36(var1, var2)
		var33.duck_amount = var1.m_flDuckAmount
		var33.eye_position = var1:get_eye_position()
		var33.sent_packets = var33.sent_packets + 1
	end


	var33.is_moving = var33.velocity2d > 3.63
	var33.is_crouched = var33.duck_amount > 0
	var33.team_num = var1.m_iTeamNum
end

local function var38(arg1)
	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	var35 = var1.m_fFlags
	var33.is_onground = bit.band(var34, 1) == 1 and bit.band(var35, 1) == 1
end

events.createmove(var37)
events.createmove_run(var38)

local var39
local var40 = {}
local var41 = 0

var40.max_defensive_ticks = 0
var40.defensive_ticks = 0

local function var42(arg1)
	local var1 = arg1.m_nTickBase

	if math.abs(var1 - var41) > 64 then
		var41 = 0
	end


	local var2 = 0

	if var1 > var41 then
		var41 = var1
	elseif var1 < var41 then
		var2 = math.min(14, math.max(0, var41 - var1 - 1))
	end


	if var2 > 0 then
		if var40.max_defensive_ticks == 0 then
			var40.max_defensive_ticks = var2
		end


		var40.defensive_ticks = var2
	else
		var40.defensive_ticks = 0
		var40.max_defensive_ticks = 0
	end
end

local function var43()
	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	var42(var1)
end

events.createmove(var43)

local var44
local var45 = {}
local var46

local function var47()
	if var33.is_onground then
		if var11.aa.misc.slow_walk:get() then
			return "Slow Walk"
		end


		if not var33.is_moving then
			if var33.is_crouched then
				return "Crouch"
			end


			return "Standing"
		end


		if var33.is_crouched then
			return "Crouch Move"
		end


		return "Moving"
	end


	return var33.is_crouched and "Air Crouch" or "Air"
end

local function var48()
	var46 = var47()
end

function var45.get()
	return var46
end

events.createmove(var48)

local var49
local var50 = {}
local var51 = {}
local var52 = {}

local function var53(arg1, arg2)
	return arg1:lower() .. "::" .. arg2
end

local function var54(...)
	local var1 = {}
	local var2 = true
	local var3 = select("#", ...)

	if var3 > 0 then
		for iter1 = 1, var3 do
			var1[select(iter1, ...)] = iter1
		end


		var2 = false
	end


	return var1, var2
end

local function var55(arg1)
	if arg1:type() == "color_picker" then
		local var1 = arg1:list()
		local var2 = {
			arg1:get()
		}

		if var1[1] == "" then
			return {
				"",
				var2:to_hex()
			}
		end


		local var3 = {}

		for iter1 = 1, #var1 do
			local var4 = var1[iter1]
			local var5 = arg1:get(var4)
			local var6 = {}

			for iter2 = 1, #var5 do
				var6[iter2] = var5[iter2]:to_hex()
			end


			var3[var4] = var6
		end


		return {
			var2[1],
			var3
		}
	end


	return {
		arg1:get()
	}
end

local function var56(arg1, arg2)
	if arg1:type() == "color_picker" then
		if arg2[1] == "" then
			arg1:set(color(arg2[2]))

			return
		end


		for iter1, iter2 in pairs(arg2[2]) do
			local var1 = {}

			for iter3 = 1, #iter2 do
				var1[iter3] = color(iter2[iter3])
			end


			arg1:set(iter1, var1)
		end


		arg1:set(arg2[1])

		return
	end


	pcall(arg1.set, arg1, unpack(arg2))
end

function var50.encode(arg1)
	local var1, var2 = pcall(json.stringify, arg1)

	if not var1 then
		return false, var2
	end


	local var3, var4 = pcall(neverlose_base64.encode, var2)

	if not var3 then
		return false, var4
	end


	return true, var4
end

function var50.decode(arg1)
	local var1, var2 = pcall(neverlose_base64.decode, arg1)

	if not var1 then
		return false, var2
	end


	local var3, var4 = pcall(json.parse, var2)

	if not var3 then
		return false, var4
	end


	return true, var4
end

function var50.import(arg1, ...)
	local var1, var2 = var54(...)

	for iter1, iter2 in pairs(arg1) do
		local var3 = var52[iter1]

		if var3 == nil then
			-- block empty
		elseif not var2 and not var1[var3.category] then
			-- block empty
		else
			var56(var3.ref, iter2)
		end
	end


	return true
end

function var50.export(...)
	local var1 = {}
	local var2, var3 = var54(...)

	for iter1 = 1, #var51 do
		local var4 = var51[iter1]
		local var5 = var4.ref
		local var6 = var4.hash
		local var7 = var4.category

		if not var3 and not var2[var7] then
			-- block empty
		else
			local var8, var9 = pcall(var55, var5)

			if not var8 then
				-- block empty
			else
				var1[var6] = var9
			end
		end
	end


	return true, var1
end

function var50.push(arg1, arg2, arg3)
	local var1 = var53(arg1, arg2)
	local var2 = {
		ref = arg3,
		hash = var1,
		category = arg1
	}

	if var52[var1] == nil then
		var52[var1] = var2
	else
		var21.err("Found config collision: \"" .. arg2 .. "\" for \"" .. arg3:name() .. "\" item")
	end


	table.insert(var51, var2)

	return arg3
end

local var57
local var58 = {}
local var59 = "everlast-presets"
local var60 = {}
local var61 = {}
local var62 = db[var59] or {}

local function var63(arg1)
	return string.match(arg1, "^()%s*$") and "" or string.match(arg1, "^%s*(.*%S)")
end

local function var64(arg1, arg2)
	local var1 = {}

	if type(arg2) == "string" then
		local var2, var3 = var50.decode(arg2)

		if not var2 then
			return nil
		end


		arg2 = var3
	end


	var1.name = arg1
	var1.content = arg2

	return var1
end

local function var65(arg1)
	local var1, var2 = var50.export()

	if not var1 then
		return nil
	end


	return var64(arg1, var2)
end

local function var66(arg1)
	for iter1 = #var61, 1, -1 do
		local var1 = var61[iter1]

		if var1.name == arg1 then
			return var1, iter1
		end
	end


	return nil, -1
end

local function var67()
	db[var59] = var62
end

function var58.load(arg1)
	arg1 = var63(arg1)

	local var1 = var66(arg1)

	if var1 == nil or var1.content == nil then
		return
	end


	if not var50.import(var1.content) then
		return
	end


	var21.msg("Config loaded")
end

function var58.save(arg1)
	arg1 = var63(arg1)

	local var1, var2 = var66(arg1)

	if var1 == nil then
		local var3 = var65(arg1)

		if var3 == nil then
			return false, "Unable to create new preset"
		end


		var1 = var3

		table.insert(var62, var3)
	end


	if var2 ~= -1 and var2 <= #var60 then
		return false, "Can't modify in-built preset"
	end


	local var4, var5 = var50.export()

	if not var4 then
		return false, "Unable to export config"
	end


	var1.content = var5

	var67()

	return true, nil
end

function var58.delete(arg1)
	arg1 = var63(arg1)

	local var1, var2 = var66(arg1)

	if var2 ~= -1 and var2 <= #var60 then
		return false, "Can't delete in-built preset"
	end


	local var3 = var2 - #var60

	table.remove(var62, var3)

	return true, nil
end

function var58.get(arg1)
	return var61[arg1]
end

function var58.get_list()
	local var1 = #var61

	if var1 == 0 then
		return {
			"Profiles are empty"
		}
	end


	local var2 = {}

	for iter1 = 1, var1 do
		local var3 = var61[iter1].name

		if iter1 <= #var60 then
			var3 = "\a{Link Active}" .. ui.get_icon("sparkles") .. "  " .. "\aDEFAULT" .. var3
		end


		var2[iter1] = var3
	end


	return var2
end

function var58.update_data()
	var61 = {}

	for iter1 = 1, #var60 do
		table.insert(var61, var60[iter1])
	end


	table.sort(var62, function(arg1, arg2)
		return arg1.name < arg2.name
	end)

	for iter2 = 1, #var62 do
		table.insert(var61, var62[iter2])
	end
end

table.insert(var60, var64("Author", "eyJhbnRpLWFpbTo6QWlyIENyb3VjaF9ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF9kZWxheSI6WzAuMF0sImFudGktYWltOjpBaXIgQ3JvdWNoX2VuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OkFpciBDcm91Y2hfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF9sZWZ0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpBaXIgQ3JvdWNoX21vZGlmaWVyX29mZnNldCI6Wy01MS4wXSwiYW50aS1haW06OkFpciBDcm91Y2hfb3B0aW9ucyI6W1siSml0dGVyIl1dLCJhbnRpLWFpbTo6QWlyIENyb3VjaF9waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpBaXIgQ3JvdWNoX3JpZ2h0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpBaXIgQ3JvdWNoX3lhdyI6WyJCYWNrd2FyZCJdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF95YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06OkFpciBDcm91Y2hfeWF3X2xlZnQiOlszLjBdLCJhbnRpLWFpbTo6QWlyIENyb3VjaF95YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpBaXIgQ3JvdWNoX3lhd19yaWdodCI6WzEzLjBdLCJhbnRpLWFpbTo6QWlyX2JvZHlfeWF3IjpbdHJ1ZV0sImFudGktYWltOjpBaXJfZGVsYXkiOlswLjBdLCJhbnRpLWFpbTo6QWlyX2VuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OkFpcl9mcmVlc3RhbmRpbmciOlsiT2ZmIl0sImFudGktYWltOjpBaXJfbGVmdF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6QWlyX21vZGlmaWVyX29mZnNldCI6WzEzLjBdLCJhbnRpLWFpbTo6QWlyX29wdGlvbnMiOltbIkppdHRlciJdXSwiYW50aS1haW06OkFpcl9waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpBaXJfcmlnaHRfbGltaXQiOls2MC4wXSwiYW50aS1haW06OkFpcl95YXciOlsiQmFja3dhcmQiXSwiYW50aS1haW06OkFpcl95YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06OkFpcl95YXdfbGVmdCI6Wy00MC4wXSwiYW50aS1haW06OkFpcl95YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpBaXJfeWF3X3JpZ2h0IjpbMzAuMF0sImFudGktYWltOjpDcm91Y2ggTW92ZV9ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfZGVsYXkiOls0LjBdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfbGVmdF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfbW9kaWZpZXJfb2Zmc2V0IjpbLTQ2LjBdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfb3B0aW9ucyI6W1siSml0dGVyIl1dLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfcGl0Y2giOlsiRG93biJdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfcmlnaHRfbGltaXQiOls2MC4wXSwiYW50aS1haW06OkNyb3VjaCBNb3ZlX3lhdyI6WyJCYWNrd2FyZCJdLCJhbnRpLWFpbTo6Q3JvdWNoIE1vdmVfeWF3X2Jhc2UiOlsiQXQgVGFyZ2V0Il0sImFudGktYWltOjpDcm91Y2ggTW92ZV95YXdfbGVmdCI6WzAuMF0sImFudGktYWltOjpDcm91Y2ggTW92ZV95YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpDcm91Y2ggTW92ZV95YXdfcmlnaHQiOlsxMy4wXSwiYW50aS1haW06OkNyb3VjaF9ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6Q3JvdWNoX2RlbGF5IjpbMi4wXSwiYW50aS1haW06OkNyb3VjaF9lbmFibGVkIjpbdHJ1ZV0sImFudGktYWltOjpDcm91Y2hfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6Q3JvdWNoX2xlZnRfbGltaXQiOls2MC4wXSwiYW50aS1haW06OkNyb3VjaF9tb2RpZmllcl9vZmZzZXQiOls0Ni4wXSwiYW50aS1haW06OkNyb3VjaF9vcHRpb25zIjpbWyJKaXR0ZXIiXV0sImFudGktYWltOjpDcm91Y2hfcGl0Y2giOlsiRG93biJdLCJhbnRpLWFpbTo6Q3JvdWNoX3JpZ2h0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpDcm91Y2hfeWF3IjpbIkJhY2t3YXJkIl0sImFudGktYWltOjpDcm91Y2hfeWF3X2Jhc2UiOlsiQXQgVGFyZ2V0Il0sImFudGktYWltOjpDcm91Y2hfeWF3X2xlZnQiOlstMTkuMF0sImFudGktYWltOjpDcm91Y2hfeWF3X21vZGlmaWVyIjpbIkRpc2FibGVkIl0sImFudGktYWltOjpDcm91Y2hfeWF3X3JpZ2h0IjpbNDYuMF0sImFudGktYWltOjpNb3ZpbmdfYm9keV95YXciOlt0cnVlXSwiYW50aS1haW06Ok1vdmluZ19kZWxheSI6WzAuMF0sImFudGktYWltOjpNb3ZpbmdfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6TW92aW5nX2ZyZWVzdGFuZGluZyI6WyJPZmYiXSwiYW50aS1haW06Ok1vdmluZ19sZWZ0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpNb3ZpbmdfbW9kaWZpZXJfb2Zmc2V0IjpbLTI0LjBdLCJhbnRpLWFpbTo6TW92aW5nX29wdGlvbnMiOltbIkppdHRlciJdXSwiYW50aS1haW06Ok1vdmluZ19waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpNb3ZpbmdfcmlnaHRfbGltaXQiOls2MC4wXSwiYW50aS1haW06Ok1vdmluZ195YXciOlsiQmFja3dhcmQiXSwiYW50aS1haW06Ok1vdmluZ195YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06Ok1vdmluZ195YXdfbGVmdCI6Wy0yNS4wXSwiYW50aS1haW06Ok1vdmluZ195YXdfbW9kaWZpZXIiOlsiQ2VudGVyIl0sImFudGktYWltOjpNb3ZpbmdfeWF3X3JpZ2h0IjpbMzAuMF0sImFudGktYWltOjpTbG93IFdhbGtfYm9keV95YXciOlt0cnVlXSwiYW50aS1haW06OlNsb3cgV2Fsa19kZWxheSI6WzIuMF0sImFudGktYWltOjpTbG93IFdhbGtfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX2ZyZWVzdGFuZGluZyI6WyJPZmYiXSwiYW50aS1haW06OlNsb3cgV2Fsa19sZWZ0X2xpbWl0IjpbNjAuMF0sImFudGktYWltOjpTbG93IFdhbGtfbW9kaWZpZXJfb2Zmc2V0IjpbLTguMF0sImFudGktYWltOjpTbG93IFdhbGtfb3B0aW9ucyI6W1siSml0dGVyIl1dLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3BpdGNoIjpbIkRvd24iXSwiYW50aS1haW06OlNsb3cgV2Fsa19yaWdodF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3lhdyI6WyJCYWNrd2FyZCJdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3lhd19iYXNlIjpbIkxvY2FsIFZpZXciXSwiYW50aS1haW06OlNsb3cgV2Fsa195YXdfbGVmdCI6WzAuMF0sImFudGktYWltOjpTbG93IFdhbGtfeWF3X21vZGlmaWVyIjpbIkNlbnRlciJdLCJhbnRpLWFpbTo6U2xvdyBXYWxrX3lhd19yaWdodCI6WzAuMF0sImFudGktYWltOjpTdGFuZGluZ19ib2R5X3lhdyI6W3RydWVdLCJhbnRpLWFpbTo6U3RhbmRpbmdfZGVsYXkiOlsxLjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6U3RhbmRpbmdfZnJlZXN0YW5kaW5nIjpbIk9mZiJdLCJhbnRpLWFpbTo6U3RhbmRpbmdfbGVmdF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfbW9kaWZpZXJfb2Zmc2V0IjpbMjQuMF0sImFudGktYWltOjpTdGFuZGluZ19vcHRpb25zIjpbWyJKaXR0ZXIiXV0sImFudGktYWltOjpTdGFuZGluZ19waXRjaCI6WyJEb3duIl0sImFudGktYWltOjpTdGFuZGluZ19yaWdodF9saW1pdCI6WzYwLjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfeWF3IjpbIkJhY2t3YXJkIl0sImFudGktYWltOjpTdGFuZGluZ195YXdfYmFzZSI6WyJBdCBUYXJnZXQiXSwiYW50aS1haW06OlN0YW5kaW5nX3lhd19sZWZ0IjpbLTM1LjBdLCJhbnRpLWFpbTo6U3RhbmRpbmdfeWF3X21vZGlmaWVyIjpbIkRpc2FibGVkIl0sImFudGktYWltOjpTdGFuZGluZ195YXdfcmlnaHQiOlszMC4wXSwiYW50aS1haW06OmFuaW1hdGlvbnMuZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6YW5pbWF0aW9ucy5sZWdhY3lhbmltYXRpb25zIjpbMjQ1NTE1OTU3OC4wXSwiYW50aS1haW06OmFuaW1hdGlvbnMubW9vbl93YWxrX2luX2Fpcl9tb2RlIjpbZmFsc2VdLCJhbnRpLWFpbTo6YW5pbWF0aW9ucy5tb29uX3dhbGtfbW9kZSI6W2ZhbHNlXSwiYW50aS1haW06OmFuaW1hdGlvbnMubW92ZV9sZWFuX2ZvcmNlIjpbMTAwLjBdLCJhbnRpLWFpbTo6YW5pbWF0aW9ucy5vbl9ncm91bmRfZm9yY2UiOlt0cnVlXSwiYW50aS1haW06OmFuaW1hdGlvbnMub3B0aW9ucyI6W1siTW92ZSBMZWFuIl1dLCJhbnRpLWFpbTo6YW50aWFpbV9vbl91c2UuZV9maXgiOlt0cnVlXSwiYW50aS1haW06OmFudGlhaW1fb25fdXNlLmVuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmF2b2lkX2JhY2tzdGFiLmVuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmJ1aWxkZXIuY29uZGl0aW9uIjpbIk1vdmluZyJdLCJhbnRpLWFpbTo6YnVpbGRlci5lbmFibGVkIjpbdHJ1ZV0sImFudGktYWltOjpkZWZlbnNpdmUuY29uZGl0aW9uIjpbIkNyb3VjaCJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlLmVuYWJsZWQiOltmYWxzZV0sImFudGktYWltOjpkZWZlbnNpdmVfQWlyIENyb3VjaF9lbmFibGVkIjpbdHJ1ZV0sImFudGktYWltOjpkZWZlbnNpdmVfQWlyIENyb3VjaF9waXRjaCI6WyJQcm9ncmVzc2l2ZSJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX0FpciBDcm91Y2hfcGl0Y2hfb2Zmc2V0IjpbMC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXIgQ3JvdWNoX3lhdyI6WyJKaXR0ZXIiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXIgQ3JvdWNoX3lhd19vZmZzZXQiOls3OC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXJfZW5hYmxlZCI6W2ZhbHNlXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXJfcGl0Y2giOlsiUHJvZ3Jlc3NpdmUiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9BaXJfcGl0Y2hfb2Zmc2V0IjpbMjUuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQWlyX3lhdyI6WyJQb3Zvcm90bmlraSJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX0Fpcl95YXdfb2Zmc2V0IjpbNzMuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoIE1vdmVfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX0Nyb3VjaCBNb3ZlX3BpdGNoIjpbIlByb2dyZXNzaXZlIl0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoIE1vdmVfcGl0Y2hfb2Zmc2V0IjpbMC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2ggTW92ZV95YXciOlsiUG92b3JvdG5pa2kiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2ggTW92ZV95YXdfb2Zmc2V0IjpbMzAuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoX2VuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2hfcGl0Y2giOlsiVXAiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Dcm91Y2hfcGl0Y2hfb2Zmc2V0IjpbLTkuMF0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoX3lhdyI6WyJQcm9ncmVzc2l2ZSBTcGluIl0sImFudGktYWltOjpkZWZlbnNpdmVfQ3JvdWNoX3lhd19vZmZzZXQiOlstMy4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Nb3ZpbmdfZW5hYmxlZCI6W2ZhbHNlXSwiYW50aS1haW06OmRlZmVuc2l2ZV9Nb3ZpbmdfcGl0Y2giOlsiRGVmYXVsdCJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX01vdmluZ19waXRjaF9vZmZzZXQiOlswLjBdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX01vdmluZ195YXciOlsiRGVmYXVsdCJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX01vdmluZ195YXdfb2Zmc2V0IjpbMC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TbG93IFdhbGtfZW5hYmxlZCI6W3RydWVdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1Nsb3cgV2Fsa19waXRjaCI6WyJQcm9ncmVzc2l2ZSJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1Nsb3cgV2Fsa19waXRjaF9vZmZzZXQiOlswLjBdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1Nsb3cgV2Fsa195YXciOlsiUG92b3JvdG5pa2kiXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TbG93IFdhbGtfeWF3X29mZnNldCI6Wy0yNC4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TdGFuZGluZ19lbmFibGVkIjpbZmFsc2VdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1N0YW5kaW5nX3BpdGNoIjpbIlplcm8iXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TdGFuZGluZ19waXRjaF9vZmZzZXQiOls4OS4wXSwiYW50aS1haW06OmRlZmVuc2l2ZV9TdGFuZGluZ195YXciOlsiU3BpbiJdLCJhbnRpLWFpbTo6ZGVmZW5zaXZlX1N0YW5kaW5nX3lhd19vZmZzZXQiOlsyNS4wXSwiYW50aS1haW06OmVkZ2VfeWF3LmVuYWJsZWQiOltmYWxzZV0sImFudGktYWltOjpmb3JjZV9kZWZlbnNpdmUuY29uZGl0aW9ucyI6W1siU2xvdyBXYWxrIiwiQWlyIiwiQWlyIENyb3VjaCIsIkNyb3VjaCIsIkNyb3VjaCBNb3ZlIl1dLCJhbnRpLWFpbTo6Zm9yY2VfZGVmZW5zaXZlLmVuYWJsZWQiOlt0cnVlXSwiYW50aS1haW06OmZyZWVzdGFuZGluZy5ib2R5X2ZyZWVzdGFuZGluZyI6W2ZhbHNlXSwiYW50aS1haW06OmZyZWVzdGFuZGluZy5kaXNhYmxlX3lhd19tb2RpZmllcnMiOltmYWxzZV0sImFudGktYWltOjpmcmVlc3RhbmRpbmcuZW5hYmxlZCI6W2ZhbHNlXSwiYW50aS1haW06Om1hbnVhbF95YXcuYm9keV9mcmVlc3RhbmRpbmciOltmYWxzZV0sImFudGktYWltOjptYW51YWxfeWF3LmRpc2FibGVfYWxsX21vZGlmaWVycyI6W2ZhbHNlXSwiYW50aS1haW06Om1hbnVhbF95YXcuZGlzYWJsZV95YXdfbW9kaWZpZXJzIjpbdHJ1ZV0sImFudGktYWltOjptYW51YWxfeWF3LnNlbGVjdCI6WyJEaXNhYmxlZCJdLCJhbnRpLWFpbTo6c2FmZV9oZWFkLmNvbmRpdGlvbnMiOltbIktuaWZlIl1dLCJhbnRpLWFpbTo6c2FmZV9oZWFkLmVuYWJsZWQiOlt0cnVlXSwibW92ZW1lbnQ6OmZhc3RfbGFkZGVyLmVuYWJsZWQiOlt0cnVlXSwib3RoZXI6OmNsYW50YWcuZW5hYmxlZCI6W2ZhbHNlXSwib3RoZXI6OnBpbmdfc3Bpa2UuZW5hYmxlZCI6W2ZhbHNlXSwib3RoZXI6OnBpbmdfc3Bpa2UudmFsdWUiOlsxMDAwLjBdLCJvdGhlcjo6dmlld21vZGVsLmVuYWJsZWQiOltmYWxzZV0sIm90aGVyOjp2aWV3bW9kZWwuZm92IjpbNjgwLjBdLCJvdGhlcjo6dmlld21vZGVsLm9mZnNldF94IjpbMjUuMF0sIm90aGVyOjp2aWV3bW9kZWwub2Zmc2V0X3kiOlswLjBdLCJvdGhlcjo6dmlld21vZGVsLm9mZnNldF96IjpbLTE1LjBdLCJvdGhlcjo6dmlld21vZGVsLm9wcG9zaXRlX2tuaWZlX2hhbmQiOlt0cnVlXSwicmFnZWJvdDo6YWltYm90X2xvZ3MuZW5hYmxlZCI6W3RydWVdLCJyYWdlYm90OjphaW1ib3RfbG9ncy5vdXRwdXQiOltbIkNvbnNvbGUiLCJOb3RpZnkiLCJTY3JlZW4iXV0sInJhZ2Vib3Q6OmRvcm1hbnRfYWltYm90LmF1dG9fc2NvcGUiOlt0cnVlXSwicmFnZWJvdDo6ZG9ybWFudF9haW1ib3QuZGFtYWdlIjpbNS4wXSwicmFnZWJvdDo6ZG9ybWFudF9haW1ib3QuZW5hYmxlZCI6W3RydWVdLCJyYWdlYm90Ojpkb3JtYW50X2FpbWJvdC5oaXRib3hlcyI6W1siSGVhZCIsIkNoZXN0IiwiU3RvbWFjaCIsIkxlZ3MiXV0sInJhZ2Vib3Q6OmRvcm1hbnRfYWltYm90LmhpdGNoYW5jZSI6WzY4LjBdLCJyYWdlYm90OjpncmVuYWRlX3Rocm93X2ZpeC5lbmFibGVkIjpbdHJ1ZV0sInJhZ2Vib3Q6Om5vX2ZhbGxfZGFtYWdlLmVuYWJsZWQiOlt0cnVlXSwicmFnZWJvdDo6cHJlZGljdF9lbmVtaWVzLmVuYWJsZWQiOltmYWxzZV0sInJhZ2Vib3Q6OnN1cGVyX3Rvc3MuZW5hYmxlZCI6W3RydWVdLCJ2aXN1YWxzOjphbnRpYWltX2Fycm93cy5jb2xvciI6WyJNYW51YWwiLHsiRGVzeW5jIjpbIjIxQTNERUZGIl0sIk1hbnVhbCI6WyJGRkZGRkZGRiJdfV0sInZpc3VhbHM6OmFudGlhaW1fYXJyb3dzLmVuYWJsZWQiOlt0cnVlXSwidmlzdWFsczo6YW50aWFpbV9hcnJvd3MudHlwZSI6WyJEZWZhdWx0Il0sInZpc3VhbHM6OmFzcGVjdF9yYXRpby5lbmFibGVkIjpbZmFsc2VdLCJ2aXN1YWxzOjphc3BlY3RfcmF0aW8udmFsdWUiOlsxNDUuMF0sInZpc3VhbHM6OmRhbWFnZV9pbmRpY2F0b3IuZW5hYmxlZCI6W2ZhbHNlXSwidmlzdWFsczo6ZGFtYWdlX2luZGljYXRvci5mb250IjpbIkRlZmF1bHQiXSwidmlzdWFsczo6Zm92YW5pbWF0aW9ucy5lbmFibGVkIjpbZmFsc2VdLCJ2aXN1YWxzOjpmb3ZhbmltYXRpb25zLnNlbGVjdCI6W1siRmlyc3QgUGVyc29uIiwiVGhpcmQgUGVyc29uIl1dLCJ2aXN1YWxzOjpnc19pbmRpY2F0b3JzLmVuYWJsZWQiOlt0cnVlXSwidmlzdWFsczo6Z3NfaW5kaWNhdG9ycy5saXN0IjpbWyJNaW5pbXVtIGRhbWFnZSIsIkRvcm1hbnQgQWltYm90IiwiSGl0Y2hhbmNlIG92ZXJyaWRlIiwiRmFrZSBMYXRlbmN5IiwiRmFrZSBEdWNrIiwiRnJlZXN0YW5kaW5nIiwiQm9tYiBJbmZvcm1hdGlvbiIsIkhpZGUgU2hvdHMiLCJEb3VibGUgVGFwIl1dLCJ2aXN1YWxzOjpoaXRfbWFya2VyLmVuYWJsZWQiOlt0cnVlXSwidmlzdWFsczo6aW5kaWNhdGVfc3RhdGUuZW5hYmxlZCI6W3RydWVdLCJ2aXN1YWxzOjppbmRpY2F0ZV9zdGF0ZS5vZmZzZXQiOlsyNC4wXSwidmlzdWFsczo6aW5kaWNhdGVfc3RhdGUudHlwZSI6WyJBbHRlcm5hdGl2ZSJdLCJ2aXN1YWxzOjpraWJpdF9tYXJrZXIuY29sb3IiOlsiVmVydGljYWwiLHsiSG9yaXpvbnRhbCI6WyIwMEZGRkZGRiJdLCJWZXJ0aWNhbCI6WyIwMEZGMDBGRiJdfV0sInZpc3VhbHM6OmtpYml0X21hcmtlci5lbmFibGVkIjpbZmFsc2VdLCJ2aXN1YWxzOjpsYWJlbC5lbmFibGVkIjpbMjAxNjk2MjI2Mi4wXSwidmlzdWFsczo6c2NvcGVfb3ZlcmxheS5lbmFibGVkIjpbdHJ1ZV0sInZpc3VhbHM6OnNjb3BlX292ZXJsYXkub2Zmc2V0IjpbNi4wXSwidmlzdWFsczo6c2NvcGVfb3ZlcmxheS5wb3NpdGlvbiI6WzExMi4wXSwidmlzdWFsczo6c2NvcGVfb3ZlcmxheS50X3N0eWxlIjpbZmFsc2VdLCJ2aXN1YWxzOjp3YXRlcm1hcmsuY29sb3IiOlsiR3JhZGllbnQiLHsiR3JhZGllbnQiOlsiRkZGRkZGMDAiLCIyRTJFMkUwMCJdLCJTaW5nbGUiOlsiRkZGRkZGQzgiXX1dLCJ2aXN1YWxzOjp3YXRlcm1hcmsucG9zaXRpb24iOlsiQm90dG9tIl0sInZpc3VhbHM6OndhdGVybWFyay5yZW1vdmFscyI6W1siU3BhY2VzIiwiQnVpbGQiXV19"))
var58.update_data()
events.shutdown(var67)

local var68
local var69 = {}
local var70 = ui.create("Windows"):visibility(false)
local var71 = {}
local var72
local var73

local function var74(arg1)
	local var1, var2 = pcall(json.parse, arg1)

	return var1 and var2 or nil
end

local function var75(arg1, arg2, arg3)
	return arg1.x >= arg2.x and arg1.x <= arg3.x and arg1.y >= arg2.y and arg1.y <= arg3.y
end

local var76 = {
	mouse_pos = vector(),
	mouse_pos_prev = vector()
}

var76.mouse_down = false
var76.mouse_clicked = false
var76.mouse_down_duration = 0
var76.mouse_delta = vector()
var76.mouse_clicked_pos = vector()

function var76.update_mouse_inputs()
	local var1 = globals.frametime
	local var2 = ui.get_mouse_position()
	local var3 = common.is_button_down(1)

	var76.mouse_pos_prev = var76.mouse_pos
	var76.mouse_pos = var2
	var76.mouse_delta = var76.mouse_pos - var76.mouse_pos_prev
	var76.mouse_down = var3
	var76.mouse_clicked = var3 and var76.mouse_down_duration < 0
	var76.mouse_down_duration = var3 and (var76.mouse_down_duration < 0 and 0 or var76.mouse_down_duration + var1) or -1

	if var76.mouse_clicked then
		var76.mouse_clicked_pos = var76.mouse_pos
	end
end

local var77 = {}

var77.__index = var77

function var77.__new(arg1, arg2, arg3)
	local var1 = var70:value(arg2, "{ }")
	local var2 = var74(var1:get())
	local var3 = vector(0, 0)
	local var4 = vector(0, 0)
	local var5 = vector(0, 0)

	if type(arg3) == "table" then
		if arg3.pos ~= nil then
			var3.x = arg3.pos.x or 0
			var3.y = arg3.pos.y or 0
		end


		if arg3.size ~= nil then
			var4.x = arg3.size.x or 0
			var4.y = arg3.size.y or 0
		end


		if arg3.anchor ~= nil then
			var5.x = arg3.anchor.x or 0
			var5.y = arg3.anchor.y or 0
		end
	end


	if var2 ~= nil and var2.pos ~= nil then
		var3.x = var2.pos.x or 0
		var3.y = var2.pos.y or 0
	end


	local var6 = {
		is_active = true,
		is_dragged = false,
		is_hovered = false,
		item = var1,
		name = arg2,
		pos = var3,
		size = var4,
		anchor = var5
	}

	table.insert(var71, var6)

	return setmetatable(var6, arg1)
end

function var77.get_pos(arg1)
	return arg1.pos
end

function var77.get_size(arg1)
	return arg1.size
end

function var77.get_anchor(arg1)
	return arg1.anchor
end

function var77.set_pos(arg1, arg2)
	local var1 = arg2:clone()

	if arg1.pos ~= var1 then
		local var2 = vector(var1.x + arg1.size.x * arg1.anchor.x, var1.y + arg1.size.y * arg1.anchor.y)
		local var3 = {
			pos = {
				x = var2.x,
				y = var2.y
			}
		}

		arg1.item:set(json.stringify(var3))
	end


	arg1.pos = var1

	return arg1
end

function var77.set_size(arg1, arg2)
	local var1 = arg2 - arg1.size
	local var2 = arg1.pos - var1 * arg1.anchor

	arg1.size = arg2

	arg1:set_pos(var2)

	return arg1
end

function var77.set_anchor(arg1, arg2)
	arg1.anchor = arg2

	return arg1
end

local function var78()
	local var1

	if ui.get_alpha() > 0 then
		for iter1 = 1, #var71 do
			local var2 = var71[iter1]
			local var3 = var2.pos
			local var4 = var2.size

			if not var2.is_active then
				-- block empty
			elseif not var75(var76.mouse_pos, var3, var3 + var4) then
				-- block empty
			else
				var1 = var2
			end
		end
	end


	var72 = var1
end

local function var79()
	if not var76.mouse_down then
		var73 = nil

		return
	end


	if var76.mouse_clicked and var72 ~= nil then
		var73 = var72
	end
end

local function var80()
	for iter1 = 1, #var71 do
		local var1 = var71[iter1]

		var1.is_dragged = false
		var1.is_hovered = false
	end
end

local function var81()
	if var72 == nil then
		return
	end


	var72.is_hovered = true
end

local function var82()
	if var73 == nil then
		return
	end


	local var1 = var73.pos + var76.mouse_delta

	var73:set_pos(var1)

	var73.is_dragged = true
end

local function var83()
	var76.update_mouse_inputs()
	var78()
	var79()
	var80()
	var81()
	var82()
end

local function var84(arg1)
	if not (var73 ~= nil or var72 ~= nil) then
		return
	end


	arg1.in_attack = false
	arg1.in_attack2 = false
end

function var69.new(arg1, arg2)
	return var77:__new(arg1, arg2)
end

events.render(var83)
events.createmove(var84)

local var85
local var86 = {}
local var87 = 1
local var88 = 2
local var89 = 3

local function var90(arg1)
	return var1:rep(arg1)
end

local function var91(arg1, arg2, arg3, arg4)
	return var90(arg3) .. "\a{Link Active}" .. arg1 .. var90(arg4) .. "\aDEFAULT" .. arg2
end

local function var92(arg1, arg2, arg3)
	return var90(arg3) .. "\a{Link Active}" .. arg1 .. var90(4) .. "\aDEFAULT" .. arg2 .. var90(arg3)
end

local function var93(arg1, arg2, arg3)
	local var1 = var90(arg2) .. arg1 .. var90(arg2)

	if arg3 ~= nil then
		var1 = var1 .. arg3
	end


	return var1
end

local function var94(arg1)
	return function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL(arg1)
	end
end

local var95 = {}
local var96 = ui.get_icon("sparkles")
local var97 = var3.name

local function var98()
	local var1 = ui.get_style()
	local var2 = var18.wave(var97, var1["Link Active"], var1["Disabled Text"], globals.realtime)

	ui.sidebar(var2, var96)
end

events.render(var98)

local var99 = {}
local var100 = {}
local var101 = ui.get_icon("house")

var100.controls = ui.create(var101, "##CONTROLS", var87)
var100.logo = ui.create(var101, "##LOGO", var87)
var100.recommendations = ui.create(var101, "Recommendations", var87)
var100.configs = ui.create(var101, "Configs", var87)
var100.date = ui.create(var101, "##DATE", var87)
var100.main = ui.create(var101, "##MAIN", var87)
var100.themes = ui.create(var101, "##THEMES", var87)
var100.socials2 = ui.create(var101, "##SOCIALS2", var87)
var100.socials = ui.create(var101, "##SOCIALS", var87)
var100.configs = ui.create(var101, "##CONFIGS", var88)
var100.main2 = ui.create(var101, "##MAIN2", var87)

local var102 = var100.socials2:button(var92(ui.get_icon("discord"), "Discord Server", 36), var94("https://discord.com/invite/Ns5wwbReVw"), true)
local var103 = {}

local function var104()
	local var1 = common.get_system_time()
	local var2 = string.format("Time: \a{Link Active}%02d:%02d:%02d", var1.hours, var1.minutes, var1.seconds)

	return (var91(ui.get_icon("clock"), var2, 0, 4))
end

var100.main:label(var91(ui.get_icon("circle-user"), string.format("User: \a{Link Active}%s", var3.user), 0, 5))
var100.main:label(var91(ui.get_icon("code-branch"), string.format("Build: \a{Link Active}%s", var3.build), 0, 5))

local var105 = var100.main:label(var104())

local function var106()
	var105:name(var104())
	utils.execute_after(1, var106)
end

var106()

local var107 = {}

local function var108()
	local var1, var2 = var50.export()

	if not var1 then
		var21.err(var2)

		return
	end


	local var3, var4 = var50.encode(var2)

	if not var3 then
		var21.err(var4)

		return
	end


	var21.msg("Config exported")
	var13.set(var4)
end

local function var109()
	local var1, var2 = var50.decode(var13.get())

	if not var1 then
		var21.err(var2)

		return
	end


	local var3, var4 = var50.import(var2)

	if not var3 then
		var21.err(var4)

		return
	end


	var21.msg("Config imported")
end

local var110 = var100.configs:list("##PRESET_LIST", var58.get_list())
local var111 = var100.configs:input("##PRESET_NAME", "Default")

var100.configs:button(var93("\aFF3232FF" .. ui.get_icon("trash"), 3), function()
	local var1, var2 = var58.delete(var111:get())

	if not var1 then
		var21.err(var2)

		return
	end


	var58.update_data()
	var110:update(var58.get_list())
end, true)
var100.configs:button(var93("\a{Link Active}" .. ui.get_icon("copy"), 3), var108, true)
var100.configs:button(var93("\a{Link Active}" .. ui.get_icon("clipboard"), 3), var109, true)
var100.configs:button(var92(ui.get_icon("file-zipper"), "Save", 3), function()
	local var1, var2 = var58.save(var111:get())

	if not var1 then
		var21.err(var2)

		return
	end


	var58.update_data()
	var110:update(var58.get_list())
end, true)
var100.configs:button(var92(ui.get_icon("arrow-down-to-line"), "Load", 3), function()
	var58.load(var111:get())
end, true)
var110:set_callback(function(arg1)
	local var1 = arg1:get()

	if var1 == nil or var1 < 0 then
		return
	end


	local var2 = var58.get(var1)

	if var2 == nil then
		return
	end


	var111:set(var2.name)
end, true)

local var112 = {}

var100.main:visibility(true)
var100.themes:visibility(true)
var100.socials2:visibility(true)
var100.socials:visibility(true)
var100.configs:visibility(true)
var100.main2:visibility(true)

var86.home = var99

local var113 = {}
local var114 = {}
local var115 = ui.get_icon("shield")

var114.main = ui.create(var115, "MAIN", var87)
var114.other = ui.create(var115, "##OTHER", var87)
var114.builder = ui.create(var115, "BUILDER", var88)
var114.builder_layout = ui.create(var115, "##BUILDER_LAYOUT", var88)

local var116 = {
	select = var50.push("Anti-Aim", "manual_yaw.select", var114.main:combo(var91(ui.get_icon("rotate"), "Manual Yaw", 0, 6), {
		"Disabled",
		"Left",
		"Right",
		"Forward",
		"Backward"
	}))
}
local var117 = var116.select:create()

var116.disable_yaw_modifiers = var50.push("Anti-Aim", "manual_yaw.disable_yaw_modifiers", var117:switch("Disable Yaw Modifiers"))
var116.body_freestanding = var50.push("Anti-Aim", "manual_yaw.body_freestanding", var117:switch("Body Freestanding"))
var113.manual_yaw = var116

local var118 = {
	enabled = var50.push("Anti-Aim", "freestanding.enabled", var114.main:switch(var91(ui.get_icon("arrows-split-up-and-left"), "Freestanding", 0, 6)))
}
local var119 = var118.enabled:create()

var118.disable_yaw_modifiers = var50.push("Anti-Aim", "freestanding.disable_yaw_modifiers", var119:switch("Disable Yaw Modifiers"))
var118.disable_all_modifiers = var50.push("Anti-Aim", "manual_yaw.disable_all_modifiers", var119:switch("Disable Body Modifiers"))
var118.body_freestanding = var50.push("Anti-Aim", "freestanding.body_freestanding", var119:switch("Body Freestanding"))
var113.freestanding = var118

local var120 = {
	enabled = var50.push("Anti-Aim", "animations.enabled", var114.other:switch(var91(ui.get_icon("person-sign"), "\aADAD61FF" .. "Animations", 0, 6.5)))
}
local var121 = var120.enabled:create()

var120.options = var50.push("Anti-Aim", "animations.options", var121:selectable("Options", {
	"Landing Pitch",
	"Force Falling",
	"Move Lean",
	"Leg Breaker"
}))
var120.move_lean_force = var50.push("Anti-Aim", "animations.move_lean_force", var121:slider("Move Lean Force", 0, 100, 100, nil, "%"))
var120.on_ground_force = var50.push("Anti-Aim", "animations.on_ground_force", var121:switch("On Ground Force"))
var120.moonwalk_mode = var50.push("Anti-Aim", "animations.moon_walk_mode", var121:switch("Moonwalk Mode"))
var120.moonwalk_in_air_mode = var50.push("Anti-Aim", "animations.moon_walk_in_air_mode", var121:switch("Moonwalk In Air Mode"))

var120.options:set_callback(function(arg1)
	local var1 = arg1:get("Move Lean")
	local var2 = arg1:get("Leg Breaker")

	var120.move_lean_force:visibility(var1)
	var120.on_ground_force:visibility(var1)
	var120.moonwalk_mode:visibility(var2)
	var120.moonwalk_in_air_mode:visibility(var2)
end, true)

var113.animations = var120

local var122 = {
	enabled = var50.push("Anti-Aim", "avoid_backstab.enabled", var114.other:switch(var91(ui.get_icon("sword"), "\a{Link Active}Avoid\aDEFAULT Backstab", 0, 6)))
}

var113.avoid_backstab = var122

local var123 = {
	enabled = var50.push("Anti-Aim", "antiaim_on_use.enabled", var114.other:switch(var91(ui.get_icon("unlock"), "Anti-Aim On Use", 0, 7)))
}
local var124 = var123.enabled:create()

var123.e_fix = var50.push("Anti-Aim", "antiaim_on_use.e_fix", var124:switch("Bombsite E Fix"))
var113.antiaim_on_use = var123

local var125 = {
	enabled = var50.push("Anti-Aim", "edge_yaw.enabled", var114.other:switch(var91(ui.get_icon("table-pivot"), "\a{Link Active}Edge\aDEFAULT Yaw", 0, 6)))
}

var113.edge_yaw = var125

local var126 = {}
local var127 = {
	"Standing",
	"Moving",
	"Slow Walk",
	"Air",
	"Air Crouch",
	"Crouch",
	"Crouch Move"
}

var126.enabled = var50.push("Anti-Aim", "force_defensive.enabled", var114.other:switch(var91(ui.get_icon("wind"), "Force Defensive", 0, 6)))

local var128 = var126.enabled:create()

var126.conditions = var50.push("Anti-Aim", "force_defensive.conditions", var128:selectable("Conditions", var127))
var113.force_defensive = var126

local var129 = {
	enabled = var50.push("Anti-Aim", "tickbase.enabled", var114.other:switch(var91(ui.get_icon("clock"), "Tickbase", 0, 6)))
}
local var130 = var129.enabled:create()

var129.randomize = var50.push("Anti-Aim", "tickbase.randomize", var130:switch("Randomize"))
var129.choke = var50.push("Anti-Aim", "tickbase.choke", var130:slider("Choke", 2, 22, 16, nil, "t"))
var129.type = var50.push("Anti-Aim", "tickbase.type", var130:combo("Type", {
	"Default",
	"Ways"
}))
var129.sliders = var50.push("Anti-Aim", "tickbase.sliders", var130:slider("Sliders", 3, 6, 3, nil))

for iter1 = 1, 6 do
	var129[iter1] = var50.push("Anti-Aim", "tickbase." .. iter1, var130:slider(string.format("- %d", iter1), 2, 22, 16, nil, "t"))
end


local var131

local function var132(arg1)
	local var1 = arg1:get()

	for iter1 = 1, 6 do
		var129[iter1]:visibility(iter1 <= var1)
	end
end

local function var133(arg1)
	local var1 = arg1:get()
	local var2 = var1 == "Default"
	local var3 = var1 == "Ways"

	if var2 then
		for iter1 = 1, 6 do
			local var4 = false

			if iter1 <= 2 then
				var4 = true
			end


			var129[iter1]:visibility(var4)
		end
	end


	var129.sliders:visibility(var3)

	if var3 then
		var129.sliders:set_callback(var132, true)
	else
		var129.sliders:unset_callback(var132)
	end
end

local function var134(arg1)
	local var1 = arg1:get()

	if not var1 then
		var129.sliders:visibility(false)
		var129.sliders:unset_callback(var132)

		for iter1 = 1, 6 do
			var129[iter1]:visibility(false)
		end
	end


	var129.choke:visibility(not var1)
	var129.type:visibility(var1)

	if var1 then
		var129.type:set_callback(var133, true)
	else
		var129.type:unset_callback(var133)
	end
end

var129.randomize:set_callback(var134, true)

var113.tickbase = var129

local var135 = {
	enabled = var50.push("Anti-Aim", "safe_head.enabled", var114.other:switch(var91(ui.get_icon("face-head-bandage"), "\a{Link Active}Safe\aDEFAULT Head", 0, 5)))
}
local var136 = var135.enabled:create()

var135.conditions = var50.push("Anti-Aim", "safe_head.conditions", var136:selectable("Conditions", {
	"Knife",
	"Zeus",
	"Distance"
}))
var113.safe_head = var135

local var137 = {
	enabled = var50.push("Anti-Aim", "wateroff_exploit.enabled", var114.other:switch(var91(ui.get_icon("trophy"), "\a{Link Active}Flick\aDEFAULT Exploit", 0, 5)))
}
local var138 = var137.enabled:create()

var137.Interval = var50.push("Anti-Aim", "wateroff_exploit.interval", var138:slider("Magic key", 1, 25, 1, 0.1, "s"))
var113.wateroff_exploit = var137

local var139 = {}
local var140 = {
	"Standing",
	"Moving",
	"Slow Walk",
	"Air",
	"Air Crouch",
	"Crouch",
	"Crouch Move"
}

local function var141(arg1, arg2)
	return {
		enabled = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_enabled", arg2:switch("Enable " .. arg1)),
		pitch = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_pitch", arg2:combo("Pitch##PITCH{" .. arg1 .. "}", {
			"Default",
			"Up",
			"Down",
			"Zero",
			"Random",
			"Progressive",
			"Static Random",
			"Custom"
		})),
		pitch_offset = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_pitch_offset", arg2:slider("Offset##PITCH_OFFSET{" .. arg1 .. "}", -89, 89, 0, nil)),
		pitch_from = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_pitch_from", arg2:slider("From Offset##PITCH_FROM_OFFSET{" .. arg1 .. "}", -89, 89, 0, nil)),
		pitch_to = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_pitch_to", arg2:slider("To Offset##PITCH_TO_OFFSET{" .. arg1 .. "}", -89, 89, 0, nil)),
		yaw = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_yaw", arg2:combo("Yaw##YAW{" .. arg1 .. "}", {
			"Default",
			"Jitter",
			"Opposite",
			"Spin",
			"Random",
			"Povorotniki",
			"Progressive Spin",
			"Static Random",
			"Custom"
		})),
		yaw_offset = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_yaw_offset", arg2:slider("Offset##YAW_OFFSET{" .. arg1 .. "}", -180, 180, 0, nil)),
		yaw_from = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_yaw_from", arg2:slider("From Offset##YAW_FROM_OFFSET{" .. arg1 .. "}", -180, 180, 0, nil)),
		yaw_to = var50.push("Anti-Aim", "defensive_" .. arg1 .. "_yaw_to", arg2:slider("To Offset##YAW_TO_OFFSET{" .. arg1 .. "}", -180, 180, 0, nil))
	}
end

local function var142(arg1)
	local var1 = {}

	for iter1 = 1, #var140 do
		local var2 = var140[iter1]

		var1[var2] = var141(var2, arg1)
	end


	return var1
end

var139.enabled = var50.push("Anti-Aim", "defensive.enabled", var114.other:switch(var91(ui.get_icon("eye-slash"), "Defensive", 0, 4)))

local var143 = var139.enabled:create()

var139.condition = var50.push("Anti-Aim", "defensive.condition", var143:combo("Condition", var140))
var139.layout = var142(var143)
var139.list = var140
var113.defensive = var139

local var144 = {}
local var145 = {
	"Standing",
	"Moving",
	"Slow Walk",
	"Air",
	"Air Crouch",
	"Crouch",
	"Crouch Move"
}

local function var146(arg1)
	local var1 = {}

	if arg1 ~= "Shared" then
		var1.enabled = var50.push("Anti-Aim", arg1 .. "_enabled", var114.builder_layout:switch("Enable " .. arg1))
	end


	var1.pitch = var50.push("Anti-Aim", arg1 .. "_pitch", var114.builder_layout:combo("Pitch", var11.aa.angles.pitch:list()))
	var1.yaw = var50.push("Anti-Aim", arg1 .. "_yaw", var114.builder_layout:combo("Yaw", var11.aa.angles.yaw[1]:list()))

	local var2 = var1.yaw:create()

	var1.yaw_base = var50.push("Anti-Aim", arg1 .. "_yaw_base", var2:combo("Base", var11.aa.angles.yaw[2]:list()))
	var1.yaw_left = var50.push("Anti-Aim", arg1 .. "_yaw_left", var2:slider("\a{Link Active}~\aDEFAULT Left Offset", -180, 180, 0, nil))
	var1.yaw_right = var50.push("Anti-Aim", arg1 .. "_yaw_right", var2:slider("\a{Link Active}~\aDEFAULT Right Offset", -180, 180, 0, nil))
	var1.yaw_modifier = var50.push("Anti-Aim", arg1 .. "_yaw_modifier", var114.builder_layout:combo("Yaw Modifier", var11.aa.angles.yaw_modifier[1]:list()))

	local var3 = var1.yaw_modifier:create()

	var1.yaw_modifier_mode = var50.push("Anti-Aim", arg1 .. "_yaw_modifier_mode", var3:combo("Mode", {
		"Default",
		"Random",
		"Custom"
	}))
	var1.modifier_offset = var50.push("Anti-Aim", arg1 .. "_modifier_offset", var3:slider("Offset", -180, 180, 0, nil))
	var1.modifier_min_offset = var50.push("Anti-Aim", arg1 .. "_modifier_min_offset", var3:slider("Min Offset", -180, 180, 0, nil))
	var1.modifier_max_offset = var50.push("Anti-Aim", arg1 .. "_modifier_max_offset", var3:slider("Max Offset", -180, 180, 0, nil))
	var1.modifier_sliders = var50.push("Anti-Aim", arg1 .. "_modifier_sliders", var3:slider("Sliders", 3, 6, 3, nil))

	for iter1 = 1, 6 do
		var1["modifier_offset_" .. iter1] = var50.push("Anti-Aim", arg1 .. "_modifier_offset_" .. iter1, var3:slider("- " .. iter1, -180, 180, 0, nil))
	end


	var1.yaw_modifier_mode:tooltip("- Default: Selects an offset from the slider\n\n" .. "- Random: Selects a random offset from the min and max offset\n\n" .. "- Custom: Randomly select an offset from the sliders")

	local var4

	local function var5(arg1)
		local var1 = arg1:get()

		for iter1 = 1, 6 do
			var1["modifier_offset_" .. iter1]:visibility(iter1 <= var1)
		end
	end

	local function var6(arg1)
		local var1 = arg1:get()
		local var2 = var1 == "Default"
		local var3 = var1 == "Random"
		local var4 = var1 == "Custom"

		var1.modifier_offset:visibility(var2)
		var1.modifier_min_offset:visibility(var3)
		var1.modifier_max_offset:visibility(var3)
		var1.modifier_sliders:visibility(var4)

		if var4 then
			var1.modifier_sliders:set_callback(var5, true)
		else
			var1.modifier_sliders:unset_callback(var5)
		end


		if not var4 then
			for iter1 = 1, 6 do
				var1["modifier_offset_" .. iter1]:visibility(false)
			end
		end
	end

	var1.yaw_modifier_mode:set_callback(var6, true)

	var1.body_yaw = var50.push("Anti-Aim", arg1 .. "_body_yaw", var114.builder_layout:switch("Body Yaw"))

	local var7 = var1.body_yaw:create()

	var1.body_yaw_mode = var50.push("Anti-Aim", arg1 .. "_body_yaw_mode", var7:combo("Mode", {
		"Default",
		"Ticks",
		"Random"
	}))
	var1.body_yaw_ticks = var50.push("Anti-Aim", arg1 .. "_body_yaw_ticks", var7:slider("##TICKS", 3, 16, 1, nil, "t"))
	var1.body_yaw_random_ticks = var50.push("Anti-Aim", arg1 .. "_body_yaw_random_ticks", var7:slider("##RANDOM_TICKS", 4, 16, 1, nil, "t"))
	var1.left_limit = var50.push("Anti-Aim", arg1 .. "_left_limit", var7:slider("Left Limit", 0, 60, 60, nil))
	var1.right_limit = var50.push("Anti-Aim", arg1 .. "_right_limit", var7:slider("Right Limit", 0, 60, 60, nil))
	var1.options = var50.push("Anti-Aim", arg1 .. "_options", var7:selectable("Options", var11.aa.angles.body_yaw[5]:list()))
	var1.freestanding = var50.push("Anti-Aim", arg1 .. "_freestanding", var7:combo("Freestanding", var11.aa.angles.body_yaw[6]:list()))

	local var8

	local function var9(arg1)
		var1.body_yaw_ticks:visibility(arg1:get() == "Ticks")
		var1.body_yaw_random_ticks:visibility(arg1:get() == "Random")
	end

	var1.body_yaw_mode:set_callback(var9, true)

	var1.delay = var50.push("Anti-Aim", arg1 .. "_delay", var114.builder_layout:switch("Delay"))

	local var10 = var1.delay:create()

	var1.delay_randomize = var50.push("Anti-Aim", arg1 .. "_delay_randomize", var10:switch("Randomize"))
	var1.delay_value = var50.push("Anti-Aim", arg1 .. "_delay_value", var10:slider("Value", 1, 8, 1, nil, function(arg1)
		return arg1 == 1 and "Off" or arg1
	end))
	var1.delay_type = var50.push("Anti-Aim", arg1 .. "_delay_type", var10:combo("Type", {
		"Default",
		"Ways"
	}))
	var1.delay_sliders = var50.push("Anti-Aim", arg1 .. "_delay_sliders", var10:slider("Slider", 2, 6, 2, nil))

	for iter2 = 1, 6 do
		var1["delay_" .. iter2] = var50.push("Anti-Aim", arg1 .. "_delay_" .. iter2, var10:slider(string.format("- %d", iter2), 1, 8, 1, nil, function(arg1)
			return arg1 == 1 and "Off" or arg1
		end))
	end


	local var11

	local function var12(arg1)
		local var1 = arg1:get()

		for iter1 = 1, 6 do
			var1["delay_" .. iter1]:visibility(iter1 <= var1)
		end
	end

	local function var13(arg1)
		local var1 = arg1:get()
		local var2 = var1 == "Default"
		local var3 = var1 == "Ways"

		if var2 then
			for iter1 = 1, 6 do
				local var4 = false

				if iter1 <= 2 then
					var4 = true
				end


				var1["delay_" .. iter1]:visibility(var4)
			end
		end


		var1.delay_sliders:visibility(var3)

		if var3 then
			var1.delay_sliders:set_callback(var12, true)
		else
			var1.delay_sliders:unset_callback(var12)
		end
	end

	local function var14(arg1)
		local var1 = arg1:get()

		if not var1 then
			var1.delay_sliders:visibility(false)
			var1.delay_sliders:unset_callback(var12)

			for iter1 = 1, 6 do
				var1["delay_" .. iter1]:visibility(false)
			end
		end


		var1.delay_value:visibility(not var1)
		var1.delay_type:visibility(var1)

		if var1 then
			var1.delay_type:set_callback(var13, true)
		else
			var1.delay_type:unset_callback(var13)
		end
	end

	var1.delay_randomize:set_callback(var14, true)

	return var1
end

local function var147()
	local var1 = {}

	for iter1 = 1, #var145 do
		local var2 = var145[iter1]

		var1[var2] = var146(var2)
	end


	return var1
end

var144.enabled = var50.push("Anti-Aim", "builder.enabled", var114.builder:switch(var91(ui.get_icon("shield-check"), "Enable Builder", 0, 7)))
var144.condition = var50.push("Anti-Aim", "builder.condition", var114.builder:combo("Condition", var145))
var144.list = var145
var144.layout = var147()
var113.builder = var144
var86.antiaim = var113

local var148 = {}
local var149 = {}
local var150 = ui.get_icon("sparkles")

var149.switcher = ui.create(var150, "##SWITCHER", var87)
var149.ragebot = ui.create(var150, "##RAGEBOT", var88)
var149.ragebot2 = ui.create(var150, "##RAGEBOT2", var87)
var149.panels = ui.create(var150, "##PANELS", var87)
var149.visuals = ui.create(var150, "##VISUALS", var87)
var149.visuals2 = ui.create(var150, "##VISUALS2", var88)
var149.visuals3 = ui.create(var150, "##VISUALS3", var88)
var149.other = ui.create(var150, "##OTHER", var88)

local var151 = {}

var149.switcher:list("##SELECT", {
	var91(ui.get_icon("person-rifle"), "Ragebot", 0, 5),
	var91(ui.get_icon("moon-stars"), "Visuals", 1, 5),
	var91(ui.get_icon("volcano"), "Miscellaneous", 1, 5)
}):set_callback(function(arg1)
	local var1 = arg1:get()
	local var2 = var1 == 1
	local var3 = var1 == 1
	local var4 = var1 == 2
	local var5 = var1 == 2
	local var6 = var1 == 2
	local var7 = var1 == 3

	var149.ragebot:visibility(var2)
	var149.ragebot2:visibility(var3)
	var149.panels:visibility(var4)
	var149.visuals:visibility(var4)
	var149.visuals2:visibility(var5)
	var149.visuals3:visibility(var6)
	var149.other:visibility(var7)
end, true)

local var152 = {
	enabled = var50.push("Ragebot", "aimbot_logs.enabled", var149.ragebot:switch(var91(ui.get_icon("list-timeline"), "Aimbot Logs", 0, 7)))
}
local var153 = var152.enabled:create()

var152.output = var50.push("Ragebot", "aimbot_logs.output", var153:selectable("Output", {
	"Console",
	"Notify",
	"Screen"
}))
var152.color = var50.push("Visuals", "aimbot_logs.color", var153:color_picker("Hit color"))
var152.misscolor = var50.push("Visuals", "aimbot_logs.misscolor", var153:color_picker("Miss color"))
var148.aimbot_logs = var152

local var154 = {
	enabled = var50.push("Ragebot", "dormant_aimbot.enabled", var149.ragebot:switch(var91(ui.get_icon("scanner-gun"), "\aADAD61FF" .. "Dormant Aimbot", 0, 6)))
}
local var155 = var154.enabled:create()

var154.hitboxes = var50.push("Ragebot", "dormant_aimbot.hitboxes", var155:selectable("Hitboxes", {
	"Head",
	"Chest",
	"Stomach",
	"Legs"
}))
var154.hitchance = var50.push("Ragebot", "dormant_aimbot.hitchance", var155:slider("Accuracy", 50, 85, 60, nil, "%"))
var154.damage = var50.push("Ragebot", "dormant_aimbot.damage", var155:slider("Min. Damage", -1, 130, -1, nil, function(arg1)
	if arg1 == -1 then
		return "Auto"
	end


	if arg1 > 100 then
		return "+" .. arg1 - 100
	end


	return nil
end))
var154.auto_scope = var50.push("Ragebot", "dormant_aimbot.auto_scope", var155:switch("Auto Scope"))
var148.dormant_aimbot = var154

local var156 = {
	enabled = var50.push("Ragebot", "algorithmic_peek.enabled", var149.ragebot:switch(var91(ui.get_icon("microchip-ai"), "\a{Link Active}AI\aDEFAULT Peek", 0, 6)))
}
local var157 = var156.enabled:create()

var156.hitboxes = var50.push("Ragebot", "algorithmic_peek-hitboxes", var157:listable("Scanning Hitboxes", {
	"Head",
	"Chest",
	"Stomach",
	"Legs"
}))
var156.simulation_time = var50.push("Ragebot", "algorithmic_peek-simulation", var157:slider("Simulation Time", 25, 35, 28, 0.01, "s"))
var156.rate_limit = var50.push("Ragebot", "algorithmic_peek-rate_limit", var157:slider("Rate Limit", 0, 30, 2, 0.01, "s"))
var156.hit_chance = var50.push("Ragebot", "algorithmic_peek-hitchance", var157:slider("Hit Chance", 0, 100, 35, nil, function(arg1)
	return arg1 == 0 and "Def." or arg1 .. "%"
end))
var156.unsafety = var50.push("Ragebot", "algorithmic_peek-unsafety", var157:switch("Unsafety"))
var156.developer_mode = var50.push("Ragebot", "algorithmic_peek-developer_mode", var157:switch("Developer Mode"))
var156.uncharge = var50.push("Ragebot", "algorithmic_peek-uncharge", var157:switch("Force uncharge when possible"))
var156.range = var50.push("Ragebot", "algorithmic_peek-range", var157:slider("Range", 15, 25, 20, nil, "t"))
var156.retreat = var50.push("Ragebot", "algorithmic_peek-retreat", var157:slider("Retreat", 15, 30, 25, nil, "u"))

var156.simulation_time:tooltip("Sets the duration of the Peek, adjustable if 'Algorithmic Peek' can't make it in time")
var156.rate_limit:tooltip("Adjusts scanning frequency, will be useful for computers with poor performance")
var156.hit_chance:tooltip("Sets hit chance in ragebot when 'Algorithmic peeking'")
var156.unsafety:tooltip("Disables 'Force Body', 'Safe Points', 'Ensure Hitbox Safety' and Sets 'Point Scale' to 100")
var156.developer_mode:set_callback(function(arg1)
	local var1 = arg1:get()

	var156.range:visibility(var1)
	var156.retreat:visibility(var1)
	var156.uncharge:visibility(var1)
end, true)

var148.algorithmic_peek = var156

local var158 = {
	enabled = var50.push("Ragebot", "grenade_throw_fix.enabled", var149.ragebot2:switch(var91(ui.get_icon("bomb"), "\a{Link Active}Grenade\aDEFAULT Throw Fix", 0, 7)))
}

var148.grenade_throw_fix = var158

local var159 = {
	enabled = var50.push("Ragebot", "super_toss.enabled", var149.ragebot2:switch(var91(ui.get_icon("bomb"), "\aADAD61FF" .. "Super Toss", 0, 7)))
}

var159.enabled:tooltip("This feature allows you to stabilize your grenade prediction")

var148.super_toss = var159

local var160 = {
	enabled = var50.push("Miscellaneous", "fast_ladder.enabled", var149.other:switch(var91(ui.get_icon("water-ladder"), "\a{Link Active}Fast\aDEFAULT Ladder", 0, 6)))
}

var148.fast_ladder = var160

local var161 = {
	enabled = var50.push("Miscellaneous", "clantag.enabled", var149.other:switch(var91(ui.get_icon("tags"), "\a{Link Active}Spectral\aDEFAULT Clantag", 0, 7)))
}

var148.clantag = var161

local var162 = {
	enabled = var50.push("Miscellaneous", "viewmodel.enabled", var149.other:switch(var91(ui.get_icon("gun"), "Viewmodel", 0, 7)))
}
local var163 = var162.enabled:create()

var162.fov = var50.push("Miscellaneous", "viewmodel.fov", var163:slider("Field of View", 0, 1000, 680, 0.1))
var162.offset_x = var50.push("Miscellaneous", "viewmodel.offset_x", var163:slider("Offset X", -100, 100, 25, 0.1))
var162.offset_y = var50.push("Miscellaneous", "viewmodel.offset_y", var163:slider("Offset Y", -100, 100, 0, 0.1))
var162.offset_z = var50.push("Miscellaneous", "viewmodel.offset_z", var163:slider("Offset Z", -100, 100, -15, 0.1))
var162.opposite_knife_hand = var50.push("Miscellaneous", "viewmodel.opposite_knife_hand", var163:switch("Opposite knife hand"))
var148.viewmodel = var162

local var164 = {
	enabled = var50.push("Ragebot", "ping_spike.enabled", var149.ragebot2:switch(var91(ui.get_icon("wifi"), "\aADAD61FF" .. "Fake Latency", 0, 5)))
}
local var165 = var164.enabled:create()

var164.value = var50.push("Ragebot", "ping_spike.value", var165:slider("Value", 0, 1000, 1000, 1, "ms"))

var164.enabled:tooltip("This feature allows you to overdrive the neverlose's values of ping spok")

var148.ping_spike = var164

local var166 = {
	enabled = var50.push("Ragebot", "no_fall_damage.enabled", var149.other:switch(var91(ui.get_icon("person-falling"), "No Fall Damage", 1, 8)))
}

var148.no_fall_damage = var166

local var167 = {
	label = var149.visuals:label(var91(ui.get_icon("marker"), "Watermark", 0, 5))
}
local var168 = var167.label:create()

var167.style = var50.push("Visuals", "watermark.style", var168:combo("Style", {
	"DISABLED (DEV)",
	"Simple",
	"Default"
}))
var167.color = var50.push("Visuals", "watermark.color", var168:color_picker("Color", color(153, 178, 255, 255)))
var148.watermark = var167

local var169 = {
	enabled = var149.visuals:switch(var91(ui.get_icon("keyboard"), "Keybinds", 0, 5))
}
local var170 = var169.enabled:create()

var169.color = var50.push("Visuals", "keybinds.color", var170:color_picker("Color", color(153, 178, 255, 255)))
var148.keybinds = var169

local var171 = {
	enabled = var50.push("Visuals", "scope_overlay.enabled", var149.visuals:switch(var91(ui.get_icon("crosshairs"), "\a{Link Active}Scope\aDEFAULT Overlay", 0, 6)))
}
local var172 = var171.enabled:create()

var171.color = var50.push("Visuals", "scope_overlay.color", var172:color_picker("Color"))
var171.position = var50.push("Visuals", "scope_overlay.position", var172:slider("Position", 0, 500, 105, nil, "px"))
var171.offset = var50.push("Visuals", "scope_overlay.offset", var172:slider("Offset", 0, 500, 10, nil, "px"))
var171.t_style = var50.push("Visuals", "scope_overlay.t_style", var172:switch("T Style"))
var148.scope_overlay = var171

local var173 = {
	enabled = var50.push("Visuals", "antiaim_arrows.enabled", var149.visuals:switch(var91(ui.get_icon("arrows-left-right"), "Anti-Aim Arrows", 0, 6)))
}
local var174 = var173.enabled:create()

var173.color = var50.push("Visuals", "antiaim_arrows.color", var174:color_picker("Color", {
	Manual = {
		color("BEEC28FF")
	},
	Desync = {
		color("21A3DEFF")
	}
}))
var173.type = var50.push("Visuals", "antiaim_arrows.type", var174:combo("Type", {
	"Default",
	"Alternative"
}))
var148.antiaim_arrows = var173

local var175 = {
	enabled = var50.push("Visuals", "indicate_state.enabled", var149.visuals:switch(var91(ui.get_icon("wand-magic-sparkles"), "\a{Link Active}Indicate\aDEFAULT State", 0, 5)))
}
local var176 = var175.enabled:create()

var175.type = var50.push("Visuals", "indicate_state.type", var176:combo("Type", {
	"Default",
	"Alternative"
}))
var175.offset = var50.push("Visuals", "indicate_state.offset", var176:slider("Offset", 10, 400, 10, nil, "px"))
var175.color = var50.push("Visuals", "indicate_state.color", var176:color_picker("Color"))
var148.indicate_state = var175

local var177 = {
	enabled = var50.push("Visuals", "lethal_indicator.enabled", var149.visuals:switch(var91(ui.get_icon("heart-crack"), "Lethal Indicator", 0, 5)))
}
local var178 = var177.enabled:create()

var177.color = var50.push("Visuals", "lethal_indicator.color", var178:color_picker("Color"))
var177.offset = var50.push("Visuals", "lethal_indicator.offset", var178:slider("Offset", -100, 100, -32, nil, "px"))
var177.min_hp = var50.push("Visuals", "lethal_indicator.min_hp", var178:slider("Min HP", 1, 99, 92, nil, "hp"))
var148.lethal_indicator = var177

local var179 = {
	enabled = var50.push("Visuals", "damage_indicator.enabled", var149.visuals2:switch(var91(ui.get_icon("hundred-points"), "Damage Indicator", 0, 6)))
}
local var180 = var179.enabled:create()

var179.color = var50.push("Visuals", "damage_indicator.color", var180:color_picker("Color"))
var179.font = var50.push("Visuals", "damage_indicator.font", var180:combo("Font", {
	"Default",
	"Small"
}))
var148.damage_indicator = var179

local var181 = {
	enabled = var50.push("Visuals", "velocity_warning.enabled", var149.visuals2:switch(var91(ui.get_icon("triangle-exclamation"), "Velocity Warning", 0, 6)))
}
local var182 = var181.enabled:create()

var181.color = var50.push("Visuals", "velocity_warning.color", var182:color_picker("Color"))
var148.velocity_warning = var181

local var183 = {
	enabled = var50.push("Visuals", "hit_marker.enabled", var149.visuals2:switch(var91(ui.get_icon("xmark-large"), "\a{Link Active}Hit\aDEFAULT Marker", 0, 7)))
}
local var184 = var183.enabled:create()

var183.color = var50.push("Visuals", "hit_marker.color", var184:color_picker("Color"))
var148.hit_marker = var183

local var185 = {
	enabled = var50.push("Visuals", "fovanimations.enabled", var149.visuals2:switch(var91(ui.get_icon("telescope"), "Scope Animations", 0, 4)))
}
local var186 = var185.enabled:create()

var185.select = var50.push("Visuals", "fovanimations.select", var186:selectable("Select", {
	"First Person",
	"Third Person"
}))
var148.fovanimations = var185

local var187 = {
	enabled = var50.push("Visuals", "kibit_marker.enabled", var149.visuals2:switch(var91(ui.get_icon("plus-large"), "\a{Link Active}Kibit\aDEFAULT Marker", 0, 6)))
}
local var188 = var187.enabled:create()

var187.color = var50.push("Visuals", "kibit_marker.color", var188:color_picker("Color", {
	Vertical = {
		color("00FF00FF")
	},
	Horizontal = {
		color("00FFFFFF")
	}
}))
var148.kibit_marker = var187

local var189 = {}

local function var190(arg1, arg2)
	return var90(arg2) .. arg1 .. var90(arg2)
end

local var191 = {
	[133] = "4:3",
	[125] = "5:4",
	[166] = "16:9",
	[160] = "16:10"
}

var189.enabled = var50.push("Visuals", "aspect_ratio.enabled", var149.visuals:switch(var91(ui.get_icon("display-code"), "Aspect Ratio", 0, 5)))

local var192 = var189.enabled:create()

var189.value = var50.push("Visuals", "aspect_ratio.value", var192:slider("Ratio", 0, 250, 0, 0.01, function(arg1)
	return var191[arg1] or nil
end))

var192:button(var190("5:4", 6), function()
	var189.value:set(125)
end, true)
var192:button(var190("4:3", 6), function()
	var189.value:set(133)
end, true)
var192:button(var190("16:9", 6), function()
	var189.value:set(166)
end, true)
var192:button(var190("16:10", 5), function()
	var189.value:set(160)
end, true)

var148.aspect_ratio = var189

local var193 = {
	enabled = var50.push("Visuals", "contrast_boost.enabled", var149.visuals:switch(var91(ui.get_icon("sun"), "Contrast Boost", 0, 5)))
}
local var194 = var193.enabled:create()

var193.interval = var50.push("Visuals", "contrast_boost.interval", var194:slider("Interval", 1, 20, 1, 0.1, "t"))
var148.contrast_boost = var193

local var195 = {
	enabled = var50.push("Visuals", "label.enabled", var149.visuals3:label("\a{Link Active}✦\aDEFAULT spectral loves \a{Link Active}you"))
}

var148.label = var195
var86.features = var148

local var196
local var197 = {}
local var198 = 2

local function var199(arg1)
	return arg1.Border
end

local function var200(arg1)
	local var1, var2, var3, var4 = arg1["Link Active"]:to_hsl()

	return color():as_hsl(var1, var2 - 0.25, var3 - 0.1, var4 * 0.75)
end

local function var201(arg1)
	local var1, var2, var3, var4 = arg1["Main Window Background"]:to_hsl()

	return color():as_hsl(var1, var2, var3 + 0.05, var4)
end

local function var202(arg1)
	return arg1["Main Window Background"]
end

function var197.draw(arg1, arg2, arg3, arg4)
	local var1 = var199(arg3)
	local var2 = var202(arg3)
	local var3 = var201(arg3)

	if arg4 ~= nil then
		var1 = var1:alpha_modulate(var1.a * arg4)
		var2 = var2:alpha_modulate(var2.a * arg4)
		var3 = var3:alpha_modulate(var3.a * arg4)
	end


	render.gradient(arg1, arg2, var2, var2, var3, var3, var198)
	render.rect_outline(arg1, arg2, var1, 1, var198)
end

function var197.line(arg1, arg2, arg3, arg4)
	local var1 = ((arg2.x - arg1.x) * 0.5 - var198 * 2) * 0.66

	if var1 < 5 then
		return
	end


	local var2 = (arg1.x + arg2.x) * 0.5
	local var3 = arg2.y - 1
	local var4 = var200(arg3)
	local var5 = var4:alpha_modulate(0)

	if arg4 ~= nil then
		var4 = var4:alpha_modulate(var4.a * arg4)
	end


	render.gradient(vector(var2, var3), vector(var2 - var1, var3 - 1), var4, var5, var4, var5)
	render.gradient(vector(var2, var3), vector(var2 + var1, var3 - 1), var4, var5, var4, var5)
end

local var203
local var204 = {}
local var205 = 12
local var206 = 6
local var207 = 5

local function var208(arg1, arg2, arg3, arg4)
	local var1 = arg3:clone()

	var1.a = var1.a * 0.5 * arg4

	render.shadow(arg1, arg2, var1, 24, 0, 12)
	render.rect(arg1, arg2, color(20, 20, 20, 255 * arg4), 12)
end

local function var209()
	local var1 = 1
	local var2 = globals.realtime
	local var3 = render.screen_size()
	local var4 = vector(var3.x * 0.5, var3.y * 0.8)
	local var5 = ui.get_style()
	local var6 = ui.get_icon("triangle-exclamation")
	local var7 = #var204
	local var8 = color(200, 200, 200)

	for iter1 = var7, 1, -1 do
		local var9 = var204[iter1]
		local var10 = var7 - iter1 + 1
		local var11 = var2 > var9.time or var10 > 6
		local var12 = var9.alpha:update(0.1, not var11)

		if var11 and var12 <= 0.01 then
			table.remove(var204, iter1)
		end
	end


	for iter2 = 1, #var204 do
		local var13 = var204[iter2]
		local var14 = string.format("\a%s%s \a%s%s", var13.hex, var6, "DEFAULT", var13.text)
		local var15 = var13.alpha.value
		local var16 = var4:clone()
		local var17 = render.measure_text(var1, "s", var14)
		local var18 = var17 + vector(var205, var206) * 2
		local var19 = var8:alpha_modulate(var8.a * var15)
		local var20 = var18:clone()

		var16.x = var16.x - var20.x * 0.5

		var208(var16, var16 + var20, var13.color, var15)

		local var21
		local var22 = var16:clone() + (var18 - var17) * 0.5

		var22.y = var22.y - 1

		render.text(var1, var22, var19, "s", var14)

		var4.y = var4.y - (var20.y + var207) * var15
	end
end

local var210
local var211 = 0
local var212 = {
	hegrenade = "naded",
	knife = "knifed",
	inferno = "burned"
}
local var213 = {
	[0] = "generic",
	"head",
	"chest",
	"stomach",
	"chest",
	"chest",
	"legs",
	"legs",
	"head",
	nil,
	"gear"
}
local var214 = false
local var215 = false
local var216 = false

local function var217(arg1)
	return var213[arg1] or "?"
end

local function var218(arg1, arg2)
	local var1 = string.format("\a%s%%1\aDEFAULT", arg2)

	return (arg1:gsub("%${(.-)}", var1))
end

local function var219(arg1, arg2)
	local var1 = {
		hex = arg1:to_hex(),
		color = arg1,
		text = arg2,
		time = globals.realtime + 3,
		alpha = neverlose_smoothy.new(0)
	}

	table.insert(var204, var1)

	return var1
end

local function var220(arg1)
	local var1 = arg1.target
	local var2 = arg1.damage
	local var3 = arg1.wanted_damage
	local var4 = arg1.weapon
	local var5 = var212[var4]
	local var6 = arg1.backtrack
	local var7 = arg1.hitchance
	local var8 = var1:get_name()
	local var9 = var217(arg1.wanted_hitgroup)
	local var10 = var217(arg1.hitgroup)

	if var214 then
		local var11 = string.format("registered ${%sth} ${shot} at ${%s}'s ${%s} for ${%d} damage (history = ${%dt}, wanted hitbox = ${%s}, hitchance = ${%s}%%)", var211, var8:lower(), var10, var2, var6, var9, var7)

		var21.raw(var218(var11, "\a" .. var86.features.aimbot_logs.color:get():to_hex()))
	end


	if var215 then
		local var12 = string.format("[${%s}] registered ${%sth} ${shot} at ${%s}'s ${%s} for ${%d} damage (history = ${%dt}, wanted hitbox = ${%s}, hitchance = ${%s}%%)", var3.name:lower(), var211, var8:lower(), var10, var2, var6, var9, var7)

		print_dev(var218(var12, "\a" .. var86.features.aimbot_logs.color:get():to_hex()))
	end


	if var216 then
		local var13 = string.format("hit ${%s}'s ${%s} for ${%d}!", var8, var10, var2)
		local var14 = var86.features.aimbot_logs.color:get()

		var219(var14, var218(var13, var14:to_hex()))
	end
end

local function var221(arg1, arg2, arg3, arg4, arg5)
	local var1 = arg1.weapon
	local var2 = var212[var1]

	if var2 == nil then
		return
	end


	local var3 = arg3:get_name()
	local var4 = arg1.dmg_health
	local var5 = arg1.health

	if var214 then
		local var6 = string.format("%s ${%s}'s ${generic} for ${%d} damage (${%s} health remaining)", var2, var3, var4, var5)

		var21.raw(var218(var6, "\a" .. var86.features.aimbot_logs.color:get():to_hex()))
	end


	if var215 then
		local var7 = string.format("[${%s}] %s ${%s}'s ${generic} for ${%d} damage (${%s} health remaining)", var3.name:lower(), var2, var3, var4, var5)

		print_dev(var218(var7, "\a" .. var86.features.aimbot_logs.color:get():to_hex()))
	end


	if var216 then
		local var8 = string.format("%s ${%s}'s ${generic} for ${%d} damage (${%s} health remaining)", var2, var3, var4, var5)
		local var9 = var86.features.aimbot_logs.color:get()

		var219(var9, var218(var8, var9:to_hex()))
	end
end

local function var222(arg1)
	local var1 = arg1.state
	local var2 = arg1.target
	local var3 = arg1.backtrack
	local var4 = arg1.hitchance
	local var5 = arg1.spread

	if var5 == nil then
		spread2 = 0
	else
		spread2 = math.floor(var5)
	end


	local var6 = var2:get_name()
	local var7 = var217(arg1.wanted_hitgroup)

	if var214 then
		local var8 = string.format("missed ${%sth} shot ${%s}'s ${%s} due to ${%s} (history = ${%dt}, spread = ${%s°} or chance of hit at ${%s} = ${%s}%%)", var211, var6:lower(), var7, var1, var3, spread2, var7, var4)

		var21.raw(var218(var8, "\a" .. var86.features.aimbot_logs.misscolor:get():to_hex()))
	end


	if var215 then
		local var9 = string.format("[${%s}] missed ${%sth} shot ${%s}'s ${%s} due to ${%s} (history = ${%dt}, spread = ${%s°} or chance of hit at ${%s} = ${%s}%%)", var3.name:lower(), var211, var6:lower(), var7, var1, var3, spread2, var7, var4)

		print_dev(var218(var9, "\a" .. var86.features.aimbot_logs.misscolor:get():to_hex()))
	end


	if var216 then
		local var10 = string.format("missed ${%s}'s ${%s} due to ${%s}!", var6, var7, var1)
		local var11 = var86.features.aimbot_logs.misscolor:get()

		var219(var11, var218(var10, var11:to_hex()))
	end
end

local function var223(arg1)
	var211 = var211 + 1

	if arg1.state ~= nil then
		var222(arg1)
	else
		var220(arg1)
	end
end

events.player_hurt:set(function(arg1)
	local var1 = entity.get_local_player()
	local var2 = entity.get(arg1.userid, true)
	local var3 = entity.get(arg1.attacker, true)

	if var214 and var3 == var1 and var2 ~= var1 then
		var221(arg1, var1, var2, var3)
	end
end)

local function var224(arg1)
	local var1 = arg1.userid
	local var2 = arg1.dmg_health
	local var3 = var1:get_name()
	local var4 = var217(arg1.hitgroup)

	if var214 then
		local var5 = string.format("${dormant} hit ${%s}'s ${%s} for ${%d} damage", var3, var4, var2)

		var21.raw(var218(var5, "\a" .. var86.features.aimbot_logs.color:get():to_hex()))
	end


	if var215 then
		local var6 = string.format("${dormant} hit ${%s}'s ${%s} for ${%d} damage", var3, var4, var2)

		print_dev(var218(var6, "\a" .. var86.features.aimbot_logs.color:get():to_hex()))
	end


	if var216 then
		local var7 = string.format("${dormant} hit ${%s}'s ${%s} for ${%d} damage", var3, var4, var2)
		local var8 = var86.features.aimbot_logs.color:get()

		var219(var8, var218(var7, var8:to_hex()))
	end
end

local function var225(arg1)
	local var1 = arg1.userid
	local var2 = math.floor(0.5 + arg1.accuracy * 100)
	local var3 = arg1.aim_point:lower()
	local var4 = var1:get_name()
	local var5 = arg1.aim_hitbox:lower()

	if var214 then
		local var6 = string.format("${dormant} missed ${%s}'s ${%s} [accuracy: ${%d%%}, point: ${%s}]", var4, var5, var2, var3)

		var21.raw(var218(var6, "\a" .. var86.features.aimbot_logs.misscolor:get():to_hex()))
	end


	if var215 then
		local var7 = string.format("${dormant} missed ${%s}'s ${%s}", var4, var5)

		print_dev(var218(var7, "\a" .. var86.features.aimbot_logs.misscolor:get():to_hex()))
	end


	if var216 then
		local var8 = string.format("${dormant} missed ${%s}'s ${%s}", var4, var5)
		local var9 = var86.features.aimbot_logs.misscolor:get()

		var219(var9, var218(var8, var9:to_hex()))
	end
end

local var226 = var86.features.aimbot_logs

local function var227(arg1)
	var214 = arg1:get("Console")
	var215 = arg1:get("Notify")
	var216 = arg1:get("Screen")

	events.render(var209, var216)
end

local function var228(arg1)
	local var1 = arg1:get()

	if var1 then
		var226.output:set_callback(var227, true)
	else
		var226.output:unset_callback(var227)
		events.render(var209, false)
	end


	events.aim_ack(var223, var1)
	events.dormant_hit(var224, var1)
	events.dormant_miss(var225, var1)
end

var226.enabled:set_callback(var228, true)

local var229
local var230 = 5
local var231
local var232
local var233
local var234
local var235
local var236 = false
local var237 = false
local var238 = 1
local var239 = 0
local var240 = {
	[0] = "Generic",
	"Head",
	"Chest",
	"Stomach",
	"Chest",
	"Chest",
	"Legs",
	"Legs",
	"Head",
	nil,
	"Gear"
}
local var241 = {
	{
		scale = 5,
		hitbox = "Stomach",
		vec = vector(0, 0, 40)
	},
	{
		scale = 6,
		hitbox = "Chest",
		vec = vector(0, 0, 50)
	},
	{
		scale = 3,
		hitbox = "Head",
		vec = vector(0, 0, 58)
	},
	{
		scale = 4,
		hitbox = "Legs",
		vec = vector(0, 0, 20)
	}
}

local function var242(arg1, arg2)
	for iter1 = 1, #arg1 do
		if arg1[iter1] == arg2 then
			return true
		end
	end


	return false
end

local function var243(arg1)
	return arg1 >= 1 and arg1 <= 6
end

local function var244()
	local var1 = {}
	local var2 = entity.get_player_resource()

	for iter1 = 1, globals.max_players do
		local var3 = entity.get(iter1)

		if var3 == nil then
			-- block empty
		elseif not (var2.m_bConnected[iter1] and var3:is_enemy() and var3:is_dormant()) then
			-- block empty
		else
			table.insert(var1, var3)
		end
	end


	return var1
end

local function var245(arg1, arg2, arg3)
	local var1 = arg1:to(arg2):angles()
	local var2 = math.rad(var1.y + 90)
	local var3 = vector(math.cos(var2), math.sin(var2), 0) * arg3

	return {
		{
			text = "Middle",
			vec = arg2
		},
		{
			text = "Left",
			vec = arg2 + var3
		},
		{
			text = "Right",
			vec = arg2 - var3
		}
	}
end

local function var246(arg1, arg2, arg3, arg4)
	local var1, var2 = utils.trace_bullet(arg1, arg2, arg3, arg4)

	if var2 ~= nil then
		local var3 = var2.entity

		if var3 == nil then
			return 0, var2
		end


		if var3:is_player() and not var3:is_enemy() then
			return 0, var2
		end
	end


	return var1, var2
end

local function var247(arg1)
	var11.rage.main.enabled[2]:override(false)

	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	local var2 = var1:get_player_weapon()

	if var2 == nil then
		return
	end


	local var3 = var2:get_weapon_info()

	if var3 == nil then
		return
	end


	local var4 = var2:get_inaccuracy()

	if var4 == nil then
		return
	end


	local var5 = globals.tickcount
	local var6 = var1:get_eye_position()
	local var7 = var1:get_simulation_time().current
	local var8 = bit.band(var1.m_fFlags, bit.lshift(1, 0)) ~= 0

	if var5 < var239 then
		return
	end


	if arg1.in_jump and not var8 then
		return
	end


	local var9 = var3.weapon_type

	if not var243(var9) or var2.m_iClip1 <= 0 then
		return false
	end


	local var10 = var244()
	local var11 = var86.features.dormant_aimbot.hitboxes:get()

	if var5 % #var10 ~= 0 then
		var238 = var238 + 1
	else
		var238 = 1
	end


	local var12 = var10[var238]

	if var12 == nil then
		return
	end


	local var13 = var12:get_bbox()
	local var14 = var12:get_origin()
	local var15 = var12.m_flDuckAmount
	local var16 = var86.features.dormant_aimbot.hitchance:get()
	local var17 = var86.features.dormant_aimbot.damage:get()

	if var17 == -1 then
		var17 = var11.rage.selection.min_damage:get()
	end


	if var17 > 100 then
		var17 = var17 - 100 + var12.m_iHealth
	end


	local var18 = {}

	for iter1 = 1, #var241 do
		local var19 = var241[iter1]
		local var20 = var19.vec
		local var21 = var19.scale
		local var22 = var19.hitbox

		if var22 == "Head" then
			var20 = var20 - vector(0, 0, 10 * var15)
		end


		if var22 == "Chest" then
			var20 = var20 - vector(0, 0, 4 * var15)
		end


		if #var11 ~= 0 then
			if var242(var11, var22) then
				table.insert(var18, {
					vec = var20,
					scale = var21,
					hitbox = var22
				})
			end
		else
			table.insert(var18, 1, {
				vec = var20,
				scale = var21,
				hitbox = var22
			})
		end
	end


	if not (var3.is_revolver and var7 > var2.m_flNextPrimaryAttack or var7 > math.max(var1.m_flNextAttack, var2.m_flNextPrimaryAttack, var2.m_flNextSecondaryAttack)) then
		return
	end


	local var23
	local var24

	if var16 >= math.floor(var13.alpha * 100) + 5 then
		return
	end


	for iter2 = 1, #var18 do
		local var25 = var18[iter2]
		local var26 = var245(var6, var14 + var25.vec, var25.scale)

		for iter3 = 1, #var26 do
			local var27 = var26[iter3]
			local var28 = var27.vec
			local var29, var30 = var246(var1, var6, var28, function(arg1)
				return arg1 == var12
			end)

			if var30 ~= nil and var30:is_visible() then
				-- block empty
			elseif var29 ~= 0 and var17 < var29 then
				var23 = var28
				var24 = var29
				var231 = var12
				var233 = var25.hitbox
				var234 = var29
				var232 = var27.text
				var235 = var13.alpha

				break
			end
		end


		if var23 and var24 then
			break
		end
	end


	if not var23 or not var24 then
		return
	end


	local var31 = var6:to(var23):angles()

	arg1.block_movement = 1

	if var86.features.dormant_aimbot.auto_scope:get() then
		local var32 = not arg1.in_jump and var8
		local var33 = var1.m_bIsScoped or var1.m_bResumeZoom
		local var34 = var3.weapon_type == var230

		if not var33 and var34 and var32 then
			arg1.in_attack2 = true
		end
	end


	if var4 < 0.01 then
		arg1.view_angles = var31
		arg1.in_attack = true
		var237 = true
	end
end

local function var248(arg1)
	utils.execute_after(0.03, function()
		if entity.get(arg1.userid, true) == entity.get_local_player() then
			if var237 and not var236 then
				events.dormant_miss:call({
					userid = var231,
					aim_hitbox = var233,
					aim_damage = var234,
					aim_point = var232,
					accuracy = var235
				})
			end


			var236 = false
			var237 = false
			var231 = nil
			var233 = nil
			var234 = nil
			var232 = nil
			var235 = nil
		end
	end)
end

local function var249(arg1)
	local var1 = entity.get_local_player()
	local var2 = entity.get(arg1.userid, true)
	local var3 = entity.get(arg1.attacker, true)

	if var2 == nil or var3 ~= var1 then
		return
	end


	local var4 = var2:get_bbox()

	if var4 == nil then
		return
	end


	if var2:is_dormant() and var237 == true then
		var236 = true

		events.dormant_hit:call({
			userid = var2,
			attacker = var3,
			health = arg1.health,
			armor = arg1.armor,
			weapon = arg1.weapon,
			dmg_health = arg1.dmg_health,
			dmg_armor = arg1.dmg_armor,
			hitgroup = arg1.hitgroup,
			accuracy = var4.alpha,
			hitbox = var240[arg1.hitgroup],
			aim_point = var232,
			aim_hitbox = var233,
			aim_damage = var234
		})
	end
end

local function var250()
	var11.rage.main.enabled[2]:override()
end

var86.features.dormant_aimbot.enabled:set_callback(function(arg1)
	local var1 = arg1:get()

	if not var1 then
		var11.rage.main.enabled[2]:override()
	end


	events.shutdown(var250, var1)
	events.createmove(var247, var1)
	events.weapon_fire(var248, var1)
	events.player_hurt(var249, var1)
end, true)

local var251
local var252 = false
local var253 = math.pi * 2
local var254 = var253 / 8

local function var255(arg1, arg2)
	local var1 = arg1:get_origin()

	for iter1 = 0, var253, var254 do
		local var2 = math.sin(iter1)
		local var3 = math.cos(iter1)
		local var4 = var1.x + var3 * 10
		local var5 = var1.y + var2 * 10
		local var6 = vector(var4, var5, var1.z)
		local var7 = var6:clone()

		var7.z = var7.z - arg2

		if utils.trace_line(var6, var7, arg1).fraction < 1 then
			return true
		end
	end


	return false
end

local function var256(arg1)
	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	if var1.m_vecVelocity.z >= -500 then
		var252 = false

		return
	end


	if var255(var1, 15) then
		var252 = false
	elseif var255(var1, 75) then
		var252 = true
	end


	arg1.in_duck = var252
end

var86.features.no_fall_damage.enabled:set_callback(function(arg1)
	events.createmove(var256, arg1:get())
end, true)

local var257
local var258 = 9

local function var259(arg1)
	local var1 = render.camera_angles().x

	if arg1.forwardmove > 0 and var1 < 45 then
		arg1.view_angles.x = 89
		arg1.in_moveright = 1
		arg1.in_moveleft = 0
		arg1.in_forward = 0
		arg1.in_back = 1

		if arg1.sidemove == 0 then
			arg1.view_angles.y = arg1.view_angles.y + 90
		end


		if arg1.sidemove < 0 then
			arg1.view_angles.y = arg1.view_angles.y + 150
		end


		if arg1.sidemove > 0 then
			arg1.view_angles.y = arg1.view_angles.y + 30
		end
	end


	if arg1.forwardmove < 0 then
		arg1.view_angles.x = 89
		arg1.in_moveleft = 1
		arg1.in_moveright = 0
		arg1.in_forward = 1
		arg1.in_back = 0

		if arg1.sidemove == 0 then
			arg1.view_angles.y = arg1.view_angles.y + 90
		end


		if arg1.sidemove > 0 then
			arg1.view_angles.y = arg1.view_angles.y + 150
		end


		if arg1.sidemove < 0 then
			arg1.view_angles.y = arg1.view_angles.y + 30
		end
	end
end

local function var260(arg1)
	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	if var1.m_MoveType ~= var258 then
		return
	end


	var259(arg1)
end

var86.features.fast_ladder.enabled:set_callback(function(arg1)
	events.createmove(var260, arg1:get())
end, true)

local var261
local var262 = {}
local var263 = 0.3
local var264 = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
local var265 = ui.find("Miscellaneous", "Main", "Movement", "Strafe Assist")

local function var266(arg1, arg2, arg3)
	return arg1 + arg3 * (arg2 - arg1)
end

local function var267(arg1, arg2, arg3, arg4)
	arg1.x = arg1.x - 10 + math.abs(arg1.x) / 9

	local var1 = vector():angles(arg1)
	local var2 = arg4 * 1.25
	local var3 = math.clamp(arg2 * 0.9, 15, 750)
	local var4 = math.clamp(arg3, 0, 1)
	local var5 = var3 * var266(var263, 1, var4)
	local var6 = var1

	for iter1 = 1, 8 do
		var6 = (var1 * (var6 * var5 + var2):length() - var2) / var5

		var6:normalize()
	end


	local var7 = var6:angles()

	if var7.x > -10 then
		var7.x = 0.9 * var7.x + 9
	else
		var7.x = 1.125 * var7.x + 11.25
	end


	return var7
end

local function var268(arg1)
	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	local var2 = var1:get_player_weapon()

	if var2 == nil then
		return
	end


	local var3 = var2:get_weapon_info()

	if var3 == nil then
		return
	end


	arg1.angles = var267(arg1.angles, var3.throw_velocity, var2.m_flThrowStrength, arg1.velocity)
end

local function var269(arg1)
	if arg1.view_angles:clone() ~= render.camera_angles() then
		return
	end


	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	local var2 = var1:get_player_weapon()

	if var2 == nil then
		return
	end


	local var3 = var2:get_weapon_info()

	if var3 == nil or var3.weapon_type ~= 9 then
		return
	end


	if var2.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
		return
	end


	local var4 = var1:simulate_movement()

	var4:think()

	arg1.view_angles, arg1.in_speed = var267(arg1.view_angles, var3.throw_velocity, var2.m_flThrowStrength, var4.velocity), true

	var264:override(false)
	var265:override(false)
end

local function var270(arg1)
	var264:override()
	var265:override()
	var269(arg1)
end

var86.features.super_toss.enabled:set_callback(function(arg1)
	local var1 = arg1:get()

	events.createmove(var270, var1)
	events.grenade_override_view(var268, var1)
end)

local var271
local var272 = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")

local function var273()
	local var1 = entity.get_local_player()

	if var1 == nil then
		return false
	end


	local var2 = var1:get_player_weapon()

	if var2 == nil then
		return false
	end


	local var3 = var2:get_weapon_info()

	if var3 == nil or var3.weapon_type ~= 9 then
		return false
	end


	return var2.m_bPinPulled
end

local function var274()
	var272:override()
end

local function var275(arg1)
	if var273() then
		var272:override({})
	else
		var272:override()
	end
end

var86.features.grenade_throw_fix.enabled:set_callback(function(arg1)
	local var1 = arg1:get()

	events.shutdown(var274, var1)
	events.createmove(var275, var1)
end)

local var276
local var277 = bit.lshift(1, 0)
local var278 = 0
local var279 = 1
local var280 = 2
local var281 = 3
local var282 = 4
local var283 = 5
local var284 = 6
local var285 = 7
local var286 = 10
local var287 = 0
local var288 = 1
local var289 = 2
local var290 = 3
local var291 = 4
local var292 = 5
local var293 = 6
local var294 = 7
local var295 = 8
local var296 = 9
local var297 = 10
local var298 = 11
local var299 = 12
local var300 = 13
local var301 = 14
local var302 = 15
local var303 = 16
local var304 = 17
local var305 = 18
local var306 = {
	[var287] = var279,
	[var292] = var280,
	[var290] = var281,
	[var295] = var284,
	[var294] = var285,
	[var299] = var284,
	[var298] = var285,
	[var304] = var282,
	[var302] = var283
}
local var307
local var308 = 0
local var309
local var310 = {}

local function var311(arg1)
	return {
		selection = {
			head_scale = ui.find("Aimbot", "Ragebot", "Selection", arg1, "Multipoint", "Head Scale"),
			body_scale = ui.find("Aimbot", "Ragebot", "Selection", arg1, "Multipoint", "Body Scale"),
			min_damage = ui.find("Aimbot", "Ragebot", "Selection", arg1, "Min. Damage"),
			hit_chance = ui.find("Aimbot", "Ragebot", "Selection", arg1, "Hit Chance")
		},
		safety = {
			body_aim = ui.find("Aimbot", "Ragebot", "Safety", arg1, "Body Aim"),
			safe_points = ui.find("Aimbot", "Ragebot", "Safety", arg1, "Safe Points"),
			ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", arg1, "Ensure Hitbox Safety")
		}
	}
end

var310["SSG-08"] = var311("SSG-08")
var310.Deagle = var311("Desert Eagle")
var310.Pistols = var311("Pistols")

local function var312()
	var307 = nil
	var308 = 0
	var309 = nil
end

local function var313()
	var11.rage.main.double_tap:override()
	var11.rage.main.peek_assist[4]:override()

	for iter1, iter2 in pairs(var310) do
		iter2.selection.head_scale:override()
		iter2.selection.body_scale:override()
		iter2.selection.hit_chance:override()
		iter2.safety.body_aim:override()
		iter2.safety.safe_points:override()
		iter2.safety.ensure_hitbox_safety:override()
	end
end

local function var314()
	local var1 = var86.features.algorithmic_peek.hit_chance:get()
	local var2 = var86.features.algorithmic_peek.unsafety:get()

	var11.rage.main.peek_assist[4]:override("On Shot")

	for iter1, iter2 in pairs(var310) do
		iter2.selection.head_scale:override(100)
		iter2.selection.body_scale:override(100)

		if var1 ~= -1 then
			iter2.selection.hit_chance:override(var1)
		end


		if var2 then
			iter2.safety.body_aim:override("Default")
			iter2.safety.safe_points:override("Default")
			iter2.safety.ensure_hitbox_safety:override({})
		end
	end
end

local function var315(arg1)
	if arg1 == var279 then
		return 4
	end


	if arg1 == var281 then
		return 1.25
	end


	if arg1 == var284 then
		return 0.75
	end


	if arg1 == var285 then
		return 0.75
	end


	return 1
end

local function var316(arg1, arg2, arg3, arg4)
	arg2 = arg2 * var315(arg3)

	if arg1.m_ArmorValue > 0 then
		if arg3 == var279 then
			if arg1.m_bHasHelmet then
				arg2 = arg2 * (arg4 * 0.5)
			end
		else
			arg2 = arg2 * (arg4 * 0.5)
		end
	end


	return arg2
end

local function var317(arg1, arg2, arg3, arg4, arg5)
	local var1 = arg2 - arg1
	local var2 = arg5.damage
	local var3 = arg5.armor_ratio
	local var4 = arg5.range
	local var5 = arg5.range_modifier
	local var6 = math.min(var4, var1:length())
	local var7 = var2 * math.pow(var5, var6 * 0.002)

	return (var316(arg3, var7, arg4, var3))
end

local function var318()
	return var86.features.algorithmic_peek.simulation_time:get() * 0.01
end

local function var319()
	return var86.features.algorithmic_peek.rate_limit:get() * 0.01
end

local function var320()
	return var11.rage.selection.minimum_damage:get()
end

local function var321()
	return var86.features.algorithmic_peek.developer_mode:get() and var86.features.algorithmic_peek.range:get() or 20
end

local function var322()
	return var86.features.algorithmic_peek.developer_mode:get() and var86.features.algorithmic_peek.retreat:get() or 25
end

local function var323()
	local var1 = {}

	if var86.features.algorithmic_peek.hitboxes:get("Head") then
		table.insert(var1, var287)
	end


	if var86.features.algorithmic_peek.hitboxes:get("Chest") then
		table.insert(var1, var292)
	end


	if var86.features.algorithmic_peek.hitboxes:get("Stomach") then
		table.insert(var1, var290)
	end


	if var86.features.algorithmic_peek.hitboxes:get("Legs") then
		table.insert(var1, var295)
		table.insert(var1, var294)
		table.insert(var1, var297)
		table.insert(var1, var296)
	end


	return var1
end

local function var324(arg1)
	return var306[arg1] or var278
end

local function var325(arg1)
	return arg1[0]
end

local function var326(arg1, arg2)
	local var1 = arg1:get_weapon_index()
	local var2 = arg2.weapon_type

	if var1 == 1 then
		return "Deagle"
	end


	if var1 == 64 then
		return "Revolver"
	end


	if var1 == 40 then
		return "SSG-08"
	end


	if var2 == 1 then
		return "Pistols"
	end


	return nil
end

local function var327(arg1, arg2, arg3, arg4, arg5)
	local var1 = {}
	local var2 = arg2:get_eye_position()
	local var3 = arg3:get_weapon_info()
	local var4 = arg4.m_iHealth

	for iter1 = 1, #arg1 do
		local var5 = arg1[iter1]
		local var6 = var324(var5)
		local var7 = arg4:get_hitbox_position(var5)
		local var8 = var317(var2, var7, arg4, var6, var3)
		local var9 = var8 < arg5
		local var10 = var8 < var4

		if var9 and var10 then
			-- block empty
		else
			table.insert(var1, {
				index = iter1,
				pos = var7
			})
		end
	end


	return var1
end

local function var328(arg1)
	if arg1 == nil then
		return false
	end


	local var1, var2 = pcall(var325, arg1)

	if not var1 or var2 == nil then
		return false
	end


	return true
end

local function var329(arg1)
	return var328(arg1.target)
end

local function var330(arg1)
	return not arg1.in_forward and not arg1.in_back and not arg1.in_moveleft and not arg1.in_moveright
end

local function var331(arg1)
	return true
end

local function var332(arg1, arg2, arg3)
	if arg1 == nil or arg2 == nil then
		return false
	end


	if arg3.max_clip1 == 0 or arg2.m_iClip1 == 0 then
		return false
	end


	if globals.curtime < arg1.m_flNextAttack then
		return false
	end


	if globals.curtime < arg2.m_flNextPrimaryAttack then
		return false
	end


	return true
end

local function var333()
	return true
end

local function var334(arg1, arg2)
	local var1 = {
		ctx = arg1,
		target = arg2
	}

	var1.simtime = 0
	var1.retreat = -1
	var1.teleport = 0

	return var1
end

local function var335(arg1)
	return arg1:simulate_movement(nil, vector(), 1)
end

local function var336(arg1, arg2, arg3)
	local var1, var2 = utils.trace_bullet(arg1, arg2, arg3, function(arg1)
		return arg1 ~= arg1 and arg1:is_enemy()
	end)

	return var1, var2
end

local function var337(arg1, arg2, arg3, arg4, arg5)
	local var1 = arg2.m_iHealth

	for iter1 = 1, #arg4 do
		local var2 = arg4[iter1]
		local var3, var4 = var336(arg1, arg3, var2.pos)
		local var5 = arg5 <= var3
		local var6 = var1 <= var3

		if var5 or var6 then
			return true
		end
	end


	return false
end

local function var338(arg1, arg2, arg3, arg4, arg5)
	local var1 = arg1.origin + vector(0, 0, arg1.view_offset)

	return arg1, var337(arg2, arg3, var1, arg4, arg5)
end

local function var339(arg1, arg2, arg3, arg4, arg5, arg6, arg7)
	arg1.view_angles.y = arg5

	arg4:think(1)

	if bit.band(arg4.flags, var277) == 0 then
		return nil, false
	end


	local var1, var2 = var338(arg4, arg2, arg3, arg6, arg7)

	if var2 then
		arg4:think(1)
	end


	return arg4, var2
end

local function var340(arg1, arg2, arg3)
	if not var333() then
		return false
	end


	local var1 = globals.frametime
	local var2 = var319()
	local var3 = var320()
	local var4 = var323()

	if var307 ~= nil and var329(var307) then
		local var5 = var307.ctx
		local var6 = var307.target
		local var7 = var6.m_iHealth

		if var3 >= 100 then
			var3 = var3 + var7 - 100
		end


		local var8 = var327(var4, arg2, arg3, var6, var3)
		local var9, var10 = var338(var5, arg2, var6, var8, var3)

		if var10 then
			var307.simtime = 0
		end


		var307.simtime = var307.simtime + var1

		return true
	end


	if var2 > 0 then
		if var308 > 0 then
			var308 = var308 - var1

			return false
		end


		var308 = var2
	end


	if not var330(arg1) then
		return false
	end


	local var11 = arg2.m_fFlags

	if bit.band(var11, var277) == 0 then
		return false
	end


	if arg2.m_vecVelocity:length2dsqr() > 6400 then
		return false
	end


	local var12 = entity.get_threat()

	if var12 == nil or var12:is_dormant() then
		return false
	end


	local var13 = var12.m_iHealth

	if var3 >= 100 then
		var3 = var3 + var13 - 100
	end


	local var14 = var327(var4, arg2, arg3, var12, var3)

	if var337(arg2, var12, arg2:get_eye_position(), var14, var3) then
		return false
	end


	local var15
	local var16
	local var17 = arg2:get_origin()
	local var18 = (var12:get_origin() - var17):angles().y + 180
	local var19 = var18 - 90
	local var20 = var18 + 90
	local var21 = arg1.view_angles:clone()
	local var22 = arg1.forwardmove
	local var23 = arg1.sidemove
	local var24 = arg1.in_duck
	local var25 = arg1.in_jump
	local var26 = arg1.in_speed

	arg1.forwardmove = 450
	arg1.sidemove = 0
	arg1.in_duck = false
	arg1.in_jump = false
	arg1.in_speed = false

	local var27 = var335(arg2)
	local var28 = var335(arg2)
	local var29 = 0
	local var30 = 0

	for iter1 = 1, var321() do
		if var29 ~= -1 then
			var29 = iter1

			local var31, var32 = var339(arg1, arg2, var12, var27, var19, var14, var3)

			if var31 == nil then
				var29 = -1
			end


			if var32 then
				var307 = var334(var31, var12)

				break
			end
		end


		if var30 ~= -1 then
			var30 = iter1

			local var33, var34 = var339(arg1, arg2, var12, var28, var20, var14, var3)

			if var33 == nil then
				var30 = -1
			end


			if var34 then
				var307 = var334(var33, var12)

				break
			end
		end
	end


	arg1.view_angles.y = var21.y
	arg1.forwardmove = var22
	arg1.sidemove = var23
	arg1.in_duck = var24
	arg1.in_jump = var25
	arg1.in_speed = var26

	return var307 ~= nil
end

local function var341(arg1, arg2, arg3)
	local var1 = arg3 - arg2:get_origin()
	local var2 = var1:length2dsqr()

	if var2 < 25 then
		local var3 = arg2.m_vecVelocity
		local var4 = var3:length()

		arg1.move_yaw = var3:angles().y
		arg1.forwardmove = -var4
		arg1.sidemove = 0

		return true, var2
	end


	arg1.move_yaw = var1:angles().y
	arg1.forwardmove = 450
	arg1.sidemove = 0

	return false, var2
end

local function var342(arg1)
	arg1.in_duck = false
	arg1.in_jump = false
	arg1.in_speed = false
	arg1.in_forward = true
	arg1.in_back = false
	arg1.in_moveleft = false
	arg1.in_moveright = false
end

local function var343(arg1, arg2, arg3, arg4)
	local var1 = var332(arg2, arg3, arg4)
	local var2 = var340(arg1, arg2, arg3)

	if var307 == nil then
		return
	end


	if var318() < var307.simtime then
		var2 = false
	end


	if arg4.weapon_type == 5 and not arg2.m_bIsScoped then
		var2 = false
	end


	if var307.retreat <= 0 and var2 then
		local var3 = var307.ctx

		if var309 == nil then
			local var4 = arg2:get_origin()
			local var5 = var3.origin - var4

			var5:normalize()

			local var6 = var3.origin - var5 * var322()

			var309 = utils.trace_hull(var4, var6, var3.obb_mins, var3.obb_maxs, arg2, 33636363, 0).end_pos
		end


		local var7, var8 = var341(arg1, arg2, var3.origin)
		local var9 = var11.rage.main.peek_assist[2][2]:get()

		var342(arg1)
		var314()

		var307.retreat = 0

		if var7 then
			var307.retreat = 1
		end


		var6.box_new(var3.origin, var3.obb_mins, var3.obb_maxs, vector(), color(0, 0, 0, 0), var9, globals.tickinterval * 2)

		if var86.features.algorithmic_peek.uncharge:get() then
			rage.exploit:force_teleport()
		end


		return
	end


	if not var1 then
		var312()

		return
	end


	if var307.ctx == nil or var307.retreat == -1 then
		return
	end


	var307.retreat = var307.retreat + 1

	local var10, var11 = var341(arg1, arg2, var309)
	local var12 = arg2:get_origin()
	local var13 = arg2.m_vecVelocity
	local var14 = (var309 - var12):angles() - var13:angles()
	local var15 = var13:length2dsqr()

	var342(arg1)
	var314()

	if var15 > 1600 and math.abs(var14.y) < 20 then
		if var86.features.algorithmic_peek.uncharge:get() then
			return
		else
			rage.exploit:force_teleport()
			var11.rage.main.double_tap:override(false)
		end
	end


	if var1 and var10 then
		var312()
		var313()
	end
end

local function var344(arg1)
	if not var11.rage.main.peek_assist[1]:get() then
		var312()
		var313()

		return
	end


	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	local var2 = var1:get_player_weapon()

	if var2 == nil then
		return
	end


	local var3 = var2:get_weapon_info()

	if var3 == nil then
		return
	end


	local var4 = var326(var2, var3)

	if not var331(var4) then
		var313()

		return
	end


	var343(arg1, var1, var2, var3)
end

local function var345()
	if var307 == nil then
		return nil
	end


	var312()
end

var86.features.algorithmic_peek.enabled:set_callback(function(arg1)
	local var1 = arg1:get()

	if not var1 then
		var312()
		var313()
	end


	events.aim_fire(var345, var1)
	events.createmove(var344, var1)
end, true)

local var346
local var347 = cvar.r_aspectratio

local function var348(arg1)
	if arg1 == 0 then
		var347:float(0, false)
	else
		var347:float(arg1, true)
	end
end

local function var349()
	var348(0)
end

local var350 = var86.features.aspect_ratio

local function var351(arg1)
	var348(arg1:get() * 0.01)
end

local function var352(arg1)
	local var1 = arg1:get()

	if var1 then
		var350.value:set_callback(var351, true)
	else
		var350.value:unset_callback(var351)
		var348(0)
	end


	events.shutdown(var349, var1)
end

var350.enabled:set_callback(var352, true)

local var353
local var354 = var86.features.contrast_boost
local var355 = ui.find("Visuals", "World", "Ambient", "Post Processing")
local var356 = 0
local var357 = false

local function var358()
	return var354.interval:get() / 100
end

local function var359()
	local var1 = globals.realtime - var356 < var358()

	if var357 ~= var1 then
		var357 = var1

		var355:override(var1)
	end
end

local function var360(arg1)
	if arg1.state == nil then
		var356 = globals.realtime
	end
end

local var361

local function var362(arg1)
	local var1 = arg1:get()

	events.render(var359, var1)
	events.aim_ack(var360, var1)
end

var354.enabled:set_callback(var362, true)

local var363
local var364
local var365 = {}
local var366 = {}

var366.__index = var366

local var367 = 0
local var368 = false

local function var369(arg1)
	local var1 = {}

	for iter1, iter2 in pairs(arg1) do
		var1[iter1] = iter2
	end


	return var1
end

local function var370(arg1, arg2)
	for iter1 = 1, #arg1 do
		if arg1[iter1] == arg2 then
			return iter1
		end
	end


	return nil
end

local function var371(arg1, arg2)
	for iter1 = #arg1, 1, -1 do
		if arg1[iter1] == arg2 then
			table.remove(arg1, iter1)

			break
		end
	end
end

local function var372(arg1, arg2)
	if arg2.choked_commands ~= 0 then
		return
	end


	if rage.exploit:get() == 1 then
		local var1 = arg1.delay

		if var1 == nil or var1 < 1 then
			var1 = 1
		end


		var367 = var367 + 1

		if var1 > var367 then
			return
		end
	end


	local var2 = true

	if type(arg1.options) == "table" and var370(arg1.options, "Randomize Jitter") then
		var2 = utils.random_int(0, 1) == 1
	end


	if var2 then
		var368 = not var368
	end


	var367 = 0
end

local function var373(arg1, arg2)
	if arg1.options == nil then
		return
	end


	local var1 = var369(arg1.options)

	if var370(var1, "Jitter") then
		arg1.inverter = var368

		var371(var1, "Jitter")
	end


	var371(var1, "Randomize Jitter")

	arg1.options = var1
end

local function var374(arg1, arg2)
	if arg1.yaw_modifier == "Offset" then
		local var1 = arg1.yaw_offset or 0
		local var2 = arg1.modifier_offset

		arg1.yaw_modifier = "Disabled"
		arg1.modifier_offset = 0
		arg1.yaw_offset = var1 + (var368 and var2 or 0)

		return
	end


	if arg1.yaw_modifier == "Center" then
		local var3 = arg1.yaw_offset or 0
		local var4 = -arg1.modifier_offset

		if not var368 then
			var4 = -var4
		end


		arg1.yaw_modifier = "Disabled"
		arg1.modifier_offset = 0
		arg1.yaw_offset = var3 + var4 / 2

		return
	end
end

local function var375(arg1, arg2)
	if arg1.yaw_left ~= nil and arg1.yaw_right ~= nil then
		if arg1.yaw_offset == nil then
			arg1.yaw_offset = 0
		end


		local var1 = var368 and arg1.yaw_left or arg1.yaw_right

		arg1.yaw_offset = arg1.yaw_offset + var1
	end
end

local function var376(arg1)
	var11.aa.angles.enabled:override(arg1.enabled)
	var11.aa.angles.pitch:override(arg1.pitch)
	var11.aa.angles.yaw[1]:override(arg1.yaw)
	var11.aa.angles.yaw[2]:override(arg1.yaw_base)
	var11.aa.angles.yaw[3]:override(arg1.yaw_offset)
	var11.aa.angles.yaw[4]:override(arg1.avoid_backstab)
	var11.aa.angles.yaw[5]:override(arg1.hidden)
	var11.aa.angles.yaw_modifier[1]:override(arg1.yaw_modifier)
	var11.aa.angles.yaw_modifier[2]:override(arg1.modifier_offset)
	var11.aa.angles.body_yaw[1]:override(arg1.body_yaw)
	var11.aa.angles.body_yaw[2]:override(arg1.inverter)
	var11.aa.angles.body_yaw[3]:override(arg1.left_limit)
	var11.aa.angles.body_yaw[4]:override(arg1.right_limit)
	var11.aa.angles.body_yaw[5]:override(arg1.options)
	var11.aa.angles.body_yaw[6]:override(arg1.freestanding_body_yaw)
	var11.aa.angles.freestanding[1]:override(arg1.freestanding)
	var11.aa.angles.freestanding[2]:override(arg1.disable_yaw_modifiers)
	var11.aa.angles.freestanding[3]:override(arg1.body_freestanding)
	var11.aa.angles.extended_angles[1]:override(arg1.extended_angles)
	var11.aa.angles.extended_angles[2]:override(arg1.extended_pitch)
	var11.aa.angles.extended_angles[3]:override(arg1.extended_roll)
end

function var366.clear(arg1)
	for iter1 in pairs(arg1) do
		arg1[iter1] = nil
	end
end

function var366.update(arg1, arg2)
	if arg2 ~= nil then
		var372(arg1, arg2)
		var373(arg1, arg2)
		var374(arg1, arg2)
		var375(arg1, arg2)
	end


	var376(arg1)
end

setmetatable(var365, var366)

local var377 = {}
local var378 = var86.antiaim.manual_yaw
local var379 = {
	Forward = 180,
	Right = 90,
	Left = -90,
	Backward = 0
}

local function var380()
	return var379[var378.select:get()]
end

function var377.update(arg1, arg2)
	local var1 = var380()

	if var1 == nil then
		return false
	end


	if arg2.yaw_offset == nil then
		arg2.yaw_offset = 0
	end


	arg2.yaw_offset = arg2.yaw_offset + var1
	arg2.yaw_base = "Local View"

	if var378.body_freestanding:get() then
		arg2.body_yaw = true
		arg2.left_limit = 60
		arg2.right_limit = 60
		arg2.options = {}
		arg2.freestanding_body_yaw = "Peek Fake"
	end


	if var378.disable_yaw_modifiers:get() then
		arg2.yaw_left = 0
		arg2.yaw_right = 0
		arg2.yaw_modifier = "Disabled"
		arg2.body_yaw = true
		arg2.inverter = false
		arg2.left_limit = 0
		arg2.right_limit = 0
		arg2.options = {}
		arg2.freestanding_body_yaw = "Off"
	end


	arg2.freestanding = false

	return true
end

local var381 = {}
local var382 = var86.antiaim.freestanding

function var381.update(arg1, arg2)
	if not var382.enabled:get() then
		arg2.freestanding = false

		return false
	end


	arg2.hidden = false
	arg2.freestanding = true
	arg2.disable_yaw_modifiers = var382.disable_yaw_modifiers:get()
	arg2.body_freestanding = var382.body_freestanding:get()

	if var382.disable_all_modifiers:get() then
		arg2.yaw_left = 0
		arg2.yaw_right = 0
		arg2.yaw_modifier = "Disabled"
		arg2.body_yaw = true
		arg2.inverter = false
		arg2.left_limit = 0
		arg2.right_limit = 0
		arg2.options = {}
		arg2.freestanding_body_yaw = "Off"
	end


	return true
end

local var383 = {}
local var384 = var86.antiaim.animations
local ____________struct___________________float__m_flLayerAnimtime__________________float__m_flLayerFadeOuttime______________________dispatch_flags_________________void_ = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ")

local function var385(arg1)
	return ffi.cast(____________struct___________________float__m_flLayerAnimtime__________________float__m_flLayerFadeOuttime______________________dispatch_flags_________________void_, ffi.cast("uintptr_t", arg1[0]) + 10640)[0]
end

local function var386(arg1, arg2)
	if not var384.options:get("Force Falling") then
		return
	end


	arg1.m_flPoseParameter[6] = 0.5
end

local function var387(arg1, arg2)
	if not var384.options:get("Leg Breaker") then
		return
	end


	if var33.is_onground then
		arg1.m_flPoseParameter[0] = 1

		var11.aa.misc.leg_movement:override("Sliding")

		if var384.moonwalk_mode:get() then
			arg1.m_flPoseParameter[7] = 0

			var11.aa.misc.leg_movement:override("Walking")
		end


		return
	end


	if var384.moonwalk_in_air_mode:get() then
		local var1 = arg2[6]

		var1.m_flWeight = 1
		var1.m_flCycle = globals.curtime * 0.55 % 1
	end
end

local function var388(arg1, arg2)
	if not var384.options:get("Move Lean") then
		return
	end


	if var33.is_onground and not var384.on_ground_force:get() then
		return
	end


	local var1 = arg2[12].m_flWeight
	local var2 = var384.move_lean_force:get() * 1000

	arg2[12].m_flWeight = math.clamp(var1 + var1 * var2, 0, 1)
end

local function var389(arg1, arg2)
	if not var384.options:get("Landing Pitch") then
		return
	end


	if arg2.landing then
		arg1.m_flPoseParameter[12] = 0.5
	end
end

local function var390(arg1)
	if entity.get_local_player() ~= arg1 then
		return
	end


	local var1 = arg1:get_anim_state()

	if var1 == nil then
		return
	end


	local var2 = var385(arg1)

	if var2 == nil then
		return
	end


	if var33.is_onground then
		var389(arg1, var1)
	else
		var386(arg1, var2)
	end


	var388(arg1, var2)
	var387(arg1, var2)
end

local function var391(arg1)
	events.post_update_clientside_animation(var390, arg1:get())
end

var384.enabled:set_callback(var391, true)

local var392 = {}
local var393 = var86.antiaim.avoid_backstab

function var392.update(arg1, arg2)
	arg2.avoid_backstab = var393.enabled:get()
end

local var394 = {}
local var395 = var86.antiaim.force_defensive
local var396 = var86.antiaim.tickbase

local function var397(arg1)
	return var395.conditions:get(arg1)
end

local function var398()
	var11.rage.main.hide_shots_options:override("Break LC")
	var11.rage.main.double_tap_lag_options:override("Always On")
end

local function var399(arg1)
	if not var396.enabled:get() then
		return
	end


	if not var396.randomize:get() then
		arg1.force_defensive = arg1.command_number % var396.choke:get() == 0

		return
	end


	local var1 = var396.type:get()

	if var1 == "Default" then
		local var2 = math.random(var396[1]:get(), var396[2]:get())

		arg1.force_defensive = arg1.command_number % var2 == 0

		return
	end


	if var1 == "Ways" then
		local var3 = math.random(1, var396.sliders:get())
		local var4 = var396[var3]:get()

		arg1.force_defensive = arg1.command_number % var4 == 0

		return
	end
end

function var394.update(arg1, arg2, arg3)
	if not var395.enabled:get() then
		return
	end


	if not var397(arg3) then
		return
	end


	arg2.hidden = false

	var398()
	var399(arg1)
end

local var400 = {}
local var401 = var86.antiaim.edge_yaw

function var400.update(arg1, arg2)
	if not var401.enabled:get() then
		return false
	end


	local var1 = entity.get_local_player()

	if var1 == nil then
		return false
	end


	local var2 = var1:get_eye_position()

	if var2 == nil then
		return false
	end


	local var3 = 0
	local var4 = {}

	for iter1 = 18, 360, 18 do
		local var5 = var2 + vector():angles(0, iter1) * 32
		local var6 = utils.trace_line(var2, var5, var1, 4294967295, 1)
		local var7 = var6.entity

		if var6.fraction == 1 or var7 == nil or var6:did_hit_non_world() then
			-- block empty
		else
			var3 = var3 + 1

			table.insert(var4, iter1)
		end
	end


	if var3 < 2 then
		return false
	end


	local var8 = arg1.view_angles
	local var9 = (var4[1] + var4[var3]) * 0.5
	local var10 = math.normalize_yaw(-var8.y + var9)

	if math.abs(var10) > 90 then
		return
	end


	local var11 = var10 * 2 + 180

	if arg2.yaw_offset == nil then
		arg2.yaw_offset = 0
	end


	arg2.yaw_offset = arg2.yaw_offset + var11
	arg2.yaw_base = "Local View"
	arg2.hidden = false

	return true
end

local var402 = {}
local var403 = var86.antiaim.safe_head

local function var404()
	local var1 = entity.get_local_player()

	if var1 == nil then
		return nil
	end


	local var2 = entity.get_threat()

	if var2 == nil then
		return nil
	end


	local var3 = var1:get_player_weapon()

	if var3 == nil then
		return nil
	end


	local var4 = var3:get_weapon_info()
	local var5 = var3:get_weapon_index() == 31
	local var6 = var4.weapon_type == 0 and not var5
	local var7 = not var33.is_onground
	local var8 = var33.duck_amount >= 0.66
	local var9 = var1:get_origin()
	local var10 = (var2:get_origin() - var9):length2dsqr()

	if var7 and var8 then
		if var6 and var403.conditions:get("Knife") then
			return "Knife"
		end


		if var5 and var403.conditions:get("Zeus") then
			return "Zeus"
		end
	end


	if var7 and var8 and var10 > 1000000 and var403.conditions:get("Distance") then
		if not var6 or var5 then
			return
		end


		return "Distance"
	end


	return nil
end

function var402.update(arg1, arg2)
	if not var403.enabled:get() then
		return false
	end


	local var1 = var404()

	if var1 == nil then
		return false
	end


	arg2.hidden = false
	arg2.pitch = "Down"

	if var1 == "Knife" then
		arg2.yaw_offset = 0
		arg2.yaw_base = "At Target"
		arg2.yaw_modifier = "Disabled"
		arg2.body_yaw = true
		arg2.inverter = false
		arg2.left_limit = 0
		arg2.right_limit = 0
		arg2.options = {}
		arg2.freestanding_body_yaw = "Off"
	end


	if var1 == "Zeus" then
		arg2.yaw_offset = 0
		arg2.yaw_base = "At Target"
		arg2.yaw_modifier = "Disabled"
		arg2.body_yaw = true
		arg2.inverter = false
		arg2.left_limit = 0
		arg2.right_limit = 0
		arg2.options = {}
		arg2.freestanding_body_yaw = "Off"
	end


	if var1 == "Distance" then
		arg2.yaw_offset = -0
		arg2.yaw_base = "At Target"
		arg2.yaw_modifier = "Disabled"
		arg2.body_yaw = true
		arg2.inverter = false
		arg2.left_limit = 0
		arg2.right_limit = 0
		arg2.options = {}
		arg2.freestanding_body_yaw = "Off"
	end


	return true
end

local var405 = {}
local var406 = var86.antiaim.wateroff_exploit
local var407 = {
	is_active = false,
	last_offset = -90,
	flick_state = false,
	last_time = globals.realtime
}

local function var408()
	if entity.get_local_player() == nil then
		return nil
	end


	local var1 = to_time(var406.Interval:get())

	if globals.realtime >= var407.last_time + var1 then
		var407.last_time = globals.realtime
		var407.is_active = not var407.is_active
		var407.flick_state = not var407.flick_state

		if var407.is_active then
			var407.last_offset = var407.last_offset == -90 and 90 or -90
		end
	end


	return var407.is_active
end

function var405.update(arg1, arg2)
	if not var406.enabled:get() then
		return false
	end


	local var1 = var408()

	if var1 == nil then
		return false
	end


	if var1 then
		arg2.hidden = false
		arg2.pitch = "Down"
		arg2.yaw_offset = var407.last_offset
		arg2.yaw_base = "At Target"
		arg2.yaw_modifier = "off"
		arg2.body_yaw = true
		arg2.inverter = false
		arg2.left_limit = 60
		arg2.right_limit = 60
		arg2.options = {}
		arg2.freestanding_body_yaw = "Off"
		arg1.force_defensive = true

		return true
	else
		arg2.yaw_offset = 0
		arg2.yaw_base = "At Target"
		arg2.yaw_modifier = "Off"
		arg2.modifier_offset = 20
		arg2.body_yaw = false
		arg2.inverter = false
		arg2.left_limit = 60
		arg2.right_limit = 60
		arg2.options = {
			"Jitter"
		}
		arg2.freestanding_body_yaw = "Off"
		arg1.force_defensive = false
	end


	return false
end

local var409 = {}
local var410 = 0
local var411 = 0
local var412 = var86.antiaim.defensive
local var413 = var412.list
local var414 = var412.layout

local function var415(arg1, arg2)
	arg1.enabled:visibility(arg2)

	if not arg1.enabled:get() then
		arg2 = false
	end


	arg1.pitch:visibility(arg2)

	local var1 = arg1.pitch:get()
	local var2 = var1 == "Custom"
	local var3 = var1 == "Static Random"

	arg1.pitch_offset:visibility(arg2 and var2)
	arg1.pitch_from:visibility(arg2 and var3)
	arg1.pitch_to:visibility(arg2 and var3)
	arg1.yaw:visibility(arg2)

	local var4 = arg1.yaw:get()
	local var5 = var4 == "Spin" or var4 == "Custom"
	local var6 = var4 == "Static Random"

	arg1.yaw_offset:visibility(arg2 and var5)
	arg1.yaw_from:visibility(arg2 and var6)
	arg1.yaw_to:visibility(arg2 and var6)
end

local function var416(arg1)
	local var1 = var412.condition:get()

	if arg1 == nil then
		var1 = nil
	end


	for iter1 = 1, #var413 do
		local var2 = var413[iter1]
		local var3 = var414[var2]

		if var3 == nil then
			-- block empty
		else
			local var4 = var2 == var1

			if var4 then
				var3.enabled:set_callback(var416)
				var3.pitch:set_callback(var416)
				var3.yaw:set_callback(var416)
			else
				var3.enabled:unset_callback(var416)
				var3.pitch:unset_callback(var416)
				var3.yaw:unset_callback(var416)
			end


			var415(var3, var4)
		end
	end
end

var412.condition:set_callback(var416, true)

local function var417(arg1)
	return var412.layout[arg1]
end

local function var418(arg1)
	local var1 = arg1.pitch:get()

	if var1 == "Up" then
		return -89
	end


	if var1 == "Down" then
		return 89
	end


	if var1 == "Zero" then
		return 0
	end


	if var1 == "Random" then
		return utils.random_int(-89, 89)
	end


	if var1 == "Progressive" then
		return (globals.curtime * 7 % 2 - 1) * 89
	end


	if var1 == "Static Random" then
		if var40.defensive_ticks == var40.max_defensive_ticks then
			if utils.random_int(1, 100) < 50 then
				var410 = arg1.pitch_from:get()
			else
				var410 = arg1.pitch_to:get()
			end
		end


		return var410
	end


	if var1 == "Custom" then
		return arg1.pitch_offset:get()
	end


	return nil
end

local function var419(arg1)
	local var1 = arg1.yaw:get()

	if var1 == "Jitter" then
		return bit.band(var33.sent_packets, 1) ~= 0 and -90 or 90
	end


	if var1 == "Opposite" then
		return 180
	end


	if var1 == "Spin" then
		return globals.curtime * (arg1.yaw_offset:get() * 12) % 360
	end


	if var1 == "Random" then
		return utils.random_int(-180, 180)
	end


	if var1 == "Povorotniki" then
		if globals.tickcount % 3 == 1 then
			return bit.band(var33.sent_packets, 1) ~= 0 and -90 or 90
		else
			return bit.band(var33.sent_packets, 1) ~= 0 and 90 or -90
		end
	end


	if var1 == "Progressive Spin" then
		return (globals.curtime * 7 % 3 - 1) * 179
	end


	if var1 == "Static Random" then
		if var40.defensive_ticks == var40.max_defensive_ticks then
			if utils.random_int(1, 100) < 50 then
				var411 = arg1.yaw_from:get()
			else
				var411 = arg1.yaw_to:get()
			end
		end


		return var411
	end


	if var1 == "Custom" then
		return -arg1.yaw_offset:get()
	end


	return nil
end

local function var420()
	var11.rage.main.hide_shots_options:override("Break LC")
	var11.rage.main.double_tap_lag_options:override("Always On")
end

local function var421(arg1)
	local var1 = var418(arg1)
	local var2 = var419(arg1)

	if var1 ~= nil then
		rage.antiaim:override_hidden_pitch(var1)
	end


	if var2 ~= nil then
		rage.antiaim:override_hidden_yaw_offset(var2)
	end
end

function var409.update(arg1, arg2)
	if not var412.enabled:get() then
		return false
	end


	if rage.exploit:get() == 0 then
		return false
	end


	local var1 = var45.get()
	local var2 = var417(var1)

	if var2 == nil or not var2.enabled:get() then
		return false
	end


	arg2.hidden = true

	var420()
	var421(var2)

	if globals.tickcount % 3 == 1 then
		return
	else
		arg2.yaw_left = 0
		arg2.yaw_right = 0
		arg2.yaw_modifier = "Disabled"
		arg2.body_yaw = true
		arg2.inverter = false
		arg2.left_limit = 0
		arg2.right_limit = 0
		arg2.options = {}
		arg2.freestanding_body_yaw = "Off"
	end


	return true
end

local var422 = {}
local var423 = 3
local var424 = 34
local var425 = 10000
local var426 = false

local function var427(arg1, arg2)
	return (arg1:get_origin() - arg2):length2dsqr() < var425
end

local function var428(arg1)
	if not arg1.m_bInBombZone then
		return false
	end


	if var86.antiaim.antiaim_on_use.e_fix:get() then
		local var1 = arg1:get_player_weapon()

		if var1 == nil then
			return false
		end


		return var1:get_classid() == var424
	end


	return true
end

local function var429(arg1)
	if arg1.m_iTeamNum ~= var423 then
		return false
	end


	local var1 = arg1:get_origin()
	local var2 = entity.get_entities("CPlantedC4")

	for iter1 = 1, #var2 do
		local var3 = var2[iter1]

		if not var3.m_bBombTicking then
			-- block empty
		elseif var427(var3, var1) then
			return true
		end
	end


	return false
end

local function var430(arg1)
	local var1 = render.camera_angles()
	local var2 = arg1:get_eye_position()
	local var3 = var2 + vector():angles(var1) * 128
	local var4 = utils.trace_line(var2, var3, arg1, 4294967295, 0)

	if var4.entity == nil or var4.fraction == 1 then
		return false
	end


	if arg1.m_bInBombZone then
		if var4.entity:get_classname():find("CWeapon") then
			return true
		end


		return false
	end


	return true
end

local function var431(arg1, arg2)
	local var1 = arg2.entity

	if var1 == nil then
		return false
	end


	if var1:get_classid() ~= 97 then
		return false
	end


	return (var1:get_origin() - arg1:get_origin()):length2dsqr() < 3000
end

local function var432(arg1)
	return var428(arg1) or var429(arg1)
end

local function var433(arg1)
	local var1 = render.camera_angles()
	local var2 = arg1:get_eye_position()
	local var3 = var2 + vector():angles(var1) * 128
	local var4 = vector(-1, -1, -1)
	local var5 = vector(1, 1, 1)
	local var6 = bit.bor(1, 2, 8, 16384, 33554432)

	return utils.trace_hull(var2, var3, var4, var5, arg1, var6, 0)
end

function var422.think(arg1, arg2)
	if not var86.antiaim.antiaim_on_use.enabled:get() then
		return false
	end


	local var1 = entity.get_local_player()

	if var1 == nil then
		return false
	end


	local var2 = arg1.in_use == true
	local var3 = var432(var1)

	if not var2 or var3 then
		var426 = false

		return false
	end


	local var4 = var433(var1)

	if var431(var1, var4) then
		return false
	end


	if not var426 then
		var426 = true

		if var430(var1) then
			return false
		end
	end


	return true
end

function var422.update(arg1, arg2, arg3)
	arg1.in_use = 0

	if arg2.yaw_offset == nil then
		arg2.yaw_offset = 0
	end


	if arg3 ~= "Legit AA" then
		arg2.pitch = "Disabled"
		arg2.yaw_base = "Local View"
	end


	arg2.yaw_offset = arg2.yaw_offset + 180
	arg2.freestanding = false
	arg2.extended_angles = false
	arg2.hidden = false

	return true
end

local var434 = {}
local var435 = var86.antiaim.builder
local var436 = var435.list
local var437 = var435.layout

local function var438(arg1, arg2)
	if arg1.enabled ~= nil then
		arg1.enabled:visibility(arg2)

		if not arg1.enabled:get() then
			arg2 = false
		end
	end


	arg1.pitch:visibility(arg2)
	arg1.yaw:visibility(arg2)
	arg1.yaw_modifier:visibility(arg2 and arg1.yaw:get() ~= "Disabled")
	arg1.body_yaw:visibility(arg2)
	arg1.delay:visibility(arg2)
end

local function var439(arg1)
	local var1 = var435.condition:get()

	if arg1 == nil then
		var1 = nil
	end


	for iter1 = 1, #var436 do
		local var2 = var436[iter1]
		local var3 = var437[var2]

		if var3 == nil then
			-- block empty
		else
			local var4 = var2 == var1

			if var4 then
				if var3.enabled ~= nil then
					var3.enabled:set_callback(var439)
				end


				var3.yaw:set_callback(var439)
			else
				if var3.enabled ~= nil then
					var3.enabled:unset_callback(var439)
				end


				var3.yaw:unset_callback(var439)
			end


			var438(var3, var4)
		end
	end
end

local function var440(arg1)
	local var1 = arg1:get()

	if var1 then
		var435.condition:set_callback(var439, true)
	else
		var435.condition:unset_callback(var439)
		var439(nil)
	end


	var435.condition:visibility(var1)
end

var435.enabled:set_callback(var440, true)

local function var441(arg1)
	local var1 = var435.layout[arg1]

	if var1 == nil or var1.enabled ~= nil and not var1.enabled:get() then
		return var435.layout.Shared
	end


	return var1
end

local function var442(arg1, arg2)
	arg1.pitch = arg2.pitch:get()
	arg1.yaw = arg2.yaw:get()
	arg1.yaw_base = arg2.yaw_base:get()
	arg1.yaw_left = arg2.yaw_left:get()
	arg1.yaw_right = arg2.yaw_right:get()
	arg1.yaw_modifier = arg2.yaw_modifier:get()

	local var1 = arg2.yaw_modifier_mode:get()

	arg1.modifier_offset = arg2.modifier_offset:get()

	if var1 == "Random" then
		arg1.modifier_offset = utils.random_int(arg2.modifier_min_offset:get(), arg2.modifier_max_offset:get())
	end


	if var1 == "Custom" then
		local var2 = math.random(1, arg2.modifier_sliders:get())

		arg1.modifier_offset = arg2["modifier_offset_" .. var2]:get()
	end


	arg1.hidden = false
	arg1.body_yaw = arg2.body_yaw:get()

	local var3 = arg2.body_yaw_mode:get()

	if var3 == "Ticks" then
		local var4 = arg2.body_yaw_ticks:get()

		if globals.tickcount % var4 <= 1 then
			arg1.body_yaw = false
		end
	end


	if var3 == "Random" then
		local var5 = utils.random_int(1, arg2.body_yaw_ticks:get())

		if globals.tickcount % var5 <= 1 then
			arg1.body_yaw = false
		end
	end


	arg1.left_limit = arg2.left_limit:get()
	arg1.right_limit = arg2.right_limit:get()
	arg1.options = arg2.options:get()
	arg1.freestanding_body_yaw = arg2.freestanding:get()

	if arg2.delay:get() then
		if arg2.delay_randomize:get() then
			local var6 = arg2.delay_type:get()

			if var6 == "Default" then
				arg1.delay = math.random(arg2["delay_" .. 1]:get(), arg2["delay_" .. 2]:get())
			end


			if var6 == "Ways" then
				local var7 = math.random(1, arg2.delay_sliders:get())

				arg1.delay = arg2["delay_" .. var7]:get()
			end
		else
			arg1.delay = arg2.delay_value:get()
		end
	end
end

function var434.update(arg1, arg2)
	if not var435.enabled:get() then
		return false
	end


	local var1 = var45.get()
	local var2 = var441(var1)

	if var2 == nil then
		return false
	end


	var442(arg2, var2)

	return true
end

local function var443(arg1)
	var365:clear()
	var11.rage.main.hide_shots_options:override()
	var11.rage.main.double_tap_lag_options:override()

	local var1 = var45.get()

	var394.update(arg1, var365, var1)

	if var422.think(arg1, var365) then
		local var2, var3 = var434.update(arg1, var365, "Legit AA")

		var422.update(arg1, var365, var3)
	else
		var434.update(arg1, var365)
		var392.update(arg1, var365)

		if not var377.update(arg1, var365) then
			var409.update(arg1, var365)

			if not var381.update(arg1, var365) then
				var400.update(arg1, var365)
			end


			var402.update(arg1, var365)
			var405.update(arg1, var365)
		end
	end


	var365:update(arg1)
end

events.createmove(var443)

local var444
local var445
local var446 = var86.features.watermark
local var447 = {}
local var448 = 1
local var449 = var69.new("watermark_simple")
local var450 = render.screen_size()

var449:set_pos(vector(var450.x * 0.495, var450.y * 0.985))

local function var451(arg1, arg2)
	return string.gsub(arg1, "%a", "%1" .. arg2, #arg1 - 1)
end

local function var452()
	local var1 = var451("spectral", "")

	return string.format("%s [%s]", var1, var3.build:lower())
end

function var447.render()
	local var1 = var449:get_pos():clone()
	local var2 = var452()
	local var3 = render.measure_text(var448, nil, var2)
	local var4 = var18.wave(var2, var446.color:get(), color(), globals.realtime)

	render.text(var448, var1, color(), "s", var4)
	var449:set_size(var3:clone())
end

local var453 = {}
local var454 = 14
local var455 = 8
local var456 = 8
local var457 = render.load_font("museo500", 14.2, "a")
local var458 = {}

var458.__index = var458

function var458.new(arg1)
	return setmetatable({}, {
		__index = arg1
	})
end

local var459 = {}
local var460 = var458:new()

var459.logo = var460

local var461 = vector()
local var462 = vector()
local var463 = vector()
local var464 = ui.get_icon("stars")
local var465 = "spectral"

function var460.get_size(arg1)
	return var461:clone()
end

function var460.compute(arg1)
	var462 = render.measure_text(var457, nil, var464)
	var463 = render.measure_text(var457, nil, var465)
	var461.x = var462.x + var463.x + 5
	var461.y = math.max(var462.y, var463.y)

	return true
end

function var460.draw(arg1, arg2)
	local var1 = var446.color:get()

	render.text(var457, arg2, var1, "s", var464)

	arg2.x = arg2.x + var462.x + 5

	render.text(var457, arg2, var1, "s", var465)
end

local var466 = var458:new()

var459.user = var466

local var467 = vector()
local var468 = vector()
local var469 = common.get_username()

function var466.get_size(arg1)
	return var467:clone()
end

function var466.compute(arg1)
	var468 = render.measure_text(var457, nil, var469)
	var467.x = var468.x
	var467.y = var468.y

	return true
end

function var466.draw(arg1, arg2)
	render.text(var457, arg2, color(), "s", var469)
end

local var470 = var458:new()

var459.fps = var470

local var471 = vector()
local var472 = vector()
local var473
local var474 = 0
local var475 = 0

local function var476()
	return var474 <= 0
end

local function var477(arg1)
	var474 = var474 - arg1
end

local function var478(arg1)
	var475 = math.floor(1 / arg1)
	var474 = 1
end

function var470.get_size(arg1)
	return var471:clone()
end

function var470.compute(arg1)
	local var1 = globals.frametime

	if var476() then
		var478(var1)
	end


	var477(var1)

	var473 = string.format("%d fps", var475)
	var472 = render.measure_text(var457, nil, var473)
	var471.x = var472.x
	var471.y = var472.y

	return true
end

function var470.draw(arg1, arg2)
	render.text(var457, arg2, color(), "s", var473)
end

local var479 = var458:new()

var459.ping = var479

local var480 = vector()
local var481 = vector()
local var482

function var479.get_size(arg1)
	return var480:clone()
end

function var479.compute(arg1)
	local var1 = utils.net_channel()

	if var1 == nil then
		return false
	end


	local var2 = math.floor(var1.latency[1] * 1000)

	var482 = string.format("%d ms", var2)
	var481 = render.measure_text(var457, nil, var482)
	var480.x = var481.x
	var480.y = var481.y

	return true
end

function var479.draw(arg1, arg2)
	render.text(var457, arg2, color(), "s", var482)
end

local var483 = var458:new()

var459.time = var483

local var484 = vector()
local var485 = vector()
local var486

local function var487(arg1)
	return string.format("%02d:%02d", arg1.hours, arg1.minutes)
end

function var483.get_size(arg1)
	return var484:clone()
end

function var483.compute(arg1)
	var486 = var487(common.get_system_time())
	var485 = render.measure_text(var457, nil, var486)
	var484.x = var485.x
	var484.y = var485.y

	return true
end

function var483.draw(arg1, arg2)
	render.text(var457, arg2, color(), "s", var486)
end

function var453.render()
	local var1 = render.screen_size()
	local var2 = vector(var1.x - 10, 10)
	local var3 = vector()
	local var4 = {}

	table.insert(var4, var459.logo)
	table.insert(var4, var459.user)
	table.insert(var4, var459.fps)
	table.insert(var4, var459.ping)
	table.insert(var4, var459.time)

	for iter1 = #var4, 1, -1 do
		local var5 = var4[iter1]

		if var5:compute() then
			local var6 = var5:get_size()

			var3.x = var3.x + var6.x
			var3.y = math.max(var3.y, var6.y)
		else
			table.remove(var4, iter1)
		end
	end


	var3.x = var3.x + var455 * 2
	var3.y = var3.y + var456 * 2

	local var7

	var3.x = var3.x + var454 * (#var4 - 1)
	var2.x = var2.x - var3.x

	local var8
	local var9 = 8
	local var10 = color(0, 0, 0, 50)
	local var11 = color(0, 0, 0, 5)

	render.blur(var2, var2 + var3, 0.25, 1, var9)
	render.rect(var2, var2 + var3, var10, var9)
	render.rect_outline(var2, var2 + var3, var11, 1, var9)

	var2.x = var2.x + var455
	var2.y = var2.y + var456

	for iter2 = 1, #var4 do
		if iter2 ~= 1 then
			var2.x = var2.x + var454
		end


		local var12 = var4[iter2]

		var12:draw(var2:clone())

		local var13 = var12:get_size()

		var2.x = var2.x + var13.x
	end
end

local var488

local function var489(arg1)
	local var1 = arg1:get()

	events.render(var447.render, var1 == "Simple")
	events.render(var453.render, var1 == "Default")
end

var446.style:set_callback(var489, true)

local var490
local var491 = var86.features.keybinds
local var492 = {}
local var493 = 10
local var494 = 8
local var495 = 8
local var496 = render.load_font("museo500", 14.2, "a")
local var497 = var69.new("keybinds", {
	pos = vector(200, 200),
	anchor = vector(0, 0)
})
local var498 = {}
local var499 = neverlose_smoothy.new(0)
local var500 = neverlose_smoothy.new(130)

local function var501(arg1, arg2)
	if next(arg2) == nil then
		arg2 = arg1:get()

		if next(arg2) == nil then
			arg2 = arg1:list()
		end
	end


	local var1 = {}

	for iter1 = 1, #arg2 do
		var1[#var1 + 1] = arg2[iter1]:sub(1, 1):lower()
	end


	return table.concat(var1, ", ")
end

local function var502(arg1)
	return (arg1:gsub("[\xE0-\xEF][\x80-\xBF][\x80-\xBF]", ""):gsub("[\xF0-\xF7][\x80-\xBF][\x80-\xBF][\x80-\xBF]", ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", " "))
end

local function var503(arg1)
	arg1 = arg1:gsub("\aDEFAULT", "")
	arg1 = arg1:gsub("\a{.-}", "")

	return arg1
end

local function var504(arg1)
	arg1 = var503(arg1)
	arg1 = var502(arg1)

	return arg1:lower()
end

local function var505(arg1, arg2, arg3)
	if type(arg3) == "boolean" then
		return arg3 and "on" or "off"
	end


	if type(arg3) == "table" then
		return var501(arg1, arg3)
	end


	return tostring(arg3):lower()
end

local function var506(arg1, arg2)
	local var1 = {}
	local var2 = false
	local var3 = 0
	local var4 = 0

	for iter1, iter2 in pairs(ui.get_binds()) do
		local var5 = iter2.reference:id()
		local var6 = var505(iter2.reference, iter2.mode, iter2.value)
		local var7 = var504(iter2.name)

		if iter2.active then
			var2 = true
			var1[var5] = iter2
		end


		var498[var5] = var498[var5] or {
			height = 0,
			value_width = 0,
			name_width = 0,
			alpha = neverlose_smoothy.new(0),
			name = var7,
			mode = iter2.mode,
			value = iter2.value,
			reference = iter2.reference
		}

		local var8 = var498[var5]
		local var9 = render.measure_text(arg1, arg2, var7)
		local var10 = render.measure_text(arg1, arg2, var6)

		var8.name = var7
		var8.value = var6
		var8.mode = iter2.mode
		var8.reference = iter2.reference
		var8.height = math.max(var9.y, var10.y)
		var8.name_width = var9.x
		var8.value_width = var10.x
	end


	for iter3, iter4 in pairs(var498) do
		local var11 = var1[iter3] ~= nil
		local var12 = iter4.alpha(0.05, var11)

		if var12 <= 0 then
			var498[iter3] = nil
		elseif var12 > 0 or var11 then
			if var3 < iter4.name_width then
				var3 = iter4.name_width
			end


			if var4 < iter4.value_width then
				var4 = iter4.value_width
			end
		end
	end


	return var498, var2, var3, var4
end

function var492.render()
	local var1, var2, var3, var4 = var506(var496, nil)
	local var5 = ui.get_alpha() == 1 or next(var1) ~= nil and var2
	local var6 = var491.enabled:get() and var5

	alpha = var499(0.05, var6)

	if alpha <= 0 then
		return
	end


	local var7 = var497:get_pos()
	local var8 = vector(0, 29)
	local var9 = 8
	local var10 = var7:clone()

	var8.x = var500(0.05, math.max(130, var8.x, var3 + var4 + 20 + var494 * 2))

	local var11
	local var12 = color(0, 0, 0, 50 * alpha)
	local var13 = color(0, 0, 0, 5 * alpha)

	render.blur(var10, var10 + var8, 0.25, alpha, var9)
	render.rect(var10, var10 + var8, var12, var9)
	render.rect_outline(var10, var10 + var8, var13, 1, var9)

	local var14
	local var15 = 6
	local var16 = ui.get_icon("keyboard")
	local var17 = "hotkeys"
	local var18 = render.measure_text(var496, nil, var16)
	local var19 = render.measure_text(var496, nil, var17)
	local var20 = var491.color:get()
	local var21 = var10 + var8 / 2
	local var22 = vector(var18.x + var19.x + var15, math.max(var18.y, var19.y))

	var20.a = var20.a * alpha
	var21.x = var21.x - var22.x / 2
	var21.y = var21.y - var22.y / 2

	render.text(var496, var21, var20, "s", var16)

	var21.x = var21.x + var18.x + var15

	render.text(var496, var21 - vector(0, 1), var20, "s", var17)

	var10.y = var10.y + var8.y + 5

	local var23
	local var24 = 0
	local var25 = vector(var8.x, 0)
	local var26 = 0

	for iter1, iter2 in pairs(var1) do
		local var27 = iter2.height
		local var28 = iter2.alpha.value

		var25.y = math.max(0, var25.y + var27 * var28)
		var26 = math.max(var26, var28)
		var24 = var24 + var28
	end


	var25.y = var25.y + var493 * (var24 - 1)

	if var26 > 0 then
		var25.y = var25.y + var495 * 2

		local var29
		local var30 = color(0, 0, 0, 50 * var26)
		local var31 = color(0, 0, 0, 5 * var26)

		render.push_clip_rect(var10, var10 + var25)
		render.blur(var10, var10 + var25, 0.25, var26, var9)
		render.rect(var10, var10 + var25, var30, var9)
		render.rect_outline(var10, var10 + var25, var31, 1, var9)

		var10.x = var10.x + var494
		var10.y = var10.y + var495

		for iter3, iter4 in pairs(var1) do
			local var32 = iter4.alpha.value
			local var33 = var10:clone()
			local var34 = var33:clone()
			local var35 = var33:clone()

			var35.x = var35.x + var8.x - iter4.value_width - var494 - var9

			render.text(var496, var34, color(255, 255, 255, 255 * var32), "d", iter4.name)
			render.text(var496, var35, color(255, 255, 255, 100 * var32), "d", iter4.value)

			var10.y = var10.y + (iter4.height + var493) * var32
		end


		render.pop_clip_rect()
	end


	var497:set_size(var8)
end

events.render(var492.render)

local var507
local var508 = 0.000925925925925926
local var509 = neverlose_smoothy.new(0)
local var510 = 0
local var511 = 0
local var512 = color()
local var513 = false
local var514 = false
local var515 = false
local var516 = false

local function var517(arg1)
	var11.visuals.world.main.scope_overlay:override(arg1 and "Remove All" or nil)
end

local function var518()
	var517(false)
end

local function var519()
	local var1 = entity.get_local_player()

	if var1 == nil or not var1:is_alive() then
		return
	end


	local var2 = var1.m_bIsScoped
	local var3 = var509(0.05, var2)

	if var3 == 0 then
		return
	end


	local var4 = render.screen_size()
	local var5 = var4 * 0.5
	local var6 = var511 * var4.y * var508
	local var7 = var510 * var4.y * var508
	local var8 = math.floor(var6)
	local var9 = math.floor(var7)
	local var10 = var9 - var8
	local var11 = var512:clone()
	local var12 = var512:clone()

	var11.a = var11.a * var3
	var12.a = 0

	if not var515 then
		local var13 = vector(var5.x, var5.y - var8 + 1)
		local var14 = vector(var13.x + 1, var5.y - var9)

		render.gradient(var13, var14, var11, var11, var12, var12)
	end


	if not var516 then
		local var15 = vector(var5.x, var5.y + var8)
		local var16 = vector(var15.x + 1, var5.y + var9)

		render.gradient(var15, var16, var11, var11, var12, var12)
	end


	if not var513 then
		local var17 = vector(var5.x - var8 + 1, var5.y)
		local var18 = vector(var17.x - var10, var5.y + 1)

		render.gradient(var17, var18, var11, var12, var11, var12)
	end


	if not var514 then
		local var19 = vector(var5.x + var8, var5.y)
		local var20 = vector(var19.x + var10, var5.y + 1)

		render.gradient(var19, var20, var11, var12, var11, var12)
	end
end

local function var520(arg1)
	events.shutdown(var518, arg1)
	events.render(var519, arg1)
end

local var521 = var86.features.scope_overlay

local function var522(arg1)
	var510 = arg1:get()
end

local function var523(arg1)
	var511 = arg1:get()
end

local function var524(arg1)
	var512 = arg1:get()
end

local function var525(arg1)
	var515 = arg1:get()
end

local function var526(arg1)
	local var1 = arg1:get()

	if var1 then
		var521.position:set_callback(var522, true)
		var521.offset:set_callback(var523, true)
		var521.color:set_callback(var524, true)
		var521.t_style:set_callback(var525, true)
	else
		var521.position:unset_callback(var522)
		var521.offset:unset_callback(var523)
		var521.color:unset_callback(var524)
		var521.t_style:unset_callback(var525)
	end


	var517(var1)
	var520(var1)
end

var521.enabled:set_callback(var526, true)

local var527
local var528
local var529 = false
local var530 = false

local function var531()
	local var1 = var11.visuals.world.main.force_thirdperson[1]:get()

	return var530 and var1 or var529 and not var1
end

local function var532(arg1)
	if var528 == nil then
		var528 = neverlose_smoothy.new(arg1.fov)
	end


	if not var531() then
		var528.value = arg1.fov
	else
		arg1.fov = var528:update(0.05, arg1.fov)
	end
end

local var533 = var86.features.fovanimations

local function var534(arg1)
	var529 = arg1:get("First Person")
	var530 = arg1:get("Third Person")
end

local function var535(arg1)
	local var1 = arg1:get()

	if var1 then
		var533.select:set_callback(var534, true)
	else
		var533.select:unset_callback(var534)
	end


	events.override_view(var532, var1)
end

var533.enabled:set_callback(var535, true)

local var536
local var537 = render.load_font("Verdana", 16, "ad")
local var538 = 40
local var539 = vector(1, 0.6666666666666666)
local var540 = vector(2, 0)
local var541 = color(17, 17, 17, 128)
local var542 = neverlose_smoothy.new(0)
local var543 = neverlose_smoothy.new(0)
local var544 = neverlose_smoothy.new(0)
local var545 = neverlose_smoothy.new(0)
local var546 = neverlose_smoothy.new(0)
local var547 = neverlose_smoothy.new(0)
local var548 = neverlose_smoothy.new(0)
local var549 = neverlose_smoothy.new(0)
local var550 = {}
local var551

local function var552(arg1, arg2, arg3)
	local var1 = arg1 * 0.5

	if arg2 ~= nil then
		var1.x = var1.x + arg2 * (arg1.y / 1080)
	end


	if arg3 ~= nil then
		var1.y = var1.y + arg3 * (arg1.y / 1080)
	end


	return var1
end

local function var553()
	local var1 = entity.get_local_player()
	local var2 = var86.antiaim.manual_yaw.select:get()
	local var3 = var1 ~= nil and var1:is_alive()
	local var4 = var3 and var1.m_bIsScoped
	local var5 = var3 and var2 == "Left"
	local var6 = var3 and var2 == "Right"
	local var7 = var3 and var2 == "Forward"
	local var8 = var3 and var2 == "Backward"
	local var9 = var3 and var33.abs_body_yaw < -10
	local var10 = var3 and var33.abs_body_yaw > 10
	local var11 = var542:update(0.05, var3)
	local var12 = var543:update(0.05, var4)
	local var13 = var544:update(0.05, var5 and var11 or 0)
	local var14 = var545:update(0.05, var6 and var11 or 0)
	local var15 = var546:update(0.05, var7 and var11 or 0)
	local var16 = var547:update(0.05, var8 and var11 or 0)
	local var17 = var548:update(0.05, var9 and var11 or 0)
	local var18 = var549:update(0.05, var10 and var11 or 0)

	if var11 <= 0 then
		return
	end


	local var19 = render.screen_size()

	if var551 == "Default" then
		local var20 = var550.Manual[1] or color()
		local var21
		local var22 = var552(var19, -var538) - vector(1, 0)
		local var23 = var20:clone()

		var23.a = var23.a * var13

		local var24 = "<"
		local var25 = "rs"
		local var26 = render.measure_text(var537, var25, var24)

		var22.y = var22.y - var4(var26.y * 0.5) - 1

		if var4 then
			var22.y = var22.y - var12 * 15
		else
			var22.y = var22.y - var12 * 15
		end


		render.text(var537, var22, var23, var25, var24)

		local var27
		local var28 = var552(var19, var538)
		local var29 = var20:clone()

		var29.a = var29.a * var14

		local var30 = ">"
		local var31 = "s"
		local var32 = render.measure_text(var537, var31, var30)

		var28.y = var28.y - var4(var32.y * 0.5) - 1

		if var4 then
			var28.y = var28.y - var12 * 15
		else
			var28.y = var28.y - var12 * 15
		end


		render.text(var537, var28, var29, var31, var30)

		local var33
		local var34 = var552(var19, var538)
		local var35 = var20:clone()

		var35.a = var35.a * var15

		local var36 = "^"
		local var37 = "s"
		local var38 = render.measure_text(var537, var37, var36)

		var34.x = var34.x - var4(var38.y * 3.56) - 1
		var34.y = var34.y - var4(var38.y * 3) - 1

		render.text(var537, var34, var35, var37, var36)
		render.text(var537, var34, var35, var37, var36)
	end


	if var551 == "Alternative" then
		local var39 = var539 * 13.5
		local var40 = var550.Manual[1] or color()
		local var41 = var550.Desync[1] or color()
		local var42
		local var43 = var552(var19, -var538) - vector(1, 0)
		local var44 = var541:lerp(var40, var13)

		var44.a = var44.a * var11

		local var45 = var541:lerp(var41, var17)

		var45.a = var45.a * var11

		render.rect(var43 - vector(0, var39.y), var43 + vector(var540.x, var39.y), var45)

		var43.x = var43.x - var540.x + 1

		local var46 = var43 + vector(0, -var39.y)
		local var47 = var43 + vector(0, var39.y)
		local var48 = var43 + vector(-var39.x, 0)

		render.poly(var44, var46, var47, var48)

		local var49
		local var50 = var552(var19, var538) + vector(1, 0)
		local var51 = var541:lerp(var40, var14)

		var51.a = var51.a * var11

		local var52 = var541:lerp(var41, var18)

		var52.a = var52.a * var11

		render.rect(var50 - vector(0, var39.y), var50 + vector(0, var39.y), var52)

		var50.x = var50.x + var540.x

		local var53 = var50 + vector(0, -var39.y)
		local var54 = var50 + vector(0, var39.y)
		local var55 = var50 + vector(var39.x, 0)

		render.poly(var51, var53, var54, var55)
	end
end

local function var554(arg1)
	events.render(var553, arg1)
end

local var555 = var86.features.antiaim_arrows

local function var556(arg1)
	local var1 = arg1:list()

	for iter1 = 1, #var1 do
		local var2 = var1[iter1]
		local var3 = arg1:get(var2)

		var550[var2] = var3
	end
end

local function var557(arg1)
	var551 = arg1:get()
end

local function var558(arg1)
	local var1 = arg1:get()

	if var1 then
		var555.color:set_callback(var556, true)
		var555.type:set_callback(var557, true)
	else
		var555.color:unset_callback(var556)
		var555.type:unset_callback(var557)
	end


	var554(var1)
end

var555.enabled:set_callback(var558, true)

local var559
local var560 = render.load_font("Verdana", 12, "ad")
local var561 = 2
local var562 = 1
local var563 = color():alpha_modulate(255)
local var564 = "Default"
local var565 = {}
local var566 = neverlose_smoothy.new()
local var567 = neverlose_smoothy.new()
local var568 = neverlose_smoothy.new()
local var569 = neverlose_smoothy.new()
local var570 = neverlose_smoothy.new()
local var571 = ""
local var572 = color():alpha_modulate(255)
local var573 = ""
local var574 = color():alpha_modulate(255)

local function var575(arg1, arg2)
	local var1 = var4(#arg1 * arg2)

	return (string.sub(arg1, 1, var1))
end

local function var576()
	local var1 = entity.get_local_player()
	local var2 = var86.antiaim.manual_yaw.select:get()
	local var3 = var1 ~= nil and var1:is_alive()
	local var4

	var4 = var3 and var1.m_bIsScoped

	local var5 = var3 and var2 == "Left"
	local var6 = var3 and var2 == "Right"
	local var7 = "spectral"
	local var8 = color(218, 118, 0)

	if var11.aa.angles.freestanding[1]:get() then
		var7 = "freestand"
		var8 = color(177, 151, 255)
	end


	if var6 or var5 then
		var7 = "fake yaw"
		var8 = color(177, 151, 255)
	end


	return var7, var8
end

local function var577()
	local var1 = "dynamic"
	local var2 = color(209, 139, 230)

	if var11.aa.angles.yaw[2]:get() == "Local View" then
		var1 = "default"
		var2 = color(255, 0, 0)
	end


	return var1, var2
end

local function var578(arg1, arg2, arg3, arg4, arg5)
	render.text(arg1, arg2, arg3, arg4, arg5)

	arg2.y = arg2.y + arg1.height
end

local function var579(arg1, arg2, arg3)
	local var1, var2 = var576()
	local var3 = var567:update(0.05, var1 == var571)

	if var3 <= 0.1 then
		var571 = var1
		var572 = var2
	end


	var578(arg1, arg2, var572, arg3, var575(var571, var3))
end

local function var580(arg1, arg2, arg3)
	local var1, var2 = var577()
	local var3 = var568:update(0.05, var1 == var573)

	if var3 <= 0.1 then
		var573 = var1
		var574 = var2
	end


	local var4 = var11.aa.angles.freestanding[1]:get() and rage.antiaim:get_target(true) ~= nil
	local var5 = var573

	if var4 and var5 == "dynamic" then
		var5 = var5 .. "+"
	end


	var578(arg1, arg2, var574, arg3, var575(var5, var3))
end

local function var581(arg1, arg2, arg3, arg4)
	if arg4 <= 0.1 then
		return
	end


	local var1 = "dt"
	local var2 = rage.exploit:get() == 1 and color(0, 255, 0, 255) or color(255, 0, 0, 255)

	if var11.aa.misc.fake_duck:get() then
		var1 = var1 .. " " .. "(fakeduck)"
	end


	var578(arg1, arg2, var2, arg3, var575(var1, arg4))
end

local function var582(arg1, arg2, arg3, arg4)
	if arg4 <= 0.1 then
		return
	end


	local var1 = "aa"
	local var2 = color(209, 139, 230)

	if var11.aa.misc.fake_duck:get() then
		if not var11.rage.main.double_tap:get() then
			var1 = var1 .. " " .. "(fakeduck)"
		end


		var2 = color(255, 0, 0)
	end


	var578(arg1, arg2, var2, arg3, var575(var1, arg4))
end

function var565.update()
	local var1 = entity.get_local_player()
	local var2 = var1 ~= nil and var1:is_alive()
	local var3 = var11.rage.main.double_tap:get()
	local var4 = var11.rage.main.hide_shots:get()

	var566:update(0.05, var2)
	var569:update(0.05, var3)
	var570:update(0.05, var4)
end

function var565.draw()
	local var1 = var566.value
	local var2 = var569.value
	local var3 = var570.value

	if var1 == 0 then
		return
	end


	local var4 = render.screen_size() / 2 + vector(0, 40)
	local var5 = "s"

	var579(var560, var4, var5)
	var580(var560, var4, var5)
	var581(var560, var4, var5, var2)
	var582(var560, var4, var5, var3)
end

function var565.render()
	var565.update()
	var565.draw()
end

local var583 = {}
local var584 = neverlose_smoothy.new()
local var585 = neverlose_smoothy.new()
local var586 = neverlose_smoothy.new()
local var587 = neverlose_smoothy.new()

local function var588()
	if not var33.is_onground then
		return "AIR"
	end


	if var33.is_crouched then
		return "DUCK"
	end


	if var33.is_moving then
		return "RUN"
	end


	return "STAND"
end

local function var589(arg1, arg2, arg3, arg4, arg5)
	local var1 = globals.realtime * 10
	local var2 = arg2:clone()

	for iter1 = 1, #arg5 do
		local var3 = arg5:sub(iter1, iter1)
		local var4 = var2:clone()
		local var5 = render.measure_text(arg1, arg4, var3)

		var4.y = var4.y + math.sin(var1 + iter1)

		render.text(arg1, var4, arg3, arg4, var3)

		var2.x = var2.x + var5.x - 2
	end
end

local function var590(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
	local var1 = render.measure_text(arg2, arg5, arg6)
	local var2 = var4(-var1.x * (1 - arg8) * 0.5 + 8 * arg8)
	local var3 = arg3 + vector(var2, 0)
	local var4 = arg4:alpha_modulate(arg4.a * arg7)

	if arg9 then
		local var5 = var3 + vector(0, var1.y * 0.5)

		render.shadow(var5, var5 + vector(var1.x, 0), var4)
	end


	arg1(arg2, var3, var4:alpha_modulate(255 * arg7), arg5, arg6)

	arg3.y = arg3.y + var4(var1.y * 0.81 * arg7)
end

local function var591(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
	var590(render.text, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
end

local function var592(arg1, arg2, arg3, arg4, arg5)
	var590(var589, arg1, arg2, var563, arg3, var3.build:upper(), arg4, arg5, true)

	arg2.y = arg2.y + 1
end

local function var593(arg1, arg2, arg3, arg4, arg5)
	local var1 = "spectral"
	local var2 = var18.wave(var1, var563, color(111, 111, 111), globals.realtime)

	var591(arg1, arg2, var563:alpha_modulate(255), arg3, var2, arg4, arg5, true)

	arg2.y = arg2.y + 1
end

local function var594(arg1, arg2, arg3, arg4, arg5)
	if arg4 <= 0.01 then
		return
	end


	local var1 = "DT"
	local var2 = color(69, 69, 69, 255):lerp(var563, rage.exploit:get())

	var591(arg1, arg2, var2:alpha_modulate(100), arg3, var1, arg4, arg5)
end

local function var595(arg1, arg2, arg3, arg4, arg5)
	if arg4 <= 0.01 then
		return
	end


	local var1 = math.max(var586.value, rage.exploit:get())
	local var2 = "HS"
	local var3 = color(69, 69, 69, 255):lerp(var563, var1)

	var591(arg1, arg2, var3, arg3, var2, arg4, arg5)
end

function var583.update()
	local var1 = entity.get_local_player()
	local var2 = var1 ~= nil and var1:is_alive()
	local var3 = var2 and var1.m_bIsScoped
	local var4 = var11.rage.main.double_tap:get()
	local var5 = var11.rage.main.hide_shots:get()

	var584:update(0.05, var2)
	var585:update(0.05, var3)
	var586:update(0.05, var4)
	var587:update(0.05, var5)
end

function var583.draw()
	local var1 = var584.value
	local var2 = var585.value
	local var3 = var586.value
	local var4 = var587.value

	if var1 == 0 then
		return
	end


	local var5 = render.screen_size() / 2 + vector(0, var86.features.indicate_state.offset:get())
	local var6 = "s"

	var592(2, var5, var6, var1, var2)
	var593(4, var5, var6, var1, var2)
	var594(2, var5, var6, var1 * var3, var2)
	var595(2, var5, var6, var1 * var4, var2)
end

function var583.render()
	var583.update()
	var583.draw()
end

local function var596()
	if var564 == "Default" then
		var565.render()
		var86.features.indicate_state.color:visibility(false)
		var86.features.indicate_state.offset:visibility(false)

		return
	end


	if var564 == "Alternative" then
		var583.render()
		var86.features.indicate_state.color:visibility(true)
		var86.features.indicate_state.offset:visibility(true)

		return
	end
end

local function var597(arg1)
	events.render(var596, arg1)
end

local var598 = var86.features.indicate_state

local function var599(arg1)
	var563 = arg1:get()
end

local function var600(arg1)
	var564 = arg1:get()
end

local function var601(arg1)
	local var1 = arg1:get()

	if var1 then
		var598.color:set_callback(var599, true)
		var598.type:set_callback(var600, true)
	else
		var598.color:unset_callback(var599)
		var598.type:unset_callback(var600)
	end


	var597(var1)
end

var598.enabled:set_callback(var601, true)

local var602
local var603 = var86.features.lethal_indicator
local var604 = neverlose_smoothy.new(0)

local function var605()
	local var1 = entity.get_local_player()

	if var1 == nil then
		return
	end


	local var2 = var604:update(0.05, var1.m_bIsScoped)

	if not var1:is_alive() then
		return
	end


	if var1.m_iHealth > var603.min_hp:get() then
		return
	end


	local var3 = 1
	local var4 = ""
	local var5 = "! LETHAL !"
	local var6 = render.screen_size() / 2
	local var7 = 0.75 + 0.25 * math.sin(globals.realtime * 6)
	local var8 = var6 + vector(1, var603.offset:get())
	local var9 = render.measure_text(var3, var4, var5)
	local var10 = var603.color:get()

	var8.x = var8.x - var9.x / 2 * (1 - var2)
	var8.y = var8.y + var9.y / 2
	var8.x = var8.x + var2 * 10
	var10.a = var10.a * var7

	render.text(var3, var8, var10, var4, var5)
end

local var606

local function var607(arg1)
	events.render(var605, arg1:get())
end

var603.enabled:set_callback(var607, true)

local var608
local var609 = {
	Small = 2,
	Default = 1
}
local var610 = 4
local var611 = 4
local var612 = neverlose_smoothy.new(0)
local var613
local var614 = color()
local var615 = render.screen_size()
local var616 = var69.new("damage_indicator", {
	pos = vector(var615.x * 0.5 + 5, var615.y * 0.5 - 5),
	anchor = vector(0, 1)
})

local function var617()
	local var1 = entity.get_local_player()

	if var1 == nil or not var1:is_alive() then
		return
	end


	local var2 = var609[var613]

	if var2 == nil then
		return
	end


	local var3 = var616.is_dragged
	local var4 = ui.get_alpha() > 0 and (var3 and 0.5 or 1)
	local var5 = var612:update(0.05, var4)
	local var6 = var616:get_pos()
	local var7 = tostring(var11.rage.selection.min_damage:get())
	local var8 = "cs"
	local var9 = render.measure_text(var2, var8, var7) + vector(var610, var611) * 2 + vector(1, 0)
	local var10 = var6 + var9 * 0.5 + vector(1, 0)
	local var11 = color(200, 200, 200, 128)

	var11.a = var11.a * var5

	render.rect_outline(var6, var6 + var9, var11, 1, 4)
	render.text(var2, var10, var614, var8, var7)
	var616:set_size(var9)
end

local function var618(arg1)
	events.render(var617, arg1)
end

local var619 = var86.features.damage_indicator

local function var620(arg1)
	var614 = arg1:get()
end

local function var621(arg1)
	var613 = arg1:get()
end

local function var622(arg1)
	local var1 = arg1:get()

	if var1 then
		var619.color:set_callback(var620, true)
		var619.font:set_callback(var621, true)
	else
		var619.color:unset_callback(var620)
		var619.font:unset_callback(var621)
	end


	var618(var1)
end

var619.enabled:set_callback(var622, true)

local var623
local var624 = var86.features.velocity_warning
local var625 = 8
local var626 = 8
local var627 = render.load_font("museo500", 14.2, "a")
local var628 = neverlose_smoothy.new()
local var629 = var69.new("velocity_warning")
local var630 = render.screen_size()

var629:set_anchor(vector(0.5, 0))
var629:set_pos(vector(var630.x * 0.5, var630.y * 0.3))

local function var631(arg1)
	if arg1 == nil or not arg1:is_alive() then
		return 1
	end


	return arg1.m_flVelocityModifier
end

local function var632()
	local var1 = entity.get_local_player()
	local var2 = var631(var1)
	local var3 = var628:update(0.05, var2 < 1 or ui.get_alpha() > 0)
	local var4 = var629:get_pos()
	local var5 = var629:get_size()
	local var6
	local var7 = 8
	local var8 = color(0, 0, 0, 50 * var3)
	local var9 = color(0, 0, 0, 5 * var3)

	render.blur(var4, var4 + var5, 0.25, var3, var7)
	render.rect(var4, var4 + var5, var8, var7)
	render.rect_outline(var4, var4 + var5, var9, 1, var7)

	local var10
	local var11 = 6
	local var12 = ui.get_icon("triangle-exclamation")
	local var13 = "velocity"
	local var14 = string.format("%d%%", var2 * 100)
	local var15 = render.measure_text(var627, nil, var12)
	local var16 = render.measure_text(var627, nil, var13)
	local var17 = render.measure_text(var627, nil, var14)
	local var18 = var624.color:get()
	local var19 = var4 + var5 / 2
	local var20 = vector(var15.x + var16.x + var11 + var17.x + var11, math.max(var15.y, var16.y, var17.y))

	var18.a = var18.a * var3
	var19.x = var19.x - var20.x / 2
	var19.y = var19.y - var20.y / 2

	render.text(var627, var19, var18, "s", var12)

	var19.x = var19.x + var15.x + var11

	render.text(var627, var19 - vector(0, 1), var18, "s", var13)

	var19.x = var19.x + var16.x + var11

	render.text(var627, var19 - vector(0, 1), color(255, 255, 255, 255 * var3), "s", var14)
	var629:set_size(var20 + vector(var626, var625) * 2)
end

local function var633(arg1)
	events.render(var632, arg1:get())
end

var624.enabled:set_callback(var633, true)

local var634
local var635 = 0
local var636 = color()

local function var637()
	if not globals.is_in_game or var635 <= 0 then
		return
	end


	local var1 = 1

	if var635 < 0.25 then
		var1 = var635 / 0.25
	end


	local var2 = var636:clone()

	var2.a = var2.a * var1

	local var3 = render.screen_size() * 0.5

	render.line(vector(var3.x - 10, var3.y - 10), vector(var3.x - 5, var3.y - 5), var2)
	render.line(vector(var3.x + 10, var3.y - 10), vector(var3.x + 5, var3.y - 5), var2)
	render.line(vector(var3.x + 10, var3.y + 10), vector(var3.x + 5, var3.y + 5), var2)
	render.line(vector(var3.x - 10, var3.y + 10), vector(var3.x - 5, var3.y + 5), var2)

	var635 = math.max(var635 - globals.frametime, 0)
end

local function var638(arg1)
	local var1 = entity.get_local_player()
	local var2 = entity.get(arg1.userid, true)
	local var3 = entity.get(arg1.attacker, true)

	if var2 == var1 or var3 ~= var1 then
		return
	end


	var635 = 0.5
end

local function var639(arg1)
	if not arg1 then
		var635 = 0
	end


	events.render(var637, arg1)
	events.player_hurt(var638, arg1)
end

local var640 = var86.features.hit_marker

local function var641(arg1)
	var636 = arg1:get()
end

local function var642(arg1)
	local var1 = arg1:get()

	if var1 then
		var640.color:set_callback(var641, true)
	else
		var640.color:unset_callback(var641)
	end


	var639(var1)
end

var640.enabled:set_callback(var642, true)

local var643
local var644 = {}
local var645 = {}

local function var646()
	if not globals.is_in_game then
		return
	end


	local var1 = globals.frametime
	local var2 = globals.realtime
	local var3 = var645.Horizontal[1] or color()
	local var4 = var645.Vertical[1] or color()

	for iter1 = #var644, 1, -1 do
		if var2 > var644[iter1].time then
			table.remove(var644, iter1)
		end
	end


	for iter2 = 1, #var644 do
		local var5 = var644[iter2]
		local var6 = 1
		local var7 = var5.time - var2

		if var7 < 0.5 then
			var6 = var7 / 0.5
		end


		local var8 = render.world_to_screen(var5.point)

		if var8 == nil then
			-- block empty
		else
			local var9 = vector(var8.x - 5, var8.y - 1)
			local var10 = vector(var8.x + 5, var8.y + 1)
			local var11 = vector(var8.x - 1, var8.y - 5)
			local var12 = vector(var8.x + 1, var8.y + 5)

			render.rect(var9, var10, var3:alpha_modulate(var3.a * var6))
			render.rect(var11, var12, var4:alpha_modulate(var4.a * var6))
		end
	end
end

local function var647(arg1)
	if arg1.state ~= nil then
		return
	end


	local var1 = globals.realtime + 3

	table.insert(var644, {
		time = var1,
		point = arg1.aim
	})
end

local function var648(arg1)
	if not arg1 then
		for iter1 = 1, #var644 do
			var644[iter1] = nil
		end
	end


	events.render(var646, arg1)
	events.aim_ack(var647, arg1)
end

local var649 = var86.features.kibit_marker

local function var650(arg1)
	local var1 = arg1:list()

	for iter1 = 1, #var1 do
		local var2 = var1[iter1]
		local var3 = arg1:get(var2)

		var645[var2] = var3
	end
end

local function var651(arg1)
	local var1 = arg1:get()

	if var1 then
		var649.color:set_callback(var650, true)
	else
		var649.color:unset_callback(var650)
	end


	var648(var1)
end

var649.enabled:set_callback(var651, true)

local var652
local var653
local var654 = {
	"        ",
	"        ",
	"        ",
	"sp      ",
	"spe     ",
	"spec    ",
	"spect   ",
	"spectr  ",
	"spectra ",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	"spectral",
	" pectral",
	"  ectral",
	"   ctral",
	"    tral",
	"     ral",
	"      al",
	"       l",
	"        ",
	"        ",
	"        "
}
local var655
local var656

local function var657(arg1)
	if var656 == arg1 then
		return
	end


	common.set_clan_tag(arg1)

	var656 = arg1
end

local function var658()
	var657("")
end

local function var659()
	local var1 = utils.net_channel()

	if var1 == nil then
		return
	end


	local var2 = to_ticks(var1.latency[1])
	local var3 = (globals.tickcount + var2) / 17
	local var4 = math.floor(0.5 + var3) % #var654 + 1
	local var5 = var654[var4]

	if var5 == nil then
		return
	end


	var657(var5)
end

local function var660(arg1)
	if not arg1 then
		var658()
	end


	events.shutdown(var658, arg1)
	events.net_update_start(var659, arg1)
end

local var661 = var86.features.clantag

local function var662(arg1)
	local var1 = arg1:get()

	if not var1 then
		var11.misc.main.in_game.clan_tag:override()
	else
		var11.misc.main.in_game.clan_tag:override(false)
	end


	var660(var1)
end

var661.enabled:set_callback(var662, true)

local var663
local var664 = 0
local var665 = cvar.cl_righthand
local var666 = cvar.viewmodel_fov
local var667 = cvar.viewmodel_offset_x
local var668 = cvar.viewmodel_offset_y
local var669 = cvar.viewmodel_offset_z
local var670 = 0

local function var671()
	local var1 = entity.get_local_player()

	if var1 == nil then
		return false
	end


	local var2 = var1:get_player_weapon()

	if var2 == nil then
		return false
	end


	local var3 = var2:get_weapon_info()

	if var3 == nil then
		return false
	end


	return var3.weapon_type == var664
end

local function var672(arg1)
	return tonumber(arg1:string())
end

local function var673(arg1)
	if var665:string() == "1" then
		var665:int(arg1 and 0 or 1, true)
	else
		var665:int(arg1 and 1 or 0, true)
	end
end

local function var674()
	var666:float(var672(var666), false)
	var667:float(var672(var667), false)
	var668:float(var672(var668), false)
	var669:float(var672(var669), false)
	var665:int(var665:string() == "1" and 1 or 0, false)
end

local function var675()
	var674()
end

local function var676(arg1)
	if var670 ~= 0 then
		var673(var671())
	end


	var670 = arg1.weaponselect
end

local function var677(arg1)
	if not arg1 then
		var674()
		events.createmove(var676, false)
	end


	events.shutdown(var675, arg1)
end

local var678 = var86.features.viewmodel

local function var679(arg1)
	var666:float(arg1:get() * 0.1, true)
end

local function var680(arg1)
	var667:float(arg1:get() * 0.1, true)
end

local function var681(arg1)
	var668:float(arg1:get() * 0.1, true)
end

local function var682(arg1)
	var669:float(arg1:get() * 0.1, true)
end

local function var683(arg1)
	local var1 = arg1:get()

	if not var1 then
		var665:int(var665:string() == "1" and 1 or 0, false)
	else
		var673(var671())
	end


	events.createmove(var676, var1)
end

local function var684(arg1)
	local var1 = arg1:get()

	if var1 then
		var678.fov:set_callback(var679, true)
		var678.offset_x:set_callback(var680, true)
		var678.offset_y:set_callback(var681, true)
		var678.offset_z:set_callback(var682, true)
		var678.opposite_knife_hand:set_callback(var683, true)
	else
		var678.fov:unset_callback(var679)
		var678.offset_x:unset_callback(var680)
		var678.offset_y:unset_callback(var681)
		var678.offset_z:unset_callback(var682)
		var678.opposite_knife_hand:unset_callback(var683)
	end


	var677(var1)
end

var678.enabled:set_callback(var684, true)

local var685
local var686 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
local var687 = var86.features.ping_spike.value:get()
local var688 = cvar.sv_maxunlag

local function var689()
	var686:override(var86.features.ping_spike.value:get())
	var688:float(0.4, false)
end

local function var690()
	var686:override()
	var688:float(0.2, false)
end

local function var691(arg1)
	if not arg1 then
		var690()
	end


	events.shutdown(var690, arg1)
	events.render(var689, arg1)
end

var86.features.ping_spike.enabled:set_callback(function(arg1)
	local var1 = arg1:get()

	if var1 == true then
		events.render(var689, var1)
	else
		var1 = false

		var690()
	end


	var691(var1)
end, true)
