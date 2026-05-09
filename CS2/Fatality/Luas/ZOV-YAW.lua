--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

if not ffi then
	return
end

ffi.cdef("    typedef struct _SYSTEMTIME {\n        unsigned short wYear;\n        unsigned short wMonth;\n        unsigned short wDayOfWeek;\n        unsigned short wDay;\n        unsigned short wHour;\n        unsigned short wMinute;\n        unsigned short wSecond;\n        unsigned short wMilliseconds;\n    } SYSTEMTIME, *PSYSTEMTIME;\n\n    void GetLocalTime(PSYSTEMTIME lpSystemTime);\n")

slot_0_0_0 = {
	sensitivity = tostring(game.cvar:Find("sensitivity").value)
}
slot_0_1_0 = {}

for iter_0_0 in slot_0_0_0.sensitivity:gmatch("%d") do
	table.insert(slot_0_1_0, tonumber(iter_0_0))
end

if not utils.FileExists("./fatality/zov_yaw") then
	utils.FileWrite("./fatality/zov_yaw", {
		slot_0_1_0[1],
		slot_0_1_0[2],
		slot_0_1_0[3]
	})
end

slot_0_0_0.rebuilt_sensitivity = table.concat({
	utils.FileRead("./fatality/zov_yaw")[1],
	utils.FileRead("./fatality/zov_yaw")[2],
	utils.FileRead("./fatality/zov_yaw")[3]
})
slot_0_0_0.rebuilt_sensitivity = slot_0_0_0.rebuilt_sensitivity:sub(1, 1) .. "." .. slot_0_0_0.rebuilt_sensitivity:sub(2)
slot_0_2_0 = {
	consolas = draw.FontGDI("Consolas", 14, bit.bor(1, 4, 8)),
	pixel = draw.FontGDI("Smallest Pixel-7", 10, bit.bor(2, 8))
}

slot_0_2_0.consolas:Create()
slot_0_2_0.pixel:Create()

slot_0_3_0 = {
	rage = {
		aimbot = {
			doubletap = gui.ctx:Find("rage>aimbot>doubletap")
		},
		overrides = {
			force_shoot = gui.ctx:Find("rage>aimbot>general>force shoot")
		},
		angles = {
			enabled = gui.ctx:Find("rage>anti-aim>angles>anti-aim"),
			pitch = {
				value = gui.ctx:Find("rage>anti-aim>angles>pitch"),
				amount = gui.ctx:Find("rage>anti-aim>angles>pitch>settings>value")
			},
			yaw = {
				amount = gui.ctx:Find("rage>anti-aim>angles>yaw>settings>amount"),
				jitter = {
					value = gui.ctx:Find("rage>anti-aim>angles>yaw jitter"),
					amount = gui.ctx:Find("rage>anti-aim>angles>yaw jitter>settings>amount"),
					three_way = gui.ctx:Find("rage>anti-aim>angles>yaw jitter>settings>3way"),
					disablers = gui.ctx:Find("rage>anti-aim>angles>jitter disabler")
				}
			},
			spin = {
				value = gui.ctx:Find("rage>anti-aim>angles>spin"),
				amount = gui.ctx:Find("rage>anti-aim>angles>spin amount")
			},
			manual_override = {
				left = gui.ctx:Find("rage>anti-aim>angles>manual override>override left"),
				right = gui.ctx:Find("rage>anti-aim>angles>manual override>override right"),
				back = gui.ctx:Find("rage>anti-aim>angles>manual override>override back"),
				forward = gui.ctx:Find("rage>anti-aim>angles>manual override>override forward")
			}
		}
	},
	visuals = {
		overlays = {
			grenade_prediction = {
				value = gui.ctx:Find("visuals>local>overlays>grenade prediction"),
				color = {
					miss = gui.ctx:Find("visuals>local>overlays>grenade prediction>miss color"),
					hit = gui.ctx:Find("visuals>local>overlays>grenade prediction>hit color")
				}
			}
		},
		view = {
			fov_override = {
				fov = gui.ctx:Find("visuals>misc>local>fov override>settings>fov")
			}
		}
	},
	misc = {
		movement = {
			jumpbug = gui.ctx:Find("misc>movement>jumpbug"),
			slowwalk = gui.ctx:Find("misc>movement>slowwalk"),
			peek_assist = {
				value = gui.ctx:Find("misc>movement>peek assist"),
				jump_on_retreat = gui.ctx:Find("misc>movement>peek assist>jump on retreat"),
				distance = gui.ctx:Find("misc>movement>peek assist>distance")
			},
			duck_peek_assist = gui.ctx:Find("misc>movement>duck peek assist")
		},
		grenades = {
			quick_switch = gui.ctx:Find("misc>misc>grenades>quick switch")
		}
	}
}
slot_0_4_0 = {
	Get = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		if not arg_1_1 then
			return
		end

		if not arg_1_2 then
			return
		end

		local var_1_0 = arg_1_1[arg_1_2]

		if not var_1_0 then
			return
		end

		local var_1_1 = ffi.cast("uintptr_t*", var_1_0)[0]

		if var_1_1 == 0 then
			return
		end

		local var_1_2 = ffi.cast("uintptr_t*", var_1_1)[0]
		local var_1_3 = ffi.cast("uint32_t*", var_1_1)[2]

		return ffi.cast(arg_1_3, var_1_2 + var_1_3)[0]
	end
}
slot_0_5_0 = {
	grenade_thrown_end = 0,
	grenade_thrown_tick = false,
	grenade_thrown = false,
	last_throw_time = 0,
	pulse_active = 0,
	interface = {
		name = nil
	},
	main = {
		disable_angles = {
			round_end = {
				argument = false,
				value = false
			},
			safe_situation = {
				argument = false
			},
			warmup = {
				argument = false
			},
			freeze_time = {
				value = 0,
				timeout = false,
				argument = false
			}
		},
		extensions = {
			jump_scout = {
				argument = false
			},
			no_fall_damage = {
				argument = false
			},
			fast_ladder = {
				argument = false
			},
			doubletap_on_knife = {
				argument = false
			},
			opposite_knife_hand = {
				argument = false,
				value = {
					argument = false
				}
			},
			prevent_afk_kick = {
				value = 0
			}
		},
		suppressions = {
			rotation_animation = {
				argument = false
			},
			breath_animation = {
				value = false,
				timer = 0
			}
		},
		improvements = {
			grenade_throwing = {
				argument = false
			},
			safe_ladder_angles = {
				argument = false
			},
			quick_switch = {
				grenade_thrown_next = false,
				grenade_thrown = false,
				argument = false,
				grenade_thrown_end = 0
			},
			mouse_sensitivity = {
				argument = {
					enabled = false,
					sensitivity = false
				}
			}
		},
		drop_grenades = {
			next = 0,
			state = 0
		},
		peek_assist = {
			last_shot = 0,
			grenade_thrown = false,
			argument = false,
			slowwalk = false,
			retreat = false,
			grenade_thrown_next = false,
			grenade_thrown_end = 0,
			jumped = false
		},
		autostrafer = {
			argument = false
		}
	},
	visuals = {
		indicators = {
			bomb = {
				planted = {
					value = false,
					timer = 0
				},
				planting = {
					value = false,
					timer = 0
				},
				defusing = {
					value = false,
					duration = 0,
					timer = 0
				}
			},
			hostage = {
				follows = {
					value = 0,
					userid = {
						second = nil,
						first = nil
					},
					name = {
						second = nil,
						first = nil
					}
				},
				entity = {
					second = nil,
					first = nil
				}
			},
			extra = {
				min_damage = 0,
				hit_chance = 0
			}
		},
		interface = {
			watermark = {
				fps = {
					count = 0,
					amount = 0,
					display = 0,
					last_update = 0
				},
				latency = {
					display = 0,
					last_update = 0
				}
			}
		},
		grenade_prediction = {
			improve_color = {
				argument = false
			}
		}
	},
	latency = {
		state = 0,
		value = 0
	},
	events = {
		grenade_thrown = true,
		round_freeze_end = true,
		mp_team_intro_time = 0,
		team_intro_end = true,
		buymenu_close = true
	},
	buttons = {
		in_score = false
	},
	props = {
		m_bFreezePeriod = false
	},
	animation = {
		start = 0,
		state = false,
		value = 0
	},
	weapon_settings = {
		hit_chance_path = nil
	},
	shutdown = {
		disable_angles = {
			round_end = false,
			freeze_time = false,
			safe_situation = false,
			warmup = false
		},
		extensions = {
			jump_scout = false,
			opposite_knife_hand = false,
			no_fall_damage = false,
			doubletap_on_knife = false
		},
		suppressions = {
			rotation_animation = false
		},
		improvements = {
			quick_switch = false,
			mouse_sensitivity = false
		},
		autostrafer = {
			stop_on_key_release = false
		},
		grenade_prediction = {
			improve_color = false
		}
	},
	GetLocalTime = ffi.cast("void(__stdcall*)(PSYSTEMTIME)", utils.FindExport("kernel32.dll", "GetLocalTime")),
	bind_state = {},
	bind_value = {},
	pulse_until = {},
	GetModuleHandleA = ffi.cast("uint64_t(__stdcall*)(const char*)", utils.FindExport("kernel32.dll", "GetModuleHandleA"))
}

if ws.GetTitle() == "[Alpha] ZOV-YAW ☁️" then
	slot_0_5_0.interface.title = "Alpha"
elseif ws.GetTitle() == "ZOV-YAW ☁️" then
	slot_0_5_0.interface.title = "Yaw"
else
	slot_0_5_0.interface.title = "Debug"
end

function slot_0_5_0.get_combo_box(arg_2_0, arg_2_1)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
		if bit.band(arg_2_0:GetValue():Get():GetRaw(), 2^(iter_2_0 - 1)) ~= 0 then
			var_2_0[#var_2_0 + 1] = iter_2_1
		end
	end

	return var_2_0
end

function slot_0_5_0.set_combo_box(arg_3_0, arg_3_1, ...)
	local var_3_0 = arg_3_0:GetValue():Get()
	local var_3_1 = 0
	local var_3_2 = {
		...
	}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		for iter_3_2, iter_3_3 in ipairs(var_3_2) do
			if iter_3_3 == iter_3_1 then
				var_3_1 = bit.bor(var_3_1, bit.lshift(1, iter_3_0 - 1))

				break
			end
		end
	end

	var_3_0:SetRaw(var_3_1)
	arg_3_0:GetValue():Set(var_3_0)
end

function slot_0_5_0.get_animation(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	arg_4_3 = arg_4_3 or 0
	arg_4_4 = arg_4_4 or 1
	arg_4_2 = arg_4_2 or 1

	if not slot_0_5_0.animation[arg_4_0] then
		slot_0_5_0.animation[arg_4_0] = {
			start = 0,
			value = arg_4_1 and arg_4_4 or arg_4_3,
			state = arg_4_1
		}

		return slot_0_5_0.animation[arg_4_0].value
	end

	if arg_4_1 ~= slot_0_5_0.animation[arg_4_0].state then
		slot_0_5_0.animation[arg_4_0].start = game.globalVars.m_flCurTime
		slot_0_5_0.animation[arg_4_0].state = arg_4_1
	end

	local var_4_0 = math.min((game.globalVars.m_flCurTime - slot_0_5_0.animation[arg_4_0].start) / arg_4_2, 1)

	slot_0_5_0.animation[arg_4_0].value = math.lerp(arg_4_1 and arg_4_3 or arg_4_4, arg_4_1 and arg_4_4 or arg_4_3, var_4_0)

	return slot_0_5_0.animation[arg_4_0].value
end

function slot_0_5_0.draw_circle(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = math.WorldToScreen(Vector(arg_5_0.x, arg_5_0.y, arg_5_0.z))

	if not var_5_0 then
		return
	end

	local var_5_1 = {}

	for iter_5_0 = 0, 24 do
		var_5_1[iter_5_0 + 1] = Vector(arg_5_0.x + math.cos(math.pi * 2 / 24 * iter_5_0) * arg_5_1, arg_5_0.y + math.sin(math.pi * 2 / 24 * iter_5_0) * arg_5_1, arg_5_0.z)
	end

	for iter_5_1 = 1, #var_5_1 do
		local var_5_2 = math.WorldToScreen(var_5_1[iter_5_1])
		local var_5_3 = math.WorldToScreen(var_5_1[iter_5_1 % #var_5_1 + 1])

		if not var_5_2 or not var_5_3 then
			return
		end

		draw.surface:AddTriangleFilledMulticolor(var_5_2, var_5_3, var_5_0, {
			draw.Color(arg_5_2:GetR(), arg_5_2:GetG(), arg_5_2:GetB(), 0),
			draw.Color(arg_5_2:GetR(), arg_5_2:GetG(), arg_5_2:GetB(), 0),
			draw.Color(arg_5_2:GetR(), arg_5_2:GetG(), arg_5_2:GetB(), arg_5_2:GetA())
		})
	end
end

function slot_0_5_0.get_velocity(arg_6_0)
	return math.sqrt(arg_6_0:GetAbsVelocity().x * arg_6_0:GetAbsVelocity().x + arg_6_0:GetAbsVelocity().y * arg_6_0:GetAbsVelocity().y)
end

function slot_0_5_0.get_grenade_thrown(arg_7_0)
	local var_7_0 = false

	if not arg_7_0 then
		return
	end

	local var_7_1 = arg_7_0:GetActiveWeapon()

	if not var_7_1 then
		return
	end

	local var_7_2 = slot_0_4_0:Get(var_7_1, "m_fThrowTime", "float*")

	if not var_7_2 then
		return
	end

	if var_7_2 > game.globalVars.m_flCurTime and var_7_2 ~= slot_0_5_0.last_throw_time then
		var_7_0 = true
		slot_0_5_0.last_throw_time = var_7_2
	end

	return var_7_0
end

slot_0_5_0.weapons = {
	general = "rage>weapon>general>weapon>mindamage",
	[EItemDefinitionIndex.DEAGLE] = "rage>weapon>Desert Eagle>weapon>mindamage",
	[EItemDefinitionIndex.ELITE] = "rage>weapon>Dual Berettas>weapon>mindamage",
	[EItemDefinitionIndex.FIVESEVEN] = "rage>weapon>Five-SeveN>weapon>mindamage",
	[EItemDefinitionIndex.GLOCK] = "rage>weapon>Glock-18>weapon>mindamage",
	[EItemDefinitionIndex.AK47] = "rage>weapon>AK-47>weapon>mindamage",
	[EItemDefinitionIndex.AUG] = "rage>weapon>AUG>weapon>mindamage",
	[EItemDefinitionIndex.AWP] = "rage>weapon>AWP>weapon>mindamage",
	[EItemDefinitionIndex.FAMAS] = "rage>weapon>FAMAS>weapon>mindamage",
	[EItemDefinitionIndex.G3SG1] = "rage>weapon>G3SG1>weapon>mindamage",
	[EItemDefinitionIndex.GALILAR] = "rage>weapon>Galil AR>weapon>mindamage",
	[EItemDefinitionIndex.M249] = "rage>weapon>M249>weapon>mindamage",
	[EItemDefinitionIndex.M4A1] = "rage>weapon>M4A4>weapon>mindamage",
	[EItemDefinitionIndex.MAC10] = "rage>weapon>MAC-10>weapon>mindamage",
	[EItemDefinitionIndex.P90] = "rage>weapon>P90>weapon>mindamage",
	[EItemDefinitionIndex.MP5SD] = "rage>weapon>MP5-SD>weapon>mindamage",
	[EItemDefinitionIndex.UMP45] = "rage>weapon>UMP-45>weapon>mindamage",
	[EItemDefinitionIndex.XM1014] = "rage>weapon>XM1014>weapon>mindamage",
	[EItemDefinitionIndex.BIZON] = "rage>weapon>PP Bizon>weapon>mindamage",
	[EItemDefinitionIndex.MAG7] = "rage>weapon>MAG-7>weapon>mindamage",
	[EItemDefinitionIndex.NEGEV] = "rage>weapon>Negev>weapon>mindamage",
	[EItemDefinitionIndex.SAWEDOFF] = "rage>weapon>Sawed Off>weapon>mindamage",
	[EItemDefinitionIndex.TEC9] = "rage>weapon>Tec-9>weapon>mindamage",
	[EItemDefinitionIndex.HKP2000] = "rage>weapon>P2000>weapon>mindamage",
	[EItemDefinitionIndex.MP7] = "rage>weapon>MP7>weapon>mindamage",
	[EItemDefinitionIndex.MP9] = "rage>weapon>MP9>weapon>mindamage",
	[EItemDefinitionIndex.NOVA] = "rage>weapon>Nova>weapon>mindamage",
	[EItemDefinitionIndex.P250] = "rage>weapon>P250>weapon>mindamage",
	[EItemDefinitionIndex.SCAR20] = "rage>weapon>SCAR-20>weapon>mindamage",
	[EItemDefinitionIndex.SG556] = "rage>weapon>SG 553>weapon>mindamage",
	[EItemDefinitionIndex.SSG08] = "rage>weapon>SSG-08>weapon>mindamage",
	[EItemDefinitionIndex.M4A1_SILENCER] = "rage>weapon>M4A1-S>weapon>mindamage",
	[EItemDefinitionIndex.USP_SILENCER] = "rage>weapon>USP-S>weapon>mindamage",
	[EItemDefinitionIndex.CZ75A] = "rage>weapon>CZ-75 Auto>weapon>mindamage",
	[EItemDefinitionIndex.REVOLVER] = "rage>weapon>R8 Revolver>weapon>mindamage",
	groups = {
		pistols = {
			path = "rage>weapon>Pistols>weapon>mindamage",
			weapons = {
				[EItemDefinitionIndex.GLOCK] = true,
				[EItemDefinitionIndex.P250] = true,
				[EItemDefinitionIndex.FIVESEVEN] = true,
				[EItemDefinitionIndex.TEC9] = true,
				[EItemDefinitionIndex.HKP2000] = true,
				[EItemDefinitionIndex.USP_SILENCER] = true,
				[EItemDefinitionIndex.CZ75A] = true
			}
		},
		heavy_pistols = {
			path = "rage>weapon>Heavy Pistols>weapon>mindamage",
			weapons = {
				[EItemDefinitionIndex.DEAGLE] = true,
				[EItemDefinitionIndex.REVOLVER] = true
			}
		},
		smgs = {
			path = "rage>weapon>SMGs>weapon>mindamage",
			weapons = {
				[EItemDefinitionIndex.MAC10] = true,
				[EItemDefinitionIndex.MP7] = true,
				[EItemDefinitionIndex.MP9] = true,
				[EItemDefinitionIndex.MP5SD] = true,
				[EItemDefinitionIndex.UMP45] = true,
				[EItemDefinitionIndex.P90] = true,
				[EItemDefinitionIndex.BIZON] = true
			}
		},
		rifles = {
			path = "rage>weapon>Rifles>weapon>mindamage",
			weapons = {
				[EItemDefinitionIndex.AK47] = true,
				[EItemDefinitionIndex.M4A1] = true,
				[EItemDefinitionIndex.M4A1_SILENCER] = true,
				[EItemDefinitionIndex.FAMAS] = true,
				[EItemDefinitionIndex.GALILAR] = true,
				[EItemDefinitionIndex.AUG] = true,
				[EItemDefinitionIndex.SG556] = true
			}
		},
		heavy = {
			path = "rage>weapon>Heavy>weapon>mindamage",
			weapons = {
				[EItemDefinitionIndex.NOVA] = true,
				[EItemDefinitionIndex.XM1014] = true,
				[EItemDefinitionIndex.SAWEDOFF] = true,
				[EItemDefinitionIndex.MAG7] = true,
				[EItemDefinitionIndex.M249] = true,
				[EItemDefinitionIndex.NEGEV] = true
			}
		},
		auto_snipers = {
			path = "rage>weapon>Auto Snipers>weapon>mindamage",
			weapons = {
				[EItemDefinitionIndex.G3SG1] = true,
				[EItemDefinitionIndex.SCAR20] = true
			}
		},
		bolt_snipers = {
			path = "rage>weapon>Bolt Snipers>weapon>mindamage",
			weapons = {
				[EItemDefinitionIndex.AWP] = true,
				[EItemDefinitionIndex.SSG08] = true
			}
		}
	}
}
slot_0_5_0.min_inaccuracy = {
	[EItemDefinitionIndex.DEAGLE] = 0.004952359944582,
	[EItemDefinitionIndex.ELITE] = 0.007969762198627,
	[EItemDefinitionIndex.FIVESEVEN] = 0.0098887151107192,
	[EItemDefinitionIndex.GLOCK] = 0.0059753721579909,
	[EItemDefinitionIndex.AK47] = 0.0069541251286864,
	[EItemDefinitionIndex.AUG] = 0.0059989895671606,
	[EItemDefinitionIndex.AWP] = 0.002892546588555,
	[EItemDefinitionIndex.FAMAS] = 0.0079942727461457,
	[EItemDefinitionIndex.G3SG1] = 0.025995600968599,
	[EItemDefinitionIndex.GALILAR] = 0.0069932932965457,
	[EItemDefinitionIndex.M249] = 0.0079818144440651,
	[EItemDefinitionIndex.M4A1] = 0.0059461016207933,
	[EItemDefinitionIndex.MAC10] = 0.013950428925455,
	[EItemDefinitionIndex.P90] = 0.013963227160275,
	[EItemDefinitionIndex.MP5SD] = 0.010933004319668,
	[EItemDefinitionIndex.UMP45] = 0.013979460112751,
	[EItemDefinitionIndex.XM1014] = 0.0079663516953588,
	[EItemDefinitionIndex.BIZON] = 0.014921620488167,
	[EItemDefinitionIndex.MAG7] = 0.007975566200912,
	[EItemDefinitionIndex.NEGEV] = 0.010976654477417,
	[EItemDefinitionIndex.SAWEDOFF] = 0.00788982398808,
	[EItemDefinitionIndex.TEC9] = 0.0058845169842243,
	[EItemDefinitionIndex.HKP2000] = 0.0058705345727503,
	[EItemDefinitionIndex.MP7] = 0.010933004319668,
	[EItemDefinitionIndex.MP9] = 0.009879108518362,
	[EItemDefinitionIndex.NOVA] = 0.007963671348989,
	[EItemDefinitionIndex.P250] = 0.0099132545292377,
	[EItemDefinitionIndex.SCAR20] = 0.025983091443777,
	[EItemDefinitionIndex.SG556] = 0.0059870295226574,
	[EItemDefinitionIndex.SSG08] = 0.03190329298377,
	[EItemDefinitionIndex.M4A1_SILENCER] = 0.0059726415202022,
	[EItemDefinitionIndex.USP_SILENCER] = 0.005990426056087,
	[EItemDefinitionIndex.CZ75A] = 0.010959323495626,
	[EItemDefinitionIndex.REVOLVER] = 0.0068696727976203
}

function slot_0_5_0.get_settings(arg_8_0, arg_8_1)
	arg_8_1 = arg_8_1 or "weapon>mindamage"

	if slot_0_5_0.weapons[arg_8_0] then
		local var_8_0 = slot_0_5_0.weapons[arg_8_0]:gsub("weapon>mindamage", arg_8_1)

		if gui.ctx:Find(var_8_0) then
			return var_8_0
		end
	end

	for iter_8_0, iter_8_1 in pairs(slot_0_5_0.weapons.groups) do
		if iter_8_1.weapons and iter_8_1.weapons[arg_8_0] then
			local var_8_1 = iter_8_1.path:gsub("weapon>mindamage", arg_8_1)

			if gui.ctx:Find(var_8_1) then
				return var_8_1
			end
		end
	end

	if entities.GetLocalPawn() and entities.GetLocalPawn():GetActiveWeapon() and ({
		[0] = true,
		nil,
		nil,
		nil,
		nil,
		nil,
		nil,
		true,
		true,
		[11] = true,
		[9] = true
	})[entities.GetLocalPawn():GetActiveWeapon():GetType()] then
		return nil
	end

	local var_8_2 = slot_0_5_0.weapons.general:gsub("weapon>mindamage", arg_8_1)

	return gui.ctx:Find(var_8_2) and var_8_2 or nil
end

function slot_0_5_0.round(arg_9_0)
	return math.floor(arg_9_0 + 0.5)
end

function slot_0_5_0.get_fps()
	slot_0_5_0.visuals.interface.watermark.fps.amount = slot_0_5_0.visuals.interface.watermark.fps.amount + game.globalVars.m_flRenderFrameTime
	slot_0_5_0.visuals.interface.watermark.fps.count = slot_0_5_0.visuals.interface.watermark.fps.count + 1

	if game.globalVars.m_flCurTime - slot_0_5_0.visuals.interface.watermark.fps.last_update >= 1 then
		slot_0_5_0.visuals.interface.watermark.fps.display = slot_0_5_0.round(1 / (slot_0_5_0.visuals.interface.watermark.fps.amount / slot_0_5_0.visuals.interface.watermark.fps.count))
		slot_0_5_0.visuals.interface.watermark.fps.amount = 0
		slot_0_5_0.visuals.interface.watermark.fps.count = 0
		slot_0_5_0.visuals.interface.watermark.fps.last_update = game.globalVars.m_flCurTime
	end

	return slot_0_5_0.visuals.interface.watermark.fps.display
end

function slot_0_5_0.get_time()
	local var_11_0 = ffi.new("SYSTEMTIME[1]")

	slot_0_5_0.GetLocalTime(var_11_0)

	return var_11_0[0].wHour, var_11_0[0].wMinute, var_11_0[0].wSecond
end

function slot_0_5_0.get_ping()
	if not game.engine:GetNetChan() or game.engine:GetNetChan():IsNull() then
		return 0
	end

	if game.globalVars.m_flCurTime - slot_0_5_0.visuals.interface.watermark.latency.last_update >= 1 then
		slot_0_5_0.visuals.interface.watermark.latency.display = math.floor(game.engine:GetNetChan():GetLatency() * 1000)
		slot_0_5_0.visuals.interface.watermark.latency.last_update = game.globalVars.m_flCurTime
	end

	return slot_0_5_0.visuals.interface.watermark.latency.display
end

function slot_0_5_0.get_revolver_shot(arg_13_0)
	local var_13_0 = false

	if not arg_13_0 then
		return
	end

	local var_13_1 = arg_13_0:GetActiveWeapon()

	if not var_13_1 or var_13_1:GetDefIndex() ~= EItemDefinitionIndex.REVOLVER then
		slot_0_5_0.main.peek_assist.last_shot = arg_13_0.m_iShotsFired:Get() or 0

		return
	end

	local var_13_2 = arg_13_0.m_iShotsFired:Get() or 0

	if var_13_2 > slot_0_5_0.main.peek_assist.last_shot then
		var_13_0 = true

		arg_13_0.m_iShotsFired:Set(0)
	end

	slot_0_5_0.main.peek_assist.last_shot = var_13_2

	return var_13_0
end

function slot_0_5_0.update_settings()
	local var_14_0 = entities.GetLocalPawn()

	if not var_14_0 then
		return
	end

	local var_14_1 = var_14_0:GetActiveWeapon()

	if not var_14_1 then
		return
	end

	local var_14_2 = var_14_1:GetDefIndex()

	if slot_0_5_0.weapon_settings.weapon_id == var_14_2 then
		return
	end

	slot_0_5_0.weapon_settings.weapon_id = var_14_2
	slot_0_5_0.weapon_settings.min_damage_path = slot_0_5_0.get_settings(var_14_2)
	slot_0_5_0.weapon_settings.hit_chance_path = slot_0_5_0.get_settings(var_14_2, "weapon>hitchance")
end

function slot_0_5_0.get_bind_press(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0:GetValue():GetHotkeyState()
	local var_15_1 = arg_15_1 and arg_15_0:GetValue():Get() or nil
	local var_15_2 = slot_0_5_0.bind_state[arg_15_0]
	local var_15_3 = slot_0_5_0.bind_value[arg_15_0]

	slot_0_5_0.bind_state[arg_15_0] = var_15_0

	if arg_15_1 then
		slot_0_5_0.bind_value[arg_15_0] = var_15_1
	end

	if not arg_15_1 then
		return var_15_2 ~= nil and var_15_0 ~= var_15_2
	end

	if var_15_0 and var_15_3 ~= nil and var_15_1 ~= var_15_3 then
		return true
	end

	return var_15_2 ~= nil and var_15_0 ~= var_15_2
end

function slot_0_5_0.extend_pulse(arg_16_0, arg_16_1, arg_16_2)
	if slot_0_5_0.pulse_active == 0 then
		slot_0_5_0.pulse_until = {}
	end

	local var_16_0 = game.globalVars.m_flCurTime

	slot_0_5_0.pulse_active = 1

	if arg_16_1 then
		slot_0_5_0.pulse_until[arg_16_0] = var_16_0 + arg_16_2
	end

	return slot_0_5_0.pulse_until[arg_16_0] ~= nil and var_16_0 < slot_0_5_0.pulse_until[arg_16_0]
end

slot_0_6_0 = {
	m_bWarmupPeriod = 65,
	dwGameRules = 36880312,
	m_bFreezePeriod = 64,
	game_version = 14158,
	dwBuildNumber = 6343796,
	m_bTechnicalTimeOut = 96,
	m_bCTTimeOutActive = 77,
	m_bTerroristTimeOutActive = 76,
	m_gamePhase = 132,
	m_totalRoundsPlayed = 136,
	client = slot_0_5_0.GetModuleHandleA("client.dll"),
	engine2 = slot_0_5_0.GetModuleHandleA("engine2.dll")
}

if ffi.cast("uint32_t*", slot_0_6_0.engine2 + slot_0_6_0.dwBuildNumber)[0] ~= slot_0_6_0.game_version then
	gui.notify:Add(gui.Notification("Offsets", "Some features are disabled", draw.textures.icon_info))
end

slot_0_7_0 = {
	rage = {
		aimbot = {
			doubletap = slot_0_3_0.rage.aimbot.doubletap:GetValue():Get()
		},
		overrides = {
			force_shoot = slot_0_3_0.rage.overrides.force_shoot:GetValue():Get()
		},
		angles = {
			enabled = slot_0_3_0.rage.angles.enabled:GetValue():Get(),
			pitch = slot_0_5_0.get_combo_box(slot_0_3_0.rage.angles.pitch.value, {
				"None",
				"Down",
				"Up",
				"Zero",
				"Custom"
			})[1],
			yaw_jitter = {
				value = slot_0_5_0.get_combo_box(slot_0_3_0.rage.angles.yaw.jitter.value, {
					"None",
					"Center",
					"Offset"
				})[1],
				amount = slot_0_3_0.rage.angles.yaw.jitter.amount:GetValue():Get(),
				three_way = slot_0_3_0.rage.angles.yaw.jitter.three_way:GetValue():Get(),
				disablers = slot_0_3_0.rage.angles.yaw.jitter.disablers:GetValue():Get():GetRaw()
			},
			spin = {
				value = slot_0_3_0.rage.angles.spin.value:GetValue():Get(),
				amount = slot_0_3_0.rage.angles.spin.amount:GetValue():Get()
			}
		}
	},
	visuals = {
		bomb = {
			planting = {
				timer = 0
			}
		},
		grenade_prediction = {
			color = {
				hit = slot_0_3_0.visuals.overlays.grenade_prediction.color.hit:GetValue():Get()
			}
		}
	},
	misc = {
		jumpbug = slot_0_3_0.misc.movement.jumpbug:GetValue():Get(),
		slowwalk = slot_0_3_0.misc.movement.slowwalk:GetValue():Get(),
		quick_switch = slot_0_3_0.misc.grenades.quick_switch:GetValue():Get()
	},
	main = {
		left_handed = false,
		yaw = 0,
		sensitivity = string.format("%.2f", slot_0_0_0.rebuilt_sensitivity),
		fov = slot_0_3_0.visuals.view.fov_override.fov:GetValue():Get(),
		peek_assist = Vector(0, 0, 0)
	}
}
slot_0_8_0 = {
	group = gui.ctx:Find("lua>elements b"),
	tab_selection = gui.ComboBox(gui.ControlID("tab_selection"))
}

for iter_0_1, iter_0_2 in ipairs({
	"Main",
	"Visuals",
	"Latency"
}) do
	slot_0_8_0.tab_selection:Add(gui.Selectable(gui.ControlID("tab_selection_" .. string.lower(iter_0_2)), iter_0_2))
end

slot_0_8_0.group:Add(gui.MakeControl("Tab selection", slot_0_8_0.tab_selection))
slot_0_5_0.set_combo_box(slot_0_8_0.tab_selection, {
	"Main",
	"Visuals",
	"Latency"
}, "Main")

slot_0_8_0.disable_angles = gui.Checkbox(gui.ControlID("disable_angles"))
slot_0_8_0.disable_angles_selection = gui.ComboBox(gui.ControlID("disable_angles_selection"))
slot_0_8_0.disable_angles_selection.allow_multiple = true

for iter_0_3, iter_0_4 in ipairs({
	"Round end",
	"Safe situation",
	"Warmup",
	"Freeze time"
}) do
	slot_0_8_0.disable_angles_selection:Add(gui.Selectable(gui.ControlID("disable_angles_selection_" .. string.lower(iter_0_4)), iter_0_4))
end

slot_0_8_0.extensions = gui.Checkbox(gui.ControlID("extensions"))
slot_0_8_0.extensions_selection = gui.ComboBox(gui.ControlID("extensions_selection"))
slot_0_8_0.extensions_selection.allow_multiple = true

for iter_0_5, iter_0_6 in ipairs({
	"Jump scout",
	"No fall damage",
	"Fast ladder",
	"Quick plant",
	"Doubletap on knife",
	"Opposite knife hand",
	"Prevent AFK kick"
}) do
	slot_0_8_0.extensions_selection:Add(gui.Selectable(gui.ControlID("extensions_selection_" .. string.lower(iter_0_6)), iter_0_6))
end

if not slot_0_5_0.get_combo_box(slot_0_8_0.extensions_selection, {
	"Jump scout",
	"No fall damage",
	"Fast ladder",
	"Quick plant",
	"Doubletap on knife",
	"Opposite knife hand",
	"Prevent AFK kick"
})[1] then
	slot_0_5_0.set_combo_box(slot_0_8_0.extensions_selection, {
		"Jump scout",
		"No fall damage",
		"Fast ladder",
		"Quick plant",
		"Doubletap on knife",
		"Opposite knife hand",
		"Prevent AFK kick"
	}, "No fall damage", "Doubletap on knife")
end

slot_0_8_0.suppressions = gui.Checkbox(gui.ControlID("suppressions"))
slot_0_8_0.suppressions_selection = gui.ComboBox(gui.ControlID("suppressions_selection"))
slot_0_8_0.suppressions_selection.allow_multiple = true

for iter_0_7, iter_0_8 in ipairs({
	"Rotation animation",
	"Breath animation"
}) do
	slot_0_8_0.suppressions_selection:Add(gui.Selectable(gui.ControlID("suppressions_selection_" .. string.lower(iter_0_8)), iter_0_8))
end

slot_0_8_0.improvements = gui.Checkbox(gui.ControlID("improvements"))
slot_0_8_0.improvements_selection = gui.ComboBox(gui.ControlID("improvements_selection"))
slot_0_8_0.improvements_selection.allow_multiple = true

for iter_0_9, iter_0_10 in ipairs({
	"Disable alt. fire on R8",
	"Grenade throwing",
	"Safe ladder angles",
	"Quick switch",
	"Mouse sensitivity"
}) do
	slot_0_8_0.improvements_selection:Add(gui.Selectable(gui.ControlID("improvements_selection_" .. string.lower(iter_0_10)), iter_0_10))
end

if not slot_0_5_0.get_combo_box(slot_0_8_0.improvements_selection, {
	"Disable alt. fire on R8",
	"Grenade throwing",
	"Safe ladder angles",
	"Quick switch",
	"Mouse sensitivity"
})[1] then
	slot_0_5_0.set_combo_box(slot_0_8_0.improvements_selection, {
		"Disable alt. fire on R8",
		"Grenade throwing",
		"Safe ladder angles",
		"Quick switch",
		"Mouse sensitivity"
	}, "Disable alt. fire on R8", "Mouse sensitivity")
end

slot_0_8_0.drop_grenades = gui.Checkbox(gui.ControlID("drop_grenades"))
slot_0_8_0.drop_grenades_selection = gui.ComboBox(gui.ControlID("drop_grenades_selection"))
slot_0_8_0.drop_grenades_selection.allow_multiple = true

for iter_0_11, iter_0_12 in ipairs({
	"HE Grenade",
	"Molotov",
	"Smoke",
	"Flashbang",
	"Decoy"
}) do
	slot_0_8_0.drop_grenades_selection:Add(gui.Selectable(gui.ControlID("drop_grenades_selection_" .. string.lower(iter_0_12)), iter_0_12))
end

if not slot_0_5_0.get_combo_box(slot_0_8_0.drop_grenades_selection, {
	"HE Grenade",
	"Molotov",
	"Smoke",
	"Flashbang",
	"Decoy"
})[1] then
	slot_0_5_0.set_combo_box(slot_0_8_0.drop_grenades_selection, {
		"HE Grenade",
		"Molotov",
		"Smoke",
		"Flashbang",
		"Decoy"
	}, "HE Grenade", "Molotov")
end

slot_0_8_0.peek_assist = gui.Checkbox(gui.ControlID("peek_assist"))
slot_0_8_0.peek_assist_jump_on_retreat = gui.ComboBox(gui.ControlID("peek_assist_jump_on_retreat"))
slot_0_8_0.peek_assist_jump_on_retreat.tooltip = "Jump on retreat"
slot_0_8_0.peek_assist_color = gui.ColorPicker(gui.ControlID("peek_assist_color"))

for iter_0_13, iter_0_14 in ipairs({
	"Off",
	"Always on",
	"Only while standing"
}) do
	slot_0_8_0.peek_assist_jump_on_retreat:Add(gui.Selectable(gui.ControlID("peek_assist_jump_on_retreat_" .. string.lower(iter_0_14)), iter_0_14))
end

if slot_0_8_0.peek_assist_color:GetValue():Get():GetR() == 0 and slot_0_8_0.peek_assist_color:GetValue():Get():GetG() == 0 and slot_0_8_0.peek_assist_color:GetValue():Get():GetB() == 0 and slot_0_8_0.peek_assist_color:GetValue():Get():GetA() == 0 then
	slot_0_8_0.peek_assist_color:GetValue():Set(draw.Color("#ff3250ff"))
end

slot_0_8_0.autostrafer = gui.Checkbox(gui.ControlID("autostrafer"))
slot_0_8_0.autostrafer_selection = gui.ComboBox(gui.ControlID("autostrafer_selection"))
slot_0_8_0.autostrafer_selection.allow_multiple = true

for iter_0_15, iter_0_16 in ipairs({
	"Stop on key release"
}) do
	slot_0_8_0.autostrafer_selection:Add(gui.Selectable(gui.ControlID("autostrafer_selection_" .. string.lower(iter_0_16)), iter_0_16))
end

if not slot_0_5_0.get_combo_box(slot_0_8_0.autostrafer_selection, {
	"Stop on key release"
})[1] then
	slot_0_5_0.set_combo_box(slot_0_8_0.autostrafer_selection, {
		"Stop on key release"
	}, "Stop on key release")
end

slot_0_8_0.indicators = gui.Checkbox(gui.ControlID("indicators"))
slot_0_8_0.indicators_selection = gui.ComboBox(gui.ControlID("indicators_selection"))
slot_0_8_0.indicators_selection.allow_multiple = true
slot_0_8_0.indicators_selection.tooltip = "Extra"
slot_0_8_0.indicators_color = gui.ColorPicker(gui.ControlID("indicators_color"))

for iter_0_17, iter_0_18 in ipairs({
	"Jump on retreat",
	"Min-damage",
	"Hit-chance",
	"Force shoot"
}) do
	slot_0_8_0.indicators_selection:Add(gui.Selectable(gui.ControlID("indicators_selection_" .. string.lower(iter_0_18)), iter_0_18))
end

if slot_0_8_0.indicators_color:GetValue():Get():GetR() == 0 and slot_0_8_0.indicators_color:GetValue():Get():GetG() == 0 and slot_0_8_0.indicators_color:GetValue():Get():GetB() == 0 and slot_0_8_0.indicators_color:GetValue():Get():GetA() == 0 then
	slot_0_8_0.indicators_color:GetValue():Set(draw.Color("#bbbbffff"))
end

slot_0_8_0.ui = gui.Checkbox(gui.ControlID("ui"))
slot_0_8_0.ui_selection = gui.ComboBox(gui.ControlID("ui_selection"))
slot_0_8_0.ui_selection.allow_multiple = true
slot_0_8_0.ui_color = gui.ColorPicker(gui.ControlID("ui_color"))

for iter_0_19, iter_0_20 in ipairs({
	"Watermark"
}) do
	slot_0_8_0.ui_selection:Add(gui.Selectable(gui.ControlID("ui_selection_" .. string.lower(iter_0_20)), iter_0_20))
end

if not slot_0_5_0.get_combo_box(slot_0_8_0.ui_selection, {
	"Watermark"
})[1] then
	slot_0_5_0.set_combo_box(slot_0_8_0.ui_selection, {
		"Watermark"
	}, "Watermark")
end

if slot_0_8_0.ui_color:GetValue():Get():GetR() == 0 and slot_0_8_0.ui_color:GetValue():Get():GetG() == 0 and slot_0_8_0.ui_color:GetValue():Get():GetB() == 0 and slot_0_8_0.ui_color:GetValue():Get():GetA() == 0 then
	slot_0_8_0.ui_color:GetValue():Set(draw.Color("#bbbbffff"))
end

slot_0_8_0.manuals = gui.Checkbox(gui.ControlID("manuals"))
slot_0_8_0.manuals_selection = gui.ComboBox(gui.ControlID("manuals_selection"))
slot_0_8_0.manuals_selection.tooltip = "Type"
slot_0_8_0.manuals_color = gui.ColorPicker(gui.ControlID("manuals_color"))

for iter_0_21, iter_0_22 in ipairs({
	"Circle",
	"Arrow"
}) do
	slot_0_8_0.manuals_selection:Add(gui.Selectable(gui.ControlID("manuals_selection_" .. string.lower(iter_0_22)), iter_0_22))
end

if slot_0_8_0.manuals_color:GetValue():Get():GetR() == 0 and slot_0_8_0.manuals_color:GetValue():Get():GetG() == 0 and slot_0_8_0.manuals_color:GetValue():Get():GetB() == 0 and slot_0_8_0.manuals_color:GetValue():Get():GetA() == 0 then
	slot_0_8_0.manuals_color:GetValue():Set(draw.Color("#5a78ffc7"))
end

slot_0_8_0.grenade_prediction = gui.Checkbox(gui.ControlID("grenade_prediction"))
slot_0_8_0.grenade_prediction_selection = gui.ComboBox(gui.ControlID("grenade_prediction_selection"))
slot_0_8_0.grenade_prediction_selection.allow_multiple = true

for iter_0_23, iter_0_24 in ipairs({
	"Improve color"
}) do
	slot_0_8_0.grenade_prediction_selection:Add(gui.Selectable(gui.ControlID("grenade_prediction_selection_" .. string.lower(iter_0_24)), iter_0_24))
end

if not slot_0_5_0.get_combo_box(slot_0_8_0.grenade_prediction_selection, {
	"Improve color"
})[1] then
	slot_0_5_0.set_combo_box(slot_0_8_0.grenade_prediction_selection, {
		"Improve color"
	}, "Improve color")
end

slot_0_8_0.enemy_esp_info = gui.Checkbox(gui.ControlID("enemy_esp_info"))
slot_0_8_0.enemy_esp_info_selection = gui.ComboBox(gui.ControlID("enemy_esp_info_selection"))
slot_0_8_0.enemy_esp_info_selection.allow_multiple = true

for iter_0_25, iter_0_26 in ipairs({
	"Hostage",
	"Slowed down"
}) do
	slot_0_8_0.enemy_esp_info_selection:Add(gui.Selectable(gui.ControlID("enemy_esp_info_selection_" .. string.lower(iter_0_26)), iter_0_26))
end

if not slot_0_5_0.get_combo_box(slot_0_8_0.enemy_esp_info_selection, {
	"Hostage",
	"Slowed down"
})[1] then
	slot_0_5_0.set_combo_box(slot_0_8_0.enemy_esp_info_selection, {
		"Hostage",
		"Slowed down"
	}, "Hostage")
end

slot_0_8_0.latency = gui.Slider(gui.ControlID("latency"), 1, 180, {
	"%.0fms"
}, 1)
slot_0_8_0.latency.tooltip = "Select the value that you can get on the server based on your location"
slot_0_8_0.latency_auto_connect = gui.Checkbox(gui.ControlID("latency_auto_connect"))
slot_0_8_0.latency_auto_connect.tooltip = "Auto connect"
slot_0_8_0.latency_stop = gui.Button(gui.ControlID("latency_stop"), "Stop")
slot_0_8_0.latency_brute = gui.Button(gui.ControlID("latency_brute"), "Brute")

function slot_0_8_0.update()
	if not slot_0_5_0.get_combo_box(slot_0_8_0.tab_selection, {
		"Main",
		"Visuals",
		"Latency"
	})[1] then
		slot_0_5_0.set_combo_box(slot_0_8_0.tab_selection, {
			"Main",
			"Visuals",
			"Latency"
		}, "Main")
	end

	if not slot_0_5_0.get_combo_box(slot_0_8_0.peek_assist_jump_on_retreat, {
		"Off",
		"Always on",
		"Only while standing"
	})[1] then
		slot_0_5_0.set_combo_box(slot_0_8_0.peek_assist_jump_on_retreat, {
			"Off",
			"Always on",
			"Only while standing"
		}, "Off")
	end

	if not slot_0_5_0.get_combo_box(slot_0_8_0.manuals_selection, {
		"Circle",
		"Arrow"
	})[1] then
		slot_0_5_0.set_combo_box(slot_0_8_0.manuals_selection, {
			"Circle",
			"Arrow"
		}, "Circle")
	end

	if slot_0_8_0.latency:GetValue():Get() == 0 then
		slot_0_8_0.latency:GetValue():Set(1)
	end

	local var_17_0 = false

	for iter_17_0, iter_17_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.improvements_selection, {
		"Disable alt. fire on R8",
		"Grenade throwing",
		"Safe ladder angles",
		"Quick switch",
		"Mouse sensitivity"
	})) do
		if iter_17_1 == "Quick switch" then
			var_17_0 = true
		end
	end

	if slot_0_8_0.improvements:GetValue():Get() and var_17_0 then
		if not slot_0_5_0.main.improvements.quick_switch.argument then
			slot_0_5_0.main.improvements.quick_switch.argument = true
			slot_0_7_0.misc.quick_switch = slot_0_3_0.misc.grenades.quick_switch:GetValue():Get()
		end

		slot_0_3_0.misc.grenades.quick_switch:GetValue():Set(false)
		slot_0_3_0.misc.grenades.quick_switch:GetValue():DisableHotkeys()
	elseif slot_0_5_0.main.improvements.quick_switch.argument then
		slot_0_5_0.main.improvements.quick_switch.argument = false

		slot_0_3_0.misc.grenades.quick_switch:GetValue():Set(slot_0_7_0.misc.quick_switch and slot_0_7_0.misc.quick_switch or false)
	end
end

slot_0_9_0 = {
	extensions = {},
	improvements = {},
	peek_assist = {},
	indicators = {},
	disable_angles = function(arg_18_0)
		slot_18_1_0 = {
			round_end = false,
			freeze_time = false,
			safe_situation = false,
			warmup = false
		}

		for iter_18_0, iter_18_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.disable_angles_selection, {
			"Round end",
			"Safe situation",
			"Warmup",
			"Freeze time"
		})) do
			if iter_18_1 == "Round end" then
				slot_18_1_0.round_end = true
			end

			if iter_18_1 == "Safe situation" then
				slot_18_1_0.safe_situation = true
			end

			if iter_18_1 == "Warmup" then
				slot_18_1_0.warmup = true
			end

			if iter_18_1 == "Freeze time" then
				slot_18_1_0.freeze_time = true
			end
		end

		slot_0_5_0.shutdown.disable_angles.round_end = slot_18_1_0.round_end
		slot_0_5_0.shutdown.disable_angles.safe_situation = slot_18_1_0.safe_situation
		slot_0_5_0.shutdown.disable_angles.warmup = slot_18_1_0.warmup
		slot_0_5_0.shutdown.disable_angles.freeze_time = slot_18_1_0.freeze_time

		if slot_0_8_0.disable_angles:GetValue():Get() then
			slot_18_2_0 = 0
			slot_18_3_0 = 0
			slot_18_4_0 = 0
			slot_18_5_0 = 0

			entities.players:for_each(function(arg_19_0)
				if arg_19_0.entity and arg_19_0.entity:IsEnemy() and arg_19_0.entity:IsAlive() then
					slot_18_2_0 = slot_18_2_0 + 1
				end

				if arg_19_0.entity and arg_19_0.entity:IsEnemy() and arg_19_0.entity:IsAlive() and arg_19_0.entity:GetActiveWeapon() and (arg_19_0.entity:GetActiveWeapon():GetType() == 0 or arg_19_0.entity:GetActiveWeapon():GetType() == 7 or arg_19_0.entity:GetActiveWeapon():GetType() == 8 or arg_19_0.entity:GetActiveWeapon():GetType() == 9 or arg_19_0.entity:GetActiveWeapon():GetType() == 11) then
					slot_18_3_0 = slot_18_3_0 + 1
				end

				if arg_19_0.entity and arg_19_0.entity:IsAlive() then
					slot_18_4_0 = slot_18_4_0 + 1
				end

				if arg_19_0.entity and arg_19_0.entity:IsAlive() and arg_19_0.entity:GetActiveWeapon() and arg_19_0.entity:GetActiveWeapon():GetType() == 0 then
					slot_18_5_0 = slot_18_5_0 + 1
				end
			end)

			if slot_18_1_0.round_end and slot_0_5_0.main.disable_angles.round_end.value and slot_18_2_0 == 0 and not arg_18_0:GetButton(InputBitMask_t.IN_USE) then
				if not slot_0_5_0.main.disable_angles.round_end.argument then
					slot_0_5_0.main.disable_angles.round_end.argument = true
					slot_0_7_0.rage.angles.enabled = slot_0_3_0.rage.angles.enabled:GetValue():Get()
				end

				slot_0_3_0.rage.angles.enabled:GetValue():Set(false)
				slot_0_3_0.rage.angles.enabled:GetValue():DisableHotkeys()
			elseif slot_0_5_0.main.disable_angles.round_end.argument then
				slot_0_5_0.main.disable_angles.round_end.argument = false

				slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
			end

			if slot_18_1_0.safe_situation and slot_18_2_0 > 0 and slot_18_3_0 == slot_18_2_0 and slot_18_4_0 ~= slot_18_5_0 and not arg_18_0:GetButton(InputBitMask_t.IN_USE) then
				if not slot_0_5_0.main.disable_angles.safe_situation.argument then
					slot_0_5_0.main.disable_angles.safe_situation.argument = true
					slot_0_7_0.rage.angles.enabled = slot_0_3_0.rage.angles.enabled:GetValue():Get()
					slot_0_7_0.rage.angles.pitch = slot_0_5_0.get_combo_box(slot_0_3_0.rage.angles.pitch.value, {
						"None",
						"Down",
						"Up",
						"Zero",
						"Custom"
					})[1]
					slot_0_7_0.rage.angles.spin.value = slot_0_3_0.rage.angles.spin.value:GetValue():Get()
					slot_0_7_0.rage.angles.spin.amount = slot_0_3_0.rage.angles.spin.amount:GetValue():Get()
				end

				slot_0_3_0.rage.angles.enabled:GetValue():Set(true)
				slot_0_3_0.rage.angles.enabled:GetValue():DisableHotkeys()
				slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.pitch.value, {
					"None",
					"Down",
					"Up",
					"Zero",
					"Custom"
				}, "Up")
				slot_0_3_0.rage.angles.pitch.value:GetValue():DisableHotkeys()
				slot_0_3_0.rage.angles.spin.value:GetValue():Set(true)
				slot_0_3_0.rage.angles.spin.value:GetValue():DisableHotkeys()
				slot_0_3_0.rage.angles.spin.amount:GetValue():Set(20)
				slot_0_3_0.rage.angles.spin.amount:GetValue():DisableHotkeys()
			elseif slot_0_5_0.main.disable_angles.safe_situation.argument then
				slot_0_5_0.main.disable_angles.safe_situation.argument = false

				slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
				slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.pitch.value, {
					"None",
					"Down",
					"Up",
					"Zero",
					"Custom"
				}, slot_0_7_0.rage.angles.pitch and slot_0_7_0.rage.angles.pitch or "Down")
				slot_0_3_0.rage.angles.spin.value:GetValue():Set(slot_0_7_0.rage.angles.spin.value and slot_0_7_0.rage.angles.spin.value or false)
				slot_0_3_0.rage.angles.spin.amount:GetValue():Set(slot_0_7_0.rage.angles.spin.amount and slot_0_7_0.rage.angles.spin.amount or 20)
			end
		else
			if slot_18_1_0.round_end and slot_0_5_0.main.disable_angles.round_end.argument then
				slot_0_5_0.main.disable_angles.round_end.argument = false

				slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
			end

			if slot_18_1_0.safe_situation and slot_0_5_0.main.disable_angles.safe_situation.argument then
				slot_0_5_0.main.disable_angles.safe_situation.argument = false

				slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
				slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.pitch.value, {
					"None",
					"Down",
					"Up",
					"Zero",
					"Custom"
				}, slot_0_7_0.rage.angles.pitch and slot_0_7_0.rage.angles.pitch or "Down")
				slot_0_3_0.rage.angles.spin.value:GetValue():Set(slot_0_7_0.rage.angles.spin.value and slot_0_7_0.rage.angles.spin.value or false)
				slot_0_3_0.rage.angles.spin.amount:GetValue():Set(slot_0_7_0.rage.angles.spin.amount and slot_0_7_0.rage.angles.spin.amount or 20)
			end

			if slot_18_1_0.warmup and slot_0_5_0.main.disable_angles.warmup.argument then
				slot_0_5_0.main.disable_angles.warmup.argument = false

				slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
			end

			if slot_18_1_0.freeze_time and slot_0_5_0.main.disable_angles.freeze_time.argument then
				slot_0_5_0.main.disable_angles.freeze_time.argument = false

				slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
			end
		end
	end
}

function slot_0_9_0.extensions.createMove(arg_20_0)
	slot_20_1_0 = {
		fast_ladder = false,
		no_fall_damage = false,
		jump_scout = false,
		doubletap_on_knife = false,
		quick_plant = false,
		prevent_afk_kick = false
	}

	for iter_20_0, iter_20_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.extensions_selection, {
		"Jump scout",
		"No fall damage",
		"Fast ladder",
		"Quick plant",
		"Doubletap on knife",
		"Opposite knife hand",
		"Prevent AFK kick"
	})) do
		if iter_20_1 == "Jump scout" then
			slot_20_1_0.jump_scout = true
		end

		if iter_20_1 == "No fall damage" then
			slot_20_1_0.no_fall_damage = true
		end

		if iter_20_1 == "Fast ladder" then
			slot_20_1_0.fast_ladder = true
		end

		if iter_20_1 == "Quick plant" then
			slot_20_1_0.quick_plant = true
		end

		if iter_20_1 == "Doubletap on knife" then
			slot_20_1_0.doubletap_on_knife = true
		end

		if iter_20_1 == "Prevent AFK kick" then
			slot_20_1_0.prevent_afk_kick = true
		end
	end

	slot_0_5_0.shutdown.extensions.jump_scout = slot_20_1_0.jump_scout
	slot_0_5_0.shutdown.extensions.no_fall_damage = slot_20_1_0.no_fall_damage
	slot_0_5_0.shutdown.extensions.doubletap_on_knife = slot_20_1_0.doubletap_on_knife
	slot_20_2_0 = true

	if slot_0_8_0.extensions:GetValue():Get() and slot_20_1_0.jump_scout and (arg_20_0:GetButton(InputBitMask_t.IN_JUMP) or bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0) and slot_0_4_0:Get(entities.GetLocalPawn(), "m_MoveType", "uint8_t*") ~= 9 and entities.GetLocalPawn():GetActiveWeapon() and entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.SSG08 and slot_20_2_0 and not slot_0_3_0.rage.overrides.force_shoot:GetValue():GetHotkeyState() then
		if not slot_0_5_0.main.extensions.jump_scout.argument then
			slot_0_5_0.main.extensions.jump_scout.argument = true
			slot_0_7_0.rage.overrides.force_shoot = slot_0_3_0.rage.overrides.force_shoot:GetValue():Get()
		end

		slot_0_3_0.rage.overrides.force_shoot:GetValue():Set(true)
	elseif slot_0_5_0.main.extensions.jump_scout.argument then
		slot_0_5_0.main.extensions.jump_scout.argument = false

		if slot_0_3_0.rage.overrides.force_shoot:GetValue():GetHotkeyState() then
			slot_0_3_0.rage.overrides.force_shoot:GetValue():DisableHotkeys()
		end

		slot_0_3_0.rage.overrides.force_shoot:GetValue():Set(slot_0_7_0.rage.overrides.force_shoot and slot_0_7_0.rage.overrides.force_shoot or false)
	end

	if slot_0_8_0.extensions:GetValue():Get() and slot_20_1_0.no_fall_damage and entities.GetLocalPawn():GetAbsVelocity().z < -575 and not slot_0_3_0.misc.movement.jumpbug:GetValue():Get() then
		if not slot_0_5_0.main.extensions.no_fall_damage.argument then
			slot_0_5_0.main.extensions.no_fall_damage.argument = true
			slot_0_7_0.misc.jumpbug = slot_0_3_0.misc.movement.jumpbug:GetValue():Get()
		end

		slot_0_3_0.misc.movement.jumpbug:GetValue():Set(true)
		slot_0_3_0.misc.movement.jumpbug:GetValue():DisableHotkeys()
	elseif slot_0_5_0.main.extensions.no_fall_damage.argument then
		slot_0_5_0.main.extensions.no_fall_damage.argument = false

		slot_0_3_0.misc.movement.jumpbug:GetValue():Set(slot_0_7_0.misc.jumpbug and slot_0_7_0.misc.jumpbug or true)
	end

	if slot_0_8_0.extensions:GetValue():Get() and slot_20_1_0.fast_ladder and not arg_20_0:GetButton(InputBitMask_t.IN_USE) and slot_0_5_0.events.grenade_thrown and not game.cvar:Find("sv_quantize_movement_input").value then
		slot_20_3_0 = false

		for iter_20_2, iter_20_3 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.improvements_selection, {
			"Disable alt. fire on R8",
			"Grenade throwing",
			"Safe ladder angles",
			"Quick switch",
			"Mouse sensitivity"
		})) do
			if iter_20_3 == "Safe ladder angles" then
				slot_20_3_0 = true
			end
		end

		if slot_0_8_0.improvements:GetValue():Get() and slot_20_3_0 and (arg_20_0:GetButton(InputBitMask_t.IN_DUCK) or arg_20_0:GetButton(InputBitMask_t.IN_SPEED)) then
			return
		end

		if slot_0_4_0:Get(entities.GetLocalPawn(), "m_MoveType", "uint8_t*") == 9 then
			if not slot_0_5_0.main.extensions.fast_ladder.argument then
				slot_0_5_0.main.extensions.fast_ladder.argument = true
				slot_0_7_0.main.yaw = arg_20_0:GetViewangles().y
			end

			slot_20_4_0 = arg_20_0:GetViewangles().y
			slot_20_5_0 = math.abs(slot_20_4_0 + 90 - slot_0_7_0.main.yaw)

			if slot_20_5_0 > 180 then
				slot_20_5_0 = 360 - slot_20_5_0
			end

			if slot_20_5_0 > 120 then
				if arg_20_0:GetButton(InputBitMask_t.IN_FORWARD) then
					arg_20_0:SetLeftMove(-1)
					arg_20_0:SetForwardMove(1)

					if arg_20_0:GetButton(InputBitMask_t.IN_MOVELEFT) then
						slot_20_4_0 = slot_20_4_0 + 60
					elseif arg_20_0:GetButton(InputBitMask_t.IN_MOVERIGHT) then
						slot_20_4_0 = slot_20_4_0 - 60
					end
				elseif arg_20_0:GetButton(InputBitMask_t.IN_BACK) then
					arg_20_0:SetLeftMove(1)
					arg_20_0:SetForwardMove(-1)

					if arg_20_0:GetButton(InputBitMask_t.IN_MOVELEFT) then
						slot_20_4_0 = slot_20_4_0 - 60
					elseif arg_20_0:GetButton(InputBitMask_t.IN_MOVERIGHT) then
						slot_20_4_0 = slot_20_4_0 + 60
					end
				end
			elseif arg_20_0:GetButton(InputBitMask_t.IN_FORWARD) then
				arg_20_0:SetLeftMove(arg_20_0:GetViewangles().x >= 59 and 1 or -1)
				arg_20_0:SetForwardMove(arg_20_0:GetViewangles().x >= 59 and 1 or -1)

				if arg_20_0:GetButton(InputBitMask_t.IN_MOVELEFT) then
					slot_20_4_0 = arg_20_0:GetViewangles().x >= 59 and slot_20_4_0 - 60 or slot_20_4_0 + 60

					arg_20_0:SetForwardMove(arg_20_0:GetViewangles().x >= 59 and 1 or -1)
					arg_20_0:SetLeftMove(arg_20_0:GetViewangles().x < 59 and -1 or 1)
				elseif arg_20_0:GetButton(InputBitMask_t.IN_MOVERIGHT) then
					slot_20_4_0 = arg_20_0:GetViewangles().x >= 59 and slot_20_4_0 + 60 or slot_20_4_0 - 60

					arg_20_0:SetForwardMove(arg_20_0:GetViewangles().x >= 59 and 1 or -1)
					arg_20_0:SetLeftMove(arg_20_0:GetViewangles().x < 59 and -1 or 1)
				end
			elseif arg_20_0:GetButton(InputBitMask_t.IN_BACK) then
				arg_20_0:SetLeftMove(arg_20_0:GetViewangles().x >= 59 and -1 or 1)
				arg_20_0:SetForwardMove(arg_20_0:GetViewangles().x >= 59 and -1 or 1)

				if arg_20_0:GetButton(InputBitMask_t.IN_MOVELEFT) then
					slot_20_4_0 = arg_20_0:GetViewangles().x >= 59 and slot_20_4_0 + 60 or slot_20_4_0 - 60

					arg_20_0:SetForwardMove(arg_20_0:GetViewangles().x >= 59 and -1 or 1)
					arg_20_0:SetLeftMove(arg_20_0:GetViewangles().x < 59 and 1 or -1)
				elseif arg_20_0:GetButton(InputBitMask_t.IN_MOVERIGHT) then
					slot_20_4_0 = arg_20_0:GetViewangles().x >= 59 and slot_20_4_0 - 60 or slot_20_4_0 + 60

					arg_20_0:SetForwardMove(arg_20_0:GetViewangles().x >= 59 and -1 or 1)
					arg_20_0:SetLeftMove(arg_20_0:GetViewangles().x < 59 and 1 or -1)
				end
			end

			if arg_20_0:GetButton(InputBitMask_t.IN_FORWARD) or arg_20_0:GetButton(InputBitMask_t.IN_BACK) then
				arg_20_0:SetViewangles(Vector(89, arg_20_0:GetButton(InputBitMask_t.IN_JUMP) and slot_20_4_0 or slot_20_4_0 + 90, arg_20_0:GetViewangles().z))
			end

			if slot_0_8_0.improvements:GetValue():Get() and slot_20_3_0 and (arg_20_0:GetButton(InputBitMask_t.IN_MOVELEFT) or arg_20_0:GetButton(InputBitMask_t.IN_MOVERIGHT)) and not arg_20_0:GetButton(InputBitMask_t.IN_FORWARD) and not arg_20_0:GetButton(InputBitMask_t.IN_BACK) then
				arg_20_0:SetLeftMove(-arg_20_0:GetLeftMove())
				arg_20_0:SetForwardMove(-arg_20_0:GetForwardMove())
				arg_20_0:SetViewangles(Vector(89, arg_20_0:GetButton(InputBitMask_t.IN_JUMP) and arg_20_0:GetViewangles().y or arg_20_0:GetViewangles().y + 180, arg_20_0:GetViewangles().z))
			end
		else
			slot_0_5_0.main.extensions.fast_ladder.argument = false
		end
	end

	if slot_0_8_0.extensions:GetValue():Get() and slot_20_1_0.quick_plant and (arg_20_0:GetButton(InputBitMask_t.IN_USE) or arg_20_0:GetButton(InputBitMask_t.IN_ATTACK)) and entities.GetLocalPawn():GetActiveWeapon() and entities.GetLocalPawn():GetActiveWeapon():GetType() == 7 then
		if (game.cvar:Find("mp_plant_c4_anywhere").value and true or entities.GetLocalPawn().m_bInBombZone:Get()) and (arg_20_0:GetButton(InputBitMask_t.IN_JUMP) or bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0) then
			arg_20_0:RemoveButton(InputBitMask_t.IN_USE)
			arg_20_0:RemoveButton(InputBitMask_t.IN_ATTACK)
		else
			arg_20_0:SetButton(InputBitMask_t.IN_ATTACK)
		end
	end

	if slot_0_8_0.extensions:GetValue():Get() and slot_20_1_0.doubletap_on_knife and entities.GetLocalPawn():GetActiveWeapon() then
		if not slot_0_5_0.main.extensions.doubletap_on_knife.argument then
			slot_0_5_0.main.extensions.doubletap_on_knife.argument = true
			slot_0_7_0.rage.aimbot.doubletap = slot_0_3_0.rage.aimbot.doubletap:GetValue():Get()
		end

		slot_0_3_0.rage.aimbot.doubletap:GetValue():Set(entities.GetLocalPawn():GetActiveWeapon():GetType() == 0)
	elseif slot_0_5_0.main.extensions.doubletap_on_knife.argument then
		slot_0_5_0.main.extensions.doubletap_on_knife.argument = false

		slot_0_3_0.rage.aimbot.doubletap:GetValue():Set(slot_0_7_0.rage.aimbot.doubletap and slot_0_7_0.rage.aimbot.doubletap or true)
	end

	if slot_0_8_0.extensions:GetValue():Get() and slot_20_1_0.prevent_afk_kick then
		if arg_20_0:GetButton(InputBitMask_t.IN_JUMP) or bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0 then
			return
		end

		if slot_0_5_0.get_velocity(entities.GetLocalPawn()) >= 10 then
			slot_0_5_0.main.extensions.prevent_afk_kick.value = game.globalVars.m_flCurTime
		end

		if game.globalVars.m_flCurTime - slot_0_5_0.main.extensions.prevent_afk_kick.value >= 10 then
			if math.random(0, 1) == 1 then
				arg_20_0:SetLeftMove(math.random(0, 1) == 1 and 1 or -1)
			else
				arg_20_0:SetForwardMove(math.random(0, 1) == 1 and 1 or -1)
			end
		end
	end
end

function slot_0_9_0.extensions.presentQueue()
	local var_21_0 = false

	for iter_21_0, iter_21_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.extensions_selection, {
		"Jump scout",
		"No fall damage",
		"Fast ladder",
		"Quick plant",
		"Doubletap on knife",
		"Opposite knife hand",
		"Prevent AFK kick"
	})) do
		if iter_21_1 == "Opposite knife hand" then
			var_21_0 = true
		end
	end

	slot_0_5_0.shutdown.extensions.opposite_knife_hand = var_21_0

	if slot_0_8_0.extensions:GetValue():Get() and var_21_0 and entities.GetLocalPawn() and entities.GetLocalPawn():IsAlive() then
		if not slot_0_5_0.main.extensions.opposite_knife_hand.argument then
			slot_0_5_0.main.extensions.opposite_knife_hand.argument = true
			slot_0_7_0.main.left_handed = entities.GetLocalPawn():IsLeftHanded()
		end
	elseif slot_0_5_0.main.extensions.opposite_knife_hand.argument then
		slot_0_5_0.main.extensions.opposite_knife_hand.argument = false

		game.engine:ClientCmd(slot_0_7_0.main.left_handed and "switchhandsleft" or "switchhandsright")
	end

	if slot_0_8_0.extensions:GetValue():Get() and var_21_0 and entities.GetLocalPawn() and entities.GetLocalPawn():IsAlive() and entities.GetLocalPawn():GetActiveWeapon() then
		if entities.GetLocalPawn():GetActiveWeapon():GetClassName() == "C_MolotovGrenade" or entities.GetLocalPawn():GetActiveWeapon():GetType() == 7 then
			return
		end

		if entities.GetLocalPawn():GetActiveWeapon():GetType() == 0 then
			if not slot_0_5_0.main.extensions.opposite_knife_hand.value.argument then
				slot_0_5_0.main.extensions.opposite_knife_hand.value.argument = true

				game.engine:ClientCmd(slot_0_7_0.main.left_handed and "switchhandsright" or "switchhandsleft")
			end
		elseif slot_0_5_0.main.extensions.opposite_knife_hand.value.argument then
			slot_0_5_0.main.extensions.opposite_knife_hand.value.argument = false

			game.engine:ClientCmd(slot_0_7_0.main.left_handed and "switchhandsleft" or "switchhandsright")
		end
	elseif slot_0_5_0.main.extensions.opposite_knife_hand.value.argument then
		slot_0_5_0.main.extensions.opposite_knife_hand.value.argument = false

		game.engine:ClientCmd(slot_0_7_0.main.left_handed and "switchhandsleft" or "switchhandsright")
	end
end

function slot_0_9_0.suppressions(arg_22_0)
	slot_22_1_0 = {
		rotation_animation = false,
		breath_animation = false
	}

	for iter_22_0, iter_22_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.suppressions_selection, {
		"Rotation animation",
		"Breath animation"
	})) do
		if iter_22_1 == "Rotation animation" then
			slot_22_1_0.rotation_animation = true
		end

		if iter_22_1 == "Breath animation" then
			slot_22_1_0.breath_animation = true
		end
	end

	slot_0_5_0.shutdown.suppressions.rotation_animation = slot_22_1_0.rotation_animation
	slot_22_2_0 = {
		manual_override = {
			left = slot_0_5_0.get_bind_press(slot_0_3_0.rage.angles.manual_override.left),
			right = slot_0_5_0.get_bind_press(slot_0_3_0.rage.angles.manual_override.right),
			back = slot_0_5_0.get_bind_press(slot_0_3_0.rage.angles.manual_override.back),
			forward = slot_0_5_0.get_bind_press(slot_0_3_0.rage.angles.manual_override.forward)
		},
		yaw_amount = slot_0_5_0.get_bind_press(slot_0_3_0.rage.angles.yaw.amount, true)
	}
	slot_22_3_0 = {
		manual_override = {
			left = slot_0_5_0.extend_pulse("manual_override_left", slot_22_2_0.manual_override.left, 0.02),
			right = slot_0_5_0.extend_pulse("manual_override_right", slot_22_2_0.manual_override.right, 0.02),
			back = slot_0_5_0.extend_pulse("manual_override_back", slot_22_2_0.manual_override.back, 0.02),
			forward = slot_0_5_0.extend_pulse("manual_override_forward", slot_22_2_0.manual_override.forward, 0.02)
		},
		yaw_amount = slot_0_5_0.extend_pulse("manual_override_yaw_amount", slot_22_2_0.yaw_amount, 0.02)
	}

	if slot_0_8_0.suppressions:GetValue():Get() and slot_22_1_0.rotation_animation and (slot_22_3_0.manual_override.left or slot_22_3_0.manual_override.right or slot_22_3_0.manual_override.back or slot_22_3_0.manual_override.forward or slot_22_3_0.yaw_amount) then
		if not slot_0_5_0.main.suppressions.rotation_animation.argument then
			slot_0_5_0.main.suppressions.rotation_animation.argument = true
			slot_0_7_0.rage.angles.yaw_jitter.value = slot_0_5_0.get_combo_box(slot_0_3_0.rage.angles.yaw.jitter.value, {
				"None",
				"Center",
				"Offset"
			})[1]
			slot_0_7_0.rage.angles.yaw_jitter.amount = slot_0_3_0.rage.angles.yaw.jitter.amount:GetValue():Get()
			slot_0_7_0.rage.angles.yaw_jitter.three_way = slot_0_3_0.rage.angles.yaw.jitter.three_way:GetValue():Get()
			slot_0_7_0.rage.angles.yaw_jitter.disablers = slot_0_3_0.rage.angles.yaw.jitter.disablers:GetValue():Get():GetRaw()
		end

		slot_0_3_0.rage.angles.yaw.jitter.value:GetValue():DisableHotkeys()
		slot_0_3_0.rage.angles.yaw.jitter.amount:GetValue():DisableHotkeys()
		slot_0_3_0.rage.angles.yaw.jitter.three_way:GetValue():DisableHotkeys()
		slot_0_3_0.rage.angles.yaw.jitter.disablers:GetValue():DisableHotkeys()
		slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.yaw.jitter.value, {
			"None",
			"Center",
			"Offset"
		}, "Center")
		slot_0_3_0.rage.angles.yaw.jitter.amount:GetValue():Set(90)
		slot_0_3_0.rage.angles.yaw.jitter.three_way:GetValue():Set(false)
		slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.yaw.jitter.disablers, {
			"Angle override",
			"Yaw change"
		}, "")
	elseif slot_0_5_0.main.suppressions.rotation_animation.argument then
		slot_0_5_0.main.suppressions.rotation_animation.argument = false

		slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.yaw.jitter.value, {
			"None",
			"Center",
			"Offset"
		}, slot_0_7_0.rage.angles.yaw_jitter.value and slot_0_7_0.rage.angles.yaw_jitter.value or "None")
		slot_0_3_0.rage.angles.yaw.jitter.amount:GetValue():Set(slot_0_7_0.rage.angles.yaw_jitter.amount and slot_0_7_0.rage.angles.yaw_jitter.amount or 0)
		slot_0_3_0.rage.angles.yaw.jitter.three_way:GetValue():Set(slot_0_7_0.rage.angles.yaw_jitter.three_way and slot_0_7_0.rage.angles.yaw_jitter.three_way or false)

		slot_22_4_1 = slot_0_3_0.rage.angles.yaw.jitter.disablers:GetValue():Get()

		slot_22_4_1:set_raw(slot_0_7_0.rage.angles.yaw_jitter.disablers and slot_0_7_0.rage.angles.yaw_jitter.disablers or 0)
		slot_0_3_0.rage.angles.yaw.jitter.disablers:GetValue():Set(slot_22_4_1)
	end

	slot_22_4_0 = {
		manual_override = {
			left = slot_0_5_0.extend_pulse("breath_manual_override_left", slot_22_2_0.manual_override.left, 0.4),
			right = slot_0_5_0.extend_pulse("breath_manual_override_right", slot_22_2_0.manual_override.right, 0.4),
			back = slot_0_5_0.extend_pulse("breath_manual_override_back", slot_22_2_0.manual_override.back, 0.4),
			forward = slot_0_5_0.extend_pulse("breath_manual_override_forward", slot_22_2_0.manual_override.forward, 0.4)
		},
		yaw_amount = slot_0_5_0.extend_pulse("breath_manual_override_yaw_amount", slot_22_2_0.yaw_amount, 0.4)
	}

	if slot_0_5_0.get_velocity(entities.GetLocalPawn()) >= 10 then
		slot_0_5_0.main.suppressions.breath_animation.timer = game.globalVars.m_flCurTime
	end

	if slot_0_8_0.suppressions:GetValue():Get() and slot_22_1_0.breath_animation and not slot_22_4_0.manual_override.left and not slot_22_4_0.manual_override.right and not slot_22_4_0.manual_override.back and not slot_22_4_0.manual_override.forward and not slot_22_4_0.yaw_amount and entities.GetLocalPawn():GetActiveWeapon() and entities.GetLocalPawn():GetActiveWeapon():GetType() ~= 9 and game.globalVars.m_flCurTime - slot_0_5_0.main.suppressions.breath_animation.timer >= 0.1 and not arg_22_0:GetButton(InputBitMask_t.IN_FORWARD) and not arg_22_0:GetButton(InputBitMask_t.IN_BACK) and not arg_22_0:GetButton(InputBitMask_t.IN_MOVELEFT) and not arg_22_0:GetButton(InputBitMask_t.IN_MOVERIGHT) then
		if arg_22_0:GetButton(InputBitMask_t.IN_JUMP) or bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0 then
			return
		end

		if entities.GetLocalPawn().m_vecVelocity:Get().value:length() > ((entities.GetLocalPawn():GetActiveWeapon():GetType() == 0 or entities.GetLocalPawn():GetActiveWeapon():GetType() == 11) and 2 or 1) then
			return
		end

		slot_22_6_0 = slot_0_5_0.main.suppressions.breath_animation.value and 0.0056 or -0.0056

		if entities.GetLocalPawn().m_bIsScoped:Get() then
			slot_22_6_0 = slot_22_6_0 * 2
		end

		if bit.band(entities.GetLocalPawn().m_fFlags:Get(), 2) ~= 0 then
			slot_22_6_0 = slot_22_6_0 * 3
		end

		arg_22_0:SetLeftMove(slot_22_6_0)

		slot_0_5_0.main.suppressions.breath_animation.value = not slot_0_5_0.main.suppressions.breath_animation.value
	end
end

function slot_0_9_0.improvements.createMove(arg_23_0)
	slot_23_1_0 = {
		quick_switch = false,
		safe_ladder_angles = false,
		grenade_throwing = false,
		disable_alternative_fire_on_r8 = false
	}

	for iter_23_0, iter_23_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.improvements_selection, {
		"Disable alt. fire on R8",
		"Grenade throwing",
		"Safe ladder angles",
		"Quick switch",
		"Mouse sensitivity"
	})) do
		if iter_23_1 == "Disable alt. fire on R8" then
			slot_23_1_0.disable_alternative_fire_on_r8 = true
		end

		if iter_23_1 == "Grenade throwing" then
			slot_23_1_0.grenade_throwing = true
		end

		if iter_23_1 == "Safe ladder angles" then
			slot_23_1_0.safe_ladder_angles = true
		end

		if iter_23_1 == "Quick switch" then
			slot_23_1_0.quick_switch = true
		end
	end

	slot_0_5_0.shutdown.improvements.quick_switch = slot_23_1_0.quick_switch

	if slot_0_8_0.improvements:GetValue():Get() and slot_23_1_0.disable_alternative_fire_on_r8 and entities.GetLocalPawn():GetActiveWeapon() and entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.REVOLVER then
		arg_23_0:RemoveButton(InputBitMask_t.IN_ATTACK2)
	end

	if not entities.GetLocalPawn():GetActiveWeapon() or entities.GetLocalPawn():GetActiveWeapon():GetType() ~= 9 then
		slot_0_5_0.events.grenade_thrown = true
	end

	if slot_0_8_0.improvements:GetValue():Get() and slot_23_1_0.grenade_throwing and entities.GetLocalPawn():GetActiveWeapon() and entities.GetLocalPawn():GetActiveWeapon():GetType() == 9 and not slot_0_5_0.events.grenade_thrown then
		if not slot_0_5_0.main.improvements.grenade_throwing.argument then
			slot_0_5_0.main.improvements.grenade_throwing.argument = true
			slot_0_7_0.rage.angles.enabled = slot_0_3_0.rage.angles.enabled:GetValue():Get()
		end

		slot_0_3_0.rage.angles.enabled:GetValue():Set(false)
		slot_0_3_0.rage.angles.enabled:GetValue():DisableHotkeys()
	elseif slot_0_5_0.main.improvements.grenade_throwing.argument then
		slot_0_5_0.main.improvements.grenade_throwing.argument = false

		slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
	end

	if slot_0_8_0.improvements:GetValue():Get() and slot_23_1_0.safe_ladder_angles and (arg_23_0:GetButton(InputBitMask_t.IN_MOVELEFT) or arg_23_0:GetButton(InputBitMask_t.IN_MOVERIGHT) or arg_23_0:GetButton(InputBitMask_t.IN_FORWARD) or arg_23_0:GetButton(InputBitMask_t.IN_BACK)) and slot_0_5_0.events.grenade_thrown and not arg_23_0:GetButton(InputBitMask_t.IN_USE) then
		slot_23_2_0 = false

		for iter_23_2, iter_23_3 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.extensions_selection, {
			"Jump scout",
			"No fall damage",
			"Fast ladder",
			"Quick plant",
			"Doubletap on knife",
			"Opposite knife hand",
			"Prevent AFK kick"
		})) do
			if iter_23_3 == "Fast ladder" then
				slot_23_2_0 = true
			end
		end

		if slot_0_4_0:Get(entities.GetLocalPawn(), "m_MoveType", "uint8_t*") == 9 then
			if not slot_0_5_0.main.improvements.safe_ladder_angles.argument then
				slot_0_5_0.main.improvements.safe_ladder_angles.argument = true
				slot_0_7_0.main.yaw = arg_23_0:GetViewangles().y
			end

			if not slot_0_8_0.extensions:GetValue():Get() or not slot_23_2_0 or slot_0_8_0.extensions:GetValue():Get() and slot_23_2_0 and (arg_23_0:GetButton(InputBitMask_t.IN_DUCK) or arg_23_0:GetButton(InputBitMask_t.IN_SPEED)) or game.cvar:Find("sv_quantize_movement_input").value then
				slot_23_3_0 = arg_23_0:GetViewangles().y
				slot_23_4_0 = math.abs(slot_23_3_0 - slot_0_7_0.main.yaw)

				if slot_23_4_0 > 180 then
					slot_23_4_0 = 360 - slot_23_4_0
				end

				if slot_23_4_0 > 120 then
					arg_23_0:SetForwardMove(arg_23_0:GetForwardMove())
				else
					arg_23_0:SetForwardMove(arg_23_0:GetViewangles().x >= 59 and arg_23_0:GetForwardMove() or -arg_23_0:GetForwardMove())
				end

				arg_23_0:SetViewangles(Vector(89, arg_23_0:GetButton(InputBitMask_t.IN_JUMP) and arg_23_0:GetViewangles().y or arg_23_0:GetViewangles().y + 180, arg_23_0:GetViewangles().z))
				arg_23_0:SetLeftMove(-arg_23_0:GetLeftMove())
			end
		else
			slot_0_5_0.main.improvements.safe_ladder_angles.argument = false
		end
	end

	slot_0_5_0.grenade_thrown_tick = slot_0_5_0.get_grenade_thrown(entities.GetLocalPawn())

	if slot_0_8_0.improvements:GetValue():Get() and slot_23_1_0.quick_switch then
		if slot_0_5_0.grenade_thrown_tick then
			slot_0_5_0.main.improvements.quick_switch.grenade_thrown_end = game.globalVars.m_flCurTime + 0.08
			slot_0_5_0.main.improvements.quick_switch.grenade_thrown_next = false
		end

		slot_0_5_0.main.improvements.quick_switch.grenade_thrown = game.globalVars.m_flCurTime >= slot_0_5_0.main.improvements.quick_switch.grenade_thrown_end

		if entities.GetLocalPawn().m_iShotsFired:Get() == 1 and entities.GetLocalPawn():GetActiveWeapon() and entities.GetLocalPawn():GetActiveWeapon():GetType() == 8 and game.cvar:Find("sv_infinite_ammo").value ~= 1 then
			game.engine:ClientCmd("slot3; slot2; slot1")
		elseif slot_0_5_0.main.improvements.quick_switch.grenade_thrown and not slot_0_5_0.main.improvements.quick_switch.grenade_thrown_next then
			game.engine:ClientCmd("slot3; slot2; slot1")

			slot_0_5_0.main.improvements.quick_switch.grenade_thrown_next = true
		end
	end
end

function slot_0_9_0.improvements.presentQueue()
	local var_24_0 = false

	for iter_24_0, iter_24_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.improvements_selection, {
		"Disable alt. fire on R8",
		"Grenade throwing",
		"Safe ladder angles",
		"Quick switch",
		"Mouse sensitivity"
	})) do
		if iter_24_1 == "Mouse sensitivity" then
			var_24_0 = true
		end
	end

	slot_0_5_0.shutdown.improvements.mouse_sensitivity = var_24_0

	if slot_0_8_0.improvements:GetValue():Get() and var_24_0 then
		if not slot_0_5_0.main.improvements.mouse_sensitivity.argument.enabled then
			slot_0_5_0.main.improvements.mouse_sensitivity.argument.enabled = true

			game.engine:ClientCmd("sensitivity " .. slot_0_7_0.main.sensitivity * slot_0_3_0.visuals.view.fov_override.fov:GetValue():Get() / 90)
		end

		if slot_0_3_0.visuals.view.fov_override.fov:GetValue():Get() ~= slot_0_7_0.main.fov then
			if not slot_0_5_0.main.improvements.mouse_sensitivity.argument.sensitivity then
				slot_0_5_0.main.improvements.mouse_sensitivity.argument.sensitivity = true

				game.engine:ClientCmd("sensitivity " .. slot_0_7_0.main.sensitivity * slot_0_3_0.visuals.view.fov_override.fov:GetValue():Get() / 90)
			end

			slot_0_7_0.main.fov = slot_0_3_0.visuals.view.fov_override.fov:GetValue():Get()
		else
			slot_0_5_0.main.improvements.mouse_sensitivity.argument.sensitivity = false
		end
	elseif slot_0_5_0.main.improvements.mouse_sensitivity.argument.enabled then
		slot_0_5_0.main.improvements.mouse_sensitivity.argument.enabled = false
		slot_0_5_0.main.improvements.mouse_sensitivity.argument.sensitivity = false

		game.engine:ClientCmd("sensitivity " .. (slot_0_7_0.main.sensitivity and slot_0_7_0.main.sensitivity or 1))
	end
end

function slot_0_9_0.drop_grenades()
	if not slot_0_8_0.drop_grenades:GetValue():Get() then
		slot_0_5_0.main.drop_grenades.state = 0

		return
	end

	if not entities.GetLocalPawn():GetActiveWeapon() then
		slot_0_5_0.main.drop_grenades.state = 0

		return
	end

	slot_25_0_0 = {
		decoy = false,
		he = false,
		flashbang = false,
		smoke = false,
		molotov = false
	}

	for iter_25_0, iter_25_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.drop_grenades_selection, {
		"HE Grenade",
		"Molotov",
		"Smoke",
		"Flashbang",
		"Decoy"
	})) do
		if iter_25_1 == "HE Grenade" then
			slot_25_0_0.he = true
		end

		if iter_25_1 == "Molotov" then
			slot_25_0_0.molotov = true
		end

		if iter_25_1 == "Smoke" then
			slot_25_0_0.smoke = true
		end

		if iter_25_1 == "Flashbang" then
			slot_25_0_0.flashbang = true
		end

		if iter_25_1 == "Decoy" then
			slot_25_0_0.decoy = true
		end
	end

	if slot_0_5_0.main.drop_grenades.state == 0 then
		if slot_25_0_0.he then
			game.engine:ClientCmd("slot6")

			slot_0_5_0.main.drop_grenades.state = 1
		else
			slot_0_5_0.main.drop_grenades.state = 2
		end
	elseif slot_0_5_0.main.drop_grenades.state == 1 then
		if entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.HEGRENADE then
			game.engine:ClientCmd("drop")

			slot_0_5_0.main.drop_grenades.next = game.globalVars.m_flCurTime + 0.03
			slot_0_5_0.main.drop_grenades.state = 2
		else
			slot_0_5_0.main.drop_grenades.state = 2
		end
	elseif slot_0_5_0.main.drop_grenades.state == 2 and game.globalVars.m_flCurTime >= slot_0_5_0.main.drop_grenades.next then
		if slot_25_0_0.molotov then
			game.engine:ClientCmd("slot10")

			slot_0_5_0.main.drop_grenades.state = 3
		else
			slot_0_5_0.main.drop_grenades.state = 4
		end
	elseif slot_0_5_0.main.drop_grenades.state == 3 then
		if entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.MOLOTOV or entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.INCGRENADE then
			game.engine:ClientCmd("drop")

			slot_0_5_0.main.drop_grenades.next = game.globalVars.m_flCurTime + 0.03
			slot_0_5_0.main.drop_grenades.state = 4
		else
			slot_0_5_0.main.drop_grenades.state = 4
		end
	elseif slot_0_5_0.main.drop_grenades.state == 4 and game.globalVars.m_flCurTime >= slot_0_5_0.main.drop_grenades.next then
		if slot_25_0_0.smoke then
			game.engine:ClientCmd("slot8")

			slot_0_5_0.main.drop_grenades.state = 5
		else
			slot_0_5_0.main.drop_grenades.state = 6
		end
	elseif slot_0_5_0.main.drop_grenades.state == 5 then
		if entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.SMOKEGRENADE then
			game.engine:ClientCmd("drop")

			slot_0_5_0.main.drop_grenades.next = game.globalVars.m_flCurTime + 0.03
			slot_0_5_0.main.drop_grenades.state = 6
		else
			slot_0_5_0.main.drop_grenades.state = 6
		end
	elseif slot_0_5_0.main.drop_grenades.state == 6 and game.globalVars.m_flCurTime >= slot_0_5_0.main.drop_grenades.next then
		if slot_25_0_0.flashbang then
			game.engine:ClientCmd("slot7")

			slot_0_5_0.main.drop_grenades.state = 7
		else
			slot_0_5_0.main.drop_grenades.state = 8
		end
	elseif slot_0_5_0.main.drop_grenades.state == 7 then
		if entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.FLASHBANG then
			game.engine:ClientCmd("drop")

			slot_0_5_0.main.drop_grenades.next = game.globalVars.m_flCurTime + 0.03
			slot_0_5_0.main.drop_grenades.state = 8
		else
			slot_0_5_0.main.drop_grenades.state = 8
		end
	elseif slot_0_5_0.main.drop_grenades.state == 8 and game.globalVars.m_flCurTime >= slot_0_5_0.main.drop_grenades.next then
		if slot_25_0_0.decoy then
			game.engine:ClientCmd("slot9")

			slot_0_5_0.main.drop_grenades.state = 9
		else
			slot_0_5_0.main.drop_grenades.state = 10
		end
	elseif slot_0_5_0.main.drop_grenades.state == 9 then
		if entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.DECOY then
			game.engine:ClientCmd("drop")

			slot_0_5_0.main.drop_grenades.next = game.globalVars.m_flCurTime + 0.03
			slot_0_5_0.main.drop_grenades.state = 10
		else
			slot_0_5_0.main.drop_grenades.state = 10
		end
	elseif slot_0_5_0.main.drop_grenades.state == 10 and game.globalVars.m_flCurTime >= slot_0_5_0.main.drop_grenades.next then
		slot_0_5_0.main.drop_grenades.state = 0

		return
	end
end

function slot_0_9_0.peek_assist.createMove(arg_26_0)
	slot_26_1_0 = {
		main = slot_0_5_0.get_animation("peek_assist_createMove_alpha_main", slot_0_8_0.peek_assist:GetValue():Get(), 0.07)
	}
	slot_26_2_0 = entities.GetLocalPawn():GetAbsOrigin()
	slot_26_3_0 = Ray_t()

	slot_26_3_0:SetHull(Vector(-16, -16, 0), Vector(16, 16, 0))

	slot_26_4_0 = game.physicsQueryInterface:TraceRay(slot_26_3_0, slot_26_2_0, slot_26_2_0 - Vector(0, 0, 1000000000))
	slot_26_2_0 = slot_26_4_0 and slot_26_4_0.m_flFraction < 1 and (arg_26_0:GetButton(InputBitMask_t.IN_JUMP) or bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0) and slot_26_4_0.m_vEndPos or slot_26_2_0

	if slot_26_1_0.main > 0 then
		if not slot_0_5_0.main.peek_assist.argument then
			slot_0_5_0.main.peek_assist.argument = true

			if slot_0_7_0.main.peek_assist == Vector(0, 0, 0) then
				slot_0_7_0.main.peek_assist = Vector(slot_26_2_0.x, slot_26_2_0.y, slot_26_2_0.z)
			end
		end

		slot_0_3_0.misc.movement.peek_assist.value:GetValue():DisableHotkeys()
	else
		slot_0_5_0.main.peek_assist.argument = false
		slot_0_7_0.main.peek_assist = Vector(0, 0, 0)
		slot_0_5_0.main.peek_assist.retreat = false
		slot_0_5_0.main.peek_assist.grenade_thrown = false
	end

	if slot_0_5_0.grenade_thrown_tick then
		slot_0_5_0.main.peek_assist.grenade_thrown_end = game.globalVars.m_flCurTime + 0.1
		slot_0_5_0.main.peek_assist.grenade_thrown_next = false
		slot_0_5_0.grenade_thrown = false
	elseif game.globalVars.m_flCurTime < slot_0_5_0.main.peek_assist.grenade_thrown_end then
		slot_0_5_0.main.peek_assist.grenade_thrown_next = false
	else
		slot_0_5_0.main.peek_assist.grenade_thrown_next = true
	end

	if slot_0_5_0.main.peek_assist.grenade_thrown_next and not slot_0_5_0.grenade_thrown then
		slot_0_5_0.main.peek_assist.grenade_thrown = true
		slot_0_5_0.grenade_thrown = true
	end

	if slot_0_7_0.main.peek_assist == Vector(0, 0, 0) and not slot_0_5_0.main.peek_assist.retreat then
		if not slot_0_5_0.main.peek_assist.slowwalk then
			slot_0_5_0.main.peek_assist.slowwalk = true

			slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
			slot_0_3_0.misc.movement.slowwalk:GetValue():Set(slot_0_7_0.misc.slowwalk and slot_0_7_0.misc.slowwalk or false)
		end
	else
		slot_0_5_0.main.peek_assist.slowwalk = false
	end

	if slot_0_7_0.main.peek_assist == Vector(0, 0, 0) then
		slot_0_5_0.main.peek_assist.retreat = false
		slot_0_5_0.main.peek_assist.grenade_thrown = false

		return
	end

	slot_26_5_0 = {
		x = slot_0_7_0.main.peek_assist.x,
		y = slot_0_7_0.main.peek_assist.y,
		z = slot_0_7_0.main.peek_assist.z
	}

	if slot_0_3_0.misc.movement.peek_assist.distance:GetValue():Get() < 400 then
		slot_26_6_0 = math.sqrt((slot_26_5_0.x - entities.GetLocalPawn():GetAbsOrigin().x)^2 + (slot_26_5_0.y - entities.GetLocalPawn():GetAbsOrigin().y)^2)

		if slot_26_6_0 > slot_0_3_0.misc.movement.peek_assist.distance:GetValue():Get() then
			slot_0_7_0.main.peek_assist.x = entities.GetLocalPawn():GetAbsOrigin().x + (slot_26_5_0.x - entities.GetLocalPawn():GetAbsOrigin().x) * (slot_0_3_0.misc.movement.peek_assist.distance:GetValue():Get() / slot_26_6_0)
			slot_0_7_0.main.peek_assist.y = entities.GetLocalPawn():GetAbsOrigin().y + (slot_26_5_0.y - entities.GetLocalPawn():GetAbsOrigin().y) * (slot_0_3_0.misc.movement.peek_assist.distance:GetValue():Get() / slot_26_6_0)
			slot_26_7_0 = Ray_t()

			slot_26_7_0:SetHull(Vector(-16, -16, 0), Vector(16, 16, 0))

			slot_26_8_0 = game.physicsQueryInterface:TraceRay(slot_26_7_0, Vector(slot_0_7_0.main.peek_assist.x, slot_0_7_0.main.peek_assist.y, entities.GetLocalPawn():GetAbsOrigin().z + 50), Vector(slot_0_7_0.main.peek_assist.x, slot_0_7_0.main.peek_assist.y, entities.GetLocalPawn():GetAbsOrigin().z - 1000000000))
			slot_0_7_0.main.peek_assist.z = slot_26_8_0 and slot_26_8_0.m_flFraction < 1 and slot_26_8_0.m_vEndPos.z or slot_26_5_0.z
		end
	end

	if entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.REVOLVER then
		if slot_0_5_0.get_revolver_shot(entities.GetLocalPawn()) then
			slot_0_5_0.main.peek_assist.retreat = true
		end
	elseif entities.GetLocalPawn().m_iShotsFired:Get() == 1 or slot_0_5_0.main.peek_assist.grenade_thrown then
		slot_0_5_0.main.peek_assist.retreat = true
	end

	if slot_0_5_0.main.peek_assist.retreat and not slot_0_5_0.main.peek_assist.jumped and not slot_0_3_0.misc.movement.duck_peek_assist:GetValue():Get() and (slot_0_5_0.get_combo_box(slot_0_8_0.peek_assist_jump_on_retreat, {
		"Off",
		"Always on",
		"Only while standing"
	})[1] == "Always on" or slot_0_5_0.get_combo_box(slot_0_8_0.peek_assist_jump_on_retreat, {
		"Off",
		"Always on",
		"Only while standing"
	})[1] == "Only while standing" and slot_0_5_0.get_velocity(entities.GetLocalPawn()) < 10) then
		arg_26_0:SetButton(InputBitMask_t.IN_JUMP)

		slot_0_5_0.main.peek_assist.jumped = true
	end

	if not slot_0_5_0.main.peek_assist.retreat then
		slot_0_5_0.main.peek_assist.jumped = false
	end

	if slot_0_5_0.main.peek_assist.retreat and slot_0_7_0.main.peek_assist ~= Vector(0, 0, 0) then
		if slot_0_5_0.get_velocity(entities.GetLocalPawn()) >= 10 then
			if (arg_26_0:GetButton(InputBitMask_t.IN_JUMP) or bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0) and Vector(entities.GetLocalPawn():GetAbsOrigin().x, entities.GetLocalPawn():GetAbsOrigin().y, 0):dist(Vector(slot_0_7_0.main.peek_assist.x, slot_0_7_0.main.peek_assist.y, 0)) <= 18 then
				slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
				slot_0_3_0.misc.movement.slowwalk:GetValue():Set(true)
			end
		else
			slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
			slot_0_3_0.misc.movement.slowwalk:GetValue():Set(false)
		end

		if Vector(entities.GetLocalPawn():GetAbsOrigin().x, entities.GetLocalPawn():GetAbsOrigin().y, 0):dist(Vector(slot_0_7_0.main.peek_assist.x, slot_0_7_0.main.peek_assist.y, 0)) > ((arg_26_0:GetButton(InputBitMask_t.IN_JUMP) or bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0) and 2 or slot_0_5_0.get_velocity(entities.GetLocalPawn()) > 120 and 14 or slot_0_5_0.get_velocity(entities.GetLocalPawn()) > 80 and 7 or 2) then
			arg_26_0:SetForwardMove(1)
			arg_26_0:SetLeftMove(0)
			arg_26_0:RotateMovement(math.CalcAngle(entities.GetLocalPawn():GetAbsOrigin(), slot_0_7_0.main.peek_assist).y)

			return
		end

		slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
		slot_0_3_0.misc.movement.slowwalk:GetValue():Set(slot_0_7_0.misc.slowwalk and slot_0_7_0.misc.slowwalk or false)

		slot_0_5_0.main.peek_assist.retreat = false
		slot_0_5_0.main.peek_assist.grenade_thrown = false
	end
end

function slot_0_9_0.peek_assist.presentQueue()
	if not entities.GetLocalPawn() then
		return
	end

	if not entities.GetLocalPawn():IsAlive() then
		slot_0_8_0.peek_assist:GetValue():DisableHotkeys()

		return
	end

	local var_27_0 = {
		main = slot_0_5_0.get_animation("peek_assist_presentQueue_alpha_main", slot_0_8_0.peek_assist:GetValue():Get(), 0.07)
	}

	if var_27_0.main > 0 then
		slot_0_5_0.draw_circle(slot_0_7_0.main.peek_assist, 24, draw.Color(slot_0_8_0.peek_assist_color:GetValue():Get():GetR(), slot_0_8_0.peek_assist_color:GetValue():Get():GetG(), slot_0_8_0.peek_assist_color:GetValue():Get():GetB(), slot_0_8_0.peek_assist_color:GetValue():Get():GetA() * var_27_0.main))
	end
end

function slot_0_9_0.autostrafer(arg_28_0)
	local var_28_0 = false

	for iter_28_0, iter_28_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.autostrafer_selection, {
		"Stop on key release"
	})) do
		if iter_28_1 == "Stop on key release" then
			var_28_0 = true
		end
	end

	slot_0_5_0.shutdown.autostrafer.stop_on_key_release = var_28_0

	if slot_0_8_0.autostrafer:GetValue():Get() and var_28_0 and bit.band(entities.GetLocalPawn().m_fFlags:Get(), 1) == 0 and not slot_0_5_0.main.peek_assist.retreat and not slot_0_3_0.misc.movement.peek_assist.value:GetValue():Get() and not arg_28_0:GetButton(InputBitMask_t.IN_MOVELEFT) and not arg_28_0:GetButton(InputBitMask_t.IN_MOVERIGHT) and not arg_28_0:GetButton(InputBitMask_t.IN_FORWARD) and not arg_28_0:GetButton(InputBitMask_t.IN_BACK) and not slot_0_3_0.misc.movement.slowwalk:GetValue():GetHotkeyState() then
		if not slot_0_5_0.main.autostrafer.argument then
			slot_0_5_0.main.autostrafer.argument = true
			slot_0_7_0.misc.slowwalk = slot_0_3_0.misc.movement.slowwalk:GetValue():Get()
		end

		slot_0_3_0.misc.movement.slowwalk:GetValue():Set(true)
	elseif slot_0_5_0.main.autostrafer.argument then
		slot_0_5_0.main.autostrafer.argument = false

		if slot_0_3_0.misc.movement.slowwalk:GetValue():GetHotkeyState() then
			slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
		end

		slot_0_3_0.misc.movement.slowwalk:GetValue():Set(slot_0_7_0.misc.slowwalk and slot_0_7_0.misc.slowwalk or false)
	end
end

function slot_0_9_0.indicators()
	slot_29_0_0 = entities.GetLocalPawn()

	if not slot_29_0_0 or not slot_29_0_0:IsAlive() then
		return
	end

	slot_29_1_0 = slot_29_0_0:GetActiveWeapon()

	if not slot_29_1_0 then
		return
	end

	if not slot_0_5_0.events.buymenu_close or slot_0_5_0.buttons.in_score then
		return
	end

	slot_29_2_0 = {
		min_damage = false,
		jump_on_retreat = false,
		force_shoot = false,
		hit_chance = false
	}

	for iter_29_0, iter_29_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.indicators_selection, {
		"Jump on retreat",
		"Min-damage",
		"Hit-chance",
		"Force shoot"
	})) do
		if iter_29_1 == "Jump on retreat" then
			slot_29_2_0.jump_on_retreat = true
		end

		if iter_29_1 == "Min-damage" then
			slot_29_2_0.min_damage = true
		end

		if iter_29_1 == "Hit-chance" then
			slot_29_2_0.hit_chance = true
		end

		if iter_29_1 == "Force shoot" then
			slot_29_2_0.force_shoot = true
		end
	end

	slot_29_3_0 = {
		second = nil,
		first = nil
	}

	entities.players:for_each(function(arg_30_0)
		if arg_30_0.entity and arg_30_0.entity:IsAlive() and arg_30_0.entity.m_bIsGrabbingHostage:Get() then
			if not slot_29_3_0.first then
				slot_29_3_0.first = arg_30_0.entity
			elseif not slot_29_3_0.second then
				slot_29_3_0.second = arg_30_0.entity
			end
		end
	end)

	slot_0_5_0.visuals.indicators.hostage.entity.first = slot_29_3_0.first
	slot_0_5_0.visuals.indicators.hostage.entity.second = slot_29_3_0.second
	slot_29_4_0 = true
	slot_29_5_0 = {
		main = slot_0_5_0.get_animation("indicators_alpha_main", slot_0_8_0.indicators:GetValue():Get() and slot_0_5_0.events.team_intro_end and slot_29_4_0, 0.1),
		grenade = slot_0_5_0.get_animation("indicators_alpha_grenade", slot_29_1_0:GetType() == 9, 0.1, 1, 0.5),
		planting = slot_0_5_0.get_animation("indicators_alpha_planting", slot_0_5_0.visuals.indicators.bomb.planting.value and slot_0_5_0.visuals.indicators.bomb.planting.timer ~= 0, 0.1),
		planted = slot_0_5_0.get_animation("indicators_alpha_planted", slot_0_5_0.visuals.indicators.bomb.planted.value and math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)) > 0, 0.1),
		exploded = slot_0_5_0.get_animation("indicators_alpha_exploded", slot_0_5_0.visuals.indicators.bomb.planted.value and math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)) == 0, 0.1),
		defusing = slot_0_5_0.get_animation("indicators_alpha_defusing", slot_0_5_0.visuals.indicators.bomb.defusing.value and math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)) > 0, 0.1),
		hostage = slot_0_5_0.get_animation("indicators_alpha_hostage", slot_0_5_0.visuals.indicators.hostage.entity.first or slot_0_5_0.visuals.indicators.hostage.entity.second or slot_0_5_0.visuals.indicators.hostage.follows.value > 0, 0.1),
		jump_on_retreat = slot_0_5_0.get_animation("indicators_alpha_jump_on_retreat", slot_29_2_0.jump_on_retreat and (slot_0_8_0.peek_assist:GetValue():Get() and slot_0_8_0.peek_assist_jump_on_retreat:GetValue():Get() and (slot_0_5_0.get_combo_box(slot_0_8_0.peek_assist_jump_on_retreat, {
			"Off",
			"Always on",
			"Only while standing"
		})[1] == "Only while standing" and slot_0_5_0.get_velocity(slot_29_0_0) < 10 and true or slot_0_5_0.get_combo_box(slot_0_8_0.peek_assist_jump_on_retreat, {
			"Off",
			"Always on",
			"Only while standing"
		})[1] == "Always on" and true) or slot_0_3_0.misc.movement.peek_assist.value:GetValue():Get() and slot_0_3_0.misc.movement.peek_assist.jump_on_retreat:GetValue():Get()), 0.1),
		min_damage = slot_0_5_0.get_animation("indicators_alpha_min_damage", slot_29_2_0.min_damage and slot_0_5_0.weapon_settings.min_damage_path and min_damage ~= 0, 0.1),
		hit_chance = slot_0_5_0.get_animation("indicators_alpha_hit_chance", slot_29_2_0.hit_chance and slot_0_5_0.weapon_settings.hit_chance_path and hit_chance ~= 0, 0.1),
		force_shoot = slot_0_5_0.get_animation("indicators_alpha_force_shoot", slot_29_2_0.force_shoot and slot_0_3_0.rage.overrides.force_shoot:GetValue():Get() and slot_29_1_0:GetType() ~= 0 and slot_29_1_0:GetType() ~= 7 and slot_29_1_0:GetType() ~= 8 and slot_29_1_0:GetType() ~= 9 and slot_29_1_0:GetType() ~= 11, 0.1)
	}

	if slot_29_5_0.main == 0 or slot_0_8_0.indicators_color:GetValue():Get():GetA() == 0 then
		return
	end

	slot_29_6_0, slot_29_7_0 = game.engine:GetScreenSize()
	draw.surface.font = slot_0_2_0.pixel
	slot_29_8_0 = {
		x = function(arg_31_0, arg_31_1)
			if arg_31_1 == nil then
				arg_31_1 = 0
			end

			if type(arg_31_0) == "number" then
				arg_31_0 = arg_31_0 + arg_31_1
			elseif type(arg_31_0) == "string" then
				arg_31_0 = draw.surface.font:GetTextSize(arg_31_0).x + arg_31_1
			end

			return slot_0_5_0.get_animation("indicators_animation_x_" .. arg_31_0, slot_29_0_0.m_bIsScoped:Get(), 0.1, 0, arg_31_0)
		end,
		title = slot_0_5_0.get_animation("indicators_animation_title", not slot_29_0_0.m_bIsScoped:Get() and (slot_0_5_0.interface.title == "Debug" or slot_0_5_0.interface.title == "Alpha"), 0.1, 0, 1),
		planted = slot_0_5_0.get_animation("indicators_animation_planted", not slot_29_0_0.m_bIsScoped:Get() and math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)) < 10, 0.1, 0, 2),
		y = {
			bomb = slot_0_5_0.get_animation("indicators_animation_y_planting", slot_0_5_0.visuals.indicators.bomb.planting.value and slot_0_5_0.visuals.indicators.bomb.planting.timer ~= 0 or slot_0_5_0.visuals.indicators.bomb.planted.value, 0.1, 0, draw.surface.font:GetTextSize("zov").y + 1),
			defusing = slot_0_5_0.get_animation("indicators_animation_y_defusing", slot_0_5_0.visuals.indicators.bomb.defusing.value and math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)) > 0, 0.1, 0, draw.surface.font:GetTextSize("zov").y + 1),
			hostage = slot_0_5_0.get_animation("indicators_animation_y_hostage", slot_0_5_0.visuals.indicators.hostage.entity.first or slot_0_5_0.visuals.indicators.hostage.entity.second or slot_0_5_0.visuals.indicators.hostage.follows.value > 0, 0.1, 0, draw.surface.font:GetTextSize("zov").y + 1),
			min_damage = slot_0_5_0.get_animation("indicators_animation_y_min_damage", slot_29_2_0.min_damage and slot_0_5_0.get_settings(slot_29_1_0:GetDefIndex()) and min_damage ~= 0, 0.1, 0, draw.surface.font:GetTextSize("zov").y + 2),
			hit_chance = slot_0_5_0.get_animation("indicators_animation_y_hit_chance", slot_29_2_0.hit_chance and slot_0_5_0.get_settings(slot_29_1_0:GetDefIndex(), "weapon>hitchance") and hit_chance ~= 0, 0.1, 0, draw.surface.font:GetTextSize("zov").y + 2),
			force_shoot = slot_0_5_0.get_animation("indicators_animation_y_force_shoot", slot_29_2_0.force_shoot and slot_0_3_0.rage.overrides.force_shoot:GetValue():Get() and slot_29_1_0:GetType() ~= 0 and slot_29_1_0:GetType() ~= 7 and slot_29_1_0:GetType() ~= 8 and slot_29_1_0:GetType() ~= 9 and slot_29_1_0:GetType() ~= 11, 0.1, 0, draw.surface.font:GetTextSize("zov").y + 2)
		}
	}

	draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 - (draw.surface.font:GetTextSize("zov").x + 1 + draw.surface.font:GetTextSize(string.lower(slot_0_5_0.interface.title)).x) / 2 + 2 + slot_29_8_0.title + slot_29_8_0.x("zov" .. string.lower(slot_0_5_0.interface.title), 4) / 2, slot_29_7_0 / 1.925), "zov", draw.Color(255, 255, 255, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade))

	slot_29_9_0 = {
		r = slot_0_5_0.get_animation("indicators_m_flVelocityModifier_r", slot_29_0_0.m_flVelocityModifier:Get() ~= 1, 0.1, slot_0_8_0.indicators_color:GetValue():Get():GetR(), 255),
		g = slot_0_5_0.get_animation("indicators_m_flVelocityModifier_g", slot_29_0_0.m_flVelocityModifier:Get() ~= 1, 0.1, slot_0_8_0.indicators_color:GetValue():Get():GetG(), 50),
		b = slot_0_5_0.get_animation("indicators_m_flVelocityModifier_b", slot_29_0_0.m_flVelocityModifier:Get() ~= 1, 0.1, slot_0_8_0.indicators_color:GetValue():Get():GetB(), 80)
	}

	draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 - draw.surface.font:GetTextSize(string.lower(slot_0_5_0.interface.title)).x / 2 + draw.surface.font:GetTextSize("zov").x / 2 + 3 + slot_29_8_0.x("zov" .. string.lower(slot_0_5_0.interface.title), 4) / 2, slot_29_7_0 / 1.925), string.lower(slot_0_5_0.interface.title), draw.Color(slot_29_9_0.r, slot_29_9_0.g, slot_29_9_0.b, math.min(slot_0_8_0.indicators_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.indicators_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.indicators_color:GetValue():Get():GetA()), 255) * slot_29_5_0.main * slot_29_5_0.grenade))

	if slot_29_5_0.planting ~= 0 then
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 - 6 - draw.surface.font:GetTextSize("planting").x / 2 + slot_29_8_0.x("planting0.0s", 2) / 2, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb), "planting", draw.Color(255, 255, 255, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.planting))
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 - 16 + draw.surface.font:GetTextSize("planting").x - draw.surface.font:GetTextSize(string.format("%.1fs", slot_0_5_0.visuals.indicators.bomb.planting.value and math.max(3.125 - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planting.timer), 0) or slot_0_7_0.visuals.bomb.planting.timer)).x / 2 + slot_29_8_0.x("planting0.0s", 3) / 2, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb), string.format("%.1fs", slot_0_5_0.visuals.indicators.bomb.planting.value and math.max(3.125 - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planting.timer), 0) or slot_0_7_0.visuals.bomb.planting.timer), draw.Color(slot_0_8_0.indicators_color:GetValue():Get():GetR(), slot_0_8_0.indicators_color:GetValue():Get():GetG(), slot_0_8_0.indicators_color:GetValue():Get():GetB(), slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.planting))
	end

	if slot_29_5_0.planted ~= 0 then
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 3 - (draw.surface.font:GetTextSize("planted").x + 1 + draw.surface.font:GetTextSize("00.0s").x) / 2 + slot_29_8_0.x("planted", 24) / 2 + slot_29_8_0.planted, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb), "planted", draw.Color(255, 255, 255, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.planted))
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 3 - (draw.surface.font:GetTextSize("planted").x + 1 + draw.surface.font:GetTextSize("00.0s").x) / 2 + draw.surface.font:GetTextSize("planted").x + 1 + slot_29_8_0.x("planted", 24) / 2 + slot_29_8_0.planted, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb), string.format("%.1fs", math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer))), draw.Color(slot_0_8_0.indicators_color:GetValue():Get():GetR(), slot_0_8_0.indicators_color:GetValue():Get():GetG(), slot_0_8_0.indicators_color:GetValue():Get():GetB(), slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.planted))

		if slot_29_5_0.defusing ~= 0 then
			draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 - 6 - draw.surface.font:GetTextSize("defusing").x / 2 + slot_29_8_0.x("defusing0.0s", 2) / 2, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb + slot_29_8_0.y.defusing), "defusing", draw.Color(255, 255, 255, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.planted * slot_29_5_0.defusing))

			slot_29_10_4 = {
				r = slot_0_5_0.get_animation("indicators_defusing_r", math.max(0, slot_0_5_0.visuals.indicators.bomb.defusing.duration - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.defusing.timer)) > math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)), 0.1, slot_0_8_0.indicators_color:GetValue():Get():GetR(), 255),
				g = slot_0_5_0.get_animation("indicators_defusing_g", math.max(0, slot_0_5_0.visuals.indicators.bomb.defusing.duration - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.defusing.timer)) > math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)), 0.1, slot_0_8_0.indicators_color:GetValue():Get():GetG(), 50),
				b = slot_0_5_0.get_animation("indicators_defusing_b", math.max(0, slot_0_5_0.visuals.indicators.bomb.defusing.duration - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.defusing.timer)) > math.max(0, game.cvar:Find("mp_c4timer").value - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planted.timer)), 0.1, slot_0_8_0.indicators_color:GetValue():Get():GetB(), 80)
			}

			draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 - 16 + draw.surface.font:GetTextSize("defusing").x - draw.surface.font:GetTextSize(string.format("%.1fs", math.max(0, slot_0_5_0.visuals.indicators.bomb.defusing.duration - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.defusing.timer)))).x / 2 + slot_29_8_0.x("defusing0.0s", 2) / 2, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb + slot_29_8_0.y.defusing), string.format("%.1fs", math.max(0, slot_0_5_0.visuals.indicators.bomb.defusing.duration - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.defusing.timer))), draw.Color(slot_29_10_4.r, slot_29_10_4.g, slot_29_10_4.b, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.planted * slot_29_5_0.defusing))
		end
	end

	if slot_29_5_0.exploded ~= 0 then
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 3 - draw.surface.font:GetTextSize("planted").x / 2 + slot_29_8_0.x("planted", 1) / 2, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb), "planted", draw.Color(255, 255, 255, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.exploded))
	end

	if slot_29_5_0.hostage ~= 0 then
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 3 - draw.surface.font:GetTextSize("hostage").x / 2 + slot_29_8_0.x("hostage", 1) / 2, slot_29_7_0 / 1.925 + slot_29_8_0.y.bomb + slot_29_8_0.y.defusing + slot_29_8_0.y.hostage), "hostage", draw.Color(255, 255, 255, math.min(slot_0_8_0.indicators_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * ((slot_0_5_0.visuals.indicators.hostage.entity.first or slot_0_5_0.visuals.indicators.hostage.entity.second) and 4.05 or 1.35) % 2 - 1) + (slot_0_8_0.indicators_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.indicators_color:GetValue():Get():GetA()), 255) * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.hostage))
	end

	if slot_29_5_0.jump_on_retreat ~= 0 then
		slot_29_10_3 = {
			r = slot_0_5_0.get_animation("indicators_jump_on_retreat_r", slot_0_5_0.main.peek_assist.retreat or bit.band(slot_29_0_0.m_fFlags:Get(), 1) == 0, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetR()),
			g = slot_0_5_0.get_animation("indicators_jump_on_retreat_g", slot_0_5_0.main.peek_assist.retreat or bit.band(slot_29_0_0.m_fFlags:Get(), 1) == 0, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetG()),
			b = slot_0_5_0.get_animation("indicators_jump_on_retreat_b", slot_0_5_0.main.peek_assist.retreat or bit.band(slot_29_0_0.m_fFlags:Get(), 1) == 0, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetB())
		}

		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 11, slot_29_7_0 / 2 - 14 - slot_29_8_0.y.min_damage - slot_29_8_0.y.hit_chance - slot_29_8_0.y.force_shoot), "jum", draw.Color(slot_29_10_3.r, slot_29_10_3.g, slot_29_10_3.b, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.jump_on_retreat))
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 12 + draw.surface.font:GetTextSize("jum").x, slot_29_7_0 / 2 - 14 - slot_29_8_0.y.min_damage - slot_29_8_0.y.hit_chance - slot_29_8_0.y.force_shoot), "p", draw.Color(slot_29_10_3.r, slot_29_10_3.g, slot_29_10_3.b, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.jump_on_retreat))
	end

	if slot_29_5_0.min_damage ~= 0 then
		slot_29_10_2 = {
			r = slot_0_5_0.get_animation("indicators_min_damage_r", slot_0_5_0.weapon_settings.min_damage_path and gui.ctx:Find(slot_0_5_0.weapon_settings.min_damage_path):GetValue():GetHotkeyState() or not slot_0_5_0.weapon_settings.min_damage_path, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetR()),
			g = slot_0_5_0.get_animation("indicators_min_damage_g", slot_0_5_0.weapon_settings.min_damage_path and gui.ctx:Find(slot_0_5_0.weapon_settings.min_damage_path):GetValue():GetHotkeyState() or not slot_0_5_0.weapon_settings.min_damage_path, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetG()),
			b = slot_0_5_0.get_animation("indicators_min_damage_b", slot_0_5_0.weapon_settings.min_damage_path and gui.ctx:Find(slot_0_5_0.weapon_settings.min_damage_path):GetValue():GetHotkeyState() or not slot_0_5_0.weapon_settings.min_damage_path, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetB())
		}
		slot_0_5_0.visuals.indicators.extra.min_damage = math.lerp(slot_0_5_0.visuals.indicators.extra.min_damage, slot_0_5_0.weapon_settings.min_damage_path and gui.ctx:Find(slot_0_5_0.weapon_settings.min_damage_path):GetValue():Get(), game.globalVars.m_flRenderFrameTime * 25)

		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 11, slot_29_7_0 / 2 - 14 - slot_29_8_0.y.hit_chance - slot_29_8_0.y.force_shoot), "m ", draw.Color(slot_29_10_2.r, slot_29_10_2.g, slot_29_10_2.b, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.min_damage))
		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 7 + draw.surface.font:GetTextSize("m ").x, slot_29_7_0 / 2 - 14 - slot_29_8_0.y.hit_chance - slot_29_8_0.y.force_shoot), string.format("d %.f", slot_0_5_0.visuals.indicators.extra.min_damage), draw.Color(slot_29_10_2.r, slot_29_10_2.g, slot_29_10_2.b, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.min_damage))
	end

	if slot_29_5_0.hit_chance ~= 0 then
		slot_29_10_1 = {
			r = slot_0_5_0.get_animation("indicators_hit_chance_r", slot_0_5_0.weapon_settings.hit_chance_path and gui.ctx:Find(slot_0_5_0.weapon_settings.hit_chance_path):GetValue():GetHotkeyState() or not slot_0_5_0.weapon_settings.hit_chance_path, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetR()),
			g = slot_0_5_0.get_animation("indicators_hit_chance_g", slot_0_5_0.weapon_settings.hit_chance_path and gui.ctx:Find(slot_0_5_0.weapon_settings.hit_chance_path):GetValue():GetHotkeyState() or not slot_0_5_0.weapon_settings.hit_chance_path, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetG()),
			b = slot_0_5_0.get_animation("indicators_hit_chance_b", slot_0_5_0.weapon_settings.hit_chance_path and gui.ctx:Find(slot_0_5_0.weapon_settings.hit_chance_path):GetValue():GetHotkeyState() or not slot_0_5_0.weapon_settings.hit_chance_path, 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetB())
		}
		slot_0_5_0.visuals.indicators.extra.hit_chance = math.lerp(slot_0_5_0.visuals.indicators.extra.hit_chance, slot_0_5_0.weapon_settings.hit_chance_path and gui.ctx:Find(slot_0_5_0.weapon_settings.hit_chance_path):GetValue():Get(), game.globalVars.m_flRenderFrameTime * 25)

		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 11, slot_29_7_0 / 2 - 14 - slot_29_8_0.y.force_shoot), string.format("hc %.f", slot_0_5_0.visuals.indicators.extra.hit_chance), draw.Color(slot_29_10_1.r, slot_29_10_1.g, slot_29_10_1.b, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.hit_chance))
	end

	if slot_29_5_0.force_shoot ~= 0 then
		slot_29_10_0 = {
			r = slot_0_5_0.get_animation("indicators_force_shoot_r", slot_0_5_0.min_inaccuracy[slot_29_1_0:GetDefIndex()] and slot_29_1_0:GetInaccuracy(csweapon_mode.primary_mode) >= slot_0_5_0.min_inaccuracy[slot_29_1_0:GetDefIndex()], 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetR()),
			g = slot_0_5_0.get_animation("indicators_force_shoot_g", slot_0_5_0.min_inaccuracy[slot_29_1_0:GetDefIndex()] and slot_29_1_0:GetInaccuracy(csweapon_mode.primary_mode) >= slot_0_5_0.min_inaccuracy[slot_29_1_0:GetDefIndex()], 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetG()),
			b = slot_0_5_0.get_animation("indicators_force_shoot_b", slot_0_5_0.min_inaccuracy[slot_29_1_0:GetDefIndex()] and slot_29_1_0:GetInaccuracy(csweapon_mode.primary_mode) >= slot_0_5_0.min_inaccuracy[slot_29_1_0:GetDefIndex()], 0.1, 255, slot_0_8_0.indicators_color:GetValue():Get():GetB())
		}

		draw.surface:AddText(draw.Vec2(slot_29_6_0 / 2 + 11, slot_29_7_0 / 2 - 14), "force", draw.Color(slot_29_10_0.r, slot_29_10_0.g, slot_29_10_0.b, slot_0_8_0.indicators_color:GetValue():Get():GetA() * slot_29_5_0.main * slot_29_5_0.grenade * slot_29_5_0.force_shoot))
	end
end

function slot_0_9_0.ui()
	if not game.engine:InGame() then
		return
	end

	slot_32_0_0 = {
		hotkeys = false,
		watermark = false,
		spectators = false
	}

	for iter_32_0, iter_32_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.ui_selection, {
		"Watermark"
	})) do
		if iter_32_1 == "Watermark" then
			slot_32_0_0.watermark = true
		end
	end

	slot_32_1_0 = {
		main = slot_0_5_0.get_animation("ui_alpha_main", slot_0_8_0.ui:GetValue():Get(), 0.1),
		watermark = slot_0_5_0.get_animation("watermark_alpha", slot_32_0_0.watermark, 0.1)
	}
	slot_32_2_0, slot_32_3_0 = game.engine:GetScreenSize()
	draw.surface.font = slot_0_2_0.consolas

	if slot_32_1_0.main == 0 or slot_0_8_0.ui_color:GetValue():Get():GetA() == 0 then
		return
	end

	slot_32_4_0, slot_32_5_0, slot_32_6_0 = slot_0_5_0.get_time()
	slot_32_7_0 = slot_32_4_0 % 12

	if slot_32_7_0 == 0 then
		slot_32_7_0 = 12
	end

	slot_32_8_0 = slot_32_4_0 >= 12 and "pm" or "am"
	slot_32_9_0 = slot_0_5_0.get_ping() > 0 and draw.surface.font:GetTextSize(slot_0_5_0.get_ping() .. " ms  ").x or 0
	slot_32_10_0 = slot_0_5_0.interface.title == "Yaw" and "Stable" or slot_0_5_0.interface.title

	if slot_32_1_0.watermark ~= 0 then
		draw.surface:AddRectFilledMulticolor(draw.Rect(draw.Vec2(slot_32_2_0 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x * 0.55, 2), draw.Vec2(slot_32_2_0 + 10, draw.surface.font.height + 5)), {
			draw.Color(0, 0, 0, (slot_0_8_0.ui_color:GetValue():Get():GetA() >= 150 and 150 or slot_0_8_0.ui_color:GetValue():Get():GetA()) * slot_32_1_0.main * slot_32_1_0.watermark),
			draw.Color(0, 0, 0, 0),
			draw.Color(0, 0, 0, 0),
			draw.Color(0, 0, 0, (slot_0_8_0.ui_color:GetValue():Get():GetA() >= 150 and 150 or slot_0_8_0.ui_color:GetValue():Get():GetA()) * slot_32_1_0.main * slot_32_1_0.watermark)
		})
		draw.surface:AddRectFilledMulticolor(draw.Rect(draw.Vec2(slot_32_2_0 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x * 0.55, 2), draw.Vec2(slot_32_2_0 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x * 1.3, draw.surface.font.height + 5)), {
			draw.Color(0, 0, 0, (slot_0_8_0.ui_color:GetValue():Get():GetA() >= 150 and 150 or slot_0_8_0.ui_color:GetValue():Get():GetA()) * slot_32_1_0.main * slot_32_1_0.watermark),
			draw.Color(0, 0, 0, 0),
			draw.Color(0, 0, 0, 0),
			draw.Color(0, 0, 0, (slot_0_8_0.ui_color:GetValue():Get():GetA() >= 150 and 150 or slot_0_8_0.ui_color:GetValue():Get():GetA()) * slot_32_1_0.main * slot_32_1_0.watermark)
		})
		draw.surface:AddText(draw.Vec2(slot_32_2_0 - 4 - (draw.surface.font.height - 5) - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x, draw.surface.font.height - 10), "zov", draw.Color(255, 255, 255, slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))
		draw.surface:AddText(draw.Vec2(slot_32_2_0 + 4 - draw.surface.font:GetTextSize("yaw").x / 2 - (draw.surface.font.height - 5) - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov").x, draw.surface.font.height - 10), " yaw  ", draw.Color(slot_0_8_0.ui_color:GetValue():Get():GetR(), slot_0_8_0.ui_color:GetValue():Get():GetG(), slot_0_8_0.ui_color:GetValue():Get():GetB(), slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))
		draw.surface:AddText(draw.Vec2(slot_32_2_0 - 15 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov yaw  ").x, draw.surface.font.height - 10), gui.ctx.user.username .. "  ", draw.Color(255, 255, 255, slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))

		slot_32_11_0 = {
			fps_r = slot_0_5_0.get_animation("watermark_fps_r", slot_0_5_0.get_fps() < 100, 0.1, slot_0_8_0.ui_color:GetValue():Get():GetR(), 255),
			fps_g = slot_0_5_0.get_animation("watermark_fps_g", slot_0_5_0.get_fps() < 100, 0.1, slot_0_8_0.ui_color:GetValue():Get():GetG(), 50),
			fps_b = slot_0_5_0.get_animation("watermark_fps_b", slot_0_5_0.get_fps() < 100, 0.1, slot_0_8_0.ui_color:GetValue():Get():GetB(), 80),
			ping_r = slot_0_5_0.get_animation("watermark_ping_r", slot_0_5_0.get_ping() >= 60, 0.1, slot_0_8_0.ui_color:GetValue():Get():GetR(), 255),
			ping_g = slot_0_5_0.get_animation("watermark_ping_g", slot_0_5_0.get_ping() >= 60, 0.1, slot_0_8_0.ui_color:GetValue():Get():GetG(), 50),
			ping_b = slot_0_5_0.get_animation("watermark_ping_b", slot_0_5_0.get_ping() >= 60, 0.1, slot_0_8_0.ui_color:GetValue():Get():GetB(), 80)
		}

		draw.surface:AddText(draw.Vec2(slot_32_2_0 - 15 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov yaw  ").x + draw.surface.font:GetTextSize(gui.ctx.user.username .. "  ").x, draw.surface.font.height - 10), slot_0_5_0.get_fps(), draw.Color(slot_32_11_0.fps_r, slot_32_11_0.fps_g, slot_32_11_0.fps_b, slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))
		draw.surface:AddText(draw.Vec2(slot_32_2_0 - 15 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov yaw  ").x + draw.surface.font:GetTextSize(gui.ctx.user.username .. "  ").x + draw.surface.font:GetTextSize(slot_0_5_0.get_fps()).x, draw.surface.font.height - 10), " fps  ", draw.Color(255, 255, 255, slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))

		if slot_0_5_0.get_ping() > 0 then
			draw.surface:AddText(draw.Vec2(slot_32_2_0 - 15 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov yaw  ").x + draw.surface.font:GetTextSize(gui.ctx.user.username .. "  ").x + draw.surface.font:GetTextSize(slot_0_5_0.get_fps() .. " fps  ").x, draw.surface.font.height - 10), slot_0_5_0.get_ping(), draw.Color(slot_32_11_0.ping_r, slot_32_11_0.ping_g, slot_32_11_0.ping_b, slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))
			draw.surface:AddText(draw.Vec2(slot_32_2_0 - 15 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov yaw  ").x + draw.surface.font:GetTextSize(gui.ctx.user.username .. "  ").x + draw.surface.font:GetTextSize(slot_0_5_0.get_fps() .. " fps  ").x + draw.surface.font:GetTextSize(slot_0_5_0.get_ping()).x, draw.surface.font.height - 10), " ms  ", draw.Color(255, 255, 255, slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))
		end

		draw.surface:AddText(draw.Vec2(slot_32_2_0 - 15 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov yaw  ").x + draw.surface.font:GetTextSize(gui.ctx.user.username .. "  ").x + draw.surface.font:GetTextSize(slot_0_5_0.get_fps() .. " fps  ").x + slot_32_9_0, draw.surface.font.height - 10), string.format("%d:%02d", slot_32_7_0, slot_32_5_0), draw.Color(slot_0_8_0.ui_color:GetValue():Get():GetR(), slot_0_8_0.ui_color:GetValue():Get():GetG(), slot_0_8_0.ui_color:GetValue():Get():GetB(), slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))
		draw.surface:AddText(draw.Vec2(slot_32_2_0 - 15 - draw.surface.font:GetTextSize(string.format("zov yaw  %s  %s fps  %s%d:%02d %s", gui.ctx.user.username, slot_0_5_0.get_fps(), slot_0_5_0.get_ping() > 0 and slot_0_5_0.get_ping() .. " ms  " or "", slot_32_7_0, slot_32_5_0, slot_32_8_0)).x + draw.surface.font:GetTextSize("zov yaw  ").x + draw.surface.font:GetTextSize(gui.ctx.user.username .. "  ").x + draw.surface.font:GetTextSize(slot_0_5_0.get_fps() .. " fps  ").x + slot_32_9_0 + draw.surface.font:GetTextSize(string.format("%d:%02d", slot_32_7_0, slot_32_5_0)).x, draw.surface.font.height - 10), " " .. slot_32_8_0, draw.Color(255, 255, 255, slot_0_8_0.ui_color:GetValue():Get():GetA() * slot_32_1_0.main * slot_32_1_0.watermark))
	end
end

function slot_0_9_0.manuals()
	if not entities.GetLocalPawn() or not entities.GetLocalPawn():IsAlive() then
		return
	end

	slot_33_0_0 = {
		main = slot_0_5_0.get_animation("manuals_alpha_main", slot_0_8_0.manuals:GetValue():Get() and slot_0_5_0.events.buymenu_close and slot_0_5_0.events.team_intro_end and not slot_0_5_0.buttons.in_score, 0.1),
		circle = slot_0_5_0.get_animation("manuals_alpha_circle", slot_0_5_0.get_combo_box(slot_0_8_0.manuals_selection, {
			"Circle",
			"Arrow"
		})[1] == "Circle", 0.1),
		arrow = slot_0_5_0.get_animation("manuals_alpha_arrow", slot_0_5_0.get_combo_box(slot_0_8_0.manuals_selection, {
			"Circle",
			"Arrow"
		})[1] == "Arrow", 0.1),
		override_circle_manual = slot_0_5_0.get_animation("manuals_alpha_override_circle_manual", slot_0_3_0.rage.angles.manual_override.left:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > 30 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < 150 or slot_0_3_0.rage.angles.manual_override.right:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > -150 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < -30 or slot_0_3_0.rage.angles.manual_override.back:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= 150 or slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= -150) or slot_0_3_0.rage.angles.manual_override.forward:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= -30 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= 30, 0.07),
		override_left = slot_0_5_0.get_animation("manuals_alpha_override_left", slot_0_3_0.rage.angles.manual_override.left:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > 30 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < 150, 0.07),
		override_right = slot_0_5_0.get_animation("manuals_alpha_override_right", slot_0_3_0.rage.angles.manual_override.right:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > -150 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < -30, 0.07),
		override_back = slot_0_5_0.get_animation("manuals_alpha_override_back", slot_0_3_0.rage.angles.manual_override.back:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= 150 or slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= -150), 0.07),
		override_forward = slot_0_5_0.get_animation("manuals_alpha_override_forward", slot_0_3_0.rage.angles.manual_override.forward:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= -30 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= 30, 0.07)
	}

	if slot_33_0_0.main == 0 or slot_0_8_0.manuals_color:GetValue():Get():GetA() == 0 then
		return
	end

	slot_33_1_0, slot_33_2_0 = game.engine:GetScreenSize()
	slot_33_3_0 = 166 * (slot_33_1_0 / 1920)
	slot_33_4_0 = 166 * (slot_33_2_0 / 1080)
	slot_33_5_0 = 14 * (slot_33_1_0 / 1920)
	slot_33_6_0 = {
		x = {
			left = slot_0_5_0.get_animation("manuals_animation_circle_x_left", (slot_0_3_0.rage.angles.manual_override.left:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > 30 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < 150) and not slot_0_3_0.rage.angles.manual_override.back:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= 150) and not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= -150)) and not slot_0_3_0.rage.angles.manual_override.forward:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= -30) or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= 30)), 0.13, 0, slot_33_3_0),
			right = slot_0_5_0.get_animation("manuals_animation_circle_x_right", (slot_0_3_0.rage.angles.manual_override.right:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > -150 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < -30) and not slot_0_3_0.rage.angles.manual_override.back:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= 150) and not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= -150)) and not slot_0_3_0.rage.angles.manual_override.forward:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= -30) or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= 30)), 0.13, 0, slot_33_3_0)
		},
		y = {
			back = slot_0_5_0.get_animation("manuals_animation_circle_y_back", slot_0_3_0.rage.angles.manual_override.back:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= 150 or slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= -150) and not slot_0_3_0.rage.angles.manual_override.left:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > 30) or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < 150)) and not slot_0_3_0.rage.angles.manual_override.right:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > -150) or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < -30)), 0.13, 0, slot_33_4_0),
			forward = slot_0_5_0.get_animation("manuals_animation_circle_y_forward", slot_0_3_0.rage.angles.manual_override.forward:GetValue():GetHotkeyState() or slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() >= -30 and slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() <= 30 and not slot_0_3_0.rage.angles.manual_override.left:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > 30) or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < 150)) and not slot_0_3_0.rage.angles.manual_override.right:GetValue():GetHotkeyState() and (not slot_0_3_0.rage.angles.yaw.amount:GetValue():GetHotkeyState() or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() > -150) or not (slot_0_3_0.rage.angles.yaw.amount:GetValue():Get() < -30)), 0.13, 0, slot_33_4_0)
		}
	}

	if slot_33_0_0.override_circle_manual ~= 0 and slot_33_0_0.circle ~= 0 then
		slot_33_7_0 = {
			r = slot_0_5_0.get_animation("manuals_circle_r", slot_33_6_0.x.left * 0.8 ~= 0 and slot_33_6_0.x.left * 0.8 >= slot_33_3_0 * 0.8 or slot_33_6_0.x.right * 0.8 ~= 0 and slot_33_6_0.x.right * 0.8 >= slot_33_3_0 * 0.8 or slot_33_6_0.y.back * 0.8 ~= 0 and slot_33_6_0.y.back * 0.8 >= slot_33_4_0 * 0.8 or slot_33_6_0.y.forward * 0.8 ~= 0 and slot_33_6_0.y.forward * 0.8 >= slot_33_4_0 * 0.8, 0.1, 255, slot_0_8_0.manuals_color:GetValue():Get():GetR()),
			g = slot_0_5_0.get_animation("manuals_circle_g", slot_33_6_0.x.left * 0.8 ~= 0 and slot_33_6_0.x.left * 0.8 >= slot_33_3_0 * 0.8 or slot_33_6_0.x.right * 0.8 ~= 0 and slot_33_6_0.x.right * 0.8 >= slot_33_3_0 * 0.8 or slot_33_6_0.y.back * 0.8 ~= 0 and slot_33_6_0.y.back * 0.8 >= slot_33_4_0 * 0.8 or slot_33_6_0.y.forward * 0.8 ~= 0 and slot_33_6_0.y.forward * 0.8 >= slot_33_4_0 * 0.8, 0.1, 50, slot_0_8_0.manuals_color:GetValue():Get():GetG()),
			b = slot_0_5_0.get_animation("manuals_circle_b", slot_33_6_0.x.left * 0.8 ~= 0 and slot_33_6_0.x.left * 0.8 >= slot_33_3_0 * 0.8 or slot_33_6_0.x.right * 0.8 ~= 0 and slot_33_6_0.x.right * 0.8 >= slot_33_3_0 * 0.8 or slot_33_6_0.y.back * 0.8 ~= 0 and slot_33_6_0.y.back * 0.8 >= slot_33_4_0 * 0.8 or slot_33_6_0.y.forward * 0.8 ~= 0 and slot_33_6_0.y.forward * 0.8 >= slot_33_4_0 * 0.8, 0.1, 80, slot_0_8_0.manuals_color:GetValue():Get():GetB())
		}

		draw.surface:AddCircleFilledMulticolor(draw.Vec2(slot_33_1_0 / 2 - slot_33_6_0.x.left + slot_33_6_0.x.right, slot_33_2_0 / 2 + slot_33_6_0.y.back - slot_33_6_0.y.forward), slot_33_5_0, {
			draw.Color(slot_33_7_0.r, slot_33_7_0.g, slot_33_7_0.b, slot_0_8_0.manuals_color:GetValue():Get():GetA() * slot_33_0_0.main * slot_33_0_0.circle * slot_33_0_0.override_circle_manual),
			draw.Color(slot_33_7_0.r, slot_33_7_0.g, slot_33_7_0.b, 0)
		}, 36, 1)
	end

	if slot_33_0_0.override_left ~= 0 and slot_33_0_0.arrow ~= 0 then
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 50, slot_33_2_0 / 2 - 6), draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 53, slot_33_2_0 / 2 - 0.5), draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 56, slot_33_2_0 / 2 - 0.5), draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 53, slot_33_2_0 / 2 - 6), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_left))
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 53, slot_33_2_0 / 2), draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 50, slot_33_2_0 / 2 + 5.5), draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 53, slot_33_2_0 / 2 + 5.5), draw.Vec2(slot_33_1_0 / 2 - slot_33_3_0 / 6 - 56, slot_33_2_0 / 2), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_left))
	end

	if slot_33_0_0.override_right ~= 0 and slot_33_0_0.arrow ~= 0 then
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 50, slot_33_2_0 / 2 - 6), draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 53, slot_33_2_0 / 2 - 0.5), draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 56, slot_33_2_0 / 2 - 0.5), draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 53, slot_33_2_0 / 2 - 6), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_right))
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 53, slot_33_2_0 / 2), draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 50, slot_33_2_0 / 2 + 5.5), draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 53, slot_33_2_0 / 2 + 5.5), draw.Vec2(slot_33_1_0 / 2 + slot_33_3_0 / 6 + 56, slot_33_2_0 / 2), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_right))
	end

	if slot_33_0_0.override_back ~= 0 and slot_33_0_0.arrow ~= 0 then
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2 - 6, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 50), draw.Vec2(slot_33_1_0 / 2 - 0.5, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 53), draw.Vec2(slot_33_1_0 / 2 - 0.5, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 56), draw.Vec2(slot_33_1_0 / 2 - 6, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 53), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_back))
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 53), draw.Vec2(slot_33_1_0 / 2 + 5.5, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 50), draw.Vec2(slot_33_1_0 / 2 + 5.5, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 53), draw.Vec2(slot_33_1_0 / 2, slot_33_2_0 / 2 + slot_33_4_0 / 6 + 56), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_back))
	end

	if slot_33_0_0.override_forward ~= 0 and slot_33_0_0.arrow ~= 0 then
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2 - 6, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 50), draw.Vec2(slot_33_1_0 / 2 - 0.5, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 53), draw.Vec2(slot_33_1_0 / 2 - 0.5, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 56), draw.Vec2(slot_33_1_0 / 2 - 6, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 53), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_forward))
		draw.surface:AddQuadFilled(draw.Vec2(slot_33_1_0 / 2, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 53), draw.Vec2(slot_33_1_0 / 2 + 5.5, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 50), draw.Vec2(slot_33_1_0 / 2 + 5.5, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 53), draw.Vec2(slot_33_1_0 / 2, slot_33_2_0 / 2 - slot_33_4_0 / 6 - 56), draw.Color(slot_0_8_0.manuals_color:GetValue():Get():GetR(), slot_0_8_0.manuals_color:GetValue():Get():GetG(), slot_0_8_0.manuals_color:GetValue():Get():GetB(), math.min(slot_0_8_0.manuals_color:GetValue():Get():GetA() * math.abs(game.globalVars.m_flCurTime * 1.35 % 2 - 1) + (slot_0_8_0.manuals_color:GetValue():Get():GetA() >= 70 and 70 or slot_0_8_0.manuals_color:GetValue():Get():GetA()), 255) * slot_33_0_0.main * slot_33_0_0.arrow * slot_33_0_0.override_forward))
	end
end

function slot_0_9_0.grenade_prediction()
	local var_34_0 = {
		improve_color = false
	}

	for iter_34_0, iter_34_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.grenade_prediction_selection, {
		"Improve color"
	})) do
		if iter_34_1 == "Improve color" then
			var_34_0.improve_color = true
		end
	end

	slot_0_5_0.shutdown.grenade_prediction.improve_color = var_34_0.improve_color

	if slot_0_8_0.grenade_prediction:GetValue():Get() and var_34_0.improve_color and entities.GetLocalPawn() and entities.GetLocalPawn():IsAlive() and entities.GetLocalPawn():GetActiveWeapon() and (entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.FLASHBANG or entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.SMOKEGRENADE or entities.GetLocalPawn():GetActiveWeapon():GetDefIndex() == EItemDefinitionIndex.DECOY) then
		if not slot_0_5_0.visuals.grenade_prediction.improve_color.argument then
			slot_0_5_0.visuals.grenade_prediction.improve_color.argument = true
			slot_0_7_0.visuals.grenade_prediction.color.hit = slot_0_3_0.visuals.overlays.grenade_prediction.color.hit:GetValue():Get()
		end

		slot_0_3_0.visuals.overlays.grenade_prediction.color.hit:GetValue():Set(slot_0_3_0.visuals.overlays.grenade_prediction.color.miss:GetValue():Get())
	elseif slot_0_5_0.visuals.grenade_prediction.improve_color.argument then
		slot_0_5_0.visuals.grenade_prediction.improve_color.argument = false

		slot_0_3_0.visuals.overlays.grenade_prediction.color.hit:GetValue():Set(slot_0_7_0.visuals.grenade_prediction.color.hit and slot_0_7_0.visuals.grenade_prediction.color.hit or draw.Color("#00ff0078"))
	end
end

function slot_0_9_0.enemy_esp_info()
	if not entities.GetLocalPawn() then
		return
	end

	local var_35_0 = {
		hostage = false,
		slowed_down = false
	}

	for iter_35_0, iter_35_1 in ipairs(slot_0_5_0.get_combo_box(slot_0_8_0.enemy_esp_info_selection, {
		"Hostage",
		"Slowed down"
	})) do
		if iter_35_1 == "Hostage" then
			var_35_0.hostage = true
		end

		if iter_35_1 == "Slowed down" then
			var_35_0.slowed_down = true
		end
	end

	local var_35_1 = {
		main = slot_0_5_0.get_animation("enemy_esp_info_alpha_main", slot_0_8_0.enemy_esp_info:GetValue():Get(), 0.1),
		hostage = slot_0_5_0.get_animation("enemy_esp_info_alpha_hostage", var_35_0.hostage, 0.1),
		slowed_down = slot_0_5_0.get_animation("enemy_esp_info_alpha_slowed_down", var_35_0.slowed_down, 0.1)
	}

	if var_35_1.main == 0 then
		return
	end

	draw.surface.font = slot_0_2_0.pixel

	entities.players:for_each(function(arg_36_0)
		if not arg_36_0.entity or not arg_36_0.entity:IsEnemy() or not arg_36_0.entity:IsAlive() then
			return
		end

		slot_36_1_0 = arg_36_0.entity:GetAbsOrigin()
		slot_36_2_0 = entities.GetLocalPawn():GetEyePos():dist(slot_36_1_0)
		slot_36_3_0 = math.WorldToScreen(Vector(slot_36_1_0.x, slot_36_1_0.y, slot_36_1_0.z + arg_36_0.entity:GetViewOffset().z + 10 + slot_36_2_0 / 30))

		if not slot_36_3_0 then
			return
		end

		slot_36_4_0 = false
		slot_36_5_0 = draw.Vec2(slot_36_3_0.x, slot_36_3_0.y)

		if var_35_1.hostage ~= 0 then
			slot_36_6_1 = nil

			if arg_36_0.entity:GetName() == slot_0_5_0.visuals.indicators.hostage.follows.name.first or arg_36_0.entity:GetName() == slot_0_5_0.visuals.indicators.hostage.follows.name.second then
				slot_36_6_1 = "hostage"
				slot_36_4_0 = true
			end

			if slot_36_6_1 then
				slot_36_7_0 = draw.Vec2(slot_36_3_0.x, slot_36_3_0.y)
				slot_36_7_0.x = slot_36_7_0.x - draw.surface.font:GetTextSize(slot_36_6_1).x / 2

				draw.surface:AddText(slot_36_7_0, slot_36_6_1, draw.Color(251, 47, 62, 255 * var_35_1.main * var_35_1.hostage))
			end
		end

		if var_35_1.slowed_down ~= 0 and arg_36_0.entity.m_flVelocityModifier:Get() ~= 1 then
			if slot_36_4_0 then
				slot_36_5_0.y = slot_36_5_0.y - (draw.surface.font:GetTextSize("slowed").y + 2)
			end

			slot_36_5_0.x = slot_36_5_0.x - draw.surface.font:GetTextSize("slowed").x / 2
			slot_36_6_0 = {
				r = 218 + -97 * (1 - arg_36_0.entity.m_flVelocityModifier:Get()),
				g = 121 + 36 * (1 - arg_36_0.entity.m_flVelocityModifier:Get()),
				b = 48 + -35 * (1 - arg_36_0.entity.m_flVelocityModifier:Get())
			}

			draw.surface:AddText(slot_36_5_0, "slow", draw.Color(math.floor(slot_36_6_0.r), math.floor(slot_36_6_0.g), math.floor(slot_36_6_0.b), 255 * var_35_1.main * var_35_1.slowed_down))
			draw.surface:AddText(draw.Vec2(slot_36_5_0.x + draw.surface.font:GetTextSize("slow").x + 1, slot_36_5_0.y), "ed", draw.Color(math.floor(slot_36_6_0.r), math.floor(slot_36_6_0.g), math.floor(slot_36_6_0.b), 255 * var_35_1.main * var_35_1.slowed_down))
		end
	end)
end

slot_0_8_0.latency_brute:AddCallback(function()
	if game.engine:GetNetChan() and not game.engine:GetNetChan():IsNull() then
		slot_0_5_0.latency.value = slot_0_8_0.latency:GetValue():Get()
		slot_0_5_0.latency.address = game.engine:GetNetChan():GetAddress()
		slot_0_5_0.latency.state = 1
	else
		if not utils.ClipboardGet() then
			return
		end

		if utils.ClipboardGet():match("%d+%.%d+%.%d+%.%d+:%d+") then
			game.engine:ClientCmd("connect " .. utils.ClipboardGet():match("%d+%.%d+%.%d+%.%d+:%d+"))
		end
	end
end)
slot_0_8_0.latency_stop:AddCallback(function()
	slot_0_5_0.latency.state = 0

	if (not game.engine:GetNetChan() or game.engine:GetNetChan():IsNull()) and slot_0_5_0.latency.address then
		game.engine:ClientCmd("connect " .. slot_0_5_0.latency.address)
	end
end)

function slot_0_9_0.latency()
	if slot_0_5_0.latency.state == 0 then
		return
	else
		for iter_39_0 = 1, 29 do
			if slot_0_5_0.latency.state == iter_39_0 then
				if iter_39_0 % 2 == 1 then
					if game.engine:GetNetChan() and not game.engine:GetNetChan():IsNull() and math.floor(game.engine:GetNetChan():GetLatency() * 1000) <= slot_0_5_0.latency.value then
						slot_0_5_0.latency.state = 0

						return
					elseif game.engine:GetNetChan() and not game.engine:GetNetChan():IsNull() and math.floor(game.engine:GetNetChan():GetLatency() * 1000) > slot_0_5_0.latency.value then
						game.engine:ClientCmd("disconnect")
					end

					slot_0_5_0.latency.state = game.engine:GetNetChan() and game.engine:GetNetChan():IsNull() and iter_39_0 + 1 or iter_39_0

					break
				end

				if game.engine:GetNetChan() and game.engine:GetNetChan():IsNull() and slot_0_5_0.latency.address then
					game.engine:ClientCmd("connect " .. slot_0_5_0.latency.address)
				end

				slot_0_5_0.latency.state = game.engine:GetNetChan() and not game.engine:GetNetChan():IsNull() and iter_39_0 + 1 or iter_39_0

				break
			end
		end

		if slot_0_5_0.latency.state == 30 then
			if game.engine:GetNetChan() and game.engine:GetNetChan():IsNull() and slot_0_5_0.latency.address then
				game.engine:ClientCmd("connect " .. slot_0_5_0.latency.address)
			end

			slot_0_5_0.latency.state = 0

			return
		end
	end
end

function slot_0_9_0.latency_auto_connect()
	if not slot_0_8_0.latency_auto_connect:GetValue():Get() then
		return
	end

	if not utils.ClipboardGet() then
		return
	end

	if not utils.ClipboardGet():match("%d+%.%d+%.%d+%.%d+:%d+") then
		return
	end

	if game.engine:GetNetChan() and not game.engine:GetNetChan():IsNull() then
		if utils.ClipboardGet():match("%d+%.%d+%.%d+%.%d+:%d+") ~= game.engine:GetNetChan():GetAddress() then
			game.engine:ClientCmd("connect " .. utils.ClipboardGet():match("%d+%.%d+%.%d+%.%d+:%d+"))
			utils.ClipboardSet("")
		end
	else
		game.engine:ClientCmd("connect " .. utils.ClipboardGet():match("%d+%.%d+%.%d+%.%d+:%d+"))
		utils.ClipboardSet("")
	end
end

mods.events:AddListener("player_connect_full")
mods.events:AddListener("bomb_begindefuse")
mods.events:AddListener("bomb_abortdefuse")
mods.events:AddListener("round_end")
mods.events:AddListener("buymenu_open")
mods.events:AddListener("buymenu_close")
mods.events:AddListener("team_intro_start")
mods.events:AddListener("team_intro_end")
mods.events:AddListener("hostage_follows")
mods.events:AddListener("hostage_rescued")
mods.events:AddListener("player_death")
mods.events:AddListener("round_freeze_end")
events.presentQueue:Add(function()
	slot_41_0_0 = slot_0_5_0.get_combo_box(slot_0_8_0.tab_selection, {
		"Main",
		"Visuals",
		"Latency"
	})[1]
	slot_0_5_0.interface.name = slot_41_0_0
	slot_41_1_0 = {
		Main = {
			{
				name = "Disable angles",
				reference = slot_0_8_0.disable_angles
			},
			{
				reference = slot_0_8_0.disable_angles_selection
			},
			{
				name = "Extensions",
				reference = slot_0_8_0.extensions
			},
			{
				reference = slot_0_8_0.extensions_selection
			},
			{
				name = "Suppressions",
				reference = slot_0_8_0.suppressions
			},
			{
				reference = slot_0_8_0.suppressions_selection
			},
			{
				name = "Improvements",
				reference = slot_0_8_0.improvements
			},
			{
				reference = slot_0_8_0.improvements_selection
			},
			{
				name = "Drop grenades",
				reference = slot_0_8_0.drop_grenades
			},
			{
				reference = slot_0_8_0.drop_grenades_selection
			},
			{
				name = "Peek assist",
				reference = slot_0_8_0.peek_assist
			},
			{
				reference = slot_0_8_0.peek_assist_jump_on_retreat
			},
			{
				reference = slot_0_8_0.peek_assist_color
			},
			{
				name = "Autostrafer",
				reference = slot_0_8_0.autostrafer
			},
			{
				reference = slot_0_8_0.autostrafer_selection
			}
		},
		Visuals = {
			{
				name = "Indicators",
				reference = slot_0_8_0.indicators
			},
			{
				reference = slot_0_8_0.indicators_selection
			},
			{
				reference = slot_0_8_0.indicators_color
			},
			{
				name = "Interface",
				reference = slot_0_8_0.ui
			},
			{
				reference = slot_0_8_0.ui_selection
			},
			{
				reference = slot_0_8_0.ui_color
			},
			{
				name = "Manuals",
				reference = slot_0_8_0.manuals
			},
			{
				reference = slot_0_8_0.manuals_selection
			},
			{
				reference = slot_0_8_0.manuals_color
			},
			{
				name = "Grenade prediction",
				reference = slot_0_8_0.grenade_prediction
			},
			{
				reference = slot_0_8_0.grenade_prediction_selection
			},
			{
				name = "Enemy ESP info",
				reference = slot_0_8_0.enemy_esp_info
			},
			{
				reference = slot_0_8_0.enemy_esp_info_selection
			}
		},
		Latency = {
			{
				name = "Latency",
				reference = slot_0_8_0.latency
			},
			{
				reference = slot_0_8_0.latency_auto_connect
			},
			{
				reference = slot_0_8_0.latency_stop
			},
			{
				reference = slot_0_8_0.latency_brute
			}
		}
	}

	if gui.is_visible() and slot_41_0_0 ~= slot_0_5_0.interface.argument then
		slot_0_5_0.interface.argument = slot_41_0_0

		for iter_41_0, iter_41_1 in pairs(slot_41_1_0) do
			for iter_41_2, iter_41_3 in ipairs(iter_41_1) do
				slot_0_8_0.group:Remove(gui.MakeControl(iter_41_3.name, iter_41_3.reference))
			end
		end

		slot_0_8_0.group:Reset()

		if slot_41_1_0[slot_41_0_0] then
			for iter_41_4, iter_41_5 in ipairs(slot_41_1_0[slot_41_0_0]) do
				slot_41_7_0 = gui.MakeControl(iter_41_5.name, iter_41_5.reference)

				if iter_41_5.tooltip then
					slot_41_7_0.tooltip = iter_41_5.tooltip
				end

				slot_41_8_0 = {
					[slot_0_8_0.disable_angles] = {
						store = "disable_angles_control",
						group = "group"
					},
					[slot_0_8_0.disable_angles_selection] = {
						parent = "disable_angles_control"
					},
					[slot_0_8_0.extensions] = {
						store = "extensions_control",
						group = "group"
					},
					[slot_0_8_0.extensions_selection] = {
						parent = "extensions_control"
					},
					[slot_0_8_0.suppressions] = {
						store = "suppressions_control",
						group = "group"
					},
					[slot_0_8_0.suppressions_selection] = {
						parent = "suppressions_control"
					},
					[slot_0_8_0.improvements] = {
						store = "improvements_control",
						group = "group"
					},
					[slot_0_8_0.improvements_selection] = {
						parent = "improvements_control"
					},
					[slot_0_8_0.drop_grenades] = {
						store = "drop_grenades_control",
						group = "group"
					},
					[slot_0_8_0.drop_grenades_selection] = {
						parent = "drop_grenades_control"
					},
					[slot_0_8_0.peek_assist] = {
						store = "peek_assist_control",
						group = "group"
					},
					[slot_0_8_0.peek_assist_jump_on_retreat] = {
						store = "peek_assist_jump_on_retreat_control",
						parent = "peek_assist_control"
					},
					[slot_0_8_0.peek_assist_color] = {
						parent = "peek_assist_jump_on_retreat_control"
					},
					[slot_0_8_0.autostrafer] = {
						store = "autostrafer_control",
						group = "group"
					},
					[slot_0_8_0.autostrafer_selection] = {
						parent = "autostrafer_control"
					},
					[slot_0_8_0.indicators] = {
						store = "indicators_control",
						group = "group"
					},
					[slot_0_8_0.indicators_selection] = {
						store = "indicators_selection_control",
						parent = "indicators_control"
					},
					[slot_0_8_0.indicators_color] = {
						parent = "indicators_selection_control"
					},
					[slot_0_8_0.ui] = {
						store = "ui_control",
						group = "group"
					},
					[slot_0_8_0.ui_selection] = {
						store = "ui_selection_control",
						parent = "ui_control"
					},
					[slot_0_8_0.ui_color] = {
						parent = "ui_selection_control"
					},
					[slot_0_8_0.manuals] = {
						store = "manuals_control",
						group = "group"
					},
					[slot_0_8_0.manuals_selection] = {
						store = "manuals_selection_control",
						parent = "manuals_control"
					},
					[slot_0_8_0.manuals_color] = {
						parent = "manuals_selection_control"
					},
					[slot_0_8_0.grenade_prediction] = {
						store = "grenade_prediction_control",
						group = "group"
					},
					[slot_0_8_0.grenade_prediction_selection] = {
						parent = "grenade_prediction_control"
					},
					[slot_0_8_0.enemy_esp_info] = {
						store = "enemy_esp_info_control",
						group = "group"
					},
					[slot_0_8_0.enemy_esp_info_selection] = {
						parent = "enemy_esp_info_control"
					},
					[slot_0_8_0.latency] = {
						store = "latency_control",
						group = "group"
					},
					[slot_0_8_0.latency_auto_connect] = {
						parent = "latency_control"
					},
					[slot_0_8_0.latency_stop] = {
						store = "latency_stop_control",
						group = "group"
					},
					[slot_0_8_0.latency_brute] = {
						parent = "latency_stop_control"
					}
				}

				if slot_41_8_0[iter_41_5.reference] then
					if slot_41_8_0[iter_41_5.reference].group and slot_0_8_0[slot_41_8_0[iter_41_5.reference].group] then
						slot_0_8_0[slot_41_8_0[iter_41_5.reference].group]:Add(slot_41_7_0)
					elseif slot_41_8_0[iter_41_5.reference].parent and slot_0_8_0[slot_41_8_0[iter_41_5.reference].parent] then
						slot_0_8_0[slot_41_8_0[iter_41_5.reference].parent]:Add(slot_41_7_0)
					end

					if slot_41_8_0[iter_41_5.reference].store then
						slot_0_8_0[slot_41_8_0[iter_41_5.reference].store] = slot_41_7_0
					end
				else
					slot_0_8_0.group:Add(slot_41_7_0)
				end

				slot_0_8_0.group:Reset()
			end
		end
	end

	slot_0_8_0.update()
	slot_0_5_0.update_settings()
	slot_0_9_0.extensions.presentQueue()
	slot_0_9_0.improvements.presentQueue()
	slot_0_9_0.peek_assist.presentQueue()
	slot_0_9_0.indicators()
	slot_0_9_0.ui()
	slot_0_9_0.manuals()
	slot_0_9_0.grenade_prediction()
	slot_0_9_0.enemy_esp_info()
	slot_0_9_0.latency()
	slot_0_9_0.latency_auto_connect()
end)
events.createMove:Add(function(arg_42_0)
	slot_0_9_0.disable_angles(arg_42_0)
	slot_0_9_0.extensions.createMove(arg_42_0)
	slot_0_9_0.suppressions(arg_42_0)
	slot_0_9_0.improvements.createMove(arg_42_0)
	slot_0_9_0.peek_assist.createMove(arg_42_0)
	slot_0_9_0.autostrafer(arg_42_0)

	if slot_0_5_0.grenade_thrown_tick then
		slot_0_5_0.grenade_thrown_end = game.globalVars.m_flCurTime + 0.08
		slot_0_5_0.events.grenade_thrown = false
	elseif game.globalVars.m_flCurTime < slot_0_5_0.grenade_thrown_end then
		slot_0_5_0.events.grenade_thrown = false
	else
		slot_0_5_0.events.grenade_thrown = true
	end

	slot_0_5_0.buttons.in_score = arg_42_0:GetButton(InputBitMask_t.IN_SCORE)

	if slot_0_4_0:Get(entities.GetLocalPawn(), "m_MoveType", "uint8_t*") == 9 then
		slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
	end
end)
events.renderStartPost:Add(function()
	slot_0_9_0.drop_grenades()
end)
events.event:Add(function(arg_44_0)
	if arg_44_0:GetName() == "player_connect_full" then
		if arg_44_0:GetPawnFromId("userid") ~= entities.GetLocalPawn() then
			return
		end

		slot_0_5_0.main.disable_angles.round_end.value = false
		slot_0_5_0.events.round_freeze_end = true

		for iter_44_0, iter_44_1 in pairs(slot_0_5_0.animation) do
			if type(iter_44_1) == "table" then
				iter_44_1.value = 0
				iter_44_1.start = 0
				iter_44_1.state = false
			end
		end

		slot_0_5_0.events.buymenu_close = true
		slot_0_5_0.events.team_intro_end = true
		slot_0_5_0.visuals.indicators.bomb.planted.value = false
		slot_0_5_0.visuals.indicators.bomb.planted.timer = 0
		slot_0_5_0.visuals.indicators.bomb.planting.value = false
		slot_0_5_0.visuals.indicators.bomb.planting.timer = 0
		slot_0_5_0.visuals.indicators.bomb.defusing.value = false
		slot_0_7_0.visuals.bomb.planting.timer = 0
		slot_0_5_0.visuals.indicators.hostage.follows.value = 0
		slot_0_5_0.main.improvements.quick_switch.grenade_thrown_end = 0
		slot_0_5_0.grenade_thrown_end = 0
		slot_0_5_0.main.peek_assist.grenade_thrown_end = 0
		slot_0_5_0.visuals.interface.watermark.fps.last_update = 0
		slot_0_5_0.visuals.interface.watermark.latency.last_update = 0
		slot_0_5_0.pulse_active = 0
		slot_0_5_0.visuals.indicators.hostage.follows.name.first = nil
		slot_0_5_0.visuals.indicators.hostage.follows.name.second = nil
	end

	if arg_44_0:GetName() == "game_newmap" or arg_44_0:GetName() == "map_shutdown" then
		slot_0_5_0.main.disable_angles.round_end.value = false
		slot_0_5_0.events.round_freeze_end = true
		slot_0_5_0.main.disable_angles.freeze_time.value = game.globalVars.m_flCurTime
		slot_0_5_0.main.disable_angles.freeze_time.timeout = false

		for iter_44_2, iter_44_3 in pairs(slot_0_5_0.animation) do
			if type(iter_44_3) == "table" then
				iter_44_3.value = 0
				iter_44_3.start = 0
				iter_44_3.state = false
			end
		end

		slot_0_5_0.events.buymenu_close = true
		slot_0_5_0.events.team_intro_end = true
		slot_0_5_0.visuals.indicators.bomb.planted.value = false
		slot_0_5_0.visuals.indicators.bomb.planted.timer = 0
		slot_0_5_0.visuals.indicators.bomb.planting.value = false
		slot_0_5_0.visuals.indicators.bomb.planting.timer = 0
		slot_0_5_0.visuals.indicators.bomb.defusing.value = false
		slot_0_7_0.visuals.bomb.planting.timer = 0
		slot_0_5_0.visuals.indicators.hostage.follows.value = 0
		slot_0_5_0.main.improvements.quick_switch.grenade_thrown_end = 0
		slot_0_5_0.grenade_thrown_end = 0
		slot_0_5_0.main.peek_assist.grenade_thrown_end = 0
		slot_0_5_0.visuals.interface.watermark.fps.last_update = 0
		slot_0_5_0.visuals.interface.watermark.latency.last_update = 0
		slot_0_5_0.pulse_active = 0
		slot_0_5_0.visuals.indicators.hostage.follows.name.first = nil
		slot_0_5_0.visuals.indicators.hostage.follows.name.second = nil
	end

	if arg_44_0:GetName() == "round_start" then
		slot_0_5_0.main.disable_angles.round_end.value = false
		slot_0_5_0.events.round_freeze_end = false
		slot_0_5_0.main.disable_angles.freeze_time.value = game.globalVars.m_flCurTime
		slot_0_5_0.main.disable_angles.freeze_time.timeout = false

		slot_0_8_0.peek_assist:GetValue():DisableHotkeys()

		slot_0_5_0.visuals.indicators.bomb.planted.value = false
		slot_0_5_0.visuals.indicators.bomb.planted.timer = 0
		slot_0_5_0.visuals.indicators.bomb.planting.value = false
		slot_0_5_0.visuals.indicators.bomb.planting.timer = 0
		slot_0_5_0.visuals.indicators.bomb.defusing.value = false
		slot_0_7_0.visuals.bomb.planting.timer = 0
		slot_0_5_0.visuals.indicators.hostage.follows.value = 0
		slot_0_5_0.visuals.interface.watermark.fps.last_update = 0
		slot_0_5_0.visuals.interface.watermark.latency.last_update = 0
		slot_0_5_0.pulse_active = 0
		slot_0_5_0.visuals.indicators.hostage.follows.name.first = nil
		slot_0_5_0.visuals.indicators.hostage.follows.name.second = nil
	end

	if arg_44_0:GetName() == "round_freeze_end" then
		slot_0_5_0.events.round_freeze_end = true
	end

	if arg_44_0:GetName() == "round_end" then
		slot_0_5_0.main.disable_angles.round_end.value = true
	end

	if arg_44_0:GetName() == "buymenu_open" then
		slot_0_5_0.events.buymenu_close = false
	elseif arg_44_0:GetName() == "buymenu_close" then
		slot_0_5_0.events.buymenu_close = true
	end

	if arg_44_0:GetName() == "team_intro_start" then
		slot_0_5_0.events.team_intro_end = false
	elseif arg_44_0:GetName() == "team_intro_end" then
		slot_0_5_0.events.team_intro_end = true
	end

	if arg_44_0:GetName() == "bomb_beginplant" then
		slot_0_5_0.visuals.indicators.bomb.planting.value = true
		slot_0_5_0.visuals.indicators.bomb.planting.timer = game.globalVars.m_flCurTime
		slot_0_7_0.visuals.bomb.planting.timer = 0
	elseif arg_44_0:GetName() == "bomb_abortplant" then
		slot_0_7_0.visuals.bomb.planting.timer = math.max(0, 3.125 - (game.globalVars.m_flCurTime - slot_0_5_0.visuals.indicators.bomb.planting.timer))
		slot_0_5_0.visuals.indicators.bomb.planting.value = false
		slot_0_5_0.visuals.indicators.bomb.planting.timer = 0
	elseif arg_44_0:GetName() == "bomb_planted" then
		slot_0_5_0.visuals.indicators.bomb.planted.value = true
		slot_0_5_0.visuals.indicators.bomb.planting.timer = 0
		slot_0_5_0.visuals.indicators.bomb.planted.timer = game.globalVars.m_flCurTime
		slot_0_7_0.visuals.bomb.planting.timer = 0
	elseif arg_44_0:GetName() == "bomb_defused" then
		slot_0_5_0.visuals.indicators.bomb.planted.value = false
		slot_0_5_0.visuals.indicators.bomb.planted.timer = 0
	elseif arg_44_0:GetName() == "bomb_exploded" then
		slot_0_5_0.visuals.indicators.bomb.planted.value = false
		slot_0_5_0.visuals.indicators.bomb.planted.timer = 0
	end

	if arg_44_0:GetName() == "bomb_begindefuse" then
		slot_0_5_0.visuals.indicators.bomb.defusing.value = true
		slot_0_5_0.visuals.indicators.bomb.defusing.timer = game.globalVars.m_flCurTime
		slot_0_5_0.visuals.indicators.bomb.defusing.duration = arg_44_0:GetBool("haskit") and 5.015 or 10.015
	elseif arg_44_0:GetName() == "bomb_abortdefuse" then
		slot_0_5_0.visuals.indicators.bomb.defusing.value = false
	end

	if arg_44_0:GetName() == "hostage_follows" then
		slot_0_5_0.visuals.indicators.hostage.follows.value = slot_0_5_0.visuals.indicators.hostage.follows.value + 1

		if slot_0_5_0.visuals.indicators.hostage.follows.value == 0 then
			if arg_44_0:GetPawnFromId("userid") then
				slot_0_5_0.visuals.indicators.hostage.follows.userid.first = arg_44_0:GetPawnFromId("userid")
				slot_0_5_0.visuals.indicators.hostage.follows.name.first = slot_0_5_0.visuals.indicators.hostage.follows.userid.first:GetName()
			end
		elseif slot_0_5_0.visuals.indicators.hostage.follows.value == 1 and arg_44_0:GetPawnFromId("userid") then
			slot_0_5_0.visuals.indicators.hostage.follows.userid.second = arg_44_0:GetPawnFromId("userid")
			slot_0_5_0.visuals.indicators.hostage.follows.name.second = slot_0_5_0.visuals.indicators.hostage.follows.userid.second:GetName()
		end
	elseif arg_44_0:GetName() == "hostage_rescued" then
		slot_0_5_0.visuals.indicators.hostage.follows.value = 0
	end

	if arg_44_0:GetName() == "player_death" and arg_44_0:GetPawnFromId("userid") and (arg_44_0:GetPawnFromId("userid") == slot_0_5_0.visuals.indicators.hostage.follows.userid.first or arg_44_0:GetPawnFromId("userid") == slot_0_5_0.visuals.indicators.hostage.follows.userid.second) then
		slot_0_5_0.visuals.indicators.hostage.follows.value = slot_0_5_0.visuals.indicators.hostage.follows.value - 1
	end
end)

function __shutdown()
	slot_0_2_0.consolas:Destroy()
	slot_0_2_0.pixel:Destroy()

	if slot_0_8_0.disable_angles:GetValue():Get() then
		if slot_0_5_0.shutdown.disable_angles.round_end then
			slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
		end

		if slot_0_5_0.shutdown.disable_angles.safe_situation then
			slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
			slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.pitch.value, {
				"None",
				"Down",
				"Up",
				"Zero",
				"Custom"
			}, slot_0_7_0.rage.angles.pitch and slot_0_7_0.rage.angles.pitch or "Down")
			slot_0_3_0.rage.angles.spin.value:GetValue():Set(slot_0_7_0.rage.angles.spin.value and slot_0_7_0.rage.angles.spin.value or false)
			slot_0_3_0.rage.angles.spin.amount:GetValue():Set(slot_0_7_0.rage.angles.spin.amount and slot_0_7_0.rage.angles.spin.amount or 20)
		end

		if slot_0_5_0.shutdown.disable_angles.warmup then
			slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
		end

		if slot_0_5_0.shutdown.disable_angles.freeze_time then
			slot_0_3_0.rage.angles.enabled:GetValue():Set(slot_0_7_0.rage.angles.enabled and slot_0_7_0.rage.angles.enabled or true)
		end
	end

	if slot_0_8_0.extensions:GetValue():Get() then
		if slot_0_5_0.shutdown.extensions.jump_scout then
			slot_0_3_0.rage.overrides.force_shoot:GetValue():DisableHotkeys()
			slot_0_3_0.rage.overrides.force_shoot:GetValue():Set(slot_0_7_0.rage.overrides.force_shoot and slot_0_7_0.rage.overrides.force_shoot or false)
		end

		if slot_0_5_0.shutdown.extensions.no_fall_damage and entities.GetLocalPawn() and entities.GetLocalPawn():GetAbsVelocity().z < -575 and not slot_0_3_0.misc.movement.jumpbug:GetValue():Get() then
			slot_0_3_0.misc.movement.jumpbug:GetValue():Set(slot_0_7_0.misc.jumpbug and slot_0_7_0.misc.jumpbug or true)
		end

		if slot_0_5_0.shutdown.extensions.doubletap_on_knife then
			slot_0_3_0.rage.aimbot.doubletap:GetValue():Set(slot_0_7_0.rage.aimbot.doubletap and slot_0_7_0.rage.aimbot.doubletap or true)
		end

		if slot_0_5_0.shutdown.extensions.opposite_knife_hand and entities.GetLocalPawn() and entities.GetLocalPawn():IsAlive() and entities.GetLocalPawn():GetActiveWeapon() and entities.GetLocalPawn():GetActiveWeapon():GetType() == 0 then
			game.engine:ClientCmd(slot_0_7_0.main.left_handed and "switchhandsleft" or "switchhandsright")
		end
	end

	if slot_0_8_0.suppressions:GetValue():Get() and slot_0_5_0.shutdown.suppressions.rotation_animation then
		slot_0_5_0.set_combo_box(slot_0_3_0.rage.angles.yaw.jitter.value, {
			"None",
			"Center",
			"Offset"
		}, slot_0_7_0.rage.angles.yaw_jitter.value and slot_0_7_0.rage.angles.yaw_jitter.value or "None")
		slot_0_3_0.rage.angles.yaw.jitter.amount:GetValue():Set(slot_0_7_0.rage.angles.yaw_jitter.amount and slot_0_7_0.rage.angles.yaw_jitter.amount or 0)
		slot_0_3_0.rage.angles.yaw.jitter.three_way:GetValue():Set(slot_0_7_0.rage.angles.yaw_jitter.three_way and slot_0_7_0.rage.angles.yaw_jitter.three_way or false)

		slot_45_0_0 = slot_0_3_0.rage.angles.yaw.jitter.disablers:GetValue():Get()

		slot_45_0_0:set_raw(slot_0_7_0.rage.angles.yaw_jitter.disablers and slot_0_7_0.rage.angles.yaw_jitter.disablers or 0)
		slot_0_3_0.rage.angles.yaw.jitter.disablers:GetValue():Set(slot_45_0_0)
	end

	if slot_0_8_0.improvements:GetValue():Get() then
		if slot_0_5_0.shutdown.improvements.quick_switch then
			slot_0_3_0.misc.grenades.quick_switch:GetValue():Set(slot_0_7_0.misc.quick_switch and slot_0_7_0.misc.quick_switch or false)
		end

		if slot_0_5_0.shutdown.improvements.mouse_sensitivity then
			game.engine:ClientCmd("sensitivity " .. (slot_0_7_0.main.sensitivity and slot_0_7_0.main.sensitivity or 1))
		end
	end

	if slot_0_7_0.main.peek_assist ~= Vector(0, 0, 0) then
		slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
		slot_0_3_0.misc.movement.slowwalk:GetValue():Set(slot_0_7_0.misc.slowwalk and slot_0_7_0.misc.slowwalk or false)
	end

	if slot_0_8_0.autostrafer:GetValue():Get() and slot_0_5_0.shutdown.autostrafer.stop_on_key_release then
		slot_0_3_0.misc.movement.slowwalk:GetValue():DisableHotkeys()
		slot_0_3_0.misc.movement.slowwalk:GetValue():Set(slot_0_7_0.misc.slowwalk and slot_0_7_0.misc.slowwalk or false)
	end

	if slot_0_8_0.grenade_prediction:GetValue():Get() and slot_0_5_0.shutdown.grenade_prediction.improve_color then
		slot_0_3_0.visuals.overlays.grenade_prediction.color.hit:GetValue():Set(slot_0_7_0.visuals.grenade_prediction.color.hit and slot_0_7_0.visuals.grenade_prediction.color.hit or draw.Color("#00ff0078"))
	end
end
